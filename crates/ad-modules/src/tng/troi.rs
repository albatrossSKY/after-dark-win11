//! *Counselor Troi* — 1994 *Star Trek: The Next Generation* After Dark 3.0 Module.
//!
//! Full-widescreen Starfleet LCARS Betazoid Counseling Console featuring
//! Commander Deanna Troi smoothly upscaled across 578 animated portrait frames
//! (`OFst/OFtb #17000`), all 191 authentic counseling quotes (`STR# #17000..#17008`)
//! rendered in crisp high-DPI native LCARS bitmap fonts, and an animated
//! empathic wave telemetry monitor.

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::simpsons::{
    CompoundAnim, KIND_STR_LIST, draw_bitmap_text, draw_line_px, draw_rect_outline_px,
    fill_rect_px, parse_str_list, put_px, wrap_bitmap_text,
};
use super::{
    LCARS_AMBER, LCARS_GOLD, LCARS_LAVENDER, LCARS_PEACH, LCARS_PERIWINKLE, LCARS_SKY,
    LcarsFontSet, MOD_TROI, SND_BEEP1, draw_lcars_elbow_bl_bg, draw_lcars_elbow_tl_bg,
    fill_rounded_rect, lcars_upper, load_anim, tng_pack,
};

pub struct CounselorTroiModule {
    anim: Option<CompoundAnim>,
    fonts: LcarsFontSet,
    quotes: Vec<String>,
    stars: Vec<(f32, f32, u32)>,
    quote_idx: usize,
    frame_idx: usize,
    ticks_on_quote: usize,
    quotes_since_move: usize,
    move_every_quotes: usize,
    show_text: bool,
    layout_slot: usize, // 0 = center, 1 = left-aligned, 2 = right-aligned
    tick: usize,
}

