//! Classic 1994 *The Simpsons* After Dark 3.0 Screen Saver Pack (15 Modules).
//!
//! Shared runtime engine decoding the authentic `ADP1` asset pack extracted from
//! `ADSimpsons.sit`:
//! - Berkeley Systems `RLEP`/`CSTM` sprite banks (all 1,777 frames across 14 modules)
//! - `OFst`/`OFtb` compound multi-layer animation frames (all 5,924 composite frames)
//! - `Lisa` vector stroke drawings (all 46 drawings for *How to Draw* & *Lisa's Mood Swings*)
//! - Digitized 8-bit PCM voice & SFX clips (all 135 clips from `Simpsons Sound`)
//! - Standard MIDI themes (all 7 decompressed `cmid` songs via WinMM `midiOut`)

pub mod chalkboard;
pub mod files;
pub mod grampa;
pub mod grass_skirts;
pub mod homer_eats;
pub mod how_to_draw;
pub mod itchy_scratchy;
pub mod krusty;
pub mod lisa_moods;
pub mod mr_burns;
pub mod objets_bart;
pub mod physics;
pub mod simpsons_clocks;
pub mod snowball;
pub mod trivia;

use std::sync::OnceLock;

use ad_sdk::canvas::AdSurface;
use ad_sdk::sound::AdSound;

static PACK_BYTES: &[u8] = include_bytes!("../../../../assets/simpsons/simpsons.adp");
static PACK: OnceLock<SimpsonsPack> = OnceLock::new();

pub const MOD_SOUND: u16 = 0;
pub const MOD_CHALKBOARD: u16 = 1;
pub const MOD_FILES: u16 = 2;
pub const MOD_GRAMPA: u16 = 3;
pub const MOD_GRASS_SKIRTS: u16 = 4;
pub const MOD_HOMER_EATS: u16 = 5;
pub const MOD_HOW_TO_DRAW: u16 = 6;
pub const MOD_ITCHY_SCRATCHY: u16 = 7;
pub const MOD_KRUSTY: u16 = 8;
pub const MOD_LISA_MOODS: u16 = 9;
pub const MOD_MR_BURNS: u16 = 10;
pub const MOD_OBJETS_BART: u16 = 11;
pub const MOD_PHYSICS: u16 = 12;
pub const MOD_SIMPSONS_CLOCKS: u16 = 13;
pub const MOD_TRIVIA: u16 = 14;
pub const MOD_SNOWBALL: u16 = 15;

pub const KIND_RLEP: u16 = 1;
pub const KIND_OFST: u16 = 2;
pub const KIND_OFTB: u16 = 3;
pub const KIND_LISA: u16 = 4;
pub const KIND_CSTR: u16 = 5;
pub const KIND_LIST: u16 = 6;
pub const KIND_QERY: u16 = 7;
pub const KIND_SCLO: u16 = 8;
pub const KIND_HELP: u16 = 9;
pub const KIND_HSTR: u16 = 10;
pub const KIND_CLUT: u16 = 11;
pub const KIND_STR_LIST: u16 = 12;
pub const KIND_SPRK: u16 = 14;
pub const KIND_PCM8: u16 = 20;
pub const KIND_MIDI: u16 = 21;

// MIDI Theme resource IDs
pub const SONG_LISA_HAPPY: i16 = 10;
pub const SONG_LISA_ANGRY: i16 = 20;
pub const SONG_LISA_SAD: i16 = 30;
pub const SONG_SIMPSONS_THEME: i16 = 40;
pub const SONG_ITCHY_SCRATCHY: i16 = 50;
pub const SONG_GRAMPA: i16 = 60;
pub const SONG_SNOWBALL_MOZART: i16 = 90;

// Key Digitized Voice & SFX Resource IDs (Simpsons Sound)
pub const SND_INHALE: i16 = -20050;
pub const SND_MOWER_OFF: i16 = -20049;
pub const SND_MOWER_ON: i16 = -20048;
pub const SND_CHALK_HIT1: i16 = -20047;
pub const SND_CHALK_HIT2: i16 = -20046;
pub const SND_CHALK_ROLL: i16 = -20045;
pub const SND_SQUEAK: i16 = -20044;
pub const SND_ERASING: i16 = -20043;
pub const SND_CHAIR_CREAK: i16 = -20042;
pub const SND_MOWER: i16 = -20041;
pub const SND_MOWER_STUCK: i16 = -20040;
pub const SND_SCRATCH: i16 = -20039;
pub const SND_BONE_CLINK: i16 = -20038;
pub const SND_BLENDER: i16 = -20037;
pub const SND_FOLDER_OPEN: i16 = -20036;
pub const SND_WHOOSH: i16 = -20035;
pub const SND_SHAKE_CAN: i16 = -20034;
pub const SND_SPRAY: i16 = -20033;
pub const SND_RIGHT_ANS: i16 = -20032;
pub const SND_WRONG_ANS: i16 = -20031;
pub const SND_TINY_BEEP1: i16 = -20030;
pub const SND_TINY_BEEP2: i16 = -20029;
pub const SND_TINY_BEEP3: i16 = -20028;
pub const SND_TWITCH: i16 = -20027;
pub const SND_CHEERS: i16 = -20026;
pub const SND_COUGH: i16 = -20025;
pub const SND_CRICKET: i16 = -20024;
pub const SND_DRUM_ROLL: i16 = -20023;
pub const SND_EXHALE: i16 = -20021;
pub const SND_HORN_HONK: i16 = -20020;
pub const SND_SPOTLIGHT: i16 = -20019;
pub const SND_POUND_DOOR: i16 = -20018;
pub const SND_SLIDE_DOOR: i16 = -20017;
pub const SND_SNAP: i16 = -20016;
pub const SND_THOUGHT_BALLOON: i16 = -20015;
pub const SND_VAULT_DOOR: i16 = -20014;
pub const SND_OOPS: i16 = -20013;
pub const SND_WIND: i16 = -20012;
pub const SND_RAT: i16 = -20011;
pub const SND_DETONATE: i16 = -20010;
pub const SND_DOOR: i16 = -20009;
pub const SND_DRIP: i16 = -20008;
pub const SND_MAGGIE_FALL: i16 = -20007;
pub const SND_NEON_SPARK: i16 = -20006;
pub const SND_PUNCH: i16 = -20005;
pub const SND_RADIA_BURN: i16 = -20004;
pub const SND_SHATTER: i16 = -20003;
pub const SND_SIREN: i16 = -20002;
pub const SND_SPLAT: i16 = -20001;
pub const SND_TICK: i16 = -20000;

pub const SND_MAGGIE_SUCK: i16 = -14000;
pub const SND_NELSON_HAHA: i16 = -13000;
pub const SND_BARNEY_YOHO: i16 = -12001;
pub const SND_DUFF_BELCH: i16 = -12000;
pub const SND_SKINNER_HUMM: i16 = -11003;
pub const SND_SKINNER_ISAW: i16 = -11002;
pub const SND_SKINNER_YTHR: i16 = -11001;
pub const SND_SKINNER_SMSN: i16 = -11000;
pub const SND_ITCHY_HAHA: i16 = -10002;
pub const SND_ITCHY_HEHE: i16 = -10001;
pub const SND_ITCHY_WEEE: i16 = -10000;
pub const SND_SCRATCHY_WOSH: i16 = -9009;
pub const SND_SCRATCHY_RPET: i16 = -9008;
pub const SND_SCRATCHY_STRT: i16 = -9007;
pub const SND_SCRATCHY_SCRM: i16 = -9006;
pub const SND_SCRATCHY_HEY: i16 = -9005;
pub const SND_SCRATCHY_WHAT: i16 = -9004;
pub const SND_SCRATCHY_BLND: i16 = -9002;
pub const SND_SCRATCHY_GULP: i16 = -9001;
pub const SND_SCRATCHY_ACID: i16 = -9000;
pub const SND_OTTO_WHOA: i16 = -8003;
pub const SND_OTTO_BMER: i16 = -8000;
pub const SND_FLANDERS_OPSY: i16 = -7001;
pub const SND_FLANDERS_HIMO: i16 = -7000;
pub const SND_SMITHERS_MMMM: i16 = -6003;
pub const SND_SMITHERS_YESR: i16 = -6002;
pub const SND_SMITHERS_MBR2: i16 = -6000;
pub const SND_BURNS_EXCELLENT: i16 = -5008;
pub const SND_BURNS_BACK: i16 = -5007;
pub const SND_BURNS_LOOK: i16 = -5006;
pub const SND_BURNS_DSGS: i16 = -5005;
pub const SND_BURNS_JINY: i16 = -5003;
pub const SND_BURNS_SLUG: i16 = -5002;
pub const SND_BURNS_LAYB: i16 = -5001;
pub const SND_BURNS_LOLY: i16 = -5000;
pub const SND_KRUSTY_GRT4: i16 = -4013;
pub const SND_KRUSTY_LAGH: i16 = -4010;
pub const SND_KRUSTY_KIDS: i16 = -4009;
pub const SND_KRUSTY_HELL: i16 = -4008;
pub const SND_KRUSTY_YEH: i16 = -4006;
pub const SND_KRUSTY_LVES: i16 = -4004;
pub const SND_KRUSTY_WHO: i16 = -4003;
pub const SND_KRUSTY_GRNT: i16 = -4002;
pub const SND_KRUSTY_GRT1: i16 = -4001;
pub const SND_KRUSTY_CORP: i16 = -4000;
pub const SND_GRAMPA_SNORE: i16 = -3003;
pub const SND_GRAMPA_SLEEP: i16 = -3000;
pub const SND_BART_GRNG: i16 = -2006;
pub const SND_BART_UHOH: i16 = -2005;
pub const SND_BART_OOPS: i16 = -2004;
pub const SND_BART_SCRM: i16 = -2003;
pub const SND_BART_LAGH: i16 = -2002;
pub const SND_BART_DOIT: i16 = -2000;
pub const SND_HOMER_EAT4: i16 = -1011;
pub const SND_HOMER_EAT3: i16 = -1010;
pub const SND_HOMER_EAT2: i16 = -1009;
pub const SND_HOMER_DOH: i16 = -1008;
pub const SND_HOMER_AWW: i16 = -1007;
pub const SND_HOMER_SCRM: i16 = -1006;
pub const SND_HOMER_GRSS: i16 = -1005;
pub const SND_HOMER_DARN: i16 = -1004;
pub const SND_HOMER_CHOK: i16 = -1003;
pub const SND_HOMER_HUH: i16 = -1002;
pub const SND_HOMER_EAT1: i16 = -1000;

