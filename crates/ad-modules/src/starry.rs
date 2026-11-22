//! Exact 1:1 decompilation of After Dark 1.0a's built-in **Starry Night** module
//! (`AD.EXE`, `SEG 2`, `0x0000..0x1016`, by Bill Stewart & Jim Stewart, ©1990 Berkeley Systems Inc.).

use ad_sdk::canvas::AdRegion;
use ad_sdk::palette::rgb;
use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

const MAX_MAIN_SEGS: usize = 100;
const MAX_FORK_SEGS: usize = 200;
const FORK_STOP_PCT: i32 = 10;
const STEP_DIVISOR: i32 = 40;

#[derive(Debug, Clone, Copy)]
struct Building {
    left: i32,
    top: i32,
    right: i32,
    bottom: i32,
    style: i32,
}

impl Building {
    #[inline]
    fn contains(&self, x: i32, y: i32) -> bool {
        // Matches Win16 PtInRect: half-open [left, right) x [top, bottom)
        x >= self.left && x < self.right && y >= self.top && y < self.bottom
    }
}

#[derive(Debug, Clone, Copy)]
struct BoltSeg {
    x1: i32,
    y1: i32,
    x2: i32,
    y2: i32,
}

#[derive(Debug, Clone, Copy)]
struct ActiveMeteor {
    x: i32,
    y: i32,
    dx: i32,
    prev_seg: Option<(i32, i32, i32, i32)>,
}

#[derive(Debug, Clone)]
struct ActiveLightning {
    main_segs: Vec<BoltSeg>,
    fork_segs: Vec<BoltSeg>,
    double_flash: bool,
    /// State machine so flashes are clearly visible on modern double-buffered displays
    /// instead of blocking inside `BusyDelay(100000)` on a 1990 386.
    /// 0 = flash 1 active, 1 = dark gap (double flash only), 2 = flash 2 active
    phase: u8,
    frames_left: u8,
}

pub struct StarryNightModule {
    n_buildings: i32,
    height_pct: i32,
    skyline_height: i32,
    lightning: i32,
    tallest_x: i32,
    tallest_y: i32,
    beacon_on: bool,
    last_beacon_sec: u64,
    star_color_idx: i32,
    buildings: Vec<Building>,
    rgn_buildings: Option<AdRegion>,
    active_meteor: Option<ActiveMeteor>,
    active_lightning: Option<ActiveLightning>,
}

impl StarryNightModule {
    pub fn new() -> Self {
        Self {
            n_buildings: 32,
            height_pct: 25,
            skyline_height: 50,
            lightning: 40,
            tallest_x: 0,
            tallest_y: 0,
            beacon_on: false,
            last_beacon_sec: 0,
            star_color_idx: 0,
            buildings: Vec::new(),
            rgn_buildings: None,
            active_meteor: None,
            active_lightning: None,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "starry".to_string(),
            filename: "AD.EXE".to_string(),
            name: "Starry Night".to_string(),
            credit: "Starry Night by Bill Stewart & Jim Stewart.\r\n  ©1990 Berkeley Systems Inc."
                .to_string(),
            about: "STARRY NIGHT (tm)\r\n\r\nOriginal concept by Jack Eastman.\r\nLightning designed by Jim Stewart.\r\n\r\nYou can change the number of buildings and height of the skyline to look like any city you like.\r\n\r\nThe number of buildings can be varied from 0 to 100 and the skyline can be varied from 5% to 90% of the monitor's height.\r\n\r\nYou can set the lightning to occur all the time, or never, or somewhere in between. Seeing lightning, stars, & meteor showers at the same time is rare, but strange things CAN happen 'after dark'."
                .to_string(),
            controls: [
                AdControl::NumericSlider {
                    title: "Buildings:".to_string(),
                    default_raw: 32,
                    unit: String::new(),
                    min: 0,
                    max: 100,
                },
                AdControl::NumericSlider {
                    title: "Building Height".to_string(),
                    default_raw: 25,
                    unit: "%".to_string(),
                    min: 5,
                    max: 90,
                },
                AdControl::None,
                AdControl::LabeledSlider {
                    title: "Lightning:".to_string(),
                    default_raw: 51,
                    labels: vec![
                        "Never".into(),
                        "Rarely".into(),
                        "Sometimes".into(),
                        "Often".into(),
                        "Stormy!".into(),
                    ],
                    thresholds: vec![20, 40, 60, 80, 100],
                },
            ],
            // Original AD.EXE ran Starry Night ~30-45 ticks/sec on 1990 386 hardware
            target_frame_ms: 25,
        }
    }

