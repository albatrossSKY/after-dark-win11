//! MOUNTAIN.AD ("Mountains") — 1:1 decompiled from After Dark 1.0a (1991).
//!
//! Original by Tracy Elmore (original design and concept by Ben Haller and Mouse Herrell).
//!
//! Exact 16-bit NE disassembly fidelity (`docs/disasm/mountain_seg1.asm`, `mountain_data.hex`):
//! - Fractal triangle-midpoint displacement heightmap (`grid_size = 1 << complexity`, `complexity = 3..=6`)
//!   with exact 3 corner-seeding topologies (`Slope`, `Peninsula`, `Central Ridge`) and power-law
//!   height normalization (`|h|^power * max_height / max_val^power`).
//! - Exact 9 solar-system planet presets (`Mercury`..`Pluto`) with exact `(power, roughness, max_height)`
//!   ranges, exact HSV altitude/lighting shader curves (`1:20A9..2730`), and exact 3-color shimmering
//!   ocean tables from `DS:0x00E4..0x0185`.
//! - Exact 5 View styles (`Boundaries`, `Webs`, `Mountains`, `Constructions`, `Highlands`) plus `Random`,
//!   with exact `z = 0` shoreline triangle clipping (`1:2D92..3164`) and 3D directional lighting
//!   (`L = (-1/√3, +1/√3, +1/√3)`).
//! - Exact 1.34 aspect-ratio viewport centering and oblique 3D projection (`ord_27`, `1:2014..20A8`).

use ad_sdk::palette::rgb;
use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

const SENTINEL: i32 = i32::MIN;

/// Exact 3 shimmering ocean colors per planet from `DS:0x00E4..0x0185` (16-bit RGB high bytes).
const PLANET_WATER: [[[u8; 3]; 3]; 9] = [
    // 0: Mercury (molten gold/yellow)
    [[239, 239, 63], [255, 255, 31], [255, 255, 63]],
    // 1: Venus (silvery cloud deck)
    [[143, 143, 143], [175, 175, 175], [159, 159, 159]],
    // 2: Earth (deep sapphire ocean)
    [[15, 15, 127], [47, 47, 159], [31, 31, 143]],
    // 3: Mars (dry — has_water = false)
    [[0, 0, 0], [0, 0, 0], [0, 0, 0]],
    // 4: Jupiter (crimson storm sea)
    [[187, 0, 0], [221, 0, 0], [204, 0, 0]],
    // 5: Saturn (coral/rose sea)
    [[255, 119, 119], [255, 153, 153], [255, 136, 136]],
    // 6: Uranus (violet sea)
    [[102, 51, 136], [68, 41, 102], [85, 46, 119]],
    // 7: Neptune (ice-blue sea)
    [[127, 175, 255], [159, 207, 255], [143, 191, 255]],
    // 8: Pluto (emerald methane sea)
    [[63, 223, 127], [63, 255, 127], [63, 239, 127]],
];

#[derive(Clone, Copy, PartialEq, Eq)]
enum Phase {
    Generate,
    DrawWater,
    DrawLand,
    Hold,
}

#[derive(Clone, Copy)]
struct Vec3 {
    x: f64,
    y: f64,
    z: f64,
}

pub struct MountainsModule {
    // Viewport (aspect-clamped to max 1.34:1, matching `1:0292..032E`)
    vp_left: i32,
    vp_top: i32,
    vp_width: i32,
    vp_height: i32,

    // Active controls
    view_ctrl: i32,
    planet_ctrl: i32,
    complexity: i32, // 3..=6
    zoom: i32,       // 0..=100

    // Per-landscape parameters
    grid_size: i32, // N = 1 << complexity
    grid_dim: i32,  // N + 1
    grid: Vec<i32>,
    render_style: i32, // 1=Webs, 2=Constructions, 4=Boundaries, 5=Mountains/Highlands
    has_water: bool,
    active_planet: usize, // 0..=8
    power: f64,
    roughness: f64,
    max_height: i32,
    amps: [i32; 11],

    // 3D camera transform (`1:07C4..0963`)
    rot_cos: f64,
    rot_sin: f64,
    x_scale: f64,
    y_scale: f64,
    z_scale: f64,
    x_origin: i32,
    y_origin: i32,

    // Progressive rendering cursor
    phase: Phase,
    cur_x: i32,
    cur_y: i32,
    hold_end_ms: u64,
}

