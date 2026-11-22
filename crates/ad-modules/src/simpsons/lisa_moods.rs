//! *Lisa's Mood Swings* — 1994 *The Simpsons* After Dark 3.0 Module.
//!
//! Lisa Simpson plays her saxophone (`RLEP #1000`, 33 frames) while glowing
//! subconscious visions smoothly morph vertex-by-vertex across all 41 authentic
//! `Lisa` vector drawings (18 Happy, 12 Sad, 11 Angry), accompanied by the
//! matching *Moanin' Lisa* MIDI jazz track (`cmid #10/#20/#30`).

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use super::{
    KIND_LISA, LisaDrawing, MOD_LISA_MOODS, RlepBank, SONG_LISA_ANGRY, SONG_LISA_HAPPY,
    SONG_LISA_SAD, SimpsonsPack, draw_line_px, fill_circle_px, fill_rect_px,
    music_loops_from_slider,
};

const MORPH_SAMPLES: usize = 240;

#[derive(Clone)]
struct ResampledShape {
    /// Normalized `(-1.0..=1.0)` point sequence plus `pen_down` flag for continuous morphing.
    pts: Vec<(f32, f32, bool)>,
}

impl ResampledShape {
    fn from_lisa(d: &LisaDrawing) -> Self {
        let cx = (d.min_x + d.max_x) as f32 * 0.5;
        let cy = (d.min_y + d.max_y) as f32 * 0.5;
        let half = ((d.max_x - d.min_x).max(d.max_y - d.min_y).max(1)) as f32 * 0.5;

        // Compute total polyline length across all strokes to distribute MORPH_SAMPLES evenly
        let mut stroke_lens = Vec::with_capacity(d.strokes.len());
        let mut total_len = 0.0f32;
        for st in &d.strokes {
            let mut l = 0.0f32;
            for w in st.windows(2) {
                let dx = (w[1].0 - w[0].0) as f32;
                let dy = (w[1].1 - w[0].1) as f32;
                l += (dx * dx + dy * dy).sqrt();
            }
            stroke_lens.push(l.max(1.0));
            total_len += l.max(1.0);
        }

        let mut pts = Vec::with_capacity(MORPH_SAMPLES);
        if total_len <= 0.0 || d.strokes.is_empty() {
            pts.resize(MORPH_SAMPLES, (0.0, 0.0, false));
            return Self { pts };
        }

        for (si, st) in d.strokes.iter().enumerate() {
            if st.is_empty() {
                continue;
            }
            let remaining_slots = MORPH_SAMPLES.saturating_sub(pts.len());
            if remaining_slots == 0 {
                break;
            }
            let quota = if si + 1 == d.strokes.len() {
                remaining_slots
            } else {
                (((stroke_lens[si] / total_len) * MORPH_SAMPLES as f32).round() as usize)
                    .clamp(1, remaining_slots)
            };

            let n = st.len();
            for k in 0..quota {
                let t = if quota <= 1 {
                    0.0
                } else {
                    k as f32 / (quota - 1) as f32
                };
                let fidx = t * (n.saturating_sub(1) as f32);
                let i0 = (fidx as usize).min(n - 1);
                let i1 = (i0 + 1).min(n - 1);
                let frac = fidx - i0 as f32;
                let x = st[i0].0 as f32 + (st[i1].0 - st[i0].0) as f32 * frac;
                let y = st[i0].1 as f32 + (st[i1].1 - st[i0].1) as f32 * frac;
                pts.push(((x - cx) / half, (y - cy) / half, k > 0));
            }
        }
        while pts.len() < MORPH_SAMPLES {
            let last = pts.last().copied().unwrap_or((0.0, 0.0, false));
            pts.push((last.0, last.1, false));
        }
        pts.truncate(MORPH_SAMPLES);
        Self { pts }
    }
}

pub struct LisaMoodsModule {
    lisa_bank: RlepBank,
    happy_shapes: Vec<ResampledShape>,
    sad_shapes: Vec<ResampledShape>,
    angry_shapes: Vec<ResampledShape>,
    mood_setting: i32, // 0=Happy, 1=Sad, 2=Angry, 3=Random
    active_mood: i32,  // 0, 1, 2
    from_idx: usize,
    to_idx: usize,
    morph_step: usize,
    morph_steps_total: usize,
    hold_ticks: usize,
    tick: usize,
    scale: i32,
}

