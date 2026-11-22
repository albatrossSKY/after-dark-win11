#!/usr/bin/env python3
"""
Pure-Python StuffIt 5 (.sit) + Method 15 (Arsenic BWT/MTF/Arithmetic) unpacker
with full CRC-32 verification and Classic Mac Resource Fork inspector.
"""

import os
import struct
import sys
import zlib

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT_DIR = os.path.join(BASE_DIR, "raw", "simpsons")

RANDOMIZATION_TABLE = [
    0xee, 0x56, 0xf8, 0xc3, 0x9d, 0x9f, 0xae, 0x2c,
    0xad, 0xcd, 0x24, 0x9d, 0xa6, 0x101, 0x18, 0xb9,
    0xa1, 0x82, 0x75, 0xe9, 0x9f, 0x55, 0x66, 0x6a,
    0x86, 0x71, 0xdc, 0x84, 0x56, 0x96, 0x56, 0xa1,
    0x84, 0x78, 0xb7, 0x32, 0x6a, 0x3, 0xe3, 0x2,
    0x11, 0x101, 0x8, 0x44, 0x83, 0x100, 0x43, 0xe3,
    0x1c, 0xf0, 0x86, 0x6a, 0x6b, 0xf, 0x3, 0x2d,
    0x86, 0x17, 0x7b, 0x10, 0xf6, 0x80, 0x78, 0x7a,
    0xa1, 0xe1, 0xef, 0x8c, 0xf6, 0x87, 0x4b, 0xa7,
    0xe2, 0x77, 0xfa, 0xb8, 0x81, 0xee, 0x77, 0xc0,
    0x9d, 0x29, 0x20, 0x27, 0x71, 0x12, 0xe0, 0x6b,
    0xd1, 0x7c, 0xa, 0x89, 0x7d, 0x87, 0xc4, 0x101,
    0xc1, 0x31, 0xaf, 0x38, 0x3, 0x68, 0x1b, 0x76,
    0x79, 0x3f, 0xdb, 0xc7, 0x1b, 0x36, 0x7b, 0xe2,
    0x63, 0x81, 0xee, 0xc, 0x63, 0x8b, 0x78, 0x38,
    0x97, 0x9b, 0xd7, 0x8f, 0xdd, 0xf2, 0xa3, 0x77,
    0x8c, 0xc3, 0x39, 0x20, 0xb3, 0x12, 0x11, 0xe,
    0x17, 0x42, 0x80, 0x2c, 0xc4, 0x92, 0x59, 0xc8,
    0xdb, 0x40, 0x76, 0x64, 0xb4, 0x55, 0x1a, 0x9e,
    0xfe, 0x5f, 0x6, 0x3c, 0x41, 0xef, 0xd4, 0xaa,
    0x98, 0x29, 0xcd, 0x1f, 0x2, 0xa8, 0x87, 0xd2,
    0xa0, 0x93, 0x98, 0xef, 0xc, 0x43, 0xed, 0x9d,
    0xc2, 0xeb, 0x81, 0xe9, 0x64, 0x23, 0x68, 0x1e,
    0x25, 0x57, 0xde, 0x9a, 0xcf, 0x7f, 0xe5, 0xba,
    0x41, 0xea, 0xea, 0x36, 0x1a, 0x28, 0x79, 0x20,
    0x5e, 0x18, 0x4e, 0x7c, 0x8e, 0x58, 0x7a, 0xef,
    0x91, 0x2, 0x93, 0xbb, 0x56, 0xa1, 0x49, 0x1b,
    0x79, 0x92, 0xf3, 0x58, 0x4f, 0x52, 0x9c, 0x2,
    0x77, 0xaf, 0x2a, 0x8f, 0x49, 0xd0, 0x99, 0x4d,
    0x98, 0x101, 0x60, 0x93, 0x100, 0x75, 0x31, 0xce,
    0x49, 0x20, 0x56, 0x57, 0xe2, 0xf5, 0x26, 0x2b,
    0x8a, 0xbf, 0xde, 0xd0, 0x83, 0x34, 0xf4, 0x17,
]

