//! Native Win32 Setup ("When"), Randomizer "Choose..", Messages/GraphStat Editors,
//! Bitmap/Folder Pickers, and Module About dialogs.

use std::path::Path;
use std::ptr;

use ad_modules::grafstat::GraphStatModule;
use ad_modules::message::{
    MESSAGE_SLOT_COUNT, MessageRecord, load_messages_ads, serialize_messages_ads,
};
use ad_modules::ModuleCatalogEntry;
use ad_sdk::prefs::{
    AdPrefs, FrameRateMode, MultiMonitorMode, ScaleMode, ScreenCorner, UiTheme,
};
use ad_sdk::sound::AdSound;
use windows_sys::Win32::Foundation::{HWND, LPARAM, LRESULT, MAX_PATH, WPARAM};
use windows_sys::Win32::Graphics::Gdi::{
    COLOR_BTNFACE, DEFAULT_GUI_FONT, GetStockObject, HBRUSH,
};
use windows_sys::Win32::System::Com::CoTaskMemFree;
use windows_sys::Win32::System::LibraryLoader::GetModuleHandleW;
use windows_sys::Win32::UI::Controls::Dialogs::{
    GetOpenFileNameW, OFN_FILEMUSTEXIST, OFN_HIDEREADONLY, OFN_NOCHANGEDIR, OFN_PATHMUSTEXIST,
    OPENFILENAMEW,
};
use windows_sys::Win32::UI::Input::KeyboardAndMouse::EnableWindow;
use windows_sys::Win32::UI::Shell::{
    BIF_NEWDIALOGSTYLE, BIF_RETURNONLYFSDIRS, BROWSEINFOW, SHBrowseForFolderW,
    SHGetPathFromIDListW,
};
use windows_sys::Win32::UI::WindowsAndMessaging::{
    BM_GETCHECK, BM_SETCHECK, BS_AUTOCHECKBOX, BS_DEFPUSHBUTTON, BS_PUSHBUTTON, CB_ADDSTRING,
    CB_GETCURSEL, CB_SETCURSEL, CBN_SELCHANGE, CBS_DROPDOWNLIST, CreateWindowExW, DefWindowProcW,
    DestroyWindow, DispatchMessageW, ES_AUTOHSCROLL, ES_AUTOVSCROLL, ES_MULTILINE, ES_NUMBER,
    ES_WANTRETURN, GetMessageW, GetWindowLongPtrW, GetWindowTextLengthW, GetWindowTextW,
    GWLP_USERDATA, IDC_ARROW, IsWindow, LB_ADDSTRING, LB_GETCOUNT, LB_GETSEL, LB_SETSEL,
    LBS_MULTIPLESEL, LBS_NOINTEGRALHEIGHT, LoadCursorW, MB_ICONINFORMATION, MB_OK, MessageBoxW,
    MSG, RegisterClassW, SW_SHOW, SendMessageW, SetWindowLongPtrW, SetWindowTextW, ShowWindow,
    TranslateMessage, WM_CLOSE, WM_COMMAND, WM_SETFONT, WNDCLASSW, WS_BORDER, WS_CAPTION, WS_CHILD,
    WS_EX_DLGMODALFRAME, WS_HSCROLL, WS_POPUP, WS_SYSMENU, WS_TABSTOP, WS_VISIBLE, WS_VSCROLL,
};
const BST_UNCHECKED: u32 = 0;
const BST_CHECKED: u32 = 1;

fn wide(s: &str) -> Vec<u16> {
    let mut v: Vec<u16> = s.encode_utf16().collect();
    v.push(0);
    v
}

pub fn show_about_module(owner: HWND, title: &str, text: &str) {
    let t = wide(&format!("About {}", title));
    let body = wide(text);
    unsafe {
        MessageBoxW(owner, body.as_ptr(), t.as_ptr(), MB_OK | MB_ICONINFORMATION);
    }
}

// ============================================================================
// Setup ("When & Display") Modal Dialog
// ============================================================================

const ID_OK: i32 = 1;
const ID_CANCEL: i32 = 2;
const ID_TIMEOUT: i32 = 101;
const ID_CORNERS_ON: i32 = 102;
const ID_SLEEP_CORNER: i32 = 103;
const ID_WAKE_CORNER: i32 = 104;
const ID_HOTKEY_ON: i32 = 105;
const ID_SCALE_MODE: i32 = 106;
const ID_MULTIMON: i32 = 107;
const ID_SOUND_ON: i32 = 108;
const ID_FPS_MODE: i32 = 109;
const ID_THEME_MODE: i32 = 110;
const ID_SFX_VOL: i32 = 111;
const ID_MIDI_VOL: i32 = 112;
const ID_TEST_AUDIO: i32 = 113;

struct SetupDialogState {
    prefs: AdPrefs,
    sound: AdSound,
    accepted: bool,
    done: bool,
    hwnd_timeout: HWND,
    hwnd_corners_on: HWND,
    hwnd_sleep_corner: HWND,
    hwnd_wake_corner: HWND,
    hwnd_hotkey_on: HWND,
    hwnd_scale: HWND,
    hwnd_multimon: HWND,
    hwnd_fps: HWND,
    hwnd_sound: HWND,
    hwnd_sfx_vol: HWND,
    hwnd_midi_vol: HWND,
    hwnd_theme: HWND,
}

