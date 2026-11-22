//! *Krusty* — 1994 *The Simpsons* After Dark 3.0 Module.
//!
//! Everybody strap on your nicotine patches — it's Krusty the Clown!
//! Composites all authentic `OFst/OFtb #13000..#13001` multi-layer stage routines:
//! floor spotlight (`R03`), standing/dancing/unicycle legs (`R00`/`R32`/`R34`/`R57`/`R60`),
//! upper-body comedy, smoking, makeup, hand shadow puppets (with wall spotlight `R18`),
//! juggling dolls/pins/pies/balls, unicycle act, pie-in-face + bandaged monologue,
//! and heckling tomato splats — all scaled by the `Success:` slider!

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use super::{
    CompoundAnim, MOD_KRUSTY, SND_CHEERS, SND_COUGH, SND_CRICKET, SND_DRUM_ROLL, SND_HORN_HONK,
    SND_KRUSTY_CORP, SND_KRUSTY_GRNT, SND_KRUSTY_GRT1, SND_KRUSTY_GRT4, SND_KRUSTY_HELL,
    SND_KRUSTY_KIDS, SND_KRUSTY_LAGH, SND_KRUSTY_LVES, SND_KRUSTY_WHO, SND_KRUSTY_YEH, SND_SPLAT,
    SND_SPOTLIGHT, SimpsonsPack, fill_rect_px,
};

const KRUSTY_VOICES: &[i16] = &[
    SND_KRUSTY_HELL,
    SND_KRUSTY_KIDS,
    SND_KRUSTY_LAGH,
    SND_KRUSTY_WHO,
    SND_KRUSTY_LVES,
    SND_KRUSTY_YEH,
    SND_KRUSTY_CORP,
    SND_KRUSTY_GRNT,
    SND_KRUSTY_GRT1,
    SND_KRUSTY_GRT4,
];

/// Solid black 90x144 offstage matte sprite (`sp_id = 2`, 0-based index `1`) used in 1994
/// to mask offstage props on a pure-black screen; skipped on our lit Krustylu theater stage.
const KRUSTY_BLACK_MATTE_SPRITE: usize = 1;

/// One curated multi-layer Krusty stage routine step.
#[derive(Clone, Copy)]
struct KrustyStep {
    /// Floor spotlight frame (`Some(3)` static, or moving unicycle spotlight frame).
    spot: Option<usize>,
    /// Optional rear wall puppet spotlight (`Some(288)` during hand shadow puppets).
    wall_spot: Option<usize>,
    /// Lower body / legs frame (`Some(0)` standing, or synchronized dancing/unicycle legs).
    legs: Option<usize>,
    /// Primary upper-body animation frame.
    torso: usize,
    /// Optional foreground overlay (dizzy stars `887..889` or thrown tomato splats `1003..1027`).
    overlay: Option<usize>,
    /// Optional SFX triggered on this exact step.
    sfx: Option<i16>,
}

fn push_standing_range(out: &mut Vec<KrustyStep>, start: usize, end: usize) {
    for f in start..=end {
        out.push(KrustyStep {
            spot: Some(3),
            wall_spot: None,
            legs: Some(0),
            torso: f,
            overlay: None,
            sfx: None,
        });
    }
}

