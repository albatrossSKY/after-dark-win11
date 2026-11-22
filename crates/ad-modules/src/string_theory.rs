//! 1:1 Decompilation of `STRING.AD` ("String Theory") from After Dark 1.0a (1991).
//!
//! Disassembly-backed from `docs/disasm/string_seg1.asm` and `docs/disasm/string_data.hex`.

use ad_sdk::palette::{AdPalette, AdPaletteKind, rgb};
use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult, ModuleRunner};

const MAX_GROUPS: usize = 4;
const MAX_STRINGS: usize = 152;
const VEL_PERIOD: i32 = 700;

#[derive(Debug, Clone, Copy, Default)]
struct LineRec {
    x1: i32,
    y1: i32,
    x2: i32,
    y2: i32,
}

#[derive(Debug, Clone, Copy, Default)]
struct StringGroup {
    move_x1: i32,
    move_y1: i32,
    move_x2: i32,
    move_y2: i32,
    dx1: i32,
    dy1: i32,
    dx2: i32,
    dy2: i32,
    x1: i32,
    y1: i32,
    x2: i32,
    y2: i32,
    color: usize,
}

pub struct StringTheoryModule {
    num_groups: usize,
    num_strings: usize, // 10..=150 or 151 (Infinite)
    color_delay: i32,
    color_count: i32,
    vel_timer: i32,
    num_colors: usize,
    head: usize,
    groups: [StringGroup; MAX_GROUPS],
    lines: [[LineRec; MAX_STRINGS]; MAX_GROUPS],
}

