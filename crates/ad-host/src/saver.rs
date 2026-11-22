//! Fullscreen Multi-Monitor Screensaver & Live Demo Engine.
//!
//! Features:
//! - Per-Monitor independent module instances, Spanned single virtual desktop canvas, or Primary-only
//! - Crisp nearest-neighbor integer scaling (`1x / 2x / 3x / Auto`) for High-DPI / 4K displays
//! - Authentic 1991 frame pacing (`target_frame_ms`) via `AdSystem::authentic_timing`
//! - 1991 Demo Mode: animates behind the Control Panel so sliders update live, or exits on Escape / click
//! - 1991 `README.TXT` Shift+Sleep solid-black blanking mode
//! - Clean wake-on-input with 500ms grace period & 12px mouse-jitter threshold

use std::ptr;
use std::time::{Duration, Instant};

use ad_sdk::canvas::AdSurface;
use ad_sdk::palette::AdPalette;
use ad_sdk::prefs::AdPrefs;
use ad_sdk::sound::AdSound;
use ad_sdk::{AdContext, AdModule, AdModuleParams, AdResult, AdSystem, MsvcRand, SaverMode};
use windows_sys::Win32::Foundation::{HINSTANCE, HWND, LPARAM, LRESULT, POINT, RECT, WPARAM};
use windows_sys::Win32::Graphics::Gdi::{
    BeginPaint, EndPaint, GetDC, PAINTSTRUCT, ReleaseDC,
};
use windows_sys::Win32::System::LibraryLoader::GetModuleHandleW;
use windows_sys::Win32::UI::Input::KeyboardAndMouse::{GetAsyncKeyState, VK_ESCAPE, VK_SHIFT};
use windows_sys::Win32::UI::WindowsAndMessaging::{
    CS_HREDRAW, CS_VREDRAW, CreateWindowExW, DefWindowProcW, DestroyWindow, GetClientRect,
    GetCursorPos, GetWindowLongPtrW, GWLP_USERDATA, HWND_TOPMOST, KillTimer, LoadCursorW,
    IDC_ARROW, PostMessageW, RegisterClassW, SW_SHOW, SW_SHOWNOACTIVATE, SWP_NOACTIVATE,
    SWP_NOMOVE, SWP_NOSIZE, SetTimer, SetWindowLongPtrW, SetWindowPos, ShowCursor, ShowWindow,
    WM_APP, WM_DESTROY, WM_ERASEBKGND, WM_KEYDOWN, WM_LBUTTONDOWN, WM_MBUTTONDOWN, WM_MOUSEMOVE,
    WM_PAINT, WM_RBUTTONDOWN, WM_SYSKEYDOWN, WM_TIMER, WNDCLASSW, WS_EX_TOOLWINDOW, WS_EX_TOPMOST,
    WS_POPUP, WS_VISIBLE,
};

use crate::monitors::resolve_targets;

pub const WM_SAVER_STOPPED: u32 = WM_APP + 201;
const TIMER_FRAME: usize = 1;

struct MonitorInstance {
    hwnd: HWND,
    surface: AdSurface,
    module: Box<dyn AdModule>,
    system: AdSystem,
    params: AdModuleParams,
    rng: MsvcRand,
    sound: AdSound,
    started_at: Instant,
    last_frame_at: Instant,
    frame_interval: Duration,
    solid_black_only: bool,
    mode: SaverMode,
    owner_hwnd: HWND,
    initial_cursor: POINT,
}

/// Manages one or more active fullscreen screensaver / live Demo windows.
pub struct SaverSession {
    windows: Vec<HWND>,
    instances: Vec<Box<MonitorInstance>>,
    mode: SaverMode,
    cursor_hidden: bool,
}

