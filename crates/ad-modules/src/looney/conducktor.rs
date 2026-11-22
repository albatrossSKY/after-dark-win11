//! "Conducktor" — Classic 1995 *Looney Tunes* After Dark 3.0 module.
//!
//! Maestro Daffy Duck conducts Verdi's *Anvil Chorus* (`#70`) or Tchaikovsky's
//! *1812 Overture* (`#80`) (`OFst #2000`, 891 compound frames across `RLEP #2000..#2002`)
//! while colorful musical notes (`MENU #1000`) float across the screen—until a
//! literal anvil, safe, or cannonball drops on his head (`DAFFY_VOICES`).

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::looney::{
    DAFFY_VOICES, MOD_CONDUCKTOR, SONG_1812_OVERTURE, SONG_ANVIL_CHORUS, load_anim, looney_pack,
};
use crate::simpsons::{
    CompoundAnim, draw_line_px, fill_circle_px, music_loops_from_slider,
};

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
            music_raw: 16,
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
                    default_raw: 16,
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
        for i in 0..14 {
            let tint = Self::note_palette(self.color_idx, i);
            self.notes.push(FloatingNote {
                x: (w / 2 - 120 + (i * 22) % 240) as f32,
                y: (h / 2 - 40 - (i * 15) % 130) as f32,
                vx: ((i % 5) as f32 - 2.0) * 1.3,
                vy: -1.2 - (i % 3) as f32 * 0.5,
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
        if let Some(loops) = music_loops_from_slider(self.music_raw.max(25)) {
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
        ctx.surface.pixels_mut().fill(0x000A_0C18);

        // Symphony hall spotlight & podium floor
        fill_circle_px(ctx.surface, w / 2, h - 72, 130, 0x001A_1E38);
        crate::looney::fill_box_px(ctx.surface, w / 2 - 70, h - 54, 140, 18, 0x0058_341C);
        draw_line_px(
            ctx.surface,
            w / 2 - 70,
            h - 54,
            w / 2 + 70,
            h - 54,
            0x00A8_6E3C,
            2,
        );

        let Some(anim) = &self.anim else {
            return AdResult::NoError;
        };

        if self.tick % 4 == 0 && self.notes.len() < 24 {
            let tint = Self::note_palette(self.color_idx, ctx.rng.rand_mod(6));
            let sp = 89 + (ctx.rng.rand_mod(10) as usize);
            let ang_vx = (ctx.rng.rand_mod(9) - 4) as f32 * 0.75;
            let ang_vy = -1.5 - (ctx.rng.rand_mod(5) as f32) * 0.4;
            self.notes.push(FloatingNote {
                x: (w / 2 + ctx.rng.rand_mod(40) - 20) as f32,
                y: (h - 150) as f32,
                vx: ang_vx,
                vy: ang_vy,
                sprite_idx: sp,
                tint,
            });
        }

        for n in &mut self.notes {
            n.x += n.vx;
            n.y += n.vy;
            if n.y < 16.0 || n.x < 16.0 || n.x > (w - 16) as f32 {
                n.x = (w / 2 + (n.sprite_idx as i32 % 30) - 15) as f32;
                n.y = (h - 145) as f32;
            }
            if let Some(sp) = anim.sprites.get(n.sprite_idx) {
                sp.blit_tinted(ctx.surface, n.x as i32, n.y as i32, n.tint, 1);
            }
        }

        let n_frames = anim.frames.len().saturating_sub(1);
        self.frame_idx =
            crate::looney::advance_filtered_range(anim, self.frame_idx, 0, n_frames, 44, 70, 220, 220);
        anim.draw_anchored_bottom(ctx.surface, self.frame_idx, w / 2, h - 54, 1, false);

        if let Some(safe_sp) = anim.sprites.get(45) {
            let drop_y = ((self.tick * 4) as i32 % (h - 110)) - 20;
            safe_sp.blit(ctx.surface, w / 2 + 120, drop_y);
        }

        if self.tick % 85 == 0 {
            let vid = DAFFY_VOICES[(self.tick as usize / 85) % DAFFY_VOICES.len()];
            looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, vid);
        }

        AdResult::NoError
    }
}
