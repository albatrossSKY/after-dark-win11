//! *Starfleet Messages* — 1994 *Star Trek: The Next Generation* After Dark 3.0 Module.
//!
//! Displays Starfleet away messages across authentic **Plaque**, **Romulan Star
//! Empire** (`RLEP #3000` Bird-of-Prey console), and **Subspace LCARS** (`RLEP #5000`)
//! consoles with all 9 built-in TNG messages (`STR# #2000`), hailing frequencies,
//! and Romulan comm beeps!

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::simpsons::{
    CompoundAnim, KIND_STR_LIST, RlepBank, draw_bitmap_text, draw_rect_outline_px, fill_rect_px,
    measure_bitmap_text, parse_str_list, wrap_bitmap_text,
};
use super::{
    FONT_LCARS_14, FONT_LCARS_18, MOD_STARFLEET_MSG, SND_HAILING, SND_ROMULAN_BEEP1,
    SND_ROMULAN_BEEP2, SND_VIEWSCREEN, load_anim, load_lcars_font, load_rlep, tng_pack,
};

pub struct StarfleetMessagesModule {
    romulan_anim: Option<CompoundAnim>,
    plaque_bank: RlepBank,
    subspace_bank: RlepBank,
    anim_icons: RlepBank,
    font14: RlepBank,
    font18: RlepBank,
    messages: Vec<String>,
    style_setting: i32, // 0=Plaque, 1=Romulan, 2=Subspace, 3=Random
    active_style: i32,
    msg_setting: i32, // 0=Random, 1..=9 specific message
    active_msg: usize,
    duration_ticks: usize,
    ticks_shown: usize,
    tick: usize,
}

