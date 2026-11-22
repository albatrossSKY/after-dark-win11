File: raw\unpacked\MODULES\LOGO.AD
Module: 'LOGO' ('Logo')
CS:IP=1:2552  SS:SP=0:0000  AutoDS=2  Heap=1024  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (3): KERNEL, GDI, USER
Segments (2):
  SEG  1: CODE off=0x006A0 len=0x2584 min=0x2584 flags=0x0D50 relocs=215
  SEG  2: DATA off=0x02F80 len=0x0938 min=0x0938 flags=0x0C71 relocs=0
Exports (48):
  ord   1: SEG1:1AB9 flags=0x03 MODULE
  ord   2: SEG1:1A96 flags=0x03 WEP
  ord   3: SEG1:177C flags=0x03 FILEDLGPROC
  ord   4: SEG1:253E flags=0x03 ___EXPORTEDSTUB
  ord   5: SEG1:12EE flags=0x00 
  ord   6: SEG1:0A1D flags=0x00 
  ord   7: SEG1:1463 flags=0x00 
  ord   8: SEG1:067C flags=0x00 
  ord   9: SEG1:1D44 flags=0x00 
  ord  10: SEG1:0D45 flags=0x00 
  ord  11: SEG1:0D92 flags=0x00 
  ord  12: SEG1:0837 flags=0x00 
  ord  13: SEG1:14F9 flags=0x00 
  ord  14: SEG1:1151 flags=0x00 
  ord  15: SEG1:1E32 flags=0x00 
  ord  16: SEG1:13AE flags=0x00 
  ord  17: SEG1:10EA flags=0x00 
  ord  18: SEG1:1205 flags=0x00 
  ord  19: SEG1:08E6 flags=0x00 
  ord  20: SEG1:0B0C flags=0x00 
  ord  21: SEG1:1CD2 flags=0x00 
  ord  22: SEG1:1D12 flags=0x00 
  ord  23: SEG1:1DC2 flags=0x00 
  ord  24: SEG1:1622 flags=0x00 
  ord  25: SEG1:15DA flags=0x00 
  ord  26: SEG1:1560 flags=0x00 
  ord  27: SEG1:0524 flags=0x00 
  ord  28: SEG1:0503 flags=0x00 
  ord  29: SEG1:04E2 flags=0x00 
  ord  30: SEG1:04BC flags=0x00 
  ord  31: SEG1:029A flags=0x00 
  ord  32: SEG1:0242 flags=0x00 
  ord  33: SEG1:0000 flags=0x00 
  ord  34: SEG1:1DEE flags=0x00 
  ord  35: SEG1:1D60 flags=0x00 
  ord  36: SEG1:1A5E flags=0x00 
  ord  37: SEG1:1E64 flags=0x00 
  ord  38: SEG1:20A8 flags=0x00 
  ord  39: SEG1:1F68 flags=0x00 
  ord  40: SEG1:21DA flags=0x00 
  ord  41: SEG1:2202 flags=0x00 
  ord  42: SEG1:22A4 flags=0x00 
  ord  43: SEG1:2268 flags=0x00 
  ord  44: SEG1:22CE flags=0x00 
  ord  45: SEG1:2206 flags=0x00 
  ord  46: SEG1:1F82 flags=0x00 
  ord  47: SEG1:2472 flags=0x00 
  ord  48: SEG1:252E flags=0x00 
Resources (9):
  RT_DIALOG        #1               off=0x03900 len=   224
  TYPE_1000        #1               off=0x039E0 len=   352
  TYPE_1000        #2               off=0x03B40 len=   240
  TYPE_1000        #3               off=0x03C30 len=   144
  TYPE_1000        #4               off=0x03CC0 len=    96
  TYPE_2000        #10              off=0x03D20 len=    80
  TYPE_2000        #20              off=0x03D70 len=    16
  TYPE_2000        #30              off=0x03D80 len=   624
  TYPE_15          #1               off=0x03FF0 len=    16


; ===== EXPORT:ord_33(#33) =====
1:0000  1e                push     ds
1:0001  58                pop      ax
1:0002  90                nop      
1:0003  45                inc      bp
1:0004  55                push     bp
1:0005  8bec              mov      bp, sp
1:0007  1e                push     ds
1:0008  8ed8              mov      ds, ax
1:000A  81ec0600          sub      sp, 6
1:000E  57                push     di
1:000F  56                push     si
1:0010  ff367801          push     word ptr [0x178]
1:0014  9affff0000        lcall    0, 0xffff  ; @1:USER.IsWindow
1:0019  3d0000            cmp      ax, 0
1:001C  7503              jne      0x21
1:001E  e90d00            jmp      0x2e
1:0021  ff367801          push     word ptr [0x178]
1:0025  b80000            mov      ax, 0
1:0028  50                push     ax
1:0029  9affff0000        lcall    0, 0xffff  ; @1:USER.EndDialog
1:002E  c41e2609          les      bx, ptr [0x926]
1:0032  268b4706          mov      ax, word ptr es:[bx + 6]
1:0036  e94e00            jmp      0x87
1:0039  c706a8070100      mov      word ptr [0x7a8], 1
1:003F  c7062409bc02      mov      word ptr [0x924], 0x2bc
1:0045  e97900            jmp      0xc1
1:0048  c706a8070100      mov      word ptr [0x7a8], 1
1:004E  c70624096400      mov      word ptr [0x924], 0x64
1:0054  e96a00            jmp      0xc1
1:0057  c706a8070100      mov      word ptr [0x7a8], 1
1:005D  c70624090100      mov      word ptr [0x924], 1
1:0063  e95b00            jmp      0xc1
1:0066  c706a8070200      mov      word ptr [0x7a8], 2
1:006C  c70624090100      mov      word ptr [0x924], 1
1:0072  e94c00            jmp      0xc1
1:0075  c706a8070300      mov      word ptr [0x7a8], 3
1:007B  c70624090100      mov      word ptr [0x924], 1
1:0081  e93d00            jmp      0xc1
1:0084  e93a00            jmp      0xc1
1:0087  3d2800            cmp      ax, 0x28
1:008A  7503              jne      0x8f
1:008C  e9c8ff            jmp      0x57
1:008F  7e03              jle      0x94
1:0091  e91200            jmp      0xa6
1:0094  0bc0              or       ax, ax
1:0096  7503              jne      0x9b
1:0098  e99eff            jmp      0x39
1:009B  2d1400            sub      ax, 0x14
1:009E  7503              jne      0xa3
1:00A0  e9a5ff            jmp      0x48
1:00A3  e91b00            jmp      0xc1
1:00A6  2d3c00            sub      ax, 0x3c
1:00A9  7503              jne      0xae
1:00AB  e9b8ff            jmp      0x66
1:00AE  2d1400            sub      ax, 0x14
1:00B1  7503              jne      0xb6
1:00B3  e9bfff            jmp      0x75
1:00B6  2d1400            sub      ax, 0x14
1:00B9  7503              jne      0xbe
1:00BB  e9b7ff            jmp      0x75
1:00BE  e90000            jmp      0xc1
1:00C1  b80000            mov      ax, 0
1:00C4  50                push     ax
1:00C5  b90804            mov      cx, 0x408
1:00C8  51                push     cx
1:00C9  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LocalAlloc
1:00CE  a36201            mov      word ptr [0x162], ax
1:00D1  b82700            mov      ax, 0x27
1:00D4  1e                push     ds
1:00D5  50                push     ax
1:00D6  b81e00            mov      ax, 0x1e
1:00D9  1e                push     ds
1:00DA  50                push     ax
1:00DB  b81d00            mov      ax, 0x1d
1:00DE  1e                push     ds
1:00DF  50                push     ax
1:00E0  b80801            mov      ax, 0x108
1:00E3  1e                push     ds
1:00E4  50                push     ax
1:00E5  b94600            mov      cx, 0x46
1:00E8  51                push     cx
1:00E9  b91000            mov      cx, 0x10
1:00EC  1e                push     ds
1:00ED  51                push     cx
1:00EE  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GetPrivateProfileString
1:00F3  b80100            mov      ax, 1
1:00F6  a3ba07            mov      word ptr [0x7ba], ax
1:00F9  a3b807            mov      word ptr [0x7b8], ax
1:00FC  c706ae070000      mov      word ptr [0x7ae], 0
1:0102  c706b0070000      mov      word ptr [0x7b0], 0
1:0108  b80801            mov      ax, 0x108
1:010B  50                push     ax
1:010C  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:1D44)
1:0111  83c402            add      sp, 2
1:0114  3d0000            cmp      ax, 0
1:0117  7403              je       0x11c
1:0119  e91c00            jmp      0x138
1:011C  c41eaa07          les      bx, ptr [0x7aa]
1:0120  26ff7724          push     word ptr es:[bx + 0x24]
1:0124  26ff7722          push     word ptr es:[bx + 0x22]
1:0128  b83200            mov      ax, 0x32
1:012B  1e                push     ds
1:012C  50                push     ax
1:012D  9a58010000        lcall    0, 0x158  ; @1:KERNEL.lstrcpy
1:0132  b80700            mov      ax, 7
1:0135  e9ff00            jmp      0x237
1:0138  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:067C)
1:013D  8946fc            mov      word ptr [bp - 4], ax
1:0140  8b46fc            mov      ax, word ptr [bp - 4]
1:0143  e94100            jmp      0x187
1:0146  c41eaa07          les      bx, ptr [0x7aa]
1:014A  26ff7724          push     word ptr es:[bx + 0x24]
1:014E  26ff7722          push     word ptr es:[bx + 0x22]
1:0152  b86800            mov      ax, 0x68
1:0155  1e                push     ds
1:0156  50                push     ax
1:0157  9a77010000        lcall    0, 0x177  ; @1:KERNEL.lstrcpy
1:015C  b80700            mov      ax, 7
1:015F  e9d500            jmp      0x237
1:0162  e93100            jmp      0x196
1:0165  c41eaa07          les      bx, ptr [0x7aa]
1:0169  26ff7724          push     word ptr es:[bx + 0x24]
1:016D  26ff7722          push     word ptr es:[bx + 0x22]
1:0171  b8a000            mov      ax, 0xa0
1:0174  1e                push     ds
1:0175  50                push     ax
1:0176  9ad0010000        lcall    0, 0x1d0  ; @1:KERNEL.lstrcpy
1:017B  b80700            mov      ax, 7
1:017E  e9b600            jmp      0x237
1:0181  e91200            jmp      0x196
1:0184  e90f00            jmp      0x196
1:0187  48                dec      ax
1:0188  7503              jne      0x18d
1:018A  e9b9ff            jmp      0x146
1:018D  48                dec      ax
1:018E  7503              jne      0x193
1:0190  e9d2ff            jmp      0x165
1:0193  e90000            jmp      0x196
1:0196  c41e2609          les      bx, ptr [0x926]
1:019A  268b4702          mov      ax, word ptr es:[bx + 2]
1:019E  2d6400            sub      ax, 0x64
1:01A1  3b062c09          cmp      ax, word ptr [0x92c]
1:01A5  7d03              jge      0x1aa
1:01A7  e91400            jmp      0x1be
1:01AA  c41e2609          les      bx, ptr [0x926]
1:01AE  268b4704          mov      ax, word ptr es:[bx + 4]
1:01B2  2d6400            sub      ax, 0x64
1:01B5  3b062e09          cmp      ax, word ptr [0x92e]
1:01B9  7c03              jl       0x1be
1:01BB  e91c00            jmp      0x1da
1:01BE  c41eaa07          les      bx, ptr [0x7aa]
1:01C2  26ff7724          push     word ptr es:[bx + 0x24]
1:01C6  26ff7722          push     word ptr es:[bx + 0x22]
1:01CA  b8e400            mov      ax, 0xe4
1:01CD  1e                push     ds
1:01CE  50                push     ax
1:01CF  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.lstrcpy
1:01D4  b80700            mov      ax, 7
1:01D7  e95d00            jmp      0x237
1:01DA  c41e2609          les      bx, ptr [0x926]
1:01DE  268b4702          mov      ax, word ptr es:[bx + 2]
1:01E2  2d3200            sub      ax, 0x32
1:01E5  3b062c09          cmp      ax, word ptr [0x92c]
1:01E9  7d03              jge      0x1ee
1:01EB  e91400            jmp      0x202
1:01EE  c41e2609          les      bx, ptr [0x926]
1:01F2  268b4704          mov      ax, word ptr es:[bx + 4]
1:01F6  2d3200            sub      ax, 0x32
1:01F9  3b062e09          cmp      ax, word ptr [0x92e]
1:01FD  7c03              jl       0x202
1:01FF  e90c00            jmp      0x20e
1:0202  c706ae070000      mov      word ptr [0x7ae], 0
1:0208  c706b0070000      mov      word ptr [0x7b0], 0
1:020E  c706b207d007      mov      word ptr [0x7b2], 0x7d0
1:0214  ff36a607          push     word ptr [0x7a6]
1:0218  ff366601          push     word ptr [0x166]
1:021C  b80000            mov      ax, 0
1:021F  50                push     ax
1:0220  9affff0000        lcall    0, 0xffff  ; @1:USER.SelectPalette
1:0225  8946fa            mov      word ptr [bp - 6], ax
1:0228  ff36a607          push     word ptr [0x7a6]
1:022C  9affff0000        lcall    0, 0xffff  ; @1:USER.RealizePalette
1:0231  b80000            mov      ax, 0
1:0234  e90000            jmp      0x237
1:0237  5e                pop      si
1:0238  5f                pop      di
1:0239  83ed02            sub      bp, 2
1:023C  8be5              mov      sp, bp
1:023E  1f                pop      ds
1:023F  5d                pop      bp
1:0240  4d                dec      bp
1:0241  cb                retf     

