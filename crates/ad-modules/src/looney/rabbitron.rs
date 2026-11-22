//! "Rabbitron" — Classic 1995 *Looney Tunes* After Dark 3.0 module.
//!
//! Bugs Bunny and Elmer Fudd play the game of life—complete with doors around
//! the perimeter of the screen, train tracks, pies, explosions, and a live
//! scoreboard (`OFst #1000`, 1,861 compound frames across `RLEP #1000..#1005`),
//! accompanied by Liszt's *Hungarian Rhapsody #2* (`#120`) or *Can-Can* (`#50`)
//! and digitized Bugs Bunny & Elmer Fudd voices (`BUGS_VOICES`).

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::looney::{
    BUGS_VOICES, MOD_RABBITRON, SONG_CAN_CAN, SONG_HUNGARIAN_RHAPSODY, load_anim, looney_pack,
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
            music_raw: 16,
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
                    default_raw: 16,
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

        if let Some(loops) = music_loops_from_slider(self.music_raw.max(25)) {
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
        ctx.surface.pixels_mut().fill(0x0016_1C2E);

        let Some(anim) = &self.anim else {
            return AdResult::NoError;
        };

        // 1. Scoreboard header banner (`w2=208` left half + `w2=209` right half)
        if let (Some(b_left), Some(b_right)) = (anim.sprites.get(213), anim.sprites.get(214)) {
            b_left.blit(ctx.surface, 0, 4);
            b_right.blit(ctx.surface, w - b_right.w, 4);
        } else if let Some(banner) = anim.sprites.get(208) {
            banner.blit(ctx.surface, 0, 4);
            if let Some(b2) = anim.sprites.get(209) {
                b2.blit(ctx.surface, w - b2.w, 4);
            }
        }

        // 2. Perimeter doors (`w2=0` vertical door `75x133`, `w2=4` horizontal door `133x75`) & train track (`w2=15`)
        if let Some(track) = anim.sprites.get(15) {
            track.blit(ctx.surface, (w - track.w) / 2, (h - track.h) / 2 + 20);
        }
        if let Some(vdoor) = anim.sprites.first() {
            vdoor.blit(ctx.surface, 12, h / 2 - vdoor.h / 2);
            vdoor.blit(ctx.surface, w - vdoor.w - 12, h / 2 - vdoor.h / 2);
        }
        if let Some(hdoor) = anim.sprites.get(4) {
            hdoor.blit(ctx.surface, w / 2 - hdoor.w / 2, h - hdoor.h - 8);
        }
        if let Some(train) = anim.sprites.get(14) {
            let tpos = ((self.tick * 3) as i32) % 220;
            train.blit(
                ctx.surface,
                w / 2 - 110 + tpos,
                h / 2 - 70 + (tpos * 2) / 3,
            );
        }

        // 3. Advance Bugs Bunny & Elmer Fudd compound animations (`OFst #1000`, filtered to character poses)
        let n_frames = anim.frames.len().saturating_sub(1);
        self.bugs_frame = crate::looney::advance_filtered_range(
            anim,
            self.bugs_frame,
            1,
            390.min(n_frames),
            45,
            55,
            165,
            175,
        );
        self.elmer_frame = crate::looney::advance_filtered_range(
            anim,
            self.elmer_frame,
            150,
            n_frames,
            45,
            55,
            165,
            175,
        );

        anim.draw_anchored_bottom(ctx.surface, self.bugs_frame, w / 2 - 120, h - 78, 1, false);
        anim.draw_anchored_bottom(ctx.surface, self.elmer_frame, w / 2 + 120, h - 78, 1, false);

        if self.tick % 80 == 0 {
            let vid = BUGS_VOICES[(self.tick as usize / 80) % BUGS_VOICES.len()];
            looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, vid);
        }

        AdResult::NoError
    }
}
