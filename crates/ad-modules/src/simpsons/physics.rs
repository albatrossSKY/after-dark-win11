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
    scale_f: f32,
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
            scale_f: 1.5,
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
        // Verified exact 19 Springfield character frame slices across RLEP #5000..#5090
        // (matching the Character 1 / Character 2 dropdown alphabetical order 1:1):
        const CHAR_SLICES: &[(i16, usize, usize)] = &[
            (5000, 0, 10),  // 0: Barney
            (5000, 10, 29), // 1: Bart
            (5010, 0, 14),  // 2: Burns
            (5010, 14, 23), // 3: Edna
            (5020, 0, 10),  // 4: Grampa
            (5020, 10, 28), // 5: Homer
            (5030, 0, 14),  // 6: Lisa
            (5030, 14, 23), // 7: Maggie
            (5040, 0, 19),  // 8: Marge
            (5040, 19, 29), // 9: Maude
            (5050, 0, 8),   // 10: Milhouse
            (5050, 8, 17),  // 11: Ned
            (5060, 0, 8),   // 12: Nelson
            (5060, 8, 15),  // 13: Otto
            (5070, 0, 15),  // 14: Patty
            (5070, 15, 24), // 15: Ralph
            (5080, 0, 15),  // 16: Selma
            (5080, 15, 28), // 17: Skinner
            (5090, 0, 13),  // 18: Smithers
        ];
        let mut cached_banks: Vec<(i16, RlepBank)> = Vec::new();
        for bank_idx in 0..10 {
            let rid = 5000 + bank_idx * 10;
            cached_banks.push((rid, RlepBank::load(MOD_PHYSICS, rid)));
        }

        let mut all_chars = Vec::with_capacity(CHAR_SLICES.len());
        for (idx, &(rid, start, end)) in CHAR_SLICES.iter().enumerate() {
            let frames = cached_banks
                .iter()
                .find(|(id, _)| *id == rid)
                .map(|(_, b)| {
                    let s = start.min(b.frames.len());
                    let e = end.min(b.frames.len());
                    b.frames[s..e].to_vec()
                })
                .unwrap_or_default();
            all_chars.push(CharHeadFrames {
                frames,
                group: (idx as i32) % 4,
            });
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
        self.scale_f = (h / 400.0).clamp(1.15, 4.0);
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
                .map(|f| (f.w.max(f.h) as f32 * 0.45) * self.scale_f)
                .unwrap_or(18.0 * self.scale_f);
            let x = radius + ctx.rng.rand_mod((w - radius * 2.0).max(10.0) as i32) as f32;
            let y = radius + ctx.rng.rand_mod((h - radius * 2.0).max(10.0) as i32) as f32;
            let vx = ((ctx.rng.rand_mod(61) - 30) as f32) * 0.14 * self.scale_f;
            let vy = ((ctx.rng.rand_mod(61) - 30) as f32) * 0.14 * self.scale_f;
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
                    vx: ((ctx.rng.rand_mod(21) - 10) as f32) * 0.12 * self.scale_f,
                    vy: ((ctx.rng.rand_mod(21) - 10) as f32) * 0.12 * self.scale_f,
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
        let sf = self.scale_f;
        let pack = SimpsonsPack::global();

        // Deep indigo-slate physics chamber gradient with subtle blueprint grid
        {
            let iw = ctx.surface.width;
            let ih = ctx.surface.height;
            let gstep = (44.0 * sf).round().max(24.0) as i32;
            let dst = ctx.surface.pixels_mut();
            for y in 0..ih {
                let row = (y * iw) as usize;
                let yt = y as f32 / ih.max(1) as f32;
                let base_r = (8.0 + yt * 8.0) as u32;
                let base_g = (12.0 + yt * 10.0) as u32;
                let base_b = (24.0 + yt * 18.0) as u32;
                let gy_line = (y % gstep) == 0;
                for x in 0..iw {
                    let grid = gy_line || (x % gstep) == 0;
                    let col = if grid {
                        ((base_r + 6) << 16) | ((base_g + 10) << 8) | (base_b + 16)
                    } else {
                        (base_r << 16) | (base_g << 8) | base_b
                    };
                    dst[row + x as usize] = col;
                }
            }
        }

        // Update & draw dimmed background heads (#5500)
        for bg in &mut self.bg_heads {
            bg.x += bg.vx;
            bg.y += bg.vy;
            if bg.x < 0.0 || bg.x > w - 40.0 * sf {
                bg.vx = -bg.vx;
            }
            if bg.y < 0.0 || bg.y > h - 40.0 * sf {
                bg.vy = -bg.vy;
            }
            if let Some(sp) = self.bg_bank.frames.get(bg.sprite_idx) {
                sp.blit_transformed_f(ctx.surface, bg.x as i32, bg.y as i32, sf, false, false, true, false);
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
                } else if dist < 260.0 * sf {
                    let sign = self.pair_force_sign(self.bodies[i].char_idx, self.bodies[j].char_idx);
                    let f = (sign * 22.0 * sf) / (dist_sq + 400.0);
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
        let max_v = 7.2 * sf;
        for b in &mut self.bodies {
            let spd = (b.vx * b.vx + b.vy * b.vy).sqrt();
            if spd > max_v {
                b.vx = (b.vx / spd) * max_v;
                b.vy = (b.vy / spd) * max_v;
            } else if spd < 0.8 * sf {
                // Keep heads lively
                b.vx += ((ctx.rng.rand_mod(11) - 5) as f32) * 0.12 * sf;
                b.vy += ((ctx.rng.rand_mod(11) - 5) as f32) * 0.12 * sf;
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
                    let n = ch.frames.len();
                    let calm_n = ((n * 2) / 3).max(1);
                    // Smooth ping-pong head turning during flight; expressive reaction on bounce!
                    let fi = if b.hit_flash > 0 && n > calm_n {
                        calm_n + (b.hit_flash % (n - calm_n))
                    } else if calm_n <= 1 {
                        0
                    } else {
                        let span = (calm_n - 1) * 2;
                        let p = (self.tick / 4 + b.frame_phase) % span;
                        if p < calm_n { p } else { span - p }
                    };
                    let sp = &ch.frames[fi.min(n - 1)];
                    let sw_px = (sp.w as f32 * sf).round() as i32;
                    let sh_px = (sp.h as f32 * sf).round() as i32;
                    let dx = b.x as i32 - sw_px / 2;
                    let dy = b.y as i32 - sh_px / 2;
                    if b.hit_flash > 3 {
                        fill_circle_px(
                            ctx.surface,
                            b.x as i32,
                            b.y as i32,
                            (b.radius * 0.72) as i32,
                            0x00FF_E848,
                        );
                    }
                    sp.blit_transformed_f(
                        ctx.surface,
                        dx,
                        dy,
                        sf,
                        b.vx < -0.5,
                        false,
                        true,
                        false,
                    );
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
