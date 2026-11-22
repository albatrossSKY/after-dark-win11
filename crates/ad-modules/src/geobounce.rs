//! 1:1 Decompilation of `3DBOUNCE.AD` ("GeoBounce") from After Dark 1.0a (1991).
//!
//! Disassembly-backed from `docs/disasm/3dbounce_seg1.asm` and `docs/disasm/3dbounce_data.hex`.

use std::f64::consts::TAU;

use ad_sdk::canvas::{AdSurface, ROP_SRCCOPY};
use ad_sdk::palette::rgb;
use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

const SPRITE_DIM: i32 = 124; // 0x7C
const SPRITE_HALF: i32 = 62; // 0x3E

// 7 base colors from DS:0x0014 (White, Red, Green, Blue, Cyan, Yellow, Magenta)
const BASE_COLORS: [(u16, u16, u16); 7] = [
    (255, 255, 255),
    (255, 0, 0),
    (0, 255, 0),
    (0, 0, 255),
    (0, 255, 255),
    (255, 255, 0),
    (255, 0, 255),
];

// Directional light vector from DS:0x03F4 (-0x93CD / 65536 = -1/sqrt(3))
const LIGHT_VEC: [f64; 3] = [-0.577_346_8, -0.577_346_8, -0.577_346_8];
const AMBIENT: f64 = (0x2700 as f64) / 65536.0;

struct SolidDef {
    verts: &'static [[f64; 3]],
    faces: &'static [&'static [usize]],
    face_colors: &'static [usize],
}

const TETRA_VERTS: &[[f64; 3]] = &[
    [-0.28866577, -0.28866577, -0.28866577],
    [0.28866577, 0.28866577, -0.28866577],
    [-0.28866577, 0.28866577, 0.28866577],
    [0.28866577, -0.28866577, 0.28866577],
];
const TETRA_FACES: &[&[usize]] = &[&[3, 1, 0], &[1, 2, 0], &[3, 2, 1], &[3, 0, 2]];
const TETRA_COLORS: &[usize] = &[1, 5, 2, 3];

const CUBE_VERTS: &[[f64; 3]] = &[
    [-0.28866577, -0.28866577, -0.28866577],
    [-0.28866577, 0.28866577, -0.28866577],
    [0.28866577, 0.28866577, -0.28866577],
    [0.28866577, -0.28866577, -0.28866577],
    [-0.28866577, -0.28866577, 0.28866577],
    [-0.28866577, 0.28866577, 0.28866577],
    [0.28866577, 0.28866577, 0.28866577],
    [0.28866577, -0.28866577, 0.28866577],
];
const CUBE_FACES: &[&[usize]] = &[
    &[3, 2, 1, 0],
    &[3, 7, 6, 2],
    &[1, 2, 6, 5],
    &[4, 0, 1, 5],
    &[4, 7, 3, 0],
    &[4, 5, 6, 7],
];
const CUBE_COLORS: &[usize] = &[1, 2, 3, 4, 5, 6];

const OCTA_VERTS: &[[f64; 3]] = &[
    [0.35354614, 0.35354614, 0.0],
    [-0.35354614, 0.35354614, 0.0],
    [-0.35354614, -0.35354614, 0.0],
    [0.35354614, -0.35354614, 0.0],
    [0.0, 0.0, 0.5],
    [0.0, 0.0, -0.5],
];
const OCTA_FACES: &[&[usize]] = &[
    &[4, 1, 0],
    &[4, 2, 1],
    &[4, 3, 2],
    &[4, 0, 3],
    &[1, 5, 0],
    &[2, 5, 1],
    &[3, 5, 2],
    &[0, 5, 3],
];
const OCTA_COLORS: &[usize] = &[1, 5, 2, 3, 2, 3, 1, 5];

