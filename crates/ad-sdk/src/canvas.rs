//! Win32 GDI Offscreen Surface (`AdSurface`) and Original 1991 BMP Loader (`AdBitmap`).
//!
//! Preserves 1:1 Win16 GDI semantics:
//! - True 1bpp monochrome `HBITMAP` creation for 1bpp `.bmp` resources so `SetTextColor` / `SetBkColor`
//!   and monochrome ROP blits (`SRCCOPY`, `SRCAND`, `SRCPAINT`, `SRCINVERT`) behave identically to Windows 3.0.
//! - 32-bit DIB section backing buffer for `AdSurface` so incremental drawing across frames is persistent,
//!   flicker-free, and scales crisply via nearest-neighbor (`COLORONCOLOR`) `StretchBlt` for 1x/2x/3x/4K HiDPI.

use std::ptr;

use windows_sys::Win32::Foundation::{POINT, RECT};
use windows_sys::Win32::Graphics::Gdi::{
    Arc, BI_RGB, BITMAPINFO, BITMAPINFOHEADER, BLACKNESS, BitBlt, COLORONCOLOR, Chord, CombineRgn,
    CreateBitmap, CreateCompatibleDC, CreateDIBSection, CreateEllipticRgn, CreateFontW,
    CreateHatchBrush, CreatePatternBrush, CreatePen, CreatePolygonRgn, CreateRectRgn,
    CreateSolidBrush, DIB_RGB_COLORS, DeleteDC, DeleteObject, DrawTextW, DT_CENTER, DT_LEFT,
    DT_NOPREFIX, DT_SINGLELINE, DT_WORDBREAK, Ellipse, FillRect, FillRgn, GetDC, GetPixel,
    GetStockObject, GetTextExtentPoint32W, HBITMAP, HBRUSH, HDC, HGDIOBJ, HPEN, HRGN, InvertRect,
    InvertRgn, LineTo, MoveToEx, NULL_BRUSH, NULL_PEN, PATCOPY, PS_SOLID, PatBlt, Pie, Polygon,
    Polyline, PtInRegion, RGN_AND, RGN_DIFF, RGN_OR, RGN_XOR, Rectangle, ReleaseDC, RoundRect,
    SRCCOPY, SelectClipRgn, SelectObject, SetBkColor, SetBkMode, SetPixel, SetROP2,
    SetStretchBltMode, SetTextColor, StretchBlt, TextOutW, WINDING,
};
use windows_sys::Win32::Foundation::SIZE;

pub use windows_sys::Win32::Graphics::Gdi::{
    BLACKNESS as ROP_BLACKNESS, DSTINVERT as ROP_DSTINVERT, MERGECOPY as ROP_MERGECOPY,
    MERGECOPY, MERGEPAINT as ROP_MERGEPAINT, NOTSRCCOPY as ROP_NOTSRCCOPY,
    NOTSRCERASE as ROP_NOTSRCERASE, PATCOPY as ROP_PATCOPY, PATINVERT as ROP_PATINVERT,
    PATPAINT as ROP_PATPAINT, R2_COPYPEN, R2_NOT, R2_XORPEN, SRCAND as ROP_SRCAND,
    SRCCOPY as ROP_SRCCOPY, SRCERASE as ROP_SRCERASE, SRCINVERT as ROP_SRCINVERT,
    SRCPAINT as ROP_SRCPAINT, TRANSPARENT, WHITENESS as ROP_WHITENESS, OPAQUE,
};

/// A loaded Windows `.bmp` resource held in its own compatible memory DC.
/// 1bpp BMPs stay true 1bpp monochrome bitmaps so Win16 `SetTextColor`/`SetBkColor` colorization works 1:1.
pub struct AdBitmap {
    hdc: HDC,
    hbmp: HBITMAP,
    old_bmp: HGDIOBJ,
    pub width: i32,
    pub height: i32,
    pub bpp: u16,
}

unsafe impl Send for AdBitmap {}

