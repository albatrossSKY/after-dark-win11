//! "Cartoons 101" — Classic 1995 *Looney Tunes* After Dark 3.0 module.
//!
//! Full-widescreen Cartoon Physics Blueprint lecture board demonstrating all 21
//! laws of Looney Tunes Cartoon Physics (`STR# #7050..#7250`) with smoothly
//! scaled Wile E. Coyote & Road Runner (`OFst #7000`), toggleable blueprint
//! `Grid`, scaled typewriter lesson captions (`RLEP #7500`), and SFX!

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::looney::{
    CARTOONS101_SFX, MOD_CARTOONS_101, advance_filtered_range, draw_looney_text_f, fill_box_px,
    load_anim, load_rlep, looney_pack, outline_box_px, wrap_looney_text_f,
};
use crate::simpsons::{CompoundAnim, KIND_STR_LIST, RlepBank, draw_line_px, parse_str_list};

struct CartoonLesson {
    heading: String,
    title: String,
    body: String,
    corollary: Option<String>,
}

pub struct Cartoons101Module {
    show_grid: bool,
    font: Option<RlepBank>,
    anim: Option<CompoundAnim>,
    lessons: Vec<CartoonLesson>,
    cur_lesson: usize,
    frame_idx: usize,
    tick: u32,
}

impl Cartoons101Module {
    pub fn new() -> Self {
        Self {
            show_grid: true,
            font: None,
            anim: None,
            lessons: Vec::new(),
            cur_lesson: 0,
            frame_idx: 0,
            tick: 0,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "looney_cartoons_101".to_string(),
            name: "Cartoons 101".to_string(),
            filename: "CART101.AD".to_string(),
            credit: "By Alan K., Jarir M., Laura T. & Maury Z.\nSoftware © 1995 Berkeley Systems, Inc.\nLooney Tunes ™ & © Warner Bros.".to_string(),
            about: "Things just ain't the same in the cartoon universe! Wile E. Coyote and the Road Runner demonstrate 21 laws of Cartoon Physics, from Gravitational Cognizance to Acoustic Dentition.".to_string(),
            controls: [
                AdControl::Checkbox {
                    title: "Grid".to_string(),
                    default_checked: true,
                },
                AdControl::None,
                AdControl::None,
                AdControl::None,
            ],
            target_frame_ms: 68,
        }
    }

    fn ensure_loaded(&mut self) {
        if self.font.is_none() {
            self.font = Some(load_rlep(MOD_CARTOONS_101, 7500));
        }
        if self.anim.is_none() {
            self.anim = Some(load_anim(MOD_CARTOONS_101, 7000));
        }
        if self.lessons.is_empty() {
            for rid in (7050..=7250).step_by(10) {
                if let Some(raw) = looney_pack().get(MOD_CARTOONS_101, KIND_STR_LIST, rid) {
                    let list = parse_str_list(raw);
                    if list.len() >= 2 {
                        let raw_hdr = list[0].replace('\r', "");
                        let (heading, title) = if let Some((h, t)) = raw_hdr.split_once("#R") {
                            (h.trim().to_string(), t.trim().to_string())
                        } else {
                            ("CARTOON LAW".to_string(), raw_hdr.trim().to_string())
                        };
                        let body = list[1].trim().to_string();
                        let corollary = list.get(2).map(|s| s.trim().to_string());
                        self.lessons.push(CartoonLesson {
                            heading,
                            title,
                            body,
                            corollary,
                        });
                    }
                }
            }
        }
    }
}

impl Default for Cartoons101Module {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for Cartoons101Module {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();
        self.show_grid = ctx.module.raw_control_value[0] != 0;
        self.tick = 0;
        self.cur_lesson = 0;
        self.frame_idx = 0;
        ctx.surface.pixels_mut().fill(0x000A_1428);
        looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, CARTOONS101_SFX[3]);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.surface.pixels_mut().fill(0x000A_1428);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();
        self.tick = self.tick.wrapping_add(1);

        let w = ctx.surface.width;
        let h = ctx.surface.height;
        let sf = (h as f32 / 480.0).clamp(0.95, 3.6);
        ctx.surface.pixels_mut().fill(0x000C_1830);

        if self.show_grid {
            let step = (32.0 * sf).round().max(24.0) as i32;
            let major = step * 5;
            let mut gx = 0;
            while gx < w {
                let col = if gx % major == 0 {
                    0x0022_4478
                } else {
                    0x0013_2646
                };
                draw_line_px(ctx.surface, gx, 0, gx, h - 1, col, 1);
                gx += step;
            }
            let mut gy = 0;
            while gy < h {
                let col = if gy % major == 0 {
                    0x0022_4478
                } else {
                    0x0013_2646
                };
                draw_line_px(ctx.surface, 0, gy, w - 1, gy, col, 1);
                gy += step;
            }
        }

