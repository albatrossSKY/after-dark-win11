//! "Putty Tat Splat!" — Classic 1995 *Looney Tunes* After Dark 3.0 module.
//!
//! Tweety Bird, Sylvester the Cat, Granny, and Dr. Jekyll's Formula (`OFst #9000`)
//! smoothly scaled for modern HD/4K monitors across your live Windows desktop!

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
            music_raw: 25,
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
        let w = ctx.surface.width.max(320);
        self.tweety_x = w as f32 * 0.30;
        self.sylvester_x = w as f32 * 0.62;
        restore_or_clear(ctx.surface, &self.saved_bg, self.clear_first, 0x0012_1A28);

        if let Some(loops) = music_loops_from_slider(self.music_raw) {
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
        let sf = (h as f32 / 480.0).clamp(1.0, 3.2);
        let char_sf = (sf * 1.35).clamp(1.1, 3.8);
        restore_or_clear(ctx.surface, &self.saved_bg, self.clear_first, 0x0012_1A28);

        let Some(anim) = &self.anim else {
            return AdResult::NoError;
        };

        // Dr. Jekyll's Formula beaker (`w2=20`) on right & Granny (`w2=67`) on left, smoothly scaled!
        let ground_y = h - (24.0 * sf).round() as i32;
        if let Some(formula) = anim.sprites.get(20) {
            let fw = (formula.w as f32 * char_sf).round() as i32;
            let fh = (formula.h as f32 * char_sf).round() as i32;
            formula.blit_rect(ctx.surface, w - fw - (28.0 * sf) as i32, ground_y - fh, fw, fh, false, false, true, false);
        }
        if let Some(granny) = anim.sprites.get(67) {
            let gw = (granny.w as f32 * char_sf).round() as i32;
            let gh = (granny.h as f32 * char_sf).round() as i32;
            granny.blit_rect(ctx.surface, (24.0 * sf) as i32, ground_y - gh, gw, gh, false, false, true, false);
        }

        // Advance Tweety (`12..=205`) and Sylvester (`180..=556`), filtering out tiny icon/splat sub-frames
        self.tweety_frame =
            advance_filtered_range(anim, self.tweety_frame, 12, 205, 26, 38, 220, 220);
        self.sylvester_frame =
            advance_filtered_range(anim, self.sylvester_frame, 180, 556, 38, 45, 220, 220);

        self.tweety_x += 2.0 * sf;
        self.sylvester_x += 2.4 * sf;
        let margin = 100.0 * sf;
        if self.tweety_x > w as f32 - margin {
            self.tweety_x = margin;
        }
        if self.sylvester_x > w as f32 - margin {
            self.sylvester_x = margin * 1.25;
        }

        anim.draw_anchored_bottom_f(
            ctx.surface,
            self.tweety_frame,
            self.tweety_x as i32,
            ground_y,
            char_sf,
            false,
            true,
            false,
        );
        anim.draw_anchored_bottom_f(
            ctx.surface,
            self.sylvester_frame,
            self.sylvester_x as i32,
            ground_y,
            char_sf,
            false,
            true,
            false,
        );

        if self.tick % 85 == 0 {
            let vid = TWEETY_VOICES[(self.tick as usize / 85) % TWEETY_VOICES.len()];
            looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, vid);
        }

        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        AdResult::NoError
    }
}
