//! *Grass Skirts* — 1994 *The Simpsons* After Dark 3.0 Module.
//!
//! Ned Flanders and Homer Simpson don their spandex & floral dresses to mow
//! away your desktop and sprouting Springfield weeds (with occasional crawling
//! Maggie cameo!), using the authentic `OFst/OFtb #8000` + `RLEP #8000/#30000`
//! artwork, exact non-slipping walk cycles, stuck/waving reactions, picket
//! fence top border, and mower/voice SFX.

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use super::{
    CompoundAnim, MOD_GRASS_SKIRTS, RlepBank, SND_FLANDERS_HIMO, SND_FLANDERS_OPSY,
    SND_HOMER_GRSS, SND_MAGGIE_SUCK, SND_MOWER, SND_MOWER_ON, SND_MOWER_STUCK, SimpsonsPack,
    fill_rect_px, put_px,
};

/// Authentic lawn weed/flower/obstacle sprite indices in `RLEP #8000`
/// (excluding picket fence posts `48..=50`, grass tile `51`, and dust `52..=55`).
const WEED_SPRITES: &[usize] = &[56, 57, 58, 59, 65, 66, 67, 56, 57, 65, 66, 67];
const OBSTACLE_SPRITES: &[usize] = &[60, 61, 62, 63, 64, 68];

struct Weed {
    x: i32,
    y: i32,
    sprite_idx: usize,
    is_obstacle: bool,
    alive: bool,
}

#[derive(Clone, Copy, PartialEq, Eq)]
enum MowerState {
    Walking,
    Stuck(usize),  // Homer mower stuck frames 12..=15
    Action(usize), // Homer dress adjust 16..=20 or Ned wave 32..=36
}

struct MowerActor {
    is_ned: bool,
    /// Stage-space anchor X in screen pixels (advances by exact cycle stride on loop wrap).
    anchor_x: f32,
    y: i32,
    dir: i32, // -1 = mowing left (native), 1 = mowing right (mirrored)
    cycle_step: usize,
    sub_tick: usize,
    state: MowerState,
}

impl MowerActor {
    /// Current screen X of the mower's cutting deck & body center.
    fn current_visual_x(&self, anim: &CompoundAnim, sf: f32) -> (f32, f32) {
        let (fi, ref_x) = self.current_frame_and_ref();
        let (fl, fr) = anim
            .frames
            .get(fi)
            .map(|cf| (cf.left + cf.dx, cf.right + cf.dx))
            .unwrap_or((ref_x, ref_x + 90));
        if self.dir < 0 {
            let x0 = self.anchor_x + (fl - ref_x) as f32 * sf;
            let x1 = self.anchor_x + (fr - ref_x) as f32 * sf;
            (x0, x1)
        } else {
            let x0 = self.anchor_x + (ref_x - fr) as f32 * sf;
            let x1 = self.anchor_x + (ref_x - fl) as f32 * sf;
            (x0, x1)
        }
    }

    fn current_frame_and_ref(&self) -> (usize, i32) {
        if self.is_ned {
            match self.state {
                MowerState::Walking => (21 + (self.cycle_step % 10), 184),
                MowerState::Stuck(t) => (32 + ((t / 2) % 5), 184),
                MowerState::Action(t) => (32 + ((t / 2) % 5), 184),
            }
        } else {
            match self.state {
                MowerState::Walking => (self.cycle_step % 11, 210),
                MowerState::Stuck(t) => (12 + ((t / 2) % 4), 210),
                MowerState::Action(t) => (16 + ((t / 2) % 5), 210),
            }
        }
    }
}

pub struct GrassSkirtsModule {
    anim: Option<CompoundAnim>,
    loaded_ensemble: i32,
    maggie: RlepBank,
    canvas_buf: Vec<u32>,
    saved_bg: Vec<u32>,
    clear_screen: bool,
    mowers: Vec<MowerActor>,
    weeds: Vec<Weed>,
    maggie_x: f32,
    maggie_y: i32,
    maggie_active: bool,
    tick: usize,
    scale_f: f32,
    weed_density: i32,
    ensemble: i32,
}

