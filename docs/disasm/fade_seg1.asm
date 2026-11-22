File: raw\unpacked\MODULES\FADE.AD
Module: 'FADE' ('Graphics Module Library')
CS:IP=1:1084  SS:SP=0:0000  AutoDS=2  Heap=1024  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (3): KERNEL, GDI, USER
Segments (2):
  SEG  1: CODE off=0x00600 len=0x10B6 min=0x10B6 flags=0x0D50 relocs=87
  SEG  2: DATA off=0x01860 len=0x03AE min=0x03AE flags=0x0C71 relocs=0
Exports (28):
  ord   1: SEG1:06E0 flags=0x03 MODULE
  ord   2: SEG1:06C9 flags=0x03 WEP
  ord   3: SEG1:1070 flags=0x03 ___EXPORTEDSTUB
  ord   4: SEG1:0934 flags=0x00 
  ord   5: SEG1:014A flags=0x00 
  ord   6: SEG1:0136 flags=0x00 
  ord   7: SEG1:0122 flags=0x00 
  ord   8: SEG1:010E flags=0x00 
  ord   9: SEG1:08A2 flags=0x00 
  ord  10: SEG1:00A0 flags=0x00 
  ord  11: SEG1:008C flags=0x00 
  ord  12: SEG1:0012 flags=0x00 
  ord  13: SEG1:0920 flags=0x00 
  ord  14: SEG1:08BE flags=0x00 
  ord  15: SEG1:06A2 flags=0x00 
  ord  16: SEG1:0964 flags=0x00 
  ord  17: SEG1:0A68 flags=0x00 
  ord  18: SEG1:0BDA flags=0x00 
  ord  19: SEG1:0A9A flags=0x00 
  ord  20: SEG1:0D0C flags=0x00 
  ord  21: SEG1:0D34 flags=0x00 
  ord  22: SEG1:0DD6 flags=0x00 
  ord  23: SEG1:0D9A flags=0x00 
  ord  24: SEG1:0E00 flags=0x00 
  ord  25: SEG1:0D38 flags=0x00 
  ord  26: SEG1:0AB4 flags=0x00 
  ord  27: SEG1:0FA4 flags=0x00 
  ord  28: SEG1:1060 flags=0x00 
Resources (7):
  TYPE_1000        #1               off=0x01C40 len=   144
  TYPE_1000        #2               off=0x01CD0 len=   128
  TYPE_1000        #3               off=0x01D50 len=    32
  TYPE_1000        #4               off=0x01D70 len=    32
  TYPE_2000        #10              off=0x01D90 len=    80
  TYPE_2000        #20              off=0x01DE0 len=    16
  TYPE_2000        #30              off=0x01DF0 len=   480

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

