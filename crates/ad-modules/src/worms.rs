//! 1:1 Decompilation of `WORMS.AD` ("Can of Worms") from After Dark 1.0a (1991).
//!
//! Disassembly-backed from `docs/disasm/worms_seg1.asm` and `docs/disasm/worms_data.hex`.

use ad_sdk::canvas::{AdSurface, ROP_SRCAND};
use ad_sdk::palette::rgb;
use ad_sdk::sound::{AdSound, Tone};
use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

const ROP_DSPDXAX: u32 = 0x00E2_0746;

/// 24-direction perimeter-of-7x7-square delta table (`1:0744..1:08A5`).
const DIR_DX: [i32; 24] = [
    3, 3, 3, 3, 2, 1, 0, -1, -2, -3, -3, -3, -3, -3, -3, -3, -2, -1, 0, 1, 2, 3, 3, 3,
];
const DIR_DY: [i32; 24] = [
    0, -1, -2, -3, -3, -3, -3, -3, -3, -3, -2, -1, 0, 1, 2, 3, 3, 3, 3, 3, 3, 3, 2, 1,
];

/// 6-color worm palette (`1:08B1..1:0910`).
const WORM_COLORS: [u32; 6] = [
    rgb(255, 0, 0),   // Red
    rgb(255, 0, 255), // Magenta
    rgb(0, 0, 255),   // Blue
    rgb(0, 255, 255), // Cyan
    rgb(0, 255, 0),   // Green
    rgb(255, 255, 0), // Yellow
];

#[derive(Debug, Clone, Copy, Default, PartialEq, Eq)]
struct SegRect {
    left: i32,
    top: i32,
    right: i32,
    bottom: i32,
}

impl SegRect {
    #[inline]
    fn offset(&mut self, dx: i32, dy: i32) {
        self.left += dx;
        self.top += dy;
        self.right += dx;
        self.bottom += dy;
    }

    #[inline]
    fn is_empty(&self) -> bool {
        self.left >= self.right || self.top >= self.bottom
    }

    #[inline]
    fn contained_in(&self, bounds: SegRect) -> bool {
        self.left >= bounds.left
            && self.top >= bounds.top
            && self.right <= bounds.right
            && self.bottom <= bounds.bottom
    }
}

#[derive(Debug, Clone, Copy)]
struct Worm {
    segs: [SegRect; 21],
    dir: i32,
    head: usize,
    color: u32,
}

impl Default for Worm {
    fn default() -> Self {
        Self {
            segs: [SegRect::default(); 21],
            dir: 0,
            head: 0,
            color: rgb(255, 0, 0),
        }
    }
}

pub struct WormsModule {
    wiggle: i32,
    bounds: SegRect,
    delta_x: i32,
    delta_y: i32,
    worms: [Worm; 20],
    prev_head: [usize; 20],
    worm_sheet: Option<AdSurface>,
    sound_ascending: bool,
    next_sound_ms: u64,
}

impl WormsModule {
    pub fn new() -> Self {
        Self {
            wiggle: 3,
            bounds: SegRect::default(),
            delta_x: 3,
            delta_y: 0,
            worms: [Worm::default(); 20],
            prev_head: [0; 20],
            worm_sheet: None,
            sound_ascending: false,
            next_sound_ms: 0,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "worms".to_string(),
            filename: "WORMS.AD".to_string(),
            name: "Can of Worms".to_string(),
            credit: "Can of Worms by Tracy Elmore.\n©1990 Berkeley Systems Inc.".to_string(),
            about: "CAN OF WORMS (tm)\n\nThese creepy crawlers can be set to eat away the screen that you have been working in.\n\nSet the number of worms and the number of segments. This module contains screen munching sound.\n\nOriginal design and concept by Jack Eastman.".to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "Wiggle:".to_string(),
                    default_raw: 71,
                    labels: vec![
                        "Straight".to_string(),
                        "Weavy".to_string(),
                        "Crawly".to_string(),
                        "Wiggly".to_string(),
                    ],
                    thresholds: vec![25, 50, 75, 100],
                },
                AdControl::NumericSlider {
                    title: "Segments:".to_string(),
                    default_raw: 70,
                    unit: String::new(),
                    min: 2,
                    max: 20,
                },
                AdControl::NumericSlider {
                    title: "Worms:".to_string(),
                    default_raw: 70,
                    unit: String::new(),
                    min: 1,
                    max: 20,
                },
                AdControl::Checkbox {
                    title: "Sound".to_string(),
                    default_checked: false,
                },
            ],
            target_frame_ms: 25,
        }
    }

    fn map_wiggle(val: i32) -> i32 {
        match val / 25 {
            0 => 0,
            1 => 1,
            2 => 3,
            _ => 5,
        }
    }

    fn create_worm_sheet() -> Option<AdSurface> {
        let mut sheet = AdSurface::new(14, 6)?;
        let black = rgb(0, 0, 0);
        let white = rgb(255, 255, 255);

        sheet.fill_black();
        // Panel 0 (4x4 at x=0,y=0): white bg + black filled 4x4 ellipse (SRCAND screen-eating eraser)
        sheet.pat_blt_rgb(0, 0, 4, 4, white);
        sheet.ellipse(0, 0, 4, 4, Some(black), Some(black));

        // Panel 1 (4x4 at x=4,y=0): black bg + white outline hollow ring (DSPDxax colored ring)
        sheet.ellipse(4, 0, 8, 4, Some(white), Some(black));

        // Panel 2 (6x6 at x=8,y=0): white bg + solid black 6x6 ellipse (SRCAND 1px black outer halo)
        sheet.pat_blt_rgb(8, 0, 6, 6, white);
        sheet.ellipse(8, 0, 14, 6, Some(black), Some(black));

        Some(sheet)
    }

    fn maybe_play_sound(&mut self, ctx: &mut AdContext<'_>) {
        if ctx.module.control_value[3] == 0 || !ctx.system.sound_enabled {
            return;
        }
        if ctx.elapsed_ms < self.next_sound_ms {
            return;
        }
        let notes: [i32; 5] = if self.sound_ascending {
            self.sound_ascending = false;
            [9, 10, 11, 12, 13]
        } else {
            self.sound_ascending = true;
            [14, 13, 12, 11, 10]
        };
        let tones: Vec<Tone> = notes
            .iter()
            .map(|&n| Tone {
                freq_hz: AdSound::win16_note_to_hz(n),
                duration_ms: 38,
                volume: 0.20,
            })
            .collect();
        ctx.sound.play_tones(tones);

        // Schedule next munching burst (include ~190ms chirp duration so tones don't pile up)
        let extra = if ctx.rng.rand_mod(4) == 0 {
            ctx.rng.rand_mod(300) as u64 + 200
        } else {
            ctx.rng.rand_mod(5) as u64 + 210
        };
        self.next_sound_ms = ctx.elapsed_ms + extra;
    }
}