pub fn show_setup_dialog(owner: HWND, prefs: &mut AdPrefs, sound: &AdSound) -> bool {
    register_modal_class("AfterDarkSetupDlgClass", setup_dlg_proc);

    let mut state = Box::new(SetupDialogState {
        prefs: prefs.clone(),
        sound: sound.clone(),
        accepted: false,
        done: false,
        hwnd_timeout: ptr::null_mut(),
        hwnd_corners_on: ptr::null_mut(),
        hwnd_sleep_corner: ptr::null_mut(),
        hwnd_wake_corner: ptr::null_mut(),
        hwnd_hotkey_on: ptr::null_mut(),
        hwnd_scale: ptr::null_mut(),
        hwnd_multimon: ptr::null_mut(),
        hwnd_fps: ptr::null_mut(),
        hwnd_sound: ptr::null_mut(),
        hwnd_sfx_vol: ptr::null_mut(),
        hwnd_midi_vol: ptr::null_mut(),
        hwnd_theme: ptr::null_mut(),
    });

    let hinst = unsafe { GetModuleHandleW(ptr::null()) };
    let cls = wide("AfterDarkSetupDlgClass");
    let title = wide("After Dark Setup — When, Display & Audio Mixer");
    let hwnd = unsafe {
        CreateWindowExW(
            WS_EX_DLGMODALFRAME,
            cls.as_ptr(),
            title.as_ptr(),
            WS_POPUP | WS_CAPTION | WS_SYSMENU | WS_VISIBLE,
            190,
            110,
            456,
            516,
            owner,
            ptr::null_mut(),
            hinst,
            ptr::null(),
        )
    };
    if hwnd.is_null() {
        return false;
    }

    let font = unsafe { GetStockObject(DEFAULT_GUI_FONT) };
    let make_ctrl = |class: &str, text: &str, style: u32, ex: u32, x: i32, y: i32, w: i32, h: i32, id: i32| -> HWND {
        let cw = wide(class);
        let tw = wide(text);
        let ch = unsafe {
            CreateWindowExW(
                ex,
                cw.as_ptr(),
                tw.as_ptr(),
                WS_CHILD | WS_VISIBLE | style,
                x,
                y,
                w,
                h,
                hwnd,
                id as isize as _,
                hinst,
                ptr::null(),
            )
        };
        unsafe {
            SendMessageW(ch, WM_SETFONT, font as WPARAM, 1);
        }
        ch
    };

    let mut y = 14;
    make_ctrl("STATIC", "Idle Timeout (minutes):", 0, 0, 16, y + 3, 180, 20, 0);
    state.hwnd_timeout = make_ctrl(
        "EDIT",
        &prefs.timeout_minutes.to_string(),
        WS_BORDER | WS_TABSTOP | ES_NUMBER as u32,
        0,
        214,
        y,
        70,
        22,
        ID_TIMEOUT,
    );
    y += 30;

    state.hwnd_corners_on = make_ctrl(
        "BUTTON",
        "Enable Hot Corners (Sleep Now / Never Sleep)",
        BS_AUTOCHECKBOX as u32 | WS_TABSTOP,
        0,
        16,
        y,
        380,
        22,
        ID_CORNERS_ON,
    );
    unsafe {
        SendMessageW(
            state.hwnd_corners_on,
            BM_SETCHECK,
            if !prefs.no_corners { BST_CHECKED } else { BST_UNCHECKED } as WPARAM,
            0,
        );
    }
    y += 26;

    let corners = ["Top Left", "Top Right", "Bottom Left", "Bottom Right"];
    make_ctrl("STATIC", "Sleep Now Corner:", 0, 0, 32, y + 4, 160, 20, 0);
    state.hwnd_sleep_corner = make_ctrl(
        "COMBOBOX",
        "",
        CBS_DROPDOWNLIST as u32 | WS_TABSTOP,
        0,
        214,
        y,
        210,
        120,
        ID_SLEEP_CORNER,
    );
    for c in corners {
        let cw = wide(c);
        unsafe {
            SendMessageW(state.hwnd_sleep_corner, CB_ADDSTRING, 0, cw.as_ptr() as LPARAM);
        }
    }
    unsafe {
        SendMessageW(
            state.hwnd_sleep_corner,
            CB_SETCURSEL,
            prefs.sleep_corner as WPARAM,
            0,
        );
    }
    y += 28;

    make_ctrl("STATIC", "Never Sleep Corner:", 0, 0, 32, y + 4, 160, 20, 0);
    state.hwnd_wake_corner = make_ctrl(
        "COMBOBOX",
        "",
        CBS_DROPDOWNLIST as u32 | WS_TABSTOP,
        0,
        214,
        y,
        210,
        120,
        ID_WAKE_CORNER,
    );
    for c in corners {
        let cw = wide(c);
        unsafe {
            SendMessageW(state.hwnd_wake_corner, CB_ADDSTRING, 0, cw.as_ptr() as LPARAM);
        }
    }
    unsafe {
        SendMessageW(
            state.hwnd_wake_corner,
            CB_SETCURSEL,
            prefs.wake_corner as WPARAM,
            0,
        );
    }
    y += 30;

    state.hwnd_hotkey_on = make_ctrl(
        "BUTTON",
        "Enable Global Sleep Hotkey (Ctrl + Shift + S)",
        BS_AUTOCHECKBOX as u32 | WS_TABSTOP,
        0,
        16,
        y,
        380,
        22,
        ID_HOTKEY_ON,
    );
    unsafe {
        SendMessageW(
            state.hwnd_hotkey_on,
            BM_SETCHECK,
            if prefs.hotkey_enabled { BST_CHECKED } else { BST_UNCHECKED } as WPARAM,
            0,
        );
    }
    y += 30;

    make_ctrl("STATIC", "Frame Rate & Smoothness:", 0, 0, 16, y + 4, 185, 20, 0);
    state.hwnd_fps = make_ctrl(
        "COMBOBOX",
        "",
        CBS_DROPDOWNLIST as u32 | WS_TABSTOP,
        0,
        214,
        y,
        210,
        120,
        ID_FPS_MODE,
    );
    for label in [
        FrameRateMode::AuthenticRetro.label(),
        FrameRateMode::Smooth60Fps.label(),
        FrameRateMode::HighRefresh120Fps.label(),
    ] {
        let lw = wide(label);
        unsafe {
            SendMessageW(state.hwnd_fps, CB_ADDSTRING, 0, lw.as_ptr() as LPARAM);
        }
    }
    let fps_idx = match prefs.frame_rate_mode {
        FrameRateMode::AuthenticRetro => 0,
        FrameRateMode::Smooth60Fps => 1,
        FrameRateMode::HighRefresh120Fps => 2,
    };
    unsafe {
        SendMessageW(state.hwnd_fps, CB_SETCURSEL, fps_idx, 0);
    }
    y += 28;

    make_ctrl("STATIC", "Display Scale & Filter:", 0, 0, 16, y + 4, 185, 20, 0);
    state.hwnd_scale = make_ctrl(
        "COMBOBOX",
        "",
        CBS_DROPDOWNLIST as u32 | WS_TABSTOP,
        0,
        214,
        y,
        210,
        160,
        ID_SCALE_MODE,
    );
    for label in [
        ScaleMode::Auto.label(),
        ScaleMode::Scale1x.label(),
        ScaleMode::Scale2x.label(),
        ScaleMode::Scale3x.label(),
        ScaleMode::Classic640x480.label(),
        ScaleMode::CrtScanlines.label(),
    ] {
        let lw = wide(label);
        unsafe {
            SendMessageW(state.hwnd_scale, CB_ADDSTRING, 0, lw.as_ptr() as LPARAM);
        }
    }
    let scale_idx = match prefs.scale_mode {
        ScaleMode::Auto => 0,
        ScaleMode::Scale1x => 1,
        ScaleMode::Scale2x => 2,
        ScaleMode::Scale3x => 3,
        ScaleMode::Classic640x480 => 4,
        ScaleMode::CrtScanlines => 5,
    };
    unsafe {
        SendMessageW(state.hwnd_scale, CB_SETCURSEL, scale_idx, 0);
    }
    y += 28;

    make_ctrl("STATIC", "Multi-Monitor Mode:", 0, 0, 16, y + 4, 185, 20, 0);
    state.hwnd_multimon = make_ctrl(
        "COMBOBOX",
        "",
        CBS_DROPDOWNLIST as u32 | WS_TABSTOP,
        0,
        214,
        y,
        210,
        140,
        ID_MULTIMON,
    );
    for label in [
        MultiMonitorMode::PerMonitor.label(),
        MultiMonitorMode::DifferentPerMonitor.label(),
        MultiMonitorMode::Spanned.label(),
        MultiMonitorMode::PrimaryOnly.label(),
    ] {
        let lw = wide(label);
        unsafe {
            SendMessageW(state.hwnd_multimon, CB_ADDSTRING, 0, lw.as_ptr() as LPARAM);
        }
    }
    let mm_idx = match prefs.multi_monitor {
        MultiMonitorMode::PerMonitor => 0,
        MultiMonitorMode::DifferentPerMonitor => 1,
        MultiMonitorMode::Spanned => 2,
        MultiMonitorMode::PrimaryOnly => 3,
    };
    unsafe {
        SendMessageW(state.hwnd_multimon, CB_SETCURSEL, mm_idx, 0);
    }
    y += 28;

    make_ctrl("STATIC", "Control Panel UI Style:", 0, 0, 16, y + 4, 185, 20, 0);
    state.hwnd_theme = make_ctrl(
        "COMBOBOX",
        "",
        CBS_DROPDOWNLIST as u32 | WS_TABSTOP,
        0,
        214,
        y,
        210,
        100,
        ID_THEME_MODE,
    );
    for label in ["Retro Windows 3.1 (Default)", "Modern Windows 11 (Dark)"] {
        let lw = wide(label);
        unsafe {
            SendMessageW(state.hwnd_theme, CB_ADDSTRING, 0, lw.as_ptr() as LPARAM);
        }
    }
    unsafe {
        SendMessageW(
            state.hwnd_theme,
            CB_SETCURSEL,
            if prefs.ui_theme == UiTheme::ModernWin11 { 1 } else { 0 },
            0,
        );
    }
    y += 30;

    state.hwnd_sound = make_ctrl(
        "BUTTON",
        "Enable Audio (Digitized Voices, SFX & MIDI Music)",
        BS_AUTOCHECKBOX as u32 | WS_TABSTOP,
        0,
        16,
        y,
        380,
        22,
        ID_SOUND_ON,
    );
    unsafe {
        SendMessageW(
            state.hwnd_sound,
            BM_SETCHECK,
            if prefs.sound_enabled { BST_CHECKED } else { BST_UNCHECKED } as WPARAM,
            0,
        );
    }
    y += 28;

    make_ctrl("STATIC", "Voice / SFX Volume (0-100%):", 0, 0, 16, y + 3, 185, 20, 0);
    state.hwnd_sfx_vol = make_ctrl(
        "EDIT",
        &prefs.sfx_volume.to_string(),
        WS_BORDER | WS_TABSTOP | ES_NUMBER as u32,
        0,
        214,
        y,
        64,
        22,
        ID_SFX_VOL,
    );
    make_ctrl(
        "BUTTON",
        "Test Audio",
        BS_PUSHBUTTON as u32 | WS_TABSTOP,
        0,
        310,
        y - 1,
        114,
        24,
        ID_TEST_AUDIO,
    );
    y += 28;

    make_ctrl("STATIC", "MIDI Music Volume (0-100%):", 0, 0, 16, y + 3, 185, 20, 0);
    state.hwnd_midi_vol = make_ctrl(
        "EDIT",
        &prefs.midi_volume.to_string(),
        WS_BORDER | WS_TABSTOP | ES_NUMBER as u32,
        0,
        214,
        y,
        64,
        22,
        ID_MIDI_VOL,
    );
    y += 36;

    make_ctrl(
        "BUTTON",
        "OK",
        BS_DEFPUSHBUTTON as u32 | WS_TABSTOP,
        0,
        244,
        y,
        84,
        26,
        ID_OK,
    );
    make_ctrl(
        "BUTTON",
        "Cancel",
        BS_PUSHBUTTON as u32 | WS_TABSTOP,
        0,
        340,
        y,
        84,
        26,
        ID_CANCEL,
    );

    let raw_ptr = &mut *state as *mut SetupDialogState;
    unsafe {
        SetWindowLongPtrW(hwnd, GWLP_USERDATA, raw_ptr as isize);
        EnableWindow(owner, 0);
        ShowWindow(hwnd, SW_SHOW);
        let mut msg: MSG = std::mem::zeroed();
        while !state.done && IsWindow(hwnd) != 0 && GetMessageW(&mut msg, ptr::null_mut(), 0, 0) > 0
        {
            TranslateMessage(&msg);
            DispatchMessageW(&msg);
        }
        EnableWindow(owner, 1);
        if IsWindow(hwnd) != 0 {
            SetWindowLongPtrW(hwnd, GWLP_USERDATA, 0);
            DestroyWindow(hwnd);
        }
    }

    if state.accepted {
        *prefs = state.prefs;
        sound.set_volumes(prefs.sfx_volume, prefs.midi_volume);
        true
    } else {
        false
    }
}

