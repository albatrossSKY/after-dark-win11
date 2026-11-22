//! "ACME Home Shopping" — Classic 1995 *Looney Tunes* After Dark 3.0 module.
//!
//! Renders the ACME Home Shopping Network TV broadcast with tiled ACME wallpaper,
//! 33 authentic ACME mail-order products from `cSTR #12000`, 43 product photos
//! from `RLEP #12002..#12006`, bitmap font `#12100`, live inventory & timer
//! countdowns, `Inflation:` price scaling, red `SOLD OUT` stamp, `BellTree` /
//! `RedSlash` SFX, and the *ACME Home Shopping* MIDI theme (`#10`).

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use crate::looney::{
    ACME_SFX, MOD_ACME, SONG_ACME, draw_looney_text, load_anim, load_multi_rlep, load_rlep,
    looney_pack, wrap_looney_text,
};
use crate::simpsons::{
    CompoundAnim, KIND_CSTR, RlepBank, draw_line_px, mac_roman_to_string, music_loops_from_slider,
};

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
            clear_first: false,
            music_raw: 20,
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
                    default_checked: false,
                },
                AdControl::LabeledSlider {
                    title: "Music:".to_string(),
                    default_raw: 20,
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
        ctx.surface.pixels_mut().fill(0x0008_1018);

        if let Some(loops) = music_loops_from_slider(self.music_raw) {
            looney_pack().play_music(ctx.sound, ctx.system.sound_enabled, SONG_ACME, loops);
        }
        looney_pack().play_voice(ctx.sound, ctx.system.sound_enabled, ACME_SFX[0]);
        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.surface.pixels_mut().fill(0x0008_1018);
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
        ctx.surface.pixels_mut().fill(0x0008_1420);

        let (Some(bank), Some(font), Some(layout)) = (&self.bank, &self.font, &self.layout) else {
            return AdResult::NoError;
        };

        // 1. Tiled ACME green/teal background pattern (`sp=1`, 0-indexed frame 0, 128x64)
        if let Some(tile) = bank.frames.first() {
            let tw = tile.w.max(32);
            let th = tile.h.max(32);
            let mut ty = 0;
            while ty < h {
                let mut tx = 0;
                while tx < w {
                    tile.blit(ctx.surface, tx, ty);
                    tx += tw;
                }
                ty += th;
            }
        }

        // 2. Centered 512x400 ACME Home Shopping TV console (`OFst #12000` frame 8)
        let ox = (w - 512) / 2;
        let oy = (h - 400) / 2;
        layout.draw_stage_frame(ctx.surface, 8, ox, oy, 1);

        // 3. Seal badge (`w2=28`, 136x136) in lower-left panel
        if let Some(seal) = bank.frames.get(28) {
            seal.blit(ctx.surface, ox + 12, oy + 216);
        }

        // 4. Product photograph (`w2=29..71`, 228x171) + shadow (`w2=16`)
        if let Some(shadow) = bank.frames.get(16) {
            shadow.blit(ctx.surface, ox + 281, oy + 27);
        }
        let photo_count = bank.frames.len().saturating_sub(29).max(1);
        let photo_idx = 29 + (self.cur_prod % photo_count);
        if let Some(photo) = bank.frames.get(photo_idx) {
            photo.blit(ctx.surface, ox + 279, oy + 24);
        }

        // 5. Product text, prices, inventory, timer, and ordering slogan using bitmap font `#12100`
        if let Some(prod) = self.products.get(self.cur_prod) {
            draw_looney_text(
                ctx.surface,
                font,
                &prod.title,
                ox + 12,
                oy + 68,
                Some(0xFFE0_40),
                1,
            );

            let lines = wrap_looney_text(font, &prod.desc, 250, 1);
            for (li, line) in lines.iter().take(7).enumerate() {
                draw_looney_text(
                    ctx.surface,
                    font,
                    line,
                    ox + 12,
                    oy + 94 + (li as i32) * 17,
                    Some(0xFFFF_FF),
                    1,
                );
            }

            let item_no = format!("#{:04}", 1001 + self.cur_prod * 17);
            draw_looney_text(
                ctx.surface,
                font,
                &item_no,
                ox + 373,
                oy + 221,
                Some(0xFFE0_40),
                1,
            );

            let mult = 1 + (self.inflation_raw / 25);
            let list_dollars = prod.base_price * mult + 50;
            let our_dollars = prod.base_price * mult + 20;
            let pay_dollars = prod.base_price * mult;
            let list_str = format!("${}.99", list_dollars);
            let our_str = format!("${}.99", our_dollars);
            let pay_str = format!("${}.99", pay_dollars);

            // LIST PRICE (`oy + 221`) with red slash
            draw_looney_text(
                ctx.surface,
                font,
                &list_str,
                ox + 432,
                oy + 221,
                Some(0xC0D8_F0),
                1,
            );
            draw_line_px(
                ctx.surface,
                ox + 430,
                oy + 234,
                ox + 496,
                oy + 222,
                0xFF20_20,
                2,
            );

            // OUR PRICE (`oy + 261`) with red slash
            draw_looney_text(
                ctx.surface,
                font,
                &our_str,
                ox + 432,
                oy + 261,
                Some(0xC0D8_F0),
                1,
            );
            draw_line_px(
                ctx.surface,
                ox + 430,
                oy + 274,
                ox + 496,
                oy + 262,
                0xFF20_20,
                2,
            );

            // YOU PAY (`oy + 301`)
            draw_looney_text(
                ctx.surface,
                font,
                &pay_str,
                ox + 432,
                oy + 301,
                Some(0x40FF_60),
                1,
            );

            // TIME LEFT (`oy + 341`)
            let rem_secs = ((cycle_ticks.saturating_sub(self.prod_ticks)) / 6).max(0);
            let time_str = format!("0:{:02}", rem_secs.min(59));
            draw_looney_text(
                ctx.surface,
                font,
                &time_str,
                ox + 440,
                oy + 341,
                Some(0xFFE0_40),
                1,
            );

            draw_looney_text(
                ctx.surface,
                font,
                "555-ACME",
                ox + 304,
                oy + 254,
                Some(0xFFE0_40),
                1,
            );
            let status_txt = if self.qty_left == 0 {
                "SOLD OUT!"
            } else {
                "CALL NOW!"
            };
            draw_looney_text(
                ctx.surface,
                font,
                status_txt,
                ox + 304,
                oy + 274,
                Some(0xFFFF_FF),
                1,
            );
        }

        if let Some(slogan) = self.slogans.get(self.cur_slogan) {
            let short: String = slogan.chars().take(42).collect();
            draw_looney_text(
                ctx.surface,
                font,
                &short,
                ox + 12,
                oy + 375,
                Some(0xFFFF_FF),
                1,
            );
        }
        // NUMBER LEFT (`ox + 456, oy + 375`)
        let qty_str = format!("{:03}", self.qty_left);
        draw_looney_text(
            ctx.surface,
            font,
            &qty_str,
            ox + 458,
            oy + 375,
            Some(0xFFE0_40),
            1,
        );

        // 6. Red "SOLD OUT" stamp (`w2=20` / `21`, 119x90) over product photo when qty hits 0
        if self.qty_left == 0 || self.prod_ticks > (cycle_ticks * 3) / 4 {
            if let Some(stamp) = bank.frames.get(20) {
                stamp.blit(ctx.surface, ox + 335, oy + 64);
            }
        }

        AdResult::NoError
    }
}