    fn generate_city(&mut self, ctx: &mut AdContext<'_>) {
        let w = ctx.module.rgn_width.max(32);
        let h = ctx.module.rgn_height.max(32);
        let sky_h = self.skyline_height.max(1);

        let mut combined = AdRegion::rect(0, 0, 0, 0);
        self.tallest_x = w;
        self.tallest_y = h;
        self.buildings.clear();
        self.buildings.reserve(self.n_buildings.max(0) as usize);

        let left_range = (w - 20).max(1);
        for _ in 0..self.n_buildings.max(0) {
            let top = h - ctx.rng.rand_mod(sky_h) - 10;
            let bottom = h;
            let left = ctx.rng.rand_mod(left_range);
            let right = left + ctx.rng.rand_mod(10) + 14;

            if top < self.tallest_y {
                self.tallest_y = top;
                self.tallest_x = left + (right - left) / 2;
            }

            let tmp = AdRegion::rect(left, top, right, bottom);
            combined.union_with(&tmp);

            let style = ctx.rng.rand_mod(5);
            self.buildings.push(Building {
                left,
                top,
                right,
                bottom,
                style,
            });
        }

        self.rgn_buildings = Some(combined);
    }

    fn in_buildings(&self, x: i32, y: i32) -> bool {
        self.rgn_buildings
            .as_ref()
            .map(|r| r.contains_point(x, y))
            .unwrap_or(false)
    }

    fn draw_star(&mut self, ctx: &mut AdContext<'_>) {
        let w = ctx.module.rgn_width.max(1);
        let h = ctx.module.rgn_height.max(1);
        let x = ctx.rng.rand_mod(w);
        let y = ctx.rng.rand_mod(h);

        if ctx.system.bits_per_pixel >= 3 {
            self.star_color_idx += 1;
            if self.star_color_idx > 6 {
                self.star_color_idx = 0;
            }
        } else {
            self.star_color_idx = 0;
        }

        let color = match self.star_color_idx {
            0 => rgb(255, 255, 255),
            1 => rgb(255, 255, 0),
            2 => rgb(255, 0, 0),
            3 => rgb(255, 0, 255),
            4 => rgb(0, 0, 255),
            5 => rgb(0, 255, 255),
            _ => rgb(0, 255, 0),
        };

        if !self.in_buildings(x, y) && ctx.rng.rand_mod(h) > y {
            ctx.surface.set_pixel(x, y, color);
        }
    }

    fn erase_stars(&mut self, ctx: &mut AdContext<'_>) {
        let w = ctx.module.rgn_width.max(1);
        let h = ctx.module.rgn_height.max(1);
        let black = rgb(0, 0, 0);
        for _ in 0..9 {
            let x = ctx.rng.rand_mod(w);
            let y = ctx.rng.rand_mod(h);
            ctx.surface.fill_rect_rgb(x, y, x + 2, y + 2, black);
        }
    }

    fn draw_building_lights(&mut self, ctx: &mut AdContext<'_>) {
        let w = ctx.module.rgn_width.max(1);
        let h = ctx.module.rgn_height.max(1);
        let light_range = (self.skyline_height + 10).max(1);
        let yellow = rgb(255, 255, 0);

        for _ in 0..20 {
            let x = ctx.rng.rand_mod(w);
            let y = h - ctx.rng.rand_mod(light_range);

            for b in &self.buildings {
                if b.contains(x, y) {
                    let x_bit = 1u8 << (x & 7);
                    let y_bit = 1u8 << (y & 7);
                    let (x_mask, y_mask): (u8, u8) = match b.style {
                        0 => (0x6C, 0x30),
                        1 => (0xA8, 0x81),
                        2 => (0x81, 0xCC),
                        3 => (0xA8, 0xF0),
                        _ => (0xCC, 0xCC),
                    };
                    if (x_mask & x_bit) != 0 && (y_mask & y_bit) != 0 && x > 8 {
                        ctx.surface.set_pixel(x, y, yellow);
                    }
                    break;
                }
            }
        }
    }

    fn check_beacon_timer(&mut self, ctx: &mut AdContext<'_>) {
        let sec = ctx.elapsed_ms / 1000;
        if sec >= self.last_beacon_sec + 1 {
            self.toggle_beacon(ctx);
            self.last_beacon_sec = sec;
        }
    }

