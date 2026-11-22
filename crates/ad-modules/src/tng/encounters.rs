//! *Encounters* — 1994 *Star Trek: The Next Generation* After Dark 3.0 Module.
//!
//! Full-widescreen Enterprise-D Main Bridge (`OFst #1000` `f[2563]` Command Well
//! & `f[2569]` Main Viewscreen Bezel with Conn/Ops consoles) alternating
//! cinematically between Captain Picard, Commander Riker, Counselor Troi & Lt.
//! Worf reacting on the Bridge and all 7 classic TNG cosmic encounters playing
//! inside the Main Viewscreen, flanked by live LCARS tactical bridge wings!

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::simpsons::{CompoundAnim, draw_bitmap_text, fill_rect_px, put_px};
use super::{
    LCARS_AMBER, LCARS_SKY, LcarsFontSet, MOD_ENCOUNTERS, SND_PICARD_ANY_IDEA, SND_PICARD_ENLARGE,
    SND_PICARD_IAM, SND_PICARD_IMPULSE, SND_PICARD_INTERCEPT, SND_PICARD_INVESTIGATE,
    SND_PICARD_MAKE_IT_SO, SND_PICARD_NO_AMUSING, SND_PICARD_NOT_GOOD, SND_PICARD_ONSCREEN,
    SND_PICARD_OUTTHINK, SND_PICARD_POWER, SND_PICARD_STAY_CALM, SND_PICARD_STRANGE,
    SND_PICARD_WHATS_GOING, SND_Q_ANOMALY, SND_Q_DANGEROUS, SND_Q_FOOLISH, SND_Q_MACROHEAD,
    SND_Q_OH_PLEASE, SND_RIKER_DONT_KNOW, SND_RIKER_IMPULSE, SND_RIKER_NORMAL, SND_RIKER_NOT_SURE,
    SND_RIKER_OPINION, SND_RIKER_RELAX, SND_RIKER_SHOULDNT, SND_RIKER_WHAT_HELL, SND_VIEWSCREEN,
    SND_WORF_DONT_LIKE, SND_WORF_INTERVENE, SND_WORF_NO_RESP, SND_WORF_UNUSUAL, SND_WORF_WHAT_THAT,
    SONG_TNG_TAG, draw_lcars_wing_telemetry, load_anim, stage_fit, tng_pack,
};

const ENCOUNTER_NAMES: [&str; 7] = [
    "THE GAME",
    "PARALLELS",
    "TIN MAN",
    "DARMOK",
    "CRYSTAL DUDE",
    "FARPOINT",
    "QUALITY OF LIFE",
];

// Exact Main Viewscreen animation ranges inside OFst #1000 (stage 634x396)
const ENCOUNTER_RANGES: [(usize, usize); 7] = [
    (1690, 1768), // The Game
    (1770, 1820), // Parallels
    (1910, 2015), // Tin Man
    (2065, 2162), // Darmok
    (2018, 2060), // Crystal Dude (Crystalline Entity)
    (2165, 2265), // Farpoint (Spaceborne Jellyfish)
    (2270, 2405), // Quality of Life
];

const PICARD_LINES: &[i16] = &[
    SND_PICARD_ONSCREEN,
    SND_PICARD_MAKE_IT_SO,
    SND_PICARD_INVESTIGATE,
    SND_PICARD_STRANGE,
    SND_PICARD_WHATS_GOING,
    SND_PICARD_ENLARGE,
    SND_PICARD_STAY_CALM,
    SND_PICARD_INTERCEPT,
    SND_PICARD_ANY_IDEA,
    SND_PICARD_IMPULSE,
    SND_PICARD_IAM,
    SND_PICARD_POWER,
    SND_PICARD_NO_AMUSING,
    SND_PICARD_NOT_GOOD,
    SND_PICARD_OUTTHINK,
];

const RIKER_LINES: &[i16] = &[
    SND_RIKER_WHAT_HELL,
    SND_RIKER_NOT_SURE,
    SND_RIKER_DONT_KNOW,
    SND_RIKER_IMPULSE,
    SND_RIKER_OPINION,
    SND_RIKER_SHOULDNT,
    SND_RIKER_NORMAL,
    SND_RIKER_RELAX,
];

const WORF_LINES: &[i16] = &[
    SND_WORF_UNUSUAL,
    SND_WORF_WHAT_THAT,
    SND_WORF_DONT_LIKE,
    SND_WORF_INTERVENE,
    SND_WORF_NO_RESP,
];

const Q_LINES: &[i16] = &[
    SND_Q_ANOMALY,
    SND_Q_MACROHEAD,
    SND_Q_OH_PLEASE,
    SND_Q_DANGEROUS,
    SND_Q_FOOLISH,
];