impl StarfleetMessagesModule {
    pub fn new() -> Self {
        Self {
            romulan_anim: None,
            plaque_bank: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            subspace_bank: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            anim_icons: RlepBank {
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
            messages: Vec::new(),
            style_setting: 3,
            active_style: 1,
            msg_setting: 0,
            active_msg: 0,
            duration_ticks: 95,
            ticks_shown: 0,
            tick: 0,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "tng_starfleet_messages".to_string(),
            name: "Starfleet Messages".to_string(),
            filename: "STFMSG.AD".to_string(),
            credit: "By E. Gibbs, R. Ho, J. Newman and M. Small.\nSoftware © 1994 Berkeley Systems, Inc.\nStar Trek: TNG ™ & © Paramount Pictures.".to_string(),
            about: "Broadcast Starfleet messages on a Gold Dedication Plaque, Romulan Star Empire Bird-of-Prey monitor, or LCARS Subspace Communication terminal — including Darmok, Ten-Forward, and Worf's warnings!".to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "Duration:".to_string(),
                    default_raw: 25,
                    labels: vec!["Short".into(), "Medium".into(), "Long".into()],
                    thresholds: vec![0, 25, 75],
                },
                AdControl::Menu {
                    title: "Style:".to_string(),
                    default_index: 3,
                    choices: vec![
                        "Plaque".into(),
                        "Romulan".into(),
                        "Subspace".into(),
                        "Random".into(),
                    ],
                },
                AdControl::Menu {
                    title: "Message:".to_string(),
                    default_index: 0,
                    choices: vec![
                        "Random".into(),
                        "Gone for the Day".into(),
                        "Out to Lunch".into(),
                        "Darmok".into(),
                        "Ten-Forward".into(),
                        "Priority Clearance".into(),
                        "Romulan Warbirds".into(),
                        "Antimatter Field".into(),
                        "Not a Merry Man".into(),
                        "Data on Jouret IV".into(),
                    ],
                },
                AdControl::None,
            ],
            target_frame_ms: 75,
        }
    }

    fn ensure_loaded(&mut self) {
        if !self.messages.is_empty() {
            return;
        }
        self.romulan_anim = Some(load_anim(MOD_STARFLEET_MSG, 3000));
        self.anim_icons = load_rlep(MOD_STARFLEET_MSG, 3032);
        self.plaque_bank = load_rlep(MOD_STARFLEET_MSG, 4001);
        self.subspace_bank = load_rlep(MOD_STARFLEET_MSG, 5000);
        self.font14 = load_lcars_font(FONT_LCARS_14);
        self.font18 = load_lcars_font(FONT_LCARS_18);

        if let Some(raw) = tng_pack().get(MOD_STARFLEET_MSG, KIND_STR_LIST, 2000) {
            self.messages = parse_str_list(raw);
        }
    }

    fn render_message(&self, surface: &mut ad_sdk::canvas::AdSurface) {
        let w = surface.width;
        let h = surface.height;
        fill_rect_px(surface, 0, 0, w, h, 0x0002_0408);

        let msg_raw = self
            .messages
            .get(self.active_msg % self.messages.len().max(1))
            .map(|s| s.as_str())
            .unwrap_or("INCOMING SUBSPACE TRANSMISSION");
        let msg_upper = super::lcars_upper(msg_raw);
        let msg = msg_upper.as_str();

        let s = if w >= 1100 { 2 } else { 1 };

        match self.active_style {
            0 => {
                // STARFLEET DEDICATION PLAQUE
                let pw = (w - 48).clamp(260, 520 * s);
                let ph = (h - 56).clamp(180, 340 * s);
                let px = (w - pw) / 2;
                let py = (h - ph) / 2;

                fill_rect_px(surface, px, py, px + pw, py + ph, 0x007E_5C22);
                fill_rect_px(surface, px + 8, py + 8, px + pw - 8, py + ph - 8, 0x001E_160C);
                draw_rect_outline_px(surface, px, py, px + pw, py + ph, 0x00F4_C858, 3);
                draw_rect_outline_px(surface, px + 8, py + 8, px + pw - 8, py + ph - 8, 0x00C8_9634, 2);

                let mut ty = py + 18 * s;
                if let Some(emblem) = self.plaque_bank.frames.first() {
                    if emblem.h * s < ph / 2 {
                        emblem.blit_scaled(surface, px + (pw - emblem.w * s) / 2, ty, s);
                        ty += emblem.h * s + 10 * s;
                    }
                }
                let hdr = "U.S.S. ENTERPRISE  NCC-1701-D";
                let hw = measure_bitmap_text(&self.font14, hdr, s);
                draw_bitmap_text(
                    surface,
                    &self.font14,
                    hdr,
                    px + (pw - hw) / 2,
                    ty,
                    Some(0x00F6_C858),
                    s,
                );
                ty += 22 * s;

                let lines = wrap_bitmap_text(&self.font18, msg, (pw - 40).max(120), s);
                for ln in &lines {
                    if ty + 20 * s > py + ph - 12 {
                        break;
                    }
                    let lw = measure_bitmap_text(&self.font18, ln, s);
                    draw_bitmap_text(
                        surface,
                        &self.font18,
                        ln,
                        px + (pw - lw) / 2,
                        ty,
                        Some(0x00FF_EEB8),
                        s,
                    );
                    ty += 22 * s;
                }
            }
            1 => {
                // ROMULAN STAR EMPIRE BIRD-OF-PREY CONSOLE (#3000)
                if let Some(anim) = &self.romulan_anim {
                    let rs = if w >= 1040 && h >= 720 { 2 } else { 1 };
                    let frame_w = 477 * rs;
                    let frame_h = 317 * rs;
                    if frame_w <= w && frame_h <= h {
                        let ox = (w - frame_w) / 2;
                        let oy = (h - frame_h) / 2;
                        anim.draw_frame(surface, 0, ox, oy, rs, false, false);

                        // Blinking Romulan glyph indicator (#3032)
                        if !self.anim_icons.frames.is_empty() {
                            let gi = (self.tick / 5) % self.anim_icons.frames.len();
                            self.anim_icons.frames[gi].blit_scaled(
                                surface,
                                ox + 20 * rs,
                                oy + 20 * rs,
                                rs,
                            );
                        }

                        // Message text inside lower emerald Romulan readout
                        let mut ty = oy + 216 * rs;
                        let max_w = 340 * rs;
                        let lines = wrap_bitmap_text(&self.font14, msg, max_w, rs);
                        for ln in lines.iter().take(4) {
                            let lw = measure_bitmap_text(&self.font14, ln, rs);
                            draw_bitmap_text(
                                surface,
                                &self.font14,
                                ln,
                                ox + (frame_w - lw) / 2,
                                ty,
                                Some(0x0060_FF98),
                                rs,
                            );
                            ty += 16 * rs;
                        }
                        return;
                    }
                }
                // Compact Romulan fallback for 320x240 tiles
                let bx = 12;
                let by = 12;
                let bw = w - 24;
                let bh = h - 24;
                fill_rect_px(surface, bx, by, bx + bw, by + bh, 0x0004_1C12);
                draw_rect_outline_px(surface, bx, by, bx + bw, by + bh, 0x0034_E880, 2);
                draw_bitmap_text(
                    surface,
                    &self.font14,
                    "ROMULAN SUBSPACE CHANNEL",
                    bx + 12,
                    by + 12,
                    Some(0x0044_FF88),
                    1,
                );
                let mut ty = by + 40;
                for ln in wrap_bitmap_text(&self.font14, msg, (bw - 24).max(80), 1) {
                    draw_bitmap_text(surface, &self.font14, &ln, bx + 12, ty, Some(0x00B8_FFD0), 1);
                    ty += 16;
                }
            }
            _ => {
                // STARFLEET SUBSPACE LCARS CONSOLE (#5000)
                let pw = (w - 36).clamp(260, 560 * s);
                let ph = (h - 40).clamp(190, 360 * s);
                let px = (w - pw) / 2;
                let py = (h - ph) / 2;

                // LCARS cyan/amber subspace border
                fill_rect_px(surface, px, py, px + pw, py + 24 * s, 0x0068_9CFF);
                fill_rect_px(surface, px, py + ph - 18 * s, px + pw, py + ph, 0x00F4_A038);
                fill_rect_px(surface, px, py, px + 14 * s, py + ph, 0x00B8_7CF4);

                // Blinking Starfleet comm badge (#5000[0] or [1])
                let mut ty = py + 34 * s;
                if let Some(badge) = self.subspace_bank.frames.get((self.tick / 8) % 2) {
                    if badge.h * s < ph / 2 {
                        badge.blit_scaled(surface, px + 26 * s, ty, s);
                    }
                }
                let hdr = "INCOMING SUBSPACE TRANSMISSION";
                draw_bitmap_text(
                    surface,
                    &self.font14,
                    hdr,
                    px + 24 * s,
                    py + 5 * s,
                    Some(0x0000_0000),
                    s,
                );

                let text_x = px + (if pw >= 440 { 126 * s } else { 26 * s });
                let max_w = (px + pw - text_x - 16 * s).max(110);
                ty += 12 * s;
                let lines = wrap_bitmap_text(&self.font18, msg, max_w, s);
                for ln in &lines {
                    if ty + 20 * s > py + ph - 24 * s {
                        break;
                    }
                    draw_bitmap_text(surface, &self.font18, ln, text_x, ty, Some(0x00FF_CC58), s);
                    ty += 22 * s;
                }

                // Animated subspace frequency waveform bars along bottom
                let wave_y = py + ph - 48 * s;
                for i in 0..16 {
                    let bh = (((self.tick as f32 * 0.25 + i as f32 * 0.7).sin().abs()) * 20.0 * s as f32)
                        as i32;
                    let bx = px + 28 * s + i * 14 * s;
                    if bx + 8 * s < px + pw - 12 {
                        fill_rect_px(
                            surface,
                            bx,
                            wave_y - bh,
                            bx + 8 * s,
                            wave_y,
                            0x0048_D8FF,
                        );
                    }
                }
            }
        }
    }
}

