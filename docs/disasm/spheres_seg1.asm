File: raw\unpacked\MODULES\SPHERES.AD
Module: 'SPHERES' ('Graphics Module Library')
CS:IP=1:0F7E  SS:SP=0:0000  AutoDS=2  Heap=1024  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (3): KERNEL, GDI, USER
Segments (2):
  SEG  1: CODE off=0x00600 len=0x0FB0 min=0x0FB0 flags=0x0D50 relocs=72
  SEG  2: DATA off=0x01740 len=0x0454 min=0x0454 flags=0x0C71 relocs=0
Exports (30):
  ord   1: SEG1:04DA flags=0x03 MODULE
  ord   2: SEG1:04C3 flags=0x03 WEP
  ord   3: SEG1:0F6A flags=0x03 ___EXPORTEDSTUB
  ord   4: SEG1:0764 flags=0x00 
  ord   5: SEG1:0734 flags=0x00 
  ord   6: SEG1:0830 flags=0x00 
  ord   7: SEG1:07FE flags=0x00 
  ord   8: SEG1:016B flags=0x00 
  ord   9: SEG1:0157 flags=0x00 
  ord  10: SEG1:0143 flags=0x00 
  ord  11: SEG1:00F2 flags=0x00 
  ord  12: SEG1:06A2 flags=0x00 
  ord  13: SEG1:009B flags=0x00 
  ord  14: SEG1:004D flags=0x00 
  ord  15: SEG1:0012 flags=0x00 
  ord  16: SEG1:0720 flags=0x00 
  ord  17: SEG1:06BE flags=0x00 
  ord  18: SEG1:049C flags=0x00 
  ord  19: SEG1:0890 flags=0x00 
  ord  20: SEG1:0AD4 flags=0x00 
  ord  21: SEG1:0994 flags=0x00 
  ord  22: SEG1:0C06 flags=0x00 
  ord  23: SEG1:0C2E flags=0x00 
  ord  24: SEG1:0CD0 flags=0x00 
  ord  25: SEG1:0C94 flags=0x00 
  ord  26: SEG1:0CFA flags=0x00 
  ord  27: SEG1:0C32 flags=0x00 
  ord  28: SEG1:09AE flags=0x00 
  ord  29: SEG1:0E9E flags=0x00 
  ord  30: SEG1:0F5A flags=0x00 
Resources (7):
  TYPE_1000        #1               off=0x01BE0 len=    64
  TYPE_1000        #2               off=0x01C20 len=    64
  TYPE_1000        #3               off=0x01C60 len=    64
  TYPE_1000        #4               off=0x01CA0 len=    32
  TYPE_2000        #10              off=0x01CC0 len=    80
  TYPE_2000        #20              off=0x01D10 len=    16
  TYPE_2000        #30              off=0x01D20 len=   352

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
1:001C  c41e5004          les      bx, ptr [0x450]
1:0020  268b4706          mov      ax, word ptr es:[bx + 6]
1:0024  a31200            mov      word ptr [0x12], ax
1:0027  b86600            mov      ax, 0x66
1:002A  262b4708          sub      ax, word ptr es:[bx + 8]
1:002E  a31400            mov      word ptr [0x14], ax
1:0031  268b470a          mov      ax, word ptr es:[bx + 0xa]
1:0035  40                inc      ax
1:0036  a31000            mov      word ptr [0x10], ax
1:0039  c70638040000      mov      word ptr [0x438], 0
1:003F  0e                push     cs
1:0040  e88201            call     0x1c5
1:0043  2bc0              sub      ax, ax
1:0045  4d                dec      bp
1:0046  4d                dec      bp
1:0047  8be5              mov      sp, bp
1:0049  1f                pop      ds
1:004A  5d                pop      bp
1:004B  4d                dec      bp
1:004C  cb                retf     

