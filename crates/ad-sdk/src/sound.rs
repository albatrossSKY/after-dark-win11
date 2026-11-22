//! Lightweight Win16 `SOUND.DRV` synthesizer over Win32 WinMM (`waveOut`).
//!
//! 1991 After Dark modules like `CLOCKS.AD` used `OpenSound`, `SetVoiceNote`,
//! `SetVoiceSound`, `StartSound`, and `CloseSound` to drive the PC speaker.
//! On Windows 11, this plays clean, non-blocking retro square-wave tones via `waveOut`.

use std::sync::mpsc::{self, Sender};
use std::thread;

use windows_sys::Win32::Media::Audio::{
    HWAVEOUT, WAVEFORMATEX, WAVEHDR, WAVE_FORMAT_PCM, WAVE_MAPPER, WHDR_DONE, waveOutClose,
    waveOutOpen, waveOutPrepareHeader, waveOutUnprepareHeader, waveOutWrite,
};

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

enum SoundCmd {
    PlaySequence(Vec<Tone>),
}

/// Non-blocking retro PC-speaker synthesizer handle.
#[derive(Clone)]
pub struct AdSound {
    tx: Sender<SoundCmd>,
}

impl AdSound {
    pub fn new() -> Self {
        let (tx, rx) = mpsc::channel::<SoundCmd>();
        let _ = thread::Builder::new()
            .name("ad-sound".to_string())
            .spawn(move || {
                while let Ok(cmd) = rx.recv() {
                    match cmd {
                        SoundCmd::PlaySequence(tones) => {
                            play_tones_blocking(&tones);
                        }
                    }
                }
            });
        Self { tx }
    }

    /// Play a sequence of retro tones asynchronously (drops if worker busy/closed).
    pub fn play_tones(&self, tones: Vec<Tone>) {
        if !tones.is_empty() {
            let _ = self.tx.send(SoundCmd::PlaySequence(tones));
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

fn play_tones_blocking(tones: &[Tone]) {
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
        let amp = (t.volume.clamp(0.0, 1.0) * 16_000.0) as f32;
        let fade_len = (SAMPLE_RATE as usize / 200).min(count / 4).max(1);
        for i in 0..count {
            if t.freq_hz <= 1.0 {
                pcm.push(0);
            } else {
                let phase = (i as f32 * t.freq_hz) / SAMPLE_RATE as f32;
                // Slightly softened square wave (classic PC speaker warmth without harsh clicks)
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

    unsafe {
        let wfx = WAVEFORMATEX {
            wFormatTag: WAVE_FORMAT_PCM as u16,
            nChannels: 1,
            nSamplesPerSec: SAMPLE_RATE,
            nAvgBytesPerSec: SAMPLE_RATE * 2,
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
                    thread::sleep(std::time::Duration::from_millis(5));
                }
            }
            waveOutUnprepareHeader(hwo, &mut hdr, std::mem::size_of::<WAVEHDR>() as u32);
        }
        waveOutClose(hwo);
    }
}
