//! 1:1 Decompilation of `AQUA.AD` ("Aquatic Realm") from After Dark 1.0a (1991).
//!
//! Disassembly-backed from `docs/disasm/aqua_seg1.asm` and `docs/disasm/aqua_data.hex`,
//! embedding all original 1991 sprites & masks (`assets/aqua/RT_BITMAP_#*.bmp`).

use ad_sdk::canvas::{AdBitmap, AdSurface, ROP_SRCAND, ROP_SRCCOPY, ROP_SRCPAINT};
use ad_sdk::palette::rgb;
use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

const NUM_SPECIES: usize = 14; // indices 1..=13 (0 unused, matches `[0x1C] = 0x0E`)

/// Exact species asset mapping verified from `AQUA.AD` (`1:037B..1:06EC` & `aqua_data.hex`):
/// `(frame0_color, frame1_color, frame0_mask, frame1_mask)` for species `1..=13`.
const SPECIES_BMPS: [(&[u8], &[u8], &[u8], &[u8]); 13] = [
    // 1: KELP (stationary swaying seaweed on sea floor)
    (
        include_bytes!("../../../assets/aqua/RT_BITMAP_#1.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#2.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#3.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#4.bmp"),
    ),
    // 2: CRAB (walks along sea floor)
    (
        include_bytes!("../../../assets/aqua/RT_BITMAP_#53.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#54.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#55.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#56.bmp"),
    ),
    // 3: FISH11/FISH21
    (
        include_bytes!("../../../assets/aqua/RT_BITMAP_#7.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#8.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#9.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#10.bmp"),
    ),
    // 4: COLOR1/COLOR2
    (
        include_bytes!("../../../assets/aqua/RT_BITMAP_#19.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#20.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#21.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#22.bmp"),
    ),
    // 5: FISHR1/FISHR2
    (
        include_bytes!("../../../assets/aqua/RT_BITMAP_#25.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#26.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#27.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#28.bmp"),
    ),
    // 6: SEAHORS/SEAHORS2 (Note: #16 is MSEAHORS, #15 is MSEAHOR2!)
    (
        include_bytes!("../../../assets/aqua/RT_BITMAP_#13.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#14.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#16.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#15.bmp"),
    ),
    // 7: MULTI1/MULTI2
    (
        include_bytes!("../../../assets/aqua/RT_BITMAP_#35.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#36.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#37.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#38.bmp"),
    ),
    // 8: SCHOOL1/SCHOOL2
    (
        include_bytes!("../../../assets/aqua/RT_BITMAP_#41.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#42.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#43.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#44.bmp"),
    ),
    // 9: BLUE1/BLUE2
    (
        include_bytes!("../../../assets/aqua/RT_BITMAP_#47.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#48.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#49.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#50.bmp"),
    ),
    // 10: GLOBE1/GLOBE2 (puffer fish)
    (
        include_bytes!("../../../assets/aqua/RT_BITMAP_#69.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#70.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#71.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#72.bmp"),
    ),
    // 11: YFISH1/YFISH2 (yellow fish)
    (
        include_bytes!("../../../assets/aqua/RT_BITMAP_#63.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#64.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#65.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#66.bmp"),
    ),
    // 12: JELLY1/JELLY2 (jellyfish, unflipped)
    (
        include_bytes!("../../../assets/aqua/RT_BITMAP_#59.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#60.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#61.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#62.bmp"),
    ),
    // 13: BUBBL1/BUBBL2 (30x30 rising bubbles)
    (
        include_bytes!("../../../assets/aqua/RT_BITMAP_#31.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#32.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#33.bmp"),
        include_bytes!("../../../assets/aqua/RT_BITMAP_#34.bmp"),
    ),
];

const SEAFLOOR_BMP: &[u8] = include_bytes!("../../../assets/aqua/RT_BITMAP_#75.bmp");

struct SpritePair {
    w: i32,
    h: i32,
    color_l: [AdSurface; 2],
    mask_l: [AdSurface; 2],
    color_r: [AdSurface; 2],
    mask_r: [AdSurface; 2],
}

fn bitmap_to_surface(bmp: &AdBitmap) -> Option<AdSurface> {
    let mut surf = AdSurface::new(bmp.width, bmp.height)?;
    surf.set_text_color(rgb(0, 0, 0));
    surf.set_bk_color(rgb(255, 255, 255));
    surf.bit_blt_bitmap(0, 0, bmp.width, bmp.height, bmp, 0, 0, ROP_SRCCOPY);
    Some(surf)
}