pub const GRAMPA_VOICE_IDS: &[i16] = &[
    -3026, -3025, -3024, -3023, -3022, -3021, -3020, -3019, -3018, -3017, -3015, -3014, -3013,
    -3011, -3010, -3009, -3006, -3005, -3004, -3002, -3001,
];

#[derive(Clone, Copy)]
struct PackEntry {
    mod_id: u16,
    kind: u16,
    res_id: i16,
    offset: usize,
    length: usize,
}

pub struct SimpsonsPack {
    data: &'static [u8],
    entries: Vec<PackEntry>,
}

impl SimpsonsPack {
    pub fn global() -> &'static Self {
        PACK.get_or_init(|| Self::parse_bytes(PACK_BYTES))
    }

    pub fn parse_bytes(data: &'static [u8]) -> Self {
        if data.len() < 8 || &data[0..4] != b"ADP1" {
            return Self {
                data,
                entries: Vec::new(),
            };
        }
        let count = u32::from_le_bytes([data[4], data[5], data[6], data[7]]) as usize;
        let mut entries = Vec::with_capacity(count);
        for i in 0..count {
            let o = 8 + i * 16;
            if o + 16 > data.len() {
                break;
            }
            let mod_id = u16::from_le_bytes([data[o], data[o + 1]]);
            let kind = u16::from_le_bytes([data[o + 2], data[o + 3]]);
            let res_id = i16::from_le_bytes([data[o + 4], data[o + 5]]);
            let offset = u32::from_le_bytes([data[o + 8], data[o + 9], data[o + 10], data[o + 11]])
                as usize;
            let length =
                u32::from_le_bytes([data[o + 12], data[o + 13], data[o + 14], data[o + 15]])
                    as usize;
            if offset + length <= data.len() {
                entries.push(PackEntry {
                    mod_id,
                    kind,
                    res_id,
                    offset,
                    length,
                });
            }
        }
        Self { data, entries }
    }

    pub fn get(&self, mod_id: u16, kind: u16, res_id: i16) -> Option<&'static [u8]> {
        let key = (mod_id, kind, res_id);
        let idx = self
            .entries
            .binary_search_by_key(&key, |e| (e.mod_id, e.kind, e.res_id))
            .ok()?;
        let e = self.entries[idx];
        Some(&self.data[e.offset..e.offset + e.length])
    }

    pub fn list(&self, mod_id: u16, kind: u16) -> Vec<(i16, &'static [u8])> {
        let mut out = Vec::new();
        for e in &self.entries {
            if e.mod_id == mod_id && e.kind == kind {
                out.push((e.res_id, &self.data[e.offset..e.offset + e.length]));
            }
        }
        out
    }

    pub fn play_voice(&self, sound: &AdSound, enabled: bool, res_id: i16) {
        if !enabled {
            return;
        }
        if let Some(raw) = self.get(MOD_SOUND, KIND_PCM8, res_id) {
            if raw.len() > 2 {
                let rate = u16::from_le_bytes([raw[0], raw[1]]) as u32;
                sound.play_pcm_u8(&raw[2..], rate);
            }
        }
    }

    pub fn play_music(&self, sound: &AdSound, enabled: bool, song_id: i16, loops: u32) {
        if !enabled {
            return;
        }
        if let Some(smf) = self.get(MOD_SOUND, KIND_MIDI, song_id) {
            sound.play_midi(smf, loops);
        }
    }

    pub fn decode_clut(&self, mod_id: u16, res_id: i16) -> Vec<u32> {
        let Some(raw) = self.get(mod_id, KIND_CLUT, res_id) else {
            return Vec::new();
        };
        if raw.len() < 2 {
            return Vec::new();
        }
        let count = u16::from_le_bytes([raw[0], raw[1]]) as usize;
        let mut pal = Vec::with_capacity(count);
        for i in 0..count {
            let p = 2 + i * 3;
            if p + 3 <= raw.len() {
                let r = raw[p] as u32;
                let g = raw[p + 1] as u32;
                let b = raw[p + 2] as u32;
                pal.push(0xFF00_0000 | (r << 16) | (g << 8) | b);
            }
        }
        pal
    }
}

/// Map After Dark's 0..100 `Music:` slider (`Never / Once / Twice / Thrice / Always`)
/// to `Option<u32>` loop count (`None` = never, `Some(1..=3)` = times, `Some(0)` = infinite).
pub fn music_loops_from_slider(raw: i32) -> Option<u32> {
    if raw < 20 {
        None
    } else if raw < 40 {
        Some(1)
    } else if raw < 60 {
        Some(2)
    } else if raw < 80 {
        Some(3)
    } else {
        Some(0)
    }
}

/// Decoded sprite frame from Berkeley Systems `RLEP`/`CSTM` format.
#[derive(Clone)]
pub struct SpriteFrame {
    pub fid: u16,
    pub left: i32,
    pub top: i32,
    pub w: i32,
    pub h: i32,
    /// `0` = transparent, `0xFF_RRGGBB` = opaque pixel (ready for `AdSurface::pixels_mut()`).
    pub pixels: Vec<u32>,
    /// Original 8-bit palette index (`0xFF` = transparent) for palette-swap effects.
    pub indices: Vec<u8>,
}

impl SpriteFrame {
    pub fn blit(&self, surface: &mut AdSurface, dx: i32, dy: i32) {
        self.blit_scaled(surface, dx, dy, 1);
    }

    pub fn blit_scaled(&self, surface: &mut AdSurface, dx: i32, dy: i32, scale: i32) {
        let scale = scale.max(1);
        let sw = surface.width;
        let sh = surface.height;
        let dst = surface.pixels_mut();
        for sy in 0..self.h {
            let row = (sy * self.w) as usize;
            let py0 = dy + sy * scale;
            if py0 + scale <= 0 || py0 >= sh {
                continue;
            }
            for sx in 0..self.w {
                let c = self.pixels[row + sx as usize];
                if c == 0 {
                    continue;
                }
                let rgb = c & 0x00FF_FFFF;
                let px0 = dx + sx * scale;
                if scale == 1 {
                    if px0 >= 0 && px0 < sw && py0 >= 0 && py0 < sh {
                        dst[(py0 * sw + px0) as usize] = rgb;
                    }
                } else {
                    for oy in 0..scale {
                        let py = py0 + oy;
                        if py < 0 || py >= sh {
                            continue;
                        }
                        let drow = (py * sw) as usize;
                        for ox in 0..scale {
                            let px = px0 + ox;
                            if px >= 0 && px < sw {
                                dst[drow + px as usize] = rgb;
                            }
                        }
                    }
                }
            }
        }
    }

    pub fn blit_flipped_x(&self, surface: &mut AdSurface, dx: i32, dy: i32, scale: i32) {
        self.blit_transformed(surface, dx, dy, scale, true, false);
    }

