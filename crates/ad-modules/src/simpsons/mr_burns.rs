//! *Mr. Burns* — 1994 *The Simpsons* After Dark 3.0 Module.
//!
//! Montgomery Burns and Waylon Smithers work their way across your desktop
//! (vault doors, security monitor wall, scheming monologues, and Smithers
//! daydreaming!) playing curated complete multi-frame `OFst/OFtb #14000..#14001`
//! skits on a rock-steady stage camera with all 11 digitized Burns & Smithers
//! voice clips!

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

#[derive(Clone, Copy)]
struct BurnsSkit {
    start: usize,
    end: usize,
    stage_cx: f32,
    stage_cy: f32,
}

fn extract_burns_skits(anim: &CompoundAnim) -> Vec<BurnsSkit> {
    let mut runs = Vec::new();
    if anim.frames.is_empty() {
        return runs;
    }
    let mut s = 0usize;
    let push_if_skit = |runs: &mut Vec<BurnsSkit>, a: usize, b: usize| {
        let len = b - a + 1;
        // Skip isolated 2-frame lip-sync/overlay fragments; keep complete multi-frame skits & monologues!
        if len >= 12 {
            let mut min_x = i32::MAX;
            let mut max_x = i32::MIN;
            let mut min_y = i32::MAX;
            let mut max_y = i32::MIN;
            for f in &anim.frames[a..=b] {
                min_x = min_x.min(f.left + f.dx);
                max_x = max_x.max(f.right + f.dx);
                min_y = min_y.min(f.top + f.dy);
                max_y = max_y.max(f.bottom + f.dy);
            }
            // Reject outlier negative-coord calibration boxes
            if min_x >= 0 && min_y >= 0 {
                runs.push(BurnsSkit {
                    start: a,
                    end: b,
                    stage_cx: (min_x + max_x) as f32 * 0.5,
                    stage_cy: (min_y + max_y) as f32 * 0.5,
                });
            }
        }
    };
    for i in 1..anim.frames.len() {
        if anim.frames[i].fid > anim.frames[i - 1].fid + 1 {
            push_if_skit(&mut runs, s, i - 1);
            s = i;
        }
    }
    push_if_skit(&mut runs, s, anim.frames.len() - 1);
    runs
}

pub struct MrBurnsModule {
    anim: Option<CompoundAnim>,
    skits: Vec<BurnsSkit>,
    saved_bg: Vec<u32>,
    clear_screen: bool,
    skit_idx: usize,
    skit_offset: usize,
    hold_end_ticks: usize,
    tick: usize,
    scale_f: f32,
}

impl MrBurnsModule {
    pub fn new() -> Self {
        Self {
            anim: None,
            skits: Vec::new(),
            saved_bg: Vec::new(),
            clear_screen: false,
            skit_idx: 0,
            skit_offset: 0,
            hold_end_ticks: 0,
            tick: 0,
            scale_f: 1.5,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "simpsons_mr_burns".to_string(),
            name: "Mr. Burns".to_string(),
            credit: "By Matt Small and Peter Kemmer.\nSoftware © 1994 Berkeley Systems, Inc.\nThe Simpsons ™ & © Twentieth Century Fox.".to_string(),
            about: "Get back to work! Montgomery Burns and Waylon Smithers prowl across your desktop in curated animated office & vault skits with authentic voice clips — Excellent!".to_string(),
            controls: [
                AdControl::Checkbox {
                    title: "Clear Screen First".to_string(),
                    default_checked: false,
                },
                AdControl::None,
                AdControl::None,
                AdControl::None,
            ],
            target_frame_ms: 72,
            filename: "MRBURNS.AD".to_string(),
        }
    }

