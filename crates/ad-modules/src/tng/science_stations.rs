//! *Science Stations* — 1994 *Star Trek: The Next Generation* After Dark 3.0 Module.
//!
//! Enterprise-D Main Bridge aft Science I, Science II, and Isolinear Circuit
//! Pattern Analysis LCARS consoles (`OFst/OFtb #7000/#8000`, `RLEP #6000/#7000..#7002/#8000/#9000`)
//! with animated navigational scans, isolinear chips, holographic planets, and
//! authentic bridge sensor audio!

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::simpsons::{CompoundAnim, RlepBank, draw_bitmap_text, fill_rect_px};
use super::{
    FONT_LCARS_14, MOD_SCIENCE, SND_BEEP1, SND_BEEP2, SND_SCIENCES, SND_SENSOR_ALERT, load_anim,
    load_lcars_font, load_rlep, tng_pack,
};

pub struct ScienceStationsModule {
    sci_anim: Option<CompoundAnim>,
    circuit_anim: Option<CompoundAnim>,
    chips_bank: RlepBank,
    planet_bank: RlepBank,
    font14: RlepBank,
    station_setting: i32, // 0=Circuits, 1=Science I, 2=Science II, 3=Random
    active_station: i32,
    duration_ticks: usize,
    speed_div: usize,
    station_ticks: usize,
    tick: usize,
}

impl ScienceStationsModule {
    pub fn new() -> Self {
        Self {
            sci_anim: None,
            circuit_anim: None,
            chips_bank: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            planet_bank: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            font14: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            station_setting: 3,
            active_station: 1,
            duration_ticks: 180,
            speed_div: 3,
            station_ticks: 0,
            tick: 0,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "tng_science_stations".to_string(),
            name: "Science Stations".to_string(),
            filename: "SCIENCE.AD".to_string(),
            credit: "By Eric Gibbs and Dan Zimmerman.\nSoftware © 1994 Berkeley Systems, Inc.\nStar Trek: TNG ™ & © Paramount Pictures.".to_string(),
            about: "Science I, Science II, and Isolinear Circuit Pattern Analysis consoles from the aft bridge of the U.S.S. Enterprise NCC-1701-D, complete with animated LCARS telemetry and sensor chimes.".to_string(),
            controls: [
                AdControl::Menu {
                    title: "Display:".to_string(),
                    default_index: 3,
                    choices: vec![
                        "Circuits".into(),
                        "Science I".into(),
                        "Science II".into(),
                        "Random".into(),
                    ],
                },
                AdControl::LabeledSlider {
                    title: "Duration:".to_string(),
                    default_raw: 30,
                    labels: vec![
                        "10 sec.".into(),
                        "20 sec.".into(),
                        "30 sec.".into(),
                        "45 sec.".into(),
                        "60 sec.".into(),
                    ],
                    thresholds: vec![0, 18, 30, 50, 75],
                },
                AdControl::LabeledSlider {
                    title: "Speed:".to_string(),
                    default_raw: 50,
                    labels: vec!["Slow".into(), "Medium".into(), "Fast".into()],
                    thresholds: vec![0, 33, 66],
                },
                AdControl::None,
            ],
            target_frame_ms: 68,
        }
    }

    fn ensure_loaded(&mut self) {
        if self.sci_anim.is_some() {
            return;
        }
        self.sci_anim = Some(load_anim(MOD_SCIENCE, 7000));
        self.circuit_anim = Some(load_anim(MOD_SCIENCE, 8000));
        self.chips_bank = load_rlep(MOD_SCIENCE, 6000);
        self.planet_bank = load_rlep(MOD_SCIENCE, 9000);
        self.font14 = load_lcars_font(FONT_LCARS_14);
    }

