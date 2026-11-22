//! 1:1 Decompilation of `LASER.AD` ("Lasers") from After Dark 1.0a (1991).
//!
//! Disassembly-backed from `docs/disasm/laser_seg1.asm` and `docs/disasm/laser_data.hex`.

use ad_sdk::palette::{AdPaletteKind, rgb};
use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

const MAX_RAYS: usize = 8;
const MAX_TRAIL: usize = 102; // 0x66 slots per ray in original LocalAlloc buffer

#[derive(Debug, Clone, Copy, Default)]
struct LaserRay {
    moving_x: i32,
    moving_y: i32,
    dx: i32,
    dy: i32,
    x: i32,
    y: i32,
    color_idx: usize,
}

pub struct LaserModule {
    num_rays: usize,
    trail_width: usize, // 2..=100, or 101 = Infinite
    color_speed_delay: i32,
    color_timer: i32,
    frame_count: u32,
    ring_idx: usize,
    draw_enabled: bool,
    origin_x: i32,
    origin_y: i32,
    rays: [LaserRay; MAX_RAYS],
    trail: [[(i32, i32); MAX_TRAIL]; MAX_RAYS],
    num_colors: usize,
}

impl LaserModule {
    pub fn new() -> Self {
        Self {
            num_rays: 3,
            trail_width: 30,
            color_speed_delay: 40,
            color_timer: 0,
            frame_count: 0,
            ring_idx: 0,
            draw_enabled: true,
            origin_x: 0,
            origin_y: 0,
            rays: [LaserRay::default(); MAX_RAYS],
            trail: [[(0, 0); MAX_TRAIL]; MAX_RAYS],
            num_colors: 235,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "laser".to_string(),
            filename: "LASER.AD".to_string(),
            name: "Lasers".to_string(),
            credit: "Lasers by Bill Stewart.\r\n  \u{00a9}1990 Berkeley Systems Inc.".to_string(),
            about: concat!(
                "LASERS (tm)\r\n\r\n",
                "Mulit-colored lasers that clear your screen and can create interesting patterns.  \r\n\r\n",
                "The number of lasers can be varied from 1-8.\r\n\r\n",
                "The width of the laser traces can be varied from 1 to 100, as well as Infinite.\r\n\r\n",
                "Concept by Bill Stewart and Ian MacDonald.\r\n\r\n"
            )
            .to_string(),
            controls: [
                AdControl::Menu {
                    title: "Rays:".to_string(),
                    default_index: 2,
                    choices: (1..=8).map(|n| n.to_string()).collect(),
                },
                AdControl::LabeledSlider {
                    title: "Width:".to_string(),
                    default_raw: 40,
                    labels: vec![
                        "Thin", "5", "10", "20", "30", "40", "50", "60", "75", "100", "Infinite",
                    ]
                    .into_iter()
                    .map(String::from)
                    .collect(),
                    thresholds: vec![7, 15, 25, 35, 45, 55, 65, 75, 85, 95, 100],
                },
                AdControl::NumericSlider {
                    title: "Color Speed:".to_string(),
                    default_raw: 92,
                    unit: "%".to_string(),
                    min: 1,
                    max: 100,
                },
                AdControl::Checkbox {
                    title: "Clear Screen First".to_string(),
                    default_checked: false,
                },
            ],
            target_frame_ms: 20,
        }
    }

    fn map_width(val: i32) -> usize {
        // 1:004D..1:0105
        match val {
            0 => 2,
            7 => 5,
            15 => 10,
            25 => 20,
            35 => 30,
            45 => 40,
            55 => 50,
            65 => 60,
            75 => 75,
            85 => 100,
            95 | 100 => 101, // Infinite
            _ => 30,
        }
    }

    fn init_ray_speeds(&mut self, ctx: &mut AdContext<'_>, ray_idx: usize) {
        // 1:096E..1:09B5: 4 random speed draws (14 max, +2 => 2..=15); slots 2 & 3 are dx & dy
        let _s0 = (ctx.rng.rand() % 14) + 2;
        let _s1 = (ctx.rng.rand() % 14) + 2;
        let dx = (ctx.rng.rand() % 14) + 2;
        let dy = (ctx.rng.rand() % 14) + 2;
        self.rays[ray_idx].dx = dx;
        self.rays[ray_idx].dy = dy;
    }

    fn init_burst(&mut self, ctx: &mut AdContext<'_>) {
        // 1:03B6..1:0738
        let w = ctx.module.rgn_width.max(1);
        let h = ctx.module.rgn_height.max(1);
        self.ring_idx = 0;
        self.color_timer = 0;

        // Random focal origin inset by 70px when screen permits
        self.origin_x = if w > 140 {
            (ctx.rng.rand() % (w - 140)) + 70
        } else {
            w / 2
        };
        self.origin_y = if h > 140 {
            (ctx.rng.rand() % (h - 140)) + 70
        } else {
            h / 2
        };

        // 8bpp HSV_PAL path (235 colors, matching 1:0432..1:0450 & 1:0523..1:053E)
        let hue_step = (256 / (self.num_rays as i32 * 4)).max(1) as usize;

        for i in 0..self.num_rays {
            if (ctx.rng.rand() % 2) == 0 {
                // Start on bottom edge, moving horizontally
                self.rays[i].x = ctx.rng.rand() % w;
                self.rays[i].y = h;
                self.rays[i].moving_x = 1;
                self.rays[i].moving_y = 0;
            } else {
                // Start on left edge, moving vertically
                self.rays[i].x = 0;
                self.rays[i].y = ctx.rng.rand() % h;
                self.rays[i].moving_x = 0;
                self.rays[i].moving_y = 1;
            }

            if i == 0 {
                self.rays[i].color_idx = 1;
            } else {
                self.rays[i].color_idx = (self.rays[i - 1].color_idx + hue_step) % self.num_colors;
                if self.rays[i].color_idx == 0 {
                    self.rays[i].color_idx = 1;
                }
            }

            self.init_ray_speeds(ctx, i);
        }

        let fill_len = self.trail_width.min(MAX_TRAIL);
        for r in 0..self.num_rays {
            for t in 0..fill_len {
                self.trail[r][t] = (self.origin_x, self.origin_y);
            }
        }
        self.draw_enabled = true;
    }