    fn toggle_beacon(&mut self, ctx: &mut AdContext<'_>) {
        let color = if !self.beacon_on {
            if ctx.system.bits_per_pixel >= 3 {
                rgb(255, 0, 0)
            } else {
                rgb(255, 255, 255)
            }
        } else {
            rgb(0, 0, 0)
        };
        ctx.surface.ellipse(
            self.tallest_x - 2,
            self.tallest_y - 5,
            self.tallest_x + 3,
            self.tallest_y,
            None,
            Some(color),
        );
        self.beacon_on = !self.beacon_on;
    }

    fn step_meteor(&mut self, ctx: &mut AdContext<'_>) {
        let w = ctx.module.rgn_width.max(1);
        let h = ctx.module.rgn_height.max(1);
        let black = rgb(0, 0, 0);
        let meteor_color = if ctx.system.bits_per_pixel >= 3 {
            rgb(255, 0, 0)
        } else {
            rgb(255, 255, 255)
        };

        if let Some(mut m) = self.active_meteor.take() {
            // Erase previous bright segment (also carves a 2px black trail through stars, matching 1991 GDI)
            if let Some((x1, y1, x2, y2)) = m.prev_seg {
                ctx.surface.line(x1, y1, x2, y2, 2, black);
            }
            if m.y < h - self.skyline_height - 5 && m.x > 4 && m.x < w {
                let nx = m.x - m.dx;
                let ny = m.y + 8;
                ctx.surface.line(m.x, m.y, nx, ny, 2, meteor_color);
                m.prev_seg = Some((m.x, m.y, nx, ny));
                m.x = nx;
                m.y = ny;
                self.active_meteor = Some(m);
            }
            return;
        }

        // Exact 1991 trigger: 4 in 800 chance per frame
        if ctx.rng.rand_mod(800) >= 4 {
            return;
        }
        let max_y = h - self.skyline_height - 40;
        if max_y <= 1 {
            return;
        }
        let x = ctx.rng.rand_mod(w);
        let y = ctx.rng.rand_mod(max_y);
        let dx = if ctx.rng.rand_mod(100) < 50 { 12 } else { -12 };
        let nx = x - dx;
        let ny = y + 8;
        ctx.surface.line(x, y, nx, ny, 2, meteor_color);
        self.active_meteor = Some(ActiveMeteor {
            x: nx,
            y: ny,
            dx,
            prev_seg: Some((x, y, nx, ny)),
        });
    }

    fn draw_bolt_segments(
        &self,
        ctx: &mut AdContext<'_>,
        bolt: &ActiveLightning,
        erase: bool,
    ) {
        let main_color = if erase {
            rgb(0, 0, 0)
        } else {
            rgb(255, 255, 255)
        };
        let fork_color = if erase {
            rgb(0, 0, 0)
        } else if ctx.system.bits_per_pixel >= 3 {
            rgb(128, 128, 128)
        } else {
            rgb(255, 255, 255)
        };

        // Match original DrawLightningBolt `< lastMainIdx` (omits tip inside building)
        let main_draw_len = bolt.main_segs.len().saturating_sub(1);
        for seg in &bolt.main_segs[..main_draw_len] {
            ctx.surface.line(seg.x1, seg.y1, seg.x2, seg.y2, 1, main_color);
        }
        let fork_draw_len = bolt.fork_segs.len().saturating_sub(1);
        for seg in &bolt.fork_segs[..fork_draw_len] {
            ctx.surface.line(seg.x1, seg.y1, seg.x2, seg.y2, 1, fork_color);
        }
    }

