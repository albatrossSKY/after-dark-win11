//! *Simpsons Trivia* — 1994 *The Simpsons* After Dark 3.0 Module.
//!
//! Features the Sector 7-G **E-Fission-Cy 1000 Core Temperature Regulator**
//! (`RLEP #12000/#12001/#12100` + `OFst/OFtb #12000`) and all **300 authentic
//! `Qery` trivia questions**, complete with animated core temperature gauge,
//! flashing indicator lights, CRT terminal display, and reactor meltdown alarm!

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use super::{
    CompoundAnim, KIND_QERY, MOD_TRIVIA, RlepBank, SND_DETONATE, SND_HOMER_DOH, SND_RIGHT_ANS,
    SND_SIREN, SND_TINY_BEEP1, SND_TINY_BEEP2, SND_WRONG_ANS, SimpsonsPack, draw_bitmap_text,
    draw_line_px, fill_circle_px, fill_rect_px, mac_roman_to_string, wrap_bitmap_text,
};

struct TriviaQuestion {
    question: String,
    choices: [String; 3],
    correct_idx: usize,
}

fn parse_qery(data: &[u8]) -> Option<(String, [String; 3])> {
    let mut p = 0usize;
    let mut parts = Vec::with_capacity(4);
    while p < data.len() && parts.len() < 4 {
        let n = data[p] as usize;
        p += 1;
        let end = (p + n).min(data.len());
        parts.push(mac_roman_to_string(&data[p..end]).trim().to_string());
        p = end;
    }
    if parts.len() < 4 {
        return None;
    }
    Some((
        parts[0].clone(),
        [parts[1].clone(), parts[2].clone(), parts[3].clone()],
    ))
}

#[derive(Clone, Copy, PartialEq, Eq)]
enum TriviaPhase {
    Asking,
    RevealAnswer,
    Meltdown,
}

pub struct SimpsonsTriviaModule {
    bg_bank: RlepBank,
    fx_bank: RlepBank,
    font: RlepBank,
    anim: Option<CompoundAnim>,
    questions: Vec<TriviaQuestion>,
    order: Vec<usize>,
    q_cursor: usize,
    phase: TriviaPhase,
    phase_tick: usize,
    wrong_count: i32,
    meltdown_limit: i32,
    show_answers: bool,
    text_only: bool,
    chosen_idx: usize,
    tick: usize,
}

