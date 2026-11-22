//! Classic 1994 *Star Trek: The Next Generation* After Dark 3.0 Screen Saver Pack (13 Modules).
//!
//! Uses the shared Berkeley Systems `ADP1` / `RLEP` (with multi-`CTAB` per-sprite
//! palette matching!) / `OFst`/`OFtb` / `PCM8` / `MIDI` runtime engine to power
//! all 13 Star Trek TNG modules with authentic digitized cast voices, LCARS art,
//! and multi-track MIDI themes!

pub mod borg;
pub mod data_dances;
pub mod encounters;
pub mod nanites;
pub mod officers_review;
pub mod personnel_files;
pub mod science_stations;
pub mod starbase;
pub mod starfleet_messages;
pub mod tachyon;
pub mod troi;
pub mod warp_effect;
pub mod worfs_weapons;

use std::sync::OnceLock;

use ad_sdk::canvas::AdSurface;

use crate::simpsons::{
    CompoundAnim, RlepBank, SimpsonsPack, draw_bitmap_text, fill_circle_px, fill_rect_px,
};

pub const LCARS_AMBER: u32 = 0x00FF_AA38;
pub const LCARS_PEACH: u32 = 0x00FF_CC88;
pub const LCARS_GOLD: u32 = 0x00F4_9C38;
pub const LCARS_LAVENDER: u32 = 0x00C8_8CE8;
pub const LCARS_PERIWINKLE: u32 = 0x0088_9CF8;
pub const LCARS_SKY: u32 = 0x0068_C4FF;
pub const LCARS_SALMON: u32 = 0x00E8_6C6C;
pub const LCARS_RED: u32 = 0x00FF_4848;
pub const LCARS_GREEN: u32 = 0x0058_FF88;

/// All 4 authentic Starfleet LCARS bitmap fonts (`14px`, `18px`, `32px`, `50px`) for crisp HD/4K text.
pub struct LcarsFontSet {
    pub f14: RlepBank,
    pub f18: RlepBank,
    pub f32: RlepBank,
    pub f42: RlepBank,
    loaded: bool,
}

impl LcarsFontSet {
    pub fn empty() -> Self {
        let empty_bank = || RlepBank {
            frames: Vec::new(),
            palette: Vec::new(),
        };
        Self {
            f14: empty_bank(),
            f18: empty_bank(),
            f32: empty_bank(),
            f42: empty_bank(),
            loaded: false,
        }
    }

    pub fn ensure_loaded(&mut self) {
        if self.loaded {
            return;
        }
        self.f14 = load_lcars_font(FONT_LCARS_14);
        self.f18 = load_lcars_font(FONT_LCARS_18);
        self.f32 = load_lcars_font(FONT_LCARS_32);
        self.f42 = load_lcars_font(FONT_LCARS_42);
        self.loaded = true;
    }

    /// Pick the sharpest native LCARS font bank & scale for a target glyph height in pixels.
    /// Returns `(font_bank, scale, line_height_px)`.
    pub fn pick(&self, target_px: i32) -> (&RlepBank, i32, i32) {
        if target_px <= 16 || self.f18.frames.is_empty() {
            (&self.f14, 1, 16)
        } else if target_px <= 25 || self.f32.frames.is_empty() {
            (&self.f18, 1, 21)
        } else if target_px <= 39 || self.f42.frames.is_empty() {
            (&self.f32, 1, 35)
        } else if target_px <= 56 {
            (&self.f42, 1, 52)
        } else {
            let s = (target_px / 32).max(2);
            (&self.f32, s, 35 * s)
        }
    }
}

/// Compute aspect-preserving `(scale_f, ox, oy)` to fit a `(stage_w x stage_h)` stage into `(w x h)`.
pub fn stage_fit(w: i32, h: i32, stage_w: f32, stage_h: f32, pad_x: i32, pad_y: i32) -> (f32, f32, f32) {
    let avail_w = (w - pad_x * 2).max(64) as f32;
    let avail_h = (h - pad_y * 2).max(64) as f32;
    let sf = (avail_w / stage_w).min(avail_h / stage_h).max(0.25);
    let ox = (w as f32 - stage_w * sf) * 0.5;
    let oy = (h as f32 - stage_h * sf) * 0.5;
    (sf, ox, oy)
}

