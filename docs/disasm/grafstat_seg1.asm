File: raw\unpacked\MODULES\GRAFSTAT.AD
Module: 'GRAFSTAT' ('Graphics Module Library')
CS:IP=1:20E2  SS:SP=0:0000  AutoDS=2  Heap=4096  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (3): KERNEL, GDI, USER
Segments (2):
  SEG  1: CODE off=0x00620 len=0x2114 min=0x2114 flags=0x1D50 relocs=232
  SEG  2: DATA off=0x02960 len=0x06C0 min=0x06C0 flags=0x0D61 relocs=6
Exports (35):
  ord   1: SEG1:1566 flags=0x03 MODULE
  ord   2: SEG1:154F flags=0x03 WEP
  ord   3: SEG1:20CE flags=0x03 ___EXPORTEDSTUB
  ord   4: SEG1:1722 flags=0x00 
  ord   5: SEG1:1762 flags=0x00 
  ord   6: SEG1:1824 flags=0x00 
  ord   7: SEG1:1844 flags=0x00 
  ord   8: SEG1:17F4 flags=0x00 
  ord   9: SEG1:1864 flags=0x00 
  ord  10: SEG1:18FE flags=0x00 
  ord  11: SEG1:19D0 flags=0x00 
  ord  12: SEG1:1930 flags=0x00 
  ord  13: SEG1:19DC flags=0x00 
  ord  14: SEG1:14EF flags=0x00 
  ord  15: SEG1:14DB flags=0x00 
  ord  16: SEG1:14C7 flags=0x00 
  ord  17: SEG1:1453 flags=0x00 
  ord  18: SEG1:140C flags=0x00 
  ord  19: SEG1:143F flags=0x00 
  ord  20: SEG1:03C6 flags=0x00 
  ord  21: SEG1:17E0 flags=0x00 
  ord  22: SEG1:177E flags=0x00 
  ord  23: SEG1:1528 flags=0x00 
  ord  24: SEG1:19E8 flags=0x00 
  ord  25: SEG1:1C38 flags=0x00 
  ord  26: SEG1:1AF8 flags=0x00 
  ord  27: SEG1:1D6A flags=0x00 
  ord  28: SEG1:1D92 flags=0x00 
  ord  29: SEG1:1E34 flags=0x00 
  ord  30: SEG1:1DF8 flags=0x00 
  ord  31: SEG1:1E5E flags=0x00 
  ord  32: SEG1:1D96 flags=0x00 
  ord  33: SEG1:1B12 flags=0x00 
  ord  34: SEG1:2002 flags=0x00 
  ord  35: SEG1:20BE flags=0x00 
Resources (7):
  TYPE_1000        #1               off=0x03060 len=    64
  TYPE_1000        #2               off=0x030A0 len=    64
  TYPE_1000        #3               off=0x030E0 len=    64
  TYPE_1000        #4               off=0x03120 len=    32
  TYPE_2000        #10              off=0x03140 len=    80
  TYPE_2000        #20              off=0x03190 len=    16
  TYPE_2000        #30              off=0x031A0 len=   544

1:0000  1e                push     ds
1:0001  58                pop      ax
1:0002  90                nop      
1:0003  45                inc      bp
1:0004  55                push     bp
1:0005  8bec              mov      bp, sp
1:0007  1e                push     ds
1:0008  8ed8              mov      ds, ax
1:000A  83ec10            sub      sp, 0x10
1:000D  56                push     si
1:000E  c746f81f00        mov      word ptr [bp - 8], 0x1f
1:0013  c746fa0000        mov      word ptr [bp - 6], 0
1:0018  837e0800          cmp      word ptr [bp + 8], 0
1:001C  7d05              jge      0x23
1:001E  b80100            mov      ax, 1
1:0021  eb02              jmp      0x25
1:0023  2bc0              sub      ax, ax
1:0025  8946fc            mov      word ptr [bp - 4], ax
1:0028  d16606            shl      word ptr [bp + 6], 1
1:002B  d15608            rcl      word ptr [bp + 8]
1:002E  0bc0              or       ax, ax
1:0030  7512              jne      0x44
1:0032  8b46f8            mov      ax, word ptr [bp - 8]
1:0035  8b56fa            mov      dx, word ptr [bp - 6]
1:0038  836ef801          sub      word ptr [bp - 8], 1
1:003C  835efa00          sbb      word ptr [bp - 6], 0
1:0040  0bd0              or       dx, ax
1:0042  75d4              jne      0x18
1:0044  b01a              mov      al, 0x1a
1:0046  50                push     ax
1:0047  8d4606            lea      ax, [bp + 6]
1:004A  16                push     ss
1:004B  50                push     ax
1:004C  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:1844)
1:0051  8bd8              mov      bx, ax
1:0053  83e33f            and      bx, 0x3f
1:0056  d1e3              shl      bx, 1
1:0058  b010              mov      al, 0x10
1:005A  50                push     ax
1:005B  8d46f8            lea      ax, [bp - 8]
1:005E  16                push     ss
1:005F  50                push     ax
1:0060  8bb75800          mov      si, word ptr [bx + 0x58]
1:0064  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_6(1:1824)
1:0069  2bc9              sub      cx, cx
1:006B  03c6              add      ax, si
1:006D  13d1              adc      dx, cx
1:006F  8946f4            mov      word ptr [bp - 0xc], ax
1:0072  8956f6            mov      word ptr [bp - 0xa], dx
1:0075  5e                pop      si
1:0076  4d                dec      bp
1:0077  4d                dec      bp
1:0078  8be5              mov      sp, bp
1:007A  1f                pop      ds
1:007B  5d                pop      bp
1:007C  4d                dec      bp
1:007D  cb                retf     
1:007E  1e                push     ds
1:007F  58                pop      ax
1:0080  90                nop      
1:0081  45                inc      bp
1:0082  55                push     bp
1:0083  8bec              mov      bp, sp
1:0085  1e                push     ds
1:0086  8ed8              mov      ds, ax
1:0088  837e0600          cmp      word ptr [bp + 6], 0
1:008C  7d07              jge      0x95
1:008E  8b4606            mov      ax, word ptr [bp + 6]
1:0091  f7d8              neg      ax
1:0093  eb03              jmp      0x98
1:0095  8b4606            mov      ax, word ptr [bp + 6]
1:0098  4d                dec      bp
1:0099  4d                dec      bp
1:009A  8be5              mov      sp, bp
1:009C  1f                pop      ds
1:009D  5d                pop      bp
1:009E  4d                dec      bp
1:009F  cb                retf     
1:00A0  1e                push     ds
1:00A1  58                pop      ax
1:00A2  90                nop      
1:00A3  45                inc      bp
1:00A4  55                push     bp
1:00A5  8bec              mov      bp, sp
1:00A7  1e                push     ds
1:00A8  8ed8              mov      ds, ax
1:00AA  81ec9400          sub      sp, 0x94
1:00AE  b82004            mov      ax, 0x420
1:00B1  1e                push     ds
1:00B2  50                push     ax
1:00B3  b9a000            mov      cx, 0xa0
1:00B6  51                push     cx
1:00B7  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GetWindowsDirectory
1:00BC  b82004            mov      ax, 0x420
1:00BF  50                push     ax
1:00C0  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_5(1:1762)
1:00C5  5b                pop      bx
1:00C6  8bd8              mov      bx, ax
1:00C8  80bf1f045c        cmp      byte ptr [bx + 0x41f], 0x5c
1:00CD  740f              je       0xde
1:00CF  b8d800            mov      ax, 0xd8
1:00D2  50                push     ax
1:00D3  b82004            mov      ax, 0x420
1:00D6  50                push     ax
1:00D7  9ae7000000        lcall    0, 0xe7  ; @1:INT:ord_4(1:1722)
1:00DC  5b                pop      bx
1:00DD  5b                pop      bx
1:00DE  b8da00            mov      ax, 0xda
1:00E1  50                push     ax
1:00E2  b82004            mov      ax, 0x420
1:00E5  50                push     ax
1:00E6  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_4(1:1722)
1:00EB  5b                pop      bx
1:00EC  5b                pop      bx
1:00ED  b82004            mov      ax, 0x420
1:00F0  1e                push     ds
1:00F1  50                push     ax
1:00F2  8d8676ff          lea      ax, [bp - 0x8a]
1:00F6  16                push     ss
1:00F7  50                push     ax
1:00F8  2bc0              sub      ax, ax
1:00FA  50                push     ax
1:00FB  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.OpenFile
1:0100  89866cff          mov      word ptr [bp - 0x94], ax
1:0104  40                inc      ax
1:0105  7505              jne      0x10c
1:0107  2bc0              sub      ax, ax
1:0109  e9a200            jmp      0x1ae
1:010C  ffb66cff          push     word ptr [bp - 0x94]
1:0110  2bc0              sub      ax, ax
1:0112  50                push     ax
1:0113  50                push     ax
1:0114  b80200            mov      ax, 2
1:0117  50                push     ax
1:0118  9a77010000        lcall    0, 0x177  ; @1:KERNEL._llseek
1:011D  89866eff          mov      word ptr [bp - 0x92], ax
1:0121  899670ff          mov      word ptr [bp - 0x90], dx
1:0125  0bd2              or       dx, dx
1:0127  7c13              jl       0x13c
1:0129  7f05              jg       0x130
1:012B  3d204e            cmp      ax, 0x4e20
1:012E  760c              jbe      0x13c
1:0130  c7866eff204e      mov      word ptr [bp - 0x92], 0x4e20
1:0136  c78670ff0000      mov      word ptr [bp - 0x90], 0
1:013C  b80200            mov      ax, 2
1:013F  50                push     ax
1:0140  ffb670ff          push     word ptr [bp - 0x90]
1:0144  ffb66eff          push     word ptr [bp - 0x92]
1:0148  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalAlloc
1:014D  a34a06            mov      word ptr [0x64a], ax
1:0150  0bc0              or       ax, ax
1:0152  750b              jne      0x15f
1:0154  ffb66cff          push     word ptr [bp - 0x94]
1:0158  9aa7010000        lcall    0, 0x1a7  ; @1:KERNEL._lclose
1:015D  eba8              jmp      0x107
1:015F  50                push     ax
1:0160  9ade010000        lcall    0, 0x1de  ; @1:KERNEL.GlobalLock
1:0165  898672ff          mov      word ptr [bp - 0x8e], ax
1:0169  899674ff          mov      word ptr [bp - 0x8c], dx
1:016D  ffb66cff          push     word ptr [bp - 0x94]
1:0171  2bc0              sub      ax, ax
1:0173  50                push     ax
1:0174  50                push     ax
1:0175  50                push     ax
1:0176  9affff0000        lcall    0, 0xffff  ; @1:KERNEL._llseek
1:017B  ffb66cff          push     word ptr [bp - 0x94]
1:017F  ffb674ff          push     word ptr [bp - 0x8c]
1:0183  ffb672ff          push     word ptr [bp - 0x8e]
1:0187  ffb66eff          push     word ptr [bp - 0x92]
1:018B  9affff0000        lcall    0, 0xffff  ; @1:KERNEL._lread
1:0190  a39c06            mov      word ptr [0x69c], ax
1:0193  c7069e060000      mov      word ptr [0x69e], 0
1:0199  ff364a06          push     word ptr [0x64a]
1:019D  9a7a020000        lcall    0, 0x27a  ; @1:KERNEL.GlobalUnlock
1:01A2  ffb66cff          push     word ptr [bp - 0x94]
1:01A6  9affff0000        lcall    0, 0xffff  ; @1:KERNEL._lclose
1:01AB  b80100            mov      ax, 1
1:01AE  4d                dec      bp
1:01AF  4d                dec      bp
1:01B0  8be5              mov      sp, bp
1:01B2  1f                pop      ds
1:01B3  5d                pop      bp
1:01B4  4d                dec      bp
1:01B5  cb                retf     
1:01B6  1e                push     ds
1:01B7  58                pop      ax
1:01B8  90                nop      
1:01B9  45                inc      bp
1:01BA  55                push     bp
1:01BB  8bec              mov      bp, sp
1:01BD  1e                push     ds
1:01BE  8ed8              mov      ds, ax
1:01C0  83ec10            sub      sp, 0x10
1:01C3  56                push     si
1:01C4  8b5e08            mov      bx, word ptr [bp + 8]
1:01C7  c60700            mov      byte ptr [bx], 0
1:01CA  c746f60000        mov      word ptr [bp - 0xa], 0
1:01CF  833e780600        cmp      word ptr [0x678], 0
1:01D4  7503              jne      0x1d9
1:01D6  e9a500            jmp      0x27e
1:01D9  ff364a06          push     word ptr [0x64a]
1:01DD  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalLock
1:01E2  8946f8            mov      word ptr [bp - 8], ax
1:01E5  8956fa            mov      word ptr [bp - 6], dx
1:01E8  2bc0              sub      ax, ax
1:01EA  8946f4            mov      word ptr [bp - 0xc], ax
1:01ED  8946fc            mov      word ptr [bp - 4], ax
1:01F0  eb23              jmp      0x215
1:01F2  8b46f4            mov      ax, word ptr [bp - 0xc]
1:01F5  99                cdq      
1:01F6  3b169e06          cmp      dx, word ptr [0x69e]
1:01FA  7f21              jg       0x21d
1:01FC  7c06              jl       0x204
1:01FE  3b069c06          cmp      ax, word ptr [0x69c]
1:0202  7319              jae      0x21d
1:0204  c45ef8            les      bx, ptr [bp - 8]
1:0207  8bf0              mov      si, ax
1:0209  2680380a          cmp      byte ptr es:[bx + si], 0xa
1:020D  7503              jne      0x212
1:020F  ff46fc            inc      word ptr [bp - 4]
1:0212  ff46f4            inc      word ptr [bp - 0xc]
1:0215  8b46fc            mov      ax, word ptr [bp - 4]
1:0218  394606            cmp      word ptr [bp + 6], ax
1:021B  7fd5              jg       0x1f2
1:021D  8b46f4            mov      ax, word ptr [bp - 0xc]
1:0220  99                cdq      
1:0221  3b169e06          cmp      dx, word ptr [0x69e]
1:0225  7f4e              jg       0x275
1:0227  7c06              jl       0x22f
1:0229  3b069c06          cmp      ax, word ptr [0x69c]
1:022D  7346              jae      0x275
1:022F  8946f2            mov      word ptr [bp - 0xe], ax
1:0232  c746f00000        mov      word ptr [bp - 0x10], 0
1:0237  eb22              jmp      0x25b
1:0239  8bc6              mov      ax, si
1:023B  99                cdq      
1:023C  3b169e06          cmp      dx, word ptr [0x69e]
1:0240  7f25              jg       0x267
1:0242  7c06              jl       0x24a
1:0244  3b069c06          cmp      ax, word ptr [0x69c]
1:0248  731d              jae      0x267
1:024A  268a00            mov      al, byte ptr es:[bx + si]
1:024D  8b5e08            mov      bx, word ptr [bp + 8]
1:0250  8b76f0            mov      si, word ptr [bp - 0x10]
1:0253  8800              mov      byte ptr [bx + si], al
1:0255  ff46f2            inc      word ptr [bp - 0xe]
1:0258  ff46f0            inc      word ptr [bp - 0x10]
1:025B  c45ef8            les      bx, ptr [bp - 8]
1:025E  8b76f2            mov      si, word ptr [bp - 0xe]
1:0261  2680380d          cmp      byte ptr es:[bx + si], 0xd
1:0265  75d2              jne      0x239
1:0267  8b5e08            mov      bx, word ptr [bp + 8]
1:026A  8b76f0            mov      si, word ptr [bp - 0x10]
1:026D  c60000            mov      byte ptr [bx + si], 0
1:0270  c746f60100        mov      word ptr [bp - 0xa], 1
1:0275  ff364a06          push     word ptr [0x64a]
1:0279  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalUnlock
1:027E  8b46f6            mov      ax, word ptr [bp - 0xa]
1:0281  5e                pop      si
1:0282  4d                dec      bp
1:0283  4d                dec      bp
1:0284  8be5              mov      sp, bp
1:0286  1f                pop      ds
1:0287  5d                pop      bp
1:0288  4d                dec      bp
1:0289  cb                retf     
1:028A  1e                push     ds
1:028B  58                pop      ax
1:028C  90                nop      
1:028D  45                inc      bp
1:028E  55                push     bp
1:028F  8bec              mov      bp, sp
1:0291  1e                push     ds
1:0292  8ed8              mov      ds, ax
1:0294  83ec0c            sub      sp, 0xc
1:0297  2bc0              sub      ax, ax
1:0299  8946f6            mov      word ptr [bp - 0xa], ax
1:029C  8946f8            mov      word ptr [bp - 8], ax
1:029F  8946fa            mov      word ptr [bp - 6], ax
1:02A2  8b5e08            mov      bx, word ptr [bp + 8]
1:02A5  8907              mov      word ptr [bx], ax
1:02A7  b84005            mov      ax, 0x540
1:02AA  50                push     ax
1:02AB  ff76f6            push     word ptr [bp - 0xa]
1:02AE  0e                push     cs
1:02AF  e804ff            call     0x1b6
1:02B2  5b                pop      bx
1:02B3  5b                pop      bx
1:02B4  8946fc            mov      word ptr [bp - 4], ax
1:02B7  803e400500        cmp      byte ptr [0x540], 0
1:02BC  752b              jne      0x2e9
1:02BE  8b4606            mov      ax, word ptr [bp + 6]
1:02C1  ff46f8            inc      word ptr [bp - 8]
1:02C4  3946f8            cmp      word ptr [bp - 8], ax
1:02C7  750b              jne      0x2d4
1:02C9  8b46f6            mov      ax, word ptr [bp - 0xa]
1:02CC  40                inc      ax
1:02CD  8b5e08            mov      bx, word ptr [bp + 8]
1:02D0  8907              mov      word ptr [bx], ax
1:02D2  eb0e              jmp      0x2e2
1:02D4  2b46f8            sub      ax, word ptr [bp - 8]
1:02D7  40                inc      ax
1:02D8  7508              jne      0x2e2
1:02DA  8b46f6            mov      ax, word ptr [bp - 0xa]
1:02DD  2b46fa            sub      ax, word ptr [bp - 6]
1:02E0  eb12              jmp      0x2f4
1:02E2  8b46f6            mov      ax, word ptr [bp - 0xa]
1:02E5  40                inc      ax
1:02E6  8946fa            mov      word ptr [bp - 6], ax
1:02E9  ff46f6            inc      word ptr [bp - 0xa]
1:02EC  837efc00          cmp      word ptr [bp - 4], 0
1:02F0  75b5              jne      0x2a7
1:02F2  2bc0              sub      ax, ax
1:02F4  4d                dec      bp
1:02F5  4d                dec      bp
1:02F6  8be5              mov      sp, bp
1:02F8  1f                pop      ds
1:02F9  5d                pop      bp
1:02FA  4d                dec      bp
1:02FB  cb                retf     
1:02FC  1e                push     ds
1:02FD  58                pop      ax
1:02FE  90                nop      
1:02FF  45                inc      bp
1:0300  55                push     bp
1:0301  8bec              mov      bp, sp
1:0303  1e                push     ds
1:0304  8ed8              mov      ds, ax
1:0306  8b4608            mov      ax, word ptr [bp + 8]
1:0309  a3c004            mov      word ptr [0x4c0], ax
1:030C  c706c2040000      mov      word ptr [0x4c2], 0
1:0312  837e0a00          cmp      word ptr [bp + 0xa], 0
1:0316  7408              je       0x320
1:0318  c706c804bc02      mov      word ptr [0x4c8], 0x2bc
1:031E  eb06              jmp      0x326
1:0320  c706c8046400      mov      word ptr [0x4c8], 0x64
1:0326  c606cc0400        mov      byte ptr [0x4cc], 0
1:032B  8a460c            mov      al, byte ptr [bp + 0xc]
1:032E  a2ca04            mov      byte ptr [0x4ca], al
1:0331  8a460e            mov      al, byte ptr [bp + 0xe]
1:0334  a2cb04            mov      byte ptr [0x4cb], al
1:0337  c606cd04ff        mov      byte ptr [0x4cd], 0xff
1:033C  8b4606            mov      ax, word ptr [bp + 6]
1:033F  eb2f              jmp      0x370
1:0341  c606d10431        mov      byte ptr [0x4d1], 0x31
1:0346  eb41              jmp      0x389
1:0348  c606cd0400        mov      byte ptr [0x4cd], 0
1:034D  c606d10422        mov      byte ptr [0x4d1], 0x22
1:0352  eb35              jmp      0x389
1:0354  c606d10412        mov      byte ptr [0x4d1], 0x12
1:0359  eb2e              jmp      0x389
1:035B  c606d10442        mov      byte ptr [0x4d1], 0x42
1:0360  eb27              jmp      0x389
1:0362  c606d10452        mov      byte ptr [0x4d1], 0x52
1:0367  eb20              jmp      0x389
1:0369  c606d10401        mov      byte ptr [0x4d1], 1
1:036E  eb19              jmp      0x389
1:0370  3d0500            cmp      ax, 5
1:0373  77f4              ja       0x369
1:0375  d1e0              shl      ax, 1
1:0377  93                xchg     bx, ax
1:0378  2effa77d03        jmp      word ptr cs:[bx + 0x37d]
1:037D  41                inc      cx
1:037E  034803            add      cx, word ptr [bx + si + 3]
1:0381  54                push     sp
1:0382  035b03            add      bx, word ptr [bp + di + 3]
1:0385  6203              bound    ax, dword ptr [bp + di]
1:0387  6903b8d2          imul     ax, word ptr [bp + di], 0xd2b8
1:038B  041e              add      al, 0x1e
1:038D  50                push     ax
1:038E  8b5e06            mov      bx, word ptr [bp + 6]
1:0391  d1e3              shl      bx, 1
1:0393  d1e3              shl      bx, 1
1:0395  ffb74200          push     word ptr [bx + 0x42]
1:0399  ffb74000          push     word ptr [bx + 0x40]
1:039D  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.lstrcpy
1:03A2  b8c004            mov      ax, 0x4c0
1:03A5  1e                push     ds
1:03A6  50                push     ax
1:03A7  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateFontIndirect
1:03AC  4d                dec      bp
1:03AD  4d                dec      bp
1:03AE  8be5              mov      sp, bp
1:03B0  1f                pop      ds
1:03B1  5d                pop      bp
1:03B2  4d                dec      bp
1:03B3  cb                retf     
1:03B4  1e                push     ds
1:03B5  58                pop      ax
1:03B6  90                nop      
1:03B7  45                inc      bp
1:03B8  55                push     bp
1:03B9  8bec              mov      bp, sp
1:03BB  1e                push     ds
1:03BC  8ed8              mov      ds, ax
1:03BE  4d                dec      bp
1:03BF  4d                dec      bp
1:03C0  8be5              mov      sp, bp
1:03C2  1f                pop      ds
1:03C3  5d                pop      bp
1:03C4  4d                dec      bp
1:03C5  cb                retf     

