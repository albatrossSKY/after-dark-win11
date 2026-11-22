//! *Officer's Review* — 1994 *Star Trek: The Next Generation* After Dark 3.0 Module.
//!
//! Starfleet Academy's LCARS `"OFFICER'S REVIEW"` examination console
//! (`RLEP #1040` `640x480` LCARS frame + `#1041` United Federation of Planets
//! seal + `#1042` indicators) featuring all **97 authentic Star Trek: TNG
//! exam questions** (`STR# #2000`) and Starfleet commendation/reprimand reviews.

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::simpsons::{
    KIND_STR_LIST, RlepBank, draw_bitmap_text, fill_rect_px, parse_str_list, wrap_bitmap_text,
};
use super::{
    FONT_LCARS_14, FONT_LCARS_18, MOD_OFFICERS_REVIEW, SND_ALARM, SND_BEEP1, SND_BEEP2,
    SND_BEEP_HIGH, load_lcars_font, load_rlep, tng_pack,
};

struct ExamQuestion {
    question: String,
    choices: [String; 4],
    correct_idx: usize,
}

#[derive(Clone, Copy, PartialEq, Eq)]
enum ReviewPhase {
    Asking,
    ShowingAnswer,
}

pub struct OfficersReviewModule {
    lcars_bg: RlepBank,
    seal_bank: RlepBank,
    icons_bank: RlepBank,
    font14: RlepBank,
    font18: RlepBank,
    questions: Vec<ExamQuestion>,
    pos_comments: Vec<String>,
    neg_comments: Vec<String>,
    order: Vec<usize>,
    cursor: usize,
    phase: ReviewPhase,
    phase_ticks: usize,
    ask_ticks: usize,
    show_answer: bool,
    text_only: bool,
    comment_text: String,
    tick: usize,
}