fn mirror_surface_x(src: &AdSurface) -> Option<AdSurface> {
    let w = src.width as usize;
    let h = src.height as usize;
    let mut dst = AdSurface::new(src.width, src.height)?;
    let sp = src.pixels();
    let dp = dst.pixels_mut();
    for y in 0..h {
        let row = y * w;
        for x in 0..w {
            dp[row + (w - 1 - x)] = sp[row + x];
        }
    }
    Some(dst)
}

#[derive(Debug, Clone, Copy, Default)]
struct Creature {
    x: i32,
    y: i32,
    frame: usize,
    species: usize, // 1..=13
    dx: i32,
    dy: i32,
}

pub struct AquaticRealmModule {
    sprites: Vec<SpritePair>, // index 0 -> species 1, ..., index 12 -> species 13
    seafloor: Option<AdSurface>,
    floor_y: i32,
    floor_h: i32,
    min_species: usize,
    total_count: usize,
    creatures: [Creature; 32],
    tick: u32,
    last_ctrl: [i32; 3],
}

impl AquaticRealmModule {
    pub fn new() -> Self {
        Self {
            sprites: Vec::new(),
            seafloor: None,
            floor_y: 416,
            floor_h: 64,
            min_species: 2,
            total_count: 0,
            creatures: [Creature::default(); 32],
            tick: 0,
            last_ctrl: [-1; 3],
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "aqua".to_string(),
            filename: "AQUA.AD".to_string(),
            name: "Aquatic Realm".to_string(),
            credit: "Aquatic Realm by Bill Stewart.\n©1990 Berkeley Systems Inc.".to_string(),
            about: "AQUATIC REALM (tm) turns your monitor into a lively undersea environment featuring many colorful marine creatures.\n\nOriginal concept from Fish! by Tom & Ed's Bogus Software.\n\nChecking \"Show Sea Floor\" makes this module much more interesting, but a little less of a screen saver.\n\nRealistic fish artwork by Tomoya Ikeda.".to_string(),
            controls: [
                AdControl::NumericSlider {
                    title: "Creatures:".to_string(),
                    default_raw: 25,
                    unit: String::new(),
                    min: 1,
                    max: 20,
                },
                AdControl::NumericSlider {
                    title: "Seaweed:".to_string(),
                    default_raw: 50,
                    unit: String::new(),
                    min: 0,
                    max: 4,
                },
                AdControl::Checkbox {
                    title: "Show Sea Floor".to_string(),
                    default_checked: true,
                },
                AdControl::None,
            ],
            target_frame_ms: 50,
        }
    }

    fn load_assets(&mut self) -> bool {
        if !self.sprites.is_empty() && self.seafloor.is_some() {
            return true;
        }
        self.sprites.clear();
        for &(c0, c1, m0, m1) in &SPECIES_BMPS {
            let (Some(bc0), Some(bc1), Some(bm0), Some(bm1)) = (
                AdBitmap::from_bmp_bytes(c0),
                AdBitmap::from_bmp_bytes(c1),
                AdBitmap::from_bmp_bytes(m0),
                AdBitmap::from_bmp_bytes(m1),
            ) else {
                return false;
            };
            let (Some(sc0), Some(sc1), Some(sm0), Some(sm1)) = (
                bitmap_to_surface(&bc0),
                bitmap_to_surface(&bc1),
                bitmap_to_surface(&bm0),
                bitmap_to_surface(&bm1),
            ) else {
                return false;
            };
            let (Some(rc0), Some(rc1), Some(rm0), Some(rm1)) = (
                mirror_surface_x(&sc0),
                mirror_surface_x(&sc1),
                mirror_surface_x(&sm0),
                mirror_surface_x(&sm1),
            ) else {
                return false;
            };
            self.sprites.push(SpritePair {
                w: sc0.width,
                h: sc0.height,
                color_l: [sc0, sc1],
                mask_l: [sm0, sm1],
                color_r: [rc0, rc1],
                mask_r: [rm0, rm1],
            });
        }

        if let Some(fb) = AdBitmap::from_bmp_bytes(SEAFLOOR_BMP) {
            self.floor_h = fb.height;
            self.seafloor = bitmap_to_surface(&fb);
        }
        self.seafloor.is_some()
    }

