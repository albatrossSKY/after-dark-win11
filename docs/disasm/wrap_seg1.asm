File: raw\unpacked\MODULES\WRAP.AD
Module: 'BLANKER' ('Graphics Module Library')
CS:IP=1:35B0  SS:SP=0:0000  AutoDS=2  Heap=4096  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (4): win87em, KERNEL, GDI, USER
Segments (2):
  SEG  1: CODE off=0x00700 len=0x35E2 min=0x35E2 flags=0x1D50 relocs=248
  SEG  2: DATA off=0x041A0 len=0x08BE min=0x08BE flags=0x0D61 relocs=15
Exports (67):
  ord   1: SEG1:0C2C flags=0x03 MODULE
  ord   2: SEG1:0C15 flags=0x03 WEP
  ord   3: SEG1:262E flags=0x03 ___EXPORTEDSTUB
  ord   4: SEG1:141E flags=0x00 
  ord   5: SEG1:0ED8 flags=0x00 
  ord   6: SEG1:1346 flags=0x00 
  ord   7: SEG1:0DD6 flags=0x00 
  ord   8: SEG1:0FD2 flags=0x00 
  ord   9: SEG1:13E0 flags=0x00 
  ord  10: SEG1:142A flags=0x00 
  ord  11: SEG1:1412 flags=0x00 
  ord  12: SEG1:1168 flags=0x00 
  ord  13: SEG1:0BAD flags=0x00 
  ord  14: SEG1:0B74 flags=0x00 
  ord  15: SEG1:0B3A flags=0x00 
  ord  16: SEG1:0B07 flags=0x00 
  ord  17: SEG1:0AC5 flags=0x00 
  ord  18: SEG1:0A8A flags=0x00 
  ord  19: SEG1:0A50 flags=0x00 
  ord  20: SEG1:0A1D flags=0x00 
  ord  21: SEG1:09DB flags=0x00 
  ord  22: SEG1:09A0 flags=0x00 
  ord  23: SEG1:0966 flags=0x00 
  ord  24: SEG1:0933 flags=0x00 
  ord  25: SEG1:0908 flags=0x00 
  ord  26: SEG1:0307 flags=0x00 
  ord  27: SEG1:02F3 flags=0x00 
  ord  28: SEG1:02DF flags=0x00 
  ord  29: SEG1:02C2 flags=0x00 
  ord  30: SEG1:1242 flags=0x00 
  ord  31: SEG1:0154 flags=0x00 
  ord  32: SEG1:027B flags=0x00 
  ord  33: SEG1:0012 flags=0x00 
  ord  34: SEG1:12C0 flags=0x00 
  ord  35: SEG1:125E flags=0x00 
  ord  36: SEG1:1304 flags=0x00 
  ord  37: SEG1:1326 flags=0x00 
  ord  38: SEG1:0BEE flags=0x00 
  ord  39: SEG1:147C flags=0x00 
  ord  40: SEG1:1B84 flags=0x00 
  ord  41: SEG1:1AFE flags=0x00 
  ord  42: SEG1:16A0 flags=0x00 
  ord  43: SEG1:1750 flags=0x00 
  ord  44: SEG1:162C flags=0x00 
  ord  45: SEG1:171A flags=0x00 
  ord  46: SEG1:1F16 flags=0x00 
  ord  47: SEG1:1468 flags=0x00 
  ord  48: SEG1:20E0 flags=0x00 
  ord  49: SEG1:1FA0 flags=0x00 
  ord  50: SEG1:21A6 flags=0x00 
  ord  51: SEG1:22A4 flags=0x00 
  ord  52: SEG1:25B0 flags=0x00 
  ord  53: SEG1:235E flags=0x00 
  ord  54: SEG1:2228 flags=0x00 
  ord  55: SEG1:225A flags=0x00 
  ord  56: SEG1:2600 flags=0x00 
  ord  57: SEG1:2316 flags=0x00 
  ord  58: SEG1:2218 flags=0x00 
  ord  59: SEG1:2642 flags=0x00 
  ord  60: SEG1:266A flags=0x00 
  ord  61: SEG1:270C flags=0x00 
  ord  62: SEG1:26D0 flags=0x00 
  ord  63: SEG1:2736 flags=0x00 
  ord  64: SEG1:266E flags=0x00 
  ord  65: SEG1:1FBA flags=0x00 
  ord  66: SEG1:305A flags=0x00 
  ord  67: SEG1:3246 flags=0x00 
Resources (7):
  TYPE_1000        #1               off=0x04AE0 len=    64
  TYPE_1000        #2               off=0x04B20 len=    64
  TYPE_1000        #3               off=0x04B60 len=    64
  TYPE_1000        #4               off=0x04BA0 len=    32
  TYPE_2000        #10              off=0x04BC0 len=    64
  TYPE_2000        #20              off=0x04C00 len=    16
  TYPE_2000        #30              off=0x04C10 len=   224

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

