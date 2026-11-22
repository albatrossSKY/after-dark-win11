//! *Simpsons Physics* — 1994 *The Simpsons* After Dark 3.0 Module.
//!
//! Basic laws of physics dictate natural attractions and repulsions — and the
//! Simpsons universe is no exception! Floating heads of all 19 Springfield
//! characters (`RLEP #5000..#5090`, plus darkened background heads `#5500`)
//! attract, repel, spin, look toward each other, and collide with cartoon sparks
//! and classic Springfield voice reactions.

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use super::{
    MOD_PHYSICS, RlepBank, SND_BART_DOIT, SND_HOMER_DOH, SND_NELSON_HAHA, SND_OOPS, SND_OTTO_WHOA,
    SND_PUNCH, SND_SPLAT, SimpsonsPack, SpriteFrame, fill_circle_px, fill_rect_px,
};

struct CharHeadFrames {
    frames: Vec<SpriteFrame>,
    group: i32, // affinity polarity / family group for fun attractions & repulsions
}

struct Body {
    char_idx: usize,
    x: f32,
    y: f32,
    vx: f32,
    vy: f32,
    radius: f32,
    hit_flash: usize,
    frame_phase: usize,
}

struct BgHead {
    sprite_idx: usize,
    x: f32,
    y: f32,
    vx: f32,
    vy: f32,
}

pub struct SimpsonsPhysicsModule {
    chars: Vec<CharHeadFrames>,
    bg_bank: RlepBank,
    bodies: Vec<Body>,
    bg_heads: Vec<BgHead>,
    tick: usize,
    scale: i32,
}

impl SimpsonsPhysicsModule {
    pub fn new() -> Self {
        Self {
            chars: Vec::new(),
            bg_bank: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            bodies: Vec::new(),
            bg_heads: Vec::new(),
            tick: 0,
            scale: 1,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        let choices = vec![
            "Random".into(),
            "Barney".into(),
            "Bart".into(),
            "Burns".into(),
            "Edna".into(),
            "Grampa".into(),
            "Homer".into(),
            "Lisa".into(),
            "Maggie".into(),
            "Marge".into(),
            "Maude".into(),
            "Milhouse".into(),
            "Ned".into(),
            "Nelson".into(),
            "Otto".into(),
            "Patty".into(),
            "Ralph".into(),
            "Selma".into(),
            "Skinner".into(),
            "Smithers".into(),
        ];
        AdMetadata {
            id: "simpsons_physics".to_string(),
            name: "Simpsons Physics".to_string(),
            credit: "By Matt Small and Ben Resner.\nSoftware © 1994 Berkeley Systems, Inc.\nThe Simpsons ™ & © Twentieth Century Fox.".to_string(),
            about: "Basic laws of physics dictate that all elements have natural attractions and repulsions. Watch 19 Springfield characters attract, repel, orbit, and collide across your screen!".to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "# of Characters:".to_string(),
                    default_raw: 62,
                    labels: vec![
                        "Two".into(),
                        "Few".into(),
                        "More".into(),
                        "Many".into(),
                        "All".into(),
                    ],
                    thresholds: vec![0, 25, 50, 75, 99],
                },
                AdControl::LabeledSlider {
                    title: "Backgrnd Chars:".to_string(),
                    default_raw: 50,
                    labels: vec![
                        "None".into(),
                        "1".into(),
                        "2".into(),
                        "3".into(),
                        "4".into(),
                        "5".into(),
                    ],
                    thresholds: vec![0, 20, 40, 60, 80, 100],
                },
                AdControl::Menu {
                    title: "Character 1:".to_string(),
                    default_index: 0,
                    choices: choices.clone(),
                },
                AdControl::Menu {
                    title: "Character 2:".to_string(),
                    default_index: 0,
                    choices,
                },
            ],
            target_frame_ms: 42,
            filename: "PHYSICS.AD".to_string(),
        }
    }

    fn ensure_loaded(&mut self) {
        if !self.chars.is_empty() {
            return;
        }
        // RLEP #5000..#5080 each hold 2 characters (~half frames each), #5090 holds 1 = 19 total!
        let mut all_chars = Vec::new();
        for bank_idx in 0..10 {
            let rid = 5000 + bank_idx * 10;
            let bank = RlepBank::load(MOD_PHYSICS, rid);
            let n = bank.frames.len();
            if bank_idx < 9 && n >= 8 {
                let mid = n / 2;
                let mut iter = bank.frames.into_iter();
                let first: Vec<SpriteFrame> = iter.by_ref().take(mid).collect();
                let second: Vec<SpriteFrame> = iter.collect();
                let g1 = (all_chars.len() as i32) % 4;
                all_chars.push(CharHeadFrames {
                    frames: first,
                    group: g1,
                });
                let g2 = (all_chars.len() as i32) % 4;
                all_chars.push(CharHeadFrames {
                    frames: second,
                    group: g2,
                });
            } else if n > 0 {
                let g = (all_chars.len() as i32) % 4;
                all_chars.push(CharHeadFrames {
                    frames: bank.frames,
                    group: g,
                });
            }
        }
        self.chars = all_chars;
        self.bg_bank = RlepBank::load(MOD_PHYSICS, 5500);
    }

    /// Springfield character pair force sign: `+1` attract, `-1` repel!
    fn pair_force_sign(&self, a: usize, b: usize) -> f32 {
        match (a.min(b), a.max(b)) {
            // Homer (5) & Marge (8), Burns (2) & Smithers (18), Lisa (6) & Maggie (7) strongly attract!
            (5, 8) | (2, 18) | (6, 7) | (0, 5) | (9, 11) => 1.6,
            // Homer (5) & Flanders (11), Bart (1) & Skinner (17), Homer (5) & Patty/Selma (14/16) strongly repel!
            (5, 11) | (1, 17) | (5, 14) | (5, 16) | (10, 12) => -1.7,
            _ => {
                let ga = self.chars.get(a).map(|c| c.group).unwrap_or(0);
                let gb = self.chars.get(b).map(|c| c.group).unwrap_or(0);
                if ga == gb { 0.85 } else { -0.75 }
            }
        }
    }
}

