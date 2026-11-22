//! *Snowball I* — 1994 *The Simpsons* After Dark 3.0 Module.
//!
//! Ghost cat Snowball I floats serenely across your screen on halo clouds,
//! accompanied by *Snowball Mozart* MIDI (`cmid #90`) and original `RLEP` `#1000`/`#1010` art.

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use super::{
    MOD_SNOWBALL, RlepBank, SONG_SNOWBALL_MOZART, SimpsonsPack, fill_circle_px,
    music_loops_from_slider, restore_or_clear,
};

struct FloatingCat {
    x: f32,
    y: f32,
    base_y: f32,
    vx: f32,
    phase: f32,
    depth: f32,
    anim_tick: usize,
    anim_speed: usize,
    is_cloud: bool,
    flip: bool,
}

struct SkyStar {
    x_frac: f32,
    y_frac: f32,
    twinkle: usize,
    radius: i32,
}

pub struct SnowballModule {
    cats_bank: RlepBank,
    cloud_bank: RlepBank,
    entities: Vec<FloatingCat>,
    stars: Vec<SkyStar>,
    saved_bg: Vec<u32>,
    clear_screen: bool,
    tick: usize,
    scale_f: f32,
}

impl SnowballModule {
    pub fn new() -> Self {
        Self {
            cats_bank: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            cloud_bank: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            entities: Vec::new(),
            stars: Vec::new(),
            saved_bg: Vec::new(),
            clear_screen: true,
            tick: 0,
            scale_f: 1.5,
        }
    }

    fn draw_sky_or_desktop(&self, surface: &mut ad_sdk::canvas::AdSurface) {
        if !self.clear_screen && self.saved_bg.len() == surface.pixels().len() {
            restore_or_clear(surface, &self.saved_bg, false, 0x0008_0C20);
            return;
        }
        // Serene starry twilight heaven gradient
        let w = surface.width;
        let h = surface.height;
        {
            let dst = surface.pixels_mut();
            for y in 0..h {
                let t = y as f32 / h.max(1) as f32;
                let r = (8.0 + t * 20.0) as u32;
                let g = (10.0 + t * 22.0) as u32;
                let b = (28.0 + t * 44.0) as u32;
                let col = (r << 16) | (g << 8) | b;
                let row = (y * w) as usize;
                dst[row..row + w as usize].fill(col);
            }
        }
        for st in &self.stars {
            let sx = (st.x_frac * w as f32) as i32;
            let sy = (st.y_frac * h as f32) as i32;
            let bright = (((self.tick + st.twinkle) / 5) % 6) != 0;
            let col = if bright { 0x00FF_F4CC } else { 0x008A_94C0 };
            fill_circle_px(surface, sx, sy, st.radius, col);
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "simpsons_snowball".to_string(),
            name: "Snowball I".to_string(),
            credit: "By Jarir Maani and Ben Resner.\nSoftware © 1994 Berkeley Systems, Inc.\nThe Simpsons ™ & © Twentieth Century Fox.".to_string(),
            about: "From \"Meditations on Turning Eight\" by Lisa Simpson:\n\nI had a cat named Snowball. She died! She died!\nMom said she was sleeping. She lied! She lied!\nWhy, oh, why is my cat dead?\nCouldn't a Chrysler have hit me instead?".to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "Snowballs:".to_string(),
                    default_raw: 41,
                    labels: vec![
                        "Few".into(),
                        "Some".into(),
                        "More".into(),
                        "Crowd".into(),
                        "A Litter".into(),
                        "A Lotter".into(),
                    ],
                    thresholds: vec![0, 16, 33, 50, 66, 83],
                },
                AdControl::LabeledSlider {
                    title: "Music:".to_string(),
                    default_raw: 30,
                    labels: vec![
                        "Never".into(),
                        "Once".into(),
                        "Twice".into(),
                        "Thrice".into(),
                        "Always".into(),
                    ],
                    thresholds: vec![0, 20, 40, 60, 80],
                },
                AdControl::Checkbox {
                    title: "Clear Screen First".to_string(),
                    default_checked: true,
                },
                AdControl::None,
            ],
            target_frame_ms: 50,
            filename: "SNOWBALL.AD".to_string(),
        }
    }
}

