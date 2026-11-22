#!/usr/bin/env python3
"""
Extracts and packages all 12 Classic Mac After Dark 3.0 "Looney Tunes" (1995)
screensaver modules' authentic sprites (RLEP), compound animation tables (OFst/OFtb),
scripts/text (STR#, cSTR), firework spark patterns (SPrK), palettes (clut),
digitized cast voice/SFX clips (snd -> PCM8), and Standard MIDI themes (Midi -> MIDI)
into a compact single-file binary asset pack: assets/looney/looney.adp.
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
    encode_clut,
)

KIND_TEXT = 7

MACE_TAB1 = [-13, 8, 76, 222, 222, 76, 8, -13]
MACE_TAB3 = [-18, 140, 140, -18]
MACE_TAB2 = [[37, 116, 206, 330], [39, 121, 216, 346], [41, 127, 225, 361], [42, 132, 235, 377], [44, 137, 245, 392], [46, 144, 256, 410], [48, 150, 267, 428], [51, 157, 280, 449], [53, 165, 293, 470], [55, 172, 306, 490], [58, 179, 319, 511], [60, 187, 333, 534], [63, 195, 348, 557], [66, 205, 364, 583], [69, 214, 380, 609], [72, 223, 396, 635], [75, 233, 414, 663], [79, 244, 433, 694], [82, 254, 453, 725], [86, 265, 472, 756], [90, 278, 495, 792], [94, 290, 516, 826], [98, 303, 538, 862], [102, 316, 562, 901], [107, 331, 588, 942], [112, 345, 614, 983], [117, 361, 641, 1027], [122, 377, 670, 1074], [127, 394, 701, 1123], [133, 411, 732, 1172], [139, 430, 764, 1224], [145, 449, 799, 1280], [152, 469, 835, 1337], [159, 490, 872, 1397], [166, 512, 911, 1459], [173, 535, 951, 1523], [181, 558, 993, 1590], [189, 584, 1038, 1663], [197, 610, 1085, 1738], [206, 637, 1133, 1815], [215, 665, 1183, 1895], [225, 695, 1237, 1980], [235, 726, 1291, 2068], [246, 759, 1349, 2161], [257, 792, 1409, 2257], [268, 828, 1472, 2357], [280, 865, 1538, 2463], [293, 903, 1606, 2572], [306, 944, 1678, 2688], [319, 986, 1753, 2807], [334, 1030, 1832, 2933], [349, 1076, 1914, 3065], [364, 1124, 1999, 3202], [380, 1174, 2088, 3344], [398, 1227, 2182, 3494], [415, 1281, 2278, 3649], [434, 1339, 2380, 3811], [453, 1398, 2486, 3982], [473, 1461, 2598, 4160], [495, 1526, 2714, 4346], [517, 1594, 2835, 4540], [540, 1665, 2961, 4741], [564, 1740, 3093, 4953], [589, 1818, 3232, 5175], [615, 1898, 3375, 5405], [643, 1984, 3527, 5647], [671, 2072, 3683, 5898], [701, 2164, 3848, 6161], [733, 2261, 4020, 6438], [766, 2362, 4199, 6724], [800, 2467, 4386, 7024], [836, 2578, 4583, 7339], [873, 2692, 4786, 7664], [912, 2813, 5001, 8008], [952, 2938, 5223, 8364], [995, 3070, 5457, 8739], [1039, 3207, 5701, 9129], [1086, 3350, 5956, 9537], [1134, 3499, 6220, 9960], [1185, 3655, 6497, 10404], [1238, 3818, 6788, 10869], [1293, 3989, 7091, 11355], [1351, 4166, 7407, 11861], [1411, 4352, 7738, 12390], [1474, 4547, 8084, 12946], [1540, 4750, 8444, 13522], [1609, 4962, 8821, 14126], [1680, 5183, 9215, 14756], [1756, 5415, 9626, 15415], [1834, 5657, 10057, 16104], [1916, 5909, 10505, 16822], [2001, 6173, 10975, 17574], [2091, 6448, 11463, 18356], [2184, 6736, 11974, 19175], [2282, 7037, 12510, 20032], [2383, 7351, 13068, 20926], [2490, 7679, 13652, 21861], [2601, 8021, 14260, 22834], [2717, 8380, 14897, 23854], [2838, 8753, 15561, 24918], [2965, 9144, 16256, 26031], [3097, 9553, 16982, 27193], [3236, 9979, 17740, 28407], [3380, 10424, 18532, 29675], [3531, 10890, 19359, 31000], [3688, 11375, 20222, 32382], [3853, 11883, 21125, 32767], [4025, 12414, 22069, 32767], [4205, 12967, 23053, 32767], [4392, 13546, 24082, 32767], [4589, 14151, 25157, 32767], [4793, 14783, 26280, 32767], [5007, 15442, 27452, 32767], [5231, 16132, 28678, 32767], [5464, 16851, 29957, 32767], [5708, 17603, 31294, 32767], [5963, 18389, 32691, 32767], [6229, 19210, 32767, 32767], [6507, 20067, 32767, 32767], [6797, 20963, 32767, 32767], [7101, 21899, 32767, 32767], [7418, 22876, 32767, 32767], [7749, 23897, 32767, 32767], [8095, 24964, 32767, 32767], [8456, 26078, 32767, 32767], [8833, 27242, 32767, 32767], [9228, 28457, 32767, 32767], [9639, 29727, 32767, 32767]]
MACE_TAB4 = [[64, 216], [67, 226], [70, 236], [74, 246], [77, 257], [80, 268], [84, 280], [88, 294], [92, 307], [96, 321], [100, 334], [104, 350], [109, 365], [114, 382], [119, 399], [124, 416], [130, 434], [136, 454], [142, 475], [148, 495], [155, 519], [162, 541], [169, 564], [176, 590], [185, 617], [193, 644], [201, 673], [210, 703], [220, 735], [230, 767], [240, 801], [251, 838], [262, 876], [274, 914], [286, 955], [299, 997], [312, 1041], [326, 1089], [341, 1138], [356, 1188], [372, 1241], [388, 1297], [406, 1354], [424, 1415], [443, 1478], [462, 1544], [483, 1613], [505, 1684], [527, 1760], [551, 1838], [576, 1921], [601, 2007], [628, 2097], [656, 2190], [686, 2288], [716, 2389], [748, 2496], [781, 2607], [816, 2724], [853, 2846], [891, 2973], [930, 3104], [972, 3243], [1016, 3389], [1061, 3539], [1108, 3698], [1158, 3862], [1209, 4035], [1264, 4216], [1320, 4403], [1379, 4599], [1441, 4806], [1505, 5019], [1572, 5244], [1642, 5477], [1715, 5722], [1792, 5978], [1872, 6245], [1955, 6522], [2043, 6813], [2134, 7118], [2229, 7436], [2329, 7767], [2432, 8114], [2541, 8477], [2655, 8854], [2773, 9250], [2897, 9663], [3026, 10094], [3162, 10546], [3303, 11016], [3450, 11508], [3604, 12020], [3765, 12556], [3933, 13118], [4108, 13703], [4292, 14315], [4483, 14953], [4683, 15621], [4892, 16318], [5111, 17046], [5339, 17807], [5577, 18602], [5826, 19433], [6086, 20300], [6358, 21205], [6642, 22152], [6938, 23141], [7248, 24173], [7571, 25252], [7909, 26380], [8262, 27557], [8631, 28786], [9016, 30072], [9419, 31413], [9839, 32767], [10278, 32767], [10737, 32767], [11216, 32767], [11717, 32767], [12240, 32767], [12786, 32767], [13356, 32767], [13953, 32767], [14576, 32767], [15226, 32767], [15906, 32767], [16615, 32767]]
MACE_TABS = [
    (MACE_TAB1, MACE_TAB2, 4),
    (MACE_TAB3, MACE_TAB4, 2),
    (MACE_TAB1, MACE_TAB2, 4),
]


def decode_mace3(comp: bytes) -> bytes:
    idx = 0
    level = 0
    out = bytearray(len(comp) * 3)
    op = 0
    for pkt in comp:
        vals = (pkt & 7, (pkt >> 3) & 3, pkt >> 5)
        for t_i in range(3):
            v = vals[t_i]
            tab1, tab2, stride = MACE_TABS[t_i]
            row = tab2[(idx & 0x7F0) >> 4]
            if v < stride:
                curr = row[v]
            else:
                curr = -1 - row[2 * stride - v - 1]
            idx += tab1[v] - (idx >> 5)
            if idx < 0:
                idx = 0
            curr += level
            if curr > 32767:
                curr = 32767
            elif curr < -32768:
                curr = -32767
            level = curr - (curr >> 3)
            u8 = (((curr >> 8) & 0xFF) ^ 0x80) & 0xFF
            out[op] = u8
            op += 1
    return bytes(out)


def decode_looney_snd(data: bytes):
    res = decode_mac_snd(data)
    if res is not None:
        return res
    if len(data) < 84:
        return None
    fmt = struct.unpack_from(">H", data, 0)[0]
    pos = 2
    if fmt == 1:
        num_synth = struct.unpack_from(">H", data, pos)[0]
        pos += 2 + num_synth * 6
    elif fmt == 2:
        pos += 2
    else:
        return None
    if pos + 2 > len(data):
        return None
    num_cmds = struct.unpack_from(">H", data, pos)[0]
    pos += 2
    hdr_off = None
    for _ in range(num_cmds):
        if pos + 8 > len(data):
            break
        cmd, _p1, p2 = struct.unpack_from(">HHI", data, pos)
        pos += 8
        if (cmd & 0x7FFF) in (80, 81):
            hdr_off = p2
            break
    if hdr_off is None or hdr_off + 64 > len(data):
        return None
    _dptr, nch, srate_fixed, _ls, _le, enc, _bf, nframes = struct.unpack_from(
        ">IIIIIBBI", data, hdr_off
    )
    if enc == 0xFE and nch == 1:
        synth_id = struct.unpack_from(">H", data, hdr_off + 56)[0]
        if synth_id == 3:
            srate = max(4000, min(48000, srate_fixed >> 16))
            comp = data[hdr_off + 64 : hdr_off + 64 + nframes * 2]
            return srate, decode_mace3(comp)
    return None

KIND_SPRK = 14

# Module IDs inside looney.adp
# 0 = Shared Sound (Looney Tunes Sound)
# 1..=12 = The 12 Looney Tunes screensavers
MODULES = [
    (1, "ACME Home Shopping", ["RLEP", "OFst", "OFtb", "STR#", "cSTR", "clut"]),
    (2, "Cartoons 101", ["RLEP", "OFst", "OFtb", "STR#", "clut"]),
    (3, "Conducktor", ["RLEP", "OFst", "OFtb", "STR#", "clut"]),
    (4, "Desquetoppe D'Amour", ["RLEP", "OFst", "OFtb", "STR#", "clut"]),
    (5, "Marvin's Invasion", ["RLEP", "OFst", "OFtb", "STR#", "clut"]),
    (6, "Messages", ["RLEP", "OFst", "OFtb", "STR#", "clut"]),
    (7, "Michigan J. Frog", ["RLEP", "OFst", "OFtb", "STR#", "clut"]),
    (8, "Putty Tat Splat!", ["RLEP", "OFst", "OFtb", "STR#", "clut"]),
    (9, "Rabbitron", ["RLEP", "OFst", "OFtb", "STR#", "clut"]),
    (10, "Taz Desktop", ["RLEP", "OFst", "OFtb", "STR#", "clut"]),
    (11, "Wockets' Wed Gware", ["RLEP", "OFst", "OFtb", "STR#", "SPrK", "clut"]),
    (12, "Yosemite Sam", ["RLEP", "OFst", "OFtb", "STR#", "clut"]),
]

KIND_MAP = {
    "RLEP": KIND_RLEP,
    "OFst": KIND_OFST,
    "OFtb": KIND_OFTB,
    "STR#": KIND_STR_LIST,
    "cSTR": KIND_TEXT,
    "clut": KIND_CLUT,
    "SPrK": KIND_SPRK,
}

# 13 rich multi-track Standard MIDI themes (#10..#130)
MAIN_MIDI_IDS = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130}


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

    # 1. Shared Sound (PCM8 digitized cast voices/SFX + Standard MIDI songs)
    with open(find_rsrc(raw_dir, "Looney Tunes Sound"), "rb") as fp:
        sres = parse_rsrc_fork(fp.read())

    pcm_cnt = 0
    for rid, _nm, d in sorted(sres.get("snd ", [])):
        # IDs < 15000 are software synth instrument samples; >= 15000 are cast voice & SFX clips
        if rid < 15000:
            continue
        decoded = decode_looney_snd(d)
        if decoded is not None:
            srate, pcm = decoded
            entries.append((0, KIND_PCM8, rid, struct.pack("<H", srate) + pcm))
            pcm_cnt += 1

    midi_cnt = 0
    for rid, _nm, d in sorted(sres.get("Midi", [])):
        if rid not in MAIN_MIDI_IDS:
            continue
        entries.append((0, KIND_MIDI, rid, d))
        midi_cnt += 1

    print(f"Shared Looney Tunes Sound: {pcm_cnt} PCM8 voice/SFX clips, {midi_cnt} MIDI themes")

    # 2. All 12 Looney Tunes modules
    for mod_id, prefix, keep_kinds in MODULES:
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
    raw_dir = sys.argv[1] if len(sys.argv) > 1 else os.path.join(BASE_DIR, "raw", "looney_tunes")
    out_path = sys.argv[2] if len(sys.argv) > 2 else os.path.join(BASE_DIR, "assets", "looney", "looney.adp")
    build_pack(raw_dir, out_path)