impl AdBitmap {
    /// Load a standard `.bmp` file (BITMAPFILEHEADER + BITMAPINFOHEADER + palette + pixels).
    pub fn from_bmp_bytes(bmp: &[u8]) -> Option<Self> {
        if bmp.len() < 54 || &bmp[0..2] != b"BM" {
            return None;
        }
        let off_bits = u32::from_le_bytes(bmp[10..14].try_into().ok()?) as usize;
        let bi_size = u32::from_le_bytes(bmp[14..18].try_into().ok()?) as usize;
        if bi_size < 40 || off_bits > bmp.len() {
            return None;
        }
        let width = i32::from_le_bytes(bmp[18..22].try_into().ok()?);
        let raw_height = i32::from_le_bytes(bmp[22..26].try_into().ok()?);
        let top_down = raw_height < 0;
        let height = raw_height.abs();
        let bpp = u16::from_le_bytes(bmp[28..30].try_into().ok()?);
        let clr_used = u32::from_le_bytes(bmp[46..50].try_into().ok()?) as usize;

        if width <= 0 || height <= 0 {
            return None;
        }

        let palette_off = 14 + bi_size;
        let ncolors = if bpp <= 8 {
            if clr_used != 0 {
                clr_used
            } else {
                1usize << bpp
            }
        } else {
            0
        };

        unsafe {
            let screen_dc = GetDC(ptr::null_mut());
            let hdc = CreateCompatibleDC(screen_dc);
            ReleaseDC(ptr::null_mut(), screen_dc);
            if hdc.is_null() {
                return None;
            }

            let hbmp: HBITMAP = if bpp == 1 {
                // Keep as genuine 1bpp monochrome DDB!
                // Note: In Windows 1bpp DIBs, palette[0] is typically black (0,0,0) and palette[1] white (255,255,255).
                // If palette[0] is brighter than palette[1], invert bits so 0=black(fg/TextColor) and 1=white(bg/BkColor)
                // matching Win16 LoadBitmap monochrome DDB convention!
                let mut invert = false;
                if palette_off + 8 <= bmp.len() {
                    let c0 = bmp[palette_off] as u32
                        + bmp[palette_off + 1] as u32
                        + bmp[palette_off + 2] as u32;
                    let c1 = bmp[palette_off + 4] as u32
                        + bmp[palette_off + 5] as u32
                        + bmp[palette_off + 6] as u32;
                    if c0 > c1 {
                        invert = true;
                    }
                }
                let dib_stride = (((width as usize) + 31) / 32) * 4;
                let ddb_stride = (((width as usize) + 15) / 16) * 2;
                let mut mono_bits = vec![0u8; ddb_stride * (height as usize)];
                for y in 0..(height as usize) {
                    let src_y = if top_down { y } else { (height as usize) - 1 - y };
                    let src_row = off_bits + src_y * dib_stride;
                    let dst_row = y * ddb_stride;
                    for x in 0..ddb_stride {
                        let byte = bmp.get(src_row + x).copied().unwrap_or(0);
                        mono_bits[dst_row + x] = if invert { !byte } else { byte };
                    }
                }
                CreateBitmap(width, height, 1, 1, mono_bits.as_ptr() as *const _)
            } else {
                // Convert 4bpp / 8bpp / 24bpp / 32bpp DIB into a 32-bit top-down DIBSection
                let bmi = BITMAPINFO {
                    bmiHeader: BITMAPINFOHEADER {
                        biSize: std::mem::size_of::<BITMAPINFOHEADER>() as u32,
                        biWidth: width,
                        biHeight: -height, // top-down
                        biPlanes: 1,
                        biBitCount: 32,
                        biCompression: BI_RGB,
                        biSizeImage: 0,
                        biXPelsPerMeter: 0,
                        biYPelsPerMeter: 0,
                        biClrUsed: 0,
                        biClrImportant: 0,
                    },
                    bmiColors: [std::mem::zeroed()],
                };
                let mut bits_ptr: *mut std::ffi::c_void = ptr::null_mut();
                let hb = CreateDIBSection(hdc, &bmi, DIB_RGB_COLORS, &mut bits_ptr, ptr::null_mut(), 0);
                if !hb.is_null() && !bits_ptr.is_null() {
                    let dst = std::slice::from_raw_parts_mut(
                        bits_ptr as *mut u32,
                        (width as usize) * (height as usize),
                    );
                    let mut pal = Vec::with_capacity(ncolors);
                    for i in 0..ncolors {
                        let p = palette_off + i * 4;
                        if p + 3 <= bmp.len() {
                            let b = bmp[p] as u32;
                            let g = bmp[p + 1] as u32;
                            let r = bmp[p + 2] as u32;
                            pal.push(b | (g << 8) | (r << 16));
                        } else {
                            pal.push(0);
                        }
                    }
                    let dib_stride = (((width as usize) * (bpp as usize) + 31) / 32) * 4;
                    for y in 0..(height as usize) {
                        let src_y = if top_down { y } else { (height as usize) - 1 - y };
                        let row_off = off_bits + src_y * dib_stride;
                        for x in 0..(width as usize) {
                            let bgra = match bpp {
                                4 => {
                                    let byte = bmp.get(row_off + (x >> 1)).copied().unwrap_or(0);
                                    let idx = if (x & 1) == 0 { byte >> 4 } else { byte & 0x0F } as usize;
                                    pal.get(idx).copied().unwrap_or(0)
                                }
                                8 => {
                                    let idx = bmp.get(row_off + x).copied().unwrap_or(0) as usize;
                                    pal.get(idx).copied().unwrap_or(0)
                                }
                                24 => {
                                    let p = row_off + x * 3;
                                    let b = bmp.get(p).copied().unwrap_or(0) as u32;
                                    let g = bmp.get(p + 1).copied().unwrap_or(0) as u32;
                                    let r = bmp.get(p + 2).copied().unwrap_or(0) as u32;
                                    b | (g << 8) | (r << 16)
                                }
                                32 => {
                                    let p = row_off + x * 4;
                                    let b = bmp.get(p).copied().unwrap_or(0) as u32;
                                    let g = bmp.get(p + 1).copied().unwrap_or(0) as u32;
                                    let r = bmp.get(p + 2).copied().unwrap_or(0) as u32;
                                    b | (g << 8) | (r << 16)
                                }
                                _ => 0,
                            };
                            dst[y * (width as usize) + x] = bgra;
                        }
                    }
                }
                hb
            };

            if hbmp.is_null() {
                DeleteDC(hdc);
                return None;
            }
            let old_bmp = SelectObject(hdc, hbmp as HGDIOBJ);
            Some(Self {
                hdc,
                hbmp,
                old_bmp,
                width,
                height,
                bpp,
            })
        }
    }

    #[inline]
    pub fn hdc(&self) -> HDC {
        self.hdc
    }

