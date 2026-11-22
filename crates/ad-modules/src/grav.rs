//! 1:1 Decompilation of `GRAV.AD` ("Gravity") from After Dark 1.0a (1991).
//!
//! Disassembly-backed from `docs/disasm/grav_seg1.asm` and `docs/disasm/grav_data.hex`.

use ad_sdk::canvas::{AdSurface, ROP_SRCAND};
use ad_sdk::palette::rgb;
use ad_sdk::sound::{AdSound, Tone};
use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

const ROP_DSPDXAX: u32 = 0x00E2_0746;

/// 14-color cycling palette (`1:06E3..1:07DD`, jump table `1:07EB`).
const GRAV_COLORS: [u32; 14] = [
    rgb(255, 0, 0),     // Bright Red
    rgb(128, 0, 0),     // Dark Red
    rgb(255, 0, 255),   // Bright Magenta
    rgb(128, 0, 128),   // Dark Magenta
    rgb(0, 0, 255),     // Bright Blue
    rgb(0, 0, 128),     // Dark Blue
    rgb(0, 255, 255),   // Bright Cyan
    rgb(0, 128, 128),   // Dark Cyan
    rgb(0, 255, 0),     // Bright Green
    rgb(0, 128, 0),     // Dark Green
    rgb(255, 255, 0),   // Bright Yellow
    rgb(128, 128, 0),   // Dark Yellow
    rgb(255, 255, 255), // White
    rgb(128, 128, 128), // Gray
];

#[derive(Debug, Clone, Copy, Default)]
struct Ball {
    color: u32,
    x: i32,
    y: i32,
    y_floor: i32,
    dx: i32,
    vel_y: i32, // fixed-point 1/100 px/frame
    draw_toggle: bool,
    rolling: bool,
}

pub struct GravityModule {
    num_balls: usize,
    ball_size: i32,
    radius_x: i32,
    radius_y: i32,
    color_index: usize,
    balls: [Ball; 10],
    ball_sheet: Option<AdSurface>,
}

impl GravityModule {
    pub fn new() -> Self {
        Self {
            num_balls: 3,
            ball_size: 25,
            radius_x: 12,
            radius_y: 12,
            color_index: 0,
            balls: [Ball::default(); 10],
            ball_sheet: None,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "grav".to_string(),
            filename: "GRAV.AD".to_string(),
            name: "Gravity".to_string(),
            credit: "Gravity by Bill Stewart & Tracy Elmore.\n©1990 Berkeley Systems Inc."
                .to_string(),
            about: "GRAVITY (tm) demonstrates Newtonian gravity with bouncing balls.\n\nOriginal idea by Bryce Fowler.\n\nChoose 1-7 balls with the \"Number Balls\" slider.\n\nUse the \"Size\" slider to set the size of the balls.\n\nCheck \"Clear Screen\" to clear the screen between each set of balls.\n\nCheck \"Sound\" to hear the balls bounce.".to_string(),
            controls: [
                AdControl::NumericSlider {
                    title: "Number Balls:".to_string(),
                    default_raw: 41,
                    unit: String::new(),
                    min: 1,
                    max: 7,
                },
                AdControl::NumericSlider {
                    title: "Size:".to_string(),
                    default_raw: 74,
                    unit: String::new(),
                    min: 10,
                    max: 30,
                },
                AdControl::Checkbox {
                    title: "Clear Screen".to_string(),
                    default_checked: true,
                },
                AdControl::Checkbox {
                    title: "Sound".to_string(),
                    default_checked: false,
                },
            ],
            target_frame_ms: 25,
        }
    }

    fn create_ball_sheet(&mut self) {
        let s = self.ball_size.max(4);
        let Some(mut sheet) = AdSurface::new(s * 3, s) else {
            self.ball_sheet = None;
            return;
        };
        let black = rgb(0, 0, 0);
        let white = rgb(255, 255, 255);

        // Panel 0 [0..S, 0..S]: black bg, white borderless filled circle (DSPDxax color mask)
        sheet.pat_blt_black(0, 0, s, s);
        sheet.ellipse(0, 0, s, s, None, Some(white));

        // Panels 1 & 2 [S..3S, 0..S]: white bg
        sheet.pat_blt_rgb(s, 0, s * 2, s, white);

        // Panel 1 [S..2S, 0..S]: 1px black circle outline on white (SRCAND outline mask)
        sheet.ellipse(s, 0, s * 2, s, Some(black), Some(white));

        // Panel 2 [2S..3S, 0..S]: solid black circle on white (matches original)
        sheet.ellipse(s * 2, 0, s * 3, s, Some(black), Some(black));

        self.ball_sheet = Some(sheet);
    }

    fn init_ball(&mut self, i: usize, ctx: &mut AdContext<'_>) {
        self.color_index += 1;
        if self.color_index >= GRAV_COLORS.len() {
            self.color_index = 0;
        }
        let w = ctx.module.rgn_width.max(4);
        let h = ctx.module.rgn_height.max(4);

        let x = if ctx.rng.rand() % 2 == 0 {
            ctx.rng.rand_mod((w / 2).max(1)) - 20
        } else {
            ctx.rng.rand_mod(w) + w + 20
        };
        let y = -(ctx.rng.rand() % 77);
        let dx = ctx.rng.rand_mod(6) + 1;

        self.balls[i] = Ball {
            color: GRAV_COLORS[self.color_index],
            x,
            y,
            y_floor: h - 3,
            dx,
            vel_y: 100,
            draw_toggle: true,
            rolling: false,
        };
    }

