//! 1:1 Decompilation of `DRAINO.AD` ("Down the Drain") from After Dark 1.0a (1991).
//!
//! Disassembly-backed from `docs/disasm/draino_seg1.asm` and `docs/disasm/draino_data.hex`.

use ad_sdk::canvas::{AdRegion, AdSurface, ROP_SRCCOPY};
use ad_sdk::palette::rgb;
use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

const DRAINO_RAD2DEG: f64 = 57.273; // DS:0x0594
const DRAINO_180: f64 = 180.0; // DS:0x059C
const DRAINO_100: f64 = 100.0; // DS:0x05A4
const DRAINO_DEG2RAD: f64 = 0.017460234316344525; // DS:0x05AC = 1.0 / 57.273

/// Inner ring of 8 drain holes (`DS:0x001E..0x003D`).
const INNER_RING: [(i32, i32); 8] = [
    (0, 10),
    (7, 7),
    (10, 0),
    (7, -7),
    (0, -10),
    (-7, -7),
    (-10, 0),
    (-7, 7),
];

/// Outer ring of 12 drain holes (`DS:0x003E..0x006D`).
const OUTER_RING: [(i32, i32); 12] = [
    (0, 20),
    (10, 17),
    (17, 10),
    (20, 0),
    (17, -10),
    (10, -17),
    (0, -20),
    (-10, -17),
    (-17, -10),
    (-20, 0),
    (-17, 10),
    (-10, 17),
];

const DROP_COLORS: [u32; 6] = [
    rgb(255, 0, 0),   // Red
    rgb(255, 0, 255), // Magenta
    rgb(0, 0, 255),   // Blue
    rgb(0, 255, 255), // Cyan
    rgb(0, 255, 0),   // Green
    rgb(255, 255, 0), // Yellow
];

#[inline]
fn rects_intersect(a: [i32; 4], b: [i32; 4]) -> bool {
    a[0] < b[2] && a[2] > b[0] && a[1] < b[3] && a[3] > b[1]
}

pub struct DrainoModule {
    angle_delta: f32,
    radial_step: i32,
    angle_step: i32,
    cols: i32,
    rows: i32,
    frame_count: u32,
    drops_threshold: u32,
    drops_enabled: bool,
    drain_rect: [i32; 4],
    last_src_rect: [i32; 4],
    last_dst_rect: [i32; 4],
    scratch: Option<AdSurface>,
}