    #[inline]
    pub fn hbitmap(&self) -> HBITMAP {
        self.hbmp
    }
}

impl Drop for AdBitmap {
    fn drop(&mut self) {
        unsafe {
            if !self.hdc.is_null() {
                SelectObject(self.hdc, self.old_bmp);
                DeleteDC(self.hdc);
            }
            if !self.hbmp.is_null() {
                DeleteObject(self.hbmp as HGDIOBJ);
            }
        }
    }
}

/// RAII wrapper around a Win32 GDI Region (`HRGN`), used by modules like Starry Night
/// (`CreateRectRgn`, `CombineRgn`, `PtInRegion`).
pub struct AdRegion {
    hrgn: HRGN,
}

unsafe impl Send for AdRegion {}

impl AdRegion {
    pub fn rect(left: i32, top: i32, right: i32, bottom: i32) -> Self {
        let hrgn = unsafe { CreateRectRgn(left, top, right, bottom) };
        Self { hrgn }
    }

    pub fn elliptic(left: i32, top: i32, right: i32, bottom: i32) -> Self {
        let hrgn = unsafe { CreateEllipticRgn(left, top, right, bottom) };
        Self { hrgn }
    }

    pub fn polygon(pts: &[(i32, i32)]) -> Self {
        let win_pts: Vec<POINT> = pts.iter().map(|&(x, y)| POINT { x, y }).collect();
        let hrgn = unsafe { CreatePolygonRgn(win_pts.as_ptr(), win_pts.len() as i32, WINDING) };
        Self { hrgn }
    }

    pub fn union_with(&mut self, other: &AdRegion) {
        unsafe {
            CombineRgn(self.hrgn, self.hrgn, other.hrgn, RGN_OR);
        }
    }

    pub fn intersect_with(&mut self, other: &AdRegion) {
        unsafe {
            CombineRgn(self.hrgn, self.hrgn, other.hrgn, RGN_AND);
        }
    }

    pub fn xor_with(&mut self, other: &AdRegion) {
        unsafe {
            CombineRgn(self.hrgn, self.hrgn, other.hrgn, RGN_XOR);
        }
    }

    pub fn diff_with(&mut self, other: &AdRegion) {
        unsafe {
            CombineRgn(self.hrgn, self.hrgn, other.hrgn, RGN_DIFF);
        }
    }

    #[inline]
    pub fn contains_point(&self, x: i32, y: i32) -> bool {
        unsafe { PtInRegion(self.hrgn, x, y) != 0 }
    }

    #[inline]
    pub fn raw(&self) -> HRGN {
        self.hrgn
    }
}

impl Drop for AdRegion {
    fn drop(&mut self) {
        unsafe {
            if !self.hrgn.is_null() {
                DeleteObject(self.hrgn as HGDIOBJ);
            }
        }
    }
}

/// Persistent offscreen Win32 GDI drawing surface at logical resolution.
pub struct AdSurface {
    hdc: HDC,
    hbmp: HBITMAP,
    old_bmp: HGDIOBJ,
    bits: *mut u32,
    pub width: i32,
    pub height: i32,
}

unsafe impl Send for AdSurface {}

impl AdSurface {
    pub fn new(width: i32, height: i32) -> Option<Self> {
        let width = width.max(1);
        let height = height.max(1);
        unsafe {
            let screen_dc = GetDC(ptr::null_mut());
            let hdc = CreateCompatibleDC(screen_dc);
            ReleaseDC(ptr::null_mut(), screen_dc);
            if hdc.is_null() {
                return None;
            }
            let bmi = BITMAPINFO {
                bmiHeader: BITMAPINFOHEADER {
                    biSize: std::mem::size_of::<BITMAPINFOHEADER>() as u32,
                    biWidth: width,
                    biHeight: -height, // top-down
                    biPlanes: 1,
                    biBitCount: 32,
                    biCompression: BI_RGB,
                    biSizeImage: 0,
                    biXPelsPerMeter: 0,
                    biYPelsPerMeter: 0,
                    biClrUsed: 0,
                    biClrImportant: 0,
                },
                bmiColors: [std::mem::zeroed()],
            };
            let mut bits_ptr: *mut std::ffi::c_void = ptr::null_mut();
            let hbmp =
                CreateDIBSection(hdc, &bmi, DIB_RGB_COLORS, &mut bits_ptr, ptr::null_mut(), 0);
            if hbmp.is_null() || bits_ptr.is_null() {
                DeleteDC(hdc);
                return None;
            }
            let old_bmp = SelectObject(hdc, hbmp as HGDIOBJ);
            SetStretchBltMode(hdc, COLORONCOLOR);
            let mut surface = Self {
                hdc,
                hbmp,
                old_bmp,
                bits: bits_ptr as *mut u32,
                width,
                height,
            };
            surface.fill_black();
            Some(surface)
        }
    }

    #[inline]
    pub fn hdc(&self) -> HDC {
        self.hdc
    }

    /// Direct access to 32-bit top-down `0x00RRGGBB` pixel buffer for fast pixel work or verification.
    #[inline]
    pub fn pixels(&self) -> &[u32] {
        unsafe { std::slice::from_raw_parts(self.bits, (self.width * self.height) as usize) }
    }

    #[inline]
    pub fn pixels_mut(&mut self) -> &mut [u32] {
        unsafe { std::slice::from_raw_parts_mut(self.bits, (self.width * self.height) as usize) }
    }

