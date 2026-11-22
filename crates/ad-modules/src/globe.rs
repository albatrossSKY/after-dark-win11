//! 1:1 Decompilation of `GLOBE.AD` ("Globe") from After Dark 1.0a (1991).
//!
//! Disassembly-backed from `docs/disasm/globe_seg1.asm` and `docs/disasm/globe_data.hex`.

use std::path::PathBuf;

use ad_sdk::canvas::{AdBitmap, AdSurface, ROP_SRCCOPY};
use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

const DEFAULT_EARTH_BMP: &[u8] = include_bytes!("../../../assets/bitmaps/EARTH.BMP");
const GLOBE_INV_TWO_PI: f64 = 0.15915457091927682; // Exact IEEE-754 double at DS:0x0710

pub struct GlobeModule {
    map_pixels: Vec<u32>,
    map_w: usize,
    map_h: usize,
    radius: usize,
    row_half_w: Vec<usize>,
    /// Precomputed `R × R` quadrant longitude-offset LUT (`ord_6`, `1:045B`).
    u_table: Vec<u16>,
    globe_surf: Option<AdSurface>,
    angle_deg: i32,
    x: i32,
    y: i32,
    dx_dir: i32,
    dy_dir: i32,
    move_step: i32,
    move_delay: i32,
    move_countdown: i32,
    loaded_path: String,
}

impl GlobeModule {
    pub fn new() -> Self {
        Self {
            map_pixels: Vec::new(),
            map_w: 0,
            map_h: 0,
            radius: 0,
            row_half_w: Vec::new(),
            u_table: Vec::new(),
            globe_surf: None,
            angle_deg: 0,
            x: 40,
            y: 40,
            dx_dir: 1,
            dy_dir: 1,
            move_step: 1,
            move_delay: 8,
            move_countdown: 1,
            loaded_path: String::new(),
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "globe".to_string(),
            filename: "GLOBE.AD".to_string(),
            name: "Globe".to_string(),
            credit: "Globe by Jack Eastman & Wes Boyd.\n©1990 Berkeley Systems Inc.".to_string(),
            about: "GLOBE (tm) takes a bitmap, wraps it around a sphere, and displays the rotating image.\n\nThe bitmap must be bigger than 60 by 60 and less than 300 vertical by 500 horizontal.".to_string(),
            controls: [
                AdControl::NumericSlider {
                    title: "Rotation:".to_string(),
                    default_raw: 53,
                    unit: " deg".to_string(),
                    min: -45, // 65491 as signed i16
                    max: 45,
                },
                AdControl::LabeledSlider {
                    title: "Speed:".to_string(),
                    default_raw: 0,
                    labels: vec![
                        "Slowest".to_string(),
                        "Slow".to_string(),
                        "Medium".to_string(),
                        "Fast".to_string(),
                        "Fastest".to_string(),
                    ],
                    thresholds: vec![20, 40, 60, 80, 100],
                },
                AdControl::Button {
                    title: "Map...".to_string(),
                },
                AdControl::None,
            ],
            target_frame_ms: 33,
        }
    }

    fn apply_speed(&mut self, ctrl1: i32) {
        // Exact speed table (`1:00E2..1:016A`), normalized for 30 FPS host:
        match ctrl1 {
            0 => {
                self.move_step = 1;
                self.move_delay = 8;
            }
            20 => {
                self.move_step = 1;
                self.move_delay = 3;
            }
            40 => {
                self.move_step = 1;
                self.move_delay = 1;
            }
            60 => {
                self.move_step = 2;
                self.move_delay = 1;
            }
            _ => {
                self.move_step = 3;
                self.move_delay = 1;
            }
        }
    }

