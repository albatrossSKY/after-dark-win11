#![windows_subsystem = "windows"]

//! After Dark 1.0a (1991) — Native Win64 Rust Port for Windows 11.
//!
//! Standalone After Dark tray/control-panel host featuring:
//! - Faithful Retro Windows 3.1 Control Panel (default) with 1-click toggle to Modern Windows 11 Dark UI
//! - Original 1991 `AD.EXE` bitmaps (`LOGO`, `ON_SW`, `OFF_SW`, `LMETEOR`) and icons (`AD`, `INACTIVE`)
//! - Hot Corners ("Sleep Now" / "Never Sleep"), Global Idle Timer, Global Hotkey (`Ctrl+Shift+S`)
//! - Multi-Monitor (Per-Monitor / Spanned / Primary) & High-DPI Integer Scaling (`Auto / 1x / 2x / 3x`)
//! - Live Demo Mode (animates behind the Control Panel with live control updates)
//! - Authentic `AD_PREFS.INI` and `RANDOM.ADS` persistence + external Win64 SDK `.dll` plugin support

mod monitors;
mod resources;
mod saver;
mod setup_dlg;
mod tray;

use std::path::PathBuf;
use std::ptr;
use std::time::{Duration, Instant};

use ad_modules::{ModuleCatalogEntry, build_catalog, instantiate_entry};
use ad_sdk::palette::rgb;
use ad_sdk::prefs::{
    AdPrefs, FrameRateMode, MultiMonitorMode, RandomizerEntry, ScaleMode, UiTheme,
    load_random_ads, save_random_ads,
};
use ad_sdk::sound::AdSound;
use ad_sdk::{AdControl, SaverMode};
use windows_sys::Win32::Foundation::{HINSTANCE, HWND, LPARAM, LRESULT, POINT, RECT, WPARAM};
use windows_sys::Win32::Graphics::Dwm::{
    DWMWA_USE_IMMERSIVE_DARK_MODE, DWMWA_WINDOW_CORNER_PREFERENCE, DWMWCP_DONOTROUND, DWMWCP_ROUND,
    DwmSetWindowAttribute,
};
use windows_sys::Win32::Graphics::Gdi::{
    BeginPaint, COLORONCOLOR, CreateFontW, CreatePen, CreateSolidBrush, DeleteObject, DrawTextW,
    DT_LEFT, DT_NOPREFIX, DT_SINGLELINE, DT_VCENTER, DT_WORDBREAK, EndPaint, FillRect,
    GetStockObject, HBRUSH, HDC, HFONT, HGDIOBJ, InvalidateRect, LineTo, MoveToEx, PAINTSTRUCT,
    PS_SOLID, Rectangle, SelectObject, SetBkColor, SetBkMode, SetStretchBltMode, SetTextColor,
    StretchBlt, SRCCOPY, TRANSPARENT,
};
use windows_sys::Win32::System::LibraryLoader::GetModuleHandleW;
use windows_sys::Win32::UI::Controls::{
    ICC_BAR_CLASSES, ICC_STANDARD_CLASSES, INITCOMMONCONTROLSEX, InitCommonControlsEx,
    TBM_SETPOS, TBM_SETRANGE, TBS_AUTOTICKS, TBS_HORZ, TRACKBAR_CLASSW,
};
use windows_sys::Win32::UI::HiDpi::{
    DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE_V2, GetDpiForWindow, SetProcessDpiAwarenessContext,
};
use windows_sys::Win32::UI::Input::KeyboardAndMouse::{
    GetAsyncKeyState, MOD_CONTROL, MOD_SHIFT, RegisterHotKey, UnregisterHotKey, VK_CONTROL,
};
use windows_sys::Win32::UI::WindowsAndMessaging::{
    BM_GETCHECK, BM_SETCHECK, BS_AUTOCHECKBOX, BS_PUSHBUTTON,
    CB_ADDSTRING, CB_GETCURSEL, CB_SETCURSEL, CBS_DROPDOWNLIST, CBN_SELCHANGE, CreateWindowExW,
    CS_HREDRAW, CS_VREDRAW, DefWindowProcW, DestroyIcon, DestroyWindow, DispatchMessageW,
    EN_CHANGE, ES_AUTOHSCROLL, GetClientRect, GetMessageW, GetWindowLongPtrW, GetWindowTextW,
    GWLP_USERDATA, HICON, ICON_BIG, ICON_SMALL, IDC_ARROW, KillTimer, LB_ADDSTRING, LB_GETCURSEL,
    LB_RESETCONTENT, LB_SETCURSEL, LBN_DBLCLK, LBN_SELCHANGE, LBS_NOTIFY, LoadCursorW, MSG,
    PostQuitMessage, RegisterClassW, SW_HIDE, SW_RESTORE, SW_SHOW, SendMessageW,
    SetForegroundWindow, SetTimer, SetWindowLongPtrW, SetWindowTextW, ShowWindow, TranslateMessage,
    WM_CLOSE, WM_COMMAND, WM_CTLCOLORBTN, WM_CTLCOLORLISTBOX, WM_CTLCOLORSTATIC, WM_DESTROY,
    WM_HOTKEY, WM_HSCROLL, WM_LBUTTONUP, WM_PAINT, WM_RBUTTONUP, WM_SETFONT, WM_SETICON, WM_SIZE,
    WM_TIMER, WM_USER, WNDCLASSW, WS_BORDER, WS_CAPTION, WS_CHILD, WS_CLIPCHILDREN,
    WS_MINIMIZEBOX, WS_OVERLAPPED, WS_SYSMENU, WS_TABSTOP, WS_VISIBLE, WS_VSCROLL, SIZE_MINIMIZED,
};

const TBM_GETPOS: u32 = WM_USER;
const BST_UNCHECKED: u32 = 0;
const BST_CHECKED: u32 = 1;

use resources::{HostArt, ICO_AD, hicon_from_ico_bytes};
use saver::{SaverSession, WM_SAVER_STOPPED};
use tray::{
    CMD_TRAY_DEMO, CMD_TRAY_EXIT, CMD_TRAY_OPEN, CMD_TRAY_SLEEP_NOW, CMD_TRAY_TOGGLE_ON,
    CMD_TRAY_TOGGLE_THEME, TrayIcon, WM_TRAYICON,
};

const TIMER_MONITOR: usize = 10;
const HOTKEY_SLEEP_ID: i32 = 1;

const ID_LIST_MODULES: i32 = 1001;
const ID_BTN_WHEN: i32 = 1002;
const ID_BTN_DEMO: i32 = 1003;
const ID_BTN_SLEEP: i32 = 1004;
const ID_BTN_THEME: i32 = 1005;
const ID_BTN_ABOUT: i32 = 1006;
const ID_BTN_TRAY: i32 = 1007;
const ID_COMBO_PACK: i32 = 1008;
const ID_EDIT_SEARCH: i32 = 1009;
const ID_BTN_FAV: i32 = 1010;

// Dynamic control slots 0..3 -> IDs 2000..2003
const ID_CTRL_BASE: i32 = 2000;

fn wide(s: &str) -> Vec<u16> {
    let mut v: Vec<u16> = s.encode_utf16().collect();
    v.push(0);
    v
}

#[derive(Clone, Copy)]
struct LayoutRects {
    logo: RECT,
    power_panel: RECT,
    power_switch_hit: RECT,
    list_panel: RECT,
    ctrl_panel: RECT,
    demo_panel: RECT,
    credits_panel: RECT,
    status_panel: RECT,
}

impl LayoutRects {
    fn compute(scale: f32) -> (i32, i32, Self) {
        let s = |v: i32| ((v as f32) * scale).round() as i32;
        let rc = |x, y, w, h| RECT {
            left: s(x),
            top: s(y),
            right: s(x + w),
            bottom: s(y + h),
        };
        // Proportions directly faithful to AD.EXE SEG 11 (scaled cleanly for comfortable Win11 use)
        let client_w = s(512);
        let client_h = s(526);
        let rects = Self {
            logo: rc(8, 8, 344, 108),
            power_panel: rc(358, 8, 146, 108),
            power_switch_hit: rc(374, 18, 40, 56),
            list_panel: rc(8, 122, 204, 294),
            ctrl_panel: rc(218, 122, 286, 240),
            demo_panel: rc(218, 368, 286, 48),
            credits_panel: rc(8, 422, 496, 56),
            status_panel: rc(8, 484, 496, 34),
        };
        (client_w, client_h, rects)
    }
}

struct DynamicSlotWidgets {
    label: HWND,
    widget: HWND,
    value_label: HWND,
}