NUM_BITS = 26
ONE = 1 << (NUM_BITS - 1)
HALF = 1 << (NUM_BITS - 2)


class BitReader:
    __slots__ = ("data", "pos", "length", "buf", "bits")

    def __init__(self, data: bytes):
        self.data = data
        self.pos = 0
        self.length = len(data)
        self.buf = 0
        self.bits = 0

    def next_bit(self) -> int:
        if self.bits == 0:
            if self.pos < self.length:
                self.buf = self.data[self.pos]
                self.pos += 1
            else:
                self.buf = 0
            self.bits = 8
        self.bits -= 1
        return (self.buf >> self.bits) & 1

    def next_bits(self, n: int) -> int:
        res = 0
        for _ in range(n):
            res = (res << 1) | self.next_bit()
        return res


class ArithModel:
    __slots__ = ("first", "num", "inc", "limit", "freqs", "total")

    def __init__(self, first: int, last: int, inc: int, limit: int):
        self.first = first
        self.num = last - first + 1
        self.inc = inc
        self.limit = limit
        self.freqs = [inc] * self.num
        self.total = inc * self.num

    def reset(self):
        inc = self.inc
        self.freqs = [inc] * self.num
        self.total = inc * self.num


def decompress_arsenic(comp: bytes, expected_len: int) -> bytes:
    """Exact StuffIt Method 15 (Arsenic) decoder with CRC-32 verification."""
    br = BitReader(comp)
    rng = ONE
    code = br.next_bits(NUM_BITS)

    def next_sym(m: ArithModel) -> int:
        nonlocal rng, code
        tot = m.total
        renorm = rng // tot
        freq = code // renorm
        freqs = m.freqs
        cum = 0
        n = 0
        last_i = m.num - 1
        while n < last_i:
            f = freqs[n]
            if cum + f > freq:
                break
            cum += f
            n += 1
        symsize = freqs[n]
        lowincr = renorm * cum
        code -= lowincr
        if cum + symsize == tot:
            rng -= lowincr
        else:
            rng = symsize * renorm
        while rng <= HALF:
            rng <<= 1
            code = (code << 1) | br.next_bit()
        freqs[n] = symsize + m.inc
        tot += m.inc
        if tot > m.limit:
            new_tot = 0
            for i in range(m.num):
                v = (freqs[i] + 1) >> 1
                freqs[i] = v
                new_tot += v
            tot = new_tot
        m.total = tot
        return m.first + n

    def next_bitstr(m: ArithModel, bits: int) -> int:
        res = 0
        for i in range(bits):
            if next_sym(m):
                res |= 1 << i
        return res

    initial = ArithModel(0, 1, 1, 256)
    selector = ArithModel(0, 10, 8, 1024)
    mtf_models = [
        ArithModel(2, 3, 8, 1024),
        ArithModel(4, 7, 4, 1024),
        ArithModel(8, 15, 4, 1024),
        ArithModel(16, 31, 4, 1024),
        ArithModel(32, 63, 2, 1024),
        ArithModel(64, 127, 2, 1024),
        ArithModel(128, 255, 1, 1024),
    ]

    magic0 = next_bitstr(initial, 8)
    magic1 = next_bitstr(initial, 8)
    if (magic0, magic1) != (ord("A"), ord("s")):
        raise ValueError(f"Bad Arsenic magic: {magic0:02x} {magic1:02x}")

    blockbits = next_bitstr(initial, 4) + 9
    blocksize = 1 << blockbits
    endofblocks = next_sym(initial)
    compcrc = 0
    out = bytearray()

    while not endofblocks:
        mtf = list(range(256))
        randomized = next_sym(initial)
        tidx = next_bitstr(initial, blockbits)
        block = bytearray()

        while True:
            sel = next_sym(selector)
            if sel == 0 or sel == 1:
                zstate = 1
                zcount = 0
                while sel < 2:
                    if sel == 0:
                        zcount += zstate
                    else:
                        zcount += 2 * zstate
                    zstate <<= 1
                    sel = next_sym(selector)
                block.extend([mtf[0]] * zcount)
            if sel == 10:
                break
            elif sel == 2:
                sym = 1
            else:
                sym = next_sym(mtf_models[sel - 3])
            val = mtf.pop(sym)
            mtf.insert(0, val)
            block.append(val)

        numbytes = len(block)
        if numbytes > blocksize or tidx >= numbytes:
            raise ValueError(f"Corrupt Arsenic block: numbytes={numbytes} tidx={tidx}")

        selector.reset()
        for m in mtf_models:
            m.reset()

        if next_sym(initial):
            compcrc = next_bitstr(initial, 32)
            endofblocks = 1

        # Inverse BWT (O(N) counting sort)
        counts = [0] * 256
        for b in block:
            counts[b] += 1
        starts = [0] * 256
        acc = 0
        for i in range(256):
            starts[i] = acc
            acc += counts[i]
        transform = [0] * numbytes
        for i, b in enumerate(block):
            transform[starts[b]] = i
            starts[b] += 1

        # Emit block with optional randomization & RLE-4 decode
        bcount = 0
        run_count = 0
        last = 0
        ridx = 0
        rcount = RANDOMIZATION_TABLE[0]
        while bcount < numbytes:
            tidx = transform[tidx]
            b = block[tidx]
            if randomized and rcount == bcount:
                b ^= 1
                ridx = (ridx + 1) & 255
                rcount += RANDOMIZATION_TABLE[ridx]
            bcount += 1
            if run_count == 4:
                run_count = 0
                if b > 0:
                    out.extend([last] * b)
            else:
                if b == last:
                    run_count += 1
                else:
                    run_count = 1
                    last = b
                out.append(b)

    actual_crc = zlib.crc32(out) & 0xFFFFFFFF
    if actual_crc != compcrc:
        raise ValueError(f"CRC mismatch: got 0x{actual_crc:08x}, expected 0x{compcrc:08x}")
    if len(out) != expected_len:
        raise ValueError(f"Length mismatch: got {len(out)}, expected {expected_len}")
    return bytes(out)


