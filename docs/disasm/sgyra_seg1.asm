File: raw\unpacked\MODULES\SGYRA.AD
Module: 'BLANKER' ('Graphics Module Library')
CS:IP=1:1748  SS:SP=0:0000  AutoDS=2  Heap=4096  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (3): KERNEL, GDI, USER
Segments (2):
  SEG  1: CODE off=0x00620 len=0x177A min=0x177A flags=0x1D50 relocs=136
  SEG  2: DATA off=0x01F60 len=0x0B0C min=0x0B0C flags=0x0C61 relocs=0
Exports (34):
  ord   1: SEG1:0AC2 flags=0x03 MODULE
  ord   2: SEG1:0AAB flags=0x03 WEP
  ord   3: SEG1:1734 flags=0x03 ___EXPORTEDSTUB
  ord   4: SEG1:0F10 flags=0x00 
  ord   5: SEG1:0F4E flags=0x00 
  ord   6: SEG1:0E76 flags=0x00 
  ord   7: SEG1:0E04 flags=0x00 
  ord   8: SEG1:0F42 flags=0x00 
  ord   9: SEG1:0C6C flags=0x00 
  ord  10: SEG1:0A70 flags=0x00 
  ord  11: SEG1:0A5C flags=0x00 
  ord  12: SEG1:0A48 flags=0x00 
  ord  13: SEG1:0A15 flags=0x00 
  ord  14: SEG1:0D72 flags=0x00 
  ord  15: SEG1:0451 flags=0x00 
  ord  16: SEG1:09CE flags=0x00 
  ord  17: SEG1:0012 flags=0x00 
  ord  18: SEG1:0DF0 flags=0x00 
  ord  19: SEG1:0D8E flags=0x00 
  ord  20: SEG1:0E56 flags=0x00 
  ord  21: SEG1:0E34 flags=0x00 
  ord  22: SEG1:0A84 flags=0x00 
  ord  23: SEG1:0FAE flags=0x00 
  ord  24: SEG1:129E flags=0x00 
  ord  25: SEG1:115E flags=0x00 
  ord  26: SEG1:13D0 flags=0x00 
  ord  27: SEG1:13F8 flags=0x00 
  ord  28: SEG1:149A flags=0x00 
  ord  29: SEG1:145E flags=0x00 
  ord  30: SEG1:14C4 flags=0x00 
  ord  31: SEG1:13FC flags=0x00 
  ord  32: SEG1:1178 flags=0x00 
  ord  33: SEG1:1668 flags=0x00 
  ord  34: SEG1:1724 flags=0x00 
Resources (7):
  TYPE_1000        #1               off=0x02AA0 len=    64
  TYPE_1000        #2               off=0x02AE0 len=    64
  TYPE_1000        #3               off=0x02B20 len=    64
  TYPE_1000        #4               off=0x02B60 len=    32
  TYPE_2000        #10              off=0x02B80 len=    80
  TYPE_2000        #20              off=0x02BD0 len=    16
  TYPE_2000        #30              off=0x02BE0 len=    96

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

