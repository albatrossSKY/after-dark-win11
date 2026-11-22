File: raw\unpacked\MODULES\WARP.AD
Module: 'WARP' ('Graphics Module Library')
CS:IP=1:13EA  SS:SP=0:0000  AutoDS=2  Heap=4096  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (3): KERNEL, GDI, USER
Segments (2):
  SEG  1: CODE off=0x00600 len=0x141C min=0x141C flags=0x1D50 relocs=82
  SEG  2: DATA off=0x01BC0 len=0x1106 min=0x1106 flags=0x0C61 relocs=0
Exports (30):
  ord   1: SEG1:0998 flags=0x03 MODULE
  ord   2: SEG1:0981 flags=0x03 WEP
  ord   3: SEG1:13D6 flags=0x03 ___EXPORTEDSTUB
  ord   4: SEG1:0BF4 flags=0x00 
  ord   5: SEG1:0C24 flags=0x00 
  ord   6: SEG1:0CBE flags=0x00 
  ord   7: SEG1:0CF0 flags=0x00 
  ord   8: SEG1:0871 flags=0x00 
  ord   9: SEG1:085D flags=0x00 
  ord  10: SEG1:082B flags=0x00 
  ord  11: SEG1:07F0 flags=0x00 
  ord  12: SEG1:0B62 flags=0x00 
  ord  13: SEG1:0481 flags=0x00 
  ord  14: SEG1:06EC flags=0x00 
  ord  15: SEG1:0012 flags=0x00 
  ord  16: SEG1:0BE0 flags=0x00 
  ord  17: SEG1:0B7E flags=0x00 
  ord  18: SEG1:095A flags=0x00 
  ord  19: SEG1:0CFC flags=0x00 
  ord  20: SEG1:0F40 flags=0x00 
  ord  21: SEG1:0E00 flags=0x00 
  ord  22: SEG1:1072 flags=0x00 
  ord  23: SEG1:109A flags=0x00 
  ord  24: SEG1:113C flags=0x00 
  ord  25: SEG1:1100 flags=0x00 
  ord  26: SEG1:1166 flags=0x00 
  ord  27: SEG1:109E flags=0x00 
  ord  28: SEG1:0E1A flags=0x00 
  ord  29: SEG1:130A flags=0x00 
  ord  30: SEG1:13C6 flags=0x00 
Resources (7):
  TYPE_1000        #1               off=0x02D00 len=   176
  TYPE_1000        #2               off=0x02DB0 len=    80
  TYPE_1000        #3               off=0x02E00 len=    80
  TYPE_1000        #4               off=0x02E50 len=    32
  TYPE_2000        #10              off=0x02E70 len=    80
  TYPE_2000        #20              off=0x02EC0 len=    16
  TYPE_2000        #30              off=0x02ED0 len=   400

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

