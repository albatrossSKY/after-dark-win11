//! "Putty Tat Splat!" — Classic 1995 *Looney Tunes* After Dark 3.0 module.
//!
//! Tweety Bird has taken a swim in *Dr. Jekyll's Formula*! Every time Sylvester
//! the Cat stalks Tweety across your Windows desktop, Tweety transforms into a
//! giant Hyde-Tweety monster (`OFst #9000`, 557 compound frames across
//! `RLEP #9000..#9001`)—or Granny wallops Sylvester with her umbrella
//! (`TWEETY_VOICES` + `SONG_PUTTY_TAT` `#110`).

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::looney::{
    MOD_PUTTY_TAT, SONG_PUTTY_TAT, TWEETY_VOICES, advance_filtered_range, load_anim, looney_pack,
};
use crate::simpsons::{CompoundAnim, music_loops_from_slider, restore_or_clear};

pub struct PuttyTatModule {
    clear_first: bool,
    music_raw: i32,
    saved_bg: Vec<u32>,
    anim: Option<CompoundAnim>,
    tweety_frame: usize,
    sylvester_frame: usize,
    tweety_x: f32,
    sylvester_x: f32,
    tick: u32,
}

impl PuttyTatModule {
    pub fn new() -> Self {
        Self {
            clear_first: false,
            music_raw: 20,
            saved_bg: Vec::new(),
            anim: None,
            tweety_frame: 12,
            sylvester_frame: 220,
            tweety_x: 200.0,
            sylvester_x: 380.0,
            tick: 0,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "looney_putty_tat".to_string(),
            name: "Putty Tat Splat!".to_string(),
            filename: "PUTTYTAT.AD".to_string(),
            credit: "By Jarir Maani & Mark Palange.\nSoftware © 1995 Berkeley Systems, Inc.\nLooney Tunes ™ & © Warner Bros.".to_string(),
            about: "Tweety's undergone a bit of a transformation, thanks to a swim in Dr. Jekyll's secret formula! Every time Sylvester stalks him across your desktop, things get monstrous.".to_string(),
            controls: [
                AdControl::Checkbox {
                    title: "Clear Screen First".to_string(),
                    default_checked: false,
                },
                AdControl::LabeledSlider {
                    title: "Music:".to_string(),
                    default_raw: 20,
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
            ],
            target_frame_ms: 68,
        }
    }

    fn ensure_loaded(&mut self) {
        if self.anim.is_none() {
            self.anim = Some(load_anim(MOD_PUTTY_TAT, 9000));
        }
    }
}

impl Default for PuttyTatModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for PuttyTatModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();
        self.saved_bg = ctx.surface.pixels().to_vec();
        self.clear_first = ctx.module.raw_control_value[0] != 0;
        self.music_raw = ctx.module.raw_control_value[1].clamp(0, 100);
        self.tick = 0;
        self.tweety_frame = 12;
        self.sylvester_frame = 220;
        self.tweety_x = 180.0;
        self.sylvester_x = 370.0;
        restore_or_clear(ctx.surface, &self.saved_bg, self.clear_first, 0x0012_1A28);

        if let Some(loops) = music_loops_from_slider(self.music_raw.max(25)) {
            looney_pack().play_music(ctx.sound, ctx.system.sound_enabled, SONG_PUTTY_TAT, loops);
        }
        looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, TWEETY_VOICES[8]);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        restore_or_clear(ctx.surface, &self.saved_bg, self.clear_first, 0x0012_1A28);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();
        self.tick = self.tick.wrapping_add(1);

        let w = ctx.surface.width;
        let h = ctx.surface.height;
        // Restore the user's real Windows desktop (or solid backdrop if Clear Screen First is checked)
        restore_or_clear(ctx.surface, &self.saved_bg, self.clear_first, 0x0012_1A28);

        let Some(anim) = &self.anim else {
            return AdResult::NoError;
        };

        // Dr. Jekyll's Formula beaker (`w2=20`) on the right and Granny (`w2=67`) on the left
        if let Some(formula) = anim.sprites.get(20) {
            formula.blit(ctx.surface, w - formula.w - 36, h - formula.h - 32);
        }
        if let Some(granny) = anim.sprites.get(67) {
            granny.blit(ctx.surface, 28, h - granny.h - 24);
        }

        // Advance Tweety (`12..=205`) and Sylvester (`180..=556`), filtering out tiny icon/splat sub-frames
        self.tweety_frame =
            advance_filtered_range(anim, self.tweety_frame, 12, 205, 26, 38, 220, 220);
        self.sylvester_frame =
            advance_filtered_range(anim, self.sylvester_frame, 180, 556, 38, 45, 220, 220);

        self.tweety_x += 1.8;
        self.sylvester_x += 2.2;
        if self.tweety_x > (w - 90) as f32 {
            self.tweety_x = 120.0;
        }
        if self.sylvester_x > (w - 70) as f32 {
            self.sylvester_x = 140.0;
        }

        let ground_y = h - 28;
        anim.draw_anchored_bottom(
            ctx.surface,
            self.tweety_frame,
            self.tweety_x as i32,
            ground_y,
            1,
            false,
        );
        anim.draw_anchored_bottom(
            ctx.surface,
            self.sylvester_frame,
            self.sylvester_x as i32,
            ground_y,
            1,
            false,
        );

        if self.tick % 85 == 0 {
            let vid = TWEETY_VOICES[(self.tick as usize / 85) % TWEETY_VOICES.len()];
            looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, vid);
        }

        AdResult::NoError
    }
}
