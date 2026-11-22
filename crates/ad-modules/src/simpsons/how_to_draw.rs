//! *How to Draw* — 1994 *The Simpsons* After Dark 3.0 Module.
//!
//! Step-by-step character construction lessons by *The Simpsons* director
//! David Silverman (`Lisa #1000..#1004`, `Hstr #1000..#1600`, `RLEP #1020/#1030/#1060/#1061`):
//! draws Homer, Marge, Bart, Lisa, and Maggie stroke-by-stroke with authentic
//! drawing tips, finished color portraits, and all 20 hilarious "Wild" variants!

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use super::{
    KIND_HSTR, LisaDrawing, MOD_HOW_TO_DRAW, RlepBank, SND_BART_DOIT, SND_CHALK_HIT1,
    SND_HOMER_AWW, SND_WHOOSH, SimpsonsPack, SpriteFrame, draw_bitmap_text, draw_line_px,
    draw_rect_outline_px, fill_circle_px, fill_rect_px, parse_str_list, wrap_bitmap_text,
};

const CHAR_NAMES: [&str; 5] = ["HOMER", "MARGE", "BART", "LISA", "MAGGIE"];

#[derive(Clone, Copy, PartialEq, Eq)]
enum DrawPhase {
    Sketching,
    FinishedColor,
    WildVariant,
}

pub struct HowToDrawModule {
    drawings: Vec<LisaDrawing>,
    tips: Vec<Vec<String>>,
    eye_titles: Vec<String>,
    wild_titles: Vec<String>,
    finished: Vec<SpriteFrame>,
    wilds: Vec<SpriteFrame>,
    font: RlepBank,
    char_idx: usize,
    stroke_idx: usize,
    pt_idx: usize,
    phase: DrawPhase,
    phase_ticks: usize,
    wild_sub: usize,
    speed_pts: usize,
    show_tips: bool,
    tick: usize,
}

