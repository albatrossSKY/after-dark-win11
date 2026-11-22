File: raw\unpacked\MODULES\ZOT.AD
Module: 'ZOT' ('Graphics Module Library')
CS:IP=1:1174  SS:SP=0:0000  AutoDS=2  Heap=1024  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (3): KERNEL, GDI, USER
Segments (2):
  SEG  1: CODE off=0x00600 len=0x11A6 min=0x11A6 flags=0x0D50 relocs=90
  SEG  2: DATA off=0x01940 len=0x03D6 min=0x03D6 flags=0x0C71 relocs=0
Exports (28):
  ord   1: SEG1:07CE flags=0x03 MODULE
  ord   2: SEG1:07B7 flags=0x03 WEP
  ord   3: SEG1:1160 flags=0x03 ___EXPORTEDSTUB
  ord   4: SEG1:0A24 flags=0x00 
  ord   5: SEG1:00FB flags=0x00 
  ord   6: SEG1:00E7 flags=0x00 
  ord   7: SEG1:00D3 flags=0x00 
  ord   8: SEG1:00BF flags=0x00 
  ord   9: SEG1:0992 flags=0x00 
  ord  10: SEG1:00A7 flags=0x00 
  ord  11: SEG1:0061 flags=0x00 
  ord  12: SEG1:0012 flags=0x00 
  ord  13: SEG1:0A10 flags=0x00 
  ord  14: SEG1:09AE flags=0x00 
  ord  15: SEG1:0790 flags=0x00 
  ord  16: SEG1:0A54 flags=0x00 
  ord  17: SEG1:0B58 flags=0x00 
  ord  18: SEG1:0CCA flags=0x00 
  ord  19: SEG1:0B8A flags=0x00 
  ord  20: SEG1:0DFC flags=0x00 
  ord  21: SEG1:0E24 flags=0x00 
  ord  22: SEG1:0EC6 flags=0x00 
  ord  23: SEG1:0E8A flags=0x00 
  ord  24: SEG1:0EF0 flags=0x00 
  ord  25: SEG1:0E28 flags=0x00 
  ord  26: SEG1:0BA4 flags=0x00 
  ord  27: SEG1:1094 flags=0x00 
  ord  28: SEG1:1150 flags=0x00 
Resources (7):
  TYPE_1000        #1               off=0x01D60 len=    96
  TYPE_1000        #2               off=0x01DC0 len=    96
  TYPE_1000        #3               off=0x01E20 len=   112
  TYPE_1000        #4               off=0x01E90 len=    32
  TYPE_2000        #10              off=0x01EB0 len=    80
  TYPE_2000        #20              off=0x01F00 len=    16
  TYPE_2000        #30              off=0x01F10 len=   272

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

