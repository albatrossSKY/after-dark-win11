//! 1:1 Decompilation of `PUNCH.AD` ("Punch Out") from After Dark 1.0a (1991).
//!
//! Disassembly-backed from `docs/disasm/punch_seg1.asm` and `docs/disasm/punch_data.hex`.

use ad_sdk::canvas::{AdRegion, AdSurface, ROP_SRCCOPY, ROP_SRCPAINT};
use ad_sdk::palette::rgb;
use ad_sdk::sound::{AdSound, Tone};
use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

const MARGIN: i32 = 10;

pub struct PunchOutModule {
    speed: i32,
    shape_choice: i32,
    is_round: bool,
    stretch_mode: i32,
    width: i32,
    height: i32,
    work_w: i32,
    work_h: i32,
    pos_x: i32,
    pos_y: i32,
    dir_x: i32,
    dir_y: i32,

    screen_buf: Option<AdSurface>,
    piece_buf: Option<AdSurface>,
    work_buf: Option<AdSurface>,
    rect_rgn: Option<AdRegion>,
    ellipse_rgn: Option<AdRegion>,
}

impl PunchOutModule {
    pub fn new() -> Self {
        Self {
            speed: 9,
            shape_choice: 0,
            is_round: true,
            stretch_mode: 0,
            width: 64,
            height: 64,
            work_w: 84,
            work_h: 84,
            pos_x: 10,
            pos_y: 10,
            dir_x: 0,
            dir_y: 1,
            screen_buf: None,
            piece_buf: None,
            work_buf: None,
            rect_rgn: None,
            ellipse_rgn: None,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "punch".to_string(),
            filename: "PUNCH.AD".to_string(),
            name: "Punch Out".to_string(),
            credit: "Punch Out by Bill Stewart.\r\n  \u{00a9}1990 Berkeley Systems Inc..".to_string(),
            about: concat!(
                "PUNCH OUT (tm) punches shapes out of your Windows desktop and slides them off screen.\r\n\r\n",
                "Select a shape, size, speed, and optional sound effect."
            )
            .to_string(),
            controls: [
                AdControl::Menu {
                    title: "Shape:".to_string(),
                    default_index: 0,
                    choices: vec![
                        "Circle".to_string(),
                        "Oval".to_string(),
                        "Square".to_string(),
                        "Rectangle".to_string(),
                        "Random".to_string(),
                    ],
                },
                AdControl::NumericSlider {
                    title: "Size:".to_string(),
                    default_raw: 50,
                    unit: String::new(),
                    min: 10,
                    max: 120,
                },
                AdControl::NumericSlider {
                    title: "Speed:".to_string(),
                    default_raw: 100,
                    unit: String::new(),
                    min: 1,
                    max: 9,
                },
                AdControl::Checkbox {
                    title: "Sound".to_string(),
                    default_checked: false,
                },
            ],
            target_frame_ms: 20,
        }
    }

    fn choose_shape(&mut self, ctx: &mut AdContext<'_>) {
        // 1:05BB..1:063D
        match self.shape_choice {
            0 => {
                self.is_round = true;
                self.stretch_mode = 0;
            }
            1 => {
                self.is_round = true;
                self.stretch_mode = if (ctx.rng.rand() % 2) == 1 { 1 } else { 2 };
            }
            2 => {
                self.is_round = false;
                self.stretch_mode = 0;
            }
            3 => {
                self.is_round = false;
                self.stretch_mode = if (ctx.rng.rand() % 2) == 1 { 1 } else { 2 };
            }
            _ => {
                self.is_round = (ctx.rng.rand() % 2) != 0;
                self.stretch_mode = ctx.rng.rand() % 3;
            }
        }
    }

    fn play_punch_sound(ctx: &AdContext<'_>) {
        // 1:0542..1:05BA: notes 7, 9, 11, ..., 29 (12 notes, ~5ms each)
        if ctx.system.sound_enabled && ctx.module.control_value[3] != 0 {
            let tones: Vec<Tone> = (7..30)
                .step_by(2)
                .map(|note| Tone {
                    freq_hz: AdSound::win16_note_to_hz(note),
                    duration_ms: 5,
                    volume: 0.14,
                })
                .collect();
            ctx.sound.play_tones(tones);
        }
    }

