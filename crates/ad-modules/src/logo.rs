//! 1:1 Decompilation of `LOGO.AD` ("Logo") from After Dark 1.0a (1991).
//!
//! Disassembly-backed from `docs/disasm/logo_seg1.asm` and `docs/disasm/logo_data.hex`.

use std::path::PathBuf;

use ad_sdk::canvas::{AdBitmap, AdSurface, ROP_SRCCOPY};
use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

const DEFAULT_ADLOGO_BMP: &[u8] = include_bytes!("../../../assets/bitmaps/ADLOGO.BMP");

pub struct LogoModule {
    logo_surf: Option<AdSurface>,
    bmp_w: i32,
    bmp_h: i32,
    x: i32,
    y: i32,
    dx_dir: i32,
    dy_dir: i32,
    step_x: i32,
    frame_delay: i32,
    delay_counter: i32,
    loaded_path: String,
}

impl LogoModule {
    pub fn new() -> Self {
        Self {
            logo_surf: None,
            bmp_w: 0,
            bmp_h: 0,
            x: 0,
            y: 0,
            dx_dir: 1,
            dy_dir: 1,
            step_x: 1,
            frame_delay: 1,
            delay_counter: 2000,
            loaded_path: String::new(),
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "logo".to_string(),
            filename: "LOGO.AD".to_string(),
            name: "Logo".to_string(),
            credit: "Logo by Bill Stewart.\n©1990 Berkeley Systems Inc.".to_string(),
            about: "LOGO (tm) displays and animates any selected bitmap (.BMP) file.\n\nSince any Windows bitmap file can be used, you can easily make your company logo or trademark a custom screen saver with Logo.".to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "Speed:".to_string(),
                    default_raw: 47,
                    labels: vec![
                        "Slowest".to_string(),
                        "Slow".to_string(),
                        "Medium".to_string(),
                        "Fast".to_string(),
                        "Fastest".to_string(),
                    ],
                    thresholds: vec![20, 40, 60, 80, 100],
                },
                AdControl::None,
                AdControl::Button {
                    title: "Picture..".to_string(),
                },
                AdControl::None,
            ],
            target_frame_ms: 20,
        }
    }

    /// Exact speed table from `LOGO.AD` (`1:0039..1:00C0`), normalized for 50 FPS double-buffered host.
    fn apply_speed(&mut self, ctrl0: i32) {
        match ctrl0 {
            0 => {
                // Slowest (Win16: step=1, delay=700 idle ticks)
                self.step_x = 1;
                self.frame_delay = 8;
            }
            20 => {
                // Slow (Win16: step=1, delay=100 idle ticks)
                self.step_x = 1;
                self.frame_delay = 3;
            }
            40 => {
                // Medium (Win16: step=1, delay=1)
                self.step_x = 1;
                self.frame_delay = 1;
            }
            60 => {
                // Fast (Win16: step=2, delay=1)
                self.step_x = 2;
                self.frame_delay = 1;
            }
            _ => {
                // Fastest (80 / 100, Win16: step=3, delay=1)
                self.step_x = 3;
                self.frame_delay = 1;
            }
        }
    }

    fn load_logo_surface(&mut self, ctx: &AdContext<'_>) {
        let mut loaded_bmp: Option<AdBitmap> = None;

        // 1. Explicit user-selected file in AD_PREFS.INI (`LogoFile=`)
        if !ctx.system.logo_file.is_empty() {
            if let Ok(bytes) = std::fs::read(&ctx.system.logo_file) {
                loaded_bmp = AdBitmap::from_bmp_bytes(&bytes);
            }
        }

        // 2. Fallback to `<data_dir>/bitmaps/ADLOGO.BMP` if present
        if loaded_bmp.is_none() && !ctx.system.data_dir.is_empty() {
            let candidate = PathBuf::from(&ctx.system.data_dir)
                .join("bitmaps")
                .join("ADLOGO.BMP");
            if let Ok(bytes) = std::fs::read(&candidate) {
                loaded_bmp = AdBitmap::from_bmp_bytes(&bytes);
            }
        }

        // 3. Always fall back to authentic embedded 1991 ADLOGO.BMP
        let bmp = match loaded_bmp.or_else(|| AdBitmap::from_bmp_bytes(DEFAULT_ADLOGO_BMP)) {
            Some(b) => b,
            None => {
                self.logo_surf = None;
                self.bmp_w = 0;
                self.bmp_h = 0;
                return;
            }
        };

        // Scale proportionally for modern HD/4K displays (1:1 at 480p, scaled up cleanly on 720p/1080p/4K,
        // and shrunk down cleanly if larger than 72% of viewport!).
        let sf = (ctx.module.rgn_height as f64 / 480.0).clamp(1.0, 4.0);
        let max_w = ((ctx.module.rgn_width * 72) / 100).max(16);
        let max_h = ((ctx.module.rgn_height * 72) / 100).max(16);
        let sx = max_w as f64 / bmp.width.max(1) as f64;
        let sy = max_h as f64 / bmp.height.max(1) as f64;
        let scale = sf.min(sx).min(sy);
        let dst_w = ((bmp.width as f64 * scale).round() as i32).max(1);
        let dst_h = ((bmp.height as f64 * scale).round() as i32).max(1);

        if let Some(mut surf) = AdSurface::new(dst_w, dst_h) {
            if dst_w == bmp.width && dst_h == bmp.height {
                surf.bit_blt_bitmap(0, 0, dst_w, dst_h, &bmp, 0, 0, ROP_SRCCOPY);
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
            self.bmp_w = dst_w;
            self.bmp_h = dst_h;
            self.logo_surf = Some(surf);
        }
        self.loaded_path = ctx.system.logo_file.clone();
    }
}

