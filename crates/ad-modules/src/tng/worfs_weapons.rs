//! *Worf's Weapons* — 1994 *Star Trek: The Next Generation* After Dark 3.0 Module.
//!
//! Lieutenant Worf and Alexander practice Klingon martial arts and weapons
//! training (**Bat'leth**, **Sword**, and **Phaser**) across **1,547 authentic
//! `OFst/OFtb #1000..#1003` Holodeck animation frames** with digitized Worf
//! voice clips, sword swishes, crashes, and Type-II phaser fire!

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::simpsons::{CompoundAnim, draw_line_px, fill_rect_px};
use super::{
    MOD_WORFS_WEAPONS, SND_CRASH1, SND_PHASER_MED, SND_SWISH1, SND_SWISH2, SND_SWISH3,
    SND_WORF_ALEXANDER, SND_WORF_COME_IN, SND_WORF_NO_NO, SND_WORF_NOT_YET, SND_WORF_QUITE_STIM,
    SND_WORF_ROAR, SND_WORF_VERY_STIM, load_anim, tng_pack,
};

// Authentic weapon training ranges across the 1,547 OFtb frames
const WEAPON_RANGES: [(usize, usize); 3] = [
    (0, 310),    // Bat'leth
    (310, 910),  // Sword / Calisthenics with Alexander
    (910, 1546), // Phaser / Target Drones
];

const WORF_VOICES: &[i16] = &[
    SND_WORF_ALEXANDER,
    SND_WORF_COME_IN,
    SND_WORF_ROAR,
    SND_WORF_QUITE_STIM,
    SND_WORF_VERY_STIM,
    SND_WORF_NO_NO,
    SND_WORF_NOT_YET,
];

const COMBAT_SFX: &[i16] = &[SND_SWISH1, SND_SWISH2, SND_SWISH3, SND_CRASH1, SND_PHASER_MED];

pub struct WorfsWeaponsModule {
    anim: Option<CompoundAnim>,
    saved_bg: Vec<u32>,
    clear_screen: bool,
    weapon_setting: i32, // 0=Random, 1=Bat'leth, 2=Sword, 3=Phaser
    active_weapon: usize,
    frame_idx: usize,
    cam_x: f32,
    cam_y: f32,
    tick: usize,
    scale: i32,
}

impl WorfsWeaponsModule {
    pub fn new() -> Self {
        Self {
            anim: None,
            saved_bg: Vec::new(),
            clear_screen: true,
            weapon_setting: 0,
            active_weapon: 1,
            frame_idx: 310,
            cam_x: 480.0,
            cam_y: 220.0,
            tick: 0,
            scale: 1,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "tng_worfs_weapons".to_string(),
            name: "Worf's Weapons".to_string(),
            filename: "WORFSWPN.AD".to_string(),
            credit: "By Randall Ho and Gregor Torrence.\nSoftware © 1994 Berkeley Systems, Inc.\nStar Trek: TNG ™ & © Paramount Pictures.".to_string(),
            about: "Lieutenant Worf and Alexander train on the Enterprise-D Holodeck with the Klingon Bat'leth, Sword, and Type-II Phaser across 1,547 animated frames with authentic Worf dialogue and combat SFX!".to_string(),
            controls: [
                AdControl::Checkbox {
                    title: "Clear Screen First".to_string(),
                    default_checked: true,
                },
                AdControl::Menu {
                    title: "Weapon:".to_string(),
                    default_index: 0,
                    choices: vec![
                        "Random".into(),
                        "Bat'leth".into(),
                        "Sword".into(),
                        "Phaser".into(),
                    ],
                },
                AdControl::None,
                AdControl::None,
            ],
            target_frame_ms: 62,
        }
    }

    fn draw_holodeck_grid(&self, surface: &mut ad_sdk::canvas::AdSurface) {
        let w = surface.width;
        let h = surface.height;
        fill_rect_px(surface, 0, 0, w, h, 0x001A_1C24);

        let horizon = (h * 62) / 100;
        let grid_col = 0x00D4_A224;
        let wall_col = 0x008A_6A18;

        // Back wall orthogonal golden Holodeck grid
        let step = (w / 14).clamp(24, 54);
        for x in (0..w).step_by(step as usize) {
            fill_rect_px(surface, x, 0, x + 1, horizon, wall_col);
        }
        for y in (0..horizon).step_by(step as usize) {
            fill_rect_px(surface, 0, y, w, y + 1, wall_col);
        }

        // Perspective floor golden Holodeck grid radiating toward vanishing point
        fill_rect_px(surface, 0, horizon, w, horizon + 2, grid_col);
        let cx = w / 2;
        for i in -8..=8 {
            let bx = cx + i * (step * 2);
            let tx = cx + i * (step / 2);
            draw_line_px(surface, tx, horizon, bx, h, grid_col, 1);
        }
        let mut fy = horizon + 12;
        let mut dy = 10;
        while fy < h {
            fill_rect_px(surface, 0, fy, w, fy + 1, grid_col);
            fy += dy;
            dy = (dy * 13) / 10 + 2;
        }
    }

