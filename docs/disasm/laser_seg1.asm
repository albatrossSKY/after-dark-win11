File: raw\unpacked\MODULES\LASER.AD
Module: 'LASER' ('Graphics Module Library')
CS:IP=1:1588  SS:SP=0:0000  AutoDS=2  Heap=1024  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (3): KERNEL, GDI, USER
Segments (2):
  SEG  1: CODE off=0x00600 len=0x15BA min=0x15BA flags=0x0D50 relocs=94
  SEG  2: DATA off=0x01D60 len=0x04B8 min=0x04B8 flags=0x0C71 relocs=0
Exports (29):
  ord   1: SEG1:0B8A flags=0x03 MODULE
  ord   2: SEG1:0B6C flags=0x03 WEP
  ord   3: SEG1:1248 flags=0x03 ___EXPORTEDSTUB
  ord   4: SEG1:0D72 flags=0x00 
  ord   5: SEG1:0E38 flags=0x00 
  ord   6: SEG1:0361 flags=0x00 
  ord   7: SEG1:0346 flags=0x00 
  ord   8: SEG1:032B flags=0x00 
  ord   9: SEG1:02B9 flags=0x00 
  ord  10: SEG1:0DA6 flags=0x00 
  ord  11: SEG1:0270 flags=0x00 
  ord  12: SEG1:021B flags=0x00 
  ord  13: SEG1:0019 flags=0x00 
  ord  14: SEG1:0E24 flags=0x00 
  ord  15: SEG1:0DC2 flags=0x00 
  ord  16: SEG1:0B3E flags=0x00 
  ord  17: SEG1:0E90 flags=0x00 
  ord  18: SEG1:0F94 flags=0x00 
  ord  19: SEG1:1238 flags=0x00 
  ord  20: SEG1:1106 flags=0x00 
  ord  21: SEG1:0FC6 flags=0x00 
  ord  22: SEG1:125C flags=0x00 
  ord  23: SEG1:1284 flags=0x00 
  ord  24: SEG1:1326 flags=0x00 
  ord  25: SEG1:12EA flags=0x00 
  ord  26: SEG1:1350 flags=0x00 
  ord  27: SEG1:1288 flags=0x00 
  ord  28: SEG1:0FE0 flags=0x00 
  ord  29: SEG1:14F4 flags=0x00 
Resources (7):
  TYPE_1000        #1               off=0x02260 len=   240
  TYPE_1000        #2               off=0x02350 len=   352
  TYPE_1000        #3               off=0x024B0 len=   144
  TYPE_1000        #4               off=0x02540 len=    96
  TYPE_2000        #10              off=0x025A0 len=    96
  TYPE_2000        #20              off=0x02600 len=    16
  TYPE_2000        #30              off=0x02610 len=   624

1:0000  1e                push     ds
1:0001  58                pop      ax
1:0002  90                nop      
1:0003  45                inc      bp
1:0004  55                push     bp
1:0005  8bec              mov      bp, sp
1:0007  1e                push     ds
1:0008  8ed8              mov      ds, ax
1:000A  33c0              xor      ax, ax
1:000C  9a26000000        lcall    0, 0x26  ; @1:INT:ord_4(1:0D72)
1:0011  4d                dec      bp
1:0012  4d                dec      bp
1:0013  8be5              mov      sp, bp
1:0015  1f                pop      ds
1:0016  5d                pop      bp
1:0017  4d                dec      bp
1:0018  cb                retf     

