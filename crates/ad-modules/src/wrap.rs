//! 1:1 Decompilation of `WRAP.AD` ("Wrap Around") from After Dark 1.0a (1991).
//!
//! Disassembly-backed from `docs/disasm/wrap_seg1.asm` and `docs/disasm/wrap_data.hex`.

use ad_sdk::palette::{AdPaletteKind, rgb};
use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

/// 7-entry rainbow stops (`DS:0x0010..0x0039`).
const COLOR_STOPS: [(u16, u16, u16); 7] = [
    (0xFFFF, 0x0000, 0x0000), // Red
    (0xFFFF, 0xFFFF, 0x0000), // Yellow
    (0x0000, 0xFFFF, 0x0000), // Green
    (0x0000, 0xFFFF, 0xFFFF), // Cyan
    (0x0000, 0x0000, 0xFFFF), // Blue
    (0xFFFF, 0x0000, 0xFFFF), // Magenta
    (0xFFFF, 0x0000, 0x0000), // Red
];

/// Exact 128-entry half-wave sine table (`DS:0x0070..0x016F`, plus sentinel `0x0100` at `0x0170`).
const WRAP_SIN_TABLE: [u16; 129] = [
        0,  1621,  3241,  4859,  6474,  8085,  9691, 11292,
    12885, 14470, 16047, 17614, 19169, 20714, 22245, 23763,
    25267, 26755, 28226, 29680, 31117, 32534, 33931, 35307,
    36662, 37995, 39304, 40589, 41849, 43084, 44292, 45473,
    46627, 47751, 48847, 49913, 50948, 51952, 52924, 53864,
    54771, 55644, 56484, 57288, 58058, 58792, 59491, 60152,
    60777, 61365, 61915, 62428, 62902, 63338, 63735, 64093,
    64411, 64691, 64930, 65130, 65291, 65411, 65491, 65531,
    65531, 65491, 65411, 65291, 65130, 64930, 64691, 64411,
    64093, 63735, 63338, 62902, 62428, 61915, 61365, 60777,
    60152, 59491, 58792, 58058, 57288, 56484, 55644, 54771,
    53864, 52924, 51952, 50948, 49913, 48847, 47751, 46627,
    45473, 44292, 43084, 41849, 40589, 39304, 37995, 36662,
    35307, 33931, 32534, 31117, 29680, 28226, 26755, 25267,
    23763, 22245, 20714, 19169, 17614, 16047, 14470, 12885,
    11292,  9691,  8085,  6474,  4859,  3241,  1621,     0,
    0x0100,
];

/// 22-entry EGA color ramp for 4-bpp mode (`DS:0x07DA..0x0831`).
const PALETTE22: [u32; 22] = [
    rgb(  0,   0,   0),
    rgb(  0,   0, 255),
    rgb(  0,   0, 128),
    rgb(128,   0, 128),
    rgb(255,   0, 255),
    rgb(128,   0, 128),
    rgb(128,   0,   0),
    rgb(255,   0,   0),
    rgb(128,   0,   0),
    rgb(128, 128,   0),
    rgb(255, 255,   0),
    rgb(128, 128,   0),
    rgb( 85,  85,  85),
    rgb(255, 255, 255),
    rgb(170, 170, 170),
    rgb(  0, 128,   0),
    rgb(  0, 255,   0),
    rgb(  0, 128,   0),
    rgb(  0, 128, 128),
    rgb(  0, 255, 255),
    rgb(  0, 128, 128),
    rgb(  0,   0, 128),
];