impl Default for WormsModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for WormsModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.wiggle = Self::map_wiggle(ctx.module.control_value[0]);
        let w = ctx.module.rgn_width.max(16);
        let h = ctx.module.rgn_height.max(16);
        self.bounds = SegRect {
            left: -5,
            top: -5,
            right: w + 5,
            bottom: h + 5,
        };

        // All 20 worms burst out of ONE shared random starting point ("Can of Worms"!)
        let start_x = ctx.rng.rand_mod(w);
        let start_y = ctx.rng.rand_mod(h);

        for worm in &mut self.worms {
            for s in 0..21 {
                worm.segs[s] = SegRect {
                    left: 0,
                    top: 0,
                    right: 4,
                    bottom: 4,
                };
            }
            worm.segs[0].offset(start_x, start_y);
            worm.dir = ctx.rng.rand_mod(24);
            worm.head = 0;
            worm.color = WORM_COLORS[ctx.rng.rand_mod(6) as usize];
        }
        self.prev_head = [0; 20];
        self.sound_ascending = false;
        self.worm_sheet = Self::create_worm_sheet();
        if self.worm_sheet.is_none() {
            return AdResult::MemError;
        }
        self.next_sound_ms = ctx.elapsed_ms + ctx.rng.rand_mod(500) as u64;
        AdResult::NoError
    }

    fn do_blank(&mut self, _ctx: &mut AdContext<'_>) -> AdResult {
        // Exact 1991 behavior (`1:0698`): NO-OP — worms crawl over and eat the live desktop!
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.wiggle = Self::map_wiggle(ctx.module.control_value[0]);
        let num_segs = (ctx.module.control_value[1] as usize).clamp(2, 20);
        let num_worms = (ctx.module.control_value[2] as usize).clamp(1, 20);

        self.maybe_play_sound(ctx);

        let Some(ref sheet) = self.worm_sheet else {
            return AdResult::NoError;
        };

        for w in 0..num_worms {
            self.prev_head[w] = self.worms[w].head;
            self.worms[w].head = (self.worms[w].head % num_segs) + 1;
            let head = self.worms[w].head;
            let prev = self.prev_head[w];

            // 1. Erase oldest tail segment -> eats screen to black via Panel 0 (SRCAND)
            let tail_rc = self.worms[w].segs[head];
            if !tail_rc.is_empty() {
                ctx.surface
                    .bit_blt_surface(tail_rc.left, tail_rc.top, 4, 4, sheet, 0, 0, ROP_SRCAND);
            }

            // 2. Random wiggle turn (+/- wiggle)
            if (ctx.rng.rand() & 1) != 0 {
                self.worms[w].dir += self.wiggle;
            } else {
                self.worms[w].dir -= self.wiggle;
            }

            // 3. Exact Win16 GetDirectionDelta quirk: signed `dir % 24` checked as unsigned `<= 23`
            let dir_rem = self.worms[w].dir % 24;
            if (0..=23).contains(&dir_rem) {
                self.delta_x = DIR_DX[dir_rem as usize];
                self.delta_y = DIR_DY[dir_rem as usize];
            }

            // 4. Advance head segment
            let mut next_rc = self.worms[w].segs[prev];
            next_rc.offset(self.delta_x, self.delta_y);
            self.worms[w].segs[head] = next_rc;

            // 5. Bounds check: revert stored head and turn +/-30 (90 deg) on edge
            let draw_rc = next_rc;
            if !draw_rc.contained_in(self.bounds) {
                self.worms[w].segs[head] = self.worms[w].segs[prev];
                if (ctx.rng.rand() & 1) != 0 {
                    self.worms[w].dir += 30;
                } else {
                    self.worms[w].dir -= 30;
                }
            }

            // 6. Draw new head: 6x6 black outer halo (SRCAND) + 4x4 colored hollow ring (DSPDxax)
            ctx.surface.bit_blt_surface(
                draw_rc.left - 1,
                draw_rc.top - 1,
                6,
                6,
                sheet,
                8,
                0,
                ROP_SRCAND,
            );
            let brush_color = if ctx.system.bits_per_pixel == 1 {
                rgb(255, 255, 255)
            } else {
                self.worms[w].color
            };
            ctx.surface.bit_blt_surface_with_brush(
                draw_rc.left,
                draw_rc.top,
                4,
                4,
                sheet,
                4,
                0,
                brush_color,
                ROP_DSPDXAX,
            );
        }

        AdResult::NoError
    }

    fn do_close(&mut self, _ctx: &mut AdContext<'_>) -> AdResult {
        self.worm_sheet = None;
        AdResult::NoError
    }
}
