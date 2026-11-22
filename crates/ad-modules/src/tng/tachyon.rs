//! *Tachyon Particle Field* — 1994 *Star Trek: The Next Generation* After Dark 3.0 Module.
//!
//! Full-widescreen HD/4K Federation tachyon detection emitter grid inspired by
//! *Redemption, Part II*: particle density, beam reach, cloak disruption radius,
//! core glow, and line width all scale cleanly with monitor resolution & aspect ratio.

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::simpsons::{draw_line_px, fill_circle_px, fill_rect_px, put_px};
use super::{MOD_TACHYON, SND_ROMULAN_BEEP1, SND_SENSOR_ALERT, tng_pack};

struct TachyonParticle {
    x: f32,
    y: f32,
    vx: f32,
    vy: f32,
    phase: f32,
    charge: f32, // +1 cyan/blue, -1 amber/violet
}

pub struct TachyonModule {
    particles: Vec<TachyonParticle>,
    anomaly_x: f32,
    anomaly_y: f32,
    anomaly_vx: f32,
    anomaly_vy: f32,
    scale_f: f32,
    tick: usize,
}

impl TachyonModule {
    pub fn new() -> Self {
        Self {
            particles: Vec::new(),
            anomaly_x: 0.0,
            anomaly_y: 0.0,
            anomaly_vx: 2.2,
            anomaly_vy: 1.1,
            scale_f: 1.0,
            tick: 0,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "tng_tachyon".to_string(),
            name: "Tachyon Particle Field".to_string(),
            filename: "TACHYON.AD".to_string(),
            credit: "By Tom Wuttke.\nSoftware © 1994 Berkeley Systems, Inc.\nStar Trek: TNG ™ & © Paramount Pictures.".to_string(),
            about: "In \"Redemption, Part II,\" Federation ships created an active tachyon detection grid to expose cloaked Romulan vessels. This display presents an active tachyon particle field held in isolation.".to_string(),
            controls: [
                AdControl::None,
                AdControl::None,
                AdControl::None,
                AdControl::None,
            ],
            target_frame_ms: 40,
        }
    }
}