; ===== EXPORT:ord_15(#15) =====
1:0012  1e                push     ds
1:0013  58                pop      ax
1:0014  90                nop      
1:0015  45                inc      bp
1:0016  55                push     bp
1:0017  8bec              mov      bp, sp
1:0019  1e                push     ds
1:001A  8ed8              mov      ds, ax
1:001C  83ec0c            sub      sp, 0xc
1:001F  57                push     di
1:0020  56                push     si
1:0021  b80100            mov      ax, 1
1:0024  a3fa10            mov      word ptr [0x10fa], ax
1:0027  a3f010            mov      word ptr [0x10f0], ax
1:002A  c7065c040000      mov      word ptr [0x45c], 0
1:0030  c41e0011          les      bx, ptr [0x1100]
1:0034  268b4702          mov      ax, word ptr es:[bx + 2]
1:0038  a36004            mov      word ptr [0x460], ax
1:003B  c7065e040000      mov      word ptr [0x45e], 0
1:0041  268b4704          mov      ax, word ptr es:[bx + 4]
1:0045  a36204            mov      word ptr [0x462], ax
1:0048  268b4702          mov      ax, word ptr es:[bx + 2]
1:004C  b92800            mov      cx, 0x28
1:004F  8bf0              mov      si, ax
1:0051  99                cdq      
1:0052  f7f9              idiv     cx
1:0054  8bd0              mov      dx, ax
1:0056  268b4704          mov      ax, word ptr es:[bx + 4]
1:005A  8bda              mov      bx, dx
1:005C  8bf8              mov      di, ax
1:005E  99                cdq      
1:005F  f7f9              idiv     cx
1:0061  b9f210            mov      cx, 0x10f2
1:0064  1e                push     ds
1:0065  51                push     cx
1:0066  8bc8              mov      cx, ax
1:0068  8bc6              mov      ax, si
1:006A  99                cdq      
1:006B  2bc2              sub      ax, dx
1:006D  d1f8              sar      ax, 1
1:006F  8bd0              mov      dx, ax
1:0071  2bc3              sub      ax, bx
1:0073  50                push     ax
1:0074  8bc7              mov      ax, di
1:0076  8bf2              mov      si, dx
1:0078  99                cdq      
1:0079  2bc2              sub      ax, dx
1:007B  d1f8              sar      ax, 1
1:007D  8bd0              mov      dx, ax
1:007F  2bc1              sub      ax, cx
1:0081  50                push     ax
1:0082  03f3              add      si, bx
1:0084  56                push     si
1:0085  03d1              add      dx, cx
1:0087  52                push     dx
1:0088  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:008D  2bc0              sub      ax, ax
1:008F  a30411            mov      word ptr [0x1104], ax
1:0092  8946f4            mov      word ptr [bp - 0xc], ax
1:0095  eb61              jmp      0xf8
1:0097  837ef40f          cmp      word ptr [bp - 0xc], 0xf
1:009B  7d0c              jge      0xa9
1:009D  c746faff00        mov      word ptr [bp - 6], 0xff
1:00A2  c746fc0000        mov      word ptr [bp - 4], 0
1:00A7  eb37              jmp      0xe0
1:00A9  837ef416          cmp      word ptr [bp - 0xc], 0x16
1:00AD  7d07              jge      0xb6
1:00AF  c746fa00ff        mov      word ptr [bp - 6], 0xff00
1:00B4  ebec              jmp      0xa2
1:00B6  837ef41d          cmp      word ptr [bp - 0xc], 0x1d
1:00BA  7d07              jge      0xc3
1:00BC  c746fa0000        mov      word ptr [bp - 6], 0
1:00C1  eb18              jmp      0xdb
1:00C3  837ef424          cmp      word ptr [bp - 0xc], 0x24
1:00C7  7d07              jge      0xd0
1:00C9  c746fa00ff        mov      word ptr [bp - 6], 0xff00
1:00CE  eb0b              jmp      0xdb
1:00D0  837ef42b          cmp      word ptr [bp - 0xc], 0x2b
1:00D4  7d35              jge      0x10b
1:00D6  c746faff00        mov      word ptr [bp - 6], 0xff
1:00DB  c746fcff00        mov      word ptr [bp - 4], 0xff
1:00E0  8b46fa            mov      ax, word ptr [bp - 6]
1:00E3  8b56fc            mov      dx, word ptr [bp - 4]
1:00E6  8b5ef4            mov      bx, word ptr [bp - 0xc]
1:00E9  d1e3              shl      bx, 1
1:00EB  d1e3              shl      bx, 1
1:00ED  89879003          mov      word ptr [bx + 0x390], ax
1:00F1  89979203          mov      word ptr [bx + 0x392], dx
1:00F5  ff46f4            inc      word ptr [bp - 0xc]
1:00F8  837ef432          cmp      word ptr [bp - 0xc], 0x32
1:00FC  7d1a              jge      0x118
1:00FE  837ef408          cmp      word ptr [bp - 0xc], 8
1:0102  7d93              jge      0x97
1:0104  c746faffff        mov      word ptr [bp - 6], 0xffff
1:0109  ebd0              jmp      0xdb
1:010B  837ef431          cmp      word ptr [bp - 0xc], 0x31
1:010F  7dc5              jge      0xd6
1:0111  c746faffff        mov      word ptr [bp - 6], 0xffff
1:0116  eb8a              jmp      0xa2
1:0118  a16004            mov      ax, word ptr [0x460]
1:011B  03065c04          add      ax, word ptr [0x45c]
1:011F  99                cdq      
1:0120  2bc2              sub      ax, dx
1:0122  d1f8              sar      ax, 1
1:0124  a38e03            mov      word ptr [0x38e], ax
1:0127  b95c04            mov      cx, 0x45c
1:012A  1e                push     ds
1:012B  51                push     cx
1:012C  f7d8              neg      ax
1:012E  50                push     ax
1:012F  a15e04            mov      ax, word ptr [0x45e]
1:0132  03066204          add      ax, word ptr [0x462]
1:0136  99                cdq      
1:0137  2bc2              sub      ax, dx
1:0139  d1f8              sar      ax, 1
1:013B  a3fc10            mov      word ptr [0x10fc], ax
1:013E  f7d8              neg      ax
1:0140  50                push     ax
1:0141  9a58010000        lcall    0, 0x158  ; @1:USER.OffsetRect
1:0146  b8f210            mov      ax, 0x10f2
1:0149  1e                push     ds
1:014A  50                push     ax
1:014B  a18e03            mov      ax, word ptr [0x38e]
1:014E  f7d8              neg      ax
1:0150  50                push     ax
1:0151  a1fc10            mov      ax, word ptr [0x10fc]
1:0154  f7d8              neg      ax
1:0156  50                push     ax
1:0157  9affff0000        lcall    0, 0xffff  ; @1:USER.OffsetRect
1:015C  a15c04            mov      ax, word ptr [0x45c]
1:015F  b90300            mov      cx, 3
1:0162  99                cdq      
1:0163  f7f9              idiv     cx
1:0165  a38603            mov      word ptr [0x386], ax
1:0168  a15e04            mov      ax, word ptr [0x45e]
1:016B  99                cdq      
1:016C  f7f9              idiv     cx
1:016E  a37403            mov      word ptr [0x374], ax
1:0171  c41e0011          les      bx, ptr [0x1100]
1:0175  268b4708          mov      ax, word ptr es:[bx + 8]
1:0179  a3fe10            mov      word ptr [0x10fe], ax
1:017C  268b470a          mov      ax, word ptr es:[bx + 0xa]
1:0180  40                inc      ax
1:0181  a38803            mov      word ptr [0x388], ax
1:0184  c7068a030000      mov      word ptr [0x38a], 0
1:018A  c7065804ffff      mov      word ptr [0x458], 0xffff
1:0190  c7065a04ff00      mov      word ptr [0x45a], 0xff
1:0196  2bc0              sub      ax, ax
1:0198  a37803            mov      word ptr [0x378], ax
1:019B  a37603            mov      word ptr [0x376], ax
1:019E  268b4706          mov      ax, word ptr es:[bx + 6]
1:01A2  eb40              jmp      0x1e4
1:01A4  c70680039cff      mov      word ptr [0x380], 0xff9c
1:01AA  eb5f              jmp      0x20b
1:01AC  c7068003c4ff      mov      word ptr [0x380], 0xffc4
1:01B2  eb57              jmp      0x20b
1:01B4  c7068003e2ff      mov      word ptr [0x380], 0xffe2
1:01BA  eb4f              jmp      0x20b
1:01BC  c7068003fbff      mov      word ptr [0x380], 0xfffb
1:01C2  eb47              jmp      0x20b
1:01C4  c70680030500      mov      word ptr [0x380], 5
1:01CA  eb3f              jmp      0x20b
1:01CC  c70680031e00      mov      word ptr [0x380], 0x1e
1:01D2  eb37              jmp      0x20b
1:01D4  c70680033c00      mov      word ptr [0x380], 0x3c
1:01DA  eb2f              jmp      0x20b
1:01DC  c70680036400      mov      word ptr [0x380], 0x64
1:01E2  eb27              jmp      0x20b
1:01E4  3d6400            cmp      ax, 0x64
1:01E7  74f3              je       0x1dc
1:01E9  7720              ja       0x20b
1:01EB  0ac0              or       al, al
1:01ED  74b5              je       0x1a4
1:01EF  2c0c              sub      al, 0xc
1:01F1  74b9              je       0x1ac
1:01F3  2c0d              sub      al, 0xd
1:01F5  74bd              je       0x1b4
1:01F7  2c0d              sub      al, 0xd
1:01F9  74c1              je       0x1bc
1:01FB  2c07              sub      al, 7
1:01FD  74c5              je       0x1c4
1:01FF  2c0a              sub      al, 0xa
1:0201  74c9              je       0x1cc
1:0203  2c14              sub      al, 0x14
1:0205  74cd              je       0x1d4
1:0207  2c0d              sub      al, 0xd
1:0209  74d1              je       0x1dc
1:020B  2bc0              sub      ax, ax
1:020D  5e                pop      si
1:020E  5f                pop      di
1:020F  4d                dec      bp
1:0210  4d                dec      bp
1:0211  8be5              mov      sp, bp
1:0213  1f                pop      ds
1:0214  5d                pop      bp
1:0215  4d                dec      bp
1:0216  cb                retf     
1:0217  1e                push     ds
1:0218  58                pop      ax
1:0219  90                nop      
1:021A  45                inc      bp
1:021B  55                push     bp
1:021C  8bec              mov      bp, sp
1:021E  1e                push     ds
1:021F  8ed8              mov      ds, ax
1:0221  83ec0c            sub      sp, 0xc
1:0224  56                push     si
1:0225  0e                push     cs
1:0226  e8fe06            call     0x927
1:0229  99                cdq      
1:022A  f73e8e03          idiv     word ptr [0x38e]
1:022E  8b5e06            mov      bx, word ptr [bp + 6]
1:0231  895702            mov      word ptr [bx + 2], dx
1:0234  8bc2              mov      ax, dx
1:0236  8946f4            mov      word ptr [bp - 0xc], ax
1:0239  0e                push     cs
1:023A  e8ea06            call     0x927
1:023D  99                cdq      
1:023E  f73efc10          idiv     word ptr [0x10fc]
1:0242  8b5e06            mov      bx, word ptr [bp + 6]
1:0245  8917              mov      word ptr [bx], dx
1:0247  8bc2              mov      ax, dx
1:0249  8946f8            mov      word ptr [bp - 8], ax
1:024C  c74704c800        mov      word ptr [bx + 4], 0xc8
1:0251  8b46f4            mov      ax, word ptr [bp - 0xc]
1:0254  03068e03          add      ax, word ptr [0x38e]
1:0258  89470a            mov      word ptr [bx + 0xa], ax
1:025B  8b46f8            mov      ax, word ptr [bp - 8]
1:025E  0306fc10          add      ax, word ptr [0x10fc]
1:0262  894708            mov      word ptr [bx + 8], ax
1:0265  c4360011          les      si, ptr [0x1100]
1:0269  26837c0c00        cmp      word ptr es:[si + 0xc], 0
1:026E  7422              je       0x292
1:0270  833e720300        cmp      word ptr [0x372], 0
1:0275  741b              je       0x292
1:0277  9aaa020000        lcall    0, 0x2aa  ; @1:INT:ord_4(1:0BF4)
1:027C  b93200            mov      cx, 0x32
1:027F  99                cdq      
1:0280  f7f9              idiv     cx
1:0282  8bda              mov      bx, dx
1:0284  d1e3              shl      bx, 1
1:0286  d1e3              shl      bx, 1
1:0288  8b879003          mov      ax, word ptr [bx + 0x390]
1:028C  8b979203          mov      dx, word ptr [bx + 0x392]
1:0290  eb07              jmp      0x299
1:0292  a15804            mov      ax, word ptr [0x458]
1:0295  8b165a04          mov      dx, word ptr [0x45a]
1:0299  8b5e06            mov      bx, word ptr [bp + 6]
1:029C  89470c            mov      word ptr [bx + 0xc], ax
1:029F  89570e            mov      word ptr [bx + 0xe], dx
1:02A2  833e880303        cmp      word ptr [0x388], 3
1:02A7  750b              jne      0x2b4
1:02A9  9ad5020000        lcall    0, 0x2d5  ; @1:INT:ord_4(1:0BF4)
1:02AE  250100            and      ax, 1
1:02B1  40                inc      ax
1:02B2  eb03              jmp      0x2b7
1:02B4  a18803            mov      ax, word ptr [0x388]
1:02B7  8b5e06            mov      bx, word ptr [bp + 6]
1:02BA  894706            mov      word ptr [bx + 6], ax
1:02BD  5e                pop      si
1:02BE  4d                dec      bp
1:02BF  4d                dec      bp
1:02C0  8be5              mov      sp, bp
1:02C2  1f                pop      ds
1:02C3  5d                pop      bp
1:02C4  4d                dec      bp
1:02C5  cb                retf     
1:02C6  1e                push     ds
1:02C7  58                pop      ax
1:02C8  90                nop      
1:02C9  45                inc      bp
1:02CA  55                push     bp
1:02CB  8bec              mov      bp, sp
1:02CD  1e                push     ds
1:02CE  8ed8              mov      ds, ax
1:02D0  83ec0e            sub      sp, 0xe
1:02D3  56                push     si
1:02D4  9a41030000        lcall    0, 0x341  ; @1:INT:ord_4(1:0BF4)
1:02D9  b90400            mov      cx, 4
1:02DC  99                cdq      
1:02DD  f7f9              idiv     cx
1:02DF  8bc2              mov      ax, dx
1:02E1  0bc0              or       ax, ax
1:02E3  740e              je       0x2f3
1:02E5  48                dec      ax
1:02E6  7473              je       0x35b
1:02E8  48                dec      ax
1:02E9  7475              je       0x360
1:02EB  48                dec      ax
1:02EC  7503              jne      0x2f1
1:02EE  e98a00            jmp      0x37b
1:02F1  eb21              jmp      0x314
1:02F3  a18e03            mov      ax, word ptr [0x38e]
1:02F6  f7d8              neg      ax
1:02F8  8b5e06            mov      bx, word ptr [bp + 6]
1:02FB  894702            mov      word ptr [bx + 2], ax
1:02FE  8946f2            mov      word ptr [bp - 0xe], ax
1:0301  0e                push     cs
1:0302  e82206            call     0x927
1:0305  99                cdq      
1:0306  f73efc10          idiv     word ptr [0x10fc]
1:030A  8b5e06            mov      bx, word ptr [bp + 6]
1:030D  8917              mov      word ptr [bx], dx
1:030F  8bc2              mov      ax, dx
1:0311  8946f6            mov      word ptr [bp - 0xa], ax
1:0314  8b5e06            mov      bx, word ptr [bp + 6]
1:0317  c74704c800        mov      word ptr [bx + 4], 0xc8
1:031C  a18e03            mov      ax, word ptr [0x38e]
1:031F  0346f2            add      ax, word ptr [bp - 0xe]
1:0322  89470a            mov      word ptr [bx + 0xa], ax
1:0325  a1fc10            mov      ax, word ptr [0x10fc]
1:0328  0346f6            add      ax, word ptr [bp - 0xa]
1:032B  894708            mov      word ptr [bx + 8], ax
1:032E  c4360011          les      si, ptr [0x1100]
1:0332  26837c0c00        cmp      word ptr es:[si + 0xc], 0
1:0337  745e              je       0x397
1:0339  833e720300        cmp      word ptr [0x372], 0
1:033E  7457              je       0x397
1:0340  9aaf030000        lcall    0, 0x3af  ; @1:INT:ord_4(1:0BF4)
1:0345  b93200            mov      cx, 0x32
1:0348  99                cdq      
1:0349  f7f9              idiv     cx
1:034B  8bda              mov      bx, dx
1:034D  d1e3              shl      bx, 1
1:034F  d1e3              shl      bx, 1
1:0351  8b879003          mov      ax, word ptr [bx + 0x390]
1:0355  8b979203          mov      dx, word ptr [bx + 0x392]
1:0359  eb43              jmp      0x39e
1:035B  a18e03            mov      ax, word ptr [0x38e]
1:035E  eb98              jmp      0x2f8
1:0360  0e                push     cs
1:0361  e8c305            call     0x927
1:0364  99                cdq      
1:0365  f73e8e03          idiv     word ptr [0x38e]
1:0369  8b5e06            mov      bx, word ptr [bp + 6]
1:036C  895702            mov      word ptr [bx + 2], dx
1:036F  8bc2              mov      ax, dx
1:0371  8946f2            mov      word ptr [bp - 0xe], ax
1:0374  a1fc10            mov      ax, word ptr [0x10fc]
1:0377  f7d8              neg      ax
1:0379  eb17              jmp      0x392
1:037B  0e                push     cs
1:037C  e8a805            call     0x927
1:037F  99                cdq      
1:0380  f73e8e03          idiv     word ptr [0x38e]
1:0384  8b5e06            mov      bx, word ptr [bp + 6]
1:0387  895702            mov      word ptr [bx + 2], dx
1:038A  8bc2              mov      ax, dx
1:038C  8946f2            mov      word ptr [bp - 0xe], ax
1:038F  a1fc10            mov      ax, word ptr [0x10fc]
1:0392  8907              mov      word ptr [bx], ax
1:0394  e97aff            jmp      0x311
1:0397  a15804            mov      ax, word ptr [0x458]
1:039A  8b165a04          mov      dx, word ptr [0x45a]
1:039E  8b5e06            mov      bx, word ptr [bp + 6]
1:03A1  89470c            mov      word ptr [bx + 0xc], ax
1:03A4  89570e            mov      word ptr [bx + 0xe], dx
1:03A7  833e880303        cmp      word ptr [0x388], 3
1:03AC  750b              jne      0x3b9
1:03AE  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_4(1:0BF4)
1:03B3  250100            and      ax, 1
1:03B6  40                inc      ax
1:03B7  eb03              jmp      0x3bc
1:03B9  a18803            mov      ax, word ptr [0x388]
1:03BC  8b5e06            mov      bx, word ptr [bp + 6]
1:03BF  894706            mov      word ptr [bx + 6], ax
1:03C2  5e                pop      si
1:03C3  4d                dec      bp
1:03C4  4d                dec      bp
1:03C5  8be5              mov      sp, bp
1:03C7  1f                pop      ds
1:03C8  5d                pop      bp
1:03C9  4d                dec      bp
1:03CA  cb                retf     
1:03CB  1e                push     ds
1:03CC  58                pop      ax
1:03CD  90                nop      
1:03CE  45                inc      bp
1:03CF  55                push     bp
1:03D0  8bec              mov      bp, sp
1:03D2  1e                push     ds
1:03D3  8ed8              mov      ds, ax
1:03D5  83ec0c            sub      sp, 0xc
1:03D8  56                push     si
1:03D9  0e                push     cs
1:03DA  e84a05            call     0x927
1:03DD  99                cdq      
1:03DE  f73e8603          idiv     word ptr [0x386]
1:03E2  8b5e06            mov      bx, word ptr [bp + 6]
1:03E5  895702            mov      word ptr [bx + 2], dx
1:03E8  8bc2              mov      ax, dx
1:03EA  8946f4            mov      word ptr [bp - 0xc], ax
1:03ED  0e                push     cs
1:03EE  e83605            call     0x927
1:03F1  99                cdq      
1:03F2  f73e7403          idiv     word ptr [0x374]
1:03F6  8b5e06            mov      bx, word ptr [bp + 6]
1:03F9  8917              mov      word ptr [bx], dx
1:03FB  8bc2              mov      ax, dx
1:03FD  8946f8            mov      word ptr [bp - 8], ax
1:0400  c74704c800        mov      word ptr [bx + 4], 0xc8
1:0405  a18e03            mov      ax, word ptr [0x38e]
1:0408  0346f4            add      ax, word ptr [bp - 0xc]
1:040B  89470a            mov      word ptr [bx + 0xa], ax
1:040E  a1fc10            mov      ax, word ptr [0x10fc]
1:0411  0346f8            add      ax, word ptr [bp - 8]
1:0414  894708            mov      word ptr [bx + 8], ax
1:0417  c4360011          les      si, ptr [0x1100]
1:041B  26837c0c00        cmp      word ptr es:[si + 0xc], 0
1:0420  7422              je       0x444
1:0422  833e720300        cmp      word ptr [0x372], 0
1:0427  741b              je       0x444
1:0429  9a5c040000        lcall    0, 0x45c  ; @1:INT:ord_4(1:0BF4)
1:042E  b93200            mov      cx, 0x32
1:0431  99                cdq      
1:0432  f7f9              idiv     cx
1:0434  8bda              mov      bx, dx
1:0436  d1e3              shl      bx, 1
1:0438  d1e3              shl      bx, 1
1:043A  8b879003          mov      ax, word ptr [bx + 0x390]
1:043E  8b979203          mov      dx, word ptr [bx + 0x392]
1:0442  eb07              jmp      0x44b
1:0444  a15804            mov      ax, word ptr [0x458]
1:0447  8b165a04          mov      dx, word ptr [0x45a]
1:044B  8b5e06            mov      bx, word ptr [bp + 6]
1:044E  89470c            mov      word ptr [bx + 0xc], ax
1:0451  89570e            mov      word ptr [bx + 0xe], dx
1:0454  833e880303        cmp      word ptr [0x388], 3
1:0459  7514              jne      0x46f
1:045B  9a78020000        lcall    0, 0x278  ; @1:INT:ord_4(1:0BF4)
1:0460  b90200            mov      cx, 2
1:0463  99                cdq      
1:0464  f7f9              idiv     cx
1:0466  42                inc      dx
1:0467  8b5e06            mov      bx, word ptr [bp + 6]
1:046A  895706            mov      word ptr [bx + 6], dx
1:046D  eb09              jmp      0x478
1:046F  a18803            mov      ax, word ptr [0x388]
1:0472  8b5e06            mov      bx, word ptr [bp + 6]
1:0475  894706            mov      word ptr [bx + 6], ax
1:0478  5e                pop      si
1:0479  4d                dec      bp
1:047A  4d                dec      bp
1:047B  8be5              mov      sp, bp
1:047D  1f                pop      ds
1:047E  5d                pop      bp
1:047F  4d                dec      bp
1:0480  cb                retf     

; ===== EXPORT:ord_13(#13) =====
1:0481  1e                push     ds
1:0482  58                pop      ax
1:0483  90                nop      
1:0484  45                inc      bp
1:0485  55                push     bp
1:0486  8bec              mov      bp, sp
1:0488  1e                push     ds
1:0489  8ed8              mov      ds, ax
1:048B  83ec1e            sub      sp, 0x1e
1:048E  c746fc6404        mov      word ptr [bp - 4], 0x464
1:0493  c746fa0000        mov      word ptr [bp - 6], 0
1:0498  e90f02            jmp      0x6aa
1:049B  ff367e03          push     word ptr [0x37e]
1:049F  b80400            mov      ax, 4
1:04A2  50                push     ax
1:04A3  9a1e070000        lcall    0, 0x71e  ; @1:GDI.GetStockObject
1:04A8  50                push     ax
1:04A9  9a54060000        lcall    0, 0x654  ; @1:GDI.SelectObject
1:04AE  ff367e03          push     word ptr [0x37e]
1:04B2  8b5efc            mov      bx, word ptr [bp - 4]
1:04B5  ff770a            push     word ptr [bx + 0xa]
1:04B8  ff7708            push     word ptr [bx + 8]
1:04BB  b80200            mov      ax, 2
1:04BE  50                push     ax
1:04BF  50                push     ax
1:04C0  b82100            mov      ax, 0x21
1:04C3  baf000            mov      dx, 0xf0
1:04C6  52                push     dx
1:04C7  50                push     ax
1:04C8  9a76060000        lcall    0, 0x676  ; @1:GDI.PatBlt
1:04CD  b103              mov      cl, 3
1:04CF  a18003            mov      ax, word ptr [0x380]
1:04D2  d3f8              sar      ax, cl
1:04D4  8b5efc            mov      bx, word ptr [bp - 4]
1:04D7  294704            sub      word ptr [bx + 4], ax
1:04DA  837f0400          cmp      word ptr [bx + 4], 0
1:04DE  7f09              jg       0x4e9
1:04E0  53                push     bx
1:04E1  0e                push     cs
1:04E2  e8e6fe            call     0x3cb
1:04E5  5b                pop      bx
1:04E6  e9ba01            jmp      0x6a3
1:04E9  8b5efc            mov      bx, word ptr [bp - 4]
1:04EC  8b4702            mov      ax, word ptr [bx + 2]
1:04EF  99                cdq      
1:04F0  8946e2            mov      word ptr [bp - 0x1e], ax
1:04F3  8956e4            mov      word ptr [bp - 0x1c], dx
1:04F6  8b07              mov      ax, word ptr [bx]
1:04F8  99                cdq      
1:04F9  8946ee            mov      word ptr [bp - 0x12], ax
1:04FC  8956f0            mov      word ptr [bp - 0x10], dx
1:04FF  833e800300        cmp      word ptr [0x380], 0
1:0504  7d21              jge      0x527
1:0506  b105              mov      cl, 5
1:0508  9a1c050000        lcall    0, 0x51c  ; @1:INT:ord_7(1:0CF0)
1:050D  8b5efc            mov      bx, word ptr [bp - 4]
1:0510  294702            sub      word ptr [bx + 2], ax
1:0513  8b46e2            mov      ax, word ptr [bp - 0x1e]
1:0516  8b56e4            mov      dx, word ptr [bp - 0x1c]
1:0519  b105              mov      cl, 5
1:051B  9a2a050000        lcall    0, 0x52a  ; @1:INT:ord_7(1:0CF0)
1:0520  8b5efc            mov      bx, word ptr [bp - 4]
1:0523  0107              add      word ptr [bx], ax
1:0525  eb1f              jmp      0x546
1:0527  b105              mov      cl, 5
1:0529  9a3d050000        lcall    0, 0x53d  ; @1:INT:ord_7(1:0CF0)
1:052E  8b5efc            mov      bx, word ptr [bp - 4]
1:0531  014702            add      word ptr [bx + 2], ax
1:0534  8b46e2            mov      ax, word ptr [bp - 0x1e]
1:0537  8b56e4            mov      dx, word ptr [bp - 0x1c]
1:053A  b105              mov      cl, 5
1:053C  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:0CF0)
1:0541  8b5efc            mov      bx, word ptr [bp - 4]
1:0544  2907              sub      word ptr [bx], ax
1:0546  8b5efc            mov      bx, word ptr [bp - 4]
1:0549  8b4704            mov      ax, word ptr [bx + 4]
1:054C  99                cdq      
1:054D  52                push     dx
1:054E  50                push     ax
1:054F  b8c800            mov      ax, 0xc8
1:0552  99                cdq      
1:0553  52                push     dx
1:0554  50                push     ax
1:0555  ff76e4            push     word ptr [bp - 0x1c]
1:0558  ff76e2            push     word ptr [bp - 0x1e]
1:055B  9a8a050000        lcall    0, 0x58a  ; @1:INT:ord_6(1:0CBE)
1:0560  52                push     dx
1:0561  50                push     ax
1:0562  9a91050000        lcall    0, 0x591  ; @1:INT:ord_5(1:0C24)
1:0567  8946ea            mov      word ptr [bp - 0x16], ax
1:056A  8956ec            mov      word ptr [bp - 0x14], dx
1:056D  03068e03          add      ax, word ptr [0x38e]
1:0571  8b5efc            mov      bx, word ptr [bp - 4]
1:0574  89470a            mov      word ptr [bx + 0xa], ax
1:0577  8b4704            mov      ax, word ptr [bx + 4]
1:057A  99                cdq      
1:057B  52                push     dx
1:057C  50                push     ax
1:057D  b8c800            mov      ax, 0xc8
1:0580  99                cdq      
1:0581  52                push     dx
1:0582  50                push     ax
1:0583  ff76f0            push     word ptr [bp - 0x10]
1:0586  ff76ee            push     word ptr [bp - 0x12]
1:0589  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_6(1:0CBE)
1:058E  52                push     dx
1:058F  50                push     ax
1:0590  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_5(1:0C24)
1:0595  8946f6            mov      word ptr [bp - 0xa], ax
1:0598  8956f8            mov      word ptr [bp - 8], dx
1:059B  0306fc10          add      ax, word ptr [0x10fc]
1:059F  8b5efc            mov      bx, word ptr [bp - 4]
1:05A2  894708            mov      word ptr [bx + 8], ax
1:05A5  c746f40000        mov      word ptr [bp - 0xc], 0
1:05AA  833e800300        cmp      word ptr [0x380], 0
1:05AF  7d25              jge      0x5d6
1:05B1  8b46ea            mov      ax, word ptr [bp - 0x16]
1:05B4  8946e6            mov      word ptr [bp - 0x1a], ax
1:05B7  8b46f6            mov      ax, word ptr [bp - 0xa]
1:05BA  8946e8            mov      word ptr [bp - 0x18], ax
1:05BD  b8f210            mov      ax, 0x10f2
1:05C0  1e                push     ds
1:05C1  50                push     ax
1:05C2  ff76e8            push     word ptr [bp - 0x18]
1:05C5  ff76e6            push     word ptr [bp - 0x1a]
1:05C8  9affff0000        lcall    0, 0xffff  ; @1:USER.PtInRect
1:05CD  0bc0              or       ax, ax
1:05CF  7405              je       0x5d6
1:05D1  c746f40100        mov      word ptr [bp - 0xc], 1
1:05D6  a16204            mov      ax, word ptr [0x462]
1:05D9  99                cdq      
1:05DA  3b56f8            cmp      dx, word ptr [bp - 8]
1:05DD  7c3d              jl       0x61c
1:05DF  7f05              jg       0x5e6
1:05E1  3b46f6            cmp      ax, word ptr [bp - 0xa]
1:05E4  7636              jbe      0x61c
1:05E6  a15e04            mov      ax, word ptr [0x45e]
1:05E9  99                cdq      
1:05EA  3b56f8            cmp      dx, word ptr [bp - 8]
1:05ED  7f2d              jg       0x61c
1:05EF  7c05              jl       0x5f6
1:05F1  3b46f6            cmp      ax, word ptr [bp - 0xa]
1:05F4  7326              jae      0x61c
1:05F6  a15c04            mov      ax, word ptr [0x45c]
1:05F9  99                cdq      
1:05FA  3b56ec            cmp      dx, word ptr [bp - 0x14]
1:05FD  7f1d              jg       0x61c
1:05FF  7c05              jl       0x606
1:0601  3b46ea            cmp      ax, word ptr [bp - 0x16]
1:0604  7316              jae      0x61c
1:0606  a16004            mov      ax, word ptr [0x460]
1:0609  99                cdq      
1:060A  3b56ec            cmp      dx, word ptr [bp - 0x14]
1:060D  7c0d              jl       0x61c
1:060F  7f05              jg       0x616
1:0611  3b46ea            cmp      ax, word ptr [bp - 0x16]
1:0614  7606              jbe      0x61c
1:0616  837ef400          cmp      word ptr [bp - 0xc], 0
1:061A  7417              je       0x633
1:061C  833e800300        cmp      word ptr [0x380], 0
1:0621  7d0a              jge      0x62d
1:0623  ff76fc            push     word ptr [bp - 4]
1:0626  0e                push     cs
1:0627  e89cfc            call     0x2c6
1:062A  e9b8fe            jmp      0x4e5
1:062D  ff76fc            push     word ptr [bp - 4]
1:0630  e9aefe            jmp      0x4e1
1:0633  833ef01000        cmp      word ptr [0x10f0], 0
1:0638  7469              je       0x6a3
1:063A  8b5efc            mov      bx, word ptr [bp - 4]
1:063D  837f0602          cmp      word ptr [bx + 6], 2
1:0641  754b              jne      0x68e
1:0643  ff367e03          push     word ptr [0x37e]
1:0647  ff770e            push     word ptr [bx + 0xe]
1:064A  ff770c            push     word ptr [bx + 0xc]
1:064D  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateSolidBrush
1:0652  50                push     ax
1:0653  9a82060000        lcall    0, 0x682  ; @1:GDI.SelectObject
1:0658  8946f2            mov      word ptr [bp - 0xe], ax
1:065B  ff367e03          push     word ptr [0x37e]
1:065F  8b5efc            mov      bx, word ptr [bp - 4]
1:0662  ff770a            push     word ptr [bx + 0xa]
1:0665  ff7708            push     word ptr [bx + 8]
1:0668  b80200            mov      ax, 2
1:066B  50                push     ax
1:066C  50                push     ax
1:066D  b82100            mov      ax, 0x21
1:0670  baf000            mov      dx, 0xf0
1:0673  52                push     dx
1:0674  50                push     ax
1:0675  9affff0000        lcall    0, 0xffff  ; @1:GDI.PatBlt
1:067A  ff367e03          push     word ptr [0x37e]
1:067E  ff76f2            push     word ptr [bp - 0xe]
1:0681  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectObject
1:0686  50                push     ax
1:0687  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteObject
1:068C  eb15              jmp      0x6a3
1:068E  ff367e03          push     word ptr [0x37e]
1:0692  ff770a            push     word ptr [bx + 0xa]
1:0695  ff7708            push     word ptr [bx + 8]
1:0698  ff770e            push     word ptr [bx + 0xe]
1:069B  ff770c            push     word ptr [bx + 0xc]
1:069E  9adb060000        lcall    0, 0x6db  ; @1:GDI.SetPixel
1:06A3  8346fc10          add      word ptr [bp - 4], 0x10
1:06A7  ff46fa            inc      word ptr [bp - 6]
1:06AA  a1fe10            mov      ax, word ptr [0x10fe]
1:06AD  3946fa            cmp      word ptr [bp - 6], ax
1:06B0  7d30              jge      0x6e2
1:06B2  833efa1000        cmp      word ptr [0x10fa], 0
1:06B7  7503              jne      0x6bc
1:06B9  e911fe            jmp      0x4cd
1:06BC  8b5efc            mov      bx, word ptr [bp - 4]
1:06BF  837f0601          cmp      word ptr [bx + 6], 1
1:06C3  7403              je       0x6c8
1:06C5  e9d3fd            jmp      0x49b
1:06C8  ff367e03          push     word ptr [0x37e]
1:06CC  ff770a            push     word ptr [bx + 0xa]
1:06CF  ff7708            push     word ptr [bx + 8]
1:06D2  ff367803          push     word ptr [0x378]
1:06D6  ff367603          push     word ptr [0x376]
1:06DA  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetPixel
1:06DF  e9ebfd            jmp      0x4cd
1:06E2  2bc0              sub      ax, ax
1:06E4  4d                dec      bp
1:06E5  4d                dec      bp
1:06E6  8be5              mov      sp, bp
1:06E8  1f                pop      ds
1:06E9  5d                pop      bp
1:06EA  4d                dec      bp
1:06EB  cb                retf     

; ===== EXPORT:ord_14(#14) =====
1:06EC  1e                push     ds
1:06ED  58                pop      ax
1:06EE  90                nop      
1:06EF  45                inc      bp
1:06F0  55                push     bp
1:06F1  8bec              mov      bp, sp
1:06F3  1e                push     ds
1:06F4  8ed8              mov      ds, ax
1:06F6  b83203            mov      ax, 0x332
1:06F9  1e                push     ds
1:06FA  50                push     ax
1:06FB  2bc0              sub      ax, ax
1:06FD  50                push     ax
1:06FE  50                push     ax
1:06FF  c41e0011          les      bx, ptr [0x1100]
1:0703  26ff7702          push     word ptr es:[bx + 2]
1:0707  26ff7704          push     word ptr es:[bx + 4]
1:070B  9a89000000        lcall    0, 0x89  ; @1:USER.SetRect
1:0710  ff367e03          push     word ptr [0x37e]
1:0714  b83203            mov      ax, 0x332
1:0717  1e                push     ds
1:0718  50                push     ax
1:0719  b80400            mov      ax, 4
1:071C  50                push     ax
1:071D  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:0722  50                push     ax
1:0723  9affff0000        lcall    0, 0xffff  ; @1:USER.FillRect
1:0728  c70630030000      mov      word ptr [0x330], 0
1:072E  eb11              jmp      0x741
1:0730  b104              mov      cl, 4
1:0732  d3e0              shl      ax, cl
1:0734  056404            add      ax, 0x464
1:0737  50                push     ax
1:0738  0e                push     cs
1:0739  e8dbfa            call     0x217
1:073C  5b                pop      bx
1:073D  ff063003          inc      word ptr [0x330]
1:0741  a13003            mov      ax, word ptr [0x330]
1:0744  3906fe10          cmp      word ptr [0x10fe], ax
1:0748  7fe6              jg       0x730
1:074A  c70680039001      mov      word ptr [0x380], 0x190
1:0750  2bc0              sub      ax, ax
1:0752  a3f010            mov      word ptr [0x10f0], ax
1:0755  a3fa10            mov      word ptr [0x10fa], ax
1:0758  a33003            mov      word ptr [0x330], ax
1:075B  eb08              jmp      0x765
1:075D  0e                push     cs
1:075E  e820fd            call     0x481
1:0761  ff063003          inc      word ptr [0x330]
1:0765  833e30031e        cmp      word ptr [0x330], 0x1e
1:076A  7cf1              jl       0x75d
1:076C  b80100            mov      ax, 1
1:076F  a3fa10            mov      word ptr [0x10fa], ax
1:0772  a3f010            mov      word ptr [0x10f0], ax
1:0775  c41e0011          les      bx, ptr [0x1100]
1:0779  268b4706          mov      ax, word ptr es:[bx + 6]
1:077D  eb40              jmp      0x7bf
1:077F  c70680039cff      mov      word ptr [0x380], 0xff9c
1:0785  eb5f              jmp      0x7e6
1:0787  c7068003c4ff      mov      word ptr [0x380], 0xffc4
1:078D  eb57              jmp      0x7e6
1:078F  c7068003e2ff      mov      word ptr [0x380], 0xffe2
1:0795  eb4f              jmp      0x7e6
1:0797  c7068003fbff      mov      word ptr [0x380], 0xfffb
1:079D  eb47              jmp      0x7e6
1:079F  c70680030500      mov      word ptr [0x380], 5
1:07A5  eb3f              jmp      0x7e6
1:07A7  c70680031e00      mov      word ptr [0x380], 0x1e
1:07AD  eb37              jmp      0x7e6
1:07AF  c70680033c00      mov      word ptr [0x380], 0x3c
1:07B5  eb2f              jmp      0x7e6
1:07B7  c70680036400      mov      word ptr [0x380], 0x64
1:07BD  eb27              jmp      0x7e6
1:07BF  3d6400            cmp      ax, 0x64
1:07C2  74f3              je       0x7b7
1:07C4  7720              ja       0x7e6
1:07C6  0ac0              or       al, al
1:07C8  74b5              je       0x77f
1:07CA  2c0c              sub      al, 0xc
1:07CC  74b9              je       0x787
1:07CE  2c0d              sub      al, 0xd
1:07D0  74bd              je       0x78f
1:07D2  2c0d              sub      al, 0xd
1:07D4  74c1              je       0x797
1:07D6  2c07              sub      al, 7
1:07D8  74c5              je       0x79f
1:07DA  2c0a              sub      al, 0xa
1:07DC  74c9              je       0x7a7
1:07DE  2c14              sub      al, 0x14
1:07E0  74cd              je       0x7af
1:07E2  2c0d              sub      al, 0xd
1:07E4  74d1              je       0x7b7
1:07E6  2bc0              sub      ax, ax
1:07E8  4d                dec      bp
1:07E9  4d                dec      bp
1:07EA  8be5              mov      sp, bp
1:07EC  1f                pop      ds
1:07ED  5d                pop      bp
1:07EE  4d                dec      bp
1:07EF  cb                retf     

; ===== EXPORT:ord_11(#11) =====
1:07F0  1e                push     ds
1:07F1  58                pop      ax
1:07F2  90                nop      
1:07F3  45                inc      bp
1:07F4  55                push     bp
1:07F5  8bec              mov      bp, sp
1:07F7  1e                push     ds
1:07F8  8ed8              mov      ds, ax
1:07FA  83ec04            sub      sp, 4
1:07FD  833e8003c4        cmp      word ptr [0x380], -0x3c
1:0802  7f06              jg       0x80a
1:0804  c70680039001      mov      word ptr [0x380], 0x190
1:080A  2bc0              sub      ax, ax
1:080C  a3fa10            mov      word ptr [0x10fa], ax
1:080F  8946fc            mov      word ptr [bp - 4], ax
1:0812  eb07              jmp      0x81b
1:0814  0e                push     cs
1:0815  e869fc            call     0x481
1:0818  ff46fc            inc      word ptr [bp - 4]
1:081B  837efc0e          cmp      word ptr [bp - 4], 0xe
1:081F  7cf3              jl       0x814
1:0821  2bc0              sub      ax, ax
1:0823  4d                dec      bp
1:0824  4d                dec      bp
1:0825  8be5              mov      sp, bp
1:0827  1f                pop      ds
1:0828  5d                pop      bp
1:0829  4d                dec      bp
1:082A  cb                retf     

; ===== EXPORT:ord_10(#10) =====
1:082B  1e                push     ds
1:082C  58                pop      ax
1:082D  90                nop      
1:082E  45                inc      bp
1:082F  55                push     bp
1:0830  8bec              mov      bp, sp
1:0832  1e                push     ds
1:0833  8ed8              mov      ds, ax
1:0835  c70672030100      mov      word ptr [0x372], 1
1:083B  c41e8203          les      bx, ptr [0x382]
1:083F  26837f0a04        cmp      word ptr es:[bx + 0xa], 4
1:0844  7d0d              jge      0x853
1:0846  2bc0              sub      ax, ax
1:0848  a37203            mov      word ptr [0x372], ax
1:084B  c41e0011          les      bx, ptr [0x1100]
1:084F  26894714          mov      word ptr es:[bx + 0x14], ax
1:0853  2bc0              sub      ax, ax
1:0855  4d                dec      bp
1:0856  4d                dec      bp
1:0857  8be5              mov      sp, bp
1:0859  1f                pop      ds
1:085A  5d                pop      bp
1:085B  4d                dec      bp
1:085C  cb                retf     

; ===== EXPORT:ord_9(#9) =====
1:085D  1e                push     ds
1:085E  58                pop      ax
1:085F  90                nop      
1:0860  45                inc      bp
1:0861  55                push     bp
1:0862  8bec              mov      bp, sp
1:0864  1e                push     ds
1:0865  8ed8              mov      ds, ax
1:0867  2bc0              sub      ax, ax
1:0869  4d                dec      bp
1:086A  4d                dec      bp
1:086B  8be5              mov      sp, bp
1:086D  1f                pop      ds
1:086E  5d                pop      bp
1:086F  4d                dec      bp
1:0870  cb                retf     

; ===== EXPORT:ord_8(#8) =====
1:0871  1e                push     ds
1:0872  58                pop      ax
1:0873  90                nop      
1:0874  45                inc      bp
1:0875  55                push     bp
1:0876  8bec              mov      bp, sp
1:0878  1e                push     ds
1:0879  8ed8              mov      ds, ax
1:087B  c41e8203          les      bx, ptr [0x382]
1:087F  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:0884  7405              je       0x88b
1:0886  2bc0              sub      ax, ax
1:0888  e99400            jmp      0x91f
1:088B  8b4606            mov      ax, word ptr [bp + 6]
1:088E  0bc0              or       ax, ax
1:0890  740c              je       0x89e
1:0892  48                dec      ax
1:0893  7503              jne      0x898
1:0895  e98400            jmp      0x91c
1:0898  48                dec      ax
1:0899  7476              je       0x911
1:089B  48                dec      ax
1:089C  ebe8              jmp      0x886
1:089E  c41e0011          les      bx, ptr [0x1100]
1:08A2  268b4706          mov      ax, word ptr es:[bx + 6]
1:08A6  3d6400            cmp      ax, 0x64
1:08A9  745d              je       0x908
1:08AB  77d9              ja       0x886
1:08AD  0ac0              or       al, al
1:08AF  741e              je       0x8cf
1:08B1  2c0c              sub      al, 0xc
1:08B3  7422              je       0x8d7
1:08B5  2c0d              sub      al, 0xd
1:08B7  7426              je       0x8df
1:08B9  2c0d              sub      al, 0xd
1:08BB  742a              je       0x8e7
1:08BD  2c07              sub      al, 7
1:08BF  742e              je       0x8ef
1:08C1  2c0a              sub      al, 0xa
1:08C3  7432              je       0x8f7
1:08C5  2c14              sub      al, 0x14
1:08C7  7436              je       0x8ff
1:08C9  2c0d              sub      al, 0xd
1:08CB  743b              je       0x908
1:08CD  ebb7              jmp      0x886
1:08CF  c70680039cff      mov      word ptr [0x380], 0xff9c
1:08D5  ebaf              jmp      0x886
1:08D7  c7068003c4ff      mov      word ptr [0x380], 0xffc4
1:08DD  eba7              jmp      0x886
1:08DF  c7068003e2ff      mov      word ptr [0x380], 0xffe2
1:08E5  eb9f              jmp      0x886
1:08E7  c7068003fbff      mov      word ptr [0x380], 0xfffb
1:08ED  eb97              jmp      0x886
1:08EF  c70680030500      mov      word ptr [0x380], 5
1:08F5  eb8f              jmp      0x886
1:08F7  c70680031e00      mov      word ptr [0x380], 0x1e
1:08FD  eb87              jmp      0x886
1:08FF  c70680033c00      mov      word ptr [0x380], 0x3c
1:0905  e97eff            jmp      0x886
1:0908  c70680036400      mov      word ptr [0x380], 0x64
1:090E  e975ff            jmp      0x886
1:0911  c41e0011          les      bx, ptr [0x1100]
1:0915  268b4708          mov      ax, word ptr es:[bx + 8]
1:0919  a3fe10            mov      word ptr [0x10fe], ax
1:091C  b80300            mov      ax, 3
1:091F  4d                dec      bp
1:0920  4d                dec      bp
1:0921  8be5              mov      sp, bp
1:0923  1f                pop      ds
1:0924  5d                pop      bp
1:0925  4d                dec      bp
1:0926  cb                retf     
1:0927  1e                push     ds
1:0928  58                pop      ax
1:0929  90                nop      
1:092A  45                inc      bp
1:092B  55                push     bp
1:092C  8bec              mov      bp, sp
1:092E  1e                push     ds
1:092F  8ed8              mov      ds, ax
1:0931  9a45090000        lcall    0, 0x945  ; @1:INT:ord_4(1:0BF4)
1:0936  b90200            mov      cx, 2
1:0939  99                cdq      
1:093A  f7f9              idiv     cx
1:093C  89163a03          mov      word ptr [0x33a], dx
1:0940  0bd2              or       dx, dx
1:0942  7407              je       0x94b
1:0944  9a4c090000        lcall    0, 0x94c  ; @1:INT:ord_4(1:0BF4)
1:0949  eb07              jmp      0x952
1:094B  9a2a040000        lcall    0, 0x42a  ; @1:INT:ord_4(1:0BF4)
1:0950  f7d8              neg      ax
1:0952  4d                dec      bp
1:0953  4d                dec      bp
1:0954  8be5              mov      sp, bp
1:0956  1f                pop      ds
1:0957  5d                pop      bp
1:0958  4d                dec      bp
1:0959  cb                retf     

; ===== EXPORT:ord_18(#18) =====
1:095A  1e                push     ds
1:095B  58                pop      ax
1:095C  90                nop      
1:095D  45                inc      bp
1:095E  55                push     bp
1:095F  8bec              mov      bp, sp
1:0961  1e                push     ds
1:0962  8ed8              mov      ds, ax
1:0964  837e0a00          cmp      word ptr [bp + 0xa], 0
1:0968  7504              jne      0x96e
1:096A  2bc0              sub      ax, ax
1:096C  eb09              jmp      0x977
1:096E  8b460e            mov      ax, word ptr [bp + 0xe]
1:0971  a3e810            mov      word ptr [0x10e8], ax
1:0974  b80100            mov      ax, 1
1:0977  4d                dec      bp
1:0978  4d                dec      bp
1:0979  8be5              mov      sp, bp
1:097B  1f                pop      ds
1:097C  5d                pop      bp
1:097D  4d                dec      bp
1:097E  ca0a00            retf     0xa

; ===== EXPORT:WEP(#2) =====
1:0981  1e                push     ds
1:0982  58                pop      ax
1:0983  90                nop      
1:0984  45                inc      bp
1:0985  55                push     bp
1:0986  8bec              mov      bp, sp
1:0988  1e                push     ds
1:0989  8ed8              mov      ds, ax
1:098B  b80100            mov      ax, 1
1:098E  4d                dec      bp
1:098F  4d                dec      bp
1:0990  8be5              mov      sp, bp
1:0992  1f                pop      ds
1:0993  5d                pop      bp
1:0994  4d                dec      bp
1:0995  ca0200            retf     2

; ===== EXPORT:MODULE(#1) =====
1:0998  1e                push     ds
1:0999  58                pop      ax
1:099A  90                nop      
1:099B  45                inc      bp
1:099C  55                push     bp
1:099D  8bec              mov      bp, sp
1:099F  1e                push     ds
1:09A0  8ed8              mov      ds, ax
1:09A2  83ec0a            sub      sp, 0xa
1:09A5  56                push     si
1:09A6  8b4608            mov      ax, word ptr [bp + 8]
1:09A9  a37e03            mov      word ptr [0x37e], ax
1:09AC  8b4606            mov      ax, word ptr [bp + 6]
1:09AF  a37003            mov      word ptr [0x370], ax
1:09B2  50                push     ax
1:09B3  9ad3090000        lcall    0, 0x9d3  ; @1:KERNEL.GlobalLock
1:09B8  a38203            mov      word ptr [0x382], ax
1:09BB  89168403          mov      word ptr [0x384], dx
1:09BF  8bc2              mov      ax, dx
1:09C1  0b068203          or       ax, word ptr [0x382]
1:09C5  7503              jne      0x9ca
1:09C7  e96a01            jmp      0xb34
1:09CA  c41e8203          les      bx, ptr [0x382]
1:09CE  26ff7720          push     word ptr es:[bx + 0x20]
1:09D2  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalLock
1:09D7  a30011            mov      word ptr [0x1100], ax
1:09DA  89160211          mov      word ptr [0x1102], dx
1:09DE  8bc2              mov      ax, dx
1:09E0  0b060011          or       ax, word ptr [0x1100]
1:09E4  7503              jne      0x9e9
1:09E6  e94201            jmp      0xb2b
1:09E9  8b460a            mov      ax, word ptr [bp + 0xa]
1:09EC  e90801            jmp      0xaf7
1:09EF  c41e8203          les      bx, ptr [0x382]
1:09F3  26837f1465        cmp      word ptr es:[bx + 0x14], 0x65
1:09F8  7c0f              jl       0xa09
1:09FA  26817f36f400      cmp      word ptr es:[bx + 0x36], 0xf4
1:0A00  7507              jne      0xa09
1:0A02  26837f3878        cmp      word ptr es:[bx + 0x38], 0x78
1:0A07  740e              je       0xa17
1:0A09  c70610000000      mov      word ptr [0x10], 0
1:0A0F  c746fc0500        mov      word ptr [bp - 4], 5
1:0A14  e90701            jmp      0xb1e
1:0A17  c70610000100      mov      word ptr [0x10], 1
1:0A1D  e9fe00            jmp      0xb1e
1:0A20  b83c03            mov      ax, 0x33c
1:0A23  50                push     ax
1:0A24  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_17(1:0B7E)
1:0A29  5b                pop      bx
1:0A2A  ff363c03          push     word ptr [0x33c]
1:0A2E  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_16(1:0BE0)
1:0A33  5b                pop      bx
1:0A34  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_15(1:0012)
1:0A39  eb13              jmp      0xa4e
1:0A3B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_14(1:06EC)
1:0A40  eb0c              jmp      0xa4e
1:0A42  833e100000        cmp      word ptr [0x10], 0
1:0A47  740b              je       0xa54
1:0A49  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_13(1:0481)
1:0A4E  8946fc            mov      word ptr [bp - 4], ax
1:0A51  e9ca00            jmp      0xb1e
1:0A54  ff367e03          push     word ptr [0x37e]
1:0A58  b800ff            mov      ax, 0xff00
1:0A5B  baff00            mov      dx, 0xff
1:0A5E  52                push     dx
1:0A5F  50                push     ax
1:0A60  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextColor
1:0A65  ff367e03          push     word ptr [0x37e]
1:0A69  2bc0              sub      ax, ax
1:0A6B  50                push     ax
1:0A6C  50                push     ax
1:0A6D  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkColor
1:0A72  ff367e03          push     word ptr [0x37e]
1:0A76  2bc0              sub      ax, ax
1:0A78  50                push     ax
1:0A79  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextAlign
1:0A7E  ff367e03          push     word ptr [0x37e]
1:0A82  b80100            mov      ax, 1
1:0A85  50                push     ax
1:0A86  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkMode
1:0A8B  ff367e03          push     word ptr [0x37e]
1:0A8F  2bc0              sub      ax, ax
1:0A91  50                push     ax
1:0A92  50                push     ax
1:0A93  b81200            mov      ax, 0x12
1:0A96  1e                push     ds
1:0A97  50                push     ax
1:0A98  50                push     ax
1:0A99  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:0B62)
1:0A9E  5b                pop      bx
1:0A9F  50                push     ax
1:0AA0  9affff0000        lcall    0, 0xffff  ; @1:GDI.TextOut
1:0AA5  eb77              jmp      0xb1e
1:0AA7  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:07F0)
1:0AAC  eba0              jmp      0xa4e
1:0AAE  a1e810            mov      ax, word ptr [0x10e8]
1:0AB1  c41e0011          les      bx, ptr [0x1100]
1:0AB5  26894716          mov      word ptr es:[bx + 0x16], ax
1:0AB9  c746f60000        mov      word ptr [bp - 0xa], 0
1:0ABE  8b46f6            mov      ax, word ptr [bp - 0xa]
1:0AC1  8bf0              mov      si, ax
1:0AC3  d1e6              shl      si, 1
1:0AC5  40                inc      ax
1:0AC6  c41e0011          les      bx, ptr [0x1100]
1:0ACA  2689400e          mov      word ptr es:[bx + si + 0xe], ax
1:0ACE  ff46f6            inc      word ptr [bp - 0xa]
1:0AD1  837ef604          cmp      word ptr [bp - 0xa], 4
1:0AD5  7ce7              jl       0xabe
1:0AD7  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:082B)
1:0ADC  e96fff            jmp      0xa4e
1:0ADF  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:085D)
1:0AE4  e967ff            jmp      0xa4e
1:0AE7  8b460a            mov      ax, word ptr [bp + 0xa]
1:0AEA  2d0700            sub      ax, 7
1:0AED  50                push     ax
1:0AEE  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:0871)
1:0AF3  5b                pop      bx
1:0AF4  e957ff            jmp      0xa4e
1:0AF7  3d0c00            cmp      ax, 0xc
1:0AFA  7722              ja       0xb1e
1:0AFC  d1e0              shl      ax, 1
1:0AFE  93                xchg     bx, ax
1:0AFF  2effa7040b        jmp      word ptr cs:[bx + 0xb04]
1:0B04  200a              and      byte ptr [bp + si], cl
1:0B06  3b0a              cmp      cx, word ptr [bp + si]
1:0B08  42                inc      dx
1:0B09  0aa70a1e          or       ah, byte ptr [bx + 0x1e0a]
1:0B0D  0bae0adf          or       bp, word ptr [bp - 0x20f6]
1:0B11  0ae7              or       ah, bh
1:0B13  0ae7              or       ah, bh
1:0B15  0ae7              or       ah, bh
1:0B17  0ae7              or       ah, bh
1:0B19  0a1e0bef          or       bl, byte ptr [0xef0b]
1:0B1D  09c4              or       sp, ax
1:0B1F  1e                push     ds
1:0B20  820326            add      byte ptr [bp + di], 0x26
1:0B23  ff7720            push     word ptr [bx + 0x20]
1:0B26  9a300b0000        lcall    0, 0xb30  ; @1:KERNEL.GlobalUnlock
1:0B2B  ff367003          push     word ptr [0x370]
1:0B2F  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalUnlock
1:0B34  8b46fc            mov      ax, word ptr [bp - 4]
1:0B37  5e                pop      si
1:0B38  4d                dec      bp
1:0B39  4d                dec      bp
1:0B3A  8be5              mov      sp, bp
1:0B3C  1f                pop      ds
1:0B3D  5d                pop      bp
1:0B3E  4d                dec      bp
1:0B3F  ca0600            retf     6
1:0B42  0000              add      byte ptr [bx + si], al
1:0B44  0000              add      byte ptr [bx + si], al
1:0B46  0000              add      byte ptr [bx + si], al
1:0B48  0000              add      byte ptr [bx + si], al
1:0B4A  0000              add      byte ptr [bx + si], al
1:0B4C  0000              add      byte ptr [bx + si], al
1:0B4E  0000              add      byte ptr [bx + si], al
1:0B50  0000              add      byte ptr [bx + si], al
1:0B52  0000              add      byte ptr [bx + si], al
1:0B54  0000              add      byte ptr [bx + si], al
1:0B56  0000              add      byte ptr [bx + si], al
1:0B58  0000              add      byte ptr [bx + si], al
1:0B5A  0000              add      byte ptr [bx + si], al
1:0B5C  0000              add      byte ptr [bx + si], al
1:0B5E  0000              add      byte ptr [bx + si], al
1:0B60  c3                ret      
1:0B61  00558b            add      byte ptr [di - 0x75], dl
1:0B64  ec                in       al, dx
1:0B65  8bd7              mov      dx, di
1:0B67  8cd8              mov      ax, ds
1:0B69  8ec0              mov      es, ax
1:0B6B  8b7e06            mov      di, word ptr [bp + 6]
1:0B6E  33c0              xor      ax, ax
1:0B70  b9ffff            mov      cx, 0xffff
1:0B73  f2ae              repne scasb al, byte ptr es:[di]
1:0B75  f7d1              not      cx
1:0B77  49                dec      cx
1:0B78  91                xchg     cx, ax
1:0B79  8bfa              mov      di, dx
1:0B7B  5d                pop      bp
1:0B7C  cb                retf     
1:0B7D  008cd890          add      byte ptr [si - 0x6f28], cl
1:0B81  45                inc      bp
1:0B82  55                push     bp
1:0B83  8bec              mov      bp, sp
1:0B85  1e                push     ds
1:0B86  8ed8              mov      ds, ax
1:0B88  56                push     si
1:0B89  b42a              mov      ah, 0x2a
1:0B8B  cd21              int      0x21
1:0B8D  8bda              mov      bx, dx
1:0B8F  8bf1              mov      si, cx
1:0B91  b42c              mov      ah, 0x2c
1:0B93  cd21              int      0x21
1:0B95  b400              mov      ah, 0
1:0B97  8ac6              mov      al, dh
1:0B99  50                push     ax
1:0B9A  8ac1              mov      al, cl
1:0B9C  50                push     ax
1:0B9D  8ac5              mov      al, ch
1:0B9F  50                push     ax
1:0BA0  50                push     ax
1:0BA1  b42a              mov      ah, 0x2a
1:0BA3  cd21              int      0x21
1:0BA5  3bda              cmp      bx, dx
1:0BA7  58                pop      ax
1:0BA8  7408              je       0xbb2
1:0BAA  3c17              cmp      al, 0x17
1:0BAC  7504              jne      0xbb2
1:0BAE  8bd3              mov      dx, bx
1:0BB0  8bce              mov      cx, si
1:0BB2  b400              mov      ah, 0
1:0BB4  8ac2              mov      al, dl
1:0BB6  50                push     ax
1:0BB7  8ac6              mov      al, dh
1:0BB9  50                push     ax
1:0BBA  81e9bc07          sub      cx, 0x7bc
1:0BBE  51                push     cx
1:0BBF  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_19(1:0CFC)
1:0BC4  83c40c            add      sp, 0xc
1:0BC7  837e0600          cmp      word ptr [bp + 6], 0
1:0BCB  7408              je       0xbd5
1:0BCD  8b5e06            mov      bx, word ptr [bp + 6]
1:0BD0  895702            mov      word ptr [bx + 2], dx
1:0BD3  8907              mov      word ptr [bx], ax
1:0BD5  5e                pop      si
1:0BD6  83ed02            sub      bp, 2
1:0BD9  8be5              mov      sp, bp
1:0BDB  1f                pop      ds
1:0BDC  5d                pop      bp
1:0BDD  4d                dec      bp
1:0BDE  cb                retf     
1:0BDF  004555            add      byte ptr [di + 0x55], al
1:0BE2  8bec              mov      bp, sp
1:0BE4  8b4606            mov      ax, word ptr [bp + 6]
1:0BE7  a35200            mov      word ptr [0x52], ax
1:0BEA  c70654000000      mov      word ptr [0x54], 0
1:0BF0  5d                pop      bp
1:0BF1  4d                dec      bp
1:0BF2  cb                retf     
1:0BF3  90                nop      

; ===== EXPORT:ord_4(#4) =====
1:0BF4  45                inc      bp
1:0BF5  55                push     bp
1:0BF6  8bec              mov      bp, sp