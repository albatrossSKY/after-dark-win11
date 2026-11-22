//! 1:1 Decompilation of `WARP.AD` ("Warp!") from After Dark 1.0a (1991).
//!
//! Disassembly-backed from `docs/disasm/warp_seg1.asm` and `docs/disasm/warp_data.hex`.

use ad_sdk::palette::rgb;
use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

const MAX_STARS: usize = 200;

#[derive(Debug, Clone, Copy, Default)]
struct Star {
    y: i32,
    x: i32,
    z: i32,
    size: i32,
    sy: i32,
    sx: i32,
    color: u32,
}

pub struct WarpModule {
    cx: i32,
    cy: i32,
    // Centered bounds (-cx, -cy, w - cx, h - cy)
    rect_left: i32,
    rect_top: i32,
    rect_right: i32,
    rect_bottom: i32,
    // Centered black-hole rect (-w/40, -h/40, w/40, h/40)
    hole_left: i32,
    hole_top: i32,
    hole_right: i32,
    hole_bottom: i32,
    spawn_inner_x: i32,
    spawn_inner_y: i32,

    num_stars: usize,
    size_mode: i32, // 1=Small, 2=Big, 3=Both
    speed: i32,
    do_erase: bool,
    do_draw: bool,
    palette_50: [u32; 50],
    stars: [Star; MAX_STARS],
}