    fn load_map(&mut self, ctx: &AdContext<'_>) {
        let mut loaded_bmp: Option<AdBitmap> = None;

        if !ctx.system.globe_file.is_empty() {
            if let Ok(bytes) = std::fs::read(&ctx.system.globe_file) {
                loaded_bmp = AdBitmap::from_bmp_bytes(&bytes);
            }
        }
        if loaded_bmp.is_none() && !ctx.system.data_dir.is_empty() {
            let candidate = PathBuf::from(&ctx.system.data_dir)
                .join("bitmaps")
                .join("EARTH.BMP");
            if let Ok(bytes) = std::fs::read(&candidate) {
                loaded_bmp = AdBitmap::from_bmp_bytes(&bytes);
            }
        }
        let bmp = match loaded_bmp.or_else(|| AdBitmap::from_bmp_bytes(DEFAULT_EARTH_BMP)) {
            Some(b) => b,
            None => {
                self.globe_surf = None;
                return;
            }
        };

        // Clamp globe diameter cleanly so even small preview windows render smoothly
        let max_diam = (ctx.module.rgn_width.min(ctx.module.rgn_height) - 8).max(32);
        let map_h = (bmp.height.min(max_diam)).max(32) as usize;
        let map_w = bmp.width.max(32) as usize;
        let radius = (map_h / 2).max(16);
        let diam = radius * 2;

        let Some(mut src_surf) = AdSurface::new(map_w as i32, map_h as i32) else {
            return;
        };
        if map_h as i32 == bmp.height {
            src_surf.bit_blt_bitmap(0, 0, map_w as i32, map_h as i32, &bmp, 0, 0, ROP_SRCCOPY);
        } else {
            src_surf.stretch_blt_bitmap(
                0,
                0,
                map_w as i32,
                map_h as i32,
                &bmp,
                0,
                0,
                bmp.width,
                bmp.height,
                ROP_SRCCOPY,
            );
        }

        self.map_pixels = src_surf.pixels().to_vec();
        self.map_w = map_w;
        self.map_h = map_h;
        self.radius = radius;

        // Exact `ord_12` (`1:035A`): row_half_w[r] = cos(asin((R - r) / R)) * R
        self.row_half_w = (0..radius)
            .map(|r| {
                let y = ((radius - r) as f64) / (radius as f64);
                let hw = (y.clamp(-1.0, 1.0).asin().cos() * (radius as f64)) as usize;
                hw.min(radius)
            })
            .collect();

        // Exact `ord_11` (`1:03E2`): lon_lut[i] = asin(i / 256) * map_w / (2*pi)
        let scale = (map_w as f64) * GLOBE_INV_TWO_PI;
        let mut lon_lut = [0u16; 256];
        for i in 0..256 {
            let v = ((i as f64) / 256.0).asin() * scale;
            lon_lut[i] = (v as usize).min(map_w.saturating_sub(1)) as u16;
        }

        // Exact `ord_6` (`1:045B`): precomputed R × R quadrant longitude offset table
        self.u_table = vec![0xFFFFu16; radius * radius];
        for r in 0..radius {
            let hw = self.row_half_w[r];
            if hw == 0 {
                continue;
            }
            let half = hw >> 1;
            for x in 0..hw {
                let norm = ((x * 256 + half) / hw).min(255);
                self.u_table[r * radius + x] = lon_lut[norm];
            }
        }

        self.globe_surf = AdSurface::new(diam as i32, diam as i32);
        self.loaded_path = ctx.system.globe_file.clone();
    }

    /// Exact 4-quadrant orthographic sphere projector (`ord_16`, `1:0531..1:0F8E`).
    fn render_sphere(&mut self, lon_offset: usize) {
        let Some(ref mut surf) = self.globe_surf else {
            return;
        };
        let r = self.radius;
        let diam = r * 2;
        let mw = self.map_w;
        if r == 0 || mw == 0 || self.map_pixels.len() < mw * diam {
            return;
        }

        let dst = surf.pixels_mut();
        dst.fill(0);

        for row in 0..r {
            let hw = self.row_half_w[row];
            let lut_row = &self.u_table[row * r..row * r + hw];
            let top_src_row = &self.map_pixels[row * mw..(row + 1) * mw];
            let bot_y = diam - 1 - row;
            let bot_src_row = &self.map_pixels[bot_y * mw..(bot_y + 1) * mw];

            let top_dst = row * diam;
            let bot_dst = bot_y * diam;

            for (dx, &u_off) in lut_row.iter().enumerate() {
                let u = u_off as usize;
                // Left hemisphere: wrap(lon_offset - u)
                let ul = if lon_offset >= u {
                    lon_offset - u
                } else {
                    lon_offset + mw - u
                } % mw;
                // Right hemisphere: wrap(lon_offset + u)
                let ur = (lon_offset + u) % mw;

                let lx = r - 1 - dx;
                let rx = r + dx;
                dst[top_dst + lx] = top_src_row[ul];
                dst[top_dst + rx] = top_src_row[ur];
                dst[bot_dst + lx] = bot_src_row[ul];
                dst[bot_dst + rx] = bot_src_row[ur];
            }
        }
    }
}

