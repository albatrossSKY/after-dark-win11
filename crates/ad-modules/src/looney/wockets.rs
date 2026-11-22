//! "Wockets' Wed Gware" — Classic 1995 *Looney Tunes* After Dark 3.0 module.
//!
//! *"Ooooh! Aaaah!"* Looney Tunes spectators (`RLEP #10001` frames `37..=45`)
//! watch from the bottom of the screen as rockets launch into the night sky and
//! explode into 24 glowing Looney Tunes character-face constellations (`RLEP #10000`
//! frames `12..=28` & `RLEP #10001` frames `30..=36`) and `SPrK #10000..#10023`
//! particle bursts, illuminating the spectators below with `FIREWORKS_SFX`
//! (`#15300..#15305`) and the *Wockets' Wed Gware* MIDI theme (`#20`).

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::looney::{
    FIREWORKS_SFX, MOD_WOCKETS, SONG_WOCKETS, load_multi_rlep, looney_pack,
};
use crate::simpsons::{KIND_SPRK, RlepBank, fill_circle_px, music_loops_from_slider};

const FIREWORK_COLORS: &[u32] = &[
    0xFF40_40, // Brilliant Red
    0x40C8_FF, // Sky Cyan
    0xFFE0_40, // Gold
    0x50FF_70, // Emerald Green
    0xFF68_E0, // Magenta
    0xFF98_30, // Amber Orange
];

const CHAR_BURST_IDS: &[usize] = &[
    12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 30, 31, 32, 33, 34, 35, 36,
];

struct FireworkBurst {
    x: i32,
    y: i32,
    age: u32,
    max_age: u32,
    color: u32,
    char_sprite: usize,
    sprk_idx: usize,
}

pub struct WocketsModule {
    fireworks_raw: i32,
    spectators_raw: i32,
    music_raw: i32,
    bank: Option<RlepBank>,
    sprks: Vec<Vec<(u8, u8, u8)>>,
    bursts: Vec<FireworkBurst>,
    tick: u32,
}

impl WocketsModule {
    pub fn new() -> Self {
        Self {
            fireworks_raw: 34,
            spectators_raw: 52,
            music_raw: 21,
            bank: None,
            sprks: Vec::new(),
            bursts: Vec::new(),
            tick: 0,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "looney_wockets".to_string(),
            name: "Wockets' Wed Gware".to_string(),
            filename: "WOCKETS.AD".to_string(),
            credit: "By Peter A. Kemmer.\nSoftware © 1995 Berkeley Systems, Inc.\nLooney Tunes ™ & © Warner Bros.".to_string(),
            about: "Ooooh! Aaaah! Watch a dazzling Looney Tunes fireworks display with Bugs, Daffy, Elmer Fudd, and friends silhouetted against the night sky.".to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "Fireworks:".to_string(),
                    default_raw: 34,
                    labels: vec!["Few".into(), "Normal".into(), "Many".into(), "Finale".into()],
                    thresholds: vec![0, 25, 50, 75],
                },
                AdControl::LabeledSlider {
                    title: "Spectators:".to_string(),
                    default_raw: 52,
                    labels: vec!["Few".into(), "Some".into(), "Crowd".into()],
                    thresholds: vec![0, 33, 66],
                },
                AdControl::LabeledSlider {
                    title: "Music:".to_string(),
                    default_raw: 21,
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
        if self.bank.is_none() {
            self.bank = Some(load_multi_rlep(MOD_WOCKETS, &[10000, 10001]));
        }
        if self.sprks.is_empty() {
            for rid in 10000..=10023 {
                if let Some(raw) = looney_pack().get(MOD_WOCKETS, KIND_SPRK, rid) {
                    if raw.len() >= 2 {
                        let cnt = u16::from_be_bytes([raw[0], raw[1]]) as usize;
                        let mut pts = Vec::with_capacity(cnt);
                        for i in 0..cnt {
                            let o = 2 + i * 3;
                            if o + 3 <= raw.len() {
                                pts.push((raw[o], raw[o + 1], raw[o + 2]));
                            }
                        }
                        self.sprks.push(pts);
                    }
                }
            }
        }
    }

    fn spawn_burst(&mut self, w: i32, h: i32, seed: usize) {
        let idx = seed % CHAR_BURST_IDS.len();
        let char_sprite = CHAR_BURST_IDS[idx];
        let color = FIREWORK_COLORS[seed % FIREWORK_COLORS.len()];
        let bx = 110 + ((seed as i32 * 137) % (w - 220).max(60));
        let by = 95 + ((seed as i32 * 83) % (h - 240).max(50));
        let sprk_idx = if self.sprks.is_empty() {
            0
        } else {
            idx % self.sprks.len()
        };
        self.bursts.push(FireworkBurst {
            x: bx,
            y: by,
            age: 0,
            max_age: 48,
            color,
            char_sprite,
            sprk_idx,
        });
    }
}

impl Default for WocketsModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for WocketsModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();
        self.fireworks_raw = ctx.module.raw_control_value[0].clamp(0, 100);
        self.spectators_raw = ctx.module.raw_control_value[1].clamp(0, 100);
        self.music_raw = ctx.module.raw_control_value[2].clamp(0, 100);
        self.tick = 0;
        self.bursts.clear();
        let w = ctx.surface.width.max(320);
        let h = ctx.surface.height.max(240);
        for i in 0..3 {
            self.spawn_burst(w, h, i * 5 + 1);
            if let Some(last) = self.bursts.last_mut() {
                last.age = (i as u32) * 10 + 10;
                last.x = 140 + (i as i32) * ((w - 280).max(80) / 2);
                last.y = 115 + ((i as i32) % 2) * 45;
            }
        }
        ctx.surface.pixels_mut().fill(0x0002_040C);

