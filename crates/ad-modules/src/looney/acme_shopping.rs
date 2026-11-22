//! "ACME Home Shopping" — Classic 1995 *Looney Tunes* After Dark 3.0 module.
//!
//! Full-widescreen HD/4K ACME Home Shopping Network broadcast with scaled tiled
//! ACME wallpaper (or live Windows desktop when `Clear Screen First` is unchecked),
//! continuously fitted `512x400` ACME TV studio card, 33 authentic ACME products
//! (`cSTR #12000`), 43 product photos (`RLEP #12002..#12006`), crisp scaled
//! bitmap typography (`#12100`), live inventory & countdowns, `Inflation:` price
//! scaling, red `SOLD OUT` stamp, SFX, and the *ACME Home Shopping* MIDI theme.

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::looney::{
    ACME_SFX, MOD_ACME, SONG_ACME, draw_looney_text_f, load_anim, load_multi_rlep, load_rlep,
    looney_pack, wrap_looney_text_f,
};
use crate::simpsons::{
    CompoundAnim, KIND_CSTR, RlepBank, draw_line_px, mac_roman_to_string, music_loops_from_slider,
    restore_or_clear,
};
use crate::tng::stage_fit;

struct AcmeProduct {
    title: String,
    base_price: i32,
    desc: String,
}

pub struct AcmeShoppingModule {
    duration_raw: i32,
    inflation_raw: i32,
    clear_first: bool,
    music_raw: i32,
    saved_bg: Vec<u32>,
    bank: Option<RlepBank>,
    font: Option<RlepBank>,
    layout: Option<CompoundAnim>,
    products: Vec<AcmeProduct>,
    slogans: Vec<String>,
    cur_prod: usize,
    cur_slogan: usize,
    tick: u32,
    prod_ticks: u32,
    qty_init: i32,
    qty_left: i32,
    total_sold: i32,
}

impl AcmeShoppingModule {
    pub fn new() -> Self {
        Self {
            duration_raw: 40,
            inflation_raw: 50,
            clear_first: true,
            music_raw: 25,
            saved_bg: Vec::new(),
            bank: None,
            font: None,
            layout: None,
            products: Vec::new(),
            slogans: Vec::new(),
            cur_prod: 0,
            cur_slogan: 0,
            tick: 0,
            prod_ticks: 0,
            qty_init: 120,
            qty_left: 84,
            total_sold: 1420,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "looney_acme_shopping".to_string(),
            name: "ACME Home Shopping".to_string(),
            filename: "ACMESHOP.AD".to_string(),
            credit: "By Tom W., Laura T., Peter K. & Maury Z.\nSoftware © 1995 Berkeley Systems, Inc.\nLooney Tunes ™ & © Warner Bros.".to_string(),
            about: "Going, going, gone… Everything must go! Tune in to the ACME Home Shopping Network for all your anvil, catapult, and rocket-powered roller skate needs.".to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "Duration:".to_string(),
                    default_raw: 40,
                    labels: vec!["Short".into(), "Medium".into(), "Long".into()],
                    thresholds: vec![0, 33, 66],
                },
                AdControl::LabeledSlider {
                    title: "Inflation:".to_string(),
                    default_raw: 50,
                    labels: vec!["Low".into(), "Normal".into(), "High".into(), "Hyper".into()],
                    thresholds: vec![0, 25, 50, 75],
                },
                AdControl::Checkbox {
                    title: "Clear Screen First".to_string(),
                    default_checked: true,
                },
                AdControl::LabeledSlider {
                    title: "Music:".to_string(),
                    default_raw: 25,
                    labels: vec![
                        "Never".into(),
                        "Once".into(),
                        "Twice".into(),
                        "Thrice".into(),
                        "Always".into(),
                    ],
                    thresholds: vec![0, 20, 40, 60, 80],
                },
            ],
            target_frame_ms: 68,
        }
    }

    fn ensure_loaded(&mut self) {
        if self.bank.is_none() {
            self.bank = Some(load_multi_rlep(
                MOD_ACME,
                &[12000, 12001, 12002, 12003, 12004, 12005, 12006],
            ));
        }
        if self.font.is_none() {
            self.font = Some(load_rlep(MOD_ACME, 12100));
        }
        if self.layout.is_none() {
            self.layout = Some(load_anim(MOD_ACME, 12000));
        }
        if self.products.is_empty() {
            if let Some(raw) = looney_pack()
                .get(MOD_ACME, KIND_CSTR, 12000)
                .or_else(|| looney_pack().get(MOD_ACME, 7, 12000))
            {
                let txt = mac_roman_to_string(raw);
                for block in txt.split("\r\r") {
                    let b = block.trim();
                    if b.is_empty() || b.starts_with("//") {
                        continue;
                    }
                    let lines: Vec<&str> = b
                        .lines()
                        .flat_map(|l| l.split('\r'))
                        .map(|s| s.trim())
                        .filter(|s| !s.is_empty() && !s.starts_with("//"))
                        .collect();
                    if lines.len() >= 3 {
                        let title = lines[0].to_string();
                        let base_price = lines[1].parse::<i32>().unwrap_or(99).max(5);
                        let desc = lines[2..].join(" ");
                        self.products.push(AcmeProduct {
                            title,
                            base_price,
                            desc,
                        });
                    }
                }
            }
        }
        if self.slogans.is_empty() {
            if let Some(raw) = looney_pack()
                .get(MOD_ACME, KIND_CSTR, 12020)
                .or_else(|| looney_pack().get(MOD_ACME, 7, 12020))
            {
                let txt = mac_roman_to_string(raw);
                for block in txt.split("\r\r") {
                    let b = block.trim();
                    if b.is_empty() || b.starts_with("//") {
                        continue;
                    }
                    let clean = b.split_whitespace().collect::<Vec<_>>().join(" ");
                    if !clean.is_empty() {
                        self.slogans.push(clean);
                    }
                }
            }
        }
    }
}

