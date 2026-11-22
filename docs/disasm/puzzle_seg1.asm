File: raw\unpacked\MODULES\PUZZLE.AD
Module: 'PUZZLE' ('Graphics Module Library')
CS:IP=1:1194  SS:SP=0:0000  AutoDS=2  Heap=1024  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (4): KERNEL, GDI, USER, SOUND
Segments (2):
  SEG  1: CODE off=0x00600 len=0x11C6 min=0x11C6 flags=0x0D50 relocs=101
  SEG  2: DATA off=0x019A0 len=0x03EE min=0x03EE flags=0x0C71 relocs=0
Exports (29):
  ord   1: SEG1:07DC flags=0x03 MODULE
  ord   2: SEG1:07C5 flags=0x03 WEP
  ord   3: SEG1:1180 flags=0x03 ___EXPORTEDSTUB
  ord   4: SEG1:0A44 flags=0x00 
  ord   5: SEG1:0A20 flags=0x00 
  ord   6: SEG1:01C3 flags=0x00 
  ord   7: SEG1:01AF flags=0x00 
  ord   8: SEG1:019B flags=0x00 
  ord   9: SEG1:0187 flags=0x00 
  ord  10: SEG1:09A2 flags=0x00 
  ord  11: SEG1:0162 flags=0x00 
  ord  12: SEG1:014E flags=0x00 
  ord  13: SEG1:0012 flags=0x00 
  ord  14: SEG1:0A30 flags=0x00 
  ord  15: SEG1:09BE flags=0x00 
  ord  16: SEG1:079E flags=0x00 
  ord  17: SEG1:0A74 flags=0x00 
  ord  18: SEG1:0B78 flags=0x00 
  ord  19: SEG1:0CEA flags=0x00 
  ord  20: SEG1:0BAA flags=0x00 
  ord  21: SEG1:0E1C flags=0x00 
  ord  22: SEG1:0E44 flags=0x00 
  ord  23: SEG1:0EE6 flags=0x00 
  ord  24: SEG1:0EAA flags=0x00 
  ord  25: SEG1:0F10 flags=0x00 
  ord  26: SEG1:0E48 flags=0x00 
  ord  27: SEG1:0BC4 flags=0x00 
  ord  28: SEG1:10B4 flags=0x00 
  ord  29: SEG1:1170 flags=0x00 
Resources (7):
  TYPE_1000        #1               off=0x01DC0 len=    96
  TYPE_1000        #2               off=0x01E20 len=    96
  TYPE_1000        #3               off=0x01E80 len=    32
  TYPE_1000        #4               off=0x01EA0 len=    32
  TYPE_2000        #10              off=0x01EC0 len=    64
  TYPE_2000        #20              off=0x01F00 len=    16
  TYPE_2000        #30              off=0x01F10 len=   336

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
1:001C  83ec04            sub      sp, 4
1:001F  c706e6030100      mov      word ptr [0x3e6], 1
1:0025  c41eea03          les      bx, ptr [0x3ea]
1:0029  268b4706          mov      ax, word ptr es:[bx + 6]
1:002D  eb3c              jmp      0x6b
1:002F  c70612001000      mov      word ptr [0x12], 0x10
1:0035  c41eea03          les      bx, ptr [0x3ea]
1:0039  26817f04e001      cmp      word ptr es:[bx + 4], 0x1e0
1:003F  7d34              jge      0x75
1:0041  c70612000a00      mov      word ptr [0x12], 0xa
1:0047  eb2c              jmp      0x75
1:0049  c70612000800      mov      word ptr [0x12], 8
1:004F  ebe4              jmp      0x35
1:0051  c70612000400      mov      word ptr [0x12], 4
1:0057  c41eea03          les      bx, ptr [0x3ea]
1:005B  26817f04e001      cmp      word ptr es:[bx + 4], 0x1e0
1:0061  7d12              jge      0x75
1:0063  c70612000500      mov      word ptr [0x12], 5
1:0069  eb0a              jmp      0x75
1:006B  0bc0              or       ax, ax
1:006D  74c0              je       0x2f
1:006F  48                dec      ax
1:0070  74d7              je       0x49
1:0072  48                dec      ax
1:0073  74dc              je       0x51
1:0075  268b4708          mov      ax, word ptr es:[bx + 8]
1:0079  d1e0              shl      ax, 1
1:007B  a31400            mov      word ptr [0x14], ax
1:007E  0bc0              or       ax, ax
1:0080  7506              jne      0x88
1:0082  c70614000100      mov      word ptr [0x14], 1
1:0088  268b470c          mov      ax, word ptr es:[bx + 0xc]
1:008C  a31000            mov      word ptr [0x10], ax
1:008F  b8d803            mov      ax, 0x3d8
1:0092  1e                push     ds
1:0093  50                push     ax
1:0094  2bc0              sub      ax, ax
1:0096  50                push     ax
1:0097  50                push     ax
1:0098  26ff7702          push     word ptr es:[bx + 2]
1:009C  26ff7704          push     word ptr es:[bx + 4]
1:00A0  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:00A5  833e100000        cmp      word ptr [0x10], 0
1:00AA  740e              je       0xba
1:00AC  ff36c403          push     word ptr [0x3c4]
1:00B0  b8d803            mov      ax, 0x3d8
1:00B3  1e                push     ds
1:00B4  50                push     ax
1:00B5  9affff0000        lcall    0, 0xffff  ; @1:USER.InvertRect
1:00BA  a1dc03            mov      ax, word ptr [0x3dc]
1:00BD  99                cdq      
1:00BE  f73e1200          idiv     word ptr [0x12]
1:00C2  8956fc            mov      word ptr [bp - 4], dx
1:00C5  0bd2              or       dx, dx
1:00C7  7434              je       0xfd
1:00C9  b83003            mov      ax, 0x330
1:00CC  1e                push     ds
1:00CD  50                push     ax
1:00CE  b9d803            mov      cx, 0x3d8
1:00D1  1e                push     ds
1:00D2  51                push     cx
1:00D3  9a17010000        lcall    0, 0x117  ; @1:USER.CopyRect
1:00D8  8b46fc            mov      ax, word ptr [bp - 4]
1:00DB  2906dc03          sub      word ptr [0x3dc], ax
1:00DF  a1dc03            mov      ax, word ptr [0x3dc]
1:00E2  a33003            mov      word ptr [0x330], ax
1:00E5  ff36c403          push     word ptr [0x3c4]
1:00E9  b83003            mov      ax, 0x330
1:00EC  1e                push     ds
1:00ED  50                push     ax
1:00EE  b80400            mov      ax, 4
1:00F1  50                push     ax
1:00F2  9a36010000        lcall    0, 0x136  ; @1:GDI.GetStockObject
1:00F7  50                push     ax
1:00F8  9a3c010000        lcall    0, 0x13c  ; @1:USER.FillRect
1:00FD  a1de03            mov      ax, word ptr [0x3de]
1:0100  99                cdq      
1:0101  f73e1200          idiv     word ptr [0x12]
1:0105  8956fc            mov      word ptr [bp - 4], dx
1:0108  0bd2              or       dx, dx
1:010A  7434              je       0x140
1:010C  b83003            mov      ax, 0x330
1:010F  1e                push     ds
1:0110  50                push     ax
1:0111  b9d803            mov      cx, 0x3d8
1:0114  1e                push     ds
1:0115  51                push     cx
1:0116  9affff0000        lcall    0, 0xffff  ; @1:USER.CopyRect
1:011B  8b46fc            mov      ax, word ptr [bp - 4]
1:011E  2906de03          sub      word ptr [0x3de], ax
1:0122  a1de03            mov      ax, word ptr [0x3de]
1:0125  a33203            mov      word ptr [0x332], ax
1:0128  ff36c403          push     word ptr [0x3c4]
1:012C  b83003            mov      ax, 0x330
1:012F  1e                push     ds
1:0130  50                push     ax
1:0131  b80400            mov      ax, 4
1:0134  50                push     ax
1:0135  9a05020000        lcall    0, 0x205  ; @1:GDI.GetStockObject
1:013A  50                push     ax
1:013B  9a3e030000        lcall    0, 0x33e  ; @1:USER.FillRect
1:0140  0e                push     cs
1:0141  e8ae00            call     0x1f2
1:0144  2bc0              sub      ax, ax
1:0146  4d                dec      bp
1:0147  4d                dec      bp
1:0148  8be5              mov      sp, bp
1:014A  1f                pop      ds
1:014B  5d                pop      bp
1:014C  4d                dec      bp
1:014D  cb                retf     

