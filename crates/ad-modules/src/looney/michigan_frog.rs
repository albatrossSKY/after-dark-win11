//! "Michigan J. Frog" — Classic 1995 *Looney Tunes* After Dark 3.0 module.
//!
//! Inspired by Chuck Jones's 1955 classic *"One Froggy Evening"*, Michigan J. Frog
//! dons his top hat and cane under a glowing stage spotlight (`OFst #4000`, 482
//! compound frames across `RLEP #4000..#4001`) to high-step and ragtime-dance
//! (`SONG_MICHIGAN_FROG` `#30` + `FROG_VOICES`).

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::looney::{
    FROG_VOICES, MOD_MICHIGAN_FROG, SONG_MICHIGAN_FROG, load_anim, looney_pack,
};
use crate::simpsons::{CompoundAnim, draw_line_px, music_loops_from_slider};

pub struct MichiganFrogModule {
    music_raw: i32,
    anim: Option<CompoundAnim>,
    frame_idx: usize,
    frog_x: f32,
    vx: f32,
    tick: u32,
}

impl MichiganFrogModule {
    pub fn new() -> Self {
        Self {
            music_raw: 25,
            anim: None,
            frame_idx: 120,
            frog_x: 320.0,
            vx: 1.8,
            tick: 0,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "looney_michigan_frog".to_string(),
            name: "Michigan J. Frog".to_string(),
            filename: "MICHFROG.AD".to_string(),
            credit: "By Tim Sniffen & Mark Palange.\nSoftware © 1995 Berkeley Systems, Inc.\nLooney Tunes ™ & © Warner Bros.".to_string(),
            about: "Michigan J. Frog made his sole appearance in the 1955 cartoon 'One Froggy Evening.' Watch him high-step in his top hat and cane under the spotlight!".to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "Music:".to_string(),
                    default_raw: 25,
                    labels: vec![
                        "Never".into(),
                        "Once".into(),
                        "Twice".into(),
                        "Thrice".into(),
                        "Always".into(),
                    ],
                    thresholds: vec![0, 20, 40, 60, 80],
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
            self.anim = Some(load_anim(MOD_MICHIGAN_FROG, 4000));
        }
    }
}

impl Default for MichiganFrogModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for MichiganFrogModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();
        self.music_raw = ctx.module.raw_control_value[0].clamp(0, 100);
        self.tick = 0;
        self.frame_idx = 120;
        self.frog_x = (ctx.surface.width.max(320) / 2) as f32;
        self.vx = 1.8;
        ctx.surface.pixels_mut().fill(0x0006_0812);

        if let Some(loops) = music_loops_from_slider(self.music_raw.max(25)) {
            looney_pack().play_music(
                ctx.sound,
                ctx.system.sound_enabled,
                SONG_MICHIGAN_FROG,
                loops,
            );
        }
        looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, FROG_VOICES[2]);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.surface.pixels_mut().fill(0x0006_0812);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();
        self.tick = self.tick.wrapping_add(1);

        let w = ctx.surface.width;
        let h = ctx.surface.height;
        ctx.surface.pixels_mut().fill(0x0006_0812);

        let stage_y = h - 78;
        let fx = self.frog_x as i32;
        for dy in 0..stage_y {
            let half_w = 18 + (dy * 64) / stage_y.max(1);
            let col = if dy % 2 == 0 {
                0x0018_1C2E
            } else {
                0x0012_1624
            };
            draw_line_px(ctx.surface, fx - half_w, dy, fx + half_w, dy, col, 1);
        }
        crate::looney::fill_box_px(ctx.surface, 0, stage_y, w, h - stage_y, 0x0024_1812);
        draw_line_px(ctx.surface, 0, stage_y, w - 1, stage_y, 0x0078_5030, 2);

        let Some(anim) = &self.anim else {
            return AdResult::NoError;
        };

        let n_frames = anim.frames.len().saturating_sub(1);
        self.frame_idx = crate::looney::advance_filtered_range(
            anim,
            self.frame_idx,
            5,
            n_frames,
            60,
            50,
            220,
            220,
        );
        self.frog_x += self.vx;
        if self.frog_x < 110.0 || self.frog_x > (w - 110) as f32 {
            self.vx = -self.vx;
        }

        anim.draw_anchored_bottom(ctx.surface, self.frame_idx, fx, stage_y + 18, 1, false);

        if self.tick % 110 == 0 {
            let vid = FROG_VOICES[(self.tick as usize / 110) % FROG_VOICES.len()];
            looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, vid);
        }

        AdResult::NoError
    }
}