const DODECA_VERTS: &[[f64; 3]] = &[
    [0.29400635, -0.09500122, 0.40499878],
    [0.47500610, 0.09500122, 0.15400696],
    [0.00000000, 0.09500122, 0.50000000],
    [0.18099976, -0.40499878, 0.25000000],
    [0.29400635, 0.40499878, 0.09500122],
    [0.00000000, 0.40499878, 0.30798340],
    [0.47500610, -0.09500122, -0.15400696],
    [-0.29400635, -0.09500122, 0.40499878],
    [0.29400635, -0.40499878, -0.09500122],
    [-0.18099976, -0.40499878, 0.25000000],
    [0.18099976, 0.40499878, -0.25000000],
    [-0.29400635, 0.40499878, 0.09500122],
    [0.29400635, 0.09500122, -0.40499878],
    [-0.47500610, 0.09500122, 0.15400696],
    [0.00000000, -0.40499878, -0.30799866],
    [-0.29400635, -0.40499878, -0.09500122],
    [-0.18099976, 0.40499878, -0.25000000],
    [0.00000000, -0.09500122, -0.50000000],
    [-0.47500610, -0.09500122, -0.15400696],
    [-0.29400635, 0.09500122, -0.40499878],
];
const DODECA_FACES: &[&[usize]] = &[
    &[10, 4, 5, 11, 16],
    &[0, 2, 5, 4, 1],
    &[6, 1, 4, 10, 12],
    &[17, 12, 10, 16, 19],
    &[18, 19, 16, 11, 13],
    &[7, 13, 11, 5, 2],
    &[8, 14, 15, 9, 3],
    &[19, 18, 15, 14, 17],
    &[12, 17, 14, 8, 6],
    &[1, 6, 8, 3, 0],
    &[2, 0, 3, 9, 7],
    &[13, 7, 9, 15, 18],
];
const DODECA_COLORS: &[usize] = &[1, 2, 3, 4, 5, 6, 1, 2, 6, 5, 4, 3];

const ICOSA_VERTS: &[[f64; 3]] = &[
    [0.00000000, 0.00000000, 0.50000000],
    [0.36180115, -0.26286316, 0.22360229],
    [0.36180115, 0.26286316, 0.22360229],
    [-0.13818359, 0.42532349, 0.22360229],
    [-0.44720459, 0.00000000, 0.22360229],
    [-0.13818359, -0.42532349, 0.22360229],
    [0.44720459, 0.00000000, -0.22360229],
    [0.13818359, 0.42532349, -0.22360229],
    [-0.36180115, 0.26286316, -0.22360229],
    [-0.36180115, -0.26286316, -0.22360229],
    [0.13818359, -0.42532349, -0.22360229],
    [0.00000000, 0.00000000, -0.50000000],
];
const ICOSA_FACES: &[&[usize]] = &[
    &[2, 1, 0],
    &[3, 2, 0],
    &[4, 3, 0],
    &[5, 4, 0],
    &[1, 5, 0],
    &[2, 6, 1],
    &[3, 7, 2],
    &[4, 8, 3],
    &[5, 9, 4],
    &[1, 10, 5],
    &[2, 7, 6],
    &[3, 8, 7],
    &[4, 9, 8],
    &[5, 10, 9],
    &[1, 6, 10],
    &[7, 11, 6],
    &[8, 11, 7],
    &[9, 11, 8],
    &[10, 11, 9],
    &[6, 11, 10],
];
const ICOSA_COLORS: &[usize] = &[
    1, 2, 3, 5, 6, 5, 4, 6, 1, 2, 6, 1, 2, 4, 3, 2, 3, 5, 6, 1,
];

const SOLIDS: [SolidDef; 5] = [
    SolidDef {
        verts: TETRA_VERTS,
        faces: TETRA_FACES,
        face_colors: TETRA_COLORS,
    },
    SolidDef {
        verts: CUBE_VERTS,
        faces: CUBE_FACES,
        face_colors: CUBE_COLORS,
    },
    SolidDef {
        verts: OCTA_VERTS,
        faces: OCTA_FACES,
        face_colors: OCTA_COLORS,
    },
    SolidDef {
        verts: DODECA_VERTS,
        faces: DODECA_FACES,
        face_colors: DODECA_COLORS,
    },
    SolidDef {
        verts: ICOSA_VERTS,
        faces: ICOSA_FACES,
        face_colors: ICOSA_COLORS,
    },
];

pub struct GeoBounceModule {
    shape: usize,
    radius: i32,
    pos_x: f64,
    pos_y: f64,
    travel_deg: i32,
    vel_x: f64,
    vel_y: f64,
    ang_x: f64,
    ang_y: f64,
    ang_z: f64,
    dang_x: f64,
    dang_y: f64,
    dang_z: f64,
    prev_rect: Option<(i32, i32, i32, i32)>,
    sprite_buf: Option<AdSurface>,
}