    /// Exact depth-sorting constraint (`1:0EAA..1:0F63`) keeping crabs & kelp ordered along the sea floor.
    fn enforce_depth_y(&mut self, idx: usize) {
        if self.creatures[idx].species == 2 {
            for j in 0..idx {
                if self.creatures[j].species == 1 || self.creatures[j].species == 2 {
                    if self.creatures[j].y > self.creatures[idx].y {
                        self.creatures[idx].y = self.creatures[j].y;
                    }
                }
            }
        }
        for j in (idx + 1)..self.total_count {
            if self.creatures[j].species == 1 && self.creatures[j].y < self.creatures[idx].y {
                self.creatures[idx].y = self.creatures[j].y;
            }
        }
    }

    fn spawn_all(&mut self, ctx: &mut AdContext<'_>) {
        let w = ctx.module.rgn_width.max(160);
        let h = ctx.module.rgn_height.max(120);
        let num_creatures = (ctx.module.control_value[0] as usize).clamp(1, 20);
        let num_seaweed = (ctx.module.control_value[1] as usize).clamp(0, 4);
        let show_floor = ctx.module.control_value[2] != 0;

        self.floor_y = h - self.floor_h;
        self.total_count = num_creatures + if show_floor { num_seaweed } else { 0 };
        self.min_species = if show_floor && self.total_count > 2 { 2 } else { 3 };

        let mut last_kelp_y = 0;
        let mut kelp_count = 0usize;

        for i in 0..self.total_count {
            let span = (NUM_SPECIES - self.min_species).max(1) as i32;
            let mut species = (ctx.rng.rand_mod(span) as usize) + self.min_species;
            if show_floor && i < num_seaweed && i < self.total_count.saturating_sub(1) {
                species = 1; // Kelp
            }

            let mut dx = ctx.rng.rand_mod(13) - 6;
            if dx == 0 {
                dx = 1;
            }

            let mut c = Creature {
                x: if dx < 0 {
                    ctx.rng.rand_mod(15) + w
                } else {
                    ctx.rng.rand_mod(5) - 70
                },
                y: 0,
                frame: 0,
                species,
                dx,
                dy: 0,
            };

            if species == 1 {
                // Kelp anchored on sea floor (`1:0C44..1:0CE1`)
                c.x = ctx.rng.rand_mod((w - 128).max(1)) + 64;
                let fy_span = (self.floor_h - 28).max(1);
                c.y = ctx.rng.rand_mod(fy_span) + self.floor_y - 36;
                if c.y < last_kelp_y {
                    c.y = last_kelp_y;
                }
                last_kelp_y = c.y;
                c.frame = ctx.rng.rand_mod(2) as usize;
                c.dx = 0;
                c.dy = 0;
                kelp_count += 1;
                if kelp_count > 2 {
                    self.min_species = 2;
                }
            } else {
                // Distribute initial fish across screen too so the tank is lively right away
                if ctx.rng.rand_mod(3) != 0 {
                    c.x = ctx.rng.rand_mod((w - 64).max(1));
                }
                c.y = ctx.rng.rand_mod((h - 75).max(1)) + 20;
                if species == 2 {
                    let fy_span = (self.floor_h - 28).max(1);
                    c.y = ctx.rng.rand_mod(fy_span) + self.floor_y - 36;
                }
                c.frame = ctx.rng.rand_mod(2) as usize;
                c.dx = ctx.rng.rand_mod(13) - 6;
                if c.dx == 0 {
                    c.dx = 1;
                }
                c.dy = ctx.rng.rand_mod(7) - 3;
                if species == 13 {
                    c.x = ctx.rng.rand_mod((w - 80).max(1)) + 40;
                }
            }

            self.creatures[i] = c;
            if species != 1 && species != 13 {
                self.enforce_depth_y(i);
            }
        }

        for i in 0..self.total_count {
            self.enforce_depth_y(i);
        }
        self.min_species = if show_floor { 2 } else { 3 };
        self.last_ctrl = [
            ctx.module.control_value[0],
            ctx.module.control_value[1],
            ctx.module.control_value[2],
        ];
    }

    fn respawn_creature(&mut self, idx: usize, ctx: &mut AdContext<'_>) {
        let w = ctx.module.rgn_width.max(160);
        let h = ctx.module.rgn_height.max(120);

        let mut dx = ctx.rng.rand_mod(13) - 6;
        if dx == 0 {
            dx = 1;
        }
        let x = if dx < 0 { w + 10 } else { -68 };
        let y = ctx.rng.rand_mod((h - 75).max(1)) + 20;
        let frame = ctx.rng.rand_mod(2) as usize;
        let dy = ctx.rng.rand_mod(7) - 3;
        let span = (NUM_SPECIES - self.min_species).max(1) as i32;
        let species = (ctx.rng.rand_mod(span) as usize) + self.min_species;

        let mut c = Creature {
            x,
            y,
            frame,
            species,
            dx,
            dy,
        };
        if species == 2 {
            let fy_span = (self.floor_h - 28).max(1);
            c.y = ctx.rng.rand_mod(fy_span) + self.floor_y - 36;
        } else if species == 13 {
            c.x = ctx.rng.rand_mod((w - 80).max(1)) + 40;
            c.y = h + 10;
        }
        self.creatures[idx] = c;
        if species != 13 {
            self.enforce_depth_y(idx);
        }
    }
}