; ===== EXPORT:ord_12(#12) =====
1:014E  1e                push     ds
1:014F  58                pop      ax
1:0150  90                nop      
1:0151  45                inc      bp
1:0152  55                push     bp
1:0153  8bec              mov      bp, sp
1:0155  1e                push     ds
1:0156  8ed8              mov      ds, ax
1:0158  2bc0              sub      ax, ax
1:015A  4d                dec      bp
1:015B  4d                dec      bp
1:015C  8be5              mov      sp, bp
1:015E  1f                pop      ds
1:015F  5d                pop      bp
1:0160  4d                dec      bp
1:0161  cb                retf     

; ===== EXPORT:ord_11(#11) =====
1:0162  1e                push     ds
1:0163  58                pop      ax
1:0164  90                nop      
1:0165  45                inc      bp
1:0166  55                push     bp
1:0167  8bec              mov      bp, sp
1:0169  1e                push     ds
1:016A  8ed8              mov      ds, ax
1:016C  833ee60300        cmp      word ptr [0x3e6], 0
1:0171  7406              je       0x179
1:0173  0e                push     cs
1:0174  e8fe03            call     0x575
1:0177  eb04              jmp      0x17d
1:0179  0e                push     cs
1:017A  e85102            call     0x3ce
1:017D  2bc0              sub      ax, ax
1:017F  4d                dec      bp
1:0180  4d                dec      bp
1:0181  8be5              mov      sp, bp
1:0183  1f                pop      ds
1:0184  5d                pop      bp
1:0185  4d                dec      bp
1:0186  cb                retf     

; ===== EXPORT:ord_9(#9) =====
1:0187  1e                push     ds
1:0188  58                pop      ax
1:0189  90                nop      
1:018A  45                inc      bp
1:018B  55                push     bp
1:018C  8bec              mov      bp, sp
1:018E  1e                push     ds
1:018F  8ed8              mov      ds, ax
1:0191  2bc0              sub      ax, ax
1:0193  4d                dec      bp
1:0194  4d                dec      bp
1:0195  8be5              mov      sp, bp
1:0197  1f                pop      ds
1:0198  5d                pop      bp
1:0199  4d                dec      bp
1:019A  cb                retf     

; ===== EXPORT:ord_8(#8) =====
1:019B  1e                push     ds
1:019C  58                pop      ax
1:019D  90                nop      
1:019E  45                inc      bp
1:019F  55                push     bp
1:01A0  8bec              mov      bp, sp
1:01A2  1e                push     ds
1:01A3  8ed8              mov      ds, ax
1:01A5  2bc0              sub      ax, ax
1:01A7  4d                dec      bp
1:01A8  4d                dec      bp
1:01A9  8be5              mov      sp, bp
1:01AB  1f                pop      ds
1:01AC  5d                pop      bp
1:01AD  4d                dec      bp
1:01AE  cb                retf     

; ===== EXPORT:ord_7(#7) =====
1:01AF  1e                push     ds
1:01B0  58                pop      ax
1:01B1  90                nop      
1:01B2  45                inc      bp
1:01B3  55                push     bp
1:01B4  8bec              mov      bp, sp
1:01B6  1e                push     ds
1:01B7  8ed8              mov      ds, ax
1:01B9  2bc0              sub      ax, ax
1:01BB  4d                dec      bp
1:01BC  4d                dec      bp
1:01BD  8be5              mov      sp, bp
1:01BF  1f                pop      ds
1:01C0  5d                pop      bp
1:01C1  4d                dec      bp
1:01C2  cb                retf     

; ===== EXPORT:ord_6(#6) =====
1:01C3  1e                push     ds
1:01C4  58                pop      ax
1:01C5  90                nop      
1:01C6  45                inc      bp
1:01C7  55                push     bp
1:01C8  8bec              mov      bp, sp
1:01CA  1e                push     ds
1:01CB  8ed8              mov      ds, ax
1:01CD  c41eca03          les      bx, ptr [0x3ca]
1:01D1  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:01D6  7404              je       0x1dc
1:01D8  2bc0              sub      ax, ax
1:01DA  eb0e              jmp      0x1ea
1:01DC  8b4606            mov      ax, word ptr [bp + 6]
1:01DF  0bc0              or       ax, ax
1:01E1  75f5              jne      0x1d8
1:01E3  0e                push     cs
1:01E4  e8a0ff            call     0x187
1:01E7  b80300            mov      ax, 3
1:01EA  4d                dec      bp
1:01EB  4d                dec      bp
1:01EC  8be5              mov      sp, bp
1:01EE  1f                pop      ds
1:01EF  5d                pop      bp
1:01F0  4d                dec      bp
1:01F1  cb                retf     
1:01F2  1e                push     ds
1:01F3  58                pop      ax
1:01F4  90                nop      
1:01F5  45                inc      bp
1:01F6  55                push     bp
1:01F7  8bec              mov      bp, sp
1:01F9  1e                push     ds
1:01FA  8ed8              mov      ds, ax
1:01FC  ff36c403          push     word ptr [0x3c4]
1:0200  b80700            mov      ax, 7
1:0203  50                push     ax
1:0204  9a1b020000        lcall    0, 0x21b  ; @1:GDI.GetStockObject
1:0209  50                push     ax
1:020A  9a21020000        lcall    0, 0x221  ; @1:GDI.SelectObject
1:020F  a34c03            mov      word ptr [0x34c], ax
1:0212  ff36c403          push     word ptr [0x3c4]
1:0216  b80400            mov      ax, 4
1:0219  50                push     ax
1:021A  9a38030000        lcall    0, 0x338  ; @1:GDI.GetStockObject
1:021F  50                push     ax
1:0220  9a6e030000        lcall    0, 0x36e  ; @1:GDI.SelectObject
1:0225  a34e03            mov      word ptr [0x34e], ax
1:0228  c70646030000      mov      word ptr [0x346], 0
1:022E  a1de03            mov      ax, word ptr [0x3de]
1:0231  a34803            mov      word ptr [0x348], ax
1:0234  a1dc03            mov      ax, word ptr [0x3dc]
1:0237  99                cdq      
1:0238  f73e1200          idiv     word ptr [0x12]
1:023C  a34203            mov      word ptr [0x342], ax
1:023F  eb31              jmp      0x272
1:0241  ff36c403          push     word ptr [0x3c4]
1:0245  ff364203          push     word ptr [0x342]
1:0249  ff364603          push     word ptr [0x346]
1:024D  9aa1020000        lcall    0, 0x2a1  ; @1:GDI.MoveTo
1:0252  ff36c403          push     word ptr [0x3c4]
1:0256  ff364403          push     word ptr [0x344]
1:025A  ff364803          push     word ptr [0x348]
1:025E  9ab2020000        lcall    0, 0x2b2  ; @1:GDI.LineTo
1:0263  a1dc03            mov      ax, word ptr [0x3dc]
1:0266  99                cdq      
1:0267  f73e1200          idiv     word ptr [0x12]
1:026B  01064203          add      word ptr [0x342], ax
1:026F  a14203            mov      ax, word ptr [0x342]
1:0272  a34403            mov      word ptr [0x344], ax
1:0275  a1dc03            mov      ax, word ptr [0x3dc]
1:0278  39064203          cmp      word ptr [0x342], ax
1:027C  7cc3              jl       0x241
1:027E  c70642030000      mov      word ptr [0x342], 0
1:0284  a34403            mov      word ptr [0x344], ax
1:0287  a1de03            mov      ax, word ptr [0x3de]
1:028A  99                cdq      
1:028B  f73e1200          idiv     word ptr [0x12]
1:028F  a34603            mov      word ptr [0x346], ax
1:0292  eb31              jmp      0x2c5
1:0294  ff36c403          push     word ptr [0x3c4]
1:0298  ff364203          push     word ptr [0x342]
1:029C  ff364603          push     word ptr [0x346]
1:02A0  9a7b030000        lcall    0, 0x37b  ; @1:GDI.MoveTo
1:02A5  ff36c403          push     word ptr [0x3c4]
1:02A9  ff364403          push     word ptr [0x344]
1:02AD  ff364803          push     word ptr [0x348]
1:02B1  9a8b030000        lcall    0, 0x38b  ; @1:GDI.LineTo
1:02B6  a1de03            mov      ax, word ptr [0x3de]
1:02B9  99                cdq      
1:02BA  f73e1200          idiv     word ptr [0x12]
1:02BE  01064603          add      word ptr [0x346], ax
1:02C2  a14603            mov      ax, word ptr [0x346]
1:02C5  a34803            mov      word ptr [0x348], ax
1:02C8  a1de03            mov      ax, word ptr [0x3de]
1:02CB  2d0400            sub      ax, 4
1:02CE  3b064603          cmp      ax, word ptr [0x346]
1:02D2  7fc0              jg       0x294
1:02D4  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_4(1:0A44)
1:02D9  8bc8              mov      cx, ax
1:02DB  a11200            mov      ax, word ptr [0x12]
1:02DE  8bd8              mov      bx, ax
1:02E0  f7eb              imul     bx
1:02E2  8bd0              mov      dx, ax
1:02E4  8bc1              mov      ax, cx
1:02E6  8bca              mov      cx, dx
1:02E8  99                cdq      
1:02E9  f7f9              idiv     cx
1:02EB  8916ce03          mov      word ptr [0x3ce], dx
1:02EF  8bc2              mov      ax, dx
1:02F1  99                cdq      
1:02F2  f7fb              idiv     bx
1:02F4  f72ede03          imul     word ptr [0x3de]
1:02F8  99                cdq      
1:02F9  f7fb              idiv     bx
1:02FB  a35203            mov      word ptr [0x352], ax
1:02FE  8bc8              mov      cx, ax
1:0300  a1de03            mov      ax, word ptr [0x3de]
1:0303  99                cdq      
1:0304  f7fb              idiv     bx
1:0306  03c1              add      ax, cx
1:0308  a35603            mov      word ptr [0x356], ax
1:030B  a1ce03            mov      ax, word ptr [0x3ce]
1:030E  99                cdq      
1:030F  f7fb              idiv     bx
1:0311  8bc2              mov      ax, dx
1:0313  f72edc03          imul     word ptr [0x3dc]
1:0317  99                cdq      
1:0318  f7fb              idiv     bx
1:031A  a35003            mov      word ptr [0x350], ax
1:031D  8bc8              mov      cx, ax
1:031F  a1dc03            mov      ax, word ptr [0x3dc]
1:0322  99                cdq      
1:0323  f7fb              idiv     bx
1:0325  03c1              add      ax, cx
1:0327  a35403            mov      word ptr [0x354], ax
1:032A  ff36c403          push     word ptr [0x3c4]
1:032E  b85003            mov      ax, 0x350
1:0331  1e                push     ds
1:0332  50                push     ax
1:0333  b80400            mov      ax, 4
1:0336  50                push     ax
1:0337  9a68030000        lcall    0, 0x368  ; @1:GDI.GetStockObject
1:033C  50                push     ax
1:033D  9affff0000        lcall    0, 0xffff  ; @1:USER.FillRect
1:0342  2bc0              sub      ax, ax
1:0344  a33c03            mov      word ptr [0x33c], ax
1:0347  a33a03            mov      word ptr [0x33a], ax
1:034A  a1dc03            mov      ax, word ptr [0x3dc]
1:034D  a33e03            mov      word ptr [0x33e], ax
1:0350  a1de03            mov      ax, word ptr [0x3de]
1:0353  99                cdq      
1:0354  f73e1200          idiv     word ptr [0x12]
1:0358  f72e1200          imul     word ptr [0x12]
1:035C  a34003            mov      word ptr [0x340], ax
1:035F  ff36c403          push     word ptr [0x3c4]
1:0363  b80500            mov      ax, 5
1:0366  50                push     ax
1:0367  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:036C  50                push     ax
1:036D  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectObject
1:0372  ff36c403          push     word ptr [0x3c4]
1:0376  2bc0              sub      ax, ax
1:0378  50                push     ax
1:0379  50                push     ax
1:037A  9a98030000        lcall    0, 0x398  ; @1:GDI.MoveTo
1:037F  ff36c403          push     word ptr [0x3c4]
1:0383  ff363e03          push     word ptr [0x33e]
1:0387  2bc0              sub      ax, ax
1:0389  50                push     ax
1:038A  9aa8030000        lcall    0, 0x3a8  ; @1:GDI.LineTo
1:038F  ff36c403          push     word ptr [0x3c4]
1:0393  2bc0              sub      ax, ax
1:0395  50                push     ax
1:0396  50                push     ax
1:0397  9affff0000        lcall    0, 0xffff  ; @1:GDI.MoveTo
1:039C  ff36c403          push     word ptr [0x3c4]
1:03A0  2bc0              sub      ax, ax
1:03A2  50                push     ax
1:03A3  ff364003          push     word ptr [0x340]
1:03A7  9affff0000        lcall    0, 0xffff  ; @1:GDI.LineTo
1:03AC  ff36c403          push     word ptr [0x3c4]
1:03B0  ff364c03          push     word ptr [0x34c]
1:03B4  9ac2030000        lcall    0, 0x3c2  ; @1:GDI.SelectObject
1:03B9  ff36c403          push     word ptr [0x3c4]
1:03BD  ff364e03          push     word ptr [0x34e]
1:03C1  9ae7030000        lcall    0, 0x3e7  ; @1:GDI.SelectObject
1:03C6  4d                dec      bp
1:03C7  4d                dec      bp
1:03C8  8be5              mov      sp, bp
1:03CA  1f                pop      ds
1:03CB  5d                pop      bp
1:03CC  4d                dec      bp
1:03CD  cb                retf     
1:03CE  1e                push     ds
1:03CF  58                pop      ax
1:03D0  90                nop      
1:03D1  45                inc      bp
1:03D2  55                push     bp
1:03D3  8bec              mov      bp, sp
1:03D5  1e                push     ds
1:03D6  8ed8              mov      ds, ax
1:03D8  ff36c403          push     word ptr [0x3c4]
1:03DC  b80400            mov      ax, 4
1:03DF  50                push     ax
1:03E0  9af7030000        lcall    0, 0x3f7  ; @1:GDI.GetStockObject
1:03E5  50                push     ax
1:03E6  9afd030000        lcall    0, 0x3fd  ; @1:GDI.SelectObject
1:03EB  a36603            mov      word ptr [0x366], ax
1:03EE  ff36c403          push     word ptr [0x3c4]
1:03F2  b80700            mov      ax, 7
1:03F5  50                push     ax
1:03F6  9a45040000        lcall    0, 0x445  ; @1:GDI.GetStockObject
1:03FB  50                push     ax
1:03FC  9a5c050000        lcall    0, 0x55c  ; @1:GDI.SelectObject
1:0401  a36403            mov      word ptr [0x364], ax
1:0404  a1e803            mov      ax, word ptr [0x3e8]
1:0407  3906e003          cmp      word ptr [0x3e0], ax
1:040B  7d49              jge      0x456
1:040D  ff36c403          push     word ptr [0x3c4]
1:0411  a11400            mov      ax, word ptr [0x14]
1:0414  f72ec603          imul     word ptr [0x3c6]
1:0418  d1e0              shl      ax, 1
1:041A  50                push     ax
1:041B  a11400            mov      ax, word ptr [0x14]
1:041E  f72ec803          imul     word ptr [0x3c8]
1:0422  50                push     ax
1:0423  b8d003            mov      ax, 0x3d0
1:0426  1e                push     ds
1:0427  50                push     ax
1:0428  1e                push     ds
1:0429  50                push     ax
1:042A  2bc0              sub      ax, ax
1:042C  50                push     ax
1:042D  b85a03            mov      ax, 0x35a
1:0430  1e                push     ds
1:0431  50                push     ax
1:0432  9a7a040000        lcall    0, 0x47a  ; @1:USER.#221
1:0437  ff36c403          push     word ptr [0x3c4]
1:043B  b85a03            mov      ax, 0x35a
1:043E  1e                push     ds
1:043F  50                push     ax
1:0440  b80400            mov      ax, 4
1:0443  50                push     ax
1:0444  9a8c040000        lcall    0, 0x48c  ; @1:GDI.GetStockObject
1:0449  50                push     ax
1:044A  9a92040000        lcall    0, 0x492  ; @1:USER.FillRect
1:044F  ff06e003          inc      word ptr [0x3e0]
1:0453  e9fd00            jmp      0x553
1:0456  ff36c403          push     word ptr [0x3c4]
1:045A  a1e403            mov      ax, word ptr [0x3e4]
1:045D  f72ec603          imul     word ptr [0x3c6]
1:0461  50                push     ax
1:0462  a1e403            mov      ax, word ptr [0x3e4]
1:0465  f72ec803          imul     word ptr [0x3c8]
1:0469  50                push     ax
1:046A  b8d003            mov      ax, 0x3d0
1:046D  1e                push     ds
1:046E  50                push     ax
1:046F  1e                push     ds
1:0470  50                push     ax
1:0471  2bc0              sub      ax, ax
1:0473  50                push     ax
1:0474  b85a03            mov      ax, 0x35a
1:0477  1e                push     ds
1:0478  50                push     ax
1:0479  9affff0000        lcall    0, 0xffff  ; @1:USER.#221
1:047E  ff36c403          push     word ptr [0x3c4]
1:0482  b85a03            mov      ax, 0x35a
1:0485  1e                push     ds
1:0486  50                push     ax
1:0487  b80400            mov      ax, 4
1:048A  50                push     ax
1:048B  9af3000000        lcall    0, 0xf3  ; @1:GDI.GetStockObject
1:0490  50                push     ax
1:0491  9af9000000        lcall    0, 0xf9  ; @1:USER.FillRect
1:0496  c41eea03          les      bx, ptr [0x3ea]
1:049A  26837f0a00        cmp      word ptr es:[bx + 0xa], 0
1:049F  7503              jne      0x4a4
1:04A1  e99200            jmp      0x536
1:04A4  9affff0000        lcall    0, 0xffff  ; @1:SOUND.OpenSound
1:04A9  b80100            mov      ax, 1
1:04AC  50                push     ax
1:04AD  b8e803            mov      ax, 0x3e8
1:04B0  50                push     ax
1:04B1  9affff0000        lcall    0, 0xffff  ; @1:SOUND.SetVoiceQueueSize
1:04B6  b80600            mov      ax, 6
1:04B9  50                push     ax
1:04BA  b91200            mov      cx, 0x12
1:04BD  51                push     cx
1:04BE  9affff0000        lcall    0, 0xffff  ; @1:SOUND.SetSoundNoise
1:04C3  c41eea03          les      bx, ptr [0x3ea]
1:04C7  26837f0602        cmp      word ptr es:[bx + 6], 2
1:04CC  7d2b              jge      0x4f9
1:04CE  c70658030700      mov      word ptr [0x358], 7
1:04D4  eb05              jmp      0x4db
1:04D6  8306580304        add      word ptr [0x358], 4
1:04DB  833e580319        cmp      word ptr [0x358], 0x19
1:04E0  7d3d              jge      0x51f
1:04E2  b80100            mov      ax, 1
1:04E5  50                push     ax
1:04E6  ff365803          push     word ptr [0x358]
1:04EA  b8e803            mov      ax, 0x3e8
1:04ED  50                push     ax
1:04EE  b80a00            mov      ax, 0xa
1:04F1  50                push     ax
1:04F2  9a10050000        lcall    0, 0x510  ; @1:SOUND.SetVoiceNote
1:04F7  ebdd              jmp      0x4d6
1:04F9  c70658030700      mov      word ptr [0x358], 7
1:04FF  b80100            mov      ax, 1
1:0502  50                push     ax
1:0503  ff365803          push     word ptr [0x358]
1:0507  b8e803            mov      ax, 0x3e8
1:050A  50                push     ax
1:050B  b80a00            mov      ax, 0xa
1:050E  50                push     ax
1:050F  9affff0000        lcall    0, 0xffff  ; @1:SOUND.SetVoiceNote
1:0514  ff065803          inc      word ptr [0x358]
1:0518  833e580319        cmp      word ptr [0x358], 0x19
1:051D  7ce0              jl       0x4ff
1:051F  9affff0000        lcall    0, 0xffff  ; @1:SOUND.StartSound
1:0524  2bc0              sub      ax, ax
1:0526  50                push     ax
1:0527  9affff0000        lcall    0, 0xffff  ; @1:SOUND.WaitSoundState
1:052C  9affff0000        lcall    0, 0xffff  ; @1:SOUND.StopSound
1:0531  9affff0000        lcall    0, 0xffff  ; @1:SOUND.CloseSound
1:0536  c706e6030100      mov      word ptr [0x3e6], 1
1:053C  c41eea03          les      bx, ptr [0x3ea]
1:0540  268b4708          mov      ax, word ptr es:[bx + 8]
1:0544  d1e0              shl      ax, 1
1:0546  a31400            mov      word ptr [0x14], ax
1:0549  0bc0              or       ax, ax
1:054B  7506              jne      0x553
1:054D  c70614000100      mov      word ptr [0x14], 1
1:0553  ff36c403          push     word ptr [0x3c4]
1:0557  ff366603          push     word ptr [0x366]
1:055B  9a69050000        lcall    0, 0x569  ; @1:GDI.SelectObject
1:0560  ff36c403          push     word ptr [0x3c4]
1:0564  ff366403          push     word ptr [0x364]
1:0568  9a0b020000        lcall    0, 0x20b  ; @1:GDI.SelectObject
1:056D  4d                dec      bp
1:056E  4d                dec      bp
1:056F  8be5              mov      sp, bp
1:0571  1f                pop      ds
1:0572  5d                pop      bp
1:0573  4d                dec      bp
1:0574  cb                retf     
1:0575  1e                push     ds
1:0576  58                pop      ax
1:0577  90                nop      
1:0578  45                inc      bp
1:0579  55                push     bp
1:057A  8bec              mov      bp, sp
1:057C  1e                push     ds
1:057D  8ed8              mov      ds, ax
1:057F  56                push     si
1:0580  c7067e030100      mov      word ptr [0x37e], 1
1:0586  9ad5020000        lcall    0, 0x2d5  ; @1:INT:ord_4(1:0A44)
1:058B  b90400            mov      cx, 4
1:058E  99                cdq      
1:058F  f7f9              idiv     cx
1:0591  89167403          mov      word ptr [0x374], dx
1:0595  c7067e030000      mov      word ptr [0x37e], 0
1:059B  8bc2              mov      ax, dx
1:059D  0bc0              or       ax, ax
1:059F  7414              je       0x5b5
1:05A1  48                dec      ax
1:05A2  7503              jne      0x5a7
1:05A4  e93101            jmp      0x6d8
1:05A7  48                dec      ax
1:05A8  7503              jne      0x5ad
1:05AA  e95101            jmp      0x6fe
1:05AD  48                dec      ax
1:05AE  7503              jne      0x5b3
1:05B0  e97601            jmp      0x729
1:05B3  eb22              jmp      0x5d7
1:05B5  a11200            mov      ax, word ptr [0x12]
1:05B8  3906ce03          cmp      word ptr [0x3ce], ax
1:05BC  7d03              jge      0x5c1
1:05BE  e9d401            jmp      0x795
1:05C1  a1ce03            mov      ax, word ptr [0x3ce]
1:05C4  2b061200          sub      ax, word ptr [0x12]
1:05C8  a38003            mov      word ptr [0x380], ax
1:05CB  c706c6030000      mov      word ptr [0x3c6], 0
1:05D1  c706c8030100      mov      word ptr [0x3c8], 1
1:05D7  a1c203            mov      ax, word ptr [0x3c2]
1:05DA  39068003          cmp      word ptr [0x380], ax
1:05DE  7506              jne      0x5e6
1:05E0  c7067e030100      mov      word ptr [0x37e], 1
1:05E6  833e7e0300        cmp      word ptr [0x37e], 0
1:05EB  7599              jne      0x586
1:05ED  a1ce03            mov      ax, word ptr [0x3ce]
1:05F0  a3c203            mov      word ptr [0x3c2], ax
1:05F3  99                cdq      
1:05F4  f73e1200          idiv     word ptr [0x12]
1:05F8  f72ede03          imul     word ptr [0x3de]
1:05FC  99                cdq      
1:05FD  f73e1200          idiv     word ptr [0x12]
1:0601  a37803            mov      word ptr [0x378], ax
1:0604  8bc8              mov      cx, ax
1:0606  a1de03            mov      ax, word ptr [0x3de]
1:0609  99                cdq      
1:060A  f73e1200          idiv     word ptr [0x12]
1:060E  03c8              add      cx, ax
1:0610  890e7c03          mov      word ptr [0x37c], cx
1:0614  8bc8              mov      cx, ax
1:0616  a1c203            mov      ax, word ptr [0x3c2]
1:0619  99                cdq      
1:061A  f73e1200          idiv     word ptr [0x12]
1:061E  8bc2              mov      ax, dx
1:0620  f72edc03          imul     word ptr [0x3dc]
1:0624  99                cdq      
1:0625  f73e1200          idiv     word ptr [0x12]
1:0629  a37603            mov      word ptr [0x376], ax
1:062C  8bd0              mov      dx, ax
1:062E  a1dc03            mov      ax, word ptr [0x3dc]
1:0631  8bda              mov      bx, dx
1:0633  99                cdq      
1:0634  f73e1200          idiv     word ptr [0x12]
1:0638  03d8              add      bx, ax
1:063A  891e7a03          mov      word ptr [0x37a], bx
1:063E  8b168003          mov      dx, word ptr [0x380]
1:0642  8916ce03          mov      word ptr [0x3ce], dx
1:0646  8bd8              mov      bx, ax
1:0648  8bc2              mov      ax, dx
1:064A  8bf2              mov      si, dx
1:064C  99                cdq      
1:064D  f73e1200          idiv     word ptr [0x12]
1:0651  f72ede03          imul     word ptr [0x3de]
1:0655  99                cdq      
1:0656  f73e1200          idiv     word ptr [0x12]
1:065A  a36a03            mov      word ptr [0x36a], ax
1:065D  03c8              add      cx, ax
1:065F  890e6e03          mov      word ptr [0x36e], cx
1:0663  8bc6              mov      ax, si
1:0665  99                cdq      
1:0666  f73e1200          idiv     word ptr [0x12]
1:066A  8bc2              mov      ax, dx
1:066C  f72edc03          imul     word ptr [0x3dc]
1:0670  99                cdq      
1:0671  f73e1200          idiv     word ptr [0x12]
1:0675  a36803            mov      word ptr [0x368], ax
1:0678  03d8              add      bx, ax
1:067A  891e6c03          mov      word ptr [0x36c], bx
1:067E  b8d003            mov      ax, 0x3d0
1:0681  1e                push     ds
1:0682  50                push     ax
1:0683  b87603            mov      ax, 0x376
1:0686  1e                push     ds
1:0687  50                push     ax
1:0688  b86803            mov      ax, 0x368
1:068B  1e                push     ds
1:068C  50                push     ax
1:068D  9affff0000        lcall    0, 0xffff  ; @1:USER.UnionRect
1:0692  833ec60300        cmp      word ptr [0x3c6], 0
1:0697  7403              je       0x69c
1:0699  e9a800            jmp      0x744
1:069C  ff36c803          push     word ptr [0x3c8]
1:06A0  9abf060000        lcall    0, 0x6bf  ; @1:INT:ord_5(1:0A20)
1:06A5  5b                pop      bx
1:06A6  8bc8              mov      cx, ax
1:06A8  a1de03            mov      ax, word ptr [0x3de]
1:06AB  99                cdq      
1:06AC  f73e1200          idiv     word ptr [0x12]
1:06B0  f7e9              imul     cx
1:06B2  99                cdq      
1:06B3  f73e1400          idiv     word ptr [0x14]
1:06B7  a3e803            mov      word ptr [0x3e8], ax
1:06BA  ff36c803          push     word ptr [0x3c8]
1:06BE  9a49070000        lcall    0, 0x749  ; @1:INT:ord_5(1:0A20)
1:06C3  5b                pop      bx
1:06C4  8bc8              mov      cx, ax
1:06C6  a1de03            mov      ax, word ptr [0x3de]
1:06C9  99                cdq      
1:06CA  f73e1200          idiv     word ptr [0x12]
1:06CE  f7e9              imul     cx
1:06D0  99                cdq      
1:06D1  f73e1400          idiv     word ptr [0x14]
1:06D5  e9ad00            jmp      0x785
1:06D8  a1ce03            mov      ax, word ptr [0x3ce]
1:06DB  40                inc      ax
1:06DC  99                cdq      
1:06DD  f73e1200          idiv     word ptr [0x12]
1:06E1  0bd2              or       dx, dx
1:06E3  7503              jne      0x6e8
1:06E5  e9ad00            jmp      0x795
1:06E8  a1ce03            mov      ax, word ptr [0x3ce]
1:06EB  40                inc      ax
1:06EC  a38003            mov      word ptr [0x380], ax
1:06EF  c706c603ffff      mov      word ptr [0x3c6], 0xffff
1:06F5  c706c8030000      mov      word ptr [0x3c8], 0
1:06FB  e9d9fe            jmp      0x5d7
1:06FE  a11200            mov      ax, word ptr [0x12]
1:0701  8bc8              mov      cx, ax
1:0703  49                dec      cx
1:0704  f7e9              imul     cx
1:0706  48                dec      ax
1:0707  3b06ce03          cmp      ax, word ptr [0x3ce]
1:070B  7d03              jge      0x710
1:070D  e98500            jmp      0x795
1:0710  a1ce03            mov      ax, word ptr [0x3ce]
1:0713  03061200          add      ax, word ptr [0x12]
1:0717  a38003            mov      word ptr [0x380], ax
1:071A  c706c6030000      mov      word ptr [0x3c6], 0
1:0720  c706c803ffff      mov      word ptr [0x3c8], 0xffff
1:0726  e9aefe            jmp      0x5d7
1:0729  a1ce03            mov      ax, word ptr [0x3ce]
1:072C  99                cdq      
1:072D  f73e1200          idiv     word ptr [0x12]
1:0731  0bd2              or       dx, dx
1:0733  7460              je       0x795
1:0735  a1ce03            mov      ax, word ptr [0x3ce]
1:0738  48                dec      ax
1:0739  a38003            mov      word ptr [0x380], ax
1:073C  c706c6030100      mov      word ptr [0x3c6], 1
1:0742  ebb1              jmp      0x6f5
1:0744  ff36c603          push     word ptr [0x3c6]
1:0748  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_5(1:0A20)
1:074D  5b                pop      bx
1:074E  8bc8              mov      cx, ax
1:0750  a1dc03            mov      ax, word ptr [0x3dc]
1:0753  99                cdq      
1:0754  f73e1200          idiv     word ptr [0x12]
1:0758  f7e9              imul     cx
1:075A  8b0e1400          mov      cx, word ptr [0x14]
1:075E  d1e1              shl      cx, 1
1:0760  99                cdq      
1:0761  f7f9              idiv     cx
1:0763  a3e803            mov      word ptr [0x3e8], ax
1:0766  ff36c603          push     word ptr [0x3c6]
1:076A  9aa1060000        lcall    0, 0x6a1  ; @1:INT:ord_5(1:0A20)
1:076F  5b                pop      bx
1:0770  8bc8              mov      cx, ax
1:0772  a1dc03            mov      ax, word ptr [0x3dc]
1:0775  99                cdq      
1:0776  f73e1200          idiv     word ptr [0x12]
1:077A  f7e9              imul     cx
1:077C  8b0e1400          mov      cx, word ptr [0x14]
1:0780  d1e1              shl      cx, 1
1:0782  99                cdq      
1:0783  f7f9              idiv     cx
1:0785  8916e403          mov      word ptr [0x3e4], dx
1:0789  2bc0              sub      ax, ax
1:078B  a3e603            mov      word ptr [0x3e6], ax
1:078E  a3e003            mov      word ptr [0x3e0], ax
1:0791  0e                push     cs
1:0792  e839fc            call     0x3ce
1:0795  5e                pop      si
1:0796  4d                dec      bp
1:0797  4d                dec      bp
1:0798  8be5              mov      sp, bp
1:079A  1f                pop      ds
1:079B  5d                pop      bp
1:079C  4d                dec      bp
1:079D  cb                retf     

; ===== EXPORT:ord_16(#16) =====
1:079E  1e                push     ds
1:079F  58                pop      ax
1:07A0  90                nop      
1:07A1  45                inc      bp
1:07A2  55                push     bp
1:07A3  8bec              mov      bp, sp
1:07A5  1e                push     ds
1:07A6  8ed8              mov      ds, ax
1:07A8  837e0a00          cmp      word ptr [bp + 0xa], 0
1:07AC  7504              jne      0x7b2
1:07AE  2bc0              sub      ax, ax
1:07B0  eb09              jmp      0x7bb
1:07B2  8b460e            mov      ax, word ptr [bp + 0xe]
1:07B5  a3e203            mov      word ptr [0x3e2], ax
1:07B8  b80100            mov      ax, 1
1:07BB  4d                dec      bp
1:07BC  4d                dec      bp
1:07BD  8be5              mov      sp, bp
1:07BF  1f                pop      ds
1:07C0  5d                pop      bp
1:07C1  4d                dec      bp
1:07C2  ca0a00            retf     0xa

; ===== EXPORT:WEP(#2) =====
1:07C5  1e                push     ds
1:07C6  58                pop      ax
1:07C7  90                nop      
1:07C8  45                inc      bp
1:07C9  55                push     bp
1:07CA  8bec              mov      bp, sp
1:07CC  1e                push     ds
1:07CD  8ed8              mov      ds, ax
1:07CF  b80100            mov      ax, 1
1:07D2  4d                dec      bp
1:07D3  4d                dec      bp
1:07D4  8be5              mov      sp, bp
1:07D6  1f                pop      ds
1:07D7  5d                pop      bp
1:07D8  4d                dec      bp
1:07D9  ca0200            retf     2

; ===== EXPORT:MODULE(#1) =====
1:07DC  1e                push     ds
1:07DD  58                pop      ax
1:07DE  90                nop      
1:07DF  45                inc      bp
1:07E0  55                push     bp
1:07E1  8bec              mov      bp, sp
1:07E3  1e                push     ds
1:07E4  8ed8              mov      ds, ax
1:07E6  83ec0a            sub      sp, 0xa
1:07E9  56                push     si
1:07EA  8b4608            mov      ax, word ptr [bp + 8]
1:07ED  a3c403            mov      word ptr [0x3c4], ax
1:07F0  8b4606            mov      ax, word ptr [bp + 6]
1:07F3  a3c003            mov      word ptr [0x3c0], ax
1:07F6  50                push     ax
1:07F7  9a17080000        lcall    0, 0x817  ; @1:KERNEL.GlobalLock
1:07FC  a3ca03            mov      word ptr [0x3ca], ax
1:07FF  8916cc03          mov      word ptr [0x3cc], dx
1:0803  8bc2              mov      ax, dx
1:0805  0b06ca03          or       ax, word ptr [0x3ca]
1:0809  7503              jne      0x80e
1:080B  e96a01            jmp      0x978
1:080E  c41eca03          les      bx, ptr [0x3ca]
1:0812  26ff7720          push     word ptr es:[bx + 0x20]
1:0816  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalLock
1:081B  a3ea03            mov      word ptr [0x3ea], ax
1:081E  8916ec03          mov      word ptr [0x3ec], dx
1:0822  8bc2              mov      ax, dx
1:0824  0b06ea03          or       ax, word ptr [0x3ea]
1:0828  7503              jne      0x82d
1:082A  e94201            jmp      0x96f
1:082D  8b460a            mov      ax, word ptr [bp + 0xa]
1:0830  e90801            jmp      0x93b
1:0833  c41eca03          les      bx, ptr [0x3ca]
1:0837  26837f1465        cmp      word ptr es:[bx + 0x14], 0x65
1:083C  7c0f              jl       0x84d
1:083E  26817f36f400      cmp      word ptr es:[bx + 0x36], 0xf4
1:0844  7507              jne      0x84d
1:0846  26837f3878        cmp      word ptr es:[bx + 0x38], 0x78
1:084B  740e              je       0x85b
1:084D  c70616000000      mov      word ptr [0x16], 0
1:0853  c746fc0500        mov      word ptr [bp - 4], 5
1:0858  e90701            jmp      0x962
1:085B  c70616000100      mov      word ptr [0x16], 1
1:0861  e9fe00            jmp      0x962
1:0864  b88203            mov      ax, 0x382
1:0867  50                push     ax
1:0868  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_15(1:09BE)
1:086D  5b                pop      bx
1:086E  ff368203          push     word ptr [0x382]
1:0872  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_14(1:0A30)
1:0877  5b                pop      bx
1:0878  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_13(1:0012)
1:087D  eb13              jmp      0x892
1:087F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:014E)
1:0884  eb0c              jmp      0x892
1:0886  833e160000        cmp      word ptr [0x16], 0
1:088B  740b              je       0x898
1:088D  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:0162)
1:0892  8946fc            mov      word ptr [bp - 4], ax
1:0895  e9ca00            jmp      0x962
1:0898  ff36c403          push     word ptr [0x3c4]
1:089C  b800ff            mov      ax, 0xff00
1:089F  baff00            mov      dx, 0xff
1:08A2  52                push     dx
1:08A3  50                push     ax
1:08A4  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextColor
1:08A9  ff36c403          push     word ptr [0x3c4]
1:08AD  2bc0              sub      ax, ax
1:08AF  50                push     ax
1:08B0  50                push     ax
1:08B1  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkColor
1:08B6  ff36c403          push     word ptr [0x3c4]
1:08BA  2bc0              sub      ax, ax
1:08BC  50                push     ax
1:08BD  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextAlign
1:08C2  ff36c403          push     word ptr [0x3c4]
1:08C6  b80100            mov      ax, 1
1:08C9  50                push     ax
1:08CA  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkMode
1:08CF  ff36c403          push     word ptr [0x3c4]
1:08D3  2bc0              sub      ax, ax
1:08D5  50                push     ax
1:08D6  50                push     ax
1:08D7  b81800            mov      ax, 0x18
1:08DA  1e                push     ds
1:08DB  50                push     ax
1:08DC  50                push     ax
1:08DD  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:09A2)
1:08E2  5b                pop      bx
1:08E3  50                push     ax
1:08E4  9affff0000        lcall    0, 0xffff  ; @1:GDI.TextOut
1:08E9  eb77              jmp      0x962
1:08EB  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:0187)
1:08F0  eba0              jmp      0x892
1:08F2  a1e203            mov      ax, word ptr [0x3e2]
1:08F5  c41eea03          les      bx, ptr [0x3ea]
1:08F9  26894716          mov      word ptr es:[bx + 0x16], ax
1:08FD  c746f60000        mov      word ptr [bp - 0xa], 0
1:0902  8b46f6            mov      ax, word ptr [bp - 0xa]
1:0905  8bf0              mov      si, ax
1:0907  d1e6              shl      si, 1
1:0909  40                inc      ax
1:090A  c41eea03          les      bx, ptr [0x3ea]
1:090E  2689400e          mov      word ptr es:[bx + si + 0xe], ax
1:0912  ff46f6            inc      word ptr [bp - 0xa]
1:0915  837ef604          cmp      word ptr [bp - 0xa], 4
1:0919  7ce7              jl       0x902
1:091B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:019B)
1:0920  e96fff            jmp      0x892
1:0923  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:01AF)
1:0928  e967ff            jmp      0x892
1:092B  8b460a            mov      ax, word ptr [bp + 0xa]
1:092E  2d0700            sub      ax, 7
1:0931  50                push     ax
1:0932  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_6(1:01C3)
1:0937  5b                pop      bx
1:0938  e957ff            jmp      0x892
1:093B  3d0c00            cmp      ax, 0xc
1:093E  7722              ja       0x962
1:0940  d1e0              shl      ax, 1
1:0942  93                xchg     bx, ax
1:0943  2effa74809        jmp      word ptr cs:[bx + 0x948]
1:0948  64087f08          or       byte ptr fs:[bx + 8], bh
1:094C  8608              xchg     byte ptr [bx + si], cl
1:094E  eb08              jmp      0x958
1:0950  6209              bound    cx, dword ptr [bx + di]
1:0952  f20823            or       byte ptr [bp + di], ah
1:0955  092b              or       word ptr [bp + di], bp
1:0957  092b              or       word ptr [bp + di], bp
1:0959  092b              or       word ptr [bp + di], bp
1:095B  092b              or       word ptr [bp + di], bp
1:095D  096209            or       word ptr [bp + si + 9], sp
1:0960  3308              xor      cx, word ptr [bx + si]
1:0962  c41eca03          les      bx, ptr [0x3ca]
1:0966  26ff7720          push     word ptr es:[bx + 0x20]
1:096A  9a74090000        lcall    0, 0x974  ; @1:KERNEL.GlobalUnlock
1:096F  ff36c003          push     word ptr [0x3c0]
1:0973  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalUnlock
1:0978  8b46fc            mov      ax, word ptr [bp - 4]
1:097B  5e                pop      si
1:097C  4d                dec      bp
1:097D  4d                dec      bp
1:097E  8be5              mov      sp, bp
1:0980  1f                pop      ds
1:0981  5d                pop      bp
1:0982  4d                dec      bp
1:0983  ca0600            retf     6
1:0986  0000              add      byte ptr [bx + si], al
1:0988  0000              add      byte ptr [bx + si], al
1:098A  0000              add      byte ptr [bx + si], al
1:098C  0000              add      byte ptr [bx + si], al
1:098E  0000              add      byte ptr [bx + si], al
1:0990  0000              add      byte ptr [bx + si], al
1:0992  0000              add      byte ptr [bx + si], al
1:0994  0000              add      byte ptr [bx + si], al
1:0996  0000              add      byte ptr [bx + si], al
1:0998  0000              add      byte ptr [bx + si], al
1:099A  0000              add      byte ptr [bx + si], al
1:099C  0000              add      byte ptr [bx + si], al
1:099E  0000              add      byte ptr [bx + si], al
1:09A0  c3                ret      
1:09A1  00558b            add      byte ptr [di - 0x75], dl
1:09A4  ec                in       al, dx
1:09A5  8bd7              mov      dx, di
1:09A7  8cd8              mov      ax, ds
1:09A9  8ec0              mov      es, ax
1:09AB  8b7e06            mov      di, word ptr [bp + 6]
1:09AE  33c0              xor      ax, ax
1:09B0  b9ffff            mov      cx, 0xffff
1:09B3  f2ae              repne scasb al, byte ptr es:[di]
1:09B5  f7d1              not      cx
1:09B7  49                dec      cx
1:09B8  91                xchg     cx, ax
1:09B9  8bfa              mov      di, dx
1:09BB  5d                pop      bp
1:09BC  cb                retf     
1:09BD  008cd890          add      byte ptr [si - 0x6f28], cl
1:09C1  45                inc      bp
1:09C2  55                push     bp
1:09C3  8bec              mov      bp, sp
1:09C5  1e                push     ds
1:09C6  8ed8              mov      ds, ax
1:09C8  56                push     si
1:09C9  b42a              mov      ah, 0x2a
1:09CB  cd21              int      0x21
1:09CD  8bda              mov      bx, dx
1:09CF  8bf1              mov      si, cx
1:09D1  b42c              mov      ah, 0x2c
1:09D3  cd21              int      0x21
1:09D5  b400              mov      ah, 0
1:09D7  8ac6              mov      al, dh
1:09D9  50                push     ax
1:09DA  8ac1              mov      al, cl
1:09DC  50                push     ax
1:09DD  8ac5              mov      al, ch
1:09DF  50                push     ax
1:09E0  50                push     ax
1:09E1  b42a              mov      ah, 0x2a
1:09E3  cd21              int      0x21
1:09E5  3bda              cmp      bx, dx
1:09E7  58                pop      ax
1:09E8  7408              je       0x9f2
1:09EA  3c17              cmp      al, 0x17
1:09EC  7504              jne      0x9f2
1:09EE  8bd3              mov      dx, bx
1:09F0  8bce              mov      cx, si
1:09F2  b400              mov      ah, 0
1:09F4  8ac2              mov      al, dl
1:09F6  50                push     ax
1:09F7  8ac6              mov      al, dh
1:09F9  50                push     ax
1:09FA  81e9bc07          sub      cx, 0x7bc
1:09FE  51                push     cx
1:09FF  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_17(1:0A74)
1:0A04  83c40c            add      sp, 0xc
1:0A07  837e0600          cmp      word ptr [bp + 6], 0
1:0A0B  7408              je       0xa15
1:0A0D  8b5e06            mov      bx, word ptr [bp + 6]
1:0A10  895702            mov      word ptr [bx + 2], dx
1:0A13  8907              mov      word ptr [bx], ax
1:0A15  5e                pop      si
1:0A16  83ed02            sub      bp, 2
1:0A19  8be5              mov      sp, bp
1:0A1B  1f                pop      ds
1:0A1C  5d                pop      bp
1:0A1D  4d                dec      bp
1:0A1E  cb                retf     
1:0A1F  004555            add      byte ptr [di + 0x55], al
1:0A22  8bec              mov      bp, sp
1:0A24  8b4606            mov      ax, word ptr [bp + 6]
1:0A27  99                cdq      
1:0A28  33c2              xor      ax, dx
1:0A2A  2bc2              sub      ax, dx
1:0A2C  5d                pop      bp
1:0A2D  4d                dec      bp
1:0A2E  cb                retf     
1:0A2F  90                nop      

; ===== EXPORT:ord_14(#14) =====
1:0A30  45                inc      bp
1:0A31  55                push     bp
1:0A32  8bec              mov      bp, sp
1:0A34  8b4606            mov      ax, word ptr [bp + 6]
1:0A37  a35200            mov      word ptr [0x52], ax