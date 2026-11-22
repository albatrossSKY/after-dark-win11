//! Exact 1:1 decompilation of After Dark 1.0a's **Flying Toasters** module
//! (`TOASTERS.AD`, `SEG 1`, `0x0000..0x0C85`, by Bill Stewart, ©1990 Berkeley Systems Inc.).

use ad_sdk::canvas::{AdBitmap, ROP_SRCCOPY};
use ad_sdk::palette::rgb;
use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult, SaverMode};

// Exact original 64x64 4bpp color sprites from TOASTERS.AD
// CRITICAL: #2 is WING_MID (high-mid) and #3 is WING_MD (low-mid)!
const BMP_WING_DN: &[u8] = include_bytes!("../../../assets/toasters/RT_BITMAP_#1.bmp");
const BMP_WING_MID: &[u8] = include_bytes!("../../../assets/toasters/RT_BITMAP_#2.bmp");
const BMP_WING_MD: &[u8] = include_bytes!("../../../assets/toasters/RT_BITMAP_#3.bmp");
const BMP_WING_UP: &[u8] = include_bytes!("../../../assets/toasters/RT_BITMAP_#4.bmp");
const BMP_LT_TOAST: &[u8] = include_bytes!("../../../assets/toasters/RT_BITMAP_#5.bmp");
const BMP_MD_TOAST: &[u8] = include_bytes!("../../../assets/toasters/RT_BITMAP_#6.bmp");
const BMP_DK_TOAST: &[u8] = include_bytes!("../../../assets/toasters/RT_BITMAP_#7.bmp");

// Exact original 64x64 1bpp monochrome sprites from TOASTERS.AD
const BMP_BWING_DN: &[u8] = include_bytes!("../../../assets/toasters/RT_BITMAP_#8.bmp");
const BMP_BWINGMID: &[u8] = include_bytes!("../../../assets/toasters/RT_BITMAP_#9.bmp");
const BMP_BWING_MD: &[u8] = include_bytes!("../../../assets/toasters/RT_BITMAP_#10.bmp");
const BMP_BWING_UP: &[u8] = include_bytes!("../../../assets/toasters/RT_BITMAP_#11.bmp");
const BMP_BWMTOAST: &[u8] = include_bytes!("../../../assets/toasters/RT_BITMAP_#12.bmp");

struct ToasterSprites {
    wing_dn: AdBitmap,
    wing_md: AdBitmap,
    wing_mid: AdBitmap,
    wing_up: AdBitmap,
    lt_toast: AdBitmap,
    md_toast: AdBitmap,
    dk_toast: AdBitmap,
}

impl ToasterSprites {
    fn load(monochrome: bool) -> Option<Self> {
        if monochrome {
            Some(Self {
                wing_dn: AdBitmap::from_bmp_bytes(BMP_BWING_DN)?,
                wing_md: AdBitmap::from_bmp_bytes(BMP_BWING_MD)?,
                wing_mid: AdBitmap::from_bmp_bytes(BMP_BWINGMID)?,
                wing_up: AdBitmap::from_bmp_bytes(BMP_BWING_UP)?,
                lt_toast: AdBitmap::from_bmp_bytes(BMP_BWMTOAST)?,
                md_toast: AdBitmap::from_bmp_bytes(BMP_BWMTOAST)?,
                dk_toast: AdBitmap::from_bmp_bytes(BMP_BWMTOAST)?,
            })
        } else {
            Some(Self {
                wing_dn: AdBitmap::from_bmp_bytes(BMP_WING_DN)?,
                wing_md: AdBitmap::from_bmp_bytes(BMP_WING_MD)?,
                wing_mid: AdBitmap::from_bmp_bytes(BMP_WING_MID)?,
                wing_up: AdBitmap::from_bmp_bytes(BMP_WING_UP)?,
                lt_toast: AdBitmap::from_bmp_bytes(BMP_LT_TOAST)?,
                md_toast: AdBitmap::from_bmp_bytes(BMP_MD_TOAST)?,
                dk_toast: AdBitmap::from_bmp_bytes(BMP_DK_TOAST)?,
            })
        }
    }
}