impl Default for AquaticRealmModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for AquaticRealmModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        if !self.load_assets() {
            return AdResult::MemError;
        }
        self.tick = 0;
        self.spawn_all(ctx);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.surface.fill_black();
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        let cur_ctrl = [
            ctx.module.control_value[0],
            ctx.module.control_value[1],
            ctx.module.control_value[2],
        ];
        if cur_ctrl != self.last_ctrl {
            self.spawn_all(ctx);
        }

        let w = ctx.module.rgn_width;
        let show_floor = ctx.module.control_value[2] != 0;
        self.tick = self.tick.wrapping_add(1);
        let toggle_anim = (self.tick & 1) == 0;

        // 1. Update all creatures (`1:0F64..1:12C2`)
        for i in 0..self.total_count {
            let c = self.creatures[i];
            let off_x = c.x <= -75 || c.x >= w + 20;
            let off_bubble = c.species == 13 && c.y <= -70;

            if off_x || off_bubble {
                self.respawn_creature(i, ctx);
            } else if c.species == 13 {
                self.creatures[i].y -= 3;
            } else {
                self.creatures[i].x += self.creatures[i].dx;
                if self.creatures[i].species != 1
                    && ctx.rng.rand() < 4200
                    && self.creatures[i].x > 60
                    && self.creatures[i].x < w - 124
                {
                    if self.creatures[i].species == 12 {
                        self.creatures[i].dx += ctx.rng.rand_mod(3) - 1;
                    } else {
                        self.creatures[i].dx += ctx.rng.rand_mod(11) - 5;
                    }
                    if self.creatures[i].dx == 0 {
                        self.creatures[i].dx = 1;
                    }
                    self.creatures[i].dx = self.creatures[i].dx.clamp(-6, 6);
                }

                if self.creatures[i].species != 1 && self.creatures[i].species != 2 {
                    if self.creatures[i].y > self.floor_y - 36 && self.creatures[i].dy > 0 {
                        self.creatures[i].dy = ctx.rng.rand_mod(2) - 1;
                    }
                    self.creatures[i].y = (self.creatures[i].y + self.creatures[i].dy).max(2);
                    self.creatures[i].dy =
                        (self.creatures[i].dy + ctx.rng.rand_mod(3) - 1).clamp(-3, 3);
                }
            }

            if toggle_anim {
                self.creatures[i].frame = (self.creatures[i].frame + 1) & 1;
            }
        }

        // 2. Clean painter's-order render (black -> tiled seafloor -> all creatures in exact depth order)
        ctx.surface.fill_black();
        if show_floor {
            if let Some(ref floor) = self.seafloor {
                let mut fx = 0;
                while fx < w {
                    ctx.surface.bit_blt_surface(
                        fx,
                        self.floor_y,
                        floor.width,
                        floor.height,
                        floor,
                        0,
                        0,
                        ROP_SRCCOPY,
                    );
                    fx += floor.width;
                }
            }
        }

        for i in 0..self.total_count {
            let c = self.creatures[i];
            if c.species == 0 || c.species > self.sprites.len() {
                continue;
            }
            let sp = &self.sprites[c.species - 1];
            let flipped = c.dx > 0 && c.species > 2 && c.species < 12;
            let f = c.frame & 1;
            let (mask, color) = if flipped {
                (&sp.mask_r[f], &sp.color_r[f])
            } else {
                (&sp.mask_l[f], &sp.color_l[f])
            };
            ctx.surface
                .bit_blt_surface(c.x, c.y, sp.w, sp.h, mask, 0, 0, ROP_SRCAND);
            ctx.surface
                .bit_blt_surface(c.x, c.y, sp.w, sp.h, color, 0, 0, ROP_SRCPAINT);
        }

        AdResult::NoError
    }

    fn do_close(&mut self, _ctx: &mut AdContext<'_>) -> AdResult {
        self.sprites.clear();
        self.seafloor = None;
        AdResult::NoError
    }
}