    pub fn fill_black(&mut self) {
        unsafe {
            PatBlt(self.hdc, 0, 0, self.width, self.height, BLACKNESS);
        }
    }

    pub fn fill_rect_rgb(&mut self, left: i32, top: i32, right: i32, bottom: i32, colorref: u32) {
        unsafe {
            let brush = CreateSolidBrush(colorref);
            let rc = RECT {
                left,
                top,
                right,
                bottom,
            };
            FillRect(self.hdc, &rc, brush);
            DeleteObject(brush as HGDIOBJ);
        }
    }

    pub fn pat_blt_black(&mut self, x: i32, y: i32, w: i32, h: i32) {
        unsafe {
            PatBlt(self.hdc, x, y, w, h, BLACKNESS);
        }
    }

    pub fn pat_blt_rgb(&mut self, x: i32, y: i32, w: i32, h: i32, colorref: u32) {
        unsafe {
            let brush = CreateSolidBrush(colorref);
            let old = SelectObject(self.hdc, brush as HGDIOBJ);
            PatBlt(self.hdc, x, y, w, h, PATCOPY);
            SelectObject(self.hdc, old);
            DeleteObject(brush as HGDIOBJ);
        }
    }

    #[inline]
    pub fn set_pixel(&mut self, x: i32, y: i32, colorref: u32) {
        unsafe {
            SetPixel(self.hdc, x, y, colorref);
        }
    }

    #[inline]
    pub fn get_pixel(&self, x: i32, y: i32) -> u32 {
        unsafe { GetPixel(self.hdc, x, y) }
    }

    pub fn set_text_color(&mut self, colorref: u32) {
        unsafe {
            SetTextColor(self.hdc, colorref);
        }
    }

    pub fn set_bk_color(&mut self, colorref: u32) {
        unsafe {
            SetBkColor(self.hdc, colorref);
        }
    }

    pub fn set_bk_mode(&mut self, mode: i32) {
        unsafe {
            SetBkMode(self.hdc, mode);
        }
    }

    pub fn set_rop2(&mut self, rop2: i32) -> i32 {
        unsafe { SetROP2(self.hdc, rop2) }
    }

    pub fn line(&mut self, x1: i32, y1: i32, x2: i32, y2: i32, width: i32, colorref: u32) {
        unsafe {
            let pen: HPEN = CreatePen(PS_SOLID, width, colorref);
            let old = SelectObject(self.hdc, pen as HGDIOBJ);
            MoveToEx(self.hdc, x1, y1, ptr::null_mut());
            LineTo(self.hdc, x2, y2);
            SelectObject(self.hdc, old);
            DeleteObject(pen as HGDIOBJ);
        }
    }

    pub fn polyline_segments(&mut self, pts: &[(i32, i32)], width: i32, colorref: u32) {
        if pts.len() < 2 {
            return;
        }
        unsafe {
            let pen: HPEN = CreatePen(PS_SOLID, width, colorref);
            let old = SelectObject(self.hdc, pen as HGDIOBJ);
            MoveToEx(self.hdc, pts[0].0, pts[0].1, ptr::null_mut());
            for &(x, y) in &pts[1..] {
                LineTo(self.hdc, x, y);
            }
            SelectObject(self.hdc, old);
            DeleteObject(pen as HGDIOBJ);
        }
    }

    pub fn rectangle(
        &mut self,
        left: i32,
        top: i32,
        right: i32,
        bottom: i32,
        pen_color: Option<u32>,
        brush_color: Option<u32>,
    ) {
        self.rectangle_pen_width(left, top, right, bottom, 1, pen_color, brush_color);
    }

    pub fn rectangle_pen_width(
        &mut self,
        left: i32,
        top: i32,
        right: i32,
        bottom: i32,
        pen_width: i32,
        pen_color: Option<u32>,
        brush_color: Option<u32>,
    ) {
        unsafe {
            let (pen, owned_pen) = match pen_color {
                Some(c) => (CreatePen(PS_SOLID, pen_width, c) as HGDIOBJ, true),
                None => (GetStockObject(NULL_PEN), false),
            };
            let (brush, owned_brush) = match brush_color {
                Some(c) => (CreateSolidBrush(c) as HGDIOBJ, true),
                None => (GetStockObject(NULL_BRUSH), false),
            };
            let old_p = SelectObject(self.hdc, pen);
            let old_b = SelectObject(self.hdc, brush);
            Rectangle(self.hdc, left, top, right, bottom);
            SelectObject(self.hdc, old_p);
            SelectObject(self.hdc, old_b);
            if owned_pen {
                DeleteObject(pen);
            }
            if owned_brush {
                DeleteObject(brush);
            }
        }
    }

    pub fn ellipse(
        &mut self,
        left: i32,
        top: i32,
        right: i32,
        bottom: i32,
        pen_color: Option<u32>,
        brush_color: Option<u32>,
    ) {
        self.ellipse_pen_width(left, top, right, bottom, 1, pen_color, brush_color);
    }

