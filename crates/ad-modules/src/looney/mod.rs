//! Classic 1995 *Looney Tunes* After Dark 3.0 Screen Saver Pack (12 Modules).
//!
//! Uses the shared Berkeley Systems `ADP1` / `RLEP` (including scanline copy
//! opcode `0x30` and global `IHDR.w2` sprite indexing) / `OFst`/`OFtb` / `PCM8`
//! (including MACE 3:1 decoded clips) / `MIDI` runtime engine to power all 12
//! Looney Tunes modules with authentic sprites, compound animations, digitized
//! cast voices, sound effects, and 13 multi-track MIDI themes.

pub mod acme_shopping;
pub mod cartoons_101;
pub mod conducktor;
pub mod desquetoppe;
pub mod marvins_invasion;
pub mod messages;
pub mod michigan_frog;
pub mod putty_tat;
pub mod rabbitron;
pub mod taz_desktop;
pub mod wockets;
pub mod yosemite_sam;

use std::sync::OnceLock;

use ad_sdk::canvas::AdSurface;

use crate::simpsons::{
    CompoundAnim, RlepBank, SimpsonsPack, SpriteFrame, draw_rect_outline_px, fill_rect_px,
};

static LOONEY_PACK_BYTES: &[u8] = include_bytes!("../../../../assets/looney/looney.adp");
static LOONEY_PACK: OnceLock<SimpsonsPack> = OnceLock::new();

pub const MOD_SHARED: u16 = 0;
pub const MOD_ACME: u16 = 1;
pub const MOD_CARTOONS_101: u16 = 2;
pub const MOD_CONDUCKTOR: u16 = 3;
pub const MOD_DESQUETOPPE: u16 = 4;
pub const MOD_MARVIN: u16 = 5;
pub const MOD_MESSAGES: u16 = 6;
pub const MOD_MICHIGAN_FROG: u16 = 7;
pub const MOD_PUTTY_TAT: u16 = 8;
pub const MOD_RABBITRON: u16 = 9;
pub const MOD_TAZ: u16 = 10;
pub const MOD_WOCKETS: u16 = 11;
pub const MOD_YOSEMITE: u16 = 12;

// 13 Standard MIDI Themes (Looney Tunes Sound `Midi` #10..#130)
pub const SONG_ACME: i16 = 10;
pub const SONG_WOCKETS: i16 = 20;
pub const SONG_MICHIGAN_FROG: i16 = 30;
pub const SONG_DESQUETOPPE: i16 = 40;
pub const SONG_CAN_CAN: i16 = 50;
pub const SONG_MARSEILLAISE: i16 = 60;
pub const SONG_ANVIL_CHORUS: i16 = 70;
pub const SONG_1812_OVERTURE: i16 = 80;
pub const SONG_YOSEMITE_SAM: i16 = 90;
pub const SONG_GOOD_BAD_UGLY: i16 = 100;
pub const SONG_PUTTY_TAT: i16 = 110;
pub const SONG_HUNGARIAN_RHAPSODY: i16 = 120;
pub const SONG_CHINA: i16 = 130;

// Digitized Looney Tunes Cast Voices & SFX (`Looney Tunes Sound` #15000..#16107)
pub const TAZ_VOICES: &[i16] = &[
    15000, 15001, 15002, 15003, 15004, 15005, 15006, 15007, 15008,
];
pub const FROG_VOICES: &[i16] = &[15100, 15101, 15102];
pub const ACME_SFX: &[i16] = &[15200, 15202];
pub const FIREWORKS_SFX: &[i16] = &[15300, 15301, 15302, 15303, 15304, 15305];
pub const MSG_ELMER_VOICES: &[i16] = &[15400, 15401];
pub const MSG_FOGHORN_VOICES: &[i16] = &[15402, 15403, 15404, 15406];
pub const MSG_SPEEDY_VOICES: &[i16] = &[15405];
pub const PEPE_VOICES: &[i16] = &[
    15500, 15501, 15502, 15503, 15504, 15505, 15507, 15508, 15509, 15510, 15511, 15512, 15513,
    15514,
];
pub const YOSEMITE_VOICES: &[i16] = &[
    15600, 15601, 15603, 15607, 15610, 15612, 15614, 15630, 15632, 15633, 15634, 15635, 15636,
    15637, 15638, 15640, 15641,
];
pub const DAFFY_VOICES: &[i16] = &[
    15700, 15701, 15702, 15703, 15704, 15705, 15706, 15707, 15709, 15710, 15711, 15712,
];
pub const TWEETY_VOICES: &[i16] = &[
    15800, 15801, 15802, 15804, 15805, 15806, 15807, 15808, 15809, 15810, 15811, 15812,
];
pub const CARTOONS101_SFX: &[i16] = &[15900, 15901, 15902, 15903];
pub const MARVIN_VOICES: &[i16] = &[
    16001, 16002, 16003, 16004, 16007, 16008, 16009, 16010, 16011,
];
pub const BUGS_VOICES: &[i16] = &[16100, 16101, 16102, 16103, 16104, 16105, 16106, 16107];

pub fn looney_pack() -> &'static SimpsonsPack {
    LOONEY_PACK.get_or_init(|| SimpsonsPack::parse_bytes(LOONEY_PACK_BYTES))
}

pub fn load_rlep(mod_id: u16, res_id: i16) -> RlepBank {
    RlepBank::load_from(looney_pack(), mod_id, res_id)
}

