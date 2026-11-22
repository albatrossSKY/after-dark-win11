File: raw\unpacked\MODULES\3DBOUNCE.AD
Module: 'BLANKER' ('GeoBounce December 28, 1990 by Mouse, recompiled by Tracy w/no debug info')
CS:IP=1:342C  SS:SP=0:0000  AutoDS=2  Heap=4096  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (3): KERNEL, GDI, USER
Segments (2):
  SEG  1: CODE off=0x006A0 len=0x345E min=0x345E flags=0x1D50 relocs=153
  SEG  2: DATA off=0x03D40 len=0x0BDC min=0x0BDC flags=0x0C61 relocs=0
Exports (48):
  ord   1: SEG1:2940 flags=0x03 MODULE
  ord   2: SEG1:2929 flags=0x03 WEP
  ord   3: SEG1:3418 flags=0x03 ___EXPORTEDSTUB
  ord   4: SEG1:23B1 flags=0x00 
  ord   5: SEG1:2B94 flags=0x00 
  ord   6: SEG1:25AD flags=0x00 
  ord   7: SEG1:280E flags=0x00 
  ord   8: SEG1:24B3 flags=0x00 
  ord   9: SEG1:1F14 flags=0x00 
  ord  10: SEG1:15DA flags=0x00 
  ord  11: SEG1:179D flags=0x00 
  ord  12: SEG1:1C98 flags=0x00 
  ord  13: SEG1:1A19 flags=0x00 
  ord  14: SEG1:1613 flags=0x00 
  ord  15: SEG1:1574 flags=0x00 
  ord  16: SEG1:230C flags=0x00 
  ord  17: SEG1:2C86 flags=0x00 
  ord  18: SEG1:2155 flags=0x00 
  ord  19: SEG1:2C48 flags=0x00 
  ord  20: SEG1:2C08 flags=0x00 
  ord  21: SEG1:2C92 flags=0x00 
  ord  22: SEG1:2C7A flags=0x00 
  ord  23: SEG1:2C28 flags=0x00 
  ord  24: SEG1:2BE6 flags=0x00 
  ord  25: SEG1:2BC4 flags=0x00 
  ord  26: SEG1:155F flags=0x00 
  ord  27: SEG1:154B flags=0x00 
  ord  28: SEG1:1522 flags=0x00 
  ord  29: SEG1:0495 flags=0x00 
  ord  30: SEG1:2B02 flags=0x00 
  ord  31: SEG1:042F flags=0x00 
  ord  32: SEG1:044F flags=0x00 
  ord  33: SEG1:016F flags=0x00 
  ord  34: SEG1:2B80 flags=0x00 
  ord  35: SEG1:2B1E flags=0x00 
  ord  36: SEG1:2902 flags=0x00 
  ord  37: SEG1:2C9E flags=0x00 
  ord  38: SEG1:2F82 flags=0x00 
  ord  39: SEG1:2E42 flags=0x00 
  ord  40: SEG1:30B4 flags=0x00 
  ord  41: SEG1:30DC flags=0x00 
  ord  42: SEG1:317E flags=0x00 
  ord  43: SEG1:3142 flags=0x00 
  ord  44: SEG1:31A8 flags=0x00 
  ord  45: SEG1:30E0 flags=0x00 
  ord  46: SEG1:2E5C flags=0x00 
  ord  47: SEG1:334C flags=0x00 
  ord  48: SEG1:3408 flags=0x00 
Resources (7):
  TYPE_1000        #1               off=0x04960 len=   112
  TYPE_1000        #2               off=0x049D0 len=    64
  TYPE_1000        #3               off=0x04A10 len=    64
  TYPE_1000        #4               off=0x04A50 len=    80
  TYPE_2000        #10              off=0x04AA0 len=    80
  TYPE_2000        #20              off=0x04AF0 len=    16
  TYPE_2000        #30              off=0x04B00 len=   224

1:0000  1e                push     ds
1:0001  58                pop      ax
1:0002  90                nop      
1:0003  45                inc      bp
1:0004  55                push     bp
1:0005  8bec              mov      bp, sp
1:0007  1e                push     ds
1:0008  8ed8              mov      ds, ax
1:000A  a0c009            mov      al, byte ptr [0x9c0]
1:000D  98                cwde     
1:000E  e9ae00            jmp      0xbf
1:0011  b004              mov      al, 4
1:0013  a2c109            mov      byte ptr [0x9c1], al
1:0016  a2a809            mov      byte ptr [0x9a8], al
1:0019  c606a00903        mov      byte ptr [0x9a0], 3
1:001E  c706c80a4600      mov      word ptr [0xac8], 0x46
1:0024  c706dc0a3e00      mov      word ptr [0xadc], 0x3e
1:002A  c706a4095a00      mov      word ptr [0x9a4], 0x5a
1:0030  e9a200            jmp      0xd5
1:0033  c606c10906        mov      byte ptr [0x9c1], 6
1:0038  c606a80908        mov      byte ptr [0x9a8], 8
1:003D  c606a00904        mov      byte ptr [0x9a0], 4
1:0042  c706c80a9600      mov      word ptr [0xac8], 0x96
1:0048  c706dc0a8a00      mov      word ptr [0xadc], 0x8a
1:004E  c706a409b400      mov      word ptr [0x9a4], 0xb4
1:0054  eb7f              jmp      0xd5
1:0056  c606c10908        mov      byte ptr [0x9c1], 8
1:005B  c606a80906        mov      byte ptr [0x9a8], 6
1:0060  c606a00903        mov      byte ptr [0x9a0], 3
1:0065  c706c80a2401      mov      word ptr [0xac8], 0x124
1:006B  c706dc0a1401      mov      word ptr [0xadc], 0x114
1:0071  c706a4094c01      mov      word ptr [0x9a4], 0x14c
1:0077  eb5c              jmp      0xd5
1:0079  c606c1090c        mov      byte ptr [0x9c1], 0xc
1:007E  c606a80914        mov      byte ptr [0x9a8], 0x14
1:0083  c606a00905        mov      byte ptr [0x9a0], 5
1:0088  c706c80aac01      mov      word ptr [0xac8], 0x1ac
1:008E  c706dc0a9401      mov      word ptr [0xadc], 0x194
1:0094  c706a409e801      mov      word ptr [0x9a4], 0x1e8
1:009A  eb39              jmp      0xd5
1:009C  c606c10914        mov      byte ptr [0x9c1], 0x14
1:00A1  c606a8090c        mov      byte ptr [0x9a8], 0xc
1:00A6  c606a00903        mov      byte ptr [0x9a0], 3
1:00AB  c706c80a0003      mov      word ptr [0xac8], 0x300
1:00B1  c706dc0ad802      mov      word ptr [0xadc], 0x2d8
1:00B7  c706a4096403      mov      word ptr [0x9a4], 0x364
1:00BD  eb16              jmp      0xd5
1:00BF  0bc0              or       ax, ax
1:00C1  7503              jne      0xc6
1:00C3  e94bff            jmp      0x11
1:00C6  48                dec      ax
1:00C7  7503              jne      0xcc
1:00C9  e967ff            jmp      0x33
1:00CC  48                dec      ax
1:00CD  7487              je       0x56
1:00CF  48                dec      ax
1:00D0  74a7              je       0x79
1:00D2  48                dec      ax
1:00D3  74c7              je       0x9c
1:00D5  4d                dec      bp
1:00D6  4d                dec      bp
1:00D7  8be5              mov      sp, bp
1:00D9  1f                pop      ds
1:00DA  5d                pop      bp
1:00DB  4d                dec      bp
1:00DC  cb                retf     
1:00DD  1e                push     ds
1:00DE  58                pop      ax
1:00DF  90                nop      
1:00E0  45                inc      bp
1:00E1  55                push     bp
1:00E2  8bec              mov      bp, sp
1:00E4  1e                push     ds
1:00E5  8ed8              mov      ds, ax
1:00E7  83ec0c            sub      sp, 0xc
1:00EA  57                push     di
1:00EB  56                push     si
1:00EC  c746fc0000        mov      word ptr [bp - 4], 0
1:00F1  eb51              jmp      0x144
1:00F3  ff46f4            inc      word ptr [bp - 0xc]
1:00F6  837ef410          cmp      word ptr [bp - 0xc], 0x10
1:00FA  7f45              jg       0x141
1:00FC  8b46fa            mov      ax, word ptr [bp - 6]
1:00FF  f76ef4            imul     word ptr [bp - 0xc]
1:0102  b104              mov      cl, 4
1:0104  d3f8              sar      ax, cl
1:0106  2ae4              sub      ah, ah
1:0108  8bd0              mov      dx, ax
1:010A  8b46f6            mov      ax, word ptr [bp - 0xa]
1:010D  8bda              mov      bx, dx
1:010F  f76ef4            imul     word ptr [bp - 0xc]
1:0112  d3f8              sar      ax, cl
1:0114  2ae4              sub      ah, ah
1:0116  8bd0              mov      dx, ax
1:0118  8b46f8            mov      ax, word ptr [bp - 8]
1:011B  8bf2              mov      si, dx
1:011D  f76ef4            imul     word ptr [bp - 0xc]
1:0120  d3f8              sar      ax, cl
1:0122  8ae0              mov      ah, al
1:0124  2ac0              sub      al, al
1:0126  0bf0              or       si, ax
1:0128  53                push     bx
1:0129  56                push     si
1:012A  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateSolidBrush
1:012F  8b5efc            mov      bx, word ptr [bp - 4]
1:0132  b104              mov      cl, 4
1:0134  d3e3              shl      bx, cl
1:0136  035ef4            add      bx, word ptr [bp - 0xc]
1:0139  d1e3              shl      bx, 1
1:013B  8987f40a          mov      word ptr [bx + 0xaf4], ax
1:013F  ebb2              jmp      0xf3
1:0141  ff46fc            inc      word ptr [bp - 4]
1:0144  837efc07          cmp      word ptr [bp - 4], 7
1:0148  7d1b              jge      0x165
1:014A  b80600            mov      ax, 6
1:014D  f76efc            imul     word ptr [bp - 4]
1:0150  8bd8              mov      bx, ax
1:0152  8d7ef6            lea      di, [bp - 0xa]
1:0155  8db71400          lea      si, [bx + 0x14]
1:0159  16                push     ss
1:015A  07                pop      es
1:015B  a5                movsw    word ptr es:[di], word ptr [si]
1:015C  a5                movsw    word ptr es:[di], word ptr [si]
1:015D  a5                movsw    word ptr es:[di], word ptr [si]
1:015E  c746f40100        mov      word ptr [bp - 0xc], 1
1:0163  eb91              jmp      0xf6
1:0165  5e                pop      si
1:0166  5f                pop      di
1:0167  4d                dec      bp
1:0168  4d                dec      bp
1:0169  8be5              mov      sp, bp
1:016B  1f                pop      ds
1:016C  5d                pop      bp
1:016D  4d                dec      bp
1:016E  cb                retf     

; ===== EXPORT:ord_33(#33) =====
1:016F  1e                push     ds
1:0170  58                pop      ax
1:0171  90                nop      
1:0172  45                inc      bp
1:0173  55                push     bp
1:0174  8bec              mov      bp, sp
1:0176  1e                push     ds
1:0177  8ed8              mov      ds, ax
1:0179  83ec2e            sub      sp, 0x2e
1:017C  57                push     di
1:017D  56                push     si
1:017E  ff36a609          push     word ptr [0x9a6]
1:0182  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateCompatibleDC
1:0187  a31000            mov      word ptr [0x10], ax
1:018A  ff36a609          push     word ptr [0x9a6]
1:018E  b87c00            mov      ax, 0x7c
1:0191  50                push     ax
1:0192  50                push     ax
1:0193  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateCompatibleBitmap
1:0198  a31200            mov      word ptr [0x12], ax
1:019B  833e100000        cmp      word ptr [0x10], 0
1:01A0  740e              je       0x1b0
1:01A2  0bc0              or       ax, ax
1:01A4  740a              je       0x1b0
1:01A6  ff361000          push     word ptr [0x10]
1:01AA  50                push     ax
1:01AB  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectObject
1:01B0  c41eee0a          les      bx, ptr [0xaee]
1:01B4  268a4706          mov      al, byte ptr es:[bx + 6]
1:01B8  a2c009            mov      byte ptr [0x9c0], al
1:01BB  0e                push     cs
1:01BC  e841fe            call     0
1:01BF  0e                push     cs
1:01C0  e81aff            call     0xdd
1:01C3  833e120000        cmp      word ptr [0x12], 0
1:01C8  7503              jne      0x1cd
1:01CA  e94c02            jmp      0x419
1:01CD  833e100000        cmp      word ptr [0x10], 0
1:01D2  7407              je       0x1db
1:01D4  833ed40b00        cmp      word ptr [0xbd4], 0
1:01D9  7503              jne      0x1de
1:01DB  e93b02            jmp      0x419
1:01DE  b80400            mov      ax, 4
1:01E1  50                push     ax
1:01E2  9aee010000        lcall    0, 0x1ee  ; @1:GDI.GetStockObject
1:01E7  a3ea0a            mov      word ptr [0xaea], ax
1:01EA  2bc0              sub      ax, ax
1:01EC  50                push     ax
1:01ED  9afa010000        lcall    0, 0x1fa  ; @1:GDI.GetStockObject
1:01F2  a3da0a            mov      word ptr [0xada], ax
1:01F5  b80700            mov      ax, 7
1:01F8  50                push     ax
1:01F9  9a06020000        lcall    0, 0x206  ; @1:GDI.GetStockObject
1:01FE  a3e00a            mov      word ptr [0xae0], ax
1:0201  b80600            mov      ax, 6
1:0204  50                push     ax
1:0205  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:020A  a3b40a            mov      word ptr [0xab4], ax
1:020D  2bc0              sub      ax, ax
1:020F  8946f6            mov      word ptr [bp - 0xa], ax
1:0212  8946f8            mov      word ptr [bp - 8], ax
1:0215  c41eee0a          les      bx, ptr [0xaee]
1:0219  268b4702          mov      ax, word ptr es:[bx + 2]
1:021D  8946fa            mov      word ptr [bp - 6], ax
1:0220  268b4704          mov      ax, word ptr es:[bx + 4]
1:0224  8946fc            mov      word ptr [bp - 4], ax
1:0227  a1b609            mov      ax, word ptr [0x9b6]
1:022A  8b16b809          mov      dx, word ptr [0x9b8]
1:022E  051600            add      ax, 0x16
1:0231  1e                push     ds
1:0232  8d7eda            lea      di, [bp - 0x26]
1:0235  8bf0              mov      si, ax
1:0237  16                push     ss
1:0238  07                pop      es
1:0239  8eda              mov      ds, dx
1:023B  a5                movsw    word ptr es:[di], word ptr [si]
1:023C  a5                movsw    word ptr es:[di], word ptr [si]
1:023D  a5                movsw    word ptr es:[di], word ptr [si]
1:023E  a5                movsw    word ptr es:[di], word ptr [si]
1:023F  1f                pop      ds
1:0240  8b46fa            mov      ax, word ptr [bp - 6]
1:0243  2b46f6            sub      ax, word ptr [bp - 0xa]
1:0246  8946d4            mov      word ptr [bp - 0x2c], ax
1:0249  3d7c00            cmp      ax, 0x7c
1:024C  7413              je       0x261
1:024E  9a78020000        lcall    0, 0x278  ; @1:INT:ord_5(1:2B94)
1:0253  8b4ed4            mov      cx, word ptr [bp - 0x2c]
1:0256  83e97c            sub      cx, 0x7c
1:0259  2bd2              sub      dx, dx
1:025B  f7f1              div      cx
1:025D  8bc2              mov      ax, dx
1:025F  eb02              jmp      0x263
1:0261  2bc0              sub      ax, ax
1:0263  053e00            add      ax, 0x3e
1:0266  8946ec            mov      word ptr [bp - 0x14], ax
1:0269  8b46fc            mov      ax, word ptr [bp - 4]
1:026C  2b46f8            sub      ax, word ptr [bp - 8]
1:026F  8946d2            mov      word ptr [bp - 0x2e], ax
1:0272  3d7c00            cmp      ax, 0x7c
1:0275  7413              je       0x28a
1:0277  9ad7020000        lcall    0, 0x2d7  ; @1:INT:ord_5(1:2B94)
1:027C  8b4ed2            mov      cx, word ptr [bp - 0x2e]
1:027F  83e97c            sub      cx, 0x7c
1:0282  2bd2              sub      dx, dx
1:0284  f7f1              div      cx
1:0286  8bc2              mov      ax, dx
1:0288  eb02              jmp      0x28c
1:028A  2bc0              sub      ax, ax
1:028C  053e00            add      ax, 0x3e
1:028F  8946e6            mov      word ptr [bp - 0x1a], ax
1:0292  8b4eec            mov      cx, word ptr [bp - 0x14]
1:0295  83e93e            sub      cx, 0x3e
1:0298  894eee            mov      word ptr [bp - 0x12], cx
1:029B  8bc8              mov      cx, ax
1:029D  2d3e00            sub      ax, 0x3e
1:02A0  8946f0            mov      word ptr [bp - 0x10], ax
1:02A3  8b46ec            mov      ax, word ptr [bp - 0x14]
1:02A6  053e00            add      ax, 0x3e
1:02A9  8946f2            mov      word ptr [bp - 0xe], ax
1:02AC  83c13e            add      cx, 0x3e
1:02AF  894ef4            mov      word ptr [bp - 0xc], cx
1:02B2  8b46ec            mov      ax, word ptr [bp - 0x14]
1:02B5  c706f20a0000      mov      word ptr [0xaf2], 0
1:02BB  a3f40a            mov      word ptr [0xaf4], ax
1:02BE  8b46e6            mov      ax, word ptr [bp - 0x1a]
1:02C1  c706d60b0000      mov      word ptr [0xbd6], 0
1:02C7  a3d80b            mov      word ptr [0xbd8], ax
1:02CA  c706da0b0100      mov      word ptr [0xbda], 1
1:02D0  b87804            mov      ax, 0x478
1:02D3  99                cdq      
1:02D4  52                push     dx
1:02D5  50                push     ax
1:02D6  9afc020000        lcall    0, 0x2fc  ; @1:INT:ord_5(1:2B94)
1:02DB  b96801            mov      cx, 0x168
1:02DE  2bd2              sub      dx, dx
1:02E0  f7f1              div      cx
1:02E2  2bc0              sub      ax, ax
1:02E4  52                push     dx
1:02E5  50                push     ax
1:02E6  9a0c030000        lcall    0, 0x30c  ; @1:INT:ord_4(1:23B1)
1:02EB  83c408            add      sp, 8
1:02EE  a3aa09            mov      word ptr [0x9aa], ax
1:02F1  8916ac09          mov      word ptr [0x9ac], dx
1:02F5  b87804            mov      ax, 0x478
1:02F8  99                cdq      
1:02F9  52                push     dx
1:02FA  50                push     ax
1:02FB  9a21030000        lcall    0, 0x321  ; @1:INT:ord_5(1:2B94)
1:0300  b96801            mov      cx, 0x168
1:0303  2bd2              sub      dx, dx
1:0305  f7f1              div      cx
1:0307  2bc0              sub      ax, ax
1:0309  52                push     dx
1:030A  50                push     ax
1:030B  9a31030000        lcall    0, 0x331  ; @1:INT:ord_4(1:23B1)
1:0310  83c408            add      sp, 8
1:0313  a3ae09            mov      word ptr [0x9ae], ax
1:0316  8916b009          mov      word ptr [0x9b0], dx
1:031A  b87804            mov      ax, 0x478
1:031D  99                cdq      
1:031E  52                push     dx
1:031F  50                push     ax
1:0320  9a46030000        lcall    0, 0x346  ; @1:INT:ord_5(1:2B94)
1:0325  b96801            mov      cx, 0x168
1:0328  2bd2              sub      dx, dx
1:032A  f7f1              div      cx
1:032C  2bc0              sub      ax, ax
1:032E  52                push     dx
1:032F  50                push     ax
1:0330  9a56030000        lcall    0, 0x356  ; @1:INT:ord_4(1:23B1)
1:0335  83c408            add      sp, 8
1:0338  a3b209            mov      word ptr [0x9b2], ax
1:033B  8916b409          mov      word ptr [0x9b4], dx
1:033F  b87804            mov      ax, 0x478
1:0342  99                cdq      
1:0343  52                push     dx
1:0344  50                push     ax
1:0345  9a6b030000        lcall    0, 0x36b  ; @1:INT:ord_5(1:2B94)
1:034A  b90a00            mov      cx, 0xa
1:034D  2bd2              sub      dx, dx
1:034F  f7f1              div      cx
1:0351  2bc0              sub      ax, ax
1:0353  52                push     dx
1:0354  50                push     ax
1:0355  9a7b030000        lcall    0, 0x37b  ; @1:INT:ord_4(1:23B1)
1:035A  83c408            add      sp, 8
1:035D  a3ca0a            mov      word ptr [0xaca], ax
1:0360  8916cc0a          mov      word ptr [0xacc], dx
1:0364  b87804            mov      ax, 0x478
1:0367  99                cdq      
1:0368  52                push     dx
1:0369  50                push     ax
1:036A  9a90030000        lcall    0, 0x390  ; @1:INT:ord_5(1:2B94)
1:036F  b90a00            mov      cx, 0xa
1:0372  2bd2              sub      dx, dx
1:0374  f7f1              div      cx
1:0376  2bc0              sub      ax, ax
1:0378  52                push     dx
1:0379  50                push     ax
1:037A  9aa0030000        lcall    0, 0x3a0  ; @1:INT:ord_4(1:23B1)
1:037F  83c408            add      sp, 8
1:0382  a3d00a            mov      word ptr [0xad0], ax
1:0385  8916d20a          mov      word ptr [0xad2], dx
1:0389  b87804            mov      ax, 0x478
1:038C  99                cdq      
1:038D  52                push     dx
1:038E  50                push     ax
1:038F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_5(1:2B94)
1:0394  b90a00            mov      cx, 0xa
1:0397  2bd2              sub      dx, dx
1:0399  f7f1              div      cx
1:039B  2bc0              sub      ax, ax
1:039D  52                push     dx
1:039E  50                push     ax
1:039F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_4(1:23B1)
1:03A4  83c408            add      sp, 8
1:03A7  a3d60a            mov      word ptr [0xad6], ax
1:03AA  8916d80a          mov      word ptr [0xad8], dx
1:03AE  2bc0              sub      ax, ax
1:03B0  a3c00a            mov      word ptr [0xac0], ax
1:03B3  a3c20a            mov      word ptr [0xac2], ax
1:03B6  a3c40a            mov      word ptr [0xac4], ax
1:03B9  a3c60a            mov      word ptr [0xac6], ax
1:03BC  b87804            mov      ax, 0x478
1:03BF  99                cdq      
1:03C0  52                push     dx
1:03C1  50                push     ax
1:03C2  9a30060000        lcall    0, 0x630  ; @1:INT:ord_5(1:2B94)
1:03C7  b96801            mov      cx, 0x168
1:03CA  2bd2              sub      dx, dx
1:03CC  f7f1              div      cx
1:03CE  2bc9              sub      cx, cx
1:03D0  8956e2            mov      word ptr [bp - 0x1e], dx
1:03D3  894ee4            mov      word ptr [bp - 0x1c], cx
1:03D6  2bc0              sub      ax, ax
1:03D8  52                push     dx
1:03D9  50                push     ax
1:03DA  9a40060000        lcall    0, 0x640  ; @1:INT:ord_4(1:23B1)
1:03DF  83c408            add      sp, 8
1:03E2  8946e2            mov      word ptr [bp - 0x1e], ax
1:03E5  8956e4            mov      word ptr [bp - 0x1c], dx
1:03E8  051f92            add      ax, 0x921f
1:03EB  83d201            adc      dx, 1
1:03EE  52                push     dx
1:03EF  50                push     ax
1:03F0  9a05040000        lcall    0, 0x405  ; @1:INT:ord_7(1:280E)
1:03F5  5b                pop      bx
1:03F6  5b                pop      bx
1:03F7  a3e40a            mov      word ptr [0xae4], ax
1:03FA  8916e60a          mov      word ptr [0xae6], dx
1:03FE  ff76e4            push     word ptr [bp - 0x1c]
1:0401  ff76e2            push     word ptr [bp - 0x1e]
1:0404  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:280E)
1:0409  5b                pop      bx
1:040A  5b                pop      bx
1:040B  a3bc09            mov      word ptr [0x9bc], ax
1:040E  8916be09          mov      word ptr [0x9be], dx
1:0412  c746ea0000        mov      word ptr [bp - 0x16], 0
1:0417  eb09              jmp      0x422
1:0419  0e                push     cs
1:041A  e87800            call     0x495
1:041D  c746ea0100        mov      word ptr [bp - 0x16], 1
1:0422  8b46ea            mov      ax, word ptr [bp - 0x16]
1:0425  5e                pop      si
1:0426  5f                pop      di
1:0427  4d                dec      bp
1:0428  4d                dec      bp
1:0429  8be5              mov      sp, bp
1:042B  1f                pop      ds
1:042C  5d                pop      bp
1:042D  4d                dec      bp
1:042E  cb                retf     

