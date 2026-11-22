//! Lightweight Win16 `SOUND.DRV` synthesizer, 8-bit PCM voice/SFX player,
//! and Standard MIDI File (`MThd`/`MTrk`) player over Win32 WinMM (`waveOut` + `midiOut`).
//!
//! - 1991 After Dark modules (`CLOCKS.AD`) play retro square-wave tones via `waveOut`.
//! - 1994 *The Simpsons* modules play authentic digitized 8-bit Mac `snd ` voice/SFX clips
//!   via `waveOut` simultaneously with Standard MIDI music via Windows' native `midiOut` synth.

use std::sync::Arc;
use std::sync::atomic::{AtomicI32, AtomicU64, Ordering};
use std::sync::mpsc::{self, Sender};
use std::thread;
use std::time::{Duration, Instant};

use windows_sys::Win32::Media::Audio::{
    HMIDIOUT, HWAVEOUT, WAVEFORMATEX, WAVEHDR, WAVE_FORMAT_PCM, WAVE_MAPPER, WHDR_DONE,
    midiOutClose, midiOutOpen, midiOutReset, midiOutShortMsg, waveOutClose, waveOutOpen,
    waveOutPrepareHeader, waveOutReset, waveOutUnprepareHeader, waveOutWrite,
};

const MIDI_MAPPER: u32 = u32::MAX;
static SFX_VOLUME_PCT: AtomicI32 = AtomicI32::new(85);
static MIDI_VOLUME_PCT: AtomicI32 = AtomicI32::new(80);

/// A single queued tone (matching Win16 `SetVoiceSound(voice, freq_hz_fixed16, duration_ms)` or `SetVoiceNote`).
#[derive(Debug, Clone, Copy)]
pub struct Tone {
    /// Frequency in Hz (`0.0` = silence/rest).
    pub freq_hz: f32,
    /// Duration in milliseconds.
    pub duration_ms: u32,
    /// Volume `0.0..=1.0`.
    pub volume: f32,
}

enum WaveCmd {
    PlaySequence {
        tones: Vec<Tone>,
        epoch: u64,
    },
    PlayPcm8 {
        samples: &'static [u8],
        sample_rate: u32,
        volume: f32,
        epoch: u64,
    },
}

enum MidiCmd {
    Play {
        smf: &'static [u8],
        loops: u32, // 0 = infinite
        epoch: u64,
    },
}

/// Non-blocking retro audio handle (PC-speaker tones + 8-bit PCM SFX/voices + MIDI music).
#[derive(Clone)]
pub struct AdSound {
    wave_tx: Sender<WaveCmd>,
    midi_tx: Sender<MidiCmd>,
    wave_epoch: Arc<AtomicU64>,
    midi_epoch: Arc<AtomicU64>,
}

impl AdSound {
    pub fn new() -> Self {
        let wave_epoch = Arc::new(AtomicU64::new(1));
        let midi_epoch = Arc::new(AtomicU64::new(1));

        let (wave_tx, wave_rx) = mpsc::channel::<WaveCmd>();
        let wepoch_bg = Arc::clone(&wave_epoch);
        let _ = thread::Builder::new()
            .name("ad-sound-wave".to_string())
            .spawn(move || {
                while let Ok(mut cmd) = wave_rx.recv() {
                    // Drain any backed-up SFX so playback never lags behind animation.
                    while let Ok(newer) = wave_rx.try_recv() {
                        cmd = newer;
                    }
                    match cmd {
                        WaveCmd::PlaySequence { tones, epoch } => {
                            if wepoch_bg.load(Ordering::Relaxed) == epoch {
                                play_tones_blocking(&tones, &wepoch_bg, epoch);
                            }
                        }
                        WaveCmd::PlayPcm8 {
                            samples,
                            sample_rate,
                            volume,
                            epoch,
                        } => {
                            if wepoch_bg.load(Ordering::Relaxed) == epoch {
                                play_pcm8_blocking(samples, sample_rate, volume, &wepoch_bg, epoch);
                            }
                        }
                    }
                }
            });

        let (midi_tx, midi_rx) = mpsc::channel::<MidiCmd>();
        let mepoch_bg = Arc::clone(&midi_epoch);
        let _ = thread::Builder::new()
            .name("ad-sound-midi".to_string())
            .spawn(move || {
                while let Ok(mut cmd) = midi_rx.recv() {
                    while let Ok(newer) = midi_rx.try_recv() {
                        cmd = newer;
                    }
                    match cmd {
                        MidiCmd::Play { smf, loops, epoch } => {
                            if mepoch_bg.load(Ordering::Relaxed) == epoch {
                                play_midi_blocking(smf, loops, &mepoch_bg, epoch);
                            }
                        }
                    }
                }
            });

        Self {
            wave_tx,
            midi_tx,
            wave_epoch,
            midi_epoch,
        }
    }