    fn render_station(&self, surface: &mut ad_sdk::canvas::AdSurface) {
        let w = surface.width;
        let h = surface.height;
        fill_rect_px(surface, 0, 0, w, h, 0x0000_0000);

        let s = if w >= 1200 && h >= 900 { 2 } else { 1 };
        let anim_step = self.tick / self.speed_div.max(1);

        match self.active_station {
            0 => {
                // ISOLINEAR CIRCUIT PATTERN ANALYSIS (#8000 LCARS frame + #6000 glowing chips grid!)
                let ox = (w - 480 * s) / 2;
                let oy = (h - 440 * s) / 2;
                if let Some(ca) = &self.circuit_anim {
                    if !ca.frames.is_empty() {
                        ca.draw_stage_frame(surface, 0, ox, oy, s);
                    }
                }
                draw_bitmap_text(
                    surface,
                    &self.font14,
                    "ISOLINEAR CIRCUIT PATTERN ANALYSIS",
                    (ox + 108 * s).max(8),
                    (oy + 22 * s).max(8),
                    Some(0x00FF_B848),
                    s,
                );
                // Grid of pulsing isolinear chips (#6000, 27 frames!)
                let nchips = self.chips_bank.frames.len();
                if nchips > 0 {
                    let cols = 5;
                    let rows = 4;
                    let gx0 = ox + 108 * s;
                    let gy0 = oy + 126 * s;
                    for r in 0..rows {
                        for c in 0..cols {
                            let ci = (anim_step + r * 5 + c * 3) % nchips;
                            let chip = &self.chips_bank.frames[ci];
                            let px = gx0 + (c as i32) * 62 * s;
                            let py = gy0 + (r as i32) * 66 * s;
                            if px + chip.w * s < w && py + chip.h * s < h {
                                chip.blit_scaled(surface, px, py, s);
                            }
                        }
                    }
                }
            }
            1 => {
                // SCIENCE I: LCARS Main Sensor & Navigational Scan (#7000)
                let ox = (w - 600 * s) / 2;
                let oy = (h - 450 * s) / 2;
                if let Some(sa) = &self.sci_anim {
                    if !sa.frames.is_empty() {
                        // Base LCARS Science I frame (idx 0)
                        sa.draw_stage_frame(surface, 0, ox, oy, s);
                        // Animated middle sensor grid (idx 15..29)
                        if sa.frames.len() > 29 {
                            let fi = 15 + (anim_step % 15);
                            sa.draw_stage_frame(surface, fi, ox, oy, s);
                        }
                        // Animated telemetry bar (idx 40..49)
                        if sa.frames.len() > 49 {
                            let ti = 40 + (anim_step % 10);
                            sa.draw_stage_frame(surface, ti, ox, oy, s);
                        }
                    }
                }
                let sub = if (anim_step / 16) % 2 == 0 {
                    "FWD NAVIGATIONAL SCAN 302"
                } else {
                    "GALAXY CLASS STARSHIP NCC 1701-D"
                };
                draw_bitmap_text(
                    surface,
                    &self.font14,
                    sub,
                    (ox + 120 * s).max(8),
                    (oy + 12 * s).max(8),
                    Some(0x00FF_AA44),
                    s,
                );
            }
            _ => {
                // SCIENCE II: Planetary Surface Scan (#7000[30..35] + #9000 holographic planet!)
                let ox = (w - 580 * s) / 2;
                let oy = (h - 440 * s) / 2;
                if let Some(sa) = &self.sci_anim {
                    if sa.frames.len() > 50 {
                        sa.draw_stage_frame(surface, 30 + (anim_step % 5), ox, oy, s);
                        sa.draw_stage_frame(surface, 50 + (anim_step % 2), ox, oy, s);
                    }
                }
                // Holographic planetary globe & orbital telemetry (#9000)
                if !self.planet_bank.frames.is_empty() {
                    if let Some(grid) = self.planet_bank.frames.get(4) {
                        let gx = (w - grid.w * s) / 2;
                        let gy = (h - grid.h * s) / 2 + 12 * s;
                        grid.blit_scaled(surface, gx, gy, s);
                    }
                    let pi = anim_step % 4.min(self.planet_bank.frames.len());
                    if let Some(planet) = self.planet_bank.frames.get(pi) {
                        planet.blit_scaled(
                            surface,
                            w / 2 - (planet.w * s) / 2,
                            h / 2 - (planet.h * s) / 2 + 10 * s,
                            s,
                        );
                    }
                }
                draw_bitmap_text(
                    surface,
                    &self.font14,
                    "SCIENCE II // PLANETARY SURFACE SCAN",
                    (ox + 34 * s).max(8),
                    (oy + 14 * s).max(8),
                    Some(0x0078_D0FF),
                    s,
                );
            }
        }
    }
}

impl Default for ScienceStationsModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for ScienceStationsModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();
        self.station_setting = ctx.module.raw_control_value[0].clamp(0, 3);
        let dur_raw = ctx.module.raw_control_value[1].clamp(0, 100);
        self.duration_ticks = (100 + dur_raw * 4) as usize;
        let spd_raw = ctx.module.raw_control_value[2].clamp(0, 100);
        self.speed_div = if spd_raw < 33 {
            5
        } else if spd_raw < 66 {
            3
        } else {
            1
        };
        self.active_station = if self.station_setting == 3 {
            ctx.rng.rand_mod(3)
        } else {
            self.station_setting
        };
        self.station_ticks = 0;
        self.tick = 0;

        tng_pack().play_voice(ctx.sound, ctx.system.sound_enabled, SND_SCIENCES);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.render_station(ctx.surface);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.tick = self.tick.wrapping_add(1);
        self.station_ticks += 1;
        let pack = tng_pack();

        if self.station_setting == 3 && self.station_ticks >= self.duration_ticks {
            self.station_ticks = 0;
            self.active_station = (self.active_station + 1) % 3;
            let snd = if ctx.rng.rand_mod(2) == 0 {
                SND_SCIENCES
            } else {
                SND_SENSOR_ALERT
            };
            pack.play_voice(ctx.sound, ctx.system.sound_enabled, snd);
        } else if self.tick % 44 == 22 {
            let b = if ctx.rng.rand_mod(2) == 0 {
                SND_BEEP1
            } else {
                SND_BEEP2
            };
            pack.play_voice(ctx.sound, ctx.system.sound_enabled, b);
        }

        self.render_station(ctx.surface);
        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        AdResult::NoError
    }
}