pub struct EncountersModule {
    anim: Option<CompoundAnim>,
    fonts: LcarsFontSet,
    stars: Vec<(f32, f32, u32)>, // normalized (0..1, 0..1) inside Viewscreen aperture
    encounter_setting: i32,      // 0=Random, 1..=7 specific encounter
    active_encounter: usize,
    view_tick: usize,
    crew_tick: usize,
    tick: usize,
}

impl EncountersModule {
    pub fn new() -> Self {
        Self {
            anim: None,
            fonts: LcarsFontSet::empty(),
            stars: Vec::new(),
            encounter_setting: 0,
            active_encounter: 5, // Farpoint default
            view_tick: 0,
            crew_tick: 0,
            tick: 0,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "tng_encounters".to_string(),
            name: "Encounters".to_string(),
            filename: "ENCOUNTR.AD".to_string(),
            credit: "By Gregor, Luis, Matt and Randall.\nSoftware © 1994 Berkeley Systems, Inc.\nStar Trek: TNG ™ & © Paramount Pictures.".to_string(),
            about: "Join Captain Picard, Commander Riker, Lt. Worf, and Counselor Troi on the Main Bridge of the U.S.S. Enterprise-D across 2,580 animated frames and 28 digitized cast voice clips!".to_string(),
            controls: [
                AdControl::Menu {
                    title: "Encounter:".to_string(),
                    default_index: 0,
                    choices: vec![
                        "Random".into(),
                        "The Game".into(),
                        "Parallels".into(),
                        "Tin Man".into(),
                        "Darmok".into(),
                        "Crystal Dude".into(),
                        "Farpoint".into(),
                        "Quality of Life".into(),
                    ],
                },
                AdControl::None,
                AdControl::None,
                AdControl::None,
            ],
            target_frame_ms: 68,
        }
    }

    fn draw_bridge(&mut self, surface: &mut ad_sdk::canvas::AdSurface) {
        let w = surface.width;
        let h = surface.height;
        fill_rect_px(surface, 0, 0, w, h, 0x0003_040A);

        let pad_y = (h / 24).clamp(16, 44);
        let pad_x = (w / 48).clamp(4, 24);
        // Native stage is 636x400 (x=0..636, y=36..436)
        let (sf, box_x, box_y) = stage_fit(w, h, 636.0, 404.0, pad_x, pad_y);
        let stage_x = box_x;
        let stage_y = box_y - 34.0 * sf;

        // Flanking full-widescreen Starfleet LCARS bridge tactical wings (eliminates pillarbox void!)
        let wing_l = box_x.round() as i32;
        let wing_r = (box_x + 636.0 * sf).round() as i32;
        draw_lcars_wing_telemetry(surface, 0, pad_y, wing_l, h - pad_y / 2, self.tick, &self.fonts, false);
        draw_lcars_wing_telemetry(surface, wing_r, pad_y, w, h - pad_y / 2, self.tick, &self.fonts, true);

        let Some(anim) = &self.anim else {
            return;
        };
        if anim.frames.len() < 2570 {
            return;
        }

        // Alternate cinematically between Main Viewscreen Encounter Shot & Main Bridge Crew Shot!
        // Start on Main Viewscreen for immediate iconic TNG visual, then cut to Picard/Riker/Worf on the Bridge!
        let show_viewscreen = (self.tick / 84) % 2 == 0;

        if show_viewscreen {
            // 1. Deep space starfield cleanly clipped inside Main Viewscreen aperture (81,95)..(559,345)
            let ap_x0 = (stage_x + 78.0 * sf).round() as i32;
            let ap_y0 = (stage_y + 92.0 * sf).round() as i32;
            let ap_x1 = (stage_x + 562.0 * sf).round() as i32;
            let ap_y1 = (stage_y + 348.0 * sf).round() as i32;
            fill_rect_px(surface, ap_x0, ap_y0, ap_x1, ap_y1, 0x0002_040C);
            let ap_w = (ap_x1 - ap_x0).max(1) as f32;
            let ap_h = (ap_y1 - ap_y0).max(1) as f32;
            for (i, &(nx, ny, col)) in self.stars.iter().enumerate() {
                if (self.tick + i) % 19 != 0 {
                    let sx = ap_x0 + (nx * ap_w) as i32;
                    let sy = ap_y0 + (ny * ap_h) as i32;
                    put_px(surface, sx, sy, col);
                    if sf >= 1.6 && (i % 3 == 0) {
                        put_px(surface, sx + 1, sy, col);
                    }
                }
            }

            // 2. Active cosmic encounter animation INSIDE the Main Viewscreen
            let (st, en) = ENCOUNTER_RANGES[self.active_encounter % ENCOUNTER_RANGES.len()];
            let span = (en - st).max(1);
            let fi = (st + (self.view_tick % span)).min(anim.frames.len() - 1);
            anim.draw_stage_frame_f(surface, fi, stage_x, stage_y, sf, true, false);

            // 3. Authentic Enterprise-D Main Viewscreen Bezel + Conn & Ops Consoles (f[2569], with flip_x!)
            anim.draw_stage_frame_f(surface, 2569, stage_x, stage_y, sf, true, false);
        } else {
            // 1. Authentic Enterprise-D Main Bridge Command Well (f[2563], full mirrored left/right halves!)
            anim.draw_stage_frame_f(surface, 2563, stage_x, stage_y, sf, true, false);

            // 2. Composite animated Bridge Senior Staff simultaneously at their exact stations!
            let worf_fi = 1290 + (self.crew_tick % 280);
            let troi_fi = 995 + (self.crew_tick % 280);
            let riker_fi = 540 + (self.crew_tick % 440);
            let picard_fi = self.crew_tick % 520;
            anim.draw_stage_frame_f(surface, worf_fi, stage_x, stage_y, sf, true, false);
            anim.draw_stage_frame_f(surface, troi_fi, stage_x, stage_y, sf, true, false);
            anim.draw_stage_frame_f(surface, riker_fi, stage_x, stage_y, sf, true, false);
            anim.draw_stage_frame_f(surface, picard_fi, stage_x, stage_y, sf, true, false);
        }

        // Crisp high-DPI LCARS Bridge tactical header bar
        let hdr_px = (h / 30).clamp(14, 28);
        let (f_hdr, s_hdr, _) = self.fonts.pick(hdr_px);
        let cam_lbl = if show_viewscreen {
            "MAIN VIEWSCREEN"
        } else {
            "COMMAND WELL"
        };
        let hdr = format!(
            "MAIN BRIDGE // {} // ENCOUNTER: {}",
            cam_lbl,
            ENCOUNTER_NAMES[self.active_encounter % ENCOUNTER_NAMES.len()]
        );
        draw_bitmap_text(
            surface,
            f_hdr,
            &hdr,
            (box_x.round() as i32).max(12),
            (pad_y / 4).max(6),
            Some(if show_viewscreen { LCARS_AMBER } else { LCARS_SKY }),
            s_hdr,
        );
    }
}