pub struct ToastersModule {
    /// 1-indexed upper bound (`1..num_slots`, matching `DS:0x0010` = `iControlValue[0] + 1`).
    num_slots: usize,
    toast_shade: i32,
    /// Proportional HD/4K sprite size (`64` at <=480p, scales smoothly up to 4K!).
    sprite_sz: i32,
    scale_f: f32,
    sprites: Option<ToasterSprites>,
    // Exact 15-element 1-indexed arrays from TOASTERS.AD DS:0x0472..0x0547
    state: [i32; 15],
    old_x: [i32; 15],
    old_y: [i32; 15],
    vx: [i32; 15],
    vy: [i32; 15],
    x: [i32; 15],
    y: [i32; 15],
}

impl ToastersModule {
    pub fn new() -> Self {
        Self {
            num_slots: 3,
            toast_shade: 0,
            sprite_sz: 64,
            scale_f: 1.0,
            sprites: None,
            state: [0; 15],
            old_x: [0; 15],
            old_y: [0; 15],
            vx: [0; 15],
            vy: [0; 15],
            x: [0; 15],
            y: [0; 15],
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "toasters".to_string(),
            filename: "TOASTERS.AD".to_string(),
            name: "Flying Toasters".to_string(),
            credit: "Flying Toasters by Bill Stewart.\r\n  ©1990 Berkeley Systems Inc.".to_string(),
            about: "FLYING TOASTERS (tm)\r\n\r\n\"I really just walked into the kitchen and said to myself, 'Flying Toasters!'\"\r\n  — Jack Eastman\r\n\r\nYou can vary the number of flying objects (1 to 12) and the toast darkness (Light, Medium, Dark)."
                .to_string(),
            controls: [
                AdControl::NumericSlider {
                    title: "Flying Objects".to_string(),
                    default_raw: 77,
                    unit: String::new(),
                    min: 1,
                    max: 12,
                },
                AdControl::LabeledSlider {
                    title: "Toast:".to_string(),
                    default_raw: 0,
                    labels: vec!["Light".into(), "Medium".into(), "Dark".into()],
                    thresholds: vec![33, 67, 100],
                },
                AdControl::None,
                AdControl::None,
            ],
            // ~30 fps gives 12-step wing cycle ~400ms (matching DoAbout's 480ms/cycle)
            target_frame_ms: 33,
        }
    }

    fn apply_toast_control(&mut self, ctrl_val: i32) {
        match ctrl_val {
            0 => self.toast_shade = 0,
            33 => self.toast_shade = 1,
            67 | 100 => self.toast_shade = 2,
            _ => {}
        }
    }

    /// Exact 1:1 `CheckNoCollision(idx)` (`1:0AE6..1:0B81`): half-open `sprite_sz × sprite_sz` test.
    fn check_no_collision(&self, idx: usize) -> bool {
        let sx = self.x[idx];
        let sy = self.y[idx];
        let sz = self.sprite_sz;
        for j in 1..self.num_slots {
            if j != idx {
                if (sx - self.x[j]).abs() < sz && (sy - self.y[j]).abs() < sz {
                    return false;
                }
            }
        }
        true
    }

    /// Exact 1:1 `SpawnObject(idx)` (`1:09E6..1:0AE5`), scaled cleanly for modern HD/4K displays.
    fn spawn_object(&mut self, idx: usize, ctx: &mut AdContext<'_>) -> bool {
        let sz = self.sprite_sz;
        let w = ctx.module.rgn_width.max(sz);
        let h = ctx.module.rgn_height.max(sz);
        let pad = (20.0 * self.scale_f).round() as i32;
        let mut tries = 0;
        loop {
            tries += 1;
            if tries > 100 {
                return false;
            }
            if ctx.rng.rand_mod(100) < 50 {
                // 50%: spawn off RIGHT edge
                let sx = w + pad;
                let sy = ctx.rng.rand_mod(h);
                self.old_x[idx] = sx;
                self.x[idx] = sx;
                self.old_y[idx] = sy;
                self.y[idx] = sy;
            } else {
                // 50%: spawn off TOP edge
                let sx = ctx.rng.rand_mod(w) + pad;
                let sy = -(sz - 4);
                self.old_x[idx] = sx;
                self.x[idx] = sx;
                self.old_y[idx] = sy;
                self.y[idx] = sy;
            }
            if self.check_no_collision(idx) {
                break;
            }
        }

        // 70% Toaster, 30% Toast
        let sp = self.scale_f.round().max(1.0) as i32;
        if ctx.rng.rand_mod(100) < 70 {
            let vy = (ctx.rng.rand_mod(3) + 1) * sp;
            self.vy[idx] = vy;
            self.vx[idx] = vy * 2;
            self.state[idx] = ctx.rng.rand_mod(12); // 0..11
        } else {
            self.vy[idx] = sp;
            self.vx[idx] = sp * 2;
            self.state[idx] = 12; // Toast
        }
        true
    }
}

