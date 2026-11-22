//! Modernized Win64 C-ABI plugin interface (`ad_module_v1`),
//! preserving Berkeley Systems' original `ADMODULE.SDK` `Module(iMessage, hDrawDC, hADSystem)` design
//! for 64-bit Windows 11 `.dll` screensaver modules!

use std::ffi::{CStr, CString, c_char, c_int, c_void};
use std::path::Path;

use windows_sys::Win32::Foundation::{FreeLibrary, HMODULE};
use windows_sys::Win32::Graphics::Gdi::HDC;
use windows_sys::Win32::System::LibraryLoader::{GetProcAddress, LoadLibraryW};

use crate::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

/// Control messages matching `MODULE.H`.
pub const MSG_INITIALIZE: c_int = 0;
pub const MSG_BLANK: c_int = 1;
pub const MSG_DRAWFRAME: c_int = 2;
pub const MSG_CLOSE: c_int = 3;
pub const MSG_MODULESELECTED: c_int = 5;
pub const MSG_ABOUT: c_int = 6;
pub const MSG_BUTTONMESSAGE: c_int = 7;
pub const MSG_PREINITIALIZE: c_int = 12;

/// Return codes matching `MODULE.H`.
pub const RET_NOERROR: c_int = 0;
pub const RET_MEM_ERROR: c_int = 1;
pub const RET_RESTART_ME: c_int = 3;
pub const RET_WAKE_UP: c_int = 5;
pub const RET_USER_ERROR: c_int = 7;
pub const RET_HSV_PAL: c_int = 10;
pub const RET_RGB_PAL: c_int = 11;
pub const RET_WHITE_PAL: c_int = 12;
pub const RET_PRIMARY_PAL: c_int = 13;

/// C-ABI system + module parameter block passed to Win64 external `.dll` modules.
#[repr(C)]
pub struct AdCModuleState {
    pub abi_version: u32,
    pub screen_width: c_int,
    pub screen_height: c_int,
    pub rgn_width: c_int,
    pub rgn_height: c_int,
    pub bits_per_pixel: c_int,
    pub saver_mode: c_int,
    pub control_value: [c_int; 4],
    pub elapsed_ms: u64,
    pub user_data: *mut c_void,
}

/// C-ABI metadata returned by `ad_module_metadata_v1()`.
#[repr(C)]
pub struct AdCMetadata {
    pub abi_version: u32,
    pub name: *const c_char,
    pub credit: *const c_char,
    pub about: *const c_char,
    pub target_frame_ms: u32,
}

pub type AdModuleEntryFn = unsafe extern "C" fn(c_int, HDC, *mut AdCModuleState) -> c_int;
pub type AdModuleMetaFn = unsafe extern "C" fn() -> AdCMetadata;

/// Dynamically loaded Win64 `.dll` module built against the modernized `ad-sdk` C-ABI.
pub struct DynamicDllModule {
    hmod: HMODULE,
    entry: AdModuleEntryFn,
    meta: AdMetadata,
    state: AdCModuleState,
}

unsafe impl Send for DynamicDllModule {}

