//! Modernized Win64 port of Berkeley Systems' `ADMODULE.SDK\BLANKER\BLANKER.C` (1991).
//!
//! Demonstrates BOTH:
//! 1. Implementing the Rust `ad_sdk::AdModule` trait
//! 2. Exporting a Win64 C-ABI `.dll` plugin (`ad_module_entry_v1` / `ad_module_metadata_v1`)
//!    mirroring `MODULE.C`'s `Module(iMessage, hDrawDC, hADSystem)` entry point.

use std::ffi::c_int;

use ad_sdk::ffi::{
    AdCMetadata, AdCModuleState, MSG_BLANK, MSG_CLOSE, MSG_DRAWFRAME, MSG_INITIALIZE,
    MSG_PREINITIALIZE, RET_NOERROR,
};
use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};
use windows_sys::Win32::Foundation::RECT;
use windows_sys::Win32::Graphics::Gdi::{BLACK_BRUSH, FillRect, GetStockObject, HBRUSH, HDC};

pub struct BlankerModule;

impl BlankerModule {
    pub fn new() -> Self {
        Self
    }
}

impl Default for BlankerModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for BlankerModule {
    fn metadata(&self) -> AdMetadata {
        AdMetadata {
            id: "blanker".to_string(),
            filename: "BLANKER.AD".to_string(),
            name: "Blanker".to_string(),
            credit: "Blanker by Bill Stewart.\r\n  ©1990 Berkeley Systems Inc.".to_string(),
            about: "BLANKER.\r\n\r\nNo snazzy graphics, all it does is blank your screen."
                .to_string(),
            controls: [
                AdControl::None,
                AdControl::None,
                AdControl::None,
                AdControl::None,
            ],
            target_frame_ms: 100,
        }
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.surface.fill_black();
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, _ctx: &mut AdContext<'_>) -> AdResult {
        AdResult::NoError
    }
}

// ============================================================================
// Modernized Win64 C-ABI DLL Exports (1:1 successor to MODULE.C / BLANKER.DEF)
// ============================================================================

#[unsafe(no_mangle)]
pub unsafe extern "C" fn ad_module_metadata_v1() -> AdCMetadata {
    AdCMetadata {
        abi_version: 1,
        name: c"Blanker (SDK Sample DLL)".as_ptr(),
        credit: c"Blanker by Bill Stewart.\r\n  \xA91990 Berkeley Systems Inc.".as_ptr(),
        about: c"BLANKER.\r\n\r\nNo snazzy graphics, all it does is blank your screen.".as_ptr(),
        target_frame_ms: 100,
    }
}

#[unsafe(no_mangle)]
pub unsafe extern "C" fn ad_module_entry_v1(
    message: c_int,
    hdc: HDC,
    state: *mut AdCModuleState,
) -> c_int {
    if state.is_null() {
        return RET_NOERROR;
    }
    let st = unsafe { &*state };
    match message {
        MSG_PREINITIALIZE | MSG_INITIALIZE | MSG_DRAWFRAME | MSG_CLOSE => RET_NOERROR,
        MSG_BLANK => {
            if !hdc.is_null() {
                let rc = RECT {
                    left: 0,
                    top: 0,
                    right: st.rgn_width,
                    bottom: st.rgn_height,
                };
                unsafe {
                    FillRect(hdc, &rc, GetStockObject(BLACK_BRUSH) as HBRUSH);
                }
            }
            RET_NOERROR
        }
        _ => RET_NOERROR,
    }
}