impl SaverSession {
    pub fn start(
        owner_hwnd: HWND,
        mode: SaverMode,
        prefs: &AdPrefs,
        raw_controls: [i32; 4],
        sound: &AdSound,
        mut factory: impl FnMut() -> Box<dyn AdModule>,
    ) -> Option<Self> {
        register_saver_class();

        let solid_black_only = mode == SaverMode::Saver
            && unsafe { (GetAsyncKeyState(VK_SHIFT as i32) as u16 & 0x8000) != 0 };

        let targets = if mode == SaverMode::Demo {
            // Demo mode covers all monitors behind the Control Panel (or primary if PrimaryOnly)
            resolve_targets(prefs.multi_monitor)
        } else {
            resolve_targets(prefs.multi_monitor)
        };

        let mut init_pt = POINT { x: 0, y: 0 };
        unsafe {
            GetCursorPos(&mut init_pt);
        }

        let mut windows = Vec::new();
        let mut instances = Vec::new();
        let hinst = unsafe { GetModuleHandleW(ptr::null()) };
        let class_w: Vec<u16> = "AfterDark10aSaverSurface\0".encode_utf16().collect();

        for (idx, target) in targets.into_iter().enumerate() {
            let scale = prefs.scale_mode.resolve_factor(target.dpi).max(1);
            let logical_w = (target.width / scale).max(64);
            let logical_h = (target.height / scale).max(64);

            let Some(mut surface) = AdSurface::new(logical_w, logical_h) else {
                continue;
            };
            // Capture underlying desktop so screen-effect modules (Fade/Draino/Puzzle/etc.) work 1:1
            surface.capture_desktop(target.x, target.y, target.width, target.height);

            let mut module = factory();
            let meta = module.metadata();
            let mut system = AdSystem::new(logical_w, logical_h, mode);
            system.sound_enabled = prefs.sound_enabled && idx == 0; // Avoid double audio across monitors
            system.authentic_timing = prefs.authentic_timing;
            system.data_dir = if prefs.path.trim().is_empty() {
                std::env::current_exe()
                    .ok()
                    .and_then(|p| p.parent().map(|d| d.to_string_lossy().to_string()))
                    .unwrap_or_default()
            } else {
                prefs.path.clone()
            };
            system.logo_file = prefs.logo_file.clone();
            system.globe_file = prefs.globe_file.clone();
            system.slide_show_dir = prefs.slide_show_dir.clone();
            let mut params = AdModuleParams::new(logical_w, logical_h, &meta.controls);
            for slot in 0..4 {
                params.set_raw_value(slot, raw_controls[slot], &meta.controls);
            }
            let mut rng = MsvcRand::from_system_time();
            // Slightly salt RNG per monitor so independent monitors don't look cloned!
            for _ in 0..(idx * 17) {
                rng.rand();
            }

            let now = Instant::now();
            if solid_black_only {
                surface.fill_black();
            } else {
                let mut ctx = AdContext {
                    system: &mut system,
                    module: &mut params,
                    surface: &mut surface,
                    sound,
                    rng: &mut rng,
                    elapsed_ms: 0,
                };
                let _ = module.do_pre_initialize(&mut ctx);
                if let AdResult::PaletteRequest(kind) = module.do_initialize(&mut ctx) {
                    ctx.module.palette = Some(AdPalette::build(kind));
                }
                if let AdResult::PaletteRequest(kind) = module.do_blank(&mut ctx) {
                    ctx.module.palette = Some(AdPalette::build(kind));
                }
            }

            let ex_style = if mode == SaverMode::Saver {
                WS_EX_TOPMOST | WS_EX_TOOLWINDOW
            } else {
                WS_EX_TOOLWINDOW
            };

            let hwnd = unsafe {
                CreateWindowExW(
                    ex_style,
                    class_w.as_ptr(),
                    ptr::null(),
                    WS_POPUP | WS_VISIBLE,
                    target.x,
                    target.y,
                    target.width,
                    target.height,
                    if mode == SaverMode::Demo {
                        ptr::null_mut()
                    } else {
                        ptr::null_mut()
                    },
                    ptr::null_mut(),
                    hinst as HINSTANCE,
                    ptr::null(),
                )
            };
            if hwnd.is_null() {
                continue;
            }

            let frame_ms = if prefs.authentic_timing {
                meta.target_frame_ms.max(15) as u64
            } else {
                16
            };

            let mut inst = Box::new(MonitorInstance {
                hwnd,
                surface,
                module,
                system,
                params,
                rng,
                sound: sound.clone(),
                started_at: now,
                last_frame_at: now,
                frame_interval: Duration::from_millis(frame_ms),
                solid_black_only,
                mode,
                owner_hwnd,
                initial_cursor: init_pt,
            });

            let raw_ptr = &mut *inst as *mut MonitorInstance;
            unsafe {
                SetWindowLongPtrW(hwnd, GWLP_USERDATA, raw_ptr as isize);
                if mode == SaverMode::Saver {
                    SetWindowPos(
                        hwnd,
                        HWND_TOPMOST,
                        0,
                        0,
                        0,
                        0,
                        SWP_NOMOVE | SWP_NOSIZE,
                    );
                    ShowWindow(hwnd, SW_SHOW);
                } else {
                    // Place Demo surface directly underneath the Control Panel so user can tweak sliders live!
                    SetWindowPos(
                        hwnd,
                        owner_hwnd,
                        0,
                        0,
                        0,
                        0,
                        SWP_NOMOVE | SWP_NOSIZE | SWP_NOACTIVATE,
                    );
                    ShowWindow(hwnd, SW_SHOWNOACTIVATE);
                }
                SetTimer(hwnd, TIMER_FRAME, 15, None);
            }

            windows.push(hwnd);
            instances.push(inst);
        }

        if windows.is_empty() {
            return None;
        }

        let cursor_hidden = if mode == SaverMode::Saver {
            unsafe {
                ShowCursor(0);
            }
            true
        } else {
            false
        };

        Some(Self {
            windows,
            instances,
            mode,
            cursor_hidden,
        })
    }

