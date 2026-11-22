//! 1:1 Decompilation of `SLIDESHO.AD` ("Slide Show") from After Dark 1.0a (1991).
//!
//! Disassembly-backed from `docs/disasm/slidesho_seg1.asm` and `docs/disasm/slidesho_data.hex`.

use std::path::PathBuf;

use ad_sdk::canvas::{AdBitmap, AdSurface, ROP_SRCCOPY};
use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

const DEFAULT_SLIDES: [&[u8]; 3] = [
    include_bytes!("../../../assets/bitmaps/ADLOGO.BMP"),
    include_bytes!("../../../assets/bitmaps/BSILOGO.BMP"),
    include_bytes!("../../../assets/bitmaps/EARTH.BMP"),
];

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
enum SlidePhase {
    NeedNextSlide,
    FadeOut,
    FadeIn,
    Hold,
}

enum SlideSource {
    File(PathBuf),
    Embedded(usize),
}

pub struct SlideShowModule {
    sources: Vec<SlideSource>,
    current_idx: usize,
    loaded_dir: String,
    current_slide: Option<AdSurface>,
    slide_w: i32,
    slide_h: i32,
    off_x: i32, // (bmp_w - rgn_w) / 2
    off_y: i32, // (bmp_h - rgn_h) / 2
    phase: SlidePhase,
    has_shown_any: bool,
    hold_until_ms: u64,
    // Tile-dissolve state (`1:109C..1:1278`)
    tile_cols: i32,
    tile_rows: i32,
    tile_order: Vec<i32>,
    tile_cursor: usize,
}

