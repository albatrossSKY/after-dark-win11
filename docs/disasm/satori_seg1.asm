File: raw\unpacked\MODULES\SATORI.AD
Module: 'SATORI' ('Graphics Module Library')
CS:IP=1:3846  SS:SP=0:0000  AutoDS=2  Heap=8192  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (3): KERNEL, GDI, USER
Segments (2):
  SEG  1: CODE off=0x00660 len=0x3878 min=0x3878 flags=0x0D50 relocs=254
  SEG  2: DATA off=0x04140 len=0x0C66 min=0x0C66 flags=0x0C71 relocs=0
Exports (42):
  ord   1: SEG1:2CBC flags=0x03 MODULE
  ord   2: SEG1:2CA5 flags=0x03 WEP
  ord   3: SEG1:3832 flags=0x03 ___EXPORTEDSTUB
  ord   4: SEG1:2FC8 flags=0x00 
  ord   5: SEG1:3062 flags=0x00 
  ord   6: SEG1:2F14 flags=0x00 
  ord   7: SEG1:2AF6 flags=0x00 
  ord   8: SEG1:2BD4 flags=0x00 
  ord   9: SEG1:3140 flags=0x00 
  ord  10: SEG1:2930 flags=0x00 
  ord  11: SEG1:29B2 flags=0x00 
  ord  12: SEG1:2F44 flags=0x00 
  ord  13: SEG1:2A76 flags=0x00 
  ord  14: SEG1:3094 flags=0x00 
  ord  15: SEG1:3134 flags=0x00 
  ord  16: SEG1:2F88 flags=0x00 
  ord  17: SEG1:314C flags=0x00 
  ord  18: SEG1:2FA8 flags=0x00 
  ord  19: SEG1:2F66 flags=0x00 
  ord  20: SEG1:28A2 flags=0x00 
  ord  21: SEG1:1C1B flags=0x00 
  ord  22: SEG1:2907 flags=0x00 
  ord  23: SEG1:1C2F flags=0x00 
  ord  24: SEG1:2E82 flags=0x00 
  ord  25: SEG1:2753 flags=0x00 
  ord  26: SEG1:0FEA flags=0x00 
  ord  27: SEG1:0E82 flags=0x00 
  ord  28: SEG1:2F00 flags=0x00 
  ord  29: SEG1:2E9E flags=0x00 
  ord  30: SEG1:2C7E flags=0x00 
  ord  31: SEG1:3158 flags=0x00 
  ord  32: SEG1:339C flags=0x00 
  ord  33: SEG1:325C flags=0x00 
  ord  34: SEG1:34CE flags=0x00 
  ord  35: SEG1:34F6 flags=0x00 
  ord  36: SEG1:3598 flags=0x00 
  ord  37: SEG1:355C flags=0x00 
  ord  38: SEG1:35C2 flags=0x00 
  ord  39: SEG1:34FA flags=0x00 
  ord  40: SEG1:3276 flags=0x00 
  ord  41: SEG1:3766 flags=0x00 
  ord  42: SEG1:3822 flags=0x00 
