//! *Homer Eats* — 1994 *The Simpsons* After Dark 3.0 Module.
//!
//! Your desktop transforms into a giant Candy Bar, Pizza, Crispies, Waffle,
//! Ice Cream, or stays as your real Windows desktop while Homer walks around
//! taking massive jagged bites out of the screen (`OFst/OFtb #1000`, `RLEP #1001/#1002/#1010`),
//! with authentic Marge Simpson cameos (squirting chocolate syrup, sprinkling sugar,
//! and slicing the wall with a frosting knife!), Homer donut breaks, choking/burping,
//! and classic Springfield voice clips!

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult, MsvcRand};

use super::{
    CompoundAnim, MOD_HOMER_EATS, RlepBank, SND_EXHALE, SND_HOMER_AWW, SND_HOMER_CHOK,
    SND_HOMER_DOH, SND_HOMER_EAT1, SND_HOMER_EAT2, SND_HOMER_EAT3, SND_HOMER_EAT4, SND_INHALE,
    SimpsonsPack,
};

/// Authentic Homer wall-chomping runs (OFst #1000 R01..R08).
const CHOMP_RUNS_ALL: &[(usize, usize)] = &[
    (9, 16),  // R01
    (17, 24), // R02
    (25, 32), // R03 (deep bend)
    (33, 40), // R04
    (41, 50), // R05 (deep bend)
    (51, 60), // R06 (deep bend)
    (61, 68), // R07
    (69, 76), // R08
];
const CHOMP_RUNS_MODEST: &[(usize, usize)] = &[
    (9, 16),  // R01
    (17, 24), // R02
    (33, 40), // R04
    (61, 68), // R07
];

#[derive(Clone, Copy, PartialEq, Eq)]
enum HomerState {
    Walking,
    Chomping,
    EatingGoodie,
    ChokingOrBelly,
}

#[derive(Clone, Copy, PartialEq, Eq)]
enum MargeAction {
    Syrup,    // R15 walk -> R18..20 squeeze -> stamps R21..23 puddle
    Sprinkle, // R17 walk -> R24..25 shake sugar
    Knife,    // R16 walk -> R26..27 slice screen
}

#[derive(Clone, Copy, PartialEq, Eq)]
enum MargeState {
    Inactive,
    WalkingIn,
    Acting,
    Sighing,
    WalkingOut,
}

pub struct HomerEatsModule {
    anim: Option<CompoundAnim>,
    food_bank: RlepBank,
    goodies_bank: RlepBank,
    bites_bank: RlepBank,
    saved_bg: Vec<u32>,
    canvas_buf: Vec<u32>,
    homer_x: f32,
    homer_y: f32,
    target_x: f32,
    target_y: f32,
    facing_left: bool,
    state: HomerState,
    state_ticks: usize,
    chomp_run: (usize, usize),
    goodie_alt: bool,
    choke_alt: bool,
    bites_taken: usize,
    // Authentic Marge cameo state (OFst R14..R29)
    marge_state: MargeState,
    marge_action: MargeAction,
    marge_x: f32,
    marge_y: f32,
    marge_target_x: f32,
    marge_ticks: usize,
    food_kind: i32,
    start_choice: i32,
    goodie_freq: i32,
    butt_cleavage: bool,
    tick: usize,
    scale_f: f32,
}