impl SimpsonsTriviaModule {
    pub fn new() -> Self {
        Self {
            bg_bank: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            fx_bank: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            font: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            anim: None,
            questions: Vec::new(),
            order: Vec::new(),
            q_cursor: 0,
            phase: TriviaPhase::Asking,
            phase_tick: 0,
            wrong_count: 0,
            meltdown_limit: 6,
            show_answers: true,
            text_only: false,
            chosen_idx: 0,
            tick: 0,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "simpsons_trivia".to_string(),
            name: "Simpsons Trivia".to_string(),
            credit: "By Jamie A., Mili, Matt S., Jarir, and Peter.\nSoftware © 1994 Berkeley Systems, Inc.\nThe Simpsons ™ & © Twentieth Century Fox.".to_string(),
            about: "It's you against the E-Fission-Cy 1000 Core Temperature Regulator in this classic battle of wits featuring 300 Simpsons trivia questions. Get too many wrong and Sector 7-G melts down!".to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "Meltdown:".to_string(),
                    default_raw: 50,
                    labels: vec![
                        "1 Wrong".into(),
                        "2 Wrong".into(),
                        "3 Wrong".into(),
                        "4 Wrong".into(),
                        "5 Wrong".into(),
                        "6 Wrong".into(),
                        "7 Wrong".into(),
                        "8 Wrong".into(),
                        "9 Wrong".into(),
                        "10 Wrong".into(),
                        "11 Wrong".into(),
                        "12 Wrong".into(),
                    ],
                    thresholds: vec![0, 9, 18, 27, 36, 45, 54, 63, 72, 81, 90, 99],
                },
                AdControl::Checkbox {
                    title: "Show Answers".to_string(),
                    default_checked: true,
                },
                AdControl::Checkbox {
                    title: "Text Only".to_string(),
                    default_checked: false,
                },
                AdControl::None,
            ],
            target_frame_ms: 80,
            filename: "TRIVIA.AD".to_string(),
        }
    }

    fn ensure_loaded(&mut self, rng: &mut ad_sdk::MsvcRand) {
        if !self.questions.is_empty() {
            return;
        }
        self.bg_bank = RlepBank::load(MOD_TRIVIA, 12000);
        self.fx_bank = RlepBank::load(MOD_TRIVIA, 12001);
        self.font = RlepBank::load(MOD_TRIVIA, 12100);
        self.anim = Some(CompoundAnim::load(MOD_TRIVIA, 12000));

        for (_rid, data) in SimpsonsPack::global().list(MOD_TRIVIA, KIND_QERY) {
            if let Some((q, raw_choices)) = parse_qery(data) {
                // Shuffle the 3 answer positions while tracking where correct (raw_choices[0]) landed
                let mut idxs = [0usize, 1, 2];
                for i in (1..3).rev() {
                    let j = rng.rand_mod((i + 1) as i32) as usize;
                    idxs.swap(i, j);
                }
                let correct_idx = idxs.iter().position(|&k| k == 0).unwrap_or(0);
                let choices = [
                    raw_choices[idxs[0]].clone(),
                    raw_choices[idxs[1]].clone(),
                    raw_choices[idxs[2]].clone(),
                ];
                self.questions.push(TriviaQuestion {
                    question: q,
                    choices,
                    correct_idx,
                });
            }
        }
    }

    fn render_scene(&self, surface: &mut ad_sdk::canvas::AdSurface) {
        let w = surface.width;
        let h = surface.height;
        fill_rect_px(surface, 0, 0, w, h, 0x000A_0D12);

        if self.questions.is_empty() || self.order.is_empty() {
            return;
        }
        let q = &self.questions[self.order[self.q_cursor % self.order.len()]];

        if self.text_only || w < 520 || h < 360 {
            // Crisp green phosphor CRT terminal view (also great in small preview windows)
            let scale = if w >= 1000 { 2 } else { 1 };
            let pad = 18 * scale;
            fill_rect_px(surface, pad, pad, w - pad, h - pad, 0x0006_180A);
            let max_w = (w - pad * 4).max(120);
            let mut y = pad + 14 * scale;
            draw_bitmap_text(
                surface,
                &self.font,
                "E-FISSION-CY 1000 TRIVIA TERMINAL",
                pad + 12 * scale,
                y,
                Some(0x00FF_D838),
                scale,
            );
            y += 22 * scale;
            self.draw_crt_question(surface, q, pad + 12 * scale, y, max_w, scale);
            return;
        }

        // Authentic Sector 7-G 640x480 stage centered on screen (scaled 2x on >= 1280x960!)
        let scale = if w >= 1280 && h >= 960 { 2 } else { 1 };
        let stage_w = 640 * scale;
        let stage_h = 480 * scale;
        let ox = (w - stage_w) / 2;
        let oy = (h - stage_h) / 2;

        // 1. Background Sector 7-G wall & control desk (#12000[0])
        if let Some(bg) = self.bg_bank.frames.first() {
            bg.blit_scaled(surface, ox, oy, scale);
        }
        // 2. E-Fission-Cy 1000 CRT monitor unit (#12000[1] at stage (145, 116))
        if let Some(crt) = self.bg_bank.frames.get(1) {
            crt.blit_scaled(surface, ox + 145 * scale, oy + 116 * scale, scale);
        }

        // 3. Flashing control-board indicator lights from OFtb / fx_bank
        if let Some(anim) = &self.anim {
            let light_idx = 6 + (self.tick / 4) % 8;
            if light_idx < anim.frames.len() {
                anim.draw_stage_frame(surface, light_idx, ox, oy, scale);
            }
            // Blinking right-side safety indicators
            let r_idx = 42 + (self.tick / 5) % 12;
            if r_idx < anim.frames.len() {
                anim.draw_stage_frame(surface, r_idx, ox, oy, scale);
            }
        }

        // 4. Core temperature gauge needle (centered right on the CORE TEMPERATURE dial at stage (556, 444))
        let gauge_cx = ox + 556 * scale;
        let gauge_cy = oy + 444 * scale;
        let frac = (self.wrong_count as f32 / self.meltdown_limit.max(1) as f32).clamp(0.0, 1.0);
        let angle = std::f32::consts::PI * (0.92 - frac * 0.84);
        let nx = gauge_cx + (angle.cos() * 32.0 * scale as f32) as i32;
        let ny = gauge_cy - (angle.sin() * 32.0 * scale as f32) as i32;
        draw_line_px(surface, gauge_cx, gauge_cy, nx, ny, 0x0010_1010, 2 * scale);
        fill_circle_px(surface, gauge_cx, gauge_cy, 4 * scale, 0x00E8_2020);

        // 5. CRT screen glass area inside E-Fission-Cy 1000: stage (178, 146) .. (456, 356)
        let crt_x = ox + 178 * scale;
        let crt_y = oy + 146 * scale;
        let crt_w = 278 * scale;
        let crt_h = 210 * scale;

        if self.phase == TriviaPhase::Meltdown {
            let flash = if (self.tick / 3) % 2 == 0 {
                0x00B8_1010
            } else {
                0x00FF_7010
            };
            fill_rect_px(surface, crt_x, crt_y, crt_x + crt_w, crt_y + crt_h, flash);
            if let Some(mframe) = self.fx_bank.frames.get(46 + (self.tick / 4) % 2) {
                mframe.blit_scaled(surface, ox + 185 * scale, oy + 152 * scale, scale);
            }
            draw_bitmap_text(
                surface,
                &self.font,
                "CORE MELTDOWN!!",
                crt_x + 56 * scale,
                crt_y + 18 * scale,
                Some(0x00FF_FF40),
                scale,
            );
            draw_bitmap_text(
                surface,
                &self.font,
                "D'OH!! RESETTING CORE...",
                crt_x + 36 * scale,
                crt_y + crt_h - 24 * scale,
                Some(0x00FF_FFFF),
                scale,
            );
        } else {
            fill_rect_px(surface, crt_x, crt_y, crt_x + crt_w, crt_y + crt_h, 0x0004_1608);
            self.draw_crt_question(
                surface,
                q,
                crt_x + 8 * scale,
                crt_y + 10 * scale,
                crt_w - 16 * scale,
                scale,
            );
        }
    }

    fn draw_crt_question(
        &self,
        surface: &mut ad_sdk::canvas::AdSurface,
        q: &TriviaQuestion,
        x: i32,
        mut y: i32,
        max_w: i32,
        scale: i32,
    ) {
        let lh = 14 * scale;
        let header = format!(
            "Q#{:03}   ERRORS: {}/{}",
            (self.order[self.q_cursor % self.order.len()]) + 1,
            self.wrong_count,
            self.meltdown_limit
        );
        draw_bitmap_text(surface, &self.font, &header, x, y, Some(0x0050_C8FF), scale);
        y += lh + 4 * scale;

        for line in wrap_bitmap_text(&self.font, &q.question, max_w, scale) {
            draw_bitmap_text(surface, &self.font, &line, x, y, Some(0x0058_FF78), scale);
            y += lh;
        }
        y += 8 * scale;

        let labels = ["A)", "B)", "C)"];
        for (i, choice) in q.choices.iter().enumerate() {
            let color = match self.phase {
                TriviaPhase::Asking => 0x00D8_F0D8,
                TriviaPhase::RevealAnswer => {
                    if self.show_answers && i == q.correct_idx {
                        0x00FF_EA30
                    } else if i == self.chosen_idx && i != q.correct_idx {
                        0x00FF_4848
                    } else {
                        0x0048_7852
                    }
                }
                TriviaPhase::Meltdown => 0x00FF_4040,
            };
            let prefix = if self.phase == TriviaPhase::RevealAnswer
                && self.show_answers
                && i == q.correct_idx
            {
                format!("*{} {}", labels[i], choice)
            } else {
                format!(" {} {}", labels[i], choice)
            };
            for line in wrap_bitmap_text(&self.font, &prefix, max_w, scale) {
                draw_bitmap_text(surface, &self.font, &line, x, y, Some(color), scale);
                y += lh;
            }
            y += 3 * scale;
        }
    }
}

