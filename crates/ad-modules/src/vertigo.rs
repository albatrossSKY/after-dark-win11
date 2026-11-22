//! 1:1 Decompilation of `VERTIGO.AD` ("Vertigo") from After Dark 1.0a (1991).
//!
//! Disassembly-backed from `docs/disasm/vertigo_seg1.asm` and `docs/disasm/vertigo_data.hex`.
//! Preserves genuine 256-color `AnimatePalette` hardware color-cycling via an indexed shadow surface.

use ad_sdk::canvas::AdSurface;
use ad_sdk::palette::{AdPalette, AdPaletteKind, rgb};
use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult, ModuleRunner, SaverMode};

const VERTIGO_DEG2RAD: f64 = 0.017453277777777776; // 3.14159 / 180.0 (DS:0x04C8)
const MAX_FIGURES: i32 = 40;
const MAX_RAD_RANGE: i32 = 150;
const PAL_LEN: usize = 235;

pub struct VertigoModule {
    figure_count: i32,
    shape_type: i32,
    radius: i32,
    offset: i32,
    max_offset: i32,
    offset_step: i32,
    offset_div: i32,
    center_x: i32,
    center_y: i32,
    angle: i32,
    angle_step: i32,
    pitch_counter: i32,
    color_counter: i32,
    color_idx_shape: usize,
    color_idx_spiral: usize,
    need_random_pal: bool,
    animating: bool,
    end_anim_ms: u64,
    // Exact static random color registers for RandomizePalette quirk
    rand_r: u8,
    rand_g: u8,
    rand_b: u8,
    // Live 235-entry mutable palette + indexed shadow surface for 1:1 AnimatePalette cycling
    palette: Vec<[u8; 3]>,
    index_surface: Option<AdSurface>,
}

impl VertigoModule {
    pub fn new() -> Self {
        Self {
            figure_count: 0,
            shape_type: 0,
            radius: 30,
            offset: 0,
            max_offset: 0,
            offset_step: 1,
            offset_div: 1,
            center_x: 320,
            center_y: 240,
            angle: 0,
            angle_step: 3,
            pitch_counter: 0,
            color_counter: 0,
            color_idx_shape: 0,
            color_idx_spiral: 0,
            need_random_pal: true,
            animating: false,
            end_anim_ms: 0,
            rand_r: 0,
            rand_g: 0,
            rand_b: 0,
            palette: AdPalette::build(AdPaletteKind::Primary).entries,
            index_surface: None,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "vertigo".to_string(),
            filename: "VERTIGO.AD".to_string(),
            name: "Vertigo".to_string(),
            credit: "Vertigo by Tracy Elmore.\n©1990 Berkeley Systems Inc.".to_string(),
            about: "VERTIGO (tm)\n\n\"Spiral Pitch\" sets the tightness with which the spirals are drawn.\n\n\"Palette\" sets the colors that are used to draw the shapes.\n\n\"Delay\" determines how long the color animation continues before a new figure is drawn for those with 256 color machines.\n\nStingray Palette by Bill Stewart.\nThanks to Jim Stewart for the shapes.\n\nOriginal concept by Jack Eastman.".to_string(),
            controls: [
                AdControl::Menu {
                    title: "Palette:".to_string(),
                    default_index: 2,
                    choices: vec![
                        "Smooth".to_string(),
                        "Random".to_string(),
                        "Stingray".to_string(),
                    ],
                },
                AdControl::NumericSlider {
                    title: "Spiral Pitch:".to_string(),
                    default_raw: 100,
                    unit: "%".to_string(),
                    min: 1,
                    max: 100,
                },
                AdControl::NumericSlider {
                    title: "Color Speed:".to_string(),
                    default_raw: 100,
                    unit: "%".to_string(),
                    min: 0,
                    max: 100,
                },
                AdControl::LabeledSlider {
                    title: "Delay:".to_string(),
                    default_raw: 35,
                    labels: vec![
                        "0 secs".to_string(),
                        "1 second".to_string(),
                        "2 secs".to_string(),
                        "5 secs".to_string(),
                        "10 secs".to_string(),
                        "20 secs".to_string(),
                        "30 secs".to_string(),
                        "40 secs".to_string(),
                        "50 secs".to_string(),
                        "1 minute".to_string(),
                    ],
                    thresholds: vec![10, 20, 30, 40, 50, 60, 70, 80, 90, 100],
                },
            ],
            target_frame_ms: 20,
        }
    }

