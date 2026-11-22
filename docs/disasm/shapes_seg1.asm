File: raw\unpacked\MODULES\SHAPES.AD
Module: 'shapes' ('Graphics Module Library')
CS:IP=1:0CB4  SS:SP=0:0000  AutoDS=2  Heap=1024  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (3): KERNEL, GDI, USER
Segments (2):
  SEG  1: CODE off=0x00600 len=0x0CE6 min=0x0CE6 flags=0x0D50 relocs=71
  SEG  2: DATA off=0x01460 len=0x038E min=0x038E flags=0x0C71 relocs=0
Exports (28):
  ord   1: SEG1:0316 flags=0x03 MODULE
  ord   2: SEG1:02FF flags=0x03 WEP
  ord   3: SEG1:0CA0 flags=0x03 ___EXPORTEDSTUB
  ord   4: SEG1:0564 flags=0x00 
  ord   5: SEG1:029E flags=0x00 
  ord   6: SEG1:028A flags=0x00 
  ord   7: SEG1:0261 flags=0x00 
  ord   8: SEG1:0210 flags=0x00 
  ord   9: SEG1:04D2 flags=0x00 
  ord  10: SEG1:0084 flags=0x00 
  ord  11: SEG1:0026 flags=0x00 
  ord  12: SEG1:0012 flags=0x00 
  ord  13: SEG1:0550 flags=0x00 
  ord  14: SEG1:04EE flags=0x00 
  ord  15: SEG1:02D8 flags=0x00 
  ord  16: SEG1:0594 flags=0x00 
  ord  17: SEG1:0698 flags=0x00 
  ord  18: SEG1:080A flags=0x00 
  ord  19: SEG1:06CA flags=0x00 
  ord  20: SEG1:093C flags=0x00 
  ord  21: SEG1:0964 flags=0x00 
  ord  22: SEG1:0A06 flags=0x00 
  ord  23: SEG1:09CA flags=0x00 
  ord  24: SEG1:0A30 flags=0x00 
  ord  25: SEG1:0968 flags=0x00 
  ord  26: SEG1:06E4 flags=0x00 
  ord  27: SEG1:0BD4 flags=0x00 
  ord  28: SEG1:0C90 flags=0x00 
Resources (7):
  TYPE_1000        #1               off=0x01820 len=    32
  TYPE_1000        #2               off=0x01840 len=    32
  TYPE_1000        #3               off=0x01860 len=    32
  TYPE_1000        #4               off=0x01880 len=    32
  TYPE_2000        #10              off=0x018A0 len=    64
  TYPE_2000        #20              off=0x018E0 len=    16
  TYPE_2000        #30              off=0x018F0 len=   288

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
1:001E  4d                dec      bp
1:001F  4d                dec      bp
1:0020  8be5              mov      sp, bp
1:0022  1f                pop      ds
1:0023  5d                pop      bp
1:0024  4d                dec      bp
1:0025  cb                retf     

