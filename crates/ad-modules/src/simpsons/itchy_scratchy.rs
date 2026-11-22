//! *Itchy & Scratchy* — 1994 *The Simpsons* After Dark 3.0 Module.
//!
//! "Deathtop"! Itchy proceeds to annihilate Scratchy all over your desktop
//! across **2,563 authentic `OFst/OFtb #9000..#9003` cartoon animation frames**,
//! complete with *The Itchy & Scratchy Show* MIDI theme (`cmid #50`), fake
//! desktop folders (`STR# #100`), and 17 authentic Itchy laughs, Scratchy
//! screams, blenders, splats, and explosions!

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use super::{
    CompoundAnim, KIND_STR_LIST, MOD_ITCHY_SCRATCHY, RlepBank, SND_BLENDER, SND_DETONATE,
    SND_ITCHY_HAHA, SND_ITCHY_HEHE, SND_ITCHY_WEEE, SND_PUNCH, SND_SCRATCHY_ACID,
    SND_SCRATCHY_BLND, SND_SCRATCHY_GULP, SND_SCRATCHY_HEY, SND_SCRATCHY_RPET, SND_SCRATCHY_SCRM,
    SND_SCRATCHY_STRT, SND_SCRATCHY_WHAT, SND_SCRATCHY_WOSH, SND_SHATTER, SND_SPLAT,
    SONG_ITCHY_SCRATCHY, SimpsonsPack, draw_rect_outline_px, fill_rect_px, music_loops_from_slider,
    parse_str_list,
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

pub struct ItchyScratchyModule {
    anim: Option<CompoundAnim>,
    props: RlepBank,
    folder_names: Vec<String>,
    saved_bg: Vec<u32>,
    frame_idx: usize,
    cam_x: f32,
    cam_y: f32,
    suspense: i32,
    tick: usize,
    scale: i32,
}

impl ItchyScratchyModule {
    pub fn new() -> Self {
        Self {
            anim: None,
            props: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            folder_names: Vec::new(),
            saved_bg: Vec::new(),
            frame_idx: 0,
            cam_x: 240.0,
            cam_y: 180.0,
            suspense: 37,
            tick: 0,
            scale: 1,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "simpsons_itchy_scratchy".to_string(),
            name: "Itchy & Scratchy".to_string(),
            credit: "By Matt Small and Tom Wuttke.\nSoftware © 1994 Berkeley Systems, Inc.\nThe Simpsons ™ & © Twentieth Century Fox.".to_string(),
            about: "Blood is a many splattered thing as Itchy proceeds to annihilate Scratchy all over your 'deathtop' across 2,563 animated cartoon frames — with The Itchy & Scratchy Show theme and screams!".to_string(),
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
            target_frame_ms: 58,
            filename: "ITCHYSCR.AD".to_string(),
        }
    }

    fn draw_deathtop(&mut self, surface: &mut ad_sdk::canvas::AdSurface) {
        let w = surface.width;
        let h = surface.height;

        if self.saved_bg.len() == surface.pixels().len() {
            // Check if saved_bg is pure black (headless test / cleared desktop); if so, draw classic Springfield Mac Deathtop!
            let has_bg_pixels = self.saved_bg.iter().step_by(97).any(|&p| (p & 0x00FF_FFFF) != 0);
            if has_bg_pixels {
                surface.pixels_mut().copy_from_slice(&self.saved_bg);
            } else {
                // Classic retro Mac desktop pattern + Mac window prop (#9042)
                let dst = surface.pixels_mut();
                for y in 0..h {
                    let row = (y * w) as usize;
                    for x in 0..w {
                        dst[row + x as usize] = if ((x ^ y) & 1) == 0 {
                            0x006C_7A92
                        } else {
                            0x0058_667E
                        };
                    }
                }
                // Classic white menu bar at top
                fill_rect_px(surface, 0, 0, w, 18, 0x00EC_EEF2);
                fill_rect_px(surface, 0, 18, w, 20, 0x0018_1820);
                // Mac folder icons along right edge using prop #9042
                if let Some(win_prop) = self.props.frames.get(2) {
                    win_prop.blit(surface, 18, 32);
                }
                for i in 0..4 {
                    let fx = w - 58;
                    let fy = 34 + i * 54;
                    if fy + 36 < h {
                        fill_rect_px(surface, fx, fy + 6, fx + 34, fy + 28, 0x00D8_C27A);
                        fill_rect_px(surface, fx + 2, fy + 2, fx + 16, fy + 6, 0x00D8_C27A);
                        draw_rect_outline_px(surface, fx, fy + 6, fx + 34, fy + 28, 0x0024_2018, 1);
                    }
                }
            }
        }

        let Some(anim) = &self.anim else {
            return;
        };
        if anim.frames.is_empty() {
            return;
        }
        let fi = self.frame_idx % anim.frames.len();
        let cf = &anim.frames[fi];

        // Smooth camera tracking with instant snap across skit cuts so all 2,563 frames stay framed!
        let target_cx = ((cf.left + cf.right) / 2 + cf.dx) as f32;
        let target_cy = ((cf.top + cf.bottom) / 2 + cf.dy) as f32;
        if (target_cx - self.cam_x).abs() > 140.0 || (target_cy - self.cam_y).abs() > 140.0 {
            self.cam_x = target_cx;
            self.cam_y = target_cy;
        } else {
            self.cam_x += (target_cx - self.cam_x) * 0.22;
            self.cam_y += (target_cy - self.cam_y) * 0.22;
        }

        let ox = w / 2 - (self.cam_x as i32) * self.scale;
        let oy = h / 2 - (self.cam_y as i32) * self.scale;
        anim.draw_stage_frame(surface, fi, ox, oy, self.scale);
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
            self.anim = Some(CompoundAnim::load(MOD_ITCHY_SCRATCHY, 9000));
            self.props = RlepBank::load(MOD_ITCHY_SCRATCHY, 9042);
            if let Some(raw) = SimpsonsPack::global().get(MOD_ITCHY_SCRATCHY, KIND_STR_LIST, 100) {
                self.folder_names = parse_str_list(raw);
            }
        }
        self.saved_bg = ctx.surface.pixels().to_vec();
        self.suspense = ctx.module.raw_control_value[0].clamp(0, 100);
        self.scale = if ctx.surface.width >= 1000 && ctx.surface.height >= 640 {
            2
        } else {
            1
        };

        let total = self.anim.as_ref().map(|a| a.frames.len()).unwrap_or(1).max(1);
        let skit_starts = [0usize, 320, 740, 1180, 1620, 2050];
        self.frame_idx = skit_starts[ctx.rng.rand_mod(skit_starts.len() as i32) as usize] % total;
        if let Some(cf) = self.anim.as_ref().and_then(|a| a.frames.get(self.frame_idx)) {
            self.cam_x = ((cf.left + cf.right) / 2 + cf.dx) as f32;
            self.cam_y = ((cf.top + cf.bottom) / 2 + cf.dy) as f32;
        }
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

        // Suspense slider controls pacing (Insta-Death = snappy 2x, Slow Death = deliberate)
        let advance = if self.suspense < 25 {
            2
        } else if self.suspense < 75 {
            1
        } else if self.tick % 2 == 0 {
            1
        } else {
            0
        };

        if let Some(anim) = &self.anim {
            if !anim.frames.is_empty() {
                self.frame_idx = (self.frame_idx + advance) % anim.frames.len();
            }
        }

        // Periodic Itchy laughs, Scratchy screams, & cartoon mayhem SFX
        if self.tick % 56 == 24 {
            let clip = match ctx.rng.rand_mod(10) {
                0..=2 => ITCHY_CLIPS[ctx.rng.rand_mod(ITCHY_CLIPS.len() as i32) as usize],
                3..=6 => SCRATCHY_CLIPS[ctx.rng.rand_mod(SCRATCHY_CLIPS.len() as i32) as usize],
                _ => MAYHEM_SFX[ctx.rng.rand_mod(MAYHEM_SFX.len() as i32) as usize],
            };
            pack.play_voice(ctx.sound, ctx.system.sound_enabled, clip);
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
