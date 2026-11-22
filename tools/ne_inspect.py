#!/usr/bin/env python3
"""
Win16 NE (New Executable) parser, disassembler (Capstone 16-bit x86),
relocation resolver, and resource extractor for After Dark 1.0a (1991).
"""

import argparse
import os
import re
import struct
import sys
from typing import Dict, List, Optional, Tuple

try:
    from capstone import Cs, CS_ARCH_X86, CS_MODE_16
except ImportError:
    Cs = None

# Standard Win16 API ordinal tables (Windows 3.0 / 3.1)
WIN16_ORDINALS: Dict[str, Dict[int, str]] = {
    "KERNEL": {
        1: "FatalExit", 2: "ExitKernel", 3: "GetVersion", 4: "LocalInit",
        5: "LocalAlloc", 6: "LocalReAlloc", 7: "LocalFree", 8: "LocalLock",
        9: "LocalUnlock", 10: "LocalSize", 11: "LocalHandle", 12: "LocalFlags",
        13: "LocalCompact", 14: "LocalNotify", 15: "GlobalAlloc", 16: "GlobalReAlloc",
        17: "GlobalFree", 18: "GlobalLock", 19: "GlobalUnlock", 20: "GlobalSize",
        21: "GlobalHandle", 22: "GlobalFlags", 23: "LockSegment", 24: "UnlockSegment",
        25: "GlobalCompact", 26: "GlobalFreeAll", 29: "Yield", 30: "WaitEvent",
        31: "PostEvent", 32: "SetPriority", 33: "LockCurrentTask", 36: "GetCurrentTask",
        37: "GetCurrentPDB", 45: "LoadModule", 46: "FreeModule", 47: "GetModuleHandle",
        48: "GetModuleUsage", 49: "GetModuleFileName", 50: "GetProcAddress",
        51: "MakeProcInstance", 52: "FreeProcInstance", 53: "CallProcInstance",
        54: "GetInstanceData", 55: "Catch", 56: "Throw", 57: "GetProfileInt",
        58: "GetProfileString", 59: "WriteProfileString", 60: "FindResource",
        61: "LoadResource", 62: "LockResource", 63: "FreeResource", 64: "AccessResource",
        65: "SizeofResource", 66: "AllocResource", 67: "SetResourceHandler",
        68: "InitAtomTable", 69: "FindAtom", 70: "AddAtom", 71: "DeleteAtom",
        72: "GetAtomName", 73: "GetAtomHandle", 74: "OpenFile", 75: "OpenPathName",
        76: "DeletePathName", 81: "_lclose", 82: "_lread", 83: "_lcreat",
        84: "_llseek", 85: "_lopen", 86: "_lwrite", 88: "lstrcpy", 89: "lstrcat",
        90: "lstrlen", 91: "InitTask", 92: "GetTempDrive", 93: "GetCodeHandle",
        95: "LoadLibrary", 96: "FreeLibrary", 97: "GetTempFileName",
        98: "GetLastDiskChange", 102: "DOS3Call", 104: "GetCodeInfo",
        107: "SetErrorMode", 108: "SwitchStackTo", 109: "SwitchStackBack",
        111: "GlobalWire", 112: "GlobalUnWire", 113: "__AHSHIFT", 114: "__AHINCR",
        115: "OutputDebugString", 117: "OldYield", 121: "LocalShrink",
        127: "GetPrivateProfileInt", 128: "GetPrivateProfileString",
        129: "WritePrivateProfileString", 131: "GetDOSEnvironment",
        132: "GetWinFlags", 134: "GetWindowsDirectory", 135: "GetSystemDirectory",
        136: "GetDriveType", 137: "FatalAppExit", 138: "GetHeapSpaces",
        154: "GlobalNotify", 163: "GlobalLRUOldest", 164: "GlobalLRUNewest",
        166: "WinExec", 168: "DirectResAlloc", 169: "GetFreeSpace",
        170: "AllocCStoDSAlias", 171: "AllocDStoCSAlias", 172: "AllocAlias",
        175: "AllocSelector", 176: "FreeSelector", 177: "PrestoChangoSelector",
        178: "__WINFLAGS", 184: "GlobalDOSAlloc", 185: "GlobalDOSFree",
        191: "GlobalPageLock", 192: "GlobalPageUnlock", 197: "GlobalFix",
        198: "GlobalUnfix", 206: "AllocSelectorArray", 353: "lstrcpyn",
        354: "GetAppCompatFlags",
    },
    "USER": {
        1: "MessageBox", 2: "OldExitWindows", 3: "EnableOEMLayer", 4: "DisableOEMLayer",
        5: "InitApp", 6: "PostQuitMessage", 7: "ExitWindows", 10: "SetTimer",
        12: "KillTimer", 13: "GetTickCount", 14: "GetTimerResolution",
        15: "GetCurrentTime", 16: "ClipCursor", 17: "GetCursorPos",
        18: "SetCapture", 19: "ReleaseCapture", 20: "SetDoubleClickTime",
        21: "GetDoubleClickTime", 22: "SetFocus", 23: "GetFocus",
        24: "RemoveProp", 25: "GetProp", 26: "SetProp", 27: "EnumProps",
        28: "ClientToScreen", 29: "ScreenToClient", 30: "WindowFromPoint",
        31: "IsIconic", 32: "GetWindowRect", 33: "GetClientRect",
        34: "EnableWindow", 35: "IsWindowEnabled", 36: "GetWindowText",
        37: "SetWindowText", 38: "GetWindowTextLength", 39: "BeginPaint",
        40: "EndPaint", 41: "CreateWindow", 42: "ShowWindow", 43: "CloseWindow",
        44: "OpenIcon", 45: "BringWindowToTop", 46: "GetParent", 47: "IsWindow",
        48: "IsChild", 49: "IsWindowVisible", 50: "FindWindow", 51: "IsBear",
        52: "AnyPopup", 53: "DestroyWindow", 54: "EnumWindows", 55: "EnumChildWindows",
        56: "MoveWindow", 57: "RegisterClass", 58: "GetClassName", 59: "SetActiveWindow",
        60: "GetActiveWindow", 61: "ScrollWindow", 62: "SetScrollPos",
        63: "GetScrollPos", 64: "SetScrollRange", 65: "GetScrollRange",
        66: "GetDC", 67: "GetWindowDC", 68: "ReleaseDC", 69: "SetCursor",
        70: "SetCursorPos", 71: "ShowCursor", 72: "SetRect", 73: "SetRectEmpty",
        74: "CopyRect", 75: "IsRectEmpty", 76: "PtInRect", 77: "OffsetRect",
        78: "InflateRect", 79: "IntersectRect", 80: "UnionRect", 81: "FillRect",
        82: "InvertRect", 83: "FrameRect", 84: "DrawIcon", 85: "DrawText",
        86: "IconSize", 87: "DialogBox", 88: "EndDialog", 89: "CreateDialog",
        90: "IsDialogMessage", 91: "GetDlgItem", 92: "SetDlgItemText",
        93: "GetDlgItemText", 94: "SetDlgItemInt", 95: "GetDlgItemInt",
        96: "CheckRadioButton", 97: "CheckDlgButton", 98: "IsDlgButtonChecked",
        99: "DlgDirSelect", 100: "DlgDirList", 101: "SendDlgItemMessage",
        102: "AdjustWindowRect", 103: "MapDialogRect", 104: "MessageBeep",
        105: "FlashWindow", 106: "GetKeyState", 107: "DefWindowProc",
        108: "GetMessage", 109: "PeekMessage", 110: "PostMessage",
        111: "SendMessage", 112: "WaitMessage", 113: "TranslateMessage",
        114: "DispatchMessage", 115: "ReplyMessage", 116: "PostAppMessage",
        118: "RegisterWindowMessage", 119: "GetMessagePos", 120: "GetMessageTime",
        121: "SetWindowsHook", 122: "CallWindowProc", 123: "CallMsgFilter",
        124: "UpdateWindow", 125: "InvalidateRect", 126: "InvalidateRgn",
        127: "ValidateRect", 128: "ValidateRgn", 129: "GetClassWord",
        130: "SetClassWord", 131: "GetClassLong", 132: "SetClassLong",
        133: "GetWindowWord", 134: "SetWindowWord", 135: "GetWindowLong",
        136: "SetWindowLong", 137: "OpenClipboard", 138: "CloseClipboard",
        139: "EmptyClipboard", 140: "GetClipboardOwner", 141: "SetClipboardData",
        142: "GetClipboardData", 143: "CountClipboardFormats",
        144: "EnumClipboardFormats", 145: "RegisterClipboardFormat",
        146: "GetClipboardFormatName", 147: "SetClipboardViewer",
        148: "GetClipboardViewer", 149: "ChangeClipboardChain",
        150: "LoadMenu", 151: "CreateMenu", 152: "DestroyMenu", 153: "ChangeMenu",
        154: "CheckMenuItem", 155: "EnableMenuItem", 156: "GetSystemMenu",
        157: "GetMenu", 158: "SetMenu", 159: "GetSubMenu", 160: "DrawMenuBar",
        161: "GetMenuString", 162: "HiliteMenuItem", 163: "CreateCaret",
        164: "DestroyCaret", 165: "SetCaretPos", 166: "HideCaret", 167: "ShowCaret",
        168: "SetCaretBlinkTime", 169: "GetCaretBlinkTime", 170: "ArrangeIconicWindows",
        171: "WinHelp", 173: "LoadCursor", 174: "LoadIcon", 175: "LoadBitmap",
        176: "LoadString", 177: "LoadAccelerators", 178: "TranslateAccelerator",
        179: "GetSystemMetrics", 180: "GetSysColor", 181: "SetSysColors",
        182: "KillSystemTimer", 183: "GetCaretPos", 185: "GrayString",
        186: "SwapMouseButton", 190: "GetUpdateRect", 191: "ChildWindowFromPoint",
        192: "InSendMessage", 193: "IsClipboardFormatAvailable",
        194: "DlgDirSelectComboBox", 195: "DlgDirListComboBox", 196: "TabbedTextOut",
        197: "GetTabbedTextExtent", 200: "OpenComm", 201: "SetCommState",
        216: "UserSeeUserDo", 222: "GetKeyboardState", 223: "SetKeyboardState",
        224: "GetWindowTask", 225: "EnumTaskWindows", 227: "GetNextDlgGroupItem",
        228: "GetNextDlgTabItem", 229: "GetTopWindow", 230: "GetNextWindow",
        232: "SetWindowPos", 233: "SetParent", 234: "UnhookWindowsHook",
        235: "DefHookProc", 236: "GetCapture", 237: "GetUpdateRgn",
        238: "ExcludeUpdateRgn", 239: "DialogBoxParam", 240: "DialogBoxIndirect",
        241: "CreateDialogParam", 242: "CreateDialogIndirect", 243: "GetDialogBaseUnits",
        244: "EqualRect", 248: "GetAsyncKeyState", 252: "OpenDriver",
        258: "MapWindowPoints", 259: "BeginDeferWindowPos", 260: "DeferWindowPos",
        261: "EndDeferWindowPos", 262: "GetWindow", 263: "GetMenuItemCount",
        264: "GetMenuItemID", 265: "ShowOwnedPopups", 266: "SetMessageQueue",
        267: "ShowScrollBar", 268: "GlobalAddAtom", 269: "GlobalDeleteAtom",
        270: "GlobalFindAtom", 271: "GlobalGetAtomName", 272: "IsZoomed",
        273: "ControlPanelInfo", 277: "GetDlgCtrlID", 278: "GetDesktopHwnd",
        282: "SelectPalette", 283: "RealizePalette", 284: "GetFreeSystemResources",
        286: "GetDesktopWindow", 287: "GetLastActivePopup", 288: "GetMessageExtraInfo",
        290: "RedrawWindow", 295: "SetSysModalWindow", 296: "GetSysModalWindow",
        308: "DefDlgProc", 319: "ScrollWindowEx", 320: "SysErrorBox",
        331: "EnableHardwareInput", 332: "UserYield", 334: "GetQueueStatus",
        335: "GetInputState", 336: "LoadCursorIconHandler", 337: "GetMouseEventProc",
        356: "LoadDIBCursorHandler", 357: "LoadDIBIconHandler",
        373: "SubtractRect", 400: "FinalUserInit", 403: "UnregisterClass",
        404: "GetClassInfo", 406: "CreateCursor", 407: "CreateIcon",
        408: "CreateCursorIconIndirect", 410: "InsertMenu", 411: "AppendMenu",
        412: "RemoveMenu", 413: "DeleteMenu", 414: "ModifyMenu",
        415: "CreatePopupMenu", 416: "TrackPopupMenu", 417: "GetMenuCheckMarkDimensions",
        420: "wsprintf", 421: "wvsprintf", 422: "DlgDirSelectEx",
        423: "DlgDirSelectComboBoxEx", 430: "lstrcmp", 431: "AnsiUpper",
        432: "AnsiLower", 433: "IsCharAlpha", 434: "IsCharAlphaNumeric",
        435: "IsCharUpper", 436: "IsCharLower", 437: "AnsiUpperBuff",
        438: "AnsiLowerBuff", 451: "CreateWindowEx", 452: "CreateDialogIndirectParam",
        454: "AdjustWindowRectEx", 455: "GetIconID", 456: "LoadIconHandler",
        457: "DestroyIcon", 458: "DestroyCursor", 459: "DumpIcon",
        471: "lstrcmpi", 472: "AnsiNext", 473: "AnsiPrev",
        480: "GetUserLocalObjType", 481: "Hardware_Event", 482: "EnableScrollBar",
        483: "SystemParametersInfo",
    },
    "GDI": {
        1: "SetBkColor", 2: "SetBkMode", 3: "SetMapMode", 4: "SetROP2",
        5: "SetRelAbs", 6: "SetPolyFillMode", 7: "SetStretchBltMode",
        8: "SetTextCharacterExtra", 9: "SetTextColor", 10: "SetTextJustification",
        11: "SetWindowOrg", 12: "SetWindowExt", 13: "SetViewportOrg",
        14: "SetViewportExt", 15: "OffsetWindowOrg", 16: "ScaleWindowExt",
        17: "OffsetViewportOrg", 18: "ScaleViewportExt", 19: "LineTo",
        20: "MoveTo", 21: "ExcludeClipRect", 22: "IntersectClipRect",
        23: "Arc", 24: "Ellipse", 25: "FloodFill", 26: "Pie", 27: "Rectangle",
        28: "RoundRect", 29: "PatBlt", 30: "SaveDC", 31: "SetPixel",
        32: "OffsetClipRgn", 33: "TextOut", 34: "BitBlt", 35: "StretchBlt",
        36: "Polygon", 37: "Polyline", 38: "Escape", 39: "RestoreDC",
        40: "FillRgn", 41: "FrameRgn", 42: "InvertRgn", 43: "PaintRgn",
        44: "SelectClipRgn", 45: "SelectObject", 47: "CombineRgn",
        48: "CreateBitmap", 49: "CreateBitmapIndirect", 50: "CreateBrushIndirect",
        51: "CreateCompatibleBitmap", 52: "CreateCompatibleDC", 53: "CreateDC",
        54: "CreateEllipticRgn", 55: "CreateEllipticRgnIndirect", 56: "CreateFont",
        57: "CreateFontIndirect", 58: "CreateHatchBrush", 60: "CreatePatternBrush",
        61: "CreatePen", 62: "CreatePenIndirect", 63: "CreatePolygonRgn",
        64: "CreateRectRgn", 65: "CreateRectRgnIndirect", 66: "CreateSolidBrush",
        67: "DPtoLP", 68: "DeleteDC", 69: "DeleteObject", 70: "EnumFonts",
        71: "EnumObjects", 72: "EqualRgn", 73: "ExcludeVisRect", 74: "GetBitmapBits",
        75: "GetBkColor", 76: "GetBkMode", 77: "GetClipBox", 78: "GetCurrentPosition",
        79: "GetDCOrg", 80: "GetDeviceCaps", 81: "GetMapMode", 82: "GetObject",
        83: "GetPixel", 84: "GetPolyFillMode", 85: "GetROP2", 86: "GetRelAbs",
        87: "GetStockObject", 88: "GetStretchBltMode", 89: "GetTextCharacterExtra",
        90: "GetTextColor", 91: "GetTextExtent", 92: "GetTextFace",
        93: "GetTextMetrics", 94: "GetViewportExt", 95: "GetViewportOrg",
        96: "GetWindowExt", 97: "GetWindowOrg", 98: "IntersectVisRect",
        99: "LPtoDP", 100: "LineDDA", 101: "OffsetRgn", 102: "OffsetVisRgn",
        103: "PtVisible", 104: "RectVisible", 105: "SelectVisRgn",
        106: "SetBitmapBits", 117: "SetDCOrg", 119: "AddFontResource",
        121: "Death", 122: "Resurrection", 123: "PlayMetaFile", 124: "GetMetaFile",
        125: "CreateMetaFile", 126: "CloseMetaFile", 127: "DeleteMetaFile",
        128: "MulDiv", 129: "SaveVisRgn", 130: "RestoreVisRgn", 131: "InquireVisRgn",
        132: "SetEnvironment", 133: "GetEnvironment", 134: "GetRgnBox",
        135: "ScanLR", 136: "RemoveFontResource", 148: "SetBrushOrg",
        149: "GetBrushOrg", 150: "UnrealizeObject", 151: "CopyMetaFile",
        153: "CreateIC", 154: "GetNearestColor", 156: "CreateDiscardableBitmap",
        159: "GetMetaFileBits", 160: "SetMetaFileBits", 161: "PtInRegion",
        162: "GetBitmapDimension", 163: "SetBitmapDimension",
        169: "IsDCCurrentPalette", 172: "SetRectRgn", 173: "GetClipRgn",
        330: "EnumFontFamilies", 345: "GetTextAlign", 346: "SetTextAlign",
        348: "Chord", 349: "SetMapperFlags", 350: "GetCharWidth",
        351: "ExtTextOut", 352: "GetPhysicalFontHandle", 353: "GetAspectRatioFilter",
        354: "ShrinkGDIHeap", 360: "CreatePalette", 361: "GdiSelectPalette",
        362: "GdiRealizePalette", 363: "GetPaletteEntries", 364: "SetPaletteEntries",
        365: "RealizeDefaultPalette", 366: "UpdateColors", 367: "AnimatePalette",
        368: "ResizePalette", 370: "GetNearestPaletteIndex", 372: "ExtFloodFill",
        373: "SetSystemPaletteUse", 374: "GetSystemPaletteUse",
        375: "GetSystemPaletteEntries", 376: "ResetDC", 377: "StartDoc",
        378: "EndDoc", 379: "StartPage", 380: "EndPage",
        439: "StretchDIBits", 440: "SetDIBits", 441: "GetDIBits",
        442: "CreateDIBitmap", 443: "SetDIBitsToDevice", 444: "CreateRoundRectRgn",
        445: "CreateDIBPatternBrush", 450: "PolyPolygon", 451: "CreatePolyPolygonRgn",
    },
    "KEYBOARD": {
        1: "Inquire", 2: "Enable", 3: "Disable", 4: "ToAscii", 5: "AnsiToOem",
        6: "OemToAnsi", 7: "SetSpeed", 128: "OemKeyScan", 129: "VkKeyScan",
        130: "GetKeyboardType", 131: "MapVirtualKey", 132: "GetKBCodePage",
        133: "GetKeyNameText", 134: "AnsiToOemBuff", 135: "OemToAnsiBuff",
    },
    "SOUND": {
        1: "OpenSound", 2: "CloseSound", 3: "SetVoiceQueueSize", 4: "SetVoiceNote",
        5: "SetVoiceAccent", 6: "SetVoiceEnvelope", 7: "SetSoundNoise",
        8: "SetVoiceSound", 9: "StartSound", 10: "StopSound", 11: "WaitSoundState",
        12: "SyncAllVoices", 13: "CountVoiceNotes", 14: "GetThresholdEvent",
        15: "GetThresholdStatus", 16: "SetVoiceThreshold",
    },
}

