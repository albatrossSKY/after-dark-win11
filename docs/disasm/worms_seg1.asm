File: raw\unpacked\MODULES\WORMS.AD
Module: 'WORMS' ('After Dark Module Worms Jan 5, 1991 TDE sound TDE')
CS:IP=1:12F4  SS:SP=0:0000  AutoDS=2  Heap=4096  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (4): KERNEL, GDI, USER, SOUND
Segments (2):
  SEG  1: CODE off=0x00620 len=0x1326 min=0x1326 flags=0x0D50 relocs=113
  SEG  2: DATA off=0x01B40 len=0x1196 min=0x1196 flags=0x0C71 relocs=0
Exports (28):
  ord   1: SEG1:0950 flags=0x03 MODULE
  ord   2: SEG1:0939 flags=0x03 WEP
  ord   3: SEG1:12E0 flags=0x03 ___EXPORTEDSTUB
  ord   4: SEG1:0BA4 flags=0x00 
  ord   5: SEG1:06C0 flags=0x00 
  ord   6: SEG1:06AC flags=0x00 
  ord   7: SEG1:070C flags=0x00 
  ord   8: SEG1:0720 flags=0x00 
  ord   9: SEG1:0B12 flags=0x00 
  ord  10: SEG1:029F flags=0x00 
  ord  11: SEG1:0698 flags=0x00 
  ord  12: SEG1:0051 flags=0x00 
  ord  13: SEG1:0B90 flags=0x00 
  ord  14: SEG1:0B2E flags=0x00 
  ord  15: SEG1:0912 flags=0x00 
  ord  16: SEG1:0BD4 flags=0x00 
  ord  17: SEG1:0CD8 flags=0x00 
  ord  18: SEG1:0E4A flags=0x00 
  ord  19: SEG1:0D0A flags=0x00 
  ord  20: SEG1:0F7C flags=0x00 
  ord  21: SEG1:0FA4 flags=0x00 
  ord  22: SEG1:1046 flags=0x00 
  ord  23: SEG1:100A flags=0x00 
  ord  24: SEG1:1070 flags=0x00 
  ord  25: SEG1:0FA8 flags=0x00 
  ord  26: SEG1:0D24 flags=0x00 
  ord  27: SEG1:1214 flags=0x00 
  ord  28: SEG1:12D0 flags=0x00 
Resources (7):
  TYPE_1000        #1               off=0x02D20 len=   176
  TYPE_1000        #2               off=0x02DD0 len=    64
  TYPE_1000        #3               off=0x02E10 len=    64
  TYPE_1000        #4               off=0x02E50 len=    32
  TYPE_2000        #10              off=0x02E70 len=    80
  TYPE_2000        #20              off=0x02EC0 len=    16
  TYPE_2000        #30              off=0x02ED0 len=   384

1:0000  1e                push     ds
1:0001  58                pop      ax
1:0002  90                nop      
1:0003  45                inc      bp
1:0004  55                push     bp
1:0005  8bec              mov      bp, sp
1:0007  1e                push     ds
1:0008  8ed8              mov      ds, ax
1:000A  83ec04            sub      sp, 4
1:000D  8b4606            mov      ax, word ptr [bp + 6]
1:0010  b91900            mov      cx, 0x19
1:0013  99                cdq      
1:0014  f7f9              idiv     cx
1:0016  0bc0              or       ax, ax
1:0018  740c              je       0x26
1:001A  48                dec      ax
1:001B  740d              je       0x2a
1:001D  48                dec      ax
1:001E  740f              je       0x2f
1:0020  48                dec      ax
1:0021  7411              je       0x34
1:0023  48                dec      ax
1:0024  eb0e              jmp      0x34
1:0026  2bc0              sub      ax, ax
1:0028  eb0d              jmp      0x37
1:002A  b80100            mov      ax, 1
1:002D  eb08              jmp      0x37
1:002F  b80300            mov      ax, 3
1:0032  eb03              jmp      0x37
1:0034  b80500            mov      ax, 5
1:0037  4d                dec      bp
1:0038  4d                dec      bp
1:0039  8be5              mov      sp, bp
1:003B  1f                pop      ds
1:003C  5d                pop      bp
1:003D  4d                dec      bp
1:003E  cb                retf     
1:003F  1e                push     ds
1:0040  58                pop      ax
1:0041  90                nop      
1:0042  45                inc      bp
1:0043  55                push     bp
1:0044  8bec              mov      bp, sp
1:0046  1e                push     ds
1:0047  8ed8              mov      ds, ax
1:0049  4d                dec      bp
1:004A  4d                dec      bp
1:004B  8be5              mov      sp, bp
1:004D  1f                pop      ds
1:004E  5d                pop      bp
1:004F  4d                dec      bp
1:0050  cb                retf     