    fn palette_kind_for(ctrl0: i32) -> AdPaletteKind {
        match ctrl0 {
            0 => AdPaletteKind::Hsv,
            1 => AdPaletteKind::Rgb,
            2 => AdPaletteKind::Primary,
            _ => AdPaletteKind::White,
        }
    }

    #[inline]
    fn pal_colorref(&self, idx: usize) -> u32 {
        let [r, g, b] = self.palette[idx % PAL_LEN];
        rgb(r, g, b)
    }

    /// Encode palette index `0..234` into the blue channel (`1..=235`) of `index_surface`.
    /// Background black is `0`.
    #[inline]
    fn index_marker(idx: usize) -> u32 {
        rgb(0, 0, ((idx % PAL_LEN) + 1) as u8)
    }

    fn flush_palette_to_surface(&self, surface: &mut AdSurface) {
        let Some(ref idx_surf) = self.index_surface else {
            return;
        };
        let src = idx_surf.pixels();
        let dst = surface.pixels_mut();
        let len = src.len().min(dst.len());
        let mut lut = [0u32; 256];
        for (i, &[r, g, b]) in self.palette.iter().enumerate().take(PAL_LEN) {
            // 32-bit top-down DIB pixel format is 0x00RRGGBB
            lut[i + 1] = ((r as u32) << 16) | ((g as u32) << 8) | (b as u32);
        }
        for i in 0..len {
            let code = (src[i] & 0xFF) as usize;
            if code != 0 {
                dst[i] = lut[code];
            }
        }
    }

    fn pick_center(&mut self, ctx: &mut AdContext<'_>) {
        let w = ctx.module.rgn_width.max(1);
        let h = ctx.module.rgn_height.max(1);
        if ctx.system.saver_mode == SaverMode::Demo {
            let [l, t, r, b] = ctx.system.demo_rect;
            for _ in 0..64 {
                self.center_x = ctx.rng.rand_mod(w);
                self.center_y = ctx.rng.rand_mod(h);
                if !(self.center_x < r
                    && self.center_x > l
                    && self.center_y < b
                    && self.center_y > t)
                {
                    break;
                }
            }
        } else {
            self.center_x = ctx.rng.rand_mod(w);
            self.center_y = ctx.rng.rand_mod(h);
        }
    }

    fn init_shape(&mut self, ctx: &mut AdContext<'_>) {
        self.offset_div = if self.shape_type == 3 { 1 } else { 100 };
        let r = ctx.rng.rand_mod(MAX_RAD_RANGE) + 30;
        self.radius = r;
        self.max_offset = r / self.offset_div;
        self.offset_step = self.max_offset / (r / 2).max(1);
        if self.offset_step == 0 {
            self.offset_step = 1;
        }
        self.offset = 0;
        self.pick_center(ctx);
        self.figure_count += 1;
    }

    fn init_spiral(&mut self, ctx: &mut AdContext<'_>) {
        let r = ctx.rng.rand_mod(MAX_RAD_RANGE + 240) + 90;
        self.radius = r;
        self.max_offset = r / self.offset_div.max(1);
        self.offset_step = self.max_offset / (r / 2).max(1);
        if self.offset_step == 0 {
            self.offset_step = 1;
        }
        self.offset = 0;
        self.pick_center(ctx);
        self.angle = ctx.rng.rand_mod(360);
        self.angle_step = 3;
        self.pitch_counter = 0;
        self.figure_count += 1;
        // Exact 1991 quirk (`1:0344`): InitSpiral calls InitShape at the end!
        self.init_shape(ctx);
    }

    fn pick_new_figure(&mut self, ctx: &mut AdContext<'_>) {
        self.shape_type = ctx.rng.rand_mod(4);
        self.color_counter = 0;
        if self.shape_type == 0 {
            self.init_spiral(ctx);
        } else {
            self.init_shape(ctx);
        }
    }