Resources (7):
  TYPE_1000        #1               off=0x04DE0 len=   144
  TYPE_1000        #2               off=0x04E70 len=   448
  TYPE_1000        #3               off=0x05030 len=   128
  TYPE_1000        #4               off=0x050B0 len=    64
  TYPE_2000        #10              off=0x050F0 len=    80
  TYPE_2000        #20              off=0x05140 len=    16
  TYPE_2000        #30              off=0x05150 len=   656

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
1:0012  1e                push     ds
1:0013  58                pop      ax
1:0014  90                nop      
1:0015  45                inc      bp
1:0016  55                push     bp
1:0017  8bec              mov      bp, sp
1:0019  1e                push     ds
1:001A  8ed8              mov      ds, ax
1:001C  56                push     si
1:001D  a1fa09            mov      ax, word ptr [0x9fa]
1:0020  a3120c            mov      word ptr [0xc12], ax
1:0023  a1f409            mov      ax, word ptr [0x9f4]
1:0026  a3ce0a            mov      word ptr [0xace], ax
1:0029  a1f809            mov      ax, word ptr [0x9f8]
1:002C  a3d60a            mov      word ptr [0xad6], ax
1:002F  a0ec09            mov      al, byte ptr [0x9ec]
1:0032  a2b80b            mov      byte ptr [0xbb8], al
1:0035  a0f209            mov      al, byte ptr [0x9f2]
1:0038  a2b90b            mov      byte ptr [0xbb9], al
1:003B  a1040a            mov      ax, word ptr [0xa04]
1:003E  a30a0a            mov      word ptr [0xa0a], ax
1:0041  2bf6              sub      si, si
1:0043  8bde              mov      bx, si
1:0045  d1e3              shl      bx, 1
1:0047  8b87160c          mov      ax, word ptr [bx + 0xc16]
1:004B  89876409          mov      word ptr [bx + 0x964], ax
1:004F  8b873e0c          mov      ax, word ptr [bx + 0xc3e]
1:0053  8987c209          mov      word ptr [bx + 0x9c2], ax
1:0057  8b87ba0b          mov      ax, word ptr [bx + 0xbba]
1:005B  89873c0b          mov      word ptr [bx + 0xb3c], ax
1:005F  8b87160a          mov      ax, word ptr [bx + 0xa16]
1:0063  8987460a          mov      word ptr [bx + 0xa46], ax
1:0067  8b87000b          mov      ax, word ptr [bx + 0xb00]
1:006B  8987d80a          mov      word ptr [bx + 0xad8], ax
1:006F  8b878c09          mov      ax, word ptr [bx + 0x98c]
1:0073  8987a40a          mov      word ptr [bx + 0xaa4], ax
1:0077  8b87760a          mov      ax, word ptr [bx + 0xa76]
1:007B  8987ea0b          mov      word ptr [bx + 0xbea], ax
1:007F  8b87640b          mov      ax, word ptr [bx + 0xb64]
1:0083  89878c0b          mov      word ptr [bx + 0xb8c], ax
1:0087  46                inc      si
1:0088  83fe14            cmp      si, 0x14
1:008B  7cb6              jl       0x43
1:008D  5e                pop      si
1:008E  4d                dec      bp
1:008F  4d                dec      bp
1:0090  8be5              mov      sp, bp
1:0092  1f                pop      ds
1:0093  5d                pop      bp
1:0094  4d                dec      bp
1:0095  cb                retf     
1:0096  1e                push     ds
1:0097  58                pop      ax
1:0098  90                nop      
1:0099  45                inc      bp
1:009A  55                push     bp
1:009B  8bec              mov      bp, sp
1:009D  1e                push     ds
1:009E  8ed8              mov      ds, ax
1:00A0  56                push     si
1:00A1  a1120c            mov      ax, word ptr [0xc12]
1:00A4  a3fa09            mov      word ptr [0x9fa], ax
1:00A7  a1ce0a            mov      ax, word ptr [0xace]
1:00AA  a3f409            mov      word ptr [0x9f4], ax
1:00AD  a1d60a            mov      ax, word ptr [0xad6]
1:00B0  a3f809            mov      word ptr [0x9f8], ax
1:00B3  a0b80b            mov      al, byte ptr [0xbb8]
1:00B6  a2ec09            mov      byte ptr [0x9ec], al
1:00B9  a0b90b            mov      al, byte ptr [0xbb9]
1:00BC  a2f209            mov      byte ptr [0x9f2], al
1:00BF  a10a0a            mov      ax, word ptr [0xa0a]
1:00C2  a3040a            mov      word ptr [0xa04], ax
1:00C5  2bf6              sub      si, si
1:00C7  8bde              mov      bx, si
1:00C9  d1e3              shl      bx, 1
1:00CB  8b876409          mov      ax, word ptr [bx + 0x964]
1:00CF  8987160c          mov      word ptr [bx + 0xc16], ax
1:00D3  8b87c209          mov      ax, word ptr [bx + 0x9c2]
1:00D7  89873e0c          mov      word ptr [bx + 0xc3e], ax
1:00DB  8b873c0b          mov      ax, word ptr [bx + 0xb3c]
1:00DF  8987ba0b          mov      word ptr [bx + 0xbba], ax
1:00E3  8b87460a          mov      ax, word ptr [bx + 0xa46]
1:00E7  8987160a          mov      word ptr [bx + 0xa16], ax
1:00EB  8b87d80a          mov      ax, word ptr [bx + 0xad8]
1:00EF  8987000b          mov      word ptr [bx + 0xb00], ax
1:00F3  8b87a40a          mov      ax, word ptr [bx + 0xaa4]
1:00F7  89878c09          mov      word ptr [bx + 0x98c], ax
1:00FB  8b87ea0b          mov      ax, word ptr [bx + 0xbea]
1:00FF  8987760a          mov      word ptr [bx + 0xa76], ax
1:0103  8b878c0b          mov      ax, word ptr [bx + 0xb8c]
1:0107  8987640b          mov      word ptr [bx + 0xb64], ax
1:010B  46                inc      si
1:010C  83fe14            cmp      si, 0x14
1:010F  7cb6              jl       0xc7
1:0111  5e                pop      si
1:0112  4d                dec      bp
1:0113  4d                dec      bp
1:0114  8be5              mov      sp, bp
1:0116  1f                pop      ds
1:0117  5d                pop      bp
1:0118  4d                dec      bp
1:0119  cb                retf     
1:011A  1e                push     ds
1:011B  58                pop      ax
1:011C  90                nop      
1:011D  45                inc      bp
1:011E  55                push     bp
1:011F  8bec              mov      bp, sp
1:0121  1e                push     ds
1:0122  8ed8              mov      ds, ax
1:0124  b84000            mov      ax, 0x40
1:0127  50                push     ax
1:0128  b8b003            mov      ax, 0x3b0
1:012B  50                push     ax
1:012C  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LocalAlloc
1:0131  a3d40a            mov      word ptr [0xad4], ax
1:0134  50                push     ax
1:0135  9aac010000        lcall    0, 0x1ac  ; @1:KERNEL.LocalLock
1:013A  a3100a            mov      word ptr [0xa10], ax
1:013D  8c1e120a          mov      word ptr [0xa12], ds
1:0141  c41e100a          les      bx, ptr [0xa10]
1:0145  26c74702ea00      mov      word ptr es:[bx + 2], 0xea
1:014B  c41e100a          les      bx, ptr [0xa10]
1:014F  26c7070003        mov      word ptr es:[bx], 0x300
1:0154  ff36120a          push     word ptr [0xa12]
1:0158  ff36100a          push     word ptr [0xa10]
1:015C  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreatePalette
1:0161  a3b60b            mov      word ptr [0xbb6], ax
1:0164  4d                dec      bp
1:0165  4d                dec      bp
1:0166  8be5              mov      sp, bp
1:0168  1f                pop      ds
1:0169  5d                pop      bp
1:016A  4d                dec      bp
1:016B  cb                retf     
1:016C  1e                push     ds
1:016D  58                pop      ax
1:016E  90                nop      
1:016F  45                inc      bp
1:0170  55                push     bp
1:0171  8bec              mov      bp, sp
1:0173  1e                push     ds
1:0174  8ed8              mov      ds, ax
1:0176  57                push     di
1:0177  56                push     si
1:0178  8306700a02        add      word ptr [0xa70], 2
1:017D  813e700aea00      cmp      word ptr [0xa70], 0xea
1:0183  7506              jne      0x18b
1:0185  c706700a0000      mov      word ptr [0xa70], 0
1:018B  ff36f609          push     word ptr [0x9f6]
1:018F  ff36b60b          push     word ptr [0xbb6]
1:0193  2bc0              sub      ax, ax
1:0195  50                push     ax
1:0196  9a5d020000        lcall    0, 0x25d  ; @1:USER.SelectPalette
1:019B  a3f008            mov      word ptr [0x8f0], ax
1:019E  ff36f609          push     word ptr [0x9f6]
1:01A2  9affff0000        lcall    0, 0xffff  ; @1:USER.RealizePalette
1:01A7  ff366e0a          push     word ptr [0xa6e]
1:01AB  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LocalLock
1:01B0  a3b40b            mov      word ptr [0xbb4], ax
1:01B3  8b36700a          mov      si, word ptr [0xa70]
1:01B7  eb6a              jmp      0x223
1:01B9  8bde              mov      bx, si
1:01BB  d1e3              shl      bx, 1
1:01BD  d1e3              shl      bx, 1
1:01BF  8b3eb40b          mov      di, word ptr [0xbb4]
1:01C3  8a01              mov      al, byte ptr [bx + di]
1:01C5  8bfe              mov      di, si
1:01C7  2b3e700a          sub      di, word ptr [0xa70]
1:01CB  d1e7              shl      di, 1
1:01CD  d1e7              shl      di, 1
1:01CF  8bcb              mov      cx, bx
1:01D1  c41e100a          les      bx, ptr [0xa10]
1:01D5  26884104          mov      byte ptr es:[bx + di + 4], al
1:01D9  8b1eb40b          mov      bx, word ptr [0xbb4]
1:01DD  8bf9              mov      di, cx
1:01DF  8a4101            mov      al, byte ptr [bx + di + 1]
1:01E2  8bfe              mov      di, si
1:01E4  2b3e700a          sub      di, word ptr [0xa70]
1:01E8  d1e7              shl      di, 1
1:01EA  d1e7              shl      di, 1
1:01EC  c41e100a          les      bx, ptr [0xa10]
1:01F0  26884105          mov      byte ptr es:[bx + di + 5], al
1:01F4  8b1eb40b          mov      bx, word ptr [0xbb4]
1:01F8  8bf9              mov      di, cx
1:01FA  8a4102            mov      al, byte ptr [bx + di + 2]
1:01FD  8bfe              mov      di, si
1:01FF  2b3e700a          sub      di, word ptr [0xa70]
1:0203  d1e7              shl      di, 1
1:0205  d1e7              shl      di, 1
1:0207  c41e100a          les      bx, ptr [0xa10]
1:020B  26884106          mov      byte ptr es:[bx + di + 6], al
1:020F  8bfe              mov      di, si
1:0211  2b3e700a          sub      di, word ptr [0xa70]
1:0215  d1e7              shl      di, 1
1:0217  d1e7              shl      di, 1
1:0219  c41e100a          les      bx, ptr [0xa10]
1:021D  26c6410701        mov      byte ptr es:[bx + di + 7], 1
1:0222  46                inc      si
1:0223  a1700a            mov      ax, word ptr [0xa70]
1:0226  05e900            add      ax, 0xe9
1:0229  3bc6              cmp      ax, si
1:022B  7f8c              jg       0x1b9
1:022D  ff366e0a          push     word ptr [0xa6e]
1:0231  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LocalUnlock
1:0236  ff36b60b          push     word ptr [0xbb6]
1:023A  2bc0              sub      ax, ax
1:023C  50                push     ax
1:023D  c41e100a          les      bx, ptr [0xa10]
1:0241  268b4702          mov      ax, word ptr es:[bx + 2]
1:0245  48                dec      ax
1:0246  50                push     ax
1:0247  8d4704            lea      ax, [bx + 4]
1:024A  06                push     es
1:024B  50                push     ax
1:024C  9affff0000        lcall    0, 0xffff  ; @1:GDI.AnimatePalette
1:0251  ff36f609          push     word ptr [0x9f6]
1:0255  ff36f008          push     word ptr [0x8f0]
1:0259  2bc0              sub      ax, ax
1:025B  50                push     ax
1:025C  9affff0000        lcall    0, 0xffff  ; @1:USER.SelectPalette
1:0261  5e                pop      si
1:0262  5f                pop      di
1:0263  4d                dec      bp
1:0264  4d                dec      bp
1:0265  8be5              mov      sp, bp
1:0267  1f                pop      ds
1:0268  5d                pop      bp
1:0269  4d                dec      bp
1:026A  cb                retf     
1:026B  1e                push     ds
1:026C  58                pop      ax
1:026D  90                nop      
1:026E  45                inc      bp
1:026F  55                push     bp
1:0270  8bec              mov      bp, sp
1:0272  1e                push     ds
1:0273  8ed8              mov      ds, ax
1:0275  0e                push     cs
1:0276  e8f3fe            call     0x16c
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
1:028B  83ec04            sub      sp, 4
1:028E  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_6(1:2F14)
1:0293  8b4e08            mov      cx, word ptr [bp + 8]
1:0296  2b4e06            sub      cx, word ptr [bp + 6]
1:0299  41                inc      cx
1:029A  99                cdq      
1:029B  f7f9              idiv     cx
1:029D  8bc2              mov      ax, dx
1:029F  034606            add      ax, word ptr [bp + 6]
1:02A2  4d                dec      bp
1:02A3  4d                dec      bp
1:02A4  8be5              mov      sp, bp
1:02A6  1f                pop      ds
1:02A7  5d                pop      bp
1:02A8  4d                dec      bp
1:02A9  cb                retf     
1:02AA  1e                push     ds
1:02AB  58                pop      ax
1:02AC  90                nop      
1:02AD  45                inc      bp
1:02AE  55                push     bp
1:02AF  8bec              mov      bp, sp
1:02B1  1e                push     ds
1:02B2  8ed8              mov      ds, ax
1:02B4  83ec26            sub      sp, 0x26
1:02B7  57                push     di
1:02B8  56                push     si
1:02B9  8b460a            mov      ax, word ptr [bp + 0xa]
1:02BC  2b4608            sub      ax, word ptr [bp + 8]
1:02BF  99                cdq      
1:02C0  8946de            mov      word ptr [bp - 0x22], ax
1:02C3  8956e0            mov      word ptr [bp - 0x20], dx
1:02C6  8b460a            mov      ax, word ptr [bp + 0xa]
1:02C9  b9ea00            mov      cx, 0xea
1:02CC  99                cdq      
1:02CD  f7f9              idiv     cx
1:02CF  8bda              mov      bx, dx
1:02D1  d1e3              shl      bx, 1
1:02D3  d1e3              shl      bx, 1
1:02D5  8b7606            mov      si, word ptr [bp + 6]
1:02D8  8a00              mov      al, byte ptr [bx + si]
1:02DA  2ae4              sub      ah, ah
1:02DC  2bd2              sub      dx, dx
1:02DE  8bcb              mov      cx, bx
1:02E0  8b5e08            mov      bx, word ptr [bp + 8]
1:02E3  d1e3              shl      bx, 1
1:02E5  d1e3              shl      bx, 1
1:02E7  8bf8              mov      di, ax
1:02E9  8a00              mov      al, byte ptr [bx + si]
1:02EB  8bf2              mov      si, dx
1:02ED  2bf8              sub      di, ax
1:02EF  1bf2              sbb      si, dx
1:02F1  897eee            mov      word ptr [bp - 0x12], di
1:02F4  8976f0            mov      word ptr [bp - 0x10], si
1:02F7  8b7606            mov      si, word ptr [bp + 6]
1:02FA  03f1              add      si, cx
1:02FC  8a4c01            mov      cl, byte ptr [si + 1]
1:02FF  2aed              sub      ch, ch
1:0301  2bff              sub      di, di
1:0303  035e06            add      bx, word ptr [bp + 6]
1:0306  8946da            mov      word ptr [bp - 0x26], ax
1:0309  8a4701            mov      al, byte ptr [bx + 1]
1:030C  2bc8              sub      cx, ax
1:030E  1bfa              sbb      di, dx
1:0310  894ee6            mov      word ptr [bp - 0x1a], cx
1:0313  897ee8            mov      word ptr [bp - 0x18], di
1:0316  8a4f02            mov      cl, byte ptr [bx + 2]
1:0319  2aed              sub      ch, ch
1:031B  2bdb              sub      bx, bx
1:031D  8bf8              mov      di, ax
1:031F  8a4402            mov      al, byte ptr [si + 2]
1:0322  8bf2              mov      si, dx
1:0324  2bc1              sub      ax, cx
1:0326  1bd3              sbb      dx, bx
1:0328  8946f2            mov      word ptr [bp - 0xe], ax
1:032B  8956f4            mov      word ptr [bp - 0xc], dx
1:032E  8b46da            mov      ax, word ptr [bp - 0x26]
1:0331  8bd6              mov      dx, si
1:0333  050001            add      ax, 0x100
1:0336  13d2              adc      dx, dx
1:0338  8946f6            mov      word ptr [bp - 0xa], ax
1:033B  81c70001          add      di, 0x100
1:033F  13f3              adc      si, bx
1:0341  897eea            mov      word ptr [bp - 0x16], di
1:0344  81c10001          add      cx, 0x100
1:0348  13db              adc      bx, bx
1:034A  894efa            mov      word ptr [bp - 6], cx
1:034D  c746e20200        mov      word ptr [bp - 0x1e], 2
1:0352  c746e40000        mov      word ptr [bp - 0x1c], 0
1:0357  eb08              jmp      0x361
1:0359  8346e202          add      word ptr [bp - 0x1e], 2
1:035D  8356e400          adc      word ptr [bp - 0x1c], 0
1:0361  8b46e2            mov      ax, word ptr [bp - 0x1e]
1:0364  8b56e4            mov      dx, word ptr [bp - 0x1c]
1:0367  3956e0            cmp      word ptr [bp - 0x20], dx
1:036A  7d03              jge      0x36f
1:036C  e98200            jmp      0x3f1
1:036F  7f05              jg       0x376
1:0371  3946de            cmp      word ptr [bp - 0x22], ax
1:0374  767b              jbe      0x3f1
1:0376  ff76e0            push     word ptr [bp - 0x20]
1:0379  ff76de            push     word ptr [bp - 0x22]
1:037C  ff76f0            push     word ptr [bp - 0x10]
1:037F  ff76ee            push     word ptr [bp - 0x12]
1:0382  52                push     dx
1:0383  50                push     ax
1:0384  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_5(1:3062)
1:0389  52                push     dx
1:038A  50                push     ax
1:038B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_4(1:2FC8)
1:0390  0246f6            add      al, byte ptr [bp - 0xa]
1:0393  8b5ee2            mov      bx, word ptr [bp - 0x1e]
1:0396  035e08            add      bx, word ptr [bp + 8]
1:0399  d1e3              shl      bx, 1
1:039B  d1e3              shl      bx, 1
1:039D  8b7606            mov      si, word ptr [bp + 6]
1:03A0  8800              mov      byte ptr [bx + si], al
1:03A2  ff76e0            push     word ptr [bp - 0x20]
1:03A5  ff76de            push     word ptr [bp - 0x22]
1:03A8  ff76e8            push     word ptr [bp - 0x18]
1:03AB  ff76e6            push     word ptr [bp - 0x1a]
1:03AE  ff76e4            push     word ptr [bp - 0x1c]
1:03B1  ff76e2            push     word ptr [bp - 0x1e]
1:03B4  8bfb              mov      di, bx
1:03B6  9add030000        lcall    0, 0x3dd  ; @1:INT:ord_5(1:3062)
1:03BB  52                push     dx
1:03BC  50                push     ax
1:03BD  9ae4030000        lcall    0, 0x3e4  ; @1:INT:ord_4(1:2FC8)
1:03C2  0246ea            add      al, byte ptr [bp - 0x16]
1:03C5  03f7              add      si, di
1:03C7  884401            mov      byte ptr [si + 1], al
1:03CA  ff76e0            push     word ptr [bp - 0x20]
1:03CD  ff76de            push     word ptr [bp - 0x22]
1:03D0  ff76f4            push     word ptr [bp - 0xc]
1:03D3  ff76f2            push     word ptr [bp - 0xe]
1:03D6  ff76e4            push     word ptr [bp - 0x1c]
1:03D9  ff76e2            push     word ptr [bp - 0x1e]
1:03DC  9a85030000        lcall    0, 0x385  ; @1:INT:ord_5(1:3062)
1:03E1  52                push     dx
1:03E2  50                push     ax
1:03E3  9a8c030000        lcall    0, 0x38c  ; @1:INT:ord_4(1:2FC8)
1:03E8  0246fa            add      al, byte ptr [bp - 6]
1:03EB  884402            mov      byte ptr [si + 2], al
1:03EE  e968ff            jmp      0x359
1:03F1  5e                pop      si
1:03F2  5f                pop      di
1:03F3  4d                dec      bp
1:03F4  4d                dec      bp
1:03F5  8be5              mov      sp, bp
1:03F7  1f                pop      ds
1:03F8  5d                pop      bp
1:03F9  4d                dec      bp
1:03FA  cb                retf     
1:03FB  1e                push     ds
1:03FC  58                pop      ax
1:03FD  90                nop      
1:03FE  45                inc      bp
1:03FF  55                push     bp
1:0400  8bec              mov      bp, sp
1:0402  1e                push     ds
1:0403  8ed8              mov      ds, ax
1:0405  83ec36            sub      sp, 0x36
1:0408  57                push     di
1:0409  56                push     si
1:040A  8b5e08            mov      bx, word ptr [bp + 8]
1:040D  8a871c00          mov      al, byte ptr [bx + 0x1c]
1:0411  98                cwde     
1:0412  8946ca            mov      word ptr [bp - 0x36], ax
1:0415  d1e3              shl      bx, 1
1:0417  8a87ce02          mov      al, byte ptr [bx + 0x2ce]
1:041B  98                cwde     
1:041C  8946f6            mov      word ptr [bp - 0xa], ax
1:041F  8a87cf02          mov      al, byte ptr [bx + 0x2cf]
1:0423  98                cwde     
1:0424  8946f4            mov      word ptr [bp - 0xc], ax
1:0427  8b5e08            mov      bx, word ptr [bp + 8]
1:042A  8a87f602          mov      al, byte ptr [bx + 0x2f6]
1:042E  8846fc            mov      byte ptr [bp - 4], al
1:0431  8a8f0403          mov      cl, byte ptr [bx + 0x304]
1:0435  884ed8            mov      byte ptr [bp - 0x28], cl
1:0438  0ac0              or       al, al
1:043A  742e              je       0x46a
1:043C  b80200            mov      ax, 2
1:043F  50                push     ax
1:0440  2bc0              sub      ax, ax
1:0442  50                push     ax
1:0443  0e                push     cs
1:0444  e83afe            call     0x281
1:0447  5b                pop      bx
1:0448  5b                pop      bx
1:0449  0bc0              or       ax, ax
1:044B  7408              je       0x455
1:044D  48                dec      ax
1:044E  745c              je       0x4ac
1:0450  48                dec      ax
1:0451  7460              je       0x4b3
1:0453  eb05              jmp      0x45a
1:0455  c746d20800        mov      word ptr [bp - 0x2e], 8
1:045A  8b46f4            mov      ax, word ptr [bp - 0xc]
1:045D  3946d2            cmp      word ptr [bp - 0x2e], ax
1:0460  7fda              jg       0x43c
1:0462  8b46f6            mov      ax, word ptr [bp - 0xa]
1:0465  3946d2            cmp      word ptr [bp - 0x2e], ax
1:0468  7cd2              jl       0x43c
1:046A  807ed800          cmp      byte ptr [bp - 0x28], 0
1:046E  7422              je       0x492
1:0470  8b46ca            mov      ax, word ptr [bp - 0x36]
1:0473  48                dec      ax
1:0474  50                push     ax
1:0475  b90100            mov      cx, 1
1:0478  51                push     cx
1:0479  8bf0              mov      si, ax
1:047B  0e                push     cs
1:047C  e802fe            call     0x281
1:047F  5b                pop      bx
1:0480  5b                pop      bx
1:0481  8946d4            mov      word ptr [bp - 0x2c], ax
1:0484  56                push     si
1:0485  b80100            mov      ax, 1
1:0488  50                push     ax
1:0489  0e                push     cs
1:048A  e8f4fd            call     0x281
1:048D  5b                pop      bx
1:048E  5b                pop      bx
1:048F  8946d0            mov      word ptr [bp - 0x30], ax
1:0492  c746ce0000        mov      word ptr [bp - 0x32], 0
1:0497  8b5e08            mov      bx, word ptr [bp + 8]
1:049A  d1e3              shl      bx, 1
1:049C  d1e3              shl      bx, 1
1:049E  80bf9a0200        cmp      byte ptr [bx + 0x29a], 0
1:04A3  7515              jne      0x4ba
1:04A5  c746ee0000        mov      word ptr [bp - 0x12], 0
1:04AA  eb42              jmp      0x4ee
1:04AC  c746d21000        mov      word ptr [bp - 0x2e], 0x10
1:04B1  eba7              jmp      0x45a
1:04B3  c746d22000        mov      word ptr [bp - 0x2e], 0x20
1:04B8  eba0              jmp      0x45a
1:04BA  807ed800          cmp      byte ptr [bp - 0x28], 0
1:04BE  7405              je       0x4c5
1:04C0  8b46d4            mov      ax, word ptr [bp - 0x2c]
1:04C3  eb26              jmp      0x4eb
1:04C5  8b5e08            mov      bx, word ptr [bp + 8]
1:04C8  d1e3              shl      bx, 1
1:04CA  d1e3              shl      bx, 1
1:04CC  80bf9b0200        cmp      byte ptr [bx + 0x29b], 0
1:04D1  750a              jne      0x4dd
1:04D3  8b46ca            mov      ax, word ptr [bp - 0x36]
1:04D6  48                dec      ax
1:04D7  50                push     ax
1:04D8  b80100            mov      ax, 1
1:04DB  eb07              jmp      0x4e4
1:04DD  8b46ca            mov      ax, word ptr [bp - 0x36]
1:04E0  48                dec      ax
1:04E1  50                push     ax
1:04E2  2bc0              sub      ax, ax
1:04E4  50                push     ax
1:04E5  0e                push     cs
1:04E6  e898fd            call     0x281
1:04E9  5b                pop      bx
1:04EA  5b                pop      bx
1:04EB  8946ee            mov      word ptr [bp - 0x12], ax
1:04EE  b80c00            mov      ax, 0xc
1:04F1  f76e08            imul     word ptr [bp + 8]
1:04F4  8bd8              mov      bx, ax
1:04F6  035eee            add      bx, word ptr [bp - 0x12]
1:04F9  d1e3              shl      bx, 1
1:04FB  d1e3              shl      bx, 1
1:04FD  8a872a00          mov      al, byte ptr [bx + 0x2a]
1:0501  b103              mov      cl, 3
1:0503  8bd3              mov      dx, bx
1:0505  8b5ece            mov      bx, word ptr [bp - 0x32]
1:0508  d3e3              shl      bx, cl
1:050A  8b7606            mov      si, word ptr [bp + 6]
1:050D  8800              mov      byte ptr [bx + si], al
1:050F  8bfa              mov      di, dx
1:0511  8a852b00          mov      al, byte ptr [di + 0x2b]
1:0515  03f3              add      si, bx
1:0517  884401            mov      byte ptr [si + 1], al
1:051A  8a852c00          mov      al, byte ptr [di + 0x2c]
1:051E  884402            mov      byte ptr [si + 2], al
1:0521  c646cc00          mov      byte ptr [bp - 0x34], 0
1:0525  c746faffff        mov      word ptr [bp - 6], 0xffff
1:052A  807efc00          cmp      byte ptr [bp - 4], 0
1:052E  7418              je       0x548
1:0530  b80a00            mov      ax, 0xa
1:0533  50                push     ax
1:0534  2bc0              sub      ax, ax
1:0536  50                push     ax
1:0537  0e                push     cs
1:0538  e846fd            call     0x281
1:053B  5b                pop      bx
1:053C  5b                pop      bx
1:053D  3d0600            cmp      ax, 6
1:0540  7c06              jl       0x548
1:0542  8b46d2            mov      ax, word ptr [bp - 0x2e]
1:0545  8946fa            mov      word ptr [bp - 6], ax
1:0548  c746faffff        mov      word ptr [bp - 6], 0xffff
1:054D  8b5e08            mov      bx, word ptr [bp + 8]
1:0550  80bfe80200        cmp      byte ptr [bx + 0x2e8], 0
1:0555  7456              je       0x5ad
1:0557  b80500            mov      ax, 5
1:055A  50                push     ax
1:055B  2bc0              sub      ax, ax
1:055D  50                push     ax
1:055E  0e                push     cs
1:055F  e81ffd            call     0x281
1:0562  5b                pop      bx
1:0563  5b                pop      bx
1:0564  eb1c              jmp      0x582
1:0566  c746fa0800        mov      word ptr [bp - 6], 8
1:056B  eb2e              jmp      0x59b
1:056D  c746fa1000        mov      word ptr [bp - 6], 0x10
1:0572  eb27              jmp      0x59b
1:0574  c746fa2000        mov      word ptr [bp - 6], 0x20
1:0579  eb20              jmp      0x59b
1:057B  c746fa4000        mov      word ptr [bp - 6], 0x40
1:0580  eb19              jmp      0x59b
1:0582  3d0500            cmp      ax, 5
1:0585  7714              ja       0x59b
1:0587  d1e0              shl      ax, 1
1:0589  93                xchg     bx, ax
1:058A  2effa78f05        jmp      word ptr cs:[bx + 0x58f]
1:058F  66056d056d05      add      eax, 0x56d056d
1:0595  7405              je       0x59c
1:0597  7405              je       0x59e
1:0599  7b05              jnp      0x5a0
1:059B  8b46f4            mov      ax, word ptr [bp - 0xc]
1:059E  3946fa            cmp      word ptr [bp - 6], ax
1:05A1  7fb4              jg       0x557
1:05A3  8b46f6            mov      ax, word ptr [bp - 0xa]
1:05A6  3946fa            cmp      word ptr [bp - 6], ax
1:05A9  7cac              jl       0x557
1:05AB  eb0f              jmp      0x5bc
1:05AD  ff76f4            push     word ptr [bp - 0xc]
1:05B0  ff76f6            push     word ptr [bp - 0xa]
1:05B3  0e                push     cs
1:05B4  e8cafc            call     0x281
1:05B7  5b                pop      bx
1:05B8  5b                pop      bx
1:05B9  8946fa            mov      word ptr [bp - 6], ax
1:05BC  8b46fa            mov      ax, word ptr [bp - 6]
1:05BF  0346ce            add      ax, word ptr [bp - 0x32]
1:05C2  3d7500            cmp      ax, 0x75
1:05C5  7c03              jl       0x5ca
1:05C7  e93201            jmp      0x6fc
1:05CA  837eee00          cmp      word ptr [bp - 0x12], 0
1:05CE  7575              jne      0x645
1:05D0  8b5e08            mov      bx, word ptr [bp + 8]
1:05D3  d1e3              shl      bx, 1
1:05D5  d1e3              shl      bx, 1
1:05D7  8a879d02          mov      al, byte ptr [bx + 0x29d]
1:05DB  98                cwde     
1:05DC  8bc8              mov      cx, ax
1:05DE  8a879c02          mov      al, byte ptr [bx + 0x29c]
1:05E2  98                cwde     
1:05E3  03c8              add      cx, ax
1:05E5  49                dec      cx
1:05E6  51                push     cx
1:05E7  2bc0              sub      ax, ax
1:05E9  50                push     ax
1:05EA  8bf3              mov      si, bx
1:05EC  0e                push     cs
1:05ED  e891fc            call     0x281
1:05F0  5b                pop      bx
1:05F1  5b                pop      bx
1:05F2  8946f8            mov      word ptr [bp - 8], ax
1:05F5  8a849c02          mov      al, byte ptr [si + 0x29c]
1:05F9  98                cwde     
1:05FA  3b46f8            cmp      ax, word ptr [bp - 8]
1:05FD  7e75              jle      0x674
1:05FF  837ece00          cmp      word ptr [bp - 0x32], 0
1:0603  746f              je       0x674
1:0605  c746f00000        mov      word ptr [bp - 0x10], 0
1:060A  837ef0ff          cmp      word ptr [bp - 0x10], -1
1:060E  7403              je       0x613
1:0610  e99100            jmp      0x6a4
1:0613  c746f0ffff        mov      word ptr [bp - 0x10], 0xffff
1:0618  807ed800          cmp      byte ptr [bp - 0x28], 0
1:061C  7463              je       0x681
1:061E  b80100            mov      ax, 1
1:0621  50                push     ax
1:0622  2bc9              sub      cx, cx
1:0624  51                push     cx
1:0625  0e                push     cs
1:0626  e858fc            call     0x281
1:0629  5b                pop      bx
1:062A  5b                pop      bx
1:062B  0bc0              or       ax, ax
1:062D  7552              jne      0x681
1:062F  b80100            mov      ax, 1
1:0632  50                push     ax
1:0633  2bc0              sub      ax, ax
1:0635  50                push     ax
1:0636  0e                push     cs
1:0637  e847fc            call     0x281
1:063A  5b                pop      bx
1:063B  5b                pop      bx
1:063C  0bc0              or       ax, ax
1:063E  753b              jne      0x67b
1:0640  8b46d4            mov      ax, word ptr [bp - 0x2c]
1:0643  eb39              jmp      0x67e
1:0645  8b5e08            mov      bx, word ptr [bp + 8]
1:0648  d1e3              shl      bx, 1
1:064A  d1e3              shl      bx, 1
1:064C  8a879a02          mov      al, byte ptr [bx + 0x29a]
1:0650  98                cwde     
1:0651  8bc8              mov      cx, ax
1:0653  8a879b02          mov      al, byte ptr [bx + 0x29b]
1:0657  98                cwde     
1:0658  03c8              add      cx, ax
1:065A  49                dec      cx
1:065B  51                push     cx
1:065C  2bc0              sub      ax, ax
1:065E  50                push     ax
1:065F  8bf3              mov      si, bx
1:0661  0e                push     cs
1:0662  e81cfc            call     0x281
1:0665  5b                pop      bx
1:0666  5b                pop      bx
1:0667  8946f8            mov      word ptr [bp - 8], ax
1:066A  8a849a02          mov      al, byte ptr [si + 0x29a]
1:066E  98                cwde     
1:066F  3b46f8            cmp      ax, word ptr [bp - 8]
1:0672  7e91              jle      0x605
1:0674  c746f0ffff        mov      word ptr [bp - 0x10], 0xffff
1:0679  eb8f              jmp      0x60a
1:067B  8b46d0            mov      ax, word ptr [bp - 0x30]
1:067E  8946f0            mov      word ptr [bp - 0x10], ax
1:0681  837ef0ff          cmp      word ptr [bp - 0x10], -1
1:0685  7512              jne      0x699
1:0687  8b46ca            mov      ax, word ptr [bp - 0x36]
1:068A  48                dec      ax
1:068B  50                push     ax
1:068C  b80100            mov      ax, 1
1:068F  50                push     ax
1:0690  0e                push     cs
1:0691  e8edfb            call     0x281
1:0694  5b                pop      bx
1:0695  5b                pop      bx
1:0696  8946f0            mov      word ptr [bp - 0x10], ax
1:0699  8b46f0            mov      ax, word ptr [bp - 0x10]
1:069C  3946ee            cmp      word ptr [bp - 0x12], ax
1:069F  7503              jne      0x6a4
1:06A1  e96fff            jmp      0x613
1:06A4  b80c00            mov      ax, 0xc
1:06A7  f76e08            imul     word ptr [bp + 8]
1:06AA  8b5ef0            mov      bx, word ptr [bp - 0x10]
1:06AD  895eee            mov      word ptr [bp - 0x12], bx
1:06B0  03d8              add      bx, ax
1:06B2  d1e3              shl      bx, 1
1:06B4  d1e3              shl      bx, 1
1:06B6  8a872a00          mov      al, byte ptr [bx + 0x2a]
1:06BA  b103              mov      cl, 3
1:06BC  8bd3              mov      dx, bx
1:06BE  8b5efa            mov      bx, word ptr [bp - 6]
1:06C1  035ece            add      bx, word ptr [bp - 0x32]
1:06C4  8bf3              mov      si, bx
1:06C6  d3e3              shl      bx, cl
1:06C8  8b7e06            mov      di, word ptr [bp + 6]
1:06CB  8801              mov      byte ptr [bx + di], al
1:06CD  8bfa              mov      di, dx
1:06CF  8a852b00          mov      al, byte ptr [di + 0x2b]
1:06D3  035e06            add      bx, word ptr [bp + 6]
1:06D6  884701            mov      byte ptr [bx + 1], al
1:06D9  8a852c00          mov      al, byte ptr [di + 0x2c]
1:06DD  884702            mov      byte ptr [bx + 2], al
1:06E0  8bc6              mov      ax, si
1:06E2  d1e6              shl      si, 1
1:06E4  56                push     si
1:06E5  8b4ece            mov      cx, word ptr [bp - 0x32]
1:06E8  d1e1              shl      cx, 1
1:06EA  51                push     cx
1:06EB  ff7606            push     word ptr [bp + 6]
1:06EE  8bf0              mov      si, ax
1:06F0  0e                push     cs
1:06F1  e8b6fb            call     0x2aa
1:06F4  83c406            add      sp, 6
1:06F7  8976ce            mov      word ptr [bp - 0x32], si
1:06FA  eb04              jmp      0x700
1:06FC  c646cc01          mov      byte ptr [bp - 0x34], 1
1:0700  b87500            mov      ax, 0x75
1:0703  50                push     ax
1:0704  2bc0              sub      ax, ax
1:0706  50                push     ax
1:0707  0e                push     cs
1:0708  e876fb            call     0x281
1:070B  5b                pop      bx
1:070C  5b                pop      bx
1:070D  3b46ce            cmp      ax, word ptr [bp - 0x32]
1:0710  7c03              jl       0x715
1:0712  e910fe            jmp      0x525
1:0715  807ecc00          cmp      byte ptr [bp - 0x34], 0
1:0719  750d              jne      0x728
1:071B  8b5e08            mov      bx, word ptr [bp + 8]
1:071E  80bf120300        cmp      byte ptr [bx + 0x312], 0
1:0723  7503              jne      0x728
1:0725  e9fdfd            jmp      0x525
1:0728  837ece20          cmp      word ptr [bp - 0x32], 0x20
1:072C  7d03              jge      0x731
1:072E  e9f4fd            jmp      0x525
1:0731  b8ea00            mov      ax, 0xea
1:0734  50                push     ax
1:0735  8b46ce            mov      ax, word ptr [bp - 0x32]
1:0738  d1e0              shl      ax, 1
1:073A  50                push     ax
1:073B  ff7606            push     word ptr [bp + 6]
1:073E  0e                push     cs
1:073F  e868fb            call     0x2aa
1:0742  83c406            add      sp, 6
1:0745  b83000            mov      ax, 0x30
1:0748  f76e08            imul     word ptr [bp + 8]
1:074B  8bd8              mov      bx, ax
1:074D  80bf2a0000        cmp      byte ptr [bx + 0x2a], 0
1:0752  7514              jne      0x768
1:0754  80bf2b0000        cmp      byte ptr [bx + 0x2b], 0
1:0759  750d              jne      0x768
1:075B  80bf2c0000        cmp      byte ptr [bx + 0x2c], 0
1:0760  7506              jne      0x768
1:0762  c646f201          mov      byte ptr [bp - 0xe], 1
1:0766  eb04              jmp      0x76c
1:0768  c646f200          mov      byte ptr [bp - 0xe], 0
1:076C  a1f409            mov      ax, word ptr [0x9f4]
1:076F  3906f809          cmp      word ptr [0x9f8], ax
1:0773  7516              jne      0x78b
1:0775  c706fe09e800      mov      word ptr [0x9fe], 0xe8
1:077B  c706000a0000      mov      word ptr [0xa00], 0
1:0781  48                dec      ax
1:0782  742b              je       0x7af
1:0784  833ef40903        cmp      word ptr [0x9f4], 3
1:0789  eb22              jmp      0x7ad
1:078B  c706fe09e800      mov      word ptr [0x9fe], 0xe8
1:0791  c706000a0000      mov      word ptr [0xa00], 0
1:0797  3d0100            cmp      ax, 1
1:079A  7413              je       0x7af
1:079C  3d0300            cmp      ax, 3
1:079F  740e              je       0x7af
1:07A1  833ef80901        cmp      word ptr [0x9f8], 1
1:07A6  7407              je       0x7af
1:07A8  833ef80903        cmp      word ptr [0x9f8], 3
1:07AD  7512              jne      0x7c1
1:07AF  807ef200          cmp      byte ptr [bp - 0xe], 0
1:07B3  740c              je       0x7c1
1:07B5  c706fe09e900      mov      word ptr [0x9fe], 0xe9
1:07BB  c706000a0000      mov      word ptr [0xa00], 0
1:07C1  5e                pop      si
1:07C2  5f                pop      di
1:07C3  4d                dec      bp
1:07C4  4d                dec      bp
1:07C5  8be5              mov      sp, bp
1:07C7  1f                pop      ds
1:07C8  5d                pop      bp
1:07C9  4d                dec      bp
1:07CA  cb                retf     
1:07CB  1e                push     ds
1:07CC  58                pop      ax
1:07CD  90                nop      
1:07CE  45                inc      bp
1:07CF  55                push     bp
1:07D0  8bec              mov      bp, sp
1:07D2  1e                push     ds
1:07D3  8ed8              mov      ds, ax
1:07D5  81ecf000          sub      sp, 0xf0
1:07D9  56                push     si
1:07DA  c706700a0000      mov      word ptr [0xa70], 0
1:07E0  ff366e0a          push     word ptr [0xa6e]
1:07E4  9a7b090000        lcall    0, 0x97b  ; @1:KERNEL.LocalLock
1:07E9  a3b40b            mov      word ptr [0xbb4], ax
1:07EC  833e740a0d        cmp      word ptr [0xa74], 0xd
1:07F1  7d05              jge      0x7f8
1:07F3  a1740a            mov      ax, word ptr [0xa74]
1:07F6  eb0d              jmp      0x805
1:07F8  b80c00            mov      ax, 0xc
1:07FB  50                push     ax
1:07FC  2bc0              sub      ax, ax
1:07FE  50                push     ax
1:07FF  0e                push     cs
1:0800  e87efa            call     0x281
1:0803  5b                pop      bx
1:0804  5b                pop      bx
1:0805  a3f808            mov      word ptr [0x8f8], ax
1:0808  50                push     ax
1:0809  ff36b40b          push     word ptr [0xbb4]
1:080D  0e                push     cs
1:080E  e8eafb            call     0x3fb
1:0811  5b                pop      bx
1:0812  5b                pop      bx
1:0813  833ea00a06        cmp      word ptr [0xaa0], 6
1:0818  745e              je       0x878
1:081A  c706fc080000      mov      word ptr [0x8fc], 0
1:0820  eb05              jmp      0x827
1:0822  8306fc0802        add      word ptr [0x8fc], 2
1:0827  813efc08ea00      cmp      word ptr [0x8fc], 0xea
1:082D  7d73              jge      0x8a2
1:082F  8b1efc08          mov      bx, word ptr [0x8fc]
1:0833  d1e3              shl      bx, 1
1:0835  d1e3              shl      bx, 1
1:0837  8b36b40b          mov      si, word ptr [0xbb4]
1:083B  8a00              mov      al, byte ptr [bx + si]
1:083D  03f3              add      si, bx
1:083F  884404            mov      byte ptr [si + 4], al
1:0842  8b1efc08          mov      bx, word ptr [0x8fc]
1:0846  d1e3              shl      bx, 1
1:0848  d1e3              shl      bx, 1
1:084A  031eb40b          add      bx, word ptr [0xbb4]
1:084E  8a4701            mov      al, byte ptr [bx + 1]
1:0851  884705            mov      byte ptr [bx + 5], al
1:0854  8b1efc08          mov      bx, word ptr [0x8fc]
1:0858  d1e3              shl      bx, 1
1:085A  d1e3              shl      bx, 1
1:085C  031eb40b          add      bx, word ptr [0xbb4]
1:0860  8a4702            mov      al, byte ptr [bx + 2]
1:0863  884706            mov      byte ptr [bx + 6], al
1:0866  8b36fc08          mov      si, word ptr [0x8fc]
1:086A  d1e6              shl      si, 1
1:086C  d1e6              shl      si, 1
1:086E  8b1eb40b          mov      bx, word ptr [0xbb4]
1:0872  c6400701          mov      byte ptr [bx + si + 7], 1
1:0876  ebaa              jmp      0x822
1:0878  833e740a0d        cmp      word ptr [0xa74], 0xd
1:087D  7d05              jge      0x884
1:087F  a1740a            mov      ax, word ptr [0xa74]
1:0882  eb0d              jmp      0x891
1:0884  b80c00            mov      ax, 0xc
1:0887  50                push     ax
1:0888  2bc0              sub      ax, ax
1:088A  50                push     ax
1:088B  0e                push     cs
1:088C  e8f2f9            call     0x281
1:088F  5b                pop      bx
1:0890  5b                pop      bx
1:0891  a3fa08            mov      word ptr [0x8fa], ax
1:0894  50                push     ax
1:0895  a1b40b            mov      ax, word ptr [0xbb4]
1:0898  050400            add      ax, 4
1:089B  50                push     ax
1:089C  0e                push     cs
1:089D  e85bfb            call     0x3fb
1:08A0  5b                pop      bx
1:08A1  5b                pop      bx
1:08A2  c706fc080000      mov      word ptr [0x8fc], 0
1:08A8  8b1efc08          mov      bx, word ptr [0x8fc]
1:08AC  d1e3              shl      bx, 1
1:08AE  d1e3              shl      bx, 1
1:08B0  8b36b40b          mov      si, word ptr [0xbb4]
1:08B4  8a00              mov      al, byte ptr [bx + si]
1:08B6  03f3              add      si, bx
1:08B8  8884a803          mov      byte ptr [si + 0x3a8], al
1:08BC  8b1efc08          mov      bx, word ptr [0x8fc]
1:08C0  d1e3              shl      bx, 1
1:08C2  d1e3              shl      bx, 1
1:08C4  031eb40b          add      bx, word ptr [0xbb4]
1:08C8  8a4701            mov      al, byte ptr [bx + 1]
1:08CB  8887a903          mov      byte ptr [bx + 0x3a9], al
1:08CF  8b1efc08          mov      bx, word ptr [0x8fc]
1:08D3  d1e3              shl      bx, 1
1:08D5  d1e3              shl      bx, 1
1:08D7  031eb40b          add      bx, word ptr [0xbb4]
1:08DB  8a4702            mov      al, byte ptr [bx + 2]
1:08DE  8887aa03          mov      byte ptr [bx + 0x3aa], al
1:08E2  8b36fc08          mov      si, word ptr [0x8fc]
1:08E6  d1e6              shl      si, 1
1:08E8  d1e6              shl      si, 1
1:08EA  8b1eb40b          mov      bx, word ptr [0xbb4]
1:08EE  c680ab0301        mov      byte ptr [bx + si + 0x3ab], 1
1:08F3  ff06fc08          inc      word ptr [0x8fc]
1:08F7  813efc08ea00      cmp      word ptr [0x8fc], 0xea
1:08FD  7ca9              jl       0x8a8
1:08FF  ff366e0a          push     word ptr [0xa6e]
1:0903  9a1c0a0000        lcall    0, 0xa1c  ; @1:KERNEL.LocalUnlock
1:0908  ff36b60b          push     word ptr [0xbb6]
1:090C  2bc0              sub      ax, ax
1:090E  50                push     ax
1:090F  c41e100a          les      bx, ptr [0xa10]
1:0913  26ff7702          push     word ptr es:[bx + 2]
1:0917  8d4704            lea      ax, [bx + 4]
1:091A  06                push     es
1:091B  50                push     ax
1:091C  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetPaletteEntries
1:0921  c706fc080000      mov      word ptr [0x8fc], 0
1:0927  eb0f              jmp      0x938
1:0929  8bf0              mov      si, ax
1:092B  d1e6              shl      si, 1
1:092D  d1e6              shl      si, 1
1:092F  26c6400701        mov      byte ptr es:[bx + si + 7], 1
1:0934  ff06fc08          inc      word ptr [0x8fc]
1:0938  a1fc08            mov      ax, word ptr [0x8fc]
1:093B  c41e100a          les      bx, ptr [0xa10]
1:093F  26394702          cmp      word ptr es:[bx + 2], ax
1:0943  77e4              ja       0x929
1:0945  ff36b60b          push     word ptr [0xbb6]
1:0949  2bc0              sub      ax, ax
1:094B  50                push     ax
1:094C  26ff7702          push     word ptr es:[bx + 2]
1:0950  8d4704            lea      ax, [bx + 4]
1:0953  06                push     es
1:0954  50                push     ax
1:0955  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetPaletteEntries
1:095A  ff36f609          push     word ptr [0x9f6]
1:095E  ff36b60b          push     word ptr [0xbb6]
1:0962  2bc0              sub      ax, ax
1:0964  50                push     ax
1:0965  9a450a0000        lcall    0, 0xa45  ; @1:USER.SelectPalette
1:096A  a3f608            mov      word ptr [0x8f6], ax
1:096D  ff36f609          push     word ptr [0x9f6]
1:0971  9aa3010000        lcall    0, 0x1a3  ; @1:USER.RealizePalette
1:0976  ff366e0a          push     word ptr [0xa6e]
1:097A  9a36010000        lcall    0, 0x136  ; @1:KERNEL.LocalLock
1:097F  a3b40b            mov      word ptr [0xbb4], ax
1:0982  a1700a            mov      ax, word ptr [0xa70]
1:0985  a3fc08            mov      word ptr [0x8fc], ax
1:0988  e98100            jmp      0xa0c
1:098B  8b1efc08          mov      bx, word ptr [0x8fc]
1:098F  d1e3              shl      bx, 1
1:0991  d1e3              shl      bx, 1
1:0993  8b36b40b          mov      si, word ptr [0xbb4]
1:0997  8a00              mov      al, byte ptr [bx + si]
1:0999  8b36fc08          mov      si, word ptr [0x8fc]
1:099D  2b36700a          sub      si, word ptr [0xa70]
1:09A1  d1e6              shl      si, 1
1:09A3  d1e6              shl      si, 1
1:09A5  c41e100a          les      bx, ptr [0xa10]
1:09A9  26884004          mov      byte ptr es:[bx + si + 4], al
1:09AD  8b36fc08          mov      si, word ptr [0x8fc]
1:09B1  d1e6              shl      si, 1
1:09B3  d1e6              shl      si, 1
1:09B5  8b1eb40b          mov      bx, word ptr [0xbb4]
1:09B9  8a4001            mov      al, byte ptr [bx + si + 1]
1:09BC  8b36fc08          mov      si, word ptr [0x8fc]
1:09C0  2b36700a          sub      si, word ptr [0xa70]
1:09C4  d1e6              shl      si, 1
1:09C6  d1e6              shl      si, 1
1:09C8  c41e100a          les      bx, ptr [0xa10]
1:09CC  26884005          mov      byte ptr es:[bx + si + 5], al
1:09D0  8b36fc08          mov      si, word ptr [0x8fc]
1:09D4  d1e6              shl      si, 1
1:09D6  d1e6              shl      si, 1
1:09D8  8b1eb40b          mov      bx, word ptr [0xbb4]
1:09DC  8a4002            mov      al, byte ptr [bx + si + 2]
1:09DF  8b36fc08          mov      si, word ptr [0x8fc]
1:09E3  2b36700a          sub      si, word ptr [0xa70]
1:09E7  d1e6              shl      si, 1
1:09E9  d1e6              shl      si, 1
1:09EB  c41e100a          les      bx, ptr [0xa10]
1:09EF  26884006          mov      byte ptr es:[bx + si + 6], al
1:09F3  8b36fc08          mov      si, word ptr [0x8fc]
1:09F7  2b36700a          sub      si, word ptr [0xa70]
1:09FB  d1e6              shl      si, 1
1:09FD  d1e6              shl      si, 1
1:09FF  c41e100a          les      bx, ptr [0xa10]
1:0A03  26c6400701        mov      byte ptr es:[bx + si + 7], 1
1:0A08  ff06fc08          inc      word ptr [0x8fc]
1:0A0C  813efc08ea00      cmp      word ptr [0x8fc], 0xea
1:0A12  7d03              jge      0xa17
1:0A14  e974ff            jmp      0x98b
1:0A17  ff366e0a          push     word ptr [0xa6e]
1:0A1B  9a32020000        lcall    0, 0x232  ; @1:KERNEL.LocalUnlock
1:0A20  ff36b60b          push     word ptr [0xbb6]
1:0A24  2bc0              sub      ax, ax
1:0A26  50                push     ax
1:0A27  c41e100a          les      bx, ptr [0xa10]
1:0A2B  26ff7702          push     word ptr es:[bx + 2]
1:0A2F  8d4704            lea      ax, [bx + 4]
1:0A32  06                push     es
1:0A33  50                push     ax
1:0A34  9a4d020000        lcall    0, 0x24d  ; @1:GDI.AnimatePalette
1:0A39  ff36f609          push     word ptr [0x9f6]
1:0A3D  ff36f608          push     word ptr [0x8f6]
1:0A41  2bc0              sub      ax, ax
1:0A43  50                push     ax
1:0A44  9a97010000        lcall    0, 0x197  ; @1:USER.SelectPalette
1:0A49  5e                pop      si
1:0A4A  4d                dec      bp
1:0A4B  4d                dec      bp
1:0A4C  8be5              mov      sp, bp
1:0A4E  1f                pop      ds
1:0A4F  5d                pop      bp
1:0A50  4d                dec      bp
1:0A51  cb                retf     
1:0A52  1e                push     ds
1:0A53  58                pop      ax
1:0A54  90                nop      
1:0A55  45                inc      bp
1:0A56  55                push     bp
1:0A57  8bec              mov      bp, sp
1:0A59  1e                push     ds
1:0A5A  8ed8              mov      ds, ax
1:0A5C  83ec04            sub      sp, 4
1:0A5F  56                push     si
1:0A60  803ed00a00        cmp      byte ptr [0xad0], 0
1:0A65  7504              jne      0xa6b
1:0A67  0e                push     cs
1:0A68  e8a7f5            call     0x12
1:0A6B  b81400            mov      ax, 0x14
1:0A6E  50                push     ax
1:0A6F  9affff0000        lcall    0, 0xffff  ; @1:USER.#249
1:0A74  250100            and      ax, 1
1:0A77  a39e0a            mov      word ptr [0xa9e], ax
1:0A7A  c41ee40b          les      bx, ptr [0xbe4]
1:0A7E  268b470a          mov      ax, word ptr es:[bx + 0xa]
1:0A82  8946fc            mov      word ptr [bp - 4], ax
1:0A85  3d1400            cmp      ax, 0x14
1:0A88  7d08              jge      0xa92
1:0A8A  c706e20b0100      mov      word ptr [0xbe2], 1
1:0A90  eb2d              jmp      0xabf
1:0A92  3d2800            cmp      ax, 0x28
1:0A95  7d08              jge      0xa9f
1:0A97  c706e20b0200      mov      word ptr [0xbe2], 2
1:0A9D  eb20              jmp      0xabf
1:0A9F  3d3c00            cmp      ax, 0x3c
1:0AA2  7d08              jge      0xaac
1:0AA4  c706e20b0400      mov      word ptr [0xbe2], 4
1:0AAA  eb13              jmp      0xabf
1:0AAC  3d5000            cmp      ax, 0x50
1:0AAF  7d08              jge      0xab9
1:0AB1  c706e20b0800      mov      word ptr [0xbe2], 8
1:0AB7  eb06              jmp      0xabf
1:0AB9  c706e20b1000      mov      word ptr [0xbe2], 0x10
1:0ABF  c41e060a          les      bx, ptr [0xa06]
1:0AC3  26837f0a04        cmp      word ptr es:[bx + 0xa], 4
1:0AC8  7f06              jg       0xad0
1:0ACA  c706e20b0800      mov      word ptr [0xbe2], 8
1:0AD0  c706280b1000      mov      word ptr [0xb28], 0x10
1:0AD6  a16009            mov      ax, word ptr [0x960]
1:0AD9  24e1              and      al, 0xe1
1:0ADB  d1f8              sar      ax, 1
1:0ADD  a30c0a            mov      word ptr [0xa0c], ax
1:0AE0  8b0eb409          mov      cx, word ptr [0x9b4]
1:0AE4  80e1e1            and      cl, 0xe1
1:0AE7  d1f9              sar      cx, 1
1:0AE9  890e140a          mov      word ptr [0xa14], cx
1:0AED  c706ea090200      mov      word ptr [0x9ea], 2
1:0AF3  8bd0              mov      dx, ax
1:0AF5  2d1000            sub      ax, 0x10
1:0AF8  a3b609            mov      word ptr [0x9b6], ax
1:0AFB  8bc1              mov      ax, cx
1:0AFD  83e910            sub      cx, 0x10
1:0B00  890eb809          mov      word ptr [0x9b8], cx
1:0B04  83c210            add      dx, 0x10
1:0B07  8916ba09          mov      word ptr [0x9ba], dx
1:0B0B  051000            add      ax, 0x10
1:0B0E  a3bc09            mov      word ptr [0x9bc], ax
1:0B11  c41ee40b          les      bx, ptr [0xbe4]
1:0B15  268b4706          mov      ax, word ptr es:[bx + 6]
1:0B19  40                inc      ax
1:0B1A  a3fa09            mov      word ptr [0x9fa], ax
1:0B1D  803ed00a00        cmp      byte ptr [0xad0], 0
1:0B22  7403              je       0xb27
1:0B24  a3a00a            mov      word ptr [0xaa0], ax
1:0B27  268b470c          mov      ax, word ptr es:[bx + 0xc]
1:0B2B  a3040a            mov      word ptr [0xa04], ax
1:0B2E  3d1500            cmp      ax, 0x15
1:0B31  7506              jne      0xb39
1:0B33  c706040a1400      mov      word ptr [0xa04], 0x14
1:0B39  833efa0905        cmp      word ptr [0x9fa], 5
1:0B3E  7f26              jg       0xb66
1:0B40  a1fa09            mov      ax, word ptr [0x9fa]
1:0B43  a3f409            mov      word ptr [0x9f4], ax
1:0B46  a3f809            mov      word ptr [0x9f8], ax
1:0B49  b80400            mov      ax, 4
1:0B4C  50                push     ax
1:0B4D  b80100            mov      ax, 1
1:0B50  50                push     ax
1:0B51  0e                push     cs
1:0B52  e82cf7            call     0x281
1:0B55  5b                pop      bx
1:0B56  5b                pop      bx
1:0B57  48                dec      ax
1:0B58  7504              jne      0xb5e
1:0B5A  b001              mov      al, 1
1:0B5C  eb02              jmp      0xb60
1:0B5E  2ac0              sub      al, al
1:0B60  a2ec09            mov      byte ptr [0x9ec], al
1:0B63  e98100            jmp      0xbe7
1:0B66  807e0600          cmp      byte ptr [bp + 6], 0
1:0B6A  741f              je       0xb8b
1:0B6C  b80500            mov      ax, 5
1:0B6F  50                push     ax
1:0B70  b80200            mov      ax, 2
1:0B73  50                push     ax
1:0B74  0e                push     cs
1:0B75  e809f7            call     0x281
1:0B78  5b                pop      bx
1:0B79  5b                pop      bx
1:0B7A  a3f409            mov      word ptr [0x9f4], ax
1:0B7D  c706f8090300      mov      word ptr [0x9f8], 3
1:0B83  3906f809          cmp      word ptr [0x9f8], ax
1:0B87  74e3              je       0xb6c
1:0B89  eb2b              jmp      0xbb6
1:0B8B  b80500            mov      ax, 5
1:0B8E  50                push     ax
1:0B8F  b90100            mov      cx, 1
1:0B92  51                push     cx
1:0B93  0e                push     cs
1:0B94  e8eaf6            call     0x281
1:0B97  5b                pop      bx
1:0B98  5b                pop      bx
1:0B99  a3f409            mov      word ptr [0x9f4], ax
1:0B9C  b80500            mov      ax, 5
1:0B9F  50                push     ax
1:0BA0  b80100            mov      ax, 1
1:0BA3  50                push     ax
1:0BA4  0e                push     cs
1:0BA5  e8d9f6            call     0x281
1:0BA8  5b                pop      bx
1:0BA9  5b                pop      bx
1:0BAA  a3f809            mov      word ptr [0x9f8], ax
1:0BAD  a1f409            mov      ax, word ptr [0x9f4]
1:0BB0  3906f809          cmp      word ptr [0x9f8], ax
1:0BB4  74d5              je       0xb8b
1:0BB6  b80400            mov      ax, 4
1:0BB9  50                push     ax
1:0BBA  b80100            mov      ax, 1
1:0BBD  50                push     ax
1:0BBE  0e                push     cs
1:0BBF  e8bff6            call     0x281
1:0BC2  5b                pop      bx
1:0BC3  5b                pop      bx
1:0BC4  48                dec      ax
1:0BC5  7504              jne      0xbcb
1:0BC7  b001              mov      al, 1
1:0BC9  eb02              jmp      0xbcd
1:0BCB  2ac0              sub      al, al
1:0BCD  a2ec09            mov      byte ptr [0x9ec], al
1:0BD0  b80400            mov      ax, 4
1:0BD3  50                push     ax
1:0BD4  b80100            mov      ax, 1
1:0BD7  50                push     ax
1:0BD8  0e                push     cs
1:0BD9  e8a5f6            call     0x281
1:0BDC  5b                pop      bx
1:0BDD  5b                pop      bx
1:0BDE  48                dec      ax
1:0BDF  7504              jne      0xbe5
1:0BE1  b001              mov      al, 1
1:0BE3  eb02              jmp      0xbe7
1:0BE5  2ac0              sub      al, al
1:0BE7  a2f209            mov      byte ptr [0x9f2], al
1:0BEA  c746fc0000        mov      word ptr [bp - 4], 0
1:0BEF  e9dc01            jmp      0xdce
1:0BF2  8b5efc            mov      bx, word ptr [bp - 4]
1:0BF5  d1e3              shl      bx, 1
1:0BF7  c787ba0b4000      mov      word ptr [bx + 0xbba], 0x40
1:0BFD  b80200            mov      ax, 2
1:0C00  50                push     ax
1:0C01  2bc0              sub      ax, ax
1:0C03  50                push     ax
1:0C04  0e                push     cs
1:0C05  e879f6            call     0x281
1:0C08  5b                pop      bx
1:0C09  5b                pop      bx
1:0C0A  0bc0              or       ax, ax
1:0C0C  7442              je       0xc50
1:0C0E  48                dec      ax
1:0C0F  7459              je       0xc6a
1:0C11  48                dec      ax
1:0C12  7463              je       0xc77
1:0C14  48                dec      ax
1:0C15  746d              je       0xc84
1:0C17  48                dec      ax
1:0C18  7477              je       0xc91
1:0C1A  eb3f              jmp      0xc5b
1:0C1C  8b5efc            mov      bx, word ptr [bp - 4]
1:0C1F  d1e3              shl      bx, 1
1:0C21  c787ba0b8000      mov      word ptr [bx + 0xbba], 0x80
1:0C27  ebd4              jmp      0xbfd
1:0C29  8b5efc            mov      bx, word ptr [bp - 4]
1:0C2C  d1e3              shl      bx, 1
1:0C2E  c787ba0bc000      mov      word ptr [bx + 0xbba], 0xc0
1:0C34  ebc7              jmp      0xbfd
1:0C36  8b5efc            mov      bx, word ptr [bp - 4]
1:0C39  d1e3              shl      bx, 1
1:0C3B  c787ba0b0001      mov      word ptr [bx + 0xbba], 0x100
1:0C41  ebba              jmp      0xbfd
1:0C43  8b5efc            mov      bx, word ptr [bp - 4]
1:0C46  d1e3              shl      bx, 1
1:0C48  c787ba0b4001      mov      word ptr [bx + 0xbba], 0x140
1:0C4E  ebad              jmp      0xbfd
1:0C50  8b5efc            mov      bx, word ptr [bp - 4]
1:0C53  d1e3              shl      bx, 1
1:0C55  c787000b0200      mov      word ptr [bx + 0xb00], 2
1:0C5B  b80500            mov      ax, 5
1:0C5E  50                push     ax
1:0C5F  2bc0              sub      ax, ax
1:0C61  50                push     ax
1:0C62  0e                push     cs
1:0C63  e81bf6            call     0x281
1:0C66  5b                pop      bx
1:0C67  5b                pop      bx
1:0C68  eb75              jmp      0xcdf
1:0C6A  8b5efc            mov      bx, word ptr [bp - 4]
1:0C6D  d1e3              shl      bx, 1
1:0C6F  c787000b0300      mov      word ptr [bx + 0xb00], 3
1:0C75  ebe4              jmp      0xc5b
1:0C77  8b5efc            mov      bx, word ptr [bp - 4]
1:0C7A  d1e3              shl      bx, 1
1:0C7C  c787000b0400      mov      word ptr [bx + 0xb00], 4
1:0C82  ebd7              jmp      0xc5b
1:0C84  8b5efc            mov      bx, word ptr [bp - 4]
1:0C87  d1e3              shl      bx, 1
1:0C89  c787000b0600      mov      word ptr [bx + 0xb00], 6
1:0C8F  ebca              jmp      0xc5b
1:0C91  8b5efc            mov      bx, word ptr [bp - 4]
1:0C94  d1e3              shl      bx, 1
1:0C96  c787000b0800      mov      word ptr [bx + 0xb00], 8
1:0C9C  ebbd              jmp      0xc5b
1:0C9E  8b5efc            mov      bx, word ptr [bp - 4]
1:0CA1  d1e3              shl      bx, 1
1:0CA3  c7878c090000      mov      word ptr [bx + 0x98c], 0
1:0CA9  eb4d              jmp      0xcf8
1:0CAB  8b5efc            mov      bx, word ptr [bp - 4]
1:0CAE  d1e3              shl      bx, 1
1:0CB0  c7878c09e803      mov      word ptr [bx + 0x98c], 0x3e8
1:0CB6  eb40              jmp      0xcf8
1:0CB8  8b5efc            mov      bx, word ptr [bp - 4]
1:0CBB  d1e3              shl      bx, 1
1:0CBD  c7878c09d007      mov      word ptr [bx + 0x98c], 0x7d0
1:0CC3  eb33              jmp      0xcf8
1:0CC5  8b5efc            mov      bx, word ptr [bp - 4]
1:0CC8  d1e3              shl      bx, 1
1:0CCA  c7878c09b80b      mov      word ptr [bx + 0x98c], 0xbb8
1:0CD0  eb26              jmp      0xcf8
1:0CD2  8b5efc            mov      bx, word ptr [bp - 4]
1:0CD5  d1e3              shl      bx, 1
1:0CD7  c7878c098813      mov      word ptr [bx + 0x98c], 0x1388
1:0CDD  eb19              jmp      0xcf8
1:0CDF  3d0500            cmp      ax, 5
1:0CE2  7714              ja       0xcf8
1:0CE4  d1e0              shl      ax, 1
1:0CE6  93                xchg     bx, ax
1:0CE7  2effa7ec0c        jmp      word ptr cs:[bx + 0xcec]
1:0CEC  9e                sahf     
1:0CED  0c9e              or       al, 0x9e
1:0CEF  0cab              or       al, 0xab
1:0CF1  0cb8              or       al, 0xb8
1:0CF3  0cc5              or       al, 0xc5
1:0CF5  0cd2              or       al, 0xd2
1:0CF7  0cb8              or       al, 0xb8
1:0CF9  050050            add      ax, 0x5000
1:0CFC  2bc0              sub      ax, ax
1:0CFE  50                push     ax
1:0CFF  0e                push     cs
1:0D00  e87ef5            call     0x281
1:0D03  5b                pop      bx
1:0D04  5b                pop      bx
1:0D05  eb34              jmp      0xd3b
1:0D07  8b5efc            mov      bx, word ptr [bp - 4]
1:0D0A  d1e3              shl      bx, 1
1:0D0C  c787760a0000      mov      word ptr [bx + 0xa76], 0
1:0D12  eb40              jmp      0xd54
1:0D14  8b5efc            mov      bx, word ptr [bp - 4]
1:0D17  d1e3              shl      bx, 1
1:0D19  c787760a0200      mov      word ptr [bx + 0xa76], 2
1:0D1F  eb33              jmp      0xd54
1:0D21  8b5efc            mov      bx, word ptr [bp - 4]
1:0D24  d1e3              shl      bx, 1
1:0D26  c787760a0400      mov      word ptr [bx + 0xa76], 4
1:0D2C  eb26              jmp      0xd54
1:0D2E  8b5efc            mov      bx, word ptr [bp - 4]
1:0D31  d1e3              shl      bx, 1
1:0D33  c787760a0800      mov      word ptr [bx + 0xa76], 8
1:0D39  eb19              jmp      0xd54
1:0D3B  3d0500            cmp      ax, 5
1:0D3E  7714              ja       0xd54
1:0D40  d1e0              shl      ax, 1
1:0D42  93                xchg     bx, ax
1:0D43  2effa7480d        jmp      word ptr cs:[bx + 0xd48]
1:0D48  07                pop      es
1:0D49  0d070d            or       ax, 0xd07
1:0D4C  07                pop      es
1:0D4D  0d140d            or       ax, 0xd14
1:0D50  210d              and      word ptr [di], cx
1:0D52  2e0db803          or       ax, 0x3b8
1:0D56  00502b            add      byte ptr [bx + si + 0x2b], dl
1:0D59  c0500ee8          rcl      byte ptr [bx + si + 0xe], 0xe8
1:0D5D  22f5              and      dh, ch
1:0D5F  5b                pop      bx
1:0D60  5b                pop      bx
1:0D61  0bc0              or       ax, ax
1:0D63  740b              je       0xd70
1:0D65  48                dec      ax
1:0D66  7431              je       0xd99
1:0D68  48                dec      ax
1:0D69  743b              je       0xda6
1:0D6B  48                dec      ax
1:0D6C  7445              je       0xdb3
1:0D6E  eb0b              jmp      0xd7b
1:0D70  8b5efc            mov      bx, word ptr [bp - 4]
1:0D73  d1e3              shl      bx, 1
1:0D75  c787640b0100      mov      word ptr [bx + 0xb64], 1
1:0D7B  b80100            mov      ax, 1
1:0D7E  50                push     ax
1:0D7F  2bc0              sub      ax, ax
1:0D81  50                push     ax
1:0D82  0e                push     cs
1:0D83  e8fbf4            call     0x281
1:0D86  5b                pop      bx
1:0D87  5b                pop      bx
1:0D88  0bc0              or       ax, ax
1:0D8A  7434              je       0xdc0
1:0D8C  8b5efc            mov      bx, word ptr [bp - 4]
1:0D8F  d1e3              shl      bx, 1
1:0D91  c787160affff      mov      word ptr [bx + 0xa16], 0xffff
1:0D97  eb32              jmp      0xdcb
1:0D99  8b5efc            mov      bx, word ptr [bp - 4]
1:0D9C  d1e3              shl      bx, 1
1:0D9E  c787640b0200      mov      word ptr [bx + 0xb64], 2
1:0DA4  ebd5              jmp      0xd7b
1:0DA6  8b5efc            mov      bx, word ptr [bp - 4]
1:0DA9  d1e3              shl      bx, 1
1:0DAB  c787640b0300      mov      word ptr [bx + 0xb64], 3
1:0DB1  ebc8              jmp      0xd7b
1:0DB3  8b5efc            mov      bx, word ptr [bp - 4]
1:0DB6  d1e3              shl      bx, 1
1:0DB8  c787640b0400      mov      word ptr [bx + 0xb64], 4
1:0DBE  ebbb              jmp      0xd7b
1:0DC0  8b5efc            mov      bx, word ptr [bp - 4]
1:0DC3  d1e3              shl      bx, 1
1:0DC5  c787160a0100      mov      word ptr [bx + 0xa16], 1
1:0DCB  ff46fc            inc      word ptr [bp - 4]
1:0DCE  837efc14          cmp      word ptr [bp - 4], 0x14
1:0DD2  7d58              jge      0xe2c
1:0DD4  ff366009          push     word ptr [0x960]
1:0DD8  2bc0              sub      ax, ax
1:0DDA  50                push     ax
1:0DDB  0e                push     cs
1:0DDC  e8a2f4            call     0x281
1:0DDF  5b                pop      bx
1:0DE0  5b                pop      bx
1:0DE1  8b5efc            mov      bx, word ptr [bp - 4]
1:0DE4  d1e3              shl      bx, 1
1:0DE6  8987160c          mov      word ptr [bx + 0xc16], ax
1:0DEA  ff36b409          push     word ptr [0x9b4]
1:0DEE  2bc0              sub      ax, ax
1:0DF0  50                push     ax
1:0DF1  8bf3              mov      si, bx
1:0DF3  0e                push     cs
1:0DF4  e88af4            call     0x281
1:0DF7  5b                pop      bx
1:0DF8  5b                pop      bx
1:0DF9  89843e0c          mov      word ptr [si + 0xc3e], ax
1:0DFD  b80400            mov      ax, 4
1:0E00  50                push     ax
1:0E01  2bc0              sub      ax, ax
1:0E03  50                push     ax
1:0E04  0e                push     cs
1:0E05  e879f4            call     0x281
1:0E08  5b                pop      bx
1:0E09  5b                pop      bx
1:0E0A  0bc0              or       ax, ax
1:0E0C  7503              jne      0xe11
1:0E0E  e9e1fd            jmp      0xbf2
1:0E11  48                dec      ax
1:0E12  7503              jne      0xe17
1:0E14  e905fe            jmp      0xc1c
1:0E17  48                dec      ax
1:0E18  7503              jne      0xe1d
1:0E1A  e90cfe            jmp      0xc29
1:0E1D  48                dec      ax
1:0E1E  7503              jne      0xe23
1:0E20  e913fe            jmp      0xc36
1:0E23  48                dec      ax
1:0E24  7503              jne      0xe29
1:0E26  e91afe            jmp      0xc43
1:0E29  e9d1fd            jmp      0xbfd
1:0E2C  803ed00a00        cmp      byte ptr [0xad0], 0
1:0E31  7404              je       0xe37
1:0E33  0e                push     cs
1:0E34  e8dbf1            call     0x12
1:0E37  5e                pop      si
1:0E38  4d                dec      bp
1:0E39  4d                dec      bp
1:0E3A  8be5              mov      sp, bp
1:0E3C  1f                pop      ds
1:0E3D  5d                pop      bp
1:0E3E  4d                dec      bp
1:0E3F  cb                retf     
1:0E40  1e                push     ds
1:0E41  58                pop      ax
1:0E42  90                nop      
1:0E43  45                inc      bp
1:0E44  55                push     bp
1:0E45  8bec              mov      bp, sp
1:0E47  1e                push     ds
1:0E48  8ed8              mov      ds, ax
1:0E4A  833ed40a00        cmp      word ptr [0xad4], 0
1:0E4F  7409              je       0xe5a
1:0E51  ff36d40a          push     word ptr [0xad4]
1:0E55  9a660e0000        lcall    0, 0xe66  ; @1:KERNEL.LocalFree
1:0E5A  833e6e0a00        cmp      word ptr [0xa6e], 0
1:0E5F  7409              je       0xe6a
1:0E61  ff366e0a          push     word ptr [0xa6e]
1:0E65  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LocalFree
1:0E6A  833eb60b00        cmp      word ptr [0xbb6], 0
1:0E6F  7409              je       0xe7a
1:0E71  ff36b60b          push     word ptr [0xbb6]
1:0E75  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteObject
1:0E7A  4d                dec      bp
1:0E7B  4d                dec      bp
1:0E7C  8be5              mov      sp, bp
1:0E7E  1f                pop      ds
1:0E7F  5d                pop      bp
1:0E80  4d                dec      bp
1:0E81  cb                retf     

