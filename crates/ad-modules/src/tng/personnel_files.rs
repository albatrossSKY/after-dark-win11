//! *Personnel Files* — 1994 *Star Trek: The Next Generation* After Dark 3.0 Module.
//!
//! Starfleet LCARS Personnel Database displaying all 9 Enterprise-D crew
//! dossiers (`STR# #16000..#16002`) alongside their photorealistic per-sprite
//! `CTAB` portraits (`RLEP #16001/#16002`) and authentic LCARS console chrome.

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::simpsons::{
    KIND_STR_LIST, RlepBank, SpriteFrame, draw_bitmap_text, draw_rect_outline_px, fill_rect_px,
    parse_str_list, wrap_bitmap_text,
};
use super::{
    FONT_LCARS_14, FONT_LCARS_18, MOD_PERSONNEL, SND_BEEP1, SND_BEEP3, load_lcars_font, load_rlep,
    tng_pack,
};

struct CrewProfile {
    name: &'static str,
    portrait_idx: usize, // index into combined [#16001 (0..5), #16002 (5..9)]
    mid_range: (usize, usize),
    hist_range: (usize, usize),
}

// Exact mapping of the 9 Enterprise-D crew records in STR# #16000..#16002
// Combined portrait vector:
//   0=Beverly, 1=Data, 2=Guinan, 3=Geordi, 4=Picard, 5=Riker, 6=Troi, 7=Wesley, 8=Worf
const CREW_PROFILES: [CrewProfile; 9] = [
    CrewProfile { name: "PICARD, JEAN-LUC", portrait_idx: 4, mid_range: (0, 5), hist_range: (0, 7) },
    CrewProfile { name: "RIKER, WILLIAM T.", portrait_idx: 5, mid_range: (5, 10), hist_range: (7, 13) },
    CrewProfile { name: "DATA", portrait_idx: 1, mid_range: (10, 16), hist_range: (13, 18) },
    CrewProfile { name: "TROI, DEANNA", portrait_idx: 6, mid_range: (16, 21), hist_range: (18, 25) },
    CrewProfile { name: "CRUSHER, BEVERLY", portrait_idx: 0, mid_range: (21, 26), hist_range: (25, 30) },
    CrewProfile { name: "WORF", portrait_idx: 8, mid_range: (26, 31), hist_range: (30, 36) },
    CrewProfile { name: "LA FORGE, GEORDI", portrait_idx: 3, mid_range: (31, 36), hist_range: (36, 42) },
    CrewProfile { name: "GUINAN", portrait_idx: 2, mid_range: (36, 39), hist_range: (42, 46) },
    CrewProfile { name: "CRUSHER, WESLEY", portrait_idx: 7, mid_range: (39, 44), hist_range: (46, 52) },
];

fn clean_lcars_str(s: &str) -> String {
    s.chars()
        .filter(|&c| c >= ' ' || c == '\r' || c == '\t')
        .map(|c| if c == '\r' || c == '\t' { ' ' } else { c })
        .collect::<String>()
        .split_whitespace()
        .collect::<Vec<_>>()
        .join(" ")
}

pub struct PersonnelFilesModule {
    portraits: Vec<SpriteFrame>,
    font14: RlepBank,
    font18: RlepBank,
    top_strs: Vec<String>,
    mid_strs: Vec<String>,
    hist_strs: Vec<String>,
    crew_idx: usize,
    page: usize, // 0 = personal data, 1 = service history
    ticks_on_page: usize,
    ticks_per_page: usize,
    text_only: bool,
    tick: usize,
}