; ===== EXPORT:ord_31(#31) =====
1:042F  1e                push     ds
1:0430  58                pop      ax
1:0431  90                nop      
1:0432  45                inc      bp
1:0433  55                push     bp
1:0434  8bec              mov      bp, sp
1:0436  1e                push     ds
1:0437  8ed8              mov      ds, ax
1:0439  0e                push     cs
1:043A  e8bc07            call     0xbf9
1:043D  0e                push     cs
1:043E  e8680c            call     0x10a9
1:0441  0e                push     cs
1:0442  e8a30d            call     0x11e8
1:0445  2bc0              sub      ax, ax
1:0447  4d                dec      bp
1:0448  4d                dec      bp
1:0449  8be5              mov      sp, bp
1:044B  1f                pop      ds
1:044C  5d                pop      bp
1:044D  4d                dec      bp
1:044E  cb                retf     

; ===== EXPORT:ord_32(#32) =====
1:044F  1e                push     ds
1:0450  58                pop      ax
1:0451  90                nop      
1:0452  45                inc      bp
1:0453  55                push     bp
1:0454  8bec              mov      bp, sp
1:0456  1e                push     ds
1:0457  8ed8              mov      ds, ax
1:0459  b82008            mov      ax, 0x820
1:045C  1e                push     ds
1:045D  50                push     ax
1:045E  2bc0              sub      ax, ax
1:0460  50                push     ax
1:0461  50                push     ax
1:0462  c41eee0a          les      bx, ptr [0xaee]
1:0466  26ff7702          push     word ptr es:[bx + 2]
1:046A  26ff7704          push     word ptr es:[bx + 4]
1:046E  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:0473  ff36a609          push     word ptr [0x9a6]
1:0477  b82008            mov      ax, 0x820
1:047A  1e                push     ds
1:047B  50                push     ax
1:047C  b80400            mov      ax, 4
1:047F  50                push     ax
1:0480  9ae3010000        lcall    0, 0x1e3  ; @1:GDI.GetStockObject
1:0485  50                push     ax
1:0486  9affff0000        lcall    0, 0xffff  ; @1:USER.FillRect
1:048B  2bc0              sub      ax, ax
1:048D  4d                dec      bp
1:048E  4d                dec      bp
1:048F  8be5              mov      sp, bp
1:0491  1f                pop      ds
1:0492  5d                pop      bp
1:0493  4d                dec      bp
1:0494  cb                retf     

; ===== EXPORT:ord_29(#29) =====
1:0495  1e                push     ds
1:0496  58                pop      ax
1:0497  90                nop      
1:0498  45                inc      bp
1:0499  55                push     bp
1:049A  8bec              mov      bp, sp
1:049C  1e                push     ds
1:049D  8ed8              mov      ds, ax
1:049F  83ec06            sub      sp, 6
1:04A2  0e                push     cs
1:04A3  e8a9ff            call     0x44f
1:04A6  c746fc0000        mov      word ptr [bp - 4], 0
1:04AB  eb2a              jmp      0x4d7
1:04AD  ff46fa            inc      word ptr [bp - 6]
1:04B0  837efa10          cmp      word ptr [bp - 6], 0x10
1:04B4  7d1e              jge      0x4d4
1:04B6  b104              mov      cl, 4
1:04B8  8b5efc            mov      bx, word ptr [bp - 4]
1:04BB  d3e3              shl      bx, cl
1:04BD  035efa            add      bx, word ptr [bp - 6]
1:04C0  d1e3              shl      bx, 1
1:04C2  83bff60a00        cmp      word ptr [bx + 0xaf6], 0
1:04C7  74e4              je       0x4ad
1:04C9  ffb7f60a          push     word ptr [bx + 0xaf6]
1:04CD  9a06050000        lcall    0, 0x506  ; @1:GDI.DeleteObject
1:04D2  ebd9              jmp      0x4ad
1:04D4  ff46fc            inc      word ptr [bp - 4]
1:04D7  837efc07          cmp      word ptr [bp - 4], 7
1:04DB  7d07              jge      0x4e4
1:04DD  c746fa0000        mov      word ptr [bp - 6], 0
1:04E2  ebcc              jmp      0x4b0
1:04E4  833e100000        cmp      word ptr [0x10], 0
1:04E9  7409              je       0x4f4
1:04EB  ff361000          push     word ptr [0x10]
1:04EF  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteDC
1:04F4  c70610000000      mov      word ptr [0x10], 0
1:04FA  833e120000        cmp      word ptr [0x12], 0
1:04FF  7409              je       0x50a
1:0501  ff361200          push     word ptr [0x12]
1:0505  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteObject
1:050A  c70612000000      mov      word ptr [0x12], 0
1:0510  2bc0              sub      ax, ax
1:0512  4d                dec      bp
1:0513  4d                dec      bp
1:0514  8be5              mov      sp, bp
1:0516  1f                pop      ds
1:0517  5d                pop      bp
1:0518  4d                dec      bp
1:0519  cb                retf     
1:051A  1e                push     ds
1:051B  58                pop      ax
1:051C  90                nop      
1:051D  45                inc      bp
1:051E  55                push     bp
1:051F  8bec              mov      bp, sp
1:0521  1e                push     ds
1:0522  8ed8              mov      ds, ax
1:0524  a1c209            mov      ax, word ptr [0x9c2]
1:0527  c70638080000      mov      word ptr [0x838], 0
1:052D  a33a08            mov      word ptr [0x83a], ax
1:0530  c7063008ffff      mov      word ptr [0x830], 0xffff
1:0536  c7063208ff7f      mov      word ptr [0x832], 0x7fff
1:053C  2bc0              sub      ax, ax
1:053E  a32a08            mov      word ptr [0x82a], ax
1:0541  a32808            mov      word ptr [0x828], ax
1:0544  a32e08            mov      word ptr [0x82e], ax
1:0547  a32c08            mov      word ptr [0x82c], ax
1:054A  3906d40a          cmp      word ptr [0xad4], ax
1:054E  7503              jne      0x553
1:0550  e94501            jmp      0x698
1:0553  a33608            mov      word ptr [0x836], ax
1:0556  c7063408c409      mov      word ptr [0x834], 0x9c4
1:055C  eb2b              jmp      0x589
1:055E  a13008            mov      ax, word ptr [0x830]
1:0561  8b163208          mov      dx, word ptr [0x832]
1:0565  8b1e3408          mov      bx, word ptr [0x834]
1:0569  395702            cmp      word ptr [bx + 2], dx
1:056C  7f12              jg       0x580
1:056E  7c04              jl       0x574
1:0570  3907              cmp      word ptr [bx], ax
1:0572  730c              jae      0x580
1:0574  8b07              mov      ax, word ptr [bx]
1:0576  8b5702            mov      dx, word ptr [bx + 2]
1:0579  a33008            mov      word ptr [0x830], ax
1:057C  89163208          mov      word ptr [0x832], dx
1:0580  ff063608          inc      word ptr [0x836]
1:0584  830634080c        add      word ptr [0x834], 0xc
1:0589  a0a809            mov      al, byte ptr [0x9a8]
1:058C  98                cwde     
1:058D  3b063608          cmp      ax, word ptr [0x836]
1:0591  7fcb              jg       0x55e
1:0593  c70636080000      mov      word ptr [0x836], 0
1:0599  c7063408c409      mov      word ptr [0x834], 0x9c4
1:059F  eb40              jmp      0x5e1
1:05A1  a13008            mov      ax, word ptr [0x830]
1:05A4  8b163208          mov      dx, word ptr [0x832]
1:05A8  8b1e3408          mov      bx, word ptr [0x834]
1:05AC  3907              cmp      word ptr [bx], ax
1:05AE  7528              jne      0x5d8
1:05B0  395702            cmp      word ptr [bx + 2], dx
1:05B3  7523              jne      0x5d8
1:05B5  a1b60a            mov      ax, word ptr [0xab6]
1:05B8  8b16b80a          mov      dx, word ptr [0xab8]
1:05BC  2b4704            sub      ax, word ptr [bx + 4]
1:05BF  1b5706            sbb      dx, word ptr [bx + 6]
1:05C2  01062808          add      word ptr [0x828], ax
1:05C6  11162a08          adc      word ptr [0x82a], dx
1:05CA  8b4708            mov      ax, word ptr [bx + 8]
1:05CD  8b570a            mov      dx, word ptr [bx + 0xa]
1:05D0  29062c08          sub      word ptr [0x82c], ax
1:05D4  19162e08          sbb      word ptr [0x82e], dx
1:05D8  ff063608          inc      word ptr [0x836]
1:05DC  830634080c        add      word ptr [0x834], 0xc
1:05E1  a0a809            mov      al, byte ptr [0x9a8]
1:05E4  98                cwde     
1:05E5  3b063608          cmp      ax, word ptr [0x836]
1:05E9  7fb6              jg       0x5a1
1:05EB  ff363a08          push     word ptr [0x83a]
1:05EF  ff363808          push     word ptr [0x838]
1:05F3  ff362a08          push     word ptr [0x82a]
1:05F7  ff362808          push     word ptr [0x828]
1:05FB  9a1b060000        lcall    0, 0x61b  ; @1:INT:ord_6(1:25AD)
1:0600  83c408            add      sp, 8
1:0603  a32808            mov      word ptr [0x828], ax
1:0606  89162a08          mov      word ptr [0x82a], dx
1:060A  ff363a08          push     word ptr [0x83a]
1:060E  ff363808          push     word ptr [0x838]
1:0612  ff362e08          push     word ptr [0x82e]
1:0616  ff362c08          push     word ptr [0x82c]
1:061A  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_6(1:25AD)
1:061F  83c408            add      sp, 8
1:0622  a32c08            mov      word ptr [0x82c], ax
1:0625  89162e08          mov      word ptr [0x82e], dx
1:0629  b87804            mov      ax, 0x478
1:062C  99                cdq      
1:062D  52                push     dx
1:062E  50                push     ax
1:062F  9a55060000        lcall    0, 0x655  ; @1:INT:ord_5(1:2B94)
1:0634  b90a00            mov      cx, 0xa
1:0637  2bd2              sub      dx, dx
1:0639  f7f1              div      cx
1:063B  2bc0              sub      ax, ax
1:063D  52                push     dx
1:063E  50                push     ax
1:063F  9a65060000        lcall    0, 0x665  ; @1:INT:ord_4(1:23B1)
1:0644  83c408            add      sp, 8
1:0647  a3ca0a            mov      word ptr [0xaca], ax
1:064A  8916cc0a          mov      word ptr [0xacc], dx
1:064E  b87804            mov      ax, 0x478
1:0651  99                cdq      
1:0652  52                push     dx
1:0653  50                push     ax
1:0654  9a7a060000        lcall    0, 0x67a  ; @1:INT:ord_5(1:2B94)
1:0659  b90a00            mov      cx, 0xa
1:065C  2bd2              sub      dx, dx
1:065E  f7f1              div      cx
1:0660  2bc0              sub      ax, ax
1:0662  52                push     dx
1:0663  50                push     ax
1:0664  9a8a060000        lcall    0, 0x68a  ; @1:INT:ord_4(1:23B1)
1:0669  83c408            add      sp, 8
1:066C  a3d00a            mov      word ptr [0xad0], ax
1:066F  8916d20a          mov      word ptr [0xad2], dx
1:0673  b87804            mov      ax, 0x478
1:0676  99                cdq      
1:0677  52                push     dx
1:0678  50                push     ax
1:0679  9a4f020000        lcall    0, 0x24f  ; @1:INT:ord_5(1:2B94)
1:067E  b90a00            mov      cx, 0xa
1:0681  2bd2              sub      dx, dx
1:0683  f7f1              div      cx
1:0685  2bc0              sub      ax, ax
1:0687  52                push     dx
1:0688  50                push     ax
1:0689  9ae7020000        lcall    0, 0x2e7  ; @1:INT:ord_4(1:23B1)
1:068E  83c408            add      sp, 8
1:0691  a3d60a            mov      word ptr [0xad6], ax
1:0694  8916d80a          mov      word ptr [0xad8], dx
1:0698  4d                dec      bp
1:0699  4d                dec      bp
1:069A  8be5              mov      sp, bp
1:069C  1f                pop      ds
1:069D  5d                pop      bp
1:069E  4d                dec      bp
1:069F  cb                retf     
1:06A0  1e                push     ds
1:06A1  58                pop      ax
1:06A2  90                nop      
1:06A3  45                inc      bp
1:06A4  55                push     bp
1:06A5  8bec              mov      bp, sp
1:06A7  1e                push     ds
1:06A8  8ed8              mov      ds, ax
1:06AA  a1c209            mov      ax, word ptr [0x9c2]
1:06AD  c7064c080000      mov      word ptr [0x84c], 0
1:06B3  a34e08            mov      word ptr [0x84e], ax
1:06B6  c70644080100      mov      word ptr [0x844], 1
1:06BC  c70646080080      mov      word ptr [0x846], 0x8000
1:06C2  2bc0              sub      ax, ax
1:06C4  a33e08            mov      word ptr [0x83e], ax
1:06C7  a33c08            mov      word ptr [0x83c], ax
1:06CA  a34208            mov      word ptr [0x842], ax
1:06CD  a34008            mov      word ptr [0x840], ax
1:06D0  3906d40a          cmp      word ptr [0xad4], ax
1:06D4  7503              jne      0x6d9
1:06D6  e94501            jmp      0x81e
1:06D9  a34a08            mov      word ptr [0x84a], ax
1:06DC  c7064808c409      mov      word ptr [0x848], 0x9c4
1:06E2  eb2b              jmp      0x70f
1:06E4  a14408            mov      ax, word ptr [0x844]
1:06E7  8b164608          mov      dx, word ptr [0x846]
1:06EB  8b1e4808          mov      bx, word ptr [0x848]
1:06EF  395702            cmp      word ptr [bx + 2], dx
1:06F2  7c12              jl       0x706
1:06F4  7f04              jg       0x6fa
1:06F6  3907              cmp      word ptr [bx], ax
1:06F8  760c              jbe      0x706
1:06FA  8b07              mov      ax, word ptr [bx]
1:06FC  8b5702            mov      dx, word ptr [bx + 2]
1:06FF  a34408            mov      word ptr [0x844], ax
1:0702  89164608          mov      word ptr [0x846], dx
1:0706  ff064a08          inc      word ptr [0x84a]
1:070A  830648080c        add      word ptr [0x848], 0xc
1:070F  a0a809            mov      al, byte ptr [0x9a8]
1:0712  98                cwde     
1:0713  3b064a08          cmp      ax, word ptr [0x84a]
1:0717  7fcb              jg       0x6e4
1:0719  c7064a080000      mov      word ptr [0x84a], 0
1:071F  c7064808c409      mov      word ptr [0x848], 0x9c4
1:0725  eb40              jmp      0x767
1:0727  a14408            mov      ax, word ptr [0x844]
1:072A  8b164608          mov      dx, word ptr [0x846]
1:072E  8b1e4808          mov      bx, word ptr [0x848]
1:0732  3907              cmp      word ptr [bx], ax
1:0734  7528              jne      0x75e
1:0736  395702            cmp      word ptr [bx + 2], dx
1:0739  7523              jne      0x75e
1:073B  a1b60a            mov      ax, word ptr [0xab6]
1:073E  8b16b80a          mov      dx, word ptr [0xab8]
1:0742  2b4704            sub      ax, word ptr [bx + 4]
1:0745  1b5706            sbb      dx, word ptr [bx + 6]
1:0748  01063c08          add      word ptr [0x83c], ax
1:074C  11163e08          adc      word ptr [0x83e], dx
1:0750  8b4708            mov      ax, word ptr [bx + 8]
1:0753  8b570a            mov      dx, word ptr [bx + 0xa]
1:0756  29064008          sub      word ptr [0x840], ax
1:075A  19164208          sbb      word ptr [0x842], dx
1:075E  ff064a08          inc      word ptr [0x84a]
1:0762  830648080c        add      word ptr [0x848], 0xc
1:0767  a0a809            mov      al, byte ptr [0x9a8]
1:076A  98                cwde     
1:076B  3b064a08          cmp      ax, word ptr [0x84a]
1:076F  7fb6              jg       0x727
1:0771  ff364e08          push     word ptr [0x84e]
1:0775  ff364c08          push     word ptr [0x84c]
1:0779  ff363e08          push     word ptr [0x83e]
1:077D  ff363c08          push     word ptr [0x83c]
1:0781  9aa1070000        lcall    0, 0x7a1  ; @1:INT:ord_6(1:25AD)
1:0786  83c408            add      sp, 8
1:0789  a33c08            mov      word ptr [0x83c], ax
1:078C  89163e08          mov      word ptr [0x83e], dx
1:0790  ff364e08          push     word ptr [0x84e]
1:0794  ff364c08          push     word ptr [0x84c]
1:0798  ff364208          push     word ptr [0x842]
1:079C  ff364008          push     word ptr [0x840]
1:07A0  9a0a090000        lcall    0, 0x90a  ; @1:INT:ord_6(1:25AD)
1:07A5  83c408            add      sp, 8
1:07A8  a34008            mov      word ptr [0x840], ax
1:07AB  89164208          mov      word ptr [0x842], dx
1:07AF  b87804            mov      ax, 0x478
1:07B2  99                cdq      
1:07B3  52                push     dx
1:07B4  50                push     ax
1:07B5  9adb070000        lcall    0, 0x7db  ; @1:INT:ord_5(1:2B94)
1:07BA  b90a00            mov      cx, 0xa
1:07BD  2bd2              sub      dx, dx
1:07BF  f7f1              div      cx
1:07C1  2bc0              sub      ax, ax
1:07C3  52                push     dx
1:07C4  50                push     ax
1:07C5  9aeb070000        lcall    0, 0x7eb  ; @1:INT:ord_4(1:23B1)
1:07CA  83c408            add      sp, 8
1:07CD  a3ca0a            mov      word ptr [0xaca], ax
1:07D0  8916cc0a          mov      word ptr [0xacc], dx
1:07D4  b87804            mov      ax, 0x478
1:07D7  99                cdq      
1:07D8  52                push     dx
1:07D9  50                push     ax
1:07DA  9a00080000        lcall    0, 0x800  ; @1:INT:ord_5(1:2B94)
1:07DF  b90a00            mov      cx, 0xa
1:07E2  2bd2              sub      dx, dx
1:07E4  f7f1              div      cx
1:07E6  2bc0              sub      ax, ax
1:07E8  52                push     dx
1:07E9  50                push     ax
1:07EA  9a10080000        lcall    0, 0x810  ; @1:INT:ord_4(1:23B1)
1:07EF  83c408            add      sp, 8
1:07F2  a3d00a            mov      word ptr [0xad0], ax
1:07F5  8916d20a          mov      word ptr [0xad2], dx
1:07F9  b87804            mov      ax, 0x478
1:07FC  99                cdq      
1:07FD  52                push     dx
1:07FE  50                push     ax
1:07FF  9a3e090000        lcall    0, 0x93e  ; @1:INT:ord_5(1:2B94)
1:0804  b90a00            mov      cx, 0xa
1:0807  2bd2              sub      dx, dx
1:0809  f7f1              div      cx
1:080B  2bc0              sub      ax, ax
1:080D  52                push     dx
1:080E  50                push     ax
1:080F  9a4e090000        lcall    0, 0x94e  ; @1:INT:ord_4(1:23B1)
1:0814  83c408            add      sp, 8
1:0817  a3d60a            mov      word ptr [0xad6], ax
1:081A  8916d80a          mov      word ptr [0xad8], dx
1:081E  4d                dec      bp
1:081F  4d                dec      bp
1:0820  8be5              mov      sp, bp
1:0822  1f                pop      ds
1:0823  5d                pop      bp
1:0824  4d                dec      bp
1:0825  cb                retf     
1:0826  1e                push     ds
1:0827  58                pop      ax
1:0828  90                nop      
1:0829  45                inc      bp
1:082A  55                push     bp
1:082B  8bec              mov      bp, sp
1:082D  1e                push     ds
1:082E  8ed8              mov      ds, ax
1:0830  a1c209            mov      ax, word ptr [0x9c2]
1:0833  c70660080000      mov      word ptr [0x860], 0
1:0839  a36208            mov      word ptr [0x862], ax
1:083C  c7065808ffff      mov      word ptr [0x858], 0xffff
1:0842  c7065a08ff7f      mov      word ptr [0x85a], 0x7fff
1:0848  2bc0              sub      ax, ax
1:084A  a35208            mov      word ptr [0x852], ax
1:084D  a35008            mov      word ptr [0x850], ax
1:0850  a35608            mov      word ptr [0x856], ax
1:0853  a35408            mov      word ptr [0x854], ax
1:0856  3906d40a          cmp      word ptr [0xad4], ax
1:085A  7503              jne      0x85f
1:085C  e94701            jmp      0x9a6
1:085F  a35e08            mov      word ptr [0x85e], ax
1:0862  c7065c08c409      mov      word ptr [0x85c], 0x9c4
1:0868  eb2d              jmp      0x897
1:086A  a15808            mov      ax, word ptr [0x858]
1:086D  8b165a08          mov      dx, word ptr [0x85a]
1:0871  8b1e5c08          mov      bx, word ptr [0x85c]
1:0875  395706            cmp      word ptr [bx + 6], dx
1:0878  7f14              jg       0x88e
1:087A  7c05              jl       0x881
1:087C  394704            cmp      word ptr [bx + 4], ax
1:087F  730d              jae      0x88e
1:0881  8b4704            mov      ax, word ptr [bx + 4]
1:0884  8b5706            mov      dx, word ptr [bx + 6]
1:0887  a35808            mov      word ptr [0x858], ax
1:088A  89165a08          mov      word ptr [0x85a], dx
1:088E  ff065e08          inc      word ptr [0x85e]
1:0892  83065c080c        add      word ptr [0x85c], 0xc
1:0897  a0a809            mov      al, byte ptr [0x9a8]
1:089A  98                cwde     
1:089B  3b065e08          cmp      ax, word ptr [0x85e]
1:089F  7fc9              jg       0x86a
1:08A1  c7065e080000      mov      word ptr [0x85e], 0
1:08A7  c7065c08c409      mov      word ptr [0x85c], 0x9c4
1:08AD  eb40              jmp      0x8ef
1:08AF  a15808            mov      ax, word ptr [0x858]
1:08B2  8b165a08          mov      dx, word ptr [0x85a]
1:08B6  8b1e5c08          mov      bx, word ptr [0x85c]
1:08BA  394704            cmp      word ptr [bx + 4], ax
1:08BD  7527              jne      0x8e6
1:08BF  395706            cmp      word ptr [bx + 6], dx
1:08C2  7522              jne      0x8e6
1:08C4  a1b60a            mov      ax, word ptr [0xab6]
1:08C7  8b16b80a          mov      dx, word ptr [0xab8]
1:08CB  2b07              sub      ax, word ptr [bx]
1:08CD  1b5702            sbb      dx, word ptr [bx + 2]
1:08D0  01065008          add      word ptr [0x850], ax
1:08D4  11165208          adc      word ptr [0x852], dx
1:08D8  8b4708            mov      ax, word ptr [bx + 8]
1:08DB  8b570a            mov      dx, word ptr [bx + 0xa]
1:08DE  29065408          sub      word ptr [0x854], ax
1:08E2  19165608          sbb      word ptr [0x856], dx
1:08E6  ff065e08          inc      word ptr [0x85e]
1:08EA  83065c080c        add      word ptr [0x85c], 0xc
1:08EF  a0a809            mov      al, byte ptr [0x9a8]
1:08F2  98                cwde     
1:08F3  3b065e08          cmp      ax, word ptr [0x85e]
1:08F7  7fb6              jg       0x8af
1:08F9  ff366208          push     word ptr [0x862]
1:08FD  ff366008          push     word ptr [0x860]
1:0901  ff365208          push     word ptr [0x852]
1:0905  ff365008          push     word ptr [0x850]
1:0909  9a29090000        lcall    0, 0x929  ; @1:INT:ord_6(1:25AD)
1:090E  83c408            add      sp, 8
1:0911  a35008            mov      word ptr [0x850], ax
1:0914  89165208          mov      word ptr [0x852], dx
1:0918  ff366208          push     word ptr [0x862]
1:091C  ff366008          push     word ptr [0x860]
1:0920  ff365608          push     word ptr [0x856]
1:0924  ff365408          push     word ptr [0x854]
1:0928  9a920a0000        lcall    0, 0xa92  ; @1:INT:ord_6(1:25AD)
1:092D  83c408            add      sp, 8
1:0930  a35408            mov      word ptr [0x854], ax
1:0933  89165608          mov      word ptr [0x856], dx
1:0937  b87804            mov      ax, 0x478
1:093A  99                cdq      
1:093B  52                push     dx
1:093C  50                push     ax
1:093D  9a63090000        lcall    0, 0x963  ; @1:INT:ord_5(1:2B94)
1:0942  b90a00            mov      cx, 0xa
1:0945  2bd2              sub      dx, dx
1:0947  f7f1              div      cx
1:0949  2bc0              sub      ax, ax
1:094B  52                push     dx
1:094C  50                push     ax
1:094D  9a73090000        lcall    0, 0x973  ; @1:INT:ord_4(1:23B1)
1:0952  83c408            add      sp, 8
1:0955  a3ca0a            mov      word ptr [0xaca], ax
1:0958  8916cc0a          mov      word ptr [0xacc], dx
1:095C  b87804            mov      ax, 0x478
1:095F  99                cdq      
1:0960  52                push     dx
1:0961  50                push     ax
1:0962  9a88090000        lcall    0, 0x988  ; @1:INT:ord_5(1:2B94)
1:0967  b90a00            mov      cx, 0xa
1:096A  2bd2              sub      dx, dx
1:096C  f7f1              div      cx
1:096E  2bc0              sub      ax, ax
1:0970  52                push     dx
1:0971  50                push     ax
1:0972  9a98090000        lcall    0, 0x998  ; @1:INT:ord_4(1:23B1)
1:0977  83c408            add      sp, 8
1:097A  a3d00a            mov      word ptr [0xad0], ax
1:097D  8916d20a          mov      word ptr [0xad2], dx
1:0981  b87804            mov      ax, 0x478
1:0984  99                cdq      
1:0985  52                push     dx
1:0986  50                push     ax
1:0987  9ac60a0000        lcall    0, 0xac6  ; @1:INT:ord_5(1:2B94)
1:098C  b90a00            mov      cx, 0xa
1:098F  2bd2              sub      dx, dx
1:0991  f7f1              div      cx
1:0993  2bc0              sub      ax, ax
1:0995  52                push     dx
1:0996  50                push     ax
1:0997  9ad60a0000        lcall    0, 0xad6  ; @1:INT:ord_4(1:23B1)
1:099C  83c408            add      sp, 8
1:099F  a3d60a            mov      word ptr [0xad6], ax
1:09A2  8916d80a          mov      word ptr [0xad8], dx
1:09A6  4d                dec      bp
1:09A7  4d                dec      bp
1:09A8  8be5              mov      sp, bp
1:09AA  1f                pop      ds
1:09AB  5d                pop      bp
1:09AC  4d                dec      bp
1:09AD  cb                retf     
1:09AE  1e                push     ds
1:09AF  58                pop      ax
1:09B0  90                nop      
1:09B1  45                inc      bp
1:09B2  55                push     bp
1:09B3  8bec              mov      bp, sp
1:09B5  1e                push     ds
1:09B6  8ed8              mov      ds, ax
1:09B8  a1c209            mov      ax, word ptr [0x9c2]
1:09BB  c70674080000      mov      word ptr [0x874], 0
1:09C1  a37608            mov      word ptr [0x876], ax
1:09C4  c7066c080100      mov      word ptr [0x86c], 1
1:09CA  c7066e080080      mov      word ptr [0x86e], 0x8000
1:09D0  2bc0              sub      ax, ax
1:09D2  a36608            mov      word ptr [0x866], ax
1:09D5  a36408            mov      word ptr [0x864], ax
1:09D8  a36a08            mov      word ptr [0x86a], ax
1:09DB  a36808            mov      word ptr [0x868], ax
1:09DE  3906d40a          cmp      word ptr [0xad4], ax
1:09E2  7503              jne      0x9e7
1:09E4  e94701            jmp      0xb2e
1:09E7  a37208            mov      word ptr [0x872], ax
1:09EA  c7067008c409      mov      word ptr [0x870], 0x9c4
1:09F0  eb2d              jmp      0xa1f
1:09F2  a16c08            mov      ax, word ptr [0x86c]
1:09F5  8b166e08          mov      dx, word ptr [0x86e]
1:09F9  8b1e7008          mov      bx, word ptr [0x870]
1:09FD  395706            cmp      word ptr [bx + 6], dx
1:0A00  7c14              jl       0xa16
1:0A02  7f05              jg       0xa09
1:0A04  394704            cmp      word ptr [bx + 4], ax
1:0A07  760d              jbe      0xa16
1:0A09  8b4704            mov      ax, word ptr [bx + 4]
1:0A0C  8b5706            mov      dx, word ptr [bx + 6]
1:0A0F  a36c08            mov      word ptr [0x86c], ax
1:0A12  89166e08          mov      word ptr [0x86e], dx
1:0A16  ff067208          inc      word ptr [0x872]
1:0A1A  830670080c        add      word ptr [0x870], 0xc
1:0A1F  a0a809            mov      al, byte ptr [0x9a8]
1:0A22  98                cwde     
1:0A23  3b067208          cmp      ax, word ptr [0x872]
1:0A27  7fc9              jg       0x9f2
1:0A29  c70672080000      mov      word ptr [0x872], 0
1:0A2F  c7067008c409      mov      word ptr [0x870], 0x9c4
1:0A35  eb40              jmp      0xa77
1:0A37  a16c08            mov      ax, word ptr [0x86c]
1:0A3A  8b166e08          mov      dx, word ptr [0x86e]
1:0A3E  8b1e7008          mov      bx, word ptr [0x870]
1:0A42  394704            cmp      word ptr [bx + 4], ax
1:0A45  7527              jne      0xa6e
1:0A47  395706            cmp      word ptr [bx + 6], dx
1:0A4A  7522              jne      0xa6e
1:0A4C  a1b60a            mov      ax, word ptr [0xab6]
1:0A4F  8b16b80a          mov      dx, word ptr [0xab8]
1:0A53  2b07              sub      ax, word ptr [bx]
1:0A55  1b5702            sbb      dx, word ptr [bx + 2]
1:0A58  01066408          add      word ptr [0x864], ax
1:0A5C  11166608          adc      word ptr [0x866], dx
1:0A60  8b4708            mov      ax, word ptr [bx + 8]
1:0A63  8b570a            mov      dx, word ptr [bx + 0xa]
1:0A66  29066808          sub      word ptr [0x868], ax
1:0A6A  19166a08          sbb      word ptr [0x86a], dx
1:0A6E  ff067208          inc      word ptr [0x872]
1:0A72  830670080c        add      word ptr [0x870], 0xc
1:0A77  a0a809            mov      al, byte ptr [0x9a8]
1:0A7A  98                cwde     
1:0A7B  3b067208          cmp      ax, word ptr [0x872]
1:0A7F  7fb6              jg       0xa37
1:0A81  ff367608          push     word ptr [0x876]
1:0A85  ff367408          push     word ptr [0x874]
1:0A89  ff366608          push     word ptr [0x866]
1:0A8D  ff366408          push     word ptr [0x864]
1:0A91  9ab10a0000        lcall    0, 0xab1  ; @1:INT:ord_6(1:25AD)
1:0A96  83c408            add      sp, 8
1:0A99  a36408            mov      word ptr [0x864], ax
1:0A9C  89166608          mov      word ptr [0x866], dx
1:0AA0  ff367608          push     word ptr [0x876]
1:0AA4  ff367408          push     word ptr [0x874]
1:0AA8  ff366a08          push     word ptr [0x86a]
1:0AAC  ff366808          push     word ptr [0x868]
1:0AB0  9afc050000        lcall    0, 0x5fc  ; @1:INT:ord_6(1:25AD)
1:0AB5  83c408            add      sp, 8
1:0AB8  a36808            mov      word ptr [0x868], ax
1:0ABB  89166a08          mov      word ptr [0x86a], dx
1:0ABF  b87804            mov      ax, 0x478
1:0AC2  99                cdq      
1:0AC3  52                push     dx
1:0AC4  50                push     ax
1:0AC5  9ac3030000        lcall    0, 0x3c3  ; @1:INT:ord_5(1:2B94)
1:0ACA  b90a00            mov      cx, 0xa
1:0ACD  2bd2              sub      dx, dx
1:0ACF  f7f1              div      cx
1:0AD1  2bc0              sub      ax, ax
1:0AD3  52                push     dx
1:0AD4  50                push     ax
1:0AD5  9adb030000        lcall    0, 0x3db  ; @1:INT:ord_4(1:23B1)
1:0ADA  83c408            add      sp, 8
1:0ADD  a3ca0a            mov      word ptr [0xaca], ax
1:0AE0  8916cc0a          mov      word ptr [0xacc], dx
1:0AE4  b87804            mov      ax, 0x478
1:0AE7  99                cdq      
1:0AE8  52                push     dx
1:0AE9  50                push     ax
1:0AEA  9a100b0000        lcall    0, 0xb10  ; @1:INT:ord_5(1:2B94)
1:0AEF  b90a00            mov      cx, 0xa
1:0AF2  2bd2              sub      dx, dx
1:0AF4  f7f1              div      cx
1:0AF6  2bc0              sub      ax, ax
1:0AF8  52                push     dx
1:0AF9  50                push     ax
1:0AFA  9a200b0000        lcall    0, 0xb20  ; @1:INT:ord_4(1:23B1)
1:0AFF  83c408            add      sp, 8
1:0B02  a3d00a            mov      word ptr [0xad0], ax
1:0B05  8916d20a          mov      word ptr [0xad2], dx
1:0B09  b87804            mov      ax, 0x478
1:0B0C  99                cdq      
1:0B0D  52                push     dx
1:0B0E  50                push     ax
1:0B0F  9ab6070000        lcall    0, 0x7b6  ; @1:INT:ord_5(1:2B94)
1:0B14  b90a00            mov      cx, 0xa
1:0B17  2bd2              sub      dx, dx
1:0B19  f7f1              div      cx
1:0B1B  2bc0              sub      ax, ax
1:0B1D  52                push     dx
1:0B1E  50                push     ax
1:0B1F  9ac6070000        lcall    0, 0x7c6  ; @1:INT:ord_4(1:23B1)
1:0B24  83c408            add      sp, 8
1:0B27  a3d60a            mov      word ptr [0xad6], ax
1:0B2A  8916d80a          mov      word ptr [0xad8], dx
1:0B2E  4d                dec      bp
1:0B2F  4d                dec      bp
1:0B30  8be5              mov      sp, bp
1:0B32  1f                pop      ds
1:0B33  5d                pop      bp
1:0B34  4d                dec      bp
1:0B35  cb                retf     
1:0B36  1e                push     ds
1:0B37  58                pop      ax
1:0B38  90                nop      
1:0B39  45                inc      bp
1:0B3A  55                push     bp
1:0B3B  8bec              mov      bp, sp
1:0B3D  1e                push     ds
1:0B3E  8ed8              mov      ds, ax
1:0B40  56                push     si
1:0B41  8b5e06            mov      bx, word ptr [bp + 6]
1:0B44  8b4706            mov      ax, word ptr [bx + 6]
1:0B47  c436b609          les      si, ptr [0x9b6]
1:0B4B  2639441c          cmp      word ptr es:[si + 0x1c], ax
1:0B4F  7e1e              jle      0xb6f
1:0B51  8b4702            mov      ax, word ptr [bx + 2]
1:0B54  26394418          cmp      word ptr es:[si + 0x18], ax
1:0B58  7d15              jge      0xb6f
1:0B5A  8b4704            mov      ax, word ptr [bx + 4]
1:0B5D  2639441a          cmp      word ptr es:[si + 0x1a], ax
1:0B61  7e0c              jle      0xb6f
1:0B63  8b07              mov      ax, word ptr [bx]
1:0B65  26394416          cmp      word ptr es:[si + 0x16], ax
1:0B69  7d04              jge      0xb6f
1:0B6B  2bc0              sub      ax, ax
1:0B6D  eb24              jmp      0xb93
1:0B6F  837f0600          cmp      word ptr [bx + 6], 0
1:0B73  7cf6              jl       0xb6b
1:0B75  8b4702            mov      ax, word ptr [bx + 2]
1:0B78  c436ee0a          les      si, ptr [0xaee]
1:0B7C  26394404          cmp      word ptr es:[si + 4], ax
1:0B80  7ce9              jl       0xb6b
1:0B82  837f0400          cmp      word ptr [bx + 4], 0
1:0B86  7ce3              jl       0xb6b
1:0B88  8b07              mov      ax, word ptr [bx]
1:0B8A  26394402          cmp      word ptr es:[si + 2], ax
1:0B8E  7cdb              jl       0xb6b
1:0B90  b80100            mov      ax, 1
1:0B93  5e                pop      si
1:0B94  4d                dec      bp
1:0B95  4d                dec      bp
1:0B96  8be5              mov      sp, bp
1:0B98  1f                pop      ds
1:0B99  5d                pop      bp
1:0B9A  4d                dec      bp
1:0B9B  cb                retf     
1:0B9C  1e                push     ds
1:0B9D  58                pop      ax
1:0B9E  90                nop      
1:0B9F  45                inc      bp
1:0BA0  55                push     bp
1:0BA1  8bec              mov      bp, sp
1:0BA3  1e                push     ds
1:0BA4  8ed8              mov      ds, ax
1:0BA6  8b4608            mov      ax, word ptr [bp + 8]
1:0BA9  c41eb609          les      bx, ptr [0x9b6]
1:0BAD  2639471c          cmp      word ptr es:[bx + 0x1c], ax
1:0BB1  7e19              jle      0xbcc
1:0BB3  26394718          cmp      word ptr es:[bx + 0x18], ax
1:0BB7  7d13              jge      0xbcc
1:0BB9  8b4606            mov      ax, word ptr [bp + 6]
1:0BBC  2639471a          cmp      word ptr es:[bx + 0x1a], ax
1:0BC0  7e0a              jle      0xbcc
1:0BC2  26394716          cmp      word ptr es:[bx + 0x16], ax
1:0BC6  7d04              jge      0xbcc
1:0BC8  2bc0              sub      ax, ax
1:0BCA  eb25              jmp      0xbf1
1:0BCC  837e0800          cmp      word ptr [bp + 8], 0
1:0BD0  7cf6              jl       0xbc8
1:0BD2  8b4608            mov      ax, word ptr [bp + 8]
1:0BD5  c41eee0a          les      bx, ptr [0xaee]
1:0BD9  26394704          cmp      word ptr es:[bx + 4], ax
1:0BDD  7ce9              jl       0xbc8
1:0BDF  837e0600          cmp      word ptr [bp + 6], 0
1:0BE3  7ce3              jl       0xbc8
1:0BE5  8b4606            mov      ax, word ptr [bp + 6]
1:0BE8  26394702          cmp      word ptr es:[bx + 2], ax
1:0BEC  7cda              jl       0xbc8
1:0BEE  b80100            mov      ax, 1
1:0BF1  4d                dec      bp
1:0BF2  4d                dec      bp
1:0BF3  8be5              mov      sp, bp
1:0BF5  1f                pop      ds
1:0BF6  5d                pop      bp
1:0BF7  4d                dec      bp
1:0BF8  cb                retf     
1:0BF9  1e                push     ds
1:0BFA  58                pop      ax
1:0BFB  90                nop      
1:0BFC  45                inc      bp
1:0BFD  55                push     bp
1:0BFE  8bec              mov      bp, sp
1:0C00  1e                push     ds
1:0C01  8ed8              mov      ds, ax
1:0C03  83ec2c            sub      sp, 0x2c
1:0C06  c41eee0a          les      bx, ptr [0xaee]
1:0C0A  268b470a          mov      ax, word ptr es:[bx + 0xa]
1:0C0E  b90500            mov      cx, 5
1:0C11  99                cdq      
1:0C12  f7f9              idiv     cx
1:0C14  c746e40000        mov      word ptr [bp - 0x1c], 0
1:0C19  8946e6            mov      word ptr [bp - 0x1a], ax
1:0C1C  a1e40a            mov      ax, word ptr [0xae4]
1:0C1F  8b16e60a          mov      dx, word ptr [0xae6]
1:0C23  8946fa            mov      word ptr [bp - 6], ax
1:0C26  8956fc            mov      word ptr [bp - 4], dx
1:0C29  a1bc09            mov      ax, word ptr [0x9bc]
1:0C2C  8b16be09          mov      dx, word ptr [0x9be]
1:0C30  8946e0            mov      word ptr [bp - 0x20], ax
1:0C33  8956e2            mov      word ptr [bp - 0x1e], dx
1:0C36  2bc0              sub      ax, ax
1:0C38  8946ee            mov      word ptr [bp - 0x12], ax
1:0C3B  8946f0            mov      word ptr [bp - 0x10], ax
1:0C3E  8946e8            mov      word ptr [bp - 0x18], ax
1:0C41  a0c009            mov      al, byte ptr [0x9c0]
1:0C44  98                cwde     
1:0C45  26394706          cmp      word ptr es:[bx + 6], ax
1:0C49  740b              je       0xc56
1:0C4B  268a4706          mov      al, byte ptr es:[bx + 6]
1:0C4F  a2c009            mov      byte ptr [0x9c0], al
1:0C52  0e                push     cs
1:0C53  e8aaf3            call     0
1:0C56  a1ca0a            mov      ax, word ptr [0xaca]
1:0C59  8b16cc0a          mov      dx, word ptr [0xacc]
1:0C5D  0106aa09          add      word ptr [0x9aa], ax
1:0C61  1116ac09          adc      word ptr [0x9ac], dx
1:0C65  a1aa09            mov      ax, word ptr [0x9aa]
1:0C68  8b16ac09          mov      dx, word ptr [0x9ac]
1:0C6C  0bd2              or       dx, dx
1:0C6E  7d0f              jge      0xc7f
1:0C70  05c048            add      ax, 0x48c0
1:0C73  83d206            adc      dx, 6
1:0C76  a3aa09            mov      word ptr [0x9aa], ax
1:0C79  8916ac09          mov      word ptr [0x9ac], dx
1:0C7D  eb17              jmp      0xc96
1:0C7F  83fa06            cmp      dx, 6
1:0C82  7c12              jl       0xc96
1:0C84  7f05              jg       0xc8b
1:0C86  3dc048            cmp      ax, 0x48c0
1:0C89  720b              jb       0xc96
1:0C8B  812eaa09c048      sub      word ptr [0x9aa], 0x48c0
1:0C91  831eac0906        sbb      word ptr [0x9ac], 6
1:0C96  a1d00a            mov      ax, word ptr [0xad0]
1:0C99  8b16d20a          mov      dx, word ptr [0xad2]
1:0C9D  0106ae09          add      word ptr [0x9ae], ax
1:0CA1  1116b009          adc      word ptr [0x9b0], dx
1:0CA5  a1ae09            mov      ax, word ptr [0x9ae]
1:0CA8  8b16b009          mov      dx, word ptr [0x9b0]
1:0CAC  0bd2              or       dx, dx
1:0CAE  7d0f              jge      0xcbf
1:0CB0  05c048            add      ax, 0x48c0
1:0CB3  83d206            adc      dx, 6
1:0CB6  a3ae09            mov      word ptr [0x9ae], ax
1:0CB9  8916b009          mov      word ptr [0x9b0], dx
1:0CBD  eb17              jmp      0xcd6
1:0CBF  83fa06            cmp      dx, 6
1:0CC2  7c12              jl       0xcd6
1:0CC4  7f05              jg       0xccb
1:0CC6  3dc048            cmp      ax, 0x48c0
1:0CC9  720b              jb       0xcd6
1:0CCB  812eae09c048      sub      word ptr [0x9ae], 0x48c0
1:0CD1  831eb00906        sbb      word ptr [0x9b0], 6
1:0CD6  a1d60a            mov      ax, word ptr [0xad6]
1:0CD9  8b16d80a          mov      dx, word ptr [0xad8]
1:0CDD  0106b209          add      word ptr [0x9b2], ax
1:0CE1  1116b409          adc      word ptr [0x9b4], dx
1:0CE5  a1b209            mov      ax, word ptr [0x9b2]
1:0CE8  8b16b409          mov      dx, word ptr [0x9b4]
1:0CEC  0bd2              or       dx, dx
1:0CEE  7d0f              jge      0xcff
1:0CF0  05c048            add      ax, 0x48c0
1:0CF3  83d206            adc      dx, 6
1:0CF6  a3b209            mov      word ptr [0x9b2], ax
1:0CF9  8916b409          mov      word ptr [0x9b4], dx
1:0CFD  eb17              jmp      0xd16
1:0CFF  83fa06            cmp      dx, 6
1:0D02  7c12              jl       0xd16
1:0D04  7f05              jg       0xd0b
1:0D06  3dc048            cmp      ax, 0x48c0
1:0D09  720b              jb       0xd16
1:0D0B  812eb209c048      sub      word ptr [0x9b2], 0x48c0
1:0D11  831eb40906        sbb      word ptr [0x9b4], 6
1:0D16  ff36e60a          push     word ptr [0xae6]
1:0D1A  ff36e40a          push     word ptr [0xae4]
1:0D1E  ff76e6            push     word ptr [bp - 0x1a]
1:0D21  ff76e4            push     word ptr [bp - 0x1c]
1:0D24  9a430d0000        lcall    0, 0xd43  ; @1:INT:ord_8(1:24B3)
1:0D29  83c408            add      sp, 8
1:0D2C  0106f20a          add      word ptr [0xaf2], ax
1:0D30  1116f40a          adc      word ptr [0xaf4], dx
1:0D34  ff36be09          push     word ptr [0x9be]
1:0D38  ff36bc09          push     word ptr [0x9bc]
1:0D3C  ff76e6            push     word ptr [bp - 0x1a]
1:0D3F  ff76e4            push     word ptr [bp - 0x1c]
1:0D42  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:24B3)
1:0D47  83c408            add      sp, 8
1:0D4A  0106d60b          add      word ptr [0xbd6], ax
1:0D4E  1116d80b          adc      word ptr [0xbd8], dx
1:0D52  c41eee0a          les      bx, ptr [0xaee]
1:0D56  268b4708          mov      ax, word ptr es:[bx + 8]
1:0D5A  050b00            add      ax, 0xb
1:0D5D  b92800            mov      cx, 0x28
1:0D60  f7e9              imul     cx
1:0D62  a3c209            mov      word ptr [0x9c2], ax
1:0D65  b96f00            mov      cx, 0x6f
1:0D68  99                cdq      
1:0D69  f7f9              idiv     cx
1:0D6B  a3c209            mov      word ptr [0x9c2], ax
1:0D6E  3d0100            cmp      ax, 1
1:0D71  7d06              jge      0xd79
1:0D73  c706c2090100      mov      word ptr [0x9c2], 1
1:0D79  a1f40a            mov      ax, word ptr [0xaf4]
1:0D7C  8b0ed80b          mov      cx, word ptr [0xbd8]
1:0D80  2bd2              sub      dx, dx
1:0D82  89167a08          mov      word ptr [0x87a], dx
1:0D86  89167808          mov      word ptr [0x878], dx
1:0D8A  268b5702          mov      dx, word ptr es:[bx + 2]
1:0D8E  89167c08          mov      word ptr [0x87c], dx
1:0D92  268b5704          mov      dx, word ptr es:[bx + 4]
1:0D96  89167e08          mov      word ptr [0x87e], dx
1:0D9A  2b0ec209          sub      cx, word ptr [0x9c2]
1:0D9E  890e8208          mov      word ptr [0x882], cx
1:0DA2  2b06c209          sub      ax, word ptr [0x9c2]
1:0DA6  a38008            mov      word ptr [0x880], ax
1:0DA9  8b16c209          mov      dx, word ptr [0x9c2]
1:0DAD  d1e2              shl      dx, 1
1:0DAF  03ca              add      cx, dx
1:0DB1  890e8608          mov      word ptr [0x886], cx
1:0DB5  03d0              add      dx, ax
1:0DB7  89168408          mov      word ptr [0x884], dx
1:0DBB  b88008            mov      ax, 0x880
1:0DBE  50                push     ax
1:0DBF  0e                push     cs
1:0DC0  e873fd            call     0xb36
1:0DC3  5b                pop      bx
1:0DC4  0bc0              or       ax, ax
1:0DC6  7403              je       0xdcb
1:0DC8  e9c300            jmp      0xe8e
1:0DCB  a18408            mov      ax, word ptr [0x884]
1:0DCE  39067c08          cmp      word ptr [0x87c], ax
1:0DD2  7d25              jge      0xdf9
1:0DD4  a1e40a            mov      ax, word ptr [0xae4]
1:0DD7  8b16e60a          mov      dx, word ptr [0xae6]
1:0DDB  0bd2              or       dx, dx
1:0DDD  7d07              jge      0xde6
1:0DDF  f7d8              neg      ax
1:0DE1  83d200            adc      dx, 0
1:0DE4  f7da              neg      dx
1:0DE6  f7d8              neg      ax
1:0DE8  83d200            adc      dx, 0
1:0DEB  f7da              neg      dx
1:0DED  a3e40a            mov      word ptr [0xae4], ax
1:0DF0  8916e60a          mov      word ptr [0xae6], dx
1:0DF4  c746ee0100        mov      word ptr [bp - 0x12], 1
1:0DF9  a18008            mov      ax, word ptr [0x880]
1:0DFC  39067808          cmp      word ptr [0x878], ax
1:0E00  7e1e              jle      0xe20
1:0E02  a1e40a            mov      ax, word ptr [0xae4]
1:0E05  8b16e60a          mov      dx, word ptr [0xae6]
1:0E09  0bd2              or       dx, dx
1:0E0B  7d07              jge      0xe14
1:0E0D  f7d8              neg      ax
1:0E0F  83d200            adc      dx, 0
1:0E12  f7da              neg      dx
1:0E14  a3e40a            mov      word ptr [0xae4], ax
1:0E17  8916e60a          mov      word ptr [0xae6], dx
1:0E1B  c746ee0100        mov      word ptr [bp - 0x12], 1
1:0E20  a18608            mov      ax, word ptr [0x886]
1:0E23  39067e08          cmp      word ptr [0x87e], ax
1:0E27  7d25              jge      0xe4e
1:0E29  a1bc09            mov      ax, word ptr [0x9bc]
1:0E2C  8b16be09          mov      dx, word ptr [0x9be]
1:0E30  0bd2              or       dx, dx
1:0E32  7d07              jge      0xe3b
1:0E34  f7d8              neg      ax
1:0E36  83d200            adc      dx, 0
1:0E39  f7da              neg      dx
1:0E3B  f7d8              neg      ax
1:0E3D  83d200            adc      dx, 0
1:0E40  f7da              neg      dx
1:0E42  a3bc09            mov      word ptr [0x9bc], ax
1:0E45  8916be09          mov      word ptr [0x9be], dx
1:0E49  c746ee0100        mov      word ptr [bp - 0x12], 1
1:0E4E  a18208            mov      ax, word ptr [0x882]
1:0E51  39067a08          cmp      word ptr [0x87a], ax
1:0E55  7e1e              jle      0xe75
1:0E57  a1bc09            mov      ax, word ptr [0x9bc]
1:0E5A  8b16be09          mov      dx, word ptr [0x9be]
1:0E5E  0bd2              or       dx, dx
1:0E60  7d07              jge      0xe69
1:0E62  f7d8              neg      ax
1:0E64  83d200            adc      dx, 0
1:0E67  f7da              neg      dx
1:0E69  a3bc09            mov      word ptr [0x9bc], ax
1:0E6C  8916be09          mov      word ptr [0x9be], dx
1:0E70  c746ee0100        mov      word ptr [bp - 0x12], 1
1:0E75  837eee00          cmp      word ptr [bp - 0x12], 0
1:0E79  7403              je       0xe7e
1:0E7B  e90701            jmp      0xf85
1:0E7E  f71ee40a          neg      word ptr [0xae4]
1:0E82  8316e60a00        adc      word ptr [0xae6], 0
1:0E87  f71ee60a          neg      word ptr [0xae6]
1:0E8B  e9ea00            jmp      0xf78
1:0E8E  a18408            mov      ax, word ptr [0x884]
1:0E91  03068008          add      ax, word ptr [0x880]
1:0E95  99                cdq      
1:0E96  2bc2              sub      ax, dx
1:0E98  d1f8              sar      ax, 1
1:0E9A  8946dc            mov      word ptr [bp - 0x24], ax
1:0E9D  a18608            mov      ax, word ptr [0x886]
1:0EA0  03068208          add      ax, word ptr [0x882]
1:0EA4  99                cdq      
1:0EA5  2bc2              sub      ax, dx
1:0EA7  d1f8              sar      ax, 1
1:0EA9  8946f8            mov      word ptr [bp - 8], ax
1:0EAC  8946d8            mov      word ptr [bp - 0x28], ax
1:0EAF  a18208            mov      ax, word ptr [0x882]
1:0EB2  8b0e8008          mov      cx, word ptr [0x880]
1:0EB6  894ed6            mov      word ptr [bp - 0x2a], cx
1:0EB9  8b0e8608          mov      cx, word ptr [0x886]
1:0EBD  894ede            mov      word ptr [bp - 0x22], cx
1:0EC0  8b0e8408          mov      cx, word ptr [0x884]
1:0EC4  894ef6            mov      word ptr [bp - 0xa], cx
1:0EC7  50                push     ax
1:0EC8  ff76dc            push     word ptr [bp - 0x24]
1:0ECB  0e                push     cs
1:0ECC  e8cdfc            call     0xb9c
1:0ECF  5b                pop      bx
1:0ED0  5b                pop      bx
1:0ED1  0bc0              or       ax, ax
1:0ED3  7503              jne      0xed8
1:0ED5  ff46e8            inc      word ptr [bp - 0x18]
1:0ED8  ff76d8            push     word ptr [bp - 0x28]
1:0EDB  ff76d6            push     word ptr [bp - 0x2a]
1:0EDE  0e                push     cs
1:0EDF  e8bafc            call     0xb9c
1:0EE2  5b                pop      bx
1:0EE3  5b                pop      bx
1:0EE4  0bc0              or       ax, ax
1:0EE6  7503              jne      0xeeb
1:0EE8  ff46f0            inc      word ptr [bp - 0x10]
1:0EEB  ff76de            push     word ptr [bp - 0x22]
1:0EEE  ff76dc            push     word ptr [bp - 0x24]
1:0EF1  0e                push     cs
1:0EF2  e8a7fc            call     0xb9c
1:0EF5  5b                pop      bx
1:0EF6  5b                pop      bx
1:0EF7  0bc0              or       ax, ax
1:0EF9  7503              jne      0xefe
1:0EFB  ff4ee8            dec      word ptr [bp - 0x18]
1:0EFE  ff76f8            push     word ptr [bp - 8]
1:0F01  ff76f6            push     word ptr [bp - 0xa]
1:0F04  0e                push     cs
1:0F05  e894fc            call     0xb9c
1:0F08  5b                pop      bx
1:0F09  5b                pop      bx
1:0F0A  0bc0              or       ax, ax
1:0F0C  7503              jne      0xf11
1:0F0E  ff4ef0            dec      word ptr [bp - 0x10]
1:0F11  837ef000          cmp      word ptr [bp - 0x10], 0
1:0F15  7e0d              jle      0xf24
1:0F17  833ee60a00        cmp      word ptr [0xae6], 0
1:0F1C  7d06              jge      0xf24
1:0F1E  0e                push     cs
1:0F1F  e8f8f5            call     0x51a
1:0F22  eb1a              jmp      0xf3e
1:0F24  837ef000          cmp      word ptr [bp - 0x10], 0
1:0F28  7d21              jge      0xf4b
1:0F2A  833ee60a00        cmp      word ptr [0xae6], 0
1:0F2F  7c1a              jl       0xf4b
1:0F31  7f07              jg       0xf3a
1:0F33  833ee40a00        cmp      word ptr [0xae4], 0
1:0F38  7411              je       0xf4b
1:0F3A  0e                push     cs
1:0F3B  e862f7            call     0x6a0
1:0F3E  f71ee40a          neg      word ptr [0xae4]
1:0F42  8316e60a00        adc      word ptr [0xae6], 0
1:0F47  f71ee60a          neg      word ptr [0xae6]
1:0F4B  837ee800          cmp      word ptr [bp - 0x18], 0
1:0F4F  7e0d              jle      0xf5e
1:0F51  833ebe0900        cmp      word ptr [0x9be], 0
1:0F56  7d06              jge      0xf5e
1:0F58  0e                push     cs
1:0F59  e8caf8            call     0x826
1:0F5C  eb1a              jmp      0xf78
1:0F5E  837ee800          cmp      word ptr [bp - 0x18], 0
1:0F62  7d21              jge      0xf85
1:0F64  833ebe0900        cmp      word ptr [0x9be], 0
1:0F69  7c1a              jl       0xf85
1:0F6B  7f07              jg       0xf74
1:0F6D  833ebc0900        cmp      word ptr [0x9bc], 0
1:0F72  7411              je       0xf85
1:0F74  0e                push     cs
1:0F75  e836fa            call     0x9ae
1:0F78  f71ebc09          neg      word ptr [0x9bc]
1:0F7C  8316be0900        adc      word ptr [0x9be], 0
1:0F81  f71ebe09          neg      word ptr [0x9be]
1:0F85  8b46e0            mov      ax, word ptr [bp - 0x20]
1:0F88  8b56e2            mov      dx, word ptr [bp - 0x1e]
1:0F8B  3906bc09          cmp      word ptr [0x9bc], ax
1:0F8F  751b              jne      0xfac
1:0F91  3916be09          cmp      word ptr [0x9be], dx
1:0F95  7515              jne      0xfac
1:0F97  8b46fa            mov      ax, word ptr [bp - 6]
1:0F9A  8b56fc            mov      dx, word ptr [bp - 4]
1:0F9D  3906e40a          cmp      word ptr [0xae4], ax
1:0FA1  7509              jne      0xfac
1:0FA3  3916e60a          cmp      word ptr [0xae6], dx
1:0FA7  7503              jne      0xfac
1:0FA9  e9c400            jmp      0x1070
1:0FAC  8b46e0            mov      ax, word ptr [bp - 0x20]
1:0FAF  8b56e2            mov      dx, word ptr [bp - 0x1e]
1:0FB2  3906bc09          cmp      word ptr [0x9bc], ax
1:0FB6  7506              jne      0xfbe
1:0FB8  3916be09          cmp      word ptr [0x9be], dx
1:0FBC  741a              je       0xfd8
1:0FBE  8b46fa            mov      ax, word ptr [bp - 6]
1:0FC1  8b56fc            mov      dx, word ptr [bp - 4]
1:0FC4  3906e40a          cmp      word ptr [0xae4], ax
1:0FC8  7506              jne      0xfd0
1:0FCA  3916e60a          cmp      word ptr [0xae6], dx
1:0FCE  7408              je       0xfd8
1:0FD0  8106ba0ab400      add      word ptr [0xaba], 0xb4
1:0FD6  eb29              jmp      0x1001
1:0FD8  8b46e0            mov      ax, word ptr [bp - 0x20]
1:0FDB  8b56e2            mov      dx, word ptr [bp - 0x1e]
1:0FDE  3906bc09          cmp      word ptr [0x9bc], ax
1:0FE2  7506              jne      0xfea
1:0FE4  3916be09          cmp      word ptr [0x9be], dx
1:0FE8  7405              je       0xfef
1:0FEA  b86801            mov      ax, 0x168
1:0FED  eb03              jmp      0xff2
1:0FEF  b8b400            mov      ax, 0xb4
1:0FF2  2b06ba0a          sub      ax, word ptr [0xaba]
1:0FF6  a3ba0a            mov      word ptr [0xaba], ax
1:0FF9  eb06              jmp      0x1001
1:0FFB  8106ba0a6801      add      word ptr [0xaba], 0x168
1:1001  833eba0a00        cmp      word ptr [0xaba], 0
1:1006  7cf3              jl       0xffb
1:1008  eb06              jmp      0x1010
1:100A  812eba0a6801      sub      word ptr [0xaba], 0x168
1:1010  813eba0a6801      cmp      word ptr [0xaba], 0x168
1:1016  7df2              jge      0x100a
1:1018  9aeb0a0000        lcall    0, 0xaeb  ; @1:INT:ord_5(1:2B94)
1:101D  b90f00            mov      cx, 0xf
1:1020  2bd2              sub      dx, dx
1:1022  f7f1              div      cx
1:1024  83ea07            sub      dx, 7
1:1027  0116ba0a          add      word ptr [0xaba], dx
1:102B  b87804            mov      ax, 0x478
1:102E  99                cdq      
1:102F  52                push     dx
1:1030  50                push     ax
1:1031  a1ba0a            mov      ax, word ptr [0xaba]
1:1034  2bc9              sub      cx, cx
1:1036  50                push     ax
1:1037  51                push     cx
1:1038  9afb0a0000        lcall    0, 0xafb  ; @1:INT:ord_4(1:23B1)
1:103D  83c408            add      sp, 8
1:1040  8946f2            mov      word ptr [bp - 0xe], ax
1:1043  8956f4            mov      word ptr [bp - 0xc], dx
1:1046  051f92            add      ax, 0x921f
1:1049  83d201            adc      dx, 1
1:104C  52                push     dx
1:104D  50                push     ax
1:104E  9a63100000        lcall    0, 0x1063  ; @1:INT:ord_7(1:280E)
1:1053  5b                pop      bx
1:1054  5b                pop      bx
1:1055  a3e40a            mov      word ptr [0xae4], ax
1:1058  8916e60a          mov      word ptr [0xae6], dx
1:105C  ff76f4            push     word ptr [bp - 0xc]
1:105F  ff76f2            push     word ptr [bp - 0xe]
1:1062  9af1030000        lcall    0, 0x3f1  ; @1:INT:ord_7(1:280E)
1:1067  5b                pop      bx
1:1068  5b                pop      bx
1:1069  a3bc09            mov      word ptr [0x9bc], ax
1:106C  8916be09          mov      word ptr [0x9be], dx
1:1070  4d                dec      bp
1:1071  4d                dec      bp
1:1072  8be5              mov      sp, bp
1:1074  1f                pop      ds
1:1075  5d                pop      bp
1:1076  4d                dec      bp
1:1077  cb                retf     
1:1078  1e                push     ds
1:1079  58                pop      ax
1:107A  90                nop      
1:107B  45                inc      bp
1:107C  55                push     bp
1:107D  8bec              mov      bp, sp
1:107F  1e                push     ds
1:1080  8ed8              mov      ds, ax
1:1082  83ec04            sub      sp, 4
1:1085  eb10              jmp      0x1097
1:1087  8b5e06            mov      bx, word ptr [bp + 6]
1:108A  ff4606            inc      word ptr [bp + 6]
1:108D  8a07              mov      al, byte ptr [bx]
1:108F  8b5e08            mov      bx, word ptr [bp + 8]
1:1092  ff4608            inc      word ptr [bp + 8]
1:1095  8807              mov      byte ptr [bx], al
1:1097  8b460a            mov      ax, word ptr [bp + 0xa]
1:109A  ff4e0a            dec      word ptr [bp + 0xa]
1:109D  0bc0              or       ax, ax
1:109F  75e6              jne      0x1087
1:10A1  4d                dec      bp
1:10A2  4d                dec      bp
1:10A3  8be5              mov      sp, bp
1:10A5  1f                pop      ds
1:10A6  5d                pop      bp
1:10A7  4d                dec      bp
1:10A8  cb                retf     
1:10A9  1e                push     ds
1:10AA  58                pop      ax
1:10AB  90                nop      
1:10AC  45                inc      bp
1:10AD  55                push     bp
1:10AE  8bec              mov      bp, sp
1:10B0  1e                push     ds
1:10B1  8ed8              mov      ds, ax
1:10B3  83ec0c            sub      sp, 0xc
1:10B6  a1c209            mov      ax, word ptr [0x9c2]
1:10B9  d1e0              shl      ax, 1
1:10BB  c746f40000        mov      word ptr [bp - 0xc], 0
1:10C0  8946f6            mov      word ptr [bp - 0xa], ax
1:10C3  b88808            mov      ax, 0x888
1:10C6  50                push     ax
1:10C7  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_15(1:1574)
1:10CC  5b                pop      bx
1:10CD  ff76f6            push     word ptr [bp - 0xa]
1:10D0  ff76f4            push     word ptr [bp - 0xc]
1:10D3  ff76f6            push     word ptr [bp - 0xa]
1:10D6  ff76f4            push     word ptr [bp - 0xc]
1:10D9  ff76f6            push     word ptr [bp - 0xa]
1:10DC  ff76f4            push     word ptr [bp - 0xc]
1:10DF  b88808            mov      ax, 0x888
1:10E2  50                push     ax
1:10E3  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_14(1:1613)
1:10E8  83c40e            add      sp, 0xe
1:10EB  ff36ac09          push     word ptr [0x9ac]
1:10EF  ff36aa09          push     word ptr [0x9aa]
1:10F3  b88808            mov      ax, 0x888
1:10F6  50                push     ax
1:10F7  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_13(1:1A19)
1:10FC  83c406            add      sp, 6
1:10FF  ff36b009          push     word ptr [0x9b0]
1:1103  ff36ae09          push     word ptr [0x9ae]
1:1107  b88808            mov      ax, 0x888
1:110A  50                push     ax
1:110B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:1C98)
1:1110  83c406            add      sp, 6
1:1113  ff36b409          push     word ptr [0x9b4]
1:1117  ff36b209          push     word ptr [0x9b2]
1:111B  b88808            mov      ax, 0x888
1:111E  50                push     ax
1:111F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:179D)
1:1124  83c406            add      sp, 6
1:1127  2bc0              sub      ax, ax
1:1129  50                push     ax
1:112A  50                push     ax
1:112B  ba3e00            mov      dx, 0x3e
1:112E  8946fa            mov      word ptr [bp - 6], ax
1:1131  8956fc            mov      word ptr [bp - 4], dx
1:1134  52                push     dx
1:1135  50                push     ax
1:1136  52                push     dx
1:1137  50                push     ax
1:1138  b88808            mov      ax, 0x888
1:113B  50                push     ax
1:113C  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:15DA)
1:1141  83c40e            add      sp, 0xe
1:1144  b00c              mov      al, 0xc
1:1146  f62ea809          imul     byte ptr [0x9a8]
1:114A  50                push     ax
1:114B  b8c409            mov      ax, 0x9c4
1:114E  50                push     ax
1:114F  ff36a409          push     word ptr [0x9a4]
1:1153  0e                push     cs
1:1154  e821ff            call     0x1078
1:1157  83c406            add      sp, 6
1:115A  c746f80000        mov      word ptr [bp - 8], 0
1:115F  eb18              jmp      0x1179
1:1161  b88808            mov      ax, 0x888
1:1164  50                push     ax
1:1165  b80c00            mov      ax, 0xc
1:1168  f76ef8            imul     word ptr [bp - 8]
1:116B  05c409            add      ax, 0x9c4
1:116E  50                push     ax
1:116F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:1F14)
1:1174  5b                pop      bx
1:1175  5b                pop      bx
1:1176  ff46f8            inc      word ptr [bp - 8]
1:1179  a0a809            mov      al, byte ptr [0x9a8]
1:117C  98                cwde     
1:117D  3b46f8            cmp      ax, word ptr [bp - 8]
1:1180  7fdf              jg       0x1161
1:1182  c706d40a0100      mov      word ptr [0xad4], 1
1:1188  8b46fa            mov      ax, word ptr [bp - 6]
1:118B  8b56fc            mov      dx, word ptr [bp - 4]
1:118E  a3b60a            mov      word ptr [0xab6], ax
1:1191  8916b80a          mov      word ptr [0xab8], dx
1:1195  4d                dec      bp
1:1196  4d                dec      bp
1:1197  8be5              mov      sp, bp
1:1199  1f                pop      ds
1:119A  5d                pop      bp
1:119B  4d                dec      bp
1:119C  cb                retf     
1:119D  1e                push     ds
1:119E  58                pop      ax
1:119F  90                nop      
1:11A0  45                inc      bp
1:11A1  55                push     bp
1:11A2  8bec              mov      bp, sp
1:11A4  1e                push     ds
1:11A5  8ed8              mov      ds, ax
1:11A7  8b5e06            mov      bx, word ptr [bp + 6]
1:11AA  8b4702            mov      ax, word ptr [bx + 2]
1:11AD  3b460a            cmp      ax, word ptr [bp + 0xa]
1:11B0  7e03              jle      0x11b5
1:11B2  8b460a            mov      ax, word ptr [bp + 0xa]
1:11B5  894702            mov      word ptr [bx + 2], ax
1:11B8  8b07              mov      ax, word ptr [bx]
1:11BA  3b4608            cmp      ax, word ptr [bp + 8]
1:11BD  7e03              jle      0x11c2
1:11BF  8b4608            mov      ax, word ptr [bp + 8]
1:11C2  8907              mov      word ptr [bx], ax
1:11C4  8b4706            mov      ax, word ptr [bx + 6]
1:11C7  3b460a            cmp      ax, word ptr [bp + 0xa]
1:11CA  7d03              jge      0x11cf
1:11CC  8b460a            mov      ax, word ptr [bp + 0xa]
1:11CF  894706            mov      word ptr [bx + 6], ax
1:11D2  8b4704            mov      ax, word ptr [bx + 4]
1:11D5  3b4608            cmp      ax, word ptr [bp + 8]
1:11D8  7d03              jge      0x11dd
1:11DA  8b4608            mov      ax, word ptr [bp + 8]
1:11DD  894704            mov      word ptr [bx + 4], ax
1:11E0  4d                dec      bp
1:11E1  4d                dec      bp
1:11E2  8be5              mov      sp, bp
1:11E4  1f                pop      ds
1:11E5  5d                pop      bp
1:11E6  4d                dec      bp
1:11E7  cb                retf     
1:11E8  1e                push     ds
1:11E9  58                pop      ax
1:11EA  90                nop      
1:11EB  45                inc      bp
1:11EC  55                push     bp
1:11ED  8bec              mov      bp, sp
1:11EF  1e                push     ds
1:11F0  8ed8              mov      ds, ax
1:11F2  83ec28            sub      sp, 0x28
1:11F5  57                push     di
1:11F6  56                push     si
1:11F7  c41eb609          les      bx, ptr [0x9b6]
1:11FB  26837f0a04        cmp      word ptr es:[bx + 0xa], 4
1:1200  7c0e              jl       0x1210
1:1202  c41eee0a          les      bx, ptr [0xaee]
1:1206  26837f0c01        cmp      word ptr es:[bx + 0xc], 1
1:120B  1bc0              sbb      ax, ax
1:120D  40                inc      ax
1:120E  eb02              jmp      0x1212
1:1210  2bc0              sub      ax, ax
1:1212  8946fc            mov      word ptr [bp - 4], ax
1:1215  c41eb609          les      bx, ptr [0x9b6]
1:1219  26837f0a04        cmp      word ptr es:[bx + 0xa], 4
1:121E  7c0b              jl       0x122b
1:1220  c41eee0a          les      bx, ptr [0xaee]
1:1224  26837f0c01        cmp      word ptr es:[bx + 0xc], 1
1:1229  7464              je       0x128f
1:122B  b80100            mov      ax, 1
1:122E  8946ec            mov      word ptr [bp - 0x14], ax
1:1231  b82e09            mov      ax, 0x92e
1:1234  1e                push     ds
1:1235  50                push     ax
1:1236  2bc0              sub      ax, ax
1:1238  50                push     ax
1:1239  50                push     ax
1:123A  b97c00            mov      cx, 0x7c
1:123D  51                push     cx
1:123E  51                push     cx
1:123F  9a6f040000        lcall    0, 0x46f  ; @1:USER.SetRect
1:1244  ff361000          push     word ptr [0x10]
1:1248  b82e09            mov      ax, 0x92e
1:124B  1e                push     ds
1:124C  50                push     ax
1:124D  ff36ea0a          push     word ptr [0xaea]
1:1251  9a87040000        lcall    0, 0x487  ; @1:USER.FillRect
1:1256  ff361000          push     word ptr [0x10]
1:125A  ff36ea0a          push     word ptr [0xaea]
1:125E  9a6f120000        lcall    0, 0x126f  ; @1:GDI.SelectObject
1:1263  8946e4            mov      word ptr [bp - 0x1c], ax
1:1266  ff361000          push     word ptr [0x10]
1:126A  ff36e00a          push     word ptr [0xae0]
1:126E  9a8f130000        lcall    0, 0x138f  ; @1:GDI.SelectObject
1:1273  8946e8            mov      word ptr [bp - 0x18], ax
1:1276  b8007d            mov      ax, 0x7d00
1:1279  a33609            mov      word ptr [0x936], ax
1:127C  a33809            mov      word ptr [0x938], ax
1:127F  b80083            mov      ax, 0x8300
1:1282  a33c09            mov      word ptr [0x93c], ax
1:1285  a33a09            mov      word ptr [0x93a], ax
1:1288  c746ea0000        mov      word ptr [bp - 0x16], 0
1:128D  eb26              jmp      0x12b5
1:128F  2bc0              sub      ax, ax
1:1291  eb9b              jmp      0x122e
1:1293  b80c00            mov      ax, 0xc
1:1296  f76eea            imul     word ptr [bp - 0x16]
1:1299  8bd8              mov      bx, ax
1:129B  8b87c609          mov      ax, word ptr [bx + 0x9c6]
1:129F  8b76ea            mov      si, word ptr [bp - 0x16]
1:12A2  d1e6              shl      si, 1
1:12A4  d1e6              shl      si, 1
1:12A6  8984dc08          mov      word ptr [si + 0x8dc], ax
1:12AA  8b87ca09          mov      ax, word ptr [bx + 0x9ca]
1:12AE  8984de08          mov      word ptr [si + 0x8de], ax
1:12B2  ff46ea            inc      word ptr [bp - 0x16]
1:12B5  a0a809            mov      al, byte ptr [0x9a8]
1:12B8  98                cwde     
1:12B9  3b46ea            cmp      ax, word ptr [bp - 0x16]
1:12BC  7fd5              jg       0x1293
1:12BE  c746ea0000        mov      word ptr [bp - 0x16], 0
1:12C3  e9e300            jmp      0x13a9
1:12C6  b80500            mov      ax, 5
1:12C9  f76eea            imul     word ptr [bp - 0x16]
1:12CC  8bd8              mov      bx, ax
1:12CE  031ec80a          add      bx, word ptr [0xac8]
1:12D2  8b76e6            mov      si, word ptr [bp - 0x1a]
1:12D5  8a00              mov      al, byte ptr [bx + si]
1:12D7  98                cwde     
1:12D8  8bd8              mov      bx, ax
1:12DA  891e3e09          mov      word ptr [0x93e], bx
1:12DE  d1e3              shl      bx, 1
1:12E0  d1e3              shl      bx, 1
1:12E2  8b87dc08          mov      ax, word ptr [bx + 0x8dc]
1:12E6  8b97de08          mov      dx, word ptr [bx + 0x8de]
1:12EA  d1e6              shl      si, 1
1:12EC  d1e6              shl      si, 1
1:12EE  8984c008          mov      word ptr [si + 0x8c0], ax
1:12F2  8994c208          mov      word ptr [si + 0x8c2], dx
1:12F6  52                push     dx
1:12F7  50                push     ax
1:12F8  b83609            mov      ax, 0x936
1:12FB  50                push     ax
1:12FC  0e                push     cs
1:12FD  e89dfe            call     0x119d
1:1300  83c406            add      sp, 6
1:1303  ff46e6            inc      word ptr [bp - 0x1a]
1:1306  a0a009            mov      al, byte ptr [0x9a0]
1:1309  98                cwde     
1:130A  3b46e6            cmp      ax, word ptr [bp - 0x1a]
1:130D  7fb7              jg       0x12c6
1:130F  b84009            mov      ax, 0x940
1:1312  50                push     ax
1:1313  b8f403            mov      ax, 0x3f4
1:1316  50                push     ax
1:1317  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_18(1:2155)
1:131C  5b                pop      bx
1:131D  5b                pop      bx
1:131E  8946ee            mov      word ptr [bp - 0x12], ax
1:1321  8956f0            mov      word ptr [bp - 0x10], dx
1:1324  0bd2              or       dx, dx
1:1326  7d08              jge      0x1330
1:1328  2bc0              sub      ax, ax
1:132A  8946f0            mov      word ptr [bp - 0x10], ax
1:132D  8946ee            mov      word ptr [bp - 0x12], ax
1:1330  8146ee0027        add      word ptr [bp - 0x12], 0x2700
1:1335  8356f000          adc      word ptr [bp - 0x10], 0
1:1339  837ef001          cmp      word ptr [bp - 0x10], 1
1:133D  7c0a              jl       0x1349
1:133F  c746eeffff        mov      word ptr [bp - 0x12], 0xffff
1:1344  c746f00000        mov      word ptr [bp - 0x10], 0
1:1349  837efc00          cmp      word ptr [bp - 4], 0
1:134D  740d              je       0x135c
1:134F  8b5eea            mov      bx, word ptr [bp - 0x16]
1:1352  d1e3              shl      bx, 1
1:1354  8b36dc0a          mov      si, word ptr [0xadc]
1:1358  8b00              mov      ax, word ptr [bx + si]
1:135A  eb02              jmp      0x135e
1:135C  2bc0              sub      ax, ax
1:135E  8946dc            mov      word ptr [bp - 0x24], ax
1:1361  ff361000          push     word ptr [0x10]
1:1365  837eec00          cmp      word ptr [bp - 0x14], 0
1:1369  7411              je       0x137c
1:136B  8b46ee            mov      ax, word ptr [bp - 0x12]
1:136E  8b56f0            mov      dx, word ptr [bp - 0x10]
1:1371  b10c              mov      cl, 0xc
1:1373  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_17(1:2C86)
1:1378  8bd8              mov      bx, ax
1:137A  eb03              jmp      0x137f
1:137C  bb0f00            mov      bx, 0xf
1:137F  b104              mov      cl, 4
1:1381  8b46dc            mov      ax, word ptr [bp - 0x24]
1:1384  d3e0              shl      ax, cl
1:1386  03d8              add      bx, ax
1:1388  d1e3              shl      bx, 1
1:138A  ffb7f60a          push     word ptr [bx + 0xaf6]
1:138E  9a0e140000        lcall    0, 0x140e  ; @1:GDI.SelectObject
1:1393  ff361000          push     word ptr [0x10]
1:1397  b8c008            mov      ax, 0x8c0
1:139A  1e                push     ds
1:139B  50                push     ax
1:139C  a0a009            mov      al, byte ptr [0x9a0]
1:139F  98                cwde     
1:13A0  50                push     ax
1:13A1  9affff0000        lcall    0, 0xffff  ; @1:GDI.Polygon
1:13A6  ff46ea            inc      word ptr [bp - 0x16]
1:13A9  a0c109            mov      al, byte ptr [0x9c1]
1:13AC  98                cwde     
1:13AD  3b46ea            cmp      ax, word ptr [bp - 0x16]
1:13B0  7e4c              jle      0x13fe
1:13B2  b80500            mov      ax, 5
1:13B5  f76eea            imul     word ptr [bp - 0x16]
1:13B8  8bd8              mov      bx, ax
1:13BA  8b36c80a          mov      si, word ptr [0xac8]
1:13BE  8a00              mov      al, byte ptr [bx + si]
1:13C0  98                cwde     
1:13C1  a33e09            mov      word ptr [0x93e], ax
1:13C4  b84009            mov      ax, 0x940
1:13C7  50                push     ax
1:13C8  03f3              add      si, bx
1:13CA  b00c              mov      al, 0xc
1:13CC  f66c02            imul     byte ptr [si + 2]
1:13CF  05c409            add      ax, 0x9c4
1:13D2  50                push     ax
1:13D3  b00c              mov      al, 0xc
1:13D5  f66c01            imul     byte ptr [si + 1]
1:13D8  05c409            add      ax, 0x9c4
1:13DB  50                push     ax
1:13DC  b80c00            mov      ax, 0xc
1:13DF  f72e3e09          imul     word ptr [0x93e]
1:13E3  05c409            add      ax, 0x9c4
1:13E6  50                push     ax
1:13E7  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_16(1:230C)
1:13EC  83c408            add      sp, 8
1:13EF  833e4a0900        cmp      word ptr [0x94a], 0
1:13F4  7db0              jge      0x13a6
1:13F6  c746e60000        mov      word ptr [bp - 0x1a], 0
1:13FB  e908ff            jmp      0x1306
1:13FE  ff063c09          inc      word ptr [0x93c]
1:1402  ff063a09          inc      word ptr [0x93a]
1:1406  ff361000          push     word ptr [0x10]
1:140A  ff76e4            push     word ptr [bp - 0x1c]
1:140D  9a1a140000        lcall    0, 0x141a  ; @1:GDI.SelectObject
1:1412  ff361000          push     word ptr [0x10]
1:1416  ff76e8            push     word ptr [bp - 0x18]
1:1419  9aac010000        lcall    0, 0x1ac  ; @1:GDI.SelectObject
1:141E  b8b808            mov      ax, 0x8b8
1:1421  8bf8              mov      di, ax
1:1423  be3609            mov      si, 0x936
1:1426  1e                push     ds
1:1427  07                pop      es
1:1428  a5                movsw    word ptr es:[di], word ptr [si]
1:1429  a5                movsw    word ptr es:[di], word ptr [si]
1:142A  a5                movsw    word ptr es:[di], word ptr [si]
1:142B  a5                movsw    word ptr es:[di], word ptr [si]
1:142C  8b0ef40a          mov      cx, word ptr [0xaf4]
1:1430  8bd1              mov      dx, cx
1:1432  83e93e            sub      cx, 0x3e
1:1435  010eb808          add      word ptr [0x8b8], cx
1:1439  8b0ed80b          mov      cx, word ptr [0xbd8]
1:143D  8bd9              mov      bx, cx
1:143F  83e93e            sub      cx, 0x3e
1:1442  010eba08          add      word ptr [0x8ba], cx
1:1446  83ea3e            sub      dx, 0x3e
1:1449  0116bc08          add      word ptr [0x8bc], dx
1:144D  8d4fc2            lea      cx, [bx - 0x3e]
1:1450  010ebe08          add      word ptr [0x8be], cx
1:1454  bad408            mov      dx, 0x8d4
1:1457  8bfa              mov      di, dx
1:1459  8bf0              mov      si, ax
1:145B  a5                movsw    word ptr es:[di], word ptr [si]
1:145C  a5                movsw    word ptr es:[di], word ptr [si]
1:145D  a5                movsw    word ptr es:[di], word ptr [si]
1:145E  a5                movsw    word ptr es:[di], word ptr [si]
1:145F  a1c00a            mov      ax, word ptr [0xac0]
1:1462  3906c40a          cmp      word ptr [0xac4], ax
1:1466  7e6d              jle      0x14d5
1:1468  a1c60a            mov      ax, word ptr [0xac6]
1:146B  3906c20a          cmp      word ptr [0xac2], ax
1:146F  7d64              jge      0x14d5
1:1471  a1ba08            mov      ax, word ptr [0x8ba]
1:1474  3906c20a          cmp      word ptr [0xac2], ax
1:1478  7d10              jge      0x148a
1:147A  2b06c20a          sub      ax, word ptr [0xac2]
1:147E  f7d8              neg      ax
1:1480  01063809          add      word ptr [0x938], ax
1:1484  a1c20a            mov      ax, word ptr [0xac2]
1:1487  a3ba08            mov      word ptr [0x8ba], ax
1:148A  a1b808            mov      ax, word ptr [0x8b8]
1:148D  3906c00a          cmp      word ptr [0xac0], ax
1:1491  7d10              jge      0x14a3
1:1493  2b06c00a          sub      ax, word ptr [0xac0]
1:1497  f7d8              neg      ax
1:1499  01063609          add      word ptr [0x936], ax
1:149D  a1c00a            mov      ax, word ptr [0xac0]
1:14A0  a3b808            mov      word ptr [0x8b8], ax
1:14A3  a1be08            mov      ax, word ptr [0x8be]
1:14A6  3906c60a          cmp      word ptr [0xac6], ax
1:14AA  7c10              jl       0x14bc
1:14AC  2b06c60a          sub      ax, word ptr [0xac6]
1:14B0  f7d8              neg      ax
1:14B2  01063c09          add      word ptr [0x93c], ax
1:14B6  a1c60a            mov      ax, word ptr [0xac6]
1:14B9  a3be08            mov      word ptr [0x8be], ax
1:14BC  a1bc08            mov      ax, word ptr [0x8bc]
1:14BF  3906c40a          cmp      word ptr [0xac4], ax
1:14C3  7c10              jl       0x14d5
1:14C5  2b06c40a          sub      ax, word ptr [0xac4]
1:14C9  f7d8              neg      ax
1:14CB  01063a09          add      word ptr [0x93a], ax
1:14CF  a1c40a            mov      ax, word ptr [0xac4]
1:14D2  a3bc08            mov      word ptr [0x8bc], ax
1:14D5  ff36a609          push     word ptr [0x9a6]
1:14D9  ff36b808          push     word ptr [0x8b8]
1:14DD  ff36ba08          push     word ptr [0x8ba]
1:14E1  a13a09            mov      ax, word ptr [0x93a]
1:14E4  2b063609          sub      ax, word ptr [0x936]
1:14E8  50                push     ax
1:14E9  a13c09            mov      ax, word ptr [0x93c]
1:14EC  2b063809          sub      ax, word ptr [0x938]
1:14F0  50                push     ax
1:14F1  ff361000          push     word ptr [0x10]
1:14F5  ff363609          push     word ptr [0x936]
1:14F9  ff363809          push     word ptr [0x938]
1:14FD  b82000            mov      ax, 0x20
1:1500  bacc00            mov      dx, 0xcc
1:1503  52                push     dx
1:1504  50                push     ax
1:1505  9affff0000        lcall    0, 0xffff  ; @1:GDI.BitBlt
1:150A  b8c00a            mov      ax, 0xac0
1:150D  8bf8              mov      di, ax
1:150F  bed408            mov      si, 0x8d4
1:1512  1e                push     ds
1:1513  07                pop      es
1:1514  a5                movsw    word ptr es:[di], word ptr [si]
1:1515  a5                movsw    word ptr es:[di], word ptr [si]
1:1516  a5                movsw    word ptr es:[di], word ptr [si]
1:1517  a5                movsw    word ptr es:[di], word ptr [si]
1:1518  5e                pop      si
1:1519  5f                pop      di
1:151A  4d                dec      bp
1:151B  4d                dec      bp
1:151C  8be5              mov      sp, bp
1:151E  1f                pop      ds
1:151F  5d                pop      bp
1:1520  4d                dec      bp
1:1521  cb                retf     