/// Draw a solid rounded rectangle (used for authentic Starfleet LCARS buttons, pills, and caps).
pub fn fill_rounded_rect(surface: &mut AdSurface, x0: i32, y0: i32, x1: i32, y1: i32, r: i32, col: u32) {
    let w = x1 - x0;
    let h = y1 - y0;
    if w <= 0 || h <= 0 {
        return;
    }
    let r = r.clamp(0, (w / 2).min(h / 2));
    if r <= 1 {
        fill_rect_px(surface, x0, y0, x1, y1, col);
        return;
    }
    fill_rect_px(surface, x0 + r, y0, x1 - r, y1, col);
    fill_rect_px(surface, x0, y0 + r, x1, y1 - r, col);
    fill_circle_px(surface, x0 + r, y0 + r, r, col);
    fill_circle_px(surface, x1 - r - 1, y0 + r, r, col);
    fill_circle_px(surface, x0 + r, y1 - r - 1, r, col);
    fill_circle_px(surface, x1 - r - 1, y1 - r - 1, r, col);
}

/// Draw an authentic top-left Starfleet LCARS curved elbow with inner concave sweep matching `bg_col`.
pub fn draw_lcars_elbow_tl(
    surface: &mut AdSurface,
    x: i32,
    y: i32,
    bar_w: i32,
    top_h: i32,
    arm_h: i32,
    arm_w: i32,
    col: u32,
) {
    draw_lcars_elbow_tl_bg(surface, x, y, bar_w, top_h, arm_h, arm_w, col, 0x0000_0000);
}

pub fn draw_lcars_elbow_tl_bg(
    surface: &mut AdSurface,
    x: i32,
    y: i32,
    bar_w: i32,
    top_h: i32,
    arm_h: i32,
    arm_w: i32,
    col: u32,
    bg_col: u32,
) {
    let r_out = (bar_w / 2).min(top_h).max(8);
    let r_in = (top_h / 2).max(6);
    fill_rect_px(surface, x + r_out, y, x + arm_w, y + top_h, col);
    fill_rect_px(surface, x, y + r_out, x + bar_w, y + arm_h, col);
    fill_circle_px(surface, x + r_out, y + r_out, r_out, col);
    fill_rect_px(surface, x + bar_w, y + top_h, x + bar_w + r_in, y + top_h + r_in, col);
    fill_circle_px(surface, x + bar_w + r_in, y + top_h + r_in, r_in, bg_col);
}

/// Draw an authentic bottom-left Starfleet LCARS curved elbow with inner concave sweep matching `bg_col`.
pub fn draw_lcars_elbow_bl(
    surface: &mut AdSurface,
    x: i32,
    y_bot: i32,
    bar_w: i32,
    bot_h: i32,
    arm_h: i32,
    arm_w: i32,
    col: u32,
) {
    draw_lcars_elbow_bl_bg(surface, x, y_bot, bar_w, bot_h, arm_h, arm_w, col, 0x0000_0000);
}

pub fn draw_lcars_elbow_bl_bg(
    surface: &mut AdSurface,
    x: i32,
    y_bot: i32,
    bar_w: i32,
    bot_h: i32,
    arm_h: i32,
    arm_w: i32,
    col: u32,
    bg_col: u32,
) {
    let r_out = (bar_w / 2).min(bot_h).max(8);
    let r_in = (bot_h / 2).max(6);
    let y_top = y_bot - arm_h;
    fill_rect_px(surface, x + r_out, y_bot - bot_h, x + arm_w, y_bot, col);
    fill_rect_px(surface, x, y_top, x + bar_w, y_bot - r_out, col);
    fill_circle_px(surface, x + r_out, y_bot - r_out - 1, r_out, col);
    fill_rect_px(
        surface,
        x + bar_w,
        y_bot - bot_h - r_in,
        x + bar_w + r_in,
        y_bot - bot_h,
        col,
    );
    fill_circle_px(surface, x + bar_w + r_in, y_bot - bot_h - r_in - 1, r_in, bg_col);
}