fn build_act(act_id: usize) -> Vec<KrustyStep> {
    let mut s = Vec::new();
    match act_id {
        0 => {
            // Stand-up comedy monologue + laugh (R05 + R64)
            push_standing_range(&mut s, 5, 43);
            push_standing_range(&mut s, 984, 1002);
            if let Some(first) = s.first_mut() {
                first.sfx = Some(SND_KRUSTY_HELL);
            }
        }
        1 => {
            // Juggling miniature Krusty dolls (R22 -> R25 x2 -> R26 -> R37 catch!)
            push_standing_range(&mut s, 316, 330);
            for _ in 0..2 {
                push_standing_range(&mut s, 361, 369);
            }
            push_standing_range(&mut s, 370, 387);
            push_standing_range(&mut s, 682, 694);
            if let Some(mid) = s.get_mut(15) {
                mid.sfx = Some(SND_DRUM_ROLL);
            }
        }
        2 => {
            // Juggling bowling pins (R23 -> R35 x2 -> R27 -> R38)
            push_standing_range(&mut s, 331, 345);
            for _ in 0..2 {
                push_standing_range(&mut s, 651, 659);
            }
            push_standing_range(&mut s, 388, 405);
            push_standing_range(&mut s, 695, 707);
            if let Some(mid) = s.get_mut(15) {
                mid.sfx = Some(SND_HORN_HONK);
            }
        }
        3 => {
            // Juggling cream pies (R24 -> R28 -> R52 -> R39)
            push_standing_range(&mut s, 346, 360);
            push_standing_range(&mut s, 406, 423);
            push_standing_range(&mut s, 843, 851);
            push_standing_range(&mut s, 708, 720);
        }
        4 => {
            // Unicycle ride! Synchronized 3-layer R57/R58/R59 intro + R60/R61/R62 pedaling loop!
            for i in 0..6 {
                s.push(KrustyStep {
                    spot: Some(902 + i),
                    wall_spot: None,
                    legs: Some(890 + i),
                    torso: 896 + i,
                    overlay: None,
                    sfx: if i == 0 { Some(SND_DRUM_ROLL) } else { None },
                });
            }
            for _ in 0..5 {
                for i in 0..4 {
                    s.push(KrustyStep {
                        spot: Some(916 + i),
                        wall_spot: None,
                        legs: Some(908 + i),
                        torso: 912 + i,
                        overlay: None,
                        sfx: None,
                    });
                }
            }
            for i in (0..6).rev() {
                s.push(KrustyStep {
                    spot: Some(902 + i),
                    wall_spot: None,
                    legs: Some(890 + i),
                    torso: 896 + i,
                    overlay: None,
                    sfx: None,
                });
            }
        }
        5 => {
            // Hand shadow puppets (R11..R17) with rear wall puppet spotlight R18 (idx=288)!
            for f in 223..=287 {
                s.push(KrustyStep {
                    spot: Some(3),
                    wall_spot: Some(288),
                    legs: Some(0),
                    torso: f,
                    overlay: None,
                    sfx: if f == 223 { Some(SND_SPOTLIGHT) } else { None },
                });
            }
        }
        6 => {
            // Juggling balls & mixed props showcase (R50 x2 -> R51 -> R53)
            for _ in 0..2 {
                push_standing_range(&mut s, 823, 831);
            }
            push_standing_range(&mut s, 832, 842);
            push_standing_range(&mut s, 852, 886);
        }
        7 => {
            // Smoking cigarette & coughing fit (R06 -> R07)
            push_standing_range(&mut s, 44, 82);
            let cough_start = s.len();
            push_standing_range(&mut s, 83, 107);
            if let Some(st) = s.get_mut(cough_start) {
                st.sfx = Some(SND_COUGH);
            }
        }
        8 => {
            // Reading comic/joke book (R08) & applying clown makeup in mirror (R09)
            push_standing_range(&mut s, 108, 149);
            push_standing_range(&mut s, 150, 200);
        }
        9 => {
            // Synchronized 63-frame fumble/drop routine: R33 upper (525..587) + R34 legs (588..650)!
            for i in 0..63 {
                s.push(KrustyStep {
                    spot: Some(3),
                    wall_spot: None,
                    legs: Some(588 + i),
                    torso: 525 + i,
                    overlay: None,
                    sfx: if i == 30 { Some(SND_KRUSTY_GRNT) } else { None },
                });
            }
        }
        10 => {
            // Pie in the face (R10) -> Bandaged head dizzy stars -> Bandaged monologue (R70..R71)!
            push_standing_range(&mut s, 201, 222);
            if let Some(hit) = s.get_mut(8) {
                hit.sfx = Some(SND_SPLAT);
            }
            for i in 0..12 {
                s.push(KrustyStep {
                    spot: Some(3),
                    wall_spot: None,
                    legs: Some(0),
                    torso: 2, // bandaged idle Krusty
                    overlay: Some(887 + (i % 3)), // spinning dizzy stars
                    sfx: None,
                });
            }
            push_standing_range(&mut s, 1028, 1090);
            push_standing_range(&mut s, 1091, 1109);
        }
        _ => {
            // Washed-up heckling: Krusty talking (R63) while audience pelts tomatoes (R65..R69)!
            for i in 0..64 {
                let tomato = if i >= 8 && i < 33 {
                    Some(1003 + (i - 8))
                } else {
                    None
                };
                let sfx = if i == 8 || i == 18 || i == 28 {
                    Some(SND_SPLAT)
                } else {
                    None
                };
                s.push(KrustyStep {
                    spot: Some(3),
                    wall_spot: None,
                    legs: Some(505 + (i % 20)), // nervous tapping feet R32
                    torso: 920 + i,
                    overlay: tomato,
                    sfx,
                });
            }
        }
    }
    s
}

