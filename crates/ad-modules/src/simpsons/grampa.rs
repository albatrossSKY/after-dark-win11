//! *Grampa's Wisdom* — 1994 *The Simpsons* After Dark 3.0 Module.
//!
//! Grampa Simpson sits in his purple armchair recounting rambling wisdom from
//! the summer of '26 (all 21 authentic digitized Grampa voice clips + snoring),
//! standing up to shout, reclining back, and nodding off onto a dream cloud with
//! chattering dentures & optional drool — driven by exact verified `OFst/OFtb #1000`
//! animation runs!

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use super::{
    CompoundAnim, GRAMPA_VOICE_IDS, MOD_GRAMPA, SND_CHAIR_CREAK, SND_GRAMPA_SLEEP,
    SND_GRAMPA_SNORE, SND_THOUGHT_BALLOON, SONG_GRAMPA, SimpsonsPack, fill_circle_px,
    fill_rect_px, restore_or_clear,
};

/// Verified upright sitting/talking gesture runs (`OFst #1000` R00..R08):
const TALK_RUNS: &[(usize, usize)] = &[
    (0, 4),   // R00: idle talking
    (6, 12),  // R02: open-palm gesture
    (13, 19), // R03: leaning & mumbling
    (20, 24), // R04: gesturing outward
    (25, 28), // R05: waving hand excitedly
    (29, 34), // R06: waving & nodding
    (35, 39), // R07: belly/chest gesture
    (40, 47), // R08: scratching chest
];

/// Standing-up shouting gesture runs (`R11..R13`):
const STAND_RUNS: &[(usize, usize)] = &[(57, 59), (60, 62), (63, 65)];

#[derive(Clone, Copy, PartialEq, Eq)]
enum GrampaMode {
    Talking,
    StandingUp,
    StandingTalk,
    SittingDown,
    Reclining,
    Sleeping,
}

pub struct GrampaModule {
    anim: Option<CompoundAnim>,
    saved_bg: Vec<u32>,
    clear_screen: bool,
    drool_enabled: bool,
    drowsiness: i32,
    mode: GrampaMode,
    mode_ticks: usize,
    run_idx: usize,
    run_step: usize,
    frame_idx: usize,
    tick: usize,
    drool_len: f32,
    chair_x_off: i32,
    chair_y_off: i32,
    scale_f: f32,
}

impl GrampaModule {
    pub fn new() -> Self {
        Self {
            anim: None,
            saved_bg: Vec::new(),
            clear_screen: true,
            drool_enabled: true,
            drowsiness: 30,
            mode: GrampaMode::Talking,
            mode_ticks: 0,
            run_idx: 0,
            run_step: 0,
            frame_idx: 0,
            tick: 0,
            drool_len: 0.0,
            chair_x_off: 0,
            chair_y_off: 0,
            scale_f: 1.5,
        }
    }

