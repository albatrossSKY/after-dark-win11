//! *Simpsons Clocks* — 1994 *The Simpsons* After Dark 3.0 Module.
//!
//! Three animated Simpsons wall clocks showing your real system time:
//! - **Duff Brewery Cuckoo Clock** (`RLEP #19000`) — swinging doors, Barney & Lenny,
//!   flickering neon Duff sign, scurrying rat, and belch chimes!
//! - **Krusty Pop-Eye Clock** (`RLEP #19100`) — spring-loaded popping eyes, wagging
//!   pink tongue, comic starburst dial, and Krusty laughs!
//! - **Maggie Wall Clock** (`RLEP #19200`) — blinking eyes & sucking pacifier!

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};
use windows_sys::Win32::Foundation::SYSTEMTIME;
use windows_sys::Win32::System::SystemInformation::GetLocalTime;

use super::{
    MOD_SIMPSONS_CLOCKS, RlepBank, SND_BARNEY_YOHO, SND_DUFF_BELCH, SND_HORN_HONK, SND_KRUSTY_LAGH,
    SND_MAGGIE_SUCK, SND_NEON_SPARK, SND_RAT, SND_TICK, SimpsonsPack, draw_line_px, fill_circle_px,
    restore_or_clear,
};

pub struct SimpsonsClocksModule {
    duff_bank: RlepBank,
    krusty_bank: RlepBank,
    maggie_bank: RlepBank,
    saved_bg: Vec<u32>,
    clear_screen: bool,
    clock_setting: i32, // 0=Duff, 1=Krusty, 2=Maggie, 3=Random
    active_clock: i32,
    sound_mode: i32, // 0=Chimes&Ticks, 1=ChimesOnly, 2=TicksOnly, 3=Neither
    redraw_ticks: usize,
    clock_cx: i32,
    clock_cy: i32,
    last_sec: u16,
    chime_ticks: usize,
    rat_x: f32,
    rat_active: bool,
    tick: usize,
    scale: i32,
}

impl SimpsonsClocksModule {
    pub fn new() -> Self {
        Self {
            duff_bank: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            krusty_bank: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            maggie_bank: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            saved_bg: Vec::new(),
            clear_screen: true,
            clock_setting: 3,
            active_clock: 0,
            sound_mode: 0,
            redraw_ticks: 900,
            clock_cx: 320,
            clock_cy: 240,
            last_sec: 99,
            chime_ticks: 0,
            rat_x: 0.0,
            rat_active: false,
            tick: 0,
            scale: 1,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "simpsons_clocks".to_string(),
            name: "Simpsons Clocks".to_string(),
            credit: "By Jarir Maani and Jeff Thomas.\nSoftware © 1994 Berkeley Systems, Inc.\nThe Simpsons ™ & © Twentieth Century Fox.".to_string(),
            about: "TICK TOCK TICK TOCK! Choose between the Duff Brewery Cuckoo Clock, the Krusty Pop-Eye Clock, and the Maggie Wall Clock — complete with real system time, ticks, and authentic Springfield chimes!".to_string(),
            controls: [
                AdControl::Menu {
                    title: "Clock:".to_string(),
                    default_index: 3,
                    choices: vec![
                        "Duff".into(),
                        "Krusty".into(),
                        "Maggie".into(),
                        "Random".into(),
                    ],
                },
                AdControl::LabeledSlider {
                    title: "Redraw Every:".to_string(),
                    default_raw: 30,
                    labels: vec![
                        "5 min.".into(),
                        "15 min.".into(),
                        "30 min.".into(),
                        "45 min.".into(),
                        "60 min.".into(),
                    ],
                    thresholds: vec![0, 20, 40, 60, 80],
                },
                AdControl::Menu {
                    title: "Sounds:".to_string(),
                    default_index: 0,
                    choices: vec![
                        "Chimes & Ticks".into(),
                        "Chimes Only".into(),
                        "Ticks Only".into(),
                        "Neither".into(),
                    ],
                },
                AdControl::Checkbox {
                    title: "Clear Screen First".to_string(),
                    default_checked: true,
                },
            ],
            target_frame_ms: 80,
            filename: "SIMPCLK.AD".to_string(),
        }
    }

