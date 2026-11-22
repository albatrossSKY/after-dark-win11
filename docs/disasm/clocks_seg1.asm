File: raw\unpacked\MODULES\CLOCKS.AD
Module: 'clocks' ('Graphics Module Library')
CS:IP=1:1C1C  SS:SP=0:0000  AutoDS=2  Heap=1024  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (4): KERNEL, GDI, USER, SOUND
Segments (2):
  SEG  1: CODE off=0x00700 len=0x1C4E min=0x1C4E flags=0x0D50 relocs=151
  SEG  2: DATA off=0x02580 len=0x04B8 min=0x04B8 flags=0x0C71 relocs=0
Exports (34):
  ord   1: SEG1:0E2A flags=0x03 MODULE
  ord   2: SEG1:0E13 flags=0x03 WEP
  ord   3: SEG1:1C08 flags=0x03 ___EXPORTEDSTUB
  ord   4: SEG1:0FF2 flags=0x00 
  ord   5: SEG1:1080 flags=0x00 
  ord   6: SEG1:03AA flags=0x00 
  ord   7: SEG1:0396 flags=0x00 
  ord   8: SEG1:0382 flags=0x00 
  ord   9: SEG1:02CD flags=0x00 
  ord  10: SEG1:1064 flags=0x00 
  ord  11: SEG1:02A4 flags=0x00 
  ord  12: SEG1:025E flags=0x00 
  ord  13: SEG1:0012 flags=0x00 
  ord  14: SEG1:10E2 flags=0x00 
  ord  15: SEG1:0DEC flags=0x00 
  ord  16: SEG1:1430 flags=0x00 
  ord  17: SEG1:136A flags=0x00 
  ord  18: SEG1:122A flags=0x00 
  ord  19: SEG1:1126 flags=0x00 
  ord  20: SEG1:15E0 flags=0x00 
  ord  21: SEG1:167E flags=0x00 
  ord  22: SEG1:16A6 flags=0x00 
  ord  23: SEG1:196E flags=0x00 
  ord  24: SEG1:1932 flags=0x00 
  ord  25: SEG1:1998 flags=0x00 
  ord  26: SEG1:16AA flags=0x00 
  ord  27: SEG1:1244 flags=0x00 
  ord  28: SEG1:17C8 flags=0x00 
  ord  29: SEG1:172E flags=0x00 
  ord  30: SEG1:170C flags=0x00 
  ord  31: SEG1:1868 flags=0x00 
  ord  32: SEG1:18C8 flags=0x00 
  ord  33: SEG1:1B3C flags=0x00 
  ord  34: SEG1:1BF8 flags=0x00 
Resources (22):
  RT_BITMAP        #1               off=0x02A80 len=  8304
  RT_BITMAP        #2               off=0x04AF0 len=  8368
  RT_BITMAP        #3               off=0x06BA0 len=  2096
  RT_BITMAP        #4               off=0x073D0 len=  2096
  RT_BITMAP        #5               off=0x07C00 len=   608
  RT_BITMAP        #6               off=0x07E60 len=   336
  RT_BITMAP        #7               off=0x07FB0 len=   608
  RT_BITMAP        #8               off=0x08210 len=   608
  RT_BITMAP        #9               off=0x08470 len=   608
  RT_BITMAP        #10              off=0x086D0 len=   608
  RT_BITMAP        #11              off=0x08930 len=   608
  RT_BITMAP        #12              off=0x08B90 len=   608
  RT_BITMAP        #13              off=0x08DF0 len=   608
  RT_BITMAP        #14              off=0x09050 len=   608
  TYPE_1000        #1               off=0x092B0 len=    96
  TYPE_1000        #2               off=0x09310 len=   128
  TYPE_1000        #3               off=0x09390 len=    32
  TYPE_1000        #4               off=0x093B0 len=    32
  TYPE_2000        #10              off=0x093D0 len=    80
  TYPE_2000        #20              off=0x09420 len=    16
  TYPE_2000        #30              off=0x09430 len=   352
  TYPE_15          #1               off=0x09590 len=   192

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

