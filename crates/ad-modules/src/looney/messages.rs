//! "Looney Messages" — Classic 1995 *Looney Tunes* After Dark 3.0 module.
//!
//! Elmer Fudd, Foghorn Leghorn (who interjects *", I SAY, SON"* from `STR# #11160`),
//! or Speedy Gonzales (`OFst #11000`, 331 compound frames across `RLEP #11000..#11001`)
//! delivers your message (`STR# #11150..#11155` or custom text) in bold cartoon
//! display typography (`RLEP #11200` 42px and `RLEP #11500` 23px) with digitized
//! cast voices (`MSG_ELMER_VOICES`, `MSG_FOGHORN_VOICES`, `MSG_SPEEDY_VOICES`).

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::looney::{
    MOD_MESSAGES, MSG_ELMER_VOICES, MSG_FOGHORN_VOICES, MSG_SPEEDY_VOICES, draw_looney_text,
    fill_box_px, load_anim, load_rlep, looney_pack, measure_looney_text, outline_box_px,
    wrap_looney_text,
};
use crate::simpsons::{CompoundAnim, RlepBank};

const PRESET_MESSAGES: &[&str] = &[
    "Out to lunch.",
    "In a meeting.",
    "Out today.",
    "Back in a little while.",
    "Please do not disturb.",
    "Wead this, Wabbit!",
];

pub struct LooneyMessagesModule {
    type_idx: i32,
    msg_idx: i32,
    font_big: Option<RlepBank>,
    font_med: Option<RlepBank>,
    anim: Option<CompoundAnim>,
    active_actor: usize, // 0 = Elmer, 1 = Foghorn, 2 = Speedy, 3 = Speedy-er
    frame_idx: usize,
    actor_x: f32,
    tick: u32,
}

impl LooneyMessagesModule {
    pub fn new() -> Self {
        Self {
            type_idx: 4, // Random
            msg_idx: 0,
            font_big: None,
            font_med: None,
            anim: None,
            active_actor: 1,
            frame_idx: 0,
            actor_x: 320.0,
            tick: 0,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "looney_messages".to_string(),
            name: "Looney Messages".to_string(),
            filename: "LOONMSG.AD".to_string(),
            credit: "By Jarir Maani & Mark Palange.\nSoftware © 1995 Berkeley Systems, Inc.\nLooney Tunes ™ & © Warner Bros.".to_string(),
            about: "Want to get something off your chest? Elmer Fudd, Foghorn Leghorn, and Speedy Gonzales deliver your away messages with classic Looney Tunes flair!".to_string(),
            controls: [
                AdControl::Menu {
                    title: "Message Type".to_string(),
                    default_index: 4,
                    choices: vec![
                        "Elmer Fudd".to_string(),
                        "Foghorn Leghorn".to_string(),
                        "Speedy Gonzales".to_string(),
                        "Speedy-er".to_string(),
                        "Random".to_string(),
                    ],
                },
                AdControl::Menu {
                    title: "Message".to_string(),
                    default_index: 0,
                    choices: vec![
                        "Out to lunch.".to_string(),
                        "In a meeting.".to_string(),
                        "Out today.".to_string(),
                        "Back in a little while.".to_string(),
                        "Please do not disturb.".to_string(),
                        "Wead this, Wabbit!".to_string(),
                    ],
                },
                AdControl::None,
                AdControl::None,
            ],
            target_frame_ms: 68,
        }
    }

    fn ensure_loaded(&mut self) {
        if self.font_big.is_none() {
            self.font_big = Some(load_rlep(MOD_MESSAGES, 11200));
        }
        if self.font_med.is_none() {
            self.font_med = Some(load_rlep(MOD_MESSAGES, 11500));
        }
        if self.anim.is_none() {
            self.anim = Some(load_anim(MOD_MESSAGES, 11000));
        }
    }

    fn frame_range_for_actor(actor: usize) -> (usize, usize) {
        match actor {
            1 => (0, 176),   // Foghorn Leghorn
            0 => (177, 268), // Elmer Fudd
            _ => (269, 330), // Speedy Gonzales
        }
    }

