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

use crate::simpsons::{CompoundAnim, RlepBank, SimpsonsPack};

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