impl GrassSkirtsModule {
    pub fn new() -> Self {
        Self {
            anim: None,
            loaded_ensemble: -1,
            maggie: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            canvas_buf: Vec::new(),
            saved_bg: Vec::new(),
            clear_screen: true,
            mowers: Vec::new(),
            weeds: Vec::new(),
            maggie_x: -60.0,
            maggie_y: 80,
            maggie_active: false,
            tick: 0,
            scale_f: 1.4,
            weed_density: 60,
            ensemble: 4,
        }
    }

    fn apply_ensemble_palette(anim: &mut CompoundAnim, ens_idx: i32) {
        let idx = ens_idx.clamp(0, 3) as i16;
        if idx == 0 {
            return; // Florals is the default base palette (#8100 / #8200)
        }
        let pack = SimpsonsPack::global();
        let base_homer = pack.decode_clut(MOD_GRASS_SKIRTS, 8100);
        let dst_homer = pack.decode_clut(MOD_GRASS_SKIRTS, 8100 + idx);
        let base_ned = pack.decode_clut(MOD_GRASS_SKIRTS, 8200);
        let dst_ned = pack.decode_clut(MOD_GRASS_SKIRTS, 8200 + idx);

        for sp in &mut anim.sprites {
            for px in &mut sp.pixels {
                if *px == 0 {
                    continue;
                }
                let mut replaced = false;
                for (b, d) in base_homer.iter().zip(dst_homer.iter()) {
                    if *px == *b {
                        *px = *d;
                        replaced = true;
                        break;
                    }
                }
                if !replaced {
                    for (b, d) in base_ned.iter().zip(dst_ned.iter()) {
                        if *px == *b {
                            *px = *d;
                            break;
                        }
                    }
                }
            }
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "simpsons_grass_skirts".to_string(),
            name: "Grass Skirts".to_string(),
            credit: "By Gabriel Jensen and Tom Wuttke.\nSoftware © 1994 Berkeley Systems, Inc.\nThe Simpsons ™ & © Twentieth Century Fox.".to_string(),
            about: "It's spandex in the grass as Ned Flanders and Homer Simpson mow away your desktop and all those nasty weeds growing underneath!".to_string(),
            controls: [
                AdControl::Menu {
                    title: "Mower:".to_string(),
                    default_index: 0,
                    choices: vec![
                        "Both".into(),
                        "Ned".into(),
                        "Homer".into(),
                        "Random".into(),
                    ],
                },
                AdControl::Menu {
                    title: "Ensemble:".to_string(),
                    default_index: 4,
                    choices: vec![
                        "Florals".into(),
                        "Solids".into(),
                        "Dots".into(),
                        "Prints".into(),
                        "Random".into(),
                    ],
                },
                AdControl::LabeledSlider {
                    title: "Weeds:".to_string(),
                    default_raw: 60,
                    labels: vec![
                        "None".into(),
                        "Budding".into(),
                        "Blooming".into(),
                        "Jungle".into(),
                    ],
                    thresholds: vec![0, 25, 50, 75],
                },
                AdControl::Checkbox {
                    title: "Clear Screen First".to_string(),
                    default_checked: true,
                },
            ],
            target_frame_ms: 65,
            filename: "GRASSKRT.AD".to_string(),
        }
    }