impl HowToDrawModule {
    pub fn new() -> Self {
        Self {
            drawings: Vec::new(),
            tips: Vec::new(),
            eye_titles: Vec::new(),
            wild_titles: Vec::new(),
            finished: Vec::new(),
            wilds: Vec::new(),
            font: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            char_idx: 0,
            stroke_idx: 0,
            pt_idx: 0,
            phase: DrawPhase::Sketching,
            phase_ticks: 0,
            wild_sub: 0,
            speed_pts: 4,
            show_tips: true,
            tick: 0,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "simpsons_how_to_draw".to_string(),
            name: "How to Draw".to_string(),
            credit: "By D. Silverman, J. Maani, and B. Resner.\nSoftware © 1994 Berkeley Systems, Inc.\nThe Simpsons ™ & © Twentieth Century Fox.".to_string(),
            about: "Features authentic tips and step-by-step animated construction diagrams from Simpsons director David Silverman for drawing Homer, Marge, Bart, Lisa, and Maggie — plus 20 goofy 'Wild' variations!".to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "Draw Speed:".to_string(),
                    default_raw: 58,
                    labels: vec![
                        "Sloooow".into(),
                        "Slow".into(),
                        "Pokey".into(),
                        "Speedy".into(),
                        "UltraSpeedy".into(),
                        "Wuhwuzzat?".into(),
                    ],
                    thresholds: vec![0, 16, 33, 50, 66, 83],
                },
                AdControl::Checkbox {
                    title: "Drawing Tips".to_string(),
                    default_checked: true,
                },
                AdControl::None,
                AdControl::None,
            ],
            target_frame_ms: 35,
            filename: "HOWDRAW.AD".to_string(),
        }
    }

    fn ensure_loaded(&mut self) {
        if !self.drawings.is_empty() {
            return;
        }
        let pack = SimpsonsPack::global();
        for rid in 1000..=1004 {
            if let Some(d) = LisaDrawing::load(MOD_HOW_TO_DRAW, rid) {
                self.drawings.push(d);
            }
            let tip_list = pack
                .get(MOD_HOW_TO_DRAW, KIND_HSTR, rid)
                .map(|b| {
                    parse_str_list(b)
                        .into_iter()
                        .map(|s| s.trim().to_string())
                        .collect()
                })
                .unwrap_or_default();
            self.tips.push(tip_list);
        }
        self.wild_titles = pack
            .get(MOD_HOW_TO_DRAW, KIND_HSTR, 1500)
            .map(parse_str_list)
            .unwrap_or_default();
        self.eye_titles = pack
            .get(MOD_HOW_TO_DRAW, KIND_HSTR, 1600)
            .map(parse_str_list)
            .unwrap_or_default();

        self.font = RlepBank::load(MOD_HOW_TO_DRAW, 1020);
        self.finished = RlepBank::load(MOD_HOW_TO_DRAW, 1030).frames;
        let mut w_all = RlepBank::load(MOD_HOW_TO_DRAW, 1060).frames;
        w_all.extend(RlepBank::load(MOD_HOW_TO_DRAW, 1061).frames);
        self.wilds = w_all;
    }

    fn render_board(&self, surface: &mut ad_sdk::canvas::AdSurface) {
        let w = surface.width;
        let h = surface.height;

        // Warm animator's drafting paper with faint blue peg-bar grid
        fill_rect_px(surface, 0, 0, w, h, 0x00F6_F2E4);
        let grid_step = if w >= 900 { 32 } else { 24 };
        for x in (0..w).step_by(grid_step) {
            fill_rect_px(surface, x, 0, x + 1, h, 0x00E4_E8EE);
        }
        for y in (0..h).step_by(grid_step) {
            fill_rect_px(surface, 0, y, w, y + 1, 0x00E4_E8EE);
        }

        // Top animation studio header strip
        let scale = if w >= 960 { 2 } else { 1 };
        let hdr_h = 26 * scale;
        fill_rect_px(surface, 0, 0, w, hdr_h, 0x001E_3458);
        let title = format!(
            "HOW TO DRAW: {}  (BY DAVID SILVERMAN)",
            CHAR_NAMES[self.char_idx % 5]
        );
        draw_bitmap_text(
            surface,
            &self.font,
            &title,
            14 * scale,
            8 * scale,
            Some(0x00FF_E240),
            scale,
        );

        let tip_panel_h = if self.show_tips { 64 * scale } else { 16 * scale };
        let work_top = hdr_h + 10;
        let work_bot = (h - tip_panel_h - 10).max(work_top + 60);
        let work_h = work_bot - work_top;
        let work_cx = w / 2;

        // Draw current lesson content
        if let Some(drawing) = self.drawings.get(self.char_idx) {
            let dw = (drawing.max_x - drawing.min_x).max(1) as f32;
            let dh = (drawing.max_y - drawing.min_y).max(1) as f32;
            let sc = ((w as f32 * 0.42) / dw).min((work_h as f32 * 0.86) / dh);

            // Place sketch on left half when finished/wild is shown, or centered while sketching
            let sketch_cx = if self.phase == DrawPhase::Sketching {
                work_cx as f32
            } else {
                w as f32 * 0.30
            };
            let sketch_cy = (work_top + work_h / 2) as f32;
            let mid_x = (drawing.min_x + drawing.max_x) as f32 * 0.5;
            let mid_y = (drawing.min_y + drawing.max_y) as f32 * 0.5;

            let max_st = if self.phase == DrawPhase::Sketching {
                self.stroke_idx.min(drawing.strokes.len())
            } else {
                drawing.strokes.len()
            };
            let thick = if w >= 900 { 3 } else { 2 };

            for (si, st) in drawing.strokes.iter().enumerate() {
                if si > max_st {
                    break;
                }
                let limit_pts = if self.phase == DrawPhase::Sketching && si == max_st {
                    self.pt_idx.min(st.len())
                } else {
                    st.len()
                };
                // First 5 strokes are blue animator's balance/construction lines; rest are crisp black ink
                let col = if si < 5 { 0x0038_76D4 } else { 0x0016_1622 };
                for k in 0..limit_pts.saturating_sub(1) {
                    let x0 = (sketch_cx + (st[k].0 as f32 - mid_x) * sc) as i32;
                    let y0 = (sketch_cy + (st[k].1 as f32 - mid_y) * sc) as i32;
                    let x1 = (sketch_cx + (st[k + 1].0 as f32 - mid_x) * sc) as i32;
                    let y1 = (sketch_cy + (st[k + 1].1 as f32 - mid_y) * sc) as i32;
                    draw_line_px(surface, x0, y0, x1, y1, col, thick);
                }
                // Pencil tip marker on active stroke
                if self.phase == DrawPhase::Sketching && si == max_st && limit_pts > 0 {
                    let p = st[limit_pts - 1];
                    let px = (sketch_cx + (p.0 as f32 - mid_x) * sc) as i32;
                    let py = (sketch_cy + (p.1 as f32 - mid_y) * sc) as i32;
                    fill_circle_px(surface, px, py, 3 * scale, 0x00E8_3220);
                }
            }

            // Show Finished Color Character or Goofy Wild Variant on the right half!
            if self.phase == DrawPhase::FinishedColor {
                if let Some(fin) = self.finished.get(self.char_idx) {
                    let sp_scale = if w >= 960 && fin.h * 2 <= work_h { 2 } else { 1 };
                    let fx = (w as f32 * 0.68) as i32 - (fin.w * sp_scale) / 2;
                    let fy = work_top + (work_h - fin.h * sp_scale) / 2;
                    fin.blit_scaled(surface, fx, fy, sp_scale);
                }
            } else if self.phase == DrawPhase::WildVariant {
                let wild_idx = (self.char_idx * 4 + (self.wild_sub % 4)) % self.wilds.len().max(1);
                if let Some(wild) = self.wilds.get(wild_idx) {
                    let sp_scale = if w >= 1000 && wild.h * 2 <= work_h {
                        2
                    } else {
                        1
                    };
                    let fx = (w as f32 * 0.68) as i32 - (wild.w * sp_scale) / 2;
                    let fy = work_top + (work_h - wild.h * sp_scale) / 2;
                    wild.blit_scaled(surface, fx, fy, sp_scale);
                }
            }
        }

        // Bottom Drawing Tips card
        if self.show_tips {
            let ty = h - tip_panel_h;
            fill_rect_px(surface, 10, ty, w - 10, h - 8, 0x00FF_FBE0);
            draw_rect_outline_px(surface, 10, ty, w - 10, h - 8, 0x0026_4878, 2);

            let tip_text = match self.phase {
                DrawPhase::Sketching => {
                    let list = self.tips.get(self.char_idx);
                    if let Some(tips) = list {
                        if !tips.is_empty() {
                            let idx = (self.stroke_idx / 3) % tips.len();
                            format!("TIP: {}", tips[idx])
                        } else {
                            "TIP: Start with the vertical balance line!".to_string()
                        }
                    } else {
                        String::new()
                    }
                }
                DrawPhase::FinishedColor => {
                    let eye = self
                        .eye_titles
                        .get(self.char_idx)
                        .cloned()
                        .unwrap_or_default();
                    format!("FINISHED!  {}", eye)
                }
                DrawPhase::WildVariant => {
                    let wild_idx =
                        (self.char_idx * 4 + (self.wild_sub % 4)) % self.wild_titles.len().max(1);
                    let wt = self
                        .wild_titles
                        .get(wild_idx)
                        .cloned()
                        .unwrap_or_else(|| "WILD VARIATION!".to_string());
                    format!("WILD VARIATION: {}", wt)
                }
            };

            let mut ly = ty + 8 * scale;
            let max_w = (w - 40).max(100);
            for line in wrap_bitmap_text(&self.font, &tip_text, max_w, scale) {
                if ly + 12 * scale > h - 10 {
                    break;
                }
                draw_bitmap_text(
                    surface,
                    &self.font,
                    &line,
                    20,
                    ly,
                    Some(0x0018_2848),
                    scale,
                );
                ly += 14 * scale;
            }
        }
    }
}