; ===== EXPORT:ord_33(#33) =====
1:0012  1e                push     ds
1:0013  58                pop      ax
1:0014  90                nop      
1:0015  45                inc      bp
1:0016  55                push     bp
1:0017  8bec              mov      bp, sp
1:0019  1e                push     ds
1:001A  8ed8              mov      ds, ax
1:001C  83ec04            sub      sp, 4
1:001F  c706d0070100      mov      word ptr [0x7d0], 1
1:0025  c706d2070000      mov      word ptr [0x7d2], 0
1:002B  c706c2071600      mov      word ptr [0x7c2], 0x16
1:0031  2bc0              sub      ax, ax
1:0033  a3dc07            mov      word ptr [0x7dc], ax
1:0036  a3da07            mov      word ptr [0x7da], ax
1:0039  a3de07            mov      word ptr [0x7de], ax
1:003C  c706e007ff00      mov      word ptr [0x7e0], 0xff
1:0042  c706ea07ff00      mov      word ptr [0x7ea], 0xff
1:0048  c706ec07ff00      mov      word ptr [0x7ec], 0xff
1:004E  b88000            mov      ax, 0x80
1:0051  8bd0              mov      dx, ax
1:0053  a3e607            mov      word ptr [0x7e6], ax
1:0056  8916e807          mov      word ptr [0x7e8], dx
1:005A  a3ee07            mov      word ptr [0x7ee], ax
1:005D  8916f007          mov      word ptr [0x7f0], dx
1:0061  c706f607ff00      mov      word ptr [0x7f6], 0xff
1:0067  c706f8070000      mov      word ptr [0x7f8], 0
1:006D  99                cdq      
1:006E  a3f207            mov      word ptr [0x7f2], ax
1:0071  8916f407          mov      word ptr [0x7f4], dx
1:0075  a3fa07            mov      word ptr [0x7fa], ax
1:0078  8916fc07          mov      word ptr [0x7fc], dx
1:007C  c7060208ffff      mov      word ptr [0x802], 0xffff
1:0082  c70604080000      mov      word ptr [0x804], 0
1:0088  b88080            mov      ax, 0x8080
1:008B  2bd2              sub      dx, dx
1:008D  a3fe07            mov      word ptr [0x7fe], ax
1:0090  89160008          mov      word ptr [0x800], dx
1:0094  a30608            mov      word ptr [0x806], ax
1:0097  89160808          mov      word ptr [0x808], dx
1:009B  c7060a085555      mov      word ptr [0x80a], 0x5555
1:00A1  c7060c085500      mov      word ptr [0x80c], 0x55
1:00A7  c7060e08ffff      mov      word ptr [0x80e], 0xffff
1:00AD  c7061008ff00      mov      word ptr [0x810], 0xff
1:00B3  c7061208aaaa      mov      word ptr [0x812], 0xaaaa
1:00B9  c7061408aa00      mov      word ptr [0x814], 0xaa
1:00BF  c7061a0800ff      mov      word ptr [0x81a], 0xff00
1:00C5  89161c08          mov      word ptr [0x81c], dx
1:00C9  b80080            mov      ax, 0x8000
1:00CC  a31608            mov      word ptr [0x816], ax
1:00CF  89161808          mov      word ptr [0x818], dx
1:00D3  a31e08            mov      word ptr [0x81e], ax
1:00D6  89162008          mov      word ptr [0x820], dx
1:00DA  c706260800ff      mov      word ptr [0x826], 0xff00
1:00E0  c7062808ff00      mov      word ptr [0x828], 0xff
1:00E6  ba8000            mov      dx, 0x80
1:00E9  a32208            mov      word ptr [0x822], ax
1:00EC  89162408          mov      word ptr [0x824], dx
1:00F0  a32a08            mov      word ptr [0x82a], ax
1:00F3  89162c08          mov      word ptr [0x82c], dx
1:00F7  2bc0              sub      ax, ax
1:00F9  a3e207            mov      word ptr [0x7e2], ax
1:00FC  8916e407          mov      word ptr [0x7e4], dx
1:0100  a32e08            mov      word ptr [0x82e], ax
1:0103  89163008          mov      word ptr [0x830], dx
1:0107  c41eba08          les      bx, ptr [0x8ba]
1:010B  268b4708          mov      ax, word ptr es:[bx + 8]
1:010F  a3d407            mov      word ptr [0x7d4], ax
1:0112  c706ce07ffff      mov      word ptr [0x7ce], 0xffff
1:0118  2bc0              sub      ax, ax
1:011A  a3d807            mov      word ptr [0x7d8], ax
1:011D  a3d607            mov      word ptr [0x7d6], ax
1:0120  9aa3010000        lcall    0, 0x1a3  ; @1:USER.GetTickCount
1:0125  b104              mov      cl, 4
1:0127  9aaa010000        lcall    0, 0x1aa  ; @1:INT:ord_4(1:141E)
1:012C  a3d007            mov      word ptr [0x7d0], ax
1:012F  8916d207          mov      word ptr [0x7d2], dx
1:0133  2bc0              sub      ax, ax
1:0135  50                push     ax
1:0136  b90100            mov      cx, 1
1:0139  51                push     cx
1:013A  b9ffff            mov      cx, 0xffff
1:013D  baff00            mov      dx, 0xff
1:0140  52                push     dx
1:0141  51                push     cx
1:0142  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreatePen
1:0147  a3c407            mov      word ptr [0x7c4], ax
1:014A  2bc0              sub      ax, ax
1:014C  4d                dec      bp
1:014D  4d                dec      bp
1:014E  8be5              mov      sp, bp
1:0150  1f                pop      ds
1:0151  5d                pop      bp
1:0152  4d                dec      bp
1:0153  cb                retf     

; ===== EXPORT:ord_31(#31) =====
1:0154  1e                push     ds
1:0155  58                pop      ax
1:0156  90                nop      
1:0157  45                inc      bp
1:0158  55                push     bp
1:0159  8bec              mov      bp, sp
1:015B  1e                push     ds
1:015C  8ed8              mov      ds, ax
1:015E  83ec08            sub      sp, 8
1:0161  56                push     si
1:0162  c746fa0000        mov      word ptr [bp - 6], 0
1:0167  ff36b208          push     word ptr [0x8b2]
1:016B  ff36c407          push     word ptr [0x7c4]
1:016F  9a8d010000        lcall    0, 0x18d  ; @1:GDI.SelectObject
1:0174  a3c007            mov      word ptr [0x7c0], ax
1:0177  a1d407            mov      ax, word ptr [0x7d4]
1:017A  c41eba08          les      bx, ptr [0x8ba]
1:017E  26394708          cmp      word ptr es:[bx + 8], ax
1:0182  7417              je       0x19b
1:0184  ff36b208          push     word ptr [0x8b2]
1:0188  ff36c007          push     word ptr [0x7c0]
1:018C  9a6b020000        lcall    0, 0x26b  ; @1:GDI.SelectObject
1:0191  0e                push     cs
1:0192  e82d01            call     0x2c2
1:0195  b80300            mov      ax, 3
1:0198  e9d700            jmp      0x272
1:019B  833ece0700        cmp      word ptr [0x7ce], 0
1:01A0  7d7f              jge      0x221
1:01A2  9a46020000        lcall    0, 0x246  ; @1:USER.GetTickCount
1:01A7  b104              mov      cl, 4
1:01A9  9a4d020000        lcall    0, 0x24d  ; @1:INT:ord_4(1:141E)
1:01AE  8bc8              mov      cx, ax
1:01B0  b83c00            mov      ax, 0x3c
1:01B3  c41eba08          les      bx, ptr [0x8ba]
1:01B7  8bf2              mov      si, dx
1:01B9  26f76f06          imul     word ptr es:[bx + 6]
1:01BD  99                cdq      
1:01BE  0306d607          add      ax, word ptr [0x7d6]
1:01C2  1316d807          adc      dx, word ptr [0x7d8]
1:01C6  3bd6              cmp      dx, si
1:01C8  7603              jbe      0x1cd
1:01CA  e99500            jmp      0x262
1:01CD  7207              jb       0x1d6
1:01CF  3bc1              cmp      ax, cx
1:01D1  7603              jbe      0x1d6
1:01D3  e98c00            jmp      0x262
1:01D6  0e                push     cs
1:01D7  e8a100            call     0x27b
1:01DA  c706ce070000      mov      word ptr [0x7ce], 0
1:01E0  c41eb408          les      bx, ptr [0x8b4]
1:01E4  26837f0a20        cmp      word ptr es:[bx + 0xa], 0x20
1:01E9  7505              jne      0x1f0
1:01EB  b80400            mov      ax, 4
1:01EE  eb1b              jmp      0x20b
1:01F0  26837f0a08        cmp      word ptr es:[bx + 0xa], 8
1:01F5  7c05              jl       0x1fc
1:01F7  b80300            mov      ax, 3
1:01FA  eb0f              jmp      0x20b
1:01FC  26837f0a04        cmp      word ptr es:[bx + 0xa], 4
1:0201  7c05              jl       0x208
1:0203  b80200            mov      ax, 2
1:0206  eb03              jmp      0x20b
1:0208  b80100            mov      ax, 1
1:020B  c41eba08          les      bx, ptr [0x8ba]
1:020F  26ff770a          push     word ptr es:[bx + 0xa]
1:0213  50                push     ax
1:0214  b8c607            mov      ax, 0x7c6
1:0217  50                push     ax
1:0218  0e                push     cs
1:0219  e8ff00            call     0x31b
1:021C  83c406            add      sp, 6
1:021F  eb41              jmp      0x262
1:0221  a1ce07            mov      ax, word ptr [0x7ce]
1:0224  050a00            add      ax, 0xa
1:0227  8946fc            mov      word ptr [bp - 4], ax
1:022A  eb2e              jmp      0x25a
1:022C  50                push     ax
1:022D  0e                push     cs
1:022E  e84003            call     0x571
1:0231  5b                pop      bx
1:0232  a1d407            mov      ax, word ptr [0x7d4]
1:0235  ff06ce07          inc      word ptr [0x7ce]
1:0239  3906ce07          cmp      word ptr [0x7ce], ax
1:023D  7c1b              jl       0x25a
1:023F  c706ce07ffff      mov      word ptr [0x7ce], 0xffff
1:0245  9affff0000        lcall    0, 0xffff  ; @1:USER.GetTickCount
1:024A  b104              mov      cl, 4
1:024C  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_4(1:141E)
1:0251  a3d607            mov      word ptr [0x7d6], ax
1:0254  8916d807          mov      word ptr [0x7d8], dx
1:0258  eb08              jmp      0x262
1:025A  a1ce07            mov      ax, word ptr [0x7ce]
1:025D  3946fc            cmp      word ptr [bp - 4], ax
1:0260  7fca              jg       0x22c
1:0262  ff36b208          push     word ptr [0x8b2]
1:0266  ff36c007          push     word ptr [0x7c0]
1:026A  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectObject
1:026F  8b46fa            mov      ax, word ptr [bp - 6]
1:0272  5e                pop      si
1:0273  4d                dec      bp
1:0274  4d                dec      bp
1:0275  8be5              mov      sp, bp
1:0277  1f                pop      ds
1:0278  5d                pop      bp
1:0279  4d                dec      bp
1:027A  cb                retf     

; ===== EXPORT:ord_32(#32) =====
1:027B  1e                push     ds
1:027C  58                pop      ax
1:027D  90                nop      
1:027E  45                inc      bp
1:027F  55                push     bp
1:0280  8bec              mov      bp, sp
1:0282  1e                push     ds
1:0283  8ed8              mov      ds, ax
1:0285  b8c607            mov      ax, 0x7c6
1:0288  1e                push     ds
1:0289  50                push     ax
1:028A  2bc0              sub      ax, ax
1:028C  50                push     ax
1:028D  50                push     ax
1:028E  c41eba08          les      bx, ptr [0x8ba]
1:0292  26ff7702          push     word ptr es:[bx + 2]
1:0296  26ff7704          push     word ptr es:[bx + 4]
1:029A  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:029F  ff36b208          push     word ptr [0x8b2]
1:02A3  b8c607            mov      ax, 0x7c6
1:02A6  1e                push     ds
1:02A7  50                push     ax
1:02A8  b80400            mov      ax, 4
1:02AB  50                push     ax
1:02AC  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:02B1  50                push     ax
1:02B2  9affff0000        lcall    0, 0xffff  ; @1:USER.FillRect
1:02B7  b80a00            mov      ax, 0xa
1:02BA  4d                dec      bp
1:02BB  4d                dec      bp
1:02BC  8be5              mov      sp, bp
1:02BE  1f                pop      ds
1:02BF  5d                pop      bp
1:02C0  4d                dec      bp
1:02C1  cb                retf     

; ===== EXPORT:ord_29(#29) =====
1:02C2  1e                push     ds
1:02C3  58                pop      ax
1:02C4  90                nop      
1:02C5  45                inc      bp
1:02C6  55                push     bp
1:02C7  8bec              mov      bp, sp
1:02C9  1e                push     ds
1:02CA  8ed8              mov      ds, ax
1:02CC  ff36c407          push     word ptr [0x7c4]
1:02D0  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteObject
1:02D5  2bc0              sub      ax, ax
1:02D7  4d                dec      bp
1:02D8  4d                dec      bp
1:02D9  8be5              mov      sp, bp
1:02DB  1f                pop      ds
1:02DC  5d                pop      bp
1:02DD  4d                dec      bp
1:02DE  cb                retf     

; ===== EXPORT:ord_28(#28) =====
1:02DF  1e                push     ds
1:02E0  58                pop      ax
1:02E1  90                nop      
1:02E2  45                inc      bp
1:02E3  55                push     bp
1:02E4  8bec              mov      bp, sp
1:02E6  1e                push     ds
1:02E7  8ed8              mov      ds, ax
1:02E9  2bc0              sub      ax, ax
1:02EB  4d                dec      bp
1:02EC  4d                dec      bp
1:02ED  8be5              mov      sp, bp
1:02EF  1f                pop      ds
1:02F0  5d                pop      bp
1:02F1  4d                dec      bp
1:02F2  cb                retf     

; ===== EXPORT:ord_27(#27) =====
1:02F3  1e                push     ds
1:02F4  58                pop      ax
1:02F5  90                nop      
1:02F6  45                inc      bp
1:02F7  55                push     bp
1:02F8  8bec              mov      bp, sp
1:02FA  1e                push     ds
1:02FB  8ed8              mov      ds, ax
1:02FD  2bc0              sub      ax, ax
1:02FF  4d                dec      bp
1:0300  4d                dec      bp
1:0301  8be5              mov      sp, bp
1:0303  1f                pop      ds
1:0304  5d                pop      bp
1:0305  4d                dec      bp
1:0306  cb                retf     

; ===== EXPORT:ord_26(#26) =====
1:0307  1e                push     ds
1:0308  58                pop      ax
1:0309  90                nop      
1:030A  45                inc      bp
1:030B  55                push     bp
1:030C  8bec              mov      bp, sp
1:030E  1e                push     ds
1:030F  8ed8              mov      ds, ax
1:0311  2bc0              sub      ax, ax
1:0313  4d                dec      bp
1:0314  4d                dec      bp
1:0315  8be5              mov      sp, bp
1:0317  1f                pop      ds
1:0318  5d                pop      bp
1:0319  4d                dec      bp
1:031A  cb                retf     
1:031B  1e                push     ds
1:031C  58                pop      ax
1:031D  90                nop      
1:031E  45                inc      bp
1:031F  55                push     bp
1:0320  8bec              mov      bp, sp
1:0322  1e                push     ds
1:0323  8ed8              mov      ds, ax
1:0325  83ec14            sub      sp, 0x14
1:0328  2bc0              sub      ax, ax
1:032A  a33808            mov      word ptr [0x838], ax
1:032D  a33608            mov      word ptr [0x836], ax
1:0330  a13608            mov      ax, word ptr [0x836]
1:0333  39063808          cmp      word ptr [0x838], ax
1:0337  741a              je       0x353
1:0339  8b0e3a08          mov      cx, word ptr [0x83a]
1:033D  390e3c08          cmp      word ptr [0x83c], cx
1:0341  7410              je       0x353
1:0343  3bc8              cmp      cx, ax
1:0345  740c              je       0x353
1:0347  a13808            mov      ax, word ptr [0x838]
1:034A  39063c08          cmp      word ptr [0x83c], ax
1:034E  7403              je       0x353
1:0350  e90601            jmp      0x459
1:0353  b86d4e            mov      ax, 0x4e6d
1:0356  bac641            mov      dx, 0x41c6
1:0359  52                push     dx
1:035A  50                push     ax
1:035B  ff36d207          push     word ptr [0x7d2]
1:035F  ff36d007          push     word ptr [0x7d0]
1:0363  9a85030000        lcall    0, 0x385  ; @1:INT:ord_9(1:13E0)
1:0368  053930            add      ax, 0x3039
1:036B  83d200            adc      dx, 0
1:036E  a3d007            mov      word ptr [0x7d0], ax
1:0371  8916d207          mov      word ptr [0x7d2], dx
1:0375  80e67f            and      dh, 0x7f
1:0378  2bc9              sub      cx, cx
1:037A  8bda              mov      bx, dx
1:037C  b80d00            mov      ax, 0xd
1:037F  99                cdq      
1:0380  52                push     dx
1:0381  50                push     ax
1:0382  51                push     cx
1:0383  53                push     bx
1:0384  9aa4030000        lcall    0, 0x3a4  ; @1:INT:ord_9(1:13E0)
1:0389  b10f              mov      cl, 0xf
1:038B  9acc030000        lcall    0, 0x3cc  ; @1:INT:ord_4(1:141E)
1:0390  a33608            mov      word ptr [0x836], ax
1:0393  b86d4e            mov      ax, 0x4e6d
1:0396  bac641            mov      dx, 0x41c6
1:0399  52                push     dx
1:039A  50                push     ax
1:039B  ff36d207          push     word ptr [0x7d2]
1:039F  ff36d007          push     word ptr [0x7d0]
1:03A3  9ac5030000        lcall    0, 0x3c5  ; @1:INT:ord_9(1:13E0)
1:03A8  053930            add      ax, 0x3039
1:03AB  83d200            adc      dx, 0
1:03AE  a3d007            mov      word ptr [0x7d0], ax
1:03B1  8916d207          mov      word ptr [0x7d2], dx
1:03B5  80e67f            and      dh, 0x7f
1:03B8  2bc9              sub      cx, cx
1:03BA  8bda              mov      bx, dx
1:03BC  b80d00            mov      ax, 0xd
1:03BF  99                cdq      
1:03C0  52                push     dx
1:03C1  50                push     ax
1:03C2  51                push     cx
1:03C3  53                push     bx
1:03C4  9ae4030000        lcall    0, 0x3e4  ; @1:INT:ord_9(1:13E0)
1:03C9  b10f              mov      cl, 0xf
1:03CB  9a0f040000        lcall    0, 0x40f  ; @1:INT:ord_4(1:141E)
1:03D0  a33808            mov      word ptr [0x838], ax
1:03D3  b86d4e            mov      ax, 0x4e6d
1:03D6  bac641            mov      dx, 0x41c6
1:03D9  52                push     dx
1:03DA  50                push     ax
1:03DB  ff36d207          push     word ptr [0x7d2]
1:03DF  ff36d007          push     word ptr [0x7d0]
1:03E3  9a08040000        lcall    0, 0x408  ; @1:INT:ord_9(1:13E0)
1:03E8  053930            add      ax, 0x3039
1:03EB  83d200            adc      dx, 0
1:03EE  a3d007            mov      word ptr [0x7d0], ax
1:03F1  8916d207          mov      word ptr [0x7d2], dx
1:03F5  80e67f            and      dh, 0x7f
1:03F8  2bc9              sub      cx, cx
1:03FA  8956f0            mov      word ptr [bp - 0x10], dx
1:03FD  8bda              mov      bx, dx
1:03FF  b80d00            mov      ax, 0xd
1:0402  99                cdq      
1:0403  52                push     dx
1:0404  50                push     ax
1:0405  51                push     cx
1:0406  53                push     bx
1:0407  9a27040000        lcall    0, 0x427  ; @1:INT:ord_9(1:13E0)
1:040C  b10f              mov      cl, 0xf
1:040E  9a4f040000        lcall    0, 0x44f  ; @1:INT:ord_4(1:141E)
1:0413  a33a08            mov      word ptr [0x83a], ax
1:0416  b86d4e            mov      ax, 0x4e6d
1:0419  bac641            mov      dx, 0x41c6
1:041C  52                push     dx
1:041D  50                push     ax
1:041E  ff36d207          push     word ptr [0x7d2]
1:0422  ff36d007          push     word ptr [0x7d0]
1:0426  9a48040000        lcall    0, 0x448  ; @1:INT:ord_9(1:13E0)
1:042B  053930            add      ax, 0x3039
1:042E  83d200            adc      dx, 0
1:0431  a3d007            mov      word ptr [0x7d0], ax
1:0434  8916d207          mov      word ptr [0x7d2], dx
1:0438  80e67f            and      dh, 0x7f
1:043B  2bc9              sub      cx, cx
1:043D  8bda              mov      bx, dx
1:043F  b80d00            mov      ax, 0xd
1:0442  99                cdq      
1:0443  52                push     dx
1:0444  50                push     ax
1:0445  51                push     cx
1:0446  53                push     bx
1:0447  9ae5040000        lcall    0, 0x4e5  ; @1:INT:ord_9(1:13E0)
1:044C  b10f              mov      cl, 0xf
1:044E  9a13050000        lcall    0, 0x513  ; @1:INT:ord_4(1:141E)
1:0453  a33c08            mov      word ptr [0x83c], ax
1:0456  e9d7fe            jmp      0x330
1:0459  8b5e06            mov      bx, word ptr [bp + 6]
1:045C  8b4704            mov      ax, word ptr [bx + 4]
1:045F  0307              add      ax, word ptr [bx]
1:0461  99                cdq      
1:0462  2bc2              sub      ax, dx
1:0464  d1f8              sar      ax, 1
1:0466  a33e08            mov      word ptr [0x83e], ax
1:0469  8b4702            mov      ax, word ptr [bx + 2]
1:046C  034706            add      ax, word ptr [bx + 6]
1:046F  99                cdq      
1:0470  2bc2              sub      ax, dx
1:0472  d1f8              sar      ax, 1
1:0474  a34008            mov      word ptr [0x840], ax
1:0477  8b4704            mov      ax, word ptr [bx + 4]
1:047A  2b07              sub      ax, word ptr [bx]
1:047C  8946f0            mov      word ptr [bp - 0x10], ax
1:047F  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0480  df46f0            fild     word ptr [bp - 0x10]
1:0483  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0484  dc0e5604          fmul     qword ptr [0x456]
1:0488  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0489  dc065e04          fadd     qword ptr [0x45e]
1:048D  9ab2040000        lcall    0, 0x4b2  ; @1:INT:ord_10(1:142A)
1:0492  99                cdq      
1:0493  a35208            mov      word ptr [0x852], ax
1:0496  89165408          mov      word ptr [0x854], dx
1:049A  8b4706            mov      ax, word ptr [bx + 6]
1:049D  2b4702            sub      ax, word ptr [bx + 2]
1:04A0  8946f0            mov      word ptr [bp - 0x10], ax
1:04A3  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:04A4  df46f0            fild     word ptr [bp - 0x10]
1:04A7  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:04A8  dc0e5604          fmul     qword ptr [0x456]
1:04AC  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:04AD  dc065e04          fadd     qword ptr [0x45e]
1:04B1  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:142A)
1:04B6  99                cdq      
1:04B7  a35a08            mov      word ptr [0x85a], ax
1:04BA  89165c08          mov      word ptr [0x85c], dx
1:04BE  8b4608            mov      ax, word ptr [bp + 8]
1:04C1  99                cdq      
1:04C2  a34208            mov      word ptr [0x842], ax
1:04C5  89164408          mov      word ptr [0x844], dx
1:04C9  8b460a            mov      ax, word ptr [bp + 0xa]
1:04CC  99                cdq      
1:04CD  a33208            mov      word ptr [0x832], ax
1:04D0  89163408          mov      word ptr [0x834], dx
1:04D4  b86d4e            mov      ax, 0x4e6d
1:04D7  bac641            mov      dx, 0x41c6
1:04DA  52                push     dx
1:04DB  50                push     ax
1:04DC  ff36d207          push     word ptr [0x7d2]
1:04E0  ff36d007          push     word ptr [0x7d0]
1:04E4  9a0c050000        lcall    0, 0x50c  ; @1:INT:ord_9(1:13E0)
1:04E9  053930            add      ax, 0x3039
1:04EC  83d200            adc      dx, 0
1:04EF  a3d007            mov      word ptr [0x7d0], ax
1:04F2  8916d207          mov      word ptr [0x7d2], dx
1:04F6  80e67f            and      dh, 0x7f
1:04F9  2bc9              sub      cx, cx
1:04FB  8bda              mov      bx, dx
1:04FD  b86400            mov      ax, 0x64
1:0500  99                cdq      
1:0501  52                push     dx
1:0502  50                push     ax
1:0503  b86500            mov      ax, 0x65
1:0506  99                cdq      
1:0507  52                push     dx
1:0508  50                push     ax
1:0509  51                push     cx
1:050A  53                push     bx
1:050B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:13E0)
1:0510  b10f              mov      cl, 0xf
1:0512  9a28010000        lcall    0, 0x128  ; @1:INT:ord_4(1:141E)
1:0517  99                cdq      
1:0518  52                push     dx
1:0519  50                push     ax
1:051A  9a8d050000        lcall    0, 0x58d  ; @1:INT:ord_8(1:0FD2)
1:051F  83c408            add      sp, 8
1:0522  a35e08            mov      word ptr [0x85e], ax
1:0525  89166008          mov      word ptr [0x860], dx
1:0529  ff363608          push     word ptr [0x836]
1:052D  0e                push     cs
1:052E  e8ee02            call     0x81f
1:0531  5b                pop      bx
1:0532  a34608            mov      word ptr [0x846], ax
1:0535  89164808          mov      word ptr [0x848], dx
1:0539  ff363808          push     word ptr [0x838]
1:053D  0e                push     cs
1:053E  e8de02            call     0x81f
1:0541  5b                pop      bx
1:0542  a34a08            mov      word ptr [0x84a], ax
1:0545  89164c08          mov      word ptr [0x84c], dx
1:0549  ff363a08          push     word ptr [0x83a]
1:054D  0e                push     cs
1:054E  e8ce02            call     0x81f
1:0551  5b                pop      bx
1:0552  a34e08            mov      word ptr [0x84e], ax
1:0555  89165008          mov      word ptr [0x850], dx
1:0559  ff363c08          push     word ptr [0x83c]
1:055D  0e                push     cs
1:055E  e8be02            call     0x81f
1:0561  5b                pop      bx
1:0562  a35608            mov      word ptr [0x856], ax
1:0565  89165808          mov      word ptr [0x858], dx
1:0569  4d                dec      bp
1:056A  4d                dec      bp
1:056B  8be5              mov      sp, bp
1:056D  1f                pop      ds
1:056E  5d                pop      bp
1:056F  4d                dec      bp
1:0570  cb                retf     
1:0571  1e                push     ds
1:0572  58                pop      ax
1:0573  90                nop      
1:0574  45                inc      bp
1:0575  55                push     bp
1:0576  8bec              mov      bp, sp
1:0578  1e                push     ds
1:0579  8ed8              mov      ds, ax
1:057B  83ec0e            sub      sp, 0xe
1:057E  57                push     di
1:057F  56                push     si
1:0580  a1d407            mov      ax, word ptr [0x7d4]
1:0583  99                cdq      
1:0584  52                push     dx
1:0585  50                push     ax
1:0586  8b4606            mov      ax, word ptr [bp + 6]
1:0589  99                cdq      
1:058A  52                push     dx
1:058B  50                push     ax
1:058C  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:0FD2)
1:0591  83c408            add      sp, 8
1:0594  8946f2            mov      word ptr [bp - 0xe], ax
1:0597  8956f4            mov      word ptr [bp - 0xc], dx
1:059A  833e440800        cmp      word ptr [0x844], 0
1:059F  7c3a              jl       0x5db
1:05A1  7f07              jg       0x5aa
1:05A3  833e420801        cmp      word ptr [0x842], 1
1:05A8  7631              jbe      0x5db
1:05AA  b81e00            mov      ax, 0x1e
1:05AD  99                cdq      
1:05AE  52                push     dx
1:05AF  50                push     ax
1:05B0  ff76f4            push     word ptr [bp - 0xc]
1:05B3  ff76f2            push     word ptr [bp - 0xe]
1:05B6  a13208            mov      ax, word ptr [0x832]
1:05B9  2bc9              sub      cx, cx
1:05BB  50                push     ax
1:05BC  51                push     cx
1:05BD  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:0DD6)
1:05C2  83c408            add      sp, 8
1:05C5  52                push     dx
1:05C6  50                push     ax
1:05C7  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_6(1:1346)
1:05CC  03065e08          add      ax, word ptr [0x85e]
1:05D0  13166008          adc      dx, word ptr [0x860]
1:05D4  c746f80000        mov      word ptr [bp - 8], 0
1:05D9  eb05              jmp      0x5e0
1:05DB  2bc0              sub      ax, ax
1:05DD  8946f8            mov      word ptr [bp - 8], ax
1:05E0  ff76f8            push     word ptr [bp - 8]
1:05E3  50                push     ax
1:05E4  0e                push     cs
1:05E5  e8ff00            call     0x6e7
1:05E8  5b                pop      bx
1:05E9  5b                pop      bx
1:05EA  ff76f4            push     word ptr [bp - 0xc]
1:05ED  ff76f2            push     word ptr [bp - 0xe]
1:05F0  ff1e4608          lcall    [0x846]
1:05F4  5b                pop      bx
1:05F5  5b                pop      bx
1:05F6  52                push     dx
1:05F7  50                push     ax
1:05F8  ff365408          push     word ptr [0x854]
1:05FC  ff365208          push     word ptr [0x852]
1:0600  9a25060000        lcall    0, 0x625  ; @1:INT:ord_5(1:0ED8)
1:0605  83c408            add      sp, 8
1:0608  8bf0              mov      si, ax
1:060A  03363e08          add      si, word ptr [0x83e]
1:060E  ff76f4            push     word ptr [bp - 0xc]
1:0611  ff76f2            push     word ptr [bp - 0xe]
1:0614  ff1e4a08          lcall    [0x84a]
1:0618  5b                pop      bx
1:0619  5b                pop      bx
1:061A  52                push     dx
1:061B  50                push     ax
1:061C  ff365c08          push     word ptr [0x85c]
1:0620  ff365a08          push     word ptr [0x85a]
1:0624  9a49060000        lcall    0, 0x649  ; @1:INT:ord_5(1:0ED8)
1:0629  83c408            add      sp, 8
1:062C  8bf8              mov      di, ax
1:062E  033e4008          add      di, word ptr [0x840]
1:0632  ff76f4            push     word ptr [bp - 0xc]
1:0635  ff76f2            push     word ptr [bp - 0xe]
1:0638  ff1e4e08          lcall    [0x84e]
1:063C  5b                pop      bx
1:063D  5b                pop      bx
1:063E  52                push     dx
1:063F  50                push     ax
1:0640  ff365408          push     word ptr [0x854]
1:0644  ff365208          push     word ptr [0x852]
1:0648  9a6e060000        lcall    0, 0x66e  ; @1:INT:ord_5(1:0ED8)
1:064D  83c408            add      sp, 8
1:0650  03063e08          add      ax, word ptr [0x83e]
1:0654  8946fc            mov      word ptr [bp - 4], ax
1:0657  ff76f4            push     word ptr [bp - 0xc]
1:065A  ff76f2            push     word ptr [bp - 0xe]
1:065D  ff1e5608          lcall    [0x856]
1:0661  5b                pop      bx
1:0662  5b                pop      bx
1:0663  52                push     dx
1:0664  50                push     ax
1:0665  ff365c08          push     word ptr [0x85c]
1:0669  ff365a08          push     word ptr [0x85a]
1:066D  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_5(1:0ED8)
1:0672  83c408            add      sp, 8
1:0675  03064008          add      ax, word ptr [0x840]
1:0679  8946fa            mov      word ptr [bp - 6], ax
1:067C  ff36b208          push     word ptr [0x8b2]
1:0680  56                push     si
1:0681  57                push     di
1:0682  9affff0000        lcall    0, 0xffff  ; @1:GDI.MoveTo
1:0687  ff36b208          push     word ptr [0x8b2]
1:068B  ff76fc            push     word ptr [bp - 4]
1:068E  ff76fa            push     word ptr [bp - 6]
1:0691  9affff0000        lcall    0, 0xffff  ; @1:GDI.LineTo
1:0696  5e                pop      si
1:0697  5f                pop      di
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
1:06AA  ff36b208          push     word ptr [0x8b2]
1:06AE  ff36c007          push     word ptr [0x7c0]
1:06B2  9a70010000        lcall    0, 0x170  ; @1:GDI.SelectObject
1:06B7  ff36c407          push     word ptr [0x7c4]
1:06BB  9ad1020000        lcall    0, 0x2d1  ; @1:GDI.DeleteObject
1:06C0  2bc0              sub      ax, ax
1:06C2  50                push     ax
1:06C3  b80100            mov      ax, 1
1:06C6  50                push     ax
1:06C7  ff7608            push     word ptr [bp + 8]
1:06CA  ff7606            push     word ptr [bp + 6]
1:06CD  9a43010000        lcall    0, 0x143  ; @1:GDI.CreatePen
1:06D2  a3c407            mov      word ptr [0x7c4], ax
1:06D5  ff36b208          push     word ptr [0x8b2]
1:06D9  50                push     ax
1:06DA  9ab3060000        lcall    0, 0x6b3  ; @1:GDI.SelectObject
1:06DF  4d                dec      bp
1:06E0  4d                dec      bp
1:06E1  8be5              mov      sp, bp
1:06E3  1f                pop      ds
1:06E4  5d                pop      bp
1:06E5  4d                dec      bp
1:06E6  cb                retf     
1:06E7  1e                push     ds
1:06E8  58                pop      ax
1:06E9  90                nop      
1:06EA  45                inc      bp
1:06EB  55                push     bp
1:06EC  8bec              mov      bp, sp
1:06EE  1e                push     ds
1:06EF  8ed8              mov      ds, ax
1:06F1  83ec14            sub      sp, 0x14
1:06F4  57                push     di
1:06F5  56                push     si
1:06F6  a14208            mov      ax, word ptr [0x842]
1:06F9  8b164408          mov      dx, word ptr [0x844]
1:06FD  e90201            jmp      0x802
1:0700  2bc0              sub      ax, ax
1:0702  ba1500            mov      dx, 0x15
1:0705  52                push     dx
1:0706  50                push     ax
1:0707  ff7608            push     word ptr [bp + 8]
1:070A  ff7606            push     word ptr [bp + 6]
1:070D  9a3d070000        lcall    0, 0x73d  ; @1:INT:ord_7(1:0DD6)
1:0712  83c408            add      sp, 8
1:0715  8bf2              mov      si, dx
1:0717  46                inc      si
1:0718  8bde              mov      bx, si
1:071A  d1e3              shl      bx, 1
1:071C  d1e3              shl      bx, 1
1:071E  ffb7dc07          push     word ptr [bx + 0x7dc]
1:0722  ffb7da07          push     word ptr [bx + 0x7da]
1:0726  0e                push     cs
1:0727  e876ff            call     0x6a0
1:072A  5b                pop      bx
1:072B  5b                pop      bx
1:072C  e9e600            jmp      0x815
1:072F  2bc0              sub      ax, ax
1:0731  ba0600            mov      dx, 6
1:0734  52                push     dx
1:0735  50                push     ax
1:0736  ff7608            push     word ptr [bp + 8]
1:0739  ff7606            push     word ptr [bp + 6]
1:073C  9a57070000        lcall    0, 0x757  ; @1:INT:ord_7(1:0DD6)
1:0741  83c408            add      sp, 8
1:0744  8bc2              mov      ax, dx
1:0746  99                cdq      
1:0747  8bf0              mov      si, ax
1:0749  2bc0              sub      ax, ax
1:074B  ba0600            mov      dx, 6
1:074E  52                push     dx
1:074F  50                push     ax
1:0750  ff7608            push     word ptr [bp + 8]
1:0753  ff7606            push     word ptr [bp + 6]
1:0756  9aa0070000        lcall    0, 0x7a0  ; @1:INT:ord_7(1:0DD6)
1:075B  83c408            add      sp, 8
1:075E  894606            mov      word ptr [bp + 6], ax
1:0761  c746080000        mov      word ptr [bp + 8], 0
1:0766  8bc6              mov      ax, si
1:0768  b90600            mov      cx, 6
1:076B  f7e9              imul     cx
1:076D  8bd8              mov      bx, ax
1:076F  51                push     cx
1:0770  56                push     si
1:0771  8d7ef2            lea      di, [bp - 0xe]
1:0774  8db71000          lea      si, [bx + 0x10]
1:0778  16                push     ss
1:0779  07                pop      es
1:077A  a5                movsw    word ptr es:[di], word ptr [si]
1:077B  a5                movsw    word ptr es:[di], word ptr [si]
1:077C  a5                movsw    word ptr es:[di], word ptr [si]
1:077D  5e                pop      si
1:077E  59                pop      cx
1:077F  51                push     cx
1:0780  56                push     si
1:0781  8d7eec            lea      di, [bp - 0x14]
1:0784  8db71600          lea      si, [bx + 0x16]
1:0788  a5                movsw    word ptr es:[di], word ptr [si]
1:0789  a5                movsw    word ptr es:[di], word ptr [si]
1:078A  a5                movsw    word ptr es:[di], word ptr [si]
1:078B  5e                pop      si
1:078C  59                pop      cx
1:078D  ff7608            push     word ptr [bp + 8]
1:0790  ff7606            push     word ptr [bp + 6]
1:0793  8b46ec            mov      ax, word ptr [bp - 0x14]
1:0796  2bd2              sub      dx, dx
1:0798  2b46f2            sub      ax, word ptr [bp - 0xe]
1:079B  1bd2              sbb      dx, dx
1:079D  52                push     dx
1:079E  50                push     ax
1:079F  9ac0070000        lcall    0, 0x7c0  ; @1:INT:ord_7(1:0DD6)
1:07A4  83c408            add      sp, 8
1:07A7  0346f2            add      ax, word ptr [bp - 0xe]
1:07AA  8946f8            mov      word ptr [bp - 8], ax
1:07AD  ff7608            push     word ptr [bp + 8]
1:07B0  ff7606            push     word ptr [bp + 6]
1:07B3  8b46ee            mov      ax, word ptr [bp - 0x12]
1:07B6  2bd2              sub      dx, dx
1:07B8  2b46f4            sub      ax, word ptr [bp - 0xc]
1:07BB  1bd2              sbb      dx, dx
1:07BD  52                push     dx
1:07BE  50                push     ax
1:07BF  9ae0070000        lcall    0, 0x7e0  ; @1:INT:ord_7(1:0DD6)
1:07C4  83c408            add      sp, 8
1:07C7  0346f4            add      ax, word ptr [bp - 0xc]
1:07CA  8946fa            mov      word ptr [bp - 6], ax
1:07CD  ff7608            push     word ptr [bp + 8]
1:07D0  ff7606            push     word ptr [bp + 6]
1:07D3  8b46f0            mov      ax, word ptr [bp - 0x10]
1:07D6  2bd2              sub      dx, dx
1:07D8  2b46f6            sub      ax, word ptr [bp - 0xa]
1:07DB  1bd2              sbb      dx, dx
1:07DD  52                push     dx
1:07DE  50                push     ax
1:07DF  9abe050000        lcall    0, 0x5be  ; @1:INT:ord_7(1:0DD6)
1:07E4  83c408            add      sp, 8
1:07E7  0346f6            add      ax, word ptr [bp - 0xa]
1:07EA  8946fc            mov      word ptr [bp - 4], ax
1:07ED  8ac4              mov      al, ah
1:07EF  b402              mov      ah, 2
1:07F1  8a6efb            mov      ch, byte ptr [bp - 5]
1:07F4  2ac9              sub      cl, cl
1:07F6  8a56f9            mov      dl, byte ptr [bp - 7]
1:07F9  2af6              sub      dh, dh
1:07FB  0bca              or       cx, dx
1:07FD  50                push     ax
1:07FE  51                push     cx
1:07FF  e924ff            jmp      0x726
1:0802  0bd2              or       dx, dx
1:0804  750f              jne      0x815
1:0806  48                dec      ax
1:0807  740c              je       0x815
1:0809  48                dec      ax
1:080A  7503              jne      0x80f
1:080C  e9f1fe            jmp      0x700
1:080F  48                dec      ax
1:0810  7503              jne      0x815
1:0812  e91aff            jmp      0x72f
1:0815  5e                pop      si
1:0816  5f                pop      di
1:0817  4d                dec      bp
1:0818  4d                dec      bp
1:0819  8be5              mov      sp, bp
1:081B  1f                pop      ds
1:081C  5d                pop      bp
1:081D  4d                dec      bp
1:081E  cb                retf     
1:081F  1e                push     ds
1:0820  58                pop      ax
1:0821  90                nop      
1:0822  45                inc      bp
1:0823  55                push     bp
1:0824  8bec              mov      bp, sp
1:0826  1e                push     ds
1:0827  8ed8              mov      ds, ax
1:0829  83ec06            sub      sp, 6
1:082C  8b4606            mov      ax, word ptr [bp + 6]
1:082F  e9a100            jmp      0x8d3
1:0832  c746faffff        mov      word ptr [bp - 6], 0xffff  ; @3:INT:ord_25(1:0908)
1:0837  c746fcffff        mov      word ptr [bp - 4], 0xffff  ; @3:INT:ord_25(1:0908)
1:083C  e9bb00            jmp      0x8fa
1:083F  c746faffff        mov      word ptr [bp - 6], 0xffff  ; @3:INT:ord_24(1:0933)
1:0844  c746fcffff        mov      word ptr [bp - 4], 0xffff  ; @3:INT:ord_24(1:0933)
1:0849  e9ae00            jmp      0x8fa
1:084C  c746faffff        mov      word ptr [bp - 6], 0xffff  ; @3:INT:ord_23(1:0966)
1:0851  c746fcffff        mov      word ptr [bp - 4], 0xffff  ; @3:INT:ord_23(1:0966)
1:0856  e9a100            jmp      0x8fa
1:0859  c746faffff        mov      word ptr [bp - 6], 0xffff  ; @3:INT:ord_22(1:09A0)
1:085E  c746fcffff        mov      word ptr [bp - 4], 0xffff  ; @3:INT:ord_22(1:09A0)
1:0863  e99400            jmp      0x8fa
1:0866  c746faffff        mov      word ptr [bp - 6], 0xffff  ; @3:INT:ord_21(1:09DB)
1:086B  c746fcffff        mov      word ptr [bp - 4], 0xffff  ; @3:INT:ord_21(1:09DB)
1:0870  e98700            jmp      0x8fa
1:0873  c746faffff        mov      word ptr [bp - 6], 0xffff  ; @3:INT:ord_20(1:0A1D)
1:0878  c746fcffff        mov      word ptr [bp - 4], 0xffff  ; @3:INT:ord_20(1:0A1D)
1:087D  eb7b              jmp      0x8fa
1:087F  c746faffff        mov      word ptr [bp - 6], 0xffff  ; @3:INT:ord_19(1:0A50)
1:0884  c746fcffff        mov      word ptr [bp - 4], 0xffff  ; @3:INT:ord_19(1:0A50)
1:0889  eb6f              jmp      0x8fa
1:088B  c746faffff        mov      word ptr [bp - 6], 0xffff  ; @3:INT:ord_18(1:0A8A)
1:0890  c746fcffff        mov      word ptr [bp - 4], 0xffff  ; @3:INT:ord_18(1:0A8A)
1:0895  eb63              jmp      0x8fa
1:0897  c746faffff        mov      word ptr [bp - 6], 0xffff  ; @3:INT:ord_17(1:0AC5)
1:089C  c746fcffff        mov      word ptr [bp - 4], 0xffff  ; @3:INT:ord_17(1:0AC5)
1:08A1  eb57              jmp      0x8fa
1:08A3  c746faffff        mov      word ptr [bp - 6], 0xffff  ; @3:INT:ord_16(1:0B07)
1:08A8  c746fcffff        mov      word ptr [bp - 4], 0xffff  ; @3:INT:ord_16(1:0B07)
1:08AD  eb4b              jmp      0x8fa
1:08AF  c746faffff        mov      word ptr [bp - 6], 0xffff  ; @3:INT:ord_15(1:0B3A)
1:08B4  c746fcffff        mov      word ptr [bp - 4], 0xffff  ; @3:INT:ord_15(1:0B3A)
1:08B9  eb3f              jmp      0x8fa
1:08BB  c746faffff        mov      word ptr [bp - 6], 0xffff  ; @3:INT:ord_14(1:0B74)
1:08C0  c746fcffff        mov      word ptr [bp - 4], 0xffff  ; @3:INT:ord_14(1:0B74)
1:08C5  eb33              jmp      0x8fa
1:08C7  c746faffff        mov      word ptr [bp - 6], 0xffff  ; @3:INT:ord_13(1:0BAD)
1:08CC  c746fcffff        mov      word ptr [bp - 4], 0xffff  ; @3:INT:ord_13(1:0BAD)
1:08D1  eb27              jmp      0x8fa
1:08D3  3d0c00            cmp      ax, 0xc
1:08D6  7722              ja       0x8fa
1:08D8  d1e0              shl      ax, 1
1:08DA  93                xchg     bx, ax
1:08DB  2effa7e008        jmp      word ptr cs:[bx + 0x8e0]
1:08E0  3208              xor      cl, byte ptr [bx + si]
1:08E2  3f                aas      
1:08E3  084c08            or       byte ptr [si + 8], cl
1:08E6  59                pop      cx
1:08E7  086608            or       byte ptr [bp + 8], ah
1:08EA  7308              jae      0x8f4
1:08EC  7f08              jg       0x8f6
1:08EE  8b08              mov      cx, word ptr [bx + si]
1:08F0  97                xchg     di, ax
1:08F1  08a308af          or       byte ptr [bp + di - 0x50f8], ah
1:08F5  08bb08c7          or       byte ptr [bp + di - 0x38f8], bh
1:08F9  088b46fa          or       byte ptr [bp + di - 0x5ba], cl
1:08FD  8b56fc            mov      dx, word ptr [bp - 4]
1:0900  4d                dec      bp
1:0901  4d                dec      bp
1:0902  8be5              mov      sp, bp
1:0904  1f                pop      ds
1:0905  5d                pop      bp
1:0906  4d                dec      bp
1:0907  cb                retf     

; ===== EXPORT:ord_25(#25) =====
1:0908  1e                push     ds
1:0909  58                pop      ax
1:090A  90                nop      
1:090B  45                inc      bp
1:090C  55                push     bp
1:090D  8bec              mov      bp, sp
1:090F  1e                push     ds
1:0910  8ed8              mov      ds, ax
1:0912  8b4606            mov      ax, word ptr [bp + 6]
1:0915  8b5608            mov      dx, word ptr [bp + 8]
1:0918  d1e0              shl      ax, 1
1:091A  d1d2              rcl      dx, 1
1:091C  2d0100            sub      ax, 1
1:091F  83da00            sbb      dx, 0
1:0922  7907              jns      0x92b
1:0924  f7d8              neg      ax
1:0926  83d200            adc      dx, 0
1:0929  f7da              neg      dx
1:092B  4d                dec      bp
1:092C  4d                dec      bp
1:092D  8be5              mov      sp, bp
1:092F  1f                pop      ds
1:0930  5d                pop      bp
1:0931  4d                dec      bp
1:0932  cb                retf     

; ===== EXPORT:ord_24(#24) =====
1:0933  1e                push     ds
1:0934  58                pop      ax
1:0935  90                nop      
1:0936  45                inc      bp
1:0937  55                push     bp
1:0938  8bec              mov      bp, sp
1:093A  1e                push     ds
1:093B  8ed8              mov      ds, ax
1:093D  b8fe00            mov      ax, 0xfe
1:0940  99                cdq      
1:0941  52                push     dx
1:0942  50                push     ax
1:0943  ff7608            push     word ptr [bp + 8]
1:0946  ff7606            push     word ptr [bp + 6]
1:0949  9a7d090000        lcall    0, 0x97d  ; @1:INT:ord_9(1:13E0)
1:094E  52                push     dx
1:094F  50                push     ax
1:0950  9a84090000        lcall    0, 0x984  ; @1:INT:ord_12(1:1168)
1:0955  5b                pop      bx
1:0956  5b                pop      bx
1:0957  b10e              mov      cl, 0xe
1:0959  9a8d090000        lcall    0, 0x98d  ; @1:INT:ord_11(1:1412)
1:095E  4d                dec      bp
1:095F  4d                dec      bp
1:0960  8be5              mov      sp, bp
1:0962  1f                pop      ds
1:0963  5d                pop      bp
1:0964  4d                dec      bp
1:0965  cb                retf     

; ===== EXPORT:ord_23(#23) =====
1:0966  1e                push     ds
1:0967  58                pop      ax
1:0968  90                nop      
1:0969  45                inc      bp
1:096A  55                push     bp
1:096B  8bec              mov      bp, sp
1:096D  1e                push     ds
1:096E  8ed8              mov      ds, ax
1:0970  b8fe00            mov      ax, 0xfe
1:0973  99                cdq      
1:0974  52                push     dx
1:0975  50                push     ax
1:0976  ff7608            push     word ptr [bp + 8]
1:0979  ff7606            push     word ptr [bp + 6]
1:097C  9abf090000        lcall    0, 0x9bf  ; @1:INT:ord_9(1:13E0)
1:0981  52                push     dx
1:0982  50                push     ax
1:0983  9ac6090000        lcall    0, 0x9c6  ; @1:INT:ord_12(1:1168)
1:0988  5b                pop      bx
1:0989  5b                pop      bx
1:098A  b10e              mov      cl, 0xe
1:098C  9acf090000        lcall    0, 0x9cf  ; @1:INT:ord_11(1:1412)
1:0991  f7d8              neg      ax
1:0993  83d200            adc      dx, 0
1:0996  f7da              neg      dx
1:0998  4d                dec      bp
1:0999  4d                dec      bp
1:099A  8be5              mov      sp, bp
1:099C  1f                pop      ds
1:099D  5d                pop      bp
1:099E  4d                dec      bp
1:099F  cb                retf     

; ===== EXPORT:ord_22(#22) =====
1:09A0  1e                push     ds
1:09A1  58                pop      ax
1:09A2  90                nop      
1:09A3  45                inc      bp
1:09A4  55                push     bp
1:09A5  8bec              mov      bp, sp
1:09A7  1e                push     ds
1:09A8  8ed8              mov      ds, ax
1:09AA  b8fe00            mov      ax, 0xfe
1:09AD  99                cdq      
1:09AE  52                push     dx
1:09AF  50                push     ax
1:09B0  8b4606            mov      ax, word ptr [bp + 6]
1:09B3  8b5608            mov      dx, word ptr [bp + 8]
1:09B6  050040            add      ax, 0x4000
1:09B9  83d200            adc      dx, 0
1:09BC  52                push     dx
1:09BD  50                push     ax
1:09BE  9afa090000        lcall    0, 0x9fa  ; @1:INT:ord_9(1:13E0)
1:09C3  52                push     dx
1:09C4  50                push     ax
1:09C5  9a010a0000        lcall    0, 0xa01  ; @1:INT:ord_12(1:1168)
1:09CA  5b                pop      bx
1:09CB  5b                pop      bx
1:09CC  b10e              mov      cl, 0xe
1:09CE  9a0a0a0000        lcall    0, 0xa0a  ; @1:INT:ord_11(1:1412)
1:09D3  4d                dec      bp
1:09D4  4d                dec      bp
1:09D5  8be5              mov      sp, bp
1:09D7  1f                pop      ds
1:09D8  5d                pop      bp
1:09D9  4d                dec      bp
1:09DA  cb                retf     

; ===== EXPORT:ord_21(#21) =====
1:09DB  1e                push     ds
1:09DC  58                pop      ax
1:09DD  90                nop      
1:09DE  45                inc      bp
1:09DF  55                push     bp
1:09E0  8bec              mov      bp, sp
1:09E2  1e                push     ds
1:09E3  8ed8              mov      ds, ax
1:09E5  b8fe00            mov      ax, 0xfe
1:09E8  99                cdq      
1:09E9  52                push     dx
1:09EA  50                push     ax
1:09EB  8b4606            mov      ax, word ptr [bp + 6]
1:09EE  8b5608            mov      dx, word ptr [bp + 8]
1:09F1  050040            add      ax, 0x4000
1:09F4  83d200            adc      dx, 0
1:09F7  52                push     dx
1:09F8  50                push     ax
1:09F9  9a340a0000        lcall    0, 0xa34  ; @1:INT:ord_9(1:13E0)
1:09FE  52                push     dx
1:09FF  50                push     ax
1:0A00  9a3b0a0000        lcall    0, 0xa3b  ; @1:INT:ord_12(1:1168)
1:0A05  5b                pop      bx
1:0A06  5b                pop      bx
1:0A07  b10e              mov      cl, 0xe
1:0A09  9a440a0000        lcall    0, 0xa44  ; @1:INT:ord_11(1:1412)
1:0A0E  f7d8              neg      ax
1:0A10  83d200            adc      dx, 0
1:0A13  f7da              neg      dx
1:0A15  4d                dec      bp
1:0A16  4d                dec      bp
1:0A17  8be5              mov      sp, bp
1:0A19  1f                pop      ds
1:0A1A  5d                pop      bp
1:0A1B  4d                dec      bp
1:0A1C  cb                retf     

; ===== EXPORT:ord_20(#20) =====
1:0A1D  1e                push     ds
1:0A1E  58                pop      ax
1:0A1F  90                nop      
1:0A20  45                inc      bp
1:0A21  55                push     bp
1:0A22  8bec              mov      bp, sp
1:0A24  1e                push     ds
1:0A25  8ed8              mov      ds, ax
1:0A27  b8fc01            mov      ax, 0x1fc
1:0A2A  99                cdq      
1:0A2B  52                push     dx
1:0A2C  50                push     ax
1:0A2D  ff7608            push     word ptr [bp + 8]
1:0A30  ff7606            push     word ptr [bp + 6]
1:0A33  9a670a0000        lcall    0, 0xa67  ; @1:INT:ord_9(1:13E0)
1:0A38  52                push     dx
1:0A39  50                push     ax
1:0A3A  9a6e0a0000        lcall    0, 0xa6e  ; @1:INT:ord_12(1:1168)
1:0A3F  5b                pop      bx
1:0A40  5b                pop      bx
1:0A41  b10e              mov      cl, 0xe
1:0A43  9a770a0000        lcall    0, 0xa77  ; @1:INT:ord_11(1:1412)
1:0A48  4d                dec      bp
1:0A49  4d                dec      bp
1:0A4A  8be5              mov      sp, bp
1:0A4C  1f                pop      ds
1:0A4D  5d                pop      bp
1:0A4E  4d                dec      bp
1:0A4F  cb                retf     

; ===== EXPORT:ord_19(#19) =====
1:0A50  1e                push     ds
1:0A51  58                pop      ax
1:0A52  90                nop      
1:0A53  45                inc      bp
1:0A54  55                push     bp
1:0A55  8bec              mov      bp, sp
1:0A57  1e                push     ds
1:0A58  8ed8              mov      ds, ax
1:0A5A  b8fc01            mov      ax, 0x1fc
1:0A5D  99                cdq      
1:0A5E  52                push     dx
1:0A5F  50                push     ax
1:0A60  ff7608            push     word ptr [bp + 8]
1:0A63  ff7606            push     word ptr [bp + 6]
1:0A66  9a64030000        lcall    0, 0x364  ; @1:INT:ord_9(1:13E0)
1:0A6B  52                push     dx
1:0A6C  50                push     ax
1:0A6D  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:1168)
1:0A72  5b                pop      bx
1:0A73  5b                pop      bx
1:0A74  b10e              mov      cl, 0xe
1:0A76  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:1412)
1:0A7B  f7d8              neg      ax
1:0A7D  83d200            adc      dx, 0
1:0A80  f7da              neg      dx
1:0A82  4d                dec      bp
1:0A83  4d                dec      bp
1:0A84  8be5              mov      sp, bp
1:0A86  1f                pop      ds
1:0A87  5d                pop      bp
1:0A88  4d                dec      bp
1:0A89  cb                retf     

; ===== EXPORT:ord_18(#18) =====
1:0A8A  1e                push     ds
1:0A8B  58                pop      ax
1:0A8C  90                nop      
1:0A8D  45                inc      bp
1:0A8E  55                push     bp
1:0A8F  8bec              mov      bp, sp
1:0A91  1e                push     ds
1:0A92  8ed8              mov      ds, ax
1:0A94  b8fc01            mov      ax, 0x1fc
1:0A97  99                cdq      
1:0A98  52                push     dx
1:0A99  50                push     ax
1:0A9A  8b4606            mov      ax, word ptr [bp + 6]
1:0A9D  8b5608            mov      dx, word ptr [bp + 8]
1:0AA0  050020            add      ax, 0x2000
1:0AA3  83d200            adc      dx, 0
1:0AA6  52                push     dx
1:0AA7  50                push     ax
1:0AA8  9ae40a0000        lcall    0, 0xae4  ; @1:INT:ord_9(1:13E0)
1:0AAD  52                push     dx
1:0AAE  50                push     ax
1:0AAF  9aeb0a0000        lcall    0, 0xaeb  ; @1:INT:ord_12(1:1168)
1:0AB4  5b                pop      bx
1:0AB5  5b                pop      bx
1:0AB6  b10e              mov      cl, 0xe
1:0AB8  9af40a0000        lcall    0, 0xaf4  ; @1:INT:ord_11(1:1412)
1:0ABD  4d                dec      bp
1:0ABE  4d                dec      bp
1:0ABF  8be5              mov      sp, bp
1:0AC1  1f                pop      ds
1:0AC2  5d                pop      bp
1:0AC3  4d                dec      bp
1:0AC4  cb                retf     

; ===== EXPORT:ord_17(#17) =====
1:0AC5  1e                push     ds
1:0AC6  58                pop      ax
1:0AC7  90                nop      
1:0AC8  45                inc      bp
1:0AC9  55                push     bp
1:0ACA  8bec              mov      bp, sp
1:0ACC  1e                push     ds
1:0ACD  8ed8              mov      ds, ax
1:0ACF  b8fc01            mov      ax, 0x1fc
1:0AD2  99                cdq      
1:0AD3  52                push     dx
1:0AD4  50                push     ax
1:0AD5  8b4606            mov      ax, word ptr [bp + 6]
1:0AD8  8b5608            mov      dx, word ptr [bp + 8]
1:0ADB  050020            add      ax, 0x2000
1:0ADE  83d200            adc      dx, 0
1:0AE1  52                push     dx
1:0AE2  50                push     ax
1:0AE3  9a1e0b0000        lcall    0, 0xb1e  ; @1:INT:ord_9(1:13E0)
1:0AE8  52                push     dx
1:0AE9  50                push     ax
1:0AEA  9a250b0000        lcall    0, 0xb25  ; @1:INT:ord_12(1:1168)
1:0AEF  5b                pop      bx
1:0AF0  5b                pop      bx
1:0AF1  b10e              mov      cl, 0xe
1:0AF3  9a2e0b0000        lcall    0, 0xb2e  ; @1:INT:ord_11(1:1412)
1:0AF8  f7d8              neg      ax
1:0AFA  83d200            adc      dx, 0
1:0AFD  f7da              neg      dx
1:0AFF  4d                dec      bp
1:0B00  4d                dec      bp
1:0B01  8be5              mov      sp, bp
1:0B03  1f                pop      ds
1:0B04  5d                pop      bp
1:0B05  4d                dec      bp
1:0B06  cb                retf     

; ===== EXPORT:ord_16(#16) =====
1:0B07  1e                push     ds
1:0B08  58                pop      ax
1:0B09  90                nop      
1:0B0A  45                inc      bp
1:0B0B  55                push     bp
1:0B0C  8bec              mov      bp, sp
1:0B0E  1e                push     ds
1:0B0F  8ed8              mov      ds, ax
1:0B11  b8fa02            mov      ax, 0x2fa
1:0B14  99                cdq      
1:0B15  52                push     dx
1:0B16  50                push     ax
1:0B17  ff7608            push     word ptr [bp + 8]
1:0B1A  ff7606            push     word ptr [bp + 6]
1:0B1D  9a510b0000        lcall    0, 0xb51  ; @1:INT:ord_9(1:13E0)
1:0B22  52                push     dx
1:0B23  50                push     ax
1:0B24  9a580b0000        lcall    0, 0xb58  ; @1:INT:ord_12(1:1168)
1:0B29  5b                pop      bx
1:0B2A  5b                pop      bx
1:0B2B  b10e              mov      cl, 0xe
1:0B2D  9a610b0000        lcall    0, 0xb61  ; @1:INT:ord_11(1:1412)
1:0B32  4d                dec      bp
1:0B33  4d                dec      bp
1:0B34  8be5              mov      sp, bp
1:0B36  1f                pop      ds
1:0B37  5d                pop      bp
1:0B38  4d                dec      bp
1:0B39  cb                retf     

; ===== EXPORT:ord_15(#15) =====
1:0B3A  1e                push     ds
1:0B3B  58                pop      ax
1:0B3C  90                nop      
1:0B3D  45                inc      bp
1:0B3E  55                push     bp
1:0B3F  8bec              mov      bp, sp
1:0B41  1e                push     ds
1:0B42  8ed8              mov      ds, ax
1:0B44  b8fa02            mov      ax, 0x2fa
1:0B47  99                cdq      
1:0B48  52                push     dx
1:0B49  50                push     ax
1:0B4A  ff7608            push     word ptr [bp + 8]
1:0B4D  ff7606            push     word ptr [bp + 6]
1:0B50  9a8b0b0000        lcall    0, 0xb8b  ; @1:INT:ord_9(1:13E0)
1:0B55  52                push     dx
1:0B56  50                push     ax
1:0B57  9a980b0000        lcall    0, 0xb98  ; @1:INT:ord_12(1:1168)
1:0B5C  5b                pop      bx
1:0B5D  5b                pop      bx
1:0B5E  b10e              mov      cl, 0xe
1:0B60  9aa10b0000        lcall    0, 0xba1  ; @1:INT:ord_11(1:1412)
1:0B65  f7d8              neg      ax
1:0B67  83d200            adc      dx, 0
1:0B6A  f7da              neg      dx
1:0B6C  4d                dec      bp
1:0B6D  4d                dec      bp
1:0B6E  8be5              mov      sp, bp
1:0B70  1f                pop      ds
1:0B71  5d                pop      bp
1:0B72  4d                dec      bp
1:0B73  cb                retf     

; ===== EXPORT:ord_14(#14) =====
1:0B74  1e                push     ds
1:0B75  58                pop      ax
1:0B76  90                nop      
1:0B77  45                inc      bp
1:0B78  55                push     bp
1:0B79  8bec              mov      bp, sp
1:0B7B  1e                push     ds
1:0B7C  8ed8              mov      ds, ax
1:0B7E  b8fa02            mov      ax, 0x2fa
1:0B81  99                cdq      
1:0B82  52                push     dx
1:0B83  50                push     ax
1:0B84  ff7608            push     word ptr [bp + 8]
1:0B87  ff7606            push     word ptr [bp + 6]
1:0B8A  9ac40b0000        lcall    0, 0xbc4  ; @1:INT:ord_9(1:13E0)
1:0B8F  050080            add      ax, 0x8000
1:0B92  83d23f            adc      dx, 0x3f
1:0B95  52                push     dx
1:0B96  50                push     ax
1:0B97  9ad10b0000        lcall    0, 0xbd1  ; @1:INT:ord_12(1:1168)
1:0B9C  5b                pop      bx
1:0B9D  5b                pop      bx
1:0B9E  b10e              mov      cl, 0xe
1:0BA0  9ada0b0000        lcall    0, 0xbda  ; @1:INT:ord_11(1:1412)
1:0BA5  4d                dec      bp
1:0BA6  4d                dec      bp
1:0BA7  8be5              mov      sp, bp
1:0BA9  1f                pop      ds
1:0BAA  5d                pop      bp
1:0BAB  4d                dec      bp
1:0BAC  cb                retf     

; ===== EXPORT:ord_13(#13) =====
1:0BAD  1e                push     ds
1:0BAE  58                pop      ax
1:0BAF  90                nop      
1:0BB0  45                inc      bp
1:0BB1  55                push     bp
1:0BB2  8bec              mov      bp, sp
1:0BB4  1e                push     ds
1:0BB5  8ed8              mov      ds, ax
1:0BB7  b8fa02            mov      ax, 0x2fa
1:0BBA  99                cdq      
1:0BBB  52                push     dx
1:0BBC  50                push     ax
1:0BBD  ff7608            push     word ptr [bp + 8]
1:0BC0  ff7606            push     word ptr [bp + 6]
1:0BC3  9a4a090000        lcall    0, 0x94a  ; @1:INT:ord_9(1:13E0)
1:0BC8  050080            add      ax, 0x8000
1:0BCB  83d23f            adc      dx, 0x3f
1:0BCE  52                push     dx
1:0BCF  50                push     ax
1:0BD0  9a51090000        lcall    0, 0x951  ; @1:INT:ord_12(1:1168)
1:0BD5  5b                pop      bx
1:0BD6  5b                pop      bx
1:0BD7  b10e              mov      cl, 0xe
1:0BD9  9a5a090000        lcall    0, 0x95a  ; @1:INT:ord_11(1:1412)
1:0BDE  f7d8              neg      ax
1:0BE0  83d200            adc      dx, 0
1:0BE3  f7da              neg      dx
1:0BE5  4d                dec      bp
1:0BE6  4d                dec      bp
1:0BE7  8be5              mov      sp, bp
1:0BE9  1f                pop      ds
1:0BEA  5d                pop      bp
1:0BEB  4d                dec      bp
1:0BEC  cb                retf     
1:0BED  001e5890          add      byte ptr [0x9058], bl
1:0BF1  45                inc      bp
1:0BF2  55                push     bp
1:0BF3  8bec              mov      bp, sp
1:0BF5  1e                push     ds
1:0BF6  8ed8              mov      ds, ax
1:0BF8  837e0a00          cmp      word ptr [bp + 0xa], 0
1:0BFC  7504              jne      0xc02
1:0BFE  2bc0              sub      ax, ax
1:0C00  eb09              jmp      0xc0b
1:0C02  8b460e            mov      ax, word ptr [bp + 0xe]
1:0C05  a3b808            mov      word ptr [0x8b8], ax
1:0C08  b80100            mov      ax, 1
1:0C0B  4d                dec      bp
1:0C0C  4d                dec      bp
1:0C0D  8be5              mov      sp, bp
1:0C0F  1f                pop      ds
1:0C10  5d                pop      bp
1:0C11  4d                dec      bp
1:0C12  ca0a00            retf     0xa

; ===== EXPORT:WEP(#2) =====
1:0C15  1e                push     ds
1:0C16  58                pop      ax
1:0C17  90                nop      
1:0C18  45                inc      bp
1:0C19  55                push     bp
1:0C1A  8bec              mov      bp, sp
1:0C1C  1e                push     ds
1:0C1D  8ed8              mov      ds, ax
1:0C1F  b80100            mov      ax, 1
1:0C22  4d                dec      bp
1:0C23  4d                dec      bp
1:0C24  8be5              mov      sp, bp
1:0C26  1f                pop      ds
1:0C27  5d                pop      bp
1:0C28  4d                dec      bp
1:0C29  ca0200            retf     2

; ===== EXPORT:MODULE(#1) =====
1:0C2C  1e                push     ds
1:0C2D  58                pop      ax
1:0C2E  90                nop      
1:0C2F  45                inc      bp
1:0C30  55                push     bp
1:0C31  8bec              mov      bp, sp
1:0C33  1e                push     ds
1:0C34  8ed8              mov      ds, ax
1:0C36  83ec0a            sub      sp, 0xa
1:0C39  56                push     si
1:0C3A  8b4608            mov      ax, word ptr [bp + 8]
1:0C3D  a3b208            mov      word ptr [0x8b2], ax
1:0C40  8b4606            mov      ax, word ptr [bp + 6]
1:0C43  a3b008            mov      word ptr [0x8b0], ax
1:0C46  50                push     ax
1:0C47  9a670c0000        lcall    0, 0xc67  ; @1:KERNEL.GlobalLock
1:0C4C  a3b408            mov      word ptr [0x8b4], ax
1:0C4F  8916b608          mov      word ptr [0x8b6], dx
1:0C53  8bc2              mov      ax, dx
1:0C55  0b06b408          or       ax, word ptr [0x8b4]
1:0C59  7503              jne      0xc5e
1:0C5B  e96a01            jmp      0xdc8
1:0C5E  c41eb408          les      bx, ptr [0x8b4]
1:0C62  26ff7720          push     word ptr es:[bx + 0x20]
1:0C66  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalLock
1:0C6B  a3ba08            mov      word ptr [0x8ba], ax
1:0C6E  8916bc08          mov      word ptr [0x8bc], dx
1:0C72  8bc2              mov      ax, dx
1:0C74  0b06ba08          or       ax, word ptr [0x8ba]
1:0C78  7503              jne      0xc7d
1:0C7A  e94201            jmp      0xdbf
1:0C7D  8b460a            mov      ax, word ptr [bp + 0xa]
1:0C80  e90801            jmp      0xd8b
1:0C83  c41eb408          les      bx, ptr [0x8b4]
1:0C87  26837f1465        cmp      word ptr es:[bx + 0x14], 0x65
1:0C8C  7c0f              jl       0xc9d
1:0C8E  26817f36f400      cmp      word ptr es:[bx + 0x36], 0xf4
1:0C94  7507              jne      0xc9d
1:0C96  26837f3878        cmp      word ptr es:[bx + 0x38], 0x78
1:0C9B  740e              je       0xcab
1:0C9D  c7063a000000      mov      word ptr [0x3a], 0
1:0CA3  c746fc0500        mov      word ptr [bp - 4], 5
1:0CA8  e90701            jmp      0xdb2
1:0CAB  c7063a000100      mov      word ptr [0x3a], 1
1:0CB1  e9fe00            jmp      0xdb2
1:0CB4  b86208            mov      ax, 0x862
1:0CB7  50                push     ax
1:0CB8  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_35(1:125E)
1:0CBD  5b                pop      bx
1:0CBE  ff366208          push     word ptr [0x862]
1:0CC2  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_34(1:12C0)
1:0CC7  5b                pop      bx
1:0CC8  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_33(1:0012)
1:0CCD  eb13              jmp      0xce2
1:0CCF  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_32(1:027B)
1:0CD4  eb0c              jmp      0xce2
1:0CD6  833e3a0000        cmp      word ptr [0x3a], 0
1:0CDB  740b              je       0xce8
1:0CDD  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_31(1:0154)
1:0CE2  8946fc            mov      word ptr [bp - 4], ax
1:0CE5  e9ca00            jmp      0xdb2
1:0CE8  ff36b208          push     word ptr [0x8b2]
1:0CEC  b800ff            mov      ax, 0xff00
1:0CEF  baff00            mov      dx, 0xff
1:0CF2  52                push     dx
1:0CF3  50                push     ax
1:0CF4  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextColor
1:0CF9  ff36b208          push     word ptr [0x8b2]
1:0CFD  2bc0              sub      ax, ax
1:0CFF  50                push     ax
1:0D00  50                push     ax
1:0D01  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkColor
1:0D06  ff36b208          push     word ptr [0x8b2]
1:0D0A  2bc0              sub      ax, ax
1:0D0C  50                push     ax
1:0D0D  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextAlign
1:0D12  ff36b208          push     word ptr [0x8b2]
1:0D16  b80100            mov      ax, 1
1:0D19  50                push     ax
1:0D1A  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkMode
1:0D1F  ff36b208          push     word ptr [0x8b2]
1:0D23  2bc0              sub      ax, ax
1:0D25  50                push     ax
1:0D26  50                push     ax
1:0D27  b83c00            mov      ax, 0x3c
1:0D2A  1e                push     ds
1:0D2B  50                push     ax
1:0D2C  50                push     ax
1:0D2D  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_30(1:1242)
1:0D32  5b                pop      bx
1:0D33  50                push     ax
1:0D34  9affff0000        lcall    0, 0xffff  ; @1:GDI.TextOut
1:0D39  eb77              jmp      0xdb2
1:0D3B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_29(1:02C2)
1:0D40  eba0              jmp      0xce2
1:0D42  a1b808            mov      ax, word ptr [0x8b8]
1:0D45  c41eba08          les      bx, ptr [0x8ba]
1:0D49  26894716          mov      word ptr es:[bx + 0x16], ax
1:0D4D  c746f60000        mov      word ptr [bp - 0xa], 0
1:0D52  8b46f6            mov      ax, word ptr [bp - 0xa]
1:0D55  8bf0              mov      si, ax
1:0D57  d1e6              shl      si, 1
1:0D59  40                inc      ax
1:0D5A  c41eba08          les      bx, ptr [0x8ba]
1:0D5E  2689400e          mov      word ptr es:[bx + si + 0xe], ax
1:0D62  ff46f6            inc      word ptr [bp - 0xa]
1:0D65  837ef604          cmp      word ptr [bp - 0xa], 4
1:0D69  7ce7              jl       0xd52
1:0D6B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_28(1:02DF)
1:0D70  e96fff            jmp      0xce2
1:0D73  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_27(1:02F3)
1:0D78  e967ff            jmp      0xce2
1:0D7B  8b460a            mov      ax, word ptr [bp + 0xa]
1:0D7E  2d0700            sub      ax, 7
1:0D81  50                push     ax
1:0D82  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_26(1:0307)
1:0D87  5b                pop      bx
1:0D88  e957ff            jmp      0xce2
1:0D8B  3d0c00            cmp      ax, 0xc
1:0D8E  7722              ja       0xdb2
1:0D90  d1e0              shl      ax, 1
1:0D92  93                xchg     bx, ax
1:0D93  2effa7980d        jmp      word ptr cs:[bx + 0xd98]
1:0D98  b40c              mov      ah, 0xc
1:0D9A  cf                iret     
1:0D9B  0cd6              or       al, 0xd6
1:0D9D  0c3b              or       al, 0x3b
1:0D9F  0db20d            or       ax, 0xdb2
1:0DA2  42                inc      dx
1:0DA3  0d730d            or       ax, 0xd73
1:0DA6  7b0d              jnp      0xdb5
1:0DA8  7b0d              jnp      0xdb7
1:0DAA  7b0d              jnp      0xdb9
1:0DAC  7b0d              jnp      0xdbb
1:0DAE  b20d              mov      dl, 0xd
1:0DB0  830cc4            or       word ptr [si], 0xffc4
1:0DB3  1e                push     ds
1:0DB4  b408              mov      ah, 8
1:0DB6  26ff7720          push     word ptr es:[bx + 0x20]
1:0DBA  9ac40d0000        lcall    0, 0xdc4  ; @1:KERNEL.GlobalUnlock
1:0DBF  ff36b008          push     word ptr [0x8b0]
1:0DC3  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalUnlock
1:0DC8  8b46fc            mov      ax, word ptr [bp - 4]
1:0DCB  5e                pop      si
1:0DCC  4d                dec      bp
1:0DCD  4d                dec      bp
1:0DCE  8be5              mov      sp, bp
1:0DD0  1f                pop      ds
1:0DD1  5d                pop      bp
1:0DD2  4d                dec      bp
1:0DD3  ca0600            retf     6

; ===== EXPORT:ord_7(#7) =====
1:0DD6  1e                push     ds
1:0DD7  58                pop      ax
1:0DD8  90                nop      
1:0DD9  45                inc      bp
1:0DDA  55                push     bp
1:0DDB  8bec              mov      bp, sp
1:0DDD  1e                push     ds
1:0DDE  8ed8              mov      ds, ax
1:0DE0  83ec38            sub      sp, 0x38
1:0DE3  57                push     di
1:0DE4  56                push     si
1:0DE5  8b5608            mov      dx, word ptr [bp + 8]
1:0DE8  33560c            xor      dx, word ptr [bp + 0xc]
1:0DEB  8956ec            mov      word ptr [bp - 0x14], dx
1:0DEE  8b4606            mov      ax, word ptr [bp + 6]
1:0DF1  8b5608            mov      dx, word ptr [bp + 8]
1:0DF4  0bd2              or       dx, dx
1:0DF6  7d07              jge      0xdff
1:0DF8  f7d8              neg      ax
1:0DFA  83d200            adc      dx, 0
1:0DFD  f7da              neg      dx
1:0DFF  8946fa            mov      word ptr [bp - 6], ax
1:0E02  8956fc            mov      word ptr [bp - 4], dx
1:0E05  8b460a            mov      ax, word ptr [bp + 0xa]
1:0E08  8b560c            mov      dx, word ptr [bp + 0xc]
1:0E0B  0bd2              or       dx, dx
1:0E0D  7d07              jge      0xe16
1:0E0F  f7d8              neg      ax
1:0E11  83d200            adc      dx, 0
1:0E14  f7da              neg      dx
1:0E16  8b4efa            mov      cx, word ptr [bp - 6]
1:0E19  8b5efc            mov      bx, word ptr [bp - 4]
1:0E1C  895edc            mov      word ptr [bp - 0x24], bx
1:0E1F  8956da            mov      word ptr [bp - 0x26], dx
1:0E22  2bf6              sub      si, si
1:0E24  56                push     si
1:0E25  51                push     cx
1:0E26  2bd2              sub      dx, dx
1:0E28  52                push     dx
1:0E29  50                push     ax
1:0E2A  8bf8              mov      di, ax
1:0E2C  894ed0            mov      word ptr [bp - 0x30], cx
1:0E2F  8976d2            mov      word ptr [bp - 0x2e], si
1:0E32  9a550e0000        lcall    0, 0xe55  ; @1:INT:ord_9(1:13E0)
1:0E37  8956d8            mov      word ptr [bp - 0x28], dx
1:0E3A  8b46dc            mov      ax, word ptr [bp - 0x24]
1:0E3D  2bd2              sub      dx, dx
1:0E3F  52                push     dx
1:0E40  50                push     ax
1:0E41  8b4eda            mov      cx, word ptr [bp - 0x26]
1:0E44  2bdb              sub      bx, bx
1:0E46  53                push     bx
1:0E47  51                push     cx
1:0E48  8946cc            mov      word ptr [bp - 0x34], ax
1:0E4B  8956ce            mov      word ptr [bp - 0x32], dx
1:0E4E  894ec8            mov      word ptr [bp - 0x38], cx
1:0E51  895eca            mov      word ptr [bp - 0x36], bx
1:0E54  9a760e0000        lcall    0, 0xe76  ; @1:INT:ord_9(1:13E0)
1:0E59  8946e2            mov      word ptr [bp - 0x1e], ax
1:0E5C  8956e4            mov      word ptr [bp - 0x1c], dx
1:0E5F  2bc9              sub      cx, cx
1:0E61  034ed8            add      cx, word ptr [bp - 0x28]
1:0E64  150000            adc      ax, 0
1:0E67  894ef2            mov      word ptr [bp - 0xe], cx
1:0E6A  8946f4            mov      word ptr [bp - 0xc], ax
1:0E6D  56                push     si
1:0E6E  57                push     di
1:0E6F  ff76ce            push     word ptr [bp - 0x32]
1:0E72  ff76cc            push     word ptr [bp - 0x34]
1:0E75  9a8b0e0000        lcall    0, 0xe8b  ; @1:INT:ord_9(1:13E0)
1:0E7A  ff76d2            push     word ptr [bp - 0x2e]
1:0E7D  ff76d0            push     word ptr [bp - 0x30]
1:0E80  ff76ca            push     word ptr [bp - 0x36]
1:0E83  ff76c8            push     word ptr [bp - 0x38]
1:0E86  8bf0              mov      si, ax
1:0E88  8bfa              mov      di, dx