    fn ensure_loaded(&mut self) {
        if !self.duff_bank.frames.is_empty() {
            return;
        }
        self.duff_bank = RlepBank::load(MOD_SIMPSONS_CLOCKS, 19000);
        self.krusty_bank = RlepBank::load(MOD_SIMPSONS_CLOCKS, 19100);
        self.maggie_bank = RlepBank::load(MOD_SIMPSONS_CLOCKS, 19200);
    }

    fn draw_hands(
        &self,
        surface: &mut ad_sdk::canvas::AdSurface,
        cx: i32,
        cy: i32,
        r: i32,
        hour: u16,
        min: u16,
        sec: u16,
        hand_rgb: u32,
        sec_rgb: u32,
    ) {
        use std::f32::consts::TAU;
        let hr_ang = (((hour % 12) as f32 + (min as f32 / 60.0)) / 12.0) * TAU - TAU * 0.25;
        let mn_ang = (((min as f32) + (sec as f32 / 60.0)) / 60.0) * TAU - TAU * 0.25;
        let sc_ang = (sec as f32 / 60.0) * TAU - TAU * 0.25;

        let hr_len = (r as f32) * 0.56;
        let mn_len = (r as f32) * 0.82;
        let sc_len = (r as f32) * 0.90;

        draw_line_px(
            surface,
            cx,
            cy,
            cx + (hr_ang.cos() * hr_len) as i32,
            cy + (hr_ang.sin() * hr_len) as i32,
            hand_rgb,
            (3 * self.scale).max(2),
        );
        draw_line_px(
            surface,
            cx,
            cy,
            cx + (mn_ang.cos() * mn_len) as i32,
            cy + (mn_ang.sin() * mn_len) as i32,
            hand_rgb,
            (2 * self.scale).max(2),
        );
        draw_line_px(
            surface,
            cx,
            cy,
            cx + (sc_ang.cos() * sc_len) as i32,
            cy + (sc_ang.sin() * sc_len) as i32,
            sec_rgb,
            self.scale.max(1),
        );
        fill_circle_px(surface, cx, cy, (3 * self.scale).max(3), sec_rgb);
    }