impl OfficersReviewModule {
    pub fn new() -> Self {
        Self {
            lcars_bg: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            seal_bank: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            icons_bank: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            font14: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            font18: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            questions: Vec::new(),
            pos_comments: Vec::new(),
            neg_comments: Vec::new(),
            order: Vec::new(),
            cursor: 0,
            phase: ReviewPhase::Asking,
            phase_ticks: 0,
            ask_ticks: 80,
            show_answer: true,
            text_only: false,
            comment_text: String::new(),
            tick: 0,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "tng_officers_review".to_string(),
            name: "Officer's Review".to_string(),
            filename: "REVIEW.AD".to_string(),
            credit: "By E. Gibbs, R. Ho, D. Muise & G. Torrence.\nSoftware © 1994 Berkeley Systems, Inc.\nStar Trek: TNG ™ & © Paramount Pictures.".to_string(),
            about: "Test your Starfleet Academy readiness on the LCARS Officer's Review examination console featuring 97 authentic Star Trek: The Next Generation trivia questions.".to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "Timer:".to_string(),
                    default_raw: 60,
                    labels: vec![
                        "5 seconds".into(),
                        "10 seconds".into(),
                        "15 seconds".into(),
                        "20 seconds".into(),
                        "25 seconds".into(),
                        "30 seconds".into(),
                    ],
                    thresholds: vec![0, 20, 40, 60, 80, 99],
                },
                AdControl::Checkbox {
                    title: "Show Answer".to_string(),
                    default_checked: true,
                },
                AdControl::Checkbox {
                    title: "Text Only".to_string(),
                    default_checked: false,
                },
                AdControl::None,
            ],
            target_frame_ms: 90,
        }
    }

    fn ensure_loaded(&mut self, rng: &mut ad_sdk::MsvcRand) {
        if !self.questions.is_empty() {
            return;
        }
        self.lcars_bg = load_rlep(MOD_OFFICERS_REVIEW, 1040);
        self.seal_bank = load_rlep(MOD_OFFICERS_REVIEW, 1041);
        self.icons_bank = load_rlep(MOD_OFFICERS_REVIEW, 1042);
        self.font14 = load_lcars_font(FONT_LCARS_14);
        self.font18 = load_lcars_font(FONT_LCARS_18);

        let pack = tng_pack();
        if let Some(raw) = pack.get(MOD_OFFICERS_REVIEW, KIND_STR_LIST, 130) {
            self.pos_comments = parse_str_list(raw);
        }
        if let Some(raw) = pack.get(MOD_OFFICERS_REVIEW, KIND_STR_LIST, 131) {
            self.neg_comments = parse_str_list(raw);
        }
        if let Some(raw) = pack.get(MOD_OFFICERS_REVIEW, KIND_STR_LIST, 2000) {
            let items = parse_str_list(raw);
            let mut i = 0;
            while i + 4 < items.len() {
                let q = items[i].trim().to_string();
                let raw_c = [
                    items[i + 1].trim().to_string(),
                    items[i + 2].trim().to_string(),
                    items[i + 3].trim().to_string(),
                    items[i + 4].trim().to_string(),
                ];
                let mut perm = [0usize, 1, 2, 3];
                for k in (1..4).rev() {
                    let j = rng.rand_mod((k + 1) as i32) as usize;
                    perm.swap(k, j);
                }
                let correct_idx = perm.iter().position(|&p| p == 0).unwrap_or(0);
                self.questions.push(ExamQuestion {
                    question: q,
                    choices: [
                        raw_c[perm[0]].clone(),
                        raw_c[perm[1]].clone(),
                        raw_c[perm[2]].clone(),
                        raw_c[perm[3]].clone(),
                    ],
                    correct_idx,
                });
                i += 5;
            }
        }
    }

    fn render_console(&self, surface: &mut ad_sdk::canvas::AdSurface) {
        let w = surface.width;
        let h = surface.height;
        fill_rect_px(surface, 0, 0, w, h, 0x0000_0000);

        if self.questions.is_empty() || self.order.is_empty() {
            return;
        }
        let q = &self.questions[self.order[self.cursor % self.order.len()]];

        if self.text_only || w < 520 || h < 380 {
            let s = if w >= 1000 { 2 } else { 1 };
            let x = 16 * s;
            let mut y = 14 * s;
            let max_w = (w - 32 * s).max(120);
            draw_bitmap_text(
                surface,
                &self.font14,
                "STARFLEET OFFICER'S REVIEW",
                x,
                y,
                Some(0x00FF_AA38),
                s,
            );
            y += 22 * s;
            self.draw_question_block(surface, q, x, y, max_w, s);
            return;
        }

        // Authentic 640x480 LCARS frame centered (scaled 2x on >= 1280x960)
        let s = if w >= 1280 && h >= 960 { 2 } else { 1 };
        let ox = (w - 640 * s) / 2;
        let oy = (h - 480 * s) / 2;

        if let Some(bg) = self.lcars_bg.frames.first() {
            bg.blit_scaled(surface, ox, oy, s);
        }

        // LCARS blinking indicator chip from #1042
        if !self.icons_bank.frames.is_empty() {
            let ii = (self.tick / 8) % self.icons_bank.frames.len();
            self.icons_bank.frames[ii].blit_scaled(surface, ox + 462 * s, oy + 52 * s, s);
        }

        // Question header cleanly inside upper LCARS black viewport: stage (184, 54)..(456, 152)
        let qx = ox + 186 * s;
        let qy = oy + 54 * s;
        let q_max_w = 270 * s;
        let q_hdr = format!(
            "EXAMINATION ITEM {:02}/{}",
            (self.order[self.cursor % self.order.len()]) + 1,
            self.questions.len()
        );
        draw_bitmap_text(surface, &self.font14, &q_hdr, qx, qy, Some(0x00C8_90FF), s);

        let mut ty = qy + 20 * s;
        for ln in wrap_bitmap_text(&self.font14, &super::lcars_upper(&q.question), q_max_w, s) {
            draw_bitmap_text(surface, &self.font14, &ln, qx, ty, Some(0x00FF_C448), s);
            ty += 16 * s;
        }

        // Countdown LCARS bar aligned neatly to right of TIMER pill: stage (326, 180)..(610, 188)
        let frac = if self.phase == ReviewPhase::Asking {
            1.0 - (self.phase_ticks as f32 / self.ask_ticks.max(1) as f32).clamp(0.0, 1.0)
        } else {
            0.0
        };
        let bar_total = 272 * s;
        let bar_w = (bar_total as f32 * frac) as i32;
        fill_rect_px(
            surface,
            ox + 332 * s,
            oy + 180 * s,
            ox + 332 * s + bar_total,
            oy + 188 * s,
            0x0024_2034,
        );
        if bar_w > 0 {
            let bar_col = if frac > 0.3 { 0x0060_C8FF } else { 0x00FF_5444 };
            fill_rect_px(
                surface,
                ox + 332 * s,
                oy + 180 * s,
                ox + 332 * s + bar_w,
                oy + 188 * s,
                bar_col,
            );
        }

        // 4 Multiple-choice answers aligned cleanly beside the 01/02/03/04 LCARS buttons (x = 186..610)
        let a_max_w = 420 * s;
        let row_ys = [212, 244, 276, 308];
        let labels = ["01:", "02:", "03:", "04:"];
        for (idx, choice) in q.choices.iter().enumerate() {
            let is_ans = self.phase == ReviewPhase::ShowingAnswer
                && self.show_answer
                && idx == q.correct_idx;
            let col = if is_ans {
                0x0058_FF88
            } else if self.phase == ReviewPhase::ShowingAnswer {
                0x005A_6080
            } else {
                0x00E8_ECFF
            };
            let line = super::lcars_upper(&format!("{}  {}", labels[idx], choice));
            let mut ay = oy + row_ys[idx] * s;
            for wl in wrap_bitmap_text(&self.font18, &line, a_max_w, s) {
                draw_bitmap_text(surface, &self.font18, &wl, ox + 186 * s, ay, Some(col), s);
                ay += 20 * s;
            }
        }

        // Evaluation comment at bottom of viewport during ShowingAnswer
        if self.phase == ReviewPhase::ShowingAnswer && !self.comment_text.is_empty() {
            let mut cy = oy + 364 * s;
            for ln in wrap_bitmap_text(&self.font14, &super::lcars_upper(&self.comment_text), a_max_w, s) {
                if cy + 16 * s > oy + 444 * s {
                    break;
                }
                draw_bitmap_text(
                    surface,
                    &self.font14,
                    &ln,
                    ox + 186 * s,
                    cy,
                    Some(0x00FF_AA44),
                    s,
                );
                cy += 16 * s;
            }
        }
    }

    fn draw_question_block(
        &self,
        surface: &mut ad_sdk::canvas::AdSurface,
        q: &ExamQuestion,
        x: i32,
        mut y: i32,
        max_w: i32,
        s: i32,
    ) {
        let lh = 16 * s;
        for ln in wrap_bitmap_text(&self.font14, &q.question, max_w, s) {
            draw_bitmap_text(surface, &self.font14, &ln, x, y, Some(0x00FF_D058), s);
            y += lh;
        }
        y += 8 * s;
        for (idx, ch) in q.choices.iter().enumerate() {
            let is_ans = self.phase == ReviewPhase::ShowingAnswer
                && self.show_answer
                && idx == q.correct_idx;
            let col = if is_ans { 0x0058_FF88 } else { 0x00D8_E4FF };
            let line = format!("{}) {}", idx + 1, ch);
            for wl in wrap_bitmap_text(&self.font14, &line, max_w, s) {
                draw_bitmap_text(surface, &self.font14, &wl, x, y, Some(col), s);
                y += lh;
            }
            y += 3 * s;
        }
    }
}

