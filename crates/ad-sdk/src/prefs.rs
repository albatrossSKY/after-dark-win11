//! 1:1 `AD_PREFS.INI` and `RANDOM.ADS` configuration compatibility layer,
//! plus Windows 11 modernization preferences (`[Windows 11]` section).
//!
//! Includes the exact reversible password obfuscation codec from `AD.EXE` SEG 10.

use std::collections::BTreeMap;
use std::fs;
use std::path::Path;

/// Screen corner enum matching `AD_PREFS.INI` (`0=TopLeft, 1=TopRight, 2=BottomLeft, 3=BottomRight`).
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
#[repr(i32)]
pub enum ScreenCorner {
    TopLeft = 0,
    TopRight = 1,
    BottomLeft = 2,
    BottomRight = 3,
}

impl ScreenCorner {
    pub fn from_i32(v: i32) -> Self {
        match v {
            0 => Self::TopLeft,
            1 => Self::TopRight,
            2 => Self::BottomLeft,
            _ => Self::BottomRight,
        }
    }

    pub fn label(self) -> &'static str {
        match self {
            Self::TopLeft => "Top Left",
            Self::TopRight => "Top Right",
            Self::BottomLeft => "Bottom Left",
            Self::BottomRight => "Bottom Right",
        }
    }
}

/// Control Panel UI theme mode.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum UiTheme {
    /// Faithful 1991 Windows 3.1 After Dark Control Panel (default).
    RetroWin31,
    /// Modern Windows 11 dark Fluent-inspired Control Panel.
    ModernWin11,
}

/// Multi-monitor rendering strategy for Windows 11.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum MultiMonitorMode {
    /// Independent instance of the selected module per monitor (default).
    PerMonitor,
    /// Different random module on each connected monitor simultaneously!
    DifferentPerMonitor,
    /// Single unified canvas spanning the virtual desktop across all monitors.
    Spanned,
    /// Primary monitor only.
    PrimaryOnly,
}

impl MultiMonitorMode {
    pub fn label(self) -> &'static str {
        match self {
            Self::PerMonitor => "Independent Per Monitor (Same Module)",
            Self::DifferentPerMonitor => "Different Module Per Monitor (Random Pool)",
            Self::Spanned => "Spanned Across All Monitors",
            Self::PrimaryOnly => "Primary Monitor Only",
        }
    }
}

/// Frame rate / motion smoothness mode (#1 Modernization).
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum FrameRateMode {
    /// Authentic 1991–1995 module timing (`target_frame_ms`, ~15–30 FPS).
    AuthenticRetro,
    /// Smooth 60 FPS (`16 ms` interval).
    Smooth60Fps,
    /// High-Refresh 120+ FPS (`8 ms` interval).
    HighRefresh120Fps,
}

impl FrameRateMode {
    pub fn label(self) -> &'static str {
        match self {
            Self::AuthenticRetro => "Authentic Retro (15-30 FPS)",
            Self::Smooth60Fps => "Smooth 60 FPS",
            Self::HighRefresh120Fps => "High Refresh 120+ FPS",
        }
    }

    pub fn resolve_frame_ms(self, module_target_ms: u32) -> u64 {
        match self {
            Self::AuthenticRetro => module_target_ms.max(15) as u64,
            Self::Smooth60Fps => 16,
            Self::HighRefresh120Fps => 8,
        }
    }
}

/// Integer pixel scaling & display filter mode for High-DPI / 4K displays (#2 Modernization).
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum ScaleMode {
    /// Automatically scale for modern 1080p/1440p/4K monitors (2x @ >=1080p, 3x @ 4K).
    Auto,
    Scale1x,
    Scale2x,
    Scale3x,
    /// Classic 640x480 4:3 stage scaled cleanly to the monitor.
    Classic640x480,
    /// 2x Integer Scale with Retro CRT Scanline Arcade Filter.
    CrtScanlines,
}