/// Loads and combines multiple `RLEP` banks for a module, positioning each frame
/// at its 0-based global `IHDR.w2` index (`frame.fid as usize`) so 1-based `OFtb`
/// `sprite_id`s resolve accurately across multi-bank modules.
pub fn load_multi_rlep(mod_id: u16, res_ids: &[i16]) -> RlepBank {
    let mut palette = Vec::new();
    let mut all_frames = Vec::new();
    let mut max_fid = 0usize;

    for &rid in res_ids {
        let sub = load_rlep(mod_id, rid);
        if palette.is_empty() && !sub.palette.is_empty() {
            palette = sub.palette;
        }
        for f in sub.frames {
            max_fid = max_fid.max(f.fid as usize);
            all_frames.push(f);
        }
    }

    if all_frames.is_empty() {
        return RlepBank {
            frames: Vec::new(),
            palette,
        };
    }

    // Check if global `fid` indices are populated (i.e. distinct non-zero fids exist)
    let has_global_fids = max_fid > 0;
    if !has_global_fids {
        return RlepBank {
            frames: all_frames,
            palette,
        };
    }

    let dummy = SpriteFrame {
        fid: 0,
        left: 0,
        top: 0,
        w: 1,
        h: 1,
        pixels: vec![0],
        indices: vec![0xFF],
    };
    let mut indexed = vec![dummy; max_fid + 1];
    for (seq_idx, f) in all_frames.into_iter().enumerate() {
        let slot = if f.fid > 0 || seq_idx == 0 {
            f.fid as usize
        } else {
            seq_idx
        };
        if slot < indexed.len() {
            indexed[slot] = f;
        }
    }

    RlepBank {
        frames: indexed,
        palette,
    }
}

pub fn load_anim(mod_id: u16, base_id: i16) -> CompoundAnim {
    CompoundAnim::load_from(looney_pack(), mod_id, base_id)
}

/// Advance `cur` to the next frame in `anim` within `start..=end` whose bounding box
/// satisfies `min_w..=max_w` and `min_h..=max_h` (skipping tiny 4x4 prop/spark/icon frames).
pub fn advance_filtered_range(
    anim: &CompoundAnim,
    cur: usize,
    start: usize,
    end: usize,
    min_w: i32,
    min_h: i32,
    max_w: i32,
    max_h: i32,
) -> usize {
    if anim.frames.is_empty() {
        return 0;
    }
    let last = end.min(anim.frames.len() - 1);
    let first = start.min(last);
    let span = (last - first + 1).max(1);
    let mut idx = if cur < first || cur > last {
        first
    } else {
        first + ((cur - first + 1) % span)
    };
    for _ in 0..span {
        if let Some(cf) = anim.frames.get(idx) {
            let w = cf.right - cf.left;
            let h = cf.bottom - cf.top;
            if !cf.parts.is_empty() && w >= min_w && w <= max_w && h >= min_h && h <= max_h {
                return idx;
            }
        }
        idx = first + ((idx - first + 1) % span);
    }
    first
}

#[inline]
pub fn fill_box_px(surface: &mut AdSurface, x: i32, y: i32, w: i32, h: i32, rgb: u32) {
    fill_rect_px(surface, x, y, x + w, y + h, rgb);
}

#[inline]
pub fn outline_box_px(
    surface: &mut AdSurface,
    x: i32,
    y: i32,
    w: i32,
    h: i32,
    rgb: u32,
    thick: i32,
) {
    draw_rect_outline_px(surface, x, y, x + w, y + h, rgb, thick);
}

/// Draw a string using a Looney Tunes `RLEP` bitmap font (`#12100`, `#7500`, `#11200`, `#11500`)
/// where glyph index 0 is ASCII 32 (`' '`) and glyph index `code - 32` is ASCII `code`.
pub fn draw_looney_text(
    surface: &mut AdSurface,
    font: &RlepBank,
    text: &str,
    x: i32,
    y: i32,
    color_override: Option<u32>,
    scale: i32,
) -> i32 {
    let scale = scale.max(1);
    let space_w = font
        .frames
        .first()
        .map(|f| f.w.max(4))
        .unwrap_or(6)
        * scale;
    let mut cx = x;
    for ch in text.chars() {
        let code = ch as u32;
        if code == 32 {
            cx += space_w;
            continue;
        }
        if (33..=126).contains(&code) {
            let idx = (code - 32) as usize;
            if let Some(glyph) = font.frames.get(idx) {
                match color_override {
                    Some(c) => glyph.blit_solid_color(surface, cx, y, c, scale),
                    None => glyph.blit_scaled(surface, cx, y, scale),
                }
                cx += (glyph.w + 1) * scale;
            } else {
                cx += space_w;
            }
        } else {
            cx += space_w;
        }
    }
    cx - x
}

pub fn measure_looney_text(font: &RlepBank, text: &str, scale: i32) -> i32 {
    let scale = scale.max(1);
    let space_w = font
        .frames
        .first()
        .map(|f| f.w.max(4))
        .unwrap_or(6)
        * scale;
    let mut w = 0;
    for ch in text.chars() {
        let code = ch as u32;
        if code == 32 {
            w += space_w;
        } else if (33..=126).contains(&code) {
            if let Some(glyph) = font.frames.get((code - 32) as usize) {
                w += (glyph.w + 1) * scale;
            } else {
                w += space_w;
            }
        } else {
            w += space_w;
        }
    }
    w
}

pub fn wrap_looney_text(font: &RlepBank, text: &str, max_width: i32, scale: i32) -> Vec<String> {
    let mut lines = Vec::new();
    let mut cur = String::new();
    for word in text.split_whitespace() {
        let cand = if cur.is_empty() {
            word.to_string()
        } else {
            format!("{} {}", cur, word)
        };
        if !cur.is_empty() && measure_looney_text(font, &cand, scale) > max_width {
            lines.push(cur);
            cur = word.to_string();
        } else {
            cur = cand;
        }
    }
    if !cur.is_empty() {
        lines.push(cur);
    }
    lines
}
