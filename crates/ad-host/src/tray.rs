//! Windows 11 System Tray icon & context menu using the authentic 1991 `AD.EXE` icons
//! (`AD` icon when enabled, `INACTIVE` icon with an X over it when disabled, matching `README.TXT`).

use std::ptr;

use windows_sys::Win32::Foundation::{HWND, POINT};
use windows_sys::Win32::UI::Shell::{
    NIF_ICON, NIF_MESSAGE, NIF_TIP, NIM_ADD, NIM_DELETE, NIM_MODIFY, NOTIFYICONDATAW,
    Shell_NotifyIconW,
};
use windows_sys::Win32::UI::WindowsAndMessaging::{
    AppendMenuW, CreatePopupMenu, DestroyIcon, DestroyMenu, GetCursorPos, HICON, MF_CHECKED,
    MF_SEPARATOR, MF_STRING, MF_UNCHECKED, SetForegroundWindow, TPM_BOTTOMALIGN, TPM_LEFTALIGN,
    TrackPopupMenu, WM_APP,
};

use crate::resources::{ICO_AD, ICO_INACTIVE, hicon_from_ico_bytes};

pub const WM_TRAYICON: u32 = WM_APP + 100;
pub const TRAY_UID: u32 = 1;

pub const CMD_TRAY_OPEN: usize = 4001;
pub const CMD_TRAY_SLEEP_NOW: usize = 4002;
pub const CMD_TRAY_DEMO: usize = 4003;
pub const CMD_TRAY_TOGGLE_ON: usize = 4004;
pub const CMD_TRAY_TOGGLE_THEME: usize = 4005;
pub const CMD_TRAY_EXIT: usize = 4006;

pub struct TrayIcon {
    hwnd: HWND,
    icon_on: HICON,
    icon_off: HICON,
    installed: bool,
}

impl TrayIcon {
    pub fn new(hwnd: HWND, enabled: bool) -> Self {
        let icon_on = hicon_from_ico_bytes(ICO_AD, 16);
        let icon_off = hicon_from_ico_bytes(ICO_INACTIVE, 16);
        let mut tray = Self {
            hwnd,
            icon_on,
            icon_off,
            installed: false,
        };
        tray.install(enabled);
        tray
    }

    fn build_nid(&self, enabled: bool) -> NOTIFYICONDATAW {
        let mut nid: NOTIFYICONDATAW = unsafe { std::mem::zeroed() };
        nid.cbSize = std::mem::size_of::<NOTIFYICONDATAW>() as u32;
        nid.hWnd = self.hwnd;
        nid.uID = TRAY_UID;
        nid.uFlags = NIF_MESSAGE | NIF_ICON | NIF_TIP;
        nid.uCallbackMessage = WM_TRAYICON;
        nid.hIcon = if enabled { self.icon_on } else { self.icon_off };
        let tip = if enabled {
            "After Dark 1.0a (On) — Click to open Control Panel"
        } else {
            "After Dark 1.0a (Off) — Click to open Control Panel"
        };
        for (i, ch) in tip.encode_utf16().take(127).enumerate() {
            nid.szTip[i] = ch;
        }
        nid
    }

    fn install(&mut self, enabled: bool) {
        let nid = self.build_nid(enabled);
        unsafe {
            if Shell_NotifyIconW(NIM_ADD, &nid) != 0 {
                self.installed = true;
            }
        }
    }

    pub fn update_state(&self, enabled: bool) {
        if !self.installed {
            return;
        }
        let nid = self.build_nid(enabled);
        unsafe {
            Shell_NotifyIconW(NIM_MODIFY, &nid);
        }
    }

    pub fn show_context_menu(&self, enabled: bool, is_modern_theme: bool) {
        unsafe {
            let hmenu = CreatePopupMenu();
            if hmenu.is_null() {
                return;
            }
            let add_item = |id: usize, flags: u32, text: &str| {
                let mut w: Vec<u16> = text.encode_utf16().collect();
                w.push(0);
                AppendMenuW(hmenu, flags, id, w.as_ptr());
            };
            add_item(CMD_TRAY_OPEN, MF_STRING, "Open After Dark Control Panel");
            AppendMenuW(hmenu, MF_SEPARATOR, 0, ptr::null());
            add_item(CMD_TRAY_SLEEP_NOW, MF_STRING, "Sleep Now");
            add_item(CMD_TRAY_DEMO, MF_STRING, "Demo Current Module");
            AppendMenuW(hmenu, MF_SEPARATOR, 0, ptr::null());
            add_item(
                CMD_TRAY_TOGGLE_ON,
                MF_STRING | if enabled { MF_CHECKED } else { MF_UNCHECKED },
                "Screen Saver On",
            );
            add_item(
                CMD_TRAY_TOGGLE_THEME,
                MF_STRING | if is_modern_theme { MF_CHECKED } else { MF_UNCHECKED },
                "Modern Windows 11 UI Style",
            );
            AppendMenuW(hmenu, MF_SEPARATOR, 0, ptr::null());
            add_item(CMD_TRAY_EXIT, MF_STRING, "Exit After Dark");

            let mut pt = POINT { x: 0, y: 0 };
            GetCursorPos(&mut pt);
            SetForegroundWindow(self.hwnd);
            TrackPopupMenu(
                hmenu,
                TPM_LEFTALIGN | TPM_BOTTOMALIGN,
                pt.x,
                pt.y,
                0,
                self.hwnd,
                ptr::null(),
            );
            DestroyMenu(hmenu);
        }
    }
}

impl Drop for TrayIcon {
    fn drop(&mut self) {
        unsafe {
            if self.installed {
                let mut nid: NOTIFYICONDATAW = std::mem::zeroed();
                nid.cbSize = std::mem::size_of::<NOTIFYICONDATAW>() as u32;
                nid.hWnd = self.hwnd;
                nid.uID = TRAY_UID;
                Shell_NotifyIconW(NIM_DELETE, &nid);
            }
            if !self.icon_on.is_null() {
                DestroyIcon(self.icon_on);
            }
            if !self.icon_off.is_null() {
                DestroyIcon(self.icon_off);
            }
        }
    }
}