impl Default for DynamicSlotWidgets {
    fn default() -> Self {
        Self {
            label: ptr::null_mut(),
            widget: ptr::null_mut(),
            value_label: ptr::null_mut(),
        }
    }
}

struct AppState {
    hwnd: HWND,
    dpi_scale: f32,
    layout: LayoutRects,
    data_dir: PathBuf,
    prefs_path: PathBuf,
    random_ads_path: PathBuf,
    prefs: AdPrefs,
    catalog: Vec<ModuleCatalogEntry>,
    filtered_indices: Vec<usize>,
    pack_filter_idx: i32,
    search_query: String,
    selected_idx: usize,
    randomizer_pool: Vec<String>,
    art: Option<HostArt>,
    sound: AdSound,
    tray: Option<TrayIcon>,
    session: Option<SaverSession>,
    sleep_corner_since: Option<Instant>,
    idle_triggered: bool,
    force_exit: bool,
    hotkey_registered: bool,

    // Fonts & Brushes
    font_retro: HFONT,
    font_retro_bold: HFONT,
    font_modern: HFONT,
    font_modern_bold: HFONT,
    brush_retro_bg: HBRUSH,
    brush_retro_card: HBRUSH,
    brush_modern_bg: HBRUSH,
    brush_modern_card: HBRUSH,
    icon_big: HICON,
    icon_small: HICON,

    // Persistent child controls
    hwnd_pack_filter: HWND,
    hwnd_search: HWND,
    hwnd_btn_fav: HWND,
    hwnd_list: HWND,
    hwnd_btn_when: HWND,
    hwnd_btn_demo: HWND,
    hwnd_btn_sleep: HWND,
    hwnd_btn_theme: HWND,
    hwnd_btn_about: HWND,
    hwnd_btn_tray: HWND,

    // Dynamic 4-slot module controls
    slots: [DynamicSlotWidgets; 4],
}

impl AppState {
    fn current_font(&self, bold: bool) -> HFONT {
        match (self.prefs.ui_theme, bold) {
            (UiTheme::RetroWin31, false) => self.font_retro,
            (UiTheme::RetroWin31, true) => self.font_retro_bold,
            (UiTheme::ModernWin11, false) => self.font_modern,
            (UiTheme::ModernWin11, true) => self.font_modern_bold,
        }
    }

    fn selected_entry(&self) -> &ModuleCatalogEntry {
        &self.catalog[self.selected_idx.min(self.catalog.len().saturating_sub(1))]
    }

    fn current_raw_controls(&self, entry: &ModuleCatalogEntry) -> [i32; 4] {
        if let Some(&vals) = self.prefs.module_controls.get(&entry.meta.id) {
            vals
        } else {
            [
                entry.meta.controls[0].default_raw(),
                entry.meta.controls[1].default_raw(),
                entry.meta.controls[2].default_raw(),
                entry.meta.controls[3].default_raw(),
            ]
        }
    }

    fn save_all(&self) {
        let _ = self.prefs.save_to_file(&self.prefs_path);
        let entries: Vec<RandomizerEntry> = self
            .randomizer_pool
            .iter()
            .filter_map(|id| {
                self.catalog.iter().find(|e| &e.meta.id == id).map(|e| {
                    RandomizerEntry {
                        module_name: e.meta.name.clone(),
                        filename: e.meta.filename.clone(),
                    }
                })
            })
            .collect();
        let _ = save_random_ads(&self.random_ads_path, &entries);
    }

    fn sync_hotkey(&mut self) {
        unsafe {
            if self.hotkey_registered {
                UnregisterHotKey(self.hwnd, HOTKEY_SLEEP_ID);
                self.hotkey_registered = false;
            }
            if self.prefs.hotkey_enabled && self.prefs.hotkey_vk != 0 {
                let mut mods = 0u32;
                if self.prefs.hotkey_ctrl {
                    mods |= MOD_CONTROL;
                }
                if self.prefs.hotkey_shift {
                    mods |= MOD_SHIFT;
                }
                if RegisterHotKey(self.hwnd, HOTKEY_SLEEP_ID, mods, self.prefs.hotkey_vk) != 0 {
                    self.hotkey_registered = true;
                }
            }
        }
    }

    fn apply_window_theme(&self) {
        let dark: u32 = u32::from(self.prefs.ui_theme == UiTheme::ModernWin11);
        let corner: u32 = if self.prefs.ui_theme == UiTheme::ModernWin11 {
            DWMWCP_ROUND as u32
        } else {
            DWMWCP_DONOTROUND as u32
        };
        unsafe {
            let _ = DwmSetWindowAttribute(
                self.hwnd,
                DWMWA_USE_IMMERSIVE_DARK_MODE as u32,
                &dark as *const u32 as *const _,
                std::mem::size_of::<u32>() as u32,
            );
            let _ = DwmSetWindowAttribute(
                self.hwnd,
                DWMWA_WINDOW_CORNER_PREFERENCE as u32,
                &corner as *const u32 as *const _,
                std::mem::size_of::<u32>() as u32,
            );

            let font = self.current_font(false);
            for hw in [
                self.hwnd_pack_filter,
                self.hwnd_search,
                self.hwnd_btn_fav,
                self.hwnd_list,
                self.hwnd_btn_when,
                self.hwnd_btn_demo,
                self.hwnd_btn_sleep,
                self.hwnd_btn_theme,
                self.hwnd_btn_about,
                self.hwnd_btn_tray,
            ] {
                if !hw.is_null() {
                    SendMessageW(hw, WM_SETFONT, font as WPARAM, 1);
                }
            }
            let theme_lbl = if self.prefs.ui_theme == UiTheme::RetroWin31 {
                wide("Win 11 UI")
            } else {
                wide("Retro 3.1")
            };
            SetWindowTextW(self.hwnd_btn_theme, theme_lbl.as_ptr());

            for slot in &self.slots {
                for hw in [slot.label, slot.widget, slot.value_label] {
                    if !hw.is_null() {
                        SendMessageW(hw, WM_SETFONT, font as WPARAM, 1);
                    }
                }
            }
            InvalidateRect(self.hwnd, ptr::null(), 1);
        }
    }

    fn update_fav_button_label(&self) {
        if self.hwnd_btn_fav.is_null() {
            return;
        }
        let cur_id = &self.selected_entry().meta.id;
        let is_fav = self.prefs.favorites.iter().any(|f| f == cur_id);
        let lbl = wide(if is_fav { "★ Fav" } else { "☆ Fav" });
        unsafe {
            SetWindowTextW(self.hwnd_btn_fav, lbl.as_ptr());
        }
    }

    fn refresh_filtered_list(&mut self) {
        if self.hwnd_list.is_null() {
            return;
        }
        let q = self.search_query.trim().to_ascii_lowercase();
        let cur_id = self.selected_entry().meta.id.clone();

        self.filtered_indices.clear();
        unsafe {
            SendMessageW(self.hwnd_list, LB_RESETCONTENT, 0, 0);
        }

        let mut new_lb_sel: Option<usize> = None;
        for (cat_idx, entry) in self.catalog.iter().enumerate() {
            let id = &entry.meta.id;
            let is_simpsons = id.starts_with("simpsons_");
            let is_tng = id.starts_with("tng_");
            let is_looney = id.starts_with("looney_");
            let is_classic = !is_simpsons && !is_tng && !is_looney;
            let is_fav = self.prefs.favorites.iter().any(|f| f == id);

            let pack_ok = match self.pack_filter_idx {
                1 => is_classic,
                2 => is_simpsons,
                3 => is_tng,
                4 => is_looney,
                5 => is_fav,
                _ => true,
            };
            if !pack_ok {
                continue;
            }
            if !q.is_empty()
                && !entry.meta.name.to_ascii_lowercase().contains(&q)
                && !id.to_ascii_lowercase().contains(&q)
            {
                continue;
            }

            let lb_idx = self.filtered_indices.len();
            self.filtered_indices.push(cat_idx);
            if *id == cur_id {
                new_lb_sel = Some(lb_idx);
            }
            let display = if is_fav {
                format!("★ {}", entry.meta.name)
            } else {
                entry.meta.name.clone()
            };
            let nw = wide(&display);
            unsafe {
                SendMessageW(self.hwnd_list, LB_ADDSTRING, 0, nw.as_ptr() as LPARAM);
            }
        }

        if let Some(sel) = new_lb_sel {
            unsafe {
                SendMessageW(self.hwnd_list, LB_SETCURSEL, sel, 0);
            }
        } else if let Some(&first_cat_idx) = self.filtered_indices.first() {
            self.selected_idx = first_cat_idx;
            let entry = self.selected_entry().clone();
            self.prefs.module_name = entry.meta.name.clone();
            self.prefs.module_file = entry.meta.filename.clone();
            unsafe {
                SendMessageW(self.hwnd_list, LB_SETCURSEL, 0, 0);
            }
            self.rebuild_module_controls();
        }
        self.update_fav_button_label();
    }

