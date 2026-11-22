#!/usr/bin/env python3
"""
Extracts lossless resources (BMP, metadata JSON, TYPE_15 resource names) and
annotated 16-bit x86 NE disassemblies + data hex dumps for ALL 34 .AD modules
in raw/unpacked/MODULES/.
"""

import json
import os
import struct
import sys

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE, "tools"))
from ne_inspect import NEFile
from dump_phase1 import parse_ad_control

MOD_DIR = os.path.join(BASE, "raw", "unpacked", "MODULES")
ASSETS = os.path.join(BASE, "assets")
DISASM = os.path.join(BASE, "docs", "disasm")


def dump_hex(raw: bytes, path: str):
    lines = []
    for off in range(0, len(raw), 16):
        chunk = raw[off : off + 16]
        if any(b != 0 for b in chunk):
            hx = " ".join(f"{b:02X}" for b in chunk)
            asc = "".join(chr(b) if 32 <= b < 127 else "." for b in chunk)
            lines.append(f"{off:04X}: {hx:<47s}  {asc}")
    with open(path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")


def parse_nametable(ne: NEFile) -> dict:
    names = {}
    for r in ne.resources:
        if r["type"] == "TYPE_15":
            d = r["data"]
            p = 0
            while p + 6 < len(d):
                rec_len = struct.unpack_from("<H", d, p)[0]
                if rec_len == 0:
                    break
                rtype, rid = struct.unpack_from("<HH", d, p + 2)
                nm = d[p + 6 : p + rec_len].strip(b"\x00").decode("ascii", "replace")
                names[f"{rtype & 0x7FFF}:#{rid & 0x7FFF}"] = nm
                p += rec_len
    return names


def main():
    os.makedirs(DISASM, exist_ok=True)
    summary_rows = []

    for fn in sorted(os.listdir(MOD_DIR)):
        if not fn.upper().endswith(".AD"):
            continue
        stem = fn[:-3].lower()
        ne_path = os.path.join(MOD_DIR, fn)
        ne = NEFile(ne_path)

        out_dir = os.path.join(ASSETS, stem)
        os.makedirs(out_dir, exist_ok=True)
        ne.extract_resources(out_dir)

        nametable = parse_nametable(ne)
        meta = {
            "file": fn,
            "module": ne.module_name,
            "description": ne.module_desc,
            "imports": ne.imported_modules,
            "nametable": nametable,
            "controls": {},
            "strings": {},
            "bitmaps": [],
        }
        for r in ne.resources:
            if r["type"] == "TYPE_1000":
                meta["controls"][r["id"]] = parse_ad_control(r["data"])
            elif r["type"] == "TYPE_2000":
                txt = r["data"].split(b"\x00", 1)[0].decode("cp1252", "replace")
                meta["strings"][r["id"]] = txt
            elif r["type"] == "RT_BITMAP":
                d = r["data"]
                bi = struct.unpack_from("<I", d, 0)[0]
                if bi == 40:
                    w, h, _, bpp = struct.unpack_from("<iiHH", d, 4)
                else:
                    w, h, _, bpp = struct.unpack_from("<HHHH", d, 4)
                meta["bitmaps"].append(
                    {
                        "id": r["id"],
                        "name": nametable.get(f"2:{r['id']}", ""),
                        "width": w,
                        "height": h,
                        "bpp": bpp,
                    }
                )
        with open(os.path.join(out_dir, "metadata.json"), "w", encoding="utf-8") as f:
            json.dump(meta, f, indent=2)

        # Find MODULE export offset to estimate user code range (still dump all code segs cleanly)
        mod_off = None
        for ordv, (seg, off, _) in ne.entries.items():
            if ne.ordinal_to_name.get(ordv, "").upper() == "MODULE":
                mod_off = (seg, off)
                break

        code_segs = [s for s in ne.segments if not s["is_data"]]
        total_code = sum(s["length"] for s in code_segs)
        # Dump every code segment (for single-seg modules, dump up to min(len, mod_off+0x280) so we include MODULE + rand)
        for s in code_segs:
            idx = s["index"]
            end = s["length"]
            if len(code_segs) == 1 and mod_off and mod_off[0] == idx:
                end = min(s["length"], mod_off[1] + 0x260)
            asm = ne.summary() + "\n\n" + ne.disassemble_segment(idx, 0, end)
            asm_name = f"{stem}_seg{idx}.asm"
            with open(os.path.join(DISASM, asm_name), "w", encoding="utf-8") as f:
                f.write(asm)

        ds = ne.segments[ne.auto_ds - 1]["data"]
        dump_hex(ds, os.path.join(DISASM, f"{stem}_data.hex"))

        disp_name = meta["strings"].get("#20", stem)
        user_code = mod_off[1] if (len(code_segs) == 1 and mod_off) else total_code
        ctrls_brief = []
        for cid in ("#1", "#2", "#3", "#4"):
            c = meta["controls"].get(cid)
            if c and c["type"] != 0:
                ctrls_brief.append(f"{c['type']}:{c['title']}")
        summary_rows.append(
            (
                fn,
                disp_name,
                len(code_segs),
                user_code,
                len(meta["bitmaps"]),
                ",".join(ne.imported_modules),
                " | ".join(ctrls_brief),
            )
        )

    print(f"{'FILE':<13} {'NAME':<18} {'SEGS':>4} {'CODE':>6} {'BMPS':>4} {'IMPORTS':<28} CONTROLS")
    print("-" * 120)
    for row in summary_rows:
        print(f"{row[0]:<13} {row[1]:<18} {row[2]:>4} {row[3]:>6} {row[4]:>4} {row[5]:<28} {row[6]}")


if __name__ == "__main__":
    main()
