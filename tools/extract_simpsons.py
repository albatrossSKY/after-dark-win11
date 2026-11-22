#!/usr/bin/env python3
"""
Extracts and packages all 15 Classic Mac After Dark 3.0 "The Simpsons" screensaver
modules' authentic sprites (RLEP), compound animation tables (OFst/OFtb), vector
drawings (Lisa), scripts/text (cSTR, List, Qery, SCLo, HElp, Hstr, STR#), palettes
(clut), digitized voice/SFX clips (snd -> PCM8), and Standard MIDI themes (cmid -> MIDI)
into a compact single-file binary asset pack: assets/simpsons/simpsons.adp.
"""

import glob
import os
import struct
import sys

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE_DIR, "tools"))
from unpack_sit5 import parse_rsrc_fork

KIND_RLEP = 1
KIND_OFST = 2
KIND_OFTB = 3
KIND_LISA = 4
KIND_CSTR = 5
KIND_LIST = 6
KIND_QERY = 7
KIND_SCLO = 8
KIND_HELP = 9
KIND_HSTR = 10
KIND_CLUT = 11
KIND_STR_LIST = 12
KIND_PCM8 = 20
KIND_MIDI = 21

# (mod_id, glob_prefix, keep_kinds)
MODULES = [
    (1, "Chalkboard", ["cSTR", "clut"]),
    (2, "Files", ["RLEP", "List", "clut"]),
    (3, "Grampa", ["RLEP", "OFst", "OFtb", "clut"]),
    (4, "Grass Skirts", ["RLEP", "OFst", "OFtb", "clut"]),
    (5, "Homer Eats", ["RLEP", "OFst", "OFtb", "clut"]),
    (6, "How to Draw", ["RLEP", "OFst", "OFtb", "Lisa", "HElp", "Hstr", "clut"]),
    (7, "Itchy & Scratchy", ["RLEP", "OFst", "OFtb", "clut", "STR#"]),
    (8, "Krusty", ["RLEP", "OFst", "OFtb", "clut"]),
    (9, "Lisa", ["RLEP", "Lisa", "clut"]),
    (10, "Mr. Burns", ["RLEP", "OFst", "OFtb", "clut"]),
    (11, "Objets B", ["RLEP", "OFst", "OFtb", "clut"]),
    (12, "Physics", ["RLEP", "clut"]),
    (13, "Simpsons Clocks", ["RLEP", "SCLo", "clut"]),
    (14, "Simpsons Trivia", ["RLEP", "OFst", "OFtb", "Qery", "clut"]),
    (15, "Snowball I", ["RLEP", "clut"]),
]

KIND_MAP = {
    "RLEP": KIND_RLEP,
    "OFst": KIND_OFST,
    "OFtb": KIND_OFTB,
    "Lisa": KIND_LISA,
    "cSTR": KIND_CSTR,
    "List": KIND_LIST,
    "Qery": KIND_QERY,
    "SCLo": KIND_SCLO,
    "HElp": KIND_HELP,
    "Hstr": KIND_HSTR,
    "clut": KIND_CLUT,
    "STR#": KIND_STR_LIST,
}

# Main 7 rich multi-track MIDI themes (skip the 4 reduced 4-voice variants #410..440)
MAIN_MIDI_IDS = {10, 20, 30, 40, 50, 60, 90}


def decompress_cmid(data: bytes) -> bytes:
    uncomp_len = struct.unpack_from(">I", data, 0)[0]
    out = bytearray()
    pos = 4
    n = len(data)
    while pos < n and len(out) < uncomp_len:
        flags = data[pos]
        pos += 1
        for bit in range(8):
            if pos >= n or len(out) >= uncomp_len:
                break
            if flags & (1 << bit):
                out.append(data[pos])
                pos += 1
            else:
                if pos + 1 >= n:
                    break
                w = struct.unpack_from(">H", data, pos)[0]
                pos += 2
                length = (w >> 12) + 3
                off = (w & 0x0FFF) - 4096
                for _ in range(length):
                    idx = len(out) + off
                    out.append(out[idx] if 0 <= idx < len(out) else 0)
    assert len(out) == uncomp_len, f"cmid length mismatch {len(out)} != {uncomp_len}"
    assert out[:4] == b"MThd", "Invalid MIDI header"
    return bytes(out)


