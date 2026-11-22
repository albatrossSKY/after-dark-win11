//! *Grampa's Wisdom* — 1994 *The Simpsons* After Dark 3.0 Module.
//!
//! Grampa Simpson sits in his purple armchair recounting rambling wisdom from
//! the summer of '26 (all 21 authentic digitized Grampa voice clips + snoring),
//! nodding off into dream-cloud naps (complete with optional drool!) driven by
//! the authentic 80-frame `OFst/OFtb #1000` compound animation set.

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use super::{
    CompoundAnim, GRAMPA_VOICE_IDS, MOD_GRAMPA, SND_CHAIR_CREAK, SND_GRAMPA_SLEEP,
    SND_GRAMPA_SNORE, SND_THOUGHT_BALLOON, SONG_GRAMPA, SimpsonsPack, fill_circle_px,
    restore_or_clear,
};

#[derive(Clone, Copy, PartialEq, Eq)]
enum GrampaMode {
    Talking,
    Excited,
    NoddingOff,
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
    frame_idx: usize,
    tick: usize,
    drool_len: i32,
    chair_x_off: i32,
    chair_y_off: i32,
    scale: i32,
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
            frame_idx: 0,
            tick: 0,
            drool_len: 0,
            chair_x_off: 0,
            chair_y_off: 0,
            scale: 1,
        }
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

        self.scale = if ctx.surface.width >= 900 && ctx.surface.height >= 640 {
            2
        } else {
            1
        };
        // Anchor stage center (328, 224) at screen center
        self.chair_x_off = ctx.surface.width / 2 - 328 * self.scale;
        self.chair_y_off = ctx.surface.height / 2 - 224 * self.scale;

        self.mode = GrampaMode::Talking;
        self.mode_ticks = 0;
        self.frame_idx = 0;
        self.tick = 0;
        self.drool_len = 0;

        let pack = SimpsonsPack::global();
        pack.play_music(ctx.sound, ctx.system.sound_enabled, SONG_GRAMPA, 1);
        let first_clip = GRAMPA_VOICE_IDS[ctx.rng.rand_mod(GRAMPA_VOICE_IDS.len() as i32) as usize];
        pack.play_voice(ctx.sound, ctx.system.sound_enabled, first_clip);

        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        restore_or_clear(ctx.surface, &self.saved_bg, self.clear_screen, 0x0010_0E1C);
        if let Some(anim) = &self.anim {
            anim.draw_stage_frame(ctx.surface, 0, self.chair_x_off, self.chair_y_off, self.scale);
        }
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.tick = self.tick.wrapping_add(1);
        self.mode_ticks += 1;
        let pack = SimpsonsPack::global();

        let sleep_threshold = (110 - (self.drowsiness * 85) / 100).max(20) as usize;

        match self.mode {
            GrampaMode::Talking => {
                // Cycle authentic upright talking/gesturing frames 0..51
                self.frame_idx = (self.tick / 2) % 51;
                if self.mode_ticks % 28 == 0 {
                    let clip = GRAMPA_VOICE_IDS
                        [ctx.rng.rand_mod(GRAMPA_VOICE_IDS.len() as i32) as usize];
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, clip);
                }
                if self.mode_ticks >= sleep_threshold {
                    self.mode_ticks = 0;
                    if ctx.rng.rand_mod(100) < 35 && self.drowsiness < 70 {
                        self.mode = GrampaMode::Excited;
                        pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_CHAIR_CREAK);
                    } else {
                        self.mode = GrampaMode::NoddingOff;
                        pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_GRAMPA_SLEEP);
                    }
                }
            }
            GrampaMode::Excited => {
                // Leaning forward excitedly gesturing (frames 56..71)
                self.frame_idx = 56 + ((self.tick / 2) % 15);
                if self.mode_ticks % 22 == 0 {
                    let clip = GRAMPA_VOICE_IDS
                        [ctx.rng.rand_mod(GRAMPA_VOICE_IDS.len() as i32) as usize];
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, clip);
                }
                if self.mode_ticks >= 36 {
                    self.mode = GrampaMode::NoddingOff;
                    self.mode_ticks = 0;
                }
            }
            GrampaMode::NoddingOff => {
                // Transition frames 52..55 (reclining + thought balloon appearing!)
                self.frame_idx = 52 + ((self.mode_ticks / 3).min(3));
                if self.mode_ticks == 4 {
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_THOUGHT_BALLOON);
                }
                if self.mode_ticks >= 14 {
                    self.mode = GrampaMode::Sleeping;
                    self.mode_ticks = 0;
                    self.drool_len = 0;
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_GRAMPA_SNORE);
                }
            }
            GrampaMode::Sleeping => {
                // Slumped asleep with dream cloud & gentle breathing (frames 72..79)
                self.frame_idx = 72 + ((self.tick / 4) % 8);
                if self.drool_enabled && self.drool_len < 22 * self.scale {
                    self.drool_len += 1;
                }
                if self.mode_ticks % 34 == 0 {
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_GRAMPA_SNORE);
                }
                let nap_dur = (35 + (self.drowsiness * 65) / 100) as usize;
                if self.mode_ticks >= nap_dur {
                    self.mode = GrampaMode::Talking;
                    self.mode_ticks = 0;
                    self.drool_len = 0;
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_CHAIR_CREAK);
                }
            }
        }

        restore_or_clear(ctx.surface, &self.saved_bg, self.clear_screen, 0x0010_0E1C);

        if let Some(anim) = &self.anim {
            let fi = self.frame_idx.min(anim.frames.len().saturating_sub(1));
            anim.draw_stage_frame(ctx.surface, fi, self.chair_x_off, self.chair_y_off, self.scale);

            // Animated silver-blue drool drip when sleeping and Drool checkbox is enabled
            if self.mode == GrampaMode::Sleeping && self.drool_enabled && self.drool_len > 2 {
                let dx = self.chair_x_off + 332 * self.scale;
                let dy = self.chair_y_off + 216 * self.scale;
                for i in 0..self.drool_len {
                    fill_circle_px(ctx.surface, dx, dy + i, self.scale.max(1), 0x00B8_E6FF);
                }
                fill_circle_px(
                    ctx.surface,
                    dx,
                    dy + self.drool_len,
                    (self.scale + 1).max(2),
                    0x00D8_F4FF,
                );
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
