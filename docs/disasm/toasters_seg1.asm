File: raw\unpacked\MODULES\TOASTERS.AD
Module: 'TOASTERS' ('Graphics Module Library')
CS:IP=1:1664  SS:SP=0:0000  AutoDS=2  Heap=1024  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (3): KERNEL, GDI, USER
Segments (2):
  SEG  1: CODE off=0x006A0 len=0x1696 min=0x1696 flags=0x0D50 relocs=131
  SEG  2: DATA off=0x01F00 len=0x054C min=0x054C flags=0x0C71 relocs=0
Exports (28):
  ord   1: SEG1:0CC4 flags=0x03 MODULE
  ord   2: SEG1:0CAD flags=0x03 WEP
  ord   3: SEG1:1650 flags=0x03 ___EXPORTEDSTUB
  ord   4: SEG1:0F14 flags=0x00 
  ord   5: SEG1:0E9E flags=0x00 
  ord   6: SEG1:055E flags=0x00 
  ord   7: SEG1:0308 flags=0x00 
  ord   8: SEG1:02DF flags=0x00 
  ord   9: SEG1:021B flags=0x00 
  ord  10: SEG1:0E82 flags=0x00 
  ord  11: SEG1:0202 flags=0x00 
  ord  12: SEG1:01BC flags=0x00 
  ord  13: SEG1:0012 flags=0x00 
  ord  14: SEG1:0F00 flags=0x00 
  ord  15: SEG1:0C86 flags=0x00 
  ord  16: SEG1:0F44 flags=0x00 
  ord  17: SEG1:1048 flags=0x00 
  ord  18: SEG1:11BA flags=0x00 
  ord  19: SEG1:107A flags=0x00 
  ord  20: SEG1:12EC flags=0x00 
  ord  21: SEG1:1314 flags=0x00 
  ord  22: SEG1:13B6 flags=0x00 
  ord  23: SEG1:137A flags=0x00 
  ord  24: SEG1:13E0 flags=0x00 
  ord  25: SEG1:1318 flags=0x00 
  ord  26: SEG1:1094 flags=0x00 
  ord  27: SEG1:1584 flags=0x00 
  ord  28: SEG1:1640 flags=0x00 
Resources (20):
  RT_BITMAP        #1               off=0x02480 len=  2160
  RT_BITMAP        #2               off=0x02CF0 len=  2160
  RT_BITMAP        #3               off=0x03560 len=  2160
  RT_BITMAP        #4               off=0x03DD0 len=  2160
  RT_BITMAP        #5               off=0x04640 len=  2160
  RT_BITMAP        #6               off=0x04EB0 len=  2160
  RT_BITMAP        #7               off=0x05720 len=  2160
  RT_BITMAP        #8               off=0x05F90 len=   560
  RT_BITMAP        #9               off=0x061C0 len=   560
  RT_BITMAP        #10              off=0x063F0 len=   560
  RT_BITMAP        #11              off=0x06620 len=   560
  RT_BITMAP        #12              off=0x06850 len=   560
  TYPE_1000        #1               off=0x06A80 len=    64
  TYPE_1000        #2               off=0x06AC0 len=    96
  TYPE_1000        #3               off=0x06B20 len=    32
  TYPE_1000        #4               off=0x06B40 len=    32
  TYPE_2000        #10              off=0x06B60 len=    96
  TYPE_2000        #20              off=0x06BC0 len=    16
  TYPE_2000        #30              off=0x06BD0 len=   256
  TYPE_15          #1               off=0x06CD0 len=   192

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