    pub fn mode(&self) -> SaverMode {
        self.mode
    }

    /// Live-update module control values during Demo Mode.
    /// Calls `do_button_message(slot_idx)` first so modules like `Spotlight` preserve their
    /// captured desktop across live resize, and modules like `Satori` / `Stained Glass` update
    /// seamlessly without a forced blanking restart.
    pub fn update_controls_live(&mut self, slot_idx: usize, raw_controls: [i32; 4]) {
        for inst in &mut self.instances {
            let meta = inst.module.metadata();
            for slot in 0..4 {
                inst.params
                    .set_raw_value(slot, raw_controls[slot], &meta.controls);
            }
            let btn_res = inst.module.do_button_message(slot_idx);
            let live_no_restart = btn_res == AdResult::NoError
                && matches!(meta.id.as_str(), "spotlite" | "satori" | "stained");
            if live_no_restart {
                continue;
            }
            let elapsed_ms = inst.started_at.elapsed().as_millis() as u64;
            let mut ctx = AdContext {
                system: &mut inst.system,
                module: &mut inst.params,
                surface: &mut inst.surface,
                sound: &inst.sound,
                rng: &mut inst.rng,
                elapsed_ms,
            };
            let _ = inst.module.do_close(&mut ctx);
            if let AdResult::PaletteRequest(kind) = inst.module.do_initialize(&mut ctx) {
                ctx.module.palette = Some(AdPalette::build(kind));
            }
            if let AdResult::PaletteRequest(kind) = inst.module.do_blank(&mut ctx) {
                ctx.module.palette = Some(AdPalette::build(kind));
            }
            present_window(inst);
        }
    }

    pub fn stop(mut self) {
        self.teardown();
    }

    fn teardown(&mut self) {
        for inst in &mut self.instances {
            let elapsed_ms = inst.started_at.elapsed().as_millis() as u64;
            let mut ctx = AdContext {
                system: &mut inst.system,
                module: &mut inst.params,
                surface: &mut inst.surface,
                sound: &inst.sound,
                rng: &mut inst.rng,
                elapsed_ms,
            };
            let _ = inst.module.do_close(&mut ctx);
        }
        for hwnd in self.windows.drain(..) {
            unsafe {
                KillTimer(hwnd, TIMER_FRAME);
                SetWindowLongPtrW(hwnd, GWLP_USERDATA, 0);
                DestroyWindow(hwnd);
            }
        }
        self.instances.clear();
        if self.cursor_hidden {
            unsafe {
                ShowCursor(1);
            }
            self.cursor_hidden = false;
        }
    }
}

impl Drop for SaverSession {
    fn drop(&mut self) {
        self.teardown();
    }
}

fn present_window(inst: &MonitorInstance) {
    unsafe {
        let mut rc: RECT = std::mem::zeroed();
        GetClientRect(inst.hwnd, &mut rc);
        let hdc = GetDC(inst.hwnd);
        if !hdc.is_null() {
            inst.surface
                .present_to_hdc(hdc, rc.right - rc.left, rc.bottom - rc.top);
            ReleaseDC(inst.hwnd, hdc);
        }
    }
}

fn register_saver_class() {
    use std::sync::Once;
    static ONCE: Once = Once::new();
    ONCE.call_once(|| unsafe {
        let hinst = GetModuleHandleW(ptr::null());
        let class_w: Vec<u16> = "AfterDark10aSaverSurface\0".encode_utf16().collect();
        let wc = WNDCLASSW {
            style: CS_HREDRAW | CS_VREDRAW,
            lpfnWndProc: Some(saver_wnd_proc),
            cbClsExtra: 0,
            cbWndExtra: 0,
            hInstance: hinst,
            hIcon: ptr::null_mut(),
            hCursor: LoadCursorW(ptr::null_mut(), IDC_ARROW),
            hbrBackground: ptr::null_mut(),
            lpszMenuName: ptr::null(),
            lpszClassName: class_w.as_ptr(),
        };
        RegisterClassW(&wc);
    });
}