; ===== EXPORT:ord_13(#13) =====
1:0019  1e                push     ds
1:001A  58                pop      ax
1:001B  90                nop      
1:001C  45                inc      bp
1:001D  55                push     bp
1:001E  8bec              mov      bp, sp
1:0020  1e                push     ds
1:0021  8ed8              mov      ds, ax
1:0023  33c0              xor      ax, ax
1:0025  9a28020000        lcall    0, 0x228  ; @1:INT:ord_4(1:0D72)
1:002A  2bc0              sub      ax, ax
1:002C  a3f803            mov      word ptr [0x3f8], ax
1:002F  a3f603            mov      word ptr [0x3f6], ax
1:0032  c41eb204          les      bx, ptr [0x4b2]
1:0036  268b4706          mov      ax, word ptr es:[bx + 6]
1:003A  40                inc      ax
1:003B  a31000            mov      word ptr [0x10], ax
1:003E  b86400            mov      ax, 0x64
1:0041  262b470a          sub      ax, word ptr es:[bx + 0xa]
1:0045  b90500            mov      cx, 5
1:0048  f7e9              imul     cx
1:004A  a3b004            mov      word ptr [0x4b0], ax
1:004D  268b4708          mov      ax, word ptr es:[bx + 8]
1:0051  3d6400            cmp      ax, 0x64
1:0054  7503              jne      0x59
1:0056  e9a600            jmp      0xff
1:0059  7734              ja       0x8f
1:005B  0ac0              or       al, al
1:005D  742a              je       0x89
1:005F  2c07              sub      al, 7
1:0061  7454              je       0xb7
1:0063  2c08              sub      al, 8
1:0065  7458              je       0xbf
1:0067  2c0a              sub      al, 0xa
1:0069  745c              je       0xc7
1:006B  2c0a              sub      al, 0xa
1:006D  7460              je       0xcf
1:006F  2c0a              sub      al, 0xa
1:0071  7464              je       0xd7
1:0073  2c0a              sub      al, 0xa
1:0075  7468              je       0xdf
1:0077  2c0a              sub      al, 0xa
1:0079  746c              je       0xe7
1:007B  2c0a              sub      al, 0xa
1:007D  7470              je       0xef
1:007F  2c0a              sub      al, 0xa
1:0081  7474              je       0xf7
1:0083  2c0a              sub      al, 0xa
1:0085  7478              je       0xff
1:0087  eb06              jmp      0x8f
1:0089  c706f0030200      mov      word ptr [0x3f0], 2
1:008F  c41ee603          les      bx, ptr [0x3e6]
1:0093  26837f0a01        cmp      word ptr es:[bx + 0xa], 1
1:0098  756d              jne      0x107
1:009A  2bc0              sub      ax, ax
1:009C  a38a03            mov      word ptr [0x38a], ax
1:009F  a38803            mov      word ptr [0x388], ax
1:00A2  c7068c03ffff      mov      word ptr [0x38c], 0xffff
1:00A8  c7068e03ff00      mov      word ptr [0x38e], 0xff
1:00AE  c706f4030200      mov      word ptr [0x3f4], 2
1:00B4  e92c01            jmp      0x1e3
1:00B7  c706f0030500      mov      word ptr [0x3f0], 5
1:00BD  ebd0              jmp      0x8f
1:00BF  c706f0030a00      mov      word ptr [0x3f0], 0xa
1:00C5  ebc8              jmp      0x8f
1:00C7  c706f0031400      mov      word ptr [0x3f0], 0x14
1:00CD  ebc0              jmp      0x8f
1:00CF  c706f0031e00      mov      word ptr [0x3f0], 0x1e
1:00D5  ebb8              jmp      0x8f
1:00D7  c706f0032800      mov      word ptr [0x3f0], 0x28
1:00DD  ebb0              jmp      0x8f
1:00DF  c706f0033200      mov      word ptr [0x3f0], 0x32
1:00E5  eba8              jmp      0x8f
1:00E7  c706f0033c00      mov      word ptr [0x3f0], 0x3c
1:00ED  eba0              jmp      0x8f
1:00EF  c706f0034b00      mov      word ptr [0x3f0], 0x4b
1:00F5  eb98              jmp      0x8f
1:00F7  c706f0036400      mov      word ptr [0x3f0], 0x64
1:00FD  eb90              jmp      0x8f
1:00FF  c706f0036500      mov      word ptr [0x3f0], 0x65
1:0105  eb88              jmp      0x8f
1:0107  c706f4031600      mov      word ptr [0x3f4], 0x16
1:010D  2bc0              sub      ax, ax
1:010F  a38a03            mov      word ptr [0x38a], ax
1:0112  a38803            mov      word ptr [0x388], ax
1:0115  a38c03            mov      word ptr [0x38c], ax
1:0118  c7068e03ff00      mov      word ptr [0x38e], 0xff
1:011E  c7069803ff00      mov      word ptr [0x398], 0xff
1:0124  c7069a03ff00      mov      word ptr [0x39a], 0xff
1:012A  b88000            mov      ax, 0x80
1:012D  8bd0              mov      dx, ax
1:012F  a39403            mov      word ptr [0x394], ax
1:0132  89169603          mov      word ptr [0x396], dx
1:0136  a39c03            mov      word ptr [0x39c], ax
1:0139  89169e03          mov      word ptr [0x39e], dx
1:013D  c706a403ff00      mov      word ptr [0x3a4], 0xff
1:0143  c706a6030000      mov      word ptr [0x3a6], 0
1:0149  99                cdq      
1:014A  a3a003            mov      word ptr [0x3a0], ax
1:014D  8916a203          mov      word ptr [0x3a2], dx
1:0151  a3a803            mov      word ptr [0x3a8], ax
1:0154  8916aa03          mov      word ptr [0x3aa], dx
1:0158  c706b003ffff      mov      word ptr [0x3b0], 0xffff
1:015E  c706b2030000      mov      word ptr [0x3b2], 0
1:0164  b88080            mov      ax, 0x8080
1:0167  2bd2              sub      dx, dx
1:0169  a3ac03            mov      word ptr [0x3ac], ax
1:016C  8916ae03          mov      word ptr [0x3ae], dx
1:0170  a3b403            mov      word ptr [0x3b4], ax
1:0173  8916b603          mov      word ptr [0x3b6], dx
1:0177  c706b8035555      mov      word ptr [0x3b8], 0x5555
1:017D  c706ba035500      mov      word ptr [0x3ba], 0x55
1:0183  c706bc03ffff      mov      word ptr [0x3bc], 0xffff
1:0189  c706be03ff00      mov      word ptr [0x3be], 0xff
1:018F  c706c003aaaa      mov      word ptr [0x3c0], 0xaaaa
1:0195  c706c203aa00      mov      word ptr [0x3c2], 0xaa
1:019B  c706c80300ff      mov      word ptr [0x3c8], 0xff00
1:01A1  8916ca03          mov      word ptr [0x3ca], dx
1:01A5  b80080            mov      ax, 0x8000
1:01A8  a3c403            mov      word ptr [0x3c4], ax
1:01AB  8916c603          mov      word ptr [0x3c6], dx
1:01AF  a3cc03            mov      word ptr [0x3cc], ax
1:01B2  8916ce03          mov      word ptr [0x3ce], dx
1:01B6  c706d40300ff      mov      word ptr [0x3d4], 0xff00
1:01BC  c706d603ff00      mov      word ptr [0x3d6], 0xff
1:01C2  ba8000            mov      dx, 0x80
1:01C5  a3d003            mov      word ptr [0x3d0], ax
1:01C8  8916d203          mov      word ptr [0x3d2], dx
1:01CC  a3d803            mov      word ptr [0x3d8], ax
1:01CF  8916da03          mov      word ptr [0x3da], dx
1:01D3  2bc0              sub      ax, ax
1:01D5  a39003            mov      word ptr [0x390], ax
1:01D8  89169203          mov      word ptr [0x392], dx
1:01DC  a3dc03            mov      word ptr [0x3dc], ax
1:01DF  8916de03          mov      word ptr [0x3de], dx
1:01E3  26837f0a08        cmp      word ptr es:[bx + 0xa], 8
1:01E8  7506              jne      0x1f0
1:01EA  c706f403eb00      mov      word ptr [0x3f4], 0xeb
1:01F0  b84200            mov      ax, 0x42
1:01F3  50                push     ax
1:01F4  b86402            mov      ax, 0x264
1:01F7  f72e1000          imul     word ptr [0x10]
1:01FB  50                push     ax
1:01FC  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LocalAlloc
1:0201  a31200            mov      word ptr [0x12], ax
1:0204  0bc0              or       ax, ax
1:0206  7505              jne      0x20d
1:0208  b80100            mov      ax, 1
1:020B  eb06              jmp      0x213
1:020D  0e                push     cs
1:020E  e8a501            call     0x3b6
1:0211  2bc0              sub      ax, ax
1:0213  4d                dec      bp
1:0214  4d                dec      bp
1:0215  8be5              mov      sp, bp
1:0217  1f                pop      ds
1:0218  5d                pop      bp
1:0219  4d                dec      bp
1:021A  cb                retf     

; ===== EXPORT:ord_12(#12) =====
1:021B  1e                push     ds
1:021C  58                pop      ax
1:021D  90                nop      
1:021E  45                inc      bp
1:021F  55                push     bp
1:0220  8bec              mov      bp, sp
1:0222  1e                push     ds
1:0223  8ed8              mov      ds, ax
1:0225  33c0              xor      ax, ax
1:0227  9a7e020000        lcall    0, 0x27e  ; @1:INT:ord_4(1:0D72)
1:022C  c41eb204          les      bx, ptr [0x4b2]
1:0230  26837f0c00        cmp      word ptr es:[bx + 0xc], 0
1:0235  742e              je       0x265
1:0237  b83003            mov      ax, 0x330
1:023A  1e                push     ds
1:023B  50                push     ax
1:023C  2bc0              sub      ax, ax
1:023E  50                push     ax
1:023F  50                push     ax
1:0240  26ff7702          push     word ptr es:[bx + 2]
1:0244  26ff7704          push     word ptr es:[bx + 4]
1:0248  9a05030000        lcall    0, 0x305  ; @1:USER.SetRect
1:024D  ff368603          push     word ptr [0x386]
1:0251  b83003            mov      ax, 0x330
1:0254  1e                push     ds
1:0255  50                push     ax
1:0256  b80400            mov      ax, 4
1:0259  50                push     ax
1:025A  9a17030000        lcall    0, 0x317  ; @1:GDI.GetStockObject
1:025F  50                push     ax
1:0260  9a1d030000        lcall    0, 0x31d  ; @1:USER.FillRect
1:0265  b80a00            mov      ax, 0xa
1:0268  4d                dec      bp
1:0269  4d                dec      bp
1:026A  8be5              mov      sp, bp
1:026C  1f                pop      ds
1:026D  5d                pop      bp
1:026E  4d                dec      bp
1:026F  cb                retf     

; ===== EXPORT:ord_11(#11) =====
1:0270  1e                push     ds
1:0271  58                pop      ax
1:0272  90                nop      
1:0273  45                inc      bp
1:0274  55                push     bp
1:0275  8bec              mov      bp, sp
1:0277  1e                push     ds
1:0278  8ed8              mov      ds, ax
1:027A  b80400            mov      ax, 4
1:027D  9ac6020000        lcall    0, 0x2c6  ; @1:INT:ord_4(1:0D72)
1:0282  833ef80300        cmp      word ptr [0x3f8], 0
1:0287  7514              jne      0x29d
1:0289  813ef603e803      cmp      word ptr [0x3f6], 0x3e8
1:028F  730c              jae      0x29d
1:0291  8306f60301        add      word ptr [0x3f6], 1
1:0296  8316f80300        adc      word ptr [0x3f8], 0
1:029B  eb10              jmp      0x2ad
1:029D  2bc0              sub      ax, ax
1:029F  a3f803            mov      word ptr [0x3f8], ax
1:02A2  a3f603            mov      word ptr [0x3f6], ax
1:02A5  0e                push     cs
1:02A6  e89004            call     0x739
1:02A9  0e                push     cs
1:02AA  e80901            call     0x3b6
1:02AD  0e                push     cs
1:02AE  e80507            call     0x9b6
1:02B1  4d                dec      bp
1:02B2  4d                dec      bp
1:02B3  8be5              mov      sp, bp
1:02B5  1f                pop      ds
1:02B6  5d                pop      bp
1:02B7  4d                dec      bp
1:02B8  cb                retf     

; ===== EXPORT:ord_9(#9) =====
1:02B9  1e                push     ds
1:02BA  58                pop      ax
1:02BB  90                nop      
1:02BC  45                inc      bp
1:02BD  55                push     bp
1:02BE  8bec              mov      bp, sp
1:02C0  1e                push     ds
1:02C1  8ed8              mov      ds, ax
1:02C3  33c0              xor      ax, ax
1:02C5  9a38030000        lcall    0, 0x338  ; @1:INT:ord_4(1:0D72)
1:02CA  0e                push     cs
1:02CB  e86b04            call     0x739
1:02CE  833e120000        cmp      word ptr [0x12], 0
1:02D3  740f              je       0x2e4
1:02D5  ff361200          push     word ptr [0x12]
1:02D9  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LocalFree
1:02DE  c70612000000      mov      word ptr [0x12], 0
1:02E4  c41ee603          les      bx, ptr [0x3e6]
1:02E8  26837f2800        cmp      word ptr es:[bx + 0x28], 0
1:02ED  7532              jne      0x321
1:02EF  b83803            mov      ax, 0x338
1:02F2  1e                push     ds
1:02F3  50                push     ax
1:02F4  2bc0              sub      ax, ax
1:02F6  50                push     ax
1:02F7  50                push     ax
1:02F8  c41eb204          les      bx, ptr [0x4b2]
1:02FC  26ff7702          push     word ptr es:[bx + 2]
1:0300  26ff7704          push     word ptr es:[bx + 4]
1:0304  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:0309  ff368603          push     word ptr [0x386]
1:030D  b83803            mov      ax, 0x338
1:0310  1e                push     ds
1:0311  50                push     ax
1:0312  b80400            mov      ax, 4
1:0315  50                push     ax
1:0316  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:031B  50                push     ax
1:031C  9affff0000        lcall    0, 0xffff  ; @1:USER.FillRect
1:0321  2bc0              sub      ax, ax
1:0323  4d                dec      bp
1:0324  4d                dec      bp
1:0325  8be5              mov      sp, bp
1:0327  1f                pop      ds
1:0328  5d                pop      bp
1:0329  4d                dec      bp
1:032A  cb                retf     

; ===== EXPORT:ord_8(#8) =====
1:032B  1e                push     ds
1:032C  58                pop      ax
1:032D  90                nop      
1:032E  45                inc      bp
1:032F  55                push     bp
1:0330  8bec              mov      bp, sp
1:0332  1e                push     ds
1:0333  8ed8              mov      ds, ax
1:0335  33c0              xor      ax, ax
1:0337  9a53030000        lcall    0, 0x353  ; @1:INT:ord_4(1:0D72)
1:033C  2bc0              sub      ax, ax
1:033E  4d                dec      bp
1:033F  4d                dec      bp
1:0340  8be5              mov      sp, bp
1:0342  1f                pop      ds
1:0343  5d                pop      bp
1:0344  4d                dec      bp
1:0345  cb                retf     

; ===== EXPORT:ord_7(#7) =====
1:0346  1e                push     ds
1:0347  58                pop      ax
1:0348  90                nop      
1:0349  45                inc      bp
1:034A  55                push     bp
1:034B  8bec              mov      bp, sp
1:034D  1e                push     ds
1:034E  8ed8              mov      ds, ax
1:0350  33c0              xor      ax, ax
1:0352  9a6e030000        lcall    0, 0x36e  ; @1:INT:ord_4(1:0D72)
1:0357  2bc0              sub      ax, ax
1:0359  4d                dec      bp
1:035A  4d                dec      bp
1:035B  8be5              mov      sp, bp
1:035D  1f                pop      ds
1:035E  5d                pop      bp
1:035F  4d                dec      bp
1:0360  cb                retf     

; ===== EXPORT:ord_6(#6) =====
1:0361  1e                push     ds
1:0362  58                pop      ax
1:0363  90                nop      
1:0364  45                inc      bp
1:0365  55                push     bp
1:0366  8bec              mov      bp, sp
1:0368  1e                push     ds
1:0369  8ed8              mov      ds, ax
1:036B  33c0              xor      ax, ax
1:036D  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_4(1:0D72)
1:0372  c41ee603          les      bx, ptr [0x3e6]
1:0376  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:037B  7404              je       0x381
1:037D  2bc0              sub      ax, ax
1:037F  eb2d              jmp      0x3ae
1:0381  8b4606            mov      ax, word ptr [bp + 6]
1:0384  0bc0              or       ax, ax
1:0386  7cf5              jl       0x37d
1:0388  48                dec      ax
1:0389  7e05              jle      0x390
1:038B  48                dec      ax
1:038C  740b              je       0x399
1:038E  ebed              jmp      0x37d
1:0390  0e                push     cs
1:0391  e825ff            call     0x2b9
1:0394  b80300            mov      ax, 3
1:0397  eb15              jmp      0x3ae
1:0399  b86400            mov      ax, 0x64
1:039C  c41eb204          les      bx, ptr [0x4b2]
1:03A0  262b470a          sub      ax, word ptr es:[bx + 0xa]
1:03A4  b90500            mov      cx, 5
1:03A7  f7e9              imul     cx
1:03A9  a3b004            mov      word ptr [0x4b0], ax
1:03AC  ebcf              jmp      0x37d
1:03AE  4d                dec      bp
1:03AF  4d                dec      bp
1:03B0  8be5              mov      sp, bp
1:03B2  1f                pop      ds
1:03B3  5d                pop      bp
1:03B4  4d                dec      bp
1:03B5  cb                retf     
1:03B6  1e                push     ds
1:03B7  58                pop      ax
1:03B8  90                nop      
1:03B9  45                inc      bp
1:03BA  55                push     bp
1:03BB  8bec              mov      bp, sp
1:03BD  1e                push     ds
1:03BE  8ed8              mov      ds, ax
1:03C0  b80a00            mov      ax, 0xa
1:03C3  9a47070000        lcall    0, 0x747  ; @1:INT:ord_4(1:0D72)
1:03C8  56                push     si
1:03C9  ff361200          push     word ptr [0x12]
1:03CD  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LocalLock
1:03D2  a31400            mov      word ptr [0x14], ax
1:03D5  c70684030e00      mov      word ptr [0x384], 0xe
1:03DB  2bc0              sub      ax, ax
1:03DD  a3ae04            mov      word ptr [0x4ae], ax
1:03E0  a38203            mov      word ptr [0x382], ax
1:03E3  c706b604bc02      mov      word ptr [0x4b6], 0x2bc
1:03E9  9a05040000        lcall    0, 0x405  ; @1:INT:ord_5(1:0E38)
1:03EE  c41eb204          les      bx, ptr [0x4b2]
1:03F2  268b4f02          mov      cx, word ptr es:[bx + 2]
1:03F6  81e98c00          sub      cx, 0x8c
1:03FA  99                cdq      
1:03FB  f7f9              idiv     cx
1:03FD  83c246            add      dx, 0x46
1:0400  8916ec03          mov      word ptr [0x3ec], dx
1:0404  9a53040000        lcall    0, 0x453  ; @1:INT:ord_5(1:0E38)
1:0409  c41eb204          les      bx, ptr [0x4b2]
1:040D  268b4f04          mov      cx, word ptr es:[bx + 4]
1:0411  81e98c00          sub      cx, 0x8c
1:0415  99                cdq      
1:0416  f7f9              idiv     cx
1:0418  83c246            add      dx, 0x46
1:041B  8916ee03          mov      word ptr [0x3ee], dx
1:041F  c41ee603          les      bx, ptr [0x3e6]
1:0423  26837f0a04        cmp      word ptr es:[bx + 0xa], 4
1:0428  7d08              jge      0x432
1:042A  c70612040d00      mov      word ptr [0x412], 0xd
1:0430  eb7a              jmp      0x4ac
1:0432  26837f0a08        cmp      word ptr es:[bx + 0xa], 8
1:0437  7519              jne      0x452
1:0439  c70612040100      mov      word ptr [0x412], 1
1:043F  b80001            mov      ax, 0x100
1:0442  8b0e1000          mov      cx, word ptr [0x10]
1:0446  d1e1              shl      cx, 1
1:0448  d1e1              shl      cx, 1
1:044A  99                cdq      
1:044B  f7f9              idiv     cx
1:044D  8946f6            mov      word ptr [bp - 0xa], ax
1:0450  eb5a              jmp      0x4ac
1:0452  9ab6040000        lcall    0, 0x4b6  ; @1:INT:ord_5(1:0E38)
1:0457  b90700            mov      cx, 7
1:045A  99                cdq      
1:045B  f7f9              idiv     cx
1:045D  8bc2              mov      ax, dx
1:045F  eb30              jmp      0x491
1:0461  c70612040100      mov      word ptr [0x412], 1
1:0467  eb43              jmp      0x4ac
1:0469  c70612040400      mov      word ptr [0x412], 4
1:046F  eb3b              jmp      0x4ac
1:0471  c70612040700      mov      word ptr [0x412], 7
1:0477  eb33              jmp      0x4ac
1:0479  c70612040a00      mov      word ptr [0x412], 0xa
1:047F  eb2b              jmp      0x4ac
1:0481  c70612041000      mov      word ptr [0x412], 0x10
1:0487  eb23              jmp      0x4ac
1:0489  c70612041300      mov      word ptr [0x412], 0x13
1:048F  eb1b              jmp      0x4ac
1:0491  3d0600            cmp      ax, 6
1:0494  7716              ja       0x4ac
1:0496  d1e0              shl      ax, 1
1:0498  93                xchg     bx, ax
1:0499  2effa79e04        jmp      word ptr cs:[bx + 0x49e]
1:049E  61                popaw    
1:049F  0469              add      al, 0x69
1:04A1  0471              add      al, 0x71
1:04A3  042a              add      al, 0x2a
1:04A5  0479              add      al, 0x79
1:04A7  0481              add      al, 0x81
1:04A9  0489              add      al, 0x89
1:04AB  04c7              add      al, 0xc7
1:04AD  06                push     es
1:04AE  f20300            add      ax, word ptr [bx + si]
1:04B1  00e9              add      cl, ch
1:04B3  bf019a            mov      di, 0x9a01
1:04B6  7e06              jle      0x4be  ; @0:INT:ord_5(1:0E38)
1:04B8  0000              add      byte ptr [bx + si], al
1:04BA  c41eb204          les      bx, ptr [0x4b2]
1:04BE  99                cdq      
1:04BF  26f77f02          idiv     word ptr es:[bx + 2]
1:04C3  b81600            mov      ax, 0x16
1:04C6  8bca              mov      cx, dx
1:04C8  f72ef203          imul     word ptr [0x3f2]
1:04CC  8bd8              mov      bx, ax
1:04CE  898f0e04          mov      word ptr [bx + 0x40e], cx
1:04D2  b81600            mov      ax, 0x16
1:04D5  f72ef203          imul     word ptr [0x3f2]
1:04D9  8bd8              mov      bx, ax
1:04DB  c436b204          les      si, ptr [0x4b2]
1:04DF  268b4404          mov      ax, word ptr es:[si + 4]
1:04E3  89871004          mov      word ptr [bx + 0x410], ax
1:04E7  b80100            mov      ax, 1
1:04EA  89870204          mov      word ptr [bx + 0x402], ax
1:04EE  8987fe03          mov      word ptr [bx + 0x3fe], ax
1:04F2  2bc0              sub      ax, ax
1:04F4  89870404          mov      word ptr [bx + 0x404], ax
1:04F8  89870004          mov      word ptr [bx + 0x400], ax
1:04FC  833ef20300        cmp      word ptr [0x3f2], 0
1:0501  7f03              jg       0x506
1:0503  e96601            jmp      0x66c
1:0506  c41ee603          les      bx, ptr [0x3e6]
1:050A  26837f0a04        cmp      word ptr es:[bx + 0xa], 4
1:050F  7d12              jge      0x523
1:0511  b81600            mov      ax, 0x16
1:0514  f72ef203          imul     word ptr [0x3f2]
1:0518  8bd8              mov      bx, ax
1:051A  c78712040d00      mov      word ptr [bx + 0x412], 0xd
1:0520  e94901            jmp      0x66c
1:0523  26837f0a08        cmp      word ptr es:[bx + 0xa], 8
1:0528  7517              jne      0x541
1:052A  b81600            mov      ax, 0x16
1:052D  f72ef203          imul     word ptr [0x3f2]
1:0531  8bd8              mov      bx, ax
1:0533  8b87fc03          mov      ax, word ptr [bx + 0x3fc]
1:0537  0346f6            add      ax, word ptr [bp - 0xa]
1:053A  89871204          mov      word ptr [bx + 0x412], ax
1:053E  e92b01            jmp      0x66c
1:0541  b81600            mov      ax, 0x16
1:0544  f72ef203          imul     word ptr [0x3f2]
1:0548  8bd8              mov      bx, ax
1:054A  8b87fc03          mov      ax, word ptr [bx + 0x3fc]
1:054E  e9e500            jmp      0x636
1:0551  b81600            mov      ax, 0x16
1:0554  f72ef203          imul     word ptr [0x3f2]
1:0558  8bd8              mov      bx, ax
1:055A  c78712040600      mov      word ptr [bx + 0x412], 6
1:0560  e90901            jmp      0x66c
1:0563  b81600            mov      ax, 0x16
1:0566  f72ef203          imul     word ptr [0x3f2]
1:056A  8bd8              mov      bx, ax
1:056C  c78712040400      mov      word ptr [bx + 0x412], 4
1:0572  e9f700            jmp      0x66c
1:0575  b81600            mov      ax, 0x16
1:0578  f72ef203          imul     word ptr [0x3f2]
1:057C  8bd8              mov      bx, ax
1:057E  c78712040300      mov      word ptr [bx + 0x412], 3
1:0584  e9e500            jmp      0x66c
1:0587  b81600            mov      ax, 0x16
1:058A  f72ef203          imul     word ptr [0x3f2]
1:058E  8bd8              mov      bx, ax
1:0590  c78712040100      mov      word ptr [bx + 0x412], 1
1:0596  e9d300            jmp      0x66c
1:0599  b81600            mov      ax, 0x16
1:059C  f72ef203          imul     word ptr [0x3f2]
1:05A0  8bd8              mov      bx, ax
1:05A2  c78712040200      mov      word ptr [bx + 0x412], 2
1:05A8  e9c100            jmp      0x66c
1:05AB  b81600            mov      ax, 0x16
1:05AE  f72ef203          imul     word ptr [0x3f2]
1:05B2  8bd8              mov      bx, ax
1:05B4  c78712041300      mov      word ptr [bx + 0x412], 0x13
1:05BA  e9af00            jmp      0x66c
1:05BD  b81600            mov      ax, 0x16
1:05C0  f72ef203          imul     word ptr [0x3f2]
1:05C4  8bd8              mov      bx, ax
1:05C6  c78712041400      mov      word ptr [bx + 0x412], 0x14
1:05CC  e99d00            jmp      0x66c
1:05CF  b81600            mov      ax, 0x16
1:05D2  f72ef203          imul     word ptr [0x3f2]
1:05D6  8bd8              mov      bx, ax
1:05D8  c78712041000      mov      word ptr [bx + 0x412], 0x10
1:05DE  e98b00            jmp      0x66c
1:05E1  b81600            mov      ax, 0x16
1:05E4  f72ef203          imul     word ptr [0x3f2]
1:05E8  8bd8              mov      bx, ax
1:05EA  c78712040f00      mov      word ptr [bx + 0x412], 0xf
1:05F0  eb7a              jmp      0x66c
1:05F2  b81600            mov      ax, 0x16
1:05F5  f72ef203          imul     word ptr [0x3f2]
1:05F9  8bd8              mov      bx, ax
1:05FB  c78712040a00      mov      word ptr [bx + 0x412], 0xa
1:0601  eb69              jmp      0x66c
1:0603  b81600            mov      ax, 0x16
1:0606  f72ef203          imul     word ptr [0x3f2]
1:060A  8bd8              mov      bx, ax
1:060C  c78712040900      mov      word ptr [bx + 0x412], 9
1:0612  eb58              jmp      0x66c
1:0614  b81600            mov      ax, 0x16
1:0617  f72ef203          imul     word ptr [0x3f2]
1:061B  8bd8              mov      bx, ax
1:061D  c78712040c00      mov      word ptr [bx + 0x412], 0xc
1:0623  eb47              jmp      0x66c
1:0625  b81600            mov      ax, 0x16
1:0628  f72ef203          imul     word ptr [0x3f2]
1:062C  8bd8              mov      bx, ax
1:062E  c78712040700      mov      word ptr [bx + 0x412], 7
1:0634  eb36              jmp      0x66c
1:0636  48                dec      ax
1:0637  3d1300            cmp      ax, 0x13
1:063A  7730              ja       0x66c
1:063C  d1e0              shl      ax, 1
1:063E  93                xchg     bx, ax
1:063F  2effa74406        jmp      word ptr cs:[bx + 0x644]
1:0644  99                cdq      
1:0645  05ab05            add      ax, 0x5ab
1:0648  8705              xchg     word ptr [di], ax
1:064A  7505              jne      0x651
1:064C  6c                insb     byte ptr es:[di], dx
1:064D  06                push     es
1:064E  6305              arpl     word ptr [di], ax
1:0650  51                push     cx
1:0651  056c06            add      ax, 0x66c
1:0654  1105              adc      word ptr [di], ax
1:0656  03066c06          add      ax, word ptr [0x66c]
1:065A  250614            and      ax, 0x1406
1:065D  06                push     es
1:065E  6c                insb     byte ptr es:[di], dx
1:065F  06                push     es
1:0660  f205e105          add      ax, 0x5e1
1:0664  6c                insb     byte ptr es:[di], dx
1:0665  06                push     es
1:0666  6c                insb     byte ptr es:[di], dx
1:0667  06                push     es
1:0668  bd05cf            mov      bp, 0xcf05
1:066B  050ee8            add      ax, 0xe80e
1:066E  fe02              inc      byte ptr [bp + si]
1:0670  ff06f203          inc      word ptr [0x3f2]
1:0674  a11000            mov      ax, word ptr [0x10]
1:0677  3906f203          cmp      word ptr [0x3f2], ax
1:067B  7d4e              jge      0x6cb
1:067D  9aa1060000        lcall    0, 0x6a1  ; @1:INT:ord_5(1:0E38)
1:0682  b90200            mov      cx, 2
1:0685  99                cdq      
1:0686  f7f9              idiv     cx
1:0688  0bd2              or       dx, dx
1:068A  7503              jne      0x68f
1:068C  e926fe            jmp      0x4b5
1:068F  b81600            mov      ax, 0x16
1:0692  f72ef203          imul     word ptr [0x3f2]
1:0696  8bd8              mov      bx, ax
1:0698  c7870e040000      mov      word ptr [bx + 0x40e], 0
1:069E  8bf3              mov      si, bx
1:06A0  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_5(1:0E38)
1:06A5  c41eb204          les      bx, ptr [0x4b2]
1:06A9  99                cdq      
1:06AA  26f77f04          idiv     word ptr es:[bx + 4]
1:06AE  89941004          mov      word ptr [si + 0x410], dx
1:06B2  b81600            mov      ax, 0x16
1:06B5  f72ef203          imul     word ptr [0x3f2]
1:06B9  8bd8              mov      bx, ax
1:06BB  2bc0              sub      ax, ax
1:06BD  89870204          mov      word ptr [bx + 0x402], ax
1:06C1  8987fe03          mov      word ptr [bx + 0x3fe], ax
1:06C5  b80100            mov      ax, 1
1:06C8  e929fe            jmp      0x4f4
1:06CB  833ef00300        cmp      word ptr [0x3f0], 0
1:06D0  7e4f              jle      0x721
1:06D2  c746fa0000        mov      word ptr [bp - 6], 0
1:06D7  eb38              jmp      0x711
1:06D9  ff46fc            inc      word ptr [bp - 4]
1:06DC  8b46fc            mov      ax, word ptr [bp - 4]
1:06DF  3906f003          cmp      word ptr [0x3f0], ax
1:06E3  7e29              jle      0x70e
1:06E5  b86600            mov      ax, 0x66
1:06E8  f76efa            imul     word ptr [bp - 6]
1:06EB  0346fc            add      ax, word ptr [bp - 4]
1:06EE  b90600            mov      cx, 6
1:06F1  f7e9              imul     cx
1:06F3  8bd8              mov      bx, ax
1:06F5  8b361400          mov      si, word ptr [0x14]
1:06F9  a1ec03            mov      ax, word ptr [0x3ec]
1:06FC  8900              mov      word ptr [bx + si], ax
1:06FE  a1ee03            mov      ax, word ptr [0x3ee]
1:0701  8bcb              mov      cx, bx
1:0703  8b1e1400          mov      bx, word ptr [0x14]
1:0707  8bf1              mov      si, cx
1:0709  894002            mov      word ptr [bx + si + 2], ax
1:070C  ebcb              jmp      0x6d9
1:070E  ff46fa            inc      word ptr [bp - 6]
1:0711  8b46fa            mov      ax, word ptr [bp - 6]
1:0714  39061000          cmp      word ptr [0x10], ax
1:0718  7e07              jle      0x721
1:071A  c746fc0000        mov      word ptr [bp - 4], 0
1:071F  ebbb              jmp      0x6dc
1:0721  ff361200          push     word ptr [0x12]
1:0725  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LocalUnlock
1:072A  c706fc030100      mov      word ptr [0x3fc], 1
1:0730  5e                pop      si
1:0731  4d                dec      bp
1:0732  4d                dec      bp
1:0733  8be5              mov      sp, bp
1:0735  1f                pop      ds
1:0736  5d                pop      bp
1:0737  4d                dec      bp
1:0738  cb                retf     
1:0739  1e                push     ds
1:073A  58                pop      ax
1:073B  90                nop      
1:073C  45                inc      bp
1:073D  55                push     bp
1:073E  8bec              mov      bp, sp
1:0740  1e                push     ds
1:0741  8ed8              mov      ds, ax
1:0743  b80400            mov      ax, 4
1:0746  9a0d000000        lcall    0, 0xd  ; @1:INT:ord_4(1:0D72)
1:074B  2bc0              sub      ax, ax
1:074D  a3fc03            mov      word ptr [0x3fc], ax
1:0750  8946fc            mov      word ptr [bp - 4], ax
1:0753  eb07              jmp      0x75c
1:0755  0e                push     cs
1:0756  e85d02            call     0x9b6
1:0759  ff46fc            inc      word ptr [bp - 4]
1:075C  a1f003            mov      ax, word ptr [0x3f0]
1:075F  3946fc            cmp      word ptr [bp - 4], ax
1:0762  7cf1              jl       0x755
1:0764  c41eb204          les      bx, ptr [0x4b2]
1:0768  26837f0c00        cmp      word ptr es:[bx + 0xc], 0
1:076D  742e              je       0x79d
1:076F  b84003            mov      ax, 0x340
1:0772  1e                push     ds
1:0773  50                push     ax
1:0774  2bc0              sub      ax, ax
1:0776  50                push     ax
1:0777  50                push     ax
1:0778  26ff7702          push     word ptr es:[bx + 2]
1:077C  26ff7704          push     word ptr es:[bx + 4]
1:0780  9a49020000        lcall    0, 0x249  ; @1:USER.SetRect
1:0785  ff368603          push     word ptr [0x386]
1:0789  b84003            mov      ax, 0x340
1:078C  1e                push     ds
1:078D  50                push     ax
1:078E  b80400            mov      ax, 4
1:0791  50                push     ax
1:0792  9a5b020000        lcall    0, 0x25b  ; @1:GDI.GetStockObject
1:0797  50                push     ax
1:0798  9a61020000        lcall    0, 0x261  ; @1:USER.FillRect
1:079D  4d                dec      bp
1:079E  4d                dec      bp
1:079F  8be5              mov      sp, bp
1:07A1  1f                pop      ds
1:07A2  5d                pop      bp
1:07A3  4d                dec      bp
1:07A4  cb                retf     
1:07A5  1e                push     ds
1:07A6  58                pop      ax
1:07A7  90                nop      
1:07A8  45                inc      bp
1:07A9  55                push     bp
1:07AA  8bec              mov      bp, sp
1:07AC  1e                push     ds
1:07AD  8ed8              mov      ds, ax
1:07AF  b80400            mov      ax, 4
1:07B2  9a49080000        lcall    0, 0x849  ; @1:INT:ord_4(1:0D72)
1:07B7  837e0a00          cmp      word ptr [bp + 0xa], 0
1:07BB  743e              je       0x7fb
1:07BD  813ef403eb00      cmp      word ptr [0x3f4], 0xeb
1:07C3  7511              jne      0x7d6
1:07C5  ff368603          push     word ptr [0x386]
1:07C9  2bc0              sub      ax, ax
1:07CB  50                push     ax
1:07CC  50                push     ax
1:07CD  b80001            mov      ax, 0x100
1:07D0  50                push     ax
1:07D1  ff760a            push     word ptr [bp + 0xa]
1:07D4  eb17              jmp      0x7ed
1:07D6  ff368603          push     word ptr [0x386]
1:07DA  2bc0              sub      ax, ax
1:07DC  50                push     ax
1:07DD  50                push     ax
1:07DE  8b5e0a            mov      bx, word ptr [bp + 0xa]
1:07E1  d1e3              shl      bx, 1
1:07E3  d1e3              shl      bx, 1
1:07E5  ffb78a03          push     word ptr [bx + 0x38a]
1:07E9  ffb78803          push     word ptr [bx + 0x388]
1:07ED  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreatePen
1:07F2  50                push     ax
1:07F3  9a29080000        lcall    0, 0x829  ; @1:GDI.SelectObject
1:07F8  8946fc            mov      word ptr [bp - 4], ax
1:07FB  ff368603          push     word ptr [0x386]
1:07FF  ff36ec03          push     word ptr [0x3ec]
1:0803  ff36ee03          push     word ptr [0x3ee]
1:0807  9affff0000        lcall    0, 0xffff  ; @1:GDI.MoveTo
1:080C  ff368603          push     word ptr [0x386]
1:0810  ff7606            push     word ptr [bp + 6]
1:0813  ff7608            push     word ptr [bp + 8]
1:0816  9affff0000        lcall    0, 0xffff  ; @1:GDI.LineTo
1:081B  837e0a00          cmp      word ptr [bp + 0xa], 0
1:081F  7412              je       0x833
1:0821  ff368603          push     word ptr [0x386]
1:0825  ff76fc            push     word ptr [bp - 4]
1:0828  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectObject
1:082D  50                push     ax
1:082E  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteObject
1:0833  4d                dec      bp
1:0834  4d                dec      bp
1:0835  8be5              mov      sp, bp
1:0837  1f                pop      ds
1:0838  5d                pop      bp
1:0839  4d                dec      bp
1:083A  cb                retf     
1:083B  1e                push     ds
1:083C  58                pop      ax
1:083D  90                nop      
1:083E  45                inc      bp
1:083F  55                push     bp
1:0840  8bec              mov      bp, sp
1:0842  1e                push     ds
1:0843  8ed8              mov      ds, ax
1:0845  b80400            mov      ax, 4
1:0848  9abf080000        lcall    0, 0x8bf  ; @1:INT:ord_4(1:0D72)
1:084D  b81600            mov      ax, 0x16
1:0850  f72ef203          imul     word ptr [0x3f2]
1:0854  8bd8              mov      bx, ax
1:0856  8b870204          mov      ax, word ptr [bx + 0x402]
1:085A  f7af0a04          imul     word ptr [bx + 0x40a]
1:085E  03870e04          add      ax, word ptr [bx + 0x40e]
1:0862  8946fc            mov      word ptr [bp - 4], ax
1:0865  3df6ff            cmp      ax, 0xfff6
1:0868  7c0f              jl       0x879
1:086A  c41eb204          les      bx, ptr [0x4b2]
1:086E  268b4f02          mov      cx, word ptr es:[bx + 2]
1:0872  83c10a            add      cx, 0xa
1:0875  3bc1              cmp      ax, cx
1:0877  7e20              jle      0x899
1:0879  b81600            mov      ax, 0x16
1:087C  f72ef203          imul     word ptr [0x3f2]
1:0880  8bd8              mov      bx, ax
1:0882  8b870e04          mov      ax, word ptr [bx + 0x40e]
1:0886  8946fc            mov      word ptr [bp - 4], ax
1:0889  c78702040000      mov      word ptr [bx + 0x402], 0
1:088F  c78704040100      mov      word ptr [bx + 0x404], 1
1:0895  f79f0a04          neg      word ptr [bx + 0x40a]
1:0899  b81600            mov      ax, 0x16
1:089C  f72ef203          imul     word ptr [0x3f2]
1:08A0  8bd8              mov      bx, ax
1:08A2  8b46fc            mov      ax, word ptr [bp - 4]
1:08A5  89870e04          mov      word ptr [bx + 0x40e], ax
1:08A9  4d                dec      bp
1:08AA  4d                dec      bp
1:08AB  8be5              mov      sp, bp
1:08AD  1f                pop      ds
1:08AE  5d                pop      bp
1:08AF  4d                dec      bp
1:08B0  cb                retf     
1:08B1  1e                push     ds
1:08B2  58                pop      ax
1:08B3  90                nop      
1:08B4  45                inc      bp
1:08B5  55                push     bp
1:08B6  8bec              mov      bp, sp
1:08B8  1e                push     ds
1:08B9  8ed8              mov      ds, ax
1:08BB  b80400            mov      ax, 4
1:08BE  9a35090000        lcall    0, 0x935  ; @1:INT:ord_4(1:0D72)
1:08C3  b81600            mov      ax, 0x16
1:08C6  f72ef203          imul     word ptr [0x3f2]
1:08CA  8bd8              mov      bx, ax
1:08CC  8b870404          mov      ax, word ptr [bx + 0x404]
1:08D0  f7af0c04          imul     word ptr [bx + 0x40c]
1:08D4  03871004          add      ax, word ptr [bx + 0x410]
1:08D8  8946fc            mov      word ptr [bp - 4], ax
1:08DB  3df6ff            cmp      ax, 0xfff6
1:08DE  7c0f              jl       0x8ef
1:08E0  c41eb204          les      bx, ptr [0x4b2]
1:08E4  268b4f04          mov      cx, word ptr es:[bx + 4]
1:08E8  83c10a            add      cx, 0xa
1:08EB  3bc1              cmp      ax, cx
1:08ED  7e20              jle      0x90f
1:08EF  b81600            mov      ax, 0x16
1:08F2  f72ef203          imul     word ptr [0x3f2]
1:08F6  8bd8              mov      bx, ax
1:08F8  8b871004          mov      ax, word ptr [bx + 0x410]
1:08FC  8946fc            mov      word ptr [bp - 4], ax
1:08FF  f79f0c04          neg      word ptr [bx + 0x40c]
1:0903  c78704040000      mov      word ptr [bx + 0x404], 0
1:0909  c78702040100      mov      word ptr [bx + 0x402], 1
1:090F  b81600            mov      ax, 0x16
1:0912  f72ef203          imul     word ptr [0x3f2]
1:0916  8bd8              mov      bx, ax
1:0918  8b46fc            mov      ax, word ptr [bp - 4]
1:091B  89871004          mov      word ptr [bx + 0x410], ax
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
1:0931  b80400            mov      ax, 4
1:0934  9a7c090000        lcall    0, 0x97c  ; @1:INT:ord_4(1:0D72)
1:0939  c746fc0000        mov      word ptr [bp - 4], 0
1:093E  eb1e              jmp      0x95e
1:0940  b81600            mov      ax, 0x16
1:0943  f76efc            imul     word ptr [bp - 4]
1:0946  8bd8              mov      bx, ax
1:0948  ff871204          inc      word ptr [bx + 0x412]
1:094C  a1f403            mov      ax, word ptr [0x3f4]
1:094F  39871204          cmp      word ptr [bx + 0x412], ax
1:0953  7c06              jl       0x95b
1:0955  c78712040100      mov      word ptr [bx + 0x412], 1
1:095B  ff46fc            inc      word ptr [bp - 4]
1:095E  a11000            mov      ax, word ptr [0x10]
1:0961  3946fc            cmp      word ptr [bp - 4], ax
1:0964  7cda              jl       0x940
1:0966  4d                dec      bp
1:0967  4d                dec      bp
1:0968  8be5              mov      sp, bp
1:096A  1f                pop      ds
1:096B  5d                pop      bp
1:096C  4d                dec      bp
1:096D  cb                retf     
1:096E  1e                push     ds
1:096F  58                pop      ax
1:0970  90                nop      
1:0971  45                inc      bp
1:0972  55                push     bp
1:0973  8bec              mov      bp, sp
1:0975  1e                push     ds
1:0976  8ed8              mov      ds, ax
1:0978  b80400            mov      ax, 4
1:097B  9ac4090000        lcall    0, 0x9c4  ; @1:INT:ord_4(1:0D72)
1:0980  c746fc0000        mov      word ptr [bp - 4], 0
1:0985  9aea030000        lcall    0, 0x3ea  ; @1:INT:ord_5(1:0E38)
1:098A  99                cdq      
1:098B  f73e8403          idiv     word ptr [0x384]
1:098F  42                inc      dx
1:0990  42                inc      dx
1:0991  b80b00            mov      ax, 0xb
1:0994  8bca              mov      cx, dx
1:0996  f72ef203          imul     word ptr [0x3f2]
1:099A  8bd8              mov      bx, ax
1:099C  035efc            add      bx, word ptr [bp - 4]
1:099F  d1e3              shl      bx, 1
1:09A1  898f0604          mov      word ptr [bx + 0x406], cx
1:09A5  ff46fc            inc      word ptr [bp - 4]
1:09A8  837efc04          cmp      word ptr [bp - 4], 4
1:09AC  7cd7              jl       0x985
1:09AE  4d                dec      bp
1:09AF  4d                dec      bp
1:09B0  8be5              mov      sp, bp
1:09B2  1f                pop      ds
1:09B3  5d                pop      bp
1:09B4  4d                dec      bp
1:09B5  cb                retf     
1:09B6  1e                push     ds
1:09B7  58                pop      ax
1:09B8  90                nop      
1:09B9  45                inc      bp
1:09BA  55                push     bp
1:09BB  8bec              mov      bp, sp
1:09BD  1e                push     ds
1:09BE  8ed8              mov      ds, ax
1:09C0  b80400            mov      ax, 4
1:09C3  9ac4030000        lcall    0, 0x3c4  ; @1:INT:ord_4(1:0D72)
1:09C8  56                push     si
1:09C9  ff361200          push     word ptr [0x12]
1:09CD  9ace030000        lcall    0, 0x3ce  ; @1:KERNEL.LocalLock
1:09D2  a31400            mov      word ptr [0x14], ax
1:09D5  c706f2030000      mov      word ptr [0x3f2], 0
1:09DB  e9d200            jmp      0xab0
1:09DE  833ef00365        cmp      word ptr [0x3f0], 0x65
1:09E3  7d25              jge      0xa0a
1:09E5  2bc0              sub      ax, ax
1:09E7  50                push     ax
1:09E8  b86600            mov      ax, 0x66
1:09EB  f72ef203          imul     word ptr [0x3f2]
1:09EF  0306ae04          add      ax, word ptr [0x4ae]
1:09F3  b90600            mov      cx, 6
1:09F6  f7e9              imul     cx
1:09F8  8bd8              mov      bx, ax
1:09FA  031e1400          add      bx, word ptr [0x14]
1:09FE  ff7702            push     word ptr [bx + 2]
1:0A01  ff37              push     word ptr [bx]
1:0A03  0e                push     cs
1:0A04  e89efd            call     0x7a5
1:0A07  83c406            add      sp, 6
1:0A0A  0e                push     cs
1:0A0B  e82dfe            call     0x83b
1:0A0E  0e                push     cs
1:0A0F  e89ffe            call     0x8b1
1:0A12  b81600            mov      ax, 0x16
1:0A15  f72ef203          imul     word ptr [0x3f2]
1:0A19  8bd8              mov      bx, ax
1:0A1B  8b871204          mov      ax, word ptr [bx + 0x412]
1:0A1F  8bc8              mov      cx, ax
1:0A21  b86600            mov      ax, 0x66
1:0A24  f72ef203          imul     word ptr [0x3f2]
1:0A28  0306ae04          add      ax, word ptr [0x4ae]
1:0A2C  bb0600            mov      bx, 6
1:0A2F  f7eb              imul     bx
1:0A31  8bf0              mov      si, ax
1:0A33  8b1e1400          mov      bx, word ptr [0x14]
1:0A37  894804            mov      word ptr [bx + si + 4], cx
1:0A3A  b81600            mov      ax, 0x16
1:0A3D  f72ef203          imul     word ptr [0x3f2]
1:0A41  8bd8              mov      bx, ax
1:0A43  8b870e04          mov      ax, word ptr [bx + 0x40e]
1:0A47  8bc8              mov      cx, ax
1:0A49  b86600            mov      ax, 0x66
1:0A4C  f72ef203          imul     word ptr [0x3f2]
1:0A50  0306ae04          add      ax, word ptr [0x4ae]
1:0A54  bb0600            mov      bx, 6
1:0A57  f7eb              imul     bx
1:0A59  8bd8              mov      bx, ax
1:0A5B  8b361400          mov      si, word ptr [0x14]
1:0A5F  8908              mov      word ptr [bx + si], cx
1:0A61  b81600            mov      ax, 0x16
1:0A64  f72ef203          imul     word ptr [0x3f2]
1:0A68  8bd8              mov      bx, ax
1:0A6A  8b871004          mov      ax, word ptr [bx + 0x410]
1:0A6E  8bc8              mov      cx, ax
1:0A70  b86600            mov      ax, 0x66
1:0A73  f72ef203          imul     word ptr [0x3f2]
1:0A77  0306ae04          add      ax, word ptr [0x4ae]
1:0A7B  bb0600            mov      bx, 6
1:0A7E  f7eb              imul     bx
1:0A80  8bf0              mov      si, ax
1:0A82  8b1e1400          mov      bx, word ptr [0x14]
1:0A86  894802            mov      word ptr [bx + si + 2], cx
1:0A89  833efc0300        cmp      word ptr [0x3fc], 0
1:0A8E  741c              je       0xaac
1:0A90  b81600            mov      ax, 0x16
1:0A93  f72ef203          imul     word ptr [0x3f2]
1:0A97  8bd8              mov      bx, ax
1:0A99  ffb71204          push     word ptr [bx + 0x412]
1:0A9D  ffb71004          push     word ptr [bx + 0x410]
1:0AA1  ffb70e04          push     word ptr [bx + 0x40e]
1:0AA5  0e                push     cs
1:0AA6  e8fcfc            call     0x7a5
1:0AA9  83c406            add      sp, 6
1:0AAC  ff06f203          inc      word ptr [0x3f2]
1:0AB0  a11000            mov      ax, word ptr [0x10]
1:0AB3  3906f203          cmp      word ptr [0x3f2], ax
1:0AB7  7d03              jge      0xabc
1:0AB9  e922ff            jmp      0x9de
1:0ABC  833ef00365        cmp      word ptr [0x3f0], 0x65
1:0AC1  7d13              jge      0xad6
1:0AC3  a1f003            mov      ax, word ptr [0x3f0]
1:0AC6  ff06ae04          inc      word ptr [0x4ae]
1:0ACA  3906ae04          cmp      word ptr [0x4ae], ax
1:0ACE  7c06              jl       0xad6
1:0AD0  c706ae040000      mov      word ptr [0x4ae], 0
1:0AD6  813eb004f401      cmp      word ptr [0x4b0], 0x1f4
1:0ADC  7d19              jge      0xaf7
1:0ADE  a1b004            mov      ax, word ptr [0x4b0]
1:0AE1  ff068203          inc      word ptr [0x382]
1:0AE5  39068203          cmp      word ptr [0x382], ax
1:0AE9  7e28              jle      0xb13
1:0AEB  0e                push     cs
1:0AEC  e838fe            call     0x927
1:0AEF  c70682030000      mov      word ptr [0x382], 0
1:0AF5  eb1c              jmp      0xb13
1:0AF7  c746fc0000        mov      word ptr [bp - 4], 0
1:0AFC  b81600            mov      ax, 0x16
1:0AFF  f76efc            imul     word ptr [bp - 4]
1:0B02  8bd8              mov      bx, ax
1:0B04  c78712040100      mov      word ptr [bx + 0x412], 1
1:0B0A  ff46fc            inc      word ptr [bp - 4]
1:0B0D  837efc08          cmp      word ptr [bp - 4], 8
1:0B11  7ce9              jl       0xafc
1:0B13  a1b604            mov      ax, word ptr [0x4b6]
1:0B16  ff06ea03          inc      word ptr [0x3ea]
1:0B1A  3906ea03          cmp      word ptr [0x3ea], ax
1:0B1E  7e0a              jle      0xb2a
1:0B20  c706ea030000      mov      word ptr [0x3ea], 0
1:0B26  0e                push     cs
1:0B27  e844fe            call     0x96e
1:0B2A  ff361200          push     word ptr [0x12]
1:0B2E  9a26070000        lcall    0, 0x726  ; @1:KERNEL.LocalUnlock
1:0B33  2bc0              sub      ax, ax
1:0B35  5e                pop      si
1:0B36  4d                dec      bp
1:0B37  4d                dec      bp
1:0B38  8be5              mov      sp, bp
1:0B3A  1f                pop      ds
1:0B3B  5d                pop      bp
1:0B3C  4d                dec      bp
1:0B3D  cb                retf     

; ===== EXPORT:ord_16(#16) =====
1:0B3E  1e                push     ds
1:0B3F  58                pop      ax
1:0B40  90                nop      
1:0B41  45                inc      bp
1:0B42  55                push     bp
1:0B43  8bec              mov      bp, sp
1:0B45  1e                push     ds
1:0B46  8ed8              mov      ds, ax
1:0B48  33c0              xor      ax, ax
1:0B4A  9a790b0000        lcall    0, 0xb79  ; @1:INT:ord_4(1:0D72)
1:0B4F  837e0a00          cmp      word ptr [bp + 0xa], 0
1:0B53  7504              jne      0xb59
1:0B55  2bc0              sub      ax, ax
1:0B57  eb09              jmp      0xb62
1:0B59  8b460e            mov      ax, word ptr [bp + 0xe]
1:0B5C  a3fa03            mov      word ptr [0x3fa], ax
1:0B5F  b80100            mov      ax, 1
1:0B62  4d                dec      bp
1:0B63  4d                dec      bp
1:0B64  8be5              mov      sp, bp
1:0B66  1f                pop      ds
1:0B67  5d                pop      bp
1:0B68  4d                dec      bp
1:0B69  ca0a00            retf     0xa

; ===== EXPORT:WEP(#2) =====
1:0B6C  1e                push     ds
1:0B6D  58                pop      ax
1:0B6E  90                nop      
1:0B6F  45                inc      bp
1:0B70  55                push     bp
1:0B71  8bec              mov      bp, sp
1:0B73  1e                push     ds
1:0B74  8ed8              mov      ds, ax
1:0B76  33c0              xor      ax, ax
1:0B78  9a980b0000        lcall    0, 0xb98  ; @1:INT:ord_4(1:0D72)
1:0B7D  b80100            mov      ax, 1
1:0B80  4d                dec      bp
1:0B81  4d                dec      bp
1:0B82  8be5              mov      sp, bp
1:0B84  1f                pop      ds
1:0B85  5d                pop      bp
1:0B86  4d                dec      bp
1:0B87  ca0200            retf     2

; ===== EXPORT:MODULE(#1) =====
1:0B8A  1e                push     ds
1:0B8B  58                pop      ax
1:0B8C  90                nop      
1:0B8D  45                inc      bp
1:0B8E  55                push     bp
1:0B8F  8bec              mov      bp, sp
1:0B91  1e                push     ds
1:0B92  8ed8              mov      ds, ax
1:0B94  b80a00            mov      ax, 0xa
1:0B97  9ab3070000        lcall    0, 0x7b3  ; @1:INT:ord_4(1:0D72)
1:0B9C  56                push     si
1:0B9D  8b4608            mov      ax, word ptr [bp + 8]
1:0BA0  a38603            mov      word ptr [0x386], ax
1:0BA3  8b4606            mov      ax, word ptr [bp + 6]
1:0BA6  a38003            mov      word ptr [0x380], ax
1:0BA9  50                push     ax
1:0BAA  9aca0b0000        lcall    0, 0xbca  ; @1:KERNEL.GlobalLock
1:0BAF  a3e603            mov      word ptr [0x3e6], ax
1:0BB2  8916e803          mov      word ptr [0x3e8], dx
1:0BB6  8bc2              mov      ax, dx
1:0BB8  0b06e603          or       ax, word ptr [0x3e6]
1:0BBC  7503              jne      0xbc1
1:0BBE  e96a01            jmp      0xd2b
1:0BC1  c41ee603          les      bx, ptr [0x3e6]
1:0BC5  26ff7720          push     word ptr es:[bx + 0x20]
1:0BC9  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalLock
1:0BCE  a3b204            mov      word ptr [0x4b2], ax
1:0BD1  8916b404          mov      word ptr [0x4b4], dx
1:0BD5  8bc2              mov      ax, dx
1:0BD7  0b06b204          or       ax, word ptr [0x4b2]
1:0BDB  7503              jne      0xbe0
1:0BDD  e94201            jmp      0xd22
1:0BE0  8b460a            mov      ax, word ptr [bp + 0xa]
1:0BE3  e90801            jmp      0xcee
1:0BE6  c41ee603          les      bx, ptr [0x3e6]
1:0BEA  26837f1465        cmp      word ptr es:[bx + 0x14], 0x65
1:0BEF  7c0f              jl       0xc00
1:0BF1  26817f36f400      cmp      word ptr es:[bx + 0x36], 0xf4
1:0BF7  7507              jne      0xc00
1:0BF9  26837f3878        cmp      word ptr es:[bx + 0x38], 0x78
1:0BFE  740e              je       0xc0e
1:0C00  c70616000000      mov      word ptr [0x16], 0
1:0C06  c746fc0500        mov      word ptr [bp - 4], 5
1:0C0B  e90701            jmp      0xd15
1:0C0E  c70616000100      mov      word ptr [0x16], 1
1:0C14  e9fe00            jmp      0xd15
1:0C17  b84803            mov      ax, 0x348
1:0C1A  50                push     ax
1:0C1B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_15(1:0DC2)
1:0C20  5b                pop      bx
1:0C21  ff364803          push     word ptr [0x348]
1:0C25  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_14(1:0E24)
1:0C2A  5b                pop      bx
1:0C2B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_13(1:0019)
1:0C30  eb13              jmp      0xc45
1:0C32  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:021B)
1:0C37  eb0c              jmp      0xc45
1:0C39  833e160000        cmp      word ptr [0x16], 0
1:0C3E  740b              je       0xc4b
1:0C40  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:0270)
1:0C45  8946fc            mov      word ptr [bp - 4], ax
1:0C48  e9ca00            jmp      0xd15
1:0C4B  ff368603          push     word ptr [0x386]
1:0C4F  b800ff            mov      ax, 0xff00
1:0C52  baff00            mov      dx, 0xff
1:0C55  52                push     dx
1:0C56  50                push     ax
1:0C57  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextColor
1:0C5C  ff368603          push     word ptr [0x386]
1:0C60  2bc0              sub      ax, ax
1:0C62  50                push     ax
1:0C63  50                push     ax
1:0C64  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkColor
1:0C69  ff368603          push     word ptr [0x386]
1:0C6D  2bc0              sub      ax, ax
1:0C6F  50                push     ax
1:0C70  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextAlign
1:0C75  ff368603          push     word ptr [0x386]
1:0C79  b80100            mov      ax, 1
1:0C7C  50                push     ax
1:0C7D  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkMode
1:0C82  ff368603          push     word ptr [0x386]
1:0C86  2bc0              sub      ax, ax
1:0C88  50                push     ax
1:0C89  50                push     ax
1:0C8A  b81800            mov      ax, 0x18
1:0C8D  1e                push     ds
1:0C8E  50                push     ax
1:0C8F  50                push     ax
1:0C90  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:0DA6)
1:0C95  5b                pop      bx
1:0C96  50                push     ax
1:0C97  9affff0000        lcall    0, 0xffff  ; @1:GDI.TextOut
1:0C9C  eb77              jmp      0xd15
1:0C9E  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:02B9)
1:0CA3  eba0              jmp      0xc45
1:0CA5  a1fa03            mov      ax, word ptr [0x3fa]
1:0CA8  c41eb204          les      bx, ptr [0x4b2]
1:0CAC  26894716          mov      word ptr es:[bx + 0x16], ax
1:0CB0  c746f60000        mov      word ptr [bp - 0xa], 0
1:0CB5  8b46f6            mov      ax, word ptr [bp - 0xa]
1:0CB8  8bf0              mov      si, ax
1:0CBA  d1e6              shl      si, 1
1:0CBC  40                inc      ax
1:0CBD  c41eb204          les      bx, ptr [0x4b2]
1:0CC1  2689400e          mov      word ptr es:[bx + si + 0xe], ax
1:0CC5  ff46f6            inc      word ptr [bp - 0xa]
1:0CC8  837ef604          cmp      word ptr [bp - 0xa], 4
1:0CCC  7ce7              jl       0xcb5
1:0CCE  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:032B)
1:0CD3  e96fff            jmp      0xc45
1:0CD6  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:0346)
1:0CDB  e967ff            jmp      0xc45
1:0CDE  8b460a            mov      ax, word ptr [bp + 0xa]
1:0CE1  2d0700            sub      ax, 7
1:0CE4  50                push     ax
1:0CE5  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_6(1:0361)
1:0CEA  5b                pop      bx
1:0CEB  e957ff            jmp      0xc45
1:0CEE  3d0c00            cmp      ax, 0xc
1:0CF1  7722              ja       0xd15
1:0CF3  d1e0              shl      ax, 1
1:0CF5  93                xchg     bx, ax
1:0CF6  2effa7fb0c        jmp      word ptr cs:[bx + 0xcfb]
1:0CFB  17                pop      ss
1:0CFC  0c32              or       al, 0x32
1:0CFE  0c39              or       al, 0x39
1:0D00  0c9e              or       al, 0x9e
1:0D02  0c15              or       al, 0x15
1:0D04  0da50c            or       ax, 0xca5
1:0D07  d6                salc     
1:0D08  0cde              or       al, 0xde
1:0D0A  0cde              or       al, 0xde
1:0D0C  0cde              or       al, 0xde
1:0D0E  0cde              or       al, 0xde
1:0D10  0c15              or       al, 0x15
1:0D12  0de60b            or       ax, 0xbe6
1:0D15  c41ee603          les      bx, ptr [0x3e6]
1:0D19  26ff7720          push     word ptr es:[bx + 0x20]
1:0D1D  9a270d0000        lcall    0, 0xd27  ; @1:KERNEL.GlobalUnlock
1:0D22  ff368003          push     word ptr [0x380]
1:0D26  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalUnlock
1:0D2B  8b46fc            mov      ax, word ptr [bp - 4]
1:0D2E  5e                pop      si
1:0D2F  4d                dec      bp
1:0D30  4d                dec      bp
1:0D31  8be5              mov      sp, bp
1:0D33  1f                pop      ds
1:0D34  5d                pop      bp
1:0D35  4d                dec      bp
1:0D36  ca0600            retf     6
1:0D39  0000              add      byte ptr [bx + si], al
1:0D3B  0000              add      byte ptr [bx + si], al
1:0D3D  0000              add      byte ptr [bx + si], al
1:0D3F  0000              add      byte ptr [bx + si], al
1:0D41  0000              add      byte ptr [bx + si], al
1:0D43  0000              add      byte ptr [bx + si], al
1:0D45  0000              add      byte ptr [bx + si], al
1:0D47  0000              add      byte ptr [bx + si], al
1:0D49  0000              add      byte ptr [bx + si], al
1:0D4B  0000              add      byte ptr [bx + si], al
1:0D4D  0000              add      byte ptr [bx + si], al
1:0D4F  00c3              add      bl, al
1:0D51  005b40            add      byte ptr [bp + di + 0x40], bl
1:0D54  24fe              and      al, 0xfe
1:0D56  2bc4              sub      ax, sp
1:0D58  7345              jae      0xd9f
1:0D5A  f7d8              neg      ax
1:0D5C  3639060a00        cmp      word ptr ss:[0xa], ax
1:0D61  773c              ja       0xd9f
1:0D63  3639060c00        cmp      word ptr ss:[0xc], ax
1:0D68  7604              jbe      0xd6e
1:0D6A  36a30c00          mov      word ptr ss:[0xc], ax
1:0D6E  8be0              mov      sp, ax
1:0D70  ffe3              jmp      bx

; ===== EXPORT:ord_4(#4) =====
1:0D72  5b                pop      bx
1:0D73  5a                pop      dx
1:0D74  40                inc      ax
1:0D75  24fe              and      al, 0xfe
1:0D77  2bc4              sub      ax, sp
1:0D79  7319              jae      0xd94
1:0D7B  f7d8              neg      ax
1:0D7D  3639060a00        cmp      word ptr ss:[0xa], ax
1:0D82  7710              ja       0xd94
1:0D84  3639060c00        cmp      word ptr ss:[0xc], ax
1:0D89  7604              jbe      0xd8f
1:0D8B  36a30c00          mov      word ptr ss:[0xc], ax
1:0D8F  8be0              mov      sp, ax
1:0D91  52                push     dx
1:0D92  53                push     bx
1:0D93  cb                retf     
1:0D94  8b165200          mov      dx, word ptr [0x52]
1:0D98  42                inc      dx
1:0D99  7404              je       0xd9f
1:0D9B  ff2e5200          ljmp     [0x52]
1:0D9F  b80000            mov      ax, 0
1:0DA2  e9cd00            jmp      0xe72
1:0DA5  00558b            add      byte ptr [di - 0x75], dl
1:0DA8  ec                in       al, dx
1:0DA9  8bd7              mov      dx, di
1:0DAB  8cd8              mov      ax, ds
1:0DAD  8ec0              mov      es, ax
1:0DAF  8b7e06            mov      di, word ptr [bp + 6]
1:0DB2  33c0              xor      ax, ax
1:0DB4  b9ffff            mov      cx, 0xffff
1:0DB7  f2ae              repne scasb al, byte ptr es:[di]
1:0DB9  f7d1              not      cx
1:0DBB  49                dec      cx
1:0DBC  91                xchg     cx, ax
1:0DBD  8bfa              mov      di, dx
1:0DBF  5d                pop      bp
1:0DC0  cb                retf     
1:0DC1  008cd890          add      byte ptr [si - 0x6f28], cl
1:0DC5  45                inc      bp
1:0DC6  55                push     bp
1:0DC7  8bec              mov      bp, sp
1:0DC9  1e                push     ds
1:0DCA  8ed8              mov      ds, ax
1:0DCC  56                push     si
1:0DCD  b42a              mov      ah, 0x2a
1:0DCF  cd21              int      0x21
1:0DD1  8bda              mov      bx, dx
1:0DD3  8bf1              mov      si, cx
1:0DD5  b42c              mov      ah, 0x2c
1:0DD7  cd21              int      0x21
1:0DD9  b400              mov      ah, 0
1:0DDB  8ac6              mov      al, dh
1:0DDD  50                push     ax
1:0DDE  8ac1              mov      al, cl
1:0DE0  50                push     ax
1:0DE1  8ac5              mov      al, ch
1:0DE3  50                push     ax
1:0DE4  50                push     ax
1:0DE5  b42a              mov      ah, 0x2a
1:0DE7  cd21              int      0x21