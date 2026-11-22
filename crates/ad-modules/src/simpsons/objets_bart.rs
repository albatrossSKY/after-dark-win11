//! *Objets B'art* — 1994 *The Simpsons* After Dark 3.0 Module.
//!
//! Armed with a spray-paint can, Bart runs across your desktop decorating it
//! with 45 authentic graffiti artworks (`RLEP #10100`, `OFst/OFtb #10000`) —
//! with authentic Milhouse & Nelson Muntz ("HA-HA!") cameos — until Principal
//! Skinner catches him yelling "Simpson!" and cleans the screen!

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult, MsvcRand};

use super::{
    CompoundAnim, MOD_OBJETS_BART, RlepBank, SND_BART_DOIT, SND_BART_LAGH, SND_BART_SCRM,
    SND_BART_UHOH, SND_NELSON_HAHA, SND_SHAKE_CAN, SND_SKINNER_ISAW, SND_SKINNER_SMSN,
    SND_SKINNER_YTHR, SND_SPRAY, SimpsonsPack,
};

#[derive(Clone, Copy, PartialEq, Eq)]
enum BartState {
    RunningToSpot,
    ShakingCan,
    Spraying,
    Admiring,
    SkinnerBust,
}

#[derive(Clone, Copy, PartialEq, Eq)]
enum CameoKind {
    None,
    Milhouse,
    Nelson,
}

const PAINT_PALETTE: [u32; 5] = [
    0x00F2_2828, // Red
    0x0034_E63C, // Green
    0x0028_88FF, // Blue
    0x00C8_42FF, // Purple
    0x00FF_8C18, // Orange
];

pub struct ObjetsBartModule {
    anim: Option<CompoundAnim>,
    graffiti: RlepBank,
    saved_bg: Vec<u32>,
    canvas_buf: Vec<u32>,
    clear_screen: bool,
    paint_choice: i32,
    redraw_interval_ticks: usize,
    bart_x: f32,
    bart_y: f32,
    target_x: f32,
    target_y: f32,
    facing_left: bool,
    cur_color: u32,
    cur_art_idx: usize,
    state: BartState,
    state_ticks: usize,
    skinner_x: f32,
    // Authentic Milhouse / Nelson cameo actor!
    cameo_kind: CameoKind,
    cameo_x: f32,
    cameo_y: f32,
    cameo_stop_x: f32,
    cameo_phase: u8, // 0=walking in, 1=reacting/laughing, 2=leaving/fleeing
    cameo_ticks: usize,
    graffiti_count: usize,
    total_ticks: usize,
    tick: usize,
    scale_f: f32,
}

impl ObjetsBartModule {
    pub fn new() -> Self {
        Self {
            anim: None,
            graffiti: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            saved_bg: Vec::new(),
            canvas_buf: Vec::new(),
            clear_screen: false,
            paint_choice: 0,
            redraw_interval_ticks: 900,
            bart_x: 100.0,
            bart_y: 160.0,
            target_x: 240.0,
            target_y: 180.0,
            facing_left: false,
            cur_color: PAINT_PALETTE[0],
            cur_art_idx: 0,
            state: BartState::RunningToSpot,
            state_ticks: 0,
            skinner_x: -60.0,
            cameo_kind: CameoKind::None,
            cameo_x: -60.0,
            cameo_y: 200.0,
            cameo_stop_x: 220.0,
            cameo_phase: 0,
            cameo_ticks: 0,
            graffiti_count: 0,
            total_ticks: 0,
            tick: 0,
            scale_f: 1.4,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "simpsons_objets_bart".to_string(),
            name: "Objets B'art".to_string(),
            credit: "By Jarir Maani and Jeff Thomas.\nSoftware © 1994 Berkeley Systems, Inc.\nThe Simpsons ™ & © Twentieth Century Fox.".to_string(),
            about: "Armed only with a can of spray paint and his vivid imagination, Bart decorates your desktop with 45 bold, yet tasteful designs — with cameos by Milhouse, Nelson, and Principal Skinner!".to_string(),
            controls: [
                AdControl::Menu {
                    title: "Paint:".to_string(),
                    default_index: 0,
                    choices: vec![
                        "Random".into(),
                        "Red".into(),
                        "Green".into(),
                        "Blue".into(),
                        "Purple".into(),
                        "Orange".into(),
                    ],
                },
                AdControl::LabeledSlider {
                    title: "Redraw Every:".to_string(),
                    default_raw: 70,
                    labels: vec![
                        "5 min.".into(),
                        "10 min.".into(),
                        "15 min.".into(),
                        "20 min.".into(),
                        "30 min.".into(),
                    ],
                    thresholds: vec![0, 20, 40, 60, 80],
                },
                AdControl::Checkbox {
                    title: "Clear Screen First".to_string(),
                    default_checked: false,
                },
                AdControl::None,
            ],
            target_frame_ms: 58,
            filename: "OBJBART.AD".to_string(),
        }
    }

