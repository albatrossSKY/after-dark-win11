#!/usr/bin/env python3
"""
Extracts lossless original assets (BMP, ICO, CUR, strings, AD_CONTROL JSON) and
annotated 16-bit x86 NE disassemblies for Phase 1 targets:
  - AD.EXE (Host, Starry Night, Randomizer)
  - AD_LIB.DLL
  - TOASTERS.AD (Flying Toasters)
  - NOCTURNE.AD (Nocturnes)
  - CLOCKS.AD (Clocks)
"""

import json
import os
import struct
import sys

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE, "tools"))
from ne_inspect import NEFile

UNPACKED = os.path.join(BASE, "raw", "unpacked")
ASSETS = os.path.join(BASE, "assets")
DISASM = os.path.join(BASE, "docs", "disasm")


def parse_ad_control(data: bytes) -> dict:
    ctype = struct.unpack_from("<H", data, 0)[0]
    title = data[2:22].split(b"\x00", 1)[0].decode("cp1252", "replace")
    count, default_val = struct.unpack_from("<HH", data, 22)
    info = {
        "type": ctype,
        "title": title,
        "count": count,
        "default_value": default_val,
    }
    if ctype == 1:  # Labeled slider
        labels = []
        off = 32
        for _ in range(count):
            labels.append(data[off : off + 16].split(b"\x00", 1)[0].decode("cp1252", "replace"))
            off += 16
        thresholds = list(struct.unpack_from(f"<{count}H", data, off)) if off + count * 2 <= len(data) else []
        info["labels"] = labels
        info["thresholds"] = thresholds
    elif ctype == 2:  # Numeric slider
        unit = data[32:48].split(b"\x00", 1)[0].decode("cp1252", "replace")
        min_v, max_v, f3, f4 = struct.unpack_from("<HHHH", data, 48)
        info["unit"] = unit
        info["min"] = min_v
        info["max"] = max_v
        info["extra1"] = f3
        info["extra2"] = f4
    elif ctype == 3:  # Menu / radio choices
        choices = []
        off = 32
        for _ in range(count):
            choices.append(data[off : off + 16].split(b"\x00", 1)[0].decode("cp1252", "replace"))
            off += 16
        info["choices"] = choices
    return info


