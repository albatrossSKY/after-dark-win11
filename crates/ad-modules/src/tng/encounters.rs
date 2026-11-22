//! *Encounters* — 1994 *Star Trek: The Next Generation* After Dark 3.0 Module.
//!
//! Join Captain Picard, Commander Riker, Lieutenant Worf, and Q on the Main
//! Bridge of the U.S.S. Enterprise-D across **2,580 authentic `OFst/OFtb #1000`
//! animation frames** covering 7 classic TNG episodes (*The Game*, *Parallels*,
//! *Tin Man*, *Darmok*, *Crystal Dude*, *Farpoint*, *Quality of Life*) with
//! 28 authentic digitized cast voice clips!

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::simpsons::{CompoundAnim, draw_bitmap_text, fill_rect_px, put_px};
use super::{
    FONT_LCARS_14, MOD_ENCOUNTERS, SND_PICARD_ANY_IDEA, SND_PICARD_ENLARGE, SND_PICARD_IAM,
    SND_PICARD_IMPULSE, SND_PICARD_INTERCEPT, SND_PICARD_INVESTIGATE, SND_PICARD_MAKE_IT_SO,
    SND_PICARD_NO_AMUSING, SND_PICARD_NOT_GOOD, SND_PICARD_ONSCREEN, SND_PICARD_OUTTHINK,
    SND_PICARD_POWER, SND_PICARD_STAY_CALM, SND_PICARD_STRANGE, SND_PICARD_WHATS_GOING,
    SND_Q_ANOMALY, SND_Q_DANGEROUS, SND_Q_FOOLISH, SND_Q_MACROHEAD, SND_Q_OH_PLEASE,
    SND_RIKER_DONT_KNOW, SND_RIKER_IMPULSE, SND_RIKER_NORMAL, SND_RIKER_NOT_SURE,
    SND_RIKER_OPINION, SND_RIKER_RELAX, SND_RIKER_SHOULDNT, SND_RIKER_WHAT_HELL, SND_VIEWSCREEN,
    SND_WORF_DONT_LIKE, SND_WORF_INTERVENE, SND_WORF_NO_RESP, SND_WORF_UNUSUAL, SND_WORF_WHAT_THAT,
    SONG_TNG_TAG, load_anim, load_lcars_font, tng_pack,
};

const ENCOUNTER_NAMES: [&str; 7] = [
    "THE GAME",
    "PARALLELS",
    "TIN MAN",
    "DARMOK",
    "CRYSTAL DUDE",
    "FARPOINT",
    "QUALITY OF LIFE",
];

const ENCOUNTER_STARTS: [usize; 7] = [0, 360, 740, 1120, 1480, 1840, 2180];

const PICARD_LINES: &[i16] = &[
    SND_PICARD_ONSCREEN,
    SND_PICARD_MAKE_IT_SO,
    SND_PICARD_INVESTIGATE,
    SND_PICARD_STRANGE,
    SND_PICARD_WHATS_GOING,
    SND_PICARD_ENLARGE,
    SND_PICARD_STAY_CALM,
    SND_PICARD_INTERCEPT,
    SND_PICARD_ANY_IDEA,
    SND_PICARD_IMPULSE,
    SND_PICARD_IAM,
    SND_PICARD_POWER,
    SND_PICARD_NO_AMUSING,
    SND_PICARD_NOT_GOOD,
    SND_PICARD_OUTTHINK,
];

const RIKER_LINES: &[i16] = &[
    SND_RIKER_WHAT_HELL,
    SND_RIKER_NOT_SURE,
    SND_RIKER_DONT_KNOW,
    SND_RIKER_IMPULSE,
    SND_RIKER_OPINION,
    SND_RIKER_SHOULDNT,
    SND_RIKER_NORMAL,
    SND_RIKER_RELAX,
];

const WORF_LINES: &[i16] = &[
    SND_WORF_UNUSUAL,
    SND_WORF_WHAT_THAT,
    SND_WORF_DONT_LIKE,
    SND_WORF_INTERVENE,
    SND_WORF_NO_RESP,
];