impl HomerEatsModule {
    pub fn new() -> Self {
        Self {
            anim: None,
            food_bank: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            goodies_bank: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            bites_bank: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            saved_bg: Vec::new(),
            canvas_buf: Vec::new(),
            homer_x: 120.0,
            homer_y: 120.0,
            target_x: 240.0,
            target_y: 180.0,
            facing_left: false,
            state: HomerState::Walking,
            state_ticks: 0,
            chomp_run: (9, 16),
            goodie_alt: false,
            choke_alt: false,
            bites_taken: 0,
            marge_state: MargeState::Inactive,
            marge_action: MargeAction::Syrup,
            marge_x: -60.0,
            marge_y: 200.0,
            marge_target_x: 200.0,
            marge_ticks: 0,
            food_kind: 1,
            start_choice: 0,
            goodie_freq: 64,
            butt_cleavage: true,
            tick: 0,
            scale_f: 1.4,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "simpsons_homer_eats".to_string(),
            name: "Homer Eats".to_string(),
            credit: "By Gabriel Jensen and Ben Resner.\nSoftware © 1994 Berkeley Systems, Inc.\nThe Simpsons ™ & © Twentieth Century Fox.".to_string(),
            about: "Mmmm, desktop! Hunger has a name, and it's Homer J. Simpson. Watch as your screen turns into a gargantuan snack — or stays your real desktop — while Marge garnishes it and Homer devours it bite by bite!".to_string(),
            controls: [
                AdControl::Menu {
                    title: "Start with:".to_string(),
                    default_index: 1,
                    choices: vec![
                        "Desktop".into(),
                        "Candy Bar".into(),
                        "Pizza".into(),
                        "Crispies".into(),
                        "Waffle".into(),
                        "Ice Cream".into(),
                        "Random".into(),
                    ],
                },
                AdControl::LabeledSlider {
                    title: "Goodie Freq.:".to_string(),
                    default_raw: 64,
                    labels: vec![
                        "Few".into(),
                        "Crash Diet".into(),
                        "Buffet".into(),
                        "Pig Out".into(),
                    ],
                    thresholds: vec![0, 25, 50, 75],
                },
                AdControl::Checkbox {
                    title: "Butt Cleavage".to_string(),
                    default_checked: true,
                },
                AdControl::None,
            ],
            target_frame_ms: 60,
            filename: "HOMEREAT.AD".to_string(),
        }
    }

    fn fill_food_backdrop(&mut self, w: i32, h: i32, rng: &mut MsvcRand) {
        self.canvas_buf.resize((w * h) as usize, 0);
        let kind = if self.food_kind == 6 {
            1 + rng.rand_mod(5)
        } else {
            self.food_kind
        };

        match kind {
            0 if self.saved_bg.len() == self.canvas_buf.len() => {
                self.canvas_buf.copy_from_slice(&self.saved_bg);
            }
            1 => {
                // Candy Bar tiled with authentic "AH FUDGE!" sprite (#1010[0])
                self.canvas_buf.fill(0x0046_1E0E);
                if let Some(tile) = self.food_bank.frames.first() {
                    let tw = (tile.w as f32 * self.scale_f).round().max(16.0) as i32;
                    let th = (tile.h as f32 * self.scale_f).round().max(16.0) as i32;
                    let mut y = 0;
                    while y < h {
                        let mut x = 0;
                        while x < w {
                            tile.blit_into_buf_scaled(
                                &mut self.canvas_buf,
                                w,
                                h,
                                x,
                                y,
                                self.scale_f,
                                None,
                            );
                            x += tw;
                        }
                        y += th;
                    }
                }
            }
            2 => {
                // Cheesy Pepperoni Pizza!
                for y in 0..h {
                    let row = (y * w) as usize;
                    for x in 0..w {
                        let n = ((x * 11 ^ y * 17) & 15) as u32;
                        let r = (242u32).saturating_sub(n);
                        let g = (190u32).saturating_sub(n * 2);
                        let b = 52 + n;
                        self.canvas_buf[row + x as usize] = (r << 16) | (g << 8) | b;
                    }
                }
                for _ in 0..((w * h) / (6000.0 * self.scale_f * self.scale_f) as i32).clamp(14, 85) {
                    let cx = rng.rand_mod(w.max(1));
                    let cy = rng.rand_mod(h.max(1));
                    let rad = ((14 + rng.rand_mod(10)) as f32 * self.scale_f).round() as i32;
                    for dy in -rad..=rad {
                        let py = cy + dy;
                        if py < 0 || py >= h {
                            continue;
                        }
                        for dx in -rad..=rad {
                            let px = cx + dx;
                            if px < 0 || px >= w {
                                continue;
                            }
                            if dx * dx + dy * dy <= rad * rad {
                                let col = if (dx * 3 + dy * 5) & 7 == 0 {
                                    0x00F4_C088
                                } else {
                                    0x00B8_241C
                                };
                                self.canvas_buf[(py * w + px) as usize] = col;
                            }
                        }
                    }
                }
            }
            3 => {
                // Crunchy Crispies cereal!
                let cell_x = (10.0 * self.scale_f).round().max(6.0) as i32;
                let cell_y = (8.0 * self.scale_f).round().max(5.0) as i32;
                for y in 0..h {
                    let row = (y * w) as usize;
                    for x in 0..w {
                        let gx = (x / cell_x) * 19 + (y / cell_y) * 31;
                        let v = ((gx ^ (gx >> 3)) & 31) as u32;
                        let r = 216 + (v / 2);
                        let g = 166 + (v / 2);
                        let b = 78 + (v / 3);
                        self.canvas_buf[row + x as usize] = (r << 16) | (g << 8) | b;
                    }
                }
            }
            4 => {
                // Golden Waffle tiled with authentic Waffle square (#1001[70])
                self.canvas_buf.fill(0x00D8_9A3C);
                if let Some(tile) = self.goodies_bank.frames.get(70) {
                    let tw = (tile.w as f32 * self.scale_f).round().max(16.0) as i32;
                    let th = (tile.h as f32 * self.scale_f).round().max(16.0) as i32;
                    let mut y = 0;
                    while y < h {
                        let mut x = 0;
                        while x < w {
                            tile.blit_into_buf_scaled(
                                &mut self.canvas_buf,
                                w,
                                h,
                                x,
                                y,
                                self.scale_f,
                                None,
                            );
                            x += tw;
                        }
                        y += th;
                    }
                }
            }
            _ => {
                // Neapolitan Ice Cream stripes
                let band = (w / 3).max(1);
                for y in 0..h {
                    let row = (y * w) as usize;
                    for x in 0..w {
                        let base = if x < band {
                            (246u32, 166u32, 188u32)
                        } else if x < band * 2 {
                            (252u32, 244u32, 212u32)
                        } else {
                            (108u32, 62u32, 36u32)
                        };
                        let n = ((x * 5 ^ y * 9) & 7) as u32;
                        self.canvas_buf[row + x as usize] = ((base.0.saturating_sub(n)) << 16)
                            | ((base.1.saturating_sub(n)) << 8)
                            | base.2.saturating_sub(n);
                    }
                }
            }
        }
        self.bites_taken = 0;
    }

