#!/usr/bin/env python3
"""
Unpacks After Dark 1.0a (1991) DISK01.IMG and decompresses all .*$ files
using the exact 9..14-bit MSB-first LZW algorithm reversed from INSTALL.EXE (SEG 9).
"""

import os
import struct
import subprocess
import sys

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ARCHIVE_PATH = sys.argv[1] if len(sys.argv) > 1 else os.path.join(BASE_DIR, "After Dark 1.0a for Windows (1991) (3.5-1.44mb).7z")
RAW_DIR = os.path.join(BASE_DIR, "raw")
FLOPPY_DIR = os.path.join(RAW_DIR, "floppy")
UNPACKED_DIR = os.path.join(RAW_DIR, "unpacked")


def decompress_ad_lzw(data: bytes) -> bytes:
    """Exact replica of INSTALL.EXE SEG 9 (ord_63 / ord_67 / ord_68) LZW decoder."""
    pos = 0
    n = len(data)
    bit_buf = 0
    bit_cnt = 0
    num_bits = 9
    max_code = (1 << num_bits) - 1

    def read_code() -> int:
        nonlocal pos, bit_buf, bit_cnt
        while bit_cnt <= 24:
            if pos < n:
                b = data[pos]
                pos += 1
            else:
                b = 0
            bit_buf = (bit_buf | (b << (24 - bit_cnt))) & 0xFFFFFFFF
            bit_cnt += 8
        code = (bit_buf >> (32 - num_bits)) & ((1 << num_bits) - 1)
        bit_buf = (bit_buf << num_bits) & 0xFFFFFFFF
        bit_cnt -= num_bits
        return code

    prefix = [0] * 18041
    append = bytearray(18041)

    def decode_string(code: int) -> bytearray:
        stack = bytearray()
        while code > 0xFF:
            stack.append(append[code])
            code = prefix[code]
            if len(stack) > 16384:
                raise ValueError("LZW decode loop detected")
        stack.append(code & 0xFF)
        return stack

    out = bytearray()
    next_code = 0x102
    clear_flag = True
    old_code = 0
    character = 0

    while True:
        new_code = read_code()
        if new_code == 0x101:  # END OF STREAM
            break
        if clear_flag:
            clear_flag = False
            old_code = new_code
            character = old_code & 0xFF
            out.append(character)
            continue
        if new_code == 0x100:  # CLEAR TABLE
            clear_flag = True
            num_bits = 9
            next_code = 0x102
            max_code = (1 << num_bits) - 1
            continue

        if new_code >= next_code:
            stack = bytearray([character]) + decode_string(old_code)
        else:
            stack = decode_string(new_code)

        character = stack[-1]
        out.extend(reversed(stack))

        if next_code <= max_code:
            prefix[next_code] = old_code
            append[next_code] = character
            next_code += 1
            if next_code == max_code and num_bits < 14:
                num_bits += 1
                max_code = (1 << num_bits) - 1

        old_code = new_code

    return bytes(out)


# Exact mapping from INSTALL.INI / floppy filenames to installed relative paths
EXACT_NAME_MAP = {
    "AD_LIB.DL$": "AD_LIB.DLL",
    "AD_PREFS.IN$": "AD_PREFS.INI",
    "ADINIT.EX$": "ADINIT.EXE",
    "AD.38$": "AD.386",
    "ADRES.EX$": "ADMODULE.SDK/ADRES.EXE",
    "LIBENTRY.OB$": "ADMODULE.SDK/LIBENTRY.OBJ",
    "MODULE.$": "ADMODULE.SDK/MODULE.H",
    "MODULE.C": "ADMODULE.SDK/MODULE.C",
    "RES_IDS.$": "ADMODULE.SDK/RES_IDS.H",
    "BLANKER.$": "ADMODULE.SDK/BLANKER/BLANKER.C",
    "BLANKER.DE$": "ADMODULE.SDK/BLANKER/BLANKER.DEF",
    "BLANKER.H": "ADMODULE.SDK/BLANKER/BLANKER.H",
    "BLANKER.MK$": "ADMODULE.SDK/BLANKER/BLANKER.MKK",
    "BLANKER.R$": "ADMODULE.SDK/BLANKER/BLANKER.RC",
    "CSTR.RS$": "ADMODULE.SDK/BLANKER/CSTR.RSC",
    "CTRL1.RS$": "ADMODULE.SDK/BLANKER/CTRL1.RSC",
    "CTRL2.RS$": "ADMODULE.SDK/BLANKER/CTRL2.RSC",
    "CTRL3.RS$": "ADMODULE.SDK/BLANKER/CTRL3.RSC",
    "CTRL4.RS$": "ADMODULE.SDK/BLANKER/CTRL4.RSC",
    "CWIN.RS$": "ADMODULE.SDK/BLANKER/CWIN.RSC",
    "MNAME.RS$": "ADMODULE.SDK/BLANKER/MNAME.RSC",
    "ADLOGO.BM$": "BITMAPS/ADLOGO.BMP",
    "BSILOGO.BM$": "BITMAPS/BSILOGO.BMP",
    "EARTH.BM$": "BITMAPS/EARTH.BMP",
    "GRAFSTAT.TX$": "WINDOWS/GRAFSTAT.TXT",
    "MESSAGES.AD$": "WINDOWS/MESSAGES.ADS",
    "RANDOM.AD$": "WINDOWS/RANDOM.ADS",
    "README.TX$": "README.TXT",
}


def main():
    os.makedirs(UNPACKED_DIR, exist_ok=True)
    ok = 0
    for fn in sorted(os.listdir(FLOPPY_DIR)):
        src = os.path.join(FLOPPY_DIR, fn)
        if not os.path.isfile(src):
            continue
        with open(src, "rb") as f:
            raw = f.read()

        compressed = fn.endswith("$")
        if fn in EXACT_NAME_MAP:
            rel_dst = EXACT_NAME_MAP[fn]
        elif fn.endswith(".A$"):
            rel_dst = os.path.join("MODULES", fn[:-3] + ".AD")
        else:
            rel_dst = fn

        dst = os.path.join(UNPACKED_DIR, rel_dst)
        os.makedirs(os.path.dirname(dst), exist_ok=True)

        if compressed:
            out = decompress_ad_lzw(raw)
        else:
            out = raw

        with open(dst, "wb") as f:
            f.write(out)

        sig = out[:2]
        sig_str = sig.decode("ascii", "replace") if all(32 <= b < 127 for b in sig) else sig.hex()
        print(f"  {fn:<16s} -> {rel_dst:<36s} {len(raw):>7d} -> {len(out):>7d} bytes  [{sig_str}]")
        ok += 1

    print(f"\nUnpacked {ok} files into {UNPACKED_DIR}")


if __name__ == "__main__":
    main()