    /// Play a sequence of retro tones asynchronously.
    pub fn play_tones(&self, tones: Vec<Tone>) {
        if !tones.is_empty() {
            let epoch = self.wave_epoch.load(Ordering::Relaxed);
            let _ = self.wave_tx.send(WaveCmd::PlaySequence { tones, epoch });
        }
    }

    /// Play a single frequency for `duration_ms` (matches Win16 `SetVoiceSound`).
    pub fn play_freq(&self, freq_hz: f32, duration_ms: u32) {
        self.play_tones(vec![Tone {
            freq_hz,
            duration_ms,
            volume: 0.16,
        }]);
    }

    /// Play an uncompressed 8-bit unsigned PCM voice/SFX clip (Mac Format-1/2 `snd `).
    pub fn play_pcm_u8(&self, samples: &'static [u8], sample_rate: u32) {
        if !samples.is_empty() && sample_rate >= 4000 {
            let epoch = self.wave_epoch.load(Ordering::Relaxed);
            let _ = self.wave_tx.send(WaveCmd::PlayPcm8 {
                samples,
                sample_rate,
                volume: 0.58,
                epoch,
            });
        }
    }

    /// Play a Standard MIDI File (`MThd`/`MTrk`) asynchronously via Windows `midiOut`.
    /// `loops == 0` loops continuously until `stop_midi()` / `stop_all()`.
    pub fn play_midi(&self, smf: &'static [u8], loops: u32) {
        if smf.len() >= 14 {
            let epoch = self.midi_epoch.fetch_add(1, Ordering::Relaxed) + 1;
            let _ = self.midi_tx.send(MidiCmd::Play { smf, loops, epoch });
        }
    }

    /// Immediately stop any currently playing MIDI song.
    pub fn stop_midi(&self) {
        self.midi_epoch.fetch_add(1, Ordering::Relaxed);
    }

    /// Immediately silence all active voices, SFX, tones, and MIDI music.
    pub fn stop_all(&self) {
        self.wave_epoch.fetch_add(1, Ordering::Relaxed);
        self.midi_epoch.fetch_add(1, Ordering::Relaxed);
    }

    /// Set global Voice/SFX volume (`0..=100`) and MIDI Music volume (`0..=100`).
    pub fn set_volumes(&self, sfx_pct: i32, midi_pct: i32) {
        SFX_VOLUME_PCT.store(sfx_pct.clamp(0, 100), Ordering::Relaxed);
        MIDI_VOLUME_PCT.store(midi_pct.clamp(0, 100), Ordering::Relaxed);
    }

    /// Get global `(sfx_pct, midi_pct)` volumes (`0..=100`).
    pub fn get_volumes(&self) -> (i32, i32) {
        (
            SFX_VOLUME_PCT.load(Ordering::Relaxed),
            MIDI_VOLUME_PCT.load(Ordering::Relaxed),
        )
    }

    /// Convert a Win16 `SetVoiceNote(voice, nValue, ...)` note number (1..=84, where 1 = C1, 37 = C4)
    /// into Hz using equal temperament (A4 = note 46 = 440 Hz).
    pub fn win16_note_to_hz(note: i32) -> f32 {
        if note <= 0 {
            return 0.0;
        }
        // In Windows 3.0 SOUND.DRV: note 1 = C1 (32.7 Hz), note 46 = A4 (440 Hz).
        440.0 * 2.0f32.powf((note - 46) as f32 / 12.0)
    }
}