; ===== EXPORT:ord_12(#12) =====
1:0012  1e                push     ds
1:0013  58                pop      ax
1:0014  90                nop      
1:0015  45                inc      bp
1:0016  55                push     bp
1:0017  8bec              mov      bp, sp
1:0019  1e                push     ds
1:001A  8ed8              mov      ds, ax
1:001C  2bc0              sub      ax, ax
1:001E  a31000            mov      word ptr [0x10], ax
1:0021  a31200            mov      word ptr [0x12], ax
1:0024  a3ac03            mov      word ptr [0x3ac], ax
1:0027  c41ea403          les      bx, ptr [0x3a4]
1:002B  268b4702          mov      ax, word ptr es:[bx + 2]
1:002F  99                cdq      
1:0030  2bc2              sub      ax, dx
1:0032  d1f8              sar      ax, 1
1:0034  a31400            mov      word ptr [0x14], ax
1:0037  c70616000000      mov      word ptr [0x16], 0
1:003D  268b4702          mov      ax, word ptr es:[bx + 2]
1:0041  99                cdq      
1:0042  2bc2              sub      ax, dx
1:0044  d1f8              sar      ax, 1
1:0046  a39a03            mov      word ptr [0x39a], ax
1:0049  2bc0              sub      ax, ax
1:004B  a39c03            mov      word ptr [0x39c], ax
1:004E  a3a203            mov      word ptr [0x3a2], ax
1:0051  c70694030200      mov      word ptr [0x394], 2
1:0057  268b4706          mov      ax, word ptr es:[bx + 6]
1:005B  a39e03            mov      word ptr [0x39e], ax
1:005E  268b4702          mov      ax, word ptr es:[bx + 2]
1:0062  a3aa03            mov      word ptr [0x3aa], ax
1:0065  26394704          cmp      word ptr es:[bx + 4], ax
1:0069  7e07              jle      0x72
1:006B  268b4704          mov      ax, word ptr es:[bx + 4]
1:006F  a3aa03            mov      word ptr [0x3aa], ax
1:0072  a3a803            mov      word ptr [0x3a8], ax
1:0075  833e9e0302        cmp      word ptr [0x39e], 2
1:007A  7506              jne      0x82
1:007C  05c800            add      ax, 0xc8
1:007F  a3a803            mov      word ptr [0x3a8], ax
1:0082  2bc0              sub      ax, ax
1:0084  4d                dec      bp
1:0085  4d                dec      bp
1:0086  8be5              mov      sp, bp
1:0088  1f                pop      ds
1:0089  5d                pop      bp
1:008A  4d                dec      bp
1:008B  cb                retf     

; ===== EXPORT:ord_11(#11) =====
1:008C  1e                push     ds
1:008D  58                pop      ax
1:008E  90                nop      
1:008F  45                inc      bp
1:0090  55                push     bp
1:0091  8bec              mov      bp, sp
1:0093  1e                push     ds
1:0094  8ed8              mov      ds, ax
1:0096  2bc0              sub      ax, ax
1:0098  4d                dec      bp
1:0099  4d                dec      bp
1:009A  8be5              mov      sp, bp
1:009C  1f                pop      ds
1:009D  5d                pop      bp
1:009E  4d                dec      bp
1:009F  cb                retf     

; ===== EXPORT:ord_10(#10) =====
1:00A0  1e                push     ds
1:00A1  58                pop      ax
1:00A2  90                nop      
1:00A3  45                inc      bp
1:00A4  55                push     bp
1:00A5  8bec              mov      bp, sp
1:00A7  1e                push     ds
1:00A8  8ed8              mov      ds, ax
1:00AA  833e100000        cmp      word ptr [0x10], 0
1:00AF  7404              je       0xb5
1:00B1  2bc0              sub      ax, ax
1:00B3  eb51              jmp      0x106
1:00B5  833e120000        cmp      word ptr [0x12], 0
1:00BA  7406              je       0xc2
1:00BC  0e                push     cs
1:00BD  e8b002            call     0x370
1:00C0  eb44              jmp      0x106
1:00C2  a19e03            mov      ax, word ptr [0x39e]
1:00C5  eb24              jmp      0xeb
1:00C7  0e                push     cs
1:00C8  e89300            call     0x15e
1:00CB  eb39              jmp      0x106
1:00CD  0e                push     cs
1:00CE  e8d900            call     0x1aa
1:00D1  eb33              jmp      0x106
1:00D3  0e                push     cs
1:00D4  e82c03            call     0x403
1:00D7  eb2d              jmp      0x106
1:00D9  0e                push     cs
1:00DA  e88501            call     0x262
1:00DD  eb27              jmp      0x106
1:00DF  0e                push     cs
1:00E0  e8b103            call     0x494
1:00E3  eb21              jmp      0x106
1:00E5  0e                push     cs
1:00E6  e85405            call     0x63d
1:00E9  eb1b              jmp      0x106
1:00EB  3d0600            cmp      ax, 6
1:00EE  77c1              ja       0xb1
1:00F0  d1e0              shl      ax, 1
1:00F2  93                xchg     bx, ax
1:00F3  2effa7f800        jmp      word ptr cs:[bx + 0xf8]
1:00F8  c700bc00          mov      word ptr [bx + si], 0xbc
1:00FC  d300              rol      word ptr [bx + si], cl
1:00FE  cd00              int      0
1:0100  d900              fld      dword ptr [bx + si]
1:0102  df00              fild     word ptr [bx + si]
1:0104  e500              in       ax, 0
1:0106  4d                dec      bp
1:0107  4d                dec      bp
1:0108  8be5              mov      sp, bp
1:010A  1f                pop      ds
1:010B  5d                pop      bp
1:010C  4d                dec      bp
1:010D  cb                retf     

; ===== EXPORT:ord_8(#8) =====
1:010E  1e                push     ds
1:010F  58                pop      ax
1:0110  90                nop      
1:0111  45                inc      bp
1:0112  55                push     bp
1:0113  8bec              mov      bp, sp
1:0115  1e                push     ds
1:0116  8ed8              mov      ds, ax
1:0118  2bc0              sub      ax, ax
1:011A  4d                dec      bp
1:011B  4d                dec      bp
1:011C  8be5              mov      sp, bp
1:011E  1f                pop      ds
1:011F  5d                pop      bp
1:0120  4d                dec      bp
1:0121  cb                retf     

; ===== EXPORT:ord_7(#7) =====
1:0122  1e                push     ds
1:0123  58                pop      ax
1:0124  90                nop      
1:0125  45                inc      bp
1:0126  55                push     bp
1:0127  8bec              mov      bp, sp
1:0129  1e                push     ds
1:012A  8ed8              mov      ds, ax
1:012C  2bc0              sub      ax, ax
1:012E  4d                dec      bp
1:012F  4d                dec      bp
1:0130  8be5              mov      sp, bp
1:0132  1f                pop      ds
1:0133  5d                pop      bp
1:0134  4d                dec      bp
1:0135  cb                retf     

; ===== EXPORT:ord_6(#6) =====
1:0136  1e                push     ds
1:0137  58                pop      ax
1:0138  90                nop      
1:0139  45                inc      bp
1:013A  55                push     bp
1:013B  8bec              mov      bp, sp
1:013D  1e                push     ds
1:013E  8ed8              mov      ds, ax
1:0140  2bc0              sub      ax, ax
1:0142  4d                dec      bp
1:0143  4d                dec      bp
1:0144  8be5              mov      sp, bp
1:0146  1f                pop      ds
1:0147  5d                pop      bp
1:0148  4d                dec      bp
1:0149  cb                retf     

; ===== EXPORT:ord_5(#5) =====
1:014A  1e                push     ds
1:014B  58                pop      ax
1:014C  90                nop      
1:014D  45                inc      bp
1:014E  55                push     bp
1:014F  8bec              mov      bp, sp
1:0151  1e                push     ds
1:0152  8ed8              mov      ds, ax
1:0154  2bc0              sub      ax, ax
1:0156  4d                dec      bp
1:0157  4d                dec      bp
1:0158  8be5              mov      sp, bp
1:015A  1f                pop      ds
1:015B  5d                pop      bp
1:015C  4d                dec      bp
1:015D  cb                retf     
1:015E  1e                push     ds
1:015F  58                pop      ax
1:0160  90                nop      
1:0161  45                inc      bp
1:0162  55                push     bp
1:0163  8bec              mov      bp, sp
1:0165  1e                push     ds
1:0166  8ed8              mov      ds, ax
1:0168  b83a03            mov      ax, 0x33a
1:016B  1e                push     ds
1:016C  50                push     ax
1:016D  2bc0              sub      ax, ax
1:016F  50                push     ax
1:0170  50                push     ax
1:0171  c41ea403          les      bx, ptr [0x3a4]
1:0175  26ff7702          push     word ptr es:[bx + 2]
1:0179  26ff7704          push     word ptr es:[bx + 4]
1:017D  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:0182  ff369203          push     word ptr [0x392]
1:0186  b83a03            mov      ax, 0x33a
1:0189  1e                push     ds
1:018A  50                push     ax
1:018B  b80400            mov      ax, 4
1:018E  50                push     ax
1:018F  9a75020000        lcall    0, 0x275  ; @1:GDI.GetStockObject
1:0194  50                push     ax
1:0195  9affff0000        lcall    0, 0xffff  ; @1:USER.FillRect
1:019A  c70610000100      mov      word ptr [0x10], 1
1:01A0  2bc0              sub      ax, ax
1:01A2  4d                dec      bp
1:01A3  4d                dec      bp
1:01A4  8be5              mov      sp, bp
1:01A6  1f                pop      ds
1:01A7  5d                pop      bp
1:01A8  4d                dec      bp
1:01A9  cb                retf     
1:01AA  1e                push     ds
1:01AB  58                pop      ax
1:01AC  90                nop      
1:01AD  45                inc      bp
1:01AE  55                push     bp
1:01AF  8bec              mov      bp, sp
1:01B1  1e                push     ds
1:01B2  8ed8              mov      ds, ax
1:01B4  a1ac03            mov      ax, word ptr [0x3ac]
1:01B7  a34203            mov      word ptr [0x342], ax
1:01BA  c70644030000      mov      word ptr [0x344], 0
1:01C0  eb6b              jmp      0x22d
1:01C2  ff369203          push     word ptr [0x392]
1:01C6  2bc0              sub      ax, ax
1:01C8  50                push     ax
1:01C9  ba0100            mov      dx, 1
1:01CC  52                push     dx
1:01CD  2bd2              sub      dx, dx
1:01CF  52                push     dx
1:01D0  52                push     dx
1:01D1  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreatePen
1:01D6  50                push     ax
1:01D7  9a1f020000        lcall    0, 0x21f  ; @1:GDI.SelectObject
1:01DC  a34603            mov      word ptr [0x346], ax
1:01DF  ff369203          push     word ptr [0x392]
1:01E3  2bc0              sub      ax, ax
1:01E5  50                push     ax
1:01E6  ff364203          push     word ptr [0x342]
1:01EA  9a9c020000        lcall    0, 0x29c  ; @1:GDI.MoveTo
1:01EF  ff369203          push     word ptr [0x392]
1:01F3  c41ea403          les      bx, ptr [0x3a4]
1:01F7  26ff7702          push     word ptr es:[bx + 2]
1:01FB  ff364203          push     word ptr [0x342]
1:01FF  9aad020000        lcall    0, 0x2ad  ; @1:GDI.LineTo
1:0204  c41ea403          les      bx, ptr [0x3a4]
1:0208  268b4704          mov      ax, word ptr es:[bx + 4]
1:020C  b91400            mov      cx, 0x14
1:020F  99                cdq      
1:0210  f7f9              idiv     cx
1:0212  01064203          add      word ptr [0x342], ax
1:0216  ff369203          push     word ptr [0x392]
1:021A  ff364603          push     word ptr [0x346]
1:021E  9a7b020000        lcall    0, 0x27b  ; @1:GDI.SelectObject
1:0223  50                push     ax
1:0224  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteObject
1:0229  ff064403          inc      word ptr [0x344]
1:022D  c41ea403          les      bx, ptr [0x3a4]
1:0231  268b4704          mov      ax, word ptr es:[bx + 4]
1:0235  b91400            mov      cx, 0x14
1:0238  99                cdq      
1:0239  f7f9              idiv     cx
1:023B  3b064403          cmp      ax, word ptr [0x344]
1:023F  7d81              jge      0x1c2
1:0241  ff06ac03          inc      word ptr [0x3ac]
1:0245  268b4704          mov      ax, word ptr es:[bx + 4]
1:0249  99                cdq      
1:024A  f7f9              idiv     cx
1:024C  3b06ac03          cmp      ax, word ptr [0x3ac]
1:0250  7f06              jg       0x258
1:0252  c70610000100      mov      word ptr [0x10], 1
1:0258  2bc0              sub      ax, ax
1:025A  4d                dec      bp
1:025B  4d                dec      bp
1:025C  8be5              mov      sp, bp
1:025E  1f                pop      ds
1:025F  5d                pop      bp
1:0260  4d                dec      bp
1:0261  cb                retf     
1:0262  1e                push     ds
1:0263  58                pop      ax
1:0264  90                nop      
1:0265  45                inc      bp
1:0266  55                push     bp
1:0267  8bec              mov      bp, sp
1:0269  1e                push     ds
1:026A  8ed8              mov      ds, ax
1:026C  ff369203          push     word ptr [0x392]
1:0270  b80700            mov      ax, 7
1:0273  50                push     ax
1:0274  9a83030000        lcall    0, 0x383  ; @1:GDI.GetStockObject
1:0279  50                push     ax
1:027A  9a89030000        lcall    0, 0x389  ; @1:GDI.SelectObject
1:027F  ff369203          push     word ptr [0x392]
1:0283  c41ea403          les      bx, ptr [0x3a4]
1:0287  268b4702          mov      ax, word ptr es:[bx + 2]
1:028B  99                cdq      
1:028C  2bc2              sub      ax, dx
1:028E  d1f8              sar      ax, 1
1:0290  50                push     ax
1:0291  268b4704          mov      ax, word ptr es:[bx + 4]
1:0295  99                cdq      
1:0296  2bc2              sub      ax, dx
1:0298  d1f8              sar      ax, 1
1:029A  50                push     ax
1:029B  9affff0000        lcall    0, 0xffff  ; @1:GDI.MoveTo
1:02A0  ff369203          push     word ptr [0x392]
1:02A4  ff369a03          push     word ptr [0x39a]
1:02A8  ff369c03          push     word ptr [0x39c]
1:02AC  9affff0000        lcall    0, 0xffff  ; @1:GDI.LineTo
1:02B1  a1a203            mov      ax, word ptr [0x3a2]
1:02B4  e99900            jmp      0x350
1:02B7  a19403            mov      ax, word ptr [0x394]
1:02BA  01069a03          add      word ptr [0x39a], ax
1:02BE  a19a03            mov      ax, word ptr [0x39a]
1:02C1  c41ea403          les      bx, ptr [0x3a4]
1:02C5  26394702          cmp      word ptr es:[bx + 2], ax
1:02C9  7c03              jl       0x2ce
1:02CB  e99800            jmp      0x366
1:02CE  c706a2030100      mov      word ptr [0x3a2], 1
1:02D4  e98f00            jmp      0x366
1:02D7  a19403            mov      ax, word ptr [0x394]
1:02DA  01069c03          add      word ptr [0x39c], ax
1:02DE  a19c03            mov      ax, word ptr [0x39c]
1:02E1  c41ea403          les      bx, ptr [0x3a4]
1:02E5  26394704          cmp      word ptr es:[bx + 4], ax
1:02E9  7d7b              jge      0x366
1:02EB  c706a2030200      mov      word ptr [0x3a2], 2
1:02F1  eb73              jmp      0x366
1:02F3  a19403            mov      ax, word ptr [0x394]
1:02F6  29069a03          sub      word ptr [0x39a], ax
1:02FA  796a              jns      0x366
1:02FC  c706a2030300      mov      word ptr [0x3a2], 3
1:0302  eb62              jmp      0x366
1:0304  a19403            mov      ax, word ptr [0x394]
1:0307  29069c03          sub      word ptr [0x39c], ax
1:030B  7959              jns      0x366
1:030D  c706a2030400      mov      word ptr [0x3a2], 4
1:0313  eb51              jmp      0x366
1:0315  a19403            mov      ax, word ptr [0x394]
1:0318  01069a03          add      word ptr [0x39a], ax
1:031C  c41ea403          les      bx, ptr [0x3a4]
1:0320  268b4702          mov      ax, word ptr es:[bx + 2]
1:0324  99                cdq      
1:0325  2bc2              sub      ax, dx
1:0327  d1f8              sar      ax, 1
1:0329  3b069a03          cmp      ax, word ptr [0x39a]
1:032D  7d37              jge      0x366
1:032F  c706a2030000      mov      word ptr [0x3a2], 0
1:0335  833e940301        cmp      word ptr [0x394], 1
1:033A  750c              jne      0x348
1:033C  c70610000100      mov      word ptr [0x10], 1
1:0342  0e                push     cs
1:0343  e818fe            call     0x15e
1:0346  eb1e              jmp      0x366
1:0348  c70694030100      mov      word ptr [0x394], 1
1:034E  eb16              jmp      0x366
1:0350  0bc0              or       ax, ax
1:0352  7503              jne      0x357
1:0354  e960ff            jmp      0x2b7
1:0357  48                dec      ax
1:0358  7503              jne      0x35d
1:035A  e97aff            jmp      0x2d7
1:035D  48                dec      ax
1:035E  7493              je       0x2f3
1:0360  48                dec      ax
1:0361  74a1              je       0x304
1:0363  48                dec      ax
1:0364  74af              je       0x315
1:0366  2bc0              sub      ax, ax
1:0368  4d                dec      bp
1:0369  4d                dec      bp
1:036A  8be5              mov      sp, bp
1:036C  1f                pop      ds
1:036D  5d                pop      bp
1:036E  4d                dec      bp
1:036F  cb                retf     
1:0370  1e                push     ds
1:0371  58                pop      ax
1:0372  90                nop      
1:0373  45                inc      bp
1:0374  55                push     bp
1:0375  8bec              mov      bp, sp
1:0377  1e                push     ds
1:0378  8ed8              mov      ds, ax
1:037A  ff369203          push     word ptr [0x392]
1:037E  b80700            mov      ax, 7
1:0381  50                push     ax
1:0382  9a96030000        lcall    0, 0x396  ; @1:GDI.GetStockObject
1:0387  50                push     ax
1:0388  9a9c030000        lcall    0, 0x39c  ; @1:GDI.SelectObject
1:038D  ff369203          push     word ptr [0x392]
1:0391  b80500            mov      ax, 5
1:0394  50                push     ax
1:0395  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:039A  50                push     ax
1:039B  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectObject
1:03A0  a34a03            mov      word ptr [0x34a], ax
1:03A3  ff369203          push     word ptr [0x392]
1:03A7  a1a803            mov      ax, word ptr [0x3a8]
1:03AA  99                cdq      
1:03AB  2bc2              sub      ax, dx
1:03AD  d1f8              sar      ax, 1
1:03AF  c41ea403          les      bx, ptr [0x3a4]
1:03B3  8bc8              mov      cx, ax
1:03B5  268b4702          mov      ax, word ptr es:[bx + 2]
1:03B9  99                cdq      
1:03BA  2bc2              sub      ax, dx
1:03BC  d1f8              sar      ax, 1
1:03BE  8bd0              mov      dx, ax
1:03C0  2bc1              sub      ax, cx
1:03C2  50                push     ax
1:03C3  268b4704          mov      ax, word ptr es:[bx + 4]
1:03C7  8bda              mov      bx, dx
1:03C9  99                cdq      
1:03CA  2bc2              sub      ax, dx
1:03CC  d1f8              sar      ax, 1
1:03CE  8bd0              mov      dx, ax
1:03D0  2bc1              sub      ax, cx
1:03D2  50                push     ax
1:03D3  8bc1              mov      ax, cx
1:03D5  03cb              add      cx, bx
1:03D7  51                push     cx
1:03D8  03c2              add      ax, dx
1:03DA  50                push     ax
1:03DB  9affff0000        lcall    0, 0xffff  ; @1:GDI.Rectangle
1:03E0  ff0ea803          dec      word ptr [0x3a8]
1:03E4  7506              jne      0x3ec
1:03E6  c70610000100      mov      word ptr [0x10], 1
1:03EC  ff369203          push     word ptr [0x392]
1:03F0  ff364a03          push     word ptr [0x34a]
1:03F4  9a1c040000        lcall    0, 0x41c  ; @1:GDI.SelectObject
1:03F9  2bc0              sub      ax, ax
1:03FB  4d                dec      bp
1:03FC  4d                dec      bp
1:03FD  8be5              mov      sp, bp
1:03FF  1f                pop      ds
1:0400  5d                pop      bp
1:0401  4d                dec      bp
1:0402  cb                retf     
1:0403  1e                push     ds
1:0404  58                pop      ax
1:0405  90                nop      
1:0406  45                inc      bp
1:0407  55                push     bp
1:0408  8bec              mov      bp, sp
1:040A  1e                push     ds
1:040B  8ed8              mov      ds, ax
1:040D  ff369203          push     word ptr [0x392]
1:0411  b80700            mov      ax, 7
1:0414  50                push     ax
1:0415  9a29040000        lcall    0, 0x429  ; @1:GDI.GetStockObject
1:041A  50                push     ax
1:041B  9a2f040000        lcall    0, 0x42f  ; @1:GDI.SelectObject
1:0420  ff369203          push     word ptr [0x392]
1:0424  b80500            mov      ax, 5
1:0427  50                push     ax
1:0428  9a90010000        lcall    0, 0x190  ; @1:GDI.GetStockObject
1:042D  50                push     ax
1:042E  9a86040000        lcall    0, 0x486  ; @1:GDI.SelectObject
1:0433  a34c03            mov      word ptr [0x34c], ax
1:0436  ff369203          push     word ptr [0x392]
1:043A  a1a803            mov      ax, word ptr [0x3a8]
1:043D  99                cdq      
1:043E  2bc2              sub      ax, dx
1:0440  d1f8              sar      ax, 1
1:0442  c41ea403          les      bx, ptr [0x3a4]
1:0446  8bc8              mov      cx, ax
1:0448  268b4702          mov      ax, word ptr es:[bx + 2]
1:044C  99                cdq      
1:044D  2bc2              sub      ax, dx
1:044F  d1f8              sar      ax, 1
1:0451  8bd0              mov      dx, ax
1:0453  2bc1              sub      ax, cx
1:0455  50                push     ax
1:0456  268b4704          mov      ax, word ptr es:[bx + 4]
1:045A  8bda              mov      bx, dx
1:045C  99                cdq      
1:045D  2bc2              sub      ax, dx
1:045F  d1f8              sar      ax, 1
1:0461  8bd0              mov      dx, ax
1:0463  2bc1              sub      ax, cx
1:0465  50                push     ax
1:0466  8bc1              mov      ax, cx
1:0468  03cb              add      cx, bx
1:046A  51                push     cx
1:046B  03c2              add      ax, dx
1:046D  50                push     ax
1:046E  9affff0000        lcall    0, 0xffff  ; @1:GDI.Ellipse
1:0473  ff0ea803          dec      word ptr [0x3a8]
1:0477  7504              jne      0x47d
1:0479  0e                push     cs
1:047A  e80602            call     0x683
1:047D  ff369203          push     word ptr [0x392]
1:0481  ff364c03          push     word ptr [0x34c]
1:0485  9ad9040000        lcall    0, 0x4d9  ; @1:GDI.SelectObject
1:048A  2bc0              sub      ax, ax
1:048C  4d                dec      bp
1:048D  4d                dec      bp
1:048E  8be5              mov      sp, bp
1:0490  1f                pop      ds
1:0491  5d                pop      bp
1:0492  4d                dec      bp
1:0493  cb                retf     
1:0494  1e                push     ds
1:0495  58                pop      ax
1:0496  90                nop      
1:0497  45                inc      bp
1:0498  55                push     bp
1:0499  8bec              mov      bp, sp
1:049B  1e                push     ds
1:049C  8ed8              mov      ds, ax
1:049E  833e100000        cmp      word ptr [0x10], 0
1:04A3  7405              je       0x4aa
1:04A5  2bc0              sub      ax, ax
1:04A7  e98b01            jmp      0x635
1:04AA  a11600            mov      ax, word ptr [0x16]
1:04AD  0bc0              or       ax, ax
1:04AF  740e              je       0x4bf
1:04B1  48                dec      ax
1:04B2  7503              jne      0x4b7
1:04B4  e95901            jmp      0x610
1:04B7  48                dec      ax
1:04B8  7503              jne      0x4bd
1:04BA  e96701            jmp      0x624
1:04BD  eb21              jmp      0x4e0
1:04BF  ff369203          push     word ptr [0x392]
1:04C3  2bc0              sub      ax, ax
1:04C5  50                push     ax
1:04C6  b80100            mov      ax, 1
1:04C9  50                push     ax
1:04CA  b8c0c0            mov      ax, 0xc0c0
1:04CD  bac000            mov      dx, 0xc0
1:04D0  52                push     dx
1:04D1  50                push     ax
1:04D2  9ad2010000        lcall    0, 0x1d2  ; @1:GDI.CreatePen
1:04D7  50                push     ax
1:04D8  9a03060000        lcall    0, 0x603  ; @1:GDI.SelectObject
1:04DD  a34e03            mov      word ptr [0x34e], ax
1:04E0  ff369203          push     word ptr [0x392]
1:04E4  2bc0              sub      ax, ax
1:04E6  50                push     ax
1:04E7  c41ea403          les      bx, ptr [0x3a4]
1:04EB  268b4704          mov      ax, word ptr es:[bx + 4]
1:04EF  99                cdq      
1:04F0  2bc2              sub      ax, dx
1:04F2  d1f8              sar      ax, 1
1:04F4  2b061400          sub      ax, word ptr [0x14]
1:04F8  50                push     ax
1:04F9  9a37050000        lcall    0, 0x537  ; @1:GDI.MoveTo
1:04FE  ff369203          push     word ptr [0x392]
1:0502  c41ea403          les      bx, ptr [0x3a4]
1:0506  26ff7702          push     word ptr es:[bx + 2]
1:050A  268b4704          mov      ax, word ptr es:[bx + 4]
1:050E  99                cdq      
1:050F  2bc2              sub      ax, dx
1:0511  d1f8              sar      ax, 1
1:0513  2b061400          sub      ax, word ptr [0x14]
1:0517  50                push     ax
1:0518  9a56050000        lcall    0, 0x556  ; @1:GDI.LineTo
1:051D  ff369203          push     word ptr [0x392]
1:0521  2bc0              sub      ax, ax
1:0523  50                push     ax
1:0524  c41ea403          les      bx, ptr [0x3a4]
1:0528  268b4704          mov      ax, word ptr es:[bx + 4]
1:052C  99                cdq      
1:052D  2bc2              sub      ax, dx
1:052F  d1f8              sar      ax, 1
1:0531  03061400          add      ax, word ptr [0x14]
1:0535  50                push     ax
1:0536  9a74050000        lcall    0, 0x574  ; @1:GDI.MoveTo
1:053B  ff369203          push     word ptr [0x392]
1:053F  c41ea403          les      bx, ptr [0x3a4]
1:0543  26ff7702          push     word ptr es:[bx + 2]
1:0547  268b4704          mov      ax, word ptr es:[bx + 4]
1:054B  99                cdq      
1:054C  2bc2              sub      ax, dx
1:054E  d1f8              sar      ax, 1
1:0550  03061400          add      ax, word ptr [0x14]
1:0554  50                push     ax
1:0555  9a93050000        lcall    0, 0x593  ; @1:GDI.LineTo
1:055A  ff369203          push     word ptr [0x392]
1:055E  c41ea403          les      bx, ptr [0x3a4]
1:0562  268b4702          mov      ax, word ptr es:[bx + 2]
1:0566  99                cdq      
1:0567  2bc2              sub      ax, dx
1:0569  d1f8              sar      ax, 1
1:056B  2b061400          sub      ax, word ptr [0x14]
1:056F  50                push     ax
1:0570  2bc0              sub      ax, ax
1:0572  50                push     ax
1:0573  9ab1050000        lcall    0, 0x5b1  ; @1:GDI.MoveTo
1:0578  ff369203          push     word ptr [0x392]
1:057C  c41ea403          les      bx, ptr [0x3a4]
1:0580  268b4702          mov      ax, word ptr es:[bx + 2]
1:0584  99                cdq      
1:0585  2bc2              sub      ax, dx
1:0587  d1f8              sar      ax, 1
1:0589  2b061400          sub      ax, word ptr [0x14]
1:058D  50                push     ax
1:058E  26ff7704          push     word ptr es:[bx + 4]
1:0592  9ad0050000        lcall    0, 0x5d0  ; @1:GDI.LineTo
1:0597  ff369203          push     word ptr [0x392]
1:059B  c41ea403          les      bx, ptr [0x3a4]
1:059F  268b4702          mov      ax, word ptr es:[bx + 2]
1:05A3  99                cdq      
1:05A4  2bc2              sub      ax, dx
1:05A6  d1f8              sar      ax, 1
1:05A8  03061400          add      ax, word ptr [0x14]
1:05AC  50                push     ax
1:05AD  2bc0              sub      ax, ax
1:05AF  50                push     ax
1:05B0  9aeb010000        lcall    0, 0x1eb  ; @1:GDI.MoveTo
1:05B5  ff369203          push     word ptr [0x392]
1:05B9  c41ea403          les      bx, ptr [0x3a4]
1:05BD  268b4702          mov      ax, word ptr es:[bx + 2]
1:05C1  99                cdq      
1:05C2  2bc2              sub      ax, dx
1:05C4  d1f8              sar      ax, 1
1:05C6  03061400          add      ax, word ptr [0x14]
1:05CA  50                push     ax
1:05CB  26ff7704          push     word ptr es:[bx + 4]
1:05CF  9a00020000        lcall    0, 0x200  ; @1:GDI.LineTo
1:05D4  832e140002        sub      word ptr [0x14], 2
1:05D9  791f              jns      0x5fa
1:05DB  c41ea403          les      bx, ptr [0x3a4]
1:05DF  268b4702          mov      ax, word ptr es:[bx + 2]
1:05E3  99                cdq      
1:05E4  2bc2              sub      ax, dx
1:05E6  d1f8              sar      ax, 1
1:05E8  a31400            mov      word ptr [0x14], ax
1:05EB  ff061600          inc      word ptr [0x16]
1:05EF  833e160002        cmp      word ptr [0x16], 2
1:05F4  7e04              jle      0x5fa
1:05F6  0e                push     cs
1:05F7  e88900            call     0x683
1:05FA  ff369203          push     word ptr [0x392]
1:05FE  ff364e03          push     word ptr [0x34e]
1:0602  9ad8010000        lcall    0, 0x1d8  ; @1:GDI.SelectObject
1:0607  50                push     ax
1:0608  9a25020000        lcall    0, 0x225  ; @1:GDI.DeleteObject
1:060D  e995fe            jmp      0x4a5
1:0610  ff369203          push     word ptr [0x392]
1:0614  2bc0              sub      ax, ax
1:0616  50                push     ax
1:0617  b80100            mov      ax, 1
1:061A  50                push     ax
1:061B  b88080            mov      ax, 0x8080
1:061E  ba8000            mov      dx, 0x80
1:0621  e9acfe            jmp      0x4d0
1:0624  ff369203          push     word ptr [0x392]
1:0628  2bc0              sub      ax, ax
1:062A  50                push     ax
1:062B  b80100            mov      ax, 1
1:062E  50                push     ax
1:062F  2bc0              sub      ax, ax
1:0631  50                push     ax
1:0632  e99cfe            jmp      0x4d1
1:0635  4d                dec      bp
1:0636  4d                dec      bp
1:0637  8be5              mov      sp, bp
1:0639  1f                pop      ds
1:063A  5d                pop      bp
1:063B  4d                dec      bp
1:063C  cb                retf     
1:063D  1e                push     ds
1:063E  58                pop      ax
1:063F  90                nop      
1:0640  45                inc      bp
1:0641  55                push     bp
1:0642  8bec              mov      bp, sp
1:0644  1e                push     ds
1:0645  8ed8              mov      ds, ax
1:0647  ff369203          push     word ptr [0x392]
1:064B  9a5b060000        lcall    0, 0x65b  ; @1:INT:ord_4(1:0934)
1:0650  c41ea403          les      bx, ptr [0x3a4]
1:0654  99                cdq      
1:0655  26f77f02          idiv     word ptr es:[bx + 2]
1:0659  52                push     dx
1:065A  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_4(1:0934)
1:065F  c41ea403          les      bx, ptr [0x3a4]
1:0663  99                cdq      
1:0664  26f77f04          idiv     word ptr es:[bx + 4]
1:0668  52                push     dx
1:0669  b80200            mov      ax, 2
1:066C  50                push     ax
1:066D  50                push     ax
1:066E  b84200            mov      ax, 0x42
1:0671  99                cdq      
1:0672  52                push     dx
1:0673  50                push     ax
1:0674  9affff0000        lcall    0, 0xffff  ; @1:GDI.PatBlt
1:0679  2bc0              sub      ax, ax
1:067B  4d                dec      bp
1:067C  4d                dec      bp
1:067D  8be5              mov      sp, bp
1:067F  1f                pop      ds
1:0680  5d                pop      bp
1:0681  4d                dec      bp
1:0682  cb                retf     
1:0683  1e                push     ds
1:0684  58                pop      ax
1:0685  90                nop      
1:0686  45                inc      bp
1:0687  55                push     bp
1:0688  8bec              mov      bp, sp
1:068A  1e                push     ds
1:068B  8ed8              mov      ds, ax
1:068D  a1aa03            mov      ax, word ptr [0x3aa]
1:0690  a3a803            mov      word ptr [0x3a8], ax
1:0693  c70612000100      mov      word ptr [0x12], 1
1:0699  4d                dec      bp
1:069A  4d                dec      bp
1:069B  8be5              mov      sp, bp
1:069D  1f                pop      ds
1:069E  5d                pop      bp
1:069F  4d                dec      bp
1:06A0  cb                retf     
1:06A1  001e5890          add      byte ptr [0x9058], bl
1:06A5  45                inc      bp
1:06A6  55                push     bp
1:06A7  8bec              mov      bp, sp
1:06A9  1e                push     ds
1:06AA  8ed8              mov      ds, ax
1:06AC  837e0a00          cmp      word ptr [bp + 0xa], 0
1:06B0  7504              jne      0x6b6
1:06B2  2bc0              sub      ax, ax
1:06B4  eb09              jmp      0x6bf
1:06B6  8b460e            mov      ax, word ptr [bp + 0xe]
1:06B9  a3a003            mov      word ptr [0x3a0], ax
1:06BC  b80100            mov      ax, 1
1:06BF  4d                dec      bp
1:06C0  4d                dec      bp
1:06C1  8be5              mov      sp, bp
1:06C3  1f                pop      ds
1:06C4  5d                pop      bp
1:06C5  4d                dec      bp
1:06C6  ca0a00            retf     0xa

; ===== EXPORT:WEP(#2) =====
1:06C9  1e                push     ds
1:06CA  58                pop      ax
1:06CB  90                nop      
1:06CC  45                inc      bp
1:06CD  55                push     bp
1:06CE  8bec              mov      bp, sp
1:06D0  1e                push     ds
1:06D1  8ed8              mov      ds, ax
1:06D3  b80100            mov      ax, 1
1:06D6  4d                dec      bp
1:06D7  4d                dec      bp
1:06D8  8be5              mov      sp, bp
1:06DA  1f                pop      ds
1:06DB  5d                pop      bp
1:06DC  4d                dec      bp
1:06DD  ca0200            retf     2

; ===== EXPORT:MODULE(#1) =====
1:06E0  1e                push     ds
1:06E1  58                pop      ax
1:06E2  90                nop      
1:06E3  45                inc      bp
1:06E4  55                push     bp
1:06E5  8bec              mov      bp, sp
1:06E7  1e                push     ds
1:06E8  8ed8              mov      ds, ax
1:06EA  83ec0a            sub      sp, 0xa
1:06ED  56                push     si
1:06EE  8b4608            mov      ax, word ptr [bp + 8]
1:06F1  a39203            mov      word ptr [0x392], ax
1:06F4  8b4606            mov      ax, word ptr [bp + 6]
1:06F7  a39003            mov      word ptr [0x390], ax
1:06FA  50                push     ax
1:06FB  9a1b070000        lcall    0, 0x71b  ; @1:KERNEL.GlobalLock
1:0700  a39603            mov      word ptr [0x396], ax
1:0703  89169803          mov      word ptr [0x398], dx
1:0707  8bc2              mov      ax, dx
1:0709  0b069603          or       ax, word ptr [0x396]
1:070D  7503              jne      0x712
1:070F  e96a01            jmp      0x87c
1:0712  c41e9603          les      bx, ptr [0x396]
1:0716  26ff7720          push     word ptr es:[bx + 0x20]
1:071A  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalLock
1:071F  a3a403            mov      word ptr [0x3a4], ax
1:0722  8916a603          mov      word ptr [0x3a6], dx
1:0726  8bc2              mov      ax, dx
1:0728  0b06a403          or       ax, word ptr [0x3a4]
1:072C  7503              jne      0x731
1:072E  e94201            jmp      0x873
1:0731  8b460a            mov      ax, word ptr [bp + 0xa]
1:0734  e90801            jmp      0x83f
1:0737  c41e9603          les      bx, ptr [0x396]
1:073B  26837f1465        cmp      word ptr es:[bx + 0x14], 0x65
1:0740  7c0f              jl       0x751
1:0742  26817f36f400      cmp      word ptr es:[bx + 0x36], 0xf4
1:0748  7507              jne      0x751
1:074A  26837f3878        cmp      word ptr es:[bx + 0x38], 0x78
1:074F  740e              je       0x75f
1:0751  c70618000000      mov      word ptr [0x18], 0
1:0757  c746fc0500        mov      word ptr [bp - 4], 5
1:075C  e90701            jmp      0x866
1:075F  c70618000100      mov      word ptr [0x18], 1
1:0765  e9fe00            jmp      0x866
1:0768  b85003            mov      ax, 0x350
1:076B  50                push     ax
1:076C  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_14(1:08BE)
1:0771  5b                pop      bx
1:0772  ff365003          push     word ptr [0x350]
1:0776  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_13(1:0920)
1:077B  5b                pop      bx
1:077C  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:0012)
1:0781  eb13              jmp      0x796
1:0783  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:008C)
1:0788  eb0c              jmp      0x796
1:078A  833e180000        cmp      word ptr [0x18], 0
1:078F  740b              je       0x79c
1:0791  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:00A0)
1:0796  8946fc            mov      word ptr [bp - 4], ax
1:0799  e9ca00            jmp      0x866
1:079C  ff369203          push     word ptr [0x392]
1:07A0  b800ff            mov      ax, 0xff00
1:07A3  baff00            mov      dx, 0xff
1:07A6  52                push     dx
1:07A7  50                push     ax
1:07A8  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextColor
1:07AD  ff369203          push     word ptr [0x392]
1:07B1  2bc0              sub      ax, ax
1:07B3  50                push     ax
1:07B4  50                push     ax
1:07B5  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkColor
1:07BA  ff369203          push     word ptr [0x392]
1:07BE  2bc0              sub      ax, ax
1:07C0  50                push     ax
1:07C1  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextAlign
1:07C6  ff369203          push     word ptr [0x392]
1:07CA  b80100            mov      ax, 1
1:07CD  50                push     ax
1:07CE  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkMode
1:07D3  ff369203          push     word ptr [0x392]
1:07D7  2bc0              sub      ax, ax
1:07D9  50                push     ax
1:07DA  50                push     ax
1:07DB  b81a00            mov      ax, 0x1a
1:07DE  1e                push     ds
1:07DF  50                push     ax
1:07E0  50                push     ax
1:07E1  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:08A2)
1:07E6  5b                pop      bx
1:07E7  50                push     ax
1:07E8  9affff0000        lcall    0, 0xffff  ; @1:GDI.TextOut
1:07ED  eb77              jmp      0x866
1:07EF  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:010E)
1:07F4  eba0              jmp      0x796
1:07F6  a1a003            mov      ax, word ptr [0x3a0]
1:07F9  c41ea403          les      bx, ptr [0x3a4]
1:07FD  26894716          mov      word ptr es:[bx + 0x16], ax
1:0801  c746f60000        mov      word ptr [bp - 0xa], 0
1:0806  8b46f6            mov      ax, word ptr [bp - 0xa]
1:0809  8bf0              mov      si, ax
1:080B  d1e6              shl      si, 1
1:080D  40                inc      ax
1:080E  c41ea403          les      bx, ptr [0x3a4]
1:0812  2689400e          mov      word ptr es:[bx + si + 0xe], ax
1:0816  ff46f6            inc      word ptr [bp - 0xa]
1:0819  837ef604          cmp      word ptr [bp - 0xa], 4
1:081D  7ce7              jl       0x806
1:081F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:0122)
1:0824  e96fff            jmp      0x796
1:0827  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_6(1:0136)
1:082C  e967ff            jmp      0x796
1:082F  8b460a            mov      ax, word ptr [bp + 0xa]
1:0832  2d0700            sub      ax, 7
1:0835  50                push     ax
1:0836  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_5(1:014A)
1:083B  5b                pop      bx
1:083C  e957ff            jmp      0x796
1:083F  3d0c00            cmp      ax, 0xc
1:0842  7722              ja       0x866
1:0844  d1e0              shl      ax, 1
1:0846  93                xchg     bx, ax
1:0847  2effa74c08        jmp      word ptr cs:[bx + 0x84c]
1:084C  680783            push     0x8307
1:084F  07                pop      es
1:0850  8a07              mov      al, byte ptr [bx]
1:0852  ef                out      dx, ax
1:0853  07                pop      es
1:0854  6608f6            or       dh, dh
1:0857  07                pop      es
1:0858  27                daa      
1:0859  082f              or       byte ptr [bx], ch
1:085B  082f              or       byte ptr [bx], ch
1:085D  082f              or       byte ptr [bx], ch
1:085F  082f              or       byte ptr [bx], ch
1:0861  086608            or       byte ptr [bp + 8], ah
1:0864  37                aaa      
1:0865  07                pop      es
1:0866  c41e9603          les      bx, ptr [0x396]
1:086A  26ff7720          push     word ptr es:[bx + 0x20]
1:086E  9a78080000        lcall    0, 0x878  ; @1:KERNEL.GlobalUnlock
1:0873  ff369003          push     word ptr [0x390]
1:0877  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalUnlock
1:087C  8b46fc            mov      ax, word ptr [bp - 4]
1:087F  5e                pop      si
1:0880  4d                dec      bp
1:0881  4d                dec      bp
1:0882  8be5              mov      sp, bp
1:0884  1f                pop      ds
1:0885  5d                pop      bp
1:0886  4d                dec      bp
1:0887  ca0600            retf     6
1:088A  0000              add      byte ptr [bx + si], al
1:088C  0000              add      byte ptr [bx + si], al
1:088E  0000              add      byte ptr [bx + si], al
1:0890  0000              add      byte ptr [bx + si], al
1:0892  0000              add      byte ptr [bx + si], al
1:0894  0000              add      byte ptr [bx + si], al
1:0896  0000              add      byte ptr [bx + si], al
1:0898  0000              add      byte ptr [bx + si], al
1:089A  0000              add      byte ptr [bx + si], al
1:089C  0000              add      byte ptr [bx + si], al
1:089E  0000              add      byte ptr [bx + si], al
1:08A0  c3                ret      
1:08A1  00558b            add      byte ptr [di - 0x75], dl
1:08A4  ec                in       al, dx
1:08A5  8bd7              mov      dx, di
1:08A7  8cd8              mov      ax, ds
1:08A9  8ec0              mov      es, ax
1:08AB  8b7e06            mov      di, word ptr [bp + 6]
1:08AE  33c0              xor      ax, ax
1:08B0  b9ffff            mov      cx, 0xffff
1:08B3  f2ae              repne scasb al, byte ptr es:[di]
1:08B5  f7d1              not      cx
1:08B7  49                dec      cx
1:08B8  91                xchg     cx, ax
1:08B9  8bfa              mov      di, dx
1:08BB  5d                pop      bp
1:08BC  cb                retf     
1:08BD  008cd890          add      byte ptr [si - 0x6f28], cl
1:08C1  45                inc      bp
1:08C2  55                push     bp
1:08C3  8bec              mov      bp, sp
1:08C5  1e                push     ds
1:08C6  8ed8              mov      ds, ax
1:08C8  56                push     si
1:08C9  b42a              mov      ah, 0x2a
1:08CB  cd21              int      0x21
1:08CD  8bda              mov      bx, dx
1:08CF  8bf1              mov      si, cx
1:08D1  b42c              mov      ah, 0x2c
1:08D3  cd21              int      0x21
1:08D5  b400              mov      ah, 0
1:08D7  8ac6              mov      al, dh
1:08D9  50                push     ax
1:08DA  8ac1              mov      al, cl
1:08DC  50                push     ax
1:08DD  8ac5              mov      al, ch
1:08DF  50                push     ax
1:08E0  50                push     ax
1:08E1  b42a              mov      ah, 0x2a
1:08E3  cd21              int      0x21
1:08E5  3bda              cmp      bx, dx
1:08E7  58                pop      ax
1:08E8  7408              je       0x8f2
1:08EA  3c17              cmp      al, 0x17
1:08EC  7504              jne      0x8f2
1:08EE  8bd3              mov      dx, bx
1:08F0  8bce              mov      cx, si
1:08F2  b400              mov      ah, 0
1:08F4  8ac2              mov      al, dl
1:08F6  50                push     ax
1:08F7  8ac6              mov      al, dh
1:08F9  50                push     ax
1:08FA  81e9bc07          sub      cx, 0x7bc
1:08FE  51                push     cx
1:08FF  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_16(1:0964)
1:0904  83c40c            add      sp, 0xc
1:0907  837e0600          cmp      word ptr [bp + 6], 0
1:090B  7408              je       0x915
1:090D  8b5e06            mov      bx, word ptr [bp + 6]
1:0910  895702            mov      word ptr [bx + 2], dx
1:0913  8907              mov      word ptr [bx], ax
1:0915  5e                pop      si
1:0916  83ed02            sub      bp, 2
1:0919  8be5              mov      sp, bp
1:091B  1f                pop      ds
1:091C  5d                pop      bp
1:091D  4d                dec      bp
1:091E  cb                retf     
1:091F  004555            add      byte ptr [di + 0x55], al
1:0922  8bec              mov      bp, sp
1:0924  8b4606            mov      ax, word ptr [bp + 6]
1:0927  a35200            mov      word ptr [0x52], ax
1:092A  c70654000000      mov      word ptr [0x54], 0
1:0930  5d                pop      bp
1:0931  4d                dec      bp
1:0932  cb                retf     
1:0933  90                nop      

; ===== EXPORT:ord_4(#4) =====
1:0934  45                inc      bp
1:0935  55                push     bp
1:0936  8bec              mov      bp, sp
1:0938  b8fd43            mov      ax, 0x43fd
1:093B  ba0300            mov      dx, 3
1:093E  52                push     dx
1:093F  50                push     ax