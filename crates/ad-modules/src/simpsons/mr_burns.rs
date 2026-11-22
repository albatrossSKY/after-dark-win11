//! *Mr. Burns* — 1994 *The Simpsons* After Dark 3.0 Module.
//!
//! Montgomery Burns and Waylon Smithers work their way across your desktop
//! (complete with scheming, pacing, vault doors, and Smithers daydreaming of
//! Mount Burns-more!) across all **1,575 authentic `OFst/OFtb #14000..#14001`
//! compound animation frames** with all 11 digitized Burns & Smithers voice clips.

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use super::{
    CompoundAnim, MOD_MR_BURNS, SND_BURNS_BACK, SND_BURNS_DSGS, SND_BURNS_EXCELLENT,
    SND_BURNS_JINY, SND_BURNS_LAYB, SND_BURNS_LOLY, SND_BURNS_LOOK, SND_BURNS_SLUG, SND_POUND_DOOR,
    SND_RADIA_BURN, SND_SLIDE_DOOR, SND_SMITHERS_MBR2, SND_SMITHERS_MMMM, SND_SMITHERS_YESR,
    SND_VAULT_DOOR, SimpsonsPack, restore_or_clear,
};

const BURNS_VOICES: &[i16] = &[
    SND_BURNS_EXCELLENT,
    SND_BURNS_BACK,
    SND_BURNS_LOOK,
    SND_BURNS_DSGS,
    SND_BURNS_JINY,
    SND_BURNS_SLUG,
    SND_BURNS_LAYB,
    SND_BURNS_LOLY,
];

const SMITHERS_VOICES: &[i16] = &[SND_SMITHERS_YESR, SND_SMITHERS_MMMM, SND_SMITHERS_MBR2];

const BURNS_SFX: &[i16] = &[
    SND_VAULT_DOOR,
    SND_SLIDE_DOOR,
    SND_POUND_DOOR,
    SND_RADIA_BURN,
];

pub struct MrBurnsModule {
    anim: Option<CompoundAnim>,
    saved_bg: Vec<u32>,
    clear_screen: bool,
    frame_idx: usize,
    cam_x: f32,
    cam_y: f32,
    tick: usize,
    scale: i32,
}

impl MrBurnsModule {
    pub fn new() -> Self {
        Self {
            anim: None,
            saved_bg: Vec::new(),
            clear_screen: false,
            frame_idx: 0,
            cam_x: 160.0,
            cam_y: 40.0,
            tick: 0,
            scale: 1,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "simpsons_mr_burns".to_string(),
            name: "Mr. Burns".to_string(),
            credit: "By Matt Small and Peter Kemmer.\nSoftware © 1994 Berkeley Systems, Inc.\nThe Simpsons ™ & © Twentieth Century Fox.".to_string(),
            about: "Get back to work! Montgomery Burns and Waylon Smithers prowl across your desktop in 1,575 animated frames with authentic voice clips — Excellent!".to_string(),
            controls: [
                AdControl::Checkbox {
                    title: "Clear Screen First".to_string(),
                    default_checked: false,
                },
                AdControl::None,
                AdControl::None,
                AdControl::None,
            ],
            target_frame_ms: 68,
            filename: "MRBURNS.AD".to_string(),
        }
    }

    fn draw_scene(&mut self, surface: &mut ad_sdk::canvas::AdSurface) {
        restore_or_clear(surface, &self.saved_bg, self.clear_screen, 0x0016_1C24);

        let Some(anim) = &self.anim else {
            return;
        };
        if anim.frames.is_empty() {
            return;
        }
        let fi = self.frame_idx % anim.frames.len();
        let cf = &anim.frames[fi];

        // Compute current frame center in stage coordinates & smoothly track it so Burns/Smithers never clip off-screen
        let target_cx = ((cf.left + cf.right) / 2 + cf.dx) as f32;
        let target_cy = ((cf.top + cf.bottom) / 2 + cf.dy) as f32;
        if (target_cx - self.cam_x).abs() > 140.0 || (target_cy - self.cam_y).abs() > 120.0 {
            self.cam_x = target_cx;
            self.cam_y = target_cy;
        } else {
            self.cam_x += (target_cx - self.cam_x) * 0.14;
            self.cam_y += (target_cy - self.cam_y) * 0.14;
        }

        let ox = surface.width / 2 - (self.cam_x as i32) * self.scale;
        let oy = surface.height / 2 - (self.cam_y as i32) * self.scale;
        anim.draw_stage_frame(surface, fi, ox, oy, self.scale);
    }
}

impl Default for MrBurnsModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for MrBurnsModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        if self.anim.is_none() {
            self.anim = Some(CompoundAnim::load(MOD_MR_BURNS, 14000));
        }
        self.saved_bg = ctx.surface.pixels().to_vec();
        self.clear_screen = ctx.module.raw_control_value[0] != 0;
        self.scale = if ctx.surface.width >= 1000 && ctx.surface.height >= 640 {
            2
        } else {
            1
        };

        let total = self.anim.as_ref().map(|a| a.frames.len()).unwrap_or(1).max(1);
        // Pick an iconic starting vignette (Burns scheming, Smithers Mount Rushmore, etc.)
        let starts = [0usize, 260, 520, 760, 910, 1180];
        self.frame_idx = starts[ctx.rng.rand_mod(starts.len() as i32) as usize] % total;
        if let Some(cf) = self.anim.as_ref().and_then(|a| a.frames.get(self.frame_idx)) {
            self.cam_x = ((cf.left + cf.right) / 2 + cf.dx) as f32;
            self.cam_y = ((cf.top + cf.bottom) / 2 + cf.dy) as f32;
        }
        self.tick = 0;

        SimpsonsPack::global().play_voice(ctx.sound, ctx.system.sound_enabled, SND_BURNS_EXCELLENT);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.draw_scene(ctx.surface);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.tick = self.tick.wrapping_add(1);
        let pack = SimpsonsPack::global();

        if let Some(anim) = &self.anim {
            if !anim.frames.is_empty() {
                self.frame_idx = (self.frame_idx + 1) % anim.frames.len();
            }
        }

        if self.tick % 72 == 36 {
            let clip = match ctx.rng.rand_mod(10) {
                0..=5 => BURNS_VOICES[ctx.rng.rand_mod(BURNS_VOICES.len() as i32) as usize],
                6..=7 => SMITHERS_VOICES[ctx.rng.rand_mod(SMITHERS_VOICES.len() as i32) as usize],
                _ => BURNS_SFX[ctx.rng.rand_mod(BURNS_SFX.len() as i32) as usize],
            };
            pack.play_voice(ctx.sound, ctx.system.sound_enabled, clip);
        }

        self.draw_scene(ctx.surface);
        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        self.saved_bg.clear();
        AdResult::NoError
    }
}
