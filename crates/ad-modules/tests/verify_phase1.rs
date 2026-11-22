//! Comprehensive Phase 1 verification & visual snapshot rendering test.
//!
//! Verifies:
//! 1. Original 1991 `AD_PREFS.INI` and `RANDOM.ADS` parsing & roundtrip fidelity
//! 2. All 4 built-in 235-entry palettes (`HSV_PAL`, `RGB_PAL`, `WHITE_PAL`, `PRIMARY_PAL`)
//! 3. Exact 1:1 `AD.EXE` SEG 13 slider value mapping formulas
//! 4. Dynamic loading & execution of the Win64 C-ABI `ad_blanker_sdk_example.dll`
//! 5. Multi-frame Win32 GDI rendering of Flying Toasters, Starry Night, Nocturnes,
//!    Clocks (Modern, Antique, Digital), and Randomizer, exporting `.bmp` frames for visual inspection.

use std::collections::BTreeMap;
use std::fs;
use std::path::{Path, PathBuf};

use ad_modules::clocks::ClocksModule;
use ad_modules::nocturne::NocturneModule;
use ad_modules::randomizer::RandomizerModule;
use ad_modules::starry::StarryNightModule;
use ad_modules::toasters::ToastersModule;
use ad_sdk::canvas::AdSurface;
use ad_sdk::ffi::DynamicDllModule;
use ad_sdk::palette::{AdPalette, AdPaletteKind};
use ad_sdk::prefs::{AdPrefs, ScreenCorner, load_random_ads};
use ad_sdk::sound::AdSound;
use ad_sdk::{AdContext, AdModule, AdModuleParams, AdSystem, MsvcRand, SaverMode};

fn workspace_root() -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR"))
        .parent()
        .unwrap()
        .parent()
        .unwrap()
        .to_path_buf()
}

fn write_surface_bmp(surface: &AdSurface, path: &Path) {
    let w = surface.width as u32;
    let h = surface.height as u32;
    let row_bytes = w * 3;
    let pad = (4 - (row_bytes % 4)) % 4;
    let img_size = (row_bytes + pad) * h;
    let file_size = 54 + img_size;

    let mut out = Vec::with_capacity(file_size as usize);
    out.extend_from_slice(b"BM");
    out.extend_from_slice(&file_size.to_le_bytes());
    out.extend_from_slice(&0u32.to_le_bytes());
    out.extend_from_slice(&54u32.to_le_bytes());
    out.extend_from_slice(&40u32.to_le_bytes());
    out.extend_from_slice(&(w as i32).to_le_bytes());
    out.extend_from_slice(&(h as i32).to_le_bytes());
    out.extend_from_slice(&1u16.to_le_bytes());
    out.extend_from_slice(&24u16.to_le_bytes());
    out.extend_from_slice(&0u32.to_le_bytes());
    out.extend_from_slice(&img_size.to_le_bytes());
    out.extend_from_slice(&2835u32.to_le_bytes());
    out.extend_from_slice(&2835u32.to_le_bytes());
    out.extend_from_slice(&0u32.to_le_bytes());
    out.extend_from_slice(&0u32.to_le_bytes());

    let pixels = surface.pixels();
    for y in (0..h as usize).rev() {
        for x in 0..w as usize {
            let p = pixels[y * (w as usize) + x];
            out.push((p & 0xFF) as u8);         // B
            out.push(((p >> 8) & 0xFF) as u8);  // G
            out.push(((p >> 16) & 0xFF) as u8); // R
        }
        for _ in 0..pad {
            out.push(0);
        }
    }
    fs::write(path, out).expect("write bmp");
}

fn non_black_pixels(surface: &AdSurface) -> usize {
    surface
        .pixels()
        .iter()
        .filter(|&&p| (p & 0x00FF_FFFF) != 0)
        .count()
}

