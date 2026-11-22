//! 1:1 Decompilation of `PUZZLE.AD` ("Puzzle") from After Dark 1.0a (1991).
//!
//! Disassembly-backed from `docs/disasm/puzzle_seg1.asm` and `docs/disasm/puzzle_data.hex`.

use ad_sdk::palette::rgb;
use ad_sdk::sound::{AdSound, Tone};
use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

pub struct PuzzleModule {
    grid_size: i32,
    step_base: i32,
    board_w: i32,
    board_h: i32,
    blank_tile: i32,
    prev_blank_tile: i32,
    step_dir_x: i32,
    step_dir_y: i32,
    scroll_rect: (i32, i32, i32, i32), // left, top, right, bottom
    step_count: i32,
    total_steps: i32,
    rem_pixels: i32,
    need_new_tile: bool,
}

impl PuzzleModule {
    pub fn new() -> Self {
        Self {
            grid_size: 8,
            step_base: 1,
            board_w: 640,
            board_h: 480,
            blank_tile: 0,
            prev_blank_tile: -1,
            step_dir_x: 0,
            step_dir_y: 0,
            scroll_rect: (0, 0, 0, 0),
            step_count: 0,
            total_steps: 0,
            rem_pixels: 0,
            need_new_tile: true,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "puzzle".to_string(),
            filename: "PUZZLE.AD".to_string(),
            name: "Puzzle".to_string(),
            credit: "Puzzle by Bill Stewart.\r\n  \u{00a9}1990 Berkeley Systems Inc.".to_string(),
            about: concat!(
                "PUZZLE (tm) turns your Windows desktop into a sliding tile puzzle.\r\n\r\n",
                "\"Size\" selects tile size, \"Speed\" controls slide speed, \"Sound\" plays a ",
                "click when tiles snap into place, and \"Invert Screen\" inverts your desktop."
            )
            .to_string(),
            controls: [
                AdControl::Menu {
                    title: "Size:".to_string(),
                    default_index: 0,
                    choices: vec![
                        "Small".to_string(),
                        "Medium".to_string(),
                        "Large".to_string(),
                    ],
                },
                AdControl::Menu {
                    title: "Speed:".to_string(),
                    default_index: 0,
                    choices: vec![
                        "Slow".to_string(),
                        "Medium".to_string(),
                        "Fast".to_string(),
                    ],
                },
                AdControl::Checkbox {
                    title: "Sound".to_string(),
                    default_checked: false,
                },
                AdControl::Checkbox {
                    title: "Invert Screen".to_string(),
                    default_checked: false,
                },
            ],
            target_frame_ms: 20,
        }
    }

    #[inline]
    fn tile_rect(&self, tile_idx: i32) -> (i32, i32, i32, i32) {
        let n = self.grid_size;
        let tile_w = self.board_w / n;
        let tile_h = self.board_h / n;
        let top = (tile_idx / n) * tile_h;
        let left = (tile_idx % n) * tile_w;
        (left, top, left + tile_w, top + tile_h)
    }

    fn draw_grid_and_punch_hole(&mut self, ctx: &mut AdContext<'_>) {
        // 1:01F2..1:03CD
        let n = self.grid_size;
        let tile_w = (self.board_w / n).max(1);
        let tile_h = (self.board_h / n).max(1);

        // Vertical interior grid lines
        let mut x = tile_w;
        while x < self.board_w {
            ctx.surface.line(x, 0, x, self.board_h, 1, rgb(0, 0, 0));
            x += tile_w;
        }

        // Horizontal interior grid lines (exact original bound: y < board_h - 4)
        let mut y = tile_h;
        while y < self.board_h - 4 {
            ctx.surface.line(0, y, self.board_w, y, 1, rgb(0, 0, 0));
            y += tile_h;
        }

        // Pick random blank tile & fill solid black
        self.blank_tile = ctx.rng.rand() % (n * n);
        let (l, t, r, b) = self.tile_rect(self.blank_tile);
        ctx.surface.fill_rect_rgb(l, t, r, b, rgb(0, 0, 0));

        // 1px black top border and left border
        ctx.surface.line(0, 0, self.board_w, 0, 1, rgb(0, 0, 0));
        ctx.surface.line(0, 0, 0, tile_h * n, 1, rgb(0, 0, 0));
    }

    fn play_snap_sound(ctx: &AdContext<'_>) {
        // 1:048B..1:052A
        if ctx.system.sound_enabled && ctx.module.control_value[2] != 0 {
            let step = if ctx.module.control_value[0] < 2 { 4 } else { 1 };
            let tones: Vec<Tone> = (7..25)
                .step_by(step)
                .map(|note| Tone {
                    freq_hz: AdSound::win16_note_to_hz(note),
                    duration_ms: 5,
                    volume: 0.14,
                })
                .collect();
            ctx.sound.play_tones(tones);
        }
    }

