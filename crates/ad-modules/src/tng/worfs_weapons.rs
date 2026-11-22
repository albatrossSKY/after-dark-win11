//! *Worf's Weapons* — 1994 *Star Trek: The Next Generation* After Dark 3.0 Module.
//!
//! Full-widescreen Enterprise-D Holodeck chamber where Lieutenant Worf and
//! Alexander practice Klingon martial arts and weapons training (**Bat'leth**,
//! **Sword**, and **Phaser**) across **1,547 authentic `OFst/OFtb #1000`
//! frames** with accurate `part.flags` mirroring, smooth proportional HD/4K
//! scaling, digitized Worf dialogue, sword swishes, and Type-II phaser fire!

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::simpsons::{CompoundAnim, draw_bitmap_text, draw_line_px, fill_rect_px};
use super::{
    LCARS_AMBER, LCARS_GOLD, LcarsFontSet, MOD_WORFS_WEAPONS, SND_CRASH1, SND_PHASER_MED,
    SND_SWISH1, SND_SWISH2, SND_SWISH3, SND_WORF_ALEXANDER, SND_WORF_COME_IN, SND_WORF_NO_NO,
    SND_WORF_NOT_YET, SND_WORF_QUITE_STIM, SND_WORF_ROAR, SND_WORF_VERY_STIM, fill_rounded_rect,
    load_anim, tng_pack,
};

const WEAPON_NAMES: [&str; 3] = ["BAT'LETH", "SWORD", "PHASER"];

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
    fonts: LcarsFontSet,
    saved_bg: Vec<u32>,
    clear_screen: bool,
    weapon_setting: i32, // 0=Random, 1=Bat'leth, 2=Sword, 3=Phaser
    active_weapon: usize,
    frame_idx: usize,
    cam_x: f32,
    cam_bottom: f32,
    tick: usize,
}

