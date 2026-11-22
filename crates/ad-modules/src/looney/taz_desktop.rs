//! "Taz Desktop" — Classic 1995 *Looney Tunes* After Dark 3.0 module.
//!
//! *"It's spinning wildly out of control, but it's not your hard drive!"*
//! The Tasmanian Devil whirls across your real Windows desktop like a tornado
//! (`OFst #3000`, 298 compound frames across `RLEP #3000..#3004`), chewing bite
//! marks directly into your desktop canvas (`canvas_buf`) and spitting out
//! chomped scraps (`w2=63..67`) with authentic digitized Taz babble, spin,
//! chew, and burp clips (`TAZ_VOICES`).

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::looney::{
    MOD_TAZ, TAZ_VOICES, advance_filtered_range, load_anim, looney_pack,
};
use crate::simpsons::CompoundAnim;

struct ChompedScrap {
    x: i32,
    y: i32,
    sprite_idx: usize,
}

pub struct TazDesktopModule {
    appetite_raw: i32,
    saved_bg: Vec<u32>,
    canvas_buf: Vec<u32>,
    anim: Option<CompoundAnim>,
    scraps: Vec<ChompedScrap>,
    taz_x: f32,
    taz_y: f32,
    vx: f32,
    vy: f32,
    walk_frame: usize,
    spin_frame: usize,
    tick: u32,
}

impl TazDesktopModule {
    pub fn new() -> Self {
        Self {
            appetite_raw: 50,
            saved_bg: Vec::new(),
            canvas_buf: Vec::new(),
            anim: None,
            scraps: Vec::new(),
            taz_x: 260.0,
            taz_y: 260.0,
            vx: 3.4,
            vy: 2.2,
            walk_frame: 0,
            spin_frame: 105,
            tick: 0,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "looney_taz_desktop".to_string(),
            name: "Taz Desktop".to_string(),
            filename: "TAZDESK.AD".to_string(),
            credit: "By Alan Kaiser & Laura Tullio.\nSoftware © 1995 Berkeley Systems, Inc.\nLooney Tunes ™ & © Warner Bros.".to_string(),
            about: "It's spinning wildly out of control, but it's not your hard drive! The Tasmanian Devil whirls across your Windows desktop, chewing up your screen and spitting out scraps.".to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "Appetite:".to_string(),
                    default_raw: 50,
                    labels: vec!["Snack".into(), "Hungry".into(), "Ravenous".into()],
                    thresholds: vec![0, 33, 66],
                },
                AdControl::None,
                AdControl::None,
                AdControl::None,
            ],
            target_frame_ms: 68,
        }
    }

    fn ensure_loaded(&mut self) {
        if self.anim.is_none() {
            self.anim = Some(load_anim(MOD_TAZ, 3000));
        }
    }

    /// Chew a circular bite mark directly out of `canvas_buf` (the user's live Windows desktop!).
    fn chew_desktop_hole(&mut self, w: i32, h: i32, cx: i32, cy: i32, r: i32) {
        if self.canvas_buf.len() != (w * h) as usize {
            return;
        }
        let r2 = r * r;
        let rim2 = (r + 2) * (r + 2);
        for dy in -(r + 2)..=(r + 2) {
            let py = cy + dy;
            if py < 0 || py >= h {
                continue;
            }
            let row = (py * w) as usize;
            for dx in -(r + 2)..=(r + 2) {
                let px = cx + dx;
                if px < 0 || px >= w {
                    continue;
                }
                let d2 = dx * dx + dy * dy;
                if d2 <= r2 {
                    self.canvas_buf[row + px as usize] = 0x0008_0A10;
                } else if d2 <= rim2 {
                    self.canvas_buf[row + px as usize] = 0x0048_3828;
                }
            }
        }
    }
}