impl Default for SimpsonsPhysicsModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for SimpsonsPhysicsModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();
        let w = ctx.surface.width.max(120) as f32;
        let h = ctx.surface.height.max(100) as f32;
        self.scale = if ctx.surface.width >= 1000 { 2 } else { 1 };
        self.tick = 0;

        let count_raw = ctx.module.raw_control_value[0].clamp(0, 100);
        let num_chars = if count_raw < 25 {
            2
        } else if count_raw < 50 {
            5
        } else if count_raw < 75 {
            9
        } else if count_raw < 99 {
            14
        } else {
            self.chars.len().max(2)
        };

        let bg_raw = ctx.module.raw_control_value[1].clamp(0, 100);
        let num_bg = (bg_raw / 20).clamp(0, 5) as usize;
        let pick1 = ctx.module.raw_control_value[2];
        let pick2 = ctx.module.raw_control_value[3];

        self.bodies.clear();
        let total_avail = self.chars.len().max(1);
        for i in 0..num_chars {
            let ci = if i == 0 && pick1 > 0 {
                ((pick1 - 1) as usize) % total_avail
            } else if i == 1 && pick2 > 0 {
                ((pick2 - 1) as usize) % total_avail
            } else {
                (ctx.rng.rand_mod(total_avail as i32) as usize + i) % total_avail
            };
            let radius = self
                .chars
                .get(ci)
                .and_then(|c| c.frames.first())
                .map(|f| (f.w.max(f.h) as f32 * 0.45) * self.scale as f32)
                .unwrap_or(18.0 * self.scale as f32);
            let x = radius + ctx.rng.rand_mod((w - radius * 2.0).max(10.0) as i32) as f32;
            let y = radius + ctx.rng.rand_mod((h - radius * 2.0).max(10.0) as i32) as f32;
            let vx = ((ctx.rng.rand_mod(61) - 30) as f32) * 0.14 * self.scale as f32;
            let vy = ((ctx.rng.rand_mod(61) - 30) as f32) * 0.14 * self.scale as f32;
            self.bodies.push(Body {
                char_idx: ci,
                x,
                y,
                vx,
                vy,
                radius,
                hit_flash: 0,
                frame_phase: i * 3,
            });
        }

        self.bg_heads.clear();
        let bg_avail = self.bg_bank.frames.len();
        if bg_avail > 0 {
            for _ in 0..num_bg {
                self.bg_heads.push(BgHead {
                    sprite_idx: ctx.rng.rand_mod(bg_avail as i32) as usize,
                    x: ctx.rng.rand_mod(w as i32) as f32,
                    y: ctx.rng.rand_mod(h as i32) as f32,
                    vx: ((ctx.rng.rand_mod(21) - 10) as f32) * 0.12,
                    vy: ((ctx.rng.rand_mod(21) - 10) as f32) * 0.12,
                });
            }
        }

        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        fill_rect_px(
            ctx.surface,
            0,
            0,
            ctx.surface.width,
            ctx.surface.height,
            0x0000_0000,
        );
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.tick = self.tick.wrapping_add(1);
        let w = ctx.surface.width as f32;
        let h = ctx.surface.height as f32;
        let s = self.scale;
        let pack = SimpsonsPack::global();

        fill_rect_px(ctx.surface, 0, 0, ctx.surface.width, ctx.surface.height, 0x0006_0812);

        // Update & draw dimmed background heads (#5500)
        for bg in &mut self.bg_heads {
            bg.x += bg.vx;
            bg.y += bg.vy;
            if bg.x < 0.0 || bg.x > w - 32.0 {
                bg.vx = -bg.vx;
            }
            if bg.y < 0.0 || bg.y > h - 32.0 {
                bg.vy = -bg.vy;
            }
            if let Some(sp) = self.bg_bank.frames.get(bg.sprite_idx) {
                sp.blit_scaled(ctx.surface, bg.x as i32, bg.y as i32, s);
            }
        }

        // Pairwise Springfield attraction/repulsion + elastic collisions
        let n = self.bodies.len();
        let mut collide_sound = false;
        for i in 0..n {
            for j in (i + 1)..n {
                let dx = self.bodies[j].x - self.bodies[i].x;
                let dy = self.bodies[j].y - self.bodies[i].y;
                let dist_sq = dx * dx + dy * dy;
                let dist = dist_sq.sqrt().max(1.0);
                let min_d = self.bodies[i].radius + self.bodies[j].radius;

                if dist < min_d {
                    // Elastic bounce!
                    let nx = dx / dist;
                    let ny = dy / dist;
                    let overlap = (min_d - dist) * 0.52;
                    self.bodies[i].x -= nx * overlap;
                    self.bodies[i].y -= ny * overlap;
                    self.bodies[j].x += nx * overlap;
                    self.bodies[j].y += ny * overlap;

                    let rvx = self.bodies[i].vx - self.bodies[j].vx;
                    let rvy = self.bodies[i].vy - self.bodies[j].vy;
                    let vn = rvx * nx + rvy * ny;
                    if vn > 0.0 {
                        let imp = vn * 1.05;
                        self.bodies[i].vx -= nx * imp;
                        self.bodies[i].vy -= ny * imp;
                        self.bodies[j].vx += nx * imp;
                        self.bodies[j].vy += ny * imp;
                        self.bodies[i].hit_flash = 6;
                        self.bodies[j].hit_flash = 6;
                        if vn > 2.2 {
                            collide_sound = true;
                        }
                    }
                } else if dist < 260.0 * s as f32 {
                    let sign = self.pair_force_sign(self.bodies[i].char_idx, self.bodies[j].char_idx);
                    let f = (sign * 22.0 * s as f32) / (dist_sq + 400.0);
                    let fx = (dx / dist) * f;
                    let fy = (dy / dist) * f;
                    self.bodies[i].vx += fx;
                    self.bodies[i].vy += fy;
                    self.bodies[j].vx -= fx;
                    self.bodies[j].vy -= fy;
                }
            }
        }

        if collide_sound && self.tick % 14 == 0 {
            let snd = match ctx.rng.rand_mod(7) {
                0 => SND_PUNCH,
                1 => SND_SPLAT,
                2 => SND_OOPS,
                3 => SND_HOMER_DOH,
                4 => SND_NELSON_HAHA,
                5 => SND_OTTO_WHOA,
                _ => SND_BART_DOIT,
            };
            pack.play_voice(ctx.sound, ctx.system.sound_enabled, snd);
        }

        // Integrate velocities, bounce off screen edges, and draw animated heads!
        let max_v = 7.2 * s as f32;
        for b in &mut self.bodies {
            let spd = (b.vx * b.vx + b.vy * b.vy).sqrt();
            if spd > max_v {
                b.vx = (b.vx / spd) * max_v;
                b.vy = (b.vy / spd) * max_v;
            } else if spd < 0.8 * s as f32 {
                // Keep heads lively
                b.vx += ((ctx.rng.rand_mod(11) - 5) as f32) * 0.12;
                b.vy += ((ctx.rng.rand_mod(11) - 5) as f32) * 0.12;
            }

            b.x += b.vx;
            b.y += b.vy;
            if b.x < b.radius {
                b.x = b.radius;
                b.vx = b.vx.abs();
            } else if b.x > w - b.radius {
                b.x = w - b.radius;
                b.vx = -b.vx.abs();
            }
            if b.y < b.radius {
                b.y = b.radius;
                b.vy = b.vy.abs();
            } else if b.y > h - b.radius {
                b.y = h - b.radius;
                b.vy = -b.vy.abs();
            }
            if b.hit_flash > 0 {
                b.hit_flash -= 1;
            }

            if let Some(ch) = self.chars.get(b.char_idx) {
                if !ch.frames.is_empty() {
                    // Pick expressive turning/reacting frame based on velocity angle + bounce
                    let fi = if b.hit_flash > 0 {
                        (ch.frames.len() - 1).min(ch.frames.len() / 2 + b.hit_flash)
                    } else {
                        (self.tick / 5 + b.frame_phase) % ch.frames.len()
                    };
                    let sp = &ch.frames[fi];
                    let dx = b.x as i32 - (sp.w * s) / 2;
                    let dy = b.y as i32 - (sp.h * s) / 2;
                    if b.hit_flash > 3 {
                        fill_circle_px(ctx.surface, b.x as i32, b.y as i32, (b.radius * 0.7) as i32, 0x00FF_E848);
                    }
                    if b.vx < -0.5 {
                        sp.blit_flipped_x(ctx.surface, dx, dy, s);
                    } else {
                        sp.blit_scaled(ctx.surface, dx, dy, s);
                    }
                }
            }
        }

        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        self.bodies.clear();
        self.bg_heads.clear();
        AdResult::NoError
    }
}