impl DrainoModule {
    pub fn new() -> Self {
        Self {
            angle_delta: 3.0,
            radial_step: 2,
            angle_step: 4,
            cols: 6,
            rows: 12,
            frame_count: 0,
            drops_threshold: 2000,
            drops_enabled: false,
            drain_rect: [0; 4],
            last_src_rect: [0; 4],
            last_dst_rect: [0; 4],
            scratch: None,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "draino".to_string(),
            filename: "DRAINO.AD".to_string(),
            name: "Down the Drain".to_string(),
            credit: "Down the Drain by Bill Stewart & Jim Stewart.\n©1990 Berkeley Systems Inc."
                .to_string(),
            about: "DOWN THE DRAIN (tm)\n\nOriginal concept by Rob Vaterlaus.\n\nThe \"Direction\" slider sets the coriolis force for Southern Hemisphere (Clockwise), Northern Hemisphere (Counter [Counterclockwise]), or on the equator (Inward). The \"Drops\" check box will add drops for draining after most of the screen is black. The \"Drain\" check box starts you draining with a drain in the middle of the screen.".to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "Speed:".to_string(),
                    default_raw: 100,
                    labels: vec!["Slow".to_string(), "Medium".to_string(), "Fast".to_string()],
                    thresholds: vec![33, 67, 100],
                },
                AdControl::LabeledSlider {
                    title: "Direction:".to_string(),
                    default_raw: 100,
                    labels: vec![
                        "Clockwise".to_string(),
                        "Inward".to_string(),
                        "Counter".to_string(),
                    ],
                    thresholds: vec![33, 67, 100],
                },
                AdControl::Checkbox {
                    title: "Drops".to_string(),
                    default_checked: true,
                },
                AdControl::Checkbox {
                    title: "Show Drain".to_string(),
                    default_checked: true,
                },
            ],
            target_frame_ms: 20,
        }
    }

    fn apply_controls(&mut self, speed_val: i32, dir_val: i32) {
        match speed_val {
            0 => {
                self.cols = 20;
                self.rows = 40;
                self.radial_step = 1;
                self.angle_step = 1;
                self.drops_threshold = 10_000;
            }
            33 => {
                self.cols = 10;
                self.rows = 20;
                self.radial_step = 2;
                self.angle_step = 2;
                self.drops_threshold = 7_000;
            }
            _ => {
                // 67 or 100 (Fast)
                self.cols = 6;
                self.rows = 12;
                self.radial_step = 2;
                self.angle_step = 4;
                self.drops_threshold = 2_000;
            }
        }
        self.angle_delta = match dir_val {
            0 => -(self.angle_step as f32),
            33 => 0.0,
            _ => self.angle_step as f32,
        };
    }

    fn draw_drain(&self, ctx: &mut AdContext<'_>) {
        if ctx.module.control_value[3] == 0 {
            return;
        }
        let mid_x = ctx.module.rgn_width / 2;
        let mid_y = ctx.module.rgn_height / 2;
        let rad_y = 3;
        let ax = ctx.system.aspect_x.max(1) as u32;
        let ay = ctx.system.aspect_y.max(1) as u32;
        let rad_x = ((3u32 * ay) / ax).max(1) as i32;
        let black = rgb(0, 0, 0);

        ctx.surface.ellipse(
            mid_x - rad_x,
            mid_y - rad_y,
            mid_x + rad_x,
            mid_y + rad_y,
            Some(black),
            Some(black),
        );
        for &(ox, oy) in &INNER_RING {
            let x = mid_x + ox;
            let y = mid_y + oy;
            ctx.surface
                .ellipse(x - rad_x, y - rad_y, x + rad_x, y + rad_y, Some(black), Some(black));
        }
        for &(ox, oy) in &OUTER_RING {
            let x = mid_x + ox;
            let y = mid_y + oy;
            ctx.surface
                .ellipse(x - rad_x, y - rad_y, x + rad_x, y + rad_y, Some(black), Some(black));
        }
    }

    fn drain_step(&mut self, ctx: &mut AdContext<'_>) {
        let rgn_w = ctx.module.rgn_width.max(24);
        let rgn_h = ctx.module.rgn_height.max(48);
        let blk_w = (rgn_w / self.cols).max(1);
        let blk_h = (rgn_h / self.rows).max(1);
        let mid_x = rgn_w / 2;
        let mid_y = rgn_h / 2;

        let span_x = (rgn_w - blk_w + 40).max(1);
        let span_y = (rgn_h - blk_h + 40).max(1);
        let src_x = ctx.rng.rand_mod(span_x) - 20;
        let src_y = ctx.rng.rand_mod(span_y) - 20;
        let half_blk_w = blk_w / 2;

        let quad = if src_x < mid_x && src_y < mid_y {
            1
        } else if src_x < mid_x && src_y >= mid_y {
            2
        } else if src_x >= mid_x && src_y >= mid_y {
            3
        } else {
            4
        };

        let mut dx = (src_x - mid_x) + half_blk_w;
        if dx == 0 {
            dx = 1;
        }
        let dy = mid_y - src_y;

        let angle_deg: f32 = if quad == 1 || quad == 2 {
            ((dy as f64 / dx as f64).atan() * DRAINO_RAD2DEG + DRAINO_180) as f32
        } else {
            ((dy as f64 / dx as f64).atan() * DRAINO_RAD2DEG) as f32
        };

        // Widened to i32 intermediates so HD/4K monitors >655px wide never overflow 16-bit dx*100.
        let temp_dx100 = (dx as f64 * DRAINO_100) as i32;
        let denom = (angle_deg as f64 * DRAINO_DEG2RAD).cos() * DRAINO_100;
        let radius = if denom.abs() < 1e-6 {
            ((dx * dx + dy * dy) as f64).sqrt() as i32
        } else {
            (temp_dx100 as f64 / denom) as i32
        };

        let new_angle_rad = (self.angle_delta + angle_deg) as f64 * DRAINO_DEG2RAD;
        let cos100 = (new_angle_rad.cos() * DRAINO_100) as i32;
        let sin100 = (new_angle_rad.sin() * DRAINO_100) as i32;
        let r_next = radius - self.radial_step;
        let new_dx = (cos100 * r_next) / 100;
        let new_dy = (sin100 * r_next) / 100;

        let dst_x = mid_x - half_blk_w + new_dx;
        let dst_y = mid_y - new_dy;

        let Some(ref mut scratch) = self.scratch else {
            return;
        };
        scratch.fill_black();

        if src_x > 2 && (src_x + blk_w) < (rgn_w - 2) && src_y > 2 && (src_y + blk_h) < (rgn_h - 2)
        {
            scratch.bit_blt_surface(0, 0, blk_w, blk_h, ctx.surface, src_x, src_y, ROP_SRCCOPY);
            self.last_src_rect = [src_x, src_y, src_x + blk_w, src_y + blk_h];
            self.last_dst_rect = [dst_x, dst_y, dst_x + blk_w, dst_y + blk_h];

            if rects_intersect(self.last_src_rect, self.drain_rect)
                && ctx.module.control_value[3] != 0
            {
                return;
            }
        }

        if dst_x > 2 && (dst_x + blk_w) < (rgn_w - 2) && dst_y > 2 && (dst_y + blk_h) < (rgn_h - 2)
        {
            ctx.surface
                .bit_blt_surface(dst_x, dst_y, blk_w, blk_h, scratch, 0, 0, ROP_SRCCOPY);
            if rects_intersect(self.last_dst_rect, self.drain_rect) {
                self.draw_drain(ctx);
            }
        }

        let near_edge = src_x < 5
            || (src_x + blk_w) > (rgn_w - 5)
            || src_y < 5
            || (src_y + blk_h) > (rgn_h - 5);
        if near_edge {
            let mut rgn_src = AdRegion::rect(src_x, src_y, src_x + blk_w, src_y + blk_h);
            let rgn_dst = AdRegion::rect(dst_x, dst_y, dst_x + blk_w, dst_y + blk_h);
            rgn_src.diff_with(&rgn_dst);
            ctx.surface.fill_rgn_rgb(&rgn_src, rgb(0, 0, 0));
        }
    }

    fn draw_drop(&self, ctx: &mut AdContext<'_>) {
        if !self.drops_enabled || ctx.rng.rand() >= 300 {
            return;
        }
        let color = DROP_COLORS[ctx.rng.rand_mod(6) as usize];
        let rad_y = ctx.rng.rand_mod(42) + 21;
        let cx = ctx.rng.rand_mod(ctx.module.rgn_width.max(1));
        let cy = ctx.rng.rand_mod(ctx.module.rgn_height.max(1));
        let ax = ctx.system.aspect_x.max(1) as u32;
        let ay = ctx.system.aspect_y.max(1) as u32;
        let rad_x = ((rad_y as u32 * ay) / ax).max(1) as i32;
        ctx.surface
            .ellipse(cx - rad_x, cy - rad_y, cx + rad_x, cy + rad_y, None, Some(color));
    }
}

