//! 1:1 Decompilation of `ROSE.AD` ("Rose") from After Dark 1.0a (1991).
//!
//! Disassembly-backed from `docs/disasm/rose_seg1.asm`, `docs/disasm/rose_data.hex`,
//! and original 16.16 fixed-point `RT_RCDATA` lookup tables (`SZT`, `SINT`).

use ad_sdk::palette::rgb;
use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

const SZT_RAW: &[u8] = include_bytes!("../../../assets/rose/RT_RCDATA_#1.bin");
const SINT_RAW: &[u8] = include_bytes!("../../../assets/rose/RT_RCDATA_#2.bin");

const TWO_PI_FIX: i32 = 0x0006_487E; // 2*PI in 16.16 fixed-point (from 1:0961..1:0964)
const MAX_TRAIL: usize = 0x3C0; // 960 points max

#[inline]
fn double_to_fix(x: f64) -> i32 {
    // 1:3D21 (ord_5): (x * 65536.0 + 0.5) truncated to i32 (all callers pass x >= 0)
    (x * 65536.0 + 0.5) as i32
}

#[inline]
fn fix_to_double(v: i32) -> f64 {
    // 1:3CFC (ord_8): v * 1.52587890625e-05
    (v as f64) * 1.525_878_906_25e-5
}

#[inline]
fn fix_mul(a: i32, b: i32) -> i32 {
    // 1:3D6D (ord_12): signed 16.16 fixed-point multiply with half-LSB magnitude rounding
    let neg = (a ^ b) < 0;
    let ua = a.unsigned_abs() as u64;
    let ub = b.unsigned_abs() as u64;
    let mag = ((ua * ub).wrapping_add(0x8000) >> 16) as i32;
    if neg {
        mag.wrapping_neg()
    } else {
        mag
    }
}

pub struct RoseModule {
    cx: i32,
    cy: i32,
    max_r: i32,

    // Precomputed lookup tables (matching DS globals)
    szt: [i32; 64],           // DS:20AC (RT_RCDATA #1 "SZT")
    sint_sin: [i32; 128],     // DS:0EC6 (RT_RCDATA #2 + 0x0F4)
    sint_cos: [i32; 128],     // DS:0CC2 (RT_RCDATA #2 + 0x2F4)
    freq_table: [i32; 16],    // DS:21AC..21E8
    radius_table: [i32; 32],  // DS:0BFC
    sin_240_q1: [i32; 61],    // DS:0B02 (0..=60)
    palette_50: [u32; 50],    // DS:10C8

    // Fixed-point constants initialized in DoInitialize
    morph_step: i32,          // DS:21F0 = fix(0.004)
    rad_to_idx128: i32,       // DS:0C7C = fix(20.371832715762583) = fix(128 / 2PI)

    // Speed & trail settings
    dtheta: i32,              // DS:0CA8
    angle_step: i32,          // DS:10C6
    trail_len: usize,         // DS:0CAE

    // Morph state (start, end, current, t)
    freq_start: i32,          // DS:0C9C
    freq_end: i32,            // DS:0CA0
    freq_cur: i32,            // DS:0CA4
    amp_start: i32,           // DS:0C84
    amp_end: i32,             // DS:0C8A
    amp_cur: i32,             // DS:0C98
    rad_start: i32,           // DS:0CB0
    rad_end: i32,             // DS:0CB6
    rad_cur: i32,             // DS:0CBE
    morph_t: i32,             // DS:0C94

    // Ring buffer & frame phase
    ring: [(i32, i32); MAX_TRAIL], // DS:11AA
    ring_idx: usize,               // DS:11A8
    color_phase: i32,              // DS:1196
    base_angle: i32,               // DS:1194
}

