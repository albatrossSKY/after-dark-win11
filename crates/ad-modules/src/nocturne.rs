//! Exact 1:1 decompilation of After Dark 1.0a's **Nocturnes** module
//! (`NOCTURNE.AD`, `SEG 1`, `0x0000..0x06F5`, by Jon Steinmetz and Mouse Herrell, ©1990 Berkeley Systems Inc.).

use ad_sdk::canvas::AdBitmap;
use ad_sdk::palette::rgb;
use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult, MsvcRand};

/// Exact original 102×80 1bpp `"EYES"` sprite sheet (`RT_BITMAP #1` from `NOCTURNE.AD`).
const BMP_EYES: &[u8] = include_bytes!("../../../assets/nocturne/RT_BITMAP_#1.bmp");

/// Exact `DSPDxax` ROP3 (`0x00E20746`) used in `NOCTURNE.C` (`1:05CD`).
const ROP_DSPDXAX: u32 = 0x00E2_0746;

/// Exact 7-color table `crColors[7]` (`NOCTURNE.AD` `DS:0x0014..0x002F`).
const CR_COLORS: [u32; 7] = [
    rgb(255, 255, 255), // 0: White
    rgb(255, 0, 0),     // 1: Red
    rgb(0, 255, 0),     // 2: Green
    rgb(0, 0, 255),     // 3: Blue
    rgb(0, 255, 255),   // 4: Cyan
    rgb(255, 255, 0),   // 5: Yellow
    rgb(255, 0, 255),   // 6: Magenta
];

#[derive(Debug, Clone, Copy)]
struct EyeSlot {
    blinks_left: i16,
    eye_type: i16, // 0..4 (srcY = eye_type * 16)
    frame: i16,    // 0..2 (srcX = frame * 32), 3 = closed/black
    state: i16,    // 0 = OPENING, 1 = HOLDING_OPEN, 2 = CLOSING
    last_tick: u64,
    delay_ms: u64,
    free: bool,
    needs_draw: bool,
    color: u32,
    left: i32,
    top: i32,
    right: i32,
    bottom: i32,
}

impl Default for EyeSlot {
    fn default() -> Self {
        Self {
            blinks_left: 0,
            eye_type: 0,
            frame: 3,
            state: 0,
            last_tick: 0,
            delay_ms: 83,
            free: true,
            needs_draw: false,
            color: rgb(255, 255, 255),
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
        }
    }
}

pub struct NocturneModule {
    eyes_bmp: Option<AdBitmap>,
    slots: [EyeSlot; 10],
    last_spawn_tick: i64,
    spawn_delay_ms: i64,
}

impl NocturneModule {
    pub fn new() -> Self {
        Self {
            eyes_bmp: None,
            slots: [EyeSlot::default(); 10],
            last_spawn_tick: 0,
            spawn_delay_ms: 0,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "nocturne".to_string(),
            filename: "NOCTURNE.AD".to_string(),
            name: "Nocturnes".to_string(),
            credit: "Nocturnes by Jon Steinmetz and Mouse Herrell.\r\n  ©1990 Berkeley Systems Inc."
                .to_string(),
            about: "NOCTURNES (tm)\r\n\r\nLions and tigers and bears, oh my!".to_string(),
            controls: [
                AdControl::None,
                AdControl::None,
                AdControl::Checkbox {
                    title: "Color".to_string(),
                    default_checked: true,
                },
                AdControl::LabeledSlider {
                    title: "Density".to_string(),
                    default_raw: 100,
                    labels: vec![
                        "Sparse".into(),
                        "A few".into(),
                        "A bunch".into(),
                        "Lots".into(),
                    ],
                    thresholds: vec![25, 50, 75, 100],
                },
            ],
            // Nocturnes is purely timestamp-driven (83ms animation ticks, 1000..4000ms holds)
            target_frame_ms: 16,
        }
    }

    /// Exact replica of `NOCTURNE.C` `RandRange(lo, hi)` (`1:06AB`).
    fn rand_range(rng: &mut MsvcRand, lo: i32, hi: i32) -> i32 {
        let s_lo = lo.min(hi);
        let s_range = hi - lo;
        if s_range == 0 {
            return lo;
        }
        (rng.rand() % s_range) + s_lo
    }

    #[inline]
    fn rects_overlap(a: &EyeSlot, left: i32, top: i32, right: i32, bottom: i32) -> bool {
        a.top < bottom && top < a.bottom && right > a.left && a.right > left
    }

    fn overlaps_any(&self, left: i32, top: i32, right: i32, bottom: i32) -> bool {
        self.slots
            .iter()
            .any(|e| !e.free && Self::rects_overlap(e, left, top, right, bottom))
    }