    /// Integer-scaled blit supporting `OFtb` per-part `flip_x` (`flags & 1`) and `flip_y` (`flags & 2`).
    pub fn blit_transformed(
        &self,
        surface: &mut AdSurface,
        dx: i32,
        dy: i32,
        scale: i32,
        flip_x: bool,
        flip_y: bool,
    ) {
        if !flip_x && !flip_y {
            self.blit_scaled(surface, dx, dy, scale);
            return;
        }
        let scale = scale.max(1);
        let sw = surface.width;
        let sh = surface.height;
        let dst = surface.pixels_mut();
        for sy in 0..self.h {
            let src_y = if flip_y { self.h - 1 - sy } else { sy };
            let row = (src_y * self.w) as usize;
            let py0 = dy + sy * scale;
            if py0 + scale <= 0 || py0 >= sh {
                continue;
            }
            for sx in 0..self.w {
                let src_x = if flip_x { self.w - 1 - sx } else { sx };
                let c = self.pixels[row + src_x as usize];
                if c == 0 {
                    continue;
                }
                let rgb = c & 0x00FF_FFFF;
                let px0 = dx + sx * scale;
                if scale == 1 {
                    if px0 >= 0 && px0 < sw && py0 >= 0 && py0 < sh {
                        dst[(py0 * sw + px0) as usize] = rgb;
                    }
                } else {
                    for oy in 0..scale {
                        let py = py0 + oy;
                        if py < 0 || py >= sh {
                            continue;
                        }
                        let drow = (py * sw) as usize;
                        for ox in 0..scale {
                            let px = px0 + ox;
                            if px >= 0 && px < sw {
                                dst[drow + px as usize] = rgb;
                            }
                        }
                    }
                }
            }
        }
    }

    /// Continuous fractional-scale blit for crisp or bilinear-smoothed HD/4K widescreen presentation.
    /// - `smooth`: when `true`, applies premultiplied-alpha bilinear filtering with anti-aliased edges
    ///   (ideal for digitized 1994 portraits, actors, and starships on 1080p/1440p/4K screens).
    /// - `key_black`: when `true`, treats pure `#000000` opaque pixels as transparent (e.g., spotlights).
    pub fn blit_transformed_f(
        &self,
        surface: &mut AdSurface,
        dx: i32,
        dy: i32,
        scale_f: f32,
        flip_x: bool,
        flip_y: bool,
        smooth: bool,
        key_black: bool,
    ) {
        if self.w <= 0 || self.h <= 0 || scale_f <= 0.01 {
            return;
        }
        let dst_w = (self.w as f32 * scale_f).round().max(1.0) as i32;
        let dst_h = (self.h as f32 * scale_f).round().max(1.0) as i32;
        self.blit_rect(surface, dx, dy, dst_w, dst_h, flip_x, flip_y, smooth, key_black);
    }

    /// Blit scaled into an arbitrary destination rectangle `(dx, dy, dst_w, dst_h)`.
    pub fn blit_rect(
        &self,
        surface: &mut AdSurface,
        dx: i32,
        dy: i32,
        dst_w: i32,
        dst_h: i32,
        flip_x: bool,
        flip_y: bool,
        smooth: bool,
        key_black: bool,
    ) {
        if self.w <= 0 || self.h <= 0 || dst_w <= 0 || dst_h <= 0 {
            return;
        }
        let sw = surface.width;
        let sh = surface.height;
        let x0 = dx.max(0);
        let x1 = (dx + dst_w).min(sw);
        let y0 = dy.max(0);
        let y1 = (dy + dst_h).min(sh);
        if x0 >= x1 || y0 >= y1 {
            return;
        }

        let dst = surface.pixels_mut();
        let src_w = self.w;
        let src_h = self.h;
        let is_opaque = |c: u32| -> bool { c != 0 && (!key_black || (c & 0x00FF_FFFF) != 0) };

        if !smooth || (dst_w == src_w && dst_h == src_h) {
            let inv_x = src_w as f32 / dst_w as f32;
            let inv_y = src_h as f32 / dst_h as f32;
            for py in y0..y1 {
                let mut sy = (((py - dy) as f32 + 0.5) * inv_y) as i32;
                sy = sy.clamp(0, src_h - 1);
                if flip_y {
                    sy = src_h - 1 - sy;
                }
                let srow = (sy * src_w) as usize;
                let drow = (py * sw) as usize;
                for px in x0..x1 {
                    let mut sx = (((px - dx) as f32 + 0.5) * inv_x) as i32;
                    sx = sx.clamp(0, src_w - 1);
                    if flip_x {
                        sx = src_w - 1 - sx;
                    }
                    let c = self.pixels[srow + sx as usize];
                    if is_opaque(c) {
                        dst[drow + px as usize] = c & 0x00FF_FFFF;
                    }
                }
            }
            return;
        }

        // Fast 16.16 fixed-point bilinear interpolation with edge-clean coverage alpha!
        let step_x = ((src_w as f64 / dst_w as f64) * 65536.0) as i64;
        let step_y = ((src_h as f64 / dst_h as f64) * 65536.0) as i64;
        let max_sx = src_w - 1;
        let max_sy = src_h - 1;

        for py in y0..y1 {
            let fy_raw = (((py - dy) as i64) * step_y + (step_y >> 1)) - 32768;
            let fy = if flip_y {
                ((max_sy as i64) << 16) - fy_raw
            } else {
                fy_raw
            }
            .clamp(0, (max_sy as i64) << 16);
            let sy0 = (fy >> 16) as i32;
            let sy1 = (sy0 + 1).min(max_sy);
            let wy1 = ((fy >> 8) & 0xFF) as u32;
            let wy0 = 256 - wy1;
            let row0 = (sy0 * src_w) as usize;
            let row1 = (sy1 * src_w) as usize;
            let drow = (py * sw) as usize;

            let mut fx_cur = (((x0 - dx) as i64) * step_x + (step_x >> 1)) - 32768;
            for px in x0..x1 {
                let fx = if flip_x {
                    ((max_sx as i64) << 16) - fx_cur
                } else {
                    fx_cur
                }
                .clamp(0, (max_sx as i64) << 16);
                fx_cur += step_x;

                let sx0 = (fx >> 16) as i32;
                let sx1 = (sx0 + 1).min(max_sx);
                let wx1 = ((fx >> 8) & 0xFF) as u32;
                let wx0 = 256 - wx1;

                let c00 = self.pixels[row0 + sx0 as usize];
                let c10 = self.pixels[row0 + sx1 as usize];
                let c01 = self.pixels[row1 + sx0 as usize];
                let c11 = self.pixels[row1 + sx1 as usize];

                let w00 = if is_opaque(c00) { (wx0 * wy0) >> 8 } else { 0 };
                let w10 = if is_opaque(c10) { (wx1 * wy0) >> 8 } else { 0 };
                let w01 = if is_opaque(c01) { (wx0 * wy1) >> 8 } else { 0 };
                let w11 = if is_opaque(c11) { (wx1 * wy1) >> 8 } else { 0 };
                let a_sum = w00 + w10 + w01 + w11;
                if a_sum == 0 {
                    continue;
                }

                let r = (((c00 >> 16) & 0xFF) * w00
                    + ((c10 >> 16) & 0xFF) * w10
                    + ((c01 >> 16) & 0xFF) * w01
                    + ((c11 >> 16) & 0xFF) * w11)
                    / a_sum;
                let g = (((c00 >> 8) & 0xFF) * w00
                    + ((c10 >> 8) & 0xFF) * w10
                    + ((c01 >> 8) & 0xFF) * w01
                    + ((c11 >> 8) & 0xFF) * w11)
                    / a_sum;
                let b = ((c00 & 0xFF) * w00
                    + (c10 & 0xFF) * w10
                    + (c01 & 0xFF) * w01
                    + (c11 & 0xFF) * w11)
                    / a_sum;

                let di = drow + px as usize;
                if a_sum >= 248 {
                    dst[di] = (r << 16) | (g << 8) | b;
                } else {
                    let bg = dst[di];
                    let inv_a = 256 - a_sum.min(256);
                    let or = (r * a_sum + ((bg >> 16) & 0xFF) * inv_a) >> 8;
                    let og = (g * a_sum + ((bg >> 8) & 0xFF) * inv_a) >> 8;
                    let ob = (b * a_sum + (bg & 0xFF) * inv_a) >> 8;
                    dst[di] = (or << 16) | (og << 8) | ob;
                }
            }
        }
    }