pub struct KrustyModule {
    anim: Option<CompoundAnim>,
    playlist: Vec<KrustyStep>,
    step_idx: usize,
    last_act: usize,
    success_level: i32,
    tick: usize,
    scale_f: f32,
    stage_ox: i32,
    stage_oy: i32,
}

impl KrustyModule {
    pub fn new() -> Self {
        Self {
            anim: None,
            playlist: Vec::new(),
            step_idx: 0,
            last_act: 99,
            success_level: 62,
            tick: 0,
            scale_f: 1.7,
            stage_ox: 0,
            stage_oy: 0,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "simpsons_krusty".to_string(),
            name: "Krusty".to_string(),
            credit: "By Gabriel Jensen and Jeff Thomas.\nSoftware © 1994 Berkeley Systems, Inc.\nThe Simpsons ™ & © Twentieth Century Fox.".to_string(),
            about: "Everybody strap on your nicotine patches — it's Krusty the Clown! Watch Mr. Entertainment juggle, ride a unicycle, make shadow puppets, and survive heckling audiences across authentic Krustylu stage routines.".to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "Success:".to_string(),
                    default_raw: 62,
                    labels: vec![
                        "Washed-up".into(),
                        "Lounge Lizard".into(),
                        "Entertainer".into(),
                        "Artiste".into(),
                    ],
                    thresholds: vec![0, 25, 50, 75],
                },
                AdControl::None,
                AdControl::None,
                AdControl::None,
            ],
            target_frame_ms: 75,
            filename: "KRUSTY.AD".to_string(),
        }
    }

    fn pick_next_act(&mut self, rng: &mut ad_sdk::MsvcRand) {
        // Weight acts cleanly by the Success slider (Washed-up -> Artiste)
        let pool: &[usize] = if self.success_level < 25 {
            &[7, 9, 10, 11, 8, 0]
        } else if self.success_level < 50 {
            &[0, 7, 8, 9, 10, 11, 5, 1]
        } else if self.success_level < 75 {
            &[1, 2, 3, 4, 5, 6, 0, 8, 9]
        } else {
            &[1, 2, 3, 4, 5, 6, 0]
        };
        let mut pick = pool[rng.rand_mod(pool.len() as i32) as usize];
        if pick == self.last_act && pool.len() > 1 {
            pick = pool[(rng.rand_mod(pool.len() as i32) as usize + 1) % pool.len()];
        }
        self.last_act = pick;
        self.playlist = build_act(pick);
        self.step_idx = 0;
    }

    fn draw_stage(&self, surface: &mut ad_sdk::canvas::AdSurface) {
        let w = surface.width;
        let h = surface.height;
        let sf = self.scale_f;

        // Exact Krusty stage alignment:
        // R00 feet sit at x=[276..349] (center 313), bottom y=253; R03 spotlight centers at (312, 250).
        let spot_cx = self.stage_ox + (312.0 * sf).round() as i32;
        let spot_cy = self.stage_oy + (250.0 * sf).round() as i32;
        let floor_y = (spot_cy - (30.0 * sf).round() as i32).clamp(h / 2, h - 20);
        let curtain_w = ((w as f32 * 0.14).max(36.0)) as i32;
        let fold_w = (curtain_w as f32 / 3.5).max(12.0);
        let top_valance = (h as f32 * 0.08).max(18.0) as i32;

        // Full-widescreen Krustylu Studios theater stage with burgundy curtains, hardwood planks & spotlight
        let dst = surface.pixels_mut();
        for y in 0..h {
            let row = (y * w) as usize;
            let yt = y as f32 / spot_cy.max(1) as f32;
            let cone_half = (24.0 + yt.clamp(0.0, 1.3) * 112.0) * sf;
            for x in 0..w {
                let mut r: f32;
                let mut g: f32;
                let mut b: f32;

                if y < top_valance {
                    let f = ((x as f32 / fold_w * std::f32::consts::PI).sin().abs()).powf(0.6);
                    r = 62.0 + f * 48.0;
                    g = 10.0 + f * 8.0;
                    b = 18.0 + f * 12.0;
                } else if x < curtain_w || x >= w - curtain_w {
                    let local_x = if x < curtain_w { x } else { w - 1 - x };
                    let f =
                        ((local_x as f32 / fold_w * std::f32::consts::PI).sin().abs()).powf(0.65);
                    let edge_dim = 1.0 - (local_x as f32 / curtain_w.max(1) as f32) * 0.35;
                    r = (76.0 + f * 58.0) * edge_dim;
                    g = (10.0 + f * 10.0) * edge_dim;
                    b = (20.0 + f * 14.0) * edge_dim;
                } else if y < floor_y {
                    let f = ((x as f32 / (fold_w * 1.4) * std::f32::consts::PI).sin().abs()) * 0.35;
                    r = 12.0 + f * 14.0;
                    g = 10.0 + f * 10.0;
                    b = 20.0 + f * 18.0;
                } else {
                    let ft = (y - floor_y) as f32 / (h - floor_y).max(1) as f32;
                    let plank = if ((y - floor_y) % ((h / 26).max(6))) == 0 {
                        -10.0
                    } else {
                        0.0
                    };
                    r = 46.0 + ft * 22.0 + plank;
                    g = 28.0 + ft * 14.0 + plank * 0.6;
                    b = 16.0 + ft * 8.0 + plank * 0.4;
                }

                if y >= top_valance && x >= curtain_w && x < w - curtain_w {
                    let dx = (x - spot_cx).abs() as f32;
                    if dx < cone_half {
                        let edge = 1.0 - (dx / cone_half);
                        let beam = edge * edge * (0.45 + 0.55 * yt.clamp(0.0, 1.0));
                        r += beam * 54.0;
                        g += beam * 46.0;
                        b += beam * 22.0;
                    }
                    if y >= floor_y {
                        let rx = (x - spot_cx) as f32 / (140.0 * sf).max(1.0);
                        let ry = (y - spot_cy) as f32 / (46.0 * sf).max(1.0);
                        let d2 = rx * rx + ry * ry;
                        if d2 < 1.0 {
                            let pool = (1.0 - d2) * (1.0 - d2);
                            r += pool * 72.0;
                            g += pool * 62.0;
                            b += pool * 28.0;
                        }
                    }
                }

                dst[row + x as usize] = ((r.clamp(0.0, 255.0) as u32) << 16)
                    | ((g.clamp(0.0, 255.0) as u32) << 8)
                    | (b.clamp(0.0, 255.0) as u32);
            }
        }
        fill_rect_px(surface, curtain_w, floor_y, w - curtain_w, floor_y + 2, 0x0048_341E);

        if let (Some(anim), Some(step)) = (&self.anim, self.playlist.get(self.step_idx)) {
            let ox = self.stage_ox as f32;
            let oy = self.stage_oy as f32;
            let skip = Some(KRUSTY_BLACK_MATTE_SPRITE);

            // 1. Floor oval spotlight (authentic stage frame R03 or moving unicycle spotlight R59/R62)
            if let Some(spot_fi) = step.spot {
                anim.draw_stage_frame_f_ex(surface, spot_fi, ox, oy, sf, false, true, skip, false);
            }
            // 2. Wall puppet spotlight (R18) behind Krusty's shadow silhouettes
            if let Some(wall_fi) = step.wall_spot {
                anim.draw_stage_frame_f_ex(surface, wall_fi, ox, oy, sf, false, true, skip, false);
            }
            // 3. Lower body / legs (standing R00, tapping R32, fumble R34, or unicycle R57/R60)
            if let Some(legs_fi) = step.legs {
                anim.draw_stage_frame_f_ex(surface, legs_fi, ox, oy, sf, false, false, skip, false);
            }
            // 4. Upper-body comedy / juggling / puppet / unicycle act
            anim.draw_stage_frame_f_ex(surface, step.torso, ox, oy, sf, false, false, skip, false);
            // 5. Optional foreground overlay (dizzy stars or thrown tomato splats)
            if let Some(ov_fi) = step.overlay {
                anim.draw_stage_frame_f_ex(surface, ov_fi, ox, oy, sf, false, false, skip, false);
            }
        }
    }
}