    fn draw_scene(&mut self, surface: &mut ad_sdk::canvas::AdSurface) {
        if self.clear_screen || self.saved_bg.len() != surface.pixels().len() {
            self.draw_holodeck_grid(surface);
        } else {
            surface.pixels_mut().copy_from_slice(&self.saved_bg);
        }

        let Some(anim) = &self.anim else {
            return;
        };
        if anim.frames.is_empty() {
            return;
        }
        let fi = self.frame_idx % anim.frames.len();
        let cf = &anim.frames[fi];
        let tcx = ((cf.left + cf.right) / 2 + cf.dx) as f32;
        let tcy = ((cf.top + cf.bottom) / 2 + cf.dy) as f32;
        if (tcx - self.cam_x).abs() > 150.0 || (tcy - self.cam_y).abs() > 140.0 {
            self.cam_x = tcx;
            self.cam_y = tcy;
        } else {
            self.cam_x += (tcx - self.cam_x) * 0.16;
            self.cam_y += (tcy - self.cam_y) * 0.16;
        }

        let ox = surface.width / 2 - (self.cam_x as i32) * self.scale;
        let oy = (surface.height * 56) / 100 - (self.cam_y as i32) * self.scale;
        anim.draw_stage_frame(surface, fi, ox, oy, self.scale);
    }
}

impl Default for WorfsWeaponsModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for WorfsWeaponsModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        if self.anim.is_none() {
            self.anim = Some(load_anim(MOD_WORFS_WEAPONS, 1000));
        }
        self.saved_bg = ctx.surface.pixels().to_vec();
        self.clear_screen = ctx.module.raw_control_value[0] != 0;
        self.weapon_setting = ctx.module.raw_control_value[1].clamp(0, 3);
        self.active_weapon = if self.weapon_setting == 0 {
            ctx.rng.rand_mod(3) as usize
        } else {
            (self.weapon_setting - 1) as usize
        };
        self.scale = if ctx.surface.width >= 1000 && ctx.surface.height >= 640 {
            2
        } else {
            1
        };

        let total = self.anim.as_ref().map(|a| a.frames.len()).unwrap_or(1).max(1);
        let (st, _) = WEAPON_RANGES[self.active_weapon % 3];
        self.frame_idx = st.min(total - 1);
        if let Some(cf) = self.anim.as_ref().and_then(|a| a.frames.get(self.frame_idx)) {
            self.cam_x = ((cf.left + cf.right) / 2 + cf.dx) as f32;
            self.cam_y = ((cf.top + cf.bottom) / 2 + cf.dy) as f32;
        }
        self.tick = 0;

        tng_pack().play_voice(ctx.sound, ctx.system.sound_enabled, SND_WORF_COME_IN);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.draw_scene(ctx.surface);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.tick = self.tick.wrapping_add(1);
        let pack = tng_pack();

        let total = self.anim.as_ref().map(|a| a.frames.len()).unwrap_or(1).max(1);
        let (_, end) = WEAPON_RANGES[self.active_weapon % 3];
        let end = end.min(total);
        self.frame_idx += 1;
        if self.frame_idx >= end {
            if self.weapon_setting == 0 {
                self.active_weapon = (self.active_weapon + 1) % 3;
            }
            self.frame_idx = WEAPON_RANGES[self.active_weapon % 3].0.min(total - 1);
        }

        if self.tick % 64 == 24 {
            let clip = if ctx.rng.rand_mod(2) == 0 {
                WORF_VOICES[ctx.rng.rand_mod(WORF_VOICES.len() as i32) as usize]
            } else if self.active_weapon == 2 {
                SND_PHASER_MED
            } else {
                COMBAT_SFX[ctx.rng.rand_mod(4) as usize]
            };
            pack.play_voice(ctx.sound, ctx.system.sound_enabled, clip);
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
