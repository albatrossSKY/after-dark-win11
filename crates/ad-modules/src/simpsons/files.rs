//! *Simpsons Files* — 1994 *The Simpsons* After Dark 3.0 Module.
//!
//! Straight from the basement of Springfield City Hall: cycles through all 48
//! authentic character dossiers (`List #7000..#7047`), 23 full-color character
//! portraits (`RLEP #7010/#7011`), 23 character banners (`RLEP #7000`), and the
//! custom Simpsons bitmap font (`RLEP #7100`), accompanied by *The Simpsons Theme*
//! MIDI (`cmid #40`).

use ad_sdk::{AdContext, AdControl, AdMetadata, AdModule, AdResult};

use super::{
    KIND_LIST, MOD_FILES, RlepBank, SND_FOLDER_OPEN, SONG_SIMPSONS_THEME, SimpsonsPack,
    SpriteFrame, draw_bitmap_text, draw_rect_outline_px, fill_rect_px, mac_roman_to_string,
    music_loops_from_slider, wrap_bitmap_text,
};

struct Dossier {
    char_idx: usize, // 0..23
    title: String,
    items: Vec<String>,
}

// Exact character index (0..22 matching clut #7000..#7022 & portraits #7010/#7011) for List #7000..#7047:
// 0=Apu, 1=Barney, 2=Bart, 3=Brad, 4=Devil, 5=Flanders, 6=Grampa, 7=Homer,
// 8=I&S, 9=Lance, 10=Lisa, 11=Lovejoy, 12=Marge, 13=McBain, 14=Moe, 15=Patty&Selma,
// 16=Quimby, 17=SideshowBob, 18=Skinner, 19=Smithers, 20=Troy, 21=Wiggum, 22=Burns
const LIST_CHAR_MAP: [usize; 48] = [
    13, // 7000 Wolfcastle
    17, // 7001 Sideshow Bob
    7,  // 7002 Homer Father Advice
    9,  // 7003 Lance Murdock Stunts
    6,  // 7004 Grampa Cures
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, // 7005..7015 I&S Vol I..XI
    11, // 7016 Lovejoy Sermons
    19, // 7017 Smithers Malibu Stacy
    1,  // 7018 Barney Beverages
    2,  // 7019 Bart Camper Patches
    15, // 7020 Patty & Selma Travel Tips
    7,  // 7021 Homer Free Acquisitions
    3, 3, 3, // 7022..7024 Brad Goodman
    9,  // 7025 Lance Murdock Inspiration
    21, // 7026 Wiggum Gun Uses
    5, 5, // 7027..7028 Flanders
    0,  // 7029 Apu
    18, // 7030 Skinner
    12, 12, // 7031..7032 Marge Words
    20, 20, // 7033..7034 Troy McClure
    4,  // 7035 Devil
    16, // 7036 Quimby
    5,  // 7037 Flanders Possessions
    21, 21, // 7038..7039 Wiggum Talents
    14, // 7040 Moe
    12, // 7041 Marge Krusty Brand
    2,  // 7042 Bart Krusty Brand
    10, 10, // 7043..7044 Lisa
    22, 22, // 7045..7046 Burns
    7,  // 7047 Strangling Bart
];

fn parse_dossier(rid: i16, data: &[u8]) -> Option<Dossier> {
    if data.is_empty() {
        return None;
    }
    let tlen = data[0] as usize;
    if 1 + tlen + 2 > data.len() {
        return None;
    }
    let title = mac_roman_to_string(&data[1..1 + tlen]);
    let mut pos = 1 + tlen;
    let count = u16::from_be_bytes([data[pos], data[pos + 1]]) as usize;
    pos += 2;
    let mut items = Vec::with_capacity(count);
    for _ in 0..count {
        if pos >= data.len() {
            break;
        }
        let n = data[pos] as usize;
        pos += 1;
        let end = (pos + n).min(data.len());
        items.push(mac_roman_to_string(&data[pos..end]));
        pos = end;
    }
    let idx = (rid - 7000).clamp(0, 47) as usize;
    Some(Dossier {
        char_idx: LIST_CHAR_MAP[idx],
        title,
        items,
    })
}

pub struct SimpsonsFilesModule {
    portraits: Vec<SpriteFrame>,
    banners: Vec<SpriteFrame>,
    font: RlepBank,
    dossiers: Vec<Dossier>,
    order: Vec<usize>,
    cur_pos: usize,
    ticks_on_page: usize,
    ticks_per_page: usize,
    reveal_items: usize,
    needs_redraw: bool,
}

impl SimpsonsFilesModule {
    pub fn new() -> Self {
        Self {
            portraits: Vec::new(),
            banners: Vec::new(),
            font: RlepBank {
                frames: Vec::new(),
                palette: Vec::new(),
            },
            dossiers: Vec::new(),
            order: Vec::new(),
            cur_pos: 0,
            ticks_on_page: 0,
            ticks_per_page: 180,
            reveal_items: 0,
            needs_redraw: true,
        }
    }