    fn stamp_bite(&mut self, w: i32, h: i32, cx: i32, cy: i32, rng: &mut MsvcRand) {
        let hole_opt = if rng.rand_mod(2) == 0 {
            self.food_bank.frames.get(1 + (rng.rand_mod(2) as usize))
        } else {
            self.bites_bank.frames.get(rng.rand_mod(3) as usize)
        };
        if let Some(hole) = hole_opt {
            let hw = (hole.w as f32 * self.scale_f).round() as i32;
            let hh = (hole.h as f32 * self.scale_f).round() as i32;
            hole.blit_into_buf_scaled(
                &mut self.canvas_buf,
                w,
                h,
                cx - hw / 2,
                cy - hh / 2,
                self.scale_f,
                Some(0x0000_0000),
            );
        }
        let rad = (26.0 * self.scale_f).round() as i32;
        for dy in -rad..=rad {
            let py = cy + dy;
            if py < 0 || py >= h {
                continue;
            }
            for dx in -rad..=rad {
                let px = cx + dx;
                if px < 0 || px >= w {
                    continue;
                }
                let jitter = ((dx * 7 ^ dy * 11) & 7) - 3;
                if dx * dx + dy * dy <= (rad + jitter) * (rad + jitter) {
                    self.canvas_buf[(py * w + px) as usize] = 0x0000_0000;
                }
            }
        }
        self.bites_taken += 1;
    }