impl Default for ToastersModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for ToastersModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        let count = ctx.module.control_value[0].clamp(1, 12) as usize;
        self.num_slots = count + 1; // 1-indexed slots 1..count
        self.apply_toast_control(ctx.module.control_value[1]);

        self.scale_f = (ctx.module.rgn_height as f32 / 480.0).clamp(1.0, 4.0);
        self.sprite_sz = (64.0 * self.scale_f).round().max(64.0) as i32;

        let mono = ctx.system.bits_per_pixel == 1;
        self.sprites = ToasterSprites::load(mono);
        if self.sprites.is_none() {
            return AdResult::MemError;
        }

        // Loop 1: zero all active slots first (exact 1:1 behavior from 1:0162..018B)
        for i in 1..self.num_slots {
            self.old_x[i] = 0;
            self.x[i] = 0;
            self.old_y[i] = 0;
            self.y[i] = 0;
        }

        // Loop 2: spawn each object; reduce num_slots if screen is too crowded
        for i in 1..self.num_slots {
            if !self.spawn_object(i, ctx) {
                self.num_slots = i;
                break;
            }
        }

        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.surface.fill_black();
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        if self.sprites.is_none() {
            return AdResult::NoError;
        }
        let black = rgb(0, 0, 0);
        let rgn_h = ctx.module.rgn_height;
        let sz = self.sprite_sz;
        let sp = self.scale_f.round().max(1.0) as i32;

        for i in 1..self.num_slots {
            // STEP 1: Erase exposed trail strips for toasters & toast cleanly at any HD/4K scale
            if self.old_x[i] + sz > self.x[i] + sz {
                ctx.surface.fill_rect_rgb(
                    self.x[i] + sz,
                    self.old_y[i],
                    self.old_x[i] + sz,
                    self.old_y[i] + sz,
                    black,
                );
            }
            if self.y[i] > self.old_y[i] {
                ctx.surface.fill_rect_rgb(
                    self.old_x[i],
                    self.old_y[i],
                    self.old_x[i] + sz,
                    self.y[i],
                    black,
                );
            }

            // STEP 2: Draw sprite via crisp opaque SRCCOPY (native 1:1 at 640x480, scaled cleanly for HD/4K!)
            if let Some(sprites) = self.sprites.as_ref() {
                let bmp: Option<&AdBitmap> = match self.state[i] {
                    0 | 1 => Some(&sprites.wing_dn),
                    2 | 3 | 10 | 11 => Some(&sprites.wing_md),
                    4 | 5 | 8 | 9 => Some(&sprites.wing_mid),
                    6 | 7 => Some(&sprites.wing_up),
                    12 => match self.toast_shade {
                        0 => Some(&sprites.lt_toast),
                        1 => Some(&sprites.md_toast),
                        _ => Some(&sprites.dk_toast),
                    },
                    _ => None,
                };
                if let Some(bmp) = bmp {
                    ctx.surface.set_text_color(rgb(0, 0, 0));
                    ctx.surface.set_bk_color(rgb(255, 255, 255));
                    if sz == bmp.width && sz == bmp.height {
                        ctx.surface.bit_blt_bitmap(
                            self.x[i],
                            self.y[i],
                            bmp.width,
                            bmp.height,
                            bmp,
                            0,
                            0,
                            ROP_SRCCOPY,
                        );
                    } else {
                        ctx.surface.stretch_blt_bitmap(
                            self.x[i],
                            self.y[i],
                            sz,
                            sz,
                            bmp,
                            0,
                            0,
                            bmp.width,
                            bmp.height,
                            ROP_SRCCOPY,
                        );
                    }
                }
            }

            // STEP 3: Save drawn position
            self.old_x[i] = self.x[i];
            self.old_y[i] = self.y[i];

            // STEP 4: Random toaster speed variation
            if self.state[i] != 12 && ctx.rng.rand() < 550 {
                self.vy[i] += ctx.rng.rand_mod(3) * sp;
                if self.vy[i] > 3 * sp {
                    self.vy[i] = 3 * sp;
                }
                if self.vy[i] < sp {
                    self.vy[i] = sp;
                }
                self.vx[i] = self.vy[i] * 2;
            }

            // STEP 5: Horizontal move & left-edge offscreen respawn
            self.x[i] -= self.vx[i];
            if self.x[i] <= -(sz + 16) {
                ctx.surface.fill_rect_rgb(
                    self.x[i],
                    self.y[i],
                    self.x[i] + sz,
                    self.y[i] + sz,
                    black,
                );
                if !self.spawn_object(i, ctx) {
                    return AdResult::MemError;
                }
            }

            // STEP 6: Vertical move & bottom-edge offscreen respawn
            let save_y = self.y[i];
            self.y[i] += self.vy[i];
            if self.y[i] >= rgn_h + sz {
                ctx.surface.fill_rect_rgb(
                    self.x[i],
                    self.y[i],
                    self.x[i] + sz,
                    self.y[i] + sz,
                    black,
                );
                let _ = self.spawn_object(i, ctx);
            }

            // STEP 7: Immediate collision check & dodge + deceleration
            if !self.check_no_collision(i) {
                self.x[i] += self.vx[i];
                self.y[i] = save_y;
                if self.vy[i] > sp {
                    self.vy[i] -= sp;
                    self.vx[i] = self.vy[i] * 2;
                }
                self.y[i] += 3 * sp;
                if !self.check_no_collision(i) {
                    self.y[i] = save_y;
                }
            }

            // STEP 8: 2-step look-ahead avoidance (toasters only)
            if self.state[i] != 12 {
                let save_x = self.x[i];
                let cur_y = self.y[i];
                self.y[i] += self.vy[i] * 2;
                self.x[i] -= self.vx[i] * 2;
                if !self.check_no_collision(i) {
                    self.x[i] = save_x;
                    self.y[i] = cur_y + 3 * sp;
                    if !self.check_no_collision(i) {
                        self.y[i] = cur_y;
                        self.x[i] = save_x;
                    }
                } else {
                    self.x[i] = save_x;
                    self.y[i] = cur_y;
                }
            }

            // STEP 9: Advance wing animation cycle (fast toasters step by +2, slow/med by +1)
            if self.state[i] < 12 {
                if self.vx[i] > 4 * sp {
                    self.state[i] += 2;
                } else {
                    self.state[i] += 1;
                }
                if self.state[i] > 11 {
                    self.state[i] = 0;
                }
            }
        }

        AdResult::NoError
    }

    fn do_close(&mut self, _ctx: &mut AdContext<'_>) -> AdResult {
        self.sprites = None;
        AdResult::NoError
    }

    fn do_button_message(&mut self, _control_index: usize) -> AdResult {
        AdResult::NoError
    }
}

/// Helper for live Demo control update matching `DoButtonMessage` (`1:055E`):
/// returns `true` if the module needs a full restart (`RESTART_ME`).
impl ToastersModule {
    pub fn on_live_control_change(
        &mut self,
        slot: usize,
        mapped_val: i32,
        mode: SaverMode,
    ) -> bool {
        if mode != SaverMode::Demo {
            return false;
        }
        match slot {
            0 => true, // RESTART_ME when Flying Objects count changes
            1 => {
                self.apply_toast_control(mapped_val);
                false
            }
            _ => false,
        }
    }
}