; ===== EXPORT:ord_11(#11) =====
1:0026  1e                push     ds
1:0027  58                pop      ax
1:0028  90                nop      
1:0029  45                inc      bp
1:002A  55                push     bp
1:002B  8bec              mov      bp, sp
1:002D  1e                push     ds
1:002E  8ed8              mov      ds, ax
1:0030  c41e8a03          les      bx, ptr [0x38a]
1:0034  26837f0600        cmp      word ptr es:[bx + 6], 0
1:0039  742e              je       0x69
1:003B  b83003            mov      ax, 0x330
1:003E  1e                push     ds
1:003F  50                push     ax
1:0040  2bc0              sub      ax, ax
1:0042  50                push     ax
1:0043  50                push     ax
1:0044  26ff7702          push     word ptr es:[bx + 2]
1:0048  26ff7704          push     word ptr es:[bx + 4]
1:004C  9a3b020000        lcall    0, 0x23b  ; @1:USER.SetRect
1:0051  ff368203          push     word ptr [0x382]
1:0055  b83003            mov      ax, 0x330
1:0058  1e                push     ds
1:0059  50                push     ax
1:005A  b80400            mov      ax, 4
1:005D  50                push     ax
1:005E  9a9c000000        lcall    0, 0x9c  ; @1:GDI.GetStockObject
1:0063  50                push     ax
1:0064  9a53020000        lcall    0, 0x253  ; @1:USER.FillRect
1:0069  c41e8a03          les      bx, ptr [0x38a]
1:006D  26837f0800        cmp      word ptr es:[bx + 8], 0
1:0072  7405              je       0x79
1:0074  b80b00            mov      ax, 0xb
1:0077  eb03              jmp      0x7c
1:0079  b80c00            mov      ax, 0xc
1:007C  4d                dec      bp
1:007D  4d                dec      bp
1:007E  8be5              mov      sp, bp
1:0080  1f                pop      ds
1:0081  5d                pop      bp
1:0082  4d                dec      bp
1:0083  cb                retf     

; ===== EXPORT:ord_10(#10) =====
1:0084  1e                push     ds
1:0085  58                pop      ax
1:0086  90                nop      
1:0087  45                inc      bp
1:0088  55                push     bp
1:0089  8bec              mov      bp, sp
1:008B  1e                push     ds
1:008C  8ed8              mov      ds, ax
1:008E  83ec10            sub      sp, 0x10
1:0091  57                push     di
1:0092  56                push     si
1:0093  ff368203          push     word ptr [0x382]
1:0097  b80800            mov      ax, 8
1:009A  50                push     ax
1:009B  9a4d020000        lcall    0, 0x24d  ; @1:GDI.GetStockObject
1:00A0  50                push     ax
1:00A1  9a2b010000        lcall    0, 0x12b  ; @1:GDI.SelectObject
1:00A6  8946f2            mov      word ptr [bp - 0xe], ax
1:00A9  c41e8403          les      bx, ptr [0x384]
1:00AD  26837f0a01        cmp      word ptr es:[bx + 0xa], 1
1:00B2  740b              je       0xbf
1:00B4  c41e8a03          les      bx, ptr [0x38a]
1:00B8  26837f0800        cmp      word ptr es:[bx + 8], 0
1:00BD  7526              jne      0xe5
1:00BF  9aea000000        lcall    0, 0xea  ; @1:INT:ord_4(1:0564)
1:00C4  b9ff00            mov      cx, 0xff
1:00C7  99                cdq      
1:00C8  f7f9              idiv     cx
1:00CA  8956fc            mov      word ptr [bp - 4], dx
1:00CD  ff368203          push     word ptr [0x382]
1:00D1  8a66fc            mov      ah, byte ptr [bp - 4]
1:00D4  2ac0              sub      al, al
1:00D6  8acc              mov      cl, ah
1:00D8  2aed              sub      ch, ch
1:00DA  8bd1              mov      dx, cx
1:00DC  0bc8              or       cx, ax
1:00DE  80ce02            or       dh, 2
1:00E1  52                push     dx
1:00E2  51                push     cx
1:00E3  eb3f              jmp      0x124
1:00E5  ff368203          push     word ptr [0x382]
1:00E9  9af1000000        lcall    0, 0xf1  ; @1:INT:ord_4(1:0564)
1:00EE  8bf0              mov      si, ax
1:00F0  9af8000000        lcall    0, 0xf8  ; @1:INT:ord_4(1:0564)
1:00F5  8bf8              mov      di, ax
1:00F7  9a33010000        lcall    0, 0x133  ; @1:INT:ord_4(1:0564)
1:00FC  b9ff00            mov      cx, 0xff
1:00FF  8bd0              mov      dx, ax
1:0101  8bc6              mov      ax, si
1:0103  8bda              mov      bx, dx
1:0105  99                cdq      
1:0106  f7f9              idiv     cx
1:0108  8bc7              mov      ax, di
1:010A  8bf2              mov      si, dx
1:010C  99                cdq      
1:010D  f7f9              idiv     cx
1:010F  8bc3              mov      ax, bx
1:0111  8bda              mov      bx, dx
1:0113  99                cdq      
1:0114  f7f9              idiv     cx
1:0116  8af2              mov      dh, dl
1:0118  2ad2              sub      dl, dl
1:011A  2aff              sub      bh, bh
1:011C  0bd3              or       dx, bx
1:011E  8bc6              mov      ax, si
1:0120  b402              mov      ah, 2
1:0122  50                push     ax
1:0123  52                push     dx
1:0124  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateSolidBrush
1:0129  50                push     ax
1:012A  9aee010000        lcall    0, 0x1ee  ; @1:GDI.SelectObject
1:012F  8946f0            mov      word ptr [bp - 0x10], ax
1:0132  9a4c010000        lcall    0, 0x14c  ; @1:INT:ord_4(1:0564)
1:0137  c41e8a03          les      bx, ptr [0x38a]
1:013B  268b4f02          mov      cx, word ptr es:[bx + 2]
1:013F  83c150            add      cx, 0x50
1:0142  99                cdq      
1:0143  f7f9              idiv     cx
1:0145  83ea64            sub      dx, 0x64
1:0148  8956f4            mov      word ptr [bp - 0xc], dx
1:014B  9a65010000        lcall    0, 0x165  ; @1:INT:ord_4(1:0564)
1:0150  c41e8a03          les      bx, ptr [0x38a]
1:0154  268b4f04          mov      cx, word ptr es:[bx + 4]
1:0158  83c150            add      cx, 0x50
1:015B  99                cdq      
1:015C  f7f9              idiv     cx
1:015E  83ea64            sub      dx, 0x64
1:0161  8956f6            mov      word ptr [bp - 0xa], dx
1:0164  9a88010000        lcall    0, 0x188  ; @1:INT:ord_4(1:0564)
1:0169  c41e8a03          les      bx, ptr [0x38a]
1:016D  8bc8              mov      cx, ax
1:016F  268b4702          mov      ax, word ptr es:[bx + 2]
1:0173  99                cdq      
1:0174  2bc2              sub      ax, dx
1:0176  d1f8              sar      ax, 1
1:0178  8bd0              mov      dx, ax
1:017A  8bc1              mov      ax, cx
1:017C  8bca              mov      cx, dx
1:017E  99                cdq      
1:017F  f7f9              idiv     cx
1:0181  0356f4            add      dx, word ptr [bp - 0xc]
1:0184  8956f8            mov      word ptr [bp - 8], dx
1:0187  9aab010000        lcall    0, 0x1ab  ; @1:INT:ord_4(1:0564)
1:018C  c41e8a03          les      bx, ptr [0x38a]
1:0190  8bc8              mov      cx, ax
1:0192  268b4704          mov      ax, word ptr es:[bx + 4]
1:0196  99                cdq      
1:0197  2bc2              sub      ax, dx
1:0199  d1f8              sar      ax, 1
1:019B  8bd0              mov      dx, ax
1:019D  8bc1              mov      ax, cx
1:019F  8bca              mov      cx, dx
1:01A1  99                cdq      
1:01A2  f7f9              idiv     cx
1:01A4  0356f6            add      dx, word ptr [bp - 0xa]
1:01A7  8956fa            mov      word ptr [bp - 6], dx
1:01AA  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_4(1:0564)
1:01AF  b96400            mov      cx, 0x64
1:01B2  99                cdq      
1:01B3  f7f9              idiv     cx
1:01B5  83fa32            cmp      dx, 0x32
1:01B8  7d17              jge      0x1d1
1:01BA  ff368203          push     word ptr [0x382]
1:01BE  ff76f4            push     word ptr [bp - 0xc]
1:01C1  ff76f6            push     word ptr [bp - 0xa]
1:01C4  ff76f8            push     word ptr [bp - 8]
1:01C7  ff76fa            push     word ptr [bp - 6]
1:01CA  9affff0000        lcall    0, 0xffff  ; @1:GDI.Ellipse
1:01CF  eb15              jmp      0x1e6
1:01D1  ff368203          push     word ptr [0x382]
1:01D5  ff76f4            push     word ptr [bp - 0xc]
1:01D8  ff76f6            push     word ptr [bp - 0xa]
1:01DB  ff76f8            push     word ptr [bp - 8]
1:01DE  ff76fa            push     word ptr [bp - 6]
1:01E1  9affff0000        lcall    0, 0xffff  ; @1:GDI.Rectangle
1:01E6  ff368203          push     word ptr [0x382]
1:01EA  ff76f2            push     word ptr [bp - 0xe]
1:01ED  9afa010000        lcall    0, 0x1fa  ; @1:GDI.SelectObject
1:01F2  ff368203          push     word ptr [0x382]
1:01F6  ff76f0            push     word ptr [bp - 0x10]
1:01F9  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectObject
1:01FE  50                push     ax
1:01FF  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteObject
1:0204  2bc0              sub      ax, ax
1:0206  5e                pop      si
1:0207  5f                pop      di
1:0208  4d                dec      bp
1:0209  4d                dec      bp
1:020A  8be5              mov      sp, bp
1:020C  1f                pop      ds
1:020D  5d                pop      bp
1:020E  4d                dec      bp
1:020F  cb                retf     

; ===== EXPORT:ord_8(#8) =====
1:0210  1e                push     ds
1:0211  58                pop      ax
1:0212  90                nop      
1:0213  45                inc      bp
1:0214  55                push     bp
1:0215  8bec              mov      bp, sp
1:0217  1e                push     ds
1:0218  8ed8              mov      ds, ax
1:021A  c41e8403          les      bx, ptr [0x384]
1:021E  26837f2800        cmp      word ptr es:[bx + 0x28], 0
1:0223  7532              jne      0x257
1:0225  b83803            mov      ax, 0x338
1:0228  1e                push     ds
1:0229  50                push     ax
1:022A  2bc0              sub      ax, ax
1:022C  50                push     ax
1:022D  50                push     ax
1:022E  c41e8a03          les      bx, ptr [0x38a]
1:0232  26ff7702          push     word ptr es:[bx + 2]
1:0236  26ff7704          push     word ptr es:[bx + 4]
1:023A  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:023F  ff368203          push     word ptr [0x382]
1:0243  b83803            mov      ax, 0x338
1:0246  1e                push     ds
1:0247  50                push     ax
1:0248  b80400            mov      ax, 4
1:024B  50                push     ax
1:024C  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:0251  50                push     ax
1:0252  9affff0000        lcall    0, 0xffff  ; @1:USER.FillRect
1:0257  2bc0              sub      ax, ax
1:0259  4d                dec      bp
1:025A  4d                dec      bp
1:025B  8be5              mov      sp, bp
1:025D  1f                pop      ds
1:025E  5d                pop      bp
1:025F  4d                dec      bp
1:0260  cb                retf     

; ===== EXPORT:ord_7(#7) =====
1:0261  1e                push     ds
1:0262  58                pop      ax
1:0263  90                nop      
1:0264  45                inc      bp
1:0265  55                push     bp
1:0266  8bec              mov      bp, sp
1:0268  1e                push     ds
1:0269  8ed8              mov      ds, ax
1:026B  c41e8403          les      bx, ptr [0x384]
1:026F  26837f0a01        cmp      word ptr es:[bx + 0xa], 1
1:0274  750a              jne      0x280
1:0276  c41e8a03          les      bx, ptr [0x38a]
1:027A  26c747100000      mov      word ptr es:[bx + 0x10], 0
1:0280  2bc0              sub      ax, ax
1:0282  4d                dec      bp
1:0283  4d                dec      bp
1:0284  8be5              mov      sp, bp
1:0286  1f                pop      ds
1:0287  5d                pop      bp
1:0288  4d                dec      bp
1:0289  cb                retf     

; ===== EXPORT:ord_6(#6) =====
1:028A  1e                push     ds
1:028B  58                pop      ax
1:028C  90                nop      
1:028D  45                inc      bp
1:028E  55                push     bp
1:028F  8bec              mov      bp, sp
1:0291  1e                push     ds
1:0292  8ed8              mov      ds, ax
1:0294  2bc0              sub      ax, ax
1:0296  4d                dec      bp
1:0297  4d                dec      bp
1:0298  8be5              mov      sp, bp
1:029A  1f                pop      ds
1:029B  5d                pop      bp
1:029C  4d                dec      bp
1:029D  cb                retf     

; ===== EXPORT:ord_5(#5) =====
1:029E  1e                push     ds
1:029F  58                pop      ax
1:02A0  90                nop      
1:02A1  45                inc      bp
1:02A2  55                push     bp
1:02A3  8bec              mov      bp, sp
1:02A5  1e                push     ds
1:02A6  8ed8              mov      ds, ax
1:02A8  c41e8403          les      bx, ptr [0x384]
1:02AC  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:02B1  7404              je       0x2b7
1:02B3  2bc0              sub      ax, ax
1:02B5  eb19              jmp      0x2d0
1:02B7  8b4606            mov      ax, word ptr [bp + 6]
1:02BA  48                dec      ax
1:02BB  75f6              jne      0x2b3
1:02BD  c41e8a03          les      bx, ptr [0x38a]
1:02C1  26837f0800        cmp      word ptr es:[bx + 8], 0
1:02C6  7405              je       0x2cd
1:02C8  b80b00            mov      ax, 0xb
1:02CB  eb03              jmp      0x2d0
1:02CD  b80c00            mov      ax, 0xc
1:02D0  4d                dec      bp
1:02D1  4d                dec      bp
1:02D2  8be5              mov      sp, bp
1:02D4  1f                pop      ds
1:02D5  5d                pop      bp
1:02D6  4d                dec      bp
1:02D7  cb                retf     

; ===== EXPORT:ord_15(#15) =====
1:02D8  1e                push     ds
1:02D9  58                pop      ax
1:02DA  90                nop      
1:02DB  45                inc      bp
1:02DC  55                push     bp
1:02DD  8bec              mov      bp, sp
1:02DF  1e                push     ds
1:02E0  8ed8              mov      ds, ax
1:02E2  837e0a00          cmp      word ptr [bp + 0xa], 0
1:02E6  7504              jne      0x2ec
1:02E8  2bc0              sub      ax, ax
1:02EA  eb09              jmp      0x2f5
1:02EC  8b460e            mov      ax, word ptr [bp + 0xe]
1:02EF  a38803            mov      word ptr [0x388], ax
1:02F2  b80100            mov      ax, 1
1:02F5  4d                dec      bp
1:02F6  4d                dec      bp
1:02F7  8be5              mov      sp, bp
1:02F9  1f                pop      ds
1:02FA  5d                pop      bp
1:02FB  4d                dec      bp
1:02FC  ca0a00            retf     0xa

; ===== EXPORT:WEP(#2) =====
1:02FF  1e                push     ds
1:0300  58                pop      ax
1:0301  90                nop      
1:0302  45                inc      bp
1:0303  55                push     bp
1:0304  8bec              mov      bp, sp
1:0306  1e                push     ds
1:0307  8ed8              mov      ds, ax
1:0309  b80100            mov      ax, 1
1:030C  4d                dec      bp
1:030D  4d                dec      bp
1:030E  8be5              mov      sp, bp
1:0310  1f                pop      ds
1:0311  5d                pop      bp
1:0312  4d                dec      bp
1:0313  ca0200            retf     2

; ===== EXPORT:MODULE(#1) =====
1:0316  1e                push     ds
1:0317  58                pop      ax
1:0318  90                nop      
1:0319  45                inc      bp
1:031A  55                push     bp
1:031B  8bec              mov      bp, sp
1:031D  1e                push     ds
1:031E  8ed8              mov      ds, ax
1:0320  83ec0a            sub      sp, 0xa
1:0323  56                push     si
1:0324  8b4608            mov      ax, word ptr [bp + 8]
1:0327  a38203            mov      word ptr [0x382], ax
1:032A  8b4606            mov      ax, word ptr [bp + 6]
1:032D  a38003            mov      word ptr [0x380], ax
1:0330  50                push     ax
1:0331  9a51030000        lcall    0, 0x351  ; @1:KERNEL.GlobalLock
1:0336  a38403            mov      word ptr [0x384], ax
1:0339  89168603          mov      word ptr [0x386], dx
1:033D  8bc2              mov      ax, dx
1:033F  0b068403          or       ax, word ptr [0x384]
1:0343  7503              jne      0x348
1:0345  e96a01            jmp      0x4b2
1:0348  c41e8403          les      bx, ptr [0x384]
1:034C  26ff7720          push     word ptr es:[bx + 0x20]
1:0350  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalLock
1:0355  a38a03            mov      word ptr [0x38a], ax
1:0358  89168c03          mov      word ptr [0x38c], dx
1:035C  8bc2              mov      ax, dx
1:035E  0b068a03          or       ax, word ptr [0x38a]
1:0362  7503              jne      0x367
1:0364  e94201            jmp      0x4a9
1:0367  8b460a            mov      ax, word ptr [bp + 0xa]
1:036A  e90801            jmp      0x475
1:036D  c41e8403          les      bx, ptr [0x384]
1:0371  26837f1465        cmp      word ptr es:[bx + 0x14], 0x65
1:0376  7c0f              jl       0x387
1:0378  26817f36f400      cmp      word ptr es:[bx + 0x36], 0xf4
1:037E  7507              jne      0x387
1:0380  26837f3878        cmp      word ptr es:[bx + 0x38], 0x78
1:0385  740e              je       0x395
1:0387  c70610000000      mov      word ptr [0x10], 0
1:038D  c746fc0500        mov      word ptr [bp - 4], 5
1:0392  e90701            jmp      0x49c
1:0395  c70610000100      mov      word ptr [0x10], 1
1:039B  e9fe00            jmp      0x49c
1:039E  b84003            mov      ax, 0x340
1:03A1  50                push     ax
1:03A2  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_14(1:04EE)
1:03A7  5b                pop      bx
1:03A8  ff364003          push     word ptr [0x340]
1:03AC  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_13(1:0550)
1:03B1  5b                pop      bx
1:03B2  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:0012)
1:03B7  eb13              jmp      0x3cc
1:03B9  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:0026)
1:03BE  eb0c              jmp      0x3cc
1:03C0  833e100000        cmp      word ptr [0x10], 0
1:03C5  740b              je       0x3d2
1:03C7  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:0084)
1:03CC  8946fc            mov      word ptr [bp - 4], ax
1:03CF  e9ca00            jmp      0x49c
1:03D2  ff368203          push     word ptr [0x382]
1:03D6  b800ff            mov      ax, 0xff00
1:03D9  baff00            mov      dx, 0xff
1:03DC  52                push     dx
1:03DD  50                push     ax
1:03DE  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextColor
1:03E3  ff368203          push     word ptr [0x382]
1:03E7  2bc0              sub      ax, ax
1:03E9  50                push     ax
1:03EA  50                push     ax
1:03EB  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkColor
1:03F0  ff368203          push     word ptr [0x382]
1:03F4  2bc0              sub      ax, ax
1:03F6  50                push     ax
1:03F7  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextAlign
1:03FC  ff368203          push     word ptr [0x382]
1:0400  b80100            mov      ax, 1
1:0403  50                push     ax
1:0404  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkMode
1:0409  ff368203          push     word ptr [0x382]
1:040D  2bc0              sub      ax, ax
1:040F  50                push     ax
1:0410  50                push     ax
1:0411  b81200            mov      ax, 0x12
1:0414  1e                push     ds
1:0415  50                push     ax
1:0416  50                push     ax
1:0417  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:04D2)
1:041C  5b                pop      bx
1:041D  50                push     ax
1:041E  9affff0000        lcall    0, 0xffff  ; @1:GDI.TextOut
1:0423  eb77              jmp      0x49c
1:0425  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:0210)
1:042A  eba0              jmp      0x3cc
1:042C  a18803            mov      ax, word ptr [0x388]
1:042F  c41e8a03          les      bx, ptr [0x38a]
1:0433  26894716          mov      word ptr es:[bx + 0x16], ax
1:0437  c746f60000        mov      word ptr [bp - 0xa], 0
1:043C  8b46f6            mov      ax, word ptr [bp - 0xa]
1:043F  8bf0              mov      si, ax
1:0441  d1e6              shl      si, 1
1:0443  40                inc      ax
1:0444  c41e8a03          les      bx, ptr [0x38a]
1:0448  2689400e          mov      word ptr es:[bx + si + 0xe], ax
1:044C  ff46f6            inc      word ptr [bp - 0xa]
1:044F  837ef604          cmp      word ptr [bp - 0xa], 4
1:0453  7ce7              jl       0x43c
1:0455  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:0261)
1:045A  e96fff            jmp      0x3cc
1:045D  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_6(1:028A)
1:0462  e967ff            jmp      0x3cc
1:0465  8b460a            mov      ax, word ptr [bp + 0xa]
1:0468  2d0700            sub      ax, 7
1:046B  50                push     ax
1:046C  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_5(1:029E)
1:0471  5b                pop      bx
1:0472  e957ff            jmp      0x3cc
1:0475  3d0c00            cmp      ax, 0xc
1:0478  7722              ja       0x49c
1:047A  d1e0              shl      ax, 1
1:047C  93                xchg     bx, ax
1:047D  2effa78204        jmp      word ptr cs:[bx + 0x482]
1:0482  9e                sahf     
1:0483  03b903c0          add      di, word ptr [bx + di - 0x3ffd]
1:0487  0325              add      sp, word ptr [di]
1:0489  049c              add      al, 0x9c
1:048B  042c              add      al, 0x2c
1:048D  045d              add      al, 0x5d
1:048F  0465              add      al, 0x65
1:0491  0465              add      al, 0x65
1:0493  0465              add      al, 0x65
1:0495  0465              add      al, 0x65
1:0497  049c              add      al, 0x9c
1:0499  046d              add      al, 0x6d
1:049B  03c4              add      ax, sp
1:049D  1e                push     ds
1:049E  8403              test     byte ptr [bp + di], al
1:04A0  26ff7720          push     word ptr es:[bx + 0x20]
1:04A4  9aae040000        lcall    0, 0x4ae  ; @1:KERNEL.GlobalUnlock
1:04A9  ff368003          push     word ptr [0x380]
1:04AD  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalUnlock
1:04B2  8b46fc            mov      ax, word ptr [bp - 4]
1:04B5  5e                pop      si
1:04B6  4d                dec      bp
1:04B7  4d                dec      bp
1:04B8  8be5              mov      sp, bp
1:04BA  1f                pop      ds
1:04BB  5d                pop      bp
1:04BC  4d                dec      bp
1:04BD  ca0600            retf     6
1:04C0  0000              add      byte ptr [bx + si], al
1:04C2  0000              add      byte ptr [bx + si], al
1:04C4  0000              add      byte ptr [bx + si], al
1:04C6  0000              add      byte ptr [bx + si], al
1:04C8  0000              add      byte ptr [bx + si], al
1:04CA  0000              add      byte ptr [bx + si], al
1:04CC  0000              add      byte ptr [bx + si], al
1:04CE  0000              add      byte ptr [bx + si], al
1:04D0  c3                ret      
1:04D1  00558b            add      byte ptr [di - 0x75], dl
1:04D4  ec                in       al, dx
1:04D5  8bd7              mov      dx, di
1:04D7  8cd8              mov      ax, ds
1:04D9  8ec0              mov      es, ax
1:04DB  8b7e06            mov      di, word ptr [bp + 6]
1:04DE  33c0              xor      ax, ax
1:04E0  b9ffff            mov      cx, 0xffff
1:04E3  f2ae              repne scasb al, byte ptr es:[di]
1:04E5  f7d1              not      cx
1:04E7  49                dec      cx
1:04E8  91                xchg     cx, ax
1:04E9  8bfa              mov      di, dx
1:04EB  5d                pop      bp
1:04EC  cb                retf     
1:04ED  008cd890          add      byte ptr [si - 0x6f28], cl
1:04F1  45                inc      bp
1:04F2  55                push     bp
1:04F3  8bec              mov      bp, sp
1:04F5  1e                push     ds
1:04F6  8ed8              mov      ds, ax
1:04F8  56                push     si
1:04F9  b42a              mov      ah, 0x2a
1:04FB  cd21              int      0x21
1:04FD  8bda              mov      bx, dx
1:04FF  8bf1              mov      si, cx
1:0501  b42c              mov      ah, 0x2c
1:0503  cd21              int      0x21
1:0505  b400              mov      ah, 0
1:0507  8ac6              mov      al, dh
1:0509  50                push     ax
1:050A  8ac1              mov      al, cl
1:050C  50                push     ax
1:050D  8ac5              mov      al, ch
1:050F  50                push     ax
1:0510  50                push     ax
1:0511  b42a              mov      ah, 0x2a
1:0513  cd21              int      0x21
1:0515  3bda              cmp      bx, dx
1:0517  58                pop      ax
1:0518  7408              je       0x522
1:051A  3c17              cmp      al, 0x17
1:051C  7504              jne      0x522
1:051E  8bd3              mov      dx, bx
1:0520  8bce              mov      cx, si
1:0522  b400              mov      ah, 0
1:0524  8ac2              mov      al, dl
1:0526  50                push     ax
1:0527  8ac6              mov      al, dh
1:0529  50                push     ax
1:052A  81e9bc07          sub      cx, 0x7bc
1:052E  51                push     cx
1:052F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_16(1:0594)
1:0534  83c40c            add      sp, 0xc
1:0537  837e0600          cmp      word ptr [bp + 6], 0
1:053B  7408              je       0x545
1:053D  8b5e06            mov      bx, word ptr [bp + 6]
1:0540  895702            mov      word ptr [bx + 2], dx
1:0543  8907              mov      word ptr [bx], ax
1:0545  5e                pop      si
1:0546  83ed02            sub      bp, 2
1:0549  8be5              mov      sp, bp
1:054B  1f                pop      ds
1:054C  5d                pop      bp
1:054D  4d                dec      bp
1:054E  cb                retf     
1:054F  004555            add      byte ptr [di + 0x55], al
1:0552  8bec              mov      bp, sp
1:0554  8b4606            mov      ax, word ptr [bp + 6]
1:0557  a35200            mov      word ptr [0x52], ax
1:055A  c70654000000      mov      word ptr [0x54], 0
1:0560  5d                pop      bp
1:0561  4d                dec      bp
1:0562  cb                retf     
1:0563  90                nop      

; ===== EXPORT:ord_4(#4) =====
1:0564  45                inc      bp
1:0565  55                push     bp
1:0566  8bec              mov      bp, sp
1:0568  b8fd43            mov      ax, 0x43fd
1:056B  ba0300            mov      dx, 3
1:056E  52                push     dx
1:056F  50                push     ax
1:0570  ff365400          push     word ptr [0x54]