    /// Stamp an authentic dripping chocolate syrup splat (`OFst` R21..R23, frames `198..=200`) onto the snack canvas!
    fn stamp_syrup_splat(&mut self, w: i32, h: i32, cx: i32, cy: i32, rng: &mut MsvcRand) {
        let Some(anim) = &self.anim else {
            return;
        };
        let fi = 198 + (rng.rand_mod(3) as usize);
        if let Some(cf) = anim.frames.get(fi) {
            let fw = ((cf.right - cf.left).max(1) as f32 * self.scale_f).round() as i32;
            let fh = ((cf.bottom - cf.top).max(1) as f32 * self.scale_f).round() as i32;
            for part in &cf.parts {
                if let Some(sp) = anim.sprites.get(part.sprite_idx) {
                    let rx = ((part.left - cf.left) as f32 * self.scale_f).round() as i32;
                    let ry = ((part.top - cf.top) as f32 * self.scale_f).round() as i32;
                    sp.blit_into_buf_scaled(
                        &mut self.canvas_buf,
                        w,
                        h,
                        cx - fw / 2 + rx,
                        cy - fh / 2 + ry,
                        self.scale_f,
                        None,
                    );
                }
            }
        }
    }

    fn pick_next_target(&mut self, w: i32, h: i32, rng: &mut MsvcRand) {
        let margin_x = ((68.0 * self.scale_f) as i32).min(w / 4);
        let margin_y = ((96.0 * self.scale_f) as i32).min(h / 4);
        self.target_x = (margin_x + rng.rand_mod((w - margin_x * 2).max(20))) as f32;
        self.target_y = (margin_y + rng.rand_mod((h - margin_y * 2).max(20))) as f32;
        self.facing_left = self.target_x < self.homer_x;
    }

    fn spawn_marge(&mut self, w: i32, h: i32, rng: &mut MsvcRand) {
        self.marge_state = MargeState::WalkingIn;
        self.marge_action = match rng.rand_mod(3) {
            0 => MargeAction::Syrup,
            1 => MargeAction::Sprinkle,
            _ => MargeAction::Knife,
        };
        self.marge_x = -36.0 * self.scale_f;
        let my_pad = ((110.0 * self.scale_f) as i32).min(h / 3);
        self.marge_y = (my_pad + rng.rand_mod((h - my_pad - (40.0 * self.scale_f) as i32).max(20))) as f32;
        self.marge_target_x =
            ((80.0 * self.scale_f) as i32 + rng.rand_mod((w - (160.0 * self.scale_f) as i32).max(40)))
                as f32;
        self.marge_ticks = 0;
    }
}