    pub fn static_metadata() -> AdMetadata {
        AdMetadata {
            id: "simpsons_files".to_string(),
            name: "Simpsons Files".to_string(),
            credit: "By Jamie A., Maury, Gabe, Peter, and Matt S.\nSoftware © 1994 Berkeley Systems, Inc.\nThe Simpsons ™ & © Twentieth Century Fox.".to_string(),
            about: "Straight from the basement of Springfield City Hall to your computer screen, this module reveals 48 confidential files and darkest secrets of your favorite Springfield characters.".to_string(),
            controls: [
                AdControl::LabeledSlider {
                    title: "Duration:".to_string(),
                    default_raw: 25,
                    labels: vec![
                        "5 seconds".into(),
                        "15 seconds".into(),
                        "30 seconds".into(),
                        "1 minute".into(),
                        "2 minutes".into(),
                        "5 minutes".into(),
                    ],
                    thresholds: vec![0, 17, 34, 51, 68, 85],
                },
                AdControl::LabeledSlider {
                    title: "Music:".to_string(),
                    default_raw: 31,
                    labels: vec![
                        "Never".into(),
                        "Once".into(),
                        "Twice".into(),
                        "Thrice".into(),
                        "Always".into(),
                    ],
                    thresholds: vec![0, 21, 42, 63, 84],
                },
                AdControl::None,
                AdControl::None,
            ],
            target_frame_ms: 60,
            filename: "FILES.AD".to_string(),
        }
    }

    fn ensure_loaded(&mut self) {
        if !self.dossiers.is_empty() {
            return;
        }
        let b10 = RlepBank::load(MOD_FILES, 7010);
        let b11 = RlepBank::load(MOD_FILES, 7011);
        self.portraits.clear();
        self.portraits.extend(b10.frames);
        self.portraits.extend(b11.frames);
        self.banners = RlepBank::load(MOD_FILES, 7000).frames;
        // Apply each character's authentic Mac `clut #7000..#7022` palette to its doodle banner!
        let pack = SimpsonsPack::global();
        for (ci, banner) in self.banners.iter_mut().enumerate() {
            let pal = pack.decode_clut(MOD_FILES, 7000 + ci as i16);
            if !pal.is_empty() {
                for (px, &idx) in banner.pixels.iter_mut().zip(banner.indices.iter()) {
                    if idx != 0xFF {
                        if let Some(&col) = pal.get(idx as usize) {
                            *px = col;
                        }
                    }
                }
            }
        }
        self.font = RlepBank::load(MOD_FILES, 7100);

        for (rid, data) in SimpsonsPack::global().list(MOD_FILES, KIND_LIST) {
            if let Some(d) = parse_dossier(rid, data) {
                self.dossiers.push(d);
            }
        }
    }