impl RoseModule {
    pub fn new() -> Self {
        Self {
            cx: 0,
            cy: 0,
            max_r: 0,
            szt: [0; 64],
            sint_sin: [0; 128],
            sint_cos: [0; 128],
            freq_table: [0; 16],
            radius_table: [0; 32],
            sin_240_q1: [0; 61],
            palette_50: [0; 50],
            morph_step: 0,
            rad_to_idx128: 0,
            dtheta: 0,
            angle_step: 20,
            trail_len: 288,
            freq_start: 0,
            freq_end: 0,
            freq_cur: 0,
            amp_start: 0,
            amp_end: 0,
            amp_cur: 0,
            rad_start: 0,
            rad_end: 0,
            rad_cur: 0,
            morph_t: 0,
            ring: [(0, 0); MAX_TRAIL],
            ring_idx: 0,
            color_phase: 0,
            base_angle: 0,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "rose".to_string(),
            filename: "ROSE.AD".to_string(),
            name: "Rose".to_string(),
            credit: "Rose by Bruce Burkhalter & Tracy Elmore.\r\n  \u{00a9}1990 Berkeley Systems Inc."
                .to_string(),
            about: concat!(
                "ROSE (tm)\r\n\r\n",
                "Original design and concept by Ben Haller.\r\n\r\n",
                "Rose was first conceived, in a rudimentary way, on an IBM PC in BASIC many years ago, ",
                "soon after the IBM had first hit the market.  \r\n\r\n",
                "Some years later Ben remembered the algorithm and re-created the code (which had long since been lost).  ",
                "Then he forgot about it again until After Dark came out and, once again, remembered it.\r\n\r\n",
                "It's based on trigonometry, that most hated and most beautiful of mathematical subjects."
            )
            .to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "Speed:".to_string(),
                    default_raw: 100,
                    labels: vec![
                        "Lethargic".to_string(),
                        "Slow".to_string(),
                        "Moving".to_string(),
                        "Fast".to_string(),
                        "Swift".to_string(),
                        "Quick".to_string(),
                    ],
                    thresholds: vec![10, 20, 40, 60, 80, 90],
                },
                AdControl::LabeledSlider {
                    title: "Trail Length:".to_string(),
                    default_raw: 61,
                    labels: vec![
                        "Shortest".to_string(),
                        "Short".to_string(),
                        "Medium".to_string(),
                        "Long".to_string(),
                        "Longest".to_string(),
                    ],
                    thresholds: vec![16, 32, 48, 64, 80],
                },
                AdControl::Checkbox {
                    title: "Big Dots".to_string(),
                    default_checked: false,
                },
                AdControl::None,
            ],
            target_frame_ms: 33,
        }
    }

    #[inline]
    fn sin_240(&self, mut idx: i32) -> i32 {
        // 1:0012..1:00A3
        if idx > 240 {
            idx -= 240;
        }
        idx = idx.rem_euclid(240);
        if idx <= 60 {
            self.sin_240_q1[idx as usize]
        } else if idx <= 120 {
            self.sin_240_q1[(120 - idx) as usize]
        } else if idx <= 180 {
            self.sin_240_q1[(idx - 120) as usize].wrapping_neg()
        } else {
            self.sin_240_q1[(240 - idx) as usize].wrapping_neg()
        }
    }

    #[inline]
    fn cos_240(&self, idx: i32) -> i32 {
        // 1:00A4..1:00C7
        self.sin_240((idx + 60) % 240)
    }

    fn load_tables(&mut self, ctx: &mut AdContext<'_>) {
        // 1:0160: freq_table[0..15] = 3 repeats of {0, 1, 4, 9, 16}, [15] = random pick
        let base = [
            double_to_fix(0.0),
            double_to_fix(1.0),
            double_to_fix(4.0),
            double_to_fix(9.0),
            double_to_fix(16.0),
        ];
        for i in 0..5 {
            self.freq_table[i] = base[i];
            self.freq_table[i + 5] = base[i];
            self.freq_table[i + 10] = base[i];
        }
        let pick = (ctx.rng.rand() % 5) as usize;
        self.freq_table[15] = self.freq_table[pick];

        // 1:0273: load 64 i32 entries from RT_RCDATA #1 ("SZT")
        for i in 0..64 {
            let off = i * 4;
            self.szt[i] = i32::from_le_bytes(SZT_RAW[off..off + 4].try_into().unwrap());
        }

        // 1:02F1: radius_table[0..32] = fix(sqrt(i) * 0.17543859649122806 * max_r)
        let max_rf = self.max_r as f64;
        for i in 0..32 {
            let r = (i as f64).sqrt() * 0.175_438_596_491_228_06 * max_rf;
            self.radius_table[i] = double_to_fix(r);
        }

        // 1:00C8: load 128 sin & cos fixed-point entries from RT_RCDATA #2 ("SINT")
        for i in 0..128 {
            let sin_off = 0x0F4 + i * 4;
            let cos_off = 0x2F4 + i * 4;
            self.sint_sin[i] =
                i32::from_le_bytes(SINT_RAW[sin_off..sin_off + 4].try_into().unwrap());
            self.sint_cos[i] =
                i32::from_le_bytes(SINT_RAW[cos_off..cos_off + 4].try_into().unwrap());
        }
    }

    fn configure_controls(&mut self, ctx: &mut AdContext<'_>, speed_val: i32, trail_val: i32) {
        // 1:038F..1:07C7
        let speed_idx = if speed_val < 0x0E {
            6
        } else if speed_val < 0x1D {
            5
        } else if speed_val < 0x2B {
            4
        } else if speed_val < 0x39 {
            3
        } else if speed_val < 0x47 {
            2
        } else if speed_val < 0x56 {
            1
        } else {
            0
        };

        let trail_idx = if trail_val < 0x11 {
            5
        } else if trail_val < 0x21 {
            4
        } else if trail_val < 0x32 {
            3
        } else if trail_val < 0x43 {
            2
        } else if trail_val < 0x53 {
            1
        } else {
            0
        };

        let (dtheta_f, step) = match speed_idx {
            0 => (0.523_598_775_598_299_4_f64, 20),
            1 => (0.392_699_081_698_724_53_f64, 15),
            2 => (0.261_799_387_799_149_7_f64, 10),
            3 => (0.157_079_632_679_489_82_f64, 6),
            4 => (0.104_719_755_119_659_88_f64, 4),
            5 => (0.052_359_877_559_829_94_f64, 2),
            _ => (0.026_179_938_779_914_97_f64, 1),
        };
        self.dtheta = double_to_fix(dtheta_f);
        self.angle_step = step;

        self.trail_len = match trail_idx {
            0 => 0x3C0,
            1 => 0x2D0,
            2 => 0x1E0,
            3 => match step {
                1 => 0x1E0,
                2 => 0x168,
                4 | 6 => 0x0F0,
                _ => 0x120,
            },
            4 => match step {
                1 | 2 => 0x0F0,
                4 | 6 => 0x078,
                _ => 0x060,
            },
            _ => match step {
                1 => 0x0F0,
                2 => 0x078,
                4 => 0x03C,
                6 => 0x028,
                10 => 0x018,
                15 => 0x010,
                _ => 0x00C,
            },
        };

        // 1:05F9..1:0714: initial random rose + morph target
        self.amp_end = self.szt[(ctx.rng.rand() & 0x3F) as usize];
        self.freq_end = self.freq_table[(ctx.rng.rand() & 0x0F) as usize];
        self.rad_end = self.radius_table[(ctx.rng.rand() & 0x1F) as usize];

        self.freq_start = self.freq_end;
        self.amp_start = self.amp_end;
        self.rad_start = 0;

        self.amp_end = self.szt[(ctx.rng.rand() & 0x3F) as usize];
        self.freq_end = self.freq_table[(ctx.rng.rand() & 0x0F) as usize];
        self.rad_end = self.radius_table[(ctx.rng.rand() & 0x1F) as usize];

        self.freq_cur = self.freq_start;
        self.amp_cur = self.amp_start;
        self.rad_cur = self.rad_start;
        self.morph_t = double_to_fix(0.0);

        self.ring_idx = 0;
        for i in 0..self.trail_len {
            self.ring[i] = (0, 0);
        }

        // 1:0767..1:07B5: build quarter-wave sin table (0..=60)
        for i in 0..=60 {
            let s = ((i as f64) * 3.141_592_653_589_796_2 * 0.008_333_333_333_333_333).sin();
            self.sin_240_q1[i] = double_to_fix(s);
        }
        self.color_phase = 0;
        self.base_angle = 0;
    }
}