impl Default for AdSound {
    fn default() -> Self {
        Self::new()
    }
}

fn write_pcm16_blocking(pcm: &mut [i16], sample_rate: u32, gen_atom: &AtomicU64, my_gen: u64) {
    if pcm.is_empty() {
        return;
    }
    unsafe {
        let wfx = WAVEFORMATEX {
            wFormatTag: WAVE_FORMAT_PCM as u16,
            nChannels: 1,
            nSamplesPerSec: sample_rate,
            nAvgBytesPerSec: sample_rate * 2,
            nBlockAlign: 2,
            wBitsPerSample: 16,
            cbSize: 0,
        };
        let mut hwo: HWAVEOUT = std::ptr::null_mut();
        if waveOutOpen(&mut hwo, WAVE_MAPPER, &wfx, 0, 0, 0) != 0 {
            return;
        }
        let mut hdr = WAVEHDR {
            lpData: pcm.as_mut_ptr() as *mut u8,
            dwBufferLength: (pcm.len() * 2) as u32,
            dwBytesRecorded: 0,
            dwUser: 0,
            dwFlags: 0,
            dwLoops: 0,
            lpNext: std::ptr::null_mut(),
            reserved: 0,
        };
        if waveOutPrepareHeader(hwo, &mut hdr, std::mem::size_of::<WAVEHDR>() as u32) == 0 {
            if waveOutWrite(hwo, &mut hdr, std::mem::size_of::<WAVEHDR>() as u32) == 0 {
                while (hdr.dwFlags & WHDR_DONE) == 0 {
                    if gen_atom.load(Ordering::Relaxed) != my_gen {
                        waveOutReset(hwo);
                        break;
                    }
                    thread::sleep(Duration::from_millis(5));
                }
            }
            waveOutUnprepareHeader(hwo, &mut hdr, std::mem::size_of::<WAVEHDR>() as u32);
        }
        waveOutClose(hwo);
    }
}

fn play_tones_blocking(tones: &[Tone], gen_atom: &AtomicU64, my_gen: u64) {
    let sfx_mult = (SFX_VOLUME_PCT.load(Ordering::Relaxed).clamp(0, 100) as f32) / 100.0;
    if sfx_mult <= 0.005 {
        return;
    }
    const SAMPLE_RATE: u32 = 22_050;
    let total_samples: usize = tones
        .iter()
        .map(|t| ((SAMPLE_RATE as u64 * t.duration_ms as u64) / 1000) as usize)
        .sum();
    if total_samples == 0 || total_samples > (SAMPLE_RATE as usize * 15) {
        return;
    }

    let mut pcm = Vec::<i16>::with_capacity(total_samples);
    for t in tones {
        let count = ((SAMPLE_RATE as u64 * t.duration_ms as u64) / 1000) as usize;
        if count == 0 {
            continue;
        }
        let amp = (t.volume.clamp(0.0, 1.0) * 16_000.0 * sfx_mult) as f32;
        let fade_len = (SAMPLE_RATE as usize / 200).min(count / 4).max(1);
        for i in 0..count {
            if t.freq_hz <= 1.0 {
                pcm.push(0);
            } else {
                let phase = (i as f32 * t.freq_hz) / SAMPLE_RATE as f32;
                let sq = if phase.fract() < 0.5 { 1.0f32 } else { -1.0f32 };
                let env = if i < fade_len {
                    i as f32 / fade_len as f32
                } else if i + fade_len >= count {
                    (count - 1 - i) as f32 / fade_len as f32
                } else {
                    1.0
                };
                pcm.push((sq * amp * env) as i16);
            }
        }
    }
    write_pcm16_blocking(&mut pcm, SAMPLE_RATE, gen_atom, my_gen);
}

