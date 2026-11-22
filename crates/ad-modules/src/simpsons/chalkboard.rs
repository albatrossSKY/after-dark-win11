//! *Chalkboard* — 1994 *The Simpsons* After Dark 3.0 Module.
//!
//! Interprets Tom Wuttke's authentic `cSTR #128` chalkboard script directly:
//! Bart's complete spline-stroked handwriting alphabet (including the gothic
//! calligraphy "show-off" font!), all 92 Seasons 1–5 opening-credit chalkboard
//! gags, special Easter eggs (`~1..~8`), dusty chalk rendering, and authentic
//! chalk hit / roll / squeak / eraser SFX.

use std::collections::HashMap;

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult, MsvcRand};

use super::{
    KIND_CSTR, MOD_CHALKBOARD, SND_CHALK_HIT1, SND_CHALK_HIT2, SND_CHALK_ROLL, SND_ERASING,
    SND_SQUEAK, SimpsonsPack, draw_line_px, fill_rect_px, mac_roman_to_string, put_px,
};

struct ChalkScript {
    macros: HashMap<String, String>,
    messages: Vec<(i32, String)>, // (special_tag ~n or 0, macro_body)
}

impl ChalkScript {
    fn parse(raw: &[u8]) -> Self {
        let text = mac_roman_to_string(raw);
        let mut macros = HashMap::new();
        let mut msg_map: HashMap<usize, (i32, String)> = HashMap::new();

        for raw_line in text.split('\r') {
            let had_comment = raw_line.contains("//");
            let line = match raw_line.find("//") {
                Some(idx) => &raw_line[..idx],
                None => raw_line,
            };
            let trimmed = if had_comment {
                line.trim_end_matches(|c| c == '\n' || c == '\t')
            } else {
                line.trim_end_matches('\n')
            };
            if trimmed.trim().is_empty() || trimmed.starts_with(':') {
                continue;
            }
            let Some(colon) = trimmed.find(':') else {
                continue;
            };
            let key = &trimmed[..colon];
            let body = &trimmed[colon + 1..];
            if key.is_empty() {
                continue;
            }
            if let Some(rest) = key.strip_prefix('m') {
                if let Ok(num) = rest.parse::<usize>() {
                    if (1..=200).contains(&num) {
                        let body = body.trim_end();
                        let (tag, clean_body) = if body.starts_with('~') && body.len() >= 2 {
                            let t = (body.as_bytes()[1] as i32) - ('0' as i32);
                            (t, body[2..].to_string())
                        } else {
                            (0, body.to_string())
                        };
                        msg_map.insert(num, (tag, clean_body));
                        continue;
                    }
                }
            }
            // Keep intentional single trailing space on word macros like `wn:I WILL NO\T ` and `nt: NO\T `
            let final_body = if key == "wn" || key == "nt" {
                format!("{} ", body.trim_end())
            } else {
                body.trim_end().to_string()
            };
            macros.insert(key.to_string(), final_body);
        }

        // Ensure digit '4' exists (used in m73 "MUD IS NOT ONE OF THE 4 FOOD GROUPS.")
        macros
            .entry("4".to_string())
            .or_insert_with(|| "[55,98,8,38,8,38,68,38][52,98,52,2]<78>".to_string());

        let mut keys: Vec<usize> = msg_map.keys().copied().collect();
        keys.sort_unstable();
        let messages = keys
            .into_iter()
            .filter_map(|k| msg_map.remove(&k))
            .collect();

        Self { macros, messages }
    }
}

struct StrokeSegment {
    x0: f32,
    y0: f32,
    x1: f32,
    y1: f32,
    new_stroke: bool,
    squeak_chance: bool,
}

pub struct ChalkboardModule {
    script: Option<ChalkScript>,
    segments: Vec<StrokeSegment>,
    seg_cursor: usize,
    msg_index: usize,
    erase_x: i32,
    state: BoardState,
    pause_ticks: usize,
    sloppiness: f32,
    mistakes: f32,
    squeaky: bool,
    max_lines_mode: i32,
    special_tag: i32,
}

#[derive(Clone, Copy, PartialEq, Eq)]
enum BoardState {
    Writing,
    PauseAfterBoard,
    Erasing,
}