impl CounselorTroiModule {
    pub fn new() -> Self {
        Self {
            anim: None,
            fonts: LcarsFontSet::empty(),
            quotes: Vec::new(),
            stars: Vec::new(),
            quote_idx: 0,
            frame_idx: 0,
            ticks_on_quote: 0,
            quotes_since_move: 0,
            move_every_quotes: 1,
            show_text: true,
            layout_slot: 0,
            tick: 0,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "tng_troi".to_string(),
            name: "Counselor Troi".to_string(),
            filename: "TROI.AD".to_string(),
            credit: "By Randall Ho, Dana Muise & Jonathan Newman.\nSoftware © 1994 Berkeley Systems, Inc.\nStar Trek: TNG ™ & © Paramount Pictures.".to_string(),
            about: "Let Commander Deanna Troi offer Betazoid empathic advice and general counseling across 578 animated portrait frames and 191 authentic counseling quotes.".to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "Reposition:".to_string(),
                    default_raw: 100,
                    labels: vec![
                        "Infrequently".into(),
                        "Seldom".into(),
                        "Occasionally".into(),
                        "Frequently".into(),
                        "Each Quote".into(),
                    ],
                    thresholds: vec![0, 20, 40, 60, 80],
                },
                AdControl::Checkbox {
                    title: "Show Text".to_string(),
                    default_checked: true,
                },
                AdControl::None,
                AdControl::None,
            ],
            target_frame_ms: 85,
        }
    }

    fn ensure_loaded(&mut self) {
        if !self.quotes.is_empty() {
            return;
        }
        self.anim = Some(load_anim(MOD_TROI, 17000));
        self.fonts.ensure_loaded();
        let pack = tng_pack();
        for rid in 17000..=17008 {
            if let Some(raw) = pack.get(MOD_TROI, KIND_STR_LIST, rid) {
                for s in parse_str_list(raw) {
                    let clean = s.replace('\r', " ").trim().to_string();
                    if !clean.is_empty() && !clean.starts_with("Laugh string") {
                        self.quotes.push(clean);
                    }
                }
            }
        }
    }

    fn render_scene(&self, surface: &mut ad_sdk::canvas::AdSurface) {
        let w = surface.width;
        let h = surface.height;
        fill_rect_px(surface, 0, 0, w, h, 0x0006_0410);

        let pad = (h / 36).clamp(8, 28);
        let ox = pad;
        let oy = pad;
        let fw = w - pad * 2;
        let fh = h - pad * 2;

        let title_px = (h / 20).clamp(16, 42);
        let quote_px = (h / 18).clamp(16, 44);
        let small_px = (h / 34).clamp(14, 20);
        let (f_title, s_title, lh_title) = self.fonts.pick(title_px);
        let (f_quote, s_quote, lh_quote) = self.fonts.pick(quote_px);
        let (f_small, s_small, lh_small) = self.fonts.pick(small_px);

        let bar_w = (fw / 10).clamp(42, 130);
        let top_h = (lh_title + 10).clamp(24, 54);
        let bot_h = (h / 26).clamp(16, 36);
        let gap = (h / 110).clamp(4, 10);

        // Full-widescreen Betazoid Lavender & Amber LCARS Console Frame
        let bg_col = 0x0006_0410;
        let split_y = (fh * 46) / 100;
        draw_lcars_elbow_tl_bg(surface, ox, oy, bar_w, top_h, split_y, fw - top_h, LCARS_LAVENDER, bg_col);
        fill_rounded_rect(surface, ox + fw - top_h, oy, ox + fw, oy + top_h, top_h / 2, LCARS_AMBER);
        draw_lcars_elbow_bl_bg(
            surface,
            ox,
            oy + fh,
            bar_w,
            bot_h,
            (fh - split_y - gap).max(bot_h + 32),
            fw - bot_h,
            LCARS_PERIWINKLE,
            bg_col,
        );
        fill_rounded_rect(surface, ox + fw - bot_h, oy + fh - bot_h, ox + fw, oy + fh, bot_h / 2, LCARS_LAVENDER);

        // Header title bar
        draw_bitmap_text(
            surface,
            f_title,
            "SHIP'S COUNSELOR // CMDR. DEANNA TROI",
            ox + bar_w + pad,
            oy + ((top_h - lh_title) / 2).max(2),
            Some(0x0000_0000),
            s_title,
        );

        // Left sidebar accent pills
        fill_rect_px(surface, ox, oy + top_h + gap * 2, ox + bar_w, oy + split_y - gap, LCARS_PEACH);

        let vx = ox + bar_w + pad * 2;
        let vy = oy + top_h + pad;
        let vw = (ox + fw - vx - pad).max(160);
        let vh = (oy + fh - bot_h - vy - pad).max(120);

        // Subtle starlight backdrop inside counseling viewport
        for (i, &(nx, ny, col)) in self.stars.iter().enumerate() {
            if (self.tick + i) % 23 != 0 {
                let sx = vx + (nx * vw as f32) as i32;
                let sy = vy + (ny * vh as f32) as i32;
                put_px(surface, sx, sy, col);
            }
        }

        // Smoothly scaled Counselor Troi portrait (native stage bbox (286,50)..(435,211) -> ~149x161)
        let target_h = if self.show_text {
            (vh as f32 * 0.56).clamp(120.0, 420.0)
        } else {
            (vh as f32 * 0.80).clamp(140.0, 540.0)
        };
        let sf = (target_h / 162.0).min((vw as f32 * 0.48) / 150.0);
        let port_w = (150.0 * sf).round() as i32;
        let port_h = (162.0 * sf).round() as i32;

        // Horizontal reposition slot (0=center, 1=left-third, 2=right-third)
        let port_cx = match self.layout_slot % 3 {
            1 => vx + (vw / 4).max(port_w / 2 + 12),
            2 => vx + vw - (vw / 4).max(port_w / 2 + 12),
            _ => vx + vw / 2,
        };
        let port_top = if self.show_text {
            vy + (vh / 24).max(6)
        } else {
            vy + (vh - port_h) / 2
        };

        // Soft violet holo-frame around Troi portrait
        let fx0 = port_cx - port_w / 2 - 8;
        let fy0 = port_top - 6;
        let fx1 = port_cx + port_w / 2 + 8;
        let fy1 = port_top + port_h + 6;
        fill_rect_px(surface, fx0, fy0, fx1, fy1, 0x000A_0618);
        draw_rect_outline_px(surface, fx0, fy0, fx1, fy1, LCARS_LAVENDER, 2);

        if let Some(anim) = &self.anim {
            if !anim.frames.is_empty() {
                let fi = self.frame_idx % anim.frames.len();
                let stage_x = port_cx as f32 - 360.0 * sf;
                let stage_y = port_top as f32 - 50.0 * sf;
                anim.draw_stage_frame_f(surface, fi, stage_x, stage_y, sf, true, false);
            }
        }

        // Animated Betazoid Empathic Sine Wave in empty side bay when wide enough
        if vw >= 460 && self.layout_slot % 3 != 0 {
            let wave_x0 = if self.layout_slot % 3 == 1 {
                fx1 + pad * 2
            } else {
                vx + pad
            };
            let wave_x1 = if self.layout_slot % 3 == 1 {
                vx + vw - pad
            } else {
                fx0 - pad * 2
            };
            if wave_x1 - wave_x0 > 120 {
                let wcy = (fy0 + fy1) / 2;
                let amp = ((fy1 - fy0) as f32 * 0.22).clamp(16.0, 56.0);
                draw_bitmap_text(
                    surface,
                    f_small,
                    "EMPATHIC RESONANCE SCAN",
                    wave_x0,
                    fy0 + 4,
                    Some(LCARS_SKY),
                    s_small,
                );
                let mut prev_x = wave_x0;
                let mut prev_y = wcy;
                for x in (wave_x0..wave_x1).step_by(4) {
                    let t = (x - wave_x0) as f32 * 0.035 + self.tick as f32 * 0.14;
                    let y = wcy + ((t.sin() * 0.65 + (t * 2.1).cos() * 0.35) * amp) as i32;
                    if x > wave_x0 {
                        draw_line_px(surface, prev_x, prev_y, x, y, LCARS_LAVENDER, 2);
                    }
                    prev_x = x;
                    prev_y = y;
                }
            }
        }

        // Spacious full-width LCARS counseling quote readout cleanly below Troi!
        if self.show_text && !self.quotes.is_empty() {
            let quote = &self.quotes[self.quote_idx % self.quotes.len()];
            let bx = vx;
            let by = (fy1 + pad).min(vy + vh - lh_quote * 2 - 20);
            let bw = vw;
            let bh = (vy + vh - by).max(lh_quote + 20);

            fill_rect_px(surface, bx, by, bx + bw, by + bh, 0x0012_0C24);
            let pill_w = (bw / 36).clamp(12, 26);
            fill_rect_px(surface, bx, by, bx + pill_w, by + bh, LCARS_LAVENDER);
            fill_rect_px(surface, bx, by, bx + bw, by + (bh / 18).clamp(5, 10), LCARS_GOLD);
            draw_rect_outline_px(surface, bx, by, bx + bw, by + bh, LCARS_PERIWINKLE, 1);

            let text_x = bx + pill_w + pad;
            let mut text_y = by + (bh / 14).clamp(12, 24);
            let max_w = (bw - pill_w - pad * 2).max(120);
            let upper = lcars_upper(quote);
            let lines = wrap_bitmap_text(f_quote, &upper, max_w, s_quote);
            for ln in lines.iter().take(4) {
                if text_y + lh_quote > by + bh - 6 {
                    break;
                }
                draw_bitmap_text(surface, f_quote, ln, text_x, text_y, Some(LCARS_PEACH), s_quote);
                text_y += lh_quote + 2;
            }
        }

        let footer = format!(
            "BETAZOID COUNSELING LOG // QUOTE {:03}/{} // STARDATE 47{:03}.4",
            (self.quote_idx % self.quotes.len().max(1)) + 1,
            self.quotes.len(),
            (self.tick / 6) % 999
        );
        draw_bitmap_text(
            surface,
            f_small,
            &footer,
            vx,
            oy + fh - bot_h + ((bot_h - lh_small) / 2).max(1),
            Some(0x0000_0000),
            s_small,
        );
    }
}