; ===== EXPORT:ord_13(#13) =====
1:0012  1e                push     ds
1:0013  58                pop      ax
1:0014  90                nop      
1:0015  45                inc      bp
1:0016  55                push     bp
1:0017  8bec              mov      bp, sp
1:0019  1e                push     ds
1:001A  8ed8              mov      ds, ax
1:001C  c41eb404          les      bx, ptr [0x4b4]
1:0020  268b4706          mov      ax, word ptr es:[bx + 6]
1:0024  a31000            mov      word ptr [0x10], ax
1:0027  268b470a          mov      ax, word ptr es:[bx + 0xa]
1:002B  a31200            mov      word ptr [0x12], ax
1:002E  268b4708          mov      ax, word ptr es:[bx + 8]
1:0032  3d6400            cmp      ax, 0x64
1:0035  7503              jne      0x3a
1:0037  e98200            jmp      0xbc
1:003A  7722              ja       0x5e
1:003C  0ac0              or       al, al
1:003E  7412              je       0x52
1:0040  2c14              sub      al, 0x14
1:0042  7451              je       0x95
1:0044  2c14              sub      al, 0x14
1:0046  745b              je       0xa3
1:0048  2c14              sub      al, 0x14
1:004A  7462              je       0xae
1:004C  2c14              sub      al, 0x14
1:004E  746c              je       0xbc
1:0050  eb0c              jmp      0x5e
1:0052  c70614000100      mov      word ptr [0x14], 1
1:0058  c7067600c800      mov      word ptr [0x76], 0xc8
1:005E  c7067800d007      mov      word ptr [0x78], 0x7d0
1:0064  ff366e04          push     word ptr [0x46e]
1:0068  9af0010000        lcall    0, 0x1f0  ; @1:GDI.CreateCompatibleDC
1:006D  a38604            mov      word ptr [0x486], ax
1:0070  c41e7e04          les      bx, ptr [0x47e]
1:0074  26837f0a01        cmp      word ptr es:[bx + 0xa], 1
1:0079  7549              jne      0xc4
1:007B  ff36a804          push     word ptr [0x4a8]
1:007F  b87a00            mov      ax, 0x7a
1:0082  1e                push     ds
1:0083  50                push     ax
1:0084  9ace000000        lcall    0, 0xce  ; @1:USER.LoadBitmap
1:0089  a3ae04            mov      word ptr [0x4ae], ax
1:008C  ff36a804          push     word ptr [0x4a8]
1:0090  b88300            mov      ax, 0x83
1:0093  eb47              jmp      0xdc
1:0095  c70614000100      mov      word ptr [0x14], 1
1:009B  c70676003200      mov      word ptr [0x76], 0x32
1:00A1  ebbb              jmp      0x5e
1:00A3  b80100            mov      ax, 1
1:00A6  a31400            mov      word ptr [0x14], ax
1:00A9  a37600            mov      word ptr [0x76], ax
1:00AC  ebb0              jmp      0x5e
1:00AE  c70614000200      mov      word ptr [0x14], 2
1:00B4  c70676000100      mov      word ptr [0x76], 1
1:00BA  eba2              jmp      0x5e
1:00BC  c70614000300      mov      word ptr [0x14], 3
1:00C2  ebf0              jmp      0xb4
1:00C4  ff36a804          push     word ptr [0x4a8]
1:00C8  b88c00            mov      ax, 0x8c
1:00CB  1e                push     ds
1:00CC  50                push     ax
1:00CD  9adf000000        lcall    0, 0xdf  ; @1:USER.LoadBitmap
1:00D2  a3ae04            mov      word ptr [0x4ae], ax
1:00D5  ff36a804          push     word ptr [0x4a8]
1:00D9  b89300            mov      ax, 0x93
1:00DC  1e                push     ds
1:00DD  50                push     ax
1:00DE  9af0000000        lcall    0, 0xf0  ; @1:USER.LoadBitmap
1:00E3  a3a404            mov      word ptr [0x4a4], ax
1:00E6  ff36a804          push     word ptr [0x4a8]
1:00EA  b89b00            mov      ax, 0x9b
1:00ED  1e                push     ds
1:00EE  50                push     ax
1:00EF  9a01010000        lcall    0, 0x101  ; @1:USER.LoadBitmap
1:00F4  a38c04            mov      word ptr [0x48c], ax
1:00F7  ff36a804          push     word ptr [0x4a8]
1:00FB  b8a000            mov      ax, 0xa0
1:00FE  1e                push     ds
1:00FF  50                push     ax
1:0100  9a12010000        lcall    0, 0x112  ; @1:USER.LoadBitmap
1:0105  a38e04            mov      word ptr [0x48e], ax
1:0108  ff36a804          push     word ptr [0x4a8]
1:010C  b8a400            mov      ax, 0xa4
1:010F  1e                push     ds
1:0110  50                push     ax
1:0111  9a23010000        lcall    0, 0x123  ; @1:USER.LoadBitmap
1:0116  a39004            mov      word ptr [0x490], ax
1:0119  ff36a804          push     word ptr [0x4a8]
1:011D  b8a800            mov      ax, 0xa8
1:0120  1e                push     ds
1:0121  50                push     ax
1:0122  9a34010000        lcall    0, 0x134  ; @1:USER.LoadBitmap
1:0127  a39204            mov      word ptr [0x492], ax
1:012A  ff36a804          push     word ptr [0x4a8]
1:012E  b8ae00            mov      ax, 0xae
1:0131  1e                push     ds
1:0132  50                push     ax
1:0133  9a45010000        lcall    0, 0x145  ; @1:USER.LoadBitmap
1:0138  a39404            mov      word ptr [0x494], ax
1:013B  ff36a804          push     word ptr [0x4a8]
1:013F  b8b300            mov      ax, 0xb3
1:0142  1e                push     ds
1:0143  50                push     ax
1:0144  9a56010000        lcall    0, 0x156  ; @1:USER.LoadBitmap
1:0149  a39604            mov      word ptr [0x496], ax
1:014C  ff36a804          push     word ptr [0x4a8]
1:0150  b8b800            mov      ax, 0xb8
1:0153  1e                push     ds
1:0154  50                push     ax
1:0155  9a67010000        lcall    0, 0x167  ; @1:USER.LoadBitmap
1:015A  a39804            mov      word ptr [0x498], ax
1:015D  ff36a804          push     word ptr [0x4a8]
1:0161  b8bc00            mov      ax, 0xbc
1:0164  1e                push     ds
1:0165  50                push     ax
1:0166  9a78010000        lcall    0, 0x178  ; @1:USER.LoadBitmap
1:016B  a39a04            mov      word ptr [0x49a], ax
1:016E  ff36a804          push     word ptr [0x4a8]
1:0172  b8c200            mov      ax, 0xc2
1:0175  1e                push     ds
1:0176  50                push     ax
1:0177  9a89010000        lcall    0, 0x189  ; @1:USER.LoadBitmap
1:017C  a39c04            mov      word ptr [0x49c], ax
1:017F  ff36a804          push     word ptr [0x4a8]
1:0183  b8c800            mov      ax, 0xc8
1:0186  1e                push     ds
1:0187  50                push     ax
1:0188  9affff0000        lcall    0, 0xffff  ; @1:USER.LoadBitmap
1:018D  a39e04            mov      word ptr [0x49e], ax
1:0190  a11000            mov      ax, word ptr [0x10]
1:0193  0bc0              or       ax, ax
1:0195  7408              je       0x19f
1:0197  48                dec      ax
1:0198  7432              je       0x1cc
1:019A  2d0400            sub      ax, 4
1:019D  7512              jne      0x1b1
1:019F  ff36ae04          push     word ptr [0x4ae]
1:01A3  b81000            mov      ax, 0x10
1:01A6  50                push     ax
1:01A7  b87004            mov      ax, 0x470
1:01AA  1e                push     ds
1:01AB  50                push     ax
1:01AC  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetObject
1:01B1  833e100002        cmp      word ptr [0x10], 2
1:01B6  7d1a              jge      0x1d2
1:01B8  a17204            mov      ax, word ptr [0x472]
1:01BB  050400            add      ax, 4
1:01BE  a3b004            mov      word ptr [0x4b0], ax
1:01C1  a17404            mov      ax, word ptr [0x474]
1:01C4  050400            add      ax, 4
1:01C7  a38204            mov      word ptr [0x482], ax
1:01CA  eb1f              jmp      0x1eb
1:01CC  ff36a404          push     word ptr [0x4a4]
1:01D0  ebd1              jmp      0x1a3
1:01D2  c706b0044401      mov      word ptr [0x4b0], 0x144
1:01D8  c70682044c00      mov      word ptr [0x482], 0x4c
1:01DE  833e120000        cmp      word ptr [0x12], 0
1:01E3  7506              jne      0x1eb
1:01E5  c706b004cd00      mov      word ptr [0x4b0], 0xcd
1:01EB  ff366e04          push     word ptr [0x46e]
1:01EF  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateCompatibleDC
1:01F4  a36c04            mov      word ptr [0x46c], ax
1:01F7  ff366e04          push     word ptr [0x46e]
1:01FB  ff36b004          push     word ptr [0x4b0]
1:01FF  ff368204          push     word ptr [0x482]
1:0203  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateCompatibleBitmap
1:0208  a3a604            mov      word ptr [0x4a6], ax
1:020B  0bc0              or       ax, ax
1:020D  740c              je       0x21b
1:020F  ff366c04          push     word ptr [0x46c]
1:0213  50                push     ax
1:0214  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectObject
1:0219  eb05              jmp      0x220
1:021B  b80100            mov      ax, 1
1:021E  eb36              jmp      0x256
1:0220  b86404            mov      ax, 0x464
1:0223  1e                push     ds
1:0224  50                push     ax
1:0225  2bc0              sub      ax, ax
1:0227  50                push     ax
1:0228  50                push     ax
1:0229  ff36b004          push     word ptr [0x4b0]
1:022D  ff368204          push     word ptr [0x482]
1:0231  9a7e020000        lcall    0, 0x27e  ; @1:USER.SetRect
1:0236  ff366c04          push     word ptr [0x46c]
1:023A  b86404            mov      ax, 0x464
1:023D  1e                push     ds
1:023E  50                push     ax
1:023F  b80400            mov      ax, 4
1:0242  50                push     ax
1:0243  9a90020000        lcall    0, 0x290  ; @1:GDI.GetStockObject
1:0248  50                push     ax
1:0249  9a96020000        lcall    0, 0x296  ; @1:USER.FillRect
1:024E  c706aa043d00      mov      word ptr [0x4aa], 0x3d
1:0254  2bc0              sub      ax, ax
1:0256  4d                dec      bp
1:0257  4d                dec      bp
1:0258  8be5              mov      sp, bp
1:025A  1f                pop      ds
1:025B  5d                pop      bp
1:025C  4d                dec      bp
1:025D  cb                retf     

; ===== EXPORT:ord_12(#12) =====
1:025E  1e                push     ds
1:025F  58                pop      ax
1:0260  90                nop      
1:0261  45                inc      bp
1:0262  55                push     bp
1:0263  8bec              mov      bp, sp
1:0265  1e                push     ds
1:0266  8ed8              mov      ds, ax
1:0268  b80004            mov      ax, 0x400
1:026B  1e                push     ds
1:026C  50                push     ax
1:026D  2bc0              sub      ax, ax
1:026F  50                push     ax
1:0270  50                push     ax
1:0271  c41eb404          les      bx, ptr [0x4b4]
1:0275  26ff7702          push     word ptr es:[bx + 2]
1:0279  26ff7704          push     word ptr es:[bx + 4]
1:027D  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:0282  ff366e04          push     word ptr [0x46e]
1:0286  b80004            mov      ax, 0x400
1:0289  1e                push     ds
1:028A  50                push     ax
1:028B  b80400            mov      ax, 4
1:028E  50                push     ax
1:028F  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:0294  50                push     ax
1:0295  9affff0000        lcall    0, 0xffff  ; @1:USER.FillRect
1:029A  2bc0              sub      ax, ax
1:029C  4d                dec      bp
1:029D  4d                dec      bp
1:029E  8be5              mov      sp, bp
1:02A0  1f                pop      ds
1:02A1  5d                pop      bp
1:02A2  4d                dec      bp
1:02A3  cb                retf     

; ===== EXPORT:ord_11(#11) =====
1:02A4  1e                push     ds
1:02A5  58                pop      ax
1:02A6  90                nop      
1:02A7  45                inc      bp
1:02A8  55                push     bp
1:02A9  8bec              mov      bp, sp
1:02AB  1e                push     ds
1:02AC  8ed8              mov      ds, ax
1:02AE  ff067800          inc      word ptr [0x78]
1:02B2  833e100002        cmp      word ptr [0x10], 2
1:02B7  7d06              jge      0x2bf
1:02B9  0e                push     cs
1:02BA  e89105            call     0x84e
1:02BD  eb04              jmp      0x2c3
1:02BF  0e                push     cs
1:02C0  e89f01            call     0x462
1:02C3  2bc0              sub      ax, ax
1:02C5  4d                dec      bp
1:02C6  4d                dec      bp
1:02C7  8be5              mov      sp, bp
1:02C9  1f                pop      ds
1:02CA  5d                pop      bp
1:02CB  4d                dec      bp
1:02CC  cb                retf     

; ===== EXPORT:ord_9(#9) =====
1:02CD  1e                push     ds
1:02CE  58                pop      ax
1:02CF  90                nop      
1:02D0  45                inc      bp
1:02D1  55                push     bp
1:02D2  8bec              mov      bp, sp
1:02D4  1e                push     ds
1:02D5  8ed8              mov      ds, ax
1:02D7  833e860400        cmp      word ptr [0x486], 0
1:02DC  740f              je       0x2ed
1:02DE  ff368604          push     word ptr [0x486]
1:02E2  9a25030000        lcall    0, 0x325  ; @1:GDI.DeleteDC
1:02E7  c70686040000      mov      word ptr [0x486], 0
1:02ED  833eae0400        cmp      word ptr [0x4ae], 0
1:02F2  740f              je       0x303
1:02F4  ff36ae04          push     word ptr [0x4ae]
1:02F8  9a0f030000        lcall    0, 0x30f  ; @1:GDI.DeleteObject
1:02FD  c706ae040000      mov      word ptr [0x4ae], 0
1:0303  833ea40400        cmp      word ptr [0x4a4], 0
1:0308  740f              je       0x319
1:030A  ff36a404          push     word ptr [0x4a4]
1:030E  9a3b030000        lcall    0, 0x33b  ; @1:GDI.DeleteObject
1:0313  c706a4040000      mov      word ptr [0x4a4], 0
1:0319  833e6c0400        cmp      word ptr [0x46c], 0
1:031E  740f              je       0x32f
1:0320  ff366c04          push     word ptr [0x46c]
1:0324  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteDC
1:0329  c7066c040000      mov      word ptr [0x46c], 0
1:032F  833ea60400        cmp      word ptr [0x4a6], 0
1:0334  740f              je       0x345
1:0336  ff36a604          push     word ptr [0x4a6]
1:033A  9a5d030000        lcall    0, 0x35d  ; @1:GDI.DeleteObject
1:033F  c706a6040000      mov      word ptr [0x4a6], 0
1:0345  833e8c0400        cmp      word ptr [0x48c], 0
1:034A  742c              je       0x378
1:034C  c70608040000      mov      word ptr [0x408], 0
1:0352  8b1e0804          mov      bx, word ptr [0x408]
1:0356  d1e3              shl      bx, 1
1:0358  ffb78c04          push     word ptr [bx + 0x48c]
1:035C  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteObject
1:0361  8b1e0804          mov      bx, word ptr [0x408]
1:0365  d1e3              shl      bx, 1
1:0367  c7878c040000      mov      word ptr [bx + 0x48c], 0
1:036D  ff060804          inc      word ptr [0x408]
1:0371  833e08040a        cmp      word ptr [0x408], 0xa
1:0376  7cda              jl       0x352
1:0378  2bc0              sub      ax, ax
1:037A  4d                dec      bp
1:037B  4d                dec      bp
1:037C  8be5              mov      sp, bp
1:037E  1f                pop      ds
1:037F  5d                pop      bp
1:0380  4d                dec      bp
1:0381  cb                retf     

; ===== EXPORT:ord_8(#8) =====
1:0382  1e                push     ds
1:0383  58                pop      ax
1:0384  90                nop      
1:0385  45                inc      bp
1:0386  55                push     bp
1:0387  8bec              mov      bp, sp
1:0389  1e                push     ds
1:038A  8ed8              mov      ds, ax
1:038C  2bc0              sub      ax, ax
1:038E  4d                dec      bp
1:038F  4d                dec      bp
1:0390  8be5              mov      sp, bp
1:0392  1f                pop      ds
1:0393  5d                pop      bp
1:0394  4d                dec      bp
1:0395  cb                retf     

; ===== EXPORT:ord_7(#7) =====
1:0396  1e                push     ds
1:0397  58                pop      ax
1:0398  90                nop      
1:0399  45                inc      bp
1:039A  55                push     bp
1:039B  8bec              mov      bp, sp
1:039D  1e                push     ds
1:039E  8ed8              mov      ds, ax
1:03A0  2bc0              sub      ax, ax
1:03A2  4d                dec      bp
1:03A3  4d                dec      bp
1:03A4  8be5              mov      sp, bp
1:03A6  1f                pop      ds
1:03A7  5d                pop      bp
1:03A8  4d                dec      bp
1:03A9  cb                retf     

; ===== EXPORT:ord_6(#6) =====
1:03AA  1e                push     ds
1:03AB  58                pop      ax
1:03AC  90                nop      
1:03AD  45                inc      bp
1:03AE  55                push     bp
1:03AF  8bec              mov      bp, sp
1:03B1  1e                push     ds
1:03B2  8ed8              mov      ds, ax
1:03B4  c41e7e04          les      bx, ptr [0x47e]
1:03B8  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:03BD  7405              je       0x3c4
1:03BF  2bc0              sub      ax, ax
1:03C1  e99600            jmp      0x45a
1:03C4  8b4606            mov      ax, word ptr [bp + 6]
1:03C7  0bc0              or       ax, ax
1:03C9  7408              je       0x3d3
1:03CB  48                dec      ax
1:03CC  740e              je       0x3dc
1:03CE  48                dec      ax
1:03CF  7474              je       0x445
1:03D1  ebec              jmp      0x3bf
1:03D3  0e                push     cs
1:03D4  e8f6fe            call     0x2cd
1:03D7  b80300            mov      ax, 3
1:03DA  eb7e              jmp      0x45a
1:03DC  c7067800d007      mov      word ptr [0x78], 0x7d0
1:03E2  c41eb404          les      bx, ptr [0x4b4]
1:03E6  268b4708          mov      ax, word ptr es:[bx + 8]
1:03EA  3d6400            cmp      ax, 0x64
1:03ED  7447              je       0x436
1:03EF  77ce              ja       0x3bf
1:03F1  0ac0              or       al, al
1:03F3  7412              je       0x407
1:03F5  2c14              sub      al, 0x14
1:03F7  741c              je       0x415
1:03F9  2c14              sub      al, 0x14
1:03FB  7426              je       0x423
1:03FD  2c14              sub      al, 0x14
1:03FF  742d              je       0x42e
1:0401  2c14              sub      al, 0x14
1:0403  7431              je       0x436
1:0405  ebb8              jmp      0x3bf
1:0407  c70614000100      mov      word ptr [0x14], 1
1:040D  c7067600c800      mov      word ptr [0x76], 0xc8
1:0413  ebaa              jmp      0x3bf
1:0415  c70614000100      mov      word ptr [0x14], 1
1:041B  c70676003200      mov      word ptr [0x76], 0x32
1:0421  eb9c              jmp      0x3bf
1:0423  b80100            mov      ax, 1
1:0426  a31400            mov      word ptr [0x14], ax
1:0429  a37600            mov      word ptr [0x76], ax
1:042C  eb91              jmp      0x3bf
1:042E  c70614000200      mov      word ptr [0x14], 2
1:0434  eb06              jmp      0x43c
1:0436  c70614000300      mov      word ptr [0x14], 3
1:043C  c70676000100      mov      word ptr [0x76], 1
1:0442  e97aff            jmp      0x3bf
1:0445  833e100001        cmp      word ptr [0x10], 1
1:044A  7f87              jg       0x3d3
1:044C  c41eb404          les      bx, ptr [0x4b4]
1:0450  268b470a          mov      ax, word ptr es:[bx + 0xa]
1:0454  a31200            mov      word ptr [0x12], ax
1:0457  e965ff            jmp      0x3bf
1:045A  4d                dec      bp
1:045B  4d                dec      bp
1:045C  8be5              mov      sp, bp
1:045E  1f                pop      ds
1:045F  5d                pop      bp
1:0460  4d                dec      bp
1:0461  cb                retf     
1:0462  1e                push     ds
1:0463  58                pop      ax
1:0464  90                nop      
1:0465  45                inc      bp
1:0466  55                push     bp
1:0467  8bec              mov      bp, sp
1:0469  1e                push     ds
1:046A  8ed8              mov      ds, ax
1:046C  ff366c04          push     word ptr [0x46c]
1:0470  b86404            mov      ax, 0x464
1:0473  1e                push     ds
1:0474  50                push     ax
1:0475  b80400            mov      ax, 4
1:0478  50                push     ax
1:0479  9a44020000        lcall    0, 0x244  ; @1:GDI.GetStockObject
1:047E  50                push     ax
1:047F  9a4a020000        lcall    0, 0x24a  ; @1:USER.FillRect
1:0484  b81204            mov      ax, 0x412
1:0487  50                push     ax
1:0488  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_5(1:1080)
1:048D  5b                pop      bx
1:048E  b81204            mov      ax, 0x412
1:0491  50                push     ax
1:0492  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_4(1:0FF2)
1:0497  5b                pop      bx
1:0498  a31604            mov      word ptr [0x416], ax
1:049B  8bd8              mov      bx, ax
1:049D  8b07              mov      ax, word ptr [bx]
1:049F  a30c04            mov      word ptr [0x40c], ax
1:04A2  a3ac04            mov      word ptr [0x4ac], ax
1:04A5  8b4702            mov      ax, word ptr [bx + 2]
1:04A8  a30a04            mov      word ptr [0x40a], ax
1:04AB  a3b204            mov      word ptr [0x4b2], ax
1:04AE  8b4704            mov      ax, word ptr [bx + 4]
1:04B1  a30e04            mov      word ptr [0x40e], ax
1:04B4  3d0c00            cmp      ax, 0xc
1:04B7  7e06              jle      0x4bf
1:04B9  2d0c00            sub      ax, 0xc
1:04BC  a30e04            mov      word ptr [0x40e], ax
1:04BF  0bc0              or       ax, ax
1:04C1  7506              jne      0x4c9
1:04C3  c7060e040c00      mov      word ptr [0x40e], 0xc
1:04C9  833e0e0409        cmp      word ptr [0x40e], 9
1:04CE  7e4a              jle      0x51a
1:04D0  ff368e04          push     word ptr [0x48e]
1:04D4  b81000            mov      ax, 0x10
1:04D7  50                push     ax
1:04D8  b87004            mov      ax, 0x470
1:04DB  1e                push     ds
1:04DC  50                push     ax
1:04DD  9a2e050000        lcall    0, 0x52e  ; @1:GDI.GetObject
1:04E2  ff368604          push     word ptr [0x486]
1:04E6  ff368e04          push     word ptr [0x48e]
1:04EA  9a41050000        lcall    0, 0x541  ; @1:GDI.SelectObject
1:04EF  ff366c04          push     word ptr [0x46c]
1:04F3  b80300            mov      ax, 3
1:04F6  50                push     ax
1:04F7  50                push     ax
1:04F8  ff367204          push     word ptr [0x472]
1:04FC  ff367404          push     word ptr [0x474]
1:0500  ff368604          push     word ptr [0x486]
1:0504  2bc0              sub      ax, ax
1:0506  50                push     ax
1:0507  50                push     ax
1:0508  b82000            mov      ax, 0x20
1:050B  bacc00            mov      dx, 0xcc
1:050E  52                push     dx
1:050F  50                push     ax
1:0510  9a76050000        lcall    0, 0x576  ; @1:GDI.BitBlt
1:0515  832e0e040a        sub      word ptr [0x40e], 0xa
1:051A  8b1e0e04          mov      bx, word ptr [0x40e]
1:051E  d1e3              shl      bx, 1
1:0520  ffb78c04          push     word ptr [bx + 0x48c]
1:0524  b81000            mov      ax, 0x10
1:0527  50                push     ax
1:0528  b97004            mov      cx, 0x470
1:052B  1e                push     ds
1:052C  51                push     cx
1:052D  9ac7050000        lcall    0, 0x5c7  ; @1:GDI.GetObject
1:0532  ff368604          push     word ptr [0x486]
1:0536  8b1e0e04          mov      bx, word ptr [0x40e]
1:053A  d1e3              shl      bx, 1
1:053C  ffb78c04          push     word ptr [bx + 0x48c]
1:0540  9ae1050000        lcall    0, 0x5e1  ; @1:GDI.SelectObject
1:0545  ff366c04          push     word ptr [0x46c]
1:0549  b82f00            mov      ax, 0x2f
1:054C  2b067204          sub      ax, word ptr [0x472]
1:0550  99                cdq      
1:0551  2bc2              sub      ax, dx
1:0553  d1f8              sar      ax, 1
1:0555  052200            add      ax, 0x22
1:0558  50                push     ax
1:0559  b80300            mov      ax, 3
1:055C  50                push     ax
1:055D  ff367204          push     word ptr [0x472]
1:0561  ff367404          push     word ptr [0x474]
1:0565  ff368604          push     word ptr [0x486]
1:0569  2bc9              sub      cx, cx
1:056B  51                push     cx
1:056C  51                push     cx
1:056D  ba2000            mov      dx, 0x20
1:0570  bbcc00            mov      bx, 0xcc
1:0573  53                push     bx
1:0574  52                push     dx
1:0575  9a16060000        lcall    0, 0x616  ; @1:GDI.BitBlt
1:057A  ff366c04          push     word ptr [0x46c]
1:057E  b85700            mov      ax, 0x57
1:0581  50                push     ax
1:0582  b91700            mov      cx, 0x17
1:0585  51                push     cx
1:0586  ba6000            mov      dx, 0x60
1:0589  52                push     dx
1:058A  bb2000            mov      bx, 0x20
1:058D  53                push     bx
1:058E  9aa8050000        lcall    0, 0x5a8  ; @1:GDI.Ellipse
1:0593  ff366c04          push     word ptr [0x46c]
1:0597  b85700            mov      ax, 0x57
1:059A  50                push     ax
1:059B  b83500            mov      ax, 0x35
1:059E  50                push     ax
1:059F  b96000            mov      cx, 0x60
1:05A2  51                push     cx
1:05A3  b93e00            mov      cx, 0x3e
1:05A6  51                push     cx
1:05A7  9a9d060000        lcall    0, 0x69d  ; @1:GDI.Ellipse
1:05AC  a10a04            mov      ax, word ptr [0x40a]
1:05AF  b90a00            mov      cx, 0xa
1:05B2  99                cdq      
1:05B3  f7f9              idiv     cx
1:05B5  8bd8              mov      bx, ax
1:05B7  d1e3              shl      bx, 1
1:05B9  ffb78c04          push     word ptr [bx + 0x48c]
1:05BD  b81000            mov      ax, 0x10
1:05C0  50                push     ax
1:05C1  ba7004            mov      dx, 0x470
1:05C4  1e                push     ds
1:05C5  52                push     dx
1:05C6  9a35060000        lcall    0, 0x635  ; @1:GDI.GetObject
1:05CB  ff368604          push     word ptr [0x486]
1:05CF  a10a04            mov      ax, word ptr [0x40a]
1:05D2  b90a00            mov      cx, 0xa
1:05D5  99                cdq      
1:05D6  f7f9              idiv     cx
1:05D8  8bd8              mov      bx, ax
1:05DA  d1e3              shl      bx, 1
1:05DC  ffb78c04          push     word ptr [bx + 0x48c]
1:05E0  9a4f060000        lcall    0, 0x64f  ; @1:GDI.SelectObject
1:05E5  ff366c04          push     word ptr [0x46c]
1:05E9  b82f00            mov      ax, 0x2f
1:05EC  2b067204          sub      ax, word ptr [0x472]
1:05F0  99                cdq      
1:05F1  2bc2              sub      ax, dx
1:05F3  d1f8              sar      ax, 1
1:05F5  056400            add      ax, 0x64
1:05F8  50                push     ax
1:05F9  b80300            mov      ax, 3
1:05FC  50                push     ax
1:05FD  ff367204          push     word ptr [0x472]
1:0601  ff367404          push     word ptr [0x474]
1:0605  ff368604          push     word ptr [0x486]
1:0609  2bc9              sub      cx, cx
1:060B  51                push     cx
1:060C  51                push     cx
1:060D  ba2000            mov      dx, 0x20
1:0610  bbcc00            mov      bx, 0xcc
1:0613  53                push     bx
1:0614  52                push     dx
1:0615  9a84060000        lcall    0, 0x684  ; @1:GDI.BitBlt
1:061A  a10a04            mov      ax, word ptr [0x40a]
1:061D  b90a00            mov      cx, 0xa
1:0620  99                cdq      
1:0621  f7f9              idiv     cx
1:0623  8bda              mov      bx, dx
1:0625  d1e3              shl      bx, 1
1:0627  ffb78c04          push     word ptr [bx + 0x48c]
1:062B  b81000            mov      ax, 0x10
1:062E  50                push     ax
1:062F  ba7004            mov      dx, 0x470
1:0632  1e                push     ds
1:0633  52                push     dx
1:0634  9ad5060000        lcall    0, 0x6d5  ; @1:GDI.GetObject
1:0639  ff368604          push     word ptr [0x486]
1:063D  a10a04            mov      ax, word ptr [0x40a]
1:0640  b90a00            mov      cx, 0xa
1:0643  99                cdq      
1:0644  f7f9              idiv     cx
1:0646  8bda              mov      bx, dx
1:0648  d1e3              shl      bx, 1
1:064A  ffb78c04          push     word ptr [bx + 0x48c]
1:064E  9aef060000        lcall    0, 0x6ef  ; @1:GDI.SelectObject
1:0653  ff366c04          push     word ptr [0x46c]
1:0657  b82f00            mov      ax, 0x2f
1:065A  2b067204          sub      ax, word ptr [0x472]
1:065E  99                cdq      
1:065F  2bc2              sub      ax, dx
1:0661  d1f8              sar      ax, 1
1:0663  059a00            add      ax, 0x9a
1:0666  50                push     ax
1:0667  b80300            mov      ax, 3
1:066A  50                push     ax
1:066B  ff367204          push     word ptr [0x472]
1:066F  ff367404          push     word ptr [0x474]
1:0673  ff368604          push     word ptr [0x486]
1:0677  2bc9              sub      cx, cx
1:0679  51                push     cx
1:067A  51                push     cx
1:067B  ba2000            mov      dx, 0x20
1:067E  bbcc00            mov      bx, 0xcc
1:0681  53                push     bx
1:0682  52                push     dx
1:0683  9a24070000        lcall    0, 0x724  ; @1:GDI.BitBlt
1:0688  ff366c04          push     word ptr [0x46c]
1:068C  b8cf00            mov      ax, 0xcf
1:068F  50                push     ax
1:0690  b91700            mov      cx, 0x17
1:0693  51                push     cx
1:0694  b9d800            mov      cx, 0xd8
1:0697  51                push     cx
1:0698  ba2000            mov      dx, 0x20
1:069B  52                push     dx
1:069C  9ab6060000        lcall    0, 0x6b6  ; @1:GDI.Ellipse
1:06A1  ff366c04          push     word ptr [0x46c]
1:06A5  b8cf00            mov      ax, 0xcf
1:06A8  50                push     ax
1:06A9  b83500            mov      ax, 0x35
1:06AC  50                push     ax
1:06AD  b8d800            mov      ax, 0xd8
1:06B0  50                push     ax
1:06B1  b83e00            mov      ax, 0x3e
1:06B4  50                push     ax
1:06B5  9affff0000        lcall    0, 0xffff  ; @1:GDI.Ellipse
1:06BA  a10c04            mov      ax, word ptr [0x40c]
1:06BD  b90a00            mov      cx, 0xa
1:06C0  99                cdq      
1:06C1  f7f9              idiv     cx
1:06C3  8bd8              mov      bx, ax
1:06C5  d1e3              shl      bx, 1
1:06C7  ffb78c04          push     word ptr [bx + 0x48c]
1:06CB  b81000            mov      ax, 0x10
1:06CE  50                push     ax
1:06CF  ba7004            mov      dx, 0x470
1:06D2  1e                push     ds
1:06D3  52                push     dx
1:06D4  9a43070000        lcall    0, 0x743  ; @1:GDI.GetObject
1:06D9  ff368604          push     word ptr [0x486]
1:06DD  a10c04            mov      ax, word ptr [0x40c]
1:06E0  b90a00            mov      cx, 0xa
1:06E3  99                cdq      
1:06E4  f7f9              idiv     cx
1:06E6  8bd8              mov      bx, ax
1:06E8  d1e3              shl      bx, 1
1:06EA  ffb78c04          push     word ptr [bx + 0x48c]
1:06EE  9a5d070000        lcall    0, 0x75d  ; @1:GDI.SelectObject
1:06F3  ff366c04          push     word ptr [0x46c]
1:06F7  b82f00            mov      ax, 0x2f
1:06FA  2b067204          sub      ax, word ptr [0x472]
1:06FE  99                cdq      
1:06FF  2bc2              sub      ax, dx
1:0701  d1f8              sar      ax, 1
1:0703  05dc00            add      ax, 0xdc
1:0706  50                push     ax
1:0707  b80300            mov      ax, 3
1:070A  50                push     ax
1:070B  ff367204          push     word ptr [0x472]
1:070F  ff367404          push     word ptr [0x474]
1:0713  ff368604          push     word ptr [0x486]
1:0717  2bc9              sub      cx, cx
1:0719  51                push     cx
1:071A  51                push     cx
1:071B  ba2000            mov      dx, 0x20
1:071E  bbcc00            mov      bx, 0xcc
1:0721  53                push     bx
1:0722  52                push     dx
1:0723  9affff0000        lcall    0, 0xffff  ; @1:GDI.BitBlt
1:0728  a10c04            mov      ax, word ptr [0x40c]
1:072B  b90a00            mov      cx, 0xa
1:072E  99                cdq      
1:072F  f7f9              idiv     cx
1:0731  8bda              mov      bx, dx
1:0733  d1e3              shl      bx, 1
1:0735  ffb78c04          push     word ptr [bx + 0x48c]
1:0739  b81000            mov      ax, 0x10
1:073C  50                push     ax
1:073D  b87004            mov      ax, 0x470
1:0740  1e                push     ds
1:0741  50                push     ax
1:0742  9aad010000        lcall    0, 0x1ad  ; @1:GDI.GetObject
1:0747  ff368604          push     word ptr [0x486]
1:074B  a10c04            mov      ax, word ptr [0x40c]
1:074E  b90a00            mov      cx, 0xa
1:0751  99                cdq      
1:0752  f7f9              idiv     cx
1:0754  8bda              mov      bx, dx
1:0756  d1e3              shl      bx, 1
1:0758  ffb78c04          push     word ptr [bx + 0x48c]
1:075C  9a15020000        lcall    0, 0x215  ; @1:GDI.SelectObject
1:0761  ff366c04          push     word ptr [0x46c]
1:0765  b82f00            mov      ax, 0x2f
1:0768  2b067204          sub      ax, word ptr [0x472]
1:076C  99                cdq      
1:076D  2bc2              sub      ax, dx
1:076F  d1f8              sar      ax, 1
1:0771  051201            add      ax, 0x112
1:0774  50                push     ax
1:0775  b80300            mov      ax, 3
1:0778  50                push     ax
1:0779  ff367204          push     word ptr [0x472]
1:077D  ff367404          push     word ptr [0x474]
1:0781  ff368604          push     word ptr [0x486]
1:0785  2bc0              sub      ax, ax
1:0787  50                push     ax
1:0788  50                push     ax
1:0789  b92000            mov      cx, 0x20
1:078C  bacc00            mov      dx, 0xcc
1:078F  52                push     dx
1:0790  51                push     cx
1:0791  9abf070000        lcall    0, 0x7bf  ; @1:GDI.BitBlt
1:0796  0e                push     cs
1:0797  e8bc05            call     0xd56
1:079A  ff366e04          push     word ptr [0x46e]
1:079E  ff366204          push     word ptr [0x462]
1:07A2  ff36a004          push     word ptr [0x4a0]
1:07A6  ff36b004          push     word ptr [0x4b0]
1:07AA  ff368204          push     word ptr [0x482]
1:07AE  ff366c04          push     word ptr [0x46c]
1:07B2  2bc0              sub      ax, ax
1:07B4  50                push     ax
1:07B5  50                push     ax
1:07B6  b92000            mov      cx, 0x20
1:07B9  bacc00            mov      dx, 0xcc
1:07BC  52                push     dx
1:07BD  51                push     cx
1:07BE  9a2b090000        lcall    0, 0x92b  ; @1:GDI.BitBlt
1:07C3  a17600            mov      ax, word ptr [0x76]
1:07C6  39067800          cmp      word ptr [0x78], ax
1:07CA  7e7a              jle      0x846
1:07CC  c70678000000      mov      word ptr [0x78], 0
1:07D2  833e180000        cmp      word ptr [0x18], 0
1:07D7  7419              je       0x7f2
1:07D9  a11400            mov      ax, word ptr [0x14]
1:07DC  01066204          add      word ptr [0x462], ax
1:07E0  c41eb404          les      bx, ptr [0x4b4]
1:07E4  268b4702          mov      ax, word ptr es:[bx + 2]
1:07E8  2b06b004          sub      ax, word ptr [0x4b0]
1:07EC  3b066204          cmp      ax, word ptr [0x462]
1:07F0  eb0c              jmp      0x7fe
1:07F2  a11400            mov      ax, word ptr [0x14]
1:07F5  29066204          sub      word ptr [0x462], ax
1:07F9  833e620400        cmp      word ptr [0x462], 0
1:07FE  7f0c              jg       0x80c
1:0800  833e180001        cmp      word ptr [0x18], 1
1:0805  1bc0              sbb      ax, ax
1:0807  f7d8              neg      ax
1:0809  a31800            mov      word ptr [0x18], ax
1:080C  833e1a0000        cmp      word ptr [0x1a], 0
1:0811  7419              je       0x82c
1:0813  a11600            mov      ax, word ptr [0x16]
1:0816  0106a004          add      word ptr [0x4a0], ax
1:081A  c41eb404          les      bx, ptr [0x4b4]
1:081E  268b4704          mov      ax, word ptr es:[bx + 4]
1:0822  2b068204          sub      ax, word ptr [0x482]
1:0826  3b06a004          cmp      ax, word ptr [0x4a0]
1:082A  eb0c              jmp      0x838
1:082C  a11600            mov      ax, word ptr [0x16]
1:082F  2906a004          sub      word ptr [0x4a0], ax
1:0833  833ea00400        cmp      word ptr [0x4a0], 0
1:0838  7f0c              jg       0x846
1:083A  833e1a0001        cmp      word ptr [0x1a], 1
1:083F  1bc0              sbb      ax, ax
1:0841  f7d8              neg      ax
1:0843  a31a00            mov      word ptr [0x1a], ax
1:0846  4d                dec      bp
1:0847  4d                dec      bp
1:0848  8be5              mov      sp, bp
1:084A  1f                pop      ds
1:084B  5d                pop      bp
1:084C  4d                dec      bp
1:084D  cb                retf     
1:084E  1e                push     ds
1:084F  58                pop      ax
1:0850  90                nop      
1:0851  45                inc      bp
1:0852  55                push     bp
1:0853  8bec              mov      bp, sp
1:0855  1e                push     ds
1:0856  8ed8              mov      ds, ax
1:0858  83ec12            sub      sp, 0x12
1:085B  a11000            mov      ax, word ptr [0x10]
1:085E  0bc0              or       ax, ax
1:0860  7503              jne      0x865
1:0862  e98500            jmp      0x8ea
1:0865  48                dec      ax
1:0866  7503              jne      0x86b
1:0868  e9c600            jmp      0x931
1:086B  2d0400            sub      ax, 4
1:086E  7548              jne      0x8b8
1:0870  ff366c04          push     word ptr [0x46c]
1:0874  b80100            mov      ax, 1
1:0877  50                push     ax
1:0878  9a080b0000        lcall    0, 0xb08  ; @1:GDI.GetStockObject
1:087D  50                push     ax
1:087E  9ab4080000        lcall    0, 0x8b4  ; @1:GDI.SelectObject
1:0883  8946f2            mov      word ptr [bp - 0xe], ax
1:0886  ff366c04          push     word ptr [0x46c]
1:088A  b80200            mov      ax, 2
1:088D  50                push     ax
1:088E  50                push     ax
1:088F  b88000            mov      ax, 0x80
1:0892  50                push     ax
1:0893  50                push     ax
1:0894  9aa8080000        lcall    0, 0x8a8  ; @1:GDI.Ellipse
1:0899  ff366c04          push     word ptr [0x46c]
1:089D  b80500            mov      ax, 5
1:08A0  50                push     ax
1:08A1  50                push     ax
1:08A2  b87d00            mov      ax, 0x7d
1:08A5  50                push     ax
1:08A6  50                push     ax
1:08A7  9a8f050000        lcall    0, 0x58f  ; @1:GDI.Ellipse
1:08AC  ff366c04          push     word ptr [0x46c]
1:08B0  ff76f2            push     word ptr [bp - 0xe]
1:08B3  9a05090000        lcall    0, 0x905  ; @1:GDI.SelectObject
1:08B8  a17600            mov      ax, word ptr [0x76]
1:08BB  39067800          cmp      word ptr [0x78], ax
1:08BF  7f03              jg       0x8c4
1:08C1  e9dd00            jmp      0x9a1
1:08C4  c70678000000      mov      word ptr [0x78], 0
1:08CA  833e180000        cmp      word ptr [0x18], 0
1:08CF  747c              je       0x94d
1:08D1  a11400            mov      ax, word ptr [0x14]
1:08D4  01066204          add      word ptr [0x462], ax
1:08D8  c41eb404          les      bx, ptr [0x4b4]
1:08DC  268b4702          mov      ax, word ptr es:[bx + 2]
1:08E0  2b067204          sub      ax, word ptr [0x472]
1:08E4  3b066204          cmp      ax, word ptr [0x462]
1:08E8  eb6f              jmp      0x959
1:08EA  ff36ae04          push     word ptr [0x4ae]
1:08EE  b81000            mov      ax, 0x10
1:08F1  50                push     ax
1:08F2  b87004            mov      ax, 0x470
1:08F5  1e                push     ds
1:08F6  50                push     ax
1:08F7  9a3f090000        lcall    0, 0x93f  ; @1:GDI.GetObject
1:08FC  ff368604          push     word ptr [0x486]
1:0900  ff36ae04          push     word ptr [0x4ae]
1:0904  9a0c0a0000        lcall    0, 0xa0c  ; @1:GDI.SelectObject
1:0909  ff366c04          push     word ptr [0x46c]
1:090D  b80200            mov      ax, 2
1:0910  50                push     ax
1:0911  50                push     ax
1:0912  ff367204          push     word ptr [0x472]
1:0916  ff367404          push     word ptr [0x474]
1:091A  ff368604          push     word ptr [0x486]
1:091E  2bc0              sub      ax, ax
1:0920  50                push     ax
1:0921  50                push     ax
1:0922  b82000            mov      ax, 0x20
1:0925  bacc00            mov      dx, 0xcc
1:0928  52                push     dx
1:0929  50                push     ax
1:092A  9a11050000        lcall    0, 0x511  ; @1:GDI.BitBlt
1:092F  eb87              jmp      0x8b8
1:0931  ff36a404          push     word ptr [0x4a4]
1:0935  b81000            mov      ax, 0x10
1:0938  50                push     ax
1:0939  b87004            mov      ax, 0x470
1:093C  1e                push     ds
1:093D  50                push     ax
1:093E  9ade040000        lcall    0, 0x4de  ; @1:GDI.GetObject
1:0943  ff368604          push     word ptr [0x486]
1:0947  ff36a404          push     word ptr [0x4a4]
1:094B  ebb7              jmp      0x904
1:094D  a11400            mov      ax, word ptr [0x14]
1:0950  29066204          sub      word ptr [0x462], ax
1:0954  833e620400        cmp      word ptr [0x462], 0
1:0959  7f0c              jg       0x967
1:095B  833e180001        cmp      word ptr [0x18], 1
1:0960  1bc0              sbb      ax, ax
1:0962  f7d8              neg      ax
1:0964  a31800            mov      word ptr [0x18], ax
1:0967  833e1a0000        cmp      word ptr [0x1a], 0
1:096C  7419              je       0x987
1:096E  a11600            mov      ax, word ptr [0x16]
1:0971  0106a004          add      word ptr [0x4a0], ax
1:0975  c41eb404          les      bx, ptr [0x4b4]
1:0979  268b4704          mov      ax, word ptr es:[bx + 4]
1:097D  2b067404          sub      ax, word ptr [0x474]
1:0981  3b06a004          cmp      ax, word ptr [0x4a0]
1:0985  eb0c              jmp      0x993
1:0987  a11600            mov      ax, word ptr [0x16]
1:098A  2906a004          sub      word ptr [0x4a0], ax
1:098E  833ea00400        cmp      word ptr [0x4a0], 0
1:0993  7f0c              jg       0x9a1
1:0995  833e1a0001        cmp      word ptr [0x1a], 1
1:099A  1bc0              sbb      ax, ax
1:099C  f7d8              neg      ax
1:099E  a31a00            mov      word ptr [0x1a], ax
1:09A1  b81a04            mov      ax, 0x41a
1:09A4  50                push     ax
1:09A5  9a89040000        lcall    0, 0x489  ; @1:INT:ord_5(1:1080)
1:09AA  5b                pop      bx
1:09AB  b81a04            mov      ax, 0x41a
1:09AE  50                push     ax
1:09AF  9a93040000        lcall    0, 0x493  ; @1:INT:ord_4(1:0FF2)
1:09B4  5b                pop      bx
1:09B5  8bd8              mov      bx, ax
1:09B7  8b07              mov      ax, word ptr [bx]
1:09B9  8946fa            mov      word ptr [bp - 6], ax
1:09BC  a3ac04            mov      word ptr [0x4ac], ax
1:09BF  8b4702            mov      ax, word ptr [bx + 2]
1:09C2  8946fc            mov      word ptr [bp - 4], ax
1:09C5  a3b204            mov      word ptr [0x4b2], ax
1:09C8  8b4704            mov      ax, word ptr [bx + 4]
1:09CB  8946f6            mov      word ptr [bp - 0xa], ax
1:09CE  a11000            mov      ax, word ptr [0x10]
1:09D1  0bc0              or       ax, ax
1:09D3  740b              je       0x9e0
1:09D5  48                dec      ax
1:09D6  7503              jne      0x9db
1:09D8  e99c00            jmp      0xa77
1:09DB  2d0400            sub      ax, 4
1:09DE  7530              jne      0xa10
1:09E0  a1b004            mov      ax, word ptr [0x4b0]
1:09E3  99                cdq      
1:09E4  2bc2              sub      ax, dx
1:09E6  d1f8              sar      ax, 1
1:09E8  a38804            mov      word ptr [0x488], ax
1:09EB  a18204            mov      ax, word ptr [0x482]
1:09EE  99                cdq      
1:09EF  2bc2              sub      ax, dx
1:09F1  d1f8              sar      ax, 1
1:09F3  a38a04            mov      word ptr [0x48a], ax
1:09F6  ff366c04          push     word ptr [0x46c]
1:09FA  2bc0              sub      ax, ax
1:09FC  50                push     ax
1:09FD  b80200            mov      ax, 2
1:0A00  50                push     ax
1:0A01  2bc0              sub      ax, ax
1:0A03  50                push     ax
1:0A04  50                push     ax
1:0A05  9abe0a0000        lcall    0, 0xabe  ; @1:GDI.CreatePen
1:0A0A  50                push     ax
1:0A0B  9ac40a0000        lcall    0, 0xac4  ; @1:GDI.SelectObject
1:0A10  837ef60c          cmp      word ptr [bp - 0xa], 0xc
1:0A14  7e04              jle      0xa1a
1:0A16  836ef60c          sub      word ptr [bp - 0xa], 0xc
1:0A1A  837ef60c          cmp      word ptr [bp - 0xa], 0xc
1:0A1E  7505              jne      0xa25
1:0A20  c746f60000        mov      word ptr [bp - 0xa], 0
1:0A25  8b46f6            mov      ax, word ptr [bp - 0xa]
1:0A28  b90300            mov      cx, 3
1:0A2B  99                cdq      
1:0A2C  f7f9              idiv     cx
1:0A2E  a3a204            mov      word ptr [0x4a2], ax
1:0A31  8b46fc            mov      ax, word ptr [bp - 4]
1:0A34  b90c00            mov      cx, 0xc
1:0A37  99                cdq      
1:0A38  f7f9              idiv     cx
1:0A3A  8946ee            mov      word ptr [bp - 0x12], ax
1:0A3D  b80500            mov      ax, 5
1:0A40  f76ef6            imul     word ptr [bp - 0xa]
1:0A43  b90f00            mov      cx, 0xf
1:0A46  99                cdq      
1:0A47  f7f9              idiv     cx
1:0A49  0356ee            add      dx, word ptr [bp - 0x12]
1:0A4C  52                push     dx
1:0A4D  0e                push     cs
1:0A4E  e85802            call     0xca9
1:0A51  5b                pop      bx
1:0A52  8b46fc            mov      ax, word ptr [bp - 4]
1:0A55  b90f00            mov      cx, 0xf
1:0A58  99                cdq      
1:0A59  f7f9              idiv     cx
1:0A5B  8956f4            mov      word ptr [bp - 0xc], dx
1:0A5E  8b46fc            mov      ax, word ptr [bp - 4]
1:0A61  99                cdq      
1:0A62  f7f9              idiv     cx
1:0A64  a3a204            mov      word ptr [0x4a2], ax
1:0A67  833e100000        cmp      word ptr [0x10], 0
1:0A6C  7522              jne      0xa90
1:0A6E  ff76f4            push     word ptr [bp - 0xc]
1:0A71  0e                push     cs
1:0A72  e8da00            call     0xb4f
1:0A75  eb20              jmp      0xa97
1:0A77  a17204            mov      ax, word ptr [0x472]
1:0A7A  99                cdq      
1:0A7B  2bc2              sub      ax, dx
1:0A7D  d1f8              sar      ax, 1
1:0A7F  a38804            mov      word ptr [0x488], ax
1:0A82  a17404            mov      ax, word ptr [0x474]
1:0A85  99                cdq      
1:0A86  2bc2              sub      ax, dx
1:0A88  d1f8              sar      ax, 1
1:0A8A  2d0a00            sub      ax, 0xa
1:0A8D  e963ff            jmp      0x9f3
1:0A90  ff76f4            push     word ptr [bp - 0xc]
1:0A93  0e                push     cs
1:0A94  e86501            call     0xbfc
1:0A97  5b                pop      bx
1:0A98  833e120000        cmp      word ptr [0x12], 0
1:0A9D  745c              je       0xafb
1:0A9F  a11000            mov      ax, word ptr [0x10]
1:0AA2  0bc0              or       ax, ax
1:0AA4  7408              je       0xaae
1:0AA6  48                dec      ax
1:0AA7  7405              je       0xaae
1:0AA9  2d0400            sub      ax, 4
1:0AAC  7520              jne      0xace
1:0AAE  ff366c04          push     word ptr [0x46c]
1:0AB2  2bc0              sub      ax, ax
1:0AB4  50                push     ax
1:0AB5  b80100            mov      ax, 1
1:0AB8  50                push     ax
1:0AB9  2bc0              sub      ax, ax
1:0ABB  50                push     ax
1:0ABC  50                push     ax
1:0ABD  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreatePen
1:0AC2  50                push     ax
1:0AC3  9a0e0b0000        lcall    0, 0xb0e  ; @1:GDI.SelectObject
1:0AC8  50                push     ax
1:0AC9  9af9020000        lcall    0, 0x2f9  ; @1:GDI.DeleteObject
1:0ACE  8b46fa            mov      ax, word ptr [bp - 6]
1:0AD1  b90f00            mov      cx, 0xf
1:0AD4  99                cdq      
1:0AD5  f7f9              idiv     cx
1:0AD7  8956f4            mov      word ptr [bp - 0xc], dx
1:0ADA  8b46fa            mov      ax, word ptr [bp - 6]
1:0ADD  99                cdq      
1:0ADE  f7f9              idiv     cx
1:0AE0  a3a204            mov      word ptr [0x4a2], ax
1:0AE3  833e100000        cmp      word ptr [0x10], 0
1:0AE8  7509              jne      0xaf3
1:0AEA  ff76f4            push     word ptr [bp - 0xc]
1:0AED  0e                push     cs
1:0AEE  e85e00            call     0xb4f
1:0AF1  eb07              jmp      0xafa
1:0AF3  ff76f4            push     word ptr [bp - 0xc]
1:0AF6  0e                push     cs
1:0AF7  e80201            call     0xbfc
1:0AFA  5b                pop      bx
1:0AFB  0e                push     cs
1:0AFC  e85702            call     0xd56
1:0AFF  ff366c04          push     word ptr [0x46c]
1:0B03  b80700            mov      ax, 7
1:0B06  50                push     ax
1:0B07  9a7a040000        lcall    0, 0x47a  ; @1:GDI.GetStockObject
1:0B0C  50                push     ax
1:0B0D  9aeb040000        lcall    0, 0x4eb  ; @1:GDI.SelectObject
1:0B12  50                push     ax
1:0B13  9aca0a0000        lcall    0, 0xaca  ; @1:GDI.DeleteObject
1:0B18  ff366e04          push     word ptr [0x46e]
1:0B1C  ff366204          push     word ptr [0x462]
1:0B20  ff36a004          push     word ptr [0x4a0]
1:0B24  a17204            mov      ax, word ptr [0x472]
1:0B27  050400            add      ax, 4
1:0B2A  50                push     ax
1:0B2B  a17404            mov      ax, word ptr [0x474]
1:0B2E  050400            add      ax, 4
1:0B31  50                push     ax
1:0B32  ff366c04          push     word ptr [0x46c]
1:0B36  2bc0              sub      ax, ax
1:0B38  50                push     ax
1:0B39  50                push     ax
1:0B3A  b82000            mov      ax, 0x20
1:0B3D  bacc00            mov      dx, 0xcc
1:0B40  52                push     dx
1:0B41  50                push     ax
1:0B42  9a92070000        lcall    0, 0x792  ; @1:GDI.BitBlt
1:0B47  4d                dec      bp
1:0B48  4d                dec      bp
1:0B49  8be5              mov      sp, bp
1:0B4B  1f                pop      ds
1:0B4C  5d                pop      bp
1:0B4D  4d                dec      bp
1:0B4E  cb                retf     
1:0B4F  1e                push     ds
1:0B50  58                pop      ax
1:0B51  90                nop      
1:0B52  45                inc      bp
1:0B53  55                push     bp
1:0B54  8bec              mov      bp, sp
1:0B56  1e                push     ds
1:0B57  8ed8              mov      ds, ax
1:0B59  ff366c04          push     word ptr [0x46c]
1:0B5D  ff368804          push     word ptr [0x488]
1:0B61  ff368a04          push     word ptr [0x48a]
1:0B65  9a130c0000        lcall    0, 0xc13  ; @1:GDI.MoveTo
1:0B6A  a1a204            mov      ax, word ptr [0x4a2]
1:0B6D  eb78              jmp      0xbe7
1:0B6F  ff366c04          push     word ptr [0x46c]
1:0B73  8b5e06            mov      bx, word ptr [bp + 6]
1:0B76  8a873a00          mov      al, byte ptr [bx + 0x3a]
1:0B7A  2ae4              sub      ah, ah
1:0B7C  03068804          add      ax, word ptr [0x488]
1:0B80  50                push     ax
1:0B81  8a874900          mov      al, byte ptr [bx + 0x49]
1:0B85  2ae4              sub      ah, ah
1:0B87  2b068a04          sub      ax, word ptr [0x48a]
1:0B8B  f7d8              neg      ax
1:0B8D  50                push     ax
1:0B8E  9a3c0c0000        lcall    0, 0xc3c  ; @1:GDI.LineTo
1:0B93  eb5f              jmp      0xbf4
1:0B95  ff366c04          push     word ptr [0x46c]
1:0B99  8b5e06            mov      bx, word ptr [bp + 6]
1:0B9C  8a874900          mov      al, byte ptr [bx + 0x49]
1:0BA0  2ae4              sub      ah, ah
1:0BA2  03068804          add      ax, word ptr [0x488]
1:0BA6  50                push     ax
1:0BA7  8a873a00          mov      al, byte ptr [bx + 0x3a]
1:0BAB  2ae4              sub      ah, ah
1:0BAD  03068a04          add      ax, word ptr [0x48a]
1:0BB1  ebda              jmp      0xb8d
1:0BB3  ff366c04          push     word ptr [0x46c]
1:0BB7  8b5e06            mov      bx, word ptr [bp + 6]
1:0BBA  8a873a00          mov      al, byte ptr [bx + 0x3a]
1:0BBE  2ae4              sub      ah, ah
1:0BC0  2b068804          sub      ax, word ptr [0x488]
1:0BC4  f7d8              neg      ax
1:0BC6  50                push     ax
1:0BC7  8a874900          mov      al, byte ptr [bx + 0x49]
1:0BCB  ebde              jmp      0xbab
1:0BCD  ff366c04          push     word ptr [0x46c]
1:0BD1  8b5e06            mov      bx, word ptr [bp + 6]
1:0BD4  8a874900          mov      al, byte ptr [bx + 0x49]
1:0BD8  2ae4              sub      ah, ah
1:0BDA  2b068804          sub      ax, word ptr [0x488]
1:0BDE  f7d8              neg      ax
1:0BE0  50                push     ax
1:0BE1  8a873a00          mov      al, byte ptr [bx + 0x3a]
1:0BE5  eb9e              jmp      0xb85
1:0BE7  0bc0              or       ax, ax
1:0BE9  7484              je       0xb6f
1:0BEB  48                dec      ax
1:0BEC  74a7              je       0xb95
1:0BEE  48                dec      ax
1:0BEF  74c2              je       0xbb3
1:0BF1  48                dec      ax
1:0BF2  74d9              je       0xbcd
1:0BF4  4d                dec      bp
1:0BF5  4d                dec      bp
1:0BF6  8be5              mov      sp, bp
1:0BF8  1f                pop      ds
1:0BF9  5d                pop      bp
1:0BFA  4d                dec      bp
1:0BFB  cb                retf     
1:0BFC  1e                push     ds
1:0BFD  58                pop      ax
1:0BFE  90                nop      
1:0BFF  45                inc      bp
1:0C00  55                push     bp
1:0C01  8bec              mov      bp, sp
1:0C03  1e                push     ds
1:0C04  8ed8              mov      ds, ax
1:0C06  ff366c04          push     word ptr [0x46c]
1:0C0A  ff368804          push     word ptr [0x488]
1:0C0E  ff368a04          push     word ptr [0x48a]
1:0C12  9ac00c0000        lcall    0, 0xcc0  ; @1:GDI.MoveTo
1:0C17  a1a204            mov      ax, word ptr [0x4a2]
1:0C1A  eb78              jmp      0xc94
1:0C1C  ff366c04          push     word ptr [0x46c]
1:0C20  8b5e06            mov      bx, word ptr [bp + 6]
1:0C23  8a871c00          mov      al, byte ptr [bx + 0x1c]
1:0C27  2ae4              sub      ah, ah
1:0C29  03068804          add      ax, word ptr [0x488]
1:0C2D  50                push     ax
1:0C2E  8a872b00          mov      al, byte ptr [bx + 0x2b]
1:0C32  2ae4              sub      ah, ah
1:0C34  2b068a04          sub      ax, word ptr [0x48a]
1:0C38  f7d8              neg      ax
1:0C3A  50                push     ax
1:0C3B  9ae90c0000        lcall    0, 0xce9  ; @1:GDI.LineTo
1:0C40  eb5f              jmp      0xca1
1:0C42  ff366c04          push     word ptr [0x46c]
1:0C46  8b5e06            mov      bx, word ptr [bp + 6]
1:0C49  8a872b00          mov      al, byte ptr [bx + 0x2b]
1:0C4D  2ae4              sub      ah, ah
1:0C4F  03068804          add      ax, word ptr [0x488]
1:0C53  50                push     ax
1:0C54  8a871c00          mov      al, byte ptr [bx + 0x1c]
1:0C58  2ae4              sub      ah, ah
1:0C5A  03068a04          add      ax, word ptr [0x48a]
1:0C5E  ebda              jmp      0xc3a
1:0C60  ff366c04          push     word ptr [0x46c]
1:0C64  8b5e06            mov      bx, word ptr [bp + 6]
1:0C67  8a871c00          mov      al, byte ptr [bx + 0x1c]
1:0C6B  2ae4              sub      ah, ah
1:0C6D  2b068804          sub      ax, word ptr [0x488]
1:0C71  f7d8              neg      ax
1:0C73  50                push     ax
1:0C74  8a872b00          mov      al, byte ptr [bx + 0x2b]
1:0C78  ebde              jmp      0xc58
1:0C7A  ff366c04          push     word ptr [0x46c]
1:0C7E  8b5e06            mov      bx, word ptr [bp + 6]
1:0C81  8a872b00          mov      al, byte ptr [bx + 0x2b]
1:0C85  2ae4              sub      ah, ah
1:0C87  2b068804          sub      ax, word ptr [0x488]
1:0C8B  f7d8              neg      ax
1:0C8D  50                push     ax
1:0C8E  8a871c00          mov      al, byte ptr [bx + 0x1c]
1:0C92  eb9e              jmp      0xc32
1:0C94  0bc0              or       ax, ax
1:0C96  7484              je       0xc1c
1:0C98  48                dec      ax
1:0C99  74a7              je       0xc42
1:0C9B  48                dec      ax
1:0C9C  74c2              je       0xc60
1:0C9E  48                dec      ax
1:0C9F  74d9              je       0xc7a
1:0CA1  4d                dec      bp
1:0CA2  4d                dec      bp
1:0CA3  8be5              mov      sp, bp
1:0CA5  1f                pop      ds
1:0CA6  5d                pop      bp
1:0CA7  4d                dec      bp
1:0CA8  cb                retf     
1:0CA9  1e                push     ds
1:0CAA  58                pop      ax
1:0CAB  90                nop      
1:0CAC  45                inc      bp
1:0CAD  55                push     bp
1:0CAE  8bec              mov      bp, sp
1:0CB0  1e                push     ds
1:0CB1  8ed8              mov      ds, ax
1:0CB3  ff366c04          push     word ptr [0x46c]
1:0CB7  ff368804          push     word ptr [0x488]
1:0CBB  ff368a04          push     word ptr [0x48a]
1:0CBF  9affff0000        lcall    0, 0xffff  ; @1:GDI.MoveTo
1:0CC4  a1a204            mov      ax, word ptr [0x4a2]
1:0CC7  eb78              jmp      0xd41
1:0CC9  ff366c04          push     word ptr [0x46c]
1:0CCD  8b5e06            mov      bx, word ptr [bp + 6]
1:0CD0  8a875800          mov      al, byte ptr [bx + 0x58]
1:0CD4  2ae4              sub      ah, ah
1:0CD6  03068804          add      ax, word ptr [0x488]
1:0CDA  50                push     ax
1:0CDB  8a876700          mov      al, byte ptr [bx + 0x67]
1:0CDF  2ae4              sub      ah, ah
1:0CE1  2b068a04          sub      ax, word ptr [0x48a]
1:0CE5  f7d8              neg      ax
1:0CE7  50                push     ax
1:0CE8  9affff0000        lcall    0, 0xffff  ; @1:GDI.LineTo
1:0CED  eb5f              jmp      0xd4e
1:0CEF  ff366c04          push     word ptr [0x46c]
1:0CF3  8b5e06            mov      bx, word ptr [bp + 6]
1:0CF6  8a876700          mov      al, byte ptr [bx + 0x67]
1:0CFA  2ae4              sub      ah, ah
1:0CFC  03068804          add      ax, word ptr [0x488]
1:0D00  50                push     ax
1:0D01  8a875800          mov      al, byte ptr [bx + 0x58]
1:0D05  2ae4              sub      ah, ah
1:0D07  03068a04          add      ax, word ptr [0x48a]
1:0D0B  ebda              jmp      0xce7
1:0D0D  ff366c04          push     word ptr [0x46c]
1:0D11  8b5e06            mov      bx, word ptr [bp + 6]
1:0D14  8a875800          mov      al, byte ptr [bx + 0x58]
1:0D18  2ae4              sub      ah, ah
1:0D1A  2b068804          sub      ax, word ptr [0x488]
1:0D1E  f7d8              neg      ax
1:0D20  50                push     ax
1:0D21  8a876700          mov      al, byte ptr [bx + 0x67]
1:0D25  ebde              jmp      0xd05
1:0D27  ff366c04          push     word ptr [0x46c]
1:0D2B  8b5e06            mov      bx, word ptr [bp + 6]
1:0D2E  8a876700          mov      al, byte ptr [bx + 0x67]
1:0D32  2ae4              sub      ah, ah
1:0D34  2b068804          sub      ax, word ptr [0x488]
1:0D38  f7d8              neg      ax
1:0D3A  50                push     ax
1:0D3B  8a875800          mov      al, byte ptr [bx + 0x58]
1:0D3F  eb9e              jmp      0xcdf
1:0D41  0bc0              or       ax, ax
1:0D43  7484              je       0xcc9
1:0D45  48                dec      ax
1:0D46  74a7              je       0xcef
1:0D48  48                dec      ax
1:0D49  74c2              je       0xd0d
1:0D4B  48                dec      ax
1:0D4C  74d9              je       0xd27
1:0D4E  4d                dec      bp
1:0D4F  4d                dec      bp
1:0D50  8be5              mov      sp, bp
1:0D52  1f                pop      ds
1:0D53  5d                pop      bp
1:0D54  4d                dec      bp
1:0D55  cb                retf     
1:0D56  1e                push     ds
1:0D57  58                pop      ax
1:0D58  90                nop      
1:0D59  45                inc      bp
1:0D5A  55                push     bp
1:0D5B  8bec              mov      bp, sp
1:0D5D  1e                push     ds
1:0D5E  8ed8              mov      ds, ax
1:0D60  83ec06            sub      sp, 6
1:0D63  c41eb404          les      bx, ptr [0x4b4]
1:0D67  26837f0c00        cmp      word ptr es:[bx + 0xc], 0
1:0D6C  746f              je       0xddd
1:0D6E  a1aa04            mov      ax, word ptr [0x4aa]
1:0D71  3906ac04          cmp      word ptr [0x4ac], ax
1:0D75  7466              je       0xddd
1:0D77  833eac0400        cmp      word ptr [0x4ac], 0
1:0D7C  7521              jne      0xd9f
1:0D7E  833eb20400        cmp      word ptr [0x4b2], 0
1:0D83  751a              jne      0xd9f
1:0D85  c746fa0000        mov      word ptr [bp - 6], 0
1:0D8A  eb03              jmp      0xd8f
1:0D8C  ff46fa            inc      word ptr [bp - 6]
1:0D8F  837efa03          cmp      word ptr [bp - 6], 3
1:0D93  7d48              jge      0xddd
1:0D95  2bc0              sub      ax, ax
1:0D97  50                push     ax
1:0D98  9affff0000        lcall    0, 0xffff  ; @1:USER.MessageBeep
1:0D9D  ebed              jmp      0xd8c
1:0D9F  9affff0000        lcall    0, 0xffff  ; @1:SOUND.OpenSound
1:0DA4  b80100            mov      ax, 1
1:0DA7  50                push     ax
1:0DA8  b9e803            mov      cx, 0x3e8
1:0DAB  51                push     cx
1:0DAC  9affff0000        lcall    0, 0xffff  ; @1:SOUND.SetVoiceQueueSize
1:0DB1  b80100            mov      ax, 1
1:0DB4  50                push     ax
1:0DB5  b85000            mov      ax, 0x50
1:0DB8  50                push     ax
1:0DB9  b8e803            mov      ax, 0x3e8
1:0DBC  50                push     ax
1:0DBD  b80a00            mov      ax, 0xa
1:0DC0  50                push     ax
1:0DC1  9affff0000        lcall    0, 0xffff  ; @1:SOUND.SetVoiceNote
1:0DC6  9affff0000        lcall    0, 0xffff  ; @1:SOUND.StartSound
1:0DCB  2bc0              sub      ax, ax
1:0DCD  50                push     ax
1:0DCE  9affff0000        lcall    0, 0xffff  ; @1:SOUND.WaitSoundState
1:0DD3  9affff0000        lcall    0, 0xffff  ; @1:SOUND.StopSound
1:0DD8  9affff0000        lcall    0, 0xffff  ; @1:SOUND.CloseSound
1:0DDD  a1ac04            mov      ax, word ptr [0x4ac]
1:0DE0  a3aa04            mov      word ptr [0x4aa], ax
1:0DE3  4d                dec      bp
1:0DE4  4d                dec      bp
1:0DE5  8be5              mov      sp, bp
1:0DE7  1f                pop      ds
1:0DE8  5d                pop      bp
1:0DE9  4d                dec      bp
1:0DEA  cb                retf     
1:0DEB  001e5890          add      byte ptr [0x9058], bl
1:0DEF  45                inc      bp
1:0DF0  55                push     bp
1:0DF1  8bec              mov      bp, sp
1:0DF3  1e                push     ds
1:0DF4  8ed8              mov      ds, ax
1:0DF6  837e0a00          cmp      word ptr [bp + 0xa], 0
1:0DFA  7504              jne      0xe00
1:0DFC  2bc0              sub      ax, ax
1:0DFE  eb09              jmp      0xe09
1:0E00  8b460e            mov      ax, word ptr [bp + 0xe]
1:0E03  a3a804            mov      word ptr [0x4a8], ax
1:0E06  b80100            mov      ax, 1
1:0E09  4d                dec      bp
1:0E0A  4d                dec      bp
1:0E0B  8be5              mov      sp, bp
1:0E0D  1f                pop      ds
1:0E0E  5d                pop      bp
1:0E0F  4d                dec      bp
1:0E10  ca0a00            retf     0xa

; ===== EXPORT:WEP(#2) =====
1:0E13  1e                push     ds
1:0E14  58                pop      ax
1:0E15  90                nop      
1:0E16  45                inc      bp
1:0E17  55                push     bp
1:0E18  8bec              mov      bp, sp
1:0E1A  1e                push     ds
1:0E1B  8ed8              mov      ds, ax
1:0E1D  b80100            mov      ax, 1
1:0E20  4d                dec      bp
1:0E21  4d                dec      bp
1:0E22  8be5              mov      sp, bp
1:0E24  1f                pop      ds
1:0E25  5d                pop      bp
1:0E26  4d                dec      bp
1:0E27  ca0200            retf     2

; ===== EXPORT:MODULE(#1) =====
1:0E2A  1e                push     ds
1:0E2B  58                pop      ax
1:0E2C  90                nop      
1:0E2D  45                inc      bp
1:0E2E  55                push     bp
1:0E2F  8bec              mov      bp, sp
1:0E31  1e                push     ds
1:0E32  8ed8              mov      ds, ax
1:0E34  83ec0a            sub      sp, 0xa
1:0E37  56                push     si
1:0E38  8b4608            mov      ax, word ptr [bp + 8]
1:0E3B  a36e04            mov      word ptr [0x46e], ax
1:0E3E  8b4606            mov      ax, word ptr [bp + 6]
1:0E41  a36004            mov      word ptr [0x460], ax
1:0E44  50                push     ax
1:0E45  9a650e0000        lcall    0, 0xe65  ; @1:KERNEL.GlobalLock
1:0E4A  a37e04            mov      word ptr [0x47e], ax
1:0E4D  89168004          mov      word ptr [0x480], dx
1:0E51  8bc2              mov      ax, dx
1:0E53  0b067e04          or       ax, word ptr [0x47e]
1:0E57  7503              jne      0xe5c
1:0E59  e96a01            jmp      0xfc6
1:0E5C  c41e7e04          les      bx, ptr [0x47e]
1:0E60  26ff7720          push     word ptr es:[bx + 0x20]
1:0E64  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalLock
1:0E69  a3b404            mov      word ptr [0x4b4], ax
1:0E6C  8916b604          mov      word ptr [0x4b6], dx
1:0E70  8bc2              mov      ax, dx
1:0E72  0b06b404          or       ax, word ptr [0x4b4]
1:0E76  7503              jne      0xe7b
1:0E78  e94201            jmp      0xfbd
1:0E7B  8b460a            mov      ax, word ptr [bp + 0xa]
1:0E7E  e90801            jmp      0xf89
1:0E81  c41e7e04          les      bx, ptr [0x47e]
1:0E85  26837f1465        cmp      word ptr es:[bx + 0x14], 0x65
1:0E8A  7c0f              jl       0xe9b
1:0E8C  26817f36f400      cmp      word ptr es:[bx + 0x36], 0xf4
1:0E92  7507              jne      0xe9b
1:0E94  26837f3878        cmp      word ptr es:[bx + 0x38], 0x78
1:0E99  740e              je       0xea9
1:0E9B  c706ce000000      mov      word ptr [0xce], 0
1:0EA1  c746fc0500        mov      word ptr [bp - 4], 5
1:0EA6  e90701            jmp      0xfb0
1:0EA9  c706ce000100      mov      word ptr [0xce], 1
1:0EAF  e9fe00            jmp      0xfb0
1:0EB2  b81e04            mov      ax, 0x41e
1:0EB5  50                push     ax
1:0EB6  9aa6090000        lcall    0, 0x9a6  ; @1:INT:ord_5(1:1080)
1:0EBB  5b                pop      bx
1:0EBC  ff361e04          push     word ptr [0x41e]
1:0EC0  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_14(1:10E2)
1:0EC5  5b                pop      bx
1:0EC6  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_13(1:0012)
1:0ECB  eb13              jmp      0xee0
1:0ECD  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:025E)
1:0ED2  eb0c              jmp      0xee0
1:0ED4  833ece0000        cmp      word ptr [0xce], 0
1:0ED9  740b              je       0xee6
1:0EDB  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:02A4)
1:0EE0  8946fc            mov      word ptr [bp - 4], ax
1:0EE3  e9ca00            jmp      0xfb0
1:0EE6  ff366e04          push     word ptr [0x46e]
1:0EEA  b800ff            mov      ax, 0xff00
1:0EED  baff00            mov      dx, 0xff
1:0EF0  52                push     dx
1:0EF1  50                push     ax
1:0EF2  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextColor
1:0EF7  ff366e04          push     word ptr [0x46e]
1:0EFB  2bc0              sub      ax, ax
1:0EFD  50                push     ax
1:0EFE  50                push     ax
1:0EFF  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkColor
1:0F04  ff366e04          push     word ptr [0x46e]
1:0F08  2bc0              sub      ax, ax
1:0F0A  50                push     ax
1:0F0B  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextAlign
1:0F10  ff366e04          push     word ptr [0x46e]
1:0F14  b80100            mov      ax, 1
1:0F17  50                push     ax
1:0F18  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkMode
1:0F1D  ff366e04          push     word ptr [0x46e]
1:0F21  2bc0              sub      ax, ax
1:0F23  50                push     ax
1:0F24  50                push     ax
1:0F25  b8d000            mov      ax, 0xd0
1:0F28  1e                push     ds
1:0F29  50                push     ax
1:0F2A  50                push     ax
1:0F2B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:1064)
1:0F30  5b                pop      bx
1:0F31  50                push     ax
1:0F32  9affff0000        lcall    0, 0xffff  ; @1:GDI.TextOut
1:0F37  eb77              jmp      0xfb0
1:0F39  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:02CD)
1:0F3E  eba0              jmp      0xee0
1:0F40  a1a804            mov      ax, word ptr [0x4a8]
1:0F43  c41eb404          les      bx, ptr [0x4b4]
1:0F47  26894716          mov      word ptr es:[bx + 0x16], ax
1:0F4B  c746f60000        mov      word ptr [bp - 0xa], 0
1:0F50  8b46f6            mov      ax, word ptr [bp - 0xa]
1:0F53  8bf0              mov      si, ax
1:0F55  d1e6              shl      si, 1
1:0F57  40                inc      ax
1:0F58  c41eb404          les      bx, ptr [0x4b4]
1:0F5C  2689400e          mov      word ptr es:[bx + si + 0xe], ax
1:0F60  ff46f6            inc      word ptr [bp - 0xa]
1:0F63  837ef604          cmp      word ptr [bp - 0xa], 4
1:0F67  7ce7              jl       0xf50
1:0F69  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:0382)
1:0F6E  e96fff            jmp      0xee0
1:0F71  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:0396)
1:0F76  e967ff            jmp      0xee0
1:0F79  8b460a            mov      ax, word ptr [bp + 0xa]
1:0F7C  2d0700            sub      ax, 7
1:0F7F  50                push     ax
1:0F80  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_6(1:03AA)
1:0F85  5b                pop      bx
1:0F86  e957ff            jmp      0xee0
1:0F89  3d0c00            cmp      ax, 0xc
1:0F8C  7722              ja       0xfb0
1:0F8E  d1e0              shl      ax, 1
1:0F90  93                xchg     bx, ax
1:0F91  2effa7960f        jmp      word ptr cs:[bx + 0xf96]
1:0F96  b20e              mov      dl, 0xe
1:0F98  cd0e              int      0xe
1:0F9A  d40e              aam      0xe
1:0F9C  390f              cmp      word ptr [bx], cx
1:0F9E  b00f              mov      al, 0xf
1:0FA0  40                inc      ax