impl WarpModule {
    pub fn new() -> Self {
        Self {
            cx: 0,
            cy: 0,
            rect_left: 0,
            rect_top: 0,
            rect_right: 0,
            rect_bottom: 0,
            hole_left: 0,
            hole_top: 0,
            hole_right: 0,
            hole_bottom: 0,
            spawn_inner_x: 1,
            spawn_inner_y: 1,
            num_stars: 142,
            size_mode: 1,
            speed: -100,
            do_erase: true,
            do_draw: true,
            palette_50: [0x00FF_FFFF; 50],
            stars: [Star::default(); MAX_STARS],
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "warp".to_string(),
            filename: "WARP.AD".to_string(),
            name: "Warp!".to_string(),
            credit: "Warp! by Bruce Burkhalter & Tracy Elmore.\r\n  \u{00a9}1990 Berkeley Systems Inc."
                .to_string(),
            about: concat!(
                "WARP! (tm)\r\n\r\n",
                "\"Speed\" controls the speed and direction of travel through the stars.\r\n\r\n",
                "\"Size\" controls the size of the stars.\r\n\r\n",
                "\"Number of Stars\" controls the number of stars displayed.\r\n\r\n",
                "\"Color\" allows color stars for those with color monitors.\r\n\r\n\r\n",
                "Rotational stellar effects and black hole designed by Bill Stewart and Jack Eastman.\r\n"
            )
            .to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "Speed:".to_string(),
                    default_raw: 0,
                    labels: vec![
                        "Fast In".to_string(),
                        "Medium In".to_string(),
                        "Slow In".to_string(),
                        "Impulse In".to_string(),
                        "Impulse Out".to_string(),
                        "Slow Out".to_string(),
                        "Medium Out".to_string(),
                        "Fast Out".to_string(),
                    ],
                    thresholds: vec![12, 25, 38, 45, 55, 75, 88, 100],
                },
                AdControl::NumericSlider {
                    title: "Stars:".to_string(),
                    default_raw: 71,
                    unit: String::new(),
                    min: 1,
                    max: 200,
                },
                AdControl::Menu {
                    title: "Size:".to_string(),
                    default_index: 0,
                    choices: vec!["Small".to_string(), "Big".to_string(), "Both".to_string()],
                },
                AdControl::Checkbox {
                    title: "Color".to_string(),
                    default_checked: false,
                },
            ],
            target_frame_ms: 33,
        }
    }

    fn map_speed(val: i32) -> i32 {
        // 1:019E..1:020A & 1:0779..1:07E5
        match val {
            0 => -100,
            12 => -60,
            25 => -30,
            38 => -5,
            45 => 5,
            55 => 30,
            75 => 60,
            88 | 100 => 100,
            _ => {
                if val < 12 {
                    -100
                } else if val < 25 {
                    -60
                } else if val < 38 {
                    -30
                } else if val < 45 {
                    -5
                } else if val < 55 {
                    5
                } else if val < 75 {
                    30
                } else if val < 88 {
                    60
                } else {
                    100
                }
            }
        }
    }

    fn signed_rand(ctx: &mut AdContext<'_>) -> i32 {
        // 1:0927..1:0959
        if (ctx.rng.rand() % 2) != 0 {
            ctx.rng.rand()
        } else {
            -ctx.rng.rand()
        }
    }

    fn pick_color_and_size(&self, ctx: &mut AdContext<'_>, use_and_mask: bool) -> (u32, i32) {
        let color = if ctx.module.control_value[3] != 0 {
            self.palette_50[(ctx.rng.rand() % 50) as usize]
        } else {
            rgb(255, 255, 255)
        };
        let size = if self.size_mode == 3 {
            if use_and_mask {
                (ctx.rng.rand() & 1) + 1
            } else {
                (ctx.rng.rand() % 2) + 1
            }
        } else {
            self.size_mode
        };
        (color, size)
    }

    fn spawn_initial(&self, ctx: &mut AdContext<'_>) -> Star {
        // 1:0217..1:02C5
        let x = Self::signed_rand(ctx) % self.cx.max(1);
        let y = Self::signed_rand(ctx) % self.cy.max(1);
        let (color, size) = self.pick_color_and_size(ctx, true);
        Star {
            x,
            y,
            z: 200,
            size,
            sx: x + self.cx,
            sy: y + self.cy,
            color,
        }
    }

    fn spawn_edge(&self, ctx: &mut AdContext<'_>) -> Star {
        // 1:02C6..1:03CA
        let side = ctx.rng.rand() % 4;
        let (x, y) = match side {
            0 => (-self.cx, Self::signed_rand(ctx) % self.cy.max(1)),
            1 => (self.cx, Self::signed_rand(ctx) % self.cy.max(1)),
            2 => (Self::signed_rand(ctx) % self.cx.max(1), -self.cy),
            _ => (Self::signed_rand(ctx) % self.cx.max(1), self.cy),
        };
        let (color, size) = self.pick_color_and_size(ctx, true);
        Star {
            x,
            y,
            z: 200,
            size,
            sx: x + self.cx,
            sy: y + self.cy,
            color,
        }
    }

    fn spawn_center(&self, ctx: &mut AdContext<'_>) -> Star {
        // 1:03CB..1:0480
        let sx_div = if self.spawn_inner_x == 0 {
            1
        } else {
            self.spawn_inner_x
        };
        let sy_div = if self.spawn_inner_y == 0 {
            1
        } else {
            self.spawn_inner_y
        };
        let x = Self::signed_rand(ctx) % sx_div;
        let y = Self::signed_rand(ctx) % sy_div;
        let (color, size) = self.pick_color_and_size(ctx, false);
        Star {
            x,
            y,
            z: 200,
            size,
            sx: x + self.cx,
            sy: y + self.cy,
            color,
        }
    }

    fn step_frame(&mut self, ctx: &mut AdContext<'_>) {
        // 1:0481..1:06EB (with HD/4K dot-size scaling so stars remain crisp on 1080p/4K displays)
        let dz = self.speed >> 3;
        let ps = (ctx.module.rgn_height / 480).clamp(1, 4);
        for i in 0..self.num_stars {
            if self.do_erase {
                let st = self.stars[i];
                let dsz = st.size * ps;
                if dsz <= 1 {
                    ctx.surface.set_pixel(st.sx, st.sy, 0);
                } else {
                    ctx.surface.pat_blt_black(st.sx, st.sy, dsz, dsz);
                }
            }

            self.stars[i].z -= dz;
            if self.stars[i].z <= 0 {
                self.stars[i] = self.spawn_center(ctx);
                continue;
            }

            let x0 = self.stars[i].x;
            let y0 = self.stars[i].y;
            if self.speed < 0 {
                self.stars[i].x -= y0 >> 5;
                self.stars[i].y += x0 >> 5;
            } else {
                self.stars[i].x += y0 >> 5;
                self.stars[i].y -= x0 >> 5;
            }

            let z = self.stars[i].z;
            let px = (x0 * 200) / z;
            let py = (y0 * 200) / z;
            self.stars[i].sx = px + self.cx;
            self.stars[i].sy = py + self.cy;

            // Win16 PtInRect: left <= x < right && top <= y < bottom
            let in_hole = self.speed < 0
                && px >= self.hole_left
                && px < self.hole_right
                && py >= self.hole_top
                && py < self.hole_bottom;

            let out_of_bounds = py >= self.rect_bottom
                || py <= self.rect_top
                || px <= self.rect_left
                || px >= self.rect_right
                || in_hole;

            if out_of_bounds {
                if self.speed < 0 {
                    self.stars[i] = self.spawn_edge(ctx);
                } else {
                    self.stars[i] = self.spawn_center(ctx);
                }
                continue;
            }

            if self.do_draw {
                let st = self.stars[i];
                let dsz = st.size * ps;
                if dsz <= 1 {
                    ctx.surface.set_pixel(st.sx, st.sy, st.color);
                } else {
                    ctx.surface.pat_blt_rgb(st.sx, st.sy, dsz, dsz, st.color);
                }
            }
        }
    }
}

