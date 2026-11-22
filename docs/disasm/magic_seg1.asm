File: raw\unpacked\MODULES\MAGIC.AD
Module: 'NMAGIC' ('Graphics Module Library')
CS:IP=1:1538  SS:SP=0:0000  AutoDS=2  Heap=1024  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (3): KERNEL, GDI, USER
Segments (2):
  SEG  1: CODE off=0x00600 len=0x156A min=0x156A flags=0x0D50 relocs=92
  SEG  2: DATA off=0x01D20 len=0x0424 min=0x0424 flags=0x0C71 relocs=0
Exports (29):
  ord   1: SEG1:0B3C flags=0x03 MODULE
  ord   2: SEG1:0B1E flags=0x03 WEP
  ord   3: SEG1:11F8 flags=0x03 ___EXPORTEDSTUB
  ord   4: SEG1:0DE8 flags=0x00 
  ord   5: SEG1:0D22 flags=0x00 
  ord   6: SEG1:05CE flags=0x00 
  ord   7: SEG1:05B3 flags=0x00 
  ord   8: SEG1:0598 flags=0x00 
  ord   9: SEG1:052A flags=0x00 
  ord  10: SEG1:0D56 flags=0x00 
  ord  11: SEG1:0417 flags=0x00 
  ord  12: SEG1:03C9 flags=0x00 
  ord  13: SEG1:0019 flags=0x00 
  ord  14: SEG1:0DD4 flags=0x00 
  ord  15: SEG1:0D72 flags=0x00 
  ord  16: SEG1:0AF0 flags=0x00 
  ord  17: SEG1:0E40 flags=0x00 
  ord  18: SEG1:0F44 flags=0x00 
  ord  19: SEG1:11E8 flags=0x00 
  ord  20: SEG1:10B6 flags=0x00 
  ord  21: SEG1:0F76 flags=0x00 
  ord  22: SEG1:120C flags=0x00 
  ord  23: SEG1:1234 flags=0x00 
  ord  24: SEG1:12D6 flags=0x00 
  ord  25: SEG1:129A flags=0x00 
  ord  26: SEG1:1300 flags=0x00 
  ord  27: SEG1:1238 flags=0x00 
  ord  28: SEG1:0F90 flags=0x00 
  ord  29: SEG1:14A4 flags=0x00 
Resources (7):
  TYPE_1000        #1               off=0x02180 len=   352
  TYPE_1000        #2               off=0x022E0 len=   240
  TYPE_1000        #3               off=0x023D0 len=   144
  TYPE_1000        #4               off=0x02460 len=    96
  TYPE_2000        #10              off=0x024C0 len=    96
  TYPE_2000        #20              off=0x02520 len=    16
  TYPE_2000        #30              off=0x02530 len=   624