    fn erase_burst(&mut self, ctx: &mut AdContext<'_>) {
        // 1:0739..1:07A4
        self.draw_enabled = false;
        let steps = if self.trail_width < 101 {
            self.trail_width
        } else {
            0
        };
        for _ in 0..steps {
            self.step_lasers(ctx);
        }
        if ctx.module.control_value[3] != 0 {
            ctx.surface.fill_black();
        }
    }

    fn resolve_color(&self, ctx: &AdContext<'_>, idx: usize) -> u32 {
        if idx == 0 {
            return rgb(0, 0, 0);
        }
        if let Some(ref pal) = ctx.module.palette {
            pal.colorref(idx)
        } else {
            // Fallback HSV-like hue if palette hasn't been installed yet
            ad_sdk::palette::AdPalette::build(AdPaletteKind::Hsv).colorref(idx)
        }
    }

    fn step_lasers(&mut self, ctx: &mut AdContext<'_>) {
        // 1:09B6..1:0B3D
        let w = ctx.module.rgn_width;
        let h = ctx.module.rgn_height;

        for i in 0..self.num_rays {
            if self.trail_width < 101 {
                let (ox, oy) = self.trail[i][self.ring_idx];
                ctx.surface
                    .line(self.origin_x, self.origin_y, ox, oy, 1, rgb(0, 0, 0));
            }

            // 1:083B: move_x
            let nx = self.rays[i].x + self.rays[i].moving_x * self.rays[i].dx;
            if nx < -10 || nx > w + 10 {
                self.rays[i].moving_x = 0;
                self.rays[i].moving_y = 1;
                self.rays[i].dx = -self.rays[i].dx;
            } else {
                self.rays[i].x = nx;
            }

            // 1:08B1: move_y
            let ny = self.rays[i].y + self.rays[i].moving_y * self.rays[i].dy;
            if ny < -10 || ny > h + 10 {
                self.rays[i].moving_y = 0;
                self.rays[i].moving_x = 1;
                self.rays[i].dy = -self.rays[i].dy;
            } else {
                self.rays[i].y = ny;
            }

            self.trail[i][self.ring_idx] = (self.rays[i].x, self.rays[i].y);

            if self.draw_enabled {
                let color = self.resolve_color(ctx, self.rays[i].color_idx);
                ctx.surface.line(
                    self.origin_x,
                    self.origin_y,
                    self.rays[i].x,
                    self.rays[i].y,
                    1,
                    color,
                );
            }
        }

        if self.trail_width < 101 {
            self.ring_idx += 1;
            if self.ring_idx >= self.trail_width {
                self.ring_idx = 0;
            }
        }

        // Advance colors (1:0AD6..1:0B12)
        if self.color_speed_delay < 500 {
            self.color_timer += 1;
            if self.color_timer > self.color_speed_delay {
                for i in 0..self.num_rays {
                    self.rays[i].color_idx += 1;
                    if self.rays[i].color_idx >= self.num_colors {
                        self.rays[i].color_idx = 1;
                    }
                }
                self.color_timer = 0;
            }
        } else {
            for r in &mut self.rays {
                r.color_idx = 1;
            }
        }
    }
}

impl Default for LaserModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for LaserModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:0019..1:021A
        self.frame_count = 0;
        self.num_rays = (ctx.module.control_value[0] + 1).clamp(1, MAX_RAYS as i32) as usize;
        self.color_speed_delay = (100 - ctx.module.control_value[2]) * 5;
        self.trail_width = Self::map_width(ctx.module.control_value[1]);
        self.num_colors = 235;
        self.init_burst(ctx);
        // Request HSV_PAL immediately so ctx.module.palette is ready before DoBlank / DoDrawFrame
        AdResult::PaletteRequest(AdPaletteKind::Hsv)
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:021B..1:026F
        if ctx.module.control_value[3] != 0 {
            ctx.surface.fill_black();
        }
        AdResult::PaletteRequest(AdPaletteKind::Hsv)
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:0270..1:02B8
        self.color_speed_delay = (100 - ctx.module.control_value[2]) * 5;
        if self.frame_count < 1000 {
            self.frame_count += 1;
        } else {
            self.frame_count = 0;
            self.erase_burst(ctx);
            self.init_burst(ctx);
        }
        self.step_lasers(ctx);
        AdResult::NoError
    }

    fn do_button_message(&mut self, control_index: usize) -> AdResult {
        // 1:0361..1:03B5
        match control_index {
            0 | 1 => AdResult::RestartMe,
            _ => AdResult::NoError,
        }
    }
}