unsafe extern "system" fn saver_wnd_proc(
    hwnd: HWND,
    msg: u32,
    wparam: WPARAM,
    lparam: LPARAM,
) -> LRESULT {
    let ptr = unsafe { GetWindowLongPtrW(hwnd, GWLP_USERDATA) } as *mut MonitorInstance;
    if ptr.is_null() {
        return unsafe { DefWindowProcW(hwnd, msg, wparam, lparam) };
    }
    let inst = unsafe { &mut *ptr };

    match msg {
        WM_ERASEBKGND => 1,
        WM_PAINT => unsafe {
            let mut ps: PAINTSTRUCT = std::mem::zeroed();
            let hdc = BeginPaint(hwnd, &mut ps);
            let mut rc: RECT = std::mem::zeroed();
            GetClientRect(hwnd, &mut rc);
            inst.surface
                .present_to_hdc(hdc, rc.right - rc.left, rc.bottom - rc.top);
            EndPaint(hwnd, &ps);
            0
        },
        WM_TIMER if wparam == TIMER_FRAME => {
            if inst.mode == SaverMode::Demo {
                // Keep Demo surface directly underneath the Control Panel
                unsafe {
                    SetWindowPos(
                        hwnd,
                        inst.owner_hwnd,
                        0,
                        0,
                        0,
                        0,
                        SWP_NOMOVE | SWP_NOSIZE | SWP_NOACTIVATE,
                    );
                }
                if unsafe { (GetAsyncKeyState(VK_ESCAPE as i32) as u16 & 0x8000) != 0 } {
                    unsafe {
                        PostMessageW(inst.owner_hwnd, WM_SAVER_STOPPED, 0, 0);
                    }
                    return 0;
                }
            }

            if !inst.solid_black_only && inst.last_frame_at.elapsed() >= inst.frame_interval {
                inst.last_frame_at = Instant::now();
                let elapsed_ms = inst.started_at.elapsed().as_millis() as u64;
                let mut ctx = AdContext {
                    system: &mut inst.system,
                    module: &mut inst.params,
                    surface: &mut inst.surface,
                    sound: &inst.sound,
                    rng: &mut inst.rng,
                    elapsed_ms,
                };
                match inst.module.do_draw_frame(&mut ctx) {
                    AdResult::WakeUp => unsafe {
                        PostMessageW(inst.owner_hwnd, WM_SAVER_STOPPED, 0, 0);
                        return 0;
                    },
                    AdResult::RestartMe => {
                        let _ = inst.module.do_close(&mut ctx);
                        let _ = inst.module.do_initialize(&mut ctx);
                        let _ = inst.module.do_blank(&mut ctx);
                    }
                    AdResult::PaletteRequest(kind) => {
                        ctx.module.palette = Some(AdPalette::build(kind));
                    }
                    _ => {}
                }
                present_window(inst);
            }
            0
        }
        WM_KEYDOWN | WM_SYSKEYDOWN | WM_LBUTTONDOWN | WM_RBUTTONDOWN | WM_MBUTTONDOWN => {
            if inst.started_at.elapsed() >= Duration::from_millis(300) {
                unsafe {
                    PostMessageW(inst.owner_hwnd, WM_SAVER_STOPPED, 0, 0);
                }
            }
            0
        }
        WM_MOUSEMOVE => {
            if inst.mode == SaverMode::Saver
                && inst.started_at.elapsed() >= Duration::from_millis(500)
            {
                let mut pt = POINT { x: 0, y: 0 };
                unsafe {
                    GetCursorPos(&mut pt);
                }
                let dx = (pt.x - inst.initial_cursor.x).abs();
                let dy = (pt.y - inst.initial_cursor.y).abs();
                if dx > 12 || dy > 12 {
                    unsafe {
                        PostMessageW(inst.owner_hwnd, WM_SAVER_STOPPED, 0, 0);
                    }
                }
            }
            0
        }
        WM_DESTROY => 0,
        _ => unsafe { DefWindowProcW(hwnd, msg, wparam, lparam) },
    }
}
