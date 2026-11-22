//! *Warp Effect* — 1994 *Star Trek: The Next Generation* After Dark 3.0 Module.
//!
//! Authentic streaking TNG warp starfield with adjustable 3D camera heading
//! (`View Angle: 0°..345°` or continuous `Roam`), star count (`20..200`),
//! and `Impulse / Warp 1..Warp 9` speed with classic prismatic Doppler streaks!

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult, MsvcRand};

use crate::simpsons::{draw_line_px, fill_rect_px};
use super::{MOD_WARP_EFFECT, SND_PICARD_ENGAGE, tng_pack};

struct WarpStar {
    x: f32,
    y: f32,
    z: f32,
    prev_sx: f32,
    prev_sy: f32,
    has_prev: bool,
    hue_idx: usize,
}

const WARP_COLORS: [u32; 8] = [
    0x00FF_FFFF, // Pure star white
    0x00B8_E0FF, // Ice blue
    0x006C_B8FF, // Warp plasma blue
    0x00FF_D88A, // Warm gold
    0x00D8_A8FF, // Violet Doppler shift
    0x0088_FFFF, // Cyan streak
    0x00FF_9468, // Amber red-shift
    0x00E4_F0FF, // Bright blue-white
];

pub struct WarpEffectModule {
    stars: Vec<WarpStar>,
    yaw_rad: f32,
    roam: bool,
    speed_factor: f32,
    tick: usize,
}

impl WarpEffectModule {
    pub fn new() -> Self {
        Self {
            stars: Vec::new(),
            yaw_rad: 0.0,
            roam: false,
            speed_factor: 1.0,
            tick: 0,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "tng_warp_effect".to_string(),
            name: "Warp Effect".to_string(),
            filename: "WARP.AD".to_string(),
            credit: "By Andy Karn.\nSoftware © 1994 Berkeley Systems, Inc.\nStar Trek: TNG ™ & © Paramount Pictures.".to_string(),
            about: "Demonstrates the iconic Star Trek: The Next Generation warp-speed star streaking effect. Set View Angle from forward (0°) to starboard (90°), aft (180°), or Roam continuously across Warp 1 to Warp 9!".to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "View Angle:".to_string(),
                    default_raw: 0,
                    labels: vec![
                        "0°".into(),
                        "45°".into(),
                        "90°".into(),
                        "135°".into(),
                        "180°".into(),
                        "270°".into(),
                        "Roam".into(),
                    ],
                    thresholds: vec![0, 10, 25, 35, 50, 75, 98],
                },
                AdControl::LabeledSlider {
                    title: "No. of Stars:".to_string(),
                    default_raw: 50,
                    labels: vec![
                        "20".into(),
                        "60".into(),
                        "100".into(),
                        "140".into(),
                        "180".into(),
                        "200".into(),
                    ],
                    thresholds: vec![0, 22, 44, 66, 88, 99],
                },
                AdControl::LabeledSlider {
                    title: "Speed:".to_string(),
                    default_raw: 50,
                    labels: vec![
                        "Impulse".into(),
                        "Warp 1".into(),
                        "Warp 2".into(),
                        "Warp 3".into(),
                        "Warp 4".into(),
                        "Warp 5".into(),
                        "Warp 6".into(),
                        "Warp 7".into(),
                        "Warp 8".into(),
                        "Warp 9".into(),
                    ],
                    thresholds: vec![0, 10, 20, 30, 40, 50, 60, 70, 80, 90],
                },
                AdControl::None,
            ],
            target_frame_ms: 33,
        }
    }

    fn spawn_star(rng: &mut MsvcRand, random_z: bool) -> WarpStar {
        let x = ((rng.rand_mod(2001) - 1000) as f32) / 500.0;
        let y = ((rng.rand_mod(2001) - 1000) as f32) / 500.0;
        let z = if random_z {
            ((rng.rand_mod(2001) - 1000) as f32) / 500.0
        } else {
            1.8 + (rng.rand_mod(100) as f32) * 0.004
        };
        WarpStar {
            x,
            y,
            z,
            prev_sx: 0.0,
            prev_sy: 0.0,
            has_prev: false,
            hue_idx: (rng.rand_mod(WARP_COLORS.len() as i32)) as usize,
        }
    }
}

