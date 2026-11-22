File: raw\unpacked\MODULES\DRAINO.AD
Module: 'DRAINO' ('Graphics Module Library')
CS:IP=1:375C  SS:SP=0:0000  AutoDS=2  Heap=1024  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (4): win87em, KERNEL, GDI, USER
Segments (2):
  SEG  1: CODE off=0x006A0 len=0x378E min=0x378E flags=0x0D50 relocs=417
  SEG  2: DATA off=0x04940 len=0x0A1E min=0x0A1E flags=0x0D71 relocs=17
Exports (55):
  ord   1: SEG1:0C5C flags=0x03 MODULE
  ord   2: SEG1:0C45 flags=0x03 WEP
  ord   3: SEG1:2966 flags=0x03 ___EXPORTEDSTUB
  ord   4: SEG1:0FC2 flags=0x00 
  ord   5: SEG1:0F76 flags=0x00 
  ord   6: SEG1:0F7C flags=0x00 
  ord   7: SEG1:0FA1 flags=0x00 
  ord   8: SEG1:0EB4 flags=0x00 
  ord   9: SEG1:0F16 flags=0x00 
  ord  10: SEG1:0EE4 flags=0x00 
  ord  11: SEG1:02B8 flags=0x00 
  ord  12: SEG1:02A4 flags=0x00 
  ord  13: SEG1:0290 flags=0x00 
  ord  14: SEG1:0224 flags=0x00 
  ord  15: SEG1:0E22 flags=0x00 
  ord  16: SEG1:01D9 flags=0x00 
  ord  17: SEG1:01C5 flags=0x00 
  ord  18: SEG1:0012 flags=0x00 
  ord  19: SEG1:0EA0 flags=0x00 
  ord  20: SEG1:0E3E flags=0x00 
  ord  21: SEG1:0C1E flags=0x00 
  ord  22: SEG1:1014 flags=0x00 
  ord  23: SEG1:19FC flags=0x00 
  ord  24: SEG1:17C6 flags=0x00 
  ord  25: SEG1:1368 flags=0x00 
  ord  26: SEG1:1418 flags=0x00 
  ord  27: SEG1:12F4 flags=0x00 
  ord  28: SEG1:13E2 flags=0x00 
  ord  29: SEG1:1D8E flags=0x00 
  ord  30: SEG1:1000 flags=0x00 
  ord  31: SEG1:1F58 flags=0x00 
  ord  32: SEG1:1E18 flags=0x00 
  ord  33: SEG1:21AA flags=0x00 
  ord  34: SEG1:22A8 flags=0x00 
  ord  35: SEG1:28CE flags=0x00 
  ord  36: SEG1:2362 flags=0x00 
  ord  37: SEG1:222C flags=0x00 
  ord  38: SEG1:225E flags=0x00 
  ord  39: SEG1:2938 flags=0x00 
  ord  40: SEG1:231A flags=0x00 
  ord  41: SEG1:291E flags=0x00 
  ord  42: SEG1:2390 flags=0x00 
  ord  43: SEG1:21E7 flags=0x00 
  ord  44: SEG1:221C flags=0x00 
  ord  45: SEG1:297A flags=0x00 
  ord  46: SEG1:29A2 flags=0x00 
  ord  47: SEG1:2A44 flags=0x00 
  ord  48: SEG1:2A08 flags=0x00 
  ord  49: SEG1:2A6E flags=0x00 
  ord  50: SEG1:29A6 flags=0x00 
  ord  51: SEG1:1E32 flags=0x00 
  ord  52: SEG1:3392 flags=0x00 
  ord  53: SEG1:2848 flags=0x00 
  ord  54: SEG1:2931 flags=0x00 
  ord  55: SEG1:33F2 flags=0x00 
Resources (7):
  TYPE_1000        #1               off=0x05400 len=    96
  TYPE_1000        #2               off=0x05460 len=    96
  TYPE_1000        #3               off=0x054C0 len=    64
  TYPE_1000        #4               off=0x05500 len=    64
  TYPE_2000        #10              off=0x05540 len=    80
  TYPE_2000        #20              off=0x05590 len=    16
  TYPE_2000        #30              off=0x055A0 len=   528

1:0000  1e                push     ds
1:0001  58                pop      ax
1:0002  90                nop      
1:0003  45                inc      bp
1:0004  55                push     bp
1:0005  8bec              mov      bp, sp
1:0007  1e                push     ds
1:0008  8ed8              mov      ds, ax
1:000A  4d                dec      bp
1:000B  4d                dec      bp
1:000C  8be5              mov      sp, bp
1:000E  1f                pop      ds
1:000F  5d                pop      bp
1:0010  4d                dec      bp
1:0011  cb                retf     

