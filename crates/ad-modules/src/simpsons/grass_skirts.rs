//! *Grass Skirts* — 1994 *The Simpsons* After Dark 3.0 Module.
//!
//! Ned Flanders and Homer Simpson don their spandex & floral dresses to mow
//! away your desktop and sprouting Springfield weeds (with occasional crawling
//! Maggie cameo!), using the authentic `OFst/OFtb #8000` + `RLEP #8000/#30000`
//! artwork and mower/voice SFX.

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use super::{
    CompoundAnim, MOD_GRASS_SKIRTS, RlepBank, SND_FLANDERS_HIMO, SND_FLANDERS_OPSY,
    SND_HOMER_GRSS, SND_MAGGIE_SUCK, SND_MOWER, SND_MOWER_ON, SND_MOWER_STUCK, SimpsonsPack,
    fill_rect_px, put_px,
};

struct Weed {
    x: i32,
    y: i32,
    sprite_idx: usize,
    alive: bool,
}

struct MowerActor {
    is_ned: bool,
    x: f32,
    y: i32,
    dir: i32, // -1 = mowing left, 1 = mowing right
    frame_tick: usize,
}

pub struct GrassSkirtsModule {
    anim: Option<CompoundAnim>,
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
    scale: i32,
    weed_density: i32,
    ensemble: i32,
}