    pub fn ellipse_pen_width(
        &mut self,
        left: i32,
        top: i32,
        right: i32,
        bottom: i32,
        pen_width: i32,
        pen_color: Option<u32>,
        brush_color: Option<u32>,
    ) {
        unsafe {
            let (pen, owned_pen) = match pen_color {
                Some(c) => (CreatePen(PS_SOLID, pen_width, c) as HGDIOBJ, true),
                None => (GetStockObject(NULL_PEN), false),
            };
            let (brush, owned_brush) = match brush_color {
                Some(c) => (CreateSolidBrush(c) as HGDIOBJ, true),
                None => (GetStockObject(NULL_BRUSH), false),
            };
            let old_p = SelectObject(self.hdc, pen);
            let old_b = SelectObject(self.hdc, brush);
            Ellipse(self.hdc, left, top, right, bottom);
            SelectObject(self.hdc, old_p);
            SelectObject(self.hdc, old_b);
            if owned_pen {
                DeleteObject(pen);
            }
            if owned_brush {
                DeleteObject(brush);
            }
        }
    }

    /// 1:1 equivalent of `ScrollDC(hdc, dx, dy, &rc, &rc, NULL, &rUpdate)` + `FillRect(&rUpdate, BLACK_BRUSH)`.
    pub fn scroll_rect_fill_black(
        &mut self,
        left: i32,
        top: i32,
        right: i32,
        bottom: i32,
        dx: i32,
        dy: i32,
    ) {
        let w = right - left;
        let h = bottom - top;
        if w <= 0 || h <= 0 || (dx == 0 && dy == 0) {
            return;
        }
        let copy_w = (w - dx.abs()).max(0);
        let copy_h = (h - dy.abs()).max(0);
        if copy_w > 0 && copy_h > 0 {
            let sx = if dx > 0 { left } else { left - dx };
            let sy = if dy > 0 { top } else { top - dy };
            let dst_x = if dx > 0 { left + dx } else { left };
            let dst_y = if dy > 0 { top + dy } else { top };
            unsafe {
                BitBlt(self.hdc, dst_x, dst_y, copy_w, copy_h, self.hdc, sx, sy, SRCCOPY);
            }
        }
        // Fill uncovered strip(s) black
        if dx > 0 {
            self.pat_blt_black(left, top, dx.min(w), h);
        } else if dx < 0 {
            let strip = (-dx).min(w);
            self.pat_blt_black(right - strip, top, strip, h);
        }
        if dy > 0 {
            self.pat_blt_black(left, top, w, dy.min(h));
        } else if dy < 0 {
            let strip = (-dy).min(h);
            self.pat_blt_black(left, bottom - strip, w, strip);
        }
    }

    pub fn polygon(&mut self, pts: &[(i32, i32)], pen_color: Option<u32>, brush_color: Option<u32>) {
        if pts.len() < 3 {
            return;
        }
        let win_pts: Vec<POINT> = pts.iter().map(|&(x, y)| POINT { x, y }).collect();
        unsafe {
            let (pen, owned_pen) = match pen_color {
                Some(c) => (CreatePen(PS_SOLID, 1, c) as HGDIOBJ, true),
                None => (GetStockObject(NULL_PEN), false),
            };
            let (brush, owned_brush) = match brush_color {
                Some(c) => (CreateSolidBrush(c) as HGDIOBJ, true),
                None => (GetStockObject(NULL_BRUSH), false),
            };
            let old_p = SelectObject(self.hdc, pen);
            let old_b = SelectObject(self.hdc, brush);
            Polygon(self.hdc, win_pts.as_ptr(), win_pts.len() as i32);
            SelectObject(self.hdc, old_p);
            SelectObject(self.hdc, old_b);
            if owned_pen {
                DeleteObject(pen);
            }
            if owned_brush {
                DeleteObject(brush);
            }
        }
    }

    pub fn bit_blt_bitmap(
        &mut self,
        dx: i32,
        dy: i32,
        w: i32,
        h: i32,
        bmp: &AdBitmap,
        sx: i32,
        sy: i32,
        rop: u32,
    ) {
        unsafe {
            BitBlt(self.hdc, dx, dy, w, h, bmp.hdc(), sx, sy, rop);
        }
    }

    /// Perform a `BitBlt` with an explicit solid pattern brush selected into the destination DC
    /// (used by 3-operand ROPs such as `DSPDxax = 0x00E20746` in Nocturnes and `MERGECOPY`).
    pub fn bit_blt_bitmap_with_brush(
        &mut self,
        dx: i32,
        dy: i32,
        w: i32,
        h: i32,
        bmp: &AdBitmap,
        sx: i32,
        sy: i32,
        brush_color: u32,
        rop: u32,
    ) {
        unsafe {
            let brush = CreateSolidBrush(brush_color);
            let old = SelectObject(self.hdc, brush as HGDIOBJ);
            BitBlt(self.hdc, dx, dy, w, h, bmp.hdc(), sx, sy, rop);
            SelectObject(self.hdc, old);
            DeleteObject(brush as HGDIOBJ);
        }
    }

    pub fn bit_blt_surface(
        &mut self,
        dx: i32,
        dy: i32,
        w: i32,
        h: i32,
        src: &AdSurface,
        sx: i32,
        sy: i32,
        rop: u32,
    ) {
        unsafe {
            BitBlt(self.hdc, dx, dy, w, h, src.hdc(), sx, sy, rop);
        }
    }