; ===== EXPORT:ord_17(#17) =====
1:0012  1e                push     ds
1:0013  58                pop      ax
1:0014  90                nop      
1:0015  45                inc      bp
1:0016  55                push     bp
1:0017  8bec              mov      bp, sp
1:0019  1e                push     ds
1:001A  8ed8              mov      ds, ax
1:001C  83ec04            sub      sp, 4
1:001F  2bc0              sub      ax, ax
1:0021  a31800            mov      word ptr [0x18], ax
1:0024  a31600            mov      word ptr [0x16], ax
1:0027  a31c00            mov      word ptr [0x1c], ax
1:002A  a31a00            mov      word ptr [0x1a], ax
1:002D  a32200            mov      word ptr [0x22], ax
1:0030  a32000            mov      word ptr [0x20], ax
1:0033  a32600            mov      word ptr [0x26], ax
1:0036  a32400            mov      word ptr [0x24], ax
1:0039  a32c00            mov      word ptr [0x2c], ax
1:003C  a32a00            mov      word ptr [0x2a], ax
1:003F  c7062e000e01      mov      word ptr [0x2e], 0x10e
1:0045  c70638002800      mov      word ptr [0x38], 0x28
1:004B  c7063a005000      mov      word ptr [0x3a], 0x50
1:0051  a33e00            mov      word ptr [0x3e], ax
1:0054  a33c00            mov      word ptr [0x3c], ax
1:0057  a34200            mov      word ptr [0x42], ax
1:005A  a34000            mov      word ptr [0x40], ax
1:005D  a31e00            mov      word ptr [0x1e], ax
1:0060  a33000            mov      word ptr [0x30], ax
1:0063  a33200            mov      word ptr [0x32], ax
1:0066  a33400            mov      word ptr [0x34], ax
1:0069  a33600            mov      word ptr [0x36], ax
1:006C  a34600            mov      word ptr [0x46], ax
1:006F  a35000            mov      word ptr [0x50], ax
1:0072  a35200            mov      word ptr [0x52], ax
1:0075  a35c00            mov      word ptr [0x5c], ax
1:0078  a35e00            mov      word ptr [0x5e], ax
1:007B  b80100            mov      ax, 1
1:007E  a35400            mov      word ptr [0x54], ax
1:0081  a35600            mov      word ptr [0x56], ax
1:0084  a36000            mov      word ptr [0x60], ax
1:0087  a36200            mov      word ptr [0x62], ax
1:008A  2bc0              sub      ax, ax
1:008C  a32800            mov      word ptr [0x28], ax
1:008F  a34400            mov      word ptr [0x44], ax
1:0092  a34e00            mov      word ptr [0x4e], ax
1:0095  a35800            mov      word ptr [0x58], ax
1:0098  a35a00            mov      word ptr [0x5a], ax
1:009B  a36400            mov      word ptr [0x64], ax
1:009E  c41e080b          les      bx, ptr [0xb08]
1:00A2  268b4702          mov      ax, word ptr es:[bx + 2]
1:00A6  a33000            mov      word ptr [0x30], ax
1:00A9  268b4704          mov      ax, word ptr es:[bx + 4]
1:00AD  a33400            mov      word ptr [0x34], ax
1:00B0  a13000            mov      ax, word ptr [0x30]
1:00B3  99                cdq      
1:00B4  33c2              xor      ax, dx
1:00B6  2bc2              sub      ax, dx
1:00B8  b90200            mov      cx, 2
1:00BB  d3f8              sar      ax, cl
1:00BD  33c2              xor      ax, dx
1:00BF  2bc2              sub      ax, dx
1:00C1  a33200            mov      word ptr [0x32], ax
1:00C4  a13400            mov      ax, word ptr [0x34]
1:00C7  99                cdq      
1:00C8  33c2              xor      ax, dx
1:00CA  2bc2              sub      ax, dx
1:00CC  d3f8              sar      ax, cl
1:00CE  33c2              xor      ax, dx
1:00D0  2bc2              sub      ax, dx
1:00D2  a33600            mov      word ptr [0x36], ax
1:00D5  2bc0              sub      ax, ax
1:00D7  a33e00            mov      word ptr [0x3e], ax
1:00DA  a33c00            mov      word ptr [0x3c], ax
1:00DD  a32400            mov      word ptr [0x24], ax
1:00E0  c70626007500      mov      word ptr [0x26], 0x75
1:00E6  a34000            mov      word ptr [0x40], ax
1:00E9  c70642000100      mov      word ptr [0x42], 1
1:00EF  ba0100            mov      dx, 1
1:00F2  52                push     dx
1:00F3  50                push     ax
1:00F4  a13000            mov      ax, word ptr [0x30]
1:00F7  99                cdq      
1:00F8  33c2              xor      ax, dx
1:00FA  2bc2              sub      ax, dx
1:00FC  b90300            mov      cx, 3
1:00FF  d3f8              sar      ax, cl
1:0101  33c2              xor      ax, dx
1:0103  2bc2              sub      ax, dx
1:0105  99                cdq      
1:0106  52                push     dx
1:0107  50                push     ax
1:0108  9a4c010000        lcall    0, 0x14c  ; @1:INT:ord_7(1:0E04)
1:010D  99                cdq      
1:010E  050080            add      ax, 0x8000
1:0111  83d200            adc      dx, 0
1:0114  52                push     dx
1:0115  50                push     ax
1:0116  9a5a010000        lcall    0, 0x15a  ; @1:INT:ord_4(1:0F10)
1:011B  52                push     dx
1:011C  50                push     ax
1:011D  9a61010000        lcall    0, 0x161  ; @1:INT:ord_6(1:0E76)
1:0122  a35200            mov      word ptr [0x52], ax
1:0125  3d0100            cmp      ax, 1
1:0128  7d06              jge      0x130
1:012A  c70652000100      mov      word ptr [0x52], 1
1:0130  2bc0              sub      ax, ax
1:0132  ba0100            mov      dx, 1
1:0135  52                push     dx
1:0136  50                push     ax
1:0137  a13400            mov      ax, word ptr [0x34]
1:013A  99                cdq      
1:013B  33c2              xor      ax, dx
1:013D  2bc2              sub      ax, dx
1:013F  b90300            mov      cx, 3
1:0142  d3f8              sar      ax, cl
1:0144  33c2              xor      ax, dx
1:0146  2bc2              sub      ax, dx
1:0148  99                cdq      
1:0149  52                push     dx
1:014A  50                push     ax
1:014B  9a86010000        lcall    0, 0x186  ; @1:INT:ord_7(1:0E04)
1:0150  99                cdq      
1:0151  050080            add      ax, 0x8000
1:0154  83d200            adc      dx, 0
1:0157  52                push     dx
1:0158  50                push     ax
1:0159  9a94010000        lcall    0, 0x194  ; @1:INT:ord_4(1:0F10)
1:015E  52                push     dx
1:015F  50                push     ax
1:0160  9a9b010000        lcall    0, 0x19b  ; @1:INT:ord_6(1:0E76)
1:0165  a35e00            mov      word ptr [0x5e], ax
1:0168  3d0100            cmp      ax, 1
1:016B  7d06              jge      0x173
1:016D  c7065e000100      mov      word ptr [0x5e], 1
1:0173  2bc0              sub      ax, ax
1:0175  ba0100            mov      dx, 1
1:0178  52                push     dx
1:0179  50                push     ax
1:017A  a13000            mov      ax, word ptr [0x30]
1:017D  99                cdq      
1:017E  2bc2              sub      ax, dx
1:0180  d1f8              sar      ax, 1
1:0182  99                cdq      
1:0183  52                push     dx
1:0184  50                push     ax
1:0185  9ab5010000        lcall    0, 0x1b5  ; @1:INT:ord_7(1:0E04)
1:018A  99                cdq      
1:018B  050080            add      ax, 0x8000
1:018E  83d200            adc      dx, 0
1:0191  52                push     dx
1:0192  50                push     ax
1:0193  9ac3010000        lcall    0, 0x1c3  ; @1:INT:ord_4(1:0F10)
1:0198  52                push     dx
1:0199  50                push     ax
1:019A  9aca010000        lcall    0, 0x1ca  ; @1:INT:ord_6(1:0E76)
1:019F  a35000            mov      word ptr [0x50], ax
1:01A2  2bc0              sub      ax, ax
1:01A4  ba0100            mov      dx, 1
1:01A7  52                push     dx
1:01A8  50                push     ax
1:01A9  a13400            mov      ax, word ptr [0x34]
1:01AC  99                cdq      
1:01AD  2bc2              sub      ax, dx
1:01AF  d1f8              sar      ax, 1
1:01B1  99                cdq      
1:01B2  52                push     dx
1:01B3  50                push     ax
1:01B4  9a0c020000        lcall    0, 0x20c  ; @1:INT:ord_7(1:0E04)
1:01B9  99                cdq      
1:01BA  050080            add      ax, 0x8000
1:01BD  83d200            adc      dx, 0
1:01C0  52                push     dx
1:01C1  50                push     ax
1:01C2  9a1a020000        lcall    0, 0x21a  ; @1:INT:ord_4(1:0F10)
1:01C7  52                push     dx
1:01C8  50                push     ax
1:01C9  9a21020000        lcall    0, 0x221  ; @1:INT:ord_6(1:0E76)
1:01CE  a35c00            mov      word ptr [0x5c], ax
1:01D1  c746fc0000        mov      word ptr [bp - 4], 0
1:01D6  2bc0              sub      ax, ax
1:01D8  8b5efc            mov      bx, word ptr [bp - 4]
1:01DB  d1e3              shl      bx, 1
1:01DD  8987dc07          mov      word ptr [bx + 0x7dc], ax
1:01E1  89876c09          mov      word ptr [bx + 0x96c], ax
1:01E5  8987ba04          mov      word ptr [bx + 0x4ba], ax
1:01E9  89874a06          mov      word ptr [bx + 0x64a], ax
1:01ED  ff46fc            inc      word ptr [bp - 4]
1:01F0  817efcc800        cmp      word ptr [bp - 4], 0xc8
1:01F5  7cdf              jl       0x1d6
1:01F7  a34400            mov      word ptr [0x44], ax
1:01FA  c7062800c700      mov      word ptr [0x28], 0xc7
1:0200  ba0100            mov      dx, 1
1:0203  52                push     dx
1:0204  50                push     ax
1:0205  b8f401            mov      ax, 0x1f4
1:0208  99                cdq      
1:0209  52                push     dx
1:020A  50                push     ax
1:020B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:0E04)
1:0210  99                cdq      
1:0211  050080            add      ax, 0x8000
1:0214  83d200            adc      dx, 0
1:0217  52                push     dx
1:0218  50                push     ax
1:0219  9aae020000        lcall    0, 0x2ae  ; @1:INT:ord_4(1:0F10)
1:021E  52                push     dx
1:021F  50                push     ax
1:0220  9a35020000        lcall    0, 0x235  ; @1:INT:ord_6(1:0E76)
1:0225  050100            add      ax, 1
1:0228  83d200            adc      dx, 0
1:022B  52                push     dx
1:022C  50                push     ax
1:022D  2bc0              sub      ax, ax
1:022F  baea00            mov      dx, 0xea
1:0232  52                push     dx
1:0233  50                push     ax
1:0234  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_6(1:0E76)
1:0239  a34000            mov      word ptr [0x40], ax
1:023C  89164200          mov      word ptr [0x42], dx
1:0240  2bc0              sub      ax, ax
1:0242  50                push     ax
1:0243  b90100            mov      cx, 1
1:0246  51                push     cx
1:0247  2bd2              sub      dx, dx
1:0249  52                push     dx
1:024A  52                push     dx
1:024B  9a63020000        lcall    0, 0x263  ; @1:GDI.CreatePen
1:0250  a3000b            mov      word ptr [0xb00], ax
1:0253  2bc0              sub      ax, ax
1:0255  50                push     ax
1:0256  b90100            mov      cx, 1
1:0259  51                push     cx
1:025A  b9ffff            mov      cx, 0xffff
1:025D  baff00            mov      dx, 0xff
1:0260  52                push     dx
1:0261  51                push     cx
1:0262  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreatePen
1:0267  a3da07            mov      word ptr [0x7da], ax
1:026A  ff36b204          push     word ptr [0x4b2]
1:026E  50                push     ax
1:026F  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectObject
1:0274  a3fe0a            mov      word ptr [0xafe], ax
1:0277  2bc0              sub      ax, ax
1:0279  4d                dec      bp
1:027A  4d                dec      bp
1:027B  8be5              mov      sp, bp
1:027D  1f                pop      ds
1:027E  5d                pop      bp
1:027F  4d                dec      bp
1:0280  cb                retf     
1:0281  1e                push     ds
1:0282  58                pop      ax
1:0283  90                nop      
1:0284  45                inc      bp
1:0285  55                push     bp
1:0286  8bec              mov      bp, sp
1:0288  1e                push     ds
1:0289  8ed8              mov      ds, ax
1:028B  83ec0c            sub      sp, 0xc
1:028E  56                push     si
1:028F  8b5e06            mov      bx, word ptr [bp + 6]
1:0292  8b4704            mov      ax, word ptr [bx + 4]
1:0295  8946f8            mov      word ptr [bp - 8], ax
1:0298  8bc8              mov      cx, ax
1:029A  2bd2              sub      dx, dx
1:029C  52                push     dx
1:029D  50                push     ax
1:029E  2bc0              sub      ax, ax
1:02A0  ba0100            mov      dx, 1
1:02A3  2b4702            sub      ax, word ptr [bx + 2]
1:02A6  83da00            sbb      dx, 0
1:02A9  52                push     dx
1:02AA  50                push     ax
1:02AB  8bf1              mov      si, cx
1:02AD  9aed020000        lcall    0, 0x2ed  ; @1:INT:ord_4(1:0F10)
1:02B2  8956fc            mov      word ptr [bp - 4], dx
1:02B5  8bc6              mov      ax, si
1:02B7  2bf2              sub      si, dx
1:02B9  8976f4            mov      word ptr [bp - 0xc], si
1:02BC  c746f60000        mov      word ptr [bp - 0xa], 0
1:02C1  8b5e06            mov      bx, word ptr [bp + 6]
1:02C4  8b0f              mov      cx, word ptr [bx]
1:02C6  894efa            mov      word ptr [bp - 6], cx
1:02C9  81f9aa2a          cmp      cx, 0x2aaa
1:02CD  7735              ja       0x304
1:02CF  8b5e08            mov      bx, word ptr [bp + 8]
1:02D2  8907              mov      word ptr [bx], ax
1:02D4  8b46fc            mov      ax, word ptr [bp - 4]
1:02D7  894704            mov      word ptr [bx + 4], ax
1:02DA  b9aa2a            mov      cx, 0x2aaa
1:02DD  2bd2              sub      dx, dx
1:02DF  52                push     dx
1:02E0  51                push     cx
1:02E1  ff76f6            push     word ptr [bp - 0xa]
1:02E4  ff76f4            push     word ptr [bp - 0xc]
1:02E7  8b4efa            mov      cx, word ptr [bp - 6]
1:02EA  52                push     dx
1:02EB  51                push     cx
1:02EC  9a30030000        lcall    0, 0x330  ; @1:INT:ord_4(1:0F10)
1:02F1  52                push     dx
1:02F2  50                push     ax
1:02F3  9a37030000        lcall    0, 0x337  ; @1:INT:ord_5(1:0F4E)
1:02F8  0346fc            add      ax, word ptr [bp - 4]
1:02FB  8b5e08            mov      bx, word ptr [bp + 8]
1:02FE  894702            mov      word ptr [bx + 2], ax
1:0301  e93701            jmp      0x43b
1:0304  81f95555          cmp      cx, 0x5555
1:0308  773e              ja       0x348
1:030A  8b46f8            mov      ax, word ptr [bp - 8]
1:030D  8b5e08            mov      bx, word ptr [bp + 8]
1:0310  894702            mov      word ptr [bx + 2], ax
1:0313  8b4efc            mov      cx, word ptr [bp - 4]
1:0316  894f04            mov      word ptr [bx + 4], cx
1:0319  b9ab2a            mov      cx, 0x2aab
1:031C  2bd2              sub      dx, dx
1:031E  52                push     dx
1:031F  51                push     cx
1:0320  ff76f6            push     word ptr [bp - 0xa]
1:0323  ff76f4            push     word ptr [bp - 0xc]
1:0326  8b4efa            mov      cx, word ptr [bp - 6]
1:0329  81e9aa2a          sub      cx, 0x2aaa
1:032D  52                push     dx
1:032E  51                push     cx
1:032F  9a72030000        lcall    0, 0x372  ; @1:INT:ord_4(1:0F10)
1:0334  52                push     dx
1:0335  50                push     ax
1:0336  9a79030000        lcall    0, 0x379  ; @1:INT:ord_5(1:0F4E)
1:033B  2b46f8            sub      ax, word ptr [bp - 8]
1:033E  f7d8              neg      ax
1:0340  8b5e08            mov      bx, word ptr [bp + 8]
1:0343  8907              mov      word ptr [bx], ax
1:0345  e9f300            jmp      0x43b
1:0348  81f9ff7f          cmp      cx, 0x7fff
1:034C  7735              ja       0x383
1:034E  8bc2              mov      ax, dx
1:0350  8b5e08            mov      bx, word ptr [bp + 8]
1:0353  8907              mov      word ptr [bx], ax
1:0355  8b4ef8            mov      cx, word ptr [bp - 8]
1:0358  894f02            mov      word ptr [bx + 2], cx
1:035B  b9aa2a            mov      cx, 0x2aaa
1:035E  2bd2              sub      dx, dx
1:0360  52                push     dx
1:0361  51                push     cx
1:0362  ff76f6            push     word ptr [bp - 0xa]
1:0365  ff76f4            push     word ptr [bp - 0xc]
1:0368  8b4efa            mov      cx, word ptr [bp - 6]
1:036B  81e95555          sub      cx, 0x5555
1:036F  52                push     dx
1:0370  51                push     cx
1:0371  9aad030000        lcall    0, 0x3ad  ; @1:INT:ord_4(1:0F10)
1:0376  52                push     dx
1:0377  50                push     ax
1:0378  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_5(1:0F4E)
1:037D  0346fc            add      ax, word ptr [bp - 4]
1:0380  e9b200            jmp      0x435
1:0383  81f9aaaa          cmp      cx, 0xaaaa
1:0387  7737              ja       0x3c0
1:0389  8bc2              mov      ax, dx
1:038B  8b5e08            mov      bx, word ptr [bp + 8]
1:038E  8907              mov      word ptr [bx], ax
1:0390  8b46f8            mov      ax, word ptr [bp - 8]
1:0393  894704            mov      word ptr [bx + 4], ax
1:0396  b9ab2a            mov      cx, 0x2aab
1:0399  2bd2              sub      dx, dx
1:039B  52                push     dx
1:039C  51                push     cx
1:039D  ff76f6            push     word ptr [bp - 0xa]
1:03A0  ff76f4            push     word ptr [bp - 0xc]
1:03A3  8b4efa            mov      cx, word ptr [bp - 6]
1:03A6  81e9ff7f          sub      cx, 0x7fff
1:03AA  52                push     dx
1:03AB  51                push     cx
1:03AC  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_4(1:0F10)
1:03B1  52                push     dx
1:03B2  50                push     ax
1:03B3  9af4030000        lcall    0, 0x3f4  ; @1:INT:ord_5(1:0F4E)
1:03B8  2b46f8            sub      ax, word ptr [bp - 8]
1:03BB  f7d8              neg      ax
1:03BD  e93bff            jmp      0x2fb
1:03C0  81f954d5          cmp      cx, 0xd554
1:03C4  7738              ja       0x3fe
1:03C6  8bc2              mov      ax, dx
1:03C8  8b5e08            mov      bx, word ptr [bp + 8]
1:03CB  894702            mov      word ptr [bx + 2], ax
1:03CE  8b4ef8            mov      cx, word ptr [bp - 8]
1:03D1  894f04            mov      word ptr [bx + 4], cx
1:03D4  b9aa2a            mov      cx, 0x2aaa
1:03D7  2bd2              sub      dx, dx
1:03D9  52                push     dx
1:03DA  51                push     cx
1:03DB  ff76f6            push     word ptr [bp - 0xa]
1:03DE  ff76f4            push     word ptr [bp - 0xc]
1:03E1  8b4efa            mov      cx, word ptr [bp - 6]
1:03E4  81e9aaaa          sub      cx, 0xaaaa
1:03E8  1bd2              sbb      dx, dx
1:03EA  52                push     dx
1:03EB  51                push     cx
1:03EC  9a25040000        lcall    0, 0x425  ; @1:INT:ord_4(1:0F10)
1:03F1  52                push     dx
1:03F2  50                push     ax
1:03F3  9a2c040000        lcall    0, 0x42c  ; @1:INT:ord_5(1:0F4E)
1:03F8  0346fc            add      ax, word ptr [bp - 4]
1:03FB  e942ff            jmp      0x340
1:03FE  8b46f8            mov      ax, word ptr [bp - 8]
1:0401  8b5e08            mov      bx, word ptr [bp + 8]
1:0404  8907              mov      word ptr [bx], ax
1:0406  8b4efc            mov      cx, word ptr [bp - 4]
1:0409  894f02            mov      word ptr [bx + 2], cx
1:040C  b9ab2a            mov      cx, 0x2aab
1:040F  2bd2              sub      dx, dx
1:0411  52                push     dx
1:0412  51                push     cx
1:0413  ff76f6            push     word ptr [bp - 0xa]
1:0416  ff76f4            push     word ptr [bp - 0xc]
1:0419  8b4efa            mov      cx, word ptr [bp - 6]
1:041C  81e954d5          sub      cx, 0xd554
1:0420  1bd2              sbb      dx, dx
1:0422  52                push     dx
1:0423  51                push     cx
1:0424  9aa3040000        lcall    0, 0x4a3  ; @1:INT:ord_4(1:0F10)
1:0429  52                push     dx
1:042A  50                push     ax
1:042B  9af4020000        lcall    0, 0x2f4  ; @1:INT:ord_5(1:0F4E)
1:0430  2b46f8            sub      ax, word ptr [bp - 8]
1:0433  f7d8              neg      ax
1:0435  8b5e08            mov      bx, word ptr [bp + 8]
1:0438  894704            mov      word ptr [bx + 4], ax
1:043B  b108              mov      cl, 8
1:043D  8b5e08            mov      bx, word ptr [bp + 8]
1:0440  d32f              shr      word ptr [bx], cl
1:0442  d36f02            shr      word ptr [bx + 2], cl
1:0445  d36f04            shr      word ptr [bx + 4], cl
1:0448  5e                pop      si
1:0449  4d                dec      bp
1:044A  4d                dec      bp
1:044B  8be5              mov      sp, bp
1:044D  1f                pop      ds
1:044E  5d                pop      bp
1:044F  4d                dec      bp
1:0450  cb                retf     