impl WorfsWeaponsModule {
    pub fn new() -> Self {
        Self {
            anim: None,
            fonts: LcarsFontSet::empty(),
            saved_bg: Vec::new(),
            clear_screen: true,
            weapon_setting: 0,
            active_weapon: 1,
            frame_idx: 310,
            cam_x: 480.0,
            cam_bottom: 285.0,
            tick: 0,
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
        fill_rect_px(surface, 0, 0, w, h, 0x0013_151C);

        // Full-widescreen 3D perspective Holodeck chamber (back wall + perspective side walls + floor + ceiling)
        let bx0 = (w * 12) / 100;
        let bx1 = w - bx0;
        let by0 = (h * 10) / 100;
        let by1 = (h * 64) / 100;
        let wall_col = 0x008A_6A18;
        let grid_col = 0x00DC_A828;
        let thick = if h >= 900 { 2 } else { 1 };

        // Slightly deeper back wall recess
        fill_rect_px(surface, bx0, by0, bx1, by1, 0x0019_1C24);

        // Back wall orthogonal golden Holodeck tiles
        let bw = (bx1 - bx0).max(60);
        let bh = (by1 - by0).max(60);
        let nx = 12;
        let ny = 6;
        for i in 0..=nx {
            let x = bx0 + (bw * i) / nx;
            fill_rect_px(surface, x, by0, x + thick, by1, wall_col);
        }
        for j in 0..=ny {
            let y = by0 + (bh * j) / ny;
            fill_rect_px(surface, bx0, y, bx1, y + thick, wall_col);
        }

        // Perspective Left & Right Holodeck side walls
        for j in 0..=ny {
            let wy = by0 + (bh * j) / ny;
            let ey = ((wy - h / 2) * 145) / 100 + h / 2;
            draw_line_px(surface, 0, ey, bx0, wy, wall_col, thick);
            draw_line_px(surface, bx1, wy, w, ey, wall_col, thick);
        }
        for k in 1..=3 {
            let frac = k as f32 / 4.0;
            let lx = (bx0 as f32 * frac) as i32;
            let rx = w - lx;
            let top_y = (by0 as f32 * frac) as i32;
            let bot_y = h - ((h - by1) as f32 * frac) as i32;
            fill_rect_px(surface, lx, top_y, lx + thick, bot_y, wall_col);
            fill_rect_px(surface, rx, top_y, rx + thick, bot_y, wall_col);
        }

        // Perspective ceiling beams
        for i in 0..=nx {
            let tx = bx0 + (bw * i) / nx;
            let ox = w / 2 + ((tx - w / 2) * 145) / 100;
            draw_line_px(surface, ox, 0, tx, by0, wall_col, thick);
        }

        // Perspective floor golden Holodeck grid radiating cleanly toward the viewer
        fill_rect_px(surface, bx0, by1, bx1, by1 + thick + 1, grid_col);
        for i in 0..=nx {
            let tx = bx0 + (bw * i) / nx;
            let ox = w / 2 + ((tx - w / 2) * 165) / 100;
            draw_line_px(surface, tx, by1, ox, h, grid_col, thick);
        }
        let floor_h = (h - by1).max(32);
        for r in 1..=6 {
            let t = (r as f32 / 6.0).powf(1.55);
            let fy = by1 + (floor_h as f32 * t) as i32;
            fill_rect_px(surface, 0, fy, w, fy + thick, grid_col);
        }

        // Crisp high-DPI LCARS Holodeck Program header badge
        let pad = (h / 42).clamp(8, 20);
        let hdr_px = (h / 30).clamp(14, 28);
        let (f_hdr, s_hdr, lh_hdr) = self.fonts.pick(hdr_px);
        let pill_h = (lh_hdr + 6).clamp(20, 38);
        fill_rounded_rect(surface, pad, pad, pad + (w / 24).clamp(22, 48), pad + pill_h, pill_h / 2, LCARS_GOLD);
        let lbl = format!(
            "HOLODECK 3 // KLINGON CALISTHENICS: {}",
            WEAPON_NAMES[self.active_weapon % 3]
        );
        draw_bitmap_text(
            surface,
            f_hdr,
            &lbl,
            pad + (w / 24).clamp(22, 48) + 10,
            pad + ((pill_h - lh_hdr) / 2).max(1),
            Some(LCARS_AMBER),
            s_hdr,
        );
    }

    fn draw_scene(&mut self, surface: &mut ad_sdk::canvas::AdSurface) {
        let w = surface.width;
        let h = surface.height;
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
        let tbot = (cf.bottom + cf.dy) as f32;
        if (tcx - self.cam_x).abs() > 160.0 || (tbot - self.cam_bottom).abs() > 90.0 {
            self.cam_x = tcx;
            self.cam_bottom = tbot;
        } else {
            self.cam_x += (tcx - self.cam_x) * 0.14;
            self.cam_bottom += (tbot - self.cam_bottom) * 0.14;
        }

        // Proportional HD/4K scaling (~56% of screen height) firmly grounded on the Holodeck floor!
        let sf = ((h as f32 * 0.56) / 145.0).clamp(1.25, 4.8);
        let stage_x = (w as f32) * 0.5 - self.cam_x * sf;
        let floor_anchor = (h as f32) * 0.86;
        let stage_y = floor_anchor - self.cam_bottom * sf;
        anim.draw_stage_frame_f(surface, fi, stage_x, stage_y, sf, true, false);
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
            self.fonts.ensure_loaded();
        }
        self.saved_bg = ctx.surface.pixels().to_vec();
        self.clear_screen = ctx.module.raw_control_value[0] != 0;
        self.weapon_setting = ctx.module.raw_control_value[1].clamp(0, 3);
        self.active_weapon = if self.weapon_setting == 0 {
            ctx.rng.rand_mod(3) as usize
        } else {
            (self.weapon_setting - 1) as usize
        };

        let total = self.anim.as_ref().map(|a| a.frames.len()).unwrap_or(1).max(1);
        let (st, _) = WEAPON_RANGES[self.active_weapon % 3];
        self.frame_idx = st.min(total - 1);
        if let Some(cf) = self.anim.as_ref().and_then(|a| a.frames.get(self.frame_idx)) {
            self.cam_x = ((cf.left + cf.right) / 2 + cf.dx) as f32;
            self.cam_bottom = (cf.bottom + cf.dy) as f32;
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