impl Default for EncountersModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for EncountersModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        if self.anim.is_none() {
            self.anim = Some(load_anim(MOD_ENCOUNTERS, 1000));
            self.fonts.ensure_loaded();
        }
        self.encounter_setting = ctx.module.raw_control_value[0].clamp(0, 7);
        self.active_encounter = if self.encounter_setting == 0 {
            ctx.rng.rand_mod(7) as usize
        } else {
            (self.encounter_setting - 1) as usize
        };

        self.stars.clear();
        let cols = [0x00FF_FFFF, 0x00A8_D0FF, 0x00FF_DF98, 0x0090_B8FF];
        for _ in 0..140 {
            self.stars.push((
                ctx.rng.rand_mod(1000) as f32 / 1000.0,
                ctx.rng.rand_mod(1000) as f32 / 1000.0,
                cols[ctx.rng.rand_mod(cols.len() as i32) as usize],
            ));
        }

        self.view_tick = 0;
        self.crew_tick = 0;
        self.tick = 0;

        let pack = tng_pack();
        pack.play_music(ctx.sound, ctx.system.sound_enabled, SONG_TNG_TAG, 1);
        pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_PICARD_ONSCREEN);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.draw_bridge(ctx.surface);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.tick = self.tick.wrapping_add(1);
        let pack = tng_pack();

        let show_viewscreen = (self.tick / 84) % 2 == 0;
        if show_viewscreen {
            self.view_tick = self.view_tick.wrapping_add(1);
        } else {
            self.crew_tick = self.crew_tick.wrapping_add(1);
        }

        // Advance to next episode encounter cleanly at start of each full cycle in Random mode
        if self.encounter_setting == 0 && self.tick > 0 && self.tick % 168 == 0 {
            self.active_encounter = (self.active_encounter + 1) % ENCOUNTER_NAMES.len();
            self.view_tick = 0;
            pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_VIEWSCREEN);
        }

        // Authentic cast dialogue cues (Picard / Riker / Worf / Q)
        if self.tick % 78 == 38 {
            let clip = match ctx.rng.rand_mod(10) {
                0..=3 => PICARD_LINES[ctx.rng.rand_mod(PICARD_LINES.len() as i32) as usize],
                4..=5 => RIKER_LINES[ctx.rng.rand_mod(RIKER_LINES.len() as i32) as usize],
                6..=7 => WORF_LINES[ctx.rng.rand_mod(WORF_LINES.len() as i32) as usize],
                8 => Q_LINES[ctx.rng.rand_mod(Q_LINES.len() as i32) as usize],
                _ => SND_VIEWSCREEN,
            };
            pack.play_voice(ctx.sound, ctx.system.sound_enabled, clip);
        }

        self.draw_bridge(ctx.surface);
        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        AdResult::NoError
    }
}
