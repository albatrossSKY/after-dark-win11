//! Exact 1:1 implementation of After Dark 1.0a's 4 built-in 235-entry palettes
//! (`HSV_PAL`, `RGB_PAL`, `WHITE_PAL`, `PRIMARY_PAL`) decompiled directly from `AD.EXE` SEG 13 (`13:13FE..13:1D83`).

/// Palette request codes matching `MODULE.H`.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
#[repr(i32)]
pub enum AdPaletteKind {
    Hsv = 10,     // HSV_PAL
    Rgb = 11,     // RGB_PAL
    White = 12,   // WHITE_PAL
    Primary = 13, // PRIMARY_PAL
}

/// 235-entry logical palette (matches `AD.EXE` `numEntries = 0xEB = 235`).
#[derive(Debug, Clone)]
pub struct AdPalette {
    pub kind: AdPaletteKind,
    /// RGB triples `[r, g, b]` matching `LOGPALETTE.palPalEntry[0..235]`.
    pub entries: Vec<[u8; 3]>,
}

impl AdPalette {
    pub fn build(kind: AdPaletteKind) -> Self {
        let entries = match kind {
            AdPaletteKind::Hsv => build_hsv_pal(),
            AdPaletteKind::Rgb => build_rgb_pal(),
            AdPaletteKind::White => build_white_pal(),
            AdPaletteKind::Primary => build_primary_pal(),
        };
        Self { kind, entries }
    }

    /// Returns Win32 `COLORREF` (`0x00BBGGRR`) for palette index `idx`.
    #[inline]
    pub fn colorref(&self, idx: usize) -> u32 {
        let [r, g, b] = self.entries[idx % self.entries.len()];
        rgb(r, g, b)
    }
}

#[inline]
pub const fn rgb(r: u8, g: u8, b: u8) -> u32 {
    (r as u32) | ((g as u32) << 8) | ((b as u32) << 16)
}

/// Exact integer HSV->RGB conversion from `AD.EXE` `13:13FE..13:15C6`.
/// `h`: 0..=65535, `s`: 0..=65535, `v`: 0..=255 -> `[r, g, b]`.
fn ad_hsv_to_rgb(h: u16, s: u16, v: u16) -> [u8; 3] {
    let p_wide = (v as u32) * (0x10000u32 - (s as u32));
    let p = (p_wide >> 16) as u16;
    let delta = v.wrapping_sub(p) as u32;

    let (r, g, b) = if h <= 0x2AAA {
        let g = (((h as u32) * delta) / 0x2AAA) as u16 + p;
        (v, g, p)
    } else if h <= 0x5555 {
        let r = v.wrapping_sub((((h - 0x2AAA) as u32 * delta) / 0x2AAB) as u16);
        (r, v, p)
    } else if h <= 0x7FFF {
        let b = (((h - 0x5555) as u32 * delta) / 0x2AAA) as u16 + p;
        (p, v, b)
    } else if h <= 0xAAAA {
        let g = v.wrapping_sub((((h - 0x7FFF) as u32 * delta) / 0x2AAB) as u16);
        (p, g, v)
    } else if h <= 0xD554 {
        let r = (((h - 0xAAAA) as u32 * delta) / 0x2AAA) as u16 + p;
        (r, p, v)
    } else {
        let b = v.wrapping_sub((((h - 0xD554) as u32 * delta) / 0x2AAB) as u16);
        (v, p, b)
    };
    [r as u8, g as u8, b as u8]
}

/// `HSV_PAL` (`AD.EXE` `13:16B1..13:17FC`): 235 rainbow entries (`h` starts at `0x217`, step `0x11D`).
fn build_hsv_pal() -> Vec<[u8; 3]> {
    let mut out = Vec::with_capacity(235);
    let mut h: u32 = 0x0217;
    for _ in 0..235 {
        out.push(ad_hsv_to_rgb(h as u16, 0xFFFF, 0x00FF));
        h += 0x011D;
        if h >= 0xFFFF {
            h = 0x0217;
        }
    }
    out
}

/// `RGB_PAL` (`AD.EXE` `13:1B8B..13:1D83`): 6x6x6 cube using `DS:0x1AE0` (`[255,204,153,102,51,0]`)
/// plus 19 grayscale entries.
fn build_rgb_pal() -> Vec<[u8; 3]> {
    const STEPS: [u8; 6] = [255, 204, 153, 102, 51, 0];
    let mut out = Vec::with_capacity(235);
    for r in 0..6 {
        for g in 0..6 {
            for b in 0..6 {
                out.push([STEPS[r], STEPS[g], STEPS[b]]);
            }
        }
    }
    let mut gray: u8 = 0xFF;
    while out.len() < 235 {
        out.push([gray, gray, gray]);
        gray = gray.wrapping_add(13);
    }
    out
}

/// `WHITE_PAL` (`AD.EXE` `13:1A60..13:1B8A`): 235 grayscale entries stepping by `256 / 235 = 1`.
fn build_white_pal() -> Vec<[u8; 3]> {
    let mut out = Vec::with_capacity(235);
    let step = (256u32 / 235u32) as u8;
    let mut v: u8 = 0;
    for _ in 0..235 {
        out.push([v, v, v]);
        v = v.saturating_add(step);
    }
    out
}

/// `PRIMARY_PAL` (`AD.EXE` `13:17FD..13:1A5F`): 7 color ramps (White, Red, Orange, Yellow, Green, Blue, Magenta).
fn build_primary_pal() -> Vec<[u8; 3]> {
    let mut out = Vec::with_capacity(235);
    let band_len = 235 / 7; // 33
    let step = (0xF5 / band_len) as u8; // 7
    let mut r: u8 = 0xFF;
    let mut g: u8 = 0xFF;
    let mut b: u8 = 0xFF;
    let mut state = 0u8;
    let mut count = 0usize;

    for _ in 0..235 {
        out.push([r, g, b]);
        match state {
            0 => {
                r = r.wrapping_sub(step);
                g = g.wrapping_sub(step);
                b = b.wrapping_sub(step);
                count += 1;
                if count > band_len {
                    count = 0;
                    r = 0xFF;
                    g = 0;
                    b = 0;
                    state = 1;
                }
            }
            1 => {
                r = r.wrapping_sub(step);
                count += 1;
                if count > band_len {
                    count = 0;
                    r = 0xFF;
                    g = 0x80;
                    b = 0;
                    state = 2;
                }
            }
            2 => {
                r = r.wrapping_sub(step);
                g = g.wrapping_sub(step / 2);
                count += 1;
                if count > band_len {
                    count = 0;
                    r = 0xFF;
                    g = 0xFF;
                    b = 0;
                    state = 3;
                }
            }
            3 => {
                r = r.wrapping_sub(step);
                g = g.wrapping_sub(step);
                count += 1;
                if count > band_len {
                    count = 0;
                    r = 0;
                    g = 0xFF;
                    b = 0;
                    state = 4;
                }
            }
            4 => {
                g = g.wrapping_sub(step);
                count += 1;
                if count > band_len {
                    count = 0;
                    r = 0;
                    g = 0;
                    b = 0xFF;
                    state = 5;
                }
            }
            5 => {
                b = b.wrapping_sub(step);
                count += 1;
                if count > band_len {
                    count = 0;
                    r = 0xFF;
                    g = 0;
                    b = 0xFF;
                    state = 6;
                }
            }
            _ => {
                r = r.wrapping_sub(step);
                b = b.wrapping_sub(step);
            }
        }
    }
    out
}