; ===== EXPORT:ord_27(#27) =====
1:0E82  1e                push     ds
1:0E83  58                pop      ax
1:0E84  90                nop      
1:0E85  45                inc      bp
1:0E86  55                push     bp
1:0E87  8bec              mov      bp, sp
1:0E89  1e                push     ds
1:0E8A  8ed8              mov      ds, ax
1:0E8C  83ec38            sub      sp, 0x38
1:0E8F  2bc0              sub      ax, ax
1:0E91  a36e0a            mov      word ptr [0xa6e], ax
1:0E94  a3440a            mov      word ptr [0xa44], ax
1:0E97  a3400a            mov      word ptr [0xa40], ax
1:0E9A  b84200            mov      ax, 0x42
1:0E9D  50                push     ax
1:0E9E  b85007            mov      ax, 0x750
1:0EA1  50                push     ax
1:0EA2  9a2d010000        lcall    0, 0x12d  ; @1:KERNEL.LocalAlloc
1:0EA7  a36e0a            mov      word ptr [0xa6e], ax
1:0EAA  0e                push     cs
1:0EAB  e86cf2            call     0x11a
1:0EAE  2bc0              sub      ax, ax
1:0EB0  a32e0b            mov      word ptr [0xb2e], ax
1:0EB3  a3300b            mov      word ptr [0xb30], ax
1:0EB6  c41ee40b          les      bx, ptr [0xbe4]
1:0EBA  268b4704          mov      ax, word ptr es:[bx + 4]
1:0EBE  a3320b            mov      word ptr [0xb32], ax
1:0EC1  268b4702          mov      ax, word ptr es:[bx + 2]
1:0EC5  a3340b            mov      word ptr [0xb34], ax
1:0EC8  c706a20a8813      mov      word ptr [0xaa2], 0x1388
1:0ECE  813e320b8813      cmp      word ptr [0xb32], 0x1388
1:0ED4  7e28              jle      0xefe
1:0ED6  b82e0b            mov      ax, 0xb2e
1:0ED9  1e                push     ds
1:0EDA  50                push     ax
1:0EDB  8b0e320b          mov      cx, word ptr [0xb32]
1:0EDF  81e98813          sub      cx, 0x1388
1:0EE3  d1f9              sar      cx, 1
1:0EE5  890ee80b          mov      word ptr [0xbe8], cx
1:0EE9  51                push     cx
1:0EEA  2bc9              sub      cx, cx
1:0EEC  51                push     cx
1:0EED  9a2b0f0000        lcall    0, 0xf2b  ; @1:USER.OffsetRect
1:0EF2  a12e0b            mov      ax, word ptr [0xb2e]
1:0EF5  0306a20a          add      ax, word ptr [0xaa2]
1:0EF9  a3320b            mov      word ptr [0xb32], ax
1:0EFC  eb06              jmp      0xf04
1:0EFE  c706e80b0000      mov      word ptr [0xbe8], 0
1:0F04  a1340b            mov      ax, word ptr [0xb34]
1:0F07  2b06300b          sub      ax, word ptr [0xb30]
1:0F0B  3b06a20a          cmp      ax, word ptr [0xaa2]
1:0F0F  7e2a              jle      0xf3b
1:0F11  b82e0b            mov      ax, 0xb2e
1:0F14  1e                push     ds
1:0F15  50                push     ax
1:0F16  2bc0              sub      ax, ax
1:0F18  50                push     ax
1:0F19  a1340b            mov      ax, word ptr [0xb34]
1:0F1C  2b06a20a          sub      ax, word ptr [0xaa2]
1:0F20  2b06300b          sub      ax, word ptr [0xb30]
1:0F24  d1f8              sar      ax, 1
1:0F26  a3140c            mov      word ptr [0xc14], ax
1:0F29  50                push     ax
1:0F2A  9affff0000        lcall    0, 0xffff  ; @1:USER.OffsetRect
1:0F2F  a1300b            mov      ax, word ptr [0xb30]
1:0F32  0306a20a          add      ax, word ptr [0xaa2]
1:0F36  a3340b            mov      word ptr [0xb34], ax
1:0F39  eb06              jmp      0xf41
1:0F3B  c706140c0000      mov      word ptr [0xc14], 0
1:0F41  a1320b            mov      ax, word ptr [0xb32]
1:0F44  2b062e0b          sub      ax, word ptr [0xb2e]
1:0F48  a36009            mov      word ptr [0x960], ax
1:0F4B  a1340b            mov      ax, word ptr [0xb34]
1:0F4E  2b06300b          sub      ax, word ptr [0xb30]
1:0F52  a3b409            mov      word ptr [0x9b4], ax
1:0F55  a12e0b            mov      ax, word ptr [0xb2e]
1:0F58  8946ce            mov      word ptr [bp - 0x32], ax
1:0F5B  a1300b            mov      ax, word ptr [0xb30]
1:0F5E  8946d0            mov      word ptr [bp - 0x30], ax
1:0F61  a1e80b            mov      ax, word ptr [0xbe8]
1:0F64  8946cc            mov      word ptr [bp - 0x34], ax
1:0F67  a1140c            mov      ax, word ptr [0xc14]
1:0F6A  8946d2            mov      word ptr [bp - 0x2e], ax
1:0F6D  8d46e2            lea      ax, [bp - 0x1e]
1:0F70  16                push     ss
1:0F71  50                push     ax
1:0F72  2bc0              sub      ax, ax
1:0F74  50                push     ax
1:0F75  50                push     ax
1:0F76  c41ee40b          les      bx, ptr [0xbe4]
1:0F7A  26ff7702          push     word ptr es:[bx + 2]
1:0F7E  26ff7704          push     word ptr es:[bx + 4]
1:0F82  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:0F87  ff36f609          push     word ptr [0x9f6]
1:0F8B  8d46e2            lea      ax, [bp - 0x1e]
1:0F8E  16                push     ss
1:0F8F  50                push     ax
1:0F90  b80400            mov      ax, 4
1:0F93  50                push     ax
1:0F94  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:0F99  50                push     ax
1:0F9A  9affff0000        lcall    0, 0xffff  ; @1:USER.FillRect
1:0F9F  c706720a0000      mov      word ptr [0xa72], 0
1:0FA5  b001              mov      al, 1
1:0FA7  a2d00a            mov      byte ptr [0xad0], al
1:0FAA  50                push     ax
1:0FAB  0e                push     cs
1:0FAC  e8a3fa            call     0xa52
1:0FAF  5b                pop      bx
1:0FB0  2ac0              sub      al, al
1:0FB2  a23e0a            mov      byte ptr [0xa3e], al
1:0FB5  a2380b            mov      byte ptr [0xb38], al
1:0FB8  c41ee40b          les      bx, ptr [0xbe4]
1:0FBC  268b4708          mov      ax, word ptr es:[bx + 8]
1:0FC0  a3740a            mov      word ptr [0xa74], ax
1:0FC3  0e                push     cs
1:0FC4  e804f8            call     0x7cb
1:0FC7  c41ee40b          les      bx, ptr [0xbe4]
1:0FCB  268b4706          mov      ax, word ptr es:[bx + 6]
1:0FCF  40                inc      ax
1:0FD0  a33a0b            mov      word ptr [0xb3a], ax
1:0FD3  268b470c          mov      ax, word ptr es:[bx + 0xc]
1:0FD7  a3360b            mov      word ptr [0xb36], ax
1:0FDA  c706020a2000      mov      word ptr [0xa02], 0x20
1:0FE0  2bc0              sub      ax, ax
1:0FE2  4d                dec      bp
1:0FE3  4d                dec      bp
1:0FE4  8be5              mov      sp, bp
1:0FE6  1f                pop      ds
1:0FE7  5d                pop      bp
1:0FE8  4d                dec      bp
1:0FE9  cb                retf     

; ===== EXPORT:ord_26(#26) =====
1:0FEA  1e                push     ds
1:0FEB  58                pop      ax
1:0FEC  90                nop      
1:0FED  45                inc      bp
1:0FEE  55                push     bp
1:0FEF  8bec              mov      bp, sp
1:0FF1  1e                push     ds
1:0FF2  8ed8              mov      ds, ax
1:0FF4  83ec0a            sub      sp, 0xa
1:0FF7  2bc0              sub      ax, ax
1:0FF9  4d                dec      bp
1:0FFA  4d                dec      bp
1:0FFB  8be5              mov      sp, bp
1:0FFD  1f                pop      ds
1:0FFE  5d                pop      bp
1:0FFF  4d                dec      bp
1:1000  cb                retf     
1:1001  1e                push     ds
1:1002  58                pop      ax
1:1003  90                nop      
1:1004  45                inc      bp
1:1005  55                push     bp
1:1006  8bec              mov      bp, sp
1:1008  1e                push     ds
1:1009  8ed8              mov      ds, ax
1:100B  ff36f609          push     word ptr [0x9f6]
1:100F  ff7606            push     word ptr [bp + 6]
1:1012  ff7608            push     word ptr [bp + 8]
1:1015  b80001            mov      ax, 0x100
1:1018  50                push     ax
1:1019  ff760a            push     word ptr [bp + 0xa]
1:101C  9a5b100000        lcall    0, 0x105b  ; @1:GDI.SetPixel
1:1021  4d                dec      bp
1:1022  4d                dec      bp
1:1023  8be5              mov      sp, bp
1:1025  1f                pop      ds
1:1026  5d                pop      bp
1:1027  4d                dec      bp
1:1028  cb                retf     
1:1029  1e                push     ds
1:102A  58                pop      ax
1:102B  90                nop      
1:102C  45                inc      bp
1:102D  55                push     bp
1:102E  8bec              mov      bp, sp
1:1030  1e                push     ds
1:1031  8ed8              mov      ds, ax
1:1033  57                push     di
1:1034  56                push     si
1:1035  8b460e            mov      ax, word ptr [bp + 0xe]
1:1038  a3fe08            mov      word ptr [0x8fe], ax
1:103B  c70600090001      mov      word ptr [0x900], 0x100
1:1041  ff36f609          push     word ptr [0x9f6]
1:1045  ff7606            push     word ptr [bp + 6]
1:1048  ff7608            push     word ptr [bp + 8]
1:104B  8b460a            mov      ax, word ptr [bp + 0xa]
1:104E  ba0001            mov      dx, 0x100
1:1051  a30209            mov      word ptr [0x902], ax
1:1054  89160409          mov      word ptr [0x904], dx
1:1058  52                push     dx
1:1059  50                push     ax
1:105A  9a76100000        lcall    0, 0x1076  ; @1:GDI.SetPixel
1:105F  ff36f609          push     word ptr [0x9f6]
1:1063  8b4606            mov      ax, word ptr [bp + 6]
1:1066  40                inc      ax
1:1067  50                push     ax
1:1068  ff7608            push     word ptr [bp + 8]
1:106B  ff360009          push     word ptr [0x900]
1:106F  ff36fe08          push     word ptr [0x8fe]
1:1073  8bf0              mov      si, ax
1:1075  9a91100000        lcall    0, 0x1091  ; @1:GDI.SetPixel
1:107A  ff36f609          push     word ptr [0x9f6]
1:107E  ff7606            push     word ptr [bp + 6]
1:1081  8b4608            mov      ax, word ptr [bp + 8]
1:1084  40                inc      ax
1:1085  50                push     ax
1:1086  ff360009          push     word ptr [0x900]
1:108A  ff36fe08          push     word ptr [0x8fe]
1:108E  8bf8              mov      di, ax
1:1090  9aa4100000        lcall    0, 0x10a4  ; @1:GDI.SetPixel
1:1095  ff36f609          push     word ptr [0x9f6]
1:1099  56                push     si
1:109A  57                push     di
1:109B  ff360409          push     word ptr [0x904]
1:109F  ff360209          push     word ptr [0x902]
1:10A3  9ae7100000        lcall    0, 0x10e7  ; @1:GDI.SetPixel
1:10A8  5e                pop      si
1:10A9  5f                pop      di
1:10AA  4d                dec      bp
1:10AB  4d                dec      bp
1:10AC  8be5              mov      sp, bp
1:10AE  1f                pop      ds
1:10AF  5d                pop      bp
1:10B0  4d                dec      bp
1:10B1  cb                retf     
1:10B2  1e                push     ds
1:10B3  58                pop      ax
1:10B4  90                nop      
1:10B5  45                inc      bp
1:10B6  55                push     bp
1:10B7  8bec              mov      bp, sp
1:10B9  1e                push     ds
1:10BA  8ed8              mov      ds, ax
1:10BC  83ec0a            sub      sp, 0xa
1:10BF  57                push     di
1:10C0  56                push     si
1:10C1  8b460e            mov      ax, word ptr [bp + 0xe]
1:10C4  a30609            mov      word ptr [0x906], ax
1:10C7  c70608090001      mov      word ptr [0x908], 0x100
1:10CD  ff36f609          push     word ptr [0x9f6]
1:10D1  ff7606            push     word ptr [bp + 6]
1:10D4  ff7608            push     word ptr [bp + 8]
1:10D7  8b460a            mov      ax, word ptr [bp + 0xa]
1:10DA  ba0001            mov      dx, 0x100
1:10DD  a30a09            mov      word ptr [0x90a], ax
1:10E0  89160c09          mov      word ptr [0x90c], dx
1:10E4  52                push     dx
1:10E5  50                push     ax
1:10E6  9a02110000        lcall    0, 0x1102  ; @1:GDI.SetPixel
1:10EB  ff36f609          push     word ptr [0x9f6]
1:10EF  8b4606            mov      ax, word ptr [bp + 6]
1:10F2  40                inc      ax
1:10F3  50                push     ax
1:10F4  ff7608            push     word ptr [bp + 8]
1:10F7  ff360809          push     word ptr [0x908]
1:10FB  ff360609          push     word ptr [0x906]
1:10FF  8bf0              mov      si, ax
1:1101  9a1e110000        lcall    0, 0x111e  ; @1:GDI.SetPixel
1:1106  ff36f609          push     word ptr [0x9f6]
1:110A  8b4606            mov      ax, word ptr [bp + 6]
1:110D  40                inc      ax
1:110E  40                inc      ax
1:110F  50                push     ax
1:1110  ff7608            push     word ptr [bp + 8]
1:1113  ff360c09          push     word ptr [0x90c]
1:1117  ff360a09          push     word ptr [0x90a]
1:111B  8bf8              mov      di, ax
1:111D  9a3c110000        lcall    0, 0x113c  ; @1:GDI.SetPixel
1:1122  ff36f609          push     word ptr [0x9f6]
1:1126  8b4606            mov      ax, word ptr [bp + 6]
1:1129  050300            add      ax, 3
1:112C  50                push     ax
1:112D  ff7608            push     word ptr [bp + 8]
1:1130  ff360809          push     word ptr [0x908]
1:1134  ff360609          push     word ptr [0x906]
1:1138  8946fc            mov      word ptr [bp - 4], ax
1:113B  9a58110000        lcall    0, 0x1158  ; @1:GDI.SetPixel
1:1140  ff36f609          push     word ptr [0x9f6]
1:1144  ff7606            push     word ptr [bp + 6]
1:1147  8b4608            mov      ax, word ptr [bp + 8]
1:114A  40                inc      ax
1:114B  50                push     ax
1:114C  ff360809          push     word ptr [0x908]
1:1150  ff360609          push     word ptr [0x906]
1:1154  8946fa            mov      word ptr [bp - 6], ax
1:1157  9a6d110000        lcall    0, 0x116d  ; @1:GDI.SetPixel
1:115C  ff36f609          push     word ptr [0x9f6]
1:1160  56                push     si
1:1161  ff76fa            push     word ptr [bp - 6]
1:1164  ff360c09          push     word ptr [0x90c]
1:1168  ff360a09          push     word ptr [0x90a]
1:116C  9a82110000        lcall    0, 0x1182  ; @1:GDI.SetPixel
1:1171  ff36f609          push     word ptr [0x9f6]
1:1175  57                push     di
1:1176  ff76fa            push     word ptr [bp - 6]
1:1179  ff360809          push     word ptr [0x908]
1:117D  ff360609          push     word ptr [0x906]
1:1181  9a99110000        lcall    0, 0x1199  ; @1:GDI.SetPixel
1:1186  ff36f609          push     word ptr [0x9f6]
1:118A  ff76fc            push     word ptr [bp - 4]
1:118D  ff76fa            push     word ptr [bp - 6]
1:1190  ff360c09          push     word ptr [0x90c]
1:1194  ff360a09          push     word ptr [0x90a]
1:1198  9ab6110000        lcall    0, 0x11b6  ; @1:GDI.SetPixel
1:119D  ff36f609          push     word ptr [0x9f6]
1:11A1  ff7606            push     word ptr [bp + 6]
1:11A4  8b4608            mov      ax, word ptr [bp + 8]
1:11A7  40                inc      ax
1:11A8  40                inc      ax
1:11A9  50                push     ax
1:11AA  ff360c09          push     word ptr [0x90c]
1:11AE  ff360a09          push     word ptr [0x90a]
1:11B2  8946f8            mov      word ptr [bp - 8], ax
1:11B5  9acb110000        lcall    0, 0x11cb  ; @1:GDI.SetPixel
1:11BA  ff36f609          push     word ptr [0x9f6]
1:11BE  56                push     si
1:11BF  ff76f8            push     word ptr [bp - 8]
1:11C2  ff360809          push     word ptr [0x908]
1:11C6  ff360609          push     word ptr [0x906]
1:11CA  9ae0110000        lcall    0, 0x11e0  ; @1:GDI.SetPixel
1:11CF  ff36f609          push     word ptr [0x9f6]
1:11D3  57                push     di
1:11D4  ff76f8            push     word ptr [bp - 8]
1:11D7  ff360c09          push     word ptr [0x90c]
1:11DB  ff360a09          push     word ptr [0x90a]
1:11DF  9af7110000        lcall    0, 0x11f7  ; @1:GDI.SetPixel
1:11E4  ff36f609          push     word ptr [0x9f6]
1:11E8  ff76fc            push     word ptr [bp - 4]
1:11EB  ff76f8            push     word ptr [bp - 8]
1:11EE  ff360809          push     word ptr [0x908]
1:11F2  ff360609          push     word ptr [0x906]
1:11F6  9a15120000        lcall    0, 0x1215  ; @1:GDI.SetPixel
1:11FB  ff36f609          push     word ptr [0x9f6]
1:11FF  ff7606            push     word ptr [bp + 6]
1:1202  8b4608            mov      ax, word ptr [bp + 8]
1:1205  050300            add      ax, 3
1:1208  50                push     ax
1:1209  ff360809          push     word ptr [0x908]
1:120D  ff360609          push     word ptr [0x906]
1:1211  8946f6            mov      word ptr [bp - 0xa], ax
1:1214  9a2a120000        lcall    0, 0x122a  ; @1:GDI.SetPixel
1:1219  ff36f609          push     word ptr [0x9f6]
1:121D  56                push     si
1:121E  ff76f6            push     word ptr [bp - 0xa]
1:1221  ff360c09          push     word ptr [0x90c]
1:1225  ff360a09          push     word ptr [0x90a]
1:1229  9a3f120000        lcall    0, 0x123f  ; @1:GDI.SetPixel
1:122E  ff36f609          push     word ptr [0x9f6]
1:1232  57                push     di
1:1233  ff76f6            push     word ptr [bp - 0xa]
1:1236  ff360809          push     word ptr [0x908]
1:123A  ff360609          push     word ptr [0x906]
1:123E  9a56120000        lcall    0, 0x1256  ; @1:GDI.SetPixel
1:1243  ff36f609          push     word ptr [0x9f6]
1:1247  ff76fc            push     word ptr [bp - 4]
1:124A  ff76f6            push     word ptr [bp - 0xa]
1:124D  ff360c09          push     word ptr [0x90c]
1:1251  ff360a09          push     word ptr [0x90a]
1:1255  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetPixel
1:125A  5e                pop      si
1:125B  5f                pop      di
1:125C  4d                dec      bp
1:125D  4d                dec      bp
1:125E  8be5              mov      sp, bp
1:1260  1f                pop      ds
1:1261  5d                pop      bp
1:1262  4d                dec      bp
1:1263  cb                retf     
1:1264  1e                push     ds
1:1265  58                pop      ax
1:1266  90                nop      
1:1267  45                inc      bp
1:1268  55                push     bp
1:1269  8bec              mov      bp, sp
1:126B  1e                push     ds
1:126C  8ed8              mov      ds, ax
1:126E  83ec1c            sub      sp, 0x1c
1:1271  57                push     di
1:1272  56                push     si
1:1273  8b460a            mov      ax, word ptr [bp + 0xa]
1:1276  a31209            mov      word ptr [0x912], ax
1:1279  c70614090001      mov      word ptr [0x914], 0x100
1:127F  8b460e            mov      ax, word ptr [bp + 0xe]
1:1282  a30e09            mov      word ptr [0x90e], ax
1:1285  c70610090001      mov      word ptr [0x910], 0x100
1:128B  c41ee40b          les      bx, ptr [0xbe4]
1:128F  26837f0605        cmp      word ptr es:[bx + 6], 5
1:1294  750b              jne      0x12a1
1:1296  c41e060a          les      bx, ptr [0xa06]
1:129A  26837f0a04        cmp      word ptr es:[bx + 0xa], 4
1:129F  7f4b              jg       0x12ec
1:12A1  ff36f609          push     word ptr [0x9f6]
1:12A5  ff361409          push     word ptr [0x914]
1:12A9  ff361209          push     word ptr [0x912]
1:12AD  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateSolidBrush
1:12B2  50                push     ax
1:12B3  9adf120000        lcall    0, 0x12df  ; @1:GDI.SelectObject
1:12B8  8946fc            mov      word ptr [bp - 4], ax
1:12BB  ff36f609          push     word ptr [0x9f6]
1:12BF  ff7606            push     word ptr [bp + 6]
1:12C2  ff7608            push     word ptr [bp + 8]
1:12C5  b80800            mov      ax, 8
1:12C8  50                push     ax
1:12C9  50                push     ax
1:12CA  b82100            mov      ax, 0x21
1:12CD  baf000            mov      dx, 0xf0
1:12D0  52                push     dx
1:12D1  50                push     ax
1:12D2  9affff0000        lcall    0, 0xffff  ; @1:GDI.PatBlt
1:12D7  ff36f609          push     word ptr [0x9f6]
1:12DB  ff76fc            push     word ptr [bp - 4]
1:12DE  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectObject
1:12E3  50                push     ax
1:12E4  9a760e0000        lcall    0, 0xe76  ; @1:GDI.DeleteObject
1:12E9  e9fe05            jmp      0x18ea
1:12EC  ff36f609          push     word ptr [0x9f6]
1:12F0  ff7606            push     word ptr [bp + 6]
1:12F3  ff7608            push     word ptr [bp + 8]
1:12F6  ff361409          push     word ptr [0x914]
1:12FA  ff361209          push     word ptr [0x912]
1:12FE  9a1a130000        lcall    0, 0x131a  ; @1:GDI.SetPixel
1:1303  ff36f609          push     word ptr [0x9f6]
1:1307  8b4606            mov      ax, word ptr [bp + 6]
1:130A  40                inc      ax
1:130B  50                push     ax
1:130C  ff7608            push     word ptr [bp + 8]
1:130F  ff361009          push     word ptr [0x910]
1:1313  ff360e09          push     word ptr [0x90e]
1:1317  8bf0              mov      si, ax
1:1319  9a36130000        lcall    0, 0x1336  ; @1:GDI.SetPixel
1:131E  ff36f609          push     word ptr [0x9f6]
1:1322  8b4606            mov      ax, word ptr [bp + 6]
1:1325  40                inc      ax
1:1326  40                inc      ax
1:1327  50                push     ax
1:1328  ff7608            push     word ptr [bp + 8]
1:132B  ff361409          push     word ptr [0x914]
1:132F  ff361209          push     word ptr [0x912]
1:1333  8bf8              mov      di, ax
1:1335  9a54130000        lcall    0, 0x1354  ; @1:GDI.SetPixel
1:133A  ff36f609          push     word ptr [0x9f6]
1:133E  8b4606            mov      ax, word ptr [bp + 6]
1:1341  050300            add      ax, 3
1:1344  50                push     ax
1:1345  ff7608            push     word ptr [bp + 8]
1:1348  ff361009          push     word ptr [0x910]
1:134C  ff360e09          push     word ptr [0x90e]
1:1350  8946fa            mov      word ptr [bp - 6], ax
1:1353  9a72130000        lcall    0, 0x1372  ; @1:GDI.SetPixel
1:1358  ff36f609          push     word ptr [0x9f6]
1:135C  8b4606            mov      ax, word ptr [bp + 6]
1:135F  050400            add      ax, 4
1:1362  50                push     ax
1:1363  ff7608            push     word ptr [bp + 8]
1:1366  ff361409          push     word ptr [0x914]
1:136A  ff361209          push     word ptr [0x912]
1:136E  8946f8            mov      word ptr [bp - 8], ax
1:1371  9a90130000        lcall    0, 0x1390  ; @1:GDI.SetPixel
1:1376  ff36f609          push     word ptr [0x9f6]
1:137A  8b4606            mov      ax, word ptr [bp + 6]
1:137D  050500            add      ax, 5
1:1380  50                push     ax
1:1381  ff7608            push     word ptr [bp + 8]
1:1384  ff361009          push     word ptr [0x910]
1:1388  ff360e09          push     word ptr [0x90e]
1:138C  8946f6            mov      word ptr [bp - 0xa], ax
1:138F  9aae130000        lcall    0, 0x13ae  ; @1:GDI.SetPixel
1:1394  ff36f609          push     word ptr [0x9f6]
1:1398  8b4606            mov      ax, word ptr [bp + 6]
1:139B  050600            add      ax, 6
1:139E  50                push     ax
1:139F  ff7608            push     word ptr [bp + 8]
1:13A2  ff361409          push     word ptr [0x914]
1:13A6  ff361209          push     word ptr [0x912]
1:13AA  8946f4            mov      word ptr [bp - 0xc], ax
1:13AD  9acc130000        lcall    0, 0x13cc  ; @1:GDI.SetPixel
1:13B2  ff36f609          push     word ptr [0x9f6]
1:13B6  8b4606            mov      ax, word ptr [bp + 6]
1:13B9  050700            add      ax, 7
1:13BC  50                push     ax
1:13BD  ff7608            push     word ptr [bp + 8]
1:13C0  ff361009          push     word ptr [0x910]
1:13C4  ff360e09          push     word ptr [0x90e]
1:13C8  8946f2            mov      word ptr [bp - 0xe], ax
1:13CB  9ae8130000        lcall    0, 0x13e8  ; @1:GDI.SetPixel
1:13D0  ff36f609          push     word ptr [0x9f6]
1:13D4  ff7606            push     word ptr [bp + 6]
1:13D7  8b4608            mov      ax, word ptr [bp + 8]
1:13DA  40                inc      ax
1:13DB  50                push     ax
1:13DC  ff361009          push     word ptr [0x910]
1:13E0  ff360e09          push     word ptr [0x90e]
1:13E4  8946f0            mov      word ptr [bp - 0x10], ax
1:13E7  9afd130000        lcall    0, 0x13fd  ; @1:GDI.SetPixel
1:13EC  ff36f609          push     word ptr [0x9f6]
1:13F0  56                push     si
1:13F1  ff76f0            push     word ptr [bp - 0x10]
1:13F4  ff361409          push     word ptr [0x914]
1:13F8  ff361209          push     word ptr [0x912]
1:13FC  9a12140000        lcall    0, 0x1412  ; @1:GDI.SetPixel
1:1401  ff36f609          push     word ptr [0x9f6]
1:1405  57                push     di
1:1406  ff76f0            push     word ptr [bp - 0x10]
1:1409  ff361009          push     word ptr [0x910]
1:140D  ff360e09          push     word ptr [0x90e]
1:1411  9a29140000        lcall    0, 0x1429  ; @1:GDI.SetPixel
1:1416  ff36f609          push     word ptr [0x9f6]
1:141A  ff76fa            push     word ptr [bp - 6]
1:141D  ff76f0            push     word ptr [bp - 0x10]
1:1420  ff361409          push     word ptr [0x914]
1:1424  ff361209          push     word ptr [0x912]
1:1428  9a40140000        lcall    0, 0x1440  ; @1:GDI.SetPixel
1:142D  ff36f609          push     word ptr [0x9f6]
1:1431  ff76f8            push     word ptr [bp - 8]
1:1434  ff76f0            push     word ptr [bp - 0x10]
1:1437  ff361009          push     word ptr [0x910]
1:143B  ff360e09          push     word ptr [0x90e]
1:143F  9a57140000        lcall    0, 0x1457  ; @1:GDI.SetPixel
1:1444  ff36f609          push     word ptr [0x9f6]
1:1448  ff76f6            push     word ptr [bp - 0xa]
1:144B  ff76f0            push     word ptr [bp - 0x10]
1:144E  ff361409          push     word ptr [0x914]
1:1452  ff361209          push     word ptr [0x912]
1:1456  9a6e140000        lcall    0, 0x146e  ; @1:GDI.SetPixel
1:145B  ff36f609          push     word ptr [0x9f6]
1:145F  ff76f4            push     word ptr [bp - 0xc]
1:1462  ff76f0            push     word ptr [bp - 0x10]
1:1465  ff361009          push     word ptr [0x910]
1:1469  ff360e09          push     word ptr [0x90e]
1:146D  9a85140000        lcall    0, 0x1485  ; @1:GDI.SetPixel
1:1472  ff36f609          push     word ptr [0x9f6]
1:1476  ff76f2            push     word ptr [bp - 0xe]
1:1479  ff76f0            push     word ptr [bp - 0x10]
1:147C  ff361409          push     word ptr [0x914]
1:1480  ff361209          push     word ptr [0x912]
1:1484  9aa2140000        lcall    0, 0x14a2  ; @1:GDI.SetPixel
1:1489  ff36f609          push     word ptr [0x9f6]
1:148D  ff7606            push     word ptr [bp + 6]
1:1490  8b4608            mov      ax, word ptr [bp + 8]
1:1493  40                inc      ax
1:1494  40                inc      ax
1:1495  50                push     ax
1:1496  ff361409          push     word ptr [0x914]
1:149A  ff361209          push     word ptr [0x912]
1:149E  8946ee            mov      word ptr [bp - 0x12], ax
1:14A1  9ab7140000        lcall    0, 0x14b7  ; @1:GDI.SetPixel
1:14A6  ff36f609          push     word ptr [0x9f6]
1:14AA  56                push     si
1:14AB  ff76ee            push     word ptr [bp - 0x12]
1:14AE  ff361009          push     word ptr [0x910]
1:14B2  ff360e09          push     word ptr [0x90e]
1:14B6  9acc140000        lcall    0, 0x14cc  ; @1:GDI.SetPixel
1:14BB  ff36f609          push     word ptr [0x9f6]
1:14BF  57                push     di
1:14C0  ff76ee            push     word ptr [bp - 0x12]
1:14C3  ff361409          push     word ptr [0x914]
1:14C7  ff361209          push     word ptr [0x912]
1:14CB  9ae3140000        lcall    0, 0x14e3  ; @1:GDI.SetPixel
1:14D0  ff36f609          push     word ptr [0x9f6]
1:14D4  ff76fa            push     word ptr [bp - 6]
1:14D7  ff76ee            push     word ptr [bp - 0x12]
1:14DA  ff361009          push     word ptr [0x910]
1:14DE  ff360e09          push     word ptr [0x90e]
1:14E2  9afa140000        lcall    0, 0x14fa  ; @1:GDI.SetPixel
1:14E7  ff36f609          push     word ptr [0x9f6]
1:14EB  ff76f8            push     word ptr [bp - 8]
1:14EE  ff76ee            push     word ptr [bp - 0x12]
1:14F1  ff361409          push     word ptr [0x914]
1:14F5  ff361209          push     word ptr [0x912]
1:14F9  9a11150000        lcall    0, 0x1511  ; @1:GDI.SetPixel
1:14FE  ff36f609          push     word ptr [0x9f6]
1:1502  ff76f6            push     word ptr [bp - 0xa]
1:1505  ff76ee            push     word ptr [bp - 0x12]
1:1508  ff361009          push     word ptr [0x910]
1:150C  ff360e09          push     word ptr [0x90e]
1:1510  9a28150000        lcall    0, 0x1528  ; @1:GDI.SetPixel
1:1515  ff36f609          push     word ptr [0x9f6]
1:1519  ff76f4            push     word ptr [bp - 0xc]
1:151C  ff76ee            push     word ptr [bp - 0x12]
1:151F  ff361409          push     word ptr [0x914]
1:1523  ff361209          push     word ptr [0x912]
1:1527  9a3f150000        lcall    0, 0x153f  ; @1:GDI.SetPixel
1:152C  ff36f609          push     word ptr [0x9f6]
1:1530  ff76f2            push     word ptr [bp - 0xe]
1:1533  ff76ee            push     word ptr [bp - 0x12]
1:1536  ff361009          push     word ptr [0x910]
1:153A  ff360e09          push     word ptr [0x90e]
1:153E  9a5d150000        lcall    0, 0x155d  ; @1:GDI.SetPixel
1:1543  ff36f609          push     word ptr [0x9f6]
1:1547  ff7606            push     word ptr [bp + 6]
1:154A  8b4608            mov      ax, word ptr [bp + 8]
1:154D  050300            add      ax, 3
1:1550  50                push     ax
1:1551  ff361009          push     word ptr [0x910]
1:1555  ff360e09          push     word ptr [0x90e]
1:1559  8946ec            mov      word ptr [bp - 0x14], ax
1:155C  9a72150000        lcall    0, 0x1572  ; @1:GDI.SetPixel
1:1561  ff36f609          push     word ptr [0x9f6]
1:1565  56                push     si
1:1566  ff76ec            push     word ptr [bp - 0x14]
1:1569  ff361409          push     word ptr [0x914]
1:156D  ff361209          push     word ptr [0x912]
1:1571  9a87150000        lcall    0, 0x1587  ; @1:GDI.SetPixel
1:1576  ff36f609          push     word ptr [0x9f6]
1:157A  57                push     di
1:157B  ff76ec            push     word ptr [bp - 0x14]
1:157E  ff361009          push     word ptr [0x910]
1:1582  ff360e09          push     word ptr [0x90e]
1:1586  9a9e150000        lcall    0, 0x159e  ; @1:GDI.SetPixel
1:158B  ff36f609          push     word ptr [0x9f6]
1:158F  ff76fa            push     word ptr [bp - 6]
1:1592  ff76ec            push     word ptr [bp - 0x14]
1:1595  ff361409          push     word ptr [0x914]
1:1599  ff361209          push     word ptr [0x912]
1:159D  9ab5150000        lcall    0, 0x15b5  ; @1:GDI.SetPixel
1:15A2  ff36f609          push     word ptr [0x9f6]
1:15A6  ff76f8            push     word ptr [bp - 8]
1:15A9  ff76ec            push     word ptr [bp - 0x14]
1:15AC  ff361009          push     word ptr [0x910]
1:15B0  ff360e09          push     word ptr [0x90e]
1:15B4  9acc150000        lcall    0, 0x15cc  ; @1:GDI.SetPixel
1:15B9  ff36f609          push     word ptr [0x9f6]
1:15BD  ff76f6            push     word ptr [bp - 0xa]
1:15C0  ff76ec            push     word ptr [bp - 0x14]
1:15C3  ff361409          push     word ptr [0x914]
1:15C7  ff361209          push     word ptr [0x912]
1:15CB  9ae3150000        lcall    0, 0x15e3  ; @1:GDI.SetPixel
1:15D0  ff36f609          push     word ptr [0x9f6]
1:15D4  ff76f4            push     word ptr [bp - 0xc]
1:15D7  ff76ec            push     word ptr [bp - 0x14]
1:15DA  ff361009          push     word ptr [0x910]
1:15DE  ff360e09          push     word ptr [0x90e]
1:15E2  9afa150000        lcall    0, 0x15fa  ; @1:GDI.SetPixel
1:15E7  ff36f609          push     word ptr [0x9f6]
1:15EB  ff76f2            push     word ptr [bp - 0xe]
1:15EE  ff76ec            push     word ptr [bp - 0x14]
1:15F1  ff361409          push     word ptr [0x914]
1:15F5  ff361209          push     word ptr [0x912]
1:15F9  9a18160000        lcall    0, 0x1618  ; @1:GDI.SetPixel
1:15FE  ff36f609          push     word ptr [0x9f6]
1:1602  ff7606            push     word ptr [bp + 6]
1:1605  8b4608            mov      ax, word ptr [bp + 8]
1:1608  050400            add      ax, 4
1:160B  50                push     ax
1:160C  ff361409          push     word ptr [0x914]
1:1610  ff361209          push     word ptr [0x912]
1:1614  8946ea            mov      word ptr [bp - 0x16], ax
1:1617  9a1d100000        lcall    0, 0x101d  ; @1:GDI.SetPixel
1:161C  ff36f609          push     word ptr [0x9f6]
1:1620  56                push     si
1:1621  ff76ea            push     word ptr [bp - 0x16]
1:1624  ff361009          push     word ptr [0x910]
1:1628  ff360e09          push     word ptr [0x90e]
1:162C  9a42160000        lcall    0, 0x1642  ; @1:GDI.SetPixel
1:1631  ff36f609          push     word ptr [0x9f6]
1:1635  57                push     di
1:1636  ff76ea            push     word ptr [bp - 0x16]
1:1639  ff361409          push     word ptr [0x914]
1:163D  ff361209          push     word ptr [0x912]
1:1641  9a59160000        lcall    0, 0x1659  ; @1:GDI.SetPixel
1:1646  ff36f609          push     word ptr [0x9f6]
1:164A  ff76fa            push     word ptr [bp - 6]
1:164D  ff76ea            push     word ptr [bp - 0x16]
1:1650  ff361009          push     word ptr [0x910]
1:1654  ff360e09          push     word ptr [0x90e]
1:1658  9a70160000        lcall    0, 0x1670  ; @1:GDI.SetPixel
1:165D  ff36f609          push     word ptr [0x9f6]
1:1661  ff76f8            push     word ptr [bp - 8]
1:1664  ff76ea            push     word ptr [bp - 0x16]
1:1667  ff361409          push     word ptr [0x914]
1:166B  ff361209          push     word ptr [0x912]
1:166F  9a87160000        lcall    0, 0x1687  ; @1:GDI.SetPixel
1:1674  ff36f609          push     word ptr [0x9f6]
1:1678  ff76f6            push     word ptr [bp - 0xa]
1:167B  ff76ea            push     word ptr [bp - 0x16]
1:167E  ff361009          push     word ptr [0x910]
1:1682  ff360e09          push     word ptr [0x90e]
1:1686  9a9e160000        lcall    0, 0x169e  ; @1:GDI.SetPixel
1:168B  ff36f609          push     word ptr [0x9f6]
1:168F  ff76f4            push     word ptr [bp - 0xc]
1:1692  ff76ea            push     word ptr [bp - 0x16]
1:1695  ff361409          push     word ptr [0x914]
1:1699  ff361209          push     word ptr [0x912]
1:169D  9ab5160000        lcall    0, 0x16b5  ; @1:GDI.SetPixel
1:16A2  ff36f609          push     word ptr [0x9f6]
1:16A6  ff76f2            push     word ptr [bp - 0xe]
1:16A9  ff76ea            push     word ptr [bp - 0x16]
1:16AC  ff361009          push     word ptr [0x910]
1:16B0  ff360e09          push     word ptr [0x90e]
1:16B4  9ad3160000        lcall    0, 0x16d3  ; @1:GDI.SetPixel
1:16B9  ff36f609          push     word ptr [0x9f6]
1:16BD  ff7606            push     word ptr [bp + 6]
1:16C0  8b4608            mov      ax, word ptr [bp + 8]
1:16C3  050500            add      ax, 5
1:16C6  50                push     ax
1:16C7  ff361009          push     word ptr [0x910]
1:16CB  ff360e09          push     word ptr [0x90e]
1:16CF  8946e8            mov      word ptr [bp - 0x18], ax
1:16D2  9ae8160000        lcall    0, 0x16e8  ; @1:GDI.SetPixel
1:16D7  ff36f609          push     word ptr [0x9f6]
1:16DB  56                push     si
1:16DC  ff76e8            push     word ptr [bp - 0x18]
1:16DF  ff361409          push     word ptr [0x914]
1:16E3  ff361209          push     word ptr [0x912]
1:16E7  9afd160000        lcall    0, 0x16fd  ; @1:GDI.SetPixel
1:16EC  ff36f609          push     word ptr [0x9f6]
1:16F0  57                push     di
1:16F1  ff76e8            push     word ptr [bp - 0x18]
1:16F4  ff361009          push     word ptr [0x910]
1:16F8  ff360e09          push     word ptr [0x90e]
1:16FC  9a14170000        lcall    0, 0x1714  ; @1:GDI.SetPixel
1:1701  ff36f609          push     word ptr [0x9f6]
1:1705  ff76fa            push     word ptr [bp - 6]
1:1708  ff76e8            push     word ptr [bp - 0x18]
1:170B  ff361409          push     word ptr [0x914]
1:170F  ff361209          push     word ptr [0x912]
1:1713  9a2b170000        lcall    0, 0x172b  ; @1:GDI.SetPixel
1:1718  ff36f609          push     word ptr [0x9f6]
1:171C  ff76f8            push     word ptr [bp - 8]
1:171F  ff76e8            push     word ptr [bp - 0x18]
1:1722  ff361009          push     word ptr [0x910]
1:1726  ff360e09          push     word ptr [0x90e]
1:172A  9a42170000        lcall    0, 0x1742  ; @1:GDI.SetPixel
1:172F  ff36f609          push     word ptr [0x9f6]
1:1733  ff76f6            push     word ptr [bp - 0xa]
1:1736  ff76e8            push     word ptr [bp - 0x18]
1:1739  ff361409          push     word ptr [0x914]
1:173D  ff361209          push     word ptr [0x912]
1:1741  9a59170000        lcall    0, 0x1759  ; @1:GDI.SetPixel
1:1746  ff36f609          push     word ptr [0x9f6]
1:174A  ff76f4            push     word ptr [bp - 0xc]
1:174D  ff76e8            push     word ptr [bp - 0x18]
1:1750  ff361009          push     word ptr [0x910]
1:1754  ff360e09          push     word ptr [0x90e]
1:1758  9a70170000        lcall    0, 0x1770  ; @1:GDI.SetPixel
1:175D  ff36f609          push     word ptr [0x9f6]
1:1761  ff76f2            push     word ptr [bp - 0xe]
1:1764  ff76e8            push     word ptr [bp - 0x18]
1:1767  ff361409          push     word ptr [0x914]
1:176B  ff361209          push     word ptr [0x912]
1:176F  9a8e170000        lcall    0, 0x178e  ; @1:GDI.SetPixel
1:1774  ff36f609          push     word ptr [0x9f6]
1:1778  ff7606            push     word ptr [bp + 6]
1:177B  8b4608            mov      ax, word ptr [bp + 8]
1:177E  050600            add      ax, 6
1:1781  50                push     ax
1:1782  ff361409          push     word ptr [0x914]
1:1786  ff361209          push     word ptr [0x912]
1:178A  8946e6            mov      word ptr [bp - 0x1a], ax
1:178D  9aa3170000        lcall    0, 0x17a3  ; @1:GDI.SetPixel
1:1792  ff36f609          push     word ptr [0x9f6]
1:1796  56                push     si
1:1797  ff76e6            push     word ptr [bp - 0x1a]
1:179A  ff361009          push     word ptr [0x910]
1:179E  ff360e09          push     word ptr [0x90e]
1:17A2  9ab8170000        lcall    0, 0x17b8  ; @1:GDI.SetPixel
1:17A7  ff36f609          push     word ptr [0x9f6]
1:17AB  57                push     di
1:17AC  ff76e6            push     word ptr [bp - 0x1a]
1:17AF  ff361409          push     word ptr [0x914]
1:17B3  ff361209          push     word ptr [0x912]
1:17B7  9acf170000        lcall    0, 0x17cf  ; @1:GDI.SetPixel
1:17BC  ff36f609          push     word ptr [0x9f6]
1:17C0  ff76fa            push     word ptr [bp - 6]
1:17C3  ff76e6            push     word ptr [bp - 0x1a]
1:17C6  ff361009          push     word ptr [0x910]
1:17CA  ff360e09          push     word ptr [0x90e]
1:17CE  9ae6170000        lcall    0, 0x17e6  ; @1:GDI.SetPixel
1:17D3  ff36f609          push     word ptr [0x9f6]
1:17D7  ff76f8            push     word ptr [bp - 8]
1:17DA  ff76e6            push     word ptr [bp - 0x1a]
1:17DD  ff361409          push     word ptr [0x914]
1:17E1  ff361209          push     word ptr [0x912]
1:17E5  9afd170000        lcall    0, 0x17fd  ; @1:GDI.SetPixel
1:17EA  ff36f609          push     word ptr [0x9f6]
1:17EE  ff76f6            push     word ptr [bp - 0xa]
1:17F1  ff76e6            push     word ptr [bp - 0x1a]
1:17F4  ff361009          push     word ptr [0x910]
1:17F8  ff360e09          push     word ptr [0x90e]
1:17FC  9a14180000        lcall    0, 0x1814  ; @1:GDI.SetPixel
1:1801  ff36f609          push     word ptr [0x9f6]
1:1805  ff76f4            push     word ptr [bp - 0xc]
1:1808  ff76e6            push     word ptr [bp - 0x1a]
1:180B  ff361409          push     word ptr [0x914]
1:180F  ff361209          push     word ptr [0x912]
1:1813  9a2b180000        lcall    0, 0x182b  ; @1:GDI.SetPixel
1:1818  ff36f609          push     word ptr [0x9f6]
1:181C  ff76f2            push     word ptr [bp - 0xe]
1:181F  ff76e6            push     word ptr [bp - 0x1a]
1:1822  ff361009          push     word ptr [0x910]
1:1826  ff360e09          push     word ptr [0x90e]
1:182A  9a49180000        lcall    0, 0x1849  ; @1:GDI.SetPixel
1:182F  ff36f609          push     word ptr [0x9f6]
1:1833  ff7606            push     word ptr [bp + 6]
1:1836  8b4608            mov      ax, word ptr [bp + 8]
1:1839  050700            add      ax, 7
1:183C  50                push     ax
1:183D  ff361009          push     word ptr [0x910]
1:1841  ff360e09          push     word ptr [0x90e]
1:1845  8946e4            mov      word ptr [bp - 0x1c], ax
1:1848  9a5e180000        lcall    0, 0x185e  ; @1:GDI.SetPixel
1:184D  ff36f609          push     word ptr [0x9f6]
1:1851  56                push     si
1:1852  ff76e4            push     word ptr [bp - 0x1c]
1:1855  ff361409          push     word ptr [0x914]
1:1859  ff361209          push     word ptr [0x912]
1:185D  9a73180000        lcall    0, 0x1873  ; @1:GDI.SetPixel
1:1862  ff36f609          push     word ptr [0x9f6]
1:1866  57                push     di
1:1867  ff76e4            push     word ptr [bp - 0x1c]
1:186A  ff361009          push     word ptr [0x910]
1:186E  ff360e09          push     word ptr [0x90e]
1:1872  9a8a180000        lcall    0, 0x188a  ; @1:GDI.SetPixel
1:1877  ff36f609          push     word ptr [0x9f6]
1:187B  ff76fa            push     word ptr [bp - 6]
1:187E  ff76e4            push     word ptr [bp - 0x1c]
1:1881  ff361409          push     word ptr [0x914]
1:1885  ff361209          push     word ptr [0x912]
1:1889  9aa1180000        lcall    0, 0x18a1  ; @1:GDI.SetPixel
1:188E  ff36f609          push     word ptr [0x9f6]
1:1892  ff76f8            push     word ptr [bp - 8]
1:1895  ff76e4            push     word ptr [bp - 0x1c]
1:1898  ff361009          push     word ptr [0x910]
1:189C  ff360e09          push     word ptr [0x90e]
1:18A0  9ab8180000        lcall    0, 0x18b8  ; @1:GDI.SetPixel
1:18A5  ff36f609          push     word ptr [0x9f6]
1:18A9  ff76f6            push     word ptr [bp - 0xa]
1:18AC  ff76e4            push     word ptr [bp - 0x1c]
1:18AF  ff361409          push     word ptr [0x914]
1:18B3  ff361209          push     word ptr [0x912]
1:18B7  9acf180000        lcall    0, 0x18cf  ; @1:GDI.SetPixel
1:18BC  ff36f609          push     word ptr [0x9f6]
1:18C0  ff76f4            push     word ptr [bp - 0xc]
1:18C3  ff76e4            push     word ptr [bp - 0x1c]
1:18C6  ff361009          push     word ptr [0x910]
1:18CA  ff360e09          push     word ptr [0x90e]
1:18CE  9ae6180000        lcall    0, 0x18e6  ; @1:GDI.SetPixel
1:18D3  ff36f609          push     word ptr [0x9f6]
1:18D7  ff76f2            push     word ptr [bp - 0xe]
1:18DA  ff76e4            push     word ptr [bp - 0x1c]
1:18DD  ff361409          push     word ptr [0x914]
1:18E1  ff361209          push     word ptr [0x912]
1:18E5  9aff120000        lcall    0, 0x12ff  ; @1:GDI.SetPixel
1:18EA  5e                pop      si
1:18EB  5f                pop      di
1:18EC  4d                dec      bp
1:18ED  4d                dec      bp
1:18EE  8be5              mov      sp, bp
1:18F0  1f                pop      ds
1:18F1  5d                pop      bp
1:18F2  4d                dec      bp
1:18F3  cb                retf     
1:18F4  1e                push     ds
1:18F5  58                pop      ax
1:18F6  90                nop      
1:18F7  45                inc      bp
1:18F8  55                push     bp
1:18F9  8bec              mov      bp, sp
1:18FB  1e                push     ds
1:18FC  8ed8              mov      ds, ax
1:18FE  83ec08            sub      sp, 8
1:1901  8b460a            mov      ax, word ptr [bp + 0xa]
1:1904  a31a09            mov      word ptr [0x91a], ax
1:1907  c7061c090001      mov      word ptr [0x91c], 0x100
1:190D  8b460e            mov      ax, word ptr [bp + 0xe]
1:1910  a31609            mov      word ptr [0x916], ax
1:1913  c70618090001      mov      word ptr [0x918], 0x100
1:1919  c41ee40b          les      bx, ptr [0xbe4]
1:191D  26837f0605        cmp      word ptr es:[bx + 6], 5
1:1922  750b              jne      0x192f
1:1924  c41e060a          les      bx, ptr [0xa06]
1:1928  26837f0a04        cmp      word ptr es:[bx + 0xa], 4
1:192D  7f4b              jg       0x197a
1:192F  ff36f609          push     word ptr [0x9f6]
1:1933  ff361c09          push     word ptr [0x91c]
1:1937  ff361a09          push     word ptr [0x91a]
1:193B  9a87190000        lcall    0, 0x1987  ; @1:GDI.CreateSolidBrush
1:1940  50                push     ax
1:1941  9a6d190000        lcall    0, 0x196d  ; @1:GDI.SelectObject
1:1946  8946f8            mov      word ptr [bp - 8], ax
1:1949  ff36f609          push     word ptr [0x9f6]
1:194D  ff7606            push     word ptr [bp + 6]
1:1950  ff7608            push     word ptr [bp + 8]
1:1953  b81000            mov      ax, 0x10
1:1956  50                push     ax
1:1957  50                push     ax
1:1958  b82100            mov      ax, 0x21
1:195B  baf000            mov      dx, 0xf0
1:195E  52                push     dx
1:195F  50                push     ax
1:1960  9aac190000        lcall    0, 0x19ac  ; @1:GDI.PatBlt
1:1965  ff36f609          push     word ptr [0x9f6]
1:1969  ff76f8            push     word ptr [bp - 8]
1:196C  9a8d190000        lcall    0, 0x198d  ; @1:GDI.SelectObject
1:1971  50                push     ax
1:1972  9abe190000        lcall    0, 0x19be  ; @1:GDI.DeleteObject
1:1977  e9ba00            jmp      0x1a34
1:197A  ff36f609          push     word ptr [0x9f6]
1:197E  ff361c09          push     word ptr [0x91c]
1:1982  ff361a09          push     word ptr [0x91a]
1:1986  9aae120000        lcall    0, 0x12ae  ; @1:GDI.CreateSolidBrush
1:198B  50                push     ax
1:198C  9ab8190000        lcall    0, 0x19b8  ; @1:GDI.SelectObject
1:1991  8946f8            mov      word ptr [bp - 8], ax
1:1994  ff36f609          push     word ptr [0x9f6]
1:1998  ff7606            push     word ptr [bp + 6]
1:199B  ff7608            push     word ptr [bp + 8]
1:199E  b81000            mov      ax, 0x10
1:19A1  50                push     ax
1:19A2  50                push     ax
1:19A3  b82100            mov      ax, 0x21
1:19A6  baf000            mov      dx, 0xf0
1:19A9  52                push     dx
1:19AA  50                push     ax
1:19AB  9ad3120000        lcall    0, 0x12d3  ; @1:GDI.PatBlt
1:19B0  ff36f609          push     word ptr [0x9f6]
1:19B4  ff76f8            push     word ptr [bp - 8]
1:19B7  9ab4120000        lcall    0, 0x12b4  ; @1:GDI.SelectObject
1:19BC  50                push     ax
1:19BD  9ae5120000        lcall    0, 0x12e5  ; @1:GDI.DeleteObject
1:19C2  c746fa0000        mov      word ptr [bp - 6], 0
1:19C7  eb30              jmp      0x19f9
1:19C9  8346fc02          add      word ptr [bp - 4], 2
1:19CD  837efc0f          cmp      word ptr [bp - 4], 0xf
1:19D1  7f22              jg       0x19f5
1:19D3  ff36f609          push     word ptr [0x9f6]
1:19D7  8b46fc            mov      ax, word ptr [bp - 4]
1:19DA  034606            add      ax, word ptr [bp + 6]
1:19DD  50                push     ax
1:19DE  8b46fa            mov      ax, word ptr [bp - 6]
1:19E1  034608            add      ax, word ptr [bp + 8]
1:19E4  40                inc      ax
1:19E5  50                push     ax
1:19E6  ff361809          push     word ptr [0x918]
1:19EA  ff361609          push     word ptr [0x916]
1:19EE  9a1f1a0000        lcall    0, 0x1a1f  ; @1:GDI.SetPixel
1:19F3  ebd4              jmp      0x19c9
1:19F5  8346fa02          add      word ptr [bp - 6], 2
1:19F9  837efa0f          cmp      word ptr [bp - 6], 0xf
1:19FD  7d35              jge      0x1a34
1:19FF  c746fc0000        mov      word ptr [bp - 4], 0
1:1A04  ff36f609          push     word ptr [0x9f6]
1:1A08  8b46fc            mov      ax, word ptr [bp - 4]
1:1A0B  034606            add      ax, word ptr [bp + 6]
1:1A0E  50                push     ax
1:1A0F  8b46fa            mov      ax, word ptr [bp - 6]
1:1A12  034608            add      ax, word ptr [bp + 8]
1:1A15  50                push     ax
1:1A16  ff361809          push     word ptr [0x918]
1:1A1A  ff361609          push     word ptr [0x916]
1:1A1E  9a7c1a0000        lcall    0, 0x1a7c  ; @1:GDI.SetPixel
1:1A23  8346fc02          add      word ptr [bp - 4], 2
1:1A27  837efc0f          cmp      word ptr [bp - 4], 0xf
1:1A2B  7cd7              jl       0x1a04
1:1A2D  c746fc0100        mov      word ptr [bp - 4], 1
1:1A32  eb99              jmp      0x19cd
1:1A34  4d                dec      bp
1:1A35  4d                dec      bp
1:1A36  8be5              mov      sp, bp
1:1A38  1f                pop      ds
1:1A39  5d                pop      bp
1:1A3A  4d                dec      bp
1:1A3B  cb                retf     
1:1A3C  1e                push     ds
1:1A3D  58                pop      ax
1:1A3E  90                nop      
1:1A3F  45                inc      bp
1:1A40  55                push     bp
1:1A41  8bec              mov      bp, sp
1:1A43  1e                push     ds
1:1A44  8ed8              mov      ds, ax
1:1A46  83ec10            sub      sp, 0x10
1:1A49  57                push     di
1:1A4A  56                push     si
1:1A4B  9ad51a0000        lcall    0, 0x1ad5  ; @1:USER.GetCurrentTime
1:1A50  8946fa            mov      word ptr [bp - 6], ax
1:1A53  8956fc            mov      word ptr [bp - 4], dx
1:1A56  8b4606            mov      ax, word ptr [bp + 6]
1:1A59  8946f2            mov      word ptr [bp - 0xe], ax
1:1A5C  8b4608            mov      ax, word ptr [bp + 8]
1:1A5F  8946f6            mov      word ptr [bp - 0xa], ax
1:1A62  eb43              jmp      0x1aa7
1:1A64  803c00            cmp      byte ptr [si], 0
1:1A67  7417              je       0x1a80
1:1A69  ff36f609          push     word ptr [0x9f6]
1:1A6D  ff76f8            push     word ptr [bp - 8]
1:1A70  ff76f6            push     word ptr [bp - 0xa]
1:1A73  8a04              mov      al, byte ptr [si]
1:1A75  98                cwde     
1:1A76  b90001            mov      cx, 0x100
1:1A79  51                push     cx
1:1A7A  50                push     ax
1:1A7B  9a471b0000        lcall    0, 0x1b47  ; @1:GDI.SetPixel
1:1A80  83c604            add      si, 4
1:1A83  83c704            add      di, 4
1:1A86  ff46f8            inc      word ptr [bp - 8]
1:1A89  ff46f8            inc      word ptr [bp - 8]
1:1A8C  a16009            mov      ax, word ptr [0x960]
1:1A8F  3946f8            cmp      word ptr [bp - 8], ax
1:1A92  7cd0              jl       0x1a64
1:1A94  c41e060a          les      bx, ptr [0xa06]
1:1A98  26837f0a08        cmp      word ptr es:[bx + 0xa], 8
1:1A9D  7c04              jl       0x1aa3
1:1A9F  0e                push     cs
1:1AA0  e8c8e7            call     0x26b
1:1AA3  8346f604          add      word ptr [bp - 0xa], 4
1:1AA7  8b46f6            mov      ax, word ptr [bp - 0xa]
1:1AAA  3906b409          cmp      word ptr [0x9b4], ax
1:1AAE  7e24              jle      0x1ad4
1:1AB0  f72e6009          imul     word ptr [0x960]
1:1AB4  8bf0              mov      si, ax
1:1AB6  037606            add      si, word ptr [bp + 6]
1:1AB9  0336400a          add      si, word ptr [0xa40]
1:1ABD  a10e0a            mov      ax, word ptr [0xa0e]
1:1AC0  f76ef6            imul     word ptr [bp - 0xa]
1:1AC3  8bf8              mov      di, ax
1:1AC5  033e2a0b          add      di, word ptr [0xb2a]
1:1AC9  037e06            add      di, word ptr [bp + 6]
1:1ACC  8b46f2            mov      ax, word ptr [bp - 0xe]
1:1ACF  8946f8            mov      word ptr [bp - 8], ax
1:1AD2  ebb8              jmp      0x1a8c
1:1AD4  9a1a1b0000        lcall    0, 0x1b1a  ; @1:USER.GetCurrentTime
1:1AD9  8b4efa            mov      cx, word ptr [bp - 6]
1:1ADC  8b5efc            mov      bx, word ptr [bp - 4]
1:1ADF  83c103            add      cx, 3
1:1AE2  83d300            adc      bx, 0
1:1AE5  3bd3              cmp      dx, bx
1:1AE7  7717              ja       0x1b00
1:1AE9  7204              jb       0x1aef
1:1AEB  3bc1              cmp      ax, cx
1:1AED  7311              jae      0x1b00
1:1AEF  c41e060a          les      bx, ptr [0xa06]
1:1AF3  26837f0a08        cmp      word ptr es:[bx + 0xa], 8
1:1AF8  7cda              jl       0x1ad4
1:1AFA  0e                push     cs
1:1AFB  e86de7            call     0x26b
1:1AFE  ebd4              jmp      0x1ad4
1:1B00  5e                pop      si
1:1B01  5f                pop      di
1:1B02  4d                dec      bp
1:1B03  4d                dec      bp
1:1B04  8be5              mov      sp, bp
1:1B06  1f                pop      ds
1:1B07  5d                pop      bp
1:1B08  4d                dec      bp
1:1B09  cb                retf     
1:1B0A  1e                push     ds
1:1B0B  58                pop      ax
1:1B0C  90                nop      
1:1B0D  45                inc      bp
1:1B0E  55                push     bp
1:1B0F  8bec              mov      bp, sp
1:1B11  1e                push     ds
1:1B12  8ed8              mov      ds, ax
1:1B14  83ec10            sub      sp, 0x10
1:1B17  57                push     di
1:1B18  56                push     si
1:1B19  9aa11b0000        lcall    0, 0x1ba1  ; @1:USER.GetCurrentTime
1:1B1E  8946fa            mov      word ptr [bp - 6], ax
1:1B21  8956fc            mov      word ptr [bp - 4], dx
1:1B24  8b4606            mov      ax, word ptr [bp + 6]
1:1B27  8946f2            mov      word ptr [bp - 0xe], ax
1:1B2A  8b4608            mov      ax, word ptr [bp + 8]
1:1B2D  8946f6            mov      word ptr [bp - 0xa], ax
1:1B30  eb41              jmp      0x1b73
1:1B32  803c00            cmp      byte ptr [si], 0
1:1B35  7414              je       0x1b4b
1:1B37  ff36f609          push     word ptr [0x9f6]
1:1B3B  50                push     ax
1:1B3C  ff76f6            push     word ptr [bp - 0xa]
1:1B3F  2bc0              sub      ax, ax
1:1B41  ba0002            mov      dx, 0x200
1:1B44  52                push     dx
1:1B45  50                push     ax
1:1B46  9a2d160000        lcall    0, 0x162d  ; @1:GDI.SetPixel
1:1B4B  83c604            add      si, 4
1:1B4E  83c704            add      di, 4
1:1B51  ff46f8            inc      word ptr [bp - 8]
1:1B54  ff46f8            inc      word ptr [bp - 8]
1:1B57  8b46f8            mov      ax, word ptr [bp - 8]
1:1B5A  39066009          cmp      word ptr [0x960], ax
1:1B5E  7fd2              jg       0x1b32
1:1B60  c41e060a          les      bx, ptr [0xa06]
1:1B64  26837f0a08        cmp      word ptr es:[bx + 0xa], 8
1:1B69  7c04              jl       0x1b6f
1:1B6B  0e                push     cs
1:1B6C  e8fce6            call     0x26b
1:1B6F  8346f604          add      word ptr [bp - 0xa], 4
1:1B73  8b46f6            mov      ax, word ptr [bp - 0xa]
1:1B76  3906b409          cmp      word ptr [0x9b4], ax
1:1B7A  7e24              jle      0x1ba0
1:1B7C  f72e6009          imul     word ptr [0x960]
1:1B80  8bf0              mov      si, ax
1:1B82  0336400a          add      si, word ptr [0xa40]
1:1B86  037606            add      si, word ptr [bp + 6]
1:1B89  a10e0a            mov      ax, word ptr [0xa0e]
1:1B8C  f76ef6            imul     word ptr [bp - 0xa]
1:1B8F  8bf8              mov      di, ax
1:1B91  033e2a0b          add      di, word ptr [0xb2a]
1:1B95  037e06            add      di, word ptr [bp + 6]
1:1B98  8b46f2            mov      ax, word ptr [bp - 0xe]
1:1B9B  8946f8            mov      word ptr [bp - 8], ax
1:1B9E  ebb7              jmp      0x1b57
1:1BA0  9affff0000        lcall    0, 0xffff  ; @1:USER.GetCurrentTime
1:1BA5  8b4efa            mov      cx, word ptr [bp - 6]
1:1BA8  8b5efc            mov      bx, word ptr [bp - 4]
1:1BAB  83c103            add      cx, 3
1:1BAE  83d300            adc      bx, 0
1:1BB1  3bd3              cmp      dx, bx
1:1BB3  7717              ja       0x1bcc
1:1BB5  7204              jb       0x1bbb
1:1BB7  3bc1              cmp      ax, cx
1:1BB9  7311              jae      0x1bcc
1:1BBB  c41e060a          les      bx, ptr [0xa06]
1:1BBF  26837f0a08        cmp      word ptr es:[bx + 0xa], 8
1:1BC4  7cda              jl       0x1ba0
1:1BC6  0e                push     cs
1:1BC7  e8a1e6            call     0x26b
1:1BCA  ebd4              jmp      0x1ba0
1:1BCC  5e                pop      si
1:1BCD  5f                pop      di
1:1BCE  4d                dec      bp
1:1BCF  4d                dec      bp
1:1BD0  8be5              mov      sp, bp
1:1BD2  1f                pop      ds
1:1BD3  5d                pop      bp
1:1BD4  4d                dec      bp
1:1BD5  cb                retf     
1:1BD6  1e                push     ds
1:1BD7  58                pop      ax
1:1BD8  90                nop      
1:1BD9  45                inc      bp
1:1BDA  55                push     bp
1:1BDB  8bec              mov      bp, sp
1:1BDD  1e                push     ds
1:1BDE  8ed8              mov      ds, ax
1:1BE0  833e020a10        cmp      word ptr [0xa02], 0x10
1:1BE5  7d16              jge      0x1bfd
1:1BE7  8b1e020a          mov      bx, word ptr [0xa02]
1:1BEB  d1e3              shl      bx, 1
1:1BED  d1e3              shl      bx, 1
1:1BEF  ffb72203          push     word ptr [bx + 0x322]
1:1BF3  ffb72003          push     word ptr [bx + 0x320]
1:1BF7  0e                push     cs
1:1BF8  e80fff            call     0x1b0a
1:1BFB  eb14              jmp      0x1c11
1:1BFD  8b1e020a          mov      bx, word ptr [0xa02]
1:1C01  d1e3              shl      bx, 1
1:1C03  d1e3              shl      bx, 1
1:1C05  ffb7e202          push     word ptr [bx + 0x2e2]
1:1C09  ffb7e002          push     word ptr [bx + 0x2e0]
1:1C0D  0e                push     cs
1:1C0E  e82bfe            call     0x1a3c
1:1C11  5b                pop      bx
1:1C12  5b                pop      bx
1:1C13  4d                dec      bp
1:1C14  4d                dec      bp
1:1C15  8be5              mov      sp, bp
1:1C17  1f                pop      ds
1:1C18  5d                pop      bp
1:1C19  4d                dec      bp
1:1C1A  cb                retf     

; ===== EXPORT:ord_21(#21) =====
1:1C1B  1e                push     ds
1:1C1C  58                pop      ax
1:1C1D  90                nop      
1:1C1E  45                inc      bp
1:1C1F  55                push     bp
1:1C20  8bec              mov      bp, sp
1:1C22  1e                push     ds
1:1C23  8ed8              mov      ds, ax
1:1C25  2bc0              sub      ax, ax
1:1C27  4d                dec      bp
1:1C28  4d                dec      bp
1:1C29  8be5              mov      sp, bp
1:1C2B  1f                pop      ds
1:1C2C  5d                pop      bp
1:1C2D  4d                dec      bp
1:1C2E  cb                retf     

; ===== EXPORT:ord_23(#23) =====
1:1C2F  1e                push     ds
1:1C30  58                pop      ax
1:1C31  90                nop      
1:1C32  45                inc      bp
1:1C33  55                push     bp
1:1C34  8bec              mov      bp, sp
1:1C36  1e                push     ds
1:1C37  8ed8              mov      ds, ax
1:1C39  83ec0c            sub      sp, 0xc
1:1C3C  c41e060a          les      bx, ptr [0xa06]
1:1C40  26837f2800        cmp      word ptr es:[bx + 0x28], 0
1:1C45  7532              jne      0x1c79
1:1C47  8d46f6            lea      ax, [bp - 0xa]
1:1C4A  16                push     ss
1:1C4B  50                push     ax
1:1C4C  2bc0              sub      ax, ax
1:1C4E  50                push     ax
1:1C4F  50                push     ax
1:1C50  c41ee40b          les      bx, ptr [0xbe4]
1:1C54  26ff7702          push     word ptr es:[bx + 2]
1:1C58  26ff7704          push     word ptr es:[bx + 4]
1:1C5C  9a830f0000        lcall    0, 0xf83  ; @1:USER.SetRect
1:1C61  ff36f609          push     word ptr [0x9f6]
1:1C65  8d46f6            lea      ax, [bp - 0xa]
1:1C68  16                push     ss
1:1C69  50                push     ax
1:1C6A  b80400            mov      ax, 4
1:1C6D  50                push     ax
1:1C6E  9a950f0000        lcall    0, 0xf95  ; @1:GDI.GetStockObject
1:1C73  50                push     ax
1:1C74  9a9b0f0000        lcall    0, 0xf9b  ; @1:USER.FillRect
1:1C79  c706720a0000      mov      word ptr [0xa72], 0
1:1C7F  0e                push     cs
1:1C80  e8bdf1            call     0xe40
1:1C83  2bc0              sub      ax, ax
1:1C85  4d                dec      bp
1:1C86  4d                dec      bp
1:1C87  8be5              mov      sp, bp
1:1C89  1f                pop      ds
1:1C8A  5d                pop      bp
1:1C8B  4d                dec      bp
1:1C8C  cb                retf     
1:1C8D  1e                push     ds
1:1C8E  58                pop      ax
1:1C8F  90                nop      
1:1C90  45                inc      bp
1:1C91  55                push     bp
1:1C92  8bec              mov      bp, sp
1:1C94  1e                push     ds
1:1C95  8ed8              mov      ds, ax
1:1C97  83ec50            sub      sp, 0x50
1:1C9A  57                push     di
1:1C9B  56                push     si
1:1C9C  a10c0a            mov      ax, word ptr [0xa0c]
1:1C9F  8946e0            mov      word ptr [bp - 0x20], ax
1:1CA2  a1140a            mov      ax, word ptr [0xa14]
1:1CA5  8946d6            mov      word ptr [bp - 0x2a], ax
1:1CA8  c746de160c        mov      word ptr [bp - 0x22], 0xc16
1:1CAD  c746d43e0c        mov      word ptr [bp - 0x2c], 0xc3e
1:1CB2  c746fcba0b        mov      word ptr [bp - 4], 0xbba
1:1CB7  c646d801          mov      byte ptr [bp - 0x28], 1
1:1CBB  8b46d6            mov      ax, word ptr [bp - 0x2a]
1:1CBE  3346e0            xor      ax, word ptr [bp - 0x20]
1:1CC1  8506280b          test     word ptr [0xb28], ax
1:1CC5  7406              je       0x1ccd
1:1CC7  c646e601          mov      byte ptr [bp - 0x1a], 1
1:1CCB  eb04              jmp      0x1cd1
1:1CCD  c646e600          mov      byte ptr [bp - 0x1a], 0
1:1CD1  833e280b01        cmp      word ptr [0xb28], 1
1:1CD6  753e              jne      0x1d16
1:1CD8  837ed600          cmp      word ptr [bp - 0x2a], 0
1:1CDC  7c18              jl       0x1cf6
1:1CDE  8b46d6            mov      ax, word ptr [bp - 0x2a]
1:1CE1  3906b409          cmp      word ptr [0x9b4], ax
1:1CE5  7e0f              jle      0x1cf6
1:1CE7  837ee000          cmp      word ptr [bp - 0x20], 0
1:1CEB  7c09              jl       0x1cf6
1:1CED  8b46e0            mov      ax, word ptr [bp - 0x20]
1:1CF0  39066009          cmp      word ptr [0x960], ax
1:1CF4  7f03              jg       0x1cf9
1:1CF6  e90907            jmp      0x2402
1:1CF9  8b46d6            mov      ax, word ptr [bp - 0x2a]
1:1CFC  8946f8            mov      word ptr [bp - 8], ax
1:1CFF  8b46e0            mov      ax, word ptr [bp - 0x20]
1:1D02  8946fa            mov      word ptr [bp - 6], ax
1:1D05  807ee600          cmp      byte ptr [bp - 0x1a], 0
1:1D09  7450              je       0x1d5b
1:1D0B  a1f409            mov      ax, word ptr [0x9f4]
1:1D0E  8946e8            mov      word ptr [bp - 0x18], ax
1:1D11  a0ec09            mov      al, byte ptr [0x9ec]
1:1D14  eb4e              jmp      0x1d64
1:1D16  803ecc0a00        cmp      byte ptr [0xacc], 0
1:1D1B  7538              jne      0x1d55
1:1D1D  837ed600          cmp      word ptr [bp - 0x2a], 0
1:1D21  7d03              jge      0x1d26
1:1D23  e9dc06            jmp      0x2402
1:1D26  837ee000          cmp      word ptr [bp - 0x20], 0
1:1D2A  7c1a              jl       0x1d46
1:1D2C  a1280b            mov      ax, word ptr [0xb28]
1:1D2F  0346d6            add      ax, word ptr [bp - 0x2a]
1:1D32  48                dec      ax
1:1D33  3b06b409          cmp      ax, word ptr [0x9b4]
1:1D37  7d0d              jge      0x1d46
1:1D39  a1280b            mov      ax, word ptr [0xb28]
1:1D3C  0346e0            add      ax, word ptr [bp - 0x20]
1:1D3F  48                dec      ax
1:1D40  3b066009          cmp      ax, word ptr [0x960]
1:1D44  7c03              jl       0x1d49
1:1D46  e9b906            jmp      0x2402
1:1D49  8b46e0            mov      ax, word ptr [bp - 0x20]
1:1D4C  8946fa            mov      word ptr [bp - 6], ax
1:1D4F  8b46d6            mov      ax, word ptr [bp - 0x2a]
1:1D52  8946f8            mov      word ptr [bp - 8], ax
1:1D55  807ed800          cmp      byte ptr [bp - 0x28], 0
1:1D59  75b0              jne      0x1d0b
1:1D5B  a1f809            mov      ax, word ptr [0x9f8]
1:1D5E  8946e8            mov      word ptr [bp - 0x18], ax
1:1D61  a0f209            mov      al, byte ptr [0x9f2]
1:1D64  8846e2            mov      byte ptr [bp - 0x1e], al
1:1D67  2bc0              sub      ax, ax
1:1D69  8946c2            mov      word ptr [bp - 0x3e], ax
1:1D6C  8946c0            mov      word ptr [bp - 0x40], ax
1:1D6F  2bf6              sub      si, si
1:1D71  e9e902            jmp      0x205d
1:1D74  ff76be            push     word ptr [bp - 0x42]
1:1D77  ff76bc            push     word ptr [bp - 0x44]
1:1D7A  52                push     dx
1:1D7B  50                push     ax
1:1D7C  9a211e0000        lcall    0, 0x1e21  ; @1:INT:ord_8(1:2BD4)
1:1D81  83c408            add      sp, 8
1:1D84  52                push     dx
1:1D85  50                push     ax
1:1D86  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_13(1:2A76)
1:1D8B  5b                pop      bx
1:1D8C  5b                pop      bx
1:1D8D  b90080            mov      cx, 0x8000
1:1D90  bb3a00            mov      bx, 0x3a
1:1D93  2bc8              sub      cx, ax
1:1D95  1bda              sbb      bx, dx
1:1D97  894eb8            mov      word ptr [bp - 0x48], cx
1:1D9A  895eba            mov      word ptr [bp - 0x46], bx
1:1D9D  837ee401          cmp      word ptr [bp - 0x1c], 1
1:1DA1  7513              jne      0x1db6
1:1DA3  2bc0              sub      ax, ax
1:1DA5  ba7500            mov      dx, 0x75
1:1DA8  2b46b8            sub      ax, word ptr [bp - 0x48]
1:1DAB  1b56ba            sbb      dx, word ptr [bp - 0x46]
1:1DAE  8946b8            mov      word ptr [bp - 0x48], ax
1:1DB1  8956ba            mov      word ptr [bp - 0x46], dx
1:1DB4  eb1b              jmp      0x1dd1
1:1DB6  837ee402          cmp      word ptr [bp - 0x1c], 2
1:1DBA  7507              jne      0x1dc3
1:1DBC  2bc0              sub      ax, ax
1:1DBE  baea00            mov      dx, 0xea
1:1DC1  ebe5              jmp      0x1da8
1:1DC3  837ee403          cmp      word ptr [bp - 0x1c], 3
1:1DC7  7508              jne      0x1dd1
1:1DC9  8346b800          add      word ptr [bp - 0x48], 0
1:1DCD  8356ba75          adc      word ptr [bp - 0x46], 0x75
1:1DD1  8bde              mov      bx, si
1:1DD3  d1e3              shl      bx, 1
1:1DD5  83bf160a00        cmp      word ptr [bx + 0xa16], 0
1:1DDA  7d11              jge      0x1ded
1:1DDC  2bc0              sub      ax, ax
1:1DDE  baea00            mov      dx, 0xea
1:1DE1  2b46b8            sub      ax, word ptr [bp - 0x48]
1:1DE4  1b56ba            sbb      dx, word ptr [bp - 0x46]
1:1DE7  8946b8            mov      word ptr [bp - 0x48], ax
1:1DEA  8956ba            mov      word ptr [bp - 0x46], dx
1:1DED  8bde              mov      bx, si
1:1DEF  d1e3              shl      bx, 1
1:1DF1  8b87000b          mov      ax, word ptr [bx + 0xb00]
1:1DF5  99                cdq      
1:1DF6  52                push     dx
1:1DF7  50                push     ax
1:1DF8  8d46b8            lea      ax, [bp - 0x48]
1:1DFB  16                push     ss
1:1DFC  50                push     ax
1:1DFD  8bfb              mov      di, bx
1:1DFF  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:2F44)
1:1E04  83bd160a00        cmp      word ptr [di + 0xa16], 0
1:1E09  7d25              jge      0x1e30
1:1E0B  8b46bc            mov      ax, word ptr [bp - 0x44]
1:1E0E  8b56be            mov      dx, word ptr [bp - 0x42]
1:1E11  050000            add      ax, 0
1:1E14  83d20a            adc      dx, 0xa
1:1E17  52                push     dx
1:1E18  50                push     ax
1:1E19  8b858c09          mov      ax, word ptr [di + 0x98c]
1:1E1D  99                cdq      
1:1E1E  52                push     dx
1:1E1F  50                push     ax
1:1E20  9a4a1e0000        lcall    0, 0x1e4a  ; @1:INT:ord_8(1:2BD4)
1:1E25  83c408            add      sp, 8
1:1E28  2946b8            sub      word ptr [bp - 0x48], ax
1:1E2B  1956ba            sbb      word ptr [bp - 0x46], dx
1:1E2E  eb27              jmp      0x1e57
1:1E30  8b46bc            mov      ax, word ptr [bp - 0x44]
1:1E33  8b56be            mov      dx, word ptr [bp - 0x42]
1:1E36  050000            add      ax, 0
1:1E39  83d20a            adc      dx, 0xa
1:1E3C  52                push     dx
1:1E3D  50                push     ax
1:1E3E  8bde              mov      bx, si
1:1E40  d1e3              shl      bx, 1
1:1E42  8b878c09          mov      ax, word ptr [bx + 0x98c]
1:1E46  99                cdq      
1:1E47  52                push     dx
1:1E48  50                push     ax
1:1E49  9a40200000        lcall    0, 0x2040  ; @1:INT:ord_8(1:2BD4)
1:1E4E  83c408            add      sp, 8
1:1E51  0146b8            add      word ptr [bp - 0x48], ax
1:1E54  1156ba            adc      word ptr [bp - 0x46], dx
1:1E57  8bde              mov      bx, si
1:1E59  d1e3              shl      bx, 1
1:1E5B  83bf760a00        cmp      word ptr [bx + 0xa76], 0
1:1E60  7460              je       0x1ec2
1:1E62  b8204e            mov      ax, 0x4e20
1:1E65  99                cdq      
1:1E66  52                push     dx
1:1E67  50                push     ax
1:1E68  8b46f4            mov      ax, word ptr [bp - 0xc]
1:1E6B  8b56f6            mov      dx, word ptr [bp - 0xa]
1:1E6E  05c800            add      ax, 0xc8
1:1E71  83d200            adc      dx, 0
1:1E74  52                push     dx
1:1E75  50                push     ax
1:1E76  b82800            mov      ax, 0x28
1:1E79  99                cdq      
1:1E7A  52                push     dx
1:1E7B  50                push     ax
1:1E7C  8b87760a          mov      ax, word ptr [bx + 0xa76]
1:1E80  99                cdq      
1:1E81  52                push     dx
1:1E82  50                push     ax
1:1E83  ff76be            push     word ptr [bp - 0x42]
1:1E86  ff76bc            push     word ptr [bp - 0x44]
1:1E89  8bfb              mov      di, bx
1:1E8B  9ab11e0000        lcall    0, 0x1eb1  ; @1:INT:ord_4(1:2FC8)
1:1E90  52                push     dx
1:1E91  50                push     ax
1:1E92  9aaa1e0000        lcall    0, 0x1eaa  ; @1:INT:ord_5(1:3062)
1:1E97  52                push     dx
1:1E98  50                push     ax
1:1E99  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:29B2)
1:1E9E  5b                pop      bx
1:1E9F  5b                pop      bx
1:1EA0  52                push     dx
1:1EA1  50                push     ax
1:1EA2  8b85640b          mov      ax, word ptr [di + 0xb64]
1:1EA6  99                cdq      
1:1EA7  52                push     dx
1:1EA8  50                push     ax
1:1EA9  9ab81e0000        lcall    0, 0x1eb8  ; @1:INT:ord_5(1:3062)
1:1EAE  52                push     dx
1:1EAF  50                push     ax
1:1EB0  9abe030000        lcall    0, 0x3be  ; @1:INT:ord_4(1:2FC8)
1:1EB5  52                push     dx
1:1EB6  50                push     ax
1:1EB7  9a091f0000        lcall    0, 0x1f09  ; @1:INT:ord_5(1:3062)
1:1EBC  0146b8            add      word ptr [bp - 0x48], ax
1:1EBF  1156ba            adc      word ptr [bp - 0x46], dx
1:1EC2  8b46b8            mov      ax, word ptr [bp - 0x48]
1:1EC5  8b56ba            mov      dx, word ptr [bp - 0x46]
1:1EC8  e97c01            jmp      0x2047
1:1ECB  837ee802          cmp      word ptr [bp - 0x18], 2
1:1ECF  7403              je       0x1ed4
1:1ED1  e99400            jmp      0x1f68
1:1ED4  8b46e0            mov      ax, word ptr [bp - 0x20]
1:1ED7  8bde              mov      bx, si
1:1ED9  d1e3              shl      bx, 1
1:1EDB  8b7ede            mov      di, word ptr [bp - 0x22]
1:1EDE  2b01              sub      ax, word ptr [bx + di]
1:1EE0  99                cdq      
1:1EE1  8946da            mov      word ptr [bp - 0x26], ax
1:1EE4  8956dc            mov      word ptr [bp - 0x24], dx
1:1EE7  8b7ed4            mov      di, word ptr [bp - 0x2c]
1:1EEA  8bc8              mov      cx, ax
1:1EEC  8b46d6            mov      ax, word ptr [bp - 0x2a]
1:1EEF  2b01              sub      ax, word ptr [bx + di]
1:1EF1  8bfa              mov      di, dx
1:1EF3  99                cdq      
1:1EF4  8946d0            mov      word ptr [bp - 0x30], ax
1:1EF7  8956d2            mov      word ptr [bp - 0x2e], dx
1:1EFA  57                push     di
1:1EFB  51                push     cx
1:1EFC  57                push     di
1:1EFD  51                push     cx
1:1EFE  8bf8              mov      di, ax
1:1F00  897ebc            mov      word ptr [bp - 0x44], di
1:1F03  8956be            mov      word ptr [bp - 0x42], dx
1:1F06  8bfb              mov      di, bx
1:1F08  9a201f0000        lcall    0, 0x1f20  ; @1:INT:ord_5(1:3062)
1:1F0D  ff76be            push     word ptr [bp - 0x42]
1:1F10  ff76bc            push     word ptr [bp - 0x44]
1:1F13  ff76be            push     word ptr [bp - 0x42]
1:1F16  ff76bc            push     word ptr [bp - 0x44]
1:1F19  8946b0            mov      word ptr [bp - 0x50], ax
1:1F1C  8956b2            mov      word ptr [bp - 0x4e], dx
1:1F1F  9a5a1f0000        lcall    0, 0x1f5a  ; @1:INT:ord_5(1:3062)
1:1F24  0346b0            add      ax, word ptr [bp - 0x50]
1:1F27  1356b2            adc      dx, word ptr [bp - 0x4e]
1:1F2A  050100            add      ax, 1
1:1F2D  83d200            adc      dx, 0
1:1F30  8946b8            mov      word ptr [bp - 0x48], ax
1:1F33  8956ba            mov      word ptr [bp - 0x46], dx
1:1F36  52                push     dx
1:1F37  50                push     ax
1:1F38  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:2930)
1:1F3D  5b                pop      bx
1:1F3E  5b                pop      bx
1:1F3F  f7d8              neg      ax
1:1F41  83d200            adc      dx, 0
1:1F44  f7da              neg      dx
1:1F46  8946b4            mov      word ptr [bp - 0x4c], ax
1:1F49  8956b6            mov      word ptr [bp - 0x4a], dx
1:1F4C  52                push     dx
1:1F4D  50                push     ax
1:1F4E  8b85160a          mov      ax, word ptr [di + 0xa16]
1:1F52  f7adba0b          imul     word ptr [di + 0xbba]
1:1F56  99                cdq      
1:1F57  52                push     dx
1:1F58  50                push     ax
1:1F59  9ac61f0000        lcall    0, 0x1fc6  ; @1:INT:ord_5(1:3062)
1:1F5E  b103              mov      cl, 3
1:1F60  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:3140)
1:1F65  e9df00            jmp      0x2047
1:1F68  837ee803          cmp      word ptr [bp - 0x18], 3
1:1F6C  7403              je       0x1f71
1:1F6E  e9e701            jmp      0x2158
1:1F71  8b46e0            mov      ax, word ptr [bp - 0x20]
1:1F74  8bde              mov      bx, si
1:1F76  d1e3              shl      bx, 1
1:1F78  8b7ede            mov      di, word ptr [bp - 0x22]
1:1F7B  2b01              sub      ax, word ptr [bx + di]
1:1F7D  99                cdq      
1:1F7E  8946da            mov      word ptr [bp - 0x26], ax
1:1F81  8956dc            mov      word ptr [bp - 0x24], dx
1:1F84  0bd2              or       dx, dx
1:1F86  7d0d              jge      0x1f95
1:1F88  f7d8              neg      ax
1:1F8A  83d200            adc      dx, 0
1:1F8D  f7da              neg      dx
1:1F8F  8946da            mov      word ptr [bp - 0x26], ax
1:1F92  8956dc            mov      word ptr [bp - 0x24], dx
1:1F95  8b46d6            mov      ax, word ptr [bp - 0x2a]
1:1F98  8bde              mov      bx, si
1:1F9A  d1e3              shl      bx, 1
1:1F9C  8b7ed4            mov      di, word ptr [bp - 0x2c]
1:1F9F  2b01              sub      ax, word ptr [bx + di]
1:1FA1  99                cdq      
1:1FA2  8946d0            mov      word ptr [bp - 0x30], ax
1:1FA5  8956d2            mov      word ptr [bp - 0x2e], dx
1:1FA8  0bd2              or       dx, dx
1:1FAA  7d0d              jge      0x1fb9
1:1FAC  f7d8              neg      ax
1:1FAE  83d200            adc      dx, 0
1:1FB1  f7da              neg      dx
1:1FB3  8946d0            mov      word ptr [bp - 0x30], ax
1:1FB6  8956d2            mov      word ptr [bp - 0x2e], dx
1:1FB9  ff76dc            push     word ptr [bp - 0x24]
1:1FBC  ff76da            push     word ptr [bp - 0x26]
1:1FBF  ff76dc            push     word ptr [bp - 0x24]
1:1FC2  ff76da            push     word ptr [bp - 0x26]
1:1FC5  9adf1f0000        lcall    0, 0x1fdf  ; @1:INT:ord_5(1:3062)
1:1FCA  ff76d2            push     word ptr [bp - 0x2e]
1:1FCD  ff76d0            push     word ptr [bp - 0x30]
1:1FD0  ff76d2            push     word ptr [bp - 0x2e]
1:1FD3  ff76d0            push     word ptr [bp - 0x30]
1:1FD6  8bf8              mov      di, ax
1:1FD8  897eb4            mov      word ptr [bp - 0x4c], di
1:1FDB  8956b6            mov      word ptr [bp - 0x4a], dx
1:1FDE  9a39200000        lcall    0, 0x2039  ; @1:INT:ord_5(1:3062)
1:1FE3  0346b4            add      ax, word ptr [bp - 0x4c]
1:1FE6  1356b6            adc      dx, word ptr [bp - 0x4a]
1:1FE9  8946f4            mov      word ptr [bp - 0xc], ax
1:1FEC  8956f6            mov      word ptr [bp - 0xa], dx
1:1FEF  0bd2              or       dx, dx
1:1FF1  7c5a              jl       0x204d
1:1FF3  7f04              jg       0x1ff9
1:1FF5  0bc0              or       ax, ax
1:1FF7  7454              je       0x204d
1:1FF9  52                push     dx
1:1FFA  50                push     ax
1:1FFB  9a0e210000        lcall    0, 0x210e  ; @1:INT:ord_7(1:2AF6)
1:2000  5b                pop      bx
1:2001  5b                pop      bx
1:2002  8946b0            mov      word ptr [bp - 0x50], ax
1:2005  8956b2            mov      word ptr [bp - 0x4e], dx
1:2008  8b46da            mov      ax, word ptr [bp - 0x26]
1:200B  8b56dc            mov      dx, word ptr [bp - 0x24]
1:200E  3956d2            cmp      word ptr [bp - 0x2e], dx
1:2011  7d03              jge      0x2016
1:2013  e9e102            jmp      0x22f7
1:2016  7f08              jg       0x2020
1:2018  3946d0            cmp      word ptr [bp - 0x30], ax
1:201B  7703              ja       0x2020
1:201D  e9d702            jmp      0x22f7
1:2020  ff76b2            push     word ptr [bp - 0x4e]
1:2023  ff76b0            push     word ptr [bp - 0x50]
1:2026  ff76d2            push     word ptr [bp - 0x2e]
1:2029  ff76d0            push     word ptr [bp - 0x30]
1:202C  8bde              mov      bx, si
1:202E  d1e3              shl      bx, 1
1:2030  8b7efc            mov      di, word ptr [bp - 4]
1:2033  8b01              mov      ax, word ptr [bx + di]
1:2035  99                cdq      
1:2036  52                push     dx
1:2037  50                push     ax
1:2038  9ad2200000        lcall    0, 0x20d2  ; @1:INT:ord_5(1:3062)
1:203D  52                push     dx
1:203E  50                push     ax
1:203F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:2BD4)
1:2044  83c408            add      sp, 8
1:2047  0146c0            add      word ptr [bp - 0x40], ax
1:204A  1156c2            adc      word ptr [bp - 0x3e], dx
1:204D  807ee200          cmp      byte ptr [bp - 0x1e], 0
1:2051  7409              je       0x205c
1:2053  c746c00000        mov      word ptr [bp - 0x40], 0
1:2058  8066c2fc          and      byte ptr [bp - 0x3e], 0xfc
1:205C  46                inc      si
1:205D  3936040a          cmp      word ptr [0xa04], si
1:2061  7f03              jg       0x2066
1:2063  e99c02            jmp      0x2302
1:2066  837ee801          cmp      word ptr [bp - 0x18], 1
1:206A  7403              je       0x206f
1:206C  e95cfe            jmp      0x1ecb
1:206F  c746e40000        mov      word ptr [bp - 0x1c], 0
1:2074  8b46e0            mov      ax, word ptr [bp - 0x20]
1:2077  8bde              mov      bx, si
1:2079  d1e3              shl      bx, 1
1:207B  8b7ede            mov      di, word ptr [bp - 0x22]
1:207E  2b01              sub      ax, word ptr [bx + di]
1:2080  99                cdq      
1:2081  8946da            mov      word ptr [bp - 0x26], ax
1:2084  8956dc            mov      word ptr [bp - 0x24], dx
1:2087  0bd2              or       dx, dx
1:2089  7d12              jge      0x209d
1:208B  f7d8              neg      ax
1:208D  83d200            adc      dx, 0
1:2090  f7da              neg      dx
1:2092  8946da            mov      word ptr [bp - 0x26], ax
1:2095  8956dc            mov      word ptr [bp - 0x24], dx
1:2098  c746e40100        mov      word ptr [bp - 0x1c], 1
1:209D  8b46d6            mov      ax, word ptr [bp - 0x2a]
1:20A0  8bde              mov      bx, si
1:20A2  d1e3              shl      bx, 1
1:20A4  8b7ed4            mov      di, word ptr [bp - 0x2c]
1:20A7  2b01              sub      ax, word ptr [bx + di]
1:20A9  99                cdq      
1:20AA  8946d0            mov      word ptr [bp - 0x30], ax
1:20AD  8956d2            mov      word ptr [bp - 0x2e], dx
1:20B0  0bd2              or       dx, dx
1:20B2  7d11              jge      0x20c5
1:20B4  f7d8              neg      ax
1:20B6  83d200            adc      dx, 0
1:20B9  f7da              neg      dx
1:20BB  8946d0            mov      word ptr [bp - 0x30], ax
1:20BE  8956d2            mov      word ptr [bp - 0x2e], dx
1:20C1  8346e402          add      word ptr [bp - 0x1c], 2
1:20C5  ff76dc            push     word ptr [bp - 0x24]
1:20C8  ff76da            push     word ptr [bp - 0x26]
1:20CB  ff76dc            push     word ptr [bp - 0x24]
1:20CE  ff76da            push     word ptr [bp - 0x26]
1:20D1  9aeb200000        lcall    0, 0x20eb  ; @1:INT:ord_5(1:3062)
1:20D6  ff76d2            push     word ptr [bp - 0x2e]
1:20D9  ff76d0            push     word ptr [bp - 0x30]
1:20DC  ff76d2            push     word ptr [bp - 0x2e]
1:20DF  ff76d0            push     word ptr [bp - 0x30]
1:20E2  8bf8              mov      di, ax
1:20E4  897eb4            mov      word ptr [bp - 0x4c], di
1:20E7  8956b6            mov      word ptr [bp - 0x4a], dx
1:20EA  9ab7030000        lcall    0, 0x3b7  ; @1:INT:ord_5(1:3062)
1:20EF  0346b4            add      ax, word ptr [bp - 0x4c]
1:20F2  1356b6            adc      dx, word ptr [bp - 0x4a]
1:20F5  8946f4            mov      word ptr [bp - 0xc], ax
1:20F8  8956f6            mov      word ptr [bp - 0xa], dx
1:20FB  0bd2              or       dx, dx
1:20FD  7d03              jge      0x2102
1:20FF  e94bff            jmp      0x204d
1:2102  7f07              jg       0x210b
1:2104  0bc0              or       ax, ax
1:2106  7503              jne      0x210b
1:2108  e942ff            jmp      0x204d
1:210B  52                push     dx
1:210C  50                push     ax
1:210D  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:2AF6)
1:2112  5b                pop      bx
1:2113  5b                pop      bx
1:2114  8946bc            mov      word ptr [bp - 0x44], ax
1:2117  8956be            mov      word ptr [bp - 0x42], dx
1:211A  8b46da            mov      ax, word ptr [bp - 0x26]
1:211D  8b56dc            mov      dx, word ptr [bp - 0x24]
1:2120  3956d2            cmp      word ptr [bp - 0x2e], dx
1:2123  7e03              jle      0x2128
1:2125  e94cfc            jmp      0x1d74
1:2128  7c08              jl       0x2132
1:212A  3946d0            cmp      word ptr [bp - 0x30], ax
1:212D  7203              jb       0x2132
1:212F  e942fc            jmp      0x1d74
1:2132  ff76be            push     word ptr [bp - 0x42]
1:2135  ff76bc            push     word ptr [bp - 0x44]
1:2138  ff76d2            push     word ptr [bp - 0x2e]
1:213B  ff76d0            push     word ptr [bp - 0x30]
1:213E  9a7d1d0000        lcall    0, 0x1d7d  ; @1:INT:ord_8(1:2BD4)
1:2143  83c408            add      sp, 8
1:2146  52                push     dx
1:2147  50                push     ax
1:2148  9a871d0000        lcall    0, 0x1d87  ; @1:INT:ord_13(1:2A76)
1:214D  5b                pop      bx
1:214E  5b                pop      bx
1:214F  8946b8            mov      word ptr [bp - 0x48], ax
1:2152  8956ba            mov      word ptr [bp - 0x46], dx
1:2155  e945fc            jmp      0x1d9d
1:2158  837ee804          cmp      word ptr [bp - 0x18], 4
1:215C  7403              je       0x2161
1:215E  e9cb00            jmp      0x222c
1:2161  8b46e0            mov      ax, word ptr [bp - 0x20]
1:2164  8bde              mov      bx, si
1:2166  d1e3              shl      bx, 1
1:2168  8b7ede            mov      di, word ptr [bp - 0x22]
1:216B  2b01              sub      ax, word ptr [bx + di]
1:216D  99                cdq      
1:216E  8946da            mov      word ptr [bp - 0x26], ax
1:2171  8956dc            mov      word ptr [bp - 0x24], dx
1:2174  0bd2              or       dx, dx
1:2176  7d0d              jge      0x2185
1:2178  f7d8              neg      ax
1:217A  83d200            adc      dx, 0
1:217D  f7da              neg      dx
1:217F  8946da            mov      word ptr [bp - 0x26], ax
1:2182  8956dc            mov      word ptr [bp - 0x24], dx
1:2185  8b46d6            mov      ax, word ptr [bp - 0x2a]
1:2188  8bde              mov      bx, si
1:218A  d1e3              shl      bx, 1
1:218C  8b7ed4            mov      di, word ptr [bp - 0x2c]
1:218F  2b01              sub      ax, word ptr [bx + di]
1:2191  99                cdq      
1:2192  8946d0            mov      word ptr [bp - 0x30], ax
1:2195  8956d2            mov      word ptr [bp - 0x2e], dx
1:2198  0bd2              or       dx, dx
1:219A  7d0d              jge      0x21a9
1:219C  f7d8              neg      ax
1:219E  83d200            adc      dx, 0
1:21A1  f7da              neg      dx
1:21A3  8946d0            mov      word ptr [bp - 0x30], ax
1:21A6  8956d2            mov      word ptr [bp - 0x2e], dx
1:21A9  ff76dc            push     word ptr [bp - 0x24]
1:21AC  ff76da            push     word ptr [bp - 0x26]
1:21AF  ff76dc            push     word ptr [bp - 0x24]
1:21B2  ff76da            push     word ptr [bp - 0x26]
1:21B5  9acf210000        lcall    0, 0x21cf  ; @1:INT:ord_5(1:3062)
1:21BA  ff76d2            push     word ptr [bp - 0x2e]
1:21BD  ff76d0            push     word ptr [bp - 0x30]
1:21C0  ff76d2            push     word ptr [bp - 0x2e]
1:21C3  ff76d0            push     word ptr [bp - 0x30]
1:21C6  8bf8              mov      di, ax
1:21C8  897eb4            mov      word ptr [bp - 0x4c], di
1:21CB  8956b6            mov      word ptr [bp - 0x4a], dx
1:21CE  9a22220000        lcall    0, 0x2222  ; @1:INT:ord_5(1:3062)
1:21D3  0346b4            add      ax, word ptr [bp - 0x4c]
1:21D6  1356b6            adc      dx, word ptr [bp - 0x4a]
1:21D9  8946f4            mov      word ptr [bp - 0xc], ax
1:21DC  8956f6            mov      word ptr [bp - 0xa], dx
1:21DF  0bd2              or       dx, dx
1:21E1  7d03              jge      0x21e6
1:21E3  e967fe            jmp      0x204d
1:21E6  7f04              jg       0x21ec
1:21E8  0bc0              or       ax, ax
1:21EA  7446              je       0x2232
1:21EC  52                push     dx
1:21ED  50                push     ax
1:21EE  9ad3220000        lcall    0, 0x22d3  ; @1:INT:ord_7(1:2AF6)
1:21F3  5b                pop      bx
1:21F4  5b                pop      bx
1:21F5  8946b0            mov      word ptr [bp - 0x50], ax
1:21F8  8956b2            mov      word ptr [bp - 0x4e], dx
1:21FB  050000            add      ax, 0
1:21FE  83d201            adc      dx, 1
1:2201  52                push     dx
1:2202  50                push     ax
1:2203  ff76b2            push     word ptr [bp - 0x4e]
1:2206  ff76b0            push     word ptr [bp - 0x50]
1:2209  9a9a1e0000        lcall    0, 0x1e9a  ; @1:INT:ord_11(1:29B2)
1:220E  5b                pop      bx
1:220F  5b                pop      bx
1:2210  52                push     dx
1:2211  50                push     ax
1:2212  b82800            mov      ax, 0x28
1:2215  8bde              mov      bx, si
1:2217  d1e3              shl      bx, 1
1:2219  8b7efc            mov      di, word ptr [bp - 4]
1:221C  f729              imul     word ptr [bx + di]
1:221E  99                cdq      
1:221F  52                push     dx
1:2220  50                push     ax
1:2221  9a8a220000        lcall    0, 0x228a  ; @1:INT:ord_5(1:3062)
1:2226  8bc2              mov      ax, dx
1:2228  99                cdq      
1:2229  e911fe            jmp      0x203d
1:222C  837ee805          cmp      word ptr [bp - 0x18], 5
1:2230  7403              je       0x2235
1:2232  e918fe            jmp      0x204d
1:2235  8b46e0            mov      ax, word ptr [bp - 0x20]
1:2238  8bde              mov      bx, si
1:223A  d1e3              shl      bx, 1
1:223C  8b7ede            mov      di, word ptr [bp - 0x22]
1:223F  2b01              sub      ax, word ptr [bx + di]
1:2241  99                cdq      
1:2242  8946da            mov      word ptr [bp - 0x26], ax
1:2245  8956dc            mov      word ptr [bp - 0x24], dx
1:2248  0bd2              or       dx, dx
1:224A  7d0d              jge      0x2259
1:224C  f7d8              neg      ax
1:224E  83d200            adc      dx, 0
1:2251  f7da              neg      dx
1:2253  8946da            mov      word ptr [bp - 0x26], ax
1:2256  8956dc            mov      word ptr [bp - 0x24], dx
1:2259  8b46d6            mov      ax, word ptr [bp - 0x2a]
1:225C  8bde              mov      bx, si
1:225E  d1e3              shl      bx, 1
1:2260  8b7ed4            mov      di, word ptr [bp - 0x2c]
1:2263  2b01              sub      ax, word ptr [bx + di]
1:2265  99                cdq      
1:2266  8946d0            mov      word ptr [bp - 0x30], ax
1:2269  8956d2            mov      word ptr [bp - 0x2e], dx
1:226C  0bd2              or       dx, dx
1:226E  7d0d              jge      0x227d
1:2270  f7d8              neg      ax
1:2272  83d200            adc      dx, 0
1:2275  f7da              neg      dx
1:2277  8946d0            mov      word ptr [bp - 0x30], ax
1:227A  8956d2            mov      word ptr [bp - 0x2e], dx
1:227D  ff76dc            push     word ptr [bp - 0x24]
1:2280  ff76da            push     word ptr [bp - 0x26]
1:2283  ff76dc            push     word ptr [bp - 0x24]
1:2286  ff76da            push     word ptr [bp - 0x26]
1:2289  9aa3220000        lcall    0, 0x22a3  ; @1:INT:ord_5(1:3062)
1:228E  ff76d2            push     word ptr [bp - 0x2e]
1:2291  ff76d0            push     word ptr [bp - 0x30]
1:2294  ff76d2            push     word ptr [bp - 0x2e]
1:2297  ff76d0            push     word ptr [bp - 0x30]
1:229A  8bf8              mov      di, ax
1:229C  897eb4            mov      word ptr [bp - 0x4c], di
1:229F  8956b6            mov      word ptr [bp - 0x4a], dx
1:22A2  9a931e0000        lcall    0, 0x1e93  ; @1:INT:ord_5(1:3062)
1:22A7  0346b4            add      ax, word ptr [bp - 0x4c]
1:22AA  1356b6            adc      dx, word ptr [bp - 0x4a]
1:22AD  8946f4            mov      word ptr [bp - 0xc], ax
1:22B0  8956f6            mov      word ptr [bp - 0xa], dx
1:22B3  0bd2              or       dx, dx
1:22B5  7d03              jge      0x22ba
1:22B7  e993fd            jmp      0x204d
1:22BA  7f07              jg       0x22c3
1:22BC  0bc0              or       ax, ax
1:22BE  7503              jne      0x22c3
1:22C0  e98afd            jmp      0x204d
1:22C3  b102              mov      cl, 2
1:22C5  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_15(1:3134)
1:22CA  8946f4            mov      word ptr [bp - 0xc], ax
1:22CD  8956f6            mov      word ptr [bp - 0xa], dx
1:22D0  52                push     dx
1:22D1  50                push     ax
1:22D2  9afc1f0000        lcall    0, 0x1ffc  ; @1:INT:ord_7(1:2AF6)
1:22D7  5b                pop      bx
1:22D8  5b                pop      bx
1:22D9  8946b0            mov      word ptr [bp - 0x50], ax
1:22DC  8956b2            mov      word ptr [bp - 0x4e], dx
1:22DF  8b46da            mov      ax, word ptr [bp - 0x26]
1:22E2  8b56dc            mov      dx, word ptr [bp - 0x24]
1:22E5  3956d2            cmp      word ptr [bp - 0x2e], dx
1:22E8  7d03              jge      0x22ed
1:22EA  e933fd            jmp      0x2020
1:22ED  7f08              jg       0x22f7
1:22EF  3946d0            cmp      word ptr [bp - 0x30], ax
1:22F2  7703              ja       0x22f7
1:22F4  e929fd            jmp      0x2020
1:22F7  ff76b2            push     word ptr [bp - 0x4e]
1:22FA  ff76b0            push     word ptr [bp - 0x50]
1:22FD  52                push     dx
1:22FE  50                push     ax
1:22FF  e92afd            jmp      0x202c
1:2302  b8ea00            mov      ax, 0xea
1:2305  99                cdq      
1:2306  52                push     dx
1:2307  50                push     ax
1:2308  8b46c2            mov      ax, word ptr [bp - 0x3e]
1:230B  99                cdq      
1:230C  05685b            add      ax, 0x5b68
1:230F  83d200            adc      dx, 0
1:2312  52                push     dx
1:2313  50                push     ax
1:2314  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_14(1:3094)
1:2319  8946c8            mov      word ptr [bp - 0x38], ax
1:231C  8956ca            mov      word ptr [bp - 0x36], dx
1:231F  833e280b01        cmp      word ptr [0xb28], 1
1:2324  750c              jne      0x2332
1:2326  807ee600          cmp      byte ptr [bp - 0x1a], 0
1:232A  741f              je       0x234b
1:232C  804ec801          or       byte ptr [bp - 0x38], 1
1:2330  eb2f              jmp      0x2361
1:2332  807ed800          cmp      byte ptr [bp - 0x28], 0
1:2336  740f              je       0x2347
1:2338  c646d800          mov      byte ptr [bp - 0x28], 0
1:233C  0c01              or       al, 1
1:233E  8946c4            mov      word ptr [bp - 0x3c], ax
1:2341  8956c6            mov      word ptr [bp - 0x3a], dx
1:2344  e98af9            jmp      0x1cd1
1:2347  c646d801          mov      byte ptr [bp - 0x28], 1
1:234B  8346c802          add      word ptr [bp - 0x38], 2
1:234F  8356ca00          adc      word ptr [bp - 0x36], 0
1:2353  8b46c8            mov      ax, word ptr [bp - 0x38]
1:2356  25fe00            and      ax, 0xfe
1:2359  8946c8            mov      word ptr [bp - 0x38], ax
1:235C  c746ca0000        mov      word ptr [bp - 0x36], 0
1:2361  817ec8ea00        cmp      word ptr [bp - 0x38], 0xea
1:2366  7510              jne      0x2378
1:2368  837eca00          cmp      word ptr [bp - 0x36], 0
1:236C  750a              jne      0x2378
1:236E  c746c80200        mov      word ptr [bp - 0x38], 2
1:2373  c746ca0000        mov      word ptr [bp - 0x36], 0
1:2378  817ec4ea00        cmp      word ptr [bp - 0x3c], 0xea
1:237D  7510              jne      0x238f
1:237F  837ec600          cmp      word ptr [bp - 0x3a], 0
1:2383  750a              jne      0x238f
1:2385  c746c40200        mov      word ptr [bp - 0x3c], 2
1:238A  c746c60000        mov      word ptr [bp - 0x3a], 0
1:238F  836ec801          sub      word ptr [bp - 0x38], 1
1:2393  835eca00          sbb      word ptr [bp - 0x36], 0
1:2397  836ec401          sub      word ptr [bp - 0x3c], 1
1:239B  835ec600          sbb      word ptr [bp - 0x3a], 0
1:239F  ff36f609          push     word ptr [0x9f6]
1:23A3  ff36b60b          push     word ptr [0xbb6]
1:23A7  2bc0              sub      ax, ax
1:23A9  50                push     ax
1:23AA  9afe230000        lcall    0, 0x23fe  ; @1:USER.SelectPalette
1:23AF  8946f2            mov      word ptr [bp - 0xe], ax
1:23B2  ff36f609          push     word ptr [0x9f6]
1:23B6  9a72090000        lcall    0, 0x972  ; @1:USER.RealizePalette
1:23BB  a1280b            mov      ax, word ptr [0xb28]
1:23BE  3d1000            cmp      ax, 0x10
1:23C1  7503              jne      0x23c6
1:23C3  e9a000            jmp      0x2466
1:23C6  772b              ja       0x23f3
1:23C8  fec8              dec      al
1:23CA  740e              je       0x23da
1:23CC  fec8              dec      al
1:23CE  744e              je       0x241e
1:23D0  2c02              sub      al, 2
1:23D2  7462              je       0x2436
1:23D4  2c04              sub      al, 4
1:23D6  7476              je       0x244e
1:23D8  eb19              jmp      0x23f3
1:23DA  ff76c6            push     word ptr [bp - 0x3a]
1:23DD  ff76c4            push     word ptr [bp - 0x3c]
1:23E0  ff76ca            push     word ptr [bp - 0x36]
1:23E3  ff76c8            push     word ptr [bp - 0x38]
1:23E6  ff76fa            push     word ptr [bp - 6]
1:23E9  ff76f8            push     word ptr [bp - 8]
1:23EC  0e                push     cs
1:23ED  e811ec            call     0x1001
1:23F0  83c40c            add      sp, 0xc
1:23F3  ff36f609          push     word ptr [0x9f6]
1:23F7  ff76f2            push     word ptr [bp - 0xe]
1:23FA  2bc0              sub      ax, ax
1:23FC  50                push     ax
1:23FD  9a66090000        lcall    0, 0x966  ; @1:USER.SelectPalette
1:2402  a1ea09            mov      ax, word ptr [0x9ea]
1:2405  0bc0              or       ax, ax
1:2407  7476              je       0x247f
1:2409  48                dec      ax
1:240A  7503              jne      0x240f
1:240C  e9d500            jmp      0x24e4
1:240F  48                dec      ax
1:2410  7503              jne      0x2415
1:2412  e91f01            jmp      0x2534
1:2415  48                dec      ax
1:2416  7503              jne      0x241b
1:2418  e96901            jmp      0x2584
1:241B  e9ae00            jmp      0x24cc
1:241E  ff76c6            push     word ptr [bp - 0x3a]
1:2421  ff76c4            push     word ptr [bp - 0x3c]
1:2424  ff76ca            push     word ptr [bp - 0x36]
1:2427  ff76c8            push     word ptr [bp - 0x38]
1:242A  ff76fa            push     word ptr [bp - 6]
1:242D  ff76f8            push     word ptr [bp - 8]
1:2430  0e                push     cs
1:2431  e8f5eb            call     0x1029
1:2434  ebba              jmp      0x23f0
1:2436  ff76c6            push     word ptr [bp - 0x3a]
1:2439  ff76c4            push     word ptr [bp - 0x3c]
1:243C  ff76ca            push     word ptr [bp - 0x36]
1:243F  ff76c8            push     word ptr [bp - 0x38]
1:2442  ff76fa            push     word ptr [bp - 6]
1:2445  ff76f8            push     word ptr [bp - 8]
1:2448  0e                push     cs
1:2449  e866ec            call     0x10b2
1:244C  eba2              jmp      0x23f0
1:244E  ff76c6            push     word ptr [bp - 0x3a]
1:2451  ff76c4            push     word ptr [bp - 0x3c]
1:2454  ff76ca            push     word ptr [bp - 0x36]
1:2457  ff76c8            push     word ptr [bp - 0x38]
1:245A  ff76fa            push     word ptr [bp - 6]
1:245D  ff76f8            push     word ptr [bp - 8]
1:2460  0e                push     cs
1:2461  e800ee            call     0x1264
1:2464  eb8a              jmp      0x23f0
1:2466  ff76c6            push     word ptr [bp - 0x3a]
1:2469  ff76c4            push     word ptr [bp - 0x3c]
1:246C  ff76ca            push     word ptr [bp - 0x36]
1:246F  ff76c8            push     word ptr [bp - 0x38]
1:2472  ff76fa            push     word ptr [bp - 6]
1:2475  ff76f8            push     word ptr [bp - 8]
1:2478  0e                push     cs
1:2479  e878f4            call     0x18f4
1:247C  e971ff            jmp      0x23f0
1:247F  a1ba09            mov      ax, word ptr [0x9ba]
1:2482  8b0e280b          mov      cx, word ptr [0xb28]
1:2486  014ee0            add      word ptr [bp - 0x20], cx
1:2489  3946e0            cmp      word ptr [bp - 0x20], ax
1:248C  7c3e              jl       0x24cc
1:248E  c706ea090100      mov      word ptr [0x9ea], 1
1:2494  8b166009          mov      dx, word ptr [0x960]
1:2498  3956e0            cmp      word ptr [bp - 0x20], dx
1:249B  7c28              jl       0x24c5
1:249D  f7d9              neg      cx
1:249F  3b0eb609          cmp      cx, word ptr [0x9b6]
1:24A3  7c20              jl       0x24c5
1:24A5  0316280b          add      dx, word ptr [0xb28]
1:24A9  3bd0              cmp      dx, ax
1:24AB  7f18              jg       0x24c5
1:24AD  3b0eb809          cmp      cx, word ptr [0x9b8]
1:24B1  7c12              jl       0x24c5
1:24B3  a1b409            mov      ax, word ptr [0x9b4]
1:24B6  0306280b          add      ax, word ptr [0xb28]
1:24BA  3b06bc09          cmp      ax, word ptr [0x9bc]
1:24BE  7f05              jg       0x24c5
1:24C0  c746e0ffff        mov      word ptr [bp - 0x20], 0xffff
1:24C5  a1280b            mov      ax, word ptr [0xb28]
1:24C8  0106ba09          add      word ptr [0x9ba], ax
1:24CC  833e280b01        cmp      word ptr [0xb28], 1
1:24D1  7403              je       0x24d6
1:24D3  e90201            jmp      0x25d8
1:24D6  807ee601          cmp      byte ptr [bp - 0x1a], 1
1:24DA  1ac0              sbb      al, al
1:24DC  f6d8              neg      al
1:24DE  8846e6            mov      byte ptr [bp - 0x1a], al
1:24E1  e9f800            jmp      0x25dc
1:24E4  a1bc09            mov      ax, word ptr [0x9bc]
1:24E7  8b0e280b          mov      cx, word ptr [0xb28]
1:24EB  014ed6            add      word ptr [bp - 0x2a], cx
1:24EE  3946d6            cmp      word ptr [bp - 0x2a], ax
1:24F1  7cd9              jl       0x24cc
1:24F3  c706ea090200      mov      word ptr [0x9ea], 2
1:24F9  8b16b409          mov      dx, word ptr [0x9b4]
1:24FD  3956d6            cmp      word ptr [bp - 0x2a], dx
1:2500  7c29              jl       0x252b
1:2502  f7d9              neg      cx
1:2504  3b0eb609          cmp      cx, word ptr [0x9b6]
1:2508  7c21              jl       0x252b
1:250A  8b1e6009          mov      bx, word ptr [0x960]
1:250E  031e280b          add      bx, word ptr [0xb28]
1:2512  3b1eba09          cmp      bx, word ptr [0x9ba]
1:2516  7f13              jg       0x252b
1:2518  3b0eb809          cmp      cx, word ptr [0x9b8]
1:251C  7c0d              jl       0x252b
1:251E  0316280b          add      dx, word ptr [0xb28]
1:2522  3bd0              cmp      dx, ax
1:2524  7f05              jg       0x252b
1:2526  c746e0ffff        mov      word ptr [bp - 0x20], 0xffff
1:252B  a1280b            mov      ax, word ptr [0xb28]
1:252E  0106bc09          add      word ptr [0x9bc], ax
1:2532  eb98              jmp      0x24cc
1:2534  a1b609            mov      ax, word ptr [0x9b6]
1:2537  8b0e280b          mov      cx, word ptr [0xb28]
1:253B  294ee0            sub      word ptr [bp - 0x20], cx
1:253E  3946e0            cmp      word ptr [bp - 0x20], ax
1:2541  7f89              jg       0x24cc
1:2543  c706ea090300      mov      word ptr [0x9ea], 3
1:2549  837ee000          cmp      word ptr [bp - 0x20], 0
1:254D  7d2b              jge      0x257a
1:254F  f7d9              neg      cx
1:2551  3bc8              cmp      cx, ax
1:2553  7c25              jl       0x257a
1:2555  a16009            mov      ax, word ptr [0x960]
1:2558  0306280b          add      ax, word ptr [0xb28]
1:255C  3b06ba09          cmp      ax, word ptr [0x9ba]
1:2560  7f18              jg       0x257a
1:2562  3b0eb809          cmp      cx, word ptr [0x9b8]
1:2566  7c12              jl       0x257a
1:2568  a1b409            mov      ax, word ptr [0x9b4]
1:256B  0306280b          add      ax, word ptr [0xb28]
1:256F  3b06bc09          cmp      ax, word ptr [0x9bc]
1:2573  7f05              jg       0x257a
1:2575  c746e0ffff        mov      word ptr [bp - 0x20], 0xffff
1:257A  a1280b            mov      ax, word ptr [0xb28]
1:257D  2906b609          sub      word ptr [0x9b6], ax
1:2581  e948ff            jmp      0x24cc
1:2584  a1b809            mov      ax, word ptr [0x9b8]
1:2587  8b0e280b          mov      cx, word ptr [0xb28]
1:258B  294ed6            sub      word ptr [bp - 0x2a], cx
1:258E  3946d6            cmp      word ptr [bp - 0x2a], ax
1:2591  7e03              jle      0x2596
1:2593  e936ff            jmp      0x24cc
1:2596  c706ea090000      mov      word ptr [0x9ea], 0
1:259C  837ed600          cmp      word ptr [bp - 0x2a], 0
1:25A0  7d2c              jge      0x25ce
1:25A2  f7d9              neg      cx
1:25A4  3b0eb609          cmp      cx, word ptr [0x9b6]
1:25A8  7c24              jl       0x25ce
1:25AA  8b166009          mov      dx, word ptr [0x960]
1:25AE  0316280b          add      dx, word ptr [0xb28]
1:25B2  3b16ba09          cmp      dx, word ptr [0x9ba]
1:25B6  7f16              jg       0x25ce
1:25B8  3bc8              cmp      cx, ax
1:25BA  7c12              jl       0x25ce
1:25BC  a1b409            mov      ax, word ptr [0x9b4]
1:25BF  0306280b          add      ax, word ptr [0xb28]
1:25C3  3b06bc09          cmp      ax, word ptr [0x9bc]
1:25C7  7f05              jg       0x25ce
1:25C9  c746e0ffff        mov      word ptr [bp - 0x20], 0xffff
1:25CE  a1280b            mov      ax, word ptr [0xb28]
1:25D1  2906b809          sub      word ptr [0x9b8], ax
1:25D5  e9f4fe            jmp      0x24cc
1:25D8  c646d801          mov      byte ptr [bp - 0x28], 1
1:25DC  b81400            mov      ax, 0x14
1:25DF  50                push     ax
1:25E0  9a02260000        lcall    0, 0x2602  ; @1:USER.#249
1:25E5  250100            and      ax, 1
1:25E8  3b069e0a          cmp      ax, word ptr [0xa9e]
1:25EC  741e              je       0x260c
1:25EE  c41e060a          les      bx, ptr [0xa06]
1:25F2  26837f0a04        cmp      word ptr es:[bx + 0xa], 4
1:25F7  7e13              jle      0x260c
1:25F9  0e                push     cs
1:25FA  e8cee1            call     0x7cb
1:25FD  b81400            mov      ax, 0x14
1:2600  50                push     ax
1:2601  9a04280000        lcall    0, 0x2804  ; @1:USER.#249
1:2606  250100            and      ax, 1
1:2609  a39e0a            mov      word ptr [0xa9e], ax
1:260C  837ee0ff          cmp      word ptr [bp - 0x20], -1
1:2610  7403              je       0x2615
1:2612  e9e900            jmp      0x26fe
1:2615  a1e20b            mov      ax, word ptr [0xbe2]
1:2618  3906280b          cmp      word ptr [0xb28], ax
1:261C  7e5a              jle      0x2678
1:261E  0e                push     cs
1:261F  e874da            call     0x96
1:2622  c606d00a01        mov      byte ptr [0xad0], 1
1:2627  d13e280b          sar      word ptr [0xb28], 1
1:262B  a1280b            mov      ax, word ptr [0xb28]
1:262E  48                dec      ax
1:262F  f7d0              not      ax
1:2631  8b0e6009          mov      cx, word ptr [0x960]
1:2635  d1f9              sar      cx, 1
1:2637  8bd0              mov      dx, ax
1:2639  23c1              and      ax, cx
1:263B  8946e0            mov      word ptr [bp - 0x20], ax
1:263E  8b0eb409          mov      cx, word ptr [0x9b4]
1:2642  d1f9              sar      cx, 1
1:2644  23d1              and      dx, cx
1:2646  8956d6            mov      word ptr [bp - 0x2a], dx
1:2649  c706ea090200      mov      word ptr [0x9ea], 2
1:264F  8bc8              mov      cx, ax
1:2651  2b06280b          sub      ax, word ptr [0xb28]
1:2655  a3b609            mov      word ptr [0x9b6], ax
1:2658  8bc2              mov      ax, dx
1:265A  2b16280b          sub      dx, word ptr [0xb28]
1:265E  8916b809          mov      word ptr [0x9b8], dx
1:2662  030e280b          add      cx, word ptr [0xb28]
1:2666  890eba09          mov      word ptr [0x9ba], cx
1:266A  0306280b          add      ax, word ptr [0xb28]
1:266E  a3bc09            mov      word ptr [0x9bc], ax
1:2671  0e                push     cs
1:2672  e8f6db            call     0x26b
1:2675  e93ff6            jmp      0x1cb7
1:2678  c41e060a          les      bx, ptr [0xa06]
1:267C  26837f0a08        cmp      word ptr es:[bx + 0xa], 8
1:2681  7560              jne      0x26e3
1:2683  3d1000            cmp      ax, 0x10
1:2686  7417              je       0x269f
1:2688  770e              ja       0x2698
1:268A  fec8              dec      al
1:268C  7449              je       0x26d7
1:268E  fec8              dec      al
1:2690  7439              je       0x26cb
1:2692  2c02              sub      al, 2
1:2694  742e              je       0x26c4
1:2696  2c04              sub      al, 4
1:2698  c746cc3075        mov      word ptr [bp - 0x34], 0x7530
1:269D  eb05              jmp      0x26a4
1:269F  c746cc8813        mov      word ptr [bp - 0x34], 0x1388
1:26A4  c746ce0000        mov      word ptr [bp - 0x32], 0
1:26A9  c706720a0100      mov      word ptr [0xa72], 1
1:26AF  9aff260000        lcall    0, 0x26ff  ; @1:USER.GetCurrentTime
1:26B4  0346cc            add      ax, word ptr [bp - 0x34]
1:26B7  1356ce            adc      dx, word ptr [bp - 0x32]
1:26BA  a3ee09            mov      word ptr [0x9ee], ax
1:26BD  8916f009          mov      word ptr [0x9f0], dx
1:26C1  e98500            jmp      0x2749
1:26C4  c746cc60ea        mov      word ptr [bp - 0x34], 0xea60
1:26C9  ebd9              jmp      0x26a4
1:26CB  c746ccc0d4        mov      word ptr [bp - 0x34], 0xd4c0
1:26D0  c746ce0100        mov      word ptr [bp - 0x32], 1
1:26D5  ebd2              jmp      0x26a9
1:26D7  c746cce093        mov      word ptr [bp - 0x34], 0x93e0
1:26DC  c746ce0400        mov      word ptr [bp - 0x32], 4
1:26E1  ebc6              jmp      0x26a9
1:26E3  0e                push     cs
1:26E4  e8e4e0            call     0x7cb
1:26E7  2ac0              sub      al, al
1:26E9  50                push     ax
1:26EA  0e                push     cs
1:26EB  e864e3            call     0xa52
1:26EE  5b                pop      bx
1:26EF  a10c0a            mov      ax, word ptr [0xa0c]
1:26F2  8946e0            mov      word ptr [bp - 0x20], ax
1:26F5  a1140a            mov      ax, word ptr [0xa14]
1:26F8  8946d6            mov      word ptr [bp - 0x2a], ax
1:26FB  e973ff            jmp      0x2671
1:26FE  9a10270000        lcall    0, 0x2710  ; @1:USER.GetCurrentTime
1:2703  3b061000          cmp      ax, word ptr [0x10]
1:2707  7506              jne      0x270f
1:2709  3b161200          cmp      dx, word ptr [0x12]
1:270D  7409              je       0x2718
1:270F  9a1c270000        lcall    0, 0x271c  ; @1:USER.GetCurrentTime
1:2714  a801              test     al, 1
1:2716  7403              je       0x271b
1:2718  e9b6f5            jmp      0x1cd1
1:271B  9ad1270000        lcall    0, 0x27d1  ; @1:USER.GetCurrentTime
1:2720  a31000            mov      word ptr [0x10], ax
1:2723  89161200          mov      word ptr [0x12], dx
1:2727  803e3e0a00        cmp      byte ptr [0xa3e], 0
1:272C  750f              jne      0x273d
1:272E  c41e060a          les      bx, ptr [0xa06]
1:2732  26837f0a08        cmp      word ptr es:[bx + 0xa], 8
1:2737  7c04              jl       0x273d
1:2739  0e                push     cs
1:273A  e82fda            call     0x16c
1:273D  8b46e0            mov      ax, word ptr [bp - 0x20]
1:2740  a30c0a            mov      word ptr [0xa0c], ax
1:2743  8b46d6            mov      ax, word ptr [bp - 0x2a]
1:2746  a3140a            mov      word ptr [0xa14], ax
1:2749  5e                pop      si
1:274A  5f                pop      di
1:274B  4d                dec      bp
1:274C  4d                dec      bp
1:274D  8be5              mov      sp, bp
1:274F  1f                pop      ds
1:2750  5d                pop      bp
1:2751  4d                dec      bp
1:2752  cb                retf     