        let (Some(font), Some(anim)) = (&self.font, &self.anim) else {
            return AdResult::NoError;
        };

        let n_frames = anim.frames.len().saturating_sub(1);
        self.frame_idx =
            advance_filtered_range(anim, self.frame_idx, 1, n_frames, 36, 48, 230, 240);
        if self.tick % 90 == 0 && !self.lessons.is_empty() {
            self.cur_lesson = (self.cur_lesson + 1) % self.lessons.len();
            let sfx = CARTOONS101_SFX[self.cur_lesson % CARTOONS101_SFX.len()];
            looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, sfx);
        }

        // Full-widescreen Cartoon Physics Lesson Chalkboard Card at top
        let pad = (h / 24).clamp(12, 36);
        let card_x = pad;
        let card_w = (w - pad * 2).max(240);
        let card_y = pad;
        let card_h = (h * 30 / 100).max(115);
        let border = (sf * 2.0).round().max(2.0) as i32;
        fill_box_px(ctx.surface, card_x, card_y, card_w, card_h, 0x0008_1020);
        outline_box_px(ctx.surface, card_x, card_y, card_w, card_h, 0x0048_88D8, border);

        let text_sf = (sf * 1.15).clamp(1.0, 3.6);
        let line_h = (19.0 * text_sf).round() as i32;
        let inner_pad = (16.0 * sf).round() as i32;

        if let Some(lesson) = self.lessons.get(self.cur_lesson) {
            let header = format!("{}: {}", lesson.heading, lesson.title);
            draw_looney_text_f(
                ctx.surface,
                font,
                &header,
                card_x + inner_pad,
                card_y + (12.0 * sf).round() as i32,
                Some(0xFFE0_40),
                text_sf,
            );

            let lines = wrap_looney_text_f(font, &lesson.body, card_w - inner_pad * 2, text_sf);
            let mut ty = card_y + (12.0 * sf).round() as i32 + line_h + 6;
            for line in lines.iter().take(3) {
                if ty + line_h > card_y + card_h - 6 {
                    break;
                }
                draw_looney_text_f(
                    ctx.surface,
                    font,
                    line,
                    card_x + inner_pad,
                    ty,
                    Some(0xFFFF_FF),
                    text_sf,
                );
                ty += line_h;
            }
            if let Some(cor) = &lesson.corollary {
                ty += 4;
                let clines = wrap_looney_text_f(font, cor, card_w - inner_pad * 2, text_sf);
                for line in clines.iter().take(2) {
                    if ty + line_h > card_y + card_h - 4 {
                        break;
                    }
                    draw_looney_text_f(
                        ctx.surface,
                        font,
                        line,
                        card_x + inner_pad,
                        ty,
                        Some(0x80D8_FF),
                        text_sf,
                    );
                    ty += line_h;
                }
            }
        }

        // Full-widescreen Demonstration Stage cleanly below the lesson card
        let stage_y = card_y + card_h + (pad * 3 / 4);
        let stage_h = (h - stage_y - pad).max(160);
        fill_box_px(ctx.surface, card_x, stage_y, card_w, stage_h, 0x0010_203A);
        outline_box_px(ctx.surface, card_x, stage_y, card_w, stage_h, 0x0030_60A0, border);

        let floor_h = (stage_h / 7).clamp(24, 68);
        let floor_y = stage_y + stage_h - floor_h;
        fill_box_px(ctx.surface, card_x + border, floor_y, card_w - border * 2, floor_h - border, 0x008A_4B22);
        draw_line_px(
            ctx.surface,
            card_x + border,
            floor_y,
            card_x + card_w - border,
            floor_y,
            0x00D8_8844,
            border,
        );

        let actor_sf = ((stage_h as f32 * 0.62) / 160.0).clamp(1.0, 3.8);
        anim.draw_anchored_bottom_f(
            ctx.surface,
            self.frame_idx,
            w / 2 - (card_w / 6),
            floor_y + 4,
            actor_sf,
            false,
            true,
            false,
        );
        let raw_comp = (self.frame_idx + n_frames / 3) % n_frames.max(1);
        let comp_idx = advance_filtered_range(anim, raw_comp, 1, n_frames, 36, 48, 230, 240);
        anim.draw_anchored_bottom_f(
            ctx.surface,
            comp_idx,
            w / 2 + (card_w / 6),
            floor_y + 4,
            actor_sf,
            false,
            true,
            false,
        );

        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        AdResult::NoError
    }
}