impl LisaMoodsModule {
    pub fn new() -> Self {
        Self {
            lisa_bank: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            happy_shapes: Vec::new(),
            sad_shapes: Vec::new(),
            angry_shapes: Vec::new(),
            mood_setting: 3,
            active_mood: 0,
            from_idx: 0,
            to_idx: 1,
            morph_step: 0,
            morph_steps_total: 24,
            hold_ticks: 30,
            tick: 0,
            scale: 1,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "simpsons_lisa_moods".to_string(),
            name: "Lisa's Mood Swings".to_string(),
            credit: "By Jarir Maani and Peter Kemmer.\nSoftware © 1994 Berkeley Systems, Inc.\nThe Simpsons ™ & © Twentieth Century Fox.".to_string(),
            about: "As the most sensitive of the Simpsons, Lisa has a lot on her mind. Watch as she expresses her subconscious through her saxophone with 41 morphing drawings and Moanin' Lisa jazz.".to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "Morph:".to_string(),
                    default_raw: 32,
                    labels: vec![
                        "Not Smooth".into(),
                        "Smooth".into(),
                        "Smoother".into(),
                        "Like Butter".into(),
                    ],
                    thresholds: vec![0, 26, 52, 78],
                },
                AdControl::Menu {
                    title: "Mood:".to_string(),
                    default_index: 3,
                    choices: vec![
                        "Happy".into(),
                        "Sad".into(),
                        "Angry".into(),
                        "Random".into(),
                    ],
                },
                AdControl::LabeledSlider {
                    title: "Music:".to_string(),
                    default_raw: 23,
                    labels: vec![
                        "Never".into(),
                        "Once".into(),
                        "Twice".into(),
                        "Thrice".into(),
                        "Always".into(),
                    ],
                    thresholds: vec![0, 21, 42, 63, 84],
                },
                AdControl::None,
            ],
            target_frame_ms: 48,
            filename: "LISAMOOD.AD".to_string(),
        }
    }

    fn ensure_loaded(&mut self) {
        if !self.lisa_bank.frames.is_empty() {
            return;
        }
        self.lisa_bank = RlepBank::load(MOD_LISA_MOODS, 1000);
        for (rid, data) in SimpsonsPack::global().list(MOD_LISA_MOODS, KIND_LISA) {
            let shape = ResampledShape::from_lisa(&LisaDrawing::decode(data));
            if (1000..2000).contains(&rid) {
                self.happy_shapes.push(shape);
            } else if (2000..3000).contains(&rid) {
                self.sad_shapes.push(shape);
            } else if rid >= 3000 {
                self.angry_shapes.push(shape);
            }
        }
    }

    fn current_pool(&self) -> &[ResampledShape] {
        match self.active_mood {
            0 => &self.happy_shapes,
            1 => &self.sad_shapes,
            _ => &self.angry_shapes,
        }
    }

    fn mood_colors(&self) -> (u32, u32, u32) {
        // (bg_top, neon_line, glow_accent)
        match self.active_mood {
            0 => (0x0010_0A28, 0x00FF_E248, 0x003C_E8FF), // Happy: warm gold & cyan
            1 => (0x0008_1024, 0x0058_B8FF, 0x00A4_80FF), // Sad: cool jazz blue & violet
            _ => (0x0024_080A, 0x00FF_5830, 0x00FF_C028), // Angry: fiery crimson & amber
        }
    }
}