; ===== EXPORT:ord_15(#15) =====
1:0451  1e                push     ds
1:0452  58                pop      ax
1:0453  90                nop      
1:0454  45                inc      bp
1:0455  55                push     bp
1:0456  8bec              mov      bp, sp
1:0458  1e                push     ds
1:0459  8ed8              mov      ds, ax
1:045B  c41e080b          les      bx, ptr [0xb08]
1:045F  268b4706          mov      ax, word ptr es:[bx + 6]
1:0463  a32e00            mov      word ptr [0x2e], ax
1:0466  268b4708          mov      ax, word ptr es:[bx + 8]
1:046A  f72e2e00          imul     word ptr [0x2e]
1:046E  b96400            mov      cx, 0x64
1:0471  99                cdq      
1:0472  f7f9              idiv     cx
1:0474  a33800            mov      word ptr [0x38], ax
1:0477  3d1400            cmp      ax, 0x14
1:047A  7d06              jge      0x482
1:047C  c70638001400      mov      word ptr [0x38], 0x14
1:0482  8bc1              mov      ax, cx
1:0484  99                cdq      
1:0485  52                push     dx
1:0486  50                push     ax
1:0487  b9d403            mov      cx, 0x3d4
1:048A  2bdb              sub      bx, bx
1:048C  53                push     bx
1:048D  51                push     cx
1:048E  8b1e080b          mov      bx, word ptr [0xb08]
1:0492  268b470a          mov      ax, word ptr es:[bx + 0xa]
1:0496  99                cdq      
1:0497  b96400            mov      cx, 0x64
1:049A  2bdb              sub      bx, bx
1:049C  2bc8              sub      cx, ax
1:049E  1bda              sbb      bx, dx
1:04A0  53                push     bx
1:04A1  51                push     cx
1:04A2  9a63060000        lcall    0, 0x663  ; @1:INT:ord_4(1:0F10)
1:04A7  52                push     dx
1:04A8  50                push     ax
1:04A9  9aea040000        lcall    0, 0x4ea  ; @1:INT:ord_6(1:0E76)
1:04AE  051400            add      ax, 0x14
1:04B1  a33a00            mov      word ptr [0x3a], ax
1:04B4  c41eb604          les      bx, ptr [0x4b6]
1:04B8  26837f0a04        cmp      word ptr es:[bx + 0xa], 4
1:04BD  7d14              jge      0x4d3
1:04BF  c7061e000000      mov      word ptr [0x1e], 0
1:04C5  c7062a000100      mov      word ptr [0x2a], 1
1:04CB  c7062c000000      mov      word ptr [0x2c], 0
1:04D1  eb28              jmp      0x4fb
1:04D3  c7062a00ffff      mov      word ptr [0x2a], 0xffff
1:04D9  c7062c000000      mov      word ptr [0x2c], 0
1:04DF  99                cdq      
1:04E0  52                push     dx
1:04E1  50                push     ax
1:04E2  b8ffff            mov      ax, 0xffff
1:04E5  2bd2              sub      dx, dx
1:04E7  52                push     dx
1:04E8  50                push     ax
1:04E9  9a6a060000        lcall    0, 0x66a  ; @1:INT:ord_6(1:0E76)
1:04EE  a31a00            mov      word ptr [0x1a], ax
1:04F1  89161c00          mov      word ptr [0x1c], dx
1:04F5  c7061e000200      mov      word ptr [0x1e], 2
1:04FB  c706b4040000      mov      word ptr [0x4b4], 0
1:0501  e9a802            jmp      0x7ac
1:0504  ff36da07          push     word ptr [0x7da]
1:0508  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteObject
1:050D  2bc0              sub      ax, ax
1:050F  50                push     ax
1:0510  b80100            mov      ax, 1
1:0513  50                push     ax
1:0514  a0020b            mov      al, byte ptr [0xb02]
1:0517  8a26040b          mov      ah, byte ptr [0xb04]
1:051B  8a0e060b          mov      cl, byte ptr [0xb06]
1:051F  b502              mov      ch, 2
1:0521  51                push     cx
1:0522  50                push     ax
1:0523  9a4c020000        lcall    0, 0x24c  ; @1:GDI.CreatePen
1:0528  a3da07            mov      word ptr [0x7da], ax
1:052B  ff36b204          push     word ptr [0x4b2]
1:052F  ff36da07          push     word ptr [0x7da]
1:0533  9a70020000        lcall    0, 0x270  ; @1:GDI.SelectObject
1:0538  ff36b204          push     word ptr [0x4b2]
1:053C  ff365800          push     word ptr [0x58]
1:0540  ff366400          push     word ptr [0x64]
1:0544  9a6b050000        lcall    0, 0x56b  ; @1:GDI.MoveTo
1:0549  ff36b204          push     word ptr [0x4b2]
1:054D  ff364e00          push     word ptr [0x4e]
1:0551  ff365a00          push     word ptr [0x5a]
1:0555  9a80050000        lcall    0, 0x580  ; @1:GDI.LineTo
1:055A  ff36b204          push     word ptr [0x4b2]
1:055E  a13000            mov      ax, word ptr [0x30]
1:0561  2b065800          sub      ax, word ptr [0x58]
1:0565  50                push     ax
1:0566  ff366400          push     word ptr [0x64]
1:056A  9a95050000        lcall    0, 0x595  ; @1:GDI.MoveTo
1:056F  ff36b204          push     word ptr [0x4b2]
1:0573  a13000            mov      ax, word ptr [0x30]
1:0576  2b064e00          sub      ax, word ptr [0x4e]
1:057A  50                push     ax
1:057B  ff365a00          push     word ptr [0x5a]
1:057F  9aaa050000        lcall    0, 0x5aa  ; @1:GDI.LineTo
1:0584  ff36b204          push     word ptr [0x4b2]
1:0588  ff365800          push     word ptr [0x58]
1:058C  a13400            mov      ax, word ptr [0x34]
1:058F  2b066400          sub      ax, word ptr [0x64]
1:0593  50                push     ax
1:0594  9ac3050000        lcall    0, 0x5c3  ; @1:GDI.MoveTo
1:0599  ff36b204          push     word ptr [0x4b2]
1:059D  ff364e00          push     word ptr [0x4e]
1:05A1  a13400            mov      ax, word ptr [0x34]
1:05A4  2b065a00          sub      ax, word ptr [0x5a]
1:05A8  50                push     ax
1:05A9  9adc050000        lcall    0, 0x5dc  ; @1:GDI.LineTo
1:05AE  ff36b204          push     word ptr [0x4b2]
1:05B2  a13000            mov      ax, word ptr [0x30]
1:05B5  2b065800          sub      ax, word ptr [0x58]
1:05B9  50                push     ax
1:05BA  a13400            mov      ax, word ptr [0x34]
1:05BD  2b066400          sub      ax, word ptr [0x64]
1:05C1  50                push     ax
1:05C2  9affff0000        lcall    0, 0xffff  ; @1:GDI.MoveTo
1:05C7  ff36b204          push     word ptr [0x4b2]
1:05CB  a13000            mov      ax, word ptr [0x30]
1:05CE  2b064e00          sub      ax, word ptr [0x4e]
1:05D2  50                push     ax
1:05D3  a13400            mov      ax, word ptr [0x34]
1:05D6  2b065a00          sub      ax, word ptr [0x5a]
1:05DA  50                push     ax
1:05DB  9affff0000        lcall    0, 0xffff  ; @1:GDI.LineTo
1:05E0  a15800            mov      ax, word ptr [0x58]
1:05E3  8b1e2800          mov      bx, word ptr [0x28]
1:05E7  d1e3              shl      bx, 1
1:05E9  8987dc07          mov      word ptr [bx + 0x7dc], ax
1:05ED  a16400            mov      ax, word ptr [0x64]
1:05F0  89876c09          mov      word ptr [bx + 0x96c], ax
1:05F4  a14e00            mov      ax, word ptr [0x4e]
1:05F7  8987ba04          mov      word ptr [bx + 0x4ba], ax
1:05FB  a15a00            mov      ax, word ptr [0x5a]
1:05FE  89874a06          mov      word ptr [bx + 0x64a], ax
1:0602  ff062800          inc      word ptr [0x28]
1:0606  813e2800c700      cmp      word ptr [0x28], 0xc7
1:060C  7606              jbe      0x614
1:060E  c70628000000      mov      word ptr [0x28], 0
1:0614  a14000            mov      ax, word ptr [0x40]
1:0617  8b164200          mov      dx, word ptr [0x42]
1:061B  01063c00          add      word ptr [0x3c], ax
1:061F  11163e00          adc      word ptr [0x3e], dx
1:0623  a15600            mov      ax, word ptr [0x56]
1:0626  01065000          add      word ptr [0x50], ax
1:062A  7908              jns      0x634
1:062C  c70656000100      mov      word ptr [0x56], 1
1:0632  eb13              jmp      0x647
1:0634  a13000            mov      ax, word ptr [0x30]
1:0637  48                dec      ax
1:0638  3b065000          cmp      ax, word ptr [0x50]
1:063C  7c03              jl       0x641
1:063E  e98a00            jmp      0x6cb
1:0641  c7065600ffff      mov      word ptr [0x56], 0xffff
1:0647  2bc0              sub      ax, ax
1:0649  ba0100            mov      dx, 1
1:064C  52                push     dx
1:064D  50                push     ax
1:064E  a12e00            mov      ax, word ptr [0x2e]
1:0651  99                cdq      
1:0652  52                push     dx
1:0653  50                push     ax
1:0654  9a97060000        lcall    0, 0x697  ; @1:INT:ord_7(1:0E04)
1:0659  99                cdq      
1:065A  050080            add      ax, 0x8000
1:065D  83d200            adc      dx, 0
1:0660  52                push     dx
1:0661  50                push     ax
1:0662  9a0a070000        lcall    0, 0x70a  ; @1:INT:ord_4(1:0F10)
1:0667  52                push     dx
1:0668  50                push     ax
1:0669  9a84060000        lcall    0, 0x684  ; @1:INT:ord_6(1:0E76)
1:066E  8bc8              mov      cx, ax
1:0670  a13800            mov      ax, word ptr [0x38]
1:0673  8bda              mov      bx, dx
1:0675  99                cdq      
1:0676  03c1              add      ax, cx
1:0678  13d3              adc      dx, bx
1:067A  52                push     dx
1:067B  50                push     ax
1:067C  2bc0              sub      ax, ax
1:067E  baea00            mov      dx, 0xea
1:0681  52                push     dx
1:0682  50                push     ax
1:0683  9aac060000        lcall    0, 0x6ac  ; @1:INT:ord_6(1:0E76)
1:0688  a34000            mov      word ptr [0x40], ax
1:068B  89164200          mov      word ptr [0x42], dx
1:068F  2bc0              sub      ax, ax
1:0691  ba0100            mov      dx, 1
1:0694  52                push     dx
1:0695  50                push     ax
1:0696  9afc060000        lcall    0, 0x6fc  ; @1:INT:ord_7(1:0E04)
1:069B  99                cdq      
1:069C  050080            add      ax, 0x8000
1:069F  83d200            adc      dx, 0
1:06A2  b103              mov      cl, 3
1:06A4  9a4c070000        lcall    0, 0x74c  ; @1:INT:ord_8(1:0F42)
1:06A9  52                push     dx
1:06AA  50                push     ax
1:06AB  9ac0060000        lcall    0, 0x6c0  ; @1:INT:ord_6(1:0E76)
1:06B0  050100            add      ax, 1
1:06B3  83d200            adc      dx, 0
1:06B6  52                push     dx
1:06B7  50                push     ax
1:06B8  2bc0              sub      ax, ax
1:06BA  ba7500            mov      dx, 0x75
1:06BD  52                push     dx
1:06BE  50                push     ax
1:06BF  9a11070000        lcall    0, 0x711  ; @1:INT:ord_6(1:0E76)
1:06C4  a32400            mov      word ptr [0x24], ax
1:06C7  89162600          mov      word ptr [0x26], dx
1:06CB  a16200            mov      ax, word ptr [0x62]
1:06CE  01065c00          add      word ptr [0x5c], ax
1:06D2  7908              jns      0x6dc
1:06D4  c70662000100      mov      word ptr [0x62], 1
1:06DA  eb12              jmp      0x6ee
1:06DC  a13400            mov      ax, word ptr [0x34]
1:06DF  39065c00          cmp      word ptr [0x5c], ax
1:06E3  7f03              jg       0x6e8
1:06E5  e98a00            jmp      0x772
1:06E8  c7066200ffff      mov      word ptr [0x62], 0xffff
1:06EE  2bc0              sub      ax, ax
1:06F0  ba0100            mov      dx, 1
1:06F3  52                push     dx
1:06F4  50                push     ax
1:06F5  a12e00            mov      ax, word ptr [0x2e]
1:06F8  99                cdq      
1:06F9  52                push     dx
1:06FA  50                push     ax
1:06FB  9a3e070000        lcall    0, 0x73e  ; @1:INT:ord_7(1:0E04)
1:0700  99                cdq      
1:0701  050080            add      ax, 0x8000
1:0704  83d200            adc      dx, 0
1:0707  52                push     dx
1:0708  50                push     ax
1:0709  9a17010000        lcall    0, 0x117  ; @1:INT:ord_4(1:0F10)
1:070E  52                push     dx
1:070F  50                push     ax
1:0710  9a2b070000        lcall    0, 0x72b  ; @1:INT:ord_6(1:0E76)
1:0715  8bc8              mov      cx, ax
1:0717  a13800            mov      ax, word ptr [0x38]
1:071A  8bda              mov      bx, dx
1:071C  99                cdq      
1:071D  03c1              add      ax, cx
1:071F  13d3              adc      dx, bx
1:0721  52                push     dx
1:0722  50                push     ax
1:0723  2bc0              sub      ax, ax
1:0725  baea00            mov      dx, 0xea
1:0728  52                push     dx
1:0729  50                push     ax
1:072A  9a53070000        lcall    0, 0x753  ; @1:INT:ord_6(1:0E76)
1:072F  a34000            mov      word ptr [0x40], ax
1:0732  89164200          mov      word ptr [0x42], dx
1:0736  2bc0              sub      ax, ax
1:0738  ba0100            mov      dx, 1
1:073B  52                push     dx
1:073C  50                push     ax
1:073D  9a09010000        lcall    0, 0x109  ; @1:INT:ord_7(1:0E04)
1:0742  99                cdq      
1:0743  050080            add      ax, 0x8000
1:0746  83d200            adc      dx, 0
1:0749  b103              mov      cl, 3
1:074B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:0F42)
1:0750  52                push     dx
1:0751  50                push     ax
1:0752  9a1e010000        lcall    0, 0x11e  ; @1:INT:ord_6(1:0E76)
1:0757  050100            add      ax, 1
1:075A  83d200            adc      dx, 0
1:075D  52                push     dx
1:075E  50                push     ax
1:075F  2bc0              sub      ax, ax
1:0761  ba7500            mov      dx, 0x75
1:0764  52                push     dx
1:0765  50                push     ax
1:0766  9aa2090000        lcall    0, 0x9a2  ; @1:INT:ord_6(1:0E76)
1:076B  a32400            mov      word ptr [0x24], ax
1:076E  89162600          mov      word ptr [0x26], dx
1:0772  a15400            mov      ax, word ptr [0x54]
1:0775  01065200          add      word ptr [0x52], ax
1:0779  833e520003        cmp      word ptr [0x52], 3
1:077E  7c09              jl       0x789
1:0780  a13200            mov      ax, word ptr [0x32]
1:0783  39065200          cmp      word ptr [0x52], ax
1:0787  7e04              jle      0x78d
1:0789  f71e5400          neg      word ptr [0x54]
1:078D  a16000            mov      ax, word ptr [0x60]
1:0790  01065e00          add      word ptr [0x5e], ax
1:0794  833e5e0003        cmp      word ptr [0x5e], 3
1:0799  7c09              jl       0x7a4
1:079B  a13600            mov      ax, word ptr [0x36]
1:079E  39065e00          cmp      word ptr [0x5e], ax
1:07A2  7e04              jle      0x7a8
1:07A4  f71e6000          neg      word ptr [0x60]
1:07A8  ff06b404          inc      word ptr [0x4b4]
1:07AC  833eb4041e        cmp      word ptr [0x4b4], 0x1e
1:07B1  7c03              jl       0x7b6
1:07B3  e90e02            jmp      0x9c4
1:07B6  a12400            mov      ax, word ptr [0x24]
1:07B9  8b162600          mov      dx, word ptr [0x26]
1:07BD  03063c00          add      ax, word ptr [0x3c]
1:07C1  13163e00          adc      dx, word ptr [0x3e]
1:07C5  a32000            mov      word ptr [0x20], ax
1:07C8  89162200          mov      word ptr [0x22], dx
1:07CC  a15200            mov      ax, word ptr [0x52]
1:07CF  99                cdq      
1:07D0  52                push     dx
1:07D1  50                push     ax
1:07D2  a13c00            mov      ax, word ptr [0x3c]
1:07D5  8b163e00          mov      dx, word ptr [0x3e]
1:07D9  050080            add      ax, 0x8000
1:07DC  83d23a            adc      dx, 0x3a
1:07DF  52                push     dx
1:07E0  50                push     ax
1:07E1  9a06080000        lcall    0, 0x806  ; @1:INT:ord_9(1:0C6C)
1:07E6  5b                pop      bx
1:07E7  5b                pop      bx
1:07E8  52                push     dx
1:07E9  50                push     ax
1:07EA  9a0f080000        lcall    0, 0x80f  ; @1:INT:ord_4(1:0F10)
1:07EF  03165000          add      dx, word ptr [0x50]
1:07F3  89165800          mov      word ptr [0x58], dx
1:07F7  a15e00            mov      ax, word ptr [0x5e]
1:07FA  99                cdq      
1:07FB  52                push     dx
1:07FC  50                push     ax
1:07FD  ff363e00          push     word ptr [0x3e]
1:0801  ff363c00          push     word ptr [0x3c]
1:0805  9a31080000        lcall    0, 0x831  ; @1:INT:ord_9(1:0C6C)
1:080A  5b                pop      bx
1:080B  5b                pop      bx
1:080C  52                push     dx
1:080D  50                push     ax
1:080E  9a3a080000        lcall    0, 0x83a  ; @1:INT:ord_4(1:0F10)
1:0813  03165c00          add      dx, word ptr [0x5c]
1:0817  89166400          mov      word ptr [0x64], dx
1:081B  a15200            mov      ax, word ptr [0x52]
1:081E  99                cdq      
1:081F  52                push     dx
1:0820  50                push     ax
1:0821  a12000            mov      ax, word ptr [0x20]
1:0824  8b162200          mov      dx, word ptr [0x22]
1:0828  050080            add      ax, 0x8000
1:082B  83d23a            adc      dx, 0x3a
1:082E  52                push     dx
1:082F  50                push     ax
1:0830  9a55080000        lcall    0, 0x855  ; @1:INT:ord_9(1:0C6C)
1:0835  5b                pop      bx
1:0836  5b                pop      bx
1:0837  52                push     dx
1:0838  50                push     ax
1:0839  9a5e080000        lcall    0, 0x85e  ; @1:INT:ord_4(1:0F10)
1:083E  03165000          add      dx, word ptr [0x50]
1:0842  89164e00          mov      word ptr [0x4e], dx
1:0846  a15e00            mov      ax, word ptr [0x5e]
1:0849  99                cdq      
1:084A  52                push     dx
1:084B  50                push     ax
1:084C  ff362200          push     word ptr [0x22]
1:0850  ff362000          push     word ptr [0x20]
1:0854  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:0C6C)
1:0859  5b                pop      bx
1:085A  5b                pop      bx
1:085B  52                push     dx
1:085C  50                push     ax
1:085D  9aed030000        lcall    0, 0x3ed  ; @1:INT:ord_4(1:0F10)
1:0862  03165c00          add      dx, word ptr [0x5c]
1:0866  89165a00          mov      word ptr [0x5a], dx
1:086A  ff36b204          push     word ptr [0x4b2]
1:086E  ff36000b          push     word ptr [0xb00]
1:0872  9a280a0000        lcall    0, 0xa28  ; @1:GDI.SelectObject
1:0877  ff36b204          push     word ptr [0x4b2]
1:087B  8b1e4400          mov      bx, word ptr [0x44]
1:087F  d1e3              shl      bx, 1
1:0881  ffb7dc07          push     word ptr [bx + 0x7dc]
1:0885  ffb76c09          push     word ptr [bx + 0x96c]
1:0889  9ac0080000        lcall    0, 0x8c0  ; @1:GDI.MoveTo
1:088E  ff36b204          push     word ptr [0x4b2]
1:0892  8b1e4400          mov      bx, word ptr [0x44]
1:0896  d1e3              shl      bx, 1
1:0898  ffb7ba04          push     word ptr [bx + 0x4ba]
1:089C  ffb74a06          push     word ptr [bx + 0x64a]
1:08A0  9adf080000        lcall    0, 0x8df  ; @1:GDI.LineTo
1:08A5  ff36b204          push     word ptr [0x4b2]
1:08A9  a13000            mov      ax, word ptr [0x30]
1:08AC  8b1e4400          mov      bx, word ptr [0x44]
1:08B0  d1e3              shl      bx, 1
1:08B2  2b87dc07          sub      ax, word ptr [bx + 0x7dc]
1:08B6  50                push     ax
1:08B7  a13400            mov      ax, word ptr [0x34]
1:08BA  2b876c09          sub      ax, word ptr [bx + 0x96c]
1:08BE  50                push     ax
1:08BF  9afa080000        lcall    0, 0x8fa  ; @1:GDI.MoveTo
1:08C4  ff36b204          push     word ptr [0x4b2]
1:08C8  a13000            mov      ax, word ptr [0x30]
1:08CB  8b1e4400          mov      bx, word ptr [0x44]
1:08CF  d1e3              shl      bx, 1
1:08D1  2b87ba04          sub      ax, word ptr [bx + 0x4ba]
1:08D5  50                push     ax
1:08D6  a13400            mov      ax, word ptr [0x34]
1:08D9  2b874a06          sub      ax, word ptr [bx + 0x64a]
1:08DD  50                push     ax
1:08DE  9a15090000        lcall    0, 0x915  ; @1:GDI.LineTo
1:08E3  ff36b204          push     word ptr [0x4b2]
1:08E7  a13000            mov      ax, word ptr [0x30]
1:08EA  8b1e4400          mov      bx, word ptr [0x44]
1:08EE  d1e3              shl      bx, 1
1:08F0  2b87dc07          sub      ax, word ptr [bx + 0x7dc]
1:08F4  50                push     ax
1:08F5  ffb76c09          push     word ptr [bx + 0x96c]
1:08F9  9a30090000        lcall    0, 0x930  ; @1:GDI.MoveTo
1:08FE  ff36b204          push     word ptr [0x4b2]
1:0902  a13000            mov      ax, word ptr [0x30]
1:0905  8b1e4400          mov      bx, word ptr [0x44]
1:0909  d1e3              shl      bx, 1
1:090B  2b87ba04          sub      ax, word ptr [bx + 0x4ba]
1:090F  50                push     ax
1:0910  ffb74a06          push     word ptr [bx + 0x64a]
1:0914  9a4b090000        lcall    0, 0x94b  ; @1:GDI.LineTo
1:0919  ff36b204          push     word ptr [0x4b2]
1:091D  8b1e4400          mov      bx, word ptr [0x44]
1:0921  d1e3              shl      bx, 1
1:0923  ffb7dc07          push     word ptr [bx + 0x7dc]
1:0927  a13400            mov      ax, word ptr [0x34]
1:092A  2b876c09          sub      ax, word ptr [bx + 0x96c]
1:092E  50                push     ax
1:092F  9a45050000        lcall    0, 0x545  ; @1:GDI.MoveTo
1:0934  ff36b204          push     word ptr [0x4b2]
1:0938  8b1e4400          mov      bx, word ptr [0x44]
1:093C  d1e3              shl      bx, 1
1:093E  ffb7ba04          push     word ptr [bx + 0x4ba]
1:0942  a13400            mov      ax, word ptr [0x34]
1:0945  2b874a06          sub      ax, word ptr [bx + 0x64a]
1:0949  50                push     ax
1:094A  9a56050000        lcall    0, 0x556  ; @1:GDI.LineTo
1:094F  ff064400          inc      word ptr [0x44]
1:0953  813e4400c700      cmp      word ptr [0x44], 0xc7
1:0959  7606              jbe      0x961
1:095B  c70644000000      mov      word ptr [0x44], 0
1:0961  833e1e0002        cmp      word ptr [0x1e], 2
1:0966  754f              jne      0x9b7
1:0968  a11a00            mov      ax, word ptr [0x1a]
1:096B  01064600          add      word ptr [0x46], ax
1:096F  a14600            mov      ax, word ptr [0x46]
1:0972  99                cdq      
1:0973  3b162c00          cmp      dx, word ptr [0x2c]
1:0977  7c0e              jl       0x987
1:0979  7f06              jg       0x981
1:097B  3b062a00          cmp      ax, word ptr [0x2a]
1:097F  7606              jbe      0x987
1:0981  c70646000000      mov      word ptr [0x46], 0
1:0987  b8ffff            mov      ax, 0xffff
1:098A  a34c00            mov      word ptr [0x4c], ax
1:098D  a34a00            mov      word ptr [0x4a], ax
1:0990  ff362c00          push     word ptr [0x2c]
1:0994  ff362a00          push     word ptr [0x2a]
1:0998  b8feff            mov      ax, 0xfffe
1:099B  f7264600          mul      word ptr [0x46]
1:099F  52                push     dx
1:09A0  50                push     ax
1:09A1  9aaa040000        lcall    0, 0x4aa  ; @1:INT:ord_6(1:0E76)
1:09A6  a34800            mov      word ptr [0x48], ax
1:09A9  b8020b            mov      ax, 0xb02
1:09AC  50                push     ax
1:09AD  b84800            mov      ax, 0x48
1:09B0  50                push     ax
1:09B1  0e                push     cs
1:09B2  e8ccf8            call     0x281
1:09B5  5b                pop      bx
1:09B6  5b                pop      bx
1:09B7  833e1e0000        cmp      word ptr [0x1e], 0
1:09BC  7403              je       0x9c1
1:09BE  e943fb            jmp      0x504
1:09C1  e967fb            jmp      0x52b
1:09C4  2bc0              sub      ax, ax
1:09C6  4d                dec      bp
1:09C7  4d                dec      bp
1:09C8  8be5              mov      sp, bp
1:09CA  1f                pop      ds
1:09CB  5d                pop      bp
1:09CC  4d                dec      bp
1:09CD  cb                retf     