impl Default for MountainsModule {
    fn default() -> Self {
        Self::new()
    }
}

impl MountainsModule {
    pub fn new() -> Self {
        Self {
            vp_left: 0,
            vp_top: 0,
            vp_width: 320,
            vp_height: 240,
            view_ctrl: 5,
            planet_ctrl: 9,
            complexity: 5,
            zoom: 70,
            grid_size: 32,
            grid_dim: 33,
            grid: Vec::new(),
            render_style: 5,
            has_water: true,
            active_planet: 2,
            power: 1.5,
            roughness: 1.7,
            max_height: 50_000,
            amps: [0; 11],
            rot_cos: 0.2,
            rot_sin: -0.98,
            x_scale: 1.0,
            y_scale: 1.0,
            z_scale: 1e-4,
            x_origin: 0,
            y_origin: 0,
            phase: Phase::Generate,
            cur_x: 0,
            cur_y: 0,
            hold_end_ms: 0,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "mountain".to_string(),
            filename: "MOUNTAIN.AD".to_string(),
            name: "Mountains".to_string(),
            credit: "Mountains by Tracy Elmore.\n  ©1990 Berkeley Systems Inc.".to_string(),
            about: "MOUNTAINS(tm) uses fractal mathematics to provide many and varied landscapes for your viewing pleasure.\n\n\"View\" changes the look of the mountains so that in some cases they don't even look like mountains at all.\n\n\"Planet\" provides different planet landscapes.\n\n\"Complexity\" allows you to choose how many iterations the mountains will take to draw.  The higher the complexity the longer it takes to draw.\n\nBring the landscape closer with the \"Zoom\" slider.\n\nOriginal design and concept by Ben Haller and Mouse Herrell.".to_string(),
            controls: [
                AdControl::Menu {
                    title: "View:".to_string(),
                    default_index: 5,
                    choices: vec![
                        "Boundaries".to_string(),
                        "Webs".to_string(),
                        "Mountains".to_string(),
                        "Constructions".to_string(),
                        "Highlands".to_string(),
                        "Random".to_string(),
                    ],
                },
                AdControl::Menu {
                    title: "Planet:".to_string(),
                    default_index: 9,
                    choices: vec![
                        "Mercury".to_string(),
                        "Venus".to_string(),
                        "Earth".to_string(),
                        "Mars".to_string(),
                        "Jupiter".to_string(),
                        "Saturn".to_string(),
                        "Uranus".to_string(),
                        "Neptune".to_string(),
                        "Pluto".to_string(),
                        "Random".to_string(),
                    ],
                },
                AdControl::NumericSlider {
                    title: "Complexity:".to_string(),
                    default_raw: 69,
                    unit: String::new(),
                    min: 3,
                    max: 6,
                },
                AdControl::NumericSlider {
                    title: "Zoom:".to_string(),
                    default_raw: 70,
                    unit: String::new(),
                    min: 0,
                    max: 100,
                },
            ],
            target_frame_ms: 25,
        }
    }

    /// Exact 32-bit random inclusive helper (`1:1275..12C6`).
    fn rand_i32_range(ctx: &mut AdContext<'_>, lo: i32, hi: i32) -> i32 {
        if hi <= lo {
            return lo;
        }
        let r1 = ctx.rng.rand() as u32;
        let r2 = ctx.rng.rand() as u32;
        let combined = ((r2 << 15) ^ r1) & 0x7FFF_FFFF;
        let span = (hi as i64 - lo as i64 + 1) as u64;
        (lo as i64 + (combined as u64 % span) as i64) as i32
    }

    /// Exact float random in `[lo, hi]` (`1:12C7..130D`).
    fn rand_f64_range(ctx: &mut AdContext<'_>, lo: f64, hi: f64) -> f64 {
        let u = (ctx.rng.rand() as f64) / 32767.0;
        lo + u * (hi - lo)
    }