impl Default for DrainoModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for DrainoModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.apply_controls(ctx.module.control_value[0], ctx.module.control_value[1]);

        let max_blk_w = (ctx.module.rgn_width / 6).max(1);
        let max_blk_h = (ctx.module.rgn_height / 12).max(1);
        self.scratch = AdSurface::new(max_blk_w, max_blk_h);
        if self.scratch.is_none() {
            return AdResult::MemError;
        }

        self.frame_count = 0;
        self.drops_enabled = false;
        let mid_x = ctx.module.rgn_width / 2;
        let mid_y = ctx.module.rgn_height / 2;
        self.drain_rect = [mid_x - 23, mid_y - 23, mid_x + 23, mid_y + 23];
        self.last_src_rect = [0; 4];
        self.last_dst_rect = [0; 4];

        self.draw_drain(ctx);
        AdResult::NoError
    }

    fn do_blank(&mut self, _ctx: &mut AdContext<'_>) -> AdResult {
        // Exact 1991 behavior (`1:01C5`): NO-OP — preserves live desktop!
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.apply_controls(ctx.module.control_value[0], ctx.module.control_value[1]);
        // Authentic 1991 PeekMessage idle loop runs ~600 tile moves/sec (12 per 20ms frame).
        for _ in 0..12 {
            self.drain_step(ctx);
            if self.frame_count >= self.drops_threshold {
                self.drops_enabled = true;
            } else {
                self.frame_count += 1;
            }
            if ctx.module.control_value[2] != 0 {
                self.draw_drop(ctx);
            }
        }
        AdResult::NoError
    }

    fn do_close(&mut self, _ctx: &mut AdContext<'_>) -> AdResult {
        self.scratch = None;
        AdResult::NoError
    }
}
