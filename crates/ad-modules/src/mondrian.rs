//! 1:1 Decompilation of `MONDRIAN.AD` ("Mondrian") from After Dark 1.0a (1991).
//!
//! Disassembly-backed from `docs/disasm/mondrian_seg1.asm` and `docs/disasm/mondrian_data.hex`.

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

const MAX_RECTS: usize = 200;
const MIN_POP_THRESHOLD: usize = 50;

pub struct MondrianModule {
    clear_screen_first: bool,
    frame_counter: i32,
    frame_delay: i32,
    rects: Vec<(i32, i32, i32, i32)>,
}

impl MondrianModule {
    pub fn new() -> Self {
        Self {
            clear_screen_first: false,
            frame_counter: 0,
            frame_delay: 70,
            rects: Vec::with_capacity(MAX_RECTS),
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "mondrian".to_string(),
            filename: "MONDRIAN.AD".to_string(),
            name: "Mondrian".to_string(),
            credit: "Mondrian by Bill Stewart & Wes Boyd.\r\n  \u{00a9}1990 Berkeley Systems Inc."
                .to_string(),
            about: concat!(
                "MONDRIAN (tm) inverts random parts of your screen, providing screen-saving while ",
                "still showing the Windows desktop.\r\n\r\n",
                "The \"Speed\" slider controls how fast the inversions appear.\r\n\r\n",
                "Checking \"Clear Screen First\" will black out the monitor before the inversions appear."
            )
            .to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "Speed".to_string(),
                    default_raw: 37,
                    labels: vec![
                        "Slow".to_string(),
                        "Medium".to_string(),
                        "Fast".to_string(),
                        "Very Fast!".to_string(),
                    ],
                    thresholds: vec![25, 50, 75, 100],
                },
                AdControl::Checkbox {
                    title: "Clear Screen First".to_string(),
                    default_checked: false,
                },
                AdControl::None,
                AdControl::None,
            ],
            target_frame_ms: 16,
        }
    }

    fn map_delay(val: i32) -> i32 {
        // 1:0028..1:0065
        match val {
            0 => 140,
            25 => 70,
            50 => 30,
            75 | 100 => 0,
            _ => {
                if val < 25 {
                    140
                } else if val < 50 {
                    70
                } else if val < 75 {
                    30
                } else {
                    0
                }
            }
        }
    }
}

impl Default for MondrianModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for MondrianModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:0012..1:007A
        self.frame_counter = 0;
        self.frame_delay = Self::map_delay(ctx.module.control_value[0]);
        self.clear_screen_first = ctx.module.control_value[1] != 0;
        self.rects.clear();
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:007B..1:00C7: only blanks when "Clear Screen First" is checked!
        if self.clear_screen_first {
            ctx.surface.fill_black();
        }
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:00C8..1:01A3
        // Sync speed live in Demo mode (matches DoButtonMessage 1:020A)
        self.frame_delay = Self::map_delay(ctx.module.control_value[0]);

        // Original AD.EXE ran DoDrawFrame inside a ~250 Hz PeekMessage idle loop;
        // stepping frame_counter by 4 per 60 Hz tick reproduces exact 1991 cadence.
        self.frame_counter += 4;
        if self.frame_counter < self.frame_delay {
            return AdResult::NoError;
        }
        self.frame_counter = 0;

        let w = ctx.module.rgn_width.max(1);
        let h = ctx.module.rgn_height.max(1);

        // Exact RNG order: coin first, always consumed
        let coin = ctx.rng.rand() % 2;
        if self.rects.len() < MAX_RECTS && (self.rects.len() < MIN_POP_THRESHOLD || coin != 0) {
            // Exact rand() order: left, right, top, bottom (unsorted!)
            let left = ctx.rng.rand() % w;
            let right = ctx.rng.rand() % w;
            let top = ctx.rng.rand() % h;
            let bottom = ctx.rng.rand() % h;
            self.rects.push((left, top, right, bottom));
            ctx.surface.invert_rect(left, top, right, bottom);
        } else if let Some((left, top, right, bottom)) = self.rects.pop() {
            ctx.surface.invert_rect(left, top, right, bottom);
        }

        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:01A4..1:01E1: un-invert all stacked rects in LIFO order
        while let Some((left, top, right, bottom)) = self.rects.pop() {
            ctx.surface.invert_rect(left, top, right, bottom);
        }
        AdResult::NoError
    }
}
