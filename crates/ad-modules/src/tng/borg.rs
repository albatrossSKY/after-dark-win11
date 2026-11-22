//! *The Borg* — 1994 *Star Trek: The Next Generation* After Dark 3.0 Module.
//!
//! Borg drones (`OFst/OFtb #9000`, 277 frames) beam onto your desktop and
//! methodically assimilate your screen into Borg circuitry (`RLEP #9001`, 49
//! authentic `32x32` Borg hull/circuit tiles!) while Locutus speaks
//! "I am Locutus of Borg" / "Resistance is futile" with TNG Suspense MIDI!

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::simpsons::{
    CompoundAnim, RlepBank, draw_line_px, music_loops_from_slider, restore_or_clear,
};
use super::{
    MOD_BORG, SND_BORG_BEAM, SND_BORG_FUTILE, SND_BORG_LOCUTUS, SND_BORG_MECH, SND_BORG_ONE_WITH,
    SONG_TNG_SUSPENSE, load_anim, load_rlep, tng_pack,
};

struct BorgDrone {
    x: f32,
    y: f32,
    vx: f32,
    vy: f32,
    frame_idx: usize,
    beam_in: usize,
    laser_ticks: usize,
    assimilate_cooldown: usize,
}

const BORG_VOICES: &[i16] = &[
    SND_BORG_LOCUTUS,
    SND_BORG_ONE_WITH,
    SND_BORG_FUTILE,
    SND_BORG_MECH,
];

pub struct TheBorgModule {
    anim: Option<CompoundAnim>,
    tiles: RlepBank,
    saved_bg: Vec<u32>,
    canvas_buf: Vec<u32>,
    clear_screen: bool,
    drones: Vec<BorgDrone>,
    tick: usize,
    scale: i32,
}

impl TheBorgModule {
    pub fn new() -> Self {
        Self {
            anim: None,
            tiles: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            saved_bg: Vec::new(),
            canvas_buf: Vec::new(),
            clear_screen: false,
            drones: Vec::new(),
            tick: 0,
            scale: 1,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "tng_borg".to_string(),
            name: "The Borg".to_string(),
            filename: "BORG.AD".to_string(),
            credit: "By Dana, Chris, Michael, Rat & Stuart.\nSoftware © 1994 Berkeley Systems, Inc.\nStar Trek: TNG ™ & © Paramount Pictures.".to_string(),
            about: "Resistance is futile. Borg drones beam onto your desktop and methodically assimilate your screen into Borg Collective circuitry while Locutus broadcasts across subspace.".to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "Population:".to_string(),
                    default_raw: 52,
                    labels: vec![
                        "One".into(),
                        "Two".into(),
                        "Three".into(),
                        "Four".into(),
                        "Five".into(),
                        "Six".into(),
                        "Seven".into(),
                        "Eight".into(),
                    ],
                    thresholds: vec![0, 13, 26, 39, 52, 65, 78, 91],
                },
                AdControl::LabeledSlider {
                    title: "Music:".to_string(),
                    default_raw: 33,
                    labels: vec![
                        "None".into(),
                        "Once".into(),
                        "Twice".into(),
                        "Thrice".into(),
                        "Always".into(),
                    ],
                    thresholds: vec![0, 21, 42, 63, 84],
                },
                AdControl::Checkbox {
                    title: "Clear Screen First".to_string(),
                    default_checked: false,
                },
                AdControl::None,
            ],
            target_frame_ms: 68,
        }
    }

    fn stamp_borg_tile(&mut self, w: i32, h: i32, gx: i32, gy: i32, rng: &mut ad_sdk::MsvcRand) {
        if self.tiles.frames.is_empty() || self.canvas_buf.len() != (w * h) as usize {
            return;
        }
        let ti = rng.rand_mod(self.tiles.frames.len() as i32) as usize;
        let tile = &self.tiles.frames[ti];
        let s = self.scale;
        let sx0 = (gx / (32 * s)) * (32 * s);
        let sy0 = (gy / (32 * s)) * (32 * s);
        for ty in 0..tile.h {
            let srow = (ty * tile.w) as usize;
            for tx in 0..tile.w {
                let c = tile.pixels[srow + tx as usize];
                if c == 0 {
                    continue;
                }
                let rgb = c & 0x00FF_FFFF;
                for oy in 0..s {
                    let py = sy0 + ty * s + oy;
                    if py < 0 || py >= h {
                        continue;
                    }
                    let drow = (py * w) as usize;
                    for ox in 0..s {
                        let px = sx0 + tx * s + ox;
                        if px >= 0 && px < w {
                            self.canvas_buf[drow + px as usize] = rgb;
                        }
                    }
                }
            }
        }
    }
}