; ===== EXPORT:ord_20(#20) =====
1:03C6  1e                push     ds
1:03C7  58                pop      ax
1:03C8  90                nop      
1:03C9  45                inc      bp
1:03CA  55                push     bp
1:03CB  8bec              mov      bp, sp
1:03CD  1e                push     ds
1:03CE  8ed8              mov      ds, ax
1:03D0  83ec08            sub      sp, 8
1:03D3  c7065c060100      mov      word ptr [0x65c], 1
1:03D9  0e                push     cs
1:03DA  e8c3fc            call     0xa0
1:03DD  a37806            mov      word ptr [0x678], ax
1:03E0  0bc0              or       ax, ax
1:03E2  7503              jne      0x3e7
1:03E4  e90601            jmp      0x4ed
1:03E7  b85006            mov      ax, 0x650
1:03EA  50                push     ax
1:03EB  2bc0              sub      ax, ax
1:03ED  50                push     ax
1:03EE  0e                push     cs
1:03EF  e898fe            call     0x28a
1:03F2  5b                pop      bx
1:03F3  5b                pop      bx
1:03F4  a3b006            mov      word ptr [0x6b0], ax
1:03F7  b85206            mov      ax, 0x652
1:03FA  50                push     ax
1:03FB  b80100            mov      ax, 1
1:03FE  50                push     ax
1:03FF  0e                push     cs
1:0400  e887fe            call     0x28a
1:0403  5b                pop      bx
1:0404  5b                pop      bx
1:0405  a3b206            mov      word ptr [0x6b2], ax
1:0408  b85406            mov      ax, 0x654
1:040B  50                push     ax
1:040C  b80200            mov      ax, 2
1:040F  50                push     ax
1:0410  0e                push     cs
1:0411  e876fe            call     0x28a
1:0414  5b                pop      bx
1:0415  5b                pop      bx
1:0416  a3b406            mov      word ptr [0x6b4], ax
1:0419  b84806            mov      ax, 0x648
1:041C  50                push     ax
1:041D  b80300            mov      ax, 3
1:0420  50                push     ax
1:0421  0e                push     cs
1:0422  e865fe            call     0x28a
1:0425  5b                pop      bx
1:0426  5b                pop      bx
1:0427  a36206            mov      word ptr [0x662], ax
1:042A  833eb00600        cmp      word ptr [0x6b0], 0
1:042F  7412              je       0x443
1:0431  833eb20600        cmp      word ptr [0x6b2], 0
1:0436  740b              je       0x443
1:0438  833eb40600        cmp      word ptr [0x6b4], 0
1:043D  7404              je       0x443
1:043F  0bc0              or       ax, ax
1:0441  750f              jne      0x452
1:0443  c70678060000      mov      word ptr [0x678], 0
1:0449  ff364a06          push     word ptr [0x64a]
1:044D  9aa1040000        lcall    0, 0x4a1  ; @1:KERNEL.GlobalFree
1:0452  c41e4c06          les      bx, ptr [0x64c]
1:0456  26817f089001      cmp      word ptr es:[bx + 8], 0x190
1:045C  7d05              jge      0x463
1:045E  b80100            mov      ax, 1
1:0461  eb02              jmp      0x465
1:0463  2bc0              sub      ax, ax
1:0465  8946fa            mov      word ptr [bp - 6], ax
1:0468  833e780600        cmp      word ptr [0x678], 0
1:046D  7436              je       0x4a5
1:046F  0bc0              or       ax, ax
1:0471  7407              je       0x47a
1:0473  c746fc1200        mov      word ptr [bp - 4], 0x12
1:0478  eb05              jmp      0x47f
1:047A  c746fc1800        mov      word ptr [bp - 4], 0x18
1:047F  2bc0              sub      ax, ax
1:0481  50                push     ax
1:0482  50                push     ax
1:0483  b90100            mov      cx, 1
1:0486  51                push     cx
1:0487  ff76fc            push     word ptr [bp - 4]
1:048A  51                push     cx
1:048B  0e                push     cs
1:048C  e86dfe            call     0x2fc
1:048F  83c40a            add      sp, 0xa
1:0492  a35a06            mov      word ptr [0x65a], ax
1:0495  0bc0              or       ax, ax
1:0497  750c              jne      0x4a5
1:0499  a37806            mov      word ptr [0x678], ax
1:049C  ff364a06          push     word ptr [0x64a]
1:04A0  9ae9040000        lcall    0, 0x4e9  ; @1:KERNEL.GlobalFree
1:04A5  833e780600        cmp      word ptr [0x678], 0
1:04AA  7441              je       0x4ed
1:04AC  837efa00          cmp      word ptr [bp - 6], 0
1:04B0  7407              je       0x4b9
1:04B2  c746fc0c00        mov      word ptr [bp - 4], 0xc
1:04B7  eb05              jmp      0x4be
1:04B9  c746fc1200        mov      word ptr [bp - 4], 0x12
1:04BE  2bc0              sub      ax, ax
1:04C0  50                push     ax
1:04C1  50                push     ax
1:04C2  b90100            mov      cx, 1
1:04C5  51                push     cx
1:04C6  ff76fc            push     word ptr [bp - 4]
1:04C9  51                push     cx
1:04CA  0e                push     cs
1:04CB  e82efe            call     0x2fc
1:04CE  83c40a            add      sp, 0xa
1:04D1  a39606            mov      word ptr [0x696], ax
1:04D4  0bc0              or       ax, ax
1:04D6  7515              jne      0x4ed
1:04D8  a37806            mov      word ptr [0x678], ax
1:04DB  ff365a06          push     word ptr [0x65a]
1:04DF  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteObject
1:04E4  ff364a06          push     word ptr [0x64a]
1:04E8  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalFree
1:04ED  2bc0              sub      ax, ax
1:04EF  50                push     ax
1:04F0  b90100            mov      cx, 1
1:04F3  51                push     cx
1:04F4  baffff            mov      dx, 0xffff
1:04F7  bbff00            mov      bx, 0xff
1:04FA  53                push     bx
1:04FB  52                push     dx
1:04FC  9a1f050000        lcall    0, 0x51f  ; @1:GDI.CreatePen
1:0501  a36e06            mov      word ptr [0x66e], ax
1:0504  c41e4c06          les      bx, ptr [0x64c]
1:0508  26837f0a04        cmp      word ptr es:[bx + 0xa], 4
1:050D  7d3d              jge      0x54c
1:050F  2bc0              sub      ax, ax
1:0511  50                push     ax
1:0512  b90200            mov      cx, 2
1:0515  51                push     cx
1:0516  b9ffff            mov      cx, 0xffff
1:0519  baff00            mov      dx, 0xff
1:051C  52                push     dx
1:051D  51                push     cx
1:051E  9a36050000        lcall    0, 0x536  ; @1:GDI.CreatePen
1:0523  a36806            mov      word ptr [0x668], ax
1:0526  2bc0              sub      ax, ax
1:0528  50                push     ax
1:0529  b90100            mov      cx, 1
1:052C  51                push     cx
1:052D  baffff            mov      dx, 0xffff
1:0530  bbff00            mov      bx, 0xff
1:0533  53                push     bx
1:0534  52                push     dx
1:0535  9a5c050000        lcall    0, 0x55c  ; @1:GDI.CreatePen
1:053A  a39806            mov      word ptr [0x698], ax
1:053D  2bc0              sub      ax, ax
1:053F  50                push     ax
1:0540  b80100            mov      ax, 1
1:0543  50                push     ax
1:0544  b8ffff            mov      ax, 0xffff
1:0547  baff00            mov      dx, 0xff
1:054A  eb3a              jmp      0x586
1:054C  2bc0              sub      ax, ax
1:054E  50                push     ax
1:054F  b90200            mov      cx, 2
1:0552  51                push     cx
1:0553  b9ffff            mov      cx, 0xffff
1:0556  baff00            mov      dx, 0xff
1:0559  52                push     dx
1:055A  51                push     cx
1:055B  9a73050000        lcall    0, 0x573  ; @1:GDI.CreatePen
1:0560  a36806            mov      word ptr [0x668], ax
1:0563  2bc0              sub      ax, ax
1:0565  50                push     ax
1:0566  b90100            mov      cx, 1
1:0569  51                push     cx
1:056A  ba8c8c            mov      dx, 0x8c8c
1:056D  bb8c00            mov      bx, 0x8c
1:0570  53                push     bx
1:0571  52                push     dx
1:0572  9a89050000        lcall    0, 0x589  ; @1:GDI.CreatePen
1:0577  a39806            mov      word ptr [0x698], ax
1:057A  2bc0              sub      ax, ax
1:057C  50                push     ax
1:057D  b80100            mov      ax, 1
1:0580  50                push     ax
1:0581  b800ff            mov      ax, 0xff00
1:0584  2bd2              sub      dx, dx
1:0586  52                push     dx
1:0587  50                push     ax
1:0588  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreatePen
1:058D  a33805            mov      word ptr [0x538], ax
1:0590  ff363a05          push     word ptr [0x53a]
1:0594  ff366e06          push     word ptr [0x66e]
1:0598  9aca050000        lcall    0, 0x5ca  ; @1:GDI.SelectObject
1:059D  a38c06            mov      word ptr [0x68c], ax
1:05A0  ff363a05          push     word ptr [0x53a]
1:05A4  b80100            mov      ax, 1
1:05A7  50                push     ax
1:05A8  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkMode
1:05AD  ff363a05          push     word ptr [0x53a]
1:05B1  2bc0              sub      ax, ax
1:05B3  50                push     ax
1:05B4  50                push     ax
1:05B5  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkColor
1:05BA  833e780600        cmp      word ptr [0x678], 0
1:05BF  7410              je       0x5d1
1:05C1  ff363a05          push     word ptr [0x53a]
1:05C5  ff365a06          push     word ptr [0x65a]
1:05C9  9a39060000        lcall    0, 0x639  ; @1:GDI.SelectObject
1:05CE  a38e06            mov      word ptr [0x68e], ax
1:05D1  2bc0              sub      ax, ax
1:05D3  4d                dec      bp
1:05D4  4d                dec      bp
1:05D5  8be5              mov      sp, bp
1:05D7  1f                pop      ds
1:05D8  5d                pop      bp
1:05D9  4d                dec      bp
1:05DA  cb                retf     
1:05DB  1e                push     ds
1:05DC  58                pop      ax
1:05DD  90                nop      
1:05DE  45                inc      bp
1:05DF  55                push     bp
1:05E0  8bec              mov      bp, sp
1:05E2  1e                push     ds
1:05E3  8ed8              mov      ds, ax
1:05E5  83ec30            sub      sp, 0x30
1:05E8  57                push     di
1:05E9  56                push     si
1:05EA  8d46e0            lea      ax, [bp - 0x20]
1:05ED  16                push     ss
1:05EE  50                push     ax
1:05EF  2bc0              sub      ax, ax
1:05F1  50                push     ax
1:05F2  50                push     ax
1:05F3  c41eb806          les      bx, ptr [0x6b8]
1:05F7  26ff7702          push     word ptr es:[bx + 2]
1:05FB  26ff7704          push     word ptr es:[bx + 4]
1:05FF  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:0604  ff363a05          push     word ptr [0x53a]
1:0608  8d46e0            lea      ax, [bp - 0x20]
1:060B  16                push     ss
1:060C  50                push     ax
1:060D  b80400            mov      ax, 4
1:0610  50                push     ax
1:0611  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:0616  50                push     ax
1:0617  9affff0000        lcall    0, 0xffff  ; @1:USER.FillRect
1:061C  9a3e060000        lcall    0, 0x63e  ; @1:INT:ord_8(1:17F4)
1:0621  2d803e            sub      ax, 0x3e80
1:0624  b91e00            mov      cx, 0x1e
1:0627  99                cdq      
1:0628  f7f9              idiv     cx
1:062A  83c232            add      dx, 0x32
1:062D  8956f2            mov      word ptr [bp - 0xe], dx
1:0630  ff363a05          push     word ptr [0x53a]
1:0634  ff363805          push     word ptr [0x538]
1:0638  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectObject
1:063D  9a97060000        lcall    0, 0x697  ; @1:INT:ord_8(1:17F4)
1:0642  2d803e            sub      ax, 0x3e80
1:0645  b90300            mov      cx, 3
1:0648  99                cdq      
1:0649  f7f9              idiv     cx
1:064B  0bd2              or       dx, dx
1:064D  7403              je       0x652
1:064F  e94802            jmp      0x89a
1:0652  b80200            mov      ax, 2
1:0655  99                cdq      
1:0656  52                push     dx
1:0657  50                push     ax
1:0658  ff36a606          push     word ptr [0x6a6]
1:065C  ff36a406          push     word ptr [0x6a4]
1:0660  9a7a060000        lcall    0, 0x67a  ; @1:INT:ord_9(1:1864)
1:0665  8946ea            mov      word ptr [bp - 0x16], ax
1:0668  b90300            mov      cx, 3
1:066B  2bd2              sub      dx, dx
1:066D  52                push     dx
1:066E  51                push     cx
1:066F  ff36a606          push     word ptr [0x6a6]
1:0673  ff36a406          push     word ptr [0x6a4]
1:0677  8bf0              mov      si, ax
1:0679  9a90060000        lcall    0, 0x690  ; @1:INT:ord_9(1:1864)
1:067E  8946de            mov      word ptr [bp - 0x22], ax
1:0681  b80500            mov      ax, 5
1:0684  99                cdq      
1:0685  52                push     dx
1:0686  50                push     ax
1:0687  ff36a606          push     word ptr [0x6a6]
1:068B  ff36a406          push     word ptr [0x6a4]
1:068F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:1864)
1:0694  8bf8              mov      di, ax
1:0696  9aa6060000        lcall    0, 0x6a6  ; @1:INT:ord_8(1:17F4)
1:069B  2d803e            sub      ax, 0x3e80
1:069E  23f8              and      di, ax
1:06A0  03f7              add      si, di
1:06A2  8976ec            mov      word ptr [bp - 0x14], si
1:06A5  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:17F4)
1:06AA  2d803e            sub      ax, 0x3e80
1:06AD  8bc8              mov      cx, ax
1:06AF  a13605            mov      ax, word ptr [0x536]
1:06B2  bb0500            mov      bx, 5
1:06B5  99                cdq      
1:06B6  f7fb              idiv     bx
1:06B8  8bd0              mov      dx, ax
1:06BA  8bc1              mov      ax, cx
1:06BC  8bca              mov      cx, dx
1:06BE  99                cdq      
1:06BF  f7f9              idiv     cx
1:06C1  a13605            mov      ax, word ptr [0x536]
1:06C4  8bca              mov      cx, dx
1:06C6  99                cdq      
1:06C7  2bc2              sub      ax, dx
1:06C9  d1f8              sar      ax, 1
1:06CB  03c8              add      cx, ax
1:06CD  894ef8            mov      word ptr [bp - 8], cx
1:06D0  ff363a05          push     word ptr [0x53a]
1:06D4  ff76ec            push     word ptr [bp - 0x14]
1:06D7  2bc0              sub      ax, ax
1:06D9  50                push     ax
1:06DA  9afa060000        lcall    0, 0x6fa  ; @1:GDI.MoveTo
1:06DF  ff363a05          push     word ptr [0x53a]
1:06E3  ff76ec            push     word ptr [bp - 0x14]
1:06E6  ff363605          push     word ptr [0x536]
1:06EA  9a0a070000        lcall    0, 0x70a  ; @1:GDI.LineTo
1:06EF  ff363a05          push     word ptr [0x53a]
1:06F3  2bc0              sub      ax, ax
1:06F5  50                push     ax
1:06F6  ff76f8            push     word ptr [bp - 8]
1:06F9  9a23070000        lcall    0, 0x723  ; @1:GDI.MoveTo
1:06FE  ff363a05          push     word ptr [0x53a]
1:0702  ff363405          push     word ptr [0x534]
1:0706  ff76f8            push     word ptr [bp - 8]
1:0709  9a3a070000        lcall    0, 0x73a  ; @1:GDI.LineTo
1:070E  ff363a05          push     word ptr [0x53a]
1:0712  8b46ec            mov      ax, word ptr [bp - 0x14]
1:0715  8b0ea406          mov      cx, word ptr [0x6a4]
1:0719  2bc1              sub      ax, cx
1:071B  50                push     ax
1:071C  2b4ef8            sub      cx, word ptr [bp - 8]
1:071F  f7d9              neg      cx
1:0721  51                push     cx
1:0722  9a51070000        lcall    0, 0x751  ; @1:GDI.MoveTo
1:0727  ff363a05          push     word ptr [0x53a]
1:072B  a1a406            mov      ax, word ptr [0x6a4]
1:072E  0346ec            add      ax, word ptr [bp - 0x14]
1:0731  50                push     ax
1:0732  a1a406            mov      ax, word ptr [0x6a4]
1:0735  0346f8            add      ax, word ptr [bp - 8]
1:0738  50                push     ax
1:0739  9affff0000        lcall    0, 0xffff  ; @1:GDI.LineTo
1:073E  ff363a05          push     word ptr [0x53a]
1:0742  8b46ec            mov      ax, word ptr [bp - 0x14]
1:0745  8b0ea406          mov      cx, word ptr [0x6a4]
1:0749  2bc1              sub      ax, cx
1:074B  50                push     ax
1:074C  034ef8            add      cx, word ptr [bp - 8]
1:074F  51                push     cx
1:0750  9affff0000        lcall    0, 0xffff  ; @1:GDI.MoveTo
1:0755  ff363a05          push     word ptr [0x53a]
1:0759  a1a406            mov      ax, word ptr [0x6a4]
1:075C  0346ec            add      ax, word ptr [bp - 0x14]
1:075F  50                push     ax
1:0760  8b46f8            mov      ax, word ptr [bp - 8]
1:0763  2b06a406          sub      ax, word ptr [0x6a4]
1:0767  50                push     ax
1:0768  9a9d070000        lcall    0, 0x79d  ; @1:GDI.LineTo
1:076D  ff363a05          push     word ptr [0x53a]
1:0771  8b46ec            mov      ax, word ptr [bp - 0x14]
1:0774  0346ea            add      ax, word ptr [bp - 0x16]
1:0777  50                push     ax
1:0778  8b4ef8            mov      cx, word ptr [bp - 8]
1:077B  2b0ea406          sub      cx, word ptr [0x6a4]
1:077F  51                push     cx
1:0780  8bf0              mov      si, ax
1:0782  9ab7070000        lcall    0, 0x7b7  ; @1:GDI.MoveTo
1:0787  ff363a05          push     word ptr [0x53a]
1:078B  8b46ec            mov      ax, word ptr [bp - 0x14]
1:078E  2b46ea            sub      ax, word ptr [bp - 0x16]
1:0791  50                push     ax
1:0792  8b0ea406          mov      cx, word ptr [0x6a4]
1:0796  034ef8            add      cx, word ptr [bp - 8]
1:0799  51                push     cx
1:079A  8bf8              mov      di, ax
1:079C  9ad2070000        lcall    0, 0x7d2  ; @1:GDI.LineTo
1:07A1  ff363a05          push     word ptr [0x53a]
1:07A5  a1a406            mov      ax, word ptr [0x6a4]
1:07A8  0346ec            add      ax, word ptr [bp - 0x14]
1:07AB  50                push     ax
1:07AC  8b46f8            mov      ax, word ptr [bp - 8]
1:07AF  2b46ea            sub      ax, word ptr [bp - 0x16]
1:07B2  50                push     ax
1:07B3  8946d2            mov      word ptr [bp - 0x2e], ax
1:07B6  9ae5070000        lcall    0, 0x7e5  ; @1:GDI.MoveTo
1:07BB  ff363a05          push     word ptr [0x53a]
1:07BF  8b46ec            mov      ax, word ptr [bp - 0x14]
1:07C2  2b06a406          sub      ax, word ptr [0x6a4]
1:07C6  50                push     ax
1:07C7  8b46f8            mov      ax, word ptr [bp - 8]
1:07CA  0346ea            add      ax, word ptr [bp - 0x16]
1:07CD  50                push     ax
1:07CE  8946d0            mov      word ptr [bp - 0x30], ax
1:07D1  9af9070000        lcall    0, 0x7f9  ; @1:GDI.LineTo
1:07D6  ff363a05          push     word ptr [0x53a]
1:07DA  a1a406            mov      ax, word ptr [0x6a4]
1:07DD  0346ec            add      ax, word ptr [bp - 0x14]
1:07E0  50                push     ax
1:07E1  ff76d0            push     word ptr [bp - 0x30]
1:07E4  9a0a080000        lcall    0, 0x80a  ; @1:GDI.MoveTo
1:07E9  ff363a05          push     word ptr [0x53a]
1:07ED  8b46ec            mov      ax, word ptr [bp - 0x14]
1:07F0  2b06a406          sub      ax, word ptr [0x6a4]
1:07F4  50                push     ax
1:07F5  ff76d2            push     word ptr [bp - 0x2e]
1:07F8  9a1c080000        lcall    0, 0x81c  ; @1:GDI.LineTo
1:07FD  ff363a05          push     word ptr [0x53a]
1:0801  56                push     si
1:0802  a1a406            mov      ax, word ptr [0x6a4]
1:0805  0346f8            add      ax, word ptr [bp - 8]
1:0808  50                push     ax
1:0809  9a6c090000        lcall    0, 0x96c  ; @1:GDI.MoveTo
1:080E  ff363a05          push     word ptr [0x53a]
1:0812  57                push     di
1:0813  8b46f8            mov      ax, word ptr [bp - 8]
1:0816  2b06a406          sub      ax, word ptr [0x6a4]
1:081A  50                push     ax
1:081B  9a7a090000        lcall    0, 0x97a  ; @1:GDI.LineTo
1:0820  ff363a05          push     word ptr [0x53a]
1:0824  ff369806          push     word ptr [0x698]
1:0828  9ae90a0000        lcall    0, 0xae9  ; @1:GDI.SelectObject
1:082D  8b46ec            mov      ax, word ptr [bp - 0x14]
1:0830  2b46f2            sub      ax, word ptr [bp - 0xe]
1:0833  a34006            mov      word ptr [0x640], ax
1:0836  8b46ec            mov      ax, word ptr [bp - 0x14]
1:0839  0346f2            add      ax, word ptr [bp - 0xe]
1:083C  a3a206            mov      word ptr [0x6a2], ax
1:083F  8b46f8            mov      ax, word ptr [bp - 8]
1:0842  2b46f2            sub      ax, word ptr [bp - 0xe]
1:0845  a39006            mov      word ptr [0x690], ax
1:0848  8b46f8            mov      ax, word ptr [bp - 8]
1:084B  0346f2            add      ax, word ptr [bp - 0xe]
1:084E  a3b606            mov      word ptr [0x6b6], ax
1:0851  8b46de            mov      ax, word ptr [bp - 0x22]
1:0854  f7d8              neg      ax
1:0856  3b064006          cmp      ax, word ptr [0x640]
1:085A  7c10              jl       0x86c
1:085C  8b46de            mov      ax, word ptr [bp - 0x22]
1:085F  03063405          add      ax, word ptr [0x534]
1:0863  3b06a206          cmp      ax, word ptr [0x6a2]
1:0867  7f03              jg       0x86c
1:0869  e97402            jmp      0xae0
1:086C  ff363a05          push     word ptr [0x53a]
1:0870  ff364006          push     word ptr [0x640]
1:0874  ff369006          push     word ptr [0x690]
1:0878  ff36a206          push     word ptr [0x6a2]
1:087C  ff36b606          push     word ptr [0x6b6]
1:0880  9affff0000        lcall    0, 0xffff  ; @1:GDI.Ellipse
1:0885  8b46f2            mov      ax, word ptr [bp - 0xe]
1:0888  29064006          sub      word ptr [0x640], ax
1:088C  0106a206          add      word ptr [0x6a2], ax
1:0890  29069006          sub      word ptr [0x690], ax
1:0894  0106b606          add      word ptr [0x6b6], ax
1:0898  ebb7              jmp      0x851
1:089A  9ab0080000        lcall    0, 0x8b0  ; @1:INT:ord_8(1:17F4)
1:089F  2d803e            sub      ax, 0x3e80
1:08A2  b90200            mov      cx, 2
1:08A5  99                cdq      
1:08A6  f7f9              idiv     cx
1:08A8  0bd2              or       dx, dx
1:08AA  7403              je       0x8af
1:08AC  e9d100            jmp      0x980
1:08AF  9ac1080000        lcall    0, 0x8c1  ; @1:INT:ord_8(1:17F4)
1:08B4  2d803e            sub      ax, 0x3e80
1:08B7  b91e00            mov      cx, 0x1e
1:08BA  99                cdq      
1:08BB  f7f9              idiv     cx
1:08BD  8956fc            mov      word ptr [bp - 4], dx
1:08C0  9ad5080000        lcall    0, 0x8d5  ; @1:INT:ord_8(1:17F4)
1:08C5  2d803e            sub      ax, 0x3e80
1:08C8  b91400            mov      cx, 0x14
1:08CB  99                cdq      
1:08CC  f7f9              idiv     cx
1:08CE  83c21e            add      dx, 0x1e
1:08D1  8956fa            mov      word ptr [bp - 6], dx
1:08D4  9a81090000        lcall    0, 0x981  ; @1:INT:ord_8(1:17F4)
1:08D9  2d803e            sub      ax, 0x3e80
1:08DC  b91400            mov      cx, 0x14
1:08DF  99                cdq      
1:08E0  f7f9              idiv     cx
1:08E2  52                push     dx
1:08E3  0e                push     cs
1:08E4  e897f7            call     0x7e
1:08E7  5b                pop      bx
1:08E8  03063605          add      ax, word ptr [0x536]
1:08EC  99                cdq      
1:08ED  8946ee            mov      word ptr [bp - 0x12], ax
1:08F0  8956f0            mov      word ptr [bp - 0x10], dx
1:08F3  8b46fa            mov      ax, word ptr [bp - 6]
1:08F6  99                cdq      
1:08F7  52                push     dx
1:08F8  50                push     ax
1:08F9  0e                push     cs
1:08FA  e803f7            call     0
1:08FD  5b                pop      bx
1:08FE  5b                pop      bx
1:08FF  a38006            mov      word ptr [0x680], ax
1:0902  89168206          mov      word ptr [0x682], dx
1:0906  c746e80100        mov      word ptr [bp - 0x18], 1
1:090B  eb03              jmp      0x910
1:090D  ff46e8            inc      word ptr [bp - 0x18]
1:0910  8b46e8            mov      ax, word ptr [bp - 0x18]
1:0913  3946fa            cmp      word ptr [bp - 6], ax
1:0916  7d03              jge      0x91b
1:0918  e9a200            jmp      0x9bd
1:091B  a18006            mov      ax, word ptr [0x680]
1:091E  8b168206          mov      dx, word ptr [0x682]
1:0922  b108              mov      cl, 8
1:0924  9a34090000        lcall    0, 0x934  ; @1:INT:ord_11(1:19D0)
1:0929  52                push     dx
1:092A  50                push     ax
1:092B  8b46ee            mov      ax, word ptr [bp - 0x12]
1:092E  8b56f0            mov      dx, word ptr [bp - 0x10]
1:0931  b108              mov      cl, 8
1:0933  9a480a0000        lcall    0, 0xa48  ; @1:INT:ord_11(1:19D0)
1:0938  52                push     dx
1:0939  50                push     ax
1:093A  8b46e8            mov      ax, word ptr [bp - 0x18]
1:093D  99                cdq      
1:093E  52                push     dx
1:093F  50                push     ax
1:0940  0e                push     cs
1:0941  e8bcf6            call     0
1:0944  5b                pop      bx
1:0945  5b                pop      bx
1:0946  2ac0              sub      al, al
1:0948  52                push     dx
1:0949  50                push     ax
1:094A  9a6e0a0000        lcall    0, 0xa6e  ; @1:INT:ord_10(1:18FE)
1:094F  52                push     dx
1:0950  50                push     ax
1:0951  9a750a0000        lcall    0, 0xa75  ; @1:INT:ord_9(1:1864)
1:0956  d1e0              shl      ax, 1
1:0958  8946f8            mov      word ptr [bp - 8], ax
1:095B  ff363a05          push     word ptr [0x53a]
1:095F  2bc0              sub      ax, ax
1:0961  50                push     ax
1:0962  8b46fc            mov      ax, word ptr [bp - 4]
1:0965  0346f8            add      ax, word ptr [bp - 8]
1:0968  50                push     ax
1:0969  8bf0              mov      si, ax
1:096B  9a9a090000        lcall    0, 0x99a  ; @1:GDI.MoveTo
1:0970  ff363a05          push     word ptr [0x53a]
1:0974  ff363405          push     word ptr [0x534]
1:0978  56                push     si
1:0979  9aaa090000        lcall    0, 0x9aa  ; @1:GDI.LineTo
1:097E  eb8d              jmp      0x90d
1:0980  9abe090000        lcall    0, 0x9be  ; @1:INT:ord_8(1:17F4)
1:0985  2d803e            sub      ax, 0x3e80
1:0988  99                cdq      
1:0989  f77ef2            idiv     word ptr [bp - 0xe]
1:098C  8956e8            mov      word ptr [bp - 0x18], dx
1:098F  eb23              jmp      0x9b4
1:0991  ff363a05          push     word ptr [0x53a]
1:0995  2bc9              sub      cx, cx
1:0997  51                push     cx
1:0998  50                push     ax
1:0999  9a8f0a0000        lcall    0, 0xa8f  ; @1:GDI.MoveTo
1:099E  ff363a05          push     word ptr [0x53a]
1:09A2  ff363405          push     word ptr [0x534]
1:09A6  ff76e8            push     word ptr [bp - 0x18]
1:09A9  9a9d0a0000        lcall    0, 0xa9d  ; @1:GDI.LineTo
1:09AE  8b46f2            mov      ax, word ptr [bp - 0xe]
1:09B1  0146e8            add      word ptr [bp - 0x18], ax
1:09B4  8b46e8            mov      ax, word ptr [bp - 0x18]
1:09B7  39063605          cmp      word ptr [0x536], ax
1:09BB  7fd4              jg       0x991
1:09BD  9ad3090000        lcall    0, 0x9d3  ; @1:INT:ord_8(1:17F4)
1:09C2  2d803e            sub      ax, 0x3e80
1:09C5  b90200            mov      cx, 2
1:09C8  99                cdq      
1:09C9  f7f9              idiv     cx
1:09CB  0bd2              or       dx, dx
1:09CD  7403              je       0x9d2
1:09CF  e9d100            jmp      0xaa3
1:09D2  9ae4090000        lcall    0, 0x9e4  ; @1:INT:ord_8(1:17F4)
1:09D7  2d803e            sub      ax, 0x3e80
1:09DA  b91e00            mov      cx, 0x1e
1:09DD  99                cdq      
1:09DE  f7f9              idiv     cx
1:09E0  8956fc            mov      word ptr [bp - 4], dx
1:09E3  9af8090000        lcall    0, 0x9f8  ; @1:INT:ord_8(1:17F4)
1:09E8  2d803e            sub      ax, 0x3e80
1:09EB  b91400            mov      cx, 0x14
1:09EE  99                cdq      
1:09EF  f7f9              idiv     cx
1:09F1  83c21e            add      dx, 0x1e
1:09F4  8956fa            mov      word ptr [bp - 6], dx
1:09F7  9aa40a0000        lcall    0, 0xaa4  ; @1:INT:ord_8(1:17F4)
1:09FC  2d803e            sub      ax, 0x3e80
1:09FF  b91400            mov      cx, 0x14
1:0A02  99                cdq      
1:0A03  f7f9              idiv     cx
1:0A05  52                push     dx
1:0A06  0e                push     cs
1:0A07  e874f6            call     0x7e
1:0A0A  5b                pop      bx
1:0A0B  03063405          add      ax, word ptr [0x534]
1:0A0F  99                cdq      
1:0A10  8946f4            mov      word ptr [bp - 0xc], ax
1:0A13  8956f6            mov      word ptr [bp - 0xa], dx
1:0A16  8b46fa            mov      ax, word ptr [bp - 6]
1:0A19  99                cdq      
1:0A1A  52                push     dx
1:0A1B  50                push     ax
1:0A1C  0e                push     cs
1:0A1D  e8e0f5            call     0
1:0A20  5b                pop      bx
1:0A21  5b                pop      bx
1:0A22  a38006            mov      word ptr [0x680], ax
1:0A25  89168206          mov      word ptr [0x682], dx
1:0A29  c746e80100        mov      word ptr [bp - 0x18], 1
1:0A2E  eb03              jmp      0xa33
1:0A30  ff46e8            inc      word ptr [bp - 0x18]
1:0A33  8b46e8            mov      ax, word ptr [bp - 0x18]
1:0A36  3946fa            cmp      word ptr [bp - 6], ax
1:0A39  7d03              jge      0xa3e
1:0A3B  e9a200            jmp      0xae0
1:0A3E  a18006            mov      ax, word ptr [0x680]
1:0A41  8b168206          mov      dx, word ptr [0x682]
1:0A45  b108              mov      cl, 8
1:0A47  9a570a0000        lcall    0, 0xa57  ; @1:INT:ord_11(1:19D0)
1:0A4C  52                push     dx
1:0A4D  50                push     ax
1:0A4E  8b46f4            mov      ax, word ptr [bp - 0xc]
1:0A51  8b56f6            mov      dx, word ptr [bp - 0xa]
1:0A54  b108              mov      cl, 8
1:0A56  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:19D0)
1:0A5B  52                push     dx
1:0A5C  50                push     ax
1:0A5D  8b46e8            mov      ax, word ptr [bp - 0x18]
1:0A60  99                cdq      
1:0A61  52                push     dx
1:0A62  50                push     ax
1:0A63  0e                push     cs
1:0A64  e899f5            call     0
1:0A67  5b                pop      bx
1:0A68  5b                pop      bx
1:0A69  2ac0              sub      al, al
1:0A6B  52                push     dx
1:0A6C  50                push     ax
1:0A6D  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:18FE)
1:0A72  52                push     dx
1:0A73  50                push     ax
1:0A74  9a61060000        lcall    0, 0x661  ; @1:INT:ord_9(1:1864)
1:0A79  d1e0              shl      ax, 1
1:0A7B  8946ec            mov      word ptr [bp - 0x14], ax
1:0A7E  ff363a05          push     word ptr [0x53a]
1:0A82  8b46fc            mov      ax, word ptr [bp - 4]
1:0A85  0346ec            add      ax, word ptr [bp - 0x14]
1:0A88  50                push     ax
1:0A89  2bc9              sub      cx, cx
1:0A8B  51                push     cx
1:0A8C  8bf0              mov      si, ax
1:0A8E  9abd0a0000        lcall    0, 0xabd  ; @1:GDI.MoveTo
1:0A93  ff363a05          push     word ptr [0x53a]
1:0A97  56                push     si
1:0A98  ff363605          push     word ptr [0x536]
1:0A9C  9acd0a0000        lcall    0, 0xacd  ; @1:GDI.LineTo
1:0AA1  eb8d              jmp      0xa30
1:0AA3  9aee0a0000        lcall    0, 0xaee  ; @1:INT:ord_8(1:17F4)
1:0AA8  2d803e            sub      ax, 0x3e80
1:0AAB  99                cdq      
1:0AAC  f77ef2            idiv     word ptr [bp - 0xe]
1:0AAF  8956e8            mov      word ptr [bp - 0x18], dx
1:0AB2  eb23              jmp      0xad7
1:0AB4  ff363a05          push     word ptr [0x53a]
1:0AB8  50                push     ax
1:0AB9  2bc9              sub      cx, cx
1:0ABB  51                push     cx
1:0ABC  9adb060000        lcall    0, 0x6db  ; @1:GDI.MoveTo
1:0AC1  ff363a05          push     word ptr [0x53a]
1:0AC5  ff76e8            push     word ptr [bp - 0x18]
1:0AC8  ff363605          push     word ptr [0x536]
1:0ACC  9aeb060000        lcall    0, 0x6eb  ; @1:GDI.LineTo
1:0AD1  8b46f2            mov      ax, word ptr [bp - 0xe]
1:0AD4  0146e8            add      word ptr [bp - 0x18], ax
1:0AD7  8b46e8            mov      ax, word ptr [bp - 0x18]
1:0ADA  39063405          cmp      word ptr [0x534], ax
1:0ADE  7fd4              jg       0xab4
1:0AE0  ff363a05          push     word ptr [0x53a]
1:0AE4  ff366e06          push     word ptr [0x66e]
1:0AE8  9a99050000        lcall    0, 0x599  ; @1:GDI.SelectObject
1:0AED  9a080b0000        lcall    0, 0xb08  ; @1:INT:ord_8(1:17F4)
1:0AF2  2d803e            sub      ax, 0x3e80
1:0AF5  b93200            mov      cx, 0x32
1:0AF8  99                cdq      
1:0AF9  f7f9              idiv     cx
1:0AFB  52                push     dx
1:0AFC  0e                push     cs
1:0AFD  e87ef5            call     0x7e
1:0B00  5b                pop      bx
1:0B01  051400            add      ax, 0x14
1:0B04  8946ec            mov      word ptr [bp - 0x14], ax
1:0B07  9a1d060000        lcall    0, 0x61d  ; @1:INT:ord_8(1:17F4)
1:0B0C  2d803e            sub      ax, 0x3e80
1:0B0F  8b0e3605          mov      cx, word ptr [0x536]
1:0B13  83e946            sub      cx, 0x46
1:0B16  99                cdq      
1:0B17  f7f9              idiv     cx
1:0B19  52                push     dx
1:0B1A  0e                push     cs
1:0B1B  e860f5            call     0x7e
1:0B1E  5b                pop      bx
1:0B1F  051400            add      ax, 0x14
1:0B22  8946f8            mov      word ptr [bp - 8], ax
1:0B25  833e780600        cmp      word ptr [0x678], 0
1:0B2A  7503              jne      0xb2f
1:0B2C  e96d01            jmp      0xc9c
1:0B2F  b84005            mov      ax, 0x540
1:0B32  50                push     ax
1:0B33  9a790b0000        lcall    0, 0xb79  ; @1:INT:ord_8(1:17F4)
1:0B38  2d803e            sub      ax, 0x3e80
1:0B3B  50                push     ax
1:0B3C  0e                push     cs
1:0B3D  e83ef5            call     0x7e
1:0B40  5b                pop      bx
1:0B41  99                cdq      
1:0B42  f73eb006          idiv     word ptr [0x6b0]
1:0B46  03165006          add      dx, word ptr [0x650]
1:0B4A  52                push     dx
1:0B4B  0e                push     cs
1:0B4C  e867f6            call     0x1b6
1:0B4F  5b                pop      bx
1:0B50  5b                pop      bx
1:0B51  b84005            mov      ax, 0x540
1:0B54  50                push     ax
1:0B55  9a6f0b0000        lcall    0, 0xb6f  ; @1:INT:ord_5(1:1762)
1:0B5A  5b                pop      bx
1:0B5B  8946da            mov      word ptr [bp - 0x26], ax
1:0B5E  8bd8              mov      bx, ax
1:0B60  c687400520        mov      byte ptr [bx + 0x540], 0x20
1:0B65  c687410500        mov      byte ptr [bx + 0x541], 0
1:0B6A  b84005            mov      ax, 0x540
1:0B6D  50                push     ax
1:0B6E  9a9b0b0000        lcall    0, 0xb9b  ; @1:INT:ord_5(1:1762)
1:0B73  5b                pop      bx
1:0B74  054005            add      ax, 0x540
1:0B77  50                push     ax
1:0B78  9abe0b0000        lcall    0, 0xbbe  ; @1:INT:ord_8(1:17F4)
1:0B7D  2d803e            sub      ax, 0x3e80
1:0B80  50                push     ax
1:0B81  0e                push     cs
1:0B82  e8f9f4            call     0x7e
1:0B85  5b                pop      bx
1:0B86  99                cdq      
1:0B87  f73eb206          idiv     word ptr [0x6b2]
1:0B8B  03165206          add      dx, word ptr [0x652]
1:0B8F  52                push     dx
1:0B90  0e                push     cs
1:0B91  e822f6            call     0x1b6
1:0B94  5b                pop      bx
1:0B95  5b                pop      bx
1:0B96  b84005            mov      ax, 0x540
1:0B99  50                push     ax
1:0B9A  9ab40b0000        lcall    0, 0xbb4  ; @1:INT:ord_5(1:1762)
1:0B9F  5b                pop      bx
1:0BA0  8946da            mov      word ptr [bp - 0x26], ax
1:0BA3  8bd8              mov      bx, ax
1:0BA5  c687400520        mov      byte ptr [bx + 0x540], 0x20
1:0BAA  c687410500        mov      byte ptr [bx + 0x541], 0
1:0BAF  b84005            mov      ax, 0x540
1:0BB2  50                push     ax
1:0BB3  9a260c0000        lcall    0, 0xc26  ; @1:INT:ord_5(1:1762)
1:0BB8  5b                pop      bx
1:0BB9  054005            add      ax, 0x540
1:0BBC  50                push     ax
1:0BBD  9a320c0000        lcall    0, 0xc32  ; @1:INT:ord_8(1:17F4)
1:0BC2  2d803e            sub      ax, 0x3e80
1:0BC5  50                push     ax
1:0BC6  0e                push     cs
1:0BC7  e8b4f4            call     0x7e
1:0BCA  5b                pop      bx
1:0BCB  99                cdq      
1:0BCC  f73eb406          idiv     word ptr [0x6b4]
1:0BD0  03165406          add      dx, word ptr [0x654]
1:0BD4  52                push     dx
1:0BD5  0e                push     cs
1:0BD6  e8ddf5            call     0x1b6
1:0BD9  5b                pop      bx
1:0BDA  5b                pop      bx
1:0BDB  ff363a05          push     word ptr [0x53a]
1:0BDF  b8ffff            mov      ax, 0xffff
1:0BE2  baff00            mov      dx, 0xff
1:0BE5  52                push     dx
1:0BE6  50                push     ax
1:0BE7  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextColor
1:0BEC  ff363a05          push     word ptr [0x53a]
1:0BF0  2bc0              sub      ax, ax
1:0BF2  50                push     ax
1:0BF3  50                push     ax
1:0BF4  9ab6050000        lcall    0, 0x5b6  ; @1:GDI.SetBkColor
1:0BF9  ff363a05          push     word ptr [0x53a]
1:0BFD  b80100            mov      ax, 1
1:0C00  50                push     ax
1:0C01  9aa9050000        lcall    0, 0x5a9  ; @1:GDI.SetBkMode
1:0C06  ff363a05          push     word ptr [0x53a]
1:0C0A  ff365a06          push     word ptr [0x65a]
1:0C0E  9a520c0000        lcall    0, 0xc52  ; @1:GDI.SelectObject
1:0C13  ff363a05          push     word ptr [0x53a]
1:0C17  ff76ec            push     word ptr [bp - 0x14]
1:0C1A  ff76f8            push     word ptr [bp - 8]
1:0C1D  b84005            mov      ax, 0x540
1:0C20  1e                push     ds
1:0C21  50                push     ax
1:0C22  8bc8              mov      cx, ax
1:0C24  51                push     cx
1:0C25  9a910c0000        lcall    0, 0xc91  ; @1:INT:ord_5(1:1762)
1:0C2A  5b                pop      bx
1:0C2B  50                push     ax
1:0C2C  9a980c0000        lcall    0, 0xc98  ; @1:GDI.TextOut
1:0C31  9a5b0c0000        lcall    0, 0xc5b  ; @1:INT:ord_8(1:17F4)
1:0C36  2d803e            sub      ax, 0x3e80
1:0C39  b90200            mov      cx, 2
1:0C3C  99                cdq      
1:0C3D  f7f9              idiv     cx
1:0C3F  52                push     dx
1:0C40  0e                push     cs
1:0C41  e83af4            call     0x7e
1:0C44  5b                pop      bx
1:0C45  0bc0              or       ax, ax
1:0C47  7553              jne      0xc9c
1:0C49  ff363a05          push     word ptr [0x53a]
1:0C4D  ff369606          push     word ptr [0x696]
1:0C51  9a190d0000        lcall    0, 0xd19  ; @1:GDI.SelectObject
1:0C56  b84005            mov      ax, 0x540
1:0C59  50                push     ax
1:0C5A  9a1e0d0000        lcall    0, 0xd1e  ; @1:INT:ord_8(1:17F4)
1:0C5F  2d803e            sub      ax, 0x3e80
1:0C62  50                push     ax
1:0C63  0e                push     cs
1:0C64  e817f4            call     0x7e
1:0C67  5b                pop      bx
1:0C68  99                cdq      
1:0C69  f73e6206          idiv     word ptr [0x662]
1:0C6D  03164806          add      dx, word ptr [0x648]
1:0C71  52                push     dx
1:0C72  0e                push     cs
1:0C73  e840f5            call     0x1b6
1:0C76  5b                pop      bx
1:0C77  5b                pop      bx
1:0C78  ff363a05          push     word ptr [0x53a]
1:0C7C  8b46ec            mov      ax, word ptr [bp - 0x14]
1:0C7F  051400            add      ax, 0x14
1:0C82  50                push     ax
1:0C83  8b46f8            mov      ax, word ptr [bp - 8]
1:0C86  051e00            add      ax, 0x1e
1:0C89  50                push     ax
1:0C8A  b84005            mov      ax, 0x540
1:0C8D  1e                push     ds
1:0C8E  50                push     ax
1:0C8F  50                push     ax
1:0C90  9ac1000000        lcall    0, 0xc1  ; @1:INT:ord_5(1:1762)
1:0C95  5b                pop      bx
1:0C96  50                push     ax
1:0C97  9affff0000        lcall    0, 0xffff  ; @1:GDI.TextOut
1:0C9C  5e                pop      si
1:0C9D  5f                pop      di
1:0C9E  4d                dec      bp
1:0C9F  4d                dec      bp
1:0CA0  8be5              mov      sp, bp
1:0CA2  1f                pop      ds
1:0CA3  5d                pop      bp
1:0CA4  4d                dec      bp
1:0CA5  cb                retf     
1:0CA6  1e                push     ds
1:0CA7  58                pop      ax
1:0CA8  90                nop      
1:0CA9  45                inc      bp
1:0CAA  55                push     bp
1:0CAB  8bec              mov      bp, sp
1:0CAD  1e                push     ds
1:0CAE  8ed8              mov      ds, ax
1:0CB0  83ec06            sub      sp, 6
1:0CB3  57                push     di
1:0CB4  56                push     si
1:0CB5  837e0600          cmp      word ptr [bp + 6], 0
1:0CB9  7534              jne      0xcef
1:0CBB  9affff0000        lcall    0, 0xffff  ; @1:USER.GetTickCount
1:0CC0  b104              mov      cl, 4
1:0CC2  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_13(1:19DC)
1:0CC7  2b068606          sub      ax, word ptr [0x686]
1:0CCB  1b168806          sbb      dx, word ptr [0x688]
1:0CCF  8bc8              mov      cx, ax
1:0CD1  b83c00            mov      ax, 0x3c
1:0CD4  c41eb806          les      bx, ptr [0x6b8]
1:0CD8  8bf2              mov      si, dx
1:0CDA  26f76f06          imul     word ptr es:[bx + 6]
1:0CDE  99                cdq      
1:0CDF  3bf2              cmp      si, dx
1:0CE1  7303              jae      0xce6
1:0CE3  e91c07            jmp      0x1402
1:0CE6  7707              ja       0xcef
1:0CE8  3bc8              cmp      cx, ax
1:0CEA  7703              ja       0xcef
1:0CEC  e91307            jmp      0x1402
1:0CEF  c41eb806          les      bx, ptr [0x6b8]
1:0CF3  268b4702          mov      ax, word ptr es:[bx + 2]
1:0CF7  a33405            mov      word ptr [0x534], ax
1:0CFA  268b4704          mov      ax, word ptr es:[bx + 4]
1:0CFE  a33605            mov      word ptr [0x536], ax
1:0D01  a13405            mov      ax, word ptr [0x534]
1:0D04  99                cdq      
1:0D05  a3a406            mov      word ptr [0x6a4], ax
1:0D08  8916a606          mov      word ptr [0x6a6], dx
1:0D0C  0e                push     cs
1:0D0D  e8cbf8            call     0x5db
1:0D10  ff363a05          push     word ptr [0x53a]
1:0D14  ff366806          push     word ptr [0x668]
1:0D18  9a29080000        lcall    0, 0x829  ; @1:GDI.SelectObject
1:0D1D  9a360d0000        lcall    0, 0xd36  ; @1:INT:ord_8(1:17F4)
1:0D22  2d803e            sub      ax, 0x3e80
1:0D25  b96400            mov      cx, 0x64
1:0D28  99                cdq      
1:0D29  f7f9              idiv     cx
1:0D2B  8bc2              mov      ax, dx
1:0D2D  99                cdq      
1:0D2E  a37006            mov      word ptr [0x670], ax
1:0D31  89167206          mov      word ptr [0x672], dx
1:0D35  9a520d0000        lcall    0, 0xd52  ; @1:INT:ord_8(1:17F4)
1:0D3A  2d803e            sub      ax, 0x3e80
1:0D3D  b90200            mov      cx, 2
1:0D40  99                cdq      
1:0D41  f7f9              idiv     cx
1:0D43  0bd2              or       dx, dx
1:0D45  750a              jne      0xd51
1:0D47  2bc0              sub      ax, ax
1:0D49  a37606            mov      word ptr [0x676], ax
1:0D4C  a37406            mov      word ptr [0x674], ax
1:0D4F  eb18              jmp      0xd69
1:0D51  9a6a0d0000        lcall    0, 0xd6a  ; @1:INT:ord_8(1:17F4)
1:0D56  2d803e            sub      ax, 0x3e80
1:0D59  b96400            mov      cx, 0x64
1:0D5C  99                cdq      
1:0D5D  f7f9              idiv     cx
1:0D5F  8bc2              mov      ax, dx
1:0D61  99                cdq      
1:0D62  a37406            mov      word ptr [0x674], ax
1:0D65  89167606          mov      word ptr [0x676], dx
1:0D69  9a860d0000        lcall    0, 0xd86  ; @1:INT:ord_8(1:17F4)
1:0D6E  2d803e            sub      ax, 0x3e80
1:0D71  b90200            mov      cx, 2
1:0D74  99                cdq      
1:0D75  f7f9              idiv     cx
1:0D77  0bd2              or       dx, dx
1:0D79  750a              jne      0xd85
1:0D7B  2bc0              sub      ax, ax
1:0D7D  a37c06            mov      word ptr [0x67c], ax
1:0D80  a37a06            mov      word ptr [0x67a], ax
1:0D83  eb18              jmp      0xd9d
1:0D85  9aa60d0000        lcall    0, 0xda6  ; @1:INT:ord_8(1:17F4)
1:0D8A  2d803e            sub      ax, 0x3e80
1:0D8D  b90a00            mov      cx, 0xa
1:0D90  99                cdq      
1:0D91  f7f9              idiv     cx
1:0D93  8bc2              mov      ax, dx
1:0D95  99                cdq      
1:0D96  a37a06            mov      word ptr [0x67a], ax
1:0D99  89167c06          mov      word ptr [0x67c], dx
1:0D9D  ff36a606          push     word ptr [0x6a6]
1:0DA1  ff36a406          push     word ptr [0x6a4]
1:0DA5  9a970e0000        lcall    0, 0xe97  ; @1:INT:ord_8(1:17F4)
1:0DAA  2d803e            sub      ax, 0x3e80
1:0DAD  99                cdq      
1:0DAE  52                push     dx
1:0DAF  50                push     ax
1:0DB0  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:1930)
1:0DB5  a39206            mov      word ptr [0x692], ax
1:0DB8  89169406          mov      word ptr [0x694], dx
1:0DBC  2bc0              sub      ax, ax
1:0DBE  a33e05            mov      word ptr [0x53e], ax
1:0DC1  a33c05            mov      word ptr [0x53c], ax
1:0DC4  a35806            mov      word ptr [0x658], ax
1:0DC7  a35606            mov      word ptr [0x656], ax
1:0DCA  a38a06            mov      word ptr [0x68a], ax
1:0DCD  eb04              jmp      0xdd3
1:0DCF  ff068a06          inc      word ptr [0x68a]
1:0DD3  a18a06            mov      ax, word ptr [0x68a]
1:0DD6  99                cdq      
1:0DD7  3b16a606          cmp      dx, word ptr [0x6a6]
1:0DDB  7e03              jle      0xde0
1:0DDD  e9b600            jmp      0xe96
1:0DE0  7c09              jl       0xdeb
1:0DE2  3b06a406          cmp      ax, word ptr [0x6a4]
1:0DE6  7603              jbe      0xdeb
1:0DE8  e9ab00            jmp      0xe96
1:0DEB  03069206          add      ax, word ptr [0x692]
1:0DEF  13169406          adc      dx, word ptr [0x694]
1:0DF3  a3a806            mov      word ptr [0x6a8], ax
1:0DF6  8916aa06          mov      word ptr [0x6aa], dx
1:0DFA  52                push     dx
1:0DFB  50                push     ax
1:0DFC  52                push     dx
1:0DFD  50                push     ax
1:0DFE  9a1b0e0000        lcall    0, 0xe1b  ; @1:INT:ord_10(1:18FE)
1:0E03  a36406            mov      word ptr [0x664], ax
1:0E06  89166606          mov      word ptr [0x666], dx
1:0E0A  ff367206          push     word ptr [0x672]
1:0E0E  ff367006          push     word ptr [0x670]
1:0E12  ff36aa06          push     word ptr [0x6aa]
1:0E16  ff36a806          push     word ptr [0x6a8]
1:0E1A  9a340e0000        lcall    0, 0xe34  ; @1:INT:ord_10(1:18FE)
1:0E1F  ff367c06          push     word ptr [0x67c]
1:0E23  ff367a06          push     word ptr [0x67a]
1:0E27  ff36aa06          push     word ptr [0x6aa]
1:0E2B  ff36a806          push     word ptr [0x6a8]
1:0E2F  8bf0              mov      si, ax
1:0E31  8bfa              mov      di, dx
1:0E33  9a4b0e0000        lcall    0, 0xe4b  ; @1:INT:ord_10(1:18FE)
1:0E38  03067406          add      ax, word ptr [0x674]
1:0E3C  13167606          adc      dx, word ptr [0x676]
1:0E40  52                push     dx
1:0E41  50                push     ax
1:0E42  ff366606          push     word ptr [0x666]
1:0E46  ff366406          push     word ptr [0x664]
1:0E4A  9a4b090000        lcall    0, 0x94b  ; @1:INT:ord_10(1:18FE)
1:0E4F  03f0              add      si, ax
1:0E51  13fa              adc      di, dx
1:0E53  8936ac06          mov      word ptr [0x6ac], si
1:0E57  893eae06          mov      word ptr [0x6ae], di
1:0E5B  3b3e3e05          cmp      di, word ptr [0x53e]
1:0E5F  7c10              jl       0xe71
1:0E61  7f06              jg       0xe69
1:0E63  3b363c05          cmp      si, word ptr [0x53c]
1:0E67  7608              jbe      0xe71
1:0E69  89363c05          mov      word ptr [0x53c], si
1:0E6D  893e3e05          mov      word ptr [0x53e], di
1:0E71  a15606            mov      ax, word ptr [0x656]
1:0E74  8b165806          mov      dx, word ptr [0x658]
1:0E78  3bfa              cmp      di, dx
1:0E7A  7e03              jle      0xe7f
1:0E7C  e950ff            jmp      0xdcf
1:0E7F  7c07              jl       0xe88
1:0E81  3bf0              cmp      si, ax
1:0E83  7203              jb       0xe88
1:0E85  e947ff            jmp      0xdcf
1:0E88  8bc6              mov      ax, si
1:0E8A  8bd7              mov      dx, di
1:0E8C  a35606            mov      word ptr [0x656], ax
1:0E8F  89165806          mov      word ptr [0x658], dx
1:0E93  e939ff            jmp      0xdcf
1:0E96  9a9b080000        lcall    0, 0x89b  ; @1:INT:ord_8(1:17F4)
1:0E9B  2d803e            sub      ax, 0x3e80
1:0E9E  b93200            mov      cx, 0x32
1:0EA1  99                cdq      
1:0EA2  f7f9              idiv     cx
1:0EA4  8bc2              mov      ax, dx
1:0EA6  99                cdq      
1:0EA7  a3bc06            mov      word ptr [0x6bc], ax
1:0EAA  8916be06          mov      word ptr [0x6be], dx
1:0EAE  a13605            mov      ax, word ptr [0x536]
1:0EB1  48                dec      ax
1:0EB2  99                cdq      
1:0EB3  52                push     dx
1:0EB4  50                push     ax
1:0EB5  a13c05            mov      ax, word ptr [0x53c]
1:0EB8  8b163e05          mov      dx, word ptr [0x53e]
1:0EBC  2b065606          sub      ax, word ptr [0x656]
1:0EC0  1b165806          sbb      dx, word ptr [0x658]
1:0EC4  52                push     dx
1:0EC5  50                push     ax
1:0EC6  9afa0e0000        lcall    0, 0xefa  ; @1:INT:ord_9(1:1864)
1:0ECB  a34406            mov      word ptr [0x644], ax
1:0ECE  89164606          mov      word ptr [0x646], dx
1:0ED2  b9e803            mov      cx, 0x3e8
1:0ED5  2bdb              sub      bx, bx
1:0ED7  53                push     bx
1:0ED8  51                push     cx
1:0ED9  8bf0              mov      si, ax
1:0EDB  8bfa              mov      di, dx
1:0EDD  9a220f0000        lcall    0, 0xf22  ; @1:INT:ord_8(1:17F4)
1:0EE2  b96400            mov      cx, 0x64
1:0EE5  2d803e            sub      ax, 0x3e80
1:0EE8  99                cdq      
1:0EE9  f7f9              idiv     cx
1:0EEB  8bc2              mov      ax, dx
1:0EED  99                cdq      
1:0EEE  52                push     dx
1:0EEF  50                push     ax
1:0EF0  57                push     di
1:0EF1  56                push     si
1:0EF2  9a560f0000        lcall    0, 0xf56  ; @1:INT:ord_10(1:18FE)
1:0EF7  52                push     dx
1:0EF8  50                push     ax
1:0EF9  9ab50f0000        lcall    0, 0xfb5  ; @1:INT:ord_9(1:1864)
1:0EFE  03f0              add      si, ax
1:0F00  13fa              adc      di, dx
1:0F02  89364406          mov      word ptr [0x644], si
1:0F06  893e4606          mov      word ptr [0x646], di
1:0F0A  0bff              or       di, di
1:0F0C  7d03              jge      0xf11
1:0F0E  e90cfe            jmp      0xd1d
1:0F11  7f08              jg       0xf1b
1:0F13  83fe01            cmp      si, 1
1:0F16  7303              jae      0xf1b
1:0F18  e902fe            jmp      0xd1d
1:0F1B  c706a0069cff      mov      word ptr [0x6a0], 0xff9c
1:0F21  9aee100000        lcall    0, 0x10ee  ; @1:INT:ord_8(1:17F4)
1:0F26  2d803e            sub      ax, 0x3e80
1:0F29  b90400            mov      cx, 4
1:0F2C  99                cdq      
1:0F2D  f7f9              idiv     cx
1:0F2F  83fa01            cmp      dx, 1
1:0F32  1bc0              sbb      ax, ax
1:0F34  f7d8              neg      ax
1:0F36  a37e06            mov      word ptr [0x67e], ax
1:0F39  a19206            mov      ax, word ptr [0x692]
1:0F3C  8b169406          mov      dx, word ptr [0x694]
1:0F40  2d0100            sub      ax, 1
1:0F43  83da00            sbb      dx, 0
1:0F46  a3a806            mov      word ptr [0x6a8], ax
1:0F49  8916aa06          mov      word ptr [0x6aa], dx
1:0F4D  52                push     dx
1:0F4E  50                push     ax
1:0F4F  52                push     dx
1:0F50  50                push     ax
1:0F51  8bf0              mov      si, ax
1:0F53  8bfa              mov      di, dx
1:0F55  9a7a0f0000        lcall    0, 0xf7a  ; @1:INT:ord_10(1:18FE)
1:0F5A  a36406            mov      word ptr [0x664], ax
1:0F5D  89166606          mov      word ptr [0x666], dx
1:0F61  ff364606          push     word ptr [0x646]
1:0F65  ff364406          push     word ptr [0x644]
1:0F69  ff367206          push     word ptr [0x672]
1:0F6D  ff367006          push     word ptr [0x670]
1:0F71  57                push     di
1:0F72  56                push     si
1:0F73  8946fa            mov      word ptr [bp - 6], ax
1:0F76  8956fc            mov      word ptr [bp - 4], dx
1:0F79  9a930f0000        lcall    0, 0xf93  ; @1:INT:ord_10(1:18FE)
1:0F7E  ff76fc            push     word ptr [bp - 4]
1:0F81  ff76fa            push     word ptr [bp - 6]
1:0F84  ff367c06          push     word ptr [0x67c]
1:0F88  ff367a06          push     word ptr [0x67a]
1:0F8C  57                push     di
1:0F8D  56                push     si
1:0F8E  8bf0              mov      si, ax
1:0F90  8bfa              mov      di, dx
1:0F92  9aa20f0000        lcall    0, 0xfa2  ; @1:INT:ord_10(1:18FE)
1:0F97  03067406          add      ax, word ptr [0x674]
1:0F9B  13167606          adc      dx, word ptr [0x676]
1:0F9F  52                push     dx
1:0FA0  50                push     ax
1:0FA1  9a0f100000        lcall    0, 0x100f  ; @1:INT:ord_10(1:18FE)
1:0FA6  03f0              add      si, ax
1:0FA8  13fa              adc      di, dx
1:0FAA  2b365606          sub      si, word ptr [0x656]
1:0FAE  1b3e5806          sbb      di, word ptr [0x658]
1:0FB2  57                push     di
1:0FB3  56                push     si
1:0FB4  9ae40f0000        lcall    0, 0xfe4  ; @1:INT:ord_9(1:1864)
1:0FB9  0306bc06          add      ax, word ptr [0x6bc]
1:0FBD  a34206            mov      word ptr [0x642], ax
1:0FC0  8b0e8a06          mov      cx, word ptr [0x68a]
1:0FC4  890e9a06          mov      word ptr [0x69a], cx
1:0FC8  ff363a05          push     word ptr [0x53a]
1:0FCC  2bc9              sub      cx, cx
1:0FCE  51                push     cx
1:0FCF  50                push     ax
1:0FD0  9a83070000        lcall    0, 0x783  ; @1:GDI.MoveTo
1:0FD5  b80400            mov      ax, 4
1:0FD8  99                cdq      
1:0FD9  52                push     dx
1:0FDA  50                push     ax
1:0FDB  ff36a606          push     word ptr [0x6a6]
1:0FDF  ff36a406          push     word ptr [0x6a4]
1:0FE3  9a76100000        lcall    0, 0x1076  ; @1:INT:ord_9(1:1864)
1:0FE8  a36c06            mov      word ptr [0x66c], ax
1:0FEB  c7068a060100      mov      word ptr [0x68a], 1
1:0FF1  e9ef03            jmp      0x13e3
1:0FF4  8306a80604        add      word ptr [0x6a8], 4
1:0FF9  8316aa0600        adc      word ptr [0x6aa], 0
1:0FFE  ff36aa06          push     word ptr [0x6aa]
1:1002  ff36a806          push     word ptr [0x6a8]
1:1006  ff36aa06          push     word ptr [0x6aa]
1:100A  ff36a806          push     word ptr [0x6a8]
1:100E  9a33100000        lcall    0, 0x1033  ; @1:INT:ord_10(1:18FE)
1:1013  a36406            mov      word ptr [0x664], ax
1:1016  89166606          mov      word ptr [0x666], dx
1:101A  ff364606          push     word ptr [0x646]
1:101E  ff364406          push     word ptr [0x644]
1:1022  ff367206          push     word ptr [0x672]
1:1026  ff367006          push     word ptr [0x670]
1:102A  ff36aa06          push     word ptr [0x6aa]
1:102E  ff36a806          push     word ptr [0x6a8]
1:1032  9a54100000        lcall    0, 0x1054  ; @1:INT:ord_10(1:18FE)
1:1037  ff366606          push     word ptr [0x666]
1:103B  ff366406          push     word ptr [0x664]
1:103F  ff367c06          push     word ptr [0x67c]
1:1043  ff367a06          push     word ptr [0x67a]
1:1047  ff36aa06          push     word ptr [0x6aa]
1:104B  ff36a806          push     word ptr [0x6a8]
1:104F  8bf0              mov      si, ax
1:1051  8bfa              mov      di, dx
1:1053  9a63100000        lcall    0, 0x1063  ; @1:INT:ord_10(1:18FE)
1:1058  03067406          add      ax, word ptr [0x674]
1:105C  13167606          adc      dx, word ptr [0x676]
1:1060  52                push     dx
1:1061  50                push     ax
1:1062  9aff0d0000        lcall    0, 0xdff  ; @1:INT:ord_10(1:18FE)
1:1067  03f0              add      si, ax
1:1069  13fa              adc      di, dx
1:106B  2b365606          sub      si, word ptr [0x656]
1:106F  1b3e5806          sbb      di, word ptr [0x658]
1:1073  57                push     di
1:1074  56                push     si
1:1075  9a52090000        lcall    0, 0x952  ; @1:INT:ord_9(1:1864)
1:107A  0306bc06          add      ax, word ptr [0x6bc]
1:107E  a34206            mov      word ptr [0x642], ax
1:1081  8b0e8a06          mov      cx, word ptr [0x68a]
1:1085  d1e1              shl      cx, 1
1:1087  d1e1              shl      cx, 1
1:1089  890e9a06          mov      word ptr [0x69a], cx
1:108D  8b16a006          mov      dx, word ptr [0x6a0]
1:1091  83c20a            add      dx, 0xa
1:1094  3b168a06          cmp      dx, word ptr [0x68a]
1:1098  7d24              jge      0x10be
1:109A  833e8a0632        cmp      word ptr [0x68a], 0x32
1:109F  7e1d              jle      0x10be
1:10A1  8b166c06          mov      dx, word ptr [0x66c]
1:10A5  83ea05            sub      dx, 5
1:10A8  3b168a06          cmp      dx, word ptr [0x68a]
1:10AC  7e10              jle      0x10be
1:10AE  3d1400            cmp      ax, 0x14
1:10B1  7e0b              jle      0x10be
1:10B3  8b163605          mov      dx, word ptr [0x536]
1:10B7  83ea14            sub      dx, 0x14
1:10BA  3bc2              cmp      ax, dx
1:10BC  7c03              jl       0x10c1
1:10BE  e90903            jmp      0x13ca
1:10C1  ff363a05          push     word ptr [0x53a]
1:10C5  51                push     cx
1:10C6  50                push     ax
1:10C7  9ade100000        lcall    0, 0x10de  ; @1:GDI.GetPixel
1:10CC  0bd0              or       dx, ax
1:10CE  7416              je       0x10e6
1:10D0  ff363a05          push     word ptr [0x53a]
1:10D4  a19a06            mov      ax, word ptr [0x69a]
1:10D7  40                inc      ax
1:10D8  50                push     ax
1:10D9  ff364206          push     word ptr [0x642]
1:10DD  9a12110000        lcall    0, 0x1112  ; @1:GDI.GetPixel
1:10E2  0bd0              or       dx, ax
1:10E4  751c              jne      0x1102
1:10E6  833e7e0600        cmp      word ptr [0x67e], 0
1:10EB  7412              je       0x10ff
1:10ED  9a340b0000        lcall    0, 0xb34  ; @1:INT:ord_8(1:17F4)
1:10F2  2d803e            sub      ax, 0x3e80
1:10F5  b90f00            mov      cx, 0xf
1:10F8  99                cdq      
1:10F9  f7f9              idiv     cx
1:10FB  0bd2              or       dx, dx
1:10FD  7403              je       0x1102
1:10FF  e9c802            jmp      0x13ca
1:1102  ff363a05          push     word ptr [0x53a]
1:1106  a19a06            mov      ax, word ptr [0x69a]
1:1109  050500            add      ax, 5
1:110C  50                push     ax
1:110D  ff364206          push     word ptr [0x642]
1:1111  9a2d110000        lcall    0, 0x112d  ; @1:GDI.GetPixel
1:1116  0bd0              or       dx, ax
1:1118  7403              je       0x111d
1:111A  e91a01            jmp      0x1237
1:111D  ff363a05          push     word ptr [0x53a]
1:1121  a19a06            mov      ax, word ptr [0x69a]
1:1124  050700            add      ax, 7
1:1127  50                push     ax
1:1128  ff364206          push     word ptr [0x642]
1:112C  9a48110000        lcall    0, 0x1148  ; @1:GDI.GetPixel
1:1131  0bd0              or       dx, ax
1:1133  7403              je       0x1138
1:1135  e9ff00            jmp      0x1237
1:1138  ff363a05          push     word ptr [0x53a]
1:113C  a19a06            mov      ax, word ptr [0x69a]
1:113F  050900            add      ax, 9
1:1142  50                push     ax
1:1143  ff364206          push     word ptr [0x642]
1:1147  9a63110000        lcall    0, 0x1163  ; @1:GDI.GetPixel
1:114C  0bd0              or       dx, ax
1:114E  7403              je       0x1153
1:1150  e9e400            jmp      0x1237
1:1153  ff363a05          push     word ptr [0x53a]
1:1157  a19a06            mov      ax, word ptr [0x69a]
1:115A  050b00            add      ax, 0xb
1:115D  50                push     ax
1:115E  ff364206          push     word ptr [0x642]
1:1162  9a7e110000        lcall    0, 0x117e  ; @1:GDI.GetPixel
1:1167  0bd0              or       dx, ax
1:1169  7403              je       0x116e
1:116B  e9c900            jmp      0x1237
1:116E  ff363a05          push     word ptr [0x53a]
1:1172  a19a06            mov      ax, word ptr [0x69a]
1:1175  050d00            add      ax, 0xd
1:1178  50                push     ax
1:1179  ff364206          push     word ptr [0x642]
1:117D  9a99110000        lcall    0, 0x1199  ; @1:GDI.GetPixel
1:1182  0bd0              or       dx, ax
1:1184  7403              je       0x1189
1:1186  e9ae00            jmp      0x1237
1:1189  ff363a05          push     word ptr [0x53a]
1:118D  a19a06            mov      ax, word ptr [0x69a]
1:1190  050f00            add      ax, 0xf
1:1193  50                push     ax
1:1194  ff364206          push     word ptr [0x642]
1:1198  9ab4110000        lcall    0, 0x11b4  ; @1:GDI.GetPixel
1:119D  0bd0              or       dx, ax
1:119F  7403              je       0x11a4
1:11A1  e99300            jmp      0x1237
1:11A4  ff363a05          push     word ptr [0x53a]
1:11A8  a19a06            mov      ax, word ptr [0x69a]
1:11AB  051100            add      ax, 0x11
1:11AE  50                push     ax
1:11AF  ff364206          push     word ptr [0x642]
1:11B3  9acc110000        lcall    0, 0x11cc  ; @1:GDI.GetPixel
1:11B8  0bd0              or       dx, ax
1:11BA  757b              jne      0x1237
1:11BC  ff363a05          push     word ptr [0x53a]
1:11C0  a19a06            mov      ax, word ptr [0x69a]
1:11C3  051300            add      ax, 0x13
1:11C6  50                push     ax
1:11C7  ff364206          push     word ptr [0x642]
1:11CB  9ae4110000        lcall    0, 0x11e4  ; @1:GDI.GetPixel
1:11D0  0bd0              or       dx, ax
1:11D2  7563              jne      0x1237
1:11D4  ff363a05          push     word ptr [0x53a]
1:11D8  a19a06            mov      ax, word ptr [0x69a]
1:11DB  051500            add      ax, 0x15
1:11DE  50                push     ax
1:11DF  ff364206          push     word ptr [0x642]
1:11E3  9afc110000        lcall    0, 0x11fc  ; @1:GDI.GetPixel
1:11E8  0bd0              or       dx, ax
1:11EA  754b              jne      0x1237
1:11EC  ff363a05          push     word ptr [0x53a]
1:11F0  a19a06            mov      ax, word ptr [0x69a]
1:11F3  051700            add      ax, 0x17
1:11F6  50                push     ax
1:11F7  ff364206          push     word ptr [0x642]
1:11FB  9a14120000        lcall    0, 0x1214  ; @1:GDI.GetPixel
1:1200  0bd0              or       dx, ax
1:1202  7533              jne      0x1237
1:1204  ff363a05          push     word ptr [0x53a]
1:1208  a19a06            mov      ax, word ptr [0x69a]
1:120B  051900            add      ax, 0x19
1:120E  50                push     ax
1:120F  ff364206          push     word ptr [0x642]
1:1213  9a2c120000        lcall    0, 0x122c  ; @1:GDI.GetPixel
1:1218  0bd0              or       dx, ax
1:121A  751b              jne      0x1237
1:121C  ff363a05          push     word ptr [0x53a]
1:1220  a19a06            mov      ax, word ptr [0x69a]
1:1223  051b00            add      ax, 0x1b
1:1226  50                push     ax
1:1227  ff364206          push     word ptr [0x642]
1:122B  9a47120000        lcall    0, 0x1247  ; @1:GDI.GetPixel
1:1230  0bd0              or       dx, ax
1:1232  7503              jne      0x1237
1:1234  e93e01            jmp      0x1375
1:1237  ff363a05          push     word ptr [0x53a]
1:123B  a19a06            mov      ax, word ptr [0x69a]
1:123E  050600            add      ax, 6
1:1241  50                push     ax
1:1242  ff364206          push     word ptr [0x642]
1:1246  9a62120000        lcall    0, 0x1262  ; @1:GDI.GetPixel
1:124B  0bd0              or       dx, ax
1:124D  7403              je       0x1252
1:124F  e97801            jmp      0x13ca
1:1252  ff363a05          push     word ptr [0x53a]
1:1256  a19a06            mov      ax, word ptr [0x69a]
1:1259  050800            add      ax, 8
1:125C  50                push     ax
1:125D  ff364206          push     word ptr [0x642]
1:1261  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetPixel
1:1266  0bd0              or       dx, ax
1:1268  7403              je       0x126d
1:126A  e95d01            jmp      0x13ca
1:126D  ff363a05          push     word ptr [0x53a]
1:1271  a19a06            mov      ax, word ptr [0x69a]
1:1274  050a00            add      ax, 0xa
1:1277  50                push     ax
1:1278  ff364206          push     word ptr [0x642]
1:127C  9a98120000        lcall    0, 0x1298  ; @1:GDI.GetPixel
1:1281  0bd0              or       dx, ax
1:1283  7403              je       0x1288
1:1285  e94201            jmp      0x13ca
1:1288  ff363a05          push     word ptr [0x53a]
1:128C  a19a06            mov      ax, word ptr [0x69a]
1:128F  050c00            add      ax, 0xc
1:1292  50                push     ax
1:1293  ff364206          push     word ptr [0x642]
1:1297  9ab3120000        lcall    0, 0x12b3  ; @1:GDI.GetPixel
1:129C  0bd0              or       dx, ax
1:129E  7403              je       0x12a3
1:12A0  e92701            jmp      0x13ca
1:12A3  ff363a05          push     word ptr [0x53a]
1:12A7  a19a06            mov      ax, word ptr [0x69a]
1:12AA  050e00            add      ax, 0xe
1:12AD  50                push     ax
1:12AE  ff364206          push     word ptr [0x642]
1:12B2  9ace120000        lcall    0, 0x12ce  ; @1:GDI.GetPixel
1:12B7  0bd0              or       dx, ax
1:12B9  7403              je       0x12be
1:12BB  e90c01            jmp      0x13ca
1:12BE  ff363a05          push     word ptr [0x53a]
1:12C2  a19a06            mov      ax, word ptr [0x69a]
1:12C5  051000            add      ax, 0x10
1:12C8  50                push     ax
1:12C9  ff364206          push     word ptr [0x642]
1:12CD  9ae9120000        lcall    0, 0x12e9  ; @1:GDI.GetPixel
1:12D2  0bd0              or       dx, ax
1:12D4  7403              je       0x12d9
1:12D6  e9f100            jmp      0x13ca
1:12D9  ff363a05          push     word ptr [0x53a]
1:12DD  a19a06            mov      ax, word ptr [0x69a]
1:12E0  051200            add      ax, 0x12
1:12E3  50                push     ax
1:12E4  ff364206          push     word ptr [0x642]
1:12E8  9a04130000        lcall    0, 0x1304  ; @1:GDI.GetPixel
1:12ED  0bd0              or       dx, ax
1:12EF  7403              je       0x12f4
1:12F1  e9d600            jmp      0x13ca
1:12F4  ff363a05          push     word ptr [0x53a]
1:12F8  a19a06            mov      ax, word ptr [0x69a]
1:12FB  051400            add      ax, 0x14
1:12FE  50                push     ax
1:12FF  ff364206          push     word ptr [0x642]
1:1303  9a1f130000        lcall    0, 0x131f  ; @1:GDI.GetPixel
1:1308  0bd0              or       dx, ax
1:130A  7403              je       0x130f
1:130C  e9bb00            jmp      0x13ca
1:130F  ff363a05          push     word ptr [0x53a]
1:1313  a19a06            mov      ax, word ptr [0x69a]
1:1316  051600            add      ax, 0x16
1:1319  50                push     ax
1:131A  ff364206          push     word ptr [0x642]
1:131E  9a3a130000        lcall    0, 0x133a  ; @1:GDI.GetPixel
1:1323  0bd0              or       dx, ax
1:1325  7403              je       0x132a
1:1327  e9a000            jmp      0x13ca
1:132A  ff363a05          push     word ptr [0x53a]
1:132E  a19a06            mov      ax, word ptr [0x69a]
1:1331  051800            add      ax, 0x18
1:1334  50                push     ax
1:1335  ff364206          push     word ptr [0x642]
1:1339  9a55130000        lcall    0, 0x1355  ; @1:GDI.GetPixel
1:133E  0bd0              or       dx, ax
1:1340  7403              je       0x1345
1:1342  e98500            jmp      0x13ca
1:1345  ff363a05          push     word ptr [0x53a]
1:1349  a19a06            mov      ax, word ptr [0x69a]
1:134C  051a00            add      ax, 0x1a
1:134F  50                push     ax
1:1350  ff364206          push     word ptr [0x642]
1:1354  9a6d130000        lcall    0, 0x136d  ; @1:GDI.GetPixel
1:1359  0bd0              or       dx, ax
1:135B  756d              jne      0x13ca
1:135D  ff363a05          push     word ptr [0x53a]
1:1361  a19a06            mov      ax, word ptr [0x69a]
1:1364  051c00            add      ax, 0x1c
1:1367  50                push     ax
1:1368  ff364206          push     word ptr [0x642]
1:136C  9ac8100000        lcall    0, 0x10c8  ; @1:GDI.GetPixel
1:1371  0bd0              or       dx, ax
1:1373  7555              jne      0x13ca
1:1375  9ade0e0000        lcall    0, 0xede  ; @1:INT:ord_8(1:17F4)
1:137A  2d803e            sub      ax, 0x3e80
1:137D  b90a00            mov      cx, 0xa
1:1380  99                cdq      
1:1381  f7f9              idiv     cx
1:1383  83c21e            add      dx, 0x1e
1:1386  89166a06          mov      word ptr [0x66a], dx
1:138A  a14206            mov      ax, word ptr [0x642]
1:138D  2bc2              sub      ax, dx
1:138F  40                inc      ax
1:1390  40                inc      ax
1:1391  a39006            mov      word ptr [0x690], ax
1:1394  8bca              mov      cx, dx
1:1396  d1e1              shl      cx, 1
1:1398  8bd0              mov      dx, ax
1:139A  03c1              add      ax, cx
1:139C  a3b606            mov      word ptr [0x6b6], ax
1:139F  8b1e8a06          mov      bx, word ptr [0x68a]
1:13A3  d1e3              shl      bx, 1
1:13A5  d1e3              shl      bx, 1
1:13A7  2b1e6a06          sub      bx, word ptr [0x66a]
1:13AB  43                inc      bx
1:13AC  43                inc      bx
1:13AD  891e4006          mov      word ptr [0x640], bx
1:13B1  03cb              add      cx, bx
1:13B3  890ea206          mov      word ptr [0x6a2], cx
1:13B7  ff363a05          push     word ptr [0x53a]
1:13BB  53                push     bx
1:13BC  52                push     dx
1:13BD  51                push     cx
1:13BE  50                push     ax
1:13BF  9a81080000        lcall    0, 0x881  ; @1:GDI.Ellipse
1:13C4  a18a06            mov      ax, word ptr [0x68a]
1:13C7  a3a006            mov      word ptr [0x6a0], ax
1:13CA  ff363a05          push     word ptr [0x53a]
1:13CE  a18a06            mov      ax, word ptr [0x68a]
1:13D1  d1e0              shl      ax, 1
1:13D3  d1e0              shl      ax, 1
1:13D5  50                push     ax
1:13D6  ff364206          push     word ptr [0x642]
1:13DA  9a69070000        lcall    0, 0x769  ; @1:GDI.LineTo
1:13DF  ff068a06          inc      word ptr [0x68a]
1:13E3  a16c06            mov      ax, word ptr [0x66c]
1:13E6  39068a06          cmp      word ptr [0x68a], ax
1:13EA  7f03              jg       0x13ef
1:13EC  e905fc            jmp      0xff4
1:13EF  9abc0c0000        lcall    0, 0xcbc  ; @1:USER.GetTickCount
1:13F4  b104              mov      cl, 4
1:13F6  9ac30c0000        lcall    0, 0xcc3  ; @1:INT:ord_13(1:19DC)
1:13FB  a38606            mov      word ptr [0x686], ax
1:13FE  89168806          mov      word ptr [0x688], dx
1:1402  5e                pop      si
1:1403  5f                pop      di
1:1404  4d                dec      bp
1:1405  4d                dec      bp
1:1406  8be5              mov      sp, bp
1:1408  1f                pop      ds
1:1409  5d                pop      bp
1:140A  4d                dec      bp
1:140B  cb                retf     