def parse_rsrc_fork(rsrc: bytes) -> dict:
    """Parse Classic Mac Resource Fork -> {type_str: [(id, name, bytes), ...]}."""
    if len(rsrc) < 16:
        return {}
    data_off, map_off, data_len, map_len = struct.unpack_from(">IIII", rsrc, 0)
    if map_off + 28 > len(rsrc):
        return {}
    type_list_off, name_list_off = struct.unpack_from(">HH", rsrc, map_off + 24)
    tl_abs = map_off + type_list_off
    nl_abs = map_off + name_list_off
    num_types = struct.unpack_from(">H", rsrc, tl_abs)[0] + 1
    result = {}
    for ti in range(num_types):
        to = tl_abs + 2 + ti * 8
        rtype = rsrc[to : to + 4].decode("mac_roman", "replace")
        rcount = struct.unpack_from(">H", rsrc, to + 4)[0] + 1
        rref_off = struct.unpack_from(">H", rsrc, to + 6)[0]
        items = []
        for ri in range(rcount):
            ro = tl_abs + rref_off + ri * 12
            rid, name_off = struct.unpack_from(">hh", rsrc, ro)
            attr_and_off = struct.unpack_from(">I", rsrc, ro + 4)[0]
            res_data_off = data_off + (attr_and_off & 0x00FFFFFF)
            res_len = struct.unpack_from(">I", rsrc, res_data_off)[0]
            payload = rsrc[res_data_off + 4 : res_data_off + 4 + res_len]
            rname = ""
            if name_off >= 0 and nl_abs + name_off < len(rsrc):
                nlen = rsrc[nl_abs + name_off]
                rname = rsrc[nl_abs + name_off + 1 : nl_abs + name_off + 1 + nlen].decode("mac_roman", "replace")
            items.append((rid, rname, payload))
        result[rtype] = items
    return result