; ===== EXPORT:ord_25(#25) =====
1:2753  1e                push     ds
1:2754  58                pop      ax
1:2755  90                nop      
1:2756  45                inc      bp
1:2757  55                push     bp
1:2758  8bec              mov      bp, sp
1:275A  1e                push     ds
1:275B  8ed8              mov      ds, ax
1:275D  83ec06            sub      sp, 6
1:2760  c41ee40b          les      bx, ptr [0xbe4]
1:2764  268b470a          mov      ax, word ptr es:[bx + 0xa]
1:2768  3d1400            cmp      ax, 0x14
1:276B  7d08              jge      0x2775
1:276D  c706e20b0100      mov      word ptr [0xbe2], 1
1:2773  eb2d              jmp      0x27a2
1:2775  3d2800            cmp      ax, 0x28
1:2778  7d08              jge      0x2782
1:277A  c706e20b0200      mov      word ptr [0xbe2], 2
1:2780  eb20              jmp      0x27a2
1:2782  3d3c00            cmp      ax, 0x3c
1:2785  7d08              jge      0x278f
1:2787  c706e20b0400      mov      word ptr [0xbe2], 4
1:278D  eb13              jmp      0x27a2
1:278F  3d5000            cmp      ax, 0x50
1:2792  7d08              jge      0x279c
1:2794  c706e20b0800      mov      word ptr [0xbe2], 8
1:279A  eb06              jmp      0x27a2
1:279C  c706e20b1000      mov      word ptr [0xbe2], 0x10
1:27A2  c41e060a          les      bx, ptr [0xa06]
1:27A6  26837f0a04        cmp      word ptr es:[bx + 0xa], 4
1:27AB  7f06              jg       0x27b3
1:27AD  c706e20b0800      mov      word ptr [0xbe2], 8
1:27B3  c746fa0000        mov      word ptr [bp - 6], 0
1:27B8  26837f0a08        cmp      word ptr es:[bx + 0xa], 8
1:27BD  7d06              jge      0x27c5
1:27BF  c706720a0000      mov      word ptr [0xa72], 0
1:27C5  833e720a00        cmp      word ptr [0xa72], 0
1:27CA  745d              je       0x2829
1:27CC  0e                push     cs
1:27CD  e89bda            call     0x26b
1:27D0  9a4e280000        lcall    0, 0x284e  ; @1:USER.GetCurrentTime
1:27D5  3b16f009          cmp      dx, word ptr [0x9f0]
1:27D9  7224              jb       0x27ff
1:27DB  7706              ja       0x27e3
1:27DD  3b06ee09          cmp      ax, word ptr [0x9ee]
1:27E1  761c              jbe      0x27ff
1:27E3  c706720a0000      mov      word ptr [0xa72], 0
1:27E9  c706280b1000      mov      word ptr [0xb28], 0x10
1:27EF  0e                push     cs
1:27F0  e8d8df            call     0x7cb
1:27F3  2ac0              sub      al, al
1:27F5  50                push     ax
1:27F6  0e                push     cs
1:27F7  e858e2            call     0xa52
1:27FA  5b                pop      bx
1:27FB  0e                push     cs
1:27FC  e86cda            call     0x26b
1:27FF  b81400            mov      ax, 0x14
1:2802  50                push     ax
1:2803  9a1d280000        lcall    0, 0x281d  ; @1:USER.#249
1:2808  250100            and      ax, 1
1:280B  3b069e0a          cmp      ax, word ptr [0xa9e]
1:280F  7503              jne      0x2814
1:2811  e98400            jmp      0x2898
1:2814  0e                push     cs
1:2815  e8b3df            call     0x7cb
1:2818  b81400            mov      ax, 0x14
1:281B  50                push     ax
1:281C  9a700a0000        lcall    0, 0xa70  ; @1:USER.#249
1:2821  250100            and      ax, 1
1:2824  a39e0a            mov      word ptr [0xa9e], ax
1:2827  eb6f              jmp      0x2898
1:2829  833e020a20        cmp      word ptr [0xa02], 0x20
1:282E  751d              jne      0x284d
1:2830  0e                push     cs
1:2831  e859f4            call     0x1c8d
1:2834  833e720a00        cmp      word ptr [0xa72], 0
1:2839  7405              je       0x2840
1:283B  c746fa0a00        mov      word ptr [bp - 6], 0xa
1:2840  2bc0              sub      ax, ax
1:2842  a36203            mov      word ptr [0x362], ax
1:2845  a36003            mov      word ptr [0x360], ax
1:2848  ff46fa            inc      word ptr [bp - 6]
1:284B  eb3e              jmp      0x288b
1:284D  9a71280000        lcall    0, 0x2871  ; @1:USER.GetCurrentTime
1:2852  8b0e6003          mov      cx, word ptr [0x360]
1:2856  8b1e6203          mov      bx, word ptr [0x362]
1:285A  83c103            add      cx, 3
1:285D  83d300            adc      bx, 0
1:2860  3bd3              cmp      dx, bx
1:2862  770c              ja       0x2870
1:2864  7204              jb       0x286a
1:2866  3bc1              cmp      ax, cx
1:2868  7306              jae      0x2870
1:286A  0e                push     cs
1:286B  e8fdd9            call     0x26b
1:286E  eb1b              jmp      0x288b
1:2870  9a4c1a0000        lcall    0, 0x1a4c  ; @1:USER.GetCurrentTime
1:2875  a36003            mov      word ptr [0x360], ax
1:2878  89166203          mov      word ptr [0x362], dx
1:287C  ff06020a          inc      word ptr [0xa02]
1:2880  833e020a10        cmp      word ptr [0xa02], 0x10
1:2885  7504              jne      0x288b
1:2887  0e                push     cs
1:2888  e840df            call     0x7cb
1:288B  837efa0a          cmp      word ptr [bp - 6], 0xa
1:288F  7d07              jge      0x2898
1:2891  833e020a20        cmp      word ptr [0xa02], 0x20
1:2896  7491              je       0x2829
1:2898  2bc0              sub      ax, ax
1:289A  4d                dec      bp
1:289B  4d                dec      bp
1:289C  8be5              mov      sp, bp
1:289E  1f                pop      ds
1:289F  5d                pop      bp
1:28A0  4d                dec      bp
1:28A1  cb                retf     

; ===== EXPORT:ord_20(#20) =====
1:28A2  1e                push     ds
1:28A3  58                pop      ax
1:28A4  90                nop      
1:28A5  45                inc      bp
1:28A6  55                push     bp
1:28A7  8bec              mov      bp, sp
1:28A9  1e                push     ds
1:28AA  8ed8              mov      ds, ax
1:28AC  8b4606            mov      ax, word ptr [bp + 6]
1:28AF  eb3f              jmp      0x28f0
1:28B1  c41e060a          les      bx, ptr [0xa06]
1:28B5  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:28BA  7541              jne      0x28fd
1:28BC  c706720a0000      mov      word ptr [0xa72], 0
1:28C2  0e                push     cs
1:28C3  e869f3            call     0x1c2f
1:28C6  b80300            mov      ax, 3
1:28C9  eb34              jmp      0x28ff
1:28CB  c41e060a          les      bx, ptr [0xa06]
1:28CF  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:28D4  7527              jne      0x28fd
1:28D6  a1740a            mov      ax, word ptr [0xa74]
1:28D9  c41ee40b          les      bx, ptr [0xbe4]
1:28DD  26394708          cmp      word ptr es:[bx + 8], ax
1:28E1  741a              je       0x28fd
1:28E3  268b4708          mov      ax, word ptr es:[bx + 8]
1:28E7  a3740a            mov      word ptr [0xa74], ax
1:28EA  0e                push     cs
1:28EB  e8ddde            call     0x7cb
1:28EE  eb0d              jmp      0x28fd
1:28F0  0bc0              or       ax, ax
1:28F2  74bd              je       0x28b1
1:28F4  48                dec      ax
1:28F5  74d4              je       0x28cb
1:28F7  48                dec      ax
1:28F8  7403              je       0x28fd
1:28FA  48                dec      ax
1:28FB  74b4              je       0x28b1
1:28FD  2bc0              sub      ax, ax
1:28FF  4d                dec      bp
1:2900  4d                dec      bp
1:2901  8be5              mov      sp, bp
1:2903  1f                pop      ds
1:2904  5d                pop      bp
1:2905  4d                dec      bp
1:2906  cb                retf     

; ===== EXPORT:ord_22(#22) =====
1:2907  1e                push     ds
1:2908  58                pop      ax
1:2909  90                nop      
1:290A  45                inc      bp
1:290B  55                push     bp
1:290C  8bec              mov      bp, sp
1:290E  1e                push     ds
1:290F  8ed8              mov      ds, ax
1:2911  c41e060a          les      bx, ptr [0xa06]
1:2915  26837f0a04        cmp      word ptr es:[bx + 0xa], 4
1:291A  7f0a              jg       0x2926
1:291C  c41ee40b          les      bx, ptr [0xbe4]
1:2920  26c747120000      mov      word ptr es:[bx + 0x12], 0
1:2926  2bc0              sub      ax, ax
1:2928  4d                dec      bp
1:2929  4d                dec      bp
1:292A  8be5              mov      sp, bp
1:292C  1f                pop      ds
1:292D  5d                pop      bp
1:292E  4d                dec      bp
1:292F  cb                retf     

; ===== EXPORT:ord_10(#10) =====
1:2930  1e                push     ds
1:2931  58                pop      ax
1:2932  90                nop      
1:2933  45                inc      bp
1:2934  55                push     bp
1:2935  8bec              mov      bp, sp
1:2937  1e                push     ds
1:2938  8ed8              mov      ds, ax
1:293A  83ec08            sub      sp, 8
1:293D  c746f81f00        mov      word ptr [bp - 8], 0x1f
1:2942  c746fa0000        mov      word ptr [bp - 6], 0
1:2947  837e0800          cmp      word ptr [bp + 8], 0
1:294B  7d05              jge      0x2952
1:294D  b80100            mov      ax, 1
1:2950  eb02              jmp      0x2954
1:2952  2bc0              sub      ax, ax
1:2954  8946fc            mov      word ptr [bp - 4], ax
1:2957  8b4606            mov      ax, word ptr [bp + 6]
1:295A  8b5608            mov      dx, word ptr [bp + 8]
1:295D  014606            add      word ptr [bp + 6], ax
1:2960  115608            adc      word ptr [bp + 8], dx
1:2963  837efc00          cmp      word ptr [bp - 4], 0
1:2967  7512              jne      0x297b
1:2969  8b46f8            mov      ax, word ptr [bp - 8]
1:296C  8b56fa            mov      dx, word ptr [bp - 6]
1:296F  836ef801          sub      word ptr [bp - 8], 1
1:2973  835efa00          sbb      word ptr [bp - 6], 0
1:2977  0bd0              or       dx, ax
1:2979  75cc              jne      0x2947
1:297B  b010              mov      al, 0x10
1:297D  50                push     ax
1:297E  8d46f8            lea      ax, [bp - 8]
1:2981  16                push     ss
1:2982  50                push     ax
1:2983  9a232b0000        lcall    0, 0x2b23  ; @1:INT:ord_16(1:2F88)
1:2988  b01a              mov      al, 0x1a
1:298A  50                push     ax
1:298B  8d4606            lea      ax, [bp + 6]
1:298E  16                push     ss
1:298F  50                push     ax
1:2990  9a032a0000        lcall    0, 0x2a03  ; @1:INT:ord_18(1:2FA8)
1:2995  8b5e06            mov      bx, word ptr [bp + 6]
1:2998  83e33f            and      bx, 0x3f
1:299B  d1e3              shl      bx, 1
1:299D  8b875405          mov      ax, word ptr [bx + 0x554]
1:29A1  2bd2              sub      dx, dx
1:29A3  0346f8            add      ax, word ptr [bp - 8]
1:29A6  1356fa            adc      dx, word ptr [bp - 6]
1:29A9  83ed02            sub      bp, 2
1:29AC  8be5              mov      sp, bp
1:29AE  1f                pop      ds
1:29AF  5d                pop      bp
1:29B0  4d                dec      bp
1:29B1  cb                retf     

; ===== EXPORT:ord_11(#11) =====
1:29B2  1e                push     ds
1:29B3  58                pop      ax
1:29B4  90                nop      
1:29B5  45                inc      bp
1:29B6  55                push     bp
1:29B7  8bec              mov      bp, sp
1:29B9  1e                push     ds
1:29BA  8ed8              mov      ds, ax
1:29BC  83ec0e            sub      sp, 0xe
1:29BF  2bc0              sub      ax, ax
1:29C1  baea00            mov      dx, 0xea
1:29C4  52                push     dx
1:29C5  50                push     ax
1:29C6  8d4606            lea      ax, [bp + 6]
1:29C9  16                push     ss
1:29CA  50                push     ax
1:29CB  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_19(1:2F66)
1:29D0  837e0875          cmp      word ptr [bp + 8], 0x75
1:29D4  7c0d              jl       0x29e3
1:29D6  7f06              jg       0x29de
1:29D8  837e0600          cmp      word ptr [bp + 6], 0
1:29DC  7405              je       0x29e3
1:29DE  b80100            mov      ax, 1
1:29E1  eb02              jmp      0x29e5
1:29E3  2bc0              sub      ax, ax
1:29E5  8946fc            mov      word ptr [bp - 4], ax
1:29E8  0bc0              or       ax, ax
1:29EA  7408              je       0x29f4
1:29EC  836e0600          sub      word ptr [bp + 6], 0
1:29F0  835e0875          sbb      word ptr [bp + 8], 0x75
1:29F4  8b4606            mov      ax, word ptr [bp + 6]
1:29F7  8946fa            mov      word ptr [bp - 6], ax
1:29FA  b310              mov      bl, 0x10
1:29FC  53                push     bx
1:29FD  8d4606            lea      ax, [bp + 6]
1:2A00  16                push     ss
1:2A01  50                push     ax
1:2A02  9a952a0000        lcall    0, 0x2a95  ; @1:INT:ord_18(1:2FA8)
1:2A07  8bd8              mov      bx, ax
1:2A09  d1e3              shl      bx, 1
1:2A0B  8b876403          mov      ax, word ptr [bx + 0x364]
1:2A0F  8946f6            mov      word ptr [bp - 0xa], ax
1:2A12  c746f80000        mov      word ptr [bp - 8], 0
1:2A17  83460601          add      word ptr [bp + 6], 1
1:2A1B  83560800          adc      word ptr [bp + 8], 0
1:2A1F  8b5e06            mov      bx, word ptr [bp + 6]
1:2A22  d1e3              shl      bx, 1
1:2A24  8b876403          mov      ax, word ptr [bx + 0x364]
1:2A28  8946f2            mov      word ptr [bp - 0xe], ax
1:2A2B  c746f40000        mov      word ptr [bp - 0xc], 0
1:2A30  2bc0              sub      ax, ax
1:2A32  50                push     ax
1:2A33  ff76fa            push     word ptr [bp - 6]
1:2A36  8b46f2            mov      ax, word ptr [bp - 0xe]
1:2A39  8b56f4            mov      dx, word ptr [bp - 0xc]
1:2A3C  2b46f6            sub      ax, word ptr [bp - 0xa]
1:2A3F  1b56f8            sbb      dx, word ptr [bp - 8]
1:2A42  52                push     dx
1:2A43  50                push     ax
1:2A44  9adc2a0000        lcall    0, 0x2adc  ; @1:INT:ord_5(1:3062)
1:2A49  8bc2              mov      ax, dx
1:2A4B  99                cdq      
1:2A4C  0146f6            add      word ptr [bp - 0xa], ax
1:2A4F  1156f8            adc      word ptr [bp - 8], dx
1:2A52  837efc00          cmp      word ptr [bp - 4], 0
1:2A56  740f              je       0x2a67
1:2A58  8b46f6            mov      ax, word ptr [bp - 0xa]
1:2A5B  8b56f8            mov      dx, word ptr [bp - 8]
1:2A5E  f7d8              neg      ax
1:2A60  83d200            adc      dx, 0
1:2A63  f7da              neg      dx
1:2A65  eb06              jmp      0x2a6d
1:2A67  8b46f6            mov      ax, word ptr [bp - 0xa]
1:2A6A  8b56f8            mov      dx, word ptr [bp - 8]
1:2A6D  83ed02            sub      bp, 2
1:2A70  8be5              mov      sp, bp
1:2A72  1f                pop      ds
1:2A73  5d                pop      bp
1:2A74  4d                dec      bp
1:2A75  cb                retf     

; ===== EXPORT:ord_13(#13) =====
1:2A76  1e                push     ds
1:2A77  58                pop      ax
1:2A78  90                nop      
1:2A79  45                inc      bp
1:2A7A  55                push     bp
1:2A7B  8bec              mov      bp, sp
1:2A7D  1e                push     ds
1:2A7E  8ed8              mov      ds, ax
1:2A80  83ec0c            sub      sp, 0xc
1:2A83  8b4606            mov      ax, word ptr [bp + 6]
1:2A86  80e403            and      ah, 3
1:2A89  8946f8            mov      word ptr [bp - 8], ax
1:2A8C  b30a              mov      bl, 0xa
1:2A8E  53                push     bx
1:2A8F  8d4606            lea      ax, [bp + 6]
1:2A92  16                push     ss
1:2A93  50                push     ax
1:2A94  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_18(1:2FA8)
1:2A99  8bd8              mov      bx, ax
1:2A9B  d1e3              shl      bx, 1
1:2A9D  d1e3              shl      bx, 1
1:2A9F  8b875004          mov      ax, word ptr [bx + 0x450]
1:2AA3  8b975204          mov      dx, word ptr [bx + 0x452]
1:2AA7  8946fa            mov      word ptr [bp - 6], ax
1:2AAA  8956fc            mov      word ptr [bp - 4], dx
1:2AAD  83460601          add      word ptr [bp + 6], 1
1:2AB1  83560800          adc      word ptr [bp + 8], 0
1:2AB5  8b5e06            mov      bx, word ptr [bp + 6]
1:2AB8  d1e3              shl      bx, 1
1:2ABA  d1e3              shl      bx, 1
1:2ABC  8b875004          mov      ax, word ptr [bx + 0x450]
1:2AC0  8b975204          mov      dx, word ptr [bx + 0x452]
1:2AC4  8946f4            mov      word ptr [bp - 0xc], ax
1:2AC7  8956f6            mov      word ptr [bp - 0xa], dx
1:2ACA  2bc0              sub      ax, ax
1:2ACC  50                push     ax
1:2ACD  ff76f8            push     word ptr [bp - 8]
1:2AD0  8b46f4            mov      ax, word ptr [bp - 0xc]
1:2AD3  2b46fa            sub      ax, word ptr [bp - 6]
1:2AD6  1b56fc            sbb      dx, word ptr [bp - 4]
1:2AD9  52                push     dx
1:2ADA  50                push     ax
1:2ADB  9ab6210000        lcall    0, 0x21b6  ; @1:INT:ord_5(1:3062)
1:2AE0  b10a              mov      cl, 0xa
1:2AE2  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_17(1:314C)
1:2AE7  0346fa            add      ax, word ptr [bp - 6]
1:2AEA  1356fc            adc      dx, word ptr [bp - 4]
1:2AED  83ed02            sub      bp, 2
1:2AF0  8be5              mov      sp, bp
1:2AF2  1f                pop      ds
1:2AF3  5d                pop      bp
1:2AF4  4d                dec      bp
1:2AF5  cb                retf     

; ===== EXPORT:ord_7(#7) =====
1:2AF6  1e                push     ds
1:2AF7  58                pop      ax
1:2AF8  90                nop      
1:2AF9  45                inc      bp
1:2AFA  55                push     bp
1:2AFB  8bec              mov      bp, sp
1:2AFD  1e                push     ds
1:2AFE  8ed8              mov      ds, ax
1:2B00  83ec0e            sub      sp, 0xe
1:2B03  c746f80100        mov      word ptr [bp - 8], 1
1:2B08  c746fa0000        mov      word ptr [bp - 6], 0
1:2B0D  2bc0              sub      ax, ax
1:2B0F  8946f6            mov      word ptr [bp - 0xa], ax
1:2B12  8946f4            mov      word ptr [bp - 0xc], ax
1:2B15  c746f21c00        mov      word ptr [bp - 0xe], 0x1c
1:2B1A  b008              mov      al, 8
1:2B1C  50                push     ax
1:2B1D  8d4606            lea      ax, [bp + 6]
1:2B20  16                push     ss
1:2B21  50                push     ax
1:2B22  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_16(1:2F88)
1:2B27  837e0800          cmp      word ptr [bp + 8], 0
1:2B2B  7d05              jge      0x2b32
1:2B2D  b80100            mov      ax, 1
1:2B30  eb02              jmp      0x2b34
1:2B32  2bc0              sub      ax, ax
1:2B34  99                cdq      
1:2B35  0346f4            add      ax, word ptr [bp - 0xc]
1:2B38  1356f6            adc      dx, word ptr [bp - 0xa]
1:2B3B  0146f4            add      word ptr [bp - 0xc], ax
1:2B3E  1156f6            adc      word ptr [bp - 0xa], dx
1:2B41  8b4606            mov      ax, word ptr [bp + 6]
1:2B44  8b5608            mov      dx, word ptr [bp + 8]
1:2B47  014606            add      word ptr [bp + 6], ax
1:2B4A  115608            adc      word ptr [bp + 8], dx
1:2B4D  837e0800          cmp      word ptr [bp + 8], 0
1:2B51  7d05              jge      0x2b58
1:2B53  b80100            mov      ax, 1
1:2B56  eb02              jmp      0x2b5a
1:2B58  2bc0              sub      ax, ax
1:2B5A  99                cdq      
1:2B5B  0346f4            add      ax, word ptr [bp - 0xc]
1:2B5E  1356f6            adc      dx, word ptr [bp - 0xa]
1:2B61  0146f4            add      word ptr [bp - 0xc], ax
1:2B64  1156f6            adc      word ptr [bp - 0xa], dx
1:2B67  8b4606            mov      ax, word ptr [bp + 6]
1:2B6A  8b5608            mov      dx, word ptr [bp + 8]
1:2B6D  014606            add      word ptr [bp + 6], ax
1:2B70  115608            adc      word ptr [bp + 8], dx
1:2B73  8b46f8            mov      ax, word ptr [bp - 8]
1:2B76  8b56fa            mov      dx, word ptr [bp - 6]
1:2B79  2d0100            sub      ax, 1
1:2B7C  83da00            sbb      dx, 0
1:2B7F  0146f8            add      word ptr [bp - 8], ax
1:2B82  1156fa            adc      word ptr [bp - 6], dx
1:2B85  8b46f4            mov      ax, word ptr [bp - 0xc]
1:2B88  8b56f6            mov      dx, word ptr [bp - 0xa]
1:2B8B  3956fa            cmp      word ptr [bp - 6], dx
1:2B8E  7f1b              jg       0x2bab
1:2B90  7c05              jl       0x2b97
1:2B92  3946f8            cmp      word ptr [bp - 8], ax
1:2B95  7714              ja       0x2bab
1:2B97  8b46f8            mov      ax, word ptr [bp - 8]
1:2B9A  8b56fa            mov      dx, word ptr [bp - 6]
1:2B9D  2946f4            sub      word ptr [bp - 0xc], ax
1:2BA0  1956f6            sbb      word ptr [bp - 0xa], dx
1:2BA3  8346f802          add      word ptr [bp - 8], 2
1:2BA7  8356fa00          adc      word ptr [bp - 6], 0
1:2BAB  8b46f2            mov      ax, word ptr [bp - 0xe]
1:2BAE  ff4ef2            dec      word ptr [bp - 0xe]
1:2BB1  0bc0              or       ax, ax
1:2BB3  7403              je       0x2bb8
1:2BB5  e96fff            jmp      0x2b27
1:2BB8  8b46f8            mov      ax, word ptr [bp - 8]
1:2BBB  8b56fa            mov      dx, word ptr [bp - 6]
1:2BBE  050200            add      ax, 2
1:2BC1  83d200            adc      dx, 0
1:2BC4  b102              mov      cl, 2
1:2BC6  9a611f0000        lcall    0, 0x1f61  ; @1:INT:ord_9(1:3140)
1:2BCB  83ed02            sub      bp, 2
1:2BCE  8be5              mov      sp, bp
1:2BD0  1f                pop      ds
1:2BD1  5d                pop      bp
1:2BD2  4d                dec      bp
1:2BD3  cb                retf     

; ===== EXPORT:ord_8(#8) =====
1:2BD4  1e                push     ds
1:2BD5  58                pop      ax
1:2BD6  90                nop      
1:2BD7  45                inc      bp
1:2BD8  55                push     bp
1:2BD9  8bec              mov      bp, sp
1:2BDB  1e                push     ds
1:2BDC  8ed8              mov      ds, ax
1:2BDE  83ec0c            sub      sp, 0xc
1:2BE1  c746f42000        mov      word ptr [bp - 0xc], 0x20
1:2BE6  8b4606            mov      ax, word ptr [bp + 6]
1:2BE9  8b5608            mov      dx, word ptr [bp + 8]
1:2BEC  8946f6            mov      word ptr [bp - 0xa], ax
1:2BEF  8956f8            mov      word ptr [bp - 8], dx
1:2BF2  0bd2              or       dx, dx
1:2BF4  7d0d              jge      0x2c03
1:2BF6  f7d8              neg      ax
1:2BF8  83d200            adc      dx, 0
1:2BFB  f7da              neg      dx
1:2BFD  894606            mov      word ptr [bp + 6], ax
1:2C00  895608            mov      word ptr [bp + 8], dx
1:2C03  8b46fa            mov      ax, word ptr [bp - 6]
1:2C06  8b56fc            mov      dx, word ptr [bp - 4]
1:2C09  0146fa            add      word ptr [bp - 6], ax
1:2C0C  1156fc            adc      word ptr [bp - 4], dx
1:2C0F  8b4606            mov      ax, word ptr [bp + 6]
1:2C12  8b5608            mov      dx, word ptr [bp + 8]
1:2C15  014606            add      word ptr [bp + 6], ax
1:2C18  115608            adc      word ptr [bp + 8], dx
1:2C1B  8b460a            mov      ax, word ptr [bp + 0xa]
1:2C1E  8b560c            mov      dx, word ptr [bp + 0xc]
1:2C21  395608            cmp      word ptr [bp + 8], dx
1:2C24  7c1b              jl       0x2c41
1:2C26  7f05              jg       0x2c2d
1:2C28  394606            cmp      word ptr [bp + 6], ax
1:2C2B  7214              jb       0x2c41
1:2C2D  8b460a            mov      ax, word ptr [bp + 0xa]
1:2C30  8b560c            mov      dx, word ptr [bp + 0xc]
1:2C33  294606            sub      word ptr [bp + 6], ax
1:2C36  195608            sbb      word ptr [bp + 8], dx
1:2C39  8346fa01          add      word ptr [bp - 6], 1
1:2C3D  8356fc00          adc      word ptr [bp - 4], 0
1:2C41  8b46f4            mov      ax, word ptr [bp - 0xc]
1:2C44  ff4ef4            dec      word ptr [bp - 0xc]
1:2C47  0bc0              or       ax, ax
1:2C49  75b8              jne      0x2c03
1:2C4B  8346fa01          add      word ptr [bp - 6], 1
1:2C4F  8356fc00          adc      word ptr [bp - 4], 0
1:2C53  d17efc            sar      word ptr [bp - 4], 1
1:2C56  d15efa            rcr      word ptr [bp - 6], 1
1:2C59  837ef800          cmp      word ptr [bp - 8], 0
1:2C5D  7d0f              jge      0x2c6e
1:2C5F  8b46fa            mov      ax, word ptr [bp - 6]
1:2C62  8b56fc            mov      dx, word ptr [bp - 4]
1:2C65  f7d8              neg      ax
1:2C67  83d200            adc      dx, 0
1:2C6A  f7da              neg      dx
1:2C6C  eb06              jmp      0x2c74
1:2C6E  8b46fa            mov      ax, word ptr [bp - 6]
1:2C71  8b56fc            mov      dx, word ptr [bp - 4]
1:2C74  83ed02            sub      bp, 2
1:2C77  8be5              mov      sp, bp
1:2C79  1f                pop      ds
1:2C7A  5d                pop      bp
1:2C7B  4d                dec      bp
1:2C7C  cb                retf     
1:2C7D  90                nop      

; ===== EXPORT:ord_30(#30) =====
1:2C7E  1e                push     ds
1:2C7F  58                pop      ax
1:2C80  90                nop      
1:2C81  45                inc      bp
1:2C82  55                push     bp
1:2C83  8bec              mov      bp, sp
1:2C85  1e                push     ds
1:2C86  8ed8              mov      ds, ax
1:2C88  837e0a00          cmp      word ptr [bp + 0xa], 0
1:2C8C  7504              jne      0x2c92
1:2C8E  2bc0              sub      ax, ax
1:2C90  eb09              jmp      0x2c9b
1:2C92  8b460e            mov      ax, word ptr [bp + 0xe]
1:2C95  a3d20a            mov      word ptr [0xad2], ax
1:2C98  b80100            mov      ax, 1
1:2C9B  4d                dec      bp
1:2C9C  4d                dec      bp
1:2C9D  8be5              mov      sp, bp
1:2C9F  1f                pop      ds
1:2CA0  5d                pop      bp
1:2CA1  4d                dec      bp
1:2CA2  ca0a00            retf     0xa

; ===== EXPORT:WEP(#2) =====
1:2CA5  1e                push     ds
1:2CA6  58                pop      ax
1:2CA7  90                nop      
1:2CA8  45                inc      bp
1:2CA9  55                push     bp
1:2CAA  8bec              mov      bp, sp
1:2CAC  1e                push     ds
1:2CAD  8ed8              mov      ds, ax
1:2CAF  b80100            mov      ax, 1
1:2CB2  4d                dec      bp
1:2CB3  4d                dec      bp
1:2CB4  8be5              mov      sp, bp
1:2CB6  1f                pop      ds
1:2CB7  5d                pop      bp
1:2CB8  4d                dec      bp
1:2CB9  ca0200            retf     2

; ===== EXPORT:MODULE(#1) =====
1:2CBC  1e                push     ds
1:2CBD  58                pop      ax
1:2CBE  90                nop      
1:2CBF  45                inc      bp
1:2CC0  55                push     bp
1:2CC1  8bec              mov      bp, sp
1:2CC3  1e                push     ds
1:2CC4  8ed8              mov      ds, ax
1:2CC6  83ec0a            sub      sp, 0xa
1:2CC9  56                push     si
1:2CCA  8b4608            mov      ax, word ptr [bp + 8]
1:2CCD  a3f609            mov      word ptr [0x9f6], ax
1:2CD0  8b4606            mov      ax, word ptr [bp + 6]
1:2CD3  a36209            mov      word ptr [0x962], ax
1:2CD6  50                push     ax
1:2CD7  9af72c0000        lcall    0, 0x2cf7  ; @1:KERNEL.GlobalLock
1:2CDC  a3060a            mov      word ptr [0xa06], ax
1:2CDF  8916080a          mov      word ptr [0xa08], dx
1:2CE3  8bc2              mov      ax, dx
1:2CE5  0b06060a          or       ax, word ptr [0xa06]
1:2CE9  7503              jne      0x2cee
1:2CEB  e96a01            jmp      0x2e58
1:2CEE  c41e060a          les      bx, ptr [0xa06]
1:2CF2  26ff7720          push     word ptr es:[bx + 0x20]
1:2CF6  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalLock
1:2CFB  a3e40b            mov      word ptr [0xbe4], ax
1:2CFE  8916e60b          mov      word ptr [0xbe6], dx
1:2D02  8bc2              mov      ax, dx
1:2D04  0b06e40b          or       ax, word ptr [0xbe4]
1:2D08  7503              jne      0x2d0d
1:2D0A  e94201            jmp      0x2e4f
1:2D0D  8b460a            mov      ax, word ptr [bp + 0xa]
1:2D10  e90801            jmp      0x2e1b
1:2D13  c41e060a          les      bx, ptr [0xa06]
1:2D17  26837f1465        cmp      word ptr es:[bx + 0x14], 0x65
1:2D1C  7c0f              jl       0x2d2d
1:2D1E  26817f36f400      cmp      word ptr es:[bx + 0x36], 0xf4
1:2D24  7507              jne      0x2d2d
1:2D26  26837f3878        cmp      word ptr es:[bx + 0x38], 0x78
1:2D2B  740e              je       0x2d3b
1:2D2D  c706d4050000      mov      word ptr [0x5d4], 0
1:2D33  c746fc0500        mov      word ptr [bp - 4], 5
1:2D38  e90701            jmp      0x2e42
1:2D3B  c706d4050100      mov      word ptr [0x5d4], 1
1:2D41  e9fe00            jmp      0x2e42
1:2D44  b81e09            mov      ax, 0x91e
1:2D47  50                push     ax
1:2D48  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_29(1:2E9E)
1:2D4D  5b                pop      bx
1:2D4E  ff361e09          push     word ptr [0x91e]
1:2D52  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_28(1:2F00)
1:2D57  5b                pop      bx
1:2D58  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_27(1:0E82)
1:2D5D  eb13              jmp      0x2d72
1:2D5F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_26(1:0FEA)
1:2D64  eb0c              jmp      0x2d72
1:2D66  833ed40500        cmp      word ptr [0x5d4], 0
1:2D6B  740b              je       0x2d78
1:2D6D  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_25(1:2753)
1:2D72  8946fc            mov      word ptr [bp - 4], ax
1:2D75  e9ca00            jmp      0x2e42
1:2D78  ff36f609          push     word ptr [0x9f6]
1:2D7C  b800ff            mov      ax, 0xff00
1:2D7F  baff00            mov      dx, 0xff
1:2D82  52                push     dx
1:2D83  50                push     ax
1:2D84  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextColor
1:2D89  ff36f609          push     word ptr [0x9f6]
1:2D8D  2bc0              sub      ax, ax
1:2D8F  50                push     ax
1:2D90  50                push     ax
1:2D91  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkColor
1:2D96  ff36f609          push     word ptr [0x9f6]
1:2D9A  2bc0              sub      ax, ax
1:2D9C  50                push     ax
1:2D9D  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextAlign
1:2DA2  ff36f609          push     word ptr [0x9f6]
1:2DA6  b80100            mov      ax, 1
1:2DA9  50                push     ax
1:2DAA  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkMode
1:2DAF  ff36f609          push     word ptr [0x9f6]
1:2DB3  2bc0              sub      ax, ax
1:2DB5  50                push     ax
1:2DB6  50                push     ax
1:2DB7  b8d605            mov      ax, 0x5d6
1:2DBA  1e                push     ds
1:2DBB  50                push     ax
1:2DBC  50                push     ax
1:2DBD  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_24(1:2E82)
1:2DC2  5b                pop      bx
1:2DC3  50                push     ax
1:2DC4  9affff0000        lcall    0, 0xffff  ; @1:GDI.TextOut
1:2DC9  eb77              jmp      0x2e42
1:2DCB  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_23(1:1C2F)
1:2DD0  eba0              jmp      0x2d72
1:2DD2  a1d20a            mov      ax, word ptr [0xad2]
1:2DD5  c41ee40b          les      bx, ptr [0xbe4]
1:2DD9  26894716          mov      word ptr es:[bx + 0x16], ax
1:2DDD  c746f60000        mov      word ptr [bp - 0xa], 0
1:2DE2  8b46f6            mov      ax, word ptr [bp - 0xa]
1:2DE5  8bf0              mov      si, ax
1:2DE7  d1e6              shl      si, 1
1:2DE9  40                inc      ax
1:2DEA  c41ee40b          les      bx, ptr [0xbe4]
1:2DEE  2689400e          mov      word ptr es:[bx + si + 0xe], ax
1:2DF2  ff46f6            inc      word ptr [bp - 0xa]
1:2DF5  837ef604          cmp      word ptr [bp - 0xa], 4
1:2DF9  7ce7              jl       0x2de2
1:2DFB  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_22(1:2907)
1:2E00  e96fff            jmp      0x2d72
1:2E03  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_21(1:1C1B)
1:2E08  e967ff            jmp      0x2d72
1:2E0B  8b460a            mov      ax, word ptr [bp + 0xa]
1:2E0E  2d0700            sub      ax, 7
1:2E11  50                push     ax
1:2E12  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_20(1:28A2)
1:2E17  5b                pop      bx
1:2E18  e957ff            jmp      0x2d72
1:2E1B  3d0c00            cmp      ax, 0xc
1:2E1E  7722              ja       0x2e42
1:2E20  d1e0              shl      ax, 1
1:2E22  93                xchg     bx, ax
1:2E23  2effa7282e        jmp      word ptr cs:[bx + 0x2e28]
1:2E28  44                inc      sp
1:2E29  2d5f2d            sub      ax, 0x2d5f
1:2E2C  662dcb2d422e      sub      eax, 0x2e422dcb
1:2E32  d22d              shr      byte ptr [di], cl
1:2E34  032e0b2e          add      bp, word ptr [0x2e0b]
1:2E38  0b2e0b2e          or       bp, word ptr [0x2e0b]
1:2E3C  0b2e422e          or       bp, word ptr [0x2e42]
1:2E40  132d              adc      bp, word ptr [di]
1:2E42  c41e060a          les      bx, ptr [0xa06]
1:2E46  26ff7720          push     word ptr es:[bx + 0x20]
1:2E4A  9a542e0000        lcall    0, 0x2e54  ; @1:KERNEL.GlobalUnlock
1:2E4F  ff366209          push     word ptr [0x962]
1:2E53  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalUnlock
1:2E58  8b46fc            mov      ax, word ptr [bp - 4]
1:2E5B  5e                pop      si
1:2E5C  4d                dec      bp
1:2E5D  4d                dec      bp
1:2E5E  8be5              mov      sp, bp
1:2E60  1f                pop      ds
1:2E61  5d                pop      bp
1:2E62  4d                dec      bp
1:2E63  ca0600            retf     6
1:2E66  0000              add      byte ptr [bx + si], al
1:2E68  0000              add      byte ptr [bx + si], al
1:2E6A  0000              add      byte ptr [bx + si], al
1:2E6C  0000              add      byte ptr [bx + si], al
1:2E6E  0000              add      byte ptr [bx + si], al
1:2E70  0000              add      byte ptr [bx + si], al
1:2E72  0000              add      byte ptr [bx + si], al
1:2E74  0000              add      byte ptr [bx + si], al
1:2E76  0000              add      byte ptr [bx + si], al
1:2E78  0000              add      byte ptr [bx + si], al
1:2E7A  0000              add      byte ptr [bx + si], al
1:2E7C  0000              add      byte ptr [bx + si], al
1:2E7E  0000              add      byte ptr [bx + si], al
1:2E80  c3                ret      
1:2E81  00558b            add      byte ptr [di - 0x75], dl
1:2E84  ec                in       al, dx
1:2E85  8bd7              mov      dx, di
1:2E87  8cd8              mov      ax, ds
1:2E89  8ec0              mov      es, ax
1:2E8B  8b7e06            mov      di, word ptr [bp + 6]
1:2E8E  33c0              xor      ax, ax
1:2E90  b9ffff            mov      cx, 0xffff
1:2E93  f2ae              repne scasb al, byte ptr es:[di]
1:2E95  f7d1              not      cx
1:2E97  49                dec      cx
1:2E98  91                xchg     cx, ax
1:2E99  8bfa              mov      di, dx
1:2E9B  5d                pop      bp
1:2E9C  cb                retf     
1:2E9D  008cd890          add      byte ptr [si - 0x6f28], cl
1:2EA1  45                inc      bp
1:2EA2  55                push     bp
1:2EA3  8bec              mov      bp, sp
1:2EA5  1e                push     ds
1:2EA6  8ed8              mov      ds, ax
1:2EA8  56                push     si
1:2EA9  b42a              mov      ah, 0x2a
1:2EAB  cd21              int      0x21
1:2EAD  8bda              mov      bx, dx
1:2EAF  8bf1              mov      si, cx
1:2EB1  b42c              mov      ah, 0x2c
1:2EB3  cd21              int      0x21
1:2EB5  b400              mov      ah, 0
1:2EB7  8ac6              mov      al, dh
1:2EB9  50                push     ax
1:2EBA  8ac1              mov      al, cl
1:2EBC  50                push     ax
1:2EBD  8ac5              mov      al, ch
1:2EBF  50                push     ax
1:2EC0  50                push     ax
1:2EC1  b42a              mov      ah, 0x2a
1:2EC3  cd21              int      0x21
1:2EC5  3bda              cmp      bx, dx
1:2EC7  58                pop      ax
1:2EC8  7408              je       0x2ed2
1:2ECA  3c17              cmp      al, 0x17
1:2ECC  7504              jne      0x2ed2
1:2ECE  8bd3              mov      dx, bx
1:2ED0  8bce              mov      cx, si
1:2ED2  b400              mov      ah, 0
1:2ED4  8ac2              mov      al, dl
1:2ED6  50                push     ax
1:2ED7  8ac6              mov      al, dh
1:2ED9  50                push     ax
1:2EDA  81e9bc07          sub      cx, 0x7bc
1:2EDE  51                push     cx
1:2EDF  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_31(1:3158)
1:2EE4  83c40c            add      sp, 0xc
1:2EE7  837e0600          cmp      word ptr [bp + 6], 0
1:2EEB  7408              je       0x2ef5
1:2EED  8b5e06            mov      bx, word ptr [bp + 6]
1:2EF0  895702            mov      word ptr [bx + 2], dx
1:2EF3  8907              mov      word ptr [bx], ax
1:2EF5  5e                pop      si
1:2EF6  83ed02            sub      bp, 2
1:2EF9  8be5              mov      sp, bp
1:2EFB  1f                pop      ds
1:2EFC  5d                pop      bp
1:2EFD  4d                dec      bp
1:2EFE  cb                retf     
1:2EFF  004555            add      byte ptr [di + 0x55], al
1:2F02  8bec              mov      bp, sp
1:2F04  8b4606            mov      ax, word ptr [bp + 6]
1:2F07  a31206            mov      word ptr [0x612], ax
1:2F0A  c70614060000      mov      word ptr [0x614], 0
1:2F10  5d                pop      bp
1:2F11  4d                dec      bp
1:2F12  cb                retf     
1:2F13  90                nop      

; ===== EXPORT:ord_6(#6) =====
1:2F14  45                inc      bp
1:2F15  55                push     bp
1:2F16  8bec              mov      bp, sp
1:2F18  b8fd43            mov      ax, 0x43fd