    fn rebuild_module_controls(&mut self) {
        for slot in &mut self.slots {
            unsafe {
                if !slot.label.is_null() {
                    DestroyWindow(slot.label);
                    slot.label = ptr::null_mut();
                }
                if !slot.widget.is_null() {
                    DestroyWindow(slot.widget);
                    slot.widget = ptr::null_mut();
                }
                if !slot.value_label.is_null() {
                    DestroyWindow(slot.value_label);
                    slot.value_label = ptr::null_mut();
                }
            }
        }

        let entry = self.selected_entry().clone();
        let raw_vals = self.current_raw_controls(&entry);
        let hinst = unsafe { GetModuleHandleW(ptr::null()) };
        let font = self.current_font(false);
        let font_bold = self.current_font(true);
        let sc = |v: i32| ((v as f32) * self.dpi_scale).round() as i32;

        let base_x = self.layout.ctrl_panel.left + sc(12);
        let base_y = self.layout.ctrl_panel.top + sc(12);
        let ctrl_w = (self.layout.ctrl_panel.right - self.layout.ctrl_panel.left) - sc(24);
        let row_h = sc(54);

        let mut visible_row = 0i32;
        for slot_idx in 0..4 {
            let ctrl = &entry.meta.controls[slot_idx];
            if matches!(ctrl, AdControl::None) {
                continue;
            }
            let y = base_y + visible_row * row_h;
            visible_row += 1;
            let ctrl_id = ID_CTRL_BASE + slot_idx as i32;

            match ctrl {
                AdControl::LabeledSlider { title, .. } | AdControl::NumericSlider { title, .. } => {
                    let lbl_w = wide(title);
                    let val_str = ctrl.format_display_value(raw_vals[slot_idx]);
                    let val_w = wide(&val_str);
                    unsafe {
                        let h_lbl = CreateWindowExW(
                            0,
                            wide("STATIC").as_ptr(),
                            lbl_w.as_ptr(),
                            WS_CHILD | WS_VISIBLE,
                            base_x,
                            y,
                            ctrl_w - sc(82),
                            sc(18),
                            self.hwnd,
                            ptr::null_mut(),
                            hinst,
                            ptr::null(),
                        );
                        SendMessageW(h_lbl, WM_SETFONT, font_bold as WPARAM, 1);

                        let h_val = CreateWindowExW(
                            0,
                            wide("STATIC").as_ptr(),
                            val_w.as_ptr(),
                            WS_CHILD | WS_VISIBLE | 0x0002, // SS_RIGHT
                            base_x + ctrl_w - sc(80),
                            y,
                            sc(80),
                            sc(18),
                            self.hwnd,
                            ptr::null_mut(),
                            hinst,
                            ptr::null(),
                        );
                        SendMessageW(h_val, WM_SETFONT, font as WPARAM, 1);

                        let h_tb = CreateWindowExW(
                            0,
                            TRACKBAR_CLASSW,
                            ptr::null(),
                            WS_CHILD | WS_VISIBLE | WS_TABSTOP | TBS_HORZ | TBS_AUTOTICKS,
                            base_x,
                            y + sc(18),
                            ctrl_w,
                            sc(28),
                            self.hwnd,
                            ctrl_id as isize as _,
                            hinst,
                            ptr::null(),
                        );
                        let range_lparam = (100isize << 16) | 0;
                        SendMessageW(h_tb, TBM_SETRANGE, 1, range_lparam);
                        SendMessageW(
                            h_tb,
                            TBM_SETPOS,
                            1,
                            raw_vals[slot_idx].clamp(0, 100) as LPARAM,
                        );
                        self.slots[slot_idx] = DynamicSlotWidgets {
                            label: h_lbl,
                            widget: h_tb,
                            value_label: h_val,
                        };
                    }
                }
                AdControl::Menu { title, choices, .. } => unsafe {
                    let h_lbl = CreateWindowExW(
                        0,
                        wide("STATIC").as_ptr(),
                        wide(title).as_ptr(),
                        WS_CHILD | WS_VISIBLE,
                        base_x,
                        y,
                        ctrl_w,
                        sc(18),
                        self.hwnd,
                        ptr::null_mut(),
                        hinst,
                        ptr::null(),
                    );
                    SendMessageW(h_lbl, WM_SETFONT, font_bold as WPARAM, 1);

                    let h_cb = CreateWindowExW(
                        0,
                        wide("COMBOBOX").as_ptr(),
                        ptr::null(),
                        WS_CHILD | WS_VISIBLE | WS_TABSTOP | CBS_DROPDOWNLIST as u32,
                        base_x,
                        y + sc(19),
                        ctrl_w,
                        sc(120),
                        self.hwnd,
                        ctrl_id as isize as _,
                        hinst,
                        ptr::null(),
                    );
                    SendMessageW(h_cb, WM_SETFONT, font as WPARAM, 1);
                    for ch in choices {
                        let cw = wide(ch);
                        SendMessageW(h_cb, CB_ADDSTRING, 0, cw.as_ptr() as LPARAM);
                    }
                    SendMessageW(h_cb, CB_SETCURSEL, raw_vals[slot_idx].max(0) as WPARAM, 0);
                    self.slots[slot_idx] = DynamicSlotWidgets {
                        label: h_lbl,
                        widget: h_cb,
                        value_label: ptr::null_mut(),
                    };
                },
                AdControl::Checkbox { title, .. } => unsafe {
                    let h_chk = CreateWindowExW(
                        0,
                        wide("BUTTON").as_ptr(),
                        wide(title).as_ptr(),
                        WS_CHILD | WS_VISIBLE | WS_TABSTOP | BS_AUTOCHECKBOX as u32,
                        base_x,
                        y + sc(10),
                        ctrl_w,
                        sc(24),
                        self.hwnd,
                        ctrl_id as isize as _,
                        hinst,
                        ptr::null(),
                    );
                    SendMessageW(h_chk, WM_SETFONT, font as WPARAM, 1);
                    SendMessageW(
                        h_chk,
                        BM_SETCHECK,
                        if raw_vals[slot_idx] != 0 {
                            BST_CHECKED
                        } else {
                            BST_UNCHECKED
                        } as WPARAM,
                        0,
                    );
                    self.slots[slot_idx] = DynamicSlotWidgets {
                        label: ptr::null_mut(),
                        widget: h_chk,
                        value_label: ptr::null_mut(),
                    };
                },
                AdControl::Button { title } => unsafe {
                    let h_btn = CreateWindowExW(
                        0,
                        wide("BUTTON").as_ptr(),
                        wide(title).as_ptr(),
                        WS_CHILD | WS_VISIBLE | WS_TABSTOP | BS_PUSHBUTTON as u32,
                        base_x,
                        y + sc(8),
                        sc(120),
                        sc(28),
                        self.hwnd,
                        ctrl_id as isize as _,
                        hinst,
                        ptr::null(),
                    );
                    SendMessageW(h_btn, WM_SETFONT, font as WPARAM, 1);
                    self.slots[slot_idx] = DynamicSlotWidgets {
                        label: ptr::null_mut(),
                        widget: h_btn,
                        value_label: ptr::null_mut(),
                    };
                },
                AdControl::None => {}
            }
        }

        unsafe {
            InvalidateRect(self.hwnd, ptr::null(), 1);
        }
        self.update_fav_button_label();
    }

    fn update_demo_button_label(&self) {
        let is_demo = self
            .session
            .as_ref()
            .map(|s| s.mode() == SaverMode::Demo)
            .unwrap_or(false);
        let lbl = wide(if is_demo { "Stop Demo" } else { "&Demo" });
        unsafe {
            SetWindowTextW(self.hwnd_btn_demo, lbl.as_ptr());
        }
    }

    fn stop_session(&mut self) {
        if let Some(sess) = self.session.take() {
            sess.stop();
        }
        self.update_demo_button_label();
    }