    /// Fractional-scale tinted blit (used for fireworks, colored notes, and illuminated silhouettes).
    pub fn blit_tinted_f(
        &self,
        surface: &mut AdSurface,
        dx: i32,
        dy: i32,
        tint_rgb: u32,
        scale_f: f32,
    ) {
        if self.w <= 0 || self.h <= 0 || scale_f <= 0.01 {
            return;
        }
        let dst_w = (self.w as f32 * scale_f).round().max(1.0) as i32;
        let dst_h = (self.h as f32 * scale_f).round().max(1.0) as i32;
        let sw = surface.width;
        let sh = surface.height;
        let x0 = dx.max(0);
        let x1 = (dx + dst_w).min(sw);
        let y0 = dy.max(0);
        let y1 = (dy + dst_h).min(sh);
        if x0 >= x1 || y0 >= y1 {
            return;
        }
        let dst = surface.pixels_mut();
        let tr = (tint_rgb >> 16) & 0xFF;
        let tg = (tint_rgb >> 8) & 0xFF;
        let tb = tint_rgb & 0xFF;
        let inv_x = self.w as f32 / dst_w as f32;
        let inv_y = self.h as f32 / dst_h as f32;
        for py in y0..y1 {
            let sy = ((((py - dy) as f32 + 0.5) * inv_y) as i32).clamp(0, self.h - 1);
            let srow = (sy * self.w) as usize;
            let drow = (py * sw) as usize;
            for px in x0..x1 {
                let sx = ((((px - dx) as f32 + 0.5) * inv_x) as i32).clamp(0, self.w - 1);
                let c = self.pixels[srow + sx as usize];
                if c == 0 {
                    continue;
                }
                let r = (c >> 16) & 0xFF;
                let g = (c >> 8) & 0xFF;
                let b = c & 0xFF;
                let lum = (r * 3 + g * 6 + b) / 10;
                dst[drow + px as usize] = if lum < 36 {
                    c & 0x00FF_FFFF
                } else {
                    let nr = ((tr * lum) / 220).min(255);
                    let ng = ((tg * lum) / 220).min(255);
                    let nb = ((tb * lum) / 220).min(255);
                    (nr << 16) | (ng << 8) | nb
                };
            }
        }
    }

    /// Fractional-scale solid-color glyph blit for crisp high-DPI bitmap typography.
    pub fn blit_solid_color_f(
        &self,
        surface: &mut AdSurface,
        dx: i32,
        dy: i32,
        rgb: u32,
        scale_f: f32,
    ) {
        if self.w <= 0 || self.h <= 0 || scale_f <= 0.01 {
            return;
        }
        let dst_w = (self.w as f32 * scale_f).round().max(1.0) as i32;
        let dst_h = (self.h as f32 * scale_f).round().max(1.0) as i32;
        let sw = surface.width;
        let sh = surface.height;
        let x0 = dx.max(0);
        let x1 = (dx + dst_w).min(sw);
        let y0 = dy.max(0);
        let y1 = (dy + dst_h).min(sh);
        if x0 >= x1 || y0 >= y1 {
            return;
        }
        let dst = surface.pixels_mut();
        let rgb = rgb & 0x00FF_FFFF;
        let inv_x = self.w as f32 / dst_w as f32;
        let inv_y = self.h as f32 / dst_h as f32;
        for py in y0..y1 {
            let sy = ((((py - dy) as f32 + 0.5) * inv_y) as i32).clamp(0, self.h - 1);
            let srow = (sy * self.w) as usize;
            let drow = (py * sw) as usize;
            for px in x0..x1 {
                let sx = ((((px - dx) as f32 + 0.5) * inv_x) as i32).clamp(0, self.w - 1);
                if self.pixels[srow + sx as usize] != 0 {
                    dst[drow + px as usize] = rgb;
                }
            }
        }
    }

    pub fn blit_tinted(&self, surface: &mut AdSurface, dx: i32, dy: i32, tint_rgb: u32, scale: i32) {
        let scale = scale.max(1);
        let sw = surface.width;
        let sh = surface.height;
        let dst = surface.pixels_mut();
        let tr = ((tint_rgb >> 16) & 0xFF) as u32;
        let tg = ((tint_rgb >> 8) & 0xFF) as u32;
        let tb = (tint_rgb & 0xFF) as u32;
        for sy in 0..self.h {
            let row = (sy * self.w) as usize;
            let py0 = dy + sy * scale;
            if py0 + scale <= 0 || py0 >= sh {
                continue;
            }
            for sx in 0..self.w {
                let c = self.pixels[row + sx as usize];
                if c == 0 {
                    continue;
                }
                let r = (c >> 16) & 0xFF;
                let g = (c >> 8) & 0xFF;
                let b = c & 0xFF;
                // Keep dark outlines dark, tint bright strokes to target paint color
                let lum = (r * 3 + g * 6 + b) / 10;
                let out_rgb = if lum < 36 {
                    c & 0x00FF_FFFF
                } else {
                    let nr = ((tr * lum) / 220).min(255);
                    let ng = ((tg * lum) / 220).min(255);
                    let nb = ((tb * lum) / 220).min(255);
                    (nr << 16) | (ng << 8) | nb
                };
                let px0 = dx + sx * scale;
                for oy in 0..scale {
                    let py = py0 + oy;
                    if py < 0 || py >= sh {
                        continue;
                    }
                    let drow = (py * sw) as usize;
                    for ox in 0..scale {
                        let px = px0 + ox;
                        if px >= 0 && px < sw {
                            dst[drow + px as usize] = out_rgb;
                        }
                    }
                }
            }
        }
    }

    pub fn blit_solid_color(&self, surface: &mut AdSurface, dx: i32, dy: i32, rgb: u32, scale: i32) {
        let scale = scale.max(1);
        let sw = surface.width;
        let sh = surface.height;
        let dst = surface.pixels_mut();
        let rgb = rgb & 0x00FF_FFFF;
        for sy in 0..self.h {
            let row = (sy * self.w) as usize;
            let py0 = dy + sy * scale;
            if py0 + scale <= 0 || py0 >= sh {
                continue;
            }
            for sx in 0..self.w {
                if self.pixels[row + sx as usize] == 0 {
                    continue;
                }
                let px0 = dx + sx * scale;
                for oy in 0..scale {
                    let py = py0 + oy;
                    if py < 0 || py >= sh {
                        continue;
                    }
                    let drow = (py * sw) as usize;
                    for ox in 0..scale {
                        let px = px0 + ox;
                        if px >= 0 && px < sw {
                            dst[drow + px as usize] = rgb;
                        }
                    }
                }
            }
        }
    }

    /// Blit onto an offscreen RGB buffer `buf` (`bw x bh`) for persistent canvas effects (bite holes, graffiti).
    pub fn blit_into_buf(&self, buf: &mut [u32], bw: i32, bh: i32, dx: i32, dy: i32, tint: Option<u32>) {
        for sy in 0..self.h {
            let py = dy + sy;
            if py < 0 || py >= bh {
                continue;
            }
            let srow = (sy * self.w) as usize;
            let drow = (py * bw) as usize;
            for sx in 0..self.w {
                let c = self.pixels[srow + sx as usize];
                if c == 0 {
                    continue;
                }
                let px = dx + sx;
                if px < 0 || px >= bw {
                    continue;
                }
                buf[drow + px as usize] = match tint {
                    Some(t) => t & 0x00FF_FFFF,
                    None => c & 0x00FF_FFFF,
                };
            }
        }
    }

    /// Fractional-scale blit into an offscreen RGB buffer `buf` (`bw x bh`) for crisp HD/4K tiles, bite craters, and graffiti.
    pub fn blit_into_buf_scaled(
        &self,
        buf: &mut [u32],
        bw: i32,
        bh: i32,
        dx: i32,
        dy: i32,
        scale_f: f32,
        tint: Option<u32>,
    ) {
        if self.w <= 0 || self.h <= 0 || scale_f <= 0.01 {
            return;
        }
        let dst_w = (self.w as f32 * scale_f).round().max(1.0) as i32;
        let dst_h = (self.h as f32 * scale_f).round().max(1.0) as i32;
        let x0 = dx.max(0);
        let x1 = (dx + dst_w).min(bw);
        let y0 = dy.max(0);
        let y1 = (dy + dst_h).min(bh);
        if x0 >= x1 || y0 >= y1 {
            return;
        }
        let inv_x = self.w as f32 / dst_w as f32;
        let inv_y = self.h as f32 / dst_h as f32;
        for py in y0..y1 {
            let sy = ((((py - dy) as f32 + 0.5) * inv_y) as i32).clamp(0, self.h - 1);
            let srow = (sy * self.w) as usize;
            let drow = (py * bw) as usize;
            for px in x0..x1 {
                let sx = ((((px - dx) as f32 + 0.5) * inv_x) as i32).clamp(0, self.w - 1);
                let c = self.pixels[srow + sx as usize];
                if c == 0 {
                    continue;
                }
                buf[drow + px as usize] = match tint {
                    Some(t) => t & 0x00FF_FFFF,
                    None => c & 0x00FF_FFFF,
                };
            }
        }
    }
}

pub struct RlepBank {
    pub frames: Vec<SpriteFrame>,
    pub palette: Vec<u32>,
}