const Q_LINES: &[i16] = &[
    SND_Q_ANOMALY,
    SND_Q_MACROHEAD,
    SND_Q_OH_PLEASE,
    SND_Q_DANGEROUS,
    SND_Q_FOOLISH,
];

pub struct EncountersModule {
    anim: Option<CompoundAnim>,
    font: crate::simpsons::RlepBank,
    stars: Vec<(i32, i32, u32)>,
    encounter_setting: i32, // 0=Random, 1..=7 specific encounter
    active_encounter: usize,
    frame_idx: usize,
    cam_x: f32,
    cam_y: f32,
    tick: usize,
    scale: i32,
}

impl EncountersModule {
    pub fn new() -> Self {
        Self {
            anim: None,
            font: crate::simpsons::RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            stars: Vec::new(),
            encounter_setting: 0,
            active_encounter: 0,
            frame_idx: 0,
            cam_x: 320.0,
            cam_y: 260.0,
            tick: 0,
            scale: 1,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "tng_encounters".to_string(),
            name: "Encounters".to_string(),
            filename: "ENCOUNTR.AD".to_string(),
            credit: "By Gregor, Luis, Matt and Randall.\nSoftware © 1994 Berkeley Systems, Inc.\nStar Trek: TNG ™ & © Paramount Pictures.".to_string(),
            about: "Join Captain Picard, Commander Riker, Lt. Worf, and Q on the Bridge of the U.S.S. Enterprise-D across 2,580 animated frames and 28 digitized cast voice clips!".to_string(),
            controls: [
                AdControl::Menu {
                    title: "Encounter:".to_string(),
                    default_index: 0,
                    choices: vec![
                        "Random".into(),
                        "The Game".into(),
                        "Parallels".into(),
                        "Tin Man".into(),
                        "Darmok".into(),
                        "Crystal Dude".into(),
                        "Farpoint".into(),
                        "Quality of Life".into(),
                    ],
                },
                AdControl::None,
                AdControl::None,
                AdControl::None,
            ],
            target_frame_ms: 68,
        }
    }

    fn draw_bridge(&mut self, surface: &mut ad_sdk::canvas::AdSurface) {
        let w = surface.width;
        let h = surface.height;
        fill_rect_px(surface, 0, 0, w, h, 0x0003_050E);

        // Starry main viewscreen upper half
        let vs_h = (h * 56) / 100;
        for (i, &(sx, sy, col)) in self.stars.iter().enumerate() {
            if sy < vs_h && (self.tick + i) % 19 != 0 {
                put_px(surface, sx, sy, col);
            }
        }
        // Bridge console parapet separating viewscreen from command well
        fill_rect_px(surface, 0, vs_h, w, vs_h + 6, 0x006C_4C34);
        fill_rect_px(surface, 0, vs_h + 6, w, h, 0x001E_1614);
        // Subtle glowing LCARS tactical pips along the bridge console rim
        for i in 0..((w / 28).max(4)) {
            let col = match (i as usize + self.tick / 12) % 4 {
                0 => 0x00F4_9C38,
                1 => 0x0068_B8FF,
                2 => 0x00C8_78E8,
                _ => 0x0038_3040,
            };
            fill_rect_px(surface, 10 + i * 28, vs_h + 12, 28 + i * 28, vs_h + 18, col);
        }

        let Some(anim) = &self.anim else {
            return;
        };
        if anim.frames.is_empty() {
            return;
        }
        let fi = self.frame_idx % anim.frames.len();
        let s = self.scale;

        // If full 640x480 fits cleanly, anchor full Enterprise-D bridge stage; otherwise smoothly track active actor!
        if w >= 640 * s && h >= 440 * s {
            let ox = (w - 640 * s) / 2;
            let oy = (h - 440 * s) / 2;
            anim.draw_stage_frame(surface, fi, ox, oy, s);
        } else {
            let cf = &anim.frames[fi];
            let tcx = ((cf.left + cf.right) / 2 + cf.dx) as f32;
            let tcy = ((cf.top + cf.bottom) / 2 + cf.dy) as f32;
            if (tcx - self.cam_x).abs() > 140.0 || (tcy - self.cam_y).abs() > 140.0 {
                self.cam_x = tcx;
                self.cam_y = tcy;
            } else {
                self.cam_x += (tcx - self.cam_x) * 0.20;
                self.cam_y += (tcy - self.cam_y) * 0.20;
            }
            let ox = w / 2 - (self.cam_x as i32) * s;
            let oy = h / 2 - (self.cam_y as i32) * s;
            anim.draw_stage_frame(surface, fi, ox, oy, s);
        }

        let hdr = format!(
            "MAIN BRIDGE // ENCOUNTER: {}",
            ENCOUNTER_NAMES[self.active_encounter % ENCOUNTER_NAMES.len()]
        );
        draw_bitmap_text(surface, &self.font, &hdr, 12, 10, Some(0x00FF_B848), 1);
    }
}