    /// Exact 16-bit HSV -> 8-bit RGB (`1:0012..01D4`).
    fn hsv16_to_rgb(h: u16, s: u16, v: u16) -> u32 {
        let vf = v as u32;
        let sf = s as u32;
        let p = ((vf * (65536 - sf)) >> 16) as u32;
        let diff = vf.saturating_sub(p);
        let (r16, g16, b16) = if h <= 0x2AAA {
            let g = p + ((h as u32 * diff) / 0x2AAA);
            (vf, g, p)
        } else if h <= 0x5555 {
            let r = vf.saturating_sub((((h - 0x2AAA) as u32) * diff) / 0x2AAB);
            (r, vf, p)
        } else if h <= 0x7FFF {
            let b = p + ((((h - 0x5555) as u32) * diff) / 0x2AAA);
            (p, vf, b)
        } else if h <= 0xAAAA {
            let g = vf.saturating_sub((((h - 0x7FFF) as u32) * diff) / 0x2AAB);
            (p, g, vf)
        } else if h <= 0xD554 {
            let r = p + ((((h - 0xAAAA) as u32) * diff) / 0x2AAA);
            (r, p, vf)
        } else {
            let b = vf.saturating_sub((((h - 0xD554) as u32) * diff) / 0x2AAB);
            (vf, p, b)
        };
        rgb(
            (r16 >> 8).min(255) as u8,
            (g16 >> 8).min(255) as u8,
            (b16 >> 8).min(255) as u8,
        )
    }

    /// Computes exact planet HSV color for altitude `avg_z` and lighting factor `light` (`1:20A9..2730`).
    fn planet_land_color(&self, avg_z: i32, light: f64) -> u32 {
        let mh = self.max_height.max(1) as f64;
        let light = light.clamp(0.0, 1.0);
        let (h, s, v): (u16, u16, u16) = match self.active_planet {
            0 => {
                // Mercury (`1:20B8..2126`)
                let v0: u16 = if avg_z > 0 {
                    let term = ((avg_z as i64 * (-12288i64)) / mh as i64) as i32;
                    term.wrapping_sub(0x5001) as u16
                } else {
                    0xAFFF
                };
                let v_lit = ((v0 as f64) * light * light).clamp(0.0, 65535.0) as u16;
                (0, 0xFFFF, v_lit)
            }
            1 => {
                // Venus (`1:2127..22C8`)
                let thresh = self.max_height / 50;
                let (h0, s0, v0): (u16, u16, u16) = if avg_z > thresh {
                    let h = (((avg_z as i64 * 0x5555) / mh as i64) as i32).wrapping_sub(0x5556) as u16;
                    let s = (((avg_z as i64 * (-13107i64)) / mh as i64) as i32).wrapping_sub(0x6667) as u16;
                    let v = (((avg_z as i64 * 0x1111) / mh as i64) as i32).wrapping_sub(0x1112) as u16;
                    (h, s, v)
                } else if avg_z > 0 {
                    let u = ((50.0 * avg_z as f64) / mh).max(0.0).sqrt().sqrt();
                    let h = ((1.0 - u) * 43690.0 + u * 44126.0).clamp(0.0, 65535.0) as u16;
                    let s = (u * 39059.0).clamp(0.0, 65535.0) as u16;
                    let v = ((1.0 - u) * 40959.0 + u * 61253.0).clamp(0.0, 65535.0) as u16;
                    (h, s, v)
                } else {
                    (0xAAAA, 0, 0x9FFF)
                };
                let v_lit = ((v0 as f64) * light * light).clamp(0.0, 65535.0) as u16;
                (h0, s0, v_lit)
            }
            2 => {
                // Earth (`1:22C9..2410`): green lowlands -> amber slopes -> white snowcaps
                let base = ((self.max_height / 10) + 2500) * 4;
                let k: u32 = if avg_z > base + 9000 {
                    150
                } else if avg_z < base {
                    0
                } else {
                    ((avg_z - base) / 60).clamp(0, 150) as u32
                };
                let inv = 150 - k;
                let h0 = (0x2000 + (inv * 0x3555) / 150) as u16;
                let s0 = ((inv * 0xFFFF) / 150) as u16;
                let v0 = (0xEFFF - (inv * 0x4555) / 150) as u16;
                let v_lit = ((v0 as f64) * light).clamp(0.0, 65535.0) as u16;
                (h0, s0, v_lit)
            }
            3 => {
                // Mars (`1:2411..24DC`)
                let (h0, s0, v0): (u16, u16, u16) = if avg_z > 0 {
                    let h = ((avg_z as i64 * 0x2AAA) / mh as i64) as u16;
                    let s = (((avg_z as i64 * (-4369i64)) / mh as i64) as i32).wrapping_sub(0x2223) as u16;
                    let v = (((avg_z as i64 * 0x5555) / mh as i64) as i32).wrapping_sub(0x5556) as u16;
                    (h, s, v)
                } else {
                    (0, 0xDDDD, 0xAAAA)
                };
                let v_lit = ((v0 as f64) * light * light * light).clamp(0.0, 65535.0) as u16;
                (h0, s0, v_lit)
            }
            4 => {
                // Jupiter (`1:24DD..255F`)
                let (s0, v0): (u16, u16) = if avg_z > 0 {
                    let t = avg_z as f64 / mh;
                    let t2 = t * t;
                    let s = ((t2 * 21845.0) as i32).wrapping_sub(0x5556) as u16;
                    let v = ((t2 * 13107.0) as i32).wrapping_add(0x7777) as u16;
                    (s, v)
                } else {
                    (0xAAAA, 0x7777)
                };
                let v_lit = ((v0 as f64) * light).clamp(0.0, 65535.0) as u16;
                (0x1555, s0, v_lit)
            }
            5 => {
                // Saturn (`1:2560..25C2`)
                let h0: u16 = if avg_z > 0 {
                    (((avg_z as i64 * 0xDDDD) / mh as i64) as i32).wrapping_sub(0x6667) as u16
                } else {
                    0x9999
                };
                let v_lit = (light * light * light * 65535.0).clamp(0.0, 65535.0) as u16;
                (h0, 0x7FFF, v_lit)
            }
            6 => {
                // Uranus (`1:25C3..2628`)
                let (h0, s0): (u16, u16) = if avg_z > 0 {
                    let t = avg_z as f64 / mh;
                    let t2 = t * t;
                    let h = ((t2 * 8738.0) as i32).wrapping_sub(0x2223) as u16;
                    let s = ((t2 * 39321.0) as i32).wrapping_add(0x6666) as u16;
                    (h, s)
                } else {
                    (0xDDDD, 0x6666)
                };
                let v_lit = (light * light * light * 65535.0).clamp(0.0, 65535.0) as u16;
                (h0, s0, v_lit)
            }
            7 => {
                // Neptune (`1:2629..26AB`)
                let (h0, s0): (u16, u16) = if avg_z > 0 {
                    let h = (((avg_z as i64 * (-17476i64)) / mh as i64) as i32).wrapping_sub(0x6667) as u16;
                    let s = (((avg_z as i64 * (-13107i64)) / mh as i64) as i32).wrapping_sub(0x6667) as u16;
                    (h, s)
                } else {
                    (0x9999, 0x9999)
                };
                let v_lit = (light * 65535.0).clamp(0.0, 65535.0) as u16;
                (h0, s0, v_lit)
            }
            _ => {
                // Pluto (`1:26AC..2726`)
                let v0: u16 = if avg_z > 0 {
                    let t = avg_z as f64 / mh;
                    let t2 = t * t;
                    ((t2 * 52428.0) as i32).wrapping_add(0x3333) as u16
                } else {
                    0x3333
                };
                let v_lit = ((v0 as f64) * light * light * light).clamp(0.0, 65535.0) as u16;
                (0, 0, v_lit)
            }
        };
        Self::hsv16_to_rgb(h, s, v)
    }