    fn spawn_eye(&mut self, idx: usize, ctx: &mut AdContext<'_>) {
        let w = ctx.module.rgn_width;
        let h = ctx.module.rgn_height;
        if w <= 32 || h <= 16 {
            return;
        }
        // Exact original RandRange order: top (Y) first, then left (X)
        let top = Self::rand_range(ctx.rng, 0, h - 16);
        let left = Self::rand_range(ctx.rng, 0, w - 32);
        let bottom = top + 16;
        let right = left + 32;

        if self.overlaps_any(left, top, right, bottom) {
            return;
        }

        let eye_type = Self::rand_range(ctx.rng, 0, 5) as i16;
        let blinks_left = Self::rand_range(ctx.rng, 1, 6) as i16;
        let color = if ctx.system.bits_per_pixel > 1 && ctx.module.control_value[2] != 0 {
            let cidx = Self::rand_range(ctx.rng, 0, 7).clamp(0, 6) as usize;
            CR_COLORS[cidx]
        } else {
            rgb(255, 255, 255)
        };

        self.slots[idx] = EyeSlot {
            blinks_left,
            eye_type,
            frame: 3,
            state: 0, // OPENING
            last_tick: ctx.elapsed_ms,
            delay_ms: 83,
            free: false,
            needs_draw: true,
            color,
            left,
            top,
            right,
            bottom,
        };
    }

    fn draw_eye(&mut self, idx: usize, ctx: &mut AdContext<'_>) {
        self.slots[idx].needs_draw = false;
        let eye = self.slots[idx];
        if eye.frame == 3 {
            ctx.surface
                .fill_rect_rgb(eye.left, eye.top, eye.right, eye.bottom, rgb(0, 0, 0));
        } else if let Some(bmp) = self.eyes_bmp.as_ref() {
            // Exact Win16 mono->color BitBlt with DSPDxax (0x00E20746) & default TextColor=Black / BkColor=White
            ctx.surface.set_text_color(rgb(0, 0, 0));
            ctx.surface.set_bk_color(rgb(255, 255, 255));
            ctx.surface.bit_blt_bitmap_with_brush(
                eye.left,
                eye.top,
                32,
                16,
                bmp,
                (eye.frame as i32) << 5,
                (eye.eye_type as i32) << 4,
                eye.color,
                ROP_DSPDXAX,
            );
        }
    }

    fn erase_eye(slot: &mut EyeSlot, ctx: &mut AdContext<'_>) {
        ctx.surface
            .fill_rect_rgb(slot.left, slot.top, slot.right, slot.bottom, rgb(0, 0, 0));
        slot.free = true;
        slot.needs_draw = false;
    }
}

impl Default for NocturneModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for NocturneModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        for slot in &mut self.slots {
            slot.free = true;
            slot.needs_draw = false;
        }
        self.eyes_bmp = AdBitmap::from_bmp_bytes(BMP_EYES);
        if self.eyes_bmp.is_none() {
            return AdResult::MemError;
        }
        self.last_spawn_tick = -1;
        self.spawn_delay_ms = 0;
        // Original DoInitialize reseeds rand() from GetTickCount() & 0xFFFF
        let salt = ctx.rng.rand() as u16;
        ctx.rng.srand((ctx.elapsed_ms as u16).wrapping_add(salt));
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.surface.fill_black();
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        let now = ctx.elapsed_ms;

        // Phase 1: Draw all dirty eyes first
        for i in 0..10 {
            if self.slots[i].needs_draw {
                self.draw_eye(i, ctx);
            }
        }

        // Phase 2: Spawn check
        if (now as i64) - self.last_spawn_tick > self.spawn_delay_ms {
            for i in 0..10 {
                if self.slots[i].free {
                    let density = ctx.module.control_value[3].clamp(0, 100);
                    let max_sec = ((100 - density) / 25) + 1;
                    self.spawn_delay_ms = (Self::rand_range(ctx.rng, 1, max_sec) as i64) * 1000;
                    self.last_spawn_tick = now as i64;
                    self.spawn_eye(i, ctx);
                    break;
                }
            }
        }

        // Phase 3: Advance animation state machine
        for i in 0..10 {
            if self.slots[i].free {
                continue;
            }
            if now.saturating_sub(self.slots[i].last_tick) <= self.slots[i].delay_ms {
                continue;
            }

            let mut cur = self.slots[i];
            cur.last_tick = now;

            match cur.state {
                0 => {
                    // OPENING: 3 -> 2 -> 1 -> 0 -> [-1 => HOLDING_OPEN]
                    cur.delay_ms = 83;
                    cur.frame -= 1;
                    if cur.frame >= 0 {
                        cur.needs_draw = true;
                    } else {
                        cur.frame = 1;
                        cur.state = 1;
                        cur.delay_ms = Self::rand_range(ctx.rng, 1000, 4000) as u64;
                    }
                }
                1 => {
                    // HOLDING_OPEN -> CLOSING
                    cur.state = 2;
                    cur.needs_draw = true;
                    cur.delay_ms = 83;
                }
                2 => {
                    // CLOSING: 1 -> 2 -> 3 -> [4 => next blink or erase]
                    cur.delay_ms = 83;
                    cur.frame += 1;
                    if cur.frame <= 3 {
                        cur.needs_draw = true;
                    } else if cur.blinks_left < 0 {
                        Self::erase_eye(&mut cur, ctx);
                    } else {
                        cur.blinks_left -= 1;
                        cur.state = 0;
                        cur.frame = 3;
                        cur.needs_draw = true;
                    }
                }
                _ => {}
            }

            self.slots[i] = cur;
        }

        AdResult::NoError
    }

    fn do_close(&mut self, _ctx: &mut AdContext<'_>) -> AdResult {
        self.eyes_bmp = None;
        for slot in &mut self.slots {
            slot.free = true;
            slot.needs_draw = false;
        }
        AdResult::NoError
    }
}
