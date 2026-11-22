//! 1:1 Decompilation of `SPOTLITE.AD` ("Spotlight") from After Dark 1.0a (1991).
//!
//! Disassembly-backed from `docs/disasm/spotlite_seg1.asm` and `docs/disasm/spotlite_data.hex`.

use ad_sdk::canvas::{AdRegion, AdSurface, ROP_SRCCOPY};
use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

const BORDER_PAD: i32 = 10;

pub struct SpotlightModule {
    speed: i32,
    spot_w: i32,
    spot_h: i32,
    buf_w: i32,
    buf_h: i32,
    pos_x: i32,
    pos_y: i32,
    dir_x: bool, // true = +X, false = -X
    dir_y: bool, // true = +Y, false = -Y
    capture_desktop: bool,

    desktop: Option<AdSurface>,
    spot_buf: Option<AdSurface>,
    spot_rgn: Option<AdRegion>,
}

impl SpotlightModule {
    pub fn new() -> Self {
        Self {
            speed: 3,
            spot_w: 86,
            spot_h: 86,
            buf_w: 106,
            buf_h: 106,
            pos_x: 0,
            pos_y: 0,
            dir_x: true,
            dir_y: true,
            capture_desktop: true,
            desktop: None,
            spot_buf: None,
            spot_rgn: None,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "spotlite".to_string(),
            filename: "SPOTLITE.AD".to_string(),
            name: "Spotlight".to_string(),
            credit: "Spotlight by Bill Stewart.\r\n  \u{00a9}1990 Berkeley Systems Inc.".to_string(),
            about: concat!(
                "SPOTLIGHT (tm) shines a moving spotlight on your Windows desktop.\r\n\r\n",
                "Original concept by Bob Schumaker and Chip Morningstar. \r\n\r\n",
                "Use the \"Size\" slider to change the size of the spotlight.\r\n\r\n",
                "The \"Speed\" slider controls how fast it moves around the screen.\r\n"
            )
            .to_string(),
            controls: [
                AdControl::NumericSlider {
                    title: "Size:".to_string(),
                    default_raw: 59,
                    unit: String::new(),
                    min: 10,
                    max: 140,
                },
                AdControl::NumericSlider {
                    title: "Speed:".to_string(),
                    default_raw: 33,
                    unit: String::new(),
                    min: 1,
                    max: 7,
                },
                AdControl::None,
                AdControl::None,
            ],
            target_frame_ms: 20,
        }
    }
}

impl Default for SpotlightModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for SpotlightModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:0012..1:0198
        self.spot_h = ctx.module.control_value[0].clamp(10, 140);
        self.speed = ctx.module.control_value[1].clamp(1, 7);

        let aspect_x = (ctx.system.aspect_x.max(1)) as u32;
        let aspect_y = (ctx.system.aspect_y.max(1)) as u32;
        self.spot_w = (((self.spot_h as u32) * aspect_y) / aspect_x).max(1) as i32;

        self.buf_h = self.spot_h + BORDER_PAD * 2;
        self.buf_w = self.spot_w + BORDER_PAD * 2;

        if self.capture_desktop || self.desktop.is_none() {
            let max_x = (ctx.module.rgn_width - self.spot_w - self.speed).max(1);
            // Exact original quirk: subtracts spot_w on Y as well
            let max_y = (ctx.module.rgn_height - self.spot_w - self.speed).max(1);
            self.pos_x = ctx.rng.rand() % max_x;
            self.pos_y = ctx.rng.rand() % max_y;
            self.dir_x = true;
            self.dir_y = true;
            self.desktop = ctx.surface.clone_surface();
        } else {
            // Keep spotlight within bounds when resized live
            let max_x = (ctx.module.rgn_width - self.buf_w).max(0);
            let max_y = (ctx.module.rgn_height - self.buf_h).max(0);
            self.pos_x = self.pos_x.clamp(0, max_x);
            self.pos_y = self.pos_y.clamp(0, max_y);
        }

        self.spot_buf = AdSurface::new(self.buf_w, self.buf_h);
        self.spot_rgn = Some(AdRegion::elliptic(
            BORDER_PAD,
            BORDER_PAD,
            BORDER_PAD + self.spot_w,
            BORDER_PAD + self.spot_h,
        ));
        self.capture_desktop = true;

        if self.desktop.is_none() || self.spot_buf.is_none() {
            AdResult::MemError
        } else {
            AdResult::NoError
        }
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:0199..1:01DE
        ctx.surface.fill_black();
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:01DF..1:02F8
        self.speed = ctx.module.control_value[1].clamp(1, 7);

        let (Some(desktop), Some(spot_buf), Some(spot_rgn)) = (
            self.desktop.as_ref(),
            self.spot_buf.as_mut(),
            self.spot_rgn.as_ref(),
        ) else {
            return AdResult::NoError;
        };

        // 1. Fill scratch buffer black (outer 10px margin stays permanently black)
        spot_buf.set_clip_region(None);
        spot_buf.fill_black();

        // 2. Clip to ellipse & copy live desktop patch
        spot_buf.set_clip_region(Some(spot_rgn));
        spot_buf.bit_blt_surface(
            BORDER_PAD,
            BORDER_PAD,
            self.spot_w,
            self.spot_h,
            desktop,
            self.pos_x + BORDER_PAD,
            self.pos_y + BORDER_PAD,
            ROP_SRCCOPY,
        );
        spot_buf.set_clip_region(None);

        // 3. Blit entire padded scratch buffer to screen (10px black margin erases previous edge)
        ctx.surface.bit_blt_surface(
            self.pos_x,
            self.pos_y,
            self.buf_w,
            self.buf_h,
            spot_buf,
            0,
            0,
            ROP_SRCCOPY,
        );

        // 4. Advance & bounce X
        if self.dir_x {
            self.pos_x += self.speed;
            if self.pos_x >= ctx.module.rgn_width - self.buf_w + self.speed {
                self.pos_x -= self.speed;
                self.dir_x = false;
            }
        } else {
            self.pos_x -= self.speed;
            if self.pos_x <= 0 {
                self.dir_x = true;
            }
        }

        // 5. Advance & bounce Y
        if self.dir_y {
            self.pos_y += self.speed;
            if self.pos_y >= ctx.module.rgn_height - self.buf_h + self.speed {
                self.pos_y -= self.speed;
                self.dir_y = false;
            }
        } else {
            self.pos_y -= self.speed;
            if self.pos_y <= 0 {
                self.dir_y = true;
            }
        }

        AdResult::NoError
    }

    fn do_close(&mut self, _ctx: &mut AdContext<'_>) -> AdResult {
        // 1:02F9..1:0381
        if self.capture_desktop {
            self.desktop = None;
        }
        self.spot_buf = None;
        self.spot_rgn = None;
        AdResult::NoError
    }

    fn do_button_message(&mut self, control_index: usize) -> AdResult {
        // 1:03AA..1:03F2: preserve desktop across Size-slider restart in Demo mode
        if control_index == 0 {
            self.capture_desktop = false;
            self.spot_buf = None;
            self.spot_rgn = None;
            AdResult::RestartMe
        } else {
            AdResult::NoError
        }
    }
}
