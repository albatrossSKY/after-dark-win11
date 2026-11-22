//! 1:1 Decompilation of `ZOT.AD` ("Zot!") from After Dark 1.0a (1991).
//!
//! Disassembly-backed from `docs/disasm/zot_seg1.asm` and `docs/disasm/zot_data.hex`.

use ad_sdk::palette::rgb;
use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

const MAX_BOLT_SEGS: usize = 100;
const MAX_FORK_SEGS: usize = 200;
const STEP_DIVISOR: i32 = 40;

#[derive(Debug, Clone, Copy, Default)]
struct BoltSeg {
    x1: i32,
    y1: i32,
    x2: i32,
    y2: i32,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
enum FlashPhase {
    Idle,
    SingleHold(u8),
    DoubleFirstHold(u8),
    DoubleGap(u8),
    DoubleSecondHold(u8),
}

pub struct ZotModule {
    fork_stop_chance: i32,
    strike_chance: i32,
    bolt_segs: Vec<BoltSeg>,
    fork_segs: Vec<BoltSeg>,
    last_bolt_idx: usize,
    last_fork_idx: usize,
    phase: FlashPhase,
}

impl ZotModule {
    pub fn new() -> Self {
        Self {
            fork_stop_chance: 12,
            strike_chance: 31,
            bolt_segs: Vec::with_capacity(MAX_BOLT_SEGS),
            fork_segs: Vec::with_capacity(MAX_FORK_SEGS),
            last_bolt_idx: 0,
            last_fork_idx: 0,
            phase: FlashPhase::Idle,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "zot".to_string(),
            filename: "ZOT.AD".to_string(),
            name: "Zot!".to_string(),
            credit: "Zot! by Bill Stewart & Wes Boyd.\r\n  \u{00a9}1990 Berkeley Systems Inc."
                .to_string(),
            about: concat!(
                "ZOT! (tm) creates jagged bolts of lightning on your screen.\r\n\r\n",
                "\"Forkiness\" sets how many forks branch from the main bolt.\r\n\r\n",
                "\"How Often\" controls how often lightning strikes.\r\n"
            )
            .to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "Forkiness:".to_string(),
                    default_raw: 50,
                    labels: vec![
                        "Few".to_string(),
                        "Forky".to_string(),
                        "Max Forky!".to_string(),
                    ],
                    thresholds: vec![33, 67, 100],
                },
                AdControl::None,
                AdControl::LabeledSlider {
                    title: "How Often:".to_string(),
                    default_raw: 62,
                    labels: vec![
                        "Rarely".to_string(),
                        "Sometimes".to_string(),
                        "Often".to_string(),
                        "Stormy!".to_string(),
                    ],
                    thresholds: vec![25, 50, 75, 100],
                },
                AdControl::None,
            ],
            target_frame_ms: 33,
        }
    }

    fn sync_controls(&mut self, ctx: &AdContext<'_>) {
        // 1:001C..1:0056 & 1:010E..1:0165
        self.fork_stop_chance = (75 - ctx.module.control_value[0]) / 2;
        let mut sc = ctx.module.control_value[2] / 2;
        if sc < 10 {
            sc = 10;
        }
        if sc >= 80 {
            sc *= 2;
        }
        self.strike_chance = sc;
    }

    fn generate_bolt(&mut self, ctx: &mut AdContext<'_>) -> bool {
        // 1:01EE..1:0492: exact 1:1 main bolt + fork generator
        let w = ctx.module.rgn_width.max(2);
        let h = ctx.module.rgn_height.max(2);

        self.bolt_segs.clear();
        self.fork_segs.clear();
        self.last_bolt_idx = 0;
        self.last_fork_idx = 0;

        let mut x1 = ctx.rng.rand() % w;
        let mut y1 = 0;
        let mut main_dir = if (ctx.rng.rand() % 100) < 50 { 0 } else { 1 };

        while x1 > 0 && x1 < w && self.last_bolt_idx < MAX_BOLT_SEGS - 1 {
            let mut dx = (ctx.rng.rand() % w) / STEP_DIVISOR;
            let dy = (ctx.rng.rand() % h) / STEP_DIVISOR;
            if main_dir != 0 {
                dx = -dx;
            }
            let mut x2 = x1 + dx;
            let y2 = y1 + dy;
            if y2 > h {
                break;
            }
            if x2 <= 0 || x2 >= w {
                x2 = x1 - dx;
                main_dir = if main_dir == 0 { 1 } else { 0 };
            }
            self.last_bolt_idx = self.bolt_segs.len();
            self.bolt_segs.push(BoltSeg { x1, y1, x2, y2 });
            x1 = x2;
            y1 = y2;

            // 10% chance to spawn a fork
            if (ctx.rng.rand() % 100) < 10 {
                let mut fx1 = x2;
                let mut fy1 = y2;
                let mut fork_dir = if (ctx.rng.rand() % 100) < 50 { 0 } else { 1 };

                while fx1 > 0 && fx1 < w && self.last_fork_idx < MAX_FORK_SEGS - 1 {
                    let mut fdx = (ctx.rng.rand() % w) / STEP_DIVISOR;
                    let fdy = (ctx.rng.rand() % h) / STEP_DIVISOR;
                    if fork_dir != 0 {
                        fdx = -fdx;
                    }
                    let mut fx2 = fx1 + fdx;
                    let fy2 = fy1 + fdy;
                    if fy2 > h {
                        break;
                    }
                    if fx2 <= 0 || fx2 >= w {
                        fx2 = fx1 - fdx;
                        fork_dir = if fork_dir == 0 { 1 } else { 0 };
                    }
                    self.last_fork_idx = self.fork_segs.len();
                    self.fork_segs.push(BoltSeg {
                        x1: fx1,
                        y1: fy1,
                        x2: fx2,
                        y2: fy2,
                    });
                    fx1 = fx2;
                    fy1 = fy2;

                    if (ctx.rng.rand() % 100) < self.fork_stop_chance {
                        break;
                    }
                }
            }
        }

        !self.bolt_segs.is_empty()
    }

    fn draw_bolt(&self, ctx: &mut AdContext<'_>) {
        // 1:0624..1:0755: main bolt WHITE, forks GRAY (RGB 128,128,128) on color displays
        // Original draws 0..last_bolt_idx and 0..last_fork_idx (strictly <)
        let bolt_n = self.last_bolt_idx.min(self.bolt_segs.len());
        for seg in &self.bolt_segs[..bolt_n] {
            ctx.surface
                .line(seg.x1, seg.y1, seg.x2, seg.y2, 1, rgb(255, 255, 255));
        }
        let fork_col = if ctx.system.bits_per_pixel > 1 {
            rgb(128, 128, 128)
        } else {
            rgb(255, 255, 255)
        };
        let fork_n = self.last_fork_idx.min(self.fork_segs.len());
        for seg in &self.fork_segs[..fork_n] {
            ctx.surface
                .line(seg.x1, seg.y1, seg.x2, seg.y2, 1, fork_col);
        }
    }

    fn erase_bolt(&self, ctx: &mut AdContext<'_>) {
        // 1:0525..1:0623: erases 0..=last_bolt_idx and 0..=last_fork_idx
        for seg in &self.bolt_segs {
            ctx.surface
                .line(seg.x1, seg.y1, seg.x2, seg.y2, 1, rgb(0, 0, 0));
        }
        for seg in &self.fork_segs {
            ctx.surface
                .line(seg.x1, seg.y1, seg.x2, seg.y2, 1, rgb(0, 0, 0));
        }
    }
}