impl Default for OfficersReviewModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for OfficersReviewModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded(ctx.rng);
        let timer_raw = ctx.module.raw_control_value[0].clamp(0, 100);
        let secs = 5 + (timer_raw * 25) / 100;
        self.ask_ticks = (secs * 11).max(35) as usize;
        self.show_answer = ctx.module.raw_control_value[1] != 0;
        self.text_only = ctx.module.raw_control_value[2] != 0;

        self.order = (0..self.questions.len()).collect();
        for i in (1..self.order.len()).rev() {
            let j = ctx.rng.rand_mod((i + 1) as i32) as usize;
            self.order.swap(i, j);
        }
        self.cursor = 0;
        self.phase = ReviewPhase::Asking;
        self.phase_ticks = 0;
        self.comment_text.clear();
        self.tick = 0;

        tng_pack().play_voice(ctx.sound, ctx.system.sound_enabled, SND_BEEP1);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.render_console(ctx.surface);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.tick = self.tick.wrapping_add(1);
        self.phase_ticks += 1;
        let pack = tng_pack();

        match self.phase {
            ReviewPhase::Asking => {
                if self.phase_ticks >= self.ask_ticks {
                    self.phase = ReviewPhase::ShowingAnswer;
                    self.phase_ticks = 0;
                    if ctx.rng.rand_mod(100) < 65 && !self.pos_comments.is_empty() {
                        let i = ctx.rng.rand_mod(self.pos_comments.len() as i32) as usize;
                        self.comment_text = self.pos_comments[i].clone();
                        pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_BEEP_HIGH);
                    } else if !self.neg_comments.is_empty() {
                        let i = ctx.rng.rand_mod(self.neg_comments.len() as i32) as usize;
                        self.comment_text = self.neg_comments[i].clone();
                        pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_ALARM);
                    }
                }
            }
            ReviewPhase::ShowingAnswer => {
                if self.phase_ticks >= 48 {
                    self.cursor = (self.cursor + 1) % self.order.len().max(1);
                    self.phase = ReviewPhase::Asking;
                    self.phase_ticks = 0;
                    self.comment_text.clear();
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_BEEP2);
                }
            }
        }

        self.render_console(ctx.surface);
        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        AdResult::NoError
    }
}