impl SlideShowModule {
    pub fn new() -> Self {
        Self {
            sources: Vec::new(),
            current_idx: 0,
            loaded_dir: String::new(),
            current_slide: None,
            slide_w: 0,
            slide_h: 0,
            off_x: 0,
            off_y: 0,
            phase: SlidePhase::NeedNextSlide,
            has_shown_any: false,
            hold_until_ms: 0,
            tile_cols: 32,
            tile_rows: 32,
            tile_order: Vec::new(),
            tile_cursor: 0,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "slidesho".to_string(),
            filename: "SLIDESHO.AD".to_string(),
            name: "Slide Show".to_string(),
            credit: "Slide Show by Bill Stewart.\n©1990 Berkeley Systems Inc.".to_string(),
            about: "SLIDESHOW (tm) will display a series of bitmap files, somewhat like a projector slide show.\n\nSlide Show will use any Windows bitmap file(s) (.BMP) placed in the BITMAPS subdirectory. Several sample bitmap files come with After Dark. You can add your own bitmap files and remove any bitmaps you do not wish Slide Show to use.\n\nSlide Show can be directed to use the bitmaps in any specified directory. Click on the \"Pictures..\" button to specify a directory.\n\nSince any Windows bitmap file can be used, you can easily make your company logo or other artwork into a custom screen saver with Slide Show.".to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "Display Time:".to_string(),
                    default_raw: 8,
                    labels: vec![
                        "5 sec".to_string(),
                        "10 sec".to_string(),
                        "20 sec".to_string(),
                        "30 sec".to_string(),
                        "40 sec".to_string(),
                        "50 sec".to_string(),
                        "1 min".to_string(),
                        "2 min".to_string(),
                        "5 min".to_string(),
                        "10 min".to_string(),
                        "15 min".to_string(),
                        "30 min".to_string(),
                        "1 hour".to_string(),
                    ],
                    thresholds: vec![5, 10, 15, 20, 25, 30, 40, 50, 60, 70, 80, 90, 100],
                },
                AdControl::LabeledSlider {
                    title: "Fade Speed:".to_string(),
                    default_raw: 52,
                    labels: vec![
                        "Slow".to_string(),
                        "Medium".to_string(),
                        "Fast".to_string(),
                        "Instantly".to_string(),
                    ],
                    thresholds: vec![33, 67, 90, 100],
                },
                AdControl::None,
                AdControl::Button {
                    title: "Pictures..".to_string(),
                },
            ],
            target_frame_ms: 20,
        }
    }

    /// Exact Display Time mapping (`1:008F..1:00FC`).
    fn display_time_secs(ctrl0: i32) -> u64 {
        match ctrl0 {
            0 => 5,
            5 => 10,
            10 => 20,
            15 => 30,
            20 => 40,
            25 => 50,
            30 => 60,
            40 => 120,
            50 => 300,
            60 => 600,
            70 => 900,
            80 => 1800,
            _ => 3600,
        }
    }

    /// Exact Fade Speed mapping (`1:0145..1:01C5`): 3=Slow, 2=Medium, 1=Fast, 0=Instantly.
    fn fade_mode(ctrl1: i32) -> i32 {
        match ctrl1 {
            0 => 3,
            33 => 2,
            67 => 1,
            _ => 0,
        }
    }

    fn scan_dir_bmps(dir: &PathBuf) -> Vec<SlideSource> {
        let mut files = Vec::new();
        if let Ok(rd) = std::fs::read_dir(dir) {
            for entry in rd.flatten() {
                let p = entry.path();
                if p.is_file()
                    && p.extension()
                        .and_then(|e| e.to_str())
                        .map(|e| e.eq_ignore_ascii_case("bmp"))
                        .unwrap_or(false)
                {
                    files.push(p);
                }
            }
        }
        files.sort();
        files.into_iter().map(SlideSource::File).collect()
    }

    fn discover_sources(&mut self, ctx: &AdContext<'_>) {
        self.sources.clear();
        if !ctx.system.slide_show_dir.is_empty() {
            let dir = PathBuf::from(&ctx.system.slide_show_dir);
            self.sources = Self::scan_dir_bmps(&dir);
        }
        if self.sources.is_empty() && !ctx.system.data_dir.is_empty() {
            let dir = PathBuf::from(&ctx.system.data_dir).join("bitmaps");
            self.sources = Self::scan_dir_bmps(&dir);
        }
        if self.sources.is_empty() {
            for i in 0..DEFAULT_SLIDES.len() {
                self.sources.push(SlideSource::Embedded(i));
            }
        }
        self.current_idx = 0;
        self.loaded_dir = ctx.system.slide_show_dir.clone();
    }

    fn load_next_slide(&mut self, ctx: &AdContext<'_>) -> bool {
        if self.sources.is_empty() {
            return false;
        }
        for _ in 0..self.sources.len() {
            let idx = self.current_idx % self.sources.len();
            self.current_idx = (idx + 1) % self.sources.len();
            let bmp = match &self.sources[idx] {
                SlideSource::File(path) => std::fs::read(path)
                    .ok()
                    .and_then(|b| AdBitmap::from_bmp_bytes(&b)),
                SlideSource::Embedded(i) => AdBitmap::from_bmp_bytes(DEFAULT_SLIDES[*i]),
            };
            if let Some(bmp) = bmp {
                // Fit slide proportionally to ~82% of the modern widescreen HD/4K viewport (aspect-preserving!)
                let max_w = ((ctx.module.rgn_width * 84) / 100).max(32);
                let max_h = ((ctx.module.rgn_height * 84) / 100).max(32);
                let sx = max_w as f32 / bmp.width.max(1) as f32;
                let sy = max_h as f32 / bmp.height.max(1) as f32;
                let fit_scale = sx.min(sy).clamp(0.25, 6.0);
                let dst_w = ((bmp.width as f32 * fit_scale).round() as i32).max(1);
                let dst_h = ((bmp.height as f32 * fit_scale).round() as i32).max(1);
                if let Some(mut surf) = AdSurface::new(dst_w, dst_h) {
                    if dst_w == bmp.width && dst_h == bmp.height {
                        surf.bit_blt_bitmap(0, 0, bmp.width, bmp.height, &bmp, 0, 0, ROP_SRCCOPY);
                    } else {
                        surf.stretch_blt_bitmap(
                            0,
                            0,
                            dst_w,
                            dst_h,
                            &bmp,
                            0,
                            0,
                            bmp.width,
                            bmp.height,
                            ROP_SRCCOPY,
                        );
                    }
                    self.slide_w = dst_w;
                    self.slide_h = dst_h;
                    // Exact centering formula (`1:105D..1:107C`): (bmp_size - rgn_size) / 2
                    self.off_x = (self.slide_w - ctx.module.rgn_width) / 2;
                    self.off_y = (self.slide_h - ctx.module.rgn_height) / 2;
                    self.current_slide = Some(surf);
                    return true;
                }
            }
        }
        false
    }

    fn begin_tile_dissolve(&mut self, ctx: &mut AdContext<'_>, fade_mode: i32) {
        let h = ctx.module.rgn_height;
        let (cols, rows) = match fade_mode {
            3 => (40, if h < 480 { 50 } else { 40 }),
            2 => (32, if h < 480 { 25 } else { 32 }),
            1 => (16, if h < 480 { 14 } else { 16 }),
            _ => (0, 0),
        };
        self.tile_cols = cols;
        self.tile_rows = rows;
        let total = (cols * rows) as usize;
        self.tile_order = (0..total as i32).collect();
        // Fisher-Yates shuffle using MsvcRand (matches random unique tile order of `1:1151..1:116E`)
        for i in (1..total).rev() {
            let j = ctx.rng.rand_mod((i + 1) as i32) as usize;
            self.tile_order.swap(i, j);
        }
        self.tile_cursor = 0;
    }

    fn step_dissolve(&mut self, ctx: &mut AdContext<'_>, is_fade_in: bool, fade_mode: i32) -> bool {
        let rgn_w = ctx.module.rgn_width;
        let rgn_h = ctx.module.rgn_height;

        if fade_mode == 0 || self.tile_cols <= 0 || self.tile_rows <= 0 {
            if is_fade_in {
                if let Some(ref slide) = self.current_slide {
                    ctx.surface.bit_blt_surface(
                        -self.off_x,
                        -self.off_y,
                        self.slide_w,
                        self.slide_h,
                        slide,
                        0,
                        0,
                        ROP_SRCCOPY,
                    );
                }
            } else {
                ctx.surface.fill_black();
            }
            return true;
        }

        let batch = match fade_mode {
            1 => 16,
            2 => 28,
            _ => 24,
        };
        let tile_w = (rgn_w / self.tile_cols).max(1);
        let tile_h = (rgn_h / self.tile_rows).max(1);

        let end = (self.tile_cursor + batch).min(self.tile_order.len());
        for idx in self.tile_cursor..end {
            let cell = self.tile_order[idx];
            let col = cell % self.tile_cols;
            let row = cell / self.tile_cols;
            let dst_x = col * tile_w;
            let dst_y = row * tile_h;

            if is_fade_in {
                let src_x = dst_x + self.off_x;
                let src_y = dst_y + self.off_y;
                if src_x >= 0 && src_x < self.slide_w && src_y >= 0 && src_y < self.slide_h {
                    if let Some(ref slide) = self.current_slide {
                        ctx.surface.bit_blt_surface(
                            dst_x,
                            dst_y,
                            tile_w,
                            tile_h,
                            slide,
                            src_x,
                            src_y,
                            ROP_SRCCOPY,
                        );
                    }
                }
            } else {
                ctx.surface.pat_blt_black(dst_x, dst_y, tile_w, tile_h);
            }
        }
        self.tile_cursor = end;

        if self.tile_cursor >= self.tile_order.len() {
            // Exact completion pass (`1:121C..1:1270`): fill any remainder edges cleanly
            if is_fade_in {
                if let Some(ref slide) = self.current_slide {
                    ctx.surface.bit_blt_surface(
                        -self.off_x,
                        -self.off_y,
                        self.slide_w,
                        self.slide_h,
                        slide,
                        0,
                        0,
                        ROP_SRCCOPY,
                    );
                }
            } else {
                ctx.surface.fill_black();
            }
            true
        } else {
            false
        }
    }
}