    fn pick_next_tile(&mut self, ctx: &mut AdContext<'_>) {
        // 1:0575..1:079D
        let n = self.grid_size;
        let tile_w = self.board_w / n;
        let tile_h = self.board_h / n;

        let candidate;
        loop {
            let dir = ctx.rng.rand() % 4;
            let cand = match dir {
                0 => {
                    if self.blank_tile < n {
                        return; // exact 1-frame pause quirk on edge hit
                    }
                    self.step_dir_x = 0;
                    self.step_dir_y = 1;
                    self.blank_tile - n
                }
                1 => {
                    if (self.blank_tile + 1) % n == 0 {
                        return;
                    }
                    self.step_dir_x = -1;
                    self.step_dir_y = 0;
                    self.blank_tile + 1
                }
                2 => {
                    if self.blank_tile > n * (n - 1) - 1 {
                        return;
                    }
                    self.step_dir_x = 0;
                    self.step_dir_y = -1;
                    self.blank_tile + n
                }
                _ => {
                    if self.blank_tile % n == 0 {
                        return;
                    }
                    self.step_dir_x = 1;
                    self.step_dir_y = 0;
                    self.blank_tile - 1
                }
            };
            if cand != self.prev_blank_tile {
                candidate = cand;
                break;
            }
        }

        self.prev_blank_tile = self.blank_tile;
        let dst = self.tile_rect(self.prev_blank_tile);
        self.blank_tile = candidate;
        let src = self.tile_rect(self.blank_tile);

        // UnionRect(dst, src)
        self.scroll_rect = (
            dst.0.min(src.0),
            dst.1.min(src.1),
            dst.2.max(src.2),
            dst.3.max(src.3),
        );

        if self.step_dir_x == 0 {
            self.total_steps = tile_h / self.step_base.max(1);
            self.rem_pixels = tile_h % self.step_base.max(1);
        } else {
            let hstep = (self.step_base << 1).max(1);
            self.total_steps = tile_w / hstep;
            self.rem_pixels = tile_w % hstep;
        }

        self.need_new_tile = false;
        self.step_count = 0;
        self.slide_tile_step(ctx);
    }

    fn slide_tile_step(&mut self, ctx: &mut AdContext<'_>) {
        // 1:03CE..1:0574
        let (l, t, r, b) = self.scroll_rect;
        if self.step_count < self.total_steps {
            let dx = (self.step_base * self.step_dir_x) << 1;
            let dy = self.step_base * self.step_dir_y;
            ctx.surface.scroll_rect_fill_black(l, t, r, b, dx, dy);
            self.step_count += 1;
        } else {
            let dx = self.rem_pixels * self.step_dir_x;
            let dy = self.rem_pixels * self.step_dir_y;
            ctx.surface.scroll_rect_fill_black(l, t, r, b, dx, dy);
            Self::play_snap_sound(ctx);
            self.need_new_tile = true;
            let mut sb = ctx.module.control_value[1] << 1;
            if sb == 0 {
                sb = 1;
            }
            self.step_base = sb;
        }
    }
}

impl Default for PuzzleModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for PuzzleModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:0012..1:014D
        let w = ctx.module.rgn_width.max(4);
        let h = ctx.module.rgn_height.max(4);

        self.need_new_tile = true;
        self.prev_blank_tile = -1;

        self.grid_size = match ctx.module.control_value[0] {
            0 => {
                if h < 480 {
                    10
                } else {
                    16
                }
            }
            1 => {
                if h < 480 {
                    10
                } else {
                    8
                }
            }
            _ => {
                if h < 480 {
                    5
                } else {
                    4
                }
            }
        };
        // Guard tiny windows so tile_w & tile_h >= 2
        while self.grid_size > 2 && (w / self.grid_size < 4 || h / self.grid_size < 4) {
            self.grid_size /= 2;
        }

        let mut sb = ctx.module.control_value[1] << 1;
        if sb == 0 {
            sb = 1;
        }
        self.step_base = sb;

        // Optional desktop invert
        if ctx.module.control_value[3] != 0 {
            ctx.surface.invert_rect(0, 0, w, h);
        }

        // Trim right & bottom remainders to exact multiples of grid_size, filling margins black
        let rem_x = w % self.grid_size;
        self.board_w = w - rem_x;
        if rem_x != 0 {
            ctx.surface.fill_rect_rgb(self.board_w, 0, w, h, rgb(0, 0, 0));
        }

        let rem_y = h % self.grid_size;
        self.board_h = h - rem_y;
        if rem_y != 0 {
            ctx.surface
                .fill_rect_rgb(0, self.board_h, self.board_w, h, rgb(0, 0, 0));
        }

        self.draw_grid_and_punch_hole(ctx);
        AdResult::NoError
    }

    fn do_blank(&mut self, _ctx: &mut AdContext<'_>) -> AdResult {
        // 1:014E..1:0161: intentionally leaves live desktop unblanked!
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:0162..1:0186
        if self.need_new_tile {
            self.pick_next_tile(ctx);
        } else {
            self.slide_tile_step(ctx);
        }
        AdResult::NoError
    }

    fn do_button_message(&mut self, control_index: usize) -> AdResult {
        // 1:01C3..1:01F1
        if control_index == 0 {
            AdResult::RestartMe
        } else {
            AdResult::NoError
        }
    }
}
