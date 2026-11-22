//! 1:1 Decompiled After Dark 1.0a (1991) Screensaver Modules.
//!
//! Phase 1 includes:
//! - **Flying Toasters** (`TOASTERS.AD`, exact 1:1 decompilation + original 12 BMPs)
//! - **Starry Night** (`AD.EXE SEG 2`, exact 1:1 decompilation)
//! - **Clocks** (`CLOCKS.AD`, exact 1:1 decompilation + original 14 BMPs + PC-speaker sound)
//! - **Nocturnes** (`NOCTURNE.AD`, exact 1:1 decompilation + original 102×80 EYES sprite sheet)
//! - **Randomizer** (`AD.EXE SEG 16`, exact 1:1 decompilation + `RANDOM.ADS` compatibility)
//! - **Blanker** (`ADMODULE.SDK\BLANKER`, modernized Win64 SDK sample)

pub mod aqua;
pub mod clocks;
pub mod draino;
pub mod fade;
pub mod geobounce;
pub mod globe;
pub mod grafstat;
pub mod grav;
pub mod laser;
pub mod logo;
pub mod magic;
pub mod message;
pub mod mondrian;
pub mod mountain;
pub mod nocturne;
pub mod punch;
pub mod puzzle;
pub mod rain;
pub mod rainstor;
pub mod randomizer;
pub mod rose;
pub mod satori;
pub mod sgyra;
pub mod shapes;
pub mod slidesho;
pub mod spheres;
pub mod spotlite;
pub mod stained;
pub mod starry;
pub mod string_theory;
pub mod toasters;
pub mod vertigo;
pub mod warp;
pub mod worms;
pub mod wrap;
pub mod zot;

use std::collections::BTreeMap;
use std::path::{Path, PathBuf};

use ad_blanker_sdk_example::BlankerModule;
use ad_sdk::ffi::DynamicDllModule;
use ad_sdk::{AdMetadata, AdModule};

use aqua::AquaticRealmModule;
use clocks::ClocksModule;
use draino::DrainoModule;
use fade::FadeAwayModule;
use geobounce::GeoBounceModule;
use globe::GlobeModule;
use grafstat::GraphStatModule;
use grav::GravityModule;
use laser::LaserModule;
use logo::LogoModule;
use magic::MagicModule;
use message::MessagesModule;
use mondrian::MondrianModule;
use mountain::MountainsModule;
use nocturne::NocturneModule;
use punch::PunchOutModule;
use puzzle::PuzzleModule;
use rain::HardRainModule;
use rainstor::RainStormModule;
use randomizer::RandomizerModule;
use rose::RoseModule;
use satori::SatoriModule;
use sgyra::SpiralGyraModule;
use shapes::ShapesModule;
use slidesho::SlideShowModule;
use spheres::SpheresModule;
use spotlite::SpotlightModule;
use stained::StainedGlassModule;
use starry::StarryNightModule;
use string_theory::StringTheoryModule;
use toasters::ToastersModule;
use vertigo::VertigoModule;
use warp::WarpModule;
use worms::WormsModule;
use wrap::WrapAroundModule;
use zot::ZotModule;

/// Descriptor for an available module (built-in decompiled Rust module or external Win64 `.dll`).
#[derive(Debug, Clone)]
pub struct ModuleCatalogEntry {
    pub meta: AdMetadata,
    pub external_dll: Option<PathBuf>,
}

/// Build the full sorted catalog of built-in modules plus any external Win64 SDK `.dll` plugins
/// placed in `plugin_dir`.
pub fn build_catalog(plugin_dir: Option<&Path>) -> Vec<ModuleCatalogEntry> {
    let mut entries = vec![
        ModuleCatalogEntry { meta: AquaticRealmModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: BlankerModule::new().metadata(), external_dll: None },
        ModuleCatalogEntry { meta: ClocksModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: DrainoModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: FadeAwayModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: ToastersModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: GeoBounceModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: GlobeModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: GraphStatModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: GravityModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: HardRainModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: LaserModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: LogoModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: MagicModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: MessagesModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: MondrianModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: MountainsModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: NocturneModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: PunchOutModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: PuzzleModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: RainStormModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: RandomizerModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: RoseModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: SatoriModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: ShapesModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: SlideShowModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: SpheresModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: SpiralGyraModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: SpotlightModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: StainedGlassModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: StarryNightModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: StringTheoryModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: VertigoModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: WarpModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: WormsModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: WrapAroundModule::static_metadata(), external_dll: None },
        ModuleCatalogEntry { meta: ZotModule::static_metadata(), external_dll: None },
    ];

    if let Some(dir) = plugin_dir {
        if let Ok(rd) = std::fs::read_dir(dir) {
            for entry in rd.flatten() {
                let p = entry.path();
                if p.extension()
                    .and_then(|e| e.to_str())
                    .map(|e| e.eq_ignore_ascii_case("dll"))
                    .unwrap_or(false)
                {
                    if let Some(dll_mod) = DynamicDllModule::load(&p) {
                        entries.push(ModuleCatalogEntry {
                            meta: dll_mod.metadata(),
                            external_dll: Some(p),
                        });
                    }
                }
            }
        }
    }

    entries.sort_by(|a, b| a.meta.name.cmp(&b.meta.name));
    entries
}