; ===== EXPORT:ord_14(#14) =====
1:004D  1e                push     ds
1:004E  58                pop      ax
1:004F  90                nop      
1:0050  45                inc      bp
1:0051  55                push     bp
1:0052  8bec              mov      bp, sp
1:0054  1e                push     ds
1:0055  8ed8              mov      ds, ax
1:0057  c41e5004          les      bx, ptr [0x450]
1:005B  26837f0c00        cmp      word ptr es:[bx + 0xc], 0
1:0060  742e              je       0x90
1:0062  b8c003            mov      ax, 0x3c0
1:0065  1e                push     ds
1:0066  50                push     ax
1:0067  2bc0              sub      ax, ax
1:0069  50                push     ax
1:006A  50                push     ax
1:006B  26ff7702          push     word ptr es:[bx + 2]
1:006F  26ff7704          push     word ptr es:[bx + 4]
1:0073  9acc000000        lcall    0, 0xcc  ; @1:USER.SetRect
1:0078  ff362c04          push     word ptr [0x42c]
1:007C  b8c003            mov      ax, 0x3c0
1:007F  1e                push     ds
1:0080  50                push     ax
1:0081  b80400            mov      ax, 4
1:0084  50                push     ax
1:0085  9ade000000        lcall    0, 0xde  ; @1:GDI.GetStockObject
1:008A  50                push     ax
1:008B  9ae4000000        lcall    0, 0xe4  ; @1:USER.FillRect
1:0090  b80d00            mov      ax, 0xd
1:0093  4d                dec      bp
1:0094  4d                dec      bp
1:0095  8be5              mov      sp, bp
1:0097  1f                pop      ds
1:0098  5d                pop      bp
1:0099  4d                dec      bp
1:009A  cb                retf     

; ===== EXPORT:ord_13(#13) =====
1:009B  1e                push     ds
1:009C  58                pop      ax
1:009D  90                nop      
1:009E  45                inc      bp
1:009F  55                push     bp
1:00A0  8bec              mov      bp, sp
1:00A2  1e                push     ds
1:00A3  8ed8              mov      ds, ax
1:00A5  0e                push     cs
1:00A6  e86c02            call     0x315
1:00A9  a11000            mov      ax, word ptr [0x10]
1:00AC  39063804          cmp      word ptr [0x438], ax
1:00B0  7c36              jl       0xe8
1:00B2  0e                push     cs
1:00B3  e85cff            call     0x12
1:00B6  b8c803            mov      ax, 0x3c8
1:00B9  1e                push     ds
1:00BA  50                push     ax
1:00BB  2bc0              sub      ax, ax
1:00BD  50                push     ax
1:00BE  50                push     ax
1:00BF  c41e5004          les      bx, ptr [0x450]
1:00C3  26ff7702          push     word ptr es:[bx + 2]
1:00C7  26ff7704          push     word ptr es:[bx + 4]
1:00CB  9a1d010000        lcall    0, 0x11d  ; @1:USER.SetRect
1:00D0  ff362c04          push     word ptr [0x42c]
1:00D4  b8c803            mov      ax, 0x3c8
1:00D7  1e                push     ds
1:00D8  50                push     ax
1:00D9  b80400            mov      ax, 4
1:00DC  50                push     ax
1:00DD  9a2f010000        lcall    0, 0x12f  ; @1:GDI.GetStockObject
1:00E2  50                push     ax
1:00E3  9a35010000        lcall    0, 0x135  ; @1:USER.FillRect
1:00E8  2bc0              sub      ax, ax
1:00EA  4d                dec      bp
1:00EB  4d                dec      bp
1:00EC  8be5              mov      sp, bp
1:00EE  1f                pop      ds
1:00EF  5d                pop      bp
1:00F0  4d                dec      bp
1:00F1  cb                retf     

; ===== EXPORT:ord_11(#11) =====
1:00F2  1e                push     ds
1:00F3  58                pop      ax
1:00F4  90                nop      
1:00F5  45                inc      bp
1:00F6  55                push     bp
1:00F7  8bec              mov      bp, sp
1:00F9  1e                push     ds
1:00FA  8ed8              mov      ds, ax
1:00FC  c41e3204          les      bx, ptr [0x432]
1:0100  26837f2800        cmp      word ptr es:[bx + 0x28], 0
1:0105  7532              jne      0x139
1:0107  b8d003            mov      ax, 0x3d0
1:010A  1e                push     ds
1:010B  50                push     ax
1:010C  2bc0              sub      ax, ax
1:010E  50                push     ax
1:010F  50                push     ax
1:0110  c41e5004          les      bx, ptr [0x450]
1:0114  26ff7702          push     word ptr es:[bx + 2]
1:0118  26ff7704          push     word ptr es:[bx + 4]
1:011C  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:0121  ff362c04          push     word ptr [0x42c]
1:0125  b8d003            mov      ax, 0x3d0
1:0128  1e                push     ds
1:0129  50                push     ax
1:012A  b80400            mov      ax, 4
1:012D  50                push     ax
1:012E  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:0133  50                push     ax
1:0134  9affff0000        lcall    0, 0xffff  ; @1:USER.FillRect
1:0139  2bc0              sub      ax, ax
1:013B  4d                dec      bp
1:013C  4d                dec      bp
1:013D  8be5              mov      sp, bp
1:013F  1f                pop      ds
1:0140  5d                pop      bp
1:0141  4d                dec      bp
1:0142  cb                retf     

; ===== EXPORT:ord_10(#10) =====
1:0143  1e                push     ds
1:0144  58                pop      ax
1:0145  90                nop      
1:0146  45                inc      bp
1:0147  55                push     bp
1:0148  8bec              mov      bp, sp
1:014A  1e                push     ds
1:014B  8ed8              mov      ds, ax
1:014D  2bc0              sub      ax, ax
1:014F  4d                dec      bp
1:0150  4d                dec      bp
1:0151  8be5              mov      sp, bp
1:0153  1f                pop      ds
1:0154  5d                pop      bp
1:0155  4d                dec      bp
1:0156  cb                retf     

; ===== EXPORT:ord_9(#9) =====
1:0157  1e                push     ds
1:0158  58                pop      ax
1:0159  90                nop      
1:015A  45                inc      bp
1:015B  55                push     bp
1:015C  8bec              mov      bp, sp
1:015E  1e                push     ds
1:015F  8ed8              mov      ds, ax
1:0161  2bc0              sub      ax, ax
1:0163  4d                dec      bp
1:0164  4d                dec      bp
1:0165  8be5              mov      sp, bp
1:0167  1f                pop      ds
1:0168  5d                pop      bp
1:0169  4d                dec      bp
1:016A  cb                retf     

; ===== EXPORT:ord_8(#8) =====
1:016B  1e                push     ds
1:016C  58                pop      ax
1:016D  90                nop      
1:016E  45                inc      bp
1:016F  55                push     bp
1:0170  8bec              mov      bp, sp
1:0172  1e                push     ds
1:0173  8ed8              mov      ds, ax
1:0175  c41e3204          les      bx, ptr [0x432]
1:0179  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:017E  7404              je       0x184
1:0180  2bc0              sub      ax, ax
1:0182  eb39              jmp      0x1bd
1:0184  8b4606            mov      ax, word ptr [bp + 6]
1:0187  0bc0              or       ax, ax
1:0189  7408              je       0x193
1:018B  48                dec      ax
1:018C  7412              je       0x1a0
1:018E  48                dec      ax
1:018F  741f              je       0x1b0
1:0191  ebed              jmp      0x180
1:0193  c41e5004          les      bx, ptr [0x450]
1:0197  268b4706          mov      ax, word ptr es:[bx + 6]
1:019B  a31200            mov      word ptr [0x12], ax
1:019E  ebe0              jmp      0x180
1:01A0  b86600            mov      ax, 0x66
1:01A3  c41e5004          les      bx, ptr [0x450]
1:01A7  262b4708          sub      ax, word ptr es:[bx + 8]
1:01AB  a31400            mov      word ptr [0x14], ax
1:01AE  ebd0              jmp      0x180
1:01B0  c41e5004          les      bx, ptr [0x450]
1:01B4  268b470a          mov      ax, word ptr es:[bx + 0xa]
1:01B8  a31000            mov      word ptr [0x10], ax
1:01BB  ebc3              jmp      0x180
1:01BD  4d                dec      bp
1:01BE  4d                dec      bp
1:01BF  8be5              mov      sp, bp
1:01C1  1f                pop      ds
1:01C2  5d                pop      bp
1:01C3  4d                dec      bp
1:01C4  cb                retf     
1:01C5  1e                push     ds
1:01C6  58                pop      ax
1:01C7  90                nop      
1:01C8  45                inc      bp
1:01C9  55                push     bp
1:01CA  8bec              mov      bp, sp
1:01CC  1e                push     ds
1:01CD  8ed8              mov      ds, ax
1:01CF  c7063e040000      mov      word ptr [0x43e], 0
1:01D5  9a8e020000        lcall    0, 0x28e  ; @1:INT:ord_5(1:0734)
1:01DA  b90600            mov      cx, 6
1:01DD  99                cdq      
1:01DE  f7f9              idiv     cx
1:01E0  8916d803          mov      word ptr [0x3d8], dx
1:01E4  8bc2              mov      ax, dx
1:01E6  eb5d              jmp      0x245
1:01E8  c70636040100      mov      word ptr [0x436], 1
1:01EE  2bc0              sub      ax, ax
1:01F0  a32204            mov      word ptr [0x422], ax
1:01F3  a34004            mov      word ptr [0x440], ax
1:01F6  a34204            mov      word ptr [0x442], ax
1:01F9  eb63              jmp      0x25e
1:01FB  b80100            mov      ax, 1
1:01FE  a33604            mov      word ptr [0x436], ax
1:0201  a34004            mov      word ptr [0x440], ax
1:0204  2bc0              sub      ax, ax
1:0206  a32204            mov      word ptr [0x422], ax
1:0209  ebeb              jmp      0x1f6
1:020B  c70640040100      mov      word ptr [0x440], 1
1:0211  2bc0              sub      ax, ax
1:0213  a33604            mov      word ptr [0x436], ax
1:0216  ebee              jmp      0x206
1:0218  2bc0              sub      ax, ax
1:021A  a33604            mov      word ptr [0x436], ax
1:021D  a32204            mov      word ptr [0x422], ax
1:0220  a34004            mov      word ptr [0x440], ax
1:0223  c70642040100      mov      word ptr [0x442], 1
1:0229  eb33              jmp      0x25e
1:022B  c70622040100      mov      word ptr [0x422], 1
1:0231  2bc0              sub      ax, ax
1:0233  a33604            mov      word ptr [0x436], ax
1:0236  ebbb              jmp      0x1f3
1:0238  b80100            mov      ax, 1
1:023B  a33604            mov      word ptr [0x436], ax
1:023E  a32204            mov      word ptr [0x422], ax
1:0241  2bc0              sub      ax, ax
1:0243  ebae              jmp      0x1f3
1:0245  3d0500            cmp      ax, 5
1:0248  7714              ja       0x25e
1:024A  d1e0              shl      ax, 1
1:024C  93                xchg     bx, ax
1:024D  2effa75202        jmp      word ptr cs:[bx + 0x252]
1:0252  e801fb            call     0xfffffd56
1:0255  010b              add      word ptr [bp + di], cx
1:0257  0218              add      bl, byte ptr [bx + si]
1:0259  022b              add      ch, byte ptr [bp + di]
1:025B  0238              add      bh, byte ptr [bx + si]
1:025D  02c4              add      al, ah
1:025F  1e                push     ds
1:0260  3204              xor      al, byte ptr [si]
1:0262  26837f0a08        cmp      word ptr es:[bx + 0xa], 8
1:0267  7d19              jge      0x282
1:0269  833ed80303        cmp      word ptr [0x3d8], 3
1:026E  7512              jne      0x282
1:0270  b80100            mov      ax, 1
1:0273  a33604            mov      word ptr [0x436], ax
1:0276  a32204            mov      word ptr [0x422], ax
1:0279  a34004            mov      word ptr [0x440], ax
1:027C  c70642040000      mov      word ptr [0x442], 0
1:0282  2bc0              sub      ax, ax
1:0284  a32e04            mov      word ptr [0x42e], ax
1:0287  a32604            mov      word ptr [0x426], ax
1:028A  a33a04            mov      word ptr [0x43a], ax
1:028D  9ae6020000        lcall    0, 0x2e6  ; @1:INT:ord_5(1:0734)
1:0292  99                cdq      
1:0293  f73e1200          idiv     word ptr [0x12]
1:0297  83c21e            add      dx, 0x1e
1:029A  89162a04          mov      word ptr [0x42a], dx
1:029E  8bc2              mov      ax, dx
1:02A0  99                cdq      
1:02A1  a34604            mov      word ptr [0x446], ax
1:02A4  89164804          mov      word ptr [0x448], dx
1:02A8  a32804            mov      word ptr [0x428], ax
1:02AB  8bc8              mov      cx, ax
1:02AD  8bd0              mov      dx, ax
1:02AF  b85802            mov      ax, 0x258
1:02B2  99                cdq      
1:02B3  f7f9              idiv     cx
1:02B5  40                inc      ax
1:02B6  a33004            mov      word ptr [0x430], ax
1:02B9  8bc1              mov      ax, cx
1:02BB  99                cdq      
1:02BC  f73e1400          idiv     word ptr [0x14]
1:02C0  a34a04            mov      word ptr [0x44a], ax
1:02C3  8bc1              mov      ax, cx
1:02C5  99                cdq      
1:02C6  2bc2              sub      ax, dx
1:02C8  d1f8              sar      ax, 1
1:02CA  8bc8              mov      cx, ax
1:02CC  a14a04            mov      ax, word ptr [0x44a]
1:02CF  99                cdq      
1:02D0  f7f9              idiv     cx
1:02D2  a32404            mov      word ptr [0x424], ax
1:02D5  0bc0              or       ax, ax
1:02D7  7506              jne      0x2df
1:02D9  c70624040100      mov      word ptr [0x424], 1
1:02DF  c7063c040000      mov      word ptr [0x43c], 0
1:02E5  9af8020000        lcall    0, 0x2f8  ; @1:INT:ord_5(1:0734)
1:02EA  c41e5004          les      bx, ptr [0x450]
1:02EE  99                cdq      
1:02EF  26f77f02          idiv     word ptr es:[bx + 2]
1:02F3  89164c04          mov      word ptr [0x44c], dx
1:02F7  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_5(1:0734)
1:02FC  c41e5004          les      bx, ptr [0x450]
1:0300  99                cdq      
1:0301  26f77f04          idiv     word ptr es:[bx + 4]
1:0305  89164e04          mov      word ptr [0x44e], dx
1:0309  ff063804          inc      word ptr [0x438]
1:030D  4d                dec      bp
1:030E  4d                dec      bp
1:030F  8be5              mov      sp, bp
1:0311  1f                pop      ds
1:0312  5d                pop      bp
1:0313  4d                dec      bp
1:0314  cb                retf     
1:0315  1e                push     ds
1:0316  58                pop      ax
1:0317  90                nop      
1:0318  45                inc      bp
1:0319  55                push     bp
1:031A  8bec              mov      bp, sp
1:031C  1e                push     ds
1:031D  8ed8              mov      ds, ax
1:031F  b81027            mov      ax, 0x2710
1:0322  99                cdq      
1:0323  52                push     dx
1:0324  50                push     ax
1:0325  8b1e3e04          mov      bx, word ptr [0x43e]
1:0329  d1e3              shl      bx, 1
1:032B  8b875a00          mov      ax, word ptr [bx + 0x5a]
1:032F  c41e5004          les      bx, ptr [0x450]
1:0333  26f76f08          imul     word ptr es:[bx + 8]
1:0337  f72e2a04          imul     word ptr [0x42a]
1:033B  52                push     dx
1:033C  50                push     ax
1:033D  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_4(1:0764)
1:0342  a33c04            mov      word ptr [0x43c], ax
1:0345  b80700            mov      ax, 7
1:0348  f72e3e04          imul     word ptr [0x43e]
1:034C  051800            add      ax, 0x18
1:034F  a3e003            mov      word ptr [0x3e0], ax
1:0352  a13e04            mov      ax, word ptr [0x43e]
1:0355  8bc8              mov      cx, ax
1:0357  d1e0              shl      ax, 1
1:0359  03c1              add      ax, cx
1:035B  051d00            add      ax, 0x1d
1:035E  a3de03            mov      word ptr [0x3de], ax
1:0361  833e360400        cmp      word ptr [0x436], 0
1:0366  7507              jne      0x36f
1:0368  833e420400        cmp      word ptr [0x442], 0
1:036D  7408              je       0x377
1:036F  a1e003            mov      ax, word ptr [0x3e0]
1:0372  a33a04            mov      word ptr [0x43a], ax
1:0375  eb06              jmp      0x37d
1:0377  c7063a040000      mov      word ptr [0x43a], 0
1:037D  833e220400        cmp      word ptr [0x422], 0
1:0382  7405              je       0x389
1:0384  a1e003            mov      ax, word ptr [0x3e0]
1:0387  eb0e              jmp      0x397
1:0389  833e420400        cmp      word ptr [0x442], 0
1:038E  7405              je       0x395
1:0390  a1de03            mov      ax, word ptr [0x3de]
1:0393  eb02              jmp      0x397
1:0395  2bc0              sub      ax, ax
1:0397  a32604            mov      word ptr [0x426], ax
1:039A  833e400400        cmp      word ptr [0x440], 0
1:039F  7405              je       0x3a6
1:03A1  a1e003            mov      ax, word ptr [0x3e0]
1:03A4  eb02              jmp      0x3a8
1:03A6  2bc0              sub      ax, ax
1:03A8  a32e04            mov      word ptr [0x42e], ax
1:03AB  ff362c04          push     word ptr [0x42c]
1:03AF  b80800            mov      ax, 8
1:03B2  50                push     ax
1:03B3  9a86000000        lcall    0, 0x86  ; @1:GDI.GetStockObject
1:03B8  50                push     ax
1:03B9  9adb030000        lcall    0, 0x3db  ; @1:GDI.SelectObject
1:03BE  a3e403            mov      word ptr [0x3e4], ax
1:03C1  ff362c04          push     word ptr [0x42c]
1:03C5  a03a04            mov      al, byte ptr [0x43a]
1:03C8  8a262604          mov      ah, byte ptr [0x426]
1:03CC  8a0e2e04          mov      cl, byte ptr [0x42e]
1:03D0  b502              mov      ch, 2
1:03D2  51                push     cx
1:03D3  50                push     ax
1:03D4  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateSolidBrush
1:03D9  50                push     ax
1:03DA  9a48040000        lcall    0, 0x448  ; @1:GDI.SelectObject
1:03DF  a3e603            mov      word ptr [0x3e6], ax
1:03E2  c41e3204          les      bx, ptr [0x432]
1:03E6  268b470c          mov      ax, word ptr es:[bx + 0xc]
1:03EA  99                cdq      
1:03EB  52                push     dx
1:03EC  50                push     ax
1:03ED  ff364804          push     word ptr [0x448]
1:03F1  ff364604          push     word ptr [0x446]
1:03F5  268b470e          mov      ax, word ptr es:[bx + 0xe]
1:03F9  99                cdq      
1:03FA  52                push     dx
1:03FB  50                push     ax
1:03FC  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:07FE)
1:0401  52                push     dx
1:0402  50                push     ax
1:0403  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_6(1:0830)
1:0408  a3e203            mov      word ptr [0x3e2], ax
1:040B  ff362c04          push     word ptr [0x42c]
1:040F  a14c04            mov      ax, word ptr [0x44c]
1:0412  2b06e203          sub      ax, word ptr [0x3e2]
1:0416  03063c04          add      ax, word ptr [0x43c]
1:041A  50                push     ax
1:041B  a14e04            mov      ax, word ptr [0x44e]
1:041E  2b063c04          sub      ax, word ptr [0x43c]
1:0422  8bc8              mov      cx, ax
1:0424  2b062804          sub      ax, word ptr [0x428]
1:0428  50                push     ax
1:0429  a14c04            mov      ax, word ptr [0x44c]
1:042C  03063c04          add      ax, word ptr [0x43c]
1:0430  0306e203          add      ax, word ptr [0x3e2]
1:0434  50                push     ax
1:0435  030e2804          add      cx, word ptr [0x428]
1:0439  51                push     cx
1:043A  9affff0000        lcall    0, 0xffff  ; @1:GDI.Ellipse
1:043F  ff362c04          push     word ptr [0x42c]
1:0443  ff36e403          push     word ptr [0x3e4]
1:0447  9a55040000        lcall    0, 0x455  ; @1:GDI.SelectObject
1:044C  ff362c04          push     word ptr [0x42c]
1:0450  ff36e603          push     word ptr [0x3e6]
1:0454  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectObject
1:0459  50                push     ax
1:045A  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteObject
1:045F  b8e803            mov      ax, 0x3e8
1:0462  99                cdq      
1:0463  52                push     dx
1:0464  50                push     ax
1:0465  ff063e04          inc      word ptr [0x43e]
1:0469  8b1e3e04          mov      bx, word ptr [0x43e]
1:046D  d1e3              shl      bx, 1
1:046F  8b871600          mov      ax, word ptr [bx + 0x16]
1:0473  f72e2a04          imul     word ptr [0x42a]
1:0477  52                push     dx
1:0478  50                push     ax
1:0479  9a3e030000        lcall    0, 0x33e  ; @1:INT:ord_4(1:0764)
1:047E  a34604            mov      word ptr [0x446], ax
1:0481  89164804          mov      word ptr [0x448], dx
1:0485  a32804            mov      word ptr [0x428], ax
1:0488  833e3e0421        cmp      word ptr [0x43e], 0x21
1:048D  7e04              jle      0x493
1:048F  0e                push     cs
1:0490  e832fd            call     0x1c5
1:0493  4d                dec      bp
1:0494  4d                dec      bp
1:0495  8be5              mov      sp, bp
1:0497  1f                pop      ds
1:0498  5d                pop      bp
1:0499  4d                dec      bp
1:049A  cb                retf     
1:049B  001e5890          add      byte ptr [0x9058], bl
1:049F  45                inc      bp
1:04A0  55                push     bp
1:04A1  8bec              mov      bp, sp
1:04A3  1e                push     ds
1:04A4  8ed8              mov      ds, ax
1:04A6  837e0a00          cmp      word ptr [bp + 0xa], 0
1:04AA  7504              jne      0x4b0
1:04AC  2bc0              sub      ax, ax
1:04AE  eb09              jmp      0x4b9
1:04B0  8b460e            mov      ax, word ptr [bp + 0xe]
1:04B3  a34404            mov      word ptr [0x444], ax
1:04B6  b80100            mov      ax, 1
1:04B9  4d                dec      bp
1:04BA  4d                dec      bp
1:04BB  8be5              mov      sp, bp
1:04BD  1f                pop      ds
1:04BE  5d                pop      bp
1:04BF  4d                dec      bp
1:04C0  ca0a00            retf     0xa

; ===== EXPORT:WEP(#2) =====
1:04C3  1e                push     ds
1:04C4  58                pop      ax
1:04C5  90                nop      
1:04C6  45                inc      bp
1:04C7  55                push     bp
1:04C8  8bec              mov      bp, sp
1:04CA  1e                push     ds
1:04CB  8ed8              mov      ds, ax
1:04CD  b80100            mov      ax, 1
1:04D0  4d                dec      bp
1:04D1  4d                dec      bp
1:04D2  8be5              mov      sp, bp
1:04D4  1f                pop      ds
1:04D5  5d                pop      bp
1:04D6  4d                dec      bp
1:04D7  ca0200            retf     2

; ===== EXPORT:MODULE(#1) =====
1:04DA  1e                push     ds
1:04DB  58                pop      ax
1:04DC  90                nop      
1:04DD  45                inc      bp
1:04DE  55                push     bp
1:04DF  8bec              mov      bp, sp
1:04E1  1e                push     ds
1:04E2  8ed8              mov      ds, ax
1:04E4  83ec0a            sub      sp, 0xa
1:04E7  56                push     si
1:04E8  8b4608            mov      ax, word ptr [bp + 8]
1:04EB  a32c04            mov      word ptr [0x42c], ax
1:04EE  8b4606            mov      ax, word ptr [bp + 6]
1:04F1  a32004            mov      word ptr [0x420], ax
1:04F4  50                push     ax
1:04F5  9a15050000        lcall    0, 0x515  ; @1:KERNEL.GlobalLock
1:04FA  a33204            mov      word ptr [0x432], ax
1:04FD  89163404          mov      word ptr [0x434], dx
1:0501  8bc2              mov      ax, dx
1:0503  0b063204          or       ax, word ptr [0x432]
1:0507  7503              jne      0x50c
1:0509  e96a01            jmp      0x676
1:050C  c41e3204          les      bx, ptr [0x432]
1:0510  26ff7720          push     word ptr es:[bx + 0x20]
1:0514  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalLock
1:0519  a35004            mov      word ptr [0x450], ax
1:051C  89165204          mov      word ptr [0x452], dx
1:0520  8bc2              mov      ax, dx
1:0522  0b065004          or       ax, word ptr [0x450]
1:0526  7503              jne      0x52b
1:0528  e94201            jmp      0x66d
1:052B  8b460a            mov      ax, word ptr [bp + 0xa]
1:052E  e90801            jmp      0x639
1:0531  c41e3204          les      bx, ptr [0x432]
1:0535  26837f1465        cmp      word ptr es:[bx + 0x14], 0x65
1:053A  7c0f              jl       0x54b
1:053C  26817f36f400      cmp      word ptr es:[bx + 0x36], 0xf4
1:0542  7507              jne      0x54b
1:0544  26837f3878        cmp      word ptr es:[bx + 0x38], 0x78
1:0549  740e              je       0x559
1:054B  c7069e000000      mov      word ptr [0x9e], 0
1:0551  c746fc0500        mov      word ptr [bp - 4], 5
1:0556  e90701            jmp      0x660
1:0559  c7069e000100      mov      word ptr [0x9e], 1
1:055F  e9fe00            jmp      0x660
1:0562  b8e803            mov      ax, 0x3e8
1:0565  50                push     ax
1:0566  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_17(1:06BE)
1:056B  5b                pop      bx
1:056C  ff36e803          push     word ptr [0x3e8]
1:0570  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_16(1:0720)
1:0575  5b                pop      bx
1:0576  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_15(1:0012)
1:057B  eb13              jmp      0x590
1:057D  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_14(1:004D)
1:0582  eb0c              jmp      0x590
1:0584  833e9e0000        cmp      word ptr [0x9e], 0
1:0589  740b              je       0x596
1:058B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_13(1:009B)
1:0590  8946fc            mov      word ptr [bp - 4], ax
1:0593  e9ca00            jmp      0x660
1:0596  ff362c04          push     word ptr [0x42c]
1:059A  b800ff            mov      ax, 0xff00
1:059D  baff00            mov      dx, 0xff
1:05A0  52                push     dx
1:05A1  50                push     ax
1:05A2  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextColor
1:05A7  ff362c04          push     word ptr [0x42c]
1:05AB  2bc0              sub      ax, ax
1:05AD  50                push     ax
1:05AE  50                push     ax
1:05AF  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkColor
1:05B4  ff362c04          push     word ptr [0x42c]
1:05B8  2bc0              sub      ax, ax
1:05BA  50                push     ax
1:05BB  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextAlign
1:05C0  ff362c04          push     word ptr [0x42c]
1:05C4  b80100            mov      ax, 1
1:05C7  50                push     ax
1:05C8  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkMode
1:05CD  ff362c04          push     word ptr [0x42c]
1:05D1  2bc0              sub      ax, ax
1:05D3  50                push     ax
1:05D4  50                push     ax
1:05D5  b8a000            mov      ax, 0xa0
1:05D8  1e                push     ds
1:05D9  50                push     ax
1:05DA  50                push     ax
1:05DB  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:06A2)
1:05E0  5b                pop      bx
1:05E1  50                push     ax
1:05E2  9affff0000        lcall    0, 0xffff  ; @1:GDI.TextOut
1:05E7  eb77              jmp      0x660
1:05E9  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:00F2)
1:05EE  eba0              jmp      0x590
1:05F0  a14404            mov      ax, word ptr [0x444]
1:05F3  c41e5004          les      bx, ptr [0x450]
1:05F7  26894716          mov      word ptr es:[bx + 0x16], ax
1:05FB  c746f60000        mov      word ptr [bp - 0xa], 0
1:0600  8b46f6            mov      ax, word ptr [bp - 0xa]
1:0603  8bf0              mov      si, ax
1:0605  d1e6              shl      si, 1
1:0607  40                inc      ax
1:0608  c41e5004          les      bx, ptr [0x450]
1:060C  2689400e          mov      word ptr es:[bx + si + 0xe], ax
1:0610  ff46f6            inc      word ptr [bp - 0xa]
1:0613  837ef604          cmp      word ptr [bp - 0xa], 4
1:0617  7ce7              jl       0x600
1:0619  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:0143)
1:061E  e96fff            jmp      0x590
1:0621  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:0157)
1:0626  e967ff            jmp      0x590
1:0629  8b460a            mov      ax, word ptr [bp + 0xa]
1:062C  2d0700            sub      ax, 7
1:062F  50                push     ax
1:0630  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:016B)
1:0635  5b                pop      bx
1:0636  e957ff            jmp      0x590
1:0639  3d0c00            cmp      ax, 0xc
1:063C  7722              ja       0x660
1:063E  d1e0              shl      ax, 1
1:0640  93                xchg     bx, ax
1:0641  2effa74606        jmp      word ptr cs:[bx + 0x646]
1:0646  6205              bound    ax, dword ptr [di]
1:0648  7d05              jge      0x64f
1:064A  8405              test     byte ptr [di], al
1:064C  e90560            jmp      0x6654
1:064F  06                push     es