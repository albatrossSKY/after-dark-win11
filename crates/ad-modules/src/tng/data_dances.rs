//! *Data Dances* — 1994 *Star Trek: The Next Generation* After Dark 3.0 Module.
//!
//! Lt. Commander Data performs all 4 classic ballroom dances taught by Dr.
//! Beverly Crusher in "Data's Day" — **Fox-trot**, **Cha Cha**, **Tap**, and
//! **Rhumba** — across 979 authentic `OFst/OFtb #9000` animation frames with
//! all 4 dedicated dance MIDI themes (`cmid #30/#20/#37/#10`)!

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::simpsons::{CompoundAnim, draw_bitmap_text, fill_rect_px, music_loops_from_slider};
use super::{
    FONT_LCARS_14, MOD_DATA_DANCES, SONG_DATA_CHACHA, SONG_DATA_FOXTROT, SONG_DATA_RHUMBA,
    SONG_DATA_TAP, load_anim, load_lcars_font, tng_pack,
};

const DANCE_NAMES: [&str; 4] = ["FOX-TROT", "CHA CHA", "TAP", "RHUMBA"];
const DANCE_RANGES: [(usize, usize); 4] = [(72, 290), (290, 540), (540, 760), (760, 978)];
const DANCE_SONGS: [i16; 4] = [
    SONG_DATA_FOXTROT,
    SONG_DATA_CHACHA,
    SONG_DATA_TAP,
    SONG_DATA_RHUMBA,
];

pub struct DataDancesModule {
    anim: Option<CompoundAnim>,
    font: crate::simpsons::RlepBank,
    dance_setting: i32, // 0..3 specific dance, 4 = Random
    active_dance: usize,
    frame_idx: usize,
    music_loops: Option<u32>,
    cam_x: f32,
    cam_y: f32,
    tick: usize,
    scale: i32,
}

impl DataDancesModule {
    pub fn new() -> Self {
        Self {
            anim: None,
            font: crate::simpsons::RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            dance_setting: 4,
            active_dance: 0,
            frame_idx: 72,
            music_loops: Some(1),
            cam_x: 150.0,
            cam_y: 230.0,
            tick: 0,
            scale: 1,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "tng_data_dances".to_string(),
            name: "Data Dances".to_string(),
            filename: "DATADANC.AD".to_string(),
            credit: "By L. Bustamante, D. Muise, D. Zimmerman.\nSoftware © 1994 Berkeley Systems, Inc.\nStar Trek: TNG ™ & © Paramount Pictures.".to_string(),
            about: "Dr. Beverly Crusher taught Lt. Commander Data to dance in \"Data's Day.\" Watch Data perform Fox-trot, Cha Cha, Tap, and Rhumba across 979 animated frames with dedicated MIDI dance music!".to_string(),
            controls: [
                AdControl::Menu {
                    title: "Dance:".to_string(),
                    default_index: 4,
                    choices: vec![
                        "Fox-trot".into(),
                        "Cha Cha".into(),
                        "Tap".into(),
                        "Rhumba".into(),
                        "Random".into(),
                    ],
                },
                AdControl::LabeledSlider {
                    title: "Music:".to_string(),
                    default_raw: 25,
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
        }
    }

    fn draw_ballroom(&mut self, surface: &mut ad_sdk::canvas::AdSurface) {
        let w = surface.width;
        let h = surface.height;
        fill_rect_px(surface, 0, 0, w, h, 0x0006_0412);

        let s = self.scale;
        // Subtle Ten-Forward / Holodeck dance floor horizon & warm spotlight beams
        let floor_y = (h * 2) / 3;
        fill_rect_px(surface, 0, floor_y, w, h, 0x0014_1022);
        fill_rect_px(surface, 0, floor_y, w, floor_y + 2, 0x0048_3868);

        if let Some(anim) = &self.anim {
            if !anim.frames.is_empty() {
                let fi = self.frame_idx % anim.frames.len();
                let cf = &anim.frames[fi];
                let tcx = ((cf.left + cf.right) / 2 + cf.dx) as f32;
                let tcy = ((cf.top + cf.bottom) / 2 + cf.dy) as f32;
                if (tcx - self.cam_x).abs() > 140.0 || (tcy - self.cam_y).abs() > 120.0 {
                    self.cam_x = tcx;
                    self.cam_y = tcy;
                } else {
                    self.cam_x += (tcx - self.cam_x) * 0.16;
                    self.cam_y += (tcy - self.cam_y) * 0.16;
                }
                let ox = w / 2 - (self.cam_x as i32) * s;
                let oy = h / 2 - (self.cam_y as i32) * s;
                anim.draw_stage_frame(surface, fi, ox, oy, s);
            }
        }

        // LCARS dance style indicator badge in top-left corner
        let label = format!("HOLODECK PROGRAM: DATA - {}", DANCE_NAMES[self.active_dance % 4]);
        draw_bitmap_text(surface, &self.font, &label, 12, 10, Some(0x00FF_B848), 1);
    }
}

impl Default for DataDancesModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for DataDancesModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        if self.anim.is_none() {
            self.anim = Some(load_anim(MOD_DATA_DANCES, 9000));
            self.font = load_lcars_font(FONT_LCARS_14);
        }
        self.dance_setting = ctx.module.raw_control_value[0].clamp(0, 4);
        self.music_loops = music_loops_from_slider(ctx.module.raw_control_value[1]);
        self.active_dance = if self.dance_setting == 4 {
            ctx.rng.rand_mod(4) as usize
        } else {
            self.dance_setting as usize
        };
        let total = self.anim.as_ref().map(|a| a.frames.len()).unwrap_or(1).max(1);
        let (start, _) = DANCE_RANGES[self.active_dance % 4];
        self.frame_idx = start.min(total - 1);
        self.scale = if ctx.surface.width >= 960 && ctx.surface.height >= 640 {
            2
        } else {
            1
        };
        if let Some(cf) = self.anim.as_ref().and_then(|a| a.frames.get(self.frame_idx)) {
            self.cam_x = ((cf.left + cf.right) / 2 + cf.dx) as f32;
            self.cam_y = ((cf.top + cf.bottom) / 2 + cf.dy) as f32;
        }
        self.tick = 0;

        if let Some(loops) = self.music_loops {
            tng_pack().play_music(
                ctx.sound,
                ctx.system.sound_enabled,
                DANCE_SONGS[self.active_dance % 4],
                loops,
            );
        }

        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.draw_ballroom(ctx.surface);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.tick = self.tick.wrapping_add(1);
        let total = self.anim.as_ref().map(|a| a.frames.len()).unwrap_or(1).max(1);
        let (start, end) = DANCE_RANGES[self.active_dance % 4];
        let end = end.min(total);
        self.frame_idx += 1;
        if self.frame_idx >= end {
            if self.dance_setting == 4 {
                self.active_dance = (self.active_dance + 1) % 4;
                if let Some(loops) = self.music_loops {
                    tng_pack().play_music(
                        ctx.sound,
                        ctx.system.sound_enabled,
                        DANCE_SONGS[self.active_dance % 4],
                        loops,
                    );
                }
            }
            self.frame_idx = DANCE_RANGES[self.active_dance % 4].0.min(total - 1);
        }
        let _ = start;
        self.draw_ballroom(ctx.surface);
        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        AdResult::NoError
    }
}
