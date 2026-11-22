//! Embedded original 1991 `AD.EXE` bitmaps & icons extracted directly from `DISK01.IMG`.

use ad_sdk::canvas::AdBitmap;
use windows_sys::Win32::UI::WindowsAndMessaging::{
    CreateIconFromResourceEx, HICON, LR_DEFAULTCOLOR,
};

// Exact original bitmaps from AD.EXE (RT_BITMAP #1..#12, mapped via TYPE_15)
pub const BMP_ON_SW: &[u8] = include_bytes!("../../../assets/ad_host/RT_BITMAP_#1.bmp");
pub const BMP_OFF_SW: &[u8] = include_bytes!("../../../assets/ad_host/RT_BITMAP_#2.bmp");
pub const BMP_LOGO: &[u8] = include_bytes!("../../../assets/ad_host/RT_BITMAP_#5.bmp");
pub const BMP_LMETEOR: &[u8] = include_bytes!("../../../assets/ad_host/RT_BITMAP_#12.bmp");

// Exact original icons from AD.EXE (RT_GROUP_ICON #1 = AD, #9 = INACTIVE)
pub const ICO_AD: &[u8] = include_bytes!("../../../assets/ad_host/icon_1.ico");
pub const ICO_INACTIVE: &[u8] = include_bytes!("../../../assets/ad_host/icon_9.ico");

pub struct HostArt {
    pub on_sw: AdBitmap,
    pub off_sw: AdBitmap,
    pub logo: AdBitmap,
    pub lmeteor: AdBitmap,
}

impl HostArt {
    pub fn load() -> Option<Self> {
        Some(Self {
            on_sw: AdBitmap::from_bmp_bytes(BMP_ON_SW)?,
            off_sw: AdBitmap::from_bmp_bytes(BMP_OFF_SW)?,
            logo: AdBitmap::from_bmp_bytes(BMP_LOGO)?,
            lmeteor: AdBitmap::from_bmp_bytes(BMP_LMETEOR)?,
        })
    }
}

/// Create a Win32 `HICON` directly from an embedded `.ico` byte slice (32x32 or 16x16).
pub fn hicon_from_ico_bytes(ico: &[u8], desired_px: i32) -> HICON {
    if ico.len() < 22 {
        return std::ptr::null_mut();
    }
    let count = u16::from_le_bytes([ico[4], ico[5]]) as usize;
    if count == 0 || ico.len() < 6 + count * 16 {
        return std::ptr::null_mut();
    }
    // First icon entry (original AD icons are single 32x32 4bpp entries)
    let img_size = u32::from_le_bytes([ico[14], ico[15], ico[16], ico[17]]) as usize;
    let img_off = u32::from_le_bytes([ico[18], ico[19], ico[20], ico[21]]) as usize;
    if img_off + img_size > ico.len() {
        return std::ptr::null_mut();
    }
    unsafe {
        CreateIconFromResourceEx(
            ico[img_off..img_off + img_size].as_ptr(),
            img_size as u32,
            1, // TRUE = icon
            0x0003_0000,
            desired_px,
            desired_px,
            LR_DEFAULTCOLOR,
        )
    }
}