    fn reset_canvas(&mut self, w: i32, h: i32, rng: &mut MsvcRand) {
        self.canvas_buf.resize((w * h) as usize, 0);
        let has_desktop = !self.clear_screen
            && self.saved_bg.len() == self.canvas_buf.len()
            && self.saved_bg.iter().step_by(97).any(|&p| (p & 0x00FF_FFFF) != 0);
        if !has_desktop {
            let brick_w = (46.0 * self.scale_f).round().max(26.0) as i32;
            let brick_h = (22.0 * self.scale_f).round().max(12.0) as i32;
            let mortar = (2.0 * self.scale_f).round().max(1.0) as i32;
            for y in 0..h {
                let row = (y * w) as usize;
                let by = y / brick_h;
                let in_y = y % brick_h;
                let stagger = if (by & 1) == 0 { 0 } else { brick_w / 2 };
                for x in 0..w {
                    let in_x = (x + stagger) % brick_w;
                    let col = if in_y < mortar || in_x < mortar {
                        0x00B8_A994
                    } else {
                        let bx = (x + stagger) / brick_w;
                        let v = (((bx * 17 ^ by * 31) & 15) as i32) - 8;
                        let r = (204 + v).clamp(160, 232) as u32;
                        let g = (176 + v).clamp(135, 206) as u32;
                        let b = (138 + v).clamp(100, 170) as u32;
                        (r << 16) | (g << 8) | b
                    };
                    self.canvas_buf[row + x as usize] = col;
                }
            }
        } else {
            self.canvas_buf.copy_from_slice(&self.saved_bg);
        }
        self.graffiti_count = 0;
        self.total_ticks = 0;
        let _ = rng;
    }

    fn pick_color(&self, rng: &mut MsvcRand) -> u32 {
        match self.paint_choice {
            1..=5 => PAINT_PALETTE[(self.paint_choice - 1) as usize],
            _ => PAINT_PALETTE[rng.rand_mod(PAINT_PALETTE.len() as i32) as usize],
        }
    }

    fn pick_next_spot(&mut self, w: i32, h: i32, rng: &mut MsvcRand) {
        let mx = ((60.0 * self.scale_f) as i32).min(w / 4);
        let my = ((80.0 * self.scale_f) as i32).min(h / 4);
        self.target_x = (mx + rng.rand_mod((w - mx * 2).max(20))) as f32;
        self.target_y = (my + rng.rand_mod((h - my * 2).max(20))) as f32;
        self.facing_left = self.target_x < self.bart_x;
        self.cur_color = self.pick_color(rng);
        if !self.graffiti.frames.is_empty() {
            self.cur_art_idx = rng.rand_mod(self.graffiti.frames.len() as i32) as usize;
        }
    }

    fn spawn_cameo(&mut self, w: i32, h: i32, rng: &mut MsvcRand) {
        self.cameo_kind = if rng.rand_mod(2) == 0 {
            CameoKind::Nelson
        } else {
            CameoKind::Milhouse
        };
        self.cameo_x = w as f32 + 30.0 * self.scale_f;
        let my = ((80.0 * self.scale_f) as i32).min(h / 3);
        self.cameo_y = (my + rng.rand_mod((h - my - (30.0 * self.scale_f) as i32).max(20))) as f32;
        self.cameo_stop_x =
            ((80.0 * self.scale_f) as i32 + rng.rand_mod((w - (160.0 * self.scale_f) as i32).max(40)))
                as f32;
        self.cameo_phase = 0;
        self.cameo_ticks = 0;
    }