fn play_pcm8_blocking(
    samples: &[u8],
    sample_rate: u32,
    volume: f32,
    gen_atom: &AtomicU64,
    my_gen: u64,
) {
    let sfx_mult = (SFX_VOLUME_PCT.load(Ordering::Relaxed).clamp(0, 100) as f32) / 100.0;
    if sfx_mult <= 0.005 || samples.is_empty() || samples.len() > 2_000_000 {
        return;
    }
    let scale = volume.clamp(0.0, 1.0) * 256.0 * sfx_mult;
    let fade = (sample_rate as usize / 250).min(samples.len() / 4).max(1);
    let mut pcm = Vec::<i16>::with_capacity(samples.len());
    for (i, &b) in samples.iter().enumerate() {
        let s = (b as i32 - 128) as f32 * scale;
        let env = if i < fade {
            i as f32 / fade as f32
        } else if i + fade >= samples.len() {
            (samples.len() - 1 - i) as f32 / fade as f32
        } else {
            1.0
        };
        pcm.push((s * env).clamp(-32767.0, 32767.0) as i16);
    }
    write_pcm16_blocking(&mut pcm, sample_rate, gen_atom, my_gen);
}

#[derive(Clone, Copy)]
enum MidiEventKind {
    ShortMsg(u32),
    TempoUs(u32),
}

struct MidiEvent {
    tick: u64,
    order: u32,
    kind: MidiEventKind,
}

fn read_vlq(data: &[u8], pos: &mut usize) -> u32 {
    let mut val = 0u32;
    for _ in 0..4 {
        if *pos >= data.len() {
            break;
        }
        let b = data[*pos];
        *pos += 1;
        val = (val << 7) | (b & 0x7F) as u32;
        if (b & 0x80) == 0 {
            break;
        }
    }
    val
}

fn parse_smf(smf: &[u8]) -> Option<(u16, Vec<MidiEvent>)> {
    if smf.len() < 14 || &smf[0..4] != b"MThd" {
        return None;
    }
    let hlen = u32::from_be_bytes([smf[4], smf[5], smf[6], smf[7]]) as usize;
    if 8 + hlen > smf.len() || hlen < 6 {
        return None;
    }
    let division = u16::from_be_bytes([smf[12], smf[13]]);
    if division == 0 || (division & 0x8000) != 0 {
        return None;
    }

    let mut events = Vec::new();
    let mut order = 0u32;
    let mut pos = 8 + hlen;

    while pos + 8 <= smf.len() {
        let tag = &smf[pos..pos + 4];
        let tlen = u32::from_be_bytes([smf[pos + 4], smf[pos + 5], smf[pos + 6], smf[pos + 7]])
            as usize;
        pos += 8;
        let end = (pos + tlen).min(smf.len());
        if tag == b"MTrk" {
            let mut p = pos;
            let mut tick = 0u64;
            let mut running = 0u8;
            while p < end {
                let delta = read_vlq(smf, &mut p) as u64;
                tick += delta;
                if p >= end {
                    break;
                }
                let mut status = smf[p];
                if status < 0x80 {
                    if running == 0 {
                        break;
                    }
                    status = running;
                } else {
                    p += 1;
                    if status < 0xF0 {
                        running = status;
                    }
                }
                match status {
                    0x80..=0xEF => {
                        let kind_hi = status & 0xF0;
                        let d1 = if p < end {
                            let v = smf[p];
                            p += 1;
                            v
                        } else {
                            0
                        };
                        let d2 = if kind_hi == 0xC0 || kind_hi == 0xD0 {
                            0
                        } else if p < end {
                            let v = smf[p];
                            p += 1;
                            v
                        } else {
                            0
                        };
                        // Keep volume balanced nicely (~75% velocity on Note On)
                        let d2_adj = if kind_hi == 0x90 && d2 > 0 {
                            ((d2 as u32 * 3) / 4).max(1) as u8
                        } else {
                            d2
                        };
                        let msg = (status as u32) | ((d1 as u32) << 8) | ((d2_adj as u32) << 16);
                        events.push(MidiEvent {
                            tick,
                            order,
                            kind: MidiEventKind::ShortMsg(msg),
                        });
                        order = order.wrapping_add(1);
                    }
                    0xFF => {
                        if p >= end {
                            break;
                        }
                        let meta_type = smf[p];
                        p += 1;
                        let mlen = read_vlq(smf, &mut p) as usize;
                        if meta_type == 0x51 && mlen == 3 && p + 3 <= end {
                            let tempo = ((smf[p] as u32) << 16)
                                | ((smf[p + 1] as u32) << 8)
                                | (smf[p + 2] as u32);
                            events.push(MidiEvent {
                                tick,
                                order,
                                kind: MidiEventKind::TempoUs(tempo.max(50_000)),
                            });
                            order = order.wrapping_add(1);
                        }
                        p = (p + mlen).min(end);
                    }
                    0xF0 | 0xF7 => {
                        let slen = read_vlq(smf, &mut p) as usize;
                        p = (p + slen).min(end);
                    }
                    _ => {
                        break;
                    }
                }
            }
        }
        pos = end;
    }

    events.sort_by_key(|e| (e.tick, e.order));
    Some((division, events))
}

