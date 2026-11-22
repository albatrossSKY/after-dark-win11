//! 1:1 Decompilation of `MAGIC.AD` ("Magic") from After Dark 1.0a (1991).
//!
//! Disassembly-backed from `docs/disasm/magic_seg1.asm` and `docs/disasm/magic_data.hex`.

use ad_sdk::palette::{AdPalette, AdPaletteKind, rgb};
use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult, ModuleRunner};

const MAX_LINES: usize = 152;
const VEL_PERIOD: i32 = 700;

#[derive(Debug, Clone, Copy, Default)]
struct LineRec {
    x1: i32,
    y1: i32,
    x2: i32,
    y2: i32,
}

pub struct MagicModule {
    num_lines: usize, // 10..=150 or 151 (Infinite)
    line_delay: i32,
    color_delay: i32,
    mirror_mode: i32, // 0=None, 1=Horizontal, 2=Vertical, 3=Both
    speed_count: i32,
    color_count: i32,
    vel_timer: i32,
    curr_color: usize,
    num_colors: usize,
    head: usize,
    max_vel: i32,

    x1: i32,
    y1: i32,
    x2: i32,
    y2: i32,
    dx1: i32,
    dy1: i32,
    dx2: i32,
    dy2: i32,

    lines: [LineRec; MAX_LINES],
}

impl MagicModule {
    pub fn new() -> Self {
        Self {
            num_lines: 10,
            line_delay: 0,
            color_delay: 75,
            mirror_mode: 1,
            speed_count: 0,
            color_count: 0,
            vel_timer: 0,
            curr_color: 1,
            num_colors: 235,
            head: 0,
            max_vel: 12,
            x1: 5,
            y1: 5,
            x2: 5,
            y2: 5,
            dx1: 1,
            dy1: 1,
            dx2: 1,
            dy2: 1,
            lines: [LineRec::default(); MAX_LINES],
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "magic".to_string(),
            filename: "MAGIC.AD".to_string(),
            name: "Magic".to_string(),
            credit: "Magic by Bill Stewart & Ian MacDonald.\r\n  \u{00a9}1990 Berkeley Systems Inc."
                .to_string(),
            about: concat!(
                "MAGIC (tm) draws colorful, hypnotic symmetric line patterns.\r\n\r\n",
                "Adjust the number of lines (up to Infinite), Line Speed, Color Speed, and Mirror symmetry."
            )
            .to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "Lines:".to_string(),
                    default_raw: 8,
                    labels: vec![
                        "10", "20", "30", "40", "50", "60", "70", "80", "90", "100", "110", "120",
                        "130", "140", "150", "Infinite",
                    ]
                    .into_iter()
                    .map(String::from)
                    .collect(),
                    thresholds: vec![
                        12, 18, 24, 30, 36, 42, 48, 54, 60, 66, 72, 78, 84, 90, 95, 100,
                    ],
                },
                AdControl::NumericSlider {
                    title: "Line Speed:".to_string(),
                    default_raw: 100,
                    unit: "%".to_string(),
                    min: 1,
                    max: 100,
                },
                AdControl::NumericSlider {
                    title: "Color Speed:".to_string(),
                    default_raw: 85,
                    unit: "%".to_string(),
                    min: 1,
                    max: 100,
                },
                AdControl::Menu {
                    title: "Mirror:".to_string(),
                    default_index: 1,
                    choices: vec![
                        "None".to_string(),
                        "Horizontal".to_string(),
                        "Vertical".to_string(),
                        "Both".to_string(),
                    ],
                },
            ],
            target_frame_ms: 20,
        }
    }

    fn map_num_lines(val: i32) -> usize {
        match val {
            0 => 10,
            12 => 20,
            18 => 30,
            24 => 40,
            30 => 50,
            36 => 60,
            42 => 70,
            48 => 80,
            54 => 90,
            60 => 100,
            66 => 110,
            72 => 120,
            78 => 130,
            84 => 140,
            90 => 150,
            95 | 100 => 151,
            _ => 10,
        }
    }

    fn resolve_color(&self, ctx: &AdContext<'_>, idx: usize) -> u32 {
        if idx == 0 {
            return rgb(0, 0, 0);
        }
        if let Some(ref pal) = ctx.module.palette {
            pal.colorref(idx)
        } else {
            AdPalette::build(AdPaletteKind::Hsv).colorref(idx)
        }
    }

    fn draw_mirrored(&self, ctx: &mut AdContext<'_>, x1: i32, y1: i32, x2: i32, y2: i32, color: u32) {
        let w = ctx.module.rgn_width;
        let h = ctx.module.rgn_height;
        ctx.surface.line(x1, y1, x2, y2, 1, color);
        match self.mirror_mode {
            1 => ctx.surface.line(w - x1, y1, w - x2, y2, 1, color),
            2 => ctx.surface.line(x1, h - y1, x2, h - y2, 1, color),
            3 => {
                ctx.surface.line(x1, h - y1, x2, h - y2, 1, color);
                ctx.surface.line(w - x1, y1, w - x2, y2, 1, color);
                ctx.surface.line(w - x1, h - y1, w - x2, h - y2, 1, color);
            }
            _ => {}
        }
    }

    fn randomize_velocities(&mut self, ctx: &mut AdContext<'_>) {
        // 1:0A6D..1:0AEE
        let mv = self.max_vel.max(2);
        self.dx1 = (ctx.rng.rand() % mv).max(1);
        self.dy1 = (ctx.rng.rand() % mv).max(1);
        self.dx2 = (ctx.rng.rand() % mv).max(1);
        self.dy2 = (ctx.rng.rand() % mv).max(1);
    }

    #[inline]
    fn step_coord(val: &mut i32, vel: &mut i32, limit: i32) {
        let next = *val + *vel;
        if next < 2 || next > limit - 2 {
            *vel = -*vel;
        } else {
            *val = next;
        }
    }
}