    fn spray_partial_graffiti(&mut self, w: i32, h: i32, progress: f32) {
        let Some(sp) = self.graffiti.frames.get(self.cur_art_idx) else {
            return;
        };
        let sf = self.scale_f;
        let dst_w = (sp.w as f32 * sf).round().max(1.0) as i32;
        let dst_h = (sp.h as f32 * sf).round().max(1.0) as i32;
        let gx = self.bart_x as i32
            + if self.facing_left {
                -dst_w - (10.0 * sf) as i32
            } else {
                (14.0 * sf) as i32
            };
        let gy = self.bart_y as i32 - (58.0 * sf) as i32;
        let max_dx = ((dst_w as f32) * progress.clamp(0.0, 1.0)).ceil() as i32;
        let col = self.cur_color & 0x00FF_FFFF;
        let inv_x = sp.w as f32 / dst_w as f32;
        let inv_y = sp.h as f32 / dst_h as f32;

        let y0 = gy.max(0);
        let y1 = (gy + dst_h).min(h);
        let x0 = gx.max(0);
        let x1 = (gx + max_dx.min(dst_w)).min(w);
        for py in y0..y1 {
            let sy = ((((py - gy) as f32 + 0.5) * inv_y) as i32).clamp(0, sp.h - 1);
            let srow = (sy * sp.w) as usize;
            let drow = (py * w) as usize;
            for px in x0..x1 {
                let sx = ((((px - gx) as f32 + 0.5) * inv_x) as i32).clamp(0, sp.w - 1);
                if sp.pixels[srow + sx as usize] != 0 {
                    self.canvas_buf[drow + px as usize] = col;
                }
            }
        }
    }
}