impl ChalkboardModule {
    pub fn new() -> Self {
        Self {
            script: None,
            segments: Vec::new(),
            seg_cursor: 0,
            msg_index: 0,
            erase_x: 0,
            state: BoardState::Writing,
            pause_ticks: 0,
            sloppiness: 0.3,
            mistakes: 0.5,
            squeaky: false,
            max_lines_mode: 100,
            special_tag: 0,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "simpsons_chalkboard".to_string(),
            name: "Chalkboard".to_string(),
            credit: "By Jarir Maani and Tom Wuttke.\nSoftware © 1994 Berkeley Systems, Inc.\nThe Simpsons ™ & © Twentieth Century Fox.".to_string(),
            about: "I WILL NOT CAUSE PHOSPHOR BURN-IN.\n\nThis module features all 92 authentic chalkboard messages Bart has written during the opening credits of Seasons 1–5, rendered stroke-by-stroke in Bart's spline handwriting.".to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "# of Lines:".to_string(),
                    default_raw: 100,
                    labels: vec![
                        "One".into(),
                        "Three".into(),
                        "Halfway".into(),
                        "Fill Screen".into(),
                    ],
                    thresholds: vec![0, 25, 50, 75],
                },
                AdControl::LabeledSlider {
                    title: "Sloppiness:".to_string(),
                    default_raw: 30,
                    labels: vec![
                        "Not Bad".into(),
                        "Messy".into(),
                        "Sloppy".into(),
                        "Unintelligible".into(),
                        "What th--?!".into(),
                    ],
                    thresholds: vec![0, 20, 40, 60, 80],
                },
                AdControl::LabeledSlider {
                    title: "Mistakes:".to_string(),
                    default_raw: 50,
                    labels: vec![
                        "Perfect".into(),
                        "Okay".into(),
                        "Imperfect".into(),
                        "Dumb".into(),
                        "Dum".into(),
                    ],
                    thresholds: vec![0, 20, 40, 60, 80],
                },
                AdControl::Checkbox {
                    title: "Squeaky Chalk".to_string(),
                    default_checked: false,
                },
            ],
            target_frame_ms: 28,
            filename: "CHALKBRD.AD".to_string(),
        }
    }

    fn draw_chalkboard_bg(&self, surface: &mut ad_sdk::canvas::AdSurface) {
        let w = surface.width;
        let h = surface.height;
        let sf = (h as f32 / 480.0).clamp(0.75, 4.0);
        let tray_h = (26.0 * sf).round().clamp(14.0, 96.0) as i32;
        let board_h = (h - tray_h).max(1);

        // Classic dark slate-green chalkboard with subtle chalk dust mottling
        let dst = surface.pixels_mut();
        for y in 0..board_h {
            let row = (y * w) as usize;
            let vig_y = ((y as f32 / board_h as f32) - 0.5).abs();
            for x in 0..w {
                let vig_x = ((x as f32 / w.max(1) as f32) - 0.5).abs();
                let dust = (((x * 13 ^ y * 29) & 31) as i32 - 16) / 4;
                let fade = ((vig_x * vig_x + vig_y * vig_y) * 24.0) as i32;
                let r = (22 + dust - fade / 2).clamp(10, 45) as u32;
                let g = (62 + dust - fade).clamp(32, 84) as u32;
                let b = (42 + dust - fade / 2).clamp(22, 62) as u32;
                dst[row + x as usize] = (r << 16) | (g << 8) | b;
            }
        }

        // Wooden frame trim & chalk rail at bottom (proportionally scaled for HD/4K)
        let trim = (3.5 * sf).round().max(2.0) as i32;
        fill_rect_px(surface, 0, board_h, w, board_h + trim, 0x00A6_7240);
        fill_rect_px(surface, 0, board_h + trim, w, h, 0x006E_4622);
        fill_rect_px(surface, 0, h - trim, w, h, 0x0046_2A12);

        // Felt eraser & white chalk sticks resting on the rail
        let ew = (44.0 * sf).round() as i32;
        let eh_felt = (6.0 * sf).round().max(3.0) as i32;
        let eh_wood = (5.0 * sf).round().max(3.0) as i32;
        let ex = w / 5;
        fill_rect_px(surface, ex, board_h - eh_felt + trim, ex + ew, board_h + trim, 0x0024_2428);
        fill_rect_px(
            surface,
            ex + (2.0 * sf) as i32,
            board_h - eh_felt - eh_wood + trim,
            ex + ew - (2.0 * sf) as i32,
            board_h - eh_felt + trim,
            0x00D8_9650,
        );
        let cw1 = (28.0 * sf).round() as i32;
        let cw2 = (20.0 * sf).round() as i32;
        let ch = (4.0 * sf).round().max(2.0) as i32;
        let cx0 = (w * 3) / 5;
        fill_rect_px(surface, cx0, board_h - ch + trim, cx0 + cw1, board_h + trim, 0x00EC_ECE6);
        fill_rect_px(
            surface,
            cx0 + (42.0 * sf) as i32,
            board_h - ch + trim + 1,
            cx0 + (42.0 * sf) as i32 + cw2,
            board_h + trim,
            0x00DF_DFD8,
        );
    }

    fn build_board_strokes(&mut self, width: i32, height: i32, rng: &mut MsvcRand) {
        self.segments.clear();
        self.seg_cursor = 0;

        let Some(script) = &self.script else {
            return;
        };
        if script.messages.is_empty() {
            return;
        }

        let (tag, base_body) = script.messages[self.msg_index % script.messages.len()].clone();
        self.special_tag = tag;

        let sf = (height as f32 / 480.0).clamp(0.75, 4.0);
        let tray_h = (26.0 * sf).round().clamp(14.0, 96.0) as i32;
        let margin_x = (28.0 * sf).round();
        let margin_y = (22.0 * sf).round();
        let usable_h = (height - tray_h - margin_y as i32 * 2).max(80) as f32;
        let usable_w = (width - margin_x as i32 * 2).max(160) as f32;

        // First measure a single repetition in script units to compute clean uniform scale
        let mut measure_segs = Vec::new();
        let mut mx = 0.0f32;
        let mut my = 0.0f32;
        compile_macro(
            script,
            &base_body,
            0.0,
            &mut mx,
            &mut my,
            0.0,
            0.0,
            0,
            rng,
            &mut measure_segs,
        );
        let max_u_x = measure_segs
            .iter()
            .fold(1400.0f32, |a, s| a.max(s.x0).max(s.x1));
        let max_u_y = my + 125.0;

        // Scale cleanly for any resolution from 640x480 up to 4K/ultrawide without CRT cap!
        let target_scale = (usable_w / (max_u_x + 100.0))
            .min(usable_h / (max_u_y * 4.8))
            .clamp(0.14 * sf, 0.44 * sf);
        let line_pitch_px = (max_u_y + 38.0) * target_scale;
        let max_fit_lines = ((usable_h / line_pitch_px.max(18.0)) as usize).clamp(1, 14);

        let repeat_lines = if self.max_lines_mode < 25 {
            1
        } else if self.max_lines_mode < 50 {
            3.min(max_fit_lines)
        } else if self.max_lines_mode < 75 {
            (max_fit_lines / 2).max(2)
        } else {
            max_fit_lines
        };

        let left_margin = margin_x;
        let top_margin = margin_y;
        let mut cur_y_px = top_margin;

        for line_idx in 0..repeat_lines {
            let body_for_line = match tag {
                1 if line_idx == repeat_lines - 1 && rng.rand_mod(2) == 0 => script
                    .macros
                    .get("m910")
                    .cloned()
                    .unwrap_or_else(|| base_body.clone()),
                2 if line_idx > 0 => script
                    .macros
                    .get("m920")
                    .cloned()
                    .unwrap_or_else(|| base_body.clone()),
                5 if line_idx == repeat_lines - 1 => script
                    .macros
                    .get("m950")
                    .cloned()
                    .unwrap_or_else(|| base_body.clone()),
                8 if line_idx > 0 => {
                    let alt = format!("m98{}", (line_idx - 1) % 4);
                    script
                        .macros
                        .get(&alt)
                        .cloned()
                        .unwrap_or_else(|| base_body.clone())
                }
                _ => base_body.clone(),
            };

            let jitter_boost = if tag == 7 {
                // "COFFEE IS NOT FOR KIDS." gets progressively shakier!
                (line_idx as f32) * 0.18
            } else {
                0.0
            };

            let mut ux = 0.0f32;
            let mut uy = 0.0f32;
            let mut line_segs = Vec::new();
            compile_macro(
                script,
                &body_for_line,
                0.0,
                &mut ux,
                &mut uy,
                self.sloppiness + jitter_boost,
                self.mistakes,
                0,
                rng,
                &mut line_segs,
            );

            let line_tilt = (rng.rand_mod(100) as f32 - 50.0) * 0.0005 * self.sloppiness;
            for mut seg in line_segs {
                let sx0 = left_margin + seg.x0 * target_scale;
                let sy0 = cur_y_px + seg.y0 * target_scale + seg.x0 * target_scale * line_tilt;
                let sx1 = left_margin + seg.x1 * target_scale;
                let sy1 = cur_y_px + seg.y1 * target_scale + seg.x1 * target_scale * line_tilt;
                seg.x0 = sx0;
                seg.y0 = sy0;
                seg.x1 = sx1;
                seg.y1 = sy1;
                self.segments.push(seg);
            }

            cur_y_px += (uy + 148.0) * target_scale;
            if cur_y_px + 28.0 > (height - tray_h) as f32 {
                break;
            }
        }
    }
}