    fn play_bounce_sound(ctx: &AdContext<'_>) {
        if ctx.module.control_value[3] == 0 || !ctx.system.sound_enabled {
            return;
        }
        // Win16 SOUND.DRV: SetVoiceNote(1, 40, 100, 10) -> D#4 (311.13 Hz), ~35ms tone
        ctx.sound.play_tones(vec![Tone {
            freq_hz: AdSound::win16_note_to_hz(40),
            duration_ms: 35,
            volume: 0.25,
        }]);
    }
}

impl Default for GravityModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for GravityModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.num_balls = (ctx.module.control_value[0] as usize).clamp(1, 7);
        self.ball_size = ctx.module.control_value[1].clamp(10, 30);
        self.radius_y = self.ball_size / 2;
        let ax = ctx.system.aspect_x.max(1) as u32;
        let ay = ctx.system.aspect_y.max(1) as u32;
        self.radius_x = ((self.radius_y as u32 * ay) / ax).max(1) as i32;

        self.color_index = ctx.rng.rand_mod(13) as usize;
        for i in 0..self.num_balls {
            self.init_ball(i, ctx);
        }
        self.create_ball_sheet();
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        if ctx.module.control_value[2] != 0 {
            ctx.surface.fill_black();
        }
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // Live-update ball size if changed
        let target_size = ctx.module.control_value[1].clamp(10, 30);
        if target_size != self.ball_size {
            self.ball_size = target_size;
            self.radius_y = self.ball_size / 2;
            let ax = ctx.system.aspect_x.max(1) as u32;
            let ay = ctx.system.aspect_y.max(1) as u32;
            self.radius_x = ((self.radius_y as u32 * ay) / ax).max(1) as i32;
            self.create_ball_sheet();
        }

        let w = ctx.module.rgn_width.max(4);
        let h = ctx.module.rgn_height.max(4);
        let clear_screen = ctx.module.control_value[2] != 0;

        let mut hit_floor = false;
        let mut hit_right = false;
        let mut hit_left = false;
        let mut reset_all = false;

        let mut i = 0;
        while i < self.num_balls {
            let b = &mut self.balls[i];
            b.x += b.dx;
            let dy = b.vel_y / 100;
            b.y += dy;

            if b.x > w - self.radius_x {
                b.x = w - self.radius_x;
                b.dx = -b.dx;
                hit_right = true;
            }
            if b.x < self.radius_x {
                b.x = self.radius_x;
                b.dx = -b.dx;
                hit_left = true;
            }

            if b.y >= b.y_floor - 1 {
                hit_floor = true;
                if b.vel_y < 100 {
                    b.y_floor += 1;
                    b.dx = b.dx.wrapping_shl(1).clamp(-w, w);
                }
                b.y = b.y_floor;
                b.vel_y = -b.vel_y;
            }

            if b.rolling {
                hit_floor = false;
            }

            // Multiplicative gravity scaling (27/30 decelerate up, 30/27 accelerate down)
            if b.vel_y >= -100 && b.vel_y < 0 {
                b.vel_y = 100;
                if b.y >= b.y_floor - 20 {
                    b.rolling = true;
                }
            } else if b.vel_y < 0 {
                b.vel_y = (b.vel_y * 27) / 30;
            } else {
                b.vel_y = (b.vel_y * 30) / 27;
            }

            // Draw ball leaving 3D trail of outlined colored circles
            if b.draw_toggle || b.y >= b.y_floor - 2 {
                if let Some(ref sheet) = self.ball_sheet {
                    let dx = b.x - self.radius_x;
                    let dy = b.y - self.radius_y;
                    let s = self.ball_size;
                    ctx.surface
                        .bit_blt_surface_with_brush(dx, dy, s, s, sheet, 0, 0, b.color, ROP_DSPDXAX);
                    ctx.surface
                        .bit_blt_surface(dx, dy, s, s, sheet, s, 0, ROP_SRCAND);
                }
            }
            b.draw_toggle = !b.draw_toggle;

            let finished =
                b.y > h + self.radius_y || (b.rolling && (hit_left || hit_right));
            if finished {
                if clear_screen && i == self.num_balls - 1 {
                    reset_all = true;
                    break;
                } else if !clear_screen {
                    self.init_ball(i, ctx);
                }
            }
            i += 1;
        }

        if reset_all {
            ctx.surface.fill_black();
            for j in 0..self.num_balls {
                self.init_ball(j, ctx);
            }
        }

        if hit_left || hit_right || hit_floor {
            Self::play_bounce_sound(ctx);
        }

        AdResult::NoError
    }

    fn do_close(&mut self, _ctx: &mut AdContext<'_>) -> AdResult {
        self.ball_sheet = None;
        AdResult::NoError
    }
}