impl ScaleMode {
    pub fn resolve_factor(self, dpi: u32) -> i32 {
        match self {
            ScaleMode::Auto => {
                if dpi >= 192 {
                    3
                } else {
                    2
                }
            }
            ScaleMode::Scale1x => 1,
            ScaleMode::Scale2x | ScaleMode::CrtScanlines => 2,
            ScaleMode::Scale3x => 3,
            ScaleMode::Classic640x480 => 2,
        }
    }

    pub fn label(self) -> &'static str {
        match self {
            ScaleMode::Auto => "Auto (Smart Retro 2x/3x)",
            ScaleMode::Scale1x => "1x (Native Monitor Pixels)",
            ScaleMode::Scale2x => "2x (Crisp Integer Pixel Art)",
            ScaleMode::Scale3x => "3x (Crisp 4K Integer)",
            ScaleMode::Classic640x480 => "640x480 Classic 4:3 Stage",
            ScaleMode::CrtScanlines => "2x Retro CRT Scanlines",
        }
    }
}

/// Complete After Dark 1.0a + Windows 11 preferences (`AD_PREFS.INI`).
#[derive(Debug, Clone)]
pub struct AdPrefs {
    // --- Authentic 1991 [After Dark] section ---
    pub password_encoded: String,
    pub screen_saver_on: bool,
    pub in_password_mode: bool,
    pub timeout_minutes: u32,
    pub watch_com_ports: String,
    pub sleep_corner: ScreenCorner,
    pub wake_corner: ScreenCorner,
    pub no_corners: bool,
    pub password_switch: bool,
    pub slide_show_dir: String,
    pub logo_file: String,
    pub globe_file: String,
    pub path: String,
    pub module_file: String,
    pub module_name: String,
    pub system_iq: bool,
    pub hotkey_vk: u32,
    pub hotkey_ctrl: bool,
    pub hotkey_shift: bool,
    pub hotkey_enabled: bool,

    // --- Per-module raw control values (stored cleanly in [ModuleControls]) ---
    pub module_controls: BTreeMap<String, [i32; 4]>,

    // --- Windows 11 modernization settings ([Windows 11] section) ---
    pub ui_theme: UiTheme,
    pub scale_mode: ScaleMode,
    pub multi_monitor: MultiMonitorMode,
    pub frame_rate_mode: FrameRateMode,
    pub sound_enabled: bool,
    pub authentic_timing: bool,
    pub sfx_volume: i32,
    pub midi_volume: i32,
    pub favorites: Vec<String>,
}

impl Default for AdPrefs {
    fn default() -> Self {
        Self {
            password_encoded: String::new(),
            screen_saver_on: true,
            in_password_mode: false,
            timeout_minutes: 5,
            watch_com_ports: "1,2,3,4".to_string(),
            sleep_corner: ScreenCorner::BottomLeft,
            wake_corner: ScreenCorner::BottomRight,
            no_corners: false, // Enabled by default so hot corners work out-of-the-box!
            password_switch: false,
            slide_show_dir: String::new(),
            logo_file: String::new(),
            globe_file: String::new(),
            path: String::new(),
            module_file: "TOASTERS.AD".to_string(),
            module_name: "Flying Toasters".to_string(),
            system_iq: true,
            hotkey_vk: 83, // 'S' (from original AD_PREFS.INI)
            hotkey_ctrl: true,
            hotkey_shift: true,
            hotkey_enabled: true,
            module_controls: BTreeMap::new(),
            ui_theme: UiTheme::RetroWin31,
            scale_mode: ScaleMode::Auto,
            multi_monitor: MultiMonitorMode::PerMonitor,
            frame_rate_mode: FrameRateMode::Smooth60Fps,
            sound_enabled: true,
            authentic_timing: false,
            sfx_volume: 85,
            midi_volume: 80,
            favorites: vec![
                "toasters".to_string(),
                "starry".to_string(),
                "simpsons_homer_eats".to_string(),
                "simpsons_chalkboard".to_string(),
                "tng_borg".to_string(),
                "tng_warp_effect".to_string(),
                "looney_acme_shopping".to_string(),
                "looney_taz_desktop".to_string(),
                "looney_yosemite_sam".to_string(),
            ],
        }
    }
}