def extract_ico_cur(ne: NEFile, out_dir: str):
    """Reconstruct valid .ico and .cur files from NE RT_GROUP_ICON/RT_ICON and RT_GROUP_CURSOR/RT_CURSOR."""
    icons_by_id = {r["id"]: r["data"] for r in ne.resources if r["type"] == "RT_ICON"}
    cursors_by_id = {r["id"]: r["data"] for r in ne.resources if r["type"] == "RT_CURSOR"}

    for r in ne.resources:
        if r["type"] == "RT_GROUP_ICON":
            d = r["data"]
            res_type, count = struct.unpack_from("<HH", d, 2)
            entries = []
            off = 6
            for _ in range(count):
                w, h, cc, rsv, planes, bpp, sz, icon_id = struct.unpack_from("<BBBBHHIH", d, off)
                off += 14
                img = icons_by_id.get(f"#{icon_id}")
                if img:
                    entries.append((w, h, cc, rsv, planes, bpp, img))
            if entries:
                hdr = bytearray(struct.pack("<HHH", 0, 1, len(entries)))
                img_off = 6 + 16 * len(entries)
                body = bytearray()
                for w, h, cc, rsv, planes, bpp, img in entries:
                    hdr += struct.pack("<BBBBHHII", w, h, cc, rsv, planes, bpp, len(img), img_off)
                    body += img
                    img_off += len(img)
                rid = r["id"].lstrip("#")
                with open(os.path.join(out_dir, f"icon_{rid}.ico"), "wb") as f:
                    f.write(hdr + body)
        elif r["type"] == "RT_GROUP_CURSOR":
            d = r["data"]
            res_type, count = struct.unpack_from("<HH", d, 2)
            entries = []
            off = 6
            for _ in range(count):
                w, h_x2, planes, bpp, sz, cur_id = struct.unpack_from("<HHHHIH", d, off)
                off += 14
                raw_cur = cursors_by_id.get(f"#{cur_id}")
                if raw_cur and len(raw_cur) > 4:
                    hotx, hoty = struct.unpack_from("<HH", raw_cur, 0)
                    img = raw_cur[4:]
                    entries.append((w & 0xFF, (h_x2 // 2) & 0xFF, hotx, hoty, img))
            if entries:
                hdr = bytearray(struct.pack("<HHH", 0, 2, len(entries)))
                img_off = 6 + 16 * len(entries)
                body = bytearray()
                for w, h, hotx, hoty, img in entries:
                    hdr += struct.pack("<BBBBHHII", w, h, 0, 0, hotx, hoty, len(img), img_off)
                    body += img
                    img_off += len(img)
                rid = r["id"].lstrip("#")
                with open(os.path.join(out_dir, f"cursor_{rid}.cur"), "wb") as f:
                    f.write(hdr + body)


def extract_module_assets(ne_path: str, name: str):
    ne = NEFile(ne_path)
    out_dir = os.path.join(ASSETS, name)
    os.makedirs(out_dir, exist_ok=True)
    ne.extract_resources(out_dir)
    extract_ico_cur(ne, out_dir)

    meta = {"module": ne.module_name, "description": ne.module_desc, "controls": {}, "strings": {}}
    for r in ne.resources:
        if r["type"] == "TYPE_1000":
            meta["controls"][r["id"]] = parse_ad_control(r["data"])
        elif r["type"] == "TYPE_2000":
            txt = r["data"].split(b"\x00", 1)[0].decode("cp1252", "replace")
            meta["strings"][r["id"]] = txt
    with open(os.path.join(out_dir, "metadata.json"), "w", encoding="utf-8") as f:
        json.dump(meta, f, indent=2)
    print(f"Extracted assets for {name} -> {out_dir}")


def dump_disasm(ne_path: str, seg_idx: int, out_name: str, start: int = 0, end=None):
    ne = NEFile(ne_path)
    os.makedirs(DISASM, exist_ok=True)
    text = ne.summary() + "\n\n" + ne.disassemble_segment(seg_idx, start, end)
    out_path = os.path.join(DISASM, out_name)
    with open(out_path, "w", encoding="utf-8") as f:
        f.write(text)
    print(f"Dumped {out_name} ({len(text)} bytes)")


def main():
    # Extract assets for host + Phase 1 flagship modules
    extract_module_assets(os.path.join(UNPACKED, "AD.EXE"), "ad_host")
    extract_module_assets(os.path.join(UNPACKED, "MODULES", "TOASTERS.AD"), "toasters")
    extract_module_assets(os.path.join(UNPACKED, "MODULES", "NOCTURNE.AD"), "nocturne")
    extract_module_assets(os.path.join(UNPACKED, "MODULES", "CLOCKS.AD"), "clocks")

    # Copy original standalone bitmaps & config templates
    import shutil
    os.makedirs(os.path.join(ASSETS, "bitmaps"), exist_ok=True)
    for bmp in ("ADLOGO.BMP", "BSILOGO.BMP", "EARTH.BMP"):
        shutil.copy2(os.path.join(UNPACKED, "BITMAPS", bmp), os.path.join(ASSETS, "bitmaps", bmp))
    shutil.copy2(os.path.join(UNPACKED, "AD_PREFS.INI"), os.path.join(ASSETS, "AD_PREFS.INI"))
    shutil.copy2(os.path.join(UNPACKED, "WINDOWS", "RANDOM.ADS"), os.path.join(ASSETS, "RANDOM.ADS"))

    # Disassemble Phase 1 targets
    dump_disasm(os.path.join(UNPACKED, "MODULES", "TOASTERS.AD"), 1, "toasters_seg1.asm", 0, 0x0F44)
    dump_disasm(os.path.join(UNPACKED, "MODULES", "NOCTURNE.AD"), 1, "nocturne_seg1.asm", 0, 0x09B4)
    dump_disasm(os.path.join(UNPACKED, "MODULES", "CLOCKS.AD"), 1, "clocks_seg1.asm", 0, 0x10E2)
    dump_disasm(os.path.join(UNPACKED, "AD.EXE"), 2, "ad_seg2_starry.asm")
    dump_disasm(os.path.join(UNPACKED, "AD.EXE"), 7, "ad_seg7_passcodec.asm")
    dump_disasm(os.path.join(UNPACKED, "AD.EXE"), 1, "ad_seg1_main_sleep.asm")
    dump_disasm(os.path.join(UNPACKED, "AD.EXE"), 3, "ad_seg3_controls.asm")
    dump_disasm(os.path.join(UNPACKED, "AD.EXE"), 13, "ad_seg13_runner_pal.asm")
    dump_disasm(os.path.join(UNPACKED, "AD.EXE"), 16, "ad_seg16_randomizer.asm")


if __name__ == "__main__":
    main()