impl Default for GlobeModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for GlobeModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.apply_speed(ctx.module.control_value[1]);
        self.angle_deg = 0;
        self.dx_dir = 1;
        self.dy_dir = 1;
        self.move_countdown = 1;
        self.load_map(ctx);

        let diam = (self.radius * 2) as i32;
        if ctx.module.rgn_width - 50 >= diam && ctx.module.rgn_height - 50 >= diam {
            self.x = 40;
            self.y = 40;
        } else {
            self.x = ((ctx.module.rgn_width - diam) / 2).max(0);
            self.y = ((ctx.module.rgn_height - diam) / 2).max(0);
        }
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.surface.fill_black();
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.apply_speed(ctx.module.control_value[1]);
        if self.loaded_path != ctx.system.globe_file {
            ctx.surface.fill_black();
            self.load_map(ctx);
        }
        if self.radius == 0 || self.map_w == 0 {
            return AdResult::NoError;
        }

        // 1. Render current rotation frame (`1:0F9F..1:0FED`)
        let lon_offset = (((self.angle_deg as i64) * (self.map_w as i64)) / 360)
            .rem_euclid(self.map_w as i64) as usize;
        self.render_sphere(lon_offset);

        // Advance rotation angle (`angle_deg -= rotation_deg`, wrapped 0..360)
        let rot_deg = ctx.module.control_value[0].clamp(-45, 45);
        self.angle_deg -= rot_deg;
        while self.angle_deg >= 360 {
            self.angle_deg -= 360;
        }
        while self.angle_deg < 0 {
            self.angle_deg += 360;
        }

        // 2. Bounce position when move_countdown expires (`1:0FF0..1:1083`)
        let diam = (self.radius * 2) as i32;
        let prev_x = self.x;
        let prev_y = self.y;
        let prev_dx_dir = self.dx_dir;
        let prev_dy_dir = self.dy_dir;

        self.move_countdown -= 1;
        let moved = if self.move_countdown <= 0 {
            self.move_countdown = self.move_delay;
            let max_x = (ctx.module.rgn_width - diam).max(0);
            let max_y = (ctx.module.rgn_height - diam).max(0);

            self.x += self.move_step * self.dx_dir;
            if self.x + diam >= ctx.module.rgn_width || self.x < 0 {
                self.dx_dir = -self.dx_dir;
                self.x = self.x.clamp(0, max_x);
            }
            self.y += self.move_step * self.dy_dir;
            if self.y + diam >= ctx.module.rgn_height || self.y < 0 {
                self.dy_dir = -self.dy_dir;
                self.y = self.y.clamp(0, max_y);
            }
            true
        } else {
            false
        };

        // 3. Blit spinning globe & erase trailing strips cleanly (`1:1083..1:1218`)
        if let Some(ref globe) = self.globe_surf {
            ctx.surface
                .bit_blt_surface(self.x, self.y, diam, diam, globe, 0, 0, ROP_SRCCOPY);
        }

        if moved {
            if prev_dx_dir > 0 {
                let w = (self.x - prev_x).max(0);
                if w > 0 {
                    ctx.surface.pat_blt_black(prev_x, prev_y, w, diam);
                }
            } else {
                let rx = self.x + diam;
                let w = ((prev_x + diam) - rx).max(0);
                if w > 0 {
                    ctx.surface.pat_blt_black(rx, prev_y, w, diam);
                }
            }

            if prev_dy_dir > 0 {
                let h = (self.y - prev_y).max(0);
                if h > 0 {
                    ctx.surface.pat_blt_black(prev_x, prev_y, diam, h);
                }
            } else {
                let ry = self.y + diam;
                let h = ((prev_y + diam) - ry).max(0);
                if h > 0 {
                    ctx.surface.pat_blt_black(prev_x, ry, diam, h);
                }
            }
        }

        AdResult::NoError
    }

    fn do_close(&mut self, _ctx: &mut AdContext<'_>) -> AdResult {
        self.globe_surf = None;
        self.map_pixels.clear();
        self.u_table.clear();
        AdResult::NoError
    }
}