impl AdPrefs {
    /// Parse an existing `AD_PREFS.INI` file (1991 or modernized).
    pub fn load_from_file(path: &Path) -> Self {
        let mut prefs = Self::default();
        let Ok(content) = fs::read_to_string(path) else {
            return prefs;
        };
        let mut section = String::new();
        for raw_line in content.lines() {
            let line = raw_line.trim();
            if line.is_empty() || line.starts_with(';') || line.starts_with('#') {
                continue;
            }
            if line.starts_with('[') && line.ends_with(']') {
                section = line[1..line.len() - 1].trim().to_ascii_lowercase();
                continue;
            }
            let Some((k, v)) = line.split_once('=') else {
                continue;
            };
            let key = k.trim();
            let key_lc = key.to_ascii_lowercase();
            let val = v.trim();
            match section.as_str() {
                "after dark" => match key_lc.as_str() {
                    "password" => prefs.password_encoded = val.to_string(),
                    "screensaveron" => prefs.screen_saver_on = val != "0",
                    "inpasswordmode" => prefs.in_password_mode = val != "0",
                    "timeout" => {
                        if let Ok(m) = val.parse::<u32>() {
                            prefs.timeout_minutes = m.clamp(1, 999);
                        }
                    }
                    "watchcomports" => prefs.watch_com_ports = val.to_string(),
                    "sleepcorner" => {
                        if let Ok(c) = val.parse::<i32>() {
                            prefs.sleep_corner = ScreenCorner::from_i32(c);
                        }
                    }
                    "wakecorner" => {
                        if let Ok(c) = val.parse::<i32>() {
                            prefs.wake_corner = ScreenCorner::from_i32(c);
                        }
                    }
                    "nocorners" => prefs.no_corners = val != "0",
                    "passwordswitch" => prefs.password_switch = val != "0",
                    "slideshowdir" => prefs.slide_show_dir = val.to_string(),
                    "logofile" => prefs.logo_file = val.to_string(),
                    "globefile" => prefs.globe_file = val.to_string(),
                    "path" => prefs.path = val.to_string(),
                    "modulefile" => {
                        if !val.is_empty() {
                            prefs.module_file = val.to_string();
                        }
                    }
                    "module" => {
                        if !val.is_empty() {
                            prefs.module_name = val.to_string();
                        }
                    }
                    "systemiq" => prefs.system_iq = val != "0",
                    "thehotkey" => {
                        if let Ok(vk) = val.parse::<u32>() {
                            prefs.hotkey_vk = vk;
                        }
                    }
                    "hotctrl" => prefs.hotkey_ctrl = val != "0",
                    "hotshift" => prefs.hotkey_shift = val != "0",
                    "hotkey" => prefs.hotkey_enabled = val != "0",
                    _ => {}
                },
                "modulecontrols" => {
                    let parts: Vec<i32> = val
                        .split(',')
                        .filter_map(|s| s.trim().parse::<i32>().ok())
                        .collect();
                    if parts.len() == 4 {
                        prefs
                            .module_controls
                            .insert(key.to_string(), [parts[0], parts[1], parts[2], parts[3]]);
                    }
                }
                "windows 11" => match key_lc.as_str() {
                    "uitheme" => {
                        prefs.ui_theme = if val.eq_ignore_ascii_case("modern") {
                            UiTheme::ModernWin11
                        } else {
                            UiTheme::RetroWin31
                        };
                    }
                    "scalemode" => {
                        prefs.scale_mode = match val.to_ascii_lowercase().as_str() {
                            "1x" => ScaleMode::Scale1x,
                            "2x" => ScaleMode::Scale2x,
                            "3x" => ScaleMode::Scale3x,
                            "640x480" | "classic" => ScaleMode::Classic640x480,
                            "crt" => ScaleMode::CrtScanlines,
                            _ => ScaleMode::Auto,
                        };
                    }
                    "multimonitor" => {
                        prefs.multi_monitor = match val.to_ascii_lowercase().as_str() {
                            "different" | "random_per_monitor" => {
                                MultiMonitorMode::DifferentPerMonitor
                            }
                            "spanned" => MultiMonitorMode::Spanned,
                            "primary" => MultiMonitorMode::PrimaryOnly,
                            _ => MultiMonitorMode::PerMonitor,
                        };
                    }
                    "frameratemode" => {
                        prefs.frame_rate_mode = match val.to_ascii_lowercase().as_str() {
                            "retro" | "authentic" => FrameRateMode::AuthenticRetro,
                            "120fps" | "high" => FrameRateMode::HighRefresh120Fps,
                            _ => FrameRateMode::Smooth60Fps,
                        };
                        prefs.authentic_timing =
                            prefs.frame_rate_mode == FrameRateMode::AuthenticRetro;
                    }
                    "soundenabled" => prefs.sound_enabled = val != "0",
                    "authentictiming" => {
                        prefs.authentic_timing = val != "0";
                        if prefs.authentic_timing {
                            prefs.frame_rate_mode = FrameRateMode::AuthenticRetro;
                        }
                    }
                    "sfxvolume" => {
                        if let Ok(v) = val.parse::<i32>() {
                            prefs.sfx_volume = v.clamp(0, 100);
                        }
                    }
                    "midivolume" => {
                        if let Ok(v) = val.parse::<i32>() {
                            prefs.midi_volume = v.clamp(0, 100);
                        }
                    }
                    "favorites" => {
                        prefs.favorites = val
                            .split(',')
                            .map(|s| s.trim().to_string())
                            .filter(|s| !s.is_empty())
                            .collect();
                    }
                    _ => {}
                },
                _ => {}
            }
        }
        prefs
    }