/// Instantiate a built-in module by its stable ID.
pub fn create_module_by_id(
    id: &str,
    randomizer_pool: &[String],
    per_module_controls: &BTreeMap<String, [i32; 4]>,
) -> Option<Box<dyn AdModule>> {
    match id {
        "3dbounce" => Some(Box::new(GeoBounceModule::new())),
        "aqua" => Some(Box::new(AquaticRealmModule::new())),
        "blanker" => Some(Box::new(BlankerModule::new())),
        "clocks" => Some(Box::new(ClocksModule::new())),
        "draino" => Some(Box::new(DrainoModule::new())),
        "fade" => Some(Box::new(FadeAwayModule::new())),
        "globe" => Some(Box::new(GlobeModule::new())),
        "grafstat" => Some(Box::new(GraphStatModule::new())),
        "grav" => Some(Box::new(GravityModule::new())),
        "laser" => Some(Box::new(LaserModule::new())),
        "logo" => Some(Box::new(LogoModule::new())),
        "magic" => Some(Box::new(MagicModule::new())),
        "message" => Some(Box::new(MessagesModule::new())),
        "mondrian" => Some(Box::new(MondrianModule::new())),
        "mountain" => Some(Box::new(MountainsModule::new())),
        "nocturne" => Some(Box::new(NocturneModule::new())),
        "punch" => Some(Box::new(PunchOutModule::new())),
        "puzzle" => Some(Box::new(PuzzleModule::new())),
        "rain" => Some(Box::new(HardRainModule::new())),
        "rainstor" => Some(Box::new(RainStormModule::new())),
        "randomizer" => Some(Box::new(RandomizerModule::new(
            randomizer_pool.to_vec(),
            per_module_controls.clone(),
        ))),
        "rose" => Some(Box::new(RoseModule::new())),
        "satori" => Some(Box::new(SatoriModule::new())),
        "sgyra" => Some(Box::new(SpiralGyraModule::new())),
        "shapes" => Some(Box::new(ShapesModule::new())),
        "slidesho" => Some(Box::new(SlideShowModule::new())),
        "spheres" => Some(Box::new(SpheresModule::new())),
        "spotlite" => Some(Box::new(SpotlightModule::new())),
        "stained" => Some(Box::new(StainedGlassModule::new())),
        "starry" => Some(Box::new(StarryNightModule::new())),
        "string" => Some(Box::new(StringTheoryModule::new())),
        "toasters" => Some(Box::new(ToastersModule::new())),
        "vertigo" => Some(Box::new(VertigoModule::new())),
        "warp" => Some(Box::new(WarpModule::new())),
        "worms" => Some(Box::new(WormsModule::new())),
        "wrap" => Some(Box::new(WrapAroundModule::new())),
        "zot" => Some(Box::new(ZotModule::new())),
        _ => None,
    }
}

/// Instantiate any module from a catalog entry (built-in or dynamic `.dll`).
pub fn instantiate_entry(
    entry: &ModuleCatalogEntry,
    randomizer_pool: &[String],
    per_module_controls: &BTreeMap<String, [i32; 4]>,
) -> Option<Box<dyn AdModule>> {
    if let Some(ref dll_path) = entry.external_dll {
        return DynamicDllModule::load(dll_path).map(|m| Box::new(m) as Box<dyn AdModule>);
    }
    create_module_by_id(&entry.meta.id, randomizer_pool, per_module_controls)
}