    fn init_punch(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:0012..1:02FE
        let rgn_w = ctx.module.rgn_width.max(1);
        let rgn_h = ctx.module.rgn_height.max(1);

        self.height = ctx.module.control_value[1].clamp(10, 120);
        self.speed = ctx.module.control_value[2].clamp(1, 9);
        self.shape_choice = ctx.module.control_value[0];

        let aspect_x = (ctx.system.aspect_x.max(1)) as u32;
        let aspect_y = (ctx.system.aspect_y.max(1)) as u32;
        self.width = (((self.height as u32) * aspect_y) / aspect_x).max(1) as i32;

        self.choose_shape(ctx);
        if self.stretch_mode == 1 {
            self.height = (self.height * 5) / 3;
        } else if self.stretch_mode == 2 {
            self.width = (self.width * 5) / 3;
        }

        self.work_h = self.height + MARGIN * 2;
        self.work_w = self.width + MARGIN * 2;

        let span_x = (rgn_w - self.width + MARGIN).max(1);
        let span_y = (rgn_h - self.height + MARGIN).max(1);
        self.pos_x = (ctx.rng.rand() % span_x) + 5;
        self.pos_y = (ctx.rng.rand() % span_y) + 5;

        self.dir_x = (ctx.rng.rand() % 3) - 1;
        self.dir_y = (ctx.rng.rand() % 3) - 1;
        if self.dir_x == 0 && self.dir_y == 0 {
            self.dir_y = 1;
        }

        // Capture current screen into screen_buf at offset (+10, +10)
        let Some(mut scr) = AdSurface::new(rgn_w + MARGIN * 2, rgn_h + MARGIN * 2) else {
            return AdResult::MemError;
        };
        scr.bit_blt_surface(MARGIN, MARGIN, rgn_w, rgn_h, ctx.surface, 0, 0, ROP_SRCCOPY);

        let Some(mut piece) = AdSurface::new(self.width, self.height) else {
            return AdResult::MemError;
        };
        let Some(work) = AdSurface::new(self.work_w, self.work_h) else {
            return AdResult::MemError;
        };

        let rect_rgn = AdRegion::rect(0, 0, self.work_w, self.work_h);
        let ellipse_rgn = AdRegion::elliptic(
            MARGIN,
            MARGIN,
            MARGIN + self.width,
            MARGIN + self.height,
        );

        Self::play_punch_sound(ctx);

        // Copy punched piece out of screen_buf
        piece.bit_blt_surface(
            0,
            0,
            self.width,
            self.height,
            &scr,
            self.pos_x,
            self.pos_y,
            ROP_SRCCOPY,
        );

        // Punch solid BLACK hole into screen_buf
        if self.is_round {
            scr.ellipse(
                self.pos_x,
                self.pos_y,
                self.pos_x + self.width,
                self.pos_y + self.height,
                Some(rgb(0, 0, 0)),
                Some(rgb(0, 0, 0)),
            );
        } else {
            scr.rectangle(
                self.pos_x,
                self.pos_y,
                self.pos_x + self.width,
                self.pos_y + self.height,
                Some(rgb(0, 0, 0)),
                Some(rgb(0, 0, 0)),
            );
        }

        self.screen_buf = Some(scr);
        self.piece_buf = Some(piece);
        self.work_buf = Some(work);
        self.rect_rgn = Some(rect_rgn);
        self.ellipse_rgn = Some(ellipse_rgn);

        AdResult::NoError
    }
}

impl Default for PunchOutModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for PunchOutModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.init_punch(ctx)
    }

    fn do_blank(&mut self, _ctx: &mut AdContext<'_>) -> AdResult {
        // 1:02FF..1:0312: intentionally leaves live desktop unblanked!
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:0313..1:0441
        let (Some(scr), Some(piece), Some(work), Some(rect_rgn), Some(ellipse_rgn)) = (
            self.screen_buf.as_ref(),
            self.piece_buf.as_ref(),
            self.work_buf.as_mut(),
            self.rect_rgn.as_ref(),
            self.ellipse_rgn.as_ref(),
        ) else {
            return AdResult::NoError;
        };

        // 1. Copy background (with black hole) around piece into work buffer
        work.set_clip_region(Some(rect_rgn));
        work.bit_blt_surface(
            0,
            0,
            self.work_w,
            self.work_h,
            scr,
            self.pos_x - MARGIN,
            self.pos_y - MARGIN,
            ROP_SRCCOPY,
        );

        // 2. Composite sliding piece using SRCPAINT (bitwise OR) clipped to ellipse if round
        if self.is_round {
            work.set_clip_region(Some(ellipse_rgn));
        }
        work.bit_blt_surface(
            MARGIN,
            MARGIN,
            self.width,
            self.height,
            piece,
            0,
            0,
            ROP_SRCPAINT,
        );
        work.set_clip_region(None);

        // 3. Blit composited work buffer back to screen at (pos_x - 20, pos_y - 20)
        ctx.surface.bit_blt_surface(
            self.pos_x - MARGIN * 2,
            self.pos_y - MARGIN * 2,
            self.work_w,
            self.work_h,
            work,
            0,
            0,
            ROP_SRCCOPY,
        );

        // 4. Advance piece & check offscreen
        let mut offscreen = false;
        self.pos_x += self.speed * self.dir_x;
        if self.pos_x > ctx.module.rgn_width + MARGIN * 2 || self.pos_x < -self.work_w {
            offscreen = true;
        }
        self.pos_y += self.speed * self.dir_y;
        if self.pos_y > ctx.module.rgn_height + MARGIN * 2 || self.pos_y < -self.work_h {
            offscreen = true;
        }

        if offscreen {
            self.init_punch(ctx);
        }

        AdResult::NoError
    }

    fn do_close(&mut self, _ctx: &mut AdContext<'_>) -> AdResult {
        self.screen_buf = None;
        self.piece_buf = None;
        self.work_buf = None;
        self.rect_rgn = None;
        self.ellipse_rgn = None;
        AdResult::NoError
    }
}
