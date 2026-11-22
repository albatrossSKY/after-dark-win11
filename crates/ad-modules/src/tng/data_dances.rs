//! *Data Dances* — 1994 *Star Trek: The Next Generation* After Dark 3.0 Module.
//!
//! Full-widescreen Ten-Forward / Holodeck Ballroom stage where Lt. Commander
//! Data performs all 4 classic dances taught by Dr. Beverly Crusher in "Data's
//! Day" — **Fox-trot**, **Cha Cha**, **Tap**, and **Rhumba** — across 979
//! authentic `OFst/OFtb #9000` frames (with per-part `flip_x`/`flip_y`,
//! black-keyed spotlight blending, smooth proportional HD/4K scaling, and all
//! 4 dedicated MIDI dance themes `cmid #30/#20/#37/#10`).

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::simpsons::{
    CompoundAnim, draw_bitmap_text, draw_line_px, fill_rect_px, music_loops_from_slider, put_px,
};
use super::{
    LCARS_AMBER, LCARS_GOLD, LCARS_LAVENDER, LCARS_SKY, LcarsFontSet, MOD_DATA_DANCES,
    SONG_DATA_CHACHA, SONG_DATA_FOXTROT, SONG_DATA_RHUMBA, SONG_DATA_TAP, fill_rounded_rect,
    load_anim, tng_pack,
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
    fonts: LcarsFontSet,
    stars: Vec<(f32, f32, u32)>,
    dance_setting: i32, // 0..3 specific dance, 4 = Random
    active_dance: usize,
    frame_idx: usize,
    music_loops: Option<u32>,
    cam_x: f32,
    cam_bottom: f32,
    tick: usize,
}