/// Fill widescreen side wings (`x0..x1`) with subtle, authentic animated LCARS sensor telemetry bars
/// so 4:3 TNG stages seamlessly span modern 16:9 / 16:10 / 21:9 displays without black bars!
pub fn draw_lcars_wing_telemetry(
    surface: &mut AdSurface,
    x0: i32,
    y0: i32,
    x1: i32,
    y1: i32,
    tick: usize,
    fonts: &LcarsFontSet,
    right_side: bool,
) {
    let ww = x1 - x0;
    let wh = y1 - y0;
    if ww < 48 || wh < 120 {
        return;
    }
    let pad = (ww / 12).clamp(6, 16);
    let ix0 = x0 + pad;
    let ix1 = x1 - pad;
    let iw = ix1 - ix0;
    if iw < 30 {
        return;
    }

    // Top & bottom thin LCARS accent caps
    let cap_h = (wh / 42).clamp(8, 20);
    let c_top = if right_side { LCARS_PERIWINKLE } else { LCARS_AMBER };
    let c_bot = if right_side { LCARS_AMBER } else { LCARS_LAVENDER };
    fill_rounded_rect(surface, ix0, y0 + pad, ix1, y0 + pad + cap_h, cap_h / 2, c_top);
    fill_rounded_rect(surface, ix0, y1 - pad - cap_h, ix1, y1 - pad, cap_h / 2, c_bot);

    // Side tactical status pills & pulsing LCARS waveform bars
    let mut cy = y0 + pad + cap_h + 12;
    let row_h = (wh / 26).clamp(14, 28);
    let palette = [LCARS_GOLD, LCARS_LAVENDER, LCARS_SKY, LCARS_PEACH, LCARS_PERIWINKLE];
    let (font, fs, _) = fonts.pick((row_h - 4).clamp(12, 20));
    let mut row_idx = 0usize;
    while cy + row_h < y1 - pad - cap_h - 10 {
        let phase = (tick / 14 + row_idx * 3 + if right_side { 5 } else { 0 }) % palette.len();
        let col = palette[phase];
        if row_idx % 3 == 0 {
            // Pill button with LCARS numeric code
            let pill_w = (iw * 3 / 4).max(28);
            let px0 = if right_side { ix1 - pill_w } else { ix0 };
            fill_rounded_rect(surface, px0, cy, px0 + pill_w, cy + row_h - 3, (row_h - 3) / 2, col);
            let code = format!(
                "{:02}-{:03}",
                47 + ((row_idx * 7 + if right_side { 13 } else { 0 }) % 50),
                (104 + row_idx * 37 + (tick / 20) * 3) % 999
            );
            draw_bitmap_text(
                surface,
                font,
                &code,
                px0 + 8,
                cy + 2,
                Some(0x0000_0000),
                fs,
            );
        } else {
            // Animated sensor level bar
            let frac = ((tick as f32 * 0.06 + row_idx as f32 * 0.85).sin() * 0.4 + 0.55).clamp(0.15, 0.98);
            let bw = ((iw as f32) * frac) as i32;
            fill_rect_px(surface, ix0, cy + 4, ix1, cy + row_h - 6, 0x0016_1824);
            let bx0 = if right_side { ix1 - bw } else { ix0 };
            fill_rect_px(surface, bx0, cy + 4, bx0 + bw, cy + row_h - 6, col);
        }
        cy += row_h + 6;
        row_idx += 1;
    }
}

static TNG_PACK_BYTES: &[u8] = include_bytes!("../../../../assets/tng/tng.adp");
static TNG_PACK: OnceLock<SimpsonsPack> = OnceLock::new();

pub const MOD_SHARED: u16 = 0;
pub const MOD_TROI: u16 = 1;
pub const MOD_DATA_DANCES: u16 = 2;
pub const MOD_ENCOUNTERS: u16 = 3;
pub const MOD_NANITES: u16 = 4;
pub const MOD_OFFICERS_REVIEW: u16 = 5;
pub const MOD_PERSONNEL: u16 = 6;
pub const MOD_SCIENCE: u16 = 7;
pub const MOD_STARBASE: u16 = 8;
pub const MOD_STARFLEET_MSG: u16 = 9;
pub const MOD_TACHYON: u16 = 10;
pub const MOD_BORG: u16 = 11;
pub const MOD_WARP_EFFECT: u16 = 12;
pub const MOD_WORFS_WEAPONS: u16 = 13;

// Shared LCARS Bitmap Fonts (ST-TNG Art, 94 ASCII glyphs 33..=126)
pub const FONT_LCARS_14: i16 = 2014;
pub const FONT_LCARS_18: i16 = 2018;
pub const FONT_LCARS_32: i16 = 2032;
pub const FONT_LCARS_42: i16 = 2042;

// Multi-track TNG MIDI Themes (cmid IDs)
pub const SONG_DATA_RHUMBA: i16 = 10;
pub const SONG_DATA_CHACHA: i16 = 20;
pub const SONG_DATA_FOXTROT: i16 = 30;
pub const SONG_DATA_TAP: i16 = 37;
pub const SONG_TNG_THEME: i16 = 40;
pub const SONG_TNG_TAG: i16 = 50;
pub const SONG_TNG_SUSPENSE: i16 = 60;
pub const SONG_BRIDGE_SAINTS: i16 = 95;

// Digitized TNG Cast Voices & Starfleet SFX (ST-TNG Sound)
pub const SND_BEEP1: i16 = 2001;
pub const SND_BEEP2: i16 = 2002;
pub const SND_BEEP3: i16 = 2003;
pub const SND_BEEP4: i16 = 2004;
pub const SND_BEEP5: i16 = 2005;
pub const SND_HAILING: i16 = 2007;
pub const SND_BEEP_STD: i16 = 2008;
pub const SND_BEEP_HIGH: i16 = 2009;
pub const SND_ROMULAN_BEEP1: i16 = 2010;
pub const SND_ROMULAN_BEEP2: i16 = 2011;
pub const SND_ROMULAN_BEEP3: i16 = 2012;
pub const SND_ALARM: i16 = 2013;
pub const SND_SENSOR_ALERT: i16 = 2014;
pub const SND_SCIENCES: i16 = 2015;
pub const SND_VIEWSCREEN: i16 = 2016;
pub const SND_BRIDGE_RUMBLE: i16 = 3000;
pub const SND_PHASER_SHORT: i16 = 3002;
pub const SND_PHASER_MED: i16 = 3003;
pub const SND_SWISH1: i16 = 3005;
pub const SND_SWISH2: i16 = 3006;
pub const SND_SWISH3: i16 = 3007;
pub const SND_CRASH1: i16 = 3008;