impl Default for MagicModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for MagicModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:0019..1:03C8
        let w = ctx.module.rgn_width.max(6);
        let h = ctx.module.rgn_height.max(6);

        self.line_delay = (100 - ctx.module.control_value[1]) * 2;
        self.color_delay = (100 - ctx.module.control_value[2]) * 5;
        self.mirror_mode = ctx.module.control_value[3];
        self.num_lines = Self::map_num_lines(ctx.module.control_value[0]);
        self.num_colors = 235;
        self.max_vel = if self.num_lines == 151 { 6 } else { 12 };

        self.lines = [LineRec::default(); MAX_LINES];

        self.x1 = (ctx.rng.rand() % (w - 2).max(1)) + 2;
        self.y1 = (ctx.rng.rand() % (h - 2).max(1)) + 2;
        self.x2 = ctx.rng.rand() % w;
        self.y2 = ctx.rng.rand() % h;

        if self.x1 > w || self.x1 <= 0 {
            self.x1 = 5;
        }
        if self.y1 > h || self.y1 <= 0 {
            self.y1 = 5;
        }
        if self.x2 > w || self.x2 <= 0 {
            self.x2 = 5;
        }
        if self.y2 > h || self.y2 <= 0 {
            self.y2 = 5;
        }

        self.curr_color = 1;
        self.head = 0;
        self.color_count = 0;
        self.vel_timer = 0;
        self.speed_count = 0;

        AdResult::PaletteRequest(AdPaletteKind::Hsv)
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.surface.fill_black();
        AdResult::PaletteRequest(AdPaletteKind::Hsv)
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:0417..1:0529
        self.line_delay = (100 - ctx.module.control_value[1]) * 2;
        self.color_delay = (100 - ctx.module.control_value[2]) * 5;

        if self.num_lines == 0 {
            return AdResult::NoError;
        }
        self.speed_count += 1;
        if self.speed_count < self.line_delay {
            return AdResult::NoError;
        }
        self.speed_count = 0;

        if self.num_lines < 151 {
            let old = self.lines[self.head];
            if old.x1 != old.x2 || old.y1 != old.y2 {
                self.draw_mirrored(ctx, old.x1, old.y1, old.x2, old.y2, rgb(0, 0, 0));
            }
        }

        if self.vel_timer == 0 {
            self.randomize_velocities(ctx);
        }

        let w = ctx.module.rgn_width;
        let h = ctx.module.rgn_height;
        Self::step_coord(&mut self.x1, &mut self.dx1, w);
        Self::step_coord(&mut self.y1, &mut self.dy1, h);
        Self::step_coord(&mut self.x2, &mut self.dx2, w);
        Self::step_coord(&mut self.y2, &mut self.dy2, h);

        let col = self.resolve_color(ctx, self.curr_color);
        self.draw_mirrored(ctx, self.x1, self.y1, self.x2, self.y2, col);
        self.lines[self.head] = LineRec {
            x1: self.x1,
            y1: self.y1,
            x2: self.x2,
            y2: self.y2,
        };

        if self.color_delay < 500 {
            self.color_count += 1;
            if self.color_count > self.color_delay {
                self.curr_color += 1;
                if self.curr_color >= self.num_colors {
                    self.curr_color = 1;
                }
                self.color_count = 0;
            }
        } else {
            self.curr_color = 1;
        }

        self.vel_timer += 1;
        if self.vel_timer > VEL_PERIOD {
            self.vel_timer = 0;
        }

        if self.num_lines < 151 {
            self.head += 1;
            if self.head >= self.num_lines {
                self.head = 0;
            }
        }

        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        if ctx.system.runner == ModuleRunner::AfterDark {
            ctx.surface.fill_black();
        }
        AdResult::NoError
    }

    fn do_button_message(&mut self, control_index: usize) -> AdResult {
        match control_index {
            0 | 3 => AdResult::RestartMe,
            _ => AdResult::NoError,
        }
    }
}
