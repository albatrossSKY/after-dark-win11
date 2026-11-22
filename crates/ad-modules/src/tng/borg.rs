//! *The Borg* — 1994 *Star Trek: The Next Generation* After Dark 3.0 Module.
//!
//! Borg drones (`OFst/OFtb #9000`, filtered cleanly to full walking/scanning
//! drone frames so they never glitch into `32x32` tile frames!) beam directly
//! onto your real Windows desktop and assimilate contiguous Borg Collective
//! circuitry clusters (`RLEP #9001`, 49 authentic `32x32` Borg hull tiles)
//! scaled proportionally for modern HD/4K monitors while Locutus broadcasts!

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
    frame_pos: usize,
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
    drone_frames: Vec<usize>, // strictly full Borg drone poses (h >= 96), excluding 32x32 tiles!
    tiles: RlepBank,
    saved_bg: Vec<u32>,
    canvas_buf: Vec<u32>,
    clear_screen: bool,
    drones: Vec<BorgDrone>,
    tick: usize,
    scale_f: f32,
    tile_scale: i32,
}

impl TheBorgModule {
    pub fn new() -> Self {
        Self {
            anim: None,
            drone_frames: Vec::new(),
            tiles: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            saved_bg: Vec::new(),
            canvas_buf: Vec::new(),
            clear_screen: false,
            drones: Vec::new(),
            tick: 0,
            scale_f: 1.0,
            tile_scale: 1,
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

    fn ensure_loaded(&mut self) {
        if self.anim.is_some() {
            return;
        }
        let anim = load_anim(MOD_BORG, 9000);
        // Filter strictly to full Borg drone character frames (height >= 96, index < 226)
        // so drones never glitch into standalone 32x32 Borg tiles (frames 226..276)!
        self.drone_frames = anim
            .frames
            .iter()
            .enumerate()
            .take(226)
            .filter(|(_, cf)| (cf.bottom - cf.top) >= 96 && !cf.parts.is_empty())
            .map(|(i, _)| i)
            .collect();
        if self.drone_frames.is_empty() && !anim.frames.is_empty() {
            self.drone_frames.push(0);
        }
        self.anim = Some(anim);
        self.tiles = load_rlep(MOD_BORG, 9001);
    }

    fn stamp_borg_tile(&mut self, w: i32, h: i32, gx: i32, gy: i32, rng: &mut ad_sdk::MsvcRand) {
        if self.tiles.frames.is_empty() || self.canvas_buf.len() != (w * h) as usize {
            return;
        }
        let s = self.tile_scale;
        let step = 32 * s;
        let base_cx = (gx / step) * step;
        let base_cy = (gy / step) * step;
        // Stamp primary tile + occasional adjacent neighbor so Borg circuitry grows in organic clusters!
        let offsets = [(0, 0), (step, 0), (0, step)];
        let count = if rng.rand_mod(3) == 0 { 2 } else { 1 };
        for &(ox_t, oy_t) in offsets.iter().take(count) {
            let sx0 = base_cx + ox_t;
            let sy0 = base_cy + oy_t;
            let ti = rng.rand_mod(self.tiles.frames.len() as i32) as usize;
            let tile = &self.tiles.frames[ti];
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
        self.ensure_loaded();
        self.saved_bg = ctx.surface.pixels().to_vec();
        let pop_raw = ctx.module.raw_control_value[0].clamp(0, 100);
        let num_drones = (1 + pop_raw / 13).clamp(1, 8) as usize;
        self.clear_screen = ctx.module.raw_control_value[2] != 0;

        let w = ctx.surface.width;
        let h = ctx.surface.height;
        self.scale_f = (h as f32 / 480.0).clamp(1.0, 3.2);
        self.tile_scale = ((h + 240) / 540).clamp(1, 3);
        self.tick = 0;

        self.canvas_buf.resize((w * h) as usize, 0);
        if self.clear_screen || self.saved_bg.len() != self.canvas_buf.len() {
            self.canvas_buf.fill(0x0006_0C08);
        } else {
            self.canvas_buf.copy_from_slice(&self.saved_bg);
        }

        let nf = self.drone_frames.len().max(1);
        self.drones.clear();
        for i in 0..num_drones {
            let x = (w / 10 + ctx.rng.rand_mod((w * 8 / 10).max(20))) as f32;
            let y = (h / 5 + ctx.rng.rand_mod((h * 7 / 10).max(20))) as f32;
            let dir = if (i & 1) == 0 { 1.0 } else { -1.0 };
            self.drones.push(BorgDrone {
                x,
                y,
                vx: dir * (1.8 + (i as f32) * 0.22) * self.scale_f,
                vy: ((ctx.rng.rand_mod(5) - 2) as f32) * 0.42 * self.scale_f,
                frame_pos: (i * 29) % nf,
                beam_in: 14 + i * 4,
                laser_ticks: 0,
                assimilate_cooldown: 10 + i * 4,
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
        let sf = self.scale_f;
        let pack = tng_pack();

        let nf = self.drone_frames.len().max(1);
        let mut to_assimilate = Vec::new();

        for d in &mut self.drones {
            if d.beam_in > 0 {
                d.beam_in -= 1;
                if d.beam_in == 8 {
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_BORG_BEAM);
                }
                continue;
            }
            d.frame_pos = (d.frame_pos + 1) % nf;
            d.x += d.vx;
            d.y += d.vy;
            let margin_x = 34.0 * sf;
            if d.x < margin_x {
                d.x = margin_x;
                d.vx = d.vx.abs();
            } else if d.x > w as f32 - margin_x {
                d.x = w as f32 - margin_x;
                d.vx = -d.vx.abs();
            }
            if d.y < 116.0 * sf {
                d.y = 116.0 * sf;
                d.vy = d.vy.abs();
            } else if d.y > h as f32 - 12.0 * sf {
                d.y = h as f32 - 12.0 * sf;
                d.vy = -d.vy.abs();
            }

            if d.laser_ticks > 0 {
                d.laser_ticks -= 1;
            }
            if d.assimilate_cooldown > 0 {
                d.assimilate_cooldown -= 1;
            } else {
                d.assimilate_cooldown = 14 + ctx.rng.rand_mod(16) as usize;
                d.laser_ticks = 9;
                let tx = d.x as i32 + ((if d.vx >= 0.0 { 36.0 } else { -36.0 }) * sf) as i32;
                let ty = d.y as i32 - (56.0 * sf) as i32;
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
                    let thick = sf.round().max(1.0) as i32;
                    for _k in 0..20 {
                        let rx = cx + ctx.rng.rand_mod((42.0 * sf).max(12.0) as i32) - (21.0 * sf) as i32;
                        let ry = by - ctx.rng.rand_mod((112.0 * sf).max(32.0) as i32);
                        draw_line_px(ctx.surface, rx, ry, rx, ry + (7.0 * sf) as i32, 0x0048_FF78, thick);
                    }
                } else {
                    let fi = self.drone_frames[d.frame_pos % self.drone_frames.len()];
                    anim.draw_anchored_bottom_f(ctx.surface, fi, cx, by, sf, d.vx < 0.0, true, false);
                    // Glowing green Borg assimilation scanner laser!
                    if d.laser_ticks > 0 {
                        let ex = cx + ((if d.vx >= 0.0 { 8.0 } else { -8.0 }) * sf) as i32;
                        let ey = by - (96.0 * sf) as i32;
                        let tx = cx + ((if d.vx >= 0.0 { 48.0 } else { -48.0 }) * sf) as i32;
                        let ty = by - (54.0 * sf) as i32;
                        draw_line_px(
                            ctx.surface,
                            ex,
                            ey,
                            tx,
                            ty,
                            0x0030_FF58,
                            (sf * 2.2).round().max(2.0) as i32,
                        );
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
