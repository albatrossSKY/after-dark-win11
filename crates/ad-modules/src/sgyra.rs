//! 1:1 Decompilation of `SGYRA.AD` ("Spiral Gyra") from After Dark 1.0a (1991).
//!
//! Disassembly-backed from `docs/disasm/sgyra_seg1.asm` and `docs/disasm/sgyra_data.hex`.

use ad_sdk::palette::{AdPaletteKind, rgb};
use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

const RING_LEN: usize = 200;

/// Exact 118-entry half-wave sine table (`DS:0x009C..0x0187`, plus trailing 0 word at `0x0188`).
/// Represents `65536 * sin(pi * i / 117)` for `i = 0..=117`; `pi = 117.0` (`0x00750000`),
/// `2*pi = 234.0` (`0x00EA0000`), `pi/2 = 58.5` (`0x003A8000`).
const SGYRA_SIN_TABLE: [u16; 119] = [
        0,  1760,  3518,  5273,  7025,  8772, 10513, 12246,
    13970, 15684, 17387, 19077, 20753, 22415, 24060, 25688,
    27297, 28887, 30456, 32003, 33527, 35027, 36501, 37949,
    39370, 40763, 42126, 43458, 44760, 46029, 47265, 48467,
    49633, 50765, 51859, 52916, 53935, 54915, 55856, 56756,
    57615, 58433, 59209, 59941, 60631, 61277, 61879, 62436,
    62949, 63415, 63836, 64212, 64540, 64823, 65058, 65247,
    65388, 65483, 65530, 65530, 65483, 65388, 65247, 65058,
    64823, 64540, 64212, 63836, 63415, 62949, 62436, 61879,
    61277, 60631, 59941, 59209, 58433, 57615, 56756, 55856,
    54915, 53935, 52916, 51859, 50765, 49633, 48467, 47265,
    46029, 44760, 43458, 42126, 40763, 39370, 37949, 36501,
    35027, 33527, 32003, 30456, 28887, 27297, 25688, 24060,
    22415, 20753, 19077, 17387, 15684, 13970, 12246, 10513,
     8772,  7025,  5273,  3518,  1760,     0,     0,
];

/// Exact 16.16 fixed-point sine from `SGYRA.AD` `ord_9` (`1:0C6C`).
fn sgyra_fix_sin(mut a: i32) -> i32 {
    if a <= 0 {
        a = 0x0075_0000i32.wrapping_sub(a);
    }
    a %= 0x00EA_0000;
    let neg = a > 0x0075_0000;
    if neg {
        a -= 0x0075_0000;
    }
    let frac = (a & 0xFFFF) as u16;
    let mut idx = a >> 16;
    if idx < 0 {
        idx = -idx;
    }
    let idx = (idx as usize).min(117);
    let y0 = SGYRA_SIN_TABLE[idx] as i32;
    let y1 = SGYRA_SIN_TABLE[idx + 1] as i32;
    let prod = (y1 - y0).wrapping_mul(frac as i32);
    let val = y0 + (prod >> 16);
    if neg { -val } else { val }
}

/// Exact 16-bit HSV to 8-bit RGB from `SGYRA.AD` (`1:0281`).
fn sgyra_hsv_to_rgb(h: u16, s: u16, v: u16) -> u32 {
    let min_val = (((0x0001_0000u32 - s as u32) * v as u32) >> 16) as u16;
    let delta = v.wrapping_sub(min_val) as u32;

    let (r, g, b) = if h <= 0x2AAA {
        let g = ((delta * h as u32) / 0x2AAA) as u16 + min_val;
        (v, g, min_val)
    } else if h <= 0x5555 {
        let r = v.wrapping_sub(((delta * (h - 0x2AAA) as u32) / 0x2AAB) as u16);
        (r, v, min_val)
    } else if h <= 0x7FFF {
        let b = ((delta * (h - 0x5555) as u32) / 0x2AAA) as u16 + min_val;
        (min_val, v, b)
    } else if h <= 0xAAAA {
        let g = v.wrapping_sub(((delta * (h - 0x7FFF) as u32) / 0x2AAB) as u16);
        (min_val, g, v)
    } else if h <= 0xD554 {
        let r = ((delta * (h - 0xAAAA) as u32) / 0x2AAA) as u16 + min_val;
        (r, min_val, v)
    } else {
        let b = v.wrapping_sub(((delta * (h - 0xD554) as u32) / 0x2AAB) as u16);
        (v, min_val, b)
    };

    rgb((r >> 8) as u8, (g >> 8) as u8, (b >> 8) as u8)
}

