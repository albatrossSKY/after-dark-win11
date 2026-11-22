//! *Nanites* — 1994 *Star Trek: The Next Generation* After Dark 3.0 Module.
//!
//! Wesley Crusher's evolving sub-microscopic nanites (`OFst/OFtb #8000`)
//! properly separated into crawling nanites (`f[0..39]`), replicating mitosis
//! animations (`f[40..79]`), and evolved cybernetic circuit junction nodes
//! (`f[80..135]`), scaled cleanly for modern HD/4K widescreen displays!

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::simpsons::{CompoundAnim, put_px, restore_or_clear};
use super::{MOD_NANITES, SND_BEEP4, SND_BEEP5, load_anim, tng_pack};

struct Nanite {
    x: f32,
    y: f32,
    vx: f32,
    vy: f32,
    frame_phase: usize,
    trail_col: u32,
    age: usize,
    mitosis_ticks: usize, // >0 while actively dividing (plays f[40..79]!)
}

const NANITE_TRAILS: [u32; 4] = [
    0x0018_B8C8, // Cyan-blue circuit trace
    0x0024_D864, // Emerald bio-trace
    0x00A4_48E8, // Violet neural link
    0x0038_88FF, // Sub-processor blue
];

pub struct NanitesModule {
    anim: Option<CompoundAnim>,
    saved_bg: Vec<u32>,
    canvas_buf: Vec<u32>,
    clear_screen: bool,
    nanites: Vec<Nanite>,
    speed: f32,
    rep_chance: i32,
    tick: usize,
    scale_f: f32,
    trail_rad: i32,
}

impl NanitesModule {
    pub fn new() -> Self {
        Self {
            anim: None,
            saved_bg: Vec::new(),
            canvas_buf: Vec::new(),
            clear_screen: true,
            nanites: Vec::new(),
            speed: 3.0,
            rep_chance: 50,
            tick: 0,
            scale_f: 1.0,
            trail_rad: 1,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "tng_nanites".to_string(),
            name: "Nanites".to_string(),
            filename: "NANITES.AD".to_string(),
            credit: "By E. Gibbs, R. Ho, D. Muise & D. Zimmerman.\nSoftware © 1994 Berkeley Systems, Inc.\nStar Trek: TNG ™ & © Paramount Pictures.".to_string(),
            about: "Nanites are sub-microscopic robots escaped from Wesley Crusher's lab that evolve, weave glowing cybernetic traces, and replicate across your screen!".to_string(),
            controls: [
                AdControl::Checkbox {
                    title: "Clear Screen First".to_string(),
                    default_checked: true,
                },
                AdControl::LabeledSlider {
                    title: "Speed:".to_string(),
                    default_raw: 33,
                    labels: vec!["Slow".into(), "Medium".into(), "Fast".into()],
                    thresholds: vec![0, 33, 66],
                },
                AdControl::LabeledSlider {
                    title: "Replication:".to_string(),
                    default_raw: 50,
                    labels: vec![
                        "Never".into(),
                        "Seldom".into(),
                        "Often".into(),
                        "Frenzy".into(),
                    ],
                    thresholds: vec![0, 25, 50, 75],
                },
                AdControl::None,
            ],
            target_frame_ms: 52,
        }
    }

    fn spawn_nanite(x: f32, y: f32, speed: f32, rng: &mut ad_sdk::MsvcRand) -> Nanite {
        let dir = (rng.rand_mod(8) as f32) * std::f32::consts::FRAC_PI_4;
        Nanite {
            x,
            y,
            vx: dir.cos() * speed,
            vy: dir.sin() * speed,
            frame_phase: rng.rand_mod(40) as usize,
            trail_col: NANITE_TRAILS[rng.rand_mod(NANITE_TRAILS.len() as i32) as usize],
            age: 0,
            mitosis_ticks: 0,
        }
    }

