//! *Starbase* — 1994 *Star Trek: The Next Generation* After Dark 3.0 Module.
//!
//! Full-widescreen deep-space sector featuring the massive orbital **Starbase
//! Spacedock** (`RLEP #1001` `w2=39` `107x165`), multi-layer parallax twinkling
//! starfield, and smoothly banking U.S.S. Enterprise-D, Romulan Warbirds,
//! Cardassian Galor Cruisers, Klingon Birds-of-Prey, Excelsior Cruisers, and
//! Borg Cubes (`RLEP #1000/#1001` with per-ship `CTAB` palettes & smooth HD
//! scaling) accompanied by *The Star Trek: TNG Theme* MIDI (`cmid #40`).

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::simpsons::{
    RlepBank, SpriteFrame, draw_line_px, fill_circle_px, fill_rect_px, music_loops_from_slider,
    put_px,
};
use super::{
    MOD_STARBASE, SND_PHASER_SHORT, SND_PICARD_ENGAGE, SONG_TNG_THEME, load_rlep, tng_pack,
};

struct Star {
    x: i32,
    y: i32,
    col: u32,
    size: i32,
}

struct Ship {
    x: f32,
    y: f32,
    vx: f32,
    vy: f32,
    depth: f32, // 0.65 (far) .. 1.35 (near) for parallax depth & smooth scale!
    frame_start: usize,
    frame_count: usize,
    anim_phase: usize,
    flip_x: bool,
    fire_cooldown: usize,
}

pub struct StarbaseModule {
    ships_bank: Vec<SpriteFrame>,
    stars: Vec<Star>,
    fleet: Vec<Ship>,
    tick: usize,
    base_scale_f: f32,
}

impl StarbaseModule {
    pub fn new() -> Self {
        Self {
            ships_bank: Vec::new(),
            stars: Vec::new(),
            fleet: Vec::new(),
            tick: 0,
            base_scale_f: 1.0,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "tng_starbase".to_string(),
            name: "Starbase".to_string(),
            filename: "STARBASE.AD".to_string(),
            credit: "By G. Jensen, B. Levy, and G. Torrence.\nSoftware © 1994 Berkeley Systems, Inc.\nStar Trek: TNG ™ & © Paramount Pictures.".to_string(),
            about: "The U.S.S. Enterprise-D journeys between Starbases encountering Federation ships, Romulan Warbirds, Klingon Birds-of-Prey, Cardassian Cruisers, and Borg Cubes — with the TNG Theme MIDI!".to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "Number of Ships:".to_string(),
                    default_raw: 50,
                    labels: vec![
                        "A Few".into(),
                        "Some".into(),
                        "Several".into(),
                        "Many".into(),
                        "A Lot".into(),
                    ],
                    thresholds: vec![0, 20, 40, 60, 80],
                },
                AdControl::LabeledSlider {
                    title: "Redraw:".to_string(),
                    default_raw: 50,
                    labels: vec![
                        "Very Seldom".into(),
                        "Seldom".into(),
                        "Sometimes".into(),
                        "Often".into(),
                        "Very Often".into(),
                    ],
                    thresholds: vec![0, 20, 40, 60, 80],
                },
                AdControl::LabeledSlider {
                    title: "Music:".to_string(),
                    default_raw: 25,
                    labels: vec![
                        "Never".into(),
                        "Once".into(),
                        "Twice".into(),
                        "Thrice".into(),
                        "Always".into(),
                    ],
                    thresholds: vec![0, 25, 50, 75, 100],
                },
                AdControl::None,
            ],
            target_frame_ms: 48,
        }
    }

    fn ensure_loaded(&mut self) {
        if !self.ships_bank.is_empty() {
            return;
        }
        let b0: RlepBank = load_rlep(MOD_STARBASE, 1000);
        let b1: RlepBank = load_rlep(MOD_STARBASE, 1001);
        self.ships_bank.extend(b0.frames);
        self.ships_bank.extend(b1.frames);
    }

    fn spawn_ship(&self, idx: usize, w: f32, h: f32, rng: &mut ad_sdk::MsvcRand) -> Ship {
        // Verified ship frame ranges across #1000 (0..27) + #1001 (27..45):
        //   0..10 = U.S.S. Enterprise-D (smooth banking angles)
        //   10..15 = Romulan D'deridex Warbird
        //   15..20 = Cardassian Galor Cruiser
        //   20..26 = Klingon Bird-of-Prey
        //   27..28 = Excelsior / Federation Cruiser (101x25)
        //   42..45 = Borg Cube (66x63 / 93x91)
        const RANGES: [(usize, usize); 6] = [
            (0, 10),
            (10, 5),
            (15, 5),
            (20, 6),
            (27, 1),
            (42, 1),
        ];
        let (fs, fc) = if idx == 0 {
            RANGES[0] // Always guarantee U.S.S. Enterprise-D!
        } else {
            RANGES[idx % RANGES.len()]
        };
        let go_right = rng.rand_mod(2) == 0;
        let depth = 0.70 + (rng.rand_mod(65) as f32) * 0.01;
        let spd = (1.5 + (rng.rand_mod(18) as f32) * 0.12) * self.base_scale_f * depth;
        Ship {
            x: rng.rand_mod(w.max(60.0) as i32) as f32,
            y: h * 0.08 + rng.rand_mod((h * 0.78).max(20.0) as i32) as f32,
            vx: if go_right { spd } else { -spd },
            vy: ((rng.rand_mod(11) - 5) as f32) * 0.06 * self.base_scale_f,
            depth,
            frame_start: fs.min(self.ships_bank.len().saturating_sub(1)),
            frame_count: fc.max(1),
            anim_phase: rng.rand_mod(32) as usize,
            flip_x: !go_right,
            fire_cooldown: 45 + rng.rand_mod(95) as usize,
        }
    }
}