unsafe extern "system" fn setup_dlg_proc(
    hwnd: HWND,
    msg: u32,
    wparam: WPARAM,
    lparam: LPARAM,
) -> LRESULT {
    let ptr = unsafe { GetWindowLongPtrW(hwnd, GWLP_USERDATA) } as *mut SetupDialogState;
    if ptr.is_null() {
        return unsafe { DefWindowProcW(hwnd, msg, wparam, lparam) };
    }
    let st = unsafe { &mut *ptr };
    match msg {
        WM_COMMAND => {
            let id = (wparam & 0xFFFF) as i32;
            let read_num = |h: HWND, def: i32| -> i32 {
                let mut buf = [0u16; 32];
                let len = unsafe { GetWindowTextW(h, buf.as_mut_ptr(), 31) } as usize;
                String::from_utf16_lossy(&buf[..len])
                    .trim()
                    .parse::<i32>()
                    .unwrap_or(def)
            };
            if id == ID_TEST_AUDIO {
                let sfx = read_num(st.hwnd_sfx_vol, st.prefs.sfx_volume).clamp(0, 100);
                let midi = read_num(st.hwnd_midi_vol, st.prefs.midi_volume).clamp(0, 100);
                st.sound.set_volumes(sfx, midi);
                // Play Bugs Bunny "What's up, Doc?" + brief chime!
                ad_modules::looney::looney_pack().play_voice(
                    &st.sound,
                    true,
                    ad_modules::looney::BUGS_VOICES[5],
                );
                return 0;
            } else if id == ID_OK {
                st.prefs.timeout_minutes =
                    read_num(st.hwnd_timeout, st.prefs.timeout_minutes as i32).clamp(1, 999) as u32;
                st.prefs.no_corners = unsafe { SendMessageW(st.hwnd_corners_on, BM_GETCHECK, 0, 0) }
                    != BST_CHECKED as isize;
                st.prefs.sleep_corner = ScreenCorner::from_i32(unsafe {
                    SendMessageW(st.hwnd_sleep_corner, CB_GETCURSEL, 0, 0) as i32
                });
                st.prefs.wake_corner = ScreenCorner::from_i32(unsafe {
                    SendMessageW(st.hwnd_wake_corner, CB_GETCURSEL, 0, 0) as i32
                });
                st.prefs.hotkey_enabled =
                    unsafe { SendMessageW(st.hwnd_hotkey_on, BM_GETCHECK, 0, 0) }
                        == BST_CHECKED as isize;
                st.prefs.frame_rate_mode =
                    match unsafe { SendMessageW(st.hwnd_fps, CB_GETCURSEL, 0, 0) } {
                        0 => FrameRateMode::AuthenticRetro,
                        2 => FrameRateMode::HighRefresh120Fps,
                        _ => FrameRateMode::Smooth60Fps,
                    };
                st.prefs.authentic_timing =
                    st.prefs.frame_rate_mode == FrameRateMode::AuthenticRetro;
                st.prefs.scale_mode = match unsafe { SendMessageW(st.hwnd_scale, CB_GETCURSEL, 0, 0) }
                {
                    1 => ScaleMode::Scale1x,
                    2 => ScaleMode::Scale2x,
                    3 => ScaleMode::Scale3x,
                    4 => ScaleMode::Classic640x480,
                    5 => ScaleMode::CrtScanlines,
                    _ => ScaleMode::Auto,
                };
                st.prefs.multi_monitor =
                    match unsafe { SendMessageW(st.hwnd_multimon, CB_GETCURSEL, 0, 0) } {
                        1 => MultiMonitorMode::DifferentPerMonitor,
                        2 => MultiMonitorMode::Spanned,
                        3 => MultiMonitorMode::PrimaryOnly,
                        _ => MultiMonitorMode::PerMonitor,
                    };
                st.prefs.ui_theme =
                    if unsafe { SendMessageW(st.hwnd_theme, CB_GETCURSEL, 0, 0) } == 1 {
                        UiTheme::ModernWin11
                    } else {
                        UiTheme::RetroWin31
                    };
                st.prefs.sound_enabled = unsafe { SendMessageW(st.hwnd_sound, BM_GETCHECK, 0, 0) }
                    == BST_CHECKED as isize;
                st.prefs.sfx_volume = read_num(st.hwnd_sfx_vol, st.prefs.sfx_volume).clamp(0, 100);
                st.prefs.midi_volume =
                    read_num(st.hwnd_midi_vol, st.prefs.midi_volume).clamp(0, 100);
                st.accepted = true;
                st.done = true;
                return 0;
            } else if id == ID_CANCEL {
                st.done = true;
                return 0;
            }
            0
        }
        WM_CLOSE => {
            st.done = true;
            0
        }
        _ => unsafe { DefWindowProcW(hwnd, msg, wparam, lparam) },
    }
}

