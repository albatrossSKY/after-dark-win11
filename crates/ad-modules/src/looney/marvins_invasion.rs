//! "Marvin's Invasion" — Classic 1995 *Looney Tunes* After Dark 3.0 module.
//!
//! Marvin the Martian, Instant Martians, and Duck Dodgers in the 24½th Century
//! (`OFst #6000`) smoothly scaled for modern widescreen HD/4K monitors across
//! your live Windows desktop (or scaled space tile backdrop when checked).

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::looney::{
    MARVIN_VOICES, MOD_MARVIN, advance_filtered_range, load_anim, looney_pack,
};
use crate::simpsons::{CompoundAnim, restore_or_clear};

struct MartianActor {
    x: f32,
    y: f32,
    vx: f32,
    frame_idx: usize,
}

pub struct MarvinsInvasionModule {
    martians_raw: i32,
    tiled_bg: bool,
    saved_bg: Vec<u32>,
    anim: Option<CompoundAnim>,
    actors: Vec<MartianActor>,
    tick: u32,
}

impl MarvinsInvasionModule {
    pub fn new() -> Self {
        Self {
            martians_raw: 50,
            tiled_bg: false,
            saved_bg: Vec::new(),
            anim: None,
            actors: Vec::new(),
            tick: 0,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "looney_marvins_invasion".to_string(),
            name: "Marvin's Invasion".to_string(),
            filename: "MARVIN.AD".to_string(),
            credit: "By Tim Sniffen & Peter A. Kemmer.\nSoftware © 1995 Berkeley Systems, Inc.\nLooney Tunes ™ & © Warner Bros.".to_string(),
            about: "It seems that your computer is obstructing Marvin the Martian's view of Venus! He has taken it upon himself to invade your screen with Instant Martians and his Illudium Q-36 Explosive Space Modulator.".to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "# of Martians:".to_string(),
                    default_raw: 50,
                    labels: vec!["Few".into(), "Several".into(), "Many".into()],
                    thresholds: vec![0, 33, 66],
                },
                AdControl::Checkbox {
                    title: "Tiled Background".to_string(),
                    default_checked: false,
                },
                AdControl::None,
                AdControl::None,
            ],
            target_frame_ms: 68,
        }
    }

    fn ensure_loaded(&mut self) {
        if self.anim.is_none() {
            self.anim = Some(load_anim(MOD_MARVIN, 6000));
        }
    }

    fn desired_count(&self) -> usize {
        (2 + (self.martians_raw as usize * 5) / 100).clamp(2, 7)
    }
}

impl Default for MarvinsInvasionModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for MarvinsInvasionModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();
        self.saved_bg = ctx.surface.pixels().to_vec();
        self.martians_raw = ctx.module.raw_control_value[0].clamp(0, 100);
        self.tiled_bg = ctx.module.raw_control_value[1] != 0;
        self.tick = 0;
        self.actors.clear();
        let w = ctx.surface.width.max(320);
        let h = ctx.surface.height.max(240);
        let sf = (h as f32 / 480.0).clamp(1.0, 3.2);
        let n_frames = self
            .anim
            .as_ref()
            .map(|a| a.frames.len())
            .unwrap_or(574)
            .max(1);
        let count = self.desired_count();
        for i in 0..count {
            let x = (w as f32 * 0.14) + ((i as f32) / count.max(1) as f32) * (w as f32 * 0.72);
            let y = (h as f32 * 0.30) + (((i * 113) % 100) as f32 / 100.0) * (h as f32 * 0.62);
            self.actors.push(MartianActor {
                x,
                y,
                vx: (if i % 2 == 0 { 1.8 } else { -1.8 }) * sf,
                frame_idx: (i * n_frames) / count.max(1),
            });
        }
        restore_or_clear(ctx.surface, &self.saved_bg, false, 0x0006_0A18);
        looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, MARVIN_VOICES[1]);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        restore_or_clear(ctx.surface, &self.saved_bg, false, 0x0006_0A18);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();
        self.tick = self.tick.wrapping_add(1);

        let w = ctx.surface.width;
        let h = ctx.surface.height;
        let sf = (h as f32 / 480.0).clamp(1.0, 3.2);
        restore_or_clear(ctx.surface, &self.saved_bg, false, 0x0006_0A18);

        let Some(anim) = &self.anim else {
            return AdResult::NoError;
        };

        if self.tiled_bg {
            if let Some(tile) = anim.sprites.get(2) {
                let tw = (tile.w as f32 * sf).round().max(32.0) as i32;
                let th = (tile.h as f32 * sf).round().max(32.0) as i32;
                let mut ty = 0;
                while ty < h {
                    let mut tx = 0;
                    while tx < w {
                        tile.blit_rect(ctx.surface, tx, ty, tw, th, false, false, false, false);
                        tx += tw;
                    }
                    ty += th;
                }
            }
        }

        let n_frames = anim.frames.len().saturating_sub(1);
        let margin = 76.0 * sf;
        let char_sf = (sf * 1.3).clamp(1.05, 3.6);
        for actor in &mut self.actors {
            actor.frame_idx =
                advance_filtered_range(anim, actor.frame_idx, 0, n_frames, 44, 52, 240, 240);
            actor.x += actor.vx;
            if actor.x < margin || actor.x > w as f32 - margin {
                actor.vx = -actor.vx;
            }
            anim.draw_anchored_bottom_f(
                ctx.surface,
                actor.frame_idx,
                actor.x as i32,
                actor.y as i32,
                char_sf,
                actor.vx < 0.0,
                true,
                false,
            );
        }

        if self.tick % 80 == 0 {
            let vid = MARVIN_VOICES[(self.tick as usize / 80) % MARVIN_VOICES.len()];
            looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, vid);
        }

        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        AdResult::NoError
    }
}