impl GrassSkirtsModule {
    pub fn new() -> Self {
        Self {
            anim: None,
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
            scale: 1,
            weed_density: 60,
            ensemble: 4,
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
        self.canvas_buf.resize((w * h) as usize, 0);
        if self.clear_screen || self.saved_bg.len() != self.canvas_buf.len() {
            // Lush overgrown Springfield lawn waiting to be mowed
            for y in 0..h {
                let row = (y * w) as usize;
                for x in 0..w {
                    let blade = ((x * 7 ^ y * 13) & 15) as u32;
                    let g = 104 + blade * 2;
                    let r = 24 + (blade / 2);
                    let b = 22 + (blade / 3);
                    self.canvas_buf[row + x as usize] = (r << 16) | (g << 8) | b;
                }
            }
        } else {
            self.canvas_buf.copy_from_slice(&self.saved_bg);
        }

        // Populate sprouting weeds from RLEP #8000 (sprites 49..68)
        self.weeds.clear();
        let count = if self.weed_density < 20 {
            0
        } else {
            (8 + (self.weed_density * 48) / 100) as usize
        };
        if let Some(anim) = &self.anim {
            let weed_start = 49usize.min(anim.sprites.len());
            let weed_end = anim.sprites.len();
            if weed_end > weed_start {
                for _ in 0..count {
                    let wx = 12 + rng.rand_mod((w - 36).max(20));
                    let wy = 24 + rng.rand_mod((h - 48).max(20));
                    let si = weed_start + (rng.rand_mod((weed_end - weed_start) as i32) as usize);
                    self.weeds.push(Weed {
                        x: wx,
                        y: wy,
                        sprite_idx: si,
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
        if self.anim.is_none() {
            self.anim = Some(CompoundAnim::load(MOD_GRASS_SKIRTS, 8000));
            self.maggie = RlepBank::load(MOD_GRASS_SKIRTS, 30000);
        }
        self.saved_bg = ctx.surface.pixels().to_vec();
        let mower_choice = ctx.module.raw_control_value[0].clamp(0, 3);
        self.ensemble = ctx.module.raw_control_value[1].clamp(0, 4);
        self.weed_density = ctx.module.raw_control_value[2].clamp(0, 100);
        self.clear_screen = ctx.module.raw_control_value[3] != 0;

        self.scale = if ctx.surface.width >= 1000 { 2 } else { 1 };
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
        let band_h = 96 * self.scale;
        match choice {
            1 => {
                self.mowers.push(MowerActor {
                    is_ned: true,
                    x: (w - 40) as f32,
                    y: band_h / 2,
                    dir: -1,
                    frame_tick: 0,
                });
            }
            2 => {
                self.mowers.push(MowerActor {
                    is_ned: false,
                    x: (w - 40) as f32,
                    y: band_h / 2,
                    dir: -1,
                    frame_tick: 0,
                });
            }
            _ => {
                self.mowers.push(MowerActor {
                    is_ned: false,
                    x: (w - 40) as f32,
                    y: band_h / 2,
                    dir: -1,
                    frame_tick: 0,
                });
                self.mowers.push(MowerActor {
                    is_ned: true,
                    x: 40.0,
                    y: (h / 2).max(band_h),
                    dir: 1,
                    frame_tick: 4,
                });
            }
        }

        self.maggie_active = false;
        self.maggie_x = -60.0;
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
        let scale = self.scale;
        let pack = SimpsonsPack::global();

        let step_px = 5.5 * scale as f32;
        let strip_h = 56 * scale;
        let mut wrap_reset = false;

        for m in &mut self.mowers {
            m.x += step_px * (m.dir as f32);
            m.frame_tick = m.frame_tick.wrapping_add(1);

            let deck_x = if m.dir < 0 {
                m.x as i32 - 12 * scale
            } else {
                m.x as i32 + 54 * scale
            };
            let deck_y = m.y + 42 * scale;
            // Mow grass swath under the lawnmower deck
            let x0 = deck_x.max(0);
            let x1 = (deck_x + 48 * scale).min(w);
            let y0 = deck_y.max(0);
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
            for wd in &mut self.weeds {
                if wd.alive
                    && wd.x >= x0 - 14 * scale
                    && wd.x <= x1 + 14 * scale
                    && wd.y >= y0 - 14 * scale
                    && wd.y <= y1 + 14 * scale
                {
                    wd.alive = false;
                }
            }

            // Turn around at screen edges and advance down a row
            if m.dir < 0 && m.x < -110.0 * scale as f32 {
                m.dir = 1;
                m.y += strip_h;
                if m.y > h - 30 * scale {
                    m.y = 12;
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
                    SND_MOWER_STUCK
                };
                pack.play_voice(ctx.sound, ctx.system.sound_enabled, clip);
            } else if m.dir > 0 && m.x > (w + 20 * scale) as f32 {
                m.dir = -1;
                m.y += strip_h;
                if m.y > h - 30 * scale {
                    m.y = 12;
                    wrap_reset = true;
                }
                pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_MOWER);
            }
        }

        if wrap_reset && ctx.rng.rand_mod(2) == 0 {
            // Re-sprout fresh weeds after finishing the yard!
            self.init_lawn(w, h, ctx.rng);
        }

        // Occasional crawling Maggie cameo across the freshly mowed lawn!
        if !self.maggie_active && self.tick % 90 == 35 {
            self.maggie_active = true;
            self.maggie_x = -40.0;
            self.maggie_y = 40 + ctx.rng.rand_mod((h - 90).max(20));
            pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_MAGGIE_SUCK);
        }
        if self.maggie_active {
            self.maggie_x += 2.2 * scale as f32;
            if self.maggie_x > (w + 50) as f32 {
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
                        sp.blit_scaled(ctx.surface, wd.x, wd.y, scale);
                    }
                }
            }

            for m in &self.mowers {
                // Homer frames: 0..16, Ned frames: 22..36 (drawn left-facing natively; flip when dir > 0)
                let fi = if m.is_ned {
                    let count = anim.frames.len().saturating_sub(22).max(1);
                    22 + ((m.frame_tick / 2) % count)
                } else {
                    (m.frame_tick / 2) % 16.min(anim.frames.len().max(1))
                };
                anim.draw_frame(
                    ctx.surface,
                    fi,
                    m.x as i32,
                    m.y,
                    scale,
                    m.dir > 0,
                    false,
                );

                // Flying grass clippings spraying out of the mower
                let spray_x = if m.dir < 0 {
                    m.x as i32 + 12 * scale
                } else {
                    m.x as i32 + 78 * scale
                };
                let spray_y = m.y + 78 * scale;
                for k in 0..7 {
                    let cx = spray_x + ctx.rng.rand_mod(26 * scale) - 13 * scale;
                    let cy = spray_y - ctx.rng.rand_mod(22 * scale);
                    let col = if (k & 1) == 0 { 0x0052_D43C } else { 0x002A_9620 };
                    put_px(ctx.surface, cx, cy, col);
                    put_px(ctx.surface, cx + 1, cy, col);
                }
            }
        }

        if self.maggie_active && !self.maggie.frames.is_empty() {
            let mf = (self.tick / 3) % self.maggie.frames.len();
            self.maggie.frames[mf].blit_flipped_x(
                ctx.surface,
                self.maggie_x as i32,
                self.maggie_y,
                scale,
            );
        }

        // Periodic mower engine rumble
        if self.tick % 48 == 0 {
            pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_MOWER);
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
