File: raw\unpacked\MODULES\NOCTURNE.AD
Module: 'NOCTURNE' ('Graphics Module Library')
CS:IP=1:10D4  SS:SP=0:0000  AutoDS=2  Heap=1024  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (3): KERNEL, GDI, USER
Segments (2):
  SEG  1: CODE off=0x00620 len=0x1106 min=0x1106 flags=0x0D50 relocs=71
  SEG  2: DATA off=0x018C0 len=0x0538 min=0x0538 flags=0x0C71 relocs=0
Exports (28):
  ord   1: SEG1:0734 flags=0x03 MODULE
  ord   2: SEG1:071D flags=0x03 WEP
  ord   3: SEG1:10C0 flags=0x03 ___EXPORTEDSTUB
  ord   4: SEG1:0970 flags=0x00 
  ord   5: SEG1:0984 flags=0x00 
  ord   6: SEG1:0408 flags=0x00 
  ord   7: SEG1:03F4 flags=0x00 
  ord   8: SEG1:03CB flags=0x00 
  ord   9: SEG1:034E flags=0x00 
  ord  10: SEG1:08F2 flags=0x00 
  ord  11: SEG1:015A flags=0x00 
  ord  12: SEG1:011A flags=0x00 
  ord  13: SEG1:0014 flags=0x00 
  ord  14: SEG1:090E flags=0x00 
  ord  15: SEG1:06F6 flags=0x00 
  ord  16: SEG1:09B4 flags=0x00 
  ord  17: SEG1:0AB8 flags=0x00 
  ord  18: SEG1:0C2A flags=0x00 
  ord  19: SEG1:0AEA flags=0x00 
  ord  20: SEG1:0D5C flags=0x00 
  ord  21: SEG1:0D84 flags=0x00 
  ord  22: SEG1:0E26 flags=0x00 
  ord  23: SEG1:0DEA flags=0x00 
  ord  24: SEG1:0E50 flags=0x00 
  ord  25: SEG1:0D88 flags=0x00 
  ord  26: SEG1:0B04 flags=0x00 
  ord  27: SEG1:0FF4 flags=0x00 
  ord  28: SEG1:10B0 flags=0x00 
Resources (9):
  RT_BITMAP        #1               off=0x01E40 len=  1328
  TYPE_1000        #1               off=0x02370 len=    64
  TYPE_1000        #2               off=0x023B0 len=    96
  TYPE_1000        #3               off=0x02410 len=    32
  TYPE_1000        #4               off=0x02430 len=   112
  TYPE_2000        #10              off=0x024A0 len=    96
  TYPE_2000        #20              off=0x02500 len=    16
  TYPE_2000        #30              off=0x02510 len=   240
  TYPE_15          #1               off=0x02600 len=    16

1:0000  1e                push     ds
1:0001  58                pop      ax
1:0002  90                nop      
1:0003  45                inc      bp
1:0004  55                push     bp
1:0005  8bec              mov      bp, sp
1:0007  1e                push     ds
1:0008  8ed8              mov      ds, ax
1:000A  2bc0              sub      ax, ax
1:000C  4d                dec      bp
1:000D  4d                dec      bp
1:000E  8be5              mov      sp, bp
1:0010  1f                pop      ds
1:0011  5d                pop      bp
1:0012  4d                dec      bp
1:0013  cb                retf     