; ===== EXPORT:ord_18(#18) =====
1:0012  1e                push     ds
1:0013  58                pop      ax
1:0014  90                nop      
1:0015  45                inc      bp
1:0016  55                push     bp
1:0017  8bec              mov      bp, sp
1:0019  1e                push     ds
1:001A  8ed8              mov      ds, ax
1:001C  c41e1a0a          les      bx, ptr [0xa1a]
1:0020  268b4706          mov      ax, word ptr es:[bx + 6]
1:0024  3d6400            cmp      ax, 0x64
1:0027  746e              je       0x97
1:0029  7729              ja       0x54
1:002B  0ac0              or       al, al
1:002D  740a              je       0x39
1:002F  2c21              sub      al, 0x21
1:0031  7447              je       0x7a
1:0033  2c22              sub      al, 0x22
1:0035  7460              je       0x97
1:0037  eb1b              jmp      0x54
1:0039  c70616001400      mov      word ptr [0x16], 0x14
1:003F  c70618002800      mov      word ptr [0x18], 0x28
1:0045  b80100            mov      ax, 1
1:0048  a31400            mov      word ptr [0x14], ax
1:004B  a3f009            mov      word ptr [0x9f0], ax
1:004E  c706120a1027      mov      word ptr [0xa12], 0x2710
1:0054  c41e1a0a          les      bx, ptr [0xa1a]
1:0058  268b4708          mov      ax, word ptr es:[bx + 8]
1:005C  3d6400            cmp      ax, 0x64
1:005F  7503              jne      0x64
1:0061  e9df00            jmp      0x143
1:0064  7760              ja       0xc6
1:0066  0ac0              or       al, al
1:0068  744d              je       0xb7
1:006A  2c21              sub      al, 0x21
1:006C  7503              jne      0x71
1:006E  e9c200            jmp      0x133
1:0071  2c22              sub      al, 0x22
1:0073  7503              jne      0x78
1:0075  e9cb00            jmp      0x143
1:0078  eb4c              jmp      0xc6
1:007A  c70616000a00      mov      word ptr [0x16], 0xa
1:0080  c70618001400      mov      word ptr [0x18], 0x14
1:0086  b80200            mov      ax, 2
1:0089  a31400            mov      word ptr [0x14], ax
1:008C  a3f009            mov      word ptr [0x9f0], ax
1:008F  c706120a581b      mov      word ptr [0xa12], 0x1b58
1:0095  ebbd              jmp      0x54
1:0097  c70616000600      mov      word ptr [0x16], 6
1:009D  c70618000c00      mov      word ptr [0x18], 0xc
1:00A3  c70614000200      mov      word ptr [0x14], 2
1:00A9  c706f0090400      mov      word ptr [0x9f0], 4
1:00AF  c706120ad007      mov      word ptr [0xa12], 0x7d0
1:00B5  eb9d              jmp      0x54
1:00B7  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:00B8  df06f009          fild     word ptr [0x9f0]
1:00BC  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:00BD  d9e0              fchs     
1:00BF  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:00C0  d91e1000          fstp     dword ptr [0x10]
1:00C4  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:00C5  9b                wait     
1:00C6  ff36fe09          push     word ptr [0x9fe]
1:00CA  9a0b010000        lcall    0, 0x10b  ; @1:GDI.CreateCompatibleDC
1:00CF  a36e00            mov      word ptr [0x6e], ax
1:00D2  ff36fe09          push     word ptr [0x9fe]
1:00D6  c41e1a0a          les      bx, ptr [0xa1a]
1:00DA  268b4702          mov      ax, word ptr es:[bx + 2]
1:00DE  b90600            mov      cx, 6
1:00E1  99                cdq      
1:00E2  f7f9              idiv     cx
1:00E4  50                push     ax
1:00E5  268b4704          mov      ax, word ptr es:[bx + 4]
1:00E9  b90c00            mov      cx, 0xc
1:00EC  99                cdq      
1:00ED  f7f9              idiv     cx
1:00EF  50                push     ax
1:00F0  9a1c010000        lcall    0, 0x11c  ; @1:GDI.CreateCompatibleBitmap
1:00F5  a37000            mov      word ptr [0x70], ax
1:00F8  0bc0              or       ax, ax
1:00FA  744f              je       0x14b
1:00FC  ff366e00          push     word ptr [0x6e]
1:0100  50                push     ax
1:0101  9a2d010000        lcall    0, 0x12d  ; @1:GDI.SelectObject
1:0106  ff36fe09          push     word ptr [0x9fe]
1:010A  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateCompatibleDC
1:010F  a37200            mov      word ptr [0x72], ax
1:0112  ff36fe09          push     word ptr [0x9fe]
1:0116  b82e00            mov      ax, 0x2e
1:0119  50                push     ax
1:011A  50                push     ax
1:011B  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateCompatibleBitmap
1:0120  a37400            mov      word ptr [0x74], ax
1:0123  0bc0              or       ax, ax
1:0125  7424              je       0x14b
1:0127  ff367200          push     word ptr [0x72]
1:012B  50                push     ax
1:012C  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectObject
1:0131  eb1d              jmp      0x150
1:0133  a19005            mov      ax, word ptr [0x590]
1:0136  8b169205          mov      dx, word ptr [0x592]
1:013A  a31000            mov      word ptr [0x10], ax
1:013D  89161200          mov      word ptr [0x12], dx
1:0141  eb83              jmp      0xc6
1:0143  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0144  df06f009          fild     word ptr [0x9f0]
1:0148  e974ff            jmp      0xbf
1:014B  b80100            mov      ax, 1
1:014E  eb6d              jmp      0x1bd
1:0150  2bc0              sub      ax, ax
1:0152  a31c00            mov      word ptr [0x1c], ax
1:0155  a31a00            mov      word ptr [0x1a], ax
1:0158  a3f209            mov      word ptr [0x9f2], ax
1:015B  b8000a            mov      ax, 0xa00
1:015E  1e                push     ds
1:015F  50                push     ax
1:0160  c41e1a0a          les      bx, ptr [0xa1a]
1:0164  268b4702          mov      ax, word ptr es:[bx + 2]
1:0168  99                cdq      
1:0169  2bc2              sub      ax, dx
1:016B  d1f8              sar      ax, 1
1:016D  8bc8              mov      cx, ax
1:016F  2d1700            sub      ax, 0x17
1:0172  50                push     ax
1:0173  268b4704          mov      ax, word ptr es:[bx + 4]
1:0177  99                cdq      
1:0178  2bc2              sub      ax, dx
1:017A  d1f8              sar      ax, 1
1:017C  8bd0              mov      dx, ax
1:017E  2d1700            sub      ax, 0x17
1:0181  50                push     ax
1:0182  83c117            add      cx, 0x17
1:0185  51                push     cx
1:0186  83c217            add      dx, 0x17
1:0189  52                push     dx
1:018A  9ab3010000        lcall    0, 0x1b3  ; @1:USER.SetRect
1:018F  b8f609            mov      ax, 0x9f6
1:0192  1e                push     ds
1:0193  50                push     ax
1:0194  2bc0              sub      ax, ax
1:0196  50                push     ax
1:0197  50                push     ax
1:0198  c41e1a0a          les      bx, ptr [0xa1a]
1:019C  268b4702          mov      ax, word ptr es:[bx + 2]
1:01A0  b90600            mov      cx, 6
1:01A3  99                cdq      
1:01A4  f7f9              idiv     cx
1:01A6  50                push     ax
1:01A7  268b4704          mov      ax, word ptr es:[bx + 4]
1:01AB  b90c00            mov      cx, 0xc
1:01AE  99                cdq      
1:01AF  f7f9              idiv     cx
1:01B1  50                push     ax
1:01B2  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:01B7  0e                push     cs
1:01B8  e8d908            call     0xa94
1:01BB  2bc0              sub      ax, ax
1:01BD  4d                dec      bp
1:01BE  4d                dec      bp
1:01BF  8be5              mov      sp, bp
1:01C1  1f                pop      ds
1:01C2  5d                pop      bp
1:01C3  4d                dec      bp
1:01C4  cb                retf     

; ===== EXPORT:ord_17(#17) =====
1:01C5  1e                push     ds
1:01C6  58                pop      ax
1:01C7  90                nop      
1:01C8  45                inc      bp
1:01C9  55                push     bp
1:01CA  8bec              mov      bp, sp
1:01CC  1e                push     ds
1:01CD  8ed8              mov      ds, ax
1:01CF  2bc0              sub      ax, ax
1:01D1  4d                dec      bp
1:01D2  4d                dec      bp
1:01D3  8be5              mov      sp, bp
1:01D5  1f                pop      ds
1:01D6  5d                pop      bp
1:01D7  4d                dec      bp
1:01D8  cb                retf     

; ===== EXPORT:ord_16(#16) =====
1:01D9  1e                push     ds
1:01DA  58                pop      ax
1:01DB  90                nop      
1:01DC  45                inc      bp
1:01DD  55                push     bp
1:01DE  8bec              mov      bp, sp
1:01E0  1e                push     ds
1:01E1  8ed8              mov      ds, ax
1:01E3  0e                push     cs
1:01E4  e8c901            call     0x3b0
1:01E7  a1120a            mov      ax, word ptr [0xa12]
1:01EA  99                cdq      
1:01EB  3b161c00          cmp      dx, word ptr [0x1c]
1:01EF  7710              ja       0x201
1:01F1  7206              jb       0x1f9
1:01F3  3b061a00          cmp      ax, word ptr [0x1a]
1:01F7  7708              ja       0x201
1:01F9  c706f2090100      mov      word ptr [0x9f2], 1
1:01FF  eb0a              jmp      0x20b
1:0201  83061a0001        add      word ptr [0x1a], 1
1:0206  83161c0000        adc      word ptr [0x1c], 0
1:020B  c41e1a0a          les      bx, ptr [0xa1a]
1:020F  26837f0a00        cmp      word ptr es:[bx + 0xa], 0
1:0214  7404              je       0x21a
1:0216  0e                push     cs
1:0217  e8eb06            call     0x905
1:021A  2bc0              sub      ax, ax
1:021C  4d                dec      bp
1:021D  4d                dec      bp
1:021E  8be5              mov      sp, bp
1:0220  1f                pop      ds
1:0221  5d                pop      bp
1:0222  4d                dec      bp
1:0223  cb                retf     

; ===== EXPORT:ord_14(#14) =====
1:0224  1e                push     ds
1:0225  58                pop      ax
1:0226  90                nop      
1:0227  45                inc      bp
1:0228  55                push     bp
1:0229  8bec              mov      bp, sp
1:022B  1e                push     ds
1:022C  8ed8              mov      ds, ax
1:022E  833e6e0000        cmp      word ptr [0x6e], 0
1:0233  740f              je       0x244
1:0235  ff366e00          push     word ptr [0x6e]
1:0239  9a66020000        lcall    0, 0x266  ; @1:GDI.DeleteDC
1:023E  c7066e000000      mov      word ptr [0x6e], 0
1:0244  833e700000        cmp      word ptr [0x70], 0
1:0249  740f              je       0x25a
1:024B  ff367000          push     word ptr [0x70]
1:024F  9a7c020000        lcall    0, 0x27c  ; @1:GDI.DeleteObject
1:0254  c70670000000      mov      word ptr [0x70], 0
1:025A  833e720000        cmp      word ptr [0x72], 0
1:025F  740f              je       0x270
1:0261  ff367200          push     word ptr [0x72]
1:0265  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteDC
1:026A  c70672000000      mov      word ptr [0x72], 0
1:0270  833e740000        cmp      word ptr [0x74], 0
1:0275  740f              je       0x286
1:0277  ff367400          push     word ptr [0x74]
1:027B  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteObject
1:0280  c70674000000      mov      word ptr [0x74], 0
1:0286  2bc0              sub      ax, ax
1:0288  4d                dec      bp
1:0289  4d                dec      bp
1:028A  8be5              mov      sp, bp
1:028C  1f                pop      ds
1:028D  5d                pop      bp
1:028E  4d                dec      bp
1:028F  cb                retf     

; ===== EXPORT:ord_13(#13) =====
1:0290  1e                push     ds
1:0291  58                pop      ax
1:0292  90                nop      
1:0293  45                inc      bp
1:0294  55                push     bp
1:0295  8bec              mov      bp, sp
1:0297  1e                push     ds
1:0298  8ed8              mov      ds, ax
1:029A  2bc0              sub      ax, ax
1:029C  4d                dec      bp
1:029D  4d                dec      bp
1:029E  8be5              mov      sp, bp
1:02A0  1f                pop      ds
1:02A1  5d                pop      bp
1:02A2  4d                dec      bp
1:02A3  cb                retf     

; ===== EXPORT:ord_12(#12) =====
1:02A4  1e                push     ds
1:02A5  58                pop      ax
1:02A6  90                nop      
1:02A7  45                inc      bp
1:02A8  55                push     bp
1:02A9  8bec              mov      bp, sp
1:02AB  1e                push     ds
1:02AC  8ed8              mov      ds, ax
1:02AE  2bc0              sub      ax, ax
1:02B0  4d                dec      bp
1:02B1  4d                dec      bp
1:02B2  8be5              mov      sp, bp
1:02B4  1f                pop      ds
1:02B5  5d                pop      bp
1:02B6  4d                dec      bp
1:02B7  cb                retf     

; ===== EXPORT:ord_11(#11) =====
1:02B8  1e                push     ds
1:02B9  58                pop      ax
1:02BA  90                nop      
1:02BB  45                inc      bp
1:02BC  55                push     bp
1:02BD  8bec              mov      bp, sp
1:02BF  1e                push     ds
1:02C0  8ed8              mov      ds, ax
1:02C2  c41e080a          les      bx, ptr [0xa08]
1:02C6  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:02CB  7405              je       0x2d2
1:02CD  2bc0              sub      ax, ax
1:02CF  e9d600            jmp      0x3a8
1:02D2  8b4606            mov      ax, word ptr [bp + 6]
1:02D5  0bc0              or       ax, ax
1:02D7  740c              je       0x2e5
1:02D9  48                dec      ax
1:02DA  7441              je       0x31d
1:02DC  48                dec      ax
1:02DD  48                dec      ax
1:02DE  7503              jne      0x2e3
1:02E0  e9be00            jmp      0x3a1
1:02E3  ebe8              jmp      0x2cd
1:02E5  c41e1a0a          les      bx, ptr [0xa1a]
1:02E9  268b4706          mov      ax, word ptr es:[bx + 6]
1:02ED  3d6400            cmp      ax, 0x64
1:02F0  7465              je       0x357
1:02F2  7729              ja       0x31d
1:02F4  0ac0              or       al, al
1:02F6  740a              je       0x302
1:02F8  2c21              sub      al, 0x21
1:02FA  743e              je       0x33a
1:02FC  2c22              sub      al, 0x22
1:02FE  7457              je       0x357
1:0300  eb1b              jmp      0x31d
1:0302  c70616001400      mov      word ptr [0x16], 0x14
1:0308  c70618002800      mov      word ptr [0x18], 0x28
1:030E  b80100            mov      ax, 1
1:0311  a31400            mov      word ptr [0x14], ax
1:0314  a3f009            mov      word ptr [0x9f0], ax
1:0317  c706120a1027      mov      word ptr [0xa12], 0x2710
1:031D  c41e1a0a          les      bx, ptr [0xa1a]
1:0321  268b4708          mov      ax, word ptr es:[bx + 8]
1:0325  3d6400            cmp      ax, 0x64
1:0328  7470              je       0x39a
1:032A  77a1              ja       0x2cd
1:032C  0ac0              or       al, al
1:032E  7447              je       0x377
1:0330  2c21              sub      al, 0x21
1:0332  7455              je       0x389
1:0334  2c22              sub      al, 0x22
1:0336  7462              je       0x39a
1:0338  eb93              jmp      0x2cd
1:033A  c70616000a00      mov      word ptr [0x16], 0xa
1:0340  c70618001400      mov      word ptr [0x18], 0x14
1:0346  b80200            mov      ax, 2
1:0349  a31400            mov      word ptr [0x14], ax
1:034C  a3f009            mov      word ptr [0x9f0], ax
1:034F  c706120a581b      mov      word ptr [0xa12], 0x1b58
1:0355  ebc6              jmp      0x31d
1:0357  c70616000600      mov      word ptr [0x16], 6
1:035D  c70618000c00      mov      word ptr [0x18], 0xc
1:0363  c70614000200      mov      word ptr [0x14], 2
1:0369  c706f0090400      mov      word ptr [0x9f0], 4
1:036F  c706120ad007      mov      word ptr [0xa12], 0x7d0
1:0375  eba6              jmp      0x31d
1:0377  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0378  df06f009          fild     word ptr [0x9f0]
1:037C  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:037D  d9e0              fchs     
1:037F  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0380  d91e1000          fstp     dword ptr [0x10]
1:0384  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:0385  9b                wait     
1:0386  e944ff            jmp      0x2cd
1:0389  a19005            mov      ax, word ptr [0x590]
1:038C  8b169205          mov      dx, word ptr [0x592]
1:0390  a31000            mov      word ptr [0x10], ax
1:0393  89161200          mov      word ptr [0x12], dx
1:0397  e933ff            jmp      0x2cd
1:039A  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:039B  df06f009          fild     word ptr [0x9f0]
1:039F  ebde              jmp      0x37f
1:03A1  0e                push     cs
1:03A2  e8ef06            call     0xa94
1:03A5  e925ff            jmp      0x2cd
1:03A8  4d                dec      bp
1:03A9  4d                dec      bp
1:03AA  8be5              mov      sp, bp
1:03AC  1f                pop      ds
1:03AD  5d                pop      bp
1:03AE  4d                dec      bp
1:03AF  cb                retf     
1:03B0  1e                push     ds
1:03B1  58                pop      ax
1:03B2  90                nop      
1:03B3  45                inc      bp
1:03B4  55                push     bp
1:03B5  8bec              mov      bp, sp
1:03B7  1e                push     ds
1:03B8  8ed8              mov      ds, ax
1:03BA  83ec08            sub      sp, 8
1:03BD  9ae7030000        lcall    0, 0x3e7  ; @1:INT:ord_8(1:0EB4)
1:03C2  c41e1a0a          les      bx, ptr [0xa1a]
1:03C6  8bc8              mov      cx, ax
1:03C8  268b4702          mov      ax, word ptr es:[bx + 2]
1:03CC  8bd0              mov      dx, ax
1:03CE  8bd8              mov      bx, ax
1:03D0  99                cdq      
1:03D1  f73e1600          idiv     word ptr [0x16]
1:03D5  2bd8              sub      bx, ax
1:03D7  83c328            add      bx, 0x28
1:03DA  8bc1              mov      ax, cx
1:03DC  99                cdq      
1:03DD  f7fb              idiv     bx
1:03DF  83ea14            sub      dx, 0x14
1:03E2  89160e0a          mov      word ptr [0xa0e], dx
1:03E6  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:0EB4)
1:03EB  c41e1a0a          les      bx, ptr [0xa1a]
1:03EF  8bc8              mov      cx, ax
1:03F1  268b4704          mov      ax, word ptr es:[bx + 4]
1:03F5  8bd0              mov      dx, ax
1:03F7  8bd8              mov      bx, ax
1:03F9  99                cdq      
1:03FA  f73e1800          idiv     word ptr [0x18]
1:03FE  2bd8              sub      bx, ax
1:0400  83c328            add      bx, 0x28
1:0403  8bc1              mov      ax, cx
1:0405  99                cdq      
1:0406  f7fb              idiv     bx
1:0408  83ea14            sub      dx, 0x14
1:040B  8916100a          mov      word ptr [0xa10], dx
1:040F  8b1e1a0a          mov      bx, word ptr [0xa1a]
1:0413  268b4702          mov      ax, word ptr es:[bx + 2]
1:0417  99                cdq      
1:0418  f73e1600          idiv     word ptr [0x16]
1:041C  99                cdq      
1:041D  2bc2              sub      ax, dx
1:041F  d1f8              sar      ax, 1
1:0421  a35a09            mov      word ptr [0x95a], ax
1:0424  268b4702          mov      ax, word ptr es:[bx + 2]
1:0428  99                cdq      
1:0429  2bc2              sub      ax, dx
1:042B  d1f8              sar      ax, 1
1:042D  3b060e0a          cmp      ax, word ptr [0xa0e]
1:0431  7e17              jle      0x44a
1:0433  268b4704          mov      ax, word ptr es:[bx + 4]
1:0437  99                cdq      
1:0438  2bc2              sub      ax, dx
1:043A  d1f8              sar      ax, 1
1:043C  3b06100a          cmp      ax, word ptr [0xa10]
1:0440  7e08              jle      0x44a
1:0442  c7066a090100      mov      word ptr [0x96a], 1
1:0448  eb52              jmp      0x49c
1:044A  268b4702          mov      ax, word ptr es:[bx + 2]
1:044E  99                cdq      
1:044F  2bc2              sub      ax, dx
1:0451  d1f8              sar      ax, 1
1:0453  3b060e0a          cmp      ax, word ptr [0xa0e]
1:0457  7e17              jle      0x470
1:0459  268b4704          mov      ax, word ptr es:[bx + 4]
1:045D  99                cdq      
1:045E  2bc2              sub      ax, dx
1:0460  d1f8              sar      ax, 1
1:0462  3b06100a          cmp      ax, word ptr [0xa10]
1:0466  7f08              jg       0x470
1:0468  c7066a090200      mov      word ptr [0x96a], 2
1:046E  eb2c              jmp      0x49c
1:0470  268b4702          mov      ax, word ptr es:[bx + 2]
1:0474  99                cdq      
1:0475  2bc2              sub      ax, dx
1:0477  d1f8              sar      ax, 1
1:0479  3b060e0a          cmp      ax, word ptr [0xa0e]
1:047D  7f17              jg       0x496
1:047F  268b4704          mov      ax, word ptr es:[bx + 4]
1:0483  99                cdq      
1:0484  2bc2              sub      ax, dx
1:0486  d1f8              sar      ax, 1
1:0488  3b06100a          cmp      ax, word ptr [0xa10]
1:048C  7f08              jg       0x496
1:048E  c7066a090300      mov      word ptr [0x96a], 3
1:0494  eb06              jmp      0x49c
1:0496  c7066a090400      mov      word ptr [0x96a], 4
1:049C  268b4702          mov      ax, word ptr es:[bx + 2]
1:04A0  99                cdq      
1:04A1  2bc2              sub      ax, dx
1:04A3  d1f8              sar      ax, 1
1:04A5  2b060e0a          sub      ax, word ptr [0xa0e]
1:04A9  f7d8              neg      ax
1:04AB  03065a09          add      ax, word ptr [0x95a]
1:04AF  a35809            mov      word ptr [0x958], ax
1:04B2  0bc0              or       ax, ax
1:04B4  7506              jne      0x4bc
1:04B6  c70658090100      mov      word ptr [0x958], 1
1:04BC  268b4704          mov      ax, word ptr es:[bx + 4]
1:04C0  99                cdq      
1:04C1  2bc2              sub      ax, dx
1:04C3  d1f8              sar      ax, 1
1:04C5  2b06100a          sub      ax, word ptr [0xa10]
1:04C9  a36409            mov      word ptr [0x964], ax
1:04CC  a16a09            mov      ax, word ptr [0x96a]
1:04CF  48                dec      ax
1:04D0  7411              je       0x4e3
1:04D2  48                dec      ax
1:04D3  740e              je       0x4e3
1:04D5  48                dec      ax
1:04D6  7503              jne      0x4db
1:04D8  e95102            jmp      0x72c
1:04DB  48                dec      ax
1:04DC  7503              jne      0x4e1
1:04DE  e94b02            jmp      0x72c
1:04E1  eb31              jmp      0x514
1:04E3  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:04E4  df066409          fild     word ptr [0x964]
1:04E8  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:04E9  de365809          fidiv    word ptr [0x958]
1:04ED  83ec08            sub      sp, 8
1:04F0  8bdc              mov      bx, sp
1:04F2  9b                wait       ; @0:OSFIXUP:FISRQQ/FJSRQQ (add,t=5)
1:04F3  36dd1f            fstp     qword ptr ss:[bx]
1:04F6  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:04F7  9b                wait     
1:04F8  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:0FA1)
1:04FD  83c408            add      sp, 8
1:0500  8bd8              mov      bx, ax
1:0502  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0503  dd07              fld      qword ptr [bx]
1:0505  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0506  dc0e9405          fmul     qword ptr [0x594]
1:050A  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:050B  dc069c05          fadd     qword ptr [0x59c]
1:050F  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0510  d91e7809          fstp     dword ptr [0x978]
1:0514  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0515  df065809          fild     word ptr [0x958]
1:0519  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:051A  dc0ea405          fmul     qword ptr [0x5a4]
1:051E  9a58050000        lcall    0, 0x558  ; @1:INT:ord_4(1:0FC2)
1:0523  8946fc            mov      word ptr [bp - 4], ax
1:0526  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0527  df46fc            fild     word ptr [bp - 4]
1:052A  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:052B  d9067809          fld      dword ptr [0x978]
1:052F  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0530  dc0eac05          fmul     qword ptr [0x5ac]
1:0534  83ec08            sub      sp, 8
1:0537  8bdc              mov      bx, sp
1:0539  9b                wait       ; @0:OSFIXUP:FISRQQ/FJSRQQ (add,t=5)
1:053A  36dd1f            fstp     qword ptr ss:[bx]
1:053D  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:053E  d95ef8            fstp     dword ptr [bp - 8]
1:0541  9a7a050000        lcall    0, 0x57a  ; @1:INT:ord_6(1:0F7C)
1:0546  83c408            add      sp, 8
1:0549  8bd8              mov      bx, ax
1:054B  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:054C  dd07              fld      qword ptr [bx]
1:054E  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:054F  dc0ea405          fmul     qword ptr [0x5a4]
1:0553  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0554  d87ef8            fdivr    dword ptr [bp - 8]
1:0557  9a8c050000        lcall    0, 0x58c  ; @1:INT:ord_4(1:0FC2)
1:055C  a34409            mov      word ptr [0x944], ax
1:055F  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0560  d9061000          fld      dword ptr [0x10]
1:0564  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0565  d8067809          fadd     dword ptr [0x978]
1:0569  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:056A  dc0eac05          fmul     qword ptr [0x5ac]
1:056E  83ec08            sub      sp, 8
1:0571  8bdc              mov      bx, sp
1:0573  9b                wait       ; @0:OSFIXUP:FISRQQ/FJSRQQ (add,t=5)
1:0574  36dd1f            fstp     qword ptr ss:[bx]
1:0577  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:0578  9b                wait     
1:0579  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_6(1:0F7C)
1:057E  83c408            add      sp, 8
1:0581  8bd8              mov      bx, ax
1:0583  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0584  dd07              fld      qword ptr [bx]
1:0586  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0587  dc0ea405          fmul     qword ptr [0x5a4]
1:058B  9ad0050000        lcall    0, 0x5d0  ; @1:INT:ord_4(1:0FC2)
1:0590  8b0e4409          mov      cx, word ptr [0x944]
1:0594  2b0e1400          sub      cx, word ptr [0x14]
1:0598  f7e9              imul     cx
1:059A  b96400            mov      cx, 0x64
1:059D  99                cdq      
1:059E  f7f9              idiv     cx
1:05A0  a36609            mov      word ptr [0x966], ax
1:05A3  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:05A4  d9061000          fld      dword ptr [0x10]
1:05A8  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:05A9  d8067809          fadd     dword ptr [0x978]
1:05AD  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:05AE  dc0eac05          fmul     qword ptr [0x5ac]
1:05B2  83ec08            sub      sp, 8
1:05B5  8bdc              mov      bx, sp
1:05B7  9b                wait       ; @0:OSFIXUP:FISRQQ/FJSRQQ (add,t=5)
1:05B8  36dd1f            fstp     qword ptr ss:[bx]
1:05BB  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:05BC  9b                wait     
1:05BD  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_5(1:0F76)
1:05C2  83c408            add      sp, 8
1:05C5  8bd8              mov      bx, ax
1:05C7  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:05C8  dd07              fld      qword ptr [bx]
1:05CA  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:05CB  dc0ea405          fmul     qword ptr [0x5a4]
1:05CF  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_4(1:0FC2)
1:05D4  8b0e4409          mov      cx, word ptr [0x944]
1:05D8  2b0e1400          sub      cx, word ptr [0x14]
1:05DC  f7e9              imul     cx
1:05DE  b96400            mov      cx, 0x64
1:05E1  99                cdq      
1:05E2  f7f9              idiv     cx
1:05E4  a36809            mov      word ptr [0x968], ax
1:05E7  c41e1a0a          les      bx, ptr [0xa1a]
1:05EB  268b4702          mov      ax, word ptr es:[bx + 2]
1:05EF  99                cdq      
1:05F0  2bc2              sub      ax, dx
1:05F2  d1f8              sar      ax, 1
1:05F4  2b065a09          sub      ax, word ptr [0x95a]
1:05F8  03066609          add      ax, word ptr [0x966]
1:05FC  a3140a            mov      word ptr [0xa14], ax
1:05FF  268b4704          mov      ax, word ptr es:[bx + 4]
1:0603  99                cdq      
1:0604  2bc2              sub      ax, dx
1:0606  d1f8              sar      ax, 1
1:0608  2b066809          sub      ax, word ptr [0x968]
1:060C  a3160a            mov      word ptr [0xa16], ax
1:060F  ff366e00          push     word ptr [0x6e]
1:0613  b8f609            mov      ax, 0x9f6
1:0616  1e                push     ds
1:0617  50                push     ax
1:0618  b80400            mov      ax, 4
1:061B  50                push     ax
1:061C  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:0621  50                push     ax
1:0622  9affff0000        lcall    0, 0xffff  ; @1:USER.FillRect
1:0627  833e0e0a02        cmp      word ptr [0xa0e], 2
1:062C  7f03              jg       0x631
1:062E  e92501            jmp      0x756
1:0631  c41e1a0a          les      bx, ptr [0xa1a]
1:0635  268b4702          mov      ax, word ptr es:[bx + 2]
1:0639  8bc8              mov      cx, ax
1:063B  48                dec      ax
1:063C  48                dec      ax
1:063D  8bd0              mov      dx, ax
1:063F  8bc1              mov      ax, cx
1:0641  8bca              mov      cx, dx
1:0643  99                cdq      
1:0644  f73e1600          idiv     word ptr [0x16]
1:0648  8bd0              mov      dx, ax
1:064A  03060e0a          add      ax, word ptr [0xa0e]
1:064E  3bc1              cmp      ax, cx
1:0650  7c03              jl       0x655
1:0652  e90101            jmp      0x756
1:0655  833e100a02        cmp      word ptr [0xa10], 2
1:065A  7f03              jg       0x65f
1:065C  e9f700            jmp      0x756
1:065F  268b4704          mov      ax, word ptr es:[bx + 4]
1:0663  8bc8              mov      cx, ax
1:0665  48                dec      ax
1:0666  48                dec      ax
1:0667  8bd8              mov      bx, ax
1:0669  8bc1              mov      ax, cx
1:066B  8bca              mov      cx, dx
1:066D  99                cdq      
1:066E  f73e1800          idiv     word ptr [0x18]
1:0672  8bd0              mov      dx, ax
1:0674  0306100a          add      ax, word ptr [0xa10]
1:0678  3bc3              cmp      ax, bx
1:067A  7c03              jl       0x67f
1:067C  e9d700            jmp      0x756
1:067F  ff366e00          push     word ptr [0x6e]
1:0683  2bc0              sub      ax, ax
1:0685  50                push     ax
1:0686  50                push     ax
1:0687  51                push     cx
1:0688  52                push     dx
1:0689  ff36fe09          push     word ptr [0x9fe]
1:068D  ff360e0a          push     word ptr [0xa0e]
1:0691  ff36100a          push     word ptr [0xa10]
1:0695  b92000            mov      cx, 0x20
1:0698  bacc00            mov      dx, 0xcc
1:069B  52                push     dx
1:069C  51                push     cx
1:069D  9affff0000        lcall    0, 0xffff  ; @1:GDI.BitBlt
1:06A2  b84809            mov      ax, 0x948
1:06A5  1e                push     ds
1:06A6  50                push     ax
1:06A7  ff360e0a          push     word ptr [0xa0e]
1:06AB  ff36100a          push     word ptr [0xa10]
1:06AF  c41e1a0a          les      bx, ptr [0xa1a]
1:06B3  268b4702          mov      ax, word ptr es:[bx + 2]
1:06B7  99                cdq      
1:06B8  f73e1600          idiv     word ptr [0x16]
1:06BC  03060e0a          add      ax, word ptr [0xa0e]
1:06C0  50                push     ax
1:06C1  268b4704          mov      ax, word ptr es:[bx + 4]
1:06C5  99                cdq      
1:06C6  f73e1800          idiv     word ptr [0x18]
1:06CA  0306100a          add      ax, word ptr [0xa10]
1:06CE  50                push     ax
1:06CF  9a02070000        lcall    0, 0x702  ; @1:USER.SetRect
1:06D4  b86e09            mov      ax, 0x96e
1:06D7  1e                push     ds
1:06D8  50                push     ax
1:06D9  ff36140a          push     word ptr [0xa14]
1:06DD  ff36160a          push     word ptr [0xa16]
1:06E1  c41e1a0a          les      bx, ptr [0xa1a]
1:06E5  268b4702          mov      ax, word ptr es:[bx + 2]
1:06E9  99                cdq      
1:06EA  f73e1600          idiv     word ptr [0x16]
1:06EE  0306140a          add      ax, word ptr [0xa14]
1:06F2  50                push     ax
1:06F3  268b4704          mov      ax, word ptr es:[bx + 4]
1:06F7  99                cdq      
1:06F8  f73e1800          idiv     word ptr [0x18]
1:06FC  0306160a          add      ax, word ptr [0xa16]
1:0700  50                push     ax
1:0701  9a8b010000        lcall    0, 0x18b  ; @1:USER.SetRect
1:0706  b85009            mov      ax, 0x950
1:0709  1e                push     ds
1:070A  50                push     ax
1:070B  b84809            mov      ax, 0x948
1:070E  1e                push     ds
1:070F  50                push     ax
1:0710  b8000a            mov      ax, 0xa00
1:0713  1e                push     ds
1:0714  50                push     ax
1:0715  9affff0000        lcall    0, 0xffff  ; @1:USER.IntersectRect
1:071A  0bc0              or       ax, ax
1:071C  7438              je       0x756
1:071E  c41e1a0a          les      bx, ptr [0xa1a]
1:0722  26837f0c00        cmp      word ptr es:[bx + 0xc], 0
1:0727  742d              je       0x756
1:0729  e9d101            jmp      0x8fd
1:072C  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:072D  df066409          fild     word ptr [0x964]
1:0731  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0732  de365809          fidiv    word ptr [0x958]
1:0736  83ec08            sub      sp, 8
1:0739  8bdc              mov      bx, sp
1:073B  9b                wait       ; @0:OSFIXUP:FISRQQ/FJSRQQ (add,t=5)
1:073C  36dd1f            fstp     qword ptr ss:[bx]
1:073F  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:0740  9b                wait     
1:0741  9af9040000        lcall    0, 0x4f9  ; @1:INT:ord_7(1:0FA1)
1:0746  83c408            add      sp, 8
1:0749  8bd8              mov      bx, ax
1:074B  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:074C  dd07              fld      qword ptr [bx]
1:074E  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:074F  dc0e9405          fmul     qword ptr [0x594]
1:0753  e9b9fd            jmp      0x50f
1:0756  833e140a02        cmp      word ptr [0xa14], 2
1:075B  7f03              jg       0x760
1:075D  e98400            jmp      0x7e4
1:0760  c41e1a0a          les      bx, ptr [0xa1a]
1:0764  268b4702          mov      ax, word ptr es:[bx + 2]
1:0768  8bc8              mov      cx, ax
1:076A  48                dec      ax
1:076B  48                dec      ax
1:076C  8bd0              mov      dx, ax
1:076E  8bc1              mov      ax, cx
1:0770  8bca              mov      cx, dx
1:0772  99                cdq      
1:0773  f73e1600          idiv     word ptr [0x16]
1:0777  8bd0              mov      dx, ax
1:0779  0306140a          add      ax, word ptr [0xa14]
1:077D  3bc1              cmp      ax, cx
1:077F  7d63              jge      0x7e4
1:0781  833e160a02        cmp      word ptr [0xa16], 2
1:0786  7e5c              jle      0x7e4
1:0788  268b4704          mov      ax, word ptr es:[bx + 4]
1:078C  8bc8              mov      cx, ax
1:078E  48                dec      ax
1:078F  48                dec      ax
1:0790  8bd8              mov      bx, ax
1:0792  8bc1              mov      ax, cx
1:0794  8bca              mov      cx, dx
1:0796  99                cdq      
1:0797  f73e1800          idiv     word ptr [0x18]
1:079B  8bd0              mov      dx, ax
1:079D  0306160a          add      ax, word ptr [0xa16]
1:07A1  3bc3              cmp      ax, bx
1:07A3  7d3f              jge      0x7e4
1:07A5  ff36fe09          push     word ptr [0x9fe]
1:07A9  ff36140a          push     word ptr [0xa14]
1:07AD  ff36160a          push     word ptr [0xa16]
1:07B1  51                push     cx
1:07B2  52                push     dx
1:07B3  ff366e00          push     word ptr [0x6e]
1:07B7  2bc0              sub      ax, ax
1:07B9  50                push     ax
1:07BA  50                push     ax
1:07BB  b92000            mov      cx, 0x20
1:07BE  bacc00            mov      dx, 0xcc
1:07C1  52                push     dx
1:07C2  51                push     cx
1:07C3  9a9e060000        lcall    0, 0x69e  ; @1:GDI.BitBlt
1:07C8  b85009            mov      ax, 0x950
1:07CB  1e                push     ds
1:07CC  50                push     ax
1:07CD  b86e09            mov      ax, 0x96e
1:07D0  1e                push     ds
1:07D1  50                push     ax
1:07D2  b8000a            mov      ax, 0xa00
1:07D5  1e                push     ds
1:07D6  50                push     ax
1:07D7  9a16070000        lcall    0, 0x716  ; @1:USER.IntersectRect
1:07DC  0bc0              or       ax, ax
1:07DE  7404              je       0x7e4
1:07E0  0e                push     cs
1:07E1  e8b002            call     0xa94
1:07E4  2bc0              sub      ax, ax
1:07E6  50                push     ax
1:07E7  50                push     ax
1:07E8  50                push     ax
1:07E9  50                push     ax
1:07EA  9a1b080000        lcall    0, 0x81b  ; @1:GDI.CreateRectRgn
1:07EF  a37609            mov      word ptr [0x976], ax
1:07F2  ff360e0a          push     word ptr [0xa0e]
1:07F6  ff36100a          push     word ptr [0xa10]
1:07FA  c41e1a0a          les      bx, ptr [0xa1a]
1:07FE  268b4702          mov      ax, word ptr es:[bx + 2]
1:0802  99                cdq      
1:0803  f73e1600          idiv     word ptr [0x16]
1:0807  03060e0a          add      ax, word ptr [0xa0e]
1:080B  50                push     ax
1:080C  268b4704          mov      ax, word ptr es:[bx + 4]
1:0810  99                cdq      
1:0811  f73e1800          idiv     word ptr [0x18]
1:0815  0306100a          add      ax, word ptr [0xa10]
1:0819  50                push     ax
1:081A  9a4b080000        lcall    0, 0x84b  ; @1:GDI.CreateRectRgn
1:081F  a34209            mov      word ptr [0x942], ax
1:0822  ff36140a          push     word ptr [0xa14]
1:0826  ff36160a          push     word ptr [0xa16]
1:082A  c41e1a0a          les      bx, ptr [0xa1a]
1:082E  268b4702          mov      ax, word ptr es:[bx + 2]
1:0832  99                cdq      
1:0833  f73e1600          idiv     word ptr [0x16]
1:0837  0306140a          add      ax, word ptr [0xa14]
1:083B  50                push     ax
1:083C  268b4704          mov      ax, word ptr es:[bx + 4]
1:0840  99                cdq      
1:0841  f73e1800          idiv     word ptr [0x18]
1:0845  0306160a          add      ax, word ptr [0xa16]
1:0849  50                push     ax
1:084A  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateRectRgn
1:084F  a34609            mov      word ptr [0x946], ax
1:0852  ff367609          push     word ptr [0x976]
1:0856  ff364209          push     word ptr [0x942]
1:085A  50                push     ax
1:085B  b80400            mov      ax, 4
1:085E  50                push     ax
1:085F  9affff0000        lcall    0, 0xffff  ; @1:GDI.CombineRgn
1:0864  c7066c090000      mov      word ptr [0x96c], 0
1:086A  833e0e0a05        cmp      word ptr [0xa0e], 5
1:086F  7c20              jl       0x891
1:0871  c41e1a0a          les      bx, ptr [0xa1a]
1:0875  268b4702          mov      ax, word ptr es:[bx + 2]
1:0879  8bc8              mov      cx, ax
1:087B  2d0500            sub      ax, 5
1:087E  8bd0              mov      dx, ax
1:0880  8bc1              mov      ax, cx
1:0882  8bca              mov      cx, dx
1:0884  99                cdq      
1:0885  f73e1600          idiv     word ptr [0x16]
1:0889  03060e0a          add      ax, word ptr [0xa0e]
1:088D  3bc1              cmp      ax, cx
1:088F  7e06              jle      0x897
1:0891  c7066c090100      mov      word ptr [0x96c], 1
1:0897  833e100a05        cmp      word ptr [0xa10], 5
1:089C  7c20              jl       0x8be
1:089E  c41e1a0a          les      bx, ptr [0xa1a]
1:08A2  268b4704          mov      ax, word ptr es:[bx + 4]
1:08A6  8bc8              mov      cx, ax
1:08A8  2d0500            sub      ax, 5
1:08AB  8bd0              mov      dx, ax
1:08AD  8bc1              mov      ax, cx
1:08AF  8bca              mov      cx, dx
1:08B1  99                cdq      
1:08B2  f73e1800          idiv     word ptr [0x18]
1:08B6  0306100a          add      ax, word ptr [0xa10]
1:08BA  3bc1              cmp      ax, cx
1:08BC  7e06              jle      0x8c4
1:08BE  c7066c090100      mov      word ptr [0x96c], 1
1:08C4  833e6c0900        cmp      word ptr [0x96c], 0
1:08C9  7417              je       0x8e2
1:08CB  ff36fe09          push     word ptr [0x9fe]
1:08CF  ff367609          push     word ptr [0x976]
1:08D3  b80400            mov      ax, 4
1:08D6  50                push     ax
1:08D7  9aec090000        lcall    0, 0x9ec  ; @1:GDI.GetStockObject
1:08DC  50                push     ax
1:08DD  9affff0000        lcall    0, 0xffff  ; @1:GDI.FillRgn
1:08E2  ff364209          push     word ptr [0x942]
1:08E6  9af0080000        lcall    0, 0x8f0  ; @1:GDI.DeleteObject
1:08EB  ff364609          push     word ptr [0x946]
1:08EF  9af9080000        lcall    0, 0x8f9  ; @1:GDI.DeleteObject
1:08F4  ff367609          push     word ptr [0x976]
1:08F8  9a880a0000        lcall    0, 0xa88  ; @1:GDI.DeleteObject
1:08FD  4d                dec      bp
1:08FE  4d                dec      bp
1:08FF  8be5              mov      sp, bp
1:0901  1f                pop      ds
1:0902  5d                pop      bp
1:0903  4d                dec      bp
1:0904  cb                retf     
1:0905  1e                push     ds
1:0906  58                pop      ax
1:0907  90                nop      
1:0908  45                inc      bp
1:0909  55                push     bp
1:090A  8bec              mov      bp, sp
1:090C  1e                push     ds
1:090D  8ed8              mov      ds, ax
1:090F  833ef20900        cmp      word ptr [0x9f2], 0
1:0914  740a              je       0x920
1:0916  9a24090000        lcall    0, 0x924  ; @1:INT:ord_8(1:0EB4)
1:091B  3d2c01            cmp      ax, 0x12c
1:091E  7c03              jl       0x923
1:0920  e96901            jmp      0xa8c
1:0923  9aa4090000        lcall    0, 0x9a4  ; @1:INT:ord_8(1:0EB4)
1:0928  b90600            mov      cx, 6
1:092B  99                cdq      
1:092C  f7f9              idiv     cx
1:092E  89168809          mov      word ptr [0x988], dx
1:0932  8bc2              mov      ax, dx
1:0934  eb54              jmp      0x98a
1:0936  c7068409ff00      mov      word ptr [0x984], 0xff
1:093C  2bc0              sub      ax, ax
1:093E  a38e09            mov      word ptr [0x98e], ax
1:0941  a37c09            mov      word ptr [0x97c], ax
1:0944  eb5d              jmp      0x9a3
1:0946  c7068e090000      mov      word ptr [0x98e], 0
1:094C  b8ff00            mov      ax, 0xff
1:094F  a38409            mov      word ptr [0x984], ax
1:0952  ebed              jmp      0x941
1:0954  2bc0              sub      ax, ax
1:0956  a38409            mov      word ptr [0x984], ax
1:0959  a38e09            mov      word ptr [0x98e], ax
1:095C  c7067c09ff00      mov      word ptr [0x97c], 0xff
1:0962  eb3f              jmp      0x9a3
1:0964  c70684090000      mov      word ptr [0x984], 0
1:096A  b8ff00            mov      ax, 0xff
1:096D  ebcf              jmp      0x93e
1:096F  c7068e09ff00      mov      word ptr [0x98e], 0xff
1:0975  2bc0              sub      ax, ax
1:0977  ebd6              jmp      0x94f
1:0979  b8ff00            mov      ax, 0xff
1:097C  a38409            mov      word ptr [0x984], ax
1:097F  a38e09            mov      word ptr [0x98e], ax
1:0982  c7067c090000      mov      word ptr [0x97c], 0
1:0988  eb19              jmp      0x9a3
1:098A  3d0500            cmp      ax, 5
1:098D  7714              ja       0x9a3
1:098F  d1e0              shl      ax, 1
1:0991  93                xchg     bx, ax
1:0992  2effa79709        jmp      word ptr cs:[bx + 0x997]
1:0997  36094609          or       word ptr ss:[bp + 9], ax
1:099B  54                push     sp
1:099C  096409            or       word ptr [si + 9], sp
1:099F  6f                outsw    dx, word ptr [si]
1:09A0  097909            or       word ptr [bx + di + 9], di
1:09A3  9ac0090000        lcall    0, 0x9c0  ; @1:INT:ord_8(1:0EB4)
1:09A8  b92a00            mov      cx, 0x2a
1:09AB  99                cdq      
1:09AC  f7f9              idiv     cx
1:09AE  83c215            add      dx, 0x15
1:09B1  89167e09          mov      word ptr [0x97e], dx
1:09B5  8bc2              mov      ax, dx
1:09B7  99                cdq      
1:09B8  a38009            mov      word ptr [0x980], ax
1:09BB  89168209          mov      word ptr [0x982], dx
1:09BF  9ad2090000        lcall    0, 0x9d2  ; @1:INT:ord_8(1:0EB4)
1:09C4  c41e1a0a          les      bx, ptr [0xa1a]
1:09C8  99                cdq      
1:09C9  26f77f02          idiv     word ptr es:[bx + 2]
1:09CD  89168609          mov      word ptr [0x986], dx
1:09D1  9abe030000        lcall    0, 0x3be  ; @1:INT:ord_8(1:0EB4)
1:09D6  c41e1a0a          les      bx, ptr [0xa1a]
1:09DA  99                cdq      
1:09DB  26f77f04          idiv     word ptr es:[bx + 4]
1:09DF  89168a09          mov      word ptr [0x98a], dx
1:09E3  ff36fe09          push     word ptr [0x9fe]
1:09E7  b80800            mov      ax, 8
1:09EA  50                push     ax
1:09EB  9ae50a0000        lcall    0, 0xae5  ; @1:GDI.GetStockObject
1:09F0  50                push     ax
1:09F1  9a130a0000        lcall    0, 0xa13  ; @1:GDI.SelectObject
1:09F6  a39009            mov      word ptr [0x990], ax
1:09F9  ff36fe09          push     word ptr [0x9fe]
1:09FD  a08409            mov      al, byte ptr [0x984]
1:0A00  8a268e09          mov      ah, byte ptr [0x98e]
1:0A04  8a0e7c09          mov      cl, byte ptr [0x97c]
1:0A08  2aed              sub      ch, ch
1:0A0A  51                push     cx
1:0A0B  50                push     ax
1:0A0C  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateSolidBrush
1:0A11  50                push     ax
1:0A12  9a750a0000        lcall    0, 0xa75  ; @1:GDI.SelectObject
1:0A17  a39209            mov      word ptr [0x992], ax
1:0A1A  c41e080a          les      bx, ptr [0xa08]
1:0A1E  268b470c          mov      ax, word ptr es:[bx + 0xc]
1:0A22  99                cdq      
1:0A23  52                push     dx
1:0A24  50                push     ax
1:0A25  ff368209          push     word ptr [0x982]
1:0A29  ff368009          push     word ptr [0x980]
1:0A2D  268b470e          mov      ax, word ptr es:[bx + 0xe]
1:0A31  99                cdq      
1:0A32  52                push     dx
1:0A33  50                push     ax
1:0A34  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:0EE4)
1:0A39  52                push     dx
1:0A3A  50                push     ax
1:0A3B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:0F16)
1:0A40  a38c09            mov      word ptr [0x98c], ax
1:0A43  ff36fe09          push     word ptr [0x9fe]
1:0A47  a18609            mov      ax, word ptr [0x986]
1:0A4A  2b068c09          sub      ax, word ptr [0x98c]
1:0A4E  50                push     ax
1:0A4F  a18a09            mov      ax, word ptr [0x98a]
1:0A52  2b067e09          sub      ax, word ptr [0x97e]
1:0A56  50                push     ax
1:0A57  a18609            mov      ax, word ptr [0x986]
1:0A5A  03068c09          add      ax, word ptr [0x98c]
1:0A5E  50                push     ax
1:0A5F  a18a09            mov      ax, word ptr [0x98a]
1:0A62  03067e09          add      ax, word ptr [0x97e]
1:0A66  50                push     ax
1:0A67  9affff0000        lcall    0, 0xffff  ; @1:GDI.Ellipse
1:0A6C  ff36fe09          push     word ptr [0x9fe]
1:0A70  ff369009          push     word ptr [0x990]
1:0A74  9a820a0000        lcall    0, 0xa82  ; @1:GDI.SelectObject
1:0A79  ff36fe09          push     word ptr [0x9fe]
1:0A7D  ff369209          push     word ptr [0x992]
1:0A81  9aeb0a0000        lcall    0, 0xaeb  ; @1:GDI.SelectObject
1:0A86  50                push     ax
1:0A87  9a50020000        lcall    0, 0x250  ; @1:GDI.DeleteObject
1:0A8C  4d                dec      bp
1:0A8D  4d                dec      bp
1:0A8E  8be5              mov      sp, bp
1:0A90  1f                pop      ds
1:0A91  5d                pop      bp
1:0A92  4d                dec      bp
1:0A93  cb                retf     
1:0A94  1e                push     ds
1:0A95  58                pop      ax
1:0A96  90                nop      
1:0A97  45                inc      bp
1:0A98  55                push     bp
1:0A99  8bec              mov      bp, sp
1:0A9B  1e                push     ds
1:0A9C  8ed8              mov      ds, ax
1:0A9E  c41e1a0a          les      bx, ptr [0xa1a]
1:0AA2  26837f0c00        cmp      word ptr es:[bx + 0xc], 0
1:0AA7  7503              jne      0xaac
1:0AA9  e96a01            jmp      0xc16
1:0AAC  c70696090300      mov      word ptr [0x996], 3
1:0AB2  c7069a090300      mov      word ptr [0x99a], 3
1:0AB8  c7069c090000      mov      word ptr [0x99c], 0
1:0ABE  268b4702          mov      ax, word ptr es:[bx + 2]
1:0AC2  99                cdq      
1:0AC3  2bc2              sub      ax, dx
1:0AC5  d1f8              sar      ax, 1
1:0AC7  a39e09            mov      word ptr [0x99e], ax
1:0ACA  a39409            mov      word ptr [0x994], ax
1:0ACD  268b4704          mov      ax, word ptr es:[bx + 4]
1:0AD1  99                cdq      
1:0AD2  2bc2              sub      ax, dx
1:0AD4  d1f8              sar      ax, 1
1:0AD6  a3a009            mov      word ptr [0x9a0], ax
1:0AD9  a39809            mov      word ptr [0x998], ax
1:0ADC  ff36fe09          push     word ptr [0x9fe]
1:0AE0  b80700            mov      ax, 7
1:0AE3  50                push     ax
1:0AE4  9a1d060000        lcall    0, 0x61d  ; @1:GDI.GetStockObject
1:0AE9  50                push     ax
1:0AEA  9a02010000        lcall    0, 0x102  ; @1:GDI.SelectObject
1:0AEF  a3a609            mov      word ptr [0x9a6], ax
1:0AF2  ff36fe09          push     word ptr [0x9fe]
1:0AF6  b80400            mov      ax, 4
1:0AF9  50                push     ax
1:0AFA  9ad8080000        lcall    0, 0x8d8  ; @1:GDI.GetStockObject
1:0AFF  50                push     ax
1:0B00  9a050c0000        lcall    0, 0xc05  ; @1:GDI.SelectObject
1:0B05  a3a809            mov      word ptr [0x9a8], ax
1:0B08  c41e080a          les      bx, ptr [0xa08]
1:0B0C  268b470c          mov      ax, word ptr es:[bx + 0xc]
1:0B10  99                cdq      
1:0B11  52                push     dx
1:0B12  50                push     ax
1:0B13  ff369c09          push     word ptr [0x99c]
1:0B17  ff369a09          push     word ptr [0x99a]
1:0B1B  268b470e          mov      ax, word ptr es:[bx + 0xe]
1:0B1F  99                cdq      
1:0B20  52                push     dx
1:0B21  50                push     ax
1:0B22  9a350a0000        lcall    0, 0xa35  ; @1:INT:ord_10(1:0EE4)
1:0B27  52                push     dx
1:0B28  50                push     ax
1:0B29  9a3c0a0000        lcall    0, 0xa3c  ; @1:INT:ord_9(1:0F16)
1:0B2E  a3a409            mov      word ptr [0x9a4], ax
1:0B31  ff36fe09          push     word ptr [0x9fe]
1:0B35  a19e09            mov      ax, word ptr [0x99e]
1:0B38  2b06a409          sub      ax, word ptr [0x9a4]
1:0B3C  50                push     ax
1:0B3D  a1a009            mov      ax, word ptr [0x9a0]
1:0B40  2b069609          sub      ax, word ptr [0x996]
1:0B44  50                push     ax
1:0B45  a19e09            mov      ax, word ptr [0x99e]
1:0B48  0306a409          add      ax, word ptr [0x9a4]
1:0B4C  50                push     ax
1:0B4D  a1a009            mov      ax, word ptr [0x9a0]
1:0B50  03069609          add      ax, word ptr [0x996]
1:0B54  50                push     ax
1:0B55  9a9c0b0000        lcall    0, 0xb9c  ; @1:GDI.Ellipse
1:0B5A  c706a2090000      mov      word ptr [0x9a2], 0
1:0B60  8b1ea209          mov      bx, word ptr [0x9a2]
1:0B64  d1e3              shl      bx, 1
1:0B66  d1e3              shl      bx, 1
1:0B68  8b871e00          mov      ax, word ptr [bx + 0x1e]
1:0B6C  03069409          add      ax, word ptr [0x994]
1:0B70  a39e09            mov      word ptr [0x99e], ax
1:0B73  8b8f2000          mov      cx, word ptr [bx + 0x20]
1:0B77  030e9809          add      cx, word ptr [0x998]
1:0B7B  890ea009          mov      word ptr [0x9a0], cx
1:0B7F  ff36fe09          push     word ptr [0x9fe]
1:0B83  8bd0              mov      dx, ax
1:0B85  2b06a409          sub      ax, word ptr [0x9a4]
1:0B89  50                push     ax
1:0B8A  8bc1              mov      ax, cx
1:0B8C  2b0e9609          sub      cx, word ptr [0x996]
1:0B90  51                push     cx
1:0B91  0316a409          add      dx, word ptr [0x9a4]
1:0B95  52                push     dx
1:0B96  03069609          add      ax, word ptr [0x996]
1:0B9A  50                push     ax
1:0B9B  9aed0b0000        lcall    0, 0xbed  ; @1:GDI.Ellipse
1:0BA0  ff06a209          inc      word ptr [0x9a2]
1:0BA4  833ea20908        cmp      word ptr [0x9a2], 8
1:0BA9  7cb5              jl       0xb60
1:0BAB  c706a2090000      mov      word ptr [0x9a2], 0
1:0BB1  8b1ea209          mov      bx, word ptr [0x9a2]
1:0BB5  d1e3              shl      bx, 1
1:0BB7  d1e3              shl      bx, 1
1:0BB9  8b873e00          mov      ax, word ptr [bx + 0x3e]
1:0BBD  03069409          add      ax, word ptr [0x994]
1:0BC1  a39e09            mov      word ptr [0x99e], ax
1:0BC4  8b8f4000          mov      cx, word ptr [bx + 0x40]
1:0BC8  030e9809          add      cx, word ptr [0x998]
1:0BCC  890ea009          mov      word ptr [0x9a0], cx
1:0BD0  ff36fe09          push     word ptr [0x9fe]
1:0BD4  8bd0              mov      dx, ax
1:0BD6  2b06a409          sub      ax, word ptr [0x9a4]
1:0BDA  50                push     ax
1:0BDB  8bc1              mov      ax, cx
1:0BDD  2b0e9609          sub      cx, word ptr [0x996]
1:0BE1  51                push     cx
1:0BE2  0316a409          add      dx, word ptr [0x9a4]
1:0BE6  52                push     dx
1:0BE7  03069609          add      ax, word ptr [0x996]
1:0BEB  50                push     ax
1:0BEC  9a680a0000        lcall    0, 0xa68  ; @1:GDI.Ellipse
1:0BF1  ff06a209          inc      word ptr [0x9a2]
1:0BF5  833ea2090c        cmp      word ptr [0x9a2], 0xc
1:0BFA  7cb5              jl       0xbb1
1:0BFC  ff36fe09          push     word ptr [0x9fe]
1:0C00  ff36a609          push     word ptr [0x9a6]
1:0C04  9a120c0000        lcall    0, 0xc12  ; @1:GDI.SelectObject
1:0C09  ff36fe09          push     word ptr [0x9fe]
1:0C0D  ff36a809          push     word ptr [0x9a8]
1:0C11  9af2090000        lcall    0, 0x9f2  ; @1:GDI.SelectObject
1:0C16  4d                dec      bp
1:0C17  4d                dec      bp
1:0C18  8be5              mov      sp, bp
1:0C1A  1f                pop      ds
1:0C1B  5d                pop      bp
1:0C1C  4d                dec      bp
1:0C1D  cb                retf     

; ===== EXPORT:ord_21(#21) =====
1:0C1E  1e                push     ds
1:0C1F  58                pop      ax
1:0C20  90                nop      
1:0C21  45                inc      bp
1:0C22  55                push     bp
1:0C23  8bec              mov      bp, sp
1:0C25  1e                push     ds
1:0C26  8ed8              mov      ds, ax
1:0C28  837e0a00          cmp      word ptr [bp + 0xa], 0
1:0C2C  7504              jne      0xc32
1:0C2E  2bc0              sub      ax, ax
1:0C30  eb09              jmp      0xc3b
1:0C32  8b460e            mov      ax, word ptr [bp + 0xe]
1:0C35  a3180a            mov      word ptr [0xa18], ax
1:0C38  b80100            mov      ax, 1
1:0C3B  4d                dec      bp
1:0C3C  4d                dec      bp
1:0C3D  8be5              mov      sp, bp
1:0C3F  1f                pop      ds
1:0C40  5d                pop      bp
1:0C41  4d                dec      bp
1:0C42  ca0a00            retf     0xa

; ===== EXPORT:WEP(#2) =====
1:0C45  1e                push     ds
1:0C46  58                pop      ax
1:0C47  90                nop      
1:0C48  45                inc      bp
1:0C49  55                push     bp
1:0C4A  8bec              mov      bp, sp
1:0C4C  1e                push     ds
1:0C4D  8ed8              mov      ds, ax
1:0C4F  b80100            mov      ax, 1
1:0C52  4d                dec      bp
1:0C53  4d                dec      bp
1:0C54  8be5              mov      sp, bp
1:0C56  1f                pop      ds
1:0C57  5d                pop      bp
1:0C58  4d                dec      bp
1:0C59  ca0200            retf     2

; ===== EXPORT:MODULE(#1) =====
1:0C5C  1e                push     ds
1:0C5D  58                pop      ax
1:0C5E  90                nop      
1:0C5F  45                inc      bp
1:0C60  55                push     bp
1:0C61  8bec              mov      bp, sp
1:0C63  1e                push     ds
1:0C64  8ed8              mov      ds, ax
1:0C66  83ec0a            sub      sp, 0xa
1:0C69  56                push     si
1:0C6A  8b4608            mov      ax, word ptr [bp + 8]
1:0C6D  a3fe09            mov      word ptr [0x9fe], ax
1:0C70  8b4606            mov      ax, word ptr [bp + 6]
1:0C73  a3f409            mov      word ptr [0x9f4], ax
1:0C76  50                push     ax
1:0C77  9a970c0000        lcall    0, 0xc97  ; @1:KERNEL.GlobalLock
1:0C7C  a3080a            mov      word ptr [0xa08], ax
1:0C7F  89160a0a          mov      word ptr [0xa0a], dx
1:0C83  8bc2              mov      ax, dx
1:0C85  0b06080a          or       ax, word ptr [0xa08]
1:0C89  7503              jne      0xc8e
1:0C8B  e96a01            jmp      0xdf8
1:0C8E  c41e080a          les      bx, ptr [0xa08]
1:0C92  26ff7720          push     word ptr es:[bx + 0x20]
1:0C96  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalLock
1:0C9B  a31a0a            mov      word ptr [0xa1a], ax
1:0C9E  89161c0a          mov      word ptr [0xa1c], dx
1:0CA2  8bc2              mov      ax, dx
1:0CA4  0b061a0a          or       ax, word ptr [0xa1a]
1:0CA8  7503              jne      0xcad
1:0CAA  e94201            jmp      0xdef
1:0CAD  8b460a            mov      ax, word ptr [bp + 0xa]
1:0CB0  e90801            jmp      0xdbb
1:0CB3  c41e080a          les      bx, ptr [0xa08]
1:0CB7  26837f1465        cmp      word ptr es:[bx + 0x14], 0x65
1:0CBC  7c0f              jl       0xccd
1:0CBE  26817f36f400      cmp      word ptr es:[bx + 0x36], 0xf4
1:0CC4  7507              jne      0xccd
1:0CC6  26837f3878        cmp      word ptr es:[bx + 0x38], 0x78
1:0CCB  740e              je       0xcdb
1:0CCD  c70676000000      mov      word ptr [0x76], 0
1:0CD3  c746fc0500        mov      word ptr [bp - 4], 5
1:0CD8  e90701            jmp      0xde2
1:0CDB  c70676000100      mov      word ptr [0x76], 1
1:0CE1  e9fe00            jmp      0xde2
1:0CE4  b8aa09            mov      ax, 0x9aa
1:0CE7  50                push     ax
1:0CE8  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_20(1:0E3E)
1:0CED  5b                pop      bx
1:0CEE  ff36aa09          push     word ptr [0x9aa]
1:0CF2  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_19(1:0EA0)
1:0CF7  5b                pop      bx
1:0CF8  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_18(1:0012)
1:0CFD  eb13              jmp      0xd12
1:0CFF  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_17(1:01C5)
1:0D04  eb0c              jmp      0xd12
1:0D06  833e760000        cmp      word ptr [0x76], 0
1:0D0B  740b              je       0xd18
1:0D0D  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_16(1:01D9)
1:0D12  8946fc            mov      word ptr [bp - 4], ax
1:0D15  e9ca00            jmp      0xde2
1:0D18  ff36fe09          push     word ptr [0x9fe]
1:0D1C  b800ff            mov      ax, 0xff00
1:0D1F  baff00            mov      dx, 0xff
1:0D22  52                push     dx
1:0D23  50                push     ax
1:0D24  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextColor
1:0D29  ff36fe09          push     word ptr [0x9fe]
1:0D2D  2bc0              sub      ax, ax
1:0D2F  50                push     ax
1:0D30  50                push     ax
1:0D31  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkColor
1:0D36  ff36fe09          push     word ptr [0x9fe]
1:0D3A  2bc0              sub      ax, ax
1:0D3C  50                push     ax
1:0D3D  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextAlign
1:0D42  ff36fe09          push     word ptr [0x9fe]
1:0D46  b80100            mov      ax, 1
1:0D49  50                push     ax
1:0D4A  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkMode
1:0D4F  ff36fe09          push     word ptr [0x9fe]
1:0D53  2bc0              sub      ax, ax
1:0D55  50                push     ax
1:0D56  50                push     ax
1:0D57  b87800            mov      ax, 0x78
1:0D5A  1e                push     ds
1:0D5B  50                push     ax
1:0D5C  50                push     ax
1:0D5D  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_15(1:0E22)
1:0D62  5b                pop      bx
1:0D63  50                push     ax
1:0D64  9affff0000        lcall    0, 0xffff  ; @1:GDI.TextOut
1:0D69  eb77              jmp      0xde2
1:0D6B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_14(1:0224)
1:0D70  eba0              jmp      0xd12
1:0D72  a1180a            mov      ax, word ptr [0xa18]
1:0D75  c41e1a0a          les      bx, ptr [0xa1a]
1:0D79  26894716          mov      word ptr es:[bx + 0x16], ax
1:0D7D  c746f60000        mov      word ptr [bp - 0xa], 0
1:0D82  8b46f6            mov      ax, word ptr [bp - 0xa]
1:0D85  8bf0              mov      si, ax
1:0D87  d1e6              shl      si, 1
1:0D89  40                inc      ax
1:0D8A  c41e1a0a          les      bx, ptr [0xa1a]
1:0D8E  2689400e          mov      word ptr es:[bx + si + 0xe], ax
1:0D92  ff46f6            inc      word ptr [bp - 0xa]
1:0D95  837ef604          cmp      word ptr [bp - 0xa], 4
1:0D99  7ce7              jl       0xd82
1:0D9B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_13(1:0290)
1:0DA0  e96fff            jmp      0xd12
1:0DA3  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:02A4)
1:0DA8  e967ff            jmp      0xd12
1:0DAB  8b460a            mov      ax, word ptr [bp + 0xa]
1:0DAE  2d0700            sub      ax, 7
1:0DB1  50                push     ax
1:0DB2  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:02B8)
1:0DB7  5b                pop      bx
1:0DB8  e957ff            jmp      0xd12
1:0DBB  3d0c00            cmp      ax, 0xc
1:0DBE  7722              ja       0xde2
1:0DC0  d1e0              shl      ax, 1
1:0DC2  93                xchg     bx, ax
1:0DC3  2effa7c80d        jmp      word ptr cs:[bx + 0xdc8]
1:0DC8  e40c              in       al, 0xc
1:0DCA  ff0c              dec      word ptr [si]
1:0DCC  06                push     es
1:0DCD  0d6b0d            or       ax, 0xd6b
1:0DD0  e20d              loop     0xddf
1:0DD2  720d              jb       0xde1
1:0DD4  a30dab            mov      word ptr [0xab0d], ax
1:0DD7  0dab0d            or       ax, 0xdab
1:0DDA  ab                stosw    word ptr es:[di], ax
1:0DDB  0dab0d            or       ax, 0xdab
1:0DDE  e20d              loop     0xded
1:0DE0  b30c              mov      bl, 0xc
1:0DE2  c41e080a          les      bx, ptr [0xa08]
1:0DE6  26ff7720          push     word ptr es:[bx + 0x20]
1:0DEA  9af40d0000        lcall    0, 0xdf4  ; @1:KERNEL.GlobalUnlock
1:0DEF  ff36f409          push     word ptr [0x9f4]
1:0DF3  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalUnlock
1:0DF8  8b46fc            mov      ax, word ptr [bp - 4]
1:0DFB  5e                pop      si
1:0DFC  4d                dec      bp
1:0DFD  4d                dec      bp
1:0DFE  8be5              mov      sp, bp
1:0E00  1f                pop      ds
1:0E01  5d                pop      bp
1:0E02  4d                dec      bp
1:0E03  ca0600            retf     6
1:0E06  0000              add      byte ptr [bx + si], al
1:0E08  0000              add      byte ptr [bx + si], al
1:0E0A  0000              add      byte ptr [bx + si], al
1:0E0C  0000              add      byte ptr [bx + si], al
1:0E0E  0000              add      byte ptr [bx + si], al
1:0E10  0000              add      byte ptr [bx + si], al
1:0E12  0000              add      byte ptr [bx + si], al
1:0E14  0000              add      byte ptr [bx + si], al
1:0E16  0000              add      byte ptr [bx + si], al
1:0E18  0000              add      byte ptr [bx + si], al
1:0E1A  0000              add      byte ptr [bx + si], al
1:0E1C  0000              add      byte ptr [bx + si], al
1:0E1E  0000              add      byte ptr [bx + si], al
1:0E20  c3                ret      
1:0E21  00558b            add      byte ptr [di - 0x75], dl
1:0E24  ec                in       al, dx
1:0E25  8bd7              mov      dx, di
1:0E27  8cd8              mov      ax, ds
1:0E29  8ec0              mov      es, ax
1:0E2B  8b7e06            mov      di, word ptr [bp + 6]
1:0E2E  33c0              xor      ax, ax
1:0E30  b9ffff            mov      cx, 0xffff
1:0E33  f2ae              repne scasb al, byte ptr es:[di]
1:0E35  f7d1              not      cx
1:0E37  49                dec      cx
1:0E38  91                xchg     cx, ax
1:0E39  8bfa              mov      di, dx
1:0E3B  5d                pop      bp
1:0E3C  cb                retf     
1:0E3D  008cd890          add      byte ptr [si - 0x6f28], cl
1:0E41  45                inc      bp
1:0E42  55                push     bp
1:0E43  8bec              mov      bp, sp
1:0E45  1e                push     ds
1:0E46  8ed8              mov      ds, ax
1:0E48  56                push     si
1:0E49  b42a              mov      ah, 0x2a
1:0E4B  cd21              int      0x21
1:0E4D  8bda              mov      bx, dx
1:0E4F  8bf1              mov      si, cx
1:0E51  b42c              mov      ah, 0x2c
1:0E53  cd21              int      0x21
1:0E55  b400              mov      ah, 0
1:0E57  8ac6              mov      al, dh
1:0E59  50                push     ax
1:0E5A  8ac1              mov      al, cl
1:0E5C  50                push     ax
1:0E5D  8ac5              mov      al, ch
1:0E5F  50                push     ax
1:0E60  50                push     ax
1:0E61  b42a              mov      ah, 0x2a
1:0E63  cd21              int      0x21
1:0E65  3bda              cmp      bx, dx
1:0E67  58                pop      ax
1:0E68  7408              je       0xe72
1:0E6A  3c17              cmp      al, 0x17
1:0E6C  7504              jne      0xe72
1:0E6E  8bd3              mov      dx, bx
1:0E70  8bce              mov      cx, si
1:0E72  b400              mov      ah, 0
1:0E74  8ac2              mov      al, dl
1:0E76  50                push     ax
1:0E77  8ac6              mov      al, dh
1:0E79  50                push     ax
1:0E7A  81e9bc07          sub      cx, 0x7bc
1:0E7E  51                push     cx
1:0E7F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_22(1:1014)
1:0E84  83c40c            add      sp, 0xc
1:0E87  837e0600          cmp      word ptr [bp + 6], 0
1:0E8B  7408              je       0xe95
1:0E8D  8b5e06            mov      bx, word ptr [bp + 6]
1:0E90  895702            mov      word ptr [bx + 2], dx
1:0E93  8907              mov      word ptr [bx], ax
1:0E95  5e                pop      si
1:0E96  83ed02            sub      bp, 2
1:0E99  8be5              mov      sp, bp
1:0E9B  1f                pop      ds
1:0E9C  5d                pop      bp
1:0E9D  4d                dec      bp
1:0E9E  cb                retf     
1:0E9F  004555            add      byte ptr [di + 0x55], al
1:0EA2  8bec              mov      bp, sp
1:0EA4  8b4606            mov      ax, word ptr [bp + 6]
1:0EA7  a3b200            mov      word ptr [0xb2], ax
1:0EAA  c706b4000000      mov      word ptr [0xb4], 0
1:0EB0  5d                pop      bp
1:0EB1  4d                dec      bp
1:0EB2  cb                retf     
1:0EB3  90                nop      

; ===== EXPORT:ord_8(#8) =====
1:0EB4  45                inc      bp
1:0EB5  55                push     bp
1:0EB6  8bec              mov      bp, sp
1:0EB8  b8fd43            mov      ax, 0x43fd