impl Default for WarpModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for WarpModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:0012..1:0216
        let w = ctx.module.rgn_width.max(2);
        let h = ctx.module.rgn_height.max(2);
        self.do_erase = true;
        self.do_draw = true;

        self.cx = w / 2;
        self.cy = h / 2;
        self.rect_left = -self.cx;
        self.rect_top = -self.cy;
        self.rect_right = w - self.cx;
        self.rect_bottom = h - self.cy;

        let hx = w / 40;
        let hy = h / 40;
        self.hole_left = -hx;
        self.hole_top = -hy;
        self.hole_right = hx;
        self.hole_bottom = hy;

        self.spawn_inner_x = self.rect_left / 3;
        self.spawn_inner_y = self.rect_top / 3;

        // 1:0092..1:0117: 50-entry color palette
        for i in 0..50 {
            self.palette_50[i] = if i < 8 {
                rgb(255, 255, 255)
            } else if i < 15 {
                rgb(255, 0, 0)
            } else if i < 22 {
                rgb(0, 255, 0)
            } else if i < 29 {
                rgb(0, 0, 255)
            } else if i < 36 {
                rgb(0, 255, 255)
            } else if i < 43 {
                rgb(255, 0, 255)
            } else if i < 49 {
                rgb(255, 255, 0)
            } else {
                rgb(255, 0, 255)
            };
        }

        self.num_stars = (ctx.module.control_value[1].clamp(1, MAX_STARS as i32)) as usize;
        self.size_mode = (ctx.module.control_value[2] + 1).clamp(1, 3);
        self.speed = Self::map_speed(ctx.module.control_value[0]);

        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:06EC..1:07EF
        ctx.surface.fill_black();
        for i in 0..self.num_stars {
            self.stars[i] = self.spawn_initial(ctx);
        }
        // Pre-warm starfield with 30 invisible steps at speed=400
        self.speed = 400;
        self.do_draw = false;
        self.do_erase = false;
        for _ in 0..30 {
            self.step_frame(ctx);
        }
        self.do_erase = true;
        self.do_draw = true;
        self.speed = Self::map_speed(ctx.module.control_value[0]);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // Keep speed synced if adjusted live in Demo mode
        self.speed = Self::map_speed(ctx.module.control_value[0]);
        self.step_frame(ctx);
        AdResult::NoError
    }

    fn do_button_message(&mut self, control_index: usize) -> AdResult {
        // 1:0871..1:0926
        match control_index {
            1 | 2 => AdResult::RestartMe,
            _ => AdResult::NoError,
        }
    }
}
