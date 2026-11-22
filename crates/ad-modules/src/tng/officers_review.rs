//! *Officer's Review* — 1994 *Star Trek: The Next Generation* After Dark 3.0 Module.
//!
//! Full-widescreen responsive Starfleet Academy LCARS `"OFFICER'S REVIEW"`
//! examination console featuring the authentic United Federation of Planets
//! seal (`RLEP #1041`), high-DPI native LCARS bitmap fonts (`14..50px`),
//! aligned countdown timer bar, and all **97 authentic Star Trek: TNG exam
//! questions** (`STR# #2000`) with Starfleet commendation/reprimand reviews.

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::simpsons::{
    KIND_STR_LIST, RlepBank, draw_bitmap_text, fill_rect_px, measure_bitmap_text, parse_str_list,
    wrap_bitmap_text,
};
use super::{
    LCARS_AMBER, LCARS_GOLD, LCARS_GREEN, LCARS_LAVENDER, LCARS_PEACH, LCARS_PERIWINKLE, LCARS_RED,
    LCARS_SALMON, LCARS_SKY, LcarsFontSet, MOD_OFFICERS_REVIEW, SND_ALARM, SND_BEEP1, SND_BEEP2,
    SND_BEEP_HIGH, draw_lcars_elbow_bl, draw_lcars_elbow_tl, fill_rounded_rect, lcars_upper,
    load_rlep, tng_pack,
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
    seal_bank: RlepBank,
    fonts: LcarsFontSet,
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
            seal_bank: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            fonts: LcarsFontSet::empty(),
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
        self.seal_bank = load_rlep(MOD_OFFICERS_REVIEW, 1041);
        self.fonts.ensure_loaded();

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
        let q_num = self.order[self.cursor % self.order.len()];
        let q = &self.questions[q_num];

        let pad = (h / 40).clamp(8, 28);
        let title_px = (h / 16).clamp(18, 52);
        let body_px = (h / 26).clamp(14, 34);
        let choice_px = (h / 24).clamp(14, 36);
        let small_px = (h / 34).clamp(14, 22);

        let (f_title, s_title, lh_title) = self.fonts.pick(title_px);
        let (f_body, s_body, lh_body) = self.fonts.pick(body_px);
        let (f_choice, s_choice, lh_choice) = self.fonts.pick(choice_px);
        let (f_small, s_small, _) = self.fonts.pick(small_px);

        if self.text_only || w < 420 || h < 300 {
            let x = pad * 2;
            let mut y = pad * 2;
            let max_w = (w - pad * 4).max(120);
            draw_bitmap_text(surface, f_title, "OFFICER'S REVIEW", x, y, Some(LCARS_AMBER), s_title);
            y += lh_title + pad / 2;
            for ln in wrap_bitmap_text(f_body, &lcars_upper(&q.question), max_w, s_body) {
                draw_bitmap_text(surface, f_body, &ln, x, y, Some(LCARS_PEACH), s_body);
                y += lh_body;
            }
            y += pad;
            for (idx, ch) in q.choices.iter().enumerate() {
                let is_ans =
                    self.phase == ReviewPhase::ShowingAnswer && self.show_answer && idx == q.correct_idx;
                let col = if is_ans { LCARS_GREEN } else { 0x00E8_ECFF };
                let line = lcars_upper(&format!("{:02}: {}", idx + 1, ch));
                for wl in wrap_bitmap_text(f_choice, &line, max_w, s_choice) {
                    draw_bitmap_text(surface, f_choice, &wl, x, y, Some(col), s_choice);
                    y += lh_choice;
                }
                y += pad / 3;
            }
            return;
        }

        // Full-widescreen responsive LCARS Officer's Review Frame!
        let ox = pad;
        let oy = pad;
        let fw = w - pad * 2;
        let fh = h - pad * 2;
        let bar_w = (fw / 7).clamp(76, 210);
        let top_h = (lh_title + 8).clamp(26, 66);
        let bot_h = (h / 24).clamp(18, 42);
        let gap = (h / 110).clamp(4, 10);

        // Top curved LCARS elbow + header title cutout
        let top_arm_h = (fh * 36) / 100;
        draw_lcars_elbow_tl(surface, ox, oy, bar_w, top_h, top_arm_h, fw - top_h, LCARS_GOLD);
        // Right rounded cap on top bar
        fill_rounded_rect(
            surface,
            ox + fw - top_h,
            oy,
            ox + fw,
            oy + top_h,
            top_h / 2,
            LCARS_GOLD,
        );
        // Black title cutout on upper-right of top bar with crisp "OFFICER'S REVIEW" title
        let title_str = "OFFICER'S REVIEW";
        let title_w = measure_bitmap_text(f_title, title_str, s_title);
        let t_cut_x = (ox + fw - title_w - top_h - pad).max(ox + bar_w + pad * 2);
        fill_rect_px(surface, t_cut_x - pad / 2, oy, ox + fw - top_h - pad / 2, oy + top_h, 0x0000_0000);
        draw_bitmap_text(
            surface,
            f_title,
            title_str,
            t_cut_x,
            oy + ((top_h - lh_title) / 2).max(2),
            Some(LCARS_LAVENDER),
            s_title,
        );

        // Bottom curved LCARS elbow
        let bot_arm_h = (fh - top_arm_h - gap).max(bot_h + 40);
        draw_lcars_elbow_bl(
            surface,
            ox,
            oy + fh,
            bar_w,
            bot_h,
            bot_arm_h,
            fw - bot_h,
            LCARS_GOLD,
        );
        fill_rounded_rect(
            surface,
            ox + fw - bot_h,
            oy + fh - bot_h,
            ox + fw,
            oy + fh,
            bot_h / 2,
            LCARS_AMBER,
        );

        // Left sidebar LCARS buttons inside the top and bottom arms
        let btn_x = ox;
        let btn_w = bar_w;
        let q_btn_y = oy + top_h + gap * 2;
        let q_btn_h = (top_arm_h - top_h - gap * 3).max(24);
        fill_rect_px(surface, btn_x, q_btn_y, btn_x + btn_w, q_btn_y + q_btn_h, LCARS_LAVENDER);
        draw_bitmap_text(
            surface,
            f_small,
            "QUESTION",
            btn_x + 8,
            q_btn_y + 6,
            Some(0x0000_0000),
            s_small,
        );
        let q_code = format!("LCARS {:02}/{:02}", q_num + 1, self.questions.len());
        if q_btn_h > 44 {
            draw_bitmap_text(
                surface,
                f_small,
                &q_code,
                btn_x + 8,
                q_btn_y + q_btn_h - 20 * s_small,
                Some(0x0000_0000),
                s_small,
            );
        }

        // Content viewport to the right of sidebar
        let vx = ox + bar_w + pad * 2;
        let vw = (ox + fw - vx - pad).max(160);

        // Optional Federation Seal on upper-right in widescreen/standard mode
        let seal_reserve = if !self.seal_bank.frames.is_empty() && vw >= 400 {
            let seal = &self.seal_bank.frames[0];
            let target_h = ((top_arm_h - top_h) as f32 * 0.88).clamp(64.0, 220.0);
            let sf = (target_h / seal.h.max(1) as f32).min((vw as f32 * 0.28) / seal.w.max(1) as f32);
            let sw = (seal.w as f32 * sf).round() as i32;
            let sh = (seal.h as f32 * sf).round() as i32;
            let sx = vx + vw - sw;
            let sy = oy + top_h + ((top_arm_h - top_h - sh) / 2).max(4);
            seal.blit_rect(surface, sx, sy, sw, sh, false, false, true, true);
            sw + pad * 2
        } else {
            0
        };

        // Question header + wrapped question text cleanly inside upper viewport
        let q_max_w = (vw - seal_reserve).max(180);
        let mut qy = oy + top_h + pad;
        let q_hdr = format!(
            "STARFLEET ACADEMY EXAMINATION  //  ITEM {:02} OF {}",
            q_num + 1,
            self.questions.len()
        );
        draw_bitmap_text(surface, f_small, &q_hdr, vx, qy, Some(LCARS_LAVENDER), s_small);
        qy += (small_px + 6).max(18);
        for ln in wrap_bitmap_text(f_body, &lcars_upper(&q.question), q_max_w, s_body) {
            if qy + lh_body > oy + top_arm_h - 4 {
                break;
            }
            draw_bitmap_text(surface, f_body, &ln, vx, qy, Some(LCARS_AMBER), s_body);
            qy += lh_body;
        }

        // Aligned horizontal TIMER divider bar separating Question & Answers!
        let div_y = oy + top_arm_h;
        let div_h = (h / 26).clamp(16, 30);
        // Salmon-pink horizontal LCARS elbow stub + "TIMER" pill
        let timer_pill_w = (bar_w + (vw / 6).clamp(70, 140)).min(fw / 3);
        fill_rounded_rect(
            surface,
            ox,
            div_y,
            ox + timer_pill_w,
            div_y + div_h,
            div_h / 2,
            LCARS_SALMON,
        );
        draw_bitmap_text(
            surface,
            f_small,
            "TIMER",
            ox + timer_pill_w - measure_bitmap_text(f_small, "TIMER", s_small) - 14,
            div_y + ((div_h - small_px) / 2).max(1),
            Some(0x0000_0000),
            s_small,
        );

        // Countdown progress bar aligned PERFECTLY inline to the right of the TIMER pill!
        let track_x0 = ox + timer_pill_w + pad;
        let track_x1 = ox + fw - div_h - gap;
        let track_w = (track_x1 - track_x0).max(40);
        let frac = if self.phase == ReviewPhase::Asking {
            1.0 - (self.phase_ticks as f32 / self.ask_ticks.max(1) as f32).clamp(0.0, 1.0)
        } else {
            0.0
        };
        fill_rounded_rect(surface, track_x0, div_y + 2, track_x1, div_y + div_h - 2, (div_h - 4) / 2, 0x001E_1A2E);
        let bar_w_px = ((track_w as f32) * frac) as i32;
        if bar_w_px > 4 {
            let bar_col = if frac > 0.3 { LCARS_SKY } else { LCARS_RED };
            fill_rounded_rect(
                surface,
                track_x0,
                div_y + 2,
                track_x0 + bar_w_px,
                div_y + div_h - 2,
                (div_h - 4) / 2,
                bar_col,
            );
        }
        fill_rounded_rect(surface, track_x1 + gap, div_y, ox + fw, div_y + div_h, div_h / 2, LCARS_LAVENDER);

        // 4 Multiple-choice answers with aligned 01/02/03/04 LCARS left-sidebar buttons!
        let ans_top = div_y + div_h + pad;
        let eval_reserve = (lh_body * 2 + pad).max(48);
        let ans_avail_h = (oy + fh - bot_h - ans_top - eval_reserve).max(96);
        let row_h = (ans_avail_h / 4).max(24);
        let labels = ["01", "02", "03", "04"];
        let pill_cols = [LCARS_PERIWINKLE, LCARS_LAVENDER, LCARS_PERIWINKLE, LCARS_LAVENDER];

        for (idx, choice) in q.choices.iter().enumerate() {
            let ry = ans_top + (idx as i32) * row_h;
            let is_ans =
                self.phase == ReviewPhase::ShowingAnswer && self.show_answer && idx == q.correct_idx;
            let pill_col = if is_ans {
                LCARS_GREEN
            } else if self.phase == ReviewPhase::ShowingAnswer {
                0x0048_4468
            } else {
                pill_cols[idx]
            };
            // Left sidebar numbered button aligned cleanly with each answer row!
            fill_rect_px(surface, btn_x, ry, btn_x + btn_w, ry + row_h - gap, pill_col);
            let lbl_w = measure_bitmap_text(f_choice, labels[idx], s_choice);
            draw_bitmap_text(
                surface,
                f_choice,
                labels[idx],
                btn_x + btn_w - lbl_w - 10,
                ry + ((row_h - gap - lh_choice) / 2).max(2),
                Some(0x0000_0000),
                s_choice,
            );

            let text_col = if is_ans {
                LCARS_GREEN
            } else if self.phase == ReviewPhase::ShowingAnswer {
                0x0064_6C88
            } else {
                0x00EC_F0FF
            };
            let line = lcars_upper(&format!("{}:  {}", labels[idx], choice));
            let mut ay = ry + ((row_h - gap - lh_choice) / 2).max(2);
            for wl in wrap_bitmap_text(f_choice, &line, vw, s_choice).iter().take(2) {
                draw_bitmap_text(surface, f_choice, wl, vx, ay, Some(text_col), s_choice);
                ay += lh_choice;
            }
        }

        // Bottom sidebar "RESPONSE ANALYSIS" badge + Evaluation commentary during ShowingAnswer
        let eval_y = ans_top + row_h * 4 + gap;
        let eval_bot = oy + fh - bot_h - gap;
        if eval_bot > eval_y + 16 {
            fill_rect_px(surface, btn_x, eval_y, btn_x + btn_w, eval_bot, LCARS_PEACH);
            draw_bitmap_text(
                surface,
                f_small,
                "ANALYSIS",
                btn_x + 8,
                eval_y + 4,
                Some(0x0000_0000),
                s_small,
            );
            if self.phase == ReviewPhase::ShowingAnswer && !self.comment_text.is_empty() {
                let mut cy = eval_y + 2;
                for ln in wrap_bitmap_text(f_body, &lcars_upper(&self.comment_text), vw, s_body) {
                    if cy + lh_body > eval_bot + 4 {
                        break;
                    }
                    draw_bitmap_text(surface, f_body, &ln, vx, cy, Some(LCARS_AMBER), s_body);
                    cy += lh_body;
                }
            } else {
                draw_bitmap_text(
                    surface,
                    f_small,
                    "AWAITING CANDIDATE RESPONSE // STAND BY...",
                    vx,
                    eval_y + 6,
                    Some(LCARS_SKY),
                    s_small,
                );
            }
        }

        // Footer LCARS telemetry code inside bottom bar
        let footer = format!(
            "STARFLEET ACADEMY // LCARS 47{:03} // NCC-1701-D",
            (self.tick / 4) % 999
        );
        draw_bitmap_text(
            surface,
            f_small,
            &footer,
            vx,
            oy + fh - bot_h + ((bot_h - small_px) / 2).max(1),
            Some(0x0000_0000),
            s_small,
        );
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
