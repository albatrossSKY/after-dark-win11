//! Windows 11 Multi-Monitor enumeration, Per-Monitor DPI detection,
//! Hot Corners ("Sleep Now" / "Never Sleep"), and Global Idle detection.

use std::ptr;

use ad_sdk::prefs::{MultiMonitorMode, ScreenCorner};
use windows_sys::Win32::Foundation::{BOOL, LPARAM, POINT, RECT};
use windows_sys::Win32::Graphics::Gdi::{
    EnumDisplayMonitors, GetMonitorInfoW, HDC, HMONITOR, MONITORINFO,
};
const MONITORINFOF_PRIMARY: u32 = 0x0000_0001;
use windows_sys::Win32::System::SystemInformation::GetTickCount;
use windows_sys::Win32::UI::HiDpi::{GetDpiForMonitor, MDT_EFFECTIVE_DPI};
use windows_sys::Win32::UI::Input::KeyboardAndMouse::{GetLastInputInfo, LASTINPUTINFO};
use windows_sys::Win32::UI::WindowsAndMessaging::{
    GetCursorPos, GetSystemMetrics, SM_CXVIRTUALSCREEN, SM_CYVIRTUALSCREEN, SM_XVIRTUALSCREEN,
    SM_YVIRTUALSCREEN,
};

/// Describes a target display surface (either one physical monitor or the spanned virtual screen).
#[derive(Debug, Clone)]
pub struct DisplayTarget {
    pub x: i32,
    pub y: i32,
    pub width: i32,
    pub height: i32,
    pub dpi: u32,
    pub is_primary: bool,
}

/// Enumerate all connected Windows 11 monitors with their exact pixel bounds and effective DPI.
pub fn enumerate_monitors() -> Vec<DisplayTarget> {
    let mut monitors: Vec<DisplayTarget> = Vec::new();
    unsafe extern "system" fn callback(
        hmon: HMONITOR,
        _hdc: HDC,
        _rect: *mut RECT,
        lparam: LPARAM,
    ) -> BOOL {
        let list = unsafe { &mut *(lparam as *mut Vec<DisplayTarget>) };
        let mut mi: MONITORINFO = unsafe { std::mem::zeroed() };
        mi.cbSize = std::mem::size_of::<MONITORINFO>() as u32;
        if unsafe { GetMonitorInfoW(hmon, &mut mi) } != 0 {
            let mut dpi_x: u32 = 96;
            let mut dpi_y: u32 = 96;
            let _ = unsafe { GetDpiForMonitor(hmon, MDT_EFFECTIVE_DPI, &mut dpi_x, &mut dpi_y) };
            let r = mi.rcMonitor;
            list.push(DisplayTarget {
                x: r.left,
                y: r.top,
                width: (r.right - r.left).max(1),
                height: (r.bottom - r.top).max(1),
                dpi: dpi_x.max(96),
                is_primary: (mi.dwFlags & MONITORINFOF_PRIMARY) != 0,
            });
        }
        1
    }

    unsafe {
        EnumDisplayMonitors(
            ptr::null_mut(),
            ptr::null(),
            Some(callback),
            &mut monitors as *mut Vec<DisplayTarget> as LPARAM,
        );
    }

    if monitors.is_empty() {
        monitors.push(DisplayTarget {
            x: 0,
            y: 0,
            width: 1920,
            height: 1080,
            dpi: 96,
            is_primary: true,
        });
    }
    monitors
}

/// Resolve the list of fullscreen targets according to the user's `MultiMonitorMode`.
pub fn resolve_targets(mode: MultiMonitorMode) -> Vec<DisplayTarget> {
    let monitors = enumerate_monitors();
    match mode {
        MultiMonitorMode::PerMonitor => monitors,
        MultiMonitorMode::PrimaryOnly => {
            if let Some(p) = monitors.iter().find(|m| m.is_primary) {
                vec![p.clone()]
            } else {
                vec![monitors[0].clone()]
            }
        }
        MultiMonitorMode::Spanned => unsafe {
            let vx = GetSystemMetrics(SM_XVIRTUALSCREEN);
            let vy = GetSystemMetrics(SM_YVIRTUALSCREEN);
            let vw = GetSystemMetrics(SM_CXVIRTUALSCREEN).max(1);
            let vh = GetSystemMetrics(SM_CYVIRTUALSCREEN).max(1);
            let primary_dpi = monitors
                .iter()
                .find(|m| m.is_primary)
                .map(|m| m.dpi)
                .unwrap_or(96);
            vec![DisplayTarget {
                x: vx,
                y: vy,
                width: vw,
                height: vh,
                dpi: primary_dpi,
                is_primary: true,
            }]
        },
    }
}

/// Returns system-wide user idle duration in milliseconds via `GetLastInputInfo`.
pub fn idle_time_ms() -> u32 {
    unsafe {
        let mut lii = LASTINPUTINFO {
            cbSize: std::mem::size_of::<LASTINPUTINFO>() as u32,
            dwTime: 0,
        };
        if GetLastInputInfo(&mut lii) != 0 {
            GetTickCount().wrapping_sub(lii.dwTime)
        } else {
            0
        }
    }
}

/// Returns current mouse cursor coordinates in virtual screen space.
pub fn cursor_pos() -> (i32, i32) {
    let mut pt = POINT { x: 0, y: 0 };
    unsafe {
        let _ = GetCursorPos(&mut pt);
    }
    (pt.x, pt.y)
}

/// Hot-corner hit test (8x8 pixel corner zone on the primary monitor, matching `AD_LIB.DLL` `CHECKSLEEPRECT`).
pub fn cursor_in_corner(corner: ScreenCorner) -> bool {
    const CORNER_PX: i32 = 8;
    let monitors = enumerate_monitors();
    let Some(primary) = monitors.iter().find(|m| m.is_primary).or(monitors.first()) else {
        return false;
    };
    let (cx, cy) = cursor_pos();
    let left = primary.x;
    let top = primary.y;
    let right = primary.x + primary.width;
    let bottom = primary.y + primary.height;
    match corner {
        ScreenCorner::TopLeft => cx >= left && cx < left + CORNER_PX && cy >= top && cy < top + CORNER_PX,
        ScreenCorner::TopRight => cx >= right - CORNER_PX && cx < right && cy >= top && cy < top + CORNER_PX,
        ScreenCorner::BottomLeft => cx >= left && cx < left + CORNER_PX && cy >= bottom - CORNER_PX && cy < bottom,
        ScreenCorner::BottomRight => cx >= right - CORNER_PX && cx < right && cy >= bottom - CORNER_PX && cy < bottom,
    }
}