    fn setup_camera(&mut self) {
        let theta = -(self.zoom as f64) * 0.005 - 1.0;
        self.rot_cos = theta.cos();
        self.rot_sin = theta.sin();

        let zw = (self.zoom + 50) * self.vp_width;
        let step_ratio = (zw / self.grid_size.max(1)) as f64;
        self.x_scale = step_ratio * (1.0 / 75.0);
        self.y_scale = self.x_scale;
        self.z_scale = (zw as f64) * 5e-8;
        self.x_origin = ((100 - self.zoom) * self.vp_width) / 300;
        self.y_origin = ((self.vp_height as f64
            - self.y_scale * (self.grid_size as f64) * self.rot_cos)
            * ((self.zoom + 100) as f64)
            * 0.005) as i32;
    }

    /// Exact 3D oblique projection (`ord_27`, `1:2014..20A8`).
    #[inline]
    fn project(&self, p: Vec3) -> Vec3 {
        let sx = (p.x - 0.5 * p.y) * self.x_scale + self.x_origin as f64;
        let y_s = p.y * self.y_scale;
        let z_s = p.z * self.z_scale;
        let sy = y_s * self.rot_cos + z_s * self.rot_sin + self.y_origin as f64;
        let sz = z_s * self.rot_cos - y_s * self.rot_sin;
        Vec3 { x: sx, y: sy, z: sz }
    }

