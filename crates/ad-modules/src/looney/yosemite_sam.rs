//! "Yosemite Sam" — Classic 1995 *Looney Tunes* After Dark 3.0 module.
//!
//! *"YEEEEEEEE-HAW! There's a new law in town!"* Yosemite Sam bursts through
//! swinging Old West saloon doors (`OFst #5000`) onto your real Windows desktop
//! with smooth proportional HD/4K scaling, stomping across the screen and
//! blasting six-shooter bullet holes according to `Temper:` and `Aim:`.

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::looney::{
    MOD_YOSEMITE, SONG_GOOD_BAD_UGLY, SONG_YOSEMITE_SAM, YOSEMITE_VOICES, advance_filtered_range,
    load_anim, looney_pack,
};
use crate::simpsons::{CompoundAnim, fill_circle_px, music_loops_from_slider, restore_or_clear};

struct BulletHole {
    x: i32,
    y: i32,
    sprite_idx: usize,
}

pub struct YosemiteSamModule {
    temper_raw: i32,
    aim_raw: i32,
    clear_first: bool,
    music_raw: i32,
    saved_bg: Vec<u32>,
    anim: Option<CompoundAnim>,
    holes: Vec<BulletHole>,
    sam_x: f32,
    sam_y: f32,
    vx: f32,
    frame_idx: usize,
    tick: u32,
}

impl YosemiteSamModule {
    pub fn new() -> Self {
        Self {
            temper_raw: 50,
            aim_raw: 100,
            clear_first: false,
            music_raw: 30,
            saved_bg: Vec::new(),
            anim: None,
            holes: Vec::new(),
            sam_x: 320.0,
            sam_y: 380.0,
            vx: 2.2,
            frame_idx: 163,
            tick: 0,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "looney_yosemite_sam".to_string(),
            name: "Yosemite Sam".to_string(),
            filename: "YOSEMITE.AD".to_string(),
            credit: "By Alan Kaiser & Tim Sniffen.\nSoftware © 1995 Berkeley Systems, Inc.\nLooney Tunes ™ & © Warner Bros.".to_string(),
            about: "YEEEEEEEE-HAW! There's a new law in town, and he ain't partial to keyboard-tappin' varmints! Yosemite Sam bursts through saloon doors and blasts your desktop with his six-shooters.".to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "Temper:".to_string(),
                    default_raw: 50,
                    labels: vec!["Mild".into(), "Ornery".into(), "Furious".into()],
                    thresholds: vec![0, 33, 66],
                },
                AdControl::LabeledSlider {
                    title: "Aim:".to_string(),
                    default_raw: 100,
                    labels: vec!["Wild".into(), "Fair".into(), "Deadeye".into()],
                    thresholds: vec![0, 33, 66],
                },
                AdControl::Checkbox {
                    title: "Clear Screen First".to_string(),
                    default_checked: false,
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
            ],
            target_frame_ms: 68,
        }
    }

    fn ensure_loaded(&mut self) {
        if self.anim.is_none() {
            self.anim = Some(load_anim(MOD_YOSEMITE, 5000));
        }
    }
}

