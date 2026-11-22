//! 1:1 Decompilation of `SHAPES.AD` ("Shapes") from After Dark 1.0a (1991).
//!
//! Disassembly-backed from `docs/disasm/shapes_seg1.asm` and `docs/disasm/shapes_data.hex`.

use ad_sdk::palette::{AdPaletteKind, rgb};
use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult, ModuleRunner};

pub struct ShapesModule;

impl ShapesModule {
    pub fn new() -> Self {
        Self
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "shapes".to_string(),
            filename: "SHAPES.AD".to_string(),
            name: "Shapes".to_string(),
            credit: "Shapes by Bill Stewart.\r\n  \u{00a9}1990 Berkeley Systems Inc.".to_string(),
            about: concat!(
                "SHAPES (tm) fills the screen with a rapid succession of geometric shapes.\r\n\r\n",
                "Original design and concept by Jack Eastman.\r\n\r\n",
                "If \"Clear Screen First\" is checked, the screen is blanked before the shapes start appearing.\r\n\r\n",
                "Use the \"Color\" check box to select color or black & white shapes."
            )
            .to_string(),
            controls: [
                AdControl::Checkbox {
                    title: "Clear Screen First".to_string(),
                    default_checked: false,
                },
                AdControl::Checkbox {
                    title: "Color".to_string(),
                    default_checked: true,
                },
                AdControl::None,
                AdControl::None,
            ],
            target_frame_ms: 40,
        }
    }
}

impl Default for ShapesModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for ShapesModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:0026..1:0083
        if ctx.module.control_value[0] != 0 {
            ctx.surface.fill_black();
        }
        if ctx.module.control_value[1] != 0 {
            AdResult::PaletteRequest(AdPaletteKind::Rgb)
        } else {
            AdResult::PaletteRequest(AdPaletteKind::White)
        }
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:0084..1:020F
        let color = if ctx.system.bits_per_pixel == 1 || ctx.module.control_value[1] == 0 {
            let g = (ctx.rng.rand() % 255) as u8;
            rgb(g, g, g)
        } else {
            // Exact MSC 6.0 evaluation order of PALETTERGB(rand()%255, rand()%255, rand()%255): B, R, G
            let b = (ctx.rng.rand() % 255) as u8;
            let r = (ctx.rng.rand() % 255) as u8;
            let g = (ctx.rng.rand() % 255) as u8;
            rgb(r, g, b)
        };

        let w = ctx.module.rgn_width.max(2);
        let h = ctx.module.rgn_height.max(2);

        let x1 = (ctx.rng.rand() % (w + 80)) - 100;
        let y1 = (ctx.rng.rand() % (h + 80)) - 100;
        let x2 = (ctx.rng.rand() % (w / 2).max(1)) + x1;
        let y2 = (ctx.rng.rand() % (h / 2).max(1)) + y1;

        if (ctx.rng.rand() % 100) < 50 {
            ctx.surface.ellipse(x1, y1, x2, y2, None, Some(color));
        } else {
            ctx.surface.rectangle(x1, y1, x2, y2, None, Some(color));
        }

        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:0210..1:0260
        if ctx.system.runner == ModuleRunner::AfterDark {
            ctx.surface.fill_black();
        }
        AdResult::NoError
    }
}