    /// Recursive triangle-midpoint displacement (`1:1CDF..2013`).
    fn subdivide(&mut self, ctx: &mut AdContext<'_>, a: usize, b: usize, c: usize, depth: usize) {
        let d = depth.saturating_sub(1);
        let mab = (a + b) / 2;
        let mbc = (b + c) / 2;
        let mca = (c + a) / 2;

        let amp = if self.roughness <= 0.0 { 0 } else { self.amps[d] };

        let edges = [(mab, a, b), (mbc, b, c), (mca, c, a)];
        for (m, u, v) in edges {
            if self.grid[m] == SENTINEL {
                let avg = (self.grid[u] + self.grid[v]) / 2;
                let jitter = if amp > 0 {
                    Self::rand_i32_range(ctx, -amp, amp)
                } else {
                    0
                };
                self.grid[m] = avg + jitter;
            }
        }

        // Exact base-case check (`1:1F34`: `mab - mbc == -1`, i.e., adjacent grid cell)
        if mab + 1 == mbc || d == 0 {
            return;
        }
        self.subdivide(ctx, a, mab, mca, d);
        self.subdivide(ctx, mab, b, mbc, d);
        self.subdivide(ctx, mca, mbc, mab, d);
        self.subdivide(ctx, mca, mbc, c, d);
    }