    fn start_session(&mut self, mode: SaverMode) {
        self.stop_session();
        let primary_entry = self.selected_entry().clone();
        let primary_vals = self.current_raw_controls(&primary_entry);
        let pool = self.randomizer_pool.clone();
        let all_ctrls = self.prefs.module_controls.clone();
        let catalog = self.catalog.clone();
        let diff_per_mon = self.prefs.multi_monitor == MultiMonitorMode::DifferentPerMonitor;

        let sess = SaverSession::start(
            self.hwnd,
            mode,
            &self.prefs,
            &self.sound,
            |mon_idx| {
                if diff_per_mon && mon_idx > 0 {
                    let candidates: Vec<&ModuleCatalogEntry> = catalog
                        .iter()
                        .filter(|e| {
                            e.meta.id != "randomizer"
                                && e.meta.id != primary_entry.meta.id
                                && (pool.is_empty() || pool.contains(&e.meta.id))
                        })
                        .collect();
                    let chosen = if !candidates.is_empty() {
                        let seed = (std::time::SystemTime::now()
                            .duration_since(std::time::UNIX_EPOCH)
                            .map(|d| d.as_millis() as usize)
                            .unwrap_or(0))
                            .wrapping_add(mon_idx.wrapping_mul(37));
                        candidates[seed % candidates.len()]
                    } else {
                        &primary_entry
                    };
                    let vals = all_ctrls.get(&chosen.meta.id).copied().unwrap_or([
                        chosen.meta.controls[0].default_raw(),
                        chosen.meta.controls[1].default_raw(),
                        chosen.meta.controls[2].default_raw(),
                        chosen.meta.controls[3].default_raw(),
                    ]);
                    let m = instantiate_entry(chosen, &pool, &all_ctrls)
                        .unwrap_or_else(|| Box::new(ad_modules::toasters::ToastersModule::new()));
                    (m, vals)
                } else {
                    let m = instantiate_entry(&primary_entry, &pool, &all_ctrls)
                        .unwrap_or_else(|| Box::new(ad_modules::toasters::ToastersModule::new()));
                    (m, primary_vals)
                }
            },
        );
        self.session = sess;
        self.update_demo_button_label();
    }

    fn on_control_value_changed(&mut self, slot_idx: usize, new_raw: i32) {
        let entry = self.selected_entry().clone();
        let mut vals = self.current_raw_controls(&entry);
        vals[slot_idx] = new_raw;
        self.prefs
            .module_controls
            .insert(entry.meta.id.clone(), vals);

        if !self.slots[slot_idx].value_label.is_null() {
            let txt = entry.meta.controls[slot_idx].format_display_value(new_raw);
            let tw = wide(&txt);
            unsafe {
                SetWindowTextW(self.slots[slot_idx].value_label, tw.as_ptr());
            }
        }

        if let Some(sess) = self.session.as_mut() {
            if sess.mode() == SaverMode::Demo {
                sess.update_controls_live(slot_idx, vals);
            }
        }
        self.save_all();
    }

    fn paint_ui(&self, hdc: HDC) {
        let mut client: RECT = unsafe { std::mem::zeroed() };
        unsafe {
            GetClientRect(self.hwnd, &mut client);
        }
        let is_modern = self.prefs.ui_theme == UiTheme::ModernWin11;
        let sc = |v: i32| ((v as f32) * self.dpi_scale).round() as i32;

        // Window background
        unsafe {
            FillRect(
                hdc,
                &client,
                if is_modern {
                    self.brush_modern_bg
                } else {
                    self.brush_retro_bg
                },
            );
        }

        // Helper to draw either authentic Windows 3.1 beveled platform or sleek Win11 dark card
        let draw_platform = |rc: RECT| unsafe {
            if is_modern {
                let pen = CreatePen(PS_SOLID, 1, rgb(64, 64, 68));
                let old_p = SelectObject(hdc, pen as HGDIOBJ);
                let old_b = SelectObject(hdc, self.brush_modern_card as HGDIOBJ);
                Rectangle(hdc, rc.left, rc.top, rc.right, rc.bottom);
                SelectObject(hdc, old_p);
                SelectObject(hdc, old_b);
                DeleteObject(pen as HGDIOBJ);
            } else {
                // Exact 1991 After Dark PLATFORMWNDPROC style: 1px black frame + white top/left + dark gray bottom/right
                FillRect(hdc, &rc, self.brush_retro_card);
                let p_blk = CreatePen(PS_SOLID, 1, rgb(0, 0, 0));
                let p_hi = CreatePen(PS_SOLID, 1, rgb(255, 255, 255));
                let p_sh = CreatePen(PS_SOLID, 1, rgb(128, 128, 128));

                let old = SelectObject(hdc, p_blk as HGDIOBJ);
                let old_b = SelectObject(hdc, GetStockObject(5)); // NULL_BRUSH
                Rectangle(hdc, rc.left, rc.top, rc.right, rc.bottom);

                SelectObject(hdc, p_hi as HGDIOBJ);
                MoveToEx(hdc, rc.left + 1, rc.bottom - 2, ptr::null_mut());
                LineTo(hdc, rc.left + 1, rc.top + 1);
                LineTo(hdc, rc.right - 1, rc.top + 1);

                SelectObject(hdc, p_sh as HGDIOBJ);
                MoveToEx(hdc, rc.right - 2, rc.top + 1, ptr::null_mut());
                LineTo(hdc, rc.right - 2, rc.bottom - 2);
                LineTo(hdc, rc.left + 1, rc.bottom - 2);

                SelectObject(hdc, old);
                SelectObject(hdc, old_b);
                DeleteObject(p_blk as HGDIOBJ);
                DeleteObject(p_hi as HGDIOBJ);
                DeleteObject(p_sh as HGDIOBJ);
            }
        };

        // 1. Top-left After Dark Logo Banner (authentic AD.EXE RT_BITMAP #5 on #000080 navy or Win11 card)
        let lrc = self.layout.logo;
        unsafe {
            let bg_col = if is_modern {
                rgb(18, 28, 52)
            } else {
                rgb(0, 0, 128) // Exact AD.EXE SEG 11:007F CreateSolidBrush(RGB(0,0,128))!
            };
            let br = CreateSolidBrush(bg_col);
            FillRect(hdc, &lrc, br);
            DeleteObject(br as HGDIOBJ);

            let border = CreatePen(
                PS_SOLID,
                1,
                if is_modern { rgb(64, 88, 130) } else { rgb(0, 0, 0) },
            );
            let old_p = SelectObject(hdc, border as HGDIOBJ);
            let old_b = SelectObject(hdc, GetStockObject(5));
            Rectangle(hdc, lrc.left, lrc.top, lrc.right, lrc.bottom);
            SelectObject(hdc, old_p);
            SelectObject(hdc, old_b);
            DeleteObject(border as HGDIOBJ);

            if let Some(art) = self.art.as_ref() {
                // Crisp nearest-neighbor stretch of authentic 170x63 4bpp Flying Toaster LOGO bitmap
                let avail_w = lrc.right - lrc.left - sc(8);
                let avail_h = lrc.bottom - lrc.top - sc(8);
                let mut draw_w = avail_w;
                let mut draw_h = (draw_w * art.logo.height) / art.logo.width.max(1);
                if draw_h > avail_h {
                    draw_h = avail_h;
                    draw_w = (draw_h * art.logo.width) / art.logo.height.max(1);
                }
                let dx = lrc.left + ((lrc.right - lrc.left) - draw_w) / 2;
                let dy = lrc.top + ((lrc.bottom - lrc.top) - draw_h) / 2;
                SetStretchBltMode(hdc, COLORONCOLOR);
                StretchBlt(
                    hdc,
                    dx,
                    dy,
                    draw_w,
                    draw_h,
                    art.logo.hdc(),
                    0,
                    0,
                    art.logo.width,
                    art.logo.height,
                    SRCCOPY,
                );
                // Composite the iconic red meteor (`LMETEOR`) over the top-left of LOGO (AD.EXE SEG 11:01E2)
                let red_br = CreateSolidBrush(rgb(255, 0, 0));
                let old_br = SelectObject(hdc, red_br as HGDIOBJ);
                let mw = (art.lmeteor.width * draw_w) / art.logo.width.max(1);
                let mh = (art.lmeteor.height * draw_h) / art.logo.height.max(1);
                SetTextColor(hdc, rgb(0, 0, 0));
                SetBkColor(hdc, rgb(255, 255, 255));
                StretchBlt(
                    hdc,
                    dx,
                    dy,
                    mw,
                    mh,
                    art.lmeteor.hdc(),
                    0,
                    0,
                    art.lmeteor.width,
                    art.lmeteor.height,
                    0x00E2_0746, // DSPDxax
                );
                SelectObject(hdc, old_br);
                DeleteObject(red_br as HGDIOBJ);
            }
        }

        // 2. Panels
        draw_platform(self.layout.power_panel);
        draw_platform(self.layout.list_panel);
        draw_platform(self.layout.ctrl_panel);
        draw_platform(self.layout.demo_panel);
        draw_platform(self.layout.credits_panel);
        draw_platform(self.layout.status_panel);

        // 3. Original 18x30 Power Switch (ON_SW / OFF_SW) + "On" / "Off" labels
        if let Some(art) = self.art.as_ref() {
            let sw = if self.prefs.screen_saver_on {
                &art.on_sw
            } else {
                &art.off_sw
            };
            let pr = self.layout.power_switch_hit;
            let sw_w = sc(sw.width * 2 - 4);
            let sw_h = sc(sw.height * 2 - 8);
            unsafe {
                SetStretchBltMode(hdc, COLORONCOLOR);
                StretchBlt(
                    hdc,
                    pr.left + sc(2),
                    pr.top + sc(2),
                    sw_w,
                    sw_h,
                    sw.hdc(),
                    0,
                    0,
                    sw.width,
                    sw.height,
                    SRCCOPY,
                );
            }
        }

        let text_col = if is_modern {
            rgb(242, 242, 245)
        } else {
            rgb(0, 0, 0)
        };
        let muted_col = if is_modern {
            rgb(172, 178, 190)
        } else {
            rgb(48, 48, 48)
        };
        let accent_col = if is_modern {
            rgb(96, 205, 255)
        } else {
            rgb(0, 0, 128)
        };

        unsafe {
            SetBkMode(hdc, TRANSPARENT as i32);
            let old_f = SelectObject(hdc, self.current_font(true) as HGDIOBJ);

            // "On" / "Off" beside Power Switch
            let pr = self.layout.power_switch_hit;
            let mut r_on = RECT {
                left: pr.right + sc(6),
                top: pr.top + sc(4),
                right: self.layout.power_panel.right - sc(6),
                bottom: pr.top + sc(24),
            };
            let mut r_off = RECT {
                left: pr.right + sc(6),
                top: pr.top + sc(30),
                right: self.layout.power_panel.right - sc(6),
                bottom: pr.top + sc(52),
            };
            SetTextColor(
                hdc,
                if self.prefs.screen_saver_on {
                    accent_col
                } else {
                    muted_col
                },
            );
            let w_on = wide("On");
            DrawTextW(hdc, w_on.as_ptr(), -1, &mut r_on, DT_LEFT | DT_SINGLELINE);

            SetTextColor(
                hdc,
                if !self.prefs.screen_saver_on {
                    rgb(220, 60, 60)
                } else {
                    muted_col
                },
            );
            let w_off = wide("Off");
            DrawTextW(hdc, w_off.as_ptr(), -1, &mut r_off, DT_LEFT | DT_SINGLELINE);

            // Module credits inside bottom credits box (exact RES_CREDIT string)
            SelectObject(hdc, self.current_font(false) as HGDIOBJ);
            SetTextColor(hdc, text_col);
            let entry = self.selected_entry();
            let credit_text = entry.meta.credit.replace("\r\n", "\n");
            let w_cred = wide(&credit_text);
            let mut r_cred = RECT {
                left: self.layout.credits_panel.left + sc(10),
                top: self.layout.credits_panel.top + sc(8),
                right: self.layout.credits_panel.right - sc(78),
                bottom: self.layout.credits_panel.bottom - sc(6),
            };
            DrawTextW(
                hdc,
                w_cred.as_ptr(),
                -1,
                &mut r_cred,
                DT_LEFT | DT_WORDBREAK | DT_NOPREFIX,
            );

            // Status strip: Timeout, Hot Corners, Scale, Frame Rate
            SetTextColor(hdc, muted_col);
            let corners_txt = if self.prefs.no_corners {
                "Corners: Off".to_string()
            } else {
                format!(
                    "Sleep: {} | Never: {}",
                    self.prefs.sleep_corner.label(),
                    self.prefs.wake_corner.label()
                )
            };
            let fps_txt = match self.prefs.frame_rate_mode {
                FrameRateMode::AuthenticRetro => "Retro FPS",
                FrameRateMode::Smooth60Fps => "60 FPS",
                FrameRateMode::HighRefresh120Fps => "120 FPS",
            };
            let scale_txt = match self.prefs.scale_mode {
                ScaleMode::Auto => "Auto",
                ScaleMode::Scale1x => "1x",
                ScaleMode::Scale2x => "2x",
                ScaleMode::Scale3x => "3x",
                ScaleMode::Classic640x480 => "640x480 4:3",
                ScaleMode::CrtScanlines => "2x CRT",
            };
            let status_txt = format!(
                "Idle: {}m  |  {}  |  {} ({})",
                self.prefs.timeout_minutes, corners_txt, scale_txt, fps_txt,
            );
            let w_stat = wide(&status_txt);
            let mut r_stat = RECT {
                left: self.layout.status_panel.left + sc(10),
                top: self.layout.status_panel.top + sc(2),
                right: self.layout.status_panel.right - sc(86),
                bottom: self.layout.status_panel.bottom - sc(2),
            };
            DrawTextW(
                hdc,
                w_stat.as_ptr(),
                -1,
                &mut r_stat,
                DT_LEFT | DT_VCENTER | DT_SINGLELINE | DT_NOPREFIX,
            );

            SelectObject(hdc, old_f);
        }
    }