impl Default for StarbaseModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for StarbaseModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();
        let w = ctx.surface.width;
        let h = ctx.surface.height;
        self.base_scale_f = (h as f32 / 480.0).clamp(0.95, 3.2);
        self.tick = 0;

        // Resolution-scaled multi-depth twinkling deep-space starfield!
        self.stars.clear();
        let star_count = (((w as i64 * h as i64) / 3600).clamp(140, 650)) as usize;
        let star_cols = [0x00FF_FFFF, 0x00B8_D4FF, 0x00FF_E2A8, 0x0088_98C8, 0x00D8_C8FF];
        for i in 0..star_count {
            self.stars.push(Star {
                x: ctx.rng.rand_mod(w.max(1)),
                y: ctx.rng.rand_mod(h.max(1)),
                col: star_cols[ctx.rng.rand_mod(star_cols.len() as i32) as usize],
                size: if i % 9 == 0 && h >= 720 { 2 } else { 1 },
            });
        }

        let count_raw = ctx.module.raw_control_value[0].clamp(0, 100);
        let num_ships = (4 + (count_raw * 9) / 100) as usize;
        self.fleet.clear();
        for i in 0..num_ships {
            self.fleet
                .push(self.spawn_ship(i, w as f32, h as f32, ctx.rng));
        }
        // Sort fleet back-to-front by depth for true 3D occlusion!
        self.fleet
            .sort_by(|a, b| a.depth.partial_cmp(&b.depth).unwrap_or(std::cmp::Ordering::Equal));

        let pack = tng_pack();
        if let Some(loops) = music_loops_from_slider(ctx.module.raw_control_value[2]) {
            pack.play_music(ctx.sound, ctx.system.sound_enabled, SONG_TNG_THEME, loops);
        } else {
            pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_PICARD_ENGAGE);
        }
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        fill_rect_px(ctx.surface, 0, 0, ctx.surface.width, ctx.surface.height, 0x0002_040C);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.tick = self.tick.wrapping_add(1);
        let w = ctx.surface.width;
        let h = ctx.surface.height;
        let wf = w as f32;
        let hf = h as f32;
        let bsf = self.base_scale_f;

        fill_rect_px(ctx.surface, 0, 0, w, h, 0x0002_040C);

        // Smooth radial deep-space nebula clouds (zero hard circular edges!)
        let neb_clouds = [
            ((w * 24) / 100, (h * 32) / 100, (h * 45) / 100, 12.0f32, 18.0f32, 42.0f32),
            ((w * 72) / 100, (h * 64) / 100, (h * 38) / 100, 26.0f32, 10.0f32, 36.0f32),
        ];
        {
            let dst = ctx.surface.pixels_mut();
            for &(ncx, ncy, nrad, nr, ng, nb) in &neb_clouds {
                if nrad <= 4 {
                    continue;
                }
                let r2_max = (nrad * nrad) as f32;
                let y0 = (ncy - nrad).max(0);
                let y1 = (ncy + nrad).min(h);
                let x0 = (ncx - nrad).max(0);
                let x1 = (ncx + nrad).min(w);
                for y in y0..y1 {
                    let dy = (y - ncy) as f32;
                    let dy2 = dy * dy;
                    let row = (y * w) as usize;
                    for x in x0..x1 {
                        let dx = (x - ncx) as f32;
                        let d2 = dx * dx + dy2;
                        if d2 < r2_max {
                            let f = 1.0 - (d2 / r2_max);
                            let falloff = f * f;
                            let v = dst[row + x as usize];
                            let r = (((v >> 16) & 0xFF) + (nr * falloff) as u32).min(255);
                            let g = (((v >> 8) & 0xFF) + (ng * falloff) as u32).min(255);
                            let b = ((v & 0xFF) + (nb * falloff) as u32).min(255);
                            dst[row + x as usize] = (r << 16) | (g << 8) | b;
                        }
                    }
                }
            }
        }

        // Twinkling multi-size starfield
        for (i, st) in self.stars.iter().enumerate() {
            if (self.tick + i) % 23 != 0 {
                if st.size > 1 {
                    fill_rect_px(ctx.surface, st.x, st.y, st.x + st.size, st.y + st.size, st.col);
                } else {
                    put_px(ctx.surface, st.x, st.y, st.col);
                }
            }
        }

        // Authentic giant Orbital Starbase Spacedock (`ships_bank[39]`, 107x165) scaled proportionally!
        if let Some(sb) = self.ships_bank.get(39) {
            let sb_sf = ((hf * 0.44) / sb.h.max(1) as f32).clamp(1.0, 4.0);
            let sb_w = (sb.w as f32 * sb_sf).round() as i32;
            let sb_h = (sb.h as f32 * sb_sf).round() as i32;
            let sb_x = w - sb_w - (w / 18).max(20);
            let sb_y = (h / 14).max(16);
            sb.blit_rect(ctx.surface, sb_x, sb_y, sb_w, sb_h, false, false, true, false);
            // Blinking Starbase docking bay beacon light
            if (self.tick / 12) % 2 == 0 {
                let bx = sb_x + sb_w / 2;
                let by = sb_y + (sb_h * 32) / 100;
                fill_circle_px(ctx.surface, bx, by, (sb_sf * 2.2).round().max(2.0) as i32, 0x00FF_5838);
            }
        }

        // Update & render fleet with smooth ping-pong banking & depth scaling
        let mut phaser_fired = false;
        let margin = 175.0 * bsf;
        for sh in &mut self.fleet {
            sh.x += sh.vx;
            sh.y += sh.vy;
            if sh.vx > 0.0 && sh.x > wf + 32.0 {
                sh.x = -margin;
                sh.y = hf * 0.08 + ctx.rng.rand_mod((hf * 0.78).max(20.0) as i32) as f32;
            } else if sh.vx < 0.0 && sh.x < -margin {
                sh.x = wf + 32.0;
                sh.y = hf * 0.08 + ctx.rng.rand_mod((hf * 0.78).max(20.0) as i32) as f32;
            }
            if sh.y < hf * 0.05 || sh.y > hf * 0.85 {
                sh.vy = -sh.vy;
            }

            // Smooth ping-pong banking instead of snapping abruptly between angles!
            let offset = if sh.frame_count <= 1 {
                0
            } else {
                let period = (sh.frame_count - 1) * 2;
                let p = (self.tick / 9 + sh.anim_phase) % period;
                if p < sh.frame_count {
                    p
                } else {
                    period - p
                }
            };
            let fi = (sh.frame_start + offset).min(self.ships_bank.len().saturating_sub(1));
            let ship_sf = (bsf * sh.depth).clamp(0.75, 3.6);
            if let Some(sp) = self.ships_bank.get(fi) {
                sp.blit_transformed_f(
                    ctx.surface,
                    sh.x as i32,
                    sh.y as i32,
                    ship_sf,
                    sh.flip_x,
                    false,
                    true,
                    false,
                );
            }

            // Occasional phaser / disruptor beam exchange!
            if sh.fire_cooldown > 0 {
                sh.fire_cooldown -= 1;
            } else {
                sh.fire_cooldown = 120 + ctx.rng.rand_mod(120) as usize;
                let bx = sh.x as i32 + (45.0 * ship_sf) as i32;
                let by = sh.y as i32 + (22.0 * ship_sf) as i32;
                let tx = bx + ((if sh.vx >= 0.0 { 150.0 } else { -150.0 }) * ship_sf) as i32;
                let ty = by + ctx.rng.rand_mod((64.0 * ship_sf).max(20.0) as i32) - (32.0 * ship_sf) as i32;
                let beam_col = if sh.frame_start == 0 || sh.frame_start == 27 {
                    0x00FF_7C28 // Federation orange phaser
                } else {
                    0x0040_FF58 // Romulan / Klingon / Borg emerald disruptor
                };
                draw_line_px(ctx.surface, bx, by, tx, ty, beam_col, (ship_sf * 2.2).round().max(2.0) as i32);
                phaser_fired = true;
            }
        }

        if phaser_fired {
            tng_pack().play_voice(ctx.sound, ctx.system.sound_enabled, SND_PHASER_SHORT);
        }

        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        self.fleet.clear();
        AdResult::NoError
    }
}
