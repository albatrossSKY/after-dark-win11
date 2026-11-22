//! *Counselor Troi* — 1994 *Star Trek: The Next Generation* After Dark 3.0 Module.
//!
//! Commander Deanna Troi offers empathic Betazoid advice across 578 animated
//! portrait frames (`OFst/OFtb #17000`) and all 191 authentic counseling quotes
//! (`STR# #17000..#17008`) displayed in an LCARS counseling readout.

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::simpsons::{
    CompoundAnim, KIND_STR_LIST, RlepBank, draw_bitmap_text, draw_rect_outline_px, fill_rect_px,
    parse_str_list, wrap_bitmap_text,
};
use super::{FONT_LCARS_14, MOD_TROI, SND_BEEP1, load_anim, load_lcars_font, tng_pack};

pub struct CounselorTroiModule {
    anim: Option<CompoundAnim>,
    font: RlepBank,
    quotes: Vec<String>,
    quote_idx: usize,
    frame_idx: usize,
    ticks_on_quote: usize,
    quotes_since_move: usize,
    move_every_quotes: usize,
    show_text: bool,
    anchor_x: i32,
    anchor_y: i32,
    scale: i32,
    tick: usize,
}

impl CounselorTroiModule {
    pub fn new() -> Self {
        Self {
            anim: None,
            font: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            quotes: Vec::new(),
            quote_idx: 0,
            frame_idx: 0,
            ticks_on_quote: 0,
            quotes_since_move: 0,
            move_every_quotes: 1,
            show_text: true,
            anchor_x: 320,
            anchor_y: 200,
            scale: 1,
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
        self.font = load_lcars_font(FONT_LCARS_14);
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

    fn pick_anchor(&mut self, w: i32, h: i32, rng: &mut ad_sdk::MsvcRand) {
        let s = self.scale;
        let box_w = (360 * s).min(w - 24).max(160);
        let box_h = (250 * s).min(h - 24).max(150);
        let max_x = (w - box_w).max(1);
        let max_y = (h - box_h).max(1);
        self.anchor_x = (w - box_w) / 2;
        self.anchor_y = (h - box_h) / 2;
        if max_x > 20 && max_y > 20 {
            self.anchor_x = 12 + rng.rand_mod((max_x - 12).max(1));
            self.anchor_y = 12 + rng.rand_mod((max_y - 12).max(1));
        }
    }

    fn render_scene(&self, surface: &mut ad_sdk::canvas::AdSurface) {
        let w = surface.width;
        let h = surface.height;
        fill_rect_px(surface, 0, 0, w, h, 0x0005_040C);

        let s = self.scale;
        let card_w = (380 * s).min(w - 20).max(200);
        let cx = (self.anchor_x + card_w / 2).clamp(card_w / 2 + 10, w - card_w / 2 - 10);
        let portrait_top = self.anchor_y.clamp(12, (h - 200 * s).max(12));

        // Subtle Betazoid starlight halo behind Deanna Troi
        if let Some(anim) = &self.anim {
            if !anim.frames.is_empty() {
                let fi = self.frame_idx % anim.frames.len();
                // Troi stage bbox is (286,50)..(435,211), center x=360, top=50
                let ox = cx - 360 * s;
                let oy = portrait_top - 50 * s;
                anim.draw_stage_frame(surface, fi, ox, oy, s);
            }
        }

        // LCARS counseling quote box directly below Troi
        if self.show_text && !self.quotes.is_empty() {
            let quote = &self.quotes[self.quote_idx % self.quotes.len()];
            let bx = (cx - card_w / 2).clamp(10, (w - card_w - 10).max(10));
            let by = (portrait_top + 166 * s).min(h - 74 * s).max(10);
            let bh = (72 * s).min(h - by - 8).max(46);

            fill_rect_px(surface, bx, by, bx + card_w, by + bh, 0x0012_0E22);
            // Signature LCARS lavender-gold left sidebar & top accent pill
            fill_rect_px(surface, bx, by, bx + 12 * s, by + bh, 0x00C8_88E8);
            fill_rect_px(surface, bx, by, bx + card_w, by + 5 * s, 0x00F4_A840);
            draw_rect_outline_px(surface, bx, by, bx + card_w, by + bh, 0x0090_68C8, 1);

            let text_x = bx + 18 * s;
            let mut text_y = by + 10 * s;
            let max_w = (card_w - 26 * s).max(100);
            let upper = super::lcars_upper(quote);
            let lines = wrap_bitmap_text(&self.font, &upper, max_w, s);
            for ln in lines.iter().take(4) {
                if text_y + 14 * s > by + bh - 4 {
                    break;
                }
                draw_bitmap_text(surface, &self.font, ln, text_x, text_y, Some(0x00FF_D888), s);
                text_y += 15 * s;
            }
        }
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
        self.scale = if ctx.surface.width >= 1000 && ctx.surface.height >= 640 {
            2
        } else {
            1
        };

        if !self.quotes.is_empty() {
            self.quote_idx = ctx.rng.rand_mod(self.quotes.len() as i32) as usize;
        }
        self.frame_idx = 0;
        self.ticks_on_quote = 0;
        self.quotes_since_move = 0;
        self.tick = 0;
        let w = ctx.surface.width;
        let h = ctx.surface.height;
        self.anchor_x = (w - (380 * self.scale).min(w - 20)) / 2;
        self.anchor_y = (h - 240 * self.scale).max(20) / 2;

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
                self.quote_idx = (self.quote_idx + 1 + ctx.rng.rand_mod(5) as usize) % self.quotes.len();
            }
            self.quotes_since_move += 1;
            if self.quotes_since_move >= self.move_every_quotes {
                self.quotes_since_move = 0;
                let w = ctx.surface.width;
                let h = ctx.surface.height;
                self.pick_anchor(w, h, ctx.rng);
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
