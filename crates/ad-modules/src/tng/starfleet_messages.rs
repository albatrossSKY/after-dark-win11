//! *Starfleet Messages* — 1994 *Star Trek: The Next Generation* After Dark 3.0 Module.
//!
//! Full-widescreen responsive Starfleet away messages across authentic **Gold
//! Dedication Plaque** (`RLEP #4001` emblem + `#4024` serif font), **Romulan
//! Star Empire Bird-of-Prey** (`OFst #3000` + `#3032` animated glyphs), and
//! **Subspace LCARS** (`RLEP #5000` comm badge + high-DPI native LCARS fonts)
//! consoles with all 9 authentic TNG messages (`STR# #2000`) and bridge audio.

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::simpsons::{
    CompoundAnim, KIND_STR_LIST, RlepBank, draw_bitmap_text, draw_rect_outline_px, fill_circle_px,
    fill_rect_px, measure_bitmap_text, parse_str_list, wrap_bitmap_text,
};
use super::{
    LCARS_AMBER, LCARS_GOLD, LCARS_LAVENDER, LCARS_PEACH, LCARS_SKY, LcarsFontSet,
    MOD_STARFLEET_MSG, SND_HAILING, SND_ROMULAN_BEEP1, SND_ROMULAN_BEEP2, SND_VIEWSCREEN,
    draw_lcars_elbow_bl, draw_lcars_elbow_tl, fill_rounded_rect, lcars_upper, load_anim,
    load_rlep, stage_fit, tng_pack,
};