// ============================================================================
// Randomizer "Choose.." Modal Dialog (writes 1991 RANDOM.ADS!)
// ============================================================================

const ID_RND_ALL: i32 = 301;
const ID_RND_CLASSIC: i32 = 302;
const ID_RND_SIMPSONS: i32 = 303;
const ID_RND_TNG: i32 = 304;
const ID_RND_LOONEY: i32 = 305;
const ID_RND_CARTOONS: i32 = 306;
const ID_RND_FAVS: i32 = 307;
const ID_RND_CLEAR: i32 = 308;

struct RandomDlgState {
    hwnd_list: HWND,
    ids: Vec<String>,
    favorites: Vec<String>,
    selected: Vec<String>,
    accepted: bool,
    done: bool,
}

pub fn show_randomizer_choose_dialog(
    owner: HWND,
    catalog: &[ModuleCatalogEntry],
    current_pool: &[String],
    favorites: &[String],
) -> Option<Vec<String>> {
    register_modal_class("AfterDarkRandomChooseClass", random_dlg_proc);

    let candidates: Vec<&ModuleCatalogEntry> = catalog
        .iter()
        .filter(|e| e.meta.id != "randomizer")
        .collect();
    let ids: Vec<String> = candidates.iter().map(|e| e.meta.id.clone()).collect();

    let mut state = Box::new(RandomDlgState {
        hwnd_list: ptr::null_mut(),
        ids,
        favorites: favorites.to_vec(),
        selected: Vec::new(),
        accepted: false,
        done: false,
    });

    let hinst = unsafe { GetModuleHandleW(ptr::null()) };
    let cls = wide("AfterDarkRandomChooseClass");
    let title = wide("Randomizer — Choose Modules & Pack Presets");
    let hwnd = unsafe {
        CreateWindowExW(
            WS_EX_DLGMODALFRAME,
            cls.as_ptr(),
            title.as_ptr(),
            WS_POPUP | WS_CAPTION | WS_SYSMENU | WS_VISIBLE,
            210,
            140,
            406,
            410,
            owner,
            ptr::null_mut(),
            hinst,
            ptr::null(),
        )
    };
    if hwnd.is_null() {
        return None;
    }

    let font = unsafe { GetStockObject(DEFAULT_GUI_FONT) };
    let make = |class: &str, text: &str, style: u32, x: i32, y: i32, w: i32, h: i32, id: i32| -> HWND {
        let cw = wide(class);
        let tw = wide(text);
        let ch = unsafe {
            CreateWindowExW(
                0,
                cw.as_ptr(),
                tw.as_ptr(),
                WS_CHILD | WS_VISIBLE | style,
                x,
                y,
                w,
                h,
                hwnd,
                id as isize as _,
                hinst,
                ptr::null(),
            )
        };
        unsafe {
            SendMessageW(ch, WM_SETFONT, font as WPARAM, 1);
        }
        ch
    };

    make(
        "STATIC",
        "Quick Pack Presets (or click individual modules below):",
        0,
        12,
        10,
        365,
        18,
        0,
    );

    // Row 1 of pack presets
    make("BUTTON", "All (76)", BS_PUSHBUTTON as u32 | WS_TABSTOP, 12, 30, 88, 22, ID_RND_ALL);
    make("BUTTON", "Classic 1991", BS_PUSHBUTTON as u32 | WS_TABSTOP, 104, 30, 90, 22, ID_RND_CLASSIC);
    make("BUTTON", "Simpsons", BS_PUSHBUTTON as u32 | WS_TABSTOP, 198, 30, 88, 22, ID_RND_SIMPSONS);
    make("BUTTON", "Star Trek", BS_PUSHBUTTON as u32 | WS_TABSTOP, 290, 30, 88, 22, ID_RND_TNG);

    // Row 2 of pack presets
    make("BUTTON", "Looney Tunes", BS_PUSHBUTTON as u32 | WS_TABSTOP, 12, 56, 88, 22, ID_RND_LOONEY);
    make("BUTTON", "All Cartoons", BS_PUSHBUTTON as u32 | WS_TABSTOP, 104, 56, 90, 22, ID_RND_CARTOONS);
    make("BUTTON", "★ Favorites", BS_PUSHBUTTON as u32 | WS_TABSTOP, 198, 56, 88, 22, ID_RND_FAVS);
    make("BUTTON", "Clear All", BS_PUSHBUTTON as u32 | WS_TABSTOP, 290, 56, 88, 22, ID_RND_CLEAR);

    state.hwnd_list = make(
        "LISTBOX",
        "",
        WS_BORDER | WS_VSCROLL | WS_TABSTOP | LBS_MULTIPLESEL as u32 | LBS_NOINTEGRALHEIGHT as u32,
        12,
        86,
        366,
        242,
        201,
    );
    for (idx, entry) in candidates.iter().enumerate() {
        let pack_tag = if entry.meta.id.starts_with("simpsons_") {
            "[Simpsons] "
        } else if entry.meta.id.starts_with("tng_") {
            "[Star Trek] "
        } else if entry.meta.id.starts_with("looney_") {
            "[Looney Tunes] "
        } else {
            "[1991] "
        };
        let nw = wide(&format!("{}{}", pack_tag, entry.meta.name));
        unsafe {
            SendMessageW(state.hwnd_list, LB_ADDSTRING, 0, nw.as_ptr() as LPARAM);
            let is_sel = current_pool.iter().any(|p| p == &entry.meta.id);
            if is_sel {
                SendMessageW(state.hwnd_list, LB_SETSEL, 1, idx as LPARAM);
            }
        }
    }

    make(
        "BUTTON",
        "OK",
        BS_DEFPUSHBUTTON as u32 | WS_TABSTOP,
        202,
        338,
        84,
        26,
        ID_OK,
    );
    make(
        "BUTTON",
        "Cancel",
        BS_PUSHBUTTON as u32 | WS_TABSTOP,
        294,
        338,
        84,
        26,
        ID_CANCEL,
    );

    let raw_ptr = &mut *state as *mut RandomDlgState;
    unsafe {
        SetWindowLongPtrW(hwnd, GWLP_USERDATA, raw_ptr as isize);
        EnableWindow(owner, 0);
        ShowWindow(hwnd, SW_SHOW);
        let mut msg: MSG = std::mem::zeroed();
        while !state.done && IsWindow(hwnd) != 0 && GetMessageW(&mut msg, ptr::null_mut(), 0, 0) > 0
        {
            TranslateMessage(&msg);
            DispatchMessageW(&msg);
        }
        EnableWindow(owner, 1);
        if IsWindow(hwnd) != 0 {
            SetWindowLongPtrW(hwnd, GWLP_USERDATA, 0);
            DestroyWindow(hwnd);
        }
    }

    if state.accepted {
        Some(state.selected)
    } else {
        None
    }
}

