//! "Desquetoppe D'Amour" — Classic 1995 *Looney Tunes* After Dark 3.0 module.
//!
//! *"Ah, l'amour! Le toujours! Le computeur!"* Pepé Le Pew bounds across your
//! Windows desktop (`OFst #8000`, 447 compound frames across `RLEP #8000..#8004`)
//! pursuing Penelope Pussycat through a springtime flower garden while playing
//! *Desquetoppe D'Amour* (`SONG_DESQUETOPPE` `#40`) or *La Marseillaise* (`#60`)
//! and Pepé's digitized romantic lines (`PEPE_VOICES`).

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::looney::{
    MOD_DESQUETOPPE, PEPE_VOICES, SONG_DESQUETOPPE, SONG_MARSEILLAISE, advance_filtered_range,
    fill_box_px, load_anim, looney_pack,
};
use crate::simpsons::{CompoundAnim, fill_circle_px, music_loops_from_slider, restore_or_clear};

struct HeartParticle {
    x: f32,
    y: f32,
    vy: f32,
    phase: f32,
}

pub struct DesquetoppeModule {
    clear_first: bool,
    music_raw: i32,
    saved_bg: Vec<u32>,
    anim: Option<CompoundAnim>,
    pepe_frame: usize,
    cat_frame: usize,
    pepe_x: f32,
    cat_x: f32,
    tick: u32,
    hearts: Vec<HeartParticle>,
}

impl DesquetoppeModule {
    pub fn new() -> Self {
        Self {
            clear_first: false,
            music_raw: 16,
            saved_bg: Vec::new(),
            anim: None,
            pepe_frame: 4,
            cat_frame: 215,
            pepe_x: 160.0,
            cat_x: 340.0,
            tick: 0,
            hearts: Vec::new(),
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "looney_desquetoppe".to_string(),
            name: "Desquetoppe D'Amour".to_string(),
            filename: "DESQUE.AD".to_string(),
            credit: "By Tom Wuttke, Jarir Maani & Laura Tullio.\nSoftware © 1995 Berkeley Systems, Inc.\nLooney Tunes ™ & © Warner Bros.".to_string(),
            about: "Ah, l'amour! Le toujours! Le computeur! Your desktop in springtime is so romantic as Pepé Le Pew wooingly bounds after Penelope Pussycat.".to_string(),
            controls: [
                AdControl::Checkbox {
                    title: "Clear Screen First".to_string(),
                    default_checked: false,
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
                AdControl::None,
            ],
            target_frame_ms: 68,
        }
    }

    fn ensure_loaded(&mut self) {
        if self.anim.is_none() {
            self.anim = Some(load_anim(MOD_DESQUETOPPE, 8000));
        }
    }
}

impl Default for DesquetoppeModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for DesquetoppeModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();
        self.saved_bg = ctx.surface.pixels().to_vec();
        self.clear_first = ctx.module.raw_control_value[0] != 0;
        self.music_raw = ctx.module.raw_control_value[1].clamp(0, 100);
        self.tick = 0;
        self.pepe_frame = 4;
        self.cat_frame = 215;
        self.pepe_x = 150.0;
        self.cat_x = 380.0;
        self.hearts.clear();
        for i in 0..12 {
            self.hearts.push(HeartParticle {
                x: (80 + i * 46) as f32,
                y: (120 + (i * 29) % 240) as f32,
                vy: -0.9 - (i % 3) as f32 * 0.35,
                phase: i as f32 * 0.7,
            });
        }
        restore_or_clear(ctx.surface, &self.saved_bg, self.clear_first, 0x001E_1632);

        if let Some(loops) = music_loops_from_slider(self.music_raw.max(25)) {
            let song = if ctx.rng.rand_mod(2) == 0 {
                SONG_DESQUETOPPE
            } else {
                SONG_MARSEILLAISE
            };
            looney_pack().play_music(ctx.sound, ctx.system.sound_enabled, song, loops);
        }
        looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, PEPE_VOICES[2]);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        restore_or_clear(ctx.surface, &self.saved_bg, self.clear_first, 0x001E_1632);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();
        self.tick = self.tick.wrapping_add(1);

        let w = ctx.surface.width;
        let h = ctx.surface.height;
        // Restore the user's real Windows desktop (or solid romantic twilight if Clear Screen First is checked)
        restore_or_clear(ctx.surface, &self.saved_bg, self.clear_first, 0x001E_1632);

        let Some(anim) = &self.anim else {
            return AdResult::NoError;
        };

        // 1. Floating pink hearts rising across the user's real Windows desktop
        for hp in &mut self.hearts {
            hp.y += hp.vy;
            hp.phase += 0.08;
            let hx = (hp.x + hp.phase.sin() * 14.0) as i32;
            let hy = hp.y as i32;
            if hp.y < 24.0 {
                hp.y = (h - 32) as f32;
            }
            fill_circle_px(ctx.surface, hx - 3, hy, 4, 0xFF60_98);
            fill_circle_px(ctx.surface, hx + 3, hy, 4, 0xFF60_98);
            fill_box_px(ctx.surface, hx - 4, hy + 1, 9, 5, 0xFF60_98);
        }

        // 2. Advance Pepé Le Pew (`4..=130`) & Penelope Pussycat (`180..=446`), filtering out tiny sub-part frames
        self.pepe_frame = advance_filtered_range(anim, self.pepe_frame, 4, 130, 45, 55, 220, 220);
        self.cat_frame = advance_filtered_range(anim, self.cat_frame, 180, 446, 45, 50, 220, 220);

        self.pepe_x += 2.2;
        self.cat_x += 2.5;
        if self.pepe_x > (w - 80) as f32 {
            self.pepe_x = 80.0;
        }
        if self.cat_x > (w - 60) as f32 {
            self.cat_x = 120.0;
        }

        let ground_y = h - 28;
        anim.draw_anchored_bottom(
            ctx.surface,
            self.pepe_frame,
            self.pepe_x as i32,
            ground_y,
            1,
            false,
        );
        anim.draw_anchored_bottom(
            ctx.surface,
            self.cat_frame,
            self.cat_x as i32,
            ground_y - 16,
            1,
            false,
        );

        if self.tick % 90 == 0 {
            let vid = PEPE_VOICES[(self.tick as usize / 90) % PEPE_VOICES.len()];
            looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, vid);
        }

        AdResult::NoError
    }
}