impl RlepBank {
    pub fn load(mod_id: u16, res_id: i16) -> Self {
        Self::load_from(SimpsonsPack::global(), mod_id, res_id)
    }

    pub fn load_from(pack: &SimpsonsPack, mod_id: u16, res_id: i16) -> Self {
        match pack.get(mod_id, KIND_RLEP, res_id) {
            Some(bytes) => Self::decode(bytes),
            None => Self {
                frames: Vec::new(),
                palette: Vec::new(),
            },
        }
    }

    pub fn decode(data: &[u8]) -> Self {
        let mut pos = 0usize;
        let mut ctabs = Vec::<(u16, Vec<u32>)>::new();
        let mut cstms = Vec::<(u16, &[u8])>::new();
        let mut ihdrs = Vec::<(u16, i32, i32, i32, i32)>::new();

        while pos + 16 <= data.len() {
            let tag = &data[pos..pos + 4];
            let w1 = u16::from_be_bytes([data[pos + 4], data[pos + 5]]);
            let w2 = u16::from_be_bytes([data[pos + 6], data[pos + 7]]);
            let sz = u32::from_be_bytes([
                data[pos + 12],
                data[pos + 13],
                data[pos + 14],
                data[pos + 15],
            ]) as usize;
            if sz < 16 || pos + sz > data.len() {
                break;
            }
            let pay = &data[pos + 16..pos + sz];
            match tag {
                b"CTAB" => {
                    let num = (w1 >> 8) as usize;
                    let num = if num == 0 { pay.len() / 4 } else { num };
                    let mut pal = Vec::with_capacity(num);
                    for i in 0..num {
                        let p = i * 4;
                        if p + 4 <= pay.len() {
                            let r = pay[p + 1] as u32;
                            let g = pay[p + 2] as u32;
                            let b = pay[p + 3] as u32;
                            pal.push(0xFF00_0000 | (r << 16) | (g << 8) | b);
                        }
                    }
                    ctabs.push((w2 & 0x00FF, pal));
                }
                b"CSTM" => {
                    cstms.push((w1, pay));
                }
                b"IHDR" => {
                    if pay.len() >= 12 {
                        let top = i16::from_be_bytes([pay[4], pay[5]]) as i32;
                        let left = i16::from_be_bytes([pay[6], pay[7]]) as i32;
                        let bottom = i16::from_be_bytes([pay[8], pay[9]]) as i32;
                        let right = i16::from_be_bytes([pay[10], pay[11]]) as i32;
                        ihdrs.push((w2, left, top, (right - left).max(1), (bottom - top).max(1)));
                    }
                }
                _ => {}
            }
            pos += sz;
        }

        let default_pal: &[u32] = ctabs.first().map(|(_, p)| p.as_slice()).unwrap_or(&[]);
        let mut frames = Vec::with_capacity(cstms.len().min(ihdrs.len()));
        for ((cstm_w1, pay), (fid, left, top, w, h)) in cstms.into_iter().zip(ihdrs.into_iter()) {
            let want_id = cstm_w1 & 0x00FF;
            let frame_pal: &[u32] = ctabs
                .iter()
                .find(|(cid, _)| *cid == want_id)
                .map(|(_, p)| p.as_slice())
                .or_else(|| {
                    let idx = want_id.saturating_sub(1) as usize;
                    ctabs.get(idx).map(|(_, p)| p.as_slice())
                })
                .unwrap_or(default_pal);

            let total = (w * h) as usize;
            let mut pixels = vec![0u32; total];
            let mut indices = vec![0xFFu8; total];
            let mut p = 0usize;
            let n = pay.len();
            let mut x = 0i32;
            let mut y = 0i32;

            let put = |pixels: &mut [u32], indices: &mut [u8], col: u8, x: &mut i32, y: i32| {
                if *x >= 0 && *x < w && y >= 0 && y < h {
                    let idx = (y * w + *x) as usize;
                    indices[idx] = col;
                    pixels[idx] = frame_pal
                        .get(col as usize)
                        .copied()
                        .unwrap_or(0xFFFF_00FF);
                }
                *x += 1;
            };

            while p < n {
                let b = pay[p];
                p += 1;
                if b == 0x00 {
                    break;
                }
                if b == 0x10 {
                    y += 1;
                    x = 0;
                    continue;
                }
                if b == 0x30 {
                    if p + 1 < n {
                        let src_y = u16::from_be_bytes([pay[p], pay[p + 1]]) as i32;
                        p += 2;
                        if src_y >= 0 && src_y < h && y >= 0 && y < h && src_y != y {
                            let s_off = (src_y * w) as usize;
                            let d_off = (y * w) as usize;
                            for cx in 0..(w as usize) {
                                pixels[d_off + cx] = pixels[s_off + cx];
                                indices[d_off + cx] = indices[s_off + cx];
                            }
                        }
                        y += 1;
                        x = 0;
                    }
                    continue;
                }
                let op = b & 0x0F;
                let hi = b >> 4;
                match op {
                    1 => {
                        let cnt = if hi > 0 {
                            hi as i32
                        } else if p < n {
                            let c = pay[p] as i32;
                            p += 1;
                            c
                        } else {
                            0
                        };
                        x += cnt;
                    }
                    2 => {
                        if p < n {
                            let cnt = pay[p] as usize;
                            p += 1;
                            for _ in 0..cnt {
                                put(&mut pixels, &mut indices, hi, &mut x, y);
                            }
                        }
                    }
                    3..=5 => {
                        for _ in 0..(op - 2) {
                            put(&mut pixels, &mut indices, hi, &mut x, y);
                        }
                    }
                    6 => {
                        let (col, cnt) = if hi > 0 {
                            if p < n {
                                let c = pay[p];
                                p += 1;
                                (c, hi as usize)
                            } else {
                                break;
                            }
                        } else if p + 1 < n {
                            let c = pay[p];
                            let k = pay[p + 1] as usize;
                            p += 2;
                            (c, k)
                        } else {
                            break;
                        };
                        for _ in 0..cnt {
                            put(&mut pixels, &mut indices, col, &mut x, y);
                        }
                    }
                    7 => {
                        if p >= n {
                            break;
                        }
                        let cnt = pay[p] as usize;
                        p += 1;
                        if hi == 0 {
                            let bytes = (cnt + 1) / 2;
                            for k in 0..cnt {
                                if p + (k >> 1) < n {
                                    let nb = pay[p + (k >> 1)];
                                    let c = if (k & 1) == 0 { nb >> 4 } else { nb & 0x0F };
                                    put(&mut pixels, &mut indices, c, &mut x, y);
                                }
                            }
                            p = (p + bytes).min(n);
                        } else if hi == 1 {
                            for k in 0..cnt {
                                if p + k < n {
                                    put(&mut pixels, &mut indices, pay[p + k], &mut x, y);
                                }
                            }
                            p = (p + cnt).min(n);
                        }
                    }
                    8 => {
                        let (cnt, nb) = if hi > 0 {
                            if p < n {
                                let v = pay[p];
                                p += 1;
                                (hi as usize, v)
                            } else {
                                break;
                            }
                        } else if p + 1 < n {
                            let k = pay[p] as usize;
                            let v = pay[p + 1];
                            p += 2;
                            (k, v)
                        } else {
                            break;
                        };
                        let c1 = nb >> 4;
                        let c2 = nb & 0x0F;
                        for k in 0..cnt {
                            put(
                                &mut pixels,
                                &mut indices,
                                if (k & 1) == 0 { c1 } else { c2 },
                                &mut x,
                                y,
                            );
                        }
                    }
                    9 => {
                        let (cnt, c1, c2) = if hi > 0 {
                            if p + 1 < n {
                                let a = pay[p];
                                let b2 = pay[p + 1];
                                p += 2;
                                (hi as usize, a, b2)
                            } else {
                                break;
                            }
                        } else if p + 2 < n {
                            let k = pay[p] as usize;
                            let a = pay[p + 1];
                            let b2 = pay[p + 2];
                            p += 3;
                            (k, a, b2)
                        } else {
                            break;
                        };
                        for k in 0..cnt {
                            put(
                                &mut pixels,
                                &mut indices,
                                if (k & 1) == 0 { c1 } else { c2 },
                                &mut x,
                                y,
                            );
                        }
                    }
                    _ => {}
                }
            }

            frames.push(SpriteFrame {
                fid,
                left,
                top,
                w,
                h,
                pixels,
                indices,
            });
        }

        let palette = ctabs.into_iter().next().map(|(_, p)| p).unwrap_or_default();
        Self { frames, palette }
    }
}

/// One sprite layer inside an `OFtb` compound animation frame.
#[derive(Clone, Copy)]
pub struct CompoundPart {
    pub sprite_idx: usize, // 0-based index into concatenated RLEP banks
    pub layer: u16,
    pub flags: u16,
    pub left: i32,
    pub top: i32,
    pub right: i32,
    pub bottom: i32,
}