    fn on_monitor_tick(&mut self) {
        if self.session.is_some() {
            self.sleep_corner_since = None;
            return;
        }
        if !self.prefs.screen_saver_on {
            self.sleep_corner_since = None;
            return;
        }

        // 1. Hot Corners ("Sleep Now" / "Never Sleep")
        let in_wake = !self.prefs.no_corners && monitors::cursor_in_corner(self.prefs.wake_corner);
        let in_sleep =
            !self.prefs.no_corners && monitors::cursor_in_corner(self.prefs.sleep_corner);

        if in_sleep {
            let since = *self.sleep_corner_since.get_or_insert_with(Instant::now);
            if since.elapsed() >= Duration::from_millis(600) {
                self.sleep_corner_since = None;
                self.start_session(SaverMode::Saver);
                return;
            }
        } else {
            self.sleep_corner_since = None;
        }

        // 2. Global Idle Timeout (suppressed when cursor rests in Never Sleep corner)
        let idle_ms = monitors::idle_time_ms();
        let threshold_ms = self.prefs.timeout_minutes.saturating_mul(60_000);
        if idle_ms < 2000 {
            self.idle_triggered = false;
        } else if !in_wake && !self.idle_triggered && idle_ms >= threshold_ms {
            self.idle_triggered = true;
            self.start_session(SaverMode::Saver);
        }
    }
}

impl Drop for AppState {
    fn drop(&mut self) {
        self.stop_session();
        unsafe {
            if self.hotkey_registered {
                UnregisterHotKey(self.hwnd, HOTKEY_SLEEP_ID);
            }
            for f in [
                self.font_retro,
                self.font_retro_bold,
                self.font_modern,
                self.font_modern_bold,
            ] {
                if !f.is_null() {
                    DeleteObject(f as HGDIOBJ);
                }
            }
            for b in [
                self.brush_retro_bg,
                self.brush_retro_card,
                self.brush_modern_bg,
                self.brush_modern_card,
            ] {
                if !b.is_null() {
                    DeleteObject(b as HGDIOBJ);
                }
            }
            if !self.icon_big.is_null() {
                DestroyIcon(self.icon_big);
            }
            if !self.icon_small.is_null() {
                DestroyIcon(self.icon_small);
            }
        }
    }
}

fn resolve_data_dir() -> PathBuf {
    if let Ok(exe) = std::env::current_exe() {
        if let Some(dir) = exe.parent() {
            return dir.to_path_buf();
        }
    }
    std::env::current_dir().unwrap_or_else(|_| PathBuf::from("."))
}

fn create_ui_font(face: &str, px_height: i32, bold: bool) -> HFONT {
    let fw = wide(face);
    unsafe {
        CreateFontW(
            -px_height,
            0,
            0,
            0,
            if bold { 700 } else { 400 },
            0,
            0,
            0,
            1, // DEFAULT_CHARSET
            0,
            0,
            5, // CLEARTYPE_QUALITY
            0,
            fw.as_ptr(),
        )
    }
}