impl GeoBounceModule {
    pub fn new() -> Self {
        Self {
            shape: 0,
            radius: 24,
            pos_x: 100.0,
            pos_y: 100.0,
            travel_deg: 45,
            vel_x: 0.707,
            vel_y: 0.707,
            ang_x: 0.0,
            ang_y: 0.0,
            ang_z: 0.0,
            dang_x: 0.05,
            dang_y: 0.05,
            dang_z: 0.05,
            prev_rect: None,
            sprite_buf: None,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "3dbounce".to_string(),
            filename: "3DBOUNCE.AD".to_string(),
            name: "GeoBounce".to_string(),
            credit: "GeoBounce by Ed Hall and Mouse Herrell.\r\n  \u{00a9}1990 Berkeley Systems Inc."
                .to_string(),
            about: concat!(
                "GEOBOUNCE(tm) distorts the space-time continuum, permitting glimpses through ",
                "the fourth dimension to the other side of the universe, which is populated by ",
                "an intelligent and happy community of Platonic solids."
            )
            .to_string(),
            controls: [
                AdControl::Menu {
                    title: "Shape".to_string(),
                    default_index: 0,
                    choices: vec![
                        "Tetrahedron".to_string(),
                        "Cube".to_string(),
                        "Octahedron".to_string(),
                        "Dodecahedron".to_string(),
                        "Icosahedron".to_string(),
                    ],
                },
                AdControl::NumericSlider {
                    title: "Size:".to_string(),
                    default_raw: 54,
                    unit: "%".to_string(),
                    min: 10,
                    max: 100,
                },
                AdControl::NumericSlider {
                    title: "Speed:".to_string(),
                    default_raw: 28,
                    unit: "%".to_string(),
                    min: 0,
                    max: 100,
                },
                AdControl::Menu {
                    title: "Faces".to_string(),
                    default_index: 2,
                    choices: vec![
                        "Shading".to_string(),
                        "Colors".to_string(),
                        "Both".to_string(),
                    ],
                },
            ],
            target_frame_ms: 33,
        }
    }

    #[inline]
    fn shaded_color(color_idx: usize, level_0_15: usize) -> u32 {
        // 1:00DD..1:016E: k in 1..=16, component = (base * k) >> 4
        let (r, g, b) = BASE_COLORS[color_idx.min(6)];
        let k = (level_0_15.min(15) + 1) as u16;
        rgb(((r * k) >> 4) as u8, ((g * k) >> 4) as u8, ((b * k) >> 4) as u8)
    }

    fn randomize_spin(&mut self, ctx: &mut AdContext<'_>) {
        // 1:0345..1:03AD & bounce handlers: (rand() % 10) degrees/frame
        let deg2rad = std::f64::consts::PI / 180.0;
        self.dang_x = ((ctx.rng.rand() % 10) as f64) * deg2rad;
        self.dang_y = ((ctx.rng.rand() % 10) as f64) * deg2rad;
        self.dang_z = ((ctx.rng.rand() % 10) as f64) * deg2rad;
    }

    #[inline]
    fn wrap_angle(mut a: f64) -> f64 {
        if a < 0.0 {
            a += TAU;
        } else if a >= TAU {
            a -= TAU;
        }
        a
    }

    fn rotate_point(&self, v: [f64; 3], scale: f64) -> [f64; 3] {
        // Exact order from 1:10CD..1:1141: Scale -> RotX -> RotY -> RotZ -> Translate(62, 62, 0)
        let mut x = v[0] * scale;
        let mut y = v[1] * scale;
        let mut z = v[2] * scale;

        // Rotate X (ord_13 1:1A19): y' = y*cos - z*sin, z' = y*sin + z*cos
        let (sx, cx) = self.ang_x.sin_cos();
        let y1 = y * cx - z * sx;
        let z1 = y * sx + z * cx;
        y = y1;
        z = z1;

        // Rotate Y (ord_12 1:1C98): x' = x*cos - z*sin, z' = x*sin + z*cos
        let (sy, cy) = self.ang_y.sin_cos();
        let x2 = x * cy - z * sy;
        let z2 = x * sy + z * cy;
        x = x2;
        z = z2;

        // Rotate Z (ord_11 1:179D): x' = x*cos + y*sin, y' = y*cos - x*sin
        let (sz, cz) = self.ang_z.sin_cos();
        let x3 = x * cz + y * sz;
        let y3 = y * cz - x * sz;

        [x3 + SPRITE_HALF as f64, y3 + SPRITE_HALF as f64, z]
    }
}

