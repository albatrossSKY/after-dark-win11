//! *Starbase* — 1994 *Star Trek: The Next Generation* After Dark 3.0 Module.
//!
//! The U.S.S. Enterprise-D journeys from Starbase to Starbase alongside
//! Romulan Warbirds, Klingon Birds-of-Prey, Cardassian Cruisers, Federation
//! starships, and Borg Cubes (`RLEP #1000/#1001`, decoded with per-ship `CTAB`
//! palettes!) accompanied by *The Star Trek: TNG Theme* MIDI (`cmid #40`).

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::simpsons::{
    RlepBank, SpriteFrame, draw_line_px, fill_rect_px, music_loops_from_slider, put_px,
};
use super::{
    MOD_STARBASE, SND_PHASER_SHORT, SND_PICARD_ENGAGE, SONG_TNG_THEME, load_rlep, tng_pack,
};

struct Star {
    x: i32,
    y: i32,
    col: u32,
}

struct Ship {
    x: f32,
    y: f32,
    vx: f32,
    vy: f32,
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
    scale: i32,
}

impl StarbaseModule {
    pub fn new() -> Self {
        Self {
            ships_bank: Vec::new(),
            stars: Vec::new(),
            fleet: Vec::new(),
            tick: 0,
            scale: 1,
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
        // Authentic ship frame ranges across #1000 (0..27) + #1001 (27..45):
        // 0..10 = Enterprise-D, 10..15 = Romulan Warbird, 15..20 = Cardassian Galor,
        // 20..27 = Klingon Bird-of-Prey, 27..35 = Federation/Vor'cha Cruiser, 42..45 = Borg Cube!
        const RANGES: [(usize, usize); 6] = [
            (0, 10),
            (10, 5),
            (15, 5),
            (20, 7),
            (27, 6),
            (42, 3),
        ];
        let (fs, fc) = if idx == 0 {
            RANGES[0] // Always guarantee U.S.S. Enterprise-D in the fleet!
        } else {
            RANGES[idx % RANGES.len()]
        };
        let go_right = rng.rand_mod(2) == 0;
        let spd = (1.6 + (rng.rand_mod(18) as f32) * 0.14) * self.scale as f32;
        Ship {
            x: rng.rand_mod(w.max(60.0) as i32) as f32,
            y: 36.0 + rng.rand_mod((h - 90.0).max(20.0) as i32) as f32,
            vx: if go_right { spd } else { -spd },
            vy: ((rng.rand_mod(11) - 5) as f32) * 0.08 * self.scale as f32,
            frame_start: fs.min(self.ships_bank.len().saturating_sub(1)),
            frame_count: fc.max(1),
            anim_phase: rng.rand_mod(32) as usize,
            flip_x: !go_right,
            fire_cooldown: 40 + rng.rand_mod(90) as usize,
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
        self.scale = if w >= 1100 { 2 } else { 1 };
        self.tick = 0;

        // Deep-space twinkling starfield
        self.stars.clear();
        let star_cols = [0x00FF_FFFF, 0x00B8_D4FF, 0x00FF_E2A8, 0x0088_98C8];
        for _ in 0..140 {
            self.stars.push(Star {
                x: ctx.rng.rand_mod(w.max(1)),
                y: ctx.rng.rand_mod(h.max(1)),
                col: star_cols[ctx.rng.rand_mod(star_cols.len() as i32) as usize],
            });
        }

        let count_raw = ctx.module.raw_control_value[0].clamp(0, 100);
        let num_ships = (3 + (count_raw * 9) / 100) as usize;
        self.fleet.clear();
        for i in 0..num_ships {
            self.fleet
                .push(self.spawn_ship(i, w as f32, h as f32, ctx.rng));
        }

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
        let s = self.scale;

        fill_rect_px(ctx.surface, 0, 0, w, h, 0x0002_040C);

        // Twinkling starfield
        for (i, st) in self.stars.iter().enumerate() {
            if (self.tick + i) % 23 != 0 {
                put_px(ctx.surface, st.x, st.y, st.col);
            }
        }

        // Draw distant Starbase orbital structure if frame exists (#1001[16] or [17])
        if let Some(sb) = self.ships_bank.get(38) {
            if sb.w >= 40 && sb.h >= 40 {
                sb.blit_scaled(ctx.surface, w - sb.w * s - 28 * s, 24 * s, s);
            }
        }

        // Update & render fleet
        let mut phaser_fired = false;
        let margin = 160.0 * s as f32;
        for sh in &mut self.fleet {
            sh.x += sh.vx;
            sh.y += sh.vy;
            if sh.vx > 0.0 && sh.x > wf + 24.0 {
                sh.x = -margin;
                sh.y = 32.0 + ctx.rng.rand_mod((h - 80).max(20)) as f32;
            } else if sh.vx < 0.0 && sh.x < -margin {
                sh.x = wf + 24.0;
                sh.y = 32.0 + ctx.rng.rand_mod((h - 80).max(20)) as f32;
            }
            if sh.y < 16.0 || sh.y > hf - 64.0 * s as f32 {
                sh.vy = -sh.vy;
            }

            let fi = (sh.frame_start + ((self.tick / 5 + sh.anim_phase) % sh.frame_count))
                .min(self.ships_bank.len().saturating_sub(1));
            if let Some(sp) = self.ships_bank.get(fi) {
                if sh.flip_x {
                    sp.blit_flipped_x(ctx.surface, sh.x as i32, sh.y as i32, s);
                } else {
                    sp.blit_scaled(ctx.surface, sh.x as i32, sh.y as i32, s);
                }
            }

            // Occasional phaser / disruptor beam exchange!
            if sh.fire_cooldown > 0 {
                sh.fire_cooldown -= 1;
            } else {
                sh.fire_cooldown = 120 + ctx.rng.rand_mod(120) as usize;
                let bx = sh.x as i32 + 45 * s;
                let by = sh.y as i32 + 22 * s;
                let tx = bx + if sh.vx >= 0.0 { 140 * s } else { -140 * s };
                let ty = by + ctx.rng.rand_mod(60 * s) - 30 * s;
                let beam_col = if sh.frame_start == 0 {
                    0x00FF_7C28 // Federation orange phaser
                } else {
                    0x0040_FF58 // Romulan / Klingon green disruptor
                };
                draw_line_px(ctx.surface, bx, by, tx, ty, beam_col, (2 * s).max(2));
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