RESOURCE_TYPE_NAMES = {
    1: "RT_CURSOR",
    2: "RT_BITMAP",
    3: "RT_ICON",
    4: "RT_MENU",
    5: "RT_DIALOG",
    6: "RT_STRING",
    7: "RT_FONTDIR",
    8: "RT_FONT",
    9: "RT_ACCELERATOR",
    10: "RT_RCDATA",
    12: "RT_GROUP_CURSOR",
    14: "RT_GROUP_ICON",
    16: "RT_VERSION",
}


class NEFile:
    def __init__(self, path: str):
        self.path = path
        with open(path, "rb") as f:
            self.data = f.read()
        if self.data[:2] != b"MZ":
            raise ValueError(f"{path}: Not an MZ file")
        self.ne_off = struct.unpack_from("<I", self.data, 0x3C)[0]
        if self.data[self.ne_off : self.ne_off + 2] != b"NE":
            raise ValueError(f"{path}: Not an NE file (sig={self.data[self.ne_off:self.ne_off+2]!r})")
        self._parse_header()
        self._parse_imports()
        self._parse_names()
        self._parse_entries()
        self._parse_segments()
        self._parse_resources()

    def _parse_header(self):
        b = self.data
        o = self.ne_off
        self.linker_ver = (b[o + 2], b[o + 3])
        self.entry_off, self.entry_len, self.crc = struct.unpack_from("<HHI", b, o + 4)
        self.prog_flags, self.app_flags = b[o + 0x0C], b[o + 0x0D]
        (
            self.auto_ds,
            self.heap_size,
            self.stack_size,
            self.init_ip,
            self.init_cs,
            self.init_sp,
            self.init_ss,
            self.seg_cnt,
            self.mod_cnt,
            self.nonres_len,
            self.seg_off,
            self.res_off,
            self.rname_off,
            self.mod_off,
            self.imp_off,
            self.nonres_off,
            self.mov_ent,
            self.align_shift,
            self.res_segs,
        ) = struct.unpack_from("<HHHHHHHHHHHHHHHIHHH", b, o + 0x0E)
        if self.align_shift == 0:
            self.align_shift = 9
        self.target_os = b[o + 0x36]
        self.exp_win_ver = (b[o + 0x3F], b[o + 0x3E])

    def _parse_imports(self):
        b = self.data
        o = self.ne_off
        self.imported_modules: List[str] = []
        for i in range(self.mod_cnt):
            name_off = struct.unpack_from("<H", b, o + self.mod_off + i * 2)[0]
            p = o + self.imp_off + name_off
            ln = b[p]
            self.imported_modules.append(b[p + 1 : p + 1 + ln].decode("ascii", "replace"))

    def _parse_name_table(self, start: int, max_end: int) -> List[Tuple[int, str]]:
        b = self.data
        p = start
        out = []
        while p < max_end and b[p] != 0:
            ln = b[p]
            nm = b[p + 1 : p + 1 + ln].decode("ascii", "replace")
            ordv = struct.unpack_from("<H", b, p + 1 + ln)[0]
            out.append((ordv, nm))
            p += 1 + ln + 2
        return out

    def _parse_names(self):
        self.resident_names = self._parse_name_table(
            self.ne_off + self.rname_off, self.ne_off + self.mod_off
        )
        self.nonresident_names = []
        if self.nonres_off and self.nonres_len:
            self.nonresident_names = self._parse_name_table(
                self.nonres_off, self.nonres_off + self.nonres_len
            )
        self.ordinal_to_name: Dict[int, str] = {}
        for ordv, nm in self.resident_names[1:]:
            self.ordinal_to_name[ordv] = nm
        for ordv, nm in self.nonresident_names[1:]:
            self.ordinal_to_name.setdefault(ordv, nm)
        self.module_name = self.resident_names[0][1] if self.resident_names else ""
        self.module_desc = self.nonresident_names[0][1] if self.nonresident_names else ""

    def _parse_entries(self):
        b = self.data
        p = self.ne_off + self.entry_off
        end = p + self.entry_len
        ordinal = 1
        self.entries: Dict[int, Tuple[int, int, int]] = {}  # ord -> (seg, off, flags)
        while p < end:
            cnt = b[p]
            if cnt == 0:
                break
            ind = b[p + 1]
            p += 2
            if ind == 0:
                ordinal += cnt
            elif ind == 0xFF:
                for _ in range(cnt):
                    flags = b[p]
                    # 2 bytes int 3fh (0xCD 0x3F)
                    seg = b[p + 3]
                    off = struct.unpack_from("<H", b, p + 4)[0]
                    self.entries[ordinal] = (seg, off, flags)
                    ordinal += 1
                    p += 6
            else:
                for _ in range(cnt):
                    flags = b[p]
                    off = struct.unpack_from("<H", b, p + 1)[0]
                    self.entries[ordinal] = (ind, off, flags)
                    ordinal += 1
                    p += 3

    def _parse_segments(self):
        b = self.data
        o = self.ne_off + self.seg_off
        self.segments = []
        for idx in range(1, self.seg_cnt + 1):
            sec_off, length, flags, min_alloc = struct.unpack_from("<HHHH", b, o + (idx - 1) * 8)
            file_off = sec_off << self.align_shift
            actual_len = 0x10000 if (length == 0 and sec_off != 0) else length
            raw = b[file_off : file_off + actual_len] if sec_off != 0 else b""
            relocs: Dict[int, str] = {}
            if (flags & 0x0100) and sec_off != 0:
                rp = file_off + actual_len
                rcnt = struct.unpack_from("<H", b, rp)[0]
                rp += 2
                for _ in range(rcnt):
                    addr_type, rel_type, off, t1, t2 = struct.unpack_from("<BBHHH", b, rp)
                    rp += 8
                    desc = self._describe_reloc(rel_type, t1, t2)
                    additive = bool(rel_type & 4)
                    if additive:
                        relocs[off] = f"{desc} (add,t={addr_type})"
                    else:
                        cur = off
                        seen = set()
                        while cur != 0xFFFF and cur not in seen and cur + 1 < len(raw):
                            seen.add(cur)
                            relocs[cur] = desc
                            nxt = struct.unpack_from("<H", raw, cur)[0]
                            cur = nxt
            self.segments.append(
                {
                    "index": idx,
                    "file_off": file_off,
                    "length": actual_len,
                    "flags": flags,
                    "is_data": bool(flags & 1),
                    "min_alloc": min_alloc,
                    "data": raw,
                    "relocs": relocs,
                }
            )

    def _describe_reloc(self, rel_type: int, t1: int, t2: int) -> str:
        kind = rel_type & 3
        if kind == 0:  # INTERNALREF
            if t1 == 0xFF:
                # Movable entry ordinal t2
                nm = self.ordinal_to_name.get(t2, f"ord_{t2}")
                ent = self.entries.get(t2)
                if ent:
                    return f"INT:{nm}({ent[0]}:{ent[1]:04X})"
                return f"INT:{nm}"
            return f"SEG{t1}:{t2:04X}"
        elif kind == 1:  # IMPORTORDINAL
            mod = self.imported_modules[t1 - 1] if 1 <= t1 <= len(self.imported_modules) else f"MOD{t1}"
            api = WIN16_ORDINALS.get(mod.upper(), {}).get(t2)
            return f"{mod}.{api}" if api else f"{mod}.#{t2}"
        elif kind == 2:  # IMPORTNAME
            mod = self.imported_modules[t1 - 1] if 1 <= t1 <= len(self.imported_modules) else f"MOD{t1}"
            p = self.ne_off + self.imp_off + t2
            ln = self.data[p]
            nm = self.data[p + 1 : p + 1 + ln].decode("ascii", "replace")
            return f"{mod}.{nm}"
        else:  # OSFIXUP
            fixups = {
                1: "FIARQQ/FJARQQ",
                2: "FISRQQ/FJSRQQ",
                3: "FICRQQ/FJCRQQ",
                4: "FIERQQ",
                5: "FIDRQQ",
                6: "FIWRQQ",
            }
            return f"OSFIXUP:{fixups.get(t1, str(t1))}"

    def _parse_resources(self):
        b = self.data
        res_base = self.ne_off + self.res_off
        self.resources = []
        if self.res_off == self.rname_off:
            return
        res_align = struct.unpack_from("<H", b, res_base)[0]
        p = res_base + 2

        def read_res_id(val: int) -> str:
            if val & 0x8000:
                return f"#{val & 0x7FFF}"
            sp = res_base + val
            ln = b[sp]
            return b[sp + 1 : sp + 1 + ln].decode("ascii", "replace")

        while True:
            type_id = struct.unpack_from("<H", b, p)[0]
            if type_id == 0:
                break
            cnt = struct.unpack_from("<H", b, p + 2)[0]
            p += 8
            if type_id & 0x8000:
                tid_num = type_id & 0x7FFF
                tname = RESOURCE_TYPE_NAMES.get(tid_num, f"TYPE_{tid_num}")
            else:
                tname = read_res_id(type_id)
            for _ in range(cnt):
                off_s, len_s, flags, rid, _rsv = struct.unpack_from("<HHHHI", b, p)
                p += 12
                rname = read_res_id(rid)
                foff = off_s << res_align
                flen = len_s << res_align
                self.resources.append(
                    {
                        "type": tname,
                        "id": rname,
                        "flags": flags,
                        "file_off": foff,
                        "length": flen,
                        "data": b[foff : foff + flen],
                    }
                )

    def summary(self) -> str:
        lines = []
        lines.append(f"File: {self.path}")
        lines.append(f"Module: {self.module_name!r} ({self.module_desc!r})")
        lines.append(
            f"CS:IP={self.init_cs}:{self.init_ip:04X}  SS:SP={self.init_ss}:{self.init_sp:04X}  "
            f"AutoDS={self.auto_ds}  Heap={self.heap_size}  Stack={self.stack_size}  "
            f"Flags=0x{self.prog_flags:02X}/0x{self.app_flags:02X}  WinVer={self.exp_win_ver[0]}.{self.exp_win_ver[1]}"
        )
        lines.append(f"Imports ({len(self.imported_modules)}): {', '.join(self.imported_modules)}")
        lines.append(f"Segments ({len(self.segments)}):")
        for s in self.segments:
            kind = "DATA" if s["is_data"] else "CODE"
            lines.append(
                f"  SEG {s['index']:2d}: {kind} off=0x{s['file_off']:05X} len=0x{s['length']:04X} "
                f"min=0x{s['min_alloc']:04X} flags=0x{s['flags']:04X} relocs={len(s['relocs'])}"
            )
        if self.entries:
            lines.append(f"Exports ({len(self.entries)}):")
            for ordv, (seg, off, flags) in sorted(self.entries.items()):
                nm = self.ordinal_to_name.get(ordv, "")
                lines.append(f"  ord {ordv:3d}: SEG{seg}:{off:04X} flags=0x{flags:02X} {nm}")
        if self.resources:
            lines.append(f"Resources ({len(self.resources)}):")
            for r in self.resources:
                lines.append(
                    f"  {r['type']:16s} {r['id']:16s} off=0x{r['file_off']:05X} len={r['length']:6d}"
                )
        return "\n".join(lines)

    def disassemble_segment(self, seg_idx: int, start: int = 0, end: Optional[int] = None) -> str:
        if Cs is None:
            raise RuntimeError("capstone not installed")
        seg = self.segments[seg_idx - 1]
        raw = seg["data"]
        if end is None or end > len(raw):
            end = len(raw)
        relocs = seg["relocs"]

        # Map labels (entry points + init CS:IP)
        labels: Dict[int, List[str]] = {}
        if seg_idx == self.init_cs:
            labels.setdefault(self.init_ip, []).append("ENTRY_POINT")
        for ordv, (eseg, eoff, _) in self.entries.items():
            if eseg == seg_idx:
                nm = self.ordinal_to_name.get(ordv, f"ord_{ordv}")
                labels.setdefault(eoff, []).append(f"EXPORT:{nm}(#{ordv})")

        md = Cs(CS_ARCH_X86, CS_MODE_16)
        out = []
        # Also pull strings from AutoDS if available for helpful comments
        ds_data = self.segments[self.auto_ds - 1]["data"] if 1 <= self.auto_ds <= len(self.segments) else b""

        for insn in md.disasm(raw[start:end], start):
            if insn.address in labels:
                for lb in labels[insn.address]:
                    out.append(f"\n; ===== {lb} =====")
            notes = []
            for roff in range(insn.address, insn.address + insn.size):
                if roff in relocs:
                    notes.append(f"@{roff-insn.address}:{relocs[roff]}")
            # Check if pushing an immediate offset that points to an ASCII string in DS
            if insn.mnemonic == "push" and insn.op_str.startswith("0x") and ds_data:
                try:
                    val = int(insn.op_str, 16)
                    if 0 < val < len(ds_data) - 3:
                        nul = ds_data.find(b"\x00", val, min(len(ds_data), val + 64))
                        if nul > val + 2:
                            cand = ds_data[val:nul]
                            if all(32 <= c < 127 or c in (9, 10, 13) for c in cand):
                                notes.append(f'DS:"{cand.decode("ascii")}"')
                except ValueError:
                    pass
            hexbytes = insn.bytes.hex()
            cmt = ("  ; " + " | ".join(notes)) if notes else ""
            out.append(f"{seg_idx}:{insn.address:04X}  {hexbytes:<16s}  {insn.mnemonic:<8s} {insn.op_str}{cmt}")
        return "\n".join(out)

    def dump_strings(self, min_len: int = 4) -> str:
        out = []
        for s in self.segments:
            if not s["is_data"]:
                continue
            out.append(f"=== DATA SEG {s['index']} (len={s['length']}) ===")
            for m in re.finditer(rb"[\x20-\x7e]{" + str(min_len).encode() + rb",}", s["data"]):
                out.append(f"  {s['index']}:{m.start():04X}: {m.group(0).decode('ascii')}")
        return "\n".join(out)

    def extract_resources(self, out_dir: str):
        os.makedirs(out_dir, exist_ok=True)
        for r in self.resources:
            tname = re.sub(r"[^A-Za-z0-9_#-]", "_", r["type"])
            rname = re.sub(r"[^A-Za-z0-9_#-]", "_", r["id"])
            ext = ".bin"
            payload = r["data"]
            if r["type"] == "RT_BITMAP":
                ext = ".bmp"
                # Prepend BITMAPFILEHEADER (14 bytes)
                # DIB header starts with biSize (40 for BITMAPINFOHEADER, 12 for BITMAPCOREHEADER)
                bi_size = struct.unpack_from("<I", payload, 0)[0]
                if bi_size == 40:
                    bpp = struct.unpack_from("<H", payload, 14)[0]
                    clr_used = struct.unpack_from("<I", payload, 32)[0]
                    ncolors = clr_used if clr_used else (1 << bpp if bpp <= 8 else 0)
                    off_bits = 14 + bi_size + ncolors * 4
                elif bi_size == 12:
                    bpp = struct.unpack_from("<H", payload, 10)[0]
                    ncolors = 1 << bpp if bpp <= 8 else 0
                    off_bits = 14 + bi_size + ncolors * 3
                else:
                    off_bits = 14 + bi_size
                bfh = struct.pack("<2sIHHI", b"BM", 14 + len(payload), 0, 0, off_bits)
                payload = bfh + payload
            fn = os.path.join(out_dir, f"{tname}_{rname}{ext}")
            with open(fn, "wb") as f:
                f.write(payload)


def main():
    ap = argparse.ArgumentParser(description="Inspect Win16 NE binaries")
    ap.add_argument("file", help="Path to NE binary (.exe, .dll, .ad)")
    ap.add_argument("--disasm", type=int, help="Disassemble 1-based segment index")
    ap.add_argument("--start", type=lambda x: int(x, 0), default=0)
    ap.add_argument("--end", type=lambda x: int(x, 0), default=None)
    ap.add_argument("--strings", action="store_true", help="Dump strings in data segments")
    ap.add_argument("--extract-res", metavar="DIR", help="Extract all NE resources to DIR")
    args = ap.parse_args()

    ne = NEFile(args.file)
    if args.extract_res:
        ne.extract_resources(args.extract_res)
        print(f"Extracted {len(ne.resources)} resources to {args.extract_res}")
    elif args.disasm:
        print(ne.disassemble_segment(args.disasm, args.start, args.end))
    elif args.strings:
        print(ne.dump_strings())
    else:
        print(ne.summary())


if __name__ == "__main__":
    main()