    fn stamp_junction_node(&mut self, w: i32, h: i32, cx: i32, cy: i32, node_fi: usize) {
        let Some(anim) = &self.anim else {
            return;
        };
        let Some(cf) = anim.frames.get(node_fi) else {
            return;
        };
        let s = self.scale_f.round().clamp(1.0, 3.0) as i32;
        for part in &cf.parts {
            if let Some(sp) = anim.sprites.get(part.sprite_idx) {
                let dx0 = cx - (sp.w * s) / 2;
                let dy0 = cy - (sp.h * s) / 2;
                for sy in 0..sp.h {
                    let srow = (sy * sp.w) as usize;
                    for sx in 0..sp.w {
                        let c = sp.pixels[srow + sx as usize];
                        if c == 0 {
                            continue;
                        }
                        let rgb = c & 0x00FF_FFFF;
                        for oy in 0..s {
                            let py = dy0 + sy * s + oy;
                            if py < 0 || py >= h {
                                continue;
                            }
                            let drow = (py * w) as usize;
                            for ox in 0..s {
                                let px = dx0 + sx * s + ox;
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
}

impl Default for NanitesModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for NanitesModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        if self.anim.is_none() {
            self.anim = Some(load_anim(MOD_NANITES, 8000));
        }
        self.saved_bg = ctx.surface.pixels().to_vec();
        self.clear_screen = ctx.module.raw_control_value[0] != 0;
        let spd_raw = ctx.module.raw_control_value[1].clamp(0, 100);
        self.speed = 2.2 + (spd_raw as f32 / 100.0) * 4.5;
        self.rep_chance = ctx.module.raw_control_value[2].clamp(0, 100);

        let w = ctx.surface.width;
        let h = ctx.surface.height;
        self.scale_f = (h as f32 / 480.0).clamp(1.0, 2.8);
        self.trail_rad = (h / 460).clamp(1, 3);
        self.tick = 0;

        self.canvas_buf.resize((w * h) as usize, 0);
        if self.clear_screen || self.saved_bg.len() != self.canvas_buf.len() {
            self.canvas_buf.fill(0x0004_0814);
        } else {
            self.canvas_buf.copy_from_slice(&self.saved_bg);
        }

        let init_count = ((w * h) / 65000).clamp(6, 14) as usize;
        self.nanites.clear();
        for _ in 0..init_count {
            let x = 40.0 + ctx.rng.rand_mod((w - 80).max(20)) as f32;
            let y = 40.0 + ctx.rng.rand_mod((h - 80).max(20)) as f32;
            self.nanites
                .push(Self::spawn_nanite(x, y, self.speed * self.scale_f, ctx.rng));
        }
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        restore_or_clear(ctx.surface, &self.saved_bg, self.clear_screen, 0x0004_0814);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.tick = self.tick.wrapping_add(1);
        let w = ctx.surface.width;
        let h = ctx.surface.height;
        let wf = w as f32;
        let hf = h as f32;
        let sf = self.scale_f;
        let tr = self.trail_rad;

        let mut babies = Vec::new();
        let mut junctions = Vec::new();
        let max_nanites = ((w * h) / 28000).clamp(24, 52) as usize;
        let cur_len = self.nanites.len();

        for n in &mut self.nanites {
            n.age += 1;
            if n.mitosis_ticks > 0 {
                n.mitosis_ticks -= 1;
            }
            // Right-angle / 45-degree circuit turns like evolving nanites building a computer core!
            if ctx.rng.rand_mod(26) == 0 {
                let spd = (n.vx * n.vx + n.vy * n.vy).sqrt().max(1.5);
                let dir = ctx.rng.rand_mod(8) as f32 * std::f32::consts::FRAC_PI_4;
                n.vx = dir.cos() * spd;
                n.vy = dir.sin() * spd;
                // Stamp an authentic 15x15 evolved cybernetic circuit node (f[80..135]) at circuit turns!
                junctions.push((n.x as i32, n.y as i32, 80 + (ctx.rng.rand_mod(52) as usize)));
            }
            n.x += n.vx;
            n.y += n.vy;
            let pad = 20.0 * sf;
            if n.x < pad || n.x > wf - pad {
                n.vx = -n.vx;
                n.x = n.x.clamp(pad, (wf - pad).max(pad));
            }
            if n.y < pad || n.y > hf - pad {
                n.vy = -n.vy;
                n.y = n.y.clamp(pad, (hf - pad).max(pad));
            }

            // Leave glowing cybernetic trace scaled cleanly to monitor resolution
            let px = (n.x as i32).clamp(tr, (w - 1 - tr).max(tr));
            let py = (n.y as i32).clamp(tr, (h - 1 - tr).max(tr));
            if self.canvas_buf.len() == (w * h) as usize {
                for oy in -tr..=tr {
                    let drow = ((py + oy) * w) as usize;
                    for ox in -tr..=tr {
                        let ix = drow + (px + ox) as usize;
                        if ix < self.canvas_buf.len() {
                            self.canvas_buf[ix] = n.trail_col;
                        }
                    }
                }
            }

            // Replicate cleanly with mitosis animation (f[40..79])!
            if self.rep_chance >= 20
                && cur_len + babies.len() < max_nanites
                && n.age > 36
                && ctx.rng.rand_mod(200) < self.rep_chance / 3
            {
                n.age = 0;
                n.mitosis_ticks = 18;
                babies.push(Self::spawn_nanite(n.x, n.y, self.speed * sf, ctx.rng));
            }
        }

        for (jx, jy, jfi) in junctions {
            self.stamp_junction_node(w, h, jx, jy, jfi);
        }

        if !babies.is_empty() {
            self.nanites.extend(babies);
            let snd = if ctx.rng.rand_mod(2) == 0 {
                SND_BEEP4
            } else {
                SND_BEEP5
            };
            tng_pack().play_voice(ctx.sound, ctx.system.sound_enabled, snd);
        }

        if self.canvas_buf.len() == ctx.surface.pixels().len() {
            ctx.surface.pixels_mut().copy_from_slice(&self.canvas_buf);
        }

        // Render crawling nanites (f[0..39]) and active dividing nanites (f[40..79]) cleanly!
        if let Some(anim) = &self.anim {
            let n_total = anim.frames.len().max(1);
            for n in &self.nanites {
                let fi = if n.mitosis_ticks > 0 && n_total >= 80 {
                    40 + ((18 - n.mitosis_ticks) * 2) % 40
                } else {
                    (self.tick / 2 + n.frame_phase) % 40.min(n_total)
                };
                if let Some(cf) = anim.frames.get(fi) {
                    let fw = ((cf.right - cf.left).max(1) as f32 * sf).round() as i32;
                    let fh = ((cf.bottom - cf.top).max(1) as f32 * sf).round() as i32;
                    anim.draw_frame_f(
                        ctx.surface,
                        fi,
                        n.x as i32 - fw / 2,
                        n.y as i32 - fh / 2,
                        sf,
                        n.vx < 0.0,
                        true,
                        false,
                    );
                }
                put_px(ctx.surface, n.x as i32, n.y as i32, 0x00FF_FFFF);
            }
        }

        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        self.nanites.clear();
        self.canvas_buf.clear();
        self.saved_bg.clear();
        AdResult::NoError
    }
}