/// Exact 16.16 × 16.16 -> 16.16 `FixMul` (`ord_7`, `1:0DD6`).
fn fix_mul(a: i32, b: i32) -> i32 {
    let neg = (a ^ b) < 0;
    let ua = a.unsigned_abs();
    let ub = b.unsigned_abs();
    let a_lo = ua & 0xFFFF;
    let a_hi = ua >> 16;
    let b_lo = ub & 0xFFFF;
    let b_hi = ub >> 16;
    let p_ll_hi = (a_lo * b_lo) >> 16;
    let p_hh = a_hi * b_hi;
    let lo_part = ((p_hh & 0xFFFF) << 16).wrapping_add(p_ll_hi);
    let cross = (a_hi * b_lo).wrapping_add(a_lo * b_hi);
    let res = if (p_hh >> 16) != 0 || (p_hh & 0xFFFF) >= 0x7E00 {
        0x7FFF_FFFFu32
    } else {
        cross.wrapping_add(lo_part)
    };
    if neg { -(res as i32) } else { res as i32 }
}

/// Exact 2.30 `FracMul` (`ord_5`, `1:0ED8`).
fn frac_mul(a: i32, b: i32) -> i32 {
    let neg = (a ^ b) < 0;
    let ua = a.unsigned_abs();
    let ub = b.unsigned_abs();
    let a_lo = ua & 0xFFFF;
    let a_hi = ua >> 16;
    let b_lo = ub & 0xFFFF;
    let b_hi = ub >> 16;
    let p_ll_top = (a_lo * b_lo) >> 30;
    let p_hh_sh = (a_hi * b_hi) << 2;
    let cross = (a_hi * b_lo).wrapping_add(a_lo * b_hi);
    let res = p_hh_sh.wrapping_add(p_ll_top).wrapping_add(cross >> 14);
    if neg { -(res as i32) } else { res as i32 }
}

/// Exact 16.16 `FixDiv` (`ord_8`, `1:0FD2`, Mac `FixRatio` with round-half-up).
fn fix_div(num: i32, den: i32) -> i32 {
    if den == 0 {
        return 0;
    }
    let neg = (num ^ den) < 0;
    let un = num.unsigned_abs() as u64;
    let ud = den.unsigned_abs() as u64;
    let q = (((un << 17) / ud + 1) >> 1) as u32;
    if neg { -(q as i32) } else { q as i32 }
}

/// Exact 16.16 fixed-point sine (`ord_12`, `1:1168`, `254.0 == 2*pi`).
fn wrap_fix_sin(mut a: i32) -> i32 {
    a %= 0x00FE_0000;
    if a < 0 {
        a += 0x00FE_0000;
    }
    let neg = a > 0x007F_0000;
    if neg {
        a -= 0x007F_0000;
    }
    let frac = (a & 0xFFFF) as u16;
    let idx = ((a >> 16) as usize).min(127);
    let y0 = WRAP_SIN_TABLE[idx] as i32;
    let y1 = WRAP_SIN_TABLE[idx + 1] as i32;
    let prod = (y1 - y0).wrapping_mul(frac as i32);
    let val = y0 + (prod >> 16);
    if neg { -val } else { val }
}

/// Exact 13 parametric curve functions (`GetCurveFunc` `1:081F`, jump table `1:08E0`).
fn eval_curve(idx: usize, t: i32) -> i32 {
    match idx {
        // QUIRK (1:0908): Original Mac port bug produces radial fan/ribbon shapes pinned to center!
        0 => ((t << 1) - 1).abs(),
        1 => wrap_fix_sin(t.wrapping_mul(254)) << 14,
        2 => -(wrap_fix_sin(t.wrapping_mul(254)) << 14),
        3 => wrap_fix_sin(t.wrapping_add(0x4000).wrapping_mul(254)) << 14,
        4 => -(wrap_fix_sin(t.wrapping_add(0x4000).wrapping_mul(254)) << 14),
        5 => wrap_fix_sin(t.wrapping_mul(508)) << 14,
        6 => -(wrap_fix_sin(t.wrapping_mul(508)) << 14),
        7 => wrap_fix_sin(t.wrapping_add(0x2000).wrapping_mul(508)) << 14,
        8 => -(wrap_fix_sin(t.wrapping_add(0x2000).wrapping_mul(508)) << 14),
        9 => wrap_fix_sin(t.wrapping_mul(762)) << 14,
        10 => -(wrap_fix_sin(t.wrapping_mul(762)) << 14),
        11 => wrap_fix_sin(t.wrapping_mul(762).wrapping_add(0x003F_8000)) << 14,
        _ => -(wrap_fix_sin(t.wrapping_mul(762).wrapping_add(0x003F_8000)) << 14),
    }
}

