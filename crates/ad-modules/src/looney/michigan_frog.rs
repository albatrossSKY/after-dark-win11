//! "Michigan J. Frog" — Classic 1995 *Looney Tunes* After Dark 3.0 module.
//!
//! Full-widescreen vaudeville theater stage where Michigan J. Frog high-steps
//! in his top hat and cane under a glowing tracking spotlight framed by red
//! velvet stage curtains (`OFst #4000`, `SONG_MICHIGAN_FROG` `#30` + `FROG_VOICES`).

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::looney::{
    FROG_VOICES, MOD_MICHIGAN_FROG, SONG_MICHIGAN_FROG, advance_filtered_range, fill_box_px,
    load_anim, looney_pack,
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
            vx: 2.0,
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
        let w = ctx.surface.width.max(320);
        let h = ctx.surface.height.max(240);
        let sf = (h as f32 / 480.0).clamp(1.0, 3.6);
        self.frog_x = (w / 2) as f32;
        self.vx = 2.0 * sf;
        ctx.surface.pixels_mut().fill(0x0006_0812);

        if let Some(loops) = music_loops_from_slider(self.music_raw) {
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
        let sf = (h as f32 / 480.0).clamp(1.0, 3.6);
        ctx.surface.pixels_mut().fill(0x0006_0812);

        let stage_y = (h * 82) / 100;
        let fx = self.frog_x as i32;

        // Smooth warm golden vaudeville tracking spotlight beaming onto Michigan J. Frog!
        let beam_top = (22.0 * sf) as f32;
        let beam_bot = (118.0 * sf) as f32;
        {
            let dst = ctx.surface.pixels_mut();
            for y in 0..stage_y {
                let t = y as f32 / stage_y.max(1) as f32;
                let half = (beam_top * (1.0 - t) + beam_bot * t) as i32;
                let x0 = (fx - half).max(0);
                let x1 = (fx + half).min(w);
                let row = (y * w) as usize;
                let add_r = (26.0 * (0.4 + 0.6 * t)) as u32;
                let add_g = (24.0 * (0.4 + 0.6 * t)) as u32;
                let add_b = (32.0 * (0.4 + 0.6 * t)) as u32;
                for x in x0..x1 {
                    let v = dst[row + x as usize];
                    let r = (((v >> 16) & 0xFF) + add_r).min(255);
                    let g = (((v >> 8) & 0xFF) + add_g).min(255);
                    let b = ((v & 0xFF) + add_b).min(255);
                    dst[row + x as usize] = (r << 16) | (g << 8) | b;
                }
            }
        }

        // Red velvet theater curtains along left & right edges
        let curt_w = (w / 12).clamp(24, 110);
        let fold_w = (curt_w / 4).max(6);
        for i in 0..4 {
            let col = if i % 2 == 0 { 0x0060_101A } else { 0x0042_0A12 };
            fill_box_px(ctx.surface, i * fold_w, 0, fold_w, stage_y, col);
            fill_box_px(ctx.surface, w - (i + 1) * fold_w, 0, fold_w, stage_y, col);
        }

        // Polished wood vaudeville stage floor with perspective plank seams
        fill_box_px(ctx.surface, 0, stage_y, w, h - stage_y, 0x002A_1A10);
        draw_line_px(ctx.surface, 0, stage_y, w - 1, stage_y, 0x0092_6038, (2.0 * sf).round().max(2.0) as i32);
        let plank_step = (w / 10).clamp(40, 140);
        for i in -6..=6 {
            draw_line_px(
                ctx.surface,
                w / 2 + i * (plank_step / 2),
                stage_y,
                w / 2 + i * (plank_step * 2),
                h,
                0x003E_2618,
                1,
            );
        }

        let Some(anim) = &self.anim else {
            return AdResult::NoError;
        };

        let n_frames = anim.frames.len().saturating_sub(1);
        self.frame_idx = advance_filtered_range(anim, self.frame_idx, 5, n_frames, 60, 50, 220, 220);

        let margin = (curt_w as f32 + 80.0 * sf).min(w as f32 * 0.35);
        self.frog_x += self.vx;
        if self.frog_x < margin || self.frog_x > w as f32 - margin {
            self.vx = -self.vx;
        }

        let frog_sf = ((h as f32 * 0.44) / 115.0).clamp(1.2, 4.4);
        anim.draw_anchored_bottom_f(
            ctx.surface,
            self.frame_idx,
            fx,
            stage_y + (24.0 * sf).round() as i32,
            frog_sf,
            false,
            true,
            false,
        );

        if self.tick % 110 == 0 {
            let vid = FROG_VOICES[(self.tick as usize / 110) % FROG_VOICES.len()];
            looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, vid);
        }

        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        AdResult::NoError
    }
}
