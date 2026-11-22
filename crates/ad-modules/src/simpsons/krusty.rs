//! *Krusty* — 1994 *The Simpsons* After Dark 3.0 Module.
//!
//! Everybody strap on your nicotine patches — it's Krusty the Clown!
//! Plays all 1,110 authentic `OFst/OFtb #13000..#13001` stage-show animation
//! frames (juggling miniature Krusty dolls, pratfalls, laughs, spotlight acts)
//! with audience reactions scaled by the `Success:` slider (from crickets &
//! coughs at Washed-up to drum rolls & cheers at Artiste!).

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use super::{
    CompoundAnim, MOD_KRUSTY, SND_CHEERS, SND_COUGH, SND_CRICKET, SND_DRUM_ROLL, SND_HORN_HONK,
    SND_KRUSTY_CORP, SND_KRUSTY_GRNT, SND_KRUSTY_GRT1, SND_KRUSTY_GRT4, SND_KRUSTY_HELL,
    SND_KRUSTY_KIDS, SND_KRUSTY_LAGH, SND_KRUSTY_LVES, SND_KRUSTY_WHO, SND_KRUSTY_YEH,
    SND_SPOTLIGHT, SimpsonsPack, fill_rect_px,
};

const KRUSTY_VOICES: &[i16] = &[
    SND_KRUSTY_HELL,
    SND_KRUSTY_KIDS,
    SND_KRUSTY_LAGH,
    SND_KRUSTY_WHO,
    SND_KRUSTY_LVES,
    SND_KRUSTY_YEH,
    SND_KRUSTY_CORP,
    SND_KRUSTY_GRNT,
    SND_KRUSTY_GRT1,
    SND_KRUSTY_GRT4,
];

pub struct KrustyModule {
    anim: Option<CompoundAnim>,
    frame_idx: usize,
    success_level: i32,
    tick: usize,
    scale: i32,
    stage_ox: i32,
    stage_oy: i32,
}

impl KrustyModule {
    pub fn new() -> Self {
        Self {
            anim: None,
            frame_idx: 0,
            success_level: 62,
            tick: 0,
            scale: 1,
            stage_ox: 0,
            stage_oy: 0,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "simpsons_krusty".to_string(),
            name: "Krusty".to_string(),
            credit: "By Gabriel Jensen and Jeff Thomas.\nSoftware © 1994 Berkeley Systems, Inc.\nThe Simpsons ™ & © Twentieth Century Fox.".to_string(),
            about: "Everybody strap on your nicotine patches — it's Krusty the Clown! Watch Mr. Entertainment juggle, joke, and put on the show of his life across 1,110 spotlight animation frames.".to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "Success:".to_string(),
                    default_raw: 62,
                    labels: vec![
                        "Washed-up".into(),
                        "Lounge Lizard".into(),
                        "Entertainer".into(),
                        "Artiste".into(),
                    ],
                    thresholds: vec![0, 25, 50, 75],
                },
                AdControl::None,
                AdControl::None,
                AdControl::None,
            ],
            target_frame_ms: 68,
            filename: "KRUSTY.AD".to_string(),
        }
    }

    fn draw_stage(&self, surface: &mut ad_sdk::canvas::AdSurface) {
        let w = surface.width;
        let h = surface.height;
        fill_rect_px(surface, 0, 0, w, h, 0x0005_050A);

        let s = self.scale;
        let spot_cx = w / 2;
        let spot_cy = h / 2 + 64 * s;

        // Warm stage spotlight cone from top down to the floor oval (#13000[0])
        let cone_top = (spot_cy - 190 * s).max(0);
        let dst = surface.pixels_mut();
        for y in cone_top..spot_cy.min(h) {
            let t = (y - cone_top) as f32 / (spot_cy - cone_top).max(1) as f32;
            let half_w = (26.0 + t * 88.0) * s as f32;
            let lx = (spot_cx - half_w as i32).max(0);
            let rx = (spot_cx + half_w as i32).min(w);
            if lx < rx {
                let row = (y * w) as usize;
                let glow = 0x001E_1C14;
                dst[row + lx as usize..row + rx as usize].fill(glow);
            }
        }

        if let Some(anim) = &self.anim {
            // Authentic glowing oval spotlight sprite on stage floor (#13000[0])
            if let Some(oval) = anim.sprites.first() {
                oval.blit_scaled(
                    surface,
                    spot_cx - (oval.w * s) / 2,
                    spot_cy - (oval.h * s) / 2,
                    s,
                );
            }
            if !anim.frames.is_empty() {
                let fi = self.frame_idx % anim.frames.len();
                anim.draw_stage_frame(surface, fi, self.stage_ox, self.stage_oy, s);
            }
        }
    }
}

impl Default for KrustyModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for KrustyModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        if self.anim.is_none() {
            self.anim = Some(CompoundAnim::load(MOD_KRUSTY, 13000));
        }
        self.success_level = ctx.module.raw_control_value[0].clamp(0, 100);
        self.scale = if ctx.surface.width >= 900 && ctx.surface.height >= 640 {
            2
        } else {
            1
        };
        // Krusty's 1,110 stage frames live inside bbox (233,35)..(469,290), center ~(346, 178)
        self.stage_ox = ctx.surface.width / 2 - 346 * self.scale;
        self.stage_oy = ctx.surface.height / 2 - 156 * self.scale;

        let total = self.anim.as_ref().map(|a| a.frames.len()).unwrap_or(1).max(1);
        // Start right at an entertaining act (e.g. juggling / comedy routine)
        self.frame_idx = (ctx.rng.rand_mod(6) as usize * 150) % total;
        self.tick = 0;

        let pack = SimpsonsPack::global();
        pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_SPOTLIGHT);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.draw_stage(ctx.surface);
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

        // Authentic Krusty punchlines & Success-scaled audience reactions!
        if self.tick == 12 {
            pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_KRUSTY_HELL);
        } else if self.tick % 65 == 0 {
            let v = KRUSTY_VOICES[ctx.rng.rand_mod(KRUSTY_VOICES.len() as i32) as usize];
            pack.play_voice(ctx.sound, ctx.system.sound_enabled, v);
        } else if self.tick % 65 == 34 {
            let reaction = if self.success_level < 25 {
                if ctx.rng.rand_mod(2) == 0 {
                    SND_CRICKET
                } else {
                    SND_COUGH
                }
            } else if self.success_level < 50 {
                if ctx.rng.rand_mod(2) == 0 {
                    SND_COUGH
                } else {
                    SND_HORN_HONK
                }
            } else if self.success_level < 75 {
                if ctx.rng.rand_mod(2) == 0 {
                    SND_DRUM_ROLL
                } else {
                    SND_CHEERS
                }
            } else {
                SND_CHEERS
            };
            pack.play_voice(ctx.sound, ctx.system.sound_enabled, reaction);
        }

        self.draw_stage(ctx.surface);
        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        AdResult::NoError
    }
}