impl Default for ZotModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for ZotModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:0012..1:0060
        self.sync_controls(ctx);
        self.phase = FlashPhase::Idle;
        self.bolt_segs.clear();
        self.fork_segs.clear();
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.surface.fill_black();
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.sync_controls(ctx);

        match self.phase {
            FlashPhase::Idle => {
                // Original PeekMessage loop called DoDrawFrame ~1000 times/sec;
                // run 30 strike trials per 30 Hz tick for authentic 1991 cadence.
                let mut struck = false;
                for _ in 0..30 {
                    if (ctx.rng.rand() % 20000) < self.strike_chance {
                        struck = true;
                        break;
                    }
                }
                if struck && self.generate_bolt(ctx) {
                    self.draw_bolt(ctx);
                    if (ctx.rng.rand() % 100) < 50 {
                        // Double flash (DelayLoop 300 / 200 / 200)
                        self.phase = FlashPhase::DoubleFirstHold(2);
                    } else {
                        // Single long flash (DelayLoop 100000 -> ~165ms)
                        self.phase = FlashPhase::SingleHold(5);
                    }
                }
            }
            FlashPhase::SingleHold(n) => {
                if n <= 1 {
                    self.erase_bolt(ctx);
                    self.phase = FlashPhase::Idle;
                } else {
                    self.phase = FlashPhase::SingleHold(n - 1);
                }
            }
            FlashPhase::DoubleFirstHold(n) => {
                if n <= 1 {
                    self.erase_bolt(ctx);
                    self.phase = FlashPhase::DoubleGap(2);
                } else {
                    self.phase = FlashPhase::DoubleFirstHold(n - 1);
                }
            }
            FlashPhase::DoubleGap(n) => {
                if n <= 1 {
                    self.draw_bolt(ctx);
                    self.phase = FlashPhase::DoubleSecondHold(2);
                } else {
                    self.phase = FlashPhase::DoubleGap(n - 1);
                }
            }
            FlashPhase::DoubleSecondHold(n) => {
                if n <= 1 {
                    self.erase_bolt(ctx);
                    self.phase = FlashPhase::Idle;
                } else {
                    self.phase = FlashPhase::DoubleSecondHold(n - 1);
                }
            }
        }

        AdResult::NoError
    }
}
