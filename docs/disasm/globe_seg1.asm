File: raw\unpacked\MODULES\GLOBE.AD
Module: 'LOGO' ('Graphics Module Library')
CS:IP=1:5612  SS:SP=0:0000  AutoDS=2  Heap=1024  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (4): win87em, KERNEL, GDI, USER
Segments (2):
  SEG  1: CODE off=0x00760 len=0x5644 min=0x5644 flags=0x0D50 relocs=518
  SEG  2: DATA off=0x06960 len=0x11C0 min=0x11C0 flags=0x0D71 relocs=17
Exports (77):
  ord   1: SEG1:2A11 flags=0x03 MODULE
  ord   2: SEG1:29EE flags=0x03 WEP
  ord   3: SEG1:26D1 flags=0x03 FILEDLGPROC
  ord   4: SEG1:481C flags=0x03 ___EXPORTEDSTUB
  ord   5: SEG1:13D8 flags=0x00 
  ord   6: SEG1:045B flags=0x00 
  ord   7: SEG1:2E2C flags=0x00 
  ord   8: SEG1:2EAA flags=0x00 
  ord   9: SEG1:2E64 flags=0x00 
  ord  10: SEG1:2E7E flags=0x00 
  ord  11: SEG1:03E2 flags=0x00 
  ord  12: SEG1:035A flags=0x00 
  ord  13: SEG1:200E flags=0x00 
  ord  14: SEG1:2134 flags=0x00 
  ord  15: SEG1:2D92 flags=0x00 
  ord  16: SEG1:0531 flags=0x00 
  ord  17: SEG1:222E flags=0x00 
  ord  18: SEG1:1880 flags=0x00 
  ord  19: SEG1:23AF flags=0x00 
  ord  20: SEG1:1641 flags=0x00 
  ord  21: SEG1:2445 flags=0x00 
  ord  22: SEG1:1BBA flags=0x00 
  ord  23: SEG1:1C07 flags=0x00 
  ord  24: SEG1:1716 flags=0x00 
  ord  25: SEG1:22FA flags=0x00 
  ord  26: SEG1:2079 flags=0x00 
  ord  27: SEG1:196F flags=0x00 
  ord  28: SEG1:2CA4 flags=0x00 
  ord  29: SEG1:2C32 flags=0x00 
  ord  30: SEG1:2C72 flags=0x00 
  ord  31: SEG1:252A flags=0x00 
  ord  32: SEG1:24AC flags=0x00 
  ord  33: SEG1:2D22 flags=0x00 
  ord  34: SEG1:2572 flags=0x00 
  ord  35: SEG1:1291 flags=0x00 
  ord  36: SEG1:1270 flags=0x00 
  ord  37: SEG1:124F flags=0x00 
  ord  38: SEG1:1229 flags=0x00 
  ord  39: SEG1:0F8F flags=0x00 
  ord  40: SEG1:0090 flags=0x00 
  ord  41: SEG1:003F flags=0x00 
  ord  42: SEG1:2D4E flags=0x00 
  ord  43: SEG1:2CC0 flags=0x00 
  ord  44: SEG1:29B6 flags=0x00 
  ord  45: SEG1:2EFC flags=0x00 
  ord  46: SEG1:38E4 flags=0x00 
  ord  47: SEG1:36AE flags=0x00 
  ord  48: SEG1:3250 flags=0x00 
  ord  49: SEG1:3300 flags=0x00 
  ord  50: SEG1:31DC flags=0x00 
  ord  51: SEG1:32CA flags=0x00 
  ord  52: SEG1:3C76 flags=0x00 
  ord  53: SEG1:2EE8 flags=0x00 
  ord  54: SEG1:3E40 flags=0x00 
  ord  55: SEG1:3D00 flags=0x00 
  ord  56: SEG1:4092 flags=0x00 
  ord  57: SEG1:415E flags=0x00 
  ord  58: SEG1:4784 flags=0x00 
  ord  59: SEG1:4218 flags=0x00 
  ord  60: SEG1:4114 flags=0x00 
  ord  61: SEG1:47EE flags=0x00 
  ord  62: SEG1:41D0 flags=0x00 
  ord  63: SEG1:47D4 flags=0x00 
  ord  64: SEG1:4246 flags=0x00 
  ord  65: SEG1:40CF flags=0x00 
  ord  66: SEG1:4104 flags=0x00 
  ord  67: SEG1:4830 flags=0x00 
  ord  68: SEG1:4858 flags=0x00 
  ord  69: SEG1:48FA flags=0x00 
  ord  70: SEG1:48BE flags=0x00 
  ord  71: SEG1:4924 flags=0x00 
  ord  72: SEG1:485C flags=0x00 
  ord  73: SEG1:3D1A flags=0x00 
  ord  74: SEG1:5248 flags=0x00 
  ord  75: SEG1:46FE flags=0x00 
  ord  76: SEG1:47E7 flags=0x00 
  ord  77: SEG1:52A8 flags=0x00 
Resources (9):
  RT_DIALOG        #1               off=0x07BC0 len=   224
  TYPE_1000        #1               off=0x07CA0 len=   352
  TYPE_1000        #2               off=0x07E00 len=   240
  TYPE_1000        #3               off=0x07EF0 len=   144
  TYPE_1000        #4               off=0x07F80 len=    96
  TYPE_2000        #10              off=0x07FE0 len=    80
  TYPE_2000        #20              off=0x08030 len=    16
  TYPE_2000        #30              off=0x08040 len=   624
  TYPE_15          #1               off=0x082B0 len=    16

1:0000  1e                push     ds
1:0001  58                pop      ax
1:0002  90                nop      
1:0003  45                inc      bp
1:0004  55                push     bp
1:0005  8bec              mov      bp, sp
1:0007  1e                push     ds
1:0008  8ed8              mov      ds, ax
1:000A  81ec0000          sub      sp, 0
1:000E  57                push     di
1:000F  56                push     si
1:0010  ff368800          push     word ptr [0x88]
1:0014  9affff0000        lcall    0, 0xffff  ; @1:USER.IsWindow
1:0019  3d0000            cmp      ax, 0
1:001C  7503              jne      0x21
1:001E  e90d00            jmp      0x2e
1:0021  ff368800          push     word ptr [0x88]
1:0025  b80000            mov      ax, 0
1:0028  50                push     ax
1:0029  9affff0000        lcall    0, 0xffff  ; @1:USER.EndDialog
1:002E  b80000            mov      ax, 0
1:0031  e90000            jmp      0x34
1:0034  5e                pop      si
1:0035  5f                pop      di
1:0036  83ed02            sub      bp, 2
1:0039  8be5              mov      sp, bp
1:003B  1f                pop      ds
1:003C  5d                pop      bp
1:003D  4d                dec      bp
1:003E  cb                retf     

; ===== EXPORT:ord_41(#41) =====
1:003F  1e                push     ds
1:0040  58                pop      ax
1:0041  90                nop      
1:0042  45                inc      bp
1:0043  55                push     bp
1:0044  8bec              mov      bp, sp
1:0046  1e                push     ds
1:0047  8ed8              mov      ds, ax
1:0049  81ec0000          sub      sp, 0
1:004D  57                push     di
1:004E  56                push     si
1:004F  c7066e000000      mov      word ptr [0x6e], 0
1:0055  c70670000000      mov      word ptr [0x70], 0
1:005B  c70672000000      mov      word ptr [0x72], 0
1:0061  c70674000000      mov      word ptr [0x74], 0
1:0067  c70626100000      mov      word ptr [0x1026], 0
1:006D  c706aa110000      mov      word ptr [0x11aa], 0
1:0073  c7061c100000      mov      word ptr [0x101c], 0
1:0079  c70634100000      mov      word ptr [0x1034], 0
1:007F  b80000            mov      ax, 0
1:0082  e90000            jmp      0x85
1:0085  5e                pop      si
1:0086  5f                pop      di
1:0087  83ed02            sub      bp, 2
1:008A  8be5              mov      sp, bp
1:008C  1f                pop      ds
1:008D  5d                pop      bp
1:008E  4d                dec      bp
1:008F  cb                retf     

; ===== EXPORT:ord_40(#40) =====
1:0090  1e                push     ds
1:0091  58                pop      ax
1:0092  90                nop      
1:0093  45                inc      bp
1:0094  55                push     bp
1:0095  8bec              mov      bp, sp
1:0097  1e                push     ds
1:0098  8ed8              mov      ds, ax
1:009A  81ec0400          sub      sp, 4
1:009E  57                push     di
1:009F  56                push     si
1:00A0  b8a60c            mov      ax, 0xca6
1:00A3  1e                push     ds
1:00A4  50                push     ax
1:00A5  b90000            mov      cx, 0
1:00A8  51                push     cx
1:00A9  51                push     cx
1:00AA  c41eae11          les      bx, ptr [0x11ae]
1:00AE  26ff7702          push     word ptr es:[bx + 2]
1:00B2  c41eae11          les      bx, ptr [0x11ae]
1:00B6  26ff7704          push     word ptr es:[bx + 4]
1:00BA  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:00BF  ff361610          push     word ptr [0x1016]
1:00C3  b8a60c            mov      ax, 0xca6
1:00C6  1e                push     ds
1:00C7  50                push     ax
1:00C8  b80400            mov      ax, 4
1:00CB  50                push     ax
1:00CC  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:00D1  50                push     ax
1:00D2  9affff0000        lcall    0, 0xffff  ; @1:USER.FillRect
1:00D7  c41eae11          les      bx, ptr [0x11ae]
1:00DB  268b4708          mov      ax, word ptr es:[bx + 8]
1:00DF  e94e00            jmp      0x130
1:00E2  c70618100100      mov      word ptr [0x1018], 1
1:00E8  c706ac116400      mov      word ptr [0x11ac], 0x64
1:00EE  e97900            jmp      0x16a
1:00F1  c70618100100      mov      word ptr [0x1018], 1
1:00F7  c706ac111400      mov      word ptr [0x11ac], 0x14
1:00FD  e96a00            jmp      0x16a
1:0100  c70618100100      mov      word ptr [0x1018], 1
1:0106  c706ac110100      mov      word ptr [0x11ac], 1
1:010C  e95b00            jmp      0x16a
1:010F  c70618100200      mov      word ptr [0x1018], 2
1:0115  c706ac110100      mov      word ptr [0x11ac], 1
1:011B  e94c00            jmp      0x16a
1:011E  c70618100300      mov      word ptr [0x1018], 3
1:0124  c706ac110100      mov      word ptr [0x11ac], 1
1:012A  e93d00            jmp      0x16a
1:012D  e93a00            jmp      0x16a
1:0130  3d2800            cmp      ax, 0x28
1:0133  7503              jne      0x138
1:0135  e9c8ff            jmp      0x100
1:0138  7e03              jle      0x13d
1:013A  e91200            jmp      0x14f
1:013D  0bc0              or       ax, ax
1:013F  7503              jne      0x144
1:0141  e99eff            jmp      0xe2
1:0144  2d1400            sub      ax, 0x14
1:0147  7503              jne      0x14c
1:0149  e9a5ff            jmp      0xf1
1:014C  e91b00            jmp      0x16a
1:014F  2d3c00            sub      ax, 0x3c
1:0152  7503              jne      0x157
1:0154  e9b8ff            jmp      0x10f
1:0157  2d1400            sub      ax, 0x14
1:015A  7503              jne      0x15f
1:015C  e9bfff            jmp      0x11e
1:015F  2d1400            sub      ax, 0x14
1:0162  7503              jne      0x167
1:0164  e9b7ff            jmp      0x11e
1:0167  e90000            jmp      0x16a
1:016A  b80000            mov      ax, 0
1:016D  50                push     ax
1:016E  b80804            mov      ax, 0x408
1:0171  50                push     ax
1:0172  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LocalAlloc
1:0177  a36a00            mov      word ptr [0x6a], ax
1:017A  b8b300            mov      ax, 0xb3
1:017D  1e                push     ds
1:017E  50                push     ax
1:017F  b8a900            mov      ax, 0xa9
1:0182  1e                push     ds
1:0183  50                push     ax
1:0184  b89700            mov      ax, 0x97
1:0187  1e                push     ds
1:0188  50                push     ax
1:0189  b81000            mov      ax, 0x10
1:018C  1e                push     ds
1:018D  50                push     ax
1:018E  b84600            mov      ax, 0x46
1:0191  50                push     ax
1:0192  b88a00            mov      ax, 0x8a
1:0195  1e                push     ds
1:0196  50                push     ax
1:0197  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GetPrivateProfileString
1:019C  b80100            mov      ax, 1
1:019F  a33a10            mov      word ptr [0x103a], ax
1:01A2  a33810            mov      word ptr [0x1038], ax
1:01A5  c70622102800      mov      word ptr [0x1022], 0x28
1:01AB  c70624102800      mov      word ptr [0x1024], 0x28
1:01B1  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_5(1:13D8)
1:01B6  8946fc            mov      word ptr [bp - 4], ax
1:01B9  8b46fc            mov      ax, word ptr [bp - 4]
1:01BC  e99e00            jmp      0x25d
1:01BF  c41e1e10          les      bx, ptr [0x101e]
1:01C3  26ff7724          push     word ptr es:[bx + 0x24]
1:01C7  26ff7722          push     word ptr es:[bx + 0x22]
1:01CB  b8be00            mov      ax, 0xbe
1:01CE  1e                push     ds
1:01CF  50                push     ax
1:01D0  9af0010000        lcall    0, 0x1f0  ; @1:KERNEL.lstrcpy
1:01D5  b80700            mov      ax, 7
1:01D8  e97401            jmp      0x34f
1:01DB  e9a000            jmp      0x27e
1:01DE  c41e1e10          les      bx, ptr [0x101e]
1:01E2  26ff7724          push     word ptr es:[bx + 0x24]
1:01E6  26ff7722          push     word ptr es:[bx + 0x22]
1:01EA  b8f600            mov      ax, 0xf6
1:01ED  1e                push     ds
1:01EE  50                push     ax
1:01EF  9a0f020000        lcall    0, 0x20f  ; @1:KERNEL.lstrcpy
1:01F4  b80700            mov      ax, 7
1:01F7  e95501            jmp      0x34f
1:01FA  e98100            jmp      0x27e
1:01FD  c41e1e10          les      bx, ptr [0x101e]
1:0201  26ff7724          push     word ptr es:[bx + 0x24]
1:0205  26ff7722          push     word ptr es:[bx + 0x22]
1:0209  b83a01            mov      ax, 0x13a
1:020C  1e                push     ds
1:020D  50                push     ax
1:020E  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.lstrcpy
1:0213  b80700            mov      ax, 7
1:0216  e93601            jmp      0x34f
1:0219  e96200            jmp      0x27e
1:021C  c41e1e10          les      bx, ptr [0x101e]
1:0220  26ff7724          push     word ptr es:[bx + 0x24]
1:0224  26ff7722          push     word ptr es:[bx + 0x22]
1:0228  b85a01            mov      ax, 0x15a
1:022B  1e                push     ds
1:022C  50                push     ax
1:022D  9a4d020000        lcall    0, 0x24d  ; @1:KERNEL.lstrcpy
1:0232  b80700            mov      ax, 7
1:0235  e91701            jmp      0x34f
1:0238  e94300            jmp      0x27e
1:023B  c41e1e10          les      bx, ptr [0x101e]
1:023F  26ff7724          push     word ptr es:[bx + 0x24]
1:0243  26ff7722          push     word ptr es:[bx + 0x22]
1:0247  b86d01            mov      ax, 0x16d
1:024A  1e                push     ds
1:024B  50                push     ax
1:024C  9ae8020000        lcall    0, 0x2e8  ; @1:KERNEL.lstrcpy
1:0251  b80700            mov      ax, 7
1:0254  e9f800            jmp      0x34f
1:0257  e92400            jmp      0x27e
1:025A  e92100            jmp      0x27e
1:025D  48                dec      ax
1:025E  7503              jne      0x263
1:0260  e95cff            jmp      0x1bf
1:0263  48                dec      ax
1:0264  7503              jne      0x269
1:0266  e975ff            jmp      0x1de
1:0269  48                dec      ax
1:026A  7503              jne      0x26f
1:026C  e9adff            jmp      0x21c
1:026F  48                dec      ax
1:0270  7503              jne      0x275
1:0272  e988ff            jmp      0x1fd
1:0275  48                dec      ax
1:0276  7503              jne      0x27b
1:0278  e9c0ff            jmp      0x23b
1:027B  e90000            jmp      0x27e
1:027E  b84200            mov      ax, 0x42
1:0281  50                push     ax
1:0282  a18000            mov      ax, word ptr [0x80]
1:0285  99                cdq      
1:0286  52                push     dx
1:0287  50                push     ax
1:0288  52                push     dx
1:0289  50                push     ax
1:028A  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:2E2C)
1:028F  52                push     dx
1:0290  50                push     ax
1:0291  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalAlloc
1:0296  a3aa11            mov      word ptr [0x11aa], ax
1:0299  833eaa1100        cmp      word ptr [0x11aa], 0
1:029E  7403              je       0x2a3
1:02A0  e90600            jmp      0x2a9
1:02A3  b80100            mov      ax, 1
1:02A6  e9a600            jmp      0x34f
1:02A9  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_6(1:045B)
1:02AE  c41eae11          les      bx, ptr [0x11ae]
1:02B2  268b4702          mov      ax, word ptr es:[bx + 2]
1:02B6  2d1e00            sub      ax, 0x1e
1:02B9  3b06b411          cmp      ax, word ptr [0x11b4]
1:02BD  7d03              jge      0x2c2
1:02BF  e91400            jmp      0x2d6
1:02C2  c41eae11          les      bx, ptr [0x11ae]
1:02C6  268b4704          mov      ax, word ptr es:[bx + 4]
1:02CA  2d1e00            sub      ax, 0x1e
1:02CD  3b06b611          cmp      ax, word ptr [0x11b6]
1:02D1  7c03              jl       0x2d6
1:02D3  e91c00            jmp      0x2f2
1:02D6  c41e1e10          les      bx, ptr [0x101e]
1:02DA  26ff7724          push     word ptr es:[bx + 0x24]
1:02DE  26ff7722          push     word ptr es:[bx + 0x22]
1:02E2  b88201            mov      ax, 0x182
1:02E5  1e                push     ds
1:02E6  50                push     ax
1:02E7  9ad1010000        lcall    0, 0x1d1  ; @1:KERNEL.lstrcpy
1:02EC  b80700            mov      ax, 7
1:02EF  e95d00            jmp      0x34f
1:02F2  c41eae11          les      bx, ptr [0x11ae]
1:02F6  268b4702          mov      ax, word ptr es:[bx + 2]
1:02FA  2d3200            sub      ax, 0x32
1:02FD  3b06b411          cmp      ax, word ptr [0x11b4]
1:0301  7d03              jge      0x306
1:0303  e91400            jmp      0x31a
1:0306  c41eae11          les      bx, ptr [0x11ae]
1:030A  268b4704          mov      ax, word ptr es:[bx + 4]
1:030E  2d3200            sub      ax, 0x32
1:0311  3b06b611          cmp      ax, word ptr [0x11b6]
1:0315  7c03              jl       0x31a
1:0317  e90c00            jmp      0x326
1:031A  c70622100000      mov      word ptr [0x1022], 0
1:0320  c70624100000      mov      word ptr [0x1024], 0
1:0326  c70628100100      mov      word ptr [0x1028], 1
1:032C  ff361610          push     word ptr [0x1016]
1:0330  ff366e00          push     word ptr [0x6e]
1:0334  b80000            mov      ax, 0
1:0337  50                push     ax
1:0338  9affff0000        lcall    0, 0xffff  ; @1:USER.SelectPalette
1:033D  a3a40c            mov      word ptr [0xca4], ax
1:0340  ff361610          push     word ptr [0x1016]
1:0344  9affff0000        lcall    0, 0xffff  ; @1:USER.RealizePalette
1:0349  b80000            mov      ax, 0
1:034C  e90000            jmp      0x34f
1:034F  5e                pop      si
1:0350  5f                pop      di
1:0351  83ed02            sub      bp, 2
1:0354  8be5              mov      sp, bp
1:0356  1f                pop      ds
1:0357  5d                pop      bp
1:0358  4d                dec      bp
1:0359  cb                retf     

; ===== EXPORT:ord_12(#12) =====
1:035A  1e                push     ds
1:035B  58                pop      ax
1:035C  90                nop      
1:035D  45                inc      bp
1:035E  55                push     bp
1:035F  8bec              mov      bp, sp
1:0361  1e                push     ds
1:0362  8ed8              mov      ds, ax
1:0364  81ec0800          sub      sp, 8
1:0368  57                push     di
1:0369  56                push     si
1:036A  a18000            mov      ax, word ptr [0x80]
1:036D  8946fc            mov      word ptr [bp - 4], ax
1:0370  c746fa0000        mov      word ptr [bp - 6], 0
1:0375  e90300            jmp      0x37b
1:0378  ff46fa            inc      word ptr [bp - 6]
1:037B  8b46fa            mov      ax, word ptr [bp - 6]
1:037E  3946fc            cmp      word ptr [bp - 4], ax
1:0381  7f03              jg       0x386
1:0383  e95100            jmp      0x3d7
1:0386  8b46fc            mov      ax, word ptr [bp - 4]
1:0389  2b46fa            sub      ax, word ptr [bp - 6]
1:038C  8946f8            mov      word ptr [bp - 8], ax
1:038F  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0390  df46f8            fild     word ptr [bp - 8]
1:0393  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0394  de76fc            fidiv    word ptr [bp - 4]
1:0397  83ec08            sub      sp, 8
1:039A  8bdc              mov      bx, sp
1:039C  9b                wait       ; @0:OSFIXUP:FISRQQ/FJSRQQ (add,t=5)
1:039D  36dd1f            fstp     qword ptr ss:[bx]
1:03A0  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:03A1  9b                wait     
1:03A2  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:2E7E)
1:03A7  83c408            add      sp, 8
1:03AA  8bd8              mov      bx, ax
1:03AC  ff7706            push     word ptr [bx + 6]
1:03AF  ff7704            push     word ptr [bx + 4]
1:03B2  ff7702            push     word ptr [bx + 2]
1:03B5  ff37              push     word ptr [bx]
1:03B7  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:2E64)
1:03BC  83c408            add      sp, 8
1:03BF  8bd8              mov      bx, ax
1:03C1  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:03C2  dd07              fld      qword ptr [bx]
1:03C4  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:03C5  de4efc            fimul    word ptr [bp - 4]
1:03C8  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:2EAA)
1:03CD  8b5efa            mov      bx, word ptr [bp - 6]
1:03D0  8887a00b          mov      byte ptr [bx + 0xba0], al
1:03D4  e9a1ff            jmp      0x378
1:03D7  5e                pop      si
1:03D8  5f                pop      di
1:03D9  83ed02            sub      bp, 2
1:03DC  8be5              mov      sp, bp
1:03DE  1f                pop      ds
1:03DF  5d                pop      bp
1:03E0  4d                dec      bp
1:03E1  cb                retf     

; ===== EXPORT:ord_11(#11) =====
1:03E2  1e                push     ds
1:03E3  58                pop      ax
1:03E4  90                nop      
1:03E5  45                inc      bp
1:03E6  55                push     bp
1:03E7  8bec              mov      bp, sp
1:03E9  1e                push     ds
1:03EA  8ed8              mov      ds, ax
1:03EC  81ec0e00          sub      sp, 0xe
1:03F0  57                push     di
1:03F1  56                push     si
1:03F2  c746fc0001        mov      word ptr [bp - 4], 0x100
1:03F7  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:03F8  df068600          fild     word ptr [0x86]
1:03FC  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:03FD  dc0e1007          fmul     qword ptr [0x710]
1:0401  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0402  dd5ef2            fstp     qword ptr [bp - 0xe]
1:0405  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:0406  9b                wait     
1:0407  c746fa0000        mov      word ptr [bp - 6], 0
1:040C  e90300            jmp      0x412
1:040F  ff46fa            inc      word ptr [bp - 6]
1:0412  8b46fa            mov      ax, word ptr [bp - 6]
1:0415  3946fc            cmp      word ptr [bp - 4], ax
1:0418  7f03              jg       0x41d
1:041A  e93300            jmp      0x450
1:041D  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:041E  df46fa            fild     word ptr [bp - 6]
1:0421  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0422  de76fc            fidiv    word ptr [bp - 4]
1:0425  83ec08            sub      sp, 8
1:0428  8bdc              mov      bx, sp
1:042A  9b                wait       ; @0:OSFIXUP:FISRQQ/FJSRQQ (add,t=5)
1:042B  36dd1f            fstp     qword ptr ss:[bx]
1:042E  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:042F  9b                wait     
1:0430  9aa3030000        lcall    0, 0x3a3  ; @1:INT:ord_10(1:2E7E)
1:0435  83c408            add      sp, 8
1:0438  8bd8              mov      bx, ax
1:043A  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:043B  dd07              fld      qword ptr [bx]
1:043D  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:043E  dc4ef2            fmul     qword ptr [bp - 0xe]
1:0441  9ac9030000        lcall    0, 0x3c9  ; @1:INT:ord_8(1:2EAA)
1:0446  8b5efa            mov      bx, word ptr [bp - 6]
1:0449  8887a00a          mov      byte ptr [bx + 0xaa0], al
1:044D  e9bfff            jmp      0x40f
1:0450  5e                pop      si
1:0451  5f                pop      di
1:0452  83ed02            sub      bp, 2
1:0455  8be5              mov      sp, bp
1:0457  1f                pop      ds
1:0458  5d                pop      bp
1:0459  4d                dec      bp
1:045A  cb                retf     

; ===== EXPORT:ord_6(#6) =====
1:045B  1e                push     ds
1:045C  58                pop      ax
1:045D  90                nop      
1:045E  45                inc      bp
1:045F  55                push     bp
1:0460  8bec              mov      bp, sp
1:0462  1e                push     ds
1:0463  8ed8              mov      ds, ax
1:0465  81ec0c00          sub      sp, 0xc
1:0469  57                push     di
1:046A  56                push     si
1:046B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:035A)
1:0470  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:03E2)
1:0475  ff36aa11          push     word ptr [0x11aa]
1:0479  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalLock
1:047E  a3d80c            mov      word ptr [0xcd8], ax
1:0481  8916da0c          mov      word ptr [0xcda], dx
1:0485  c706d60ca00b      mov      word ptr [0xcd6], 0xba0
1:048B  c746f80000        mov      word ptr [bp - 8], 0
1:0490  e90300            jmp      0x496
1:0493  ff46f8            inc      word ptr [bp - 8]
1:0496  a18000            mov      ax, word ptr [0x80]
1:0499  3946f8            cmp      word ptr [bp - 8], ax
1:049C  7203              jb       0x4a1
1:049E  e97c00            jmp      0x51d
1:04A1  8b1ed60c          mov      bx, word ptr [0xcd6]
1:04A5  ff06d60c          inc      word ptr [0xcd6]
1:04A9  8a07              mov      al, byte ptr [bx]
1:04AB  2ae4              sub      ah, ah
1:04AD  8946f6            mov      word ptr [bp - 0xa], ax
1:04B0  8b46f6            mov      ax, word ptr [bp - 0xa]
1:04B3  d1e8              shr      ax, 1
1:04B5  8946fa            mov      word ptr [bp - 6], ax
1:04B8  c746fc0000        mov      word ptr [bp - 4], 0
1:04BD  e90300            jmp      0x4c3
1:04C0  ff46fc            inc      word ptr [bp - 4]
1:04C3  8b46fc            mov      ax, word ptr [bp - 4]
1:04C6  3946f6            cmp      word ptr [bp - 0xa], ax
1:04C9  7703              ja       0x4ce
1:04CB  e92500            jmp      0x4f3
1:04CE  8a66fc            mov      ah, byte ptr [bp - 4]
1:04D1  2ac0              sub      al, al
1:04D3  0346fa            add      ax, word ptr [bp - 6]
1:04D6  2bd2              sub      dx, dx
1:04D8  f776f6            div      word ptr [bp - 0xa]
1:04DB  8946f4            mov      word ptr [bp - 0xc], ax
1:04DE  8b5ef4            mov      bx, word ptr [bp - 0xc]
1:04E1  8a87a00a          mov      al, byte ptr [bx + 0xaa0]
1:04E5  c41ed80c          les      bx, ptr [0xcd8]
1:04E9  268807            mov      byte ptr es:[bx], al
1:04EC  ff06d80c          inc      word ptr [0xcd8]
1:04F0  e9cdff            jmp      0x4c0
1:04F3  8b46f6            mov      ax, word ptr [bp - 0xa]
1:04F6  8946fc            mov      word ptr [bp - 4], ax
1:04F9  e90300            jmp      0x4ff
1:04FC  ff46fc            inc      word ptr [bp - 4]
1:04FF  8b46fc            mov      ax, word ptr [bp - 4]
1:0502  39068000          cmp      word ptr [0x80], ax
1:0506  7703              ja       0x50b
1:0508  e90f00            jmp      0x51a
1:050B  c41ed80c          les      bx, ptr [0xcd8]
1:050F  26c607ff          mov      byte ptr es:[bx], 0xff
1:0513  ff06d80c          inc      word ptr [0xcd8]
1:0517  e9e2ff            jmp      0x4fc
1:051A  e976ff            jmp      0x493
1:051D  ff36aa11          push     word ptr [0x11aa]
1:0521  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalUnlock
1:0526  5e                pop      si
1:0527  5f                pop      di
1:0528  83ed02            sub      bp, 2
1:052B  8be5              mov      sp, bp
1:052D  1f                pop      ds
1:052E  5d                pop      bp
1:052F  4d                dec      bp
1:0530  cb                retf     

