//! *Itchy & Scratchy* — 1994 *The Simpsons* After Dark 3.0 Module.
//!
//! "Deathtop"! Itchy proceeds to annihilate Scratchy all over your desktop
//! across authentic curated multi-frame `OFst/OFtb #9000..#9003` cartoon mayhem
//! skits (skipping 2-frame static gore fragments & calibration loops), with a
//! rock-steady skit-centered stage camera, *The Itchy & Scratchy Show* MIDI
//! theme (`cmid #50`), and 17 authentic Itchy laughs, Scratchy screams, blenders,
//! splats, and explosions!

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use super::{
    CompoundAnim, KIND_STR_LIST, MOD_ITCHY_SCRATCHY, RlepBank, SND_BLENDER, SND_DETONATE,
    SND_ITCHY_HAHA, SND_ITCHY_HEHE, SND_ITCHY_WEEE, SND_PUNCH, SND_SCRATCHY_ACID,
    SND_SCRATCHY_BLND, SND_SCRATCHY_GULP, SND_SCRATCHY_HEY, SND_SCRATCHY_RPET, SND_SCRATCHY_SCRM,
    SND_SCRATCHY_STRT, SND_SCRATCHY_WHAT, SND_SCRATCHY_WOSH, SND_SHATTER, SND_SPLAT,
    SONG_ITCHY_SCRATCHY, SimpsonsPack, fill_rect_px, music_loops_from_slider, parse_str_list,
};

const ITCHY_CLIPS: &[i16] = &[SND_ITCHY_HAHA, SND_ITCHY_HEHE, SND_ITCHY_WEEE];

const SCRATCHY_CLIPS: &[i16] = &[
    SND_SCRATCHY_SCRM,
    SND_SCRATCHY_HEY,
    SND_SCRATCHY_WHAT,
    SND_SCRATCHY_BLND,
    SND_SCRATCHY_ACID,
    SND_SCRATCHY_GULP,
    SND_SCRATCHY_WOSH,
    SND_SCRATCHY_RPET,
    SND_SCRATCHY_STRT,
];

const MAYHEM_SFX: &[i16] = &[SND_BLENDER, SND_SPLAT, SND_PUNCH, SND_DETONATE, SND_SHATTER];

#[derive(Clone, Copy)]
struct SkitRun {
    start: usize,
    end: usize,
    stage_cx: f32,
    stage_cy: f32,
}

fn extract_mayhem_skits(anim: &CompoundAnim) -> Vec<SkitRun> {
    let mut runs = Vec::new();
    if anim.frames.is_empty() {
        return runs;
    }
    let mut s = 0usize;
    let push_if_skit = |runs: &mut Vec<SkitRun>, a: usize, b: usize| {
        let len = b - a + 1;
        // Full two-character Itchy & Scratchy cartoon mayhem skits start at idx >= 523
        // (skipping solo calibration runs 0..504 and 2-frame static prop pieces 505..522!)
        if a >= 523 && len >= 18 {
            let mut sum_x = 0.0f64;
            let mut sum_y = 0.0f64;
            for f in &anim.frames[a..=b] {
                sum_x += ((f.left + f.right) as f64 * 0.5) + f.dx as f64;
                sum_y += ((f.top + f.bottom) as f64 * 0.5) + f.dy as f64;
            }
            runs.push(SkitRun {
                start: a,
                end: b,
                stage_cx: (sum_x / len as f64) as f32,
                stage_cy: (sum_y / len as f64) as f32,
            });
        }
    };
    for i in 1..anim.frames.len() {
        if anim.frames[i].fid > anim.frames[i - 1].fid + 1 {
            push_if_skit(&mut runs, s, i - 1);
            s = i;
        }
    }
    push_if_skit(&mut runs, s, anim.frames.len() - 1);
    runs
}

pub struct ItchyScratchyModule {
    anim: Option<CompoundAnim>,
    skits: Vec<SkitRun>,
    props: RlepBank,
    folder_names: Vec<String>,
    saved_bg: Vec<u32>,
    skit_idx: usize,
    skit_offset: usize,
    hold_end_ticks: usize,
    suspense: i32,
    tick: usize,
    scale_f: f32,
}

