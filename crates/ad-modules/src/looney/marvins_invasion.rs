//! "Marvin's Invasion" — Classic 1995 *Looney Tunes* After Dark 3.0 module.
//!
//! Your computer is obstructing Marvin the Martian's view of Venus! Marvin
//! beams down onto your Windows desktop through glowing portal rings, drops
//! Instant Martian pills, and clashes with Duck Dodgers in the 24½th Century
//! (`OFst #6000`, 574 compound frames across `RLEP #6000..#6001`, plus `MARVIN_VOICES`).

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
        let n_frames = self
            .anim
            .as_ref()
            .map(|a| a.frames.len())
            .unwrap_or(574)
            .max(1);
        let count = self.desired_count();
        for i in 0..count {
            self.actors.push(MartianActor {
                x: (90 + (i * (w as usize - 180)) / count.max(1)) as f32,
                y: (160 + (i * 85) % (h as usize - 190).max(1)) as f32,
                vx: if i % 2 == 0 { 1.6 } else { -1.6 },
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
        restore_or_clear(ctx.surface, &self.saved_bg, false, 0x0006_0A18);

        let Some(anim) = &self.anim else {
            return AdResult::NoError;
        };

        if self.tiled_bg {
            if let Some(tile) = anim.sprites.get(2) {
                let tw = tile.w.max(32);
                let th = tile.h.max(32);
                let mut ty = 0;
                while ty < h {
                    let mut tx = 0;
                    while tx < w {
                        tile.blit(ctx.surface, tx, ty);
                        tx += tw;
                    }
                    ty += th;
                }
            }
        }

        let n_frames = anim.frames.len().saturating_sub(1);
        for actor in &mut self.actors {
            actor.frame_idx =
                advance_filtered_range(anim, actor.frame_idx, 0, n_frames, 44, 52, 240, 240);
            actor.x += actor.vx;
            if actor.x < 70.0 || actor.x > (w - 70) as f32 {
                actor.vx = -actor.vx;
            }
            anim.draw_anchored_bottom(
                ctx.surface,
                actor.frame_idx,
                actor.x as i32,
                actor.y as i32,
                1,
                actor.vx < 0.0,
            );
        }

        if self.tick % 80 == 0 {
            let vid = MARVIN_VOICES[(self.tick as usize / 80) % MARVIN_VOICES.len()];
            looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, vid);
        }

        AdResult::NoError
    }
}