    fn render_current_dossier(&self, surface: &mut ad_sdk::canvas::AdSurface) {
        let w = surface.width;
        let h = surface.height;
        // Deep Springfield cabinet slate backdrop
        fill_rect_px(surface, 0, 0, w, h, 0x0012_1C2B);

        if self.dossiers.is_empty() || self.order.is_empty() {
            return;
        }
        let dossier = &self.dossiers[self.order[self.cur_pos % self.order.len()]];

        let scale = if w >= 1100 { 2 } else { 1 };
        let card_w = (w - 40).clamp(280, 620 * scale);
        let card_h = (h - 48).clamp(220, 420 * scale);
        let cx = (w - card_w) / 2;
        let cy = (h - card_h) / 2 + 8;

        // Drop shadow
        fill_rect_px(surface, cx + 6, cy + 6, cx + card_w + 6, cy + card_h + 6, 0x0008_0C14);
        // Manila folder tab at top-left
        let tab_w = (card_w / 3).clamp(110, 260);
        fill_rect_px(surface, cx + 10, cy - 18, cx + 10 + tab_w, cy + 2, 0x00DF_C48B);
        draw_rect_outline_px(surface, cx + 10, cy - 18, cx + 10 + tab_w, cy + 2, 0x008A_6B38, 2);

        // Manila folder body
        fill_rect_px(surface, cx, cy, cx + card_w, cy + card_h, 0x00F6_E7BE);
        draw_rect_outline_px(surface, cx, cy, cx + card_w, cy + card_h, 0x008A_6B38, 3);
        draw_rect_outline_px(
            surface,
            cx + 5,
            cy + 5,
            cx + card_w - 5,
            cy + card_h - 5,
            0x00C8_A96E,
            1,
        );

        // Red "CONFIDENTIAL" stamp on folder tab
        draw_bitmap_text(
            surface,
            &self.font,
            "SPRINGFIELD FILE",
            cx + 18,
            cy - 15,
            Some(0x009E_1B1B),
            1,
        );

        // Portrait on left
        let mut text_left = cx + 18 * scale;
        if let Some(portrait) = self.portraits.get(dossier.char_idx) {
            let p_scale = if card_w >= 860 { 2 } else { 1 };
            let px = cx + 16 * scale;
            let py = cy + 20 * scale;
            portrait.blit_scaled(surface, px, py, p_scale);
            text_left = px + portrait.w * p_scale + 18 * scale;
        }

        // Character doodle/banner at top-right if room
        let mut text_top = cy + 18 * scale;
        let text_max_w = (cx + card_w - 18 * scale - text_left).max(120);
        if let Some(banner) = self.banners.get(dossier.char_idx) {
            let b_scale = if card_w >= 960 && banner.w * 2 <= text_max_w {
                2
            } else {
                1
            };
            if banner.w * b_scale <= text_max_w && banner.h * b_scale < card_h / 2 {
                let bx = text_left + (text_max_w - banner.w * b_scale) / 2;
                banner.blit_scaled(surface, bx, text_top, b_scale);
                text_top += banner.h * b_scale + 10 * scale;
            }
        }

        // Dossier title in bold crimson
        let font_scale = if card_w >= 920 { 2 } else { 1 };
        let line_h = 18 * font_scale;
        let title_lines = wrap_bitmap_text(&self.font, &dossier.title, text_max_w, font_scale);
        for tl in &title_lines {
            draw_bitmap_text(
                surface,
                &self.font,
                tl,
                text_left,
                text_top,
                Some(0x00A8_1818),
                font_scale,
            );
            text_top += line_h;
        }
        // Horizontal rule
        fill_rect_px(
            surface,
            text_left,
            text_top + 2,
            cx + card_w - 18 * scale,
            text_top + 4,
            0x008A_6B38,
        );
        text_top += 10 * scale;

        // Revealed bullet points in crisp dark ink
        let show_cnt = self.reveal_items.min(dossier.items.len());
        for item in &dossier.items[..show_cnt] {
            let wrapped = wrap_bitmap_text(&self.font, item, text_max_w, font_scale);
            for wl in &wrapped {
                if text_top + line_h > cy + card_h - 10 {
                    break;
                }
                draw_bitmap_text(
                    surface,
                    &self.font,
                    wl,
                    text_left,
                    text_top,
                    Some(0x001A_1A28),
                    font_scale,
                );
                text_top += line_h;
            }
            text_top += 4 * font_scale;
        }
    }
}

impl Default for SimpsonsFilesModule {
    fn default() -> Self {
        Self::new()
    }
}

impl AdModule for SimpsonsFilesModule {
    fn metadata(&self) -> AdMetadata {
        Self::static_metadata()
    }

    fn do_initialize(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ensure_loaded();

        let dur_raw = ctx.module.raw_control_value[0].clamp(0, 100);
        let secs = if dur_raw < 17 {
            5
        } else if dur_raw < 34 {
            15
        } else if dur_raw < 51 {
            30
        } else if dur_raw < 68 {
            60
        } else if dur_raw < 85 {
            120
        } else {
            300
        };
        self.ticks_per_page = (secs * 16).max(60);

        // Shuffle dossier order cleanly
        self.order = (0..self.dossiers.len()).collect();
        for i in (1..self.order.len()).rev() {
            let j = ctx.rng.rand_mod((i + 1) as i32) as usize;
            self.order.swap(i, j);
        }
        self.cur_pos = 0;
        self.ticks_on_page = 0;
        self.reveal_items = 99;
        self.needs_redraw = true;

        if let Some(loops) = music_loops_from_slider(ctx.module.raw_control_value[1]) {
            SimpsonsPack::global().play_music(
                ctx.sound,
                ctx.system.sound_enabled,
                SONG_SIMPSONS_THEME,
                loops,
            );
        }

        AdResult::NoError
    }

    fn do_blank(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.render_current_dossier(ctx.surface);
        self.needs_redraw = false;
        AdResult::NoError
    }

    fn do_draw_frame(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        self.ticks_on_page += 1;
        if self.ticks_on_page >= self.ticks_per_page {
            self.ticks_on_page = 0;
            self.cur_pos = (self.cur_pos + 1) % self.order.len().max(1);
            self.reveal_items = 1;
            self.needs_redraw = true;
            SimpsonsPack::global().play_voice(
                ctx.sound,
                ctx.system.sound_enabled,
                SND_FOLDER_OPEN,
            );
        } else if self.ticks_on_page % 10 == 0 && self.reveal_items < 12 {
            self.reveal_items += 1;
            self.needs_redraw = true;
        }

        if self.needs_redraw {
            self.render_current_dossier(ctx.surface);
            self.needs_redraw = false;
        }
        AdResult::NoError
    }

    fn do_close(&mut self, ctx: &mut AdContext<'_>) -> AdResult {
        ctx.sound.stop_all();
        AdResult::NoError
    }
}