impl Default for TazDesktopModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for TazDesktopModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();
        self.appetite_raw = ctx.module.raw_control_value[0].clamp(0, 100);
        self.saved_bg = ctx.surface.pixels().to_vec();
        self.canvas_buf = self.saved_bg.clone();
        self.scraps.clear();
        self.tick = 0;
        self.walk_frame = 0;
        self.spin_frame = 105;
        let w = ctx.surface.width.max(320);
        let h = ctx.surface.height.max(240);
        self.taz_x = (w / 2 - 40) as f32;
        self.taz_y = (h / 2 + 50) as f32;
        looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, TAZ_VOICES[0]);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        if self.saved_bg.len() == ctx.surface.pixels().len() {
            ctx.surface.pixels_mut().copy_from_slice(&self.saved_bg);
        }
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();
        self.tick = self.tick.wrapping_add(1);

        let w = ctx.surface.width;
        let h = ctx.surface.height;
        if self.canvas_buf.len() != (w * h) as usize {
            self.saved_bg = ctx.surface.pixels().to_vec();
            self.canvas_buf = self.saved_bg.clone();
        }

        // Periodically restore the desktop after Taz has chewed it heavily
        if self.tick % 480 == 0 && self.saved_bg.len() == self.canvas_buf.len() {
            self.canvas_buf.copy_from_slice(&self.saved_bg);
            self.scraps.clear();
        }

        let spd_mult = 0.85 + (self.appetite_raw as f32) / 65.0;
        self.taz_x += self.vx * spd_mult;
        self.taz_y += self.vy * spd_mult;
        if self.taz_x < 90.0 || self.taz_x > (w - 90) as f32 {
            self.vx = -self.vx;
        }
        if self.taz_y < 120.0 || self.taz_y > (h - 36) as f32 {
            self.vy = -self.vy;
        }

        // Chew bite marks into the live Windows desktop along Taz's path!
        let chew_period = (18 - (self.appetite_raw / 8)).max(5) as u32;
        if self.tick % chew_period == 0 {
            let bx = self.taz_x as i32 + ctx.rng.rand_mod(32) - 16;
            let by = self.taz_y as i32 - 36 + ctx.rng.rand_mod(24) - 12;
            let br = 14 + ctx.rng.rand_mod(12);
            self.chew_desktop_hole(w, h, bx, by, br);
            if self.scraps.len() >= 18 {
                self.scraps.remove(0);
            }
            self.scraps.push(ChompedScrap {
                x: bx + ctx.rng.rand_mod(30) - 15,
                y: by + ctx.rng.rand_mod(24) - 12,
                sprite_idx: 63 + (ctx.rng.rand_mod(5) as usize),
            });
            if self.tick % (chew_period * 3) == 0 {
                let sfx = TAZ_VOICES[3 + (ctx.rng.rand_mod(3) as usize)];
                looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, sfx);
            }
        }

        // Copy chewed Windows desktop canvas to screen surface
        ctx.surface.pixels_mut().copy_from_slice(&self.canvas_buf);

        let Some(anim) = &self.anim else {
            return AdResult::NoError;
        };

        // Draw spit-out chomped scraps (`w2=63..67`)
        for scrap in &self.scraps {
            if let Some(sp) = anim.sprites.get(scrap.sprite_idx) {
                sp.blit(ctx.surface, scrap.x, scrap.y);
            }
        }

        // Advance Taz walking/chewing (`0..=94`) and Taz spinning tornado (`96..=121`)
        self.walk_frame = advance_filtered_range(anim, self.walk_frame, 0, 94, 80, 70, 170, 160);
        self.spin_frame = advance_filtered_range(anim, self.spin_frame, 96, 121, 80, 88, 120, 115);

        anim.draw_anchored_bottom(
            ctx.surface,
            self.walk_frame,
            self.taz_x as i32,
            self.taz_y as i32,
            1,
            self.vx < 0.0,
        );

        anim.draw_anchored_bottom(
            ctx.surface,
            self.spin_frame,
            w - (self.taz_x as i32).clamp(110, w - 110),
            h - 38,
            1,
            false,
        );

        if self.tick % 75 == 0 {
            let vid = TAZ_VOICES[(self.tick as usize / 75) % TAZ_VOICES.len()];
            looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, vid);
        }

        AdResult::NoError
    }
}
