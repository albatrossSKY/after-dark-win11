File: raw\unpacked\MODULES\SLIDESHO.AD
Module: 'SLIDESHO' ('Graphics Module Library')
CS:IP=1:221E  SS:SP=0:0000  AutoDS=2  Heap=1024  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (3): KERNEL, GDI, USER
Segments (2):
  SEG  1: CODE off=0x00660 len=0x2250 min=0x2250 flags=0x0D50 relocs=185
  SEG  2: DATA off=0x02BA0 len=0x1AE4 min=0x1AE4 flags=0x0C71 relocs=0
Exports (35):
  ord   1: SEG1:1720 flags=0x03 MODULE
  ord   2: SEG1:1709 flags=0x03 WEP
  ord   3: SEG1:1502 flags=0x03 FILEDLGPROC
  ord   4: SEG1:220A flags=0x03 ___EXPORTEDSTUB
  ord   5: SEG1:1970 flags=0x00 
  ord   6: SEG1:18E2 flags=0x00 
  ord   7: SEG1:1922 flags=0x00 
  ord   8: SEG1:1954 flags=0x00 
  ord   9: SEG1:1A8E flags=0x00 
  ord  10: SEG1:1AC0 flags=0x00 
  ord  11: SEG1:1A12 flags=0x00 
  ord  12: SEG1:1A54 flags=0x00 
  ord  13: SEG1:1A42 flags=0x00 
  ord  14: SEG1:19D2 flags=0x00 
  ord  15: SEG1:0393 flags=0x00 
  ord  16: SEG1:037F flags=0x00 
  ord  17: SEG1:036B flags=0x00 
  ord  18: SEG1:0353 flags=0x00 
  ord  19: SEG1:0216 flags=0x00 
  ord  20: SEG1:01D0 flags=0x00 
  ord  21: SEG1:0000 flags=0x00 
  ord  22: SEG1:19FE flags=0x00 
  ord  23: SEG1:16E2 flags=0x00 
  ord  24: SEG1:1ACC flags=0x00 
  ord  25: SEG1:1D74 flags=0x00 
  ord  26: SEG1:1C34 flags=0x00 
  ord  27: SEG1:2060 flags=0x00 
  ord  28: SEG1:2088 flags=0x00 
  ord  29: SEG1:212A flags=0x00 
  ord  30: SEG1:20EE flags=0x00 
  ord  31: SEG1:2154 flags=0x00 
  ord  32: SEG1:208C flags=0x00 
  ord  33: SEG1:1C4E flags=0x00 
  ord  34: SEG1:216C flags=0x00 
  ord  35: SEG1:217C flags=0x00 
Resources (9):
  RT_DIALOG        #1               off=0x046C0 len=   192
  TYPE_1000        #1               off=0x04780 len=   352
  TYPE_1000        #2               off=0x048E0 len=   240
  TYPE_1000        #3               off=0x049D0 len=   144
  TYPE_1000        #4               off=0x04A60 len=    96
  TYPE_2000        #10              off=0x04AC0 len=    80
  TYPE_2000        #20              off=0x04B10 len=    16
  TYPE_2000        #30              off=0x04B20 len=   640
  TYPE_15          #1               off=0x04DA0 len=    16


; ===== EXPORT:ord_21(#21) =====
1:0000  1e                push     ds
1:0001  58                pop      ax
1:0002  90                nop      
1:0003  45                inc      bp
1:0004  55                push     bp
1:0005  8bec              mov      bp, sp
1:0007  1e                push     ds
1:0008  8ed8              mov      ds, ax
1:000A  ff36fc00          push     word ptr [0xfc]
1:000E  9affff0000        lcall    0, 0xffff  ; @1:USER.IsWindow
1:0013  0bc0              or       ax, ax
1:0015  740c              je       0x23
1:0017  ff36fc00          push     word ptr [0xfc]
1:001B  2bc0              sub      ax, ax
1:001D  50                push     ax
1:001E  9affff0000        lcall    0, 0xffff  ; @1:USER.EndDialog
1:0023  b83200            mov      ax, 0x32
1:0026  1e                push     ds
1:0027  50                push     ax
1:0028  b82500            mov      ax, 0x25
1:002B  1e                push     ds
1:002C  50                push     ax
1:002D  b81d00            mov      ax, 0x1d
1:0030  1e                push     ds
1:0031  50                push     ax
1:0032  b8c419            mov      ax, 0x19c4
1:0035  1e                push     ds
1:0036  50                push     ax
1:0037  b94600            mov      cx, 0x46
1:003A  51                push     cx
1:003B  b91000            mov      cx, 0x10
1:003E  1e                push     ds
1:003F  51                push     cx
1:0040  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GetPrivateProfileString
1:0045  b8c419            mov      ax, 0x19c4
1:0048  50                push     ax
1:0049  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:1954)
1:004E  5b                pop      bx
1:004F  8bd8              mov      bx, ax
1:0051  80bfc3195c        cmp      byte ptr [bx + 0x19c3], 0x5c
1:0056  740f              je       0x67
1:0058  b83d00            mov      ax, 0x3d
1:005B  50                push     ax
1:005C  b8c419            mov      ax, 0x19c4
1:005F  50                push     ax
1:0060  9a7f000000        lcall    0, 0x7f  ; @1:INT:ord_6(1:18E2)
1:0065  5b                pop      bx
1:0066  5b                pop      bx
1:0067  b8c419            mov      ax, 0x19c4
1:006A  50                push     ax
1:006B  b8c608            mov      ax, 0x8c6
1:006E  50                push     ax
1:006F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:1922)
1:0074  5b                pop      bx
1:0075  5b                pop      bx
1:0076  b83f00            mov      ax, 0x3f
1:0079  50                push     ax
1:007A  b8c608            mov      ax, 0x8c6
1:007D  50                push     ax
1:007E  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_6(1:18E2)
1:0083  5b                pop      bx
1:0084  5b                pop      bx
1:0085  c41e781a          les      bx, ptr [0x1a78]
1:0089  268b4706          mov      ax, word ptr es:[bx + 6]
1:008D  eb6f              jmp      0xfe
1:008F  c70648050500      mov      word ptr [0x548], 5
1:0095  c7064a050000      mov      word ptr [0x54a], 0
1:009B  e99f00            jmp      0x13d
1:009E  c70648050a00      mov      word ptr [0x548], 0xa
1:00A4  ebef              jmp      0x95
1:00A6  c70648051400      mov      word ptr [0x548], 0x14
1:00AC  ebe7              jmp      0x95
1:00AE  c70648051e00      mov      word ptr [0x548], 0x1e
1:00B4  ebdf              jmp      0x95
1:00B6  c70648052800      mov      word ptr [0x548], 0x28
1:00BC  ebd7              jmp      0x95
1:00BE  c70648053200      mov      word ptr [0x548], 0x32
1:00C4  ebcf              jmp      0x95
1:00C6  c70648053c00      mov      word ptr [0x548], 0x3c
1:00CC  ebc7              jmp      0x95
1:00CE  c70648057800      mov      word ptr [0x548], 0x78
1:00D4  ebbf              jmp      0x95
1:00D6  c70648052c01      mov      word ptr [0x548], 0x12c
1:00DC  ebb7              jmp      0x95
1:00DE  c70648055802      mov      word ptr [0x548], 0x258
1:00E4  ebaf              jmp      0x95
1:00E6  c70648058403      mov      word ptr [0x548], 0x384
1:00EC  eba7              jmp      0x95
1:00EE  c70648050807      mov      word ptr [0x548], 0x708
1:00F4  eb9f              jmp      0x95
1:00F6  c7064805100e      mov      word ptr [0x548], 0xe10
1:00FC  eb97              jmp      0x95
1:00FE  3d6400            cmp      ax, 0x64
1:0101  773a              ja       0x13d
1:0103  b305              mov      bl, 5
1:0105  f6f3              div      bl
1:0107  0ae4              or       ah, ah
1:0109  7532              jne      0x13d
1:010B  d1e0              shl      ax, 1
1:010D  93                xchg     bx, ax
1:010E  2effa71301        jmp      word ptr cs:[bx + 0x113]
1:0113  8f00              pop      word ptr [bx + si]
1:0115  9e                sahf     
1:0116  00a600ae          add      byte ptr [bp - 0x5200], ah
1:011A  00b600be          add      byte ptr [bp - 0x4200], dh
1:011E  00c6              add      dh, al
1:0120  003d              add      byte ptr [di], bh
1:0122  01ce              add      si, cx
1:0124  003d              add      byte ptr [di], bh
1:0126  01d6              add      si, dx
1:0128  003d              add      byte ptr [di], bh
1:012A  01de              add      si, bx
1:012C  003d              add      byte ptr [di], bh
1:012E  01e6              add      si, sp
1:0130  003d              add      byte ptr [di], bh
1:0132  01ee              add      si, bp
1:0134  003d              add      byte ptr [di], bh
1:0136  01f6              add      si, si
1:0138  003d              add      byte ptr [di], bh
1:013A  01f6              add      si, si
1:013C  00c4              add      ah, al
1:013E  1e                push     ds
1:013F  781a              js       0x15b
1:0141  268b4708          mov      ax, word ptr es:[bx + 8]
1:0145  3d6400            cmp      ax, 0x64
1:0148  7474              je       0x1be
1:014A  7718              ja       0x164
1:014C  0ac0              or       al, al
1:014E  740e              je       0x15e
1:0150  2c21              sub      al, 0x21
1:0152  745a              je       0x1ae
1:0154  2c22              sub      al, 0x22
1:0156  745e              je       0x1b6
1:0158  2c17              sub      al, 0x17
1:015A  7462              je       0x1be
1:015C  eb06              jmp      0x164
1:015E  c70620090300      mov      word ptr [0x920], 3
1:0164  b84005            mov      ax, 0x540
1:0167  50                push     ax
1:0168  9a28020000        lcall    0, 0x228  ; @1:INT:ord_5(1:1970)
1:016D  5b                pop      bx
1:016E  a14005            mov      ax, word ptr [0x540]
1:0171  8b164205          mov      dx, word ptr [0x542]
1:0175  a34405            mov      word ptr [0x544], ax
1:0178  89164605          mov      word ptr [0x546], dx
1:017C  2bc0              sub      ax, ax
1:017E  50                push     ax
1:017F  b80804            mov      ax, 0x408
1:0182  50                push     ax
1:0183  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LocalAlloc
1:0188  a35609            mov      word ptr [0x956], ax
1:018B  0e                push     cs
1:018C  e8eb10            call     0x127a
1:018F  0bc0              or       ax, ax
1:0191  7533              jne      0x1c6
1:0193  c41e2609          les      bx, ptr [0x926]
1:0197  26ff7724          push     word ptr es:[bx + 0x24]
1:019B  26ff7722          push     word ptr es:[bx + 0x22]
1:019F  b84500            mov      ax, 0x45
1:01A2  1e                push     ds
1:01A3  50                push     ax
1:01A4  9aad020000        lcall    0, 0x2ad  ; @1:KERNEL.lstrcpy
1:01A9  b80700            mov      ax, 7
1:01AC  eb1a              jmp      0x1c8
1:01AE  c70620090200      mov      word ptr [0x920], 2
1:01B4  ebae              jmp      0x164
1:01B6  c70620090100      mov      word ptr [0x920], 1
1:01BC  eba6              jmp      0x164
1:01BE  c70620090000      mov      word ptr [0x920], 0
1:01C4  eb9e              jmp      0x164
1:01C6  2bc0              sub      ax, ax
1:01C8  4d                dec      bp
1:01C9  4d                dec      bp
1:01CA  8be5              mov      sp, bp
1:01CC  1f                pop      ds
1:01CD  5d                pop      bp
1:01CE  4d                dec      bp
1:01CF  cb                retf     