; ===== EXPORT:ord_12(#12) =====
1:0051  1e                push     ds
1:0052  58                pop      ax
1:0053  90                nop      
1:0054  45                inc      bp
1:0055  55                push     bp
1:0056  8bec              mov      bp, sp
1:0058  1e                push     ds
1:0059  8ed8              mov      ds, ax
1:005B  83ec16            sub      sp, 0x16
1:005E  57                push     di
1:005F  56                push     si
1:0060  c41e9211          les      bx, ptr [0x1192]
1:0064  26ff7706          push     word ptr es:[bx + 6]
1:0068  0e                push     cs
1:0069  e894ff            call     0
1:006C  5b                pop      bx
1:006D  a3c603            mov      word ptr [0x3c6], ax
1:0070  b8fbff            mov      ax, 0xfffb
1:0073  a3be03            mov      word ptr [0x3be], ax
1:0076  a3bc03            mov      word ptr [0x3bc], ax
1:0079  c41e9211          les      bx, ptr [0x1192]
1:007D  268b4702          mov      ax, word ptr es:[bx + 2]
1:0081  050500            add      ax, 5
1:0084  a3c003            mov      word ptr [0x3c0], ax
1:0087  268b4704          mov      ax, word ptr es:[bx + 4]
1:008B  050500            add      ax, 5
1:008E  a3c203            mov      word ptr [0x3c2], ax
1:0091  9aa3000000        lcall    0, 0xa3  ; @1:INT:ord_4(1:0BA4)
1:0096  c41e9211          les      bx, ptr [0x1192]
1:009A  99                cdq      
1:009B  26f77f02          idiv     word ptr es:[bx + 2]
1:009F  8956fc            mov      word ptr [bp - 4], dx
1:00A2  9a01010000        lcall    0, 0x101  ; @1:INT:ord_4(1:0BA4)
1:00A7  c41e9211          les      bx, ptr [0x1192]
1:00AB  99                cdq      
1:00AC  26f77f04          idiv     word ptr es:[bx + 4]
1:00B0  8956f6            mov      word ptr [bp - 0xa], dx
1:00B3  c746f80000        mov      word ptr [bp - 8], 0
1:00B8  c746fa0000        mov      word ptr [bp - 6], 0
1:00BD  b81600            mov      ax, 0x16
1:00C0  f76ef8            imul     word ptr [bp - 8]
1:00C3  0346fa            add      ax, word ptr [bp - 6]
1:00C6  b103              mov      cl, 3
1:00C8  d3e0              shl      ax, cl
1:00CA  05d203            add      ax, 0x3d2
1:00CD  1e                push     ds
1:00CE  50                push     ax
1:00CF  2bc0              sub      ax, ax
1:00D1  50                push     ax
1:00D2  50                push     ax
1:00D3  b80400            mov      ax, 4
1:00D6  50                push     ax
1:00D7  50                push     ax
1:00D8  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:00DD  ff46fa            inc      word ptr [bp - 6]
1:00E0  837efa15          cmp      word ptr [bp - 6], 0x15
1:00E4  7cd7              jl       0xbd
1:00E6  b8b000            mov      ax, 0xb0
1:00E9  f76ef8            imul     word ptr [bp - 8]
1:00EC  8bc8              mov      cx, ax
1:00EE  05d203            add      ax, 0x3d2
1:00F1  1e                push     ds
1:00F2  50                push     ax
1:00F3  ff76fc            push     word ptr [bp - 4]
1:00F6  ff76f6            push     word ptr [bp - 0xa]
1:00F9  8bf1              mov      si, cx
1:00FB  9a7e030000        lcall    0, 0x37e  ; @1:USER.OffsetRect
1:0100  9a7b020000        lcall    0, 0x27b  ; @1:INT:ord_4(1:0BA4)
1:0105  b91800            mov      cx, 0x18
1:0108  99                cdq      
1:0109  f7f9              idiv     cx
1:010B  89947a04          mov      word ptr [si + 0x47a], dx
1:010F  c7847c040000      mov      word ptr [si + 0x47c], 0
1:0115  0e                push     cs
1:0116  e89807            call     0x8b1
1:0119  89847e04          mov      word ptr [si + 0x47e], ax
1:011D  89948004          mov      word ptr [si + 0x480], dx
1:0121  ff46f8            inc      word ptr [bp - 8]
1:0124  837ef814          cmp      word ptr [bp - 8], 0x14
1:0128  7c8e              jl       0xb8
1:012A  ff36ba03          push     word ptr [0x3ba]
1:012E  9ac3020000        lcall    0, 0x2c3  ; @1:GDI.CreateCompatibleDC
1:0133  8946f2            mov      word ptr [bp - 0xe], ax
1:0136  ff36ba03          push     word ptr [0x3ba]
1:013A  b80e00            mov      ax, 0xe
1:013D  50                push     ax
1:013E  b80600            mov      ax, 6
1:0141  50                push     ax
1:0142  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateCompatibleBitmap
1:0147  a3d003            mov      word ptr [0x3d0], ax
1:014A  0bc0              or       ax, ax
1:014C  7506              jne      0x154
1:014E  b80100            mov      ax, 1
1:0151  e94101            jmp      0x295
1:0154  ff76f2            push     word ptr [bp - 0xe]
1:0157  50                push     ax
1:0158  9a6b010000        lcall    0, 0x16b  ; @1:GDI.SelectObject
1:015D  ff76f2            push     word ptr [bp - 0xe]
1:0160  b80400            mov      ax, 4
1:0163  50                push     ax
1:0164  9a92010000        lcall    0, 0x192  ; @1:GDI.GetStockObject
1:0169  50                push     ax
1:016A  9a98010000        lcall    0, 0x198  ; @1:GDI.SelectObject
1:016F  ff76f2            push     word ptr [bp - 0xe]
1:0172  2bc0              sub      ax, ax
1:0174  50                push     ax
1:0175  50                push     ax
1:0176  b90e00            mov      cx, 0xe
1:0179  51                push     cx
1:017A  ba0400            mov      dx, 4
1:017D  52                push     dx
1:017E  bb2100            mov      bx, 0x21
1:0181  bef000            mov      si, 0xf0
1:0184  56                push     si
1:0185  53                push     bx
1:0186  9ab1010000        lcall    0, 0x1b1  ; @1:GDI.PatBlt
1:018B  ff76f2            push     word ptr [bp - 0xe]
1:018E  2bc0              sub      ax, ax
1:0190  50                push     ax
1:0191  9abd010000        lcall    0, 0x1bd  ; @1:GDI.GetStockObject
1:0196  50                push     ax
1:0197  9ac3010000        lcall    0, 0x1c3  ; @1:GDI.SelectObject
1:019C  ff76f2            push     word ptr [bp - 0xe]
1:019F  2bc0              sub      ax, ax
1:01A1  50                push     ax
1:01A2  50                push     ax
1:01A3  b90400            mov      cx, 4
1:01A6  51                push     cx
1:01A7  51                push     cx
1:01A8  ba2100            mov      dx, 0x21
1:01AB  bbf000            mov      bx, 0xf0
1:01AE  53                push     bx
1:01AF  52                push     dx
1:01B0  9a3c020000        lcall    0, 0x23c  ; @1:GDI.PatBlt
1:01B5  ff76f2            push     word ptr [bp - 0xe]
1:01B8  b80400            mov      ax, 4
1:01BB  50                push     ax
1:01BC  9ae0010000        lcall    0, 0x1e0  ; @1:GDI.GetStockObject
1:01C1  50                push     ax
1:01C2  9ae6010000        lcall    0, 0x1e6  ; @1:GDI.SelectObject
1:01C7  ff76f2            push     word ptr [bp - 0xe]
1:01CA  2bc0              sub      ax, ax
1:01CC  50                push     ax
1:01CD  50                push     ax
1:01CE  b90400            mov      cx, 4
1:01D1  51                push     cx
1:01D2  51                push     cx
1:01D3  9afa010000        lcall    0, 0x1fa  ; @1:GDI.Ellipse
1:01D8  ff76f2            push     word ptr [bp - 0xe]
1:01DB  b80600            mov      ax, 6
1:01DE  50                push     ax
1:01DF  9a06020000        lcall    0, 0x206  ; @1:GDI.GetStockObject
1:01E4  50                push     ax
1:01E5  9a0c020000        lcall    0, 0x20c  ; @1:GDI.SelectObject
1:01EA  ff76f2            push     word ptr [bp - 0xe]
1:01ED  b80400            mov      ax, 4
1:01F0  50                push     ax
1:01F1  2bc9              sub      cx, cx
1:01F3  51                push     cx
1:01F4  ba0800            mov      dx, 8
1:01F7  52                push     dx
1:01F8  50                push     ax
1:01F9  9a65020000        lcall    0, 0x265  ; @1:GDI.Ellipse
1:01FE  ff76f2            push     word ptr [bp - 0xe]
1:0201  b80700            mov      ax, 7
1:0204  50                push     ax
1:0205  9a17020000        lcall    0, 0x217  ; @1:GDI.GetStockObject
1:020A  50                push     ax
1:020B  9a1d020000        lcall    0, 0x21d  ; @1:GDI.SelectObject
1:0210  ff76f2            push     word ptr [bp - 0xe]
1:0213  2bc0              sub      ax, ax
1:0215  50                push     ax
1:0216  9a48020000        lcall    0, 0x248  ; @1:GDI.GetStockObject
1:021B  50                push     ax
1:021C  9a4e020000        lcall    0, 0x24e  ; @1:GDI.SelectObject
1:0221  ff76f2            push     word ptr [bp - 0xe]
1:0224  b80800            mov      ax, 8
1:0227  50                push     ax
1:0228  2bc9              sub      cx, cx
1:022A  51                push     cx
1:022B  ba0e00            mov      dx, 0xe
1:022E  52                push     dx
1:022F  bb0600            mov      bx, 6
1:0232  53                push     bx
1:0233  be2100            mov      si, 0x21
1:0236  bff000            mov      di, 0xf0
1:0239  57                push     di
1:023A  56                push     si
1:023B  9affff0000        lcall    0, 0xffff  ; @1:GDI.PatBlt
1:0240  ff76f2            push     word ptr [bp - 0xe]
1:0243  b80400            mov      ax, 4
1:0246  50                push     ax
1:0247  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:024C  50                push     ax
1:024D  9ad0020000        lcall    0, 0x2d0  ; @1:GDI.SelectObject
1:0252  ff76f2            push     word ptr [bp - 0xe]
1:0255  b80800            mov      ax, 8
1:0258  50                push     ax
1:0259  2bc0              sub      ax, ax
1:025B  50                push     ax
1:025C  b90e00            mov      cx, 0xe
1:025F  51                push     cx
1:0260  b90600            mov      cx, 6
1:0263  51                push     cx
1:0264  9affff0000        lcall    0, 0xffff  ; @1:GDI.Ellipse
1:0269  ff76f2            push     word ptr [bp - 0xe]
1:026C  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteDC
1:0271  9affff0000        lcall    0, 0xffff  ; @1:USER.GetTickCount
1:0276  8bf0              mov      si, ax
1:0278  8bfa              mov      di, dx
1:027A  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_4(1:0BA4)
1:027F  b9f401            mov      cx, 0x1f4
1:0282  99                cdq      
1:0283  f7f9              idiv     cx
1:0285  8bc2              mov      ax, dx
1:0287  99                cdq      
1:0288  03c6              add      ax, si
1:028A  13d7              adc      dx, di
1:028C  a3b603            mov      word ptr [0x3b6], ax
1:028F  8916b803          mov      word ptr [0x3b8], dx
1:0293  2bc0              sub      ax, ax
1:0295  5e                pop      si
1:0296  5f                pop      di
1:0297  4d                dec      bp
1:0298  4d                dec      bp
1:0299  8be5              mov      sp, bp
1:029B  1f                pop      ds
1:029C  5d                pop      bp
1:029D  4d                dec      bp
1:029E  cb                retf     

; ===== EXPORT:ord_10(#10) =====
1:029F  1e                push     ds
1:02A0  58                pop      ax
1:02A1  90                nop      
1:02A2  45                inc      bp
1:02A3  55                push     bp
1:02A4  8bec              mov      bp, sp
1:02A6  1e                push     ds
1:02A7  8ed8              mov      ds, ax
1:02A9  83ec16            sub      sp, 0x16
1:02AC  57                push     di
1:02AD  56                push     si
1:02AE  c41e9211          les      bx, ptr [0x1192]
1:02B2  26ff7706          push     word ptr es:[bx + 6]
1:02B6  0e                push     cs
1:02B7  e846fd            call     0
1:02BA  5b                pop      bx
1:02BB  a3c603            mov      word ptr [0x3c6], ax
1:02BE  ff36ba03          push     word ptr [0x3ba]
1:02C2  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateCompatibleDC
1:02C7  8946f0            mov      word ptr [bp - 0x10], ax
1:02CA  50                push     ax
1:02CB  ff36d003          push     word ptr [0x3d0]
1:02CF  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectObject
1:02D4  c41e9211          les      bx, ptr [0x1192]
1:02D8  26837f0c00        cmp      word ptr es:[bx + 0xc], 0
1:02DD  7416              je       0x2f5
1:02DF  9affff0000        lcall    0, 0xffff  ; @1:SOUND.OpenSound
1:02E4  b80100            mov      ax, 1
1:02E7  50                push     ax
1:02E8  b8e803            mov      ax, 0x3e8
1:02EB  50                push     ax
1:02EC  9affff0000        lcall    0, 0xffff  ; @1:SOUND.SetVoiceQueueSize
1:02F1  0e                push     cs
1:02F2  e89002            call     0x585
1:02F5  c746f80000        mov      word ptr [bp - 8], 0
1:02FA  e9bb01            jmp      0x4b8
1:02FD  b8b000            mov      ax, 0xb0
1:0300  f76ef8            imul     word ptr [bp - 8]
1:0303  8bd8              mov      bx, ax
1:0305  a1c603            mov      ax, word ptr [0x3c6]
1:0308  29877a04          sub      word ptr [bx + 0x47a], ax
1:030C  b83003            mov      ax, 0x330
1:030F  50                push     ax
1:0310  b96a03            mov      cx, 0x36a
1:0313  51                push     cx
1:0314  ba1800            mov      dx, 0x18
1:0317  b8b000            mov      ax, 0xb0
1:031A  8bda              mov      bx, dx
1:031C  f76ef8            imul     word ptr [bp - 8]
1:031F  8bf0              mov      si, ax
1:0321  8b847a04          mov      ax, word ptr [si + 0x47a]
1:0325  99                cdq      
1:0326  f7fb              idiv     bx
1:0328  8bc2              mov      ax, dx
1:032A  50                push     ax
1:032B  0e                push     cs
1:032C  e81504            call     0x744
1:032F  83c406            add      sp, 6
1:0332  b81600            mov      ax, 0x16
1:0335  f76ef8            imul     word ptr [bp - 8]
1:0338  8bd8              mov      bx, ax
1:033A  8b7ef8            mov      di, word ptr [bp - 8]
1:033D  d1e7              shl      di, 1
1:033F  039d3a03          add      bx, word ptr [di + 0x33a]
1:0343  b103              mov      cl, 3
1:0345  d3e3              shl      bx, cl
1:0347  8d97d203          lea      dx, [bx + 0x3d2]
1:034B  8b9c7c04          mov      bx, word ptr [si + 0x47c]
1:034F  03d8              add      bx, ax
1:0351  d3e3              shl      bx, cl
1:0353  51                push     cx
1:0354  56                push     si
1:0355  57                push     di
1:0356  8dbfd203          lea      di, [bx + 0x3d2]
1:035A  8bf2              mov      si, dx
1:035C  1e                push     ds
1:035D  07                pop      es
1:035E  a5                movsw    word ptr es:[di], word ptr [si]
1:035F  a5                movsw    word ptr es:[di], word ptr [si]
1:0360  a5                movsw    word ptr es:[di], word ptr [si]
1:0361  a5                movsw    word ptr es:[di], word ptr [si]
1:0362  5f                pop      di
1:0363  5e                pop      si
1:0364  59                pop      cx
1:0365  8bd0              mov      dx, ax
1:0367  03847c04          add      ax, word ptr [si + 0x47c]
1:036B  d3e0              shl      ax, cl
1:036D  05d203            add      ax, 0x3d2
1:0370  1e                push     ds
1:0371  50                push     ax
1:0372  ff366a03          push     word ptr [0x36a]
1:0376  ff363003          push     word ptr [0x330]
1:037A  8956ea            mov      word ptr [bp - 0x16], dx
1:037D  9affff0000        lcall    0, 0xffff  ; @1:USER.OffsetRect
1:0382  b86203            mov      ax, 0x362
1:0385  b103              mov      cl, 3
1:0387  8b9c7c04          mov      bx, word ptr [si + 0x47c]
1:038B  035eea            add      bx, word ptr [bp - 0x16]
1:038E  d3e3              shl      bx, cl
1:0390  51                push     cx
1:0391  56                push     si
1:0392  57                push     di
1:0393  8bf8              mov      di, ax
1:0395  8db7d203          lea      si, [bx + 0x3d2]
1:0399  1e                push     ds
1:039A  07                pop      es
1:039B  a5                movsw    word ptr es:[di], word ptr [si]
1:039C  a5                movsw    word ptr es:[di], word ptr [si]
1:039D  a5                movsw    word ptr es:[di], word ptr [si]
1:039E  a5                movsw    word ptr es:[di], word ptr [si]
1:039F  5f                pop      di
1:03A0  5e                pop      si
1:03A1  59                pop      cx
1:03A2  ba3203            mov      dx, 0x332
1:03A5  1e                push     ds
1:03A6  52                push     dx
1:03A7  babc03            mov      dx, 0x3bc
1:03AA  1e                push     ds
1:03AB  52                push     dx
1:03AC  1e                push     ds
1:03AD  50                push     ax
1:03AE  9affff0000        lcall    0, 0xffff  ; @1:USER.IntersectRect
1:03B3  b83203            mov      ax, 0x332
1:03B6  1e                push     ds
1:03B7  50                push     ax
1:03B8  b86203            mov      ax, 0x362
1:03BB  1e                push     ds
1:03BC  50                push     ax
1:03BD  9affff0000        lcall    0, 0xffff  ; @1:USER.EqualRect
1:03C2  0bc0              or       ax, ax
1:03C4  7542              jne      0x408
1:03C6  b103              mov      cl, 3
1:03C8  8b9c7c04          mov      bx, word ptr [si + 0x47c]
1:03CC  035eea            add      bx, word ptr [bp - 0x16]
1:03CF  d3e3              shl      bx, cl
1:03D1  8bbd3a03          mov      di, word ptr [di + 0x33a]
1:03D5  037eea            add      di, word ptr [bp - 0x16]
1:03D8  d3e7              shl      di, cl
1:03DA  56                push     si
1:03DB  8db5d203          lea      si, [di + 0x3d2]
1:03DF  8dbfd203          lea      di, [bx + 0x3d2]
1:03E3  1e                push     ds
1:03E4  07                pop      es
1:03E5  a5                movsw    word ptr es:[di], word ptr [si]
1:03E6  a5                movsw    word ptr es:[di], word ptr [si]
1:03E7  a5                movsw    word ptr es:[di], word ptr [si]
1:03E8  a5                movsw    word ptr es:[di], word ptr [si]
1:03E9  5e                pop      si
1:03EA  9a36050000        lcall    0, 0x536  ; @1:INT:ord_4(1:0BA4)
1:03EF  250100            and      ax, 1
1:03F2  7407              je       0x3fb
1:03F4  83847a041e        add      word ptr [si + 0x47a], 0x1e
1:03F9  eb0d              jmp      0x408
1:03FB  b8b000            mov      ax, 0xb0
1:03FE  f76ef8            imul     word ptr [bp - 8]
1:0401  8bd8              mov      bx, ax
1:0403  83af7a041e        sub      word ptr [bx + 0x47a], 0x1e
1:0408  ff36ba03          push     word ptr [0x3ba]
1:040C  a16203            mov      ax, word ptr [0x362]
1:040F  48                dec      ax
1:0410  50                push     ax
1:0411  a16403            mov      ax, word ptr [0x364]
1:0414  48                dec      ax
1:0415  50                push     ax
1:0416  b80600            mov      ax, 6
1:0419  50                push     ax
1:041A  50                push     ax
1:041B  ff76f0            push     word ptr [bp - 0x10]
1:041E  b80800            mov      ax, 8
1:0421  50                push     ax
1:0422  2bc0              sub      ax, ax
1:0424  50                push     ax
1:0425  b9c600            mov      cx, 0xc6
1:0428  ba8800            mov      dx, 0x88
1:042B  52                push     dx
1:042C  51                push     cx
1:042D  9a94040000        lcall    0, 0x494  ; @1:GDI.BitBlt
1:0432  c41ec803          les      bx, ptr [0x3c8]
1:0436  26837f0a01        cmp      word ptr es:[bx + 0xa], 1
1:043B  7514              jne      0x451
1:043D  ff36ba03          push     word ptr [0x3ba]
1:0441  2bc0              sub      ax, ax
1:0443  50                push     ax
1:0444  9a65010000        lcall    0, 0x165  ; @1:GDI.GetStockObject
1:0449  50                push     ax
1:044A  9a6c040000        lcall    0, 0x46c  ; @1:GDI.SelectObject
1:044F  eb22              jmp      0x473
1:0451  ff36ba03          push     word ptr [0x3ba]
1:0455  b8b000            mov      ax, 0xb0
1:0458  f76ef8            imul     word ptr [bp - 8]
1:045B  8bd8              mov      bx, ax
1:045D  ffb78004          push     word ptr [bx + 0x480]
1:0461  ffb77e04          push     word ptr [bx + 0x47e]
1:0465  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateSolidBrush
1:046A  50                push     ax
1:046B  9aab040000        lcall    0, 0x4ab  ; @1:GDI.SelectObject
1:0470  8946f2            mov      word ptr [bp - 0xe], ax
1:0473  ff36ba03          push     word ptr [0x3ba]
1:0477  ff366203          push     word ptr [0x362]
1:047B  ff366403          push     word ptr [0x364]
1:047F  b80400            mov      ax, 4
1:0482  50                push     ax
1:0483  50                push     ax
1:0484  ff76f0            push     word ptr [bp - 0x10]
1:0487  50                push     ax
1:0488  2bc0              sub      ax, ax
1:048A  50                push     ax
1:048B  b84607            mov      ax, 0x746
1:048E  bae200            mov      dx, 0xe2
1:0491  52                push     dx
1:0492  50                push     ax
1:0493  9a31050000        lcall    0, 0x531  ; @1:GDI.BitBlt
1:0498  c41ec803          les      bx, ptr [0x3c8]
1:049C  26837f0a01        cmp      word ptr es:[bx + 0xa], 1
1:04A1  7e12              jle      0x4b5
1:04A3  ff36ba03          push     word ptr [0x3ba]
1:04A7  ff76f2            push     word ptr [bp - 0xe]
1:04AA  9a59010000        lcall    0, 0x159  ; @1:GDI.SelectObject
1:04AF  50                push     ax
1:04B0  9a36070000        lcall    0, 0x736  ; @1:GDI.DeleteObject
1:04B5  ff46f8            inc      word ptr [bp - 8]
1:04B8  8b46f8            mov      ax, word ptr [bp - 8]
1:04BB  c41e9211          les      bx, ptr [0x1192]
1:04BF  2639470a          cmp      word ptr es:[bx + 0xa], ax
1:04C3  7f03              jg       0x4c8
1:04C5  e98c00            jmp      0x554
1:04C8  b9b000            mov      cx, 0xb0
1:04CB  f7e9              imul     cx
1:04CD  8bf0              mov      si, ax
1:04CF  8b847c04          mov      ax, word ptr [si + 0x47c]
1:04D3  8b7ef8            mov      di, word ptr [bp - 8]
1:04D6  d1e7              shl      di, 1
1:04D8  89853a03          mov      word ptr [di + 0x33a], ax
1:04DC  99                cdq      
1:04DD  26f77f08          idiv     word ptr es:[bx + 8]
1:04E1  42                inc      dx
1:04E2  89947c04          mov      word ptr [si + 0x47c], dx
1:04E6  b81600            mov      ax, 0x16
1:04E9  f76ef8            imul     word ptr [bp - 8]
1:04EC  8bd8              mov      bx, ax
1:04EE  039c7c04          add      bx, word ptr [si + 0x47c]
1:04F2  b103              mov      cl, 3
1:04F4  d3e3              shl      bx, cl
1:04F6  b86203            mov      ax, 0x362
1:04F9  8bf8              mov      di, ax
1:04FB  8db7d203          lea      si, [bx + 0x3d2]
1:04FF  1e                push     ds
1:0500  07                pop      es
1:0501  a5                movsw    word ptr es:[di], word ptr [si]
1:0502  a5                movsw    word ptr es:[di], word ptr [si]
1:0503  a5                movsw    word ptr es:[di], word ptr [si]
1:0504  a5                movsw    word ptr es:[di], word ptr [si]
1:0505  1e                push     ds
1:0506  50                push     ax
1:0507  9affff0000        lcall    0, 0xffff  ; @1:USER.IsRectEmpty
1:050C  0bc0              or       ax, ax
1:050E  7525              jne      0x535
1:0510  ff36ba03          push     word ptr [0x3ba]
1:0514  ff366203          push     word ptr [0x362]
1:0518  ff366403          push     word ptr [0x364]
1:051C  b80400            mov      ax, 4
1:051F  50                push     ax
1:0520  50                push     ax
1:0521  ff76f0            push     word ptr [bp - 0x10]
1:0524  2bc0              sub      ax, ax
1:0526  50                push     ax
1:0527  50                push     ax
1:0528  b8c600            mov      ax, 0xc6
1:052B  ba8800            mov      dx, 0x88
1:052E  52                push     dx
1:052F  50                push     ax
1:0530  9affff0000        lcall    0, 0xffff  ; @1:GDI.BitBlt
1:0535  9a33060000        lcall    0, 0x633  ; @1:INT:ord_4(1:0BA4)
1:053A  250100            and      ax, 1
1:053D  7503              jne      0x542
1:053F  e9bbfd            jmp      0x2fd
1:0542  b8b000            mov      ax, 0xb0
1:0545  f76ef8            imul     word ptr [bp - 8]
1:0548  8bd8              mov      bx, ax
1:054A  a1c603            mov      ax, word ptr [0x3c6]
1:054D  01877a04          add      word ptr [bx + 0x47a], ax
1:0551  e9b8fd            jmp      0x30c
1:0554  ff76f0            push     word ptr [bp - 0x10]
1:0557  9a6d020000        lcall    0, 0x26d  ; @1:GDI.DeleteDC
1:055C  c41e9211          les      bx, ptr [0x1192]
1:0560  26837f0c00        cmp      word ptr es:[bx + 0xc], 0
1:0565  7412              je       0x579
1:0567  2bc0              sub      ax, ax
1:0569  50                push     ax
1:056A  9affff0000        lcall    0, 0xffff  ; @1:SOUND.WaitSoundState
1:056F  9affff0000        lcall    0, 0xffff  ; @1:SOUND.StopSound
1:0574  9affff0000        lcall    0, 0xffff  ; @1:SOUND.CloseSound
1:0579  2bc0              sub      ax, ax
1:057B  5e                pop      si
1:057C  5f                pop      di
1:057D  4d                dec      bp
1:057E  4d                dec      bp
1:057F  8be5              mov      sp, bp
1:0581  1f                pop      ds
1:0582  5d                pop      bp
1:0583  4d                dec      bp
1:0584  cb                retf     
1:0585  1e                push     ds
1:0586  58                pop      ax
1:0587  90                nop      
1:0588  45                inc      bp
1:0589  55                push     bp
1:058A  8bec              mov      bp, sp
1:058C  1e                push     ds
1:058D  8ed8              mov      ds, ax
1:058F  83ec08            sub      sp, 8
1:0592  57                push     di
1:0593  56                push     si
1:0594  b80600            mov      ax, 6
1:0597  50                push     ax
1:0598  b81600            mov      ax, 0x16
1:059B  50                push     ax
1:059C  9affff0000        lcall    0, 0xffff  ; @1:SOUND.SetSoundNoise
1:05A1  9a42060000        lcall    0, 0x642  ; @1:USER.GetTickCount
1:05A6  3b16b803          cmp      dx, word ptr [0x3b8]
1:05AA  7303              jae      0x5af
1:05AC  e9da00            jmp      0x689
1:05AF  7709              ja       0x5ba
1:05B1  3b06b603          cmp      ax, word ptr [0x3b6]
1:05B5  7303              jae      0x5ba
1:05B7  e9cf00            jmp      0x689
1:05BA  c746fa0400        mov      word ptr [bp - 6], 4
1:05BF  c746f80500        mov      word ptr [bp - 8], 5
1:05C4  833e100000        cmp      word ptr [0x10], 0
1:05C9  7435              je       0x600
1:05CB  b80900            mov      ax, 9
1:05CE  8946fa            mov      word ptr [bp - 6], ax
1:05D1  8946fc            mov      word ptr [bp - 4], ax
1:05D4  eb17              jmp      0x5ed
1:05D6  b80100            mov      ax, 1
1:05D9  50                push     ax
1:05DA  ff76fc            push     word ptr [bp - 4]
1:05DD  b86400            mov      ax, 0x64
1:05E0  50                push     ax
1:05E1  b80a00            mov      ax, 0xa
1:05E4  50                push     ax
1:05E5  9a1d060000        lcall    0, 0x61d  ; @1:SOUND.SetVoiceNote
1:05EA  ff46fc            inc      word ptr [bp - 4]
1:05ED  8b46f8            mov      ax, word ptr [bp - 8]
1:05F0  0346fa            add      ax, word ptr [bp - 6]
1:05F3  3b46fc            cmp      ax, word ptr [bp - 4]
1:05F6  7fde              jg       0x5d6
1:05F8  c70610000000      mov      word ptr [0x10], 0
1:05FE  eb32              jmp      0x632
1:0600  8346fa05          add      word ptr [bp - 6], 5
1:0604  8b46fa            mov      ax, word ptr [bp - 6]
1:0607  0346f8            add      ax, word ptr [bp - 8]
1:060A  8946fc            mov      word ptr [bp - 4], ax
1:060D  eb15              jmp      0x624
1:060F  b90100            mov      cx, 1
1:0612  51                push     cx
1:0613  50                push     ax
1:0614  b86400            mov      ax, 0x64
1:0617  50                push     ax
1:0618  b80a00            mov      ax, 0xa
1:061B  50                push     ax
1:061C  9affff0000        lcall    0, 0xffff  ; @1:SOUND.SetVoiceNote
1:0621  ff4efc            dec      word ptr [bp - 4]
1:0624  8b46fc            mov      ax, word ptr [bp - 4]
1:0627  3946fa            cmp      word ptr [bp - 6], ax
1:062A  7ce3              jl       0x60f
1:062C  c70610000100      mov      word ptr [0x10], 1
1:0632  9a4b060000        lcall    0, 0x64b  ; @1:INT:ord_4(1:0BA4)
1:0637  b90400            mov      cx, 4
1:063A  99                cdq      
1:063B  f7f9              idiv     cx
1:063D  0bd2              or       dx, dx
1:063F  7520              jne      0x661
1:0641  9a62060000        lcall    0, 0x662  ; @1:USER.GetTickCount
1:0646  8bf0              mov      si, ax
1:0648  8bfa              mov      di, dx
1:064A  9a6b060000        lcall    0, 0x66b  ; @1:INT:ord_4(1:0BA4)
1:064F  b92c01            mov      cx, 0x12c
1:0652  99                cdq      
1:0653  f7f9              idiv     cx
1:0655  8bc2              mov      ax, dx
1:0657  99                cdq      
1:0658  03c6              add      ax, si
1:065A  13d7              adc      dx, di
1:065C  05c800            add      ax, 0xc8
1:065F  eb1e              jmp      0x67f
1:0661  9a72020000        lcall    0, 0x272  ; @1:USER.GetTickCount
1:0666  8bf0              mov      si, ax
1:0668  8bfa              mov      di, dx
1:066A  9a92000000        lcall    0, 0x92  ; @1:INT:ord_4(1:0BA4)
1:066F  b90500            mov      cx, 5
1:0672  99                cdq      
1:0673  f7f9              idiv     cx
1:0675  8bc2              mov      ax, dx
1:0677  99                cdq      
1:0678  03c6              add      ax, si
1:067A  13d7              adc      dx, di
1:067C  056400            add      ax, 0x64
1:067F  83d200            adc      dx, 0
1:0682  a3b603            mov      word ptr [0x3b6], ax
1:0685  8916b803          mov      word ptr [0x3b8], dx
1:0689  9affff0000        lcall    0, 0xffff  ; @1:SOUND.StartSound
1:068E  5e                pop      si
1:068F  5f                pop      di
1:0690  4d                dec      bp
1:0691  4d                dec      bp
1:0692  8be5              mov      sp, bp
1:0694  1f                pop      ds
1:0695  5d                pop      bp
1:0696  4d                dec      bp
1:0697  cb                retf     

; ===== EXPORT:ord_11(#11) =====
1:0698  1e                push     ds
1:0699  58                pop      ax
1:069A  90                nop      
1:069B  45                inc      bp
1:069C  55                push     bp
1:069D  8bec              mov      bp, sp
1:069F  1e                push     ds
1:06A0  8ed8              mov      ds, ax
1:06A2  2bc0              sub      ax, ax
1:06A4  4d                dec      bp
1:06A5  4d                dec      bp
1:06A6  8be5              mov      sp, bp
1:06A8  1f                pop      ds
1:06A9  5d                pop      bp
1:06AA  4d                dec      bp
1:06AB  cb                retf     

; ===== EXPORT:ord_6(#6) =====
1:06AC  1e                push     ds
1:06AD  58                pop      ax
1:06AE  90                nop      
1:06AF  45                inc      bp
1:06B0  55                push     bp
1:06B1  8bec              mov      bp, sp
1:06B3  1e                push     ds
1:06B4  8ed8              mov      ds, ax
1:06B6  2bc0              sub      ax, ax
1:06B8  4d                dec      bp
1:06B9  4d                dec      bp
1:06BA  8be5              mov      sp, bp
1:06BC  1f                pop      ds
1:06BD  5d                pop      bp
1:06BE  4d                dec      bp
1:06BF  cb                retf     

; ===== EXPORT:ord_5(#5) =====
1:06C0  1e                push     ds
1:06C1  58                pop      ax
1:06C2  90                nop      
1:06C3  45                inc      bp
1:06C4  55                push     bp
1:06C5  8bec              mov      bp, sp
1:06C7  1e                push     ds
1:06C8  8ed8              mov      ds, ax
1:06CA  8b4606            mov      ax, word ptr [bp + 6]
1:06CD  0bc0              or       ax, ax
1:06CF  740b              je       0x6dc
1:06D1  48                dec      ax
1:06D2  741a              je       0x6ee
1:06D4  48                dec      ax
1:06D5  7417              je       0x6ee
1:06D7  48                dec      ax
1:06D8  7414              je       0x6ee
1:06DA  eb26              jmp      0x702
1:06DC  c41e9211          les      bx, ptr [0x1192]
1:06E0  26ff7706          push     word ptr es:[bx + 6]
1:06E4  0e                push     cs
1:06E5  e818f9            call     0
1:06E8  5b                pop      bx
1:06E9  a3c603            mov      word ptr [0x3c6], ax
1:06EC  eb14              jmp      0x702
1:06EE  c41ec803          les      bx, ptr [0x3c8]
1:06F2  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:06F7  7509              jne      0x702
1:06F9  0e                push     cs
1:06FA  e82300            call     0x720
1:06FD  b80300            mov      ax, 3
1:0700  eb02              jmp      0x704
1:0702  2bc0              sub      ax, ax
1:0704  4d                dec      bp
1:0705  4d                dec      bp
1:0706  8be5              mov      sp, bp
1:0708  1f                pop      ds
1:0709  5d                pop      bp
1:070A  4d                dec      bp
1:070B  cb                retf     

; ===== EXPORT:ord_7(#7) =====
1:070C  1e                push     ds
1:070D  58                pop      ax
1:070E  90                nop      
1:070F  45                inc      bp
1:0710  55                push     bp
1:0711  8bec              mov      bp, sp
1:0713  1e                push     ds
1:0714  8ed8              mov      ds, ax
1:0716  2bc0              sub      ax, ax
1:0718  4d                dec      bp
1:0719  4d                dec      bp
1:071A  8be5              mov      sp, bp
1:071C  1f                pop      ds
1:071D  5d                pop      bp
1:071E  4d                dec      bp
1:071F  cb                retf     

; ===== EXPORT:ord_8(#8) =====
1:0720  1e                push     ds
1:0721  58                pop      ax
1:0722  90                nop      
1:0723  45                inc      bp
1:0724  55                push     bp
1:0725  8bec              mov      bp, sp
1:0727  1e                push     ds
1:0728  8ed8              mov      ds, ax
1:072A  833ed00300        cmp      word ptr [0x3d0], 0
1:072F  7409              je       0x73a
1:0731  ff36d003          push     word ptr [0x3d0]
1:0735  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteObject
1:073A  2bc0              sub      ax, ax
1:073C  4d                dec      bp
1:073D  4d                dec      bp
1:073E  8be5              mov      sp, bp
1:0740  1f                pop      ds
1:0741  5d                pop      bp
1:0742  4d                dec      bp
1:0743  cb                retf     
1:0744  1e                push     ds
1:0745  58                pop      ax
1:0746  90                nop      
1:0747  45                inc      bp
1:0748  55                push     bp
1:0749  8bec              mov      bp, sp
1:074B  1e                push     ds
1:074C  8ed8              mov      ds, ax
1:074E  8b4606            mov      ax, word ptr [bp + 6]
1:0751  e91501            jmp      0x869
1:0754  8b5e08            mov      bx, word ptr [bp + 8]
1:0757  c7070300          mov      word ptr [bx], 3
1:075B  8b5e0a            mov      bx, word ptr [bp + 0xa]
1:075E  c7070000          mov      word ptr [bx], 0
1:0762  e94101            jmp      0x8a6
1:0765  8b5e08            mov      bx, word ptr [bp + 8]
1:0768  c7070300          mov      word ptr [bx], 3
1:076C  8b5e0a            mov      bx, word ptr [bp + 0xa]
1:076F  c707ffff          mov      word ptr [bx], 0xffff
1:0773  e93001            jmp      0x8a6
1:0776  8b5e08            mov      bx, word ptr [bp + 8]
1:0779  c7070300          mov      word ptr [bx], 3
1:077D  8b5e0a            mov      bx, word ptr [bp + 0xa]
1:0780  c707feff          mov      word ptr [bx], 0xfffe
1:0784  e91f01            jmp      0x8a6
1:0787  8b5e08            mov      bx, word ptr [bp + 8]
1:078A  c7070300          mov      word ptr [bx], 3
1:078E  8b5e0a            mov      bx, word ptr [bp + 0xa]
1:0791  c707fdff          mov      word ptr [bx], 0xfffd
1:0795  e90e01            jmp      0x8a6
1:0798  8b5e08            mov      bx, word ptr [bp + 8]
1:079B  c7070200          mov      word ptr [bx], 2
1:079F  ebed              jmp      0x78e
1:07A1  8b5e08            mov      bx, word ptr [bp + 8]
1:07A4  c7070100          mov      word ptr [bx], 1
1:07A8  ebe4              jmp      0x78e
1:07AA  8b5e08            mov      bx, word ptr [bp + 8]
1:07AD  c7070000          mov      word ptr [bx], 0
1:07B1  ebdb              jmp      0x78e
1:07B3  8b5e08            mov      bx, word ptr [bp + 8]
1:07B6  c707ffff          mov      word ptr [bx], 0xffff
1:07BA  ebd2              jmp      0x78e
1:07BC  8b5e08            mov      bx, word ptr [bp + 8]
1:07BF  c707feff          mov      word ptr [bx], 0xfffe
1:07C3  ebc9              jmp      0x78e
1:07C5  b8fdff            mov      ax, 0xfffd
1:07C8  8b5e08            mov      bx, word ptr [bp + 8]
1:07CB  8907              mov      word ptr [bx], ax
1:07CD  8b5e0a            mov      bx, word ptr [bp + 0xa]
1:07D0  8907              mov      word ptr [bx], ax
1:07D2  e9d100            jmp      0x8a6
1:07D5  8b5e08            mov      bx, word ptr [bp + 8]
1:07D8  c707fdff          mov      word ptr [bx], 0xfffd
1:07DC  eb9f              jmp      0x77d
1:07DE  8b5e08            mov      bx, word ptr [bp + 8]
1:07E1  c707fdff          mov      word ptr [bx], 0xfffd
1:07E5  eb85              jmp      0x76c
1:07E7  8b5e08            mov      bx, word ptr [bp + 8]
1:07EA  c707fdff          mov      word ptr [bx], 0xfffd
1:07EE  e96aff            jmp      0x75b
1:07F1  8b5e08            mov      bx, word ptr [bp + 8]
1:07F4  c707fdff          mov      word ptr [bx], 0xfffd
1:07F8  8b5e0a            mov      bx, word ptr [bp + 0xa]
1:07FB  c7070100          mov      word ptr [bx], 1
1:07FF  e9a400            jmp      0x8a6
1:0802  8b5e08            mov      bx, word ptr [bp + 8]
1:0805  c707fdff          mov      word ptr [bx], 0xfffd
1:0809  8b5e0a            mov      bx, word ptr [bp + 0xa]
1:080C  c7070200          mov      word ptr [bx], 2
1:0810  e99300            jmp      0x8a6
1:0813  8b5e08            mov      bx, word ptr [bp + 8]
1:0816  c707fdff          mov      word ptr [bx], 0xfffd
1:081A  8b5e0a            mov      bx, word ptr [bp + 0xa]
1:081D  c7070300          mov      word ptr [bx], 3
1:0821  e98200            jmp      0x8a6
1:0824  8b5e08            mov      bx, word ptr [bp + 8]
1:0827  c707feff          mov      word ptr [bx], 0xfffe
1:082B  ebed              jmp      0x81a
1:082D  8b5e08            mov      bx, word ptr [bp + 8]
1:0830  c707ffff          mov      word ptr [bx], 0xffff
1:0834  ebe4              jmp      0x81a
1:0836  8b5e08            mov      bx, word ptr [bp + 8]
1:0839  c7070000          mov      word ptr [bx], 0
1:083D  ebdb              jmp      0x81a
1:083F  8b5e08            mov      bx, word ptr [bp + 8]
1:0842  c7070100          mov      word ptr [bx], 1
1:0846  ebd2              jmp      0x81a
1:0848  8b5e08            mov      bx, word ptr [bp + 8]
1:084B  c7070200          mov      word ptr [bx], 2
1:084F  ebc9              jmp      0x81a
1:0851  b80300            mov      ax, 3
1:0854  e971ff            jmp      0x7c8
1:0857  8b5e08            mov      bx, word ptr [bp + 8]
1:085A  c7070300          mov      word ptr [bx], 3
1:085E  eba9              jmp      0x809
1:0860  8b5e08            mov      bx, word ptr [bp + 8]
1:0863  c7070300          mov      word ptr [bx], 3
1:0867  eb8f              jmp      0x7f8
1:0869  3d1700            cmp      ax, 0x17
1:086C  7738              ja       0x8a6
1:086E  d1e0              shl      ax, 1
1:0870  93                xchg     bx, ax
1:0871  2effa77608        jmp      word ptr cs:[bx + 0x876]
1:0876  54                push     sp
1:0877  07                pop      es
1:0878  6507              pop      es
1:087A  7607              jbe      0x883
1:087C  8707              xchg     word ptr [bx], ax
1:087E  98                cwde     
1:087F  07                pop      es
1:0880  a107aa            mov      ax, word ptr [0xaa07]
1:0883  07                pop      es
1:0884  b307              mov      bl, 7
1:0886  bc07c5            mov      sp, 0xc507
1:0889  07                pop      es
1:088A  d507              aad      7
1:088C  de07              fiadd    word ptr [bx]
1:088E  e707              out      7, ax
1:0890  f1                int1     
1:0891  07                pop      es
1:0892  0208              add      cl, byte ptr [bx + si]
1:0894  1308              adc      cx, word ptr [bx + si]
1:0896  2408              and      al, 8
1:0898  2d0836            sub      ax, 0x3608
1:089B  083f              or       byte ptr [bx], bh
1:089D  084808            or       byte ptr [bx + si + 8], cl
1:08A0  51                push     cx
1:08A1  085708            or       byte ptr [bx + 8], dl
1:08A4  60                pushaw   
1:08A5  08b80100          or       byte ptr [bx + si + 1], bh
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
1:08BB  9aeb030000        lcall    0, 0x3eb  ; @1:INT:ord_4(1:0BA4)
1:08C0  b90600            mov      cx, 6
1:08C3  99                cdq      
1:08C4  f7f9              idiv     cx
1:08C6  89166c03          mov      word ptr [0x36c], dx
1:08CA  8bc2              mov      ax, dx
1:08CC  eb22              jmp      0x8f0
1:08CE  b8ff00            mov      ax, 0xff
1:08D1  2bd2              sub      dx, dx
1:08D3  eb34              jmp      0x909
1:08D5  b8ff00            mov      ax, 0xff
1:08D8  baff00            mov      dx, 0xff
1:08DB  eb2c              jmp      0x909
1:08DD  2bc0              sub      ax, ax
1:08DF  ebf7              jmp      0x8d8
1:08E1  b800ff            mov      ax, 0xff00
1:08E4  ebf2              jmp      0x8d8
1:08E6  b800ff            mov      ax, 0xff00
1:08E9  ebe6              jmp      0x8d1
1:08EB  b8ffff            mov      ax, 0xffff
1:08EE  ebe1              jmp      0x8d1
1:08F0  3d0500            cmp      ax, 5
1:08F3  7714              ja       0x909
1:08F5  d1e0              shl      ax, 1
1:08F7  93                xchg     bx, ax
1:08F8  2effa7fd08        jmp      word ptr cs:[bx + 0x8fd]
1:08FD  ce                into     
1:08FE  08d5              or       ch, dl
1:0900  08dd              or       ch, bl
1:0902  08e1              or       cl, ah
1:0904  08e6              or       dh, ah
1:0906  08eb              or       bl, ch
1:0908  084d4d            or       byte ptr [di + 0x4d], cl
1:090B  8be5              mov      sp, bp
1:090D  1f                pop      ds
1:090E  5d                pop      bp
1:090F  4d                dec      bp
1:0910  cb                retf     
1:0911  001e5890          add      byte ptr [0x9058], bl
1:0915  45                inc      bp
1:0916  55                push     bp
1:0917  8bec              mov      bp, sp
1:0919  1e                push     ds
1:091A  8ed8              mov      ds, ax
1:091C  837e0a00          cmp      word ptr [bp + 0xa], 0
1:0920  7504              jne      0x926
1:0922  2bc0              sub      ax, ax
1:0924  eb09              jmp      0x92f
1:0926  8b460e            mov      ax, word ptr [bp + 0xe]
1:0929  a3ce03            mov      word ptr [0x3ce], ax
1:092C  b80100            mov      ax, 1
1:092F  4d                dec      bp
1:0930  4d                dec      bp
1:0931  8be5              mov      sp, bp
1:0933  1f                pop      ds
1:0934  5d                pop      bp
1:0935  4d                dec      bp
1:0936  ca0a00            retf     0xa

; ===== EXPORT:WEP(#2) =====
1:0939  1e                push     ds
1:093A  58                pop      ax
1:093B  90                nop      
1:093C  45                inc      bp
1:093D  55                push     bp
1:093E  8bec              mov      bp, sp
1:0940  1e                push     ds
1:0941  8ed8              mov      ds, ax
1:0943  b80100            mov      ax, 1
1:0946  4d                dec      bp
1:0947  4d                dec      bp
1:0948  8be5              mov      sp, bp
1:094A  1f                pop      ds
1:094B  5d                pop      bp
1:094C  4d                dec      bp
1:094D  ca0200            retf     2

; ===== EXPORT:MODULE(#1) =====
1:0950  1e                push     ds
1:0951  58                pop      ax
1:0952  90                nop      
1:0953  45                inc      bp
1:0954  55                push     bp
1:0955  8bec              mov      bp, sp
1:0957  1e                push     ds
1:0958  8ed8              mov      ds, ax
1:095A  83ec0a            sub      sp, 0xa
1:095D  56                push     si
1:095E  8b4608            mov      ax, word ptr [bp + 8]
1:0961  a3ba03            mov      word ptr [0x3ba], ax
1:0964  8b4606            mov      ax, word ptr [bp + 6]
1:0967  a3b003            mov      word ptr [0x3b0], ax
1:096A  50                push     ax
1:096B  9a8b090000        lcall    0, 0x98b  ; @1:KERNEL.GlobalLock
1:0970  a3c803            mov      word ptr [0x3c8], ax
1:0973  8916ca03          mov      word ptr [0x3ca], dx
1:0977  8bc2              mov      ax, dx
1:0979  0b06c803          or       ax, word ptr [0x3c8]
1:097D  7503              jne      0x982
1:097F  e96a01            jmp      0xaec
1:0982  c41ec803          les      bx, ptr [0x3c8]
1:0986  26ff7720          push     word ptr es:[bx + 0x20]
1:098A  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalLock
1:098F  a39211            mov      word ptr [0x1192], ax
1:0992  89169411          mov      word ptr [0x1194], dx
1:0996  8bc2              mov      ax, dx
1:0998  0b069211          or       ax, word ptr [0x1192]
1:099C  7503              jne      0x9a1
1:099E  e94201            jmp      0xae3
1:09A1  8b460a            mov      ax, word ptr [bp + 0xa]
1:09A4  e90801            jmp      0xaaf
1:09A7  c41ec803          les      bx, ptr [0x3c8]
1:09AB  26837f1465        cmp      word ptr es:[bx + 0x14], 0x65
1:09B0  7c0f              jl       0x9c1
1:09B2  26817f36f400      cmp      word ptr es:[bx + 0x36], 0xf4
1:09B8  7507              jne      0x9c1
1:09BA  26837f3878        cmp      word ptr es:[bx + 0x38], 0x78
1:09BF  740e              je       0x9cf
1:09C1  c70612000000      mov      word ptr [0x12], 0
1:09C7  c746fc0500        mov      word ptr [bp - 4], 5
1:09CC  e90701            jmp      0xad6
1:09CF  c70612000100      mov      word ptr [0x12], 1
1:09D5  e9fe00            jmp      0xad6
1:09D8  b86e03            mov      ax, 0x36e
1:09DB  50                push     ax
1:09DC  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_14(1:0B2E)
1:09E1  5b                pop      bx
1:09E2  ff366e03          push     word ptr [0x36e]
1:09E6  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_13(1:0B90)
1:09EB  5b                pop      bx
1:09EC  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:0051)
1:09F1  eb13              jmp      0xa06
1:09F3  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:0698)
1:09F8  eb0c              jmp      0xa06
1:09FA  833e120000        cmp      word ptr [0x12], 0
1:09FF  740b              je       0xa0c
1:0A01  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:029F)
1:0A06  8946fc            mov      word ptr [bp - 4], ax
1:0A09  e9ca00            jmp      0xad6
1:0A0C  ff36ba03          push     word ptr [0x3ba]
1:0A10  b800ff            mov      ax, 0xff00
1:0A13  baff00            mov      dx, 0xff
1:0A16  52                push     dx
1:0A17  50                push     ax
1:0A18  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextColor
1:0A1D  ff36ba03          push     word ptr [0x3ba]
1:0A21  2bc0              sub      ax, ax
1:0A23  50                push     ax
1:0A24  50                push     ax
1:0A25  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkColor
1:0A2A  ff36ba03          push     word ptr [0x3ba]
1:0A2E  2bc0              sub      ax, ax
1:0A30  50                push     ax
1:0A31  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextAlign
1:0A36  ff36ba03          push     word ptr [0x3ba]
1:0A3A  b80100            mov      ax, 1
1:0A3D  50                push     ax
1:0A3E  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkMode
1:0A43  ff36ba03          push     word ptr [0x3ba]
1:0A47  2bc0              sub      ax, ax
1:0A49  50                push     ax
1:0A4A  50                push     ax
1:0A4B  b81400            mov      ax, 0x14
1:0A4E  1e                push     ds
1:0A4F  50                push     ax
1:0A50  50                push     ax
1:0A51  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:0B12)
1:0A56  5b                pop      bx
1:0A57  50                push     ax
1:0A58  9affff0000        lcall    0, 0xffff  ; @1:GDI.TextOut
1:0A5D  eb77              jmp      0xad6
1:0A5F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:0720)
1:0A64  eba0              jmp      0xa06
1:0A66  a1ce03            mov      ax, word ptr [0x3ce]
1:0A69  c41e9211          les      bx, ptr [0x1192]
1:0A6D  26894716          mov      word ptr es:[bx + 0x16], ax
1:0A71  c746f60000        mov      word ptr [bp - 0xa], 0
1:0A76  8b46f6            mov      ax, word ptr [bp - 0xa]
1:0A79  8bf0              mov      si, ax
1:0A7B  d1e6              shl      si, 1
1:0A7D  40                inc      ax
1:0A7E  c41e9211          les      bx, ptr [0x1192]
1:0A82  2689400e          mov      word ptr es:[bx + si + 0xe], ax
1:0A86  ff46f6            inc      word ptr [bp - 0xa]
1:0A89  837ef604          cmp      word ptr [bp - 0xa], 4
1:0A8D  7ce7              jl       0xa76
1:0A8F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:070C)
1:0A94  e96fff            jmp      0xa06
1:0A97  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_6(1:06AC)
1:0A9C  e967ff            jmp      0xa06
1:0A9F  8b460a            mov      ax, word ptr [bp + 0xa]
1:0AA2  2d0700            sub      ax, 7
1:0AA5  50                push     ax
1:0AA6  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_5(1:06C0)
1:0AAB  5b                pop      bx
1:0AAC  e957ff            jmp      0xa06
1:0AAF  3d0c00            cmp      ax, 0xc
1:0AB2  7722              ja       0xad6
1:0AB4  d1e0              shl      ax, 1
1:0AB6  93                xchg     bx, ax
1:0AB7  2effa7bc0a        jmp      word ptr cs:[bx + 0xabc]
1:0ABC  d809              fmul     dword ptr [bx + di]
1:0ABE  f309fa            or       dx, di
1:0AC1  095f0a            or       word ptr [bx + 0xa], bx
1:0AC4  d6                salc     
1:0AC5  0a660a            or       ah, byte ptr [bp + 0xa]
1:0AC8  97                xchg     di, ax
1:0AC9  0a9f0a9f          or       bl, byte ptr [bx - 0x60f6]
1:0ACD  0a9f0a9f          or       bl, byte ptr [bx - 0x60f6]
1:0AD1  0ad6              or       dl, dh
1:0AD3  0aa709c4          or       ah, byte ptr [bx - 0x3bf7]
1:0AD7  1e                push     ds
1:0AD8  c80326ff          enter    0x2603, -1
1:0ADC  7720              ja       0xafe
1:0ADE  9ae80a0000        lcall    0, 0xae8  ; @1:KERNEL.GlobalUnlock
1:0AE3  ff36b003          push     word ptr [0x3b0]
1:0AE7  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalUnlock
1:0AEC  8b46fc            mov      ax, word ptr [bp - 4]
1:0AEF  5e                pop      si
1:0AF0  4d                dec      bp
1:0AF1  4d                dec      bp
1:0AF2  8be5              mov      sp, bp
1:0AF4  1f                pop      ds
1:0AF5  5d                pop      bp
1:0AF6  4d                dec      bp
1:0AF7  ca0600            retf     6
1:0AFA  0000              add      byte ptr [bx + si], al
1:0AFC  0000              add      byte ptr [bx + si], al
1:0AFE  0000              add      byte ptr [bx + si], al
1:0B00  0000              add      byte ptr [bx + si], al
1:0B02  0000              add      byte ptr [bx + si], al
1:0B04  0000              add      byte ptr [bx + si], al
1:0B06  0000              add      byte ptr [bx + si], al
1:0B08  0000              add      byte ptr [bx + si], al
1:0B0A  0000              add      byte ptr [bx + si], al
1:0B0C  0000              add      byte ptr [bx + si], al
1:0B0E  0000              add      byte ptr [bx + si], al
1:0B10  c3                ret      
1:0B11  00558b            add      byte ptr [di - 0x75], dl
1:0B14  ec                in       al, dx
1:0B15  8bd7              mov      dx, di
1:0B17  8cd8              mov      ax, ds
1:0B19  8ec0              mov      es, ax
1:0B1B  8b7e06            mov      di, word ptr [bp + 6]
1:0B1E  33c0              xor      ax, ax
1:0B20  b9ffff            mov      cx, 0xffff
1:0B23  f2ae              repne scasb al, byte ptr es:[di]
1:0B25  f7d1              not      cx
1:0B27  49                dec      cx
1:0B28  91                xchg     cx, ax
1:0B29  8bfa              mov      di, dx
1:0B2B  5d                pop      bp
1:0B2C  cb                retf     
1:0B2D  008cd890          add      byte ptr [si - 0x6f28], cl
1:0B31  45                inc      bp
1:0B32  55                push     bp
1:0B33  8bec              mov      bp, sp
1:0B35  1e                push     ds
1:0B36  8ed8              mov      ds, ax
1:0B38  56                push     si
1:0B39  b42a              mov      ah, 0x2a
1:0B3B  cd21              int      0x21
1:0B3D  8bda              mov      bx, dx
1:0B3F  8bf1              mov      si, cx
1:0B41  b42c              mov      ah, 0x2c
1:0B43  cd21              int      0x21
1:0B45  b400              mov      ah, 0
1:0B47  8ac6              mov      al, dh
1:0B49  50                push     ax
1:0B4A  8ac1              mov      al, cl
1:0B4C  50                push     ax
1:0B4D  8ac5              mov      al, ch
1:0B4F  50                push     ax
1:0B50  50                push     ax
1:0B51  b42a              mov      ah, 0x2a
1:0B53  cd21              int      0x21
1:0B55  3bda              cmp      bx, dx
1:0B57  58                pop      ax
1:0B58  7408              je       0xb62
1:0B5A  3c17              cmp      al, 0x17
1:0B5C  7504              jne      0xb62
1:0B5E  8bd3              mov      dx, bx
1:0B60  8bce              mov      cx, si
1:0B62  b400              mov      ah, 0
1:0B64  8ac2              mov      al, dl
1:0B66  50                push     ax
1:0B67  8ac6              mov      al, dh
1:0B69  50                push     ax
1:0B6A  81e9bc07          sub      cx, 0x7bc
1:0B6E  51                push     cx
1:0B6F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_16(1:0BD4)
1:0B74  83c40c            add      sp, 0xc
1:0B77  837e0600          cmp      word ptr [bp + 6], 0
1:0B7B  7408              je       0xb85
1:0B7D  8b5e06            mov      bx, word ptr [bp + 6]
1:0B80  895702            mov      word ptr [bx + 2], dx
1:0B83  8907              mov      word ptr [bx], ax
1:0B85  5e                pop      si
1:0B86  83ed02            sub      bp, 2
1:0B89  8be5              mov      sp, bp
1:0B8B  1f                pop      ds
1:0B8C  5d                pop      bp
1:0B8D  4d                dec      bp
1:0B8E  cb                retf     
1:0B8F  004555            add      byte ptr [di + 0x55], al
1:0B92  8bec              mov      bp, sp
1:0B94  8b4606            mov      ax, word ptr [bp + 6]
1:0B97  a35200            mov      word ptr [0x52], ax
1:0B9A  c70654000000      mov      word ptr [0x54], 0
1:0BA0  5d                pop      bp
1:0BA1  4d                dec      bp
1:0BA2  cb                retf     
1:0BA3  90                nop      

; ===== EXPORT:ord_4(#4) =====
1:0BA4  45                inc      bp
1:0BA5  55                push     bp
1:0BA6  8bec              mov      bp, sp
1:0BA8  b8fd43            mov      ax, 0x43fd
1:0BAB  ba0300            mov      dx, 3
1:0BAE  52                push     dx
1:0BAF  50                push     ax