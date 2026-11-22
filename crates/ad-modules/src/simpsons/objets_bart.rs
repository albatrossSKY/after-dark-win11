//! *Objets B'art* — 1994 *The Simpsons* After Dark 3.0 Module.
//!
//! Armed with a spray-paint can, Bart runs across your desktop decorating it
//! with 45 authentic graffiti artworks (`RLEP #10100`, `OFst/OFtb #10000`)
//! until Principal Skinner catches him yelling "Simpson!" and cleans the screen!

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult, MsvcRand};

use super::{
    CompoundAnim, MOD_OBJETS_BART, RlepBank, SND_BART_DOIT, SND_BART_LAGH, SND_BART_SCRM,
    SND_BART_UHOH, SND_SHAKE_CAN, SND_SKINNER_ISAW, SND_SKINNER_SMSN, SND_SKINNER_YTHR, SND_SPRAY,
    SimpsonsPack,
};

#[derive(Clone, Copy, PartialEq, Eq)]
enum BartState {
    RunningToSpot,
    ShakingCan,
    Spraying,
    SkinnerBust,
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
    windows_bank: RlepBank,
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
    graffiti_count: usize,
    total_ticks: usize,
    tick: usize,
    scale: i32,
}

impl ObjetsBartModule {
    pub fn new() -> Self {
        Self {
            anim: None,
            graffiti: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            windows_bank: RlepBank {
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
            graffiti_count: 0,
            total_ticks: 0,
            tick: 0,
            scale: 1,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "simpsons_objets_bart".to_string(),
            name: "Objets B'art".to_string(),
            credit: "By Jarir Maani and Jeff Thomas.\nSoftware © 1994 Berkeley Systems, Inc.\nThe Simpsons ™ & © Twentieth Century Fox.".to_string(),
            about: "Armed only with a can of spray paint and his vivid imagination, Bart decorates your desktop with 45 bold, yet tasteful designs — until Principal Skinner shows up!".to_string(),
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
        if self.clear_screen || self.saved_bg.len() != self.canvas_buf.len() {
            // Classic gray Mac/brick school wall backdrop with optional fake Mac windows (#10042)
            for y in 0..h {
                let row = (y * w) as usize;
                for x in 0..w {
                    let dot = if ((x ^ y) & 1) == 0 { 0x008A_8E96 } else { 0x007C_8088 };
                    self.canvas_buf[row + x as usize] = dot;
                }
            }
            // Stamp 1–2 authentic Mac window props (#10042) for Bart to vandalize!
            if self.windows_bank.frames.len() >= 3 {
                let wx = (w / 6).max(12);
                let wy = (h / 6).max(12);
                self.windows_bank.frames[2].blit_into_buf(&mut self.canvas_buf, w, h, wx, wy, None);
                if w > 420 && self.windows_bank.frames.len() >= 5 {
                    self.windows_bank.frames[4].blit_into_buf(
                        &mut self.canvas_buf,
                        w,
                        h,
                        (w * 2) / 4,
                        (h / 3).max(20),
                        None,
                    );
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
        let mx = (54 * self.scale).min(w / 4);
        let my = (72 * self.scale).min(h / 4);
        self.target_x = (mx + rng.rand_mod((w - mx * 2).max(20))) as f32;
        self.target_y = (my + rng.rand_mod((h - my * 2).max(20))) as f32;
        self.facing_left = self.target_x < self.bart_x;
        self.cur_color = self.pick_color(rng);
        if !self.graffiti.frames.is_empty() {
            self.cur_art_idx = rng.rand_mod(self.graffiti.frames.len() as i32) as usize;
        }
    }

    fn spray_partial_graffiti(&mut self, w: i32, h: i32, progress: f32) {
        let Some(sp) = self.graffiti.frames.get(self.cur_art_idx) else {
            return;
        };
        let scale = self.scale;
        let gx = self.bart_x as i32 + if self.facing_left { -sp.w * scale - 6 } else { 14 * scale };
        let gy = self.bart_y as i32 - (56 * scale);
        let max_sx = ((sp.w as f32) * progress.clamp(0.0, 1.0)).ceil() as i32;
        let col = self.cur_color & 0x00FF_FFFF;

        for sy in 0..sp.h {
            let srow = (sy * sp.w) as usize;
            for sx in 0..max_sx.min(sp.w) {
                if sp.pixels[srow + sx as usize] == 0 {
                    continue;
                }
                let px0 = gx + sx * scale;
                let py0 = gy + sy * scale;
                for oy in 0..scale {
                    let py = py0 + oy;
                    if py < 0 || py >= h {
                        continue;
                    }
                    for ox in 0..scale {
                        let px = px0 + ox;
                        if px >= 0 && px < w {
                            self.canvas_buf[(py * w + px) as usize] = col;
                        }
                    }
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
            self.windows_bank = RlepBank::load(MOD_OBJETS_BART, 10042);
        }
        self.saved_bg = ctx.surface.pixels().to_vec();
        self.paint_choice = ctx.module.raw_control_value[0].clamp(0, 5);
        let redraw_raw = ctx.module.raw_control_value[1].clamp(0, 100);
        self.redraw_interval_ticks = (400 + redraw_raw * 14) as usize;
        self.clear_screen = ctx.module.raw_control_value[2] != 0;
        self.scale = if ctx.surface.width >= 1000 { 2 } else { 1 };
        self.tick = 0;

        let w = ctx.surface.width;
        let h = ctx.surface.height;
        self.reset_canvas(w, h, ctx.rng);

        self.bart_x = (w / 3) as f32;
        self.bart_y = (h / 2) as f32;
        self.pick_next_spot(w, h, ctx.rng);
        self.state = BartState::RunningToSpot;
        self.state_ticks = 0;

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
        let pack = SimpsonsPack::global();

        let bart_frame: usize;
        let mut draw_skinner = false;
        let mut skinner_frame: usize = 140;

        match self.state {
            BartState::RunningToSpot => {
                let dx = self.target_x - self.bart_x;
                let dy = self.target_y - self.bart_y;
                let dist = (dx * dx + dy * dy).sqrt();
                let spd = 7.5 * self.scale as f32;
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
                // Running Bart frames (60..88)
                bart_frame = 60 + ((self.tick / 2) % 26);
            }
            BartState::ShakingCan => {
                bart_frame = (self.tick / 2) % 24;
                if self.state_ticks >= 14 {
                    self.state = BartState::Spraying;
                    self.state_ticks = 0;
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_SPRAY);
                }
            }
            BartState::Spraying => {
                bart_frame = 24 + ((self.tick / 2) % 30);
                let prog = self.state_ticks as f32 / 24.0;
                self.spray_partial_graffiti(w, h, prog);
                if self.state_ticks >= 24 {
                    self.graffiti_count += 1;
                    self.state_ticks = 0;
                    if self.graffiti_count >= 12 || self.total_ticks >= self.redraw_interval_ticks {
                        // Principal Skinner catches Bart!
                        self.state = BartState::SkinnerBust;
                        self.skinner_x = -40.0;
                        let sk_snd = match ctx.rng.rand_mod(3) {
                            0 => SND_SKINNER_SMSN,
                            1 => SND_SKINNER_ISAW,
                            _ => SND_SKINNER_YTHR,
                        };
                        pack.play_voice(ctx.sound, ctx.system.sound_enabled, sk_snd);
                    } else {
                        self.state = BartState::RunningToSpot;
                        self.pick_next_spot(w, h, ctx.rng);
                        if ctx.rng.rand_mod(4) == 0 {
                            let s = if ctx.rng.rand_mod(2) == 0 {
                                SND_BART_LAGH
                            } else {
                                SND_BART_DOIT
                            };
                            pack.play_voice(ctx.sound, ctx.system.sound_enabled, s);
                        }
                    }
                }
            }
            BartState::SkinnerBust => {
                draw_skinner = true;
                self.skinner_x += 7.0 * self.scale as f32;
                skinner_frame = 138 + ((self.tick / 2) % 24);
                // Bart panics and sprints off to the right!
                self.facing_left = false;
                if self.state_ticks == 10 {
                    let s = if ctx.rng.rand_mod(2) == 0 {
                        SND_BART_UHOH
                    } else {
                        SND_BART_SCRM
                    };
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, s);
                }
                if self.state_ticks >= 10 {
                    self.bart_x += 12.0 * self.scale as f32;
                }
                bart_frame = 108 + ((self.tick / 2) % 24);
                if self.skinner_x > (w + 60) as f32 {
                    self.reset_canvas(w, h, ctx.rng);
                    self.bart_x = 40.0;
                    self.bart_y = (h / 2) as f32;
                    self.pick_next_spot(w, h, ctx.rng);
                    self.state = BartState::RunningToSpot;
                    self.state_ticks = 0;
                }
            }
        }

        if self.canvas_buf.len() == ctx.surface.pixels().len() {
            ctx.surface.pixels_mut().copy_from_slice(&self.canvas_buf);
        }

        if let Some(anim) = &self.anim {
            let max_i = anim.frames.len().saturating_sub(1);
            anim.draw_anchored_bottom(
                ctx.surface,
                bart_frame.min(max_i),
                self.bart_x as i32,
                self.bart_y as i32,
                self.scale,
                self.facing_left,
            );
            if draw_skinner {
                anim.draw_anchored_bottom(
                    ctx.surface,
                    skinner_frame.min(max_i),
                    self.skinner_x as i32,
                    self.bart_y as i32,
                    self.scale,
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
