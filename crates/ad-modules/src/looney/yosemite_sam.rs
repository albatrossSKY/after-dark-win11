//! "Yosemite Sam" — Classic 1995 *Looney Tunes* After Dark 3.0 module.
//!
//! *"YEEEEEEEE-HAW! There's a new law in town!"* Yosemite Sam bursts through
//! swinging saloon doors (`OFst #5000`, 715 compound frames across
//! `RLEP #5000..#5003`), stomps across your real Windows desktop, and blasts
//! six-shooter bullet holes across the screen according to his `Temper:` and
//! `Aim:` sliders, accompanied by 17 digitized Yosemite Sam voice & gunshot
//! clips (`YOSEMITE_VOICES`) and *Yosemite Sam* (`#90`) / *The Good, the Bad
//! and the Ugly* (`#100`) MIDI themes.

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
            vx: 2.0,
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
        self.sam_x = (w / 2 + 40) as f32;
        self.sam_y = (h - 36) as f32;
        self.holes.clear();
        for i in 0..8 {
            self.holes.push(BulletHole {
                x: 80 + ((i * 97) % (w - 160).max(80)),
                y: 55 + ((i * 73) % (h - 160).max(80)),
                sprite_idx: 56 + (i as usize % 6),
            });
        }
        restore_or_clear(ctx.surface, &self.saved_bg, self.clear_first, 0x0026_1A12);

        if let Some(loops) = music_loops_from_slider(self.music_raw.max(25)) {
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
        // Restore the user's real Windows desktop (or solid backdrop if Clear Screen First is checked)
        restore_or_clear(ctx.surface, &self.saved_bg, self.clear_first, 0x0026_1A12);

        let Some(anim) = &self.anim else {
            return AdResult::NoError;
        };

        // Swinging Old West Saloon entrance (`OFst #5000` frame 89 draws the saloon doors + Sam entering!)
        anim.draw_anchored_bottom(ctx.surface, 89, 138, h - 32, 1, false);

        for hole in &self.holes {
            if let Some(sp) = anim.sprites.get(hole.sprite_idx) {
                sp.blit(ctx.surface, hole.x, hole.y);
            } else {
                fill_circle_px(ctx.surface, hole.x, hole.y, 5, 0x0010_1014);
                fill_circle_px(ctx.surface, hole.x, hole.y, 2, 0x0078_7888);
            }
        }

        let fire_period = (45 - (self.temper_raw / 3)).max(12) as u32;
        if self.tick % fire_period == 0 {
            if self.holes.len() >= 22 {
                self.holes.remove(0);
            }
            let spread = (220 - (self.aim_raw * 140) / 100).max(20);
            let hx = (w / 2 + ctx.rng.rand_mod(spread * 2) - spread).clamp(32, w - 48);
            let hy = (h / 2 - 40 + ctx.rng.rand_mod(spread) - spread / 2).clamp(32, h - 120);
            self.holes.push(BulletHole {
                x: hx,
                y: hy,
                sprite_idx: 56 + (ctx.rng.rand_mod(6) as usize),
            });
            looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, YOSEMITE_VOICES[2]);
        }

        self.frame_idx =
            advance_filtered_range(anim, self.frame_idx, 163, 714, 48, 52, 220, 220);

        self.sam_x += self.vx;
        if self.sam_x < 240.0 || self.sam_x > (w - 100) as f32 {
            self.vx = -self.vx;
        }

        anim.draw_anchored_bottom(
            ctx.surface,
            self.frame_idx,
            self.sam_x as i32,
            self.sam_y as i32,
            1,
            false,
        );

        if self.tick % 85 == 0 {
            let vid = YOSEMITE_VOICES[(self.tick as usize / 85) % YOSEMITE_VOICES.len()];
            looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, vid);
        }

        AdResult::NoError
    }
}
