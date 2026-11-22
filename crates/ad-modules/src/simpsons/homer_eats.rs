//! *Homer Eats* — 1994 *The Simpsons* After Dark 3.0 Module.
//!
//! Your desktop transforms into a giant Candy Bar, Pizza, Crispies, Waffle,
//! Ice Cream, or stays as your real Windows desktop while Homer walks around
//! taking massive jagged bites out of the screen (`OFst/OFtb #1000`, `RLEP #1001/#1002/#1010`)
//! with authentic Homer chomping, "D'oh!", and "Mmm..." voice clips!

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult, MsvcRand};

use super::{
    CompoundAnim, MOD_HOMER_EATS, RlepBank, SND_EXHALE, SND_HOMER_AWW, SND_HOMER_CHOK,
    SND_HOMER_DOH, SND_HOMER_EAT1, SND_HOMER_EAT2, SND_HOMER_EAT3, SND_HOMER_EAT4, SND_INHALE,
    SimpsonsPack,
};

#[derive(Clone, Copy, PartialEq, Eq)]
enum HomerState {
    Walking,
    Chomping,
    EatingGoodie,
    Burping,
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
    bites_taken: usize,
    food_kind: i32,
    start_choice: i32,
    goodie_freq: i32,
    butt_cleavage: bool,
    tick: usize,
    scale: i32,
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
            bites_taken: 0,
            food_kind: 1,
            start_choice: 0,
            goodie_freq: 64,
            butt_cleavage: true,
            tick: 0,
            scale: 1,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "simpsons_homer_eats".to_string(),
            name: "Homer Eats".to_string(),
            credit: "By Gabriel Jensen and Ben Resner.\nSoftware © 1994 Berkeley Systems, Inc.\nThe Simpsons ™ & © Twentieth Century Fox.".to_string(),
            about: "Mmmm, desktop! Hunger has a name, and it's Homer J. Simpson. Watch as your screen turns into a gargantuan snack — or stays your real desktop — while Homer devours it bite by bite!".to_string(),
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
                // Real desktop!
                self.canvas_buf.copy_from_slice(&self.saved_bg);
            }
            1 => {
                // Candy Bar tiled with authentic "AH FUDGE!" sprite (#1010[0])
                self.canvas_buf.fill(0x0046_1E0E);
                if let Some(tile) = self.food_bank.frames.first() {
                    let tw = tile.w.max(16);
                    let th = tile.h.max(16);
                    let mut y = 0;
                    while y < h {
                        let mut x = 0;
                        while x < w {
                            tile.blit_into_buf(&mut self.canvas_buf, w, h, x, y, None);
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
                // Pepperoni slices + melted mozzarella patches
                for _ in 0..((w * h) / 6000).clamp(12, 85) {
                    let cx = rng.rand_mod(w.max(1));
                    let cy = rng.rand_mod(h.max(1));
                    let rad = 14 + rng.rand_mod(10);
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
                for y in 0..h {
                    let row = (y * w) as usize;
                    for x in 0..w {
                        let gx = (x / 10) * 19 + (y / 8) * 31;
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
                    let tw = tile.w.max(16);
                    let th = tile.h.max(16);
                    let mut y = 0;
                    while y < h {
                        let mut x = 0;
                        while x < w {
                            tile.blit_into_buf(&mut self.canvas_buf, w, h, x, y, None);
                            x += tw;
                        }
                        y += th;
                    }
                }
            }
            _ => {
                // Neapolitan Ice Cream stripes (Strawberry / Vanilla / Chocolate)
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
        // Stamp authentic jagged black bite hole from #1010[1..2] or #1002[0..2]
        let hole_opt = if rng.rand_mod(2) == 0 {
            self.food_bank.frames.get(1 + (rng.rand_mod(2) as usize))
        } else {
            self.bites_bank.frames.get(rng.rand_mod(3) as usize)
        };
        if let Some(hole) = hole_opt {
            hole.blit_into_buf(
                &mut self.canvas_buf,
                w,
                h,
                cx - hole.w / 2,
                cy - hole.h / 2,
                Some(0x0000_0000),
            );
        }
        // Also chew a circular jagged black crater so it scales cleanly
        let rad = 28 * self.scale;
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

    fn pick_next_target(&mut self, w: i32, h: i32, rng: &mut MsvcRand) {
        let margin_x = (60 * self.scale).min(w / 4);
        let margin_y = (80 * self.scale).min(h / 4);
        self.target_x = (margin_x + rng.rand_mod((w - margin_x * 2).max(20))) as f32;
        self.target_y = (margin_y + rng.rand_mod((h - margin_y * 2).max(20))) as f32;
        self.facing_left = self.target_x < self.homer_x;
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
        self.scale = if ctx.surface.width >= 1000 { 2 } else { 1 };
        self.tick = 0;

        let w = ctx.surface.width;
        let h = ctx.surface.height;
        self.fill_food_backdrop(w, h, ctx.rng);

        self.homer_x = (w / 2) as f32;
        self.homer_y = (h / 2) as f32;
        self.pick_next_target(w, h, ctx.rng);
        self.state = HomerState::Walking;
        self.state_ticks = 0;

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
        let pack = SimpsonsPack::global();

        let frame_idx: usize;
        match self.state {
            HomerState::Walking => {
                let dx = self.target_x - self.homer_x;
                let dy = self.target_y - self.homer_y;
                let dist = (dx * dx + dy * dy).sqrt();
                let spd = 6.0 * self.scale as f32;
                if dist <= spd + 2.0 {
                    self.homer_x = self.target_x;
                    self.homer_y = self.target_y;
                    self.state_ticks = 0;
                    if ctx.rng.rand_mod(100) < (18 + self.goodie_freq / 2) {
                        self.state = HomerState::EatingGoodie;
                        pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_INHALE);
                    } else {
                        self.state = HomerState::Chomping;
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
                frame_idx = (self.tick / 2) % 10;
            }
            HomerState::Chomping => {
                // Bending & chomping animation frames (12..72; if butt_cleavage off, stay upright 76..110)
                frame_idx = if self.butt_cleavage {
                    12 + (self.state_ticks * 2).min(58)
                } else {
                    76 + (self.state_ticks * 2).min(34)
                };
                if self.state_ticks == 12 || self.state_ticks == 22 {
                    let bite_x = self.homer_x as i32
                        + if self.facing_left {
                            -22 * self.scale
                        } else {
                            22 * self.scale
                        };
                    let bite_y = self.homer_y as i32 - 34 * self.scale;
                    self.stamp_bite(w, h, bite_x, bite_y, ctx.rng);
                }
                if self.state_ticks >= 30 {
                    self.state_ticks = 0;
                    if ctx.rng.rand_mod(5) == 0 {
                        self.state = HomerState::Burping;
                        let snd = if ctx.rng.rand_mod(2) == 0 {
                            SND_HOMER_DOH
                        } else {
                            SND_EXHALE
                        };
                        pack.play_voice(ctx.sound, ctx.system.sound_enabled, snd);
                    } else {
                        self.state = HomerState::Walking;
                        self.pick_next_target(w, h, ctx.rng);
                    }
                }
            }
            HomerState::EatingGoodie => {
                // Holding up goodies & gobbling them (frames 112..168)
                frame_idx = 112 + (self.state_ticks * 2).min(56);
                if self.state_ticks == 14 {
                    self.stamp_bite(w, h, self.homer_x as i32, self.homer_y as i32 - 40 * self.scale, ctx.rng);
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_HOMER_EAT2);
                }
                if self.state_ticks >= 30 {
                    self.state = HomerState::Walking;
                    self.state_ticks = 0;
                    self.pick_next_target(w, h, ctx.rng);
                }
            }
            HomerState::Burping => {
                // Stretching / choking / sighing frames (176..256)
                frame_idx = 176 + (self.state_ticks * 2).min(78);
                if self.state_ticks == 10 {
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_HOMER_CHOK);
                }
                if self.state_ticks >= 32 {
                    self.state = HomerState::Walking;
                    self.state_ticks = 0;
                    self.pick_next_target(w, h, ctx.rng);
                }
            }
        }

        // Refill screen with next snack once Homer eats ~28 giant bites!
        if self.bites_taken >= 28 {
            self.food_kind = 1 + ((self.food_kind) % 5);
            self.fill_food_backdrop(w, h, ctx.rng);
            pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_HOMER_AWW);
        }

        // Composite persistent eaten snack buffer + Homer sprite
        if self.canvas_buf.len() == ctx.surface.pixels().len() {
            ctx.surface.pixels_mut().copy_from_slice(&self.canvas_buf);
        }

        if let Some(anim) = &self.anim {
            let fi = frame_idx.min(anim.frames.len().saturating_sub(1));
            anim.draw_anchored_bottom(
                ctx.surface,
                fi,
                self.homer_x as i32,
                self.homer_y as i32,
                self.scale,
                self.facing_left,
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