fn main() {
    unsafe {
        let _ = SetProcessDpiAwarenessContext(DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE_V2);
        let icc = INITCOMMONCONTROLSEX {
            dwSize: std::mem::size_of::<INITCOMMONCONTROLSEX>() as u32,
            dwICC: ICC_BAR_CLASSES | ICC_STANDARD_CLASSES,
        };
        InitCommonControlsEx(&icc);
    }

    let data_dir = resolve_data_dir();
    let prefs_path = data_dir.join("AD_PREFS.INI");
    let random_ads_path = data_dir.join("RANDOM.ADS");
    let plugin_dir = data_dir.join("modules");

    let mut prefs = AdPrefs::load_from_file(&prefs_path);
    if prefs.path.trim().is_empty() {
        prefs.path = data_dir.to_string_lossy().to_string();
    }
    // Exact 1991 README.TXT feature: holding Ctrl on launch starts After Dark in OFF state!
    if unsafe { (GetAsyncKeyState(VK_CONTROL as i32) as u16 & 0x8000) != 0 } {
        prefs.screen_saver_on = false;
    }

    let catalog = build_catalog(Some(&plugin_dir));
    let selected_idx = catalog
        .iter()
        .position(|e| {
            e.meta.name.eq_ignore_ascii_case(&prefs.module_name)
                || e.meta.filename.eq_ignore_ascii_case(&prefs.module_file)
        })
        .or_else(|| catalog.iter().position(|e| e.meta.id == "toasters"))
        .unwrap_or(0);

    // Load Randomizer pool from RANDOM.ADS if present, else include a classic default mix
    let mut randomizer_pool: Vec<String> = Vec::new();
    for entry in load_random_ads(&random_ads_path) {
        if let Some(found) = catalog.iter().find(|c| {
            c.meta.id != "randomizer"
                && (c.meta.name.eq_ignore_ascii_case(&entry.module_name)
                    || (!entry.filename.eq_ignore_ascii_case("AD.EXE")
                        && c.meta.filename.eq_ignore_ascii_case(&entry.filename)))
        }) {
            if !randomizer_pool.contains(&found.meta.id) {
                randomizer_pool.push(found.meta.id.clone());
            }
        }
    }
    if randomizer_pool.is_empty() {
        randomizer_pool = vec![
            "toasters".to_string(),
            "starry".to_string(),
            "clocks".to_string(),
            "nocturne".to_string(),
            "satori".to_string(),
            "mountain".to_string(),
            "stained".to_string(),
            "aqua".to_string(),
            "globe".to_string(),
            "warp".to_string(),
            "laser".to_string(),
            "sgyra".to_string(),
            "3dbounce".to_string(),
        ];
    }

    let hinst = unsafe { GetModuleHandleW(ptr::null()) };
    let cls = wide("AfterDark10aControlPanel");
    let icon_big = hicon_from_ico_bytes(ICO_AD, 32);
    let icon_small = hicon_from_ico_bytes(ICO_AD, 16);

    let wc = WNDCLASSW {
        style: CS_HREDRAW | CS_VREDRAW,
        lpfnWndProc: Some(main_wnd_proc),
        cbClsExtra: 0,
        cbWndExtra: 0,
        hInstance: hinst,
        hIcon: icon_big,
        hCursor: unsafe { LoadCursorW(ptr::null_mut(), IDC_ARROW) },
        hbrBackground: ptr::null_mut(),
        lpszMenuName: ptr::null(),
        lpszClassName: cls.as_ptr(),
    };
    unsafe {
        RegisterClassW(&wc);
    }

    let title = wide("After Dark 1.0a — Windows 11");
    let style = WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU | WS_MINIMIZEBOX | WS_CLIPCHILDREN;
    let hwnd = unsafe {
        CreateWindowExW(
            0,
            cls.as_ptr(),
            title.as_ptr(),
            style,
            120,
            90,
            540,
            580,
            ptr::null_mut(),
            ptr::null_mut(),
            hinst as HINSTANCE,
            ptr::null(),
        )
    };
    if hwnd.is_null() {
        return;
    }

    let dpi = unsafe { GetDpiForWindow(hwnd).max(96) };
    let dpi_scale = dpi as f32 / 96.0;
    let (client_w, client_h, layout) = LayoutRects::compute(dpi_scale);

    // Resize window so client area matches layout exactly
    unsafe {
        let mut rc = RECT {
            left: 0,
            top: 0,
            right: client_w,
            bottom: client_h,
        };
        windows_sys::Win32::UI::WindowsAndMessaging::AdjustWindowRect(&mut rc, style, 0);
        windows_sys::Win32::UI::WindowsAndMessaging::SetWindowPos(
            hwnd,
            ptr::null_mut(),
            0,
            0,
            rc.right - rc.left,
            rc.bottom - rc.top,
            windows_sys::Win32::UI::WindowsAndMessaging::SWP_NOMOVE
                | windows_sys::Win32::UI::WindowsAndMessaging::SWP_NOZORDER,
        );
        SendMessageW(hwnd, WM_SETICON, ICON_BIG as WPARAM, icon_big as LPARAM);
        SendMessageW(hwnd, WM_SETICON, ICON_SMALL as WPARAM, icon_small as LPARAM);
    }

    let sc = |v: i32| ((v as f32) * dpi_scale).round() as i32;
    let make_btn = |text: &str, x: i32, y: i32, w: i32, h: i32, id: i32| -> HWND {
        unsafe {
            CreateWindowExW(
                0,
                wide("BUTTON").as_ptr(),
                wide(text).as_ptr(),
                WS_CHILD | WS_VISIBLE | WS_TABSTOP | BS_PUSHBUTTON as u32,
                x,
                y,
                w,
                h,
                hwnd,
                id as isize as _,
                hinst,
                ptr::null(),
            )
        }
    };

    // Collection Filter ComboBox, Favorite Toggle Button, Live Search Box, and Module ListBox inside list_panel
    let hwnd_pack_filter = unsafe {
        let cb = CreateWindowExW(
            0,
            wide("COMBOBOX").as_ptr(),
            ptr::null(),
            WS_CHILD | WS_VISIBLE | WS_TABSTOP | CBS_DROPDOWNLIST as u32,
            layout.list_panel.left + sc(8),
            layout.list_panel.top + sc(8),
            (layout.list_panel.right - layout.list_panel.left) - sc(68),
            sc(180),
            hwnd,
            ID_COMBO_PACK as isize as _,
            hinst,
            ptr::null(),
        );
        for lbl in [
            "All Collections (77)",
            "Classic 1991 (37)",
            "The Simpsons (15)",
            "Star Trek: TNG (13)",
            "Looney Tunes (12)",
            "★ Favorites",
        ] {
            let lw = wide(lbl);
            SendMessageW(cb, CB_ADDSTRING, 0, lw.as_ptr() as LPARAM);
        }
        SendMessageW(cb, CB_SETCURSEL, 0, 0);
        cb
    };

    let hwnd_btn_fav = make_btn(
        "☆ Fav",
        layout.list_panel.right - sc(56),
        layout.list_panel.top + sc(8),
        sc(48),
        sc(23),
        ID_BTN_FAV,
    );

    let hwnd_search = unsafe {
        let ed = CreateWindowExW(
            0,
            wide("EDIT").as_ptr(),
            ptr::null(),
            WS_CHILD | WS_VISIBLE | WS_BORDER | WS_TABSTOP | ES_AUTOHSCROLL as u32,
            layout.list_panel.left + sc(8),
            layout.list_panel.top + sc(34),
            (layout.list_panel.right - layout.list_panel.left) - sc(16),
            sc(22),
            hwnd,
            ID_EDIT_SEARCH as isize as _,
            hinst,
            ptr::null(),
        );
        let cue = wide("Search 77 modules...");
        SendMessageW(ed, 0x1501, 0, cue.as_ptr() as LPARAM); // EM_SETCUEBANNER
        ed
    };

    let hwnd_list = unsafe {
        CreateWindowExW(
            0,
            wide("LISTBOX").as_ptr(),
            ptr::null(),
            WS_CHILD | WS_VISIBLE | WS_BORDER | WS_VSCROLL | WS_TABSTOP | LBS_NOTIFY as u32,
            layout.list_panel.left + sc(8),
            layout.list_panel.top + sc(60),
            (layout.list_panel.right - layout.list_panel.left) - sc(16),
            (layout.list_panel.bottom - layout.list_panel.top) - sc(68),
            hwnd,
            ID_LIST_MODULES as isize as _,
            hinst,
            ptr::null(),
        )
    };

    // "When..." button inside power_panel
    let hwnd_btn_when = make_btn(
        "&When / Setup...",
        layout.power_panel.left + sc(10),
        layout.power_panel.bottom - sc(32),
        (layout.power_panel.right - layout.power_panel.left) - sc(20),
        sc(24),
        ID_BTN_WHEN,
    );

    // Demo, Sleep Now, and Theme Toggle buttons inside demo_panel
    let demo_y = layout.demo_panel.top + sc(10);
    let demo_h = sc(28);
    let hwnd_btn_demo = make_btn(
        "&Demo",
        layout.demo_panel.left + sc(10),
        demo_y,
        sc(84),
        demo_h,
        ID_BTN_DEMO,
    );
    let hwnd_btn_sleep = make_btn(
        "&Sleep Now",
        layout.demo_panel.left + sc(100),
        demo_y,
        sc(88),
        demo_h,
        ID_BTN_SLEEP,
    );
    let hwnd_btn_theme = make_btn(
        "Win 11 UI",
        layout.demo_panel.left + sc(194),
        demo_y,
        sc(82),
        demo_h,
        ID_BTN_THEME,
    );

    // Info button inside credits_panel
    let hwnd_btn_about = make_btn(
        "Info...",
        layout.credits_panel.right - sc(70),
        layout.credits_panel.top + sc(14),
        sc(60),
        sc(28),
        ID_BTN_ABOUT,
    );

    // Tray button inside status_panel
    let hwnd_btn_tray = make_btn(
        "To Tray",
        layout.status_panel.right - sc(78),
        layout.status_panel.top + sc(5),
        sc(70),
        sc(24),
        ID_BTN_TRAY,
    );

    let sound = AdSound::new();
    sound.set_volumes(prefs.sfx_volume, prefs.midi_volume);
    let filtered_indices: Vec<usize> = (0..catalog.len()).collect();

    let mut state = Box::new(AppState {
        hwnd,
        dpi_scale,
        layout,
        data_dir,
        prefs_path,
        random_ads_path,
        prefs: prefs.clone(),
        catalog,
        filtered_indices,
        pack_filter_idx: 0,
        search_query: String::new(),
        selected_idx,
        randomizer_pool,
        art: HostArt::load(),
        sound,
        tray: Some(TrayIcon::new(hwnd, prefs.screen_saver_on)),
        session: None,
        sleep_corner_since: None,
        idle_triggered: false,
        force_exit: false,
        hotkey_registered: false,
        font_retro: create_ui_font("MS Sans Serif", sc(13), false),
        font_retro_bold: create_ui_font("MS Sans Serif", sc(13), true),
        font_modern: create_ui_font("Segoe UI", sc(14), false),
        font_modern_bold: create_ui_font("Segoe UI", sc(14), true),
        brush_retro_bg: unsafe { CreateSolidBrush(rgb(192, 192, 192)) },
        brush_retro_card: unsafe { CreateSolidBrush(rgb(192, 192, 192)) },
        brush_modern_bg: unsafe { CreateSolidBrush(rgb(28, 28, 30)) },
        brush_modern_card: unsafe { CreateSolidBrush(rgb(42, 42, 46)) },
        icon_big,
        icon_small,
        hwnd_pack_filter,
        hwnd_search,
        hwnd_btn_fav,
        hwnd_list,
        hwnd_btn_when,
        hwnd_btn_demo,
        hwnd_btn_sleep,
        hwnd_btn_theme,
        hwnd_btn_about,
        hwnd_btn_tray,
        slots: Default::default(),
    });

    state.refresh_filtered_list();
    state.rebuild_module_controls();
    state.apply_window_theme();
    state.sync_hotkey();

    let raw_ptr = &mut *state as *mut AppState;
    unsafe {
        SetWindowLongPtrW(hwnd, GWLP_USERDATA, raw_ptr as isize);
        SetTimer(hwnd, TIMER_MONITOR, 200, None);
    }

    // Check CLI flags: --sleep starts straight into screensaver; --tray starts minimized to tray
    let args: Vec<String> = std::env::args().collect();
    if args.iter().any(|a| a.eq_ignore_ascii_case("--sleep")) {
        state.start_session(SaverMode::Saver);
    } else if !args.iter().any(|a| a.eq_ignore_ascii_case("--tray")) {
        unsafe {
            ShowWindow(hwnd, SW_SHOW);
        }
    }

    unsafe {
        let mut msg: MSG = std::mem::zeroed();
        while GetMessageW(&mut msg, ptr::null_mut(), 0, 0) > 0 {
            TranslateMessage(&msg);
            DispatchMessageW(&msg);
        }
        KillTimer(hwnd, TIMER_MONITOR);
        SetWindowLongPtrW(hwnd, GWLP_USERDATA, 0);
    }

    state.save_all();
}

