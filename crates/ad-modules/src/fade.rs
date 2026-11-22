//! 1:1 Decompilation of `FADE.AD` ("Fade Away") from After Dark 1.0a (1991).
//!
//! Disassembly-backed from `docs/disasm/fade_seg1.asm` and `docs/disasm/fade_data.hex`.

use ad_sdk::palette::rgb;
use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

pub struct FadeAwayModule {
    done: bool,
    square_finish: bool,
    mesh_offset: i32,
    mesh_pass: i32,
    radar_step: i32,
    radar_x: i32,
    radar_y: i32,
    radar_side: i32,
    style: i32,
    size: i32,
    max_dim: i32,
    blind_step: i32,
    blind_subtick: i32,
}

impl FadeAwayModule {
    pub fn new() -> Self {
        Self {
            done: false,
            square_finish: false,
            mesh_offset: 0,
            mesh_pass: 0,
            radar_step: 2,
            radar_x: 0,
            radar_y: 0,
            radar_side: 0,
            style: 4,
            size: 0,
            max_dim: 0,
            blind_step: 0,
            blind_subtick: 0,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "fade".to_string(),
            filename: "FADE.AD".to_string(),
            name: "Fade Away".to_string(),
            credit: "Fade Away by Bill Stewart & Ian MacDonald.\r\n  \u{00a9}1990 Berkeley Systems Inc."
                .to_string(),
            about: concat!(
                "FADE AWAY (tm) makes your screen completely black in a number of interesting ways.\r\n\r\n",
                "Select a method to fade away from the \"Style\" drop-down list box. "
            )
            .to_string(),
            controls: [
                AdControl::Menu {
                    title: "Style:".to_string(),
                    default_index: 4,
                    choices: vec![
                        "Plain".to_string(),
                        "Squares".to_string(),
                        "Slow Zoom".to_string(),
                        "Blinds".to_string(),
                        "Radar".to_string(),
                        "Mesh".to_string(),
                        "Dissolve".to_string(),
                    ],
                },
                AdControl::None,
                AdControl::None,
                AdControl::None,
            ],
            target_frame_ms: 16,
        }
    }

    fn start_square_finish(&mut self) {
        self.size = self.max_dim;
        self.square_finish = true;
    }

    fn draw_plain(&mut self, ctx: &mut AdContext<'_>) {
        // 1:015E..1:01A9
        ctx.surface.fill_black();
        self.done = true;
    }

    fn draw_squares(&mut self, ctx: &mut AdContext<'_>) {
        // 1:0370..1:0402
        let half = self.size / 2;
        let cx = ctx.module.rgn_width / 2;
        let cy = ctx.module.rgn_height / 2;
        ctx.surface
            .rectangle(cx - half, cy - half, cx + half, cy + half, Some(rgb(0, 0, 0)), None);
        self.size -= 1;
        if self.size <= 0 {
            self.done = true;
        }
    }

    fn draw_slow_zoom(&mut self, ctx: &mut AdContext<'_>) {
        // 1:0403..1:0493
        let half = self.size / 2;
        let cx = ctx.module.rgn_width / 2;
        let cy = ctx.module.rgn_height / 2;
        ctx.surface
            .ellipse(cx - half, cy - half, cx + half, cy + half, Some(rgb(0, 0, 0)), None);
        self.size -= 1;
        if self.size <= 0 {
            self.start_square_finish();
        }
    }

    fn draw_blinds(&mut self, ctx: &mut AdContext<'_>) {
        // 1:01AA..1:0261
        let w = ctx.module.rgn_width;
        let h = ctx.module.rgn_height;
        let slat_h = (h / 20).max(1);
        let mut y = self.blind_step;
        let count = slat_h.max(20);
        for _ in 0..=count {
            if y < h {
                ctx.surface.line(0, y, w, y, 1, rgb(0, 0, 0));
            }
            y += slat_h;
        }
        self.blind_step += 1;
        if self.blind_step >= slat_h {
            self.done = true;
        }
    }