pub struct SpiralGyraModule {
    max_x: i32,
    max_y: i32,
    max_rx: i32,
    max_ry: i32,
    angle: i32,
    angle_offset: i32,
    angle_step: i32,
    cx: i32,
    cy: i32,
    rx: i32,
    ry: i32,
    cx_dir: i32,
    cy_dir: i32,
    rx_dir: i32,
    ry_dir: i32,
    head_idx: usize,
    tail_idx: usize,
    color_idx: u16,
    draw_color: u32,
    ring_x1: [i32; RING_LEN],
    ring_y1: [i32; RING_LEN],
    ring_x2: [i32; RING_LEN],
    ring_y2: [i32; RING_LEN],
}

impl SpiralGyraModule {
    pub fn new() -> Self {
        Self {
            max_x: 640,
            max_y: 480,
            max_rx: 160,
            max_ry: 120,
            angle: 0,
            angle_offset: 0x0075_0000,
            angle_step: 0x0001_0000,
            cx: 0,
            cy: 0,
            rx: 1,
            ry: 1,
            cx_dir: 1,
            cy_dir: 1,
            rx_dir: 1,
            ry_dir: 1,
            head_idx: RING_LEN - 1,
            tail_idx: 0,
            color_idx: 0,
            draw_color: rgb(255, 255, 255),
            ring_x1: [0; RING_LEN],
            ring_y1: [0; RING_LEN],
            ring_x2: [0; RING_LEN],
            ring_y2: [0; RING_LEN],
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "sgyra".to_string(),
            filename: "SGYRA.AD".to_string(),
            name: "Spiral Gyra".to_string(),
            credit: "Spiral Gyra by Keith Alphonso & John Casey.\n©1990 Berkeley Systems Inc."
                .to_string(),
            about: "SPIRAL GYRA(tm) is another line drawing module with an interesting twist or two."
                .to_string(),
            controls: [
                AdControl::NumericSlider {
                    title: "Max Lines:".to_string(),
                    default_raw: 54,
                    unit: String::new(),
                    min: 20,
                    max: 360,
                },
                AdControl::NumericSlider {
                    title: "Min Lines:".to_string(),
                    default_raw: 28,
                    unit: "%".to_string(),
                    min: 0,
                    max: 100,
                },
                AdControl::NumericSlider {
                    title: "Color Cycling:".to_string(),
                    default_raw: 32,
                    unit: "%".to_string(),
                    min: 0,
                    max: 100,
                },
                AdControl::None,
            ],
            target_frame_ms: 20,
        }
    }
}