    /// Save in 100% original `AD_PREFS.INI` key format plus `[ModuleControls]` and `[Windows 11]`.
    pub fn save_to_file(&self, path: &Path) -> std::io::Result<()> {
        let mut out = String::new();
        out.push_str("[After Dark]\r\n\r\n");
        out.push_str(&format!("Password={}\r\n", self.password_encoded));
        out.push_str(&format!("ScreenSaverOn={}\r\n", u8::from(self.screen_saver_on)));
        out.push_str(&format!("InPasswordMode={}\r\n", u8::from(self.in_password_mode)));
        out.push_str(&format!("timeout={}\r\n", self.timeout_minutes));
        out.push_str(&format!("WatchComPorts={}\r\n", self.watch_com_ports));
        out.push_str(&format!("SleepCorner={}\r\n", self.sleep_corner as i32));
        out.push_str(&format!("WakeCorner={}\r\n", self.wake_corner as i32));
        out.push_str(&format!("NoCorners={}\r\n", u8::from(self.no_corners)));
        out.push_str(&format!("PasswordSwitch={}\r\n", u8::from(self.password_switch)));
        out.push_str(&format!("SlideShowDir={}\r\n", self.slide_show_dir));
        out.push_str(&format!("LogoFile={}\r\n", self.logo_file));
        out.push_str(&format!("GlobeFile={}\r\n", self.globe_file));
        out.push_str(&format!("Path={}\r\n", self.path));
        out.push_str(&format!("ModuleFile={}\r\n", self.module_file));
        out.push_str(&format!("Module={}\r\n", self.module_name));
        out.push_str(&format!("SystemIQ={}\r\n", u8::from(self.system_iq)));
        out.push_str(&format!("TheHotkey={}\r\n", self.hotkey_vk));
        out.push_str(&format!("HotCtrl={}\r\n", u8::from(self.hotkey_ctrl)));
        out.push_str(&format!("HotShift={}\r\n", u8::from(self.hotkey_shift)));
        out.push_str(&format!("Hotkey={}\r\n", u8::from(self.hotkey_enabled)));

        out.push_str("\r\n[ModuleControls]\r\n");
        for (mod_id, vals) in &self.module_controls {
            out.push_str(&format!(
                "{}={},{},{},{}\r\n",
                mod_id, vals[0], vals[1], vals[2], vals[3]
            ));
        }

        out.push_str("\r\n[Windows 11]\r\n");
        out.push_str(&format!(
            "UiTheme={}\r\n",
            match self.ui_theme {
                UiTheme::RetroWin31 => "retro",
                UiTheme::ModernWin11 => "modern",
            }
        ));
        out.push_str(&format!(
            "ScaleMode={}\r\n",
            match self.scale_mode {
                ScaleMode::Auto => "auto",
                ScaleMode::Scale1x => "1x",
                ScaleMode::Scale2x => "2x",
                ScaleMode::Scale3x => "3x",
                ScaleMode::Classic640x480 => "640x480",
                ScaleMode::CrtScanlines => "crt",
            }
        ));
        out.push_str(&format!(
            "MultiMonitor={}\r\n",
            match self.multi_monitor {
                MultiMonitorMode::PerMonitor => "per_monitor",
                MultiMonitorMode::DifferentPerMonitor => "different",
                MultiMonitorMode::Spanned => "spanned",
                MultiMonitorMode::PrimaryOnly => "primary",
            }
        ));
        out.push_str(&format!(
            "FrameRateMode={}\r\n",
            match self.frame_rate_mode {
                FrameRateMode::AuthenticRetro => "retro",
                FrameRateMode::Smooth60Fps => "60fps",
                FrameRateMode::HighRefresh120Fps => "120fps",
            }
        ));
        out.push_str(&format!("SoundEnabled={}\r\n", u8::from(self.sound_enabled)));
        out.push_str(&format!(
            "AuthenticTiming={}\r\n",
            u8::from(self.frame_rate_mode == FrameRateMode::AuthenticRetro)
        ));
        out.push_str(&format!("SfxVolume={}\r\n", self.sfx_volume.clamp(0, 100)));
        out.push_str(&format!("MidiVolume={}\r\n", self.midi_volume.clamp(0, 100)));
        out.push_str(&format!("Favorites={}\r\n", self.favorites.join(",")));

        fs::write(path, out)
    }
}