impl Default for EncountersModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for EncountersModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        if self.anim.is_none() {
            self.anim = Some(load_anim(MOD_ENCOUNTERS, 1000));
            self.font = load_lcars_font(FONT_LCARS_14);
        }
        self.encounter_setting = ctx.module.raw_control_value[0].clamp(0, 7);
        self.active_encounter = if self.encounter_setting == 0 {
            ctx.rng.rand_mod(7) as usize
        } else {
            (self.encounter_setting - 1) as usize
        };
        let total = self.anim.as_ref().map(|a| a.frames.len()).unwrap_or(1).max(1);
        self.frame_idx = ENCOUNTER_STARTS[self.active_encounter % 7] % total;
        self.scale = if ctx.surface.width >= 1280 && ctx.surface.height >= 920 {
            2
        } else {
            1
        };

        self.stars.clear();
        let w = ctx.surface.width.max(1);
        let h = ctx.surface.height.max(1);
        let cols = [0x00FF_FFFF, 0x00A8_D0FF, 0x00FF_DF98];
        for _ in 0..95 {
            self.stars.push((
                ctx.rng.rand_mod(w),
                ctx.rng.rand_mod(h),
                cols[ctx.rng.rand_mod(cols.len() as i32) as usize],
            ));
        }

        if let Some(cf) = self.anim.as_ref().and_then(|a| a.frames.get(self.frame_idx)) {
            self.cam_x = ((cf.left + cf.right) / 2 + cf.dx) as f32;
            self.cam_y = ((cf.top + cf.bottom) / 2 + cf.dy) as f32;
        }
        self.tick = 0;

        let pack = tng_pack();
        pack.play_music(ctx.sound, ctx.system.sound_enabled, SONG_TNG_TAG, 1);
        pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_PICARD_ONSCREEN);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.draw_bridge(ctx.surface);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.tick = self.tick.wrapping_add(1);
        let pack = tng_pack();

        if let Some(anim) = &self.anim {
            if !anim.frames.is_empty() {
                self.frame_idx = (self.frame_idx + 1) % anim.frames.len();
                // Update episode banner as sequence progresses in Random mode
                if self.encounter_setting == 0 {
                    for (idx, &st) in ENCOUNTER_STARTS.iter().enumerate() {
                        if self.frame_idx >= st {
                            self.active_encounter = idx;
                        }
                    }
                }
            }
        }

        // Authentic cast dialogue cues (Picard / Riker / Worf / Q)
        if self.tick % 78 == 38 {
            let clip = match ctx.rng.rand_mod(10) {
                0..=3 => PICARD_LINES[ctx.rng.rand_mod(PICARD_LINES.len() as i32) as usize],
                4..=5 => RIKER_LINES[ctx.rng.rand_mod(RIKER_LINES.len() as i32) as usize],
                6..=7 => WORF_LINES[ctx.rng.rand_mod(WORF_LINES.len() as i32) as usize],
                8 => Q_LINES[ctx.rng.rand_mod(Q_LINES.len() as i32) as usize],
                _ => SND_VIEWSCREEN,
            };
            pack.play_voice(ctx.sound, ctx.system.sound_enabled, clip);
        }

        self.draw_bridge(ctx.surface);
        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        AdResult::NoError
    }
}