impl Default for LisaMoodsModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for LisaMoodsModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();

        let morph_raw = ctx.module.raw_control_value[0].clamp(0, 100);
        self.morph_steps_total = (10 + (morph_raw * 34) / 100) as usize;
        self.mood_setting = ctx.module.raw_control_value[1].clamp(0, 3);
        self.active_mood = if self.mood_setting == 3 {
            ctx.rng.rand_mod(3)
        } else {
            self.mood_setting
        };

        let pool_len = self.current_pool().len().max(1);
        self.from_idx = ctx.rng.rand_mod(pool_len as i32) as usize;
        self.to_idx = (self.from_idx + 1) % pool_len;
        self.morph_step = 0;
        self.hold_ticks = 22;
        self.tick = 0;
        self.scale = if ctx.surface.width >= 900 { 2 } else { 1 };

        if let Some(loops) = music_loops_from_slider(ctx.module.raw_control_value[2]) {
            let song = match self.active_mood {
                0 => SONG_LISA_HAPPY,
                1 => SONG_LISA_SAD,
                _ => SONG_LISA_ANGRY,
            };
            SimpsonsPack::global().play_music(ctx.sound, ctx.system.sound_enabled, song, loops);
        }

        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        let (bg, _, _) = self.mood_colors();
        fill_rect_px(ctx.surface, 0, 0, ctx.surface.width, ctx.surface.height, bg);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.tick = self.tick.wrapping_add(1);
        let w = ctx.surface.width;
        let h = ctx.surface.height;
        let (bg, line_col, accent_col) = self.mood_colors();

        // Deep moody jazz-club gradient backdrop
        let dst = ctx.surface.pixels_mut();
        let br = ((bg >> 16) & 0xFF) as i32;
        let bg_g = ((bg >> 8) & 0xFF) as i32;
        let bb = (bg & 0xFF) as i32;
        for y in 0..h {
            let lift = (y * 18) / h.max(1);
            let r = (br + lift / 2).clamp(0, 255) as u32;
            let g = (bg_g + lift / 2).clamp(0, 255) as u32;
            let b = (bb + lift).clamp(0, 255) as u32;
            let c = (r << 16) | (g << 8) | b;
            let row = (y * w) as usize;
            dst[row..row + w as usize].fill(c);
        }

        // Advance hold -> morph -> next subconscious vision
        if self.hold_ticks > 0 {
            self.hold_ticks -= 1;
        } else {
            self.morph_step += 1;
            if self.morph_step >= self.morph_steps_total {
                self.morph_step = 0;
                self.hold_ticks = 34;
                self.from_idx = self.to_idx;
                if self.mood_setting == 3 && ctx.rng.rand_mod(5) == 0 {
                    self.active_mood = (self.active_mood + 1) % 3;
                    let pool_len = self.current_pool().len().max(1);
                    self.from_idx %= pool_len;
                }
                let pool_len = self.current_pool().len().max(1);
                let mut next = ctx.rng.rand_mod(pool_len as i32) as usize;
                if next == self.from_idx && pool_len > 1 {
                    next = (next + 1) % pool_len;
                }
                self.to_idx = next;
            }
        }

        // Subtle stage floor spotlight under Lisa
        let lisa_y_bottom = h - 18 * self.scale;
        let lisa_cx = w / 2;
        for dy in -12..=12 {
            let py = lisa_y_bottom + dy;
            if py < 0 || py >= h {
                continue;
            }
            let rx = ((1.0 - (dy as f32 / 12.0).powi(2)).max(0.0).sqrt() * 68.0 * self.scale as f32)
                as i32;
            fill_rect_px(ctx.surface, lisa_cx - rx, py, lisa_cx + rx, py + 1, 0x0026_2448);
        }

        // Draw smoothly morphing subconscious vision in upper/center 65% of screen!
        let pool = self.current_pool();
        if !pool.is_empty() {
            let s0 = &pool[self.from_idx % pool.len()];
            let s1 = &pool[self.to_idx % pool.len()];
            let t_lin = if self.hold_ticks > 0 {
                0.0
            } else {
                self.morph_step as f32 / self.morph_steps_total.max(1) as f32
            };
            // Smoothstep easing for buttery morphs
            let t = t_lin * t_lin * (3.0 - 2.0 * t_lin);

            let vision_cx = w as f32 * 0.5;
            let vision_cy = (h as f32 * 0.37).max(60.0);
            let radius = (w.min(h) as f32 * 0.28).max(46.0);
            let breathe = 1.0 + (self.tick as f32 * 0.06).sin() * 0.03;
            let r = radius * breathe;
            let thick = if w >= 900 { 3 } else { 2 };

            let mut prev: Option<(i32, i32)> = None;
            for i in 0..MORPH_SAMPLES {
                let (x0, y0, d0) = s0.pts[i];
                let (x1, y1, d1) = s1.pts[i];
                let mx = x0 + (x1 - x0) * t;
                let my = y0 + (y1 - y0) * t;
                let sx = (vision_cx + mx * r) as i32;
                let sy = (vision_cy + my * r) as i32;
                let draw_seg = if t < 0.5 { d0 } else { d1 };
                if draw_seg {
                    if let Some((px, py)) = prev {
                        // Avoid stray giant teleport lines between unrelated strokes
                        if (sx - px).abs() + (sy - py).abs() < (radius as i32) {
                            let col = if (i & 7) == 0 { accent_col } else { line_col };
                            draw_line_px(ctx.surface, px, py, sx, sy, col, thick);
                        }
                    }
                }
                prev = Some((sx, sy));
            }
        }

        // Draw animated Lisa playing saxophone at bottom-center (all 33 frames!)
        if !self.lisa_bank.frames.is_empty() {
            let fi = (self.tick / 3) % self.lisa_bank.frames.len();
            let sp = &self.lisa_bank.frames[fi];
            let lx = lisa_cx - (sp.w * self.scale) / 2;
            let ly = lisa_y_bottom - sp.h * self.scale;
            sp.blit_scaled(ctx.surface, lx, ly, self.scale);

            // Floating glowing musical sparks drifting upward from Lisa's sax bell
            for k in 0..4 {
                let phase = ((self.tick * 2 + k * 23) % 90) as f32;
                let nx = lisa_cx + (20 * self.scale) + ((phase * 0.14 + k as f32).sin() * 24.0) as i32;
                let ny = ly + (36 * self.scale) - (phase * 1.3 * self.scale as f32) as i32;
                if ny > 10 {
                    fill_circle_px(ctx.surface, nx, ny, 2 * self.scale, accent_col);
                    draw_line_px(
                        ctx.surface,
                        nx + 2 * self.scale,
                        ny,
                        nx + 2 * self.scale,
                        ny - 9 * self.scale,
                        accent_col,
                        self.scale,
                    );
                }
            }
        }

        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        AdResult::NoError
    }
}