pub struct StarfleetMessagesModule {
    romulan_anim: Option<CompoundAnim>,
    plaque_bank: RlepBank,
    plaque_font: RlepBank,
    subspace_bank: RlepBank,
    anim_icons: RlepBank,
    fonts: LcarsFontSet,
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
        let empty = || RlepBank {
            frames: Vec::new(),
            palette: Vec::new(),
        };
        Self {
            romulan_anim: None,
            plaque_bank: empty(),
            plaque_font: empty(),
            subspace_bank: empty(),
            anim_icons: empty(),
            fonts: LcarsFontSet::empty(),
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
        self.plaque_font = load_rlep(MOD_STARFLEET_MSG, 4024);
        self.subspace_bank = load_rlep(MOD_STARFLEET_MSG, 5000);
        self.fonts.ensure_loaded();

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
        let msg_upper = lcars_upper(msg_raw);
        let msg = msg_upper.as_str();

        let pad = (h / 28).clamp(10, 36);
        let msg_px = (h / 16).clamp(18, 48);
        let hdr_px = (h / 24).clamp(14, 30);
        let small_px = (h / 34).clamp(14, 20);
        let (f_msg, s_msg, lh_msg) = self.fonts.pick(msg_px);
        let (f_hdr, s_hdr, lh_hdr) = self.fonts.pick(hdr_px);
        let (f_small, s_small, lh_small) = self.fonts.pick(small_px);

        match self.active_style {
            0 => {
                // FULL-WIDESCREEN STARFLEET GOLD DEDICATION PLAQUE
                let px = pad;
                let py = pad;
                let pw = w - pad * 2;
                let ph = h - pad * 2;
                let rim = (h / 45).clamp(8, 22);

                // Brushed brass/gold outer bezel + deep bronze-ebony inner plate + corner bolts
                fill_rect_px(surface, px, py, px + pw, py + ph, 0x007E_5C22);
                fill_rect_px(surface, px + rim, py + rim, px + pw - rim, py + ph - rim, 0x001A_130A);
                draw_rect_outline_px(surface, px, py, px + pw, py + ph, 0x00F6_CE60, 3);
                draw_rect_outline_px(surface, px + rim, py + rim, px + pw - rim, py + ph - rim, 0x00C8_9634, 2);

                let bolt_r = (rim / 2).clamp(3, 8);
                let bo = rim * 2;
                for (bx, by) in [
                    (px + bo, py + bo),
                    (px + pw - bo, py + bo),
                    (px + bo, py + ph - bo),
                    (px + pw - bo, py + ph - bo),
                ] {
                    fill_circle_px(surface, bx, by, bolt_r, 0x00E8_BC4C);
                    fill_circle_px(surface, bx - 1, by - 1, (bolt_r / 2).max(1), 0x00FF_EE98);
                }

                // Scaled Starfleet Command Emblem (#4001[0])
                let mut ty = py + rim + (ph / 12);
                if let Some(emblem) = self.plaque_bank.frames.first() {
                    let target_eh = (ph as f32 * 0.28).clamp(56.0, 210.0);
                    let esf = target_eh / emblem.h.max(1) as f32;
                    let ew = (emblem.w as f32 * esf).round() as i32;
                    let eh = (emblem.h as f32 * esf).round() as i32;
                    emblem.blit_rect(
                        surface,
                        px + (pw - ew) / 2,
                        ty,
                        ew,
                        eh,
                        false,
                        false,
                        true,
                        true,
                    );
                    ty += eh + (ph / 24).max(12);
                }

                let hdr = "U.S.S. ENTERPRISE   NCC-1701-D";
                let hw = measure_bitmap_text(f_hdr, hdr, s_hdr);
                draw_bitmap_text(
                    surface,
                    f_hdr,
                    hdr,
                    px + (pw - hw) / 2,
                    ty,
                    Some(0x00F6_C858),
                    s_hdr,
                );
                ty += lh_hdr + (ph / 24).max(14);
                fill_rect_px(surface, px + pw / 5, ty - 6, px + (pw * 4) / 5, ty - 4, 0x00C8_9634);

                // Message rendered in authentic Gold Plaque Serif font (#4024) or high-DPI LCARS font
                let use_serif = !self.plaque_font.frames.is_empty() && h >= 440;
                let (pf, ps, plh) = if use_serif {
                    let sc = (h / 540).clamp(1, 3);
                    (&self.plaque_font, sc, 28 * sc)
                } else {
                    (f_msg, s_msg, lh_msg)
                };
                let lines = wrap_bitmap_text(pf, msg, (pw - rim * 6).max(160), ps);
                for ln in &lines {
                    if ty + plh > py + ph - rim * 2 {
                        break;
                    }
                    let lw = measure_bitmap_text(pf, ln, ps);
                    draw_bitmap_text(
                        surface,
                        pf,
                        ln,
                        px + (pw - lw) / 2,
                        ty,
                        Some(0x00FF_EEB8),
                        ps,
                    );
                    ty += plh + 4;
                }
            }
            1 => {
                // FULL-WIDESCREEN ROMULAN STAR EMPIRE BIRD-OF-PREY CONSOLE (#3000)
                let (sf, ox, oy) = stage_fit(w, h, 477.0, 317.0, pad / 2, pad / 2);
                let box_l = ox.round() as i32;
                let box_r = (ox + 477.0 * sf).round() as i32;

                // Emerald Romulan tactical side wings on widescreen displays
                for (wx0, wx1, right) in [(0, box_l, false), (box_r, w, true)] {
                    let ww = wx1 - wx0;
                    if ww >= 48 {
                        let wp = (ww / 10).clamp(6, 16);
                        let ix0 = wx0 + wp;
                        let ix1 = wx1 - wp;
                        fill_rect_px(surface, ix0, pad, ix1, pad + 10, 0x0020_C068);
                        fill_rect_px(surface, ix0, h - pad - 10, ix1, h - pad, 0x0020_C068);
                        let mut ry = pad + 26;
                        let mut r_idx = 0usize;
                        while ry + 18 < h - pad - 20 {
                            let frac = ((self.tick as f32 * 0.09 + r_idx as f32 * 0.7).sin() * 0.4 + 0.55)
                                .clamp(0.15, 0.95);
                            let bw = (((ix1 - ix0) as f32) * frac) as i32;
                            let bx0 = if right { ix1 - bw } else { ix0 };
                            fill_rect_px(surface, ix0, ry, ix1, ry + 10, 0x0008_2418);
                            fill_rect_px(surface, bx0, ry, bx0 + bw, ry + 10, 0x0034_E880);
                            ry += 22;
                            r_idx += 1;
                        }
                    }
                }

                if let Some(anim) = &self.romulan_anim {
                    anim.draw_frame_f(surface, 0, box_l, oy.round() as i32, sf, false, true, false);

                    // Blinking Romulan glyph indicator (#3032) scaled to match console
                    if !self.anim_icons.frames.is_empty() {
                        let gi = (self.tick / 5) % self.anim_icons.frames.len();
                        self.anim_icons.frames[gi].blit_transformed_f(
                            surface,
                            (ox + 20.0 * sf).round() as i32,
                            (oy + 20.0 * sf).round() as i32,
                            sf,
                            false,
                            false,
                            false,
                            false,
                        );
                    }

                    // Crisp high-DPI emerald Romulan message cleanly inside lower readout
                    let rom_px = (14.0 * sf).round() as i32;
                    let (f_rom, s_rom, lh_rom) = self.fonts.pick(rom_px.clamp(14, 34));
                    let mut ty = (oy + 216.0 * sf).round() as i32;
                    let max_w = (340.0 * sf).round() as i32;
                    let frame_w = (477.0 * sf).round() as i32;
                    for ln in wrap_bitmap_text(f_rom, msg, max_w.max(120), s_rom).iter().take(4) {
                        let lw = measure_bitmap_text(f_rom, ln, s_rom);
                        draw_bitmap_text(
                            surface,
                            f_rom,
                            ln,
                            box_l + (frame_w - lw) / 2,
                            ty,
                            Some(0x0060_FF98),
                            s_rom,
                        );
                        ty += lh_rom;
                    }
                }
            }
            _ => {
                // FULL-WIDESCREEN STARFLEET SUBSPACE LCARS CONSOLE
                let ox = pad;
                let oy = pad;
                let fw = w - pad * 2;
                let fh = h - pad * 2;
                let bar_w = (fw / 10).clamp(42, 130);
                let top_h = (lh_hdr + 12).clamp(26, 56);
                let bot_h = (h / 24).clamp(18, 38);
                let gap = (h / 100).clamp(4, 10);

                // Top & bottom curved LCARS elbows spanning full widescreen display!
                let split_y = (fh * 44) / 100;
                draw_lcars_elbow_tl(surface, ox, oy, bar_w, top_h, split_y, fw - top_h, LCARS_SKY);
                fill_rounded_rect(surface, ox + fw - top_h, oy, ox + fw, oy + top_h, top_h / 2, LCARS_LAVENDER);
                draw_lcars_elbow_bl(
                    surface,
                    ox,
                    oy + fh,
                    bar_w,
                    bot_h,
                    (fh - split_y - gap).max(bot_h + 36),
                    fw - bot_h,
                    LCARS_GOLD,
                );
                fill_rounded_rect(surface, ox + fw - bot_h, oy + fh - bot_h, ox + fw, oy + fh, bot_h / 2, LCARS_AMBER);

                // Header text cleanly in top sky-blue bar
                draw_bitmap_text(
                    surface,
                    f_hdr,
                    "INCOMING SUBSPACE TRANSMISSION  //  PRIORITY ONE",
                    ox + bar_w + pad,
                    oy + ((top_h - lh_hdr) / 2).max(2),
                    Some(0x0000_0000),
                    s_hdr,
                );

                // Left-bar glowing LCARS frequency code
                fill_rect_px(surface, ox, oy + top_h + gap * 2, ox + bar_w, oy + split_y - gap, LCARS_LAVENDER);

                let vx = ox + bar_w + pad * 2;
                let vy = oy + top_h + pad * 2;
                let vw = (ox + fw - vx - pad).max(160);
                let vh = (oy + fh - bot_h - vy - pad).max(120);

                // Blinking Starfleet Comm Badge (#5000[0] / [1]) smoothly scaled proportionally!
                let mut text_x = vx;
                if let Some(badge) = self.subspace_bank.frames.get((self.tick / 8) % 2) {
                    let target_bh = (vh as f32 * 0.46).clamp(64.0, 240.0);
                    let bsf = (target_bh / badge.h.max(1) as f32)
                        .min((vw as f32 * 0.25) / badge.w.max(1) as f32);
                    let bw = (badge.w as f32 * bsf).round() as i32;
                    let bh = (badge.h as f32 * bsf).round() as i32;
                    badge.blit_rect(surface, vx, vy, bw, bh, false, false, true, true);
                    text_x = vx + bw + pad * 2;
                }

                // Crisp high-DPI Subspace Message
                let max_w = (vx + vw - text_x).max(140);
                let mut ty = vy + pad / 2;
                let lines = wrap_bitmap_text(f_msg, msg, max_w, s_msg);
                let wave_h = (vh / 4).clamp(36, 110);
                for ln in &lines {
                    if ty + lh_msg > vy + vh - wave_h - pad {
                        break;
                    }
                    draw_bitmap_text(surface, f_msg, ln, text_x, ty, Some(LCARS_AMBER), s_msg);
                    ty += lh_msg + 4;
                }

                // Full-width live subspace frequency waveform analyzer across entire bottom console!
                let wave_base = oy + fh - bot_h - pad;
                let n_bars = (vw / 24).clamp(16, 48);
                let bar_pitch = vw / n_bars.max(1);
                let bar_w_px = (bar_pitch * 65 / 100).max(5);
                for i in 0..n_bars {
                    let amp = ((self.tick as f32 * 0.22 + i as f32 * 0.55).sin().abs() * 0.65
                        + (self.tick as f32 * 0.11 - i as f32 * 0.31).cos().abs() * 0.35)
                        .clamp(0.12, 1.0);
                    let bh = ((wave_h as f32) * amp) as i32;
                    let bx = vx + i * bar_pitch;
                    let col = if amp > 0.82 {
                        LCARS_PEACH
                    } else if i % 4 == 0 {
                        LCARS_LAVENDER
                    } else {
                        LCARS_SKY
                    };
                    fill_rect_px(surface, bx, wave_base - bh, bx + bar_w_px, wave_base, col);
                }

                // Bottom bar stardate / channel readout
                let footer = format!(
                    "SUBSPACE CHANNEL 47.{:03} GHZ  //  U.S.S. ENTERPRISE NCC-1701-D",
                    (self.tick * 7) % 999
                );
                draw_bitmap_text(
                    surface,
                    f_small,
                    &footer,
                    vx,
                    oy + fh - bot_h + ((bot_h - lh_small) / 2).max(1),
                    Some(0x0000_0000),
                    s_small,
                );
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