impl Default for CounselorTroiModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for CounselorTroiModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();
        let repo_raw = ctx.module.raw_control_value[0].clamp(0, 100);
        self.move_every_quotes = if repo_raw >= 80 {
            1
        } else if repo_raw >= 60 {
            2
        } else if repo_raw >= 40 {
            4
        } else if repo_raw >= 20 {
            7
        } else {
            12
        };
        self.show_text = ctx.module.raw_control_value[1] != 0;

        self.stars.clear();
        let cols = [0x00A0_88E8, 0x00E0_D4FF, 0x0078_98D8];
        for _ in 0..90 {
            self.stars.push((
                ctx.rng.rand_mod(1000) as f32 / 1000.0,
                ctx.rng.rand_mod(1000) as f32 / 1000.0,
                cols[ctx.rng.rand_mod(cols.len() as i32) as usize],
            ));
        }

        if !self.quotes.is_empty() {
            self.quote_idx = ctx.rng.rand_mod(self.quotes.len() as i32) as usize;
        }
        self.frame_idx = 0;
        self.ticks_on_quote = 0;
        self.quotes_since_move = 0;
        self.layout_slot = 0;
        self.tick = 0;

        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.render_scene(ctx.surface);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.tick = self.tick.wrapping_add(1);
        self.ticks_on_quote += 1;

        if let Some(anim) = &self.anim {
            if !anim.frames.is_empty() {
                self.frame_idx = (self.frame_idx + 1) % anim.frames.len();
            }
        }

        if self.ticks_on_quote >= 85 {
            self.ticks_on_quote = 0;
            if !self.quotes.is_empty() {
                self.quote_idx =
                    (self.quote_idx + 1 + ctx.rng.rand_mod(5) as usize) % self.quotes.len();
            }
            self.quotes_since_move += 1;
            if self.quotes_since_move >= self.move_every_quotes {
                self.quotes_since_move = 0;
                self.layout_slot = (self.layout_slot + 1) % 3;
            }
            tng_pack().play_voice(ctx.sound, ctx.system.sound_enabled, SND_BEEP1);
        }

        self.render_scene(ctx.surface);
        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        AdResult::NoError
    }
}