    pub fn bit_blt_surface_with_brush(
        &mut self,
        dx: i32,
        dy: i32,
        w: i32,
        h: i32,
        src: &AdSurface,
        sx: i32,
        sy: i32,
        brush_color: u32,
        rop: u32,
    ) {
        unsafe {
            let brush = CreateSolidBrush(brush_color);
            let old = SelectObject(self.hdc, brush as HGDIOBJ);
            BitBlt(self.hdc, dx, dy, w, h, src.hdc(), sx, sy, rop);
            SelectObject(self.hdc, old);
            DeleteObject(brush as HGDIOBJ);
        }
    }

    pub fn bit_blt_self(
        &mut self,
        dx: i32,
        dy: i32,
        w: i32,
        h: i32,
        sx: i32,
        sy: i32,
        rop: u32,
    ) {
        unsafe {
            BitBlt(self.hdc, dx, dy, w, h, self.hdc, sx, sy, rop);
        }
    }

    pub fn stretch_blt_bitmap(
        &mut self,
        dx: i32,
        dy: i32,
        dw: i32,
        dh: i32,
        bmp: &AdBitmap,
        sx: i32,
        sy: i32,
        sw: i32,
        sh: i32,
        rop: u32,
    ) {
        unsafe {
            SetStretchBltMode(self.hdc, COLORONCOLOR);
            StretchBlt(self.hdc, dx, dy, dw, dh, bmp.hdc(), sx, sy, sw, sh, rop);
        }
    }

    pub fn set_clip_region(&mut self, rgn: Option<&AdRegion>) {
        unsafe {
            let raw = rgn.map(|r| r.raw()).unwrap_or(ptr::null_mut());
            SelectClipRgn(self.hdc, raw);
        }
    }

    pub fn text_out(&mut self, x: i32, y: i32, text: &str) {
        let wide: Vec<u16> = text.encode_utf16().collect();
        unsafe {
            TextOutW(self.hdc, x, y, wide.as_ptr(), wide.len() as i32);
        }
    }

    /// Capture a region of the Windows desktop into this surface (for screen-manipulating modules).
    pub fn capture_desktop(&mut self, src_x: i32, src_y: i32, src_w: i32, src_h: i32) {
        unsafe {
            let screen_dc = GetDC(ptr::null_mut());
            SetStretchBltMode(self.hdc, COLORONCOLOR);
            StretchBlt(
                self.hdc,
                0,
                0,
                self.width,
                self.height,
                screen_dc,
                src_x,
                src_y,
                src_w,
                src_h,
                SRCCOPY,
            );
            ReleaseDC(ptr::null_mut(), screen_dc);
        }
    }

    /// Present the offscreen surface to a destination window `HDC` using crisp nearest-neighbor scaling.
    pub fn present_to_hdc(&self, dst_hdc: HDC, dst_w: i32, dst_h: i32) {
        self.present_to_hdc_styled(dst_hdc, dst_w, dst_h, false);
    }

    /// Present the offscreen surface with optional 4:3 centered stage aspect ratio lock (`pillarbox_4_3`).
    pub fn present_to_hdc_styled(
        &self,
        dst_hdc: HDC,
        dst_w: i32,
        dst_h: i32,
        pillarbox_4_3: bool,
    ) {
        unsafe {
            if pillarbox_4_3 && dst_w > 0 && dst_h > 0 {
                let stage_w = ((dst_h * 4) / 3).min(dst_w);
                let stage_x = (dst_w - stage_w) / 2;
                if stage_x > 0 {
                    PatBlt(dst_hdc, 0, 0, stage_x, dst_h, BLACKNESS);
                    PatBlt(
                        dst_hdc,
                        stage_x + stage_w,
                        0,
                        dst_w - (stage_x + stage_w),
                        dst_h,
                        BLACKNESS,
                    );
                }
                SetStretchBltMode(dst_hdc, COLORONCOLOR);
                StretchBlt(
                    dst_hdc,
                    stage_x,
                    0,
                    stage_w,
                    dst_h,
                    self.hdc,
                    0,
                    0,
                    self.width,
                    self.height,
                    SRCCOPY,
                );
            } else if self.width == dst_w && self.height == dst_h {
                BitBlt(dst_hdc, 0, 0, dst_w, dst_h, self.hdc, 0, 0, SRCCOPY);
            } else {
                SetStretchBltMode(dst_hdc, COLORONCOLOR);
                StretchBlt(
                    dst_hdc,
                    0,
                    0,
                    dst_w,
                    dst_h,
                    self.hdc,
                    0,
                    0,
                    self.width,
                    self.height,
                    SRCCOPY,
                );
            }
        }
    }

    /// Apply a subtle retro CRT phosphor scanline effect to every odd scanline in the surface.
    pub fn apply_crt_scanlines(&mut self) {
        let w = self.width as usize;
        let h = self.height as usize;
        let px = self.pixels_mut();
        let mut y = 1usize;
        while y < h {
            let row = y * w;
            for x in 0..w {
                let c = px[row + x];
                // Dim odd scanlines by ~25% (`(c * 3) / 4` per channel)
                let r = (((c >> 16) & 0xFF) * 3) >> 2;
                let g = (((c >> 8) & 0xFF) * 3) >> 2;
                let b = ((c & 0xFF) * 3) >> 2;
                px[row + x] = (r << 16) | (g << 8) | b;
            }
            y += 2;
        }
    }

    /// Fill an explicit solid `HBRUSH` rect (useful when porting GDI brushes directly).
    pub fn fill_rect_brush(&mut self, rc: RECT, brush: HBRUSH) {
        unsafe {
            FillRect(self.hdc, &rc, brush);
        }
    }