impl Default for WarpEffectModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for WarpEffectModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        let angle_raw = ctx.module.raw_control_value[0].clamp(0, 100);
        if angle_raw >= 98 {
            self.roam = true;
            self.yaw_rad = 0.0;
        } else {
            self.roam = false;
            self.yaw_rad = (angle_raw as f32 / 98.0) * std::f32::consts::TAU;
        }

        let count_raw = ctx.module.raw_control_value[1].clamp(0, 100);
        let num_stars = (20 + (count_raw * 180) / 100) as usize;

        let spd_raw = ctx.module.raw_control_value[2].clamp(0, 100);
        // Impulse (0.015) up to Warp 9 (0.145)
        self.speed_factor = 0.015 + (spd_raw as f32 / 100.0).powf(1.3) * 0.13;

        self.stars.clear();
        for _ in 0..num_stars {
            self.stars.push(Self::spawn_star(ctx.rng, true));
        }
        self.tick = 0;

        let _ = MOD_WARP_EFFECT;
        tng_pack().play_voice(ctx.sound, ctx.system.sound_enabled, SND_PICARD_ENGAGE);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        fill_rect_px(ctx.surface, 0, 0, ctx.surface.width, ctx.surface.height, 0x0000_0000);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.tick = self.tick.wrapping_add(1);
        if self.roam {
            self.yaw_rad += 0.014;
        }

        let w = ctx.surface.width;
        let h = ctx.surface.height;
        let cx = w as f32 * 0.5;
        let cy = h as f32 * 0.5;
        let focal = (w.min(h) as f32) * 0.65;

        // Subtle persistence decay so warp streaks leave silky glowing plasma tails!
        let dst = ctx.surface.pixels_mut();
        for px in dst.iter_mut() {
            let v = *px;
            if v != 0 {
                let r = ((v >> 16) & 0xFF) * 3 / 5;
                let g = ((v >> 8) & 0xFF) * 3 / 5;
                let b = (v & 0xFF) * 2 / 3;
                *px = (r << 16) | (g << 8) | b;
            }
        }

        // Ship travels along world -Z; rotate world coordinates by yaw_rad to view forward/side/aft!
        let cos_y = self.yaw_rad.cos();
        let sin_y = self.yaw_rad.sin();
        let dz = self.speed_factor;

        for st in &mut self.stars {
            // Move star past the ship along -Z; wrap smoothly inside the 3D star cube [-2..2]^3
            st.z -= dz;
            if st.z < -2.0 {
                st.z += 4.0;
                st.x = ((ctx.rng.rand_mod(2001) - 1000) as f32) / 500.0;
                st.y = ((ctx.rng.rand_mod(2001) - 1000) as f32) / 500.0;
                st.has_prev = false;
            }

            // Camera-space rotation around Y axis
            let rx = st.x * cos_y + st.z * sin_y;
            let rz = -st.x * sin_y + st.z * cos_y + 2.05;
            if rz <= 0.12 {
                st.has_prev = false;
                continue;
            }
            let sx = cx + (rx / rz) * focal;
            let sy = cy + (st.y / rz) * focal;

            if sx < -80.0 || sx > w as f32 + 80.0 || sy < -80.0 || sy > h as f32 + 80.0 {
                st.has_prev = false;
                continue;
            }

            if st.has_prev {
                // Draw TNG prismatic rainbow Doppler streak (blue/violet tail -> bright white tip!)
                let dx = sx - st.prev_sx;
                let dy = sy - st.prev_sy;
                if dx * dx + dy * dy < (w.max(h) as f32 * 0.45).powi(2) {
                    let stretch = 1.0 + self.speed_factor * 18.0;
                    let tx = sx - dx * stretch;
                    let ty = sy - dy * stretch;
                    let mx = (sx + tx) * 0.5;
                    let my = (sy + ty) * 0.5;
                    let thick = if rz < 1.3 { 2 } else { 1 };
                    let col = WARP_COLORS[st.hue_idx % WARP_COLORS.len()];
                    // Tail in colored Doppler shift, leading tip in blazing starlight white!
                    draw_line_px(ctx.surface, tx as i32, ty as i32, mx as i32, my as i32, col, thick);
                    draw_line_px(
                        ctx.surface,
                        mx as i32,
                        my as i32,
                        sx as i32,
                        sy as i32,
                        0x00FF_FFFF,
                        thick,
                    );
                }
            }
            st.prev_sx = sx;
            st.prev_sy = sy;
            st.has_prev = true;
        }

        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        self.stars.clear();
        AdResult::NoError
    }
}