pub const SND_WORF_ALEXANDER: i16 = 4001;
pub const SND_WORF_NO_NO: i16 = 4002;
pub const SND_WORF_NOT_YET: i16 = 4003;
pub const SND_WORF_COME_IN: i16 = 4004;
pub const SND_PICARD_ENGAGE: i16 = 4009;
pub const SND_REPORT_BRIDGE: i16 = 4010;
pub const SND_WORF_ROAR: i16 = 4012;
pub const SND_WORF_VERY_STIM: i16 = 4013;
pub const SND_WORF_QUITE_STIM: i16 = 4014;
pub const SND_PICARD_FUTILE: i16 = 4015;

pub const SND_PICARD_POWER: i16 = 4100;
pub const SND_PICARD_ANY_IDEA: i16 = 4101;
pub const SND_PICARD_ENLARGE: i16 = 4102;
pub const SND_PICARD_IAM: i16 = 4103;
pub const SND_PICARD_INVESTIGATE: i16 = 4104;
pub const SND_PICARD_MAKE_IT_SO: i16 = 4105;
pub const SND_PICARD_INTERCEPT: i16 = 4106;
pub const SND_PICARD_NO_AMUSING: i16 = 4107;
pub const SND_PICARD_NOT_GOOD: i16 = 4108;
pub const SND_PICARD_ONSCREEN: i16 = 4109;
pub const SND_PICARD_OUTTHINK: i16 = 4110;
pub const SND_PICARD_IMPULSE: i16 = 4111;
pub const SND_PICARD_STAY_CALM: i16 = 4112;
pub const SND_PICARD_STRANGE: i16 = 4113;
pub const SND_PICARD_WHATS_GOING: i16 = 4114;

pub const SND_RIKER_NOT_SURE: i16 = 4200;
pub const SND_RIKER_DONT_KNOW: i16 = 4201;
pub const SND_RIKER_IMPULSE: i16 = 4202;
pub const SND_RIKER_OPINION: i16 = 4203;
pub const SND_RIKER_SHOULDNT: i16 = 4205;
pub const SND_RIKER_NORMAL: i16 = 4206;
pub const SND_RIKER_RELAX: i16 = 4207;
pub const SND_RIKER_WHAT_HELL: i16 = 4208;

pub const SND_WORF_INTERVENE: i16 = 4300;
pub const SND_WORF_DONT_LIKE: i16 = 4301;
pub const SND_WORF_NO_RESP: i16 = 4302;
pub const SND_WORF_UNUSUAL: i16 = 4303;
pub const SND_WORF_WHAT_THAT: i16 = 4304;

pub const SND_Q_DANGEROUS: i16 = 4400;
pub const SND_Q_ANOMALY: i16 = 4401;
pub const SND_Q_MACROHEAD: i16 = 4402;
pub const SND_Q_OH_PLEASE: i16 = 4403;
pub const SND_Q_FOOLISH: i16 = 4404;

pub const SND_BORG_LOCUTUS: i16 = 9000;
pub const SND_BORG_ONE_WITH: i16 = 9001;
pub const SND_BORG_FUTILE: i16 = 9002;
pub const SND_BORG_MECH: i16 = 9003;
pub const SND_BORG_BEAM: i16 = 9004;

pub fn tng_pack() -> &'static SimpsonsPack {
    TNG_PACK.get_or_init(|| SimpsonsPack::parse_bytes(TNG_PACK_BYTES))
}

pub fn load_rlep(mod_id: u16, res_id: i16) -> RlepBank {
    RlepBank::load_from(tng_pack(), mod_id, res_id)
}

pub fn load_anim(mod_id: u16, base_id: i16) -> CompoundAnim {
    CompoundAnim::load_from(tng_pack(), mod_id, base_id)
}

pub fn load_lcars_font(font_id: i16) -> RlepBank {
    RlepBank::load_from(tng_pack(), MOD_SHARED, font_id)
}

/// Authentic Starfleet LCARS fonts (`#2014`/`#2018`) are uppercase-only; normalize to ASCII uppercase!
pub fn lcars_upper(text: &str) -> String {
    text.to_ascii_uppercase()
}