impl Default for TachyonModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for TachyonModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        let w = ctx.surface.width.max(120) as f32;
        let h = ctx.surface.height.max(100) as f32;
        self.scale_f = (h / 480.0).clamp(0.85, 3.5);
        let sf = self.scale_f;

        // Scale particle count with aspect ratio & resolution so 16:9 / 21:9 / 4K stay lush & connected!
        let aspect = (w / h).clamp(1.0, 2.8);
        let count = (36.0 * aspect).round().clamp(42.0, 96.0) as usize;
        self.particles.clear();
        for i in 0..count {
            let angle = (i as f32 / count as f32) * std::f32::consts::TAU;
            let spd = (1.3 + (ctx.rng.rand_mod(24) as f32) * 0.1) * sf;
            self.particles.push(TachyonParticle {
                x: ctx.rng.rand_mod(w as i32) as f32,
                y: ctx.rng.rand_mod(h as i32) as f32,
                vx: angle.cos() * spd,
                vy: angle.sin() * spd,
                phase: (i as f32) * 0.4,
                charge: if (i & 1) == 0 { 1.0 } else { -1.0 },
            });
        }
        self.anomaly_x = w * 0.25;
        self.anomaly_y = h * 0.5;
        self.anomaly_vx = 2.4 * sf;
        self.anomaly_vy = 1.2 * sf;
        self.tick = 0;
        let _ = MOD_TACHYON;
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        fill_rect_px(ctx.surface, 0, 0, ctx.surface.width, ctx.surface.height, 0x0003_0610);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.tick = self.tick.wrapping_add(1);
        let w = ctx.surface.width;
        let h = ctx.surface.height;
        let wf = w as f32;
        let hf = h as f32;
        let sf = self.scale_f;

        // Soft phosphor decay so tachyon particle arcs shimmer cleanly
        let dst = ctx.surface.pixels_mut();
        for px in dst.iter_mut() {
            let v = *px;
            let r = ((v >> 16) & 0xFF) * 7 / 10;
            let g = ((v >> 8) & 0xFF) * 7 / 10;
            let b = (v & 0xFF) * 3 / 4;
            *px = (r << 16) | (g << 8) | b;
        }

        // Move invisible cloaked Romulan disturbance wave smoothly across full widescreen field
        let margin = 44.0 * sf;
        self.anomaly_x += self.anomaly_vx;
        self.anomaly_y += self.anomaly_vy;
        if self.anomaly_x < margin || self.anomaly_x > wf - margin {
            self.anomaly_vx = -self.anomaly_vx;
        }
        if self.anomaly_y < margin || self.anomaly_y > hf - margin {
            self.anomaly_vy = -self.anomaly_vy;
        }

        // Resolution-scaled pulsing tachyon detection grid
        let grid_sp = (h / 7).clamp(36, 180);
        let pulse = ((self.tick as f32 * 0.08).sin() * 14.0 + 26.0) as u32;
        let grid_col = (pulse / 3) << 16 | (pulse << 8) | (pulse * 2).min(255);
        let dot_step = (sf * 3.0).round().max(3.0) as usize;
        for gx in (0..w).step_by(grid_sp as usize) {
            for y in (0..h).step_by(dot_step) {
                put_px(ctx.surface, gx, y, grid_col);
            }
        }
        for gy in (0..h).step_by(grid_sp as usize) {
            for x in (0..w).step_by(dot_step) {
                put_px(ctx.surface, x, gy, grid_col);
            }
        }

        // Scale disruption radius & link distance proportionally with monitor height!
        let anom_r = hf * 0.16;
        let anom_r2 = anom_r * anom_r;
        let cloak_r2 = (hf * 0.21) * (hf * 0.21);
        let max_spd = 4.4 * sf;

        let mut disrupted = false;
        let n = self.particles.len();
        for p in &mut self.particles {
            p.phase += 0.11;
            let adx = p.x - self.anomaly_x;
            let ady = p.y - self.anomaly_y;
            let ad2 = adx * adx + ady * ady;
            if ad2 < anom_r2 && ad2 > 16.0 {
                let d = ad2.sqrt();
                p.vx += (adx / d) * 0.45 * sf;
                p.vy += (ady / d) * 0.45 * sf;
                disrupted = true;
            }
            p.vx += p.phase.cos() * 0.06 * sf * p.charge;
            p.vy += p.phase.sin() * 0.06 * sf * p.charge;
            let spd = (p.vx * p.vx + p.vy * p.vy).sqrt();
            if spd > max_spd {
                p.vx = (p.vx / spd) * max_spd;
                p.vy = (p.vy / spd) * max_spd;
            }
            p.x += p.vx;
            p.y += p.vy;
            if p.x < 4.0 {
                p.x = 4.0;
                p.vx = p.vx.abs();
            } else if p.x > wf - 4.0 {
                p.x = wf - 4.0;
                p.vx = -p.vx.abs();
            }
            if p.y < 4.0 {
                p.y = 4.0;
                p.vy = p.vy.abs();
            } else if p.y > hf - 4.0 {
                p.y = hf - 4.0;
                p.vy = -p.vy.abs();
            }
        }

        // Uncapped proportional link distance so 1080p/1440p/4K screens form a rich web!
        let max_link = (hf * 0.27).max(70.0);
        let max_link_sq = max_link * max_link;
        let base_thick = sf.round().clamp(1.0, 3.0) as i32;

        for i in 0..n {
            let pi = &self.particles[i];
            let near_cloak =
                (pi.x - self.anomaly_x).powi(2) + (pi.y - self.anomaly_y).powi(2) < cloak_r2;
            for j in (i + 1)..n {
                let pj = &self.particles[j];
                let dx = pj.x - pi.x;
                let dy = pj.y - pi.y;
                let d2 = dx * dx + dy * dy;
                if d2 < max_link_sq {
                    let intensity = 1.0 - (d2.sqrt() / max_link);
                    let col = if near_cloak {
                        let r = (120.0 + intensity * 135.0) as u32;
                        let g = (190.0 + intensity * 65.0) as u32;
                        let b = (40.0 + intensity * 80.0) as u32;
                        (r << 16) | (g << 8) | b
                    } else if pi.charge * pj.charge > 0.0 {
                        let r = (30.0 + intensity * 110.0) as u32;
                        let g = (140.0 + intensity * 115.0) as u32;
                        let b = (210.0 + intensity * 45.0) as u32;
                        (r << 16) | (g << 8) | b
                    } else {
                        let r = (170.0 + intensity * 85.0) as u32;
                        let g = (70.0 + intensity * 120.0) as u32;
                        let b = (180.0 + intensity * 75.0) as u32;
                        (r << 16) | (g << 8) | b
                    };
                    let thick = if intensity > 0.62 {
                        base_thick + 1
                    } else {
                        base_thick
                    };
                    draw_line_px(
                        ctx.surface,
                        pi.x as i32,
                        pi.y as i32,
                        pj.x as i32,
                        pj.y as i32,
                        col,
                        thick,
                    );
                }
            }
        }

        // Draw resolution-scaled glowing tachyon particle cores
        let core_r = (sf * 3.0).round().clamp(3.0, 7.0) as i32;
        for p in &self.particles {
            let core_col = if p.charge > 0.0 { 0x00A8_F4FF } else { 0x00FF_C868 };
            fill_circle_px(ctx.surface, p.x as i32, p.y as i32, core_r, core_col);
            fill_circle_px(ctx.surface, p.x as i32, p.y as i32, (core_r / 2).max(1), 0x00FF_FFFF);
        }

        if disrupted && self.tick % 95 == 0 {
            let snd = if ctx.rng.rand_mod(2) == 0 {
                SND_SENSOR_ALERT
            } else {
                SND_ROMULAN_BEEP1
            };
            tng_pack().play_voice(ctx.sound, ctx.system.sound_enabled, snd);
        }

        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        self.particles.clear();
        AdResult::NoError
    }
}