        if let Some(loops) = music_loops_from_slider(self.music_raw.max(25)) {
            looney_pack().play_music(ctx.sound, ctx.system.sound_enabled, SONG_WOCKETS, loops);
        }
        looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, FIREWORKS_SFX[0]);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.surface.pixels_mut().fill(0x0002_040C);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();
        self.tick = self.tick.wrapping_add(1);

        let w = ctx.surface.width;
        let h = ctx.surface.height;
        ctx.surface.pixels_mut().fill(0x0002_040C);

        for i in 0..28 {
            let sx = (i * 197 + 43) % w;
            let sy = (i * 89 + 19) % (h - 120).max(60);
            fill_circle_px(ctx.surface, sx, sy, 1, 0x0050_6088);
        }

        let target_bursts = (2 + (self.fireworks_raw as usize * 4) / 100).clamp(2, 6);
        if self.bursts.len() < target_bursts && self.tick % 12 == 0 {
            let seed = (ctx.rng.rand_mod(1000) as usize).wrapping_add(self.tick as usize);
            self.spawn_burst(w, h, seed);
            let sfx = FIREWORKS_SFX[(self.tick as usize / 12) % FIREWORKS_SFX.len()];
            looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, sfx);
        }

        let Some(bank) = &self.bank else {
            return AdResult::NoError;
        };

        let mut dominant_color = 0xFF40_40u32;

        for b in &mut self.bursts {
            b.age += 1;
            dominant_color = b.color;

            if b.age < 8 {
                let ry = h - 90 - ((h - 90 - b.y) * (b.age as i32)) / 8;
                if let Some(rk) = bank.frames.first() {
                    rk.blit_tinted(ctx.surface, b.x - rk.w / 2, ry, b.color, 1);
                }
            } else {
                if let Some(ch_sp) = bank.frames.get(b.char_sprite) {
                    let drop = ((b.age.saturating_sub(8)) as i32) / 3;
                    ch_sp.blit_tinted(
                        ctx.surface,
                        b.x - ch_sp.w / 2,
                        b.y - ch_sp.h / 2 + drop,
                        b.color,
                        1,
                    );
                }

                let ring_stage = ((b.age - 8) / 4) as usize;
                if ring_stage <= 3 {
                    if let Some(ring) = bank.frames.get(2 + ring_stage) {
                        ring.blit_tinted(
                            ctx.surface,
                            b.x - ring.w / 2,
                            b.y - ring.h / 2,
                            0xFFFF_D0,
                            1,
                        );
                    }
                }

                if let Some(pts) = self.sprks.get(b.sprk_idx) {
                    let t = (b.age - 8) as f32 / 36.0;
                    let gravity = t * t * 38.0;
                    for &(ang_b, rad_b, kind_b) in pts.iter().step_by(2) {
                        let ang = (ang_b as f32) * std::f32::consts::TAU / 256.0;
                        let dist = (rad_b as f32) * 0.48 * t;
                        let px = b.x + (ang.cos() * dist) as i32;
                        let py = b.y + (ang.sin() * dist + gravity) as i32;
                        let sp_id = match kind_b {
                            0xAA => 10,
                            0x55 => 8,
                            _ => 7,
                        };
                        if let Some(sp) = bank.frames.get(sp_id) {
                            sp.blit_tinted(
                                ctx.surface,
                                px - sp.w / 2,
                                py - sp.h / 2,
                                b.color,
                                1,
                            );
                        }
                    }
                }
            }
        }

        self.bursts.retain(|b| b.age < b.max_age);

        let num_specs = ((self.spectators_raw * 9) / 100).clamp(1, 9) as usize;
        let spec_ids = [37usize, 38, 39, 40, 41, 42, 43, 44, 45];
        let spacing = w / (num_specs as i32 + 1).max(2);
        for (i, &sid) in spec_ids.iter().take(num_specs).enumerate() {
            if let Some(spec) = bank.frames.get(sid) {
                let sx = spacing * (i as i32 + 1) - spec.w / 2;
                let sy = h - spec.h;
                let tint =
                    FIREWORK_COLORS[(i + (self.tick as usize / 16)) % FIREWORK_COLORS.len()];
                let chosen = if i % 2 == 0 { dominant_color } else { tint };
                spec.blit_tinted(ctx.surface, sx, sy, chosen, 1);
            }
        }

        AdResult::NoError
    }
}