    fn draw_scene(&mut self, surface: &mut ad_sdk::canvas::AdSurface) {
        let has_desktop = !self.clear_screen
            && self.saved_bg.len() == surface.pixels().len()
            && self.saved_bg.iter().step_by(97).any(|&p| (p & 0x00FF_FFFF) != 0);
        if has_desktop {
            restore_or_clear(surface, &self.saved_bg, false, 0x0016_1C24);
        } else {
            let w = surface.width;
            let h = surface.height;
            let floor_y = (h as f32 * 0.72) as i32;
            let panel_w = (w / 10).max(40);
            let dst = surface.pixels_mut();
            for y in 0..h {
                let row = (y * w) as usize;
                let yt = y as f32 / h.max(1) as f32;
                for x in 0..w {
                    let (r, g, b) = if y < floor_y {
                        let seam = if (x % panel_w) < 3 { -10 } else { 0 };
                        let r = (34 + (yt * 18.0) as i32 + seam).clamp(8, 255) as u32;
                        let g = (38 + (yt * 16.0) as i32 + seam).clamp(8, 255) as u32;
                        let b = (44 + (yt * 20.0) as i32 + seam).clamp(8, 255) as u32;
                        (r, g, b)
                    } else {
                        let ft = (y - floor_y) as f32 / (h - floor_y).max(1) as f32;
                        (
                            (44.0 + ft * 16.0) as u32,
                            (28.0 + ft * 12.0) as u32,
                            (22.0 + ft * 10.0) as u32,
                        )
                    };
                    dst[row + x as usize] = (r << 16) | (g << 8) | b;
                }
            }
        }

        let Some(anim) = &self.anim else {
            return;
        };
        let Some(skit) = self.skits.get(self.skit_idx) else {
            return;
        };
        let fi = (skit.start + self.skit_offset).min(skit.end);

        // Lock camera firmly to the skit's stationary office/vault stage center so doors & walls never slide!
        let ox = surface.width as f32 * 0.5 - skit.stage_cx * self.scale_f;
        let oy = surface.height as f32 * 0.52 - skit.stage_cy * self.scale_f;
        anim.draw_stage_frame_f(surface, fi, ox, oy, self.scale_f, false, false);
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
            let loaded = CompoundAnim::load(MOD_MR_BURNS, 14000);
            self.skits = extract_burns_skits(&loaded);
            self.anim = Some(loaded);
        }
        self.saved_bg = ctx.surface.pixels().to_vec();
        self.clear_screen = ctx.module.raw_control_value[0] != 0;
        self.scale_f = (ctx.surface.height as f32 / 330.0).clamp(1.15, 3.8);

        if !self.skits.is_empty() {
            // Start with an iconic Burns & Smithers office/vault skit (skipping solo starts when possible)
            let start_min = self.skits.iter().position(|s| s.start >= 269).unwrap_or(0);
            let span = (self.skits.len() - start_min).max(1);
            self.skit_idx = start_min + (ctx.rng.rand_mod(span as i32) as usize);
        } else {
            self.skit_idx = 0;
        }
        self.skit_offset = 0;
        self.hold_end_ticks = 0;
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

        if let Some(skit) = self.skits.get(self.skit_idx).copied() {
            let skit_len = skit.end - skit.start + 1;
            if self.hold_end_ticks > 0 {
                self.hold_end_ticks -= 1;
                if self.hold_end_ticks == 0 && !self.skits.is_empty() {
                    let next = ctx.rng.rand_mod(self.skits.len() as i32) as usize;
                    self.skit_idx = if next == self.skit_idx && self.skits.len() > 1 {
                        (next + 1) % self.skits.len()
                    } else {
                        next
                    };
                    self.skit_offset = 0;
                    let clip = match ctx.rng.rand_mod(10) {
                        0..=5 => BURNS_VOICES[ctx.rng.rand_mod(BURNS_VOICES.len() as i32) as usize],
                        6..=7 => {
                            SMITHERS_VOICES[ctx.rng.rand_mod(SMITHERS_VOICES.len() as i32) as usize]
                        }
                        _ => BURNS_SFX[ctx.rng.rand_mod(BURNS_SFX.len() as i32) as usize],
                    };
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, clip);
                }
            } else if self.skit_offset + 1 >= skit_len {
                self.hold_end_ticks = 10;
            } else {
                self.skit_offset += 1;
            }
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