impl Default for AcmeShoppingModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for AcmeShoppingModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();
        self.saved_bg = ctx.surface.pixels().to_vec();
        self.duration_raw = ctx.module.raw_control_value[0].clamp(0, 100);
        self.inflation_raw = ctx.module.raw_control_value[1].clamp(0, 100);
        self.clear_first = ctx.module.raw_control_value[2] != 0;
        self.music_raw = ctx.module.raw_control_value[3].clamp(0, 100);
        self.tick = 0;
        self.prod_ticks = 0;
        self.cur_prod = 0;
        self.cur_slogan = 0;
        self.qty_init = 120;
        self.qty_left = 84;
        restore_or_clear(ctx.surface, &self.saved_bg, self.clear_first, 0x0008_1018);

        if let Some(loops) = music_loops_from_slider(self.music_raw) {
            looney_pack().play_music(ctx.sound, ctx.system.sound_enabled, SONG_ACME, loops);
        }
        looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, ACME_SFX[0]);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        restore_or_clear(ctx.surface, &self.saved_bg, self.clear_first, 0x0008_1018);
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();
        self.tick = self.tick.wrapping_add(1);
        self.prod_ticks = self.prod_ticks.wrapping_add(1);

        let cycle_ticks = (90 + (self.duration_raw as u32) * 2).max(90);
        if self.prod_ticks >= cycle_ticks {
            self.prod_ticks = 0;
            if !self.products.is_empty() {
                self.cur_prod = (self.cur_prod + 1) % self.products.len();
            }
            if !self.slogans.is_empty() {
                self.cur_slogan = (self.cur_slogan + 1) % self.slogans.len();
            }
            self.qty_init = 60 + ctx.rng.rand_mod(180);
            self.qty_left = self.qty_init;
            looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, ACME_SFX[0]);
        } else if self.prod_ticks % 4 == 0 && self.qty_left > 0 {
            let sold = 1 + ctx.rng.rand_mod(5);
            self.qty_left = (self.qty_left - sold).max(0);
            self.total_sold += sold;
            if self.qty_left == 0 {
                looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, ACME_SFX[1]);
            }
        }

        let w = ctx.surface.width;
        let h = ctx.surface.height;

        let (Some(bank), Some(font), Some(layout)) = (&self.bank, &self.font, &self.layout) else {
            return AdResult::NoError;
        };

        let pad = (h / 34).clamp(8, 28);
        let (sf, ox_f, oy_f) = stage_fit(w, h, 512.0, 400.0, pad, pad);
        let sx = |x: f32| (ox_f + x * sf).round() as i32;
        let sy = |y: f32| (oy_f + y * sf).round() as i32;

        // 1. Tiled ACME green/teal background wallpaper (when Clear Screen First is checked)
        //    or overlay cleanly over the real Windows desktop when unchecked!
        if self.clear_first || self.saved_bg.len() != ctx.surface.pixels().len() {
            ctx.surface.pixels_mut().fill(0x0008_1420);
            if let Some(tile) = bank.frames.first() {
                let tile_s = sf.clamp(1.0, 2.5);
                let tw = (tile.w as f32 * tile_s).round().max(32.0) as i32;
                let th = (tile.h as f32 * tile_s).round().max(32.0) as i32;
                let mut ty = 0;
                while ty < h {
                    let mut tx = 0;
                    while tx < w {
                        tile.blit_rect(ctx.surface, tx, ty, tw, th, false, false, false, false);
                        tx += tw;
                    }
                    ty += th;
                }
            }
        } else {
            ctx.surface.pixels_mut().copy_from_slice(&self.saved_bg);
        }

        // 2. Continuously scaled 512x400 ACME Home Shopping TV studio console (`OFst #12000` frame 8)
        layout.draw_stage_frame_f(ctx.surface, 8, ox_f, oy_f, sf, false, false);

        // 3. Operator Standing By seal badge (`w2=28`, 136x136) in lower-left panel
        if let Some(seal) = bank.frames.get(28) {
            seal.blit_transformed_f(ctx.surface, sx(12.0), sy(216.0), sf, false, false, true, false);
        }

        // 4. Product photograph (`w2=29..71`, 228x171) + drop shadow (`w2=16`)
        if let Some(shadow) = bank.frames.get(16) {
            shadow.blit_transformed_f(ctx.surface, sx(281.0), sy(27.0), sf, false, false, false, false);
        }
        let photo_count = bank.frames.len().saturating_sub(29).max(1);
        let photo_idx = 29 + (self.cur_prod % photo_count);
        if let Some(photo) = bank.frames.get(photo_idx) {
            photo.blit_transformed_f(ctx.surface, sx(279.0), sy(24.0), sf, false, false, true, false);
        }

        // 5. Product text, prices, inventory, timer, and ordering slogan scaled proportionally!
        if let Some(prod) = self.products.get(self.cur_prod) {
            draw_looney_text_f(ctx.surface, font, &prod.title, sx(12.0), sy(68.0), Some(0xFFE0_40), sf);

            let lines = wrap_looney_text_f(font, &prod.desc, (250.0 * sf).round() as i32, sf);
            for (li, line) in lines.iter().take(7).enumerate() {
                draw_looney_text_f(
                    ctx.surface,
                    font,
                    line,
                    sx(12.0),
                    sy(94.0 + (li as f32) * 17.0),
                    Some(0xFFFF_FF),
                    sf,
                );
            }

            let item_no = format!("#{:04}", 1001 + self.cur_prod * 17);
            draw_looney_text_f(ctx.surface, font, &item_no, sx(373.0), sy(221.0), Some(0xFFE0_40), sf);

            let mult = 1 + (self.inflation_raw / 25);
            let list_str = format!("${}.99", prod.base_price * mult + 50);
            let our_str = format!("${}.99", prod.base_price * mult + 20);
            let pay_str = format!("${}.99", prod.base_price * mult);
            let slash_w = (sf * 2.0).round().max(2.0) as i32;

            draw_looney_text_f(ctx.surface, font, &list_str, sx(432.0), sy(221.0), Some(0xC0D8_F0), sf);
            draw_line_px(ctx.surface, sx(430.0), sy(234.0), sx(496.0), sy(222.0), 0xFF20_20, slash_w);

            draw_looney_text_f(ctx.surface, font, &our_str, sx(432.0), sy(261.0), Some(0xC0D8_F0), sf);
            draw_line_px(ctx.surface, sx(430.0), sy(274.0), sx(496.0), sy(262.0), 0xFF20_20, slash_w);

            draw_looney_text_f(ctx.surface, font, &pay_str, sx(432.0), sy(301.0), Some(0x40FF_60), sf);

            let rem_secs = cycle_ticks.saturating_sub(self.prod_ticks) / 6;
            let time_str = format!("0:{:02}", rem_secs.min(59));
            draw_looney_text_f(ctx.surface, font, &time_str, sx(440.0), sy(341.0), Some(0xFFE0_40), sf);

            draw_looney_text_f(ctx.surface, font, "555-ACME", sx(304.0), sy(254.0), Some(0xFFE0_40), sf);
            let status_txt = if self.qty_left == 0 {
                "SOLD OUT!"
            } else {
                "CALL NOW!"
            };
            draw_looney_text_f(ctx.surface, font, status_txt, sx(304.0), sy(274.0), Some(0xFFFF_FF), sf);
        }

        if let Some(slogan) = self.slogans.get(self.cur_slogan) {
            let short: String = slogan.chars().take(42).collect();
            draw_looney_text_f(ctx.surface, font, &short, sx(12.0), sy(375.0), Some(0xFFFF_FF), sf);
        }
        let qty_str = format!("{:03}", self.qty_left);
        draw_looney_text_f(ctx.surface, font, &qty_str, sx(458.0), sy(375.0), Some(0xFFE0_40), sf);

        if self.qty_left == 0 || self.prod_ticks > (cycle_ticks * 3) / 4 {
            if let Some(stamp) = bank.frames.get(20) {
                stamp.blit_transformed_f(ctx.surface, sx(335.0), sy(64.0), sf, false, false, true, false);
            }
        }

        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        AdResult::NoError
    }
}