def safe_filename(name: str) -> str:
    return (
        name.replace("’", "'")
        .replace("\u2019", "'")
        .replace("/", "_")
        .replace(":", "_")
        .replace("?", "")
    )


def unpack_sit5(sit_path: str, out_dir: str):
    os.makedirs(out_dir, exist_ok=True)
    with open(sit_path, "rb") as f:
        data = f.read()

    arch_size, first_off, num_root, _ = struct.unpack_from(">IIHI", data, 0x54)
    print(f"Unpacking {sit_path} ({len(data):,} bytes) -> {out_dir}")

    def walk(off: int):
        cur = off
        while cur and cur + 48 <= len(data):
            magic = struct.unpack_from(">I", data, cur)[0]
            if magic != 0xA5A5A5A5:
                break
            ver = data[cur + 4]
            hdr_size = struct.unpack_from(">H", data, cur + 6)[0]
            flags = data[cur + 9]
            prev_off, next_off, parent_off, name_len, _ = struct.unpack_from(">IIIHH", data, cur + 18)
            is_dir = bool(flags & 0x40)
            if is_dir:
                first_child = struct.unpack_from(">I", data, cur + 34)[0]
                name = data[cur + 48 : cur + 48 + name_len].decode("mac_roman", "replace")
                if first_child and first_child != 0xFFFFFFFF:
                    walk(first_child)
            else:
                data_uncomp, data_comp, _ = struct.unpack_from(">IIH", data, cur + 34)
                data_method = data[cur + 46]
                name = data[cur + 48 : cur + 48 + name_len].decode("mac_roman", "replace")
                sname = safe_filename(name)
                b2 = cur + hdr_size
                flags2 = struct.unpack_from(">H", data, b2)[0]
                ftype = data[b2 + 4 : b2 + 8].decode("mac_roman", "replace")
                fcrea = data[b2 + 8 : b2 + 12].decode("mac_roman", "replace")
                pos = b2 + (36 if ver == 1 else 32)
                rsrc_uncomp = rsrc_comp = rsrc_method = 0
                if flags2 & 1:
                    rsrc_uncomp, rsrc_comp, _ = struct.unpack_from(">IIH", data, pos)
                    rsrc_method = data[pos + 12]
                    rsrc_passlen = data[pos + 13]
                    pos += 14 + rsrc_passlen
                rsrc_bytes = b""
                if rsrc_comp > 0:
                    raw_rsrc = data[pos : pos + rsrc_comp]
                    rsrc_bytes = decompress_arsenic(raw_rsrc, rsrc_uncomp) if rsrc_method == 15 else raw_rsrc
                    with open(os.path.join(out_dir, f"{sname}.rsrc"), "wb") as rf:
                        rf.write(rsrc_bytes)
                pos += rsrc_comp
                data_bytes = b""
                if data_comp > 0:
                    raw_data = data[pos : pos + data_comp]
                    data_bytes = decompress_arsenic(raw_data, data_uncomp) if data_method == 15 else raw_data
                    with open(os.path.join(out_dir, f"{sname}.data"), "wb") as df:
                        df.write(data_bytes)

                rmap = parse_rsrc_fork(rsrc_bytes) if rsrc_bytes else {}
                summary = ", ".join(f"{k}:{len(v)}" for k, v in sorted(rmap.items()))
                print(f"  OK {sname:<24} [{ftype}/{fcrea}] data={len(data_bytes):6d} rsrc={len(rsrc_bytes):7d} | {summary}")
            cur = next_off

    walk(first_off)


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python tools/unpack_sit5.py <path-to-ADSimpsons.sit> [out_dir]")
        sys.exit(1)
    sit_path = sys.argv[1]
    out_dir = sys.argv[2] if len(sys.argv) > 2 else OUT_DIR
    unpack_sit5(sit_path, out_dir)