    fn draw_parlor_or_desktop(&self, surface: &mut ad_sdk::canvas::AdSurface) {
        if !self.clear_screen && self.saved_bg.len() == surface.pixels().len() {
            restore_or_clear(surface, &self.saved_bg, false, 0x0010_0E1C);
            return;
        }
        let w = surface.width;
        let h = surface.height;
        let floor_y = (h as f32 * 0.72) as i32;
        let rail_y = (h as f32 * 0.56) as i32;
        let cx = w as f32 * 0.5;
        let lamp_y = h as f32 * 0.42;
        let lamp_rx = (w as f32 * 0.36).max(120.0);
        let lamp_ry = (h as f32 * 0.48).max(120.0);
        let stripe_w = (w / 32).max(16);

        let dst = surface.pixels_mut();
        for y in 0..h {
            let row = (y * w) as usize;
            let dy = (y as f32 - lamp_y) / lamp_ry;
            let dy2 = dy * dy;
            for x in 0..w {
                let dx = (x as f32 - cx) / lamp_rx;
                let glow = (1.0 - (dx * dx + dy2)).clamp(0.0, 1.0);
                let g2 = glow * glow;
                let (br, bg, bb) = if y < rail_y {
                    let stripe = if (x / stripe_w) & 1 == 0 { 6.0 } else { 0.0 };
                    (36.0 + stripe, 30.0 + stripe * 0.7, 48.0 + stripe * 0.8)
                } else if y < floor_y {
                    let panel = if (x % (stripe_w * 2)) < 3 { -8.0 } else { 0.0 };
                    (46.0 + panel, 30.0 + panel * 0.6, 20.0 + panel * 0.5)
                } else {
                    let rx = (x as f32 - cx) / (w as f32 * 0.24).max(80.0);
                    let ry = (y as f32 - (h as f32 * 0.83)) / (h as f32 * 0.13).max(24.0);
                    let r2 = rx * rx + ry * ry;
                    if r2 < 1.0 {
                        let ring = if ((r2 * 10.0) as i32 & 1) == 0 {
                            10.0
                        } else {
                            -4.0
                        };
                        (68.0 + ring, 34.0 + ring * 0.5, 42.0 + ring * 0.6)
                    } else {
                        let plank = if ((y - floor_y) % ((h / 28).max(6))) == 0 {
                            -10.0
                        } else {
                            0.0
                        };
                        (54.0 + plank, 36.0 + plank * 0.6, 22.0 + plank * 0.4)
                    }
                };
                let r = (br + g2 * 56.0).clamp(0.0, 255.0) as u32;
                let g = (bg + g2 * 44.0).clamp(0.0, 255.0) as u32;
                let b = (bb + g2 * 24.0).clamp(0.0, 255.0) as u32;
                dst[row + x as usize] = (r << 16) | (g << 8) | b;
            }
        }
        let trim_h = (4.0 * self.scale_f).round().max(2.0) as i32;
        fill_rect_px(surface, 0, rail_y - trim_h, w, rail_y + trim_h / 2, 0x0052_3622);
        fill_rect_px(surface, 0, floor_y - trim_h, w, floor_y + 1, 0x003A_2416);
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "simpsons_grampa".to_string(),
            name: "Grampa's Wisdom".to_string(),
            credit: "By Gabriel Jensen and Ben Resner.\nSoftware © 1994 Berkeley Systems, Inc.\nThe Simpsons ™ & © Twentieth Century Fox.".to_string(),
            about: "Sit back as Grampa Simpson recounts what happened in the summer of '26, or was it last Monday? In any case, the wisdom of the ages is now yours — turn up your sound!".to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "Drowsiness:".to_string(),
                    default_raw: 30,
                    labels: vec![
                        "Caffeinated".into(),
                        "Alert".into(),
                        "Drowsy".into(),
                        "Sedated".into(),
                        "Brain Dead".into(),
                    ],
                    thresholds: vec![0, 20, 40, 60, 80],
                },
                AdControl::Checkbox {
                    title: "Drool".to_string(),
                    default_checked: true,
                },
                AdControl::Checkbox {
                    title: "Clear Screen First".to_string(),
                    default_checked: true,
                },
                AdControl::None,
            ],
            target_frame_ms: 95,
            filename: "GRAMPA.AD".to_string(),
        }
    }
}