unsafe extern "system" fn random_dlg_proc(
    hwnd: HWND,
    msg: u32,
    wparam: WPARAM,
    lparam: LPARAM,
) -> LRESULT {
    let ptr = unsafe { GetWindowLongPtrW(hwnd, GWLP_USERDATA) } as *mut RandomDlgState;
    if ptr.is_null() {
        return unsafe { DefWindowProcW(hwnd, msg, wparam, lparam) };
    }
    let st = unsafe { &mut *ptr };
    match msg {
        WM_COMMAND => {
            let id = (wparam & 0xFFFF) as i32;
            if (ID_RND_ALL..=ID_RND_CLEAR).contains(&id) {
                for (i, mod_id) in st.ids.iter().enumerate() {
                    let is_simpsons = mod_id.starts_with("simpsons_");
                    let is_tng = mod_id.starts_with("tng_");
                    let is_looney = mod_id.starts_with("looney_");
                    let is_classic = !is_simpsons && !is_tng && !is_looney;
                    let want = match id {
                        ID_RND_ALL => true,
                        ID_RND_CLASSIC => is_classic,
                        ID_RND_SIMPSONS => is_simpsons,
                        ID_RND_TNG => is_tng,
                        ID_RND_LOONEY => is_looney,
                        ID_RND_CARTOONS => is_simpsons || is_looney,
                        ID_RND_FAVS => st.favorites.iter().any(|f| f == mod_id),
                        _ => false,
                    };
                    unsafe {
                        SendMessageW(
                            st.hwnd_list,
                            LB_SETSEL,
                            if want { 1 } else { 0 },
                            i as LPARAM,
                        );
                    }
                }
                return 0;
            } else if id == ID_OK {
                let count = unsafe { SendMessageW(st.hwnd_list, LB_GETCOUNT, 0, 0) } as usize;
                st.selected.clear();
                for i in 0..count.min(st.ids.len()) {
                    if unsafe { SendMessageW(st.hwnd_list, LB_GETSEL, i, 0) } > 0 {
                        st.selected.push(st.ids[i].clone());
                    }
                }
                st.accepted = true;
                st.done = true;
                return 0;
            } else if id == ID_CANCEL {
                st.done = true;
                return 0;
            }
            0
        }
        WM_CLOSE => {
            st.done = true;
            0
        }
        _ => unsafe { DefWindowProcW(hwnd, msg, wparam, lparam) },
    }
}

fn register_modal_class(
    name: &str,
    proc_fn: unsafe extern "system" fn(HWND, u32, WPARAM, LPARAM) -> LRESULT,
) {
    let hinst = unsafe { GetModuleHandleW(ptr::null()) };
    let cls = wide(name);
    let wc = WNDCLASSW {
        style: 0,
        lpfnWndProc: Some(proc_fn),
        cbClsExtra: 0,
        cbWndExtra: 0,
        hInstance: hinst,
        hIcon: ptr::null_mut(),
        hCursor: unsafe { LoadCursorW(ptr::null_mut(), IDC_ARROW) },
        hbrBackground: (COLOR_BTNFACE + 1) as HBRUSH,
        lpszMenuName: ptr::null(),
        lpszClassName: cls.as_ptr(),
    };
    unsafe {
        RegisterClassW(&wc);
    }
}

// ============================================================================
// Native Win32 Bitmap File Picker (`Logo`, `Globe`) & Folder Picker (`Slide Show`)
// ============================================================================

pub fn pick_bmp_file(owner: HWND, title: &str, initial_path: &str) -> Option<String> {
    let mut file_buf = vec![0u16; 1024];
    if !initial_path.is_empty() {
        let init: Vec<u16> = initial_path.encode_utf16().collect();
        let n = init.len().min(file_buf.len() - 1);
        file_buf[..n].copy_from_slice(&init[..n]);
    }
    let filter: Vec<u16> = "Windows Bitmaps (*.bmp)\0*.bmp\0All Files (*.*)\0*.*\0\0"
        .encode_utf16()
        .collect();
    let title_w = wide(title);
    let def_ext = wide("bmp");

    let mut ofn: OPENFILENAMEW = unsafe { std::mem::zeroed() };
    ofn.lStructSize = std::mem::size_of::<OPENFILENAMEW>() as u32;
    ofn.hwndOwner = owner;
    ofn.lpstrFilter = filter.as_ptr();
    ofn.lpstrFile = file_buf.as_mut_ptr();
    ofn.nMaxFile = file_buf.len() as u32;
    ofn.lpstrTitle = title_w.as_ptr();
    ofn.lpstrDefExt = def_ext.as_ptr();
    ofn.Flags = OFN_FILEMUSTEXIST | OFN_PATHMUSTEXIST | OFN_HIDEREADONLY | OFN_NOCHANGEDIR;

    let ok = unsafe { GetOpenFileNameW(&mut ofn) };
    if ok != 0 {
        let end = file_buf.iter().position(|&c| c == 0).unwrap_or(file_buf.len());
        let path = String::from_utf16_lossy(&file_buf[..end]);
        if !path.is_empty() {
            return Some(path);
        }
    }
    None
}