impl Default for RoseModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for RoseModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:0EB6 (ord_20)
        self.cx = ctx.module.rgn_width / 2;
        self.cy = ctx.module.rgn_height / 2;
        let min_half = self.cx.min(self.cy);
        self.max_r = (min_half * 4) / 9;

        self.load_tables(ctx);

        self.morph_step = double_to_fix(0.004);
        self.rad_to_idx128 = double_to_fix(20.371_832_715_762_583);

        // 1:0F82..1:0FFD: 50-entry color spectrum table
        for i in 0..50 {
            self.palette_50[i] = if i <= 7 {
                rgb(255, 0, 0)
            } else if i <= 15 {
                rgb(255, 0, 255)
            } else if i <= 23 {
                rgb(0, 0, 255)
            } else if i <= 31 {
                rgb(0, 255, 255)
            } else if i <= 40 {
                rgb(0, 255, 0)
            } else {
                rgb(255, 255, 0)
            };
        }

        let speed_val = ctx.module.control_value[0];
        let trail_val = ctx.module.control_value[1];
        self.configure_controls(ctx, speed_val, trail_val);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.surface.fill_black();
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:07C8..1:0C56
        let big_dots = ctx.module.control_value[2] != 0;
        let freq_cur = self.freq_cur;
        let amp_cur = self.amp_cur;
        let rad_cur = self.rad_cur;

        let mut si = self.ring_idx;
        let mut theta = self.dtheta;
        let mut angle_idx = self.base_angle + self.angle_step;
        let limit = self.base_angle + 240;

        while angle_idx <= limit {
            // Erase oldest dot at ring[si]
            let (ox, oy) = self.ring[si];
            if big_dots {
                ctx.surface.pat_blt_black(ox, oy, 2, 2);
            } else {
                ctx.surface.set_pixel(ox, oy, 0);
            }

            // Compute parametric rose point (1:086D..1:095A)
            let u = fix_mul(theta, freq_cur);
            let idx = ((fix_mul(u, self.rad_to_idx128) >> 16) & 0x7F) as usize;

            let cos_sum = fix_mul(self.sint_cos[idx], amp_cur).wrapping_add(self.cos_240(angle_idx));
            let x = self.cx + (fix_mul(cos_sum, rad_cur) >> 16);

            let sin_sum = fix_mul(self.sint_sin[idx], amp_cur).wrapping_add(self.sin_240(angle_idx));
            let y = self.cy + (fix_mul(sin_sum, rad_cur) >> 16);

            self.ring[si] = (x, y);

            // Compute color from palette_50 (1:095B..1:099D)
            let cidx = (((theta as i64 * 50) / (TWO_PI_FIX as i64) + self.color_phase as i64)
                .rem_euclid(50)) as usize;
            let color = self.palette_50[cidx];

            if big_dots {
                ctx.surface.pat_blt_rgb(x, y, 2, 2, color);
            } else {
                ctx.surface.set_pixel(x, y, color);
            }

            si += 1;
            if si == self.trail_len {
                si = 0;
            }
            theta = theta.wrapping_add(self.dtheta);
            angle_idx += self.angle_step;
        }

        // Advance morph interpolation (1:0A9B..1:0C22)
        self.morph_t = self.morph_t.wrapping_add(self.morph_step);
        if fix_to_double(self.morph_t) >= 0.999 {
            self.freq_start = self.freq_end;
            self.amp_start = self.amp_end;
            self.rad_start = self.rad_end;

            self.amp_end = self.szt[(ctx.rng.rand() & 0x3F) as usize];
            self.freq_end = self.freq_table[(ctx.rng.rand() & 0x0F) as usize];
            self.rad_end = self.radius_table[(ctx.rng.rand() & 0x1F) as usize];
            self.morph_t = double_to_fix(0.0);
        }

        self.freq_cur = self
            .freq_start
            .wrapping_add(fix_mul(self.freq_end.wrapping_sub(self.freq_start), self.morph_t));
        self.amp_cur = self
            .amp_start
            .wrapping_add(fix_mul(self.amp_end.wrapping_sub(self.amp_start), self.morph_t));
        self.rad_cur = self
            .rad_start
            .wrapping_add(fix_mul(self.rad_end.wrapping_sub(self.rad_start), self.morph_t));

        self.color_phase += 1;
        if self.color_phase >= 50 {
            self.color_phase -= 50;
        }
        self.base_angle += 1;
        if self.base_angle == 240 {
            self.base_angle = 0;
        }
        self.ring_idx = si;

        AdResult::NoError
    }

    fn do_button_message(&mut self, control_index: usize) -> AdResult {
        // 1:10E8 (ord_13): restart in Demo mode when any of controls 0..=2 changes
        if control_index <= 2 {
            AdResult::RestartMe
        } else {
            AdResult::NoError
        }
    }
}