fn play_midi_blocking(smf: &'static [u8], loops: u32, gen_atom: &AtomicU64, my_gen: u64) {
    let Some((division, events)) = parse_smf(smf) else {
        return;
    };
    if events.is_empty() {
        return;
    }

    unsafe {
        let mut hmo: HMIDIOUT = std::ptr::null_mut();
        if midiOutOpen(&mut hmo, MIDI_MAPPER, 0, 0, 0) != 0 {
            return;
        }

        let mut iter = 0u32;
        'outer: while loops == 0 || iter < loops {
            iter += 1;
            let mut tempo_us: u64 = 500_000; // 120 BPM default
            let mut last_tick: u64 = 0;
            let mut target_time = Instant::now();

            for ev in &events {
                if gen_atom.load(Ordering::Relaxed) != my_gen {
                    break 'outer;
                }
                let dt_ticks = ev.tick.saturating_sub(last_tick);
                if dt_ticks > 0 {
                    let wait_us = (dt_ticks * tempo_us) / (division as u64);
                    target_time += Duration::from_micros(wait_us);
                    loop {
                        if gen_atom.load(Ordering::Relaxed) != my_gen {
                            break 'outer;
                        }
                        let now = Instant::now();
                        if now >= target_time {
                            break;
                        }
                        let rem = target_time - now;
                        thread::sleep(rem.min(Duration::from_millis(10)));
                    }
                    last_tick = ev.tick;
                }

                match ev.kind {
                    MidiEventKind::ShortMsg(mut msg) => {
                        let midi_pct = MIDI_VOLUME_PCT.load(Ordering::Relaxed).clamp(0, 100) as u32;
                        let kind_hi = msg & 0xF0;
                        if kind_hi == 0x90 {
                            let vel = (msg >> 16) & 0x7F;
                            if vel > 0 {
                                if midi_pct == 0 {
                                    continue;
                                }
                                let scaled = ((vel * midi_pct) / 100).clamp(1, 127);
                                msg = (msg & 0x0000_FFFF) | (scaled << 16);
                            }
                        } else if kind_hi == 0xB0 && ((msg >> 8) & 0x7F) == 7 {
                            let cc_vol = (msg >> 16) & 0x7F;
                            let scaled = ((cc_vol * midi_pct) / 100).min(127);
                            msg = (msg & 0x0000_FFFF) | (scaled << 16);
                        }
                        midiOutShortMsg(hmo, msg);
                    }
                    MidiEventKind::TempoUs(t) => {
                        tempo_us = t as u64;
                    }
                }
            }

            // Brief pause between repeats (and silence held notes)
            midiOutReset(hmo);
            if loops == 0 || iter < loops {
                for _ in 0..40 {
                    if gen_atom.load(Ordering::Relaxed) != my_gen {
                        break 'outer;
                    }
                    thread::sleep(Duration::from_millis(10));
                }
            }
        }

        midiOutReset(hmo);
        midiOutClose(hmo);
    }
}