impl Default for SnowballModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for SnowballModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        if self.cats_bank.frames.is_empty() {
            self.cats_bank = RlepBank::load(MOD_SNOWBALL, 1000);
            self.cloud_bank = RlepBank::load(MOD_SNOWBALL, 1010);
        }
        self.saved_bg = ctx.surface.pixels().to_vec();
        self.clear_screen = ctx.module.raw_control_value[2] != 0;
        self.tick = 0;
        self.scale_f = (ctx.surface.height as f32 / 420.0).clamp(1.1, 3.8);

        self.stars.clear();
        let star_r = (self.scale_f * 0.85).round().max(1.0) as i32;
        for _ in 0..70 {
            self.stars.push(SkyStar {
                x_frac: ctx.rng.rand_mod(1000) as f32 / 1000.0,
                y_frac: ctx.rng.rand_mod(1000) as f32 / 1000.0,
                twinkle: ctx.rng.rand_mod(60) as usize,
                radius: if ctx.rng.rand_mod(4) == 0 { star_r + 1 } else { star_r },
            });
        }

        let count_raw = ctx.module.raw_control_value[0].clamp(0, 100);
        let num_cats = 2 + (count_raw * 14) / 100;
        let num_clouds = (num_cats / 2).max(2);

        self.entities.clear();
        let w = ctx.surface.width.max(160) as f32;
        let h = ctx.surface.height.max(120) as f32;

        for i in 0..num_clouds {
            let depth = 0.85 + (ctx.rng.rand_mod(35) as f32) * 0.01;
            let x = (ctx.rng.rand_mod(w as i32)) as f32;
            let y = 20.0 * self.scale_f
                + (ctx.rng.rand_mod((h as i32 - (80.0 * self.scale_f) as i32).max(20))) as f32;
            let spd = (1.0 + (ctx.rng.rand_mod(12) as f32) * 0.12) * self.scale_f * depth;
            self.entities.push(FloatingCat {
                x,
                y,
                base_y: y,
                vx: -spd,
                phase: (i as f32) * 1.1,
                depth,
                anim_tick: 0,
                anim_speed: 6,
                is_cloud: true,
                flip: false,
            });
        }

        for i in 0..num_cats {
            let depth = 0.85 + (ctx.rng.rand_mod(35) as f32) * 0.01;
            let x = (ctx.rng.rand_mod(w as i32)) as f32;
            let y = 30.0 * self.scale_f
                + (ctx.rng.rand_mod((h as i32 - (100.0 * self.scale_f) as i32).max(20))) as f32;
            let spd = (1.6 + (ctx.rng.rand_mod(18) as f32) * 0.14) * self.scale_f * depth;
            let flip = ctx.rng.rand_mod(4) == 0;
            self.entities.push(FloatingCat {
                x,
                y,
                base_y: y,
                vx: if flip { spd } else { -spd },
                phase: (i as f32) * 0.85,
                depth,
                anim_tick: (ctx.rng.rand_mod(4)) as usize,
                anim_speed: 3 + (ctx.rng.rand_mod(3)) as usize,
                is_cloud: false,
                flip,
            });
        }

        if let Some(loops) = music_loops_from_slider(ctx.module.raw_control_value[1]) {
            SimpsonsPack::global().play_music(
                ctx.sound,
                ctx.system.sound_enabled,
                SONG_SNOWBALL_MOZART,
                loops,
            );
        }

        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.draw_sky_or_desktop(ctx.surface);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.tick = self.tick.wrapping_add(1);
        self.draw_sky_or_desktop(ctx.surface);

        let w = ctx.surface.width as f32;
        let h = ctx.surface.height as f32;
        let sf = self.scale_f;
        let margin = 90.0 * sf;

        for e in &mut self.entities {
            e.x += e.vx;
            e.phase += 0.08;
            e.y = e.base_y + e.phase.sin() * (8.0 * sf * e.depth);

            if e.vx < 0.0 && e.x < -margin {
                e.x = w + 10.0 * sf;
                e.base_y = 24.0 * sf
                    + (ctx.rng.rand_mod((h as i32 - (90.0 * sf) as i32).max(20))) as f32;
            } else if e.vx > 0.0 && e.x > w + 10.0 * sf {
                e.x = -margin;
                e.base_y = 24.0 * sf
                    + (ctx.rng.rand_mod((h as i32 - (90.0 * sf) as i32).max(20))) as f32;
            }

            if !e.is_cloud && self.tick % e.anim_speed == 0 {
                e.anim_tick = e.anim_tick.wrapping_add(1);
            }

            let esf = sf * e.depth;
            if e.is_cloud {
                if let Some(sp) = self.cloud_bank.frames.first() {
                    sp.blit_transformed_f(ctx.surface, e.x as i32, e.y as i32, esf, false, false, true, false);
                }
            } else if !self.cats_bank.frames.is_empty() {
                // Smooth ping-pong angel wing flap (0 -> 1 -> 2 -> 3 -> 2 -> 1)
                let n = self.cats_bank.frames.len();
                let span = (n.saturating_sub(1) * 2).max(1);
                let step = e.anim_tick % span;
                let fi = if step < n { step } else { span - step };
                let sp = &self.cats_bank.frames[fi];
                sp.blit_transformed_f(ctx.surface, e.x as i32, e.y as i32, esf, e.flip, false, false, false);
            }
        }

        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        self.entities.clear();
        self.saved_bg.clear();
        AdResult::NoError
    }
}
