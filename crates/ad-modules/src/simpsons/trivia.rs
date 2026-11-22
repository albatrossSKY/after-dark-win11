//! *Simpsons Trivia* — 1994 *The Simpsons* After Dark 3.0 Module.
//!
//! Features the Sector 7-G **E-Fission-Cy 1000 Core Temperature Regulator**
//! (`RLEP #12000/#12001/#12100` + `OFst/OFtb #12000`) and all **300 authentic
//! `Qery` trivia questions**, complete with animated core temperature gauge,
//! flashing indicator lights, CRT terminal display, and reactor meltdown alarm!

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use super::{
    CompoundAnim, KIND_QERY, MOD_TRIVIA, RlepBank, SND_DETONATE, SND_HOMER_DOH, SND_RIGHT_ANS,
    SND_SIREN, SND_TINY_BEEP1, SND_TINY_BEEP2, SND_WRONG_ANS, SimpsonsPack, draw_bitmap_text_f,
    draw_line_px, draw_rect_outline_px, fill_circle_px, fill_rect_px, mac_roman_to_string,
    wrap_bitmap_text_f,
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

    fn draw_sector7g_wing(
        &self,
        surface: &mut ad_sdk::canvas::AdSurface,
        x0: i32,
        x1: i32,
        h: i32,
        sf: f32,
        is_right: bool,
    ) {
        let wing_w = x1 - x0;
        if wing_w < 12 {
            return;
        }
        // Matching Sector 7-G steel wall + hazard yellow/black stripe + blinking reactor status bay
        let desk_y = (h as f32 * 0.72) as i32;
        fill_rect_px(surface, x0, 0, x1, desk_y, 0x004A_545E);
        fill_rect_px(surface, x0, desk_y, x1, h, 0x0034_3C44);

        // Caution hazard band across the wall
        let stripe_y0 = (h as f32 * 0.10) as i32;
        let stripe_h = (16.0 * sf).round().max(10.0) as i32;
        let sw = (14.0 * sf).round().max(8.0) as i32;
        let w_full = surface.width;
        {
            let dst = surface.pixels_mut();
            for y in stripe_y0..(stripe_y0 + stripe_h).min(h) {
                let row = (y * w_full) as usize;
                for x in x0..x1 {
                    let diag = ((x + y) / sw) & 1;
                    dst[row + x as usize] = if diag == 0 { 0x00E4_B820 } else { 0x001E_2226 };
                }
            }
        }
        fill_rect_px(surface, x0, desk_y - 3, x1, desk_y + 2, 0x0022_282E);

        // Recessed auxiliary Sector 7-G instrumentation panel if wing is wide enough
        let pad = (12.0 * sf).round().max(6.0) as i32;
        if wing_w >= pad * 2 + 42 {
            let px0 = x0 + pad;
            let px1 = x1 - pad;
            let py0 = stripe_y0 + stripe_h + pad;
            let py1 = desk_y - pad;
            fill_rect_px(surface, px0, py0, px1, py1, 0x002B_323A);
            draw_rect_outline_px(surface, px0, py0, px1, py1, 0x0018_1C22, 2);

            // Blinking reactor indicator lights array
            let cols = ((px1 - px0 - 16) / ((18.0 * sf) as i32).max(12)).clamp(2, 5);
            let rows = 3;
            let rad = (5.0 * sf).round().max(3.0) as i32;
            let step_x = (px1 - px0) / (cols + 1);
            let step_y = ((py1 - py0) / 2) / (rows + 1);
            for r in 0..rows {
                for c in 0..cols {
                    let lx = px0 + step_x * (c + 1);
                    let ly = py0 + step_y * (r + 1);
                    let idx = (r * cols + c + if is_right { 7 } else { 0 }) as usize;
                    let on = ((self.tick / 5 + idx * 3) % 7) < 4;
                    let col = if self.phase == TriviaPhase::Meltdown {
                        if (self.tick / 2 + idx) % 2 == 0 {
                            0x00FF_2820
                        } else {
                            0x0058_1010
                        }
                    } else if on {
                        match idx % 3 {
                            0 => 0x0038_E858,
                            1 => 0x00FF_D028,
                            _ => 0x00E8_3830,
                        }
                    } else {
                        0x001A_2026
                    };
                    fill_circle_px(surface, lx, ly, rad, col);
                }
            }

            // Sector 7-G / Safety plaque below the indicator bank
            let box_y0 = py0 + (py1 - py0) / 2 + 4;
            let box_y1 = py1 - 8;
            if box_y1 - box_y0 > 26 {
                let bx0 = px0 + 6;
                let bx1 = px1 - 6;
                fill_rect_px(surface, bx0, box_y0, bx1, box_y1, 0x0018_1E24);
                draw_rect_outline_px(surface, bx0, box_y0, bx1, box_y1, 0x0064_707C, 1);
                let l1 = if is_right { "CORE" } else { "SECTOR 7G" };
                let l2 = if is_right {
                    if self.phase == TriviaPhase::Meltdown {
                        "MELTDOWN"
                    } else {
                        "NOMINAL"
                    }
                } else {
                    "SAFETY OK"
                };
                let c2 = if self.phase == TriviaPhase::Meltdown {
                    0x00FF_3830
                } else {
                    0x0058_FF78
                };
                let inner_w = (bx1 - bx0 - 8).max(20);
                let raw_w = super::measure_bitmap_text_f(&self.font, l1, 1.0)
                    .max(super::measure_bitmap_text_f(&self.font, l2, 1.0))
                    .max(1) as f32;
                let label_sf = (inner_w as f32 / raw_w).min(sf * 0.72).clamp(0.45, 2.0);
                let w1 = super::measure_bitmap_text_f(&self.font, l1, label_sf);
                let w2 = super::measure_bitmap_text_f(&self.font, l2, label_sf);
                draw_bitmap_text_f(
                    surface,
                    &self.font,
                    l1,
                    bx0 + ((bx1 - bx0 - w1) / 2).max(4),
                    box_y0 + (10.0 * sf) as i32,
                    Some(0x00FF_D838),
                    label_sf,
                );
                draw_bitmap_text_f(
                    surface,
                    &self.font,
                    l2,
                    bx0 + ((bx1 - bx0 - w2) / 2).max(4),
                    box_y0 + (26.0 * sf) as i32,
                    Some(c2),
                    label_sf,
                );
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

        if self.text_only || w < 380 || h < 260 {
            // Crisp green phosphor CRT terminal view scaled smoothly for HD/4K
            let sf = (h as f32 / 360.0).clamp(0.85, 3.8);
            let pad = (18.0 * sf).round() as i32;
            fill_rect_px(surface, pad, pad, w - pad, h - pad, 0x0006_180A);
            draw_rect_outline_px(surface, pad, pad, w - pad, h - pad, 0x0028_6838, 2);
            let max_w = (w - pad * 4).max(120);
            let mut y = pad + (16.0 * sf).round() as i32;
            draw_bitmap_text_f(
                surface,
                &self.font,
                "E-FISSION-CY 1000 TRIVIA TERMINAL",
                pad + (14.0 * sf).round() as i32,
                y,
                Some(0x00FF_D838),
                sf * 1.1,
            );
            y += (24.0 * sf).round() as i32;
            self.draw_crt_question(surface, q, pad + (14.0 * sf).round() as i32, y, max_w, sf);
            return;
        }

        // Continuous widescreen HD/4K fit of the authentic 640x480 Sector 7-G console!
        let (sf, ox_f, oy_f) = crate::tng::stage_fit(w, h, 640.0, 480.0, 0, 0);
        let ox = ox_f.round() as i32;
        let oy = oy_f.round() as i32;
        let stage_w = (640.0 * sf).round() as i32;
        let sc = |v: i32| (v as f32 * sf).round() as i32;

        // Flanking widescreen Sector 7-G Nuclear Power Plant control bays (no black side bars!)
        if ox > 0 {
            self.draw_sector7g_wing(surface, 0, ox, h, sf, false);
        }
        if ox + stage_w < w {
            self.draw_sector7g_wing(surface, ox + stage_w, w, h, sf, true);
        }

        // 1. Background Sector 7-G wall & control desk (#12000[0])
        if let Some(bg) = self.bg_bank.frames.first() {
            bg.blit_transformed_f(surface, ox, oy, sf, false, false, false, false);
        }
        // 2. E-Fission-Cy 1000 CRT monitor unit (#12000[1] at stage (145, 116))
        if let Some(crt) = self.bg_bank.frames.get(1) {
            crt.blit_transformed_f(
                surface,
                ox + sc(145),
                oy + sc(116),
                sf,
                false,
                false,
                false,
                false,
            );
        }

        // 3. Authentic Sector 7-G animated console decorations & indicators (OFst #12000):
        //    - R14 (101): Simpson family photo taped bottom-left
        //    - R13 (85):  "BUY PONY" sticky note
        //    - R16 (108..=110): Safety counter flip card
        //    - R02 (5..=8): Normal glowing console indicator lights (NEVER sparking 9..=28 unless Meltdown!)
        //    - R11 (64..=81): Animated pressure/radiation red needle on left gauge!
        //    - R03 (29..=38): Occasional radioactive green ooze dripping from ceiling pipe!
        //    - R10 (61..=63): Occasional glowing green spider descending on web!
        if let Some(anim) = &self.anim {
            let draw_ofst = |s: &mut ad_sdk::canvas::AdSurface, idx: usize| {
                if idx < anim.frames.len() {
                    anim.draw_stage_frame_f(s, idx, ox_f, oy_f, sf, false, false);
                }
            };
            // Static wall/console character props (bg_bank[0] already has the upper-right yellow poster)
            draw_ofst(surface, 101); // Family photo
            draw_ofst(surface, 85);  // "BUY PONY" sticky note
            let flip_digit = 108 + ((self.wrong_count as usize) % 3);
            draw_ofst(surface, flip_digit);

            // Animated red needle on left Sector 7-G gauge (R11: 64..=81)
            let temp_frac = (self.wrong_count as f32 / self.meltdown_limit.max(1) as f32).clamp(0.0, 1.0);
            let jitter = ((self.tick as f32 * 0.25).sin() * 1.5).round() as i32;
            let needle_off = ((temp_frac * 15.0).round() as i32 + jitter).clamp(0, 17) as usize;
            draw_ofst(surface, 64 + needle_off);

            // Periodic radioactive ceiling drip (R03: 29..=38)
            let drip_cycle = self.tick % 96;
            if drip_cycle < 20 {
                draw_ofst(surface, 29 + (drip_cycle / 2).min(9));
            }
            // Periodic radioactive green spider cameo (R10: 61..=63)
            let spider_cycle = (self.tick + 40) % 140;
            if spider_cycle < 18 {
                let sp_step = if spider_cycle < 9 {
                    (spider_cycle / 3).min(2)
                } else {
                    ((17 - spider_cycle) / 3).min(2)
                };
                draw_ofst(surface, 61 + sp_step);
            }

            if self.phase == TriviaPhase::Meltdown {
                // Full Sector 7-G Meltdown! Flashing alarm strobe, shattering Krusty gauge, exploding buttons!
                if (self.tick / 2) % 2 == 0 {
                    draw_ofst(surface, 39); // Orange rotating emergency strobe light
                }
                draw_ofst(surface, 9 + ((self.tick / 2) % 20));  // Sparking left indicator buttons
                draw_ofst(surface, 41 + ((self.tick / 2) % 8));  // Shattering Krusty clock gauge
                draw_ofst(surface, 49 + ((self.tick / 2) % 7));  // Exploding right green warning button
            } else {
                // Calm normal indicator lights cycling gently across the 4 left console buttons (5..=8)
                let light_idx = 5 + ((self.tick / 8) % 4);
                draw_ofst(surface, light_idx);
            }
        }

        // 4. Core temperature gauge needle (centered right on the CORE TEMPERATURE dial at stage (556, 444))
        let gauge_cx = ox + sc(556);
        let gauge_cy = oy + sc(444);
        let frac = (self.wrong_count as f32 / self.meltdown_limit.max(1) as f32).clamp(0.0, 1.0);
        let angle = std::f32::consts::PI * (0.92 - frac * 0.84);
        let nx = gauge_cx + (angle.cos() * 32.0 * sf) as i32;
        let ny = gauge_cy - (angle.sin() * 32.0 * sf) as i32;
        draw_line_px(
            surface,
            gauge_cx,
            gauge_cy,
            nx,
            ny,
            0x0010_1010,
            (2.2 * sf).round().max(2.0) as i32,
        );
        fill_circle_px(
            surface,
            gauge_cx,
            gauge_cy,
            (4.0 * sf).round().max(3.0) as i32,
            0x00E8_2020,
        );

        // 5. CRT screen glass area inside E-Fission-Cy 1000: stage (178, 146) .. (456, 356)
        let crt_x = ox + sc(178);
        let crt_y = oy + sc(146);
        let crt_w = sc(278);
        let crt_h = sc(210);

        if self.phase == TriviaPhase::Meltdown {
            let flash = if (self.tick / 3) % 2 == 0 {
                0x00B8_1010
            } else {
                0x00FF_7010
            };
            fill_rect_px(surface, crt_x, crt_y, crt_x + crt_w, crt_y + crt_h, flash);
            if let Some(anim) = &self.anim {
                // Authentic CRT radioactive zig-zag interference overlay (R17: 111..=116)
                let zig_fi = 111 + ((self.tick / 2) % 6);
                if zig_fi < anim.frames.len() {
                    anim.draw_stage_frame_f(surface, zig_fi, ox_f, oy_f, sf, false, false);
                }
            }
            draw_bitmap_text_f(
                surface,
                &self.font,
                "CORE MELTDOWN!!",
                crt_x + sc(56),
                crt_y + sc(18),
                Some(0x00FF_FF40),
                sf,
            );
            draw_bitmap_text_f(
                surface,
                &self.font,
                "D'OH!! RESETTING CORE...",
                crt_x + sc(36),
                crt_y + crt_h - sc(24),
                Some(0x00FF_FFFF),
                sf,
            );
        } else {
            fill_rect_px(surface, crt_x, crt_y, crt_x + crt_w, crt_y + crt_h, 0x0004_1608);
            self.draw_crt_question(
                surface,
                q,
                crt_x + sc(8),
                crt_y + sc(10),
                crt_w - sc(16),
                sf,
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
        sf: f32,
    ) {
        let lh = (14.0 * sf).round().max(11.0) as i32;
        let header = format!(
            "Q#{:03}   ERRORS: {}/{}",
            (self.order[self.q_cursor % self.order.len()]) + 1,
            self.wrong_count,
            self.meltdown_limit
        );
        draw_bitmap_text_f(surface, &self.font, &header, x, y, Some(0x0050_C8FF), sf);
        y += lh + (4.0 * sf).round() as i32;

        for line in wrap_bitmap_text_f(&self.font, &q.question, max_w, sf) {
            draw_bitmap_text_f(surface, &self.font, &line, x, y, Some(0x0058_FF78), sf);
            y += lh;
        }
        y += (8.0 * sf).round() as i32;

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
            for line in wrap_bitmap_text_f(&self.font, &prefix, max_w, sf) {
                draw_bitmap_text_f(surface, &self.font, &line, x, y, Some(color), sf);
                y += lh;
            }
            y += (3.0 * sf).round() as i32;
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