fn render_module_snapshot(
    module: &mut dyn AdModule,
    raw_overrides: Option<[i32; 4]>,
    frames: usize,
    step_ms: u64,
    seed: u32,
    out_bmp: &Path,
) -> usize {
    let w = 640;
    let h = 480;
    let mut surface = AdSurface::new(w, h).expect("create AdSurface");
    let meta = module.metadata();
    let mut system = AdSystem::new(w, h, SaverMode::Saver);
    system.sound_enabled = false;
    let mut params = AdModuleParams::new(w, h, &meta.controls);
    if let Some(ov) = raw_overrides {
        for i in 0..4 {
            params.set_raw_value(i, ov[i], &meta.controls);
        }
    }
    let sound = AdSound::new();
    let mut rng = MsvcRand::new(seed);

    {
        let mut ctx = AdContext {
            system: &mut system,
            module: &mut params,
            surface: &mut surface,
            sound: &sound,
            rng: &mut rng,
            elapsed_ms: 0,
        };
        let _ = module.do_pre_initialize(&mut ctx);
        let _ = module.do_initialize(&mut ctx);
        let _ = module.do_blank(&mut ctx);
    }

    for f in 1..=frames {
        let mut ctx = AdContext {
            system: &mut system,
            module: &mut params,
            surface: &mut surface,
            sound: &sound,
            rng: &mut rng,
            elapsed_ms: (f as u64) * step_ms,
        };
        let _ = module.do_draw_frame(&mut ctx);
    }

    let lit = non_black_pixels(&surface);
    write_surface_bmp(&surface, out_bmp);

    {
        let mut ctx = AdContext {
            system: &mut system,
            module: &mut params,
            surface: &mut surface,
            sound: &sound,
            rng: &mut rng,
            elapsed_ms: (frames as u64) * step_ms,
        };
        let _ = module.do_close(&mut ctx);
    }
    lit
}

#[test]
fn verify_original_1991_prefs_and_random_ads() {
    let root = workspace_root();
    let prefs = AdPrefs::load_from_file(&root.join("assets/AD_PREFS.INI"));
    assert!(prefs.screen_saver_on);
    assert_eq!(prefs.timeout_minutes, 5);
    assert_eq!(prefs.sleep_corner, ScreenCorner::BottomLeft);
    assert_eq!(prefs.wake_corner, ScreenCorner::BottomRight);
    assert!(prefs.no_corners);
    assert_eq!(prefs.hotkey_vk, 83);
    assert!(prefs.hotkey_ctrl);
    assert!(prefs.hotkey_shift);
    assert!(prefs.hotkey_enabled);

    let rads = load_random_ads(&root.join("assets/RANDOM.ADS"));
    assert_eq!(rads.len(), 6);
    assert_eq!(rads[0].module_name, "Flying Toasters");
    assert_eq!(rads[0].filename, "TOASTERS.AD");
    assert_eq!(rads[4].module_name, "Starry Night");
    assert_eq!(rads[4].filename, "AD.EXE");
}

#[test]
fn verify_palettes_and_slider_mapping() {
    for kind in [
        AdPaletteKind::Hsv,
        AdPaletteKind::Rgb,
        AdPaletteKind::White,
        AdPaletteKind::Primary,
    ] {
        let pal = AdPalette::build(kind);
        assert_eq!(pal.entries.len(), 235);
    }

    // Verify exact AD.EXE SEG 13 slider mapping for Flying Toasters default (raw=77 -> 10 objects)
    let tmeta = ToastersModule::static_metadata();
    assert_eq!(tmeta.controls[0].map_raw_to_module_value(77), 10);
    assert_eq!(tmeta.controls[0].map_raw_to_module_value(0), 1);
    assert_eq!(tmeta.controls[0].map_raw_to_module_value(100), 12);

    // Verify exact Starry Night Lightning thresholds (raw=51 -> 40 "Sometimes")
    let smeta = StarryNightModule::static_metadata();
    assert_eq!(smeta.controls[3].map_raw_to_module_value(51), 40);
    assert_eq!(smeta.controls[3].format_display_value(51), "Sometimes");
}