; ===== EXPORT:ord_12(#12) =====
1:0012  1e                push     ds
1:0013  58                pop      ax
1:0014  90                nop      
1:0015  45                inc      bp
1:0016  55                push     bp
1:0017  8bec              mov      bp, sp
1:0019  1e                push     ds
1:001A  8ed8              mov      ds, ax
1:001C  b84b00            mov      ax, 0x4b
1:001F  c41ed203          les      bx, ptr [0x3d2]
1:0023  262b4706          sub      ax, word ptr es:[bx + 6]
1:0027  99                cdq      
1:0028  2bc2              sub      ax, dx
1:002A  d1f8              sar      ax, 1
1:002C  a31400            mov      word ptr [0x14], ax
1:002F  c70616002800      mov      word ptr [0x16], 0x28
1:0035  268b470a          mov      ax, word ptr es:[bx + 0xa]
1:0039  99                cdq      
1:003A  2bc2              sub      ax, dx
1:003C  d1f8              sar      ax, 1
1:003E  a31800            mov      word ptr [0x18], ax
1:0041  3d0a00            cmp      ax, 0xa
1:0044  7d06              jge      0x4c
1:0046  c70618000a00      mov      word ptr [0x18], 0xa
1:004C  833e180050        cmp      word ptr [0x18], 0x50
1:0051  7c04              jl       0x57
1:0053  d1261800          shl      word ptr [0x18], 1
1:0057  2bc0              sub      ax, ax
1:0059  4d                dec      bp
1:005A  4d                dec      bp
1:005B  8be5              mov      sp, bp
1:005D  1f                pop      ds
1:005E  5d                pop      bp
1:005F  4d                dec      bp
1:0060  cb                retf     

; ===== EXPORT:ord_11(#11) =====
1:0061  1e                push     ds
1:0062  58                pop      ax
1:0063  90                nop      
1:0064  45                inc      bp
1:0065  55                push     bp
1:0066  8bec              mov      bp, sp
1:0068  1e                push     ds
1:0069  8ed8              mov      ds, ax
1:006B  b83003            mov      ax, 0x330
1:006E  1e                push     ds
1:006F  50                push     ax
1:0070  2bc0              sub      ax, ax
1:0072  50                push     ax
1:0073  50                push     ax
1:0074  c41ed203          les      bx, ptr [0x3d2]
1:0078  26ff7702          push     word ptr es:[bx + 2]
1:007C  26ff7704          push     word ptr es:[bx + 4]
1:0080  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:0085  ff36c603          push     word ptr [0x3c6]
1:0089  b83003            mov      ax, 0x330
1:008C  1e                push     ds
1:008D  50                push     ax
1:008E  b80400            mov      ax, 4
1:0091  50                push     ax
1:0092  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:0097  50                push     ax
1:0098  9affff0000        lcall    0, 0xffff  ; @1:USER.FillRect
1:009D  2bc0              sub      ax, ax
1:009F  4d                dec      bp
1:00A0  4d                dec      bp
1:00A1  8be5              mov      sp, bp
1:00A3  1f                pop      ds
1:00A4  5d                pop      bp
1:00A5  4d                dec      bp
1:00A6  cb                retf     

; ===== EXPORT:ord_10(#10) =====
1:00A7  1e                push     ds
1:00A8  58                pop      ax
1:00A9  90                nop      
1:00AA  45                inc      bp
1:00AB  55                push     bp
1:00AC  8bec              mov      bp, sp
1:00AE  1e                push     ds
1:00AF  8ed8              mov      ds, ax
1:00B1  0e                push     cs
1:00B2  e8b100            call     0x166
1:00B5  2bc0              sub      ax, ax
1:00B7  4d                dec      bp
1:00B8  4d                dec      bp
1:00B9  8be5              mov      sp, bp
1:00BB  1f                pop      ds
1:00BC  5d                pop      bp
1:00BD  4d                dec      bp
1:00BE  cb                retf     

; ===== EXPORT:ord_8(#8) =====
1:00BF  1e                push     ds
1:00C0  58                pop      ax
1:00C1  90                nop      
1:00C2  45                inc      bp
1:00C3  55                push     bp
1:00C4  8bec              mov      bp, sp
1:00C6  1e                push     ds
1:00C7  8ed8              mov      ds, ax
1:00C9  2bc0              sub      ax, ax
1:00CB  4d                dec      bp
1:00CC  4d                dec      bp
1:00CD  8be5              mov      sp, bp
1:00CF  1f                pop      ds
1:00D0  5d                pop      bp
1:00D1  4d                dec      bp
1:00D2  cb                retf     

; ===== EXPORT:ord_7(#7) =====
1:00D3  1e                push     ds
1:00D4  58                pop      ax
1:00D5  90                nop      
1:00D6  45                inc      bp
1:00D7  55                push     bp
1:00D8  8bec              mov      bp, sp
1:00DA  1e                push     ds
1:00DB  8ed8              mov      ds, ax
1:00DD  2bc0              sub      ax, ax
1:00DF  4d                dec      bp
1:00E0  4d                dec      bp
1:00E1  8be5              mov      sp, bp
1:00E3  1f                pop      ds
1:00E4  5d                pop      bp
1:00E5  4d                dec      bp
1:00E6  cb                retf     

; ===== EXPORT:ord_6(#6) =====
1:00E7  1e                push     ds
1:00E8  58                pop      ax
1:00E9  90                nop      
1:00EA  45                inc      bp
1:00EB  55                push     bp
1:00EC  8bec              mov      bp, sp
1:00EE  1e                push     ds
1:00EF  8ed8              mov      ds, ax
1:00F1  2bc0              sub      ax, ax
1:00F3  4d                dec      bp
1:00F4  4d                dec      bp
1:00F5  8be5              mov      sp, bp
1:00F7  1f                pop      ds
1:00F8  5d                pop      bp
1:00F9  4d                dec      bp
1:00FA  cb                retf     

; ===== EXPORT:ord_5(#5) =====
1:00FB  1e                push     ds
1:00FC  58                pop      ax
1:00FD  90                nop      
1:00FE  45                inc      bp
1:00FF  55                push     bp
1:0100  8bec              mov      bp, sp
1:0102  1e                push     ds
1:0103  8ed8              mov      ds, ax
1:0105  c41ecc03          les      bx, ptr [0x3cc]
1:0109  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:010E  7404              je       0x114
1:0110  2bc0              sub      ax, ax
1:0112  eb4a              jmp      0x15e
1:0114  8b4606            mov      ax, word ptr [bp + 6]
1:0117  0bc0              or       ax, ax
1:0119  7406              je       0x121
1:011B  48                dec      ax
1:011C  48                dec      ax
1:011D  7417              je       0x136
1:011F  ebef              jmp      0x110
1:0121  b84b00            mov      ax, 0x4b
1:0124  c41ed203          les      bx, ptr [0x3d2]
1:0128  262b4706          sub      ax, word ptr es:[bx + 6]
1:012C  99                cdq      
1:012D  2bc2              sub      ax, dx
1:012F  d1f8              sar      ax, 1
1:0131  a31400            mov      word ptr [0x14], ax
1:0134  ebda              jmp      0x110
1:0136  c41ed203          les      bx, ptr [0x3d2]
1:013A  268b470a          mov      ax, word ptr es:[bx + 0xa]
1:013E  99                cdq      
1:013F  2bc2              sub      ax, dx
1:0141  d1f8              sar      ax, 1
1:0143  a31800            mov      word ptr [0x18], ax
1:0146  3d0a00            cmp      ax, 0xa
1:0149  7d06              jge      0x151
1:014B  c70618000a00      mov      word ptr [0x18], 0xa
1:0151  833e180050        cmp      word ptr [0x18], 0x50
1:0156  7cb8              jl       0x110
1:0158  d1261800          shl      word ptr [0x18], 1
1:015C  ebb2              jmp      0x110
1:015E  4d                dec      bp
1:015F  4d                dec      bp
1:0160  8be5              mov      sp, bp
1:0162  1f                pop      ds
1:0163  5d                pop      bp
1:0164  4d                dec      bp
1:0165  cb                retf     
1:0166  1e                push     ds
1:0167  58                pop      ax
1:0168  90                nop      
1:0169  45                inc      bp
1:016A  55                push     bp
1:016B  8bec              mov      bp, sp
1:016D  1e                push     ds
1:016E  8ed8              mov      ds, ax
1:0170  56                push     si
1:0171  2bc0              sub      ax, ax
1:0173  a35203            mov      word ptr [0x352], ax
1:0176  a34c03            mov      word ptr [0x34c], ax
1:0179  a35403            mov      word ptr [0x354], ax
1:017C  a35603            mov      word ptr [0x356], ax
1:017F  a34e03            mov      word ptr [0x34e], ax
1:0182  a34803            mov      word ptr [0x348], ax
1:0185  9aef010000        lcall    0, 0x1ef  ; @1:INT:ord_4(1:0A24)
1:018A  b9204e            mov      cx, 0x4e20
1:018D  99                cdq      
1:018E  f7f9              idiv     cx
1:0190  3b161800          cmp      dx, word ptr [0x18]
1:0194  7c03              jl       0x199
1:0196  e98303            jmp      0x51c
1:0199  2bc0              sub      ax, ax
1:019B  50                push     ax
1:019C  b103              mov      cl, 3
1:019E  8b161000          mov      dx, word ptr [0x10]
1:01A2  d3e2              shl      dx, cl
1:01A4  52                push     dx
1:01A5  9aba010000        lcall    0, 0x1ba  ; @1:KERNEL.LocalAlloc
1:01AA  a3c203            mov      word ptr [0x3c2], ax
1:01AD  2bc0              sub      ax, ax
1:01AF  50                push     ax
1:01B0  b103              mov      cl, 3
1:01B2  8b161200          mov      dx, word ptr [0x12]
1:01B6  d3e2              shl      dx, cl
1:01B8  52                push     dx
1:01B9  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LocalAlloc
1:01BE  a3c403            mov      word ptr [0x3c4], ax
1:01C1  833ec20300        cmp      word ptr [0x3c2], 0
1:01C6  7410              je       0x1d8
1:01C8  0bc0              or       ax, ax
1:01CA  740c              je       0x1d8
1:01CC  ff36c203          push     word ptr [0x3c2]
1:01D0  9add010000        lcall    0, 0x1dd  ; @1:KERNEL.LocalLock
1:01D5  a3c803            mov      word ptr [0x3c8], ax
1:01D8  ff36c403          push     word ptr [0x3c4]
1:01DC  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LocalLock
1:01E1  a3ca03            mov      word ptr [0x3ca], ax
1:01E4  833ec80300        cmp      word ptr [0x3c8], 0
1:01E9  7503              jne      0x1ee
1:01EB  e9c702            jmp      0x4b5
1:01EE  9a07020000        lcall    0, 0x207  ; @1:INT:ord_4(1:0A24)
1:01F3  c41ed203          les      bx, ptr [0x3d2]
1:01F7  99                cdq      
1:01F8  26f77f02          idiv     word ptr es:[bx + 2]
1:01FC  89163803          mov      word ptr [0x338], dx
1:0200  c7063c030000      mov      word ptr [0x33c], 0
1:0206  9a43020000        lcall    0, 0x243  ; @1:INT:ord_4(1:0A24)
1:020B  b96400            mov      cx, 0x64
1:020E  99                cdq      
1:020F  f7f9              idiv     cx
1:0211  83fa32            cmp      dx, 0x32
1:0214  7d08              jge      0x21e
1:0216  c7064a030000      mov      word ptr [0x34a], 0
1:021C  eb06              jmp      0x224
1:021E  c7064a030100      mov      word ptr [0x34a], 1
1:0224  833e380300        cmp      word ptr [0x338], 0
1:0229  7e6c              jle      0x297
1:022B  a13803            mov      ax, word ptr [0x338]
1:022E  c41ed203          les      bx, ptr [0x3d2]
1:0232  26394702          cmp      word ptr es:[bx + 2], ax
1:0236  7e5f              jle      0x297
1:0238  a11000            mov      ax, word ptr [0x10]
1:023B  48                dec      ax
1:023C  3b065403          cmp      ax, word ptr [0x354]
1:0240  7e55              jle      0x297
1:0242  9a5b020000        lcall    0, 0x25b  ; @1:INT:ord_4(1:0A24)
1:0247  c41ed203          les      bx, ptr [0x3d2]
1:024B  99                cdq      
1:024C  26f77f02          idiv     word ptr es:[bx + 2]
1:0250  8bc2              mov      ax, dx
1:0252  99                cdq      
1:0253  f73e1600          idiv     word ptr [0x16]
1:0257  a34c03            mov      word ptr [0x34c], ax
1:025A  9aa6020000        lcall    0, 0x2a6  ; @1:INT:ord_4(1:0A24)
1:025F  c41ed203          les      bx, ptr [0x3d2]
1:0263  99                cdq      
1:0264  26f77f04          idiv     word ptr es:[bx + 4]
1:0268  8bc2              mov      ax, dx
1:026A  99                cdq      
1:026B  f73e1600          idiv     word ptr [0x16]
1:026F  a35203            mov      word ptr [0x352], ax
1:0272  833e4a0300        cmp      word ptr [0x34a], 0
1:0277  7404              je       0x27d
1:0279  f71e4c03          neg      word ptr [0x34c]
1:027D  a14c03            mov      ax, word ptr [0x34c]
1:0280  03063803          add      ax, word ptr [0x338]
1:0284  a34003            mov      word ptr [0x340], ax
1:0287  a15203            mov      ax, word ptr [0x352]
1:028A  03063c03          add      ax, word ptr [0x33c]
1:028E  a34403            mov      word ptr [0x344], ax
1:0291  26394704          cmp      word ptr es:[bx + 4], ax
1:0295  7d2e              jge      0x2c5
1:0297  ff365603          push     word ptr [0x356]
1:029B  ff365403          push     word ptr [0x354]
1:029F  0e                push     cs
1:02A0  e88103            call     0x624
1:02A3  5b                pop      bx
1:02A4  5b                pop      bx
1:02A5  9a43030000        lcall    0, 0x343  ; @1:INT:ord_4(1:0A24)
1:02AA  b96400            mov      cx, 0x64
1:02AD  99                cdq      
1:02AE  f7f9              idiv     cx
1:02B0  83fa32            cmp      dx, 0x32
1:02B3  7c03              jl       0x2b8
1:02B5  e9db01            jmp      0x493
1:02B8  c70658030100      mov      word ptr [0x358], 1
1:02BE  b82c01            mov      ax, 0x12c
1:02C1  99                cdq      
1:02C2  e9da01            jmp      0x49f
1:02C5  833e400300        cmp      word ptr [0x340], 0
1:02CA  7e09              jle      0x2d5
1:02CC  a14003            mov      ax, word ptr [0x340]
1:02CF  26394702          cmp      word ptr es:[bx + 2], ax
1:02D3  7f16              jg       0x2eb
1:02D5  a13803            mov      ax, word ptr [0x338]
1:02D8  2b064c03          sub      ax, word ptr [0x34c]
1:02DC  a34003            mov      word ptr [0x340], ax
1:02DF  833e4a0301        cmp      word ptr [0x34a], 1
1:02E4  1bc0              sbb      ax, ax
1:02E6  f7d8              neg      ax
1:02E8  a34a03            mov      word ptr [0x34a], ax
1:02EB  a13803            mov      ax, word ptr [0x338]
1:02EE  b103              mov      cl, 3
1:02F0  8b1e4e03          mov      bx, word ptr [0x34e]
1:02F4  d3e3              shl      bx, cl
1:02F6  8b36c803          mov      si, word ptr [0x3c8]
1:02FA  8900              mov      word ptr [bx + si], ax
1:02FC  a13c03            mov      ax, word ptr [0x33c]
1:02FF  8b364e03          mov      si, word ptr [0x34e]
1:0303  d3e6              shl      si, cl
1:0305  8b1ec803          mov      bx, word ptr [0x3c8]
1:0309  894002            mov      word ptr [bx + si + 2], ax
1:030C  a14003            mov      ax, word ptr [0x340]
1:030F  8b364e03          mov      si, word ptr [0x34e]
1:0313  d3e6              shl      si, cl
1:0315  8b1ec803          mov      bx, word ptr [0x3c8]
1:0319  894004            mov      word ptr [bx + si + 4], ax
1:031C  a14403            mov      ax, word ptr [0x344]
1:031F  8b364e03          mov      si, word ptr [0x34e]
1:0323  d3e6              shl      si, cl
1:0325  8b1ec803          mov      bx, word ptr [0x3c8]
1:0329  894006            mov      word ptr [bx + si + 6], ax
1:032C  a14e03            mov      ax, word ptr [0x34e]
1:032F  ff064e03          inc      word ptr [0x34e]
1:0333  a35403            mov      word ptr [0x354], ax
1:0336  a14003            mov      ax, word ptr [0x340]
1:0339  a33803            mov      word ptr [0x338], ax
1:033C  a14403            mov      ax, word ptr [0x344]
1:033F  a33c03            mov      word ptr [0x33c], ax
1:0342  9a62030000        lcall    0, 0x362  ; @1:INT:ord_4(1:0A24)
1:0347  b96400            mov      cx, 0x64
1:034A  99                cdq      
1:034B  f7f9              idiv     cx
1:034D  83fa0a            cmp      dx, 0xa
1:0350  7c03              jl       0x355
1:0352  e9cffe            jmp      0x224
1:0355  a14003            mov      ax, word ptr [0x340]
1:0358  a33a03            mov      word ptr [0x33a], ax
1:035B  a14403            mov      ax, word ptr [0x344]
1:035E  a33e03            mov      word ptr [0x33e], ax
1:0361  9aa8030000        lcall    0, 0x3a8  ; @1:INT:ord_4(1:0A24)
1:0366  b96400            mov      cx, 0x64
1:0369  99                cdq      
1:036A  f7f9              idiv     cx
1:036C  83fa32            cmp      dx, 0x32
1:036F  7d08              jge      0x379
1:0371  c70650030000      mov      word ptr [0x350], 0
1:0377  eb06              jmp      0x37f
1:0379  c70650030100      mov      word ptr [0x350], 1
1:037F  833eca0300        cmp      word ptr [0x3ca], 0
1:0384  741e              je       0x3a4
1:0386  833e3a0300        cmp      word ptr [0x33a], 0
1:038B  7e17              jle      0x3a4
1:038D  a13a03            mov      ax, word ptr [0x33a]
1:0390  c41ed203          les      bx, ptr [0x3d2]
1:0394  26394702          cmp      word ptr es:[bx + 2], ax
1:0398  7e0a              jle      0x3a4
1:039A  a11200            mov      ax, word ptr [0x12]
1:039D  48                dec      ax
1:039E  3b065603          cmp      ax, word ptr [0x356]
1:03A2  7f03              jg       0x3a7
1:03A4  e97dfe            jmp      0x224
1:03A7  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_4(1:0A24)
1:03AC  c41ed203          les      bx, ptr [0x3d2]
1:03B0  99                cdq      
1:03B1  26f77f02          idiv     word ptr es:[bx + 2]
1:03B5  8bc2              mov      ax, dx
1:03B7  99                cdq      
1:03B8  f73e1600          idiv     word ptr [0x16]
1:03BC  a34c03            mov      word ptr [0x34c], ax
1:03BF  9a7d040000        lcall    0, 0x47d  ; @1:INT:ord_4(1:0A24)
1:03C4  c41ed203          les      bx, ptr [0x3d2]
1:03C8  99                cdq      
1:03C9  26f77f04          idiv     word ptr es:[bx + 4]
1:03CD  8bc2              mov      ax, dx
1:03CF  99                cdq      
1:03D0  f73e1600          idiv     word ptr [0x16]
1:03D4  a35203            mov      word ptr [0x352], ax
1:03D7  833e500300        cmp      word ptr [0x350], 0
1:03DC  7404              je       0x3e2
1:03DE  f71e4c03          neg      word ptr [0x34c]
1:03E2  a13a03            mov      ax, word ptr [0x33a]
1:03E5  03064c03          add      ax, word ptr [0x34c]
1:03E9  a34203            mov      word ptr [0x342], ax
1:03EC  a13e03            mov      ax, word ptr [0x33e]
1:03EF  03065203          add      ax, word ptr [0x352]
1:03F3  a34603            mov      word ptr [0x346], ax
1:03F6  26394704          cmp      word ptr es:[bx + 4], ax
1:03FA  7d03              jge      0x3ff
1:03FC  e925fe            jmp      0x224
1:03FF  833e420300        cmp      word ptr [0x342], 0
1:0404  7e09              jle      0x40f
1:0406  a14203            mov      ax, word ptr [0x342]
1:0409  26394702          cmp      word ptr es:[bx + 2], ax
1:040D  7f16              jg       0x425
1:040F  a13a03            mov      ax, word ptr [0x33a]
1:0412  2b064c03          sub      ax, word ptr [0x34c]
1:0416  a34203            mov      word ptr [0x342], ax
1:0419  833e500301        cmp      word ptr [0x350], 1
1:041E  1bc0              sbb      ax, ax
1:0420  f7d8              neg      ax
1:0422  a35003            mov      word ptr [0x350], ax
1:0425  a13a03            mov      ax, word ptr [0x33a]
1:0428  b103              mov      cl, 3
1:042A  8b1e4803          mov      bx, word ptr [0x348]
1:042E  d3e3              shl      bx, cl
1:0430  8b36ca03          mov      si, word ptr [0x3ca]
1:0434  8900              mov      word ptr [bx + si], ax
1:0436  a13e03            mov      ax, word ptr [0x33e]
1:0439  8b364803          mov      si, word ptr [0x348]
1:043D  d3e6              shl      si, cl
1:043F  8b1eca03          mov      bx, word ptr [0x3ca]
1:0443  894002            mov      word ptr [bx + si + 2], ax
1:0446  a14203            mov      ax, word ptr [0x342]
1:0449  8b364803          mov      si, word ptr [0x348]
1:044D  d3e6              shl      si, cl
1:044F  8b1eca03          mov      bx, word ptr [0x3ca]
1:0453  894004            mov      word ptr [bx + si + 4], ax
1:0456  a14603            mov      ax, word ptr [0x346]
1:0459  8b364803          mov      si, word ptr [0x348]
1:045D  d3e6              shl      si, cl
1:045F  8b1eca03          mov      bx, word ptr [0x3ca]
1:0463  894006            mov      word ptr [bx + si + 6], ax
1:0466  a14803            mov      ax, word ptr [0x348]
1:0469  ff064803          inc      word ptr [0x348]
1:046D  a35603            mov      word ptr [0x356], ax
1:0470  a14203            mov      ax, word ptr [0x342]
1:0473  a33a03            mov      word ptr [0x33a], ax
1:0476  a14603            mov      ax, word ptr [0x346]
1:0479  a33e03            mov      word ptr [0x33e], ax
1:047C  9a86010000        lcall    0, 0x186  ; @1:INT:ord_4(1:0A24)
1:0481  b96400            mov      cx, 0x64
1:0484  99                cdq      
1:0485  f7f9              idiv     cx
1:0487  3b161400          cmp      dx, word ptr [0x14]
1:048B  7c03              jl       0x490
1:048D  e9f6fe            jmp      0x386
1:0490  e991fd            jmp      0x224
1:0493  c70658030000      mov      word ptr [0x358], 0
1:0499  b8a086            mov      ax, 0x86a0
1:049C  ba0100            mov      dx, 1
1:049F  52                push     dx
1:04A0  50                push     ax
1:04A1  0e                push     cs
1:04A2  e8b102            call     0x756
1:04A5  5b                pop      bx
1:04A6  5b                pop      bx
1:04A7  ff365603          push     word ptr [0x356]
1:04AB  ff365403          push     word ptr [0x354]
1:04AF  0e                push     cs
1:04B0  e87200            call     0x525
1:04B3  5b                pop      bx
1:04B4  5b                pop      bx
1:04B5  833e580300        cmp      word ptr [0x358], 0
1:04BA  7434              je       0x4f0
1:04BC  b8c800            mov      ax, 0xc8
1:04BF  99                cdq      
1:04C0  52                push     dx
1:04C1  50                push     ax
1:04C2  0e                push     cs
1:04C3  e89002            call     0x756
1:04C6  5b                pop      bx
1:04C7  5b                pop      bx
1:04C8  ff365603          push     word ptr [0x356]
1:04CC  ff365403          push     word ptr [0x354]
1:04D0  0e                push     cs
1:04D1  e85001            call     0x624
1:04D4  5b                pop      bx
1:04D5  5b                pop      bx
1:04D6  b8c800            mov      ax, 0xc8
1:04D9  99                cdq      
1:04DA  52                push     dx
1:04DB  50                push     ax
1:04DC  0e                push     cs
1:04DD  e87602            call     0x756
1:04E0  5b                pop      bx
1:04E1  5b                pop      bx
1:04E2  ff365603          push     word ptr [0x356]
1:04E6  ff365403          push     word ptr [0x354]
1:04EA  0e                push     cs
1:04EB  e83700            call     0x525
1:04EE  5b                pop      bx
1:04EF  5b                pop      bx
1:04F0  ff36c203          push     word ptr [0x3c2]
1:04F4  9afe040000        lcall    0, 0x4fe  ; @1:KERNEL.LocalUnlock
1:04F9  ff36c403          push     word ptr [0x3c4]
1:04FD  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LocalUnlock
1:0502  ff36c203          push     word ptr [0x3c2]
1:0506  9a10050000        lcall    0, 0x510  ; @1:KERNEL.LocalFree
1:050B  ff36c403          push     word ptr [0x3c4]
1:050F  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LocalFree
1:0514  2bc0              sub      ax, ax
1:0516  a3c403            mov      word ptr [0x3c4], ax
1:0519  a3c203            mov      word ptr [0x3c2], ax
1:051C  5e                pop      si
1:051D  4d                dec      bp
1:051E  4d                dec      bp
1:051F  8be5              mov      sp, bp
1:0521  1f                pop      ds
1:0522  5d                pop      bp
1:0523  4d                dec      bp
1:0524  cb                retf     
1:0525  1e                push     ds
1:0526  58                pop      ax
1:0527  90                nop      
1:0528  45                inc      bp
1:0529  55                push     bp
1:052A  8bec              mov      bp, sp
1:052C  1e                push     ds
1:052D  8ed8              mov      ds, ax
1:052F  56                push     si
1:0530  ff36c603          push     word ptr [0x3c6]
1:0534  2bc0              sub      ax, ax
1:0536  50                push     ax
1:0537  b90100            mov      cx, 1
1:053A  51                push     cx
1:053B  2bc9              sub      cx, cx
1:053D  51                push     cx
1:053E  51                push     cx
1:053F  9a43060000        lcall    0, 0x643  ; @1:GDI.CreatePen
1:0544  50                push     ax
1:0545  9a11060000        lcall    0, 0x611  ; @1:GDI.SelectObject
1:054A  c7066c030000      mov      word ptr [0x36c], 0
1:0550  eb4b              jmp      0x59d
1:0552  b103              mov      cl, 3
1:0554  8b1e6c03          mov      bx, word ptr [0x36c]
1:0558  d3e3              shl      bx, cl
1:055A  8b36c803          mov      si, word ptr [0x3c8]
1:055E  8b00              mov      ax, word ptr [bx + si]
1:0560  a35a03            mov      word ptr [0x35a], ax
1:0563  03f3              add      si, bx
1:0565  8b4402            mov      ax, word ptr [si + 2]
1:0568  a35e03            mov      word ptr [0x35e], ax
1:056B  8b4404            mov      ax, word ptr [si + 4]
1:056E  a36203            mov      word ptr [0x362], ax
1:0571  8b4406            mov      ax, word ptr [si + 6]
1:0574  a36603            mov      word ptr [0x366], ax
1:0577  ff36c603          push     word ptr [0x3c6]
1:057B  ff365a03          push     word ptr [0x35a]
1:057F  ff365e03          push     word ptr [0x35e]
1:0583  9ae0050000        lcall    0, 0x5e0  ; @1:GDI.MoveTo
1:0588  ff36c603          push     word ptr [0x3c6]
1:058C  ff366203          push     word ptr [0x362]
1:0590  ff366603          push     word ptr [0x366]
1:0594  9af1050000        lcall    0, 0x5f1  ; @1:GDI.LineTo
1:0599  ff066c03          inc      word ptr [0x36c]
1:059D  8b4606            mov      ax, word ptr [bp + 6]
1:05A0  39066c03          cmp      word ptr [0x36c], ax
1:05A4  7eac              jle      0x552
1:05A6  c7066a030000      mov      word ptr [0x36a], 0
1:05AC  eb4b              jmp      0x5f9
1:05AE  b103              mov      cl, 3
1:05B0  8b1e6a03          mov      bx, word ptr [0x36a]
1:05B4  d3e3              shl      bx, cl
1:05B6  8b36ca03          mov      si, word ptr [0x3ca]
1:05BA  8b00              mov      ax, word ptr [bx + si]
1:05BC  a35c03            mov      word ptr [0x35c], ax
1:05BF  03f3              add      si, bx
1:05C1  8b4402            mov      ax, word ptr [si + 2]
1:05C4  a36003            mov      word ptr [0x360], ax
1:05C7  8b4404            mov      ax, word ptr [si + 4]
1:05CA  a36403            mov      word ptr [0x364], ax
1:05CD  8b4406            mov      ax, word ptr [si + 6]
1:05D0  a36803            mov      word ptr [0x368], ax
1:05D3  ff36c603          push     word ptr [0x3c6]
1:05D7  ff365c03          push     word ptr [0x35c]
1:05DB  ff366003          push     word ptr [0x360]
1:05DF  9a87060000        lcall    0, 0x687  ; @1:GDI.MoveTo
1:05E4  ff36c603          push     word ptr [0x3c6]
1:05E8  ff366403          push     word ptr [0x364]
1:05EC  ff366803          push     word ptr [0x368]
1:05F0  9a98060000        lcall    0, 0x698  ; @1:GDI.LineTo
1:05F5  ff066a03          inc      word ptr [0x36a]
1:05F9  8b4608            mov      ax, word ptr [bp + 8]
1:05FC  39066a03          cmp      word ptr [0x36a], ax
1:0600  7eac              jle      0x5ae
1:0602  ff36c603          push     word ptr [0x3c6]
1:0606  b80700            mov      ax, 7
1:0609  50                push     ax
1:060A  9a93000000        lcall    0, 0x93  ; @1:GDI.GetStockObject
1:060F  50                push     ax
1:0610  9a49060000        lcall    0, 0x649  ; @1:GDI.SelectObject
1:0615  50                push     ax
1:0616  9ad4060000        lcall    0, 0x6d4  ; @1:GDI.DeleteObject
1:061B  5e                pop      si
1:061C  4d                dec      bp
1:061D  4d                dec      bp
1:061E  8be5              mov      sp, bp
1:0620  1f                pop      ds
1:0621  5d                pop      bp
1:0622  4d                dec      bp
1:0623  cb                retf     
1:0624  1e                push     ds
1:0625  58                pop      ax
1:0626  90                nop      
1:0627  45                inc      bp
1:0628  55                push     bp
1:0629  8bec              mov      bp, sp
1:062B  1e                push     ds
1:062C  8ed8              mov      ds, ax
1:062E  56                push     si
1:062F  ff36c603          push     word ptr [0x3c6]
1:0633  2bc0              sub      ax, ax
1:0635  50                push     ax
1:0636  b90100            mov      cx, 1
1:0639  51                push     cx
1:063A  b9ffff            mov      cx, 0xffff
1:063D  baff00            mov      dx, 0xff
1:0640  52                push     dx
1:0641  51                push     cx
1:0642  9ac8060000        lcall    0, 0x6c8  ; @1:GDI.CreatePen
1:0647  50                push     ax
1:0648  9ace060000        lcall    0, 0x6ce  ; @1:GDI.SelectObject
1:064D  c70680030000      mov      word ptr [0x380], 0
1:0653  eb4b              jmp      0x6a0
1:0655  b103              mov      cl, 3
1:0657  8b1e8003          mov      bx, word ptr [0x380]
1:065B  d3e3              shl      bx, cl
1:065D  8b36c803          mov      si, word ptr [0x3c8]
1:0661  8b00              mov      ax, word ptr [bx + si]
1:0663  a36e03            mov      word ptr [0x36e], ax
1:0666  03f3              add      si, bx
1:0668  8b4402            mov      ax, word ptr [si + 2]
1:066B  a37203            mov      word ptr [0x372], ax
1:066E  8b4404            mov      ax, word ptr [si + 4]
1:0671  a37603            mov      word ptr [0x376], ax
1:0674  8b4406            mov      ax, word ptr [si + 6]
1:0677  a37a03            mov      word ptr [0x37a], ax
1:067A  ff36c603          push     word ptr [0x3c6]
1:067E  ff366e03          push     word ptr [0x36e]
1:0682  ff367203          push     word ptr [0x372]
1:0686  9a12070000        lcall    0, 0x712  ; @1:GDI.MoveTo
1:068B  ff36c603          push     word ptr [0x3c6]
1:068F  ff367603          push     word ptr [0x376]
1:0693  ff367a03          push     word ptr [0x37a]
1:0697  9a23070000        lcall    0, 0x723  ; @1:GDI.LineTo
1:069C  ff068003          inc      word ptr [0x380]
1:06A0  8b4606            mov      ax, word ptr [bp + 6]
1:06A3  39068003          cmp      word ptr [0x380], ax
1:06A7  7cac              jl       0x655
1:06A9  c41ecc03          les      bx, ptr [0x3cc]
1:06AD  26837f0a01        cmp      word ptr es:[bx + 0xa], 1
1:06B2  7e24              jle      0x6d8
1:06B4  ff36c603          push     word ptr [0x3c6]
1:06B8  2bc0              sub      ax, ax
1:06BA  50                push     ax
1:06BB  b80100            mov      ax, 1
1:06BE  50                push     ax
1:06BF  b88080            mov      ax, 0x8080
1:06C2  ba8000            mov      dx, 0x80
1:06C5  52                push     dx
1:06C6  50                push     ax
1:06C7  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreatePen
1:06CC  50                push     ax
1:06CD  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectObject
1:06D2  50                push     ax
1:06D3  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteObject
1:06D8  c7067e030000      mov      word ptr [0x37e], 0
1:06DE  eb4b              jmp      0x72b
1:06E0  b103              mov      cl, 3
1:06E2  8b1e7e03          mov      bx, word ptr [0x37e]
1:06E6  d3e3              shl      bx, cl
1:06E8  8b36ca03          mov      si, word ptr [0x3ca]
1:06EC  8b00              mov      ax, word ptr [bx + si]
1:06EE  a37003            mov      word ptr [0x370], ax
1:06F1  03f3              add      si, bx
1:06F3  8b4402            mov      ax, word ptr [si + 2]
1:06F6  a37403            mov      word ptr [0x374], ax
1:06F9  8b4404            mov      ax, word ptr [si + 4]
1:06FC  a37803            mov      word ptr [0x378], ax
1:06FF  8b4406            mov      ax, word ptr [si + 6]
1:0702  a37c03            mov      word ptr [0x37c], ax
1:0705  ff36c603          push     word ptr [0x3c6]
1:0709  ff367003          push     word ptr [0x370]
1:070D  ff367403          push     word ptr [0x374]
1:0711  9affff0000        lcall    0, 0xffff  ; @1:GDI.MoveTo
1:0716  ff36c603          push     word ptr [0x3c6]
1:071A  ff367803          push     word ptr [0x378]
1:071E  ff367c03          push     word ptr [0x37c]
1:0722  9affff0000        lcall    0, 0xffff  ; @1:GDI.LineTo
1:0727  ff067e03          inc      word ptr [0x37e]
1:072B  8b4608            mov      ax, word ptr [bp + 8]
1:072E  39067e03          cmp      word ptr [0x37e], ax
1:0732  7cac              jl       0x6e0
1:0734  ff36c603          push     word ptr [0x3c6]
1:0738  b80700            mov      ax, 7
1:073B  50                push     ax
1:073C  9a0b060000        lcall    0, 0x60b  ; @1:GDI.GetStockObject
1:0741  50                push     ax
1:0742  9a46050000        lcall    0, 0x546  ; @1:GDI.SelectObject
1:0747  50                push     ax
1:0748  9a17060000        lcall    0, 0x617  ; @1:GDI.DeleteObject
1:074D  5e                pop      si
1:074E  4d                dec      bp
1:074F  4d                dec      bp
1:0750  8be5              mov      sp, bp
1:0752  1f                pop      ds
1:0753  5d                pop      bp
1:0754  4d                dec      bp
1:0755  cb                retf     
1:0756  1e                push     ds
1:0757  58                pop      ax
1:0758  90                nop      
1:0759  45                inc      bp
1:075A  55                push     bp
1:075B  8bec              mov      bp, sp
1:075D  1e                push     ds
1:075E  8ed8              mov      ds, ax
1:0760  2bc0              sub      ax, ax
1:0762  a38403            mov      word ptr [0x384], ax
1:0765  a38203            mov      word ptr [0x382], ax
1:0768  eb0a              jmp      0x774
1:076A  8306820301        add      word ptr [0x382], 1
1:076F  8316840300        adc      word ptr [0x384], 0
1:0774  8b4606            mov      ax, word ptr [bp + 6]
1:0777  8b5608            mov      dx, word ptr [bp + 8]
1:077A  39168403          cmp      word ptr [0x384], dx
1:077E  7708              ja       0x788
1:0780  72e8              jb       0x76a
1:0782  39068203          cmp      word ptr [0x382], ax
1:0786  72e2              jb       0x76a
1:0788  4d                dec      bp
1:0789  4d                dec      bp
1:078A  8be5              mov      sp, bp
1:078C  1f                pop      ds
1:078D  5d                pop      bp
1:078E  4d                dec      bp
1:078F  cb                retf     

; ===== EXPORT:ord_15(#15) =====
1:0790  1e                push     ds
1:0791  58                pop      ax
1:0792  90                nop      
1:0793  45                inc      bp
1:0794  55                push     bp
1:0795  8bec              mov      bp, sp
1:0797  1e                push     ds
1:0798  8ed8              mov      ds, ax
1:079A  837e0a00          cmp      word ptr [bp + 0xa], 0
1:079E  7504              jne      0x7a4
1:07A0  2bc0              sub      ax, ax
1:07A2  eb09              jmp      0x7ad
1:07A4  8b460e            mov      ax, word ptr [bp + 0xe]
1:07A7  a3d003            mov      word ptr [0x3d0], ax
1:07AA  b80100            mov      ax, 1
1:07AD  4d                dec      bp
1:07AE  4d                dec      bp
1:07AF  8be5              mov      sp, bp
1:07B1  1f                pop      ds
1:07B2  5d                pop      bp
1:07B3  4d                dec      bp
1:07B4  ca0a00            retf     0xa

; ===== EXPORT:WEP(#2) =====
1:07B7  1e                push     ds
1:07B8  58                pop      ax
1:07B9  90                nop      
1:07BA  45                inc      bp
1:07BB  55                push     bp
1:07BC  8bec              mov      bp, sp
1:07BE  1e                push     ds
1:07BF  8ed8              mov      ds, ax
1:07C1  b80100            mov      ax, 1
1:07C4  4d                dec      bp
1:07C5  4d                dec      bp
1:07C6  8be5              mov      sp, bp
1:07C8  1f                pop      ds
1:07C9  5d                pop      bp
1:07CA  4d                dec      bp
1:07CB  ca0200            retf     2

; ===== EXPORT:MODULE(#1) =====
1:07CE  1e                push     ds
1:07CF  58                pop      ax
1:07D0  90                nop      
1:07D1  45                inc      bp
1:07D2  55                push     bp
1:07D3  8bec              mov      bp, sp
1:07D5  1e                push     ds
1:07D6  8ed8              mov      ds, ax
1:07D8  83ec0a            sub      sp, 0xa
1:07DB  56                push     si
1:07DC  8b4608            mov      ax, word ptr [bp + 8]
1:07DF  a3c603            mov      word ptr [0x3c6], ax
1:07E2  8b4606            mov      ax, word ptr [bp + 6]
1:07E5  a3c003            mov      word ptr [0x3c0], ax
1:07E8  50                push     ax
1:07E9  9a09080000        lcall    0, 0x809  ; @1:KERNEL.GlobalLock
1:07EE  a3cc03            mov      word ptr [0x3cc], ax
1:07F1  8916ce03          mov      word ptr [0x3ce], dx
1:07F5  8bc2              mov      ax, dx
1:07F7  0b06cc03          or       ax, word ptr [0x3cc]
1:07FB  7503              jne      0x800
1:07FD  e96a01            jmp      0x96a
1:0800  c41ecc03          les      bx, ptr [0x3cc]
1:0804  26ff7720          push     word ptr es:[bx + 0x20]
1:0808  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalLock
1:080D  a3d203            mov      word ptr [0x3d2], ax
1:0810  8916d403          mov      word ptr [0x3d4], dx
1:0814  8bc2              mov      ax, dx
1:0816  0b06d203          or       ax, word ptr [0x3d2]
1:081A  7503              jne      0x81f
1:081C  e94201            jmp      0x961
1:081F  8b460a            mov      ax, word ptr [bp + 0xa]
1:0822  e90801            jmp      0x92d
1:0825  c41ecc03          les      bx, ptr [0x3cc]
1:0829  26837f1465        cmp      word ptr es:[bx + 0x14], 0x65
1:082E  7c0f              jl       0x83f
1:0830  26817f36f400      cmp      word ptr es:[bx + 0x36], 0xf4
1:0836  7507              jne      0x83f
1:0838  26837f3878        cmp      word ptr es:[bx + 0x38], 0x78
1:083D  740e              je       0x84d
1:083F  c7061a000000      mov      word ptr [0x1a], 0
1:0845  c746fc0500        mov      word ptr [bp - 4], 5
1:084A  e90701            jmp      0x954
1:084D  c7061a000100      mov      word ptr [0x1a], 1
1:0853  e9fe00            jmp      0x954
1:0856  b88603            mov      ax, 0x386
1:0859  50                push     ax
1:085A  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_14(1:09AE)
1:085F  5b                pop      bx
1:0860  ff368603          push     word ptr [0x386]
1:0864  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_13(1:0A10)
1:0869  5b                pop      bx
1:086A  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:0012)
1:086F  eb13              jmp      0x884
1:0871  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:0061)
1:0876  eb0c              jmp      0x884
1:0878  833e1a0000        cmp      word ptr [0x1a], 0
1:087D  740b              je       0x88a
1:087F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:00A7)
1:0884  8946fc            mov      word ptr [bp - 4], ax
1:0887  e9ca00            jmp      0x954
1:088A  ff36c603          push     word ptr [0x3c6]
1:088E  b800ff            mov      ax, 0xff00
1:0891  baff00            mov      dx, 0xff
1:0894  52                push     dx
1:0895  50                push     ax
1:0896  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextColor
1:089B  ff36c603          push     word ptr [0x3c6]
1:089F  2bc0              sub      ax, ax
1:08A1  50                push     ax
1:08A2  50                push     ax
1:08A3  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkColor
1:08A8  ff36c603          push     word ptr [0x3c6]
1:08AC  2bc0              sub      ax, ax
1:08AE  50                push     ax
1:08AF  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextAlign
1:08B4  ff36c603          push     word ptr [0x3c6]
1:08B8  b80100            mov      ax, 1
1:08BB  50                push     ax
1:08BC  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkMode
1:08C1  ff36c603          push     word ptr [0x3c6]
1:08C5  2bc0              sub      ax, ax
1:08C7  50                push     ax
1:08C8  50                push     ax
1:08C9  b81c00            mov      ax, 0x1c
1:08CC  1e                push     ds
1:08CD  50                push     ax
1:08CE  50                push     ax
1:08CF  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:0992)
1:08D4  5b                pop      bx
1:08D5  50                push     ax
1:08D6  9affff0000        lcall    0, 0xffff  ; @1:GDI.TextOut
1:08DB  eb77              jmp      0x954
1:08DD  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:00BF)
1:08E2  eba0              jmp      0x884
1:08E4  a1d003            mov      ax, word ptr [0x3d0]
1:08E7  c41ed203          les      bx, ptr [0x3d2]
1:08EB  26894716          mov      word ptr es:[bx + 0x16], ax
1:08EF  c746f60000        mov      word ptr [bp - 0xa], 0
1:08F4  8b46f6            mov      ax, word ptr [bp - 0xa]
1:08F7  8bf0              mov      si, ax
1:08F9  d1e6              shl      si, 1
1:08FB  40                inc      ax
1:08FC  c41ed203          les      bx, ptr [0x3d2]
1:0900  2689400e          mov      word ptr es:[bx + si + 0xe], ax
1:0904  ff46f6            inc      word ptr [bp - 0xa]
1:0907  837ef604          cmp      word ptr [bp - 0xa], 4
1:090B  7ce7              jl       0x8f4
1:090D  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:00D3)
1:0912  e96fff            jmp      0x884
1:0915  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_6(1:00E7)
1:091A  e967ff            jmp      0x884
1:091D  8b460a            mov      ax, word ptr [bp + 0xa]
1:0920  2d0700            sub      ax, 7
1:0923  50                push     ax
1:0924  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_5(1:00FB)
1:0929  5b                pop      bx
1:092A  e957ff            jmp      0x884
1:092D  3d0c00            cmp      ax, 0xc
1:0930  7722              ja       0x954
1:0932  d1e0              shl      ax, 1
1:0934  93                xchg     bx, ax
1:0935  2effa73a09        jmp      word ptr cs:[bx + 0x93a]
1:093A  56                push     si
1:093B  087108            or       byte ptr [bx + di + 8], dh
1:093E  7808              js       0x948
1:0940  dd08              fisttp   qword ptr [bx + si]
1:0942  54                push     sp
1:0943  09e4              or       sp, sp
1:0945  0815              or       byte ptr [di], dl
1:0947  091d              or       word ptr [di], bx
1:0949  091d              or       word ptr [di], bx
1:094B  091d              or       word ptr [di], bx
1:094D  091d              or       word ptr [di], bx
1:094F  095409            or       word ptr [si + 9], dx
1:0952  2508c4            and      ax, 0xc408
1:0955  1e                push     ds
1:0956  cc                int3     
1:0957  0326ff77          add      sp, word ptr [0x77ff]
1:095B  209a6609          and      byte ptr [bp + si + 0x966], bl  ; @2:KERNEL.GlobalUnlock
1:095F  0000              add      byte ptr [bx + si], al
1:0961  ff36c003          push     word ptr [0x3c0]
1:0965  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalUnlock
1:096A  8b46fc            mov      ax, word ptr [bp - 4]
1:096D  5e                pop      si
1:096E  4d                dec      bp
1:096F  4d                dec      bp
1:0970  8be5              mov      sp, bp
1:0972  1f                pop      ds
1:0973  5d                pop      bp
1:0974  4d                dec      bp
1:0975  ca0600            retf     6
1:0978  0000              add      byte ptr [bx + si], al
1:097A  0000              add      byte ptr [bx + si], al
1:097C  0000              add      byte ptr [bx + si], al
1:097E  0000              add      byte ptr [bx + si], al
1:0980  0000              add      byte ptr [bx + si], al
1:0982  0000              add      byte ptr [bx + si], al
1:0984  0000              add      byte ptr [bx + si], al
1:0986  0000              add      byte ptr [bx + si], al
1:0988  0000              add      byte ptr [bx + si], al
1:098A  0000              add      byte ptr [bx + si], al
1:098C  0000              add      byte ptr [bx + si], al
1:098E  0000              add      byte ptr [bx + si], al
1:0990  c3                ret      
1:0991  00558b            add      byte ptr [di - 0x75], dl
1:0994  ec                in       al, dx
1:0995  8bd7              mov      dx, di
1:0997  8cd8              mov      ax, ds
1:0999  8ec0              mov      es, ax
1:099B  8b7e06            mov      di, word ptr [bp + 6]
1:099E  33c0              xor      ax, ax
1:09A0  b9ffff            mov      cx, 0xffff
1:09A3  f2ae              repne scasb al, byte ptr es:[di]
1:09A5  f7d1              not      cx
1:09A7  49                dec      cx
1:09A8  91                xchg     cx, ax
1:09A9  8bfa              mov      di, dx
1:09AB  5d                pop      bp
1:09AC  cb                retf     
1:09AD  008cd890          add      byte ptr [si - 0x6f28], cl
1:09B1  45                inc      bp
1:09B2  55                push     bp
1:09B3  8bec              mov      bp, sp
1:09B5  1e                push     ds
1:09B6  8ed8              mov      ds, ax
1:09B8  56                push     si
1:09B9  b42a              mov      ah, 0x2a
1:09BB  cd21              int      0x21
1:09BD  8bda              mov      bx, dx
1:09BF  8bf1              mov      si, cx
1:09C1  b42c              mov      ah, 0x2c
1:09C3  cd21              int      0x21
1:09C5  b400              mov      ah, 0
1:09C7  8ac6              mov      al, dh
1:09C9  50                push     ax
1:09CA  8ac1              mov      al, cl
1:09CC  50                push     ax
1:09CD  8ac5              mov      al, ch
1:09CF  50                push     ax
1:09D0  50                push     ax
1:09D1  b42a              mov      ah, 0x2a
1:09D3  cd21              int      0x21
1:09D5  3bda              cmp      bx, dx
1:09D7  58                pop      ax
1:09D8  7408              je       0x9e2
1:09DA  3c17              cmp      al, 0x17
1:09DC  7504              jne      0x9e2
1:09DE  8bd3              mov      dx, bx
1:09E0  8bce              mov      cx, si
1:09E2  b400              mov      ah, 0
1:09E4  8ac2              mov      al, dl
1:09E6  50                push     ax
1:09E7  8ac6              mov      al, dh
1:09E9  50                push     ax
1:09EA  81e9bc07          sub      cx, 0x7bc
1:09EE  51                push     cx
1:09EF  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_16(1:0A54)
1:09F4  83c40c            add      sp, 0xc
1:09F7  837e0600          cmp      word ptr [bp + 6], 0
1:09FB  7408              je       0xa05
1:09FD  8b5e06            mov      bx, word ptr [bp + 6]
1:0A00  895702            mov      word ptr [bx + 2], dx
1:0A03  8907              mov      word ptr [bx], ax
1:0A05  5e                pop      si
1:0A06  83ed02            sub      bp, 2
1:0A09  8be5              mov      sp, bp
1:0A0B  1f                pop      ds
1:0A0C  5d                pop      bp
1:0A0D  4d                dec      bp
1:0A0E  cb                retf     
1:0A0F  004555            add      byte ptr [di + 0x55], al
1:0A12  8bec              mov      bp, sp
1:0A14  8b4606            mov      ax, word ptr [bp + 6]
1:0A17  a35200            mov      word ptr [0x52], ax
1:0A1A  c70654000000      mov      word ptr [0x54], 0
1:0A20  5d                pop      bp
1:0A21  4d                dec      bp
1:0A22  cb                retf     
1:0A23  90                nop      

; ===== EXPORT:ord_4(#4) =====
1:0A24  45                inc      bp
1:0A25  55                push     bp
1:0A26  8bec              mov      bp, sp
1:0A28  b8fd43            mov      ax, 0x43fd
1:0A2B  ba0300            mov      dx, 3