def decode_mac_snd(data: bytes) -> tuple[int, bytes] | None:
    if len(data) < 28:
        return None
    fmt = struct.unpack_from(">H", data, 0)[0]
    if fmt == 1:
        num_synths = struct.unpack_from(">H", data, 2)[0]
        off = 4 + num_synths * 6
        num_cmds = struct.unpack_from(">H", data, off)[0]
        off += 2
        if num_cmds < 1 or off + 8 > len(data):
            return None
        _cmd, _p1, p2 = struct.unpack_from(">HHI", data, off)
        sh_off = p2
    elif fmt == 2:
        num_cmds = struct.unpack_from(">H", data, 4)[0]
        if num_cmds < 1 or 14 > len(data):
            return None
        _cmd, _p1, p2 = struct.unpack_from(">HHI", data, 6)
        sh_off = p2
    else:
        return None
    if sh_off + 22 > len(data):
        return None
    _dptr, length, srate_fix, _ls, _le, enc, _base = struct.unpack_from(">IIIIIBB", data, sh_off)
    if enc != 0:
        return None
    srate = max(4000, min(48000, round(srate_fix / 65536.0)))
    pcm = data[sh_off + 22 : sh_off + 22 + length]
    if not pcm:
        return None
    return srate, pcm


def encode_clut(data: bytes) -> bytes:
    """Convert Mac ColorTable (clut) to compact [u16 count][R,G,B * count]."""
    if len(data) < 8:
        return struct.pack("<H", 0)
    ct_size = struct.unpack_from(">H", data, 6)[0]
    count = ct_size + 1
    out = bytearray(struct.pack("<H", count))
    pos = 8
    for _ in range(count):
        if pos + 8 > len(data):
            out.extend(b"\x00\x00\x00")
        else:
            _idx, r, g, b = struct.unpack_from(">HHHH", data, pos)
            out.extend(bytes([r >> 8, g >> 8, b >> 8]))
        pos += 8
    return bytes(out)


def find_rsrc(raw_dir: str, prefix: str) -> str:
    matches = sorted(glob.glob(os.path.join(raw_dir, f"{prefix}*.rsrc")))
    if not matches:
        raise FileNotFoundError(f"Could not find {prefix}*.rsrc in {raw_dir}")
    return matches[0]


def build_pack(raw_dir: str, out_path: str):
    entries: list[tuple[int, int, int, bytes]] = []  # (mod_id, kind, res_id, payload)

    # 1. Shared Sound & MIDI (mod_id = 0)
    sound_path = find_rsrc(raw_dir, "Simpsons Sound")
    with open(sound_path, "rb") as fp:
        sres = parse_rsrc_fork(fp.read())

    pcm_cnt = 0
    for rid, _nm, d in sorted(sres.get("snd ", [])):
        if rid >= 0:
            continue  # instrument samples (MIDI uses Windows GS synth)
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

    print(f"Shared Audio: {pcm_cnt} PCM8 voice/SFX clips, {midi_cnt} Standard MIDI themes")

    # 2. All 15 Simpsons modules
    for mod_id, prefix, keep_kinds in MODULES:
        path = find_rsrc(raw_dir, prefix)
        with open(path, "rb") as fp:
            res = parse_rsrc_fork(fp.read())
        mod_entries = 0
        for rtype in keep_kinds:
            kind_code = KIND_MAP[rtype]
            for rid, _nm, d in sorted(res.get(rtype, [])):
                # Only keep STR# #100 (fake folder names in Itchy & Scratchy)
                if rtype == "STR#" and rid != 100:
                    continue
                payload = encode_clut(d) if rtype == "clut" else d
                entries.append((mod_id, kind_code, rid, payload))
                mod_entries += 1
        print(f"  Module {mod_id:2d} ({prefix:18}): {mod_entries:3d} resources")

    # Sort directory for clean deterministic binary search by (mod_id, kind, res_id)
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
    raw_dir = sys.argv[1] if len(sys.argv) > 1 else os.path.join(BASE_DIR, "raw", "simpsons")
    out_path = sys.argv[2] if len(sys.argv) > 2 else os.path.join(BASE_DIR, "assets", "simpsons", "simpsons.adp")
    build_pack(raw_dir, out_path)