impl Default for HowToDrawModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for HowToDrawModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();
        let speed_raw = ctx.module.raw_control_value[0].clamp(0, 100);
        self.speed_pts = (1 + (speed_raw * 11) / 100) as usize;
        self.show_tips = ctx.module.raw_control_value[1] != 0;

        self.char_idx = ctx.rng.rand_mod(self.drawings.len().max(1) as i32) as usize;
        self.stroke_idx = 0;
        self.pt_idx = 0;
        self.phase = DrawPhase::Sketching;
        self.phase_ticks = 0;
        self.wild_sub = ctx.rng.rand_mod(4) as usize;
        self.tick = 0;
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.render_board(ctx.surface);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.tick = self.tick.wrapping_add(1);
        self.phase_ticks += 1;
        let pack = SimpsonsPack::global();

        match self.phase {
            DrawPhase::Sketching => {
                if let Some(d) = self.drawings.get(self.char_idx) {
                    let mut budget = self.speed_pts;
                    while budget > 0 && self.stroke_idx < d.strokes.len() {
                        let st_len = d.strokes[self.stroke_idx].len();
                        let rem = st_len.saturating_sub(self.pt_idx);
                        if budget < rem {
                            self.pt_idx += budget;
                            budget = 0;
                        } else {
                            budget -= rem;
                            self.stroke_idx += 1;
                            self.pt_idx = 0;
                            if self.stroke_idx % 6 == 0 {
                                pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_CHALK_HIT1);
                            }
                        }
                    }
                    if self.stroke_idx >= d.strokes.len() {
                        self.phase = DrawPhase::FinishedColor;
                        self.phase_ticks = 0;
                        pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_WHOOSH);
                    }
                }
            }
            DrawPhase::FinishedColor => {
                if self.phase_ticks >= 50 {
                    self.phase = DrawPhase::WildVariant;
                    self.phase_ticks = 0;
                    self.wild_sub = (self.wild_sub + 1) % 4;
                    let snd = if self.char_idx == 2 {
                        SND_BART_DOIT
                    } else {
                        SND_HOMER_AWW
                    };
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, snd);
                }
            }
            DrawPhase::WildVariant => {
                if self.phase_ticks >= 60 {
                    self.char_idx = (self.char_idx + 1) % self.drawings.len().max(1);
                    self.stroke_idx = 0;
                    self.pt_idx = 0;
                    self.phase = DrawPhase::Sketching;
                    self.phase_ticks = 0;
                }
            }
        }

        self.render_board(ctx.surface);
        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        AdResult::NoError
    }
}