#[derive(Clone)]
pub struct CompoundFrame {
    pub fid: u16,
    pub left: i32,
    pub top: i32,
    pub right: i32,
    pub bottom: i32,
    pub dx: i32,
    pub dy: i32,
    pub parts: Vec<CompoundPart>,
}

/// Complete `OFst` + `OFtb` + `RLEP` compound animation set for a module.
pub struct CompoundAnim {
    pub sprites: Vec<SpriteFrame>,
    pub frames: Vec<CompoundFrame>,
    pub overall_w: i32,
    pub overall_h: i32,
}

impl CompoundAnim {
    pub fn load(mod_id: u16, base_id: i16) -> Self {
        Self::load_from(SimpsonsPack::global(), mod_id, base_id)
    }

    pub fn load_from(pack: &SimpsonsPack, mod_id: u16, base_id: i16) -> Self {
        let mut sprites = Vec::new();
        let mut rid = base_id;
        while let Some(rlep) = pack.get(mod_id, KIND_RLEP, rid) {
            let bank = RlepBank::decode(rlep);
            for f in bank.frames {
                while (f.fid as usize) > sprites.len() && (f.fid as usize) < sprites.len() + 8 {
                    sprites.push(SpriteFrame {
                        fid: 0,
                        left: 0,
                        top: 0,
                        w: 1,
                        h: 1,
                        pixels: vec![0],
                        indices: vec![0xFF],
                    });
                }
                sprites.push(f);
            }
            rid += 1;
        }

        let mut frames = Vec::new();
        let mut overall_w = 128;
        let mut overall_h = 128;

        if let Some(ost) = pack.get(mod_id, KIND_OFST, base_id) {
            if ost.len() >= 14 {
                let bx0 = i16::from_be_bytes([ost[4], ost[5]]) as i32;
                let by0 = i16::from_be_bytes([ost[6], ost[7]]) as i32;
                let bx1 = i16::from_be_bytes([ost[8], ost[9]]) as i32;
                let by1 = i16::from_be_bytes([ost[10], ost[11]]) as i32;
                overall_w = (bx1 - bx0).max(1);
                overall_h = (by1 - by0).max(1);

                let count = (ost.len() - 14) / 10;
                for i in 0..count {
                    let o = 14 + i * 10;
                    let fid = u16::from_be_bytes([ost[o], ost[o + 1]]);
                    let tb_idx = u16::from_be_bytes([ost[o + 2], ost[o + 3]]) as i16;
                    let byte_off = u16::from_be_bytes([ost[o + 4], ost[o + 5]]) as usize;
                    let dx = i16::from_be_bytes([ost[o + 6], ost[o + 7]]) as i32;
                    let dy = i16::from_be_bytes([ost[o + 8], ost[o + 9]]) as i32;

                    let Some(tb) = pack.get(mod_id, KIND_OFTB, base_id + tb_idx) else {
                        continue;
                    };
                    if byte_off + 10 > tb.len() {
                        continue;
                    }
                    let fl = i16::from_be_bytes([tb[byte_off], tb[byte_off + 1]]) as i32;
                    let ft = i16::from_be_bytes([tb[byte_off + 2], tb[byte_off + 3]]) as i32;
                    let fr = i16::from_be_bytes([tb[byte_off + 4], tb[byte_off + 5]]) as i32;
                    let fb = i16::from_be_bytes([tb[byte_off + 6], tb[byte_off + 7]]) as i32;
                    let nparts =
                        u16::from_be_bytes([tb[byte_off + 8], tb[byte_off + 9]]) as usize;

                    let mut parts = Vec::with_capacity(nparts);
                    let mut p = byte_off + 10;
                    for _ in 0..nparts {
                        if p + 14 > tb.len() {
                            break;
                        }
                        let sp_id = u16::from_be_bytes([tb[p], tb[p + 1]]) as usize;
                        let layer = u16::from_be_bytes([tb[p + 2], tb[p + 3]]);
                        let flags = u16::from_be_bytes([tb[p + 4], tb[p + 5]]);
                        let pl = i16::from_be_bytes([tb[p + 6], tb[p + 7]]) as i32;
                        let pt = i16::from_be_bytes([tb[p + 8], tb[p + 9]]) as i32;
                        let pr = i16::from_be_bytes([tb[p + 10], tb[p + 11]]) as i32;
                        let pb = i16::from_be_bytes([tb[p + 12], tb[p + 13]]) as i32;
                        p += 14;
                        if sp_id >= 1 && sp_id <= sprites.len() {
                            parts.push(CompoundPart {
                                sprite_idx: sp_id - 1,
                                layer,
                                flags,
                                left: pl,
                                top: pt,
                                right: pr,
                                bottom: pb,
                            });
                        }
                    }

                    frames.push(CompoundFrame {
                        fid,
                        left: fl,
                        top: ft,
                        right: fr,
                        bottom: fb,
                        dx,
                        dy,
                        parts,
                    });
                }
            }
        }

        Self {
            sprites,
            frames,
            overall_w,
            overall_h,
        }
    }

    /// Draw compound frame `idx` aligned so its bounding box top-left sits at `(x, y)` (plus `dx, dy` if `apply_delta`).
    pub fn draw_frame(
        &self,
        surface: &mut AdSurface,
        idx: usize,
        x: i32,
        y: i32,
        scale: i32,
        flip_x: bool,
        apply_delta: bool,
    ) {
        let Some(cf) = self.frames.get(idx) else {
            return;
        };
        let scale = scale.max(1);
        let fw = cf.right - cf.left;
        let ox = if apply_delta { x + cf.dx * scale } else { x };
        let oy = if apply_delta { y + cf.dy * scale } else { y };
        for part in &cf.parts {
            if let Some(sp) = self.sprites.get(part.sprite_idx) {
                let p_flip_x = ((part.flags & 1) != 0) ^ flip_x;
                let p_flip_y = (part.flags & 2) != 0;
                if flip_x {
                    let rel_x = fw - (part.left - cf.left) - sp.w;
                    let rel_y = part.top - cf.top;
                    sp.blit_transformed(
                        surface,
                        ox + rel_x * scale,
                        oy + rel_y * scale,
                        scale,
                        p_flip_x,
                        p_flip_y,
                    );
                } else {
                    let rel_x = part.left - cf.left;
                    let rel_y = part.top - cf.top;
                    sp.blit_transformed(
                        surface,
                        ox + rel_x * scale,
                        oy + rel_y * scale,
                        scale,
                        p_flip_x,
                        p_flip_y,
                    );
                }
            }
        }
    }

    /// Continuous fractional-scale compound frame draw aligned at bbox top-left `(x, y)`.
    pub fn draw_frame_f(
        &self,
        surface: &mut AdSurface,
        idx: usize,
        x: i32,
        y: i32,
        scale_f: f32,
        flip_x: bool,
        smooth: bool,
        key_black: bool,
    ) {
        let Some(cf) = self.frames.get(idx) else {
            return;
        };
        if scale_f <= 0.01 {
            return;
        }
        let fw = cf.right - cf.left;
        for part in &cf.parts {
            if let Some(sp) = self.sprites.get(part.sprite_idx) {
                let p_flip_x = ((part.flags & 1) != 0) ^ flip_x;
                let p_flip_y = (part.flags & 2) != 0;
                let rel_x = if flip_x {
                    fw - (part.left - cf.left) - sp.w
                } else {
                    part.left - cf.left
                };
                let rel_y = part.top - cf.top;
                let dx0 = x + (rel_x as f32 * scale_f).round() as i32;
                let dy0 = y + (rel_y as f32 * scale_f).round() as i32;
                let dx1 = x + ((rel_x + sp.w) as f32 * scale_f).round() as i32;
                let dy1 = y + ((rel_y + sp.h) as f32 * scale_f).round() as i32;
                sp.blit_rect(
                    surface,
                    dx0,
                    dy0,
                    (dx1 - dx0).max(1),
                    (dy1 - dy0).max(1),
                    p_flip_x,
                    p_flip_y,
                    smooth,
                    key_black,
                );
            }
        }
    }

    /// Draw compound frame `idx` using its absolute stage coordinates `(part.left + dx, part.top + dy)` offset by `(stage_x, stage_y)`.
    pub fn draw_stage_frame(
        &self,
        surface: &mut AdSurface,
        idx: usize,
        stage_x: i32,
        stage_y: i32,
        scale: i32,
    ) {
        let Some(cf) = self.frames.get(idx) else {
            return;
        };
        let scale = scale.max(1);
        for part in &cf.parts {
            if let Some(sp) = self.sprites.get(part.sprite_idx) {
                let px = stage_x + (part.left + cf.dx) * scale;
                let py = stage_y + (part.top + cf.dy) * scale;
                let p_flip_x = (part.flags & 1) != 0;
                let p_flip_y = (part.flags & 2) != 0;
                sp.blit_transformed(surface, px, py, scale, p_flip_x, p_flip_y);
            }
        }
    }