pub fn pick_folder(owner: HWND, title: &str) -> Option<String> {
    let title_w = wide(title);
    let mut display_buf = vec![0u16; MAX_PATH as usize];
    let mut bi: BROWSEINFOW = unsafe { std::mem::zeroed() };
    bi.hwndOwner = owner;
    bi.pszDisplayName = display_buf.as_mut_ptr();
    bi.lpszTitle = title_w.as_ptr();
    bi.ulFlags = BIF_RETURNONLYFSDIRS | BIF_NEWDIALOGSTYLE;

    let pidl = unsafe { SHBrowseForFolderW(&mut bi) };
    if pidl.is_null() {
        return None;
    }
    let mut path_buf = vec![0u16; 1024];
    let ok = unsafe { SHGetPathFromIDListW(pidl, path_buf.as_mut_ptr()) };
    unsafe {
        CoTaskMemFree(pidl as *const _);
    }
    if ok != 0 {
        let end = path_buf.iter().position(|&c| c == 0).unwrap_or(path_buf.len());
        let dir = String::from_utf16_lossy(&path_buf[..end]);
        if !dir.is_empty() {
            return Some(dir);
        }
    }
    None
}

// ============================================================================
// Messages "Edit..." Modal Dialog (reads/writes 1991 MESSAGES.ADS!)
// ============================================================================

const ID_MSG_SLOT: i32 = 301;
const ID_MSG_ACTIVE: i32 = 302;
const ID_MSG_TEXT: i32 = 303;
const ID_MSG_FONT: i32 = 304;
const ID_MSG_SIZE: i32 = 305;
const ID_MSG_ALIGN: i32 = 306;
const ID_MSG_COLOR: i32 = 307;
const ID_MSG_BOLD: i32 = 308;
const ID_MSG_ITALIC: i32 = 309;
const ID_MSG_UNDERLINE: i32 = 310;

const MSG_FONT_CHOICES: [&str; 6] = [
    "Helv",
    "Arial",
    "Times New Roman",
    "Courier New",
    "Segoe UI",
    "Segoe Script",
];

struct MessagesDlgState {
    records: Vec<MessageRecord>,
    cur_slot: usize,
    accepted: bool,
    done: bool,
    hwnd_slot: HWND,
    hwnd_active: HWND,
    hwnd_text: HWND,
    hwnd_font: HWND,
    hwnd_size: HWND,
    hwnd_align: HWND,
    hwnd_color: HWND,
    hwnd_bold: HWND,
    hwnd_italic: HWND,
    hwnd_underline: HWND,
}

impl MessagesDlgState {
    fn save_ui_to_current(&mut self) {
        if self.cur_slot >= self.records.len() {
            return;
        }
        let text = get_window_text_string(self.hwnd_text).replace("\r\n", "\n");
        let size_s = get_window_text_string(self.hwnd_size);
        let point_size = size_s.trim().parse::<i32>().unwrap_or(24).clamp(8, 120);
        let font_idx = unsafe { SendMessageW(self.hwnd_font, CB_GETCURSEL, 0, 0) } as usize;
        let font_face = MSG_FONT_CHOICES
            .get(font_idx)
            .copied()
            .unwrap_or("Helv")
            .to_string();
        let align =
            (unsafe { SendMessageW(self.hwnd_align, CB_GETCURSEL, 0, 0) } as i32).clamp(0, 2) as u16;
        let color_idx =
            (unsafe { SendMessageW(self.hwnd_color, CB_GETCURSEL, 0, 0) } as i32).clamp(0, 6) as u16;
        let bold =
            unsafe { SendMessageW(self.hwnd_bold, BM_GETCHECK, 0, 0) } == BST_CHECKED as isize;
        let italic =
            unsafe { SendMessageW(self.hwnd_italic, BM_GETCHECK, 0, 0) } == BST_CHECKED as isize;
        let underline = unsafe { SendMessageW(self.hwnd_underline, BM_GETCHECK, 0, 0) }
            == BST_CHECKED as isize;
        let selected =
            unsafe { SendMessageW(self.hwnd_active, BM_GETCHECK, 0, 0) } == BST_CHECKED as isize;

        let rec = &mut self.records[self.cur_slot];
        rec.text = text;
        rec.point_size = point_size;
        rec.font_face = font_face;
        rec.align = align;
        rec.color_idx = color_idx;
        rec.bold = bold;
        rec.italic = italic;
        rec.underline = underline;
        rec.selected = selected;
    }

    fn load_current_to_ui(&self) {
        let Some(rec) = self.records.get(self.cur_slot) else {
            return;
        };
        let crlf_text = rec.text.replace("\r\n", "\n").replace('\n', "\r\n");
        let tw = wide(&crlf_text);
        let sw = wide(&rec.point_size.to_string());
        let font_idx = MSG_FONT_CHOICES
            .iter()
            .position(|&f| f.eq_ignore_ascii_case(rec.font_face.trim()))
            .unwrap_or(0);
        unsafe {
            SetWindowTextW(self.hwnd_text, tw.as_ptr());
            SetWindowTextW(self.hwnd_size, sw.as_ptr());
            SendMessageW(self.hwnd_font, CB_SETCURSEL, font_idx, 0);
            SendMessageW(self.hwnd_align, CB_SETCURSEL, rec.align.min(2) as WPARAM, 0);
            SendMessageW(
                self.hwnd_color,
                CB_SETCURSEL,
                rec.color_idx.min(6) as WPARAM,
                0,
            );
            SendMessageW(
                self.hwnd_bold,
                BM_SETCHECK,
                if rec.bold { BST_CHECKED } else { BST_UNCHECKED } as WPARAM,
                0,
            );
            SendMessageW(
                self.hwnd_italic,
                BM_SETCHECK,
                if rec.italic { BST_CHECKED } else { BST_UNCHECKED } as WPARAM,
                0,
            );
            SendMessageW(
                self.hwnd_underline,
                BM_SETCHECK,
                if rec.underline { BST_CHECKED } else { BST_UNCHECKED } as WPARAM,
                0,
            );
            SendMessageW(
                self.hwnd_active,
                BM_SETCHECK,
                if rec.selected { BST_CHECKED } else { BST_UNCHECKED } as WPARAM,
                0,
            );
        }
    }
}

fn get_window_text_string(hwnd: HWND) -> String {
    unsafe {
        let len = GetWindowTextLengthW(hwnd);
        if len <= 0 {
            return String::new();
        }
        let mut buf = vec![0u16; (len + 1) as usize];
        let got = GetWindowTextW(hwnd, buf.as_mut_ptr(), len + 1) as usize;
        String::from_utf16_lossy(&buf[..got])
    }
}