#[test]
fn verify_phase1_module_renders_and_dll_plugin() {
    let root = workspace_root();
    let snap_dir = root.join("target/verify_snapshots");
    fs::create_dir_all(&snap_dir).unwrap();

    // 1. Flying Toasters (default 10 objects, Light toast)
    let mut toasters = ToastersModule::new();
    let lit = render_module_snapshot(
        &mut toasters,
        Some([77, 33, 0, 0]),
        110,
        33,
        1234,
        &snap_dir.join("01_toasters.bmp"),
    );
    assert!(lit > 4000, "Flying Toasters drew too few pixels: {lit}");

    // 2. Starry Night (Stormy lightning, 45 buildings, 38% height)
    let mut starry = StarryNightModule::new();
    let lit = render_module_snapshot(
        &mut starry,
        Some([45, 38, 0, 95]),
        900,
        25,
        42,
        &snap_dir.join("02_starry_night.bmp"),
    );
    assert!(lit > 500, "Starry Night drew too few pixels: {lit}");

    // 3. Nocturnes (Color ON, Lots density, advance across 12 seconds so multiple eyes open)
    let mut nocturne = NocturneModule::new();
    let lit = render_module_snapshot(
        &mut nocturne,
        Some([0, 0, 1, 100]),
        300,
        40,
        777,
        &snap_dir.join("03_nocturnes.bmp"),
    );
    assert!(lit > 200, "Nocturnes drew too few pixels: {lit}");

    // 4. Clocks — Modern, Antique, Digital
    let mut clk_mod = ClocksModule::new();
    let lit = render_module_snapshot(
        &mut clk_mod,
        Some([0, 50, 1, 0]),
        80,
        28,
        10,
        &snap_dir.join("04_clocks_modern.bmp"),
    );
    assert!(lit > 5000, "Clocks Modern drew too few pixels: {lit}");

    let mut clk_ant = ClocksModule::new();
    let lit = render_module_snapshot(
        &mut clk_ant,
        Some([1, 50, 1, 0]),
        80,
        28,
        10,
        &snap_dir.join("05_clocks_antique.bmp"),
    );
    assert!(lit > 5000, "Clocks Antique drew too few pixels: {lit}");

    let mut clk_dig = ClocksModule::new();
    let lit = render_module_snapshot(
        &mut clk_dig,
        Some([2, 50, 1, 0]),
        80,
        28,
        10,
        &snap_dir.join("06_clocks_digital.bmp"),
    );
    assert!(lit > 1500, "Clocks Digital drew too few pixels: {lit}");

    // 5. Randomizer
    let mut rand_mod = RandomizerModule::new(
        vec!["toasters".into(), "starry".into(), "clocks".into()],
        BTreeMap::new(),
    );
    let lit = render_module_snapshot(
        &mut rand_mod,
        Some([1, 10, 1, 0]),
        150,
        25,
        99,
        &snap_dir.join("07_randomizer.bmp"),
    );
    assert!(lit > 200, "Randomizer drew too few pixels: {lit}");

    // 6. Verify dynamic Win64 C-ABI DLL plugin (`ad_blanker_sdk_example.dll`) if built
    for profile in ["debug", "release"] {
        let dll_path = root
            .join("target")
            .join(profile)
            .join("ad_blanker_sdk_example.dll");
        if dll_path.exists() {
            let mut dll_mod = DynamicDllModule::load(&dll_path).expect("load Blanker SDK DLL");
            assert!(dll_mod.metadata().name.contains("Blanker"));
            let lit = render_module_snapshot(
                &mut dll_mod,
                None,
                5,
                50,
                1,
                &snap_dir.join("08_blanker_dll.bmp"),
            );
            assert_eq!(lit, 0, "Blanker DLL should produce solid black screen");
            break;
        }
    }
}