impl Default for KrustyModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for KrustyModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        if self.anim.is_none() {
            self.anim = Some(CompoundAnim::load(MOD_KRUSTY, 13000));
        }
        self.success_level = ctx.module.raw_control_value[0].clamp(0, 100);
        // Krusty full height (props + head + legs + spotlight) spans y=[62..276] (~214px tall)
        self.scale_f = (ctx.surface.height as f32 / 290.0).clamp(1.1, 4.2);
        // Center exact feet/spotlight anchor (313, 184) horizontally & vertically on stage!
        self.stage_ox = ctx.surface.width / 2 - (313.0 * self.scale_f).round() as i32;
        self.stage_oy = (ctx.surface.height as f32 * 0.56).round() as i32
            - (184.0 * self.scale_f).round() as i32;

        self.last_act = 99;
        self.pick_next_act(ctx.rng);
        self.tick = 0;

        let pack = SimpsonsPack::global();
        pack.play_voice(ctx.sound, ctx.system.sound_enabled, SND_SPOTLIGHT);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.draw_stage(ctx.surface);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.tick = self.tick.wrapping_add(1);
        let pack = SimpsonsPack::global();

        if self.playlist.is_empty() {
            self.pick_next_act(ctx.rng);
        } else {
            self.step_idx += 1;
            if self.step_idx >= self.playlist.len() {
                // End-of-act audience reaction scaled by Success!
                let reaction = if self.success_level < 25 {
                    if ctx.rng.rand_mod(2) == 0 {
                        SND_CRICKET
                    } else {
                        SND_COUGH
                    }
                } else if self.success_level < 50 {
                    if ctx.rng.rand_mod(2) == 0 {
                        SND_COUGH
                    } else {
                        SND_HORN_HONK
                    }
                } else if self.success_level < 75 {
                    if ctx.rng.rand_mod(2) == 0 {
                        SND_DRUM_ROLL
                    } else {
                        SND_CHEERS
                    }
                } else {
                    SND_CHEERS
                };
                pack.play_voice(ctx.sound, ctx.system.sound_enabled, reaction);
                self.pick_next_act(ctx.rng);
            }
        }

        if let Some(step) = self.playlist.get(self.step_idx) {
            if let Some(sfx) = step.sfx {
                pack.play_voice(ctx.sound, ctx.system.sound_enabled, sfx);
            }
        }

        if self.tick % 75 == 30 {
            let v = KRUSTY_VOICES[ctx.rng.rand_mod(KRUSTY_VOICES.len() as i32) as usize];
            pack.play_voice(ctx.sound, ctx.system.sound_enabled, v);
        }

        self.draw_stage(ctx.surface);
        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        AdResult::NoError
    }
}
