//! 1:1 Decompilation of `RAIN.AD` ("Hard Rain") from After Dark 1.0a (1991).
//!
//! Disassembly-backed from `docs/disasm/rain_seg1.asm` and `docs/disasm/rain_data.hex`.

use ad_sdk::palette::rgb;
use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

const MAX_DROPS: usize = 21;

#[derive(Debug, Clone, Copy, Default)]
struct RainDrop {
    r: u8,
    g: u8,
    b: u8,
    x: i32,
    y: i32,
    radius: u32,
    max_radius: u32,
}

pub struct HardRainModule {
    num_drops: usize,
    drop_size: i32,
    cur_drop: usize,
    drops: [RainDrop; MAX_DROPS],
}

impl HardRainModule {
    pub fn new() -> Self {
        Self {
            num_drops: 2,
            drop_size: 18,
            cur_drop: 0,
            drops: [RainDrop::default(); MAX_DROPS],
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "rain".to_string(),
            filename: "RAIN.AD".to_string(),
            name: "Hard Rain".to_string(),
            credit: "Hard Rain by Bill Stewart & Tracy Elmore.\r\n  \u{00a9}1990 Berkeley Systems Inc."
                .to_string(),
            about: concat!(
                "HARD RAIN (tm)\r\n\r\n",
                "Based on original design by James J. Eastman.\r\n",
                "See Scientific American, Dec 1987.\r\n\r\n"
            )
            .to_string(),
            controls: [
                AdControl::NumericSlider {
                    title: "# of Drops:".to_string(),
                    default_raw: 22,
                    unit: String::new(),
                    min: 1,
                    max: 9,
                },
                AdControl::NumericSlider {
                    title: "Drop Size:".to_string(),
                    default_raw: 43,
                    unit: String::new(),
                    min: 5,
                    max: 35,
                },
                AdControl::None,
                AdControl::Checkbox {
                    title: "Clear Screen First".to_string(),
                    default_checked: false,
                },
            ],
            target_frame_ms: 33,
        }
    }

    fn init_drop(&mut self, ctx: &mut AdContext<'_>, idx: usize) {
        // 1:0151..1:0274: exact 4 rand() calls in order: color, maxRadius, x, y
        let (r, g, b) = match ctx.rng.rand() % 6 {
            0 => (255, 0, 0),
            1 => (255, 0, 255),
            2 => (0, 0, 255),
            3 => (0, 255, 255),
            4 => (0, 255, 0),
            _ => (255, 255, 0),
        };
        let max_radius = ((ctx.rng.rand() % self.drop_size.max(1)) + 7) as u32;
        let x = ctx.rng.rand() % ctx.module.rgn_width.max(1);
        let y = ctx.rng.rand() % ctx.module.rgn_height.max(1);

        self.drops[idx] = RainDrop {
            r,
            g,
            b,
            x,
            y,
            radius: 4,
            max_radius,
        };
    }

    fn draw_drop(&mut self, ctx: &mut AdContext<'_>, idx: usize) {
        // 1:0275..1:03E5
        let aspect_x = (ctx.system.aspect_x.max(1)) as u32;
        let aspect_y = (ctx.system.aspect_y.max(1)) as u32;

        let d = self.drops[idx];
        let y_rad = d.radius as i32;
        let x_rad = ((d.radius * aspect_y) / aspect_x) as i32;
        let pen_width = if d.radius > (d.max_radius >> 1) { 1 } else { 2 };
        let col = rgb(d.r, d.g, d.b);

        // Interior is BLACK_BRUSH so expanding ripple erases inner rings & eats desktop
        ctx.surface.ellipse_pen_width(
            d.x - x_rad,
            d.y - y_rad,
            d.x + x_rad,
            d.y + y_rad,
            pen_width,
            Some(col),
            Some(rgb(0, 0, 0)),
        );

        if d.radius + 3 > d.max_radius {
            // Erase final ring immediately using radius + 1 with BLACK_PEN & BLACK_BRUSH
            let end_rad = d.radius + 1;
            let ey = end_rad as i32;
            let ex = ((end_rad * aspect_y) / aspect_x) as i32;
            ctx.surface.ellipse_pen_width(
                d.x - ex,
                d.y - ey,
                d.x + ex,
                d.y + ey,
                1,
                Some(rgb(0, 0, 0)),
                Some(rgb(0, 0, 0)),
            );
            self.init_drop(ctx, idx);
        } else {
            self.drops[idx].radius += 3;
        }
    }
}

impl Default for HardRainModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for HardRainModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:0012..1:0054
        self.num_drops = (ctx.module.control_value[0].clamp(1, MAX_DROPS as i32)) as usize;
        self.drop_size = ctx.module.control_value[1].max(1);
        self.cur_drop = 0;
        for i in 0..self.num_drops {
            self.init_drop(ctx, i);
        }
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:0055..1:00A1
        if ctx.module.control_value[3] != 0 {
            ctx.surface.fill_black();
        }
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:00A2..1:00D1
        self.drop_size = ctx.module.control_value[1].max(1);
        self.draw_drop(ctx, self.cur_drop);
        self.cur_drop += 1;
        if self.cur_drop >= self.num_drops {
            self.cur_drop = 0;
        }
        AdResult::NoError
    }

    fn do_button_message(&mut self, control_index: usize) -> AdResult {
        // 1:010E..1:0150
        if control_index == 0 {
            AdResult::RestartMe
        } else {
            AdResult::NoError
        }
    }
}