    /// Copy the current surface pixels into a newly allocated `AdSurface` (ideal for desktop backup).
    pub fn clone_surface(&self) -> Option<Self> {
        let mut copy = Self::new(self.width, self.height)?;
        copy.bit_blt_surface(0, 0, self.width, self.height, self, 0, 0, SRCCOPY);
        Some(copy)
    }

    pub fn invert_rect(&mut self, left: i32, top: i32, right: i32, bottom: i32) {
        let rc = RECT {
            left,
            top,
            right,
            bottom,
        };
        unsafe {
            InvertRect(self.hdc, &rc);
        }
    }

    pub fn fill_rgn_rgb(&mut self, rgn: &AdRegion, colorref: u32) {
        unsafe {
            let brush = CreateSolidBrush(colorref);
            FillRgn(self.hdc, rgn.raw(), brush);
            DeleteObject(brush as HGDIOBJ);
        }
    }

    pub fn invert_rgn(&mut self, rgn: &AdRegion) {
        unsafe {
            InvertRgn(self.hdc, rgn.raw());
        }
    }

    pub fn pat_blt_rop(&mut self, x: i32, y: i32, w: i32, h: i32, colorref: u32, rop: u32) {
        unsafe {
            let brush = CreateSolidBrush(colorref);
            let old = SelectObject(self.hdc, brush as HGDIOBJ);
            PatBlt(self.hdc, x, y, w, h, rop);
            SelectObject(self.hdc, old);
            DeleteObject(brush as HGDIOBJ);
        }
    }

    pub fn fill_rect_hatch(
        &mut self,
        left: i32,
        top: i32,
        right: i32,
        bottom: i32,
        hatch_style: i32,
        colorref: u32,
    ) {
        unsafe {
            let brush = CreateHatchBrush(hatch_style, colorref);
            let rc = RECT {
                left,
                top,
                right,
                bottom,
            };
            FillRect(self.hdc, &rc, brush);
            DeleteObject(brush as HGDIOBJ);
        }
    }

    /// Fill a rectangle with an 8x8 1-bpp monochrome pattern bitmap (`pattern_rows[0..8]`) using `rop`.
    pub fn pat_blt_pattern8x8(
        &mut self,
        x: i32,
        y: i32,
        w: i32,
        h: i32,
        pattern_rows: &[u16; 8],
        rop: u32,
    ) {
        unsafe {
            let hbmp = CreateBitmap(8, 8, 1, 1, pattern_rows.as_ptr() as *const _);
            if hbmp.is_null() {
                return;
            }
            let brush = CreatePatternBrush(hbmp);
            let old = SelectObject(self.hdc, brush as HGDIOBJ);
            PatBlt(self.hdc, x, y, w, h, rop);
            SelectObject(self.hdc, old);
            DeleteObject(brush as HGDIOBJ);
            DeleteObject(hbmp as HGDIOBJ);
        }
    }

    pub fn round_rect(
        &mut self,
        left: i32,
        top: i32,
        right: i32,
        bottom: i32,
        rw: i32,
        rh: i32,
        pen_color: Option<u32>,
        brush_color: Option<u32>,
    ) {
        unsafe {
            let (pen, owned_pen) = match pen_color {
                Some(c) => (CreatePen(PS_SOLID, 1, c) as HGDIOBJ, true),
                None => (GetStockObject(NULL_PEN), false),
            };
            let (brush, owned_brush) = match brush_color {
                Some(c) => (CreateSolidBrush(c) as HGDIOBJ, true),
                None => (GetStockObject(NULL_BRUSH), false),
            };
            let old_p = SelectObject(self.hdc, pen);
            let old_b = SelectObject(self.hdc, brush);
            RoundRect(self.hdc, left, top, right, bottom, rw, rh);
            SelectObject(self.hdc, old_p);
            SelectObject(self.hdc, old_b);
            if owned_pen {
                DeleteObject(pen);
            }
            if owned_brush {
                DeleteObject(brush);
            }
        }
    }

    pub fn pie(
        &mut self,
        left: i32,
        top: i32,
        right: i32,
        bottom: i32,
        xr1: i32,
        yr1: i32,
        xr2: i32,
        yr2: i32,
        pen_color: Option<u32>,
        brush_color: Option<u32>,
    ) {
        unsafe {
            let (pen, owned_pen) = match pen_color {
                Some(c) => (CreatePen(PS_SOLID, 1, c) as HGDIOBJ, true),
                None => (GetStockObject(NULL_PEN), false),
            };
            let (brush, owned_brush) = match brush_color {
                Some(c) => (CreateSolidBrush(c) as HGDIOBJ, true),
                None => (GetStockObject(NULL_BRUSH), false),
            };
            let old_p = SelectObject(self.hdc, pen);
            let old_b = SelectObject(self.hdc, brush);
            Pie(self.hdc, left, top, right, bottom, xr1, yr1, xr2, yr2);
            SelectObject(self.hdc, old_p);
            SelectObject(self.hdc, old_b);
            if owned_pen {
                DeleteObject(pen);
            }
            if owned_brush {
                DeleteObject(brush);
            }
        }
    }