; ===== EXPORT:ord_20(#20) =====
1:01D0  1e                push     ds
1:01D1  58                pop      ax
1:01D2  90                nop      
1:01D3  45                inc      bp
1:01D4  55                push     bp
1:01D5  8bec              mov      bp, sp
1:01D7  1e                push     ds
1:01D8  8ed8              mov      ds, ax
1:01DA  b84c05            mov      ax, 0x54c
1:01DD  1e                push     ds
1:01DE  50                push     ax
1:01DF  2bc0              sub      ax, ax
1:01E1  50                push     ax
1:01E2  50                push     ax
1:01E3  c41e781a          les      bx, ptr [0x1a78]
1:01E7  26ff7702          push     word ptr es:[bx + 2]
1:01EB  26ff7704          push     word ptr es:[bx + 4]
1:01EF  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:01F4  ff362209          push     word ptr [0x922]
1:01F8  b84c05            mov      ax, 0x54c
1:01FB  1e                push     ds
1:01FC  50                push     ax
1:01FD  b80400            mov      ax, 4
1:0200  50                push     ax
1:0201  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:0206  50                push     ax
1:0207  9affff0000        lcall    0, 0xffff  ; @1:USER.FillRect
1:020C  2bc0              sub      ax, ax
1:020E  4d                dec      bp
1:020F  4d                dec      bp
1:0210  8be5              mov      sp, bp
1:0212  1f                pop      ds
1:0213  5d                pop      bp
1:0214  4d                dec      bp
1:0215  cb                retf     

; ===== EXPORT:ord_19(#19) =====
1:0216  1e                push     ds
1:0217  58                pop      ax
1:0218  90                nop      
1:0219  45                inc      bp
1:021A  55                push     bp
1:021B  8bec              mov      bp, sp
1:021D  1e                push     ds
1:021E  8ed8              mov      ds, ax
1:0220  83ec04            sub      sp, 4
1:0223  b84005            mov      ax, 0x540
1:0226  50                push     ax
1:0227  9a2e030000        lcall    0, 0x32e  ; @1:INT:ord_5(1:1970)
1:022C  5b                pop      bx
1:022D  a14405            mov      ax, word ptr [0x544]
1:0230  8b164605          mov      dx, word ptr [0x546]
1:0234  39164205          cmp      word ptr [0x542], dx
1:0238  7303              jae      0x23d
1:023A  e90c01            jmp      0x349
1:023D  7709              ja       0x248
1:023F  39064005          cmp      word ptr [0x540], ax
1:0243  7303              jae      0x248
1:0245  e90101            jmp      0x349
1:0248  0e                push     cs
1:0249  e84303            call     0x58f
1:024C  48                dec      ax
1:024D  744c              je       0x29b
1:024F  48                dec      ax
1:0250  7465              je       0x2b7
1:0252  833efa0000        cmp      word ptr [0xfa], 0
1:0257  7503              jne      0x25c
1:0259  e9b400            jmp      0x310
1:025C  ff362209          push     word ptr [0x922]
1:0260  ff36ea00          push     word ptr [0xea]
1:0264  2bc0              sub      ax, ax
1:0266  50                push     ax
1:0267  9a0c030000        lcall    0, 0x30c  ; @1:USER.SelectPalette
1:026C  a35805            mov      word ptr [0x558], ax
1:026F  ff362209          push     word ptr [0x922]
1:0273  9affff0000        lcall    0, 0xffff  ; @1:USER.RealizePalette
1:0278  833eee0000        cmp      word ptr [0xee], 0
1:027D  7449              je       0x2c8
1:027F  833ef60000        cmp      word ptr [0xf6], 0
1:0284  7542              jne      0x2c8
1:0286  b82000            mov      ax, 0x20
1:0289  bacc00            mov      dx, 0xcc
1:028C  52                push     dx
1:028D  50                push     ax
1:028E  ff36ee00          push     word ptr [0xee]
1:0292  0e                push     cs
1:0293  e8800d            call     0x1016
1:0296  83c406            add      sp, 6
1:0299  eb65              jmp      0x300
1:029B  c41e2609          les      bx, ptr [0x926]
1:029F  26ff7724          push     word ptr es:[bx + 0x24]
1:02A3  26ff7722          push     word ptr es:[bx + 0x22]
1:02A7  b8fe00            mov      ax, 0xfe
1:02AA  1e                push     ds
1:02AB  50                push     ax
1:02AC  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.lstrcpy
1:02B1  b80700            mov      ax, 7
1:02B4  e99400            jmp      0x34b
1:02B7  c41e2609          les      bx, ptr [0x926]
1:02BB  26ff7724          push     word ptr es:[bx + 0x24]
1:02BF  26ff7722          push     word ptr es:[bx + 0x22]
1:02C3  b83601            mov      ax, 0x136
1:02C6  ebe2              jmp      0x2aa
1:02C8  833eec0000        cmp      word ptr [0xec], 0
1:02CD  7431              je       0x300
1:02CF  b85a05            mov      ax, 0x55a
1:02D2  1e                push     ds
1:02D3  50                push     ax
1:02D4  ff36ec00          push     word ptr [0xec]
1:02D8  0e                push     cs
1:02D9  e87e05            call     0x85a
1:02DC  83c406            add      sp, 6
1:02DF  b82000            mov      ax, 0x20
1:02E2  bacc00            mov      dx, 0xcc
1:02E5  52                push     dx
1:02E6  50                push     ax
1:02E7  2bc0              sub      ax, ax
1:02E9  50                push     ax
1:02EA  50                push     ax
1:02EB  ff36ec00          push     word ptr [0xec]
1:02EF  ff366205          push     word ptr [0x562]
1:02F3  ff365e05          push     word ptr [0x55e]
1:02F7  50                push     ax
1:02F8  50                push     ax
1:02F9  0e                push     cs
1:02FA  e8e10b            call     0xede
1:02FD  83c412            add      sp, 0x12
1:0300  ff362209          push     word ptr [0x922]
1:0304  ff365805          push     word ptr [0x558]
1:0308  2bc0              sub      ax, ax
1:030A  50                push     ax
1:030B  9affff0000        lcall    0, 0xffff  ; @1:USER.SelectPalette
1:0310  0e                push     cs
1:0311  e8a80f            call     0x12bc
1:0314  0bc0              or       ax, ax
1:0316  7511              jne      0x329
1:0318  c41e2609          les      bx, ptr [0x926]
1:031C  26ff7724          push     word ptr es:[bx + 0x24]
1:0320  26ff7722          push     word ptr es:[bx + 0x22]
1:0324  b87a01            mov      ax, 0x17a
1:0327  eb81              jmp      0x2aa
1:0329  b84005            mov      ax, 0x540
1:032C  50                push     ax
1:032D  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_5(1:1970)
1:0332  5b                pop      bx
1:0333  a14005            mov      ax, word ptr [0x540]
1:0336  8b164205          mov      dx, word ptr [0x542]
1:033A  03064805          add      ax, word ptr [0x548]
1:033E  13164a05          adc      dx, word ptr [0x54a]
1:0342  a34405            mov      word ptr [0x544], ax
1:0345  89164605          mov      word ptr [0x546], dx
1:0349  2bc0              sub      ax, ax
1:034B  4d                dec      bp
1:034C  4d                dec      bp
1:034D  8be5              mov      sp, bp
1:034F  1f                pop      ds
1:0350  5d                pop      bp
1:0351  4d                dec      bp
1:0352  cb                retf     

; ===== EXPORT:ord_18(#18) =====
1:0353  1e                push     ds
1:0354  58                pop      ax
1:0355  90                nop      
1:0356  45                inc      bp
1:0357  55                push     bp
1:0358  8bec              mov      bp, sp
1:035A  1e                push     ds
1:035B  8ed8              mov      ds, ax
1:035D  0e                push     cs
1:035E  e8a303            call     0x704
1:0361  2bc0              sub      ax, ax
1:0363  4d                dec      bp
1:0364  4d                dec      bp
1:0365  8be5              mov      sp, bp
1:0367  1f                pop      ds
1:0368  5d                pop      bp
1:0369  4d                dec      bp
1:036A  cb                retf     

; ===== EXPORT:ord_17(#17) =====
1:036B  1e                push     ds
1:036C  58                pop      ax
1:036D  90                nop      
1:036E  45                inc      bp
1:036F  55                push     bp
1:0370  8bec              mov      bp, sp
1:0372  1e                push     ds
1:0373  8ed8              mov      ds, ax
1:0375  2bc0              sub      ax, ax
1:0377  4d                dec      bp
1:0378  4d                dec      bp
1:0379  8be5              mov      sp, bp
1:037B  1f                pop      ds
1:037C  5d                pop      bp
1:037D  4d                dec      bp
1:037E  cb                retf     

; ===== EXPORT:ord_16(#16) =====
1:037F  1e                push     ds
1:0380  58                pop      ax
1:0381  90                nop      
1:0382  45                inc      bp
1:0383  55                push     bp
1:0384  8bec              mov      bp, sp
1:0386  1e                push     ds
1:0387  8ed8              mov      ds, ax
1:0389  2bc0              sub      ax, ax
1:038B  4d                dec      bp
1:038C  4d                dec      bp
1:038D  8be5              mov      sp, bp
1:038F  1f                pop      ds
1:0390  5d                pop      bp
1:0391  4d                dec      bp
1:0392  cb                retf     

; ===== EXPORT:ord_15(#15) =====
1:0393  1e                push     ds
1:0394  58                pop      ax
1:0395  90                nop      
1:0396  45                inc      bp
1:0397  55                push     bp
1:0398  8bec              mov      bp, sp
1:039A  1e                push     ds
1:039B  8ed8              mov      ds, ax
1:039D  8b4606            mov      ax, word ptr [bp + 6]
1:03A0  0bc0              or       ax, ax
1:03A2  740f              je       0x3b3
1:03A4  48                dec      ax
1:03A5  7503              jne      0x3aa
1:03A7  e9d000            jmp      0x47a
1:03AA  48                dec      ax
1:03AB  48                dec      ax
1:03AC  7503              jne      0x3b1
1:03AE  e92001            jmp      0x4d1
1:03B1  eb0b              jmp      0x3be
1:03B3  c41e2609          les      bx, ptr [0x926]
1:03B7  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:03BC  7405              je       0x3c3
1:03BE  2bc0              sub      ax, ax
1:03C0  e99701            jmp      0x55a
1:03C3  c41e781a          les      bx, ptr [0x1a78]
1:03C7  268b4706          mov      ax, word ptr es:[bx + 6]
1:03CB  eb6e              jmp      0x43b
1:03CD  c70648050500      mov      word ptr [0x548], 5
1:03D3  eb5e              jmp      0x433
1:03D5  c70648050a00      mov      word ptr [0x548], 0xa
1:03DB  eb56              jmp      0x433
1:03DD  c70648051400      mov      word ptr [0x548], 0x14
1:03E3  eb4e              jmp      0x433
1:03E5  c70648051e00      mov      word ptr [0x548], 0x1e
1:03EB  eb46              jmp      0x433
1:03ED  c70648052800      mov      word ptr [0x548], 0x28
1:03F3  eb3e              jmp      0x433
1:03F5  c70648053200      mov      word ptr [0x548], 0x32
1:03FB  eb36              jmp      0x433
1:03FD  c70648053c00      mov      word ptr [0x548], 0x3c
1:0403  eb2e              jmp      0x433
1:0405  c70648057800      mov      word ptr [0x548], 0x78
1:040B  eb26              jmp      0x433
1:040D  c70648052c01      mov      word ptr [0x548], 0x12c
1:0413  eb1e              jmp      0x433
1:0415  c70648055802      mov      word ptr [0x548], 0x258
1:041B  eb16              jmp      0x433
1:041D  c70648058403      mov      word ptr [0x548], 0x384
1:0423  eb0e              jmp      0x433
1:0425  c70648050807      mov      word ptr [0x548], 0x708
1:042B  eb06              jmp      0x433
1:042D  c7064805100e      mov      word ptr [0x548], 0xe10
1:0433  c7064a050000      mov      word ptr [0x54a], 0
1:0439  eb83              jmp      0x3be
1:043B  3d6400            cmp      ax, 0x64
1:043E  7745              ja       0x485
1:0440  b305              mov      bl, 5
1:0442  f6f3              div      bl
1:0444  0ae4              or       ah, ah
1:0446  753d              jne      0x485
1:0448  d1e0              shl      ax, 1
1:044A  93                xchg     bx, ax
1:044B  2effa75004        jmp      word ptr cs:[bx + 0x450]
1:0450  cd03              int      3
1:0452  d503              aad      3
1:0454  dd03              fld      qword ptr [bp + di]
1:0456  e503              in       ax, 3
1:0458  ed                in       ax, dx
1:0459  03f5              add      si, bp
1:045B  03fd              add      di, bp
1:045D  03be0305          add      di, word ptr [bp + 0x503]
1:0461  04be              add      al, 0xbe
1:0463  030d              add      cx, word ptr [di]
1:0465  04be              add      al, 0xbe
1:0467  0315              add      dx, word ptr [di]
1:0469  04be              add      al, 0xbe
1:046B  031d              add      bx, word ptr [di]
1:046D  04be              add      al, 0xbe
1:046F  0325              add      sp, word ptr [di]
1:0471  04be              add      al, 0xbe
1:0473  032d              add      bp, word ptr [di]
1:0475  04be              add      al, 0xbe
1:0477  032d              add      bp, word ptr [di]
1:0479  04c4              add      al, 0xc4
1:047B  1e                push     ds
1:047C  260926837f        or       word ptr es:[0x7f83], sp
1:0481  1e                push     ds
1:0482  017403            add      word ptr [si + 3], si
1:0485  e936ff            jmp      0x3be
1:0488  c41e781a          les      bx, ptr [0x1a78]
1:048C  268b4708          mov      ax, word ptr es:[bx + 8]
1:0490  3d6400            cmp      ax, 0x64
1:0493  7433              je       0x4c8
1:0495  7603              jbe      0x49a
1:0497  e924ff            jmp      0x3be
1:049A  0ac0              or       al, al
1:049C  740f              je       0x4ad
1:049E  2c21              sub      al, 0x21
1:04A0  7414              je       0x4b6
1:04A2  2c22              sub      al, 0x22
1:04A4  7419              je       0x4bf
1:04A6  2c17              sub      al, 0x17
1:04A8  741e              je       0x4c8
1:04AA  e911ff            jmp      0x3be
1:04AD  c70620090300      mov      word ptr [0x920], 3
1:04B3  e908ff            jmp      0x3be
1:04B6  c70620090200      mov      word ptr [0x920], 2
1:04BC  e9fffe            jmp      0x3be
1:04BF  c70620090100      mov      word ptr [0x920], 1
1:04C5  e9f6fe            jmp      0x3be
1:04C8  c70620090000      mov      word ptr [0x920], 0
1:04CE  e9edfe            jmp      0x3be
1:04D1  0e                push     cs
1:04D2  e83a0e            call     0x130f
1:04D5  0bc0              or       ax, ax
1:04D7  741c              je       0x4f5
1:04D9  b8b701            mov      ax, 0x1b7
1:04DC  1e                push     ds
1:04DD  50                push     ax
1:04DE  b8aa01            mov      ax, 0x1aa
1:04E1  1e                push     ds
1:04E2  50                push     ax
1:04E3  b8c419            mov      ax, 0x19c4
1:04E6  1e                push     ds
1:04E7  50                push     ax
1:04E8  b89d01            mov      ax, 0x19d
1:04EB  1e                push     ds
1:04EC  50                push     ax
1:04ED  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.WritePrivateProfileString
1:04F2  e9c9fe            jmp      0x3be
1:04F5  b8e401            mov      ax, 0x1e4
1:04F8  1e                push     ds
1:04F9  50                push     ax
1:04FA  b8d701            mov      ax, 0x1d7
1:04FD  1e                push     ds
1:04FE  50                push     ax
1:04FF  b8cf01            mov      ax, 0x1cf
1:0502  1e                push     ds
1:0503  50                push     ax
1:0504  b8c419            mov      ax, 0x19c4
1:0507  1e                push     ds
1:0508  50                push     ax
1:0509  b94600            mov      cx, 0x46
1:050C  51                push     cx
1:050D  b9c201            mov      cx, 0x1c2
1:0510  1e                push     ds
1:0511  51                push     cx
1:0512  9a41000000        lcall    0, 0x41  ; @1:KERNEL.GetPrivateProfileString
1:0517  b8c419            mov      ax, 0x19c4
1:051A  50                push     ax
1:051B  9a4a000000        lcall    0, 0x4a  ; @1:INT:ord_8(1:1954)
1:0520  5b                pop      bx
1:0521  8bd8              mov      bx, ax
1:0523  80bfc3195c        cmp      byte ptr [bx + 0x19c3], 0x5c
1:0528  740f              je       0x539
1:052A  b8ef01            mov      ax, 0x1ef
1:052D  50                push     ax
1:052E  b8c419            mov      ax, 0x19c4
1:0531  50                push     ax
1:0532  9a51050000        lcall    0, 0x551  ; @1:INT:ord_6(1:18E2)
1:0537  5b                pop      bx
1:0538  5b                pop      bx
1:0539  b8c419            mov      ax, 0x19c4
1:053C  50                push     ax
1:053D  b8c608            mov      ax, 0x8c6
1:0540  50                push     ax
1:0541  9ab1050000        lcall    0, 0x5b1  ; @1:INT:ord_7(1:1922)
1:0546  5b                pop      bx
1:0547  5b                pop      bx
1:0548  b8f101            mov      ax, 0x1f1
1:054B  50                push     ax
1:054C  b8c608            mov      ax, 0x8c6
1:054F  50                push     ax
1:0550  9ac0050000        lcall    0, 0x5c0  ; @1:INT:ord_6(1:18E2)
1:0555  5b                pop      bx
1:0556  5b                pop      bx
1:0557  e964fe            jmp      0x3be
1:055A  4d                dec      bp
1:055B  4d                dec      bp
1:055C  8be5              mov      sp, bp
1:055E  1f                pop      ds
1:055F  5d                pop      bp
1:0560  4d                dec      bp
1:0561  cb                retf     
1:0562  1e                push     ds
1:0563  58                pop      ax
1:0564  90                nop      
1:0565  45                inc      bp
1:0566  55                push     bp
1:0567  8bec              mov      bp, sp
1:0569  1e                push     ds
1:056A  8ed8              mov      ds, ax
1:056C  ff36fc00          push     word ptr [0xfc]
1:0570  9a0f000000        lcall    0, 0xf  ; @1:USER.IsWindow
1:0575  0bc0              or       ax, ax
1:0577  740c              je       0x585
1:0579  ff36fc00          push     word ptr [0xfc]
1:057D  2bc0              sub      ax, ax
1:057F  50                push     ax
1:0580  9a1f000000        lcall    0, 0x1f  ; @1:USER.EndDialog
1:0585  2bc0              sub      ax, ax
1:0587  4d                dec      bp
1:0588  4d                dec      bp
1:0589  8be5              mov      sp, bp
1:058B  1f                pop      ds
1:058C  5d                pop      bp
1:058D  4d                dec      bp
1:058E  cb                retf     
1:058F  1e                push     ds
1:0590  58                pop      ax
1:0591  90                nop      
1:0592  45                inc      bp
1:0593  55                push     bp
1:0594  8bec              mov      bp, sp
1:0596  1e                push     ds
1:0597  8ed8              mov      ds, ax
1:0599  83ec04            sub      sp, 4
1:059C  0e                push     cs
1:059D  e86401            call     0x704
1:05A0  2bc0              sub      ax, ax
1:05A2  50                push     ax
1:05A3  0e                push     cs
1:05A4  e8f50a            call     0x109c
1:05A7  5b                pop      bx
1:05A8  b8c419            mov      ax, 0x19c4
1:05AB  50                push     ax
1:05AC  b86800            mov      ax, 0x68
1:05AF  50                push     ax
1:05B0  9a70000000        lcall    0, 0x70  ; @1:INT:ord_7(1:1922)
1:05B5  5b                pop      bx
1:05B6  5b                pop      bx
1:05B7  b85619            mov      ax, 0x1956
1:05BA  50                push     ax
1:05BB  b86800            mov      ax, 0x68
1:05BE  50                push     ax
1:05BF  9a61000000        lcall    0, 0x61  ; @1:INT:ord_6(1:18E2)
1:05C4  5b                pop      bx
1:05C5  5b                pop      bx
1:05C6  b86800            mov      ax, 0x68
1:05C9  1e                push     ds
1:05CA  50                push     ax
1:05CB  b88205            mov      ax, 0x582
1:05CE  1e                push     ds
1:05CF  50                push     ax
1:05D0  2bc0              sub      ax, ax
1:05D2  50                push     ax
1:05D3  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.OpenFile
1:05D8  a33a06            mov      word ptr [0x63a], ax
1:05DB  3dffff            cmp      ax, 0xffff
1:05DE  7506              jne      0x5e6
1:05E0  b80100            mov      ax, 1
1:05E3  e91601            jmp      0x6fc
1:05E6  50                push     ax
1:05E7  0e                push     cs
1:05E8  e8df04            call     0xaca
1:05EB  5b                pop      bx
1:05EC  a3f000            mov      word ptr [0xf0], ax
1:05EF  ff363a06          push     word ptr [0x63a]
1:05F3  2bc0              sub      ax, ax
1:05F5  50                push     ax
1:05F6  50                push     ax
1:05F7  b80100            mov      ax, 1
1:05FA  50                push     ax
1:05FB  9affff0000        lcall    0, 0xffff  ; @1:KERNEL._llseek
1:0600  a3c208            mov      word ptr [0x8c2], ax
1:0603  8916c408          mov      word ptr [0x8c4], dx
1:0607  ff363a06          push     word ptr [0x63a]
1:060B  9affff0000        lcall    0, 0xffff  ; @1:KERNEL._lclose
1:0610  833ef00000        cmp      word ptr [0xf0], 0
1:0615  7506              jne      0x61d
1:0617  b80200            mov      ax, 2
1:061A  e9df00            jmp      0x6fc
1:061D  b81206            mov      ax, 0x612
1:0620  1e                push     ds
1:0621  50                push     ax
1:0622  ff36f000          push     word ptr [0xf0]
1:0626  0e                push     cs
1:0627  e83002            call     0x85a
1:062A  83c406            add      sp, 6
1:062D  ff36f000          push     word ptr [0xf0]
1:0631  0e                push     cs
1:0632  e85b04            call     0xa90
1:0635  5b                pop      bx
1:0636  a3ea00            mov      word ptr [0xea], ax
1:0639  0bc0              or       ax, ax
1:063B  74da              je       0x617
1:063D  ff36f000          push     word ptr [0xf0]
1:0641  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalLock
1:0646  a30e06            mov      word ptr [0x60e], ax
1:0649  89161006          mov      word ptr [0x610], dx
1:064D  c41e0e06          les      bx, ptr [0x60e]
1:0651  26837f0e18        cmp      word ptr es:[bx + 0xe], 0x18
1:0656  7434              je       0x68c
1:0658  c706e8000100      mov      word ptr [0xe8], 1
1:065E  26031f            add      bx, word ptr es:[bx]
1:0661  891e0a06          mov      word ptr [0x60a], bx
1:0665  8c060c06          mov      word ptr [0x60c], es
1:0669  c746fc0000        mov      word ptr [bp - 4], 0
1:066E  eb0f              jmp      0x67f
1:0670  c41e0a06          les      bx, ptr [0x60a]
1:0674  268907            mov      word ptr es:[bx], ax
1:0677  83060a0602        add      word ptr [0x60a], 2
1:067C  ff46fc            inc      word ptr [bp - 4]
1:067F  8b46fc            mov      ax, word ptr [bp - 4]
1:0682  c41e0e06          les      bx, ptr [0x60e]
1:0686  26394720          cmp      word ptr es:[bx + 0x20], ax
1:068A  7fe4              jg       0x670
1:068C  ff36f000          push     word ptr [0xf0]
1:0690  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalUnlock
1:0695  c706fa000100      mov      word ptr [0xfa], 1
1:069B  833ef20000        cmp      word ptr [0xf2], 0
1:06A0  7509              jne      0x6ab
1:06A2  a12406            mov      ax, word ptr [0x624]
1:06A5  0b062206          or       ax, word ptr [0x622]
1:06A9  740e              je       0x6b9
1:06AB  b86800            mov      ax, 0x68
1:06AE  1e                push     ds
1:06AF  50                push     ax
1:06B0  0e                push     cs
1:06B1  e8bf00            call     0x773
1:06B4  5b                pop      bx
1:06B5  5b                pop      bx
1:06B6  a3ec00            mov      word ptr [0xec], ax
1:06B9  a12406            mov      ax, word ptr [0x624]
1:06BC  0b062206          or       ax, word ptr [0x622]
1:06C0  7507              jne      0x6c9
1:06C2  833eec0000        cmp      word ptr [0xec], 0
1:06C7  7507              jne      0x6d0
1:06C9  0e                push     cs
1:06CA  e83700            call     0x704
1:06CD  e947ff            jmp      0x617
1:06D0  833eec0000        cmp      word ptr [0xec], 0
1:06D5  7423              je       0x6fa
1:06D7  833ef60000        cmp      word ptr [0xf6], 0
1:06DC  751c              jne      0x6fa
1:06DE  833ef20000        cmp      word ptr [0xf2], 0
1:06E3  7415              je       0x6fa
1:06E5  ff36ea00          push     word ptr [0xea]
1:06E9  ff36ec00          push     word ptr [0xec]
1:06ED  0e                push     cs
1:06EE  e82907            call     0xe1a
1:06F1  5b                pop      bx
1:06F2  5b                pop      bx
1:06F3  a3ee00            mov      word ptr [0xee], ax
1:06F6  0bc0              or       ax, ax
1:06F8  74cf              je       0x6c9
1:06FA  2bc0              sub      ax, ax
1:06FC  4d                dec      bp
1:06FD  4d                dec      bp
1:06FE  8be5              mov      sp, bp
1:0700  1f                pop      ds
1:0701  5d                pop      bp
1:0702  4d                dec      bp
1:0703  cb                retf     
1:0704  1e                push     ds
1:0705  58                pop      ax
1:0706  90                nop      
1:0707  45                inc      bp
1:0708  55                push     bp
1:0709  8bec              mov      bp, sp
1:070B  1e                push     ds
1:070C  8ed8              mov      ds, ax
1:070E  833eea0000        cmp      word ptr [0xea], 0
1:0713  7409              je       0x71e
1:0715  ff36ea00          push     word ptr [0xea]
1:0719  9a2a070000        lcall    0, 0x72a  ; @1:GDI.DeleteObject
1:071E  833eee0000        cmp      word ptr [0xee], 0
1:0723  7409              je       0x72e
1:0725  ff36ee00          push     word ptr [0xee]
1:0729  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteObject
1:072E  833eec0000        cmp      word ptr [0xec], 0
1:0733  7409              je       0x73e
1:0735  ff36ec00          push     word ptr [0xec]
1:0739  9a53070000        lcall    0, 0x753  ; @1:KERNEL.GlobalFree
1:073E  833ef00000        cmp      word ptr [0xf0], 0
1:0743  7412              je       0x757
1:0745  a1ec00            mov      ax, word ptr [0xec]
1:0748  3906f000          cmp      word ptr [0xf0], ax
1:074C  7409              je       0x757
1:074E  ff36f000          push     word ptr [0xf0]
1:0752  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalFree
1:0757  2bc0              sub      ax, ax
1:0759  a3e800            mov      word ptr [0xe8], ax
1:075C  a3fa00            mov      word ptr [0xfa], ax
1:075F  a3ea00            mov      word ptr [0xea], ax
1:0762  a3ec00            mov      word ptr [0xec], ax
1:0765  a3ee00            mov      word ptr [0xee], ax
1:0768  a3f000            mov      word ptr [0xf0], ax
1:076B  4d                dec      bp
1:076C  4d                dec      bp
1:076D  8be5              mov      sp, bp
1:076F  1f                pop      ds
1:0770  5d                pop      bp
1:0771  4d                dec      bp
1:0772  cb                retf     
1:0773  1e                push     ds
1:0774  58                pop      ax
1:0775  90                nop      
1:0776  45                inc      bp
1:0777  55                push     bp
1:0778  8bec              mov      bp, sp
1:077A  1e                push     ds
1:077B  8ed8              mov      ds, ax
1:077D  83ec10            sub      sp, 0x10
1:0780  ff7608            push     word ptr [bp + 8]
1:0783  ff7606            push     word ptr [bp + 6]
1:0786  b83c06            mov      ax, 0x63c
1:0789  1e                push     ds
1:078A  50                push     ax
1:078B  2bc0              sub      ax, ax
1:078D  50                push     ax
1:078E  9ad4050000        lcall    0, 0x5d4  ; @1:KERNEL.OpenFile
1:0793  8946f0            mov      word ptr [bp - 0x10], ax
1:0796  3dffff            cmp      ax, 0xffff
1:0799  7505              jne      0x7a0
1:079B  2bc0              sub      ax, ax
1:079D  e9b200            jmp      0x852
1:07A0  50                push     ax
1:07A1  0e                push     cs
1:07A2  e82503            call     0xaca
1:07A5  5b                pop      bx
1:07A6  8946fc            mov      word ptr [bp - 4], ax
1:07A9  0bc0              or       ax, ax
1:07AB  74ee              je       0x79b
1:07AD  b8c806            mov      ax, 0x6c8
1:07B0  1e                push     ds
1:07B1  50                push     ax
1:07B2  ff76fc            push     word ptr [bp - 4]
1:07B5  0e                push     cs
1:07B6  e8a100            call     0x85a
1:07B9  83c406            add      sp, 6
1:07BC  a1dc06            mov      ax, word ptr [0x6dc]
1:07BF  8b16de06          mov      dx, word ptr [0x6de]
1:07C3  8946f2            mov      word ptr [bp - 0xe], ax
1:07C6  8956f4            mov      word ptr [bp - 0xc], dx
1:07C9  ff76fc            push     word ptr [bp - 4]
1:07CC  b9c806            mov      cx, 0x6c8
1:07CF  1e                push     ds
1:07D0  51                push     cx
1:07D1  0e                push     cs
1:07D2  e88405            call     0xd59
1:07D5  5b                pop      bx
1:07D6  5b                pop      bx
1:07D7  2bd2              sub      dx, dx
1:07D9  0306dc06          add      ax, word ptr [0x6dc]
1:07DD  1316de06          adc      dx, word ptr [0x6de]
1:07E1  0306c806          add      ax, word ptr [0x6c8]
1:07E5  1316ca06          adc      dx, word ptr [0x6ca]
1:07E9  52                push     dx
1:07EA  50                push     ax
1:07EB  b84200            mov      ax, 0x42
1:07EE  50                push     ax
1:07EF  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalReAlloc
1:07F4  0bc0              or       ax, ax
1:07F6  750f              jne      0x807
1:07F8  ff76fc            push     word ptr [bp - 4]
1:07FB  9a3a070000        lcall    0, 0x73a  ; @1:KERNEL.GlobalFree
1:0800  c746fc0000        mov      word ptr [bp - 4], 0
1:0805  eb03              jmp      0x80a
1:0807  8946fc            mov      word ptr [bp - 4], ax
1:080A  837efc00          cmp      word ptr [bp - 4], 0
1:080E  7437              je       0x847
1:0810  ff76fc            push     word ptr [bp - 4]
1:0813  9a73080000        lcall    0, 0x873  ; @1:KERNEL.GlobalLock
1:0818  a3c406            mov      word ptr [0x6c4], ax
1:081B  8916c606          mov      word ptr [0x6c6], dx
1:081F  ff76f0            push     word ptr [bp - 0x10]
1:0822  52                push     dx
1:0823  50                push     ax
1:0824  0e                push     cs
1:0825  e83105            call     0xd59
1:0828  5b                pop      bx
1:0829  5b                pop      bx
1:082A  c41ec406          les      bx, ptr [0x6c4]
1:082E  260307            add      ax, word ptr es:[bx]
1:0831  03d8              add      bx, ax
1:0833  06                push     es
1:0834  53                push     bx
1:0835  ff76f4            push     word ptr [bp - 0xc]
1:0838  ff76f2            push     word ptr [bp - 0xe]
1:083B  0e                push     cs
1:083C  e84407            call     0xf83
1:083F  ff76fc            push     word ptr [bp - 4]
1:0842  9a03090000        lcall    0, 0x903  ; @1:KERNEL.GlobalUnlock
1:0847  ff76f0            push     word ptr [bp - 0x10]
1:084A  9a0c060000        lcall    0, 0x60c  ; @1:KERNEL._lclose
1:084F  8b46fc            mov      ax, word ptr [bp - 4]
1:0852  4d                dec      bp
1:0853  4d                dec      bp
1:0854  8be5              mov      sp, bp
1:0856  1f                pop      ds
1:0857  5d                pop      bp
1:0858  4d                dec      bp
1:0859  cb                retf     
1:085A  1e                push     ds
1:085B  58                pop      ax
1:085C  90                nop      
1:085D  45                inc      bp
1:085E  55                push     bp
1:085F  8bec              mov      bp, sp
1:0861  1e                push     ds
1:0862  8ed8              mov      ds, ax
1:0864  57                push     di
1:0865  56                push     si
1:0866  837e0600          cmp      word ptr [bp + 6], 0
1:086A  7503              jne      0x86f
1:086C  e99d00            jmp      0x90c
1:086F  ff7606            push     word ptr [bp + 6]
1:0872  9aa80a0000        lcall    0, 0xaa8  ; @1:KERNEL.GlobalLock
1:0877  1e                push     ds
1:0878  8bf0              mov      si, ax
1:087A  8eda              mov      ds, dx
1:087C  c47e08            les      di, ptr [bp + 8]
1:087F  b91400            mov      cx, 0x14
1:0882  f3a5              rep movsw word ptr es:[di], word ptr [si]
1:0884  1f                pop      ds
1:0885  8b5e08            mov      bx, word ptr [bp + 8]
1:0888  26833f0c          cmp      word ptr es:[bx], 0xc
1:088C  7507              jne      0x895
1:088E  26837f0200        cmp      word ptr es:[bx + 2], 0
1:0893  746a              je       0x8ff
1:0895  268b4716          mov      ax, word ptr es:[bx + 0x16]
1:0899  260b4714          or       ax, word ptr es:[bx + 0x14]
1:089D  753e              jne      0x8dd
1:089F  26ff770a          push     word ptr es:[bx + 0xa]
1:08A3  26ff7708          push     word ptr es:[bx + 8]
1:08A7  26ff7706          push     word ptr es:[bx + 6]
1:08AB  26ff7704          push     word ptr es:[bx + 4]
1:08AF  268b470e          mov      ax, word ptr es:[bx + 0xe]
1:08B3  2bd2              sub      dx, dx
1:08B5  52                push     dx
1:08B6  50                push     ax
1:08B7  9ace080000        lcall    0, 0x8ce  ; @1:INT:ord_9(1:1A8E)
1:08BC  051f00            add      ax, 0x1f
1:08BF  83d200            adc      dx, 0
1:08C2  24e7              and      al, 0xe7
1:08C4  b103              mov      cl, 3
1:08C6  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:1AC0)
1:08CB  52                push     dx
1:08CC  50                push     ax
1:08CD  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:1A8E)
1:08D2  c45e08            les      bx, ptr [bp + 8]
1:08D5  26894714          mov      word ptr es:[bx + 0x14], ax
1:08D9  26895716          mov      word ptr es:[bx + 0x16], dx
1:08DD  c45e08            les      bx, ptr [bp + 8]
1:08E0  268b4722          mov      ax, word ptr es:[bx + 0x22]
1:08E4  260b4720          or       ax, word ptr es:[bx + 0x20]
1:08E8  7515              jne      0x8ff
1:08EA  06                push     es
1:08EB  53                push     bx
1:08EC  0e                push     cs
1:08ED  e8b004            call     0xda0
1:08F0  5b                pop      bx
1:08F1  5b                pop      bx
1:08F2  c45e08            les      bx, ptr [bp + 8]
1:08F5  26894720          mov      word ptr es:[bx + 0x20], ax
1:08F9  26c747220000      mov      word ptr es:[bx + 0x22], 0
1:08FF  ff7606            push     word ptr [bp + 6]
1:0902  9abb0a0000        lcall    0, 0xabb  ; @1:KERNEL.GlobalUnlock
1:0907  b80100            mov      ax, 1
1:090A  eb02              jmp      0x90e
1:090C  2bc0              sub      ax, ax
1:090E  5e                pop      si
1:090F  5f                pop      di
1:0910  4d                dec      bp
1:0911  4d                dec      bp
1:0912  8be5              mov      sp, bp
1:0914  1f                pop      ds
1:0915  5d                pop      bp
1:0916  4d                dec      bp
1:0917  cb                retf     
1:0918  1e                push     ds
1:0919  58                pop      ax
1:091A  90                nop      
1:091B  45                inc      bp
1:091C  55                push     bp
1:091D  8bec              mov      bp, sp
1:091F  1e                push     ds
1:0920  8ed8              mov      ds, ax
1:0922  83ec0c            sub      sp, 0xc
1:0925  56                push     si
1:0926  8b4608            mov      ax, word ptr [bp + 8]
1:0929  0b4606            or       ax, word ptr [bp + 6]
1:092C  7505              jne      0x933
1:092E  2bc0              sub      ax, ax
1:0930  e95401            jmp      0xa87
1:0933  c45e06            les      bx, ptr [bp + 6]
1:0936  26833f28          cmp      word ptr es:[bx], 0x28
1:093A  75f2              jne      0x92e
1:093C  26837f0200        cmp      word ptr es:[bx + 2], 0
1:0941  75eb              jne      0x92e
1:0943  26031f            add      bx, word ptr es:[bx]
1:0946  891ef006          mov      word ptr [0x6f0], bx
1:094A  8c06f206          mov      word ptr [0x6f2], es
1:094E  06                push     es
1:094F  ff7606            push     word ptr [bp + 6]
1:0952  0e                push     cs
1:0953  e84a04            call     0xda0
1:0956  5b                pop      bx
1:0957  5b                pop      bx
1:0958  8946fc            mov      word ptr [bp - 4], ax
1:095B  0bc0              or       ax, ax
1:095D  747e              je       0x9dd
1:095F  b94000            mov      cx, 0x40
1:0962  51                push     cx
1:0963  40                inc      ax
1:0964  40                inc      ax
1:0965  d1e0              shl      ax, 1
1:0967  d1e0              shl      ax, 1
1:0969  50                push     ax
1:096A  9af8090000        lcall    0, 0x9f8  ; @1:KERNEL.LocalAlloc
1:096F  a3f406            mov      word ptr [0x6f4], ax
1:0972  0bc0              or       ax, ax
1:0974  74b8              je       0x92e
1:0976  8b46fc            mov      ax, word ptr [bp - 4]
1:0979  8b1ef406          mov      bx, word ptr [0x6f4]
1:097D  894702            mov      word ptr [bx + 2], ax
1:0980  8b1ef406          mov      bx, word ptr [0x6f4]
1:0984  c7070003          mov      word ptr [bx], 0x300
1:0988  c746f60000        mov      word ptr [bp - 0xa], 0
1:098D  eb3e              jmp      0x9cd
1:098F  8b76f6            mov      si, word ptr [bp - 0xa]
1:0992  d1e6              shl      si, 1
1:0994  d1e6              shl      si, 1
1:0996  c41ef006          les      bx, ptr [0x6f0]
1:099A  268a4002          mov      al, byte ptr es:[bx + si + 2]
1:099E  8b1ef406          mov      bx, word ptr [0x6f4]
1:09A2  884004            mov      byte ptr [bx + si + 4], al
1:09A5  c41ef006          les      bx, ptr [0x6f0]
1:09A9  268a4001          mov      al, byte ptr es:[bx + si + 1]
1:09AD  8b1ef406          mov      bx, word ptr [0x6f4]
1:09B1  884005            mov      byte ptr [bx + si + 5], al
1:09B4  c41ef006          les      bx, ptr [0x6f0]
1:09B8  268a00            mov      al, byte ptr es:[bx + si]
1:09BB  8b1ef406          mov      bx, word ptr [0x6f4]
1:09BF  884006            mov      byte ptr [bx + si + 6], al
1:09C2  8b1ef406          mov      bx, word ptr [0x6f4]
1:09C6  c6400700          mov      byte ptr [bx + si + 7], 0
1:09CA  ff46f6            inc      word ptr [bp - 0xa]
1:09CD  8b46fc            mov      ax, word ptr [bp - 4]
1:09D0  3946f6            cmp      word ptr [bp - 0xa], ax
1:09D3  72ba              jb       0x98f
1:09D5  1e                push     ds
1:09D6  ff36f406          push     word ptr [0x6f4]
1:09DA  e99600            jmp      0xa73
1:09DD  c45e06            les      bx, ptr [bp + 6]
1:09E0  26837f0e18        cmp      word ptr es:[bx + 0xe], 0x18
1:09E5  7403              je       0x9ea
1:09E7  e99a00            jmp      0xa84
1:09EA  c746fc0001        mov      word ptr [bp - 4], 0x100
1:09EF  b84000            mov      ax, 0x40
1:09F2  50                push     ax
1:09F3  b80804            mov      ax, 0x408
1:09F6  50                push     ax
1:09F7  9a84010000        lcall    0, 0x184  ; @1:KERNEL.LocalAlloc
1:09FC  a3f406            mov      word ptr [0x6f4], ax
1:09FF  0bc0              or       ax, ax
1:0A01  7503              jne      0xa06
1:0A03  e928ff            jmp      0x92e
1:0A06  8b46fc            mov      ax, word ptr [bp - 4]
1:0A09  8b1ef406          mov      bx, word ptr [0x6f4]
1:0A0D  894702            mov      word ptr [bx + 2], ax
1:0A10  8b1ef406          mov      bx, word ptr [0x6f4]
1:0A14  c7070003          mov      word ptr [bx], 0x300
1:0A18  2ac0              sub      al, al
1:0A1A  8846f8            mov      byte ptr [bp - 8], al
1:0A1D  8846fa            mov      byte ptr [bp - 6], al
1:0A20  8846f4            mov      byte ptr [bp - 0xc], al
1:0A23  c746f60000        mov      word ptr [bp - 0xa], 0
1:0A28  eb3b              jmp      0xa65
1:0A2A  8bf0              mov      si, ax
1:0A2C  d1e6              shl      si, 1
1:0A2E  d1e6              shl      si, 1
1:0A30  8a46f4            mov      al, byte ptr [bp - 0xc]
1:0A33  884004            mov      byte ptr [bx + si + 4], al
1:0A36  8a46fa            mov      al, byte ptr [bp - 6]
1:0A39  8b1ef406          mov      bx, word ptr [0x6f4]
1:0A3D  884005            mov      byte ptr [bx + si + 5], al
1:0A40  8a46f8            mov      al, byte ptr [bp - 8]
1:0A43  8b1ef406          mov      bx, word ptr [0x6f4]
1:0A47  884006            mov      byte ptr [bx + si + 6], al
1:0A4A  8b1ef406          mov      bx, word ptr [0x6f4]
1:0A4E  c6400700          mov      byte ptr [bx + si + 7], 0
1:0A52  8046f420          add      byte ptr [bp - 0xc], 0x20
1:0A56  750a              jne      0xa62
1:0A58  8046fa20          add      byte ptr [bp - 6], 0x20
1:0A5C  7504              jne      0xa62
1:0A5E  8046f840          add      byte ptr [bp - 8], 0x40
1:0A62  ff46f6            inc      word ptr [bp - 0xa]
1:0A65  8b46f6            mov      ax, word ptr [bp - 0xa]
1:0A68  8b1ef406          mov      bx, word ptr [0x6f4]
1:0A6C  394702            cmp      word ptr [bx + 2], ax
1:0A6F  77b9              ja       0xa2a
1:0A71  1e                push     ds
1:0A72  53                push     bx
1:0A73  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreatePalette
1:0A78  a3f801            mov      word ptr [0x1f8], ax
1:0A7B  ff36f406          push     word ptr [0x6f4]
1:0A7F  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LocalFree
1:0A84  a1f801            mov      ax, word ptr [0x1f8]
1:0A87  5e                pop      si
1:0A88  4d                dec      bp
1:0A89  4d                dec      bp
1:0A8A  8be5              mov      sp, bp
1:0A8C  1f                pop      ds
1:0A8D  5d                pop      bp
1:0A8E  4d                dec      bp
1:0A8F  cb                retf     
1:0A90  1e                push     ds
1:0A91  58                pop      ax
1:0A92  90                nop      
1:0A93  45                inc      bp
1:0A94  55                push     bp
1:0A95  8bec              mov      bp, sp
1:0A97  1e                push     ds
1:0A98  8ed8              mov      ds, ax
1:0A9A  837e0600          cmp      word ptr [bp + 6], 0
1:0A9E  7504              jne      0xaa4
1:0AA0  2bc0              sub      ax, ax
1:0AA2  eb1e              jmp      0xac2
1:0AA4  ff7606            push     word ptr [bp + 6]
1:0AA7  9a42060000        lcall    0, 0x642  ; @1:KERNEL.GlobalLock
1:0AAC  52                push     dx
1:0AAD  50                push     ax
1:0AAE  0e                push     cs
1:0AAF  e866fe            call     0x918
1:0AB2  5b                pop      bx
1:0AB3  5b                pop      bx
1:0AB4  a3f606            mov      word ptr [0x6f6], ax
1:0AB7  ff7606            push     word ptr [bp + 6]
1:0ABA  9a91060000        lcall    0, 0x691  ; @1:KERNEL.GlobalUnlock
1:0ABF  a1f606            mov      ax, word ptr [0x6f6]
1:0AC2  4d                dec      bp
1:0AC3  4d                dec      bp
1:0AC4  8be5              mov      sp, bp
1:0AC6  1f                pop      ds
1:0AC7  5d                pop      bp
1:0AC8  4d                dec      bp
1:0AC9  cb                retf     
1:0ACA  1e                push     ds
1:0ACB  58                pop      ax
1:0ACC  90                nop      
1:0ACD  45                inc      bp
1:0ACE  55                push     bp
1:0ACF  8bec              mov      bp, sp
1:0AD1  1e                push     ds
1:0AD2  8ed8              mov      ds, ax
1:0AD4  83ec1c            sub      sp, 0x1c
1:0AD7  57                push     di
1:0AD8  56                push     si
1:0AD9  2bc0              sub      ax, ax
1:0ADB  837e06ff          cmp      word ptr [bp + 6], -1
1:0ADF  7505              jne      0xae6
1:0AE1  2bc0              sub      ax, ax
1:0AE3  e96902            jmp      0xd4f
1:0AE6  ff7606            push     word ptr [bp + 6]
1:0AE9  50                push     ax
1:0AEA  50                push     ax
1:0AEB  b80100            mov      ax, 1
1:0AEE  50                push     ax
1:0AEF  9afc050000        lcall    0, 0x5fc  ; @1:KERNEL._llseek
1:0AF4  8946ea            mov      word ptr [bp - 0x16], ax
1:0AF7  8956ec            mov      word ptr [bp - 0x14], dx
1:0AFA  ff7606            push     word ptr [bp + 6]
1:0AFD  b80807            mov      ax, 0x708
1:0B00  1e                push     ds
1:0B01  50                push     ax
1:0B02  b80e00            mov      ax, 0xe
1:0B05  50                push     ax
1:0B06  9affff0000        lcall    0, 0xffff  ; @1:KERNEL._lread
1:0B0B  3d0e00            cmp      ax, 0xe
1:0B0E  75d1              jne      0xae1
1:0B10  813e0807424d      cmp      word ptr [0x708], 0x4d42
1:0B16  7417              je       0xb2f
1:0B18  2bc0              sub      ax, ax
1:0B1A  a31407            mov      word ptr [0x714], ax
1:0B1D  a31207            mov      word ptr [0x712], ax
1:0B20  ff7606            push     word ptr [bp + 6]
1:0B23  ff76ec            push     word ptr [bp - 0x14]
1:0B26  ff76ea            push     word ptr [bp - 0x16]
1:0B29  50                push     ax
1:0B2A  9ae50b0000        lcall    0, 0xbe5  ; @1:KERNEL._llseek
1:0B2F  ff7606            push     word ptr [bp + 6]
1:0B32  b81607            mov      ax, 0x716
1:0B35  1e                push     ds
1:0B36  50                push     ax
1:0B37  b82800            mov      ax, 0x28
1:0B3A  50                push     ax
1:0B3B  9ab10c0000        lcall    0, 0xcb1  ; @1:KERNEL._lread
1:0B40  3d2800            cmp      ax, 0x28
1:0B43  759c              jne      0xae1
1:0B45  b81607            mov      ax, 0x716
1:0B48  1e                push     ds
1:0B49  50                push     ax
1:0B4A  0e                push     cs
1:0B4B  e85202            call     0xda0
1:0B4E  5b                pop      bx
1:0B4F  5b                pop      bx
1:0B50  8946fc            mov      word ptr [bp - 4], ax
1:0B53  a11607            mov      ax, word ptr [0x716]
1:0B56  8946ee            mov      word ptr [bp - 0x12], ax
1:0B59  2d0c00            sub      ax, 0xc
1:0B5C  740b              je       0xb69
1:0B5E  2d1c00            sub      ax, 0x1c
1:0B61  7503              jne      0xb66
1:0B63  e98300            jmp      0xbe9
1:0B66  e978ff            jmp      0xae1
1:0B69  b8f806            mov      ax, 0x6f8
1:0B6C  8bf8              mov      di, ax
1:0B6E  be1607            mov      si, 0x716
1:0B71  1e                push     ds
1:0B72  07                pop      es
1:0B73  b90600            mov      cx, 6
1:0B76  f3a5              rep movsw word ptr es:[di], word ptr [si]
1:0B78  a1fe06            mov      ax, word ptr [0x6fe]
1:0B7B  2bd2              sub      dx, dx
1:0B7D  8b0e0007          mov      cx, word ptr [0x700]
1:0B81  8b1e0207          mov      bx, word ptr [0x702]
1:0B85  c70616072800      mov      word ptr [0x716], 0x28
1:0B8B  89161807          mov      word ptr [0x718], dx
1:0B8F  8b36fc06          mov      si, word ptr [0x6fc]
1:0B93  2bff              sub      di, di
1:0B95  89361a07          mov      word ptr [0x71a], si
1:0B99  893e1c07          mov      word ptr [0x71c], di
1:0B9D  a31e07            mov      word ptr [0x71e], ax
1:0BA0  89162007          mov      word ptr [0x720], dx
1:0BA4  890e2207          mov      word ptr [0x722], cx
1:0BA8  891e2407          mov      word ptr [0x724], bx
1:0BAC  2bc0              sub      ax, ax
1:0BAE  a32807            mov      word ptr [0x728], ax
1:0BB1  a32607            mov      word ptr [0x726], ax
1:0BB4  a32c07            mov      word ptr [0x72c], ax
1:0BB7  a32a07            mov      word ptr [0x72a], ax
1:0BBA  a33007            mov      word ptr [0x730], ax
1:0BBD  a32e07            mov      word ptr [0x72e], ax
1:0BC0  a33407            mov      word ptr [0x734], ax
1:0BC3  a33207            mov      word ptr [0x732], ax
1:0BC6  8b46fc            mov      ax, word ptr [bp - 4]
1:0BC9  a33607            mov      word ptr [0x736], ax
1:0BCC  89163807          mov      word ptr [0x738], dx
1:0BD0  a33a07            mov      word ptr [0x73a], ax
1:0BD3  89163c07          mov      word ptr [0x73c], dx
1:0BD7  ff7606            push     word ptr [bp + 6]
1:0BDA  b8e4ff            mov      ax, 0xffe4
1:0BDD  99                cdq      
1:0BDE  52                push     dx
1:0BDF  50                push     ax
1:0BE0  b80100            mov      ax, 1
1:0BE3  50                push     ax
1:0BE4  9a3f0d0000        lcall    0, 0xd3f  ; @1:KERNEL._llseek
1:0BE9  a12c07            mov      ax, word ptr [0x72c]
1:0BEC  0b062a07          or       ax, word ptr [0x72a]
1:0BF0  7539              jne      0xc2b
1:0BF2  ff362007          push     word ptr [0x720]
1:0BF6  ff361e07          push     word ptr [0x71e]
1:0BFA  ff361c07          push     word ptr [0x71c]
1:0BFE  ff361a07          push     word ptr [0x71a]
1:0C02  a12407            mov      ax, word ptr [0x724]
1:0C05  2bd2              sub      dx, dx
1:0C07  52                push     dx
1:0C08  50                push     ax
1:0C09  9a200c0000        lcall    0, 0xc20  ; @1:INT:ord_9(1:1A8E)
1:0C0E  051f00            add      ax, 0x1f
1:0C11  83d200            adc      dx, 0
1:0C14  24e7              and      al, 0xe7
1:0C16  b103              mov      cl, 3
1:0C18  9ac7080000        lcall    0, 0x8c7  ; @1:INT:ord_10(1:1AC0)
1:0C1D  52                push     dx
1:0C1E  50                push     ax
1:0C1F  9ab8080000        lcall    0, 0x8b8  ; @1:INT:ord_9(1:1A8E)
1:0C24  a32a07            mov      word ptr [0x72a], ax
1:0C27  89162c07          mov      word ptr [0x72c], dx
1:0C2B  a13807            mov      ax, word ptr [0x738]
1:0C2E  0b063607          or       ax, word ptr [0x736]
1:0C32  7514              jne      0xc48
1:0C34  b81607            mov      ax, 0x716
1:0C37  1e                push     ds
1:0C38  50                push     ax
1:0C39  0e                push     cs
1:0C3A  e86301            call     0xda0
1:0C3D  5b                pop      bx
1:0C3E  5b                pop      bx
1:0C3F  a33607            mov      word ptr [0x736], ax
1:0C42  c70638070000      mov      word ptr [0x738], 0
1:0C48  b84200            mov      ax, 0x42
1:0C4B  50                push     ax
1:0C4C  8b46fc            mov      ax, word ptr [bp - 4]
1:0C4F  d1e0              shl      ax, 1
1:0C51  d1e0              shl      ax, 1
1:0C53  2bd2              sub      dx, dx
1:0C55  03061607          add      ax, word ptr [0x716]
1:0C59  13161807          adc      dx, word ptr [0x718]
1:0C5D  52                push     dx
1:0C5E  50                push     ax
1:0C5F  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalAlloc
1:0C64  a3fa01            mov      word ptr [0x1fa], ax
1:0C67  0bc0              or       ax, ax
1:0C69  7503              jne      0xc6e
1:0C6B  e973fe            jmp      0xae1
1:0C6E  50                push     ax
1:0C6F  9a360e0000        lcall    0, 0xe36  ; @1:KERNEL.GlobalLock
1:0C74  a30407            mov      word ptr [0x704], ax
1:0C77  89160607          mov      word ptr [0x706], dx
1:0C7B  8bf8              mov      di, ax
1:0C7D  be1607            mov      si, 0x716
1:0C80  8ec2              mov      es, dx
1:0C82  b91400            mov      cx, 0x14
1:0C85  f3a5              rep movsw word ptr es:[di], word ptr [si]
1:0C87  03061607          add      ax, word ptr [0x716]
1:0C8B  a33e07            mov      word ptr [0x73e], ax
1:0C8E  89164007          mov      word ptr [0x740], dx
1:0C92  837efc00          cmp      word ptr [bp - 4], 0
1:0C96  7503              jne      0xc9b
1:0C98  e98400            jmp      0xd1f
1:0C9B  837eee0c          cmp      word ptr [bp - 0x12], 0xc
1:0C9F  7569              jne      0xd0a
1:0CA1  ff7606            push     word ptr [bp + 6]
1:0CA4  52                push     dx
1:0CA5  50                push     ax
1:0CA6  8b46fc            mov      ax, word ptr [bp - 4]
1:0CA9  8bc8              mov      cx, ax
1:0CAB  d1e0              shl      ax, 1
1:0CAD  03c1              add      ax, cx
1:0CAF  50                push     ax
1:0CB0  9a1b0d0000        lcall    0, 0xd1b  ; @1:KERNEL._lread
1:0CB5  8b46fc            mov      ax, word ptr [bp - 4]
1:0CB8  48                dec      ax
1:0CB9  8946f6            mov      word ptr [bp - 0xa], ax
1:0CBC  eb03              jmp      0xcc1
1:0CBE  ff4ef6            dec      word ptr [bp - 0xa]
1:0CC1  837ef600          cmp      word ptr [bp - 0xa], 0
1:0CC5  7c58              jl       0xd1f
1:0CC7  8b5ef6            mov      bx, word ptr [bp - 0xa]
1:0CCA  8bc3              mov      ax, bx
1:0CCC  d1e3              shl      bx, 1
1:0CCE  03d8              add      bx, ax
1:0CD0  031e3e07          add      bx, word ptr [0x73e]
1:0CD4  8e064007          mov      es, word ptr [0x740]
1:0CD8  268a4702          mov      al, byte ptr es:[bx + 2]
1:0CDC  8846e6            mov      byte ptr [bp - 0x1a], al
1:0CDF  268a07            mov      al, byte ptr es:[bx]
1:0CE2  8846e4            mov      byte ptr [bp - 0x1c], al
1:0CE5  268a4701          mov      al, byte ptr es:[bx + 1]
1:0CE9  8846e5            mov      byte ptr [bp - 0x1b], al
1:0CEC  c646e700          mov      byte ptr [bp - 0x19], 0
1:0CF0  8b46e4            mov      ax, word ptr [bp - 0x1c]
1:0CF3  8b56e6            mov      dx, word ptr [bp - 0x1a]
1:0CF6  8b5ef6            mov      bx, word ptr [bp - 0xa]
1:0CF9  d1e3              shl      bx, 1
1:0CFB  d1e3              shl      bx, 1
1:0CFD  8b363e07          mov      si, word ptr [0x73e]
1:0D01  268900            mov      word ptr es:[bx + si], ax
1:0D04  26895002          mov      word ptr es:[bx + si + 2], dx
1:0D08  ebb4              jmp      0xcbe
1:0D0A  ff7606            push     word ptr [bp + 6]
1:0D0D  ff364007          push     word ptr [0x740]
1:0D11  50                push     ax
1:0D12  8b46fc            mov      ax, word ptr [bp - 4]
1:0D15  d1e0              shl      ax, 1
1:0D17  d1e0              shl      ax, 1
1:0D19  50                push     ax
1:0D1A  9a070b0000        lcall    0, 0xb07  ; @1:KERNEL._lread
1:0D1F  a11407            mov      ax, word ptr [0x714]
1:0D22  0b061207          or       ax, word ptr [0x712]
1:0D26  741b              je       0xd43
1:0D28  ff7606            push     word ptr [bp + 6]
1:0D2B  8b46ea            mov      ax, word ptr [bp - 0x16]
1:0D2E  8b56ec            mov      dx, word ptr [bp - 0x14]
1:0D31  03061207          add      ax, word ptr [0x712]
1:0D35  13161407          adc      dx, word ptr [0x714]
1:0D39  52                push     dx
1:0D3A  50                push     ax
1:0D3B  2bc0              sub      ax, ax
1:0D3D  50                push     ax
1:0D3E  9af00a0000        lcall    0, 0xaf0  ; @1:KERNEL._llseek
1:0D43  ff36fa01          push     word ptr [0x1fa]
1:0D47  9a43080000        lcall    0, 0x843  ; @1:KERNEL.GlobalUnlock
1:0D4C  a1fa01            mov      ax, word ptr [0x1fa]
1:0D4F  5e                pop      si
1:0D50  5f                pop      di
1:0D51  4d                dec      bp
1:0D52  4d                dec      bp
1:0D53  8be5              mov      sp, bp
1:0D55  1f                pop      ds
1:0D56  5d                pop      bp
1:0D57  4d                dec      bp
1:0D58  cb                retf     
1:0D59  1e                push     ds
1:0D5A  58                pop      ax
1:0D5B  90                nop      
1:0D5C  45                inc      bp
1:0D5D  55                push     bp
1:0D5E  8bec              mov      bp, sp
1:0D60  1e                push     ds
1:0D61  8ed8              mov      ds, ax
1:0D63  83ec04            sub      sp, 4
1:0D66  8b4606            mov      ax, word ptr [bp + 6]
1:0D69  8b5608            mov      dx, word ptr [bp + 8]
1:0D6C  a34207            mov      word ptr [0x742], ax
1:0D6F  89164407          mov      word ptr [0x744], dx
1:0D73  52                push     dx
1:0D74  50                push     ax
1:0D75  0e                push     cs
1:0D76  e82700            call     0xda0
1:0D79  5b                pop      bx
1:0D7A  5b                pop      bx
1:0D7B  c41e4207          les      bx, ptr [0x742]
1:0D7F  26833f0c          cmp      word ptr es:[bx], 0xc
1:0D83  750f              jne      0xd94
1:0D85  26837f0200        cmp      word ptr es:[bx + 2], 0
1:0D8A  7508              jne      0xd94
1:0D8C  8bc8              mov      cx, ax
1:0D8E  d1e0              shl      ax, 1
1:0D90  03c1              add      ax, cx
1:0D92  eb04              jmp      0xd98
1:0D94  d1e0              shl      ax, 1
1:0D96  d1e0              shl      ax, 1
1:0D98  4d                dec      bp
1:0D99  4d                dec      bp
1:0D9A  8be5              mov      sp, bp
1:0D9C  1f                pop      ds
1:0D9D  5d                pop      bp
1:0D9E  4d                dec      bp
1:0D9F  cb                retf     
1:0DA0  1e                push     ds
1:0DA1  58                pop      ax
1:0DA2  90                nop      
1:0DA3  45                inc      bp
1:0DA4  55                push     bp
1:0DA5  8bec              mov      bp, sp
1:0DA7  1e                push     ds
1:0DA8  8ed8              mov      ds, ax
1:0DAA  83ec04            sub      sp, 4
1:0DAD  8b4606            mov      ax, word ptr [bp + 6]
1:0DB0  8b5608            mov      dx, word ptr [bp + 8]
1:0DB3  a34a07            mov      word ptr [0x74a], ax
1:0DB6  89164c07          mov      word ptr [0x74c], dx
1:0DBA  a34607            mov      word ptr [0x746], ax
1:0DBD  89164807          mov      word ptr [0x748], dx
1:0DC1  8ec2              mov      es, dx
1:0DC3  8bd8              mov      bx, ax
1:0DC5  26833f0c          cmp      word ptr es:[bx], 0xc
1:0DC9  7507              jne      0xdd2
1:0DCB  26837f0200        cmp      word ptr es:[bx + 2], 0
1:0DD0  7416              je       0xde8
1:0DD2  268b4f22          mov      cx, word ptr es:[bx + 0x22]
1:0DD6  260b4f20          or       cx, word ptr es:[bx + 0x20]
1:0DDA  7406              je       0xde2
1:0DDC  268b4720          mov      ax, word ptr es:[bx + 0x20]
1:0DE0  eb30              jmp      0xe12
1:0DE2  268b470e          mov      ax, word ptr es:[bx + 0xe]
1:0DE6  eb08              jmp      0xdf0
1:0DE8  c41e4607          les      bx, ptr [0x746]
1:0DEC  268b470a          mov      ax, word ptr es:[bx + 0xa]
1:0DF0  3d0800            cmp      ax, 8
1:0DF3  7416              je       0xe0b
1:0DF5  7719              ja       0xe10
1:0DF7  fec8              dec      al
1:0DF9  7406              je       0xe01
1:0DFB  2c03              sub      al, 3
1:0DFD  7407              je       0xe06
1:0DFF  eb0f              jmp      0xe10
1:0E01  b80200            mov      ax, 2
1:0E04  eb0c              jmp      0xe12
1:0E06  b81000            mov      ax, 0x10
1:0E09  eb07              jmp      0xe12
1:0E0B  b80001            mov      ax, 0x100
1:0E0E  eb02              jmp      0xe12
1:0E10  2bc0              sub      ax, ax
1:0E12  4d                dec      bp
1:0E13  4d                dec      bp
1:0E14  8be5              mov      sp, bp
1:0E16  1f                pop      ds
1:0E17  5d                pop      bp
1:0E18  4d                dec      bp
1:0E19  cb                retf     
1:0E1A  1e                push     ds
1:0E1B  58                pop      ax
1:0E1C  90                nop      
1:0E1D  45                inc      bp
1:0E1E  55                push     bp
1:0E1F  8bec              mov      bp, sp
1:0E21  1e                push     ds
1:0E22  8ed8              mov      ds, ax
1:0E24  83ec06            sub      sp, 6
1:0E27  837e0600          cmp      word ptr [bp + 6], 0
1:0E2B  7505              jne      0xe32
1:0E2D  2bc0              sub      ax, ax
1:0E2F  e9a400            jmp      0xed6
1:0E32  ff7606            push     word ptr [bp + 6]
1:0E35  9a14080000        lcall    0, 0x814  ; @1:KERNEL.GlobalLock
1:0E3A  a34e07            mov      word ptr [0x74e], ax
1:0E3D  89165007          mov      word ptr [0x750], dx
1:0E41  8bc2              mov      ax, dx
1:0E43  0b064e07          or       ax, word ptr [0x74e]
1:0E47  74e4              je       0xe2d
1:0E49  2bc0              sub      ax, ax
1:0E4B  50                push     ax
1:0E4C  9affff0000        lcall    0, 0xffff  ; @1:USER.GetDC
1:0E51  8946fa            mov      word ptr [bp - 6], ax
1:0E54  837e0800          cmp      word ptr [bp + 8], 0
1:0E58  7417              je       0xe71
1:0E5A  50                push     ax
1:0E5B  ff7608            push     word ptr [bp + 8]
1:0E5E  2bc0              sub      ax, ax
1:0E60  50                push     ax
1:0E61  9abc0e0000        lcall    0, 0xebc  ; @1:USER.SelectPalette
1:0E66  a35207            mov      word ptr [0x752], ax
1:0E69  ff76fa            push     word ptr [bp - 6]
1:0E6C  9a74020000        lcall    0, 0x274  ; @1:USER.RealizePalette
1:0E71  ff76fa            push     word ptr [bp - 6]
1:0E74  ff365007          push     word ptr [0x750]
1:0E78  ff364e07          push     word ptr [0x74e]
1:0E7C  b80400            mov      ax, 4
1:0E7F  99                cdq      
1:0E80  52                push     dx
1:0E81  50                push     ax
1:0E82  ff365007          push     word ptr [0x750]
1:0E86  ff364e07          push     word ptr [0x74e]
1:0E8A  0e                push     cs
1:0E8B  e8cbfe            call     0xd59
1:0E8E  5b                pop      bx
1:0E8F  5b                pop      bx
1:0E90  c41e4e07          les      bx, ptr [0x74e]
1:0E94  260307            add      ax, word ptr es:[bx]
1:0E97  03d8              add      bx, ax
1:0E99  06                push     es
1:0E9A  53                push     bx
1:0E9B  06                push     es
1:0E9C  ff364e07          push     word ptr [0x74e]
1:0EA0  2bc0              sub      ax, ax
1:0EA2  50                push     ax
1:0EA3  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateDIBitmap
1:0EA8  8946fc            mov      word ptr [bp - 4], ax
1:0EAB  837e0800          cmp      word ptr [bp + 8], 0
1:0EAF  740f              je       0xec0
1:0EB1  ff76fa            push     word ptr [bp - 6]
1:0EB4  ff365207          push     word ptr [0x752]
1:0EB8  2bc0              sub      ax, ax
1:0EBA  50                push     ax
1:0EBB  9a68020000        lcall    0, 0x268  ; @1:USER.SelectPalette
1:0EC0  2bc0              sub      ax, ax
1:0EC2  50                push     ax
1:0EC3  ff76fa            push     word ptr [bp - 6]
1:0EC6  9affff0000        lcall    0, 0xffff  ; @1:USER.ReleaseDC
1:0ECB  ff7606            push     word ptr [bp + 6]
1:0ECE  9a740f0000        lcall    0, 0xf74  ; @1:KERNEL.GlobalUnlock
1:0ED3  8b46fc            mov      ax, word ptr [bp - 4]
1:0ED6  4d                dec      bp
1:0ED7  4d                dec      bp
1:0ED8  8be5              mov      sp, bp
1:0EDA  1f                pop      ds
1:0EDB  5d                pop      bp
1:0EDC  4d                dec      bp
1:0EDD  cb                retf     
1:0EDE  1e                push     ds
1:0EDF  58                pop      ax
1:0EE0  90                nop      
1:0EE1  45                inc      bp
1:0EE2  55                push     bp
1:0EE3  8bec              mov      bp, sp
1:0EE5  1e                push     ds
1:0EE6  8ed8              mov      ds, ax
1:0EE8  83ec08            sub      sp, 8
1:0EEB  837e0e00          cmp      word ptr [bp + 0xe], 0
1:0EEF  751d              jne      0xf0e
1:0EF1  ff362209          push     word ptr [0x922]
1:0EF5  ff7606            push     word ptr [bp + 6]
1:0EF8  ff7608            push     word ptr [bp + 8]
1:0EFB  ff760a            push     word ptr [bp + 0xa]
1:0EFE  ff760c            push     word ptr [bp + 0xc]
1:0F01  ff7616            push     word ptr [bp + 0x16]
1:0F04  ff7614            push     word ptr [bp + 0x14]
1:0F07  9a0a120000        lcall    0, 0x120a  ; @1:GDI.PatBlt
1:0F0C  eb6d              jmp      0xf7b
1:0F0E  ff760e            push     word ptr [bp + 0xe]
1:0F11  9a700c0000        lcall    0, 0xc70  ; @1:KERNEL.GlobalLock
1:0F16  a35607            mov      word ptr [0x756], ax
1:0F19  89165807          mov      word ptr [0x758], dx
1:0F1D  8bc2              mov      ax, dx
1:0F1F  0b065607          or       ax, word ptr [0x756]
1:0F23  7504              jne      0xf29
1:0F25  2bc0              sub      ax, ax
1:0F27  eb52              jmp      0xf7b
1:0F29  52                push     dx
1:0F2A  ff365607          push     word ptr [0x756]
1:0F2E  0e                push     cs
1:0F2F  e827fe            call     0xd59
1:0F32  5b                pop      bx
1:0F33  5b                pop      bx
1:0F34  c41e5607          les      bx, ptr [0x756]
1:0F38  260307            add      ax, word ptr es:[bx]
1:0F3B  03d8              add      bx, ax
1:0F3D  891e5c07          mov      word ptr [0x75c], bx
1:0F41  8c065e07          mov      word ptr [0x75e], es
1:0F45  ff362209          push     word ptr [0x922]
1:0F49  ff7606            push     word ptr [bp + 6]
1:0F4C  ff7608            push     word ptr [bp + 8]
1:0F4F  ff760a            push     word ptr [bp + 0xa]
1:0F52  ff760c            push     word ptr [bp + 0xc]
1:0F55  ff7610            push     word ptr [bp + 0x10]
1:0F58  ff7612            push     word ptr [bp + 0x12]
1:0F5B  ff7610            push     word ptr [bp + 0x10]
1:0F5E  ff760c            push     word ptr [bp + 0xc]
1:0F61  06                push     es
1:0F62  53                push     bx
1:0F63  06                push     es
1:0F64  ff365607          push     word ptr [0x756]
1:0F68  2bc0              sub      ax, ax
1:0F6A  50                push     ax
1:0F6B  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetDIBitsToDevice
1:0F70  ff760e            push     word ptr [bp + 0xe]
1:0F73  9a480d0000        lcall    0, 0xd48  ; @1:KERNEL.GlobalUnlock
1:0F78  b80100            mov      ax, 1
1:0F7B  4d                dec      bp
1:0F7C  4d                dec      bp
1:0F7D  8be5              mov      sp, bp
1:0F7F  1f                pop      ds
1:0F80  5d                pop      bp
1:0F81  4d                dec      bp
1:0F82  cb                retf     
1:0F83  1e                push     ds
1:0F84  58                pop      ax
1:0F85  90                nop      
1:0F86  45                inc      bp
1:0F87  55                push     bp
1:0F88  8bec              mov      bp, sp
1:0F8A  1e                push     ds
1:0F8B  8ed8              mov      ds, ax
1:0F8D  83ec0a            sub      sp, 0xa
1:0F90  8b4606            mov      ax, word ptr [bp + 6]
1:0F93  8b5608            mov      dx, word ptr [bp + 8]
1:0F96  8946fa            mov      word ptr [bp - 6], ax
1:0F99  8956fc            mov      word ptr [bp - 4], dx
1:0F9C  8b460a            mov      ax, word ptr [bp + 0xa]
1:0F9F  8b560c            mov      dx, word ptr [bp + 0xc]
1:0FA2  8946f6            mov      word ptr [bp - 0xa], ax
1:0FA5  8956f8            mov      word ptr [bp - 8], dx
1:0FA8  837e0800          cmp      word ptr [bp + 8], 0
1:0FAC  7507              jne      0xfb5
1:0FAE  817e060080        cmp      word ptr [bp + 6], 0x8000
1:0FB3  7639              jbe      0xfee
1:0FB5  ff760e            push     word ptr [bp + 0xe]
1:0FB8  ff76f8            push     word ptr [bp - 8]
1:0FBB  ff76f6            push     word ptr [bp - 0xa]
1:0FBE  b80080            mov      ax, 0x8000
1:0FC1  50                push     ax
1:0FC2  9afb0f0000        lcall    0, 0xffb  ; @1:KERNEL._lread
1:0FC7  3d0080            cmp      ax, 0x8000
1:0FCA  7405              je       0xfd1
1:0FCC  2bc0              sub      ax, ax
1:0FCE  99                cdq      
1:0FCF  eb3b              jmp      0x100c
1:0FD1  816e060080        sub      word ptr [bp + 6], 0x8000
1:0FD6  835e0800          sbb      word ptr [bp + 8], 0
1:0FDA  2bc0              sub      ax, ax
1:0FDC  b90080            mov      cx, 0x8000
1:0FDF  014ef6            add      word ptr [bp - 0xa], cx
1:0FE2  13c0              adc      ax, ax
1:0FE4  b9ffff            mov      cx, 0xffff  ; @1:KERNEL.__AHSHIFT
1:0FE7  d3e0              shl      ax, cl
1:0FE9  0146f8            add      word ptr [bp - 8], ax
1:0FEC  ebba              jmp      0xfa8
1:0FEE  ff760e            push     word ptr [bp + 0xe]
1:0FF1  ff76f8            push     word ptr [bp - 8]
1:0FF4  ff76f6            push     word ptr [bp - 0xa]
1:0FF7  ff7606            push     word ptr [bp + 6]
1:0FFA  9a3c0b0000        lcall    0, 0xb3c  ; @1:KERNEL._lread
1:0FFF  8b4e06            mov      cx, word ptr [bp + 6]
1:1002  3bc1              cmp      ax, cx
1:1004  75c6              jne      0xfcc
1:1006  8b46fa            mov      ax, word ptr [bp - 6]
1:1009  8b56fc            mov      dx, word ptr [bp - 4]
1:100C  4d                dec      bp
1:100D  4d                dec      bp
1:100E  8be5              mov      sp, bp
1:1010  1f                pop      ds
1:1011  5d                pop      bp
1:1012  4d                dec      bp
1:1013  ca0a00            retf     0xa
1:1016  1e                push     ds
1:1017  58                pop      ax
1:1018  90                nop      
1:1019  45                inc      bp
1:101A  55                push     bp
1:101B  8bec              mov      bp, sp
1:101D  1e                push     ds
1:101E  8ed8              mov      ds, ax
1:1020  83ec04            sub      sp, 4
1:1023  833e220900        cmp      word ptr [0x922], 0
1:1028  7406              je       0x1030
1:102A  837e0600          cmp      word ptr [bp + 6], 0
1:102E  7504              jne      0x1034
1:1030  2bc0              sub      ax, ax
1:1032  eb60              jmp      0x1094
1:1034  ff362209          push     word ptr [0x922]
1:1038  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateCompatibleDC
1:103D  a35a09            mov      word ptr [0x95a], ax
1:1040  ff7606            push     word ptr [bp + 6]
1:1043  b80e00            mov      ax, 0xe
1:1046  50                push     ax
1:1047  b87c1a            mov      ax, 0x1a7c
1:104A  1e                push     ds
1:104B  50                push     ax
1:104C  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetObject
1:1051  ff365a09          push     word ptr [0x95a]
1:1055  ff7606            push     word ptr [bp + 6]
1:1058  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectObject
1:105D  a17e1a            mov      ax, word ptr [0x1a7e]
1:1060  c41e781a          les      bx, ptr [0x1a78]
1:1064  262b4702          sub      ax, word ptr es:[bx + 2]
1:1068  99                cdq      
1:1069  2bc2              sub      ax, dx
1:106B  d1f8              sar      ax, 1
1:106D  a36619            mov      word ptr [0x1966], ax
1:1070  a1801a            mov      ax, word ptr [0x1a80]
1:1073  262b4704          sub      ax, word ptr es:[bx + 4]
1:1077  99                cdq      
1:1078  2bc2              sub      ax, dx
1:107A  d1f8              sar      ax, 1
1:107C  a36819            mov      word ptr [0x1968], ax
1:107F  b80100            mov      ax, 1
1:1082  50                push     ax
1:1083  0e                push     cs
1:1084  e81500            call     0x109c
1:1087  5b                pop      bx
1:1088  ff365a09          push     word ptr [0x95a]
1:108C  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteDC
1:1091  b80100            mov      ax, 1
1:1094  4d                dec      bp
1:1095  4d                dec      bp
1:1096  8be5              mov      sp, bp
1:1098  1f                pop      ds
1:1099  5d                pop      bp
1:109A  4d                dec      bp
1:109B  cb                retf     
1:109C  1e                push     ds
1:109D  58                pop      ax
1:109E  90                nop      
1:109F  45                inc      bp
1:10A0  55                push     bp
1:10A1  8bec              mov      bp, sp
1:10A3  1e                push     ds
1:10A4  8ed8              mov      ds, ax
1:10A6  83ec16            sub      sp, 0x16
1:10A9  57                push     di
1:10AA  56                push     si
1:10AB  c746ec0000        mov      word ptr [bp - 0x14], 0
1:10B0  8b5eec            mov      bx, word ptr [bp - 0x14]
1:10B3  d1e3              shl      bx, 1
1:10B5  c787b6090000      mov      word ptr [bx + 0x9b6], 0
1:10BB  ff46ec            inc      word ptr [bp - 0x14]
1:10BE  817eecd007        cmp      word ptr [bp - 0x14], 0x7d0
1:10C3  7ceb              jl       0x10b0
1:10C5  833e200900        cmp      word ptr [0x920], 0
1:10CA  7503              jne      0x10cf
1:10CC  e94d01            jmp      0x121c
1:10CF  a12009            mov      ax, word ptr [0x920]
1:10D2  48                dec      ax
1:10D3  7460              je       0x1135
1:10D5  48                dec      ax
1:10D6  7441              je       0x1119
1:10D8  48                dec      ax
1:10D9  751a              jne      0x10f5
1:10DB  b82800            mov      ax, 0x28
1:10DE  8946f2            mov      word ptr [bp - 0xe], ax
1:10E1  8946f0            mov      word ptr [bp - 0x10], ax
1:10E4  c41e781a          les      bx, ptr [0x1a78]
1:10E8  26817f04e001      cmp      word ptr es:[bx + 4], 0x1e0
1:10EE  7d05              jge      0x10f5
1:10F0  c746f03200        mov      word ptr [bp - 0x10], 0x32
1:10F5  9a52110000        lcall    0, 0x1152  ; @1:INT:ord_11(1:1A12)
1:10FA  8bc8              mov      cx, ax
1:10FC  8b46f0            mov      ax, word ptr [bp - 0x10]
1:10FF  f76ef2            imul     word ptr [bp - 0xe]
1:1102  8bd0              mov      dx, ax
1:1104  8956f6            mov      word ptr [bp - 0xa], dx
1:1107  8bc1              mov      ax, cx
1:1109  8bca              mov      cx, dx
1:110B  99                cdq      
1:110C  f7f9              idiv     cx
1:110E  8956f8            mov      word ptr [bp - 8], dx
1:1111  c746ec0000        mov      word ptr [bp - 0x14], 0
1:1116  e9f800            jmp      0x1211
1:1119  b82000            mov      ax, 0x20
1:111C  8946f2            mov      word ptr [bp - 0xe], ax
1:111F  8946f0            mov      word ptr [bp - 0x10], ax
1:1122  c41e781a          les      bx, ptr [0x1a78]
1:1126  26817f04e001      cmp      word ptr es:[bx + 4], 0x1e0
1:112C  7dc7              jge      0x10f5
1:112E  c746f01900        mov      word ptr [bp - 0x10], 0x19
1:1133  ebc0              jmp      0x10f5
1:1135  b81000            mov      ax, 0x10
1:1138  8946f2            mov      word ptr [bp - 0xe], ax
1:113B  8946f0            mov      word ptr [bp - 0x10], ax
1:113E  c41e781a          les      bx, ptr [0x1a78]
1:1142  26817f04e001      cmp      word ptr es:[bx + 4], 0x1e0
1:1148  7dab              jge      0x10f5
1:114A  c746f00e00        mov      word ptr [bp - 0x10], 0xe
1:114F  eba4              jmp      0x10f5
1:1151  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:1A12)
1:1156  99                cdq      
1:1157  f77ef6            idiv     word ptr [bp - 0xa]
1:115A  8956f8            mov      word ptr [bp - 8], dx
1:115D  8b5ef8            mov      bx, word ptr [bp - 8]
1:1160  d1e3              shl      bx, 1
1:1162  83bfb60900        cmp      word ptr [bx + 0x9b6], 0
1:1167  75e8              jne      0x1151
1:1169  8b5ef8            mov      bx, word ptr [bp - 8]
1:116C  d1e3              shl      bx, 1
1:116E  c787b6090100      mov      word ptr [bx + 0x9b6], 1
1:1174  8b46f8            mov      ax, word ptr [bp - 8]
1:1177  99                cdq      
1:1178  f77ef2            idiv     word ptr [bp - 0xe]
1:117B  8bca              mov      cx, dx
1:117D  c41e781a          les      bx, ptr [0x1a78]
1:1181  268b4702          mov      ax, word ptr es:[bx + 2]
1:1185  99                cdq      
1:1186  f77ef2            idiv     word ptr [bp - 0xe]
1:1189  8bf0              mov      si, ax
1:118B  f7e9              imul     cx
1:118D  8bc8              mov      cx, ax
1:118F  8b46f8            mov      ax, word ptr [bp - 8]
1:1192  99                cdq      
1:1193  f77ef2            idiv     word ptr [bp - 0xe]
1:1196  8bf8              mov      di, ax
1:1198  268b4704          mov      ax, word ptr es:[bx + 4]
1:119C  99                cdq      
1:119D  f77ef0            idiv     word ptr [bp - 0x10]
1:11A0  8bd8              mov      bx, ax
1:11A2  f7ef              imul     di
1:11A4  8bd1              mov      dx, cx
1:11A6  030e6619          add      cx, word ptr [0x1966]
1:11AA  8bf8              mov      di, ax
1:11AC  03066819          add      ax, word ptr [0x1968]
1:11B0  837e0600          cmp      word ptr [bp + 6], 0
1:11B4  7431              je       0x11e7
1:11B6  0bc9              or       cx, cx
1:11B8  7c54              jl       0x120e
1:11BA  3b0e7e1a          cmp      cx, word ptr [0x1a7e]
1:11BE  7d4e              jge      0x120e
1:11C0  0bc0              or       ax, ax
1:11C2  7c4a              jl       0x120e
1:11C4  3b06801a          cmp      ax, word ptr [0x1a80]
1:11C8  7d44              jge      0x120e
1:11CA  ff362209          push     word ptr [0x922]
1:11CE  52                push     dx
1:11CF  57                push     di
1:11D0  56                push     si
1:11D1  53                push     bx
1:11D2  ff365a09          push     word ptr [0x95a]
1:11D6  51                push     cx
1:11D7  50                push     ax
1:11D8  b82000            mov      ax, 0x20
1:11DB  bacc00            mov      dx, 0xcc
1:11DE  52                push     dx
1:11DF  50                push     ax
1:11E0  9a4b120000        lcall    0, 0x124b  ; @1:GDI.BitBlt
1:11E5  eb27              jmp      0x120e
1:11E7  ff362209          push     word ptr [0x922]
1:11EB  52                push     dx
1:11EC  57                push     di
1:11ED  8b1e781a          mov      bx, word ptr [0x1a78]
1:11F1  268b4702          mov      ax, word ptr es:[bx + 2]
1:11F5  99                cdq      
1:11F6  f77ef2            idiv     word ptr [bp - 0xe]
1:11F9  50                push     ax
1:11FA  268b4704          mov      ax, word ptr es:[bx + 4]
1:11FE  99                cdq      
1:11FF  f77ef0            idiv     word ptr [bp - 0x10]
1:1202  50                push     ax
1:1203  b84200            mov      ax, 0x42
1:1206  99                cdq      
1:1207  52                push     dx
1:1208  50                push     ax
1:1209  9a6c120000        lcall    0, 0x126c  ; @1:GDI.PatBlt
1:120E  ff46ec            inc      word ptr [bp - 0x14]
1:1211  8b46f6            mov      ax, word ptr [bp - 0xa]
1:1214  3946ec            cmp      word ptr [bp - 0x14], ax
1:1217  7d03              jge      0x121c
1:1219  e941ff            jmp      0x115d
1:121C  837e0600          cmp      word ptr [bp + 6], 0
1:1220  742f              je       0x1251
1:1222  ff362209          push     word ptr [0x922]
1:1226  a16619            mov      ax, word ptr [0x1966]
1:1229  f7d8              neg      ax
1:122B  50                push     ax
1:122C  a16819            mov      ax, word ptr [0x1968]
1:122F  f7d8              neg      ax
1:1231  50                push     ax
1:1232  ff367e1a          push     word ptr [0x1a7e]
1:1236  ff36801a          push     word ptr [0x1a80]
1:123A  ff365a09          push     word ptr [0x95a]
1:123E  2bc0              sub      ax, ax
1:1240  50                push     ax
1:1241  50                push     ax
1:1242  b82000            mov      ax, 0x20
1:1245  bacc00            mov      dx, 0xcc
1:1248  52                push     dx
1:1249  50                push     ax
1:124A  9affff0000        lcall    0, 0xffff  ; @1:GDI.BitBlt
1:124F  eb1f              jmp      0x1270
1:1251  ff362209          push     word ptr [0x922]
1:1255  2bc0              sub      ax, ax
1:1257  50                push     ax
1:1258  50                push     ax
1:1259  c41e781a          les      bx, ptr [0x1a78]
1:125D  26ff7702          push     word ptr es:[bx + 2]
1:1261  26ff7704          push     word ptr es:[bx + 4]
1:1265  b84200            mov      ax, 0x42
1:1268  99                cdq      
1:1269  52                push     dx
1:126A  50                push     ax
1:126B  9affff0000        lcall    0, 0xffff  ; @1:GDI.PatBlt
1:1270  5e                pop      si
1:1271  5f                pop      di
1:1272  4d                dec      bp
1:1273  4d                dec      bp
1:1274  8be5              mov      sp, bp
1:1276  1f                pop      ds
1:1277  5d                pop      bp
1:1278  4d                dec      bp
1:1279  cb                retf     
1:127A  1e                push     ds
1:127B  58                pop      ax
1:127C  90                nop      
1:127D  45                inc      bp
1:127E  55                push     bp
1:127F  8bec              mov      bp, sp
1:1281  1e                push     ds
1:1282  8ed8              mov      ds, ax
1:1284  b82a09            mov      ax, 0x92a
1:1287  50                push     ax
1:1288  2bc0              sub      ax, ax
1:128A  50                push     ax
1:128B  b8c608            mov      ax, 0x8c6
1:128E  50                push     ax
1:128F  9af7120000        lcall    0, 0x12f7  ; @1:INT:ord_12(1:1A54)
1:1294  83c406            add      sp, 6
1:1297  a32409            mov      word ptr [0x924], ax
1:129A  0bc0              or       ax, ax
1:129C  7514              jne      0x12b2
1:129E  b84809            mov      ax, 0x948
1:12A1  50                push     ax
1:12A2  b85619            mov      ax, 0x1956
1:12A5  50                push     ax
1:12A6  9ae0120000        lcall    0, 0x12e0  ; @1:INT:ord_7(1:1922)
1:12AB  5b                pop      bx
1:12AC  5b                pop      bx
1:12AD  b80100            mov      ax, 1
1:12B0  eb02              jmp      0x12b4
1:12B2  2bc0              sub      ax, ax
1:12B4  4d                dec      bp
1:12B5  4d                dec      bp
1:12B6  8be5              mov      sp, bp
1:12B8  1f                pop      ds
1:12B9  5d                pop      bp
1:12BA  4d                dec      bp
1:12BB  cb                retf     
1:12BC  1e                push     ds
1:12BD  58                pop      ax
1:12BE  90                nop      
1:12BF  45                inc      bp
1:12C0  55                push     bp
1:12C1  8bec              mov      bp, sp
1:12C3  1e                push     ds
1:12C4  8ed8              mov      ds, ax
1:12C6  b82a09            mov      ax, 0x92a
1:12C9  50                push     ax
1:12CA  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_13(1:1A42)
1:12CF  5b                pop      bx
1:12D0  a32409            mov      word ptr [0x924], ax
1:12D3  0bc0              or       ax, ax
1:12D5  7514              jne      0x12eb
1:12D7  b84809            mov      ax, 0x948
1:12DA  50                push     ax
1:12DB  b85619            mov      ax, 0x1956
1:12DE  50                push     ax
1:12DF  9a01140000        lcall    0, 0x1401  ; @1:INT:ord_7(1:1922)
1:12E4  5b                pop      bx
1:12E5  5b                pop      bx
1:12E6  b80100            mov      ax, 1
1:12E9  eb1c              jmp      0x1307
1:12EB  b82a09            mov      ax, 0x92a
1:12EE  50                push     ax
1:12EF  2bc0              sub      ax, ax
1:12F1  50                push     ax
1:12F2  b8c608            mov      ax, 0x8c6
1:12F5  50                push     ax
1:12F6  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:1A54)
1:12FB  83c406            add      sp, 6
1:12FE  a32409            mov      word ptr [0x924], ax
1:1301  0bc0              or       ax, ax
1:1303  74d2              je       0x12d7
1:1305  2bc0              sub      ax, ax
1:1307  4d                dec      bp
1:1308  4d                dec      bp
1:1309  8be5              mov      sp, bp
1:130B  1f                pop      ds
1:130C  5d                pop      bp
1:130D  4d                dec      bp
1:130E  cb                retf     
1:130F  1e                push     ds
1:1310  58                pop      ax
1:1311  90                nop      
1:1312  45                inc      bp
1:1313  55                push     bp
1:1314  8bec              mov      bp, sp
1:1316  1e                push     ds
1:1317  8ed8              mov      ds, ax
1:1319  83ec04            sub      sp, 4
1:131C  b8ffff            mov      ax, 0xffff  ; @1:INT:FILEDLGPROC(1:1502)
1:131F  baffff            mov      dx, 0xffff  ; @1:INT:FILEDLGPROC(1:1502)
1:1322  52                push     dx
1:1323  50                push     ax
1:1324  ff365809          push     word ptr [0x958]
1:1328  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.MakeProcInstance
1:132D  a36a07            mov      word ptr [0x76a], ax
1:1330  89166c07          mov      word ptr [0x76c], dx
1:1334  ff365809          push     word ptr [0x958]
1:1338  b8fc01            mov      ax, 0x1fc
1:133B  1e                push     ds
1:133C  50                push     ax
1:133D  c41e2609          les      bx, ptr [0x926]
1:1341  26ff7726          push     word ptr es:[bx + 0x26]
1:1345  52                push     dx
1:1346  ff366a07          push     word ptr [0x76a]
1:134A  9affff0000        lcall    0, 0xffff  ; @1:USER.DialogBox
1:134F  8946fc            mov      word ptr [bp - 4], ax
1:1352  ff366c07          push     word ptr [0x76c]
1:1356  ff366a07          push     word ptr [0x76a]
1:135A  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.FreeProcInstance
1:135F  8b46fc            mov      ax, word ptr [bp - 4]
1:1362  4d                dec      bp
1:1363  4d                dec      bp
1:1364  8be5              mov      sp, bp
1:1366  1f                pop      ds
1:1367  5d                pop      bp
1:1368  4d                dec      bp
1:1369  cb                retf     
1:136A  1e                push     ds
1:136B  58                pop      ax
1:136C  90                nop      
1:136D  45                inc      bp
1:136E  55                push     bp
1:136F  8bec              mov      bp, sp
1:1371  1e                push     ds
1:1372  8ed8              mov      ds, ax
1:1374  83ec04            sub      sp, 4
1:1377  c746fc0000        mov      word ptr [bp - 4], 0
1:137C  eb08              jmp      0x1386
1:137E  b80100            mov      ax, 1
1:1381  eb2d              jmp      0x13b0
1:1383  ff46fc            inc      word ptr [bp - 4]
1:1386  b85c09            mov      ax, 0x95c
1:1389  50                push     ax
1:138A  9a56140000        lcall    0, 0x1456  ; @1:INT:ord_8(1:1954)
1:138F  5b                pop      bx
1:1390  3b46fc            cmp      ax, word ptr [bp - 4]
1:1393  7619              jbe      0x13ae
1:1395  8b5efc            mov      bx, word ptr [bp - 4]
1:1398  8a875c09          mov      al, byte ptr [bx + 0x95c]
1:139C  98                cwde     
1:139D  3d3f00            cmp      ax, 0x3f
1:13A0  74dc              je       0x137e
1:13A2  77df              ja       0x1383
1:13A4  0ac0              or       al, al
1:13A6  7406              je       0x13ae
1:13A8  2c2a              sub      al, 0x2a
1:13AA  74d2              je       0x137e
1:13AC  ebd5              jmp      0x1383
1:13AE  2bc0              sub      ax, ax
1:13B0  4d                dec      bp
1:13B1  4d                dec      bp
1:13B2  8be5              mov      sp, bp
1:13B4  1f                pop      ds
1:13B5  5d                pop      bp
1:13B6  4d                dec      bp
1:13B7  cb                retf     
1:13B8  1e                push     ds
1:13B9  58                pop      ax
1:13BA  90                nop      
1:13BB  45                inc      bp
1:13BC  55                push     bp
1:13BD  8bec              mov      bp, sp
1:13BF  1e                push     ds
1:13C0  8ed8              mov      ds, ax
1:13C2  b85c09            mov      ax, 0x95c
1:13C5  1e                push     ds
1:13C6  50                push     ax
1:13C7  2bc0              sub      ax, ax
1:13C9  50                push     ax
1:13CA  9affff0000        lcall    0, 0xffff  ; @1:KERNEL._lopen
1:13CF  a36e07            mov      word ptr [0x76e], ax
1:13D2  0bc0              or       ax, ax
1:13D4  7d04              jge      0x13da
1:13D6  2bc0              sub      ax, ax
1:13D8  eb09              jmp      0x13e3
1:13DA  50                push     ax
1:13DB  9a4b080000        lcall    0, 0x84b  ; @1:KERNEL._lclose
1:13E0  b80100            mov      ax, 1
1:13E3  4d                dec      bp
1:13E4  4d                dec      bp
1:13E5  8be5              mov      sp, bp
1:13E7  1f                pop      ds
1:13E8  5d                pop      bp
1:13E9  4d                dec      bp
1:13EA  cb                retf     
1:13EB  1e                push     ds
1:13EC  58                pop      ax
1:13ED  90                nop      
1:13EE  45                inc      bp
1:13EF  55                push     bp
1:13F0  8bec              mov      bp, sp
1:13F2  1e                push     ds
1:13F3  8ed8              mov      ds, ax
1:13F5  83ec04            sub      sp, 4
1:13F8  b88a1a            mov      ax, 0x1a8a
1:13FB  50                push     ax
1:13FC  b85c09            mov      ax, 0x95c
1:13FF  50                push     ax
1:1400  9a8f140000        lcall    0, 0x148f  ; @1:INT:ord_7(1:1922)
1:1405  5b                pop      bx
1:1406  5b                pop      bx
1:1407  0e                push     cs
1:1408  e85fff            call     0x136a
1:140B  0bc0              or       ax, ax
1:140D  746f              je       0x147e
1:140F  ff7606            push     word ptr [bp + 6]
1:1412  b85c09            mov      ax, 0x95c
1:1415  1e                push     ds
1:1416  50                push     ax
1:1417  b9cc00            mov      cx, 0xcc
1:141A  51                push     cx
1:141B  b9cb00            mov      cx, 0xcb
1:141E  51                push     cx
1:141F  b910c0            mov      cx, 0xc010
1:1422  51                push     cx
1:1423  9a74140000        lcall    0, 0x1474  ; @1:USER.DlgDirList
1:1428  c70670085c09      mov      word ptr [0x870], 0x95c
1:142E  c746fc0000        mov      word ptr [bp - 4], 0
1:1433  eb1c              jmp      0x1451
1:1435  8b5efc            mov      bx, word ptr [bp - 4]
1:1438  80bf5c095c        cmp      byte ptr [bx + 0x95c], 0x5c
1:143D  7407              je       0x1446
1:143F  80bf5c093a        cmp      byte ptr [bx + 0x95c], 0x3a
1:1444  7508              jne      0x144e
1:1446  8bc3              mov      ax, bx
1:1448  055c09            add      ax, 0x95c
1:144B  a37008            mov      word ptr [0x870], ax
1:144E  ff46fc            inc      word ptr [bp - 4]
1:1451  b85c09            mov      ax, 0x95c
1:1454  50                push     ax
1:1455  9aaf140000        lcall    0, 0x14af  ; @1:INT:ord_8(1:1954)
1:145A  5b                pop      bx
1:145B  3b46fc            cmp      ax, word ptr [bp - 4]
1:145E  77d5              ja       0x1435
1:1460  ff7606            push     word ptr [bp + 6]
1:1463  1e                push     ds
1:1464  ff367008          push     word ptr [0x870]
1:1468  b8ca00            mov      ax, 0xca
1:146B  50                push     ax
1:146C  b8cb00            mov      ax, 0xcb
1:146F  50                push     ax
1:1470  2bc0              sub      ax, ax
1:1472  50                push     ax
1:1473  9affff0000        lcall    0, 0xffff  ; @1:USER.DlgDirList
1:1478  ff367008          push     word ptr [0x870]
1:147C  eb71              jmp      0x14ef
1:147E  0e                push     cs
1:147F  e836ff            call     0x13b8
1:1482  0bc0              or       ax, ax
1:1484  7465              je       0x14eb
1:1486  b85c09            mov      ax, 0x95c
1:1489  50                push     ax
1:148A  b97007            mov      cx, 0x770
1:148D  51                push     cx
1:148E  9af4140000        lcall    0, 0x14f4  ; @1:INT:ord_7(1:1922)
1:1493  5b                pop      bx
1:1494  5b                pop      bx
1:1495  ff7606            push     word ptr [bp + 6]
1:1498  b8cb00            mov      ax, 0xcb
1:149B  50                push     ax
1:149C  b85c09            mov      ax, 0x95c
1:149F  1e                push     ds
1:14A0  50                push     ax
1:14A1  b94000            mov      cx, 0x40
1:14A4  51                push     cx
1:14A5  9add150000        lcall    0, 0x15dd  ; @1:USER.GetDlgItemText
1:14AA  b85c09            mov      ax, 0x95c
1:14AD  50                push     ax
1:14AE  9a1c050000        lcall    0, 0x51c  ; @1:INT:ord_8(1:1954)
1:14B3  5b                pop      bx
1:14B4  3d0300            cmp      ax, 3
1:14B7  760f              jbe      0x14c8
1:14B9  b80102            mov      ax, 0x201
1:14BC  50                push     ax
1:14BD  b85c09            mov      ax, 0x95c
1:14C0  50                push     ax
1:14C1  9ad1140000        lcall    0, 0x14d1  ; @1:INT:ord_6(1:18E2)
1:14C6  5b                pop      bx
1:14C7  5b                pop      bx
1:14C8  b87007            mov      ax, 0x770
1:14CB  50                push     ax
1:14CC  b85c09            mov      ax, 0x95c
1:14CF  50                push     ax
1:14D0  9a33050000        lcall    0, 0x533  ; @1:INT:ord_6(1:18E2)
1:14D5  5b                pop      bx
1:14D6  5b                pop      bx
1:14D7  ff7606            push     word ptr [bp + 6]
1:14DA  b80100            mov      ax, 1
1:14DD  50                push     ax
1:14DE  9ae9150000        lcall    0, 0x15e9  ; @1:USER.EndDialog
1:14E3  c706fc000000      mov      word ptr [0xfc], 0
1:14E9  eb0f              jmp      0x14fa
1:14EB  b80302            mov      ax, 0x203
1:14EE  50                push     ax
1:14EF  b88a1a            mov      ax, 0x1a8a
1:14F2  50                push     ax
1:14F3  9aac150000        lcall    0, 0x15ac  ; @1:INT:ord_7(1:1922)
1:14F8  5b                pop      bx
1:14F9  5b                pop      bx
1:14FA  4d                dec      bp
1:14FB  4d                dec      bp
1:14FC  8be5              mov      sp, bp
1:14FE  1f                pop      ds
1:14FF  5d                pop      bp
1:1500  4d                dec      bp
1:1501  cb                retf     

; ===== EXPORT:FILEDLGPROC(#3) =====
1:1502  1e                push     ds
1:1503  58                pop      ax
1:1504  90                nop      
1:1505  45                inc      bp
1:1506  55                push     bp
1:1507  8bec              mov      bp, sp
1:1509  1e                push     ds
1:150A  8ed8              mov      ds, ax
1:150C  83ec08            sub      sp, 8
1:150F  57                push     di
1:1510  56                push     si
1:1511  8b460c            mov      ax, word ptr [bp + 0xc]
1:1514  2d1001            sub      ax, 0x110
1:1517  7409              je       0x1522
1:1519  48                dec      ax
1:151A  7503              jne      0x151f
1:151C  e99600            jmp      0x15b5
1:151F  e9a500            jmp      0x15c7
1:1522  8b460e            mov      ax, word ptr [bp + 0xe]
1:1525  a3fc00            mov      word ptr [0xfc], ax
1:1528  50                push     ax
1:1529  b97208            mov      cx, 0x872
1:152C  1e                push     ds
1:152D  51                push     cx
1:152E  9affff0000        lcall    0, 0xffff  ; @1:USER.GetWindowRect
1:1533  a17608            mov      ax, word ptr [0x876]
1:1536  2b067208          sub      ax, word ptr [0x872]
1:153A  8b0e7808          mov      cx, word ptr [0x878]
1:153E  2b0e7408          sub      cx, word ptr [0x874]
1:1542  ff36fc00          push     word ptr [0xfc]
1:1546  8bd8              mov      bx, ax
1:1548  99                cdq      
1:1549  2bc2              sub      ax, dx
1:154B  d1f8              sar      ax, 1
1:154D  c4362609          les      si, ptr [0x926]
1:1551  8bd0              mov      dx, ax
1:1553  268b4406          mov      ax, word ptr es:[si + 6]
1:1557  8bfa              mov      di, dx
1:1559  99                cdq      
1:155A  2bc2              sub      ax, dx
1:155C  d1f8              sar      ax, 1
1:155E  2bc7              sub      ax, di
1:1560  50                push     ax
1:1561  268b4408          mov      ax, word ptr es:[si + 8]
1:1565  99                cdq      
1:1566  2bc2              sub      ax, dx
1:1568  d1f8              sar      ax, 1
1:156A  2bc7              sub      ax, di
1:156C  50                push     ax
1:156D  53                push     bx
1:156E  51                push     cx
1:156F  b80100            mov      ax, 1
1:1572  50                push     ax
1:1573  9affff0000        lcall    0, 0xffff  ; @1:USER.MoveWindow
1:1578  ff760e            push     word ptr [bp + 0xe]
1:157B  b8ca00            mov      ax, 0xca
1:157E  50                push     ax
1:157F  9a95150000        lcall    0, 0x1595  ; @1:USER.GetDlgItem
1:1584  50                push     ax
1:1585  2bc0              sub      ax, ax
1:1587  50                push     ax
1:1588  9a9f150000        lcall    0, 0x159f  ; @1:USER.EnableWindow
1:158D  ff760e            push     word ptr [bp + 0xe]
1:1590  b80100            mov      ax, 1
1:1593  50                push     ax
1:1594  9affff0000        lcall    0, 0xffff  ; @1:USER.GetDlgItem
1:1599  50                push     ax
1:159A  b80100            mov      ax, 1
1:159D  50                push     ax
1:159E  9affff0000        lcall    0, 0xffff  ; @1:USER.EnableWindow
1:15A3  b80902            mov      ax, 0x209
1:15A6  50                push     ax
1:15A7  b88a1a            mov      ax, 0x1a8a
1:15AA  50                push     ax
1:15AB  9a20160000        lcall    0, 0x1620  ; @1:INT:ord_7(1:1922)
1:15B0  5b                pop      bx
1:15B1  5b                pop      bx
1:15B2  e91501            jmp      0x16ca
1:15B5  8b460a            mov      ax, word ptr [bp + 0xa]
1:15B8  3dcc00            cmp      ax, 0xcc
1:15BB  7440              je       0x15fd
1:15BD  7708              ja       0x15c7
1:15BF  fec8              dec      al
1:15C1  7409              je       0x15cc
1:15C3  fec8              dec      al
1:15C5  742f              je       0x15f6
1:15C7  2bc0              sub      ax, ax
1:15C9  e90901            jmp      0x16d5
1:15CC  ff760e            push     word ptr [bp + 0xe]
1:15CF  b8cb00            mov      ax, 0xcb
1:15D2  50                push     ax
1:15D3  b8c419            mov      ax, 0x19c4
1:15D6  1e                push     ds
1:15D7  50                push     ax
1:15D8  b84000            mov      ax, 0x40
1:15DB  50                push     ax
1:15DC  9affff0000        lcall    0, 0xffff  ; @1:USER.GetDlgItemText
1:15E1  ff760e            push     word ptr [bp + 0xe]
1:15E4  b80100            mov      ax, 1
1:15E7  50                push     ax
1:15E8  9a81050000        lcall    0, 0x581  ; @1:USER.EndDialog
1:15ED  c706fc000000      mov      word ptr [0xfc], 0
1:15F3  e9dc00            jmp      0x16d2
1:15F6  ff760e            push     word ptr [bp + 0xe]
1:15F9  2bc0              sub      ax, ax
1:15FB  ebea              jmp      0x15e7
1:15FD  8b4608            mov      ax, word ptr [bp + 8]
1:1600  48                dec      ax
1:1601  7403              je       0x1606
1:1603  e9be00            jmp      0x16c4
1:1606  ff760e            push     word ptr [bp + 0xe]
1:1609  b86a19            mov      ax, 0x196a
1:160C  1e                push     ds
1:160D  50                push     ax
1:160E  b8cc00            mov      ax, 0xcc
1:1611  50                push     ax
1:1612  9affff0000        lcall    0, 0xffff  ; @1:USER.DlgDirSelect
1:1617  b81e1a            mov      ax, 0x1a1e
1:161A  50                push     ax
1:161B  b98a1a            mov      cx, 0x1a8a
1:161E  51                push     cx
1:161F  9a42050000        lcall    0, 0x542  ; @1:INT:ord_7(1:1922)
1:1624  5b                pop      bx
1:1625  5b                pop      bx
1:1626  b85c00            mov      ax, 0x5c
1:1629  50                push     ax
1:162A  b81e1a            mov      ax, 0x1a1e
1:162D  50                push     ax
1:162E  9a45160000        lcall    0, 0x1645  ; @1:INT:ord_14(1:19D2)
1:1633  5b                pop      bx
1:1634  5b                pop      bx
1:1635  a37a08            mov      word ptr [0x87a], ax
1:1638  0bc0              or       ax, ax
1:163A  7512              jne      0x164e
1:163C  b83a00            mov      ax, 0x3a
1:163F  50                push     ax
1:1640  b81e1a            mov      ax, 0x1a1e
1:1643  50                push     ax
1:1644  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_14(1:19D2)
1:1649  5b                pop      bx
1:164A  5b                pop      bx
1:164B  a37a08            mov      word ptr [0x87a], ax
1:164E  b86a19            mov      ax, 0x196a
1:1651  50                push     ax
1:1652  b8c419            mov      ax, 0x19c4
1:1655  50                push     ax
1:1656  9a90160000        lcall    0, 0x1690  ; @1:INT:ord_7(1:1922)
1:165B  5b                pop      bx
1:165C  5b                pop      bx
1:165D  833e7a0800        cmp      word ptr [0x87a], 0
1:1662  7505              jne      0x1669
1:1664  b81e1a            mov      ax, 0x1a1e
1:1667  eb04              jmp      0x166d
1:1669  a17a08            mov      ax, word ptr [0x87a]
1:166C  40                inc      ax
1:166D  50                push     ax
1:166E  b8c419            mov      ax, 0x19c4
1:1671  50                push     ax
1:1672  9aae160000        lcall    0, 0x16ae  ; @1:INT:ord_6(1:18E2)
1:1677  5b                pop      bx
1:1678  5b                pop      bx
1:1679  b81e1a            mov      ax, 0x1a1e
1:167C  50                push     ax
1:167D  9a8b130000        lcall    0, 0x138b  ; @1:INT:ord_8(1:1954)
1:1682  5b                pop      bx
1:1683  0bc0              or       ax, ax
1:1685  752d              jne      0x16b4
1:1687  b80f02            mov      ax, 0x20f
1:168A  50                push     ax
1:168B  b88a1a            mov      ax, 0x1a8a
1:168E  50                push     ax
1:168F  9a9f160000        lcall    0, 0x169f  ; @1:INT:ord_7(1:1922)
1:1694  5b                pop      bx
1:1695  5b                pop      bx
1:1696  b88a1a            mov      ax, 0x1a8a
1:1699  50                push     ax
1:169A  b81e1a            mov      ax, 0x1a1e
1:169D  50                push     ax
1:169E  9abd160000        lcall    0, 0x16bd  ; @1:INT:ord_7(1:1922)
1:16A3  5b                pop      bx
1:16A4  5b                pop      bx
1:16A5  b81e1a            mov      ax, 0x1a1e
1:16A8  50                push     ax
1:16A9  b8c419            mov      ax, 0x19c4
1:16AC  50                push     ax
1:16AD  9ac2140000        lcall    0, 0x14c2  ; @1:INT:ord_6(1:18E2)
1:16B2  5b                pop      bx
1:16B3  5b                pop      bx
1:16B4  b8c419            mov      ax, 0x19c4
1:16B7  50                push     ax
1:16B8  b88a1a            mov      ax, 0x1a8a
1:16BB  50                push     ax
1:16BC  9aa7120000        lcall    0, 0x12a7  ; @1:INT:ord_7(1:1922)
1:16C1  5b                pop      bx
1:16C2  eb0d              jmp      0x16d1
1:16C4  837e0802          cmp      word ptr [bp + 8], 2
1:16C8  7508              jne      0x16d2
1:16CA  ff760e            push     word ptr [bp + 0xe]
1:16CD  0e                push     cs
1:16CE  e81afd            call     0x13eb
1:16D1  5b                pop      bx
1:16D2  b80100            mov      ax, 1
1:16D5  5e                pop      si
1:16D6  5f                pop      di
1:16D7  4d                dec      bp
1:16D8  4d                dec      bp
1:16D9  8be5              mov      sp, bp
1:16DB  1f                pop      ds
1:16DC  5d                pop      bp
1:16DD  4d                dec      bp
1:16DE  ca0a00            retf     0xa
1:16E1  001e5890          add      byte ptr [0x9058], bl
1:16E5  45                inc      bp
1:16E6  55                push     bp
1:16E7  8bec              mov      bp, sp
1:16E9  1e                push     ds
1:16EA  8ed8              mov      ds, ax
1:16EC  837e0a00          cmp      word ptr [bp + 0xa], 0
1:16F0  7504              jne      0x16f6
1:16F2  2bc0              sub      ax, ax
1:16F4  eb09              jmp      0x16ff
1:16F6  8b460e            mov      ax, word ptr [bp + 0xe]
1:16F9  a35809            mov      word ptr [0x958], ax
1:16FC  b80100            mov      ax, 1
1:16FF  4d                dec      bp
1:1700  4d                dec      bp
1:1701  8be5              mov      sp, bp
1:1703  1f                pop      ds
1:1704  5d                pop      bp
1:1705  4d                dec      bp
1:1706  ca0a00            retf     0xa

; ===== EXPORT:WEP(#2) =====
1:1709  1e                push     ds
1:170A  58                pop      ax
1:170B  90                nop      
1:170C  45                inc      bp
1:170D  55                push     bp
1:170E  8bec              mov      bp, sp
1:1710  1e                push     ds
1:1711  8ed8              mov      ds, ax
1:1713  b80100            mov      ax, 1
1:1716  4d                dec      bp
1:1717  4d                dec      bp
1:1718  8be5              mov      sp, bp
1:171A  1f                pop      ds
1:171B  5d                pop      bp
1:171C  4d                dec      bp
1:171D  ca0200            retf     2

; ===== EXPORT:MODULE(#1) =====
1:1720  1e                push     ds
1:1721  58                pop      ax
1:1722  90                nop      
1:1723  45                inc      bp
1:1724  55                push     bp
1:1725  8bec              mov      bp, sp
1:1727  1e                push     ds
1:1728  8ed8              mov      ds, ax
1:172A  83ec0a            sub      sp, 0xa
1:172D  56                push     si
1:172E  8b4608            mov      ax, word ptr [bp + 8]
1:1731  a32209            mov      word ptr [0x922], ax
1:1734  8b4606            mov      ax, word ptr [bp + 6]
1:1737  a3c008            mov      word ptr [0x8c0], ax
1:173A  50                push     ax
1:173B  9a5b170000        lcall    0, 0x175b  ; @1:KERNEL.GlobalLock
1:1740  a32609            mov      word ptr [0x926], ax
1:1743  89162809          mov      word ptr [0x928], dx
1:1747  8bc2              mov      ax, dx
1:1749  0b062609          or       ax, word ptr [0x926]
1:174D  7503              jne      0x1752
1:174F  e96a01            jmp      0x18bc
1:1752  c41e2609          les      bx, ptr [0x926]
1:1756  26ff7720          push     word ptr es:[bx + 0x20]
1:175A  9a120f0000        lcall    0, 0xf12  ; @1:KERNEL.GlobalLock
1:175F  a3781a            mov      word ptr [0x1a78], ax
1:1762  89167a1a          mov      word ptr [0x1a7a], dx
1:1766  8bc2              mov      ax, dx
1:1768  0b06781a          or       ax, word ptr [0x1a78]
1:176C  7503              jne      0x1771
1:176E  e94201            jmp      0x18b3
1:1771  8b460a            mov      ax, word ptr [bp + 0xa]
1:1774  e90801            jmp      0x187f
1:1777  c41e2609          les      bx, ptr [0x926]
1:177B  26837f1465        cmp      word ptr es:[bx + 0x14], 0x65
1:1780  7c0f              jl       0x1791
1:1782  26817f36f400      cmp      word ptr es:[bx + 0x36], 0xf4
1:1788  7507              jne      0x1791
1:178A  26837f3878        cmp      word ptr es:[bx + 0x38], 0x78
1:178F  740e              je       0x179f
1:1791  c70616020000      mov      word ptr [0x216], 0
1:1797  c746fc0500        mov      word ptr [bp - 4], 5
1:179C  e90701            jmp      0x18a6
1:179F  c70616020100      mov      word ptr [0x216], 1
1:17A5  e9fe00            jmp      0x18a6
1:17A8  b88008            mov      ax, 0x880
1:17AB  50                push     ax
1:17AC  9a69010000        lcall    0, 0x169  ; @1:INT:ord_5(1:1970)
1:17B1  5b                pop      bx
1:17B2  ff368008          push     word ptr [0x880]
1:17B6  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_22(1:19FE)
1:17BB  5b                pop      bx
1:17BC  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_21(1:0000)
1:17C1  eb13              jmp      0x17d6
1:17C3  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_20(1:01D0)
1:17C8  eb0c              jmp      0x17d6
1:17CA  833e160200        cmp      word ptr [0x216], 0
1:17CF  740b              je       0x17dc
1:17D1  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_19(1:0216)
1:17D6  8946fc            mov      word ptr [bp - 4], ax
1:17D9  e9ca00            jmp      0x18a6
1:17DC  ff362209          push     word ptr [0x922]
1:17E0  b800ff            mov      ax, 0xff00
1:17E3  baff00            mov      dx, 0xff
1:17E6  52                push     dx
1:17E7  50                push     ax
1:17E8  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextColor
1:17ED  ff362209          push     word ptr [0x922]
1:17F1  2bc0              sub      ax, ax
1:17F3  50                push     ax
1:17F4  50                push     ax
1:17F5  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkColor
1:17FA  ff362209          push     word ptr [0x922]
1:17FE  2bc0              sub      ax, ax
1:1800  50                push     ax
1:1801  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextAlign
1:1806  ff362209          push     word ptr [0x922]
1:180A  b80100            mov      ax, 1
1:180D  50                push     ax
1:180E  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkMode
1:1813  ff362209          push     word ptr [0x922]
1:1817  2bc0              sub      ax, ax
1:1819  50                push     ax
1:181A  50                push     ax
1:181B  b81802            mov      ax, 0x218
1:181E  1e                push     ds
1:181F  50                push     ax
1:1820  50                push     ax
1:1821  9a7e160000        lcall    0, 0x167e  ; @1:INT:ord_8(1:1954)
1:1826  5b                pop      bx
1:1827  50                push     ax
1:1828  9affff0000        lcall    0, 0xffff  ; @1:GDI.TextOut
1:182D  eb77              jmp      0x18a6
1:182F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_18(1:0353)
1:1834  eba0              jmp      0x17d6
1:1836  a15809            mov      ax, word ptr [0x958]
1:1839  c41e781a          les      bx, ptr [0x1a78]
1:183D  26894716          mov      word ptr es:[bx + 0x16], ax
1:1841  c746f60000        mov      word ptr [bp - 0xa], 0
1:1846  8b46f6            mov      ax, word ptr [bp - 0xa]
1:1849  8bf0              mov      si, ax
1:184B  d1e6              shl      si, 1
1:184D  40                inc      ax
1:184E  c41e781a          les      bx, ptr [0x1a78]
1:1852  2689400e          mov      word ptr es:[bx + si + 0xe], ax
1:1856  ff46f6            inc      word ptr [bp - 0xa]
1:1859  837ef604          cmp      word ptr [bp - 0xa], 4
1:185D  7ce7              jl       0x1846
1:185F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_17(1:036B)
1:1864  e96fff            jmp      0x17d6
1:1867  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_16(1:037F)
1:186C  e967ff            jmp      0x17d6
1:186F  8b460a            mov      ax, word ptr [bp + 0xa]
1:1872  2d0700            sub      ax, 7
1:1875  50                push     ax
1:1876  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_15(1:0393)
1:187B  5b                pop      bx
1:187C  e957ff            jmp      0x17d6
1:187F  3d0c00            cmp      ax, 0xc
1:1882  7722              ja       0x18a6
1:1884  d1e0              shl      ax, 1
1:1886  93                xchg     bx, ax
1:1887  2effa78c18        jmp      word ptr cs:[bx + 0x188c]
1:188C  a817              test     al, 0x17
1:188E  c3                ret      
1:188F  17                pop      ss
1:1890  ca172f            retf     0x2f17
1:1893  18a61836          sbb      byte ptr [bp + 0x3618], ah
1:1897  186718            sbb      byte ptr [bx + 0x18], ah
1:189A  6f                outsw    dx, word ptr [si]
1:189B  186f18            sbb      byte ptr [bx + 0x18], ch
1:189E  6f                outsw    dx, word ptr [si]
1:189F  186f18            sbb      byte ptr [bx + 0x18], ch
1:18A2  a6                cmpsb    byte ptr [si], byte ptr es:[di]
1:18A3  187717            sbb      byte ptr [bx + 0x17], dh
1:18A6  c41e2609          les      bx, ptr [0x926]
1:18AA  26ff7720          push     word ptr es:[bx + 0x20]
1:18AE  9ab8180000        lcall    0, 0x18b8  ; @1:KERNEL.GlobalUnlock
1:18B3  ff36c008          push     word ptr [0x8c0]
1:18B7  9acf0e0000        lcall    0, 0xecf  ; @1:KERNEL.GlobalUnlock
1:18BC  8b46fc            mov      ax, word ptr [bp - 4]
1:18BF  5e                pop      si
1:18C0  4d                dec      bp
1:18C1  4d                dec      bp
1:18C2  8be5              mov      sp, bp
1:18C4  1f                pop      ds
1:18C5  5d                pop      bp
1:18C6  4d                dec      bp
1:18C7  ca0600            retf     6
1:18CA  0000              add      byte ptr [bx + si], al
1:18CC  0000              add      byte ptr [bx + si], al
1:18CE  0000              add      byte ptr [bx + si], al
1:18D0  0000              add      byte ptr [bx + si], al
1:18D2  0000              add      byte ptr [bx + si], al
1:18D4  0000              add      byte ptr [bx + si], al
1:18D6  0000              add      byte ptr [bx + si], al
1:18D8  0000              add      byte ptr [bx + si], al
1:18DA  0000              add      byte ptr [bx + si], al
1:18DC  0000              add      byte ptr [bx + si], al
1:18DE  0000              add      byte ptr [bx + si], al
1:18E0  c3                ret      
1:18E1  00558b            add      byte ptr [di - 0x75], dl
1:18E4  ec                in       al, dx
1:18E5  8bd7              mov      dx, di
1:18E7  8bde              mov      bx, si
1:18E9  8cd8              mov      ax, ds
1:18EB  8ec0              mov      es, ax
1:18ED  8b7e06            mov      di, word ptr [bp + 6]
1:18F0  33c0              xor      ax, ax
1:18F2  b9ffff            mov      cx, 0xffff
1:18F5  f2ae              repne scasb al, byte ptr es:[di]
1:18F7  8d75ff            lea      si, [di - 1]
1:18FA  8b7e08            mov      di, word ptr [bp + 8]
1:18FD  b9ffff            mov      cx, 0xffff
1:1900  f2ae              repne scasb al, byte ptr es:[di]
1:1902  f7d1              not      cx
1:1904  2bf9              sub      di, cx
1:1906  87fe              xchg     si, di
1:1908  8b4606            mov      ax, word ptr [bp + 6]
1:190B  f7c60100          test     si, 1
1:190F  7402              je       0x1913
1:1911  a4                movsb    byte ptr es:[di], byte ptr [si]
1:1912  49                dec      cx
1:1913  d1e9              shr      cx, 1
1:1915  f3a5              rep movsw word ptr es:[di], word ptr [si]
1:1917  13c9              adc      cx, cx
1:1919  f3a4              rep movsb byte ptr es:[di], byte ptr [si]
1:191B  8bf3              mov      si, bx
1:191D  8bfa              mov      di, dx
1:191F  5d                pop      bp
1:1920  cb                retf     
1:1921  00558b            add      byte ptr [di - 0x75], dl
1:1924  ec                in       al, dx
1:1925  8bd7              mov      dx, di
1:1927  8bde              mov      bx, si
1:1929  8b7608            mov      si, word ptr [bp + 8]
1:192C  8bfe              mov      di, si
1:192E  8cd8              mov      ax, ds
1:1930  8ec0              mov      es, ax
1:1932  33c0              xor      ax, ax
1:1934  b9ffff            mov      cx, 0xffff
1:1937  f2ae              repne scasb al, byte ptr es:[di]
1:1939  f7d1              not      cx
1:193B  8b7e06            mov      di, word ptr [bp + 6]
1:193E  8bc7              mov      ax, di
1:1940  a801              test     al, 1
1:1942  7402              je       0x1946
1:1944  a4                movsb    byte ptr es:[di], byte ptr [si]
1:1945  49                dec      cx
1:1946  d1e9              shr      cx, 1
1:1948  f3a5              rep movsw word ptr es:[di], word ptr [si]
1:194A  13c9              adc      cx, cx
1:194C  f3a4              rep movsb byte ptr es:[di], byte ptr [si]
1:194E  8bf3              mov      si, bx
1:1950  8bfa              mov      di, dx
1:1952  5d                pop      bp
1:1953  cb                retf     

; ===== EXPORT:ord_8(#8) =====
1:1954  55                push     bp
1:1955  8bec              mov      bp, sp
1:1957  8bd7              mov      dx, di
1:1959  8cd8              mov      ax, ds
1:195B  8ec0              mov      es, ax
1:195D  8b7e06            mov      di, word ptr [bp + 6]
1:1960  33c0              xor      ax, ax
1:1962  b9ffff            mov      cx, 0xffff
1:1965  f2ae              repne scasb al, byte ptr es:[di]
1:1967  f7d1              not      cx
1:1969  49                dec      cx
1:196A  91                xchg     cx, ax
1:196B  8bfa              mov      di, dx
1:196D  5d                pop      bp
1:196E  cb                retf     
1:196F  008cd890          add      byte ptr [si - 0x6f28], cl
1:1973  45                inc      bp
1:1974  55                push     bp
1:1975  8bec              mov      bp, sp
1:1977  1e                push     ds
1:1978  8ed8              mov      ds, ax
1:197A  56                push     si
1:197B  b42a              mov      ah, 0x2a
1:197D  cd21              int      0x21