impl PersonnelFilesModule {
    pub fn new() -> Self {
        Self {
            portraits: Vec::new(),
            font14: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            font18: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            top_strs: Vec::new(),
            mid_strs: Vec::new(),
            hist_strs: Vec::new(),
            crew_idx: 0,
            page: 0,
            ticks_on_page: 0,
            ticks_per_page: 100,
            text_only: false,
            tick: 0,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "tng_personnel_files".to_string(),
            name: "Personnel Files".to_string(),
            filename: "PERSFILE.AD".to_string(),
            credit: "By Eric Gibbs, Randall Ho and Jonathan Newman.\nSoftware © 1994 Berkeley Systems, Inc.\nStar Trek: TNG ™ & © Paramount Pictures.".to_string(),
            about: "Access the Starfleet LCARS personnel database for Captain Picard, Commander Riker, Data, Troi, Dr. Crusher, Worf, Geordi La Forge, Guinan, and Wesley Crusher.".to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "Delay:".to_string(),
                    default_raw: 20,
                    labels: vec![
                        "5 seconds".into(),
                        "10 seconds".into(),
                        "15 seconds".into(),
                        "20 seconds".into(),
                        "25 seconds".into(),
                        "30 seconds".into(),
                    ],
                    thresholds: vec![0, 20, 40, 60, 80, 100],
                },
                AdControl::Checkbox {
                    title: "Text Only".to_string(),
                    default_checked: false,
                },
                AdControl::None,
                AdControl::None,
            ],
            target_frame_ms: 90,
        }
    }

    fn ensure_loaded(&mut self) {
        if !self.portraits.is_empty() {
            return;
        }
        let b1 = load_rlep(MOD_PERSONNEL, 16001);
        let b2 = load_rlep(MOD_PERSONNEL, 16002);
        self.portraits.extend(b1.frames);
        self.portraits.extend(b2.frames);
        self.font14 = load_lcars_font(FONT_LCARS_14);
        self.font18 = load_lcars_font(FONT_LCARS_18);

        let pack = tng_pack();
        if let Some(raw) = pack.get(MOD_PERSONNEL, KIND_STR_LIST, 16000) {
            self.top_strs = parse_str_list(raw).into_iter().map(|s| clean_lcars_str(&s)).collect();
        }
        if let Some(raw) = pack.get(MOD_PERSONNEL, KIND_STR_LIST, 16001) {
            self.mid_strs = parse_str_list(raw).into_iter().map(|s| clean_lcars_str(&s)).collect();
        }
        if let Some(raw) = pack.get(MOD_PERSONNEL, KIND_STR_LIST, 16002) {
            self.hist_strs = parse_str_list(raw).into_iter().map(|s| clean_lcars_str(&s)).collect();
        }
    }

    fn render_file(&self, surface: &mut ad_sdk::canvas::AdSurface) {
        let w = surface.width;
        let h = surface.height;
        fill_rect_px(surface, 0, 0, w, h, 0x0000_0000);

        let prof = &CREW_PROFILES[self.crew_idx % CREW_PROFILES.len()];
        let s = if w >= 1100 { 2 } else { 1 };
        let frame_w = (w - 28).clamp(280, 620 * s);
        let frame_h = (h - 28).clamp(210, 440 * s);
        let ox = (w - frame_w) / 2;
        let oy = (h - frame_h) / 2;

        // Authentic LCARS curved-elbow frame (amber / peach / periwinkle / magenta blocks!)
        let bar_w = (58 * s).min(frame_w / 6);
        let top_h = 26 * s;
        // Top amber bar + left LCARS elbow
        fill_rect_px(surface, ox, oy, ox + frame_w, oy + top_h, 0x00F4_9C38);
        fill_rect_px(surface, ox, oy, ox + bar_w, oy + frame_h, 0x00C0_84DC);
        // Segmented LCARS side pills
        fill_rect_px(surface, ox, oy + top_h + 6, ox + bar_w, oy + top_h + 44 * s, 0x00FF_AA58);
        fill_rect_px(surface, ox, oy + top_h + 48 * s, ox + bar_w, oy + top_h + 98 * s, 0x0088_98F4);
        fill_rect_px(surface, ox, oy + frame_h - 32 * s, ox + frame_w, oy + frame_h - 14 * s, 0x00F4_9C38);
        // Inner black data viewport
        let vx = ox + bar_w + 10 * s;
        let vy = oy + top_h + 10 * s;
        let vw = (frame_w - bar_w - 18 * s).max(120);
        let vh = (frame_h - top_h - 48 * s).max(100);
        fill_rect_px(surface, vx - 4, vy - 4, vx + vw + 4, vy + vh + 4, 0x0000_0000);

        // Header title cutout
        fill_rect_px(surface, ox + bar_w + 12 * s, oy, ox + frame_w - 60 * s, oy + top_h, 0x0000_0000);
        let title = format!("STARFLEET PERSONNEL FILE: {}", prof.name);
        draw_bitmap_text(
            surface,
            &self.font18,
            &title,
            ox + bar_w + 18 * s,
            oy + 4 * s,
            Some(0x00FF_B848),
            s,
        );

        // Photorealistic crew portrait on right side (unless Text Only or very narrow)
        let mut text_w = vw;
        if !self.text_only && vw >= 240 {
            if let Some(portrait) = self.portraits.get(prof.portrait_idx) {
                let ps = if frame_w >= 960 { 2 } else { 1 };
                let pw = portrait.w * ps;
                let ph = portrait.h * ps;
                let px = vx + vw - pw - 6 * s;
                let py = vy + 4 * s;
                draw_rect_outline_px(
                    surface,
                    px - 3,
                    py - 3,
                    px + pw + 3,
                    py + ph + 3,
                    0x0098_98F4,
                    2,
                );
                portrait.blit_scaled(surface, px, py, ps);
                text_w = (px - vx - 14 * s).max(110);
            }
        }

        // Top rank/assignment block
        let mut ty = vy + 4 * s;
        let lh = 16 * s;
        if let Some(top_str) = self.top_strs.get(self.crew_idx) {
            let upper = super::lcars_upper(top_str);
            for ln in wrap_bitmap_text(&self.font14, &upper, text_w, s) {
                if ty + lh > vy + vh {
                    break;
                }
                draw_bitmap_text(surface, &self.font14, &ln, vx, ty, Some(0x0088_C8FF), s);
                ty += lh;
            }
        }
        fill_rect_px(surface, vx, ty + 4, vx + text_w, ty + 6, 0x00F4_9C38);
        ty += 12 * s;

        // Middle bio / Service history lines (alternating pages cleanly!)
        let (slice, color) = if self.page == 0 {
            let (a, b) = prof.mid_range;
            (&self.mid_strs[a.min(self.mid_strs.len())..b.min(self.mid_strs.len())], 0x00FF_D880)
        } else {
            let (a, b) = prof.hist_range;
            (&self.hist_strs[a.min(self.hist_strs.len())..b.min(self.hist_strs.len())], 0x00D8_E8FF)
        };

        let sub = if self.page == 0 {
            "PERSONAL DATA RECORD"
        } else {
            "STARFLEET SERVICE RECORD"
        };
        draw_bitmap_text(surface, &self.font14, sub, vx, ty, Some(0x00E0_90FF), s);
        ty += lh + 4 * s;

        for entry in slice {
            let upper = super::lcars_upper(entry);
            for ln in wrap_bitmap_text(&self.font14, &upper, text_w, s) {
                if ty + lh > vy + vh {
                    break;
                }
                draw_bitmap_text(surface, &self.font14, &ln, vx, ty, Some(color), s);
                ty += lh;
            }
            ty += 4 * s;
        }

        // Bottom LCARS numeric code ticker
        let code = format!("LCARS 47{:03}  //  NCC-1701-D", (self.tick / 5) % 999);
        draw_bitmap_text(
            surface,
            &self.font14,
            &code,
            vx,
            oy + frame_h - 30 * s,
            Some(0x0000_0000),
            s,
        );
    }
}

impl Default for PersonnelFilesModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for PersonnelFilesModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();
        let delay_raw = ctx.module.raw_control_value[0].clamp(0, 100);
        let secs = 5 + (delay_raw * 25) / 100;
        self.ticks_per_page = (secs * 10).max(40) as usize;
        self.text_only = ctx.module.raw_control_value[1] != 0;

        self.crew_idx = ctx.rng.rand_mod(CREW_PROFILES.len() as i32) as usize;
        self.page = 0;
        self.ticks_on_page = 0;
        self.tick = 0;

        tng_pack().play_voice(ctx.sound, ctx.system.sound_enabled, SND_BEEP1);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.render_file(ctx.surface);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.tick = self.tick.wrapping_add(1);
        self.ticks_on_page += 1;

        if self.ticks_on_page >= self.ticks_per_page {
            self.ticks_on_page = 0;
            if self.page == 0 {
                self.page = 1;
            } else {
                self.page = 0;
                self.crew_idx = (self.crew_idx + 1) % CREW_PROFILES.len();
            }
            tng_pack().play_voice(ctx.sound, ctx.system.sound_enabled, SND_BEEP3);
        }

        self.render_file(ctx.surface);
        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        AdResult::NoError
    }
}