impl StringTheoryModule {
    pub fn new() -> Self {
        Self {
            num_groups: 3,
            num_strings: 140,
            color_delay: 20,
            color_count: 0,
            vel_timer: 0,
            num_colors: 235,
            head: 0,
            groups: [StringGroup::default(); MAX_GROUPS],
            lines: [[LineRec::default(); MAX_STRINGS]; MAX_GROUPS],
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "string".to_string(),
            filename: "STRING.AD".to_string(),
            name: "String Theory".to_string(),
            credit: "String Theory by Bill Stewart.\r\n  \u{00a9}1990 Berkeley Systems Inc."
                .to_string(),
            about: concat!(
                "STRING THEORY (tm) creates graceful webs of colorful lines sweeping around ",
                "the perimeter of your screen.\r\n\r\n",
                "Adjust String Groups (1-4), Strings (10-150 or Infinite), Color Speed, and Clear Screen First."
            )
            .to_string(),
            controls: [
                AdControl::Menu {
                    title: "String Groups:".to_string(),
                    default_index: 2,
                    choices: vec![
                        "1".to_string(),
                        "2".to_string(),
                        "3".to_string(),
                        "4".to_string(),
                    ],
                },
                AdControl::LabeledSlider {
                    title: "Strings:".to_string(),
                    default_raw: 87,
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
                    title: "Color Speed:".to_string(),
                    default_raw: 96,
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

    fn map_num_strings(val: i32) -> usize {
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
            _ => 140,
        }
    }

    fn randomize_group_vel(&mut self, ctx: &mut AdContext<'_>, idx: usize) {
        // 1:0A0E..1:0A55: positive velocities in {2, 3, 4}
        let g = &mut self.groups[idx];
        g.dx1 = (ctx.rng.rand() % 3) + 2;
        g.dy1 = (ctx.rng.rand() % 3) + 2;
        g.dx2 = (ctx.rng.rand() % 3) + 2;
        g.dy2 = (ctx.rng.rand() % 3) + 2;
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
}

impl Default for StringTheoryModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for StringTheoryModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:0019..1:0432
        let w = ctx.module.rgn_width.max(4);
        let h = ctx.module.rgn_height.max(4);

        self.num_groups = (ctx.module.control_value[0] + 1).clamp(1, MAX_GROUPS as i32) as usize;
        self.color_delay = (100 - ctx.module.control_value[2]) * 5;
        self.num_strings = Self::map_num_strings(ctx.module.control_value[1]);
        self.num_colors = 235;
        self.head = 0;
        self.color_count = 0;
        self.vel_timer = 0;
        self.lines = [[LineRec::default(); MAX_STRINGS]; MAX_GROUPS];

        for i in 0..self.num_groups {
            let mut g = StringGroup::default();
            if (ctx.rng.rand() % 2) == 0 {
                g.x1 = (ctx.rng.rand() % (w - 2).max(1)) + 2;
                g.y1 = 0;
                g.x2 = ctx.rng.rand() % w;
                g.y2 = h;
                g.move_x1 = 1;
                g.move_x2 = 1;
                g.move_y1 = 0;
                g.move_y2 = 0;
            } else {
                g.x1 = 0;
                g.y1 = (ctx.rng.rand() % (h - 2).max(1)) + 2;
                g.x2 = w;
                g.y2 = ctx.rng.rand() % h;
                g.move_x1 = 0;
                g.move_x2 = 0;
                g.move_y1 = 1;
                g.move_y2 = 1;
            }
            g.color = (ctx.rng.rand() as usize) % self.num_colors;
            self.groups[i] = g;
            self.randomize_group_vel(ctx, i);
        }

        AdResult::PaletteRequest(AdPaletteKind::Hsv)
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        if ctx.module.control_value[3] != 0 {
            ctx.surface.fill_black();
        }
        AdResult::PaletteRequest(AdPaletteKind::Hsv)
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:0488..1:0676
        self.color_delay = (100 - ctx.module.control_value[2]) * 5;
        if self.num_strings == 0 {
            return AdResult::NoError;
        }

        let w = ctx.module.rgn_width;
        let h = ctx.module.rgn_height;

        for i in 0..self.num_groups {
            if self.num_strings < 151 {
                let old = self.lines[i][self.head];
                if old.x1 != old.x2 || old.y1 != old.y2 {
                    ctx.surface
                        .line(old.x1, old.y1, old.x2, old.y2, 1, rgb(0, 0, 0));
                }
            }

            if self.vel_timer == 0 {
                self.randomize_group_vel(ctx, i);
            }

            // Exact perimeter crawl order: X1, Y1, X2, Y2
            let g = &mut self.groups[i];
            let nx1 = g.x1 + g.dx1 * g.move_x1;
            if nx1 < 0 || nx1 > w {
                g.dx1 = -g.dx1;
                g.move_x1 = 0;
                g.move_y1 = 1;
            } else {
                g.x1 = nx1;
            }

            let ny1 = g.y1 + g.dy1 * g.move_y1;
            if ny1 < 0 || ny1 > h {
                g.dy1 = -g.dy1;
                g.move_y1 = 0;
                g.move_x1 = 1;
            } else {
                g.y1 = ny1;
            }

            let nx2 = g.x2 + g.dx2 * g.move_x2;
            if nx2 < 0 || nx2 > w {
                g.dx2 = -g.dx2;
                g.move_x2 = 0;
                g.move_y2 = 1;
            } else {
                g.x2 = nx2;
            }

            let ny2 = g.y2 + g.dy2 * g.move_y2;
            if ny2 < 0 || ny2 > h {
                g.dy2 = -g.dy2;
                g.move_y2 = 0;
                g.move_x2 = 1;
            } else {
                g.y2 = ny2;
            }

            let (x1, y1, x2, y2, cidx) = (g.x1, g.y1, g.x2, g.y2, g.color);
            self.lines[i][self.head] = LineRec { x1, y1, x2, y2 };
            let col = self.resolve_color(ctx, cidx);
            ctx.surface.line(x1, y1, x2, y2, 1, col);
        }

        if self.num_strings < 151 {
            self.head += 1;
            if self.head >= self.num_strings {
                self.head = 0;
            }
        }

        if self.color_delay < 500 {
            self.color_count += 1;
            if self.color_count > self.color_delay {
                for i in 0..self.num_groups {
                    self.groups[i].color += 1;
                    if self.groups[i].color >= self.num_colors {
                        self.groups[i].color = 1;
                    }
                }
                self.color_count = 0;
            }
        } else {
            for g in &mut self.groups {
                g.color = 1;
            }
        }

        self.vel_timer += 1;
        if self.vel_timer > VEL_PERIOD {
            self.vel_timer = 0;
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
            0 | 1 => AdResult::RestartMe,
            _ => AdResult::NoError,
        }
    }
}