impl Default for LogoModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for LogoModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.apply_speed(ctx.module.control_value[0]);
        self.x = 0;
        self.y = 0;
        self.dx_dir = 1;
        self.dy_dir = 1;
        self.delay_counter = 2000;
        self.load_logo_surface(ctx);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.surface.fill_black();
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.apply_speed(ctx.module.control_value[0]);
        if self.loaded_path != ctx.system.logo_file {
            ctx.surface.fill_black();
            self.load_logo_surface(ctx);
            self.x = 0;
            self.y = 0;
            self.delay_counter = 2000;
        }

        self.delay_counter += 1;
        if self.delay_counter < self.frame_delay {
            return AdResult::NoError;
        }
        self.delay_counter = 0;

        let Some(ref logo) = self.logo_surf else {
            return AdResult::NoError;
        };

        let rgn_w = ctx.module.rgn_width;
        let rgn_h = ctx.module.rgn_height;

        let prev_x = self.x;
        let prev_y = self.y;
        let prev_dx_dir = self.dx_dir;
        let prev_dy_dir = self.dy_dir;

        // Exact movement & bounce (`1:02DE..1:0334`)
        self.x += self.step_x * self.dx_dir;
        if self.x + self.bmp_w >= rgn_w || self.x < 0 {
            self.dx_dir = -self.dx_dir;
            self.x = self.x.clamp(0, (rgn_w - self.bmp_w).max(0));
        }

        self.y += self.dy_dir;
        if self.y + self.bmp_h >= rgn_h || self.y < 0 {
            self.dy_dir = -self.dy_dir;
            self.y = self.y.clamp(0, (rgn_h - self.bmp_h).max(0));
        }

        // Blit logo at new position
        ctx.surface.bit_blt_surface(
            self.x,
            self.y,
            self.bmp_w,
            self.bmp_h,
            logo,
            0,
            0,
            ROP_SRCCOPY,
        );

        // Exact exposed trailing-strip black fill (`1:039D..1:04AB`)
        if prev_dx_dir > 0 {
            let w = (self.x - prev_x).max(0);
            if w > 0 {
                ctx.surface.pat_blt_black(prev_x, prev_y, w, self.bmp_h);
            }
        } else {
            let rx = self.x + self.bmp_w;
            let w = ((prev_x + self.bmp_w) - rx).max(0);
            if w > 0 {
                ctx.surface.pat_blt_black(rx, prev_y, w, self.bmp_h);
            }
        }

        if prev_dy_dir > 0 {
            let h = (self.y - prev_y).max(0);
            if h > 0 {
                ctx.surface.pat_blt_black(prev_x, prev_y, self.bmp_w, h);
            }
        } else {
            let ry = self.y + self.bmp_h;
            let h = ((prev_y + self.bmp_h) - ry).max(0);
            if h > 0 {
                ctx.surface.pat_blt_black(prev_x, ry, self.bmp_w, h);
            }
        }

        AdResult::NoError
    }

    fn do_close(&mut self, _ctx: &mut AdContext<'_>) -> AdResult {
        self.logo_surf = None;
        AdResult::NoError
    }
}