impl Default for TheBorgModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for TheBorgModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        if self.anim.is_none() {
            self.anim = Some(load_anim(MOD_BORG, 9000));
            self.tiles = load_rlep(MOD_BORG, 9001);
        }
        self.saved_bg = ctx.surface.pixels().to_vec();
        let pop_raw = ctx.module.raw_control_value[0].clamp(0, 100);
        let num_drones = (1 + pop_raw / 13).clamp(1, 8) as usize;
        self.clear_screen = ctx.module.raw_control_value[2] != 0;
        self.scale = if ctx.surface.width >= 1000 { 2 } else { 1 };
        self.tick = 0;

        let w = ctx.surface.width;
        let h = ctx.surface.height;
        self.canvas_buf.resize((w * h) as usize, 0);
        if self.clear_screen || self.saved_bg.len() != self.canvas_buf.len() {
            self.canvas_buf.fill(0x0006_0C08);
        } else {
            self.canvas_buf.copy_from_slice(&self.saved_bg);
        }

        self.drones.clear();
        for i in 0..num_drones {
            let x = (40 + ctx.rng.rand_mod((w - 80).max(20))) as f32;
            let y = (80 + ctx.rng.rand_mod((h - 100).max(20))) as f32;
            let dir = if (i & 1) == 0 { 1.0 } else { -1.0 };
            self.drones.push(BorgDrone {
                x,
                y,
                vx: dir * (1.8 + (i as f32) * 0.25) * self.scale as f32,
                vy: ((ctx.rng.rand_mod(5) - 2) as f32) * 0.45 * self.scale as f32,
                frame_idx: (i * 37) % 270,
                beam_in: 14 + i * 4,
                laser_ticks: 0,
                assimilate_cooldown: 10 + i * 5,
            });
        }

        let pack = tng_pack();
        if let Some(loops) = music_loops_from_slider(ctx.module.raw_control_value[1]) {
            pack.play_music(ctx.sound, ctx.system.sound_enabled, SONG_TNG_SUSPENSE, loops);
        }
        pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_BORG_LOCUTUS);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        restore_or_clear(ctx.surface, &self.saved_bg, self.clear_screen, 0x0006_0C08);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.tick = self.tick.wrapping_add(1);
        let w = ctx.surface.width;
        let h = ctx.surface.height;
        let s = self.scale;
        let pack = tng_pack();

        let n_frames = self.anim.as_ref().map(|a| a.frames.len()).unwrap_or(1).max(1);
        let mut to_assimilate = Vec::new();

        for d in &mut self.drones {
            if d.beam_in > 0 {
                d.beam_in -= 1;
                if d.beam_in == 8 {
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_BORG_BEAM);
                }
                continue;
            }
            d.frame_idx = (d.frame_idx + 1) % n_frames;
            d.x += d.vx;
            d.y += d.vy;
            if d.x < 30.0 * s as f32 {
                d.x = 30.0 * s as f32;
                d.vx = d.vx.abs();
            } else if d.x > (w - 30 * s) as f32 {
                d.x = (w - 30 * s) as f32;
                d.vx = -d.vx.abs();
            }
            if d.y < 90.0 * s as f32 {
                d.y = 90.0 * s as f32;
                d.vy = d.vy.abs();
            } else if d.y > (h - 12 * s) as f32 {
                d.y = (h - 12 * s) as f32;
                d.vy = -d.vy.abs();
            }

            if d.laser_ticks > 0 {
                d.laser_ticks -= 1;
            }
            if d.assimilate_cooldown > 0 {
                d.assimilate_cooldown -= 1;
            } else {
                d.assimilate_cooldown = 16 + ctx.rng.rand_mod(18) as usize;
                d.laser_ticks = 8;
                let tx = d.x as i32 + if d.vx >= 0.0 { 32 * s } else { -32 * s };
                let ty = d.y as i32 - 52 * s;
                to_assimilate.push((tx, ty));
            }
        }

        for (tx, ty) in to_assimilate {
            self.stamp_borg_tile(w, h, tx, ty, ctx.rng);
        }

        if self.tick % 96 == 48 {
            let v = BORG_VOICES[ctx.rng.rand_mod(BORG_VOICES.len() as i32) as usize];
            pack.play_voice(ctx.sound, ctx.system.sound_enabled, v);
        }

        if self.canvas_buf.len() == ctx.surface.pixels().len() {
            ctx.surface.pixels_mut().copy_from_slice(&self.canvas_buf);
        }

        if let Some(anim) = &self.anim {
            for d in &self.drones {
                let cx = d.x as i32;
                let by = d.y as i32;
                if d.beam_in > 0 {
                    // Emerald Borg transporter beam shimmer!
                    for _k in 0..18 {
                        let rx = cx + ctx.rng.rand_mod(38 * s) - 19 * s;
                        let ry = by - ctx.rng.rand_mod(105 * s);
                        draw_line_px(ctx.surface, rx, ry, rx, ry + 6 * s, 0x0048_FF78, s);
                    }
                } else {
                    anim.draw_anchored_bottom(ctx.surface, d.frame_idx, cx, by, s, d.vx < 0.0);
                    // Green Borg assimilation scanner beam!
                    if d.laser_ticks > 0 {
                        let ex = cx + if d.vx >= 0.0 { 8 * s } else { -8 * s };
                        let ey = by - 94 * s;
                        let tx = cx + if d.vx >= 0.0 { 44 * s } else { -44 * s };
                        let ty = by - 54 * s;
                        draw_line_px(ctx.surface, ex, ey, tx, ty, 0x0030_FF58, (2 * s).max(2));
                    }
                }
            }
        }

        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        self.drones.clear();
        self.canvas_buf.clear();
        self.saved_bg.clear();
        AdResult::NoError
    }
}