impl Default for GrampaModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for GrampaModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        if self.anim.is_none() {
            self.anim = Some(CompoundAnim::load(MOD_GRAMPA, 1000));
        }
        self.saved_bg = ctx.surface.pixels().to_vec();
        self.drowsiness = ctx.module.raw_control_value[0].clamp(0, 100);
        self.drool_enabled = ctx.module.raw_control_value[1] != 0;
        self.clear_screen = ctx.module.raw_control_value[2] != 0;

        self.scale_f = (ctx.surface.height as f32 / 330.0).clamp(1.1, 4.2);
        // Anchor stage center (328, 228) cleanly in the parlor so sitting/standing/cloud never jump!
        self.chair_x_off = ctx.surface.width / 2 - (328.0 * self.scale_f).round() as i32;
        self.chair_y_off = (ctx.surface.height as f32 * 0.54).round() as i32
            - (228.0 * self.scale_f).round() as i32;

        self.mode = GrampaMode::Talking;
        self.mode_ticks = 0;
        self.run_idx = 0;
        self.run_step = 0;
        self.frame_idx = 0;
        self.tick = 0;
        self.drool_len = 0.0;

        let pack = SimpsonsPack::global();
        pack.play_music(ctx.sound, ctx.system.sound_enabled, SONG_GRAMPA, 1);
        let first_clip = GRAMPA_VOICE_IDS[ctx.rng.rand_mod(GRAMPA_VOICE_IDS.len() as i32) as usize];
        pack.play_voice(ctx.sound, ctx.system.sound_enabled, first_clip);

        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.draw_parlor_or_desktop(ctx.surface);
        if let Some(anim) = &self.anim {
            anim.draw_stage_frame_f(
                ctx.surface,
                0,
                self.chair_x_off as f32,
                self.chair_y_off as f32,
                self.scale_f,
                false,
                false,
            );
        }
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.tick = self.tick.wrapping_add(1);
        self.mode_ticks += 1;
        let pack = SimpsonsPack::global();

        let sleep_threshold = (110 - (self.drowsiness * 85) / 100).max(24) as usize;

        match self.mode {
            GrampaMode::Talking => {
                // Play complete, smooth upright gesture runs (R00..R08, frames 0..47) — NEVER touching R09!
                let (a, b) = TALK_RUNS[self.run_idx % TALK_RUNS.len()];
                let len = b - a + 1;
                self.frame_idx = a + (self.run_step % len);
                if self.tick % 2 == 0 {
                    self.run_step += 1;
                    if self.run_step >= len {
                        self.run_step = 0;
                        self.run_idx = ctx.rng.rand_mod(TALK_RUNS.len() as i32) as usize;
                    }
                }
                if self.mode_ticks % 28 == 0 {
                    let clip = GRAMPA_VOICE_IDS
                        [ctx.rng.rand_mod(GRAMPA_VOICE_IDS.len() as i32) as usize];
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, clip);
                }
                if self.mode_ticks >= sleep_threshold {
                    self.mode_ticks = 0;
                    self.run_step = 0;
                    if ctx.rng.rand_mod(100) < 38 && self.drowsiness < 75 {
                        self.mode = GrampaMode::StandingUp;
                        pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_CHAIR_CREAK);
                    } else {
                        self.mode = GrampaMode::Reclining;
                        pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_GRAMPA_SLEEP);
                    }
                }
            }
            GrampaMode::StandingUp => {
                // Smooth stand-up transition R10 (frames 53..=56)
                let step = (self.mode_ticks / 2).min(3);
                self.frame_idx = 53 + step;
                if self.mode_ticks >= 8 {
                    self.mode = GrampaMode::StandingTalk;
                    self.mode_ticks = 0;
                    self.run_idx = 0;
                    self.run_step = 0;
                    let clip = GRAMPA_VOICE_IDS
                        [ctx.rng.rand_mod(GRAMPA_VOICE_IDS.len() as i32) as usize];
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, clip);
                }
            }
            GrampaMode::StandingTalk => {
                // Shouting / lecturing standing up (R11..R13, frames 57..=65)
                let (a, b) = STAND_RUNS[self.run_idx % STAND_RUNS.len()];
                let len = b - a + 1;
                self.frame_idx = a + (self.run_step % len);
                if self.tick % 2 == 0 {
                    self.run_step += 1;
                    if self.run_step >= len {
                        self.run_step = 0;
                        self.run_idx = (self.run_idx + 1) % STAND_RUNS.len();
                    }
                }
                if self.mode_ticks >= 28 {
                    self.mode = GrampaMode::SittingDown;
                    self.mode_ticks = 0;
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_CHAIR_CREAK);
                }
            }
            GrampaMode::SittingDown => {
                // Sitting back down into chair R14 (frames 66..=68)
                let step = (self.mode_ticks / 2).min(2);
                self.frame_idx = 66 + step;
                if self.mode_ticks >= 6 {
                    self.mode = GrampaMode::Reclining;
                    self.mode_ticks = 0;
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_GRAMPA_SLEEP);
                }
            }
            GrampaMode::Reclining => {
                // Reclining chair back + kicking footrest up R09 (frames 48..=52)
                let step = (self.mode_ticks / 2).min(4);
                self.frame_idx = 48 + step;
                if self.mode_ticks == 6 {
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_THOUGHT_BALLOON);
                }
                if self.mode_ticks >= 12 {
                    self.mode = GrampaMode::Sleeping;
                    self.mode_ticks = 0;
                    self.drool_len = 0.0;
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_GRAMPA_SNORE);
                }
            }
            GrampaMode::Sleeping => {
                // Floating asleep on dream cloud with chattering dentures (R15..R18, frames 69..=79)
                const SLEEP_SEQ: [usize; 12] = [69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 76];
                self.frame_idx = SLEEP_SEQ[(self.tick / 3) % SLEEP_SEQ.len()];
                if self.drool_enabled && self.drool_len < 20.0 * self.scale_f {
                    self.drool_len += self.scale_f * 0.65;
                }
                if self.mode_ticks % 34 == 0 {
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_GRAMPA_SNORE);
                }
                let nap_dur = (40 + (self.drowsiness * 65) / 100) as usize;
                if self.mode_ticks >= nap_dur {
                    self.mode = GrampaMode::Talking;
                    self.mode_ticks = 0;
                    self.run_idx = 0;
                    self.run_step = 0;
                    self.drool_len = 0.0;
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_CHAIR_CREAK);
                }
            }
        }

        self.draw_parlor_or_desktop(ctx.surface);

        if let Some(anim) = &self.anim {
            let fi = self.frame_idx.min(anim.frames.len().saturating_sub(1));
            anim.draw_stage_frame_f(
                ctx.surface,
                fi,
                self.chair_x_off as f32,
                self.chair_y_off as f32,
                self.scale_f,
                false,
                false,
            );

            // Animated silver-blue drool drip right from reclined Grampa's mouth!
            let dlen = self.drool_len.round() as i32;
            if self.mode == GrampaMode::Sleeping && self.drool_enabled && dlen > 2 {
                let dx = self.chair_x_off + (304.0 * self.scale_f).round() as i32;
                let dy = self.chair_y_off + (212.0 * self.scale_f).round() as i32;
                let dr = self.scale_f.round().max(1.0) as i32;
                for i in 0..dlen {
                    fill_circle_px(ctx.surface, dx, dy + i, dr, 0x00B8_E6FF);
                }
                fill_circle_px(ctx.surface, dx, dy + dlen, dr + 1, 0x00D8_F4FF);
            }
        }

        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        self.saved_bg.clear();
        AdResult::NoError
    }
}