impl Default for ChalkboardModule {
    fn default() -> Self {
        Self::new()
    }
}

fn compile_macro(
    script: &ChalkScript,
    body: &str,
    start_x: f32,
    cx: &mut f32,
    cy: &mut f32,
    sloppiness: f32,
    mistakes: f32,
    depth: usize,
    rng: &mut MsvcRand,
    out: &mut Vec<StrokeSegment>,
) {
    if depth > 10 {
        return;
    }
    let bytes = body.as_bytes();
    let mut i = 0usize;
    while i < bytes.len() {
        let ch = bytes[i] as char;
        match ch {
            '[' | '{' => {
                let close = if ch == '[' { ']' } else { '}' };
                let end = body[i + 1..]
                    .find(|c| c == close || c == ']' || c == '}')
                    .map(|p| i + 1 + p)
                    .unwrap_or(bytes.len());
                let nums: Vec<f32> = body[i + 1..end]
                    .split(',')
                    .filter_map(|t| t.trim().parse::<f32>().ok())
                    .collect();
                let mut pts: Vec<(f32, f32)> = Vec::new();
                let wobble = sloppiness * 9.0;
                let mut k = 0;
                while k + 1 < nums.len() {
                    let jx = if wobble > 0.1 {
                        ((rng.rand_mod(201) - 100) as f32 / 100.0) * wobble
                    } else {
                        0.0
                    };
                    let jy = if wobble > 0.1 {
                        ((rng.rand_mod(201) - 100) as f32 / 100.0) * wobble
                    } else {
                        0.0
                    };
                    // Script Y=0 is baseline, Y=100 is top of cap height -> invert to screen Y
                    pts.push((*cx + nums[k] + jx, *cy + (100.0 - nums[k + 1]) + jy));
                    k += 2;
                }
                if ch == '{' && pts.len() >= 4 {
                    // Uniform quadratic B-spline where first & last points are invisible guide tangents
                    let mut smooth = Vec::new();
                    for j in 0..pts.len() - 2 {
                        let p0 = pts[j];
                        let p1 = pts[j + 1];
                        let p2 = pts[j + 2];
                        let steps = 5;
                        for s in 0..=steps {
                            let t = s as f32 / steps as f32;
                            let a = 0.5 * (1.0 - t) * (1.0 - t);
                            let b = 0.5 * (-2.0 * t * t + 2.0 * t + 1.0);
                            let c = 0.5 * t * t;
                            smooth.push((a * p0.0 + b * p1.0 + c * p2.0, a * p0.1 + b * p1.1 + c * p2.1));
                        }
                    }
                    pts = smooth;
                }
                for w in 0..pts.len().saturating_sub(1) {
                    out.push(StrokeSegment {
                        x0: pts[w].0,
                        y0: pts[w].1,
                        x1: pts[w + 1].0,
                        y1: pts[w + 1].1,
                        new_stroke: w == 0,
                        squeak_chance: w == 0 && pts.len() > 3,
                    });
                }
                i = (end + 1).min(bytes.len());
            }
            '<' => {
                let end = body[i + 1..]
                    .find('>')
                    .map(|p| i + 1 + p)
                    .unwrap_or(bytes.len());
                let inner = &body[i + 1..end];
                let parts: Vec<&str> = inner.split(',').collect();
                if let Some(p0) = parts.first() {
                    let s0 = p0.trim();
                    if s0 == "!" {
                        *cx = start_x;
                    } else if let Ok(dx) = s0.parse::<f32>() {
                        *cx += dx;
                    }
                }
                if let Some(p1) = parts.get(1) {
                    let s1 = p1.trim();
                    if s1 == "!" {
                        *cy = 0.0;
                    } else if let Ok(dy) = s1.parse::<f32>() {
                        *cy += dy;
                    }
                }
                i = (end + 1).min(bytes.len());
            }
            ':' => {
                if let Some(end_rel) = body[i + 1..].find(':') {
                    let mname = &body[i + 1..i + 1 + end_rel];
                    if let Some(mbody) = script.macros.get(mname) {
                        compile_macro(
                            script, mbody, start_x, cx, cy, sloppiness, mistakes, depth + 1, rng,
                            out,
                        );
                    }
                    i += end_rel + 2;
                } else {
                    i += 1;
                }
            }
            _ => {
                // Single-character glyph or macro lookup
                let key = ch.to_string();
                if let Some(mbody) = script.macros.get(&key) {
                    // Occasional Bart spelling mistake + chalk cross-out!
                    let do_mistake = depth <= 1
                        && ch.is_ascii_alphabetic()
                        && mistakes > 0.15
                        && (rng.rand_mod(1000) as f32) < (mistakes * 32.0);
                    if do_mistake {
                        let wrong_ch = (b'A' + (rng.rand_mod(26) as u8)) as char;
                        let start_mx = *cx;
                        if let Some(wb) = script.macros.get(&wrong_ch.to_string()) {
                            compile_macro(
                                script, wb, start_x, cx, cy, sloppiness, 0.0, depth + 1, rng, out,
                            );
                        }
                        let end_mx = *cx;
                        // Scribble cross-out line through wrong letter
                        out.push(StrokeSegment {
                            x0: start_mx,
                            y0: *cy + 20.0,
                            x1: end_mx - 8.0,
                            y1: *cy + 85.0,
                            new_stroke: true,
                            squeak_chance: true,
                        });
                        out.push(StrokeSegment {
                            x0: start_mx,
                            y0: *cy + 85.0,
                            x1: end_mx - 8.0,
                            y1: *cy + 20.0,
                            new_stroke: true,
                            squeak_chance: false,
                        });
                    }
                    compile_macro(
                        script, mbody, start_x, cx, cy, sloppiness, mistakes, depth + 1, rng, out,
                    );
                } else if ch == ' ' {
                    *cx += 45.0;
                }
                i += 1;
            }
        }
    }
}