    fn delay_ms_for(ctrl3: i32, is_spiral: bool) -> Option<u64> {
        match ctrl3 {
            0 => Some(0),
            10 => Some(1500),
            20 => Some(2500),
            30 => Some(5500),
            40 => Some(10500),
            50 => Some(20500),
            60 => Some(30500),
            70 => Some(40500),
            80 => Some(50500),
            100 => Some(60500),
            _ => {
                if is_spiral {
                    None // Exact 1991 quirk (`1:0A61`): spiral omits case 90/default
                } else {
                    Some(60500)
                }
            }
        }
    }

    fn cycle_palette(&mut self, ctx: &mut AdContext<'_>) {
        if !self.palette.is_empty() {
            let first = self.palette[0];
            let last = self.palette.len() - 1;
            self.palette.copy_within(1.., 0);
            self.palette[last] = first;
        }
        self.flush_palette_to_surface(ctx.surface);
        if ctx.elapsed_ms >= self.end_anim_ms {
            self.animating = false;
        }
    }

    fn randomize_palette(&mut self, ctx: &mut AdContext<'_>) {
        // Exact 1991 order (`1:0B3E`): writes static (r,g,b) BEFORE randomizing via `(u8)rand() % 255`.
        for entry in &mut self.palette {
            entry[0] = self.rand_r;
            entry[1] = self.rand_g;
            entry[2] = self.rand_b;
            self.rand_r = ((ctx.rng.rand() & 0xFF) as u8) % 255;
            self.rand_g = ((ctx.rng.rand() & 0xFF) as u8) % 255;
            self.rand_b = ((ctx.rng.rand() & 0xFF) as u8) % 255;
        }
        self.cycle_palette(ctx);
        self.end_anim_ms = ctx.elapsed_ms;
    }

    fn draw_non_spiral_step(&mut self, ctx: &mut AdContext<'_>) {
        if self.offset <= self.max_offset {
            self.offset += self.offset_step;
        }

        if self.color_counter >= (100 - ctx.module.control_value[2]) {
            self.color_idx_shape += 1;
            if self.color_idx_shape >= PAL_LEN {
                self.color_idx_shape = 0;
            }
            self.color_counter = 0;
        }
        self.color_counter += 1;

        let ax = ctx.system.aspect_x.max(1) as u32;
        let ay = ctx.system.aspect_y.max(1) as u32;
        let rad_x = ((self.radius.max(0) as u32 * ay) / ax) as i32;

        let left = self.center_x - rad_x + self.offset;
        let top = self.center_y - self.offset - self.radius;
        let right = self.center_x + self.offset + rad_x;
        let bottom = self.radius - self.offset + self.center_y;

        let col = self.pal_colorref(self.color_idx_shape);
        let mark = Self::index_marker(self.color_idx_shape);

        if self.shape_type == 2 {
            if ctx.system.bits_per_pixel > 4 {
                ctx.surface
                    .rectangle_pen_width(left, top, right, bottom, 3, Some(col), None);
                if let Some(ref mut idx_surf) = self.index_surface {
                    idx_surf.rectangle_pen_width(left, top, right, bottom, 3, Some(mark), None);
                }
            } else {
                ctx.surface
                    .rectangle(left, top, right, bottom, None, Some(col));
                if let Some(ref mut idx_surf) = self.index_surface {
                    idx_surf.rectangle(left, top, right, bottom, None, Some(mark));
                }
            }
        } else {
            ctx.surface
                .ellipse(left, top, right, bottom, None, Some(col));
            if let Some(ref mut idx_surf) = self.index_surface {
                idx_surf.ellipse(left, top, right, bottom, None, Some(mark));
            }
        }

        if self.shape_type == 2 {
            self.radius -= 1;
        } else {
            self.radius -= 2;
        }

        if self.radius < 2 {
            self.animating = true;
            self.pick_new_figure(ctx);
            if let Some(delay) = Self::delay_ms_for(ctx.module.control_value[3], false) {
                self.end_anim_ms = ctx.elapsed_ms + delay;
            }
        }
    }