    /// Seam-free continuous fractional-scale stage draw (respects `OFtb` `flip_x` & `flip_y` part flags).
    pub fn draw_stage_frame_f(
        &self,
        surface: &mut AdSurface,
        idx: usize,
        stage_x: f32,
        stage_y: f32,
        scale_f: f32,
        smooth: bool,
        key_black: bool,
    ) {
        self.draw_stage_frame_f_ex(
            surface, idx, stage_x, stage_y, scale_f, smooth, key_black, None, false,
        );
    }

    /// Extended stage-coordinate compound frame draw supporting optional black-matte sprite skipping
    /// and horizontal mirroring about `stage_x` (unused when `mirror_x == false`).
    pub fn draw_stage_frame_f_ex(
        &self,
        surface: &mut AdSurface,
        idx: usize,
        stage_x: f32,
        stage_y: f32,
        scale_f: f32,
        smooth: bool,
        key_black: bool,
        skip_sprite: Option<usize>,
        ignore_dx_dy: bool,
    ) {
        let Some(cf) = self.frames.get(idx) else {
            return;
        };
        if scale_f <= 0.01 {
            return;
        }
        let fdx = if ignore_dx_dy { 0 } else { cf.dx };
        let fdy = if ignore_dx_dy { 0 } else { cf.dy };
        for part in &cf.parts {
            if skip_sprite == Some(part.sprite_idx) {
                continue;
            }
            if let Some(sp) = self.sprites.get(part.sprite_idx) {
                let sx = part.left + fdx;
                let sy = part.top + fdy;
                let dx0 = (stage_x + sx as f32 * scale_f).round() as i32;
                let dy0 = (stage_y + sy as f32 * scale_f).round() as i32;
                let dx1 = (stage_x + (sx + sp.w) as f32 * scale_f).round() as i32;
                let dy1 = (stage_y + (sy + sp.h) as f32 * scale_f).round() as i32;
                let p_flip_x = (part.flags & 1) != 0;
                let p_flip_y = (part.flags & 2) != 0;
                sp.blit_rect(
                    surface,
                    dx0,
                    dy0,
                    (dx1 - dx0).max(1),
                    (dy1 - dy0).max(1),
                    p_flip_x,
                    p_flip_y,
                    smooth,
                    key_black,
                );
            }
        }
    }

    /// Stage-anchored walk/action frame draw anchored to a reference stage origin `(ref_x, ref_y)`,
    /// preserving authentic per-frame stage motion `(part.left + cf.dx - ref_x, part.top + cf.dy - ref_y)`
    /// without foot-slipping or horizontal bounding-box jitter! Supports horizontal flipping about `ref_x`.
    pub fn draw_cycle_frame_f(
        &self,
        surface: &mut AdSurface,
        idx: usize,
        anchor_x: f32,
        anchor_y: f32,
        ref_x: i32,
        ref_y: i32,
        scale_f: f32,
        flip_x: bool,
        smooth: bool,
    ) {
        let Some(cf) = self.frames.get(idx) else {
            return;
        };
        if scale_f <= 0.01 {
            return;
        }
        for part in &cf.parts {
            if let Some(sp) = self.sprites.get(part.sprite_idx) {
                let p_flip_x = ((part.flags & 1) != 0) ^ flip_x;
                let p_flip_y = (part.flags & 2) != 0;
                let stage_l = part.left + cf.dx;
                let stage_t = part.top + cf.dy;
                let rel_x = if flip_x {
                    (ref_x - stage_l) - sp.w
                } else {
                    stage_l - ref_x
                };
                let rel_y = stage_t - ref_y;
                let dx0 = (anchor_x + rel_x as f32 * scale_f).round() as i32;
                let dy0 = (anchor_y + rel_y as f32 * scale_f).round() as i32;
                let dx1 = (anchor_x + (rel_x + sp.w) as f32 * scale_f).round() as i32;
                let dy1 = (anchor_y + (rel_y + sp.h) as f32 * scale_f).round() as i32;
                sp.blit_rect(
                    surface,
                    dx0,
                    dy0,
                    (dx1 - dx0).max(1),
                    (dy1 - dy0).max(1),
                    p_flip_x,
                    p_flip_y,
                    smooth,
                    false,
                );
            }
        }
    }

    /// Draw compound frame `idx` anchored at the bottom-center of its bounding box.
    pub fn draw_anchored_bottom(
        &self,
        surface: &mut AdSurface,
        idx: usize,
        cx: i32,
        bottom_y: i32,
        scale: i32,
        flip_x: bool,
    ) {
        let Some(cf) = self.frames.get(idx) else {
            return;
        };
        let fw = (cf.right - cf.left).max(1) * scale;
        let fh = (cf.bottom - cf.top).max(1) * scale;
        self.draw_frame(surface, idx, cx - fw / 2, bottom_y - fh, scale, flip_x, false);
    }

    /// Continuous fractional-scale bottom-center anchored draw.
    pub fn draw_anchored_bottom_f(
        &self,
        surface: &mut AdSurface,
        idx: usize,
        cx: i32,
        bottom_y: i32,
        scale_f: f32,
        flip_x: bool,
        smooth: bool,
        key_black: bool,
    ) {
        let Some(cf) = self.frames.get(idx) else {
            return;
        };
        let fw = ((cf.right - cf.left).max(1) as f32 * scale_f).round() as i32;
        let fh = ((cf.bottom - cf.top).max(1) as f32 * scale_f).round() as i32;
        self.draw_frame_f(
            surface,
            idx,
            cx - fw / 2,
            bottom_y - fh,
            scale_f,
            flip_x,
            smooth,
            key_black,
        );
    }

    pub fn index_of_fid(&self, fid: u16) -> Option<usize> {
        self.frames.iter().position(|f| f.fid == fid)
    }
}

/// Decoded `Lisa` vector polyline drawing (used by *How to Draw* and *Lisa's Mood Swings*).
#[derive(Clone)]
pub struct LisaDrawing {
    pub strokes: Vec<Vec<(i16, i16)>>,
    pub min_x: i32,
    pub max_x: i32,
    pub min_y: i32,
    pub max_y: i32,
}

impl LisaDrawing {
    pub fn load(mod_id: u16, res_id: i16) -> Option<Self> {
        let data = SimpsonsPack::global().get(mod_id, KIND_LISA, res_id)?;
        Some(Self::decode(data))
    }

    pub fn decode(data: &[u8]) -> Self {
        if data.len() < 2 {
            return Self {
                strokes: Vec::new(),
                min_x: 0,
                max_x: 1,
                min_y: 0,
                max_y: 1,
            };
        }
        let num_strokes = u16::from_be_bytes([data[0], data[1]]) as usize;
        let mut pos = 2usize;
        let mut strokes = Vec::with_capacity(num_strokes);
        let mut min_x = i32::MAX;
        let mut max_x = i32::MIN;
        let mut min_y = i32::MAX;
        let mut max_y = i32::MIN;

        for _ in 0..num_strokes {
            if pos + 2 > data.len() {
                break;
            }
            let npts = u16::from_be_bytes([data[pos], data[pos + 1]]) as usize;
            pos += 2;
            let mut pts = Vec::with_capacity(npts);
            for _ in 0..npts {
                if pos + 4 > data.len() {
                    break;
                }
                let x = i16::from_be_bytes([data[pos], data[pos + 1]]);
                let y = i16::from_be_bytes([data[pos + 2], data[pos + 3]]);
                pos += 4;
                min_x = min_x.min(x as i32);
                max_x = max_x.max(x as i32);
                min_y = min_y.min(y as i32);
                max_y = max_y.max(y as i32);
                pts.push((x, y));
            }
            if !pts.is_empty() {
                strokes.push(pts);
            }
        }
        if min_x > max_x {
            min_x = 0;
            max_x = 1;
            min_y = 0;
            max_y = 1;
        }
        Self {
            strokes,
            min_x,
            max_x,
            min_y,
            max_y,
        }
    }
}

/// Convert Classic Mac Roman bytes into a clean UTF-8 String.
pub fn mac_roman_to_string(bytes: &[u8]) -> String {
    let mut s = String::with_capacity(bytes.len());
    for &b in bytes {
        let ch = match b {
            0x00..=0x7F => b as char,
            0xD2 | 0xD3 => '"',
            0xD4 | 0xD5 => '\'',
            0xD0 | 0xD1 => '-',
            0xC9 => '…',
            0xA9 => '©',
            0xAA => '™',
            0xA5 => '•',
            0x8E => 'é',
            0x87 => 'á',
            _ => ' ',
        };
        s.push(ch);
    }
    s
}