; ===== EXPORT:ord_13(#13) =====
1:0014  1e                push     ds
1:0015  58                pop      ax
1:0016  90                nop      
1:0017  45                inc      bp
1:0018  55                push     bp
1:0019  8bec              mov      bp, sp
1:001B  1e                push     ds
1:001C  8ed8              mov      ds, ax
1:001E  56                push     si
1:001F  c70650030000      mov      word ptr [0x350], 0
1:0025  b81e00            mov      ax, 0x1e
1:0028  f72e5003          imul     word ptr [0x350]
1:002C  8bf0              mov      si, ax
1:002E  81c6fc03          add      si, 0x3fc
1:0032  c744100100        mov      word ptr [si + 0x10], 1
1:0037  c744120000        mov      word ptr [si + 0x12], 0
1:003C  ff065003          inc      word ptr [0x350]
1:0040  833e50030a        cmp      word ptr [0x350], 0xa
1:0045  7cde              jl       0x25
1:0047  c70650030000      mov      word ptr [0x350], 0
1:004D  8b1e5003          mov      bx, word ptr [0x350]
1:0051  d1e3              shl      bx, 1
1:0053  c787e2030000      mov      word ptr [bx + 0x3e2], 0
1:0059  ff065003          inc      word ptr [0x350]
1:005D  833e500307        cmp      word ptr [0x350], 7
1:0062  7ce9              jl       0x4d
1:0064  ff36f003          push     word ptr [0x3f0]
1:0068  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateCompatibleDC
1:006D  a31000            mov      word ptr [0x10], ax
1:0070  0bc0              or       ax, ax
1:0072  750a              jne      0x7e
1:0074  0e                push     cs
1:0075  e8d602            call     0x34e
1:0078  b80100            mov      ax, 1
1:007B  e99300            jmp      0x111
1:007E  ff362805          push     word ptr [0x528]
1:0082  b83000            mov      ax, 0x30
1:0085  1e                push     ds
1:0086  50                push     ax
1:0087  9affff0000        lcall    0, 0xffff  ; @1:USER.LoadBitmap
1:008C  a31200            mov      word ptr [0x12], ax
1:008F  0bc0              or       ax, ax
1:0091  74e1              je       0x74
1:0093  b80400            mov      ax, 4
1:0096  50                push     ax
1:0097  9aa7000000        lcall    0, 0xa7  ; @1:GDI.GetStockObject
1:009C  a32e05            mov      word ptr [0x52e], ax
1:009F  0bc0              or       ax, ax
1:00A1  74d1              je       0x74
1:00A3  2bc0              sub      ax, ax
1:00A5  50                push     ax
1:00A6  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:00AB  a32a05            mov      word ptr [0x52a], ax
1:00AE  0bc0              or       ax, ax
1:00B0  74c2              je       0x74
1:00B2  c70650030000      mov      word ptr [0x350], 0
1:00B8  eb04              jmp      0xbe
1:00BA  ff065003          inc      word ptr [0x350]
1:00BE  833e500307        cmp      word ptr [0x350], 7
1:00C3  7d2e              jge      0xf3
1:00C5  8b1e5003          mov      bx, word ptr [0x350]
1:00C9  d1e3              shl      bx, 1
1:00CB  d1e3              shl      bx, 1
1:00CD  ffb71600          push     word ptr [bx + 0x16]
1:00D1  ffb71400          push     word ptr [bx + 0x14]
1:00D5  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateSolidBrush
1:00DA  8b1e5003          mov      bx, word ptr [0x350]
1:00DE  d1e3              shl      bx, 1
1:00E0  8987e203          mov      word ptr [bx + 0x3e2], ax
1:00E4  8b1e5003          mov      bx, word ptr [0x350]
1:00E8  d1e3              shl      bx, 1
1:00EA  83bfe20300        cmp      word ptr [bx + 0x3e2], 0
1:00EF  75c9              jne      0xba
1:00F1  eb81              jmp      0x74
1:00F3  ff361000          push     word ptr [0x10]
1:00F7  ff361200          push     word ptr [0x12]
1:00FB  9a65030000        lcall    0, 0x365  ; @1:GDI.SelectObject
1:0100  a3fa03            mov      word ptr [0x3fa], ax
1:0103  9a67010000        lcall    0, 0x167  ; @1:USER.GetTickCount
1:0108  50                push     ax
1:0109  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_4(1:0970)
1:010E  5b                pop      bx
1:010F  2bc0              sub      ax, ax
1:0111  5e                pop      si
1:0112  4d                dec      bp
1:0113  4d                dec      bp
1:0114  8be5              mov      sp, bp
1:0116  1f                pop      ds
1:0117  5d                pop      bp
1:0118  4d                dec      bp
1:0119  cb                retf     

; ===== EXPORT:ord_12(#12) =====
1:011A  1e                push     ds
1:011B  58                pop      ax
1:011C  90                nop      
1:011D  45                inc      bp
1:011E  55                push     bp
1:011F  8bec              mov      bp, sp
1:0121  1e                push     ds
1:0122  8ed8              mov      ds, ax
1:0124  b85203            mov      ax, 0x352
1:0127  1e                push     ds
1:0128  50                push     ax
1:0129  2bc0              sub      ax, ax
1:012B  50                push     ax
1:012C  50                push     ax
1:012D  c41e3405          les      bx, ptr [0x534]
1:0131  26ff7702          push     word ptr es:[bx + 2]
1:0135  26ff7704          push     word ptr es:[bx + 4]
1:0139  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:013E  ff36f003          push     word ptr [0x3f0]
1:0142  b85203            mov      ax, 0x352
1:0145  1e                push     ds
1:0146  50                push     ax
1:0147  ff362e05          push     word ptr [0x52e]
1:014B  9affff0000        lcall    0, 0xffff  ; @1:USER.FillRect
1:0150  2bc0              sub      ax, ax
1:0152  4d                dec      bp
1:0153  4d                dec      bp
1:0154  8be5              mov      sp, bp
1:0156  1f                pop      ds
1:0157  5d                pop      bp
1:0158  4d                dec      bp
1:0159  cb                retf     

; ===== EXPORT:ord_11(#11) =====
1:015A  1e                push     ds
1:015B  58                pop      ax
1:015C  90                nop      
1:015D  45                inc      bp
1:015E  55                push     bp
1:015F  8bec              mov      bp, sp
1:0161  1e                push     ds
1:0162  8ed8              mov      ds, ax
1:0164  57                push     di
1:0165  56                push     si
1:0166  9aa5020000        lcall    0, 0x2a5  ; @1:USER.GetTickCount
1:016B  a35a03            mov      word ptr [0x35a], ax
1:016E  89165c03          mov      word ptr [0x35c], dx
1:0172  c7065e030000      mov      word ptr [0x35e], 0
1:0178  b81e00            mov      ax, 0x1e
1:017B  f72e5e03          imul     word ptr [0x35e]
1:017F  8bd8              mov      bx, ax
1:0181  83bf0e0400        cmp      word ptr [bx + 0x40e], 0
1:0186  7409              je       0x191
1:0188  ff365e03          push     word ptr [0x35e]
1:018C  0e                push     cs
1:018D  e83d04            call     0x5cd
1:0190  5b                pop      bx
1:0191  ff065e03          inc      word ptr [0x35e]
1:0195  833e5e030a        cmp      word ptr [0x35e], 0xa
1:019A  7cdc              jl       0x178
1:019C  a15a03            mov      ax, word ptr [0x35a]
1:019F  8b165c03          mov      dx, word ptr [0x35c]
1:01A3  2b063005          sub      ax, word ptr [0x530]
1:01A7  1b163205          sbb      dx, word ptr [0x532]
1:01AB  3b16f403          cmp      dx, word ptr [0x3f4]
1:01AF  7c6b              jl       0x21c
1:01B1  7f06              jg       0x1b9
1:01B3  3b06f203          cmp      ax, word ptr [0x3f2]
1:01B7  7663              jbe      0x21c
1:01B9  c7065e030000      mov      word ptr [0x35e], 0
1:01BF  eb04              jmp      0x1c5
1:01C1  ff065e03          inc      word ptr [0x35e]
1:01C5  833e5e030a        cmp      word ptr [0x35e], 0xa
1:01CA  7d50              jge      0x21c
1:01CC  b81e00            mov      ax, 0x1e
1:01CF  f72e5e03          imul     word ptr [0x35e]
1:01D3  8bd8              mov      bx, ax
1:01D5  83bf0c0400        cmp      word ptr [bx + 0x40c], 0
1:01DA  74e5              je       0x1c1
1:01DC  b86400            mov      ax, 0x64
1:01DF  c41e3405          les      bx, ptr [0x534]
1:01E3  262b470c          sub      ax, word ptr es:[bx + 0xc]
1:01E7  b91900            mov      cx, 0x19
1:01EA  99                cdq      
1:01EB  f7f9              idiv     cx
1:01ED  40                inc      ax
1:01EE  50                push     ax
1:01EF  b80100            mov      ax, 1
1:01F2  50                push     ax
1:01F3  0e                push     cs
1:01F4  e8b404            call     0x6ab
1:01F7  5b                pop      bx
1:01F8  5b                pop      bx
1:01F9  b9e803            mov      cx, 0x3e8
1:01FC  f7e9              imul     cx
1:01FE  a3f203            mov      word ptr [0x3f2], ax
1:0201  8916f403          mov      word ptr [0x3f4], dx
1:0205  a15a03            mov      ax, word ptr [0x35a]
1:0208  8b165c03          mov      dx, word ptr [0x35c]
1:020C  a33005            mov      word ptr [0x530], ax
1:020F  89163205          mov      word ptr [0x532], dx
1:0213  ff365e03          push     word ptr [0x35e]
1:0217  0e                push     cs
1:0218  e89002            call     0x4ab
1:021B  5b                pop      bx
1:021C  c7065e030000      mov      word ptr [0x35e], 0
1:0222  eb64              jmp      0x288
1:0224  c7066c035300      mov      word ptr [0x36c], 0x53
1:022A  c7066e030000      mov      word ptr [0x36e], 0
1:0230  ff0e6403          dec      word ptr [0x364]
1:0234  7931              jns      0x267
1:0236  b80100            mov      ax, 1
1:0239  a36403            mov      word ptr [0x364], ax
1:023C  a36603            mov      word ptr [0x366], ax
1:023F  b8a00f            mov      ax, 0xfa0
1:0242  50                push     ax
1:0243  b8e803            mov      ax, 0x3e8
1:0246  50                push     ax
1:0247  0e                push     cs
1:0248  e86004            call     0x6ab
1:024B  5b                pop      bx
1:024C  5b                pop      bx
1:024D  99                cdq      
1:024E  a36c03            mov      word ptr [0x36c], ax
1:0251  89166e03          mov      word ptr [0x36e], dx
1:0255  eb16              jmp      0x26d
1:0257  ff0e6003          dec      word ptr [0x360]
1:025B  c70666030000      mov      word ptr [0x366], 0
1:0261  c70664030300      mov      word ptr [0x364], 3
1:0267  c70672030100      mov      word ptr [0x372], 1
1:026D  b81e00            mov      ax, 0x1e
1:0270  f72e5e03          imul     word ptr [0x35e]
1:0274  8bd8              mov      bx, ax
1:0276  8dbffc03          lea      di, [bx + 0x3fc]
1:027A  be6003            mov      si, 0x360
1:027D  1e                push     ds
1:027E  07                pop      es
1:027F  b90f00            mov      cx, 0xf
1:0282  f3a5              rep movsw word ptr es:[di], word ptr [si]
1:0284  ff065e03          inc      word ptr [0x35e]
1:0288  833e5e030a        cmp      word ptr [0x35e], 0xa
1:028D  7c03              jl       0x292
1:028F  e9b000            jmp      0x342
1:0292  b81e00            mov      ax, 0x1e
1:0295  f72e5e03          imul     word ptr [0x35e]
1:0299  8bd8              mov      bx, ax
1:029B  83bf0c0400        cmp      word ptr [bx + 0x40c], 0
1:02A0  75e2              jne      0x284
1:02A2  8bf3              mov      si, bx
1:02A4  9ad9020000        lcall    0, 0x2d9  ; @1:USER.GetTickCount
1:02A9  2b840404          sub      ax, word ptr [si + 0x404]
1:02AD  1b940604          sbb      dx, word ptr [si + 0x406]
1:02B1  3b940a04          cmp      dx, word ptr [si + 0x40a]
1:02B5  72cd              jb       0x284
1:02B7  7706              ja       0x2bf
1:02B9  3b840804          cmp      ax, word ptr [si + 0x408]
1:02BD  76c5              jbe      0x284
1:02BF  b81e00            mov      ax, 0x1e
1:02C2  f72e5e03          imul     word ptr [0x35e]
1:02C6  8bd8              mov      bx, ax
1:02C8  b86003            mov      ax, 0x360
1:02CB  8bf8              mov      di, ax
1:02CD  8db7fc03          lea      si, [bx + 0x3fc]
1:02D1  1e                push     ds
1:02D2  07                pop      es
1:02D3  b90f00            mov      cx, 0xf
1:02D6  f3a5              rep movsw word ptr es:[di], word ptr [si]
1:02D8  9affff0000        lcall    0, 0xffff  ; @1:USER.GetTickCount
1:02DD  a36803            mov      word ptr [0x368], ax
1:02E0  89166a03          mov      word ptr [0x36a], dx
1:02E4  a16603            mov      ax, word ptr [0x366]
1:02E7  0bc0              or       ax, ax
1:02E9  7503              jne      0x2ee
1:02EB  e936ff            jmp      0x224
1:02EE  48                dec      ax
1:02EF  7436              je       0x327
1:02F1  48                dec      ax
1:02F2  7403              je       0x2f7
1:02F4  e976ff            jmp      0x26d
1:02F7  c7066c035300      mov      word ptr [0x36c], 0x53
1:02FD  c7066e030000      mov      word ptr [0x36e], 0
1:0303  ff066403          inc      word ptr [0x364]
1:0307  833e640303        cmp      word ptr [0x364], 3
1:030C  7f03              jg       0x311
1:030E  e956ff            jmp      0x267
1:0311  833e600300        cmp      word ptr [0x360], 0
1:0316  7c03              jl       0x31b
1:0318  e93cff            jmp      0x257
1:031B  b86003            mov      ax, 0x360
1:031E  50                push     ax
1:031F  0e                push     cs
1:0320  e85403            call     0x677
1:0323  5b                pop      bx
1:0324  e946ff            jmp      0x26d
1:0327  c70666030200      mov      word ptr [0x366], 2
1:032D  c70672030100      mov      word ptr [0x372], 1
1:0333  c7066c035300      mov      word ptr [0x36c], 0x53
1:0339  c7066e030000      mov      word ptr [0x36e], 0
1:033F  e92bff            jmp      0x26d
1:0342  2bc0              sub      ax, ax
1:0344  5e                pop      si
1:0345  5f                pop      di
1:0346  4d                dec      bp
1:0347  4d                dec      bp
1:0348  8be5              mov      sp, bp
1:034A  1f                pop      ds
1:034B  5d                pop      bp
1:034C  4d                dec      bp
1:034D  cb                retf     

; ===== EXPORT:ord_9(#9) =====
1:034E  1e                push     ds
1:034F  58                pop      ax
1:0350  90                nop      
1:0351  45                inc      bp
1:0352  55                push     bp
1:0353  8bec              mov      bp, sp
1:0355  1e                push     ds
1:0356  8ed8              mov      ds, ax
1:0358  83ec04            sub      sp, 4
1:035B  56                push     si
1:035C  ff361000          push     word ptr [0x10]
1:0360  ff36fa03          push     word ptr [0x3fa]
1:0364  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectObject
1:0369  833e100000        cmp      word ptr [0x10], 0
1:036E  740f              je       0x37f
1:0370  ff361000          push     word ptr [0x10]
1:0374  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteDC
1:0379  c70610000000      mov      word ptr [0x10], 0
1:037F  833e120000        cmp      word ptr [0x12], 0
1:0384  740f              je       0x395
1:0386  ff361200          push     word ptr [0x12]
1:038A  9aad030000        lcall    0, 0x3ad  ; @1:GDI.DeleteObject
1:038F  c70612000000      mov      word ptr [0x12], 0
1:0395  c746fc0000        mov      word ptr [bp - 4], 0
1:039A  8b5efc            mov      bx, word ptr [bp - 4]
1:039D  d1e3              shl      bx, 1
1:039F  83bfe20300        cmp      word ptr [bx + 0x3e2], 0
1:03A4  7411              je       0x3b7
1:03A6  ffb7e203          push     word ptr [bx + 0x3e2]
1:03AA  8bf3              mov      si, bx
1:03AC  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteObject
1:03B1  c784e2030000      mov      word ptr [si + 0x3e2], 0
1:03B7  ff46fc            inc      word ptr [bp - 4]
1:03BA  837efc07          cmp      word ptr [bp - 4], 7
1:03BE  7cda              jl       0x39a
1:03C0  2bc0              sub      ax, ax
1:03C2  5e                pop      si
1:03C3  4d                dec      bp
1:03C4  4d                dec      bp
1:03C5  8be5              mov      sp, bp
1:03C7  1f                pop      ds
1:03C8  5d                pop      bp
1:03C9  4d                dec      bp
1:03CA  cb                retf     

; ===== EXPORT:ord_8(#8) =====
1:03CB  1e                push     ds
1:03CC  58                pop      ax
1:03CD  90                nop      
1:03CE  45                inc      bp
1:03CF  55                push     bp
1:03D0  8bec              mov      bp, sp
1:03D2  1e                push     ds
1:03D3  8ed8              mov      ds, ax
1:03D5  c41ef603          les      bx, ptr [0x3f6]
1:03D9  26837f0a04        cmp      word ptr es:[bx + 0xa], 4
1:03DE  7d0a              jge      0x3ea
1:03E0  c41e3405          les      bx, ptr [0x534]
1:03E4  26c747120000      mov      word ptr es:[bx + 0x12], 0
1:03EA  2bc0              sub      ax, ax
1:03EC  4d                dec      bp
1:03ED  4d                dec      bp
1:03EE  8be5              mov      sp, bp
1:03F0  1f                pop      ds
1:03F1  5d                pop      bp
1:03F2  4d                dec      bp
1:03F3  cb                retf     

; ===== EXPORT:ord_7(#7) =====
1:03F4  1e                push     ds
1:03F5  58                pop      ax
1:03F6  90                nop      
1:03F7  45                inc      bp
1:03F8  55                push     bp
1:03F9  8bec              mov      bp, sp
1:03FB  1e                push     ds
1:03FC  8ed8              mov      ds, ax
1:03FE  2bc0              sub      ax, ax
1:0400  4d                dec      bp
1:0401  4d                dec      bp
1:0402  8be5              mov      sp, bp
1:0404  1f                pop      ds
1:0405  5d                pop      bp
1:0406  4d                dec      bp
1:0407  cb                retf     

; ===== EXPORT:ord_6(#6) =====
1:0408  1e                push     ds
1:0409  58                pop      ax
1:040A  90                nop      
1:040B  45                inc      bp
1:040C  55                push     bp
1:040D  8bec              mov      bp, sp
1:040F  1e                push     ds
1:0410  8ed8              mov      ds, ax
1:0412  2bc0              sub      ax, ax
1:0414  4d                dec      bp
1:0415  4d                dec      bp
1:0416  8be5              mov      sp, bp
1:0418  1f                pop      ds
1:0419  5d                pop      bp
1:041A  4d                dec      bp
1:041B  cb                retf     
1:041C  1e                push     ds
1:041D  58                pop      ax
1:041E  90                nop      
1:041F  45                inc      bp
1:0420  55                push     bp
1:0421  8bec              mov      bp, sp
1:0423  1e                push     ds
1:0424  8ed8              mov      ds, ax
1:0426  57                push     di
1:0427  56                push     si
1:0428  8b7606            mov      si, word ptr [bp + 6]
1:042B  8b7e08            mov      di, word ptr [bp + 8]
1:042E  8b4506            mov      ax, word ptr [di + 6]
1:0431  394402            cmp      word ptr [si + 2], ax
1:0434  7d1b              jge      0x451
1:0436  8b4406            mov      ax, word ptr [si + 6]
1:0439  394502            cmp      word ptr [di + 2], ax
1:043C  7d13              jge      0x451
1:043E  8b04              mov      ax, word ptr [si]
1:0440  394504            cmp      word ptr [di + 4], ax
1:0443  7e0c              jle      0x451
1:0445  8b05              mov      ax, word ptr [di]
1:0447  394404            cmp      word ptr [si + 4], ax
1:044A  7e05              jle      0x451
1:044C  b80100            mov      ax, 1
1:044F  eb02              jmp      0x453
1:0451  2bc0              sub      ax, ax
1:0453  5e                pop      si
1:0454  5f                pop      di
1:0455  4d                dec      bp
1:0456  4d                dec      bp
1:0457  8be5              mov      sp, bp
1:0459  1f                pop      ds
1:045A  5d                pop      bp
1:045B  4d                dec      bp
1:045C  cb                retf     
1:045D  1e                push     ds
1:045E  58                pop      ax
1:045F  90                nop      
1:0460  45                inc      bp
1:0461  55                push     bp
1:0462  8bec              mov      bp, sp
1:0464  1e                push     ds
1:0465  8ed8              mov      ds, ax
1:0467  c7067e030000      mov      word ptr [0x37e], 0
1:046D  eb04              jmp      0x473
1:046F  ff067e03          inc      word ptr [0x37e]
1:0473  833e7e030a        cmp      word ptr [0x37e], 0xa
1:0478  7d27              jge      0x4a1
1:047A  b81e00            mov      ax, 0x1e
1:047D  f72e7e03          imul     word ptr [0x37e]
1:0481  8bd8              mov      bx, ax
1:0483  83bf0c0400        cmp      word ptr [bx + 0x40c], 0
1:0488  75e5              jne      0x46f
1:048A  ff7606            push     word ptr [bp + 6]
1:048D  81c31204          add      bx, 0x412
1:0491  53                push     bx
1:0492  0e                push     cs
1:0493  e886ff            call     0x41c
1:0496  5b                pop      bx
1:0497  5b                pop      bx
1:0498  0bc0              or       ax, ax
1:049A  74d3              je       0x46f
1:049C  b80100            mov      ax, 1
1:049F  eb02              jmp      0x4a3
1:04A1  2bc0              sub      ax, ax
1:04A3  4d                dec      bp
1:04A4  4d                dec      bp
1:04A5  8be5              mov      sp, bp
1:04A7  1f                pop      ds
1:04A8  5d                pop      bp
1:04A9  4d                dec      bp
1:04AA  cb                retf     
1:04AB  1e                push     ds
1:04AC  58                pop      ax
1:04AD  90                nop      
1:04AE  45                inc      bp
1:04AF  55                push     bp
1:04B0  8bec              mov      bp, sp
1:04B2  1e                push     ds
1:04B3  8ed8              mov      ds, ax
1:04B5  57                push     di
1:04B6  56                push     si
1:04B7  2bc0              sub      ax, ax
1:04B9  a38803            mov      word ptr [0x388], ax
1:04BC  a38a03            mov      word ptr [0x38a], ax
1:04BF  c41e3405          les      bx, ptr [0x534]
1:04C3  268b4704          mov      ax, word ptr es:[bx + 4]
1:04C7  a38e03            mov      word ptr [0x38e], ax
1:04CA  268b4702          mov      ax, word ptr es:[bx + 2]
1:04CE  a38c03            mov      word ptr [0x38c], ax
1:04D1  a18e03            mov      ax, word ptr [0x38e]
1:04D4  2d1000            sub      ax, 0x10
1:04D7  50                push     ax
1:04D8  2bc0              sub      ax, ax
1:04DA  50                push     ax
1:04DB  0e                push     cs
1:04DC  e8cc01            call     0x6ab
1:04DF  5b                pop      bx
1:04E0  5b                pop      bx
1:04E1  a38203            mov      word ptr [0x382], ax
1:04E4  a18c03            mov      ax, word ptr [0x38c]
1:04E7  2d2000            sub      ax, 0x20
1:04EA  50                push     ax
1:04EB  ff368803          push     word ptr [0x388]
1:04EF  0e                push     cs
1:04F0  e8b801            call     0x6ab
1:04F3  5b                pop      bx
1:04F4  5b                pop      bx
1:04F5  a38003            mov      word ptr [0x380], ax
1:04F8  a18203            mov      ax, word ptr [0x382]
1:04FB  051000            add      ax, 0x10
1:04FE  a38603            mov      word ptr [0x386], ax
1:0501  a18003            mov      ax, word ptr [0x380]
1:0504  052000            add      ax, 0x20
1:0507  a38403            mov      word ptr [0x384], ax
1:050A  b88003            mov      ax, 0x380
1:050D  50                push     ax
1:050E  0e                push     cs
1:050F  e84bff            call     0x45d
1:0512  5b                pop      bx
1:0513  0bc0              or       ax, ax
1:0515  7403              je       0x51a
1:0517  e9a900            jmp      0x5c3
1:051A  b81e00            mov      ax, 0x1e
1:051D  f76e06            imul     word ptr [bp + 6]
1:0520  8bd8              mov      bx, ax
1:0522  8dbf1204          lea      di, [bx + 0x412]
1:0526  be8003            mov      si, 0x380
1:0529  1e                push     ds
1:052A  07                pop      es
1:052B  a5                movsw    word ptr es:[di], word ptr [si]
1:052C  a5                movsw    word ptr es:[di], word ptr [si]
1:052D  a5                movsw    word ptr es:[di], word ptr [si]
1:052E  a5                movsw    word ptr es:[di], word ptr [si]
1:052F  2bc0              sub      ax, ax
1:0531  89870c04          mov      word ptr [bx + 0x40c], ax
1:0535  89870204          mov      word ptr [bx + 0x402], ax
1:0539  c7870e040100      mov      word ptr [bx + 0x40e], 1
1:053F  b80500            mov      ax, 5
1:0542  50                push     ax
1:0543  2bc0              sub      ax, ax
1:0545  50                push     ax
1:0546  8bf3              mov      si, bx
1:0548  0e                push     cs
1:0549  e85f01            call     0x6ab
1:054C  5b                pop      bx
1:054D  5b                pop      bx
1:054E  8984fe03          mov      word ptr [si + 0x3fe], ax
1:0552  c78400040300      mov      word ptr [si + 0x400], 3
1:0558  b80600            mov      ax, 6
1:055B  50                push     ax
1:055C  b80100            mov      ax, 1
1:055F  50                push     ax
1:0560  0e                push     cs
1:0561  e84701            call     0x6ab
1:0564  5b                pop      bx
1:0565  5b                pop      bx
1:0566  8984fc03          mov      word ptr [si + 0x3fc], ax
1:056A  9a04010000        lcall    0, 0x104  ; @1:USER.GetTickCount
1:056F  89840404          mov      word ptr [si + 0x404], ax
1:0573  89940604          mov      word ptr [si + 0x406], dx
1:0577  c78408045300      mov      word ptr [si + 0x408], 0x53
1:057D  c7840a040000      mov      word ptr [si + 0x40a], 0
1:0583  c41ef603          les      bx, ptr [0x3f6]
1:0587  26837f0a01        cmp      word ptr es:[bx + 0xa], 1
1:058C  7e26              jle      0x5b4
1:058E  c41e3405          les      bx, ptr [0x534]
1:0592  26837f0a00        cmp      word ptr es:[bx + 0xa], 0
1:0597  741b              je       0x5b4
1:0599  b80700            mov      ax, 7
1:059C  50                push     ax
1:059D  2bc0              sub      ax, ax
1:059F  50                push     ax
1:05A0  0e                push     cs
1:05A1  e80701            call     0x6ab
1:05A4  5b                pop      bx
1:05A5  5b                pop      bx
1:05A6  8bd8              mov      bx, ax
1:05A8  d1e3              shl      bx, 1
1:05AA  8b87e203          mov      ax, word ptr [bx + 0x3e2]
1:05AE  89841004          mov      word ptr [si + 0x410], ax
1:05B2  eb0f              jmp      0x5c3
1:05B4  b81e00            mov      ax, 0x1e
1:05B7  f76e06            imul     word ptr [bp + 6]
1:05BA  8bd8              mov      bx, ax
1:05BC  a12a05            mov      ax, word ptr [0x52a]
1:05BF  89871004          mov      word ptr [bx + 0x410], ax
1:05C3  5e                pop      si
1:05C4  5f                pop      di
1:05C5  4d                dec      bp
1:05C6  4d                dec      bp
1:05C7  8be5              mov      sp, bp
1:05C9  1f                pop      ds
1:05CA  5d                pop      bp
1:05CB  4d                dec      bp
1:05CC  cb                retf     
1:05CD  1e                push     ds
1:05CE  58                pop      ax
1:05CF  90                nop      
1:05D0  45                inc      bp
1:05D1  55                push     bp
1:05D2  8bec              mov      bp, sp
1:05D4  1e                push     ds
1:05D5  8ed8              mov      ds, ax
1:05D7  56                push     si
1:05D8  b81e00            mov      ax, 0x1e
1:05DB  f76e06            imul     word ptr [bp + 6]
1:05DE  8bd8              mov      bx, ax
1:05E0  8b87fe03          mov      ax, word ptr [bx + 0x3fe]
1:05E4  a39a03            mov      word ptr [0x39a], ax
1:05E7  8b870004          mov      ax, word ptr [bx + 0x400]
1:05EB  a39803            mov      word ptr [0x398], ax
1:05EE  c7870e040000      mov      word ptr [bx + 0x40e], 0
1:05F4  83bf000403        cmp      word ptr [bx + 0x400], 3
1:05F9  7515              jne      0x610
1:05FB  ff36f003          push     word ptr [0x3f0]
1:05FF  81c31204          add      bx, 0x412
1:0603  1e                push     ds
1:0604  53                push     bx
1:0605  ff362e05          push     word ptr [0x52e]
1:0609  9a92060000        lcall    0, 0x692  ; @1:USER.FillRect
1:060E  eb5e              jmp      0x66e
1:0610  ff36f003          push     word ptr [0x3f0]
1:0614  b81e00            mov      ax, 0x1e
1:0617  f76e06            imul     word ptr [bp + 6]
1:061A  8bd8              mov      bx, ax
1:061C  ffb71004          push     word ptr [bx + 0x410]
1:0620  8bf0              mov      si, ax
1:0622  9a6a060000        lcall    0, 0x66a  ; @1:GDI.SelectObject
1:0627  a39c03            mov      word ptr [0x39c], ax
1:062A  ff36f003          push     word ptr [0x3f0]
1:062E  ffb41204          push     word ptr [si + 0x412]
1:0632  ffb41404          push     word ptr [si + 0x414]
1:0636  b82000            mov      ax, 0x20
1:0639  50                push     ax
1:063A  b81000            mov      ax, 0x10
1:063D  50                push     ax
1:063E  ff361000          push     word ptr [0x10]
1:0642  b105              mov      cl, 5
1:0644  8b840004          mov      ax, word ptr [si + 0x400]
1:0648  d3e0              shl      ax, cl
1:064A  50                push     ax
1:064B  b104              mov      cl, 4
1:064D  8b84fe03          mov      ax, word ptr [si + 0x3fe]
1:0651  d3e0              shl      ax, cl
1:0653  50                push     ax
1:0654  b84607            mov      ax, 0x746
1:0657  bae200            mov      dx, 0xe2
1:065A  52                push     dx
1:065B  50                push     ax
1:065C  9affff0000        lcall    0, 0xffff  ; @1:GDI.BitBlt
1:0661  ff36f003          push     word ptr [0x3f0]
1:0665  ff369c03          push     word ptr [0x39c]
1:0669  9afc000000        lcall    0, 0xfc  ; @1:GDI.SelectObject
1:066E  5e                pop      si
1:066F  4d                dec      bp
1:0670  4d                dec      bp
1:0671  8be5              mov      sp, bp
1:0673  1f                pop      ds
1:0674  5d                pop      bp
1:0675  4d                dec      bp
1:0676  cb                retf     
1:0677  1e                push     ds
1:0678  58                pop      ax
1:0679  90                nop      
1:067A  45                inc      bp
1:067B  55                push     bp
1:067C  8bec              mov      bp, sp
1:067E  1e                push     ds
1:067F  8ed8              mov      ds, ax
1:0681  ff36f003          push     word ptr [0x3f0]
1:0685  8b4606            mov      ax, word ptr [bp + 6]
1:0688  051600            add      ax, 0x16
1:068B  1e                push     ds
1:068C  50                push     ax
1:068D  ff362e05          push     word ptr [0x52e]
1:0691  9a4c010000        lcall    0, 0x14c  ; @1:USER.FillRect
1:0696  8b5e06            mov      bx, word ptr [bp + 6]
1:0699  c747100100        mov      word ptr [bx + 0x10], 1
1:069E  c747120000        mov      word ptr [bx + 0x12], 0
1:06A3  4d                dec      bp
1:06A4  4d                dec      bp
1:06A5  8be5              mov      sp, bp
1:06A7  1f                pop      ds
1:06A8  5d                pop      bp
1:06A9  4d                dec      bp
1:06AA  cb                retf     
1:06AB  1e                push     ds
1:06AC  58                pop      ax
1:06AD  90                nop      
1:06AE  45                inc      bp
1:06AF  55                push     bp
1:06B0  8bec              mov      bp, sp
1:06B2  1e                push     ds
1:06B3  8ed8              mov      ds, ax
1:06B5  8b4606            mov      ax, word ptr [bp + 6]
1:06B8  a3a003            mov      word ptr [0x3a0], ax
1:06BB  8b4e08            mov      cx, word ptr [bp + 8]
1:06BE  890ea203          mov      word ptr [0x3a2], cx
1:06C2  3bc8              cmp      cx, ax
1:06C4  7d07              jge      0x6cd
1:06C6  890ea003          mov      word ptr [0x3a0], cx
1:06CA  a3a203            mov      word ptr [0x3a2], ax
1:06CD  8bc1              mov      ax, cx
1:06CF  2b4606            sub      ax, word ptr [bp + 6]
1:06D2  a39e03            mov      word ptr [0x39e], ax
1:06D5  0bc0              or       ax, ax
1:06D7  7505              jne      0x6de
1:06D9  8b4606            mov      ax, word ptr [bp + 6]
1:06DC  eb10              jmp      0x6ee
1:06DE  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_5(1:0984)
1:06E3  99                cdq      
1:06E4  f73e9e03          idiv     word ptr [0x39e]
1:06E8  8bc2              mov      ax, dx
1:06EA  0306a003          add      ax, word ptr [0x3a0]
1:06EE  4d                dec      bp
1:06EF  4d                dec      bp
1:06F0  8be5              mov      sp, bp
1:06F2  1f                pop      ds
1:06F3  5d                pop      bp
1:06F4  4d                dec      bp
1:06F5  cb                retf     

; ===== EXPORT:ord_15(#15) =====
1:06F6  1e                push     ds
1:06F7  58                pop      ax
1:06F8  90                nop      
1:06F9  45                inc      bp
1:06FA  55                push     bp
1:06FB  8bec              mov      bp, sp
1:06FD  1e                push     ds
1:06FE  8ed8              mov      ds, ax
1:0700  837e0a00          cmp      word ptr [bp + 0xa], 0
1:0704  7504              jne      0x70a
1:0706  2bc0              sub      ax, ax
1:0708  eb09              jmp      0x713
1:070A  8b460e            mov      ax, word ptr [bp + 0xe]
1:070D  a32805            mov      word ptr [0x528], ax
1:0710  b80100            mov      ax, 1
1:0713  4d                dec      bp
1:0714  4d                dec      bp
1:0715  8be5              mov      sp, bp
1:0717  1f                pop      ds
1:0718  5d                pop      bp
1:0719  4d                dec      bp
1:071A  ca0a00            retf     0xa

; ===== EXPORT:WEP(#2) =====
1:071D  1e                push     ds
1:071E  58                pop      ax
1:071F  90                nop      
1:0720  45                inc      bp
1:0721  55                push     bp
1:0722  8bec              mov      bp, sp
1:0724  1e                push     ds
1:0725  8ed8              mov      ds, ax
1:0727  b80100            mov      ax, 1
1:072A  4d                dec      bp
1:072B  4d                dec      bp
1:072C  8be5              mov      sp, bp
1:072E  1f                pop      ds
1:072F  5d                pop      bp
1:0730  4d                dec      bp
1:0731  ca0200            retf     2

; ===== EXPORT:MODULE(#1) =====
1:0734  1e                push     ds
1:0735  58                pop      ax
1:0736  90                nop      
1:0737  45                inc      bp
1:0738  55                push     bp
1:0739  8bec              mov      bp, sp
1:073B  1e                push     ds
1:073C  8ed8              mov      ds, ax
1:073E  83ec0a            sub      sp, 0xa
1:0741  56                push     si
1:0742  8b4608            mov      ax, word ptr [bp + 8]
1:0745  a3f003            mov      word ptr [0x3f0], ax
1:0748  8b4606            mov      ax, word ptr [bp + 6]
1:074B  a3e003            mov      word ptr [0x3e0], ax
1:074E  50                push     ax
1:074F  9a6f070000        lcall    0, 0x76f  ; @1:KERNEL.GlobalLock
1:0754  a3f603            mov      word ptr [0x3f6], ax
1:0757  8916f803          mov      word ptr [0x3f8], dx
1:075B  8bc2              mov      ax, dx
1:075D  0b06f603          or       ax, word ptr [0x3f6]
1:0761  7503              jne      0x766
1:0763  e96a01            jmp      0x8d0
1:0766  c41ef603          les      bx, ptr [0x3f6]
1:076A  26ff7720          push     word ptr es:[bx + 0x20]
1:076E  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalLock
1:0773  a33405            mov      word ptr [0x534], ax
1:0776  89163605          mov      word ptr [0x536], dx
1:077A  8bc2              mov      ax, dx
1:077C  0b063405          or       ax, word ptr [0x534]
1:0780  7503              jne      0x785
1:0782  e94201            jmp      0x8c7
1:0785  8b460a            mov      ax, word ptr [bp + 0xa]
1:0788  e90801            jmp      0x893
1:078B  c41ef603          les      bx, ptr [0x3f6]
1:078F  26837f1465        cmp      word ptr es:[bx + 0x14], 0x65
1:0794  7c0f              jl       0x7a5
1:0796  26817f36f400      cmp      word ptr es:[bx + 0x36], 0xf4
1:079C  7507              jne      0x7a5
1:079E  26837f3878        cmp      word ptr es:[bx + 0x38], 0x78
1:07A3  740e              je       0x7b3
1:07A5  c70636000000      mov      word ptr [0x36], 0
1:07AB  c746fc0500        mov      word ptr [bp - 4], 5
1:07B0  e90701            jmp      0x8ba
1:07B3  c70636000100      mov      word ptr [0x36], 1
1:07B9  e9fe00            jmp      0x8ba
1:07BC  b8a403            mov      ax, 0x3a4
1:07BF  50                push     ax
1:07C0  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_14(1:090E)
1:07C5  5b                pop      bx
1:07C6  ff36a403          push     word ptr [0x3a4]
1:07CA  9a0a010000        lcall    0, 0x10a  ; @1:INT:ord_4(1:0970)
1:07CF  5b                pop      bx
1:07D0  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_13(1:0014)
1:07D5  eb13              jmp      0x7ea
1:07D7  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:011A)
1:07DC  eb0c              jmp      0x7ea
1:07DE  833e360000        cmp      word ptr [0x36], 0
1:07E3  740b              je       0x7f0
1:07E5  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:015A)
1:07EA  8946fc            mov      word ptr [bp - 4], ax
1:07ED  e9ca00            jmp      0x8ba
1:07F0  ff36f003          push     word ptr [0x3f0]
1:07F4  b800ff            mov      ax, 0xff00
1:07F7  baff00            mov      dx, 0xff
1:07FA  52                push     dx
1:07FB  50                push     ax
1:07FC  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextColor
1:0801  ff36f003          push     word ptr [0x3f0]
1:0805  2bc0              sub      ax, ax
1:0807  50                push     ax
1:0808  50                push     ax
1:0809  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkColor
1:080E  ff36f003          push     word ptr [0x3f0]
1:0812  2bc0              sub      ax, ax
1:0814  50                push     ax
1:0815  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextAlign
1:081A  ff36f003          push     word ptr [0x3f0]
1:081E  b80100            mov      ax, 1
1:0821  50                push     ax
1:0822  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkMode
1:0827  ff36f003          push     word ptr [0x3f0]
1:082B  2bc0              sub      ax, ax
1:082D  50                push     ax
1:082E  50                push     ax
1:082F  b83800            mov      ax, 0x38
1:0832  1e                push     ds
1:0833  50                push     ax
1:0834  50                push     ax
1:0835  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:08F2)
1:083A  5b                pop      bx
1:083B  50                push     ax
1:083C  9affff0000        lcall    0, 0xffff  ; @1:GDI.TextOut
1:0841  eb77              jmp      0x8ba
1:0843  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:034E)
1:0848  eba0              jmp      0x7ea
1:084A  a12805            mov      ax, word ptr [0x528]
1:084D  c41e3405          les      bx, ptr [0x534]
1:0851  26894716          mov      word ptr es:[bx + 0x16], ax
1:0855  c746f60000        mov      word ptr [bp - 0xa], 0
1:085A  8b46f6            mov      ax, word ptr [bp - 0xa]
1:085D  8bf0              mov      si, ax
1:085F  d1e6              shl      si, 1
1:0861  40                inc      ax
1:0862  c41e3405          les      bx, ptr [0x534]
1:0866  2689400e          mov      word ptr es:[bx + si + 0xe], ax
1:086A  ff46f6            inc      word ptr [bp - 0xa]
1:086D  837ef604          cmp      word ptr [bp - 0xa], 4
1:0871  7ce7              jl       0x85a
1:0873  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:03CB)
1:0878  e96fff            jmp      0x7ea
1:087B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:03F4)
1:0880  e967ff            jmp      0x7ea
1:0883  8b460a            mov      ax, word ptr [bp + 0xa]
1:0886  2d0700            sub      ax, 7
1:0889  50                push     ax
1:088A  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_6(1:0408)
1:088F  5b                pop      bx
1:0890  e957ff            jmp      0x7ea
1:0893  3d0c00            cmp      ax, 0xc
1:0896  7722              ja       0x8ba
1:0898  d1e0              shl      ax, 1
1:089A  93                xchg     bx, ax
1:089B  2effa7a008        jmp      word ptr cs:[bx + 0x8a0]
1:08A0  bc07d7            mov      sp, 0xd707
1:08A3  07                pop      es
1:08A4  de07              fiadd    word ptr [bx]
1:08A6  43                inc      bx
1:08A7  08ba084a          or       byte ptr [bp + si + 0x4a08], bh
1:08AB  087b08            or       byte ptr [bp + di + 8], bh
1:08AE  830883            or       word ptr [bx + si], 0xff83
1:08B1  08830883          or       byte ptr [bp + di - 0x7cf8], al
1:08B5  08ba088b          or       byte ptr [bp + si - 0x74f8], bh
1:08B9  07                pop      es
1:08BA  c41ef603          les      bx, ptr [0x3f6]
1:08BE  26ff7720          push     word ptr es:[bx + 0x20]
1:08C2  9acc080000        lcall    0, 0x8cc  ; @1:KERNEL.GlobalUnlock
1:08C7  ff36e003          push     word ptr [0x3e0]
1:08CB  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalUnlock
1:08D0  8b46fc            mov      ax, word ptr [bp - 4]
1:08D3  5e                pop      si
1:08D4  4d                dec      bp
1:08D5  4d                dec      bp
1:08D6  8be5              mov      sp, bp
1:08D8  1f                pop      ds
1:08D9  5d                pop      bp
1:08DA  4d                dec      bp
1:08DB  ca0600            retf     6
1:08DE  0000              add      byte ptr [bx + si], al
1:08E0  0000              add      byte ptr [bx + si], al
1:08E2  0000              add      byte ptr [bx + si], al
1:08E4  0000              add      byte ptr [bx + si], al
1:08E6  0000              add      byte ptr [bx + si], al
1:08E8  0000              add      byte ptr [bx + si], al
1:08EA  0000              add      byte ptr [bx + si], al
1:08EC  0000              add      byte ptr [bx + si], al
1:08EE  0000              add      byte ptr [bx + si], al
1:08F0  c3                ret      
1:08F1  00558b            add      byte ptr [di - 0x75], dl
1:08F4  ec                in       al, dx
1:08F5  8bd7              mov      dx, di
1:08F7  8cd8              mov      ax, ds
1:08F9  8ec0              mov      es, ax
1:08FB  8b7e06            mov      di, word ptr [bp + 6]
1:08FE  33c0              xor      ax, ax
1:0900  b9ffff            mov      cx, 0xffff
1:0903  f2ae              repne scasb al, byte ptr es:[di]
1:0905  f7d1              not      cx
1:0907  49                dec      cx
1:0908  91                xchg     cx, ax
1:0909  8bfa              mov      di, dx
1:090B  5d                pop      bp
1:090C  cb                retf     
1:090D  008cd890          add      byte ptr [si - 0x6f28], cl
1:0911  45                inc      bp
1:0912  55                push     bp
1:0913  8bec              mov      bp, sp
1:0915  1e                push     ds
1:0916  8ed8              mov      ds, ax
1:0918  56                push     si
1:0919  b42a              mov      ah, 0x2a
1:091B  cd21              int      0x21
1:091D  8bda              mov      bx, dx
1:091F  8bf1              mov      si, cx
1:0921  b42c              mov      ah, 0x2c
1:0923  cd21              int      0x21
1:0925  b400              mov      ah, 0
1:0927  8ac6              mov      al, dh
1:0929  50                push     ax
1:092A  8ac1              mov      al, cl
1:092C  50                push     ax
1:092D  8ac5              mov      al, ch
1:092F  50                push     ax
1:0930  50                push     ax
1:0931  b42a              mov      ah, 0x2a
1:0933  cd21              int      0x21
1:0935  3bda              cmp      bx, dx
1:0937  58                pop      ax
1:0938  7408              je       0x942
1:093A  3c17              cmp      al, 0x17
1:093C  7504              jne      0x942
1:093E  8bd3              mov      dx, bx
1:0940  8bce              mov      cx, si
1:0942  b400              mov      ah, 0
1:0944  8ac2              mov      al, dl
1:0946  50                push     ax
1:0947  8ac6              mov      al, dh
1:0949  50                push     ax
1:094A  81e9bc07          sub      cx, 0x7bc
1:094E  51                push     cx
1:094F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_16(1:09B4)
1:0954  83c40c            add      sp, 0xc
1:0957  837e0600          cmp      word ptr [bp + 6], 0
1:095B  7408              je       0x965
1:095D  8b5e06            mov      bx, word ptr [bp + 6]
1:0960  895702            mov      word ptr [bx + 2], dx
1:0963  8907              mov      word ptr [bx], ax
1:0965  5e                pop      si
1:0966  83ed02            sub      bp, 2
1:0969  8be5              mov      sp, bp
1:096B  1f                pop      ds
1:096C  5d                pop      bp
1:096D  4d                dec      bp
1:096E  cb                retf     
1:096F  004555            add      byte ptr [di + 0x55], al
1:0972  8bec              mov      bp, sp
1:0974  8b4606            mov      ax, word ptr [bp + 6]
1:0977  a37200            mov      word ptr [0x72], ax
1:097A  c70674000000      mov      word ptr [0x74], 0
1:0980  5d                pop      bp
1:0981  4d                dec      bp
1:0982  cb                retf     
1:0983  90                nop      

; ===== EXPORT:ord_5(#5) =====
1:0984  45                inc      bp
1:0985  55                push     bp
1:0986  8bec              mov      bp, sp
1:0988  b8fd43            mov      ax, 0x43fd
1:098B  ba0300            mov      dx, 3
1:098E  52                push     dx
1:098F  50                push     ax
1:0990  ff367400          push     word ptr [0x74]