    fn draw_spiral_step(&mut self, ctx: &mut AdContext<'_>) {
        if self.color_counter >= (100 - ctx.module.control_value[2]) {
            self.color_idx_spiral += 1;
            if self.color_idx_spiral >= PAL_LEN {
                self.color_idx_spiral = 0;
            }
            self.color_counter = 0;
        }
        self.color_counter += 1;

        let ax = ctx.system.aspect_x.max(1) as u32;
        let ay = ctx.system.aspect_y.max(1) as u32;
        let rad_x = ((self.radius.max(0) as u32 * ay) / ax) as i32;

        // Exact 1991 quirk: uses rad_x for both X and Y bounds
        let left = self.center_x - rad_x;
        let top = self.center_y - rad_x;
        let right = self.center_x + rad_x;
        let bottom = self.center_y + rad_x;

        let a2 = self.angle as f64;
        let a1 = (self.angle + self.angle_step + 3) as f64;
        let r_f = rad_x as f64;
        let x2 = ((a2 * VERTIGO_DEG2RAD).cos() * 100.0 * r_f * 0.01 + self.center_x as f64) as i32;
        let y2 = ((a2 * VERTIGO_DEG2RAD).sin() * 100.0 * r_f * 0.01 + self.center_y as f64) as i32;
        let x1 = ((a1 * VERTIGO_DEG2RAD).cos() * 100.0 * r_f * 0.01 + self.center_x as f64) as i32;
        let y1 = ((a1 * VERTIGO_DEG2RAD).sin() * 100.0 * r_f * 0.01 + self.center_y as f64) as i32;

        if x2 != x1 || y2 != y1 {
            let col = self.pal_colorref(self.color_idx_spiral);
            let mark = Self::index_marker(self.color_idx_spiral);
            ctx.surface
                .pie(left, top, right, bottom, x1, y1, x2, y2, None, Some(col));
            if let Some(ref mut idx_surf) = self.index_surface {
                idx_surf.pie(left, top, right, bottom, x1, y1, x2, y2, None, Some(mark));
            }
        }

        self.angle += self.angle_step;
        if self.pitch_counter > (100 - ctx.module.control_value[1]) {
            self.radius -= 1;
            self.pitch_counter = 0;
        }
        self.pitch_counter += 1;

        if self.radius < 2 {
            self.animating = true;
            self.pick_new_figure(ctx);
            if let Some(delay) = Self::delay_ms_for(ctx.module.control_value[3], true) {
                self.end_anim_ms = ctx.elapsed_ms + delay;
            }
        }
    }
}

impl Default for VertigoModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for VertigoModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.figure_count = 0;
        self.offset_div = 1;
        self.need_random_pal = true;
        self.animating = false;
        self.end_anim_ms = 0;
        self.index_surface = AdSurface::new(ctx.module.rgn_width, ctx.module.rgn_height);
        self.pick_new_figure(ctx);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.surface.fill_black();
        if let Some(ref mut idx_surf) = self.index_surface {
            idx_surf.fill_black();
        }
        let kind = Self::palette_kind_for(ctx.module.control_value[0]);
        self.palette = AdPalette::build(kind).entries;
        AdResult::PaletteRequest(kind)
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        if self.need_random_pal {
            if ctx.module.control_value[0] == 1 {
                self.randomize_palette(ctx);
            }
            self.need_random_pal = false;
        }

        if self.animating && ctx.system.bits_per_pixel > 4 && ctx.module.control_value[3] != 0 {
            self.cycle_palette(ctx);
        } else {
            // Batch 4 drawing steps per 20ms frame (~200 steps/sec) to match 1991 386 PeekMessage loop speed.
            for _ in 0..4 {
                if self.shape_type == 0 {
                    self.draw_spiral_step(ctx);
                } else {
                    self.draw_non_spiral_step(ctx);
                }
                if self.animating {
                    break;
                }
            }
        }

        if self.figure_count >= MAX_FIGURES {
            self.figure_count = 0;
            self.pick_new_figure(ctx);
            ctx.surface.fill_black();
            if let Some(ref mut idx_surf) = self.index_surface {
                idx_surf.fill_black();
            }
        }

        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        if ctx.system.runner == ModuleRunner::AfterDark {
            ctx.surface.fill_black();
        }
        self.index_surface = None;
        AdResult::NoError
    }

    fn do_button_message(&mut self, control_index: usize) -> AdResult {
        match control_index {
            0 => {
                self.need_random_pal = true;
                AdResult::NoError
            }
            2 => {
                self.need_random_pal = true;
                AdResult::RestartMe
            }
            _ => AdResult::NoError,
        }
    }
}