pub fn show_messages_editor_dialog(owner: HWND, data_dir: &Path) -> bool {
    register_modal_class("AfterDarkMessagesDlgClass", messages_dlg_proc);

    let data_dir_str = data_dir.to_string_lossy().to_string();
    let mut records = load_messages_ads(&data_dir_str);
    while records.len() < MESSAGE_SLOT_COUNT {
        records.push(MessageRecord::default());
    }
    let initial_slot = records.iter().position(|r| r.selected).unwrap_or(0);

    let mut state = Box::new(MessagesDlgState {
        records,
        cur_slot: initial_slot,
        accepted: false,
        done: false,
        hwnd_slot: ptr::null_mut(),
        hwnd_active: ptr::null_mut(),
        hwnd_text: ptr::null_mut(),
        hwnd_font: ptr::null_mut(),
        hwnd_size: ptr::null_mut(),
        hwnd_align: ptr::null_mut(),
        hwnd_color: ptr::null_mut(),
        hwnd_bold: ptr::null_mut(),
        hwnd_italic: ptr::null_mut(),
        hwnd_underline: ptr::null_mut(),
    });

    let hinst = unsafe { GetModuleHandleW(ptr::null()) };
    let cls = wide("AfterDarkMessagesDlgClass");
    let title = wide("Messages — Edit MESSAGES.ADS");
    let hwnd = unsafe {
        CreateWindowExW(
            WS_EX_DLGMODALFRAME,
            cls.as_ptr(),
            title.as_ptr(),
            WS_POPUP | WS_CAPTION | WS_SYSMENU | WS_VISIBLE,
            200,
            140,
            450,
            370,
            owner,
            ptr::null_mut(),
            hinst,
            ptr::null(),
        )
    };
    if hwnd.is_null() {
        return false;
    }

    let font = unsafe { GetStockObject(DEFAULT_GUI_FONT) };
    let make = |class: &str, text: &str, style: u32, x: i32, y: i32, w: i32, h: i32, id: i32| -> HWND {
        let cw = wide(class);
        let tw = wide(text);
        let ch = unsafe {
            CreateWindowExW(
                0,
                cw.as_ptr(),
                tw.as_ptr(),
                WS_CHILD | WS_VISIBLE | style,
                x,
                y,
                w,
                h,
                hwnd,
                id as isize as _,
                hinst,
                ptr::null(),
            )
        };
        unsafe {
            SendMessageW(ch, WM_SETFONT, font as WPARAM, 1);
        }
        ch
    };

    make("STATIC", "Message Slot:", 0, 14, 16, 90, 20, 0);
    state.hwnd_slot = make(
        "COMBOBOX",
        "",
        CBS_DROPDOWNLIST as u32 | WS_TABSTOP,
        110,
        12,
        130,
        200,
        ID_MSG_SLOT,
    );
    for i in 1..=MESSAGE_SLOT_COUNT {
        let lw = wide(&format!("Message {}", i));
        unsafe {
            SendMessageW(state.hwnd_slot, CB_ADDSTRING, 0, lw.as_ptr() as LPARAM);
        }
    }
    unsafe {
        SendMessageW(state.hwnd_slot, CB_SETCURSEL, initial_slot, 0);
    }

    state.hwnd_active = make(
        "BUTTON",
        "Include in Rotation (Selected)",
        BS_AUTOCHECKBOX as u32 | WS_TABSTOP,
        254,
        14,
        175,
        22,
        ID_MSG_ACTIVE,
    );

    make("STATIC", "Message Text:", 0, 14, 44, 120, 18, 0);
    state.hwnd_text = make(
        "EDIT",
        "",
        WS_BORDER
            | WS_VSCROLL
            | WS_TABSTOP
            | ES_MULTILINE as u32
            | ES_AUTOVSCROLL as u32
            | ES_WANTRETURN as u32,
        14,
        64,
        408,
        92,
        ID_MSG_TEXT,
    );

    make("STATIC", "Font:", 0, 14, 170, 44, 20, 0);
    state.hwnd_font = make(
        "COMBOBOX",
        "",
        CBS_DROPDOWNLIST as u32 | WS_TABSTOP,
        62,
        166,
        150,
        160,
        ID_MSG_FONT,
    );
    for f in MSG_FONT_CHOICES {
        let fw = wide(f);
        unsafe {
            SendMessageW(state.hwnd_font, CB_ADDSTRING, 0, fw.as_ptr() as LPARAM);
        }
    }

    make("STATIC", "Size (pt):", 0, 228, 170, 58, 20, 0);
    state.hwnd_size = make(
        "EDIT",
        "24",
        WS_BORDER | WS_TABSTOP | ES_NUMBER as u32,
        290,
        166,
        54,
        22,
        ID_MSG_SIZE,
    );

    make("STATIC", "Align:", 0, 14, 204, 44, 20, 0);
    state.hwnd_align = make(
        "COMBOBOX",
        "",
        CBS_DROPDOWNLIST as u32 | WS_TABSTOP,
        62,
        200,
        110,
        120,
        ID_MSG_ALIGN,
    );
    for a in ["Left", "Center", "Right"] {
        let aw = wide(a);
        unsafe {
            SendMessageW(state.hwnd_align, CB_ADDSTRING, 0, aw.as_ptr() as LPARAM);
        }
    }

    make("STATIC", "Color:", 0, 190, 204, 44, 20, 0);
    state.hwnd_color = make(
        "COMBOBOX",
        "",
        CBS_DROPDOWNLIST as u32 | WS_TABSTOP,
        240,
        200,
        120,
        180,
        ID_MSG_COLOR,
    );
    for c in ["White", "Red", "Green", "Blue", "Cyan", "Magenta", "Yellow"] {
        let cw = wide(c);
        unsafe {
            SendMessageW(state.hwnd_color, CB_ADDSTRING, 0, cw.as_ptr() as LPARAM);
        }
    }

    state.hwnd_bold = make(
        "BUTTON",
        "Bold",
        BS_AUTOCHECKBOX as u32 | WS_TABSTOP,
        62,
        238,
        75,
        22,
        ID_MSG_BOLD,
    );
    state.hwnd_italic = make(
        "BUTTON",
        "Italic",
        BS_AUTOCHECKBOX as u32 | WS_TABSTOP,
        150,
        238,
        75,
        22,
        ID_MSG_ITALIC,
    );
    state.hwnd_underline = make(
        "BUTTON",
        "Underline",
        BS_AUTOCHECKBOX as u32 | WS_TABSTOP,
        238,
        238,
        90,
        22,
        ID_MSG_UNDERLINE,
    );

    make(
        "BUTTON",
        "Save",
        BS_DEFPUSHBUTTON as u32 | WS_TABSTOP,
        244,
        286,
        84,
        26,
        ID_OK,
    );
    make(
        "BUTTON",
        "Cancel",
        BS_PUSHBUTTON as u32 | WS_TABSTOP,
        338,
        286,
        84,
        26,
        ID_CANCEL,
    );

    state.load_current_to_ui();

    let raw_ptr = &mut *state as *mut MessagesDlgState;
    unsafe {
        SetWindowLongPtrW(hwnd, GWLP_USERDATA, raw_ptr as isize);
        EnableWindow(owner, 0);
        ShowWindow(hwnd, SW_SHOW);
        let mut msg: MSG = std::mem::zeroed();
        while !state.done && IsWindow(hwnd) != 0 && GetMessageW(&mut msg, ptr::null_mut(), 0, 0) > 0
        {
            TranslateMessage(&msg);
            DispatchMessageW(&msg);
        }
        EnableWindow(owner, 1);
        if IsWindow(hwnd) != 0 {
            SetWindowLongPtrW(hwnd, GWLP_USERDATA, 0);
            DestroyWindow(hwnd);
        }
    }

    if state.accepted {
        if !state.records.iter().any(|r| r.selected) {
            if let Some(first) = state.records.first_mut() {
                first.selected = true;
            }
        }
        let bytes = serialize_messages_ads(&state.records);
        let _ = std::fs::write(data_dir.join("MESSAGES.ADS"), bytes);
        true
    } else {
        false
    }
}