/// Parse a Classic Mac `STR#` resource (u16 count + Pascal strings).
pub fn parse_str_list(data: &[u8]) -> Vec<String> {
    if data.len() < 2 {
        return Vec::new();
    }
    let cnt = u16::from_be_bytes([data[0], data[1]]) as usize;
    let mut pos = 2usize;
    let mut out = Vec::with_capacity(cnt);
    for _ in 0..cnt {
        if pos >= data.len() {
            break;
        }
        let n = data[pos] as usize;
        pos += 1;
        let end = (pos + n).min(data.len());
        out.push(mac_roman_to_string(&data[pos..end]));
        pos = end;
    }
    out
}

/// Fast direct pixel helpers on `AdSurface::pixels_mut()` (`0x00RRGGBB`).
#[inline]
pub fn put_px(surface: &mut AdSurface, x: i32, y: i32, rgb: u32) {
    if x >= 0 && x < surface.width && y >= 0 && y < surface.height {
        let idx = (y * surface.width + x) as usize;
        surface.pixels_mut()[idx] = rgb & 0x00FF_FFFF;
    }
}

pub fn fill_rect_px(surface: &mut AdSurface, x0: i32, y0: i32, x1: i32, y1: i32, rgb: u32) {
    let lx = x0.max(0);
    let rx = x1.min(surface.width);
    let ty = y0.max(0);
    let by = y1.min(surface.height);
    if lx >= rx || ty >= by {
        return;
    }
    let sw = surface.width as usize;
    let dst = surface.pixels_mut();
    let rgb = rgb & 0x00FF_FFFF;
    for y in ty..by {
        let row = y as usize * sw;
        dst[row + lx as usize..row + rx as usize].fill(rgb);
    }
}

pub fn draw_rect_outline_px(
    surface: &mut AdSurface,
    x0: i32,
    y0: i32,
    x1: i32,
    y1: i32,
    rgb: u32,
    thick: i32,
) {
    let t = thick.max(1);
    fill_rect_px(surface, x0, y0, x1, y0 + t, rgb);
    fill_rect_px(surface, x0, y1 - t, x1, y1, rgb);
    fill_rect_px(surface, x0, y0, x0 + t, y1, rgb);
    fill_rect_px(surface, x1 - t, y0, x1, y1, rgb);
}

pub fn fill_circle_px(surface: &mut AdSurface, cx: i32, cy: i32, r: i32, rgb: u32) {
    let r2 = r * r;
    let sw = surface.width;
    let sh = surface.height;
    let dst = surface.pixels_mut();
    let rgb = rgb & 0x00FF_FFFF;
    for dy in -r..=r {
        let py = cy + dy;
        if py < 0 || py >= sh {
            continue;
        }
        let dx_max = ((r2 - dy * dy) as f32).sqrt() as i32;
        let lx = (cx - dx_max).max(0);
        let rx = (cx + dx_max + 1).min(sw);
        if lx < rx {
            let row = (py * sw) as usize;
            dst[row + lx as usize..row + rx as usize].fill(rgb);
        }
    }
}

pub fn draw_line_px(
    surface: &mut AdSurface,
    mut x0: i32,
    mut y0: i32,
    x1: i32,
    y1: i32,
    rgb: u32,
    thick: i32,
) {
    let dx = (x1 - x0).abs();
    let sx = if x0 < x1 { 1 } else { -1 };
    let dy = -(y1 - y0).abs();
    let sy = if y0 < y1 { 1 } else { -1 };
    let mut err = dx + dy;
    let half = thick / 2;
    let end_o = thick - half;
    loop {
        if thick <= 1 {
            put_px(surface, x0, y0, rgb);
        } else {
            for oy in -half..end_o {
                for ox in -half..end_o {
                    put_px(surface, x0 + ox, y0 + oy, rgb);
                }
            }
        }
        if x0 == x1 && y0 == y1 {
            break;
        }
        let e2 = 2 * err;
        if e2 >= dy {
            err += dy;
            x0 += sx;
        }
        if e2 <= dx {
            err += dx;
            y0 += sy;
        }
    }
}

/// Draw a string using one of the authentic 94-glyph Simpsons `RLEP` bitmap fonts (ASCII 33..=126).
pub fn draw_bitmap_text(
    surface: &mut AdSurface,
    font: &RlepBank,
    text: &str,
    x: i32,
    y: i32,
    color_override: Option<u32>,
    scale: i32,
) -> i32 {
    let scale = scale.max(1);
    let space_w = font.frames.first().map(|f| f.w.max(4)).unwrap_or(6) * scale;
    let mut cx = x;
    for ch in text.chars() {
        let code = ch as u32;
        if code == 32 {
            cx += space_w;
            continue;
        }
        if (33..=126).contains(&code) {
            let idx = (code - 33) as usize;
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

/// Measure pixel width of `text` rendered with a 94-glyph `RLEP` bitmap font.
pub fn measure_bitmap_text(font: &RlepBank, text: &str, scale: i32) -> i32 {
    let scale = scale.max(1);
    let space_w = font.frames.first().map(|f| f.w.max(4)).unwrap_or(6) * scale;
    let mut w = 0;
    for ch in text.chars() {
        let code = ch as u32;
        if code == 32 {
            w += space_w;
        } else if (33..=126).contains(&code) {
            if let Some(glyph) = font.frames.get((code - 33) as usize) {
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

/// Word-wrap text to fit `max_width` pixels using a 94-glyph `RLEP` bitmap font.
pub fn wrap_bitmap_text(font: &RlepBank, text: &str, max_width: i32, scale: i32) -> Vec<String> {
    let mut lines = Vec::new();
    let mut cur = String::new();
    for word in text.split_whitespace() {
        let cand = if cur.is_empty() {
            word.to_string()
        } else {
            format!("{} {}", cur, word)
        };
        if !cur.is_empty() && measure_bitmap_text(font, &cand, scale) > max_width {
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

/// Fractional-scale bitmap text draw (94-glyph ASCII 33..=126 Simpsons/TNG fonts).
pub fn draw_bitmap_text_f(
    surface: &mut AdSurface,
    font: &RlepBank,
    text: &str,
    x: i32,
    y: i32,
    color_override: Option<u32>,
    scale_f: f32,
) -> i32 {
    let scale_f = scale_f.max(0.25);
    let space_w = font.frames.first().map(|f| f.w.max(4)).unwrap_or(6) as f32 * scale_f;
    let mut cx = x as f32;
    for ch in text.chars() {
        let code = ch as u32;
        if code == 32 {
            cx += space_w;
            continue;
        }
        if (33..=126).contains(&code) {
            let idx = (code - 33) as usize;
            if let Some(glyph) = font.frames.get(idx) {
                match color_override {
                    Some(c) => glyph.blit_solid_color_f(surface, cx.round() as i32, y, c, scale_f),
                    None => glyph.blit_transformed_f(
                        surface,
                        cx.round() as i32,
                        y,
                        scale_f,
                        false,
                        false,
                        false,
                        false,
                    ),
                }
                cx += (glyph.w + 1) as f32 * scale_f;
            } else {
                cx += space_w;
            }
        } else {
            cx += space_w;
        }
    }
    (cx.round() as i32) - x
}

pub fn measure_bitmap_text_f(font: &RlepBank, text: &str, scale_f: f32) -> i32 {
    let scale_f = scale_f.max(0.25);
    let space_w = font.frames.first().map(|f| f.w.max(4)).unwrap_or(6) as f32 * scale_f;
    let mut w = 0.0f32;
    for ch in text.chars() {
        let code = ch as u32;
        if code == 32 {
            w += space_w;
        } else if (33..=126).contains(&code) {
            if let Some(glyph) = font.frames.get((code - 33) as usize) {
                w += (glyph.w + 1) as f32 * scale_f;
            } else {
                w += space_w;
            }
        } else {
            w += space_w;
        }
    }
    w.round() as i32
}

pub fn wrap_bitmap_text_f(font: &RlepBank, text: &str, max_width: i32, scale_f: f32) -> Vec<String> {
    let mut lines = Vec::new();
    let mut cur = String::new();
    for word in text.split_whitespace() {
        let cand = if cur.is_empty() {
            word.to_string()
        } else {
            format!("{} {}", cur, word)
        };
        if !cur.is_empty() && measure_bitmap_text_f(font, &cand, scale_f) > max_width {
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

/// Restore a saved desktop background buffer into `surface` (or fill black if `clear_screen`).
pub fn restore_or_clear(surface: &mut AdSurface, saved_bg: &[u32], clear_screen: bool, bg_rgb: u32) {
    if clear_screen || saved_bg.len() != surface.pixels().len() {
        let dst = surface.pixels_mut();
        dst.fill(bg_rgb & 0x00FF_FFFF);
    } else {
        surface.pixels_mut().copy_from_slice(saved_bg);
    }
}