impl DataDancesModule {
    pub fn new() -> Self {
        Self {
            anim: None,
            fonts: LcarsFontSet::empty(),
            stars: Vec::new(),
            dance_setting: 4,
            active_dance: 0,
            frame_idx: 72,
            music_loops: Some(1),
            cam_x: 150.0,
            cam_bottom: 310.0,
            tick: 0,
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
        fill_rect_px(surface, 0, 0, w, h, 0x0006_0514);

        let floor_y = (h * 60) / 100;

        // Ten-Forward panoramic starfield above the dance floor horizon
        for (i, &(nx, ny, col)) in self.stars.iter().enumerate() {
            if (self.tick + i) % 21 != 0 {
                let sx = (nx * w as f32) as i32;
                let sy = (ny * floor_y as f32) as i32;
                put_px(surface, sx, sy, col);
            }
        }
        // Subtle Ten-Forward arched observation window mullions
        let win_cols = (w / 220).clamp(3, 8);
        for i in 1..win_cols {
            let wx = (w * i) / win_cols;
            fill_rect_px(surface, wx - 2, 0, wx + 2, floor_y, 0x0018_142A);
        }

        // Perspective Ten-Forward / Holodeck dance floor
        fill_rect_px(surface, 0, floor_y, w, h, 0x0012_0E22);
        fill_rect_px(surface, 0, floor_y, w, floor_y + 3, 0x0064_4E8C);
        let cx = w / 2;
        let step = (w / 10).clamp(40, 140);
        for i in -8..=8 {
            draw_line_px(surface, cx + i * (step / 2), floor_y, cx + i * (step * 2), h, 0x0024_1C3C, 1);
        }
        let mut fy = floor_y + (h - floor_y) / 9;
        let mut dy = ((h - floor_y) / 10).max(12);
        while fy < h {
            fill_rect_px(surface, 0, fy, w, fy + 1, 0x0022_1A38);
            fy += dy;
            dy = (dy * 13) / 10 + 2;
        }

        // Soft warm spotlight beam cone shining down from stage ceiling onto Data!
        let beam_top_w = (w / 14).clamp(24, 90);
        let beam_bot_w = (w / 4).clamp(110, 380);
        let dst = surface.pixels_mut();
        for y in 0..((h * 84) / 100) {
            let t = y as f32 / ((h * 84) / 100).max(1) as f32;
            let half = ((beam_top_w as f32) * (1.0 - t) + (beam_bot_w as f32) * t * 0.5) as i32;
            let x0 = (cx - half).max(0);
            let x1 = (cx + half).min(w);
            let row = (y * w) as usize;
            let add_r = (14.0 * (0.4 + 0.6 * t)) as u32;
            let add_g = (12.0 * (0.4 + 0.6 * t)) as u32;
            let add_b = (8.0 * (0.4 + 0.6 * t)) as u32;
            for x in x0..x1 {
                let v = dst[row + x as usize];
                let r = (((v >> 16) & 0xFF) + add_r).min(255);
                let g = (((v >> 8) & 0xFF) + add_g).min(255);
                let b = ((v & 0xFF) + add_b).min(255);
                dst[row + x as usize] = (r << 16) | (g << 8) | b;
            }
        }

        // Smooth proportional HD/4K scaling for Data (~58% of screen height!)
        let sf = ((h as f32 * 0.58) / 172.0).clamp(1.15, 5.2);

        if let Some(anim) = &self.anim {
            if !anim.frames.is_empty() {
                let fi = self.frame_idx % anim.frames.len();
                let cf = &anim.frames[fi];
                let tcx = ((cf.left + cf.right) / 2 + cf.dx) as f32;
                let tbot = (cf.bottom + cf.dy) as f32;
                if (tcx - self.cam_x).abs() > 140.0 || (tbot - self.cam_bottom).abs() > 90.0 {
                    self.cam_x = tcx;
                    self.cam_bottom = tbot;
                } else {
                    self.cam_x += (tcx - self.cam_x) * 0.14;
                    self.cam_bottom += (tbot - self.cam_bottom) * 0.12;
                }
                let stage_x = cx as f32 - self.cam_x * sf;
                let floor_anchor = (h as f32) * 0.84;
                let stage_y = floor_anchor - self.cam_bottom * sf;

                // Draw each part with exact flip_x/flip_y flags; key out black ONLY on the
                // floor spotlight oval (sprite_idx == 19) so Data's black uniform stays solid
                // AND there is zero ugly black rectangle cutting across the ballroom floor!
                for part in &cf.parts {
                    if let Some(sp) = anim.sprites.get(part.sprite_idx) {
                        let sx = part.left + cf.dx;
                        let sy = part.top + cf.dy;
                        let dx0 = (stage_x + sx as f32 * sf).round() as i32;
                        let dy0 = (stage_y + sy as f32 * sf).round() as i32;
                        let dx1 = (stage_x + (sx + sp.w) as f32 * sf).round() as i32;
                        let dy1 = (stage_y + (sy + sp.h) as f32 * sf).round() as i32;
                        let p_flip_x = (part.flags & 1) != 0;
                        let p_flip_y = (part.flags & 2) != 0;
                        let key_black = part.sprite_idx == 19;
                        sp.blit_rect(
                            surface,
                            dx0,
                            dy0,
                            (dx1 - dx0).max(1),
                            (dy1 - dy0).max(1),
                            p_flip_x,
                            p_flip_y,
                            true,
                            key_black,
                        );
                    }
                }
            }
        }

        // Crisp high-DPI LCARS Holodeck Program header pill
        let pad = (h / 38).clamp(8, 22);
        let hdr_px = (h / 28).clamp(14, 30);
        let (f_hdr, s_hdr, lh_hdr) = self.fonts.pick(hdr_px);
        let pill_h = (lh_hdr + 8).clamp(22, 42);
        fill_rounded_rect(surface, pad, pad, pad + (w / 22).clamp(24, 56), pad + pill_h, pill_h / 2, LCARS_GOLD);
        let label = format!("HOLODECK PROGRAM: DATA - {}", DANCE_NAMES[self.active_dance % 4]);
        draw_bitmap_text(
            surface,
            f_hdr,
            &label,
            pad + (w / 22).clamp(24, 56) + 12,
            pad + ((pill_h - lh_hdr) / 2).max(2),
            Some(LCARS_AMBER),
            s_hdr,
        );

        // Subtle animated musical rhythm equalizer pips in top-right corner
        let eq_w = (w / 7).clamp(80, 220);
        let eq_x = w - pad - eq_w;
        for i in 0..10 {
            let amp = ((self.tick as f32 * 0.28 + i as f32 * 0.9).sin().abs() * 0.8 + 0.2).clamp(0.15, 1.0);
            let bh = ((pill_h as f32) * amp) as i32;
            let bx = eq_x + i * (eq_w / 10);
            let bw = ((eq_w / 10) - 3).max(3);
            let col = if i % 2 == 0 { LCARS_SKY } else { LCARS_LAVENDER };
            fill_rect_px(surface, bx, pad + pill_h - bh, bx + bw, pad + pill_h, col);
        }
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
            self.fonts.ensure_loaded();
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

        self.stars.clear();
        let cols = [0x00FF_FFFF, 0x00B8_D0FF, 0x00FF_DDA0];
        for _ in 0..110 {
            self.stars.push((
                ctx.rng.rand_mod(1000) as f32 / 1000.0,
                ctx.rng.rand_mod(1000) as f32 / 1000.0,
                cols[ctx.rng.rand_mod(cols.len() as i32) as usize],
            ));
        }

        if let Some(cf) = self.anim.as_ref().and_then(|a| a.frames.get(self.frame_idx)) {
            self.cam_x = ((cf.left + cf.right) / 2 + cf.dx) as f32;
            self.cam_bottom = (cf.bottom + cf.dy) as f32;
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
        let (_, end) = DANCE_RANGES[self.active_dance % 4];
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
        self.draw_ballroom(ctx.surface);
        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        AdResult::NoError
    }
}
