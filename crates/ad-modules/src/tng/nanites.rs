//! *Nanites* — 1994 *Star Trek: The Next Generation* After Dark 3.0 Module.
//!
//! Wesley Crusher's evolving sub-microscopic nanites (`RLEP #8000`, 48 frames +
//! `OFst/OFtb #8000`) crawl across your desktop, leave glowing cybernetic circuit
//! trails, and replicate into a thriving swarm!

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
    scale: i32,
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
            scale: 1,
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
        let ang = (rng.rand_mod(360) as f32).to_radians();
        Nanite {
            x,
            y,
            vx: ang.cos() * speed,
            vy: ang.sin() * speed,
            frame_phase: rng.rand_mod(128) as usize,
            trail_col: NANITE_TRAILS[rng.rand_mod(NANITE_TRAILS.len() as i32) as usize],
            age: 0,
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
        self.speed = 2.0 + (spd_raw as f32 / 100.0) * 4.5;
        self.rep_chance = ctx.module.raw_control_value[2].clamp(0, 100);
        self.scale = if ctx.surface.width >= 1000 { 2 } else { 1 };
        self.tick = 0;

        let w = ctx.surface.width;
        let h = ctx.surface.height;
        self.canvas_buf.resize((w * h) as usize, 0);
        if self.clear_screen || self.saved_bg.len() != self.canvas_buf.len() {
            self.canvas_buf.fill(0x0004_0814);
        } else {
            self.canvas_buf.copy_from_slice(&self.saved_bg);
        }

        self.nanites.clear();
        for _ in 0..5 {
            let x = 40.0 + ctx.rng.rand_mod((w - 80).max(20)) as f32;
            let y = 40.0 + ctx.rng.rand_mod((h - 80).max(20)) as f32;
            self.nanites
                .push(Self::spawn_nanite(x, y, self.speed * self.scale as f32, ctx.rng));
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
        let s = self.scale;

        let mut babies = Vec::new();
        let max_nanites = 28usize;
        let cur_len = self.nanites.len();

        for n in &mut self.nanites {
            n.age += 1;
            // Subtle right-angle circuit turns like evolving nanites building a computer core!
            if ctx.rng.rand_mod(28) == 0 {
                let spd = (n.vx * n.vx + n.vy * n.vy).sqrt().max(1.5);
                let dir = ctx.rng.rand_mod(8) as f32 * (std::f32::consts::FRAC_PI_4);
                n.vx = dir.cos() * spd;
                n.vy = dir.sin() * spd;
            }
            n.x += n.vx;
            n.y += n.vy;
            if n.x < 16.0 || n.x > wf - 32.0 {
                n.vx = -n.vx;
                n.x = n.x.clamp(16.0, (wf - 32.0).max(16.0));
            }
            if n.y < 16.0 || n.y > hf - 32.0 {
                n.vy = -n.vy;
                n.y = n.y.clamp(16.0, (hf - 32.0).max(16.0));
            }

            // Leave glowing cybernetic trace on persistent canvas_buf
            let px = (n.x as i32).clamp(1, (w - 2).max(1));
            let py = (n.y as i32).clamp(1, (h - 2).max(1));
            if self.canvas_buf.len() == (w * h) as usize {
                for oy in -1..=1 {
                    for ox in -1..=1 {
                        let ix = ((py + oy) * w + (px + ox)) as usize;
                        if ix < self.canvas_buf.len() {
                            self.canvas_buf[ix] = n.trail_col;
                        }
                    }
                }
            }

            // Replicate when mature according to Replication slider!
            if self.rep_chance >= 20
                && cur_len + babies.len() < max_nanites
                && n.age > 40
                && ctx.rng.rand_mod(220) < self.rep_chance / 3
            {
                n.age = 0;
                babies.push(Self::spawn_nanite(n.x, n.y, self.speed * s as f32, ctx.rng));
            }
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

        // Draw animated nanites from RLEP #8000 / OFtb #8000
        if let Some(anim) = &self.anim {
            let n_frames = anim.frames.len().max(1);
            for n in &self.nanites {
                let fi = (self.tick / 2 + n.frame_phase) % n_frames;
                anim.draw_frame(
                    ctx.surface,
                    fi,
                    n.x as i32 - 18 * s,
                    n.y as i32 - 20 * s,
                    s,
                    n.vx < 0.0,
                    false,
                );
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
