//! *Personnel Files* — 1994 *Star Trek: The Next Generation* After Dark 3.0 Module.
//!
//! Full-widescreen responsive Starfleet LCARS Personnel Database displaying all
//! 9 Enterprise-D crew dossiers (`STR# #16000..#16002`) alongside smoothly
//! upscaled photorealistic per-sprite `CTAB` portraits (`RLEP #16001/#16002`),
//! authentic rounded LCARS elbows, and high-DPI native LCARS bitmap fonts.

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::simpsons::{
    KIND_STR_LIST, SpriteFrame, draw_bitmap_text, draw_rect_outline_px, fill_rect_px,
    measure_bitmap_text, parse_str_list, wrap_bitmap_text,
};
use super::{
    LCARS_AMBER, LCARS_GOLD, LCARS_LAVENDER, LCARS_PEACH, LCARS_PERIWINKLE, LCARS_SKY,
    LcarsFontSet, MOD_PERSONNEL, SND_BEEP1, SND_BEEP3, draw_lcars_elbow_bl, draw_lcars_elbow_tl,
    fill_rounded_rect, lcars_upper, load_rlep, tng_pack,
};

struct CrewProfile {
    name: &'static str,
    code: &'static str,
    portrait_idx: usize, // index into combined [#16001 (0..5), #16002 (5..9)]
    mid_range: (usize, usize),
    hist_range: (usize, usize),
}