; ===== EXPORT:ord_13(#13) =====
1:0012  1e                push     ds
1:0013  58                pop      ax
1:0014  90                nop      
1:0015  45                inc      bp
1:0016  55                push     bp
1:0017  8bec              mov      bp, sp
1:0019  1e                push     ds
1:001A  8ed8              mov      ds, ax
1:001C  c41e4805          les      bx, ptr [0x548]
1:0020  268b4706          mov      ax, word ptr es:[bx + 6]
1:0024  40                inc      ax
1:0025  a31000            mov      word ptr [0x10], ax
1:0028  268b4708          mov      ax, word ptr es:[bx + 8]
1:002C  3d6400            cmp      ax, 0x64
1:002F  7503              jne      0x34
1:0031  e9ae00            jmp      0xe2
1:0034  771a              ja       0x50
1:0036  0ac0              or       al, al
1:0038  7410              je       0x4a
1:003A  2c21              sub      al, 0x21
1:003C  7503              jne      0x41
1:003E  e99800            jmp      0xd9
1:0041  2c22              sub      al, 0x22
1:0043  7503              jne      0x48
1:0045  e99a00            jmp      0xe2
1:0048  eb06              jmp      0x50
1:004A  c70620000000      mov      word ptr [0x20], 0
1:0050  ff365204          push     word ptr [0x452]
1:0054  9a5a030000        lcall    0, 0x35a  ; @1:GDI.CreateCompatibleDC
1:0059  a37004            mov      word ptr [0x470], ax
1:005C  c41e6404          les      bx, ptr [0x464]
1:0060  26837f0a01        cmp      word ptr es:[bx + 0xa], 1
1:0065  7403              je       0x6a
1:0067  e98100            jmp      0xeb
1:006A  ff36cc04          push     word ptr [0x4cc]
1:006E  b82400            mov      ax, 0x24
1:0071  1e                push     ds
1:0072  50                push     ax
1:0073  9a85000000        lcall    0, 0x85  ; @1:USER.LoadBitmap
1:0078  a31200            mov      word ptr [0x12], ax
1:007B  ff36cc04          push     word ptr [0x4cc]
1:007F  b82d00            mov      ax, 0x2d
1:0082  1e                push     ds
1:0083  50                push     ax
1:0084  9a96000000        lcall    0, 0x96  ; @1:USER.LoadBitmap
1:0089  a31400            mov      word ptr [0x14], ax
1:008C  ff36cc04          push     word ptr [0x4cc]
1:0090  b83600            mov      ax, 0x36
1:0093  1e                push     ds
1:0094  50                push     ax
1:0095  9aa7000000        lcall    0, 0xa7  ; @1:USER.LoadBitmap
1:009A  a31600            mov      word ptr [0x16], ax
1:009D  ff36cc04          push     word ptr [0x4cc]
1:00A1  b83f00            mov      ax, 0x3f
1:00A4  1e                push     ds
1:00A5  50                push     ax
1:00A6  9ab8000000        lcall    0, 0xb8  ; @1:USER.LoadBitmap
1:00AB  a31800            mov      word ptr [0x18], ax
1:00AE  ff36cc04          push     word ptr [0x4cc]
1:00B2  b84800            mov      ax, 0x48
1:00B5  1e                push     ds
1:00B6  50                push     ax
1:00B7  9ac9000000        lcall    0, 0xc9  ; @1:USER.LoadBitmap
1:00BC  a31a00            mov      word ptr [0x1a], ax
1:00BF  ff36cc04          push     word ptr [0x4cc]
1:00C3  b85100            mov      ax, 0x51
1:00C6  1e                push     ds
1:00C7  50                push     ax
1:00C8  9af5000000        lcall    0, 0xf5  ; @1:USER.LoadBitmap
1:00CD  a31c00            mov      word ptr [0x1c], ax
1:00D0  ff36cc04          push     word ptr [0x4cc]
1:00D4  b85a00            mov      ax, 0x5a
1:00D7  eb7f              jmp      0x158
1:00D9  c70620000100      mov      word ptr [0x20], 1
1:00DF  e96eff            jmp      0x50
1:00E2  c70620000200      mov      word ptr [0x20], 2
1:00E8  e965ff            jmp      0x50
1:00EB  ff36cc04          push     word ptr [0x4cc]
1:00EF  b86300            mov      ax, 0x63
1:00F2  1e                push     ds
1:00F3  50                push     ax
1:00F4  9a06010000        lcall    0, 0x106  ; @1:USER.LoadBitmap
1:00F9  a31200            mov      word ptr [0x12], ax
1:00FC  ff36cc04          push     word ptr [0x4cc]
1:0100  b86b00            mov      ax, 0x6b
1:0103  1e                push     ds
1:0104  50                push     ax
1:0105  9a17010000        lcall    0, 0x117  ; @1:USER.LoadBitmap
1:010A  a31400            mov      word ptr [0x14], ax
1:010D  ff36cc04          push     word ptr [0x4cc]
1:0111  b87300            mov      ax, 0x73
1:0114  1e                push     ds
1:0115  50                push     ax
1:0116  9a28010000        lcall    0, 0x128  ; @1:USER.LoadBitmap
1:011B  a31600            mov      word ptr [0x16], ax
1:011E  ff36cc04          push     word ptr [0x4cc]
1:0122  b87c00            mov      ax, 0x7c
1:0125  1e                push     ds
1:0126  50                push     ax
1:0127  9a39010000        lcall    0, 0x139  ; @1:USER.LoadBitmap
1:012C  a31800            mov      word ptr [0x18], ax
1:012F  ff36cc04          push     word ptr [0x4cc]
1:0133  b88400            mov      ax, 0x84
1:0136  1e                push     ds
1:0137  50                push     ax
1:0138  9a4a010000        lcall    0, 0x14a  ; @1:USER.LoadBitmap
1:013D  a31a00            mov      word ptr [0x1a], ax
1:0140  ff36cc04          push     word ptr [0x4cc]
1:0144  b88d00            mov      ax, 0x8d
1:0147  1e                push     ds
1:0148  50                push     ax
1:0149  9a5b010000        lcall    0, 0x15b  ; @1:USER.LoadBitmap
1:014E  a31c00            mov      word ptr [0x1c], ax
1:0151  ff36cc04          push     word ptr [0x4cc]
1:0155  b89600            mov      ax, 0x96
1:0158  1e                push     ds
1:0159  50                push     ax
1:015A  9a76030000        lcall    0, 0x376  ; @1:USER.LoadBitmap
1:015F  a31e00            mov      word ptr [0x1e], ax
1:0162  c70600040100      mov      word ptr [0x400], 1
1:0168  eb1a              jmp      0x184
1:016A  8bd8              mov      bx, ax
1:016C  d1e3              shl      bx, 1
1:016E  2bc0              sub      ax, ax
1:0170  89879004          mov      word ptr [bx + 0x490], ax
1:0174  89870c05          mov      word ptr [bx + 0x50c], ax
1:0178  8987ae04          mov      word ptr [bx + 0x4ae], ax
1:017C  89872a05          mov      word ptr [bx + 0x52a], ax
1:0180  ff060004          inc      word ptr [0x400]
1:0184  a10004            mov      ax, word ptr [0x400]
1:0187  39061000          cmp      word ptr [0x10], ax
1:018B  7fdd              jg       0x16a
1:018D  c70600040100      mov      word ptr [0x400], 1
1:0193  eb04              jmp      0x199
1:0195  ff060004          inc      word ptr [0x400]
1:0199  a10004            mov      ax, word ptr [0x400]
1:019C  39061000          cmp      word ptr [0x10], ax
1:01A0  7e10              jle      0x1b2
1:01A2  50                push     ax
1:01A3  0e                push     cs
1:01A4  e83f08            call     0x9e6
1:01A7  5b                pop      bx
1:01A8  0bc0              or       ax, ax
1:01AA  75e9              jne      0x195
1:01AC  a10004            mov      ax, word ptr [0x400]
1:01AF  a31000            mov      word ptr [0x10], ax
1:01B2  2bc0              sub      ax, ax
1:01B4  4d                dec      bp
1:01B5  4d                dec      bp
1:01B6  8be5              mov      sp, bp
1:01B8  1f                pop      ds
1:01B9  5d                pop      bp
1:01BA  4d                dec      bp
1:01BB  cb                retf     

; ===== EXPORT:ord_12(#12) =====
1:01BC  1e                push     ds
1:01BD  58                pop      ax
1:01BE  90                nop      
1:01BF  45                inc      bp
1:01C0  55                push     bp
1:01C1  8bec              mov      bp, sp
1:01C3  1e                push     ds
1:01C4  8ed8              mov      ds, ax
1:01C6  b80204            mov      ax, 0x402
1:01C9  1e                push     ds
1:01CA  50                push     ax
1:01CB  2bc0              sub      ax, ax
1:01CD  50                push     ax
1:01CE  50                push     ax
1:01CF  c41e4805          les      bx, ptr [0x548]
1:01D3  26ff7702          push     word ptr es:[bx + 2]
1:01D7  26ff7704          push     word ptr es:[bx + 4]
1:01DB  9a43030000        lcall    0, 0x343  ; @1:USER.SetRect
1:01E0  ff365204          push     word ptr [0x452]
1:01E4  b80204            mov      ax, 0x402
1:01E7  1e                push     ds
1:01E8  50                push     ax
1:01E9  b80400            mov      ax, 4
1:01EC  50                push     ax
1:01ED  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:01F2  50                push     ax
1:01F3  9affff0000        lcall    0, 0xffff  ; @1:USER.FillRect
1:01F8  2bc0              sub      ax, ax
1:01FA  4d                dec      bp
1:01FB  4d                dec      bp
1:01FC  8be5              mov      sp, bp
1:01FE  1f                pop      ds
1:01FF  5d                pop      bp
1:0200  4d                dec      bp
1:0201  cb                retf     

; ===== EXPORT:ord_11(#11) =====
1:0202  1e                push     ds
1:0203  58                pop      ax
1:0204  90                nop      
1:0205  45                inc      bp
1:0206  55                push     bp
1:0207  8bec              mov      bp, sp
1:0209  1e                push     ds
1:020A  8ed8              mov      ds, ax
1:020C  83ec04            sub      sp, 4
1:020F  0e                push     cs
1:0210  e8b603            call     0x5c9
1:0213  4d                dec      bp
1:0214  4d                dec      bp
1:0215  8be5              mov      sp, bp
1:0217  1f                pop      ds
1:0218  5d                pop      bp
1:0219  4d                dec      bp
1:021A  cb                retf     

; ===== EXPORT:ord_9(#9) =====
1:021B  1e                push     ds
1:021C  58                pop      ax
1:021D  90                nop      
1:021E  45                inc      bp
1:021F  55                push     bp
1:0220  8bec              mov      bp, sp
1:0222  1e                push     ds
1:0223  8ed8              mov      ds, ax
1:0225  833e700400        cmp      word ptr [0x470], 0
1:022A  740f              je       0x23b
1:022C  ff367004          push     word ptr [0x470]
1:0230  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteDC
1:0235  c70670040000      mov      word ptr [0x470], 0
1:023B  833e120000        cmp      word ptr [0x12], 0
1:0240  740f              je       0x251
1:0242  ff361200          push     word ptr [0x12]
1:0246  9a5d020000        lcall    0, 0x25d  ; @1:GDI.DeleteObject
1:024B  c70612000000      mov      word ptr [0x12], 0
1:0251  833e140000        cmp      word ptr [0x14], 0
1:0256  740f              je       0x267
1:0258  ff361400          push     word ptr [0x14]
1:025C  9a73020000        lcall    0, 0x273  ; @1:GDI.DeleteObject
1:0261  c70614000000      mov      word ptr [0x14], 0
1:0267  833e160000        cmp      word ptr [0x16], 0
1:026C  740f              je       0x27d
1:026E  ff361600          push     word ptr [0x16]
1:0272  9a89020000        lcall    0, 0x289  ; @1:GDI.DeleteObject
1:0277  c70616000000      mov      word ptr [0x16], 0
1:027D  833e180000        cmp      word ptr [0x18], 0
1:0282  740f              je       0x293
1:0284  ff361800          push     word ptr [0x18]
1:0288  9a9f020000        lcall    0, 0x29f  ; @1:GDI.DeleteObject
1:028D  c70618000000      mov      word ptr [0x18], 0
1:0293  833e1a0000        cmp      word ptr [0x1a], 0
1:0298  740f              je       0x2a9
1:029A  ff361a00          push     word ptr [0x1a]
1:029E  9ab5020000        lcall    0, 0x2b5  ; @1:GDI.DeleteObject
1:02A3  c7061a000000      mov      word ptr [0x1a], 0
1:02A9  833e1c0000        cmp      word ptr [0x1c], 0
1:02AE  740f              je       0x2bf
1:02B0  ff361c00          push     word ptr [0x1c]
1:02B4  9acb020000        lcall    0, 0x2cb  ; @1:GDI.DeleteObject
1:02B9  c7061c000000      mov      word ptr [0x1c], 0
1:02BF  833e1e0000        cmp      word ptr [0x1e], 0
1:02C4  740f              je       0x2d5
1:02C6  ff361e00          push     word ptr [0x1e]
1:02CA  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteObject
1:02CF  c7061e000000      mov      word ptr [0x1e], 0
1:02D5  2bc0              sub      ax, ax
1:02D7  4d                dec      bp
1:02D8  4d                dec      bp
1:02D9  8be5              mov      sp, bp
1:02DB  1f                pop      ds
1:02DC  5d                pop      bp
1:02DD  4d                dec      bp
1:02DE  cb                retf     

; ===== EXPORT:ord_8(#8) =====
1:02DF  1e                push     ds
1:02E0  58                pop      ax
1:02E1  90                nop      
1:02E2  45                inc      bp
1:02E3  55                push     bp
1:02E4  8bec              mov      bp, sp
1:02E6  1e                push     ds
1:02E7  8ed8              mov      ds, ax
1:02E9  c41e6404          les      bx, ptr [0x464]
1:02ED  26837f0a01        cmp      word ptr es:[bx + 0xa], 1
1:02F2  750a              jne      0x2fe
1:02F4  c41e4805          les      bx, ptr [0x548]
1:02F8  26c747100000      mov      word ptr es:[bx + 0x10], 0
1:02FE  2bc0              sub      ax, ax
1:0300  4d                dec      bp
1:0301  4d                dec      bp
1:0302  8be5              mov      sp, bp
1:0304  1f                pop      ds
1:0305  5d                pop      bp
1:0306  4d                dec      bp
1:0307  cb                retf     

; ===== EXPORT:ord_7(#7) =====
1:0308  1e                push     ds
1:0309  58                pop      ax
1:030A  90                nop      
1:030B  45                inc      bp
1:030C  55                push     bp
1:030D  8bec              mov      bp, sp
1:030F  1e                push     ds
1:0310  8ed8              mov      ds, ax
1:0312  83ec20            sub      sp, 0x20
1:0315  c41e4805          les      bx, ptr [0x548]
1:0319  268b4702          mov      ax, word ptr es:[bx + 2]
1:031D  99                cdq      
1:031E  2bc2              sub      ax, dx
1:0320  d1f8              sar      ax, 1
1:0322  2d2000            sub      ax, 0x20
1:0325  a36804            mov      word ptr [0x468], ax
1:0328  c7066a048c00      mov      word ptr [0x46a], 0x8c
1:032E  b80a04            mov      ax, 0x40a
1:0331  1e                push     ds
1:0332  50                push     ax
1:0333  b80100            mov      ax, 1
1:0336  50                push     ax
1:0337  2bc9              sub      cx, cx
1:0339  51                push     cx
1:033A  26ff7702          push     word ptr es:[bx + 2]
1:033E  26ff7704          push     word ptr es:[bx + 4]
1:0342  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:0347  ff365204          push     word ptr [0x452]
1:034B  b80a04            mov      ax, 0x40a
1:034E  1e                push     ds
1:034F  50                push     ax
1:0350  9affff0000        lcall    0, 0xffff  ; @1:USER.InvertRect
1:0355  ff365204          push     word ptr [0x452]
1:0359  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateCompatibleDC
1:035E  a37004            mov      word ptr [0x470], ax
1:0361  c41e6404          les      bx, ptr [0x464]
1:0365  26837f0a01        cmp      word ptr es:[bx + 0xa], 1
1:036A  753c              jne      0x3a8
1:036C  ff36cc04          push     word ptr [0x4cc]
1:0370  b89f00            mov      ax, 0x9f
1:0373  1e                push     ds
1:0374  50                push     ax
1:0375  9a87030000        lcall    0, 0x387  ; @1:USER.LoadBitmap
1:037A  a31200            mov      word ptr [0x12], ax
1:037D  ff36cc04          push     word ptr [0x4cc]
1:0381  b8a800            mov      ax, 0xa8
1:0384  1e                push     ds
1:0385  50                push     ax
1:0386  9a98030000        lcall    0, 0x398  ; @1:USER.LoadBitmap
1:038B  a31400            mov      word ptr [0x14], ax
1:038E  ff36cc04          push     word ptr [0x4cc]
1:0392  b8b100            mov      ax, 0xb1
1:0395  1e                push     ds
1:0396  50                push     ax
1:0397  9affff0000        lcall    0, 0xffff  ; @1:USER.LoadBitmap
1:039C  a31600            mov      word ptr [0x16], ax
1:039F  ff36cc04          push     word ptr [0x4cc]
1:03A3  b8ba00            mov      ax, 0xba
1:03A6  eb3a              jmp      0x3e2
1:03A8  ff36cc04          push     word ptr [0x4cc]
1:03AC  b8c300            mov      ax, 0xc3
1:03AF  1e                push     ds
1:03B0  50                push     ax
1:03B1  9ac3030000        lcall    0, 0x3c3  ; @1:USER.LoadBitmap
1:03B6  a31200            mov      word ptr [0x12], ax
1:03B9  ff36cc04          push     word ptr [0x4cc]
1:03BD  b8cb00            mov      ax, 0xcb
1:03C0  1e                push     ds
1:03C1  50                push     ax
1:03C2  9ad4030000        lcall    0, 0x3d4  ; @1:USER.LoadBitmap
1:03C7  a31400            mov      word ptr [0x14], ax
1:03CA  ff36cc04          push     word ptr [0x4cc]
1:03CE  b8d300            mov      ax, 0xd3
1:03D1  1e                push     ds
1:03D2  50                push     ax
1:03D3  9ae5030000        lcall    0, 0x3e5  ; @1:USER.LoadBitmap
1:03D8  a31600            mov      word ptr [0x16], ax
1:03DB  ff36cc04          push     word ptr [0x4cc]
1:03DF  b8dc00            mov      ax, 0xdc
1:03E2  1e                push     ds
1:03E3  50                push     ax
1:03E4  9a74000000        lcall    0, 0x74  ; @1:USER.LoadBitmap
1:03E9  a31800            mov      word ptr [0x18], ax
1:03EC  c7066e040000      mov      word ptr [0x46e], 0
1:03F2  ff361200          push     word ptr [0x12]
1:03F6  b81000            mov      ax, 0x10
1:03F9  50                push     ax
1:03FA  b85404            mov      ax, 0x454
1:03FD  1e                push     ds
1:03FE  50                push     ax
1:03FF  9aed050000        lcall    0, 0x5ed  ; @1:GDI.GetObject
1:0404  ff367004          push     word ptr [0x470]
1:0408  ff361800          push     word ptr [0x18]
1:040C  9a7a060000        lcall    0, 0x67a  ; @1:GDI.SelectObject
1:0411  ff365204          push     word ptr [0x452]
1:0415  ff366804          push     word ptr [0x468]
1:0419  ff366a04          push     word ptr [0x46a]
1:041D  ff365604          push     word ptr [0x456]
1:0421  ff365804          push     word ptr [0x458]
1:0425  ff367004          push     word ptr [0x470]
1:0429  2bc0              sub      ax, ax
1:042B  50                push     ax
1:042C  50                push     ax
1:042D  b92000            mov      cx, 0x20
1:0430  bacc00            mov      dx, 0xcc
1:0433  52                push     dx
1:0434  51                push     cx
1:0435  9aa8060000        lcall    0, 0x6a8  ; @1:GDI.BitBlt
1:043A  b85000            mov      ax, 0x50
1:043D  99                cdq      
1:043E  52                push     dx
1:043F  50                push     ax
1:0440  0e                push     cs
1:0441  e83e07            call     0xb82
1:0444  5b                pop      bx
1:0445  5b                pop      bx
1:0446  0e                push     cs
1:0447  e81608            call     0xc60
1:044A  051400            add      ax, 0x14
1:044D  83d200            adc      dx, 0
1:0450  8946f6            mov      word ptr [bp - 0xa], ax
1:0453  8956f8            mov      word ptr [bp - 8], dx
1:0456  0e                push     cs
1:0457  e80608            call     0xc60
1:045A  050100            add      ax, 1
1:045D  83d200            adc      dx, 0
1:0460  8946fa            mov      word ptr [bp - 6], ax
1:0463  8956fc            mov      word ptr [bp - 4], dx
1:0466  c70662040000      mov      word ptr [0x462], 0
1:046C  eb41              jmp      0x4af
1:046E  0e                push     cs
1:046F  e8ee07            call     0xc60
1:0472  8946e0            mov      word ptr [bp - 0x20], ax
1:0475  8956e2            mov      word ptr [bp - 0x1e], dx
1:0478  3b56fc            cmp      dx, word ptr [bp - 4]
1:047B  721c              jb       0x499
1:047D  7705              ja       0x484
1:047F  3b46fa            cmp      ax, word ptr [bp - 6]
1:0482  7615              jbe      0x499
1:0484  b80100            mov      ax, 1
1:0487  50                push     ax
1:0488  9affff0000        lcall    0, 0xffff  ; @1:USER.GetKeyState
1:048D  0bc0              or       ax, ax
1:048F  7d08              jge      0x499
1:0491  c70662040100      mov      word ptr [0x462], 1
1:0497  eb2d              jmp      0x4c6
1:0499  0e                push     cs
1:049A  e82007            call     0xbbd
1:049D  8b46f6            mov      ax, word ptr [bp - 0xa]
1:04A0  8b56f8            mov      dx, word ptr [bp - 8]
1:04A3  3956e2            cmp      word ptr [bp - 0x1e], dx
1:04A6  7207              jb       0x4af
1:04A8  771c              ja       0x4c6
1:04AA  3946e0            cmp      word ptr [bp - 0x20], ax
1:04AD  7717              ja       0x4c6
1:04AF  8d46e4            lea      ax, [bp - 0x1c]
1:04B2  16                push     ss
1:04B3  50                push     ax
1:04B4  2bc0              sub      ax, ax
1:04B6  50                push     ax
1:04B7  50                push     ax
1:04B8  50                push     ax
1:04B9  b80100            mov      ax, 1
1:04BC  50                push     ax
1:04BD  9affff0000        lcall    0, 0xffff  ; @1:USER.PeekMessage
1:04C2  0bc0              or       ax, ax
1:04C4  75a8              jne      0x46e
1:04C6  833e700400        cmp      word ptr [0x470], 0
1:04CB  740f              je       0x4dc
1:04CD  ff367004          push     word ptr [0x470]
1:04D1  9a31020000        lcall    0, 0x231  ; @1:GDI.DeleteDC
1:04D6  c70670040000      mov      word ptr [0x470], 0
1:04DC  833e120000        cmp      word ptr [0x12], 0
1:04E1  740f              je       0x4f2
1:04E3  ff361200          push     word ptr [0x12]
1:04E7  9afe040000        lcall    0, 0x4fe  ; @1:GDI.DeleteObject
1:04EC  c70612000000      mov      word ptr [0x12], 0
1:04F2  833e140000        cmp      word ptr [0x14], 0
1:04F7  740f              je       0x508
1:04F9  ff361400          push     word ptr [0x14]
1:04FD  9a14050000        lcall    0, 0x514  ; @1:GDI.DeleteObject
1:0502  c70614000000      mov      word ptr [0x14], 0
1:0508  833e160000        cmp      word ptr [0x16], 0
1:050D  740f              je       0x51e
1:050F  ff361600          push     word ptr [0x16]
1:0513  9a2a050000        lcall    0, 0x52a  ; @1:GDI.DeleteObject
1:0518  c70616000000      mov      word ptr [0x16], 0
1:051E  833e180000        cmp      word ptr [0x18], 0
1:0523  740f              je       0x534
1:0525  ff361800          push     word ptr [0x18]
1:0529  9a47020000        lcall    0, 0x247  ; @1:GDI.DeleteObject
1:052E  c70618000000      mov      word ptr [0x18], 0
1:0534  833e620400        cmp      word ptr [0x462], 0
1:0539  7419              je       0x554
1:053B  9affff0000        lcall    0, 0xffff  ; @1:USER.GetCapture
1:0540  50                push     ax
1:0541  b80102            mov      ax, 0x201
1:0544  50                push     ax
1:0545  2bc0              sub      ax, ax
1:0547  50                push     ax
1:0548  b80300            mov      ax, 3
1:054B  8bd0              mov      dx, ax
1:054D  52                push     dx
1:054E  50                push     ax
1:054F  9affff0000        lcall    0, 0xffff  ; @1:USER.PostMessage
1:0554  2bc0              sub      ax, ax
1:0556  4d                dec      bp
1:0557  4d                dec      bp
1:0558  8be5              mov      sp, bp
1:055A  1f                pop      ds
1:055B  5d                pop      bp
1:055C  4d                dec      bp
1:055D  cb                retf     

; ===== EXPORT:ord_6(#6) =====
1:055E  1e                push     ds
1:055F  58                pop      ax
1:0560  90                nop      
1:0561  45                inc      bp
1:0562  55                push     bp
1:0563  8bec              mov      bp, sp
1:0565  1e                push     ds
1:0566  8ed8              mov      ds, ax
1:0568  c41e6404          les      bx, ptr [0x464]
1:056C  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:0571  7404              je       0x577
1:0573  2bc0              sub      ax, ax
1:0575  eb4a              jmp      0x5c1
1:0577  8b4606            mov      ax, word ptr [bp + 6]
1:057A  0bc0              or       ax, ax
1:057C  7405              je       0x583
1:057E  48                dec      ax
1:057F  740b              je       0x58c
1:0581  ebf0              jmp      0x573
1:0583  0e                push     cs
1:0584  e894fc            call     0x21b
1:0587  b80300            mov      ax, 3
1:058A  eb35              jmp      0x5c1
1:058C  c41e4805          les      bx, ptr [0x548]
1:0590  268b4708          mov      ax, word ptr es:[bx + 8]
1:0594  3d6400            cmp      ax, 0x64
1:0597  7420              je       0x5b9
1:0599  77d8              ja       0x573
1:059B  0ac0              or       al, al
1:059D  740a              je       0x5a9
1:059F  2c21              sub      al, 0x21
1:05A1  740e              je       0x5b1
1:05A3  2c22              sub      al, 0x22
1:05A5  7412              je       0x5b9
1:05A7  ebca              jmp      0x573
1:05A9  c70620000000      mov      word ptr [0x20], 0
1:05AF  ebc2              jmp      0x573
1:05B1  c70620000100      mov      word ptr [0x20], 1
1:05B7  ebba              jmp      0x573
1:05B9  c70620000200      mov      word ptr [0x20], 2
1:05BF  ebb2              jmp      0x573
1:05C1  4d                dec      bp
1:05C2  4d                dec      bp
1:05C3  8be5              mov      sp, bp
1:05C5  1f                pop      ds
1:05C6  5d                pop      bp
1:05C7  4d                dec      bp
1:05C8  cb                retf     
1:05C9  1e                push     ds
1:05CA  58                pop      ax
1:05CB  90                nop      
1:05CC  45                inc      bp
1:05CD  55                push     bp
1:05CE  8bec              mov      bp, sp
1:05D0  1e                push     ds
1:05D1  8ed8              mov      ds, ax
1:05D3  83ec10            sub      sp, 0x10
1:05D6  56                push     si
1:05D7  c746f00100        mov      word ptr [bp - 0x10], 1
1:05DC  e96303            jmp      0x942
1:05DF  ff361200          push     word ptr [0x12]
1:05E3  b81000            mov      ax, 0x10
1:05E6  50                push     ax
1:05E7  b85404            mov      ax, 0x454
1:05EA  1e                push     ds
1:05EB  50                push     ax
1:05EC  9a09060000        lcall    0, 0x609  ; @1:GDI.GetObject
1:05F1  ff367004          push     word ptr [0x470]
1:05F5  ff361200          push     word ptr [0x12]
1:05F9  eb7e              jmp      0x679
1:05FB  ff361400          push     word ptr [0x14]
1:05FF  b81000            mov      ax, 0x10
1:0602  50                push     ax
1:0603  b85404            mov      ax, 0x454
1:0606  1e                push     ds
1:0607  50                push     ax
1:0608  9a25060000        lcall    0, 0x625  ; @1:GDI.GetObject
1:060D  ff367004          push     word ptr [0x470]
1:0611  ff361400          push     word ptr [0x14]
1:0615  eb62              jmp      0x679
1:0617  ff361600          push     word ptr [0x16]
1:061B  b81000            mov      ax, 0x10
1:061E  50                push     ax
1:061F  b85404            mov      ax, 0x454
1:0622  1e                push     ds
1:0623  50                push     ax
1:0624  9a41060000        lcall    0, 0x641  ; @1:GDI.GetObject
1:0629  ff367004          push     word ptr [0x470]
1:062D  ff361600          push     word ptr [0x16]
1:0631  eb46              jmp      0x679
1:0633  ff361800          push     word ptr [0x18]
1:0637  b81000            mov      ax, 0x10
1:063A  50                push     ax
1:063B  b85404            mov      ax, 0x454
1:063E  1e                push     ds
1:063F  50                push     ax
1:0640  9a6d060000        lcall    0, 0x66d  ; @1:GDI.GetObject
1:0645  ff367004          push     word ptr [0x470]
1:0649  ff361800          push     word ptr [0x18]
1:064D  eb2a              jmp      0x679
1:064F  a12000            mov      ax, word ptr [0x20]
1:0652  0bc0              or       ax, ax
1:0654  7409              je       0x65f
1:0656  48                dec      ax
1:0657  7455              je       0x6ae
1:0659  48                dec      ax
1:065A  746e              je       0x6ca
1:065C  e9ae00            jmp      0x70d
1:065F  ff361a00          push     word ptr [0x1a]
1:0663  b81000            mov      ax, 0x10
1:0666  50                push     ax
1:0667  b85404            mov      ax, 0x454
1:066A  1e                push     ds
1:066B  50                push     ax
1:066C  9abc060000        lcall    0, 0x6bc  ; @1:GDI.GetObject
1:0671  ff367004          push     word ptr [0x470]
1:0675  ff361a00          push     word ptr [0x1a]
1:0679  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectObject
1:067E  ff365204          push     word ptr [0x452]
1:0682  8b5ef0            mov      bx, word ptr [bp - 0x10]
1:0685  d1e3              shl      bx, 1
1:0687  ffb70c05          push     word ptr [bx + 0x50c]
1:068B  ffb72a05          push     word ptr [bx + 0x52a]
1:068F  ff365604          push     word ptr [0x456]
1:0693  ff365804          push     word ptr [0x458]
1:0697  ff367004          push     word ptr [0x470]
1:069B  2bc0              sub      ax, ax
1:069D  50                push     ax
1:069E  50                push     ax
1:069F  b82000            mov      ax, 0x20
1:06A2  bacc00            mov      dx, 0xcc
1:06A5  52                push     dx
1:06A6  50                push     ax
1:06A7  9affff0000        lcall    0, 0xffff  ; @1:GDI.BitBlt
1:06AC  eb5f              jmp      0x70d
1:06AE  ff361c00          push     word ptr [0x1c]
1:06B2  b81000            mov      ax, 0x10
1:06B5  50                push     ax
1:06B6  b85404            mov      ax, 0x454
1:06B9  1e                push     ds
1:06BA  50                push     ax
1:06BB  9ad8060000        lcall    0, 0x6d8  ; @1:GDI.GetObject
1:06C0  ff367004          push     word ptr [0x470]
1:06C4  ff361c00          push     word ptr [0x1c]
1:06C8  ebaf              jmp      0x679
1:06CA  ff361e00          push     word ptr [0x1e]
1:06CE  b81000            mov      ax, 0x10
1:06D1  50                push     ax
1:06D2  b85404            mov      ax, 0x454
1:06D5  1e                push     ds
1:06D6  50                push     ax
1:06D7  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetObject
1:06DC  ff367004          push     word ptr [0x470]
1:06E0  ff361e00          push     word ptr [0x1e]
1:06E4  eb93              jmp      0x679
1:06E6  3d0c00            cmp      ax, 0xc
1:06E9  7722              ja       0x70d
1:06EB  d1e0              shl      ax, 1
1:06ED  93                xchg     bx, ax
1:06EE  2effa7f306        jmp      word ptr cs:[bx + 0x6f3]
1:06F3  df05              fild     word ptr [di]
1:06F5  df05              fild     word ptr [di]
1:06F7  fb                sti      
1:06F8  05fb05            add      ax, 0x5fb
1:06FB  17                pop      ss
1:06FC  06                push     es
1:06FD  17                pop      ss
1:06FE  06                push     es
1:06FF  33063306          xor      ax, word ptr [0x633]
1:0703  17                pop      ss
1:0704  06                push     es
1:0705  17                pop      ss
1:0706  06                push     es
1:0707  fb                sti      
1:0708  05fb05            add      ax, 0x5fb
1:070B  4f                dec      di
1:070C  06                push     es
1:070D  8b5ef0            mov      bx, word ptr [bp - 0x10]
1:0710  d1e3              shl      bx, 1
1:0712  8b870c05          mov      ax, word ptr [bx + 0x50c]
1:0716  89879004          mov      word ptr [bx + 0x490], ax
1:071A  8b872a05          mov      ax, word ptr [bx + 0x52a]
1:071E  8987ae04          mov      word ptr [bx + 0x4ae], ax
1:0722  83bf72040c        cmp      word ptr [bx + 0x472], 0xc
1:0727  7446              je       0x76f
1:0729  8bf3              mov      si, bx
1:072B  9a36070000        lcall    0, 0x736  ; @1:INT:ord_4(1:0F14)
1:0730  3d2602            cmp      ax, 0x226
1:0733  7d3a              jge      0x76f
1:0735  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_4(1:0F14)
1:073A  b90300            mov      cx, 3
1:073D  99                cdq      
1:073E  f7f9              idiv     cx
1:0740  0194ee04          add      word ptr [si + 0x4ee], dx
1:0744  398cee04          cmp      word ptr [si + 0x4ee], cx
1:0748  7e04              jle      0x74e
1:074A  898cee04          mov      word ptr [si + 0x4ee], cx
1:074E  8b5ef0            mov      bx, word ptr [bp - 0x10]
1:0751  d1e3              shl      bx, 1
1:0753  83bfee0401        cmp      word ptr [bx + 0x4ee], 1
1:0758  7d06              jge      0x760
1:075A  c787ee040100      mov      word ptr [bx + 0x4ee], 1
1:0760  8b5ef0            mov      bx, word ptr [bp - 0x10]
1:0763  d1e3              shl      bx, 1
1:0765  8b87ee04          mov      ax, word ptr [bx + 0x4ee]
1:0769  d1e0              shl      ax, 1
1:076B  8987d004          mov      word ptr [bx + 0x4d0], ax
1:076F  8b5ef0            mov      bx, word ptr [bp - 0x10]
1:0772  d1e3              shl      bx, 1
1:0774  8b87d004          mov      ax, word ptr [bx + 0x4d0]
1:0778  29870c05          sub      word ptr [bx + 0x50c], ax
1:077C  83bf0c05b0        cmp      word ptr [bx + 0x50c], -0x50
1:0781  7f4c              jg       0x7cf
1:0783  8d46f2            lea      ax, [bp - 0xe]
1:0786  16                push     ss
1:0787  50                push     ax
1:0788  ffb70c05          push     word ptr [bx + 0x50c]
1:078C  ffb72a05          push     word ptr [bx + 0x52a]
1:0790  8b870c05          mov      ax, word ptr [bx + 0x50c]
1:0794  054000            add      ax, 0x40
1:0797  50                push     ax
1:0798  8b872a05          mov      ax, word ptr [bx + 0x52a]
1:079C  054000            add      ax, 0x40
1:079F  50                push     ax
1:07A0  9a12080000        lcall    0, 0x812  ; @1:USER.SetRect
1:07A5  ff365204          push     word ptr [0x452]
1:07A9  8d46f2            lea      ax, [bp - 0xe]
1:07AC  16                push     ss
1:07AD  50                push     ax
1:07AE  b80400            mov      ax, 4
1:07B1  50                push     ax
1:07B2  9a24080000        lcall    0, 0x824  ; @1:GDI.GetStockObject
1:07B7  50                push     ax
1:07B8  9a2a080000        lcall    0, 0x82a  ; @1:USER.FillRect
1:07BD  ff76f0            push     word ptr [bp - 0x10]
1:07C0  0e                push     cs
1:07C1  e82202            call     0x9e6
1:07C4  5b                pop      bx
1:07C5  0bc0              or       ax, ax
1:07C7  7506              jne      0x7cf
1:07C9  b80100            mov      ax, 1
1:07CC  e90e02            jmp      0x9dd
1:07CF  8b5ef0            mov      bx, word ptr [bp - 0x10]
1:07D2  d1e3              shl      bx, 1
1:07D4  8b872a05          mov      ax, word ptr [bx + 0x52a]
1:07D8  8946fa            mov      word ptr [bp - 6], ax
1:07DB  8b87ee04          mov      ax, word ptr [bx + 0x4ee]
1:07DF  01872a05          add      word ptr [bx + 0x52a], ax
1:07E3  c4364805          les      si, ptr [0x548]
1:07E7  268b4404          mov      ax, word ptr es:[si + 4]
1:07EB  053200            add      ax, 0x32
1:07EE  3b872a05          cmp      ax, word ptr [bx + 0x52a]
1:07F2  7f42              jg       0x836
1:07F4  8d46f2            lea      ax, [bp - 0xe]
1:07F7  16                push     ss
1:07F8  50                push     ax
1:07F9  ffb70c05          push     word ptr [bx + 0x50c]
1:07FD  ffb72a05          push     word ptr [bx + 0x52a]
1:0801  8b870c05          mov      ax, word ptr [bx + 0x50c]
1:0805  054000            add      ax, 0x40
1:0808  50                push     ax
1:0809  8b872a05          mov      ax, word ptr [bx + 0x52a]
1:080D  054000            add      ax, 0x40
1:0810  50                push     ax
1:0811  9a7d090000        lcall    0, 0x97d  ; @1:USER.SetRect
1:0816  ff365204          push     word ptr [0x452]
1:081A  8d46f2            lea      ax, [bp - 0xe]
1:081D  16                push     ss
1:081E  50                push     ax
1:081F  b80400            mov      ax, 4
1:0822  50                push     ax
1:0823  9a8f090000        lcall    0, 0x98f  ; @1:GDI.GetStockObject
1:0828  50                push     ax
1:0829  9a95090000        lcall    0, 0x995  ; @1:USER.FillRect
1:082E  ff76f0            push     word ptr [bp - 0x10]
1:0831  0e                push     cs
1:0832  e8b101            call     0x9e6
1:0835  5b                pop      bx
1:0836  ff76f0            push     word ptr [bp - 0x10]
1:0839  0e                push     cs
1:083A  e8a902            call     0xae6
1:083D  5b                pop      bx
1:083E  0bc0              or       ax, ax
1:0840  7548              jne      0x88a
1:0842  8b5ef0            mov      bx, word ptr [bp - 0x10]
1:0845  d1e3              shl      bx, 1
1:0847  8b87d004          mov      ax, word ptr [bx + 0x4d0]
1:084B  01870c05          add      word ptr [bx + 0x50c], ax
1:084F  8b46fa            mov      ax, word ptr [bp - 6]
1:0852  89872a05          mov      word ptr [bx + 0x52a], ax
1:0856  83bfee0401        cmp      word ptr [bx + 0x4ee], 1
1:085B  7e0e              jle      0x86b
1:085D  ff8fee04          dec      word ptr [bx + 0x4ee]
1:0861  8b87ee04          mov      ax, word ptr [bx + 0x4ee]
1:0865  d1e0              shl      ax, 1
1:0867  8987d004          mov      word ptr [bx + 0x4d0], ax
1:086B  8b5ef0            mov      bx, word ptr [bp - 0x10]
1:086E  d1e3              shl      bx, 1
1:0870  83872a0503        add      word ptr [bx + 0x52a], 3
1:0875  ff76f0            push     word ptr [bp - 0x10]
1:0878  8bf3              mov      si, bx
1:087A  0e                push     cs
1:087B  e86802            call     0xae6
1:087E  5b                pop      bx
1:087F  0bc0              or       ax, ax
1:0881  7507              jne      0x88a
1:0883  8b46fa            mov      ax, word ptr [bp - 6]
1:0886  89842a05          mov      word ptr [si + 0x52a], ax
1:088A  8b5ef0            mov      bx, word ptr [bp - 0x10]
1:088D  d1e3              shl      bx, 1
1:088F  83bf72040c        cmp      word ptr [bx + 0x472], 0xc
1:0894  7474              je       0x90a
1:0896  8b870c05          mov      ax, word ptr [bx + 0x50c]
1:089A  8946fc            mov      word ptr [bp - 4], ax
1:089D  8b872a05          mov      ax, word ptr [bx + 0x52a]
1:08A1  8946fa            mov      word ptr [bp - 6], ax
1:08A4  8b87ee04          mov      ax, word ptr [bx + 0x4ee]
1:08A8  d1e0              shl      ax, 1
1:08AA  01872a05          add      word ptr [bx + 0x52a], ax
1:08AE  8b87d004          mov      ax, word ptr [bx + 0x4d0]
1:08B2  d1e0              shl      ax, 1
1:08B4  29870c05          sub      word ptr [bx + 0x50c], ax
1:08B8  ff76f0            push     word ptr [bp - 0x10]
1:08BB  8bf3              mov      si, bx
1:08BD  0e                push     cs
1:08BE  e82502            call     0xae6
1:08C1  5b                pop      bx
1:08C2  0bc0              or       ax, ax
1:08C4  7531              jne      0x8f7
1:08C6  8b46fc            mov      ax, word ptr [bp - 4]
1:08C9  89840c05          mov      word ptr [si + 0x50c], ax
1:08CD  8b4efa            mov      cx, word ptr [bp - 6]
1:08D0  898c2a05          mov      word ptr [si + 0x52a], cx
1:08D4  83c103            add      cx, 3
1:08D7  898c2a05          mov      word ptr [si + 0x52a], cx
1:08DB  ff76f0            push     word ptr [bp - 0x10]
1:08DE  0e                push     cs
1:08DF  e80402            call     0xae6
1:08E2  5b                pop      bx
1:08E3  0bc0              or       ax, ax
1:08E5  7523              jne      0x90a
1:08E7  8b46fa            mov      ax, word ptr [bp - 6]
1:08EA  89842a05          mov      word ptr [si + 0x52a], ax
1:08EE  8b46fc            mov      ax, word ptr [bp - 4]
1:08F1  89840c05          mov      word ptr [si + 0x50c], ax
1:08F5  eb13              jmp      0x90a
1:08F7  8b46fc            mov      ax, word ptr [bp - 4]
1:08FA  8b5ef0            mov      bx, word ptr [bp - 0x10]
1:08FD  d1e3              shl      bx, 1
1:08FF  89870c05          mov      word ptr [bx + 0x50c], ax
1:0903  8b46fa            mov      ax, word ptr [bp - 6]
1:0906  89872a05          mov      word ptr [bx + 0x52a], ax
1:090A  8b5ef0            mov      bx, word ptr [bp - 0x10]
1:090D  d1e3              shl      bx, 1
1:090F  83bf72040c        cmp      word ptr [bx + 0x472], 0xc
1:0914  7d29              jge      0x93f
1:0916  83bfd00404        cmp      word ptr [bx + 0x4d0], 4
1:091B  7e07              jle      0x924
1:091D  8387720402        add      word ptr [bx + 0x472], 2
1:0922  eb09              jmp      0x92d
1:0924  8b5ef0            mov      bx, word ptr [bp - 0x10]
1:0927  d1e3              shl      bx, 1
1:0929  ff877204          inc      word ptr [bx + 0x472]
1:092D  8b5ef0            mov      bx, word ptr [bp - 0x10]
1:0930  d1e3              shl      bx, 1
1:0932  83bf72040b        cmp      word ptr [bx + 0x472], 0xb
1:0937  7e06              jle      0x93f
1:0939  c78772040000      mov      word ptr [bx + 0x472], 0
1:093F  ff46f0            inc      word ptr [bp - 0x10]
1:0942  8b46f0            mov      ax, word ptr [bp - 0x10]
1:0945  39061000          cmp      word ptr [0x10], ax
1:0949  7f03              jg       0x94e
1:094B  e98d00            jmp      0x9db
1:094E  8bd8              mov      bx, ax
1:0950  d1e3              shl      bx, 1
1:0952  83bf72040c        cmp      word ptr [bx + 0x472], 0xc
1:0957  7d76              jge      0x9cf
1:0959  8d46f2            lea      ax, [bp - 0xe]
1:095C  16                push     ss
1:095D  50                push     ax
1:095E  8b870c05          mov      ax, word ptr [bx + 0x50c]
1:0962  054000            add      ax, 0x40
1:0965  50                push     ax
1:0966  ffb7ae04          push     word ptr [bx + 0x4ae]
1:096A  8b879004          mov      ax, word ptr [bx + 0x490]
1:096E  054000            add      ax, 0x40
1:0971  50                push     ax
1:0972  8b87ae04          mov      ax, word ptr [bx + 0x4ae]
1:0976  054000            add      ax, 0x40
1:0979  50                push     ax
1:097A  8bf3              mov      si, bx
1:097C  9ab3090000        lcall    0, 0x9b3  ; @1:USER.SetRect
1:0981  ff365204          push     word ptr [0x452]
1:0985  8d46f2            lea      ax, [bp - 0xe]
1:0988  16                push     ss
1:0989  50                push     ax
1:098A  b80400            mov      ax, 4
1:098D  50                push     ax
1:098E  9ac5090000        lcall    0, 0x9c5  ; @1:GDI.GetStockObject
1:0993  50                push     ax
1:0994  9acb090000        lcall    0, 0x9cb  ; @1:USER.FillRect
1:0999  8d46f2            lea      ax, [bp - 0xe]
1:099C  16                push     ss
1:099D  50                push     ax
1:099E  ffb49004          push     word ptr [si + 0x490]
1:09A2  ffb4ae04          push     word ptr [si + 0x4ae]
1:09A6  8b849004          mov      ax, word ptr [si + 0x490]
1:09AA  054000            add      ax, 0x40
1:09AD  50                push     ax
1:09AE  ffb42a05          push     word ptr [si + 0x52a]
1:09B2  9adc010000        lcall    0, 0x1dc  ; @1:USER.SetRect
1:09B7  ff365204          push     word ptr [0x452]
1:09BB  8d46f2            lea      ax, [bp - 0xe]
1:09BE  16                push     ss
1:09BF  50                push     ax
1:09C0  b80400            mov      ax, 4
1:09C3  50                push     ax
1:09C4  9aee010000        lcall    0, 0x1ee  ; @1:GDI.GetStockObject
1:09C9  50                push     ax
1:09CA  9af4010000        lcall    0, 0x1f4  ; @1:USER.FillRect
1:09CF  8b5ef0            mov      bx, word ptr [bp - 0x10]
1:09D2  d1e3              shl      bx, 1
1:09D4  8b877204          mov      ax, word ptr [bx + 0x472]
1:09D8  e90bfd            jmp      0x6e6
1:09DB  2bc0              sub      ax, ax
1:09DD  5e                pop      si
1:09DE  4d                dec      bp
1:09DF  4d                dec      bp
1:09E0  8be5              mov      sp, bp
1:09E2  1f                pop      ds
1:09E3  5d                pop      bp
1:09E4  4d                dec      bp
1:09E5  cb                retf     
1:09E6  1e                push     ds
1:09E7  58                pop      ax
1:09E8  90                nop      
1:09E9  45                inc      bp
1:09EA  55                push     bp
1:09EB  8bec              mov      bp, sp
1:09ED  1e                push     ds
1:09EE  8ed8              mov      ds, ax
1:09F0  56                push     si
1:09F1  c70612040000      mov      word ptr [0x412], 0
1:09F7  ff061204          inc      word ptr [0x412]
1:09FB  833e120464        cmp      word ptr [0x412], 0x64
1:0A00  7e05              jle      0xa07
1:0A02  2bc0              sub      ax, ax
1:0A04  e9d600            jmp      0xadd
1:0A07  9a300a0000        lcall    0, 0xa30  ; @1:INT:ord_4(1:0F14)
1:0A0C  b96400            mov      cx, 0x64
1:0A0F  99                cdq      
1:0A10  f7f9              idiv     cx
1:0A12  83fa32            cmp      dx, 0x32
1:0A15  7d32              jge      0xa49
1:0A17  c41e4805          les      bx, ptr [0x548]
1:0A1B  268b4702          mov      ax, word ptr es:[bx + 2]
1:0A1F  051400            add      ax, 0x14
1:0A22  8b7606            mov      si, word ptr [bp + 6]
1:0A25  d1e6              shl      si, 1
1:0A27  89849004          mov      word ptr [si + 0x490], ax
1:0A2B  89840c05          mov      word ptr [si + 0x50c], ax
1:0A2F  9a4a0a0000        lcall    0, 0xa4a  ; @1:INT:ord_4(1:0F14)
1:0A34  c41e4805          les      bx, ptr [0x548]
1:0A38  99                cdq      
1:0A39  26f77f04          idiv     word ptr es:[bx + 4]
1:0A3D  8994ae04          mov      word ptr [si + 0x4ae], dx
1:0A41  8bc2              mov      ax, dx
1:0A43  89842a05          mov      word ptr [si + 0x52a], ax
1:0A47  eb2b              jmp      0xa74
1:0A49  9a840a0000        lcall    0, 0xa84  ; @1:INT:ord_4(1:0F14)
1:0A4E  c41e4805          les      bx, ptr [0x548]
1:0A52  99                cdq      
1:0A53  26f77f02          idiv     word ptr es:[bx + 2]
1:0A57  83c214            add      dx, 0x14
1:0A5A  8b5e06            mov      bx, word ptr [bp + 6]
1:0A5D  d1e3              shl      bx, 1
1:0A5F  89979004          mov      word ptr [bx + 0x490], dx
1:0A63  8bc2              mov      ax, dx
1:0A65  89870c05          mov      word ptr [bx + 0x50c], ax
1:0A69  b8c4ff            mov      ax, 0xffc4
1:0A6C  8987ae04          mov      word ptr [bx + 0x4ae], ax
1:0A70  89872a05          mov      word ptr [bx + 0x52a], ax
1:0A74  ff7606            push     word ptr [bp + 6]
1:0A77  0e                push     cs
1:0A78  e86b00            call     0xae6
1:0A7B  5b                pop      bx
1:0A7C  0bc0              or       ax, ax
1:0A7E  7503              jne      0xa83
1:0A80  e974ff            jmp      0x9f7
1:0A83  9a940a0000        lcall    0, 0xa94  ; @1:INT:ord_4(1:0F14)
1:0A88  b96400            mov      cx, 0x64
1:0A8B  99                cdq      
1:0A8C  f7f9              idiv     cx
1:0A8E  83fa46            cmp      dx, 0x46
1:0A91  7d30              jge      0xac3
1:0A93  9ab30a0000        lcall    0, 0xab3  ; @1:INT:ord_4(1:0F14)
1:0A98  b90300            mov      cx, 3
1:0A9B  99                cdq      
1:0A9C  f7f9              idiv     cx
1:0A9E  42                inc      dx
1:0A9F  8b5e06            mov      bx, word ptr [bp + 6]
1:0AA2  d1e3              shl      bx, 1
1:0AA4  8997ee04          mov      word ptr [bx + 0x4ee], dx
1:0AA8  8bc2              mov      ax, dx
1:0AAA  d1e0              shl      ax, 1
1:0AAC  8987d004          mov      word ptr [bx + 0x4d0], ax
1:0AB0  8bf3              mov      si, bx
1:0AB2  9a2c070000        lcall    0, 0x72c  ; @1:INT:ord_4(1:0F14)
1:0AB7  b90c00            mov      cx, 0xc
1:0ABA  99                cdq      
1:0ABB  f7f9              idiv     cx
1:0ABD  89947204          mov      word ptr [si + 0x472], dx
1:0AC1  eb17              jmp      0xada
1:0AC3  8b5e06            mov      bx, word ptr [bp + 6]
1:0AC6  d1e3              shl      bx, 1
1:0AC8  c787ee040100      mov      word ptr [bx + 0x4ee], 1
1:0ACE  c787d0040200      mov      word ptr [bx + 0x4d0], 2
1:0AD4  c78772040c00      mov      word ptr [bx + 0x472], 0xc
1:0ADA  b80100            mov      ax, 1
1:0ADD  5e                pop      si
1:0ADE  4d                dec      bp
1:0ADF  4d                dec      bp
1:0AE0  8be5              mov      sp, bp
1:0AE2  1f                pop      ds
1:0AE3  5d                pop      bp
1:0AE4  4d                dec      bp
1:0AE5  cb                retf     
1:0AE6  1e                push     ds
1:0AE7  58                pop      ax
1:0AE8  90                nop      
1:0AE9  45                inc      bp
1:0AEA  55                push     bp
1:0AEB  8bec              mov      bp, sp
1:0AED  1e                push     ds
1:0AEE  8ed8              mov      ds, ax
1:0AF0  83ec1c            sub      sp, 0x1c
1:0AF3  8d46e6            lea      ax, [bp - 0x1a]
1:0AF6  16                push     ss
1:0AF7  50                push     ax
1:0AF8  8b5e06            mov      bx, word ptr [bp + 6]
1:0AFB  d1e3              shl      bx, 1
1:0AFD  ffb70c05          push     word ptr [bx + 0x50c]
1:0B01  ffb72a05          push     word ptr [bx + 0x52a]
1:0B05  8b870c05          mov      ax, word ptr [bx + 0x50c]
1:0B09  054000            add      ax, 0x40
1:0B0C  50                push     ax
1:0B0D  8b872a05          mov      ax, word ptr [bx + 0x52a]
1:0B11  054000            add      ax, 0x40
1:0B14  50                push     ax
1:0B15  9a4f0b0000        lcall    0, 0xb4f  ; @1:USER.SetRect
1:0B1A  c746e40100        mov      word ptr [bp - 0x1c], 1
1:0B1F  eb03              jmp      0xb24
1:0B21  ff46e4            inc      word ptr [bp - 0x1c]
1:0B24  8b46e4            mov      ax, word ptr [bp - 0x1c]
1:0B27  39061000          cmp      word ptr [0x10], ax
1:0B2B  7e4a              jle      0xb77
1:0B2D  8d4eee            lea      cx, [bp - 0x12]
1:0B30  16                push     ss
1:0B31  51                push     cx
1:0B32  8bd8              mov      bx, ax
1:0B34  d1e3              shl      bx, 1
1:0B36  ffb70c05          push     word ptr [bx + 0x50c]
1:0B3A  ffb72a05          push     word ptr [bx + 0x52a]
1:0B3E  8b8f0c05          mov      cx, word ptr [bx + 0x50c]
1:0B42  83c140            add      cx, 0x40
1:0B45  51                push     cx
1:0B46  8b8f2a05          mov      cx, word ptr [bx + 0x52a]
1:0B4A  83c140            add      cx, 0x40
1:0B4D  51                push     cx
1:0B4E  9aa1070000        lcall    0, 0x7a1  ; @1:USER.SetRect
1:0B53  8b46e4            mov      ax, word ptr [bp - 0x1c]
1:0B56  394606            cmp      word ptr [bp + 6], ax
1:0B59  74c6              je       0xb21
1:0B5B  8d46f6            lea      ax, [bp - 0xa]
1:0B5E  16                push     ss
1:0B5F  50                push     ax
1:0B60  8d46e6            lea      ax, [bp - 0x1a]
1:0B63  16                push     ss
1:0B64  50                push     ax
1:0B65  8d46ee            lea      ax, [bp - 0x12]
1:0B68  16                push     ss
1:0B69  50                push     ax
1:0B6A  9affff0000        lcall    0, 0xffff  ; @1:USER.IntersectRect
1:0B6F  0bc0              or       ax, ax
1:0B71  74ae              je       0xb21
1:0B73  2bc0              sub      ax, ax
1:0B75  eb03              jmp      0xb7a
1:0B77  b80100            mov      ax, 1
1:0B7A  4d                dec      bp
1:0B7B  4d                dec      bp
1:0B7C  8be5              mov      sp, bp
1:0B7E  1f                pop      ds
1:0B7F  5d                pop      bp
1:0B80  4d                dec      bp
1:0B81  cb                retf     
1:0B82  1e                push     ds
1:0B83  58                pop      ax
1:0B84  90                nop      
1:0B85  45                inc      bp
1:0B86  55                push     bp
1:0B87  8bec              mov      bp, sp
1:0B89  1e                push     ds
1:0B8A  8ed8              mov      ds, ax
1:0B8C  83ec06            sub      sp, 6
1:0B8F  9a9b0b0000        lcall    0, 0xb9b  ; @1:USER.GetCurrentTime
1:0B94  8946fa            mov      word ptr [bp - 6], ax
1:0B97  8956fc            mov      word ptr [bp - 4], dx
1:0B9A  9affff0000        lcall    0, 0xffff  ; @1:USER.GetCurrentTime
1:0B9F  8b4efa            mov      cx, word ptr [bp - 6]
1:0BA2  8b5efc            mov      bx, word ptr [bp - 4]
1:0BA5  034e06            add      cx, word ptr [bp + 6]
1:0BA8  135e08            adc      bx, word ptr [bp + 8]
1:0BAB  3bda              cmp      bx, dx
1:0BAD  77eb              ja       0xb9a
1:0BAF  7204              jb       0xbb5
1:0BB1  3bc8              cmp      cx, ax
1:0BB3  73e5              jae      0xb9a
1:0BB5  4d                dec      bp
1:0BB6  4d                dec      bp
1:0BB7  8be5              mov      sp, bp
1:0BB9  1f                pop      ds
1:0BBA  5d                pop      bp
1:0BBB  4d                dec      bp
1:0BBC  cb                retf     
1:0BBD  1e                push     ds
1:0BBE  58                pop      ax
1:0BBF  90                nop      
1:0BC0  45                inc      bp
1:0BC1  55                push     bp
1:0BC2  8bec              mov      bp, sp
1:0BC4  1e                push     ds
1:0BC5  8ed8              mov      ds, ax
1:0BC7  a16e04            mov      ax, word ptr [0x46e]
1:0BCA  eb62              jmp      0xc2e
1:0BCC  ff367004          push     word ptr [0x470]
1:0BD0  ff361200          push     word ptr [0x12]
1:0BD4  eb12              jmp      0xbe8
1:0BD6  ff367004          push     word ptr [0x470]
1:0BDA  ff361400          push     word ptr [0x14]
1:0BDE  eb08              jmp      0xbe8
1:0BE0  ff367004          push     word ptr [0x470]
1:0BE4  ff361600          push     word ptr [0x16]
1:0BE8  9a0d040000        lcall    0, 0x40d  ; @1:GDI.SelectObject
1:0BED  ff365204          push     word ptr [0x452]
1:0BF1  ff366804          push     word ptr [0x468]
1:0BF5  ff366a04          push     word ptr [0x46a]
1:0BF9  ff365604          push     word ptr [0x456]
1:0BFD  ff365804          push     word ptr [0x458]
1:0C01  ff367004          push     word ptr [0x470]
1:0C05  2bc0              sub      ax, ax
1:0C07  50                push     ax
1:0C08  50                push     ax
1:0C09  b82000            mov      ax, 0x20
1:0C0C  bacc00            mov      dx, 0xcc
1:0C0F  52                push     dx
1:0C10  50                push     ax
1:0C11  9a36040000        lcall    0, 0x436  ; @1:GDI.BitBlt
1:0C16  b85000            mov      ax, 0x50
1:0C19  99                cdq      
1:0C1A  52                push     dx
1:0C1B  50                push     ax
1:0C1C  0e                push     cs
1:0C1D  e862ff            call     0xb82
1:0C20  5b                pop      bx
1:0C21  5b                pop      bx
1:0C22  eb23              jmp      0xc47
1:0C24  ff367004          push     word ptr [0x470]
1:0C28  ff361800          push     word ptr [0x18]
1:0C2C  ebba              jmp      0xbe8
1:0C2E  3d0500            cmp      ax, 5
1:0C31  7714              ja       0xc47
1:0C33  d1e0              shl      ax, 1
1:0C35  93                xchg     bx, ax
1:0C36  2effa73b0c        jmp      word ptr cs:[bx + 0xc3b]
1:0C3B  e00b              loopne   0xc48
1:0C3D  d6                salc     
1:0C3E  0bcc              or       cx, sp
1:0C40  0bd6              or       dx, si
1:0C42  0be0              or       sp, ax
1:0C44  0b24              or       sp, word ptr [si]
1:0C46  0cff              or       al, 0xff
1:0C48  06                push     es
1:0C49  6e                outsb    dx, byte ptr [si]
1:0C4A  0483              add      al, 0x83
1:0C4C  3e6e              outsb    dx, byte ptr ds:[si]
1:0C4E  0405              add      al, 5
1:0C50  7e06              jle      0xc58
1:0C52  c7066e040000      mov      word ptr [0x46e], 0
1:0C58  4d                dec      bp
1:0C59  4d                dec      bp
1:0C5A  8be5              mov      sp, bp
1:0C5C  1f                pop      ds
1:0C5D  5d                pop      bp
1:0C5E  4d                dec      bp
1:0C5F  cb                retf     
1:0C60  1e                push     ds
1:0C61  58                pop      ax
1:0C62  90                nop      
1:0C63  45                inc      bp
1:0C64  55                push     bp
1:0C65  8bec              mov      bp, sp
1:0C67  1e                push     ds
1:0C68  8ed8              mov      ds, ax
1:0C6A  83ec06            sub      sp, 6
1:0C6D  b81404            mov      ax, 0x414
1:0C70  50                push     ax
1:0C71  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_5(1:0E9E)
1:0C76  5b                pop      bx
1:0C77  a11404            mov      ax, word ptr [0x414]
1:0C7A  8b161604          mov      dx, word ptr [0x416]
1:0C7E  4d                dec      bp
1:0C7F  4d                dec      bp
1:0C80  8be5              mov      sp, bp
1:0C82  1f                pop      ds
1:0C83  5d                pop      bp
1:0C84  4d                dec      bp
1:0C85  cb                retf     

; ===== EXPORT:ord_15(#15) =====
1:0C86  1e                push     ds
1:0C87  58                pop      ax
1:0C88  90                nop      
1:0C89  45                inc      bp
1:0C8A  55                push     bp
1:0C8B  8bec              mov      bp, sp
1:0C8D  1e                push     ds
1:0C8E  8ed8              mov      ds, ax
1:0C90  837e0a00          cmp      word ptr [bp + 0xa], 0
1:0C94  7504              jne      0xc9a
1:0C96  2bc0              sub      ax, ax
1:0C98  eb09              jmp      0xca3
1:0C9A  8b460e            mov      ax, word ptr [bp + 0xe]
1:0C9D  a3cc04            mov      word ptr [0x4cc], ax
1:0CA0  b80100            mov      ax, 1
1:0CA3  4d                dec      bp
1:0CA4  4d                dec      bp
1:0CA5  8be5              mov      sp, bp
1:0CA7  1f                pop      ds
1:0CA8  5d                pop      bp
1:0CA9  4d                dec      bp
1:0CAA  ca0a00            retf     0xa

; ===== EXPORT:WEP(#2) =====
1:0CAD  1e                push     ds
1:0CAE  58                pop      ax
1:0CAF  90                nop      
1:0CB0  45                inc      bp
1:0CB1  55                push     bp
1:0CB2  8bec              mov      bp, sp
1:0CB4  1e                push     ds
1:0CB5  8ed8              mov      ds, ax
1:0CB7  b80100            mov      ax, 1
1:0CBA  4d                dec      bp
1:0CBB  4d                dec      bp
1:0CBC  8be5              mov      sp, bp
1:0CBE  1f                pop      ds
1:0CBF  5d                pop      bp
1:0CC0  4d                dec      bp
1:0CC1  ca0200            retf     2

; ===== EXPORT:MODULE(#1) =====
1:0CC4  1e                push     ds
1:0CC5  58                pop      ax
1:0CC6  90                nop      
1:0CC7  45                inc      bp
1:0CC8  55                push     bp
1:0CC9  8bec              mov      bp, sp
1:0CCB  1e                push     ds
1:0CCC  8ed8              mov      ds, ax
1:0CCE  83ec0a            sub      sp, 0xa
1:0CD1  56                push     si
1:0CD2  8b4608            mov      ax, word ptr [bp + 8]
1:0CD5  a35204            mov      word ptr [0x452], ax
1:0CD8  8b4606            mov      ax, word ptr [bp + 6]
1:0CDB  a35004            mov      word ptr [0x450], ax
1:0CDE  50                push     ax
1:0CDF  9aff0c0000        lcall    0, 0xcff  ; @1:KERNEL.GlobalLock
1:0CE4  a36404            mov      word ptr [0x464], ax
1:0CE7  89166604          mov      word ptr [0x466], dx
1:0CEB  8bc2              mov      ax, dx
1:0CED  0b066404          or       ax, word ptr [0x464]
1:0CF1  7503              jne      0xcf6
1:0CF3  e96a01            jmp      0xe60
1:0CF6  c41e6404          les      bx, ptr [0x464]
1:0CFA  26ff7720          push     word ptr es:[bx + 0x20]
1:0CFE  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalLock
1:0D03  a34805            mov      word ptr [0x548], ax
1:0D06  89164a05          mov      word ptr [0x54a], dx
1:0D0A  8bc2              mov      ax, dx
1:0D0C  0b064805          or       ax, word ptr [0x548]
1:0D10  7503              jne      0xd15
1:0D12  e94201            jmp      0xe57
1:0D15  8b460a            mov      ax, word ptr [bp + 0xa]
1:0D18  e90801            jmp      0xe23
1:0D1B  c41e6404          les      bx, ptr [0x464]
1:0D1F  26837f1465        cmp      word ptr es:[bx + 0x14], 0x65
1:0D24  7c0f              jl       0xd35
1:0D26  26817f36f400      cmp      word ptr es:[bx + 0x36], 0xf4
1:0D2C  7507              jne      0xd35
1:0D2E  26837f3878        cmp      word ptr es:[bx + 0x38], 0x78
1:0D33  740e              je       0xd43
1:0D35  c706e4000000      mov      word ptr [0xe4], 0
1:0D3B  c746fc0500        mov      word ptr [bp - 4], 5
1:0D40  e90701            jmp      0xe4a
1:0D43  c706e4000100      mov      word ptr [0xe4], 1
1:0D49  e9fe00            jmp      0xe4a
1:0D4C  b81804            mov      ax, 0x418
1:0D4F  50                push     ax
1:0D50  9a720c0000        lcall    0, 0xc72  ; @1:INT:ord_5(1:0E9E)
1:0D55  5b                pop      bx
1:0D56  ff361804          push     word ptr [0x418]
1:0D5A  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_14(1:0F00)
1:0D5F  5b                pop      bx
1:0D60  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_13(1:0012)
1:0D65  eb13              jmp      0xd7a
1:0D67  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:01BC)
1:0D6C  eb0c              jmp      0xd7a
1:0D6E  833ee40000        cmp      word ptr [0xe4], 0
1:0D73  740b              je       0xd80
1:0D75  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:0202)
1:0D7A  8946fc            mov      word ptr [bp - 4], ax
1:0D7D  e9ca00            jmp      0xe4a
1:0D80  ff365204          push     word ptr [0x452]
1:0D84  b800ff            mov      ax, 0xff00
1:0D87  baff00            mov      dx, 0xff
1:0D8A  52                push     dx
1:0D8B  50                push     ax
1:0D8C  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextColor
1:0D91  ff365204          push     word ptr [0x452]
1:0D95  2bc0              sub      ax, ax
1:0D97  50                push     ax
1:0D98  50                push     ax
1:0D99  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkColor
1:0D9E  ff365204          push     word ptr [0x452]
1:0DA2  2bc0              sub      ax, ax
1:0DA4  50                push     ax
1:0DA5  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextAlign
1:0DAA  ff365204          push     word ptr [0x452]
1:0DAE  b80100            mov      ax, 1
1:0DB1  50                push     ax
1:0DB2  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkMode
1:0DB7  ff365204          push     word ptr [0x452]
1:0DBB  2bc0              sub      ax, ax
1:0DBD  50                push     ax
1:0DBE  50                push     ax
1:0DBF  b8e600            mov      ax, 0xe6
1:0DC2  1e                push     ds
1:0DC3  50                push     ax
1:0DC4  50                push     ax
1:0DC5  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:0E82)
1:0DCA  5b                pop      bx
1:0DCB  50                push     ax
1:0DCC  9affff0000        lcall    0, 0xffff  ; @1:GDI.TextOut
1:0DD1  eb77              jmp      0xe4a
1:0DD3  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:021B)
1:0DD8  eba0              jmp      0xd7a
1:0DDA  a1cc04            mov      ax, word ptr [0x4cc]
1:0DDD  c41e4805          les      bx, ptr [0x548]
1:0DE1  26894716          mov      word ptr es:[bx + 0x16], ax
1:0DE5  c746f60000        mov      word ptr [bp - 0xa], 0
1:0DEA  8b46f6            mov      ax, word ptr [bp - 0xa]
1:0DED  8bf0              mov      si, ax
1:0DEF  d1e6              shl      si, 1
1:0DF1  40                inc      ax
1:0DF2  c41e4805          les      bx, ptr [0x548]
1:0DF6  2689400e          mov      word ptr es:[bx + si + 0xe], ax
1:0DFA  ff46f6            inc      word ptr [bp - 0xa]
1:0DFD  837ef604          cmp      word ptr [bp - 0xa], 4
1:0E01  7ce7              jl       0xdea
1:0E03  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:02DF)
1:0E08  e96fff            jmp      0xd7a
1:0E0B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:0308)
1:0E10  e967ff            jmp      0xd7a
1:0E13  8b460a            mov      ax, word ptr [bp + 0xa]
1:0E16  2d0700            sub      ax, 7
1:0E19  50                push     ax
1:0E1A  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_6(1:055E)
1:0E1F  5b                pop      bx
1:0E20  e957ff            jmp      0xd7a
1:0E23  3d0c00            cmp      ax, 0xc
1:0E26  7722              ja       0xe4a
1:0E28  d1e0              shl      ax, 1
1:0E2A  93                xchg     bx, ax
1:0E2B  2effa7300e        jmp      word ptr cs:[bx + 0xe30]
1:0E30  4c                dec      sp
1:0E31  0d670d            or       ax, 0xd67
1:0E34  6e                outsb    dx, byte ptr [si]
1:0E35  0dd30d            or       ax, 0xdd3
1:0E38  4a                dec      dx
1:0E39  0e                push     cs
1:0E3A  da0d              fimul    dword ptr [di]
1:0E3C  0b0e130e          or       cx, word ptr [0xe13]
1:0E40  130e130e          adc      cx, word ptr [0xe13]
1:0E44  130e4a0e          adc      cx, word ptr [0xe4a]
1:0E48  1b0d              sbb      cx, word ptr [di]
1:0E4A  c41e6404          les      bx, ptr [0x464]
1:0E4E  26ff7720          push     word ptr es:[bx + 0x20]
1:0E52  9a5c0e0000        lcall    0, 0xe5c  ; @1:KERNEL.GlobalUnlock
1:0E57  ff365004          push     word ptr [0x450]
1:0E5B  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalUnlock
1:0E60  8b46fc            mov      ax, word ptr [bp - 4]
1:0E63  5e                pop      si
1:0E64  4d                dec      bp
1:0E65  4d                dec      bp
1:0E66  8be5              mov      sp, bp
1:0E68  1f                pop      ds
1:0E69  5d                pop      bp
1:0E6A  4d                dec      bp
1:0E6B  ca0600            retf     6
1:0E6E  0000              add      byte ptr [bx + si], al
1:0E70  0000              add      byte ptr [bx + si], al
1:0E72  0000              add      byte ptr [bx + si], al
1:0E74  0000              add      byte ptr [bx + si], al
1:0E76  0000              add      byte ptr [bx + si], al
1:0E78  0000              add      byte ptr [bx + si], al
1:0E7A  0000              add      byte ptr [bx + si], al
1:0E7C  0000              add      byte ptr [bx + si], al
1:0E7E  0000              add      byte ptr [bx + si], al
1:0E80  c3                ret      
1:0E81  00558b            add      byte ptr [di - 0x75], dl
1:0E84  ec                in       al, dx
1:0E85  8bd7              mov      dx, di
1:0E87  8cd8              mov      ax, ds
1:0E89  8ec0              mov      es, ax
1:0E8B  8b7e06            mov      di, word ptr [bp + 6]
1:0E8E  33c0              xor      ax, ax
1:0E90  b9ffff            mov      cx, 0xffff
1:0E93  f2ae              repne scasb al, byte ptr es:[di]
1:0E95  f7d1              not      cx
1:0E97  49                dec      cx
1:0E98  91                xchg     cx, ax
1:0E99  8bfa              mov      di, dx
1:0E9B  5d                pop      bp
1:0E9C  cb                retf     
1:0E9D  008cd890          add      byte ptr [si - 0x6f28], cl
1:0EA1  45                inc      bp
1:0EA2  55                push     bp
1:0EA3  8bec              mov      bp, sp
1:0EA5  1e                push     ds
1:0EA6  8ed8              mov      ds, ax
1:0EA8  56                push     si
1:0EA9  b42a              mov      ah, 0x2a
1:0EAB  cd21              int      0x21
1:0EAD  8bda              mov      bx, dx
1:0EAF  8bf1              mov      si, cx
1:0EB1  b42c              mov      ah, 0x2c
1:0EB3  cd21              int      0x21
1:0EB5  b400              mov      ah, 0
1:0EB7  8ac6              mov      al, dh
1:0EB9  50                push     ax
1:0EBA  8ac1              mov      al, cl
1:0EBC  50                push     ax
1:0EBD  8ac5              mov      al, ch
1:0EBF  50                push     ax
1:0EC0  50                push     ax
1:0EC1  b42a              mov      ah, 0x2a
1:0EC3  cd21              int      0x21
1:0EC5  3bda              cmp      bx, dx
1:0EC7  58                pop      ax
1:0EC8  7408              je       0xed2
1:0ECA  3c17              cmp      al, 0x17
1:0ECC  7504              jne      0xed2
1:0ECE  8bd3              mov      dx, bx
1:0ED0  8bce              mov      cx, si
1:0ED2  b400              mov      ah, 0
1:0ED4  8ac2              mov      al, dl
1:0ED6  50                push     ax
1:0ED7  8ac6              mov      al, dh
1:0ED9  50                push     ax
1:0EDA  81e9bc07          sub      cx, 0x7bc
1:0EDE  51                push     cx
1:0EDF  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_16(1:0F44)
1:0EE4  83c40c            add      sp, 0xc
1:0EE7  837e0600          cmp      word ptr [bp + 6], 0
1:0EEB  7408              je       0xef5
1:0EED  8b5e06            mov      bx, word ptr [bp + 6]
1:0EF0  895702            mov      word ptr [bx + 2], dx
1:0EF3  8907              mov      word ptr [bx], ax
1:0EF5  5e                pop      si
1:0EF6  83ed02            sub      bp, 2
1:0EF9  8be5              mov      sp, bp
1:0EFB  1f                pop      ds
1:0EFC  5d                pop      bp
1:0EFD  4d                dec      bp
1:0EFE  cb                retf     
1:0EFF  004555            add      byte ptr [di + 0x55], al
1:0F02  8bec              mov      bp, sp
1:0F04  8b4606            mov      ax, word ptr [bp + 6]
1:0F07  a32201            mov      word ptr [0x122], ax
1:0F0A  c70624010000      mov      word ptr [0x124], 0
1:0F10  5d                pop      bp
1:0F11  4d                dec      bp
1:0F12  cb                retf     
1:0F13  90                nop      

; ===== EXPORT:ord_4(#4) =====
1:0F14  45                inc      bp
1:0F15  55                push     bp
1:0F16  8bec              mov      bp, sp
1:0F18  b8fd43            mov      ax, 0x43fd
1:0F1B  ba0300            mov      dx, 3
1:0F1E  52                push     dx
1:0F1F  50                push     ax
1:0F20  ff362401          push     word ptr [0x124]