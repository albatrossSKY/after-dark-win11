File: raw\unpacked\MODULES\MOUNTAIN.AD
Module: 'MOUNTAIN' ('Mountains AfterDark Module modified by TDE 29 Jan, 1991')
CS:IP=1:633E  SS:SP=0:0000  AutoDS=2  Heap=8192  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (4): win87em, KERNEL, GDI, USER
Segments (2):
  SEG  1: CODE off=0x00740 len=0x6370 min=0x6370 flags=0x0D50 relocs=939
  SEG  2: DATA off=0x081C0 len=0x0E24 min=0x0E24 flags=0x0D71 relocs=17
Exports (74):
  ord   1: SEG1:3712 flags=0x03 MODULE
  ord   2: SEG1:36FB flags=0x03 WEP
  ord   3: SEG1:5548 flags=0x03 ___EXPORTEDSTUB
  ord   4: SEG1:3D40 flags=0x00 
  ord   5: SEG1:3C56 flags=0x00 
  ord   6: SEG1:3D28 flags=0x00 
  ord   7: SEG1:3E04 flags=0x00 
  ord   8: SEG1:3BBC flags=0x00 
  ord   9: SEG1:3DEA flags=0x00 
  ord  10: SEG1:3DE4 flags=0x00 
  ord  11: SEG1:3A8E flags=0x00 
  ord  12: SEG1:3166 flags=0x00 
  ord  13: SEG1:31F4 flags=0x00 
  ord  14: SEG1:33E9 flags=0x00 
  ord  15: SEG1:322A flags=0x00 
  ord  16: SEG1:31AC flags=0x00 
  ord  17: SEG1:317E flags=0x00 
  ord  18: SEG1:3DB8 flags=0x00 
  ord  19: SEG1:3C88 flags=0x00 
  ord  20: SEG1:3B4C flags=0x00 
  ord  21: SEG1:3D34 flags=0x00 
  ord  22: SEG1:368C flags=0x00 
  ord  23: SEG1:3614 flags=0x00 
  ord  24: SEG1:3DBE flags=0x00 
  ord  25: SEG1:3DAC flags=0x00 
  ord  26: SEG1:3B0C flags=0x00 
  ord  27: SEG1:2014 flags=0x00 
  ord  28: SEG1:3DA0 flags=0x00 
  ord  29: SEG1:3B7C flags=0x00 
  ord  30: SEG1:3B9C flags=0x00 
  ord  31: SEG1:0C67 flags=0x00 
  ord  32: SEG1:0C7B flags=0x00 
  ord  33: SEG1:0C8F flags=0x00 
  ord  34: SEG1:041C flags=0x00 
  ord  35: SEG1:052E flags=0x00 
  ord  36: SEG1:03C3 flags=0x00 
  ord  37: SEG1:01D5 flags=0x00 
  ord  38: SEG1:3B38 flags=0x00 
  ord  39: SEG1:3AAA flags=0x00 
  ord  40: SEG1:36D4 flags=0x00 
  ord  41: SEG1:3E7E flags=0x00 
  ord  42: SEG1:38D0 flags=0x00 
  ord  43: SEG1:46FE flags=0x00 
  ord  44: SEG1:42A0 flags=0x00 
  ord  45: SEG1:4350 flags=0x00 
  ord  46: SEG1:422C flags=0x00 
  ord  47: SEG1:431A flags=0x00 
  ord  48: SEG1:4CA2 flags=0x00 
  ord  49: SEG1:3E42 flags=0x00 
  ord  50: SEG1:4F76 flags=0x00 
  ord  51: SEG1:4E44 flags=0x00 
  ord  52: SEG1:4D04 flags=0x00 
  ord  53: SEG1:3F82 flags=0x00 
  ord  54: SEG1:5002 flags=0x00 
  ord  55: SEG1:54B0 flags=0x00 
  ord  56: SEG1:50BC flags=0x00 
  ord  57: SEG1:4F86 flags=0x00 
  ord  58: SEG1:4FB8 flags=0x00 
  ord  59: SEG1:551A flags=0x00 
  ord  60: SEG1:5074 flags=0x00 
  ord  61: SEG1:5500 flags=0x00 
  ord  62: SEG1:50EA flags=0x00 
  ord  63: SEG1:4F41 flags=0x00 
  ord  64: SEG1:555C flags=0x00 
  ord  65: SEG1:5584 flags=0x00 
  ord  66: SEG1:5626 flags=0x00 
  ord  67: SEG1:55EA flags=0x00 
  ord  68: SEG1:5650 flags=0x00 
  ord  69: SEG1:5588 flags=0x00 
  ord  70: SEG1:4D1E flags=0x00 
  ord  71: SEG1:5F74 flags=0x00 
  ord  72: SEG1:542A flags=0x00 
  ord  73: SEG1:5513 flags=0x00 
  ord  74: SEG1:5FD4 flags=0x00 
Resources (7):
  TYPE_1000        #1               off=0x09080 len=   256
  TYPE_1000        #2               off=0x09180 len=   208
  TYPE_1000        #3               off=0x09250 len=    64
  TYPE_1000        #4               off=0x09290 len=   144
  TYPE_2000        #10              off=0x09320 len=    80
  TYPE_2000        #20              off=0x09370 len=    16
  TYPE_2000        #30              off=0x09380 len=   560

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
1:0012  1e                push     ds
1:0013  58                pop      ax
1:0014  90                nop      
1:0015  45                inc      bp
1:0016  55                push     bp
1:0017  8bec              mov      bp, sp
1:0019  1e                push     ds
1:001A  8ed8              mov      ds, ax
1:001C  83ec0c            sub      sp, 0xc
1:001F  56                push     si
1:0020  8b5e06            mov      bx, word ptr [bp + 6]
1:0023  8b4704            mov      ax, word ptr [bx + 4]
1:0026  8946f8            mov      word ptr [bp - 8], ax
1:0029  8bc8              mov      cx, ax
1:002B  2bd2              sub      dx, dx
1:002D  52                push     dx
1:002E  50                push     ax
1:002F  2bc0              sub      ax, ax
1:0031  ba0100            mov      dx, 1
1:0034  2b4702            sub      ax, word ptr [bx + 2]
1:0037  83da00            sbb      dx, 0
1:003A  52                push     dx
1:003B  50                push     ax
1:003C  8bf1              mov      si, cx
1:003E  9a7e000000        lcall    0, 0x7e  ; @1:INT:ord_5(1:3C56)
1:0043  8956fc            mov      word ptr [bp - 4], dx
1:0046  8bc6              mov      ax, si
1:0048  2bf2              sub      si, dx
1:004A  8976f4            mov      word ptr [bp - 0xc], si
1:004D  c746f60000        mov      word ptr [bp - 0xa], 0
1:0052  8b5e06            mov      bx, word ptr [bp + 6]
1:0055  8b0f              mov      cx, word ptr [bx]
1:0057  894efa            mov      word ptr [bp - 6], cx
1:005A  81f9aa2a          cmp      cx, 0x2aaa
1:005E  7735              ja       0x95
1:0060  8b5e08            mov      bx, word ptr [bp + 8]
1:0063  8907              mov      word ptr [bx], ax
1:0065  8b46fc            mov      ax, word ptr [bp - 4]
1:0068  894704            mov      word ptr [bx + 4], ax
1:006B  b9aa2a            mov      cx, 0x2aaa
1:006E  2bd2              sub      dx, dx
1:0070  52                push     dx
1:0071  51                push     cx
1:0072  ff76f6            push     word ptr [bp - 0xa]
1:0075  ff76f4            push     word ptr [bp - 0xc]
1:0078  8b4efa            mov      cx, word ptr [bp - 6]
1:007B  52                push     dx
1:007C  51                push     cx
1:007D  9ac1000000        lcall    0, 0xc1  ; @1:INT:ord_5(1:3C56)
1:0082  52                push     dx
1:0083  50                push     ax
1:0084  9ac8000000        lcall    0, 0xc8  ; @1:INT:ord_4(1:3D40)
1:0089  0346fc            add      ax, word ptr [bp - 4]
1:008C  8b5e08            mov      bx, word ptr [bp + 8]
1:008F  894702            mov      word ptr [bx + 2], ax
1:0092  e93701            jmp      0x1cc
1:0095  81f95555          cmp      cx, 0x5555
1:0099  773e              ja       0xd9
1:009B  8b46f8            mov      ax, word ptr [bp - 8]
1:009E  8b5e08            mov      bx, word ptr [bp + 8]
1:00A1  894702            mov      word ptr [bx + 2], ax
1:00A4  8b4efc            mov      cx, word ptr [bp - 4]
1:00A7  894f04            mov      word ptr [bx + 4], cx
1:00AA  b9ab2a            mov      cx, 0x2aab
1:00AD  2bd2              sub      dx, dx
1:00AF  52                push     dx
1:00B0  51                push     cx
1:00B1  ff76f6            push     word ptr [bp - 0xa]
1:00B4  ff76f4            push     word ptr [bp - 0xc]
1:00B7  8b4efa            mov      cx, word ptr [bp - 6]
1:00BA  81e9aa2a          sub      cx, 0x2aaa
1:00BE  52                push     dx
1:00BF  51                push     cx
1:00C0  9a03010000        lcall    0, 0x103  ; @1:INT:ord_5(1:3C56)
1:00C5  52                push     dx
1:00C6  50                push     ax
1:00C7  9a0a010000        lcall    0, 0x10a  ; @1:INT:ord_4(1:3D40)
1:00CC  2b46f8            sub      ax, word ptr [bp - 8]
1:00CF  f7d8              neg      ax
1:00D1  8b5e08            mov      bx, word ptr [bp + 8]
1:00D4  8907              mov      word ptr [bx], ax
1:00D6  e9f300            jmp      0x1cc
1:00D9  81f9ff7f          cmp      cx, 0x7fff
1:00DD  7735              ja       0x114
1:00DF  8bc2              mov      ax, dx
1:00E1  8b5e08            mov      bx, word ptr [bp + 8]
1:00E4  8907              mov      word ptr [bx], ax
1:00E6  8b4ef8            mov      cx, word ptr [bp - 8]
1:00E9  894f02            mov      word ptr [bx + 2], cx
1:00EC  b9aa2a            mov      cx, 0x2aaa
1:00EF  2bd2              sub      dx, dx
1:00F1  52                push     dx
1:00F2  51                push     cx
1:00F3  ff76f6            push     word ptr [bp - 0xa]
1:00F6  ff76f4            push     word ptr [bp - 0xc]
1:00F9  8b4efa            mov      cx, word ptr [bp - 6]
1:00FC  81e95555          sub      cx, 0x5555
1:0100  52                push     dx
1:0101  51                push     cx
1:0102  9a3e010000        lcall    0, 0x13e  ; @1:INT:ord_5(1:3C56)
1:0107  52                push     dx
1:0108  50                push     ax
1:0109  9a45010000        lcall    0, 0x145  ; @1:INT:ord_4(1:3D40)
1:010E  0346fc            add      ax, word ptr [bp - 4]
1:0111  e9b200            jmp      0x1c6
1:0114  81f9aaaa          cmp      cx, 0xaaaa
1:0118  7737              ja       0x151
1:011A  8bc2              mov      ax, dx
1:011C  8b5e08            mov      bx, word ptr [bp + 8]
1:011F  8907              mov      word ptr [bx], ax
1:0121  8b46f8            mov      ax, word ptr [bp - 8]
1:0124  894704            mov      word ptr [bx + 4], ax
1:0127  b9ab2a            mov      cx, 0x2aab
1:012A  2bd2              sub      dx, dx
1:012C  52                push     dx
1:012D  51                push     cx
1:012E  ff76f6            push     word ptr [bp - 0xa]
1:0131  ff76f4            push     word ptr [bp - 0xc]
1:0134  8b4efa            mov      cx, word ptr [bp - 6]
1:0137  81e9ff7f          sub      cx, 0x7fff
1:013B  52                push     dx
1:013C  51                push     cx
1:013D  9a7e010000        lcall    0, 0x17e  ; @1:INT:ord_5(1:3C56)
1:0142  52                push     dx
1:0143  50                push     ax
1:0144  9a85010000        lcall    0, 0x185  ; @1:INT:ord_4(1:3D40)
1:0149  2b46f8            sub      ax, word ptr [bp - 8]
1:014C  f7d8              neg      ax
1:014E  e93bff            jmp      0x8c
1:0151  81f954d5          cmp      cx, 0xd554
1:0155  7738              ja       0x18f
1:0157  8bc2              mov      ax, dx
1:0159  8b5e08            mov      bx, word ptr [bp + 8]
1:015C  894702            mov      word ptr [bx + 2], ax
1:015F  8b4ef8            mov      cx, word ptr [bp - 8]
1:0162  894f04            mov      word ptr [bx + 4], cx
1:0165  b9aa2a            mov      cx, 0x2aaa
1:0168  2bd2              sub      dx, dx
1:016A  52                push     dx
1:016B  51                push     cx
1:016C  ff76f6            push     word ptr [bp - 0xa]
1:016F  ff76f4            push     word ptr [bp - 0xc]
1:0172  8b4efa            mov      cx, word ptr [bp - 6]
1:0175  81e9aaaa          sub      cx, 0xaaaa
1:0179  1bd2              sbb      dx, dx
1:017B  52                push     dx
1:017C  51                push     cx
1:017D  9ab6010000        lcall    0, 0x1b6  ; @1:INT:ord_5(1:3C56)
1:0182  52                push     dx
1:0183  50                push     ax
1:0184  9abd010000        lcall    0, 0x1bd  ; @1:INT:ord_4(1:3D40)
1:0189  0346fc            add      ax, word ptr [bp - 4]
1:018C  e942ff            jmp      0xd1
1:018F  8b46f8            mov      ax, word ptr [bp - 8]
1:0192  8b5e08            mov      bx, word ptr [bp + 8]
1:0195  8907              mov      word ptr [bx], ax
1:0197  8b4efc            mov      cx, word ptr [bp - 4]
1:019A  894f02            mov      word ptr [bx + 2], cx
1:019D  b9ab2a            mov      cx, 0x2aab
1:01A0  2bd2              sub      dx, dx
1:01A2  52                push     dx
1:01A3  51                push     cx
1:01A4  ff76f6            push     word ptr [bp - 0xa]
1:01A7  ff76f4            push     word ptr [bp - 0xc]
1:01AA  8b4efa            mov      cx, word ptr [bp - 6]
1:01AD  81e954d5          sub      cx, 0xd554
1:01B1  1bd2              sbb      dx, dx
1:01B3  52                push     dx
1:01B4  51                push     cx
1:01B5  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_5(1:3C56)
1:01BA  52                push     dx
1:01BB  50                push     ax
1:01BC  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_4(1:3D40)
1:01C1  2b46f8            sub      ax, word ptr [bp - 8]
1:01C4  f7d8              neg      ax
1:01C6  8b5e08            mov      bx, word ptr [bp + 8]
1:01C9  894704            mov      word ptr [bx + 4], ax
1:01CC  5e                pop      si
1:01CD  4d                dec      bp
1:01CE  4d                dec      bp
1:01CF  8be5              mov      sp, bp
1:01D1  1f                pop      ds
1:01D2  5d                pop      bp
1:01D3  4d                dec      bp
1:01D4  cb                retf     

; ===== EXPORT:ord_37(#37) =====
1:01D5  1e                push     ds
1:01D6  58                pop      ax
1:01D7  90                nop      
1:01D8  45                inc      bp
1:01D9  55                push     bp
1:01DA  8bec              mov      bp, sp
1:01DC  1e                push     ds
1:01DD  8ed8              mov      ds, ax
1:01DF  83ec18            sub      sp, 0x18
1:01E2  56                push     si
1:01E3  c706420d0000      mov      word ptr [0xd42], 0
1:01E9  2bc0              sub      ax, ax
1:01EB  a3e60a            mov      word ptr [0xae6], ax
1:01EE  a34e0d            mov      word ptr [0xd4e], ax
1:01F1  a3e40c            mov      word ptr [0xce4], ax
1:01F4  a3440d            mov      word ptr [0xd44], ax
1:01F7  c41ed60c          les      bx, ptr [0xcd6]
1:01FB  26837f0a01        cmp      word ptr es:[bx + 0xa], 1
1:0200  7508              jne      0x20a
1:0202  c706380b0200      mov      word ptr [0xb38], 2
1:0208  eb0b              jmp      0x215
1:020A  c41eda0d          les      bx, ptr [0xdda]
1:020E  268b4706          mov      ax, word ptr es:[bx + 6]
1:0212  a3380b            mov      word ptr [0xb38], ax
1:0215  c41eda0d          les      bx, ptr [0xdda]
1:0219  268b4708          mov      ax, word ptr es:[bx + 8]
1:021D  a33a0b            mov      word ptr [0xb3a], ax
1:0220  268b470a          mov      ax, word ptr es:[bx + 0xa]
1:0224  a33c0b            mov      word ptr [0xb3c], ax
1:0227  268b470c          mov      ax, word ptr es:[bx + 0xc]
1:022B  a33e0b            mov      word ptr [0xb3e], ax
1:022E  a13c0b            mov      ax, word ptr [0xb3c]
1:0231  99                cdq      
1:0232  a3d80a            mov      word ptr [0xad8], ax
1:0235  8916da0a          mov      word ptr [0xada], dx
1:0239  8bc8              mov      cx, ax
1:023B  8bf2              mov      si, dx
1:023D  b80100            mov      ax, 1
1:0240  99                cdq      
1:0241  9a49030000        lcall    0, 0x349  ; @1:INT:ord_6(1:3D28)
1:0246  a3fa0d            mov      word ptr [0xdfa], ax
1:0249  8916fc0d          mov      word ptr [0xdfc], dx
1:024D  050100            add      ax, 1
1:0250  83d200            adc      dx, 0
1:0253  a3dc0a            mov      word ptr [0xadc], ax
1:0256  8916de0a          mov      word ptr [0xade], dx
1:025A  2bc0              sub      ax, ax
1:025C  a3d209            mov      word ptr [0x9d2], ax
1:025F  a3d009            mov      word ptr [0x9d0], ax
1:0262  c41eda0d          les      bx, ptr [0xdda]
1:0266  268b4702          mov      ax, word ptr es:[bx + 2]
1:026A  a3d409            mov      word ptr [0x9d4], ax
1:026D  268b4704          mov      ax, word ptr es:[bx + 4]
1:0271  a3d609            mov      word ptr [0x9d6], ax
1:0274  a1d409            mov      ax, word ptr [0x9d4]
1:0277  c41ed60c          les      bx, ptr [0xcd6]
1:027B  268b4f0a          mov      cx, word ptr es:[bx + 0xa]
1:027F  83f904            cmp      cx, 4
1:0282  7c04              jl       0x288
1:0284  b001              mov      al, 1
1:0286  eb02              jmp      0x28a
1:0288  2ac0              sub      al, al
1:028A  a2c20a            mov      byte ptr [0xac2], al
1:028D  8bc1              mov      ax, cx
1:028F  a31a0e            mov      word ptr [0xe1a], ax
1:0292  b8540d            mov      ax, 0xd54
1:0295  1e                push     ds
1:0296  50                push     ax
1:0297  b9d009            mov      cx, 0x9d0
1:029A  1e                push     ds
1:029B  51                push     cx
1:029C  9a1f030000        lcall    0, 0x31f  ; @1:USER.CopyRect
1:02A1  a1580d            mov      ax, word ptr [0xd58]
1:02A4  2b06540d          sub      ax, word ptr [0xd54]
1:02A8  a3380d            mov      word ptr [0xd38], ax
1:02AB  8b0e5a0d          mov      cx, word ptr [0xd5a]
1:02AF  2b0e560d          sub      cx, word ptr [0xd56]
1:02B3  890e400d          mov      word ptr [0xd40], cx
1:02B7  8946ec            mov      word ptr [bp - 0x14], ax
1:02BA  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:02BB  df46ec            fild     word ptr [bp - 0x14]
1:02BE  894eea            mov      word ptr [bp - 0x16], cx
1:02C1  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:02C2  de76ea            fidiv    word ptr [bp - 0x16]
1:02C5  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:02C6  dc166007          fcom     qword ptr [0x760]
1:02CA  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:02CB  ddd8              fstp     st(0)
1:02CD  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:02CE  dd7ee8            fnstsw   word ptr [bp - 0x18]
1:02D1  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:02D2  9b                wait     
1:02D3  8a66e9            mov      ah, byte ptr [bp - 0x17]
1:02D6  9e                sahf     
1:02D7  7627              jbe      0x300
1:02D9  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:02DA  df06400d          fild     word ptr [0xd40]
1:02DE  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:02DF  dc0e6007          fmul     qword ptr [0x760]
1:02E3  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:02E4  de2e380d          fisubr   word ptr [0xd38]
1:02E8  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:3E04)
1:02ED  a3380d            mov      word ptr [0xd38], ax
1:02F0  99                cdq      
1:02F1  2bc2              sub      ax, dx
1:02F3  d1f8              sar      ax, 1
1:02F5  a3380d            mov      word ptr [0xd38], ax
1:02F8  0106540d          add      word ptr [0xd54], ax
1:02FC  2906580d          sub      word ptr [0xd58], ax
1:0300  a1580d            mov      ax, word ptr [0xd58]
1:0303  2b06540d          sub      ax, word ptr [0xd54]
1:0307  a3380d            mov      word ptr [0xd38], ax
1:030A  a15a0d            mov      ax, word ptr [0xd5a]
1:030D  2b06560d          sub      ax, word ptr [0xd56]
1:0311  a3400d            mov      word ptr [0xd40], ax
1:0314  b8d809            mov      ax, 0x9d8
1:0317  1e                push     ds
1:0318  50                push     ax
1:0319  b8540d            mov      ax, 0xd54
1:031C  1e                push     ds
1:031D  50                push     ax
1:031E  9affff0000        lcall    0, 0xffff  ; @1:USER.CopyRect
1:0323  a1560d            mov      ax, word ptr [0xd56]
1:0326  8b0e540d          mov      cx, word ptr [0xd54]
1:032A  890ee00a          mov      word ptr [0xae0], cx
1:032E  a3e20a            mov      word ptr [0xae2], ax
1:0331  ff36de0a          push     word ptr [0xade]
1:0335  ff36dc0a          push     word ptr [0xadc]
1:0339  ff36de0a          push     word ptr [0xade]
1:033D  ff36dc0a          push     word ptr [0xadc]
1:0341  9a3f000000        lcall    0, 0x3f  ; @1:INT:ord_5(1:3C56)
1:0346  b102              mov      cl, 2
1:0348  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_6(1:3D28)
1:034D  0bd2              or       dx, dx
1:034F  7c0c              jl       0x35d
1:0351  7f05              jg       0x358
1:0353  3dffff            cmp      ax, 0xffff
1:0356  7605              jbe      0x35d
1:0358  b80100            mov      ax, 1
1:035B  eb5d              jmp      0x3ba
1:035D  b80200            mov      ax, 2
1:0360  50                push     ax
1:0361  a1dc0a            mov      ax, word ptr [0xadc]
1:0364  8bc8              mov      cx, ax
1:0366  f7e1              mul      cx
1:0368  d1e0              shl      ax, 1
1:036A  d1e0              shl      ax, 1
1:036C  50                push     ax
1:036D  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LocalAlloc
1:0372  a3e40c            mov      word ptr [0xce4], ax
1:0375  0bc0              or       ax, ax
1:0377  740b              je       0x384
1:0379  50                push     ax
1:037A  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LocalLock
1:037F  a3e60a            mov      word ptr [0xae6], ax
1:0382  eb06              jmp      0x38a
1:0384  c706e60a0000      mov      word ptr [0xae6], 0
1:038A  833ee60a00        cmp      word ptr [0xae6], 0
1:038F  74c7              je       0x358
1:0391  c6065c0d00        mov      byte ptr [0xd5c], 0
1:0396  c606da0c01        mov      byte ptr [0xcda], 1
1:039B  c746f80000        mov      word ptr [bp - 8], 0
1:03A0  8b5ef8            mov      bx, word ptr [bp - 8]
1:03A3  d1e3              shl      bx, 1
1:03A5  d1e3              shl      bx, 1
1:03A7  2bc0              sub      ax, ax
1:03A9  8987440b          mov      word ptr [bx + 0xb44], ax
1:03AD  8987420b          mov      word ptr [bx + 0xb42], ax
1:03B1  ff46f8            inc      word ptr [bp - 8]
1:03B4  837ef865          cmp      word ptr [bp - 8], 0x65
1:03B8  7ce6              jl       0x3a0
1:03BA  5e                pop      si
1:03BB  4d                dec      bp
1:03BC  4d                dec      bp
1:03BD  8be5              mov      sp, bp
1:03BF  1f                pop      ds
1:03C0  5d                pop      bp
1:03C1  4d                dec      bp
1:03C2  cb                retf     

; ===== EXPORT:ord_36(#36) =====
1:03C3  1e                push     ds
1:03C4  58                pop      ax
1:03C5  90                nop      
1:03C6  45                inc      bp
1:03C7  55                push     bp
1:03C8  8bec              mov      bp, sp
1:03CA  1e                push     ds
1:03CB  8ed8              mov      ds, ax
1:03CD  83ec0a            sub      sp, 0xa
1:03D0  8d46f6            lea      ax, [bp - 0xa]
1:03D3  16                push     ss
1:03D4  50                push     ax
1:03D5  2bc0              sub      ax, ax
1:03D7  50                push     ax
1:03D8  50                push     ax
1:03D9  c41eda0d          les      bx, ptr [0xdda]
1:03DD  26ff7702          push     word ptr es:[bx + 2]
1:03E1  26ff7704          push     word ptr es:[bx + 4]
1:03E5  9a3f040000        lcall    0, 0x43f  ; @1:USER.SetRect
1:03EA  ff36e40a          push     word ptr [0xae4]
1:03EE  8d46f6            lea      ax, [bp - 0xa]
1:03F1  16                push     ss
1:03F2  50                push     ax
1:03F3  b80400            mov      ax, 4
1:03F6  50                push     ax
1:03F7  9a51040000        lcall    0, 0x451  ; @1:GDI.GetStockObject
1:03FC  50                push     ax
1:03FD  9a57040000        lcall    0, 0x457  ; @1:USER.FillRect
1:0402  c41ed60c          les      bx, ptr [0xcd6]
1:0406  26837f0a08        cmp      word ptr es:[bx + 0xa], 8
1:040B  7505              jne      0x412
1:040D  b80b00            mov      ax, 0xb
1:0410  eb02              jmp      0x414
1:0412  2bc0              sub      ax, ax
1:0414  4d                dec      bp
1:0415  4d                dec      bp
1:0416  8be5              mov      sp, bp
1:0418  1f                pop      ds
1:0419  5d                pop      bp
1:041A  4d                dec      bp
1:041B  cb                retf     

; ===== EXPORT:ord_34(#34) =====
1:041C  1e                push     ds
1:041D  58                pop      ax
1:041E  90                nop      
1:041F  45                inc      bp
1:0420  55                push     bp
1:0421  8bec              mov      bp, sp
1:0423  1e                push     ds
1:0424  8ed8              mov      ds, ax
1:0426  83ec0a            sub      sp, 0xa
1:0429  8d46f6            lea      ax, [bp - 0xa]
1:042C  16                push     ss
1:042D  50                push     ax
1:042E  2bc0              sub      ax, ax
1:0430  50                push     ax
1:0431  50                push     ax
1:0432  c41eda0d          les      bx, ptr [0xdda]
1:0436  26ff7702          push     word ptr es:[bx + 2]
1:043A  26ff7704          push     word ptr es:[bx + 4]
1:043E  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:0443  ff36e40a          push     word ptr [0xae4]
1:0447  8d46f6            lea      ax, [bp - 0xa]
1:044A  16                push     ss
1:044B  50                push     ax
1:044C  b80400            mov      ax, 4
1:044F  50                push     ax
1:0450  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:0455  50                push     ax
1:0456  9affff0000        lcall    0, 0xffff  ; @1:USER.FillRect
1:045B  833ee40c00        cmp      word ptr [0xce4], 0
1:0460  7412              je       0x474
1:0462  ff36e40c          push     word ptr [0xce4]
1:0466  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LocalUnlock
1:046B  ff36e40c          push     word ptr [0xce4]
1:046F  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LocalFree
1:0474  2bc0              sub      ax, ax
1:0476  4d                dec      bp
1:0477  4d                dec      bp
1:0478  8be5              mov      sp, bp
1:047A  1f                pop      ds
1:047B  5d                pop      bp
1:047C  4d                dec      bp
1:047D  cb                retf     
1:047E  1e                push     ds
1:047F  58                pop      ax
1:0480  90                nop      
1:0481  45                inc      bp
1:0482  55                push     bp
1:0483  8bec              mov      bp, sp
1:0485  1e                push     ds
1:0486  8ed8              mov      ds, ax
1:0488  9a15050000        lcall    0, 0x515  ; @1:USER.GetCurrentTime
1:048D  3b16d00d          cmp      dx, word ptr [0xdd0]
1:0491  7303              jae      0x496
1:0493  e99000            jmp      0x526
1:0496  7709              ja       0x4a1
1:0498  3b06ce0d          cmp      ax, word ptr [0xdce]
1:049C  7703              ja       0x4a1
1:049E  e98500            jmp      0x526
1:04A1  c41eda0d          les      bx, ptr [0xdda]
1:04A5  26c45f1a          les      bx, ptr es:[bx + 0x1a]
1:04A9  83c304            add      bx, 4
1:04AC  891ee409          mov      word ptr [0x9e4], bx
1:04B0  8c06e609          mov      word ptr [0x9e6], es
1:04B4  268b07            mov      ax, word ptr es:[bx]
1:04B7  268b5702          mov      dx, word ptr es:[bx + 2]
1:04BB  a3e009            mov      word ptr [0x9e0], ax
1:04BE  8916e209          mov      word ptr [0x9e2], dx
1:04C2  268b4704          mov      ax, word ptr es:[bx + 4]
1:04C6  268b5706          mov      dx, word ptr es:[bx + 6]
1:04CA  268907            mov      word ptr es:[bx], ax
1:04CD  26895702          mov      word ptr es:[bx + 2], dx
1:04D1  c41ee409          les      bx, ptr [0x9e4]
1:04D5  268b4708          mov      ax, word ptr es:[bx + 8]
1:04D9  268b570a          mov      dx, word ptr es:[bx + 0xa]
1:04DD  26894704          mov      word ptr es:[bx + 4], ax
1:04E1  26895706          mov      word ptr es:[bx + 6], dx
1:04E5  a1e009            mov      ax, word ptr [0x9e0]
1:04E8  8b16e209          mov      dx, word ptr [0x9e2]
1:04EC  c41ee409          les      bx, ptr [0x9e4]
1:04F0  26894708          mov      word ptr es:[bx + 8], ax
1:04F4  2689570a          mov      word ptr es:[bx + 0xa], dx
1:04F8  c41eda0d          les      bx, ptr [0xdda]
1:04FC  26ff7718          push     word ptr es:[bx + 0x18]
1:0500  2bc0              sub      ax, ax
1:0502  50                push     ax
1:0503  b80300            mov      ax, 3
1:0506  50                push     ax
1:0507  ff36e609          push     word ptr [0x9e6]
1:050B  ff36e409          push     word ptr [0x9e4]
1:050F  9affff0000        lcall    0, 0xffff  ; @1:GDI.AnimatePalette
1:0514  9affff0000        lcall    0, 0xffff  ; @1:USER.GetCurrentTime
1:0519  056400            add      ax, 0x64
1:051C  83d200            adc      dx, 0
1:051F  a3ce0d            mov      word ptr [0xdce], ax
1:0522  8916d00d          mov      word ptr [0xdd0], dx
1:0526  4d                dec      bp
1:0527  4d                dec      bp
1:0528  8be5              mov      sp, bp
1:052A  1f                pop      ds
1:052B  5d                pop      bp
1:052C  4d                dec      bp
1:052D  cb                retf     

; ===== EXPORT:ord_35(#35) =====
1:052E  1e                push     ds
1:052F  58                pop      ax
1:0530  90                nop      
1:0531  45                inc      bp
1:0532  55                push     bp
1:0533  8bec              mov      bp, sp
1:0535  1e                push     ds
1:0536  8ed8              mov      ds, ax
1:0538  83ec22            sub      sp, 0x22
1:053B  57                push     di
1:053C  56                push     si
1:053D  9a13060000        lcall    0, 0x613  ; @1:USER.GetCurrentTime
1:0542  050a00            add      ax, 0xa
1:0545  83d200            adc      dx, 0
1:0548  a3de0d            mov      word ptr [0xdde], ax
1:054B  8916e00d          mov      word ptr [0xde0], dx
1:054F  c41eda0d          les      bx, ptr [0xdda]
1:0553  268b470a          mov      ax, word ptr es:[bx + 0xa]
1:0557  8946f6            mov      word ptr [bp - 0xa], ax
1:055A  c436d60c          les      si, ptr [0xcd6]
1:055E  26837c0a01        cmp      word ptr es:[si + 0xa], 1
1:0563  750b              jne      0x570
1:0565  8e06dc0d          mov      es, word ptr [0xddc]
1:0569  268b4706          mov      ax, word ptr es:[bx + 6]
1:056D  a3380b            mov      word ptr [0xb38], ax
1:0570  a1380b            mov      ax, word ptr [0xb38]
1:0573  8e06dc0d          mov      es, word ptr [0xddc]
1:0577  26394706          cmp      word ptr es:[bx + 6], ax
1:057B  7512              jne      0x58f
1:057D  a13a0b            mov      ax, word ptr [0xb3a]
1:0580  26394708          cmp      word ptr es:[bx + 8], ax
1:0584  7509              jne      0x58f
1:0586  8b46f6            mov      ax, word ptr [bp - 0xa]
1:0589  3906d80a          cmp      word ptr [0xad8], ax
1:058D  7410              je       0x59f
1:058F  0e                push     cs
1:0590  e889fe            call     0x41c
1:0593  c706420d0000      mov      word ptr [0xd42], 0
1:0599  b80300            mov      ax, 3
1:059C  e9be06            jmp      0xc5d
1:059F  c41ed60c          les      bx, ptr [0xcd6]
1:05A3  26837f0a01        cmp      word ptr es:[bx + 0xa], 1
1:05A8  7506              jne      0x5b0
1:05AA  c706380b0200      mov      word ptr [0xb38], 2
1:05B0  a13e0b            mov      ax, word ptr [0xb3e]
1:05B3  c41eda0d          les      bx, ptr [0xdda]
1:05B7  2639470c          cmp      word ptr es:[bx + 0xc], ax
1:05BB  7509              jne      0x5c6
1:05BD  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_17(1:317E)
1:05C2  0bc0              or       ax, ax
1:05C4  7432              je       0x5f8
1:05C6  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_16(1:31AC)
1:05CB  0bc0              or       ax, ax
1:05CD  7504              jne      0x5d3
1:05CF  0e                push     cs
1:05D0  e8f0fd            call     0x3c3
1:05D3  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_15(1:322A)
1:05D8  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_14(1:33E9)
1:05DD  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_13(1:31F4)
1:05E2  c706420d0000      mov      word ptr [0xd42], 0
1:05E8  c41eda0d          les      bx, ptr [0xdda]
1:05EC  268b470c          mov      ax, word ptr es:[bx + 0xc]
1:05F0  a33e0b            mov      word ptr [0xb3e], ax
1:05F3  2bc0              sub      ax, ax
1:05F5  e96506            jmp      0xc5d
1:05F8  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:3166)
1:05FD  833e420d00        cmp      word ptr [0xd42], 0
1:0602  7e72              jle      0x676
1:0604  833e420d08        cmp      word ptr [0xd42], 8
1:0609  7d6b              jge      0x676
1:060B  803eda0c00        cmp      byte ptr [0xcda], 0
1:0610  7464              je       0x676
1:0612  9a7d060000        lcall    0, 0x67d  ; @1:USER.GetCurrentTime
1:0617  3b16520d          cmp      dx, word ptr [0xd52]
1:061B  7259              jb       0x676
1:061D  7706              ja       0x625
1:061F  3b06500d          cmp      ax, word ptr [0xd50]
1:0623  7651              jbe      0x676
1:0625  803e400b00        cmp      byte ptr [0xb40], 0
1:062A  754a              jne      0x676
1:062C  c606400b01        mov      byte ptr [0xb40], 1
1:0631  ff36e40a          push     word ptr [0xae4]
1:0635  b8ffff            mov      ax, 0xffff
1:0638  baff02            mov      dx, 0x2ff
1:063B  52                push     dx
1:063C  50                push     ax
1:063D  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextColor
1:0642  ff36e40a          push     word ptr [0xae4]
1:0646  2bc0              sub      ax, ax
1:0648  ba0002            mov      dx, 0x200
1:064B  52                push     dx
1:064C  50                push     ax
1:064D  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkColor
1:0652  ff36e40a          push     word ptr [0xae4]
1:0656  a1e00a            mov      ax, word ptr [0xae0]
1:0659  051400            add      ax, 0x14
1:065C  50                push     ax
1:065D  a1e20a            mov      ax, word ptr [0xae2]
1:0660  052800            add      ax, 0x28
1:0663  50                push     ax
1:0664  b81000            mov      ax, 0x10
1:0667  1e                push     ds
1:0668  50                push     ax
1:0669  50                push     ax
1:066A  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:3A8E)
1:066F  5b                pop      bx
1:0670  50                push     ax
1:0671  9affff0000        lcall    0, 0xffff  ; @1:GDI.TextOut
1:0676  a1420d            mov      ax, word ptr [0xd42]
1:0679  e9af05            jmp      0xc2b
1:067C  9a89040000        lcall    0, 0x489  ; @1:USER.GetCurrentTime
1:0681  053c00            add      ax, 0x3c
1:0684  83d200            adc      dx, 0
1:0687  a3500d            mov      word ptr [0xd50], ax
1:068A  8916520d          mov      word ptr [0xd52], dx
1:068E  c606400b00        mov      byte ptr [0xb40], 0
1:0693  0e                push     cs
1:0694  e8780b            call     0x120f
1:0697  e9bc05            jmp      0xc56
1:069A  0e                push     cs
1:069B  e8700c            call     0x130e
1:069E  e9b505            jmp      0xc56
1:06A1  c746fc0000        mov      word ptr [bp - 4], 0
1:06A6  eb03              jmp      0x6ab
1:06A8  ff46fc            inc      word ptr [bp - 4]
1:06AB  837efc0a          cmp      word ptr [bp - 4], 0xa
1:06AF  7e03              jle      0x6b4
1:06B1  e9a205            jmp      0xc56
1:06B4  8b5efc            mov      bx, word ptr [bp - 4]
1:06B7  d1e3              shl      bx, 1
1:06B9  c787660d0000      mov      word ptr [bx + 0xd66], 0
1:06BF  ebe7              jmp      0x6a8
1:06C1  b80a00            mov      ax, 0xa
1:06C4  99                cdq      
1:06C5  52                push     dx
1:06C6  50                push     ax
1:06C7  ff36de0a          push     word ptr [0xade]
1:06CB  ff36dc0a          push     word ptr [0xadc]
1:06CF  ff36de0a          push     word ptr [0xade]
1:06D3  ff36dc0a          push     word ptr [0xadc]
1:06D7  9a4a070000        lcall    0, 0x74a  ; @1:INT:ord_5(1:3C56)
1:06DC  2d0100            sub      ax, 1
1:06DF  83da00            sbb      dx, 0
1:06E2  52                push     dx
1:06E3  50                push     ax
1:06E4  a1dc0a            mov      ax, word ptr [0xadc]
1:06E7  8b16de0a          mov      dx, word ptr [0xade]
1:06EB  2d0100            sub      ax, 1
1:06EE  83da00            sbb      dx, 0
1:06F1  52                push     dx
1:06F2  50                push     ax
1:06F3  2bc0              sub      ax, ax
1:06F5  50                push     ax
1:06F6  50                push     ax
1:06F7  0e                push     cs
1:06F8  e8e415            call     0x1cdf
1:06FB  83c410            add      sp, 0x10
1:06FE  833e780d04        cmp      word ptr [0xd78], 4
1:0703  7503              jne      0x708
1:0705  e97402            jmp      0x97c
1:0708  ff0e420d          dec      word ptr [0xd42]
1:070C  e94705            jmp      0xc56
1:070F  c746fc0000        mov      word ptr [bp - 4], 0
1:0714  eb03              jmp      0x719
1:0716  ff46fc            inc      word ptr [bp - 4]
1:0719  837efc0a          cmp      word ptr [bp - 4], 0xa
1:071D  7e03              jle      0x722
1:071F  e95a02            jmp      0x97c
1:0722  8b5efc            mov      bx, word ptr [bp - 4]
1:0725  d1e3              shl      bx, 1
1:0727  c787660d0000      mov      word ptr [bx + 0xd66], 0
1:072D  ebe7              jmp      0x716
1:072F  b80a00            mov      ax, 0xa
1:0732  99                cdq      
1:0733  52                push     dx
1:0734  50                push     ax
1:0735  2bc0              sub      ax, ax
1:0737  50                push     ax
1:0738  50                push     ax
1:0739  ff36de0a          push     word ptr [0xade]
1:073D  ff36dc0a          push     word ptr [0xadc]
1:0741  ff36de0a          push     word ptr [0xade]
1:0745  ff36dc0a          push     word ptr [0xadc]
1:0749  9a6e070000        lcall    0, 0x76e  ; @1:INT:ord_5(1:3C56)
1:074E  2d0100            sub      ax, 1
1:0751  83da00            sbb      dx, 0
1:0754  52                push     dx
1:0755  50                push     ax
1:0756  ff36de0a          push     word ptr [0xade]
1:075A  ff36dc0a          push     word ptr [0xadc]
1:075E  a1dc0a            mov      ax, word ptr [0xadc]
1:0761  8b16de0a          mov      dx, word ptr [0xade]
1:0765  2d0100            sub      ax, 1
1:0768  83da00            sbb      dx, 0
1:076B  52                push     dx
1:076C  50                push     ax
1:076D  9ad0080000        lcall    0, 0x8d0  ; @1:INT:ord_5(1:3C56)
1:0772  52                push     dx
1:0773  eb81              jmp      0x6f6
1:0775  0e                push     cs
1:0776  e8d812            call     0x1a51
1:0779  c706620dffff      mov      word ptr [0xd62], 0xffff
1:077F  c706640dffff      mov      word ptr [0xd64], 0xffff
1:0785  e9ce04            jmp      0xc56
1:0788  0e                push     cs
1:0789  e8fa13            call     0x1b86
1:078C  0bc0              or       ax, ax
1:078E  7403              je       0x793
1:0790  e9e901            jmp      0x97c
1:0793  e972ff            jmp      0x708
1:0796  0e                push     cs
1:0797  e829fc            call     0x3c3
1:079A  803e5c0d00        cmp      byte ptr [0xd5c], 0
1:079F  7403              je       0x7a4
1:07A1  e9d801            jmp      0x97c
1:07A4  a11a0e            mov      ax, word ptr [0xe1a]
1:07A7  2d0800            sub      ax, 8
1:07AA  7403              je       0x7af
1:07AC  e9cd01            jmp      0x97c
1:07AF  c41eda0d          les      bx, ptr [0xdda]
1:07B3  26837f1800        cmp      word ptr es:[bx + 0x18], 0
1:07B8  7503              jne      0x7bd
1:07BA  e9bf01            jmp      0x97c
1:07BD  0e                push     cs
1:07BE  e8f704            call     0xcb8
1:07C1  e99204            jmp      0xc56
1:07C4  b8f00a            mov      ax, 0xaf0
1:07C7  8bf8              mov      di, ax
1:07C9  be6807            mov      si, 0x768
1:07CC  1e                push     ds
1:07CD  07                pop      es
1:07CE  a5                movsw    word ptr es:[di], word ptr [si]
1:07CF  a5                movsw    word ptr es:[di], word ptr [si]
1:07D0  a5                movsw    word ptr es:[di], word ptr [si]
1:07D1  a5                movsw    word ptr es:[di], word ptr [si]
1:07D2  b8080b            mov      ax, 0xb08
1:07D5  8bf8              mov      di, ax
1:07D7  be7007            mov      si, 0x770
1:07DA  a5                movsw    word ptr es:[di], word ptr [si]
1:07DB  a5                movsw    word ptr es:[di], word ptr [si]
1:07DC  a5                movsw    word ptr es:[di], word ptr [si]
1:07DD  a5                movsw    word ptr es:[di], word ptr [si]
1:07DE  b8200b            mov      ax, 0xb20
1:07E1  8bf8              mov      di, ax
1:07E3  be7007            mov      si, 0x770
1:07E6  a5                movsw    word ptr es:[di], word ptr [si]
1:07E7  a5                movsw    word ptr es:[di], word ptr [si]
1:07E8  a5                movsw    word ptr es:[di], word ptr [si]
1:07E9  a5                movsw    word ptr es:[di], word ptr [si]
1:07EA  b8f80a            mov      ax, 0xaf8
1:07ED  8bf8              mov      di, ax
1:07EF  be7007            mov      si, 0x770
1:07F2  a5                movsw    word ptr es:[di], word ptr [si]
1:07F3  a5                movsw    word ptr es:[di], word ptr [si]
1:07F4  a5                movsw    word ptr es:[di], word ptr [si]
1:07F5  a5                movsw    word ptr es:[di], word ptr [si]
1:07F6  a13e0b            mov      ax, word ptr [0xb3e]
1:07F9  f7d8              neg      ax
1:07FB  8946ee            mov      word ptr [bp - 0x12], ax
1:07FE  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:07FF  df46ee            fild     word ptr [bp - 0x12]
1:0802  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0803  dc0e7807          fmul     qword ptr [0x778]
1:0807  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0808  dc266807          fsub     qword ptr [0x768]
1:080C  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:080D  dd16d20d          fst      qword ptr [0xdd2]
1:0811  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:0812  9b                wait     
1:0813  83ec08            sub      sp, 8
1:0816  8bdc              mov      bx, sp
1:0818  9b                wait       ; @0:OSFIXUP:FISRQQ/FJSRQQ (add,t=5)
1:0819  36dd1f            fstp     qword ptr ss:[bx]
1:081C  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:081D  9b                wait     
1:081E  9a9c080000        lcall    0, 0x89c  ; @1:INT:ord_9(1:3DEA)
1:0823  83c408            add      sp, 8
1:0826  ba100b            mov      dx, 0xb10
1:0829  8bfa              mov      di, dx
1:082B  8bf0              mov      si, ax
1:082D  1e                push     ds
1:082E  07                pop      es
1:082F  a5                movsw    word ptr es:[di], word ptr [si]
1:0830  a5                movsw    word ptr es:[di], word ptr [si]
1:0831  a5                movsw    word ptr es:[di], word ptr [si]
1:0832  a5                movsw    word ptr es:[di], word ptr [si]
1:0833  ff36d80d          push     word ptr [0xdd8]
1:0837  ff36d60d          push     word ptr [0xdd6]
1:083B  ff36d40d          push     word ptr [0xdd4]
1:083F  ff36d20d          push     word ptr [0xdd2]
1:0843  9a75080000        lcall    0, 0x875  ; @1:INT:ord_10(1:3DE4)
1:0848  83c408            add      sp, 8
1:084B  ba280b            mov      dx, 0xb28
1:084E  8bfa              mov      di, dx
1:0850  8bf0              mov      si, ax
1:0852  1e                push     ds
1:0853  07                pop      es
1:0854  a5                movsw    word ptr es:[di], word ptr [si]
1:0855  a5                movsw    word ptr es:[di], word ptr [si]
1:0856  a5                movsw    word ptr es:[di], word ptr [si]
1:0857  a5                movsw    word ptr es:[di], word ptr [si]
1:0858  b8000b            mov      ax, 0xb00
1:085B  8bf8              mov      di, ax
1:085D  be7007            mov      si, 0x770
1:0860  a5                movsw    word ptr es:[di], word ptr [si]
1:0861  a5                movsw    word ptr es:[di], word ptr [si]
1:0862  a5                movsw    word ptr es:[di], word ptr [si]
1:0863  a5                movsw    word ptr es:[di], word ptr [si]
1:0864  ff36d80d          push     word ptr [0xdd8]
1:0868  ff36d60d          push     word ptr [0xdd6]
1:086C  ff36d40d          push     word ptr [0xdd4]
1:0870  ff36d20d          push     word ptr [0xdd2]
1:0874  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:3DE4)
1:0879  83c408            add      sp, 8
1:087C  8bd8              mov      bx, ax
1:087E  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:087F  dd07              fld      qword ptr [bx]
1:0881  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0882  d9e0              fchs     
1:0884  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0885  dd1e180b          fstp     qword ptr [0xb18]
1:0889  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:088A  9b                wait     
1:088B  ff36d80d          push     word ptr [0xdd8]
1:088F  ff36d60d          push     word ptr [0xdd6]
1:0893  ff36d40d          push     word ptr [0xdd4]
1:0897  ff36d20d          push     word ptr [0xdd2]
1:089B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:3DEA)
1:08A0  83c408            add      sp, 8
1:08A3  ba300b            mov      dx, 0xb30
1:08A6  8bfa              mov      di, dx
1:08A8  8bf0              mov      si, ax
1:08AA  1e                push     ds
1:08AB  07                pop      es
1:08AC  a5                movsw    word ptr es:[di], word ptr [si]
1:08AD  a5                movsw    word ptr es:[di], word ptr [si]
1:08AE  a5                movsw    word ptr es:[di], word ptr [si]
1:08AF  a5                movsw    word ptr es:[di], word ptr [si]
1:08B0  ff36fc0d          push     word ptr [0xdfc]
1:08B4  ff36fa0d          push     word ptr [0xdfa]
1:08B8  a1380d            mov      ax, word ptr [0xd38]
1:08BB  99                cdq      
1:08BC  52                push     dx
1:08BD  50                push     ax
1:08BE  8bc8              mov      cx, ax
1:08C0  a13e0b            mov      ax, word ptr [0xb3e]
1:08C3  053200            add      ax, 0x32
1:08C6  8bda              mov      bx, dx
1:08C8  99                cdq      
1:08C9  52                push     dx
1:08CA  50                push     ax
1:08CB  8bf1              mov      si, cx
1:08CD  8bfb              mov      di, bx
1:08CF  9a42030000        lcall    0, 0x342  ; @1:INT:ord_5(1:3C56)
1:08D4  52                push     dx
1:08D5  50                push     ax
1:08D6  8946ea            mov      word ptr [bp - 0x16], ax
1:08D9  8956ec            mov      word ptr [bp - 0x14], dx
1:08DC  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:3BBC)
1:08E1  8956e8            mov      word ptr [bp - 0x18], dx
1:08E4  8946e6            mov      word ptr [bp - 0x1a], ax
1:08E7  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:08E8  db46e6            fild     dword ptr [bp - 0x1a]
1:08EB  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:08EC  dc0e8007          fmul     qword ptr [0x780]
1:08F0  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:08F1  dd56de            fst      qword ptr [bp - 0x22]
1:08F4  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:08F5  dd1e1c0e          fstp     qword ptr [0xe1c]
1:08F9  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:08FA  9b                wait     
1:08FB  b82c01            mov      ax, 0x12c
1:08FE  99                cdq      
1:08FF  52                push     dx
1:0900  50                push     ax
1:0901  57                push     di
1:0902  56                push     si
1:0903  b86400            mov      ax, 0x64
1:0906  2b063e0b          sub      ax, word ptr [0xb3e]
1:090A  99                cdq      
1:090B  52                push     dx
1:090C  50                push     ax
1:090D  9aec0b0000        lcall    0, 0xbec  ; @1:INT:ord_5(1:3C56)
1:0912  52                push     dx
1:0913  50                push     ax
1:0914  9add080000        lcall    0, 0x8dd  ; @1:INT:ord_8(1:3BBC)
1:0919  a3020d            mov      word ptr [0xd02], ax
1:091C  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:091D  dd46de            fld      qword ptr [bp - 0x22]
1:0920  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0921  dd16c40a          fst      qword ptr [0xac4]
1:0925  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0926  da0efa0d          fimul    dword ptr [0xdfa]
1:092A  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:092B  dc0e100b          fmul     qword ptr [0xb10]
1:092F  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0930  de2e400d          fisubr   word ptr [0xd40]
1:0934  a13e0b            mov      ax, word ptr [0xb3e]
1:0937  056400            add      ax, 0x64
1:093A  8946e6            mov      word ptr [bp - 0x1a], ax
1:093D  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:093E  de4ee6            fimul    word ptr [bp - 0x1a]
1:0941  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0942  dc0e7807          fmul     qword ptr [0x778]
1:0946  9acb0b0000        lcall    0, 0xbcb  ; @1:INT:ord_7(1:3E04)
1:094B  a31c0d            mov      word ptr [0xd1c], ax
1:094E  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:094F  db46ea            fild     dword ptr [bp - 0x16]
1:0952  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0953  dc0e8807          fmul     qword ptr [0x788]
1:0957  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0958  dd1ed00a          fstp     qword ptr [0xad0]
1:095C  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:095D  9b                wait     
1:095E  c7061e0d0000      mov      word ptr [0xd1e], 0
1:0964  2bc0              sub      ax, ax
1:0966  a3ee09            mov      word ptr [0x9ee], ax
1:0969  a3ec09            mov      word ptr [0x9ec], ax
1:096C  a3ea09            mov      word ptr [0x9ea], ax
1:096F  a3e809            mov      word ptr [0x9e8], ax
1:0972  e9e102            jmp      0xc56
1:0975  803ee20c00        cmp      byte ptr [0xce2], 0
1:097A  7503              jne      0x97f
1:097C  e9d702            jmp      0xc56
1:097F  c606180e01        mov      byte ptr [0xe18], 1
1:0984  c606cc0a00        mov      byte ptr [0xacc], 0
1:0989  a1ec09            mov      ax, word ptr [0x9ec]
1:098C  8b16ee09          mov      dx, word ptr [0x9ee]
1:0990  050100            add      ax, 1
1:0993  83d200            adc      dx, 0
1:0996  52                push     dx
1:0997  50                push     ax
1:0998  8b0ee809          mov      cx, word ptr [0x9e8]
1:099C  8b1eea09          mov      bx, word ptr [0x9ea]
1:09A0  83c101            add      cx, 1
1:09A3  83d300            adc      bx, 0
1:09A6  53                push     bx
1:09A7  51                push     cx
1:09A8  52                push     dx
1:09A9  50                push     ax
1:09AA  ff36ea09          push     word ptr [0x9ea]
1:09AE  ff36e809          push     word ptr [0x9e8]
1:09B2  ff36ee09          push     word ptr [0x9ee]
1:09B6  ff36ec09          push     word ptr [0x9ec]
1:09BA  ff36ea09          push     word ptr [0x9ea]
1:09BE  ff36e809          push     word ptr [0x9e8]
1:09C2  0e                push     cs
1:09C3  e8cc23            call     0x2d92
1:09C6  83c418            add      sp, 0x18
1:09C9  ff36ee09          push     word ptr [0x9ee]
1:09CD  ff36ec09          push     word ptr [0x9ec]
1:09D1  a1e809            mov      ax, word ptr [0x9e8]
1:09D4  8b16ea09          mov      dx, word ptr [0x9ea]
1:09D8  050100            add      ax, 1
1:09DB  83d200            adc      dx, 0
1:09DE  52                push     dx
1:09DF  50                push     ax
1:09E0  8b0eec09          mov      cx, word ptr [0x9ec]
1:09E4  8b1eee09          mov      bx, word ptr [0x9ee]
1:09E8  83c101            add      cx, 1
1:09EB  83d300            adc      bx, 0
1:09EE  53                push     bx
1:09EF  51                push     cx
1:09F0  52                push     dx
1:09F1  50                push     ax
1:09F2  ff36ee09          push     word ptr [0x9ee]
1:09F6  ff36ec09          push     word ptr [0x9ec]
1:09FA  ff36ea09          push     word ptr [0x9ea]
1:09FE  ff36e809          push     word ptr [0x9e8]
1:0A02  0e                push     cs
1:0A03  e88c23            call     0x2d92
1:0A06  83c418            add      sp, 0x18
1:0A09  a1dc0a            mov      ax, word ptr [0xadc]
1:0A0C  8b16de0a          mov      dx, word ptr [0xade]
1:0A10  2d0100            sub      ax, 1
1:0A13  83da00            sbb      dx, 0
1:0A16  8306e80901        add      word ptr [0x9e8], 1
1:0A1B  8316ea0900        adc      word ptr [0x9ea], 0
1:0A20  3b16ea09          cmp      dx, word ptr [0x9ea]
1:0A24  7f3b              jg       0xa61
1:0A26  7c06              jl       0xa2e
1:0A28  3b06e809          cmp      ax, word ptr [0x9e8]
1:0A2C  7733              ja       0xa61
1:0A2E  2bc9              sub      cx, cx
1:0A30  890eea09          mov      word ptr [0x9ea], cx
1:0A34  890ee809          mov      word ptr [0x9e8], cx
1:0A38  8306ec0901        add      word ptr [0x9ec], 1
1:0A3D  8316ee0900        adc      word ptr [0x9ee], 0
1:0A42  3b16ee09          cmp      dx, word ptr [0x9ee]
1:0A46  7f19              jg       0xa61
1:0A48  7c06              jl       0xa50
1:0A4A  3b06ec09          cmp      ax, word ptr [0x9ec]
1:0A4E  7711              ja       0xa61
1:0A50  2bc0              sub      ax, ax
1:0A52  a3ee09            mov      word ptr [0x9ee], ax
1:0A55  a3ec09            mov      word ptr [0x9ec], ax
1:0A58  a3ea09            mov      word ptr [0x9ea], ax
1:0A5B  a3e809            mov      word ptr [0x9e8], ax
1:0A5E  e9fc00            jmp      0xb5d
1:0A61  9a520b0000        lcall    0, 0xb52  ; @1:USER.GetCurrentTime
1:0A66  3b16e00d          cmp      dx, word ptr [0xde0]
1:0A6A  7303              jae      0xa6f
1:0A6C  e91aff            jmp      0x989
1:0A6F  7603              jbe      0xa74
1:0A71  e994fc            jmp      0x708
1:0A74  3b06de0d          cmp      ax, word ptr [0xdde]
1:0A78  7303              jae      0xa7d
1:0A7A  e90cff            jmp      0x989
1:0A7D  e988fc            jmp      0x708
1:0A80  c606180e00        mov      byte ptr [0xe18], 0
1:0A85  c606cc0a01        mov      byte ptr [0xacc], 1
1:0A8A  a1ec09            mov      ax, word ptr [0x9ec]
1:0A8D  8b16ee09          mov      dx, word ptr [0x9ee]
1:0A91  050100            add      ax, 1
1:0A94  83d200            adc      dx, 0
1:0A97  52                push     dx
1:0A98  50                push     ax
1:0A99  8b0ee809          mov      cx, word ptr [0x9e8]
1:0A9D  8b1eea09          mov      bx, word ptr [0x9ea]
1:0AA1  83c101            add      cx, 1
1:0AA4  83d300            adc      bx, 0
1:0AA7  53                push     bx
1:0AA8  51                push     cx
1:0AA9  52                push     dx
1:0AAA  50                push     ax
1:0AAB  ff36ea09          push     word ptr [0x9ea]
1:0AAF  ff36e809          push     word ptr [0x9e8]
1:0AB3  ff36ee09          push     word ptr [0x9ee]
1:0AB7  ff36ec09          push     word ptr [0x9ec]
1:0ABB  ff36ea09          push     word ptr [0x9ea]
1:0ABF  ff36e809          push     word ptr [0x9e8]
1:0AC3  0e                push     cs
1:0AC4  e8cb22            call     0x2d92
1:0AC7  83c418            add      sp, 0x18
1:0ACA  ff36ee09          push     word ptr [0x9ee]
1:0ACE  ff36ec09          push     word ptr [0x9ec]
1:0AD2  a1e809            mov      ax, word ptr [0x9e8]
1:0AD5  8b16ea09          mov      dx, word ptr [0x9ea]
1:0AD9  050100            add      ax, 1
1:0ADC  83d200            adc      dx, 0
1:0ADF  52                push     dx
1:0AE0  50                push     ax
1:0AE1  8b0eec09          mov      cx, word ptr [0x9ec]
1:0AE5  8b1eee09          mov      bx, word ptr [0x9ee]
1:0AE9  83c101            add      cx, 1
1:0AEC  83d300            adc      bx, 0
1:0AEF  53                push     bx
1:0AF0  51                push     cx
1:0AF1  52                push     dx
1:0AF2  50                push     ax
1:0AF3  ff36ee09          push     word ptr [0x9ee]
1:0AF7  ff36ec09          push     word ptr [0x9ec]
1:0AFB  ff36ea09          push     word ptr [0x9ea]
1:0AFF  ff36e809          push     word ptr [0x9e8]
1:0B03  0e                push     cs
1:0B04  e88b22            call     0x2d92
1:0B07  83c418            add      sp, 0x18
1:0B0A  a1dc0a            mov      ax, word ptr [0xadc]
1:0B0D  8b16de0a          mov      dx, word ptr [0xade]
1:0B11  2d0100            sub      ax, 1
1:0B14  83da00            sbb      dx, 0
1:0B17  8306e80901        add      word ptr [0x9e8], 1
1:0B1C  8316ea0900        adc      word ptr [0x9ea], 0
1:0B21  3b16ea09          cmp      dx, word ptr [0x9ea]
1:0B25  7f3d              jg       0xb64
1:0B27  7c06              jl       0xb2f
1:0B29  3b06e809          cmp      ax, word ptr [0x9e8]
1:0B2D  7735              ja       0xb64
1:0B2F  2bc9              sub      cx, cx
1:0B31  890eea09          mov      word ptr [0x9ea], cx
1:0B35  890ee809          mov      word ptr [0x9e8], cx
1:0B39  8306ec0901        add      word ptr [0x9ec], 1
1:0B3E  8316ee0900        adc      word ptr [0x9ee], 0
1:0B43  3b16ee09          cmp      dx, word ptr [0x9ee]
1:0B47  7f1b              jg       0xb64
1:0B49  7c06              jl       0xb51
1:0B4B  3b06ec09          cmp      ax, word ptr [0x9ec]
1:0B4F  7713              ja       0xb64
1:0B51  9a650b0000        lcall    0, 0xb65  ; @1:USER.GetCurrentTime
1:0B56  a3de0c            mov      word ptr [0xcde], ax
1:0B59  8916e00c          mov      word ptr [0xce0], dx
1:0B5D  ff06420d          inc      word ptr [0xd42]
1:0B61  e9a4fb            jmp      0x708
1:0B64  9a840b0000        lcall    0, 0xb84  ; @1:USER.GetCurrentTime
1:0B69  3b16e00d          cmp      dx, word ptr [0xde0]
1:0B6D  7303              jae      0xb72
1:0B6F  e918ff            jmp      0xa8a
1:0B72  7603              jbe      0xb77
1:0B74  e991fb            jmp      0x708
1:0B77  3b06de0d          cmp      ax, word ptr [0xdde]
1:0B7B  7303              jae      0xb80
1:0B7D  e90aff            jmp      0xa8a
1:0B80  e985fb            jmp      0x708
1:0B83  9ad60b0000        lcall    0, 0xbd6  ; @1:USER.GetCurrentTime
1:0B88  056400            add      ax, 0x64
1:0B8B  83d200            adc      dx, 0
1:0B8E  a3ce0d            mov      word ptr [0xdce], ax
1:0B91  8916d00d          mov      word ptr [0xdd0], dx
1:0B95  e9be00            jmp      0xc56
1:0B98  ff369607          push     word ptr [0x796]
1:0B9C  ff369407          push     word ptr [0x794]
1:0BA0  ff369207          push     word ptr [0x792]
1:0BA4  ff369007          push     word ptr [0x790]
1:0BA8  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0BA9  db06d80a          fild     dword ptr [0xad8]
1:0BAD  83ec08            sub      sp, 8
1:0BB0  8bdc              mov      bx, sp
1:0BB2  9b                wait       ; @0:OSFIXUP:FISRQQ/FJSRQQ (add,t=5)
1:0BB3  36dd1f            fstp     qword ptr ss:[bx]
1:0BB6  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:0BB7  9b                wait     
1:0BB8  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_18(1:3DB8)
1:0BBD  83c410            add      sp, 0x10
1:0BC0  8bd8              mov      bx, ax
1:0BC2  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0BC3  dd07              fld      qword ptr [bx]
1:0BC5  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0BC6  dc0e9807          fmul     qword ptr [0x798]
1:0BCA  9ae9020000        lcall    0, 0x2e9  ; @1:INT:ord_7(1:3E04)
1:0BCF  8946f8            mov      word ptr [bp - 8], ax
1:0BD2  8956fa            mov      word ptr [bp - 6], dx
1:0BD5  9a3e050000        lcall    0, 0x53e  ; @1:USER.GetCurrentTime
1:0BDA  b9e803            mov      cx, 0x3e8
1:0BDD  2bdb              sub      bx, bx
1:0BDF  53                push     bx
1:0BE0  51                push     cx
1:0BE1  ff76fa            push     word ptr [bp - 6]
1:0BE4  ff76f8            push     word ptr [bp - 8]
1:0BE7  8bf0              mov      si, ax
1:0BE9  8bfa              mov      di, dx
1:0BEB  9ad8060000        lcall    0, 0x6d8  ; @1:INT:ord_5(1:3C56)
1:0BF0  0306de0c          add      ax, word ptr [0xcde]
1:0BF4  1316e00c          adc      dx, word ptr [0xce0]
1:0BF8  3bd7              cmp      dx, di
1:0BFA  720a              jb       0xc06
1:0BFC  7704              ja       0xc02
1:0BFE  3bc6              cmp      ax, si
1:0C00  7604              jbe      0xc06
1:0C02  ff0e420d          dec      word ptr [0xd42]
1:0C06  c41ed60c          les      bx, ptr [0xcd6]
1:0C0A  26837f0a08        cmp      word ptr es:[bx + 0xa], 8
1:0C0F  7545              jne      0xc56
1:0C11  833e380b01        cmp      word ptr [0xb38], 1
1:0C16  753e              jne      0xc56
1:0C18  0e                push     cs
1:0C19  e862f8            call     0x47e
1:0C1C  eb38              jmp      0xc56
1:0C1E  c606da0c00        mov      byte ptr [0xcda], 0
1:0C23  c706420dffff      mov      word ptr [0xd42], 0xffff
1:0C29  eb2b              jmp      0xc56
1:0C2B  3d0e00            cmp      ax, 0xe
1:0C2E  7726              ja       0xc56
1:0C30  d1e0              shl      ax, 1
1:0C32  93                xchg     bx, ax
1:0C33  2effa7380c        jmp      word ptr cs:[bx + 0xc38]
1:0C38  7c06              jl       0xc40
1:0C3A  9a06a106c1        lcall    0xc106, 0xa106
1:0C3F  06                push     es
1:0C40  0f07              sysret   
1:0C42  2f                das      
1:0C43  07                pop      es
1:0C44  7507              jne      0xc4d
1:0C46  8807              mov      byte ptr [bx], al
1:0C48  96                xchg     si, ax
1:0C49  07                pop      es
1:0C4A  c407              les      ax, ptr [bx]
1:0C4C  7509              jne      0xc57
1:0C4E  800a83            or       byte ptr [bp + si], 0x83
1:0C51  0b980b1e          or       bx, word ptr [bx + si + 0x1e0b]
1:0C55  0cff              or       al, 0xff
1:0C57  06                push     es
1:0C58  42                inc      dx
1:0C59  0de996            or       ax, 0x96e9
1:0C5C  f9                stc      
1:0C5D  5e                pop      si
1:0C5E  5f                pop      di
1:0C5F  4d                dec      bp
1:0C60  4d                dec      bp
1:0C61  8be5              mov      sp, bp
1:0C63  1f                pop      ds
1:0C64  5d                pop      bp
1:0C65  4d                dec      bp
1:0C66  cb                retf     

; ===== EXPORT:ord_31(#31) =====
1:0C67  1e                push     ds
1:0C68  58                pop      ax
1:0C69  90                nop      
1:0C6A  45                inc      bp
1:0C6B  55                push     bp
1:0C6C  8bec              mov      bp, sp
1:0C6E  1e                push     ds
1:0C6F  8ed8              mov      ds, ax
1:0C71  2bc0              sub      ax, ax
1:0C73  4d                dec      bp
1:0C74  4d                dec      bp
1:0C75  8be5              mov      sp, bp
1:0C77  1f                pop      ds
1:0C78  5d                pop      bp
1:0C79  4d                dec      bp
1:0C7A  cb                retf     

; ===== EXPORT:ord_32(#32) =====
1:0C7B  1e                push     ds
1:0C7C  58                pop      ax
1:0C7D  90                nop      
1:0C7E  45                inc      bp
1:0C7F  55                push     bp
1:0C80  8bec              mov      bp, sp
1:0C82  1e                push     ds
1:0C83  8ed8              mov      ds, ax
1:0C85  2bc0              sub      ax, ax
1:0C87  4d                dec      bp
1:0C88  4d                dec      bp
1:0C89  8be5              mov      sp, bp
1:0C8B  1f                pop      ds
1:0C8C  5d                pop      bp
1:0C8D  4d                dec      bp
1:0C8E  cb                retf     

; ===== EXPORT:ord_33(#33) =====
1:0C8F  1e                push     ds
1:0C90  58                pop      ax
1:0C91  90                nop      
1:0C92  45                inc      bp
1:0C93  55                push     bp
1:0C94  8bec              mov      bp, sp
1:0C96  1e                push     ds
1:0C97  8ed8              mov      ds, ax
1:0C99  c41ed60c          les      bx, ptr [0xcd6]
1:0C9D  26837f0a01        cmp      word ptr es:[bx + 0xa], 1
1:0CA2  750a              jne      0xcae
1:0CA4  c41eda0d          les      bx, ptr [0xdda]
1:0CA8  26c7470e0000      mov      word ptr es:[bx + 0xe], 0
1:0CAE  2bc0              sub      ax, ax
1:0CB0  4d                dec      bp
1:0CB1  4d                dec      bp
1:0CB2  8be5              mov      sp, bp
1:0CB4  1f                pop      ds
1:0CB5  5d                pop      bp
1:0CB6  4d                dec      bp
1:0CB7  cb                retf     
1:0CB8  1e                push     ds
1:0CB9  58                pop      ax
1:0CBA  90                nop      
1:0CBB  45                inc      bp
1:0CBC  55                push     bp
1:0CBD  8bec              mov      bp, sp
1:0CBF  1e                push     ds
1:0CC0  8ed8              mov      ds, ax
1:0CC2  83ec18            sub      sp, 0x18
1:0CC5  57                push     di
1:0CC6  56                push     si
1:0CC7  c41eda0d          les      bx, ptr [0xdda]
1:0CCB  268b471a          mov      ax, word ptr es:[bx + 0x1a]
1:0CCF  268b571c          mov      dx, word ptr es:[bx + 0x1c]
1:0CD3  050400            add      ax, 4
1:0CD6  a3080a            mov      word ptr [0xa08], ax
1:0CD9  89160a0a          mov      word ptr [0xa0a], dx
1:0CDD  b81200            mov      ax, 0x12
1:0CE0  f72edc0c          imul     word ptr [0xcdc]
1:0CE4  8bd8              mov      bx, ax
1:0CE6  8a87e500          mov      al, byte ptr [bx + 0xe5]
1:0CEA  c41e080a          les      bx, ptr [0xa08]
1:0CEE  268807            mov      byte ptr es:[bx], al
1:0CF1  b81200            mov      ax, 0x12
1:0CF4  f72edc0c          imul     word ptr [0xcdc]
1:0CF8  8bd8              mov      bx, ax
1:0CFA  8a87e700          mov      al, byte ptr [bx + 0xe7]
1:0CFE  c41e080a          les      bx, ptr [0xa08]
1:0D02  26884701          mov      byte ptr es:[bx + 1], al
1:0D06  b81200            mov      ax, 0x12
1:0D09  f72edc0c          imul     word ptr [0xcdc]
1:0D0D  8bd8              mov      bx, ax
1:0D0F  8a87e900          mov      al, byte ptr [bx + 0xe9]
1:0D13  c41e080a          les      bx, ptr [0xa08]
1:0D17  26884702          mov      byte ptr es:[bx + 2], al
1:0D1B  b81200            mov      ax, 0x12
1:0D1E  f72edc0c          imul     word ptr [0xcdc]
1:0D22  8bd8              mov      bx, ax
1:0D24  8a87eb00          mov      al, byte ptr [bx + 0xeb]
1:0D28  c41e080a          les      bx, ptr [0xa08]
1:0D2C  26884704          mov      byte ptr es:[bx + 4], al
1:0D30  b81200            mov      ax, 0x12
1:0D33  f72edc0c          imul     word ptr [0xcdc]
1:0D37  8bd8              mov      bx, ax
1:0D39  8a87ed00          mov      al, byte ptr [bx + 0xed]
1:0D3D  c41e080a          les      bx, ptr [0xa08]
1:0D41  26884705          mov      byte ptr es:[bx + 5], al
1:0D45  b81200            mov      ax, 0x12
1:0D48  f72edc0c          imul     word ptr [0xcdc]
1:0D4C  8bd8              mov      bx, ax
1:0D4E  8a87ef00          mov      al, byte ptr [bx + 0xef]
1:0D52  c41e080a          les      bx, ptr [0xa08]
1:0D56  26884706          mov      byte ptr es:[bx + 6], al
1:0D5A  b81200            mov      ax, 0x12
1:0D5D  f72edc0c          imul     word ptr [0xcdc]
1:0D61  8bd8              mov      bx, ax
1:0D63  8a87f100          mov      al, byte ptr [bx + 0xf1]
1:0D67  c41e080a          les      bx, ptr [0xa08]
1:0D6B  26884708          mov      byte ptr es:[bx + 8], al
1:0D6F  b81200            mov      ax, 0x12
1:0D72  f72edc0c          imul     word ptr [0xcdc]
1:0D76  8bd8              mov      bx, ax
1:0D78  8a87f300          mov      al, byte ptr [bx + 0xf3]
1:0D7C  c41e080a          les      bx, ptr [0xa08]
1:0D80  26884709          mov      byte ptr es:[bx + 9], al
1:0D84  b81200            mov      ax, 0x12
1:0D87  f72edc0c          imul     word ptr [0xcdc]
1:0D8B  8bd8              mov      bx, ax
1:0D8D  8a87f500          mov      al, byte ptr [bx + 0xf5]
1:0D91  c41e080a          les      bx, ptr [0xa08]
1:0D95  2688470a          mov      byte ptr es:[bx + 0xa], al
1:0D99  b84200            mov      ax, 0x42
1:0D9C  50                push     ax
1:0D9D  b80010            mov      ax, 0x1000
1:0DA0  50                push     ax
1:0DA1  9a6e030000        lcall    0, 0x36e  ; @1:KERNEL.LocalAlloc
1:0DA6  a3440d            mov      word ptr [0xd44], ax
1:0DA9  0bc0              or       ax, ax
1:0DAB  740e              je       0xdbb
1:0DAD  50                push     ax
1:0DAE  9a7b030000        lcall    0, 0x37b  ; @1:KERNEL.LocalLock
1:0DB3  a34e0d            mov      word ptr [0xd4e], ax
1:0DB6  8946f2            mov      word ptr [bp - 0xe], ax
1:0DB9  eb05              jmp      0xdc0
1:0DBB  c746f20000        mov      word ptr [bp - 0xe], 0
1:0DC0  837ef200          cmp      word ptr [bp - 0xe], 0
1:0DC4  7403              je       0xdc9
1:0DC6  e9b200            jmp      0xe7b
1:0DC9  2bff              sub      di, di
1:0DCB  e9a000            jmp      0xe6e
1:0DCE  46                inc      si
1:0DCF  83fe10            cmp      si, 0x10
1:0DD2  7c03              jl       0xdd7
1:0DD4  e99600            jmp      0xe6d
1:0DD7  b8fc09            mov      ax, 0x9fc
1:0DDA  50                push     ax
1:0DDB  8976ec            mov      word ptr [bp - 0x14], si
1:0DDE  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0DDF  df46ec            fild     word ptr [bp - 0x14]
1:0DE2  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0DE3  dc0ea007          fmul     qword ptr [0x7a0]
1:0DE7  83ec08            sub      sp, 8
1:0DEA  8bdc              mov      bx, sp
1:0DEC  9b                wait       ; @0:OSFIXUP:FISRQQ/FJSRQQ (add,t=5)
1:0DED  36dd1f            fstp     qword ptr ss:[bx]
1:0DF0  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:0DF1  9b                wait     
1:0DF2  b90e00            mov      cx, 0xe
1:0DF5  2bd2              sub      dx, dx
1:0DF7  52                push     dx
1:0DF8  51                push     cx
1:0DF9  ff36600d          push     word ptr [0xd60]
1:0DFD  ff365e0d          push     word ptr [0xd5e]
1:0E01  8bc7              mov      ax, di
1:0E03  99                cdq      
1:0E04  52                push     dx
1:0E05  50                push     ax
1:0E06  9ae40e0000        lcall    0, 0xee4  ; @1:INT:ord_5(1:3C56)
1:0E0B  52                push     dx
1:0E0C  50                push     ax
1:0E0D  9aeb0e0000        lcall    0, 0xeeb  ; @1:INT:ord_8(1:3BBC)
1:0E12  52                push     dx
1:0E13  50                push     ax
1:0E14  0e                push     cs
1:0E15  e89112            call     0x20a9
1:0E18  83c40e            add      sp, 0xe
1:0E1B  b8fc09            mov      ax, 0x9fc
1:0E1E  50                push     ax
1:0E1F  50                push     ax
1:0E20  0e                push     cs
1:0E21  e8eef1            call     0x12
1:0E24  5b                pop      bx
1:0E25  5b                pop      bx
1:0E26  b108              mov      cl, 8
1:0E28  a0fc09            mov      al, byte ptr [0x9fc]
1:0E2B  d2e8              shr      al, cl
1:0E2D  b104              mov      cl, 4
1:0E2F  8bdf              mov      bx, di
1:0E31  d3e3              shl      bx, cl
1:0E33  03de              add      bx, si
1:0E35  d1e3              shl      bx, 1
1:0E37  d1e3              shl      bx, 1
1:0E39  8bcb              mov      cx, bx
1:0E3B  031e080a          add      bx, word ptr [0xa08]
1:0E3F  8e060a0a          mov      es, word ptr [0xa0a]
1:0E43  2688470c          mov      byte ptr es:[bx + 0xc], al
1:0E47  8bc1              mov      ax, cx
1:0E49  c41e080a          les      bx, ptr [0xa08]
1:0E4D  03d8              add      bx, ax
1:0E4F  b108              mov      cl, 8
1:0E51  8a16fe09          mov      dl, byte ptr [0x9fe]
1:0E55  d2ea              shr      dl, cl
1:0E57  2688570d          mov      byte ptr es:[bx + 0xd], dl
1:0E5B  c41e080a          les      bx, ptr [0xa08]
1:0E5F  03d8              add      bx, ax
1:0E61  a0000a            mov      al, byte ptr [0xa00]
1:0E64  d2e8              shr      al, cl
1:0E66  2688470e          mov      byte ptr es:[bx + 0xe], al
1:0E6A  e961ff            jmp      0xdce
1:0E6D  47                inc      di
1:0E6E  83ff0e            cmp      di, 0xe
1:0E71  7c03              jl       0xe76
1:0E73  e91303            jmp      0x1189
1:0E76  2bf6              sub      si, si
1:0E78  e954ff            jmp      0xdcf
1:0E7B  8b5ef2            mov      bx, word ptr [bp - 0xe]
1:0E7E  2bc0              sub      ax, ax
1:0E80  894702            mov      word ptr [bx + 2], ax
1:0E83  8907              mov      word ptr [bx], ax
1:0E85  8946f0            mov      word ptr [bp - 0x10], ax
1:0E88  8946ee            mov      word ptr [bp - 0x12], ax
1:0E8B  b8f009            mov      ax, 0x9f0
1:0E8E  50                push     ax
1:0E8F  ff366e07          push     word ptr [0x76e]
1:0E93  ff366c07          push     word ptr [0x76c]
1:0E97  ff366a07          push     word ptr [0x76a]
1:0E9B  ff366807          push     word ptr [0x768]
1:0E9F  2bc9              sub      cx, cx
1:0EA1  51                push     cx
1:0EA2  51                push     cx
1:0EA3  0e                push     cs
1:0EA4  e80212            call     0x20a9
1:0EA7  83c40e            add      sp, 0xe
1:0EAA  b8f009            mov      ax, 0x9f0
1:0EAD  50                push     ax
1:0EAE  50                push     ax
1:0EAF  0e                push     cs
1:0EB0  e85ff1            call     0x12
1:0EB3  5b                pop      bx
1:0EB4  5b                pop      bx
1:0EB5  c746f40100        mov      word ptr [bp - 0xc], 1
1:0EBA  b8f609            mov      ax, 0x9f6
1:0EBD  50                push     ax
1:0EBE  ff366e07          push     word ptr [0x76e]
1:0EC2  ff366c07          push     word ptr [0x76c]
1:0EC6  ff366a07          push     word ptr [0x76a]
1:0ECA  ff366807          push     word ptr [0x768]
1:0ECE  b9ff03            mov      cx, 0x3ff
1:0ED1  2bd2              sub      dx, dx
1:0ED3  52                push     dx
1:0ED4  51                push     cx
1:0ED5  ff36600d          push     word ptr [0xd60]
1:0ED9  ff365e0d          push     word ptr [0xd5e]
1:0EDD  8b46f4            mov      ax, word ptr [bp - 0xc]
1:0EE0  99                cdq      
1:0EE1  52                push     dx
1:0EE2  50                push     ax
1:0EE3  9a67100000        lcall    0, 0x1067  ; @1:INT:ord_5(1:3C56)
1:0EE8  52                push     dx
1:0EE9  50                push     ax
1:0EEA  9a12100000        lcall    0, 0x1012  ; @1:INT:ord_8(1:3BBC)
1:0EEF  52                push     dx
1:0EF0  50                push     ax
1:0EF1  0e                push     cs
1:0EF2  e8b411            call     0x20a9
1:0EF5  83c40e            add      sp, 0xe
1:0EF8  b8f609            mov      ax, 0x9f6
1:0EFB  50                push     ax
1:0EFC  50                push     ax
1:0EFD  0e                push     cs
1:0EFE  e811f1            call     0x12
1:0F01  5b                pop      bx
1:0F02  5b                pop      bx
1:0F03  a1f609            mov      ax, word ptr [0x9f6]
1:0F06  2bd2              sub      dx, dx
1:0F08  2b06f009          sub      ax, word ptr [0x9f0]
1:0F0C  1bd2              sbb      dx, dx
1:0F0E  7907              jns      0xf17
1:0F10  f7d8              neg      ax
1:0F12  83d200            adc      dx, 0
1:0F15  f7da              neg      dx
1:0F17  8bc8              mov      cx, ax
1:0F19  a1fa09            mov      ax, word ptr [0x9fa]
1:0F1C  8bda              mov      bx, dx
1:0F1E  2bd2              sub      dx, dx
1:0F20  2b06f409          sub      ax, word ptr [0x9f4]
1:0F24  1bd2              sbb      dx, dx
1:0F26  7907              jns      0xf2f
1:0F28  f7d8              neg      ax
1:0F2A  83d200            adc      dx, 0
1:0F2D  f7da              neg      dx
1:0F2F  8946e8            mov      word ptr [bp - 0x18], ax
1:0F32  8956ea            mov      word ptr [bp - 0x16], dx
1:0F35  a1f809            mov      ax, word ptr [0x9f8]
1:0F38  2bd2              sub      dx, dx
1:0F3A  2b06f209          sub      ax, word ptr [0x9f2]
1:0F3E  1bd2              sbb      dx, dx
1:0F40  7907              jns      0xf49
1:0F42  f7d8              neg      ax
1:0F44  83d200            adc      dx, 0
1:0F47  f7da              neg      dx
1:0F49  0346e8            add      ax, word ptr [bp - 0x18]
1:0F4C  1356ea            adc      dx, word ptr [bp - 0x16]
1:0F4F  03c8              add      cx, ax
1:0F51  13da              adc      bx, dx
1:0F53  8bc3              mov      ax, bx
1:0F55  8b5ef4            mov      bx, word ptr [bp - 0xc]
1:0F58  d1e3              shl      bx, 1
1:0F5A  d1e3              shl      bx, 1
1:0F5C  035ef2            add      bx, word ptr [bp - 0xe]
1:0F5F  890f              mov      word ptr [bx], cx
1:0F61  894702            mov      word ptr [bx + 2], ax
1:0F64  014eee            add      word ptr [bp - 0x12], cx
1:0F67  1146f0            adc      word ptr [bp - 0x10], ax
1:0F6A  b8f009            mov      ax, 0x9f0
1:0F6D  56                push     si
1:0F6E  57                push     di
1:0F6F  8bf8              mov      di, ax
1:0F71  bef609            mov      si, 0x9f6
1:0F74  1e                push     ds
1:0F75  07                pop      es
1:0F76  a5                movsw    word ptr es:[di], word ptr [si]
1:0F77  a5                movsw    word ptr es:[di], word ptr [si]
1:0F78  a5                movsw    word ptr es:[di], word ptr [si]
1:0F79  5f                pop      di
1:0F7A  5e                pop      si
1:0F7B  ff46f4            inc      word ptr [bp - 0xc]
1:0F7E  817ef40004        cmp      word ptr [bp - 0xc], 0x400
1:0F83  7d03              jge      0xf88
1:0F85  e932ff            jmp      0xeba
1:0F88  2bf6              sub      si, si
1:0F8A  b8fc09            mov      ax, 0x9fc
1:0F8D  50                push     ax
1:0F8E  8976e8            mov      word ptr [bp - 0x18], si
1:0F91  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0F92  df46e8            fild     word ptr [bp - 0x18]
1:0F95  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0F96  dc0ea007          fmul     qword ptr [0x7a0]
1:0F9A  83ec08            sub      sp, 8
1:0F9D  8bdc              mov      bx, sp
1:0F9F  9b                wait       ; @0:OSFIXUP:FISRQQ/FJSRQQ (add,t=5)
1:0FA0  36dd1f            fstp     qword ptr ss:[bx]
1:0FA3  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:0FA4  9b                wait     
1:0FA5  2bc9              sub      cx, cx
1:0FA7  51                push     cx
1:0FA8  51                push     cx
1:0FA9  0e                push     cs
1:0FAA  e8fc10            call     0x20a9
1:0FAD  83c40e            add      sp, 0xe
1:0FB0  b8fc09            mov      ax, 0x9fc
1:0FB3  50                push     ax
1:0FB4  50                push     ax
1:0FB5  0e                push     cs
1:0FB6  e859f0            call     0x12
1:0FB9  5b                pop      bx
1:0FBA  5b                pop      bx
1:0FBB  a0fd09            mov      al, byte ptr [0x9fd]
1:0FBE  8bde              mov      bx, si
1:0FC0  d1e3              shl      bx, 1
1:0FC2  d1e3              shl      bx, 1
1:0FC4  8bcb              mov      cx, bx
1:0FC6  031e080a          add      bx, word ptr [0xa08]
1:0FCA  8e060a0a          mov      es, word ptr [0xa0a]
1:0FCE  2688470c          mov      byte ptr es:[bx + 0xc], al
1:0FD2  c41e080a          les      bx, ptr [0xa08]
1:0FD6  03d9              add      bx, cx
1:0FD8  a0ff09            mov      al, byte ptr [0x9ff]
1:0FDB  2688470d          mov      byte ptr es:[bx + 0xd], al
1:0FDF  a0010a            mov      al, byte ptr [0xa01]
1:0FE2  c41e080a          les      bx, ptr [0xa08]
1:0FE6  03d9              add      bx, cx
1:0FE8  2688470e          mov      byte ptr es:[bx + 0xe], al
1:0FEC  46                inc      si
1:0FED  83fe10            cmp      si, 0x10
1:0FF0  7c98              jl       0xf8a
1:0FF2  bf0100            mov      di, 1
1:0FF5  2bc0              sub      ax, ax
1:0FF7  8946fc            mov      word ptr [bp - 4], ax
1:0FFA  8946fa            mov      word ptr [bp - 6], ax
1:0FFD  b80d00            mov      ax, 0xd
1:1000  99                cdq      
1:1001  52                push     dx
1:1002  50                push     ax
1:1003  8b46ee            mov      ax, word ptr [bp - 0x12]
1:1006  8b56f0            mov      dx, word ptr [bp - 0x10]
1:1009  050c00            add      ax, 0xc
1:100C  83d200            adc      dx, 0
1:100F  52                push     dx
1:1010  50                push     ax
1:1011  9a15090000        lcall    0, 0x915  ; @1:INT:ord_8(1:3BBC)
1:1016  8946f6            mov      word ptr [bp - 0xa], ax
1:1019  8956f8            mov      word ptr [bp - 8], dx
1:101C  0bd2              or       dx, dx
1:101E  7d03              jge      0x1023
1:1020  e9ec00            jmp      0x110f
1:1023  7f07              jg       0x102c
1:1025  0bc0              or       ax, ax
1:1027  7503              jne      0x102c
1:1029  e9e300            jmp      0x110f
1:102C  c746f40100        mov      word ptr [bp - 0xc], 1
1:1031  e9a200            jmp      0x10d6
1:1034  2bf6              sub      si, si
1:1036  b8fc09            mov      ax, 0x9fc
1:1039  50                push     ax
1:103A  8976e8            mov      word ptr [bp - 0x18], si
1:103D  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:103E  df46e8            fild     word ptr [bp - 0x18]
1:1041  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:1042  dc0ea007          fmul     qword ptr [0x7a0]
1:1046  83ec08            sub      sp, 8
1:1049  8bdc              mov      bx, sp
1:104B  9b                wait       ; @0:OSFIXUP:FISRQQ/FJSRQQ (add,t=5)
1:104C  36dd1f            fstp     qword ptr ss:[bx]
1:104F  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:1050  9b                wait     
1:1051  b9ff03            mov      cx, 0x3ff
1:1054  2bd2              sub      dx, dx
1:1056  52                push     dx
1:1057  51                push     cx
1:1058  ff36600d          push     word ptr [0xd60]
1:105C  ff365e0d          push     word ptr [0xd5e]
1:1060  8b46f4            mov      ax, word ptr [bp - 0xc]
1:1063  99                cdq      
1:1064  52                push     dx
1:1065  50                push     ax
1:1066  9a0e090000        lcall    0, 0x90e  ; @1:INT:ord_5(1:3C56)
1:106B  52                push     dx
1:106C  50                push     ax
1:106D  9a0e0e0000        lcall    0, 0xe0e  ; @1:INT:ord_8(1:3BBC)
1:1072  52                push     dx
1:1073  50                push     ax
1:1074  0e                push     cs
1:1075  e83110            call     0x20a9
1:1078  83c40e            add      sp, 0xe
1:107B  b8fc09            mov      ax, 0x9fc
1:107E  50                push     ax
1:107F  50                push     ax
1:1080  0e                push     cs
1:1081  e88eef            call     0x12
1:1084  5b                pop      bx
1:1085  5b                pop      bx
1:1086  a0fd09            mov      al, byte ptr [0x9fd]
1:1089  b104              mov      cl, 4
1:108B  8bdf              mov      bx, di
1:108D  d3e3              shl      bx, cl
1:108F  03de              add      bx, si
1:1091  d1e3              shl      bx, 1
1:1093  d1e3              shl      bx, 1
1:1095  8bcb              mov      cx, bx
1:1097  031e080a          add      bx, word ptr [0xa08]
1:109B  8e060a0a          mov      es, word ptr [0xa0a]
1:109F  2688470c          mov      byte ptr es:[bx + 0xc], al
1:10A3  c41e080a          les      bx, ptr [0xa08]
1:10A7  03d9              add      bx, cx
1:10A9  a0ff09            mov      al, byte ptr [0x9ff]
1:10AC  2688470d          mov      byte ptr es:[bx + 0xd], al
1:10B0  a0010a            mov      al, byte ptr [0xa01]
1:10B3  c41e080a          les      bx, ptr [0xa08]
1:10B7  03d9              add      bx, cx
1:10B9  2688470e          mov      byte ptr es:[bx + 0xe], al
1:10BD  46                inc      si
1:10BE  83fe10            cmp      si, 0x10
1:10C1  7d03              jge      0x10c6
1:10C3  e970ff            jmp      0x1036
1:10C6  8b46f6            mov      ax, word ptr [bp - 0xa]
1:10C9  8b56f8            mov      dx, word ptr [bp - 8]
1:10CC  2946fa            sub      word ptr [bp - 6], ax
1:10CF  1956fc            sbb      word ptr [bp - 4], dx
1:10D2  47                inc      di
1:10D3  ff46f4            inc      word ptr [bp - 0xc]
1:10D6  817ef40004        cmp      word ptr [bp - 0xc], 0x400
1:10DB  7d32              jge      0x110f
1:10DD  8b5ef4            mov      bx, word ptr [bp - 0xc]
1:10E0  d1e3              shl      bx, 1
1:10E2  d1e3              shl      bx, 1
1:10E4  035ef2            add      bx, word ptr [bp - 0xe]
1:10E7  8b07              mov      ax, word ptr [bx]
1:10E9  8b5702            mov      dx, word ptr [bx + 2]
1:10EC  0146fa            add      word ptr [bp - 6], ax
1:10EF  1156fc            adc      word ptr [bp - 4], dx
1:10F2  8b46f6            mov      ax, word ptr [bp - 0xa]
1:10F5  8b56f8            mov      dx, word ptr [bp - 8]
1:10F8  3956fc            cmp      word ptr [bp - 4], dx
1:10FB  7cd6              jl       0x10d3
1:10FD  7f05              jg       0x1104
1:10FF  3946fa            cmp      word ptr [bp - 6], ax
1:1102  72cf              jb       0x10d3
1:1104  83ff0e            cmp      di, 0xe
1:1107  7403              je       0x110c
1:1109  e928ff            jmp      0x1034
1:110C  bf0f00            mov      di, 0xf
1:110F  83ff0e            cmp      di, 0xe
1:1112  7d75              jge      0x1189
1:1114  2bf6              sub      si, si
1:1116  b8fc09            mov      ax, 0x9fc
1:1119  50                push     ax
1:111A  8976e8            mov      word ptr [bp - 0x18], si
1:111D  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:111E  df46e8            fild     word ptr [bp - 0x18]
1:1121  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:1122  dc0ea007          fmul     qword ptr [0x7a0]
1:1126  83ec08            sub      sp, 8
1:1129  8bdc              mov      bx, sp
1:112B  9b                wait       ; @0:OSFIXUP:FISRQQ/FJSRQQ (add,t=5)
1:112C  36dd1f            fstp     qword ptr ss:[bx]
1:112F  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:1130  9b                wait     
1:1131  ff36600d          push     word ptr [0xd60]
1:1135  ff365e0d          push     word ptr [0xd5e]
1:1139  0e                push     cs
1:113A  e86c0f            call     0x20a9
1:113D  83c40e            add      sp, 0xe
1:1140  b8fc09            mov      ax, 0x9fc
1:1143  50                push     ax
1:1144  50                push     ax
1:1145  0e                push     cs
1:1146  e8c9ee            call     0x12
1:1149  5b                pop      bx
1:114A  5b                pop      bx
1:114B  a0fd09            mov      al, byte ptr [0x9fd]
1:114E  b104              mov      cl, 4
1:1150  8bdf              mov      bx, di
1:1152  d3e3              shl      bx, cl
1:1154  03de              add      bx, si
1:1156  d1e3              shl      bx, 1
1:1158  d1e3              shl      bx, 1
1:115A  8bcb              mov      cx, bx
1:115C  031e080a          add      bx, word ptr [0xa08]
1:1160  8e060a0a          mov      es, word ptr [0xa0a]
1:1164  2688470c          mov      byte ptr es:[bx + 0xc], al
1:1168  c41e080a          les      bx, ptr [0xa08]
1:116C  03d9              add      bx, cx
1:116E  a0ff09            mov      al, byte ptr [0x9ff]
1:1171  2688470d          mov      byte ptr es:[bx + 0xd], al
1:1175  a0010a            mov      al, byte ptr [0xa01]
1:1178  c41e080a          les      bx, ptr [0xa08]
1:117C  03d9              add      bx, cx
1:117E  2688470e          mov      byte ptr es:[bx + 0xe], al
1:1182  46                inc      si
1:1183  83fe10            cmp      si, 0x10
1:1186  7c8e              jl       0x1116
1:1188  47                inc      di
1:1189  b104              mov      cl, 4
1:118B  8bf7              mov      si, di
1:118D  d3e6              shl      si, cl
1:118F  83c603            add      si, 3
1:1192  eb2b              jmp      0x11bf
1:1194  8bde              mov      bx, si
1:1196  d1e3              shl      bx, 1
1:1198  d1e3              shl      bx, 1
1:119A  8bc3              mov      ax, bx
1:119C  031e080a          add      bx, word ptr [0xa08]
1:11A0  8e060a0a          mov      es, word ptr [0xa0a]
1:11A4  26c60701          mov      byte ptr es:[bx], 1
1:11A8  c41e080a          les      bx, ptr [0xa08]
1:11AC  03d8              add      bx, ax
1:11AE  26c6470101        mov      byte ptr es:[bx + 1], 1
1:11B3  c41e080a          les      bx, ptr [0xa08]
1:11B7  03d8              add      bx, ax
1:11B9  26c6470201        mov      byte ptr es:[bx + 2], 1
1:11BE  46                inc      si
1:11BF  c41eda0d          les      bx, ptr [0xdda]
1:11C3  26c45f1a          les      bx, ptr es:[bx + 0x1a]
1:11C7  26397702          cmp      word ptr es:[bx + 2], si
1:11CB  77c7              ja       0x1194
1:11CD  c41eda0d          les      bx, ptr [0xdda]
1:11D1  26ff7718          push     word ptr es:[bx + 0x18]
1:11D5  2bc0              sub      ax, ax
1:11D7  50                push     ax
1:11D8  26c45f1a          les      bx, ptr es:[bx + 0x1a]
1:11DC  26ff7702          push     word ptr es:[bx + 2]
1:11E0  ff360a0a          push     word ptr [0xa0a]
1:11E4  ff36080a          push     word ptr [0xa08]
1:11E8  9a10050000        lcall    0, 0x510  ; @1:GDI.AnimatePalette
1:11ED  837ef200          cmp      word ptr [bp - 0xe], 0
1:11F1  7412              je       0x1205
1:11F3  ff36440d          push     word ptr [0xd44]
1:11F7  9a67040000        lcall    0, 0x467  ; @1:KERNEL.LocalUnlock
1:11FC  ff36440d          push     word ptr [0xd44]
1:1200  9a70040000        lcall    0, 0x470  ; @1:KERNEL.LocalFree
1:1205  5e                pop      si
1:1206  5f                pop      di
1:1207  4d                dec      bp
1:1208  4d                dec      bp
1:1209  8be5              mov      sp, bp
1:120B  1f                pop      ds
1:120C  5d                pop      bp
1:120D  4d                dec      bp
1:120E  cb                retf     
1:120F  1e                push     ds
1:1210  58                pop      ax
1:1211  90                nop      
1:1212  45                inc      bp
1:1213  55                push     bp
1:1214  8bec              mov      bp, sp
1:1216  1e                push     ds
1:1217  8ed8              mov      ds, ax
1:1219  56                push     si
1:121A  a1e60a            mov      ax, word ptr [0xae6]
1:121D  a30c0a            mov      word ptr [0xa0c], ax
1:1220  ff36de0a          push     word ptr [0xade]
1:1224  ff36dc0a          push     word ptr [0xadc]
1:1228  ff36de0a          push     word ptr [0xade]
1:122C  ff36dc0a          push     word ptr [0xadc]
1:1230  9a070e0000        lcall    0, 0xe07  ; @1:INT:ord_5(1:3C56)
1:1235  2d0100            sub      ax, 1
1:1238  83da00            sbb      dx, 0
1:123B  a30e0a            mov      word ptr [0xa0e], ax
1:123E  8916100a          mov      word ptr [0xa10], dx
1:1242  eb0a              jmp      0x124e
1:1244  832e0e0a01        sub      word ptr [0xa0e], 1
1:1249  831e100a00        sbb      word ptr [0xa10], 0
1:124E  833e100a00        cmp      word ptr [0xa10], 0
1:1253  7c17              jl       0x126c
1:1255  8b1e0e0a          mov      bx, word ptr [0xa0e]
1:1259  d1e3              shl      bx, 1
1:125B  d1e3              shl      bx, 1
1:125D  8b360c0a          mov      si, word ptr [0xa0c]
1:1261  c7000000          mov      word ptr [bx + si], 0
1:1265  c740020080        mov      word ptr [bx + si + 2], 0x8000
1:126A  ebd8              jmp      0x1244
1:126C  5e                pop      si
1:126D  4d                dec      bp
1:126E  4d                dec      bp
1:126F  8be5              mov      sp, bp
1:1271  1f                pop      ds
1:1272  5d                pop      bp
1:1273  4d                dec      bp
1:1274  cb                retf     
1:1275  1e                push     ds
1:1276  58                pop      ax
1:1277  90                nop      
1:1278  45                inc      bp
1:1279  55                push     bp
1:127A  8bec              mov      bp, sp
1:127C  1e                push     ds
1:127D  8ed8              mov      ds, ax
1:127F  83ec06            sub      sp, 6
1:1282  57                push     di
1:1283  56                push     si
1:1284  9a8f120000        lcall    0, 0x128f  ; @1:INT:ord_20(1:3B4C)
1:1289  99                cdq      
1:128A  8bf0              mov      si, ax
1:128C  8bfa              mov      di, dx
1:128E  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_20(1:3B4C)
1:1293  2bc9              sub      cx, cx
1:1295  03f1              add      si, cx
1:1297  13f8              adc      di, ax
1:1299  3bf9              cmp      di, cx
1:129B  7ce7              jl       0x1284
1:129D  8b460a            mov      ax, word ptr [bp + 0xa]
1:12A0  8b560c            mov      dx, word ptr [bp + 0xc]
1:12A3  2b4606            sub      ax, word ptr [bp + 6]
1:12A6  1b5608            sbb      dx, word ptr [bp + 8]
1:12A9  050100            add      ax, 1
1:12AC  13d1              adc      dx, cx
1:12AE  52                push     dx
1:12AF  50                push     ax
1:12B0  57                push     di
1:12B1  56                push     si
1:12B2  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_19(1:3C88)
1:12B7  034606            add      ax, word ptr [bp + 6]
1:12BA  135608            adc      dx, word ptr [bp + 8]
1:12BD  5e                pop      si
1:12BE  5f                pop      di
1:12BF  4d                dec      bp
1:12C0  4d                dec      bp
1:12C1  8be5              mov      sp, bp
1:12C3  1f                pop      ds
1:12C4  5d                pop      bp
1:12C5  4d                dec      bp
1:12C6  cb                retf     
1:12C7  1e                push     ds
1:12C8  58                pop      ax
1:12C9  90                nop      
1:12CA  45                inc      bp
1:12CB  55                push     bp
1:12CC  8bec              mov      bp, sp
1:12CE  1e                push     ds
1:12CF  8ed8              mov      ds, ax
1:12D1  83ec06            sub      sp, 6
1:12D4  9a85120000        lcall    0, 0x1285  ; @1:INT:ord_20(1:3B4C)
1:12D9  99                cdq      
1:12DA  8946fa            mov      word ptr [bp - 6], ax
1:12DD  8956fc            mov      word ptr [bp - 4], dx
1:12E0  0bd2              or       dx, dx
1:12E2  7cf0              jl       0x12d4
1:12E4  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:12E5  db46fa            fild     dword ptr [bp - 6]
1:12E8  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:12E9  dc0ea807          fmul     qword ptr [0x7a8]
1:12ED  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:12EE  dd460e            fld      qword ptr [bp + 0xe]
1:12F1  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:12F2  dc6606            fsub     qword ptr [bp + 6]
1:12F5  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:12F6  dec9              fmulp    st(1)
1:12F8  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:12F9  dc4606            fadd     qword ptr [bp + 6]
1:12FC  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:12FD  dd1ef402          fstp     qword ptr [0x2f4]
1:1301  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:1302  9b                wait     
1:1303  b8f402            mov      ax, 0x2f4
1:1306  4d                dec      bp
1:1307  4d                dec      bp
1:1308  8be5              mov      sp, bp
1:130A  1f                pop      ds
1:130B  5d                pop      bp
1:130C  4d                dec      bp
1:130D  cb                retf     
1:130E  1e                push     ds
1:130F  58                pop      ax
1:1310  90                nop      
1:1311  45                inc      bp
1:1312  55                push     bp
1:1313  8bec              mov      bp, sp
1:1315  1e                push     ds
1:1316  8ed8              mov      ds, ax
1:1318  83ec3e            sub      sp, 0x3e
1:131B  57                push     di
1:131C  56                push     si
1:131D  c606e20c01        mov      byte ptr [0xce2], 1
1:1322  a1380b            mov      ax, word ptr [0xb38]
1:1325  a3e60c            mov      word ptr [0xce6], ax
1:1328  3d0500            cmp      ax, 5
1:132B  7514              jne      0x1341
1:132D  b80400            mov      ax, 4
1:1330  99                cdq      
1:1331  52                push     dx
1:1332  50                push     ax
1:1333  2bc0              sub      ax, ax
1:1335  50                push     ax
1:1336  50                push     ax
1:1337  0e                push     cs
1:1338  e83aff            call     0x1275
1:133B  83c408            add      sp, 8
1:133E  a3e60c            mov      word ptr [0xce6], ax
1:1341  a1e60c            mov      ax, word ptr [0xce6]
1:1344  0bc0              or       ax, ax
1:1346  7414              je       0x135c
1:1348  48                dec      ax
1:1349  7409              je       0x1354
1:134B  48                dec      ax
1:134C  7439              je       0x1387
1:134E  48                dec      ax
1:134F  743e              je       0x138f
1:1351  48                dec      ax
1:1352  7443              je       0x1397
1:1354  c706ce0a0100      mov      word ptr [0xace], 1
1:135A  eb06              jmp      0x1362
1:135C  c706ce0a0400      mov      word ptr [0xace], 4
1:1362  a13a0b            mov      ax, word ptr [0xb3a]
1:1365  a3dc0c            mov      word ptr [0xcdc], ax
1:1368  3d0800            cmp      ax, 8
1:136B  7e14              jle      0x1381
1:136D  b80700            mov      ax, 7
1:1370  99                cdq      
1:1371  52                push     dx
1:1372  50                push     ax
1:1373  2bc0              sub      ax, ax
1:1375  50                push     ax
1:1376  50                push     ax
1:1377  0e                push     cs
1:1378  e8fafe            call     0x1275
1:137B  83c408            add      sp, 8
1:137E  a3dc0c            mov      word ptr [0xcdc], ax
1:1381  a1dc0c            mov      ax, word ptr [0xcdc]
1:1384  e9e703            jmp      0x176e
1:1387  c706ce0a0500      mov      word ptr [0xace], 5
1:138D  ebd3              jmp      0x1362
1:138F  c706ce0a0200      mov      word ptr [0xace], 2
1:1395  ebcb              jmp      0x1362
1:1397  c706ce0a0500      mov      word ptr [0xace], 5
1:139D  c606e20c00        mov      byte ptr [0xce2], 0
1:13A2  ebbe              jmp      0x1362
1:13A4  ff36b607          push     word ptr [0x7b6]
1:13A8  ff36b407          push     word ptr [0x7b4]
1:13AC  ff36b207          push     word ptr [0x7b2]
1:13B0  ff36b007          push     word ptr [0x7b0]
1:13B4  ff366e07          push     word ptr [0x76e]
1:13B8  ff366c07          push     word ptr [0x76c]
1:13BC  ff366a07          push     word ptr [0x76a]
1:13C0  ff366807          push     word ptr [0x768]
1:13C4  0e                push     cs
1:13C5  e8fffe            call     0x12c7
1:13C8  83c410            add      sp, 0x10
1:13CB  bae80a            mov      dx, 0xae8
1:13CE  56                push     si
1:13CF  8bfa              mov      di, dx
1:13D1  8bf0              mov      si, ax
1:13D3  1e                push     ds
1:13D4  07                pop      es
1:13D5  a5                movsw    word ptr es:[di], word ptr [si]
1:13D6  a5                movsw    word ptr es:[di], word ptr [si]
1:13D7  a5                movsw    word ptr es:[di], word ptr [si]
1:13D8  a5                movsw    word ptr es:[di], word ptr [si]
1:13D9  5e                pop      si
1:13DA  ff36be07          push     word ptr [0x7be]
1:13DE  ff36bc07          push     word ptr [0x7bc]
1:13E2  ff36ba07          push     word ptr [0x7ba]
1:13E6  ff36b807          push     word ptr [0x7b8]
1:13EA  ff36c607          push     word ptr [0x7c6]
1:13EE  ff36c407          push     word ptr [0x7c4]
1:13F2  ff36c207          push     word ptr [0x7c2]
1:13F6  ff36c007          push     word ptr [0x7c0]
1:13FA  0e                push     cs
1:13FB  e8c9fe            call     0x12c7
1:13FE  83c410            add      sp, 0x10
1:1401  ba460d            mov      dx, 0xd46
1:1404  56                push     si
1:1405  8bfa              mov      di, dx
1:1407  8bf0              mov      si, ax
1:1409  1e                push     ds
1:140A  07                pop      es
1:140B  a5                movsw    word ptr es:[di], word ptr [si]
1:140C  a5                movsw    word ptr es:[di], word ptr [si]
1:140D  a5                movsw    word ptr es:[di], word ptr [si]
1:140E  a5                movsw    word ptr es:[di], word ptr [si]
1:140F  5e                pop      si
1:1410  b88038            mov      ax, 0x3880
1:1413  ba0100            mov      dx, 1
1:1416  52                push     dx
1:1417  50                push     ax
1:1418  b850c3            mov      ax, 0xc350
1:141B  2bd2              sub      dx, dx
1:141D  52                push     dx
1:141E  50                push     ax
1:141F  0e                push     cs
1:1420  e852fe            call     0x1275
1:1423  83c408            add      sp, 8
1:1426  a35e0d            mov      word ptr [0xd5e], ax
1:1429  8916600d          mov      word ptr [0xd60], dx
1:142D  e95d03            jmp      0x178d
1:1430  b8e80a            mov      ax, 0xae8
1:1433  56                push     si
1:1434  8bf8              mov      di, ax
1:1436  bec807            mov      si, 0x7c8
1:1439  1e                push     ds
1:143A  07                pop      es
1:143B  a5                movsw    word ptr es:[di], word ptr [si]
1:143C  a5                movsw    word ptr es:[di], word ptr [si]
1:143D  a5                movsw    word ptr es:[di], word ptr [si]
1:143E  a5                movsw    word ptr es:[di], word ptr [si]
1:143F  5e                pop      si
1:1440  ff36be07          push     word ptr [0x7be]
1:1444  ff36bc07          push     word ptr [0x7bc]
1:1448  ff36ba07          push     word ptr [0x7ba]
1:144C  ff36b807          push     word ptr [0x7b8]
1:1450  ff36d607          push     word ptr [0x7d6]
1:1454  ff36d407          push     word ptr [0x7d4]
1:1458  ff36d207          push     word ptr [0x7d2]
1:145C  ff36d007          push     word ptr [0x7d0]
1:1460  0e                push     cs
1:1461  e863fe            call     0x12c7
1:1464  83c410            add      sp, 0x10
1:1467  ba460d            mov      dx, 0xd46
1:146A  56                push     si
1:146B  8bfa              mov      di, dx
1:146D  8bf0              mov      si, ax
1:146F  1e                push     ds
1:1470  07                pop      es
1:1471  a5                movsw    word ptr es:[di], word ptr [si]
1:1472  a5                movsw    word ptr es:[di], word ptr [si]
1:1473  a5                movsw    word ptr es:[di], word ptr [si]
1:1474  a5                movsw    word ptr es:[di], word ptr [si]
1:1475  5e                pop      si
1:1476  b860ea            mov      ax, 0xea60
1:1479  2bd2              sub      dx, dx
1:147B  52                push     dx
1:147C  50                push     ax
1:147D  b8409c            mov      ax, 0x9c40
1:1480  eb99              jmp      0x141b
1:1482  ff36de07          push     word ptr [0x7de]
1:1486  ff36dc07          push     word ptr [0x7dc]
1:148A  ff36da07          push     word ptr [0x7da]
1:148E  ff36d807          push     word ptr [0x7d8]
1:1492  ff36e607          push     word ptr [0x7e6]
1:1496  ff36e407          push     word ptr [0x7e4]
1:149A  ff36e207          push     word ptr [0x7e2]
1:149E  ff36e007          push     word ptr [0x7e0]
1:14A2  0e                push     cs
1:14A3  e821fe            call     0x12c7
1:14A6  83c410            add      sp, 0x10
1:14A9  bae80a            mov      dx, 0xae8
1:14AC  56                push     si
1:14AD  8bfa              mov      di, dx
1:14AF  8bf0              mov      si, ax
1:14B1  1e                push     ds
1:14B2  07                pop      es
1:14B3  a5                movsw    word ptr es:[di], word ptr [si]
1:14B4  a5                movsw    word ptr es:[di], word ptr [si]
1:14B5  a5                movsw    word ptr es:[di], word ptr [si]
1:14B6  a5                movsw    word ptr es:[di], word ptr [si]
1:14B7  5e                pop      si
1:14B8  ff36ee07          push     word ptr [0x7ee]
1:14BC  ff36ec07          push     word ptr [0x7ec]
1:14C0  ff36ea07          push     word ptr [0x7ea]
1:14C4  ff36e807          push     word ptr [0x7e8]
1:14C8  ff36b607          push     word ptr [0x7b6]
1:14CC  ff36b407          push     word ptr [0x7b4]
1:14D0  ff36b207          push     word ptr [0x7b2]
1:14D4  ff36b007          push     word ptr [0x7b0]
1:14D8  0e                push     cs
1:14D9  e8ebfd            call     0x12c7
1:14DC  83c410            add      sp, 0x10
1:14DF  ba460d            mov      dx, 0xd46
1:14E2  56                push     si
1:14E3  8bfa              mov      di, dx
1:14E5  8bf0              mov      si, ax
1:14E7  1e                push     ds
1:14E8  07                pop      es
1:14E9  a5                movsw    word ptr es:[di], word ptr [si]
1:14EA  a5                movsw    word ptr es:[di], word ptr [si]
1:14EB  a5                movsw    word ptr es:[di], word ptr [si]
1:14EC  a5                movsw    word ptr es:[di], word ptr [si]
1:14ED  5e                pop      si
1:14EE  b850c3            mov      ax, 0xc350
1:14F1  2bd2              sub      dx, dx
1:14F3  52                push     dx
1:14F4  50                push     ax
1:14F5  b81027            mov      ax, 0x2710
1:14F8  e920ff            jmp      0x141b
1:14FB  ff36ce07          push     word ptr [0x7ce]
1:14FF  ff36cc07          push     word ptr [0x7cc]
1:1503  ff36ca07          push     word ptr [0x7ca]
1:1507  ff36c807          push     word ptr [0x7c8]
1:150B  ff36de07          push     word ptr [0x7de]
1:150F  ff36dc07          push     word ptr [0x7dc]
1:1513  ff36da07          push     word ptr [0x7da]
1:1517  ff36d807          push     word ptr [0x7d8]
1:151B  0e                push     cs
1:151C  e8a8fd            call     0x12c7
1:151F  83c410            add      sp, 0x10
1:1522  bae80a            mov      dx, 0xae8
1:1525  56                push     si
1:1526  8bfa              mov      di, dx
1:1528  8bf0              mov      si, ax
1:152A  1e                push     ds
1:152B  07                pop      es
1:152C  a5                movsw    word ptr es:[di], word ptr [si]
1:152D  a5                movsw    word ptr es:[di], word ptr [si]
1:152E  a5                movsw    word ptr es:[di], word ptr [si]
1:152F  a5                movsw    word ptr es:[di], word ptr [si]
1:1530  5e                pop      si
1:1531  ff36ee07          push     word ptr [0x7ee]
1:1535  ff36ec07          push     word ptr [0x7ec]
1:1539  ff36ea07          push     word ptr [0x7ea]
1:153D  ff36e807          push     word ptr [0x7e8]
1:1541  ff36b607          push     word ptr [0x7b6]
1:1545  ff36b407          push     word ptr [0x7b4]
1:1549  ff36b207          push     word ptr [0x7b2]
1:154D  ff36b007          push     word ptr [0x7b0]
1:1551  0e                push     cs
1:1552  e872fd            call     0x12c7
1:1555  83c410            add      sp, 0x10
1:1558  ba460d            mov      dx, 0xd46
1:155B  56                push     si
1:155C  8bfa              mov      di, dx
1:155E  8bf0              mov      si, ax
1:1560  1e                push     ds
1:1561  07                pop      es
1:1562  a5                movsw    word ptr es:[di], word ptr [si]
1:1563  a5                movsw    word ptr es:[di], word ptr [si]
1:1564  a5                movsw    word ptr es:[di], word ptr [si]
1:1565  a5                movsw    word ptr es:[di], word ptr [si]
1:1566  5e                pop      si
1:1567  b8a086            mov      ax, 0x86a0
1:156A  ba0100            mov      dx, 1
1:156D  52                push     dx
1:156E  50                push     ax
1:156F  b88038            mov      ax, 0x3880
1:1572  52                push     dx
1:1573  50                push     ax
1:1574  0e                push     cs
1:1575  e8fdfc            call     0x1275
1:1578  83c408            add      sp, 8
1:157B  a35e0d            mov      word ptr [0xd5e], ax
1:157E  8916600d          mov      word ptr [0xd60], dx
1:1582  c606e20c00        mov      byte ptr [0xce2], 0
1:1587  e90302            jmp      0x178d
1:158A  b8e80a            mov      ax, 0xae8
1:158D  56                push     si
1:158E  8bf8              mov      di, ax
1:1590  bef007            mov      si, 0x7f0
1:1593  1e                push     ds
1:1594  07                pop      es
1:1595  a5                movsw    word ptr es:[di], word ptr [si]
1:1596  a5                movsw    word ptr es:[di], word ptr [si]
1:1597  a5                movsw    word ptr es:[di], word ptr [si]
1:1598  a5                movsw    word ptr es:[di], word ptr [si]
1:1599  5e                pop      si
1:159A  b8460d            mov      ax, 0xd46
1:159D  56                push     si
1:159E  8bf8              mov      di, ax
1:15A0  be6807            mov      si, 0x768
1:15A3  a5                movsw    word ptr es:[di], word ptr [si]
1:15A4  a5                movsw    word ptr es:[di], word ptr [si]
1:15A5  a5                movsw    word ptr es:[di], word ptr [si]
1:15A6  a5                movsw    word ptr es:[di], word ptr [si]
1:15A7  5e                pop      si
1:15A8  c7065e0d1027      mov      word ptr [0xd5e], 0x2710
1:15AE  c706600d0000      mov      word ptr [0xd60], 0
1:15B4  e9d601            jmp      0x178d
1:15B7  ff36b607          push     word ptr [0x7b6]
1:15BB  ff36b407          push     word ptr [0x7b4]
1:15BF  ff36b207          push     word ptr [0x7b2]
1:15C3  ff36b007          push     word ptr [0x7b0]
1:15C7  ff36e607          push     word ptr [0x7e6]
1:15CB  ff36e407          push     word ptr [0x7e4]
1:15CF  ff36e207          push     word ptr [0x7e2]
1:15D3  ff36e007          push     word ptr [0x7e0]
1:15D7  0e                push     cs
1:15D8  e8ecfc            call     0x12c7
1:15DB  83c410            add      sp, 0x10
1:15DE  bae80a            mov      dx, 0xae8
1:15E1  56                push     si
1:15E2  8bfa              mov      di, dx
1:15E4  8bf0              mov      si, ax
1:15E6  1e                push     ds
1:15E7  07                pop      es
1:15E8  a5                movsw    word ptr es:[di], word ptr [si]
1:15E9  a5                movsw    word ptr es:[di], word ptr [si]
1:15EA  a5                movsw    word ptr es:[di], word ptr [si]
1:15EB  a5                movsw    word ptr es:[di], word ptr [si]
1:15EC  5e                pop      si
1:15ED  ff36d607          push     word ptr [0x7d6]
1:15F1  ff36d407          push     word ptr [0x7d4]
1:15F5  ff36d207          push     word ptr [0x7d2]
1:15F9  ff36d007          push     word ptr [0x7d0]
1:15FD  ff366e07          push     word ptr [0x76e]
1:1601  ff366c07          push     word ptr [0x76c]
1:1605  ff366a07          push     word ptr [0x76a]
1:1609  ff366807          push     word ptr [0x768]
1:160D  0e                push     cs
1:160E  e8b6fc            call     0x12c7
1:1611  83c410            add      sp, 0x10
1:1614  ba460d            mov      dx, 0xd46
1:1617  56                push     si
1:1618  8bfa              mov      di, dx
1:161A  8bf0              mov      si, ax
1:161C  1e                push     ds
1:161D  07                pop      es
1:161E  a5                movsw    word ptr es:[di], word ptr [si]
1:161F  a5                movsw    word ptr es:[di], word ptr [si]
1:1620  a5                movsw    word ptr es:[di], word ptr [si]
1:1621  a5                movsw    word ptr es:[di], word ptr [si]
1:1622  5e                pop      si
1:1623  b83075            mov      ax, 0x7530
1:1626  e9c8fe            jmp      0x14f1
1:1629  ff36fe07          push     word ptr [0x7fe]
1:162D  ff36fc07          push     word ptr [0x7fc]
1:1631  ff36fa07          push     word ptr [0x7fa]
1:1635  ff36f807          push     word ptr [0x7f8]
1:1639  ff36f607          push     word ptr [0x7f6]
1:163D  ff36f407          push     word ptr [0x7f4]
1:1641  ff36f207          push     word ptr [0x7f2]
1:1645  ff36f007          push     word ptr [0x7f0]
1:1649  0e                push     cs
1:164A  e87afc            call     0x12c7
1:164D  83c410            add      sp, 0x10
1:1650  bae80a            mov      dx, 0xae8
1:1653  56                push     si
1:1654  8bfa              mov      di, dx
1:1656  8bf0              mov      si, ax
1:1658  1e                push     ds
1:1659  07                pop      es
1:165A  a5                movsw    word ptr es:[di], word ptr [si]
1:165B  a5                movsw    word ptr es:[di], word ptr [si]
1:165C  a5                movsw    word ptr es:[di], word ptr [si]
1:165D  a5                movsw    word ptr es:[di], word ptr [si]
1:165E  5e                pop      si
1:165F  ff360608          push     word ptr [0x806]
1:1663  ff360408          push     word ptr [0x804]
1:1667  ff360208          push     word ptr [0x802]
1:166B  ff360008          push     word ptr [0x800]
1:166F  ff36d607          push     word ptr [0x7d6]
1:1673  ff36d407          push     word ptr [0x7d4]
1:1677  ff36d207          push     word ptr [0x7d2]
1:167B  ff36d007          push     word ptr [0x7d0]
1:167F  0e                push     cs
1:1680  e844fc            call     0x12c7
1:1683  83c410            add      sp, 0x10
1:1686  ba460d            mov      dx, 0xd46
1:1689  56                push     si
1:168A  8bfa              mov      di, dx
1:168C  8bf0              mov      si, ax
1:168E  1e                push     ds
1:168F  07                pop      es
1:1690  a5                movsw    word ptr es:[di], word ptr [si]
1:1691  a5                movsw    word ptr es:[di], word ptr [si]
1:1692  a5                movsw    word ptr es:[di], word ptr [si]
1:1693  a5                movsw    word ptr es:[di], word ptr [si]
1:1694  5e                pop      si
1:1695  b8409c            mov      ax, 0x9c40
1:1698  e956fe            jmp      0x14f1
1:169B  ff36ce07          push     word ptr [0x7ce]
1:169F  ff36cc07          push     word ptr [0x7cc]
1:16A3  ff36ca07          push     word ptr [0x7ca]
1:16A7  ff36c807          push     word ptr [0x7c8]
1:16AB  ff36b607          push     word ptr [0x7b6]
1:16AF  ff36b407          push     word ptr [0x7b4]
1:16B3  ff36b207          push     word ptr [0x7b2]
1:16B7  ff36b007          push     word ptr [0x7b0]
1:16BB  0e                push     cs
1:16BC  e808fc            call     0x12c7
1:16BF  83c410            add      sp, 0x10
1:16C2  bae80a            mov      dx, 0xae8
1:16C5  56                push     si
1:16C6  8bfa              mov      di, dx
1:16C8  8bf0              mov      si, ax
1:16CA  1e                push     ds
1:16CB  07                pop      es
1:16CC  a5                movsw    word ptr es:[di], word ptr [si]
1:16CD  a5                movsw    word ptr es:[di], word ptr [si]
1:16CE  a5                movsw    word ptr es:[di], word ptr [si]
1:16CF  a5                movsw    word ptr es:[di], word ptr [si]
1:16D0  5e                pop      si
1:16D1  ff360e08          push     word ptr [0x80e]
1:16D5  ff360c08          push     word ptr [0x80c]
1:16D9  ff360a08          push     word ptr [0x80a]
1:16DD  ff360808          push     word ptr [0x808]
1:16E1  ff36d607          push     word ptr [0x7d6]
1:16E5  ff36d407          push     word ptr [0x7d4]
1:16E9  ff36d207          push     word ptr [0x7d2]
1:16ED  ff36d007          push     word ptr [0x7d0]
1:16F1  e919ff            jmp      0x160d
1:16F4  ff36fe07          push     word ptr [0x7fe]
1:16F8  ff36fc07          push     word ptr [0x7fc]
1:16FC  ff36fa07          push     word ptr [0x7fa]
1:1700  ff36f807          push     word ptr [0x7f8]
1:1704  ff36f607          push     word ptr [0x7f6]
1:1708  ff36f407          push     word ptr [0x7f4]
1:170C  ff36f207          push     word ptr [0x7f2]
1:1710  ff36f007          push     word ptr [0x7f0]
1:1714  0e                push     cs
1:1715  e8affb            call     0x12c7
1:1718  83c410            add      sp, 0x10
1:171B  bae80a            mov      dx, 0xae8
1:171E  56                push     si
1:171F  8bfa              mov      di, dx
1:1721  8bf0              mov      si, ax
1:1723  1e                push     ds
1:1724  07                pop      es
1:1725  a5                movsw    word ptr es:[di], word ptr [si]
1:1726  a5                movsw    word ptr es:[di], word ptr [si]
1:1727  a5                movsw    word ptr es:[di], word ptr [si]
1:1728  a5                movsw    word ptr es:[di], word ptr [si]
1:1729  5e                pop      si
1:172A  ff360608          push     word ptr [0x806]
1:172E  ff360408          push     word ptr [0x804]
1:1732  ff360208          push     word ptr [0x802]
1:1736  ff360008          push     word ptr [0x800]
1:173A  ff36c607          push     word ptr [0x7c6]
1:173E  ff36c407          push     word ptr [0x7c4]
1:1742  ff36c207          push     word ptr [0x7c2]
1:1746  ff36c007          push     word ptr [0x7c0]
1:174A  0e                push     cs
1:174B  e879fb            call     0x12c7
1:174E  83c410            add      sp, 0x10
1:1751  ba460d            mov      dx, 0xd46
1:1754  56                push     si
1:1755  8bfa              mov      di, dx
1:1757  8bf0              mov      si, ax
1:1759  1e                push     ds
1:175A  07                pop      es
1:175B  a5                movsw    word ptr es:[di], word ptr [si]
1:175C  a5                movsw    word ptr es:[di], word ptr [si]
1:175D  a5                movsw    word ptr es:[di], word ptr [si]
1:175E  a5                movsw    word ptr es:[di], word ptr [si]
1:175F  5e                pop      si
1:1760  b8a086            mov      ax, 0x86a0
1:1763  ba0100            mov      dx, 1
1:1766  52                push     dx
1:1767  50                push     ax
1:1768  b83075            mov      ax, 0x7530
1:176B  e9adfc            jmp      0x141b
1:176E  3d0800            cmp      ax, 8
1:1771  771a              ja       0x178d
1:1773  d1e0              shl      ax, 1
1:1775  93                xchg     bx, ax
1:1776  2effa77b17        jmp      word ptr cs:[bx + 0x177b]
1:177B  a4                movsb    byte ptr es:[di], byte ptr [si]
1:177C  1330              adc      si, word ptr [bx + si]
1:177E  1482              adc      al, 0x82
1:1780  14fb              adc      al, 0xfb
1:1782  148a              adc      al, 0x8a
1:1784  15b715            adc      ax, 0x15b7
1:1787  29169b16          sub      word ptr [0x169b], dx
1:178B  f4                hlt      
1:178C  16                push     ss
1:178D  2bf6              sub      si, si
1:178F  eb13              jmp      0x17a4
1:1791  8bde              mov      bx, si
1:1793  d1e3              shl      bx, 1
1:1795  d1e3              shl      bx, 1
1:1797  c787880da086      mov      word ptr [bx + 0xd88], 0x86a0
1:179D  c7878a0d0100      mov      word ptr [bx + 0xd8a], 1
1:17A3  46                inc      si
1:17A4  83fe0a            cmp      si, 0xa
1:17A7  7f65              jg       0x180e
1:17A9  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:17AA  dd06460d          fld      qword ptr [0xd46]
1:17AE  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:17AF  dc167007          fcom     qword ptr [0x770]
1:17B3  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:17B4  ddd8              fstp     st(0)
1:17B6  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:17B7  dd7ec6            fnstsw   word ptr [bp - 0x3a]
1:17BA  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:17BB  9b                wait     
1:17BC  8a66c7            mov      ah, byte ptr [bp - 0x39]
1:17BF  9e                sahf     
1:17C0  76cf              jbe      0x1791
1:17C2  8d44ff            lea      ax, [si - 1]
1:17C5  8946c6            mov      word ptr [bp - 0x3a], ax
1:17C8  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:17C9  df46c6            fild     word ptr [bp - 0x3a]
1:17CC  83ec08            sub      sp, 8
1:17CF  8bdc              mov      bx, sp
1:17D1  9b                wait       ; @0:OSFIXUP:FISRQQ/FJSRQQ (add,t=5)
1:17D2  36dd1f            fstp     qword ptr ss:[bx]
1:17D5  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:17D6  9b                wait     
1:17D7  ff364c0d          push     word ptr [0xd4c]
1:17DB  ff364a0d          push     word ptr [0xd4a]
1:17DF  ff36480d          push     word ptr [0xd48]
1:17E3  ff36460d          push     word ptr [0xd46]
1:17E7  9ab90b0000        lcall    0, 0xbb9  ; @1:INT:ord_18(1:3DB8)
1:17EC  83c410            add      sp, 0x10
1:17EF  8bd8              mov      bx, ax
1:17F1  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:17F2  dd07              fld      qword ptr [bx]
1:17F4  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:17F5  dc0e1008          fmul     qword ptr [0x810]
1:17F9  9a47090000        lcall    0, 0x947  ; @1:INT:ord_7(1:3E04)
1:17FE  8bde              mov      bx, si
1:1800  d1e3              shl      bx, 1
1:1802  d1e3              shl      bx, 1
1:1804  8987880d          mov      word ptr [bx + 0xd88], ax
1:1808  89978a0d          mov      word ptr [bx + 0xd8a], dx
1:180C  eb95              jmp      0x17a3
1:180E  b80200            mov      ax, 2
1:1811  99                cdq      
1:1812  52                push     dx
1:1813  50                push     ax
1:1814  ff36b20d          push     word ptr [0xdb2]
1:1818  ff36b00d          push     word ptr [0xdb0]
1:181C  9abd190000        lcall    0, 0x19bd  ; @1:INT:ord_8(1:3BBC)
1:1821  8946fa            mov      word ptr [bp - 6], ax
1:1824  8956fc            mov      word ptr [bp - 4], dx
1:1827  b80300            mov      ax, 3
1:182A  99                cdq      
1:182B  52                push     dx
1:182C  50                push     ax
1:182D  b80100            mov      ax, 1
1:1830  99                cdq      
1:1831  52                push     dx
1:1832  50                push     ax
1:1833  0e                push     cs
1:1834  e83efa            call     0x1275
1:1837  83c408            add      sp, 8
1:183A  e9f801            jmp      0x1a35
1:183D  8b46fa            mov      ax, word ptr [bp - 6]
1:1840  8b56fc            mov      dx, word ptr [bp - 4]
1:1843  8b1ee60a          mov      bx, word ptr [0xae6]
1:1847  8907              mov      word ptr [bx], ax
1:1849  895702            mov      word ptr [bx + 2], dx
1:184C  8b1efa0d          mov      bx, word ptr [0xdfa]
1:1850  d1e3              shl      bx, 1
1:1852  d1e3              shl      bx, 1
1:1854  8b3ee60a          mov      di, word ptr [0xae6]
1:1858  2bc9              sub      cx, cx
1:185A  894902            mov      word ptr [bx + di + 2], cx
1:185D  8909              mov      word ptr [bx + di], cx
1:185F  a1fa0d            mov      ax, word ptr [0xdfa]
1:1862  f72edc0a          imul     word ptr [0xadc]
1:1866  8bd8              mov      bx, ax
1:1868  d1e3              shl      bx, 1
1:186A  d1e3              shl      bx, 1
1:186C  8b3ee60a          mov      di, word ptr [0xae6]
1:1870  2bc0              sub      ax, ax
1:1872  894102            mov      word ptr [bx + di + 2], ax
1:1875  8901              mov      word ptr [bx + di], ax
1:1877  a1dc0a            mov      ax, word ptr [0xadc]
1:187A  40                inc      ax
1:187B  f72efa0d          imul     word ptr [0xdfa]
1:187F  8bd8              mov      bx, ax
1:1881  d1e3              shl      bx, 1
1:1883  d1e3              shl      bx, 1
1:1885  8b3ee60a          mov      di, word ptr [0xae6]
1:1889  8b46fa            mov      ax, word ptr [bp - 6]
1:188C  8b56fc            mov      dx, word ptr [bp - 4]
1:188F  f7d8              neg      ax
1:1891  13d1              adc      dx, cx
1:1893  f7da              neg      dx
1:1895  8901              mov      word ptr [bx + di], ax
1:1897  895102            mov      word ptr [bx + di + 2], dx
1:189A  e9aa01            jmp      0x1a47
1:189D  8b46fa            mov      ax, word ptr [bp - 6]
1:18A0  8b56fc            mov      dx, word ptr [bp - 4]
1:18A3  8b1ee60a          mov      bx, word ptr [0xae6]
1:18A7  8907              mov      word ptr [bx], ax
1:18A9  895702            mov      word ptr [bx + 2], dx
1:18AC  8b1efa0d          mov      bx, word ptr [0xdfa]
1:18B0  d1e3              shl      bx, 1
1:18B2  d1e3              shl      bx, 1
1:18B4  8b3ee60a          mov      di, word ptr [0xae6]
1:18B8  2bc0              sub      ax, ax
1:18BA  894102            mov      word ptr [bx + di + 2], ax
1:18BD  8901              mov      word ptr [bx + di], ax
1:18BF  a1fa0d            mov      ax, word ptr [0xdfa]
1:18C2  f72edc0a          imul     word ptr [0xadc]
1:18C6  8bd8              mov      bx, ax
1:18C8  d1e3              shl      bx, 1
1:18CA  d1e3              shl      bx, 1
1:18CC  8b3ee60a          mov      di, word ptr [0xae6]
1:18D0  2bc0              sub      ax, ax
1:18D2  894102            mov      word ptr [bx + di + 2], ax
1:18D5  8901              mov      word ptr [bx + di], ax
1:18D7  a1dc0a            mov      ax, word ptr [0xadc]
1:18DA  40                inc      ax
1:18DB  f72efa0d          imul     word ptr [0xdfa]
1:18DF  8bd8              mov      bx, ax
1:18E1  d1e3              shl      bx, 1
1:18E3  d1e3              shl      bx, 1
1:18E5  8b3ee60a          mov      di, word ptr [0xae6]
1:18E9  2bc0              sub      ax, ax
1:18EB  894102            mov      word ptr [bx + di + 2], ax
1:18EE  8901              mov      word ptr [bx + di], ax
1:18F0  a1fa0d            mov      ax, word ptr [0xdfa]
1:18F3  8b16fc0d          mov      dx, word ptr [0xdfc]
1:18F7  b101              mov      cl, 1
1:18F9  9ad7190000        lcall    0, 0x19d7  ; @1:INT:ord_21(1:3D34)
1:18FE  8bc8              mov      cx, ax
1:1900  a1dc0a            mov      ax, word ptr [0xadc]
1:1903  40                inc      ax
1:1904  f7e9              imul     cx
1:1906  8bd8              mov      bx, ax
1:1908  d1e3              shl      bx, 1
1:190A  d1e3              shl      bx, 1
1:190C  8b3ee60a          mov      di, word ptr [0xae6]
1:1910  2bc0              sub      ax, ax
1:1912  894102            mov      word ptr [bx + di + 2], ax
1:1915  8901              mov      word ptr [bx + di], ax
1:1917  a1fa0d            mov      ax, word ptr [0xdfa]
1:191A  f72edc0a          imul     word ptr [0xadc]
1:191E  8bd8              mov      bx, ax
1:1920  a1fa0d            mov      ax, word ptr [0xdfa]
1:1923  8b16fc0d          mov      dx, word ptr [0xdfc]
1:1927  d1fa              sar      dx, 1
1:1929  d1d8              rcr      ax, 1
1:192B  03d8              add      bx, ax
1:192D  d1e3              shl      bx, 1
1:192F  d1e3              shl      bx, 1
1:1931  8b3ee60a          mov      di, word ptr [0xae6]
1:1935  2bc0              sub      ax, ax
1:1937  894102            mov      word ptr [bx + di + 2], ax
1:193A  8901              mov      word ptr [bx + di], ax
1:193C  a1fa0d            mov      ax, word ptr [0xdfa]
1:193F  8b16fc0d          mov      dx, word ptr [0xdfc]
1:1943  d1fa              sar      dx, 1
1:1945  d1d8              rcr      ax, 1
1:1947  f72edc0a          imul     word ptr [0xadc]
1:194B  8bd8              mov      bx, ax
1:194D  031efa0d          add      bx, word ptr [0xdfa]
1:1951  d1e3              shl      bx, 1
1:1953  d1e3              shl      bx, 1
1:1955  8b3ee60a          mov      di, word ptr [0xae6]
1:1959  2bc0              sub      ax, ax
1:195B  894102            mov      word ptr [bx + di + 2], ax
1:195E  8901              mov      word ptr [bx + di], ax
1:1960  e9e400            jmp      0x1a47
1:1963  8b1ee60a          mov      bx, word ptr [0xae6]
1:1967  2bc0              sub      ax, ax
1:1969  894702            mov      word ptr [bx + 2], ax
1:196C  8907              mov      word ptr [bx], ax
1:196E  8b1efa0d          mov      bx, word ptr [0xdfa]
1:1972  d1e3              shl      bx, 1
1:1974  d1e3              shl      bx, 1
1:1976  8b3ee60a          mov      di, word ptr [0xae6]
1:197A  894102            mov      word ptr [bx + di + 2], ax
1:197D  8901              mov      word ptr [bx + di], ax
1:197F  a1fa0d            mov      ax, word ptr [0xdfa]
1:1982  f72edc0a          imul     word ptr [0xadc]
1:1986  8bd8              mov      bx, ax
1:1988  d1e3              shl      bx, 1
1:198A  d1e3              shl      bx, 1
1:198C  8b3ee60a          mov      di, word ptr [0xae6]
1:1990  2bc0              sub      ax, ax
1:1992  894102            mov      word ptr [bx + di + 2], ax
1:1995  8901              mov      word ptr [bx + di], ax
1:1997  a1dc0a            mov      ax, word ptr [0xadc]
1:199A  40                inc      ax
1:199B  f72efa0d          imul     word ptr [0xdfa]
1:199F  8bd8              mov      bx, ax
1:19A1  d1e3              shl      bx, 1
1:19A3  d1e3              shl      bx, 1
1:19A5  8b3ee60a          mov      di, word ptr [0xae6]
1:19A9  2bc0              sub      ax, ax
1:19AB  894102            mov      word ptr [bx + di + 2], ax
1:19AE  8901              mov      word ptr [bx + di], ax
1:19B0  b80200            mov      ax, 2
1:19B3  99                cdq      
1:19B4  52                push     dx
1:19B5  50                push     ax
1:19B6  ff76fc            push     word ptr [bp - 4]
1:19B9  ff76fa            push     word ptr [bp - 6]
1:19BC  9a6e100000        lcall    0, 0x106e  ; @1:INT:ord_8(1:3BBC)
1:19C1  8bc8              mov      cx, ax
1:19C3  8bda              mov      bx, dx
1:19C5  a1fa0d            mov      ax, word ptr [0xdfa]
1:19C8  8b16fc0d          mov      dx, word ptr [0xdfc]
1:19CC  8bf9              mov      di, cx
1:19CE  b101              mov      cl, 1
1:19D0  897ec2            mov      word ptr [bp - 0x3e], di
1:19D3  895ec4            mov      word ptr [bp - 0x3c], bx
1:19D6  9a021a0000        lcall    0, 0x1a02  ; @1:INT:ord_21(1:3D34)
1:19DB  8bc8              mov      cx, ax
1:19DD  a1dc0a            mov      ax, word ptr [0xadc]
1:19E0  40                inc      ax
1:19E1  f7e9              imul     cx
1:19E3  8bd8              mov      bx, ax
1:19E5  d1e3              shl      bx, 1
1:19E7  d1e3              shl      bx, 1
1:19E9  8b3ee60a          mov      di, word ptr [0xae6]
1:19ED  8b46c2            mov      ax, word ptr [bp - 0x3e]
1:19F0  8b56c4            mov      dx, word ptr [bp - 0x3c]
1:19F3  8901              mov      word ptr [bx + di], ax
1:19F5  895102            mov      word ptr [bx + di + 2], dx
1:19F8  a1fa0d            mov      ax, word ptr [0xdfa]
1:19FB  8b16fc0d          mov      dx, word ptr [0xdfc]
1:19FF  b101              mov      cl, 1
1:1A01  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_21(1:3D34)
1:1A06  8bd8              mov      bx, ax
1:1A08  d1e3              shl      bx, 1
1:1A0A  d1e3              shl      bx, 1
1:1A0C  8b3ee60a          mov      di, word ptr [0xae6]
1:1A10  8b46fa            mov      ax, word ptr [bp - 6]
1:1A13  8b56fc            mov      dx, word ptr [bp - 4]
1:1A16  8901              mov      word ptr [bx + di], ax
1:1A18  895102            mov      word ptr [bx + di + 2], dx
1:1A1B  a1fa0d            mov      ax, word ptr [0xdfa]
1:1A1E  24fe              and      al, 0xfe
1:1A20  f72edc0a          imul     word ptr [0xadc]
1:1A24  8bd8              mov      bx, ax
1:1A26  d1e3              shl      bx, 1
1:1A28  8b3ee60a          mov      di, word ptr [0xae6]
1:1A2C  8b46fa            mov      ax, word ptr [bp - 6]
1:1A2F  8b56fc            mov      dx, word ptr [bp - 4]
1:1A32  e960fe            jmp      0x1895
1:1A35  48                dec      ax
1:1A36  7503              jne      0x1a3b
1:1A38  e902fe            jmp      0x183d
1:1A3B  48                dec      ax
1:1A3C  7503              jne      0x1a41
1:1A3E  e95cfe            jmp      0x189d
1:1A41  48                dec      ax
1:1A42  7503              jne      0x1a47
1:1A44  e91cff            jmp      0x1963
1:1A47  5e                pop      si
1:1A48  5f                pop      di
1:1A49  4d                dec      bp
1:1A4A  4d                dec      bp
1:1A4B  8be5              mov      sp, bp
1:1A4D  1f                pop      ds
1:1A4E  5d                pop      bp
1:1A4F  4d                dec      bp
1:1A50  cb                retf     
1:1A51  1e                push     ds
1:1A52  58                pop      ax
1:1A53  90                nop      
1:1A54  45                inc      bp
1:1A55  55                push     bp
1:1A56  8bec              mov      bp, sp
1:1A58  1e                push     ds
1:1A59  8ed8              mov      ds, ax
1:1A5B  83ec32            sub      sp, 0x32
1:1A5E  57                push     di
1:1A5F  56                push     si
1:1A60  a1e60a            mov      ax, word ptr [0xae6]
1:1A63  a3120a            mov      word ptr [0xa12], ax
1:1A66  c746de0000        mov      word ptr [bp - 0x22], 0
1:1A6B  c746e00080        mov      word ptr [bp - 0x20], 0x8000
1:1A70  ff36de0a          push     word ptr [0xade]
1:1A74  ff36dc0a          push     word ptr [0xadc]
1:1A78  ff36de0a          push     word ptr [0xade]
1:1A7C  ff36dc0a          push     word ptr [0xadc]
1:1A80  9ab91b0000        lcall    0, 0x1bb9  ; @1:INT:ord_5(1:3C56)
1:1A85  2d0100            sub      ax, 1
1:1A88  83da00            sbb      dx, 0
1:1A8B  8946da            mov      word ptr [bp - 0x26], ax
1:1A8E  8956dc            mov      word ptr [bp - 0x24], dx
1:1A91  eb08              jmp      0x1a9b
1:1A93  836eda01          sub      word ptr [bp - 0x26], 1
1:1A97  835edc00          sbb      word ptr [bp - 0x24], 0
1:1A9B  837edc00          cmp      word ptr [bp - 0x24], 0
1:1A9F  7c29              jl       0x1aca
1:1AA1  8b46de            mov      ax, word ptr [bp - 0x22]
1:1AA4  8b56e0            mov      dx, word ptr [bp - 0x20]
1:1AA7  8b5eda            mov      bx, word ptr [bp - 0x26]
1:1AAA  d1e3              shl      bx, 1
1:1AAC  d1e3              shl      bx, 1
1:1AAE  8b36120a          mov      si, word ptr [0xa12]
1:1AB2  395002            cmp      word ptr [bx + si + 2], dx
1:1AB5  7cdc              jl       0x1a93
1:1AB7  7f04              jg       0x1abd
1:1AB9  3900              cmp      word ptr [bx + si], ax
1:1ABB  76d6              jbe      0x1a93
1:1ABD  8b00              mov      ax, word ptr [bx + si]
1:1ABF  8b5002            mov      dx, word ptr [bx + si + 2]
1:1AC2  8946de            mov      word ptr [bp - 0x22], ax
1:1AC5  8956e0            mov      word ptr [bp - 0x20], dx
1:1AC8  ebc9              jmp      0x1a93
1:1ACA  ff36ee0a          push     word ptr [0xaee]
1:1ACE  ff36ec0a          push     word ptr [0xaec]
1:1AD2  ff36ea0a          push     word ptr [0xaea]
1:1AD6  ff36e80a          push     word ptr [0xae8]
1:1ADA  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:1ADB  db46de            fild     dword ptr [bp - 0x22]
1:1ADE  83ec08            sub      sp, 8
1:1AE1  8bdc              mov      bx, sp
1:1AE3  9b                wait       ; @0:OSFIXUP:FISRQQ/FJSRQQ (add,t=5)
1:1AE4  36dd1f            fstp     qword ptr ss:[bx]
1:1AE7  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:1AE8  9b                wait     
1:1AE9  9ae8170000        lcall    0, 0x17e8  ; @1:INT:ord_18(1:3DB8)
1:1AEE  83c410            add      sp, 0x10
1:1AF1  8d7ee6            lea      di, [bp - 0x1a]
1:1AF4  8bf0              mov      si, ax
1:1AF6  16                push     ss
1:1AF7  07                pop      es
1:1AF8  a5                movsw    word ptr es:[di], word ptr [si]
1:1AF9  a5                movsw    word ptr es:[di], word ptr [si]
1:1AFA  a5                movsw    word ptr es:[di], word ptr [si]
1:1AFB  a5                movsw    word ptr es:[di], word ptr [si]
1:1AFC  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:1AFD  db065e0d          fild     dword ptr [0xd5e]
1:1B01  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:1B02  dc76e6            fdiv     qword ptr [bp - 0x1a]
1:1B05  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:1B06  dd56ce            fst      qword ptr [bp - 0x32]
1:1B09  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:1B0A  dd1e7c0d          fstp     qword ptr [0xd7c]
1:1B0E  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:1B0F  dd06e80a          fld      qword ptr [0xae8]
1:1B13  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:1B14  dc0e1808          fmul     qword ptr [0x818]
1:1B18  9a711b0000        lcall    0, 0x1b71  ; @1:INT:ord_7(1:3E04)
1:1B1D  a33c0d            mov      word ptr [0xd3c], ax
1:1B20  89163e0d          mov      word ptr [0xd3e], dx
1:1B24  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:1B25  dd46ce            fld      qword ptr [bp - 0x32]
1:1B28  83ec08            sub      sp, 8
1:1B2B  8bdc              mov      bx, sp
1:1B2D  9b                wait       ; @0:OSFIXUP:FISRQQ/FJSRQQ (add,t=5)
1:1B2E  36dd1f            fstp     qword ptr ss:[bx]
1:1B31  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:1B32  9b                wait     
1:1B33  9a571b0000        lcall    0, 0x1b57  ; @1:INT:ord_24(1:3DBE)
1:1B38  83c408            add      sp, 8
1:1B3B  8d7eee            lea      di, [bp - 0x12]
1:1B3E  8bf0              mov      si, ax
1:1B40  16                push     ss
1:1B41  07                pop      es
1:1B42  a5                movsw    word ptr es:[di], word ptr [si]
1:1B43  a5                movsw    word ptr es:[di], word ptr [si]
1:1B44  a5                movsw    word ptr es:[di], word ptr [si]
1:1B45  a5                movsw    word ptr es:[di], word ptr [si]
1:1B46  ff360608          push     word ptr [0x806]
1:1B4A  ff360408          push     word ptr [0x804]
1:1B4E  ff360208          push     word ptr [0x802]
1:1B52  ff360008          push     word ptr [0x800]
1:1B56  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_24(1:3DBE)
1:1B5B  83c408            add      sp, 8
1:1B5E  8bd8              mov      bx, ax
1:1B60  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:1B61  dd07              fld      qword ptr [bx]
1:1B63  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:1B64  dd56f6            fst      qword ptr [bp - 0xa]
1:1B67  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:1B68  dc7eee            fdivr    qword ptr [bp - 0x12]
1:1B6B  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:1B6C  dc0e1808          fmul     qword ptr [0x818]
1:1B70  9afa170000        lcall    0, 0x17fa  ; @1:INT:ord_7(1:3E04)
1:1B75  a3840d            mov      word ptr [0xd84], ax
1:1B78  8916860d          mov      word ptr [0xd86], dx
1:1B7C  5e                pop      si
1:1B7D  5f                pop      di
1:1B7E  4d                dec      bp
1:1B7F  4d                dec      bp
1:1B80  8be5              mov      sp, bp
1:1B82  1f                pop      ds
1:1B83  5d                pop      bp
1:1B84  4d                dec      bp
1:1B85  cb                retf     
1:1B86  1e                push     ds
1:1B87  58                pop      ax
1:1B88  90                nop      
1:1B89  45                inc      bp
1:1B8A  55                push     bp
1:1B8B  8bec              mov      bp, sp
1:1B8D  1e                push     ds
1:1B8E  8ed8              mov      ds, ax
1:1B90  83ec16            sub      sp, 0x16
1:1B93  56                push     si
1:1B94  a1e60a            mov      ax, word ptr [0xae6]
1:1B97  a3140a            mov      word ptr [0xa14], ax
1:1B9A  833e620dff        cmp      word ptr [0xd62], -1
1:1B9F  752b              jne      0x1bcc
1:1BA1  833e640dff        cmp      word ptr [0xd64], -1
1:1BA6  7524              jne      0x1bcc
1:1BA8  ff36de0a          push     word ptr [0xade]
1:1BAC  ff36dc0a          push     word ptr [0xadc]
1:1BB0  ff36de0a          push     word ptr [0xade]
1:1BB4  ff36dc0a          push     word ptr [0xadc]
1:1BB8  9a031c0000        lcall    0, 0x1c03  ; @1:INT:ord_5(1:3C56)
1:1BBD  2d0100            sub      ax, 1
1:1BC0  83da00            sbb      dx, 0
1:1BC3  8946fa            mov      word ptr [bp - 6], ax
1:1BC6  8956fc            mov      word ptr [bp - 4], dx
1:1BC9  e99000            jmp      0x1c5c
1:1BCC  a1620d            mov      ax, word ptr [0xd62]
1:1BCF  8b16640d          mov      dx, word ptr [0xd64]
1:1BD3  ebee              jmp      0x1bc3
1:1BD5  0bd2              or       dx, dx
1:1BD7  7d56              jge      0x1c2f
1:1BD9  f7d8              neg      ax
1:1BDB  83d200            adc      dx, 0
1:1BDE  f7da              neg      dx
1:1BE0  52                push     dx
1:1BE1  50                push     ax
1:1BE2  9a871c0000        lcall    0, 0x1c87  ; @1:INT:ord_23(1:3614)
1:1BE7  5b                pop      bx
1:1BE8  5b                pop      bx
1:1BE9  b108              mov      cl, 8
1:1BEB  9afc1b0000        lcall    0, 0x1bfc  ; @1:INT:ord_21(1:3D34)
1:1BF0  52                push     dx
1:1BF1  50                push     ax
1:1BF2  a13c0d            mov      ax, word ptr [0xd3c]
1:1BF5  8b163e0d          mov      dx, word ptr [0xd3e]
1:1BF9  b108              mov      cl, 8
1:1BFB  9a901c0000        lcall    0, 0x1c90  ; @1:INT:ord_21(1:3D34)
1:1C00  52                push     dx
1:1C01  50                push     ax
1:1C02  9aa71c0000        lcall    0, 0x1ca7  ; @1:INT:ord_5(1:3C56)
1:1C07  0306840d          add      ax, word ptr [0xd84]
1:1C0B  1316860d          adc      dx, word ptr [0xd86]
1:1C0F  52                push     dx
1:1C10  50                push     ax
1:1C11  9ab61c0000        lcall    0, 0x1cb6  ; @1:INT:ord_22(1:368C)
1:1C16  5b                pop      bx
1:1C17  5b                pop      bx
1:1C18  f7d8              neg      ax
1:1C1A  83d200            adc      dx, 0
1:1C1D  f7da              neg      dx
1:1C1F  8b5efa            mov      bx, word ptr [bp - 6]
1:1C22  d1e3              shl      bx, 1
1:1C24  d1e3              shl      bx, 1
1:1C26  8b36140a          mov      si, word ptr [0xa14]
1:1C2A  8900              mov      word ptr [bx + si], ax
1:1C2C  895002            mov      word ptr [bx + si + 2], dx
1:1C2F  8b5efa            mov      bx, word ptr [bp - 6]
1:1C32  d1e3              shl      bx, 1
1:1C34  d1e3              shl      bx, 1
1:1C36  8b36140a          mov      si, word ptr [0xa14]
1:1C3A  83780201          cmp      word ptr [bx + si + 2], 1
1:1C3E  7c14              jl       0x1c54
1:1C40  7f06              jg       0x1c48
1:1C42  8138a086          cmp      word ptr [bx + si], 0x86a0
1:1C46  760c              jbe      0x1c54
1:1C48  b88601            mov      ax, 0x186
1:1C4B  1e                push     ds
1:1C4C  50                push     ax
1:1C4D  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.OutputDebugString
1:1C52  eb0e              jmp      0x1c62
1:1C54  836efa01          sub      word ptr [bp - 6], 1
1:1C58  835efc00          sbb      word ptr [bp - 4], 0
1:1C5C  837efc00          cmp      word ptr [bp - 4], 0
1:1C60  7c61              jl       0x1cc3
1:1C62  8b5efa            mov      bx, word ptr [bp - 6]
1:1C65  d1e3              shl      bx, 1
1:1C67  d1e3              shl      bx, 1
1:1C69  8b36140a          mov      si, word ptr [0xa14]
1:1C6D  8b00              mov      ax, word ptr [bx + si]
1:1C6F  8b5002            mov      dx, word ptr [bx + si + 2]
1:1C72  0bd2              or       dx, dx
1:1C74  7d03              jge      0x1c79
1:1C76  e95cff            jmp      0x1bd5
1:1C79  7f07              jg       0x1c82
1:1C7B  0bc0              or       ax, ax
1:1C7D  7503              jne      0x1c82
1:1C7F  e953ff            jmp      0x1bd5
1:1C82  52                push     dx
1:1C83  50                push     ax
1:1C84  8bf3              mov      si, bx
1:1C86  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_23(1:3614)
1:1C8B  5b                pop      bx
1:1C8C  5b                pop      bx
1:1C8D  b108              mov      cl, 8
1:1C8F  9aa01c0000        lcall    0, 0x1ca0  ; @1:INT:ord_21(1:3D34)
1:1C94  52                push     dx
1:1C95  50                push     ax
1:1C96  a13c0d            mov      ax, word ptr [0xd3c]
1:1C99  8b163e0d          mov      dx, word ptr [0xd3e]
1:1C9D  b108              mov      cl, 8
1:1C9F  9afa180000        lcall    0, 0x18fa  ; @1:INT:ord_21(1:3D34)
1:1CA4  52                push     dx
1:1CA5  50                push     ax
1:1CA6  9a31120000        lcall    0, 0x1231  ; @1:INT:ord_5(1:3C56)
1:1CAB  0306840d          add      ax, word ptr [0xd84]
1:1CAF  1316860d          adc      dx, word ptr [0xd86]
1:1CB3  52                push     dx
1:1CB4  50                push     ax
1:1CB5  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_22(1:368C)
1:1CBA  5b                pop      bx
1:1CBB  5b                pop      bx
1:1CBC  8b1e140a          mov      bx, word ptr [0xa14]
1:1CC0  e967ff            jmp      0x1c2a
1:1CC3  837efaff          cmp      word ptr [bp - 6], -1
1:1CC7  750b              jne      0x1cd4
1:1CC9  837efcff          cmp      word ptr [bp - 4], -1
1:1CCD  7505              jne      0x1cd4
1:1CCF  b80100            mov      ax, 1
1:1CD2  eb02              jmp      0x1cd6
1:1CD4  2bc0              sub      ax, ax
1:1CD6  5e                pop      si
1:1CD7  4d                dec      bp
1:1CD8  4d                dec      bp
1:1CD9  8be5              mov      sp, bp
1:1CDB  1f                pop      ds
1:1CDC  5d                pop      bp
1:1CDD  4d                dec      bp
1:1CDE  cb                retf     
1:1CDF  1e                push     ds
1:1CE0  58                pop      ax
1:1CE1  90                nop      
1:1CE2  45                inc      bp
1:1CE3  55                push     bp
1:1CE4  8bec              mov      bp, sp
1:1CE6  1e                push     ds
1:1CE7  8ed8              mov      ds, ax
1:1CE9  83ec18            sub      sp, 0x18
1:1CEC  57                push     di
1:1CED  56                push     si
1:1CEE  836e1201          sub      word ptr [bp + 0x12], 1
1:1CF2  835e1400          sbb      word ptr [bp + 0x14], 0
1:1CF6  8b36e60a          mov      si, word ptr [0xae6]
1:1CFA  8b460e            mov      ax, word ptr [bp + 0xe]
1:1CFD  8b5610            mov      dx, word ptr [bp + 0x10]
1:1D00  034606            add      ax, word ptr [bp + 6]
1:1D03  135608            adc      dx, word ptr [bp + 8]
1:1D06  d1fa              sar      dx, 1
1:1D08  d1d8              rcr      ax, 1
1:1D0A  8946fa            mov      word ptr [bp - 6], ax
1:1D0D  8956fc            mov      word ptr [bp - 4], dx
1:1D10  8b4e0e            mov      cx, word ptr [bp + 0xe]
1:1D13  8b5e10            mov      bx, word ptr [bp + 0x10]
1:1D16  034e0a            add      cx, word ptr [bp + 0xa]
1:1D19  135e0c            adc      bx, word ptr [bp + 0xc]
1:1D1C  d1fb              sar      bx, 1
1:1D1E  d1d9              rcr      cx, 1
1:1D20  894ef6            mov      word ptr [bp - 0xa], cx
1:1D23  895ef8            mov      word ptr [bp - 8], bx
1:1D26  8b4e0a            mov      cx, word ptr [bp + 0xa]
1:1D29  8b5e0c            mov      bx, word ptr [bp + 0xc]
1:1D2C  034e06            add      cx, word ptr [bp + 6]
1:1D2F  135e08            adc      bx, word ptr [bp + 8]
1:1D32  d1fb              sar      bx, 1
1:1D34  d1d9              rcr      cx, 1
1:1D36  894eee            mov      word ptr [bp - 0x12], cx
1:1D39  895ef0            mov      word ptr [bp - 0x10], bx
1:1D3C  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:1D3D  dd06460d          fld      qword ptr [0xd46]
1:1D41  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:1D42  dc167007          fcom     qword ptr [0x770]
1:1D46  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:1D47  ddd8              fstp     st(0)
1:1D49  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:1D4A  dd7eec            fnstsw   word ptr [bp - 0x14]
1:1D4D  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:1D4E  9b                wait     
1:1D4F  8a66ed            mov      ah, byte ptr [bp - 0x13]
1:1D52  9e                sahf     
1:1D53  7203              jb       0x1d58
1:1D55  e9b100            jmp      0x1e09
1:1D58  8b5efa            mov      bx, word ptr [bp - 6]
1:1D5B  d1e3              shl      bx, 1
1:1D5D  d1e3              shl      bx, 1
1:1D5F  833800            cmp      word ptr [bx + si], 0
1:1D62  752c              jne      0x1d90
1:1D64  8178020080        cmp      word ptr [bx + si + 2], 0x8000
1:1D69  7525              jne      0x1d90
1:1D6B  8bc3              mov      ax, bx
1:1D6D  8b5e0e            mov      bx, word ptr [bp + 0xe]
1:1D70  d1e3              shl      bx, 1
1:1D72  d1e3              shl      bx, 1
1:1D74  8b08              mov      cx, word ptr [bx + si]
1:1D76  8b5002            mov      dx, word ptr [bx + si + 2]
1:1D79  8b5e06            mov      bx, word ptr [bp + 6]
1:1D7C  d1e3              shl      bx, 1
1:1D7E  d1e3              shl      bx, 1
1:1D80  0308              add      cx, word ptr [bx + si]
1:1D82  135002            adc      dx, word ptr [bx + si + 2]
1:1D85  d1fa              sar      dx, 1
1:1D87  d1d9              rcr      cx, 1
1:1D89  8bd8              mov      bx, ax
1:1D8B  8908              mov      word ptr [bx + si], cx
1:1D8D  895002            mov      word ptr [bx + si + 2], dx
1:1D90  8b5ef6            mov      bx, word ptr [bp - 0xa]
1:1D93  d1e3              shl      bx, 1
1:1D95  d1e3              shl      bx, 1
1:1D97  833800            cmp      word ptr [bx + si], 0
1:1D9A  752c              jne      0x1dc8
1:1D9C  8178020080        cmp      word ptr [bx + si + 2], 0x8000
1:1DA1  7525              jne      0x1dc8
1:1DA3  8bc3              mov      ax, bx
1:1DA5  8b5e0e            mov      bx, word ptr [bp + 0xe]
1:1DA8  d1e3              shl      bx, 1
1:1DAA  d1e3              shl      bx, 1
1:1DAC  8b08              mov      cx, word ptr [bx + si]
1:1DAE  8b5002            mov      dx, word ptr [bx + si + 2]
1:1DB1  8b5e0a            mov      bx, word ptr [bp + 0xa]
1:1DB4  d1e3              shl      bx, 1
1:1DB6  d1e3              shl      bx, 1
1:1DB8  0308              add      cx, word ptr [bx + si]
1:1DBA  135002            adc      dx, word ptr [bx + si + 2]
1:1DBD  d1fa              sar      dx, 1
1:1DBF  d1d9              rcr      cx, 1
1:1DC1  8bd8              mov      bx, ax
1:1DC3  8908              mov      word ptr [bx + si], cx
1:1DC5  895002            mov      word ptr [bx + si + 2], dx
1:1DC8  8b5eee            mov      bx, word ptr [bp - 0x12]
1:1DCB  d1e3              shl      bx, 1
1:1DCD  d1e3              shl      bx, 1
1:1DCF  833800            cmp      word ptr [bx + si], 0
1:1DD2  7403              je       0x1dd7
1:1DD4  e95d01            jmp      0x1f34
1:1DD7  8178020080        cmp      word ptr [bx + si + 2], 0x8000
1:1DDC  7403              je       0x1de1
1:1DDE  e95301            jmp      0x1f34
1:1DE1  8bc3              mov      ax, bx
1:1DE3  8b5e0a            mov      bx, word ptr [bp + 0xa]
1:1DE6  d1e3              shl      bx, 1
1:1DE8  d1e3              shl      bx, 1
1:1DEA  8b08              mov      cx, word ptr [bx + si]
1:1DEC  8b5002            mov      dx, word ptr [bx + si + 2]
1:1DEF  8b5e06            mov      bx, word ptr [bp + 6]
1:1DF2  d1e3              shl      bx, 1
1:1DF4  d1e3              shl      bx, 1
1:1DF6  0308              add      cx, word ptr [bx + si]
1:1DF8  135002            adc      dx, word ptr [bx + si + 2]
1:1DFB  d1fa              sar      dx, 1
1:1DFD  d1d9              rcr      cx, 1
1:1DFF  8bd8              mov      bx, ax
1:1E01  8908              mov      word ptr [bx + si], cx
1:1E03  895002            mov      word ptr [bx + si + 2], dx
1:1E06  e92b01            jmp      0x1f34
1:1E09  8b5e12            mov      bx, word ptr [bp + 0x12]
1:1E0C  d1e3              shl      bx, 1
1:1E0E  d1e3              shl      bx, 1
1:1E10  8b87880d          mov      ax, word ptr [bx + 0xd88]
1:1E14  8b978a0d          mov      dx, word ptr [bx + 0xd8a]
1:1E18  8946f2            mov      word ptr [bp - 0xe], ax
1:1E1B  8956f4            mov      word ptr [bp - 0xc], dx
1:1E1E  8b5efa            mov      bx, word ptr [bp - 6]
1:1E21  d1e3              shl      bx, 1
1:1E23  d1e3              shl      bx, 1
1:1E25  833800            cmp      word ptr [bx + si], 0
1:1E28  754a              jne      0x1e74
1:1E2A  8178020080        cmp      word ptr [bx + si + 2], 0x8000
1:1E2F  7543              jne      0x1e74
1:1E31  52                push     dx
1:1E32  50                push     ax
1:1E33  f7d8              neg      ax
1:1E35  83d200            adc      dx, 0
1:1E38  f7da              neg      dx
1:1E3A  52                push     dx
1:1E3B  50                push     ax
1:1E3C  8bfb              mov      di, bx
1:1E3E  0e                push     cs
1:1E3F  e833f4            call     0x1275
1:1E42  83c408            add      sp, 8
1:1E45  8b5e0e            mov      bx, word ptr [bp + 0xe]
1:1E48  d1e3              shl      bx, 1
1:1E4A  d1e3              shl      bx, 1
1:1E4C  8946e8            mov      word ptr [bp - 0x18], ax
1:1E4F  8956ea            mov      word ptr [bp - 0x16], dx
1:1E52  8b00              mov      ax, word ptr [bx + si]
1:1E54  8b5002            mov      dx, word ptr [bx + si + 2]
1:1E57  8b5e06            mov      bx, word ptr [bp + 6]
1:1E5A  d1e3              shl      bx, 1
1:1E5C  d1e3              shl      bx, 1
1:1E5E  0300              add      ax, word ptr [bx + si]
1:1E60  135002            adc      dx, word ptr [bx + si + 2]
1:1E63  d1fa              sar      dx, 1
1:1E65  d1d8              rcr      ax, 1
1:1E67  0346e8            add      ax, word ptr [bp - 0x18]
1:1E6A  1356ea            adc      dx, word ptr [bp - 0x16]
1:1E6D  03fe              add      di, si
1:1E6F  8905              mov      word ptr [di], ax
1:1E71  895502            mov      word ptr [di + 2], dx
1:1E74  8b5ef6            mov      bx, word ptr [bp - 0xa]
1:1E77  d1e3              shl      bx, 1
1:1E79  d1e3              shl      bx, 1
1:1E7B  833800            cmp      word ptr [bx + si], 0
1:1E7E  7554              jne      0x1ed4
1:1E80  8178020080        cmp      word ptr [bx + si + 2], 0x8000
1:1E85  754d              jne      0x1ed4
1:1E87  ff76f4            push     word ptr [bp - 0xc]
1:1E8A  ff76f2            push     word ptr [bp - 0xe]
1:1E8D  8b46f2            mov      ax, word ptr [bp - 0xe]
1:1E90  8b56f4            mov      dx, word ptr [bp - 0xc]
1:1E93  f7d8              neg      ax
1:1E95  83d200            adc      dx, 0
1:1E98  f7da              neg      dx
1:1E9A  52                push     dx
1:1E9B  50                push     ax
1:1E9C  8bfb              mov      di, bx
1:1E9E  0e                push     cs
1:1E9F  e8d3f3            call     0x1275
1:1EA2  83c408            add      sp, 8
1:1EA5  8b5e0e            mov      bx, word ptr [bp + 0xe]
1:1EA8  d1e3              shl      bx, 1
1:1EAA  d1e3              shl      bx, 1
1:1EAC  8946e8            mov      word ptr [bp - 0x18], ax
1:1EAF  8956ea            mov      word ptr [bp - 0x16], dx
1:1EB2  8b00              mov      ax, word ptr [bx + si]
1:1EB4  8b5002            mov      dx, word ptr [bx + si + 2]
1:1EB7  8b5e0a            mov      bx, word ptr [bp + 0xa]
1:1EBA  d1e3              shl      bx, 1
1:1EBC  d1e3              shl      bx, 1
1:1EBE  0300              add      ax, word ptr [bx + si]
1:1EC0  135002            adc      dx, word ptr [bx + si + 2]
1:1EC3  d1fa              sar      dx, 1
1:1EC5  d1d8              rcr      ax, 1
1:1EC7  0346e8            add      ax, word ptr [bp - 0x18]
1:1ECA  1356ea            adc      dx, word ptr [bp - 0x16]
1:1ECD  03fe              add      di, si
1:1ECF  8905              mov      word ptr [di], ax
1:1ED1  895502            mov      word ptr [di + 2], dx
1:1ED4  8b5eee            mov      bx, word ptr [bp - 0x12]
1:1ED7  d1e3              shl      bx, 1
1:1ED9  d1e3              shl      bx, 1
1:1EDB  833800            cmp      word ptr [bx + si], 0
1:1EDE  7554              jne      0x1f34
1:1EE0  8178020080        cmp      word ptr [bx + si + 2], 0x8000
1:1EE5  754d              jne      0x1f34
1:1EE7  ff76f4            push     word ptr [bp - 0xc]
1:1EEA  ff76f2            push     word ptr [bp - 0xe]
1:1EED  8b46f2            mov      ax, word ptr [bp - 0xe]
1:1EF0  8b56f4            mov      dx, word ptr [bp - 0xc]
1:1EF3  f7d8              neg      ax
1:1EF5  83d200            adc      dx, 0
1:1EF8  f7da              neg      dx
1:1EFA  52                push     dx
1:1EFB  50                push     ax
1:1EFC  8bfb              mov      di, bx
1:1EFE  0e                push     cs
1:1EFF  e873f3            call     0x1275
1:1F02  83c408            add      sp, 8
1:1F05  8b5e0a            mov      bx, word ptr [bp + 0xa]
1:1F08  d1e3              shl      bx, 1
1:1F0A  d1e3              shl      bx, 1
1:1F0C  8946e8            mov      word ptr [bp - 0x18], ax
1:1F0F  8956ea            mov      word ptr [bp - 0x16], dx
1:1F12  8b00              mov      ax, word ptr [bx + si]
1:1F14  8b5002            mov      dx, word ptr [bx + si + 2]
1:1F17  8b5e06            mov      bx, word ptr [bp + 6]
1:1F1A  d1e3              shl      bx, 1
1:1F1C  d1e3              shl      bx, 1
1:1F1E  0300              add      ax, word ptr [bx + si]
1:1F20  135002            adc      dx, word ptr [bx + si + 2]
1:1F23  d1fa              sar      dx, 1
1:1F25  d1d8              rcr      ax, 1
1:1F27  0346e8            add      ax, word ptr [bp - 0x18]
1:1F2A  1356ea            adc      dx, word ptr [bp - 0x16]
1:1F2D  03fe              add      di, si
1:1F2F  8905              mov      word ptr [di], ax
1:1F31  895502            mov      word ptr [di + 2], dx
1:1F34  8b46fa            mov      ax, word ptr [bp - 6]
1:1F37  8b56fc            mov      dx, word ptr [bp - 4]
1:1F3A  2b46f6            sub      ax, word ptr [bp - 0xa]
1:1F3D  1b56f8            sbb      dx, word ptr [bp - 8]
1:1F40  3dffff            cmp      ax, 0xffff
1:1F43  7507              jne      0x1f4c
1:1F45  3bd0              cmp      dx, ax
1:1F47  7503              jne      0x1f4c
1:1F49  e9b300            jmp      0x1fff
1:1F4C  8b5e12            mov      bx, word ptr [bp + 0x12]
1:1F4F  d1e3              shl      bx, 1
1:1F51  83bf660d04        cmp      word ptr [bx + 0xd66], 4
1:1F56  7503              jne      0x1f5b
1:1F58  e9af00            jmp      0x200a
1:1F5B  8b5e12            mov      bx, word ptr [bp + 0x12]
1:1F5E  d1e3              shl      bx, 1
1:1F60  8b87660d          mov      ax, word ptr [bx + 0xd66]
1:1F64  0bc0              or       ax, ax
1:1F66  740b              je       0x1f73
1:1F68  48                dec      ax
1:1F69  7452              je       0x1fbd
1:1F6B  48                dec      ax
1:1F6C  7469              je       0x1fd7
1:1F6E  48                dec      ax
1:1F6F  7474              je       0x1fe5
1:1F71  eb1f              jmp      0x1f92
1:1F73  ff7614            push     word ptr [bp + 0x14]
1:1F76  ff7612            push     word ptr [bp + 0x12]
1:1F79  ff76fc            push     word ptr [bp - 4]
1:1F7C  ff76fa            push     word ptr [bp - 6]
1:1F7F  ff76f0            push     word ptr [bp - 0x10]
1:1F82  ff76ee            push     word ptr [bp - 0x12]
1:1F85  ff7608            push     word ptr [bp + 8]
1:1F88  ff7606            push     word ptr [bp + 6]
1:1F8B  0e                push     cs
1:1F8C  e850fd            call     0x1cdf
1:1F8F  83c410            add      sp, 0x10
1:1F92  8b5e12            mov      bx, word ptr [bp + 0x12]
1:1F95  d1e3              shl      bx, 1
1:1F97  83bf640d04        cmp      word ptr [bx + 0xd64], 4
1:1F9C  750a              jne      0x1fa8
1:1F9E  c787640d0000      mov      word ptr [bx + 0xd64], 0
1:1FA4  ff87660d          inc      word ptr [bx + 0xd66]
1:1FA8  9a620a0000        lcall    0, 0xa62  ; @1:USER.GetCurrentTime
1:1FAD  3b16e00d          cmp      dx, word ptr [0xde0]
1:1FB1  7299              jb       0x1f4c
1:1FB3  7755              ja       0x200a
1:1FB5  3b06de0d          cmp      ax, word ptr [0xdde]
1:1FB9  7291              jb       0x1f4c
1:1FBB  eb4d              jmp      0x200a
1:1FBD  ff7614            push     word ptr [bp + 0x14]
1:1FC0  ff7612            push     word ptr [bp + 0x12]
1:1FC3  ff76f8            push     word ptr [bp - 8]
1:1FC6  ff76f6            push     word ptr [bp - 0xa]
1:1FC9  ff760c            push     word ptr [bp + 0xc]
1:1FCC  ff760a            push     word ptr [bp + 0xa]
1:1FCF  ff76f0            push     word ptr [bp - 0x10]
1:1FD2  ff76ee            push     word ptr [bp - 0x12]
1:1FD5  ebb4              jmp      0x1f8b
1:1FD7  ff7614            push     word ptr [bp + 0x14]
1:1FDA  ff7612            push     word ptr [bp + 0x12]
1:1FDD  ff76f0            push     word ptr [bp - 0x10]
1:1FE0  ff76ee            push     word ptr [bp - 0x12]
1:1FE3  eb0c              jmp      0x1ff1
1:1FE5  ff7614            push     word ptr [bp + 0x14]
1:1FE8  ff7612            push     word ptr [bp + 0x12]
1:1FEB  ff7610            push     word ptr [bp + 0x10]
1:1FEE  ff760e            push     word ptr [bp + 0xe]
1:1FF1  ff76f8            push     word ptr [bp - 8]
1:1FF4  ff76f6            push     word ptr [bp - 0xa]
1:1FF7  ff76fc            push     word ptr [bp - 4]
1:1FFA  ff76fa            push     word ptr [bp - 6]
1:1FFD  eb8c              jmp      0x1f8b
1:1FFF  8b5e12            mov      bx, word ptr [bp + 0x12]
1:2002  d1e3              shl      bx, 1
1:2004  c787660d0400      mov      word ptr [bx + 0xd66], 4
1:200A  5e                pop      si
1:200B  5f                pop      di
1:200C  4d                dec      bp
1:200D  4d                dec      bp
1:200E  8be5              mov      sp, bp
1:2010  1f                pop      ds
1:2011  5d                pop      bp
1:2012  4d                dec      bp
1:2013  cb                retf     

; ===== EXPORT:ord_27(#27) =====
1:2014  1e                push     ds
1:2015  58                pop      ax
1:2016  90                nop      
1:2017  45                inc      bp
1:2018  55                push     bp
1:2019  8bec              mov      bp, sp
1:201B  1e                push     ds
1:201C  8ed8              mov      ds, ax
1:201E  56                push     si
1:201F  8b5e06            mov      bx, word ptr [bp + 6]
1:2022  8d7708            lea      si, [bx + 8]
1:2025  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2026  dd04              fld      qword ptr [si]
1:2028  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2029  dc0e2008          fmul     qword ptr [0x820]
1:202D  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:202E  dc07              fadd     qword ptr [bx]
1:2030  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2031  dd17              fst      qword ptr [bx]
1:2033  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2034  dc0e1c0e          fmul     qword ptr [0xe1c]
1:2038  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2039  dd1f              fstp     qword ptr [bx]
1:203B  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:203C  df06020d          fild     word ptr [0xd02]
1:2040  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2041  dc07              fadd     qword ptr [bx]
1:2043  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2044  dd1f              fstp     qword ptr [bx]
1:2046  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2047  dd04              fld      qword ptr [si]
1:2049  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:204A  dc0ec40a          fmul     qword ptr [0xac4]
1:204E  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:204F  dd1e160a          fstp     qword ptr [0xa16]
1:2053  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:2054  9b                wait     
1:2055  8d5f10            lea      bx, [bx + 0x10]
1:2058  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2059  dd07              fld      qword ptr [bx]
1:205B  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:205C  dc0ed00a          fmul     qword ptr [0xad0]
1:2060  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2061  dd161e0a          fst      qword ptr [0xa1e]
1:2065  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2066  dc0e280b          fmul     qword ptr [0xb28]
1:206A  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:206B  dd06100b          fld      qword ptr [0xb10]
1:206F  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2070  dc0e160a          fmul     qword ptr [0xa16]
1:2074  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2075  dec1              faddp    st(1)
1:2077  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2078  de061c0d          fiadd    word ptr [0xd1c]
1:207C  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:207D  dd1c              fstp     qword ptr [si]
1:207F  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2080  dd06300b          fld      qword ptr [0xb30]
1:2084  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2085  dc0e1e0a          fmul     qword ptr [0xa1e]
1:2089  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:208A  dd06180b          fld      qword ptr [0xb18]
1:208E  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:208F  dc0e160a          fmul     qword ptr [0xa16]
1:2093  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2094  dec1              faddp    st(1)
1:2096  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2097  de061e0d          fiadd    word ptr [0xd1e]
1:209B  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:209C  dd1f              fstp     qword ptr [bx]
1:209E  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:209F  9b                wait     
1:20A0  5e                pop      si
1:20A1  4d                dec      bp
1:20A2  4d                dec      bp
1:20A3  8be5              mov      sp, bp
1:20A5  1f                pop      ds
1:20A6  5d                pop      bp
1:20A7  4d                dec      bp
1:20A8  cb                retf     
1:20A9  1e                push     ds
1:20AA  58                pop      ax
1:20AB  90                nop      
1:20AC  45                inc      bp
1:20AD  55                push     bp
1:20AE  8bec              mov      bp, sp
1:20B0  1e                push     ds
1:20B1  8ed8              mov      ds, ax
1:20B3  83ec2a            sub      sp, 0x2a
1:20B6  57                push     di
1:20B7  56                push     si
1:20B8  833edc0c00        cmp      word ptr [0xcdc], 0
1:20BD  7568              jne      0x2127
1:20BF  8b5e12            mov      bx, word ptr [bp + 0x12]
1:20C2  c7070000          mov      word ptr [bx], 0
1:20C6  c74702ffff        mov      word ptr [bx + 2], 0xffff
1:20CB  837e0800          cmp      word ptr [bp + 8], 0
1:20CF  7c33              jl       0x2104
1:20D1  7f06              jg       0x20d9
1:20D3  837e0600          cmp      word ptr [bp + 6], 0
1:20D7  742b              je       0x2104
1:20D9  ff36600d          push     word ptr [0xd60]
1:20DD  ff365e0d          push     word ptr [0xd5e]
1:20E1  b800d0            mov      ax, 0xd000
1:20E4  99                cdq      
1:20E5  52                push     dx
1:20E6  50                push     ax
1:20E7  ff7608            push     word ptr [bp + 8]
1:20EA  ff7606            push     word ptr [bp + 6]
1:20ED  9a68210000        lcall    0, 0x2168  ; @1:INT:ord_5(1:3C56)
1:20F2  52                push     dx
1:20F3  50                push     ax
1:20F4  9a40210000        lcall    0, 0x2140  ; @1:INT:ord_8(1:3BBC)
1:20F9  2d0150            sub      ax, 0x5001
1:20FC  8b5e12            mov      bx, word ptr [bp + 0x12]
1:20FF  894704            mov      word ptr [bx + 4], ax
1:2102  eb08              jmp      0x210c
1:2104  8b5e12            mov      bx, word ptr [bp + 0x12]
1:2107  c74704ffaf        mov      word ptr [bx + 4], 0xafff
1:210C  8b5e12            mov      bx, word ptr [bp + 0x12]
1:210F  8b4704            mov      ax, word ptr [bx + 4]
1:2112  2bd2              sub      dx, dx
1:2114  8956fc            mov      word ptr [bp - 4], dx
1:2117  8956fa            mov      word ptr [bp - 6], dx
1:211A  8956f8            mov      word ptr [bp - 8], dx
1:211D  8946f6            mov      word ptr [bp - 0xa], ax
1:2120  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2121  df6ef6            fild     qword ptr [bp - 0xa]
1:2124  e99701            jmp      0x22be
1:2127  833edc0c01        cmp      word ptr [0xcdc], 1
1:212C  7403              je       0x2131
1:212E  e99801            jmp      0x22c9
1:2131  b83200            mov      ax, 0x32
1:2134  99                cdq      
1:2135  52                push     dx
1:2136  50                push     ax
1:2137  ff36600d          push     word ptr [0xd60]
1:213B  ff365e0d          push     word ptr [0xd5e]
1:213F  9a6f210000        lcall    0, 0x216f  ; @1:INT:ord_8(1:3BBC)
1:2144  3b5608            cmp      dx, word ptr [bp + 8]
1:2147  7e03              jle      0x214c
1:2149  e98400            jmp      0x21d0
1:214C  7c05              jl       0x2153
1:214E  3b4606            cmp      ax, word ptr [bp + 6]
1:2151  737d              jae      0x21d0
1:2153  ff36600d          push     word ptr [0xd60]
1:2157  ff365e0d          push     word ptr [0xd5e]
1:215B  b85555            mov      ax, 0x5555
1:215E  99                cdq      
1:215F  52                push     dx
1:2160  50                push     ax
1:2161  ff7608            push     word ptr [bp + 8]
1:2164  ff7606            push     word ptr [bp + 6]
1:2167  9a90210000        lcall    0, 0x2190  ; @1:INT:ord_5(1:3C56)
1:216C  52                push     dx
1:216D  50                push     ax
1:216E  9a97210000        lcall    0, 0x2197  ; @1:INT:ord_8(1:3BBC)
1:2173  2d5655            sub      ax, 0x5556
1:2176  8b5e12            mov      bx, word ptr [bp + 0x12]
1:2179  8907              mov      word ptr [bx], ax
1:217B  ff36600d          push     word ptr [0xd60]
1:217F  ff365e0d          push     word ptr [0xd5e]
1:2183  b8cdcc            mov      ax, 0xcccd
1:2186  99                cdq      
1:2187  52                push     dx
1:2188  50                push     ax
1:2189  ff7608            push     word ptr [bp + 8]
1:218C  ff7606            push     word ptr [bp + 6]
1:218F  9ab9210000        lcall    0, 0x21b9  ; @1:INT:ord_5(1:3C56)
1:2194  52                push     dx
1:2195  50                push     ax
1:2196  9ac0210000        lcall    0, 0x21c0  ; @1:INT:ord_8(1:3BBC)
1:219B  2d6766            sub      ax, 0x6667
1:219E  8b5e12            mov      bx, word ptr [bp + 0x12]
1:21A1  894702            mov      word ptr [bx + 2], ax
1:21A4  ff36600d          push     word ptr [0xd60]
1:21A8  ff365e0d          push     word ptr [0xd5e]
1:21AC  b81111            mov      ax, 0x1111
1:21AF  99                cdq      
1:21B0  52                push     dx
1:21B1  50                push     ax
1:21B2  ff7608            push     word ptr [bp + 8]
1:21B5  ff7606            push     word ptr [bp + 6]
1:21B8  9af1210000        lcall    0, 0x21f1  ; @1:INT:ord_5(1:3C56)
1:21BD  52                push     dx
1:21BE  50                push     ax
1:21BF  9ae2220000        lcall    0, 0x22e2  ; @1:INT:ord_8(1:3BBC)
1:21C4  2d1211            sub      ax, 0x1112
1:21C7  8b5e12            mov      bx, word ptr [bp + 0x12]
1:21CA  894704            mov      word ptr [bx + 4], ax
1:21CD  e9d600            jmp      0x22a6
1:21D0  837e0800          cmp      word ptr [bp + 8], 0
1:21D4  7d03              jge      0x21d9
1:21D6  e9bc00            jmp      0x2295
1:21D9  7f09              jg       0x21e4
1:21DB  837e0600          cmp      word ptr [bp + 6], 0
1:21DF  7503              jne      0x21e4
1:21E1  e9b100            jmp      0x2295
1:21E4  b83200            mov      ax, 0x32
1:21E7  99                cdq      
1:21E8  52                push     dx
1:21E9  50                push     ax
1:21EA  ff7608            push     word ptr [bp + 8]
1:21ED  ff7606            push     word ptr [bp + 6]
1:21F0  9a84230000        lcall    0, 0x2384  ; @1:INT:ord_5(1:3C56)
1:21F5  8956f4            mov      word ptr [bp - 0xc], dx
1:21F8  8946f2            mov      word ptr [bp - 0xe], ax
1:21FB  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:21FC  db46f2            fild     dword ptr [bp - 0xe]
1:21FF  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2200  da365e0d          fidiv    dword ptr [0xd5e]
1:2204  83ec08            sub      sp, 8
1:2207  8bdc              mov      bx, sp
1:2209  9b                wait       ; @0:OSFIXUP:FISRQQ/FJSRQQ (add,t=5)
1:220A  36dd1f            fstp     qword ptr ss:[bx]
1:220D  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:220E  9b                wait     
1:220F  9a2f220000        lcall    0, 0x222f  ; @1:INT:ord_25(1:3DAC)
1:2214  83c408            add      sp, 8
1:2217  8d7ef6            lea      di, [bp - 0xa]
1:221A  8bf0              mov      si, ax
1:221C  16                push     ss
1:221D  07                pop      es
1:221E  a5                movsw    word ptr es:[di], word ptr [si]
1:221F  a5                movsw    word ptr es:[di], word ptr [si]
1:2220  a5                movsw    word ptr es:[di], word ptr [si]
1:2221  a5                movsw    word ptr es:[di], word ptr [si]
1:2222  ff76fc            push     word ptr [bp - 4]
1:2225  ff76fa            push     word ptr [bp - 6]
1:2228  ff76f8            push     word ptr [bp - 8]
1:222B  ff76f6            push     word ptr [bp - 0xa]
1:222E  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_25(1:3DAC)
1:2233  83c408            add      sp, 8
1:2236  8d7ef6            lea      di, [bp - 0xa]
1:2239  8bf0              mov      si, ax
1:223B  16                push     ss
1:223C  07                pop      es
1:223D  a5                movsw    word ptr es:[di], word ptr [si]
1:223E  a5                movsw    word ptr es:[di], word ptr [si]
1:223F  a5                movsw    word ptr es:[di], word ptr [si]
1:2240  a5                movsw    word ptr es:[di], word ptr [si]
1:2241  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2242  d9e8              fld1     
1:2244  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2245  dc66f6            fsub     qword ptr [bp - 0xa]
1:2248  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2249  dd56ea            fst      qword ptr [bp - 0x16]
1:224C  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:224D  dc0e2808          fmul     qword ptr [0x828]
1:2251  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2252  dd46f6            fld      qword ptr [bp - 0xa]
1:2255  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2256  dc0e3008          fmul     qword ptr [0x830]
1:225A  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:225B  dec1              faddp    st(1)
1:225D  9a71220000        lcall    0, 0x2271  ; @1:INT:ord_7(1:3E04)
1:2262  8b5e12            mov      bx, word ptr [bp + 0x12]
1:2265  8907              mov      word ptr [bx], ax
1:2267  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2268  dd46f6            fld      qword ptr [bp - 0xa]
1:226B  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:226C  dc0e3808          fmul     qword ptr [0x838]
1:2270  9a8e220000        lcall    0, 0x228e  ; @1:INT:ord_7(1:3E04)
1:2275  894702            mov      word ptr [bx + 2], ax
1:2278  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2279  dd46ea            fld      qword ptr [bp - 0x16]
1:227C  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:227D  dc0e4008          fmul     qword ptr [0x840]
1:2281  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2282  dd46f6            fld      qword ptr [bp - 0xa]
1:2285  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2286  dc0e4808          fmul     qword ptr [0x848]
1:228A  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:228B  dec1              faddp    st(1)
1:228D  9a191b0000        lcall    0, 0x1b19  ; @1:INT:ord_7(1:3E04)
1:2292  e935ff            jmp      0x21ca
1:2295  8b5e12            mov      bx, word ptr [bp + 0x12]
1:2298  c707aaaa          mov      word ptr [bx], 0xaaaa
1:229C  c747020000        mov      word ptr [bx + 2], 0
1:22A1  c74704ff9f        mov      word ptr [bx + 4], 0x9fff
1:22A6  8b5e12            mov      bx, word ptr [bp + 0x12]
1:22A9  8b4704            mov      ax, word ptr [bx + 4]
1:22AC  2bd2              sub      dx, dx
1:22AE  8956f0            mov      word ptr [bp - 0x10], dx
1:22B1  8956ee            mov      word ptr [bp - 0x12], dx
1:22B4  8956ec            mov      word ptr [bp - 0x14], dx
1:22B7  8946ea            mov      word ptr [bp - 0x16], ax
1:22BA  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:22BB  df6eea            fild     qword ptr [bp - 0x16]
1:22BE  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:22BF  dd460a            fld      qword ptr [bp + 0xa]
1:22C2  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:22C3  dc4e0a            fmul     qword ptr [bp + 0xa]
1:22C6  e95304            jmp      0x271c
1:22C9  833edc0c02        cmp      word ptr [0xcdc], 2
1:22CE  7403              je       0x22d3
1:22D0  e93e01            jmp      0x2411
1:22D3  b80a00            mov      ax, 0xa
1:22D6  99                cdq      
1:22D7  52                push     dx
1:22D8  50                push     ax
1:22D9  ff36600d          push     word ptr [0xd60]
1:22DD  ff365e0d          push     word ptr [0xd5e]
1:22E1  9a40230000        lcall    0, 0x2340  ; @1:INT:ord_8(1:3BBC)
1:22E6  05c409            add      ax, 0x9c4
1:22E9  83d200            adc      dx, 0
1:22EC  b102              mov      cl, 2
1:22EE  9a42020000        lcall    0, 0x242  ; @1:INT:ord_6(1:3D28)
1:22F3  8946ea            mov      word ptr [bp - 0x16], ax
1:22F6  8956ec            mov      word ptr [bp - 0x14], dx
1:22F9  052823            add      ax, 0x2328
1:22FC  83d200            adc      dx, 0
1:22FF  3b5608            cmp      dx, word ptr [bp + 8]
1:2302  7f0e              jg       0x2312
1:2304  7c05              jl       0x230b
1:2306  3b4606            cmp      ax, word ptr [bp + 6]
1:2309  7307              jae      0x2312
1:230B  c746f29600        mov      word ptr [bp - 0xe], 0x96
1:2310  eb35              jmp      0x2347
1:2312  8b46ea            mov      ax, word ptr [bp - 0x16]
1:2315  8b56ec            mov      dx, word ptr [bp - 0x14]
1:2318  395608            cmp      word ptr [bp + 8], dx
1:231B  7f0e              jg       0x232b
1:231D  7c05              jl       0x2324
1:231F  394606            cmp      word ptr [bp + 6], ax
1:2322  7307              jae      0x232b
1:2324  c746f20000        mov      word ptr [bp - 0xe], 0
1:2329  eb1c              jmp      0x2347
1:232B  b83c00            mov      ax, 0x3c
1:232E  99                cdq      
1:232F  52                push     dx
1:2330  50                push     ax
1:2331  8b4606            mov      ax, word ptr [bp + 6]
1:2334  8b5608            mov      dx, word ptr [bp + 8]
1:2337  2b46ea            sub      ax, word ptr [bp - 0x16]
1:233A  1b56ec            sbb      dx, word ptr [bp - 0x14]
1:233D  52                push     dx
1:233E  50                push     ax
1:233F  9a48240000        lcall    0, 0x2448  ; @1:INT:ord_8(1:3BBC)
1:2344  8946f2            mov      word ptr [bp - 0xe], ax
1:2347  c746de5555        mov      word ptr [bp - 0x22], 0x5555
1:234C  c746e00000        mov      word ptr [bp - 0x20], 0
1:2351  c746e2ffff        mov      word ptr [bp - 0x1e], 0xffff
1:2356  c746e40000        mov      word ptr [bp - 0x1c], 0
1:235B  c746e6aaaa        mov      word ptr [bp - 0x1a], 0xaaaa
1:2360  c746e80000        mov      word ptr [bp - 0x18], 0
1:2365  b89600            mov      ax, 0x96
1:2368  99                cdq      
1:2369  52                push     dx
1:236A  50                push     ax
1:236B  b95535            mov      cx, 0x3555
1:236E  2bdb              sub      bx, bx
1:2370  53                push     bx
1:2371  51                push     cx
1:2372  8b46f2            mov      ax, word ptr [bp - 0xe]
1:2375  99                cdq      
1:2376  b99600            mov      cx, 0x96
1:2379  2bc8              sub      cx, ax
1:237B  1bda              sbb      bx, dx
1:237D  53                push     bx
1:237E  51                push     cx
1:237F  8bf1              mov      si, cx
1:2381  8bfb              mov      di, bx
1:2383  9ab0230000        lcall    0, 0x23b0  ; @1:INT:ord_5(1:3C56)
1:2388  52                push     dx
1:2389  50                push     ax
1:238A  9ab7230000        lcall    0, 0x23b7  ; @1:INT:ord_4(1:3D40)
1:238F  050020            add      ax, 0x2000
1:2392  83d200            adc      dx, 0
1:2395  8946de            mov      word ptr [bp - 0x22], ax
1:2398  8956e0            mov      word ptr [bp - 0x20], dx
1:239B  b99600            mov      cx, 0x96
1:239E  2bdb              sub      bx, bx
1:23A0  53                push     bx
1:23A1  51                push     cx
1:23A2  b9ffff            mov      cx, 0xffff
1:23A5  53                push     bx
1:23A6  51                push     cx
1:23A7  57                push     di
1:23A8  56                push     si
1:23A9  8946f6            mov      word ptr [bp - 0xa], ax
1:23AC  8956f8            mov      word ptr [bp - 8], dx
1:23AF  9ad4230000        lcall    0, 0x23d4  ; @1:INT:ord_5(1:3C56)
1:23B4  52                push     dx
1:23B5  50                push     ax
1:23B6  9adb230000        lcall    0, 0x23db  ; @1:INT:ord_4(1:3D40)
1:23BB  8946e2            mov      word ptr [bp - 0x1e], ax
1:23BE  8956e4            mov      word ptr [bp - 0x1c], dx
1:23C1  b99600            mov      cx, 0x96
1:23C4  2bdb              sub      bx, bx
1:23C6  53                push     bx
1:23C7  51                push     cx
1:23C8  b95545            mov      cx, 0x4555
1:23CB  53                push     bx
1:23CC  51                push     cx
1:23CD  57                push     di
1:23CE  56                push     si
1:23CF  8bf0              mov      si, ax
1:23D1  8bfa              mov      di, dx
1:23D3  9a41240000        lcall    0, 0x2441  ; @1:INT:ord_5(1:3C56)
1:23D8  52                push     dx
1:23D9  50                push     ax
1:23DA  9a85000000        lcall    0, 0x85  ; @1:INT:ord_4(1:3D40)
1:23DF  b9ffef            mov      cx, 0xefff
1:23E2  2bdb              sub      bx, bx
1:23E4  2bc8              sub      cx, ax
1:23E6  1bda              sbb      bx, dx
1:23E8  894ee6            mov      word ptr [bp - 0x1a], cx
1:23EB  895ee8            mov      word ptr [bp - 0x18], bx
1:23EE  8b5e12            mov      bx, word ptr [bp + 0x12]
1:23F1  8b56f6            mov      dx, word ptr [bp - 0xa]
1:23F4  8917              mov      word ptr [bx], dx
1:23F6  897702            mov      word ptr [bx + 2], si
1:23F9  894f04            mov      word ptr [bx + 4], cx
1:23FC  2bc0              sub      ax, ax
1:23FE  8946dc            mov      word ptr [bp - 0x24], ax
1:2401  8946da            mov      word ptr [bp - 0x26], ax
1:2404  8946d8            mov      word ptr [bp - 0x28], ax
1:2407  894ed6            mov      word ptr [bp - 0x2a], cx
1:240A  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:240B  df6ed6            fild     qword ptr [bp - 0x2a]
1:240E  e94801            jmp      0x2559
1:2411  833edc0c03        cmp      word ptr [0xcdc], 3
1:2416  7403              je       0x241b
1:2418  e9c200            jmp      0x24dd
1:241B  837e0800          cmp      word ptr [bp + 8], 0
1:241F  7d03              jge      0x2424
1:2421  e98100            jmp      0x24a5
1:2424  7f06              jg       0x242c
1:2426  837e0600          cmp      word ptr [bp + 6], 0
1:242A  7479              je       0x24a5
1:242C  ff36600d          push     word ptr [0xd60]
1:2430  ff365e0d          push     word ptr [0xd5e]
1:2434  b8aa2a            mov      ax, 0x2aaa
1:2437  99                cdq      
1:2438  52                push     dx
1:2439  50                push     ax
1:243A  ff7608            push     word ptr [bp + 8]
1:243D  ff7606            push     word ptr [bp + 6]
1:2440  9a811a0000        lcall    0, 0x1a81  ; @1:INT:ord_5(1:3C56)
1:2445  52                push     dx
1:2446  50                push     ax
1:2447  9a1d180000        lcall    0, 0x181d  ; @1:INT:ord_8(1:3BBC)
1:244C  8b5e12            mov      bx, word ptr [bp + 0x12]
1:244F  8907              mov      word ptr [bx], ax
1:2451  ff36600d          push     word ptr [0xd60]
1:2455  ff365e0d          push     word ptr [0xd5e]
1:2459  b8efee            mov      ax, 0xeeef
1:245C  99                cdq      
1:245D  52                push     dx
1:245E  50                push     ax
1:245F  ff7608            push     word ptr [bp + 8]
1:2462  ff7606            push     word ptr [bp + 6]
1:2465  9a8f240000        lcall    0, 0x248f  ; @1:INT:ord_5(1:3C56)
1:246A  52                push     dx
1:246B  50                push     ax
1:246C  9a96240000        lcall    0, 0x2496  ; @1:INT:ord_8(1:3BBC)
1:2471  2d2322            sub      ax, 0x2223
1:2474  8b5e12            mov      bx, word ptr [bp + 0x12]
1:2477  894702            mov      word ptr [bx + 2], ax
1:247A  ff36600d          push     word ptr [0xd60]
1:247E  ff365e0d          push     word ptr [0xd5e]
1:2482  b85555            mov      ax, 0x5555
1:2485  99                cdq      
1:2486  52                push     dx
1:2487  50                push     ax
1:2488  ff7608            push     word ptr [bp + 8]
1:248B  ff7606            push     word ptr [bp + 6]
1:248E  9a8b250000        lcall    0, 0x258b  ; @1:INT:ord_5(1:3C56)
1:2493  52                push     dx
1:2494  50                push     ax
1:2495  9a92250000        lcall    0, 0x2592  ; @1:INT:ord_8(1:3BBC)
1:249A  2d5655            sub      ax, 0x5556
1:249D  8b5e12            mov      bx, word ptr [bp + 0x12]
1:24A0  894704            mov      word ptr [bx + 4], ax
1:24A3  eb11              jmp      0x24b6
1:24A5  8b5e12            mov      bx, word ptr [bp + 0x12]
1:24A8  c7070000          mov      word ptr [bx], 0
1:24AC  c74702dddd        mov      word ptr [bx + 2], 0xdddd
1:24B1  c74704aaaa        mov      word ptr [bx + 4], 0xaaaa
1:24B6  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:24B7  dd460a            fld      qword ptr [bp + 0xa]
1:24BA  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:24BB  dc4e0a            fmul     qword ptr [bp + 0xa]
1:24BE  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:24BF  dc4e0a            fmul     qword ptr [bp + 0xa]
1:24C2  8b5e12            mov      bx, word ptr [bp + 0x12]
1:24C5  8b4704            mov      ax, word ptr [bx + 4]
1:24C8  2bd2              sub      dx, dx
1:24CA  8956dc            mov      word ptr [bp - 0x24], dx
1:24CD  8956da            mov      word ptr [bp - 0x26], dx
1:24D0  8956d8            mov      word ptr [bp - 0x28], dx
1:24D3  8946d6            mov      word ptr [bp - 0x2a], ax
1:24D6  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:24D7  df6ed6            fild     qword ptr [bp - 0x2a]
1:24DA  e93f02            jmp      0x271c
1:24DD  833edc0c04        cmp      word ptr [0xcdc], 4
1:24E2  757c              jne      0x2560
1:24E4  8b5e12            mov      bx, word ptr [bp + 0x12]
1:24E7  c7075515          mov      word ptr [bx], 0x1555
1:24EB  837e0800          cmp      word ptr [bp + 8], 0
1:24EF  7c43              jl       0x2534
1:24F1  7f06              jg       0x24f9
1:24F3  837e0600          cmp      word ptr [bp + 6], 0
1:24F7  743b              je       0x2534
1:24F9  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:24FA  db4606            fild     dword ptr [bp + 6]
1:24FD  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:24FE  da365e0d          fidiv    dword ptr [0xd5e]
1:2502  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2503  dd56de            fst      qword ptr [bp - 0x22]
1:2506  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2507  dc4ede            fmul     qword ptr [bp - 0x22]
1:250A  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:250B  dd56d6            fst      qword ptr [bp - 0x2a]
1:250E  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:250F  dc0e5008          fmul     qword ptr [0x850]
1:2513  9a28250000        lcall    0, 0x2528  ; @1:INT:ord_7(1:3E04)
1:2518  2d5655            sub      ax, 0x5556
1:251B  894702            mov      word ptr [bx + 2], ax
1:251E  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:251F  dd46d6            fld      qword ptr [bp - 0x2a]
1:2522  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2523  dc0e5808          fmul     qword ptr [0x858]
1:2527  9af3250000        lcall    0, 0x25f3  ; @1:INT:ord_7(1:3E04)
1:252C  057777            add      ax, 0x7777
1:252F  894704            mov      word ptr [bx + 4], ax
1:2532  eb0d              jmp      0x2541
1:2534  8b5e12            mov      bx, word ptr [bp + 0x12]
1:2537  c74702aaaa        mov      word ptr [bx + 2], 0xaaaa
1:253C  c747047777        mov      word ptr [bx + 4], 0x7777
1:2541  8b5e12            mov      bx, word ptr [bp + 0x12]
1:2544  8b4704            mov      ax, word ptr [bx + 4]
1:2547  2bd2              sub      dx, dx
1:2549  8956e4            mov      word ptr [bp - 0x1c], dx
1:254C  8956e2            mov      word ptr [bp - 0x1e], dx
1:254F  8956e0            mov      word ptr [bp - 0x20], dx
1:2552  8946de            mov      word ptr [bp - 0x22], ax
1:2555  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2556  df6ede            fild     qword ptr [bp - 0x22]
1:2559  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:255A  dc4e0a            fmul     qword ptr [bp + 0xa]
1:255D  e9bf01            jmp      0x271f
1:2560  833edc0c05        cmp      word ptr [0xcdc], 5
1:2565  755c              jne      0x25c3
1:2567  837e0800          cmp      word ptr [bp + 8], 0
1:256B  7c33              jl       0x25a0
1:256D  7f06              jg       0x2575
1:256F  837e0600          cmp      word ptr [bp + 6], 0
1:2573  742b              je       0x25a0
1:2575  ff36600d          push     word ptr [0xd60]
1:2579  ff365e0d          push     word ptr [0xd5e]
1:257D  b8dddd            mov      ax, 0xdddd
1:2580  2bd2              sub      dx, dx
1:2582  52                push     dx
1:2583  50                push     ax
1:2584  ff7608            push     word ptr [bp + 8]
1:2587  ff7606            push     word ptr [bp + 6]
1:258A  9a53260000        lcall    0, 0x2653  ; @1:INT:ord_5(1:3C56)
1:258F  52                push     dx
1:2590  50                push     ax
1:2591  9a5a260000        lcall    0, 0x265a  ; @1:INT:ord_8(1:3BBC)
1:2596  2d6766            sub      ax, 0x6667
1:2599  8b5e12            mov      bx, word ptr [bp + 0x12]
1:259C  8907              mov      word ptr [bx], ax
1:259E  eb07              jmp      0x25a7
1:25A0  8b5e12            mov      bx, word ptr [bp + 0x12]
1:25A3  c7079999          mov      word ptr [bx], 0x9999
1:25A7  8b5e12            mov      bx, word ptr [bp + 0x12]
1:25AA  c74702ff7f        mov      word ptr [bx + 2], 0x7fff
1:25AF  c74704ffff        mov      word ptr [bx + 4], 0xffff
1:25B4  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:25B5  dd460a            fld      qword ptr [bp + 0xa]
1:25B8  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:25B9  dc4e0a            fmul     qword ptr [bp + 0xa]
1:25BC  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:25BD  dc4e0a            fmul     qword ptr [bp + 0xa]
1:25C0  e9e200            jmp      0x26a5
1:25C3  833edc0c06        cmp      word ptr [0xcdc], 6
1:25C8  755f              jne      0x2629
1:25CA  837e0800          cmp      word ptr [bp + 8], 0
1:25CE  7c45              jl       0x2615
1:25D0  7f06              jg       0x25d8
1:25D2  837e0600          cmp      word ptr [bp + 6], 0
1:25D6  743d              je       0x2615
1:25D8  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:25D9  db4606            fild     dword ptr [bp + 6]
1:25DC  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:25DD  da365e0d          fidiv    dword ptr [0xd5e]
1:25E1  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:25E2  dd56de            fst      qword ptr [bp - 0x22]
1:25E5  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:25E6  dc4ede            fmul     qword ptr [bp - 0x22]
1:25E9  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:25EA  dd56d6            fst      qword ptr [bp - 0x2a]
1:25ED  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:25EE  dc0e6808          fmul     qword ptr [0x868]
1:25F2  9a09260000        lcall    0, 0x2609  ; @1:INT:ord_7(1:3E04)
1:25F7  2d2322            sub      ax, 0x2223
1:25FA  8b5e12            mov      bx, word ptr [bp + 0x12]
1:25FD  8907              mov      word ptr [bx], ax
1:25FF  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2600  dd46d6            fld      qword ptr [bp - 0x2a]
1:2603  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2604  dc0e7008          fmul     qword ptr [0x870]
1:2608  9ae4260000        lcall    0, 0x26e4  ; @1:INT:ord_7(1:3E04)
1:260D  056666            add      ax, 0x6666
1:2610  894702            mov      word ptr [bx + 2], ax
1:2613  eb0c              jmp      0x2621
1:2615  8b5e12            mov      bx, word ptr [bp + 0x12]
1:2618  c707dddd          mov      word ptr [bx], 0xdddd
1:261C  c747026666        mov      word ptr [bx + 2], 0x6666
1:2621  c74704ffff        mov      word ptr [bx + 4], 0xffff
1:2626  e9cf00            jmp      0x26f8
1:2629  833edc0c07        cmp      word ptr [0xcdc], 7
1:262E  757c              jne      0x26ac
1:2630  837e0800          cmp      word ptr [bp + 8], 0
1:2634  7c58              jl       0x268e
1:2636  7f06              jg       0x263e
1:2638  837e0600          cmp      word ptr [bp + 6], 0
1:263C  7450              je       0x268e
1:263E  ff36600d          push     word ptr [0xd60]
1:2642  ff365e0d          push     word ptr [0xd5e]
1:2646  b8bcbb            mov      ax, 0xbbbc
1:2649  99                cdq      
1:264A  52                push     dx
1:264B  50                push     ax
1:264C  ff7608            push     word ptr [bp + 8]
1:264F  ff7606            push     word ptr [bp + 6]
1:2652  9a7b260000        lcall    0, 0x267b  ; @1:INT:ord_5(1:3C56)
1:2657  52                push     dx
1:2658  50                push     ax
1:2659  9a82260000        lcall    0, 0x2682  ; @1:INT:ord_8(1:3BBC)
1:265E  2d6766            sub      ax, 0x6667
1:2661  8b5e12            mov      bx, word ptr [bp + 0x12]
1:2664  8907              mov      word ptr [bx], ax
1:2666  ff36600d          push     word ptr [0xd60]
1:266A  ff365e0d          push     word ptr [0xd5e]
1:266E  b8cdcc            mov      ax, 0xcccd
1:2671  99                cdq      
1:2672  52                push     dx
1:2673  50                push     ax
1:2674  ff7608            push     word ptr [bp + 8]
1:2677  ff7606            push     word ptr [bp + 6]
1:267A  9aee200000        lcall    0, 0x20ee  ; @1:INT:ord_5(1:3C56)
1:267F  52                push     dx
1:2680  50                push     ax
1:2681  9af5200000        lcall    0, 0x20f5  ; @1:INT:ord_8(1:3BBC)
1:2686  2d6766            sub      ax, 0x6667
1:2689  8b5e12            mov      bx, word ptr [bp + 0x12]
1:268C  eb08              jmp      0x2696
1:268E  b89999            mov      ax, 0x9999
1:2691  8b5e12            mov      bx, word ptr [bp + 0x12]
1:2694  8907              mov      word ptr [bx], ax
1:2696  894702            mov      word ptr [bx + 2], ax
1:2699  8b5e12            mov      bx, word ptr [bp + 0x12]
1:269C  c74704ffff        mov      word ptr [bx + 4], 0xffff
1:26A1  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:26A2  dd460a            fld      qword ptr [bp + 0xa]
1:26A5  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:26A6  dc0e6008          fmul     qword ptr [0x860]
1:26AA  eb73              jmp      0x271f
1:26AC  833edc0c08        cmp      word ptr [0xcdc], 8
1:26B1  7574              jne      0x2727
1:26B3  2bc0              sub      ax, ax
1:26B5  8b5e12            mov      bx, word ptr [bp + 0x12]
1:26B8  8907              mov      word ptr [bx], ax
1:26BA  894702            mov      word ptr [bx + 2], ax
1:26BD  394608            cmp      word ptr [bp + 8], ax
1:26C0  7c2e              jl       0x26f0
1:26C2  7f05              jg       0x26c9
1:26C4  394606            cmp      word ptr [bp + 6], ax
1:26C7  7427              je       0x26f0
1:26C9  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:26CA  db4606            fild     dword ptr [bp + 6]
1:26CD  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:26CE  da365e0d          fidiv    dword ptr [0xd5e]
1:26D2  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:26D3  dd56de            fst      qword ptr [bp - 0x22]
1:26D6  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:26D7  dc4ede            fmul     qword ptr [bp - 0x22]
1:26DA  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:26DB  dd56d6            fst      qword ptr [bp - 0x2a]
1:26DE  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:26DF  dc0e7808          fmul     qword ptr [0x878]
1:26E3  9a20270000        lcall    0, 0x2720  ; @1:INT:ord_7(1:3E04)
1:26E8  053333            add      ax, 0x3333
1:26EB  894704            mov      word ptr [bx + 4], ax
1:26EE  eb08              jmp      0x26f8
1:26F0  8b5e12            mov      bx, word ptr [bp + 0x12]
1:26F3  c747043333        mov      word ptr [bx + 4], 0x3333
1:26F8  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:26F9  dd460a            fld      qword ptr [bp + 0xa]
1:26FC  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:26FD  dc4e0a            fmul     qword ptr [bp + 0xa]
1:2700  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2701  dc4e0a            fmul     qword ptr [bp + 0xa]
1:2704  8b5e12            mov      bx, word ptr [bp + 0x12]
1:2707  8b4704            mov      ax, word ptr [bx + 4]
1:270A  2bd2              sub      dx, dx
1:270C  8956e4            mov      word ptr [bp - 0x1c], dx
1:270F  8956e2            mov      word ptr [bp - 0x1e], dx
1:2712  8956e0            mov      word ptr [bp - 0x20], dx
1:2715  8946de            mov      word ptr [bp - 0x22], ax
1:2718  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2719  df6ede            fild     qword ptr [bp - 0x22]
1:271C  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:271D  dec9              fmulp    st(1)
1:271F  9a5e220000        lcall    0, 0x225e  ; @1:INT:ord_7(1:3E04)
1:2724  894704            mov      word ptr [bx + 4], ax
1:2727  5e                pop      si
1:2728  5f                pop      di
1:2729  4d                dec      bp
1:272A  4d                dec      bp
1:272B  8be5              mov      sp, bp
1:272D  1f                pop      ds
1:272E  5d                pop      bp
1:272F  4d                dec      bp
1:2730  cb                retf     
1:2731  1e                push     ds
1:2732  58                pop      ax
1:2733  90                nop      
1:2734  45                inc      bp
1:2735  55                push     bp
1:2736  8bec              mov      bp, sp
1:2738  1e                push     ds
1:2739  8ed8              mov      ds, ax
1:273B  81ecfe00          sub      sp, 0xfe
1:273F  57                push     di
1:2740  56                push     si
1:2741  2bc0              sub      ax, ax
1:2743  898678ff          mov      word ptr [bp - 0x88], ax
1:2747  89867aff          mov      word ptr [bp - 0x86], ax
1:274B  ff36e40a          push     word ptr [0xae4]
1:274F  b80200            mov      ax, 2
1:2752  50                push     ax
1:2753  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetPolyFillMode
1:2758  803ee20c00        cmp      byte ptr [0xce2], 0
1:275D  7463              je       0x27c2
1:275F  8b5e06            mov      bx, word ptr [bp + 6]
1:2762  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2763  dd4710            fld      qword ptr [bx + 0x10]
1:2766  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2767  dc167007          fcom     qword ptr [0x770]
1:276B  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:276C  ddd8              fstp     st(0)
1:276E  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:276F  ddbe74ff          fnstsw   word ptr [bp - 0x8c]
1:2773  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:2774  9b                wait     
1:2775  8aa675ff          mov      ah, byte ptr [bp - 0x8b]
1:2779  9e                sahf     
1:277A  7546              jne      0x27c2
1:277C  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:277D  dd4728            fld      qword ptr [bx + 0x28]
1:2780  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2781  dc167007          fcom     qword ptr [0x770]
1:2785  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2786  ddd8              fstp     st(0)
1:2788  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2789  ddbe74ff          fnstsw   word ptr [bp - 0x8c]
1:278D  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:278E  9b                wait     
1:278F  8aa675ff          mov      ah, byte ptr [bp - 0x8b]
1:2793  9e                sahf     
1:2794  752c              jne      0x27c2
1:2796  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2797  dd4740            fld      qword ptr [bx + 0x40]
1:279A  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:279B  dc167007          fcom     qword ptr [0x770]
1:279F  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:27A0  ddd8              fstp     st(0)
1:27A2  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:27A3  ddbe74ff          fnstsw   word ptr [bp - 0x8c]
1:27A7  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:27A8  9b                wait     
1:27A9  8aa675ff          mov      ah, byte ptr [bp - 0x8b]
1:27AD  9e                sahf     
1:27AE  7512              jne      0x27c2
1:27B0  803e180e00        cmp      byte ptr [0xe18], 0
1:27B5  7503              jne      0x27ba
1:27B7  e9ce05            jmp      0x2d88
1:27BA  c78676ffffff      mov      word ptr [bp - 0x8a], 0xffff
1:27C0  eb2f              jmp      0x27f1
1:27C2  803ecc0a00        cmp      byte ptr [0xacc], 0
1:27C7  7503              jne      0x27cc
1:27C9  e9bc05            jmp      0x2d88
1:27CC  8b5e06            mov      bx, word ptr [bp + 6]
1:27CF  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:27D0  dd4728            fld      qword ptr [bx + 0x28]
1:27D3  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:27D4  dc4740            fadd     qword ptr [bx + 0x40]
1:27D7  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:27D8  dc4710            fadd     qword ptr [bx + 0x10]
1:27DB  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:27DC  dc0e8008          fmul     qword ptr [0x880]
1:27E0  9a1d280000        lcall    0, 0x281d  ; @1:INT:ord_7(1:3E04)
1:27E5  89468c            mov      word ptr [bp - 0x74], ax
1:27E8  89568e            mov      word ptr [bp - 0x72], dx
1:27EB  c78676ff0000      mov      word ptr [bp - 0x8a], 0
1:27F1  ff7606            push     word ptr [bp + 6]
1:27F4  0e                push     cs
1:27F5  e81cf8            call     0x2014
1:27F8  5b                pop      bx
1:27F9  8b4606            mov      ax, word ptr [bp + 6]
1:27FC  051800            add      ax, 0x18
1:27FF  50                push     ax
1:2800  8bf0              mov      si, ax
1:2802  0e                push     cs
1:2803  e80ef8            call     0x2014
1:2806  5b                pop      bx
1:2807  8b4606            mov      ax, word ptr [bp + 6]
1:280A  053000            add      ax, 0x30
1:280D  50                push     ax
1:280E  8bf8              mov      di, ax
1:2810  0e                push     cs
1:2811  e800f8            call     0x2014
1:2814  5b                pop      bx
1:2815  8b5e06            mov      bx, word ptr [bp + 6]
1:2818  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2819  dd4708            fld      qword ptr [bx + 8]
1:281C  9a2e280000        lcall    0, 0x282e  ; @1:INT:ord_7(1:3E04)
1:2821  0306e20a          add      ax, word ptr [0xae2]
1:2825  8946ee            mov      word ptr [bp - 0x12], ax
1:2828  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2829  dd07              fld      qword ptr [bx]
1:282B  8bc8              mov      cx, ax
1:282D  9a40280000        lcall    0, 0x2840  ; @1:INT:ord_7(1:3E04)
1:2832  0306e00a          add      ax, word ptr [0xae0]
1:2836  8946f0            mov      word ptr [bp - 0x10], ax
1:2839  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:283A  dd4720            fld      qword ptr [bx + 0x20]
1:283D  8bd8              mov      bx, ax
1:283F  9a51280000        lcall    0, 0x2851  ; @1:INT:ord_7(1:3E04)
1:2844  0306e20a          add      ax, word ptr [0xae2]
1:2848  8946f2            mov      word ptr [bp - 0xe], ax
1:284B  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:284C  dd04              fld      qword ptr [si]
1:284E  8bf0              mov      si, ax
1:2850  9a68280000        lcall    0, 0x2868  ; @1:INT:ord_7(1:3E04)
1:2855  0306e00a          add      ax, word ptr [0xae0]
1:2859  8946f4            mov      word ptr [bp - 0xc], ax
1:285C  8bc3              mov      ax, bx
1:285E  8b5e06            mov      bx, word ptr [bp + 6]
1:2861  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2862  dd4738            fld      qword ptr [bx + 0x38]
1:2865  8bd8              mov      bx, ax
1:2867  9a79280000        lcall    0, 0x2879  ; @1:INT:ord_7(1:3E04)
1:286C  0306e20a          add      ax, word ptr [0xae2]
1:2870  8946f6            mov      word ptr [bp - 0xa], ax
1:2873  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2874  dd05              fld      qword ptr [di]
1:2876  8bf8              mov      di, ax
1:2878  9a892a0000        lcall    0, 0x2a89  ; @1:INT:ord_7(1:3E04)
1:287D  0306e00a          add      ax, word ptr [0xae0]
1:2881  8946f8            mov      word ptr [bp - 8], ax
1:2884  894efa            mov      word ptr [bp - 6], cx
1:2887  895efc            mov      word ptr [bp - 4], bx
1:288A  89b674ff          mov      word ptr [bp - 0x8c], si
1:288E  89be72ff          mov      word ptr [bp - 0x8e], di
1:2892  3bce              cmp      cx, si
1:2894  7c0a              jl       0x28a0
1:2896  8bc7              mov      ax, di
1:2898  3bc6              cmp      ax, si
1:289A  7e0f              jle      0x28ab
1:289C  8bc6              mov      ax, si
1:289E  eb0b              jmp      0x28ab
1:28A0  8b46ee            mov      ax, word ptr [bp - 0x12]
1:28A3  3b46f6            cmp      ax, word ptr [bp - 0xa]
1:28A6  7e03              jle      0x28ab
1:28A8  8b46f6            mov      ax, word ptr [bp - 0xa]
1:28AB  8946e6            mov      word ptr [bp - 0x1a], ax
1:28AE  8b46f4            mov      ax, word ptr [bp - 0xc]
1:28B1  3946f0            cmp      word ptr [bp - 0x10], ax
1:28B4  7c0d              jl       0x28c3
1:28B6  8b46f8            mov      ax, word ptr [bp - 8]
1:28B9  3b46f4            cmp      ax, word ptr [bp - 0xc]
1:28BC  7e10              jle      0x28ce
1:28BE  8b46f4            mov      ax, word ptr [bp - 0xc]
1:28C1  eb0b              jmp      0x28ce
1:28C3  8b46f8            mov      ax, word ptr [bp - 8]
1:28C6  3b46f0            cmp      ax, word ptr [bp - 0x10]
1:28C9  7e03              jle      0x28ce
1:28CB  8b46f0            mov      ax, word ptr [bp - 0x10]
1:28CE  8946e8            mov      word ptr [bp - 0x18], ax
1:28D1  8b46f2            mov      ax, word ptr [bp - 0xe]
1:28D4  3946ee            cmp      word ptr [bp - 0x12], ax
1:28D7  7e03              jle      0x28dc
1:28D9  8b46ee            mov      ax, word ptr [bp - 0x12]
1:28DC  3b46f6            cmp      ax, word ptr [bp - 0xa]
1:28DF  7d03              jge      0x28e4
1:28E1  8b46f6            mov      ax, word ptr [bp - 0xa]
1:28E4  8946ea            mov      word ptr [bp - 0x16], ax
1:28E7  8b46f4            mov      ax, word ptr [bp - 0xc]
1:28EA  3946f0            cmp      word ptr [bp - 0x10], ax
1:28ED  7e0d              jle      0x28fc
1:28EF  8b46f8            mov      ax, word ptr [bp - 8]
1:28F2  3b46f0            cmp      ax, word ptr [bp - 0x10]
1:28F5  7d10              jge      0x2907
1:28F7  8b46f0            mov      ax, word ptr [bp - 0x10]
1:28FA  eb0b              jmp      0x2907
1:28FC  8b46f8            mov      ax, word ptr [bp - 8]
1:28FF  3b46f4            cmp      ax, word ptr [bp - 0xc]
1:2902  7d03              jge      0x2907
1:2904  8b46f4            mov      ax, word ptr [bp - 0xc]
1:2907  8946ec            mov      word ptr [bp - 0x14], ax
1:290A  8b46f0            mov      ax, word ptr [bp - 0x10]
1:290D  8946d8            mov      word ptr [bp - 0x28], ax
1:2910  8b46ee            mov      ax, word ptr [bp - 0x12]
1:2913  8946da            mov      word ptr [bp - 0x26], ax
1:2916  8b46f4            mov      ax, word ptr [bp - 0xc]
1:2919  8946dc            mov      word ptr [bp - 0x24], ax
1:291C  8b46f2            mov      ax, word ptr [bp - 0xe]
1:291F  8946de            mov      word ptr [bp - 0x22], ax
1:2922  8b46f8            mov      ax, word ptr [bp - 8]
1:2925  8946e0            mov      word ptr [bp - 0x20], ax
1:2928  8b46f6            mov      ax, word ptr [bp - 0xa]
1:292B  8946e2            mov      word ptr [bp - 0x1e], ax
1:292E  833ece0a02        cmp      word ptr [0xace], 2
1:2933  7525              jne      0x295a
1:2935  ff36e40a          push     word ptr [0xae4]
1:2939  b80400            mov      ax, 4
1:293C  50                push     ax
1:293D  9af8030000        lcall    0, 0x3f8  ; @1:GDI.GetStockObject
1:2942  50                push     ax
1:2943  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectObject
1:2948  ff36e40a          push     word ptr [0xae4]
1:294C  8d46d8            lea      ax, [bp - 0x28]
1:294F  16                push     ss
1:2950  50                push     ax
1:2951  b80300            mov      ax, 3
1:2954  50                push     ax
1:2955  9affff0000        lcall    0, 0xffff  ; @1:GDI.Polygon
1:295A  8b5e06            mov      bx, word ptr [bp + 6]
1:295D  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:295E  dd4718            fld      qword ptr [bx + 0x18]
1:2961  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2962  dc27              fsub     qword ptr [bx]
1:2964  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2965  dd963aff          fst      qword ptr [bp - 0xc6]
1:2969  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:296A  dd9e42ff          fstp     qword ptr [bp - 0xbe]
1:296E  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:296F  dd4720            fld      qword ptr [bx + 0x20]
1:2972  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2973  dd4708            fld      qword ptr [bx + 8]
1:2976  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2977  dd9632ff          fst      qword ptr [bp - 0xce]
1:297B  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:297C  dee9              fsubp    st(1)
1:297E  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:297F  dd962aff          fst      qword ptr [bp - 0xd6]
1:2983  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2984  dd9e62ff          fstp     qword ptr [bp - 0x9e]
1:2988  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2989  dd4728            fld      qword ptr [bx + 0x28]
1:298C  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:298D  dd4710            fld      qword ptr [bx + 0x10]
1:2990  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2991  dd9622ff          fst      qword ptr [bp - 0xde]
1:2995  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2996  dee9              fsubp    st(1)
1:2998  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2999  dd961aff          fst      qword ptr [bp - 0xe6]
1:299D  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:299E  dd9e52ff          fstp     qword ptr [bp - 0xae]
1:29A2  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:29A3  dd4730            fld      qword ptr [bx + 0x30]
1:29A6  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:29A7  dc27              fsub     qword ptr [bx]
1:29A9  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:29AA  dd9612ff          fst      qword ptr [bp - 0xee]
1:29AE  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:29AF  dd9e6aff          fstp     qword ptr [bp - 0x96]
1:29B3  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:29B4  dd4738            fld      qword ptr [bx + 0x38]
1:29B7  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:29B8  dca632ff          fsub     qword ptr [bp - 0xce]
1:29BC  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:29BD  dd960aff          fst      qword ptr [bp - 0xf6]
1:29C1  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:29C2  dd9e5aff          fstp     qword ptr [bp - 0xa6]
1:29C6  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:29C7  dd4740            fld      qword ptr [bx + 0x40]
1:29CA  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:29CB  dca622ff          fsub     qword ptr [bp - 0xde]
1:29CF  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:29D0  dd9602ff          fst      qword ptr [bp - 0xfe]
1:29D4  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:29D5  dd9e4aff          fstp     qword ptr [bp - 0xb6]
1:29D9  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:29DA  dd862aff          fld      qword ptr [bp - 0xd6]
1:29DE  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:29DF  dc8e02ff          fmul     qword ptr [bp - 0xfe]
1:29E3  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:29E4  dd861aff          fld      qword ptr [bp - 0xe6]
1:29E8  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:29E9  dc8e0aff          fmul     qword ptr [bp - 0xf6]
1:29ED  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:29EE  dee9              fsubp    st(1)
1:29F0  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:29F1  dd5eb0            fstp     qword ptr [bp - 0x50]
1:29F4  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:29F5  dd861aff          fld      qword ptr [bp - 0xe6]
1:29F9  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:29FA  dc8e12ff          fmul     qword ptr [bp - 0xee]
1:29FE  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:29FF  dd8602ff          fld      qword ptr [bp - 0xfe]
1:2A03  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2A04  dc8e3aff          fmul     qword ptr [bp - 0xc6]
1:2A08  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2A09  dee9              fsubp    st(1)
1:2A0B  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2A0C  dd5ea0            fstp     qword ptr [bp - 0x60]
1:2A0F  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2A10  dd862aff          fld      qword ptr [bp - 0xd6]
1:2A14  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2A15  dc8e12ff          fmul     qword ptr [bp - 0xee]
1:2A19  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2A1A  dd860aff          fld      qword ptr [bp - 0xf6]
1:2A1E  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2A1F  dc8e3aff          fmul     qword ptr [bp - 0xc6]
1:2A23  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2A24  dee9              fsubp    st(1)
1:2A26  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2A27  dd5e90            fstp     qword ptr [bp - 0x70]
1:2A2A  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:2A2B  9b                wait     
1:2A2C  ff36de07          push     word ptr [0x7de]
1:2A30  ff36dc07          push     word ptr [0x7dc]
1:2A34  ff36da07          push     word ptr [0x7da]
1:2A38  ff36d807          push     word ptr [0x7d8]
1:2A3C  9a10220000        lcall    0, 0x2210  ; @1:INT:ord_25(1:3DAC)
1:2A41  83c408            add      sp, 8
1:2A44  8bd8              mov      bx, ax
1:2A46  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2A47  dd07              fld      qword ptr [bx]
1:2A49  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2A4A  d9e8              fld1     
1:2A4C  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2A4D  def1              fdivrp   st(1)
1:2A4F  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2A50  d9e0              fchs     
1:2A52  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2A53  dd56d0            fst      qword ptr [bp - 0x30]
1:2A56  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2A57  d9e0              fchs     
1:2A59  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2A5A  dd9602ff          fst      qword ptr [bp - 0xfe]
1:2A5E  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2A5F  dd5ec8            fstp     qword ptr [bp - 0x38]
1:2A62  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2A63  dd8602ff          fld      qword ptr [bp - 0xfe]
1:2A67  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2A68  dd5eb8            fstp     qword ptr [bp - 0x48]
1:2A6B  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:2A6C  9b                wait     
1:2A6D  83be76ffff        cmp      word ptr [bp - 0x8a], -1
1:2A72  7403              je       0x2a77
1:2A74  e91a01            jmp      0x2b91
1:2A77  803ec20a00        cmp      byte ptr [0xac2], 0
1:2A7C  7503              jne      0x2a81
1:2A7E  e9ca00            jmp      0x2b4b
1:2A81  8b5e06            mov      bx, word ptr [bp + 6]
1:2A84  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2A85  dd4708            fld      qword ptr [bx + 8]
1:2A88  9a9e2a0000        lcall    0, 0x2a9e  ; @1:INT:ord_7(1:3E04)
1:2A8D  b90500            mov      cx, 5
1:2A90  99                cdq      
1:2A91  f7f9              idiv     cx
1:2A93  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2A94  dd07              fld      qword ptr [bx]
1:2A96  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2A97  dc0e0008          fmul     qword ptr [0x800]
1:2A9B  8bca              mov      cx, dx
1:2A9D  9a14250000        lcall    0, 0x2514  ; @1:INT:ord_7(1:3E04)
1:2AA2  ba0400            mov      dx, 4
1:2AA5  8bda              mov      bx, dx
1:2AA7  99                cdq      
1:2AA8  f7fb              idiv     bx
1:2AAA  8bc2              mov      ax, dx
1:2AAC  03c1              add      ax, cx
1:2AAE  b90300            mov      cx, 3
1:2AB1  99                cdq      
1:2AB2  f7f9              idiv     cx
1:2AB4  8bc2              mov      ax, dx
1:2AB6  0bc0              or       ax, ax
1:2AB8  7408              je       0x2ac2
1:2ABA  48                dec      ax
1:2ABB  746e              je       0x2b2b
1:2ABD  48                dec      ax
1:2ABE  747b              je       0x2b3b
1:2AC0  eb1b              jmp      0x2add
1:2AC2  b80600            mov      ax, 6
1:2AC5  50                push     ax
1:2AC6  b81200            mov      ax, 0x12
1:2AC9  f72edc0c          imul     word ptr [0xcdc]
1:2ACD  05e400            add      ax, 0xe4
1:2AD0  50                push     ax
1:2AD1  b8260a            mov      ax, 0xa26
1:2AD4  50                push     ax
1:2AD5  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_26(1:3B0C)
1:2ADA  83c406            add      sp, 6
1:2ADD  ff36e40a          push     word ptr [0xae4]
1:2AE1  a0270a            mov      al, byte ptr [0xa27]
1:2AE4  8a26290a          mov      ah, byte ptr [0xa29]
1:2AE8  8a0e2b0a          mov      cl, byte ptr [0xa2b]
1:2AEC  b502              mov      ch, 2
1:2AEE  51                push     cx
1:2AEF  50                push     ax
1:2AF0  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateSolidBrush
1:2AF5  50                push     ax
1:2AF6  9a202b0000        lcall    0, 0x2b20  ; @1:GDI.SelectObject
1:2AFB  898678ff          mov      word ptr [bp - 0x88], ax
1:2AFF  ff36e40a          push     word ptr [0xae4]
1:2B03  2bc0              sub      ax, ax
1:2B05  50                push     ax
1:2B06  b80100            mov      ax, 1
1:2B09  50                push     ax
1:2B0A  a0270a            mov      al, byte ptr [0xa27]
1:2B0D  8a26290a          mov      ah, byte ptr [0xa29]
1:2B11  8a0e2b0a          mov      cl, byte ptr [0xa2b]
1:2B15  b502              mov      ch, 2
1:2B17  51                push     cx
1:2B18  50                push     ax
1:2B19  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreatePen
1:2B1E  50                push     ax
1:2B1F  9a022d0000        lcall    0, 0x2d02  ; @1:GDI.SelectObject
1:2B24  89867aff          mov      word ptr [bp - 0x86], ax
1:2B28  e99301            jmp      0x2cbe
1:2B2B  b80600            mov      ax, 6
1:2B2E  50                push     ax
1:2B2F  b81200            mov      ax, 0x12
1:2B32  f72edc0c          imul     word ptr [0xcdc]
1:2B36  05ea00            add      ax, 0xea
1:2B39  eb95              jmp      0x2ad0
1:2B3B  b80600            mov      ax, 6
1:2B3E  50                push     ax
1:2B3F  b81200            mov      ax, 0x12
1:2B42  f72edc0c          imul     word ptr [0xcdc]
1:2B46  05f000            add      ax, 0xf0
1:2B49  eb85              jmp      0x2ad0
1:2B4B  8b5e06            mov      bx, word ptr [bp + 6]
1:2B4E  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2B4F  dd4708            fld      qword ptr [bx + 8]
1:2B52  9a682b0000        lcall    0, 0x2b68  ; @1:INT:ord_7(1:3E04)
1:2B57  b90500            mov      cx, 5
1:2B5A  99                cdq      
1:2B5B  f7f9              idiv     cx
1:2B5D  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2B5E  dd07              fld      qword ptr [bx]
1:2B60  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2B61  dc0e0008          fmul     qword ptr [0x800]
1:2B65  8bca              mov      cx, dx
1:2B67  9a382c0000        lcall    0, 0x2c38  ; @1:INT:ord_7(1:3E04)
1:2B6C  ba0400            mov      dx, 4
1:2B6F  8bda              mov      bx, dx
1:2B71  99                cdq      
1:2B72  f7fb              idiv     bx
1:2B74  8bc2              mov      ax, dx
1:2B76  03c1              add      ax, cx
1:2B78  b90300            mov      cx, 3
1:2B7B  99                cdq      
1:2B7C  f7f9              idiv     cx
1:2B7E  8bc2              mov      ax, dx
1:2B80  0bc0              or       ax, ax
1:2B82  7503              jne      0x2b87
1:2B84  e93701            jmp      0x2cbe
1:2B87  48                dec      ax
1:2B88  7503              jne      0x2b8d
1:2B8A  e93101            jmp      0x2cbe
1:2B8D  48                dec      ax
1:2B8E  e92d01            jmp      0x2cbe
1:2B91  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2B92  dd46b8            fld      qword ptr [bp - 0x48]
1:2B95  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2B96  dc4e90            fmul     qword ptr [bp - 0x70]
1:2B99  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2B9A  dd46c8            fld      qword ptr [bp - 0x38]
1:2B9D  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2B9E  dc4ea0            fmul     qword ptr [bp - 0x60]
1:2BA1  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2BA2  dec1              faddp    st(1)
1:2BA4  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2BA5  dd46d0            fld      qword ptr [bp - 0x30]
1:2BA8  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2BA9  dc4eb0            fmul     qword ptr [bp - 0x50]
1:2BAC  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2BAD  dec1              faddp    st(1)
1:2BAF  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2BB0  dd5ea8            fstp     qword ptr [bp - 0x58]
1:2BB3  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2BB4  dd4690            fld      qword ptr [bp - 0x70]
1:2BB7  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2BB8  dc4e90            fmul     qword ptr [bp - 0x70]
1:2BBB  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2BBC  dd46a0            fld      qword ptr [bp - 0x60]
1:2BBF  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2BC0  dc4ea0            fmul     qword ptr [bp - 0x60]
1:2BC3  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2BC4  dec1              faddp    st(1)
1:2BC6  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2BC7  dd46b0            fld      qword ptr [bp - 0x50]
1:2BCA  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2BCB  dc4eb0            fmul     qword ptr [bp - 0x50]
1:2BCE  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2BCF  dec1              faddp    st(1)
1:2BD1  83ec08            sub      sp, 8
1:2BD4  8bdc              mov      bx, sp
1:2BD6  9b                wait       ; @0:OSFIXUP:FISRQQ/FJSRQQ (add,t=5)
1:2BD7  36dd1f            fstp     qword ptr ss:[bx]
1:2BDA  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:2BDB  9b                wait     
1:2BDC  9a3d2a0000        lcall    0, 0x2a3d  ; @1:INT:ord_25(1:3DAC)
1:2BE1  83c408            add      sp, 8
1:2BE4  8bd8              mov      bx, ax
1:2BE6  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2BE7  dd07              fld      qword ptr [bx]
1:2BE9  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2BEA  dd5698            fst      qword ptr [bp - 0x68]
1:2BED  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2BEE  dc167007          fcom     qword ptr [0x770]
1:2BF2  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2BF3  ddd8              fstp     st(0)
1:2BF5  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2BF6  ddbe02ff          fnstsw   word ptr [bp - 0xfe]
1:2BFA  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:2BFB  9b                wait     
1:2BFC  8aa603ff          mov      ah, byte ptr [bp - 0xfd]
1:2C00  9e                sahf     
1:2C01  7410              je       0x2c13
1:2C03  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2C04  dd46a8            fld      qword ptr [bp - 0x58]
1:2C07  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2C08  dc7698            fdiv     qword ptr [bp - 0x68]
1:2C0B  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2C0C  dd5e84            fstp     qword ptr [bp - 0x7c]
1:2C0F  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:2C10  9b                wait     
1:2C11  eb0c              jmp      0x2c1f
1:2C13  8d7e84            lea      di, [bp - 0x7c]
1:2C16  be7007            mov      si, 0x770
1:2C19  16                push     ss
1:2C1A  07                pop      es
1:2C1B  a5                movsw    word ptr es:[di], word ptr [si]
1:2C1C  a5                movsw    word ptr es:[di], word ptr [si]
1:2C1D  a5                movsw    word ptr es:[di], word ptr [si]
1:2C1E  a5                movsw    word ptr es:[di], word ptr [si]
1:2C1F  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2C20  dd4684            fld      qword ptr [bp - 0x7c]
1:2C23  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2C24  dc066807          fadd     qword ptr [0x768]
1:2C28  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2C29  dc0ef807          fmul     qword ptr [0x7f8]
1:2C2D  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2C2E  dd967cff          fst      qword ptr [bp - 0x84]
1:2C32  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2C33  dc0e8808          fmul     qword ptr [0x888]
1:2C37  9ae1270000        lcall    0, 0x27e1  ; @1:INT:ord_7(1:3E04)
1:2C3C  8bd8              mov      bx, ax
1:2C3E  d1e3              shl      bx, 1
1:2C40  d1e3              shl      bx, 1
1:2C42  8387420b01        add      word ptr [bx + 0xb42], 1
1:2C47  8397440b00        adc      word ptr [bx + 0xb44], 0
1:2C4C  b8260a            mov      ax, 0xa26
1:2C4F  50                push     ax
1:2C50  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2C51  dd867cff          fld      qword ptr [bp - 0x84]
1:2C55  83ec08            sub      sp, 8
1:2C58  8bdc              mov      bx, sp
1:2C5A  9b                wait       ; @0:OSFIXUP:FISRQQ/FJSRQQ (add,t=5)
1:2C5B  36dd1f            fstp     qword ptr ss:[bx]
1:2C5E  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:2C5F  9b                wait     
1:2C60  ff768e            push     word ptr [bp - 0x72]
1:2C63  ff768c            push     word ptr [bp - 0x74]
1:2C66  0e                push     cs
1:2C67  e83ff4            call     0x20a9
1:2C6A  83c40e            add      sp, 0xe
1:2C6D  803ec20a00        cmp      byte ptr [0xac2], 0
1:2C72  740e              je       0x2c82
1:2C74  b8260a            mov      ax, 0xa26
1:2C77  50                push     ax
1:2C78  50                push     ax
1:2C79  0e                push     cs
1:2C7A  e895d3            call     0x12
1:2C7D  5b                pop      bx
1:2C7E  5b                pop      bx
1:2C7F  e95bfe            jmp      0x2add
1:2C82  b82400            mov      ax, 0x24
1:2C85  f7262a0a          mul      word ptr [0xa2a]
1:2C89  83ea0a            sub      dx, 0xa
1:2C8C  899602ff          mov      word ptr [bp - 0xfe], dx
1:2C90  0bd2              or       dx, dx
1:2C92  7d06              jge      0x2c9a
1:2C94  c78602ff0000      mov      word ptr [bp - 0xfe], 0
1:2C9A  81be76ff9600      cmp      word ptr [bp - 0x8a], 0x96
1:2CA0  750f              jne      0x2cb1
1:2CA2  83be02ff10        cmp      word ptr [bp - 0xfe], 0x10
1:2CA7  7e15              jle      0x2cbe
1:2CA9  c78602ff1000      mov      word ptr [bp - 0xfe], 0x10
1:2CAF  eb0d              jmp      0x2cbe
1:2CB1  83be02ff0f        cmp      word ptr [bp - 0xfe], 0xf
1:2CB6  7e06              jle      0x2cbe
1:2CB8  c78602ff0f00      mov      word ptr [bp - 0xfe], 0xf
1:2CBE  83be76ffff        cmp      word ptr [bp - 0x8a], -1
1:2CC3  7514              jne      0x2cd9
1:2CC5  ff36e40a          push     word ptr [0xae4]
1:2CC9  8d46d8            lea      ax, [bp - 0x28]
1:2CCC  16                push     ss
1:2CCD  50                push     ax
1:2CCE  b80300            mov      ax, 3
1:2CD1  50                push     ax
1:2CD2  9aee2c0000        lcall    0, 0x2cee  ; @1:GDI.Polygon
1:2CD7  eb7b              jmp      0x2d54
1:2CD9  833ece0a03        cmp      word ptr [0xace], 3
1:2CDE  7554              jne      0x2d34
1:2CE0  ff36e40a          push     word ptr [0xae4]
1:2CE4  8d46d8            lea      ax, [bp - 0x28]
1:2CE7  16                push     ss
1:2CE8  50                push     ax
1:2CE9  b80300            mov      ax, 3
1:2CEC  50                push     ax
1:2CED  9a56290000        lcall    0, 0x2956  ; @1:GDI.Polygon
1:2CF2  83be78ff00        cmp      word ptr [bp - 0x88], 0
1:2CF7  7419              je       0x2d12
1:2CF9  ff36e40a          push     word ptr [0xae4]
1:2CFD  ffb678ff          push     word ptr [bp - 0x88]
1:2D01  9a222d0000        lcall    0, 0x2d22  ; @1:GDI.SelectObject
1:2D06  50                push     ax
1:2D07  9a282d0000        lcall    0, 0x2d28  ; @1:GDI.DeleteObject
1:2D0C  c78678ff0000      mov      word ptr [bp - 0x88], 0
1:2D12  83be7aff00        cmp      word ptr [bp - 0x86], 0
1:2D17  7429              je       0x2d42
1:2D19  ff36e40a          push     word ptr [0xae4]
1:2D1D  ffb67aff          push     word ptr [bp - 0x86]
1:2D21  9a642d0000        lcall    0, 0x2d64  ; @1:GDI.SelectObject
1:2D26  50                push     ax
1:2D27  9a6a2d0000        lcall    0, 0x2d6a  ; @1:GDI.DeleteObject
1:2D2C  c7867aff0000      mov      word ptr [bp - 0x86], 0
1:2D32  eb0e              jmp      0x2d42
1:2D34  833ece0a04        cmp      word ptr [0xace], 4
1:2D39  74a5              je       0x2ce0
1:2D3B  833ece0a05        cmp      word ptr [0xace], 5
1:2D40  7483              je       0x2cc5
1:2D42  ff36e40a          push     word ptr [0xae4]
1:2D46  8d46d8            lea      ax, [bp - 0x28]
1:2D49  16                push     ss
1:2D4A  50                push     ax
1:2D4B  b80300            mov      ax, 3
1:2D4E  50                push     ax
1:2D4F  9affff0000        lcall    0, 0xffff  ; @1:GDI.Polyline
1:2D54  83be78ff00        cmp      word ptr [bp - 0x88], 0
1:2D59  7413              je       0x2d6e
1:2D5B  ff36e40a          push     word ptr [0xae4]
1:2D5F  ffb678ff          push     word ptr [bp - 0x88]
1:2D63  9a7e2d0000        lcall    0, 0x2d7e  ; @1:GDI.SelectObject
1:2D68  50                push     ax
1:2D69  9a842d0000        lcall    0, 0x2d84  ; @1:GDI.DeleteObject
1:2D6E  83be7aff00        cmp      word ptr [bp - 0x86], 0
1:2D73  7413              je       0x2d88
1:2D75  ff36e40a          push     word ptr [0xae4]
1:2D79  ffb67aff          push     word ptr [bp - 0x86]
1:2D7D  9a44290000        lcall    0, 0x2944  ; @1:GDI.SelectObject
1:2D82  50                push     ax
1:2D83  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteObject
1:2D88  5e                pop      si
1:2D89  5f                pop      di
1:2D8A  4d                dec      bp
1:2D8B  4d                dec      bp
1:2D8C  8be5              mov      sp, bp
1:2D8E  1f                pop      ds
1:2D8F  5d                pop      bp
1:2D90  4d                dec      bp
1:2D91  cb                retf     
1:2D92  1e                push     ds
1:2D93  58                pop      ax
1:2D94  90                nop      
1:2D95  45                inc      bp
1:2D96  55                push     bp
1:2D97  8bec              mov      bp, sp
1:2D99  1e                push     ds
1:2D9A  8ed8              mov      ds, ax
1:2D9C  81ec9600          sub      sp, 0x96
1:2DA0  57                push     di
1:2DA1  56                push     si
1:2DA2  a1dc0a            mov      ax, word ptr [0xadc]
1:2DA5  f76e0a            imul     word ptr [bp + 0xa]
1:2DA8  8bd8              mov      bx, ax
1:2DAA  035e06            add      bx, word ptr [bp + 6]
1:2DAD  d1e3              shl      bx, 1
1:2DAF  d1e3              shl      bx, 1
1:2DB1  8b36e60a          mov      si, word ptr [0xae6]
1:2DB5  8b00              mov      ax, word ptr [bx + si]
1:2DB7  8b5002            mov      dx, word ptr [bx + si + 2]
1:2DBA  8946f2            mov      word ptr [bp - 0xe], ax
1:2DBD  8956f4            mov      word ptr [bp - 0xc], dx
1:2DC0  8bc8              mov      cx, ax
1:2DC2  a1dc0a            mov      ax, word ptr [0xadc]
1:2DC5  8bda              mov      bx, dx
1:2DC7  f76e12            imul     word ptr [bp + 0x12]
1:2DCA  8bd3              mov      dx, bx
1:2DCC  8bd8              mov      bx, ax
1:2DCE  035e0e            add      bx, word ptr [bp + 0xe]
1:2DD1  d1e3              shl      bx, 1
1:2DD3  d1e3              shl      bx, 1
1:2DD5  8bfa              mov      di, dx
1:2DD7  8b00              mov      ax, word ptr [bx + si]
1:2DD9  8b5002            mov      dx, word ptr [bx + si + 2]
1:2DDC  8946f6            mov      word ptr [bp - 0xa], ax
1:2DDF  8956f8            mov      word ptr [bp - 8], dx
1:2DE2  8bd8              mov      bx, ax
1:2DE4  a1dc0a            mov      ax, word ptr [0xadc]
1:2DE7  8bf2              mov      si, dx
1:2DE9  f76e1a            imul     word ptr [bp + 0x1a]
1:2DEC  8bd3              mov      dx, bx
1:2DEE  8bd8              mov      bx, ax
1:2DF0  035e16            add      bx, word ptr [bp + 0x16]
1:2DF3  d1e3              shl      bx, 1
1:2DF5  d1e3              shl      bx, 1
1:2DF7  8bc6              mov      ax, si
1:2DF9  8b36e60a          mov      si, word ptr [0xae6]
1:2DFD  894eee            mov      word ptr [bp - 0x12], cx
1:2E00  897ef0            mov      word ptr [bp - 0x10], di
1:2E03  8b08              mov      cx, word ptr [bx + si]
1:2E05  8b7802            mov      di, word ptr [bx + si + 2]
1:2E08  894efa            mov      word ptr [bp - 6], cx
1:2E0B  897efc            mov      word ptr [bp - 4], di
1:2E0E  803ee20c00        cmp      byte ptr [0xce2], 0
1:2E13  7503              jne      0x2e18
1:2E15  e9e702            jmp      0x30ff
1:2E18  837ef000          cmp      word ptr [bp - 0x10], 0
1:2E1C  7e03              jle      0x2e21
1:2E1E  e98100            jmp      0x2ea2
1:2E21  7c06              jl       0x2e29
1:2E23  837eee00          cmp      word ptr [bp - 0x12], 0
1:2E27  7579              jne      0x2ea2
1:2E29  0bc0              or       ax, ax
1:2E2B  7f75              jg       0x2ea2
1:2E2D  7c04              jl       0x2e33
1:2E2F  0bd2              or       dx, dx
1:2E31  756f              jne      0x2ea2
1:2E33  0bff              or       di, di
1:2E35  7f6b              jg       0x2ea2
1:2E37  7c04              jl       0x2e3d
1:2E39  0bc9              or       cx, cx
1:2E3B  7565              jne      0x2ea2
1:2E3D  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2E3E  db4606            fild     dword ptr [bp + 6]
1:2E41  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2E42  dd1e2c0a          fstp     qword ptr [0xa2c]
1:2E46  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2E47  db460a            fild     dword ptr [bp + 0xa]
1:2E4A  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2E4B  dd1e340a          fstp     qword ptr [0xa34]
1:2E4F  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:2E50  9b                wait     
1:2E51  b83c0a            mov      ax, 0xa3c
1:2E54  8bf8              mov      di, ax
1:2E56  be7007            mov      si, 0x770
1:2E59  1e                push     ds
1:2E5A  07                pop      es
1:2E5B  a5                movsw    word ptr es:[di], word ptr [si]
1:2E5C  a5                movsw    word ptr es:[di], word ptr [si]
1:2E5D  a5                movsw    word ptr es:[di], word ptr [si]
1:2E5E  a5                movsw    word ptr es:[di], word ptr [si]
1:2E5F  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2E60  db460e            fild     dword ptr [bp + 0xe]
1:2E63  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2E64  dd1e440a          fstp     qword ptr [0xa44]
1:2E68  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2E69  db4612            fild     dword ptr [bp + 0x12]
1:2E6C  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2E6D  dd1e4c0a          fstp     qword ptr [0xa4c]
1:2E71  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:2E72  9b                wait     
1:2E73  b8540a            mov      ax, 0xa54
1:2E76  8bf8              mov      di, ax
1:2E78  be7007            mov      si, 0x770
1:2E7B  a5                movsw    word ptr es:[di], word ptr [si]
1:2E7C  a5                movsw    word ptr es:[di], word ptr [si]
1:2E7D  a5                movsw    word ptr es:[di], word ptr [si]
1:2E7E  a5                movsw    word ptr es:[di], word ptr [si]
1:2E7F  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2E80  db4616            fild     dword ptr [bp + 0x16]
1:2E83  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2E84  dd1e5c0a          fstp     qword ptr [0xa5c]
1:2E88  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2E89  db461a            fild     dword ptr [bp + 0x1a]
1:2E8C  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2E8D  dd1e640a          fstp     qword ptr [0xa64]
1:2E91  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:2E92  9b                wait     
1:2E93  b86c0a            mov      ax, 0xa6c
1:2E96  8bf8              mov      di, ax
1:2E98  be7007            mov      si, 0x770
1:2E9B  a5                movsw    word ptr es:[di], word ptr [si]
1:2E9C  a5                movsw    word ptr es:[di], word ptr [si]
1:2E9D  a5                movsw    word ptr es:[di], word ptr [si]
1:2E9E  a5                movsw    word ptr es:[di], word ptr [si]
1:2E9F  e9b002            jmp      0x3152
1:2EA2  837ef400          cmp      word ptr [bp - 0xc], 0
1:2EA6  7c0f              jl       0x2eb7
1:2EA8  837ef800          cmp      word ptr [bp - 8], 0
1:2EAC  7c09              jl       0x2eb7
1:2EAE  837efc00          cmp      word ptr [bp - 4], 0
1:2EB2  7c03              jl       0x2eb7
1:2EB4  e94802            jmp      0x30ff
1:2EB7  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2EB8  db4606            fild     dword ptr [bp + 6]
1:2EBB  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2EBC  dd1e2c0a          fstp     qword ptr [0xa2c]
1:2EC0  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2EC1  db460a            fild     dword ptr [bp + 0xa]
1:2EC4  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2EC5  dd1e340a          fstp     qword ptr [0xa34]
1:2EC9  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2ECA  db46f2            fild     dword ptr [bp - 0xe]
1:2ECD  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2ECE  dd1e3c0a          fstp     qword ptr [0xa3c]
1:2ED2  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2ED3  db460e            fild     dword ptr [bp + 0xe]
1:2ED6  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2ED7  dd1e440a          fstp     qword ptr [0xa44]
1:2EDB  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2EDC  db4612            fild     dword ptr [bp + 0x12]
1:2EDF  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2EE0  dd1e4c0a          fstp     qword ptr [0xa4c]
1:2EE4  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2EE5  db46f6            fild     dword ptr [bp - 0xa]
1:2EE8  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2EE9  dd1e540a          fstp     qword ptr [0xa54]
1:2EED  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2EEE  db4616            fild     dword ptr [bp + 0x16]
1:2EF1  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2EF2  dd1e5c0a          fstp     qword ptr [0xa5c]
1:2EF6  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2EF7  db461a            fild     dword ptr [bp + 0x1a]
1:2EFA  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2EFB  dd1e640a          fstp     qword ptr [0xa64]
1:2EFF  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2F00  db46fa            fild     dword ptr [bp - 6]
1:2F03  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2F04  dd1e6c0a          fstp     qword ptr [0xa6c]
1:2F08  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:2F09  9b                wait     
1:2F0A  c7866cff0000      mov      word ptr [bp - 0x94], 0
1:2F10  eb0d              jmp      0x2f1f
1:2F12  2ac0              sub      al, al
1:2F14  8bb66cff          mov      si, word ptr [bp - 0x94]
1:2F18  8842ee            mov      byte ptr [bp + si - 0x12], al
1:2F1B  ff866cff          inc      word ptr [bp - 0x94]
1:2F1F  83be6cff03        cmp      word ptr [bp - 0x94], 3
1:2F24  7d12              jge      0x2f38
1:2F26  8bb66cff          mov      si, word ptr [bp - 0x94]
1:2F2A  d1e6              shl      si, 1
1:2F2C  d1e6              shl      si, 1
1:2F2E  837af400          cmp      word ptr [bp + si - 0xc], 0
1:2F32  7dde              jge      0x2f12
1:2F34  b001              mov      al, 1
1:2F36  ebdc              jmp      0x2f14
1:2F38  8a46ef            mov      al, byte ptr [bp - 0x11]
1:2F3B  3846ee            cmp      byte ptr [bp - 0x12], al
1:2F3E  7425              je       0x2f65
1:2F40  8a46ee            mov      al, byte ptr [bp - 0x12]
1:2F43  3846f0            cmp      byte ptr [bp - 0x10], al
1:2F46  741d              je       0x2f65
1:2F48  8d7ed6            lea      di, [bp - 0x2a]
1:2F4B  be2c0a            mov      si, 0xa2c
1:2F4E  16                push     ss
1:2F4F  07                pop      es
1:2F50  b90c00            mov      cx, 0xc
1:2F53  f3a5              rep movsw word ptr es:[di], word ptr [si]
1:2F55  8d7ea6            lea      di, [bp - 0x5a]
1:2F58  be440a            mov      si, 0xa44
1:2F5B  b90c00            mov      cx, 0xc
1:2F5E  f3a5              rep movsw word ptr es:[di], word ptr [si]
1:2F60  8d7ebe            lea      di, [bp - 0x42]
1:2F63  eb40              jmp      0x2fa5
1:2F65  8a46ee            mov      al, byte ptr [bp - 0x12]
1:2F68  3846ef            cmp      byte ptr [bp - 0x11], al
1:2F6B  741d              je       0x2f8a
1:2F6D  8d7ebe            lea      di, [bp - 0x42]
1:2F70  be2c0a            mov      si, 0xa2c
1:2F73  16                push     ss
1:2F74  07                pop      es
1:2F75  b90c00            mov      cx, 0xc
1:2F78  f3a5              rep movsw word ptr es:[di], word ptr [si]
1:2F7A  8d7ed6            lea      di, [bp - 0x2a]
1:2F7D  be440a            mov      si, 0xa44
1:2F80  b90c00            mov      cx, 0xc
1:2F83  f3a5              rep movsw word ptr es:[di], word ptr [si]
1:2F85  8d7ea6            lea      di, [bp - 0x5a]
1:2F88  eb1b              jmp      0x2fa5
1:2F8A  8d7ea6            lea      di, [bp - 0x5a]
1:2F8D  be2c0a            mov      si, 0xa2c
1:2F90  16                push     ss
1:2F91  07                pop      es
1:2F92  b90c00            mov      cx, 0xc
1:2F95  f3a5              rep movsw word ptr es:[di], word ptr [si]
1:2F97  8d7ebe            lea      di, [bp - 0x42]
1:2F9A  be440a            mov      si, 0xa44
1:2F9D  b90c00            mov      cx, 0xc
1:2FA0  f3a5              rep movsw word ptr es:[di], word ptr [si]
1:2FA2  8d7ed6            lea      di, [bp - 0x2a]
1:2FA5  be5c0a            mov      si, 0xa5c
1:2FA8  b90c00            mov      cx, 0xc
1:2FAB  f3a5              rep movsw word ptr es:[di], word ptr [si]
1:2FAD  c7866cff0000      mov      word ptr [bp - 0x94], 0
1:2FB3  b81800            mov      ax, 0x18
1:2FB6  f7ae6cff          imul     word ptr [bp - 0x94]
1:2FBA  8bf0              mov      si, ax
1:2FBC  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2FBD  dd42b6            fld      qword ptr [bp + si - 0x4a]
1:2FC0  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2FC1  dc66e6            fsub     qword ptr [bp - 0x1a]
1:2FC4  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2FC5  dc7ee6            fdivr    qword ptr [bp - 0x1a]
1:2FC8  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2FC9  d9e0              fchs     
1:2FCB  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2FCC  dd569e            fst      qword ptr [bp - 0x62]
1:2FCF  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2FD0  dd42a6            fld      qword ptr [bp + si - 0x5a]
1:2FD3  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2FD4  dc6ed6            fsubr    qword ptr [bp - 0x2a]
1:2FD7  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2FD8  dec9              fmulp    st(1)
1:2FDA  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2FDB  dc6ed6            fsubr    qword ptr [bp - 0x2a]
1:2FDE  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2FDF  dd9a6eff          fstp     qword ptr [bp + si - 0x92]
1:2FE3  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2FE4  dd42ae            fld      qword ptr [bp + si - 0x52]
1:2FE7  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2FE8  dc6ede            fsubr    qword ptr [bp - 0x22]
1:2FEB  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2FEC  dc4e9e            fmul     qword ptr [bp - 0x62]
1:2FEF  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2FF0  dc6ede            fsubr    qword ptr [bp - 0x22]
1:2FF3  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:2FF4  dd9a76ff          fstp     qword ptr [bp + si - 0x8a]
1:2FF8  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:2FF9  9b                wait     
1:2FFA  8dba7eff          lea      di, [bp + si - 0x82]
1:2FFE  be7007            mov      si, 0x770
1:3001  a5                movsw    word ptr es:[di], word ptr [si]
1:3002  a5                movsw    word ptr es:[di], word ptr [si]
1:3003  a5                movsw    word ptr es:[di], word ptr [si]
1:3004  a5                movsw    word ptr es:[di], word ptr [si]
1:3005  ff866cff          inc      word ptr [bp - 0x94]
1:3009  83be6cff02        cmp      word ptr [bp - 0x94], 2
1:300E  7ca3              jl       0x2fb3
1:3010  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3011  dd46e6            fld      qword ptr [bp - 0x1a]
1:3014  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3015  dc167007          fcom     qword ptr [0x770]
1:3019  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:301A  ddd8              fstp     st(0)
1:301C  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:301D  ddbe6aff          fnstsw   word ptr [bp - 0x96]
1:3021  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:3022  9b                wait     
1:3023  8aa66bff          mov      ah, byte ptr [bp - 0x95]
1:3027  9e                sahf     
1:3028  7305              jae      0x302f
1:302A  8d7ee6            lea      di, [bp - 0x1a]
1:302D  eb0d              jmp      0x303c
1:302F  8d7eb6            lea      di, [bp - 0x4a]
1:3032  be7007            mov      si, 0x770
1:3035  a5                movsw    word ptr es:[di], word ptr [si]
1:3036  a5                movsw    word ptr es:[di], word ptr [si]
1:3037  a5                movsw    word ptr es:[di], word ptr [si]
1:3038  a5                movsw    word ptr es:[di], word ptr [si]
1:3039  8d7ece            lea      di, [bp - 0x32]
1:303C  be7007            mov      si, 0x770
1:303F  a5                movsw    word ptr es:[di], word ptr [si]
1:3040  a5                movsw    word ptr es:[di], word ptr [si]
1:3041  a5                movsw    word ptr es:[di], word ptr [si]
1:3042  a5                movsw    word ptr es:[di], word ptr [si]
1:3043  b82c0a            mov      ax, 0xa2c
1:3046  1e                push     ds
1:3047  8bf8              mov      di, ax
1:3049  8d76d6            lea      si, [bp - 0x2a]
1:304C  1e                push     ds
1:304D  07                pop      es
1:304E  16                push     ss
1:304F  1f                pop      ds
1:3050  b90c00            mov      cx, 0xc
1:3053  f3a5              rep movsw word ptr es:[di], word ptr [si]
1:3055  1f                pop      ds
1:3056  ba440a            mov      dx, 0xa44
1:3059  1e                push     ds
1:305A  8bfa              mov      di, dx
1:305C  8db66eff          lea      si, [bp - 0x92]
1:3060  1e                push     ds
1:3061  07                pop      es
1:3062  16                push     ss
1:3063  1f                pop      ds
1:3064  b90c00            mov      cx, 0xc
1:3067  f3a5              rep movsw word ptr es:[di], word ptr [si]
1:3069  1f                pop      ds
1:306A  bb5c0a            mov      bx, 0xa5c
1:306D  1e                push     ds
1:306E  8bfb              mov      di, bx
1:3070  8d7686            lea      si, [bp - 0x7a]
1:3073  1e                push     ds
1:3074  07                pop      es
1:3075  16                push     ss
1:3076  1f                pop      ds
1:3077  b90c00            mov      cx, 0xc
1:307A  f3a5              rep movsw word ptr es:[di], word ptr [si]
1:307C  1f                pop      ds
1:307D  50                push     ax
1:307E  0e                push     cs
1:307F  e8aff6            call     0x2731
1:3082  5b                pop      bx
1:3083  b82c0a            mov      ax, 0xa2c
1:3086  1e                push     ds
1:3087  8bf8              mov      di, ax
1:3089  8db66eff          lea      si, [bp - 0x92]
1:308D  1e                push     ds
1:308E  07                pop      es
1:308F  16                push     ss
1:3090  1f                pop      ds
1:3091  b90c00            mov      cx, 0xc
1:3094  f3a5              rep movsw word ptr es:[di], word ptr [si]
1:3096  1f                pop      ds
1:3097  ba440a            mov      dx, 0xa44
1:309A  1e                push     ds
1:309B  8bfa              mov      di, dx
1:309D  8d76a6            lea      si, [bp - 0x5a]
1:30A0  1e                push     ds
1:30A1  07                pop      es
1:30A2  16                push     ss
1:30A3  1f                pop      ds
1:30A4  b90c00            mov      cx, 0xc
1:30A7  f3a5              rep movsw word ptr es:[di], word ptr [si]
1:30A9  1f                pop      ds
1:30AA  bb5c0a            mov      bx, 0xa5c
1:30AD  1e                push     ds
1:30AE  8bfb              mov      di, bx
1:30B0  8d76be            lea      si, [bp - 0x42]
1:30B3  1e                push     ds
1:30B4  07                pop      es
1:30B5  16                push     ss
1:30B6  1f                pop      ds
1:30B7  b90c00            mov      cx, 0xc
1:30BA  f3a5              rep movsw word ptr es:[di], word ptr [si]
1:30BC  1f                pop      ds
1:30BD  50                push     ax
1:30BE  0e                push     cs
1:30BF  e86ff6            call     0x2731
1:30C2  5b                pop      bx
1:30C3  b82c0a            mov      ax, 0xa2c
1:30C6  1e                push     ds
1:30C7  8bf8              mov      di, ax
1:30C9  8db66eff          lea      si, [bp - 0x92]
1:30CD  1e                push     ds
1:30CE  07                pop      es
1:30CF  16                push     ss
1:30D0  1f                pop      ds
1:30D1  b90c00            mov      cx, 0xc
1:30D4  f3a5              rep movsw word ptr es:[di], word ptr [si]
1:30D6  1f                pop      ds
1:30D7  ba440a            mov      dx, 0xa44
1:30DA  1e                push     ds
1:30DB  8bfa              mov      di, dx
1:30DD  8d76be            lea      si, [bp - 0x42]
1:30E0  1e                push     ds
1:30E1  07                pop      es
1:30E2  16                push     ss
1:30E3  1f                pop      ds
1:30E4  b90c00            mov      cx, 0xc
1:30E7  f3a5              rep movsw word ptr es:[di], word ptr [si]
1:30E9  1f                pop      ds
1:30EA  ba5c0a            mov      dx, 0xa5c
1:30ED  1e                push     ds
1:30EE  8bfa              mov      di, dx
1:30F0  8d7686            lea      si, [bp - 0x7a]
1:30F3  1e                push     ds
1:30F4  07                pop      es
1:30F5  16                push     ss
1:30F6  1f                pop      ds
1:30F7  b90c00            mov      cx, 0xc
1:30FA  f3a5              rep movsw word ptr es:[di], word ptr [si]
1:30FC  1f                pop      ds
1:30FD  eb56              jmp      0x3155
1:30FF  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3100  db4606            fild     dword ptr [bp + 6]
1:3103  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3104  dd1e2c0a          fstp     qword ptr [0xa2c]
1:3108  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3109  db460a            fild     dword ptr [bp + 0xa]
1:310C  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:310D  dd1e340a          fstp     qword ptr [0xa34]
1:3111  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3112  db46f2            fild     dword ptr [bp - 0xe]
1:3115  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3116  dd1e3c0a          fstp     qword ptr [0xa3c]
1:311A  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:311B  db460e            fild     dword ptr [bp + 0xe]
1:311E  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:311F  dd1e440a          fstp     qword ptr [0xa44]
1:3123  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3124  db4612            fild     dword ptr [bp + 0x12]
1:3127  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3128  dd1e4c0a          fstp     qword ptr [0xa4c]
1:312C  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:312D  db46f6            fild     dword ptr [bp - 0xa]
1:3130  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3131  dd1e540a          fstp     qword ptr [0xa54]
1:3135  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3136  db4616            fild     dword ptr [bp + 0x16]
1:3139  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:313A  dd1e5c0a          fstp     qword ptr [0xa5c]
1:313E  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:313F  db461a            fild     dword ptr [bp + 0x1a]
1:3142  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3143  dd1e640a          fstp     qword ptr [0xa64]
1:3147  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3148  db46fa            fild     dword ptr [bp - 6]
1:314B  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:314C  dd1e6c0a          fstp     qword ptr [0xa6c]
1:3150  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:3151  9b                wait     
1:3152  b82c0a            mov      ax, 0xa2c
1:3155  50                push     ax
1:3156  0e                push     cs
1:3157  e8d7f5            call     0x2731
1:315A  5b                pop      bx
1:315B  5e                pop      si
1:315C  5f                pop      di
1:315D  4d                dec      bp
1:315E  4d                dec      bp
1:315F  8be5              mov      sp, bp
1:3161  1f                pop      ds
1:3162  5d                pop      bp
1:3163  4d                dec      bp
1:3164  cb                retf     
1:3165  001e5890          add      byte ptr [0x9058], bl
1:3169  45                inc      bp
1:316A  55                push     bp
1:316B  8bec              mov      bp, sp
1:316D  1e                push     ds
1:316E  8ed8              mov      ds, ax
1:3170  c706fe0d0000      mov      word ptr [0xdfe], 0
1:3176  4d                dec      bp
1:3177  4d                dec      bp
1:3178  8be5              mov      sp, bp
1:317A  1f                pop      ds
1:317B  5d                pop      bp
1:317C  4d                dec      bp
1:317D  cb                retf     

; ===== EXPORT:ord_17(#17) =====
1:317E  1e                push     ds
1:317F  58                pop      ax
1:3180  90                nop      
1:3181  45                inc      bp
1:3182  55                push     bp
1:3183  8bec              mov      bp, sp
1:3185  1e                push     ds
1:3186  8ed8              mov      ds, ax
1:3188  b80100            mov      ax, 1
1:318B  50                push     ax
1:318C  9affff0000        lcall    0, 0xffff  ; @1:USER.#249
1:3191  f6c480            test     ah, 0x80
1:3194  740c              je       0x31a2
1:3196  833efe0d00        cmp      word ptr [0xdfe], 0
1:319B  7405              je       0x31a2
1:319D  b80100            mov      ax, 1
1:31A0  eb02              jmp      0x31a4
1:31A2  2bc0              sub      ax, ax
1:31A4  4d                dec      bp
1:31A5  4d                dec      bp
1:31A6  8be5              mov      sp, bp
1:31A8  1f                pop      ds
1:31A9  5d                pop      bp
1:31AA  4d                dec      bp
1:31AB  cb                retf     

; ===== EXPORT:ord_16(#16) =====
1:31AC  1e                push     ds
1:31AD  58                pop      ax
1:31AE  90                nop      
1:31AF  45                inc      bp
1:31B0  55                push     bp
1:31B1  8bec              mov      bp, sp
1:31B3  1e                push     ds
1:31B4  8ed8              mov      ds, ax
1:31B6  83ec04            sub      sp, 4
1:31B9  a1fe0d            mov      ax, word ptr [0xdfe]
1:31BC  8946fc            mov      word ptr [bp - 4], ax
1:31BF  0bc0              or       ax, ax
1:31C1  7426              je       0x31e9
1:31C3  a1b40d            mov      ax, word ptr [0xdb4]
1:31C6  39063e0b          cmp      word ptr [0xb3e], ax
1:31CA  741d              je       0x31e9
1:31CC  c706fe0d0000      mov      word ptr [0xdfe], 0
1:31D2  ff36e40a          push     word ptr [0xae4]
1:31D6  b80700            mov      ax, 7
1:31D9  50                push     ax
1:31DA  9a0e320000        lcall    0, 0x320e  ; @1:GDI.GetStockObject
1:31DF  50                push     ax
1:31E0  9a14320000        lcall    0, 0x3214  ; @1:GDI.SelectObject
1:31E5  0e                push     cs
1:31E6  e82103            call     0x350a
1:31E9  8b46fc            mov      ax, word ptr [bp - 4]
1:31EC  4d                dec      bp
1:31ED  4d                dec      bp
1:31EE  8be5              mov      sp, bp
1:31F0  1f                pop      ds
1:31F1  5d                pop      bp
1:31F2  4d                dec      bp
1:31F3  cb                retf     

; ===== EXPORT:ord_13(#13) =====
1:31F4  1e                push     ds
1:31F5  58                pop      ax
1:31F6  90                nop      
1:31F7  45                inc      bp
1:31F8  55                push     bp
1:31F9  8bec              mov      bp, sp
1:31FB  1e                push     ds
1:31FC  8ed8              mov      ds, ax
1:31FE  833efe0d00        cmp      word ptr [0xdfe], 0
1:3203  7517              jne      0x321c
1:3205  ff36e40a          push     word ptr [0xae4]
1:3209  b80600            mov      ax, 6
1:320C  50                push     ax
1:320D  9a3e290000        lcall    0, 0x293e  ; @1:GDI.GetStockObject
1:3212  50                push     ax
1:3213  9af72a0000        lcall    0, 0x2af7  ; @1:GDI.SelectObject
1:3218  0e                push     cs
1:3219  e8ee02            call     0x350a
1:321C  c706fe0d0100      mov      word ptr [0xdfe], 1
1:3222  4d                dec      bp
1:3223  4d                dec      bp
1:3224  8be5              mov      sp, bp
1:3226  1f                pop      ds
1:3227  5d                pop      bp
1:3228  4d                dec      bp
1:3229  cb                retf     

; ===== EXPORT:ord_15(#15) =====
1:322A  1e                push     ds
1:322B  58                pop      ax
1:322C  90                nop      
1:322D  45                inc      bp
1:322E  55                push     bp
1:322F  8bec              mov      bp, sp
1:3231  1e                push     ds
1:3232  8ed8              mov      ds, ax
1:3234  83ec14            sub      sp, 0x14
1:3237  57                push     di
1:3238  56                push     si
1:3239  b8f00a            mov      ax, 0xaf0
1:323C  8bf8              mov      di, ax
1:323E  be9008            mov      si, 0x890
1:3241  1e                push     ds
1:3242  07                pop      es
1:3243  a5                movsw    word ptr es:[di], word ptr [si]
1:3244  a5                movsw    word ptr es:[di], word ptr [si]
1:3245  a5                movsw    word ptr es:[di], word ptr [si]
1:3246  a5                movsw    word ptr es:[di], word ptr [si]
1:3247  b8080b            mov      ax, 0xb08
1:324A  8bf8              mov      di, ax
1:324C  be9808            mov      si, 0x898
1:324F  a5                movsw    word ptr es:[di], word ptr [si]
1:3250  a5                movsw    word ptr es:[di], word ptr [si]
1:3251  a5                movsw    word ptr es:[di], word ptr [si]
1:3252  a5                movsw    word ptr es:[di], word ptr [si]
1:3253  b8200b            mov      ax, 0xb20
1:3256  8bf8              mov      di, ax
1:3258  be9808            mov      si, 0x898
1:325B  a5                movsw    word ptr es:[di], word ptr [si]
1:325C  a5                movsw    word ptr es:[di], word ptr [si]
1:325D  a5                movsw    word ptr es:[di], word ptr [si]
1:325E  a5                movsw    word ptr es:[di], word ptr [si]
1:325F  b8f80a            mov      ax, 0xaf8
1:3262  8bf8              mov      di, ax
1:3264  be9808            mov      si, 0x898
1:3267  a5                movsw    word ptr es:[di], word ptr [si]
1:3268  a5                movsw    word ptr es:[di], word ptr [si]
1:3269  a5                movsw    word ptr es:[di], word ptr [si]
1:326A  a5                movsw    word ptr es:[di], word ptr [si]
1:326B  a13e0b            mov      ax, word ptr [0xb3e]
1:326E  f7d8              neg      ax
1:3270  8946fc            mov      word ptr [bp - 4], ax
1:3273  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3274  df46fc            fild     word ptr [bp - 4]
1:3277  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3278  dc0ea008          fmul     qword ptr [0x8a0]
1:327C  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:327D  dc269008          fsub     qword ptr [0x890]
1:3281  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3282  dd16d20d          fst      qword ptr [0xdd2]
1:3286  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:3287  9b                wait     
1:3288  83ec08            sub      sp, 8
1:328B  8bdc              mov      bx, sp
1:328D  9b                wait       ; @0:OSFIXUP:FISRQQ/FJSRQQ (add,t=5)
1:328E  36dd1f            fstp     qword ptr ss:[bx]
1:3291  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:3292  9b                wait     
1:3293  9a11330000        lcall    0, 0x3311  ; @1:INT:ord_9(1:3DEA)
1:3298  83c408            add      sp, 8
1:329B  ba100b            mov      dx, 0xb10
1:329E  8bfa              mov      di, dx
1:32A0  8bf0              mov      si, ax
1:32A2  1e                push     ds
1:32A3  07                pop      es
1:32A4  a5                movsw    word ptr es:[di], word ptr [si]
1:32A5  a5                movsw    word ptr es:[di], word ptr [si]
1:32A6  a5                movsw    word ptr es:[di], word ptr [si]
1:32A7  a5                movsw    word ptr es:[di], word ptr [si]
1:32A8  ff36d80d          push     word ptr [0xdd8]
1:32AC  ff36d60d          push     word ptr [0xdd6]
1:32B0  ff36d40d          push     word ptr [0xdd4]
1:32B4  ff36d20d          push     word ptr [0xdd2]
1:32B8  9aea320000        lcall    0, 0x32ea  ; @1:INT:ord_10(1:3DE4)
1:32BD  83c408            add      sp, 8
1:32C0  ba280b            mov      dx, 0xb28
1:32C3  8bfa              mov      di, dx
1:32C5  8bf0              mov      si, ax
1:32C7  1e                push     ds
1:32C8  07                pop      es
1:32C9  a5                movsw    word ptr es:[di], word ptr [si]
1:32CA  a5                movsw    word ptr es:[di], word ptr [si]
1:32CB  a5                movsw    word ptr es:[di], word ptr [si]
1:32CC  a5                movsw    word ptr es:[di], word ptr [si]
1:32CD  b8000b            mov      ax, 0xb00
1:32D0  8bf8              mov      di, ax
1:32D2  be9808            mov      si, 0x898
1:32D5  a5                movsw    word ptr es:[di], word ptr [si]
1:32D6  a5                movsw    word ptr es:[di], word ptr [si]
1:32D7  a5                movsw    word ptr es:[di], word ptr [si]
1:32D8  a5                movsw    word ptr es:[di], word ptr [si]
1:32D9  ff36d80d          push     word ptr [0xdd8]
1:32DD  ff36d60d          push     word ptr [0xdd6]
1:32E1  ff36d40d          push     word ptr [0xdd4]
1:32E5  ff36d20d          push     word ptr [0xdd2]
1:32E9  9a44080000        lcall    0, 0x844  ; @1:INT:ord_10(1:3DE4)
1:32EE  83c408            add      sp, 8
1:32F1  8bd8              mov      bx, ax
1:32F3  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:32F4  dd07              fld      qword ptr [bx]
1:32F6  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:32F7  d9e0              fchs     
1:32F9  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:32FA  dd1e180b          fstp     qword ptr [0xb18]
1:32FE  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:32FF  9b                wait     
1:3300  ff36d80d          push     word ptr [0xdd8]
1:3304  ff36d60d          push     word ptr [0xdd6]
1:3308  ff36d40d          push     word ptr [0xdd4]
1:330C  ff36d20d          push     word ptr [0xdd2]
1:3310  9a1f080000        lcall    0, 0x81f  ; @1:INT:ord_9(1:3DEA)
1:3315  83c408            add      sp, 8
1:3318  ba300b            mov      dx, 0xb30
1:331B  8bfa              mov      di, dx
1:331D  8bf0              mov      si, ax
1:331F  1e                push     ds
1:3320  07                pop      es
1:3321  a5                movsw    word ptr es:[di], word ptr [si]
1:3322  a5                movsw    word ptr es:[di], word ptr [si]
1:3323  a5                movsw    word ptr es:[di], word ptr [si]
1:3324  a5                movsw    word ptr es:[di], word ptr [si]
1:3325  ff36fc0d          push     word ptr [0xdfc]
1:3329  ff36fa0d          push     word ptr [0xdfa]
1:332D  a1380d            mov      ax, word ptr [0xd38]
1:3330  99                cdq      
1:3331  52                push     dx
1:3332  50                push     ax
1:3333  8bc8              mov      cx, ax
1:3335  a13e0b            mov      ax, word ptr [0xb3e]
1:3338  053200            add      ax, 0x32
1:333B  8bda              mov      bx, dx
1:333D  99                cdq      
1:333E  52                push     dx
1:333F  50                push     ax
1:3340  8bf1              mov      si, cx
1:3342  8bfb              mov      di, bx
1:3344  9a83330000        lcall    0, 0x3383  ; @1:INT:ord_5(1:3C56)
1:3349  52                push     dx
1:334A  50                push     ax
1:334B  8946f8            mov      word ptr [bp - 8], ax
1:334E  8956fa            mov      word ptr [bp - 6], dx
1:3351  9a8a330000        lcall    0, 0x338a  ; @1:INT:ord_8(1:3BBC)
1:3356  8956f6            mov      word ptr [bp - 0xa], dx
1:3359  8946f4            mov      word ptr [bp - 0xc], ax
1:335C  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:335D  db46f4            fild     dword ptr [bp - 0xc]
1:3360  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3361  dc0ea808          fmul     qword ptr [0x8a8]
1:3365  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3366  dd56ec            fst      qword ptr [bp - 0x14]
1:3369  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:336A  dd1e1c0e          fstp     qword ptr [0xe1c]
1:336E  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:336F  9b                wait     
1:3370  b82c01            mov      ax, 0x12c
1:3373  99                cdq      
1:3374  52                push     dx
1:3375  50                push     ax
1:3376  57                push     di
1:3377  56                push     si
1:3378  b86400            mov      ax, 0x64
1:337B  2b063e0b          sub      ax, word ptr [0xb3e]
1:337F  99                cdq      
1:3380  52                push     dx
1:3381  50                push     ax
1:3382  9a66240000        lcall    0, 0x2466  ; @1:INT:ord_5(1:3C56)
1:3387  52                push     dx
1:3388  50                push     ax
1:3389  9a6d240000        lcall    0, 0x246d  ; @1:INT:ord_8(1:3BBC)
1:338E  a3020d            mov      word ptr [0xd02], ax
1:3391  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3392  dd46ec            fld      qword ptr [bp - 0x14]
1:3395  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3396  dd16c40a          fst      qword ptr [0xac4]
1:339A  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:339B  da0efa0d          fimul    dword ptr [0xdfa]
1:339F  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:33A0  dc0e100b          fmul     qword ptr [0xb10]
1:33A4  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:33A5  de2e400d          fisubr   word ptr [0xd40]
1:33A9  a13e0b            mov      ax, word ptr [0xb3e]
1:33AC  056400            add      ax, 0x64
1:33AF  8946f4            mov      word ptr [bp - 0xc], ax
1:33B2  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:33B3  de4ef4            fimul    word ptr [bp - 0xc]
1:33B6  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:33B7  dc0ea008          fmul     qword ptr [0x8a0]
1:33BB  9a532b0000        lcall    0, 0x2b53  ; @1:INT:ord_7(1:3E04)
1:33C0  a31c0d            mov      word ptr [0xd1c], ax
1:33C3  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:33C4  db46f8            fild     dword ptr [bp - 8]
1:33C7  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:33C8  dc0eb008          fmul     qword ptr [0x8b0]
1:33CC  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:33CD  dd1ed00a          fstp     qword ptr [0xad0]
1:33D1  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:33D2  9b                wait     
1:33D3  c7061e0d0000      mov      word ptr [0xd1e], 0
1:33D9  a13e0b            mov      ax, word ptr [0xb3e]
1:33DC  a3b40d            mov      word ptr [0xdb4], ax
1:33DF  5e                pop      si
1:33E0  5f                pop      di
1:33E1  4d                dec      bp
1:33E2  4d                dec      bp
1:33E3  8be5              mov      sp, bp
1:33E5  1f                pop      ds
1:33E6  5d                pop      bp
1:33E7  4d                dec      bp
1:33E8  cb                retf     

; ===== EXPORT:ord_14(#14) =====
1:33E9  1e                push     ds
1:33EA  58                pop      ax
1:33EB  90                nop      
1:33EC  45                inc      bp
1:33ED  55                push     bp
1:33EE  8bec              mov      bp, sp
1:33F0  1e                push     ds
1:33F1  8ed8              mov      ds, ax
1:33F3  57                push     di
1:33F4  56                push     si
1:33F5  b8f20d            mov      ax, 0xdf2
1:33F8  8bf8              mov      di, ax
1:33FA  be9808            mov      si, 0x898
1:33FD  1e                push     ds
1:33FE  07                pop      es
1:33FF  a5                movsw    word ptr es:[di], word ptr [si]
1:3400  a5                movsw    word ptr es:[di], word ptr [si]
1:3401  a5                movsw    word ptr es:[di], word ptr [si]
1:3402  a5                movsw    word ptr es:[di], word ptr [si]
1:3403  b8140d            mov      ax, 0xd14
1:3406  8bf8              mov      di, ax
1:3408  be9808            mov      si, 0x898
1:340B  a5                movsw    word ptr es:[di], word ptr [si]
1:340C  a5                movsw    word ptr es:[di], word ptr [si]
1:340D  a5                movsw    word ptr es:[di], word ptr [si]
1:340E  a5                movsw    word ptr es:[di], word ptr [si]
1:340F  b8c60d            mov      ax, 0xdc6
1:3412  8bf8              mov      di, ax
1:3414  be9808            mov      si, 0x898
1:3417  a5                movsw    word ptr es:[di], word ptr [si]
1:3418  a5                movsw    word ptr es:[di], word ptr [si]
1:3419  a5                movsw    word ptr es:[di], word ptr [si]
1:341A  a5                movsw    word ptr es:[di], word ptr [si]
1:341B  b8f80c            mov      ax, 0xcf8
1:341E  8bf8              mov      di, ax
1:3420  be9808            mov      si, 0x898
1:3423  a5                movsw    word ptr es:[di], word ptr [si]
1:3424  a5                movsw    word ptr es:[di], word ptr [si]
1:3425  a5                movsw    word ptr es:[di], word ptr [si]
1:3426  a5                movsw    word ptr es:[di], word ptr [si]
1:3427  b8be0d            mov      ax, 0xdbe
1:342A  8bf8              mov      di, ax
1:342C  be9808            mov      si, 0x898
1:342F  a5                movsw    word ptr es:[di], word ptr [si]
1:3430  a5                movsw    word ptr es:[di], word ptr [si]
1:3431  a5                movsw    word ptr es:[di], word ptr [si]
1:3432  a5                movsw    word ptr es:[di], word ptr [si]
1:3433  b8f00c            mov      ax, 0xcf0
1:3436  8bf8              mov      di, ax
1:3438  be9808            mov      si, 0x898
1:343B  a5                movsw    word ptr es:[di], word ptr [si]
1:343C  a5                movsw    word ptr es:[di], word ptr [si]
1:343D  a5                movsw    word ptr es:[di], word ptr [si]
1:343E  a5                movsw    word ptr es:[di], word ptr [si]
1:343F  b8200d            mov      ax, 0xd20
1:3442  8bf8              mov      di, ax
1:3444  be9808            mov      si, 0x898
1:3447  a5                movsw    word ptr es:[di], word ptr [si]
1:3448  a5                movsw    word ptr es:[di], word ptr [si]
1:3449  a5                movsw    word ptr es:[di], word ptr [si]
1:344A  a5                movsw    word ptr es:[di], word ptr [si]
1:344B  ba040d            mov      dx, 0xd04
1:344E  8bfa              mov      di, dx
1:3450  be9808            mov      si, 0x898
1:3453  a5                movsw    word ptr es:[di], word ptr [si]
1:3454  a5                movsw    word ptr es:[di], word ptr [si]
1:3455  a5                movsw    word ptr es:[di], word ptr [si]
1:3456  a5                movsw    word ptr es:[di], word ptr [si]
1:3457  bbe80c            mov      bx, 0xce8
1:345A  8bfb              mov      di, bx
1:345C  be9808            mov      si, 0x898
1:345F  a5                movsw    word ptr es:[di], word ptr [si]
1:3460  a5                movsw    word ptr es:[di], word ptr [si]
1:3461  a5                movsw    word ptr es:[di], word ptr [si]
1:3462  a5                movsw    word ptr es:[di], word ptr [si]
1:3463  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3464  db06fa0d          fild     dword ptr [0xdfa]
1:3468  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3469  dd1eea0d          fstp     qword ptr [0xdea]
1:346D  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:346E  db06fa0d          fild     dword ptr [0xdfa]
1:3472  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3473  dd1e0c0d          fstp     qword ptr [0xd0c]
1:3477  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3478  db06fa0d          fild     dword ptr [0xdfa]
1:347C  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:347D  dd1e000e          fstp     qword ptr [0xe00]
1:3481  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3482  db06fa0d          fild     dword ptr [0xdfa]
1:3486  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3487  dd1ee20d          fstp     qword ptr [0xde2]
1:348B  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:348C  db06fa0d          fild     dword ptr [0xdfa]
1:3490  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3491  dd1eb60d          fstp     qword ptr [0xdb6]
1:3495  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:3496  9b                wait     
1:3497  be080e            mov      si, 0xe08
1:349A  8bfe              mov      di, si
1:349C  be9808            mov      si, 0x898
1:349F  a5                movsw    word ptr es:[di], word ptr [si]
1:34A0  a5                movsw    word ptr es:[di], word ptr [si]
1:34A1  a5                movsw    word ptr es:[di], word ptr [si]
1:34A2  a5                movsw    word ptr es:[di], word ptr [si]
1:34A3  be280d            mov      si, 0xd28
1:34A6  8bfe              mov      di, si
1:34A8  be9808            mov      si, 0x898
1:34AB  a5                movsw    word ptr es:[di], word ptr [si]
1:34AC  a5                movsw    word ptr es:[di], word ptr [si]
1:34AD  a5                movsw    word ptr es:[di], word ptr [si]
1:34AE  a5                movsw    word ptr es:[di], word ptr [si]
1:34AF  be100e            mov      si, 0xe10
1:34B2  8bfe              mov      di, si
1:34B4  beb808            mov      si, 0x8b8
1:34B7  a5                movsw    word ptr es:[di], word ptr [si]
1:34B8  a5                movsw    word ptr es:[di], word ptr [si]
1:34B9  a5                movsw    word ptr es:[di], word ptr [si]
1:34BA  a5                movsw    word ptr es:[di], word ptr [si]
1:34BB  be300d            mov      si, 0xd30
1:34BE  8bfe              mov      di, si
1:34C0  beb808            mov      si, 0x8b8
1:34C3  a5                movsw    word ptr es:[di], word ptr [si]
1:34C4  a5                movsw    word ptr es:[di], word ptr [si]
1:34C5  a5                movsw    word ptr es:[di], word ptr [si]
1:34C6  a5                movsw    word ptr es:[di], word ptr [si]
1:34C7  53                push     bx
1:34C8  9ad3340000        lcall    0, 0x34d3  ; @1:INT:ord_27(1:2014)
1:34CD  5b                pop      bx
1:34CE  b8b60d            mov      ax, 0xdb6
1:34D1  50                push     ax
1:34D2  9add340000        lcall    0, 0x34dd  ; @1:INT:ord_27(1:2014)
1:34D7  5b                pop      bx
1:34D8  b8040d            mov      ax, 0xd04
1:34DB  50                push     ax
1:34DC  9ae7340000        lcall    0, 0x34e7  ; @1:INT:ord_27(1:2014)
1:34E1  5b                pop      bx
1:34E2  b8e20d            mov      ax, 0xde2
1:34E5  50                push     ax
1:34E6  9af1340000        lcall    0, 0x34f1  ; @1:INT:ord_27(1:2014)
1:34EB  5b                pop      bx
1:34EC  b8200d            mov      ax, 0xd20
1:34EF  50                push     ax
1:34F0  9afb340000        lcall    0, 0x34fb  ; @1:INT:ord_27(1:2014)
1:34F5  5b                pop      bx
1:34F6  b8000e            mov      ax, 0xe00
1:34F9  50                push     ax
1:34FA  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_27(1:2014)
1:34FF  5b                pop      bx
1:3500  5e                pop      si
1:3501  5f                pop      di
1:3502  4d                dec      bp
1:3503  4d                dec      bp
1:3504  8be5              mov      sp, bp
1:3506  1f                pop      ds
1:3507  5d                pop      bp
1:3508  4d                dec      bp
1:3509  cb                retf     
1:350A  1e                push     ds
1:350B  58                pop      ax
1:350C  90                nop      
1:350D  45                inc      bp
1:350E  55                push     bp
1:350F  8bec              mov      bp, sp
1:3511  1e                push     ds
1:3512  8ed8              mov      ds, ax
1:3514  ff36e40a          push     word ptr [0xae4]
1:3518  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3519  dd06e80c          fld      qword ptr [0xce8]
1:351D  9a29350000        lcall    0, 0x3529  ; @1:INT:ord_7(1:3E04)
1:3522  50                push     ax
1:3523  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3524  dd06f00c          fld      qword ptr [0xcf0]
1:3528  9a3d350000        lcall    0, 0x353d  ; @1:INT:ord_7(1:3E04)
1:352D  50                push     ax
1:352E  9affff0000        lcall    0, 0xffff  ; @1:GDI.MoveTo
1:3533  ff36e40a          push     word ptr [0xae4]
1:3537  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3538  dd06b60d          fld      qword ptr [0xdb6]
1:353C  9a48350000        lcall    0, 0x3548  ; @1:INT:ord_7(1:3E04)
1:3541  50                push     ax
1:3542  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3543  dd06be0d          fld      qword ptr [0xdbe]
1:3547  9a5c350000        lcall    0, 0x355c  ; @1:INT:ord_7(1:3E04)
1:354C  50                push     ax
1:354D  9a6d350000        lcall    0, 0x356d  ; @1:GDI.LineTo
1:3552  ff36e40a          push     word ptr [0xae4]
1:3556  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3557  dd06000e          fld      qword ptr [0xe00]
1:355B  9a67350000        lcall    0, 0x3567  ; @1:INT:ord_7(1:3E04)
1:3560  50                push     ax
1:3561  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3562  dd06080e          fld      qword ptr [0xe08]
1:3566  9a7b350000        lcall    0, 0x357b  ; @1:INT:ord_7(1:3E04)
1:356B  50                push     ax
1:356C  9a8c350000        lcall    0, 0x358c  ; @1:GDI.LineTo
1:3571  ff36e40a          push     word ptr [0xae4]
1:3575  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3576  dd06200d          fld      qword ptr [0xd20]
1:357A  9a86350000        lcall    0, 0x3586  ; @1:INT:ord_7(1:3E04)
1:357F  50                push     ax
1:3580  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3581  dd06280d          fld      qword ptr [0xd28]
1:3585  9a9a350000        lcall    0, 0x359a  ; @1:INT:ord_7(1:3E04)
1:358A  50                push     ax
1:358B  9aab350000        lcall    0, 0x35ab  ; @1:GDI.LineTo
1:3590  ff36e40a          push     word ptr [0xae4]
1:3594  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:3595  dd06e80c          fld      qword ptr [0xce8]
1:3599  9aa5350000        lcall    0, 0x35a5  ; @1:INT:ord_7(1:3E04)
1:359E  50                push     ax
1:359F  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:35A0  dd06f00c          fld      qword ptr [0xcf0]
1:35A4  9ab9350000        lcall    0, 0x35b9  ; @1:INT:ord_7(1:3E04)
1:35A9  50                push     ax
1:35AA  9aca350000        lcall    0, 0x35ca  ; @1:GDI.LineTo
1:35AF  ff36e40a          push     word ptr [0xae4]
1:35B3  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:35B4  dd06040d          fld      qword ptr [0xd04]
1:35B8  9ac4350000        lcall    0, 0x35c4  ; @1:INT:ord_7(1:3E04)
1:35BD  50                push     ax
1:35BE  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:35BF  dd060c0d          fld      qword ptr [0xd0c]
1:35C3  9ad8350000        lcall    0, 0x35d8  ; @1:INT:ord_7(1:3E04)
1:35C8  50                push     ax
1:35C9  9ae9350000        lcall    0, 0x35e9  ; @1:GDI.LineTo
1:35CE  ff36e40a          push     word ptr [0xae4]
1:35D2  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:35D3  dd06e20d          fld      qword ptr [0xde2]
1:35D7  9ae3350000        lcall    0, 0x35e3  ; @1:INT:ord_7(1:3E04)
1:35DC  50                push     ax
1:35DD  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:35DE  dd06ea0d          fld      qword ptr [0xdea]
1:35E2  9af7350000        lcall    0, 0x35f7  ; @1:INT:ord_7(1:3E04)
1:35E7  50                push     ax
1:35E8  9a08360000        lcall    0, 0x3608  ; @1:GDI.LineTo
1:35ED  ff36e40a          push     word ptr [0xae4]
1:35F1  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:35F2  dd06b60d          fld      qword ptr [0xdb6]
1:35F6  9a02360000        lcall    0, 0x3602  ; @1:INT:ord_7(1:3E04)
1:35FB  50                push     ax
1:35FC  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:35FD  dd06be0d          fld      qword ptr [0xdbe]
1:3601  9abc330000        lcall    0, 0x33bc  ; @1:INT:ord_7(1:3E04)
1:3606  50                push     ax
1:3607  9affff0000        lcall    0, 0xffff  ; @1:GDI.LineTo
1:360C  4d                dec      bp
1:360D  4d                dec      bp
1:360E  8be5              mov      sp, bp
1:3610  1f                pop      ds
1:3611  5d                pop      bp
1:3612  4d                dec      bp
1:3613  cb                retf     

; ===== EXPORT:ord_23(#23) =====
1:3614  1e                push     ds
1:3615  58                pop      ax
1:3616  90                nop      
1:3617  45                inc      bp
1:3618  55                push     bp
1:3619  8bec              mov      bp, sp
1:361B  1e                push     ds
1:361C  8ed8              mov      ds, ax
1:361E  83ec0c            sub      sp, 0xc
1:3621  56                push     si
1:3622  c746f81f00        mov      word ptr [bp - 8], 0x1f
1:3627  c746fa0000        mov      word ptr [bp - 6], 0
1:362C  837e0800          cmp      word ptr [bp + 8], 0
1:3630  7d05              jge      0x3637
1:3632  b80100            mov      ax, 1
1:3635  eb02              jmp      0x3639
1:3637  2bc0              sub      ax, ax
1:3639  8946fc            mov      word ptr [bp - 4], ax
1:363C  d16606            shl      word ptr [bp + 6], 1
1:363F  d15608            rcl      word ptr [bp + 8]
1:3642  0bc0              or       ax, ax
1:3644  7512              jne      0x3658
1:3646  8b46f8            mov      ax, word ptr [bp - 8]
1:3649  8b56fa            mov      dx, word ptr [bp - 6]
1:364C  836ef801          sub      word ptr [bp - 8], 1
1:3650  835efa00          sbb      word ptr [bp - 6], 0
1:3654  0bd0              or       dx, ax
1:3656  75d4              jne      0x362c
1:3658  b01a              mov      al, 0x1a
1:365A  50                push     ax
1:365B  8d4606            lea      ax, [bp + 6]
1:365E  16                push     ss
1:365F  50                push     ax
1:3660  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_30(1:3B9C)
1:3665  8bd8              mov      bx, ax
1:3667  83e33f            and      bx, 0x3f
1:366A  d1e3              shl      bx, 1
1:366C  b010              mov      al, 0x10
1:366E  50                push     ax
1:366F  8d46f8            lea      ax, [bp - 8]
1:3672  16                push     ss
1:3673  50                push     ax
1:3674  8bb7aa01          mov      si, word ptr [bx + 0x1aa]
1:3678  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_29(1:3B7C)
1:367D  2bc9              sub      cx, cx
1:367F  03c6              add      ax, si
1:3681  13d1              adc      dx, cx
1:3683  5e                pop      si
1:3684  4d                dec      bp
1:3685  4d                dec      bp
1:3686  8be5              mov      sp, bp
1:3688  1f                pop      ds
1:3689  5d                pop      bp
1:368A  4d                dec      bp
1:368B  cb                retf     

; ===== EXPORT:ord_22(#22) =====
1:368C  1e                push     ds
1:368D  58                pop      ax
1:368E  90                nop      
1:368F  45                inc      bp
1:3690  55                push     bp
1:3691  8bec              mov      bp, sp
1:3693  1e                push     ds
1:3694  8ed8              mov      ds, ax
1:3696  83ec06            sub      sp, 6
1:3699  b10a              mov      cl, 0xa
1:369B  8b4606            mov      ax, word ptr [bp + 6]
1:369E  d3e8              shr      ax, cl
1:36A0  8946fc            mov      word ptr [bp - 4], ax
1:36A3  8b4608            mov      ax, word ptr [bp + 8]
1:36A6  2d1f00            sub      ax, 0x1f
1:36A9  f7d8              neg      ax
1:36AB  8946fa            mov      word ptr [bp - 6], ax
1:36AE  3d4000            cmp      ax, 0x40
1:36B1  7c05              jl       0x36b8
1:36B3  2bc0              sub      ax, ax
1:36B5  99                cdq      
1:36B6  eb13              jmp      0x36cb
1:36B8  8b5efc            mov      bx, word ptr [bp - 4]
1:36BB  d1e3              shl      bx, 1
1:36BD  8b972a02          mov      dx, word ptr [bx + 0x22a]
1:36C1  2bc0              sub      ax, ax
1:36C3  8a4efa            mov      cl, byte ptr [bp - 6]
1:36C6  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_28(1:3DA0)
1:36CB  4d                dec      bp
1:36CC  4d                dec      bp
1:36CD  8be5              mov      sp, bp
1:36CF  1f                pop      ds
1:36D0  5d                pop      bp
1:36D1  4d                dec      bp
1:36D2  cb                retf     
1:36D3  001e5890          add      byte ptr [0x9058], bl
1:36D7  45                inc      bp
1:36D8  55                push     bp
1:36D9  8bec              mov      bp, sp
1:36DB  1e                push     ds
1:36DC  8ed8              mov      ds, ax
1:36DE  837e0a00          cmp      word ptr [bp + 0xa], 0
1:36E2  7504              jne      0x36e8
1:36E4  2bc0              sub      ax, ax
1:36E6  eb09              jmp      0x36f1
1:36E8  8b460e            mov      ax, word ptr [bp + 0xe]
1:36EB  a33a0d            mov      word ptr [0xd3a], ax
1:36EE  b80100            mov      ax, 1
1:36F1  4d                dec      bp
1:36F2  4d                dec      bp
1:36F3  8be5              mov      sp, bp
1:36F5  1f                pop      ds
1:36F6  5d                pop      bp
1:36F7  4d                dec      bp
1:36F8  ca0a00            retf     0xa

; ===== EXPORT:WEP(#2) =====
1:36FB  1e                push     ds
1:36FC  58                pop      ax
1:36FD  90                nop      
1:36FE  45                inc      bp
1:36FF  55                push     bp
1:3700  8bec              mov      bp, sp
1:3702  1e                push     ds
1:3703  8ed8              mov      ds, ax
1:3705  b80100            mov      ax, 1
1:3708  4d                dec      bp
1:3709  4d                dec      bp
1:370A  8be5              mov      sp, bp
1:370C  1f                pop      ds
1:370D  5d                pop      bp
1:370E  4d                dec      bp
1:370F  ca0200            retf     2

; ===== EXPORT:MODULE(#1) =====
1:3712  1e                push     ds
1:3713  58                pop      ax
1:3714  90                nop      
1:3715  45                inc      bp
1:3716  55                push     bp
1:3717  8bec              mov      bp, sp
1:3719  1e                push     ds
1:371A  8ed8              mov      ds, ax
1:371C  83ec0a            sub      sp, 0xa
1:371F  56                push     si
1:3720  8b4608            mov      ax, word ptr [bp + 8]
1:3723  a3e40a            mov      word ptr [0xae4], ax
1:3726  8b4606            mov      ax, word ptr [bp + 6]
1:3729  a3c00a            mov      word ptr [0xac0], ax
1:372C  50                push     ax
1:372D  9a4d370000        lcall    0, 0x374d  ; @1:KERNEL.GlobalLock
1:3732  a3d60c            mov      word ptr [0xcd6], ax
1:3735  8916d80c          mov      word ptr [0xcd8], dx
1:3739  8bc2              mov      ax, dx
1:373B  0b06d60c          or       ax, word ptr [0xcd6]
1:373F  7503              jne      0x3744
1:3741  e96a01            jmp      0x38ae
1:3744  c41ed60c          les      bx, ptr [0xcd6]
1:3748  26ff7720          push     word ptr es:[bx + 0x20]
1:374C  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalLock
1:3751  a3da0d            mov      word ptr [0xdda], ax
1:3754  8916dc0d          mov      word ptr [0xddc], dx
1:3758  8bc2              mov      ax, dx
1:375A  0b06da0d          or       ax, word ptr [0xdda]
1:375E  7503              jne      0x3763
1:3760  e94201            jmp      0x38a5
1:3763  8b460a            mov      ax, word ptr [bp + 0xa]
1:3766  e90801            jmp      0x3871
1:3769  c41ed60c          les      bx, ptr [0xcd6]
1:376D  26837f1465        cmp      word ptr es:[bx + 0x14], 0x65
1:3772  7c0f              jl       0x3783
1:3774  26817f36f400      cmp      word ptr es:[bx + 0x36], 0xf4
1:377A  7507              jne      0x3783
1:377C  26837f3878        cmp      word ptr es:[bx + 0x38], 0x78
1:3781  740e              je       0x3791
1:3783  c706aa020000      mov      word ptr [0x2aa], 0
1:3789  c746fc0500        mov      word ptr [bp - 4], 5
1:378E  e90701            jmp      0x3898
1:3791  c706aa020100      mov      word ptr [0x2aa], 1
1:3797  e9fe00            jmp      0x3898
1:379A  b8740a            mov      ax, 0xa74
1:379D  50                push     ax
1:379E  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_39(1:3AAA)
1:37A3  5b                pop      bx
1:37A4  ff36740a          push     word ptr [0xa74]
1:37A8  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_38(1:3B38)
1:37AD  5b                pop      bx
1:37AE  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_37(1:01D5)
1:37B3  eb13              jmp      0x37c8
1:37B5  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_36(1:03C3)
1:37BA  eb0c              jmp      0x37c8
1:37BC  833eaa0200        cmp      word ptr [0x2aa], 0
1:37C1  740b              je       0x37ce
1:37C3  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_35(1:052E)
1:37C8  8946fc            mov      word ptr [bp - 4], ax
1:37CB  e9ca00            jmp      0x3898
1:37CE  ff36e40a          push     word ptr [0xae4]
1:37D2  b800ff            mov      ax, 0xff00
1:37D5  baff00            mov      dx, 0xff
1:37D8  52                push     dx
1:37D9  50                push     ax
1:37DA  9a3e060000        lcall    0, 0x63e  ; @1:GDI.SetTextColor
1:37DF  ff36e40a          push     word ptr [0xae4]
1:37E3  2bc0              sub      ax, ax
1:37E5  50                push     ax
1:37E6  50                push     ax
1:37E7  9a4e060000        lcall    0, 0x64e  ; @1:GDI.SetBkColor
1:37EC  ff36e40a          push     word ptr [0xae4]
1:37F0  2bc0              sub      ax, ax
1:37F2  50                push     ax
1:37F3  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextAlign
1:37F8  ff36e40a          push     word ptr [0xae4]
1:37FC  b80100            mov      ax, 1
1:37FF  50                push     ax
1:3800  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkMode
1:3805  ff36e40a          push     word ptr [0xae4]
1:3809  2bc0              sub      ax, ax
1:380B  50                push     ax
1:380C  50                push     ax
1:380D  b8ac02            mov      ax, 0x2ac
1:3810  1e                push     ds
1:3811  50                push     ax
1:3812  50                push     ax
1:3813  9a6b060000        lcall    0, 0x66b  ; @1:INT:ord_11(1:3A8E)
1:3818  5b                pop      bx
1:3819  50                push     ax
1:381A  9a72060000        lcall    0, 0x672  ; @1:GDI.TextOut
1:381F  eb77              jmp      0x3898
1:3821  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_34(1:041C)
1:3826  eba0              jmp      0x37c8
1:3828  a13a0d            mov      ax, word ptr [0xd3a]
1:382B  c41eda0d          les      bx, ptr [0xdda]
1:382F  26894716          mov      word ptr es:[bx + 0x16], ax
1:3833  c746f60000        mov      word ptr [bp - 0xa], 0
1:3838  8b46f6            mov      ax, word ptr [bp - 0xa]
1:383B  8bf0              mov      si, ax
1:383D  d1e6              shl      si, 1
1:383F  40                inc      ax
1:3840  c41eda0d          les      bx, ptr [0xdda]
1:3844  2689400e          mov      word ptr es:[bx + si + 0xe], ax
1:3848  ff46f6            inc      word ptr [bp - 0xa]
1:384B  837ef604          cmp      word ptr [bp - 0xa], 4
1:384F  7ce7              jl       0x3838
1:3851  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_33(1:0C8F)
1:3856  e96fff            jmp      0x37c8
1:3859  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_32(1:0C7B)
1:385E  e967ff            jmp      0x37c8
1:3861  8b460a            mov      ax, word ptr [bp + 0xa]
1:3864  2d0700            sub      ax, 7
1:3867  50                push     ax
1:3868  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_31(1:0C67)
1:386D  5b                pop      bx
1:386E  e957ff            jmp      0x37c8
1:3871  3d0c00            cmp      ax, 0xc
1:3874  7722              ja       0x3898
1:3876  d1e0              shl      ax, 1
1:3878  93                xchg     bx, ax
1:3879  2effa77e38        jmp      word ptr cs:[bx + 0x387e]
1:387E  9a37b537bc        lcall    0xbc37, 0xb537
1:3883  37                aaa      
1:3884  2138              and      word ptr [bx + si], di
1:3886  98                cwde     
1:3887  3828              cmp      byte ptr [bx + si], ch
1:3889  385938            cmp      byte ptr [bx + di + 0x38], bl
1:388C  61                popaw    
1:388D  386138            cmp      byte ptr [bx + di + 0x38], ah
1:3890  61                popaw    
1:3891  386138            cmp      byte ptr [bx + di + 0x38], ah
1:3894  98                cwde     
1:3895  386937            cmp      byte ptr [bx + di + 0x37], ch
1:3898  c41ed60c          les      bx, ptr [0xcd6]
1:389C  26ff7720          push     word ptr es:[bx + 0x20]
1:38A0  9aaa380000        lcall    0, 0x38aa  ; @1:KERNEL.GlobalUnlock
1:38A5  ff36c00a          push     word ptr [0xac0]
1:38A9  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalUnlock
1:38AE  8b46fc            mov      ax, word ptr [bp - 4]
1:38B1  5e                pop      si
1:38B2  4d                dec      bp
1:38B3  4d                dec      bp
1:38B4  8be5              mov      sp, bp
1:38B6  1f                pop      ds
1:38B7  5d                pop      bp
1:38B8  4d                dec      bp
1:38B9  ca0600            retf     6
1:38BC  0000              add      byte ptr [bx + si], al
1:38BE  0000              add      byte ptr [bx + si], al
1:38C0  0000              add      byte ptr [bx + si], al
1:38C2  0000              add      byte ptr [bx + si], al
1:38C4  0000              add      byte ptr [bx + si], al
1:38C6  0000              add      byte ptr [bx + si], al
1:38C8  0000              add      byte ptr [bx + si], al
1:38CA  0000              add      byte ptr [bx + si], al
1:38CC  0000              add      byte ptr [bx + si], al
1:38CE  0000              add      byte ptr [bx + si], al

; ===== EXPORT:ord_42(#42) =====
1:38D0  8cd8              mov      ax, ds
1:38D2  90                nop      
1:38D3  45                inc      bp
1:38D4  55                push     bp
1:38D5  8bec              mov      bp, sp
1:38D7  1e                push     ds
1:38D8  8ed8              mov      ds, ax
1:38DA  53                push     bx
1:38DB  51                push     cx
1:38DC  52                push     dx
1:38DD  06                push     es
1:38DE  2ae4              sub      ah, ah
1:38E0  50                push     ax
1:38E1  9affff0000        lcall    0, 0xffff  ; @1:USER.PostQuitMessage
1:38E6  07                pop      es
1:38E7  5a                pop      dx
1:38E8  59                pop      cx
1:38E9  5b                pop      bx
1:38EA  8d66fe            lea      sp, [bp - 2]
1:38ED  1f                pop      ds
1:38EE  5d                pop      bp
1:38EF  4d                dec      bp
1:38F0  cb                retf     
1:38F1  0000              add      byte ptr [bx + si], al
1:38F3  0000              add      byte ptr [bx + si], al
1:38F5  0000              add      byte ptr [bx + si], al
1:38F7  0000              add      byte ptr [bx + si], al
1:38F9  0000              add      byte ptr [bx + si], al
1:38FB  0000              add      byte ptr [bx + si], al
1:38FD  0000              add      byte ptr [bx + si], al
1:38FF  00c3              add      bl, al
1:3901  008cd890          add      byte ptr [si - 0x6f28], cl
1:3905  45                inc      bp
1:3906  55                push     bp
1:3907  8bec              mov      bp, sp
1:3909  1e                push     ds
1:390A  8ed8              mov      ds, ax
1:390C  8c1e2903          mov      word ptr [0x329], ds
1:3910  b80035            mov      ax, 0x3500
1:3913  cd21              int      0x21
1:3915  891ef002          mov      word ptr [0x2f0], bx
1:3919  8c06f202          mov      word ptr [0x2f2], es
1:391D  0e                push     cs
1:391E  1f                pop      ds
1:391F  b80025            mov      ax, 0x2500
1:3922  ba563e            mov      dx, 0x3e56
1:3925  cd21              int      0x21
1:3927  16                push     ss
1:3928  1f                pop      ds
1:3929  8b0e3c07          mov      cx, word ptr [0x73c]
1:392D  e32e              jcxz     0x395d
1:392F  8e060403          mov      es, word ptr [0x304]
1:3933  268b362c00        mov      si, word ptr es:[0x2c]
1:3938  c5063e07          lds      ax, ptr [0x73e]
1:393C  8cda              mov      dx, ds
1:393E  33db              xor      bx, bx
1:3940  36ff1e3a07        lcall    ss:[0x73a]
1:3945  7305              jae      0x394c
1:3947  16                push     ss
1:3948  1f                pop      ds
1:3949  e93606            jmp      0x3f82
1:394C  36c5064207        lds      ax, ptr ss:[0x742]
1:3951  8cda              mov      dx, ds
1:3953  bb0300            mov      bx, 3
1:3956  36ff1e3a07        lcall    ss:[0x73a]
1:395B  16                push     ss
1:395C  1f                pop      ds
1:395D  8e060403          mov      es, word ptr [0x304]
1:3961  268b0e2c00        mov      cx, word ptr es:[0x2c]
1:3966  e33e              jcxz     0x39a6
1:3968  8ec1              mov      es, cx
1:396A  33ff              xor      di, di
1:396C  26803d00          cmp      byte ptr es:[di], 0
1:3970  7434              je       0x39a6