    fn init_lawn(&mut self, w: i32, h: i32, rng: &mut ad_sdk::MsvcRand) {
        let sf = self.scale_f;
        let fence_h = if self.clear_screen {
            (58.0 * sf).round() as i32
        } else {
            0
        };
        self.canvas_buf.resize((w * h) as usize, 0);
        if self.clear_screen || self.saved_bg.len() != self.canvas_buf.len() {
            // Sky strip behind top picket fence + lush overgrown Springfield lawn
            for y in 0..h {
                let row = (y * w) as usize;
                for x in 0..w {
                    if y < fence_h {
                        // Crisp Springfield blue sky behind picket fence
                        let t = (y as f32 / fence_h.max(1) as f32).clamp(0.0, 1.0);
                        let r = (104.0 + t * 56.0) as u32;
                        let g = (176.0 + t * 44.0) as u32;
                        let b = (232.0 + t * 18.0) as u32;
                        self.canvas_buf[row + x as usize] = (r << 16) | (g << 8) | b;
                    } else {
                        let blade = ((x * 7 ^ y * 13) & 15) as u32;
                        let g = 104 + blade * 2;
                        let r = 24 + (blade / 2);
                        let b = 22 + (blade / 3);
                        self.canvas_buf[row + x as usize] = (r << 16) | (g << 8) | b;
                    }
                }
            }
            // Stamp authentic wooden picket fence posts (SP48..SP50) cleanly along the top yard border!
            if let Some(anim) = &self.anim {
                let post_w = (13.0 * sf).round().max(8.0) as i32;
                let mut fx = 0;
                let mut idx = 0usize;
                while fx < w {
                    let sp_i = 48 + (idx % 3);
                    if let Some(sp) = anim.sprites.get(sp_i) {
                        sp.blit_into_buf_scaled(&mut self.canvas_buf, w, h, fx, 0, sf, None);
                    }
                    fx += post_w;
                    idx += 1;
                }
            }
        } else {
            self.canvas_buf.copy_from_slice(&self.saved_bg);
        }

        // Populate ONLY real lawn weeds/flowers/yard obstacles (NEVER fence posts!)
        self.weeds.clear();
        let count = if self.weed_density < 20 {
            0
        } else {
            (10 + (self.weed_density * 46) / 100) as usize
        };
        let min_y = (fence_h + (16.0 * sf) as i32).min(h - 40).max(16);
        if let Some(anim) = &self.anim {
            for i in 0..count {
                let wx = 12 + rng.rand_mod((w - 40).max(20));
                let wy = min_y + rng.rand_mod((h - min_y - 28).max(20));
                let is_obstacle = (i % 7 == 0) && self.weed_density >= 40;
                let si = if is_obstacle {
                    OBSTACLE_SPRITES[rng.rand_mod(OBSTACLE_SPRITES.len() as i32) as usize]
                } else {
                    WEED_SPRITES[rng.rand_mod(WEED_SPRITES.len() as i32) as usize]
                };
                if si < anim.sprites.len() {
                    self.weeds.push(Weed {
                        x: wx,
                        y: wy,
                        sprite_idx: si,
                        is_obstacle,
                        alive: true,
                    });
                }
            }
        }
    }
}