    fn generate_landscape(&mut self, ctx: &mut AdContext<'_>) {
        self.view_ctrl = ctx.module.control_value[0].clamp(0, 5);
        self.planet_ctrl = ctx.module.control_value[1].clamp(0, 9);
        self.complexity = ctx.module.control_value[2].clamp(3, 6);
        self.zoom = ctx.module.control_value[3].clamp(0, 100);

        self.grid_size = 1 << self.complexity;
        self.grid_dim = self.grid_size + 1;

        // Clear heightmap to sentinel (`1:120F..1274`)
        let total = (self.grid_dim * self.grid_dim) as usize;
        self.grid.clear();
        self.grid.resize(total, SENTINEL);

        // View selection (`1:131D..13A2`)
        self.has_water = true;
        let active_view = if self.view_ctrl == 5 {
            Self::rand_i32_range(ctx, 0, 4)
        } else {
            self.view_ctrl
        };
        self.render_style = match active_view {
            0 => 4, // Boundaries
            1 => 1, // Webs
            2 => 5, // Mountains
            3 => 2, // Constructions
            4 => {
                self.has_water = false;
                5 // Highlands
            }
            _ => 5,
        };

        // Planet selection (`1:1362..176E`)
        self.active_planet = if self.planet_ctrl > 8 {
            Self::rand_i32_range(ctx, 0, 8) as usize
        } else {
            self.planet_ctrl as usize
        };

        match self.active_planet {
            0 => {
                // Mercury
                self.power = Self::rand_f64_range(ctx, 1.0, 1.75);
                self.roughness = Self::rand_f64_range(ctx, 1.5, 1.7);
                self.max_height = Self::rand_i32_range(ctx, 50_000, 80_000);
            }
            1 => {
                // Venus
                self.power = 5.0;
                self.roughness = Self::rand_f64_range(ctx, 1.25, 1.7);
                self.max_height = Self::rand_i32_range(ctx, 40_000, 60_000);
            }
            2 => {
                // Earth
                self.power = Self::rand_f64_range(ctx, 0.75, 3.0);
                self.roughness = Self::rand_f64_range(ctx, 1.75, 2.25);
                self.max_height = Self::rand_i32_range(ctx, 10_000, 50_000);
            }
            3 => {
                // Mars (dry!)
                self.power = Self::rand_f64_range(ctx, 3.0, 5.0);
                self.roughness = Self::rand_f64_range(ctx, 1.75, 2.25);
                self.max_height = Self::rand_i32_range(ctx, 80_000, 100_000);
                self.has_water = false;
            }
            4 => {
                // Jupiter
                self.power = 0.25;
                self.roughness = 1.0;
                self.max_height = 10_000;
            }
            5 => {
                // Saturn
                self.power = Self::rand_f64_range(ctx, 0.75, 1.75);
                self.roughness = Self::rand_f64_range(ctx, 1.0, 1.25);
                self.max_height = Self::rand_i32_range(ctx, 10_000, 30_000);
            }
            6 => {
                // Uranus
                self.power = Self::rand_f64_range(ctx, 0.25, 0.5);
                self.roughness = Self::rand_f64_range(ctx, 1.25, 2.0);
                self.max_height = Self::rand_i32_range(ctx, 10_000, 40_000);
            }
            7 => {
                // Neptune
                self.power = Self::rand_f64_range(ctx, 1.75, 5.0);
                self.roughness = Self::rand_f64_range(ctx, 1.25, 1.4);
                self.max_height = Self::rand_i32_range(ctx, 10_000, 30_000);
            }
            _ => {
                // Pluto
                self.power = Self::rand_f64_range(ctx, 0.25, 0.5);
                self.roughness = Self::rand_f64_range(ctx, 1.5, 2.0);
                self.max_height = Self::rand_i32_range(ctx, 30_000, 100_000);
            }
        }

        // Exact level noise amplitudes (`1:178D..180D`): `amp[i] = floor(8.0 * roughness^(i-1))`
        for i in 0..=10usize {
            self.amps[i] = if self.roughness > 0.0 {
                (self.roughness.powi(i as i32 - 1) * 8.0) as i32
            } else {
                100_000
            };
        }

        // Exact 3 initial corner topologies (`1:180E..1A47`)
        let n = self.grid_size as usize;
        let dim = self.grid_dim as usize;
        let h0 = self.amps[10] / 2;
        let seed_type = Self::rand_i32_range(ctx, 1, 3);
        match seed_type {
            1 => {
                self.grid[0] = h0;
                self.grid[n] = 0;
                self.grid[n * dim] = 0;
                self.grid[n * dim + n] = -h0;
            }
            2 => {
                self.grid[0] = h0;
                self.grid[n] = 0;
                self.grid[n * dim] = 0;
                self.grid[n * dim + n] = 0;
                self.grid[(n / 2) * dim + (n / 2)] = 0;
                self.grid[n * dim + (n / 2)] = 0;
                self.grid[(n / 2) * dim + n] = 0;
            }
            _ => {
                self.grid[0] = 0;
                self.grid[n] = 0;
                self.grid[n * dim] = 0;
                self.grid[n * dim + n] = 0;
                self.grid[(n / 2) * dim + (n / 2)] = h0 / 2;
                self.grid[n / 2] = h0;
                self.grid[(n / 2) * dim] = h0;
            }
        }

        // Subdivide the 2 root triangles covering the square grid (`1:06C1..0774`)
        self.subdivide(ctx, 0, n, n * dim + n, 10);
        self.subdivide(ctx, n * dim, n * dim + n, 0, 10);

        // Normalize heightmap (`1:1A51..1CDE`)
        let max_val = self.grid.iter().copied().max().unwrap_or(1);
        if max_val > 0 {
            let scale = (self.max_height as f64) / (max_val as f64).powf(self.power);
            for h in &mut self.grid {
                if *h > 0 {
                    let v = ((*h as f64).powf(self.power) * scale).round();
                    *h = v.clamp(0.0, 100_000.0) as i32;
                } else if *h < 0 {
                    let v = (((-*h) as f64).powf(self.power) * scale).round();
                    *h = -(v.clamp(0.0, 100_000.0) as i32);
                }
            }
        }

        self.setup_camera();
        ctx.surface.fill_black();
        self.cur_x = 0;
        self.cur_y = 0;
        self.phase = if self.has_water {
            Phase::DrawWater
        } else {
            Phase::DrawLand
        };
    }