; ===== EXPORT:ord_32(#32) =====
1:0242  1e                push     ds
1:0243  58                pop      ax
1:0244  90                nop      
1:0245  45                inc      bp
1:0246  55                push     bp
1:0247  8bec              mov      bp, sp
1:0249  1e                push     ds
1:024A  8ed8              mov      ds, ax
1:024C  81ec0000          sub      sp, 0
1:0250  57                push     di
1:0251  56                push     si
1:0252  b8d004            mov      ax, 0x4d0
1:0255  1e                push     ds
1:0256  50                push     ax
1:0257  b90000            mov      cx, 0
1:025A  51                push     cx
1:025B  51                push     cx
1:025C  c41e2609          les      bx, ptr [0x926]
1:0260  26ff7702          push     word ptr es:[bx + 2]
1:0264  c41e2609          les      bx, ptr [0x926]
1:0268  26ff7704          push     word ptr es:[bx + 4]
1:026C  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:0271  ff36a607          push     word ptr [0x7a6]
1:0275  b8d004            mov      ax, 0x4d0
1:0278  1e                push     ds
1:0279  50                push     ax
1:027A  b80400            mov      ax, 4
1:027D  50                push     ax
1:027E  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:0283  50                push     ax
1:0284  9affff0000        lcall    0, 0xffff  ; @1:USER.FillRect
1:0289  b80000            mov      ax, 0
1:028C  e90000            jmp      0x28f
1:028F  5e                pop      si
1:0290  5f                pop      di
1:0291  83ed02            sub      bp, 2
1:0294  8be5              mov      sp, bp
1:0296  1f                pop      ds
1:0297  5d                pop      bp
1:0298  4d                dec      bp
1:0299  cb                retf     

; ===== EXPORT:ord_31(#31) =====
1:029A  1e                push     ds
1:029B  58                pop      ax
1:029C  90                nop      
1:029D  45                inc      bp
1:029E  55                push     bp
1:029F  8bec              mov      bp, sp
1:02A1  1e                push     ds
1:02A2  8ed8              mov      ds, ax
1:02A4  81ec0c00          sub      sp, 0xc
1:02A8  57                push     di
1:02A9  56                push     si
1:02AA  ff06b207          inc      word ptr [0x7b2]
1:02AE  a1b207            mov      ax, word ptr [0x7b2]
1:02B1  39062409          cmp      word ptr [0x924], ax
1:02B5  7f03              jg       0x2ba
1:02B7  e90600            jmp      0x2c0
1:02BA  b80000            mov      ax, 0
1:02BD  e9f101            jmp      0x4b1
1:02C0  c706b2070000      mov      word ptr [0x7b2], 0
1:02C6  a1ae07            mov      ax, word ptr [0x7ae]
1:02C9  8946f4            mov      word ptr [bp - 0xc], ax
1:02CC  a1b007            mov      ax, word ptr [0x7b0]
1:02CF  8946fa            mov      word ptr [bp - 6], ax
1:02D2  a1b807            mov      ax, word ptr [0x7b8]
1:02D5  8946fc            mov      word ptr [bp - 4], ax
1:02D8  a1ba07            mov      ax, word ptr [0x7ba]
1:02DB  8946f8            mov      word ptr [bp - 8], ax
1:02DE  a1a807            mov      ax, word ptr [0x7a8]
1:02E1  f72eb807          imul     word ptr [0x7b8]
1:02E5  0106ae07          add      word ptr [0x7ae], ax
1:02E9  a12c09            mov      ax, word ptr [0x92c]
1:02EC  0306ae07          add      ax, word ptr [0x7ae]
1:02F0  c41e2609          les      bx, ptr [0x926]
1:02F4  26394702          cmp      word ptr es:[bx + 2], ax
1:02F8  7f03              jg       0x2fd
1:02FA  e90a00            jmp      0x307
1:02FD  833eae0700        cmp      word ptr [0x7ae], 0
1:0302  7c03              jl       0x307
1:0304  e90400            jmp      0x30b
1:0307  f71eb807          neg      word ptr [0x7b8]
1:030B  a1ba07            mov      ax, word ptr [0x7ba]
1:030E  0106b007          add      word ptr [0x7b0], ax
1:0312  a12e09            mov      ax, word ptr [0x92e]
1:0315  0306b007          add      ax, word ptr [0x7b0]
1:0319  c41e2609          les      bx, ptr [0x926]
1:031D  26394704          cmp      word ptr es:[bx + 4], ax
1:0321  7f03              jg       0x326
1:0323  e90a00            jmp      0x330
1:0326  833eb00700        cmp      word ptr [0x7b0], 0
1:032B  7c03              jl       0x330
1:032D  e90400            jmp      0x334
1:0330  f71eba07          neg      word ptr [0x7ba]
1:0334  833e6a0100        cmp      word ptr [0x16a], 0
1:0339  7503              jne      0x33e
1:033B  e92100            jmp      0x35f
1:033E  833e720100        cmp      word ptr [0x172], 0
1:0343  7403              je       0x348
1:0345  e91700            jmp      0x35f
1:0348  b82000            mov      ax, 0x20
1:034B  bacc00            mov      dx, 0xcc
1:034E  52                push     dx
1:034F  50                push     ax
1:0350  ff366a01          push     word ptr [0x16a]
1:0354  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:1463)
1:0359  83c406            add      sp, 6
1:035C  e93e00            jmp      0x39d
1:035F  833e680100        cmp      word ptr [0x168], 0
1:0364  7503              jne      0x369
1:0366  e93400            jmp      0x39d
1:0369  b8e404            mov      ax, 0x4e4
1:036C  1e                push     ds
1:036D  50                push     ax
1:036E  ff366801          push     word ptr [0x168]
1:0372  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_6(1:0A1D)
1:0377  83c406            add      sp, 6
1:037A  b82000            mov      ax, 0x20
1:037D  bacc00            mov      dx, 0xcc
1:0380  52                push     dx
1:0381  50                push     ax
1:0382  b80000            mov      ax, 0
1:0385  50                push     ax
1:0386  50                push     ax
1:0387  ff366801          push     word ptr [0x168]
1:038B  ff36ec04          push     word ptr [0x4ec]
1:038F  ff36e804          push     word ptr [0x4e8]
1:0393  50                push     ax
1:0394  50                push     ax
1:0395  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_5(1:12EE)
1:039A  83c412            add      sp, 0x12
1:039D  837efc00          cmp      word ptr [bp - 4], 0
1:03A1  7f03              jg       0x3a6
1:03A3  e96800            jmp      0x40e
1:03A6  b80c05            mov      ax, 0x50c
1:03A9  1e                push     ds
1:03AA  50                push     ax
1:03AB  ff76f4            push     word ptr [bp - 0xc]
1:03AE  ff76fa            push     word ptr [bp - 6]
1:03B1  ff36ae07          push     word ptr [0x7ae]
1:03B5  a12e09            mov      ax, word ptr [0x92e]
1:03B8  0346fa            add      ax, word ptr [bp - 6]
1:03BB  50                push     ax
1:03BC  9ae1030000        lcall    0, 0x3e1  ; @1:USER.SetRect
1:03C1  837ef800          cmp      word ptr [bp - 8], 0
1:03C5  7f03              jg       0x3ca
1:03C7  e91e00            jmp      0x3e8
1:03CA  b8d804            mov      ax, 0x4d8
1:03CD  1e                push     ds
1:03CE  50                push     ax
1:03CF  ff76f4            push     word ptr [bp - 0xc]
1:03D2  ff76fa            push     word ptr [bp - 6]
1:03D5  a12c09            mov      ax, word ptr [0x92c]
1:03D8  0346f4            add      ax, word ptr [bp - 0xc]
1:03DB  50                push     ax
1:03DC  ff36b007          push     word ptr [0x7b0]
1:03E0  9a07040000        lcall    0, 0x407  ; @1:USER.SetRect
1:03E5  e92300            jmp      0x40b
1:03E8  b8d804            mov      ax, 0x4d8
1:03EB  1e                push     ds
1:03EC  50                push     ax
1:03ED  ff76f4            push     word ptr [bp - 0xc]
1:03F0  a12e09            mov      ax, word ptr [0x92e]
1:03F3  0306b007          add      ax, word ptr [0x7b0]
1:03F7  50                push     ax
1:03F8  a12c09            mov      ax, word ptr [0x92c]
1:03FB  0346f4            add      ax, word ptr [bp - 0xc]
1:03FE  50                push     ax
1:03FF  a12e09            mov      ax, word ptr [0x92e]
1:0402  0346fa            add      ax, word ptr [bp - 6]
1:0405  50                push     ax
1:0406  9a2d040000        lcall    0, 0x42d  ; @1:USER.SetRect
1:040B  e96d00            jmp      0x47b
1:040E  b80c05            mov      ax, 0x50c
1:0411  1e                push     ds
1:0412  50                push     ax
1:0413  a12c09            mov      ax, word ptr [0x92c]
1:0416  0306ae07          add      ax, word ptr [0x7ae]
1:041A  50                push     ax
1:041B  ff76fa            push     word ptr [bp - 6]
1:041E  a12c09            mov      ax, word ptr [0x92c]
1:0421  0346f4            add      ax, word ptr [bp - 0xc]
1:0424  50                push     ax
1:0425  a12e09            mov      ax, word ptr [0x92e]
1:0428  0346fa            add      ax, word ptr [bp - 6]
1:042B  50                push     ax
1:042C  9a51040000        lcall    0, 0x451  ; @1:USER.SetRect
1:0431  837ef800          cmp      word ptr [bp - 8], 0
1:0435  7f03              jg       0x43a
1:0437  e91e00            jmp      0x458
1:043A  b8d804            mov      ax, 0x4d8
1:043D  1e                push     ds
1:043E  50                push     ax
1:043F  ff76f4            push     word ptr [bp - 0xc]
1:0442  ff76fa            push     word ptr [bp - 6]
1:0445  a12c09            mov      ax, word ptr [0x92c]
1:0448  0346f4            add      ax, word ptr [bp - 0xc]
1:044B  50                push     ax
1:044C  ff36b007          push     word ptr [0x7b0]
1:0450  9a77040000        lcall    0, 0x477  ; @1:USER.SetRect
1:0455  e92300            jmp      0x47b
1:0458  b8d804            mov      ax, 0x4d8
1:045B  1e                push     ds
1:045C  50                push     ax
1:045D  ff76f4            push     word ptr [bp - 0xc]
1:0460  a12e09            mov      ax, word ptr [0x92e]
1:0463  0306b007          add      ax, word ptr [0x7b0]
1:0467  50                push     ax
1:0468  a12c09            mov      ax, word ptr [0x92c]
1:046B  0346f4            add      ax, word ptr [bp - 0xc]
1:046E  50                push     ax
1:046F  a12e09            mov      ax, word ptr [0x92e]
1:0472  0346fa            add      ax, word ptr [bp - 6]
1:0475  50                push     ax
1:0476  9a6d020000        lcall    0, 0x26d  ; @1:USER.SetRect
1:047B  ff36a607          push     word ptr [0x7a6]
1:047F  b80c05            mov      ax, 0x50c
1:0482  1e                push     ds
1:0483  50                push     ax
1:0484  b80400            mov      ax, 4
1:0487  50                push     ax
1:0488  9aa1040000        lcall    0, 0x4a1  ; @1:GDI.GetStockObject
1:048D  50                push     ax
1:048E  9aa7040000        lcall    0, 0x4a7  ; @1:USER.FillRect
1:0493  ff36a607          push     word ptr [0x7a6]
1:0497  b8d804            mov      ax, 0x4d8
1:049A  1e                push     ds
1:049B  50                push     ax
1:049C  b80400            mov      ax, 4
1:049F  50                push     ax
1:04A0  9a7f020000        lcall    0, 0x27f  ; @1:GDI.GetStockObject
1:04A5  50                push     ax
1:04A6  9a85020000        lcall    0, 0x285  ; @1:USER.FillRect
1:04AB  b80000            mov      ax, 0
1:04AE  e90000            jmp      0x4b1
1:04B1  5e                pop      si
1:04B2  5f                pop      di
1:04B3  83ed02            sub      bp, 2
1:04B6  8be5              mov      sp, bp
1:04B8  1f                pop      ds
1:04B9  5d                pop      bp
1:04BA  4d                dec      bp
1:04BB  cb                retf     

; ===== EXPORT:ord_30(#30) =====
1:04BC  1e                push     ds
1:04BD  58                pop      ax
1:04BE  90                nop      
1:04BF  45                inc      bp
1:04C0  55                push     bp
1:04C1  8bec              mov      bp, sp
1:04C3  1e                push     ds
1:04C4  8ed8              mov      ds, ax
1:04C6  81ec0000          sub      sp, 0
1:04CA  57                push     di
1:04CB  56                push     si
1:04CC  9a8d060000        lcall    0, 0x68d  ; @1:INT:ord_12(1:0837)
1:04D1  b80000            mov      ax, 0
1:04D4  e90000            jmp      0x4d7
1:04D7  5e                pop      si
1:04D8  5f                pop      di
1:04D9  83ed02            sub      bp, 2
1:04DC  8be5              mov      sp, bp
1:04DE  1f                pop      ds
1:04DF  5d                pop      bp
1:04E0  4d                dec      bp
1:04E1  cb                retf     

; ===== EXPORT:ord_29(#29) =====
1:04E2  1e                push     ds
1:04E3  58                pop      ax
1:04E4  90                nop      
1:04E5  45                inc      bp
1:04E6  55                push     bp
1:04E7  8bec              mov      bp, sp
1:04E9  1e                push     ds
1:04EA  8ed8              mov      ds, ax
1:04EC  81ec0000          sub      sp, 0
1:04F0  57                push     di
1:04F1  56                push     si
1:04F2  b80000            mov      ax, 0
1:04F5  e90000            jmp      0x4f8
1:04F8  5e                pop      si
1:04F9  5f                pop      di
1:04FA  83ed02            sub      bp, 2
1:04FD  8be5              mov      sp, bp
1:04FF  1f                pop      ds
1:0500  5d                pop      bp
1:0501  4d                dec      bp
1:0502  cb                retf     

; ===== EXPORT:ord_28(#28) =====
1:0503  1e                push     ds
1:0504  58                pop      ax
1:0505  90                nop      
1:0506  45                inc      bp
1:0507  55                push     bp
1:0508  8bec              mov      bp, sp
1:050A  1e                push     ds
1:050B  8ed8              mov      ds, ax
1:050D  81ec0000          sub      sp, 0
1:0511  57                push     di
1:0512  56                push     si
1:0513  b80000            mov      ax, 0
1:0516  e90000            jmp      0x519
1:0519  5e                pop      si
1:051A  5f                pop      di
1:051B  83ed02            sub      bp, 2
1:051E  8be5              mov      sp, bp
1:0520  1f                pop      ds
1:0521  5d                pop      bp
1:0522  4d                dec      bp
1:0523  cb                retf     

; ===== EXPORT:ord_27(#27) =====
1:0524  1e                push     ds
1:0525  58                pop      ax
1:0526  90                nop      
1:0527  45                inc      bp
1:0528  55                push     bp
1:0529  8bec              mov      bp, sp
1:052B  1e                push     ds
1:052C  8ed8              mov      ds, ax
1:052E  81ec0000          sub      sp, 0
1:0532  57                push     di
1:0533  56                push     si
1:0534  8b4606            mov      ax, word ptr [bp + 6]
1:0537  e9e700            jmp      0x621
1:053A  c41eaa07          les      bx, ptr [0x7aa]
1:053E  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:0543  7503              jne      0x548
1:0545  e90300            jmp      0x54b
1:0548  e9e700            jmp      0x632
1:054B  c706b207d007      mov      word ptr [0x7b2], 0x7d0
1:0551  c41e2609          les      bx, ptr [0x926]
1:0555  268b4706          mov      ax, word ptr es:[bx + 6]
1:0559  e94e00            jmp      0x5aa
1:055C  c706a8070100      mov      word ptr [0x7a8], 1
1:0562  c7062409bc02      mov      word ptr [0x924], 0x2bc
1:0568  e97900            jmp      0x5e4
1:056B  c706a8070100      mov      word ptr [0x7a8], 1
1:0571  c70624096400      mov      word ptr [0x924], 0x64
1:0577  e96a00            jmp      0x5e4
1:057A  c706a8070100      mov      word ptr [0x7a8], 1
1:0580  c70624090100      mov      word ptr [0x924], 1
1:0586  e95b00            jmp      0x5e4
1:0589  c706a8070200      mov      word ptr [0x7a8], 2
1:058F  c70624090100      mov      word ptr [0x924], 1
1:0595  e94c00            jmp      0x5e4
1:0598  c706a8070300      mov      word ptr [0x7a8], 3
1:059E  c70624090100      mov      word ptr [0x924], 1
1:05A4  e93d00            jmp      0x5e4
1:05A7  e93a00            jmp      0x5e4
1:05AA  3d2800            cmp      ax, 0x28
1:05AD  7503              jne      0x5b2
1:05AF  e9c8ff            jmp      0x57a
1:05B2  7e03              jle      0x5b7
1:05B4  e91200            jmp      0x5c9
1:05B7  0bc0              or       ax, ax
1:05B9  7503              jne      0x5be
1:05BB  e99eff            jmp      0x55c
1:05BE  2d1400            sub      ax, 0x14
1:05C1  7503              jne      0x5c6
1:05C3  e9a5ff            jmp      0x56b
1:05C6  e91b00            jmp      0x5e4
1:05C9  2d3c00            sub      ax, 0x3c
1:05CC  7503              jne      0x5d1
1:05CE  e9b8ff            jmp      0x589
1:05D1  2d1400            sub      ax, 0x14
1:05D4  7503              jne      0x5d9
1:05D6  e9bfff            jmp      0x598
1:05D9  2d1400            sub      ax, 0x14
1:05DC  7503              jne      0x5e1
1:05DE  e9b7ff            jmp      0x598
1:05E1  e90000            jmp      0x5e4
1:05E4  c41eaa07          les      bx, ptr [0x7aa]
1:05E8  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:05ED  7403              je       0x5f2
1:05EF  e90300            jmp      0x5f5
1:05F2  e93d00            jmp      0x632
1:05F5  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_13(1:14F9)
1:05FA  3d0000            cmp      ax, 0
1:05FD  7503              jne      0x602
1:05FF  e91900            jmp      0x61b
1:0602  b89401            mov      ax, 0x194
1:0605  1e                push     ds
1:0606  50                push     ax
1:0607  b88b01            mov      ax, 0x18b
1:060A  1e                push     ds
1:060B  50                push     ax
1:060C  b8bc07            mov      ax, 0x7bc
1:060F  1e                push     ds
1:0610  50                push     ax
1:0611  b87e01            mov      ax, 0x17e
1:0614  1e                push     ds
1:0615  50                push     ax
1:0616  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.WritePrivateProfileString
1:061B  e91400            jmp      0x632
1:061E  e91100            jmp      0x632
1:0621  0bc0              or       ax, ax
1:0623  7503              jne      0x628
1:0625  e912ff            jmp      0x53a
1:0628  48                dec      ax
1:0629  48                dec      ax
1:062A  7503              jne      0x62f
1:062C  e9b5ff            jmp      0x5e4
1:062F  e90000            jmp      0x632
1:0632  b80000            mov      ax, 0
1:0635  e90000            jmp      0x638
1:0638  5e                pop      si
1:0639  5f                pop      di
1:063A  83ed02            sub      bp, 2
1:063D  8be5              mov      sp, bp
1:063F  1f                pop      ds
1:0640  5d                pop      bp
1:0641  4d                dec      bp
1:0642  cb                retf     
1:0643  1e                push     ds
1:0644  58                pop      ax
1:0645  90                nop      
1:0646  45                inc      bp
1:0647  55                push     bp
1:0648  8bec              mov      bp, sp
1:064A  1e                push     ds
1:064B  8ed8              mov      ds, ax
1:064D  81ec0000          sub      sp, 0
1:0651  57                push     di
1:0652  56                push     si
1:0653  ff367801          push     word ptr [0x178]
1:0657  9a15000000        lcall    0, 0x15  ; @1:USER.IsWindow
1:065C  3d0000            cmp      ax, 0
1:065F  7503              jne      0x664
1:0661  e90d00            jmp      0x671
1:0664  ff367801          push     word ptr [0x178]
1:0668  b80000            mov      ax, 0
1:066B  50                push     ax
1:066C  9a2a000000        lcall    0, 0x2a  ; @1:USER.EndDialog
1:0671  5e                pop      si
1:0672  5f                pop      di
1:0673  83ed02            sub      bp, 2
1:0676  8be5              mov      sp, bp
1:0678  1f                pop      ds
1:0679  5d                pop      bp
1:067A  4d                dec      bp
1:067B  cb                retf     

; ===== EXPORT:ord_8(#8) =====
1:067C  1e                push     ds
1:067D  58                pop      ax
1:067E  90                nop      
1:067F  45                inc      bp
1:0680  55                push     bp
1:0681  8bec              mov      bp, sp
1:0683  1e                push     ds
1:0684  8ed8              mov      ds, ax
1:0686  81ec0600          sub      sp, 6
1:068A  57                push     di
1:068B  56                push     si
1:068C  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:0837)
1:0691  b80801            mov      ax, 0x108
1:0694  1e                push     ds
1:0695  50                push     ax
1:0696  b81405            mov      ax, 0x514
1:0699  1e                push     ds
1:069A  50                push     ax
1:069B  b80000            mov      ax, 0
1:069E  50                push     ax
1:069F  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.OpenFile
1:06A4  8946fa            mov      word ptr [bp - 6], ax
1:06A7  837efaff          cmp      word ptr [bp - 6], -1
1:06AB  7403              je       0x6b0
1:06AD  e90600            jmp      0x6b6
1:06B0  b80100            mov      ax, 1
1:06B3  e97601            jmp      0x82c
1:06B6  ff76fa            push     word ptr [bp - 6]
1:06B9  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:0D92)
1:06BE  83c402            add      sp, 2
1:06C1  a36c01            mov      word ptr [0x16c], ax
1:06C4  ff76fa            push     word ptr [bp - 6]
1:06C7  2bc0              sub      ax, ax
1:06C9  50                push     ax
1:06CA  50                push     ax
1:06CB  b80100            mov      ax, 1
1:06CE  50                push     ax
1:06CF  9affff0000        lcall    0, 0xffff  ; @1:KERNEL._llseek
1:06D4  a3a207            mov      word ptr [0x7a2], ax
1:06D7  8916a407          mov      word ptr [0x7a4], dx
1:06DB  ff76fa            push     word ptr [bp - 6]
1:06DE  9affff0000        lcall    0, 0xffff  ; @1:KERNEL._lclose
1:06E3  833e6c0100        cmp      word ptr [0x16c], 0
1:06E8  7403              je       0x6ed
1:06EA  e90600            jmp      0x6f3
1:06ED  b80200            mov      ax, 2
1:06F0  e93901            jmp      0x82c
1:06F3  b8a405            mov      ax, 0x5a4
1:06F6  1e                push     ds
1:06F7  50                push     ax
1:06F8  ff366c01          push     word ptr [0x16c]
1:06FC  9a73030000        lcall    0, 0x373  ; @1:INT:ord_6(1:0A1D)
1:0701  83c406            add      sp, 6
1:0704  ff366c01          push     word ptr [0x16c]
1:0708  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:0D45)
1:070D  83c402            add      sp, 2
1:0710  a36601            mov      word ptr [0x166], ax
1:0713  833e660100        cmp      word ptr [0x166], 0
1:0718  7403              je       0x71d
1:071A  e90600            jmp      0x723
1:071D  b80200            mov      ax, 2
1:0720  e90901            jmp      0x82c
1:0723  ff366c01          push     word ptr [0x16c]
1:0727  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalLock
1:072C  a3a005            mov      word ptr [0x5a0], ax
1:072F  8916a205          mov      word ptr [0x5a2], dx
1:0733  c41ea005          les      bx, ptr [0x5a0]
1:0737  26837f0e18        cmp      word ptr es:[bx + 0xe], 0x18
1:073C  7503              jne      0x741
1:073E  e94900            jmp      0x78a
1:0741  c70664010100      mov      word ptr [0x164], 1
1:0747  c41ea005          les      bx, ptr [0x5a0]
1:074B  268b07            mov      ax, word ptr es:[bx]
1:074E  0306a005          add      ax, word ptr [0x5a0]
1:0752  8b16a205          mov      dx, word ptr [0x5a2]
1:0756  a39c05            mov      word ptr [0x59c], ax
1:0759  89169e05          mov      word ptr [0x59e], dx
1:075D  c746fc0000        mov      word ptr [bp - 4], 0
1:0762  e90300            jmp      0x768
1:0765  ff46fc            inc      word ptr [bp - 4]
1:0768  8b46fc            mov      ax, word ptr [bp - 4]
1:076B  c41ea005          les      bx, ptr [0x5a0]
1:076F  26394720          cmp      word ptr es:[bx + 0x20], ax
1:0773  7f03              jg       0x778
1:0775  e91200            jmp      0x78a
1:0778  8b46fc            mov      ax, word ptr [bp - 4]
1:077B  c41e9c05          les      bx, ptr [0x59c]
1:077F  268907            mov      word ptr es:[bx], ax
1:0782  83069c0502        add      word ptr [0x59c], 2
1:0787  e9dbff            jmp      0x765
1:078A  ff366c01          push     word ptr [0x16c]
1:078E  9a000a0000        lcall    0, 0xa00  ; @1:KERNEL.GlobalUnlock
1:0793  c70676010100      mov      word ptr [0x176], 1
1:0799  833e6e0100        cmp      word ptr [0x16e], 0
1:079E  7403              je       0x7a3
1:07A0  e90c00            jmp      0x7af
1:07A3  a1b605            mov      ax, word ptr [0x5b6]
1:07A6  0b06b405          or       ax, word ptr [0x5b4]
1:07AA  7503              jne      0x7af
1:07AC  e91000            jmp      0x7bf
1:07AF  b80801            mov      ax, 0x108
1:07B2  1e                push     ds
1:07B3  50                push     ax
1:07B4  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_19(1:08E6)
1:07B9  83c404            add      sp, 4
1:07BC  a36801            mov      word ptr [0x168], ax
1:07BF  a1b605            mov      ax, word ptr [0x5b6]
1:07C2  0b06b405          or       ax, word ptr [0x5b4]
1:07C6  7403              je       0x7cb
1:07C8  e90a00            jmp      0x7d5
1:07CB  833e680100        cmp      word ptr [0x168], 0
1:07D0  7403              je       0x7d5
1:07D2  e90b00            jmp      0x7e0
1:07D5  9a1c080000        lcall    0, 0x81c  ; @1:INT:ord_12(1:0837)
1:07DA  b80200            mov      ax, 2
1:07DD  e94c00            jmp      0x82c
1:07E0  833e680100        cmp      word ptr [0x168], 0
1:07E5  7503              jne      0x7ea
1:07E7  e93c00            jmp      0x826
1:07EA  833e720100        cmp      word ptr [0x172], 0
1:07EF  7403              je       0x7f4
1:07F1  e93200            jmp      0x826
1:07F4  833e6e0100        cmp      word ptr [0x16e], 0
1:07F9  7503              jne      0x7fe
1:07FB  e92800            jmp      0x826
1:07FE  ff366601          push     word ptr [0x166]
1:0802  ff366801          push     word ptr [0x168]
1:0806  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_18(1:1205)
1:080B  83c404            add      sp, 4
1:080E  a36a01            mov      word ptr [0x16a], ax
1:0811  833e6a0100        cmp      word ptr [0x16a], 0
1:0816  7403              je       0x81b
1:0818  e90b00            jmp      0x826
1:081B  9acd040000        lcall    0, 0x4cd  ; @1:INT:ord_12(1:0837)
1:0820  b80200            mov      ax, 2
1:0823  e90600            jmp      0x82c
1:0826  b80000            mov      ax, 0
1:0829  e90000            jmp      0x82c
1:082C  5e                pop      si
1:082D  5f                pop      di
1:082E  83ed02            sub      bp, 2
1:0831  8be5              mov      sp, bp
1:0833  1f                pop      ds
1:0834  5d                pop      bp
1:0835  4d                dec      bp
1:0836  cb                retf     

; ===== EXPORT:ord_12(#12) =====
1:0837  1e                push     ds
1:0838  58                pop      ax
1:0839  90                nop      
1:083A  45                inc      bp
1:083B  55                push     bp
1:083C  8bec              mov      bp, sp
1:083E  1e                push     ds
1:083F  8ed8              mov      ds, ax
1:0841  81ec0000          sub      sp, 0
1:0845  57                push     di
1:0846  56                push     si
1:0847  833e660100        cmp      word ptr [0x166], 0
1:084C  7503              jne      0x851
1:084E  e90f00            jmp      0x860
1:0851  ff366601          push     word ptr [0x166]
1:0855  9a6f080000        lcall    0, 0x86f  ; @1:GDI.DeleteObject
1:085A  c70666010000      mov      word ptr [0x166], 0
1:0860  833e6a0100        cmp      word ptr [0x16a], 0
1:0865  7503              jne      0x86a
1:0867  e90f00            jmp      0x879
1:086A  ff366a01          push     word ptr [0x16a]
1:086E  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteObject
1:0873  c7066a010000      mov      word ptr [0x16a], 0
1:0879  833e680100        cmp      word ptr [0x168], 0
1:087E  7503              jne      0x883
1:0880  e90f00            jmp      0x892
1:0883  ff366801          push     word ptr [0x168]
1:0887  9aad080000        lcall    0, 0x8ad  ; @1:KERNEL.GlobalFree
1:088C  c70668010000      mov      word ptr [0x168], 0
1:0892  833e6c0100        cmp      word ptr [0x16c], 0
1:0897  7503              jne      0x89c
1:0899  e91b00            jmp      0x8b7
1:089C  a16801            mov      ax, word ptr [0x168]
1:089F  39066c01          cmp      word ptr [0x16c], ax
1:08A3  7503              jne      0x8a8
1:08A5  e90f00            jmp      0x8b7
1:08A8  ff366c01          push     word ptr [0x16c]
1:08AC  9aa3090000        lcall    0, 0x9a3  ; @1:KERNEL.GlobalFree
1:08B1  c7066c010000      mov      word ptr [0x16c], 0
1:08B7  c70664010000      mov      word ptr [0x164], 0
1:08BD  c70676010000      mov      word ptr [0x176], 0
1:08C3  c70666010000      mov      word ptr [0x166], 0
1:08C9  c70668010000      mov      word ptr [0x168], 0
1:08CF  c7066a010000      mov      word ptr [0x16a], 0
1:08D5  c7066c010000      mov      word ptr [0x16c], 0
1:08DB  5e                pop      si
1:08DC  5f                pop      di
1:08DD  83ed02            sub      bp, 2
1:08E0  8be5              mov      sp, bp
1:08E2  1f                pop      ds
1:08E3  5d                pop      bp
1:08E4  4d                dec      bp
1:08E5  cb                retf     

; ===== EXPORT:ord_19(#19) =====
1:08E6  1e                push     ds
1:08E7  58                pop      ax
1:08E8  90                nop      
1:08E9  45                inc      bp
1:08EA  55                push     bp
1:08EB  8bec              mov      bp, sp
1:08ED  1e                push     ds
1:08EE  8ed8              mov      ds, ax
1:08F0  81ec1000          sub      sp, 0x10
1:08F4  57                push     di
1:08F5  56                push     si
1:08F6  2bc0              sub      ax, ax
1:08F8  8946f8            mov      word ptr [bp - 8], ax
1:08FB  8946f6            mov      word ptr [bp - 0xa], ax
1:08FE  ff7608            push     word ptr [bp + 8]
1:0901  ff7606            push     word ptr [bp + 6]
1:0904  b8cc05            mov      ax, 0x5cc
1:0907  1e                push     ds
1:0908  50                push     ax
1:0909  b80000            mov      ax, 0
1:090C  50                push     ax
1:090D  9aa0060000        lcall    0, 0x6a0  ; @1:KERNEL.OpenFile
1:0912  8946f0            mov      word ptr [bp - 0x10], ax
1:0915  837ef0ff          cmp      word ptr [bp - 0x10], -1
1:0919  7403              je       0x91e
1:091B  e90600            jmp      0x924
1:091E  b80000            mov      ax, 0
1:0921  e9ee00            jmp      0xa12
1:0924  ff76f0            push     word ptr [bp - 0x10]
1:0927  9aba060000        lcall    0, 0x6ba  ; @1:INT:ord_11(1:0D92)
1:092C  83c402            add      sp, 2
1:092F  8946fc            mov      word ptr [bp - 4], ax
1:0932  837efc00          cmp      word ptr [bp - 4], 0
1:0936  7403              je       0x93b
1:0938  e90600            jmp      0x941
1:093B  b80000            mov      ax, 0
1:093E  e9d100            jmp      0xa12
1:0941  b85806            mov      ax, 0x658
1:0944  1e                push     ds
1:0945  50                push     ax
1:0946  ff76fc            push     word ptr [bp - 4]
1:0949  9afd060000        lcall    0, 0x6fd  ; @1:INT:ord_6(1:0A1D)
1:094E  83c406            add      sp, 6
1:0951  a16c06            mov      ax, word ptr [0x66c]
1:0954  8b166e06          mov      dx, word ptr [0x66e]
1:0958  8946f2            mov      word ptr [bp - 0xe], ax
1:095B  8956f4            mov      word ptr [bp - 0xc], dx
1:095E  b85806            mov      ax, 0x658
1:0961  1e                push     ds
1:0962  50                push     ax
1:0963  9ad9090000        lcall    0, 0x9d9  ; @1:INT:ord_17(1:10EA)
1:0968  83c404            add      sp, 4
1:096B  2bd2              sub      dx, dx
1:096D  0346f2            add      ax, word ptr [bp - 0xe]
1:0970  1356f4            adc      dx, word ptr [bp - 0xc]
1:0973  03065806          add      ax, word ptr [0x658]
1:0977  13165a06          adc      dx, word ptr [0x65a]
1:097B  8946f6            mov      word ptr [bp - 0xa], ax
1:097E  8956f8            mov      word ptr [bp - 8], dx
1:0981  ff76fc            push     word ptr [bp - 4]
1:0984  ff76f8            push     word ptr [bp - 8]
1:0987  ff76f6            push     word ptr [bp - 0xa]
1:098A  b84200            mov      ax, 0x42
1:098D  50                push     ax
1:098E  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalReAlloc
1:0993  8946fa            mov      word ptr [bp - 6], ax
1:0996  837efa00          cmp      word ptr [bp - 6], 0
1:099A  7403              je       0x99f
1:099C  e91000            jmp      0x9af
1:099F  ff76fc            push     word ptr [bp - 4]
1:09A2  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalFree
1:09A7  c746fc0000        mov      word ptr [bp - 4], 0
1:09AC  e90600            jmp      0x9b5
1:09AF  8b46fa            mov      ax, word ptr [bp - 6]
1:09B2  8946fc            mov      word ptr [bp - 4], ax
1:09B5  837efc00          cmp      word ptr [bp - 4], 0
1:09B9  7503              jne      0x9be
1:09BB  e94600            jmp      0xa04
1:09BE  ff76fc            push     word ptr [bp - 4]
1:09C1  9a3a0a0000        lcall    0, 0xa3a  ; @1:KERNEL.GlobalLock
1:09C6  a35406            mov      word ptr [0x654], ax
1:09C9  89165606          mov      word ptr [0x656], dx
1:09CD  ff76f0            push     word ptr [bp - 0x10]
1:09D0  ff365606          push     word ptr [0x656]
1:09D4  ff365406          push     word ptr [0x654]
1:09D8  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_17(1:10EA)
1:09DD  83c404            add      sp, 4
1:09E0  c41e5406          les      bx, ptr [0x654]
1:09E4  260307            add      ax, word ptr es:[bx]
1:09E7  03065406          add      ax, word ptr [0x654]
1:09EB  8b165606          mov      dx, word ptr [0x656]
1:09EF  52                push     dx
1:09F0  50                push     ax
1:09F1  ff76f4            push     word ptr [bp - 0xc]
1:09F4  ff76f2            push     word ptr [bp - 0xe]
1:09F7  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_16(1:13AE)
1:09FC  ff76fc            push     word ptr [bp - 4]
1:09FF  9af10a0000        lcall    0, 0xaf1  ; @1:KERNEL.GlobalUnlock
1:0A04  ff76f0            push     word ptr [bp - 0x10]
1:0A07  9adf060000        lcall    0, 0x6df  ; @1:KERNEL._lclose
1:0A0C  8b46fc            mov      ax, word ptr [bp - 4]
1:0A0F  e90000            jmp      0xa12
1:0A12  5e                pop      si
1:0A13  5f                pop      di
1:0A14  83ed02            sub      bp, 2
1:0A17  8be5              mov      sp, bp
1:0A19  1f                pop      ds
1:0A1A  5d                pop      bp
1:0A1B  4d                dec      bp
1:0A1C  cb                retf     

; ===== EXPORT:ord_6(#6) =====
1:0A1D  1e                push     ds
1:0A1E  58                pop      ax
1:0A1F  90                nop      
1:0A20  45                inc      bp
1:0A21  55                push     bp
1:0A22  8bec              mov      bp, sp
1:0A24  1e                push     ds
1:0A25  8ed8              mov      ds, ax
1:0A27  81ec0000          sub      sp, 0
1:0A2B  57                push     di
1:0A2C  56                push     si
1:0A2D  837e0600          cmp      word ptr [bp + 6], 0
1:0A31  7503              jne      0xa36
1:0A33  e9c500            jmp      0xafb
1:0A36  ff7606            push     word ptr [bp + 6]
1:0A39  9a28070000        lcall    0, 0x728  ; @1:KERNEL.GlobalLock
1:0A3E  1e                push     ds
1:0A3F  8bf0              mov      si, ax
1:0A41  8eda              mov      ds, dx
1:0A43  c47e08            les      di, ptr [bp + 8]
1:0A46  b91400            mov      cx, 0x14
1:0A49  f3a5              rep movsw word ptr es:[di], word ptr [si]
1:0A4B  1f                pop      ds
1:0A4C  c45e08            les      bx, ptr [bp + 8]
1:0A4F  26833f0c          cmp      word ptr es:[bx], 0xc
1:0A53  7403              je       0xa58
1:0A55  e90a00            jmp      0xa62
1:0A58  26837f0200        cmp      word ptr es:[bx + 2], 0
1:0A5D  7503              jne      0xa62
1:0A5F  e98b00            jmp      0xaed
1:0A62  c45e08            les      bx, ptr [bp + 8]
1:0A65  268b4716          mov      ax, word ptr es:[bx + 0x16]
1:0A69  260b4714          or       ax, word ptr es:[bx + 0x14]
1:0A6D  7403              je       0xa72
1:0A6F  e95000            jmp      0xac2
1:0A72  c45e08            les      bx, ptr [bp + 8]
1:0A75  26ff770a          push     word ptr es:[bx + 0xa]
1:0A79  26ff7708          push     word ptr es:[bx + 8]
1:0A7D  c45e08            les      bx, ptr [bp + 8]
1:0A80  26ff7706          push     word ptr es:[bx + 6]
1:0A84  26ff7704          push     word ptr es:[bx + 4]
1:0A88  c45e08            les      bx, ptr [bp + 8]
1:0A8B  268b470e          mov      ax, word ptr es:[bx + 0xe]
1:0A8F  2bd2              sub      dx, dx
1:0A91  52                push     dx
1:0A92  50                push     ax
1:0A93  9ab30a0000        lcall    0, 0xab3  ; @1:INT:ord_15(1:1E32)
1:0A98  051f00            add      ax, 0x1f
1:0A9B  83d200            adc      dx, 0
1:0A9E  25e7ff            and      ax, 0xffe7
1:0AA1  83e2ff            and      dx, 0xffff
1:0AA4  d1ea              shr      dx, 1
1:0AA6  d1d8              rcr      ax, 1
1:0AA8  d1ea              shr      dx, 1
1:0AAA  d1d8              rcr      ax, 1
1:0AAC  d1ea              shr      dx, 1
1:0AAE  d1d8              rcr      ax, 1
1:0AB0  52                push     dx
1:0AB1  50                push     ax
1:0AB2  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_15(1:1E32)
1:0AB7  c45e08            les      bx, ptr [bp + 8]
1:0ABA  26894714          mov      word ptr es:[bx + 0x14], ax
1:0ABE  26895716          mov      word ptr es:[bx + 0x16], dx
1:0AC2  c45e08            les      bx, ptr [bp + 8]
1:0AC5  268b4722          mov      ax, word ptr es:[bx + 0x22]
1:0AC9  260b4720          or       ax, word ptr es:[bx + 0x20]
1:0ACD  7403              je       0xad2
1:0ACF  e91b00            jmp      0xaed
1:0AD2  ff760a            push     word ptr [bp + 0xa]
1:0AD5  ff7608            push     word ptr [bp + 8]
1:0AD8  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_14(1:1151)
1:0ADD  83c404            add      sp, 4
1:0AE0  c45e08            les      bx, ptr [bp + 8]
1:0AE3  26894720          mov      word ptr es:[bx + 0x20], ax
1:0AE7  26c747220000      mov      word ptr es:[bx + 0x22], 0
1:0AED  ff7606            push     word ptr [bp + 6]
1:0AF0  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalUnlock
1:0AF5  b80100            mov      ax, 1
1:0AF8  e90600            jmp      0xb01
1:0AFB  b80000            mov      ax, 0
1:0AFE  e90000            jmp      0xb01
1:0B01  5e                pop      si
1:0B02  5f                pop      di
1:0B03  83ed02            sub      bp, 2
1:0B06  8be5              mov      sp, bp
1:0B08  1f                pop      ds
1:0B09  5d                pop      bp
1:0B0A  4d                dec      bp
1:0B0B  cb                retf     

; ===== EXPORT:ord_20(#20) =====
1:0B0C  1e                push     ds
1:0B0D  58                pop      ax
1:0B0E  90                nop      
1:0B0F  45                inc      bp
1:0B10  55                push     bp
1:0B11  8bec              mov      bp, sp
1:0B13  1e                push     ds
1:0B14  8ed8              mov      ds, ax
1:0B16  81ec0e00          sub      sp, 0xe
1:0B1A  57                push     di
1:0B1B  56                push     si
1:0B1C  c746f80000        mov      word ptr [bp - 8], 0
1:0B21  8b4608            mov      ax, word ptr [bp + 8]
1:0B24  0b4606            or       ax, word ptr [bp + 6]
1:0B27  7403              je       0xb2c
1:0B29  e90600            jmp      0xb32
1:0B2C  b80000            mov      ax, 0
1:0B2F  e90802            jmp      0xd3a
1:0B32  c45e06            les      bx, ptr [bp + 6]
1:0B35  26833f28          cmp      word ptr es:[bx], 0x28
1:0B39  7403              je       0xb3e
1:0B3B  e90a00            jmp      0xb48
1:0B3E  26837f0200        cmp      word ptr es:[bx + 2], 0
1:0B43  7503              jne      0xb48
1:0B45  e90600            jmp      0xb4e
1:0B48  b80000            mov      ax, 0
1:0B4B  e9ec01            jmp      0xd3a
1:0B4E  c45e06            les      bx, ptr [bp + 6]
1:0B51  268b07            mov      ax, word ptr es:[bx]
1:0B54  034606            add      ax, word ptr [bp + 6]
1:0B57  8b5608            mov      dx, word ptr [bp + 8]
1:0B5A  a38006            mov      word ptr [0x680], ax
1:0B5D  89168206          mov      word ptr [0x682], dx
1:0B61  ff7608            push     word ptr [bp + 8]
1:0B64  ff7606            push     word ptr [bp + 6]
1:0B67  9a450e0000        lcall    0, 0xe45  ; @1:INT:ord_14(1:1151)
1:0B6C  83c404            add      sp, 4
1:0B6F  8946fc            mov      word ptr [bp - 4], ax
1:0B72  837efc00          cmp      word ptr [bp - 4], 0
1:0B76  7503              jne      0xb7b
1:0B78  e9d000            jmp      0xc4b
1:0B7B  b84000            mov      ax, 0x40
1:0B7E  50                push     ax
1:0B7F  8b46fc            mov      ax, word ptr [bp - 4]
1:0B82  050200            add      ax, 2
1:0B85  d1e0              shl      ax, 1
1:0B87  d1e0              shl      ax, 1
1:0B89  50                push     ax
1:0B8A  9a6d0c0000        lcall    0, 0xc6d  ; @1:KERNEL.LocalAlloc
1:0B8F  a38406            mov      word ptr [0x684], ax
1:0B92  833e840600        cmp      word ptr [0x684], 0
1:0B97  7403              je       0xb9c
1:0B99  e90600            jmp      0xba2
1:0B9C  b80000            mov      ax, 0
1:0B9F  e99801            jmp      0xd3a
1:0BA2  8b46fc            mov      ax, word ptr [bp - 4]
1:0BA5  8b1e8406          mov      bx, word ptr [0x684]
1:0BA9  894702            mov      word ptr [bx + 2], ax
1:0BAC  8b1e8406          mov      bx, word ptr [0x684]
1:0BB0  c7070003          mov      word ptr [bx], 0x300
1:0BB4  c746f40000        mov      word ptr [bp - 0xc], 0
1:0BB9  e90300            jmp      0xbbf
1:0BBC  ff46f4            inc      word ptr [bp - 0xc]
1:0BBF  8b46fc            mov      ax, word ptr [bp - 4]
1:0BC2  3946f4            cmp      word ptr [bp - 0xc], ax
1:0BC5  7203              jb       0xbca
1:0BC7  e96800            jmp      0xc32
1:0BCA  8b76f4            mov      si, word ptr [bp - 0xc]
1:0BCD  d1e6              shl      si, 1
1:0BCF  d1e6              shl      si, 1
1:0BD1  c41e8006          les      bx, ptr [0x680]
1:0BD5  268a4002          mov      al, byte ptr es:[bx + si + 2]
1:0BD9  8b76f4            mov      si, word ptr [bp - 0xc]
1:0BDC  d1e6              shl      si, 1
1:0BDE  d1e6              shl      si, 1
1:0BE0  8b1e8406          mov      bx, word ptr [0x684]
1:0BE4  884004            mov      byte ptr [bx + si + 4], al
1:0BE7  8b76f4            mov      si, word ptr [bp - 0xc]
1:0BEA  d1e6              shl      si, 1
1:0BEC  d1e6              shl      si, 1
1:0BEE  c41e8006          les      bx, ptr [0x680]
1:0BF2  268a4001          mov      al, byte ptr es:[bx + si + 1]
1:0BF6  8b76f4            mov      si, word ptr [bp - 0xc]
1:0BF9  d1e6              shl      si, 1
1:0BFB  d1e6              shl      si, 1
1:0BFD  8b1e8406          mov      bx, word ptr [0x684]
1:0C01  884005            mov      byte ptr [bx + si + 5], al
1:0C04  8b5ef4            mov      bx, word ptr [bp - 0xc]
1:0C07  d1e3              shl      bx, 1
1:0C09  d1e3              shl      bx, 1
1:0C0B  c4368006          les      si, ptr [0x680]
1:0C0F  268a00            mov      al, byte ptr es:[bx + si]
1:0C12  8b76f4            mov      si, word ptr [bp - 0xc]
1:0C15  d1e6              shl      si, 1
1:0C17  d1e6              shl      si, 1
1:0C19  8b1e8406          mov      bx, word ptr [0x684]
1:0C1D  884006            mov      byte ptr [bx + si + 6], al
1:0C20  8b76f4            mov      si, word ptr [bp - 0xc]
1:0C23  d1e6              shl      si, 1
1:0C25  d1e6              shl      si, 1
1:0C27  8b1e8406          mov      bx, word ptr [0x684]
1:0C2B  c6400700          mov      byte ptr [bx + si + 7], 0
1:0C2F  e98aff            jmp      0xbbc
1:0C32  1e                push     ds
1:0C33  ff368406          push     word ptr [0x684]
1:0C37  9a240d0000        lcall    0, 0xd24  ; @1:GDI.CreatePalette
1:0C3C  8946f8            mov      word ptr [bp - 8], ax
1:0C3F  ff368406          push     word ptr [0x684]
1:0C43  9a300d0000        lcall    0, 0xd30  ; @1:KERNEL.LocalFree
1:0C48  e9e900            jmp      0xd34
1:0C4B  c45e06            les      bx, ptr [bp + 6]
1:0C4E  26837f0e18        cmp      word ptr es:[bx + 0xe], 0x18
1:0C53  7403              je       0xc58
1:0C55  e9dc00            jmp      0xd34
1:0C58  c746fc0001        mov      word ptr [bp - 4], 0x100
1:0C5D  b84000            mov      ax, 0x40
1:0C60  50                push     ax
1:0C61  8b46fc            mov      ax, word ptr [bp - 4]
1:0C64  050200            add      ax, 2
1:0C67  d1e0              shl      ax, 1
1:0C69  d1e0              shl      ax, 1
1:0C6B  50                push     ax
1:0C6C  9aca000000        lcall    0, 0xca  ; @1:KERNEL.LocalAlloc
1:0C71  a38406            mov      word ptr [0x684], ax
1:0C74  833e840600        cmp      word ptr [0x684], 0
1:0C79  7403              je       0xc7e
1:0C7B  e90600            jmp      0xc84
1:0C7E  b80000            mov      ax, 0
1:0C81  e9b600            jmp      0xd3a
1:0C84  8b46fc            mov      ax, word ptr [bp - 4]
1:0C87  8b1e8406          mov      bx, word ptr [0x684]
1:0C8B  894702            mov      word ptr [bx + 2], ax
1:0C8E  8b1e8406          mov      bx, word ptr [0x684]
1:0C92  c7070003          mov      word ptr [bx], 0x300
1:0C96  b000              mov      al, 0
1:0C98  8846f6            mov      byte ptr [bp - 0xa], al
1:0C9B  8846fa            mov      byte ptr [bp - 6], al
1:0C9E  8846f2            mov      byte ptr [bp - 0xe], al
1:0CA1  c746f40000        mov      word ptr [bp - 0xc], 0
1:0CA6  e90300            jmp      0xcac
1:0CA9  ff46f4            inc      word ptr [bp - 0xc]
1:0CAC  8b46f4            mov      ax, word ptr [bp - 0xc]
1:0CAF  8b1e8406          mov      bx, word ptr [0x684]
1:0CB3  394702            cmp      word ptr [bx + 2], ax
1:0CB6  7703              ja       0xcbb
1:0CB8  e96300            jmp      0xd1e
1:0CBB  8a46f2            mov      al, byte ptr [bp - 0xe]
1:0CBE  8b76f4            mov      si, word ptr [bp - 0xc]
1:0CC1  d1e6              shl      si, 1
1:0CC3  d1e6              shl      si, 1
1:0CC5  8b1e8406          mov      bx, word ptr [0x684]
1:0CC9  884004            mov      byte ptr [bx + si + 4], al
1:0CCC  8a46fa            mov      al, byte ptr [bp - 6]
1:0CCF  8b76f4            mov      si, word ptr [bp - 0xc]
1:0CD2  d1e6              shl      si, 1
1:0CD4  d1e6              shl      si, 1
1:0CD6  8b1e8406          mov      bx, word ptr [0x684]
1:0CDA  884005            mov      byte ptr [bx + si + 5], al
1:0CDD  8a46f6            mov      al, byte ptr [bp - 0xa]
1:0CE0  8b76f4            mov      si, word ptr [bp - 0xc]
1:0CE3  d1e6              shl      si, 1
1:0CE5  d1e6              shl      si, 1
1:0CE7  8b1e8406          mov      bx, word ptr [0x684]
1:0CEB  884006            mov      byte ptr [bx + si + 6], al
1:0CEE  8b76f4            mov      si, word ptr [bp - 0xc]
1:0CF1  d1e6              shl      si, 1
1:0CF3  d1e6              shl      si, 1
1:0CF5  8b1e8406          mov      bx, word ptr [0x684]
1:0CF9  c6400700          mov      byte ptr [bx + si + 7], 0
1:0CFD  8046f220          add      byte ptr [bp - 0xe], 0x20
1:0D01  807ef200          cmp      byte ptr [bp - 0xe], 0
1:0D05  7403              je       0xd0a
1:0D07  e91100            jmp      0xd1b
1:0D0A  8046fa20          add      byte ptr [bp - 6], 0x20
1:0D0E  807efa00          cmp      byte ptr [bp - 6], 0
1:0D12  7403              je       0xd17
1:0D14  e90400            jmp      0xd1b
1:0D17  8046f640          add      byte ptr [bp - 0xa], 0x40
1:0D1B  e98bff            jmp      0xca9
1:0D1E  1e                push     ds
1:0D1F  ff368406          push     word ptr [0x684]
1:0D23  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreatePalette
1:0D28  8946f8            mov      word ptr [bp - 8], ax
1:0D2B  ff368406          push     word ptr [0x684]
1:0D2F  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LocalFree
1:0D34  8b46f8            mov      ax, word ptr [bp - 8]
1:0D37  e90000            jmp      0xd3a
1:0D3A  5e                pop      si
1:0D3B  5f                pop      di
1:0D3C  83ed02            sub      bp, 2
1:0D3F  8be5              mov      sp, bp
1:0D41  1f                pop      ds
1:0D42  5d                pop      bp
1:0D43  4d                dec      bp
1:0D44  cb                retf     

; ===== EXPORT:ord_10(#10) =====
1:0D45  1e                push     ds
1:0D46  58                pop      ax
1:0D47  90                nop      
1:0D48  45                inc      bp
1:0D49  55                push     bp
1:0D4A  8bec              mov      bp, sp
1:0D4C  1e                push     ds
1:0D4D  8ed8              mov      ds, ax
1:0D4F  81ec0400          sub      sp, 4
1:0D53  57                push     di
1:0D54  56                push     si
1:0D55  837e0600          cmp      word ptr [bp + 6], 0
1:0D59  7403              je       0xd5e
1:0D5B  e90600            jmp      0xd64
1:0D5E  b80000            mov      ax, 0
1:0D61  e92300            jmp      0xd87
1:0D64  ff7606            push     word ptr [bp + 6]
1:0D67  9ac2090000        lcall    0, 0x9c2  ; @1:KERNEL.GlobalLock
1:0D6C  52                push     dx
1:0D6D  50                push     ax
1:0D6E  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_20(1:0B0C)
1:0D73  83c404            add      sp, 4
1:0D76  8946fc            mov      word ptr [bp - 4], ax
1:0D79  ff7606            push     word ptr [bp + 6]
1:0D7C  9a8f070000        lcall    0, 0x78f  ; @1:KERNEL.GlobalUnlock
1:0D81  8b46fc            mov      ax, word ptr [bp - 4]
1:0D84  e90000            jmp      0xd87
1:0D87  5e                pop      si
1:0D88  5f                pop      di
1:0D89  83ed02            sub      bp, 2
1:0D8C  8be5              mov      sp, bp
1:0D8E  1f                pop      ds
1:0D8F  5d                pop      bp
1:0D90  4d                dec      bp
1:0D91  cb                retf     

; ===== EXPORT:ord_11(#11) =====
1:0D92  1e                push     ds
1:0D93  58                pop      ax
1:0D94  90                nop      
1:0D95  45                inc      bp
1:0D96  55                push     bp
1:0D97  8bec              mov      bp, sp
1:0D99  1e                push     ds
1:0D9A  8ed8              mov      ds, ax
1:0D9C  81ec2200          sub      sp, 0x22
1:0DA0  57                push     di
1:0DA1  56                push     si
1:0DA2  c746fa0000        mov      word ptr [bp - 6], 0
1:0DA7  2bc0              sub      ax, ax
1:0DA9  8946f0            mov      word ptr [bp - 0x10], ax
1:0DAC  8946ee            mov      word ptr [bp - 0x12], ax
1:0DAF  2bc0              sub      ax, ax
1:0DB1  8946f8            mov      word ptr [bp - 8], ax
1:0DB4  8946f6            mov      word ptr [bp - 0xa], ax
1:0DB7  837e06ff          cmp      word ptr [bp + 6], -1
1:0DBB  7403              je       0xdc0
1:0DBD  e90600            jmp      0xdc6
1:0DC0  b80000            mov      ax, 0
1:0DC3  e91903            jmp      0x10df
1:0DC6  ff7606            push     word ptr [bp + 6]
1:0DC9  2bc0              sub      ax, ax
1:0DCB  50                push     ax
1:0DCC  50                push     ax
1:0DCD  b80100            mov      ax, 1
1:0DD0  50                push     ax
1:0DD1  9a1c0e0000        lcall    0, 0xe1c  ; @1:KERNEL._llseek
1:0DD6  8946e4            mov      word ptr [bp - 0x1c], ax
1:0DD9  8956e6            mov      word ptr [bp - 0x1a], dx
1:0DDC  ff7606            push     word ptr [bp + 6]
1:0DDF  b89606            mov      ax, 0x696
1:0DE2  1e                push     ds
1:0DE3  50                push     ax
1:0DE4  b80e00            mov      ax, 0xe
1:0DE7  50                push     ax
1:0DE8  9a2d0e0000        lcall    0, 0xe2d  ; @1:KERNEL._lread
1:0DED  3d0e00            cmp      ax, 0xe
1:0DF0  7503              jne      0xdf5
1:0DF2  e90600            jmp      0xdfb
1:0DF5  b80000            mov      ax, 0
1:0DF8  e9e402            jmp      0x10df
1:0DFB  813e9606424d      cmp      word ptr [0x696], 0x4d42
1:0E01  7503              jne      0xe06
1:0E03  e91a00            jmp      0xe20
1:0E06  2bc0              sub      ax, ax
1:0E08  a3a206            mov      word ptr [0x6a2], ax
1:0E0B  a3a006            mov      word ptr [0x6a0], ax
1:0E0E  ff7606            push     word ptr [bp + 6]
1:0E11  ff76e6            push     word ptr [bp - 0x1a]
1:0E14  ff76e4            push     word ptr [bp - 0x1c]
1:0E17  b80000            mov      ax, 0
1:0E1A  50                push     ax
1:0E1B  9ad0060000        lcall    0, 0x6d0  ; @1:KERNEL._llseek
1:0E20  ff7606            push     word ptr [bp + 6]
1:0E23  b8a406            mov      ax, 0x6a4
1:0E26  1e                push     ds
1:0E27  50                push     ax
1:0E28  b82800            mov      ax, 0x28
1:0E2B  50                push     ax
1:0E2C  9affff0000        lcall    0, 0xffff  ; @1:KERNEL._lread
1:0E31  3d2800            cmp      ax, 0x28
1:0E34  7503              jne      0xe39
1:0E36  e90600            jmp      0xe3f
1:0E39  b80000            mov      ax, 0
1:0E3C  e9a002            jmp      0x10df
1:0E3F  b8a406            mov      ax, 0x6a4
1:0E42  1e                push     ds
1:0E43  50                push     ax
1:0E44  9ad90a0000        lcall    0, 0xad9  ; @1:INT:ord_14(1:1151)
1:0E49  83c404            add      sp, 4
1:0E4C  8946fc            mov      word ptr [bp - 4], ax
1:0E4F  a1a406            mov      ax, word ptr [0x6a4]
1:0E52  8946e8            mov      word ptr [bp - 0x18], ax
1:0E55  e9be00            jmp      0xf16
1:0E58  e9ce00            jmp      0xf29
1:0E5B  b88606            mov      ax, 0x686
1:0E5E  8bf8              mov      di, ax
1:0E60  bea406            mov      si, 0x6a4
1:0E63  1e                push     ds
1:0E64  07                pop      es
1:0E65  b90600            mov      cx, 6
1:0E68  f3a5              rep movsw word ptr es:[di], word ptr [si]
1:0E6A  a18a06            mov      ax, word ptr [0x68a]
1:0E6D  8946ee            mov      word ptr [bp - 0x12], ax
1:0E70  c746f00000        mov      word ptr [bp - 0x10], 0
1:0E75  a18c06            mov      ax, word ptr [0x68c]
1:0E78  8946f6            mov      word ptr [bp - 0xa], ax
1:0E7B  c746f80000        mov      word ptr [bp - 8], 0
1:0E80  a18e06            mov      ax, word ptr [0x68e]
1:0E83  8946f2            mov      word ptr [bp - 0xe], ax
1:0E86  a19006            mov      ax, word ptr [0x690]
1:0E89  8946e2            mov      word ptr [bp - 0x1e], ax
1:0E8C  c706a4062800      mov      word ptr [0x6a4], 0x28
1:0E92  c706a6060000      mov      word ptr [0x6a6], 0
1:0E98  8b46ee            mov      ax, word ptr [bp - 0x12]
1:0E9B  8b56f0            mov      dx, word ptr [bp - 0x10]
1:0E9E  a3a806            mov      word ptr [0x6a8], ax
1:0EA1  8916aa06          mov      word ptr [0x6aa], dx
1:0EA5  8b46f6            mov      ax, word ptr [bp - 0xa]
1:0EA8  8b56f8            mov      dx, word ptr [bp - 8]
1:0EAB  a3ac06            mov      word ptr [0x6ac], ax
1:0EAE  8916ae06          mov      word ptr [0x6ae], dx
1:0EB2  8b46f2            mov      ax, word ptr [bp - 0xe]
1:0EB5  a3b006            mov      word ptr [0x6b0], ax
1:0EB8  8b46e2            mov      ax, word ptr [bp - 0x1e]
1:0EBB  a3b206            mov      word ptr [0x6b2], ax
1:0EBE  2bc0              sub      ax, ax
1:0EC0  a3b606            mov      word ptr [0x6b6], ax
1:0EC3  a3b406            mov      word ptr [0x6b4], ax
1:0EC6  2bc0              sub      ax, ax
1:0EC8  a3ba06            mov      word ptr [0x6ba], ax
1:0ECB  a3b806            mov      word ptr [0x6b8], ax
1:0ECE  2bc0              sub      ax, ax
1:0ED0  a3be06            mov      word ptr [0x6be], ax
1:0ED3  a3bc06            mov      word ptr [0x6bc], ax
1:0ED6  2bc0              sub      ax, ax
1:0ED8  a3c206            mov      word ptr [0x6c2], ax
1:0EDB  a3c006            mov      word ptr [0x6c0], ax
1:0EDE  8b46fc            mov      ax, word ptr [bp - 4]
1:0EE1  a3c406            mov      word ptr [0x6c4], ax
1:0EE4  c706c6060000      mov      word ptr [0x6c6], 0
1:0EEA  8b46fc            mov      ax, word ptr [bp - 4]
1:0EED  a3c806            mov      word ptr [0x6c8], ax
1:0EF0  c706ca060000      mov      word ptr [0x6ca], 0
1:0EF6  ff7606            push     word ptr [bp + 6]
1:0EF9  b8e4ff            mov      ax, 0xffe4
1:0EFC  baffff            mov      dx, 0xffff
1:0EFF  52                push     dx
1:0F00  50                push     ax
1:0F01  b80100            mov      ax, 1
1:0F04  50                push     ax
1:0F05  9acd100000        lcall    0, 0x10cd  ; @1:KERNEL._llseek
1:0F0A  e91c00            jmp      0xf29
1:0F0D  b80000            mov      ax, 0
1:0F10  e9cc01            jmp      0x10df
1:0F13  e91300            jmp      0xf29
1:0F16  2d0c00            sub      ax, 0xc
1:0F19  7503              jne      0xf1e
1:0F1B  e93dff            jmp      0xe5b
1:0F1E  2d1c00            sub      ax, 0x1c
1:0F21  7503              jne      0xf26
1:0F23  e932ff            jmp      0xe58
1:0F26  e9e4ff            jmp      0xf0d
1:0F29  a1ba06            mov      ax, word ptr [0x6ba]
1:0F2C  0b06b806          or       ax, word ptr [0x6b8]
1:0F30  7403              je       0xf35
1:0F32  e94200            jmp      0xf77
1:0F35  ff36ae06          push     word ptr [0x6ae]
1:0F39  ff36ac06          push     word ptr [0x6ac]
1:0F3D  ff36aa06          push     word ptr [0x6aa]
1:0F41  ff36a806          push     word ptr [0x6a8]
1:0F45  a1b206            mov      ax, word ptr [0x6b2]
1:0F48  2bd2              sub      dx, dx
1:0F4A  52                push     dx
1:0F4B  50                push     ax
1:0F4C  9a6c0f0000        lcall    0, 0xf6c  ; @1:INT:ord_15(1:1E32)
1:0F51  051f00            add      ax, 0x1f
1:0F54  83d200            adc      dx, 0
1:0F57  25e7ff            and      ax, 0xffe7
1:0F5A  83e2ff            and      dx, 0xffff
1:0F5D  d1ea              shr      dx, 1
1:0F5F  d1d8              rcr      ax, 1
1:0F61  d1ea              shr      dx, 1
1:0F63  d1d8              rcr      ax, 1
1:0F65  d1ea              shr      dx, 1
1:0F67  d1d8              rcr      ax, 1
1:0F69  52                push     dx
1:0F6A  50                push     ax
1:0F6B  9a940a0000        lcall    0, 0xa94  ; @1:INT:ord_15(1:1E32)
1:0F70  a3b806            mov      word ptr [0x6b8], ax
1:0F73  8916ba06          mov      word ptr [0x6ba], dx
1:0F77  a1c606            mov      ax, word ptr [0x6c6]
1:0F7A  0b06c406          or       ax, word ptr [0x6c4]
1:0F7E  7403              je       0xf83
1:0F80  e91600            jmp      0xf99
1:0F83  b8a406            mov      ax, 0x6a4
1:0F86  1e                push     ds
1:0F87  50                push     ax
1:0F88  9a0d110000        lcall    0, 0x110d  ; @1:INT:ord_14(1:1151)
1:0F8D  83c404            add      sp, 4
1:0F90  a3c406            mov      word ptr [0x6c4], ax
1:0F93  c706c6060000      mov      word ptr [0x6c6], 0
1:0F99  b84200            mov      ax, 0x42
1:0F9C  50                push     ax
1:0F9D  8b46fc            mov      ax, word ptr [bp - 4]
1:0FA0  d1e0              shl      ax, 1
1:0FA2  d1e0              shl      ax, 1
1:0FA4  2bd2              sub      dx, dx
1:0FA6  0306a406          add      ax, word ptr [0x6a4]
1:0FAA  1316a606          adc      dx, word ptr [0x6a6]
1:0FAE  52                push     dx
1:0FAF  50                push     ax
1:0FB0  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalAlloc
1:0FB5  8946fa            mov      word ptr [bp - 6], ax
1:0FB8  837efa00          cmp      word ptr [bp - 6], 0
1:0FBC  7403              je       0xfc1
1:0FBE  e90600            jmp      0xfc7
1:0FC1  b80000            mov      ax, 0
1:0FC4  e91801            jmp      0x10df
1:0FC7  ff76fa            push     word ptr [bp - 6]
1:0FCA  9a28120000        lcall    0, 0x1228  ; @1:KERNEL.GlobalLock
1:0FCF  a39206            mov      word ptr [0x692], ax
1:0FD2  89169406          mov      word ptr [0x694], dx
1:0FD6  a19206            mov      ax, word ptr [0x692]
1:0FD9  8b169406          mov      dx, word ptr [0x694]
1:0FDD  8bf8              mov      di, ax
1:0FDF  bea406            mov      si, 0x6a4
1:0FE2  8ec2              mov      es, dx
1:0FE4  b91400            mov      cx, 0x14
1:0FE7  f3a5              rep movsw word ptr es:[di], word ptr [si]
1:0FE9  a19206            mov      ax, word ptr [0x692]
1:0FEC  8b169406          mov      dx, word ptr [0x694]
1:0FF0  0306a406          add      ax, word ptr [0x6a4]
1:0FF4  8946ea            mov      word ptr [bp - 0x16], ax
1:0FF7  8956ec            mov      word ptr [bp - 0x14], dx
1:0FFA  837efc00          cmp      word ptr [bp - 4], 0
1:0FFE  7503              jne      0x1003
1:1000  e9a600            jmp      0x10a9
1:1003  837ee80c          cmp      word ptr [bp - 0x18], 0xc
1:1007  7403              je       0x100c
1:1009  e98700            jmp      0x1093
1:100C  ff7606            push     word ptr [bp + 6]
1:100F  ff76ec            push     word ptr [bp - 0x14]
1:1012  ff76ea            push     word ptr [bp - 0x16]
1:1015  8b46fc            mov      ax, word ptr [bp - 4]
1:1018  8bc8              mov      cx, ax
1:101A  d1e0              shl      ax, 1
1:101C  03c1              add      ax, cx
1:101E  50                push     ax
1:101F  9aa5100000        lcall    0, 0x10a5  ; @1:KERNEL._lread
1:1024  8b46fc            mov      ax, word ptr [bp - 4]
1:1027  48                dec      ax
1:1028  8946f4            mov      word ptr [bp - 0xc], ax
1:102B  e90300            jmp      0x1031
1:102E  ff4ef4            dec      word ptr [bp - 0xc]
1:1031  837ef400          cmp      word ptr [bp - 0xc], 0
1:1035  7d03              jge      0x103a
1:1037  e95600            jmp      0x1090
1:103A  8b76f4            mov      si, word ptr [bp - 0xc]
1:103D  8bc6              mov      ax, si
1:103F  d1e6              shl      si, 1
1:1041  03f0              add      si, ax
1:1043  c45eea            les      bx, ptr [bp - 0x16]
1:1046  268a4002          mov      al, byte ptr es:[bx + si + 2]
1:104A  8846e0            mov      byte ptr [bp - 0x20], al
1:104D  8b5ef4            mov      bx, word ptr [bp - 0xc]
1:1050  8bc3              mov      ax, bx
1:1052  d1e3              shl      bx, 1
1:1054  03d8              add      bx, ax
1:1056  c476ea            les      si, ptr [bp - 0x16]
1:1059  268a00            mov      al, byte ptr es:[bx + si]
1:105C  8846de            mov      byte ptr [bp - 0x22], al
1:105F  8b76f4            mov      si, word ptr [bp - 0xc]
1:1062  8bc6              mov      ax, si
1:1064  d1e6              shl      si, 1
1:1066  03f0              add      si, ax
1:1068  c45eea            les      bx, ptr [bp - 0x16]
1:106B  268a4001          mov      al, byte ptr es:[bx + si + 1]
1:106F  8846df            mov      byte ptr [bp - 0x21], al
1:1072  c646e100          mov      byte ptr [bp - 0x1f], 0
1:1076  8b46de            mov      ax, word ptr [bp - 0x22]
1:1079  8b56e0            mov      dx, word ptr [bp - 0x20]
1:107C  8b5ef4            mov      bx, word ptr [bp - 0xc]
1:107F  d1e3              shl      bx, 1
1:1081  d1e3              shl      bx, 1
1:1083  c476ea            les      si, ptr [bp - 0x16]
1:1086  268900            mov      word ptr es:[bx + si], ax
1:1089  26895002          mov      word ptr es:[bx + si + 2], dx
1:108D  e99eff            jmp      0x102e
1:1090  e91600            jmp      0x10a9
1:1093  ff7606            push     word ptr [bp + 6]
1:1096  ff76ec            push     word ptr [bp - 0x14]
1:1099  ff76ea            push     word ptr [bp - 0x16]
1:109C  8b46fc            mov      ax, word ptr [bp - 4]
1:109F  d1e0              shl      ax, 1
1:10A1  d1e0              shl      ax, 1
1:10A3  50                push     ax
1:10A4  9ae90d0000        lcall    0, 0xde9  ; @1:KERNEL._lread
1:10A9  a1a206            mov      ax, word ptr [0x6a2]
1:10AC  0b06a006          or       ax, word ptr [0x6a0]
1:10B0  7503              jne      0x10b5
1:10B2  e91c00            jmp      0x10d1
1:10B5  ff7606            push     word ptr [bp + 6]
1:10B8  8b46e4            mov      ax, word ptr [bp - 0x1c]
1:10BB  8b56e6            mov      dx, word ptr [bp - 0x1a]
1:10BE  0306a006          add      ax, word ptr [0x6a0]
1:10C2  1316a206          adc      dx, word ptr [0x6a2]
1:10C6  52                push     dx
1:10C7  50                push     ax
1:10C8  b80000            mov      ax, 0
1:10CB  50                push     ax
1:10CC  9ad20d0000        lcall    0, 0xdd2  ; @1:KERNEL._llseek
1:10D1  ff76fa            push     word ptr [bp - 6]
1:10D4  9a7d0d0000        lcall    0, 0xd7d  ; @1:KERNEL.GlobalUnlock
1:10D9  8b46fa            mov      ax, word ptr [bp - 6]
1:10DC  e90000            jmp      0x10df
1:10DF  5e                pop      si
1:10E0  5f                pop      di
1:10E1  83ed02            sub      bp, 2
1:10E4  8be5              mov      sp, bp
1:10E6  1f                pop      ds
1:10E7  5d                pop      bp
1:10E8  4d                dec      bp
1:10E9  cb                retf     

; ===== EXPORT:ord_17(#17) =====
1:10EA  1e                push     ds
1:10EB  58                pop      ax
1:10EC  90                nop      
1:10ED  45                inc      bp
1:10EE  55                push     bp
1:10EF  8bec              mov      bp, sp
1:10F1  1e                push     ds
1:10F2  8ed8              mov      ds, ax
1:10F4  81ec0800          sub      sp, 8
1:10F8  57                push     di
1:10F9  56                push     si
1:10FA  8b4606            mov      ax, word ptr [bp + 6]
1:10FD  8b5608            mov      dx, word ptr [bp + 8]
1:1100  8946f8            mov      word ptr [bp - 8], ax
1:1103  8956fa            mov      word ptr [bp - 6], dx
1:1106  ff76fa            push     word ptr [bp - 6]
1:1109  ff76f8            push     word ptr [bp - 8]
1:110C  9a680b0000        lcall    0, 0xb68  ; @1:INT:ord_14(1:1151)
1:1111  83c404            add      sp, 4
1:1114  8946fc            mov      word ptr [bp - 4], ax
1:1117  c45ef8            les      bx, ptr [bp - 8]
1:111A  26833f0c          cmp      word ptr es:[bx], 0xc
1:111E  7403              je       0x1123
1:1120  e91900            jmp      0x113c
1:1123  26837f0200        cmp      word ptr es:[bx + 2], 0
1:1128  7403              je       0x112d
1:112A  e90f00            jmp      0x113c
1:112D  8b46fc            mov      ax, word ptr [bp - 4]
1:1130  8bc8              mov      cx, ax
1:1132  d1e0              shl      ax, 1
1:1134  03c1              add      ax, cx
1:1136  e90d00            jmp      0x1146
1:1139  e90a00            jmp      0x1146
1:113C  8b46fc            mov      ax, word ptr [bp - 4]
1:113F  d1e0              shl      ax, 1
1:1141  d1e0              shl      ax, 1
1:1143  e90000            jmp      0x1146
1:1146  5e                pop      si
1:1147  5f                pop      di
1:1148  83ed02            sub      bp, 2
1:114B  8be5              mov      sp, bp
1:114D  1f                pop      ds
1:114E  5d                pop      bp
1:114F  4d                dec      bp
1:1150  cb                retf     

; ===== EXPORT:ord_14(#14) =====
1:1151  1e                push     ds
1:1152  58                pop      ax
1:1153  90                nop      
1:1154  45                inc      bp
1:1155  55                push     bp
1:1156  8bec              mov      bp, sp
1:1158  1e                push     ds
1:1159  8ed8              mov      ds, ax
1:115B  81ec0c00          sub      sp, 0xc
1:115F  57                push     di
1:1160  56                push     si
1:1161  8b4606            mov      ax, word ptr [bp + 6]
1:1164  8b5608            mov      dx, word ptr [bp + 8]
1:1167  8946f4            mov      word ptr [bp - 0xc], ax
1:116A  8956f6            mov      word ptr [bp - 0xa], dx
1:116D  8b4606            mov      ax, word ptr [bp + 6]
1:1170  8b5608            mov      dx, word ptr [bp + 8]
1:1173  8946fa            mov      word ptr [bp - 6], ax
1:1176  8956fc            mov      word ptr [bp - 4], dx
1:1179  c45ef4            les      bx, ptr [bp - 0xc]
1:117C  26833f0c          cmp      word ptr es:[bx], 0xc
1:1180  7403              je       0x1185
1:1182  e90a00            jmp      0x118f
1:1185  26837f0200        cmp      word ptr es:[bx + 2], 0
1:118A  7503              jne      0x118f
1:118C  e92700            jmp      0x11b6
1:118F  c45ef4            les      bx, ptr [bp - 0xc]
1:1192  268b4722          mov      ax, word ptr es:[bx + 0x22]
1:1196  260b4720          or       ax, word ptr es:[bx + 0x20]
1:119A  7503              jne      0x119f
1:119C  e90a00            jmp      0x11a9
1:119F  c45ef4            les      bx, ptr [bp - 0xc]
1:11A2  268b4720          mov      ax, word ptr es:[bx + 0x20]
1:11A6  e95100            jmp      0x11fa
1:11A9  c45ef4            les      bx, ptr [bp - 0xc]
1:11AC  268b470e          mov      ax, word ptr es:[bx + 0xe]
1:11B0  8946f8            mov      word ptr [bp - 8], ax
1:11B3  e90a00            jmp      0x11c0
1:11B6  c45efa            les      bx, ptr [bp - 6]
1:11B9  268b470a          mov      ax, word ptr es:[bx + 0xa]
1:11BD  8946f8            mov      word ptr [bp - 8], ax
1:11C0  8b46f8            mov      ax, word ptr [bp - 8]
1:11C3  e91b00            jmp      0x11e1
1:11C6  b80200            mov      ax, 2
1:11C9  e92e00            jmp      0x11fa
1:11CC  b81000            mov      ax, 0x10
1:11CF  e92800            jmp      0x11fa
1:11D2  b80001            mov      ax, 0x100
1:11D5  e92200            jmp      0x11fa
1:11D8  b80000            mov      ax, 0
1:11DB  e91c00            jmp      0x11fa
1:11DE  e91900            jmp      0x11fa
1:11E1  48                dec      ax
1:11E2  7503              jne      0x11e7
1:11E4  e9dfff            jmp      0x11c6
1:11E7  2d0300            sub      ax, 3
1:11EA  7503              jne      0x11ef
1:11EC  e9ddff            jmp      0x11cc
1:11EF  2d0400            sub      ax, 4
1:11F2  7503              jne      0x11f7
1:11F4  e9dbff            jmp      0x11d2
1:11F7  e9deff            jmp      0x11d8
1:11FA  5e                pop      si
1:11FB  5f                pop      di
1:11FC  83ed02            sub      bp, 2
1:11FF  8be5              mov      sp, bp
1:1201  1f                pop      ds
1:1202  5d                pop      bp
1:1203  4d                dec      bp
1:1204  cb                retf     

; ===== EXPORT:ord_18(#18) =====
1:1205  1e                push     ds
1:1206  58                pop      ax
1:1207  90                nop      
1:1208  45                inc      bp
1:1209  55                push     bp
1:120A  8bec              mov      bp, sp
1:120C  1e                push     ds
1:120D  8ed8              mov      ds, ax
1:120F  81ec0c00          sub      sp, 0xc
1:1213  57                push     di
1:1214  56                push     si
1:1215  837e0600          cmp      word ptr [bp + 6], 0
1:1219  7403              je       0x121e
1:121B  e90600            jmp      0x1224
1:121E  b80000            mov      ax, 0
1:1221  e9bf00            jmp      0x12e3
1:1224  ff7606            push     word ptr [bp + 6]
1:1227  9a680d0000        lcall    0, 0xd68  ; @1:KERNEL.GlobalLock
1:122C  8946f8            mov      word ptr [bp - 8], ax
1:122F  8956fa            mov      word ptr [bp - 6], dx
1:1232  8b46fa            mov      ax, word ptr [bp - 6]
1:1235  0b46f8            or       ax, word ptr [bp - 8]
1:1238  7403              je       0x123d
1:123A  e90600            jmp      0x1243
1:123D  b80000            mov      ax, 0
1:1240  e9a000            jmp      0x12e3
1:1243  b80000            mov      ax, 0
1:1246  50                push     ax
1:1247  9affff0000        lcall    0, 0xffff  ; @1:USER.GetDC
1:124C  8946f4            mov      word ptr [bp - 0xc], ax
1:124F  837e0800          cmp      word ptr [bp + 8], 0
1:1253  7503              jne      0x1258
1:1255  e91a00            jmp      0x1272
1:1258  ff76f4            push     word ptr [bp - 0xc]
1:125B  ff7608            push     word ptr [bp + 8]
1:125E  b80000            mov      ax, 0
1:1261  50                push     ax
1:1262  9a21020000        lcall    0, 0x221  ; @1:USER.SelectPalette
1:1267  8946f6            mov      word ptr [bp - 0xa], ax
1:126A  ff76f4            push     word ptr [bp - 0xc]
1:126D  9a2d020000        lcall    0, 0x22d  ; @1:USER.RealizePalette
1:1272  ff76f4            push     word ptr [bp - 0xc]
1:1275  ff76fa            push     word ptr [bp - 6]
1:1278  ff76f8            push     word ptr [bp - 8]
1:127B  b80400            mov      ax, 4
1:127E  ba0000            mov      dx, 0
1:1281  52                push     dx
1:1282  50                push     ax
1:1283  ff76fa            push     word ptr [bp - 6]
1:1286  ff76f8            push     word ptr [bp - 8]
1:1289  9a4b130000        lcall    0, 0x134b  ; @1:INT:ord_17(1:10EA)
1:128E  83c404            add      sp, 4
1:1291  c45ef8            les      bx, ptr [bp - 8]
1:1294  260307            add      ax, word ptr es:[bx]
1:1297  0346f8            add      ax, word ptr [bp - 8]
1:129A  8b56fa            mov      dx, word ptr [bp - 6]
1:129D  52                push     dx
1:129E  50                push     ax
1:129F  ff76fa            push     word ptr [bp - 6]
1:12A2  ff76f8            push     word ptr [bp - 8]
1:12A5  b80000            mov      ax, 0
1:12A8  50                push     ax
1:12A9  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateDIBitmap
1:12AE  8946fc            mov      word ptr [bp - 4], ax
1:12B1  837e0800          cmp      word ptr [bp + 8], 0
1:12B5  7503              jne      0x12ba
1:12B7  e90f00            jmp      0x12c9
1:12BA  ff76f4            push     word ptr [bp - 0xc]
1:12BD  ff76f6            push     word ptr [bp - 0xa]
1:12C0  b80000            mov      ax, 0
1:12C3  50                push     ax
1:12C4  9a63120000        lcall    0, 0x1263  ; @1:USER.SelectPalette
1:12C9  b80000            mov      ax, 0
1:12CC  50                push     ax
1:12CD  ff76f4            push     word ptr [bp - 0xc]
1:12D0  9affff0000        lcall    0, 0xffff  ; @1:USER.ReleaseDC
1:12D5  ff7606            push     word ptr [bp + 6]
1:12D8  9a99130000        lcall    0, 0x1399  ; @1:KERNEL.GlobalUnlock
1:12DD  8b46fc            mov      ax, word ptr [bp - 4]
1:12E0  e90000            jmp      0x12e3
1:12E3  5e                pop      si
1:12E4  5f                pop      di
1:12E5  83ed02            sub      bp, 2
1:12E8  8be5              mov      sp, bp
1:12EA  1f                pop      ds
1:12EB  5d                pop      bp
1:12EC  4d                dec      bp
1:12ED  cb                retf     

; ===== EXPORT:ord_5(#5) =====
1:12EE  1e                push     ds
1:12EF  58                pop      ax
1:12F0  90                nop      
1:12F1  45                inc      bp
1:12F2  55                push     bp
1:12F3  8bec              mov      bp, sp
1:12F5  1e                push     ds
1:12F6  8ed8              mov      ds, ax
1:12F8  81ec1400          sub      sp, 0x14
1:12FC  57                push     di
1:12FD  56                push     si
1:12FE  837e0e00          cmp      word ptr [bp + 0xe], 0
1:1302  7403              je       0x1307
1:1304  e91e00            jmp      0x1325
1:1307  ff36a607          push     word ptr [0x7a6]
1:130B  ff7606            push     word ptr [bp + 6]
1:130E  ff7608            push     word ptr [bp + 8]
1:1311  ff760a            push     word ptr [bp + 0xa]
1:1314  ff760c            push     word ptr [bp + 0xc]
1:1317  ff7616            push     word ptr [bp + 0x16]
1:131A  ff7614            push     word ptr [bp + 0x14]
1:131D  9affff0000        lcall    0, 0xffff  ; @1:GDI.PatBlt
1:1322  e97e00            jmp      0x13a3
1:1325  ff760e            push     word ptr [bp + 0xe]
1:1328  9acb0f0000        lcall    0, 0xfcb  ; @1:KERNEL.GlobalLock
1:132D  8946f6            mov      word ptr [bp - 0xa], ax
1:1330  8956f8            mov      word ptr [bp - 8], dx
1:1333  8b46f8            mov      ax, word ptr [bp - 8]
1:1336  0b46f6            or       ax, word ptr [bp - 0xa]
1:1339  7403              je       0x133e
1:133B  e90600            jmp      0x1344
1:133E  b80000            mov      ax, 0
1:1341  e95f00            jmp      0x13a3
1:1344  ff76f8            push     word ptr [bp - 8]
1:1347  ff76f6            push     word ptr [bp - 0xa]
1:134A  9a64090000        lcall    0, 0x964  ; @1:INT:ord_17(1:10EA)
1:134F  83c404            add      sp, 4
1:1352  c45ef6            les      bx, ptr [bp - 0xa]
1:1355  260307            add      ax, word ptr es:[bx]
1:1358  0346f6            add      ax, word ptr [bp - 0xa]
1:135B  8b56f8            mov      dx, word ptr [bp - 8]
1:135E  8946ee            mov      word ptr [bp - 0x12], ax
1:1361  8956f0            mov      word ptr [bp - 0x10], dx
1:1364  ff36a607          push     word ptr [0x7a6]
1:1368  ff7606            push     word ptr [bp + 6]
1:136B  ff7608            push     word ptr [bp + 8]
1:136E  ff760a            push     word ptr [bp + 0xa]
1:1371  ff760c            push     word ptr [bp + 0xc]
1:1374  ff7610            push     word ptr [bp + 0x10]
1:1377  ff7612            push     word ptr [bp + 0x12]
1:137A  ff7610            push     word ptr [bp + 0x10]
1:137D  ff760c            push     word ptr [bp + 0xc]
1:1380  ff76f0            push     word ptr [bp - 0x10]
1:1383  ff76ee            push     word ptr [bp - 0x12]
1:1386  ff76f8            push     word ptr [bp - 8]
1:1389  ff76f6            push     word ptr [bp - 0xa]
1:138C  b80000            mov      ax, 0
1:138F  50                push     ax
1:1390  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetDIBitsToDevice
1:1395  ff760e            push     word ptr [bp + 0xe]
1:1398  9ad5100000        lcall    0, 0x10d5  ; @1:KERNEL.GlobalUnlock
1:139D  b80100            mov      ax, 1
1:13A0  e90000            jmp      0x13a3
1:13A3  5e                pop      si
1:13A4  5f                pop      di
1:13A5  83ed02            sub      bp, 2
1:13A8  8be5              mov      sp, bp
1:13AA  1f                pop      ds
1:13AB  5d                pop      bp
1:13AC  4d                dec      bp
1:13AD  cb                retf     

; ===== EXPORT:ord_16(#16) =====
1:13AE  1e                push     ds
1:13AF  58                pop      ax
1:13B0  90                nop      
1:13B1  45                inc      bp
1:13B2  55                push     bp
1:13B3  8bec              mov      bp, sp
1:13B5  1e                push     ds
1:13B6  8ed8              mov      ds, ax
1:13B8  81ec0a00          sub      sp, 0xa
1:13BC  57                push     di
1:13BD  56                push     si
1:13BE  8b4606            mov      ax, word ptr [bp + 6]
1:13C1  8b5608            mov      dx, word ptr [bp + 8]
1:13C4  8946fa            mov      word ptr [bp - 6], ax
1:13C7  8956fc            mov      word ptr [bp - 4], dx
1:13CA  8b460a            mov      ax, word ptr [bp + 0xa]
1:13CD  8b560c            mov      dx, word ptr [bp + 0xc]
1:13D0  8946f6            mov      word ptr [bp - 0xa], ax
1:13D3  8956f8            mov      word ptr [bp - 8], dx
1:13D6  837e0800          cmp      word ptr [bp + 8], 0
1:13DA  7603              jbe      0x13df
1:13DC  e90a00            jmp      0x13e9
1:13DF  817e060080        cmp      word ptr [bp + 6], 0x8000
1:13E4  7703              ja       0x13e9
1:13E6  e94200            jmp      0x142b
1:13E9  ff760e            push     word ptr [bp + 0xe]
1:13EC  ff76f8            push     word ptr [bp - 8]
1:13EF  ff76f6            push     word ptr [bp - 0xa]
1:13F2  b80080            mov      ax, 0x8000
1:13F5  50                push     ax
1:13F6  9a38140000        lcall    0, 0x1438  ; @1:KERNEL._lread
1:13FB  3d0080            cmp      ax, 0x8000
1:13FE  7503              jne      0x1403
1:1400  e90900            jmp      0x140c
1:1403  b80000            mov      ax, 0
1:1406  ba0000            mov      dx, 0
1:1409  e94a00            jmp      0x1456
1:140C  816e060080        sub      word ptr [bp + 6], 0x8000
1:1411  835e0800          sbb      word ptr [bp + 8], 0
1:1415  2bc0              sub      ax, ax
1:1417  b90080            mov      cx, 0x8000
1:141A  014ef6            add      word ptr [bp - 0xa], cx
1:141D  150000            adc      ax, 0
1:1420  b9ffff            mov      cx, 0xffff  ; @1:KERNEL.__AHSHIFT
1:1423  d3e0              shl      ax, cl
1:1425  0146f8            add      word ptr [bp - 8], ax
1:1428  e9abff            jmp      0x13d6
1:142B  ff760e            push     word ptr [bp + 0xe]
1:142E  ff76f8            push     word ptr [bp - 8]
1:1431  ff76f6            push     word ptr [bp - 0xa]
1:1434  ff7606            push     word ptr [bp + 6]
1:1437  9a20100000        lcall    0, 0x1020  ; @1:KERNEL._lread
1:143C  3b4606            cmp      ax, word ptr [bp + 6]
1:143F  7503              jne      0x1444
1:1441  e90900            jmp      0x144d
1:1444  b80000            mov      ax, 0
1:1447  ba0000            mov      dx, 0
1:144A  e90900            jmp      0x1456
1:144D  8b46fa            mov      ax, word ptr [bp - 6]
1:1450  8b56fc            mov      dx, word ptr [bp - 4]
1:1453  e90000            jmp      0x1456
1:1456  5e                pop      si
1:1457  5f                pop      di
1:1458  83ed02            sub      bp, 2
1:145B  8be5              mov      sp, bp
1:145D  1f                pop      ds
1:145E  5d                pop      bp
1:145F  4d                dec      bp
1:1460  ca0a00            retf     0xa

; ===== EXPORT:ord_7(#7) =====
1:1463  1e                push     ds
1:1464  58                pop      ax
1:1465  90                nop      
1:1466  45                inc      bp
1:1467  55                push     bp
1:1468  8bec              mov      bp, sp
1:146A  1e                push     ds
1:146B  8ed8              mov      ds, ax
1:146D  81ec0600          sub      sp, 6
1:1471  57                push     di
1:1472  56                push     si
1:1473  833ea60700        cmp      word ptr [0x7a6], 0
1:1478  7503              jne      0x147d
1:147A  e90900            jmp      0x1486
1:147D  837e0600          cmp      word ptr [bp + 6], 0
1:1481  7403              je       0x1486
1:1483  e90600            jmp      0x148c
1:1486  b80000            mov      ax, 0
1:1489  e96200            jmp      0x14ee
1:148C  ff36a607          push     word ptr [0x7a6]
1:1490  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateCompatibleDC
1:1495  a3b607            mov      word ptr [0x7b6], ax
1:1498  ff7606            push     word ptr [bp + 6]
1:149B  b80e00            mov      ax, 0xe
1:149E  50                push     ax
1:149F  b82a09            mov      ax, 0x92a
1:14A2  1e                push     ds
1:14A3  50                push     ax
1:14A4  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetObject
1:14A9  ff36b607          push     word ptr [0x7b6]
1:14AD  ff7606            push     word ptr [bp + 6]
1:14B0  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectObject
1:14B5  ff36a607          push     word ptr [0x7a6]
1:14B9  ff36ae07          push     word ptr [0x7ae]
1:14BD  ff36b007          push     word ptr [0x7b0]
1:14C1  ff362c09          push     word ptr [0x92c]
1:14C5  ff362e09          push     word ptr [0x92e]
1:14C9  ff36b607          push     word ptr [0x7b6]
1:14CD  b80000            mov      ax, 0
1:14D0  50                push     ax
1:14D1  50                push     ax
1:14D2  b82000            mov      ax, 0x20
1:14D5  bacc00            mov      dx, 0xcc
1:14D8  52                push     dx
1:14D9  50                push     ax
1:14DA  9affff0000        lcall    0, 0xffff  ; @1:GDI.BitBlt
1:14DF  ff36b607          push     word ptr [0x7b6]
1:14E3  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteDC
1:14E8  b80100            mov      ax, 1
1:14EB  e90000            jmp      0x14ee
1:14EE  5e                pop      si
1:14EF  5f                pop      di
1:14F0  83ed02            sub      bp, 2
1:14F3  8be5              mov      sp, bp
1:14F5  1f                pop      ds
1:14F6  5d                pop      bp
1:14F7  4d                dec      bp
1:14F8  cb                retf     

; ===== EXPORT:ord_13(#13) =====
1:14F9  1e                push     ds
1:14FA  58                pop      ax
1:14FB  90                nop      
1:14FC  45                inc      bp
1:14FD  55                push     bp
1:14FE  8bec              mov      bp, sp
1:1500  1e                push     ds
1:1501  8ed8              mov      ds, ax
1:1503  81ec0400          sub      sp, 4
1:1507  57                push     di
1:1508  56                push     si
1:1509  b83315            mov      ax, 0x1533  ; @1:INT:FILEDLGPROC(1:177C)
1:150C  ba3615            mov      dx, 0x1536  ; @1:INT:FILEDLGPROC(1:177C)
1:150F  52                push     dx
1:1510  50                push     ax
1:1511  ff36b407          push     word ptr [0x7b4]
1:1515  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.MakeProcInstance
1:151A  a37a01            mov      word ptr [0x17a], ax
1:151D  89167c01          mov      word ptr [0x17c], dx
1:1521  ff36b407          push     word ptr [0x7b4]
1:1525  b89f01            mov      ax, 0x19f
1:1528  1e                push     ds
1:1529  50                push     ax
1:152A  c41eaa07          les      bx, ptr [0x7aa]
1:152E  26ff7726          push     word ptr es:[bx + 0x26]
1:1532  b8ffff            mov      ax, 0xffff  ; @1:INT:FILEDLGPROC(1:177C)
1:1535  baffff            mov      dx, 0xffff  ; @1:INT:FILEDLGPROC(1:177C)
1:1538  52                push     dx
1:1539  50                push     ax
1:153A  9affff0000        lcall    0, 0xffff  ; @1:USER.DialogBox
1:153F  8946fc            mov      word ptr [bp - 4], ax
1:1542  ff367c01          push     word ptr [0x17c]
1:1546  ff367a01          push     word ptr [0x17a]
1:154A  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.FreeProcInstance
1:154F  8b46fc            mov      ax, word ptr [bp - 4]
1:1552  e90000            jmp      0x1555
1:1555  5e                pop      si
1:1556  5f                pop      di
1:1557  83ed02            sub      bp, 2
1:155A  8be5              mov      sp, bp
1:155C  1f                pop      ds
1:155D  5d                pop      bp
1:155E  4d                dec      bp
1:155F  cb                retf     

; ===== EXPORT:ord_26(#26) =====
1:1560  1e                push     ds
1:1561  58                pop      ax
1:1562  90                nop      
1:1563  45                inc      bp
1:1564  55                push     bp
1:1565  8bec              mov      bp, sp
1:1567  1e                push     ds
1:1568  8ed8              mov      ds, ax
1:156A  81ec0400          sub      sp, 4
1:156E  57                push     di
1:156F  56                push     si
1:1570  c746fc0000        mov      word ptr [bp - 4], 0
1:1575  e90300            jmp      0x157b
1:1578  ff46fc            inc      word ptr [bp - 4]
1:157B  b8bc07            mov      ax, 0x7bc
1:157E  50                push     ax
1:157F  9a0d010000        lcall    0, 0x10d  ; @1:INT:ord_9(1:1D44)
1:1584  83c402            add      sp, 2
1:1587  3b46fc            cmp      ax, word ptr [bp - 4]
1:158A  7703              ja       0x158f
1:158C  e93a00            jmp      0x15c9
1:158F  8b5efc            mov      bx, word ptr [bp - 4]
1:1592  8a87bc07          mov      al, byte ptr [bx + 0x7bc]
1:1596  98                cwde     
1:1597  e91200            jmp      0x15ac
1:159A  b80100            mov      ax, 1
1:159D  e92f00            jmp      0x15cf
1:15A0  b80000            mov      ax, 0
1:15A3  e92900            jmp      0x15cf
1:15A6  e9cfff            jmp      0x1578
1:15A9  e91a00            jmp      0x15c6
1:15AC  0bc0              or       ax, ax
1:15AE  7503              jne      0x15b3
1:15B0  e9edff            jmp      0x15a0
1:15B3  2d2a00            sub      ax, 0x2a
1:15B6  7503              jne      0x15bb
1:15B8  e9dfff            jmp      0x159a
1:15BB  2d1500            sub      ax, 0x15
1:15BE  7503              jne      0x15c3
1:15C0  e9d7ff            jmp      0x159a
1:15C3  e9e0ff            jmp      0x15a6
1:15C6  e9afff            jmp      0x1578
1:15C9  b80000            mov      ax, 0
1:15CC  e90000            jmp      0x15cf
1:15CF  5e                pop      si
1:15D0  5f                pop      di
1:15D1  83ed02            sub      bp, 2
1:15D4  8be5              mov      sp, bp
1:15D6  1f                pop      ds
1:15D7  5d                pop      bp
1:15D8  4d                dec      bp
1:15D9  cb                retf     

; ===== EXPORT:ord_25(#25) =====
1:15DA  1e                push     ds
1:15DB  58                pop      ax
1:15DC  90                nop      
1:15DD  45                inc      bp
1:15DE  55                push     bp
1:15DF  8bec              mov      bp, sp
1:15E1  1e                push     ds
1:15E2  8ed8              mov      ds, ax
1:15E4  81ec0400          sub      sp, 4
1:15E8  57                push     di
1:15E9  56                push     si
1:15EA  b8bc07            mov      ax, 0x7bc
1:15ED  1e                push     ds
1:15EE  50                push     ax
1:15EF  b80000            mov      ax, 0
1:15F2  50                push     ax
1:15F3  9affff0000        lcall    0, 0xffff  ; @1:KERNEL._lopen
1:15F8  8946fc            mov      word ptr [bp - 4], ax
1:15FB  3d0000            cmp      ax, 0
1:15FE  7c03              jl       0x1603
1:1600  e90600            jmp      0x1609
1:1603  b80000            mov      ax, 0
1:1606  e90e00            jmp      0x1617
1:1609  ff76fc            push     word ptr [bp - 4]
1:160C  9a080a0000        lcall    0, 0xa08  ; @1:KERNEL._lclose
1:1611  b80100            mov      ax, 1
1:1614  e90000            jmp      0x1617
1:1617  5e                pop      si
1:1618  5f                pop      di
1:1619  83ed02            sub      bp, 2
1:161C  8be5              mov      sp, bp
1:161E  1f                pop      ds
1:161F  5d                pop      bp
1:1620  4d                dec      bp
1:1621  cb                retf     

; ===== EXPORT:ord_24(#24) =====
1:1622  1e                push     ds
1:1623  58                pop      ax
1:1624  90                nop      
1:1625  45                inc      bp
1:1626  55                push     bp
1:1627  8bec              mov      bp, sp
1:1629  1e                push     ds
1:162A  8ed8              mov      ds, ax
1:162C  81ec0400          sub      sp, 4
1:1630  57                push     di
1:1631  56                push     si
1:1632  ff7606            push     word ptr [bp + 6]
1:1635  b8c900            mov      ax, 0xc9
1:1638  50                push     ax
1:1639  b8bc07            mov      ax, 0x7bc
1:163C  1e                push     ds
1:163D  50                push     ax
1:163E  b94000            mov      cx, 0x40
1:1641  51                push     cx
1:1642  9a13170000        lcall    0, 0x1713  ; @1:USER.GetDlgItemText
1:1647  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_26(1:1560)
1:164C  3d0000            cmp      ax, 0
1:164F  7503              jne      0x1654
1:1651  e99100            jmp      0x16e5
1:1654  ff7606            push     word ptr [bp + 6]
1:1657  b8bc07            mov      ax, 0x7bc
1:165A  1e                push     ds
1:165B  50                push     ax
1:165C  b9cc00            mov      cx, 0xcc
1:165F  51                push     cx
1:1660  b9cb00            mov      cx, 0xcb
1:1663  51                push     cx
1:1664  b910c0            mov      cx, 0xc010
1:1667  51                push     cx
1:1668  9acd160000        lcall    0, 0x16cd  ; @1:USER.DlgDirList
1:166D  c7065407bc07      mov      word ptr [0x754], 0x7bc
1:1673  c746fc0000        mov      word ptr [bp - 4], 0
1:1678  e90300            jmp      0x167e
1:167B  ff46fc            inc      word ptr [bp - 4]
1:167E  b8bc07            mov      ax, 0x7bc
1:1681  50                push     ax
1:1682  9a1c170000        lcall    0, 0x171c  ; @1:INT:ord_9(1:1D44)
1:1687  83c402            add      sp, 2
1:168A  3b46fc            cmp      ax, word ptr [bp - 4]
1:168D  7703              ja       0x1692
1:168F  e92600            jmp      0x16b8
1:1692  8b5efc            mov      bx, word ptr [bp - 4]
1:1695  80bfbc075c        cmp      byte ptr [bx + 0x7bc], 0x5c
1:169A  7503              jne      0x169f
1:169C  e90d00            jmp      0x16ac
1:169F  8b5efc            mov      bx, word ptr [bp - 4]
1:16A2  80bfbc073a        cmp      byte ptr [bx + 0x7bc], 0x3a
1:16A7  7403              je       0x16ac
1:16A9  e90900            jmp      0x16b5
1:16AC  8b46fc            mov      ax, word ptr [bp - 4]
1:16AF  05bc07            add      ax, 0x7bc
1:16B2  a35407            mov      word ptr [0x754], ax
1:16B5  e9c3ff            jmp      0x167b
1:16B8  ff7606            push     word ptr [bp + 6]
1:16BB  1e                push     ds
1:16BC  ff365407          push     word ptr [0x754]
1:16C0  b8ca00            mov      ax, 0xca
1:16C3  50                push     ax
1:16C4  b8cb00            mov      ax, 0xcb
1:16C7  50                push     ax
1:16C8  b80000            mov      ax, 0
1:16CB  50                push     ax
1:16CC  9affff0000        lcall    0, 0xffff  ; @1:USER.DlgDirList
1:16D1  ff7606            push     word ptr [bp + 6]
1:16D4  b8c900            mov      ax, 0xc9
1:16D7  50                push     ax
1:16D8  1e                push     ds
1:16D9  ff365407          push     word ptr [0x754]
1:16DD  9a6d170000        lcall    0, 0x176d  ; @1:USER.SetDlgItemText
1:16E2  e98c00            jmp      0x1771
1:16E5  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_25(1:15DA)
1:16EA  3d0000            cmp      ax, 0
1:16ED  7503              jne      0x16f2
1:16EF  e96e00            jmp      0x1760
1:16F2  b8bc07            mov      ax, 0x7bc
1:16F5  50                push     ax
1:16F6  b9d406            mov      cx, 0x6d4
1:16F9  51                push     cx
1:16FA  9a57190000        lcall    0, 0x1957  ; @1:INT:ord_22(1:1D12)
1:16FF  83c404            add      sp, 4
1:1702  ff7606            push     word ptr [bp + 6]
1:1705  b8cb00            mov      ax, 0xcb
1:1708  50                push     ax
1:1709  b8bc07            mov      ax, 0x7bc
1:170C  1e                push     ds
1:170D  50                push     ax
1:170E  b94000            mov      cx, 0x40
1:1711  51                push     cx
1:1712  9a1b190000        lcall    0, 0x191b  ; @1:USER.GetDlgItemText
1:1717  b8bc07            mov      ax, 0x7bc
1:171A  50                push     ax
1:171B  9a90190000        lcall    0, 0x1990  ; @1:INT:ord_9(1:1D44)
1:1720  83c402            add      sp, 2
1:1723  3d0300            cmp      ax, 3
1:1726  7703              ja       0x172b
1:1728  e91000            jmp      0x173b
1:172B  b8a401            mov      ax, 0x1a4
1:172E  50                push     ax
1:172F  b8bc07            mov      ax, 0x7bc
1:1732  50                push     ax
1:1733  9a44170000        lcall    0, 0x1744  ; @1:INT:ord_21(1:1CD2)
1:1738  83c404            add      sp, 4
1:173B  b8d406            mov      ax, 0x6d4
1:173E  50                push     ax
1:173F  b8bc07            mov      ax, 0x7bc
1:1742  50                push     ax
1:1743  9a70190000        lcall    0, 0x1970  ; @1:INT:ord_21(1:1CD2)
1:1748  83c404            add      sp, 4
1:174B  ff7606            push     word ptr [bp + 6]
1:174E  b80100            mov      ax, 1
1:1751  50                push     ax
1:1752  9a6a180000        lcall    0, 0x186a  ; @1:USER.EndDialog
1:1757  c70678010000      mov      word ptr [0x178], 0
1:175D  e91100            jmp      0x1771
1:1760  ff7606            push     word ptr [bp + 6]
1:1763  b8c900            mov      ax, 0xc9
1:1766  50                push     ax
1:1767  b8a601            mov      ax, 0x1a6
1:176A  1e                push     ds
1:176B  50                push     ax
1:176C  9a24180000        lcall    0, 0x1824  ; @1:USER.SetDlgItemText
1:1771  5e                pop      si
1:1772  5f                pop      di
1:1773  83ed02            sub      bp, 2
1:1776  8be5              mov      sp, bp
1:1778  1f                pop      ds
1:1779  5d                pop      bp
1:177A  4d                dec      bp
1:177B  cb                retf     

; ===== EXPORT:FILEDLGPROC(#3) =====
1:177C  1e                push     ds
1:177D  58                pop      ax
1:177E  90                nop      
1:177F  45                inc      bp
1:1780  55                push     bp
1:1781  8bec              mov      bp, sp
1:1783  1e                push     ds
1:1784  8ed8              mov      ds, ax
1:1786  81ec0e00          sub      sp, 0xe
1:178A  57                push     di
1:178B  56                push     si
1:178C  8b460c            mov      ax, word ptr [bp + 0xc]
1:178F  e9a702            jmp      0x1a39
1:1792  8b460e            mov      ax, word ptr [bp + 0xe]
1:1795  a37801            mov      word ptr [0x178], ax
1:1798  ff367801          push     word ptr [0x178]
1:179C  b85607            mov      ax, 0x756
1:179F  1e                push     ds
1:17A0  50                push     ax
1:17A1  9affff0000        lcall    0, 0xffff  ; @1:USER.GetWindowRect
1:17A6  a15a07            mov      ax, word ptr [0x75a]
1:17A9  2b065607          sub      ax, word ptr [0x756]
1:17AD  8946fa            mov      word ptr [bp - 6], ax
1:17B0  a15c07            mov      ax, word ptr [0x75c]
1:17B3  2b065807          sub      ax, word ptr [0x758]
1:17B7  8946fc            mov      word ptr [bp - 4], ax
1:17BA  ff367801          push     word ptr [0x178]
1:17BE  8b46fa            mov      ax, word ptr [bp - 6]
1:17C1  99                cdq      
1:17C2  2bc2              sub      ax, dx
1:17C4  d1f8              sar      ax, 1
1:17C6  c41eaa07          les      bx, ptr [0x7aa]
1:17CA  8bc8              mov      cx, ax
1:17CC  268b4706          mov      ax, word ptr es:[bx + 6]
1:17D0  99                cdq      
1:17D1  2bc2              sub      ax, dx
1:17D3  d1f8              sar      ax, 1
1:17D5  2bc1              sub      ax, cx
1:17D7  50                push     ax
1:17D8  8b46fa            mov      ax, word ptr [bp - 6]
1:17DB  99                cdq      
1:17DC  2bc2              sub      ax, dx
1:17DE  d1f8              sar      ax, 1
1:17E0  c41eaa07          les      bx, ptr [0x7aa]
1:17E4  8bc8              mov      cx, ax
1:17E6  268b4708          mov      ax, word ptr es:[bx + 8]
1:17EA  99                cdq      
1:17EB  2bc2              sub      ax, dx
1:17ED  d1f8              sar      ax, 1
1:17EF  2bc1              sub      ax, cx
1:17F1  50                push     ax
1:17F2  ff76fa            push     word ptr [bp - 6]
1:17F5  ff76fc            push     word ptr [bp - 4]
1:17F8  b80100            mov      ax, 1
1:17FB  50                push     ax
1:17FC  9affff0000        lcall    0, 0xffff  ; @1:USER.MoveWindow
1:1801  ff760e            push     word ptr [bp + 0xe]
1:1804  b80100            mov      ax, 1
1:1807  50                push     ax
1:1808  9a7f180000        lcall    0, 0x187f  ; @1:USER.GetDlgItem
1:180D  50                push     ax
1:180E  b80000            mov      ax, 0
1:1811  50                push     ax
1:1812  9a8e180000        lcall    0, 0x188e  ; @1:USER.EnableWindow
1:1817  ff760e            push     word ptr [bp + 0xe]
1:181A  b8c900            mov      ax, 0xc9
1:181D  50                push     ax
1:181E  b9ac01            mov      cx, 0x1ac
1:1821  1e                push     ds
1:1822  51                push     cx
1:1823  9abc180000        lcall    0, 0x18bc  ; @1:USER.SetDlgItemText
1:1828  ff760e            push     word ptr [bp + 0xe]
1:182B  b8c900            mov      ax, 0xc9
1:182E  50                push     ax
1:182F  b81504            mov      ax, 0x415
1:1832  50                push     ax
1:1833  b84000            mov      ax, 0x40
1:1836  50                push     ax
1:1837  2bc0              sub      ax, ax
1:1839  50                push     ax
1:183A  50                push     ax
1:183B  9affff0000        lcall    0, 0xffff  ; @1:USER.SendDlgItemMessage
1:1840  ff760e            push     word ptr [bp + 0xe]
1:1843  9a58180000        lcall    0, 0x1858  ; @1:INT:ord_24(1:1622)
1:1848  83c402            add      sp, 2
1:184B  e9fc01            jmp      0x1a4a
1:184E  8b460a            mov      ax, word ptr [bp + 0xa]
1:1851  e9b501            jmp      0x1a09
1:1854  ff760e            push     word ptr [bp + 0xe]
1:1857  9ae6180000        lcall    0, 0x18e6  ; @1:INT:ord_24(1:1622)
1:185C  83c402            add      sp, 2
1:185F  e9cb01            jmp      0x1a2d
1:1862  ff760e            push     word ptr [bp + 0xe]
1:1865  b80000            mov      ax, 0
1:1868  50                push     ax
1:1869  9a6d060000        lcall    0, 0x66d  ; @1:USER.EndDialog
1:186E  c70678010000      mov      word ptr [0x178], 0
1:1874  e9b601            jmp      0x1a2d
1:1877  ff760e            push     word ptr [bp + 0xe]
1:187A  b80100            mov      ax, 1
1:187D  50                push     ax
1:187E  9ac8180000        lcall    0, 0x18c8  ; @1:USER.GetDlgItem
1:1883  50                push     ax
1:1884  ff7606            push     word ptr [bp + 6]
1:1887  9affff0000        lcall    0, 0xffff  ; @1:USER.GetWindowTextLength
1:188C  50                push     ax
1:188D  9ad2180000        lcall    0, 0x18d2  ; @1:USER.EnableWindow
1:1892  e99801            jmp      0x1a2d
1:1895  8b4608            mov      ax, word ptr [bp + 8]
1:1898  48                dec      ax
1:1899  7403              je       0x189e
1:189B  e93b00            jmp      0x18d9
1:189E  ff760e            push     word ptr [bp + 0xe]
1:18A1  b8ca08            mov      ax, 0x8ca
1:18A4  1e                push     ds
1:18A5  50                push     ax
1:18A6  b9ca00            mov      cx, 0xca
1:18A9  51                push     cx
1:18AA  9a06190000        lcall    0, 0x1906  ; @1:USER.DlgDirSelect
1:18AF  ff760e            push     word ptr [bp + 0xe]
1:18B2  b8c900            mov      ax, 0xc9
1:18B5  50                push     ax
1:18B6  b8ca08            mov      ax, 0x8ca
1:18B9  1e                push     ds
1:18BA  50                push     ax
1:18BB  9aac190000        lcall    0, 0x19ac  ; @1:USER.SetDlgItemText
1:18C0  ff760e            push     word ptr [bp + 0xe]
1:18C3  b80100            mov      ax, 1
1:18C6  50                push     ax
1:18C7  9affff0000        lcall    0, 0xffff  ; @1:USER.GetDlgItem
1:18CC  50                push     ax
1:18CD  b80100            mov      ax, 1
1:18D0  50                push     ax
1:18D1  9affff0000        lcall    0, 0xffff  ; @1:USER.EnableWindow
1:18D6  e91400            jmp      0x18ed
1:18D9  837e0802          cmp      word ptr [bp + 8], 2
1:18DD  7403              je       0x18e2
1:18DF  e90b00            jmp      0x18ed
1:18E2  ff760e            push     word ptr [bp + 0xe]
1:18E5  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_24(1:1622)
1:18EA  83c402            add      sp, 2
1:18ED  e93d01            jmp      0x1a2d
1:18F0  8b4608            mov      ax, word ptr [bp + 8]
1:18F3  48                dec      ax
1:18F4  7403              je       0x18f9
1:18F6  e9f000            jmp      0x19e9
1:18F9  ff760e            push     word ptr [bp + 0xe]
1:18FC  b81608            mov      ax, 0x816
1:18FF  1e                push     ds
1:1900  50                push     ax
1:1901  b8cc00            mov      ax, 0xcc
1:1904  50                push     ax
1:1905  9affff0000        lcall    0, 0xffff  ; @1:USER.DlgDirSelect
1:190A  ff760e            push     word ptr [bp + 0xe]
1:190D  b8c900            mov      ax, 0xc9
1:1910  50                push     ax
1:1911  b8ca08            mov      ax, 0x8ca
1:1914  1e                push     ds
1:1915  50                push     ax
1:1916  b94000            mov      cx, 0x40
1:1919  51                push     cx
1:191A  9ac1190000        lcall    0, 0x19c1  ; @1:USER.GetDlgItemText
1:191F  b85c00            mov      ax, 0x5c
1:1922  50                push     ax
1:1923  b8ca08            mov      ax, 0x8ca
1:1926  50                push     ax
1:1927  9a44190000        lcall    0, 0x1944  ; @1:INT:ord_23(1:1DC2)
1:192C  83c404            add      sp, 4
1:192F  8946f6            mov      word ptr [bp - 0xa], ax
1:1932  837ef600          cmp      word ptr [bp - 0xa], 0
1:1936  7403              je       0x193b
1:1938  e91300            jmp      0x194e
1:193B  b83a00            mov      ax, 0x3a
1:193E  50                push     ax
1:193F  b8ca08            mov      ax, 0x8ca
1:1942  50                push     ax
1:1943  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_23(1:1DC2)
1:1948  83c404            add      sp, 4
1:194B  8946f6            mov      word ptr [bp - 0xa], ax
1:194E  b81608            mov      ax, 0x816
1:1951  50                push     ax
1:1952  b87008            mov      ax, 0x870
1:1955  50                push     ax
1:1956  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_22(1:1D12)
1:195B  83c404            add      sp, 4
1:195E  837ef600          cmp      word ptr [bp - 0xa], 0
1:1962  7403              je       0x1967
1:1964  e91300            jmp      0x197a
1:1967  b8ca08            mov      ax, 0x8ca
1:196A  50                push     ax
1:196B  b87008            mov      ax, 0x870
1:196E  50                push     ax
1:196F  9a84190000        lcall    0, 0x1984  ; @1:INT:ord_21(1:1CD2)
1:1974  83c404            add      sp, 4
1:1977  e91100            jmp      0x198b
1:197A  8b46f6            mov      ax, word ptr [bp - 0xa]
1:197D  40                inc      ax
1:197E  50                push     ax
1:197F  b87008            mov      ax, 0x870
1:1982  50                push     ax
1:1983  9ace190000        lcall    0, 0x19ce  ; @1:INT:ord_21(1:1CD2)
1:1988  83c404            add      sp, 4
1:198B  b8ca08            mov      ax, 0x8ca
1:198E  50                push     ax
1:198F  9a80150000        lcall    0, 0x1580  ; @1:INT:ord_9(1:1D44)
1:1994  83c402            add      sp, 2
1:1997  3d0000            cmp      ax, 0
1:199A  7403              je       0x199f
1:199C  e93600            jmp      0x19d5
1:199F  ff760e            push     word ptr [bp + 0xe]
1:19A2  b8c900            mov      ax, 0xc9
1:19A5  50                push     ax
1:19A6  b9b201            mov      cx, 0x1b2
1:19A9  1e                push     ds
1:19AA  51                push     cx
1:19AB  9affff0000        lcall    0, 0xffff  ; @1:USER.SetDlgItemText
1:19B0  ff760e            push     word ptr [bp + 0xe]
1:19B3  b8c900            mov      ax, 0xc9
1:19B6  50                push     ax
1:19B7  b8ca08            mov      ax, 0x8ca
1:19BA  1e                push     ds
1:19BB  50                push     ax
1:19BC  b94000            mov      cx, 0x40
1:19BF  51                push     cx
1:19C0  9affff0000        lcall    0, 0xffff  ; @1:USER.GetDlgItemText
1:19C5  b8ca08            mov      ax, 0x8ca
1:19C8  50                push     ax
1:19C9  b87008            mov      ax, 0x870
1:19CC  50                push     ax
1:19CD  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_21(1:1CD2)
1:19D2  83c404            add      sp, 4
1:19D5  ff760e            push     word ptr [bp + 0xe]
1:19D8  b8c900            mov      ax, 0xc9
1:19DB  50                push     ax
1:19DC  b87008            mov      ax, 0x870
1:19DF  1e                push     ds
1:19E0  50                push     ax
1:19E1  9ade160000        lcall    0, 0x16de  ; @1:USER.SetDlgItemText
1:19E6  e91400            jmp      0x19fd
1:19E9  837e0802          cmp      word ptr [bp + 8], 2
1:19ED  7403              je       0x19f2
1:19EF  e90b00            jmp      0x19fd
1:19F2  ff760e            push     word ptr [bp + 0xe]
1:19F5  9a44180000        lcall    0, 0x1844  ; @1:INT:ord_24(1:1622)
1:19FA  83c402            add      sp, 2
1:19FD  e92d00            jmp      0x1a2d
1:1A00  b80000            mov      ax, 0
1:1A03  e94a00            jmp      0x1a50
1:1A06  e92400            jmp      0x1a2d
1:1A09  48                dec      ax
1:1A0A  7503              jne      0x1a0f
1:1A0C  e945fe            jmp      0x1854
1:1A0F  48                dec      ax
1:1A10  7503              jne      0x1a15
1:1A12  e94dfe            jmp      0x1862
1:1A15  2dc700            sub      ax, 0xc7
1:1A18  7503              jne      0x1a1d
1:1A1A  e95afe            jmp      0x1877
1:1A1D  48                dec      ax
1:1A1E  7503              jne      0x1a23
1:1A20  e972fe            jmp      0x1895
1:1A23  48                dec      ax
1:1A24  48                dec      ax
1:1A25  7503              jne      0x1a2a
1:1A27  e9c6fe            jmp      0x18f0
1:1A2A  e9d3ff            jmp      0x1a00
1:1A2D  e91a00            jmp      0x1a4a
1:1A30  b80000            mov      ax, 0
1:1A33  e91a00            jmp      0x1a50
1:1A36  e91100            jmp      0x1a4a
1:1A39  2d1001            sub      ax, 0x110
1:1A3C  7503              jne      0x1a41
1:1A3E  e951fd            jmp      0x1792
1:1A41  48                dec      ax
1:1A42  7503              jne      0x1a47
1:1A44  e907fe            jmp      0x184e
1:1A47  e9e6ff            jmp      0x1a30
1:1A4A  b80100            mov      ax, 1
1:1A4D  e90000            jmp      0x1a50
1:1A50  5e                pop      si
1:1A51  5f                pop      di
1:1A52  83ed02            sub      bp, 2
1:1A55  8be5              mov      sp, bp
1:1A57  1f                pop      ds
1:1A58  5d                pop      bp
1:1A59  4d                dec      bp
1:1A5A  ca0a00            retf     0xa
1:1A5D  001e5890          add      byte ptr [0x9058], bl
1:1A61  45                inc      bp
1:1A62  55                push     bp
1:1A63  8bec              mov      bp, sp
1:1A65  1e                push     ds
1:1A66  8ed8              mov      ds, ax
1:1A68  81ec0000          sub      sp, 0
1:1A6C  57                push     di
1:1A6D  56                push     si
1:1A6E  837e0a00          cmp      word ptr [bp + 0xa], 0
1:1A72  7403              je       0x1a77
1:1A74  e90600            jmp      0x1a7d
1:1A77  b80000            mov      ax, 0
1:1A7A  e90c00            jmp      0x1a89
1:1A7D  8b460e            mov      ax, word ptr [bp + 0xe]
1:1A80  a3b407            mov      word ptr [0x7b4], ax
1:1A83  b80100            mov      ax, 1
1:1A86  e90000            jmp      0x1a89
1:1A89  5e                pop      si
1:1A8A  5f                pop      di
1:1A8B  83ed02            sub      bp, 2
1:1A8E  8be5              mov      sp, bp
1:1A90  1f                pop      ds
1:1A91  5d                pop      bp
1:1A92  4d                dec      bp
1:1A93  ca0a00            retf     0xa

; ===== EXPORT:WEP(#2) =====
1:1A96  1e                push     ds
1:1A97  58                pop      ax
1:1A98  90                nop      
1:1A99  45                inc      bp
1:1A9A  55                push     bp
1:1A9B  8bec              mov      bp, sp
1:1A9D  1e                push     ds
1:1A9E  8ed8              mov      ds, ax
1:1AA0  81ec0000          sub      sp, 0
1:1AA4  57                push     di
1:1AA5  56                push     si
1:1AA6  b80100            mov      ax, 1
1:1AA9  e90000            jmp      0x1aac
1:1AAC  5e                pop      si
1:1AAD  5f                pop      di
1:1AAE  83ed02            sub      bp, 2
1:1AB1  8be5              mov      sp, bp
1:1AB3  1f                pop      ds
1:1AB4  5d                pop      bp
1:1AB5  4d                dec      bp
1:1AB6  ca0200            retf     2

; ===== EXPORT:MODULE(#1) =====
1:1AB9  1e                push     ds
1:1ABA  58                pop      ax
1:1ABB  90                nop      
1:1ABC  45                inc      bp
1:1ABD  55                push     bp
1:1ABE  8bec              mov      bp, sp
1:1AC0  1e                push     ds
1:1AC1  8ed8              mov      ds, ax
1:1AC3  81ec0a00          sub      sp, 0xa
1:1AC7  57                push     di
1:1AC8  56                push     si
1:1AC9  8b4608            mov      ax, word ptr [bp + 8]
1:1ACC  a3a607            mov      word ptr [0x7a6], ax
1:1ACF  8b4606            mov      ax, word ptr [bp + 6]
1:1AD2  a3a007            mov      word ptr [0x7a0], ax
1:1AD5  ff36a007          push     word ptr [0x7a0]
1:1AD9  9afa1a0000        lcall    0, 0x1afa  ; @1:KERNEL.GlobalLock
1:1ADE  a3aa07            mov      word ptr [0x7aa], ax
1:1AE1  8916ac07          mov      word ptr [0x7ac], dx
1:1AE5  a1ac07            mov      ax, word ptr [0x7ac]
1:1AE8  0b06aa07          or       ax, word ptr [0x7aa]
1:1AEC  7503              jne      0x1af1
1:1AEE  e9b501            jmp      0x1ca6
1:1AF1  c41eaa07          les      bx, ptr [0x7aa]
1:1AF5  26ff7720          push     word ptr es:[bx + 0x20]
1:1AF9  9a29130000        lcall    0, 0x1329  ; @1:KERNEL.GlobalLock
1:1AFE  a32609            mov      word ptr [0x926], ax
1:1B01  89162809          mov      word ptr [0x928], dx
1:1B05  a12809            mov      ax, word ptr [0x928]
1:1B08  0b062609          or       ax, word ptr [0x926]
1:1B0C  7503              jne      0x1b11
1:1B0E  e98c01            jmp      0x1c9d
1:1B11  8b460a            mov      ax, word ptr [bp + 0xa]
1:1B14  e94f01            jmp      0x1c66
1:1B17  c41eaa07          les      bx, ptr [0x7aa]
1:1B1B  26837f1465        cmp      word ptr es:[bx + 0x14], 0x65
1:1B20  7d03              jge      0x1b25
1:1B22  e91d00            jmp      0x1b42
1:1B25  c41eaa07          les      bx, ptr [0x7aa]
1:1B29  26817f36f400      cmp      word ptr es:[bx + 0x36], 0xf4
1:1B2F  7403              je       0x1b34
1:1B31  e90e00            jmp      0x1b42
1:1B34  c41eaa07          les      bx, ptr [0x7aa]
1:1B38  26837f3878        cmp      word ptr es:[bx + 0x38], 0x78
1:1B3D  7503              jne      0x1b42
1:1B3F  e91100            jmp      0x1b53
1:1B42  c706b8010000      mov      word ptr [0x1b8], 0
1:1B48  c746fc0500        mov      word ptr [bp - 4], 5
1:1B4D  e94001            jmp      0x1c90
1:1B50  e90600            jmp      0x1b59
1:1B53  c706b8010100      mov      word ptr [0x1b8], 1
1:1B59  e93401            jmp      0x1c90
1:1B5C  b85e07            mov      ax, 0x75e
1:1B5F  50                push     ax
1:1B60  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_35(1:1D60)
1:1B65  83c402            add      sp, 2
1:1B68  ff365e07          push     word ptr [0x75e]
1:1B6C  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_34(1:1DEE)
1:1B71  83c402            add      sp, 2
1:1B74  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_33(1:0000)
1:1B79  8946fc            mov      word ptr [bp - 4], ax
1:1B7C  e91101            jmp      0x1c90
1:1B7F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_32(1:0242)
1:1B84  8946fc            mov      word ptr [bp - 4], ax
1:1B87  e90601            jmp      0x1c90
1:1B8A  833eb80100        cmp      word ptr [0x1b8], 0
1:1B8F  7503              jne      0x1b94
1:1B91  e90b00            jmp      0x1b9f
1:1B94  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_31(1:029A)
1:1B99  8946fc            mov      word ptr [bp - 4], ax
1:1B9C  e95500            jmp      0x1bf4
1:1B9F  ff36a607          push     word ptr [0x7a6]
1:1BA3  b800ff            mov      ax, 0xff00
1:1BA6  baff00            mov      dx, 0xff
1:1BA9  52                push     dx
1:1BAA  50                push     ax
1:1BAB  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextColor
1:1BB0  ff36a607          push     word ptr [0x7a6]
1:1BB4  2bc0              sub      ax, ax
1:1BB6  50                push     ax
1:1BB7  50                push     ax
1:1BB8  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkColor
1:1BBD  ff36a607          push     word ptr [0x7a6]
1:1BC1  b80000            mov      ax, 0
1:1BC4  50                push     ax
1:1BC5  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextAlign
1:1BCA  ff36a607          push     word ptr [0x7a6]
1:1BCE  b80100            mov      ax, 1
1:1BD1  50                push     ax
1:1BD2  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkMode
1:1BD7  ff36a607          push     word ptr [0x7a6]
1:1BDB  b80000            mov      ax, 0
1:1BDE  50                push     ax
1:1BDF  50                push     ax
1:1BE0  b8ba01            mov      ax, 0x1ba
1:1BE3  1e                push     ds
1:1BE4  50                push     ax
1:1BE5  50                push     ax
1:1BE6  9a83160000        lcall    0, 0x1683  ; @1:INT:ord_9(1:1D44)
1:1BEB  83c402            add      sp, 2
1:1BEE  50                push     ax
1:1BEF  9affff0000        lcall    0, 0xffff  ; @1:GDI.TextOut
1:1BF4  e99900            jmp      0x1c90
1:1BF7  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_30(1:04BC)
1:1BFC  8946fc            mov      word ptr [bp - 4], ax
1:1BFF  e98e00            jmp      0x1c90
1:1C02  a1b407            mov      ax, word ptr [0x7b4]
1:1C05  c41e2609          les      bx, ptr [0x926]
1:1C09  26894716          mov      word ptr es:[bx + 0x16], ax
1:1C0D  c746f60000        mov      word ptr [bp - 0xa], 0
1:1C12  e90300            jmp      0x1c18
1:1C15  ff46f6            inc      word ptr [bp - 0xa]
1:1C18  837ef604          cmp      word ptr [bp - 0xa], 4
1:1C1C  7c03              jl       0x1c21
1:1C1E  e91400            jmp      0x1c35
1:1C21  8b46f6            mov      ax, word ptr [bp - 0xa]
1:1C24  40                inc      ax
1:1C25  8b76f6            mov      si, word ptr [bp - 0xa]
1:1C28  d1e6              shl      si, 1
1:1C2A  c41e2609          les      bx, ptr [0x926]
1:1C2E  2689400e          mov      word ptr es:[bx + si + 0xe], ax
1:1C32  e9e0ff            jmp      0x1c15
1:1C35  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_29(1:04E2)
1:1C3A  8946fc            mov      word ptr [bp - 4], ax
1:1C3D  e95000            jmp      0x1c90
1:1C40  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_28(1:0503)
1:1C45  8946fc            mov      word ptr [bp - 4], ax
1:1C48  e94500            jmp      0x1c90
1:1C4B  8b460a            mov      ax, word ptr [bp + 0xa]
1:1C4E  2d0700            sub      ax, 7
1:1C51  50                push     ax
1:1C52  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_27(1:0524)
1:1C57  83c402            add      sp, 2
1:1C5A  8946fc            mov      word ptr [bp - 4], ax
1:1C5D  e93000            jmp      0x1c90
1:1C60  e92d00            jmp      0x1c90
1:1C63  e92a00            jmp      0x1c90
1:1C66  3d0c00            cmp      ax, 0xc
1:1C69  7603              jbe      0x1c6e
1:1C6B  e9f2ff            jmp      0x1c60
1:1C6E  d1e0              shl      ax, 1
1:1C70  93                xchg     bx, ax
1:1C71  2effa7761c        jmp      word ptr cs:[bx + 0x1c76]
1:1C76  5c                pop      sp
1:1C77  1b7f1b            sbb      di, word ptr [bx + 0x1b]
1:1C7A  8a1b              mov      bl, byte ptr [bp + di]
1:1C7C  f71b              neg      word ptr [bp + di]
1:1C7E  60                pushaw   
1:1C7F  1c02              sbb      al, 2
1:1C81  1c40              sbb      al, 0x40
1:1C83  1c4b              sbb      al, 0x4b
1:1C85  1c4b              sbb      al, 0x4b
1:1C87  1c4b              sbb      al, 0x4b
1:1C89  1c4b              sbb      al, 0x4b
1:1C8B  1c60              sbb      al, 0x60
1:1C8D  1c17              sbb      al, 0x17
1:1C8F  1bc4              sbb      ax, sp
1:1C91  1e                push     ds
1:1C92  aa                stosb    byte ptr es:[di], al
1:1C93  07                pop      es
1:1C94  26ff7720          push     word ptr es:[bx + 0x20]
1:1C98  9aa21c0000        lcall    0, 0x1ca2  ; @1:KERNEL.GlobalUnlock
1:1C9D  ff36a007          push     word ptr [0x7a0]
1:1CA1  9ad9120000        lcall    0, 0x12d9  ; @1:KERNEL.GlobalUnlock
1:1CA6  8b46fc            mov      ax, word ptr [bp - 4]
1:1CA9  e90000            jmp      0x1cac
1:1CAC  5e                pop      si
1:1CAD  5f                pop      di
1:1CAE  83ed02            sub      bp, 2
1:1CB1  8be5              mov      sp, bp
1:1CB3  1f                pop      ds
1:1CB4  5d                pop      bp
1:1CB5  4d                dec      bp
1:1CB6  ca0600            retf     6
1:1CB9  0000              add      byte ptr [bx + si], al
1:1CBB  0000              add      byte ptr [bx + si], al
1:1CBD  0000              add      byte ptr [bx + si], al
1:1CBF  0000              add      byte ptr [bx + si], al
1:1CC1  0000              add      byte ptr [bx + si], al
1:1CC3  0000              add      byte ptr [bx + si], al
1:1CC5  0000              add      byte ptr [bx + si], al
1:1CC7  0000              add      byte ptr [bx + si], al
1:1CC9  0000              add      byte ptr [bx + si], al
1:1CCB  0000              add      byte ptr [bx + si], al
1:1CCD  0000              add      byte ptr [bx + si], al
1:1CCF  00c3              add      bl, al
1:1CD1  00558b            add      byte ptr [di - 0x75], dl
1:1CD4  ec                in       al, dx
1:1CD5  8bd7              mov      dx, di
1:1CD7  8bde              mov      bx, si
1:1CD9  8cd8              mov      ax, ds
1:1CDB  8ec0              mov      es, ax
1:1CDD  8b7e06            mov      di, word ptr [bp + 6]
1:1CE0  33c0              xor      ax, ax
1:1CE2  b9ffff            mov      cx, 0xffff
1:1CE5  f2ae              repne scasb al, byte ptr es:[di]
1:1CE7  8d75ff            lea      si, [di - 1]
1:1CEA  8b7e08            mov      di, word ptr [bp + 8]
1:1CED  b9ffff            mov      cx, 0xffff
1:1CF0  f2ae              repne scasb al, byte ptr es:[di]
1:1CF2  f7d1              not      cx
1:1CF4  2bf9              sub      di, cx
1:1CF6  87fe              xchg     si, di
1:1CF8  8b4606            mov      ax, word ptr [bp + 6]
1:1CFB  f7c60100          test     si, 1
1:1CFF  7402              je       0x1d03
1:1D01  a4                movsb    byte ptr es:[di], byte ptr [si]
1:1D02  49                dec      cx
1:1D03  d1e9              shr      cx, 1
1:1D05  f3a5              rep movsw word ptr es:[di], word ptr [si]
1:1D07  13c9              adc      cx, cx
1:1D09  f3a4              rep movsb byte ptr es:[di], byte ptr [si]
1:1D0B  8bf3              mov      si, bx
1:1D0D  8bfa              mov      di, dx
1:1D0F  5d                pop      bp
1:1D10  cb                retf     
1:1D11  00558b            add      byte ptr [di - 0x75], dl
1:1D14  ec                in       al, dx
1:1D15  8bd7              mov      dx, di
1:1D17  8bde              mov      bx, si