File: raw\unpacked\MODULES\VERTIGO.AD
Module: 'VERTIGO' ('Vertigo, last modified February 4 1991, by TDE')
CS:IP=1:363A  SS:SP=0:0000  AutoDS=2  Heap=4096  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (4): win87em, KERNEL, GDI, USER
Segments (2):
  SEG  1: CODE off=0x006C0 len=0x366C min=0x366C flags=0x0D50 relocs=365
  SEG  2: DATA off=0x046A0 len=0x0958 min=0x0958 flags=0x0D71 relocs=17
Exports (54):
  ord   1: SEG1:0C32 flags=0x03 MODULE
  ord   2: SEG1:0C1B flags=0x03 WEP
  ord   3: SEG1:2844 flags=0x03 ___EXPORTEDSTUB
  ord   4: SEG1:0E84 flags=0x00 
  ord   5: SEG1:0EE6 flags=0x00 
  ord   6: SEG1:0EB4 flags=0x00 
  ord   7: SEG1:0F66 flags=0x00 
  ord   8: SEG1:0F46 flags=0x00 
  ord   9: SEG1:0F4C flags=0x00 
  ord  10: SEG1:017C flags=0x00 
  ord  11: SEG1:0168 flags=0x00 
  ord  12: SEG1:013F flags=0x00 
  ord  13: SEG1:011C flags=0x00 
  ord  14: SEG1:0DF2 flags=0x00 
  ord  15: SEG1:00A1 flags=0x00 
  ord  16: SEG1:0039 flags=0x00 
  ord  17: SEG1:0012 flags=0x00 
  ord  18: SEG1:0E70 flags=0x00 
  ord  19: SEG1:0E0E flags=0x00 
  ord  20: SEG1:0BF4 flags=0x00 
  ord  21: SEG1:0FB8 flags=0x00 
  ord  22: SEG1:18DA flags=0x00 
  ord  23: SEG1:16A4 flags=0x00 
  ord  24: SEG1:1246 flags=0x00 
  ord  25: SEG1:12F6 flags=0x00 
  ord  26: SEG1:11D2 flags=0x00 
  ord  27: SEG1:12C0 flags=0x00 
  ord  28: SEG1:1C6C flags=0x00 
  ord  29: SEG1:0FA4 flags=0x00 
  ord  30: SEG1:1E36 flags=0x00 
  ord  31: SEG1:1CF6 flags=0x00 
  ord  32: SEG1:2088 flags=0x00 
  ord  33: SEG1:2186 flags=0x00 
  ord  34: SEG1:27AC flags=0x00 
  ord  35: SEG1:2240 flags=0x00 
  ord  36: SEG1:210A flags=0x00 
  ord  37: SEG1:213C flags=0x00 
  ord  38: SEG1:2816 flags=0x00 
  ord  39: SEG1:21F8 flags=0x00 
  ord  40: SEG1:27FC flags=0x00 
  ord  41: SEG1:226E flags=0x00 
  ord  42: SEG1:20C5 flags=0x00 
  ord  43: SEG1:20FA flags=0x00 
  ord  44: SEG1:2858 flags=0x00 
  ord  45: SEG1:2880 flags=0x00 
  ord  46: SEG1:2922 flags=0x00 
  ord  47: SEG1:28E6 flags=0x00 
  ord  48: SEG1:294C flags=0x00 
  ord  49: SEG1:2884 flags=0x00 
  ord  50: SEG1:1D10 flags=0x00 
  ord  51: SEG1:3270 flags=0x00 
  ord  52: SEG1:2726 flags=0x00 
  ord  53: SEG1:280F flags=0x00 
  ord  54: SEG1:32D0 flags=0x00 
Resources (7):
  TYPE_1000        #1               off=0x050A0 len=   112
  TYPE_1000        #2               off=0x05110 len=    64
  TYPE_1000        #3               off=0x05150 len=    64
  TYPE_1000        #4               off=0x05190 len=   224
  TYPE_2000        #10              off=0x05270 len=    80
  TYPE_2000        #20              off=0x052C0 len=    16
  TYPE_2000        #30              off=0x052D0 len=   400

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

