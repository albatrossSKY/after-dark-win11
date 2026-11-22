//! *Science Stations* — 1994 *Star Trek: The Next Generation* After Dark 3.0 Module.
//!
//! Full-widescreen responsive Enterprise-D Main Bridge aft Science I, Science II,
//! and Isolinear Circuit Pattern Analysis LCARS consoles (`OFst/OFtb #7000/#8000`,
//! `RLEP #6000/#7000..#7002/#8000/#9000`) with complete two-half composite base
//! frames, fractional high-DPI stage fitting, animated LCARS side telemetry wings,
//! holographic planets, and authentic bridge sensor chimes.

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::simpsons::{CompoundAnim, RlepBank, draw_bitmap_text, fill_rect_px};
use super::{
    LCARS_AMBER, LCARS_SKY, LcarsFontSet, MOD_SCIENCE, SND_BEEP1, SND_BEEP2, SND_SCIENCES,
    SND_SENSOR_ALERT, draw_lcars_wing_telemetry, load_anim, load_rlep, stage_fit, tng_pack,
};

pub struct ScienceStationsModule {
    sci_anim: Option<CompoundAnim>,
    circuit_anim: Option<CompoundAnim>,
    chips_bank: RlepBank,
    planet_bank: RlepBank,
    fonts: LcarsFontSet,
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
            fonts: LcarsFontSet::empty(),
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
        self.fonts.ensure_loaded();
    }

    fn render_station(&self, surface: &mut ad_sdk::canvas::AdSurface) {
        let w = surface.width;
        let h = surface.height;
        fill_rect_px(surface, 0, 0, w, h, 0x0000_0000);

        let pad = (h / 48).clamp(6, 18);
        let anim_step = self.tick / self.speed_div.max(1);
        let hdr_px = (h / 30).clamp(14, 28);
        let (f_hdr, s_hdr, _) = self.fonts.pick(hdr_px);

        match self.active_station {
            0 => {
                // ISOLINEAR CIRCUIT PATTERN ANALYSIS: OFst #8000 stage=(30,18)..(435,426) [405x408]
                let (sf, box_x, box_y) = stage_fit(w, h, 420.0, 424.0, pad, pad);
                let stage_x = box_x - 24.0 * sf;
                let stage_y = box_y - 12.0 * sf;

                let wing_l = box_x.round() as i32;
                let wing_r = (box_x + 420.0 * sf).round() as i32;
                draw_lcars_wing_telemetry(surface, 0, 0, wing_l, h, self.tick, &self.fonts, false);
                draw_lcars_wing_telemetry(surface, wing_r, 0, w, h, self.tick, &self.fonts, true);

                if let Some(ca) = &self.circuit_anim {
                    if !ca.frames.is_empty() {
                        ca.draw_stage_frame_f(surface, 0, stage_x, stage_y, sf, false, false);
                    }
                    if ca.frames.len() > 1 {
                        ca.draw_stage_frame_f(surface, 1, stage_x, stage_y, sf, false, false);
                    }
                }
                draw_bitmap_text(
                    surface,
                    f_hdr,
                    "ISOLINEAR CIRCUIT PATTERN ANALYSIS",
                    (stage_x + 96.0 * sf).round() as i32,
                    (stage_y + 18.0 * sf).round() as i32,
                    Some(LCARS_AMBER),
                    s_hdr,
                );

                // Grid of pulsing isolinear optical chips (#6000, 27 frames) scaled cleanly into console bay!
                let nchips = self.chips_bank.frames.len();
                if nchips > 0 {
                    let cols = 5;
                    let rows = 4;
                    let gx0 = stage_x + 114.0 * sf;
                    let gy0 = stage_y + 132.0 * sf;
                    for r in 0..rows {
                        for c in 0..cols {
                            let ci = (anim_step + r * 5 + c * 3) % nchips;
                            let chip = &self.chips_bank.frames[ci];
                            let px = (gx0 + (c as f32) * 58.0 * sf).round() as i32;
                            let py = (gy0 + (r as f32) * 64.0 * sf).round() as i32;
                            chip.blit_transformed_f(surface, px, py, sf * 0.85, false, false, false, false);
                        }
                    }
                }
            }
            1 => {
                // SCIENCE I: Complete two-half LCARS base frame (f[0] upper + f[1] lower)
                // Stage spans x=45..595 (550px), y=4..459 (455px)
                let (sf, box_x, box_y) = stage_fit(w, h, 560.0, 464.0, pad, pad);
                let stage_x = box_x - 40.0 * sf;
                let stage_y = box_y - 2.0 * sf;

                let wing_l = box_x.round() as i32;
                let wing_r = (box_x + 560.0 * sf).round() as i32;
                draw_lcars_wing_telemetry(surface, 0, 0, wing_l, h, self.tick, &self.fonts, false);
                draw_lcars_wing_telemetry(surface, wing_r, 0, w, h, self.tick, &self.fonts, true);

                if let Some(sa) = &self.sci_anim {
                    if sa.frames.len() > 1 {
                        // Composite BOTH halves of the Science I LCARS frame!
                        sa.draw_stage_frame_f(surface, 0, stage_x, stage_y, sf, false, false);
                        sa.draw_stage_frame_f(surface, 1, stage_x, stage_y, sf, false, false);
                    }
                    // Alternate between sub-space sensor sweep (f[15..28]) and tactical waveform (f[2..9])
                    if sa.frames.len() > 28 {
                        let scan_fi = if (anim_step / 28) % 2 == 0 {
                            15 + (anim_step % 14)
                        } else {
                            2 + (anim_step % 8)
                        };
                        sa.draw_stage_frame_f(surface, scan_fi, stage_x, stage_y, sf, false, false);
                    }
                    // Animated LCARS bar telemetry header (f[36..48])
                    if sa.frames.len() > 48 {
                        let bar_fi = 36 + (anim_step % 13);
                        sa.draw_stage_frame_f(surface, bar_fi, stage_x, stage_y, sf, false, false);
                    }
                }

                let sub = if (anim_step / 18) % 2 == 0 {
                    "FWD NAVIGATIONAL SCAN 302"
                } else {
                    "GALAXY CLASS STARSHIP NCC 1701-D"
                };
                draw_bitmap_text(
                    surface,
                    f_hdr,
                    sub,
                    (stage_x + 110.0 * sf).round() as i32,
                    (stage_y + 28.0 * sf).round() as i32,
                    Some(0x0000_0000),
                    s_hdr,
                );
            }
            _ => {
                // SCIENCE II: Complete two-half LCARS base frame (f[29] upper + f[30] lower)
                // Stage spans x=19..595 (576px), y=4..420 (416px)
                let (sf, box_x, box_y) = stage_fit(w, h, 580.0, 424.0, pad, pad);
                let stage_x = box_x - 16.0 * sf;
                let stage_y = box_y - 2.0 * sf;

                let wing_l = box_x.round() as i32;
                let wing_r = (box_x + 580.0 * sf).round() as i32;
                draw_lcars_wing_telemetry(surface, 0, 0, wing_l, h, self.tick, &self.fonts, false);
                draw_lcars_wing_telemetry(surface, wing_r, 0, w, h, self.tick, &self.fonts, true);

                if let Some(sa) = &self.sci_anim {
                    if sa.frames.len() > 33 {
                        sa.draw_stage_frame_f(surface, 29, stage_x, stage_y, sf, false, false);
                        sa.draw_stage_frame_f(surface, 30, stage_x, stage_y, sf, false, false);
                        // Animated right-side sensor readout (f[31..33])
                        sa.draw_stage_frame_f(
                            surface,
                            31 + (anim_step % 3),
                            stage_x,
                            stage_y,
                            sf,
                            false,
                            false,
                        );
                    }
                }

                // Holographic planetary orbital grid (#9000[4]) + rotating planet (#9000[0..3]) in left viewport!
                if !self.planet_bank.frames.is_empty() {
                    let bay_cx = stage_x + 178.0 * sf;
                    let bay_cy = stage_y + 245.0 * sf;
                    if let Some(grid) = self.planet_bank.frames.get(4) {
                        let gsf = sf * 0.72;
                        let gw = (grid.w as f32 * gsf).round() as i32;
                        let gh = (grid.h as f32 * gsf).round() as i32;
                        grid.blit_rect(
                            surface,
                            bay_cx.round() as i32 - gw / 2,
                            bay_cy.round() as i32 - gh / 2,
                            gw,
                            gh,
                            false,
                            false,
                            true,
                            true,
                        );
                    }
                    let pi = anim_step % 4.min(self.planet_bank.frames.len());
                    if let Some(planet) = self.planet_bank.frames.get(pi) {
                        let psf = sf * 1.45;
                        let pw = (planet.w as f32 * psf).round() as i32;
                        let ph = (planet.h as f32 * psf).round() as i32;
                        planet.blit_rect(
                            surface,
                            bay_cx.round() as i32 - pw / 2,
                            bay_cy.round() as i32 - ph / 2,
                            pw,
                            ph,
                            false,
                            false,
                            true,
                            true,
                        );
                    }
                }

                draw_bitmap_text(
                    surface,
                    f_hdr,
                    "SCIENCE II // PLANETARY SURFACE SCAN",
                    (stage_x + 74.0 * sf).round() as i32,
                    (stage_y + 28.0 * sf).round() as i32,
                    Some(LCARS_SKY),
                    s_hdr,
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