// Exact mapping of the 9 Enterprise-D crew records in STR# #16000..#16002
// Combined portrait vector:
//   0=Beverly, 1=Data, 2=Guinan, 3=Geordi, 4=Picard, 5=Riker, 6=Troi, 7=Wesley, 8=Worf
const CREW_PROFILES: [CrewProfile; 9] = [
    CrewProfile { name: "PICARD, JEAN-LUC", code: "SP-937-215", portrait_idx: 4, mid_range: (0, 5), hist_range: (0, 7) },
    CrewProfile { name: "RIKER, WILLIAM T.", code: "SC-231-427", portrait_idx: 5, mid_range: (5, 10), hist_range: (7, 13) },
    CrewProfile { name: "DATA", code: "SO-170-104", portrait_idx: 1, mid_range: (10, 16), hist_range: (13, 18) },
    CrewProfile { name: "TROI, DEANNA", code: "SB-418-902", portrait_idx: 6, mid_range: (16, 21), hist_range: (18, 25) },
    CrewProfile { name: "CRUSHER, BEVERLY", code: "SM-512-308", portrait_idx: 0, mid_range: (21, 26), hist_range: (25, 30) },
    CrewProfile { name: "WORF", code: "SK-884-712", portrait_idx: 8, mid_range: (26, 31), hist_range: (30, 36) },
    CrewProfile { name: "LA FORGE, GEORDI", code: "SE-629-441", portrait_idx: 3, mid_range: (31, 36), hist_range: (36, 42) },
    CrewProfile { name: "GUINAN", code: "CV-000-472", portrait_idx: 2, mid_range: (36, 39), hist_range: (42, 46) },
    CrewProfile { name: "CRUSHER, WESLEY", code: "SA-719-108", portrait_idx: 7, mid_range: (39, 44), hist_range: (46, 52) },
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
    fonts: LcarsFontSet,
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
            fonts: LcarsFontSet::empty(),
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
        self.fonts.ensure_loaded();

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
        let pad = (h / 38).clamp(8, 28);
        let ox = pad;
        let oy = pad;
        let fw = w - pad * 2;
        let fh = h - pad * 2;

        let title_px = (h / 18).clamp(16, 46);
        let body_px = (h / 28).clamp(14, 30);
        let small_px = (h / 34).clamp(14, 20);
        let (f_title, s_title, lh_title) = self.fonts.pick(title_px);
        let (f_body, s_body, lh_body) = self.fonts.pick(body_px);
        let (f_small, s_small, lh_small) = self.fonts.pick(small_px);

        let bar_w = (fw / 8).clamp(68, 196);
        let top_h = (lh_title + 8).clamp(26, 60);
        let bot_h = (h / 24).clamp(18, 40);
        let gap = (h / 110).clamp(4, 10);

        // Full-widescreen authentic LCARS curved elbows (top-left & bottom-left)
        let split_y = (fh * 28) / 100;
        draw_lcars_elbow_tl(surface, ox, oy, bar_w, top_h, split_y, fw - top_h, LCARS_GOLD);
        fill_rounded_rect(surface, ox + fw - top_h, oy, ox + fw, oy + top_h, top_h / 2, LCARS_PEACH);

        draw_lcars_elbow_bl(
            surface,
            ox,
            oy + fh,
            bar_w,
            bot_h,
            (fh - split_y - gap).max(bot_h + 40),
            fw - bot_h,
            LCARS_LAVENDER,
        );
        fill_rounded_rect(
            surface,
            ox + fw - bot_h,
            oy + fh - bot_h,
            ox + fw,
            oy + fh,
            bot_h / 2,
            LCARS_GOLD,
        );

        // Title cutout cleanly inside top LCARS bar
        let title = format!("STARFLEET PERSONNEL FILE: {}", prof.name);
        let title_w = measure_bitmap_text(f_title, &title, s_title);
        let cut_x0 = ox + bar_w + pad;
        let cut_x1 = (cut_x0 + title_w + pad * 2).min(ox + fw - top_h - pad);
        fill_rect_px(surface, cut_x0, oy, cut_x1, oy + top_h, 0x0000_0000);
        draw_bitmap_text(
            surface,
            f_title,
            &title,
            cut_x0 + pad / 2,
            oy + ((top_h - lh_title) / 2).max(2),
            Some(LCARS_AMBER),
            s_title,
        );

        // Segmented LCARS left-sidebar crew roster buttons
        let mut sy = oy + top_h + gap * 2;
        let avail_side = (oy + fh - bot_h - gap * 2 - sy).max(60);
        let seg_h = (avail_side / 5).max(18);
        let seg_cols = [LCARS_PEACH, LCARS_PERIWINKLE, LCARS_SKY, LCARS_GOLD, LCARS_LAVENDER];
        let seg_lbls = [
            prof.code,
            if self.page == 0 { "BIO DATA" } else { "SERVICE" },
            "NCC-1701D",
            "ACTIVE",
            "CLEARANCE",
        ];
        for i in 0..5 {
            let y1 = (sy + seg_h - gap).min(oy + fh - bot_h - gap);
            if y1 <= sy + 8 {
                break;
            }
            fill_rect_px(surface, ox, sy, ox + bar_w, y1, seg_cols[i]);
            draw_bitmap_text(
                surface,
                f_small,
                seg_lbls[i],
                ox + 6,
                sy + ((y1 - sy - lh_small) / 2).max(1),
                Some(0x0000_0000),
                s_small,
            );
            sy = y1 + gap;
        }

        // Main black data viewport expanding edge-to-edge on widescreen monitors!
        let vx = ox + bar_w + pad * 2;
        let vy = oy + top_h + pad;
        let vw = (ox + fw - vx - pad).max(160);
        let vh = (oy + fh - bot_h - vy - pad).max(120);

        // Smoothly upscaled photorealistic crew portrait on the right side
        let mut text_w = vw;
        if !self.text_only && vw >= 260 {
            if let Some(portrait) = self.portraits.get(prof.portrait_idx) {
                let target_ph = (vh as f32 * 0.62).clamp(120.0, (vw as f32 * 0.42).max(120.0));
                let sf = (target_ph / portrait.h.max(1) as f32)
                    .min((vw as f32 * 0.34) / portrait.w.max(1) as f32);
                let pw = (portrait.w as f32 * sf).round() as i32;
                let ph = (portrait.h as f32 * sf).round() as i32;
                let px = vx + vw - pw - pad / 2;
                let py = vy + 4;
                // LCARS portrait frame + biometric scanner bar underneath
                fill_rect_px(surface, px - 6, py - 6, px + pw + 6, py + ph + 6, 0x0014_1628);
                draw_rect_outline_px(surface, px - 5, py - 5, px + pw + 5, py + ph + 5, LCARS_PERIWINKLE, 2);
                draw_rect_outline_px(surface, px - 2, py - 2, px + pw + 2, py + ph + 2, LCARS_GOLD, 1);
                portrait.blit_rect(surface, px, py, pw, ph, false, false, true, false);

                // Animated biometric telemetry strip beneath the crew portrait
                let bio_y = py + ph + pad;
                if bio_y + 24 < vy + vh {
                    let id_str = format!("ID: {}", prof.code);
                    draw_bitmap_text(surface, f_small, &id_str, px, bio_y, Some(LCARS_PEACH), s_small);
                    let bar_y = bio_y + lh_small + 4;
                    let n_bars = 12;
                    let bw = ((pw - (n_bars - 1) * 3) / n_bars).max(4);
                    for i in 0..n_bars {
                        let bh = ((((self.tick as f32 * 0.16 + i as f32 * 0.7).sin().abs()) * 18.0) as i32 + 4)
                            .min((vy + vh - bar_y).max(4));
                        let bx = px + i * (bw + 3);
                        let bcol = if i % 3 == 0 { LCARS_SKY } else { LCARS_LAVENDER };
                        fill_rect_px(surface, bx, bar_y, bx + bw, bar_y + bh, bcol);
                    }
                }
                text_w = (px - vx - pad * 2).max(140);
            }
        }

        // Top rank & assignment header block
        let mut ty = vy + 2;
        if let Some(top_str) = self.top_strs.get(self.crew_idx) {
            let upper = lcars_upper(top_str);
            for ln in wrap_bitmap_text(f_body, &upper, text_w, s_body) {
                if ty + lh_body > vy + vh {
                    break;
                }
                draw_bitmap_text(surface, f_body, &ln, vx, ty, Some(LCARS_SKY), s_body);
                ty += lh_body;
            }
        }
        fill_rounded_rect(surface, vx, ty + 4, vx + text_w, ty + 8, 2, LCARS_GOLD);
        ty += 14 + (pad / 2);

        // Personal Data / Service Record lines (on spacious screens >= 820px height, show extra breathing room)
        let (slice, color, sub) = if self.page == 0 {
            let (a, b) = prof.mid_range;
            (
                &self.mid_strs[a.min(self.mid_strs.len())..b.min(self.mid_strs.len())],
                LCARS_PEACH,
                "PERSONAL DATA RECORD  //  PAGE 01",
            )
        } else {
            let (a, b) = prof.hist_range;
            (
                &self.hist_strs[a.min(self.hist_strs.len())..b.min(self.hist_strs.len())],
                0x00D8_ECFF,
                "STARFLEET SERVICE RECORD  //  PAGE 02",
            )
        };

        draw_bitmap_text(surface, f_small, sub, vx, ty, Some(LCARS_LAVENDER), s_small);
        ty += lh_small + (pad / 2);

        for entry in slice {
            let upper = lcars_upper(entry);
            for ln in wrap_bitmap_text(f_body, &upper, text_w, s_body) {
                if ty + lh_body > vy + vh {
                    break;
                }
                draw_bitmap_text(surface, f_body, &ln, vx, ty, Some(color), s_body);
                ty += lh_body;
            }
            ty += (pad / 3).clamp(4, 10);
        }

        // Bottom LCARS numeric code ticker cleanly inside the bottom bar
        let code = format!(
            "LCARS 47{:03}  //  U.S.S. ENTERPRISE NCC-1701-D  //  RECORD {:02} OF {:02}",
            (self.tick / 5) % 999,
            self.crew_idx + 1,
            CREW_PROFILES.len()
        );
        draw_bitmap_text(
            surface,
            f_small,
            &code,
            vx,
            oy + fh - bot_h + ((bot_h - lh_small) / 2).max(1),
            Some(0x0000_0000),
            s_small,
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