; ===== EXPORT:ord_28(#28) =====
1:1522  1e                push     ds
1:1523  58                pop      ax
1:1524  90                nop      
1:1525  45                inc      bp
1:1526  55                push     bp
1:1527  8bec              mov      bp, sp
1:1529  1e                push     ds
1:152A  8ed8              mov      ds, ax
1:152C  c41eb609          les      bx, ptr [0x9b6]
1:1530  26837f0a04        cmp      word ptr es:[bx + 0xa], 4
1:1535  7d0a              jge      0x1541
1:1537  c41eee0a          les      bx, ptr [0xaee]
1:153B  26c747140000      mov      word ptr es:[bx + 0x14], 0
1:1541  2bc0              sub      ax, ax
1:1543  4d                dec      bp
1:1544  4d                dec      bp
1:1545  8be5              mov      sp, bp
1:1547  1f                pop      ds
1:1548  5d                pop      bp
1:1549  4d                dec      bp
1:154A  cb                retf     

; ===== EXPORT:ord_27(#27) =====
1:154B  1e                push     ds
1:154C  58                pop      ax
1:154D  90                nop      
1:154E  45                inc      bp
1:154F  55                push     bp
1:1550  8bec              mov      bp, sp
1:1552  1e                push     ds
1:1553  8ed8              mov      ds, ax
1:1555  2bc0              sub      ax, ax
1:1557  4d                dec      bp
1:1558  4d                dec      bp
1:1559  8be5              mov      sp, bp
1:155B  1f                pop      ds
1:155C  5d                pop      bp
1:155D  4d                dec      bp
1:155E  cb                retf     

; ===== EXPORT:ord_26(#26) =====
1:155F  1e                push     ds
1:1560  58                pop      ax
1:1561  90                nop      
1:1562  45                inc      bp
1:1563  55                push     bp
1:1564  8bec              mov      bp, sp
1:1566  1e                push     ds
1:1567  8ed8              mov      ds, ax
1:1569  2bc0              sub      ax, ax
1:156B  4d                dec      bp
1:156C  4d                dec      bp
1:156D  8be5              mov      sp, bp
1:156F  1f                pop      ds
1:1570  5d                pop      bp
1:1571  4d                dec      bp
1:1572  cb                retf     
1:1573  001e5890          add      byte ptr [0x9058], bl
1:1577  45                inc      bp
1:1578  55                push     bp
1:1579  8bec              mov      bp, sp
1:157B  1e                push     ds
1:157C  8ed8              mov      ds, ax
1:157E  8b5e06            mov      bx, word ptr [bp + 6]
1:1581  c7070000          mov      word ptr [bx], 0
1:1585  c747020100        mov      word ptr [bx + 2], 1
1:158A  2bc0              sub      ax, ax
1:158C  894706            mov      word ptr [bx + 6], ax
1:158F  894704            mov      word ptr [bx + 4], ax
1:1592  89470a            mov      word ptr [bx + 0xa], ax
1:1595  894708            mov      word ptr [bx + 8], ax
1:1598  89470e            mov      word ptr [bx + 0xe], ax
1:159B  89470c            mov      word ptr [bx + 0xc], ax
1:159E  894710            mov      word ptr [bx + 0x10], ax
1:15A1  c747120100        mov      word ptr [bx + 0x12], 1
1:15A6  894716            mov      word ptr [bx + 0x16], ax
1:15A9  894714            mov      word ptr [bx + 0x14], ax
1:15AC  89471a            mov      word ptr [bx + 0x1a], ax
1:15AF  894718            mov      word ptr [bx + 0x18], ax
1:15B2  89471e            mov      word ptr [bx + 0x1e], ax
1:15B5  89471c            mov      word ptr [bx + 0x1c], ax
1:15B8  894720            mov      word ptr [bx + 0x20], ax
1:15BB  c747220100        mov      word ptr [bx + 0x22], 1
1:15C0  894726            mov      word ptr [bx + 0x26], ax
1:15C3  894724            mov      word ptr [bx + 0x24], ax
1:15C6  89472a            mov      word ptr [bx + 0x2a], ax
1:15C9  894728            mov      word ptr [bx + 0x28], ax
1:15CC  89472e            mov      word ptr [bx + 0x2e], ax
1:15CF  89472c            mov      word ptr [bx + 0x2c], ax
1:15D2  4d                dec      bp
1:15D3  4d                dec      bp
1:15D4  8be5              mov      sp, bp
1:15D6  1f                pop      ds
1:15D7  5d                pop      bp
1:15D8  4d                dec      bp
1:15D9  cb                retf     

; ===== EXPORT:ord_10(#10) =====
1:15DA  1e                push     ds
1:15DB  58                pop      ax
1:15DC  90                nop      
1:15DD  45                inc      bp
1:15DE  55                push     bp
1:15DF  8bec              mov      bp, sp
1:15E1  1e                push     ds
1:15E2  8ed8              mov      ds, ax
1:15E4  8b4608            mov      ax, word ptr [bp + 8]
1:15E7  8b560a            mov      dx, word ptr [bp + 0xa]
1:15EA  8b5e06            mov      bx, word ptr [bp + 6]
1:15ED  014724            add      word ptr [bx + 0x24], ax
1:15F0  115726            adc      word ptr [bx + 0x26], dx
1:15F3  8b460c            mov      ax, word ptr [bp + 0xc]
1:15F6  8b560e            mov      dx, word ptr [bp + 0xe]
1:15F9  014728            add      word ptr [bx + 0x28], ax
1:15FC  11572a            adc      word ptr [bx + 0x2a], dx
1:15FF  8b4610            mov      ax, word ptr [bp + 0x10]
1:1602  8b5612            mov      dx, word ptr [bp + 0x12]
1:1605  01472c            add      word ptr [bx + 0x2c], ax
1:1608  11572e            adc      word ptr [bx + 0x2e], dx
1:160B  4d                dec      bp
1:160C  4d                dec      bp
1:160D  8be5              mov      sp, bp
1:160F  1f                pop      ds
1:1610  5d                pop      bp
1:1611  4d                dec      bp
1:1612  cb                retf     

; ===== EXPORT:ord_14(#14) =====
1:1613  1e                push     ds
1:1614  58                pop      ax
1:1615  90                nop      
1:1616  45                inc      bp
1:1617  55                push     bp
1:1618  8bec              mov      bp, sp
1:161A  1e                push     ds
1:161B  8ed8              mov      ds, ax
1:161D  837e0800          cmp      word ptr [bp + 8], 0
1:1621  7506              jne      0x1629
1:1623  837e0a01          cmp      word ptr [bp + 0xa], 1
1:1627  7471              je       0x169a
1:1629  ff760a            push     word ptr [bp + 0xa]
1:162C  ff7608            push     word ptr [bp + 8]
1:162F  8b5e06            mov      bx, word ptr [bp + 6]
1:1632  ff7702            push     word ptr [bx + 2]
1:1635  ff37              push     word ptr [bx]
1:1637  0e                push     cs
1:1638  e8760d            call     0x23b1
1:163B  83c408            add      sp, 8
1:163E  8b5e06            mov      bx, word ptr [bp + 6]
1:1641  8907              mov      word ptr [bx], ax
1:1643  895702            mov      word ptr [bx + 2], dx
1:1646  ff760a            push     word ptr [bp + 0xa]
1:1649  ff7608            push     word ptr [bp + 8]
1:164C  ff770e            push     word ptr [bx + 0xe]
1:164F  ff770c            push     word ptr [bx + 0xc]
1:1652  0e                push     cs
1:1653  e85b0d            call     0x23b1
1:1656  83c408            add      sp, 8
1:1659  8b5e06            mov      bx, word ptr [bp + 6]
1:165C  89470c            mov      word ptr [bx + 0xc], ax
1:165F  89570e            mov      word ptr [bx + 0xe], dx
1:1662  ff760a            push     word ptr [bp + 0xa]
1:1665  ff7608            push     word ptr [bp + 8]
1:1668  ff771a            push     word ptr [bx + 0x1a]
1:166B  ff7718            push     word ptr [bx + 0x18]
1:166E  0e                push     cs
1:166F  e83f0d            call     0x23b1
1:1672  83c408            add      sp, 8
1:1675  8b5e06            mov      bx, word ptr [bp + 6]
1:1678  894718            mov      word ptr [bx + 0x18], ax
1:167B  89571a            mov      word ptr [bx + 0x1a], dx
1:167E  ff760a            push     word ptr [bp + 0xa]
1:1681  ff7608            push     word ptr [bp + 8]
1:1684  ff7726            push     word ptr [bx + 0x26]
1:1687  ff7724            push     word ptr [bx + 0x24]
1:168A  0e                push     cs
1:168B  e8230d            call     0x23b1
1:168E  83c408            add      sp, 8
1:1691  8b5e06            mov      bx, word ptr [bp + 6]
1:1694  894724            mov      word ptr [bx + 0x24], ax
1:1697  895726            mov      word ptr [bx + 0x26], dx
1:169A  837e0c00          cmp      word ptr [bp + 0xc], 0
1:169E  7506              jne      0x16a6
1:16A0  837e0e01          cmp      word ptr [bp + 0xe], 1
1:16A4  7473              je       0x1719
1:16A6  ff760e            push     word ptr [bp + 0xe]
1:16A9  ff760c            push     word ptr [bp + 0xc]
1:16AC  8b5e06            mov      bx, word ptr [bp + 6]
1:16AF  ff7706            push     word ptr [bx + 6]
1:16B2  ff7704            push     word ptr [bx + 4]
1:16B5  0e                push     cs
1:16B6  e8f80c            call     0x23b1
1:16B9  83c408            add      sp, 8
1:16BC  8b5e06            mov      bx, word ptr [bp + 6]
1:16BF  894704            mov      word ptr [bx + 4], ax
1:16C2  895706            mov      word ptr [bx + 6], dx
1:16C5  ff760e            push     word ptr [bp + 0xe]
1:16C8  ff760c            push     word ptr [bp + 0xc]
1:16CB  ff7712            push     word ptr [bx + 0x12]
1:16CE  ff7710            push     word ptr [bx + 0x10]
1:16D1  0e                push     cs
1:16D2  e8dc0c            call     0x23b1
1:16D5  83c408            add      sp, 8
1:16D8  8b5e06            mov      bx, word ptr [bp + 6]
1:16DB  894710            mov      word ptr [bx + 0x10], ax
1:16DE  895712            mov      word ptr [bx + 0x12], dx
1:16E1  ff760e            push     word ptr [bp + 0xe]
1:16E4  ff760c            push     word ptr [bp + 0xc]
1:16E7  ff771e            push     word ptr [bx + 0x1e]
1:16EA  ff771c            push     word ptr [bx + 0x1c]
1:16ED  0e                push     cs
1:16EE  e8c00c            call     0x23b1
1:16F1  83c408            add      sp, 8
1:16F4  8b5e06            mov      bx, word ptr [bp + 6]
1:16F7  89471c            mov      word ptr [bx + 0x1c], ax
1:16FA  89571e            mov      word ptr [bx + 0x1e], dx
1:16FD  ff760e            push     word ptr [bp + 0xe]
1:1700  ff760c            push     word ptr [bp + 0xc]
1:1703  ff772a            push     word ptr [bx + 0x2a]
1:1706  ff7728            push     word ptr [bx + 0x28]
1:1709  0e                push     cs
1:170A  e8a40c            call     0x23b1
1:170D  83c408            add      sp, 8
1:1710  8b5e06            mov      bx, word ptr [bp + 6]
1:1713  894728            mov      word ptr [bx + 0x28], ax
1:1716  89572a            mov      word ptr [bx + 0x2a], dx
1:1719  837e1000          cmp      word ptr [bp + 0x10], 0
1:171D  7506              jne      0x1725
1:171F  837e1201          cmp      word ptr [bp + 0x12], 1
1:1723  7470              je       0x1795
1:1725  ff7612            push     word ptr [bp + 0x12]
1:1728  ff7610            push     word ptr [bp + 0x10]
1:172B  8b5e06            mov      bx, word ptr [bp + 6]
1:172E  ff770a            push     word ptr [bx + 0xa]
1:1731  ff7708            push     word ptr [bx + 8]
1:1734  0e                push     cs
1:1735  e8790c            call     0x23b1
1:1738  83c408            add      sp, 8
1:173B  8b5e06            mov      bx, word ptr [bp + 6]
1:173E  894708            mov      word ptr [bx + 8], ax
1:1741  89570a            mov      word ptr [bx + 0xa], dx
1:1744  ff7612            push     word ptr [bp + 0x12]
1:1747  ff7610            push     word ptr [bp + 0x10]
1:174A  ff7716            push     word ptr [bx + 0x16]
1:174D  ff7714            push     word ptr [bx + 0x14]
1:1750  0e                push     cs
1:1751  e85d0c            call     0x23b1
1:1754  83c408            add      sp, 8
1:1757  8b5e06            mov      bx, word ptr [bp + 6]
1:175A  894714            mov      word ptr [bx + 0x14], ax
1:175D  895716            mov      word ptr [bx + 0x16], dx
1:1760  ff7612            push     word ptr [bp + 0x12]
1:1763  ff7610            push     word ptr [bp + 0x10]
1:1766  ff7722            push     word ptr [bx + 0x22]
1:1769  ff7720            push     word ptr [bx + 0x20]
1:176C  0e                push     cs
1:176D  e8410c            call     0x23b1
1:1770  83c408            add      sp, 8
1:1773  8b5e06            mov      bx, word ptr [bp + 6]
1:1776  894720            mov      word ptr [bx + 0x20], ax
1:1779  895722            mov      word ptr [bx + 0x22], dx
1:177C  ff7612            push     word ptr [bp + 0x12]
1:177F  ff7610            push     word ptr [bp + 0x10]
1:1782  ff772e            push     word ptr [bx + 0x2e]
1:1785  ff772c            push     word ptr [bx + 0x2c]
1:1788  0e                push     cs
1:1789  e8250c            call     0x23b1
1:178C  8b5e06            mov      bx, word ptr [bp + 6]
1:178F  89472c            mov      word ptr [bx + 0x2c], ax
1:1792  89572e            mov      word ptr [bx + 0x2e], dx
1:1795  4d                dec      bp
1:1796  4d                dec      bp
1:1797  8be5              mov      sp, bp
1:1799  1f                pop      ds
1:179A  5d                pop      bp
1:179B  4d                dec      bp
1:179C  cb                retf     

; ===== EXPORT:ord_11(#11) =====
1:179D  1e                push     ds
1:179E  58                pop      ax
1:179F  90                nop      
1:17A0  45                inc      bp
1:17A1  55                push     bp
1:17A2  8bec              mov      bp, sp
1:17A4  1e                push     ds
1:17A5  8ed8              mov      ds, ax
1:17A7  83ec12            sub      sp, 0x12
1:17AA  57                push     di
1:17AB  56                push     si
1:17AC  8b460a            mov      ax, word ptr [bp + 0xa]
1:17AF  0b4608            or       ax, word ptr [bp + 8]
1:17B2  7503              jne      0x17b7
1:17B4  e95802            jmp      0x1a0f
1:17B7  8b4608            mov      ax, word ptr [bp + 8]
1:17BA  8b560a            mov      dx, word ptr [bp + 0xa]
1:17BD  051f92            add      ax, 0x921f
1:17C0  83d201            adc      dx, 1
1:17C3  52                push     dx
1:17C4  50                push     ax
1:17C5  0e                push     cs
1:17C6  e84510            call     0x280e
1:17C9  5b                pop      bx
1:17CA  5b                pop      bx
1:17CB  8946f2            mov      word ptr [bp - 0xe], ax
1:17CE  8956f4            mov      word ptr [bp - 0xc], dx
1:17D1  ff760a            push     word ptr [bp + 0xa]
1:17D4  ff7608            push     word ptr [bp + 8]
1:17D7  0e                push     cs
1:17D8  e83310            call     0x280e
1:17DB  5b                pop      bx
1:17DC  5b                pop      bx
1:17DD  8946ee            mov      word ptr [bp - 0x12], ax
1:17E0  8956f0            mov      word ptr [bp - 0x10], dx
1:17E3  52                push     dx
1:17E4  50                push     ax
1:17E5  8b5e06            mov      bx, word ptr [bp + 6]
1:17E8  ff7706            push     word ptr [bx + 6]
1:17EB  ff7704            push     word ptr [bx + 4]
1:17EE  0e                push     cs
1:17EF  e8c10c            call     0x24b3
1:17F2  83c408            add      sp, 8
1:17F5  ff76f4            push     word ptr [bp - 0xc]
1:17F8  ff76f2            push     word ptr [bp - 0xe]
1:17FB  8b5e06            mov      bx, word ptr [bp + 6]
1:17FE  ff7702            push     word ptr [bx + 2]
1:1801  ff37              push     word ptr [bx]
1:1803  8bf0              mov      si, ax
1:1805  8bfa              mov      di, dx
1:1807  0e                push     cs
1:1808  e8a80c            call     0x24b3
1:180B  83c408            add      sp, 8
1:180E  2bc6              sub      ax, si
1:1810  1bd7              sbb      dx, di
1:1812  8946fa            mov      word ptr [bp - 6], ax
1:1815  8956fc            mov      word ptr [bp - 4], dx
1:1818  ff76f4            push     word ptr [bp - 0xc]
1:181B  ff76f2            push     word ptr [bp - 0xe]
1:181E  8b5e06            mov      bx, word ptr [bp + 6]
1:1821  ff7706            push     word ptr [bx + 6]
1:1824  ff7704            push     word ptr [bx + 4]
1:1827  0e                push     cs
1:1828  e8880c            call     0x24b3
1:182B  83c408            add      sp, 8
1:182E  ff76f0            push     word ptr [bp - 0x10]
1:1831  ff76ee            push     word ptr [bp - 0x12]
1:1834  8b5e06            mov      bx, word ptr [bp + 6]
1:1837  ff7702            push     word ptr [bx + 2]
1:183A  ff37              push     word ptr [bx]
1:183C  8bf0              mov      si, ax
1:183E  8bfa              mov      di, dx
1:1840  0e                push     cs
1:1841  e86f0c            call     0x24b3
1:1844  83c408            add      sp, 8
1:1847  03f0              add      si, ax
1:1849  13fa              adc      di, dx
1:184B  8976f6            mov      word ptr [bp - 0xa], si
1:184E  897ef8            mov      word ptr [bp - 8], di
1:1851  8b46fa            mov      ax, word ptr [bp - 6]
1:1854  8b56fc            mov      dx, word ptr [bp - 4]
1:1857  8b5e06            mov      bx, word ptr [bp + 6]
1:185A  8907              mov      word ptr [bx], ax
1:185C  895702            mov      word ptr [bx + 2], dx
1:185F  8b46f6            mov      ax, word ptr [bp - 0xa]
1:1862  8b56f8            mov      dx, word ptr [bp - 8]
1:1865  894704            mov      word ptr [bx + 4], ax
1:1868  895706            mov      word ptr [bx + 6], dx
1:186B  ff76f0            push     word ptr [bp - 0x10]
1:186E  ff76ee            push     word ptr [bp - 0x12]
1:1871  ff7712            push     word ptr [bx + 0x12]
1:1874  ff7710            push     word ptr [bx + 0x10]
1:1877  0e                push     cs
1:1878  e8380c            call     0x24b3
1:187B  83c408            add      sp, 8
1:187E  ff76f4            push     word ptr [bp - 0xc]
1:1881  ff76f2            push     word ptr [bp - 0xe]
1:1884  8b5e06            mov      bx, word ptr [bp + 6]
1:1887  ff770e            push     word ptr [bx + 0xe]
1:188A  ff770c            push     word ptr [bx + 0xc]
1:188D  8bf0              mov      si, ax
1:188F  8bfa              mov      di, dx
1:1891  0e                push     cs
1:1892  e81e0c            call     0x24b3
1:1895  83c408            add      sp, 8
1:1898  2bc6              sub      ax, si
1:189A  1bd7              sbb      dx, di
1:189C  8946fa            mov      word ptr [bp - 6], ax
1:189F  8956fc            mov      word ptr [bp - 4], dx
1:18A2  ff76f4            push     word ptr [bp - 0xc]
1:18A5  ff76f2            push     word ptr [bp - 0xe]
1:18A8  8b5e06            mov      bx, word ptr [bp + 6]
1:18AB  ff7712            push     word ptr [bx + 0x12]
1:18AE  ff7710            push     word ptr [bx + 0x10]
1:18B1  0e                push     cs
1:18B2  e8fe0b            call     0x24b3
1:18B5  83c408            add      sp, 8
1:18B8  ff76f0            push     word ptr [bp - 0x10]
1:18BB  ff76ee            push     word ptr [bp - 0x12]
1:18BE  8b5e06            mov      bx, word ptr [bp + 6]
1:18C1  ff770e            push     word ptr [bx + 0xe]
1:18C4  ff770c            push     word ptr [bx + 0xc]
1:18C7  8bf0              mov      si, ax
1:18C9  8bfa              mov      di, dx
1:18CB  0e                push     cs
1:18CC  e8e40b            call     0x24b3
1:18CF  83c408            add      sp, 8
1:18D2  03f0              add      si, ax
1:18D4  13fa              adc      di, dx
1:18D6  8976f6            mov      word ptr [bp - 0xa], si
1:18D9  897ef8            mov      word ptr [bp - 8], di
1:18DC  8b46fa            mov      ax, word ptr [bp - 6]
1:18DF  8b56fc            mov      dx, word ptr [bp - 4]
1:18E2  8b5e06            mov      bx, word ptr [bp + 6]
1:18E5  89470c            mov      word ptr [bx + 0xc], ax
1:18E8  89570e            mov      word ptr [bx + 0xe], dx
1:18EB  8b46f6            mov      ax, word ptr [bp - 0xa]
1:18EE  8b56f8            mov      dx, word ptr [bp - 8]
1:18F1  894710            mov      word ptr [bx + 0x10], ax
1:18F4  895712            mov      word ptr [bx + 0x12], dx
1:18F7  ff76f0            push     word ptr [bp - 0x10]
1:18FA  ff76ee            push     word ptr [bp - 0x12]
1:18FD  ff771e            push     word ptr [bx + 0x1e]
1:1900  ff771c            push     word ptr [bx + 0x1c]
1:1903  0e                push     cs
1:1904  e8ac0b            call     0x24b3
1:1907  83c408            add      sp, 8
1:190A  ff76f4            push     word ptr [bp - 0xc]
1:190D  ff76f2            push     word ptr [bp - 0xe]
1:1910  8b5e06            mov      bx, word ptr [bp + 6]
1:1913  ff771a            push     word ptr [bx + 0x1a]
1:1916  ff7718            push     word ptr [bx + 0x18]
1:1919  8bf0              mov      si, ax
1:191B  8bfa              mov      di, dx
1:191D  0e                push     cs
1:191E  e8920b            call     0x24b3
1:1921  83c408            add      sp, 8
1:1924  2bc6              sub      ax, si
1:1926  1bd7              sbb      dx, di
1:1928  8946fa            mov      word ptr [bp - 6], ax
1:192B  8956fc            mov      word ptr [bp - 4], dx
1:192E  ff76f4            push     word ptr [bp - 0xc]
1:1931  ff76f2            push     word ptr [bp - 0xe]
1:1934  8b5e06            mov      bx, word ptr [bp + 6]
1:1937  ff771e            push     word ptr [bx + 0x1e]
1:193A  ff771c            push     word ptr [bx + 0x1c]
1:193D  0e                push     cs
1:193E  e8720b            call     0x24b3
1:1941  83c408            add      sp, 8
1:1944  ff76f0            push     word ptr [bp - 0x10]
1:1947  ff76ee            push     word ptr [bp - 0x12]
1:194A  8b5e06            mov      bx, word ptr [bp + 6]
1:194D  ff771a            push     word ptr [bx + 0x1a]
1:1950  ff7718            push     word ptr [bx + 0x18]
1:1953  8bf0              mov      si, ax
1:1955  8bfa              mov      di, dx
1:1957  0e                push     cs
1:1958  e8580b            call     0x24b3
1:195B  83c408            add      sp, 8
1:195E  03f0              add      si, ax
1:1960  13fa              adc      di, dx
1:1962  8976f6            mov      word ptr [bp - 0xa], si
1:1965  897ef8            mov      word ptr [bp - 8], di
1:1968  8b46fa            mov      ax, word ptr [bp - 6]
1:196B  8b56fc            mov      dx, word ptr [bp - 4]
1:196E  8b5e06            mov      bx, word ptr [bp + 6]
1:1971  894718            mov      word ptr [bx + 0x18], ax
1:1974  89571a            mov      word ptr [bx + 0x1a], dx
1:1977  8b46f6            mov      ax, word ptr [bp - 0xa]
1:197A  8b56f8            mov      dx, word ptr [bp - 8]
1:197D  89471c            mov      word ptr [bx + 0x1c], ax
1:1980  89571e            mov      word ptr [bx + 0x1e], dx
1:1983  ff76f0            push     word ptr [bp - 0x10]
1:1986  ff76ee            push     word ptr [bp - 0x12]
1:1989  ff772a            push     word ptr [bx + 0x2a]
1:198C  ff7728            push     word ptr [bx + 0x28]
1:198F  0e                push     cs
1:1990  e8200b            call     0x24b3
1:1993  83c408            add      sp, 8
1:1996  ff76f4            push     word ptr [bp - 0xc]
1:1999  ff76f2            push     word ptr [bp - 0xe]
1:199C  8b5e06            mov      bx, word ptr [bp + 6]
1:199F  ff7726            push     word ptr [bx + 0x26]
1:19A2  ff7724            push     word ptr [bx + 0x24]
1:19A5  8bf0              mov      si, ax
1:19A7  8bfa              mov      di, dx
1:19A9  0e                push     cs
1:19AA  e8060b            call     0x24b3
1:19AD  83c408            add      sp, 8
1:19B0  2bc6              sub      ax, si
1:19B2  1bd7              sbb      dx, di
1:19B4  8946fa            mov      word ptr [bp - 6], ax
1:19B7  8956fc            mov      word ptr [bp - 4], dx
1:19BA  ff76f4            push     word ptr [bp - 0xc]
1:19BD  ff76f2            push     word ptr [bp - 0xe]
1:19C0  8b5e06            mov      bx, word ptr [bp + 6]
1:19C3  ff772a            push     word ptr [bx + 0x2a]
1:19C6  ff7728            push     word ptr [bx + 0x28]
1:19C9  0e                push     cs
1:19CA  e8e60a            call     0x24b3
1:19CD  83c408            add      sp, 8
1:19D0  ff76f0            push     word ptr [bp - 0x10]
1:19D3  ff76ee            push     word ptr [bp - 0x12]
1:19D6  8b5e06            mov      bx, word ptr [bp + 6]
1:19D9  ff7726            push     word ptr [bx + 0x26]
1:19DC  ff7724            push     word ptr [bx + 0x24]
1:19DF  8bf0              mov      si, ax
1:19E1  8bfa              mov      di, dx
1:19E3  0e                push     cs
1:19E4  e8cc0a            call     0x24b3
1:19E7  83c408            add      sp, 8
1:19EA  03f0              add      si, ax
1:19EC  13fa              adc      di, dx
1:19EE  8976f6            mov      word ptr [bp - 0xa], si
1:19F1  897ef8            mov      word ptr [bp - 8], di
1:19F4  8b46fa            mov      ax, word ptr [bp - 6]
1:19F7  8b56fc            mov      dx, word ptr [bp - 4]
1:19FA  8b5e06            mov      bx, word ptr [bp + 6]
1:19FD  894724            mov      word ptr [bx + 0x24], ax
1:1A00  895726            mov      word ptr [bx + 0x26], dx
1:1A03  8b46f6            mov      ax, word ptr [bp - 0xa]
1:1A06  8b56f8            mov      dx, word ptr [bp - 8]
1:1A09  894728            mov      word ptr [bx + 0x28], ax
1:1A0C  89572a            mov      word ptr [bx + 0x2a], dx
1:1A0F  5e                pop      si
1:1A10  5f                pop      di
1:1A11  4d                dec      bp
1:1A12  4d                dec      bp
1:1A13  8be5              mov      sp, bp
1:1A15  1f                pop      ds
1:1A16  5d                pop      bp
1:1A17  4d                dec      bp
1:1A18  cb                retf     

; ===== EXPORT:ord_13(#13) =====
1:1A19  1e                push     ds
1:1A1A  58                pop      ax
1:1A1B  90                nop      
1:1A1C  45                inc      bp
1:1A1D  55                push     bp
1:1A1E  8bec              mov      bp, sp
1:1A20  1e                push     ds
1:1A21  8ed8              mov      ds, ax
1:1A23  83ec12            sub      sp, 0x12
1:1A26  57                push     di
1:1A27  56                push     si
1:1A28  8b460a            mov      ax, word ptr [bp + 0xa]
1:1A2B  0b4608            or       ax, word ptr [bp + 8]
1:1A2E  7503              jne      0x1a33
1:1A30  e95b02            jmp      0x1c8e
1:1A33  8b4608            mov      ax, word ptr [bp + 8]
1:1A36  8b560a            mov      dx, word ptr [bp + 0xa]
1:1A39  051f92            add      ax, 0x921f
1:1A3C  83d201            adc      dx, 1
1:1A3F  52                push     dx
1:1A40  50                push     ax
1:1A41  0e                push     cs
1:1A42  e8c90d            call     0x280e
1:1A45  5b                pop      bx
1:1A46  5b                pop      bx
1:1A47  8946f2            mov      word ptr [bp - 0xe], ax
1:1A4A  8956f4            mov      word ptr [bp - 0xc], dx
1:1A4D  ff760a            push     word ptr [bp + 0xa]
1:1A50  ff7608            push     word ptr [bp + 8]
1:1A53  0e                push     cs
1:1A54  e8b70d            call     0x280e
1:1A57  5b                pop      bx
1:1A58  5b                pop      bx
1:1A59  8946ee            mov      word ptr [bp - 0x12], ax
1:1A5C  8956f0            mov      word ptr [bp - 0x10], dx
1:1A5F  52                push     dx
1:1A60  50                push     ax
1:1A61  8b5e06            mov      bx, word ptr [bp + 6]
1:1A64  ff770a            push     word ptr [bx + 0xa]
1:1A67  ff7708            push     word ptr [bx + 8]
1:1A6A  0e                push     cs
1:1A6B  e8450a            call     0x24b3
1:1A6E  83c408            add      sp, 8
1:1A71  ff76f4            push     word ptr [bp - 0xc]
1:1A74  ff76f2            push     word ptr [bp - 0xe]
1:1A77  8b5e06            mov      bx, word ptr [bp + 6]
1:1A7A  ff7706            push     word ptr [bx + 6]
1:1A7D  ff7704            push     word ptr [bx + 4]
1:1A80  8bf0              mov      si, ax
1:1A82  8bfa              mov      di, dx
1:1A84  0e                push     cs
1:1A85  e82b0a            call     0x24b3
1:1A88  83c408            add      sp, 8
1:1A8B  2bc6              sub      ax, si
1:1A8D  1bd7              sbb      dx, di
1:1A8F  8946fa            mov      word ptr [bp - 6], ax
1:1A92  8956fc            mov      word ptr [bp - 4], dx
1:1A95  ff76f4            push     word ptr [bp - 0xc]
1:1A98  ff76f2            push     word ptr [bp - 0xe]
1:1A9B  8b5e06            mov      bx, word ptr [bp + 6]
1:1A9E  ff770a            push     word ptr [bx + 0xa]
1:1AA1  ff7708            push     word ptr [bx + 8]
1:1AA4  0e                push     cs
1:1AA5  e80b0a            call     0x24b3
1:1AA8  83c408            add      sp, 8
1:1AAB  ff76f0            push     word ptr [bp - 0x10]
1:1AAE  ff76ee            push     word ptr [bp - 0x12]
1:1AB1  8b5e06            mov      bx, word ptr [bp + 6]
1:1AB4  ff7706            push     word ptr [bx + 6]
1:1AB7  ff7704            push     word ptr [bx + 4]
1:1ABA  8bf0              mov      si, ax
1:1ABC  8bfa              mov      di, dx
1:1ABE  0e                push     cs
1:1ABF  e8f109            call     0x24b3
1:1AC2  83c408            add      sp, 8
1:1AC5  03f0              add      si, ax
1:1AC7  13fa              adc      di, dx
1:1AC9  8976f6            mov      word ptr [bp - 0xa], si
1:1ACC  897ef8            mov      word ptr [bp - 8], di
1:1ACF  8b46fa            mov      ax, word ptr [bp - 6]
1:1AD2  8b56fc            mov      dx, word ptr [bp - 4]
1:1AD5  8b5e06            mov      bx, word ptr [bp + 6]
1:1AD8  894704            mov      word ptr [bx + 4], ax
1:1ADB  895706            mov      word ptr [bx + 6], dx
1:1ADE  8b46f6            mov      ax, word ptr [bp - 0xa]
1:1AE1  8b56f8            mov      dx, word ptr [bp - 8]
1:1AE4  894708            mov      word ptr [bx + 8], ax
1:1AE7  89570a            mov      word ptr [bx + 0xa], dx
1:1AEA  ff76f0            push     word ptr [bp - 0x10]
1:1AED  ff76ee            push     word ptr [bp - 0x12]
1:1AF0  ff7716            push     word ptr [bx + 0x16]
1:1AF3  ff7714            push     word ptr [bx + 0x14]
1:1AF6  0e                push     cs
1:1AF7  e8b909            call     0x24b3
1:1AFA  83c408            add      sp, 8
1:1AFD  ff76f4            push     word ptr [bp - 0xc]
1:1B00  ff76f2            push     word ptr [bp - 0xe]
1:1B03  8b5e06            mov      bx, word ptr [bp + 6]
1:1B06  ff7712            push     word ptr [bx + 0x12]
1:1B09  ff7710            push     word ptr [bx + 0x10]
1:1B0C  8bf0              mov      si, ax
1:1B0E  8bfa              mov      di, dx
1:1B10  0e                push     cs
1:1B11  e89f09            call     0x24b3
1:1B14  83c408            add      sp, 8
1:1B17  2bc6              sub      ax, si
1:1B19  1bd7              sbb      dx, di
1:1B1B  8946fa            mov      word ptr [bp - 6], ax
1:1B1E  8956fc            mov      word ptr [bp - 4], dx
1:1B21  ff76f4            push     word ptr [bp - 0xc]
1:1B24  ff76f2            push     word ptr [bp - 0xe]
1:1B27  8b5e06            mov      bx, word ptr [bp + 6]
1:1B2A  ff7716            push     word ptr [bx + 0x16]
1:1B2D  ff7714            push     word ptr [bx + 0x14]
1:1B30  0e                push     cs
1:1B31  e87f09            call     0x24b3
1:1B34  83c408            add      sp, 8
1:1B37  ff76f0            push     word ptr [bp - 0x10]
1:1B3A  ff76ee            push     word ptr [bp - 0x12]
1:1B3D  8b5e06            mov      bx, word ptr [bp + 6]
1:1B40  ff7712            push     word ptr [bx + 0x12]
1:1B43  ff7710            push     word ptr [bx + 0x10]
1:1B46  8bf0              mov      si, ax
1:1B48  8bfa              mov      di, dx
1:1B4A  0e                push     cs
1:1B4B  e86509            call     0x24b3
1:1B4E  83c408            add      sp, 8
1:1B51  03f0              add      si, ax
1:1B53  13fa              adc      di, dx
1:1B55  8976f6            mov      word ptr [bp - 0xa], si
1:1B58  897ef8            mov      word ptr [bp - 8], di
1:1B5B  8b46fa            mov      ax, word ptr [bp - 6]
1:1B5E  8b56fc            mov      dx, word ptr [bp - 4]
1:1B61  8b5e06            mov      bx, word ptr [bp + 6]
1:1B64  894710            mov      word ptr [bx + 0x10], ax
1:1B67  895712            mov      word ptr [bx + 0x12], dx
1:1B6A  8b46f6            mov      ax, word ptr [bp - 0xa]
1:1B6D  8b56f8            mov      dx, word ptr [bp - 8]
1:1B70  894714            mov      word ptr [bx + 0x14], ax
1:1B73  895716            mov      word ptr [bx + 0x16], dx
1:1B76  ff76f0            push     word ptr [bp - 0x10]
1:1B79  ff76ee            push     word ptr [bp - 0x12]
1:1B7C  ff7722            push     word ptr [bx + 0x22]
1:1B7F  ff7720            push     word ptr [bx + 0x20]
1:1B82  0e                push     cs
1:1B83  e82d09            call     0x24b3
1:1B86  83c408            add      sp, 8
1:1B89  ff76f4            push     word ptr [bp - 0xc]
1:1B8C  ff76f2            push     word ptr [bp - 0xe]
1:1B8F  8b5e06            mov      bx, word ptr [bp + 6]
1:1B92  ff771e            push     word ptr [bx + 0x1e]
1:1B95  ff771c            push     word ptr [bx + 0x1c]
1:1B98  8bf0              mov      si, ax
1:1B9A  8bfa              mov      di, dx
1:1B9C  0e                push     cs
1:1B9D  e81309            call     0x24b3
1:1BA0  83c408            add      sp, 8
1:1BA3  2bc6              sub      ax, si
1:1BA5  1bd7              sbb      dx, di
1:1BA7  8946fa            mov      word ptr [bp - 6], ax
1:1BAA  8956fc            mov      word ptr [bp - 4], dx
1:1BAD  ff76f4            push     word ptr [bp - 0xc]
1:1BB0  ff76f2            push     word ptr [bp - 0xe]
1:1BB3  8b5e06            mov      bx, word ptr [bp + 6]
1:1BB6  ff7722            push     word ptr [bx + 0x22]
1:1BB9  ff7720            push     word ptr [bx + 0x20]
1:1BBC  0e                push     cs
1:1BBD  e8f308            call     0x24b3
1:1BC0  83c408            add      sp, 8
1:1BC3  ff76f0            push     word ptr [bp - 0x10]
1:1BC6  ff76ee            push     word ptr [bp - 0x12]
1:1BC9  8b5e06            mov      bx, word ptr [bp + 6]
1:1BCC  ff771e            push     word ptr [bx + 0x1e]
1:1BCF  ff771c            push     word ptr [bx + 0x1c]
1:1BD2  8bf0              mov      si, ax
1:1BD4  8bfa              mov      di, dx
1:1BD6  0e                push     cs
1:1BD7  e8d908            call     0x24b3
1:1BDA  83c408            add      sp, 8
1:1BDD  03f0              add      si, ax
1:1BDF  13fa              adc      di, dx
1:1BE1  8976f6            mov      word ptr [bp - 0xa], si
1:1BE4  897ef8            mov      word ptr [bp - 8], di
1:1BE7  8b46fa            mov      ax, word ptr [bp - 6]
1:1BEA  8b56fc            mov      dx, word ptr [bp - 4]
1:1BED  8b5e06            mov      bx, word ptr [bp + 6]
1:1BF0  89471c            mov      word ptr [bx + 0x1c], ax
1:1BF3  89571e            mov      word ptr [bx + 0x1e], dx
1:1BF6  8b46f6            mov      ax, word ptr [bp - 0xa]
1:1BF9  8b56f8            mov      dx, word ptr [bp - 8]
1:1BFC  894720            mov      word ptr [bx + 0x20], ax
1:1BFF  895722            mov      word ptr [bx + 0x22], dx
1:1C02  ff76f0            push     word ptr [bp - 0x10]
1:1C05  ff76ee            push     word ptr [bp - 0x12]
1:1C08  ff772e            push     word ptr [bx + 0x2e]
1:1C0B  ff772c            push     word ptr [bx + 0x2c]
1:1C0E  0e                push     cs
1:1C0F  e8a108            call     0x24b3
1:1C12  83c408            add      sp, 8
1:1C15  ff76f4            push     word ptr [bp - 0xc]
1:1C18  ff76f2            push     word ptr [bp - 0xe]
1:1C1B  8b5e06            mov      bx, word ptr [bp + 6]
1:1C1E  ff772a            push     word ptr [bx + 0x2a]
1:1C21  ff7728            push     word ptr [bx + 0x28]
1:1C24  8bf0              mov      si, ax
1:1C26  8bfa              mov      di, dx
1:1C28  0e                push     cs
1:1C29  e88708            call     0x24b3
1:1C2C  83c408            add      sp, 8
1:1C2F  2bc6              sub      ax, si
1:1C31  1bd7              sbb      dx, di
1:1C33  8946fa            mov      word ptr [bp - 6], ax
1:1C36  8956fc            mov      word ptr [bp - 4], dx
1:1C39  ff76f4            push     word ptr [bp - 0xc]
1:1C3C  ff76f2            push     word ptr [bp - 0xe]
1:1C3F  8b5e06            mov      bx, word ptr [bp + 6]
1:1C42  ff772e            push     word ptr [bx + 0x2e]
1:1C45  ff772c            push     word ptr [bx + 0x2c]
1:1C48  0e                push     cs
1:1C49  e86708            call     0x24b3
1:1C4C  83c408            add      sp, 8
1:1C4F  ff76f0            push     word ptr [bp - 0x10]
1:1C52  ff76ee            push     word ptr [bp - 0x12]
1:1C55  8b5e06            mov      bx, word ptr [bp + 6]
1:1C58  ff772a            push     word ptr [bx + 0x2a]
1:1C5B  ff7728            push     word ptr [bx + 0x28]
1:1C5E  8bf0              mov      si, ax
1:1C60  8bfa              mov      di, dx
1:1C62  0e                push     cs
1:1C63  e84d08            call     0x24b3
1:1C66  83c408            add      sp, 8
1:1C69  03f0              add      si, ax
1:1C6B  13fa              adc      di, dx
1:1C6D  8976f6            mov      word ptr [bp - 0xa], si
1:1C70  897ef8            mov      word ptr [bp - 8], di
1:1C73  8b46fa            mov      ax, word ptr [bp - 6]
1:1C76  8b56fc            mov      dx, word ptr [bp - 4]
1:1C79  8b5e06            mov      bx, word ptr [bp + 6]
1:1C7C  894728            mov      word ptr [bx + 0x28], ax
1:1C7F  89572a            mov      word ptr [bx + 0x2a], dx
1:1C82  8b46f6            mov      ax, word ptr [bp - 0xa]
1:1C85  8b56f8            mov      dx, word ptr [bp - 8]
1:1C88  89472c            mov      word ptr [bx + 0x2c], ax
1:1C8B  89572e            mov      word ptr [bx + 0x2e], dx
1:1C8E  5e                pop      si
1:1C8F  5f                pop      di
1:1C90  4d                dec      bp
1:1C91  4d                dec      bp
1:1C92  8be5              mov      sp, bp
1:1C94  1f                pop      ds
1:1C95  5d                pop      bp
1:1C96  4d                dec      bp
1:1C97  cb                retf     

; ===== EXPORT:ord_12(#12) =====
1:1C98  1e                push     ds
1:1C99  58                pop      ax
1:1C9A  90                nop      
1:1C9B  45                inc      bp
1:1C9C  55                push     bp
1:1C9D  8bec              mov      bp, sp
1:1C9F  1e                push     ds
1:1CA0  8ed8              mov      ds, ax
1:1CA2  83ec12            sub      sp, 0x12
1:1CA5  57                push     di
1:1CA6  56                push     si
1:1CA7  8b460a            mov      ax, word ptr [bp + 0xa]
1:1CAA  0b4608            or       ax, word ptr [bp + 8]
1:1CAD  7503              jne      0x1cb2
1:1CAF  e95802            jmp      0x1f0a
1:1CB2  8b4608            mov      ax, word ptr [bp + 8]
1:1CB5  8b560a            mov      dx, word ptr [bp + 0xa]
1:1CB8  051f92            add      ax, 0x921f
1:1CBB  83d201            adc      dx, 1
1:1CBE  52                push     dx
1:1CBF  50                push     ax
1:1CC0  0e                push     cs
1:1CC1  e84a0b            call     0x280e
1:1CC4  5b                pop      bx
1:1CC5  5b                pop      bx
1:1CC6  8946f2            mov      word ptr [bp - 0xe], ax
1:1CC9  8956f4            mov      word ptr [bp - 0xc], dx
1:1CCC  ff760a            push     word ptr [bp + 0xa]
1:1CCF  ff7608            push     word ptr [bp + 8]
1:1CD2  0e                push     cs
1:1CD3  e8380b            call     0x280e
1:1CD6  5b                pop      bx
1:1CD7  5b                pop      bx
1:1CD8  8946ee            mov      word ptr [bp - 0x12], ax
1:1CDB  8956f0            mov      word ptr [bp - 0x10], dx
1:1CDE  52                push     dx
1:1CDF  50                push     ax
1:1CE0  8b5e06            mov      bx, word ptr [bp + 6]
1:1CE3  ff770a            push     word ptr [bx + 0xa]
1:1CE6  ff7708            push     word ptr [bx + 8]
1:1CE9  0e                push     cs
1:1CEA  e8c607            call     0x24b3
1:1CED  83c408            add      sp, 8
1:1CF0  ff76f4            push     word ptr [bp - 0xc]
1:1CF3  ff76f2            push     word ptr [bp - 0xe]
1:1CF6  8b5e06            mov      bx, word ptr [bp + 6]
1:1CF9  ff7702            push     word ptr [bx + 2]
1:1CFC  ff37              push     word ptr [bx]
1:1CFE  8bf0              mov      si, ax
1:1D00  8bfa              mov      di, dx
1:1D02  0e                push     cs
1:1D03  e8ad07            call     0x24b3
1:1D06  83c408            add      sp, 8
1:1D09  2bc6              sub      ax, si
1:1D0B  1bd7              sbb      dx, di
1:1D0D  8946fa            mov      word ptr [bp - 6], ax
1:1D10  8956fc            mov      word ptr [bp - 4], dx
1:1D13  ff76f4            push     word ptr [bp - 0xc]
1:1D16  ff76f2            push     word ptr [bp - 0xe]
1:1D19  8b5e06            mov      bx, word ptr [bp + 6]
1:1D1C  ff770a            push     word ptr [bx + 0xa]
1:1D1F  ff7708            push     word ptr [bx + 8]
1:1D22  0e                push     cs
1:1D23  e88d07            call     0x24b3
1:1D26  83c408            add      sp, 8
1:1D29  ff76f0            push     word ptr [bp - 0x10]
1:1D2C  ff76ee            push     word ptr [bp - 0x12]
1:1D2F  8b5e06            mov      bx, word ptr [bp + 6]
1:1D32  ff7702            push     word ptr [bx + 2]
1:1D35  ff37              push     word ptr [bx]
1:1D37  8bf0              mov      si, ax
1:1D39  8bfa              mov      di, dx
1:1D3B  0e                push     cs
1:1D3C  e87407            call     0x24b3
1:1D3F  83c408            add      sp, 8
1:1D42  03f0              add      si, ax
1:1D44  13fa              adc      di, dx
1:1D46  8976f6            mov      word ptr [bp - 0xa], si
1:1D49  897ef8            mov      word ptr [bp - 8], di
1:1D4C  8b46fa            mov      ax, word ptr [bp - 6]
1:1D4F  8b56fc            mov      dx, word ptr [bp - 4]
1:1D52  8b5e06            mov      bx, word ptr [bp + 6]
1:1D55  8907              mov      word ptr [bx], ax
1:1D57  895702            mov      word ptr [bx + 2], dx
1:1D5A  8b46f6            mov      ax, word ptr [bp - 0xa]
1:1D5D  8b56f8            mov      dx, word ptr [bp - 8]
1:1D60  894708            mov      word ptr [bx + 8], ax
1:1D63  89570a            mov      word ptr [bx + 0xa], dx
1:1D66  ff76f0            push     word ptr [bp - 0x10]
1:1D69  ff76ee            push     word ptr [bp - 0x12]
1:1D6C  ff7716            push     word ptr [bx + 0x16]
1:1D6F  ff7714            push     word ptr [bx + 0x14]
1:1D72  0e                push     cs
1:1D73  e83d07            call     0x24b3
1:1D76  83c408            add      sp, 8
1:1D79  ff76f4            push     word ptr [bp - 0xc]
1:1D7C  ff76f2            push     word ptr [bp - 0xe]
1:1D7F  8b5e06            mov      bx, word ptr [bp + 6]
1:1D82  ff770e            push     word ptr [bx + 0xe]
1:1D85  ff770c            push     word ptr [bx + 0xc]
1:1D88  8bf0              mov      si, ax
1:1D8A  8bfa              mov      di, dx
1:1D8C  0e                push     cs
1:1D8D  e82307            call     0x24b3
1:1D90  83c408            add      sp, 8
1:1D93  2bc6              sub      ax, si
1:1D95  1bd7              sbb      dx, di
1:1D97  8946fa            mov      word ptr [bp - 6], ax
1:1D9A  8956fc            mov      word ptr [bp - 4], dx
1:1D9D  ff76f4            push     word ptr [bp - 0xc]
1:1DA0  ff76f2            push     word ptr [bp - 0xe]
1:1DA3  8b5e06            mov      bx, word ptr [bp + 6]
1:1DA6  ff7716            push     word ptr [bx + 0x16]
1:1DA9  ff7714            push     word ptr [bx + 0x14]
1:1DAC  0e                push     cs
1:1DAD  e80307            call     0x24b3
1:1DB0  83c408            add      sp, 8
1:1DB3  ff76f0            push     word ptr [bp - 0x10]
1:1DB6  ff76ee            push     word ptr [bp - 0x12]
1:1DB9  8b5e06            mov      bx, word ptr [bp + 6]
1:1DBC  ff770e            push     word ptr [bx + 0xe]
1:1DBF  ff770c            push     word ptr [bx + 0xc]
1:1DC2  8bf0              mov      si, ax
1:1DC4  8bfa              mov      di, dx
1:1DC6  0e                push     cs
1:1DC7  e8e906            call     0x24b3
1:1DCA  83c408            add      sp, 8
1:1DCD  03f0              add      si, ax
1:1DCF  13fa              adc      di, dx
1:1DD1  8976f6            mov      word ptr [bp - 0xa], si
1:1DD4  897ef8            mov      word ptr [bp - 8], di
1:1DD7  8b46fa            mov      ax, word ptr [bp - 6]
1:1DDA  8b56fc            mov      dx, word ptr [bp - 4]
1:1DDD  8b5e06            mov      bx, word ptr [bp + 6]
1:1DE0  89470c            mov      word ptr [bx + 0xc], ax
1:1DE3  89570e            mov      word ptr [bx + 0xe], dx
1:1DE6  8b46f6            mov      ax, word ptr [bp - 0xa]
1:1DE9  8b56f8            mov      dx, word ptr [bp - 8]
1:1DEC  894714            mov      word ptr [bx + 0x14], ax
1:1DEF  895716            mov      word ptr [bx + 0x16], dx
1:1DF2  ff76f0            push     word ptr [bp - 0x10]
1:1DF5  ff76ee            push     word ptr [bp - 0x12]
1:1DF8  ff7722            push     word ptr [bx + 0x22]
1:1DFB  ff7720            push     word ptr [bx + 0x20]
1:1DFE  0e                push     cs
1:1DFF  e8b106            call     0x24b3
1:1E02  83c408            add      sp, 8
1:1E05  ff76f4            push     word ptr [bp - 0xc]
1:1E08  ff76f2            push     word ptr [bp - 0xe]
1:1E0B  8b5e06            mov      bx, word ptr [bp + 6]
1:1E0E  ff771a            push     word ptr [bx + 0x1a]
1:1E11  ff7718            push     word ptr [bx + 0x18]
1:1E14  8bf0              mov      si, ax
1:1E16  8bfa              mov      di, dx
1:1E18  0e                push     cs
1:1E19  e89706            call     0x24b3
1:1E1C  83c408            add      sp, 8
1:1E1F  2bc6              sub      ax, si
1:1E21  1bd7              sbb      dx, di
1:1E23  8946fa            mov      word ptr [bp - 6], ax
1:1E26  8956fc            mov      word ptr [bp - 4], dx
1:1E29  ff76f4            push     word ptr [bp - 0xc]
1:1E2C  ff76f2            push     word ptr [bp - 0xe]
1:1E2F  8b5e06            mov      bx, word ptr [bp + 6]
1:1E32  ff7722            push     word ptr [bx + 0x22]
1:1E35  ff7720            push     word ptr [bx + 0x20]
1:1E38  0e                push     cs
1:1E39  e87706            call     0x24b3
1:1E3C  83c408            add      sp, 8
1:1E3F  ff76f0            push     word ptr [bp - 0x10]
1:1E42  ff76ee            push     word ptr [bp - 0x12]
1:1E45  8b5e06            mov      bx, word ptr [bp + 6]
1:1E48  ff771a            push     word ptr [bx + 0x1a]
1:1E4B  ff7718            push     word ptr [bx + 0x18]
1:1E4E  8bf0              mov      si, ax
1:1E50  8bfa              mov      di, dx
1:1E52  0e                push     cs
1:1E53  e85d06            call     0x24b3
1:1E56  83c408            add      sp, 8
1:1E59  03f0              add      si, ax
1:1E5B  13fa              adc      di, dx
1:1E5D  8976f6            mov      word ptr [bp - 0xa], si
1:1E60  897ef8            mov      word ptr [bp - 8], di
1:1E63  8b46fa            mov      ax, word ptr [bp - 6]
1:1E66  8b56fc            mov      dx, word ptr [bp - 4]
1:1E69  8b5e06            mov      bx, word ptr [bp + 6]
1:1E6C  894718            mov      word ptr [bx + 0x18], ax
1:1E6F  89571a            mov      word ptr [bx + 0x1a], dx
1:1E72  8b46f6            mov      ax, word ptr [bp - 0xa]
1:1E75  8b56f8            mov      dx, word ptr [bp - 8]
1:1E78  894720            mov      word ptr [bx + 0x20], ax
1:1E7B  895722            mov      word ptr [bx + 0x22], dx
1:1E7E  ff76f0            push     word ptr [bp - 0x10]
1:1E81  ff76ee            push     word ptr [bp - 0x12]
1:1E84  ff772e            push     word ptr [bx + 0x2e]
1:1E87  ff772c            push     word ptr [bx + 0x2c]
1:1E8A  0e                push     cs
1:1E8B  e82506            call     0x24b3
1:1E8E  83c408            add      sp, 8
1:1E91  ff76f4            push     word ptr [bp - 0xc]
1:1E94  ff76f2            push     word ptr [bp - 0xe]
1:1E97  8b5e06            mov      bx, word ptr [bp + 6]
1:1E9A  ff7726            push     word ptr [bx + 0x26]
1:1E9D  ff7724            push     word ptr [bx + 0x24]
1:1EA0  8bf0              mov      si, ax
1:1EA2  8bfa              mov      di, dx
1:1EA4  0e                push     cs
1:1EA5  e80b06            call     0x24b3
1:1EA8  83c408            add      sp, 8
1:1EAB  2bc6              sub      ax, si
1:1EAD  1bd7              sbb      dx, di
1:1EAF  8946fa            mov      word ptr [bp - 6], ax
1:1EB2  8956fc            mov      word ptr [bp - 4], dx
1:1EB5  ff76f4            push     word ptr [bp - 0xc]
1:1EB8  ff76f2            push     word ptr [bp - 0xe]
1:1EBB  8b5e06            mov      bx, word ptr [bp + 6]
1:1EBE  ff772e            push     word ptr [bx + 0x2e]
1:1EC1  ff772c            push     word ptr [bx + 0x2c]
1:1EC4  0e                push     cs
1:1EC5  e8eb05            call     0x24b3
1:1EC8  83c408            add      sp, 8
1:1ECB  ff76f0            push     word ptr [bp - 0x10]
1:1ECE  ff76ee            push     word ptr [bp - 0x12]
1:1ED1  8b5e06            mov      bx, word ptr [bp + 6]
1:1ED4  ff7726            push     word ptr [bx + 0x26]
1:1ED7  ff7724            push     word ptr [bx + 0x24]
1:1EDA  8bf0              mov      si, ax
1:1EDC  8bfa              mov      di, dx
1:1EDE  0e                push     cs
1:1EDF  e8d105            call     0x24b3
1:1EE2  83c408            add      sp, 8
1:1EE5  03f0              add      si, ax
1:1EE7  13fa              adc      di, dx
1:1EE9  8976f6            mov      word ptr [bp - 0xa], si
1:1EEC  897ef8            mov      word ptr [bp - 8], di
1:1EEF  8b46fa            mov      ax, word ptr [bp - 6]
1:1EF2  8b56fc            mov      dx, word ptr [bp - 4]
1:1EF5  8b5e06            mov      bx, word ptr [bp + 6]
1:1EF8  894724            mov      word ptr [bx + 0x24], ax
1:1EFB  895726            mov      word ptr [bx + 0x26], dx
1:1EFE  8b46f6            mov      ax, word ptr [bp - 0xa]
1:1F01  8b56f8            mov      dx, word ptr [bp - 8]
1:1F04  89472c            mov      word ptr [bx + 0x2c], ax
1:1F07  89572e            mov      word ptr [bx + 0x2e], dx
1:1F0A  5e                pop      si
1:1F0B  5f                pop      di
1:1F0C  4d                dec      bp
1:1F0D  4d                dec      bp
1:1F0E  8be5              mov      sp, bp
1:1F10  1f                pop      ds
1:1F11  5d                pop      bp
1:1F12  4d                dec      bp
1:1F13  cb                retf     

; ===== EXPORT:ord_9(#9) =====
1:1F14  1e                push     ds
1:1F15  58                pop      ax
1:1F16  90                nop      
1:1F17  45                inc      bp
1:1F18  55                push     bp
1:1F19  8bec              mov      bp, sp
1:1F1B  1e                push     ds
1:1F1C  8ed8              mov      ds, ax
1:1F1E  83ec1a            sub      sp, 0x1a
1:1F21  57                push     di
1:1F22  56                push     si
1:1F23  8b5e06            mov      bx, word ptr [bp + 6]
1:1F26  ff7702            push     word ptr [bx + 2]
1:1F29  ff37              push     word ptr [bx]
1:1F2B  8b7608            mov      si, word ptr [bp + 8]
1:1F2E  ff7402            push     word ptr [si + 2]
1:1F31  ff34              push     word ptr [si]
1:1F33  0e                push     cs
1:1F34  e87a04            call     0x23b1
1:1F37  83c408            add      sp, 8
1:1F3A  8b5e06            mov      bx, word ptr [bp + 6]
1:1F3D  ff770a            push     word ptr [bx + 0xa]
1:1F40  ff7708            push     word ptr [bx + 8]
1:1F43  ff741a            push     word ptr [si + 0x1a]
1:1F46  ff7418            push     word ptr [si + 0x18]
1:1F49  8bf8              mov      di, ax
1:1F4B  8bf2              mov      si, dx
1:1F4D  0e                push     cs
1:1F4E  e86004            call     0x23b1
1:1F51  83c408            add      sp, 8
1:1F54  8b5e06            mov      bx, word ptr [bp + 6]
1:1F57  ff7706            push     word ptr [bx + 6]
1:1F5A  ff7704            push     word ptr [bx + 4]
1:1F5D  8b5e08            mov      bx, word ptr [bp + 8]
1:1F60  ff770e            push     word ptr [bx + 0xe]
1:1F63  ff770c            push     word ptr [bx + 0xc]
1:1F66  8946ee            mov      word ptr [bp - 0x12], ax
1:1F69  8956f0            mov      word ptr [bp - 0x10], dx
1:1F6C  0e                push     cs
1:1F6D  e84104            call     0x23b1
1:1F70  83c408            add      sp, 8
1:1F73  0346ee            add      ax, word ptr [bp - 0x12]
1:1F76  1356f0            adc      dx, word ptr [bp - 0x10]
1:1F79  8b5e08            mov      bx, word ptr [bp + 8]
1:1F7C  034724            add      ax, word ptr [bx + 0x24]
1:1F7F  135726            adc      dx, word ptr [bx + 0x26]
1:1F82  03f8              add      di, ax
1:1F84  13f2              adc      si, dx
1:1F86  897efa            mov      word ptr [bp - 6], di
1:1F89  8976fc            mov      word ptr [bp - 4], si
1:1F8C  8b7606            mov      si, word ptr [bp + 6]
1:1F8F  ff7402            push     word ptr [si + 2]
1:1F92  ff34              push     word ptr [si]
1:1F94  ff7706            push     word ptr [bx + 6]
1:1F97  ff7704            push     word ptr [bx + 4]
1:1F9A  0e                push     cs
1:1F9B  e81304            call     0x23b1
1:1F9E  83c408            add      sp, 8
1:1FA1  ff740a            push     word ptr [si + 0xa]
1:1FA4  ff7408            push     word ptr [si + 8]
1:1FA7  8b5e08            mov      bx, word ptr [bp + 8]
1:1FAA  ff771e            push     word ptr [bx + 0x1e]
1:1FAD  ff771c            push     word ptr [bx + 0x1c]
1:1FB0  8bf8              mov      di, ax
1:1FB2  8bf2              mov      si, dx
1:1FB4  0e                push     cs
1:1FB5  e8f903            call     0x23b1
1:1FB8  83c408            add      sp, 8
1:1FBB  8b5e06            mov      bx, word ptr [bp + 6]
1:1FBE  ff7706            push     word ptr [bx + 6]
1:1FC1  ff7704            push     word ptr [bx + 4]
1:1FC4  8b5e08            mov      bx, word ptr [bp + 8]
1:1FC7  ff7712            push     word ptr [bx + 0x12]
1:1FCA  ff7710            push     word ptr [bx + 0x10]
1:1FCD  8946ea            mov      word ptr [bp - 0x16], ax
1:1FD0  8956ec            mov      word ptr [bp - 0x14], dx
1:1FD3  0e                push     cs
1:1FD4  e8da03            call     0x23b1
1:1FD7  83c408            add      sp, 8
1:1FDA  0346ea            add      ax, word ptr [bp - 0x16]
1:1FDD  1356ec            adc      dx, word ptr [bp - 0x14]
1:1FE0  8b5e08            mov      bx, word ptr [bp + 8]
1:1FE3  034728            add      ax, word ptr [bx + 0x28]
1:1FE6  13572a            adc      dx, word ptr [bx + 0x2a]
1:1FE9  03f8              add      di, ax
1:1FEB  13f2              adc      si, dx
1:1FED  897ef6            mov      word ptr [bp - 0xa], di
1:1FF0  8976f8            mov      word ptr [bp - 8], si
1:1FF3  8b7606            mov      si, word ptr [bp + 6]
1:1FF6  ff7402            push     word ptr [si + 2]
1:1FF9  ff34              push     word ptr [si]
1:1FFB  ff770a            push     word ptr [bx + 0xa]
1:1FFE  ff7708            push     word ptr [bx + 8]
1:2001  0e                push     cs
1:2002  e8ac03            call     0x23b1
1:2005  83c408            add      sp, 8
1:2008  ff740a            push     word ptr [si + 0xa]
1:200B  ff7408            push     word ptr [si + 8]
1:200E  8b5e08            mov      bx, word ptr [bp + 8]
1:2011  ff7722            push     word ptr [bx + 0x22]
1:2014  ff7720            push     word ptr [bx + 0x20]
1:2017  8bf8              mov      di, ax
1:2019  8bf2              mov      si, dx
1:201B  0e                push     cs
1:201C  e89203            call     0x23b1
1:201F  83c408            add      sp, 8
1:2022  8b5e06            mov      bx, word ptr [bp + 6]
1:2025  ff7706            push     word ptr [bx + 6]
1:2028  ff7704            push     word ptr [bx + 4]
1:202B  8b5e08            mov      bx, word ptr [bp + 8]
1:202E  ff7716            push     word ptr [bx + 0x16]
1:2031  ff7714            push     word ptr [bx + 0x14]
1:2034  8946e6            mov      word ptr [bp - 0x1a], ax
1:2037  8956e8            mov      word ptr [bp - 0x18], dx
1:203A  0e                push     cs
1:203B  e87303            call     0x23b1
1:203E  83c408            add      sp, 8
1:2041  0346e6            add      ax, word ptr [bp - 0x1a]
1:2044  1356e8            adc      dx, word ptr [bp - 0x18]
1:2047  03f8              add      di, ax
1:2049  13f2              adc      si, dx
1:204B  8b5e08            mov      bx, word ptr [bp + 8]
1:204E  037f2c            add      di, word ptr [bx + 0x2c]
1:2051  13772e            adc      si, word ptr [bx + 0x2e]
1:2054  897ef2            mov      word ptr [bp - 0xe], di
1:2057  8976f4            mov      word ptr [bp - 0xc], si
1:205A  8b46fa            mov      ax, word ptr [bp - 6]
1:205D  8b56fc            mov      dx, word ptr [bp - 4]
1:2060  8b5e06            mov      bx, word ptr [bp + 6]
1:2063  8907              mov      word ptr [bx], ax
1:2065  895702            mov      word ptr [bx + 2], dx
1:2068  8b46f6            mov      ax, word ptr [bp - 0xa]
1:206B  8b56f8            mov      dx, word ptr [bp - 8]
1:206E  894704            mov      word ptr [bx + 4], ax
1:2071  895706            mov      word ptr [bx + 6], dx
1:2074  8b46f2            mov      ax, word ptr [bp - 0xe]
1:2077  8b56f4            mov      dx, word ptr [bp - 0xc]
1:207A  894708            mov      word ptr [bx + 8], ax
1:207D  89570a            mov      word ptr [bx + 0xa], dx
1:2080  5e                pop      si
1:2081  5f                pop      di
1:2082  4d                dec      bp
1:2083  4d                dec      bp
1:2084  8be5              mov      sp, bp
1:2086  1f                pop      ds
1:2087  5d                pop      bp
1:2088  4d                dec      bp
1:2089  cb                retf     
1:208A  1e                push     ds
1:208B  58                pop      ax
1:208C  90                nop      
1:208D  45                inc      bp
1:208E  55                push     bp
1:208F  8bec              mov      bp, sp
1:2091  1e                push     ds
1:2092  8ed8              mov      ds, ax
1:2094  57                push     di
1:2095  56                push     si
1:2096  8b5e08            mov      bx, word ptr [bp + 8]
1:2099  ff7706            push     word ptr [bx + 6]
1:209C  ff7704            push     word ptr [bx + 4]
1:209F  8b7606            mov      si, word ptr [bp + 6]
1:20A2  ff740a            push     word ptr [si + 0xa]
1:20A5  ff7408            push     word ptr [si + 8]
1:20A8  0e                push     cs
1:20A9  e80503            call     0x23b1
1:20AC  83c408            add      sp, 8
1:20AF  8b5e08            mov      bx, word ptr [bp + 8]
1:20B2  ff770a            push     word ptr [bx + 0xa]
1:20B5  ff7708            push     word ptr [bx + 8]
1:20B8  ff7406            push     word ptr [si + 6]
1:20BB  ff7404            push     word ptr [si + 4]
1:20BE  8bf8              mov      di, ax
1:20C0  8bf2              mov      si, dx
1:20C2  0e                push     cs
1:20C3  e8eb02            call     0x23b1
1:20C6  83c408            add      sp, 8
1:20C9  2bc7              sub      ax, di
1:20CB  1bd6              sbb      dx, si
1:20CD  8b5e0a            mov      bx, word ptr [bp + 0xa]
1:20D0  8907              mov      word ptr [bx], ax
1:20D2  895702            mov      word ptr [bx + 2], dx
1:20D5  8b7608            mov      si, word ptr [bp + 8]
1:20D8  ff740a            push     word ptr [si + 0xa]
1:20DB  ff7408            push     word ptr [si + 8]
1:20DE  8b7e06            mov      di, word ptr [bp + 6]
1:20E1  ff7502            push     word ptr [di + 2]
1:20E4  ff35              push     word ptr [di]
1:20E6  0e                push     cs
1:20E7  e8c702            call     0x23b1
1:20EA  83c408            add      sp, 8
1:20ED  ff7402            push     word ptr [si + 2]
1:20F0  ff34              push     word ptr [si]
1:20F2  ff750a            push     word ptr [di + 0xa]
1:20F5  ff7508            push     word ptr [di + 8]
1:20F8  8bf0              mov      si, ax
1:20FA  8bfa              mov      di, dx
1:20FC  0e                push     cs
1:20FD  e8b102            call     0x23b1
1:2100  83c408            add      sp, 8
1:2103  2bc6              sub      ax, si
1:2105  1bd7              sbb      dx, di
1:2107  8b5e0a            mov      bx, word ptr [bp + 0xa]
1:210A  894704            mov      word ptr [bx + 4], ax
1:210D  895706            mov      word ptr [bx + 6], dx
1:2110  8b7608            mov      si, word ptr [bp + 8]
1:2113  ff7402            push     word ptr [si + 2]
1:2116  ff34              push     word ptr [si]
1:2118  8b7e06            mov      di, word ptr [bp + 6]
1:211B  ff7506            push     word ptr [di + 6]
1:211E  ff7504            push     word ptr [di + 4]
1:2121  0e                push     cs
1:2122  e88c02            call     0x23b1
1:2125  83c408            add      sp, 8
1:2128  ff7406            push     word ptr [si + 6]
1:212B  ff7404            push     word ptr [si + 4]
1:212E  ff7502            push     word ptr [di + 2]
1:2131  ff35              push     word ptr [di]
1:2133  8bf0              mov      si, ax
1:2135  8bfa              mov      di, dx
1:2137  0e                push     cs
1:2138  e87602            call     0x23b1
1:213B  83c408            add      sp, 8
1:213E  2bc6              sub      ax, si
1:2140  1bd7              sbb      dx, di
1:2142  8b5e0a            mov      bx, word ptr [bp + 0xa]
1:2145  894708            mov      word ptr [bx + 8], ax
1:2148  89570a            mov      word ptr [bx + 0xa], dx
1:214B  5e                pop      si
1:214C  5f                pop      di
1:214D  4d                dec      bp
1:214E  4d                dec      bp
1:214F  8be5              mov      sp, bp
1:2151  1f                pop      ds
1:2152  5d                pop      bp
1:2153  4d                dec      bp
1:2154  cb                retf     

; ===== EXPORT:ord_18(#18) =====
1:2155  1e                push     ds
1:2156  58                pop      ax
1:2157  90                nop      
1:2158  45                inc      bp
1:2159  55                push     bp
1:215A  8bec              mov      bp, sp
1:215C  1e                push     ds
1:215D  8ed8              mov      ds, ax
1:215F  83ec06            sub      sp, 6
1:2162  57                push     di
1:2163  56                push     si
1:2164  8b5e08            mov      bx, word ptr [bp + 8]
1:2167  ff7706            push     word ptr [bx + 6]
1:216A  ff7704            push     word ptr [bx + 4]
1:216D  8b7606            mov      si, word ptr [bp + 6]
1:2170  ff7406            push     word ptr [si + 6]
1:2173  ff7404            push     word ptr [si + 4]
1:2176  0e                push     cs
1:2177  e83702            call     0x23b1
1:217A  83c408            add      sp, 8
1:217D  8b5e08            mov      bx, word ptr [bp + 8]
1:2180  ff7702            push     word ptr [bx + 2]
1:2183  ff37              push     word ptr [bx]
1:2185  ff7402            push     word ptr [si + 2]
1:2188  ff34              push     word ptr [si]
1:218A  8bf8              mov      di, ax
1:218C  8bf2              mov      si, dx
1:218E  0e                push     cs
1:218F  e81f02            call     0x23b1
1:2192  83c408            add      sp, 8
1:2195  8b5e08            mov      bx, word ptr [bp + 8]
1:2198  ff770a            push     word ptr [bx + 0xa]
1:219B  ff7708            push     word ptr [bx + 8]
1:219E  8b5e06            mov      bx, word ptr [bp + 6]
1:21A1  ff770a            push     word ptr [bx + 0xa]
1:21A4  ff7708            push     word ptr [bx + 8]
1:21A7  8946fa            mov      word ptr [bp - 6], ax
1:21AA  8956fc            mov      word ptr [bp - 4], dx
1:21AD  0e                push     cs
1:21AE  e80002            call     0x23b1
1:21B1  83c408            add      sp, 8
1:21B4  037efa            add      di, word ptr [bp - 6]
1:21B7  1376fc            adc      si, word ptr [bp - 4]
1:21BA  03c7              add      ax, di
1:21BC  13d6              adc      dx, si
1:21BE  5e                pop      si
1:21BF  5f                pop      di
1:21C0  4d                dec      bp
1:21C1  4d                dec      bp
1:21C2  8be5              mov      sp, bp
1:21C4  1f                pop      ds
1:21C5  5d                pop      bp
1:21C6  4d                dec      bp
1:21C7  cb                retf     
1:21C8  1e                push     ds
1:21C9  58                pop      ax
1:21CA  90                nop      
1:21CB  45                inc      bp
1:21CC  55                push     bp
1:21CD  8bec              mov      bp, sp
1:21CF  1e                push     ds
1:21D0  8ed8              mov      ds, ax
1:21D2  83ec1a            sub      sp, 0x1a
1:21D5  c746fa0000        mov      word ptr [bp - 6], 0
1:21DA  c746fc0100        mov      word ptr [bp - 4], 1
1:21DF  8b5e06            mov      bx, word ptr [bp + 6]
1:21E2  ff7702            push     word ptr [bx + 2]
1:21E5  ff37              push     word ptr [bx]
1:21E7  ff7702            push     word ptr [bx + 2]
1:21EA  ff37              push     word ptr [bx]
1:21EC  0e                push     cs
1:21ED  e8c101            call     0x23b1
1:21F0  83c408            add      sp, 8
1:21F3  8946ee            mov      word ptr [bp - 0x12], ax
1:21F6  8956f0            mov      word ptr [bp - 0x10], dx
1:21F9  8b5e06            mov      bx, word ptr [bp + 6]
1:21FC  ff7706            push     word ptr [bx + 6]
1:21FF  ff7704            push     word ptr [bx + 4]
1:2202  ff7706            push     word ptr [bx + 6]
1:2205  ff7704            push     word ptr [bx + 4]
1:2208  0e                push     cs
1:2209  e8a501            call     0x23b1
1:220C  83c408            add      sp, 8
1:220F  8946ea            mov      word ptr [bp - 0x16], ax
1:2212  8956ec            mov      word ptr [bp - 0x14], dx
1:2215  8b5e06            mov      bx, word ptr [bp + 6]
1:2218  ff770a            push     word ptr [bx + 0xa]
1:221B  ff7708            push     word ptr [bx + 8]
1:221E  ff770a            push     word ptr [bx + 0xa]
1:2221  ff7708            push     word ptr [bx + 8]
1:2224  0e                push     cs
1:2225  e88901            call     0x23b1
1:2228  83c408            add      sp, 8
1:222B  8946e6            mov      word ptr [bp - 0x1a], ax
1:222E  8956e8            mov      word ptr [bp - 0x18], dx
1:2231  0346ea            add      ax, word ptr [bp - 0x16]
1:2234  1356ec            adc      dx, word ptr [bp - 0x14]
1:2237  0346ee            add      ax, word ptr [bp - 0x12]
1:223A  1356f0            adc      dx, word ptr [bp - 0x10]
1:223D  8946f2            mov      word ptr [bp - 0xe], ax
1:2240  8956f4            mov      word ptr [bp - 0xc], dx
1:2243  8b46ee            mov      ax, word ptr [bp - 0x12]
1:2246  8b56f0            mov      dx, word ptr [bp - 0x10]
1:2249  3956fc            cmp      word ptr [bp - 4], dx
1:224C  7c3d              jl       0x228b
1:224E  7f05              jg       0x2255
1:2250  3946fa            cmp      word ptr [bp - 6], ax
1:2253  7236              jb       0x228b
1:2255  8b46ea            mov      ax, word ptr [bp - 0x16]
1:2258  8b56ec            mov      dx, word ptr [bp - 0x14]
1:225B  3956fc            cmp      word ptr [bp - 4], dx
1:225E  7c2b              jl       0x228b
1:2260  7f05              jg       0x2267
1:2262  3946fa            cmp      word ptr [bp - 6], ax
1:2265  7224              jb       0x228b
1:2267  8b46e6            mov      ax, word ptr [bp - 0x1a]
1:226A  8b56e8            mov      dx, word ptr [bp - 0x18]
1:226D  3956fc            cmp      word ptr [bp - 4], dx
1:2270  7c19              jl       0x228b
1:2272  7f05              jg       0x2279
1:2274  3946fa            cmp      word ptr [bp - 6], ax
1:2277  7212              jb       0x228b
1:2279  8b46f2            mov      ax, word ptr [bp - 0xe]
1:227C  8b56f4            mov      dx, word ptr [bp - 0xc]
1:227F  3956fc            cmp      word ptr [bp - 4], dx
1:2282  7f1e              jg       0x22a2
1:2284  7c05              jl       0x228b
1:2286  3946fa            cmp      word ptr [bp - 6], ax
1:2289  7317              jae      0x22a2
1:228B  8b5e06            mov      bx, word ptr [bp + 6]
1:228E  d17f02            sar      word ptr [bx + 2], 1
1:2291  d11f              rcr      word ptr [bx], 1
1:2293  d17f06            sar      word ptr [bx + 6], 1
1:2296  d15f04            rcr      word ptr [bx + 4], 1
1:2299  d17f0a            sar      word ptr [bx + 0xa], 1
1:229C  d15f08            rcr      word ptr [bx + 8], 1
1:229F  e940ff            jmp      0x21e2
1:22A2  52                push     dx
1:22A3  50                push     ax
1:22A4  0e                push     cs
1:22A5  e89b04            call     0x2743
1:22A8  5b                pop      bx
1:22A9  5b                pop      bx
1:22AA  8946f6            mov      word ptr [bp - 0xa], ax
1:22AD  8956f8            mov      word ptr [bp - 8], dx
1:22B0  0bd0              or       dx, ax
1:22B2  7450              je       0x2304
1:22B4  ff76f8            push     word ptr [bp - 8]
1:22B7  50                push     ax
1:22B8  8b5e06            mov      bx, word ptr [bp + 6]
1:22BB  ff7702            push     word ptr [bx + 2]
1:22BE  ff37              push     word ptr [bx]
1:22C0  0e                push     cs
1:22C1  e8dc03            call     0x26a0
1:22C4  83c408            add      sp, 8
1:22C7  8b5e06            mov      bx, word ptr [bp + 6]
1:22CA  8907              mov      word ptr [bx], ax
1:22CC  895702            mov      word ptr [bx + 2], dx
1:22CF  ff76f8            push     word ptr [bp - 8]
1:22D2  ff76f6            push     word ptr [bp - 0xa]
1:22D5  ff7706            push     word ptr [bx + 6]
1:22D8  ff7704            push     word ptr [bx + 4]
1:22DB  0e                push     cs
1:22DC  e8c103            call     0x26a0
1:22DF  83c408            add      sp, 8
1:22E2  8b5e06            mov      bx, word ptr [bp + 6]
1:22E5  894704            mov      word ptr [bx + 4], ax
1:22E8  895706            mov      word ptr [bx + 6], dx
1:22EB  ff76f8            push     word ptr [bp - 8]
1:22EE  ff76f6            push     word ptr [bp - 0xa]
1:22F1  ff770a            push     word ptr [bx + 0xa]
1:22F4  ff7708            push     word ptr [bx + 8]
1:22F7  0e                push     cs
1:22F8  e8a503            call     0x26a0
1:22FB  8b5e06            mov      bx, word ptr [bp + 6]
1:22FE  894708            mov      word ptr [bx + 8], ax
1:2301  89570a            mov      word ptr [bx + 0xa], dx
1:2304  4d                dec      bp
1:2305  4d                dec      bp
1:2306  8be5              mov      sp, bp
1:2308  1f                pop      ds
1:2309  5d                pop      bp
1:230A  4d                dec      bp
1:230B  cb                retf     

; ===== EXPORT:ord_16(#16) =====
1:230C  1e                push     ds
1:230D  58                pop      ax
1:230E  90                nop      
1:230F  45                inc      bp
1:2310  55                push     bp
1:2311  8bec              mov      bp, sp
1:2313  1e                push     ds
1:2314  8ed8              mov      ds, ax
1:2316  56                push     si
1:2317  8b5e06            mov      bx, word ptr [bp + 6]
1:231A  8b07              mov      ax, word ptr [bx]
1:231C  8b5702            mov      dx, word ptr [bx + 2]
1:231F  8b7608            mov      si, word ptr [bp + 8]
1:2322  2b04              sub      ax, word ptr [si]
1:2324  1b5402            sbb      dx, word ptr [si + 2]
1:2327  a34c09            mov      word ptr [0x94c], ax
1:232A  89164e09          mov      word ptr [0x94e], dx
1:232E  8b4704            mov      ax, word ptr [bx + 4]
1:2331  8b5706            mov      dx, word ptr [bx + 6]
1:2334  2b4404            sub      ax, word ptr [si + 4]
1:2337  1b5406            sbb      dx, word ptr [si + 6]
1:233A  a35009            mov      word ptr [0x950], ax
1:233D  89165209          mov      word ptr [0x952], dx
1:2341  8b4708            mov      ax, word ptr [bx + 8]
1:2344  8b570a            mov      dx, word ptr [bx + 0xa]
1:2347  2b4408            sub      ax, word ptr [si + 8]
1:234A  1b540a            sbb      dx, word ptr [si + 0xa]
1:234D  a35409            mov      word ptr [0x954], ax
1:2350  89165609          mov      word ptr [0x956], dx
1:2354  8b5e0a            mov      bx, word ptr [bp + 0xa]
1:2357  8b07              mov      ax, word ptr [bx]
1:2359  8b5702            mov      dx, word ptr [bx + 2]
1:235C  2b04              sub      ax, word ptr [si]
1:235E  1b5402            sbb      dx, word ptr [si + 2]
1:2361  a35809            mov      word ptr [0x958], ax
1:2364  89165a09          mov      word ptr [0x95a], dx
1:2368  8b4704            mov      ax, word ptr [bx + 4]
1:236B  8b5706            mov      dx, word ptr [bx + 6]
1:236E  2b4404            sub      ax, word ptr [si + 4]
1:2371  1b5406            sbb      dx, word ptr [si + 6]
1:2374  a35c09            mov      word ptr [0x95c], ax
1:2377  89165e09          mov      word ptr [0x95e], dx
1:237B  8b4708            mov      ax, word ptr [bx + 8]
1:237E  8b570a            mov      dx, word ptr [bx + 0xa]
1:2381  2b4408            sub      ax, word ptr [si + 8]
1:2384  1b540a            sbb      dx, word ptr [si + 0xa]
1:2387  a36009            mov      word ptr [0x960], ax
1:238A  89166209          mov      word ptr [0x962], dx
1:238E  ff760c            push     word ptr [bp + 0xc]
1:2391  b85809            mov      ax, 0x958
1:2394  50                push     ax
1:2395  b84c09            mov      ax, 0x94c
1:2398  50                push     ax
1:2399  0e                push     cs
1:239A  e8edfc            call     0x208a
1:239D  83c406            add      sp, 6
1:23A0  ff760c            push     word ptr [bp + 0xc]
1:23A3  0e                push     cs
1:23A4  e821fe            call     0x21c8
1:23A7  5b                pop      bx
1:23A8  5e                pop      si
1:23A9  4d                dec      bp
1:23AA  4d                dec      bp
1:23AB  8be5              mov      sp, bp
1:23AD  1f                pop      ds
1:23AE  5d                pop      bp
1:23AF  4d                dec      bp
1:23B0  cb                retf     

; ===== EXPORT:ord_4(#4) =====
1:23B1  1e                push     ds
1:23B2  58                pop      ax
1:23B3  90                nop      
1:23B4  45                inc      bp
1:23B5  55                push     bp
1:23B6  8bec              mov      bp, sp
1:23B8  1e                push     ds
1:23B9  8ed8              mov      ds, ax
1:23BB  83ec38            sub      sp, 0x38
1:23BE  57                push     di
1:23BF  56                push     si
1:23C0  8b560c            mov      dx, word ptr [bp + 0xc]
1:23C3  335608            xor      dx, word ptr [bp + 8]
1:23C6  8956ec            mov      word ptr [bp - 0x14], dx
1:23C9  8b4606            mov      ax, word ptr [bp + 6]
1:23CC  8b5608            mov      dx, word ptr [bp + 8]
1:23CF  0bd2              or       dx, dx
1:23D1  7d07              jge      0x23da
1:23D3  f7d8              neg      ax
1:23D5  83d200            adc      dx, 0
1:23D8  f7da              neg      dx
1:23DA  8946fa            mov      word ptr [bp - 6], ax
1:23DD  8956fc            mov      word ptr [bp - 4], dx
1:23E0  8b460a            mov      ax, word ptr [bp + 0xa]
1:23E3  8b560c            mov      dx, word ptr [bp + 0xc]
1:23E6  0bd2              or       dx, dx
1:23E8  7d07              jge      0x23f1
1:23EA  f7d8              neg      ax
1:23EC  83d200            adc      dx, 0
1:23EF  f7da              neg      dx
1:23F1  8b4efa            mov      cx, word ptr [bp - 6]
1:23F4  8b5efc            mov      bx, word ptr [bp - 4]
1:23F7  895edc            mov      word ptr [bp - 0x24], bx
1:23FA  8956da            mov      word ptr [bp - 0x26], dx
1:23FD  2bf6              sub      si, si
1:23FF  56                push     si
1:2400  51                push     cx
1:2401  2bd2              sub      dx, dx
1:2403  52                push     dx
1:2404  50                push     ax
1:2405  8bf8              mov      di, ax
1:2407  894ed0            mov      word ptr [bp - 0x30], cx
1:240A  8976d2            mov      word ptr [bp - 0x2e], si
1:240D  9a30240000        lcall    0, 0x2430  ; @1:INT:ord_19(1:2C48)
1:2412  8956d8            mov      word ptr [bp - 0x28], dx
1:2415  8b46dc            mov      ax, word ptr [bp - 0x24]
1:2418  2bd2              sub      dx, dx
1:241A  52                push     dx
1:241B  50                push     ax
1:241C  8b4eda            mov      cx, word ptr [bp - 0x26]
1:241F  2bdb              sub      bx, bx
1:2421  53                push     bx
1:2422  51                push     cx
1:2423  8946cc            mov      word ptr [bp - 0x34], ax
1:2426  8956ce            mov      word ptr [bp - 0x32], dx
1:2429  894ec8            mov      word ptr [bp - 0x38], cx
1:242C  895eca            mov      word ptr [bp - 0x36], bx
1:242F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_19(1:2C48)
1:2434  8946e2            mov      word ptr [bp - 0x1e], ax
1:2437  8956e4            mov      word ptr [bp - 0x1c], dx
1:243A  2bc9              sub      cx, cx
1:243C  034ed8            add      cx, word ptr [bp - 0x28]
1:243F  150000            adc      ax, 0
1:2442  894ef2            mov      word ptr [bp - 0xe], cx
1:2445  8946f4            mov      word ptr [bp - 0xc], ax
1:2448  56                push     si
1:2449  57                push     di
1:244A  ff76ce            push     word ptr [bp - 0x32]
1:244D  ff76cc            push     word ptr [bp - 0x34]
1:2450  9a66240000        lcall    0, 0x2466  ; @1:INT:ord_19(1:2C48)
1:2455  ff76d2            push     word ptr [bp - 0x2e]
1:2458  ff76d0            push     word ptr [bp - 0x30]
1:245B  ff76ca            push     word ptr [bp - 0x36]
1:245E  ff76c8            push     word ptr [bp - 0x38]
1:2461  8bf0              mov      si, ax
1:2463  8bfa              mov      di, dx
1:2465  9a1b250000        lcall    0, 0x251b  ; @1:INT:ord_19(1:2C48)
1:246A  03f0              add      si, ax
1:246C  13fa              adc      di, dx
1:246E  837ee400          cmp      word ptr [bp - 0x1c], 0
1:2472  7507              jne      0x247b
1:2474  817ee2007e        cmp      word ptr [bp - 0x1e], 0x7e00
1:2479  7208              jb       0x2483
1:247B  b8ffff            mov      ax, 0xffff
1:247E  baff7f            mov      dx, 0x7fff
1:2481  eb0a              jmp      0x248d
1:2483  8bc6              mov      ax, si
1:2485  8bd7              mov      dx, di
1:2487  0346f2            add      ax, word ptr [bp - 0xe]
1:248A  1356f4            adc      dx, word ptr [bp - 0xc]
1:248D  8946d4            mov      word ptr [bp - 0x2c], ax
1:2490  8956d6            mov      word ptr [bp - 0x2a], dx
1:2493  837eec00          cmp      word ptr [bp - 0x14], 0
1:2497  7d0a              jge      0x24a3
1:2499  f75ed4            neg      word ptr [bp - 0x2c]
1:249C  8356d600          adc      word ptr [bp - 0x2a], 0
1:24A0  f75ed6            neg      word ptr [bp - 0x2a]
1:24A3  8b46d4            mov      ax, word ptr [bp - 0x2c]
1:24A6  8b56d6            mov      dx, word ptr [bp - 0x2a]
1:24A9  5e                pop      si
1:24AA  5f                pop      di
1:24AB  4d                dec      bp
1:24AC  4d                dec      bp
1:24AD  8be5              mov      sp, bp
1:24AF  1f                pop      ds
1:24B0  5d                pop      bp
1:24B1  4d                dec      bp
1:24B2  cb                retf     

; ===== EXPORT:ord_8(#8) =====
1:24B3  1e                push     ds
1:24B4  58                pop      ax
1:24B5  90                nop      
1:24B6  45                inc      bp
1:24B7  55                push     bp
1:24B8  8bec              mov      bp, sp
1:24BA  1e                push     ds
1:24BB  8ed8              mov      ds, ax
1:24BD  83ec3e            sub      sp, 0x3e
1:24C0  57                push     di
1:24C1  56                push     si
1:24C2  8b460a            mov      ax, word ptr [bp + 0xa]
1:24C5  8b560c            mov      dx, word ptr [bp + 0xc]
1:24C8  334606            xor      ax, word ptr [bp + 6]
1:24CB  335608            xor      dx, word ptr [bp + 8]
1:24CE  8bc8              mov      cx, ax
1:24D0  8bda              mov      bx, dx
1:24D2  8b4606            mov      ax, word ptr [bp + 6]
1:24D5  8b5608            mov      dx, word ptr [bp + 8]
1:24D8  0bd2              or       dx, dx
1:24DA  7d07              jge      0x24e3
1:24DC  f7d8              neg      ax
1:24DE  83d200            adc      dx, 0
1:24E1  f7da              neg      dx
1:24E3  8bf0              mov      si, ax
1:24E5  8bfa              mov      di, dx
1:24E7  8b460a            mov      ax, word ptr [bp + 0xa]
1:24EA  8b560c            mov      dx, word ptr [bp + 0xc]
1:24ED  0bd2              or       dx, dx
1:24EF  7d07              jge      0x24f8
1:24F1  f7d8              neg      ax
1:24F3  83d200            adc      dx, 0
1:24F6  f7da              neg      dx
1:24F8  8956d4            mov      word ptr [bp - 0x2c], dx
1:24FB  8bd0              mov      dx, ax
1:24FD  8b46d4            mov      ax, word ptr [bp - 0x2c]
1:2500  8946de            mov      word ptr [bp - 0x22], ax
1:2503  8bc1              mov      ax, cx
1:2505  2bc9              sub      cx, cx
1:2507  51                push     cx
1:2508  56                push     si
1:2509  8976ce            mov      word ptr [bp - 0x32], si
1:250C  894ed0            mov      word ptr [bp - 0x30], cx
1:250F  51                push     cx
1:2510  52                push     dx
1:2511  8956ca            mov      word ptr [bp - 0x36], dx
1:2514  894ecc            mov      word ptr [bp - 0x34], cx
1:2517  895ec8            mov      word ptr [bp - 0x38], bx
1:251A  9a3d250000        lcall    0, 0x253d  ; @1:INT:ord_19(1:2C48)
1:251F  b10e              mov      cl, 0xe
1:2521  d3ea              shr      dx, cl
1:2523  2bdb              sub      bx, bx
1:2525  8956da            mov      word ptr [bp - 0x26], dx
1:2528  895edc            mov      word ptr [bp - 0x24], bx
1:252B  2bf6              sub      si, si
1:252D  56                push     si
1:252E  57                push     di
1:252F  8b46de            mov      ax, word ptr [bp - 0x22]
1:2532  2bd2              sub      dx, dx
1:2534  52                push     dx
1:2535  50                push     ax
1:2536  8946c2            mov      word ptr [bp - 0x3e], ax
1:2539  8956c4            mov      word ptr [bp - 0x3c], dx
1:253C  9a5d250000        lcall    0, 0x255d  ; @1:INT:ord_19(1:2C48)
1:2541  b102              mov      cl, 2
1:2543  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_22(1:2C7A)
1:2548  0346da            add      ax, word ptr [bp - 0x26]
1:254B  1356dc            adc      dx, word ptr [bp - 0x24]
1:254E  8946f2            mov      word ptr [bp - 0xe], ax
1:2551  8956f4            mov      word ptr [bp - 0xc], dx
1:2554  ff76cc            push     word ptr [bp - 0x34]
1:2557  ff76ca            push     word ptr [bp - 0x36]
1:255A  56                push     si
1:255B  57                push     di
1:255C  9a72250000        lcall    0, 0x2572  ; @1:INT:ord_19(1:2C48)
1:2561  ff76d0            push     word ptr [bp - 0x30]
1:2564  ff76ce            push     word ptr [bp - 0x32]
1:2567  ff76c4            push     word ptr [bp - 0x3c]
1:256A  ff76c2            push     word ptr [bp - 0x3e]
1:256D  8bf0              mov      si, ax
1:256F  8bfa              mov      di, dx
1:2571  9a0e240000        lcall    0, 0x240e  ; @1:INT:ord_19(1:2C48)
1:2576  03c6              add      ax, si
1:2578  13d7              adc      dx, di
1:257A  b10e              mov      cl, 0xe
1:257C  9a0d260000        lcall    0, 0x260d  ; @1:INT:ord_21(1:2C92)
1:2581  0346f2            add      ax, word ptr [bp - 0xe]
1:2584  1356f4            adc      dx, word ptr [bp - 0xc]
1:2587  8946d6            mov      word ptr [bp - 0x2a], ax
1:258A  8956d8            mov      word ptr [bp - 0x28], dx
1:258D  837ec800          cmp      word ptr [bp - 0x38], 0
1:2591  7d0a              jge      0x259d
1:2593  f75ed6            neg      word ptr [bp - 0x2a]
1:2596  8356d800          adc      word ptr [bp - 0x28], 0
1:259A  f75ed8            neg      word ptr [bp - 0x28]
1:259D  8b46d6            mov      ax, word ptr [bp - 0x2a]
1:25A0  8b56d8            mov      dx, word ptr [bp - 0x28]
1:25A3  5e                pop      si
1:25A4  5f                pop      di
1:25A5  4d                dec      bp
1:25A6  4d                dec      bp
1:25A7  8be5              mov      sp, bp
1:25A9  1f                pop      ds
1:25AA  5d                pop      bp
1:25AB  4d                dec      bp
1:25AC  cb                retf     

; ===== EXPORT:ord_6(#6) =====
1:25AD  1e                push     ds
1:25AE  58                pop      ax
1:25AF  90                nop      
1:25B0  45                inc      bp
1:25B1  55                push     bp
1:25B2  8bec              mov      bp, sp
1:25B4  1e                push     ds
1:25B5  8ed8              mov      ds, ax
1:25B7  83ec18            sub      sp, 0x18
1:25BA  c746ec1f00        mov      word ptr [bp - 0x14], 0x1f
1:25BF  2bc0              sub      ax, ax
1:25C1  8946f0            mov      word ptr [bp - 0x10], ax
1:25C4  8946ee            mov      word ptr [bp - 0x12], ax
1:25C7  8b560c            mov      dx, word ptr [bp + 0xc]
1:25CA  335608            xor      dx, word ptr [bp + 8]
1:25CD  8956fc            mov      word ptr [bp - 4], dx
1:25D0  8b460a            mov      ax, word ptr [bp + 0xa]
1:25D3  8b560c            mov      dx, word ptr [bp + 0xc]
1:25D6  0bd2              or       dx, dx
1:25D8  7d07              jge      0x25e1
1:25DA  f7d8              neg      ax
1:25DC  83d200            adc      dx, 0
1:25DF  f7da              neg      dx
1:25E1  8946f6            mov      word ptr [bp - 0xa], ax
1:25E4  8956f8            mov      word ptr [bp - 8], dx
1:25E7  8b4606            mov      ax, word ptr [bp + 6]
1:25EA  8b5608            mov      dx, word ptr [bp + 8]
1:25ED  0bd2              or       dx, dx
1:25EF  7d07              jge      0x25f8
1:25F1  f7d8              neg      ax
1:25F3  83d200            adc      dx, 0
1:25F6  f7da              neg      dx
1:25F8  8bc8              mov      cx, ax
1:25FA  8bda              mov      bx, dx
1:25FC  d1e0              shl      ax, 1
1:25FE  d1e0              shl      ax, 1
1:2600  c746f20000        mov      word ptr [bp - 0xe], 0
1:2605  8946f4            mov      word ptr [bp - 0xc], ax
1:2608  8bc1              mov      ax, cx
1:260A  b10e              mov      cl, 0xe
1:260C  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_21(1:2C92)
1:2611  8946e8            mov      word ptr [bp - 0x18], ax
1:2614  8956ea            mov      word ptr [bp - 0x16], dx
1:2617  d166ee            shl      word ptr [bp - 0x12], 1
1:261A  d156f0            rcl      word ptr [bp - 0x10]
1:261D  8b46e8            mov      ax, word ptr [bp - 0x18]
1:2620  8b56ea            mov      dx, word ptr [bp - 0x16]
1:2623  3956f8            cmp      word ptr [bp - 8], dx
1:2626  771b              ja       0x2643
1:2628  7205              jb       0x262f
1:262A  3946f6            cmp      word ptr [bp - 0xa], ax
1:262D  7714              ja       0x2643
1:262F  8346ee01          add      word ptr [bp - 0x12], 1
1:2633  8356f000          adc      word ptr [bp - 0x10], 0
1:2637  8b46f6            mov      ax, word ptr [bp - 0xa]
1:263A  8b56f8            mov      dx, word ptr [bp - 8]
1:263D  2946e8            sub      word ptr [bp - 0x18], ax
1:2640  1956ea            sbb      word ptr [bp - 0x16], dx
1:2643  d166e8            shl      word ptr [bp - 0x18], 1
1:2646  d156ea            rcl      word ptr [bp - 0x16]
1:2649  837ef400          cmp      word ptr [bp - 0xc], 0
1:264D  7d05              jge      0x2654
1:264F  b80100            mov      ax, 1
1:2652  eb02              jmp      0x2656
1:2654  2bc0              sub      ax, ax
1:2656  99                cdq      
1:2657  0146e8            add      word ptr [bp - 0x18], ax
1:265A  1156ea            adc      word ptr [bp - 0x16], dx
1:265D  d166f2            shl      word ptr [bp - 0xe], 1
1:2660  d156f4            rcl      word ptr [bp - 0xc]
1:2663  ff4eec            dec      word ptr [bp - 0x14]
1:2666  75af              jne      0x2617
1:2668  8b46e8            mov      ax, word ptr [bp - 0x18]
1:266B  8b56ea            mov      dx, word ptr [bp - 0x16]
1:266E  3956f8            cmp      word ptr [bp - 8], dx
1:2671  770f              ja       0x2682
1:2673  7205              jb       0x267a
1:2675  3946f6            cmp      word ptr [bp - 0xa], ax
1:2678  7708              ja       0x2682
1:267A  8346ee01          add      word ptr [bp - 0x12], 1
1:267E  8356f000          adc      word ptr [bp - 0x10], 0
1:2682  837efc00          cmp      word ptr [bp - 4], 0
1:2686  7d0a              jge      0x2692
1:2688  f75eee            neg      word ptr [bp - 0x12]
1:268B  8356f000          adc      word ptr [bp - 0x10], 0
1:268F  f75ef0            neg      word ptr [bp - 0x10]
1:2692  8b46ee            mov      ax, word ptr [bp - 0x12]
1:2695  8b56f0            mov      dx, word ptr [bp - 0x10]
1:2698  4d                dec      bp
1:2699  4d                dec      bp
1:269A  8be5              mov      sp, bp
1:269C  1f                pop      ds
1:269D  5d                pop      bp
1:269E  4d                dec      bp
1:269F  cb                retf     
1:26A0  1e                push     ds
1:26A1  58                pop      ax
1:26A2  90                nop      
1:26A3  45                inc      bp
1:26A4  55                push     bp
1:26A5  8bec              mov      bp, sp
1:26A7  1e                push     ds
1:26A8  8ed8              mov      ds, ax
1:26AA  83ec10            sub      sp, 0x10
1:26AD  c746fc1e00        mov      word ptr [bp - 4], 0x1e
1:26B2  2bc0              sub      ax, ax
1:26B4  8946f6            mov      word ptr [bp - 0xa], ax
1:26B7  8946f4            mov      word ptr [bp - 0xc], ax
1:26BA  8b460a            mov      ax, word ptr [bp + 0xa]
1:26BD  8b560c            mov      dx, word ptr [bp + 0xc]
1:26C0  334606            xor      ax, word ptr [bp + 6]
1:26C3  335608            xor      dx, word ptr [bp + 8]
1:26C6  8956f2            mov      word ptr [bp - 0xe], dx
1:26C9  837e0800          cmp      word ptr [bp + 8], 0
1:26CD  7d0a              jge      0x26d9
1:26CF  f75e06            neg      word ptr [bp + 6]
1:26D2  83560800          adc      word ptr [bp + 8], 0
1:26D6  f75e08            neg      word ptr [bp + 8]
1:26D9  837e0c00          cmp      word ptr [bp + 0xc], 0
1:26DD  7d0a              jge      0x26e9
1:26DF  f75e0a            neg      word ptr [bp + 0xa]
1:26E2  83560c00          adc      word ptr [bp + 0xc], 0
1:26E6  f75e0c            neg      word ptr [bp + 0xc]
1:26E9  8b4606            mov      ax, word ptr [bp + 6]
1:26EC  8b5608            mov      dx, word ptr [bp + 8]
1:26EF  39560c            cmp      word ptr [bp + 0xc], dx
1:26F2  7f1b              jg       0x270f
1:26F4  7c05              jl       0x26fb
1:26F6  39460a            cmp      word ptr [bp + 0xa], ax
1:26F9  7714              ja       0x270f
1:26FB  8b460a            mov      ax, word ptr [bp + 0xa]
1:26FE  8b560c            mov      dx, word ptr [bp + 0xc]
1:2701  294606            sub      word ptr [bp + 6], ax
1:2704  195608            sbb      word ptr [bp + 8], dx
1:2707  8346f401          add      word ptr [bp - 0xc], 1
1:270B  8356f600          adc      word ptr [bp - 0xa], 0
1:270F  d166f4            shl      word ptr [bp - 0xc], 1
1:2712  d156f6            rcl      word ptr [bp - 0xa]
1:2715  d16606            shl      word ptr [bp + 6], 1
1:2718  d15608            rcl      word ptr [bp + 8]
1:271B  ff4efc            dec      word ptr [bp - 4]
1:271E  75c9              jne      0x26e9
1:2720  837ef200          cmp      word ptr [bp - 0xe], 0
1:2724  7c08              jl       0x272e
1:2726  8b46f4            mov      ax, word ptr [bp - 0xc]
1:2729  8b56f6            mov      dx, word ptr [bp - 0xa]
1:272C  eb0d              jmp      0x273b
1:272E  8b46f4            mov      ax, word ptr [bp - 0xc]
1:2731  8b56f6            mov      dx, word ptr [bp - 0xa]
1:2734  f7d8              neg      ax
1:2736  83d200            adc      dx, 0
1:2739  f7da              neg      dx
1:273B  4d                dec      bp
1:273C  4d                dec      bp
1:273D  8be5              mov      sp, bp
1:273F  1f                pop      ds
1:2740  5d                pop      bp
1:2741  4d                dec      bp
1:2742  cb                retf     
1:2743  1e                push     ds
1:2744  58                pop      ax
1:2745  90                nop      
1:2746  45                inc      bp
1:2747  55                push     bp
1:2748  8bec              mov      bp, sp
1:274A  1e                push     ds
1:274B  8ed8              mov      ds, ax
1:274D  83ec10            sub      sp, 0x10
1:2750  c746f40100        mov      word ptr [bp - 0xc], 1
1:2755  c746f60000        mov      word ptr [bp - 0xa], 0
1:275A  2bc0              sub      ax, ax
1:275C  8946f2            mov      word ptr [bp - 0xe], ax
1:275F  8946f0            mov      word ptr [bp - 0x10], ax
1:2762  c746fc1f00        mov      word ptr [bp - 4], 0x1f
1:2767  b00d              mov      al, 0xd
1:2769  50                push     ax
1:276A  8d4606            lea      ax, [bp + 6]
1:276D  16                push     ss
1:276E  50                push     ax
1:276F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_20(1:2C08)
1:2774  837e0800          cmp      word ptr [bp + 8], 0
1:2778  7d05              jge      0x277f
1:277A  b80100            mov      ax, 1
1:277D  eb02              jmp      0x2781
1:277F  2bc0              sub      ax, ax
1:2781  99                cdq      
1:2782  8b4ef0            mov      cx, word ptr [bp - 0x10]
1:2785  8b5ef2            mov      bx, word ptr [bp - 0xe]
1:2788  d1e1              shl      cx, 1
1:278A  d1d3              rcl      bx, 1
1:278C  03c1              add      ax, cx
1:278E  13d3              adc      dx, bx
1:2790  8946f0            mov      word ptr [bp - 0x10], ax
1:2793  8956f2            mov      word ptr [bp - 0xe], dx
1:2796  d16606            shl      word ptr [bp + 6], 1
1:2799  d15608            rcl      word ptr [bp + 8]
1:279C  8b46f4            mov      ax, word ptr [bp - 0xc]
1:279F  8b56f6            mov      dx, word ptr [bp - 0xa]
1:27A2  d1e0              shl      ax, 1
1:27A4  d1d2              rcl      dx, 1
1:27A6  2d0100            sub      ax, 1
1:27A9  83da00            sbb      dx, 0
1:27AC  8946f4            mov      word ptr [bp - 0xc], ax
1:27AF  8956f6            mov      word ptr [bp - 0xa], dx
1:27B2  3b56f2            cmp      dx, word ptr [bp - 0xe]
1:27B5  7719              ja       0x27d0
1:27B7  7205              jb       0x27be
1:27B9  3b46f0            cmp      ax, word ptr [bp - 0x10]
1:27BC  7712              ja       0x27d0
1:27BE  2946f0            sub      word ptr [bp - 0x10], ax
1:27C1  1956f2            sbb      word ptr [bp - 0xe], dx
1:27C4  050200            add      ax, 2
1:27C7  83d200            adc      dx, 0
1:27CA  8946f4            mov      word ptr [bp - 0xc], ax
1:27CD  8956f6            mov      word ptr [bp - 0xa], dx
1:27D0  837e0800          cmp      word ptr [bp + 8], 0
1:27D4  7d05              jge      0x27db
1:27D6  b80100            mov      ax, 1
1:27D9  eb02              jmp      0x27dd
1:27DB  2bc0              sub      ax, ax
1:27DD  99                cdq      
1:27DE  8b4ef0            mov      cx, word ptr [bp - 0x10]
1:27E1  8b5ef2            mov      bx, word ptr [bp - 0xe]
1:27E4  d1e1              shl      cx, 1
1:27E6  d1d3              rcl      bx, 1
1:27E8  03c1              add      ax, cx
1:27EA  13d3              adc      dx, bx
1:27EC  8946f0            mov      word ptr [bp - 0x10], ax
1:27EF  8956f2            mov      word ptr [bp - 0xe], dx
1:27F2  d16606            shl      word ptr [bp + 6], 1
1:27F5  d15608            rcl      word ptr [bp + 8]
1:27F8  ff4efc            dec      word ptr [bp - 4]
1:27FB  7403              je       0x2800
1:27FD  e974ff            jmp      0x2774
1:2800  8b46f4            mov      ax, word ptr [bp - 0xc]
1:2803  8b56f6            mov      dx, word ptr [bp - 0xa]
1:2806  4d                dec      bp
1:2807  4d                dec      bp
1:2808  8be5              mov      sp, bp
1:280A  1f                pop      ds
1:280B  5d                pop      bp
1:280C  4d                dec      bp
1:280D  cb                retf     

; ===== EXPORT:ord_7(#7) =====
1:280E  1e                push     ds
1:280F  58                pop      ax
1:2810  90                nop      
1:2811  45                inc      bp
1:2812  55                push     bp
1:2813  8bec              mov      bp, sp
1:2815  1e                push     ds
1:2816  8ed8              mov      ds, ax
1:2818  83ec12            sub      sp, 0x12
1:281B  b83f24            mov      ax, 0x243f
1:281E  ba0300            mov      dx, 3
1:2821  52                push     dx
1:2822  50                push     ax
1:2823  ff7608            push     word ptr [bp + 8]
1:2826  ff7606            push     word ptr [bp + 6]
1:2829  0e                push     cs
1:282A  e880fd            call     0x25ad
1:282D  83c408            add      sp, 8
1:2830  894606            mov      word ptr [bp + 6], ax
1:2833  895608            mov      word ptr [bp + 8], dx
1:2836  b87f00            mov      ax, 0x7f
1:2839  99                cdq      
1:283A  52                push     dx
1:283B  50                push     ax
1:283C  8d4606            lea      ax, [bp + 6]
1:283F  16                push     ss
1:2840  50                push     ax
1:2841  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_25(1:2BC4)
1:2846  2bc0              sub      ax, ax
1:2848  bafe00            mov      dx, 0xfe
1:284B  52                push     dx
1:284C  50                push     ax
1:284D  8d4606            lea      ax, [bp + 6]
1:2850  16                push     ss
1:2851  50                push     ax
1:2852  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_24(1:2BE6)
1:2857  8946ee            mov      word ptr [bp - 0x12], ax
1:285A  83fa7f            cmp      dx, 0x7f
1:285D  7c0b              jl       0x286a
1:285F  7f04              jg       0x2865
1:2861  0bc0              or       ax, ax
1:2863  7405              je       0x286a
1:2865  b80100            mov      ax, 1
1:2868  eb02              jmp      0x286c
1:286A  2bc0              sub      ax, ax
1:286C  8946fc            mov      word ptr [bp - 4], ax
1:286F  0bc0              or       ax, ax
1:2871  740f              je       0x2882
1:2873  8b46ee            mov      ax, word ptr [bp - 0x12]
1:2876  2d0000            sub      ax, 0
1:2879  83da7f            sbb      dx, 0x7f
1:287C  894606            mov      word ptr [bp + 6], ax
1:287F  895608            mov      word ptr [bp + 8], dx
1:2882  8b4606            mov      ax, word ptr [bp + 6]
1:2885  8946fa            mov      word ptr [bp - 6], ax
1:2888  b010              mov      al, 0x10
1:288A  50                push     ax
1:288B  8d4e06            lea      cx, [bp + 6]
1:288E  16                push     ss
1:288F  51                push     cx
1:2890  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_23(1:2C28)
1:2895  8bd8              mov      bx, ax
1:2897  d1e3              shl      bx, 1
1:2899  8b8f0004          mov      cx, word ptr [bx + 0x400]
1:289D  894ef6            mov      word ptr [bp - 0xa], cx
1:28A0  c746f80000        mov      word ptr [bp - 8], 0
1:28A5  050100            add      ax, 1
1:28A8  83d200            adc      dx, 0
1:28AB  894606            mov      word ptr [bp + 6], ax
1:28AE  895608            mov      word ptr [bp + 8], dx
1:28B1  8bd8              mov      bx, ax
1:28B3  d1e3              shl      bx, 1
1:28B5  8b870004          mov      ax, word ptr [bx + 0x400]
1:28B9  2bd2              sub      dx, dx
1:28BB  8b4efa            mov      cx, word ptr [bp - 6]
1:28BE  2bdb              sub      bx, bx
1:28C0  53                push     bx
1:28C1  51                push     cx
1:28C2  2b46f6            sub      ax, word ptr [bp - 0xa]
1:28C5  1b56f8            sbb      dx, word ptr [bp - 8]
1:28C8  52                push     dx
1:28C9  50                push     ax
1:28CA  9a51240000        lcall    0, 0x2451  ; @1:INT:ord_19(1:2C48)
1:28CF  8bc2              mov      ax, dx
1:28D1  99                cdq      
1:28D2  0146f6            add      word ptr [bp - 0xa], ax
1:28D5  1156f8            adc      word ptr [bp - 8], dx
1:28D8  837efc00          cmp      word ptr [bp - 4], 0
1:28DC  740f              je       0x28ed
1:28DE  8b46f6            mov      ax, word ptr [bp - 0xa]
1:28E1  8b56f8            mov      dx, word ptr [bp - 8]
1:28E4  f7d8              neg      ax
1:28E6  83d200            adc      dx, 0
1:28E9  f7da              neg      dx
1:28EB  eb06              jmp      0x28f3
1:28ED  8b46f6            mov      ax, word ptr [bp - 0xa]
1:28F0  8b56f8            mov      dx, word ptr [bp - 8]
1:28F3  b10e              mov      cl, 0xe
1:28F5  9a44250000        lcall    0, 0x2544  ; @1:INT:ord_22(1:2C7A)
1:28FA  4d                dec      bp
1:28FB  4d                dec      bp
1:28FC  8be5              mov      sp, bp
1:28FE  1f                pop      ds
1:28FF  5d                pop      bp
1:2900  4d                dec      bp
1:2901  cb                retf     

; ===== EXPORT:ord_36(#36) =====
1:2902  1e                push     ds
1:2903  58                pop      ax
1:2904  90                nop      
1:2905  45                inc      bp
1:2906  55                push     bp
1:2907  8bec              mov      bp, sp
1:2909  1e                push     ds
1:290A  8ed8              mov      ds, ax
1:290C  837e0a00          cmp      word ptr [bp + 0xa], 0
1:2910  7504              jne      0x2916
1:2912  2bc0              sub      ax, ax
1:2914  eb09              jmp      0x291f
1:2916  8b460e            mov      ax, word ptr [bp + 0xe]
1:2919  a3ce0a            mov      word ptr [0xace], ax
1:291C  b80100            mov      ax, 1
1:291F  4d                dec      bp
1:2920  4d                dec      bp
1:2921  8be5              mov      sp, bp
1:2923  1f                pop      ds
1:2924  5d                pop      bp
1:2925  4d                dec      bp
1:2926  ca0a00            retf     0xa

; ===== EXPORT:WEP(#2) =====
1:2929  1e                push     ds
1:292A  58                pop      ax
1:292B  90                nop      
1:292C  45                inc      bp
1:292D  55                push     bp
1:292E  8bec              mov      bp, sp
1:2930  1e                push     ds
1:2931  8ed8              mov      ds, ax
1:2933  b80100            mov      ax, 1
1:2936  4d                dec      bp
1:2937  4d                dec      bp
1:2938  8be5              mov      sp, bp
1:293A  1f                pop      ds
1:293B  5d                pop      bp
1:293C  4d                dec      bp
1:293D  ca0200            retf     2

; ===== EXPORT:MODULE(#1) =====
1:2940  1e                push     ds
1:2941  58                pop      ax
1:2942  90                nop      
1:2943  45                inc      bp
1:2944  55                push     bp
1:2945  8bec              mov      bp, sp
1:2947  1e                push     ds
1:2948  8ed8              mov      ds, ax
1:294A  83ec0a            sub      sp, 0xa
1:294D  56                push     si
1:294E  8b4608            mov      ax, word ptr [bp + 8]
1:2951  a3a609            mov      word ptr [0x9a6], ax
1:2954  8b4606            mov      ax, word ptr [bp + 6]
1:2957  a3a209            mov      word ptr [0x9a2], ax
1:295A  50                push     ax
1:295B  9a7b290000        lcall    0, 0x297b  ; @1:KERNEL.GlobalLock
1:2960  a3b609            mov      word ptr [0x9b6], ax
1:2963  8916b809          mov      word ptr [0x9b8], dx
1:2967  8bc2              mov      ax, dx
1:2969  0b06b609          or       ax, word ptr [0x9b6]
1:296D  7503              jne      0x2972
1:296F  e96a01            jmp      0x2adc
1:2972  c41eb609          les      bx, ptr [0x9b6]
1:2976  26ff7720          push     word ptr es:[bx + 0x20]
1:297A  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalLock
1:297F  a3ee0a            mov      word ptr [0xaee], ax
1:2982  8916f00a          mov      word ptr [0xaf0], dx
1:2986  8bc2              mov      ax, dx
1:2988  0b06ee0a          or       ax, word ptr [0xaee]
1:298C  7503              jne      0x2991
1:298E  e94201            jmp      0x2ad3
1:2991  8b460a            mov      ax, word ptr [bp + 0xa]
1:2994  e90801            jmp      0x2a9f
1:2997  c41eb609          les      bx, ptr [0x9b6]
1:299B  26837f1465        cmp      word ptr es:[bx + 0x14], 0x65
1:29A0  7c0f              jl       0x29b1
1:29A2  26817f36f400      cmp      word ptr es:[bx + 0x36], 0xf4
1:29A8  7507              jne      0x29b1
1:29AA  26837f3878        cmp      word ptr es:[bx + 0x38], 0x78
1:29AF  740e              je       0x29bf
1:29B1  c70600050000      mov      word ptr [0x500], 0
1:29B7  c746fc0500        mov      word ptr [bp - 4], 5
1:29BC  e90701            jmp      0x2ac6
1:29BF  c70600050100      mov      word ptr [0x500], 1
1:29C5  e9fe00            jmp      0x2ac6
1:29C8  b86409            mov      ax, 0x964
1:29CB  50                push     ax
1:29CC  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_35(1:2B1E)
1:29D1  5b                pop      bx
1:29D2  ff366409          push     word ptr [0x964]
1:29D6  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_34(1:2B80)
1:29DB  5b                pop      bx
1:29DC  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_33(1:016F)
1:29E1  eb13              jmp      0x29f6
1:29E3  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_32(1:044F)
1:29E8  eb0c              jmp      0x29f6
1:29EA  833e000500        cmp      word ptr [0x500], 0
1:29EF  740b              je       0x29fc
1:29F1  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_31(1:042F)
1:29F6  8946fc            mov      word ptr [bp - 4], ax
1:29F9  e9ca00            jmp      0x2ac6
1:29FC  ff36a609          push     word ptr [0x9a6]
1:2A00  b800ff            mov      ax, 0xff00
1:2A03  baff00            mov      dx, 0xff
1:2A06  52                push     dx
1:2A07  50                push     ax
1:2A08  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextColor
1:2A0D  ff36a609          push     word ptr [0x9a6]
1:2A11  2bc0              sub      ax, ax
1:2A13  50                push     ax
1:2A14  50                push     ax
1:2A15  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkColor
1:2A1A  ff36a609          push     word ptr [0x9a6]
1:2A1E  2bc0              sub      ax, ax
1:2A20  50                push     ax
1:2A21  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextAlign
1:2A26  ff36a609          push     word ptr [0x9a6]
1:2A2A  b80100            mov      ax, 1
1:2A2D  50                push     ax
1:2A2E  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkMode
1:2A33  ff36a609          push     word ptr [0x9a6]
1:2A37  2bc0              sub      ax, ax
1:2A39  50                push     ax
1:2A3A  50                push     ax
1:2A3B  b80205            mov      ax, 0x502
1:2A3E  1e                push     ds
1:2A3F  50                push     ax
1:2A40  50                push     ax
1:2A41  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_30(1:2B02)
1:2A46  5b                pop      bx
1:2A47  50                push     ax
1:2A48  9affff0000        lcall    0, 0xffff  ; @1:GDI.TextOut
1:2A4D  eb77              jmp      0x2ac6
1:2A4F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_29(1:0495)
1:2A54  eba0              jmp      0x29f6
1:2A56  a1ce0a            mov      ax, word ptr [0xace]
1:2A59  c41eee0a          les      bx, ptr [0xaee]
1:2A5D  26894716          mov      word ptr es:[bx + 0x16], ax
1:2A61  c746f60000        mov      word ptr [bp - 0xa], 0
1:2A66  8b46f6            mov      ax, word ptr [bp - 0xa]
1:2A69  8bf0              mov      si, ax
1:2A6B  d1e6              shl      si, 1
1:2A6D  40                inc      ax
1:2A6E  c41eee0a          les      bx, ptr [0xaee]
1:2A72  2689400e          mov      word ptr es:[bx + si + 0xe], ax
1:2A76  ff46f6            inc      word ptr [bp - 0xa]
1:2A79  837ef604          cmp      word ptr [bp - 0xa], 4
1:2A7D  7ce7              jl       0x2a66
1:2A7F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_28(1:1522)
1:2A84  e96fff            jmp      0x29f6
1:2A87  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_27(1:154B)
1:2A8C  e967ff            jmp      0x29f6
1:2A8F  8b460a            mov      ax, word ptr [bp + 0xa]
1:2A92  2d0700            sub      ax, 7
1:2A95  50                push     ax
1:2A96  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_26(1:155F)
1:2A9B  5b                pop      bx
1:2A9C  e957ff            jmp      0x29f6
1:2A9F  3d0c00            cmp      ax, 0xc
1:2AA2  7722              ja       0x2ac6
1:2AA4  d1e0              shl      ax, 1
1:2AA6  93                xchg     bx, ax
1:2AA7  2effa7ac2a        jmp      word ptr cs:[bx + 0x2aac]
1:2AAC  c829e329          enter    -0x1cd7, 0x29
1:2AB0  ea294f2ac6        ljmp     0xc62a:0x4f29
1:2AB5  2a562a            sub      dl, byte ptr [bp + 0x2a]
1:2AB8  872a              xchg     word ptr [bp + si], bp