    pub fn chord(
        &mut self,
        left: i32,
        top: i32,
        right: i32,
        bottom: i32,
        xr1: i32,
        yr1: i32,
        xr2: i32,
        yr2: i32,
        pen_color: Option<u32>,
        brush_color: Option<u32>,
    ) {
        unsafe {
            let (pen, owned_pen) = match pen_color {
                Some(c) => (CreatePen(PS_SOLID, 1, c) as HGDIOBJ, true),
                None => (GetStockObject(NULL_PEN), false),
            };
            let (brush, owned_brush) = match brush_color {
                Some(c) => (CreateSolidBrush(c) as HGDIOBJ, true),
                None => (GetStockObject(NULL_BRUSH), false),
            };
            let old_p = SelectObject(self.hdc, pen);
            let old_b = SelectObject(self.hdc, brush);
            Chord(self.hdc, left, top, right, bottom, xr1, yr1, xr2, yr2);
            SelectObject(self.hdc, old_p);
            SelectObject(self.hdc, old_b);
            if owned_pen {
                DeleteObject(pen);
            }
            if owned_brush {
                DeleteObject(brush);
            }
        }
    }

    pub fn arc(
        &mut self,
        left: i32,
        top: i32,
        right: i32,
        bottom: i32,
        xr1: i32,
        yr1: i32,
        xr2: i32,
        yr2: i32,
        width: i32,
        pen_color: u32,
    ) {
        unsafe {
            let pen = CreatePen(PS_SOLID, width, pen_color);
            let old_p = SelectObject(self.hdc, pen as HGDIOBJ);
            Arc(self.hdc, left, top, right, bottom, xr1, yr1, xr2, yr2);
            SelectObject(self.hdc, old_p);
            DeleteObject(pen as HGDIOBJ);
        }
    }

    pub fn polyline(&mut self, pts: &[(i32, i32)], width: i32, colorref: u32) {
        if pts.len() < 2 {
            return;
        }
        let win_pts: Vec<POINT> = pts.iter().map(|&(x, y)| POINT { x, y }).collect();
        unsafe {
            let pen = CreatePen(PS_SOLID, width, colorref);
            let old_p = SelectObject(self.hdc, pen as HGDIOBJ);
            Polyline(self.hdc, win_pts.as_ptr(), win_pts.len() as i32);
            SelectObject(self.hdc, old_p);
            DeleteObject(pen as HGDIOBJ);
        }
    }

    pub fn draw_text_font(
        &mut self,
        face: &str,
        height: i32,
        bold: bool,
        italic: bool,
        underline: bool,
        color: u32,
        rect: RECT,
        centered: bool,
        multiline: bool,
        text: &str,
    ) {
        let mut fw: Vec<u16> = face.encode_utf16().collect();
        fw.push(0);
        let tw: Vec<u16> = text.encode_utf16().collect();
        let mut rc = rect;
        unsafe {
            let hfont = CreateFontW(
                height,
                0,
                0,
                0,
                if bold { 700 } else { 400 },
                u32::from(italic),
                u32::from(underline),
                0,
                1,
                0,
                0,
                0,
                0,
                fw.as_ptr(),
            );
            let old_f = SelectObject(self.hdc, hfont as HGDIOBJ);
            SetTextColor(self.hdc, color);
            SetBkMode(self.hdc, TRANSPARENT as i32);
            let mut flags = DT_NOPREFIX | if centered { DT_CENTER } else { DT_LEFT };
            if multiline {
                flags |= DT_WORDBREAK;
            } else {
                flags |= DT_SINGLELINE;
            }
            DrawTextW(self.hdc, tw.as_ptr(), tw.len() as i32, &mut rc, flags);
            SelectObject(self.hdc, old_f);
            DeleteObject(hfont as HGDIOBJ);
        }
    }

    pub fn measure_text_font(
        &self,
        face: &str,
        height: i32,
        bold: bool,
        italic: bool,
        text: &str,
    ) -> (i32, i32) {
        let mut fw: Vec<u16> = face.encode_utf16().collect();
        fw.push(0);
        let tw: Vec<u16> = text.encode_utf16().collect();
        let mut sz = SIZE { cx: 0, cy: 0 };
        unsafe {
            let hfont = CreateFontW(
                height,
                0,
                0,
                0,
                if bold { 700 } else { 400 },
                u32::from(italic),
                0,
                0,
                1,
                0,
                0,
                0,
                0,
                fw.as_ptr(),
            );
            let old_f = SelectObject(self.hdc, hfont as HGDIOBJ);
            GetTextExtentPoint32W(self.hdc, tw.as_ptr(), tw.len() as i32, &mut sz);
            SelectObject(self.hdc, old_f);
            DeleteObject(hfont as HGDIOBJ);
        }
        (sz.cx, sz.cy)
    }

    pub fn stretch_blt_surface(
        &mut self,
        dx: i32,
        dy: i32,
        dw: i32,
        dh: i32,
        src: &AdSurface,
        sx: i32,
        sy: i32,
        sw: i32,
        sh: i32,
        rop: u32,
    ) {
        unsafe {
            SetStretchBltMode(self.hdc, COLORONCOLOR);
            StretchBlt(self.hdc, dx, dy, dw, dh, src.hdc(), sx, sy, sw, sh, rop);
        }
    }
}

impl Drop for AdSurface {
    fn drop(&mut self) {
        unsafe {
            if !self.hdc.is_null() {
                SelectObject(self.hdc, self.old_bmp);
                DeleteDC(self.hdc);
            }
            if !self.hbmp.is_null() {
                DeleteObject(self.hbmp as HGDIOBJ);
            }
        }
    }
}