impl Default for ObjetsBartModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for ObjetsBartModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        if self.anim.is_none() {
            self.anim = Some(CompoundAnim::load(MOD_OBJETS_BART, 10000));
            self.graffiti = RlepBank::load(MOD_OBJETS_BART, 10100);
        }
        self.saved_bg = ctx.surface.pixels().to_vec();
        self.paint_choice = ctx.module.raw_control_value[0].clamp(0, 5);
        let redraw_raw = ctx.module.raw_control_value[1].clamp(0, 100);
        self.redraw_interval_ticks = (400 + redraw_raw * 14) as usize;
        self.clear_screen = ctx.module.raw_control_value[2] != 0;
        self.scale_f = (ctx.surface.height as f32 / 460.0).clamp(1.0, 3.6);
        self.tick = 0;

        let w = ctx.surface.width;
        let h = ctx.surface.height;
        self.reset_canvas(w, h, ctx.rng);

        self.bart_x = (w / 3) as f32;
        self.bart_y = (h / 2) as f32;
        self.pick_next_spot(w, h, ctx.rng);
        self.state = BartState::RunningToSpot;
        self.state_ticks = 0;
        self.cameo_kind = CameoKind::None;

        SimpsonsPack::global().play_voice(ctx.sound, ctx.system.sound_enabled, SND_BART_LAGH);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        if self.canvas_buf.len() == ctx.surface.pixels().len() {
            ctx.surface.pixels_mut().copy_from_slice(&self.canvas_buf);
        }
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.tick = self.tick.wrapping_add(1);
        self.total_ticks += 1;
        self.state_ticks += 1;
        let w = ctx.surface.width;
        let h = ctx.surface.height;
        let sf = self.scale_f;
        let pack = SimpsonsPack::global();

        // NOTE: All characters in MOD 11 (Bart, Milhouse, Skinner, Nelson) face LEFT natively!
        // So `flip_x = !facing_left` makes them ALWAYS walk/face forward!
        let bart_frame: usize;
        let mut draw_skinner = false;
        let mut skinner_frame: usize = 146;

        match self.state {
            BartState::RunningToSpot => {
                let dx = self.target_x - self.bart_x;
                let dy = self.target_y - self.bart_y;
                let dist = (dx * dx + dy * dy).sqrt();
                let spd = 6.8 * sf;
                if dist <= spd + 2.0 {
                    self.bart_x = self.target_x;
                    self.bart_y = self.target_y;
                    self.state = BartState::ShakingCan;
                    self.state_ticks = 0;
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_SHAKE_CAN);
                } else {
                    self.bart_x += (dx / dist) * spd;
                    self.bart_y += (dy / dist) * spd;
                    self.facing_left = dx < 0.0;
                }
                // Authentic Bart walking/running cycle R08 (58..=63, 6 frames!)
                bart_frame = 58 + ((self.tick / 2) % 6);
            }
            BartState::ShakingCan => {
                // Authentic Bart shaking spray can R03 (3..=7, 5 frames!)
                bart_frame = 3 + ((self.tick / 2) % 5);
                if self.state_ticks >= 14 {
                    self.state = BartState::Spraying;
                    self.state_ticks = 0;
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_SPRAY);
                }
            }
            BartState::Spraying => {
                // Authentic Bart spraying graffiti R04..R06 (8..=53, 46 frames!)
                bart_frame = 8 + ((self.state_ticks * 2) % 46);
                let prog = self.state_ticks as f32 / 24.0;
                self.spray_partial_graffiti(w, h, prog);
                if self.state_ticks >= 24 {
                    self.graffiti_count += 1;
                    self.state_ticks = 0;
                    if self.graffiti_count >= 12 || self.total_ticks >= self.redraw_interval_ticks {
                        self.state = BartState::SkinnerBust;
                        self.skinner_x = -40.0 * sf;
                        let sk_snd = match ctx.rng.rand_mod(3) {
                            0 => SND_SKINNER_SMSN,
                            1 => SND_SKINNER_ISAW,
                            _ => SND_SKINNER_YTHR,
                        };
                        pack.play_voice(ctx.sound, ctx.system.sound_enabled, sk_snd);
                    } else if ctx.rng.rand_mod(3) == 0 {
                        self.state = BartState::Admiring;
                        let s = if ctx.rng.rand_mod(2) == 0 {
                            SND_BART_LAGH
                        } else {
                            SND_BART_DOIT
                        };
                        pack.play_voice(ctx.sound, ctx.system.sound_enabled, s);
                    } else {
                        self.state = BartState::RunningToSpot;
                        self.pick_next_spot(w, h, ctx.rng);
                        if self.cameo_kind == CameoKind::None && self.graffiti_count % 3 == 2 {
                            self.spawn_cameo(w, h, ctx.rng);
                        }
                    }
                }
            }
            BartState::Admiring => {
                // Authentic Bart shrugging/laughing R11 (76..=88, 13 frames!)
                bart_frame = 76 + (self.state_ticks / 2).min(12);
                if self.state_ticks >= 22 {
                    self.state = BartState::RunningToSpot;
                    self.state_ticks = 0;
                    self.pick_next_spot(w, h, ctx.rng);
                }
            }
            BartState::SkinnerBust => {
                draw_skinner = true;
                self.facing_left = false; // Bart flees RIGHT!
                if self.state_ticks < 10 {
                    // Bart startled R09 (65..=68) while Skinner marches in R25 (146..=151)
                    self.skinner_x += 6.5 * sf;
                    skinner_frame = 146 + ((self.tick / 2) % 6);
                    bart_frame = 65 + (self.state_ticks / 3).min(3);
                    if self.state_ticks == 8 {
                        let s = if ctx.rng.rand_mod(2) == 0 {
                            SND_BART_UHOH
                        } else {
                            SND_BART_SCRM
                        };
                        pack.play_voice(ctx.sound, ctx.system.sound_enabled, s);
                    }
                } else {
                    // Bart sprints away fast R10 (69..=74)! Skinner marches & glares (146..151 / 133..145)!
                    self.bart_x += 11.5 * sf;
                    bart_frame = 69 + ((self.tick / 2) % 6);
                    if self.state_ticks < 28 {
                        self.skinner_x += 6.5 * sf;
                        skinner_frame = 146 + ((self.tick / 2) % 6);
                    } else if self.state_ticks < 46 {
                        // Skinner stops & scolds angrily (R20..R24: 133..=145)
                        skinner_frame = 133 + (((self.state_ticks - 28) / 2) % 13);
                    } else {
                        self.skinner_x += 7.5 * sf;
                        skinner_frame = 146 + ((self.tick / 2) % 6);
                    }
                }
                if self.skinner_x > w as f32 + 60.0 * sf || self.state_ticks > 120 {
                    self.reset_canvas(w, h, ctx.rng);
                    self.bart_x = 40.0 * sf;
                    self.bart_y = (h / 2) as f32;
                    self.pick_next_spot(w, h, ctx.rng);
                    self.state = BartState::RunningToSpot;
                    self.state_ticks = 0;
                }
            }
        }

        // Update authentic Milhouse / Nelson cameo (facing LEFT natively!)
        let mut cameo_draw: Option<(usize, bool)> = None;
        if self.cameo_kind != CameoKind::None {
            self.cameo_ticks += 1;
            match self.cameo_kind {
                CameoKind::None => {}
                CameoKind::Nelson => match self.cameo_phase {
                    0 => {
                        // Nelson walking left R28 (155..=162)
                        self.cameo_x -= 4.2 * sf;
                        cameo_draw = Some((155 + ((self.tick / 2) % 8), false));
                        if self.cameo_x <= self.cameo_stop_x {
                            self.cameo_phase = 1;
                            self.cameo_ticks = 0;
                            pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_NELSON_HAHA);
                        }
                    }
                    1 => {
                        // Nelson pointing & laughing "HA-HA!" R30 (165..=167)
                        cameo_draw = Some((165 + ((self.cameo_ticks / 3) % 3), false));
                        if self.cameo_ticks >= 22 {
                            self.cameo_phase = 2;
                            self.cameo_ticks = 0;
                        }
                    }
                    _ => {
                        self.cameo_x -= 4.5 * sf;
                        cameo_draw = Some((155 + ((self.tick / 2) % 8), false));
                        if self.cameo_x < -48.0 * sf {
                            self.cameo_kind = CameoKind::None;
                        }
                    }
                },
                CameoKind::Milhouse => match self.cameo_phase {
                    0 => {
                        // Milhouse walking left R16 (105..=110)
                        self.cameo_x -= 4.2 * sf;
                        cameo_draw = Some((105 + ((self.tick / 2) % 6), false));
                        if self.cameo_x <= self.cameo_stop_x {
                            self.cameo_phase = 1;
                            self.cameo_ticks = 0;
                        }
                    }
                    1 => {
                        // Milhouse looking at graffiti R19 (120..=132), then startled R17 (112)
                        if self.cameo_ticks < 20 {
                            cameo_draw = Some((120 + ((self.cameo_ticks / 2) % 13), false));
                        } else {
                            cameo_draw = Some((112, false));
                        }
                        if self.cameo_ticks >= 26 {
                            self.cameo_phase = 2;
                            self.cameo_ticks = 0;
                        }
                    }
                    _ => {
                        // Milhouse running away fast left R18 (113..=118)
                        self.cameo_x -= 9.5 * sf;
                        cameo_draw = Some((113 + ((self.tick / 2) % 6), false));
                        if self.cameo_x < -48.0 * sf {
                            self.cameo_kind = CameoKind::None;
                        }
                    }
                },
            }
        }

        if self.canvas_buf.len() == ctx.surface.pixels().len() {
            ctx.surface.pixels_mut().copy_from_slice(&self.canvas_buf);
        }

        if let Some(anim) = &self.anim {
            let max_i = anim.frames.len().saturating_sub(1);
            if let Some((cf, cflip)) = cameo_draw {
                anim.draw_anchored_bottom_f(
                    ctx.surface,
                    cf.min(max_i),
                    self.cameo_x as i32,
                    self.cameo_y as i32,
                    sf,
                    cflip,
                    false,
                    false,
                );
            }
            anim.draw_anchored_bottom_f(
                ctx.surface,
                bart_frame.min(max_i),
                self.bart_x as i32,
                self.bart_y as i32,
                sf,
                !self.facing_left, // Native left -> flip_x when facing RIGHT!
                false,
                false,
            );
            if draw_skinner {
                anim.draw_anchored_bottom_f(
                    ctx.surface,
                    skinner_frame.min(max_i),
                    self.skinner_x as i32,
                    self.bart_y as i32,
                    sf,
                    true, // Skinner enters from LEFT marching RIGHT!
                    false,
                    false,
                );
            }
        }

        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        self.canvas_buf.clear();
        self.saved_bg.clear();
        AdResult::NoError
    }
}