impl AdModule for ChalkboardModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        if self.script.is_none() {
            if let Some(raw) = SimpsonsPack::global().get(MOD_CHALKBOARD, KIND_CSTR, 128) {
                self.script = Some(ChalkScript::parse(raw));
            }
        }
        self.max_lines_mode = ctx.module.raw_control_value[0].clamp(0, 100);
        self.sloppiness = ctx.module.raw_control_value[1].clamp(0, 100) as f32 / 100.0;
        self.mistakes = ctx.module.raw_control_value[2].clamp(0, 100) as f32 / 100.0;
        self.squeaky = ctx.module.raw_control_value[3] != 0;

        if let Some(sc) = &self.script {
            if !sc.messages.is_empty() {
                self.msg_index = ctx.rng.rand_mod(sc.messages.len() as i32) as usize;
            }
        }
        self.state = BoardState::Writing;
        self.pause_ticks = 0;
        self.erase_x = 0;

        let w = ctx.surface.width;
        let h = ctx.surface.height;
        self.build_board_strokes(w, h, ctx.rng);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.draw_chalkboard_bg(ctx.surface);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        let pack = SimpsonsPack::global();
        match self.state {
            BoardState::Writing => {
                // Draw 5–8 stroke segments per frame so Bart writes briskly and legibly!
                let steps = if self.special_tag == 7 { 9 } else { 6 };
                let sf = (ctx.surface.height as f32 / 480.0).clamp(0.75, 4.0);
                let thick = (2.4 * sf).round().clamp(2.0, 9.0) as i32;
                for _ in 0..steps {
                    if self.seg_cursor >= self.segments.len() {
                        self.state = BoardState::PauseAfterBoard;
                        self.pause_ticks = 85;
                        break;
                    }
                    let seg = &self.segments[self.seg_cursor];
                    self.seg_cursor += 1;

                    // Slightly warm dusty chalk white
                    let v = 228 + (ctx.rng.rand_mod(25) as u32);
                    let chalk_rgb = (v << 16) | (v << 8) | (v.saturating_sub(6));
                    draw_line_px(
                        ctx.surface,
                        seg.x0 as i32,
                        seg.y0 as i32,
                        seg.x1 as i32,
                        seg.y1 as i32,
                        chalk_rgb,
                        thick,
                    );
                    // Tiny chalk dust speckles along the stroke
                    if ctx.rng.rand_mod(3) == 0 {
                        let spread = (5.0 * sf).round().max(3.0) as i32;
                        let mx = ((seg.x0 + seg.x1) * 0.5) as i32 + ctx.rng.rand_mod(spread) - spread / 2;
                        let my = ((seg.y0 + seg.y1) * 0.5) as i32 + ctx.rng.rand_mod(spread) - spread / 2;
                        put_px(ctx.surface, mx, my, 0x00A8_B4A8);
                    }

                    if seg.new_stroke && ctx.rng.rand_mod(5) == 0 {
                        let force_squeak = self.squeaky || self.special_tag == 4;
                        let snd = if force_squeak && seg.squeak_chance && ctx.rng.rand_mod(4) == 0 {
                            SND_SQUEAK
                        } else {
                            match ctx.rng.rand_mod(3) {
                                0 => SND_CHALK_HIT1,
                                1 => SND_CHALK_HIT2,
                                _ => SND_CHALK_ROLL,
                            }
                        };
                        pack.play_voice(ctx.sound, ctx.system.sound_enabled, snd);
                    }
                }
            }
            BoardState::PauseAfterBoard => {
                if self.pause_ticks > 0 {
                    self.pause_ticks -= 1;
                } else {
                    self.state = BoardState::Erasing;
                    self.erase_x = 0;
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_ERASING);
                }
            }
            BoardState::Erasing => {
                let w = ctx.surface.width;
                let h = ctx.surface.height;
                let sf = (h as f32 / 480.0).clamp(0.75, 4.0);
                let tray_h = (26.0 * sf).round().clamp(14.0, 96.0) as i32;
                let board_h = (h - tray_h).max(1);
                let swipe_w = (w / 18).max(16);
                let x0 = self.erase_x;
                let x1 = (x0 + swipe_w).min(w);
                // Dusty green swipe wipe across the board
                fill_rect_px(ctx.surface, x0, 0, x1, board_h, 0x001B_442F);
                // Felt eraser block leading edge
                if x1 < w {
                    let ew = (12.0 * sf).round().max(6.0) as i32;
                    let eh = (52.0 * sf).round().max(28.0) as i32;
                    fill_rect_px(ctx.surface, x1 - ew / 3, board_h / 3, x1 + ew, board_h / 3 + eh, 0x00C8_8A48);
                }
                self.erase_x = x1;
                if self.erase_x >= w {
                    self.draw_chalkboard_bg(ctx.surface);
                    if let Some(sc) = &self.script {
                        if !sc.messages.is_empty() {
                            self.msg_index = (self.msg_index + 1) % sc.messages.len();
                        }
                    }
                    self.build_board_strokes(w, h, ctx.rng);
                    self.state = BoardState::Writing;
                }
            }
        }
        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        self.segments.clear();
        AdResult::NoError
    }
}
