//! Exact 1:1 decompilation of After Dark 1.0a's built-in **Randomizer** module
//! (`AD.EXE`, `SEG 16`, by Bill Stewart based on original concept by Patrick Beard, ©1990 Berkeley Systems Inc.).

use std::collections::BTreeMap;

use ad_sdk::palette::AdPalette;
use ad_sdk::{
    AdContext, AdControl, AdMetadata, AdModule, AdModuleParams, AdResult, ModuleRunner,
};

use crate::create_module_by_id;

/// Duration slider threshold -> seconds mapping from `AD.EXE` `16:01A4..16:0224`.
pub fn randomizer_duration_secs(mapped_val: i32) -> u64 {
    match mapped_val {
        0 | 10 => 1,      // "short"
        20 => 5,          // "5 sec"
        30 => 10,         // "10 sec"
        40 => 20,         // "20 sec"
        50 => 30,         // "30 sec"
        60 => 60,         // "1 min"
        70 => 120,        // "2 min"
        80 => 300,        // "5 min"
        90 => 1800,       // "30 min"
        100 => 3600,      // "1 module" (effectively holds 1 module for session)
        _ => 20,
    }
}

pub struct RandomizerModule {
    pool: Vec<String>,
    per_module_controls: BTreeMap<String, [i32; 4]>,
    order_sequential: bool,
    duration_secs: u64,
    one_module_per_session: bool,
    clear_screen: bool,
    current_idx: usize,
    active_child: Option<Box<dyn AdModule>>,
    child_params: Option<AdModuleParams>,
    last_switch_ms: u64,
    child_frame_ms: u64,
    last_child_frame_ms: u64,
}

impl RandomizerModule {
    pub fn new(pool: Vec<String>, per_module_controls: BTreeMap<String, [i32; 4]>) -> Self {
        let filtered: Vec<String> = pool
            .into_iter()
            .filter(|id| id != "randomizer")
            .collect();
        let pool = if filtered.is_empty() {
            vec![
                "toasters".to_string(),
                "starry".to_string(),
                "clocks".to_string(),
                "nocturne".to_string(),
            ]
        } else {
            filtered
        };
        Self {
            pool,
            per_module_controls,
            order_sequential: false,
            duration_secs: 10,
            one_module_per_session: false,
            clear_screen: false,
            current_idx: 0,
            active_child: None,
            child_params: None,
            last_switch_ms: 0,
            child_frame_ms: 30,
            last_child_frame_ms: 0,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "randomizer".to_string(),
            filename: "AD.EXE".to_string(),
            name: "Randomizer".to_string(),
            credit: "Randomizer by Bill Stewart.\r\n  ©1990 Berkeley Systems Inc.".to_string(),
            about: "RANDOMIZER (tm)\r\n\r\nBased on original concept by Patrick Beard.\r\n\r\nRandomizer lets you select any number of modules and have them displayed in random or sequential order.\r\n\r\nUse the \"Choose..\" button to select the modules to be randomized.\r\n\r\nThe duration for the selected modules can be varied from short (1 sec) to 1 module (a different module each time After Dark engages).\r\n\r\nIf you check the \"Clear Screen\" check box, the screen is blanked between each module."
                .to_string(),
            controls: [
                AdControl::Menu {
                    title: "Order:".to_string(),
                    default_index: 0,
                    choices: vec!["Random".into(), "In Order".into()],
                },
                AdControl::LabeledSlider {
                    title: "Duration:".to_string(),
                    default_raw: 28,
                    labels: vec![
                        "short".into(),
                        "5 sec".into(),
                        "10 sec".into(),
                        "20 sec".into(),
                        "30 sec".into(),
                        "1 min".into(),
                        "2 min".into(),
                        "5 min".into(),
                        "30 min".into(),
                        "1 module".into(),
                    ],
                    thresholds: vec![10, 20, 30, 40, 50, 60, 70, 80, 90, 100],
                },
                AdControl::Checkbox {
                    title: "Clear Screen".to_string(),
                    default_checked: false,
                },
                AdControl::Button {
                    title: "Choose..".to_string(),
                },
            ],
            target_frame_ms: 16,
        }
    }

    fn close_child(&mut self, ctx: &mut AdContext<'_>) {
        if let (Some(mut child), Some(mut params)) =
            (self.active_child.take(), self.child_params.take())
        {
            let mut cctx = AdContext {
                system: ctx.system,
                module: &mut params,
                surface: ctx.surface,
                sound: ctx.sound,
                rng: ctx.rng,
                elapsed_ms: ctx.elapsed_ms,
            };
            let _ = child.do_close(&mut cctx);
        }
    }