impl Default for YosemiteSamModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for YosemiteSamModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();
        self.saved_bg = ctx.surface.pixels().to_vec();
        self.temper_raw = ctx.module.raw_control_value[0].clamp(0, 100);
        self.aim_raw = ctx.module.raw_control_value[1].clamp(0, 100);
        self.clear_first = ctx.module.raw_control_value[2] != 0;
        self.music_raw = ctx.module.raw_control_value[3].clamp(0, 100);
        self.tick = 0;
        self.frame_idx = 163;
        let w = ctx.surface.width.max(320);
        let h = ctx.surface.height.max(240);
        let sf = (h as f32 / 480.0).clamp(1.0, 3.2);
        self.sam_x = w as f32 * 0.60;
        self.sam_y = h as f32 - 32.0 * sf;
        self.vx = 2.4 * sf;
        self.holes.clear();
        for i in 0..8 {
            self.holes.push(BulletHole {
                x: (w / 10) + ((i * (w / 6)) % (w * 8 / 10).max(80)),
                y: (h / 8) + ((i * (h / 7)) % (h * 5 / 8).max(80)),
                sprite_idx: 56 + (i as usize % 6),
            });
        }
        restore_or_clear(ctx.surface, &self.saved_bg, self.clear_first, 0x0026_1A12);

        if let Some(loops) = music_loops_from_slider(self.music_raw) {
            let song = if ctx.rng.rand_mod(2) == 0 {
                SONG_YOSEMITE_SAM
            } else {
                SONG_GOOD_BAD_UGLY
            };
            looney_pack().play_music(ctx.sound, ctx.system.sound_enabled, song, loops);
        }
        looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, YOSEMITE_VOICES[7]);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        restore_or_clear(ctx.surface, &self.saved_bg, self.clear_first, 0x0026_1A12);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();
        self.tick = self.tick.wrapping_add(1);

        let w = ctx.surface.width;
        let h = ctx.surface.height;
        let sf = (h as f32 / 480.0).clamp(1.0, 3.2);
        let char_sf = (sf * 1.35).clamp(1.1, 3.8);
        restore_or_clear(ctx.surface, &self.saved_bg, self.clear_first, 0x0026_1A12);

        let Some(anim) = &self.anim else {
            return AdResult::NoError;
        };

        let ground_y = h - (28.0 * sf).round() as i32;
        // Swinging Old West Saloon entrance (`OFst #5000` frame 89) smoothly scaled!
        anim.draw_anchored_bottom_f(
            ctx.surface,
            89,
            (130.0 * char_sf).round() as i32,
            ground_y,
            char_sf,
            false,
            true,
            false,
        );

        for hole in &self.holes {
            if let Some(sp) = anim.sprites.get(hole.sprite_idx) {
                sp.blit_transformed_f(ctx.surface, hole.x, hole.y, char_sf, false, false, true, false);
            } else {
                fill_circle_px(ctx.surface, hole.x, hole.y, (5.0 * sf) as i32, 0x0010_1014);
                fill_circle_px(ctx.surface, hole.x, hole.y, (2.0 * sf) as i32, 0x0078_7888);
            }
        }

        let fire_period = (45 - (self.temper_raw / 3)).max(12) as u32;
        if self.tick % fire_period == 0 {
            if self.holes.len() >= 24 {
                self.holes.remove(0);
            }
            let spread_x = (((w as f32 * 0.42) * (1.0 - (self.aim_raw as f32 * 0.65 / 100.0))) as i32).max(24);
            let spread_y = (((h as f32 * 0.34) * (1.0 - (self.aim_raw as f32 * 0.65 / 100.0))) as i32).max(24);
            let hx = (w / 2 + ctx.rng.rand_mod(spread_x * 2) - spread_x).clamp(32, (w - 48).max(33));
            let hy = (h * 42 / 100 + ctx.rng.rand_mod(spread_y * 2) - spread_y).clamp(32, (h - (120.0 * sf) as i32).max(33));
            self.holes.push(BulletHole {
                x: hx,
                y: hy,
                sprite_idx: 56 + (ctx.rng.rand_mod(6) as usize),
            });
            looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, YOSEMITE_VOICES[2]);
        }

        self.frame_idx = advance_filtered_range(anim, self.frame_idx, 163, 714, 48, 52, 220, 220);

        self.sam_x += self.vx;
        let min_x = (240.0 * char_sf).min(w as f32 * 0.42);
        let max_x = w as f32 - 90.0 * char_sf;
        if self.sam_x < min_x || self.sam_x > max_x {
            self.vx = -self.vx;
        }
        self.sam_y = ground_y as f32;

        anim.draw_anchored_bottom_f(
            ctx.surface,
            self.frame_idx,
            self.sam_x as i32,
            self.sam_y as i32,
            char_sf,
            self.vx < 0.0,
            true,
            false,
        );

        if self.tick % 85 == 0 {
            let vid = YOSEMITE_VOICES[(self.tick as usize / 85) % YOSEMITE_VOICES.len()];
            looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, vid);
        }

        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        AdResult::NoError
    }
}