1:0000  1e                push     ds
1:0001  58                pop      ax
1:0002  90                nop      
1:0003  45                inc      bp
1:0004  55                push     bp
1:0005  8bec              mov      bp, sp
1:0007  1e                push     ds
1:0008  8ed8              mov      ds, ax
1:000A  33c0              xor      ax, ax
1:000C  9a26000000        lcall    0, 0x26  ; @1:INT:ord_5(1:0D22)
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
1:0025  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_5(1:0D22)
1:002A  56                push     si
1:002B  b86400            mov      ax, 0x64
1:002E  c41e1e04          les      bx, ptr [0x41e]
1:0032  262b4708          sub      ax, word ptr es:[bx + 8]
1:0036  d1e0              shl      ax, 1
1:0038  a31204            mov      word ptr [0x412], ax
1:003B  a3fa03            mov      word ptr [0x3fa], ax
1:003E  b86400            mov      ax, 0x64
1:0041  262b470a          sub      ax, word ptr es:[bx + 0xa]
1:0045  b90500            mov      cx, 5
1:0048  f7e9              imul     cx
1:004A  a31c04            mov      word ptr [0x41c], ax
1:004D  a3f203            mov      word ptr [0x3f2], ax
1:0050  268b470c          mov      ax, word ptr es:[bx + 0xc]
1:0054  a39403            mov      word ptr [0x394], ax
1:0057  268b4706          mov      ax, word ptr es:[bx + 6]
1:005B  3d6400            cmp      ax, 0x64
1:005E  7503              jne      0x63
1:0060  e9fb01            jmp      0x25e
1:0063  7775              ja       0xda
1:0065  0ac0              or       al, al
1:0067  746b              je       0xd4
1:0069  2c0c              sub      al, 0xc
1:006B  7503              jne      0x70
1:006D  e97001            jmp      0x1e0
1:0070  2c06              sub      al, 6
1:0072  7503              jne      0x77
1:0074  e97201            jmp      0x1e9
1:0077  2c06              sub      al, 6
1:0079  7503              jne      0x7e
1:007B  e97401            jmp      0x1f2
1:007E  2c06              sub      al, 6
1:0080  7503              jne      0x85
1:0082  e97601            jmp      0x1fb
1:0085  2c06              sub      al, 6
1:0087  7503              jne      0x8c
1:0089  e97801            jmp      0x204
1:008C  2c06              sub      al, 6
1:008E  7503              jne      0x93
1:0090  e97a01            jmp      0x20d
1:0093  2c06              sub      al, 6
1:0095  7503              jne      0x9a
1:0097  e97c01            jmp      0x216
1:009A  2c06              sub      al, 6
1:009C  7503              jne      0xa1
1:009E  e97e01            jmp      0x21f
1:00A1  2c06              sub      al, 6
1:00A3  7503              jne      0xa8
1:00A5  e98001            jmp      0x228
1:00A8  2c06              sub      al, 6
1:00AA  7503              jne      0xaf
1:00AC  e98201            jmp      0x231
1:00AF  2c06              sub      al, 6
1:00B1  7503              jne      0xb6
1:00B3  e98401            jmp      0x23a
1:00B6  2c06              sub      al, 6
1:00B8  7503              jne      0xbd
1:00BA  e98601            jmp      0x243
1:00BD  2c06              sub      al, 6
1:00BF  7503              jne      0xc4
1:00C1  e98801            jmp      0x24c
1:00C4  2c06              sub      al, 6
1:00C6  7503              jne      0xcb
1:00C8  e98a01            jmp      0x255
1:00CB  2c05              sub      al, 5
1:00CD  7503              jne      0xd2
1:00CF  e98c01            jmp      0x25e
1:00D2  eb06              jmp      0xda
1:00D4  c70604040a00      mov      word ptr [0x404], 0xa
1:00DA  b84200            mov      ax, 0x42
1:00DD  50                push     ax
1:00DE  b8f005            mov      ax, 0x5f0
1:00E1  50                push     ax
1:00E2  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LocalAlloc
1:00E7  a31000            mov      word ptr [0x10], ax
1:00EA  50                push     ax
1:00EB  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LocalLock
1:00F0  a31200            mov      word ptr [0x12], ax
1:00F3  c41ef403          les      bx, ptr [0x3f4]
1:00F7  26837f0a04        cmp      word ptr es:[bx + 0xa], 4
1:00FC  7d03              jge      0x101
1:00FE  e96601            jmp      0x267
1:0101  c706fc031600      mov      word ptr [0x3fc], 0x16
1:0107  2bc0              sub      ax, ax
1:0109  a39803            mov      word ptr [0x398], ax
1:010C  a39603            mov      word ptr [0x396], ax
1:010F  a39a03            mov      word ptr [0x39a], ax
1:0112  c7069c03ff00      mov      word ptr [0x39c], 0xff
1:0118  c706a603ff00      mov      word ptr [0x3a6], 0xff
1:011E  c706a803ff00      mov      word ptr [0x3a8], 0xff
1:0124  b88000            mov      ax, 0x80
1:0127  8bd0              mov      dx, ax
1:0129  a3a203            mov      word ptr [0x3a2], ax
1:012C  8916a403          mov      word ptr [0x3a4], dx
1:0130  a3aa03            mov      word ptr [0x3aa], ax
1:0133  8916ac03          mov      word ptr [0x3ac], dx
1:0137  c706b203ff00      mov      word ptr [0x3b2], 0xff
1:013D  c706b4030000      mov      word ptr [0x3b4], 0
1:0143  99                cdq      
1:0144  a3ae03            mov      word ptr [0x3ae], ax
1:0147  8916b003          mov      word ptr [0x3b0], dx
1:014B  a3b603            mov      word ptr [0x3b6], ax
1:014E  8916b803          mov      word ptr [0x3b8], dx
1:0152  c706be03ffff      mov      word ptr [0x3be], 0xffff
1:0158  c706c0030000      mov      word ptr [0x3c0], 0
1:015E  b88080            mov      ax, 0x8080
1:0161  2bd2              sub      dx, dx
1:0163  a3ba03            mov      word ptr [0x3ba], ax
1:0166  8916bc03          mov      word ptr [0x3bc], dx
1:016A  a3c203            mov      word ptr [0x3c2], ax
1:016D  8916c403          mov      word ptr [0x3c4], dx
1:0171  c706c6035555      mov      word ptr [0x3c6], 0x5555
1:0177  c706c8035500      mov      word ptr [0x3c8], 0x55
1:017D  c706ca03ffff      mov      word ptr [0x3ca], 0xffff
1:0183  c706cc03ff00      mov      word ptr [0x3cc], 0xff
1:0189  c706ce03aaaa      mov      word ptr [0x3ce], 0xaaaa
1:018F  c706d003aa00      mov      word ptr [0x3d0], 0xaa
1:0195  c706d60300ff      mov      word ptr [0x3d6], 0xff00
1:019B  8916d803          mov      word ptr [0x3d8], dx
1:019F  b80080            mov      ax, 0x8000
1:01A2  a3d203            mov      word ptr [0x3d2], ax
1:01A5  8916d403          mov      word ptr [0x3d4], dx
1:01A9  a3da03            mov      word ptr [0x3da], ax
1:01AC  8916dc03          mov      word ptr [0x3dc], dx
1:01B0  c706e20300ff      mov      word ptr [0x3e2], 0xff00
1:01B6  c706e403ff00      mov      word ptr [0x3e4], 0xff
1:01BC  ba8000            mov      dx, 0x80
1:01BF  a3de03            mov      word ptr [0x3de], ax
1:01C2  8916e003          mov      word ptr [0x3e0], dx
1:01C6  a3e603            mov      word ptr [0x3e6], ax
1:01C9  8916e803          mov      word ptr [0x3e8], dx
1:01CD  2bc0              sub      ax, ax
1:01CF  a39e03            mov      word ptr [0x39e], ax
1:01D2  8916a003          mov      word ptr [0x3a0], dx
1:01D6  a3ea03            mov      word ptr [0x3ea], ax
1:01D9  8916ec03          mov      word ptr [0x3ec], dx
1:01DD  e9a100            jmp      0x281
1:01E0  c70604041400      mov      word ptr [0x404], 0x14
1:01E6  e9f1fe            jmp      0xda
1:01E9  c70604041e00      mov      word ptr [0x404], 0x1e
1:01EF  e9e8fe            jmp      0xda
1:01F2  c70604042800      mov      word ptr [0x404], 0x28
1:01F8  e9dffe            jmp      0xda
1:01FB  c70604043200      mov      word ptr [0x404], 0x32
1:0201  e9d6fe            jmp      0xda
1:0204  c70604043c00      mov      word ptr [0x404], 0x3c
1:020A  e9cdfe            jmp      0xda
1:020D  c70604044600      mov      word ptr [0x404], 0x46
1:0213  e9c4fe            jmp      0xda
1:0216  c70604045000      mov      word ptr [0x404], 0x50
1:021C  e9bbfe            jmp      0xda
1:021F  c70604045a00      mov      word ptr [0x404], 0x5a
1:0225  e9b2fe            jmp      0xda
1:0228  c70604046400      mov      word ptr [0x404], 0x64
1:022E  e9a9fe            jmp      0xda
1:0231  c70604046e00      mov      word ptr [0x404], 0x6e
1:0237  e9a0fe            jmp      0xda
1:023A  c70604047800      mov      word ptr [0x404], 0x78
1:0240  e997fe            jmp      0xda
1:0243  c70604048200      mov      word ptr [0x404], 0x82
1:0249  e98efe            jmp      0xda
1:024C  c70604048c00      mov      word ptr [0x404], 0x8c
1:0252  e985fe            jmp      0xda
1:0255  c70604049600      mov      word ptr [0x404], 0x96
1:025B  e97cfe            jmp      0xda
1:025E  c70604049700      mov      word ptr [0x404], 0x97
1:0264  e973fe            jmp      0xda
1:0267  2bc0              sub      ax, ax
1:0269  a39803            mov      word ptr [0x398], ax
1:026C  a39603            mov      word ptr [0x396], ax
1:026F  c7069a03ffff      mov      word ptr [0x39a], 0xffff
1:0275  c7069c03ff00      mov      word ptr [0x39c], 0xff
1:027B  c706fc030200      mov      word ptr [0x3fc], 2
1:0281  26837f0a08        cmp      word ptr es:[bx + 0xa], 8
1:0286  7506              jne      0x28e
1:0288  c706fc03eb00      mov      word ptr [0x3fc], 0xeb
1:028E  c7061a040c00      mov      word ptr [0x41a], 0xc
1:0294  813e04049700      cmp      word ptr [0x404], 0x97
1:029A  7506              jne      0x2a2
1:029C  c7061a040600      mov      word ptr [0x41a], 6
1:02A2  39061804          cmp      word ptr [0x418], ax
1:02A6  7e54              jle      0x2fc
1:02A8  a30204            mov      word ptr [0x402], ax
1:02AB  eb46              jmp      0x2f3
1:02AD  b90a00            mov      cx, 0xa
1:02B0  f7e9              imul     cx
1:02B2  8bd8              mov      bx, ax
1:02B4  8b361200          mov      si, word ptr [0x12]
1:02B8  c7000000          mov      word ptr [bx + si], 0
1:02BC  8bc1              mov      ax, cx
1:02BE  f72e0204          imul     word ptr [0x402]
1:02C2  8bf0              mov      si, ax
1:02C4  8b1e1200          mov      bx, word ptr [0x12]
1:02C8  c740040000        mov      word ptr [bx + si + 4], 0
1:02CD  8bc1              mov      ax, cx
1:02CF  f72e0204          imul     word ptr [0x402]
1:02D3  8bf0              mov      si, ax
1:02D5  8b1e1200          mov      bx, word ptr [0x12]
1:02D9  c740020000        mov      word ptr [bx + si + 2], 0
1:02DE  8bc1              mov      ax, cx
1:02E0  f72e0204          imul     word ptr [0x402]
1:02E4  8bf0              mov      si, ax
1:02E6  8b1e1200          mov      bx, word ptr [0x12]
1:02EA  c740060000        mov      word ptr [bx + si + 6], 0
1:02EF  ff060204          inc      word ptr [0x402]
1:02F3  a10204            mov      ax, word ptr [0x402]
1:02F6  39061804          cmp      word ptr [0x418], ax
1:02FA  7fb1              jg       0x2ad
1:02FC  9a15030000        lcall    0, 0x315  ; @1:INT:ord_4(1:0DE8)
1:0301  c41e1e04          les      bx, ptr [0x41e]
1:0305  268b4f02          mov      cx, word ptr es:[bx + 2]
1:0309  49                dec      cx
1:030A  49                dec      cx
1:030B  99                cdq      
1:030C  f7f9              idiv     cx
1:030E  42                inc      dx
1:030F  42                inc      dx
1:0310  89160e04          mov      word ptr [0x40e], dx
1:0314  9a2d030000        lcall    0, 0x32d  ; @1:INT:ord_4(1:0DE8)
1:0319  c41e1e04          les      bx, ptr [0x41e]
1:031D  268b4f04          mov      cx, word ptr es:[bx + 4]
1:0321  49                dec      cx
1:0322  49                dec      cx
1:0323  99                cdq      
1:0324  f7f9              idiv     cx
1:0326  42                inc      dx
1:0327  42                inc      dx
1:0328  89161404          mov      word ptr [0x414], dx
1:032C  9a3f030000        lcall    0, 0x33f  ; @1:INT:ord_4(1:0DE8)
1:0331  c41e1e04          les      bx, ptr [0x41e]
1:0335  99                cdq      
1:0336  26f77f02          idiv     word ptr es:[bx + 2]
1:033A  89161004          mov      word ptr [0x410], dx
1:033E  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_4(1:0DE8)
1:0343  c41e1e04          les      bx, ptr [0x41e]
1:0347  99                cdq      
1:0348  26f77f04          idiv     word ptr es:[bx + 4]
1:034C  89161604          mov      word ptr [0x416], dx
1:0350  a10e04            mov      ax, word ptr [0x40e]
1:0353  26394702          cmp      word ptr es:[bx + 2], ax
1:0357  7c04              jl       0x35d
1:0359  0bc0              or       ax, ax
1:035B  7f06              jg       0x363
1:035D  c7060e040500      mov      word ptr [0x40e], 5
1:0363  a11404            mov      ax, word ptr [0x414]
1:0366  26394704          cmp      word ptr es:[bx + 4], ax
1:036A  7c04              jl       0x370
1:036C  0bc0              or       ax, ax
1:036E  7f06              jg       0x376
1:0370  c70614040500      mov      word ptr [0x414], 5
1:0376  a11004            mov      ax, word ptr [0x410]
1:0379  26394702          cmp      word ptr es:[bx + 2], ax
1:037D  7c04              jl       0x383
1:037F  0bc0              or       ax, ax
1:0381  7f06              jg       0x389
1:0383  c70610040500      mov      word ptr [0x410], 5
1:0389  8bc2              mov      ax, dx
1:038B  26394704          cmp      word ptr es:[bx + 4], ax
1:038F  7c04              jl       0x395
1:0391  0bc0              or       ax, ax
1:0393  7f06              jg       0x39b
1:0395  c70616040500      mov      word ptr [0x416], 5
1:039B  c706ee030100      mov      word ptr [0x3ee], 1
1:03A1  2bc0              sub      ax, ax
1:03A3  a3fe03            mov      word ptr [0x3fe], ax
1:03A6  a39203            mov      word ptr [0x392], ax
1:03A9  a10404            mov      ax, word ptr [0x404]
1:03AC  a31804            mov      word ptr [0x418], ax
1:03AF  c7062204bc02      mov      word ptr [0x422], 0x2bc
1:03B5  ff361000          push     word ptr [0x10]
1:03B9  9a1b050000        lcall    0, 0x51b  ; @1:KERNEL.LocalUnlock
1:03BE  2bc0              sub      ax, ax
1:03C0  5e                pop      si
1:03C1  4d                dec      bp
1:03C2  4d                dec      bp
1:03C3  8be5              mov      sp, bp
1:03C5  1f                pop      ds
1:03C6  5d                pop      bp
1:03C7  4d                dec      bp
1:03C8  cb                retf     

