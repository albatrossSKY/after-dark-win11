//! "Cartoons 101" — Classic 1995 *Looney Tunes* After Dark 3.0 module.
//!
//! Demonstrates the 21 fundamental laws of Looney Tunes Cartoon Physics
//! (`STR# #7050..#7250`) with Wile E. Coyote and the Road Runner (`RLEP #7000..#7005`,
//! 1,324 compound animation frames in `OFst #7000`), optional physics blueprint
//! `Grid`, typewriter lesson captions (`RLEP #7500`), and digitized Road Runner
//! *"Beep! Beep!"* / typewriter / 18-wheeler truck sound effects.

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::looney::{
    CARTOONS101_SFX, MOD_CARTOONS_101, draw_looney_text, fill_box_px, load_anim, load_rlep,
    looney_pack, outline_box_px, wrap_looney_text,
};
use crate::simpsons::{
    CompoundAnim, KIND_STR_LIST, RlepBank, draw_line_px, parse_str_list,
};

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
        ctx.surface.pixels_mut().fill(0x000C_1830);

        if self.show_grid {
            let mut gx = 0;
            while gx < w {
                let col = if gx % 160 == 0 {
                    0x001E_3A68
                } else {
                    0x0013_2646
                };
                draw_line_px(ctx.surface, gx, 0, gx, h - 1, col, 1);
                gx += 32;
            }
            let mut gy = 0;
            while gy < h {
                let col = if gy % 160 == 0 {
                    0x001E_3A68
                } else {
                    0x0013_2646
                };
                draw_line_px(ctx.surface, 0, gy, w - 1, gy, col, 1);
                gy += 32;
            }
        }

        let (Some(font), Some(anim)) = (&self.font, &self.anim) else {
            return AdResult::NoError;
        };

        let n_frames = anim.frames.len().saturating_sub(1);
        self.frame_idx = crate::looney::advance_filtered_range(
            anim,
            self.frame_idx,
            1,
            n_frames,
            36,
            48,
            230,
            240,
        );
        if self.tick % 90 == 0 && !self.lessons.is_empty() {
            self.cur_lesson = (self.cur_lesson + 1) % self.lessons.len();
            let sfx = CARTOONS101_SFX[(self.cur_lesson) % CARTOONS101_SFX.len()];
            looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, sfx);
        }

        // Top Cartoon Physics Lesson Chalkboard / Textbook Card
        let card_w = (w - 64).min(560);
        let card_x = (w - card_w) / 2;
        let card_y = 20;
        let card_h = 138;
        fill_box_px(ctx.surface, card_x, card_y, card_w, card_h, 0x0008_1020);
        outline_box_px(ctx.surface, card_x, card_y, card_w, card_h, 0x0048_88D8, 2);

        if let Some(lesson) = self.lessons.get(self.cur_lesson) {
            let header = format!("{}: {}", lesson.heading, lesson.title);
            draw_looney_text(
                ctx.surface,
                font,
                &header,
                card_x + 14,
                card_y + 12,
                Some(0xFFE0_40),
                1,
            );

            let lines = wrap_looney_text(font, &lesson.body, card_w - 28, 1);
            let mut ty = card_y + 36;
            for line in lines.iter().take(3) {
                draw_looney_text(ctx.surface, font, line, card_x + 14, ty, Some(0xFFFF_FF), 1);
                ty += 18;
            }
            if let Some(cor) = &lesson.corollary {
                ty += 4;
                let clines = wrap_looney_text(font, cor, card_w - 28, 1);
                for line in clines.iter().take(2) {
                    draw_looney_text(ctx.surface, font, line, card_x + 14, ty, Some(0x80D8_FF), 1);
                    ty += 17;
                }
            }
        }

        // Demonstration Stage below the lesson card
        let stage_y = card_y + card_h + 18;
        let stage_h = (h - stage_y - 20).max(200);
        fill_box_px(ctx.surface, card_x, stage_y, card_w, stage_h, 0x0010_203A);
        outline_box_px(ctx.surface, card_x, stage_y, card_w, stage_h, 0x0030_60A0, 2);

        let floor_y = stage_y + stage_h - 36;
        fill_box_px(ctx.surface, card_x + 2, floor_y, card_w - 4, 34, 0x008A_4B22);
        draw_line_px(
            ctx.surface,
            card_x + 2,
            floor_y,
            card_x + card_w - 3,
            floor_y,
            0x00D8_8844,
            2,
        );

        anim.draw_anchored_bottom(ctx.surface, self.frame_idx, w / 2 - 70, floor_y + 4, 1, false);
        let raw_comp = (self.frame_idx + n_frames / 3) % n_frames.max(1);
        let comp_idx =
            crate::looney::advance_filtered_range(anim, raw_comp, 1, n_frames, 36, 48, 230, 240);
        anim.draw_anchored_bottom(ctx.surface, comp_idx, w / 2 + 95, floor_y + 4, 1, false);

        AdResult::NoError
    }
}