/// Entry stored inside After Dark's 1991 binary `RANDOM.ADS` file (41-byte fixed records).
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct RandomizerEntry {
    pub module_name: String,
    pub filename: String,
}

/// Parse an authentic 1991 `RANDOM.ADS` binary file (`u16 count`, `u16 stride=41`, `N * 41-byte records`).
pub fn load_random_ads(path: &Path) -> Vec<RandomizerEntry> {
    let Ok(bytes) = fs::read(path) else {
        return Vec::new();
    };
    parse_random_ads(&bytes)
}

pub fn parse_random_ads(bytes: &[u8]) -> Vec<RandomizerEntry> {
    if bytes.len() < 4 {
        return Vec::new();
    }
    let count = u16::from_le_bytes([bytes[0], bytes[1]]) as usize;
    let stride = u16::from_le_bytes([bytes[2], bytes[3]]) as usize;
    if stride < 4 {
        return Vec::new();
    }
    let mut out = Vec::with_capacity(count);
    let mut off = 4;
    for _ in 0..count {
        if off + stride > bytes.len() {
            break;
        }
        let rec = &bytes[off..off + stride];
        let nul = rec.iter().position(|&b| b == 0).unwrap_or(rec.len());
        let s = String::from_utf8_lossy(&rec[..nul]);
        if let Some(tab) = s.find('\t') {
            let name = s[..tab].trim().to_string();
            let file = s[tab..].trim_start_matches('\t').trim().to_string();
            if !name.is_empty() {
                out.push(RandomizerEntry {
                    module_name: name,
                    filename: file,
                });
            }
        }
        off += stride;
    }
    out
}