impl Default for StarfleetMessagesModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for StarfleetMessagesModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();
        let dur_raw = ctx.module.raw_control_value[0].clamp(0, 100);
        self.duration_ticks = if dur_raw < 25 {
            65
        } else if dur_raw < 75 {
            110
        } else {
            180
        };
        self.style_setting = ctx.module.raw_control_value[1].clamp(0, 3);
        self.msg_setting = ctx.module.raw_control_value[2].clamp(0, 9);

        self.active_style = if self.style_setting == 3 {
            ctx.rng.rand_mod(3)
        } else {
            self.style_setting
        };
        let n = self.messages.len().max(1);
        self.active_msg = if self.msg_setting == 0 {
            ctx.rng.rand_mod(n as i32) as usize
        } else {
            ((self.msg_setting - 1) as usize) % n
        };
        self.ticks_shown = 0;
        self.tick = 0;

        let snd = if self.active_style == 1 {
            SND_ROMULAN_BEEP1
        } else {
            SND_HAILING
        };
        tng_pack().play_voice(ctx.sound, ctx.system.sound_enabled, snd);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.render_message(ctx.surface);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.tick = self.tick.wrapping_add(1);
        self.ticks_shown += 1;

        if self.ticks_shown >= self.duration_ticks {
            self.ticks_shown = 0;
            if self.style_setting == 3 {
                self.active_style = (self.active_style + 1) % 3;
            }
            if self.msg_setting == 0 && !self.messages.is_empty() {
                self.active_msg = (self.active_msg + 1) % self.messages.len();
            }
            let snd = match self.active_style {
                1 => SND_ROMULAN_BEEP2,
                2 => SND_VIEWSCREEN,
                _ => SND_HAILING,
            };
            tng_pack().play_voice(ctx.sound, ctx.system.sound_enabled, snd);
        }

        self.render_message(ctx.surface);
        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        AdResult::NoError
    }
}