impl Default for GeoBounceModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for GeoBounceModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:016F..1:042E
        self.shape = (ctx.module.control_value[0].clamp(0, 4)) as usize;
        self.sprite_buf = AdSurface::new(SPRITE_DIM, SPRITE_DIM);
        if self.sprite_buf.is_none() {
            return AdResult::MemError;
        }

        let w = ctx.module.rgn_width.max(SPRITE_DIM);
        let h = ctx.module.rgn_height.max(SPRITE_DIM);
        let px = if w > SPRITE_DIM {
            (ctx.rng.rand() % (w - SPRITE_DIM)) + SPRITE_HALF
        } else {
            w / 2
        };
        let py = if h > SPRITE_DIM {
            (ctx.rng.rand() % (h - SPRITE_DIM)) + SPRITE_HALF
        } else {
            h / 2
        };
        self.pos_x = px as f64;
        self.pos_y = py as f64;

        let deg2rad = std::f64::consts::PI / 180.0;
        self.ang_x = ((ctx.rng.rand() % 360) as f64) * deg2rad;
        self.ang_y = ((ctx.rng.rand() % 360) as f64) * deg2rad;
        self.ang_z = ((ctx.rng.rand() % 360) as f64) * deg2rad;
        self.randomize_spin(ctx);

        self.travel_deg = ctx.rng.rand() % 360;
        let tr = (self.travel_deg as f64) * deg2rad;
        self.vel_x = tr.cos();
        self.vel_y = tr.sin();
        self.prev_rect = None;

        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.surface.fill_black();
        self.prev_rect = None;
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        // 1:042F: update_physics -> transform -> draw
        self.shape = (ctx.module.control_value[0].clamp(0, 4)) as usize;

        // 1:0C56..1:0D15: advance 3D spin angles
        self.ang_x = Self::wrap_angle(self.ang_x + self.dang_x);
        self.ang_y = Self::wrap_angle(self.ang_y + self.dang_y);
        self.ang_z = Self::wrap_angle(self.ang_z + self.dang_z);

        // 1:0D16..1:0D51: advance position
        let speed = (ctx.module.control_value[2] / 5) as f64;
        let old_vx = self.vel_x;
        let old_vy = self.vel_y;
        self.pos_x += self.vel_x * speed;
        self.pos_y += self.vel_y * speed;

        // 1:0D52..1:0D78: size -> radius (7..=40 px)
        self.radius = (((ctx.module.control_value[1] + 11) * 40) / 111).max(1);

        let w = ctx.module.rgn_width;
        let h = ctx.module.rgn_height;
        let ix = self.pos_x as i32;
        let iy = self.pos_y as i32;
        let r = self.radius;

        // 1:0DC0..1:1070: wall bounce & spin perturbation
        let mut bounced_x = false;
        let mut bounced_y = false;
        if ix + r > w {
            self.vel_x = -self.vel_x.abs();
            self.pos_x = (w - r) as f64;
            bounced_x = true;
        } else if ix - r < 0 {
            self.vel_x = self.vel_x.abs();
            self.pos_x = r as f64;
            bounced_x = true;
        }
        if iy + r > h {
            self.vel_y = -self.vel_y.abs();
            self.pos_y = (h - r) as f64;
            bounced_y = true;
        } else if iy - r < 0 {
            self.vel_y = self.vel_y.abs();
            self.pos_y = r as f64;
            bounced_y = true;
        }

        if bounced_x || bounced_y {
            self.randomize_spin(ctx);
            if bounced_x && bounced_y {
                self.travel_deg += 180;
            } else if bounced_y {
                self.travel_deg = 360 - self.travel_deg;
            } else {
                self.travel_deg = 180 - self.travel_deg;
            }
            self.travel_deg = self.travel_deg.rem_euclid(360);
            self.travel_deg = (self.travel_deg + (ctx.rng.rand() % 15) - 7).rem_euclid(360);
            let tr = (self.travel_deg as f64) * (std::f64::consts::PI / 180.0);
            self.vel_x = tr.cos();
            self.vel_y = tr.sin();
            let _ = (old_vx, old_vy);
        }

        // Transform vertices into sprite buffer coordinates (1:10A9..1:119C)
        let solid = &SOLIDS[self.shape];
        let scale = (self.radius * 2) as f64;
        let transformed: Vec<[f64; 3]> = solid
            .verts
            .iter()
            .map(|&v| self.rotate_point(v, scale))
            .collect();

        // Render visible faces into offscreen 124x124 sprite buffer (1:11E8..1:1521)
        let faces_mode = ctx.module.control_value[3];
        let use_colors = ctx.system.bits_per_pixel >= 4 && faces_mode >= 1;
        let use_shading = ctx.system.bits_per_pixel < 4 || faces_mode != 1;

        let Some(sprite) = self.sprite_buf.as_mut() else {
            return AdResult::NoError;
        };
        sprite.fill_black();

        let mut min_x = SPRITE_DIM;
        let mut min_y = SPRITE_DIM;
        let mut max_x = 0;
        let mut max_y = 0;
        let mut poly_pts = Vec::with_capacity(5);

        for (fi, &face) in solid.faces.iter().enumerate() {
            let v0 = transformed[face[0]];
            let v1 = transformed[face[1]];
            let v2 = transformed[face[2]];

            // ord_16 (1:230C): normal = normalize((v0 - v1) x (v2 - v1))
            let ax = v0[0] - v1[0];
            let ay = v0[1] - v1[1];
            let az = v0[2] - v1[2];
            let bx = v2[0] - v1[0];
            let by = v2[1] - v1[1];
            let bz = v2[2] - v1[2];

            let mut nx = ay * bz - az * by;
            let mut ny = az * bx - ax * bz;
            let mut nz = ax * by - ay * bx;
            let len = (nx * nx + ny * ny + nz * nz).sqrt();
            if len <= 1e-9 {
                continue;
            }
            nx /= len;
            ny /= len;
            nz /= len;

            // Backface cull: visible iff nz < 0 (1:13EF)
            if nz >= 0.0 {
                continue;
            }

            poly_pts.clear();
            for &vi in face {
                let px = transformed[vi][0] as i32;
                let py = transformed[vi][1] as i32;
                min_x = min_x.min(px);
                min_y = min_y.min(py);
                max_x = max_x.max(px);
                max_y = max_y.max(py);
                poly_pts.push((px, py));
            }

            // Diffuse lighting + ambient (1:130F..1:1392)
            let dot = (nx * LIGHT_VEC[0] + ny * LIGHT_VEC[1] + nz * LIGHT_VEC[2]).max(0.0);
            let intensity = (dot + AMBIENT).clamp(0.0, 0.9999);
            let shade = if use_shading {
                ((intensity * 16.0) as usize).min(15)
            } else {
                15
            };
            let color_idx = if use_colors { solid.face_colors[fi] } else { 0 };
            let fill = Self::shaded_color(color_idx, shade);

            sprite.polygon(&poly_pts, Some(rgb(0, 0, 0)), Some(fill));
        }

        // Compute new screen bounding rect and erase previous rect cleanly
        let sx = (self.pos_x as i32) - SPRITE_HALF;
        let sy = (self.pos_y as i32) - SPRITE_HALF;
        let cur_rect = (
            sx + min_x.clamp(0, SPRITE_DIM),
            sy + min_y.clamp(0, SPRITE_DIM),
            sx + (max_x + 1).clamp(0, SPRITE_DIM),
            sy + (max_y + 1).clamp(0, SPRITE_DIM),
        );

        if let Some((pl, pt, pr, pb)) = self.prev_rect {
            // Check if union fits inside the 124x124 sprite buffer for a single flicker-free blit
            let ul = cur_rect.0.min(pl);
            let ut = cur_rect.1.min(pt);
            let ur = cur_rect.2.max(pr);
            let ub = cur_rect.3.max(pb);
            let src_x = ul - sx;
            let src_y = ut - sy;
            let bw = ur - ul;
            let bh = ub - ut;
            if src_x >= 0
                && src_y >= 0
                && src_x + bw <= SPRITE_DIM
                && src_y + bh <= SPRITE_DIM
            {
                ctx.surface
                    .bit_blt_surface(ul, ut, bw, bh, sprite, src_x, src_y, ROP_SRCCOPY);
            } else {
                ctx.surface.pat_blt_black(pl, pt, pr - pl, pb - pt);
                let bw2 = cur_rect.2 - cur_rect.0;
                let bh2 = cur_rect.3 - cur_rect.1;
                if bw2 > 0 && bh2 > 0 {
                    ctx.surface.bit_blt_surface(
                        cur_rect.0,
                        cur_rect.1,
                        bw2,
                        bh2,
                        sprite,
                        cur_rect.0 - sx,
                        cur_rect.1 - sy,
                        ROP_SRCCOPY,
                    );
                }
            }
        } else {
            let bw = cur_rect.2 - cur_rect.0;
            let bh = cur_rect.3 - cur_rect.1;
            if bw > 0 && bh > 0 {
                ctx.surface.bit_blt_surface(
                    cur_rect.0,
                    cur_rect.1,
                    bw,
                    bh,
                    sprite,
                    cur_rect.0 - sx,
                    cur_rect.1 - sy,
                    ROP_SRCCOPY,
                );
            }
        }

        self.prev_rect = Some(cur_rect);
        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.surface.fill_black();
        self.sprite_buf = None;
        self.prev_rect = None;
        AdResult::NoError
    }
}