impl Default for SimpsonsTriviaModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for SimpsonsTriviaModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded(ctx.rng);

        let raw = ctx.module.raw_control_value[0].clamp(0, 100);
        self.meltdown_limit = (1 + raw / 9).clamp(1, 12);
        self.show_answers = ctx.module.raw_control_value[1] != 0;
        self.text_only = ctx.module.raw_control_value[2] != 0;

        self.order = (0..self.questions.len()).collect();
        for i in (1..self.order.len()).rev() {
            let j = ctx.rng.rand_mod((i + 1) as i32) as usize;
            self.order.swap(i, j);
        }
        self.q_cursor = 0;
        self.wrong_count = 0;
        self.phase = TriviaPhase::Asking;
        self.phase_tick = 0;
        self.tick = 0;
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.render_scene(ctx.surface);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.tick = self.tick.wrapping_add(1);
        self.phase_tick += 1;
        let pack = SimpsonsPack::global();

        match self.phase {
            TriviaPhase::Asking => {
                if self.phase_tick == 1 {
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_TINY_BEEP1);
                }
                if self.phase_tick >= 65 {
                    self.phase = TriviaPhase::RevealAnswer;
                    self.phase_tick = 0;
                    if let Some(q) = self
                        .order
                        .get(self.q_cursor % self.order.len().max(1))
                        .and_then(|&idx| self.questions.get(idx))
                    {
                        // Simulate Homer operating Sector 7-G (~55% right, ~45% wrong -> eventual meltdown!)
                        if ctx.rng.rand_mod(100) < 55 {
                            self.chosen_idx = q.correct_idx;
                            pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_RIGHT_ANS);
                        } else {
                            self.chosen_idx = (q.correct_idx + 1) % 3;
                            self.wrong_count += 1;
                            let snd = if ctx.rng.rand_mod(2) == 0 {
                                SND_WRONG_ANS
                            } else {
                                SND_HOMER_DOH
                            };
                            pack.play_voice(ctx.sound, ctx.system.sound_enabled, snd);
                        }
                    }
                }
            }
            TriviaPhase::RevealAnswer => {
                if self.phase_tick >= 42 {
                    if self.wrong_count >= self.meltdown_limit {
                        self.phase = TriviaPhase::Meltdown;
                        self.phase_tick = 0;
                        pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_SIREN);
                    } else {
                        self.q_cursor = (self.q_cursor + 1) % self.order.len().max(1);
                        self.phase = TriviaPhase::Asking;
                        self.phase_tick = 0;
                        pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_TINY_BEEP2);
                    }
                }
            }
            TriviaPhase::Meltdown => {
                if self.phase_tick == 20 {
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_DETONATE);
                }
                if self.phase_tick >= 52 {
                    self.wrong_count = 0;
                    self.q_cursor = (self.q_cursor + 1) % self.order.len().max(1);
                    self.phase = TriviaPhase::Asking;
                    self.phase_tick = 0;
                }
            }
        }

        self.render_scene(ctx.surface);
        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        AdResult::NoError
    }
}