; ===== EXPORT:ord_16(#16) =====
1:0531  1e                push     ds
1:0532  58                pop      ax
1:0533  90                nop      
1:0534  45                inc      bp
1:0535  55                push     bp
1:0536  8bec              mov      bp, sp
1:0538  1e                push     ds
1:0539  8ed8              mov      ds, ax
1:053B  81ec1200          sub      sp, 0x12
1:053F  57                push     di
1:0540  56                push     si
1:0541  ff367000          push     word ptr [0x70]
1:0545  9a56050000        lcall    0, 0x556  ; @1:KERNEL.GlobalLock
1:054A  a3f00c            mov      word ptr [0xcf0], ax
1:054D  8916f20c          mov      word ptr [0xcf2], dx
1:0551  ff362610          push     word ptr [0x1026]
1:0555  9ac1050000        lcall    0, 0x5c1  ; @1:KERNEL.GlobalLock
1:055A  a3f80c            mov      word ptr [0xcf8], ax
1:055D  8916fa0c          mov      word ptr [0xcfa], dx
1:0561  ff36f20c          push     word ptr [0xcf2]
1:0565  ff36f00c          push     word ptr [0xcf0]
1:0569  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_13(1:200E)
1:056E  83c404            add      sp, 4
1:0571  c41ef00c          les      bx, ptr [0xcf0]
1:0575  260307            add      ax, word ptr es:[bx]
1:0578  0306f00c          add      ax, word ptr [0xcf0]
1:057C  8b16f20c          mov      dx, word ptr [0xcf2]
1:0580  a3fc0c            mov      word ptr [0xcfc], ax
1:0583  8916fe0c          mov      word ptr [0xcfe], dx
1:0587  c41ef00c          les      bx, ptr [0xcf0]
1:058B  26ff7706          push     word ptr es:[bx + 6]
1:058F  26ff7704          push     word ptr es:[bx + 4]
1:0593  c41ef00c          les      bx, ptr [0xcf0]
1:0597  268b470e          mov      ax, word ptr es:[bx + 0xe]
1:059B  2bd2              sub      dx, dx
1:059D  52                push     dx
1:059E  50                push     ax
1:059F  9a8b020000        lcall    0, 0x28b  ; @1:INT:ord_7(1:2E2C)
1:05A4  051f00            add      ax, 0x1f
1:05A7  83d200            adc      dx, 0
1:05AA  d1ea              shr      dx, 1
1:05AC  d1d8              rcr      ax, 1
1:05AE  d1ea              shr      dx, 1
1:05B0  d1d8              rcr      ax, 1
1:05B2  d1ea              shr      dx, 1
1:05B4  d1d8              rcr      ax, 1
1:05B6  25fcff            and      ax, 0xfffc
1:05B9  8946f8            mov      word ptr [bp - 8], ax
1:05BC  ff36aa11          push     word ptr [0x11aa]
1:05C0  9a7a040000        lcall    0, 0x47a  ; @1:KERNEL.GlobalLock
1:05C5  a3e40c            mov      word ptr [0xce4], ax
1:05C8  8916e60c          mov      word ptr [0xce6], dx
1:05CC  c41ef00c          les      bx, ptr [0xcf0]
1:05D0  26837f0e04        cmp      word ptr es:[bx + 0xe], 4
1:05D5  7403              je       0x5da
1:05D7  e9f105            jmp      0xbcb
1:05DA  c706040da00b      mov      word ptr [0xd04], 0xba0
1:05E0  a1e40c            mov      ax, word ptr [0xce4]
1:05E3  8b16e60c          mov      dx, word ptr [0xce6]
1:05E7  a3ec0c            mov      word ptr [0xcec], ax
1:05EA  8916ee0c          mov      word ptr [0xcee], dx
1:05EE  a1fc0c            mov      ax, word ptr [0xcfc]
1:05F1  8b16fe0c          mov      dx, word ptr [0xcfe]
1:05F5  03068400          add      ax, word ptr [0x84]
1:05F9  a3f40c            mov      word ptr [0xcf4], ax
1:05FC  8916f60c          mov      word ptr [0xcf6], dx
1:0600  a1f80c            mov      ax, word ptr [0xcf8]
1:0603  8b16fa0c          mov      dx, word ptr [0xcfa]
1:0607  a3dc0c            mov      word ptr [0xcdc], ax
1:060A  8916de0c          mov      word ptr [0xcde], dx
1:060E  a18000            mov      ax, word ptr [0x80]
1:0611  8946f0            mov      word ptr [bp - 0x10], ax
1:0614  e90300            jmp      0x61a
1:0617  ff4ef0            dec      word ptr [bp - 0x10]
1:061A  837ef000          cmp      word ptr [bp - 0x10], 0
1:061E  7f03              jg       0x623
1:0620  e92a01            jmp      0x74d
1:0623  a1ec0c            mov      ax, word ptr [0xcec]
1:0626  8b16ee0c          mov      dx, word ptr [0xcee]
1:062A  a3e00c            mov      word ptr [0xce0], ax
1:062D  8916e20c          mov      word ptr [0xce2], dx
1:0631  a18000            mov      ax, word ptr [0x80]
1:0634  0106ec0c          add      word ptr [0xcec], ax
1:0638  a1f40c            mov      ax, word ptr [0xcf4]
1:063B  8b16f60c          mov      dx, word ptr [0xcf6]
1:063F  a3e80c            mov      word ptr [0xce8], ax
1:0642  8916ea0c          mov      word ptr [0xcea], dx
1:0646  8b46f8            mov      ax, word ptr [bp - 8]
1:0649  0106f40c          add      word ptr [0xcf4], ax
1:064D  8b1e040d          mov      bx, word ptr [0xd04]
1:0651  ff06040d          inc      word ptr [0xd04]
1:0655  8a07              mov      al, byte ptr [bx]
1:0657  d0e8              shr      al, 1
1:0659  2ae4              sub      ah, ah
1:065B  8946ee            mov      word ptr [bp - 0x12], ax
1:065E  e90300            jmp      0x664
1:0661  ff4eee            dec      word ptr [bp - 0x12]
1:0664  837eee00          cmp      word ptr [bp - 0x12], 0
1:0668  7f03              jg       0x66d
1:066A  e9d600            jmp      0x743
1:066D  c41ee00c          les      bx, ptr [0xce0]
1:0671  ff06e00c          inc      word ptr [0xce0]
1:0675  268a07            mov      al, byte ptr es:[bx]
1:0678  2ae4              sub      ah, ah
1:067A  2b061c10          sub      ax, word ptr [0x101c]
1:067E  f7d8              neg      ax
1:0680  8946fa            mov      word ptr [bp - 6], ax
1:0683  837efa00          cmp      word ptr [bp - 6], 0
1:0687  7c03              jl       0x68c
1:0689  e90600            jmp      0x692
1:068C  a18600            mov      ax, word ptr [0x86]
1:068F  0146fa            add      word ptr [bp - 6], ax
1:0692  f646fa01          test     byte ptr [bp - 6], 1
1:0696  7503              jne      0x69b
1:0698  e91a00            jmp      0x6b5
1:069B  8b46fa            mov      ax, word ptr [bp - 6]
1:069E  99                cdq      
1:069F  2bc2              sub      ax, dx
1:06A1  d1f8              sar      ax, 1
1:06A3  8bd8              mov      bx, ax
1:06A5  c436dc0c          les      si, ptr [0xcdc]
1:06A9  268a00            mov      al, byte ptr es:[bx + si]
1:06AC  250f00            and      ax, 0xf
1:06AF  8946fc            mov      word ptr [bp - 4], ax
1:06B2  e91a00            jmp      0x6cf
1:06B5  8b46fa            mov      ax, word ptr [bp - 6]
1:06B8  99                cdq      
1:06B9  2bc2              sub      ax, dx
1:06BB  d1f8              sar      ax, 1
1:06BD  8bd8              mov      bx, ax
1:06BF  c436dc0c          les      si, ptr [0xcdc]
1:06C3  268a00            mov      al, byte ptr es:[bx + si]
1:06C6  b104              mov      cl, 4
1:06C8  d2e8              shr      al, cl
1:06CA  2ae4              sub      ah, ah
1:06CC  8946fc            mov      word ptr [bp - 4], ax
1:06CF  c41ee00c          les      bx, ptr [0xce0]
1:06D3  ff06e00c          inc      word ptr [0xce0]
1:06D7  268a07            mov      al, byte ptr es:[bx]
1:06DA  2ae4              sub      ah, ah
1:06DC  2b061c10          sub      ax, word ptr [0x101c]
1:06E0  f7d8              neg      ax
1:06E2  8946f2            mov      word ptr [bp - 0xe], ax
1:06E5  837ef200          cmp      word ptr [bp - 0xe], 0
1:06E9  7c03              jl       0x6ee
1:06EB  e90600            jmp      0x6f4
1:06EE  a18600            mov      ax, word ptr [0x86]
1:06F1  0146f2            add      word ptr [bp - 0xe], ax
1:06F4  f646f201          test     byte ptr [bp - 0xe], 1
1:06F8  7503              jne      0x6fd
1:06FA  e91e00            jmp      0x71b
1:06FD  8b46f2            mov      ax, word ptr [bp - 0xe]
1:0700  99                cdq      
1:0701  2bc2              sub      ax, dx
1:0703  d1f8              sar      ax, 1
1:0705  8bd8              mov      bx, ax
1:0707  c436dc0c          les      si, ptr [0xcdc]
1:070B  268a00            mov      al, byte ptr es:[bx + si]
1:070E  250f00            and      ax, 0xf
1:0711  b104              mov      cl, 4
1:0713  d3e0              shl      ax, cl
1:0715  0946fc            or       word ptr [bp - 4], ax
1:0718  e91700            jmp      0x732
1:071B  8b46f2            mov      ax, word ptr [bp - 0xe]
1:071E  99                cdq      
1:071F  2bc2              sub      ax, dx
1:0721  d1f8              sar      ax, 1
1:0723  8bd8              mov      bx, ax
1:0725  c436dc0c          les      si, ptr [0xcdc]
1:0729  268a00            mov      al, byte ptr es:[bx + si]
1:072C  25f000            and      ax, 0xf0
1:072F  0946fc            or       word ptr [bp - 4], ax
1:0732  8a46fc            mov      al, byte ptr [bp - 4]
1:0735  c41ee80c          les      bx, ptr [0xce8]
1:0739  268807            mov      byte ptr es:[bx], al
1:073C  ff0ee80c          dec      word ptr [0xce8]
1:0740  e91eff            jmp      0x661
1:0743  a13c10            mov      ax, word ptr [0x103c]
1:0746  0106dc0c          add      word ptr [0xcdc], ax
1:074A  e9cafe            jmp      0x617
1:074D  c706040da00b      mov      word ptr [0xd04], 0xba0
1:0753  a1e40c            mov      ax, word ptr [0xce4]
1:0756  8b16e60c          mov      dx, word ptr [0xce6]
1:075A  a3ec0c            mov      word ptr [0xcec], ax
1:075D  8916ee0c          mov      word ptr [0xcee], dx
1:0761  a1fc0c            mov      ax, word ptr [0xcfc]
1:0764  8b16fe0c          mov      dx, word ptr [0xcfe]
1:0768  03068400          add      ax, word ptr [0x84]
1:076C  a3f40c            mov      word ptr [0xcf4], ax
1:076F  8916f60c          mov      word ptr [0xcf6], dx
1:0773  a1f80c            mov      ax, word ptr [0xcf8]
1:0776  8b16fa0c          mov      dx, word ptr [0xcfa]
1:077A  a3dc0c            mov      word ptr [0xcdc], ax
1:077D  8916de0c          mov      word ptr [0xcde], dx
1:0781  a18000            mov      ax, word ptr [0x80]
1:0784  8946f0            mov      word ptr [bp - 0x10], ax
1:0787  e90300            jmp      0x78d
1:078A  ff4ef0            dec      word ptr [bp - 0x10]
1:078D  837ef000          cmp      word ptr [bp - 0x10], 0
1:0791  7f03              jg       0x796
1:0793  e92a01            jmp      0x8c0
1:0796  a1ec0c            mov      ax, word ptr [0xcec]
1:0799  8b16ee0c          mov      dx, word ptr [0xcee]
1:079D  a3e00c            mov      word ptr [0xce0], ax
1:07A0  8916e20c          mov      word ptr [0xce2], dx
1:07A4  a18000            mov      ax, word ptr [0x80]
1:07A7  0106ec0c          add      word ptr [0xcec], ax
1:07AB  a1f40c            mov      ax, word ptr [0xcf4]
1:07AE  8b16f60c          mov      dx, word ptr [0xcf6]
1:07B2  a3e80c            mov      word ptr [0xce8], ax
1:07B5  8916ea0c          mov      word ptr [0xcea], dx
1:07B9  8b46f8            mov      ax, word ptr [bp - 8]
1:07BC  0106f40c          add      word ptr [0xcf4], ax
1:07C0  8b1e040d          mov      bx, word ptr [0xd04]
1:07C4  ff06040d          inc      word ptr [0xd04]
1:07C8  8a07              mov      al, byte ptr [bx]
1:07CA  d0e8              shr      al, 1
1:07CC  2ae4              sub      ah, ah
1:07CE  8946ee            mov      word ptr [bp - 0x12], ax
1:07D1  e90300            jmp      0x7d7
1:07D4  ff4eee            dec      word ptr [bp - 0x12]
1:07D7  837eee00          cmp      word ptr [bp - 0x12], 0
1:07DB  7f03              jg       0x7e0
1:07DD  e9d600            jmp      0x8b6
1:07E0  c41ee00c          les      bx, ptr [0xce0]
1:07E4  ff06e00c          inc      word ptr [0xce0]
1:07E8  268a07            mov      al, byte ptr es:[bx]
1:07EB  2ae4              sub      ah, ah
1:07ED  03061c10          add      ax, word ptr [0x101c]
1:07F1  8946fa            mov      word ptr [bp - 6], ax
1:07F4  a18600            mov      ax, word ptr [0x86]
1:07F7  3946fa            cmp      word ptr [bp - 6], ax
1:07FA  7d03              jge      0x7ff
1:07FC  e90600            jmp      0x805
1:07FF  a18600            mov      ax, word ptr [0x86]
1:0802  2946fa            sub      word ptr [bp - 6], ax
1:0805  f646fa01          test     byte ptr [bp - 6], 1
1:0809  7503              jne      0x80e
1:080B  e91e00            jmp      0x82c
1:080E  8b46fa            mov      ax, word ptr [bp - 6]
1:0811  99                cdq      
1:0812  2bc2              sub      ax, dx
1:0814  d1f8              sar      ax, 1
1:0816  8bd8              mov      bx, ax
1:0818  c436dc0c          les      si, ptr [0xcdc]
1:081C  268a00            mov      al, byte ptr es:[bx + si]
1:081F  250f00            and      ax, 0xf
1:0822  b104              mov      cl, 4
1:0824  d3e0              shl      ax, cl
1:0826  8946fc            mov      word ptr [bp - 4], ax
1:0829  e91700            jmp      0x843
1:082C  8b46fa            mov      ax, word ptr [bp - 6]
1:082F  99                cdq      
1:0830  2bc2              sub      ax, dx
1:0832  d1f8              sar      ax, 1
1:0834  8bd8              mov      bx, ax
1:0836  c436dc0c          les      si, ptr [0xcdc]
1:083A  268a00            mov      al, byte ptr es:[bx + si]
1:083D  25f000            and      ax, 0xf0
1:0840  8946fc            mov      word ptr [bp - 4], ax
1:0843  c41ee00c          les      bx, ptr [0xce0]
1:0847  ff06e00c          inc      word ptr [0xce0]
1:084B  268a07            mov      al, byte ptr es:[bx]
1:084E  2ae4              sub      ah, ah
1:0850  03061c10          add      ax, word ptr [0x101c]
1:0854  8946f2            mov      word ptr [bp - 0xe], ax
1:0857  a18600            mov      ax, word ptr [0x86]
1:085A  3946f2            cmp      word ptr [bp - 0xe], ax
1:085D  7d03              jge      0x862
1:085F  e90600            jmp      0x868
1:0862  a18600            mov      ax, word ptr [0x86]
1:0865  2946f2            sub      word ptr [bp - 0xe], ax
1:0868  f646f201          test     byte ptr [bp - 0xe], 1
1:086C  7503              jne      0x871
1:086E  e91a00            jmp      0x88b
1:0871  8b46f2            mov      ax, word ptr [bp - 0xe]
1:0874  99                cdq      
1:0875  2bc2              sub      ax, dx
1:0877  d1f8              sar      ax, 1
1:0879  8bd8              mov      bx, ax
1:087B  c436dc0c          les      si, ptr [0xcdc]
1:087F  268a00            mov      al, byte ptr es:[bx + si]
1:0882  250f00            and      ax, 0xf
1:0885  0946fc            or       word ptr [bp - 4], ax
1:0888  e91a00            jmp      0x8a5
1:088B  8b46f2            mov      ax, word ptr [bp - 0xe]
1:088E  99                cdq      
1:088F  2bc2              sub      ax, dx
1:0891  d1f8              sar      ax, 1
1:0893  8bd8              mov      bx, ax
1:0895  c436dc0c          les      si, ptr [0xcdc]
1:0899  268a00            mov      al, byte ptr es:[bx + si]
1:089C  b104              mov      cl, 4
1:089E  d2e8              shr      al, cl
1:08A0  2ae4              sub      ah, ah
1:08A2  0946fc            or       word ptr [bp - 4], ax
1:08A5  8a46fc            mov      al, byte ptr [bp - 4]
1:08A8  c41ee80c          les      bx, ptr [0xce8]
1:08AC  268807            mov      byte ptr es:[bx], al
1:08AF  ff06e80c          inc      word ptr [0xce8]
1:08B3  e91eff            jmp      0x7d4
1:08B6  a13c10            mov      ax, word ptr [0x103c]
1:08B9  0106dc0c          add      word ptr [0xcdc], ax
1:08BD  e9cafe            jmp      0x78a
1:08C0  c706040da00b      mov      word ptr [0xd04], 0xba0
1:08C6  a1e40c            mov      ax, word ptr [0xce4]
1:08C9  8b16e60c          mov      dx, word ptr [0xce6]
1:08CD  a3ec0c            mov      word ptr [0xcec], ax
1:08D0  8916ee0c          mov      word ptr [0xcee], dx
1:08D4  a18200            mov      ax, word ptr [0x82]
1:08D7  48                dec      ax
1:08D8  f76ef8            imul     word ptr [bp - 8]
1:08DB  0306fc0c          add      ax, word ptr [0xcfc]
1:08DF  8b16fe0c          mov      dx, word ptr [0xcfe]
1:08E3  03068400          add      ax, word ptr [0x84]
1:08E7  a3f40c            mov      word ptr [0xcf4], ax
1:08EA  8916f60c          mov      word ptr [0xcf6], dx
1:08EE  a18200            mov      ax, word ptr [0x82]
1:08F1  48                dec      ax
1:08F2  f72e3c10          imul     word ptr [0x103c]
1:08F6  0306f80c          add      ax, word ptr [0xcf8]
1:08FA  8b16fa0c          mov      dx, word ptr [0xcfa]
1:08FE  a3dc0c            mov      word ptr [0xcdc], ax
1:0901  8916de0c          mov      word ptr [0xcde], dx
1:0905  a18000            mov      ax, word ptr [0x80]
1:0908  8946f0            mov      word ptr [bp - 0x10], ax
1:090B  e90300            jmp      0x911
1:090E  ff4ef0            dec      word ptr [bp - 0x10]
1:0911  837ef000          cmp      word ptr [bp - 0x10], 0
1:0915  7f03              jg       0x91a
1:0917  e92a01            jmp      0xa44
1:091A  a1ec0c            mov      ax, word ptr [0xcec]
1:091D  8b16ee0c          mov      dx, word ptr [0xcee]
1:0921  a3e00c            mov      word ptr [0xce0], ax
1:0924  8916e20c          mov      word ptr [0xce2], dx
1:0928  a18000            mov      ax, word ptr [0x80]
1:092B  0106ec0c          add      word ptr [0xcec], ax
1:092F  a1f40c            mov      ax, word ptr [0xcf4]
1:0932  8b16f60c          mov      dx, word ptr [0xcf6]
1:0936  a3e80c            mov      word ptr [0xce8], ax
1:0939  8916ea0c          mov      word ptr [0xcea], dx
1:093D  8b46f8            mov      ax, word ptr [bp - 8]
1:0940  2906f40c          sub      word ptr [0xcf4], ax
1:0944  8b1e040d          mov      bx, word ptr [0xd04]
1:0948  ff06040d          inc      word ptr [0xd04]
1:094C  8a07              mov      al, byte ptr [bx]
1:094E  d0e8              shr      al, 1
1:0950  2ae4              sub      ah, ah
1:0952  8946ee            mov      word ptr [bp - 0x12], ax
1:0955  e90300            jmp      0x95b
1:0958  ff4eee            dec      word ptr [bp - 0x12]
1:095B  837eee00          cmp      word ptr [bp - 0x12], 0
1:095F  7f03              jg       0x964
1:0961  e9d600            jmp      0xa3a
1:0964  c41ee00c          les      bx, ptr [0xce0]
1:0968  ff06e00c          inc      word ptr [0xce0]
1:096C  268a07            mov      al, byte ptr es:[bx]
1:096F  2ae4              sub      ah, ah
1:0971  2b061c10          sub      ax, word ptr [0x101c]
1:0975  f7d8              neg      ax
1:0977  8946fa            mov      word ptr [bp - 6], ax
1:097A  837efa00          cmp      word ptr [bp - 6], 0
1:097E  7c03              jl       0x983
1:0980  e90600            jmp      0x989
1:0983  a18600            mov      ax, word ptr [0x86]
1:0986  0146fa            add      word ptr [bp - 6], ax
1:0989  f646fa01          test     byte ptr [bp - 6], 1
1:098D  7503              jne      0x992
1:098F  e91a00            jmp      0x9ac
1:0992  8b46fa            mov      ax, word ptr [bp - 6]
1:0995  99                cdq      
1:0996  2bc2              sub      ax, dx
1:0998  d1f8              sar      ax, 1
1:099A  8bd8              mov      bx, ax
1:099C  c436dc0c          les      si, ptr [0xcdc]
1:09A0  268a00            mov      al, byte ptr es:[bx + si]
1:09A3  250f00            and      ax, 0xf
1:09A6  8946fc            mov      word ptr [bp - 4], ax
1:09A9  e91a00            jmp      0x9c6
1:09AC  8b46fa            mov      ax, word ptr [bp - 6]
1:09AF  99                cdq      
1:09B0  2bc2              sub      ax, dx
1:09B2  d1f8              sar      ax, 1
1:09B4  8bd8              mov      bx, ax
1:09B6  c436dc0c          les      si, ptr [0xcdc]
1:09BA  268a00            mov      al, byte ptr es:[bx + si]
1:09BD  b104              mov      cl, 4
1:09BF  d2e8              shr      al, cl
1:09C1  2ae4              sub      ah, ah
1:09C3  8946fc            mov      word ptr [bp - 4], ax
1:09C6  c41ee00c          les      bx, ptr [0xce0]
1:09CA  ff06e00c          inc      word ptr [0xce0]
1:09CE  268a07            mov      al, byte ptr es:[bx]
1:09D1  2ae4              sub      ah, ah
1:09D3  2b061c10          sub      ax, word ptr [0x101c]
1:09D7  f7d8              neg      ax
1:09D9  8946f2            mov      word ptr [bp - 0xe], ax
1:09DC  837ef200          cmp      word ptr [bp - 0xe], 0
1:09E0  7c03              jl       0x9e5
1:09E2  e90600            jmp      0x9eb
1:09E5  a18600            mov      ax, word ptr [0x86]
1:09E8  0146f2            add      word ptr [bp - 0xe], ax
1:09EB  f646f201          test     byte ptr [bp - 0xe], 1
1:09EF  7503              jne      0x9f4
1:09F1  e91e00            jmp      0xa12
1:09F4  8b46f2            mov      ax, word ptr [bp - 0xe]
1:09F7  99                cdq      
1:09F8  2bc2              sub      ax, dx
1:09FA  d1f8              sar      ax, 1
1:09FC  8bd8              mov      bx, ax
1:09FE  c436dc0c          les      si, ptr [0xcdc]
1:0A02  268a00            mov      al, byte ptr es:[bx + si]
1:0A05  250f00            and      ax, 0xf
1:0A08  b104              mov      cl, 4
1:0A0A  d3e0              shl      ax, cl
1:0A0C  0946fc            or       word ptr [bp - 4], ax
1:0A0F  e91700            jmp      0xa29
1:0A12  8b46f2            mov      ax, word ptr [bp - 0xe]
1:0A15  99                cdq      
1:0A16  2bc2              sub      ax, dx
1:0A18  d1f8              sar      ax, 1
1:0A1A  8bd8              mov      bx, ax
1:0A1C  c436dc0c          les      si, ptr [0xcdc]
1:0A20  268a00            mov      al, byte ptr es:[bx + si]
1:0A23  25f000            and      ax, 0xf0
1:0A26  0946fc            or       word ptr [bp - 4], ax
1:0A29  8a46fc            mov      al, byte ptr [bp - 4]
1:0A2C  c41ee80c          les      bx, ptr [0xce8]
1:0A30  268807            mov      byte ptr es:[bx], al
1:0A33  ff0ee80c          dec      word ptr [0xce8]
1:0A37  e91eff            jmp      0x958
1:0A3A  a13c10            mov      ax, word ptr [0x103c]
1:0A3D  2906dc0c          sub      word ptr [0xcdc], ax
1:0A41  e9cafe            jmp      0x90e
1:0A44  c706040da00b      mov      word ptr [0xd04], 0xba0
1:0A4A  a1e40c            mov      ax, word ptr [0xce4]
1:0A4D  8b16e60c          mov      dx, word ptr [0xce6]
1:0A51  a3ec0c            mov      word ptr [0xcec], ax
1:0A54  8916ee0c          mov      word ptr [0xcee], dx
1:0A58  a18200            mov      ax, word ptr [0x82]
1:0A5B  48                dec      ax
1:0A5C  f76ef8            imul     word ptr [bp - 8]
1:0A5F  0306fc0c          add      ax, word ptr [0xcfc]
1:0A63  8b16fe0c          mov      dx, word ptr [0xcfe]
1:0A67  03068400          add      ax, word ptr [0x84]
1:0A6B  a3f40c            mov      word ptr [0xcf4], ax
1:0A6E  8916f60c          mov      word ptr [0xcf6], dx
1:0A72  a18200            mov      ax, word ptr [0x82]
1:0A75  48                dec      ax
1:0A76  f72e3c10          imul     word ptr [0x103c]
1:0A7A  0306f80c          add      ax, word ptr [0xcf8]
1:0A7E  8b16fa0c          mov      dx, word ptr [0xcfa]
1:0A82  a3dc0c            mov      word ptr [0xcdc], ax
1:0A85  8916de0c          mov      word ptr [0xcde], dx
1:0A89  a18000            mov      ax, word ptr [0x80]
1:0A8C  8946f0            mov      word ptr [bp - 0x10], ax
1:0A8F  e90300            jmp      0xa95
1:0A92  ff4ef0            dec      word ptr [bp - 0x10]
1:0A95  837ef000          cmp      word ptr [bp - 0x10], 0
1:0A99  7f03              jg       0xa9e
1:0A9B  e92a01            jmp      0xbc8
1:0A9E  a1ec0c            mov      ax, word ptr [0xcec]
1:0AA1  8b16ee0c          mov      dx, word ptr [0xcee]
1:0AA5  a3e00c            mov      word ptr [0xce0], ax
1:0AA8  8916e20c          mov      word ptr [0xce2], dx
1:0AAC  a18000            mov      ax, word ptr [0x80]
1:0AAF  0106ec0c          add      word ptr [0xcec], ax
1:0AB3  a1f40c            mov      ax, word ptr [0xcf4]
1:0AB6  8b16f60c          mov      dx, word ptr [0xcf6]
1:0ABA  a3e80c            mov      word ptr [0xce8], ax
1:0ABD  8916ea0c          mov      word ptr [0xcea], dx
1:0AC1  8b46f8            mov      ax, word ptr [bp - 8]
1:0AC4  2906f40c          sub      word ptr [0xcf4], ax
1:0AC8  8b1e040d          mov      bx, word ptr [0xd04]
1:0ACC  ff06040d          inc      word ptr [0xd04]
1:0AD0  8a07              mov      al, byte ptr [bx]
1:0AD2  d0e8              shr      al, 1
1:0AD4  2ae4              sub      ah, ah
1:0AD6  8946ee            mov      word ptr [bp - 0x12], ax
1:0AD9  e90300            jmp      0xadf
1:0ADC  ff4eee            dec      word ptr [bp - 0x12]
1:0ADF  837eee00          cmp      word ptr [bp - 0x12], 0
1:0AE3  7f03              jg       0xae8
1:0AE5  e9d600            jmp      0xbbe
1:0AE8  c41ee00c          les      bx, ptr [0xce0]
1:0AEC  ff06e00c          inc      word ptr [0xce0]
1:0AF0  268a07            mov      al, byte ptr es:[bx]
1:0AF3  2ae4              sub      ah, ah
1:0AF5  03061c10          add      ax, word ptr [0x101c]
1:0AF9  8946fa            mov      word ptr [bp - 6], ax
1:0AFC  a18600            mov      ax, word ptr [0x86]
1:0AFF  3946fa            cmp      word ptr [bp - 6], ax
1:0B02  7d03              jge      0xb07
1:0B04  e90600            jmp      0xb0d
1:0B07  a18600            mov      ax, word ptr [0x86]
1:0B0A  2946fa            sub      word ptr [bp - 6], ax
1:0B0D  f646fa01          test     byte ptr [bp - 6], 1
1:0B11  7503              jne      0xb16
1:0B13  e91e00            jmp      0xb34
1:0B16  8b46fa            mov      ax, word ptr [bp - 6]
1:0B19  99                cdq      
1:0B1A  2bc2              sub      ax, dx
1:0B1C  d1f8              sar      ax, 1
1:0B1E  8bd8              mov      bx, ax
1:0B20  c436dc0c          les      si, ptr [0xcdc]
1:0B24  268a00            mov      al, byte ptr es:[bx + si]
1:0B27  250f00            and      ax, 0xf
1:0B2A  b104              mov      cl, 4
1:0B2C  d3e0              shl      ax, cl
1:0B2E  8946fc            mov      word ptr [bp - 4], ax
1:0B31  e91700            jmp      0xb4b
1:0B34  8b46fa            mov      ax, word ptr [bp - 6]
1:0B37  99                cdq      
1:0B38  2bc2              sub      ax, dx
1:0B3A  d1f8              sar      ax, 1
1:0B3C  8bd8              mov      bx, ax
1:0B3E  c436dc0c          les      si, ptr [0xcdc]
1:0B42  268a00            mov      al, byte ptr es:[bx + si]
1:0B45  25f000            and      ax, 0xf0
1:0B48  8946fc            mov      word ptr [bp - 4], ax
1:0B4B  c41ee00c          les      bx, ptr [0xce0]
1:0B4F  ff06e00c          inc      word ptr [0xce0]
1:0B53  268a07            mov      al, byte ptr es:[bx]
1:0B56  2ae4              sub      ah, ah
1:0B58  03061c10          add      ax, word ptr [0x101c]
1:0B5C  8946f2            mov      word ptr [bp - 0xe], ax
1:0B5F  a18600            mov      ax, word ptr [0x86]
1:0B62  3946f2            cmp      word ptr [bp - 0xe], ax
1:0B65  7d03              jge      0xb6a
1:0B67  e90600            jmp      0xb70
1:0B6A  a18600            mov      ax, word ptr [0x86]
1:0B6D  2946f2            sub      word ptr [bp - 0xe], ax
1:0B70  f646f201          test     byte ptr [bp - 0xe], 1
1:0B74  7503              jne      0xb79
1:0B76  e91a00            jmp      0xb93
1:0B79  8b46f2            mov      ax, word ptr [bp - 0xe]
1:0B7C  99                cdq      
1:0B7D  2bc2              sub      ax, dx
1:0B7F  d1f8              sar      ax, 1
1:0B81  8bd8              mov      bx, ax
1:0B83  c436dc0c          les      si, ptr [0xcdc]
1:0B87  268a00            mov      al, byte ptr es:[bx + si]
1:0B8A  250f00            and      ax, 0xf
1:0B8D  0946fc            or       word ptr [bp - 4], ax
1:0B90  e91a00            jmp      0xbad
1:0B93  8b46f2            mov      ax, word ptr [bp - 0xe]
1:0B96  99                cdq      
1:0B97  2bc2              sub      ax, dx
1:0B99  d1f8              sar      ax, 1
1:0B9B  8bd8              mov      bx, ax
1:0B9D  c436dc0c          les      si, ptr [0xcdc]
1:0BA1  268a00            mov      al, byte ptr es:[bx + si]
1:0BA4  b104              mov      cl, 4
1:0BA6  d2e8              shr      al, cl
1:0BA8  2ae4              sub      ah, ah
1:0BAA  0946fc            or       word ptr [bp - 4], ax
1:0BAD  8a46fc            mov      al, byte ptr [bp - 4]
1:0BB0  c41ee80c          les      bx, ptr [0xce8]
1:0BB4  268807            mov      byte ptr es:[bx], al
1:0BB7  ff06e80c          inc      word ptr [0xce8]
1:0BBB  e91eff            jmp      0xadc
1:0BBE  a13c10            mov      ax, word ptr [0x103c]
1:0BC1  2906dc0c          sub      word ptr [0xcdc], ax
1:0BC5  e9cafe            jmp      0xa92
1:0BC8  e98203            jmp      0xf4d
1:0BCB  c706040da00b      mov      word ptr [0xd04], 0xba0
1:0BD1  a1e40c            mov      ax, word ptr [0xce4]
1:0BD4  8b16e60c          mov      dx, word ptr [0xce6]
1:0BD8  a3ec0c            mov      word ptr [0xcec], ax
1:0BDB  8916ee0c          mov      word ptr [0xcee], dx
1:0BDF  a1fc0c            mov      ax, word ptr [0xcfc]
1:0BE2  8b16fe0c          mov      dx, word ptr [0xcfe]
1:0BE6  03068000          add      ax, word ptr [0x80]
1:0BEA  a3f40c            mov      word ptr [0xcf4], ax
1:0BED  8916f60c          mov      word ptr [0xcf6], dx
1:0BF1  a1f80c            mov      ax, word ptr [0xcf8]
1:0BF4  8b16fa0c          mov      dx, word ptr [0xcfa]
1:0BF8  a3dc0c            mov      word ptr [0xcdc], ax
1:0BFB  8916de0c          mov      word ptr [0xcde], dx
1:0BFF  a18000            mov      ax, word ptr [0x80]
1:0C02  8946f0            mov      word ptr [bp - 0x10], ax
1:0C05  e90300            jmp      0xc0b
1:0C08  ff4ef0            dec      word ptr [bp - 0x10]
1:0C0B  837ef000          cmp      word ptr [bp - 0x10], 0
1:0C0F  7f03              jg       0xc14
1:0C11  e98f00            jmp      0xca3
1:0C14  a1ec0c            mov      ax, word ptr [0xcec]
1:0C17  8b16ee0c          mov      dx, word ptr [0xcee]
1:0C1B  a3e00c            mov      word ptr [0xce0], ax
1:0C1E  8916e20c          mov      word ptr [0xce2], dx
1:0C22  a18000            mov      ax, word ptr [0x80]
1:0C25  0106ec0c          add      word ptr [0xcec], ax
1:0C29  a1f40c            mov      ax, word ptr [0xcf4]
1:0C2C  8b16f60c          mov      dx, word ptr [0xcf6]
1:0C30  a3e80c            mov      word ptr [0xce8], ax
1:0C33  8916ea0c          mov      word ptr [0xcea], dx
1:0C37  8b46f8            mov      ax, word ptr [bp - 8]
1:0C3A  0106f40c          add      word ptr [0xcf4], ax
1:0C3E  8b1e040d          mov      bx, word ptr [0xd04]
1:0C42  ff06040d          inc      word ptr [0xd04]
1:0C46  8a07              mov      al, byte ptr [bx]
1:0C48  2ae4              sub      ah, ah
1:0C4A  8946ee            mov      word ptr [bp - 0x12], ax
1:0C4D  e90300            jmp      0xc53
1:0C50  ff4eee            dec      word ptr [bp - 0x12]
1:0C53  837eee00          cmp      word ptr [bp - 0x12], 0
1:0C57  7f03              jg       0xc5c
1:0C59  e93d00            jmp      0xc99
1:0C5C  c41ee00c          les      bx, ptr [0xce0]
1:0C60  ff06e00c          inc      word ptr [0xce0]
1:0C64  268a07            mov      al, byte ptr es:[bx]
1:0C67  2ae4              sub      ah, ah
1:0C69  2b061c10          sub      ax, word ptr [0x101c]
1:0C6D  f7d8              neg      ax
1:0C6F  8946fa            mov      word ptr [bp - 6], ax
1:0C72  837efa00          cmp      word ptr [bp - 6], 0
1:0C76  7c03              jl       0xc7b
1:0C78  e90600            jmp      0xc81
1:0C7B  a18600            mov      ax, word ptr [0x86]
1:0C7E  0146fa            add      word ptr [bp - 6], ax
1:0C81  c41edc0c          les      bx, ptr [0xcdc]
1:0C85  8b76fa            mov      si, word ptr [bp - 6]
1:0C88  268a00            mov      al, byte ptr es:[bx + si]
1:0C8B  c41ee80c          les      bx, ptr [0xce8]
1:0C8F  268807            mov      byte ptr es:[bx], al
1:0C92  ff0ee80c          dec      word ptr [0xce8]
1:0C96  e9b7ff            jmp      0xc50
1:0C99  a13c10            mov      ax, word ptr [0x103c]
1:0C9C  0106dc0c          add      word ptr [0xcdc], ax
1:0CA0  e965ff            jmp      0xc08
1:0CA3  c706040da00b      mov      word ptr [0xd04], 0xba0
1:0CA9  a1e40c            mov      ax, word ptr [0xce4]
1:0CAC  8b16e60c          mov      dx, word ptr [0xce6]
1:0CB0  a3ec0c            mov      word ptr [0xcec], ax
1:0CB3  8916ee0c          mov      word ptr [0xcee], dx
1:0CB7  a1fc0c            mov      ax, word ptr [0xcfc]
1:0CBA  8b16fe0c          mov      dx, word ptr [0xcfe]
1:0CBE  03068000          add      ax, word ptr [0x80]
1:0CC2  a3f40c            mov      word ptr [0xcf4], ax
1:0CC5  8916f60c          mov      word ptr [0xcf6], dx
1:0CC9  a1f80c            mov      ax, word ptr [0xcf8]
1:0CCC  8b16fa0c          mov      dx, word ptr [0xcfa]
1:0CD0  a3dc0c            mov      word ptr [0xcdc], ax
1:0CD3  8916de0c          mov      word ptr [0xcde], dx
1:0CD7  a18000            mov      ax, word ptr [0x80]
1:0CDA  8946f0            mov      word ptr [bp - 0x10], ax
1:0CDD  e90300            jmp      0xce3
1:0CE0  ff4ef0            dec      word ptr [bp - 0x10]
1:0CE3  837ef000          cmp      word ptr [bp - 0x10], 0
1:0CE7  7f03              jg       0xcec
1:0CE9  e98f00            jmp      0xd7b
1:0CEC  a1ec0c            mov      ax, word ptr [0xcec]
1:0CEF  8b16ee0c          mov      dx, word ptr [0xcee]
1:0CF3  a3e00c            mov      word ptr [0xce0], ax
1:0CF6  8916e20c          mov      word ptr [0xce2], dx
1:0CFA  a18000            mov      ax, word ptr [0x80]
1:0CFD  0106ec0c          add      word ptr [0xcec], ax
1:0D01  a1f40c            mov      ax, word ptr [0xcf4]
1:0D04  8b16f60c          mov      dx, word ptr [0xcf6]
1:0D08  a3e80c            mov      word ptr [0xce8], ax
1:0D0B  8916ea0c          mov      word ptr [0xcea], dx
1:0D0F  8b46f8            mov      ax, word ptr [bp - 8]
1:0D12  0106f40c          add      word ptr [0xcf4], ax
1:0D16  8b1e040d          mov      bx, word ptr [0xd04]
1:0D1A  ff06040d          inc      word ptr [0xd04]
1:0D1E  8a07              mov      al, byte ptr [bx]
1:0D20  2ae4              sub      ah, ah
1:0D22  8946ee            mov      word ptr [bp - 0x12], ax
1:0D25  e90300            jmp      0xd2b
1:0D28  ff4eee            dec      word ptr [bp - 0x12]
1:0D2B  837eee00          cmp      word ptr [bp - 0x12], 0
1:0D2F  7f03              jg       0xd34
1:0D31  e93d00            jmp      0xd71
1:0D34  c41ee00c          les      bx, ptr [0xce0]
1:0D38  ff06e00c          inc      word ptr [0xce0]
1:0D3C  268a07            mov      al, byte ptr es:[bx]
1:0D3F  2ae4              sub      ah, ah
1:0D41  03061c10          add      ax, word ptr [0x101c]
1:0D45  8946fa            mov      word ptr [bp - 6], ax
1:0D48  a18600            mov      ax, word ptr [0x86]
1:0D4B  3946fa            cmp      word ptr [bp - 6], ax
1:0D4E  7d03              jge      0xd53
1:0D50  e90600            jmp      0xd59
1:0D53  a18600            mov      ax, word ptr [0x86]
1:0D56  2946fa            sub      word ptr [bp - 6], ax
1:0D59  c41edc0c          les      bx, ptr [0xcdc]
1:0D5D  8b76fa            mov      si, word ptr [bp - 6]
1:0D60  268a00            mov      al, byte ptr es:[bx + si]
1:0D63  c41ee80c          les      bx, ptr [0xce8]
1:0D67  268807            mov      byte ptr es:[bx], al
1:0D6A  ff06e80c          inc      word ptr [0xce8]
1:0D6E  e9b7ff            jmp      0xd28
1:0D71  a13c10            mov      ax, word ptr [0x103c]
1:0D74  0106dc0c          add      word ptr [0xcdc], ax
1:0D78  e965ff            jmp      0xce0
1:0D7B  c706040da00b      mov      word ptr [0xd04], 0xba0
1:0D81  a1e40c            mov      ax, word ptr [0xce4]
1:0D84  8b16e60c          mov      dx, word ptr [0xce6]
1:0D88  a3ec0c            mov      word ptr [0xcec], ax
1:0D8B  8916ee0c          mov      word ptr [0xcee], dx
1:0D8F  a18200            mov      ax, word ptr [0x82]
1:0D92  48                dec      ax
1:0D93  f76ef8            imul     word ptr [bp - 8]
1:0D96  0306fc0c          add      ax, word ptr [0xcfc]
1:0D9A  8b16fe0c          mov      dx, word ptr [0xcfe]
1:0D9E  03068000          add      ax, word ptr [0x80]
1:0DA2  a3f40c            mov      word ptr [0xcf4], ax
1:0DA5  8916f60c          mov      word ptr [0xcf6], dx
1:0DA9  a18200            mov      ax, word ptr [0x82]
1:0DAC  48                dec      ax
1:0DAD  f72e3c10          imul     word ptr [0x103c]
1:0DB1  0306f80c          add      ax, word ptr [0xcf8]
1:0DB5  8b16fa0c          mov      dx, word ptr [0xcfa]
1:0DB9  a3dc0c            mov      word ptr [0xcdc], ax
1:0DBC  8916de0c          mov      word ptr [0xcde], dx
1:0DC0  a18000            mov      ax, word ptr [0x80]
1:0DC3  8946f0            mov      word ptr [bp - 0x10], ax
1:0DC6  e90300            jmp      0xdcc
1:0DC9  ff4ef0            dec      word ptr [bp - 0x10]
1:0DCC  837ef000          cmp      word ptr [bp - 0x10], 0
1:0DD0  7f03              jg       0xdd5
1:0DD2  e98f00            jmp      0xe64
1:0DD5  a1ec0c            mov      ax, word ptr [0xcec]
1:0DD8  8b16ee0c          mov      dx, word ptr [0xcee]
1:0DDC  a3e00c            mov      word ptr [0xce0], ax
1:0DDF  8916e20c          mov      word ptr [0xce2], dx
1:0DE3  a18000            mov      ax, word ptr [0x80]
1:0DE6  0106ec0c          add      word ptr [0xcec], ax
1:0DEA  a1f40c            mov      ax, word ptr [0xcf4]
1:0DED  8b16f60c          mov      dx, word ptr [0xcf6]
1:0DF1  a3e80c            mov      word ptr [0xce8], ax
1:0DF4  8916ea0c          mov      word ptr [0xcea], dx
1:0DF8  8b46f8            mov      ax, word ptr [bp - 8]
1:0DFB  2906f40c          sub      word ptr [0xcf4], ax
1:0DFF  8b1e040d          mov      bx, word ptr [0xd04]
1:0E03  ff06040d          inc      word ptr [0xd04]
1:0E07  8a07              mov      al, byte ptr [bx]
1:0E09  2ae4              sub      ah, ah
1:0E0B  8946ee            mov      word ptr [bp - 0x12], ax
1:0E0E  e90300            jmp      0xe14
1:0E11  ff4eee            dec      word ptr [bp - 0x12]
1:0E14  837eee00          cmp      word ptr [bp - 0x12], 0
1:0E18  7f03              jg       0xe1d
1:0E1A  e93d00            jmp      0xe5a
1:0E1D  c41ee00c          les      bx, ptr [0xce0]
1:0E21  ff06e00c          inc      word ptr [0xce0]
1:0E25  268a07            mov      al, byte ptr es:[bx]
1:0E28  2ae4              sub      ah, ah
1:0E2A  2b061c10          sub      ax, word ptr [0x101c]
1:0E2E  f7d8              neg      ax
1:0E30  8946fa            mov      word ptr [bp - 6], ax
1:0E33  837efa00          cmp      word ptr [bp - 6], 0
1:0E37  7c03              jl       0xe3c
1:0E39  e90600            jmp      0xe42
1:0E3C  a18600            mov      ax, word ptr [0x86]
1:0E3F  0146fa            add      word ptr [bp - 6], ax
1:0E42  c41edc0c          les      bx, ptr [0xcdc]
1:0E46  8b76fa            mov      si, word ptr [bp - 6]
1:0E49  268a00            mov      al, byte ptr es:[bx + si]
1:0E4C  c41ee80c          les      bx, ptr [0xce8]
1:0E50  268807            mov      byte ptr es:[bx], al
1:0E53  ff0ee80c          dec      word ptr [0xce8]
1:0E57  e9b7ff            jmp      0xe11
1:0E5A  a13c10            mov      ax, word ptr [0x103c]
1:0E5D  2906dc0c          sub      word ptr [0xcdc], ax
1:0E61  e965ff            jmp      0xdc9
1:0E64  c706040da00b      mov      word ptr [0xd04], 0xba0
1:0E6A  a1e40c            mov      ax, word ptr [0xce4]
1:0E6D  8b16e60c          mov      dx, word ptr [0xce6]
1:0E71  a3ec0c            mov      word ptr [0xcec], ax
1:0E74  8916ee0c          mov      word ptr [0xcee], dx
1:0E78  a18200            mov      ax, word ptr [0x82]
1:0E7B  48                dec      ax
1:0E7C  f76ef8            imul     word ptr [bp - 8]
1:0E7F  0306fc0c          add      ax, word ptr [0xcfc]
1:0E83  8b16fe0c          mov      dx, word ptr [0xcfe]
1:0E87  03068000          add      ax, word ptr [0x80]
1:0E8B  a3f40c            mov      word ptr [0xcf4], ax
1:0E8E  8916f60c          mov      word ptr [0xcf6], dx
1:0E92  a18200            mov      ax, word ptr [0x82]
1:0E95  48                dec      ax
1:0E96  f72e3c10          imul     word ptr [0x103c]
1:0E9A  0306f80c          add      ax, word ptr [0xcf8]
1:0E9E  8b16fa0c          mov      dx, word ptr [0xcfa]
1:0EA2  a3dc0c            mov      word ptr [0xcdc], ax
1:0EA5  8916de0c          mov      word ptr [0xcde], dx
1:0EA9  a18000            mov      ax, word ptr [0x80]
1:0EAC  8946f0            mov      word ptr [bp - 0x10], ax
1:0EAF  e90300            jmp      0xeb5
1:0EB2  ff4ef0            dec      word ptr [bp - 0x10]
1:0EB5  837ef000          cmp      word ptr [bp - 0x10], 0
1:0EB9  7f03              jg       0xebe
1:0EBB  e98f00            jmp      0xf4d
1:0EBE  a1ec0c            mov      ax, word ptr [0xcec]
1:0EC1  8b16ee0c          mov      dx, word ptr [0xcee]
1:0EC5  a3e00c            mov      word ptr [0xce0], ax
1:0EC8  8916e20c          mov      word ptr [0xce2], dx
1:0ECC  a18000            mov      ax, word ptr [0x80]
1:0ECF  0106ec0c          add      word ptr [0xcec], ax
1:0ED3  a1f40c            mov      ax, word ptr [0xcf4]
1:0ED6  8b16f60c          mov      dx, word ptr [0xcf6]
1:0EDA  a3e80c            mov      word ptr [0xce8], ax
1:0EDD  8916ea0c          mov      word ptr [0xcea], dx
1:0EE1  8b46f8            mov      ax, word ptr [bp - 8]
1:0EE4  2906f40c          sub      word ptr [0xcf4], ax
1:0EE8  8b1e040d          mov      bx, word ptr [0xd04]
1:0EEC  ff06040d          inc      word ptr [0xd04]
1:0EF0  8a07              mov      al, byte ptr [bx]
1:0EF2  2ae4              sub      ah, ah
1:0EF4  8946ee            mov      word ptr [bp - 0x12], ax
1:0EF7  e90300            jmp      0xefd
1:0EFA  ff4eee            dec      word ptr [bp - 0x12]
1:0EFD  837eee00          cmp      word ptr [bp - 0x12], 0
1:0F01  7f03              jg       0xf06
1:0F03  e93d00            jmp      0xf43
1:0F06  c41ee00c          les      bx, ptr [0xce0]
1:0F0A  ff06e00c          inc      word ptr [0xce0]
1:0F0E  268a07            mov      al, byte ptr es:[bx]
1:0F11  2ae4              sub      ah, ah
1:0F13  03061c10          add      ax, word ptr [0x101c]
1:0F17  8946fa            mov      word ptr [bp - 6], ax
1:0F1A  a18600            mov      ax, word ptr [0x86]
1:0F1D  3946fa            cmp      word ptr [bp - 6], ax
1:0F20  7d03              jge      0xf25
1:0F22  e90600            jmp      0xf2b
1:0F25  a18600            mov      ax, word ptr [0x86]
1:0F28  2946fa            sub      word ptr [bp - 6], ax
1:0F2B  c41edc0c          les      bx, ptr [0xcdc]
1:0F2F  8b76fa            mov      si, word ptr [bp - 6]
1:0F32  268a00            mov      al, byte ptr es:[bx + si]
1:0F35  c41ee80c          les      bx, ptr [0xce8]
1:0F39  268807            mov      byte ptr es:[bx], al
1:0F3C  ff06e80c          inc      word ptr [0xce8]
1:0F40  e9b7ff            jmp      0xefa
1:0F43  a13c10            mov      ax, word ptr [0x103c]
1:0F46  2906dc0c          sub      word ptr [0xcdc], ax
1:0F4A  e965ff            jmp      0xeb2
1:0F4D  ff36aa11          push     word ptr [0x11aa]
1:0F51  9a5b0f0000        lcall    0, 0xf5b  ; @1:KERNEL.GlobalUnlock
1:0F56  ff367000          push     word ptr [0x70]
1:0F5A  9a640f0000        lcall    0, 0xf64  ; @1:KERNEL.GlobalUnlock
1:0F5F  ff362610          push     word ptr [0x1026]
1:0F63  9a22050000        lcall    0, 0x522  ; @1:KERNEL.GlobalUnlock
1:0F68  ff367200          push     word ptr [0x72]
1:0F6C  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteObject
1:0F71  ff366e00          push     word ptr [0x6e]
1:0F75  ff367000          push     word ptr [0x70]
1:0F79  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_14(1:2134)
1:0F7E  83c404            add      sp, 4
1:0F81  a37200            mov      word ptr [0x72], ax
1:0F84  5e                pop      si
1:0F85  5f                pop      di
1:0F86  83ed02            sub      bp, 2
1:0F89  8be5              mov      sp, bp
1:0F8B  1f                pop      ds
1:0F8C  5d                pop      bp
1:0F8D  4d                dec      bp
1:0F8E  cb                retf     

; ===== EXPORT:ord_39(#39) =====
1:0F8F  1e                push     ds
1:0F90  58                pop      ax
1:0F91  90                nop      
1:0F92  45                inc      bp
1:0F93  55                push     bp
1:0F94  8bec              mov      bp, sp
1:0F96  1e                push     ds
1:0F97  8ed8              mov      ds, ax
1:0F99  81ec0400          sub      sp, 4
1:0F9D  57                push     di
1:0F9E  56                push     si
1:0F9F  c41eae11          les      bx, ptr [0x11ae]
1:0FA3  268b4706          mov      ax, word ptr es:[bx + 6]
1:0FA7  a33010            mov      word ptr [0x1030], ax
1:0FAA  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_16(1:0531)
1:0FAF  a13010            mov      ax, word ptr [0x1030]
1:0FB2  29063410          sub      word ptr [0x1034], ax
1:0FB6  813e34106801      cmp      word ptr [0x1034], 0x168
1:0FBC  7d03              jge      0xfc1
1:0FBE  e90600            jmp      0xfc7
1:0FC1  812e34106801      sub      word ptr [0x1034], 0x168
1:0FC7  833e341000        cmp      word ptr [0x1034], 0
1:0FCC  7c03              jl       0xfd1
1:0FCE  e90600            jmp      0xfd7
1:0FD1  810634106801      add      word ptr [0x1034], 0x168
1:0FD7  b86801            mov      ax, 0x168
1:0FDA  ba0000            mov      dx, 0
1:0FDD  52                push     dx
1:0FDE  50                push     ax
1:0FDF  a13410            mov      ax, word ptr [0x1034]
1:0FE2  f72e8600          imul     word ptr [0x86]
1:0FE6  52                push     dx
1:0FE7  50                push     ax
1:0FE8  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_15(1:2D92)
1:0FED  a31c10            mov      word ptr [0x101c], ax
1:0FF0  a12210            mov      ax, word ptr [0x1022]
1:0FF3  a3420d            mov      word ptr [0xd42], ax
1:0FF6  a12410            mov      ax, word ptr [0x1024]
1:0FF9  a3080d            mov      word ptr [0xd08], ax
1:0FFC  a13810            mov      ax, word ptr [0x1038]
1:0FFF  a3060d            mov      word ptr [0xd06], ax
1:1002  a13a10            mov      ax, word ptr [0x103a]
1:1005  a30a0d            mov      word ptr [0xd0a], ax
1:1008  ff0e2810          dec      word ptr [0x1028]
1:100C  833e281000        cmp      word ptr [0x1028], 0
1:1011  7403              je       0x1016
1:1013  e96800            jmp      0x107e
1:1016  a11810            mov      ax, word ptr [0x1018]
1:1019  f72e3810          imul     word ptr [0x1038]
1:101D  01062210          add      word ptr [0x1022], ax
1:1021  a12210            mov      ax, word ptr [0x1022]
1:1024  0306b411          add      ax, word ptr [0x11b4]
1:1028  c41eae11          les      bx, ptr [0x11ae]
1:102C  26394702          cmp      word ptr es:[bx + 2], ax
1:1030  7f03              jg       0x1035
1:1032  e90a00            jmp      0x103f
1:1035  833e221000        cmp      word ptr [0x1022], 0
1:103A  7c03              jl       0x103f
1:103C  e90400            jmp      0x1043
1:103F  f71e3810          neg      word ptr [0x1038]
1:1043  a11810            mov      ax, word ptr [0x1018]
1:1046  f72e3a10          imul     word ptr [0x103a]
1:104A  01062410          add      word ptr [0x1024], ax
1:104E  a12410            mov      ax, word ptr [0x1024]
1:1051  0306b611          add      ax, word ptr [0x11b6]
1:1055  c41eae11          les      bx, ptr [0x11ae]
1:1059  26394704          cmp      word ptr es:[bx + 4], ax
1:105D  7f03              jg       0x1062
1:105F  e90a00            jmp      0x106c
1:1062  833e241000        cmp      word ptr [0x1024], 0
1:1067  7c03              jl       0x106c
1:1069  e90400            jmp      0x1070
1:106C  f71e3a10          neg      word ptr [0x103a]
1:1070  a1ac11            mov      ax, word ptr [0x11ac]
1:1073  a32810            mov      word ptr [0x1028], ax
1:1076  c746fc0100        mov      word ptr [bp - 4], 1
1:107B  e90500            jmp      0x1083
1:107E  c746fc0000        mov      word ptr [bp - 4], 0
1:1083  833e720000        cmp      word ptr [0x72], 0
1:1088  7503              jne      0x108d
1:108A  e92100            jmp      0x10ae
1:108D  833e7a0000        cmp      word ptr [0x7a], 0
1:1092  7403              je       0x1097
1:1094  e91700            jmp      0x10ae
1:1097  b82000            mov      ax, 0x20
1:109A  bacc00            mov      dx, 0xcc
1:109D  52                push     dx
1:109E  50                push     ax
1:109F  ff367200          push     word ptr [0x72]
1:10A3  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_19(1:23AF)
1:10A8  83c406            add      sp, 6
1:10AB  e93e00            jmp      0x10ec
1:10AE  833e700000        cmp      word ptr [0x70], 0
1:10B3  7503              jne      0x10b8
1:10B5  e93400            jmp      0x10ec
1:10B8  b81a0d            mov      ax, 0xd1a
1:10BB  1e                push     ds
1:10BC  50                push     ax
1:10BD  ff367000          push     word ptr [0x70]
1:10C1  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_18(1:1880)
1:10C6  83c406            add      sp, 6
1:10C9  b82000            mov      ax, 0x20
1:10CC  bacc00            mov      dx, 0xcc
1:10CF  52                push     dx
1:10D0  50                push     ax
1:10D1  b80000            mov      ax, 0
1:10D4  50                push     ax
1:10D5  50                push     ax
1:10D6  ff367000          push     word ptr [0x70]
1:10DA  ff36220d          push     word ptr [0xd22]
1:10DE  ff361e0d          push     word ptr [0xd1e]
1:10E2  50                push     ax
1:10E3  50                push     ax
1:10E4  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_17(1:222E)
1:10E9  83c412            add      sp, 0x12
1:10EC  837efc00          cmp      word ptr [bp - 4], 0
1:10F0  7503              jne      0x10f5
1:10F2  e92301            jmp      0x1218
1:10F5  833e060d00        cmp      word ptr [0xd06], 0
1:10FA  7f03              jg       0x10ff
1:10FC  e97200            jmp      0x1171
1:10FF  b8440d            mov      ax, 0xd44
1:1102  1e                push     ds
1:1103  50                push     ax
1:1104  ff36420d          push     word ptr [0xd42]
1:1108  ff36080d          push     word ptr [0xd08]
1:110C  ff362210          push     word ptr [0x1022]
1:1110  a1b611            mov      ax, word ptr [0x11b6]
1:1113  0306080d          add      ax, word ptr [0xd08]
1:1117  50                push     ax
1:1118  9a41110000        lcall    0, 0x1141  ; @1:USER.SetRect
1:111D  833e0a0d00        cmp      word ptr [0xd0a], 0
1:1122  7f03              jg       0x1127
1:1124  e92100            jmp      0x1148
1:1127  b80c0d            mov      ax, 0xd0c
1:112A  1e                push     ds
1:112B  50                push     ax
1:112C  ff36420d          push     word ptr [0xd42]
1:1130  ff36080d          push     word ptr [0xd08]
1:1134  a1420d            mov      ax, word ptr [0xd42]
1:1137  0306b411          add      ax, word ptr [0x11b4]
1:113B  50                push     ax
1:113C  ff362410          push     word ptr [0x1024]
1:1140  9a6a110000        lcall    0, 0x116a  ; @1:USER.SetRect
1:1145  e92600            jmp      0x116e
1:1148  b80c0d            mov      ax, 0xd0c
1:114B  1e                push     ds
1:114C  50                push     ax
1:114D  ff36420d          push     word ptr [0xd42]
1:1151  a12410            mov      ax, word ptr [0x1024]
1:1154  0306b611          add      ax, word ptr [0x11b6]
1:1158  50                push     ax
1:1159  a1420d            mov      ax, word ptr [0xd42]
1:115C  0306b411          add      ax, word ptr [0x11b4]
1:1160  50                push     ax
1:1161  a1b611            mov      ax, word ptr [0x11b6]
1:1164  0306080d          add      ax, word ptr [0xd08]
1:1168  50                push     ax
1:1169  9a93110000        lcall    0, 0x1193  ; @1:USER.SetRect
1:116E  e97700            jmp      0x11e8
1:1171  b8440d            mov      ax, 0xd44
1:1174  1e                push     ds
1:1175  50                push     ax
1:1176  a12210            mov      ax, word ptr [0x1022]
1:1179  0306b411          add      ax, word ptr [0x11b4]
1:117D  50                push     ax
1:117E  ff36080d          push     word ptr [0xd08]
1:1182  a1420d            mov      ax, word ptr [0xd42]
1:1185  0306b411          add      ax, word ptr [0x11b4]
1:1189  50                push     ax
1:118A  a1b611            mov      ax, word ptr [0x11b6]
1:118D  0306080d          add      ax, word ptr [0xd08]
1:1191  50                push     ax
1:1192  9abb110000        lcall    0, 0x11bb  ; @1:USER.SetRect
1:1197  833e0a0d00        cmp      word ptr [0xd0a], 0
1:119C  7f03              jg       0x11a1
1:119E  e92100            jmp      0x11c2
1:11A1  b80c0d            mov      ax, 0xd0c
1:11A4  1e                push     ds
1:11A5  50                push     ax
1:11A6  ff36420d          push     word ptr [0xd42]
1:11AA  ff36080d          push     word ptr [0xd08]
1:11AE  a1420d            mov      ax, word ptr [0xd42]
1:11B1  0306b411          add      ax, word ptr [0x11b4]
1:11B5  50                push     ax
1:11B6  ff362410          push     word ptr [0x1024]
1:11BA  9ae4110000        lcall    0, 0x11e4  ; @1:USER.SetRect
1:11BF  e92600            jmp      0x11e8
1:11C2  b80c0d            mov      ax, 0xd0c
1:11C5  1e                push     ds
1:11C6  50                push     ax
1:11C7  ff36420d          push     word ptr [0xd42]
1:11CB  a12410            mov      ax, word ptr [0x1024]
1:11CE  0306b611          add      ax, word ptr [0x11b6]
1:11D2  50                push     ax
1:11D3  a1420d            mov      ax, word ptr [0xd42]
1:11D6  0306b411          add      ax, word ptr [0x11b4]
1:11DA  50                push     ax
1:11DB  a1b611            mov      ax, word ptr [0x11b6]
1:11DE  0306080d          add      ax, word ptr [0xd08]
1:11E2  50                push     ax
1:11E3  9abb000000        lcall    0, 0xbb  ; @1:USER.SetRect
1:11E8  ff361610          push     word ptr [0x1016]
1:11EC  b8440d            mov      ax, 0xd44
1:11EF  1e                push     ds
1:11F0  50                push     ax
1:11F1  b80400            mov      ax, 4
1:11F4  50                push     ax
1:11F5  9a0e120000        lcall    0, 0x120e  ; @1:GDI.GetStockObject
1:11FA  50                push     ax
1:11FB  9a14120000        lcall    0, 0x1214  ; @1:USER.FillRect
1:1200  ff361610          push     word ptr [0x1016]
1:1204  b80c0d            mov      ax, 0xd0c
1:1207  1e                push     ds
1:1208  50                push     ax
1:1209  b80400            mov      ax, 4
1:120C  50                push     ax
1:120D  9acd000000        lcall    0, 0xcd  ; @1:GDI.GetStockObject
1:1212  50                push     ax
1:1213  9ad3000000        lcall    0, 0xd3  ; @1:USER.FillRect
1:1218  b80000            mov      ax, 0
1:121B  e90000            jmp      0x121e
1:121E  5e                pop      si
1:121F  5f                pop      di
1:1220  83ed02            sub      bp, 2
1:1223  8be5              mov      sp, bp
1:1225  1f                pop      ds
1:1226  5d                pop      bp
1:1227  4d                dec      bp
1:1228  cb                retf     

; ===== EXPORT:ord_38(#38) =====
1:1229  1e                push     ds
1:122A  58                pop      ax
1:122B  90                nop      
1:122C  45                inc      bp
1:122D  55                push     bp
1:122E  8bec              mov      bp, sp
1:1230  1e                push     ds
1:1231  8ed8              mov      ds, ax
1:1233  81ec0000          sub      sp, 0
1:1237  57                push     di
1:1238  56                push     si
1:1239  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_20(1:1641)
1:123E  b80000            mov      ax, 0
1:1241  e90000            jmp      0x1244
1:1244  5e                pop      si
1:1245  5f                pop      di
1:1246  83ed02            sub      bp, 2
1:1249  8be5              mov      sp, bp
1:124B  1f                pop      ds
1:124C  5d                pop      bp
1:124D  4d                dec      bp
1:124E  cb                retf     

; ===== EXPORT:ord_37(#37) =====
1:124F  1e                push     ds
1:1250  58                pop      ax
1:1251  90                nop      
1:1252  45                inc      bp
1:1253  55                push     bp
1:1254  8bec              mov      bp, sp
1:1256  1e                push     ds
1:1257  8ed8              mov      ds, ax
1:1259  81ec0000          sub      sp, 0
1:125D  57                push     di
1:125E  56                push     si
1:125F  b80000            mov      ax, 0
1:1262  e90000            jmp      0x1265
1:1265  5e                pop      si
1:1266  5f                pop      di
1:1267  83ed02            sub      bp, 2
1:126A  8be5              mov      sp, bp
1:126C  1f                pop      ds
1:126D  5d                pop      bp
1:126E  4d                dec      bp
1:126F  cb                retf     

; ===== EXPORT:ord_36(#36) =====
1:1270  1e                push     ds
1:1271  58                pop      ax
1:1272  90                nop      
1:1273  45                inc      bp
1:1274  55                push     bp
1:1275  8bec              mov      bp, sp
1:1277  1e                push     ds
1:1278  8ed8              mov      ds, ax
1:127A  81ec0000          sub      sp, 0
1:127E  57                push     di
1:127F  56                push     si
1:1280  b80000            mov      ax, 0
1:1283  e90000            jmp      0x1286
1:1286  5e                pop      si
1:1287  5f                pop      di
1:1288  83ed02            sub      bp, 2
1:128B  8be5              mov      sp, bp
1:128D  1f                pop      ds
1:128E  5d                pop      bp
1:128F  4d                dec      bp
1:1290  cb                retf     

; ===== EXPORT:ord_35(#35) =====
1:1291  1e                push     ds
1:1292  58                pop      ax
1:1293  90                nop      
1:1294  45                inc      bp
1:1295  55                push     bp
1:1296  8bec              mov      bp, sp
1:1298  1e                push     ds
1:1299  8ed8              mov      ds, ax
1:129B  81ec0000          sub      sp, 0
1:129F  57                push     di
1:12A0  56                push     si
1:12A1  8b4606            mov      ax, word ptr [bp + 6]
1:12A4  e9d900            jmp      0x1380
1:12A7  c41e1e10          les      bx, ptr [0x101e]
1:12AB  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:12B0  7503              jne      0x12b5
1:12B2  e90300            jmp      0x12b8
1:12B5  e9d700            jmp      0x138f
1:12B8  c41eae11          les      bx, ptr [0x11ae]
1:12BC  268b4708          mov      ax, word ptr es:[bx + 8]
1:12C0  e94e00            jmp      0x1311
1:12C3  c70618100100      mov      word ptr [0x1018], 1
1:12C9  c706ac11bc02      mov      word ptr [0x11ac], 0x2bc
1:12CF  e97900            jmp      0x134b
1:12D2  c70618100100      mov      word ptr [0x1018], 1
1:12D8  c706ac116400      mov      word ptr [0x11ac], 0x64
1:12DE  e96a00            jmp      0x134b
1:12E1  c70618100100      mov      word ptr [0x1018], 1
1:12E7  c706ac110100      mov      word ptr [0x11ac], 1
1:12ED  e95b00            jmp      0x134b
1:12F0  c70618100200      mov      word ptr [0x1018], 2
1:12F6  c706ac110100      mov      word ptr [0x11ac], 1
1:12FC  e94c00            jmp      0x134b
1:12FF  c70618100300      mov      word ptr [0x1018], 3
1:1305  c706ac110100      mov      word ptr [0x11ac], 1
1:130B  e93d00            jmp      0x134b
1:130E  e93a00            jmp      0x134b
1:1311  3d2800            cmp      ax, 0x28
1:1314  7503              jne      0x1319
1:1316  e9c8ff            jmp      0x12e1
1:1319  7e03              jle      0x131e
1:131B  e91200            jmp      0x1330
1:131E  0bc0              or       ax, ax
1:1320  7503              jne      0x1325
1:1322  e99eff            jmp      0x12c3
1:1325  2d1400            sub      ax, 0x14
1:1328  7503              jne      0x132d
1:132A  e9a5ff            jmp      0x12d2
1:132D  e91b00            jmp      0x134b
1:1330  2d3c00            sub      ax, 0x3c
1:1333  7503              jne      0x1338
1:1335  e9b8ff            jmp      0x12f0
1:1338  2d1400            sub      ax, 0x14
1:133B  7503              jne      0x1340
1:133D  e9bfff            jmp      0x12ff
1:1340  2d1400            sub      ax, 0x14
1:1343  7503              jne      0x1348
1:1345  e9b7ff            jmp      0x12ff
1:1348  e90000            jmp      0x134b
1:134B  a1ac11            mov      ax, word ptr [0x11ac]
1:134E  a32810            mov      word ptr [0x1028], ax
1:1351  e93b00            jmp      0x138f
1:1354  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_21(1:2445)
1:1359  3d0000            cmp      ax, 0
1:135C  7503              jne      0x1361
1:135E  e91900            jmp      0x137a
1:1361  b8bc01            mov      ax, 0x1bc
1:1364  1e                push     ds
1:1365  50                push     ax
1:1366  b8b201            mov      ax, 0x1b2
1:1369  1e                push     ds
1:136A  50                push     ax
1:136B  b83e10            mov      ax, 0x103e
1:136E  1e                push     ds
1:136F  50                push     ax
1:1370  b8a501            mov      ax, 0x1a5
1:1373  1e                push     ds
1:1374  50                push     ax
1:1375  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.WritePrivateProfileString
1:137A  e91200            jmp      0x138f
1:137D  e90f00            jmp      0x138f
1:1380  48                dec      ax
1:1381  7503              jne      0x1386
1:1383  e921ff            jmp      0x12a7
1:1386  48                dec      ax
1:1387  7503              jne      0x138c
1:1389  e9c8ff            jmp      0x1354
1:138C  e90000            jmp      0x138f
1:138F  b80000            mov      ax, 0
1:1392  e90000            jmp      0x1395
1:1395  5e                pop      si
1:1396  5f                pop      di
1:1397  83ed02            sub      bp, 2
1:139A  8be5              mov      sp, bp
1:139C  1f                pop      ds
1:139D  5d                pop      bp
1:139E  4d                dec      bp
1:139F  cb                retf     
1:13A0  1e                push     ds
1:13A1  58                pop      ax
1:13A2  90                nop      
1:13A3  45                inc      bp
1:13A4  55                push     bp
1:13A5  8bec              mov      bp, sp
1:13A7  1e                push     ds
1:13A8  8ed8              mov      ds, ax
1:13AA  81ec0000          sub      sp, 0
1:13AE  57                push     di
1:13AF  56                push     si
1:13B0  833e880000        cmp      word ptr [0x88], 0
1:13B5  7503              jne      0x13ba
1:13B7  e90d00            jmp      0x13c7
1:13BA  ff368800          push     word ptr [0x88]
1:13BE  b80000            mov      ax, 0
1:13C1  50                push     ax
1:13C2  9a2a000000        lcall    0, 0x2a  ; @1:USER.EndDialog
1:13C7  b80000            mov      ax, 0
1:13CA  e90000            jmp      0x13cd
1:13CD  5e                pop      si
1:13CE  5f                pop      di
1:13CF  83ed02            sub      bp, 2
1:13D2  8be5              mov      sp, bp
1:13D4  1f                pop      ds
1:13D5  5d                pop      bp
1:13D6  4d                dec      bp
1:13D7  cb                retf     

; ===== EXPORT:ord_5(#5) =====
1:13D8  1e                push     ds
1:13D9  58                pop      ax
1:13DA  90                nop      
1:13DB  45                inc      bp
1:13DC  55                push     bp
1:13DD  8bec              mov      bp, sp
1:13DF  1e                push     ds
1:13E0  8ed8              mov      ds, ax
1:13E2  81ecbe00          sub      sp, 0xbe
1:13E6  57                push     di
1:13E7  56                push     si
1:13E8  9a10150000        lcall    0, 0x1510  ; @1:INT:ord_20(1:1641)
1:13ED  b81000            mov      ax, 0x10
1:13F0  1e                push     ds
1:13F1  50                push     ax
1:13F2  8d8676ff          lea      ax, [bp - 0x8a]
1:13F6  16                push     ss
1:13F7  50                push     ax
1:13F8  b80000            mov      ax, 0
1:13FB  50                push     ax
1:13FC  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.OpenFile
1:1401  898642ff          mov      word ptr [bp - 0xbe], ax
1:1405  83be42ffff        cmp      word ptr [bp - 0xbe], -1
1:140A  7403              je       0x140f
1:140C  e90600            jmp      0x1415
1:140F  b80100            mov      ax, 1
1:1412  e92102            jmp      0x1636
1:1415  ffb642ff          push     word ptr [bp - 0xbe]
1:1419  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_23(1:1C07)
1:141E  83c402            add      sp, 2
1:1421  a37400            mov      word ptr [0x74], ax
1:1424  ffb642ff          push     word ptr [bp - 0xbe]
1:1428  2bc0              sub      ax, ax
1:142A  50                push     ax
1:142B  50                push     ax
1:142C  b80100            mov      ax, 1
1:142F  50                push     ax
1:1430  9affff0000        lcall    0, 0xffff  ; @1:KERNEL._llseek
1:1435  a31210            mov      word ptr [0x1012], ax
1:1438  89161410          mov      word ptr [0x1014], dx
1:143C  ffb642ff          push     word ptr [bp - 0xbe]
1:1440  9affff0000        lcall    0, 0xffff  ; @1:KERNEL._lclose
1:1445  833e740000        cmp      word ptr [0x74], 0
1:144A  7403              je       0x144f
1:144C  e90600            jmp      0x1455
1:144F  b80200            mov      ax, 2
1:1452  e9e101            jmp      0x1636
1:1455  8d8644ff          lea      ax, [bp - 0xbc]
1:1459  16                push     ss
1:145A  50                push     ax
1:145B  ff367400          push     word ptr [0x74]
1:145F  9ac2100000        lcall    0, 0x10c2  ; @1:INT:ord_18(1:1880)
1:1464  83c406            add      sp, 6
1:1467  ff367400          push     word ptr [0x74]
1:146B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_22(1:1BBA)
1:1470  83c402            add      sp, 2
1:1473  a36e00            mov      word ptr [0x6e], ax
1:1476  833e6e0000        cmp      word ptr [0x6e], 0
1:147B  7403              je       0x1480
1:147D  e90600            jmp      0x1486
1:1480  b80200            mov      ax, 2
1:1483  e9b001            jmp      0x1636
1:1486  ff367400          push     word ptr [0x74]
1:148A  9a46050000        lcall    0, 0x546  ; @1:KERNEL.GlobalLock
1:148F  89866eff          mov      word ptr [bp - 0x92], ax
1:1493  899670ff          mov      word ptr [bp - 0x90], dx
1:1497  c49e6eff          les      bx, ptr [bp - 0x92]
1:149B  26837f0e18        cmp      word ptr es:[bx + 0xe], 0x18
1:14A0  7503              jne      0x14a5
1:14A2  e94e00            jmp      0x14f3
1:14A5  c7066c000100      mov      word ptr [0x6c], 1
1:14AB  c49e6eff          les      bx, ptr [bp - 0x92]
1:14AF  268b07            mov      ax, word ptr es:[bx]
1:14B2  03866eff          add      ax, word ptr [bp - 0x92]
1:14B6  8b9670ff          mov      dx, word ptr [bp - 0x90]
1:14BA  898672ff          mov      word ptr [bp - 0x8e], ax
1:14BE  899674ff          mov      word ptr [bp - 0x8c], dx
1:14C2  c7866cff0000      mov      word ptr [bp - 0x94], 0
1:14C8  e90400            jmp      0x14cf
1:14CB  ff866cff          inc      word ptr [bp - 0x94]
1:14CF  8b866cff          mov      ax, word ptr [bp - 0x94]
1:14D3  c49e6eff          les      bx, ptr [bp - 0x92]
1:14D7  26394720          cmp      word ptr es:[bx + 0x20], ax
1:14DB  7f03              jg       0x14e0
1:14DD  e91300            jmp      0x14f3
1:14E0  8b866cff          mov      ax, word ptr [bp - 0x94]
1:14E4  c49e72ff          les      bx, ptr [bp - 0x8e]
1:14E8  838672ff02        add      word ptr [bp - 0x8e], 2
1:14ED  268907            mov      word ptr es:[bx], ax
1:14F0  e9d8ff            jmp      0x14cb
1:14F3  c49e6eff          les      bx, ptr [bp - 0x92]
1:14F7  26837f0e04        cmp      word ptr es:[bx + 0xe], 4
1:14FC  7503              jne      0x1501
1:14FE  e91900            jmp      0x151a
1:1501  c49e6eff          les      bx, ptr [bp - 0x92]
1:1505  26837f0e08        cmp      word ptr es:[bx + 0xe], 8
1:150A  7503              jne      0x150f
1:150C  e90b00            jmp      0x151a
1:150F  9a3a120000        lcall    0, 0x123a  ; @1:INT:ord_20(1:1641)
1:1514  b80400            mov      ax, 4
1:1517  e91c01            jmp      0x1636
1:151A  c49e6eff          les      bx, ptr [bp - 0x92]
1:151E  26837f0a00        cmp      word ptr es:[bx + 0xa], 0
1:1523  7603              jbe      0x1528
1:1525  e92400            jmp      0x154c
1:1528  26817f082c01      cmp      word ptr es:[bx + 8], 0x12c
1:152E  7603              jbe      0x1533
1:1530  e91900            jmp      0x154c
1:1533  c49e6eff          les      bx, ptr [bp - 0x92]
1:1537  26837f0600        cmp      word ptr es:[bx + 6], 0
1:153C  7603              jbe      0x1541
1:153E  e90b00            jmp      0x154c
1:1541  26817f04f401      cmp      word ptr es:[bx + 4], 0x1f4
1:1547  7703              ja       0x154c
1:1549  e90b00            jmp      0x1557
1:154C  9a88150000        lcall    0, 0x1588  ; @1:INT:ord_20(1:1641)
1:1551  b80300            mov      ax, 3
1:1554  e9df00            jmp      0x1636
1:1557  c49e6eff          les      bx, ptr [bp - 0x92]
1:155B  26837f0a00        cmp      word ptr es:[bx + 0xa], 0
1:1560  7603              jbe      0x1565
1:1562  e90a00            jmp      0x156f
1:1565  26837f083c        cmp      word ptr es:[bx + 8], 0x3c
1:156A  7303              jae      0x156f
1:156C  e91800            jmp      0x1587
1:156F  c49e6eff          les      bx, ptr [bp - 0x92]
1:1573  26837f0600        cmp      word ptr es:[bx + 6], 0
1:1578  7603              jbe      0x157d
1:157A  e91500            jmp      0x1592
1:157D  26837f043c        cmp      word ptr es:[bx + 4], 0x3c
1:1582  7203              jb       0x1587
1:1584  e90b00            jmp      0x1592
1:1587  9ae0150000        lcall    0, 0x15e0  ; @1:INT:ord_20(1:1641)
1:158C  b80500            mov      ax, 5
1:158F  e9a400            jmp      0x1636
1:1592  ff367400          push     word ptr [0x74]
1:1596  9a520f0000        lcall    0, 0xf52  ; @1:KERNEL.GlobalUnlock
1:159B  c7067e000100      mov      word ptr [0x7e], 1
1:15A1  833e760000        cmp      word ptr [0x76], 0
1:15A6  7403              je       0x15ab
1:15A8  e90d00            jmp      0x15b8
1:15AB  8b8656ff          mov      ax, word ptr [bp - 0xaa]
1:15AF  0b8654ff          or       ax, word ptr [bp - 0xac]
1:15B3  7503              jne      0x15b8
1:15B5  e91000            jmp      0x15c8
1:15B8  b81000            mov      ax, 0x10
1:15BB  1e                push     ds
1:15BC  50                push     ax
1:15BD  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_24(1:1716)
1:15C2  83c404            add      sp, 4
1:15C5  a37000            mov      word ptr [0x70], ax
1:15C8  8b8656ff          mov      ax, word ptr [bp - 0xaa]
1:15CC  0b8654ff          or       ax, word ptr [bp - 0xac]
1:15D0  7403              je       0x15d5
1:15D2  e90a00            jmp      0x15df
1:15D5  833e700000        cmp      word ptr [0x70], 0
1:15DA  7403              je       0x15df
1:15DC  e90b00            jmp      0x15ea
1:15DF  9a26160000        lcall    0, 0x1626  ; @1:INT:ord_20(1:1641)
1:15E4  b80200            mov      ax, 2
1:15E7  e94c00            jmp      0x1636
1:15EA  833e700000        cmp      word ptr [0x70], 0
1:15EF  7503              jne      0x15f4
1:15F1  e93c00            jmp      0x1630
1:15F4  833e7a0000        cmp      word ptr [0x7a], 0
1:15F9  7403              je       0x15fe
1:15FB  e93200            jmp      0x1630
1:15FE  833e760000        cmp      word ptr [0x76], 0
1:1603  7503              jne      0x1608
1:1605  e92800            jmp      0x1630
1:1608  ff366e00          push     word ptr [0x6e]
1:160C  ff367000          push     word ptr [0x70]
1:1610  9a7a0f0000        lcall    0, 0xf7a  ; @1:INT:ord_14(1:2134)
1:1615  83c404            add      sp, 4
1:1618  a37200            mov      word ptr [0x72], ax
1:161B  833e720000        cmp      word ptr [0x72], 0
1:1620  7403              je       0x1625
1:1622  e90b00            jmp      0x1630
1:1625  9ae9130000        lcall    0, 0x13e9  ; @1:INT:ord_20(1:1641)
1:162A  b80200            mov      ax, 2
1:162D  e90600            jmp      0x1636
1:1630  b80000            mov      ax, 0
1:1633  e90000            jmp      0x1636
1:1636  5e                pop      si
1:1637  5f                pop      di
1:1638  83ed02            sub      bp, 2
1:163B  8be5              mov      sp, bp
1:163D  1f                pop      ds
1:163E  5d                pop      bp
1:163F  4d                dec      bp
1:1640  cb                retf     

; ===== EXPORT:ord_20(#20) =====
1:1641  1e                push     ds
1:1642  58                pop      ax
1:1643  90                nop      
1:1644  45                inc      bp
1:1645  55                push     bp
1:1646  8bec              mov      bp, sp
1:1648  1e                push     ds
1:1649  8ed8              mov      ds, ax
1:164B  81ec0000          sub      sp, 0
1:164F  57                push     di
1:1650  56                push     si
1:1651  833e6e0000        cmp      word ptr [0x6e], 0
1:1656  7503              jne      0x165b
1:1658  e90f00            jmp      0x166a
1:165B  ff366e00          push     word ptr [0x6e]
1:165F  9a79160000        lcall    0, 0x1679  ; @1:GDI.DeleteObject
1:1664  c7066e000000      mov      word ptr [0x6e], 0
1:166A  833e720000        cmp      word ptr [0x72], 0
1:166F  7503              jne      0x1674
1:1671  e90f00            jmp      0x1683
1:1674  ff367200          push     word ptr [0x72]
1:1678  9a6d0f0000        lcall    0, 0xf6d  ; @1:GDI.DeleteObject
1:167D  c70672000000      mov      word ptr [0x72], 0
1:1683  833e700000        cmp      word ptr [0x70], 0
1:1688  7503              jne      0x168d
1:168A  e90f00            jmp      0x169c
1:168D  ff367000          push     word ptr [0x70]
1:1691  9aab160000        lcall    0, 0x16ab  ; @1:KERNEL.GlobalFree
1:1696  c70670000000      mov      word ptr [0x70], 0
1:169C  833e740000        cmp      word ptr [0x74], 0
1:16A1  7503              jne      0x16a6
1:16A3  e90f00            jmp      0x16b5
1:16A6  ff367400          push     word ptr [0x74]
1:16AA  9ac4160000        lcall    0, 0x16c4  ; @1:KERNEL.GlobalFree
1:16AF  c70674000000      mov      word ptr [0x74], 0
1:16B5  833e261000        cmp      word ptr [0x1026], 0
1:16BA  7503              jne      0x16bf
1:16BC  e90f00            jmp      0x16ce
1:16BF  ff362610          push     word ptr [0x1026]
1:16C3  9add160000        lcall    0, 0x16dd  ; @1:KERNEL.GlobalFree
1:16C8  c70626100000      mov      word ptr [0x1026], 0
1:16CE  833eaa1100        cmp      word ptr [0x11aa], 0
1:16D3  7503              jne      0x16d8
1:16D5  e90f00            jmp      0x16e7
1:16D8  ff36aa11          push     word ptr [0x11aa]
1:16DC  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalFree
1:16E1  c706aa110000      mov      word ptr [0x11aa], 0
1:16E7  c7066c000000      mov      word ptr [0x6c], 0
1:16ED  c7067e000000      mov      word ptr [0x7e], 0
1:16F3  c7066e000000      mov      word ptr [0x6e], 0
1:16F9  c70670000000      mov      word ptr [0x70], 0
1:16FF  c70672000000      mov      word ptr [0x72], 0
1:1705  c70674000000      mov      word ptr [0x74], 0
1:170B  5e                pop      si
1:170C  5f                pop      di
1:170D  83ed02            sub      bp, 2
1:1710  8be5              mov      sp, bp
1:1712  1f                pop      ds
1:1713  5d                pop      bp
1:1714  4d                dec      bp
1:1715  cb                retf     

; ===== EXPORT:ord_24(#24) =====
1:1716  1e                push     ds
1:1717  58                pop      ax
1:1718  90                nop      
1:1719  45                inc      bp
1:171A  55                push     bp
1:171B  8bec              mov      bp, sp
1:171D  1e                push     ds
1:171E  8ed8              mov      ds, ax
1:1720  81ec0a00          sub      sp, 0xa
1:1724  57                push     di
1:1725  56                push     si
1:1726  ff7608            push     word ptr [bp + 8]
1:1729  ff7606            push     word ptr [bp + 6]
1:172C  b84c0d            mov      ax, 0xd4c
1:172F  1e                push     ds
1:1730  50                push     ax
1:1731  b80000            mov      ax, 0
1:1734  50                push     ax
1:1735  9afd130000        lcall    0, 0x13fd  ; @1:KERNEL.OpenFile
1:173A  a3080e            mov      word ptr [0xe08], ax
1:173D  833e080eff        cmp      word ptr [0xe08], -1
1:1742  7403              je       0x1747
1:1744  e90600            jmp      0x174d
1:1747  b80000            mov      ax, 0
1:174A  e92801            jmp      0x1875
1:174D  ff36080e          push     word ptr [0xe08]
1:1751  9a1a140000        lcall    0, 0x141a  ; @1:INT:ord_23(1:1C07)
1:1756  83c402            add      sp, 2
1:1759  a3d40d            mov      word ptr [0xdd4], ax
1:175C  833ed40d00        cmp      word ptr [0xdd4], 0
1:1761  7403              je       0x1766
1:1763  e90600            jmp      0x176c
1:1766  b80000            mov      ax, 0
1:1769  e90901            jmp      0x1875
1:176C  b8dc0d            mov      ax, 0xddc
1:176F  1e                push     ds
1:1770  50                push     ax
1:1771  ff36d40d          push     word ptr [0xdd4]
1:1775  9a60140000        lcall    0, 0x1460  ; @1:INT:ord_18(1:1880)
1:177A  83c406            add      sp, 6
1:177D  a1f00d            mov      ax, word ptr [0xdf0]
1:1780  8b16f20d          mov      dx, word ptr [0xdf2]
1:1784  a3040e            mov      word ptr [0xe04], ax
1:1787  8916060e          mov      word ptr [0xe06], dx
1:178B  b8dc0d            mov      ax, 0xddc
1:178E  1e                push     ds
1:178F  50                push     ax
1:1790  9a6a050000        lcall    0, 0x56a  ; @1:INT:ord_13(1:200E)
1:1795  83c404            add      sp, 4
1:1798  2bd2              sub      dx, dx
1:179A  0306dc0d          add      ax, word ptr [0xddc]
1:179E  1316de0d          adc      dx, word ptr [0xdde]
1:17A2  0306040e          add      ax, word ptr [0xe04]
1:17A6  1316060e          adc      dx, word ptr [0xe06]
1:17AA  a3c801            mov      word ptr [0x1c8], ax
1:17AD  8916ca01          mov      word ptr [0x1ca], dx
1:17B1  b84200            mov      ax, 0x42
1:17B4  50                push     ax
1:17B5  ff369a10          push     word ptr [0x109a]
1:17B9  ff369810          push     word ptr [0x1098]
1:17BD  9a92020000        lcall    0, 0x292  ; @1:KERNEL.GlobalAlloc
1:17C2  a32610            mov      word ptr [0x1026], ax
1:17C5  833e261000        cmp      word ptr [0x1026], 0
1:17CA  7403              je       0x17cf
1:17CC  e91200            jmp      0x17e1
1:17CF  ff36d40d          push     word ptr [0xdd4]
1:17D3  9a08180000        lcall    0, 0x1808  ; @1:KERNEL.GlobalFree
1:17D8  c706d40d0000      mov      word ptr [0xdd4], 0
1:17DE  e94900            jmp      0x182a
1:17E1  ff36d40d          push     word ptr [0xdd4]
1:17E5  ff36ca01          push     word ptr [0x1ca]
1:17E9  ff36c801          push     word ptr [0x1c8]
1:17ED  b84200            mov      ax, 0x42
1:17F0  50                push     ax
1:17F1  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalReAlloc
1:17F6  a3da0d            mov      word ptr [0xdda], ax
1:17F9  833eda0d00        cmp      word ptr [0xdda], 0
1:17FE  7403              je       0x1803
1:1800  e92100            jmp      0x1824
1:1803  ff36d40d          push     word ptr [0xdd4]
1:1807  9a11180000        lcall    0, 0x1811  ; @1:KERNEL.GlobalFree
1:180C  ff362610          push     word ptr [0x1026]
1:1810  9a92160000        lcall    0, 0x1692  ; @1:KERNEL.GlobalFree
1:1815  c70626100000      mov      word ptr [0x1026], 0
1:181B  c706d40d0000      mov      word ptr [0xdd4], 0
1:1821  e90600            jmp      0x182a
1:1824  a1da0d            mov      ax, word ptr [0xdda]
1:1827  a3d40d            mov      word ptr [0xdd4], ax
1:182A  833ed40d00        cmp      word ptr [0xdd4], 0
1:182F  7503              jne      0x1834
1:1831  e93200            jmp      0x1866
1:1834  ff362610          push     word ptr [0x1026]
1:1838  9a8b140000        lcall    0, 0x148b  ; @1:KERNEL.GlobalLock
1:183D  a3d60d            mov      word ptr [0xdd6], ax
1:1840  8916d80d          mov      word ptr [0xdd8], dx
1:1844  ff36080e          push     word ptr [0xe08]
1:1848  ff36d80d          push     word ptr [0xdd8]
1:184C  ff36d60d          push     word ptr [0xdd6]
1:1850  ff369a10          push     word ptr [0x109a]
1:1854  ff369810          push     word ptr [0x1098]
1:1858  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_25(1:22FA)
1:185D  ff362610          push     word ptr [0x1026]
1:1861  9a97150000        lcall    0, 0x1597  ; @1:KERNEL.GlobalUnlock
1:1866  ff36080e          push     word ptr [0xe08]
1:186A  9a41140000        lcall    0, 0x1441  ; @1:KERNEL._lclose
1:186F  a1d40d            mov      ax, word ptr [0xdd4]
1:1872  e90000            jmp      0x1875
1:1875  5e                pop      si
1:1876  5f                pop      di
1:1877  83ed02            sub      bp, 2
1:187A  8be5              mov      sp, bp
1:187C  1f                pop      ds
1:187D  5d                pop      bp
1:187E  4d                dec      bp
1:187F  cb                retf     

; ===== EXPORT:ord_18(#18) =====
1:1880  1e                push     ds
1:1881  58                pop      ax
1:1882  90                nop      
1:1883  45                inc      bp
1:1884  55                push     bp
1:1885  8bec              mov      bp, sp
1:1887  1e                push     ds
1:1888  8ed8              mov      ds, ax
1:188A  81ec0000          sub      sp, 0
1:188E  57                push     di
1:188F  56                push     si
1:1890  837e0600          cmp      word ptr [bp + 6], 0
1:1894  7503              jne      0x1899
1:1896  e9c500            jmp      0x195e
1:1899  ff7606            push     word ptr [bp + 6]
1:189C  9a39180000        lcall    0, 0x1839  ; @1:KERNEL.GlobalLock
1:18A1  1e                push     ds
1:18A2  8bf0              mov      si, ax
1:18A4  8eda              mov      ds, dx
1:18A6  c47e08            les      di, ptr [bp + 8]
1:18A9  b91400            mov      cx, 0x14
1:18AC  f3a5              rep movsw word ptr es:[di], word ptr [si]
1:18AE  1f                pop      ds
1:18AF  c45e08            les      bx, ptr [bp + 8]
1:18B2  26833f0c          cmp      word ptr es:[bx], 0xc
1:18B6  7403              je       0x18bb
1:18B8  e90a00            jmp      0x18c5
1:18BB  26837f0200        cmp      word ptr es:[bx + 2], 0
1:18C0  7503              jne      0x18c5
1:18C2  e98b00            jmp      0x1950
1:18C5  c45e08            les      bx, ptr [bp + 8]
1:18C8  268b4716          mov      ax, word ptr es:[bx + 0x16]
1:18CC  260b4714          or       ax, word ptr es:[bx + 0x14]
1:18D0  7403              je       0x18d5
1:18D2  e95000            jmp      0x1925
1:18D5  c45e08            les      bx, ptr [bp + 8]
1:18D8  26ff770a          push     word ptr es:[bx + 0xa]
1:18DC  26ff7708          push     word ptr es:[bx + 8]
1:18E0  c45e08            les      bx, ptr [bp + 8]
1:18E3  26ff7706          push     word ptr es:[bx + 6]
1:18E7  26ff7704          push     word ptr es:[bx + 4]
1:18EB  c45e08            les      bx, ptr [bp + 8]
1:18EE  268b470e          mov      ax, word ptr es:[bx + 0xe]
1:18F2  2bd2              sub      dx, dx
1:18F4  52                push     dx
1:18F5  50                push     ax
1:18F6  9a16190000        lcall    0, 0x1916  ; @1:INT:ord_7(1:2E2C)
1:18FB  051f00            add      ax, 0x1f
1:18FE  83d200            adc      dx, 0
1:1901  25e7ff            and      ax, 0xffe7
1:1904  83e2ff            and      dx, 0xffff
1:1907  d1ea              shr      dx, 1
1:1909  d1d8              rcr      ax, 1
1:190B  d1ea              shr      dx, 1
1:190D  d1d8              rcr      ax, 1
1:190F  d1ea              shr      dx, 1
1:1911  d1d8              rcr      ax, 1
1:1913  52                push     dx
1:1914  50                push     ax
1:1915  9aa0050000        lcall    0, 0x5a0  ; @1:INT:ord_7(1:2E2C)
1:191A  c45e08            les      bx, ptr [bp + 8]
1:191D  26894714          mov      word ptr es:[bx + 0x14], ax
1:1921  26895716          mov      word ptr es:[bx + 0x16], dx
1:1925  c45e08            les      bx, ptr [bp + 8]
1:1928  268b4722          mov      ax, word ptr es:[bx + 0x22]
1:192C  260b4720          or       ax, word ptr es:[bx + 0x20]
1:1930  7403              je       0x1935
1:1932  e91b00            jmp      0x1950
1:1935  ff760a            push     word ptr [bp + 0xa]
1:1938  ff7608            push     word ptr [bp + 8]
1:193B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_26(1:2079)
1:1940  83c404            add      sp, 4
1:1943  c45e08            les      bx, ptr [bp + 8]
1:1946  26894720          mov      word ptr es:[bx + 0x20], ax
1:194A  26c747220000      mov      word ptr es:[bx + 0x22], 0
1:1950  ff7606            push     word ptr [bp + 6]
1:1953  9a62180000        lcall    0, 0x1862  ; @1:KERNEL.GlobalUnlock
1:1958  b80100            mov      ax, 1
1:195B  e90600            jmp      0x1964
1:195E  b80000            mov      ax, 0
1:1961  e90000            jmp      0x1964
1:1964  5e                pop      si
1:1965  5f                pop      di
1:1966  83ed02            sub      bp, 2
1:1969  8be5              mov      sp, bp
1:196B  1f                pop      ds
1:196C  5d                pop      bp
1:196D  4d                dec      bp
1:196E  cb                retf     

; ===== EXPORT:ord_27(#27) =====
1:196F  1e                push     ds
1:1970  58                pop      ax
1:1971  90                nop      
1:1972  45                inc      bp
1:1973  55                push     bp
1:1974  8bec              mov      bp, sp
1:1976  1e                push     ds
1:1977  8ed8              mov      ds, ax
1:1979  81ec0000          sub      sp, 0
1:197D  57                push     di
1:197E  56                push     si
1:197F  8b4608            mov      ax, word ptr [bp + 8]
1:1982  0b4606            or       ax, word ptr [bp + 6]
1:1985  7403              je       0x198a
1:1987  e90600            jmp      0x1990
1:198A  b80000            mov      ax, 0
1:198D  e91f02            jmp      0x1baf
1:1990  c45e06            les      bx, ptr [bp + 6]
1:1993  26833f28          cmp      word ptr es:[bx], 0x28
1:1997  7403              je       0x199c
1:1999  e90a00            jmp      0x19a6
1:199C  26837f0200        cmp      word ptr es:[bx + 2], 0
1:19A1  7503              jne      0x19a6
1:19A3  e90600            jmp      0x19ac
1:19A6  b80000            mov      ax, 0
1:19A9  e90302            jmp      0x1baf
1:19AC  c45e06            les      bx, ptr [bp + 6]
1:19AF  268b07            mov      ax, word ptr es:[bx]
1:19B2  034606            add      ax, word ptr [bp + 6]
1:19B5  8b5608            mov      dx, word ptr [bp + 8]
1:19B8  a3100e            mov      word ptr [0xe10], ax
1:19BB  8916120e          mov      word ptr [0xe12], dx
1:19BF  ff7608            push     word ptr [bp + 8]
1:19C2  ff7606            push     word ptr [bp + 6]
1:19C5  9a3c190000        lcall    0, 0x193c  ; @1:INT:ord_26(1:2079)
1:19CA  83c404            add      sp, 4
1:19CD  a30a0e            mov      word ptr [0xe0a], ax
1:19D0  833e0a0e00        cmp      word ptr [0xe0a], 0
1:19D5  7503              jne      0x19da
1:19D7  e9da00            jmp      0x1ab4
1:19DA  b84000            mov      ax, 0x40
1:19DD  50                push     ax
1:19DE  a10a0e            mov      ax, word ptr [0xe0a]
1:19E1  050200            add      ax, 2
1:19E4  d1e0              shl      ax, 1
1:19E6  d1e0              shl      ax, 1
1:19E8  50                push     ax
1:19E9  9a73010000        lcall    0, 0x173  ; @1:KERNEL.LocalAlloc
1:19EE  a3160e            mov      word ptr [0xe16], ax
1:19F1  833e160e00        cmp      word ptr [0xe16], 0
1:19F6  7403              je       0x19fb
1:19F8  e90600            jmp      0x1a01
1:19FB  b80000            mov      ax, 0
1:19FE  e9ae01            jmp      0x1baf
1:1A01  a10a0e            mov      ax, word ptr [0xe0a]
1:1A04  8b1e160e          mov      bx, word ptr [0xe16]
1:1A08  894702            mov      word ptr [bx + 2], ax
1:1A0B  8b1e160e          mov      bx, word ptr [0xe16]
1:1A0F  c7070003          mov      word ptr [bx], 0x300
1:1A13  c7060e0e0000      mov      word ptr [0xe0e], 0
1:1A19  e90400            jmp      0x1a20
1:1A1C  ff060e0e          inc      word ptr [0xe0e]
1:1A20  a10a0e            mov      ax, word ptr [0xe0a]
1:1A23  39060e0e          cmp      word ptr [0xe0e], ax
1:1A27  7203              jb       0x1a2c
1:1A29  e96f00            jmp      0x1a9b
1:1A2C  8b360e0e          mov      si, word ptr [0xe0e]
1:1A30  d1e6              shl      si, 1
1:1A32  d1e6              shl      si, 1
1:1A34  c41e100e          les      bx, ptr [0xe10]
1:1A38  268a4002          mov      al, byte ptr es:[bx + si + 2]
1:1A3C  8b360e0e          mov      si, word ptr [0xe0e]
1:1A40  d1e6              shl      si, 1
1:1A42  d1e6              shl      si, 1
1:1A44  8b1e160e          mov      bx, word ptr [0xe16]
1:1A48  884004            mov      byte ptr [bx + si + 4], al
1:1A4B  8b360e0e          mov      si, word ptr [0xe0e]
1:1A4F  d1e6              shl      si, 1
1:1A51  d1e6              shl      si, 1
1:1A53  c41e100e          les      bx, ptr [0xe10]
1:1A57  268a4001          mov      al, byte ptr es:[bx + si + 1]
1:1A5B  8b360e0e          mov      si, word ptr [0xe0e]
1:1A5F  d1e6              shl      si, 1
1:1A61  d1e6              shl      si, 1
1:1A63  8b1e160e          mov      bx, word ptr [0xe16]
1:1A67  884005            mov      byte ptr [bx + si + 5], al
1:1A6A  8b1e0e0e          mov      bx, word ptr [0xe0e]
1:1A6E  d1e3              shl      bx, 1
1:1A70  d1e3              shl      bx, 1
1:1A72  c436100e          les      si, ptr [0xe10]
1:1A76  268a00            mov      al, byte ptr es:[bx + si]
1:1A79  8b360e0e          mov      si, word ptr [0xe0e]
1:1A7D  d1e6              shl      si, 1
1:1A7F  d1e6              shl      si, 1
1:1A81  8b1e160e          mov      bx, word ptr [0xe16]
1:1A85  884006            mov      byte ptr [bx + si + 6], al
1:1A88  8b360e0e          mov      si, word ptr [0xe0e]
1:1A8C  d1e6              shl      si, 1
1:1A8E  d1e6              shl      si, 1
1:1A90  8b1e160e          mov      bx, word ptr [0xe16]
1:1A94  c6400700          mov      byte ptr [bx + si + 7], 0
1:1A98  e981ff            jmp      0x1a1c
1:1A9B  1e                push     ds
1:1A9C  ff36160e          push     word ptr [0xe16]
1:1AA0  9a991b0000        lcall    0, 0x1b99  ; @1:GDI.CreatePalette
1:1AA5  a3cc01            mov      word ptr [0x1cc], ax
1:1AA8  ff36160e          push     word ptr [0xe16]
1:1AAC  9aa51b0000        lcall    0, 0x1ba5  ; @1:KERNEL.LocalFree
1:1AB1  e9f500            jmp      0x1ba9
1:1AB4  c45e06            les      bx, ptr [bp + 6]
1:1AB7  26837f0e18        cmp      word ptr es:[bx + 0xe], 0x18
1:1ABC  7403              je       0x1ac1
1:1ABE  e9e800            jmp      0x1ba9
1:1AC1  c7060a0e0001      mov      word ptr [0xe0a], 0x100
1:1AC7  b84000            mov      ax, 0x40
1:1ACA  50                push     ax
1:1ACB  a10a0e            mov      ax, word ptr [0xe0a]
1:1ACE  050200            add      ax, 2
1:1AD1  d1e0              shl      ax, 1
1:1AD3  d1e0              shl      ax, 1
1:1AD5  50                push     ax
1:1AD6  9aea190000        lcall    0, 0x19ea  ; @1:KERNEL.LocalAlloc
1:1ADB  a3160e            mov      word ptr [0xe16], ax
1:1ADE  833e160e00        cmp      word ptr [0xe16], 0
1:1AE3  7403              je       0x1ae8
1:1AE5  e90600            jmp      0x1aee
1:1AE8  b80000            mov      ax, 0
1:1AEB  e9c100            jmp      0x1baf
1:1AEE  a10a0e            mov      ax, word ptr [0xe0a]
1:1AF1  8b1e160e          mov      bx, word ptr [0xe16]
1:1AF5  894702            mov      word ptr [bx + 2], ax
1:1AF8  8b1e160e          mov      bx, word ptr [0xe16]
1:1AFC  c7070003          mov      word ptr [bx], 0x300
1:1B00  b000              mov      al, 0
1:1B02  a20d0e            mov      byte ptr [0xe0d], al
1:1B05  a20c0e            mov      byte ptr [0xe0c], al
1:1B08  a2140e            mov      byte ptr [0xe14], al
1:1B0B  c7060e0e0000      mov      word ptr [0xe0e], 0
1:1B11  e90400            jmp      0x1b18
1:1B14  ff060e0e          inc      word ptr [0xe0e]
1:1B18  a10e0e            mov      ax, word ptr [0xe0e]
1:1B1B  8b1e160e          mov      bx, word ptr [0xe16]
1:1B1F  394702            cmp      word ptr [bx + 2], ax
1:1B22  7703              ja       0x1b27
1:1B24  e96c00            jmp      0x1b93
1:1B27  a0140e            mov      al, byte ptr [0xe14]
1:1B2A  8b360e0e          mov      si, word ptr [0xe0e]
1:1B2E  d1e6              shl      si, 1
1:1B30  d1e6              shl      si, 1
1:1B32  8b1e160e          mov      bx, word ptr [0xe16]
1:1B36  884004            mov      byte ptr [bx + si + 4], al
1:1B39  a00c0e            mov      al, byte ptr [0xe0c]
1:1B3C  8b360e0e          mov      si, word ptr [0xe0e]
1:1B40  d1e6              shl      si, 1
1:1B42  d1e6              shl      si, 1
1:1B44  8b1e160e          mov      bx, word ptr [0xe16]
1:1B48  884005            mov      byte ptr [bx + si + 5], al
1:1B4B  a00d0e            mov      al, byte ptr [0xe0d]
1:1B4E  8b360e0e          mov      si, word ptr [0xe0e]
1:1B52  d1e6              shl      si, 1
1:1B54  d1e6              shl      si, 1
1:1B56  8b1e160e          mov      bx, word ptr [0xe16]
1:1B5A  884006            mov      byte ptr [bx + si + 6], al
1:1B5D  8b360e0e          mov      si, word ptr [0xe0e]
1:1B61  d1e6              shl      si, 1
1:1B63  d1e6              shl      si, 1
1:1B65  8b1e160e          mov      bx, word ptr [0xe16]
1:1B69  c6400700          mov      byte ptr [bx + si + 7], 0
1:1B6D  8006140e20        add      byte ptr [0xe14], 0x20
1:1B72  803e140e00        cmp      byte ptr [0xe14], 0
1:1B77  7403              je       0x1b7c
1:1B79  e91400            jmp      0x1b90
1:1B7C  80060c0e20        add      byte ptr [0xe0c], 0x20
1:1B81  803e0c0e00        cmp      byte ptr [0xe0c], 0
1:1B86  7403              je       0x1b8b
1:1B88  e90500            jmp      0x1b90
1:1B8B  80060d0e40        add      byte ptr [0xe0d], 0x40
1:1B90  e981ff            jmp      0x1b14
1:1B93  1e                push     ds
1:1B94  ff36160e          push     word ptr [0xe16]
1:1B98  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreatePalette
1:1B9D  a3cc01            mov      word ptr [0x1cc], ax
1:1BA0  ff36160e          push     word ptr [0xe16]
1:1BA4  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LocalFree
1:1BA9  a1cc01            mov      ax, word ptr [0x1cc]
1:1BAC  e90000            jmp      0x1baf
1:1BAF  5e                pop      si
1:1BB0  5f                pop      di
1:1BB1  83ed02            sub      bp, 2
1:1BB4  8be5              mov      sp, bp
1:1BB6  1f                pop      ds
1:1BB7  5d                pop      bp
1:1BB8  4d                dec      bp
1:1BB9  cb                retf     

; ===== EXPORT:ord_22(#22) =====
1:1BBA  1e                push     ds
1:1BBB  58                pop      ax
1:1BBC  90                nop      
1:1BBD  45                inc      bp
1:1BBE  55                push     bp
1:1BBF  8bec              mov      bp, sp
1:1BC1  1e                push     ds
1:1BC2  8ed8              mov      ds, ax
1:1BC4  81ec0000          sub      sp, 0
1:1BC8  57                push     di
1:1BC9  56                push     si
1:1BCA  837e0600          cmp      word ptr [bp + 6], 0
1:1BCE  7403              je       0x1bd3
1:1BD0  e90600            jmp      0x1bd9
1:1BD3  b80000            mov      ax, 0
1:1BD6  e92300            jmp      0x1bfc
1:1BD9  ff7606            push     word ptr [bp + 6]
1:1BDC  9a9d180000        lcall    0, 0x189d  ; @1:KERNEL.GlobalLock
1:1BE1  52                push     dx
1:1BE2  50                push     ax
1:1BE3  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_27(1:196F)
1:1BE8  83c404            add      sp, 4
1:1BEB  a3180e            mov      word ptr [0xe18], ax
1:1BEE  ff7606            push     word ptr [bp + 6]
1:1BF1  9a54190000        lcall    0, 0x1954  ; @1:KERNEL.GlobalUnlock
1:1BF6  a1180e            mov      ax, word ptr [0xe18]
1:1BF9  e90000            jmp      0x1bfc
1:1BFC  5e                pop      si
1:1BFD  5f                pop      di
1:1BFE  83ed02            sub      bp, 2
1:1C01  8be5              mov      sp, bp
1:1C03  1f                pop      ds
1:1C04  5d                pop      bp
1:1C05  4d                dec      bp
1:1C06  cb                retf     

; ===== EXPORT:ord_23(#23) =====
1:1C07  1e                push     ds
1:1C08  58                pop      ax
1:1C09  90                nop      
1:1C0A  45                inc      bp
1:1C0B  55                push     bp
1:1C0C  8bec              mov      bp, sp
1:1C0E  1e                push     ds
1:1C0F  8ed8              mov      ds, ax
1:1C11  81ec0600          sub      sp, 6
1:1C15  57                push     di
1:1C16  56                push     si
1:1C17  837e06ff          cmp      word ptr [bp + 6], -1
1:1C1B  7403              je       0x1c20
1:1C1D  e90600            jmp      0x1c26
1:1C20  b80000            mov      ax, 0
1:1C23  e9dd03            jmp      0x2003
1:1C26  ff7606            push     word ptr [bp + 6]
1:1C29  2bc0              sub      ax, ax
1:1C2B  50                push     ax
1:1C2C  50                push     ax
1:1C2D  b80100            mov      ax, 1
1:1C30  50                push     ax
1:1C31  9a7f1c0000        lcall    0, 0x1c7f  ; @1:KERNEL._llseek
1:1C36  a36c0e            mov      word ptr [0xe6c], ax
1:1C39  89166e0e          mov      word ptr [0xe6e], dx
1:1C3D  ff7606            push     word ptr [bp + 6]
1:1C40  b82c0e            mov      ax, 0xe2c
1:1C43  1e                push     ds
1:1C44  50                push     ax
1:1C45  b80e00            mov      ax, 0xe
1:1C48  50                push     ax
1:1C49  9a901c0000        lcall    0, 0x1c90  ; @1:KERNEL._lread
1:1C4E  3d0e00            cmp      ax, 0xe
1:1C51  7503              jne      0x1c56
1:1C53  e90600            jmp      0x1c5c
1:1C56  b80000            mov      ax, 0
1:1C59  e9a703            jmp      0x2003
1:1C5C  813e2c0e424d      cmp      word ptr [0xe2c], 0x4d42
1:1C62  7503              jne      0x1c67
1:1C64  e91c00            jmp      0x1c83
1:1C67  2bc0              sub      ax, ax
1:1C69  a3380e            mov      word ptr [0xe38], ax
1:1C6C  a3360e            mov      word ptr [0xe36], ax
1:1C6F  ff7606            push     word ptr [bp + 6]
1:1C72  ff366e0e          push     word ptr [0xe6e]
1:1C76  ff366c0e          push     word ptr [0xe6c]
1:1C7A  b80000            mov      ax, 0
1:1C7D  50                push     ax
1:1C7E  9a31140000        lcall    0, 0x1431  ; @1:KERNEL._llseek
1:1C83  ff7606            push     word ptr [bp + 6]
1:1C86  b83e0e            mov      ax, 0xe3e
1:1C89  1e                push     ds
1:1C8A  50                push     ax
1:1C8B  b82800            mov      ax, 0x28
1:1C8E  50                push     ax
1:1C8F  9affff0000        lcall    0, 0xffff  ; @1:KERNEL._lread
1:1C94  3d2800            cmp      ax, 0x28
1:1C97  7503              jne      0x1c9c
1:1C99  e90600            jmp      0x1ca2
1:1C9C  b80000            mov      ax, 0
1:1C9F  e96103            jmp      0x2003
1:1CA2  b83e0e            mov      ax, 0xe3e
1:1CA5  1e                push     ds
1:1CA6  50                push     ax
1:1CA7  9ac6190000        lcall    0, 0x19c6  ; @1:INT:ord_26(1:2079)
1:1CAC  83c404            add      sp, 4
1:1CAF  a31a0e            mov      word ptr [0xe1a], ax
1:1CB2  a13e0e            mov      ax, word ptr [0xe3e]
1:1CB5  a36a0e            mov      word ptr [0xe6a], ax
1:1CB8  e9c200            jmp      0x1d7d
1:1CBB  e9d200            jmp      0x1d90
1:1CBE  b81c0e            mov      ax, 0xe1c
1:1CC1  8bf8              mov      di, ax
1:1CC3  be3e0e            mov      si, 0xe3e
1:1CC6  1e                push     ds
1:1CC7  07                pop      es
1:1CC8  b90600            mov      cx, 6
1:1CCB  f3a5              rep movsw word ptr es:[di], word ptr [si]
1:1CCD  a1200e            mov      ax, word ptr [0xe20]
1:1CD0  a3d001            mov      word ptr [0x1d0], ax
1:1CD3  c706d2010000      mov      word ptr [0x1d2], 0
1:1CD9  a1220e            mov      ax, word ptr [0xe22]
1:1CDC  a3d401            mov      word ptr [0x1d4], ax
1:1CDF  c706d6010000      mov      word ptr [0x1d6], 0
1:1CE5  a1240e            mov      ax, word ptr [0xe24]
1:1CE8  a33c0e            mov      word ptr [0xe3c], ax
1:1CEB  a1260e            mov      ax, word ptr [0xe26]
1:1CEE  a3700e            mov      word ptr [0xe70], ax
1:1CF1  c7063e0e2800      mov      word ptr [0xe3e], 0x28
1:1CF7  c706400e0000      mov      word ptr [0xe40], 0
1:1CFD  a1d001            mov      ax, word ptr [0x1d0]
1:1D00  8b16d201          mov      dx, word ptr [0x1d2]
1:1D04  a3420e            mov      word ptr [0xe42], ax
1:1D07  8916440e          mov      word ptr [0xe44], dx
1:1D0B  a1d401            mov      ax, word ptr [0x1d4]
1:1D0E  8b16d601          mov      dx, word ptr [0x1d6]
1:1D12  a3460e            mov      word ptr [0xe46], ax
1:1D15  8916480e          mov      word ptr [0xe48], dx
1:1D19  a13c0e            mov      ax, word ptr [0xe3c]
1:1D1C  a34a0e            mov      word ptr [0xe4a], ax
1:1D1F  a1700e            mov      ax, word ptr [0xe70]
1:1D22  a34c0e            mov      word ptr [0xe4c], ax
1:1D25  2bc0              sub      ax, ax
1:1D27  a3500e            mov      word ptr [0xe50], ax
1:1D2A  a34e0e            mov      word ptr [0xe4e], ax
1:1D2D  2bc0              sub      ax, ax
1:1D2F  a3540e            mov      word ptr [0xe54], ax
1:1D32  a3520e            mov      word ptr [0xe52], ax
1:1D35  2bc0              sub      ax, ax
1:1D37  a3580e            mov      word ptr [0xe58], ax
1:1D3A  a3560e            mov      word ptr [0xe56], ax
1:1D3D  2bc0              sub      ax, ax
1:1D3F  a35c0e            mov      word ptr [0xe5c], ax
1:1D42  a35a0e            mov      word ptr [0xe5a], ax
1:1D45  a11a0e            mov      ax, word ptr [0xe1a]
1:1D48  a35e0e            mov      word ptr [0xe5e], ax
1:1D4B  c706600e0000      mov      word ptr [0xe60], 0
1:1D51  a11a0e            mov      ax, word ptr [0xe1a]
1:1D54  a3620e            mov      word ptr [0xe62], ax
1:1D57  c706640e0000      mov      word ptr [0xe64], 0
1:1D5D  ff7606            push     word ptr [bp + 6]
1:1D60  b8e4ff            mov      ax, 0xffe4
1:1D63  baffff            mov      dx, 0xffff
1:1D66  52                push     dx
1:1D67  50                push     ax
1:1D68  b80100            mov      ax, 1
1:1D6B  50                push     ax
1:1D6C  9a321c0000        lcall    0, 0x1c32  ; @1:KERNEL._llseek
1:1D71  e91c00            jmp      0x1d90
1:1D74  b80000            mov      ax, 0
1:1D77  e98902            jmp      0x2003
1:1D7A  e91300            jmp      0x1d90
1:1D7D  2d0c00            sub      ax, 0xc
1:1D80  7503              jne      0x1d85
1:1D82  e939ff            jmp      0x1cbe
1:1D85  2d1c00            sub      ax, 0x1c
1:1D88  7503              jne      0x1d8d
1:1D8A  e92eff            jmp      0x1cbb
1:1D8D  e9e4ff            jmp      0x1d74
1:1D90  a1420e            mov      ax, word ptr [0xe42]
1:1D93  a32c10            mov      word ptr [0x102c], ax
1:1D96  a1460e            mov      ax, word ptr [0xe46]
1:1D99  a31a10            mov      word ptr [0x101a], ax
1:1D9C  a14c0e            mov      ax, word ptr [0xe4c]
1:1D9F  a32e10            mov      word ptr [0x102e], ax
1:1DA2  a11a10            mov      ax, word ptr [0x101a]
1:1DA5  99                cdq      
1:1DA6  2bc2              sub      ax, dx
1:1DA8  d1f8              sar      ax, 1
1:1DAA  a38000            mov      word ptr [0x80], ax
1:1DAD  a18000            mov      ax, word ptr [0x80]
1:1DB0  d1e0              shl      ax, 1
1:1DB2  a38200            mov      word ptr [0x82], ax
1:1DB5  a18000            mov      ax, word ptr [0x80]
1:1DB8  99                cdq      
1:1DB9  2bc2              sub      ax, dx
1:1DBB  d1f8              sar      ax, 1
1:1DBD  a38400            mov      word ptr [0x84], ax
1:1DC0  a12c10            mov      ax, word ptr [0x102c]
1:1DC3  a38600            mov      word ptr [0x86], ax
1:1DC6  a1420e            mov      ax, word ptr [0xe42]
1:1DC9  a32c10            mov      word ptr [0x102c], ax
1:1DCC  a1460e            mov      ax, word ptr [0xe46]
1:1DCF  a31a10            mov      word ptr [0x101a], ax
1:1DD2  a14c0e            mov      ax, word ptr [0xe4c]
1:1DD5  a32e10            mov      word ptr [0x102e], ax
1:1DD8  a1420e            mov      ax, word ptr [0xe42]
1:1DDB  a32a10            mov      word ptr [0x102a], ax
1:1DDE  a14c0e            mov      ax, word ptr [0xe4c]
1:1DE1  2bd2              sub      dx, dx
1:1DE3  52                push     dx
1:1DE4  50                push     ax
1:1DE5  a12a10            mov      ax, word ptr [0x102a]
1:1DE8  99                cdq      
1:1DE9  52                push     dx
1:1DEA  50                push     ax
1:1DEB  9a171e0000        lcall    0, 0x1e17  ; @1:INT:ord_7(1:2E2C)
1:1DF0  051f00            add      ax, 0x1f
1:1DF3  83d200            adc      dx, 0
1:1DF6  d1ea              shr      dx, 1
1:1DF8  d1d8              rcr      ax, 1
1:1DFA  d1ea              shr      dx, 1
1:1DFC  d1d8              rcr      ax, 1
1:1DFE  d1ea              shr      dx, 1
1:1E00  d1d8              rcr      ax, 1
1:1E02  25fcff            and      ax, 0xfffc
1:1E05  a33c10            mov      word ptr [0x103c], ax
1:1E08  ff36480e          push     word ptr [0xe48]
1:1E0C  ff36460e          push     word ptr [0xe46]
1:1E10  a13c10            mov      ax, word ptr [0x103c]
1:1E13  99                cdq      
1:1E14  52                push     dx
1:1E15  50                push     ax
1:1E16  9a5c1e0000        lcall    0, 0x1e5c  ; @1:INT:ord_7(1:2E2C)
1:1E1B  a39810            mov      word ptr [0x1098], ax
1:1E1E  89169a10          mov      word ptr [0x109a], dx
1:1E22  a1460e            mov      ax, word ptr [0xe46]
1:1E25  8b16480e          mov      dx, word ptr [0xe48]
1:1E29  a3420e            mov      word ptr [0xe42], ax
1:1E2C  8916440e          mov      word ptr [0xe44], dx
1:1E30  2bc0              sub      ax, ax
1:1E32  a3540e            mov      word ptr [0xe54], ax
1:1E35  a3520e            mov      word ptr [0xe52], ax
1:1E38  a1540e            mov      ax, word ptr [0xe54]
1:1E3B  0b06520e          or       ax, word ptr [0xe52]
1:1E3F  7403              je       0x1e44
1:1E41  e94200            jmp      0x1e86
1:1E44  ff36480e          push     word ptr [0xe48]
1:1E48  ff36460e          push     word ptr [0xe46]
1:1E4C  ff36440e          push     word ptr [0xe44]
1:1E50  ff36420e          push     word ptr [0xe42]
1:1E54  a14c0e            mov      ax, word ptr [0xe4c]
1:1E57  2bd2              sub      dx, dx
1:1E59  52                push     dx
1:1E5A  50                push     ax
1:1E5B  9a7b1e0000        lcall    0, 0x1e7b  ; @1:INT:ord_7(1:2E2C)
1:1E60  051f00            add      ax, 0x1f
1:1E63  83d200            adc      dx, 0
1:1E66  25e7ff            and      ax, 0xffe7
1:1E69  83e2ff            and      dx, 0xffff
1:1E6C  d1ea              shr      dx, 1
1:1E6E  d1d8              rcr      ax, 1
1:1E70  d1ea              shr      dx, 1
1:1E72  d1d8              rcr      ax, 1
1:1E74  d1ea              shr      dx, 1
1:1E76  d1d8              rcr      ax, 1
1:1E78  52                push     dx
1:1E79  50                push     ax
1:1E7A  9af7180000        lcall    0, 0x18f7  ; @1:INT:ord_7(1:2E2C)
1:1E7F  a3520e            mov      word ptr [0xe52], ax
1:1E82  8916540e          mov      word ptr [0xe54], dx
1:1E86  a1600e            mov      ax, word ptr [0xe60]
1:1E89  0b065e0e          or       ax, word ptr [0xe5e]
1:1E8D  7403              je       0x1e92
1:1E8F  e91600            jmp      0x1ea8
1:1E92  b83e0e            mov      ax, 0xe3e
1:1E95  1e                push     ds
1:1E96  50                push     ax
1:1E97  9aa81c0000        lcall    0, 0x1ca8  ; @1:INT:ord_26(1:2079)
1:1E9C  83c404            add      sp, 4
1:1E9F  a35e0e            mov      word ptr [0xe5e], ax
1:1EA2  c706600e0000      mov      word ptr [0xe60], 0
1:1EA8  b84200            mov      ax, 0x42
1:1EAB  50                push     ax
1:1EAC  a11a0e            mov      ax, word ptr [0xe1a]
1:1EAF  d1e0              shl      ax, 1
1:1EB1  d1e0              shl      ax, 1
1:1EB3  2bd2              sub      dx, dx
1:1EB5  03063e0e          add      ax, word ptr [0xe3e]
1:1EB9  1316400e          adc      dx, word ptr [0xe40]
1:1EBD  52                push     dx
1:1EBE  50                push     ax
1:1EBF  9abe170000        lcall    0, 0x17be  ; @1:KERNEL.GlobalAlloc
1:1EC4  a3ce01            mov      word ptr [0x1ce], ax
1:1EC7  833ece0100        cmp      word ptr [0x1ce], 0
1:1ECC  7403              je       0x1ed1
1:1ECE  e90600            jmp      0x1ed7
1:1ED1  b80000            mov      ax, 0
1:1ED4  e92c01            jmp      0x2003
1:1ED7  ff36ce01          push     word ptr [0x1ce]
1:1EDB  9add1b0000        lcall    0, 0x1bdd  ; @1:KERNEL.GlobalLock
1:1EE0  a3280e            mov      word ptr [0xe28], ax
1:1EE3  89162a0e          mov      word ptr [0xe2a], dx
1:1EE7  a1280e            mov      ax, word ptr [0xe28]
1:1EEA  8b162a0e          mov      dx, word ptr [0xe2a]
1:1EEE  8bf8              mov      di, ax
1:1EF0  be3e0e            mov      si, 0xe3e
1:1EF3  8ec2              mov      es, dx
1:1EF5  b91400            mov      cx, 0x14
1:1EF8  f3a5              rep movsw word ptr es:[di], word ptr [si]
1:1EFA  a1280e            mov      ax, word ptr [0xe28]
1:1EFD  8b162a0e          mov      dx, word ptr [0xe2a]
1:1F01  03063e0e          add      ax, word ptr [0xe3e]
1:1F05  a3660e            mov      word ptr [0xe66], ax
1:1F08  8916680e          mov      word ptr [0xe68], dx
1:1F0C  833e1a0e00        cmp      word ptr [0xe1a], 0
1:1F11  7503              jne      0x1f16
1:1F13  e9b500            jmp      0x1fcb
1:1F16  833e6a0e0c        cmp      word ptr [0xe6a], 0xc
1:1F1B  7403              je       0x1f20
1:1F1D  e99300            jmp      0x1fb3
1:1F20  ff7606            push     word ptr [bp + 6]
1:1F23  ff36680e          push     word ptr [0xe68]
1:1F27  ff36660e          push     word ptr [0xe66]
1:1F2B  a11a0e            mov      ax, word ptr [0xe1a]
1:1F2E  8bc8              mov      cx, ax
1:1F30  d1e0              shl      ax, 1
1:1F32  03c1              add      ax, cx
1:1F34  50                push     ax
1:1F35  9a4a1c0000        lcall    0, 0x1c4a  ; @1:KERNEL._lread
1:1F3A  a11a0e            mov      ax, word ptr [0xe1a]
1:1F3D  48                dec      ax
1:1F3E  a33a0e            mov      word ptr [0xe3a], ax
1:1F41  e90400            jmp      0x1f48
1:1F44  ff0e3a0e          dec      word ptr [0xe3a]
1:1F48  833e3a0e00        cmp      word ptr [0xe3a], 0
1:1F4D  7d03              jge      0x1f52
1:1F4F  e95e00            jmp      0x1fb0
1:1F52  8b363a0e          mov      si, word ptr [0xe3a]
1:1F56  8bc6              mov      ax, si
1:1F58  d1e6              shl      si, 1
1:1F5A  03f0              add      si, ax
1:1F5C  c41e660e          les      bx, ptr [0xe66]
1:1F60  268a4002          mov      al, byte ptr es:[bx + si + 2]
1:1F64  8846fc            mov      byte ptr [bp - 4], al
1:1F67  8b1e3a0e          mov      bx, word ptr [0xe3a]
1:1F6B  8bc3              mov      ax, bx
1:1F6D  d1e3              shl      bx, 1
1:1F6F  03d8              add      bx, ax
1:1F71  c436660e          les      si, ptr [0xe66]
1:1F75  268a00            mov      al, byte ptr es:[bx + si]
1:1F78  8846fa            mov      byte ptr [bp - 6], al
1:1F7B  8b363a0e          mov      si, word ptr [0xe3a]
1:1F7F  8bc6              mov      ax, si
1:1F81  d1e6              shl      si, 1
1:1F83  03f0              add      si, ax
1:1F85  c41e660e          les      bx, ptr [0xe66]
1:1F89  268a4001          mov      al, byte ptr es:[bx + si + 1]
1:1F8D  8846fb            mov      byte ptr [bp - 5], al
1:1F90  c646fd00          mov      byte ptr [bp - 3], 0
1:1F94  8b46fa            mov      ax, word ptr [bp - 6]
1:1F97  8b56fc            mov      dx, word ptr [bp - 4]
1:1F9A  8b1e3a0e          mov      bx, word ptr [0xe3a]
1:1F9E  d1e3              shl      bx, 1
1:1FA0  d1e3              shl      bx, 1
1:1FA2  c436660e          les      si, ptr [0xe66]
1:1FA6  268900            mov      word ptr es:[bx + si], ax
1:1FA9  26895002          mov      word ptr es:[bx + si + 2], dx
1:1FAD  e994ff            jmp      0x1f44
1:1FB0  e91800            jmp      0x1fcb
1:1FB3  ff7606            push     word ptr [bp + 6]
1:1FB6  ff36680e          push     word ptr [0xe68]
1:1FBA  ff36660e          push     word ptr [0xe66]
1:1FBE  a11a0e            mov      ax, word ptr [0xe1a]
1:1FC1  d1e0              shl      ax, 1
1:1FC3  d1e0              shl      ax, 1
1:1FC5  50                push     ax
1:1FC6  9a361f0000        lcall    0, 0x1f36  ; @1:KERNEL._lread
1:1FCB  a1380e            mov      ax, word ptr [0xe38]
1:1FCE  0b06360e          or       ax, word ptr [0xe36]
1:1FD2  7503              jne      0x1fd7
1:1FD4  e91d00            jmp      0x1ff4
1:1FD7  ff7606            push     word ptr [bp + 6]
1:1FDA  a1360e            mov      ax, word ptr [0xe36]
1:1FDD  8b16380e          mov      dx, word ptr [0xe38]
1:1FE1  03066c0e          add      ax, word ptr [0xe6c]
1:1FE5  13166e0e          adc      dx, word ptr [0xe6e]
1:1FE9  52                push     dx
1:1FEA  50                push     ax
1:1FEB  b80000            mov      ax, 0
1:1FEE  50                push     ax
1:1FEF  9a6d1d0000        lcall    0, 0x1d6d  ; @1:KERNEL._llseek
1:1FF4  ff36ce01          push     word ptr [0x1ce]
1:1FF8  9af21b0000        lcall    0, 0x1bf2  ; @1:KERNEL.GlobalUnlock
1:1FFD  a1ce01            mov      ax, word ptr [0x1ce]
1:2000  e90000            jmp      0x2003
1:2003  5e                pop      si
1:2004  5f                pop      di
1:2005  83ed02            sub      bp, 2
1:2008  8be5              mov      sp, bp
1:200A  1f                pop      ds
1:200B  5d                pop      bp
1:200C  4d                dec      bp
1:200D  cb                retf     

; ===== EXPORT:ord_13(#13) =====
1:200E  1e                push     ds
1:200F  58                pop      ax
1:2010  90                nop      
1:2011  45                inc      bp
1:2012  55                push     bp
1:2013  8bec              mov      bp, sp
1:2015  1e                push     ds
1:2016  8ed8              mov      ds, ax
1:2018  81ec0000          sub      sp, 0
1:201C  57                push     di
1:201D  56                push     si
1:201E  8b4606            mov      ax, word ptr [bp + 6]
1:2021  8b5608            mov      dx, word ptr [bp + 8]
1:2024  a3740e            mov      word ptr [0xe74], ax
1:2027  8916760e          mov      word ptr [0xe76], dx
1:202B  ff36760e          push     word ptr [0xe76]
1:202F  ff36740e          push     word ptr [0xe74]
1:2033  9a981e0000        lcall    0, 0x1e98  ; @1:INT:ord_26(1:2079)
1:2038  83c404            add      sp, 4
1:203B  a3720e            mov      word ptr [0xe72], ax
1:203E  c41e740e          les      bx, ptr [0xe74]
1:2042  26833f0c          cmp      word ptr es:[bx], 0xc
1:2046  7403              je       0x204b
1:2048  e91900            jmp      0x2064
1:204B  26837f0200        cmp      word ptr es:[bx + 2], 0
1:2050  7403              je       0x2055
1:2052  e90f00            jmp      0x2064
1:2055  a1720e            mov      ax, word ptr [0xe72]
1:2058  8bc8              mov      cx, ax
1:205A  d1e0              shl      ax, 1
1:205C  03c1              add      ax, cx
1:205E  e90d00            jmp      0x206e
1:2061  e90a00            jmp      0x206e
1:2064  a1720e            mov      ax, word ptr [0xe72]
1:2067  d1e0              shl      ax, 1
1:2069  d1e0              shl      ax, 1
1:206B  e90000            jmp      0x206e
1:206E  5e                pop      si
1:206F  5f                pop      di
1:2070  83ed02            sub      bp, 2
1:2073  8be5              mov      sp, bp
1:2075  1f                pop      ds
1:2076  5d                pop      bp
1:2077  4d                dec      bp
1:2078  cb                retf     

; ===== EXPORT:ord_26(#26) =====
1:2079  1e                push     ds
1:207A  58                pop      ax
1:207B  90                nop      
1:207C  45                inc      bp
1:207D  55                push     bp
1:207E  8bec              mov      bp, sp
1:2080  1e                push     ds
1:2081  8ed8              mov      ds, ax
1:2083  81ec0000          sub      sp, 0
1:2087  57                push     di
1:2088  56                push     si
1:2089  8b4606            mov      ax, word ptr [bp + 6]
1:208C  8b5608            mov      dx, word ptr [bp + 8]
1:208F  a37e0e            mov      word ptr [0xe7e], ax
1:2092  8916800e          mov      word ptr [0xe80], dx
1:2096  8b4606            mov      ax, word ptr [bp + 6]
1:2099  8b5608            mov      dx, word ptr [bp + 8]
1:209C  a3780e            mov      word ptr [0xe78], ax
1:209F  89167a0e          mov      word ptr [0xe7a], dx
1:20A3  c41e7e0e          les      bx, ptr [0xe7e]
1:20A7  26833f0c          cmp      word ptr es:[bx], 0xc
1:20AB  7403              je       0x20b0
1:20AD  e90a00            jmp      0x20ba
1:20B0  26837f0200        cmp      word ptr es:[bx + 2], 0
1:20B5  7503              jne      0x20ba
1:20B7  e92a00            jmp      0x20e4
1:20BA  c41e7e0e          les      bx, ptr [0xe7e]
1:20BE  268b4722          mov      ax, word ptr es:[bx + 0x22]
1:20C2  260b4720          or       ax, word ptr es:[bx + 0x20]
1:20C6  7503              jne      0x20cb
1:20C8  e90b00            jmp      0x20d6
1:20CB  c41e7e0e          les      bx, ptr [0xe7e]
1:20CF  268b4720          mov      ax, word ptr es:[bx + 0x20]
1:20D3  e95300            jmp      0x2129
1:20D6  c41e7e0e          les      bx, ptr [0xe7e]
1:20DA  268b470e          mov      ax, word ptr es:[bx + 0xe]
1:20DE  a37c0e            mov      word ptr [0xe7c], ax
1:20E1  e90b00            jmp      0x20ef
1:20E4  c41e780e          les      bx, ptr [0xe78]
1:20E8  268b470a          mov      ax, word ptr es:[bx + 0xa]
1:20EC  a37c0e            mov      word ptr [0xe7c], ax
1:20EF  a17c0e            mov      ax, word ptr [0xe7c]
1:20F2  e91b00            jmp      0x2110
1:20F5  b80200            mov      ax, 2
1:20F8  e92e00            jmp      0x2129
1:20FB  b81000            mov      ax, 0x10
1:20FE  e92800            jmp      0x2129
1:2101  b80001            mov      ax, 0x100
1:2104  e92200            jmp      0x2129
1:2107  b80000            mov      ax, 0
1:210A  e91c00            jmp      0x2129
1:210D  e91900            jmp      0x2129
1:2110  48                dec      ax
1:2111  7503              jne      0x2116
1:2113  e9dfff            jmp      0x20f5
1:2116  2d0300            sub      ax, 3
1:2119  7503              jne      0x211e
1:211B  e9ddff            jmp      0x20fb
1:211E  2d0400            sub      ax, 4
1:2121  7503              jne      0x2126
1:2123  e9dbff            jmp      0x2101
1:2126  e9deff            jmp      0x2107
1:2129  5e                pop      si
1:212A  5f                pop      di
1:212B  83ed02            sub      bp, 2
1:212E  8be5              mov      sp, bp
1:2130  1f                pop      ds
1:2131  5d                pop      bp
1:2132  4d                dec      bp
1:2133  cb                retf     

; ===== EXPORT:ord_14(#14) =====
1:2134  1e                push     ds
1:2135  58                pop      ax
1:2136  90                nop      
1:2137  45                inc      bp
1:2138  55                push     bp
1:2139  8bec              mov      bp, sp
1:213B  1e                push     ds
1:213C  8ed8              mov      ds, ax
1:213E  81ec0000          sub      sp, 0
1:2142  57                push     di
1:2143  56                push     si
1:2144  837e0600          cmp      word ptr [bp + 6], 0
1:2148  7403              je       0x214d
1:214A  e90600            jmp      0x2153
1:214D  b80000            mov      ax, 0
1:2150  e9d000            jmp      0x2223
1:2153  ff7606            push     word ptr [bp + 6]
1:2156  9adc1e0000        lcall    0, 0x1edc  ; @1:KERNEL.GlobalLock
1:215B  a3840e            mov      word ptr [0xe84], ax
1:215E  8916860e          mov      word ptr [0xe86], dx
1:2162  a1860e            mov      ax, word ptr [0xe86]
1:2165  0b06840e          or       ax, word ptr [0xe84]
1:2169  7403              je       0x216e
1:216B  e90600            jmp      0x2174
1:216E  b80000            mov      ax, 0
1:2171  e9af00            jmp      0x2223
1:2174  b80000            mov      ax, 0
1:2177  50                push     ax
1:2178  9affff0000        lcall    0, 0xffff  ; @1:USER.GetDC
1:217D  a38a0e            mov      word ptr [0xe8a], ax
1:2180  837e0800          cmp      word ptr [bp + 8], 0
1:2184  7503              jne      0x2189
1:2186  e91c00            jmp      0x21a5
1:2189  ff368a0e          push     word ptr [0xe8a]
1:218D  ff7608            push     word ptr [bp + 8]
1:2190  b80000            mov      ax, 0
1:2193  50                push     ax
1:2194  9a04220000        lcall    0, 0x2204  ; @1:USER.SelectPalette
1:2199  a3880e            mov      word ptr [0xe88], ax
1:219C  ff368a0e          push     word ptr [0xe8a]
1:21A0  9a45030000        lcall    0, 0x345  ; @1:USER.RealizePalette
1:21A5  ff368a0e          push     word ptr [0xe8a]
1:21A9  ff36860e          push     word ptr [0xe86]
1:21AD  ff36840e          push     word ptr [0xe84]
1:21B1  b80400            mov      ax, 4
1:21B4  ba0000            mov      dx, 0
1:21B7  52                push     dx
1:21B8  50                push     ax
1:21B9  ff36860e          push     word ptr [0xe86]
1:21BD  ff36840e          push     word ptr [0xe84]
1:21C1  9a91170000        lcall    0, 0x1791  ; @1:INT:ord_13(1:200E)
1:21C6  83c404            add      sp, 4
1:21C9  c41e840e          les      bx, ptr [0xe84]
1:21CD  260307            add      ax, word ptr es:[bx]
1:21D0  0306840e          add      ax, word ptr [0xe84]
1:21D4  8b16860e          mov      dx, word ptr [0xe86]
1:21D8  52                push     dx
1:21D9  50                push     ax
1:21DA  ff36860e          push     word ptr [0xe86]
1:21DE  ff36840e          push     word ptr [0xe84]
1:21E2  b80000            mov      ax, 0
1:21E5  50                push     ax
1:21E6  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateDIBitmap
1:21EB  a3820e            mov      word ptr [0xe82], ax
1:21EE  837e0800          cmp      word ptr [bp + 8], 0
1:21F2  7503              jne      0x21f7
1:21F4  e91100            jmp      0x2208
1:21F7  ff368a0e          push     word ptr [0xe8a]
1:21FB  ff36880e          push     word ptr [0xe88]
1:21FF  b80000            mov      ax, 0
1:2202  50                push     ax
1:2203  9a39030000        lcall    0, 0x339  ; @1:USER.SelectPalette
1:2208  b80000            mov      ax, 0
1:220B  50                push     ax
1:220C  ff368a0e          push     word ptr [0xe8a]
1:2210  9affff0000        lcall    0, 0xffff  ; @1:USER.ReleaseDC
1:2215  ff7606            push     word ptr [bp + 6]
1:2218  9af91f0000        lcall    0, 0x1ff9  ; @1:KERNEL.GlobalUnlock
1:221D  a1820e            mov      ax, word ptr [0xe82]
1:2220  e90000            jmp      0x2223
1:2223  5e                pop      si
1:2224  5f                pop      di
1:2225  83ed02            sub      bp, 2
1:2228  8be5              mov      sp, bp
1:222A  1f                pop      ds
1:222B  5d                pop      bp
1:222C  4d                dec      bp
1:222D  cb                retf     

; ===== EXPORT:ord_17(#17) =====
1:222E  1e                push     ds
1:222F  58                pop      ax
1:2230  90                nop      
1:2231  45                inc      bp
1:2232  55                push     bp
1:2233  8bec              mov      bp, sp
1:2235  1e                push     ds
1:2236  8ed8              mov      ds, ax
1:2238  81ec0000          sub      sp, 0
1:223C  57                push     di
1:223D  56                push     si
1:223E  837e0e00          cmp      word ptr [bp + 0xe], 0
1:2242  7403              je       0x2247
1:2244  e91e00            jmp      0x2265
1:2247  ff361610          push     word ptr [0x1016]
1:224B  ff7606            push     word ptr [bp + 6]
1:224E  ff7608            push     word ptr [bp + 8]
1:2251  ff760a            push     word ptr [bp + 0xa]
1:2254  ff760c            push     word ptr [bp + 0xc]
1:2257  ff7616            push     word ptr [bp + 0x16]
1:225A  ff7614            push     word ptr [bp + 0x14]
1:225D  9affff0000        lcall    0, 0xffff  ; @1:GDI.PatBlt
1:2262  e98a00            jmp      0x22ef
1:2265  ff760e            push     word ptr [bp + 0xe]
1:2268  9a57210000        lcall    0, 0x2157  ; @1:KERNEL.GlobalLock
1:226D  a3900e            mov      word ptr [0xe90], ax
1:2270  8916920e          mov      word ptr [0xe92], dx
1:2274  a1920e            mov      ax, word ptr [0xe92]
1:2277  0b06900e          or       ax, word ptr [0xe90]
1:227B  7403              je       0x2280
1:227D  e90600            jmp      0x2286
1:2280  b80000            mov      ax, 0
1:2283  e96900            jmp      0x22ef
1:2286  ff36920e          push     word ptr [0xe92]
1:228A  ff36900e          push     word ptr [0xe90]
1:228E  9ac2210000        lcall    0, 0x21c2  ; @1:INT:ord_13(1:200E)
1:2293  83c404            add      sp, 4
1:2296  c41e900e          les      bx, ptr [0xe90]
1:229A  260307            add      ax, word ptr es:[bx]
1:229D  0306900e          add      ax, word ptr [0xe90]
1:22A1  8b16920e          mov      dx, word ptr [0xe92]
1:22A5  a3980e            mov      word ptr [0xe98], ax
1:22A8  89169a0e          mov      word ptr [0xe9a], dx
1:22AC  ff361610          push     word ptr [0x1016]
1:22B0  ff7606            push     word ptr [bp + 6]
1:22B3  ff7608            push     word ptr [bp + 8]
1:22B6  ff760a            push     word ptr [bp + 0xa]
1:22B9  ff760c            push     word ptr [bp + 0xc]
1:22BC  ff7610            push     word ptr [bp + 0x10]
1:22BF  ff7612            push     word ptr [bp + 0x12]
1:22C2  ff7610            push     word ptr [bp + 0x10]
1:22C5  ff760c            push     word ptr [bp + 0xc]
1:22C8  ff369a0e          push     word ptr [0xe9a]
1:22CC  ff36980e          push     word ptr [0xe98]
1:22D0  ff36920e          push     word ptr [0xe92]
1:22D4  ff36900e          push     word ptr [0xe90]
1:22D8  b80000            mov      ax, 0
1:22DB  50                push     ax
1:22DC  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetDIBitsToDevice
1:22E1  ff760e            push     word ptr [bp + 0xe]
1:22E4  9a19220000        lcall    0, 0x2219  ; @1:KERNEL.GlobalUnlock
1:22E9  b80100            mov      ax, 1
1:22EC  e90000            jmp      0x22ef
1:22EF  5e                pop      si
1:22F0  5f                pop      di
1:22F1  83ed02            sub      bp, 2
1:22F4  8be5              mov      sp, bp
1:22F6  1f                pop      ds
1:22F7  5d                pop      bp
1:22F8  4d                dec      bp
1:22F9  cb                retf     

; ===== EXPORT:ord_25(#25) =====
1:22FA  1e                push     ds
1:22FB  58                pop      ax
1:22FC  90                nop      
1:22FD  45                inc      bp
1:22FE  55                push     bp
1:22FF  8bec              mov      bp, sp
1:2301  1e                push     ds
1:2302  8ed8              mov      ds, ax
1:2304  81ec0a00          sub      sp, 0xa
1:2308  57                push     di
1:2309  56                push     si
1:230A  8b4606            mov      ax, word ptr [bp + 6]
1:230D  8b5608            mov      dx, word ptr [bp + 8]
1:2310  8946fa            mov      word ptr [bp - 6], ax
1:2313  8956fc            mov      word ptr [bp - 4], dx
1:2316  8b460a            mov      ax, word ptr [bp + 0xa]
1:2319  8b560c            mov      dx, word ptr [bp + 0xc]
1:231C  8946f6            mov      word ptr [bp - 0xa], ax
1:231F  8956f8            mov      word ptr [bp - 8], dx
1:2322  837e0800          cmp      word ptr [bp + 8], 0
1:2326  7603              jbe      0x232b
1:2328  e90a00            jmp      0x2335
1:232B  817e060080        cmp      word ptr [bp + 6], 0x8000
1:2330  7703              ja       0x2335
1:2332  e94200            jmp      0x2377
1:2335  ff760e            push     word ptr [bp + 0xe]
1:2338  ff76f8            push     word ptr [bp - 8]
1:233B  ff76f6            push     word ptr [bp - 0xa]
1:233E  b80080            mov      ax, 0x8000
1:2341  50                push     ax
1:2342  9a84230000        lcall    0, 0x2384  ; @1:KERNEL._lread
1:2347  3d0080            cmp      ax, 0x8000
1:234A  7503              jne      0x234f
1:234C  e90900            jmp      0x2358
1:234F  b80000            mov      ax, 0
1:2352  ba0000            mov      dx, 0
1:2355  e94a00            jmp      0x23a2
1:2358  816e060080        sub      word ptr [bp + 6], 0x8000
1:235D  835e0800          sbb      word ptr [bp + 8], 0
1:2361  2bc0              sub      ax, ax
1:2363  b90080            mov      cx, 0x8000
1:2366  014ef6            add      word ptr [bp - 0xa], cx
1:2369  150000            adc      ax, 0
1:236C  b9ffff            mov      cx, 0xffff  ; @1:KERNEL.__AHSHIFT
1:236F  d3e0              shl      ax, cl
1:2371  0146f8            add      word ptr [bp - 8], ax
1:2374  e9abff            jmp      0x2322
1:2377  ff760e            push     word ptr [bp + 0xe]
1:237A  ff76f8            push     word ptr [bp - 8]
1:237D  ff76f6            push     word ptr [bp - 0xa]
1:2380  ff7606            push     word ptr [bp + 6]
1:2383  9ac71f0000        lcall    0, 0x1fc7  ; @1:KERNEL._lread
1:2388  3b4606            cmp      ax, word ptr [bp + 6]
1:238B  7503              jne      0x2390
1:238D  e90900            jmp      0x2399
1:2390  b80000            mov      ax, 0
1:2393  ba0000            mov      dx, 0
1:2396  e90900            jmp      0x23a2
1:2399  8b46fa            mov      ax, word ptr [bp - 6]
1:239C  8b56fc            mov      dx, word ptr [bp - 4]
1:239F  e90000            jmp      0x23a2
1:23A2  5e                pop      si
1:23A3  5f                pop      di
1:23A4  83ed02            sub      bp, 2
1:23A7  8be5              mov      sp, bp
1:23A9  1f                pop      ds
1:23AA  5d                pop      bp
1:23AB  4d                dec      bp
1:23AC  ca0a00            retf     0xa

; ===== EXPORT:ord_19(#19) =====
1:23AF  1e                push     ds
1:23B0  58                pop      ax
1:23B1  90                nop      
1:23B2  45                inc      bp
1:23B3  55                push     bp
1:23B4  8bec              mov      bp, sp
1:23B6  1e                push     ds
1:23B7  8ed8              mov      ds, ax
1:23B9  81ec0000          sub      sp, 0
1:23BD  57                push     di
1:23BE  56                push     si
1:23BF  833e161000        cmp      word ptr [0x1016], 0
1:23C4  7503              jne      0x23c9
1:23C6  e90900            jmp      0x23d2
1:23C9  837e0600          cmp      word ptr [bp + 6], 0
1:23CD  7403              je       0x23d2
1:23CF  e90600            jmp      0x23d8
1:23D2  b80000            mov      ax, 0
1:23D5  e96200            jmp      0x243a
1:23D8  ff361610          push     word ptr [0x1016]
1:23DC  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateCompatibleDC
1:23E1  a33610            mov      word ptr [0x1036], ax
1:23E4  ff7606            push     word ptr [bp + 6]
1:23E7  b80e00            mov      ax, 0xe
1:23EA  50                push     ax
1:23EB  b8b211            mov      ax, 0x11b2
1:23EE  1e                push     ds
1:23EF  50                push     ax
1:23F0  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetObject
1:23F5  ff363610          push     word ptr [0x1036]
1:23F9  ff7606            push     word ptr [bp + 6]
1:23FC  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectObject
1:2401  ff361610          push     word ptr [0x1016]
1:2405  ff362210          push     word ptr [0x1022]
1:2409  ff362410          push     word ptr [0x1024]
1:240D  ff36b411          push     word ptr [0x11b4]
1:2411  ff36b611          push     word ptr [0x11b6]
1:2415  ff363610          push     word ptr [0x1036]
1:2419  b80000            mov      ax, 0
1:241C  50                push     ax
1:241D  50                push     ax
1:241E  b82000            mov      ax, 0x20
1:2421  bacc00            mov      dx, 0xcc
1:2424  52                push     dx
1:2425  50                push     ax
1:2426  9affff0000        lcall    0, 0xffff  ; @1:GDI.BitBlt
1:242B  ff363610          push     word ptr [0x1036]
1:242F  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteDC
1:2434  b80100            mov      ax, 1
1:2437  e90000            jmp      0x243a
1:243A  5e                pop      si
1:243B  5f                pop      di
1:243C  83ed02            sub      bp, 2
1:243F  8be5              mov      sp, bp
1:2441  1f                pop      ds
1:2442  5d                pop      bp
1:2443  4d                dec      bp
1:2444  cb                retf     

; ===== EXPORT:ord_21(#21) =====
1:2445  1e                push     ds
1:2446  58                pop      ax
1:2447  90                nop      
1:2448  45                inc      bp
1:2449  55                push     bp
1:244A  8bec              mov      bp, sp
1:244C  1e                push     ds
1:244D  8ed8              mov      ds, ax
1:244F  81ec0000          sub      sp, 0
1:2453  57                push     di
1:2454  56                push     si
1:2455  b8ffff            mov      ax, 0xffff  ; @1:INT:FILEDLGPROC(1:26D1)
1:2458  baffff            mov      dx, 0xffff  ; @1:INT:FILEDLGPROC(1:26D1)
1:245B  52                push     dx
1:245C  50                push     ax
1:245D  ff363210          push     word ptr [0x1032]
1:2461  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.MakeProcInstance
1:2466  a3aa0e            mov      word ptr [0xeaa], ax
1:2469  8916ac0e          mov      word ptr [0xeac], dx
1:246D  ff363210          push     word ptr [0x1032]
1:2471  b8d801            mov      ax, 0x1d8
1:2474  1e                push     ds
1:2475  50                push     ax
1:2476  c41e1e10          les      bx, ptr [0x101e]
1:247A  26ff7726          push     word ptr es:[bx + 0x26]
1:247E  ff36ac0e          push     word ptr [0xeac]
1:2482  ff36aa0e          push     word ptr [0xeaa]
1:2486  9affff0000        lcall    0, 0xffff  ; @1:USER.DialogBox
1:248B  a3ae0e            mov      word ptr [0xeae], ax
1:248E  ff36ac0e          push     word ptr [0xeac]
1:2492  ff36aa0e          push     word ptr [0xeaa]
1:2496  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.FreeProcInstance
1:249B  a1ae0e            mov      ax, word ptr [0xeae]
1:249E  e90000            jmp      0x24a1
1:24A1  5e                pop      si
1:24A2  5f                pop      di
1:24A3  83ed02            sub      bp, 2
1:24A6  8be5              mov      sp, bp
1:24A8  1f                pop      ds
1:24A9  5d                pop      bp
1:24AA  4d                dec      bp
1:24AB  cb                retf     

; ===== EXPORT:ord_32(#32) =====
1:24AC  1e                push     ds
1:24AD  58                pop      ax
1:24AE  90                nop      
1:24AF  45                inc      bp
1:24B0  55                push     bp
1:24B1  8bec              mov      bp, sp
1:24B3  1e                push     ds
1:24B4  8ed8              mov      ds, ax
1:24B6  81ec0000          sub      sp, 0
1:24BA  57                push     di
1:24BB  56                push     si
1:24BC  c706b00e0000      mov      word ptr [0xeb0], 0
1:24C2  e90400            jmp      0x24c9
1:24C5  ff06b00e          inc      word ptr [0xeb0]
1:24C9  b83e10            mov      ax, 0x103e
1:24CC  50                push     ax
1:24CD  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_28(1:2CA4)
1:24D2  83c402            add      sp, 2
1:24D5  3b06b00e          cmp      ax, word ptr [0xeb0]
1:24D9  7703              ja       0x24de
1:24DB  e93b00            jmp      0x2519
1:24DE  8b1eb00e          mov      bx, word ptr [0xeb0]
1:24E2  8a873e10          mov      al, byte ptr [bx + 0x103e]
1:24E6  98                cwde     
1:24E7  e91200            jmp      0x24fc
1:24EA  b80100            mov      ax, 1
1:24ED  e92f00            jmp      0x251f
1:24F0  b80000            mov      ax, 0
1:24F3  e92900            jmp      0x251f
1:24F6  e9ccff            jmp      0x24c5
1:24F9  e91a00            jmp      0x2516
1:24FC  0bc0              or       ax, ax
1:24FE  7503              jne      0x2503
1:2500  e9edff            jmp      0x24f0
1:2503  2d2a00            sub      ax, 0x2a
1:2506  7503              jne      0x250b
1:2508  e9dfff            jmp      0x24ea
1:250B  2d1500            sub      ax, 0x15
1:250E  7503              jne      0x2513
1:2510  e9d7ff            jmp      0x24ea
1:2513  e9e0ff            jmp      0x24f6
1:2516  e9acff            jmp      0x24c5
1:2519  b80000            mov      ax, 0
1:251C  e90000            jmp      0x251f
1:251F  5e                pop      si
1:2520  5f                pop      di
1:2521  83ed02            sub      bp, 2
1:2524  8be5              mov      sp, bp
1:2526  1f                pop      ds
1:2527  5d                pop      bp
1:2528  4d                dec      bp
1:2529  cb                retf     

; ===== EXPORT:ord_31(#31) =====
1:252A  1e                push     ds
1:252B  58                pop      ax
1:252C  90                nop      
1:252D  45                inc      bp
1:252E  55                push     bp
1:252F  8bec              mov      bp, sp
1:2531  1e                push     ds
1:2532  8ed8              mov      ds, ax
1:2534  81ec0400          sub      sp, 4
1:2538  57                push     di
1:2539  56                push     si
1:253A  b83e10            mov      ax, 0x103e
1:253D  1e                push     ds
1:253E  50                push     ax
1:253F  b80000            mov      ax, 0
1:2542  50                push     ax
1:2543  9affff0000        lcall    0, 0xffff  ; @1:KERNEL._lopen
1:2548  8946fc            mov      word ptr [bp - 4], ax
1:254B  3d0000            cmp      ax, 0
1:254E  7c03              jl       0x2553
1:2550  e90600            jmp      0x2559
1:2553  b80000            mov      ax, 0
1:2556  e90e00            jmp      0x2567
1:2559  ff76fc            push     word ptr [bp - 4]
1:255C  9a6b180000        lcall    0, 0x186b  ; @1:KERNEL._lclose
1:2561  b80100            mov      ax, 1
1:2564  e90000            jmp      0x2567
1:2567  5e                pop      si
1:2568  5f                pop      di
1:2569  83ed02            sub      bp, 2
1:256C  8be5              mov      sp, bp
1:256E  1f                pop      ds
1:256F  5d                pop      bp
1:2570  4d                dec      bp
1:2571  cb                retf     

; ===== EXPORT:ord_34(#34) =====
1:2572  1e                push     ds
1:2573  58                pop      ax
1:2574  90                nop      
1:2575  45                inc      bp
1:2576  55                push     bp
1:2577  8bec              mov      bp, sp
1:2579  1e                push     ds
1:257A  8ed8              mov      ds, ax
1:257C  81ec0000          sub      sp, 0
1:2580  57                push     di
1:2581  56                push     si
1:2582  ff7606            push     word ptr [bp + 6]
1:2585  b8c900            mov      ax, 0xc9
1:2588  50                push     ax
1:2589  b83e10            mov      ax, 0x103e
1:258C  1e                push     ds
1:258D  50                push     ax
1:258E  b94000            mov      cx, 0x40
1:2591  51                push     cx
1:2592  9affff0000        lcall    0, 0xffff  ; @1:USER.GetDlgItemText
1:2597  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_32(1:24AC)
1:259C  3d0000            cmp      ax, 0
1:259F  7503              jne      0x25a4
1:25A1  e99600            jmp      0x263a
1:25A4  ff7606            push     word ptr [bp + 6]
1:25A7  b83e10            mov      ax, 0x103e
1:25AA  1e                push     ds
1:25AB  50                push     ax
1:25AC  b9cc00            mov      cx, 0xcc
1:25AF  51                push     cx
1:25B0  b9cb00            mov      cx, 0xcb
1:25B3  51                push     cx
1:25B4  b910c0            mov      cx, 0xc010
1:25B7  51                push     cx
1:25B8  9a22260000        lcall    0, 0x2622  ; @1:USER.DlgDirList
1:25BD  c706b40f3e10      mov      word ptr [0xfb4], 0x103e
1:25C3  c706b20e0000      mov      word ptr [0xeb2], 0
1:25C9  e90400            jmp      0x25d0
1:25CC  ff06b20e          inc      word ptr [0xeb2]
1:25D0  b83e10            mov      ax, 0x103e
1:25D3  50                push     ax
1:25D4  9a71260000        lcall    0, 0x2671  ; @1:INT:ord_28(1:2CA4)
1:25D9  83c402            add      sp, 2
1:25DC  3b06b20e          cmp      ax, word ptr [0xeb2]
1:25E0  7703              ja       0x25e5
1:25E2  e92800            jmp      0x260d
1:25E5  8b1eb20e          mov      bx, word ptr [0xeb2]
1:25E9  80bf3e105c        cmp      byte ptr [bx + 0x103e], 0x5c
1:25EE  7503              jne      0x25f3
1:25F0  e90e00            jmp      0x2601
1:25F3  8b1eb20e          mov      bx, word ptr [0xeb2]
1:25F7  80bf3e103a        cmp      byte ptr [bx + 0x103e], 0x3a
1:25FC  7403              je       0x2601
1:25FE  e90900            jmp      0x260a
1:2601  a1b20e            mov      ax, word ptr [0xeb2]
1:2604  053e10            add      ax, 0x103e
1:2607  a3b40f            mov      word ptr [0xfb4], ax
1:260A  e9bfff            jmp      0x25cc
1:260D  ff7606            push     word ptr [bp + 6]
1:2610  1e                push     ds
1:2611  ff36b40f          push     word ptr [0xfb4]
1:2615  b8ca00            mov      ax, 0xca
1:2618  50                push     ax
1:2619  b8cb00            mov      ax, 0xcb
1:261C  50                push     ax
1:261D  b80000            mov      ax, 0
1:2620  50                push     ax
1:2621  9affff0000        lcall    0, 0xffff  ; @1:USER.DlgDirList
1:2626  ff7606            push     word ptr [bp + 6]
1:2629  b8c900            mov      ax, 0xc9
1:262C  50                push     ax
1:262D  1e                push     ds
1:262E  ff36b40f          push     word ptr [0xfb4]
1:2632  9ac2260000        lcall    0, 0x26c2  ; @1:USER.SetDlgItemText
1:2637  e98c00            jmp      0x26c6
1:263A  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_31(1:252A)
1:263F  3d0000            cmp      ax, 0
1:2642  7503              jne      0x2647
1:2644  e96e00            jmp      0x26b5
1:2647  b83e10            mov      ax, 0x103e
1:264A  50                push     ax
1:264B  b9b40e            mov      cx, 0xeb4
1:264E  51                push     cx
1:264F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_30(1:2C72)
1:2654  83c404            add      sp, 4
1:2657  ff7606            push     word ptr [bp + 6]
1:265A  b8cb00            mov      ax, 0xcb
1:265D  50                push     ax
1:265E  b83e10            mov      ax, 0x103e
1:2661  1e                push     ds
1:2662  50                push     ax
1:2663  b94000            mov      cx, 0x40
1:2666  51                push     cx
1:2667  9a93250000        lcall    0, 0x2593  ; @1:USER.GetDlgItemText
1:266C  b83e10            mov      ax, 0x103e
1:266F  50                push     ax
1:2670  9ace240000        lcall    0, 0x24ce  ; @1:INT:ord_28(1:2CA4)
1:2675  83c402            add      sp, 2
1:2678  3d0300            cmp      ax, 3
1:267B  7703              ja       0x2680
1:267D  e91000            jmp      0x2690
1:2680  b8dd01            mov      ax, 0x1dd
1:2683  50                push     ax
1:2684  b83e10            mov      ax, 0x103e
1:2687  50                push     ax
1:2688  9a99260000        lcall    0, 0x2699  ; @1:INT:ord_29(1:2C32)
1:268D  83c404            add      sp, 4
1:2690  b8b40e            mov      ax, 0xeb4
1:2693  50                push     ax
1:2694  b83e10            mov      ax, 0x103e
1:2697  50                push     ax
1:2698  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_29(1:2C32)
1:269D  83c404            add      sp, 4
1:26A0  ff7606            push     word ptr [bp + 6]
1:26A3  b80100            mov      ax, 1
1:26A6  50                push     ax
1:26A7  9ac3130000        lcall    0, 0x13c3  ; @1:USER.EndDialog
1:26AC  c70688000000      mov      word ptr [0x88], 0
1:26B2  e91100            jmp      0x26c6
1:26B5  ff7606            push     word ptr [bp + 6]
1:26B8  b8c900            mov      ax, 0xc9
1:26BB  50                push     ax
1:26BC  b8df01            mov      ax, 0x1df
1:26BF  1e                push     ds
1:26C0  50                push     ax
1:26C1  9affff0000        lcall    0, 0xffff  ; @1:USER.SetDlgItemText
1:26C6  5e                pop      si
1:26C7  5f                pop      di
1:26C8  83ed02            sub      bp, 2
1:26CB  8be5              mov      sp, bp
1:26CD  1f                pop      ds
1:26CE  5d                pop      bp
1:26CF  4d                dec      bp
1:26D0  cb                retf     

; ===== EXPORT:FILEDLGPROC(#3) =====
1:26D1  1e                push     ds
1:26D2  58                pop      ax
1:26D3  90                nop      
1:26D4  45                inc      bp
1:26D5  55                push     bp
1:26D6  8bec              mov      bp, sp
1:26D8  1e                push     ds
1:26D9  8ed8              mov      ds, ax
1:26DB  81ec0000          sub      sp, 0
1:26DF  57                push     di
1:26E0  56                push     si
1:26E1  8b460c            mov      ax, word ptr [bp + 0xc]
1:26E4  e9ab02            jmp      0x2992
1:26E7  8b460e            mov      ax, word ptr [bp + 0xe]
1:26EA  a38800            mov      word ptr [0x88], ax
1:26ED  ff368800          push     word ptr [0x88]
1:26F1  b8b80f            mov      ax, 0xfb8
1:26F4  1e                push     ds
1:26F5  50                push     ax
1:26F6  9affff0000        lcall    0, 0xffff  ; @1:USER.GetWindowRect
1:26FB  a1bc0f            mov      ax, word ptr [0xfbc]
1:26FE  2b06b80f          sub      ax, word ptr [0xfb8]
1:2702  a3c00f            mov      word ptr [0xfc0], ax
1:2705  a1be0f            mov      ax, word ptr [0xfbe]
1:2708  2b06ba0f          sub      ax, word ptr [0xfba]
1:270C  a3b60f            mov      word ptr [0xfb6], ax
1:270F  ff368800          push     word ptr [0x88]
1:2713  a1c00f            mov      ax, word ptr [0xfc0]
1:2716  99                cdq      
1:2717  2bc2              sub      ax, dx
1:2719  d1f8              sar      ax, 1
1:271B  c41e1e10          les      bx, ptr [0x101e]
1:271F  8bc8              mov      cx, ax
1:2721  268b4706          mov      ax, word ptr es:[bx + 6]
1:2725  99                cdq      
1:2726  2bc2              sub      ax, dx
1:2728  d1f8              sar      ax, 1
1:272A  2bc1              sub      ax, cx
1:272C  50                push     ax
1:272D  a1c00f            mov      ax, word ptr [0xfc0]
1:2730  99                cdq      
1:2731  2bc2              sub      ax, dx
1:2733  d1f8              sar      ax, 1
1:2735  c41e1e10          les      bx, ptr [0x101e]
1:2739  8bc8              mov      cx, ax
1:273B  268b4708          mov      ax, word ptr es:[bx + 8]
1:273F  99                cdq      
1:2740  2bc2              sub      ax, dx
1:2742  d1f8              sar      ax, 1
1:2744  2bc1              sub      ax, cx
1:2746  50                push     ax
1:2747  ff36c00f          push     word ptr [0xfc0]
1:274B  ff36b60f          push     word ptr [0xfb6]
1:274F  b80100            mov      ax, 1
1:2752  50                push     ax
1:2753  9affff0000        lcall    0, 0xffff  ; @1:USER.MoveWindow
1:2758  ff760e            push     word ptr [bp + 0xe]
1:275B  b80100            mov      ax, 1
1:275E  50                push     ax
1:275F  9ad6270000        lcall    0, 0x27d6  ; @1:USER.GetDlgItem
1:2764  50                push     ax
1:2765  b80000            mov      ax, 0
1:2768  50                push     ax
1:2769  9ae5270000        lcall    0, 0x27e5  ; @1:USER.EnableWindow
1:276E  ff760e            push     word ptr [bp + 0xe]
1:2771  b8c900            mov      ax, 0xc9
1:2774  50                push     ax
1:2775  b9e501            mov      cx, 0x1e5
1:2778  1e                push     ds
1:2779  51                push     cx
1:277A  9a13280000        lcall    0, 0x2813  ; @1:USER.SetDlgItemText
1:277F  ff760e            push     word ptr [bp + 0xe]
1:2782  b8c900            mov      ax, 0xc9
1:2785  50                push     ax
1:2786  b81504            mov      ax, 0x415
1:2789  50                push     ax
1:278A  b84000            mov      ax, 0x40
1:278D  50                push     ax
1:278E  2bc0              sub      ax, ax
1:2790  50                push     ax
1:2791  50                push     ax
1:2792  9affff0000        lcall    0, 0xffff  ; @1:USER.SendDlgItemMessage
1:2797  ff760e            push     word ptr [bp + 0xe]
1:279A  9aaf270000        lcall    0, 0x27af  ; @1:INT:ord_34(1:2572)
1:279F  83c402            add      sp, 2
1:27A2  e9fe01            jmp      0x29a3
1:27A5  8b460a            mov      ax, word ptr [bp + 0xa]
1:27A8  e9b701            jmp      0x2962
1:27AB  ff760e            push     word ptr [bp + 0xe]
1:27AE  9a3d280000        lcall    0, 0x283d  ; @1:INT:ord_34(1:2572)
1:27B3  83c402            add      sp, 2
1:27B6  e9cd01            jmp      0x2986
1:27B9  ff760e            push     word ptr [bp + 0xe]
1:27BC  b80000            mov      ax, 0
1:27BF  50                push     ax
1:27C0  9aa8260000        lcall    0, 0x26a8  ; @1:USER.EndDialog
1:27C5  c70688000000      mov      word ptr [0x88], 0
1:27CB  e9b801            jmp      0x2986
1:27CE  ff760e            push     word ptr [bp + 0xe]
1:27D1  b80100            mov      ax, 1
1:27D4  50                push     ax
1:27D5  9a1f280000        lcall    0, 0x281f  ; @1:USER.GetDlgItem
1:27DA  50                push     ax
1:27DB  ff7606            push     word ptr [bp + 6]
1:27DE  9affff0000        lcall    0, 0xffff  ; @1:USER.GetWindowTextLength
1:27E3  50                push     ax
1:27E4  9a29280000        lcall    0, 0x2829  ; @1:USER.EnableWindow
1:27E9  e99a01            jmp      0x2986
1:27EC  8b4608            mov      ax, word ptr [bp + 8]
1:27EF  48                dec      ax
1:27F0  7403              je       0x27f5
1:27F2  e93b00            jmp      0x2830
1:27F5  ff760e            push     word ptr [bp + 0xe]
1:27F8  b85011            mov      ax, 0x1150
1:27FB  1e                push     ds
1:27FC  50                push     ax
1:27FD  b9ca00            mov      cx, 0xca
1:2800  51                push     cx
1:2801  9a5d280000        lcall    0, 0x285d  ; @1:USER.DlgDirSelect
1:2806  ff760e            push     word ptr [bp + 0xe]
1:2809  b8c900            mov      ax, 0xc9
1:280C  50                push     ax
1:280D  b85011            mov      ax, 0x1150
1:2810  1e                push     ds
1:2811  50                push     ax
1:2812  9a33260000        lcall    0, 0x2633  ; @1:USER.SetDlgItemText
1:2817  ff760e            push     word ptr [bp + 0xe]
1:281A  b80100            mov      ax, 1
1:281D  50                push     ax
1:281E  9affff0000        lcall    0, 0xffff  ; @1:USER.GetDlgItem
1:2823  50                push     ax
1:2824  b80100            mov      ax, 1
1:2827  50                push     ax
1:2828  9affff0000        lcall    0, 0xffff  ; @1:USER.EnableWindow
1:282D  e91400            jmp      0x2844
1:2830  837e0802          cmp      word ptr [bp + 8], 2
1:2834  7403              je       0x2839
1:2836  e90b00            jmp      0x2844
1:2839  ff760e            push     word ptr [bp + 0xe]
1:283C  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_34(1:2572)
1:2841  83c402            add      sp, 2
1:2844  e93f01            jmp      0x2986
1:2847  8b4608            mov      ax, word ptr [bp + 8]
1:284A  48                dec      ax
1:284B  7403              je       0x2850
1:284D  e9f200            jmp      0x2942
1:2850  ff760e            push     word ptr [bp + 0xe]
1:2853  b89c10            mov      ax, 0x109c
1:2856  1e                push     ds
1:2857  50                push     ax
1:2858  b8cc00            mov      ax, 0xcc
1:285B  50                push     ax
1:285C  9affff0000        lcall    0, 0xffff  ; @1:USER.DlgDirSelect
1:2861  ff760e            push     word ptr [bp + 0xe]
1:2864  b8c900            mov      ax, 0xc9
1:2867  50                push     ax
1:2868  b85011            mov      ax, 0x1150
1:286B  1e                push     ds
1:286C  50                push     ax
1:286D  b94000            mov      cx, 0x40
1:2870  51                push     cx
1:2871  9a68260000        lcall    0, 0x2668  ; @1:USER.GetDlgItemText
1:2876  b85c00            mov      ax, 0x5c
1:2879  50                push     ax
1:287A  b85011            mov      ax, 0x1150
1:287D  50                push     ax
1:287E  9a9c280000        lcall    0, 0x289c  ; @1:INT:ord_33(1:2D22)
1:2883  83c404            add      sp, 4
1:2886  a3c40f            mov      word ptr [0xfc4], ax
1:2889  833ec40f00        cmp      word ptr [0xfc4], 0
1:288E  7403              je       0x2893
1:2890  e91300            jmp      0x28a6
1:2893  b83a00            mov      ax, 0x3a
1:2896  50                push     ax
1:2897  b85011            mov      ax, 0x1150
1:289A  50                push     ax
1:289B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_33(1:2D22)
1:28A0  83c404            add      sp, 4
1:28A3  a3c40f            mov      word ptr [0xfc4], ax
1:28A6  b89c10            mov      ax, 0x109c
1:28A9  50                push     ax
1:28AA  b8f610            mov      ax, 0x10f6
1:28AD  50                push     ax
1:28AE  9a50260000        lcall    0, 0x2650  ; @1:INT:ord_30(1:2C72)
1:28B3  83c404            add      sp, 4
1:28B6  833ec40f00        cmp      word ptr [0xfc4], 0
1:28BB  7403              je       0x28c0
1:28BD  e91300            jmp      0x28d3
1:28C0  b85011            mov      ax, 0x1150
1:28C3  50                push     ax
1:28C4  b8f610            mov      ax, 0x10f6
1:28C7  50                push     ax
1:28C8  9add280000        lcall    0, 0x28dd  ; @1:INT:ord_29(1:2C32)
1:28CD  83c404            add      sp, 4
1:28D0  e91100            jmp      0x28e4
1:28D3  a1c40f            mov      ax, word ptr [0xfc4]
1:28D6  40                inc      ax
1:28D7  50                push     ax
1:28D8  b8f610            mov      ax, 0x10f6
1:28DB  50                push     ax
1:28DC  9a27290000        lcall    0, 0x2927  ; @1:INT:ord_29(1:2C32)
1:28E1  83c404            add      sp, 4
1:28E4  b85011            mov      ax, 0x1150
1:28E7  50                push     ax
1:28E8  9ad5250000        lcall    0, 0x25d5  ; @1:INT:ord_28(1:2CA4)
1:28ED  83c402            add      sp, 2
1:28F0  3d0000            cmp      ax, 0
1:28F3  7403              je       0x28f8
1:28F5  e93600            jmp      0x292e
1:28F8  ff760e            push     word ptr [bp + 0xe]
1:28FB  b8c900            mov      ax, 0xc9
1:28FE  50                push     ax
1:28FF  b9eb01            mov      cx, 0x1eb
1:2902  1e                push     ds
1:2903  51                push     cx
1:2904  9a3b290000        lcall    0, 0x293b  ; @1:USER.SetDlgItemText
1:2909  ff760e            push     word ptr [bp + 0xe]
1:290C  b8c900            mov      ax, 0xc9
1:290F  50                push     ax
1:2910  b85011            mov      ax, 0x1150
1:2913  1e                push     ds
1:2914  50                push     ax
1:2915  b94000            mov      cx, 0x40
1:2918  51                push     cx
1:2919  9a72280000        lcall    0, 0x2872  ; @1:USER.GetDlgItemText
1:291E  b85011            mov      ax, 0x1150
1:2921  50                push     ax
1:2922  b8f610            mov      ax, 0x10f6
1:2925  50                push     ax
1:2926  9a89260000        lcall    0, 0x2689  ; @1:INT:ord_29(1:2C32)
1:292B  83c404            add      sp, 4
1:292E  ff760e            push     word ptr [bp + 0xe]
1:2931  b8c900            mov      ax, 0xc9
1:2934  50                push     ax
1:2935  b8f610            mov      ax, 0x10f6
1:2938  1e                push     ds
1:2939  50                push     ax
1:293A  9a7b270000        lcall    0, 0x277b  ; @1:USER.SetDlgItemText
1:293F  e91400            jmp      0x2956
1:2942  837e0802          cmp      word ptr [bp + 8], 2
1:2946  7403              je       0x294b
1:2948  e90b00            jmp      0x2956
1:294B  ff760e            push     word ptr [bp + 0xe]
1:294E  9a9b270000        lcall    0, 0x279b  ; @1:INT:ord_34(1:2572)
1:2953  83c402            add      sp, 2
1:2956  e92d00            jmp      0x2986
1:2959  b80000            mov      ax, 0
1:295C  e94a00            jmp      0x29a9
1:295F  e92400            jmp      0x2986
1:2962  48                dec      ax
1:2963  7503              jne      0x2968
1:2965  e943fe            jmp      0x27ab
1:2968  48                dec      ax
1:2969  7503              jne      0x296e
1:296B  e94bfe            jmp      0x27b9
1:296E  2dc700            sub      ax, 0xc7
1:2971  7503              jne      0x2976
1:2973  e958fe            jmp      0x27ce
1:2976  48                dec      ax
1:2977  7503              jne      0x297c
1:2979  e970fe            jmp      0x27ec
1:297C  48                dec      ax
1:297D  48                dec      ax
1:297E  7503              jne      0x2983
1:2980  e9c4fe            jmp      0x2847
1:2983  e9d3ff            jmp      0x2959
1:2986  e91a00            jmp      0x29a3
1:2989  b80000            mov      ax, 0
1:298C  e91a00            jmp      0x29a9
1:298F  e91100            jmp      0x29a3
1:2992  2d1001            sub      ax, 0x110
1:2995  7503              jne      0x299a
1:2997  e94dfd            jmp      0x26e7
1:299A  48                dec      ax
1:299B  7503              jne      0x29a0
1:299D  e905fe            jmp      0x27a5
1:29A0  e9e6ff            jmp      0x2989
1:29A3  b80100            mov      ax, 1
1:29A6  e90000            jmp      0x29a9
1:29A9  5e                pop      si
1:29AA  5f                pop      di
1:29AB  83ed02            sub      bp, 2
1:29AE  8be5              mov      sp, bp
1:29B0  1f                pop      ds
1:29B1  5d                pop      bp
1:29B2  4d                dec      bp
1:29B3  ca0a00            retf     0xa

; ===== EXPORT:ord_44(#44) =====
1:29B6  1e                push     ds
1:29B7  58                pop      ax
1:29B8  90                nop      
1:29B9  45                inc      bp
1:29BA  55                push     bp
1:29BB  8bec              mov      bp, sp
1:29BD  1e                push     ds
1:29BE  8ed8              mov      ds, ax
1:29C0  81ec0000          sub      sp, 0
1:29C4  57                push     di
1:29C5  56                push     si
1:29C6  837e0a00          cmp      word ptr [bp + 0xa], 0
1:29CA  7403              je       0x29cf
1:29CC  e90600            jmp      0x29d5
1:29CF  b80000            mov      ax, 0
1:29D2  e90c00            jmp      0x29e1
1:29D5  8b460e            mov      ax, word ptr [bp + 0xe]
1:29D8  a33210            mov      word ptr [0x1032], ax
1:29DB  b80100            mov      ax, 1
1:29DE  e90000            jmp      0x29e1
1:29E1  5e                pop      si
1:29E2  5f                pop      di
1:29E3  83ed02            sub      bp, 2
1:29E6  8be5              mov      sp, bp
1:29E8  1f                pop      ds
1:29E9  5d                pop      bp
1:29EA  4d                dec      bp
1:29EB  ca0a00            retf     0xa

; ===== EXPORT:WEP(#2) =====
1:29EE  1e                push     ds
1:29EF  58                pop      ax
1:29F0  90                nop      
1:29F1  45                inc      bp
1:29F2  55                push     bp
1:29F3  8bec              mov      bp, sp
1:29F5  1e                push     ds
1:29F6  8ed8              mov      ds, ax
1:29F8  81ec0000          sub      sp, 0
1:29FC  57                push     di
1:29FD  56                push     si
1:29FE  b80100            mov      ax, 1
1:2A01  e90000            jmp      0x2a04
1:2A04  5e                pop      si
1:2A05  5f                pop      di
1:2A06  83ed02            sub      bp, 2
1:2A09  8be5              mov      sp, bp
1:2A0B  1f                pop      ds
1:2A0C  5d                pop      bp
1:2A0D  4d                dec      bp
1:2A0E  ca0200            retf     2

; ===== EXPORT:MODULE(#1) =====
1:2A11  1e                push     ds
1:2A12  58                pop      ax
1:2A13  90                nop      
1:2A14  45                inc      bp
1:2A15  55                push     bp
1:2A16  8bec              mov      bp, sp
1:2A18  1e                push     ds
1:2A19  8ed8              mov      ds, ax
1:2A1B  81ec0a00          sub      sp, 0xa
1:2A1F  57                push     di
1:2A20  56                push     si
1:2A21  8b4608            mov      ax, word ptr [bp + 8]
1:2A24  a31610            mov      word ptr [0x1016], ax
1:2A27  8b4606            mov      ax, word ptr [bp + 6]
1:2A2A  a31010            mov      word ptr [0x1010], ax
1:2A2D  ff361010          push     word ptr [0x1010]
1:2A31  9a522a0000        lcall    0, 0x2a52  ; @1:KERNEL.GlobalLock
1:2A36  a31e10            mov      word ptr [0x101e], ax
1:2A39  89162010          mov      word ptr [0x1020], dx
1:2A3D  a12010            mov      ax, word ptr [0x1020]
1:2A40  0b061e10          or       ax, word ptr [0x101e]
1:2A44  7503              jne      0x2a49
1:2A46  e9b501            jmp      0x2bfe
1:2A49  c41e1e10          les      bx, ptr [0x101e]
1:2A4D  26ff7720          push     word ptr es:[bx + 0x20]
1:2A51  9a69220000        lcall    0, 0x2269  ; @1:KERNEL.GlobalLock
1:2A56  a3ae11            mov      word ptr [0x11ae], ax
1:2A59  8916b011          mov      word ptr [0x11b0], dx
1:2A5D  a1b011            mov      ax, word ptr [0x11b0]
1:2A60  0b06ae11          or       ax, word ptr [0x11ae]
1:2A64  7503              jne      0x2a69
1:2A66  e98c01            jmp      0x2bf5
1:2A69  8b460a            mov      ax, word ptr [bp + 0xa]
1:2A6C  e94f01            jmp      0x2bbe
1:2A6F  c41e1e10          les      bx, ptr [0x101e]
1:2A73  26837f1465        cmp      word ptr es:[bx + 0x14], 0x65
1:2A78  7d03              jge      0x2a7d
1:2A7A  e91d00            jmp      0x2a9a
1:2A7D  c41e1e10          les      bx, ptr [0x101e]
1:2A81  26817f36f400      cmp      word ptr es:[bx + 0x36], 0xf4
1:2A87  7403              je       0x2a8c
1:2A89  e90e00            jmp      0x2a9a
1:2A8C  c41e1e10          les      bx, ptr [0x101e]
1:2A90  26837f3878        cmp      word ptr es:[bx + 0x38], 0x78
1:2A95  7503              jne      0x2a9a
1:2A97  e91100            jmp      0x2aab
1:2A9A  c706f2010000      mov      word ptr [0x1f2], 0
1:2AA0  c746fc0500        mov      word ptr [bp - 4], 5
1:2AA5  e94001            jmp      0x2be8
1:2AA8  e90600            jmp      0x2ab1
1:2AAB  c706f2010100      mov      word ptr [0x1f2], 1
1:2AB1  e93401            jmp      0x2be8
1:2AB4  b8ca0f            mov      ax, 0xfca
1:2AB7  50                push     ax
1:2AB8  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_43(1:2CC0)
1:2ABD  83c402            add      sp, 2
1:2AC0  ff36ca0f          push     word ptr [0xfca]
1:2AC4  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_42(1:2D4E)
1:2AC9  83c402            add      sp, 2
1:2ACC  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_41(1:003F)
1:2AD1  8946fc            mov      word ptr [bp - 4], ax
1:2AD4  e91101            jmp      0x2be8
1:2AD7  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_40(1:0090)
1:2ADC  8946fc            mov      word ptr [bp - 4], ax
1:2ADF  e90601            jmp      0x2be8
1:2AE2  833ef20100        cmp      word ptr [0x1f2], 0
1:2AE7  7503              jne      0x2aec
1:2AE9  e90b00            jmp      0x2af7
1:2AEC  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_39(1:0F8F)
1:2AF1  8946fc            mov      word ptr [bp - 4], ax
1:2AF4  e95500            jmp      0x2b4c
1:2AF7  ff361610          push     word ptr [0x1016]
1:2AFB  b800ff            mov      ax, 0xff00
1:2AFE  baff00            mov      dx, 0xff
1:2B01  52                push     dx
1:2B02  50                push     ax
1:2B03  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextColor
1:2B08  ff361610          push     word ptr [0x1016]
1:2B0C  2bc0              sub      ax, ax
1:2B0E  50                push     ax
1:2B0F  50                push     ax
1:2B10  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkColor
1:2B15  ff361610          push     word ptr [0x1016]
1:2B19  b80000            mov      ax, 0
1:2B1C  50                push     ax
1:2B1D  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextAlign
1:2B22  ff361610          push     word ptr [0x1016]
1:2B26  b80100            mov      ax, 1
1:2B29  50                push     ax
1:2B2A  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkMode
1:2B2F  ff361610          push     word ptr [0x1016]
1:2B33  b80000            mov      ax, 0
1:2B36  50                push     ax
1:2B37  50                push     ax
1:2B38  b8f401            mov      ax, 0x1f4
1:2B3B  1e                push     ds
1:2B3C  50                push     ax
1:2B3D  50                push     ax
1:2B3E  9ae9280000        lcall    0, 0x28e9  ; @1:INT:ord_28(1:2CA4)
1:2B43  83c402            add      sp, 2
1:2B46  50                push     ax
1:2B47  9affff0000        lcall    0, 0xffff  ; @1:GDI.TextOut
1:2B4C  e99900            jmp      0x2be8
1:2B4F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_38(1:1229)
1:2B54  8946fc            mov      word ptr [bp - 4], ax
1:2B57  e98e00            jmp      0x2be8
1:2B5A  a13210            mov      ax, word ptr [0x1032]
1:2B5D  c41eae11          les      bx, ptr [0x11ae]
1:2B61  26894716          mov      word ptr es:[bx + 0x16], ax
1:2B65  c746f60000        mov      word ptr [bp - 0xa], 0
1:2B6A  e90300            jmp      0x2b70
1:2B6D  ff46f6            inc      word ptr [bp - 0xa]
1:2B70  837ef604          cmp      word ptr [bp - 0xa], 4
1:2B74  7c03              jl       0x2b79
1:2B76  e91400            jmp      0x2b8d
1:2B79  8b46f6            mov      ax, word ptr [bp - 0xa]
1:2B7C  40                inc      ax
1:2B7D  8b76f6            mov      si, word ptr [bp - 0xa]
1:2B80  d1e6              shl      si, 1
1:2B82  c41eae11          les      bx, ptr [0x11ae]
1:2B86  2689400e          mov      word ptr es:[bx + si + 0xe], ax
1:2B8A  e9e0ff            jmp      0x2b6d
1:2B8D  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_37(1:124F)
1:2B92  8946fc            mov      word ptr [bp - 4], ax
1:2B95  e95000            jmp      0x2be8
1:2B98  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_36(1:1270)
1:2B9D  8946fc            mov      word ptr [bp - 4], ax
1:2BA0  e94500            jmp      0x2be8
1:2BA3  8b460a            mov      ax, word ptr [bp + 0xa]
1:2BA6  2d0700            sub      ax, 7
1:2BA9  50                push     ax
1:2BAA  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_35(1:1291)
1:2BAF  83c402            add      sp, 2
1:2BB2  8946fc            mov      word ptr [bp - 4], ax
1:2BB5  e93000            jmp      0x2be8
1:2BB8  e92d00            jmp      0x2be8
1:2BBB  e92a00            jmp      0x2be8
1:2BBE  3d0c00            cmp      ax, 0xc
1:2BC1  7603              jbe      0x2bc6
1:2BC3  e9f2ff            jmp      0x2bb8
1:2BC6  d1e0              shl      ax, 1
1:2BC8  93                xchg     bx, ax
1:2BC9  2effa7ce2b        jmp      word ptr cs:[bx + 0x2bce]
1:2BCE  b42a              mov      ah, 0x2a
1:2BD0  d7                xlatb    
1:2BD1  2ae2              sub      ah, dl
1:2BD3  2a4f2b            sub      cl, byte ptr [bx + 0x2b]
1:2BD6  b82b5a            mov      ax, 0x5a2b
1:2BD9  2b982ba3          sub      bx, word ptr [bx + si - 0x5cd5]
1:2BDD  2ba32ba3          sub      sp, word ptr [bp + di - 0x5cd5]
1:2BE1  2ba32bb8          sub      sp, word ptr [bp + di - 0x47d5]
1:2BE5  2b6f2a            sub      bp, word ptr [bx + 0x2a]
1:2BE8  c41e1e10          les      bx, ptr [0x101e]
1:2BEC  26ff7720          push     word ptr es:[bx + 0x20]
1:2BF0  9ae5220000        lcall    0, 0x22e5  ; @1:KERNEL.GlobalUnlock
1:2BF5  ff361010          push     word ptr [0x1010]
1:2BF9  9af12b0000        lcall    0, 0x2bf1  ; @1:KERNEL.GlobalUnlock
1:2BFE  8b46fc            mov      ax, word ptr [bp - 4]
1:2C01  e90000            jmp      0x2c04
1:2C04  5e                pop      si
1:2C05  5f                pop      di
1:2C06  83ed02            sub      bp, 2
1:2C09  8be5              mov      sp, bp
1:2C0B  1f                pop      ds
1:2C0C  5d                pop      bp
1:2C0D  4d                dec      bp
1:2C0E  ca0600            retf     6
1:2C11  0000              add      byte ptr [bx + si], al
1:2C13  0000              add      byte ptr [bx + si], al
1:2C15  0000              add      byte ptr [bx + si], al
1:2C17  0000              add      byte ptr [bx + si], al
1:2C19  0000              add      byte ptr [bx + si], al
1:2C1B  0000              add      byte ptr [bx + si], al
1:2C1D  0000              add      byte ptr [bx + si], al
1:2C1F  0000              add      byte ptr [bx + si], al
1:2C21  0000              add      byte ptr [bx + si], al
1:2C23  0000              add      byte ptr [bx + si], al
1:2C25  0000              add      byte ptr [bx + si], al
1:2C27  0000              add      byte ptr [bx + si], al
1:2C29  0000              add      byte ptr [bx + si], al
1:2C2B  0000              add      byte ptr [bx + si], al
1:2C2D  0000              add      byte ptr [bx + si], al
1:2C2F  00c3              add      bl, al
1:2C31  00558b            add      byte ptr [di - 0x75], dl
1:2C34  ec                in       al, dx
1:2C35  8bd7              mov      dx, di
1:2C37  8bde              mov      bx, si
1:2C39  8cd8              mov      ax, ds
1:2C3B  8ec0              mov      es, ax
1:2C3D  8b7e06            mov      di, word ptr [bp + 6]
1:2C40  33c0              xor      ax, ax
1:2C42  b9ffff            mov      cx, 0xffff
1:2C45  f2ae              repne scasb al, byte ptr es:[di]
1:2C47  8d75ff            lea      si, [di - 1]
1:2C4A  8b7e08            mov      di, word ptr [bp + 8]
1:2C4D  b9ffff            mov      cx, 0xffff
1:2C50  f2ae              repne scasb al, byte ptr es:[di]
1:2C52  f7d1              not      cx
1:2C54  2bf9              sub      di, cx
1:2C56  87fe              xchg     si, di
1:2C58  8b4606            mov      ax, word ptr [bp + 6]
1:2C5B  f7c60100          test     si, 1
1:2C5F  7402              je       0x2c63
1:2C61  a4                movsb    byte ptr es:[di], byte ptr [si]
1:2C62  49                dec      cx
1:2C63  d1e9              shr      cx, 1
1:2C65  f3a5              rep movsw word ptr es:[di], word ptr [si]
1:2C67  13c9              adc      cx, cx
1:2C69  f3a4              rep movsb byte ptr es:[di], byte ptr [si]
1:2C6B  8bf3              mov      si, bx
1:2C6D  8bfa              mov      di, dx
1:2C6F  5d                pop      bp
1:2C70  cb                retf     