; ===== EXPORT:ord_12(#12) =====
1:03C9  1e                push     ds
1:03CA  58                pop      ax
1:03CB  90                nop      
1:03CC  45                inc      bp
1:03CD  55                push     bp
1:03CE  8bec              mov      bp, sp
1:03D0  1e                push     ds
1:03D1  8ed8              mov      ds, ax
1:03D3  33c0              xor      ax, ax
1:03D5  9a24040000        lcall    0, 0x424  ; @1:INT:ord_5(1:0D22)
1:03DA  b83003            mov      ax, 0x330
1:03DD  1e                push     ds
1:03DE  50                push     ax
1:03DF  2bc0              sub      ax, ax
1:03E1  50                push     ax
1:03E2  50                push     ax
1:03E3  c41e1e04          les      bx, ptr [0x41e]
1:03E7  26ff7702          push     word ptr es:[bx + 2]
1:03EB  26ff7704          push     word ptr es:[bx + 4]
1:03EF  9a5c050000        lcall    0, 0x55c  ; @1:USER.SetRect
1:03F4  ff36f003          push     word ptr [0x3f0]
1:03F8  b83003            mov      ax, 0x330
1:03FB  1e                push     ds
1:03FC  50                push     ax
1:03FD  b80400            mov      ax, 4
1:0400  50                push     ax
1:0401  9a6e050000        lcall    0, 0x56e  ; @1:GDI.GetStockObject
1:0406  50                push     ax
1:0407  9a74050000        lcall    0, 0x574  ; @1:USER.FillRect
1:040C  b80a00            mov      ax, 0xa
1:040F  4d                dec      bp
1:0410  4d                dec      bp
1:0411  8be5              mov      sp, bp
1:0413  1f                pop      ds
1:0414  5d                pop      bp
1:0415  4d                dec      bp
1:0416  cb                retf     

; ===== EXPORT:ord_11(#11) =====
1:0417  1e                push     ds
1:0418  58                pop      ax
1:0419  90                nop      
1:041A  45                inc      bp
1:041B  55                push     bp
1:041C  8bec              mov      bp, sp
1:041E  1e                push     ds
1:041F  8ed8              mov      ds, ax
1:0421  33c0              xor      ax, ax
1:0423  9a37050000        lcall    0, 0x537  ; @1:INT:ord_5(1:0D22)
1:0428  833e040400        cmp      word ptr [0x404], 0
1:042D  7505              jne      0x434
1:042F  2bc0              sub      ax, ax
1:0431  e9ee00            jmp      0x522
1:0434  a1fa03            mov      ax, word ptr [0x3fa]
1:0437  ff061400          inc      word ptr [0x14]
1:043B  39061400          cmp      word ptr [0x14], ax
1:043F  7cee              jl       0x42f
1:0441  c70614000000      mov      word ptr [0x14], 0
1:0447  ff361000          push     word ptr [0x10]
1:044B  9aec000000        lcall    0, 0xec  ; @1:KERNEL.LocalLock
1:0450  a31200            mov      word ptr [0x12], ax
1:0453  813e04049700      cmp      word ptr [0x404], 0x97
1:0459  7d04              jge      0x45f
1:045B  0e                push     cs
1:045C  e8dd01            call     0x63c
1:045F  833ef80300        cmp      word ptr [0x3f8], 0
1:0464  7504              jne      0x46a
1:0466  0e                push     cs
1:0467  e80306            call     0xa6d
1:046A  b80604            mov      ax, 0x406
1:046D  50                push     ax
1:046E  b80e04            mov      ax, 0x40e
1:0471  50                push     ax
1:0472  0e                push     cs
1:0473  e8fb04            call     0x971
1:0476  5b                pop      bx
1:0477  5b                pop      bx
1:0478  b80804            mov      ax, 0x408
1:047B  50                push     ax
1:047C  b81404            mov      ax, 0x414
1:047F  50                push     ax
1:0480  0e                push     cs
1:0481  e85505            call     0x9d9
1:0484  5b                pop      bx
1:0485  5b                pop      bx
1:0486  b80a04            mov      ax, 0x40a
1:0489  50                push     ax
1:048A  b81004            mov      ax, 0x410
1:048D  50                push     ax
1:048E  0e                push     cs
1:048F  e8df04            call     0x971
1:0492  5b                pop      bx
1:0493  5b                pop      bx
1:0494  b80c04            mov      ax, 0x40c
1:0497  50                push     ax
1:0498  b81604            mov      ax, 0x416
1:049B  50                push     ax
1:049C  0e                push     cs
1:049D  e83905            call     0x9d9
1:04A0  5b                pop      bx
1:04A1  5b                pop      bx
1:04A2  ff36ee03          push     word ptr [0x3ee]
1:04A6  ff361604          push     word ptr [0x416]
1:04AA  ff361004          push     word ptr [0x410]
1:04AE  ff361404          push     word ptr [0x414]
1:04B2  ff360e04          push     word ptr [0x40e]
1:04B6  0e                push     cs
1:04B7  e8c103            call     0x87b
1:04BA  83c40a            add      sp, 0xa
1:04BD  0e                push     cs
1:04BE  e8ae02            call     0x76f
1:04C1  813e1c04f401      cmp      word ptr [0x41c], 0x1f4
1:04C7  7d19              jge      0x4e2
1:04C9  a1f203            mov      ax, word ptr [0x3f2]
1:04CC  ff069203          inc      word ptr [0x392]
1:04D0  39069203          cmp      word ptr [0x392], ax
1:04D4  7e12              jle      0x4e8
1:04D6  0e                push     cs
1:04D7  e86705            call     0xa41
1:04DA  c70692030000      mov      word ptr [0x392], 0
1:04E0  eb06              jmp      0x4e8
1:04E2  c706ee030100      mov      word ptr [0x3ee], 1
1:04E8  a12204            mov      ax, word ptr [0x422]
1:04EB  ff06f803          inc      word ptr [0x3f8]
1:04EF  3906f803          cmp      word ptr [0x3f8], ax
1:04F3  7e06              jle      0x4fb
1:04F5  c706f8030000      mov      word ptr [0x3f8], 0
1:04FB  813e04049700      cmp      word ptr [0x404], 0x97
1:0501  7d13              jge      0x516
1:0503  a11804            mov      ax, word ptr [0x418]
1:0506  ff06fe03          inc      word ptr [0x3fe]
1:050A  3906fe03          cmp      word ptr [0x3fe], ax
1:050E  7c06              jl       0x516
1:0510  c706fe030000      mov      word ptr [0x3fe], 0
1:0516  ff361000          push     word ptr [0x10]
1:051A  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LocalUnlock
1:051F  e90dff            jmp      0x42f
1:0522  4d                dec      bp
1:0523  4d                dec      bp
1:0524  8be5              mov      sp, bp
1:0526  1f                pop      ds
1:0527  5d                pop      bp
1:0528  4d                dec      bp
1:0529  cb                retf     

; ===== EXPORT:ord_9(#9) =====
1:052A  1e                push     ds
1:052B  58                pop      ax
1:052C  90                nop      
1:052D  45                inc      bp
1:052E  55                push     bp
1:052F  8bec              mov      bp, sp
1:0531  1e                push     ds
1:0532  8ed8              mov      ds, ax
1:0534  33c0              xor      ax, ax
1:0536  9aa5050000        lcall    0, 0x5a5  ; @1:INT:ord_5(1:0D22)
1:053B  c41ef403          les      bx, ptr [0x3f4]
1:053F  26837f2800        cmp      word ptr es:[bx + 0x28], 0
1:0544  7532              jne      0x578
1:0546  b83a03            mov      ax, 0x33a
1:0549  1e                push     ds
1:054A  50                push     ax
1:054B  2bc0              sub      ax, ax
1:054D  50                push     ax
1:054E  50                push     ax
1:054F  c41e1e04          les      bx, ptr [0x41e]
1:0553  26ff7702          push     word ptr es:[bx + 2]
1:0557  26ff7704          push     word ptr es:[bx + 4]
1:055B  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:0560  ff36f003          push     word ptr [0x3f0]
1:0564  b83a03            mov      ax, 0x33a
1:0567  1e                push     ds
1:0568  50                push     ax
1:0569  b80400            mov      ax, 4
1:056C  50                push     ax
1:056D  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:0572  50                push     ax
1:0573  9affff0000        lcall    0, 0xffff  ; @1:USER.FillRect
1:0578  833e100000        cmp      word ptr [0x10], 0
1:057D  740f              je       0x58e
1:057F  ff361000          push     word ptr [0x10]
1:0583  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LocalFree
1:0588  c70610000000      mov      word ptr [0x10], 0
1:058E  2bc0              sub      ax, ax
1:0590  4d                dec      bp
1:0591  4d                dec      bp
1:0592  8be5              mov      sp, bp
1:0594  1f                pop      ds
1:0595  5d                pop      bp
1:0596  4d                dec      bp
1:0597  cb                retf     

; ===== EXPORT:ord_8(#8) =====
1:0598  1e                push     ds
1:0599  58                pop      ax
1:059A  90                nop      
1:059B  45                inc      bp
1:059C  55                push     bp
1:059D  8bec              mov      bp, sp
1:059F  1e                push     ds
1:05A0  8ed8              mov      ds, ax
1:05A2  33c0              xor      ax, ax
1:05A4  9ac0050000        lcall    0, 0x5c0  ; @1:INT:ord_5(1:0D22)
1:05A9  2bc0              sub      ax, ax
1:05AB  4d                dec      bp
1:05AC  4d                dec      bp
1:05AD  8be5              mov      sp, bp
1:05AF  1f                pop      ds
1:05B0  5d                pop      bp
1:05B1  4d                dec      bp
1:05B2  cb                retf     

; ===== EXPORT:ord_7(#7) =====
1:05B3  1e                push     ds
1:05B4  58                pop      ax
1:05B5  90                nop      
1:05B6  45                inc      bp
1:05B7  55                push     bp
1:05B8  8bec              mov      bp, sp
1:05BA  1e                push     ds
1:05BB  8ed8              mov      ds, ax
1:05BD  33c0              xor      ax, ax
1:05BF  9adb050000        lcall    0, 0x5db  ; @1:INT:ord_5(1:0D22)
1:05C4  2bc0              sub      ax, ax
1:05C6  4d                dec      bp
1:05C7  4d                dec      bp
1:05C8  8be5              mov      sp, bp
1:05CA  1f                pop      ds
1:05CB  5d                pop      bp
1:05CC  4d                dec      bp
1:05CD  cb                retf     

; ===== EXPORT:ord_6(#6) =====
1:05CE  1e                push     ds
1:05CF  58                pop      ax
1:05D0  90                nop      
1:05D1  45                inc      bp
1:05D2  55                push     bp
1:05D3  8bec              mov      bp, sp
1:05D5  1e                push     ds
1:05D6  8ed8              mov      ds, ax
1:05D8  33c0              xor      ax, ax
1:05DA  9a49060000        lcall    0, 0x649  ; @1:INT:ord_5(1:0D22)
1:05DF  c41ef403          les      bx, ptr [0x3f4]
1:05E3  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:05E8  7404              je       0x5ee
1:05EA  2bc0              sub      ax, ax
1:05EC  eb46              jmp      0x634
1:05EE  8b4606            mov      ax, word ptr [bp + 6]
1:05F1  0bc0              or       ax, ax
1:05F3  7409              je       0x5fe
1:05F5  48                dec      ax
1:05F6  740f              je       0x607
1:05F8  48                dec      ax
1:05F9  7421              je       0x61c
1:05FB  48                dec      ax
1:05FC  75ec              jne      0x5ea
1:05FE  0e                push     cs
1:05FF  e828ff            call     0x52a
1:0602  b80300            mov      ax, 3
1:0605  eb2d              jmp      0x634
1:0607  b86400            mov      ax, 0x64
1:060A  c41e1e04          les      bx, ptr [0x41e]
1:060E  262b4708          sub      ax, word ptr es:[bx + 8]
1:0612  d1e0              shl      ax, 1
1:0614  a31204            mov      word ptr [0x412], ax
1:0617  a3fa03            mov      word ptr [0x3fa], ax
1:061A  ebce              jmp      0x5ea
1:061C  b86400            mov      ax, 0x64
1:061F  c41e1e04          les      bx, ptr [0x41e]
1:0623  262b470a          sub      ax, word ptr es:[bx + 0xa]
1:0627  b90500            mov      cx, 5
1:062A  f7e9              imul     cx
1:062C  a31c04            mov      word ptr [0x41c], ax
1:062F  a3f203            mov      word ptr [0x3f2], ax
1:0632  ebb6              jmp      0x5ea
1:0634  4d                dec      bp
1:0635  4d                dec      bp
1:0636  8be5              mov      sp, bp
1:0638  1f                pop      ds
1:0639  5d                pop      bp
1:063A  4d                dec      bp
1:063B  cb                retf     
1:063C  1e                push     ds
1:063D  58                pop      ax
1:063E  90                nop      
1:063F  45                inc      bp
1:0640  55                push     bp
1:0641  8bec              mov      bp, sp
1:0643  1e                push     ds
1:0644  8ed8              mov      ds, ax
1:0646  33c0              xor      ax, ax
1:0648  9a0d000000        lcall    0, 0xd  ; @1:INT:ord_5(1:0D22)
1:064D  56                push     si
1:064E  b80a00            mov      ax, 0xa
1:0651  f72efe03          imul     word ptr [0x3fe]
1:0655  8bd8              mov      bx, ax
1:0657  8b361200          mov      si, word ptr [0x12]
1:065B  8b00              mov      ax, word ptr [bx + si]
1:065D  a34203            mov      word ptr [0x342], ax
1:0660  03f3              add      si, bx
1:0662  8b4404            mov      ax, word ptr [si + 4]
1:0665  a34603            mov      word ptr [0x346], ax
1:0668  8b4402            mov      ax, word ptr [si + 2]
1:066B  a34403            mov      word ptr [0x344], ax
1:066E  8b4406            mov      ax, word ptr [si + 6]
1:0671  a34803            mov      word ptr [0x348], ax
1:0674  2bc0              sub      ax, ax
1:0676  50                push     ax
1:0677  ff364803          push     word ptr [0x348]
1:067B  ff364403          push     word ptr [0x344]
1:067F  ff364603          push     word ptr [0x346]
1:0683  ff364203          push     word ptr [0x342]
1:0687  0e                push     cs
1:0688  e85d01            call     0x7e8
1:068B  83c40a            add      sp, 0xa
1:068E  a19403            mov      ax, word ptr [0x394]
1:0691  e9c000            jmp      0x754
1:0694  2bc0              sub      ax, ax
1:0696  50                push     ax
1:0697  c41e1e04          les      bx, ptr [0x41e]
1:069B  268b4704          mov      ax, word ptr es:[bx + 4]
1:069F  8bc8              mov      cx, ax
1:06A1  2b064803          sub      ax, word ptr [0x348]
1:06A5  50                push     ax
1:06A6  ff364403          push     word ptr [0x344]
1:06AA  2b0e4603          sub      cx, word ptr [0x346]
1:06AE  51                push     cx
1:06AF  ff364203          push     word ptr [0x342]
1:06B3  0e                push     cs
1:06B4  e83101            call     0x7e8
1:06B7  83c40a            add      sp, 0xa
1:06BA  e9a900            jmp      0x766
1:06BD  2bc0              sub      ax, ax
1:06BF  50                push     ax
1:06C0  ff364803          push     word ptr [0x348]
1:06C4  c41e1e04          les      bx, ptr [0x41e]
1:06C8  268b4702          mov      ax, word ptr es:[bx + 2]
1:06CC  8bc8              mov      cx, ax
1:06CE  2b064403          sub      ax, word ptr [0x344]
1:06D2  50                push     ax
1:06D3  ff364603          push     word ptr [0x346]
1:06D7  2b0e4203          sub      cx, word ptr [0x342]
1:06DB  51                push     cx
1:06DC  ebd5              jmp      0x6b3
1:06DE  2bc0              sub      ax, ax
1:06E0  50                push     ax
1:06E1  c41e1e04          les      bx, ptr [0x41e]
1:06E5  268b4f04          mov      cx, word ptr es:[bx + 4]
1:06E9  8bd1              mov      dx, cx
1:06EB  2b0e4803          sub      cx, word ptr [0x348]
1:06EF  51                push     cx
1:06F0  ff364403          push     word ptr [0x344]
1:06F4  2b164603          sub      dx, word ptr [0x346]
1:06F8  52                push     dx
1:06F9  ff364203          push     word ptr [0x342]
1:06FD  0e                push     cs
1:06FE  e8e700            call     0x7e8
1:0701  83c40a            add      sp, 0xa
1:0704  2bc0              sub      ax, ax
1:0706  50                push     ax
1:0707  ff364803          push     word ptr [0x348]
1:070B  c41e1e04          les      bx, ptr [0x41e]
1:070F  268b4f02          mov      cx, word ptr es:[bx + 2]
1:0713  8bd1              mov      dx, cx
1:0715  2b0e4403          sub      cx, word ptr [0x344]
1:0719  51                push     cx
1:071A  ff364603          push     word ptr [0x346]
1:071E  2b164203          sub      dx, word ptr [0x342]
1:0722  52                push     dx
1:0723  0e                push     cs
1:0724  e8c100            call     0x7e8
1:0727  83c40a            add      sp, 0xa
1:072A  2bc0              sub      ax, ax
1:072C  50                push     ax
1:072D  c41e1e04          les      bx, ptr [0x41e]
1:0731  268b4704          mov      ax, word ptr es:[bx + 4]
1:0735  8bc8              mov      cx, ax
1:0737  2b064803          sub      ax, word ptr [0x348]
1:073B  50                push     ax
1:073C  268b4702          mov      ax, word ptr es:[bx + 2]
1:0740  8bd0              mov      dx, ax
1:0742  2b064403          sub      ax, word ptr [0x344]
1:0746  50                push     ax
1:0747  2b0e4603          sub      cx, word ptr [0x346]
1:074B  51                push     cx
1:074C  2b164203          sub      dx, word ptr [0x342]
1:0750  52                push     dx
1:0751  e95fff            jmp      0x6b3
1:0754  48                dec      ax
1:0755  7503              jne      0x75a
1:0757  e963ff            jmp      0x6bd
1:075A  48                dec      ax
1:075B  7503              jne      0x760
1:075D  e934ff            jmp      0x694
1:0760  48                dec      ax
1:0761  7503              jne      0x766
1:0763  e978ff            jmp      0x6de
1:0766  5e                pop      si
1:0767  4d                dec      bp
1:0768  4d                dec      bp
1:0769  8be5              mov      sp, bp
1:076B  1f                pop      ds
1:076C  5d                pop      bp
1:076D  4d                dec      bp
1:076E  cb                retf     
1:076F  1e                push     ds
1:0770  58                pop      ax
1:0771  90                nop      
1:0772  45                inc      bp
1:0773  55                push     bp
1:0774  8bec              mov      bp, sp
1:0776  1e                push     ds
1:0777  8ed8              mov      ds, ax
1:0779  33c0              xor      ax, ax
1:077B  9af5070000        lcall    0, 0x7f5  ; @1:INT:ord_5(1:0D22)
1:0780  56                push     si
1:0781  b80a00            mov      ax, 0xa
1:0784  f72efe03          imul     word ptr [0x3fe]
1:0788  8bd8              mov      bx, ax
1:078A  8b361200          mov      si, word ptr [0x12]
1:078E  a10e04            mov      ax, word ptr [0x40e]
1:0791  8900              mov      word ptr [bx + si], ax
1:0793  b80a00            mov      ax, 0xa
1:0796  f72efe03          imul     word ptr [0x3fe]
1:079A  8bf0              mov      si, ax
1:079C  8b1e1200          mov      bx, word ptr [0x12]
1:07A0  a11404            mov      ax, word ptr [0x414]
1:07A3  894004            mov      word ptr [bx + si + 4], ax
1:07A6  b80a00            mov      ax, 0xa
1:07A9  f72efe03          imul     word ptr [0x3fe]
1:07AD  8bf0              mov      si, ax
1:07AF  8b1e1200          mov      bx, word ptr [0x12]
1:07B3  a11004            mov      ax, word ptr [0x410]
1:07B6  894002            mov      word ptr [bx + si + 2], ax
1:07B9  b80a00            mov      ax, 0xa
1:07BC  f72efe03          imul     word ptr [0x3fe]
1:07C0  8bf0              mov      si, ax
1:07C2  8b1e1200          mov      bx, word ptr [0x12]
1:07C6  a11604            mov      ax, word ptr [0x416]
1:07C9  894006            mov      word ptr [bx + si + 6], ax
1:07CC  b80a00            mov      ax, 0xa
1:07CF  f72efe03          imul     word ptr [0x3fe]
1:07D3  8bf0              mov      si, ax
1:07D5  8b1e1200          mov      bx, word ptr [0x12]
1:07D9  a1ee03            mov      ax, word ptr [0x3ee]
1:07DC  894008            mov      word ptr [bx + si + 8], ax
1:07DF  5e                pop      si
1:07E0  4d                dec      bp
1:07E1  4d                dec      bp
1:07E2  8be5              mov      sp, bp
1:07E4  1f                pop      ds
1:07E5  5d                pop      bp
1:07E6  4d                dec      bp
1:07E7  cb                retf     
1:07E8  1e                push     ds
1:07E9  58                pop      ax
1:07EA  90                nop      
1:07EB  45                inc      bp
1:07EC  55                push     bp
1:07ED  8bec              mov      bp, sp
1:07EF  1e                push     ds
1:07F0  8ed8              mov      ds, ax
1:07F2  33c0              xor      ax, ax
1:07F4  9a88080000        lcall    0, 0x888  ; @1:INT:ord_5(1:0D22)
1:07F9  837e0e00          cmp      word ptr [bp + 0xe], 0
1:07FD  743d              je       0x83c
1:07FF  813efc03eb00      cmp      word ptr [0x3fc], 0xeb
1:0805  750d              jne      0x814
1:0807  2bc0              sub      ax, ax
1:0809  50                push     ax
1:080A  50                push     ax
1:080B  b80001            mov      ax, 0x100
1:080E  50                push     ax
1:080F  ff760e            push     word ptr [bp + 0xe]
1:0812  eb13              jmp      0x827
1:0814  2bc0              sub      ax, ax
1:0816  50                push     ax
1:0817  50                push     ax
1:0818  8b5e0e            mov      bx, word ptr [bp + 0xe]
1:081B  d1e3              shl      bx, 1
1:081D  d1e3              shl      bx, 1
1:081F  ffb79803          push     word ptr [bx + 0x398]
1:0823  ffb79603          push     word ptr [bx + 0x396]
1:0827  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreatePen
1:082C  a34c03            mov      word ptr [0x34c], ax
1:082F  ff36f003          push     word ptr [0x3f0]
1:0833  50                push     ax
1:0834  9a69080000        lcall    0, 0x869  ; @1:GDI.SelectObject
1:0839  a34a03            mov      word ptr [0x34a], ax
1:083C  ff36f003          push     word ptr [0x3f0]
1:0840  ff7606            push     word ptr [bp + 6]
1:0843  ff7608            push     word ptr [bp + 8]
1:0846  9affff0000        lcall    0, 0xffff  ; @1:GDI.MoveTo
1:084B  ff36f003          push     word ptr [0x3f0]
1:084F  ff760a            push     word ptr [bp + 0xa]
1:0852  ff760c            push     word ptr [bp + 0xc]
1:0855  9affff0000        lcall    0, 0xffff  ; @1:GDI.LineTo
1:085A  837e0e00          cmp      word ptr [bp + 0xe], 0
1:085E  7413              je       0x873
1:0860  ff36f003          push     word ptr [0x3f0]
1:0864  ff364a03          push     word ptr [0x34a]
1:0868  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectObject
1:086D  50                push     ax
1:086E  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteObject
1:0873  4d                dec      bp
1:0874  4d                dec      bp
1:0875  8be5              mov      sp, bp
1:0877  1f                pop      ds
1:0878  5d                pop      bp
1:0879  4d                dec      bp
1:087A  cb                retf     
1:087B  1e                push     ds
1:087C  58                pop      ax
1:087D  90                nop      
1:087E  45                inc      bp
1:087F  55                push     bp
1:0880  8bec              mov      bp, sp
1:0882  1e                push     ds
1:0883  8ed8              mov      ds, ax
1:0885  33c0              xor      ax, ax
1:0887  9a7f090000        lcall    0, 0x97f  ; @1:INT:ord_5(1:0D22)
1:088C  ff36ee03          push     word ptr [0x3ee]
1:0890  ff760c            push     word ptr [bp + 0xc]
1:0893  ff760a            push     word ptr [bp + 0xa]
1:0896  ff7608            push     word ptr [bp + 8]
1:0899  ff7606            push     word ptr [bp + 6]
1:089C  0e                push     cs
1:089D  e848ff            call     0x7e8
1:08A0  83c40a            add      sp, 0xa
1:08A3  a19403            mov      ax, word ptr [0x394]
1:08A6  e9b100            jmp      0x95a
1:08A9  ff36ee03          push     word ptr [0x3ee]
1:08AD  c41e1e04          les      bx, ptr [0x41e]
1:08B1  268b4704          mov      ax, word ptr es:[bx + 4]
1:08B5  8bc8              mov      cx, ax
1:08B7  2b460c            sub      ax, word ptr [bp + 0xc]
1:08BA  50                push     ax
1:08BB  ff760a            push     word ptr [bp + 0xa]
1:08BE  2b4e08            sub      cx, word ptr [bp + 8]
1:08C1  51                push     cx
1:08C2  ff7606            push     word ptr [bp + 6]
1:08C5  0e                push     cs
1:08C6  e81fff            call     0x7e8
1:08C9  83c40a            add      sp, 0xa
1:08CC  e99a00            jmp      0x969
1:08CF  ff36ee03          push     word ptr [0x3ee]
1:08D3  ff760c            push     word ptr [bp + 0xc]
1:08D6  c41e1e04          les      bx, ptr [0x41e]
1:08DA  268b4702          mov      ax, word ptr es:[bx + 2]
1:08DE  8bc8              mov      cx, ax
1:08E0  2b460a            sub      ax, word ptr [bp + 0xa]
1:08E3  50                push     ax
1:08E4  ff7608            push     word ptr [bp + 8]
1:08E7  2b4e06            sub      cx, word ptr [bp + 6]
1:08EA  51                push     cx
1:08EB  ebd8              jmp      0x8c5
1:08ED  ff36ee03          push     word ptr [0x3ee]
1:08F1  c41e1e04          les      bx, ptr [0x41e]
1:08F5  268b4704          mov      ax, word ptr es:[bx + 4]
1:08F9  8bc8              mov      cx, ax
1:08FB  2b460c            sub      ax, word ptr [bp + 0xc]
1:08FE  50                push     ax
1:08FF  ff760a            push     word ptr [bp + 0xa]
1:0902  2b4e08            sub      cx, word ptr [bp + 8]
1:0905  51                push     cx
1:0906  ff7606            push     word ptr [bp + 6]
1:0909  0e                push     cs
1:090A  e8dbfe            call     0x7e8
1:090D  83c40a            add      sp, 0xa
1:0910  ff36ee03          push     word ptr [0x3ee]
1:0914  ff760c            push     word ptr [bp + 0xc]
1:0917  c41e1e04          les      bx, ptr [0x41e]
1:091B  268b4702          mov      ax, word ptr es:[bx + 2]
1:091F  8bc8              mov      cx, ax
1:0921  2b460a            sub      ax, word ptr [bp + 0xa]
1:0924  50                push     ax
1:0925  ff7608            push     word ptr [bp + 8]
1:0928  2b4e06            sub      cx, word ptr [bp + 6]
1:092B  51                push     cx
1:092C  0e                push     cs
1:092D  e8b8fe            call     0x7e8
1:0930  83c40a            add      sp, 0xa
1:0933  ff36ee03          push     word ptr [0x3ee]
1:0937  c41e1e04          les      bx, ptr [0x41e]
1:093B  268b4704          mov      ax, word ptr es:[bx + 4]
1:093F  8bc8              mov      cx, ax
1:0941  2b460c            sub      ax, word ptr [bp + 0xc]
1:0944  50                push     ax
1:0945  268b4702          mov      ax, word ptr es:[bx + 2]
1:0949  8bd0              mov      dx, ax
1:094B  2b460a            sub      ax, word ptr [bp + 0xa]
1:094E  50                push     ax
1:094F  2b4e08            sub      cx, word ptr [bp + 8]
1:0952  51                push     cx
1:0953  2b5606            sub      dx, word ptr [bp + 6]
1:0956  52                push     dx
1:0957  e96bff            jmp      0x8c5
1:095A  48                dec      ax
1:095B  7503              jne      0x960
1:095D  e96fff            jmp      0x8cf
1:0960  48                dec      ax
1:0961  7503              jne      0x966
1:0963  e943ff            jmp      0x8a9
1:0966  48                dec      ax
1:0967  7484              je       0x8ed
1:0969  4d                dec      bp
1:096A  4d                dec      bp
1:096B  8be5              mov      sp, bp
1:096D  1f                pop      ds
1:096E  5d                pop      bp
1:096F  4d                dec      bp
1:0970  cb                retf     
1:0971  1e                push     ds
1:0972  58                pop      ax
1:0973  90                nop      
1:0974  45                inc      bp
1:0975  55                push     bp
1:0976  8bec              mov      bp, sp
1:0978  1e                push     ds
1:0979  8ed8              mov      ds, ax
1:097B  b80400            mov      ax, 4
1:097E  9ae7090000        lcall    0, 0x9e7  ; @1:INT:ord_5(1:0D22)
1:0983  56                push     si
1:0984  8b5e08            mov      bx, word ptr [bp + 8]
1:0987  8b07              mov      ax, word ptr [bx]
1:0989  8b7606            mov      si, word ptr [bp + 6]
1:098C  0304              add      ax, word ptr [si]
1:098E  a34e03            mov      word ptr [0x34e], ax
1:0991  3d0200            cmp      ax, 2
1:0994  7d05              jge      0x99b
1:0996  b80100            mov      ax, 1
1:0999  eb02              jmp      0x99d
1:099B  2bc0              sub      ax, ax
1:099D  c41e1e04          les      bx, ptr [0x41e]
1:09A1  268b4f02          mov      cx, word ptr es:[bx + 2]
1:09A5  49                dec      cx
1:09A6  49                dec      cx
1:09A7  8946fc            mov      word ptr [bp - 4], ax
1:09AA  3b0e4e03          cmp      cx, word ptr [0x34e]
1:09AE  7d05              jge      0x9b5
1:09B0  b80100            mov      ax, 1
1:09B3  eb02              jmp      0x9b7
1:09B5  2bc0              sub      ax, ax
1:09B7  0b46fc            or       ax, word ptr [bp - 4]
1:09BA  740c              je       0x9c8
1:09BC  8bde              mov      bx, si
1:09BE  8b07              mov      ax, word ptr [bx]
1:09C0  a34e03            mov      word ptr [0x34e], ax
1:09C3  8b5e08            mov      bx, word ptr [bp + 8]
1:09C6  f71f              neg      word ptr [bx]
1:09C8  a14e03            mov      ax, word ptr [0x34e]
1:09CB  8b5e06            mov      bx, word ptr [bp + 6]
1:09CE  8907              mov      word ptr [bx], ax
1:09D0  5e                pop      si
1:09D1  4d                dec      bp
1:09D2  4d                dec      bp
1:09D3  8be5              mov      sp, bp
1:09D5  1f                pop      ds
1:09D6  5d                pop      bp
1:09D7  4d                dec      bp
1:09D8  cb                retf     
1:09D9  1e                push     ds
1:09DA  58                pop      ax
1:09DB  90                nop      
1:09DC  45                inc      bp
1:09DD  55                push     bp
1:09DE  8bec              mov      bp, sp
1:09E0  1e                push     ds
1:09E1  8ed8              mov      ds, ax
1:09E3  b80400            mov      ax, 4
1:09E6  9a4e0a0000        lcall    0, 0xa4e  ; @1:INT:ord_5(1:0D22)
1:09EB  56                push     si
1:09EC  8b5e08            mov      bx, word ptr [bp + 8]
1:09EF  8b07              mov      ax, word ptr [bx]
1:09F1  8b7606            mov      si, word ptr [bp + 6]
1:09F4  0304              add      ax, word ptr [si]
1:09F6  a35003            mov      word ptr [0x350], ax
1:09F9  3d0200            cmp      ax, 2
1:09FC  7d05              jge      0xa03
1:09FE  b80100            mov      ax, 1
1:0A01  eb02              jmp      0xa05
1:0A03  2bc0              sub      ax, ax
1:0A05  c41e1e04          les      bx, ptr [0x41e]
1:0A09  268b4f04          mov      cx, word ptr es:[bx + 4]
1:0A0D  49                dec      cx
1:0A0E  49                dec      cx
1:0A0F  8946fc            mov      word ptr [bp - 4], ax
1:0A12  3b0e5003          cmp      cx, word ptr [0x350]
1:0A16  7d05              jge      0xa1d
1:0A18  b80100            mov      ax, 1
1:0A1B  eb02              jmp      0xa1f
1:0A1D  2bc0              sub      ax, ax
1:0A1F  0b46fc            or       ax, word ptr [bp - 4]
1:0A22  740c              je       0xa30
1:0A24  8bde              mov      bx, si
1:0A26  8b07              mov      ax, word ptr [bx]
1:0A28  a35003            mov      word ptr [0x350], ax
1:0A2B  8b5e08            mov      bx, word ptr [bp + 8]
1:0A2E  f71f              neg      word ptr [bx]
1:0A30  a15003            mov      ax, word ptr [0x350]
1:0A33  8b5e06            mov      bx, word ptr [bp + 6]
1:0A36  8907              mov      word ptr [bx], ax
1:0A38  5e                pop      si
1:0A39  4d                dec      bp
1:0A3A  4d                dec      bp
1:0A3B  8be5              mov      sp, bp
1:0A3D  1f                pop      ds
1:0A3E  5d                pop      bp
1:0A3F  4d                dec      bp
1:0A40  cb                retf     
1:0A41  1e                push     ds
1:0A42  58                pop      ax
1:0A43  90                nop      
1:0A44  45                inc      bp
1:0A45  55                push     bp
1:0A46  8bec              mov      bp, sp
1:0A48  1e                push     ds
1:0A49  8ed8              mov      ds, ax
1:0A4B  33c0              xor      ax, ax
1:0A4D  9a7a0a0000        lcall    0, 0xa7a  ; @1:INT:ord_5(1:0D22)
1:0A52  a1fc03            mov      ax, word ptr [0x3fc]
1:0A55  ff06ee03          inc      word ptr [0x3ee]
1:0A59  3906ee03          cmp      word ptr [0x3ee], ax
1:0A5D  7c06              jl       0xa65
1:0A5F  c706ee030100      mov      word ptr [0x3ee], 1
1:0A65  4d                dec      bp
1:0A66  4d                dec      bp
1:0A67  8be5              mov      sp, bp
1:0A69  1f                pop      ds
1:0A6A  5d                pop      bp
1:0A6B  4d                dec      bp
1:0A6C  cb                retf     
1:0A6D  1e                push     ds
1:0A6E  58                pop      ax
1:0A6F  90                nop      
1:0A70  45                inc      bp
1:0A71  55                push     bp
1:0A72  8bec              mov      bp, sp
1:0A74  1e                push     ds
1:0A75  8ed8              mov      ds, ax
1:0A77  33c0              xor      ax, ax
1:0A79  9ad6030000        lcall    0, 0x3d6  ; @1:INT:ord_5(1:0D22)
1:0A7E  9a8d0a0000        lcall    0, 0xa8d  ; @1:INT:ord_4(1:0DE8)
1:0A83  99                cdq      
1:0A84  f73e1a04          idiv     word ptr [0x41a]
1:0A88  89160604          mov      word ptr [0x406], dx
1:0A8C  9a9b0a0000        lcall    0, 0xa9b  ; @1:INT:ord_4(1:0DE8)
1:0A91  99                cdq      
1:0A92  f73e1a04          idiv     word ptr [0x41a]
1:0A96  89160804          mov      word ptr [0x408], dx
1:0A9A  9aa90a0000        lcall    0, 0xaa9  ; @1:INT:ord_4(1:0DE8)
1:0A9F  99                cdq      
1:0AA0  f73e1a04          idiv     word ptr [0x41a]
1:0AA4  89160a04          mov      word ptr [0x40a], dx
1:0AA8  9afd020000        lcall    0, 0x2fd  ; @1:INT:ord_4(1:0DE8)
1:0AAD  99                cdq      
1:0AAE  f73e1a04          idiv     word ptr [0x41a]
1:0AB2  89160c04          mov      word ptr [0x40c], dx
1:0AB6  833e060400        cmp      word ptr [0x406], 0
1:0ABB  7506              jne      0xac3
1:0ABD  c70606040100      mov      word ptr [0x406], 1
1:0AC3  833e080400        cmp      word ptr [0x408], 0
1:0AC8  7506              jne      0xad0
1:0ACA  c70608040100      mov      word ptr [0x408], 1
1:0AD0  833e0a0400        cmp      word ptr [0x40a], 0
1:0AD5  7506              jne      0xadd
1:0AD7  c7060a040100      mov      word ptr [0x40a], 1
1:0ADD  0bd2              or       dx, dx
1:0ADF  7506              jne      0xae7
1:0AE1  c7060c040100      mov      word ptr [0x40c], 1
1:0AE7  4d                dec      bp
1:0AE8  4d                dec      bp
1:0AE9  8be5              mov      sp, bp
1:0AEB  1f                pop      ds
1:0AEC  5d                pop      bp
1:0AED  4d                dec      bp
1:0AEE  cb                retf     
1:0AEF  001e5890          add      byte ptr [0x9058], bl
1:0AF3  45                inc      bp
1:0AF4  55                push     bp
1:0AF5  8bec              mov      bp, sp
1:0AF7  1e                push     ds
1:0AF8  8ed8              mov      ds, ax
1:0AFA  33c0              xor      ax, ax
1:0AFC  9a2b0b0000        lcall    0, 0xb2b  ; @1:INT:ord_5(1:0D22)
1:0B01  837e0a00          cmp      word ptr [bp + 0xa], 0
1:0B05  7504              jne      0xb0b
1:0B07  2bc0              sub      ax, ax
1:0B09  eb09              jmp      0xb14
1:0B0B  8b460e            mov      ax, word ptr [bp + 0xe]
1:0B0E  a30004            mov      word ptr [0x400], ax
1:0B11  b80100            mov      ax, 1
1:0B14  4d                dec      bp
1:0B15  4d                dec      bp
1:0B16  8be5              mov      sp, bp
1:0B18  1f                pop      ds
1:0B19  5d                pop      bp
1:0B1A  4d                dec      bp
1:0B1B  ca0a00            retf     0xa

; ===== EXPORT:WEP(#2) =====
1:0B1E  1e                push     ds
1:0B1F  58                pop      ax
1:0B20  90                nop      
1:0B21  45                inc      bp
1:0B22  55                push     bp
1:0B23  8bec              mov      bp, sp
1:0B25  1e                push     ds
1:0B26  8ed8              mov      ds, ax
1:0B28  33c0              xor      ax, ax
1:0B2A  9a4a0b0000        lcall    0, 0xb4a  ; @1:INT:ord_5(1:0D22)
1:0B2F  b80100            mov      ax, 1
1:0B32  4d                dec      bp
1:0B33  4d                dec      bp
1:0B34  8be5              mov      sp, bp
1:0B36  1f                pop      ds
1:0B37  5d                pop      bp
1:0B38  4d                dec      bp
1:0B39  ca0200            retf     2

; ===== EXPORT:MODULE(#1) =====
1:0B3C  1e                push     ds
1:0B3D  58                pop      ax
1:0B3E  90                nop      
1:0B3F  45                inc      bp
1:0B40  55                push     bp
1:0B41  8bec              mov      bp, sp
1:0B43  1e                push     ds
1:0B44  8ed8              mov      ds, ax
1:0B46  b80a00            mov      ax, 0xa
1:0B49  9a7c070000        lcall    0, 0x77c  ; @1:INT:ord_5(1:0D22)
1:0B4E  56                push     si
1:0B4F  8b4608            mov      ax, word ptr [bp + 8]
1:0B52  a3f003            mov      word ptr [0x3f0], ax
1:0B55  8b4606            mov      ax, word ptr [bp + 6]
1:0B58  a39003            mov      word ptr [0x390], ax
1:0B5B  50                push     ax
1:0B5C  9a7c0b0000        lcall    0, 0xb7c  ; @1:KERNEL.GlobalLock
1:0B61  a3f403            mov      word ptr [0x3f4], ax
1:0B64  8916f603          mov      word ptr [0x3f6], dx
1:0B68  8bc2              mov      ax, dx
1:0B6A  0b06f403          or       ax, word ptr [0x3f4]
1:0B6E  7503              jne      0xb73
1:0B70  e96a01            jmp      0xcdd
1:0B73  c41ef403          les      bx, ptr [0x3f4]
1:0B77  26ff7720          push     word ptr es:[bx + 0x20]
1:0B7B  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalLock
1:0B80  a31e04            mov      word ptr [0x41e], ax
1:0B83  89162004          mov      word ptr [0x420], dx
1:0B87  8bc2              mov      ax, dx
1:0B89  0b061e04          or       ax, word ptr [0x41e]
1:0B8D  7503              jne      0xb92
1:0B8F  e94201            jmp      0xcd4
1:0B92  8b460a            mov      ax, word ptr [bp + 0xa]
1:0B95  e90801            jmp      0xca0
1:0B98  c41ef403          les      bx, ptr [0x3f4]
1:0B9C  26837f1465        cmp      word ptr es:[bx + 0x14], 0x65
1:0BA1  7c0f              jl       0xbb2
1:0BA3  26817f36f400      cmp      word ptr es:[bx + 0x36], 0xf4
1:0BA9  7507              jne      0xbb2
1:0BAB  26837f3878        cmp      word ptr es:[bx + 0x38], 0x78
1:0BB0  740e              je       0xbc0
1:0BB2  c70616000000      mov      word ptr [0x16], 0
1:0BB8  c746fc0500        mov      word ptr [bp - 4], 5
1:0BBD  e90701            jmp      0xcc7
1:0BC0  c70616000100      mov      word ptr [0x16], 1
1:0BC6  e9fe00            jmp      0xcc7
1:0BC9  b85203            mov      ax, 0x352
1:0BCC  50                push     ax
1:0BCD  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_15(1:0D72)
1:0BD2  5b                pop      bx
1:0BD3  ff365203          push     word ptr [0x352]
1:0BD7  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_14(1:0DD4)
1:0BDC  5b                pop      bx
1:0BDD  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_13(1:0019)
1:0BE2  eb13              jmp      0xbf7
1:0BE4  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:03C9)
1:0BE9  eb0c              jmp      0xbf7
1:0BEB  833e160000        cmp      word ptr [0x16], 0
1:0BF0  740b              je       0xbfd
1:0BF2  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:0417)
1:0BF7  8946fc            mov      word ptr [bp - 4], ax
1:0BFA  e9ca00            jmp      0xcc7
1:0BFD  ff36f003          push     word ptr [0x3f0]
1:0C01  b800ff            mov      ax, 0xff00
1:0C04  baff00            mov      dx, 0xff
1:0C07  52                push     dx
1:0C08  50                push     ax
1:0C09  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextColor
1:0C0E  ff36f003          push     word ptr [0x3f0]
1:0C12  2bc0              sub      ax, ax
1:0C14  50                push     ax
1:0C15  50                push     ax
1:0C16  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkColor
1:0C1B  ff36f003          push     word ptr [0x3f0]
1:0C1F  2bc0              sub      ax, ax
1:0C21  50                push     ax
1:0C22  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextAlign
1:0C27  ff36f003          push     word ptr [0x3f0]
1:0C2B  b80100            mov      ax, 1
1:0C2E  50                push     ax
1:0C2F  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkMode
1:0C34  ff36f003          push     word ptr [0x3f0]
1:0C38  2bc0              sub      ax, ax
1:0C3A  50                push     ax
1:0C3B  50                push     ax
1:0C3C  b81800            mov      ax, 0x18
1:0C3F  1e                push     ds
1:0C40  50                push     ax
1:0C41  50                push     ax
1:0C42  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:0D56)
1:0C47  5b                pop      bx
1:0C48  50                push     ax
1:0C49  9affff0000        lcall    0, 0xffff  ; @1:GDI.TextOut
1:0C4E  eb77              jmp      0xcc7
1:0C50  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:052A)
1:0C55  eba0              jmp      0xbf7
1:0C57  a10004            mov      ax, word ptr [0x400]
1:0C5A  c41e1e04          les      bx, ptr [0x41e]
1:0C5E  26894716          mov      word ptr es:[bx + 0x16], ax
1:0C62  c746f60000        mov      word ptr [bp - 0xa], 0
1:0C67  8b46f6            mov      ax, word ptr [bp - 0xa]
1:0C6A  8bf0              mov      si, ax
1:0C6C  d1e6              shl      si, 1
1:0C6E  40                inc      ax
1:0C6F  c41e1e04          les      bx, ptr [0x41e]
1:0C73  2689400e          mov      word ptr es:[bx + si + 0xe], ax
1:0C77  ff46f6            inc      word ptr [bp - 0xa]
1:0C7A  837ef604          cmp      word ptr [bp - 0xa], 4
1:0C7E  7ce7              jl       0xc67
1:0C80  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:0598)
1:0C85  e96fff            jmp      0xbf7
1:0C88  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:05B3)
1:0C8D  e967ff            jmp      0xbf7
1:0C90  8b460a            mov      ax, word ptr [bp + 0xa]
1:0C93  2d0700            sub      ax, 7
1:0C96  50                push     ax
1:0C97  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_6(1:05CE)
1:0C9C  5b                pop      bx
1:0C9D  e957ff            jmp      0xbf7
1:0CA0  3d0c00            cmp      ax, 0xc
1:0CA3  7722              ja       0xcc7
1:0CA5  d1e0              shl      ax, 1
1:0CA7  93                xchg     bx, ax
1:0CA8  2effa7ad0c        jmp      word ptr cs:[bx + 0xcad]
1:0CAD  c9                leave    
1:0CAE  0be4              or       sp, sp
1:0CB0  0beb              or       bp, bx
1:0CB2  0b500c            or       dx, word ptr [bx + si + 0xc]