impl Default for SpiralGyraModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for SpiralGyraModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.max_x = ctx.module.rgn_width.max(8);
        self.max_y = ctx.module.rgn_height.max(8);
        self.max_rx = (self.max_x / 4).max(4);
        self.max_ry = (self.max_y / 4).max(4);

        self.angle = 0;
        self.angle_offset = 0x0075_0000; // pi (117 << 16)
        self.cx_dir = 1;
        self.cy_dir = 1;
        self.rx_dir = 1;
        self.ry_dir = 1;
        self.color_idx = 0;
        self.draw_color = rgb(255, 255, 255);

        // Exact Mac-ported random scaling: ((rand() + 32768) * N) / 65536
        self.rx = (((ctx.rng.rand() as i64 + 32768) * (self.max_x / 8) as i64) / 65536) as i32;
        if self.rx < 1 {
            self.rx = 1;
        }
        self.ry = (((ctx.rng.rand() as i64 + 32768) * (self.max_y / 8) as i64) / 65536) as i32;
        if self.ry < 1 {
            self.ry = 1;
        }
        self.cx = (((ctx.rng.rand() as i64 + 32768) * (self.max_x / 2) as i64) / 65536) as i32;
        self.cy = (((ctx.rng.rand() as i64 + 32768) * (self.max_y / 2) as i64) / 65536) as i32;

        self.ring_x1.fill(0);
        self.ring_y1.fill(0);
        self.ring_x2.fill(0);
        self.ring_y2.fill(0);
        self.tail_idx = 0;
        self.head_idx = RING_LEN - 1; // 199

        let div = ((((ctx.rng.rand() as i64 + 32768) * 500) / 65536) + 1) as i32;
        self.angle_step = 0x00EA_0000 / div.max(1);

        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.surface.fill_black();
        AdResult::PaletteRequest(AdPaletteKind::Hsv)
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        let max_lines = ctx.module.control_value[0].clamp(20, 360);
        let min_lines = ((ctx.module.control_value[1] * max_lines) / 100).max(20);
        let color_cycle = (((100 - ctx.module.control_value[2].clamp(0, 100)) * 980) / 100) + 20;

        let color_mode = if ctx.system.bits_per_pixel < 4 { 0 } else { 2 };
        let max_color_idx: i32 = if color_mode == 0 { 1 } else { 0xFFFF };
        let color_step: u16 = if color_mode == 0 {
            0
        } else {
            (0xFFFF / color_cycle.max(1)) as u16
        };

        let black = rgb(0, 0, 0);
        // Original runs 30 quads per Win16 DoDrawFrame; running 6 quads per 20ms frame (~300 quads/sec)
        // preserves the exact per-line trajectory with smooth 50 FPS double-buffered motion.
        for _ in 0..6 {
            let angle2 = self.angle.wrapping_add(self.angle_offset);
            let x1 = ((self.rx as i64 * sgyra_fix_sin(self.angle.wrapping_add(0x003A_8000)) as i64)
                >> 16) as i32
                + self.cx;
            let y1 = ((self.ry as i64 * sgyra_fix_sin(self.angle) as i64) >> 16) as i32 + self.cy;
            let x2 = ((self.rx as i64 * sgyra_fix_sin(angle2.wrapping_add(0x003A_8000)) as i64)
                >> 16) as i32
                + self.cx;
            let y2 = ((self.ry as i64 * sgyra_fix_sin(angle2) as i64) >> 16) as i32 + self.cy;

            // 1. Erase oldest 4-way symmetric quad (exact order: orig, XY, X, Y)
            let tx1 = self.ring_x1[self.tail_idx];
            let ty1 = self.ring_y1[self.tail_idx];
            let tx2 = self.ring_x2[self.tail_idx];
            let ty2 = self.ring_y2[self.tail_idx];
            ctx.surface.line(tx1, ty1, tx2, ty2, 1, black);
            ctx.surface
                .line(self.max_x - tx1, self.max_y - ty1, self.max_x - tx2, self.max_y - ty2, 1, black);
            ctx.surface
                .line(self.max_x - tx1, ty1, self.max_x - tx2, ty2, 1, black);
            ctx.surface
                .line(tx1, self.max_y - ty1, tx2, self.max_y - ty2, 1, black);
            self.tail_idx += 1;
            if self.tail_idx >= RING_LEN {
                self.tail_idx = 0;
            }

            // 2. Advance HSV color
            if color_mode == 2 {
                self.color_idx = self.color_idx.wrapping_add(color_step);
                let h = ((0xFFFEu32 * self.color_idx as u32) as i32 / max_color_idx) as u16;
                self.draw_color = sgyra_hsv_to_rgb(h, 0xFFFF, 0xFFFF);
            }

            // 3. Draw new 4-way symmetric quad (exact order: orig, X, Y, XY)
            ctx.surface.line(x1, y1, x2, y2, 1, self.draw_color);
            ctx.surface
                .line(self.max_x - x1, y1, self.max_x - x2, y2, 1, self.draw_color);
            ctx.surface
                .line(x1, self.max_y - y1, x2, self.max_y - y2, 1, self.draw_color);
            ctx.surface
                .line(self.max_x - x1, self.max_y - y1, self.max_x - x2, self.max_y - y2, 1, self.draw_color);

            // 4. Push into ring buffer
            self.ring_x1[self.head_idx] = x1;
            self.ring_y1[self.head_idx] = y1;
            self.ring_x2[self.head_idx] = x2;
            self.ring_y2[self.head_idx] = y2;
            self.head_idx += 1;
            if self.head_idx >= RING_LEN {
                self.head_idx = 0;
            }

            // 5. Step angle, center (with bounce + re-randomization), and radii
            self.angle = self.angle.wrapping_add(self.angle_step);

            self.cx += self.cx_dir;
            if self.cx < 0 || self.cx > self.max_x - 1 {
                self.cx_dir = if self.cx < 0 { 1 } else { -1 };
                let denom = min_lines
                    + ((((ctx.rng.rand() as i64 + 32768) * max_lines as i64) / 65536) as i32);
                self.angle_step = 0x00EA_0000 / denom.max(1);
                let odiv = ((((ctx.rng.rand() as i64 + 32768) << 3) / 65536) + 1) as i32;
                self.angle_offset = 0x0075_0000 / odiv.max(1);
            }

            self.cy += self.cy_dir;
            if self.cy < 0 || self.cy > self.max_y {
                self.cy_dir = if self.cy < 0 { 1 } else { -1 };
                let denom = min_lines
                    + ((((ctx.rng.rand() as i64 + 32768) * max_lines as i64) / 65536) as i32);
                self.angle_step = 0x00EA_0000 / denom.max(1);
                let odiv = ((((ctx.rng.rand() as i64 + 32768) << 3) / 65536) + 1) as i32;
                self.angle_offset = 0x0075_0000 / odiv.max(1);
            }

            self.rx += self.rx_dir;
            if self.rx < 3 {
                self.rx_dir = 1;
            } else if self.rx > self.max_rx {
                self.rx_dir = -1;
            }

            self.ry += self.ry_dir;
            if self.ry < 3 {
                self.ry_dir = 1;
            } else if self.ry > self.max_ry {
                self.ry_dir = -1;
            }
        }

        AdResult::NoError
    }
}