unsafe extern "system" fn messages_dlg_proc(
    hwnd: HWND,
    msg: u32,
    wparam: WPARAM,
    lparam: LPARAM,
) -> LRESULT {
    let ptr = unsafe { GetWindowLongPtrW(hwnd, GWLP_USERDATA) } as *mut MessagesDlgState;
    if ptr.is_null() {
        return unsafe { DefWindowProcW(hwnd, msg, wparam, lparam) };
    }
    let st = unsafe { &mut *ptr };
    match msg {
        WM_COMMAND => {
            let id = (wparam & 0xFFFF) as i32;
            let code = ((wparam >> 16) & 0xFFFF) as u32;
            if id == ID_MSG_SLOT && code == CBN_SELCHANGE {
                st.save_ui_to_current();
                let sel = unsafe { SendMessageW(st.hwnd_slot, CB_GETCURSEL, 0, 0) } as usize;
                if sel < st.records.len() {
                    st.cur_slot = sel;
                    st.load_current_to_ui();
                }
                return 0;
            } else if id == ID_OK {
                st.save_ui_to_current();
                st.accepted = true;
                st.done = true;
                return 0;
            } else if id == ID_CANCEL {
                st.done = true;
                return 0;
            }
            0
        }
        WM_CLOSE => {
            st.done = true;
            0
        }
        _ => unsafe { DefWindowProcW(hwnd, msg, wparam, lparam) },
    }
}

// ============================================================================
// GraphStat "Edit.." Modal Dialog (reads/writes 1991 GRAFSTAT.TXT!)
// ============================================================================

const ID_GRAF_EDIT: i32 = 401;
const ID_GRAF_RESET: i32 = 402;

struct GrafStatDlgState {
    hwnd_edit: HWND,
    text: String,
    accepted: bool,
    done: bool,
}

pub fn show_grafstat_editor_dialog(owner: HWND, data_dir: &Path) -> bool {
    register_modal_class("AfterDarkGrafStatDlgClass", grafstat_dlg_proc);

    let data_dir_str = data_dir.to_string_lossy().to_string();
    let initial_text = GraphStatModule::load_grafstat_text(&data_dir_str);

    let mut state = Box::new(GrafStatDlgState {
        hwnd_edit: ptr::null_mut(),
        text: initial_text.clone(),
        accepted: false,
        done: false,
    });

    let hinst = unsafe { GetModuleHandleW(ptr::null()) };
    let cls = wide("AfterDarkGrafStatDlgClass");
    let title = wide("GraphStat — Edit GRAFSTAT.TXT");
    let hwnd = unsafe {
        CreateWindowExW(
            WS_EX_DLGMODALFRAME,
            cls.as_ptr(),
            title.as_ptr(),
            WS_POPUP | WS_CAPTION | WS_SYSMENU | WS_VISIBLE,
            200,
            130,
            460,
            400,
            owner,
            ptr::null_mut(),
            hinst,
            ptr::null(),
        )
    };
    if hwnd.is_null() {
        return false;
    }

    let font = unsafe { GetStockObject(DEFAULT_GUI_FONT) };
    let make = |class: &str, text: &str, style: u32, x: i32, y: i32, w: i32, h: i32, id: i32| -> HWND {
        let cw = wide(class);
        let tw = wide(text);
        let ch = unsafe {
            CreateWindowExW(
                0,
                cw.as_ptr(),
                tw.as_ptr(),
                WS_CHILD | WS_VISIBLE | style,
                x,
                y,
                w,
                h,
                hwnd,
                id as isize as _,
                hinst,
                ptr::null(),
            )
        };
        unsafe {
            SendMessageW(ch, WM_SETFONT, font as WPARAM, 1);
        }
        ch
    };

    make(
        "STATIC",
        "4 label sections separated by blank lines (Titles, Adjectives, Subjects, Units):",
        0,
        14,
        12,
        420,
        20,
        0,
    );
    let crlf_text = initial_text.replace("\r\n", "\n").replace('\n', "\r\n");
    state.hwnd_edit = make(
        "EDIT",
        &crlf_text,
        WS_BORDER
            | WS_VSCROLL
            | WS_HSCROLL
            | WS_TABSTOP
            | ES_MULTILINE as u32
            | ES_AUTOVSCROLL as u32
            | ES_AUTOHSCROLL as u32
            | ES_WANTRETURN as u32,
        14,
        36,
        418,
        270,
        ID_GRAF_EDIT,
    );

    make(
        "BUTTON",
        "Reset Default",
        BS_PUSHBUTTON as u32 | WS_TABSTOP,
        14,
        318,
        104,
        26,
        ID_GRAF_RESET,
    );
    make(
        "BUTTON",
        "Save",
        BS_DEFPUSHBUTTON as u32 | WS_TABSTOP,
        254,
        318,
        84,
        26,
        ID_OK,
    );
    make(
        "BUTTON",
        "Cancel",
        BS_PUSHBUTTON as u32 | WS_TABSTOP,
        348,
        318,
        84,
        26,
        ID_CANCEL,
    );

    let raw_ptr = &mut *state as *mut GrafStatDlgState;
    unsafe {
        SetWindowLongPtrW(hwnd, GWLP_USERDATA, raw_ptr as isize);
        EnableWindow(owner, 0);
        ShowWindow(hwnd, SW_SHOW);
        let mut msg: MSG = std::mem::zeroed();
        while !state.done && IsWindow(hwnd) != 0 && GetMessageW(&mut msg, ptr::null_mut(), 0, 0) > 0
        {
            TranslateMessage(&msg);
            DispatchMessageW(&msg);
        }
        EnableWindow(owner, 1);
        if IsWindow(hwnd) != 0 {
            SetWindowLongPtrW(hwnd, GWLP_USERDATA, 0);
            DestroyWindow(hwnd);
        }
    }

    if state.accepted {
        let _ = std::fs::write(data_dir.join("GRAFSTAT.TXT"), &state.text);
        true
    } else {
        false
    }
}

unsafe extern "system" fn grafstat_dlg_proc(
    hwnd: HWND,
    msg: u32,
    wparam: WPARAM,
    lparam: LPARAM,
) -> LRESULT {
    let ptr = unsafe { GetWindowLongPtrW(hwnd, GWLP_USERDATA) } as *mut GrafStatDlgState;
    if ptr.is_null() {
        return unsafe { DefWindowProcW(hwnd, msg, wparam, lparam) };
    }
    let st = unsafe { &mut *ptr };
    match msg {
        WM_COMMAND => {
            let id = (wparam & 0xFFFF) as i32;
            if id == ID_GRAF_RESET {
                let def = GraphStatModule::load_grafstat_text("");
                let crlf = def.replace("\r\n", "\n").replace('\n', "\r\n");
                let tw = wide(&crlf);
                unsafe {
                    SetWindowTextW(st.hwnd_edit, tw.as_ptr());
                }
                return 0;
            } else if id == ID_OK {
                st.text = get_window_text_string(st.hwnd_edit);
                st.accepted = true;
                st.done = true;
                return 0;
            } else if id == ID_CANCEL {
                st.done = true;
                return 0;
            }
            0
        }
        WM_CLOSE => {
            st.done = true;
            0
        }
        _ => unsafe { DefWindowProcW(hwnd, msg, wparam, lparam) },
    }
}