    fn render_clock(&self, surface: &mut ad_sdk::canvas::AdSurface, st: &SYSTEMTIME) {
        let s = self.scale;
        let cx = self.clock_cx;
        let cy = self.clock_cy;

        match self.active_clock {
            0 => {
                // DUFF BREWERY CUCKOO CLOCK (#19000)
                if let Some(body) = self.duff_bank.frames.get(4) {
                    let bx = cx - (body.w * s) / 2;
                    let by = cy - (body.h * s) / 2;
                    body.blit_scaled(surface, bx, by, s);

                    // Left & right doorway gag doors: open during chime!
                    let door_idx = if self.chime_ticks > 0 { 7 } else { 5 };
                    if self.chime_ticks > 0 {
                        // Barney pops out left doorway, Lenny pops out right doorway!
                        let b_fi = (self.tick / 3) % 4;
                        if let Some(barney) = self.duff_bank.frames.get(b_fi) {
                            barney.blit_scaled(surface, bx + 42 * s, by + 132 * s, s);
                        }
                        if let Some(lenny) = self.duff_bank.frames.get(9) {
                            lenny.blit_scaled(surface, bx + 188 * s, by + 140 * s, s);
                        }
                    }
                    if let Some(door) = self.duff_bank.frames.get(door_idx) {
                        door.blit_scaled(surface, bx + 46 * s, by + 118 * s, s);
                        door.blit_scaled(surface, bx + 188 * s, by + 118 * s, s);
                    }

                    // Flickering neon "Duff" sign above left wing
                    if (self.tick / 4) % 7 != 0 {
                        if let Some(neon) = self.duff_bank.frames.get(10) {
                            neon.blit_scaled(surface, bx + 2 * s, by - 16 * s, s);
                        }
                    }

                    // Homer & Barney lounging in chair beside the brewery
                    if let Some(couch) = self.duff_bank.frames.get(8) {
                        couch.blit_scaled(surface, bx + body.w * s - 44 * s, by + body.h * s - 48 * s, s);
                    }

                    // Scurrying pink rat along the bottom brick ledge
                    if self.rat_active {
                        if let Some(rat) = self.duff_bank.frames.get(11) {
                            rat.blit_scaled(
                                surface,
                                bx + (self.rat_x as i32) * s,
                                by + (body.h - 20) * s,
                                s,
                            );
                        }
                    }

                    // Clock hands on upper orange Duff dial (center (132, 66), radius 42)
                    self.draw_hands(
                        surface,
                        bx + 132 * s,
                        by + 66 * s,
                        40 * s,
                        st.wHour,
                        st.wMinute,
                        st.wSecond,
                        0x0010_1018,
                        0x00D8_1818,
                    );
                }
            }
            1 => {
                // KRUSTY POP-EYE CLOCK (#19100)
                let burst_idx = (self.tick / 4) % 3;
                if let Some(burst) = self.krusty_bank.frames.get(burst_idx) {
                    burst.blit_scaled(
                        surface,
                        cx - (burst.w * s) / 2,
                        cy - (burst.h * s) / 2,
                        s,
                    );
                }
                if let Some(face) = self.krusty_bank.frames.get(4) {
                    let fx = cx - (face.w * s) / 2;
                    let fy = cy - (face.h * s) / 2;
                    face.blit_scaled(surface, fx, fy, s);

                    // Popping spring eyeballs (frames 9..12) on chime or odd seconds!
                    if self.chime_ticks > 0 || (st.wSecond % 5 == 0) {
                        let eye_fi = 9 + ((self.tick / 2) % 4);
                        if let Some(eye) = self.krusty_bank.frames.get(eye_fi) {
                            eye.blit_scaled(surface, fx + 32 * s, fy + 38 * s, s);
                            eye.blit_scaled(surface, fx + 64 * s, fy + 38 * s, s);
                        }
                    }
                    // Wagging pink tongue (frames 13..17)
                    let t_fi = 13 + ((self.tick / 2) % 5);
                    if let Some(tongue) = self.krusty_bank.frames.get(t_fi) {
                        tongue.blit_scaled(surface, fx + 52 * s, fy + 84 * s, s);
                    }
                }
                // 12 bold hour markers around Krusty's starburst ring
                for h in 0..12 {
                    let ang = (h as f32 / 12.0) * std::f32::consts::TAU - std::f32::consts::FRAC_PI_2;
                    let mx = cx + (ang.cos() * 96.0 * s as f32) as i32;
                    let my = cy + (ang.sin() * 96.0 * s as f32) as i32;
                    fill_circle_px(surface, mx, my, 4 * s, 0x00FF_E830);
                }
                self.draw_hands(
                    surface,
                    cx,
                    cy + 4 * s,
                    86 * s,
                    st.wHour,
                    st.wMinute,
                    st.wSecond,
                    0x0014_1420,
                    0x00FF_2020,
                );
            }
            _ => {
                // MAGGIE WALL CLOCK (#19200)
                if let Some(dial) = self.maggie_bank.frames.get(2) {
                    let dx = cx - (dial.w * s) / 2;
                    let dy = cy - (dial.h * s) / 2;
                    dial.blit_scaled(surface, dx, dy, s);

                    // Blinking eyes every ~4 seconds (#19200[1] closed, [0] open)
                    let blink = (self.tick % 48) >= 44;
                    if blink {
                        if let Some(closed) = self.maggie_bank.frames.get(1) {
                            closed.blit_scaled(surface, dx + 61 * s, dy + 72 * s, s);
                        }
                    }
                    // Pacifier suck bobbing (#19200[3])
                    let pac_bob = if (self.tick / 3) % 2 == 0 { 0 } else { 2 * s };
                    if let Some(pac) = self.maggie_bank.frames.get(3) {
                        pac.blit_scaled(surface, dx + 89 * s, dy + 115 * s + pac_bob, s);
                    }

                    self.draw_hands(
                        surface,
                        dx + 108 * s,
                        dy + 108 * s,
                        84 * s,
                        st.wHour,
                        st.wMinute,
                        st.wSecond,
                        0x0018_2458,
                        0x00E4_2424,
                    );
                }
            }
        }
    }
}

