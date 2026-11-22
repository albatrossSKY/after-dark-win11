//! 1:1 Decompilation of `SPHERES.AD` ("Spheres") from After Dark 1.0a (1991).
//!
//! Disassembly-backed from `docs/disasm/spheres_seg1.asm` and `docs/disasm/spheres_data.hex`.

use ad_sdk::palette::{AdPaletteKind, rgb};
use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult, ModuleRunner};

const RADIUS_TABLE: [i32; 34] = [
    1000, 985, 969, 953, 937, 921, 905, 888, 870, 853, 835, 816, 798, 778, 759, 739, 718, 696,
    674, 651, 628, 603, 577, 550, 522, 492, 461, 426, 389, 348, 302, 246, 174, 99,
];

const OFFSET_TABLE: [i32; 34] = [
    0, 87, 123, 151, 174, 195, 213, 230, 246, 261, 275, 289, 302, 314, 326, 337, 348, 359, 369,
    379, 389, 399, 408, 417, 426, 435, 444, 452, 461, 469, 477, 485, 492, 500,
];

pub struct SpheresModule {
    max_size: i32,
    clear_every: i32,
    sphere_count: i32,

    b_red: bool,
    b_green: bool,
    b_blue: bool,
    b_orange: bool,

    init_radius: i32,
    y_radius: i32,
    ul_radius: u32,
    step: usize,
    center_x: i32,
    center_y: i32,
}

impl SpheresModule {
    pub fn new() -> Self {
        Self {
            max_size: 75,
            clear_every: 61,
            sphere_count: 0,
            b_red: true,
            b_green: false,
            b_blue: false,
            b_orange: false,
            init_radius: 50,
            y_radius: 50,
            ul_radius: 50,
            step: 0,
            center_x: 0,
            center_y: 0,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "spheres".to_string(),
            filename: "SPHERES.AD".to_string(),
            name: "Spheres".to_string(),
            credit: "Spheres by Bill Stewart & Mouse Herrell. \r\n  \u{00a9}1990 Berkeley Systems Inc."
                .to_string(),
            about: concat!(
                "SPHERES (tm) makes 3D-looking colorful orbs that fill your screen.\r\n\r\n",
                "\"Max Size\" is the maiximum size of a sphere.\r\n\r\n",
                "\"Offset\" controls the shape of the sphere.  The larger the offset, the more egg-shaped the sphere will be.\r\n\r\n",
                "\"Clear Every\" sets the number of spheres drawn before clearing the screen.\r\n\r\n",
                "Based on Spheres by Bruce Burkhalter."
            )
            .to_string(),
            controls: [
                AdControl::NumericSlider {
                    title: "Max Size:".to_string(),
                    default_raw: 73,
                    unit: "%".to_string(),
                    min: 10,
                    max: 100,
                },
                AdControl::NumericSlider {
                    title: "Offset:".to_string(),
                    default_raw: 27,
                    unit: String::new(),
                    min: 0,
                    max: 10,
                },
                AdControl::NumericSlider {
                    title: "Clear Every:".to_string(),
                    default_raw: 30,
                    unit: String::new(),
                    min: 1,
                    max: 200,
                },
                AdControl::Checkbox {
                    title: "Clear Screen First".to_string(),
                    default_checked: false,
                },
            ],
            target_frame_ms: 16,
        }
    }

    fn new_sphere(&mut self, ctx: &mut AdContext<'_>) {
        // 1:01C5..1:0314: exact 4 rand() calls: color, radius, x, y
        self.step = 0;
        let color = ctx.rng.rand() % 6;
        let (mut r, mut g, mut b, mut o) = match color {
            0 => (true, false, false, false),
            1 => (true, false, true, false),
            2 => (false, false, true, false),
            3 => (false, false, false, true),
            4 => (false, true, false, false),
            _ => (true, true, false, false),
        };
        if ctx.system.bits_per_pixel < 8 && color == 3 {
            r = true;
            g = true;
            b = true;
            o = false;
        }
        self.b_red = r;
        self.b_green = g;
        self.b_blue = b;
        self.b_orange = o;

        self.init_radius = (ctx.rng.rand() % self.max_size.max(1)) + 30;
        self.ul_radius = self.init_radius as u32;
        self.y_radius = self.init_radius;

        self.center_x = ctx.rng.rand() % ctx.module.rgn_width.max(1);
        self.center_y = ctx.rng.rand() % ctx.module.rgn_height.max(1);
        self.sphere_count += 1;
    }

    fn draw_slice(&mut self, ctx: &mut AdContext<'_>) {
        // 1:0315..1:04A5
        let offset_ctrl = ctx.module.control_value[1];
        let offset = ((OFFSET_TABLE[self.step] * offset_ctrl) * self.init_radius) / 10000;

        let intensity = (7 * (self.step as i32) + 24) as u8;
        let orange_g = (3 * (self.step as i32) + 29) as u8;

        let r = if self.b_red || self.b_orange {
            intensity
        } else {
            0
        };
        let g = if self.b_green {
            intensity
        } else if self.b_orange {
            orange_g
        } else {
            0
        };
        let b = if self.b_blue { intensity } else { 0 };

        let aspect_x = (ctx.system.aspect_x.max(1)) as u32;
        let aspect_y = (ctx.system.aspect_y.max(1)) as u32;
        let x_rad = ((self.ul_radius * aspect_y) / aspect_x) as i32;

        ctx.surface.ellipse(
            self.center_x - x_rad + offset,
            self.center_y - offset - self.y_radius,
            self.center_x + offset + x_rad,
            self.center_y - offset + self.y_radius,
            None,
            Some(rgb(r, g, b)),
        );

        self.step += 1;
        if self.step <= 33 {
            let next_r = (RADIUS_TABLE[self.step] * self.init_radius) / 1000;
            self.ul_radius = next_r.max(0) as u32;
            self.y_radius = next_r;
        } else {
            self.new_sphere(ctx);
        }
    }
}

impl Default for SpheresModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for SpheresModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:0012..1:004C
        self.max_size = ctx.module.control_value[0].max(1);
        self.clear_every = ctx.module.control_value[2] + 1;
        self.sphere_count = 0;
        self.new_sphere(ctx);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:004D..1:009A
        if ctx.module.control_value[3] != 0 {
            ctx.surface.fill_black();
        }
        AdResult::PaletteRequest(AdPaletteKind::Primary)
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:009B..1:00F1
        self.max_size = ctx.module.control_value[0].max(1);
        // Draw 2 slices per 16ms tick (~17 ticks = 0.28s per full 34-slice sphere, authentic 386 speed)
        for _ in 0..2 {
            self.draw_slice(ctx);
            if self.sphere_count >= self.clear_every {
                self.do_initialize(ctx);
                ctx.surface.fill_black();
                break;
            }
        }
        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:00F2..1:0142
        if ctx.system.runner == ModuleRunner::AfterDark {
            ctx.surface.fill_black();
        }
        AdResult::NoError
    }
}