    fn draw_radar(&mut self, ctx: &mut AdContext<'_>) {
        // 1:0262..1:036F
        let w = ctx.module.rgn_width;
        let h = ctx.module.rgn_height;
        ctx.surface
            .line(w / 2, h / 2, self.radar_x, self.radar_y, 1, rgb(0, 0, 0));

        match self.radar_side {
            0 => {
                self.radar_x += self.radar_step;
                if self.radar_x > w {
                    self.radar_side = 1;
                }
            }
            1 => {
                self.radar_y += self.radar_step;
                if self.radar_y > h {
                    self.radar_side = 2;
                }
            }
            2 => {
                self.radar_x -= self.radar_step;
                if self.radar_x < 0 {
                    self.radar_side = 3;
                }
            }
            3 => {
                self.radar_y -= self.radar_step;
                if self.radar_y < 0 {
                    self.radar_side = 4;
                }
            }
            _ => {
                self.radar_x += self.radar_step;
                if self.radar_x > w / 2 {
                    self.radar_side = 0;
                    if self.radar_step == 1 {
                        self.done = true;
                        self.draw_plain(ctx);
                    } else {
                        self.radar_step = 1;
                    }
                }
            }
        }
    }

    fn draw_mesh(&mut self, ctx: &mut AdContext<'_>) {
        // 1:0494..1:063C
        if self.done {
            return;
        }
        let w = ctx.module.rgn_width;
        let h = ctx.module.rgn_height;
        let cx = w / 2;
        let cy = h / 2;

        let color = match self.mesh_pass {
            0 => rgb(192, 192, 192),
            1 => rgb(128, 128, 128),
            _ => rgb(0, 0, 0),
        };

        let off = self.mesh_offset;
        ctx.surface.line(0, cy - off, w, cy - off, 1, color);
        ctx.surface.line(0, cy + off, w, cy + off, 1, color);
        ctx.surface.line(cx - off, 0, cx - off, h, 1, color);
        ctx.surface.line(cx + off, 0, cx + off, h, 1, color);

        self.mesh_offset -= 2;
        if self.mesh_offset < 0 {
            self.mesh_offset = w / 2;
            self.mesh_pass += 1;
            if self.mesh_pass > 2 {
                self.start_square_finish();
            }
        }
    }

    fn draw_dissolve(&mut self, ctx: &mut AdContext<'_>) {
        // 1:063D..1:0682
        let w = ctx.module.rgn_width.max(1);
        let h = ctx.module.rgn_height.max(1);
        let x = ctx.rng.rand() % w;
        let y = ctx.rng.rand() % h;
        ctx.surface.pat_blt_black(x, y, 2, 2);
    }

    fn step_once(&mut self, ctx: &mut AdContext<'_>) {
        if self.done {
            return;
        }
        if self.square_finish {
            self.draw_squares(ctx);
            return;
        }
        match self.style {
            0 => self.draw_plain(ctx),
            1 => self.draw_squares(ctx),
            2 => self.draw_slow_zoom(ctx),
            3 => self.draw_blinds(ctx),
            4 => self.draw_radar(ctx),
            5 => self.draw_mesh(ctx),
            6 => self.draw_dissolve(ctx),
            _ => {}
        }
    }
}

impl Default for FadeAwayModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for FadeAwayModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:0012..1:008B
        let w = ctx.module.rgn_width.max(1);
        let h = ctx.module.rgn_height.max(1);

        self.done = false;
        self.square_finish = false;
        self.blind_step = 0;
        self.blind_subtick = 0;
        self.mesh_offset = w / 2;
        self.mesh_pass = 0;
        self.radar_x = w / 2;
        self.radar_y = 0;
        self.radar_side = 0;
        self.radar_step = 2;
        self.style = ctx.module.control_value[0];
        self.max_dim = w.max(h);
        self.size = if self.style == 2 {
            self.max_dim + 200
        } else {
            self.max_dim
        };

        AdResult::NoError
    }

    fn do_blank(&mut self, _ctx: &mut AdContext<'_>) -> AdResult {
        // 1:008C..1:009F: intentionally leaves desktop visible to fade away!
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        if self.done {
            return AdResult::NoError;
        }
        // Authentic 1991 speed normalization: Win16 AD.EXE ran DoDrawFrame in a tight
        // PeekMessage loop; scale steps per 60Hz tick so each fade completes in ~2-6 seconds.
        let steps = if self.square_finish {
            4
        } else {
            match self.style {
                0 => 1,
                1 => 4,
                2 => 5,
                3 => {
                    self.blind_subtick += 1;
                    if self.blind_subtick < 2 {
                        return AdResult::NoError;
                    }
                    self.blind_subtick = 0;
                    1
                }
                4 => 12,
                5 => 4,
                6 => 250,
                _ => 1,
            }
        };

        for _ in 0..steps {
            self.step_once(ctx);
            if self.done {
                break;
            }
        }
        AdResult::NoError
    }

    fn do_button_message(&mut self, control_index: usize) -> AdResult {
        if control_index == 0 {
            AdResult::RestartMe
        } else {
            AdResult::NoError
        }
    }
}