    fn pick_actor(&mut self, ctx: &AdContext<'_>) {
        self.active_actor = match self.type_idx {
            0..=3 => self.type_idx as usize,
            _ => (self.active_actor + 1) % 3,
        };
        let (start, _) = Self::frame_range_for_actor(self.active_actor);
        self.frame_idx = start;
        let voice = match self.active_actor {
            0 => MSG_ELMER_VOICES[(self.tick as usize) % MSG_ELMER_VOICES.len()],
            1 => MSG_FOGHORN_VOICES[(self.tick as usize) % MSG_FOGHORN_VOICES.len()],
            _ => MSG_SPEEDY_VOICES[0],
        };
        looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, voice);
    }

    fn current_message(&self) -> String {
        let base = PRESET_MESSAGES
            .get(self.msg_idx.clamp(0, 5) as usize)
            .copied()
            .unwrap_or("OUT TO LUNCH.");
        if self.active_actor == 1 {
            format!("{} I SAY, SON!", base.to_ascii_uppercase())
        } else {
            base.to_ascii_uppercase()
        }
    }
}

impl Default for LooneyMessagesModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for LooneyMessagesModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();
        self.type_idx = ctx.module.raw_control_value[0].clamp(0, 4);
        self.msg_idx = ctx.module.raw_control_value[1].clamp(0, 5);
        self.tick = 0;
        self.actor_x = (ctx.surface.width.max(320) / 2) as f32;
        self.pick_actor(ctx);
        ctx.surface.pixels_mut().fill(0x0010_1424);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.surface.pixels_mut().fill(0x0010_1424);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();
        self.tick = self.tick.wrapping_add(1);

        let w = ctx.surface.width;
        let h = ctx.surface.height;
        ctx.surface.pixels_mut().fill(0x0010_1424);

        let (Some(font_big), Some(font_med), Some(anim)) =
            (&self.font_big, &self.font_med, &self.anim)
        else {
            return AdResult::NoError;
        };

        let sign_w = (w - 80).min(540);
        let sign_x = (w - sign_w) / 2;
        let sign_y = 34;
        let sign_h = 132;
        fill_box_px(ctx.surface, sign_x, sign_y, sign_w, sign_h, 0x00F6_E8C0);
        outline_box_px(ctx.surface, sign_x, sign_y, sign_w, sign_h, 0x00C8_3820, 4);
        outline_box_px(
            ctx.surface,
            sign_x + 6,
            sign_y + 6,
            sign_w - 12,
            sign_h - 12,
            0x00E8_A020,
            2,
        );

        let msg_upper = self.current_message();
        let big_w = measure_looney_text(font_big, &msg_upper, 1);
        if big_w <= sign_w - 32 {
            let tx = sign_x + (sign_w - big_w) / 2;
            let ty = sign_y + (sign_h - 42) / 2;
            draw_looney_text(ctx.surface, font_big, &msg_upper, tx, ty, None, 1);
        } else {
            let lines = wrap_looney_text(font_med, &msg_upper, sign_w - 32, 1);
            let total_h = (lines.len() as i32) * 28;
            let mut ty = sign_y + ((sign_h - total_h) / 2).max(14);
            for line in lines.iter().take(4) {
                let lw = measure_looney_text(font_med, line, 1);
                let tx = sign_x + ((sign_w - lw) / 2).max(10);
                draw_looney_text(ctx.surface, font_med, line, tx, ty, None, 1);
                ty += 28;
            }
        }

        let (start, end) = Self::frame_range_for_actor(self.active_actor);
        let end = end.min(anim.frames.len().saturating_sub(1));
        let next = crate::looney::advance_filtered_range(
            anim,
            self.frame_idx,
            start,
            end,
            45,
            45,
            240,
            240,
        );
        if next <= self.frame_idx && self.tick % 90 == 0 {
            self.pick_actor(ctx);
        } else {
            self.frame_idx = next;
        }

        if self.active_actor >= 2 {
            let spd = if self.active_actor == 3 { 9.0 } else { 5.0 };
            self.actor_x += spd;
            if self.actor_x > (w - 80) as f32 {
                self.actor_x = 80.0;
            }
        } else {
            self.actor_x = (w / 2 - 40) as f32;
        }

        let Some(anim) = &self.anim else {
            return AdResult::NoError;
        };
        anim.draw_anchored_bottom(
            ctx.surface,
            self.frame_idx,
            self.actor_x as i32,
            h - 42,
            1,
            false,
        );
        // Also draw Foghorn Leghorn or Elmer Fudd on the right side when Speedy is active (or vice versa)
        let raw_buddy = if self.active_actor >= 2 {
            17 + ((self.tick as usize) % 40)
        } else {
            180 + ((self.tick as usize) % 45)
        };
        let buddy_frame =
            crate::looney::advance_filtered_range(anim, raw_buddy, 0, 268, 45, 50, 240, 240);
        anim.draw_anchored_bottom(ctx.surface, buddy_frame, w / 2 + 125, h - 42, 1, false);

        AdResult::NoError
    }
}
