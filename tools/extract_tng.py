#!/usr/bin/env python3
"""
Extracts and packages all 13 Classic Mac After Dark 3.0 "Star Trek: The Next Generation"
screensaver modules' authentic sprites (RLEP), compound animation tables (OFst/OFtb),
LCARS shared bitmap fonts (ST-TNG Art), scripts/text (STR#), palettes (clut),
digitized voice/SFX clips (snd -> PCM8), and Standard MIDI themes (cmid -> MIDI)
into a compact single-file binary asset pack: assets/tng/tng.adp.
"""

import glob
import os
import struct
import sys

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE_DIR, "tools"))
from unpack_sit5 import parse_rsrc_fork
from extract_simpsons import (
    KIND_CLUT,
    KIND_MIDI,
    KIND_OFST,
    KIND_OFTB,
    KIND_PCM8,
    KIND_RLEP,
    KIND_STR_LIST,
    decode_mac_snd,
    decompress_cmid,
    encode_clut,
)

# Module IDs inside tng.adp
# 0 = Shared Sound & Art (ST-TNG Sound + ST-TNG Art)
# 1..=13 = The 13 Star Trek: TNG screensavers
MODULES = [
    (1, "Counselor Troi", ["RLEP", "OFst", "OFtb", "STR#", "clut"]),
    (2, "Data Dances", ["RLEP", "OFst", "OFtb", "clut"]),
    (3, "Encounters", ["RLEP", "OFst", "OFtb", "clut"]),
    (4, "Nanites", ["RLEP", "OFst", "OFtb", "clut"]),
    (5, "Officer's Review", ["RLEP", "STR#", "clut"]),
    (6, "Personnel Files", ["RLEP", "OFst", "OFtb", "STR#", "clut"]),
    (7, "Science Stations", ["RLEP", "OFst", "OFtb", "STR#", "clut"]),
    (8, "Starbase", ["RLEP", "OFst", "OFtb", "clut"]),
    (9, "Starfleet Messages", ["RLEP", "OFst", "OFtb", "STR#", "clut"]),
    (10, "Tachyon Particle Field", []),
    (11, "The Borg", ["RLEP", "OFst", "OFtb", "clut"]),
    (12, "Warp", ["clut"]),
    (13, "Worf's Weapons", ["RLEP", "OFst", "OFtb", "clut"]),
]

KIND_MAP = {
    "RLEP": KIND_RLEP,
    "OFst": KIND_OFST,
    "OFtb": KIND_OFTB,
    "STR#": KIND_STR_LIST,
    "clut": KIND_CLUT,
}

# 8 rich multi-track Star Trek TNG MIDI themes
MAIN_MIDI_IDS = {10, 20, 30, 37, 40, 50, 60, 95}
# Instrument samples inside ST-TNG Sound `snd ` (skip — Windows GS synth plays MIDI!)
INSTR_SND_IDS = {904, 4803, 4804, 4805, 4806, 8804}


def find_rsrc(raw_dir: str, prefix: str) -> str:
    exact = os.path.join(raw_dir, f"{prefix}.rsrc")
    if os.path.exists(exact):
        return exact
    matches = sorted(glob.glob(os.path.join(raw_dir, f"{prefix}*.rsrc")))
    if not matches:
        raise FileNotFoundError(f"Could not find {prefix}*.rsrc in {raw_dir}")
    return matches[0]


def build_pack(raw_dir: str, out_path: str):
    entries: list[tuple[int, int, int, bytes]] = []

    # 1. Shared Sound (PCM8 + MIDI) & Shared Art (LCARS RLEP fonts #2014/#2018/#2032/#2042)
    with open(find_rsrc(raw_dir, "ST-TNG Sound"), "rb") as fp:
        sres = parse_rsrc_fork(fp.read())

    pcm_cnt = 0
    for rid, _nm, d in sorted(sres.get("snd ", [])):
        if rid < 1000 or rid >= 12000 or rid in INSTR_SND_IDS:
            continue
        decoded = decode_mac_snd(d)
        if decoded is not None:
            srate, pcm = decoded
            entries.append((0, KIND_PCM8, rid, struct.pack("<H", srate) + pcm))
            pcm_cnt += 1

    midi_cnt = 0
    for rid, _nm, d in sorted(sres.get("cmid", [])):
        if rid not in MAIN_MIDI_IDS:
            continue
        smf = decompress_cmid(d)
        entries.append((0, KIND_MIDI, rid, smf))
        midi_cnt += 1

    with open(find_rsrc(raw_dir, "ST-TNG Art"), "rb") as fp:
        ares = parse_rsrc_fork(fp.read())
    art_cnt = 0
    for rid, _nm, d in sorted(ares.get("RLEP", [])):
        entries.append((0, KIND_RLEP, rid, d))
        art_cnt += 1

    print(f"Shared TNG: {pcm_cnt} PCM8 voice/SFX clips, {midi_cnt} MIDI themes, {art_cnt} LCARS font RLEPs")

    # 2. All 13 Star Trek TNG modules
    for mod_id, prefix, keep_kinds in MODULES:
        if not keep_kinds:
            print(f"  Module {mod_id:2d} ({prefix:24}): procedural")
            continue
        with open(find_rsrc(raw_dir, prefix), "rb") as fp:
            res = parse_rsrc_fork(fp.read())
        cnt = 0
        for rtype in keep_kinds:
            kcode = KIND_MAP[rtype]
            for rid, _nm, d in sorted(res.get(rtype, [])):
                # Skip standard boilerplate error STR# #1..7, #1000
                if rtype == "STR#" and rid in (1, 2, 3, 4, 5, 6, 7, 1000):
                    continue
                payload = encode_clut(d) if rtype == "clut" else d
                entries.append((mod_id, kcode, rid, payload))
                cnt += 1
        print(f"  Module {mod_id:2d} ({prefix:24}): {cnt:3d} resources")

    entries.sort(key=lambda e: (e[0], e[1], e[2]))

    header_size = 8 + len(entries) * 16
    cur_off = header_size
    dir_buf = bytearray(struct.pack("<4sI", b"ADP1", len(entries)))
    data_buf = bytearray()

    for mod_id, kind, res_id, payload in entries:
        dir_buf.extend(struct.pack("<HHhHII", mod_id, kind, res_id, 0, cur_off, len(payload)))
        data_buf.extend(payload)
        cur_off += len(payload)

    os.makedirs(os.path.dirname(out_path), exist_ok=True)
    with open(out_path, "wb") as fp:
        fp.write(dir_buf)
        fp.write(data_buf)

    total_sz = len(dir_buf) + len(data_buf)
    print(f"\nWrote {out_path}: {len(entries)} entries, {total_sz:,} bytes ({total_sz/1024/1024:.2f} MB)")


if __name__ == "__main__":
    raw_dir = sys.argv[1] if len(sys.argv) > 1 else os.path.join(BASE_DIR, "raw", "startrek_tng")
    out_path = sys.argv[2] if len(sys.argv) > 2 else os.path.join(BASE_DIR, "assets", "tng", "tng.adp")
    build_pack(raw_dir, out_path)