    fn step_lightning(&mut self, ctx: &mut AdContext<'_>) {
        if let Some(mut bolt) = self.active_lightning.take() {
            if bolt.frames_left > 0 {
                bolt.frames_left -= 1;
                self.active_lightning = Some(bolt);
                return;
            }
            match bolt.phase {
                0 => {
                    // End of flash #1 -> erase bolt
                    self.draw_bolt_segments(ctx, &bolt, true);
                    if bolt.double_flash {
                        bolt.phase = 1;
                        bolt.frames_left = 1; // ~25-50ms dark gap
                        self.active_lightning = Some(bolt);
                    }
                }
                1 => {
                    // Start of flash #2
                    self.draw_bolt_segments(ctx, &bolt, false);
                    bolt.phase = 2;
                    bolt.frames_left = 2; // ~50-75ms second flash
                    self.active_lightning = Some(bolt);
                }
                _ => {
                    // End of flash #2 -> erase bolt
                    self.draw_bolt_segments(ctx, &bolt, true);
                }
            }
            return;
        }

        if self.lightning == 0 {
            return;
        }
        if ctx.rng.rand_mod(5000) >= self.lightning {
            return;
        }

        let w = ctx.module.rgn_width.max(40);
        let h = ctx.module.rgn_height.max(40);
        let mut main_segs = Vec::with_capacity(MAX_MAIN_SEGS);
        let mut fork_segs = Vec::with_capacity(MAX_FORK_SEGS);

        let mut main_x = ctx.rng.rand_mod(w);
        let mut main_y = 0;
        let mut main_dir = if ctx.rng.rand_mod(100) < 50 { 0 } else { 1 };

        while !self.in_buildings(main_x, main_y)
            && main_x > 0
            && main_x < w
            && main_segs.len() < MAX_MAIN_SEGS - 1
        {
            let mut step_x = ctx.rng.rand_mod(w) / STEP_DIVISOR;
            let step_y = ctx.rng.rand_mod(h) / STEP_DIVISOR;
            if main_dir != 0 {
                step_x = -step_x;
            }
            let mut next_x = main_x + step_x;
            let next_y = main_y + step_y;
            if next_y > h {
                break;
            }
            if next_x <= 0 || next_x >= w {
                next_x = main_x - step_x;
                main_dir = 1 - main_dir;
            }
            main_segs.push(BoltSeg {
                x1: main_x,
                y1: main_y,
                x2: next_x,
                y2: next_y,
            });
            main_x = next_x;
            main_y = next_y;

            if ctx.rng.rand_mod(100) < 10 && !self.in_buildings(next_x, next_y) {
                let mut fork_x = next_x;
                let mut fork_y = next_y;
                let mut fork_dir = if ctx.rng.rand_mod(100) < 50 { 0 } else { 1 };

                while !self.in_buildings(fork_x, fork_y)
                    && fork_x > 0
                    && fork_x < w
                    && fork_segs.len() < MAX_FORK_SEGS - 1
                {
                    let mut fstep_x = ctx.rng.rand_mod(w) / STEP_DIVISOR;
                    let fstep_y = ctx.rng.rand_mod(h) / STEP_DIVISOR;
                    if fork_dir != 0 {
                        fstep_x = -fstep_x;
                    }
                    let mut fnext_x = fork_x + fstep_x;
                    let fnext_y = fork_y + fstep_y;
                    if fnext_y > h {
                        break;
                    }
                    if fnext_x <= 0 || fnext_x >= w {
                        fnext_x = fork_x - fstep_x;
                        fork_dir = 1 - fork_dir;
                    }
                    fork_segs.push(BoltSeg {
                        x1: fork_x,
                        y1: fork_y,
                        x2: fnext_x,
                        y2: fnext_y,
                    });
                    fork_x = fnext_x;
                    fork_y = fnext_y;

                    if ctx.rng.rand_mod(100) < FORK_STOP_PCT {
                        break;
                    }
                }
            }
        }

        if main_segs.len() < 2 {
            return;
        }

        let double_flash = ctx.rng.rand_mod(100) < 50;
        let bolt = ActiveLightning {
            main_segs,
            fork_segs,
            double_flash,
            phase: 0,
            frames_left: if double_flash { 2 } else { 4 },
        };
        self.draw_bolt_segments(ctx, &bolt, false);
        self.active_lightning = Some(bolt);
    }
}

impl Default for StarryNightModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for StarryNightModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.n_buildings = ctx.module.control_value[0].clamp(0, 100);
        self.height_pct = ctx.module.control_value[1].clamp(5, 90);
        self.lightning = ctx.module.control_value[3].max(0);
        if self.lightning >= 80 {
            self.lightning <<= 1;
        }
        self.star_color_idx = 0;
        self.skyline_height =
            (((ctx.module.rgn_height as i64) * (self.height_pct as i64)) / 100).max(1) as i32;
        self.last_beacon_sec = 0;
        self.active_meteor = None;
        self.active_lightning = None;

        self.generate_city(ctx);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.surface.fill_black();
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.draw_star(ctx);
        self.erase_stars(ctx);
        if self.n_buildings > 0 {
            self.draw_building_lights(ctx);
            self.check_beacon_timer(ctx);
        }
        self.step_meteor(ctx);
        self.step_lightning(ctx);
        AdResult::NoError
    }

    fn do_close(&mut self, _ctx: &mut AdContext<'_>) -> AdResult {
        self.rgn_buildings = None;
        self.buildings.clear();
        self.active_meteor = None;
        self.active_lightning = None;
        AdResult::NoError
    }
}