impl DynamicDllModule {
    pub fn load(path: &Path) -> Option<Self> {
        let mut wide: Vec<u16> = path.as_os_str().to_string_lossy().encode_utf16().collect();
        wide.push(0);
        unsafe {
            let hmod = LoadLibraryW(wide.as_ptr());
            if hmod.is_null() {
                return None;
            }
            let entry_sym = CString::new("ad_module_entry_v1").ok()?;
            let meta_sym = CString::new("ad_module_metadata_v1").ok()?;
            let entry_ptr = GetProcAddress(hmod, entry_sym.as_ptr() as *const u8);
            let meta_ptr = GetProcAddress(hmod, meta_sym.as_ptr() as *const u8);
            let (Some(ep), Some(mp)) = (entry_ptr, meta_ptr) else {
                FreeLibrary(hmod);
                return None;
            };
            let entry: AdModuleEntryFn = std::mem::transmute(ep);
            let meta_fn: AdModuleMetaFn = std::mem::transmute(mp);
            let cmeta = meta_fn();
            if cmeta.abi_version != 1 {
                FreeLibrary(hmod);
                return None;
            }
            let read_cstr = |p: *const c_char| -> String {
                if p.is_null() {
                    String::new()
                } else {
                    CStr::from_ptr(p).to_string_lossy().into_owned()
                }
            };
            let filename = path
                .file_name()
                .map(|s| s.to_string_lossy().into_owned())
                .unwrap_or_else(|| "PLUGIN.DLL".to_string());
            let name = read_cstr(cmeta.name);
            let id = format!(
                "dll_{}",
                filename
                    .to_ascii_lowercase()
                    .trim_end_matches(".dll")
            );
            let meta = AdMetadata {
                id,
                filename,
                name: if name.is_empty() {
                    "External Module".to_string()
                } else {
                    name
                },
                credit: read_cstr(cmeta.credit),
                about: read_cstr(cmeta.about),
                controls: [
                    AdControl::None,
                    AdControl::None,
                    AdControl::None,
                    AdControl::None,
                ],
                target_frame_ms: cmeta.target_frame_ms.max(16),
            };
            Some(Self {
                hmod,
                entry,
                meta,
                state: AdCModuleState {
                    abi_version: 1,
                    screen_width: 0,
                    screen_height: 0,
                    rgn_width: 0,
                    rgn_height: 0,
                    bits_per_pixel: 32,
                    saver_mode: 0,
                    control_value: [0; 4],
                    elapsed_ms: 0,
                    user_data: std::ptr::null_mut(),
                },
            })
        }
    }

    fn dispatch(&mut self, msg: c_int, ctx: &mut AdContext<'_>) -> AdResult {
        self.state.screen_width = ctx.system.screen_width;
        self.state.screen_height = ctx.system.screen_height;
        self.state.rgn_width = ctx.module.rgn_width;
        self.state.rgn_height = ctx.module.rgn_height;
        self.state.bits_per_pixel = ctx.system.bits_per_pixel;
        self.state.saver_mode = ctx.system.saver_mode as c_int;
        self.state.control_value = ctx.module.control_value;
        self.state.elapsed_ms = ctx.elapsed_ms;
        let code = unsafe { (self.entry)(msg, ctx.surface.hdc(), &mut self.state) };
        match code {
            RET_NOERROR => AdResult::NoError,
            RET_MEM_ERROR => AdResult::MemError,
            RET_RESTART_ME => AdResult::RestartMe,
            RET_WAKE_UP => AdResult::WakeUp,
            RET_HSV_PAL => AdResult::PaletteRequest(crate::palette::AdPaletteKind::Hsv),
            RET_RGB_PAL => AdResult::PaletteRequest(crate::palette::AdPaletteKind::Rgb),
            RET_WHITE_PAL => AdResult::PaletteRequest(crate::palette::AdPaletteKind::White),
            RET_PRIMARY_PAL => AdResult::PaletteRequest(crate::palette::AdPaletteKind::Primary),
            _ => AdResult::NoError,
        }
    }
}

impl AdModule for DynamicDllModule {
    fn metadata(&self) -> AdMetadata {
        self.meta.clone()
    }

    fn do_pre_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.dispatch(MSG_PREINITIALIZE, ctx)
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.dispatch(MSG_INITIALIZE, ctx)
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.dispatch(MSG_BLANK, ctx)
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.dispatch(MSG_DRAWFRAME, ctx)
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.dispatch(MSG_CLOSE, ctx)
    }
}

impl Drop for DynamicDllModule {
    fn drop(&mut self) {
        unsafe {
            if !self.hmod.is_null() {
                FreeLibrary(self.hmod);
            }
        }
    }
}