; ===== EXPORT:ord_17(#17) =====
1:0012  1e                push     ds
1:0013  58                pop      ax
1:0014  90                nop      
1:0015  45                inc      bp
1:0016  55                push     bp
1:0017  8bec              mov      bp, sp
1:0019  1e                push     ds
1:001A  8ed8              mov      ds, ax
1:001C  c70622090000      mov      word ptr [0x922], 0
1:0022  0e                push     cs
1:0023  e8d501            call     0x1fb
1:0026  c70616000100      mov      word ptr [0x16], 1
1:002C  2bc0              sub      ax, ax
1:002E  a31a00            mov      word ptr [0x1a], ax
1:0031  4d                dec      bp
1:0032  4d                dec      bp
1:0033  8be5              mov      sp, bp
1:0035  1f                pop      ds
1:0036  5d                pop      bp
1:0037  4d                dec      bp
1:0038  cb                retf     

; ===== EXPORT:ord_16(#16) =====
1:0039  1e                push     ds
1:003A  58                pop      ax
1:003B  90                nop      
1:003C  45                inc      bp
1:003D  55                push     bp
1:003E  8bec              mov      bp, sp
1:0040  1e                push     ds
1:0041  8ed8              mov      ds, ax
1:0043  b87008            mov      ax, 0x870
1:0046  1e                push     ds
1:0047  50                push     ax
1:0048  2bc0              sub      ax, ax
1:004A  50                push     ax
1:004B  50                push     ax
1:004C  c41e5009          les      bx, ptr [0x950]
1:0050  26ff7702          push     word ptr es:[bx + 2]
1:0054  26ff7704          push     word ptr es:[bx + 4]
1:0058  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:005D  ff362c09          push     word ptr [0x92c]
1:0061  b87008            mov      ax, 0x870
1:0064  1e                push     ds
1:0065  50                push     ax
1:0066  b80400            mov      ax, 4
1:0069  50                push     ax
1:006A  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:006F  50                push     ax
1:0070  9affff0000        lcall    0, 0xffff  ; @1:USER.FillRect
1:0075  c41e5009          les      bx, ptr [0x950]
1:0079  268b4706          mov      ax, word ptr es:[bx + 6]
1:007D  0bc0              or       ax, ax
1:007F  740b              je       0x8c
1:0081  48                dec      ax
1:0082  740d              je       0x91
1:0084  48                dec      ax
1:0085  740f              je       0x96
1:0087  b80c00            mov      ax, 0xc
1:008A  eb0d              jmp      0x99
1:008C  b80a00            mov      ax, 0xa
1:008F  eb08              jmp      0x99
1:0091  b80b00            mov      ax, 0xb
1:0094  eb03              jmp      0x99
1:0096  b80d00            mov      ax, 0xd
1:0099  4d                dec      bp
1:009A  4d                dec      bp
1:009B  8be5              mov      sp, bp
1:009D  1f                pop      ds
1:009E  5d                pop      bp
1:009F  4d                dec      bp
1:00A0  cb                retf     

; ===== EXPORT:ord_15(#15) =====
1:00A1  1e                push     ds
1:00A2  58                pop      ax
1:00A3  90                nop      
1:00A4  45                inc      bp
1:00A5  55                push     bp
1:00A6  8bec              mov      bp, sp
1:00A8  1e                push     ds
1:00A9  8ed8              mov      ds, ax
1:00AB  833e160000        cmp      word ptr [0x16], 0
1:00B0  7415              je       0xc7
1:00B2  c41e5009          les      bx, ptr [0x950]
1:00B6  26837f0601        cmp      word ptr es:[bx + 6], 1
1:00BB  7504              jne      0xc1
1:00BD  0e                push     cs
1:00BE  e87d0a            call     0xb3e
1:00C1  c70616000000      mov      word ptr [0x16], 0
1:00C7  833e1a0000        cmp      word ptr [0x1a], 0
1:00CC  741c              je       0xea
1:00CE  c41e3209          les      bx, ptr [0x932]
1:00D2  26837f0a04        cmp      word ptr es:[bx + 0xa], 4
1:00D7  7e11              jle      0xea
1:00D9  c41e5009          les      bx, ptr [0x950]
1:00DD  26837f0c00        cmp      word ptr es:[bx + 0xc], 0
1:00E2  7406              je       0xea
1:00E4  0e                push     cs
1:00E5  e89709            call     0xa7f
1:00E8  eb11              jmp      0xfb
1:00EA  833e460900        cmp      word ptr [0x946], 0
1:00EF  7506              jne      0xf7
1:00F1  0e                push     cs
1:00F2  e84106            call     0x736
1:00F5  eb04              jmp      0xfb
1:00F7  0e                push     cs
1:00F8  e85803            call     0x453
1:00FB  a11000            mov      ax, word ptr [0x10]
1:00FE  39062209          cmp      word ptr [0x922], ax
1:0102  7c0e              jl       0x112
1:0104  c70622090000      mov      word ptr [0x922], 0
1:010A  0e                push     cs
1:010B  e8ed00            call     0x1fb
1:010E  0e                push     cs
1:010F  e827ff            call     0x39
1:0112  2bc0              sub      ax, ax
1:0114  4d                dec      bp
1:0115  4d                dec      bp
1:0116  8be5              mov      sp, bp
1:0118  1f                pop      ds
1:0119  5d                pop      bp
1:011A  4d                dec      bp
1:011B  cb                retf     

; ===== EXPORT:ord_13(#13) =====
1:011C  1e                push     ds
1:011D  58                pop      ax
1:011E  90                nop      
1:011F  45                inc      bp
1:0120  55                push     bp
1:0121  8bec              mov      bp, sp
1:0123  1e                push     ds
1:0124  8ed8              mov      ds, ax
1:0126  c41e3209          les      bx, ptr [0x932]
1:012A  26837f2800        cmp      word ptr es:[bx + 0x28], 0
1:012F  7504              jne      0x135
1:0131  0e                push     cs
1:0132  e804ff            call     0x39
1:0135  2bc0              sub      ax, ax
1:0137  4d                dec      bp
1:0138  4d                dec      bp
1:0139  8be5              mov      sp, bp
1:013B  1f                pop      ds
1:013C  5d                pop      bp
1:013D  4d                dec      bp
1:013E  cb                retf     

; ===== EXPORT:ord_12(#12) =====
1:013F  1e                push     ds
1:0140  58                pop      ax
1:0141  90                nop      
1:0142  45                inc      bp
1:0143  55                push     bp
1:0144  8bec              mov      bp, sp
1:0146  1e                push     ds
1:0147  8ed8              mov      ds, ax
1:0149  c41e3209          les      bx, ptr [0x932]
1:014D  26837f0a04        cmp      word ptr es:[bx + 0xa], 4
1:0152  7f0a              jg       0x15e
1:0154  c41e5009          les      bx, ptr [0x950]
1:0158  26c747140000      mov      word ptr es:[bx + 0x14], 0
1:015E  2bc0              sub      ax, ax
1:0160  4d                dec      bp
1:0161  4d                dec      bp
1:0162  8be5              mov      sp, bp
1:0164  1f                pop      ds
1:0165  5d                pop      bp
1:0166  4d                dec      bp
1:0167  cb                retf     

; ===== EXPORT:ord_11(#11) =====
1:0168  1e                push     ds
1:0169  58                pop      ax
1:016A  90                nop      
1:016B  45                inc      bp
1:016C  55                push     bp
1:016D  8bec              mov      bp, sp
1:016F  1e                push     ds
1:0170  8ed8              mov      ds, ax
1:0172  2bc0              sub      ax, ax
1:0174  4d                dec      bp
1:0175  4d                dec      bp
1:0176  8be5              mov      sp, bp
1:0178  1f                pop      ds
1:0179  5d                pop      bp
1:017A  4d                dec      bp
1:017B  cb                retf     

; ===== EXPORT:ord_10(#10) =====
1:017C  1e                push     ds
1:017D  58                pop      ax
1:017E  90                nop      
1:017F  45                inc      bp
1:0180  55                push     bp
1:0181  8bec              mov      bp, sp
1:0183  1e                push     ds
1:0184  8ed8              mov      ds, ax
1:0186  8b4606            mov      ax, word ptr [bp + 6]
1:0189  0bc0              or       ax, ax
1:018B  740b              je       0x198
1:018D  48                dec      ax
1:018E  7461              je       0x1f1
1:0190  48                dec      ax
1:0191  743c              je       0x1cf
1:0193  48                dec      ax
1:0194  745b              je       0x1f1
1:0196  eb51              jmp      0x1e9
1:0198  c41e3209          les      bx, ptr [0x932]
1:019C  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:01A1  754e              jne      0x1f1
1:01A3  c41e5009          les      bx, ptr [0x950]
1:01A7  268b4706          mov      ax, word ptr es:[bx + 6]
1:01AB  0bc0              or       ax, ax
1:01AD  740b              je       0x1ba
1:01AF  48                dec      ax
1:01B0  740d              je       0x1bf
1:01B2  48                dec      ax
1:01B3  7415              je       0x1ca
1:01B5  b80c00            mov      ax, 0xc
1:01B8  eb39              jmp      0x1f3
1:01BA  b80a00            mov      ax, 0xa
1:01BD  eb34              jmp      0x1f3
1:01BF  c70616000100      mov      word ptr [0x16], 1
1:01C5  b80b00            mov      ax, 0xb
1:01C8  eb29              jmp      0x1f3
1:01CA  b80d00            mov      ax, 0xd
1:01CD  eb24              jmp      0x1f3
1:01CF  c41e3209          les      bx, ptr [0x932]
1:01D3  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:01D8  7517              jne      0x1f1
1:01DA  c70616000100      mov      word ptr [0x16], 1
1:01E0  0e                push     cs
1:01E1  e838ff            call     0x11c
1:01E4  b80300            mov      ax, 3
1:01E7  eb0a              jmp      0x1f3
1:01E9  2bc0              sub      ax, ax
1:01EB  50                push     ax
1:01EC  9affff0000        lcall    0, 0xffff  ; @1:USER.MessageBeep
1:01F1  2bc0              sub      ax, ax
1:01F3  4d                dec      bp
1:01F4  4d                dec      bp
1:01F5  8be5              mov      sp, bp
1:01F7  1f                pop      ds
1:01F8  5d                pop      bp
1:01F9  4d                dec      bp
1:01FA  cb                retf     
1:01FB  1e                push     ds
1:01FC  58                pop      ax
1:01FD  90                nop      
1:01FE  45                inc      bp
1:01FF  55                push     bp
1:0200  8bec              mov      bp, sp
1:0202  1e                push     ds
1:0203  8ed8              mov      ds, ax
1:0205  9a48020000        lcall    0, 0x248  ; @1:INT:ord_4(1:0E84)
1:020A  b90400            mov      cx, 4
1:020D  99                cdq      
1:020E  f7f9              idiv     cx
1:0210  89164609          mov      word ptr [0x946], dx
1:0214  c70636090000      mov      word ptr [0x936], 0
1:021A  8bc2              mov      ax, dx
1:021C  eb0c              jmp      0x22a
1:021E  0e                push     cs
1:021F  e82e01            call     0x350
1:0222  eb11              jmp      0x235
1:0224  0e                push     cs
1:0225  e81500            call     0x23d
1:0228  eb0b              jmp      0x235
1:022A  0bc0              or       ax, ax
1:022C  74f6              je       0x224
1:022E  48                dec      ax
1:022F  7c04              jl       0x235
1:0231  48                dec      ax
1:0232  48                dec      ax
1:0233  7ee9              jle      0x21e
1:0235  4d                dec      bp
1:0236  4d                dec      bp
1:0237  8be5              mov      sp, bp
1:0239  1f                pop      ds
1:023A  5d                pop      bp
1:023B  4d                dec      bp
1:023C  cb                retf     
1:023D  1e                push     ds
1:023E  58                pop      ax
1:023F  90                nop      
1:0240  45                inc      bp
1:0241  55                push     bp
1:0242  8bec              mov      bp, sp
1:0244  1e                push     ds
1:0245  8ed8              mov      ds, ax
1:0247  9abc020000        lcall    0, 0x2bc  ; @1:INT:ord_4(1:0E84)
1:024C  8b0e1200          mov      cx, word ptr [0x12]
1:0250  81c1f000          add      cx, 0xf0
1:0254  99                cdq      
1:0255  f7f9              idiv     cx
1:0257  8bc2              mov      ax, dx
1:0259  055a00            add      ax, 0x5a
1:025C  99                cdq      
1:025D  a34209            mov      word ptr [0x942], ax
1:0260  89164409          mov      word ptr [0x944], dx
1:0264  a32a09            mov      word ptr [0x92a], ax
1:0267  8bc8              mov      cx, ax
1:0269  8bd0              mov      dx, ax
1:026B  b86810            mov      ax, 0x1068
1:026E  99                cdq      
1:026F  f7f9              idiv     cx
1:0271  40                inc      ax
1:0272  a33009            mov      word ptr [0x930], ax
1:0275  8bc1              mov      ax, cx
1:0277  99                cdq      
1:0278  f73e1400          idiv     word ptr [0x14]
1:027C  a34809            mov      word ptr [0x948], ax
1:027F  8bc1              mov      ax, cx
1:0281  99                cdq      
1:0282  2bc2              sub      ax, dx
1:0284  d1f8              sar      ax, 1
1:0286  8bc8              mov      cx, ax
1:0288  a14809            mov      ax, word ptr [0x948]
1:028B  99                cdq      
1:028C  f7f9              idiv     cx
1:028E  a32409            mov      word ptr [0x924], ax
1:0291  0bc0              or       ax, ax
1:0293  7506              jne      0x29b
1:0295  c70624090100      mov      word ptr [0x924], 1
1:029B  c7063a090000      mov      word ptr [0x93a], 0
1:02A1  c41e3209          les      bx, ptr [0x932]
1:02A5  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:02AA  7555              jne      0x301
1:02AC  b87808            mov      ax, 0x878
1:02AF  1e                push     ds
1:02B0  50                push     ax
1:02B1  8d4716            lea      ax, [bx + 0x16]
1:02B4  06                push     es
1:02B5  50                push     ax
1:02B6  9affff0000        lcall    0, 0xffff  ; @1:USER.CopyRect
1:02BB  9ace020000        lcall    0, 0x2ce  ; @1:INT:ord_4(1:0E84)
1:02C0  c41e5009          les      bx, ptr [0x950]
1:02C4  99                cdq      
1:02C5  26f77f02          idiv     word ptr es:[bx + 2]
1:02C9  89164c09          mov      word ptr [0x94c], dx
1:02CD  9a02030000        lcall    0, 0x302  ; @1:INT:ord_4(1:0E84)
1:02D2  c41e5009          les      bx, ptr [0x950]
1:02D6  99                cdq      
1:02D7  26f77f04          idiv     word ptr es:[bx + 4]
1:02DB  89164e09          mov      word ptr [0x94e], dx
1:02DF  a17c08            mov      ax, word ptr [0x87c]
1:02E2  39064c09          cmp      word ptr [0x94c], ax
1:02E6  7d3d              jge      0x325
1:02E8  a17808            mov      ax, word ptr [0x878]
1:02EB  39064c09          cmp      word ptr [0x94c], ax
1:02EF  7e34              jle      0x325
1:02F1  8bc2              mov      ax, dx
1:02F3  39067e08          cmp      word ptr [0x87e], ax
1:02F7  7e2c              jle      0x325
1:02F9  39067a08          cmp      word ptr [0x87a], ax
1:02FD  7cbc              jl       0x2bb
1:02FF  eb24              jmp      0x325
1:0301  9a14030000        lcall    0, 0x314  ; @1:INT:ord_4(1:0E84)
1:0306  c41e5009          les      bx, ptr [0x950]
1:030A  99                cdq      
1:030B  26f77f02          idiv     word ptr es:[bx + 2]
1:030F  89164c09          mov      word ptr [0x94c], dx
1:0313  9a26030000        lcall    0, 0x326  ; @1:INT:ord_4(1:0E84)
1:0318  c41e5009          les      bx, ptr [0x950]
1:031C  99                cdq      
1:031D  26f77f04          idiv     word ptr es:[bx + 4]
1:0321  89164e09          mov      word ptr [0x94e], dx
1:0325  9a70030000        lcall    0, 0x370  ; @1:INT:ord_4(1:0E84)
1:032A  b96801            mov      cx, 0x168
1:032D  99                cdq      
1:032E  f7f9              idiv     cx
1:0330  89163c09          mov      word ptr [0x93c], dx
1:0334  c7062e090300      mov      word ptr [0x92e], 3
1:033A  c70640090000      mov      word ptr [0x940], 0
1:0340  ff062209          inc      word ptr [0x922]
1:0344  0e                push     cs
1:0345  e80800            call     0x350
1:0348  4d                dec      bp
1:0349  4d                dec      bp
1:034A  8be5              mov      sp, bp
1:034C  1f                pop      ds
1:034D  5d                pop      bp
1:034E  4d                dec      bp
1:034F  cb                retf     
1:0350  1e                push     ds
1:0351  58                pop      ax
1:0352  90                nop      
1:0353  45                inc      bp
1:0354  55                push     bp
1:0355  8bec              mov      bp, sp
1:0357  1e                push     ds
1:0358  8ed8              mov      ds, ax
1:035A  833e460903        cmp      word ptr [0x946], 3
1:035F  7508              jne      0x369
1:0361  c70614000100      mov      word ptr [0x14], 1
1:0367  eb06              jmp      0x36f
1:0369  c70614006400      mov      word ptr [0x14], 0x64
1:036F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_4(1:0E84)
1:0374  99                cdq      
1:0375  f73e1200          idiv     word ptr [0x12]
1:0379  8bc2              mov      ax, dx
1:037B  051e00            add      ax, 0x1e
1:037E  99                cdq      
1:037F  a34209            mov      word ptr [0x942], ax
1:0382  89164409          mov      word ptr [0x944], dx
1:0386  a32a09            mov      word ptr [0x92a], ax
1:0389  8bc8              mov      cx, ax
1:038B  8bd0              mov      dx, ax
1:038D  b86810            mov      ax, 0x1068
1:0390  99                cdq      
1:0391  f7f9              idiv     cx
1:0393  40                inc      ax
1:0394  a33009            mov      word ptr [0x930], ax
1:0397  8bc1              mov      ax, cx
1:0399  99                cdq      
1:039A  f73e1400          idiv     word ptr [0x14]
1:039E  a34809            mov      word ptr [0x948], ax
1:03A1  8bc1              mov      ax, cx
1:03A3  99                cdq      
1:03A4  2bc2              sub      ax, dx
1:03A6  d1f8              sar      ax, 1
1:03A8  8bc8              mov      cx, ax
1:03AA  a14809            mov      ax, word ptr [0x948]
1:03AD  99                cdq      
1:03AE  f7f9              idiv     cx
1:03B0  a32409            mov      word ptr [0x924], ax
1:03B3  0bc0              or       ax, ax
1:03B5  7506              jne      0x3bd
1:03B7  c70624090100      mov      word ptr [0x924], 1
1:03BD  c7063a090000      mov      word ptr [0x93a], 0
1:03C3  c41e3209          les      bx, ptr [0x932]
1:03C7  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:03CC  7555              jne      0x423
1:03CE  b88408            mov      ax, 0x884
1:03D1  1e                push     ds
1:03D2  50                push     ax
1:03D3  8d4716            lea      ax, [bx + 0x16]
1:03D6  06                push     es
1:03D7  50                push     ax
1:03D8  9ab7020000        lcall    0, 0x2b7  ; @1:USER.CopyRect
1:03DD  9af0030000        lcall    0, 0x3f0  ; @1:INT:ord_4(1:0E84)
1:03E2  c41e5009          les      bx, ptr [0x950]
1:03E6  99                cdq      
1:03E7  26f77f02          idiv     word ptr es:[bx + 2]
1:03EB  89164c09          mov      word ptr [0x94c], dx
1:03EF  9a24040000        lcall    0, 0x424  ; @1:INT:ord_4(1:0E84)
1:03F4  c41e5009          les      bx, ptr [0x950]
1:03F8  99                cdq      
1:03F9  26f77f04          idiv     word ptr es:[bx + 4]
1:03FD  89164e09          mov      word ptr [0x94e], dx
1:0401  a18808            mov      ax, word ptr [0x888]
1:0404  39064c09          cmp      word ptr [0x94c], ax
1:0408  7d3d              jge      0x447
1:040A  a18408            mov      ax, word ptr [0x884]
1:040D  39064c09          cmp      word ptr [0x94c], ax
1:0411  7e34              jle      0x447
1:0413  8bc2              mov      ax, dx
1:0415  39068a08          cmp      word ptr [0x88a], ax
1:0419  7e2c              jle      0x447
1:041B  39068608          cmp      word ptr [0x886], ax
1:041F  7cbc              jl       0x3dd
1:0421  eb24              jmp      0x447
1:0423  9a36040000        lcall    0, 0x436  ; @1:INT:ord_4(1:0E84)
1:0428  c41e5009          les      bx, ptr [0x950]
1:042C  99                cdq      
1:042D  26f77f02          idiv     word ptr es:[bx + 2]
1:0431  89164c09          mov      word ptr [0x94c], dx
1:0435  9a06020000        lcall    0, 0x206  ; @1:INT:ord_4(1:0E84)
1:043A  c41e5009          les      bx, ptr [0x950]
1:043E  99                cdq      
1:043F  26f77f04          idiv     word ptr es:[bx + 4]
1:0443  89164e09          mov      word ptr [0x94e], dx
1:0447  ff062209          inc      word ptr [0x922]
1:044B  4d                dec      bp
1:044C  4d                dec      bp
1:044D  8be5              mov      sp, bp
1:044F  1f                pop      ds
1:0450  5d                pop      bp
1:0451  4d                dec      bp
1:0452  cb                retf     
1:0453  1e                push     ds
1:0454  58                pop      ax
1:0455  90                nop      
1:0456  45                inc      bp
1:0457  55                push     bp
1:0458  8bec              mov      bp, sp
1:045A  1e                push     ds
1:045B  8ed8              mov      ds, ax
1:045D  83ec06            sub      sp, 6
1:0460  a13a09            mov      ax, word ptr [0x93a]
1:0463  39064809          cmp      word ptr [0x948], ax
1:0467  7c07              jl       0x470
1:0469  a12409            mov      ax, word ptr [0x924]
1:046C  01063a09          add      word ptr [0x93a], ax
1:0470  b86400            mov      ax, 0x64
1:0473  c41e5009          les      bx, ptr [0x950]
1:0477  262b470a          sub      ax, word ptr es:[bx + 0xa]
1:047B  3b063609          cmp      ax, word ptr [0x936]
1:047F  7f2a              jg       0x4ab
1:0481  a19008            mov      ax, word ptr [0x890]
1:0484  8b169208          mov      dx, word ptr [0x892]
1:0488  8306900801        add      word ptr [0x890], 1
1:048D  8316920800        adc      word ptr [0x892], 0
1:0492  0bd2              or       dx, dx
1:0494  7c0f              jl       0x4a5
1:0496  7f05              jg       0x49d
1:0498  3dea00            cmp      ax, 0xea
1:049B  7208              jb       0x4a5
1:049D  2bc0              sub      ax, ax
1:049F  a39208            mov      word ptr [0x892], ax
1:04A2  a39008            mov      word ptr [0x890], ax
1:04A5  c70636090000      mov      word ptr [0x936], 0
1:04AB  ff063609          inc      word ptr [0x936]
1:04AF  c41e3209          les      bx, ptr [0x932]
1:04B3  268b470c          mov      ax, word ptr es:[bx + 0xc]
1:04B7  99                cdq      
1:04B8  52                push     dx
1:04B9  50                push     ax
1:04BA  ff364409          push     word ptr [0x944]
1:04BE  ff364209          push     word ptr [0x942]
1:04C2  268b470e          mov      ax, word ptr es:[bx + 0xe]
1:04C6  99                cdq      
1:04C7  52                push     dx
1:04C8  50                push     ax
1:04C9  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_6(1:0EB4)
1:04CE  52                push     dx
1:04CF  50                push     ax
1:04D0  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_5(1:0EE6)
1:04D5  a39608            mov      word ptr [0x896], ax
1:04D8  833e460902        cmp      word ptr [0x946], 2
1:04DD  7403              je       0x4e2
1:04DF  e9c900            jmp      0x5ab
1:04E2  c41e3209          les      bx, ptr [0x932]
1:04E6  26837f0a04        cmp      word ptr es:[bx + 0xa], 4
1:04EB  7e30              jle      0x51d
1:04ED  ff362c09          push     word ptr [0x92c]
1:04F1  2bc0              sub      ax, ax
1:04F3  50                push     ax
1:04F4  b80300            mov      ax, 3
1:04F7  50                push     ax
1:04F8  b80001            mov      ax, 0x100
1:04FB  50                push     ax
1:04FC  ff369008          push     word ptr [0x890]
1:0500  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreatePen
1:0505  50                push     ax
1:0506  9a2c050000        lcall    0, 0x52c  ; @1:GDI.SelectObject
1:050B  a39808            mov      word ptr [0x898], ax
1:050E  ff362c09          push     word ptr [0x92c]
1:0512  b80500            mov      ax, 5
1:0515  50                push     ax
1:0516  9a26050000        lcall    0, 0x526  ; @1:GDI.GetStockObject
1:051B  eb27              jmp      0x544
1:051D  ff362c09          push     word ptr [0x92c]
1:0521  b80800            mov      ax, 8
1:0524  50                push     ax
1:0525  9ab4050000        lcall    0, 0x5b4  ; @1:GDI.GetStockObject
1:052A  50                push     ax
1:052B  9a46050000        lcall    0, 0x546  ; @1:GDI.SelectObject
1:0530  a39808            mov      word ptr [0x898], ax
1:0533  ff362c09          push     word ptr [0x92c]
1:0537  b80001            mov      ax, 0x100
1:053A  50                push     ax
1:053B  ff369008          push     word ptr [0x890]
1:053F  9ace050000        lcall    0, 0x5ce  ; @1:GDI.CreateSolidBrush
1:0544  50                push     ax
1:0545  9a9d050000        lcall    0, 0x59d  ; @1:GDI.SelectObject
1:054A  a39a08            mov      word ptr [0x89a], ax
1:054D  ff362c09          push     word ptr [0x92c]
1:0551  a14c09            mov      ax, word ptr [0x94c]
1:0554  2b069608          sub      ax, word ptr [0x896]
1:0558  03063a09          add      ax, word ptr [0x93a]
1:055C  50                push     ax
1:055D  a14e09            mov      ax, word ptr [0x94e]
1:0560  2b063a09          sub      ax, word ptr [0x93a]
1:0564  2b062a09          sub      ax, word ptr [0x92a]
1:0568  50                push     ax
1:0569  a14c09            mov      ax, word ptr [0x94c]
1:056C  03063a09          add      ax, word ptr [0x93a]
1:0570  03069608          add      ax, word ptr [0x896]
1:0574  50                push     ax
1:0575  a12a09            mov      ax, word ptr [0x92a]
1:0578  2b063a09          sub      ax, word ptr [0x93a]
1:057C  03064e09          add      ax, word ptr [0x94e]
1:0580  50                push     ax
1:0581  9affff0000        lcall    0, 0xffff  ; @1:GDI.Rectangle
1:0586  c41e3209          les      bx, ptr [0x932]
1:058A  26837f0a04        cmp      word ptr es:[bx + 0xa], 4
1:058F  7f03              jg       0x594
1:0591  e98000            jmp      0x614
1:0594  ff362c09          push     word ptr [0x92c]
1:0598  ff369a08          push     word ptr [0x89a]
1:059C  9aba050000        lcall    0, 0x5ba  ; @1:GDI.SelectObject
1:05A1  ff362c09          push     word ptr [0x92c]
1:05A5  ff369808          push     word ptr [0x898]
1:05A9  eb7e              jmp      0x629
1:05AB  ff362c09          push     word ptr [0x92c]
1:05AF  b80800            mov      ax, 8
1:05B2  50                push     ax
1:05B3  9a6b000000        lcall    0, 0x6b  ; @1:GDI.GetStockObject
1:05B8  50                push     ax
1:05B9  9ad4050000        lcall    0, 0x5d4  ; @1:GDI.SelectObject
1:05BE  a39808            mov      word ptr [0x898], ax
1:05C1  ff362c09          push     word ptr [0x92c]
1:05C5  b80001            mov      ax, 0x100
1:05C8  50                push     ax
1:05C9  ff369008          push     word ptr [0x890]
1:05CD  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateSolidBrush
1:05D2  50                push     ax
1:05D3  9a1d060000        lcall    0, 0x61d  ; @1:GDI.SelectObject
1:05D8  a39a08            mov      word ptr [0x89a], ax
1:05DB  ff362c09          push     word ptr [0x92c]
1:05DF  a14c09            mov      ax, word ptr [0x94c]
1:05E2  2b069608          sub      ax, word ptr [0x896]
1:05E6  03063a09          add      ax, word ptr [0x93a]
1:05EA  50                push     ax
1:05EB  a14e09            mov      ax, word ptr [0x94e]
1:05EE  2b063a09          sub      ax, word ptr [0x93a]
1:05F2  2b062a09          sub      ax, word ptr [0x92a]
1:05F6  50                push     ax
1:05F7  a14c09            mov      ax, word ptr [0x94c]
1:05FA  03063a09          add      ax, word ptr [0x93a]
1:05FE  03069608          add      ax, word ptr [0x896]
1:0602  50                push     ax
1:0603  a12a09            mov      ax, word ptr [0x92a]
1:0606  2b063a09          sub      ax, word ptr [0x93a]
1:060A  03064e09          add      ax, word ptr [0x94e]
1:060E  50                push     ax
1:060F  9affff0000        lcall    0, 0xffff  ; @1:GDI.Ellipse
1:0614  ff362c09          push     word ptr [0x92c]
1:0618  ff369808          push     word ptr [0x898]
1:061C  9a2a060000        lcall    0, 0x62a  ; @1:GDI.SelectObject
1:0621  ff362c09          push     word ptr [0x92c]
1:0625  ff369a08          push     word ptr [0x89a]
1:0629  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectObject
1:062E  50                push     ax
1:062F  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteObject
1:0634  833e460902        cmp      word ptr [0x946], 2
1:0639  750b              jne      0x646
1:063B  ff0e2a09          dec      word ptr [0x92a]
1:063F  832e420901        sub      word ptr [0x942], 1
1:0644  eb0a              jmp      0x650
1:0646  832e2a0902        sub      word ptr [0x92a], 2
1:064B  832e420902        sub      word ptr [0x942], 2
1:0650  831e440900        sbb      word ptr [0x944], 0
1:0655  833e2a0902        cmp      word ptr [0x92a], 2
1:065A  7c03              jl       0x65f
1:065C  e9cf00            jmp      0x72e
1:065F  c7061a000100      mov      word ptr [0x1a], 1
1:0665  0e                push     cs
1:0666  e892fb            call     0x1fb
1:0669  9affff0000        lcall    0, 0xffff  ; @1:USER.GetCurrentTime
1:066E  a32609            mov      word ptr [0x926], ax
1:0671  89162809          mov      word ptr [0x928], dx
1:0675  c41e5009          les      bx, ptr [0x950]
1:0679  268b470c          mov      ax, word ptr es:[bx + 0xc]
1:067D  a39c08            mov      word ptr [0x89c], ax
1:0680  e98000            jmp      0x703
1:0683  a12609            mov      ax, word ptr [0x926]
1:0686  8b162809          mov      dx, word ptr [0x928]
1:068A  a35409            mov      word ptr [0x954], ax
1:068D  89165609          mov      word ptr [0x956], dx
1:0691  e99a00            jmp      0x72e
1:0694  a12609            mov      ax, word ptr [0x926]
1:0697  8b162809          mov      dx, word ptr [0x928]
1:069B  05dc05            add      ax, 0x5dc
1:069E  83d200            adc      dx, 0
1:06A1  ebe7              jmp      0x68a
1:06A3  a12609            mov      ax, word ptr [0x926]
1:06A6  8b162809          mov      dx, word ptr [0x928]
1:06AA  05c409            add      ax, 0x9c4
1:06AD  ebef              jmp      0x69e
1:06AF  a12609            mov      ax, word ptr [0x926]
1:06B2  8b162809          mov      dx, word ptr [0x928]
1:06B6  057c15            add      ax, 0x157c
1:06B9  ebe3              jmp      0x69e
1:06BB  a12609            mov      ax, word ptr [0x926]
1:06BE  8b162809          mov      dx, word ptr [0x928]
1:06C2  050429            add      ax, 0x2904
1:06C5  ebd7              jmp      0x69e
1:06C7  a12609            mov      ax, word ptr [0x926]
1:06CA  8b162809          mov      dx, word ptr [0x928]
1:06CE  051450            add      ax, 0x5014
1:06D1  ebcb              jmp      0x69e
1:06D3  a12609            mov      ax, word ptr [0x926]
1:06D6  8b162809          mov      dx, word ptr [0x928]
1:06DA  052477            add      ax, 0x7724
1:06DD  ebbf              jmp      0x69e
1:06DF  a12609            mov      ax, word ptr [0x926]
1:06E2  8b162809          mov      dx, word ptr [0x928]
1:06E6  05349e            add      ax, 0x9e34
1:06E9  ebb3              jmp      0x69e
1:06EB  a12609            mov      ax, word ptr [0x926]
1:06EE  8b162809          mov      dx, word ptr [0x928]
1:06F2  0544c5            add      ax, 0xc544
1:06F5  eba7              jmp      0x69e
1:06F7  a12609            mov      ax, word ptr [0x926]
1:06FA  8b162809          mov      dx, word ptr [0x928]
1:06FE  0554ec            add      ax, 0xec54
1:0701  eb9b              jmp      0x69e
1:0703  3d6400            cmp      ax, 0x64
1:0706  77ef              ja       0x6f7
1:0708  b30a              mov      bl, 0xa
1:070A  f6f3              div      bl
1:070C  0ae4              or       ah, ah
1:070E  75e7              jne      0x6f7
1:0710  d1e0              shl      ax, 1
1:0712  93                xchg     bx, ax
1:0713  2effa71807        jmp      word ptr cs:[bx + 0x718]
1:0718  83069406a3        add      word ptr [0x694], -0x5d
1:071D  06                push     es
1:071E  af                scasw    ax, word ptr es:[di]
1:071F  06                push     es
1:0720  bb06c7            mov      bx, 0xc706
1:0723  06                push     es
1:0724  d306df06          rol      word ptr [0x6df], cl
1:0728  eb06              jmp      0x730
1:072A  f706f7064d4d      test     word ptr [0x6f7], 0x4d4d
1:0730  8be5              mov      sp, bp
1:0732  1f                pop      ds
1:0733  5d                pop      bp
1:0734  4d                dec      bp
1:0735  cb                retf     
1:0736  1e                push     ds
1:0737  58                pop      ax
1:0738  90                nop      
1:0739  45                inc      bp
1:073A  55                push     bp
1:073B  8bec              mov      bp, sp
1:073D  1e                push     ds
1:073E  8ed8              mov      ds, ax
1:0740  83ec06            sub      sp, 6
1:0743  b86400            mov      ax, 0x64
1:0746  c41e5009          les      bx, ptr [0x950]
1:074A  262b470a          sub      ax, word ptr es:[bx + 0xa]
1:074E  3b063609          cmp      ax, word ptr [0x936]
1:0752  7f2a              jg       0x77e
1:0754  a1a208            mov      ax, word ptr [0x8a2]
1:0757  8b16a408          mov      dx, word ptr [0x8a4]
1:075B  8306a20801        add      word ptr [0x8a2], 1
1:0760  8316a40800        adc      word ptr [0x8a4], 0
1:0765  0bd2              or       dx, dx
1:0767  7c0f              jl       0x778
1:0769  7f05              jg       0x770
1:076B  3dea00            cmp      ax, 0xea
1:076E  7208              jb       0x778
1:0770  2bc0              sub      ax, ax
1:0772  a3a408            mov      word ptr [0x8a4], ax
1:0775  a3a208            mov      word ptr [0x8a2], ax
1:0778  c70636090000      mov      word ptr [0x936], 0
1:077E  ff063609          inc      word ptr [0x936]
1:0782  ff362c09          push     word ptr [0x92c]
1:0786  b80800            mov      ax, 8
1:0789  50                push     ax
1:078A  9a17050000        lcall    0, 0x517  ; @1:GDI.GetStockObject
1:078F  50                push     ax
1:0790  9aab070000        lcall    0, 0x7ab  ; @1:GDI.SelectObject
1:0795  a3b408            mov      word ptr [0x8b4], ax
1:0798  ff362c09          push     word ptr [0x92c]
1:079C  b80001            mov      ax, 0x100
1:079F  50                push     ax
1:07A0  ff36a208          push     word ptr [0x8a2]
1:07A4  9a40050000        lcall    0, 0x540  ; @1:GDI.CreateSolidBrush
1:07A9  50                push     ax
1:07AA  9a57090000        lcall    0, 0x957  ; @1:GDI.SelectObject
1:07AF  a3b608            mov      word ptr [0x8b6], ax
1:07B2  c41e3209          les      bx, ptr [0x932]
1:07B6  268b470c          mov      ax, word ptr es:[bx + 0xc]
1:07BA  99                cdq      
1:07BB  52                push     dx
1:07BC  50                push     ax
1:07BD  ff364409          push     word ptr [0x944]
1:07C1  ff364209          push     word ptr [0x942]
1:07C5  268b470e          mov      ax, word ptr es:[bx + 0xe]
1:07C9  99                cdq      
1:07CA  52                push     dx
1:07CB  50                push     ax
1:07CC  9aca040000        lcall    0, 0x4ca  ; @1:INT:ord_6(1:0EB4)
1:07D1  52                push     dx
1:07D2  50                push     ax
1:07D3  9ad1040000        lcall    0, 0x4d1  ; @1:INT:ord_5(1:0EE6)
1:07D8  a3b208            mov      word ptr [0x8b2], ax
1:07DB  a14c09            mov      ax, word ptr [0x94c]
1:07DE  2b06b208          sub      ax, word ptr [0x8b2]
1:07E2  a3a008            mov      word ptr [0x8a0], ax
1:07E5  a14e09            mov      ax, word ptr [0x94e]
1:07E8  2b06b208          sub      ax, word ptr [0x8b2]
1:07EC  a3a608            mov      word ptr [0x8a6], ax
1:07EF  a14c09            mov      ax, word ptr [0x94c]
1:07F2  0306b208          add      ax, word ptr [0x8b2]
1:07F6  a3a808            mov      word ptr [0x8a8], ax
1:07F9  a1b208            mov      ax, word ptr [0x8b2]
1:07FC  03064e09          add      ax, word ptr [0x94e]
1:0800  a3ac08            mov      word ptr [0x8ac], ax
1:0803  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0804  df063c09          fild     word ptr [0x93c]
1:0808  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0809  dc0ec804          fmul     qword ptr [0x4c8]
1:080D  83ec08            sub      sp, 8
1:0810  8bdc              mov      bx, sp
1:0812  9b                wait       ; @0:OSFIXUP:FISRQQ/FJSRQQ (add,t=5)
1:0813  36dd1f            fstp     qword ptr ss:[bx]
1:0816  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:0817  9b                wait     
1:0818  9aa1080000        lcall    0, 0x8a1  ; @1:INT:ord_9(1:0F4C)
1:081D  83c408            add      sp, 8
1:0820  8bd8              mov      bx, ax
1:0822  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0823  dd07              fld      qword ptr [bx]
1:0825  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0826  dc0ed004          fmul     qword ptr [0x4d0]
1:082A  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:082B  de0eb208          fimul    word ptr [0x8b2]
1:082F  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0830  dc0ed804          fmul     qword ptr [0x4d8]
1:0834  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0835  de064c09          fiadd    word ptr [0x94c]
1:0839  9a78080000        lcall    0, 0x878  ; @1:INT:ord_7(1:0F66)
1:083E  a3ae08            mov      word ptr [0x8ae], ax
1:0841  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0842  df063c09          fild     word ptr [0x93c]
1:0846  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0847  dc0ec804          fmul     qword ptr [0x4c8]
1:084B  83ec08            sub      sp, 8
1:084E  8bdc              mov      bx, sp
1:0850  9b                wait       ; @0:OSFIXUP:FISRQQ/FJSRQQ (add,t=5)
1:0851  36dd1f            fstp     qword ptr ss:[bx]
1:0854  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:0855  9b                wait     
1:0856  9aeb080000        lcall    0, 0x8eb  ; @1:INT:ord_8(1:0F46)
1:085B  83c408            add      sp, 8
1:085E  8bd8              mov      bx, ax
1:0860  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0861  dd07              fld      qword ptr [bx]
1:0863  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0864  dc0ed004          fmul     qword ptr [0x4d0]
1:0868  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0869  de0eb208          fimul    word ptr [0x8b2]
1:086D  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:086E  dc0ed804          fmul     qword ptr [0x4d8]
1:0872  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0873  de064e09          fiadd    word ptr [0x94e]
1:0877  9ac2080000        lcall    0, 0x8c2  ; @1:INT:ord_7(1:0F66)
1:087C  a3b008            mov      word ptr [0x8b0], ax
1:087F  a12e09            mov      ax, word ptr [0x92e]
1:0882  03063c09          add      ax, word ptr [0x93c]
1:0886  050300            add      ax, 3
1:0889  8946fa            mov      word ptr [bp - 6], ax
1:088C  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:088D  df46fa            fild     word ptr [bp - 6]
1:0890  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0891  dc0ec804          fmul     qword ptr [0x4c8]
1:0895  83ec08            sub      sp, 8
1:0898  8bdc              mov      bx, sp
1:089A  9b                wait       ; @0:OSFIXUP:FISRQQ/FJSRQQ (add,t=5)
1:089B  36dd1f            fstp     qword ptr ss:[bx]
1:089E  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:089F  9b                wait     
1:08A0  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:0F4C)
1:08A5  83c408            add      sp, 8
1:08A8  8bd8              mov      bx, ax
1:08AA  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:08AB  dd07              fld      qword ptr [bx]
1:08AD  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:08AE  dc0ed004          fmul     qword ptr [0x4d0]
1:08B2  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:08B3  de0eb208          fimul    word ptr [0x8b2]
1:08B7  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:08B8  dc0ed804          fmul     qword ptr [0x4d8]
1:08BC  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:08BD  de064c09          fiadd    word ptr [0x94c]
1:08C1  9a0c090000        lcall    0, 0x90c  ; @1:INT:ord_7(1:0F66)
1:08C6  a3b808            mov      word ptr [0x8b8], ax
1:08C9  a12e09            mov      ax, word ptr [0x92e]
1:08CC  03063c09          add      ax, word ptr [0x93c]
1:08D0  050300            add      ax, 3
1:08D3  8946fa            mov      word ptr [bp - 6], ax
1:08D6  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:08D7  df46fa            fild     word ptr [bp - 6]
1:08DA  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:08DB  dc0ec804          fmul     qword ptr [0x4c8]
1:08DF  83ec08            sub      sp, 8
1:08E2  8bdc              mov      bx, sp
1:08E4  9b                wait       ; @0:OSFIXUP:FISRQQ/FJSRQQ (add,t=5)
1:08E5  36dd1f            fstp     qword ptr ss:[bx]
1:08E8  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:08E9  9b                wait     
1:08EA  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:0F46)
1:08EF  83c408            add      sp, 8
1:08F2  8bd8              mov      bx, ax
1:08F4  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:08F5  dd07              fld      qword ptr [bx]
1:08F7  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:08F8  dc0ed004          fmul     qword ptr [0x4d0]
1:08FC  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:08FD  de0eb208          fimul    word ptr [0x8b2]
1:0901  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0902  dc0ed804          fmul     qword ptr [0x4d8]
1:0906  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0907  de064e09          fiadd    word ptr [0x94e]
1:090B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:0F66)
1:0910  a39e08            mov      word ptr [0x89e], ax
1:0913  a1b808            mov      ax, word ptr [0x8b8]
1:0916  3906ae08          cmp      word ptr [0x8ae], ax
1:091A  7509              jne      0x925
1:091C  a19e08            mov      ax, word ptr [0x89e]
1:091F  3906b008          cmp      word ptr [0x8b0], ax
1:0923  7429              je       0x94e
1:0925  ff362c09          push     word ptr [0x92c]
1:0929  ff36a008          push     word ptr [0x8a0]
1:092D  ff36a608          push     word ptr [0x8a6]
1:0931  ff36a808          push     word ptr [0x8a8]
1:0935  ff36ac08          push     word ptr [0x8ac]
1:0939  ff36b808          push     word ptr [0x8b8]
1:093D  ff369e08          push     word ptr [0x89e]
1:0941  ff36ae08          push     word ptr [0x8ae]
1:0945  ff36b008          push     word ptr [0x8b0]
1:0949  9affff0000        lcall    0, 0xffff  ; @1:GDI.Pie
1:094E  ff362c09          push     word ptr [0x92c]
1:0952  ff36b408          push     word ptr [0x8b4]
1:0956  9a64090000        lcall    0, 0x964  ; @1:GDI.SelectObject
1:095B  ff362c09          push     word ptr [0x92c]
1:095F  ff36b608          push     word ptr [0x8b6]
1:0963  9a07050000        lcall    0, 0x507  ; @1:GDI.SelectObject
1:0968  50                push     ax
1:0969  9a30060000        lcall    0, 0x630  ; @1:GDI.DeleteObject
1:096E  a12e09            mov      ax, word ptr [0x92e]
1:0971  01063c09          add      word ptr [0x93c], ax
1:0975  b86400            mov      ax, 0x64
1:0978  c41e5009          les      bx, ptr [0x950]
1:097C  262b4708          sub      ax, word ptr es:[bx + 8]
1:0980  3b064009          cmp      ax, word ptr [0x940]
1:0984  7d14              jge      0x99a
1:0986  ff0e2a09          dec      word ptr [0x92a]
1:098A  832e420901        sub      word ptr [0x942], 1
1:098F  831e440900        sbb      word ptr [0x944], 0
1:0994  c70640090000      mov      word ptr [0x940], 0
1:099A  ff064009          inc      word ptr [0x940]
1:099E  833e2a0902        cmp      word ptr [0x92a], 2
1:09A3  7c03              jl       0x9a8
1:09A5  e9cf00            jmp      0xa77
1:09A8  c7061a000100      mov      word ptr [0x1a], 1
1:09AE  0e                push     cs
1:09AF  e849f8            call     0x1fb
1:09B2  9a6a060000        lcall    0, 0x66a  ; @1:USER.GetCurrentTime
1:09B7  a32609            mov      word ptr [0x926], ax
1:09BA  89162809          mov      word ptr [0x928], dx
1:09BE  c41e5009          les      bx, ptr [0x950]
1:09C2  268b470c          mov      ax, word ptr es:[bx + 0xc]
1:09C6  a3ba08            mov      word ptr [0x8ba], ax
1:09C9  e98000            jmp      0xa4c
1:09CC  a12609            mov      ax, word ptr [0x926]
1:09CF  8b162809          mov      dx, word ptr [0x928]
1:09D3  a35409            mov      word ptr [0x954], ax
1:09D6  89165609          mov      word ptr [0x956], dx
1:09DA  e99a00            jmp      0xa77
1:09DD  a12609            mov      ax, word ptr [0x926]
1:09E0  8b162809          mov      dx, word ptr [0x928]
1:09E4  05dc05            add      ax, 0x5dc
1:09E7  83d200            adc      dx, 0
1:09EA  ebe7              jmp      0x9d3
1:09EC  a12609            mov      ax, word ptr [0x926]
1:09EF  8b162809          mov      dx, word ptr [0x928]
1:09F3  05c409            add      ax, 0x9c4
1:09F6  ebef              jmp      0x9e7
1:09F8  a12609            mov      ax, word ptr [0x926]
1:09FB  8b162809          mov      dx, word ptr [0x928]
1:09FF  057c15            add      ax, 0x157c
1:0A02  ebe3              jmp      0x9e7
1:0A04  a12609            mov      ax, word ptr [0x926]
1:0A07  8b162809          mov      dx, word ptr [0x928]
1:0A0B  050429            add      ax, 0x2904
1:0A0E  ebd7              jmp      0x9e7
1:0A10  a12609            mov      ax, word ptr [0x926]
1:0A13  8b162809          mov      dx, word ptr [0x928]
1:0A17  051450            add      ax, 0x5014
1:0A1A  ebcb              jmp      0x9e7
1:0A1C  a12609            mov      ax, word ptr [0x926]
1:0A1F  8b162809          mov      dx, word ptr [0x928]
1:0A23  052477            add      ax, 0x7724
1:0A26  ebbf              jmp      0x9e7
1:0A28  a12609            mov      ax, word ptr [0x926]
1:0A2B  8b162809          mov      dx, word ptr [0x928]
1:0A2F  05349e            add      ax, 0x9e34
1:0A32  ebb3              jmp      0x9e7
1:0A34  a12609            mov      ax, word ptr [0x926]
1:0A37  8b162809          mov      dx, word ptr [0x928]
1:0A3B  0544c5            add      ax, 0xc544
1:0A3E  eba7              jmp      0x9e7
1:0A40  a12609            mov      ax, word ptr [0x926]
1:0A43  8b162809          mov      dx, word ptr [0x928]
1:0A47  0554ec            add      ax, 0xec54
1:0A4A  eb9b              jmp      0x9e7
1:0A4C  3d6400            cmp      ax, 0x64
1:0A4F  7726              ja       0xa77
1:0A51  b30a              mov      bl, 0xa
1:0A53  f6f3              div      bl
1:0A55  0ae4              or       ah, ah
1:0A57  751e              jne      0xa77
1:0A59  d1e0              shl      ax, 1
1:0A5B  93                xchg     bx, ax
1:0A5C  2effa7610a        jmp      word ptr cs:[bx + 0xa61]
1:0A61  cc                int3     
1:0A62  09dd              or       bp, bx
1:0A64  09ec              or       sp, bp
1:0A66  09f8              or       ax, di
1:0A68  0904              or       word ptr [si], ax
1:0A6A  0a10              or       dl, byte ptr [bx + si]
1:0A6C  0a1c              or       bl, byte ptr [si]
1:0A6E  0a28              or       ch, byte ptr [bx + si]
1:0A70  0a34              or       dh, byte ptr [si]
1:0A72  0a770a            or       dh, byte ptr [bx + 0xa]
1:0A75  40                inc      ax
1:0A76  0a4d4d            or       cl, byte ptr [di + 0x4d]
1:0A79  8be5              mov      sp, bp
1:0A7B  1f                pop      ds
1:0A7C  5d                pop      bp
1:0A7D  4d                dec      bp
1:0A7E  cb                retf     
1:0A7F  1e                push     ds
1:0A80  58                pop      ax
1:0A81  90                nop      
1:0A82  45                inc      bp
1:0A83  55                push     bp
1:0A84  8bec              mov      bp, sp
1:0A86  1e                push     ds
1:0A87  8ed8              mov      ds, ax
1:0A89  56                push     si
1:0A8A  c41e5009          les      bx, ptr [0x950]
1:0A8E  26c45f1a          les      bx, ptr es:[bx + 0x1a]
1:0A92  268b4704          mov      ax, word ptr es:[bx + 4]
1:0A96  268b5706          mov      dx, word ptr es:[bx + 6]
1:0A9A  a3ca08            mov      word ptr [0x8ca], ax
1:0A9D  8916cc08          mov      word ptr [0x8cc], dx
1:0AA1  c706c6080000      mov      word ptr [0x8c6], 0
1:0AA7  eb1d              jmp      0xac6
1:0AA9  a1c608            mov      ax, word ptr [0x8c6]
1:0AAC  d1e0              shl      ax, 1
1:0AAE  d1e0              shl      ax, 1
1:0AB0  03d8              add      bx, ax
1:0AB2  268b4708          mov      ax, word ptr es:[bx + 8]
1:0AB6  268b570a          mov      dx, word ptr es:[bx + 0xa]
1:0ABA  26894704          mov      word ptr es:[bx + 4], ax
1:0ABE  26895706          mov      word ptr es:[bx + 6], dx
1:0AC2  ff06c608          inc      word ptr [0x8c6]
1:0AC6  c41e5009          les      bx, ptr [0x950]
1:0ACA  26c45f1a          les      bx, ptr es:[bx + 0x1a]
1:0ACE  268b4702          mov      ax, word ptr es:[bx + 2]
1:0AD2  48                dec      ax
1:0AD3  3b06c608          cmp      ax, word ptr [0x8c6]
1:0AD7  77d0              ja       0xaa9
1:0AD9  a1ca08            mov      ax, word ptr [0x8ca]
1:0ADC  8b16cc08          mov      dx, word ptr [0x8cc]
1:0AE0  8b1ec608          mov      bx, word ptr [0x8c6]
1:0AE4  d1e3              shl      bx, 1
1:0AE6  d1e3              shl      bx, 1
1:0AE8  c4365009          les      si, ptr [0x950]
1:0AEC  26c4741a          les      si, ptr es:[si + 0x1a]
1:0AF0  26894004          mov      word ptr es:[bx + si + 4], ax
1:0AF4  26895006          mov      word ptr es:[bx + si + 6], dx
1:0AF8  c41e5009          les      bx, ptr [0x950]
1:0AFC  26ff7718          push     word ptr es:[bx + 0x18]
1:0B00  2bc0              sub      ax, ax
1:0B02  50                push     ax
1:0B03  26c45f1a          les      bx, ptr es:[bx + 0x1a]
1:0B07  26ff7702          push     word ptr es:[bx + 2]
1:0B0B  8d4704            lea      ax, [bx + 4]
1:0B0E  06                push     es
1:0B0F  50                push     ax
1:0B10  9affff0000        lcall    0, 0xffff  ; @1:GDI.AnimatePalette
1:0B15  9adf0b0000        lcall    0, 0xbdf  ; @1:USER.GetCurrentTime
1:0B1A  a32609            mov      word ptr [0x926], ax
1:0B1D  89162809          mov      word ptr [0x928], dx
1:0B21  39165609          cmp      word ptr [0x956], dx
1:0B25  770e              ja       0xb35
1:0B27  7206              jb       0xb2f
1:0B29  39065409          cmp      word ptr [0x954], ax
1:0B2D  7706              ja       0xb35
1:0B2F  c7061a000000      mov      word ptr [0x1a], 0
1:0B35  5e                pop      si
1:0B36  4d                dec      bp
1:0B37  4d                dec      bp
1:0B38  8be5              mov      sp, bp
1:0B3A  1f                pop      ds
1:0B3B  5d                pop      bp
1:0B3C  4d                dec      bp
1:0B3D  cb                retf     
1:0B3E  1e                push     ds
1:0B3F  58                pop      ax
1:0B40  90                nop      
1:0B41  45                inc      bp
1:0B42  55                push     bp
1:0B43  8bec              mov      bp, sp
1:0B45  1e                push     ds
1:0B46  8ed8              mov      ds, ax
1:0B48  56                push     si
1:0B49  c606d20800        mov      byte ptr [0x8d2], 0
1:0B4E  eb74              jmp      0xbc4
1:0B50  8bcb              mov      cx, bx
1:0B52  8bd8              mov      bx, ax
1:0B54  d1e3              shl      bx, 1
1:0B56  d1e3              shl      bx, 1
1:0B58  8bf1              mov      si, cx
1:0B5A  a0d608            mov      al, byte ptr [0x8d6]
1:0B5D  26884004          mov      byte ptr es:[bx + si + 4], al
1:0B61  a0d008            mov      al, byte ptr [0x8d0]
1:0B64  8a1ed208          mov      bl, byte ptr [0x8d2]
1:0B68  2aff              sub      bh, bh
1:0B6A  d1e3              shl      bx, 1
1:0B6C  d1e3              shl      bx, 1
1:0B6E  c4365009          les      si, ptr [0x950]
1:0B72  26c4741a          les      si, ptr es:[si + 0x1a]
1:0B76  26884005          mov      byte ptr es:[bx + si + 5], al
1:0B7A  a0d108            mov      al, byte ptr [0x8d1]
1:0B7D  8a1ed208          mov      bl, byte ptr [0x8d2]
1:0B81  2aff              sub      bh, bh
1:0B83  d1e3              shl      bx, 1
1:0B85  d1e3              shl      bx, 1
1:0B87  c4365009          les      si, ptr [0x950]
1:0B8B  26c4741a          les      si, ptr es:[si + 0x1a]
1:0B8F  26884006          mov      byte ptr es:[bx + si + 6], al
1:0B93  9aa30b0000        lcall    0, 0xba3  ; @1:INT:ord_4(1:0E84)
1:0B98  b1ff              mov      cl, 0xff
1:0B9A  2ae4              sub      ah, ah
1:0B9C  f6f1              div      cl
1:0B9E  8826d608          mov      byte ptr [0x8d6], ah
1:0BA2  9ab20b0000        lcall    0, 0xbb2  ; @1:INT:ord_4(1:0E84)
1:0BA7  b1ff              mov      cl, 0xff
1:0BA9  2ae4              sub      ah, ah
1:0BAB  f6f1              div      cl
1:0BAD  8826d008          mov      byte ptr [0x8d0], ah
1:0BB1  9ade030000        lcall    0, 0x3de  ; @1:INT:ord_4(1:0E84)
1:0BB6  b1ff              mov      cl, 0xff
1:0BB8  2ae4              sub      ah, ah
1:0BBA  f6f1              div      cl
1:0BBC  8826d108          mov      byte ptr [0x8d1], ah
1:0BC0  fe06d208          inc      byte ptr [0x8d2]
1:0BC4  a0d208            mov      al, byte ptr [0x8d2]
1:0BC7  2ae4              sub      ah, ah
1:0BC9  c41e5009          les      bx, ptr [0x950]
1:0BCD  26c45f1a          les      bx, ptr es:[bx + 0x1a]
1:0BD1  26394702          cmp      word ptr es:[bx + 2], ax
1:0BD5  7603              jbe      0xbda
1:0BD7  e976ff            jmp      0xb50
1:0BDA  0e                push     cs
1:0BDB  e8a1fe            call     0xa7f
1:0BDE  9ab3090000        lcall    0, 0x9b3  ; @1:USER.GetCurrentTime
1:0BE3  a35409            mov      word ptr [0x954], ax
1:0BE6  89165609          mov      word ptr [0x956], dx
1:0BEA  5e                pop      si
1:0BEB  4d                dec      bp
1:0BEC  4d                dec      bp
1:0BED  8be5              mov      sp, bp
1:0BEF  1f                pop      ds
1:0BF0  5d                pop      bp
1:0BF1  4d                dec      bp
1:0BF2  cb                retf     
1:0BF3  001e5890          add      byte ptr [0x9058], bl
1:0BF7  45                inc      bp
1:0BF8  55                push     bp
1:0BF9  8bec              mov      bp, sp
1:0BFB  1e                push     ds
1:0BFC  8ed8              mov      ds, ax
1:0BFE  837e0a00          cmp      word ptr [bp + 0xa], 0
1:0C02  7504              jne      0xc08
1:0C04  2bc0              sub      ax, ax
1:0C06  eb09              jmp      0xc11
1:0C08  8b460e            mov      ax, word ptr [bp + 0xe]
1:0C0B  a33e09            mov      word ptr [0x93e], ax
1:0C0E  b80100            mov      ax, 1
1:0C11  4d                dec      bp
1:0C12  4d                dec      bp
1:0C13  8be5              mov      sp, bp
1:0C15  1f                pop      ds
1:0C16  5d                pop      bp
1:0C17  4d                dec      bp
1:0C18  ca0a00            retf     0xa

; ===== EXPORT:WEP(#2) =====
1:0C1B  1e                push     ds
1:0C1C  58                pop      ax
1:0C1D  90                nop      
1:0C1E  45                inc      bp
1:0C1F  55                push     bp
1:0C20  8bec              mov      bp, sp
1:0C22  1e                push     ds
1:0C23  8ed8              mov      ds, ax
1:0C25  b80100            mov      ax, 1
1:0C28  4d                dec      bp
1:0C29  4d                dec      bp
1:0C2A  8be5              mov      sp, bp
1:0C2C  1f                pop      ds
1:0C2D  5d                pop      bp
1:0C2E  4d                dec      bp
1:0C2F  ca0200            retf     2

; ===== EXPORT:MODULE(#1) =====
1:0C32  1e                push     ds
1:0C33  58                pop      ax
1:0C34  90                nop      
1:0C35  45                inc      bp
1:0C36  55                push     bp
1:0C37  8bec              mov      bp, sp
1:0C39  1e                push     ds
1:0C3A  8ed8              mov      ds, ax
1:0C3C  83ec0a            sub      sp, 0xa
1:0C3F  56                push     si
1:0C40  8b4608            mov      ax, word ptr [bp + 8]
1:0C43  a32c09            mov      word ptr [0x92c], ax
1:0C46  8b4606            mov      ax, word ptr [bp + 6]
1:0C49  a32009            mov      word ptr [0x920], ax
1:0C4C  50                push     ax
1:0C4D  9a6d0c0000        lcall    0, 0xc6d  ; @1:KERNEL.GlobalLock
1:0C52  a33209            mov      word ptr [0x932], ax
1:0C55  89163409          mov      word ptr [0x934], dx
1:0C59  8bc2              mov      ax, dx
1:0C5B  0b063209          or       ax, word ptr [0x932]
1:0C5F  7503              jne      0xc64
1:0C61  e96a01            jmp      0xdce
1:0C64  c41e3209          les      bx, ptr [0x932]
1:0C68  26ff7720          push     word ptr es:[bx + 0x20]
1:0C6C  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalLock
1:0C71  a35009            mov      word ptr [0x950], ax
1:0C74  89165209          mov      word ptr [0x952], dx
1:0C78  8bc2              mov      ax, dx
1:0C7A  0b065009          or       ax, word ptr [0x950]
1:0C7E  7503              jne      0xc83
1:0C80  e94201            jmp      0xdc5
1:0C83  8b460a            mov      ax, word ptr [bp + 0xa]
1:0C86  e90801            jmp      0xd91
1:0C89  c41e3209          les      bx, ptr [0x932]
1:0C8D  26837f1465        cmp      word ptr es:[bx + 0x14], 0x65
1:0C92  7c0f              jl       0xca3
1:0C94  26817f36f400      cmp      word ptr es:[bx + 0x36], 0xf4
1:0C9A  7507              jne      0xca3
1:0C9C  26837f3878        cmp      word ptr es:[bx + 0x38], 0x78
1:0CA1  740e              je       0xcb1
1:0CA3  c7061c000000      mov      word ptr [0x1c], 0
1:0CA9  c746fc0500        mov      word ptr [bp - 4], 5
1:0CAE  e90701            jmp      0xdb8
1:0CB1  c7061c000100      mov      word ptr [0x1c], 1
1:0CB7  e9fe00            jmp      0xdb8
1:0CBA  b8d808            mov      ax, 0x8d8
1:0CBD  50                push     ax
1:0CBE  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_19(1:0E0E)
1:0CC3  5b                pop      bx
1:0CC4  ff36d808          push     word ptr [0x8d8]
1:0CC8  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_18(1:0E70)
1:0CCD  5b                pop      bx
1:0CCE  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_17(1:0012)
1:0CD3  eb13              jmp      0xce8
1:0CD5  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_16(1:0039)
1:0CDA  eb0c              jmp      0xce8
1:0CDC  833e1c0000        cmp      word ptr [0x1c], 0
1:0CE1  740b              je       0xcee
1:0CE3  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_15(1:00A1)
1:0CE8  8946fc            mov      word ptr [bp - 4], ax
1:0CEB  e9ca00            jmp      0xdb8
1:0CEE  ff362c09          push     word ptr [0x92c]
1:0CF2  b800ff            mov      ax, 0xff00
1:0CF5  baff00            mov      dx, 0xff
1:0CF8  52                push     dx
1:0CF9  50                push     ax
1:0CFA  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextColor
1:0CFF  ff362c09          push     word ptr [0x92c]
1:0D03  2bc0              sub      ax, ax
1:0D05  50                push     ax
1:0D06  50                push     ax
1:0D07  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkColor
1:0D0C  ff362c09          push     word ptr [0x92c]
1:0D10  2bc0              sub      ax, ax
1:0D12  50                push     ax
1:0D13  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextAlign
1:0D18  ff362c09          push     word ptr [0x92c]
1:0D1C  b80100            mov      ax, 1
1:0D1F  50                push     ax
1:0D20  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkMode
1:0D25  ff362c09          push     word ptr [0x92c]
1:0D29  2bc0              sub      ax, ax
1:0D2B  50                push     ax
1:0D2C  50                push     ax
1:0D2D  b81e00            mov      ax, 0x1e
1:0D30  1e                push     ds
1:0D31  50                push     ax
1:0D32  50                push     ax
1:0D33  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_14(1:0DF2)
1:0D38  5b                pop      bx
1:0D39  50                push     ax
1:0D3A  9affff0000        lcall    0, 0xffff  ; @1:GDI.TextOut
1:0D3F  eb77              jmp      0xdb8
1:0D41  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_13(1:011C)
1:0D46  eba0              jmp      0xce8
1:0D48  a13e09            mov      ax, word ptr [0x93e]
1:0D4B  c41e5009          les      bx, ptr [0x950]
1:0D4F  26894716          mov      word ptr es:[bx + 0x16], ax
1:0D53  c746f60000        mov      word ptr [bp - 0xa], 0
1:0D58  8b46f6            mov      ax, word ptr [bp - 0xa]
1:0D5B  8bf0              mov      si, ax
1:0D5D  d1e6              shl      si, 1
1:0D5F  40                inc      ax
1:0D60  c41e5009          les      bx, ptr [0x950]
1:0D64  2689400e          mov      word ptr es:[bx + si + 0xe], ax
1:0D68  ff46f6            inc      word ptr [bp - 0xa]
1:0D6B  837ef604          cmp      word ptr [bp - 0xa], 4
1:0D6F  7ce7              jl       0xd58
1:0D71  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:013F)
1:0D76  e96fff            jmp      0xce8
1:0D79  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:0168)
1:0D7E  e967ff            jmp      0xce8
1:0D81  8b460a            mov      ax, word ptr [bp + 0xa]
1:0D84  2d0700            sub      ax, 7
1:0D87  50                push     ax
1:0D88  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:017C)
1:0D8D  5b                pop      bx
1:0D8E  e957ff            jmp      0xce8
1:0D91  3d0c00            cmp      ax, 0xc
1:0D94  7722              ja       0xdb8
1:0D96  d1e0              shl      ax, 1
1:0D98  93                xchg     bx, ax
1:0D99  2effa79e0d        jmp      word ptr cs:[bx + 0xd9e]
1:0D9E  ba0cd5            mov      dx, 0xd50c
1:0DA1  0cdc              or       al, 0xdc
1:0DA3  0c41              or       al, 0x41
1:0DA5  0db80d            or       ax, 0xdb8
1:0DA8  48                dec      ax
1:0DA9  0d790d            or       ax, 0xd79
1:0DAC  810d810d          or       word ptr [di], 0xd81
1:0DB0  810d810d          or       word ptr [di], 0xd81
1:0DB4  b80d89            mov      ax, 0x890d
1:0DB7  0cc4              or       al, 0xc4
1:0DB9  1e                push     ds
1:0DBA  3209              xor      cl, byte ptr [bx + di]
1:0DBC  26ff7720          push     word ptr es:[bx + 0x20]
1:0DC0  9aca0d0000        lcall    0, 0xdca  ; @1:KERNEL.GlobalUnlock
1:0DC5  ff362009          push     word ptr [0x920]
1:0DC9  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalUnlock
1:0DCE  8b46fc            mov      ax, word ptr [bp - 4]
1:0DD1  5e                pop      si
1:0DD2  4d                dec      bp
1:0DD3  4d                dec      bp
1:0DD4  8be5              mov      sp, bp
1:0DD6  1f                pop      ds
1:0DD7  5d                pop      bp
1:0DD8  4d                dec      bp
1:0DD9  ca0600            retf     6
1:0DDC  0000              add      byte ptr [bx + si], al
1:0DDE  0000              add      byte ptr [bx + si], al
1:0DE0  0000              add      byte ptr [bx + si], al
1:0DE2  0000              add      byte ptr [bx + si], al
1:0DE4  0000              add      byte ptr [bx + si], al
1:0DE6  0000              add      byte ptr [bx + si], al
1:0DE8  0000              add      byte ptr [bx + si], al
1:0DEA  0000              add      byte ptr [bx + si], al
1:0DEC  0000              add      byte ptr [bx + si], al
1:0DEE  0000              add      byte ptr [bx + si], al
1:0DF0  c3                ret      
1:0DF1  00558b            add      byte ptr [di - 0x75], dl
1:0DF4  ec                in       al, dx
1:0DF5  8bd7              mov      dx, di
1:0DF7  8cd8              mov      ax, ds
1:0DF9  8ec0              mov      es, ax
1:0DFB  8b7e06            mov      di, word ptr [bp + 6]
1:0DFE  33c0              xor      ax, ax
1:0E00  b9ffff            mov      cx, 0xffff
1:0E03  f2ae              repne scasb al, byte ptr es:[di]
1:0E05  f7d1              not      cx
1:0E07  49                dec      cx
1:0E08  91                xchg     cx, ax
1:0E09  8bfa              mov      di, dx
1:0E0B  5d                pop      bp
1:0E0C  cb                retf     
1:0E0D  008cd890          add      byte ptr [si - 0x6f28], cl
1:0E11  45                inc      bp
1:0E12  55                push     bp
1:0E13  8bec              mov      bp, sp
1:0E15  1e                push     ds
1:0E16  8ed8              mov      ds, ax
1:0E18  56                push     si
1:0E19  b42a              mov      ah, 0x2a
1:0E1B  cd21              int      0x21
1:0E1D  8bda              mov      bx, dx
1:0E1F  8bf1              mov      si, cx
1:0E21  b42c              mov      ah, 0x2c
1:0E23  cd21              int      0x21
1:0E25  b400              mov      ah, 0
1:0E27  8ac6              mov      al, dh
1:0E29  50                push     ax
1:0E2A  8ac1              mov      al, cl
1:0E2C  50                push     ax
1:0E2D  8ac5              mov      al, ch
1:0E2F  50                push     ax
1:0E30  50                push     ax
1:0E31  b42a              mov      ah, 0x2a
1:0E33  cd21              int      0x21
1:0E35  3bda              cmp      bx, dx
1:0E37  58                pop      ax
1:0E38  7408              je       0xe42
1:0E3A  3c17              cmp      al, 0x17
1:0E3C  7504              jne      0xe42
1:0E3E  8bd3              mov      dx, bx
1:0E40  8bce              mov      cx, si
1:0E42  b400              mov      ah, 0
1:0E44  8ac2              mov      al, dl
1:0E46  50                push     ax
1:0E47  8ac6              mov      al, dh
1:0E49  50                push     ax
1:0E4A  81e9bc07          sub      cx, 0x7bc
1:0E4E  51                push     cx
1:0E4F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_21(1:0FB8)
1:0E54  83c40c            add      sp, 0xc
1:0E57  837e0600          cmp      word ptr [bp + 6], 0
1:0E5B  7408              je       0xe65
1:0E5D  8b5e06            mov      bx, word ptr [bp + 6]
1:0E60  895702            mov      word ptr [bx + 2], dx
1:0E63  8907              mov      word ptr [bx], ax
1:0E65  5e                pop      si
1:0E66  83ed02            sub      bp, 2
1:0E69  8be5              mov      sp, bp
1:0E6B  1f                pop      ds
1:0E6C  5d                pop      bp
1:0E6D  4d                dec      bp
1:0E6E  cb                retf     
1:0E6F  004555            add      byte ptr [di + 0x55], al
1:0E72  8bec              mov      bp, sp
1:0E74  8b4606            mov      ax, word ptr [bp + 6]
1:0E77  a36200            mov      word ptr [0x62], ax
1:0E7A  c70664000000      mov      word ptr [0x64], 0
1:0E80  5d                pop      bp
1:0E81  4d                dec      bp
1:0E82  cb                retf     
1:0E83  90                nop      

; ===== EXPORT:ord_4(#4) =====
1:0E84  45                inc      bp
1:0E85  55                push     bp
1:0E86  8bec              mov      bp, sp
1:0E88  b8fd43            mov      ax, 0x43fd
1:0E8B  ba0300            mov      dx, 3
1:0E8E  52                push     dx
1:0E8F  50                push     ax