; ===== EXPORT:ord_18(#18) =====
1:140C  1e                push     ds
1:140D  58                pop      ax
1:140E  90                nop      
1:140F  45                inc      bp
1:1410  55                push     bp
1:1411  8bec              mov      bp, sp
1:1413  1e                push     ds
1:1414  8ed8              mov      ds, ax
1:1416  ff363a05          push     word ptr [0x53a]
1:141A  b80500            mov      ax, 5
1:141D  50                push     ax
1:141E  9a12060000        lcall    0, 0x612  ; @1:GDI.GetStockObject
1:1423  50                push     ax
1:1424  9a66140000        lcall    0, 0x1466  ; @1:GDI.SelectObject
1:1429  ff365c06          push     word ptr [0x65c]
1:142D  0e                push     cs
1:142E  e875f8            call     0xca6
1:1431  5b                pop      bx
1:1432  2bc0              sub      ax, ax
1:1434  a35c06            mov      word ptr [0x65c], ax
1:1437  4d                dec      bp
1:1438  4d                dec      bp
1:1439  8be5              mov      sp, bp
1:143B  1f                pop      ds
1:143C  5d                pop      bp
1:143D  4d                dec      bp
1:143E  cb                retf     

; ===== EXPORT:ord_19(#19) =====
1:143F  1e                push     ds
1:1440  58                pop      ax
1:1441  90                nop      
1:1442  45                inc      bp
1:1443  55                push     bp
1:1444  8bec              mov      bp, sp
1:1446  1e                push     ds
1:1447  8ed8              mov      ds, ax
1:1449  2bc0              sub      ax, ax
1:144B  4d                dec      bp
1:144C  4d                dec      bp
1:144D  8be5              mov      sp, bp
1:144F  1f                pop      ds
1:1450  5d                pop      bp
1:1451  4d                dec      bp
1:1452  cb                retf     

; ===== EXPORT:ord_17(#17) =====
1:1453  1e                push     ds
1:1454  58                pop      ax
1:1455  90                nop      
1:1456  45                inc      bp
1:1457  55                push     bp
1:1458  8bec              mov      bp, sp
1:145A  1e                push     ds
1:145B  8ed8              mov      ds, ax
1:145D  ff363a05          push     word ptr [0x53a]
1:1461  ff368c06          push     word ptr [0x68c]
1:1465  9aa7140000        lcall    0, 0x14a7  ; @1:GDI.SelectObject
1:146A  ff366e06          push     word ptr [0x66e]
1:146E  9a78140000        lcall    0, 0x1478  ; @1:GDI.DeleteObject
1:1473  ff366806          push     word ptr [0x668]
1:1477  9a81140000        lcall    0, 0x1481  ; @1:GDI.DeleteObject
1:147C  ff369806          push     word ptr [0x698]
1:1480  9a8a140000        lcall    0, 0x148a  ; @1:GDI.DeleteObject
1:1485  ff363805          push     word ptr [0x538]
1:1489  9ab0140000        lcall    0, 0x14b0  ; @1:GDI.DeleteObject
1:148E  833e780600        cmp      word ptr [0x678], 0
1:1493  7428              je       0x14bd
1:1495  ff364a06          push     word ptr [0x64a]
1:1499  9a4e040000        lcall    0, 0x44e  ; @1:KERNEL.GlobalFree
1:149E  ff363a05          push     word ptr [0x53a]
1:14A2  ff368e06          push     word ptr [0x68e]
1:14A6  9a0f0c0000        lcall    0, 0xc0f  ; @1:GDI.SelectObject
1:14AB  ff365a06          push     word ptr [0x65a]
1:14AF  9ab9140000        lcall    0, 0x14b9  ; @1:GDI.DeleteObject
1:14B4  ff369606          push     word ptr [0x696]
1:14B8  9ae0040000        lcall    0, 0x4e0  ; @1:GDI.DeleteObject
1:14BD  2bc0              sub      ax, ax
1:14BF  4d                dec      bp
1:14C0  4d                dec      bp
1:14C1  8be5              mov      sp, bp
1:14C3  1f                pop      ds
1:14C4  5d                pop      bp
1:14C5  4d                dec      bp
1:14C6  cb                retf     

; ===== EXPORT:ord_16(#16) =====
1:14C7  1e                push     ds
1:14C8  58                pop      ax
1:14C9  90                nop      
1:14CA  45                inc      bp
1:14CB  55                push     bp
1:14CC  8bec              mov      bp, sp
1:14CE  1e                push     ds
1:14CF  8ed8              mov      ds, ax
1:14D1  2bc0              sub      ax, ax
1:14D3  4d                dec      bp
1:14D4  4d                dec      bp
1:14D5  8be5              mov      sp, bp
1:14D7  1f                pop      ds
1:14D8  5d                pop      bp
1:14D9  4d                dec      bp
1:14DA  cb                retf     

; ===== EXPORT:ord_15(#15) =====
1:14DB  1e                push     ds
1:14DC  58                pop      ax
1:14DD  90                nop      
1:14DE  45                inc      bp
1:14DF  55                push     bp
1:14E0  8bec              mov      bp, sp
1:14E2  1e                push     ds
1:14E3  8ed8              mov      ds, ax
1:14E5  2bc0              sub      ax, ax
1:14E7  4d                dec      bp
1:14E8  4d                dec      bp
1:14E9  8be5              mov      sp, bp
1:14EB  1f                pop      ds
1:14EC  5d                pop      bp
1:14ED  4d                dec      bp
1:14EE  cb                retf     

; ===== EXPORT:ord_14(#14) =====
1:14EF  1e                push     ds
1:14F0  58                pop      ax
1:14F1  90                nop      
1:14F2  45                inc      bp
1:14F3  55                push     bp
1:14F4  8bec              mov      bp, sp
1:14F6  1e                push     ds
1:14F7  8ed8              mov      ds, ax
1:14F9  c41e4c06          les      bx, ptr [0x64c]
1:14FD  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:1502  7504              jne      0x1508
1:1504  2bc0              sub      ax, ax
1:1506  eb17              jmp      0x151f
1:1508  8b4606            mov      ax, word ptr [bp + 6]
1:150B  48                dec      ax
1:150C  48                dec      ax
1:150D  75f5              jne      0x1504
1:150F  b8e700            mov      ax, 0xe7
1:1512  1e                push     ds
1:1513  50                push     ax
1:1514  b80500            mov      ax, 5
1:1517  50                push     ax
1:1518  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.WinExec
1:151D  ebe5              jmp      0x1504
1:151F  4d                dec      bp
1:1520  4d                dec      bp
1:1521  8be5              mov      sp, bp
1:1523  1f                pop      ds
1:1524  5d                pop      bp
1:1525  4d                dec      bp
1:1526  cb                retf     
1:1527  001e5890          add      byte ptr [0x9058], bl
1:152B  45                inc      bp
1:152C  55                push     bp
1:152D  8bec              mov      bp, sp
1:152F  1e                push     ds
1:1530  8ed8              mov      ds, ax
1:1532  837e0a00          cmp      word ptr [bp + 0xa], 0
1:1536  7504              jne      0x153c
1:1538  2bc0              sub      ax, ax
1:153A  eb09              jmp      0x1545
1:153C  8b460e            mov      ax, word ptr [bp + 0xe]
1:153F  a38406            mov      word ptr [0x684], ax
1:1542  b80100            mov      ax, 1
1:1545  4d                dec      bp
1:1546  4d                dec      bp
1:1547  8be5              mov      sp, bp
1:1549  1f                pop      ds
1:154A  5d                pop      bp
1:154B  4d                dec      bp
1:154C  ca0a00            retf     0xa

; ===== EXPORT:WEP(#2) =====
1:154F  1e                push     ds
1:1550  58                pop      ax
1:1551  90                nop      
1:1552  45                inc      bp
1:1553  55                push     bp
1:1554  8bec              mov      bp, sp
1:1556  1e                push     ds
1:1557  8ed8              mov      ds, ax
1:1559  b80100            mov      ax, 1
1:155C  4d                dec      bp
1:155D  4d                dec      bp
1:155E  8be5              mov      sp, bp
1:1560  1f                pop      ds
1:1561  5d                pop      bp
1:1562  4d                dec      bp
1:1563  ca0200            retf     2

; ===== EXPORT:MODULE(#1) =====
1:1566  1e                push     ds
1:1567  58                pop      ax
1:1568  90                nop      
1:1569  45                inc      bp
1:156A  55                push     bp
1:156B  8bec              mov      bp, sp
1:156D  1e                push     ds
1:156E  8ed8              mov      ds, ax
1:1570  83ec0a            sub      sp, 0xa
1:1573  56                push     si
1:1574  8b4608            mov      ax, word ptr [bp + 8]
1:1577  a33a05            mov      word ptr [0x53a], ax
1:157A  8b4606            mov      ax, word ptr [bp + 6]
1:157D  a33205            mov      word ptr [0x532], ax
1:1580  50                push     ax
1:1581  9aa1150000        lcall    0, 0x15a1  ; @1:KERNEL.GlobalLock
1:1586  a34c06            mov      word ptr [0x64c], ax
1:1589  89164e06          mov      word ptr [0x64e], dx
1:158D  8bc2              mov      ax, dx
1:158F  0b064c06          or       ax, word ptr [0x64c]
1:1593  7503              jne      0x1598
1:1595  e96a01            jmp      0x1702
1:1598  c41e4c06          les      bx, ptr [0x64c]
1:159C  26ff7720          push     word ptr es:[bx + 0x20]
1:15A0  9a61010000        lcall    0, 0x161  ; @1:KERNEL.GlobalLock
1:15A5  a3b806            mov      word ptr [0x6b8], ax
1:15A8  8916ba06          mov      word ptr [0x6ba], dx
1:15AC  8bc2              mov      ax, dx
1:15AE  0b06b806          or       ax, word ptr [0x6b8]
1:15B2  7503              jne      0x15b7
1:15B4  e94201            jmp      0x16f9
1:15B7  8b460a            mov      ax, word ptr [bp + 0xa]
1:15BA  e90801            jmp      0x16c5
1:15BD  c41e4c06          les      bx, ptr [0x64c]
1:15C1  26837f1465        cmp      word ptr es:[bx + 0x14], 0x65
1:15C6  7c0f              jl       0x15d7
1:15C8  26817f36f400      cmp      word ptr es:[bx + 0x36], 0xf4
1:15CE  7507              jne      0x15d7
1:15D0  26837f3878        cmp      word ptr es:[bx + 0x38], 0x78
1:15D5  740e              je       0x15e5
1:15D7  c706fc000000      mov      word ptr [0xfc], 0
1:15DD  c746fc0500        mov      word ptr [bp - 4], 5
1:15E2  e90701            jmp      0x16ec
1:15E5  c706fc000100      mov      word ptr [0xfc], 1
1:15EB  e9fe00            jmp      0x16ec
1:15EE  b8f204            mov      ax, 0x4f2
1:15F1  50                push     ax
1:15F2  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_22(1:177E)
1:15F7  5b                pop      bx
1:15F8  ff36f204          push     word ptr [0x4f2]
1:15FC  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_21(1:17E0)
1:1601  5b                pop      bx
1:1602  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_20(1:03C6)
1:1607  eb13              jmp      0x161c
1:1609  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_19(1:143F)
1:160E  eb0c              jmp      0x161c
1:1610  833efc0000        cmp      word ptr [0xfc], 0
1:1615  740b              je       0x1622
1:1617  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_18(1:140C)
1:161C  8946fc            mov      word ptr [bp - 4], ax
1:161F  e9ca00            jmp      0x16ec
1:1622  ff363a05          push     word ptr [0x53a]
1:1626  b800ff            mov      ax, 0xff00
1:1629  baff00            mov      dx, 0xff
1:162C  52                push     dx
1:162D  50                push     ax
1:162E  9ae80b0000        lcall    0, 0xbe8  ; @1:GDI.SetTextColor
1:1633  ff363a05          push     word ptr [0x53a]
1:1637  2bc0              sub      ax, ax
1:1639  50                push     ax
1:163A  50                push     ax
1:163B  9af50b0000        lcall    0, 0xbf5  ; @1:GDI.SetBkColor
1:1640  ff363a05          push     word ptr [0x53a]
1:1644  2bc0              sub      ax, ax
1:1646  50                push     ax
1:1647  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextAlign
1:164C  ff363a05          push     word ptr [0x53a]
1:1650  b80100            mov      ax, 1
1:1653  50                push     ax
1:1654  9a020c0000        lcall    0, 0xc02  ; @1:GDI.SetBkMode
1:1659  ff363a05          push     word ptr [0x53a]
1:165D  2bc0              sub      ax, ax
1:165F  50                push     ax
1:1660  50                push     ax
1:1661  b8fe00            mov      ax, 0xfe
1:1664  1e                push     ds
1:1665  50                push     ax
1:1666  50                push     ax
1:1667  9a560b0000        lcall    0, 0xb56  ; @1:INT:ord_5(1:1762)
1:166C  5b                pop      bx
1:166D  50                push     ax
1:166E  9a2d0c0000        lcall    0, 0xc2d  ; @1:GDI.TextOut
1:1673  eb77              jmp      0x16ec
1:1675  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_17(1:1453)
1:167A  eba0              jmp      0x161c
1:167C  a18406            mov      ax, word ptr [0x684]
1:167F  c41eb806          les      bx, ptr [0x6b8]
1:1683  26894716          mov      word ptr es:[bx + 0x16], ax
1:1687  c746f60000        mov      word ptr [bp - 0xa], 0
1:168C  8b46f6            mov      ax, word ptr [bp - 0xa]
1:168F  8bf0              mov      si, ax
1:1691  d1e6              shl      si, 1
1:1693  40                inc      ax
1:1694  c41eb806          les      bx, ptr [0x6b8]
1:1698  2689400e          mov      word ptr es:[bx + si + 0xe], ax
1:169C  ff46f6            inc      word ptr [bp - 0xa]
1:169F  837ef604          cmp      word ptr [bp - 0xa], 4
1:16A3  7ce7              jl       0x168c
1:16A5  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_16(1:14C7)
1:16AA  e96fff            jmp      0x161c
1:16AD  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_15(1:14DB)
1:16B2  e967ff            jmp      0x161c
1:16B5  8b460a            mov      ax, word ptr [bp + 0xa]
1:16B8  2d0700            sub      ax, 7
1:16BB  50                push     ax
1:16BC  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_14(1:14EF)
1:16C1  5b                pop      bx
1:16C2  e957ff            jmp      0x161c
1:16C5  3d0c00            cmp      ax, 0xc
1:16C8  7722              ja       0x16ec
1:16CA  d1e0              shl      ax, 1
1:16CC  93                xchg     bx, ax
1:16CD  2effa7d216        jmp      word ptr cs:[bx + 0x16d2]
1:16D2  ee                out      dx, al
1:16D3  150916            adc      ax, 0x1609
1:16D6  10167516          adc      byte ptr [0x1675], dl
1:16DA  ec                in       al, dx
1:16DB  16                push     ss
1:16DC  7c16              jl       0x16f4
1:16DE  ad                lodsw    ax, word ptr [si]
1:16DF  16                push     ss
1:16E0  b516              mov      ch, 0x16
1:16E2  b516              mov      ch, 0x16
1:16E4  b516              mov      ch, 0x16
1:16E6  b516              mov      ch, 0x16
1:16E8  ec                in       al, dx
1:16E9  16                push     ss
1:16EA  bd15c4            mov      bp, 0xc415
1:16ED  1e                push     ds
1:16EE  4c                dec      sp
1:16EF  06                push     es
1:16F0  26ff7720          push     word ptr es:[bx + 0x20]
1:16F4  9afe160000        lcall    0, 0x16fe  ; @1:KERNEL.GlobalUnlock
1:16F9  ff363205          push     word ptr [0x532]
1:16FD  9a9e010000        lcall    0, 0x19e  ; @1:KERNEL.GlobalUnlock
1:1702  8b46fc            mov      ax, word ptr [bp - 4]
1:1705  5e                pop      si
1:1706  4d                dec      bp
1:1707  4d                dec      bp
1:1708  8be5              mov      sp, bp
1:170A  1f                pop      ds
1:170B  5d                pop      bp
1:170C  4d                dec      bp
1:170D  ca0600            retf     6
1:1710  0000              add      byte ptr [bx + si], al
1:1712  0000              add      byte ptr [bx + si], al
1:1714  0000              add      byte ptr [bx + si], al
1:1716  0000              add      byte ptr [bx + si], al
1:1718  0000              add      byte ptr [bx + si], al
1:171A  0000              add      byte ptr [bx + si], al
1:171C  0000              add      byte ptr [bx + si], al
1:171E  0000              add      byte ptr [bx + si], al
1:1720  c3                ret      
1:1721  00558b            add      byte ptr [di - 0x75], dl
1:1724  ec                in       al, dx
1:1725  8bd7              mov      dx, di
1:1727  8bde              mov      bx, si
1:1729  8cd8              mov      ax, ds
1:172B  8ec0              mov      es, ax
1:172D  8b7e06            mov      di, word ptr [bp + 6]
1:1730  33c0              xor      ax, ax
1:1732  b9ffff            mov      cx, 0xffff
1:1735  f2ae              repne scasb al, byte ptr es:[di]
1:1737  8d75ff            lea      si, [di - 1]
1:173A  8b7e08            mov      di, word ptr [bp + 8]
1:173D  b9ffff            mov      cx, 0xffff
1:1740  f2ae              repne scasb al, byte ptr es:[di]
1:1742  f7d1              not      cx
1:1744  2bf9              sub      di, cx
1:1746  87fe              xchg     si, di
1:1748  8b4606            mov      ax, word ptr [bp + 6]
1:174B  f7c60100          test     si, 1
1:174F  7402              je       0x1753
1:1751  a4                movsb    byte ptr es:[di], byte ptr [si]
1:1752  49                dec      cx
1:1753  d1e9              shr      cx, 1
1:1755  f3a5              rep movsw word ptr es:[di], word ptr [si]
1:1757  13c9              adc      cx, cx
1:1759  f3a4              rep movsb byte ptr es:[di], byte ptr [si]
1:175B  8bf3              mov      si, bx
1:175D  8bfa              mov      di, dx
1:175F  5d                pop      bp
1:1760  cb                retf     
1:1761  00558b            add      byte ptr [di - 0x75], dl
1:1764  ec                in       al, dx
1:1765  8bd7              mov      dx, di
1:1767  8cd8              mov      ax, ds
1:1769  8ec0              mov      es, ax
1:176B  8b7e06            mov      di, word ptr [bp + 6]
1:176E  33c0              xor      ax, ax
1:1770  b9ffff            mov      cx, 0xffff
1:1773  f2ae              repne scasb al, byte ptr es:[di]
1:1775  f7d1              not      cx
1:1777  49                dec      cx
1:1778  91                xchg     cx, ax
1:1779  8bfa              mov      di, dx
1:177B  5d                pop      bp
1:177C  cb                retf     
1:177D  008cd890          add      byte ptr [si - 0x6f28], cl
1:1781  45                inc      bp
1:1782  55                push     bp
1:1783  8bec              mov      bp, sp
1:1785  1e                push     ds
1:1786  8ed8              mov      ds, ax
1:1788  56                push     si
1:1789  b42a              mov      ah, 0x2a
1:178B  cd21              int      0x21
1:178D  8bda              mov      bx, dx
1:178F  8bf1              mov      si, cx
1:1791  b42c              mov      ah, 0x2c
1:1793  cd21              int      0x21
1:1795  b400              mov      ah, 0
1:1797  8ac6              mov      al, dh
1:1799  50                push     ax
1:179A  8ac1              mov      al, cl
1:179C  50                push     ax
1:179D  8ac5              mov      al, ch
1:179F  50                push     ax
1:17A0  50                push     ax
1:17A1  b42a              mov      ah, 0x2a
1:17A3  cd21              int      0x21
1:17A5  3bda              cmp      bx, dx
1:17A7  58                pop      ax
1:17A8  7408              je       0x17b2
1:17AA  3c17              cmp      al, 0x17
1:17AC  7504              jne      0x17b2
1:17AE  8bd3              mov      dx, bx
1:17B0  8bce              mov      cx, si
1:17B2  b400              mov      ah, 0
1:17B4  8ac2              mov      al, dl
1:17B6  50                push     ax
1:17B7  8ac6              mov      al, dh
1:17B9  50                push     ax
1:17BA  81e9bc07          sub      cx, 0x7bc
1:17BE  51                push     cx
1:17BF  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_24(1:19E8)