impl Default for SlideShowModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for SlideShowModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.discover_sources(ctx);
        self.current_slide = None;
        self.phase = SlidePhase::NeedNextSlide;
        self.has_shown_any = false;
        self.hold_until_ms = 0;
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.surface.fill_black();
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        if self.loaded_dir != ctx.system.slide_show_dir {
            ctx.surface.fill_black();
            self.discover_sources(ctx);
            self.phase = SlidePhase::NeedNextSlide;
            self.has_shown_any = false;
        }

        let fade_mode = Self::fade_mode(ctx.module.control_value[1]);
        let display_ms = Self::display_time_secs(ctx.module.control_value[0]) * 1000;

        match self.phase {
            SlidePhase::NeedNextSlide => {
                if !self.load_next_slide(ctx) {
                    return AdResult::NoError;
                }
                self.begin_tile_dissolve(ctx, fade_mode);
                self.phase = SlidePhase::FadeIn;
                if self.step_dissolve(ctx, true, fade_mode) {
                    self.has_shown_any = true;
                    self.hold_until_ms = ctx.elapsed_ms + display_ms;
                    self.phase = SlidePhase::Hold;
                }
            }
            SlidePhase::FadeOut => {
                if self.step_dissolve(ctx, false, fade_mode) {
                    self.phase = SlidePhase::NeedNextSlide;
                }
            }
            SlidePhase::FadeIn => {
                if self.step_dissolve(ctx, true, fade_mode) {
                    self.has_shown_any = true;
                    self.hold_until_ms = ctx.elapsed_ms + display_ms;
                    self.phase = SlidePhase::Hold;
                }
            }
            SlidePhase::Hold => {
                if ctx.elapsed_ms >= self.hold_until_ms {
                    if self.has_shown_any {
                        self.begin_tile_dissolve(ctx, fade_mode);
                        self.phase = SlidePhase::FadeOut;
                    } else {
                        self.phase = SlidePhase::NeedNextSlide;
                    }
                }
            }
        }

        AdResult::NoError
    }

    fn do_close(&mut self, _ctx: &mut AdContext<'_>) -> AdResult {
        self.current_slide = None;
        self.tile_order.clear();
        AdResult::NoError
    }
}