pub struct WrapAroundModule {
    wrap_seed: u32,
    num_lines: i32,
    line_idx: i32,
    wait_start_tick: u64,
    first_curve: bool,
    color_speed: i32,
    color_mode: i32,
    fn_x1: usize,
    fn_y1: usize,
    fn_x2: usize,
    fn_y2: usize,
    center_x: i32,
    center_y: i32,
    half_w: i32,
    half_h: i32,
    start_hue: i32,
    draw_color: u32,
}

impl WrapAroundModule {
    pub fn new() -> Self {
        Self {
            wrap_seed: 1,
            num_lines: 50,
            line_idx: -1,
            wait_start_tick: 0,
            first_curve: true,
            color_speed: 25,
            color_mode: 3,
            fn_x1: 1,
            fn_y1: 2,
            fn_x2: 3,
            fn_y2: 4,
            center_x: 320,
            center_y: 240,
            half_w: 288,
            half_h: 216,
            start_hue: 0,
            draw_color: rgb(255, 255, 255),
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "wrap".to_string(),
            filename: "WRAP.AD".to_string(),
            name: "Wrap Around".to_string(),
            credit: "Wrap Around by Richard Lesh.\n©1990 Berkeley Systems Inc.".to_string(),
            about: "WRAP AROUND (tm) draws closed three dimensional loops in space.\n\nYou can choose how long each drawing stays on the screen, the number of lines in each drawing, and how fast the color in the lines changes.".to_string(),
            controls: [
                AdControl::NumericSlider {
                    title: "Delay:".to_string(),
                    default_raw: 10,
                    unit: " sec".to_string(),
                    min: 0,
                    max: 100,
                },
                AdControl::NumericSlider {
                    title: "Number of Lines:".to_string(),
                    default_raw: 50,
                    unit: String::new(),
                    min: 50,
                    max: 650,
                },
                AdControl::NumericSlider {
                    title: "Color Speed:".to_string(),
                    default_raw: 25,
                    unit: "%".to_string(),
                    min: 0,
                    max: 100,
                },
                AdControl::None,
            ],
            target_frame_ms: 33,
        }
    }

    /// Custom inline POSIX LCG (`0x41C64E6D * seed + 0x3039`) — `WRAP.AD` does not use CRT `rand()`.
    fn wrap_rand(&mut self, n: i32) -> i32 {
        self.wrap_seed = self
            .wrap_seed
            .wrapping_mul(1_103_515_245)
            .wrapping_add(12_345);
        let r = (self.wrap_seed >> 16) & 0x7FFF;
        ((r * (n as u32)) >> 15) as i32
    }

    fn init_curve(&mut self, w: i32, h: i32, mode: i32, speed: i32) {
        let mut x1 = 0;
        let mut y1 = 0;
        let mut x2 = 0;
        let mut y2 = 0;
        while y1 == x1 || y2 == x2 || x2 == x1 || y2 == y1 {
            x1 = self.wrap_rand(13) as usize;
            y1 = self.wrap_rand(13) as usize;
            x2 = self.wrap_rand(13) as usize;
            y2 = self.wrap_rand(13) as usize;
        }
        self.fn_x1 = x1;
        self.fn_y1 = y1;
        self.fn_x2 = x2;
        self.fn_y2 = y2;

        self.center_x = w / 2;
        self.center_y = h / 2;
        self.half_w = ((w as f64) * 0.45 + 0.5) as i32;
        self.half_h = ((h as f64) * 0.45 + 0.5) as i32;

        self.color_mode = mode;
        self.color_speed = speed;
        let hue_n = self.wrap_rand(101);
        self.start_hue = fix_div(hue_n, 100);
    }