/// Write an authentic 1991 `RANDOM.ADS` binary file (41-byte records: `Name\t\t\t\tFILE.AD\0`).
pub fn save_random_ads(path: &Path, entries: &[RandomizerEntry]) -> std::io::Result<()> {
    const STRIDE: usize = 41;
    let mut buf = Vec::with_capacity(4 + entries.len() * STRIDE);
    buf.extend_from_slice(&(entries.len() as u16).to_le_bytes());
    buf.extend_from_slice(&(STRIDE as u16).to_le_bytes());
    for e in entries {
        let mut rec = [0u8; STRIDE];
        let line = format!("{}\t\t\t\t{}", e.module_name, e.filename);
        let bytes = line.as_bytes();
        let copy_len = bytes.len().min(STRIDE - 1);
        rec[..copy_len].copy_from_slice(&bytes[..copy_len]);
        buf.extend_from_slice(&rec);
    }
    fs::write(path, buf)
}

/// Exact 1:1 replica of `AD.EXE` SEG 10 (`10:0000` / `10:006B` / `10:024C`) password encoder.
pub fn encode_ad_password(key: &str, password: &str) -> String {
    if password.is_empty() {
        return String::new();
    }
    let (mut k1, mut k2) = ad_password_key_seeds(key.as_bytes());
    let mut enc: Vec<u8> = password.as_bytes().to_vec();
    let len = enc.len().min(252) as u8;
    enc.truncate(len as usize);
    let mut checksum: u16 = len as u16;
    for i in 0..(len as usize) {
        let idx = i as u8;
        k1 = k1.wrapping_sub(idx);
        k2 = k2.wrapping_add(idx);
        if (idx & 1) == 0 {
            enc[i] = enc[i].wrapping_add(k2);
        } else {
            enc[i] = enc[i].wrapping_sub(k1);
        }
        checksum = checksum.wrapping_add(enc[i] as u16);
    }
    let mut raw = Vec::with_capacity(3 + enc.len());
    raw.push(len);
    raw.push((checksum & 0xFF) as u8);
    raw.push((checksum >> 8) as u8);
    raw.extend_from_slice(&enc);
    raw.iter()
        .map(|&b| (b as i8).to_string())
        .collect::<Vec<_>>()
        .join(",")
}

/// Exact 1:1 replica of `AD.EXE` SEG 10 (`10:0155` / `10:02D2`) password decoder.
pub fn decode_ad_password(key: &str, encoded: &str) -> Option<String> {
    if encoded.trim().is_empty() {
        return Some(String::new());
    }
    let raw: Vec<u8> = encoded
        .split(',')
        .filter_map(|tok| tok.trim().parse::<i16>().ok().map(|v| v as u8))
        .collect();
    if raw.len() < 3 {
        return None;
    }
    let len = raw[0] as usize;
    let expected_sum = (raw[1] as u16) | ((raw[2] as u16) << 8);
    if raw.len() < 3 + len {
        return None;
    }
    let (mut k1, mut k2) = ad_password_key_seeds(key.as_bytes());
    let mut dec = raw[3..3 + len].to_vec();
    let mut checksum: u16 = len as u16;
    for i in 0..len {
        let idx = i as u8;
        k1 = k1.wrapping_sub(idx);
        k2 = k2.wrapping_add(idx);
        checksum = checksum.wrapping_add(dec[i] as u16);
        if (idx & 1) == 0 {
            dec[i] = dec[i].wrapping_sub(k2);
        } else {
            dec[i] = dec[i].wrapping_add(k1);
        }
    }
    if checksum != expected_sum {
        return None;
    }
    Some(String::from_utf8_lossy(&dec).into_owned())
}

fn ad_password_key_seeds(key: &[u8]) -> (u8, u8) {
    let mut k1 = 0u8;
    let mut k2 = 0u8;
    let mut rev = key.len() as u8;
    for (i, &b) in key.iter().enumerate() {
        k1 = k1.wrapping_add(b.wrapping_add(i as u8));
        k2 = k2.wrapping_add(b.wrapping_add(rev));
        rev = rev.wrapping_sub(1);
    }
    (k1, k2)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn password_roundtrip() {
        let enc = encode_ad_password("AfterDark", "Toasters91");
        assert_eq!(decode_ad_password("AfterDark", &enc).as_deref(), Some("Toasters91"));
    }
}
