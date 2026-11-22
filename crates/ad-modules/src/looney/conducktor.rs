//! "Conducktor" — Classic 1995 *Looney Tunes* After Dark 3.0 module.
//!
//! Full-widescreen concert hall where Maestro Daffy Duck conducts Verdi's
//! *Anvil Chorus* (`#70`) or Tchaikovsky's *1812 Overture* (`#80`) (`OFst #2000`)
//! under a soft golden theater spotlight framed by red velvet stage curtains,
//! with proportionally scaled colorful musical notes (`MENU #1000`) and
//! digitized Daffy Duck voice clips (`DAFFY_VOICES`).

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::looney::{
    DAFFY_VOICES, MOD_CONDUCKTOR, SONG_1812_OVERTURE, SONG_ANVIL_CHORUS, advance_filtered_range,
    fill_box_px, load_anim, looney_pack,
};
use crate::simpsons::{CompoundAnim, draw_line_px, music_loops_from_slider};

struct FloatingNote {
    x: f32,
    y: f32,
    vx: f32,
    vy: f32,
    sprite_idx: usize,
    tint: u32,
}

pub struct ConducktorModule {
    color_idx: i32,
    symphony_idx: i32,
    music_raw: i32,
    anim: Option<CompoundAnim>,
    frame_idx: usize,
    tick: u32,
    notes: Vec<FloatingNote>,
}

impl ConducktorModule {
    pub fn new() -> Self {
        Self {
            color_idx: 6,
            symphony_idx: 2,
            music_raw: 25,
            anim: None,
            frame_idx: 0,
            tick: 0,
            notes: Vec::new(),
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "looney_conducktor".to_string(),
            name: "Conducktor".to_string(),
            filename: "CONDUCK.AD".to_string(),
            credit: "By Jarir Maani & Peter A. Kemmer.\nSoftware © 1995 Berkeley Systems, Inc.\nLooney Tunes ™ & © Warner Bros.".to_string(),
            about: "Give me a concussion, maestro! And a one, and a two… Daffy Duck conducts one of the most literal symphonies ever performed: The Anvil Chorus and the 1812 Overture.".to_string(),
            controls: [
                AdControl::Menu {
                    title: "Color".to_string(),
                    default_index: 6,
                    choices: vec![
                        "Meadow Romp".to_string(),
                        "Daybreak".to_string(),
                        "Riptide".to_string(),
                        "Crystal Splash".to_string(),
                        "May Frost".to_string(),
                        "Snow Angel".to_string(),
                        "Random".to_string(),
                    ],
                },
                AdControl::Menu {
                    title: "Symphony".to_string(),
                    default_index: 2,
                    choices: vec![
                        "Anvil Chorus".to_string(),
                        "1812".to_string(),
                        "Random".to_string(),
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
            ],
            target_frame_ms: 68,
        }
    }

    fn ensure_loaded(&mut self) {
        if self.anim.is_none() {
            self.anim = Some(load_anim(MOD_CONDUCKTOR, 2000));
        }
    }

    fn note_palette(color_idx: i32, seed: i32) -> u32 {
        let mode = if color_idx >= 6 {
            seed.rem_euclid(6)
        } else {
            color_idx.clamp(0, 5)
        };
        match mode {
            0 => 0x48E8_68, // Meadow Romp
            1 => 0xFFB8_38, // Daybreak
            2 => 0x38B8_FF, // Riptide
            3 => 0xD868_FF, // Crystal Splash
            4 => 0x88E0_FF, // May Frost
            _ => 0xF0F4_FF, // Snow Angel
        }
    }
}

impl Default for ConducktorModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for ConducktorModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();
        self.color_idx = ctx.module.raw_control_value[0].clamp(0, 6);
        self.symphony_idx = ctx.module.raw_control_value[1].clamp(0, 2);
        self.music_raw = ctx.module.raw_control_value[2].clamp(0, 100);
        self.tick = 0;
        self.frame_idx = 0;
        self.notes.clear();
        let w = ctx.surface.width.max(320);
        let h = ctx.surface.height.max(240);
        let sf = (h as f32 / 480.0).clamp(1.0, 3.2);
        for i in 0..18 {
            let tint = Self::note_palette(self.color_idx, i);
            self.notes.push(FloatingNote {
                x: (w / 2 - (w / 4) + ((i * (w / 14)) % (w / 2).max(40))) as f32,
                y: (h / 2 - (i * (h / 22)) % (h / 2).max(40)) as f32,
                vx: ((i % 5) as f32 - 2.0) * 1.3 * sf,
                vy: (-1.2 - (i % 3) as f32 * 0.5) * sf,
                sprite_idx: 89 + (i as usize % 10),
                tint,
            });
        }
        ctx.surface.pixels_mut().fill(0x000A_0C18);

        let song = match self.symphony_idx {
            0 => SONG_ANVIL_CHORUS,
            1 => SONG_1812_OVERTURE,
            _ => {
                if ctx.rng.rand_mod(2) == 0 {
                    SONG_ANVIL_CHORUS
                } else {
                    SONG_1812_OVERTURE
                }
            }
        };
        if let Some(loops) = music_loops_from_slider(self.music_raw) {
            looney_pack().play_music(ctx.sound, ctx.system.sound_enabled, song, loops);
        }
        looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, DAFFY_VOICES[7]);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.surface.pixels_mut().fill(0x000A_0C18);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();
        self.tick = self.tick.wrapping_add(1);