    /// Shades & rasterizes a single projected 3D triangle (`1:2731..2D91`).
    fn draw_raw_triangle(&self, ctx: &mut AdContext<'_>, tri: [Vec3; 3], draw_water: bool, draw_land: bool) {
        let is_water = self.has_water && tri[0].z == 0.0 && tri[1].z == 0.0 && tri[2].z == 0.0;
        if is_water {
            if !draw_water {
                return;
            }
        } else if !draw_land {
            return;
        }

        let avg_z = ((tri[0].z + tri[1].z + tri[2].z) / 3.0) as i32;

        // Project all 3 vertices into camera 3D space (`1:27F1..2814`)
        let p0 = self.project(tri[0]);
        let p1 = self.project(tri[1]);
        let p2 = self.project(tri[2]);

        let pts = [
            (p0.x as i32 + self.vp_left, p0.y as i32 + self.vp_top),
            (p1.x as i32 + self.vp_left, p1.y as i32 + self.vp_top),
            (p2.x as i32 + self.vp_left, p2.y as i32 + self.vp_top),
        ];

        // Constructions hidden-line pass fills triangle black first (`1:292E..2955`)
        if self.render_style == 2 {
            ctx.surface.polygon(&pts, Some(rgb(0, 0, 0)), Some(rgb(0, 0, 0)));
        }

        // Compute color (water shimmer vs lit terrain)
        let color = if is_water {
            let idx = ((((p0.x * 2.0) as i32).rem_euclid(4) + (p0.y as i32).rem_euclid(5))
                .rem_euclid(3)) as usize;
            let [r, g, b] = PLANET_WATER[self.active_planet][idx];
            rgb(r, g, b)
        } else {
            // Exact face normal & directional lighting (`1:295A..2C6A`)
            let ux = p1.x - p0.x;
            let uy = p1.y - p0.y;
            let uz = p1.z - p0.z;
            let vx = p2.x - p0.x;
            let vy = p2.y - p0.y;
            let vz = p2.z - p0.z;
            let nx = uy * vz - uz * vy;
            let ny = uz * vx - vz * ux;
            let nz = uy * vx - vy * ux; // note exact disassembly order at `1:2A10..2A27`!

            let inv_sqrt3 = 1.0 / 3.0f64.sqrt();
            let dot = (-inv_sqrt3) * nx + inv_sqrt3 * ny + inv_sqrt3 * nz;
            let len = (nx * nx + ny * ny + nz * nz).sqrt();
            let cos_theta = if len > 0.0 { dot / len } else { 0.0 };
            let light = ((cos_theta + 1.0) * 0.5).clamp(0.0, 1.0);
            self.planet_land_color(avg_z, light)
        };

        // Rasterize according to View style (`1:2CBE..2D53`)
        if is_water || self.render_style == 5 {
            ctx.surface.polygon(&pts, Some(color), Some(color));
        } else if self.render_style == 4 {
            // Boundaries: shaded fill + black wireframe edge
            ctx.surface.polygon(&pts, Some(color), Some(color));
            ctx.surface.polyline(&pts, 1, rgb(0, 0, 0));
        } else {
            // Webs (1) or Constructions (2): shaded wireframe
            ctx.surface.polyline(&pts, 1, color);
        }
    }

    /// Exact `z = 0` shoreline clipper + triangle emitter (`1:2D92..3164`).
    fn emit_grid_triangle(
        &self,
        ctx: &mut AdContext<'_>,
        x0: i32,
        y0: i32,
        x1: i32,
        y1: i32,
        x2: i32,
        y2: i32,
        draw_water: bool,
        draw_land: bool,
    ) {
        let dim = self.grid_dim;
        let z0 = self.grid[(y0 * dim + x0) as usize];
        let z1 = self.grid[(y1 * dim + x1) as usize];
        let z2 = self.grid[(y2 * dim + x2) as usize];

        let v0 = Vec3 { x: x0 as f64, y: y0 as f64, z: z0 as f64 };
        let v1 = Vec3 { x: x1 as f64, y: y1 as f64, z: z1 as f64 };
        let v2 = Vec3 { x: x2 as f64, y: y2 as f64, z: z2 as f64 };

        if !self.has_water {
            self.draw_raw_triangle(ctx, [v0, v1, v2], draw_water, draw_land);
            return;
        }

        if z0 <= 0 && z1 <= 0 && z2 <= 0 {
            self.draw_raw_triangle(
                ctx,
                [
                    Vec3 { z: 0.0, ..v0 },
                    Vec3 { z: 0.0, ..v1 },
                    Vec3 { z: 0.0, ..v2 },
                ],
                draw_water,
                draw_land,
            );
            return;
        }

        if z0 >= 0 && z1 >= 0 && z2 >= 0 {
            self.draw_raw_triangle(ctx, [v0, v1, v2], draw_water, draw_land);
            return;
        }

        // Vertices straddle z = 0: isolate the single vertex on the minority side (`1:2F0A..30FD`)
        let neg = [z0 < 0, z1 < 0, z2 < 0];
        let (mut lone, mut other0, mut other1) = if neg[0] != neg[1] && neg[0] != neg[2] {
            (v0, v1, v2)
        } else if neg[1] != neg[0] {
            (v1, v2, v0)
        } else {
            (v2, v0, v1)
        };

        // Shoreline intersection points along (lone -> other0) and (lone -> other1)
        let t0 = -lone.z / (other0.z - lone.z);
        let cut0 = Vec3 {
            x: lone.x + t0 * (other0.x - lone.x),
            y: lone.y + t0 * (other0.y - lone.y),
            z: 0.0,
        };
        let t1 = -lone.z / (other1.z - lone.z);
        let cut1 = Vec3 {
            x: lone.x + t1 * (other1.x - lone.x),
            y: lone.y + t1 * (other1.y - lone.y),
            z: 0.0,
        };

        // Flatten underwater vertices to sea level (`z = 0`)
        if lone.z < 0.0 {
            lone.z = 0.0;
        } else {
            other0.z = 0.0;
            other1.z = 0.0;
        }

        // Emit 3 clipped sub-triangles (`1:3043..3157`)
        self.draw_raw_triangle(ctx, [lone, cut0, cut1], draw_water, draw_land);
        self.draw_raw_triangle(ctx, [cut0, other0, other1], draw_water, draw_land);
        self.draw_raw_triangle(ctx, [cut0, other1, cut1], draw_water, draw_land);
    }
}