impl Default for SimpsonsClocksModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for SimpsonsClocksModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();
        self.saved_bg = ctx.surface.pixels().to_vec();
        self.clock_setting = ctx.module.raw_control_value[0].clamp(0, 3);
        let redraw_raw = ctx.module.raw_control_value[1].clamp(0, 100);
        self.redraw_ticks = (360 + redraw_raw * 18) as usize;
        self.sound_mode = ctx.module.raw_control_value[2].clamp(0, 3);
        self.clear_screen = ctx.module.raw_control_value[3] != 0;

        self.active_clock = if self.clock_setting == 3 {
            ctx.rng.rand_mod(3)
        } else {
            self.clock_setting
        };
        self.scale = if ctx.surface.width >= 960 && ctx.surface.height >= 640 {
            2
        } else {
            1
        };
        self.clock_cx = ctx.surface.width / 2;
        self.clock_cy = ctx.surface.height / 2;
        self.last_sec = 99;
        self.chime_ticks = 24;
        self.rat_active = false;
        self.rat_x = 10.0;
        self.tick = 0;

        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        restore_or_clear(ctx.surface, &self.saved_bg, self.clear_screen, 0x000A_0E1A);
        let st = unsafe {
            let mut s: SYSTEMTIME = std::mem::zeroed();
            GetLocalTime(&mut s);
            s
        };
        self.render_clock(ctx.surface, &st);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.tick = self.tick.wrapping_add(1);
        let pack = SimpsonsPack::global();

        let st = unsafe {
            let mut s: SYSTEMTIME = std::mem::zeroed();
            GetLocalTime(&mut s);
            s
        };

        let do_ticks = self.sound_mode == 0 || self.sound_mode == 2;
        let do_chimes = self.sound_mode == 0 || self.sound_mode == 1;

        if st.wSecond != self.last_sec {
            self.last_sec = st.wSecond;
            if do_ticks {
                let snd = if self.active_clock == 2 && (st.wSecond % 3 == 0) {
                    SND_MAGGIE_SUCK
                } else {
                    SND_TICK
                };
                pack.play_voice(ctx.sound, ctx.system.sound_enabled, snd);
            }
            // Trigger fun mini-chime every 15 seconds (and on top of the minute!)
            if st.wSecond % 15 == 0 {
                self.chime_ticks = 26;
                if do_chimes {
                    let chime = match self.active_clock {
                        0 => {
                            if ctx.rng.rand_mod(2) == 0 {
                                SND_DUFF_BELCH
                            } else {
                                SND_BARNEY_YOHO
                            }
                        }
                        1 => {
                            if ctx.rng.rand_mod(2) == 0 {
                                SND_KRUSTY_LAGH
                            } else {
                                SND_HORN_HONK
                            }
                        }
                        _ => SND_MAGGIE_SUCK,
                    };
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, chime);
                }
            }
        }

        if self.chime_ticks > 0 {
            self.chime_ticks -= 1;
        }

        // Duff rat scurry & neon buzz
        if self.active_clock == 0 {
            if !self.rat_active && self.tick % 90 == 30 {
                self.rat_active = true;
                self.rat_x = 200.0;
                if do_chimes {
                    pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_RAT);
                }
            }
            if self.rat_active {
                self.rat_x -= 4.5;
                if self.rat_x < -10.0 {
                    self.rat_active = false;
                }
            }
            if self.tick % 110 == 55 && do_chimes {
                pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_NEON_SPARK);
            }
        }

        // Periodically reposition / rotate clock (preventing burn-in, just like original!)
        if self.tick % self.redraw_ticks == 0 {
            if self.clock_setting == 3 {
                self.active_clock = (self.active_clock + 1) % 3;
            }
            let pad_x = (140 * self.scale).min(ctx.surface.width / 3);
            let pad_y = (120 * self.scale).min(ctx.surface.height / 3);
            self.clock_cx =
                pad_x + ctx.rng.rand_mod((ctx.surface.width - pad_x * 2).max(1));
            self.clock_cy =
                pad_y + ctx.rng.rand_mod((ctx.surface.height - pad_y * 2).max(1));
        }

        restore_or_clear(ctx.surface, &self.saved_bg, self.clear_screen, 0x000A_0E1A);
        self.render_clock(ctx.surface, &st);
        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        self.saved_bg.clear();
        AdResult::NoError
    }
}
