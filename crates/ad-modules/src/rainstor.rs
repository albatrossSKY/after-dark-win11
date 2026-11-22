//! 1:1 Decompilation of `RAINSTOR.AD` ("Rain Storm") from After Dark 1.0a (1991).
//!
//! Disassembly-backed from `docs/disasm/rainstor_seg1.asm` and `docs/disasm/rainstor_data.hex`.

use ad_sdk::palette::rgb;
use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

const MAX_DROPS: usize = 100;

#[derive(Debug, Clone, Copy, Default)]
struct StormDrop {
    x: i32,
    y: i32,
    len_x: i32,
    len_y: i32,
    vel_y: i32,
    vel_x: i32,
}

pub struct RainStormModule {
    n_drops: usize,
    strength: i32,
    wind_slope: i32,
    lightning_counter: i32,
    flash_active: bool,
    bounds: (i32, i32, i32, i32), // (-25, -25, w + 5, h + 5)
    drops: [StormDrop; MAX_DROPS],
}

impl RainStormModule {
    pub fn new() -> Self {
        Self {
            n_drops: 45,
            strength: 60,
            wind_slope: 4,
            lightning_counter: 385,
            flash_active: false,
            bounds: (-25, -25, 645, 485),
            drops: [StormDrop::default(); MAX_DROPS],
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "rainstor".to_string(),
            filename: "RAINSTOR.AD".to_string(),
            name: "Rain Storm".to_string(),
            credit: "Rain Storm by Bruce Burkhalter.\r\n  \u{00a9}1990 Berkeley Systems Inc."
                .to_string(),
            about: concat!(
                "RAIN STORM (tm)\r\n\r\n",
                "\"Strength\" adjusts the length and speed of the raindrops.\r\n\r\n",
                "\"Lightning\" sets the frequency of lightning flashes.\r\n\r\n",
                "\"Drops\" sets the number of raindrops on screen.\r\n\r\n",
                "\"Wind\" controls the wind speed and angle of the rain.\r\n"
            )
            .to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "Strength:".to_string(),
                    default_raw: 62,
                    labels: vec![
                        "Drizzle".to_string(),
                        "Wet".to_string(),
                        "Rain".to_string(),
                        "Downpour".to_string(),
                        "Stormy".to_string(),
                    ],
                    thresholds: vec![20, 30, 40, 60, 90],
                },
                AdControl::NumericSlider {
                    title: "Lightning:".to_string(),
                    default_raw: 10,
                    unit: "%".to_string(),
                    min: 0,
                    max: 100,
                },
                AdControl::NumericSlider {
                    title: "Drops:".to_string(),
                    default_raw: 45,
                    unit: String::new(),
                    min: 5,
                    max: 100,
                },
                AdControl::LabeledSlider {
                    title: "Wind:".to_string(),
                    default_raw: 44,
                    labels: vec![
                        "Puff".to_string(),
                        "Zephyr".to_string(),
                        "Breeze".to_string(),
                        "Gusty".to_string(),
                        "Windy".to_string(),
                        "Blowing".to_string(),
                        "Gale".to_string(),
                        "Hurricane".to_string(),
                    ],
                    thresholds: vec![10, 20, 30, 40, 50, 60, 70, 80],
                },
            ],
            target_frame_ms: 33,
        }
    }

    #[inline]
    fn rand_range(ctx: &mut AdContext<'_>, low: i32, high: i32) -> i32 {
        // 1:05D4..1:05FC: [low, high)
        let span = (high - low).max(1);
        (ctx.rng.rand() % span) + low
    }

    fn respawn_drop(&self, ctx: &mut AdContext<'_>) -> StormDrop {
        let w = ctx.module.rgn_width.max(1);
        let h = ctx.module.rgn_height.max(1);
        let len_y = Self::rand_range(ctx, 1, self.strength + 11);
        let len_x = len_y * self.wind_slope;
        let vel_y = Self::rand_range(ctx, 20, self.strength * 2 + 21);
        let vel_x = vel_y * self.wind_slope;
        let x = Self::rand_range(ctx, -25, w + 5);
        let y = Self::rand_range(ctx, -25, h + 5);
        StormDrop {
            x,
            y,
            len_x,
            len_y,
            vel_y,
            vel_x,
        }
    }
}

impl Default for RainStormModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for RainStormModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:0012..1:01E8
        let w = ctx.module.rgn_width.max(1);
        let h = ctx.module.rgn_height.max(1);

        self.lightning_counter = 425 - (ctx.module.control_value[1] * 4);
        self.flash_active = false;
        self.n_drops = (ctx.module.control_value[2].clamp(1, MAX_DROPS as i32)) as usize;
        self.bounds = (-25, -25, w + 5, h + 5);
        self.strength = ctx.module.control_value[0].max(0);

        self.wind_slope = match ctx.module.control_value[3] {
            0 => 0,
            10 => 1,
            20 => 2,
            30 => 3,
            40 => 4,
            50 => 5,
            60 => 6,
            70 => 7,
            _ => 8,
        };
        if (ctx.rng.rand() % 2) != 0 {
            self.wind_slope = -self.wind_slope;
        }

        // Original initializes 0..99 (leaves slot 99 zeroed)
        self.drops = [StormDrop::default(); MAX_DROPS];
        for i in 0..99 {
            self.drops[i] = self.respawn_drop(ctx);
            let _gray = ctx.rng.rand() % 255; // exact RNG advance from 1:0193
        }
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.surface.fill_black();
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:02A4..1:051E
        let w = ctx.module.rgn_width.max(1);
        let h = ctx.module.rgn_height.max(1);

        // Complete the second half of the 1-frame lightning flash before erasing/drawing drops
        if self.flash_active {
            ctx.surface.invert_rect(0, 0, w, h);
            self.flash_active = false;
        }

        // Update & draw drops
        let (bl, bt, br, bb) = self.bounds;
        for i in 0..self.n_drops {
            // Erase previous streak with BLACK_PEN
            let d = self.drops[i];
            ctx.surface
                .line(d.x, d.y, d.x + d.len_x, d.y + d.len_y, 1, rgb(0, 0, 0));

            // Advance position
            self.drops[i].y += d.vel_y;
            self.drops[i].x += d.vel_x;

            // Random grayscale 1..=255 (0 remaps to 255)
            let mut g = (ctx.rng.rand() % 255) as u8;
            if g == 0 {
                g = 255;
            }

            // Respawn if outside rBounds (Win16 PtInRect: left <= x < right && top <= y < bottom)
            let nx = self.drops[i].x;
            let ny = self.drops[i].y;
            if !(nx >= bl && nx < br && ny >= bt && ny < bb) {
                self.drops[i] = self.respawn_drop(ctx);
            }

            let cur = self.drops[i];
            ctx.surface.line(
                cur.x,
                cur.y,
                cur.x + cur.len_x,
                cur.y + cur.len_y,
                1,
                rgb(g, g, g),
            );
        }

        // Lightning flash check (post-decrement)
        let prev = self.lightning_counter;
        self.lightning_counter -= 1;
        if prev == 0 && ctx.module.control_value[1] != 0 {
            ctx.surface.invert_rect(0, 0, w, h);
            self.flash_active = true;
            self.lightning_counter = 425 - (ctx.module.control_value[1] * 4);
        }

        AdResult::NoError
    }

    fn do_button_message(&mut self, control_index: usize) -> AdResult {
        // 1:022F..1:027B
        match control_index {
            0 | 2 | 3 => AdResult::RestartMe,
            1 => {
                self.lightning_counter = 1;
                AdResult::NoError
            }
            _ => AdResult::NoError,
        }
    }
}