impl ItchyScratchyModule {
    pub fn new() -> Self {
        Self {
            anim: None,
            skits: Vec::new(),
            props: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            folder_names: Vec::new(),
            saved_bg: Vec::new(),
            skit_idx: 0,
            skit_offset: 0,
            hold_end_ticks: 0,
            suspense: 37,
            tick: 0,
            scale_f: 1.5,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "simpsons_itchy_scratchy".to_string(),
            name: "Itchy & Scratchy".to_string(),
            credit: "By Matt Small and Tom Wuttke.\nSoftware © 1994 Berkeley Systems, Inc.\nThe Simpsons ™ & © Twentieth Century Fox.".to_string(),
            about: "Blood is a many splattered thing as Itchy proceeds to annihilate Scratchy all over your 'deathtop' across curated animated cartoon skits — with The Itchy & Scratchy Show theme and screams!".to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "Suspense:".to_string(),
                    default_raw: 37,
                    labels: vec![
                        "Insta-Death".into(),
                        "More Gore".into(),
                        "Less Gore".into(),
                        "Slow Death".into(),
                    ],
                    thresholds: vec![0, 25, 50, 75],
                },
                AdControl::LabeledSlider {
                    title: "Music:".to_string(),
                    default_raw: 30,
                    labels: vec![
                        "Never".into(),
                        "Once".into(),
                        "Twice".into(),
                        "Thrice".into(),
                        "Always".into(),
                    ],
                    thresholds: vec![0, 20, 40, 60, 80],
                },
                AdControl::None,
                AdControl::None,
            ],
            target_frame_ms: 62,
            filename: "ITCHYSCR.AD".to_string(),
        }
    }

    fn draw_deathtop(&mut self, surface: &mut ad_sdk::canvas::AdSurface) {
        let w = surface.width;
        let h = surface.height;

        if self.saved_bg.len() == surface.pixels().len() {
            let has_bg_pixels = self.saved_bg.iter().step_by(97).any(|&p| (p & 0x00FF_FFFF) != 0);
            if has_bg_pixels {
                surface.pixels_mut().copy_from_slice(&self.saved_bg);
            } else {
                let floor_y = (h as f32 * 0.72) as i32;
                let dst = surface.pixels_mut();
                for y in 0..h {
                    let row = (y * w) as usize;
                    let col = if y < floor_y {
                        let t = y as f32 / floor_y.max(1) as f32;
                        let r = (28.0 + t * 22.0) as u32;
                        let g = (42.0 + t * 28.0) as u32;
                        let b = (70.0 + t * 34.0) as u32;
                        (r << 16) | (g << 8) | b
                    } else {
                        let t = (y - floor_y) as f32 / (h - floor_y).max(1) as f32;
                        let r = (54.0 + t * 18.0) as u32;
                        let g = (48.0 + t * 16.0) as u32;
                        let b = (62.0 + t * 18.0) as u32;
                        (r << 16) | (g << 8) | b
                    };
                    dst[row..row + w as usize].fill(col);
                }
                fill_rect_px(surface, 0, floor_y - 2, w, floor_y + 2, 0x0024_2836);
            }
        }

        let Some(anim) = &self.anim else {
            return;
        };
        let Some(skit) = self.skits.get(self.skit_idx) else {
            return;
        };
        let fi = (skit.start + self.skit_offset).min(skit.end);

        // Rock-steady skit-centered camera so explosions & chases NEVER shake the entire stage!
        let ox = w as f32 * 0.5 - skit.stage_cx * self.scale_f;
        let oy = h as f32 * 0.54 - skit.stage_cy * self.scale_f;
        anim.draw_stage_frame_f(surface, fi, ox, oy, self.scale_f, false, false);
    }
}

impl Default for ItchyScratchyModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for ItchyScratchyModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        if self.anim.is_none() {
            let loaded = CompoundAnim::load(MOD_ITCHY_SCRATCHY, 9000);
            self.skits = extract_mayhem_skits(&loaded);
            self.anim = Some(loaded);
            self.props = RlepBank::load(MOD_ITCHY_SCRATCHY, 9042);
            if let Some(raw) = SimpsonsPack::global().get(MOD_ITCHY_SCRATCHY, KIND_STR_LIST, 100) {
                self.folder_names = parse_str_list(raw);
            }
        }
        self.saved_bg = ctx.surface.pixels().to_vec();
        self.suspense = ctx.module.raw_control_value[0].clamp(0, 100);
        self.scale_f = (ctx.surface.height as f32 / 340.0).clamp(1.1, 3.8);

        if !self.skits.is_empty() {
            self.skit_idx = ctx.rng.rand_mod(self.skits.len() as i32) as usize;
        } else {
            self.skit_idx = 0;
        }
        self.skit_offset = 0;
        self.hold_end_ticks = 0;
        self.tick = 0;

        if let Some(loops) = music_loops_from_slider(ctx.module.raw_control_value[1]) {
            SimpsonsPack::global().play_music(
                ctx.sound,
                ctx.system.sound_enabled,
                SONG_ITCHY_SCRATCHY,
                loops,
            );
        }

        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.draw_deathtop(ctx.surface);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.tick = self.tick.wrapping_add(1);
        let pack = SimpsonsPack::global();

        // Suspense slider controls pacing cleanly (Insta-Death = crisp 1x, Slow Death = deliberate)
        let step_now = if self.suspense < 35 {
            true
        } else if self.suspense < 75 {
            self.tick % 3 != 0
        } else {
            self.tick % 2 == 0
        };

        if let Some(skit) = self.skits.get(self.skit_idx).copied() {
            let skit_len = skit.end - skit.start + 1;
            if self.hold_end_ticks > 0 {
                self.hold_end_ticks -= 1;
                if self.hold_end_ticks == 0 && !self.skits.is_empty() {
                    let next = ctx.rng.rand_mod(self.skits.len() as i32) as usize;
                    self.skit_idx = if next == self.skit_idx && self.skits.len() > 1 {
                        (next + 1) % self.skits.len()
                    } else {
                        next
                    };
                    self.skit_offset = 0;
                    let laugh = ITCHY_CLIPS[ctx.rng.rand_mod(ITCHY_CLIPS.len() as i32) as usize];
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, laugh);
                }
            } else if step_now {
                if self.skit_offset + 1 >= skit_len {
                    self.hold_end_ticks = 8;
                    let mayhem = MAYHEM_SFX[ctx.rng.rand_mod(MAYHEM_SFX.len() as i32) as usize];
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, mayhem);
                } else {
                    self.skit_offset += 1;
                    if self.skit_offset == skit_len / 2 {
                        let scrm =
                            SCRATCHY_CLIPS[ctx.rng.rand_mod(SCRATCHY_CLIPS.len() as i32) as usize];
                        pack.play_voice(ctx.sound, ctx.system.sound_enabled, scrm);
                    }
                }
            }
        }

        self.draw_deathtop(ctx.surface);
        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        self.saved_bg.clear();
        AdResult::NoError
    }
}