; ===== EXPORT:ord_16(#16) =====
1:09CE  1e                push     ds
1:09CF  58                pop      ax
1:09D0  90                nop      
1:09D1  45                inc      bp
1:09D2  55                push     bp
1:09D3  8bec              mov      bp, sp
1:09D5  1e                push     ds
1:09D6  8ed8              mov      ds, ax
1:09D8  b87204            mov      ax, 0x472
1:09DB  1e                push     ds
1:09DC  50                push     ax
1:09DD  2bc0              sub      ax, ax
1:09DF  50                push     ax
1:09E0  50                push     ax
1:09E1  c41e080b          les      bx, ptr [0xb08]
1:09E5  26ff7702          push     word ptr es:[bx + 2]
1:09E9  26ff7704          push     word ptr es:[bx + 4]
1:09ED  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:09F2  ff36b204          push     word ptr [0x4b2]
1:09F6  b87204            mov      ax, 0x472
1:09F9  1e                push     ds
1:09FA  50                push     ax
1:09FB  b80400            mov      ax, 4
1:09FE  50                push     ax
1:09FF  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:0A04  50                push     ax
1:0A05  9affff0000        lcall    0, 0xffff  ; @1:USER.FillRect
1:0A0A  b80a00            mov      ax, 0xa
1:0A0D  4d                dec      bp
1:0A0E  4d                dec      bp
1:0A0F  8be5              mov      sp, bp
1:0A11  1f                pop      ds
1:0A12  5d                pop      bp
1:0A13  4d                dec      bp
1:0A14  cb                retf     

; ===== EXPORT:ord_13(#13) =====
1:0A15  1e                push     ds
1:0A16  58                pop      ax
1:0A17  90                nop      
1:0A18  45                inc      bp
1:0A19  55                push     bp
1:0A1A  8bec              mov      bp, sp
1:0A1C  1e                push     ds
1:0A1D  8ed8              mov      ds, ax
1:0A1F  ff36b204          push     word ptr [0x4b2]
1:0A23  ff36fe0a          push     word ptr [0xafe]
1:0A27  9a34050000        lcall    0, 0x534  ; @1:GDI.SelectObject
1:0A2C  ff36da07          push     word ptr [0x7da]
1:0A30  9a3a0a0000        lcall    0, 0xa3a  ; @1:GDI.DeleteObject
1:0A35  ff36000b          push     word ptr [0xb00]
1:0A39  9a09050000        lcall    0, 0x509  ; @1:GDI.DeleteObject
1:0A3E  2bc0              sub      ax, ax
1:0A40  4d                dec      bp
1:0A41  4d                dec      bp
1:0A42  8be5              mov      sp, bp
1:0A44  1f                pop      ds
1:0A45  5d                pop      bp
1:0A46  4d                dec      bp
1:0A47  cb                retf     

; ===== EXPORT:ord_12(#12) =====
1:0A48  1e                push     ds
1:0A49  58                pop      ax
1:0A4A  90                nop      
1:0A4B  45                inc      bp
1:0A4C  55                push     bp
1:0A4D  8bec              mov      bp, sp
1:0A4F  1e                push     ds
1:0A50  8ed8              mov      ds, ax
1:0A52  2bc0              sub      ax, ax
1:0A54  4d                dec      bp
1:0A55  4d                dec      bp
1:0A56  8be5              mov      sp, bp
1:0A58  1f                pop      ds
1:0A59  5d                pop      bp
1:0A5A  4d                dec      bp
1:0A5B  cb                retf     

; ===== EXPORT:ord_11(#11) =====
1:0A5C  1e                push     ds
1:0A5D  58                pop      ax
1:0A5E  90                nop      
1:0A5F  45                inc      bp
1:0A60  55                push     bp
1:0A61  8bec              mov      bp, sp
1:0A63  1e                push     ds
1:0A64  8ed8              mov      ds, ax
1:0A66  2bc0              sub      ax, ax
1:0A68  4d                dec      bp
1:0A69  4d                dec      bp
1:0A6A  8be5              mov      sp, bp
1:0A6C  1f                pop      ds
1:0A6D  5d                pop      bp
1:0A6E  4d                dec      bp
1:0A6F  cb                retf     

; ===== EXPORT:ord_10(#10) =====
1:0A70  1e                push     ds
1:0A71  58                pop      ax
1:0A72  90                nop      
1:0A73  45                inc      bp
1:0A74  55                push     bp
1:0A75  8bec              mov      bp, sp
1:0A77  1e                push     ds
1:0A78  8ed8              mov      ds, ax
1:0A7A  2bc0              sub      ax, ax
1:0A7C  4d                dec      bp
1:0A7D  4d                dec      bp
1:0A7E  8be5              mov      sp, bp
1:0A80  1f                pop      ds
1:0A81  5d                pop      bp
1:0A82  4d                dec      bp
1:0A83  cb                retf     

; ===== EXPORT:ord_22(#22) =====
1:0A84  1e                push     ds
1:0A85  58                pop      ax
1:0A86  90                nop      
1:0A87  45                inc      bp
1:0A88  55                push     bp
1:0A89  8bec              mov      bp, sp
1:0A8B  1e                push     ds
1:0A8C  8ed8              mov      ds, ax
1:0A8E  837e0a00          cmp      word ptr [bp + 0xa], 0
1:0A92  7504              jne      0xa98
1:0A94  2bc0              sub      ax, ax
1:0A96  eb09              jmp      0xaa1
1:0A98  8b460e            mov      ax, word ptr [bp + 0xe]
1:0A9B  a3fc0a            mov      word ptr [0xafc], ax
1:0A9E  b80100            mov      ax, 1
1:0AA1  4d                dec      bp
1:0AA2  4d                dec      bp
1:0AA3  8be5              mov      sp, bp
1:0AA5  1f                pop      ds
1:0AA6  5d                pop      bp
1:0AA7  4d                dec      bp
1:0AA8  ca0a00            retf     0xa

; ===== EXPORT:WEP(#2) =====
1:0AAB  1e                push     ds
1:0AAC  58                pop      ax
1:0AAD  90                nop      
1:0AAE  45                inc      bp
1:0AAF  55                push     bp
1:0AB0  8bec              mov      bp, sp
1:0AB2  1e                push     ds
1:0AB3  8ed8              mov      ds, ax
1:0AB5  b80100            mov      ax, 1
1:0AB8  4d                dec      bp
1:0AB9  4d                dec      bp
1:0ABA  8be5              mov      sp, bp
1:0ABC  1f                pop      ds
1:0ABD  5d                pop      bp
1:0ABE  4d                dec      bp
1:0ABF  ca0200            retf     2

; ===== EXPORT:MODULE(#1) =====
1:0AC2  1e                push     ds
1:0AC3  58                pop      ax
1:0AC4  90                nop      
1:0AC5  45                inc      bp
1:0AC6  55                push     bp
1:0AC7  8bec              mov      bp, sp
1:0AC9  1e                push     ds
1:0ACA  8ed8              mov      ds, ax
1:0ACC  83ec0a            sub      sp, 0xa
1:0ACF  56                push     si
1:0AD0  8b4608            mov      ax, word ptr [bp + 8]
1:0AD3  a3b204            mov      word ptr [0x4b2], ax
1:0AD6  8b4606            mov      ax, word ptr [bp + 6]
1:0AD9  a3b004            mov      word ptr [0x4b0], ax
1:0ADC  50                push     ax
1:0ADD  9afd0a0000        lcall    0, 0xafd  ; @1:KERNEL.GlobalLock
1:0AE2  a3b604            mov      word ptr [0x4b6], ax
1:0AE5  8916b804          mov      word ptr [0x4b8], dx
1:0AE9  8bc2              mov      ax, dx
1:0AEB  0b06b604          or       ax, word ptr [0x4b6]
1:0AEF  7503              jne      0xaf4
1:0AF1  e96a01            jmp      0xc5e
1:0AF4  c41eb604          les      bx, ptr [0x4b6]
1:0AF8  26ff7720          push     word ptr es:[bx + 0x20]
1:0AFC  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalLock
1:0B01  a3080b            mov      word ptr [0xb08], ax
1:0B04  89160a0b          mov      word ptr [0xb0a], dx
1:0B08  8bc2              mov      ax, dx
1:0B0A  0b06080b          or       ax, word ptr [0xb08]
1:0B0E  7503              jne      0xb13
1:0B10  e94201            jmp      0xc55
1:0B13  8b460a            mov      ax, word ptr [bp + 0xa]
1:0B16  e90801            jmp      0xc21
1:0B19  c41eb604          les      bx, ptr [0x4b6]
1:0B1D  26837f1465        cmp      word ptr es:[bx + 0x14], 0x65
1:0B22  7c0f              jl       0xb33
1:0B24  26817f36f400      cmp      word ptr es:[bx + 0x36], 0xf4
1:0B2A  7507              jne      0xb33
1:0B2C  26837f3878        cmp      word ptr es:[bx + 0x38], 0x78
1:0B31  740e              je       0xb41
1:0B33  c70666000000      mov      word ptr [0x66], 0
1:0B39  c746fc0500        mov      word ptr [bp - 4], 5
1:0B3E  e90701            jmp      0xc48
1:0B41  c70666000100      mov      word ptr [0x66], 1
1:0B47  e9fe00            jmp      0xc48
1:0B4A  b87a04            mov      ax, 0x47a
1:0B4D  50                push     ax
1:0B4E  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_19(1:0D8E)
1:0B53  5b                pop      bx
1:0B54  ff367a04          push     word ptr [0x47a]
1:0B58  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_18(1:0DF0)
1:0B5D  5b                pop      bx
1:0B5E  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_17(1:0012)
1:0B63  eb13              jmp      0xb78
1:0B65  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_16(1:09CE)
1:0B6A  eb0c              jmp      0xb78
1:0B6C  833e660000        cmp      word ptr [0x66], 0
1:0B71  740b              je       0xb7e
1:0B73  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_15(1:0451)
1:0B78  8946fc            mov      word ptr [bp - 4], ax
1:0B7B  e9ca00            jmp      0xc48
1:0B7E  ff36b204          push     word ptr [0x4b2]
1:0B82  b800ff            mov      ax, 0xff00
1:0B85  baff00            mov      dx, 0xff
1:0B88  52                push     dx
1:0B89  50                push     ax
1:0B8A  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextColor
1:0B8F  ff36b204          push     word ptr [0x4b2]
1:0B93  2bc0              sub      ax, ax
1:0B95  50                push     ax
1:0B96  50                push     ax
1:0B97  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkColor
1:0B9C  ff36b204          push     word ptr [0x4b2]
1:0BA0  2bc0              sub      ax, ax
1:0BA2  50                push     ax
1:0BA3  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextAlign
1:0BA8  ff36b204          push     word ptr [0x4b2]
1:0BAC  b80100            mov      ax, 1
1:0BAF  50                push     ax
1:0BB0  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkMode
1:0BB5  ff36b204          push     word ptr [0x4b2]
1:0BB9  2bc0              sub      ax, ax
1:0BBB  50                push     ax
1:0BBC  50                push     ax
1:0BBD  b86800            mov      ax, 0x68
1:0BC0  1e                push     ds
1:0BC1  50                push     ax
1:0BC2  50                push     ax
1:0BC3  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_14(1:0D72)
1:0BC8  5b                pop      bx
1:0BC9  50                push     ax
1:0BCA  9affff0000        lcall    0, 0xffff  ; @1:GDI.TextOut
1:0BCF  eb77              jmp      0xc48
1:0BD1  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_13(1:0A15)
1:0BD6  eba0              jmp      0xb78
1:0BD8  a1fc0a            mov      ax, word ptr [0xafc]
1:0BDB  c41e080b          les      bx, ptr [0xb08]
1:0BDF  26894716          mov      word ptr es:[bx + 0x16], ax
1:0BE3  c746f60000        mov      word ptr [bp - 0xa], 0
1:0BE8  8b46f6            mov      ax, word ptr [bp - 0xa]
1:0BEB  8bf0              mov      si, ax
1:0BED  d1e6              shl      si, 1
1:0BEF  40                inc      ax
1:0BF0  c41e080b          les      bx, ptr [0xb08]
1:0BF4  2689400e          mov      word ptr es:[bx + si + 0xe], ax
1:0BF8  ff46f6            inc      word ptr [bp - 0xa]
1:0BFB  837ef604          cmp      word ptr [bp - 0xa], 4
1:0BFF  7ce7              jl       0xbe8
1:0C01  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:0A48)
1:0C06  e96fff            jmp      0xb78
1:0C09  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:0A5C)
1:0C0E  e967ff            jmp      0xb78
1:0C11  8b460a            mov      ax, word ptr [bp + 0xa]
1:0C14  2d0700            sub      ax, 7
1:0C17  50                push     ax
1:0C18  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:0A70)
1:0C1D  5b                pop      bx
1:0C1E  e957ff            jmp      0xb78
1:0C21  3d0c00            cmp      ax, 0xc
1:0C24  7722              ja       0xc48
1:0C26  d1e0              shl      ax, 1
1:0C28  93                xchg     bx, ax
1:0C29  2effa72e0c        jmp      word ptr cs:[bx + 0xc2e]
1:0C2E  4a                dec      dx
1:0C2F  0b650b            or       sp, word ptr [di + 0xb]
1:0C32  6c                insb     byte ptr es:[di], dx
1:0C33  0bd1              or       dx, cx
1:0C35  0b480c            or       cx, word ptr [bx + si + 0xc]
1:0C38  d80b              fmul     dword ptr [bp + di]
1:0C3A  090c              or       word ptr [si], cx
1:0C3C  110c              adc      word ptr [si], cx
1:0C3E  110c              adc      word ptr [si], cx
1:0C40  110c              adc      word ptr [si], cx
1:0C42  110c              adc      word ptr [si], cx
1:0C44  48                dec      ax
1:0C45  0c19              or       al, 0x19
1:0C47  0bc4              or       ax, sp
1:0C49  1e                push     ds
1:0C4A  b604              mov      dh, 4
1:0C4C  26ff7720          push     word ptr es:[bx + 0x20]
1:0C50  9a5a0c0000        lcall    0, 0xc5a  ; @1:KERNEL.GlobalUnlock
1:0C55  ff36b004          push     word ptr [0x4b0]
1:0C59  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalUnlock
1:0C5E  8b46fc            mov      ax, word ptr [bp - 4]
1:0C61  5e                pop      si
1:0C62  4d                dec      bp
1:0C63  4d                dec      bp
1:0C64  8be5              mov      sp, bp
1:0C66  1f                pop      ds
1:0C67  5d                pop      bp
1:0C68  4d                dec      bp
1:0C69  ca0600            retf     6

; ===== EXPORT:ord_9(#9) =====
1:0C6C  1e                push     ds
1:0C6D  58                pop      ax
1:0C6E  90                nop      
1:0C6F  45                inc      bp
1:0C70  55                push     bp
1:0C71  8bec              mov      bp, sp
1:0C73  1e                push     ds
1:0C74  8ed8              mov      ds, ax
1:0C76  83ec12            sub      sp, 0x12
1:0C79  837e0800          cmp      word ptr [bp + 8], 0
1:0C7D  7f19              jg       0xc98
1:0C7F  7c06              jl       0xc87
1:0C81  837e0600          cmp      word ptr [bp + 6], 0
1:0C85  7511              jne      0xc98
1:0C87  2bc0              sub      ax, ax
1:0C89  ba7500            mov      dx, 0x75
1:0C8C  2b4606            sub      ax, word ptr [bp + 6]
1:0C8F  1b5608            sbb      dx, word ptr [bp + 8]
1:0C92  894606            mov      word ptr [bp + 6], ax
1:0C95  895608            mov      word ptr [bp + 8], dx
1:0C98  2bc0              sub      ax, ax
1:0C9A  baea00            mov      dx, 0xea
1:0C9D  52                push     dx
1:0C9E  50                push     ax
1:0C9F  8d4606            lea      ax, [bp + 6]
1:0CA2  16                push     ss
1:0CA3  50                push     ax
1:0CA4  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_21(1:0E34)
1:0CA9  8946ee            mov      word ptr [bp - 0x12], ax
1:0CAC  83fa75            cmp      dx, 0x75
1:0CAF  7c0b              jl       0xcbc
1:0CB1  7f04              jg       0xcb7
1:0CB3  0bc0              or       ax, ax
1:0CB5  7405              je       0xcbc
1:0CB7  b80100            mov      ax, 1
1:0CBA  eb02              jmp      0xcbe
1:0CBC  2bc0              sub      ax, ax
1:0CBE  8946fc            mov      word ptr [bp - 4], ax
1:0CC1  0bc0              or       ax, ax
1:0CC3  740f              je       0xcd4
1:0CC5  8b46ee            mov      ax, word ptr [bp - 0x12]
1:0CC8  2d0000            sub      ax, 0
1:0CCB  83da75            sbb      dx, 0x75
1:0CCE  894606            mov      word ptr [bp + 6], ax
1:0CD1  895608            mov      word ptr [bp + 8], dx
1:0CD4  8b4606            mov      ax, word ptr [bp + 6]
1:0CD7  8946fa            mov      word ptr [bp - 6], ax
1:0CDA  b010              mov      al, 0x10
1:0CDC  50                push     ax
1:0CDD  8d4606            lea      ax, [bp + 6]
1:0CE0  16                push     ss
1:0CE1  50                push     ax
1:0CE2  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_20(1:0E56)
1:0CE7  0bd2              or       dx, dx
1:0CE9  7d0d              jge      0xcf8
1:0CEB  f7d8              neg      ax
1:0CED  83d200            adc      dx, 0
1:0CF0  f7da              neg      dx
1:0CF2  894606            mov      word ptr [bp + 6], ax
1:0CF5  895608            mov      word ptr [bp + 8], dx
1:0CF8  8b5e06            mov      bx, word ptr [bp + 6]
1:0CFB  d1e3              shl      bx, 1
1:0CFD  8b879c00          mov      ax, word ptr [bx + 0x9c]
1:0D01  8946f6            mov      word ptr [bp - 0xa], ax
1:0D04  c746f80000        mov      word ptr [bp - 8], 0
1:0D09  83460601          add      word ptr [bp + 6], 1
1:0D0D  83560800          adc      word ptr [bp + 8], 0
1:0D11  8b4606            mov      ax, word ptr [bp + 6]
1:0D14  8bd8              mov      bx, ax
1:0D16  d1e3              shl      bx, 1
1:0D18  8b879c00          mov      ax, word ptr [bx + 0x9c]
1:0D1C  2bd2              sub      dx, dx
1:0D1E  8b4efa            mov      cx, word ptr [bp - 6]