        let w = ctx.surface.width;
        let h = ctx.surface.height;
        let sf = (h as f32 / 480.0).clamp(1.0, 3.5);
        let stage_y = (h * 84) / 100;
        let cx = w / 2;

        ctx.surface.pixels_mut().fill(0x0008_0B16);

        // Soft warm concert hall spotlight cone beaming onto Maestro Daffy!
        let beam_top = (w / 16).clamp(24, 80);
        let beam_bot = (w / 3).clamp(140, 460);
        {
            let dst = ctx.surface.pixels_mut();
            for y in 0..stage_y {
                let t = y as f32 / stage_y.max(1) as f32;
                let half = ((beam_top as f32) * (1.0 - t) + (beam_bot as f32) * t * 0.5) as i32;
                let x0 = (cx - half).max(0);
                let x1 = (cx + half).min(w);
                let row = (y * w) as usize;
                let add_r = (22.0 * (0.35 + 0.65 * t)) as u32;
                let add_g = (22.0 * (0.35 + 0.65 * t)) as u32;
                let add_b = (38.0 * (0.35 + 0.65 * t)) as u32;
                for x in x0..x1 {
                    let v = dst[row + x as usize];
                    let r = (((v >> 16) & 0xFF) + add_r).min(255);
                    let g = (((v >> 8) & 0xFF) + add_g).min(255);
                    let b = ((v & 0xFF) + add_b).min(255);
                    dst[row + x as usize] = (r << 16) | (g << 8) | b;
                }
            }
        }

        // Red velvet theater side curtains framing widescreen displays
        let curt_w = (w / 12).clamp(24, 110);
        let fold_w = (curt_w / 4).max(6);
        for i in 0..4 {
            let col = if i % 2 == 0 { 0x005C_1018 } else { 0x0040_0A10 };
            fill_box_px(ctx.surface, i * fold_w, 0, fold_w, stage_y, col);
            fill_box_px(ctx.surface, w - (i + 1) * fold_w, 0, fold_w, stage_y, col);
        }

        // Polished wood concert stage & conductor's podium
        fill_box_px(ctx.surface, 0, stage_y, w, h - stage_y, 0x0024_140C);
        draw_line_px(ctx.surface, 0, stage_y, w - 1, stage_y, 0x008A_5630, (2.0 * sf).round().max(2.0) as i32);

        let pod_w = (160.0 * sf).round() as i32;
        let pod_h = (26.0 * sf).round() as i32;
        let pod_y = stage_y - pod_h / 2;
        fill_box_px(ctx.surface, cx - pod_w / 2, pod_y, pod_w, pod_h, 0x0064_381C);
        draw_line_px(
            ctx.surface,
            cx - pod_w / 2,
            pod_y,
            cx + pod_w / 2,
            pod_y,
            0x00C8_864A,
            (2.0 * sf).round().max(2.0) as i32,
        );

        let Some(anim) = &self.anim else {
            return AdResult::NoError;
        };

        // Proportionally scaled floating colored musical notes
        if self.tick % 4 == 0 && self.notes.len() < 30 {
            let tint = Self::note_palette(self.color_idx, ctx.rng.rand_mod(6));
            let sp = 89 + (ctx.rng.rand_mod(10) as usize);
            let ang_vx = (ctx.rng.rand_mod(11) - 5) as f32 * 0.85 * sf;
            let ang_vy = (-1.6 - (ctx.rng.rand_mod(5) as f32) * 0.45) * sf;
            self.notes.push(FloatingNote {
                x: (cx + ctx.rng.rand_mod((60.0 * sf) as i32) - (30.0 * sf) as i32) as f32,
                y: (pod_y as f32 - 110.0 * sf),
                vx: ang_vx,
                vy: ang_vy,
                sprite_idx: sp,
                tint,
            });
        }

        let note_sf = (sf * 1.55).clamp(1.2, 4.5);
        for n in &mut self.notes {
            n.x += n.vx;
            n.y += n.vy;
            if n.y < 16.0 || n.x < curt_w as f32 || n.x > (w - curt_w) as f32 {
                n.x = (cx + ((n.sprite_idx as i32 % 30) - 15) * 3) as f32;
                n.y = pod_y as f32 - 105.0 * sf;
            }
            if let Some(sp) = anim.sprites.get(n.sprite_idx) {
                sp.blit_tinted_f(ctx.surface, n.x as i32, n.y as i32, n.tint, note_sf);
            }
        }

        // Smoothly scaled Maestro Daffy Duck conducting on his podium (~48% of screen height!)
        let n_frames = anim.frames.len().saturating_sub(1);
        self.frame_idx = advance_filtered_range(anim, self.frame_idx, 0, n_frames, 44, 70, 220, 220);
        let daffy_sf = ((h as f32 * 0.48) / 135.0).clamp(1.1, 4.5);
        anim.draw_anchored_bottom_f(ctx.surface, self.frame_idx, cx, pod_y + 4, daffy_sf, false, true, false);

        if self.tick % 85 == 0 {
            let vid = DAFFY_VOICES[(self.tick as usize / 85) % DAFFY_VOICES.len()];
            looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, vid);
        }

        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        AdResult::NoError
    }
}