impl Default for GrassSkirtsModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for GrassSkirtsModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.saved_bg = ctx.surface.pixels().to_vec();
        let mower_choice = ctx.module.raw_control_value[0].clamp(0, 3);
        self.ensemble = ctx.module.raw_control_value[1].clamp(0, 4);
        self.weed_density = ctx.module.raw_control_value[2].clamp(0, 100);
        self.clear_screen = ctx.module.raw_control_value[3] != 0;

        let active_ens = if self.ensemble == 4 {
            ctx.rng.rand_mod(4)
        } else {
            self.ensemble
        };
        if self.anim.is_none() || self.loaded_ensemble != active_ens {
            let mut a = CompoundAnim::load(MOD_GRASS_SKIRTS, 8000);
            Self::apply_ensemble_palette(&mut a, active_ens);
            self.anim = Some(a);
            self.loaded_ensemble = active_ens;
        }
        if self.maggie.frames.is_empty() {
            self.maggie = RlepBank::load(MOD_GRASS_SKIRTS, 30000);
        }

        self.scale_f = (ctx.surface.height as f32 / 460.0).clamp(1.0, 3.6);
        self.tick = 0;

        let w = ctx.surface.width;
        let h = ctx.surface.height;
        self.init_lawn(w, h, ctx.rng);

        let choice = if mower_choice == 3 {
            ctx.rng.rand_mod(3)
        } else {
            mower_choice
        };

        self.mowers.clear();
        let sf = self.scale_f;
        let top_y = if self.clear_screen {
            (44.0 * sf).round() as i32
        } else {
            (18.0 * sf).round() as i32
        };
        match choice {
            1 => {
                self.mowers.push(MowerActor {
                    is_ned: true,
                    anchor_x: w as f32 - 36.0 * sf,
                    y: top_y,
                    dir: -1,
                    cycle_step: 0,
                    sub_tick: 0,
                    state: MowerState::Walking,
                });
            }
            2 => {
                self.mowers.push(MowerActor {
                    is_ned: false,
                    anchor_x: w as f32 - 36.0 * sf,
                    y: top_y,
                    dir: -1,
                    cycle_step: 0,
                    sub_tick: 0,
                    state: MowerState::Walking,
                });
            }
            _ => {
                self.mowers.push(MowerActor {
                    is_ned: false,
                    anchor_x: w as f32 - 36.0 * sf,
                    y: top_y,
                    dir: -1,
                    cycle_step: 0,
                    sub_tick: 0,
                    state: MowerState::Walking,
                });
                self.mowers.push(MowerActor {
                    is_ned: true,
                    anchor_x: 36.0 * sf,
                    y: (h / 2).max(top_y + (90.0 * sf) as i32),
                    dir: 1,
                    cycle_step: 4,
                    sub_tick: 0,
                    state: MowerState::Walking,
                });
            }
        }

        self.maggie_active = false;
        self.maggie_x = -60.0 * sf;
        self.maggie_y = (h * 3) / 4;

        let pack = SimpsonsPack::global();
        pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_MOWER_ON);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        if self.canvas_buf.len() == ctx.surface.pixels().len() {
            ctx.surface.pixels_mut().copy_from_slice(&self.canvas_buf);
        }
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.tick = self.tick.wrapping_add(1);
        let w = ctx.surface.width;
        let h = ctx.surface.height;
        let sf = self.scale_f;
        let pack = SimpsonsPack::global();

        let fence_h = if self.clear_screen {
            (58.0 * sf).round() as i32
        } else {
            0
        };
        let strip_h = (52.0 * sf).round().max(24.0) as i32;
        let mut wrap_reset = false;

        if let Some(anim) = &self.anim {
            for m in &mut self.mowers {
                let (vx0, vx1) = m.current_visual_x(anim, sf);

                match m.state {
                    MowerState::Stuck(t) => {
                        if t + 1 >= 14 {
                            m.state = MowerState::Walking;
                        } else {
                            m.state = MowerState::Stuck(t + 1);
                        }
                    }
                    MowerState::Action(t) => {
                        if t + 1 >= 14 {
                            m.state = MowerState::Walking;
                        } else {
                            m.state = MowerState::Action(t + 1);
                        }
                    }
                    MowerState::Walking => {
                        // Advance through authentic walk cycle without foot slipping!
                        m.sub_tick = m.sub_tick.wrapping_add(1);
                        if m.sub_tick % 2 == 0 {
                            let cycle_len = if m.is_ned { 10 } else { 11 };
                            let stride = if m.is_ned { 64.0 } else { 102.0 };
                            m.cycle_step += 1;
                            if m.cycle_step >= cycle_len {
                                m.cycle_step = 0;
                                m.anchor_x += (m.dir as f32) * stride * sf;
                            }
                        }

                        // Mow clean striped grass swath right beneath the lawnmower deck!
                        let deck_x0 = if m.dir < 0 {
                            vx0 as i32
                        } else {
                            (vx1 - 52.0 * sf) as i32
                        };
                        let deck_x1 = deck_x0 + (52.0 * sf) as i32;
                        let deck_y = m.y + (42.0 * sf) as i32;
                        let x0 = deck_x0.max(0);
                        let x1 = deck_x1.min(w);
                        let y0 = deck_y.max(fence_h);
                        let y1 = (deck_y + strip_h).min(h);
                        let stripe_tone = if ((m.y / strip_h.max(1)) & 1) == 0 {
                            0x0024_9834
                        } else {
                            0x001E_842C
                        };
                        for py in y0..y1 {
                            let row = (py * w) as usize;
                            for px in x0..x1 {
                                let jitter = (((px ^ py) & 3) as u32) * 3;
                                let r = ((stripe_tone >> 16) & 0xFF) + jitter;
                                let g = (((stripe_tone >> 8) & 0xFF) + jitter).min(255);
                                let b = (stripe_tone & 0xFF) + jitter;
                                self.canvas_buf[row + px as usize] = (r << 16) | (g << 8) | b;
                            }
                        }

                        // Mow down weeds; hitting a tough yard obstacle briefly jams the mower!
                        let wpad = (14.0 * sf) as i32;
                        for wd in &mut self.weeds {
                            if wd.alive
                                && wd.x >= x0 - wpad
                                && wd.x <= x1 + wpad
                                && wd.y >= y0 - wpad
                                && wd.y <= y1 + wpad
                            {
                                wd.alive = false;
                                if wd.is_obstacle {
                                    // Preserve visual X cleanly when pausing to struggle/wave
                                    m.anchor_x = if m.dir < 0 { vx0 } else { vx1 };
                                    m.cycle_step = 0;
                                    m.state = MowerState::Stuck(0);
                                    pack.play_voice(
                                        ctx.sound,
                                        ctx.system.sound_enabled,
                                        if m.is_ned {
                                            SND_FLANDERS_OPSY
                                        } else {
                                            SND_MOWER_STUCK
                                        },
                                    );
                                    break;
                                }
                            }
                        }

                        // Turn around cleanly at screen edges and step down one mowing row
                        if m.dir < 0 && vx1 < -16.0 * sf {
                            m.dir = 1;
                            m.cycle_step = 0;
                            m.anchor_x = -8.0 * sf;
                            m.y += strip_h;
                            if m.y > h - (42.0 * sf) as i32 {
                                m.y = if self.clear_screen {
                                    (44.0 * sf).round() as i32
                                } else {
                                    (18.0 * sf).round() as i32
                                };
                                wrap_reset = true;
                            }
                            let clip = if m.is_ned {
                                if ctx.rng.rand_mod(2) == 0 {
                                    SND_FLANDERS_HIMO
                                } else {
                                    SND_FLANDERS_OPSY
                                }
                            } else if ctx.rng.rand_mod(2) == 0 {
                                SND_HOMER_GRSS
                            } else {
                                SND_MOWER
                            };
                            pack.play_voice(ctx.sound, ctx.system.sound_enabled, clip);
                        } else if m.dir > 0 && vx0 > w as f32 + 16.0 * sf {
                            m.dir = -1;
                            m.cycle_step = 0;
                            m.anchor_x = w as f32 + 8.0 * sf;
                            m.y += strip_h;
                            if m.y > h - (42.0 * sf) as i32 {
                                m.y = if self.clear_screen {
                                    (44.0 * sf).round() as i32
                                } else {
                                    (18.0 * sf).round() as i32
                                };
                                wrap_reset = true;
                            }
                            pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_MOWER);
                        } else if ctx.rng.rand_mod(260) == 0
                            && vx0 > 40.0 * sf
                            && vx1 < w as f32 - 40.0 * sf
                        {
                            // Occasional mid-lawn wave (Ned) or dress adjustment (Homer)
                            m.anchor_x = if m.dir < 0 { vx0 } else { vx1 };
                            m.cycle_step = 0;
                            m.state = MowerState::Action(0);
                            if m.is_ned {
                                pack.play_voice(
                                    ctx.sound,
                                    ctx.system.sound_enabled,
                                    SND_FLANDERS_HIMO,
                                );
                            }
                        }
                    }
                }
            }
        }

        if wrap_reset && ctx.rng.rand_mod(2) == 0 {
            self.init_lawn(w, h, ctx.rng);
        }

        // Occasional toddling Maggie cameo across the freshly mowed lawn!
        if !self.maggie_active && self.tick % 95 == 35 {
            self.maggie_active = true;
            self.maggie_x = -40.0 * sf;
            let min_my = (fence_h + (30.0 * sf) as i32).min(h - 50);
            self.maggie_y = min_my + ctx.rng.rand_mod((h - min_my - (50.0 * sf) as i32).max(20));
            pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_MAGGIE_SUCK);
        }
        if self.maggie_active {
            self.maggie_x += 2.2 * sf;
            if self.maggie_x > w as f32 + 50.0 * sf {
                self.maggie_active = false;
            }
        }

        // Composite lawn + live weeds + flying grass clippings + mowers + Maggie
        if self.canvas_buf.len() == ctx.surface.pixels().len() {
            ctx.surface.pixels_mut().copy_from_slice(&self.canvas_buf);
        } else {
            fill_rect_px(ctx.surface, 0, 0, w, h, 0x001E_782C);
        }

        if let Some(anim) = &self.anim {
            for wd in &self.weeds {
                if wd.alive {
                    if let Some(sp) = anim.sprites.get(wd.sprite_idx) {
                        sp.blit_transformed_f(ctx.surface, wd.x, wd.y, sf, false, false, false, false);
                    }
                }
            }

            let clip_sz = sf.round().max(1.0) as i32;
            for m in &self.mowers {
                let (fi, ref_x) = m.current_frame_and_ref();
                let ref_y = if m.is_ned { 79 } else { 72 };
                anim.draw_cycle_frame_f(
                    ctx.surface,
                    fi,
                    m.anchor_x,
                    m.y as f32,
                    ref_x,
                    ref_y,
                    sf,
                    m.dir > 0,
                    false,
                );

                // Flying grass clippings spraying out of the mower deck while walking!
                if matches!(m.state, MowerState::Walking) {
                    let (vx0, vx1) = m.current_visual_x(anim, sf);
                    let spray_x = if m.dir < 0 {
                        (vx0 + 14.0 * sf) as i32
                    } else {
                        (vx1 - 14.0 * sf) as i32
                    };
                    let spray_y = m.y + (84.0 * sf) as i32;
                    let sp_rx = (22.0 * sf).round().max(6.0) as i32;
                    let sp_ry = (14.0 * sf).round().max(4.0) as i32;
                    for k in 0..8 {
                        let gx = spray_x
                            + ((self.tick as i32 * 5 + k * 19) % sp_rx) * m.dir;
                        let gy = spray_y - ((self.tick as i32 * 3 + k * 11) % sp_ry);
                        let col = if k % 2 == 0 { 0x0038_C840 } else { 0x0078_EC58 };
                        for oy in 0..clip_sz {
                            for ox in 0..clip_sz {
                                put_px(ctx.surface, gx + ox, gy + oy, col);
                            }
                        }
                    }
                }
            }
        }

        if self.maggie_active && !self.maggie.frames.is_empty() {
            // Use smooth toddling walk frames (6..=9) flipped right!
            let mi = if self.maggie.frames.len() >= 10 {
                6 + ((self.tick / 3) % 4)
            } else {
                (self.tick / 3) % self.maggie.frames.len()
            };
            if let Some(sp) = self.maggie.frames.get(mi) {
                sp.blit_transformed_f(
                    ctx.surface,
                    self.maggie_x as i32,
                    self.maggie_y,
                    sf,
                    true, // Maggie faces left natively -> flip right!
                    false,
                    false,
                    false,
                );
            }
        }

        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        self.canvas_buf.clear();
        self.saved_bg.clear();
        AdResult::NoError
    }
}