    fn switch_to_next(&mut self, ctx: &mut AdContext<'_>, first: bool) {
        self.close_child(ctx);

        if self.clear_screen {
            ctx.surface.fill_black();
        }

        let n = self.pool.len();
        if n == 0 {
            return;
        }
        if n == 1 {
            self.current_idx = 0;
        } else if !self.order_sequential {
            // Exact AD.EXE 16:0622: pick random index != current_idx (unless first)
            let prev = self.current_idx;
            let mut next = ctx.rng.rand_mod(n as i32) as usize;
            if !first {
                while next == prev {
                    next = ctx.rng.rand_mod(n as i32) as usize;
                }
            }
            self.current_idx = next;
        } else if first {
            self.current_idx = 0;
        } else {
            self.current_idx = (self.current_idx + 1) % n;
        }

        let id = &self.pool[self.current_idx];
        let Some(mut child) = create_module_by_id(id, &[], &self.per_module_controls) else {
            return;
        };
        let meta = child.metadata();
        let mut params = AdModuleParams::new(
            ctx.module.rgn_width,
            ctx.module.rgn_height,
            &meta.controls,
        );
        if let Some(saved) = self.per_module_controls.get(id) {
            for slot in 0..4 {
                params.set_raw_value(slot, saved[slot], &meta.controls);
            }
        }

        let old_runner = ctx.system.runner;
        ctx.system.runner = ModuleRunner::Randomizer;
        {
            let mut cctx = AdContext {
                system: ctx.system,
                module: &mut params,
                surface: ctx.surface,
                sound: ctx.sound,
                rng: ctx.rng,
                elapsed_ms: ctx.elapsed_ms,
            };
            let _ = child.do_pre_initialize(&mut cctx);
            if let AdResult::PaletteRequest(kind) = child.do_initialize(&mut cctx) {
                cctx.module.palette = Some(AdPalette::build(kind));
            }
            if first || self.clear_screen {
                if let AdResult::PaletteRequest(kind) = child.do_blank(&mut cctx) {
                    cctx.module.palette = Some(AdPalette::build(kind));
                }
            }
        }
        ctx.system.runner = old_runner;

        self.child_frame_ms = meta.target_frame_ms.max(15) as u64;
        self.last_switch_ms = ctx.elapsed_ms;
        self.last_child_frame_ms = 0;
        self.active_child = Some(child);
        self.child_params = Some(params);
    }
}

impl AdModule for RandomizerModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.order_sequential = ctx.module.control_value[0] != 0;
        let dur_val = ctx.module.control_value[1];
        self.duration_secs = randomizer_duration_secs(dur_val);
        self.one_module_per_session = dur_val >= 100;
        self.clear_screen = ctx.module.control_value[2] != 0;

        if self.clear_screen {
            ctx.surface.fill_black();
        }
        self.switch_to_next(ctx, true);
        AdResult::NoError
    }

    fn do_blank(&mut self, _ctx: &mut AdContext<'_>) -> AdResult {
        // Already blanked via first child in DoInitialize (matching AD.EXE 16:0238)
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        if self.pool.len() > 1
            && !self.one_module_per_session
            && ctx.elapsed_ms.saturating_sub(self.last_switch_ms) >= self.duration_secs * 1000
        {
            self.switch_to_next(ctx, false);
        }

        if let (Some(child), Some(params)) =
            (self.active_child.as_mut(), self.child_params.as_mut())
        {
            if !ctx.system.authentic_timing
                || ctx.elapsed_ms.saturating_sub(self.last_child_frame_ms) >= self.child_frame_ms
            {
                self.last_child_frame_ms = ctx.elapsed_ms;
                let old_runner = ctx.system.runner;
                ctx.system.runner = ModuleRunner::Randomizer;
                let res = {
                    let mut cctx = AdContext {
                        system: ctx.system,
                        module: params,
                        surface: ctx.surface,
                        sound: ctx.sound,
                        rng: ctx.rng,
                        elapsed_ms: ctx.elapsed_ms,
                    };
                    child.do_draw_frame(&mut cctx)
                };
                ctx.system.runner = old_runner;
                return res;
            }
        }
        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.close_child(ctx);
        AdResult::NoError
    }
}