unsafe extern "system" fn main_wnd_proc(
    hwnd: HWND,
    msg: u32,
    wparam: WPARAM,
    lparam: LPARAM,
) -> LRESULT {
    let ptr = unsafe { GetWindowLongPtrW(hwnd, GWLP_USERDATA) } as *mut AppState;
    if ptr.is_null() {
        return unsafe { DefWindowProcW(hwnd, msg, wparam, lparam) };
    }
    let st = unsafe { &mut *ptr };

    match msg {
        WM_PAINT => unsafe {
            let mut ps: PAINTSTRUCT = std::mem::zeroed();
            let hdc = BeginPaint(hwnd, &mut ps);
            st.paint_ui(hdc);
            EndPaint(hwnd, &ps);
            0
        },
        WM_CTLCOLORSTATIC | WM_CTLCOLORBTN => unsafe {
            let hdc = wparam as HDC;
            if st.prefs.ui_theme == UiTheme::ModernWin11 {
                SetTextColor(hdc, rgb(242, 242, 245));
                SetBkColor(hdc, rgb(42, 42, 46));
                st.brush_modern_card as LRESULT
            } else {
                SetTextColor(hdc, rgb(0, 0, 0));
                SetBkColor(hdc, rgb(192, 192, 192));
                st.brush_retro_card as LRESULT
            }
        },
        WM_CTLCOLORLISTBOX => unsafe {
            let hdc = wparam as HDC;
            if st.prefs.ui_theme == UiTheme::ModernWin11 {
                SetTextColor(hdc, rgb(242, 242, 245));
                SetBkColor(hdc, rgb(32, 32, 36));
                st.brush_modern_bg as LRESULT
            } else {
                DefWindowProcW(hwnd, msg, wparam, lparam)
            }
        },
        WM_LBUTTONUP => {
            let x = (lparam & 0xFFFF) as i16 as i32;
            let y = ((lparam >> 16) & 0xFFFF) as i16 as i32;
            let pt = POINT { x, y };
            let in_rect = |r: RECT| pt.x >= r.left && pt.x <= r.right && pt.y >= r.top && pt.y <= r.bottom;

            // Clicking the Power Switch or "On"/"Off" area toggles ScreenSaverOn
            let power_toggle_rect = RECT {
                left: st.layout.power_panel.left,
                top: st.layout.power_panel.top,
                right: st.layout.power_panel.right,
                bottom: st.layout.power_switch_hit.bottom + 8,
            };
            if in_rect(power_toggle_rect) {
                st.prefs.screen_saver_on = !st.prefs.screen_saver_on;
                if let Some(tray) = st.tray.as_ref() {
                    tray.update_state(st.prefs.screen_saver_on);
                }
                st.save_all();
                unsafe {
                    InvalidateRect(hwnd, &st.layout.power_panel, 1);
                }
                return 0;
            }
            // Clicking the Credits box shows the module About dialog (matching 1991 MORECREDITWNDPROC)
            if in_rect(st.layout.credits_panel) {
                let entry = st.selected_entry().clone();
                setup_dlg::show_about_module(hwnd, &entry.meta.name, &entry.meta.about);
                return 0;
            }
            0
        }
        WM_HSCROLL => {
            let src_hwnd = lparam as HWND;
            for slot_idx in 0..4 {
                if st.slots[slot_idx].widget == src_hwnd {
                    let pos = unsafe { SendMessageW(src_hwnd, TBM_GETPOS, 0, 0) } as i32;
                    st.on_control_value_changed(slot_idx, pos.clamp(0, 100));
                    break;
                }
            }
            0
        }
        WM_COMMAND => {
            let id = (wparam & 0xFFFF) as i32;
            let code = ((wparam >> 16) & 0xFFFF) as u32;

            // Dynamic module controls (slots 0..3)
            if (ID_CTRL_BASE..ID_CTRL_BASE + 4).contains(&id) {
                let slot_idx = (id - ID_CTRL_BASE) as usize;
                let entry = st.selected_entry().clone();
                match &entry.meta.controls[slot_idx] {
                    AdControl::Menu { .. } if code == CBN_SELCHANGE => {
                        let sel =
                            unsafe { SendMessageW(st.slots[slot_idx].widget, CB_GETCURSEL, 0, 0) }
                                as i32;
                        if sel >= 0 {
                            st.on_control_value_changed(slot_idx, sel);
                        }
                    }
                    AdControl::Checkbox { .. } => {
                        let checked =
                            unsafe { SendMessageW(st.slots[slot_idx].widget, BM_GETCHECK, 0, 0) }
                                == BST_CHECKED as isize;
                        st.on_control_value_changed(slot_idx, i32::from(checked));
                    }
                    AdControl::Button { .. } => {
                        let mut restart_demo = false;
                        match entry.meta.id.as_str() {
                            "randomizer" => {
                                if let Some(new_pool) = setup_dlg::show_randomizer_choose_dialog(
                                    hwnd,
                                    &st.catalog,
                                    &st.randomizer_pool,
                                    &st.prefs.favorites,
                                ) {
                                    st.randomizer_pool = new_pool;
                                    st.save_all();
                                    restart_demo = true;
                                }
                            }
                            "logo" => {
                                if let Some(path) = setup_dlg::pick_bmp_file(
                                    hwnd,
                                    "Logo — Select Picture (.BMP)",
                                    &st.prefs.logo_file,
                                ) {
                                    st.prefs.logo_file = path;
                                    st.save_all();
                                    restart_demo = true;
                                }
                            }
                            "globe" => {
                                if let Some(path) = setup_dlg::pick_bmp_file(
                                    hwnd,
                                    "Globe — Select World Map (.BMP)",
                                    &st.prefs.globe_file,
                                ) {
                                    st.prefs.globe_file = path;
                                    st.save_all();
                                    restart_demo = true;
                                }
                            }
                            "slidesho" => {
                                if let Some(dir) = setup_dlg::pick_folder(
                                    hwnd,
                                    "Slide Show — Select Folder of .BMP Pictures",
                                ) {
                                    st.prefs.slide_show_dir = dir;
                                    st.save_all();
                                    restart_demo = true;
                                }
                            }
                            "message" => {
                                if setup_dlg::show_messages_editor_dialog(hwnd, &st.data_dir) {
                                    restart_demo = true;
                                }
                            }
                            "grafstat" => {
                                if setup_dlg::show_grafstat_editor_dialog(hwnd, &st.data_dir) {
                                    restart_demo = true;
                                }
                            }
                            _ => {}
                        }
                        if restart_demo
                            && st
                                .session
                                .as_ref()
                                .map(|s| s.mode() == SaverMode::Demo)
                                .unwrap_or(false)
                        {
                            st.start_session(SaverMode::Demo);
                        }
                    }
                    _ => {}
                }
                return 0;
            }

            match id as usize {
                x if x == ID_COMBO_PACK as usize => {
                    if code == CBN_SELCHANGE {
                        let sel =
                            unsafe { SendMessageW(st.hwnd_pack_filter, CB_GETCURSEL, 0, 0) } as i32;
                        if sel >= 0 {
                            st.pack_filter_idx = sel;
                            st.refresh_filtered_list();
                        }
                    }
                }
                x if x == ID_EDIT_SEARCH as usize => {
                    if code == EN_CHANGE {
                        let mut buf = [0u16; 128];
                        let len = unsafe {
                            GetWindowTextW(st.hwnd_search, buf.as_mut_ptr(), buf.len() as i32)
                        };
                        st.search_query = if len > 0 {
                            String::from_utf16_lossy(&buf[..len as usize])
                        } else {
                            String::new()
                        };
                        st.refresh_filtered_list();
                    }
                }
                x if x == ID_BTN_FAV as usize => {
                    let cur_id = st.selected_entry().meta.id.clone();
                    if let Some(pos) = st.prefs.favorites.iter().position(|f| *f == cur_id) {
                        st.prefs.favorites.remove(pos);
                    } else {
                        st.prefs.favorites.push(cur_id);
                    }
                    st.save_all();
                    st.refresh_filtered_list();
                }
                x if x == ID_LIST_MODULES as usize => {
                    if code == LBN_SELCHANGE || code == LBN_DBLCLK {
                        let sel = unsafe { SendMessageW(st.hwnd_list, LB_GETCURSEL, 0, 0) } as i32;
                        if sel >= 0 && (sel as usize) < st.filtered_indices.len() {
                            let cat_idx = st.filtered_indices[sel as usize];
                            if cat_idx < st.catalog.len() {
                                st.selected_idx = cat_idx;
                                let entry = st.selected_entry().clone();
                                st.prefs.module_name = entry.meta.name.clone();
                                st.prefs.module_file = entry.meta.filename.clone();
                                st.rebuild_module_controls();
                                st.save_all();
                                if code == LBN_DBLCLK {
                                    st.start_session(SaverMode::Demo);
                                } else if st
                                    .session
                                    .as_ref()
                                    .map(|s| s.mode() == SaverMode::Demo)
                                    .unwrap_or(false)
                                {
                                    st.start_session(SaverMode::Demo);
                                }
                            }
                        }
                    }
                }
                x if x == ID_BTN_DEMO as usize || x == CMD_TRAY_DEMO => {
                    let is_demo = st
                        .session
                        .as_ref()
                        .map(|s| s.mode() == SaverMode::Demo)
                        .unwrap_or(false);
                    if is_demo {
                        st.stop_session();
                    } else {
                        st.start_session(SaverMode::Demo);
                    }
                }
                x if x == ID_BTN_SLEEP as usize || x == CMD_TRAY_SLEEP_NOW => {
                    st.start_session(SaverMode::Saver);
                }
                x if x == ID_BTN_WHEN as usize => {
                    if setup_dlg::show_setup_dialog(hwnd, &mut st.prefs, &st.sound) {
                        st.sound
                            .set_volumes(st.prefs.sfx_volume, st.prefs.midi_volume);
                        st.apply_window_theme();
                        st.sync_hotkey();
                        st.save_all();
                    }
                }
                x if x == ID_BTN_THEME as usize || x == CMD_TRAY_TOGGLE_THEME => {
                    st.prefs.ui_theme = match st.prefs.ui_theme {
                        UiTheme::RetroWin31 => UiTheme::ModernWin11,
                        UiTheme::ModernWin11 => UiTheme::RetroWin31,
                    };
                    st.apply_window_theme();
                    st.save_all();
                }
                x if x == ID_BTN_ABOUT as usize => {
                    let entry = st.selected_entry().clone();
                    setup_dlg::show_about_module(hwnd, &entry.meta.name, &entry.meta.about);
                }
                x if x == ID_BTN_TRAY as usize => {
                    st.stop_session();
                    unsafe {
                        ShowWindow(hwnd, SW_HIDE);
                    }
                }
                CMD_TRAY_OPEN => unsafe {
                    ShowWindow(hwnd, SW_RESTORE);
                    ShowWindow(hwnd, SW_SHOW);
                    SetForegroundWindow(hwnd);
                },
                CMD_TRAY_TOGGLE_ON => {
                    st.prefs.screen_saver_on = !st.prefs.screen_saver_on;
                    if let Some(tray) = st.tray.as_ref() {
                        tray.update_state(st.prefs.screen_saver_on);
                    }
                    st.save_all();
                    unsafe {
                        InvalidateRect(hwnd, &st.layout.power_panel, 1);
                    }
                }
                CMD_TRAY_EXIT => {
                    st.force_exit = true;
                    st.stop_session();
                    unsafe {
                        DestroyWindow(hwnd);
                    }
                }
                _ => {}
            }
            0
        }
        WM_HOTKEY => {
            if wparam as i32 == HOTKEY_SLEEP_ID {
                st.start_session(SaverMode::Saver);
            }
            0
        }
        WM_TIMER if wparam == TIMER_MONITOR => {
            st.on_monitor_tick();
            0
        }
        WM_SAVER_STOPPED => {
            st.stop_session();
            0
        }
        WM_TRAYICON => {
            let ev = (lparam & 0xFFFF) as u32;
            if ev == WM_LBUTTONUP {
                unsafe {
                    ShowWindow(hwnd, SW_RESTORE);
                    ShowWindow(hwnd, SW_SHOW);
                    SetForegroundWindow(hwnd);
                }
            } else if ev == WM_RBUTTONUP {
                if let Some(tray) = st.tray.as_ref() {
                    tray.show_context_menu(
                        st.prefs.screen_saver_on,
                        st.prefs.ui_theme == UiTheme::ModernWin11,
                    );
                }
            }
            0
        }
        WM_SIZE => {
            if wparam == SIZE_MINIMIZED as WPARAM {
                st.stop_session();
                unsafe {
                    ShowWindow(hwnd, SW_HIDE);
                }
            }
            0
        }
        WM_CLOSE => {
            if st.force_exit {
                unsafe {
                    DestroyWindow(hwnd);
                }
            } else {
                // Close button hides to System Tray like 1991 After Dark; exit via Tray -> Exit After Dark
                st.stop_session();
                unsafe {
                    ShowWindow(hwnd, SW_HIDE);
                }
            }
            0
        }
        WM_DESTROY => unsafe {
            PostQuitMessage(0);
            0
        },
        _ => unsafe { DefWindowProcW(hwnd, msg, wparam, lparam) },
    }
}