    fn compute_color(&self, hue: i32) -> u32 {
        match self.color_mode {
            2 => {
                let idx = ((fix_mul(hue, 0x0015_0000) >> 16) + 1).clamp(1, 21) as usize;
                PALETTE22[idx]
            }
            3 => {
                let prod = fix_mul(hue, 0x0006_0000);
                let seg = ((prod >> 16) as usize).min(5);
                let frac = (prod & 0xFFFF) as i32;
                let (r0, g0, b0) = COLOR_STOPS[seg];
                let (r1, g1, b1) = COLOR_STOPS[seg + 1];
                let r16 = (fix_mul(r1 as i32 - r0 as i32, frac) + r0 as i32).clamp(0, 65535) as u16;
                let g16 = (fix_mul(g1 as i32 - g0 as i32, frac) + g0 as i32).clamp(0, 65535) as u16;
                let b16 = (fix_mul(b1 as i32 - b0 as i32, frac) + b0 as i32).clamp(0, 65535) as u16;
                rgb((r16 >> 8) as u8, (g16 >> 8) as u8, (b16 >> 8) as u8)
            }
            _ => rgb(255, 255, 255),
        }
    }

    fn draw_line(&mut self, ctx: &mut AdContext<'_>, idx: i32) {
        let t = fix_div(idx, self.num_lines.max(1));
        let hue = if self.color_mode > 1 {
            let h = self.start_hue + (fix_mul(self.color_speed << 16, t) / 30);
            h & 0xFFFF
        } else {
            0
        };
        self.draw_color = self.compute_color(hue);

        let x1 = frac_mul(self.half_w, eval_curve(self.fn_x1, t)) + self.center_x;
        let y1 = frac_mul(self.half_h, eval_curve(self.fn_y1, t)) + self.center_y;
        let x2 = frac_mul(self.half_w, eval_curve(self.fn_x2, t)) + self.center_x;
        let y2 = frac_mul(self.half_h, eval_curve(self.fn_y2, t)) + self.center_y;
        ctx.surface.line(x1, y1, x2, y2, 1, self.draw_color);
    }
}

impl Default for WrapAroundModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for WrapAroundModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.num_lines = ctx.module.control_value[1].max(50);
        self.line_idx = -1;
        self.wait_start_tick = 0;
        self.first_curve = true;
        // Original seeds wrapSeed from GetTickCount() >> 4; combine with ctx.rng for deterministic testing & variety.
        let r1 = ctx.rng.rand() as u32;
        let r2 = ctx.rng.rand() as u32;
        self.wrap_seed = ((r1 << 16) ^ r2) | 1;
        self.draw_color = rgb(255, 255, 255);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.surface.fill_black();
        AdResult::PaletteRequest(AdPaletteKind::Hsv)
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        if ctx.module.control_value[1] != self.num_lines {
            return AdResult::RestartMe;
        }

        let now_tick = ctx.elapsed_ms >> 4;
        if self.line_idx < 0 {
            let delay_ticks = (60 * ctx.module.control_value[0].max(0)) as u64;
            if self.first_curve || now_tick >= self.wait_start_tick + delay_ticks {
                self.first_curve = false;
                ctx.surface.fill_black();
                self.line_idx = 0;
                // Win16 bug mapped iBitsPerPixel == 32 to unimplemented colorMode 4 (white).
                // Modern Win11 displays are 32bpp, so >= 8 uses authentic 256/truecolor mode 3.
                let mode = if ctx.system.bits_per_pixel >= 8 {
                    3
                } else if ctx.system.bits_per_pixel >= 4 {
                    2
                } else {
                    1
                };
                self.init_curve(
                    ctx.module.rgn_width,
                    ctx.module.rgn_height,
                    mode,
                    ctx.module.control_value[2],
                );
            }
        } else {
            let batch_end = self.line_idx + 10;
            while self.line_idx < batch_end {
                let idx = self.line_idx;
                self.draw_line(ctx, idx);
                self.line_idx += 1;
                if self.line_idx >= self.num_lines {
                    self.line_idx = -1;
                    self.wait_start_tick = now_tick;
                    break;
                }
            }
        }

        AdResult::NoError
    }
}