impl Default for HomerEatsModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for HomerEatsModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        if self.anim.is_none() {
            self.anim = Some(CompoundAnim::load(MOD_HOMER_EATS, 1000));
            self.goodies_bank = RlepBank::load(MOD_HOMER_EATS, 1001);
            self.bites_bank = RlepBank::load(MOD_HOMER_EATS, 1002);
            self.food_bank = RlepBank::load(MOD_HOMER_EATS, 1010);
        }
        self.saved_bg = ctx.surface.pixels().to_vec();
        self.start_choice = ctx.module.raw_control_value[0].clamp(0, 6);
        self.goodie_freq = ctx.module.raw_control_value[1].clamp(0, 100);
        self.butt_cleavage = ctx.module.raw_control_value[2] != 0;
        self.food_kind = self.start_choice;
        self.scale_f = (ctx.surface.height as f32 / 460.0).clamp(1.0, 3.6);
        self.tick = 0;

        let w = ctx.surface.width;
        let h = ctx.surface.height;
        self.fill_food_backdrop(w, h, ctx.rng);

        self.homer_x = (w / 2) as f32;
        self.homer_y = (h / 2) as f32;
        self.pick_next_target(w, h, ctx.rng);
        self.state = HomerState::Walking;
        self.state_ticks = 0;
        self.marge_state = MargeState::Inactive;

        SimpsonsPack::global().play_voice(ctx.sound, ctx.system.sound_enabled, SND_HOMER_AWW);
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
        self.state_ticks += 1;
        let w = ctx.surface.width;
        let h = ctx.surface.height;
        let sf = self.scale_f;
        let pack = SimpsonsPack::global();

        // 1. Update Homer's state machine using ONLY verified Homer runs (0..=163, skipping crumbs 77..=79!)
        let homer_frame: usize;
        let homer_flip: bool;
        match self.state {
            HomerState::Walking => {
                let dx = self.target_x - self.homer_x;
                let dy = self.target_y - self.homer_y;
                let dist = (dx * dx + dy * dy).sqrt();
                let spd = 5.4 * sf;
                if dist <= spd + 2.0 {
                    self.homer_x = self.target_x;
                    self.homer_y = self.target_y;
                    self.state_ticks = 0;
                    if ctx.rng.rand_mod(100) < (16 + self.goodie_freq / 2) {
                        self.state = HomerState::EatingGoodie;
                        self.goodie_alt = ctx.rng.rand_mod(2) == 0;
                        pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_INHALE);
                    } else {
                        self.state = HomerState::Chomping;
                        let pool = if self.butt_cleavage {
                            CHOMP_RUNS_ALL
                        } else {
                            CHOMP_RUNS_MODEST
                        };
                        self.chomp_run = pool[ctx.rng.rand_mod(pool.len() as i32) as usize];
                        let eat_snd = match ctx.rng.rand_mod(4) {
                            0 => SND_HOMER_EAT1,
                            1 => SND_HOMER_EAT2,
                            2 => SND_HOMER_EAT3,
                            _ => SND_HOMER_EAT4,
                        };
                        pack.play_voice(ctx.sound, ctx.system.sound_enabled, eat_snd);
                    }
                } else {
                    self.homer_x += (dx / dist) * spd;
                    self.homer_y += (dy / dist) * spd;
                    self.facing_left = dx < 0.0;
                }
                // Smooth 8-frame Homer walk cycle R00 (0..=7, natively facing RIGHT!)
                homer_frame = (self.tick / 2) % 8;
                homer_flip = self.facing_left;
            }
            HomerState::Chomping => {
                let (a, b) = self.chomp_run;
                let len = b - a + 1;
                homer_frame = a + ((self.state_ticks / 2) % len);
                homer_flip = false; // Back-to-camera wall chomping
                if self.state_ticks == 8 || self.state_ticks == 18 {
                    let bite_y = self.homer_y as i32 - (68.0 * sf) as i32;
                    self.stamp_bite(w, h, self.homer_x as i32, bite_y, ctx.rng);
                }
                if self.state_ticks >= 26 {
                    self.state_ticks = 0;
                    if self.marge_state == MargeState::Inactive && self.bites_taken % 4 == 2 {
                        self.spawn_marge(w, h, ctx.rng);
                    }
                    if ctx.rng.rand_mod(4) == 0 {
                        self.state = HomerState::ChokingOrBelly;
                        self.choke_alt = ctx.rng.rand_mod(2) == 0;
                        let snd = if self.choke_alt {
                            SND_HOMER_CHOK
                        } else if ctx.rng.rand_mod(2) == 0 {
                            SND_EXHALE
                        } else {
                            SND_HOMER_DOH
                        };
                        pack.play_voice(ctx.sound, ctx.system.sound_enabled, snd);
                    } else {
                        self.state = HomerState::Walking;
                        self.pick_next_target(w, h, ctx.rng);
                    }
                }
            }
            HomerState::EatingGoodie => {
                // Holding plate of donuts & gobbling (R12: 119..=144 or R13: 145..=163)
                let (a, b) = if self.goodie_alt {
                    (119, 144)
                } else {
                    (145, 163)
                };
                let len = b - a + 1;
                homer_frame = a + (self.state_ticks / 2).min(len - 1);
                homer_flip = false;
                if self.state_ticks == 16 {
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_HOMER_EAT2);
                }
                if self.state_ticks >= len * 2 {
                    self.state = HomerState::Walking;
                    self.state_ticks = 0;
                    self.pick_next_target(w, h, ctx.rng);
                }
            }
            HomerState::ChokingOrBelly => {
                // R10 choking (80..=92) or R11 patting belly / licking lips (93..=118)
                let (a, b) = if self.choke_alt { (80, 92) } else { (93, 118) };
                let len = b - a + 1;
                homer_frame = a + (self.state_ticks / 2).min(len - 1);
                homer_flip = false;
                if self.state_ticks >= (len * 2).min(38) {
                    self.state = HomerState::Walking;
                    self.state_ticks = 0;
                    self.pick_next_target(w, h, ctx.rng);
                }
            }
        }

        // 2. Update authentic Marge Simpson cameo (OFst R14..R29, frames 164..=255)!
        let mut marge_frame: Option<usize> = None;
        if self.marge_state != MargeState::Inactive {
            self.marge_ticks += 1;
            match self.marge_state {
                MargeState::Inactive => {}
                MargeState::WalkingIn => {
                    self.marge_x += 4.6 * sf;
                    let walk_base = match self.marge_action {
                        MargeAction::Syrup => 171,    // R15 carrying syrup bottle
                        MargeAction::Knife => 178,    // R16 carrying frosting knife
                        MargeAction::Sprinkle => 185, // R17 carrying sugar shaker
                    };
                    marge_frame = Some(walk_base + ((self.tick / 2) % 6));
                    if self.marge_x >= self.marge_target_x {
                        self.marge_state = MargeState::Acting;
                        self.marge_ticks = 0;
                    }
                }
                MargeState::Acting => {
                    match self.marge_action {
                        MargeAction::Syrup => {
                            // Squeeze chocolate syrup (192..=197) + stamp dripping puddle!
                            marge_frame = Some(192 + ((self.marge_ticks / 3) % 6));
                            if self.marge_ticks == 9 {
                                self.stamp_syrup_splat(
                                    w,
                                    h,
                                    self.marge_x as i32 + (24.0 * sf) as i32,
                                    self.marge_y as i32 - (74.0 * sf) as i32,
                                    ctx.rng,
                                );
                            }
                            if self.marge_ticks >= 18 {
                                self.marge_state = MargeState::Sighing;
                                self.marge_ticks = 0;
                            }
                        }
                        MargeAction::Sprinkle => {
                            // Shake sugar/sprinkles (201..=204)
                            marge_frame = Some(201 + ((self.marge_ticks / 3) % 4));
                            if self.marge_ticks >= 16 {
                                self.marge_state = MargeState::Sighing;
                                self.marge_ticks = 0;
                            }
                        }
                        MargeAction::Knife => {
                            // Slice & frost the screen (R26: 205..=217 -> R27: 218..=224)
                            let off = (self.marge_ticks / 2).min(19);
                            marge_frame = Some(205 + off);
                            if self.marge_ticks >= 38 {
                                self.marge_state = MargeState::Sighing;
                                self.marge_ticks = 0;
                            }
                        }
                    }
                }
                MargeState::Sighing => {
                    // Marge facepalms / shakes head at Homer (R29: 235..=255)
                    let off = (self.marge_ticks / 2).min(20);
                    marge_frame = Some(235 + off);
                    if self.marge_ticks >= 24 {
                        self.marge_state = MargeState::WalkingOut;
                        self.marge_ticks = 0;
                    }
                }
                MargeState::WalkingOut => {
                    self.marge_x += 5.0 * sf;
                    marge_frame = Some(164 + ((self.tick / 2) % 6)); // R14 empty-handed walk
                    if self.marge_x > w as f32 + 50.0 * sf {
                        self.marge_state = MargeState::Inactive;
                    }
                }
            }
        }

        // Refill fresh food backdrop once Homer has devoured most of the screen!
        if self.bites_taken >= 28 {
            if self.start_choice == 6 {
                self.food_kind = 1 + ctx.rng.rand_mod(5);
            }
            self.fill_food_backdrop(w, h, ctx.rng);
            pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_HOMER_AWW);
        }

        if self.canvas_buf.len() == ctx.surface.pixels().len() {
            ctx.surface.pixels_mut().copy_from_slice(&self.canvas_buf);
        }

        if let Some(anim) = &self.anim {
            let max_i = anim.frames.len().saturating_sub(1);
            if let Some(mf) = marge_frame {
                anim.draw_anchored_bottom_f(
                    ctx.surface,
                    mf.min(max_i),
                    self.marge_x as i32,
                    self.marge_y as i32,
                    sf,
                    false,
                    false,
                    false,
                );
            }
            anim.draw_anchored_bottom_f(
                ctx.surface,
                homer_frame.min(max_i),
                self.homer_x as i32,
                self.homer_y as i32,
                sf,
                homer_flip,
                false,
                false,
            );
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