impl AdModule for MountainsModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        let w = ctx.module.rgn_width.max(1);
        let h = ctx.module.rgn_height.max(1);

        // Exact 1.34 aspect-ratio viewport clamp (`1:0292..032E`)
        if (w as f64) / (h as f64) > 1.34 {
            let trim = ((w as f64 - h as f64 * 1.34) as i32) / 2;
            self.vp_left = trim;
            self.vp_top = 0;
            self.vp_width = (w - 2 * trim).max(1);
            self.vp_height = h;
        } else {
            self.vp_left = 0;
            self.vp_top = 0;
            self.vp_width = w;
            self.vp_height = h;
        }

        ctx.surface.fill_black();
        self.phase = Phase::Generate;
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.surface.fill_black();
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        match self.phase {
            Phase::Generate => {
                self.generate_landscape(ctx);
            }
            Phase::DrawWater | Phase::DrawLand => {
                let is_water_pass = self.phase == Phase::DrawWater;
                let n = self.grid_size;
                // Draw ~120–250 cells per 25ms frame so a 32×32 or 64×64 landscape paints smoothly in ~1–2s
                let total_cells = (n * n).max(1);
                let cells_per_frame = (total_cells / 40).clamp(16, 256);

                let mut drawn = 0;
                while drawn < cells_per_frame && self.cur_y < n {
                    let x = self.cur_x;
                    let y = self.cur_y;
                    // Exact 2 triangles per cell (`1:0989..0A08` & `1:0A8A..0B09`)
                    self.emit_grid_triangle(
                        ctx,
                        x,
                        y,
                        x,
                        y + 1,
                        x + 1,
                        y + 1,
                        is_water_pass,
                        !is_water_pass,
                    );
                    self.emit_grid_triangle(
                        ctx,
                        x,
                        y,
                        x + 1,
                        y + 1,
                        x + 1,
                        y,
                        is_water_pass,
                        !is_water_pass,
                    );

                    drawn += 1;
                    self.cur_x += 1;
                    if self.cur_x >= n {
                        self.cur_x = 0;
                        self.cur_y += 1;
                    }
                }

                if self.cur_y >= n {
                    self.cur_x = 0;
                    self.cur_y = 0;
                    if is_water_pass {
                        self.phase = Phase::DrawLand;
                    } else {
                        // Hold finished landscape before generating next planet (`1:0B98..0C06`)
                        let hold_secs = ((4.0f64.powi(self.complexity) / 6.0) as u64).clamp(8, 25);
                        self.hold_end_ms = ctx.elapsed_ms + hold_secs * 1000;
                        self.phase = Phase::Hold;
                    }
                }
            }
            Phase::Hold => {
                if ctx.elapsed_ms >= self.hold_end_ms {
                    self.phase = Phase::Generate;
                }
            }
        }
        AdResult::NoError
    }
}
