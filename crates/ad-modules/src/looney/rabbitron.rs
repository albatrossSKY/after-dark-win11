//! "Rabbitron" — Classic 1995 *Looney Tunes* After Dark 3.0 module.
//!
//! Full-widescreen retro arcade arena where Bugs Bunny and Elmer Fudd battle
//! across perimeter doors, diagonal train tracks, pies, and live arcade high
//! scores (`OFst #1000`, smoothly scaled for HD/4K monitors) with Liszt's
//! *Hungarian Rhapsody #2* (`#120`) or *Can-Can* (`#50`) and cast voices.

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::looney::{
    BUGS_VOICES, MOD_RABBITRON, SONG_CAN_CAN, SONG_HUNGARIAN_RHAPSODY, advance_filtered_range,
    load_anim, looney_pack,
};
use crate::simpsons::{CompoundAnim, music_loops_from_slider};

pub struct RabbitronModule {
    music_raw: i32,
    anim: Option<CompoundAnim>,
    bugs_frame: usize,
    elmer_frame: usize,
    tick: u32,
}

impl RabbitronModule {
    pub fn new() -> Self {
        Self {
            music_raw: 25,
            anim: None,
            bugs_frame: 25,
            elmer_frame: 200,
            tick: 0,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "looney_rabbitron".to_string(),
            name: "Rabbitron".to_string(),
            filename: "RABBITRN.AD".to_string(),
            credit: "By Tom Wuttke & Tim Sniffen.\nSoftware © 1995 Berkeley Systems, Inc.\nLooney Tunes ™ & © Warner Bros.".to_string(),
            about: "Bugs and Elmer are at it again! This time they're playing the game of life, complete with doors, train tracks, pies, and scores. As always, Bugs wins!".to_string(),
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
            self.anim = Some(load_anim(MOD_RABBITRON, 1000));
        }
    }
}

impl Default for RabbitronModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for RabbitronModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();
        self.music_raw = ctx.module.raw_control_value[0].clamp(0, 100);
        self.tick = 0;
        self.bugs_frame = 25;
        self.elmer_frame = 200;
        ctx.surface.pixels_mut().fill(0x0016_1C2E);

        if let Some(loops) = music_loops_from_slider(self.music_raw) {
            let song = if ctx.rng.rand_mod(2) == 0 {
                SONG_HUNGARIAN_RHAPSODY
            } else {
                SONG_CAN_CAN
            };
            looney_pack().play_music(ctx.sound, ctx.system.sound_enabled, song, loops);
        }
        looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, BUGS_VOICES[5]);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.surface.pixels_mut().fill(0x0016_1C2E);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();
        self.tick = self.tick.wrapping_add(1);

        let w = ctx.surface.width;
        let h = ctx.surface.height;
        let sf = (h as f32 / 480.0).clamp(1.0, 3.6);
        let pad = (12.0 * sf).round() as i32;
        ctx.surface.pixels_mut().fill(0x0014_1A2C);

        let Some(anim) = &self.anim else {
            return AdResult::NoError;
        };

        // 1. Arcade Scoreboard header banners (`w2=213` left + `w2=214` right), scaled proportionally!
        if let (Some(b_left), Some(b_right)) = (anim.sprites.get(213), anim.sprites.get(214)) {
            let bsf = sf.min((w as f32 * 0.44) / (b_left.w.max(b_right.w).max(1) as f32));
            let lw = (b_left.w as f32 * bsf).round() as i32;
            let lh = (b_left.h as f32 * bsf).round() as i32;
            let rw = (b_right.w as f32 * bsf).round() as i32;
            let rh = (b_right.h as f32 * bsf).round() as i32;
            b_left.blit_rect(ctx.surface, pad, pad / 2, lw, lh, false, false, false, false);
            b_right.blit_rect(ctx.surface, w - rw - pad, pad / 2, rw, rh, false, false, false, false);
        }

        // 2. Perimeter doors (`w2=0` vertical door, `w2=4` horizontal door) & train track (`w2=15`)
        if let Some(track) = anim.sprites.get(15) {
            let tw = (track.w as f32 * sf).round() as i32;
            let th = (track.h as f32 * sf).round() as i32;
            track.blit_rect(ctx.surface, (w - tw) / 2, (h - th) / 2 + (16.0 * sf) as i32, tw, th, false, false, true, false);
        }
        if let Some(vdoor) = anim.sprites.first() {
            let vw = (vdoor.w as f32 * sf).round() as i32;
            let vh = (vdoor.h as f32 * sf).round() as i32;
            vdoor.blit_rect(ctx.surface, pad, h / 2 - vh / 2, vw, vh, false, false, true, false);
            vdoor.blit_rect(ctx.surface, w - vw - pad, h / 2 - vh / 2, vw, vh, false, false, true, false);
        }
        if let Some(hdoor) = anim.sprites.get(4) {
            let hw = (hdoor.w as f32 * sf).round() as i32;
            let hh = (hdoor.h as f32 * sf).round() as i32;
            hdoor.blit_rect(ctx.surface, w / 2 - hw / 2, h - hh - pad / 2, hw, hh, false, false, true, false);
        }
        if let Some(train) = anim.sprites.get(14) {
            let span = (260.0 * sf).round().max(120.0) as i32;
            let tpos = ((self.tick as f32 * 3.0 * sf) as i32) % span;
            train.blit_transformed_f(
                ctx.surface,
                w / 2 - span / 2 + tpos,
                h / 2 - (70.0 * sf) as i32 + (tpos * 2) / 3,
                sf * 1.2,
                false,
                false,
                true,
                false,
            );
        }

        // 3. Smoothly scaled Bugs Bunny & Elmer Fudd compound animations (`OFst #1000`)
        let n_frames = anim.frames.len().saturating_sub(1);
        self.bugs_frame = advance_filtered_range(anim, self.bugs_frame, 1, 390.min(n_frames), 45, 55, 165, 175);
        self.elmer_frame = advance_filtered_range(anim, self.elmer_frame, 150, n_frames, 45, 55, 165, 175);

        let char_sf = (sf * 1.35).clamp(1.1, 4.0);
        let ground_y = h - (82.0 * sf).round() as i32;
        anim.draw_anchored_bottom_f(ctx.surface, self.bugs_frame, w / 2 - (w / 5), ground_y, char_sf, false, true, false);
        anim.draw_anchored_bottom_f(ctx.surface, self.elmer_frame, w / 2 + (w / 5), ground_y, char_sf, false, true, false);

        if self.tick % 80 == 0 {
            let vid = BUGS_VOICES[(self.tick as usize / 80) % BUGS_VOICES.len()];
            looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, vid);
        }

        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        AdResult::NoError
    }
}
