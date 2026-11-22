File: raw\unpacked\MODULES\ROSE.AD
Module: 'ROSE' ('Graphics Module Library')
CS:IP=1:3CCA  SS:SP=0:0000  AutoDS=3  Heap=4096  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (4): win87em, KERNEL, GDI, USER
Segments (3):
  SEG  1: CODE off=0x00700 len=0x41B7 min=0x41B7 flags=0x1D50 relocs=394
  SEG  2: DATA off=0x00000 len=0x0000 min=0x0014 flags=0x0C61 relocs=0
  SEG  3: DATA off=0x05240 len=0x21F4 min=0x21F4 flags=0x0D61 relocs=17
Exports (61):
  ord   1: SEG1:115E flags=0x03 MODULE
  ord   2: SEG1:1147 flags=0x03 WEP
  ord   3: SEG1:2ED4 flags=0x03 ___EXPORTEDSTUB
  ord   4: SEG1:1550 flags=0x00 
  ord   5: SEG1:3D21 flags=0x00 
  ord   6: SEG1:1728 flags=0x00 
  ord   7: SEG1:1734 flags=0x00 
  ord   8: SEG1:3CFC flags=0x00 
  ord   9: SEG1:164C flags=0x00 
  ord  10: SEG1:1580 flags=0x00 
  ord  11: SEG1:161A flags=0x00 
  ord  12: SEG1:3D6D flags=0x00 
  ord  13: SEG1:10E8 flags=0x00 
  ord  14: SEG1:10D4 flags=0x00 
  ord  15: SEG1:10C0 flags=0x00 
  ord  16: SEG1:10A3 flags=0x00 
  ord  17: SEG1:14AE flags=0x00 
  ord  18: SEG1:1045 flags=0x00 
  ord  19: SEG1:105D flags=0x00 
  ord  20: SEG1:0EB6 flags=0x00 
  ord  21: SEG1:153C flags=0x00 
  ord  22: SEG1:14CA flags=0x00 
  ord  23: SEG1:1120 flags=0x00 
  ord  24: SEG1:170A flags=0x00 
  ord  25: SEG1:1754 flags=0x00 
  ord  26: SEG1:16EC flags=0x00 
  ord  27: SEG1:152C flags=0x00 
  ord  28: SEG1:17CE flags=0x00 
  ord  29: SEG1:2124 flags=0x00 
  ord  30: SEG1:1EEE flags=0x00 
  ord  31: SEG1:1A90 flags=0x00 
  ord  32: SEG1:1B40 flags=0x00 
  ord  33: SEG1:1A1C flags=0x00 
  ord  34: SEG1:1B0A flags=0x00 
  ord  35: SEG1:24B6 flags=0x00 
  ord  36: SEG1:1792 flags=0x00 
  ord  37: SEG1:278A flags=0x00 
  ord  38: SEG1:2658 flags=0x00 
  ord  39: SEG1:2518 flags=0x00 
  ord  40: SEG1:18D2 flags=0x00 
  ord  41: SEG1:2816 flags=0x00 
  ord  42: SEG1:2E3C flags=0x00 
  ord  43: SEG1:28D0 flags=0x00 
  ord  44: SEG1:279A flags=0x00 
  ord  45: SEG1:27CC flags=0x00 
  ord  46: SEG1:2EA6 flags=0x00 
  ord  47: SEG1:2888 flags=0x00 
  ord  48: SEG1:2E8C flags=0x00 
  ord  49: SEG1:28FE flags=0x00 
  ord  50: SEG1:2755 flags=0x00 
  ord  51: SEG1:2EE8 flags=0x00 
  ord  52: SEG1:2F10 flags=0x00 
  ord  53: SEG1:2FB2 flags=0x00 
  ord  54: SEG1:2F76 flags=0x00 
  ord  55: SEG1:2FDC flags=0x00 
  ord  56: SEG1:2F14 flags=0x00 
  ord  57: SEG1:2532 flags=0x00 
  ord  58: SEG1:3900 flags=0x00 
  ord  59: SEG1:2DB6 flags=0x00 
  ord  60: SEG1:2E9F flags=0x00 
  ord  61: SEG1:3960 flags=0x00 
Resources (10):
  RT_RCDATA        #1               off=0x074E0 len=   256
  RT_RCDATA        #2               off=0x075E0 len=  1280
  TYPE_1000        #1               off=0x07AE0 len=   144
  TYPE_1000        #2               off=0x07B70 len=   144
  TYPE_1000        #3               off=0x07C00 len=    32
  TYPE_1000        #4               off=0x07C20 len=    32
  TYPE_2000        #10              off=0x07C40 len=    80
  TYPE_2000        #20              off=0x07C90 len=    16
  TYPE_2000        #30              off=0x07CA0 len=   608
  TYPE_15          #1               off=0x07F00 len=    32

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
1:001C  83ec06            sub      sp, 6
1:001F  817e06f000        cmp      word ptr [bp + 6], 0xf0
1:0024  7e05              jle      0x2b
1:0026  816e06f000        sub      word ptr [bp + 6], 0xf0
1:002B  837e063c          cmp      word ptr [bp + 6], 0x3c
1:002F  7f11              jg       0x42
1:0031  8b5e06            mov      bx, word ptr [bp + 6]
1:0034  d1e3              shl      bx, 1
1:0036  d1e3              shl      bx, 1
1:0038  8b87020b          mov      ax, word ptr [bx + 0xb02]
1:003C  8b97040b          mov      dx, word ptr [bx + 0xb04]
1:0040  eb5a              jmp      0x9c
1:0042  837e0678          cmp      word ptr [bp + 6], 0x78
1:0046  7f13              jg       0x5b
1:0048  bbe20c            mov      bx, 0xce2
1:004B  8b4606            mov      ax, word ptr [bp + 6]
1:004E  d1e0              shl      ax, 1
1:0050  d1e0              shl      ax, 1
1:0052  2bd8              sub      bx, ax
1:0054  8b07              mov      ax, word ptr [bx]
1:0056  8b5702            mov      dx, word ptr [bx + 2]
1:0059  eb41              jmp      0x9c
1:005B  817e06b400        cmp      word ptr [bp + 6], 0xb4
1:0060  7f27              jg       0x89
1:0062  8b5e06            mov      bx, word ptr [bp + 6]
1:0065  d1e3              shl      bx, 1
1:0067  d1e3              shl      bx, 1
1:0069  8b872209          mov      ax, word ptr [bx + 0x922]
1:006D  8b972409          mov      dx, word ptr [bx + 0x924]
1:0071  8946fa            mov      word ptr [bp - 6], ax
1:0074  8956fc            mov      word ptr [bp - 4], dx
1:0077  f75efa            neg      word ptr [bp - 6]
1:007A  8356fc00          adc      word ptr [bp - 4], 0
1:007E  f75efc            neg      word ptr [bp - 4]
1:0081  8b46fa            mov      ax, word ptr [bp - 6]
1:0084  8b56fc            mov      dx, word ptr [bp - 4]
1:0087  eb13              jmp      0x9c
1:0089  bbc20e            mov      bx, 0xec2
1:008C  8b4606            mov      ax, word ptr [bp + 6]
1:008F  d1e0              shl      ax, 1
1:0091  d1e0              shl      ax, 1
1:0093  2bd8              sub      bx, ax
1:0095  8b07              mov      ax, word ptr [bx]
1:0097  8b5702            mov      dx, word ptr [bx + 2]
1:009A  ebd5              jmp      0x71
1:009C  4d                dec      bp
1:009D  4d                dec      bp
1:009E  8be5              mov      sp, bp
1:00A0  1f                pop      ds
1:00A1  5d                pop      bp
1:00A2  4d                dec      bp
1:00A3  cb                retf     
1:00A4  1e                push     ds
1:00A5  58                pop      ax
1:00A6  90                nop      
1:00A7  45                inc      bp
1:00A8  55                push     bp
1:00A9  8bec              mov      bp, sp
1:00AB  1e                push     ds
1:00AC  8ed8              mov      ds, ax
1:00AE  8b4606            mov      ax, word ptr [bp + 6]
1:00B1  053c00            add      ax, 0x3c
1:00B4  b9f000            mov      cx, 0xf0
1:00B7  99                cdq      
1:00B8  f7f9              idiv     cx
1:00BA  52                push     dx
1:00BB  0e                push     cs
1:00BC  e853ff            call     0x12
1:00BF  5b                pop      bx
1:00C0  4d                dec      bp
1:00C1  4d                dec      bp
1:00C2  8be5              mov      sp, bp
1:00C4  1f                pop      ds
1:00C5  5d                pop      bp
1:00C6  4d                dec      bp
1:00C7  cb                retf     
1:00C8  1e                push     ds
1:00C9  58                pop      ax
1:00CA  90                nop      
1:00CB  45                inc      bp
1:00CC  55                push     bp
1:00CD  8bec              mov      bp, sp
1:00CF  1e                push     ds
1:00D0  8ed8              mov      ds, ax
1:00D2  83ec0a            sub      sp, 0xa
1:00D5  56                push     si
1:00D6  ff369c11          push     word ptr [0x119c]
1:00DA  b81000            mov      ax, 0x10
1:00DD  1e                push     ds
1:00DE  50                push     ax
1:00DF  b80a00            mov      ax, 0xa
1:00E2  99                cdq      
1:00E3  52                push     dx
1:00E4  50                push     ax
1:00E5  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.FindResource
1:00EA  ff369c11          push     word ptr [0x119c]
1:00EE  50                push     ax
1:00EF  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LoadResource
1:00F4  8946f8            mov      word ptr [bp - 8], ax
1:00F7  50                push     ax
1:00F8  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LockResource
1:00FD  8946fa            mov      word ptr [bp - 6], ax
1:0100  8956fc            mov      word ptr [bp - 4], dx
1:0103  c746f60000        mov      word ptr [bp - 0xa], 0
1:0108  8e46fc            mov      es, word ptr [bp - 4]
1:010B  8b5ef6            mov      bx, word ptr [bp - 0xa]
1:010E  d1e3              shl      bx, 1
1:0110  d1e3              shl      bx, 1
1:0112  8bc3              mov      ax, bx
1:0114  035efa            add      bx, word ptr [bp - 6]
1:0117  8bf0              mov      si, ax
1:0119  268b8ff400        mov      cx, word ptr es:[bx + 0xf4]
1:011E  268b97f600        mov      dx, word ptr es:[bx + 0xf6]
1:0123  898cc60e          mov      word ptr [si + 0xec6], cx
1:0127  8994c80e          mov      word ptr [si + 0xec8], dx
1:012B  268b8ff402        mov      cx, word ptr es:[bx + 0x2f4]
1:0130  268b97f602        mov      dx, word ptr es:[bx + 0x2f6]
1:0135  898cc20c          mov      word ptr [si + 0xcc2], cx
1:0139  8994c40c          mov      word ptr [si + 0xcc4], dx
1:013D  ff46f6            inc      word ptr [bp - 0xa]
1:0140  817ef68000        cmp      word ptr [bp - 0xa], 0x80
1:0145  7cc4              jl       0x10b
1:0147  ff76f8            push     word ptr [bp - 8]
1:014A  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalUnlock
1:014F  ff76f8            push     word ptr [bp - 8]
1:0152  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.FreeResource
1:0157  5e                pop      si
1:0158  4d                dec      bp
1:0159  4d                dec      bp
1:015A  8be5              mov      sp, bp
1:015C  1f                pop      ds
1:015D  5d                pop      bp
1:015E  4d                dec      bp
1:015F  cb                retf     
1:0160  1e                push     ds
1:0161  58                pop      ax
1:0162  90                nop      
1:0163  45                inc      bp
1:0164  55                push     bp
1:0165  8bec              mov      bp, sp
1:0167  1e                push     ds
1:0168  8ed8              mov      ds, ax
1:016A  ff36a605          push     word ptr [0x5a6]
1:016E  ff36a405          push     word ptr [0x5a4]
1:0172  ff36a205          push     word ptr [0x5a2]
1:0176  ff36a005          push     word ptr [0x5a0]
1:017A  9aa8010000        lcall    0, 0x1a8  ; @1:INT:ord_5(1:3D21)
1:017F  83c408            add      sp, 8
1:0182  a3d421            mov      word ptr [0x21d4], ax
1:0185  8916d621          mov      word ptr [0x21d6], dx
1:0189  a3c021            mov      word ptr [0x21c0], ax
1:018C  8916c221          mov      word ptr [0x21c2], dx
1:0190  a3ac21            mov      word ptr [0x21ac], ax
1:0193  8916ae21          mov      word ptr [0x21ae], dx
1:0197  ff36ae05          push     word ptr [0x5ae]
1:019B  ff36ac05          push     word ptr [0x5ac]
1:019F  ff36aa05          push     word ptr [0x5aa]
1:01A3  ff36a805          push     word ptr [0x5a8]
1:01A7  9ad5010000        lcall    0, 0x1d5  ; @1:INT:ord_5(1:3D21)
1:01AC  83c408            add      sp, 8
1:01AF  a3d821            mov      word ptr [0x21d8], ax
1:01B2  8916da21          mov      word ptr [0x21da], dx
1:01B6  a3c421            mov      word ptr [0x21c4], ax
1:01B9  8916c621          mov      word ptr [0x21c6], dx
1:01BD  a3b021            mov      word ptr [0x21b0], ax
1:01C0  8916b221          mov      word ptr [0x21b2], dx
1:01C4  ff36b605          push     word ptr [0x5b6]
1:01C8  ff36b405          push     word ptr [0x5b4]
1:01CC  ff36b205          push     word ptr [0x5b2]
1:01D0  ff36b005          push     word ptr [0x5b0]
1:01D4  9a02020000        lcall    0, 0x202  ; @1:INT:ord_5(1:3D21)
1:01D9  83c408            add      sp, 8
1:01DC  a3dc21            mov      word ptr [0x21dc], ax
1:01DF  8916de21          mov      word ptr [0x21de], dx
1:01E3  a3c821            mov      word ptr [0x21c8], ax
1:01E6  8916ca21          mov      word ptr [0x21ca], dx
1:01EA  a3b421            mov      word ptr [0x21b4], ax
1:01ED  8916b621          mov      word ptr [0x21b6], dx
1:01F1  ff36be05          push     word ptr [0x5be]
1:01F5  ff36bc05          push     word ptr [0x5bc]
1:01F9  ff36ba05          push     word ptr [0x5ba]
1:01FD  ff36b805          push     word ptr [0x5b8]
1:0201  9a2f020000        lcall    0, 0x22f  ; @1:INT:ord_5(1:3D21)
1:0206  83c408            add      sp, 8
1:0209  a3e021            mov      word ptr [0x21e0], ax
1:020C  8916e221          mov      word ptr [0x21e2], dx
1:0210  a3cc21            mov      word ptr [0x21cc], ax
1:0213  8916ce21          mov      word ptr [0x21ce], dx
1:0217  a3b821            mov      word ptr [0x21b8], ax
1:021A  8916ba21          mov      word ptr [0x21ba], dx
1:021E  ff36c605          push     word ptr [0x5c6]
1:0222  ff36c405          push     word ptr [0x5c4]
1:0226  ff36c205          push     word ptr [0x5c2]
1:022A  ff36c005          push     word ptr [0x5c0]
1:022E  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_5(1:3D21)
1:0233  83c408            add      sp, 8
1:0236  a3e421            mov      word ptr [0x21e4], ax
1:0239  8916e621          mov      word ptr [0x21e6], dx
1:023D  a3d021            mov      word ptr [0x21d0], ax
1:0240  8916d221          mov      word ptr [0x21d2], dx
1:0244  a3bc21            mov      word ptr [0x21bc], ax
1:0247  8916be21          mov      word ptr [0x21be], dx
1:024B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_4(1:1550)
1:0250  b90500            mov      cx, 5
1:0253  99                cdq      
1:0254  f7f9              idiv     cx
1:0256  8bda              mov      bx, dx
1:0258  d1e3              shl      bx, 1
1:025A  d1e3              shl      bx, 1
1:025C  8b87ac21          mov      ax, word ptr [bx + 0x21ac]
1:0260  8b97ae21          mov      dx, word ptr [bx + 0x21ae]
1:0264  a3e821            mov      word ptr [0x21e8], ax
1:0267  8916ea21          mov      word ptr [0x21ea], dx
1:026B  4d                dec      bp
1:026C  4d                dec      bp
1:026D  8be5              mov      sp, bp
1:026F  1f                pop      ds
1:0270  5d                pop      bp
1:0271  4d                dec      bp
1:0272  cb                retf     
1:0273  1e                push     ds
1:0274  58                pop      ax
1:0275  90                nop      
1:0276  45                inc      bp
1:0277  55                push     bp
1:0278  8bec              mov      bp, sp
1:027A  1e                push     ds
1:027B  8ed8              mov      ds, ax
1:027D  83ec0a            sub      sp, 0xa
1:0280  56                push     si
1:0281  ff369c11          push     word ptr [0x119c]
1:0285  b81500            mov      ax, 0x15
1:0288  1e                push     ds
1:0289  50                push     ax
1:028A  b80a00            mov      ax, 0xa
1:028D  99                cdq      
1:028E  52                push     dx
1:028F  50                push     ax
1:0290  9ae6000000        lcall    0, 0xe6  ; @1:KERNEL.FindResource
1:0295  ff369c11          push     word ptr [0x119c]
1:0299  50                push     ax
1:029A  9af0000000        lcall    0, 0xf0  ; @1:KERNEL.LoadResource
1:029F  8946f8            mov      word ptr [bp - 8], ax
1:02A2  50                push     ax
1:02A3  9af9000000        lcall    0, 0xf9  ; @1:KERNEL.LockResource
1:02A8  8946fa            mov      word ptr [bp - 6], ax
1:02AB  8956fc            mov      word ptr [bp - 4], dx
1:02AE  c746f60000        mov      word ptr [bp - 0xa], 0
1:02B3  8e46fc            mov      es, word ptr [bp - 4]
1:02B6  8b5ef6            mov      bx, word ptr [bp - 0xa]
1:02B9  d1e3              shl      bx, 1
1:02BB  d1e3              shl      bx, 1
1:02BD  8b76fa            mov      si, word ptr [bp - 6]
1:02C0  268b00            mov      ax, word ptr es:[bx + si]
1:02C3  268b5002          mov      dx, word ptr es:[bx + si + 2]
1:02C7  8987ac20          mov      word ptr [bx + 0x20ac], ax
1:02CB  8997ae20          mov      word ptr [bx + 0x20ae], dx
1:02CF  ff46f6            inc      word ptr [bp - 0xa]
1:02D2  837ef640          cmp      word ptr [bp - 0xa], 0x40
1:02D6  7cde              jl       0x2b6
1:02D8  ff76f8            push     word ptr [bp - 8]
1:02DB  9a4b010000        lcall    0, 0x14b  ; @1:KERNEL.GlobalUnlock
1:02E0  ff76f8            push     word ptr [bp - 8]
1:02E3  9a53010000        lcall    0, 0x153  ; @1:KERNEL.FreeResource
1:02E8  5e                pop      si
1:02E9  4d                dec      bp
1:02EA  4d                dec      bp
1:02EB  8be5              mov      sp, bp
1:02ED  1f                pop      ds
1:02EE  5d                pop      bp
1:02EF  4d                dec      bp
1:02F0  cb                retf     
1:02F1  1e                push     ds
1:02F2  58                pop      ax
1:02F3  90                nop      
1:02F4  45                inc      bp
1:02F5  55                push     bp
1:02F6  8bec              mov      bp, sp
1:02F8  1e                push     ds
1:02F9  8ed8              mov      ds, ax
1:02FB  83ec14            sub      sp, 0x14
1:02FE  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:02FF  df4606            fild     word ptr [bp + 6]
1:0302  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0303  dd5eec            fstp     qword ptr [bp - 0x14]
1:0306  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:0307  9b                wait     
1:0308  c746f40000        mov      word ptr [bp - 0xc], 0
1:030D  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:030E  df46f4            fild     word ptr [bp - 0xc]
1:0311  83ec08            sub      sp, 8
1:0314  8bdc              mov      bx, sp
1:0316  9b                wait       ; @0:OSFIXUP:FISRQQ/FJSRQQ (add,t=5)
1:0317  36dd1f            fstp     qword ptr ss:[bx]
1:031A  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:031B  9b                wait     
1:031C  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_6(1:1728)
1:0321  83c408            add      sp, 8
1:0324  8bd8              mov      bx, ax
1:0326  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0327  dd07              fld      qword ptr [bx]
1:0329  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:032A  dc0ec805          fmul     qword ptr [0x5c8]
1:032E  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:032F  dc4eec            fmul     qword ptr [bp - 0x14]
1:0332  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0333  dd5ef6            fstp     qword ptr [bp - 0xa]
1:0336  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:0337  9b                wait     
1:0338  ff76fc            push     word ptr [bp - 4]
1:033B  ff76fa            push     word ptr [bp - 6]
1:033E  ff76f8            push     word ptr [bp - 8]
1:0341  ff76f6            push     word ptr [bp - 0xa]
1:0344  9a7b010000        lcall    0, 0x17b  ; @1:INT:ord_5(1:3D21)
1:0349  83c408            add      sp, 8
1:034C  8b5ef4            mov      bx, word ptr [bp - 0xc]
1:034F  d1e3              shl      bx, 1
1:0351  d1e3              shl      bx, 1
1:0353  8987fc0b          mov      word ptr [bx + 0xbfc], ax
1:0357  8997fe0b          mov      word ptr [bx + 0xbfe], dx
1:035B  ff46f4            inc      word ptr [bp - 0xc]
1:035E  837ef420          cmp      word ptr [bp - 0xc], 0x20
1:0362  7ca9              jl       0x30d
1:0364  4d                dec      bp
1:0365  4d                dec      bp
1:0366  8be5              mov      sp, bp
1:0368  1f                pop      ds
1:0369  5d                pop      bp
1:036A  4d                dec      bp
1:036B  cb                retf     
1:036C  1e                push     ds
1:036D  58                pop      ax
1:036E  90                nop      
1:036F  45                inc      bp
1:0370  55                push     bp
1:0371  8bec              mov      bp, sp
1:0373  1e                push     ds
1:0374  8ed8              mov      ds, ax
1:0376  0e                push     cs
1:0377  e8e6fd            call     0x160
1:037A  0e                push     cs
1:037B  e8f5fe            call     0x273
1:037E  ff36a611          push     word ptr [0x11a6]
1:0382  0e                push     cs
1:0383  e86bff            call     0x2f1
1:0386  5b                pop      bx
1:0387  4d                dec      bp
1:0388  4d                dec      bp
1:0389  8be5              mov      sp, bp
1:038B  1f                pop      ds
1:038C  5d                pop      bp
1:038D  4d                dec      bp
1:038E  cb                retf     
1:038F  1e                push     ds
1:0390  58                pop      ax
1:0391  90                nop      
1:0392  45                inc      bp
1:0393  55                push     bp
1:0394  8bec              mov      bp, sp
1:0396  1e                push     ds
1:0397  8ed8              mov      ds, ax
1:0399  83ec06            sub      sp, 6
1:039C  57                push     di
1:039D  56                push     si
1:039E  837e060e          cmp      word ptr [bp + 6], 0xe
1:03A2  7d07              jge      0x3ab
1:03A4  c746060600        mov      word ptr [bp + 6], 6
1:03A9  eb46              jmp      0x3f1
1:03AB  837e061d          cmp      word ptr [bp + 6], 0x1d
1:03AF  7d07              jge      0x3b8
1:03B1  c746060500        mov      word ptr [bp + 6], 5
1:03B6  eb39              jmp      0x3f1
1:03B8  837e062b          cmp      word ptr [bp + 6], 0x2b
1:03BC  7d07              jge      0x3c5
1:03BE  c746060400        mov      word ptr [bp + 6], 4
1:03C3  eb2c              jmp      0x3f1
1:03C5  837e0639          cmp      word ptr [bp + 6], 0x39
1:03C9  7d07              jge      0x3d2
1:03CB  c746060300        mov      word ptr [bp + 6], 3
1:03D0  eb1f              jmp      0x3f1
1:03D2  837e0647          cmp      word ptr [bp + 6], 0x47
1:03D6  7d07              jge      0x3df
1:03D8  c746060200        mov      word ptr [bp + 6], 2
1:03DD  eb12              jmp      0x3f1
1:03DF  837e0656          cmp      word ptr [bp + 6], 0x56
1:03E3  7d07              jge      0x3ec
1:03E5  c746060100        mov      word ptr [bp + 6], 1
1:03EA  eb05              jmp      0x3f1
1:03EC  c746060000        mov      word ptr [bp + 6], 0
1:03F1  837e0811          cmp      word ptr [bp + 8], 0x11
1:03F5  7d07              jge      0x3fe
1:03F7  c746080500        mov      word ptr [bp + 8], 5
1:03FC  eb39              jmp      0x437
1:03FE  837e0821          cmp      word ptr [bp + 8], 0x21
1:0402  7d07              jge      0x40b
1:0404  c746080400        mov      word ptr [bp + 8], 4
1:0409  eb2c              jmp      0x437
1:040B  837e0832          cmp      word ptr [bp + 8], 0x32
1:040F  7d07              jge      0x418
1:0411  c746080300        mov      word ptr [bp + 8], 3
1:0416  eb1f              jmp      0x437
1:0418  837e0843          cmp      word ptr [bp + 8], 0x43
1:041C  7d07              jge      0x425
1:041E  c746080200        mov      word ptr [bp + 8], 2
1:0423  eb12              jmp      0x437
1:0425  837e0853          cmp      word ptr [bp + 8], 0x53
1:0429  7d07              jge      0x432
1:042B  c746080100        mov      word ptr [bp + 8], 1
1:0430  eb05              jmp      0x437
1:0432  c746080000        mov      word ptr [bp + 8], 0
1:0437  8b4606            mov      ax, word ptr [bp + 6]
1:043A  e9aa00            jmp      0x4e7
1:043D  b8e809            mov      ax, 0x9e8
1:0440  56                push     si
1:0441  8bf8              mov      di, ax
1:0443  bed005            mov      si, 0x5d0
1:0446  1e                push     ds
1:0447  07                pop      es
1:0448  a5                movsw    word ptr es:[di], word ptr [si]
1:0449  a5                movsw    word ptr es:[di], word ptr [si]
1:044A  a5                movsw    word ptr es:[di], word ptr [si]
1:044B  a5                movsw    word ptr es:[di], word ptr [si]
1:044C  5e                pop      si
1:044D  c706c6101400      mov      word ptr [0x10c6], 0x14
1:0453  e9ac00            jmp      0x502
1:0456  b8e809            mov      ax, 0x9e8
1:0459  56                push     si
1:045A  8bf8              mov      di, ax
1:045C  bed805            mov      si, 0x5d8
1:045F  1e                push     ds
1:0460  07                pop      es
1:0461  a5                movsw    word ptr es:[di], word ptr [si]
1:0462  a5                movsw    word ptr es:[di], word ptr [si]
1:0463  a5                movsw    word ptr es:[di], word ptr [si]
1:0464  a5                movsw    word ptr es:[di], word ptr [si]
1:0465  5e                pop      si
1:0466  c706c6100f00      mov      word ptr [0x10c6], 0xf
1:046C  e99300            jmp      0x502
1:046F  b8e809            mov      ax, 0x9e8
1:0472  56                push     si
1:0473  8bf8              mov      di, ax
1:0475  bee005            mov      si, 0x5e0
1:0478  1e                push     ds
1:0479  07                pop      es
1:047A  a5                movsw    word ptr es:[di], word ptr [si]
1:047B  a5                movsw    word ptr es:[di], word ptr [si]
1:047C  a5                movsw    word ptr es:[di], word ptr [si]
1:047D  a5                movsw    word ptr es:[di], word ptr [si]
1:047E  5e                pop      si
1:047F  c706c6100a00      mov      word ptr [0x10c6], 0xa
1:0485  eb7b              jmp      0x502
1:0487  b8e809            mov      ax, 0x9e8
1:048A  56                push     si
1:048B  8bf8              mov      di, ax
1:048D  bee805            mov      si, 0x5e8
1:0490  1e                push     ds
1:0491  07                pop      es
1:0492  a5                movsw    word ptr es:[di], word ptr [si]
1:0493  a5                movsw    word ptr es:[di], word ptr [si]
1:0494  a5                movsw    word ptr es:[di], word ptr [si]
1:0495  a5                movsw    word ptr es:[di], word ptr [si]
1:0496  5e                pop      si
1:0497  c706c6100600      mov      word ptr [0x10c6], 6
1:049D  eb63              jmp      0x502
1:049F  b8e809            mov      ax, 0x9e8
1:04A2  56                push     si
1:04A3  8bf8              mov      di, ax
1:04A5  bef005            mov      si, 0x5f0
1:04A8  1e                push     ds
1:04A9  07                pop      es
1:04AA  a5                movsw    word ptr es:[di], word ptr [si]
1:04AB  a5                movsw    word ptr es:[di], word ptr [si]
1:04AC  a5                movsw    word ptr es:[di], word ptr [si]
1:04AD  a5                movsw    word ptr es:[di], word ptr [si]
1:04AE  5e                pop      si
1:04AF  c706c6100400      mov      word ptr [0x10c6], 4
1:04B5  eb4b              jmp      0x502
1:04B7  b8e809            mov      ax, 0x9e8
1:04BA  56                push     si
1:04BB  8bf8              mov      di, ax
1:04BD  bef805            mov      si, 0x5f8
1:04C0  1e                push     ds
1:04C1  07                pop      es
1:04C2  a5                movsw    word ptr es:[di], word ptr [si]
1:04C3  a5                movsw    word ptr es:[di], word ptr [si]
1:04C4  a5                movsw    word ptr es:[di], word ptr [si]
1:04C5  a5                movsw    word ptr es:[di], word ptr [si]
1:04C6  5e                pop      si
1:04C7  c706c6100200      mov      word ptr [0x10c6], 2
1:04CD  eb33              jmp      0x502
1:04CF  b8e809            mov      ax, 0x9e8
1:04D2  56                push     si
1:04D3  8bf8              mov      di, ax
1:04D5  be0006            mov      si, 0x600
1:04D8  1e                push     ds
1:04D9  07                pop      es
1:04DA  a5                movsw    word ptr es:[di], word ptr [si]
1:04DB  a5                movsw    word ptr es:[di], word ptr [si]
1:04DC  a5                movsw    word ptr es:[di], word ptr [si]
1:04DD  a5                movsw    word ptr es:[di], word ptr [si]
1:04DE  5e                pop      si
1:04DF  c706c6100100      mov      word ptr [0x10c6], 1
1:04E5  eb1b              jmp      0x502
1:04E7  3d0600            cmp      ax, 6
1:04EA  7716              ja       0x502
1:04EC  d1e0              shl      ax, 1
1:04EE  93                xchg     bx, ax
1:04EF  2effa7f404        jmp      word ptr cs:[bx + 0x4f4]
1:04F4  3d0456            cmp      ax, 0x5604
1:04F7  046f              add      al, 0x6f
1:04F9  0487              add      al, 0x87
1:04FB  049f              add      al, 0x9f
1:04FD  04b7              add      al, 0xb7
1:04FF  04cf              add      al, 0xcf
1:0501  04ff              add      al, 0xff
1:0503  36ee              out      dx, al
1:0505  09ff              or       di, di
1:0507  36ec              in       al, dx
1:0509  09ff              or       di, di
1:050B  36ea09ff36e8      ljmp     0xe836:0xff09
1:0511  099a0607          or       word ptr [bp + si + 0x706], bx  ; @2:INT:ord_5(1:3D21)
1:0515  0000              add      byte ptr [bx + si], al
1:0517  83c408            add      sp, 8
1:051A  a3a80c            mov      word ptr [0xca8], ax
1:051D  8916aa0c          mov      word ptr [0xcaa], dx
1:0521  837e0800          cmp      word ptr [bp + 8], 0
1:0525  7509              jne      0x530
1:0527  c706ae0cc003      mov      word ptr [0xcae], 0x3c0
1:052D  e9c900            jmp      0x5f9
1:0530  837e0801          cmp      word ptr [bp + 8], 1
1:0534  7509              jne      0x53f
1:0536  c706ae0cd002      mov      word ptr [0xcae], 0x2d0
1:053C  e9ba00            jmp      0x5f9
1:053F  837e0802          cmp      word ptr [bp + 8], 2
1:0543  7509              jne      0x54e
1:0545  c706ae0ce001      mov      word ptr [0xcae], 0x1e0
1:054B  e9ab00            jmp      0x5f9
1:054E  833ec61001        cmp      word ptr [0x10c6], 1
1:0553  7407              je       0x55c
1:0555  833ec61002        cmp      word ptr [0x10c6], 2
1:055A  7537              jne      0x593
1:055C  837e0804          cmp      word ptr [bp + 8], 4
1:0560  7508              jne      0x56a
1:0562  c706ae0cf000      mov      word ptr [0xcae], 0xf0
1:0568  eb29              jmp      0x593
1:056A  833ec61001        cmp      word ptr [0x10c6], 1
1:056F  750e              jne      0x57f
1:0571  837e0803          cmp      word ptr [bp + 8], 3
1:0575  75eb              jne      0x562
1:0577  c706ae0ce001      mov      word ptr [0xcae], 0x1e0
1:057D  eb14              jmp      0x593
1:057F  837e0803          cmp      word ptr [bp + 8], 3
1:0583  7508              jne      0x58d
1:0585  c706ae0c6801      mov      word ptr [0xcae], 0x168
1:058B  eb06              jmp      0x593
1:058D  c706ae0c7800      mov      word ptr [0xcae], 0x78
1:0593  833ec61004        cmp      word ptr [0x10c6], 4
1:0598  7407              je       0x5a1
1:059A  833ec61006        cmp      word ptr [0x10c6], 6
1:059F  7516              jne      0x5b7
1:05A1  8b4608            mov      ax, word ptr [bp + 8]
1:05A4  2d0300            sub      ax, 3
1:05A7  7408              je       0x5b1
1:05A9  48                dec      ax
1:05AA  7428              je       0x5d4
1:05AC  48                dec      ax
1:05AD  742d              je       0x5dc
1:05AF  eb06              jmp      0x5b7
1:05B1  c706ae0cf000      mov      word ptr [0xcae], 0xf0
1:05B7  833ec6100a        cmp      word ptr [0x10c6], 0xa
1:05BC  7c3b              jl       0x5f9
1:05BE  8b4608            mov      ax, word ptr [bp + 8]
1:05C1  2d0300            sub      ax, 3
1:05C4  742d              je       0x5f3
1:05C6  48                dec      ax
1:05C7  7503              jne      0x5cc
1:05C9  e95001            jmp      0x71c
1:05CC  48                dec      ax
1:05CD  7503              jne      0x5d2
1:05CF  e95301            jmp      0x725
1:05D2  eb25              jmp      0x5f9
1:05D4  c706ae0c7800      mov      word ptr [0xcae], 0x78
1:05DA  ebdb              jmp      0x5b7
1:05DC  833ec61004        cmp      word ptr [0x10c6], 4
1:05E1  7508              jne      0x5eb
1:05E3  c706ae0c3c00      mov      word ptr [0xcae], 0x3c
1:05E9  ebcc              jmp      0x5b7
1:05EB  c706ae0c2800      mov      word ptr [0xcae], 0x28
1:05F1  ebc4              jmp      0x5b7
1:05F3  c706ae0c2001      mov      word ptr [0xcae], 0x120
1:05F9  9a17060000        lcall    0, 0x617  ; @1:INT:ord_4(1:1550)
1:05FE  8bd8              mov      bx, ax
1:0600  83e33f            and      bx, 0x3f
1:0603  d1e3              shl      bx, 1
1:0605  d1e3              shl      bx, 1
1:0607  8b87ac20          mov      ax, word ptr [bx + 0x20ac]
1:060B  8b97ae20          mov      dx, word ptr [bx + 0x20ae]
1:060F  a38a0c            mov      word ptr [0xc8a], ax
1:0612  89168c0c          mov      word ptr [0xc8c], dx
1:0616  9a34060000        lcall    0, 0x634  ; @1:INT:ord_4(1:1550)
1:061B  8bd8              mov      bx, ax
1:061D  83e30f            and      bx, 0xf
1:0620  d1e3              shl      bx, 1
1:0622  d1e3              shl      bx, 1
1:0624  8b87ac21          mov      ax, word ptr [bx + 0x21ac]
1:0628  8b97ae21          mov      dx, word ptr [bx + 0x21ae]
1:062C  a3a00c            mov      word ptr [0xca0], ax
1:062F  8916a20c          mov      word ptr [0xca2], dx
1:0633  9a75060000        lcall    0, 0x675  ; @1:INT:ord_4(1:1550)
1:0638  8bd8              mov      bx, ax
1:063A  83e31f            and      bx, 0x1f
1:063D  d1e3              shl      bx, 1
1:063F  d1e3              shl      bx, 1
1:0641  8b87fc0b          mov      ax, word ptr [bx + 0xbfc]
1:0645  8b97fe0b          mov      dx, word ptr [bx + 0xbfe]
1:0649  a3b60c            mov      word ptr [0xcb6], ax
1:064C  8916b80c          mov      word ptr [0xcb8], dx
1:0650  a1a00c            mov      ax, word ptr [0xca0]
1:0653  8b16a20c          mov      dx, word ptr [0xca2]
1:0657  a39c0c            mov      word ptr [0xc9c], ax
1:065A  89169e0c          mov      word ptr [0xc9e], dx
1:065E  a18a0c            mov      ax, word ptr [0xc8a]
1:0661  8b168c0c          mov      dx, word ptr [0xc8c]
1:0665  a3840c            mov      word ptr [0xc84], ax
1:0668  8916860c          mov      word ptr [0xc86], dx
1:066C  2bc0              sub      ax, ax
1:066E  a3b20c            mov      word ptr [0xcb2], ax
1:0671  a3b00c            mov      word ptr [0xcb0], ax
1:0674  9a92060000        lcall    0, 0x692  ; @1:INT:ord_4(1:1550)
1:0679  8bd8              mov      bx, ax
1:067B  83e33f            and      bx, 0x3f
1:067E  d1e3              shl      bx, 1
1:0680  d1e3              shl      bx, 1
1:0682  8b87ac20          mov      ax, word ptr [bx + 0x20ac]
1:0686  8b97ae20          mov      dx, word ptr [bx + 0x20ae]
1:068A  a38a0c            mov      word ptr [0xc8a], ax
1:068D  89168c0c          mov      word ptr [0xc8c], dx
1:0691  9aaf060000        lcall    0, 0x6af  ; @1:INT:ord_4(1:1550)
1:0696  8bd8              mov      bx, ax
1:0698  83e30f            and      bx, 0xf
1:069B  d1e3              shl      bx, 1
1:069D  d1e3              shl      bx, 1
1:069F  8b87ac21          mov      ax, word ptr [bx + 0x21ac]
1:06A3  8b97ae21          mov      dx, word ptr [bx + 0x21ae]
1:06A7  a3a00c            mov      word ptr [0xca0], ax
1:06AA  8916a20c          mov      word ptr [0xca2], dx
1:06AE  9a4c020000        lcall    0, 0x24c  ; @1:INT:ord_4(1:1550)
1:06B3  8bd8              mov      bx, ax
1:06B5  83e31f            and      bx, 0x1f
1:06B8  d1e3              shl      bx, 1
1:06BA  d1e3              shl      bx, 1
1:06BC  8b87fc0b          mov      ax, word ptr [bx + 0xbfc]
1:06C0  8b97fe0b          mov      dx, word ptr [bx + 0xbfe]
1:06C4  a3b60c            mov      word ptr [0xcb6], ax
1:06C7  8916b80c          mov      word ptr [0xcb8], dx
1:06CB  a19c0c            mov      ax, word ptr [0xc9c]
1:06CE  8b169e0c          mov      dx, word ptr [0xc9e]
1:06D2  a3a40c            mov      word ptr [0xca4], ax
1:06D5  8916a60c          mov      word ptr [0xca6], dx
1:06D9  a1840c            mov      ax, word ptr [0xc84]
1:06DC  8b16860c          mov      dx, word ptr [0xc86]
1:06E0  a3980c            mov      word ptr [0xc98], ax
1:06E3  89169a0c          mov      word ptr [0xc9a], dx
1:06E7  a1b00c            mov      ax, word ptr [0xcb0]
1:06EA  8b16b20c          mov      dx, word ptr [0xcb2]
1:06EE  a3be0c            mov      word ptr [0xcbe], ax
1:06F1  8916c00c          mov      word ptr [0xcc0], dx
1:06F5  ff36a605          push     word ptr [0x5a6]
1:06F9  ff36a405          push     word ptr [0x5a4]
1:06FD  ff36a205          push     word ptr [0x5a2]
1:0701  ff36a005          push     word ptr [0x5a0]
1:0705  9a45030000        lcall    0, 0x345  ; @1:INT:ord_5(1:3D21)
1:070A  83c408            add      sp, 8
1:070D  a3940c            mov      word ptr [0xc94], ax
1:0710  8916960c          mov      word ptr [0xc96], dx
1:0714  2bf6              sub      si, si
1:0716  8936a811          mov      word ptr [0x11a8], si
1:071A  eb33              jmp      0x74f
1:071C  c706ae0c6000      mov      word ptr [0xcae], 0x60
1:0722  e9d4fe            jmp      0x5f9
1:0725  833ec6100a        cmp      word ptr [0x10c6], 0xa
1:072A  7509              jne      0x735
1:072C  c706ae0c1800      mov      word ptr [0xcae], 0x18
1:0732  e9c4fe            jmp      0x5f9
1:0735  833ec6100f        cmp      word ptr [0x10c6], 0xf
1:073A  7509              jne      0x745
1:073C  c706ae0c1000      mov      word ptr [0xcae], 0x10
1:0742  e9b4fe            jmp      0x5f9
1:0745  c706ae0c0c00      mov      word ptr [0xcae], 0xc
1:074B  e9abfe            jmp      0x5f9
1:074E  46                inc      si
1:074F  3936ae0c          cmp      word ptr [0xcae], si
1:0753  7e12              jle      0x767
1:0755  2bc0              sub      ax, ax
1:0757  8bde              mov      bx, si
1:0759  d1e3              shl      bx, 1
1:075B  d1e3              shl      bx, 1
1:075D  8987ac11          mov      word ptr [bx + 0x11ac], ax
1:0761  8987aa11          mov      word ptr [bx + 0x11aa], ax
1:0765  ebe7              jmp      0x74e
1:0767  2bf6              sub      si, si
1:0769  8976fa            mov      word ptr [bp - 6], si
1:076C  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:076D  df46fa            fild     word ptr [bp - 6]
1:0770  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0771  dc0e0806          fmul     qword ptr [0x608]
1:0775  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0776  dc0e1006          fmul     qword ptr [0x610]
1:077A  83ec08            sub      sp, 8
1:077D  8bdc              mov      bx, sp
1:077F  9b                wait       ; @0:OSFIXUP:FISRQQ/FJSRQQ (add,t=5)
1:0780  36dd1f            fstp     qword ptr ss:[bx]
1:0783  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:0784  9b                wait     
1:0785  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:1734)
1:078A  83c408            add      sp, 8
1:078D  8bd8              mov      bx, ax
1:078F  ff7706            push     word ptr [bx + 6]
1:0792  ff7704            push     word ptr [bx + 4]
1:0795  ff7702            push     word ptr [bx + 2]
1:0798  ff37              push     word ptr [bx]
1:079A  9a13050000        lcall    0, 0x513  ; @1:INT:ord_5(1:3D21)
1:079F  83c408            add      sp, 8
1:07A2  8bde              mov      bx, si
1:07A4  d1e3              shl      bx, 1
1:07A6  d1e3              shl      bx, 1
1:07A8  8987020b          mov      word ptr [bx + 0xb02], ax
1:07AC  8997040b          mov      word ptr [bx + 0xb04], dx
1:07B0  46                inc      si
1:07B1  83fe3c            cmp      si, 0x3c
1:07B4  7eb3              jle      0x769
1:07B6  2bc0              sub      ax, ax
1:07B8  a39611            mov      word ptr [0x1196], ax
1:07BB  a39411            mov      word ptr [0x1194], ax
1:07BE  5e                pop      si
1:07BF  5f                pop      di
1:07C0  4d                dec      bp
1:07C1  4d                dec      bp
1:07C2  8be5              mov      sp, bp
1:07C4  1f                pop      ds
1:07C5  5d                pop      bp
1:07C6  4d                dec      bp
1:07C7  cb                retf     
1:07C8  1e                push     ds
1:07C9  58                pop      ax
1:07CA  90                nop      
1:07CB  45                inc      bp
1:07CC  55                push     bp
1:07CD  8bec              mov      bp, sp
1:07CF  1e                push     ds
1:07D0  8ed8              mov      ds, ax
1:07D2  83ec34            sub      sp, 0x34
1:07D5  57                push     di
1:07D6  56                push     si
1:07D7  a1a40c            mov      ax, word ptr [0xca4]
1:07DA  8b16a60c          mov      dx, word ptr [0xca6]
1:07DE  8946d2            mov      word ptr [bp - 0x2e], ax
1:07E1  8956d4            mov      word ptr [bp - 0x2c], dx
1:07E4  a1980c            mov      ax, word ptr [0xc98]
1:07E7  8b169a0c          mov      dx, word ptr [0xc9a]
1:07EB  8946e2            mov      word ptr [bp - 0x1e], ax
1:07EE  8956e4            mov      word ptr [bp - 0x1c], dx
1:07F1  a1be0c            mov      ax, word ptr [0xcbe]
1:07F4  8b16c00c          mov      dx, word ptr [0xcc0]
1:07F8  8946ee            mov      word ptr [bp - 0x12], ax
1:07FB  8956f0            mov      word ptr [bp - 0x10], dx
1:07FE  8b36a811          mov      si, word ptr [0x11a8]
1:0802  a19411            mov      ax, word ptr [0x1194]
1:0805  a3f80b            mov      word ptr [0xbf8], ax
1:0808  8b0ea80c          mov      cx, word ptr [0xca8]
1:080C  8b16aa0c          mov      dx, word ptr [0xcaa]
1:0810  894ece            mov      word ptr [bp - 0x32], cx
1:0813  8956d0            mov      word ptr [bp - 0x30], dx
1:0816  0306c610          add      ax, word ptr [0x10c6]
1:081A  a3f80b            mov      word ptr [0xbf8], ax
1:081D  c41eec21          les      bx, ptr [0x21ec]
1:0821  26837f0a00        cmp      word ptr es:[bx + 0xa], 0
1:0826  7425              je       0x84d
1:0828  ff36920c          push     word ptr [0xc92]
1:082C  8bde              mov      bx, si
1:082E  d1e3              shl      bx, 1
1:0830  d1e3              shl      bx, 1
1:0832  031e9811          add      bx, word ptr [0x1198]
1:0836  ff7702            push     word ptr [bx + 2]
1:0839  ff37              push     word ptr [bx]
1:083B  b80200            mov      ax, 2
1:083E  50                push     ax
1:083F  50                push     ax
1:0840  b84200            mov      ax, 0x42
1:0843  99                cdq      
1:0844  52                push     dx
1:0845  50                push     ax
1:0846  9a0d0a0000        lcall    0, 0xa0d  ; @1:GDI.PatBlt
1:084B  eb20              jmp      0x86d
1:084D  ff36920c          push     word ptr [0xc92]
1:0851  8bde              mov      bx, si
1:0853  d1e3              shl      bx, 1
1:0855  d1e3              shl      bx, 1
1:0857  031e9811          add      bx, word ptr [0x1198]
1:085B  ff7702            push     word ptr [bx + 2]
1:085E  ff37              push     word ptr [bx]
1:0860  ff36820c          push     word ptr [0xc82]
1:0864  ff36800c          push     word ptr [0xc80]
1:0868  9a6a0a0000        lcall    0, 0xa6a  ; @1:GDI.SetPixel
1:086D  ff76d4            push     word ptr [bp - 0x2c]
1:0870  ff76d2            push     word ptr [bp - 0x2e]
1:0873  ff76d0            push     word ptr [bp - 0x30]
1:0876  ff76ce            push     word ptr [bp - 0x32]
1:0879  9a93080000        lcall    0, 0x893  ; @1:INT:ord_12(1:3D6D)
1:087E  83c408            add      sp, 8
1:0881  a3f809            mov      word ptr [0x9f8], ax
1:0884  8916fa09          mov      word ptr [0x9fa], dx
1:0888  ff367e0c          push     word ptr [0xc7e]
1:088C  ff367c0c          push     word ptr [0xc7c]
1:0890  52                push     dx
1:0891  50                push     ax
1:0892  9aba080000        lcall    0, 0x8ba  ; @1:INT:ord_12(1:3D6D)
1:0897  83c408            add      sp, 8
1:089A  8956da            mov      word ptr [bp - 0x26], dx
1:089D  8a46da            mov      al, byte ptr [bp - 0x26]
1:08A0  257f00            and      ax, 0x7f
1:08A3  8bf8              mov      di, ax
1:08A5  ff76e4            push     word ptr [bp - 0x1c]
1:08A8  ff76e2            push     word ptr [bp - 0x1e]
1:08AB  8bdf              mov      bx, di
1:08AD  d1e3              shl      bx, 1
1:08AF  d1e3              shl      bx, 1
1:08B1  ffb7c40c          push     word ptr [bx + 0xcc4]
1:08B5  ffb7c20c          push     word ptr [bx + 0xcc2]
1:08B9  9ae3080000        lcall    0, 0x8e3  ; @1:INT:ord_12(1:3D6D)
1:08BE  83c408            add      sp, 8
1:08C1  8946d8            mov      word ptr [bp - 0x28], ax
1:08C4  8956da            mov      word ptr [bp - 0x26], dx
1:08C7  ff36f80b          push     word ptr [0xbf8]
1:08CB  0e                push     cs
1:08CC  e8d5f7            call     0xa4
1:08CF  5b                pop      bx
1:08D0  0146d8            add      word ptr [bp - 0x28], ax
1:08D3  1156da            adc      word ptr [bp - 0x26], dx
1:08D6  ff76f0            push     word ptr [bp - 0x10]
1:08D9  ff76ee            push     word ptr [bp - 0x12]
1:08DC  ff76da            push     word ptr [bp - 0x26]
1:08DF  ff76d8            push     word ptr [bp - 0x28]
1:08E2  9a17090000        lcall    0, 0x917  ; @1:INT:ord_12(1:3D6D)
1:08E7  83c408            add      sp, 8
1:08EA  8bc2              mov      ax, dx
1:08EC  0306fa0b          add      ax, word ptr [0xbfa]
1:08F0  8bde              mov      bx, si
1:08F2  d1e3              shl      bx, 1
1:08F4  d1e3              shl      bx, 1
1:08F6  8bcb              mov      cx, bx
1:08F8  031e9811          add      bx, word ptr [0x1198]
1:08FC  894702            mov      word ptr [bx + 2], ax
1:08FF  ff76e4            push     word ptr [bp - 0x1c]
1:0902  ff76e2            push     word ptr [bp - 0x1e]
1:0905  8bdf              mov      bx, di
1:0907  d1e3              shl      bx, 1
1:0909  d1e3              shl      bx, 1
1:090B  ffb7c80e          push     word ptr [bx + 0xec8]
1:090F  ffb7c60e          push     word ptr [bx + 0xec6]
1:0913  894ecc            mov      word ptr [bp - 0x34], cx
1:0916  9a40090000        lcall    0, 0x940  ; @1:INT:ord_12(1:3D6D)
1:091B  83c408            add      sp, 8
1:091E  8946d8            mov      word ptr [bp - 0x28], ax
1:0921  8956da            mov      word ptr [bp - 0x26], dx
1:0924  ff36f80b          push     word ptr [0xbf8]
1:0928  0e                push     cs
1:0929  e8e6f6            call     0x12
1:092C  5b                pop      bx
1:092D  0146d8            add      word ptr [bp - 0x28], ax
1:0930  1156da            adc      word ptr [bp - 0x26], dx
1:0933  ff76f0            push     word ptr [bp - 0x10]
1:0936  ff76ee            push     word ptr [bp - 0x12]
1:0939  ff76da            push     word ptr [bp - 0x26]
1:093C  ff76d8            push     word ptr [bp - 0x28]
1:093F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:3D6D)
1:0944  83c408            add      sp, 8
1:0947  8946d8            mov      word ptr [bp - 0x28], ax
1:094A  8956da            mov      word ptr [bp - 0x26], dx
1:094D  a1b40c            mov      ax, word ptr [0xcb4]
1:0950  03c2              add      ax, dx
1:0952  8b5ecc            mov      bx, word ptr [bp - 0x34]
1:0955  031e9811          add      bx, word ptr [0x1198]
1:0959  8907              mov      word ptr [bx], ax
1:095B  b83200            mov      ax, 0x32
1:095E  99                cdq      
1:095F  52                push     dx
1:0960  50                push     ax
1:0961  b97e48            mov      cx, 0x487e
1:0964  bb0600            mov      bx, 6
1:0967  53                push     bx
1:0968  51                push     cx
1:0969  52                push     dx
1:096A  50                push     ax
1:096B  ff76d0            push     word ptr [bp - 0x30]
1:096E  ff76ce            push     word ptr [bp - 0x32]
1:0971  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:161A)
1:0976  52                push     dx
1:0977  50                push     ax
1:0978  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:1580)
1:097D  8bc8              mov      cx, ax
1:097F  a19611            mov      ax, word ptr [0x1196]
1:0982  8bda              mov      bx, dx
1:0984  99                cdq      
1:0985  03c1              add      ax, cx
1:0987  13d3              adc      dx, bx
1:0989  52                push     dx
1:098A  50                push     ax
1:098B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:164C)
1:0990  8bd8              mov      bx, ax
1:0992  d1e3              shl      bx, 1
1:0994  d1e3              shl      bx, 1
1:0996  8b87c810          mov      ax, word ptr [bx + 0x10c8]
1:099A  8b97ca10          mov      dx, word ptr [bx + 0x10ca]
1:099E  c41eec21          les      bx, ptr [0x21ec]
1:09A2  26837f0a00        cmp      word ptr es:[bx + 0xa], 0
1:09A7  747c              je       0xa25
1:09A9  ff36920c          push     word ptr [0xc92]
1:09AD  52                push     dx
1:09AE  50                push     ax
1:09AF  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateSolidBrush
1:09B4  50                push     ax
1:09B5  9a190a0000        lcall    0, 0xa19  ; @1:GDI.SelectObject
1:09BA  8946dc            mov      word ptr [bp - 0x24], ax
1:09BD  833ef60b00        cmp      word ptr [0xbf6], 0
1:09C2  7428              je       0x9ec
1:09C4  c41eba0c          les      bx, ptr [0xcba]
1:09C8  26837f0a01        cmp      word ptr es:[bx + 0xa], 1
1:09CD  7e1d              jle      0x9ec
1:09CF  ff36920c          push     word ptr [0xc92]
1:09D3  8b5ecc            mov      bx, word ptr [bp - 0x34]
1:09D6  031e9811          add      bx, word ptr [0x1198]
1:09DA  ff7702            push     word ptr [bx + 2]
1:09DD  ff37              push     word ptr [bx]
1:09DF  b80200            mov      ax, 2
1:09E2  50                push     ax
1:09E3  50                push     ax
1:09E4  b82100            mov      ax, 0x21
1:09E7  baf000            mov      dx, 0xf0
1:09EA  eb1e              jmp      0xa0a
1:09EC  ff36920c          push     word ptr [0xc92]
1:09F0  8bde              mov      bx, si
1:09F2  d1e3              shl      bx, 1
1:09F4  d1e3              shl      bx, 1
1:09F6  031e9811          add      bx, word ptr [0x1198]
1:09FA  ff7702            push     word ptr [bx + 2]
1:09FD  ff37              push     word ptr [bx]
1:09FF  b80200            mov      ax, 2
1:0A02  50                push     ax
1:0A03  50                push     ax
1:0A04  b86200            mov      ax, 0x62
1:0A07  baff00            mov      dx, 0xff
1:0A0A  52                push     dx
1:0A0B  50                push     ax
1:0A0C  9affff0000        lcall    0, 0xffff  ; @1:GDI.PatBlt
1:0A11  ff36920c          push     word ptr [0xc92]
1:0A15  ff76dc            push     word ptr [bp - 0x24]
1:0A18  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectObject
1:0A1D  50                push     ax
1:0A1E  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteObject
1:0A23  eb49              jmp      0xa6e
1:0A25  833ef60b00        cmp      word ptr [0xbf6], 0
1:0A2A  7422              je       0xa4e
1:0A2C  c41eba0c          les      bx, ptr [0xcba]
1:0A30  26837f0a01        cmp      word ptr es:[bx + 0xa], 1
1:0A35  7e17              jle      0xa4e
1:0A37  ff36920c          push     word ptr [0xc92]
1:0A3B  8bde              mov      bx, si
1:0A3D  d1e3              shl      bx, 1
1:0A3F  d1e3              shl      bx, 1
1:0A41  031e9811          add      bx, word ptr [0x1198]
1:0A45  ff7702            push     word ptr [bx + 2]
1:0A48  ff37              push     word ptr [bx]
1:0A4A  52                push     dx
1:0A4B  50                push     ax
1:0A4C  eb1b              jmp      0xa69
1:0A4E  ff36920c          push     word ptr [0xc92]
1:0A52  8bde              mov      bx, si
1:0A54  d1e3              shl      bx, 1
1:0A56  d1e3              shl      bx, 1
1:0A58  031e9811          add      bx, word ptr [0x1198]
1:0A5C  ff7702            push     word ptr [bx + 2]
1:0A5F  ff37              push     word ptr [bx]
1:0A61  ff369211          push     word ptr [0x1192]
1:0A65  ff369011          push     word ptr [0x1190]
1:0A69  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetPixel
1:0A6E  46                inc      si
1:0A6F  3936ae0c          cmp      word ptr [0xcae], si
1:0A73  7502              jne      0xa77
1:0A75  2bf6              sub      si, si
1:0A77  a1a80c            mov      ax, word ptr [0xca8]
1:0A7A  8b16aa0c          mov      dx, word ptr [0xcaa]
1:0A7E  0146ce            add      word ptr [bp - 0x32], ax
1:0A81  1156d0            adc      word ptr [bp - 0x30], dx
1:0A84  a19411            mov      ax, word ptr [0x1194]
1:0A87  05f000            add      ax, 0xf0
1:0A8A  8b0ec610          mov      cx, word ptr [0x10c6]
1:0A8E  010ef80b          add      word ptr [0xbf8], cx
1:0A92  3906f80b          cmp      word ptr [0xbf8], ax
1:0A96  7f03              jg       0xa9b
1:0A98  e982fd            jmp      0x81d
1:0A9B  a1f021            mov      ax, word ptr [0x21f0]
1:0A9E  8b16f221          mov      dx, word ptr [0x21f2]
1:0AA2  0106940c          add      word ptr [0xc94], ax
1:0AA6  1116960c          adc      word ptr [0xc96], dx
1:0AAA  ff36960c          push     word ptr [0xc96]
1:0AAE  ff36940c          push     word ptr [0xc94]
1:0AB2  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:3CFC)
1:0AB7  5b                pop      bx
1:0AB8  5b                pop      bx
1:0AB9  8bd8              mov      bx, ax
1:0ABB  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0ABC  dd07              fld      qword ptr [bx]
1:0ABE  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0ABF  dc161806          fcom     qword ptr [0x618]
1:0AC3  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0AC4  ddd8              fstp     st(0)
1:0AC6  9b                wait       ; @0:OSFIXUP:FIDRQQ (add,t=5)
1:0AC7  dd7ecc            fnstsw   word ptr [bp - 0x34]
1:0ACA  90                nop        ; @0:OSFIXUP:FIWRQQ (add,t=5)
1:0ACB  9b                wait     
1:0ACC  8a66cd            mov      ah, byte ptr [bp - 0x33]
1:0ACF  9e                sahf     
1:0AD0  7303              jae      0xad5
1:0AD2  e9a000            jmp      0xb75
1:0AD5  a1a00c            mov      ax, word ptr [0xca0]
1:0AD8  8b16a20c          mov      dx, word ptr [0xca2]
1:0ADC  a39c0c            mov      word ptr [0xc9c], ax
1:0ADF  89169e0c          mov      word ptr [0xc9e], dx
1:0AE3  a18a0c            mov      ax, word ptr [0xc8a]
1:0AE6  8b168c0c          mov      dx, word ptr [0xc8c]
1:0AEA  a3840c            mov      word ptr [0xc84], ax
1:0AED  8916860c          mov      word ptr [0xc86], dx
1:0AF1  a1b60c            mov      ax, word ptr [0xcb6]
1:0AF4  8b16b80c          mov      dx, word ptr [0xcb8]
1:0AF8  a3b00c            mov      word ptr [0xcb0], ax
1:0AFB  8916b20c          mov      word ptr [0xcb2], dx
1:0AFF  9a1d0b0000        lcall    0, 0xb1d  ; @1:INT:ord_4(1:1550)
1:0B04  8bd8              mov      bx, ax
1:0B06  83e33f            and      bx, 0x3f
1:0B09  d1e3              shl      bx, 1
1:0B0B  d1e3              shl      bx, 1
1:0B0D  8b87ac20          mov      ax, word ptr [bx + 0x20ac]
1:0B11  8b97ae20          mov      dx, word ptr [bx + 0x20ae]
1:0B15  a38a0c            mov      word ptr [0xc8a], ax
1:0B18  89168c0c          mov      word ptr [0xc8c], dx
1:0B1C  9a3a0b0000        lcall    0, 0xb3a  ; @1:INT:ord_4(1:1550)
1:0B21  8bd8              mov      bx, ax
1:0B23  83e30f            and      bx, 0xf
1:0B26  d1e3              shl      bx, 1
1:0B28  d1e3              shl      bx, 1
1:0B2A  8b87ac21          mov      ax, word ptr [bx + 0x21ac]
1:0B2E  8b97ae21          mov      dx, word ptr [bx + 0x21ae]
1:0B32  a3a00c            mov      word ptr [0xca0], ax
1:0B35  8916a20c          mov      word ptr [0xca2], dx
1:0B39  9afa050000        lcall    0, 0x5fa  ; @1:INT:ord_4(1:1550)
1:0B3E  8bd8              mov      bx, ax
1:0B40  83e31f            and      bx, 0x1f
1:0B43  d1e3              shl      bx, 1
1:0B45  d1e3              shl      bx, 1
1:0B47  8b87fc0b          mov      ax, word ptr [bx + 0xbfc]
1:0B4B  8b97fe0b          mov      dx, word ptr [bx + 0xbfe]
1:0B4F  a3b60c            mov      word ptr [0xcb6], ax
1:0B52  8916b80c          mov      word ptr [0xcb8], dx
1:0B56  ff36a605          push     word ptr [0x5a6]
1:0B5A  ff36a405          push     word ptr [0x5a4]
1:0B5E  ff36a205          push     word ptr [0x5a2]
1:0B62  ff36a005          push     word ptr [0x5a0]
1:0B66  9a9b070000        lcall    0, 0x79b  ; @1:INT:ord_5(1:3D21)
1:0B6B  83c408            add      sp, 8
1:0B6E  a3940c            mov      word ptr [0xc94], ax
1:0B71  8916960c          mov      word ptr [0xc96], dx
1:0B75  a1a00c            mov      ax, word ptr [0xca0]
1:0B78  8b16a20c          mov      dx, word ptr [0xca2]
1:0B7C  2b069c0c          sub      ax, word ptr [0xc9c]
1:0B80  1b169e0c          sbb      dx, word ptr [0xc9e]
1:0B84  ff36960c          push     word ptr [0xc96]
1:0B88  ff36940c          push     word ptr [0xc94]
1:0B8C  52                push     dx
1:0B8D  50                push     ax
1:0B8E  9abf0b0000        lcall    0, 0xbbf  ; @1:INT:ord_12(1:3D6D)
1:0B93  83c408            add      sp, 8
1:0B96  03069c0c          add      ax, word ptr [0xc9c]
1:0B9A  13169e0c          adc      dx, word ptr [0xc9e]
1:0B9E  a3a40c            mov      word ptr [0xca4], ax
1:0BA1  8916a60c          mov      word ptr [0xca6], dx
1:0BA5  a18a0c            mov      ax, word ptr [0xc8a]
1:0BA8  8b168c0c          mov      dx, word ptr [0xc8c]
1:0BAC  2b06840c          sub      ax, word ptr [0xc84]
1:0BB0  1b16860c          sbb      dx, word ptr [0xc86]
1:0BB4  ff36960c          push     word ptr [0xc96]
1:0BB8  ff36940c          push     word ptr [0xc94]
1:0BBC  52                push     dx
1:0BBD  50                push     ax
1:0BBE  9afa0b0000        lcall    0, 0xbfa  ; @1:INT:ord_12(1:3D6D)
1:0BC3  83c408            add      sp, 8
1:0BC6  8946d8            mov      word ptr [bp - 0x28], ax
1:0BC9  8956da            mov      word ptr [bp - 0x26], dx
1:0BCC  a1840c            mov      ax, word ptr [0xc84]
1:0BCF  8b16860c          mov      dx, word ptr [0xc86]
1:0BD3  0346d8            add      ax, word ptr [bp - 0x28]
1:0BD6  1356da            adc      dx, word ptr [bp - 0x26]
1:0BD9  a3980c            mov      word ptr [0xc98], ax
1:0BDC  89169a0c          mov      word ptr [0xc9a], dx
1:0BE0  a1b60c            mov      ax, word ptr [0xcb6]
1:0BE3  8b16b80c          mov      dx, word ptr [0xcb8]
1:0BE7  2b06b00c          sub      ax, word ptr [0xcb0]
1:0BEB  1b16b20c          sbb      dx, word ptr [0xcb2]
1:0BEF  ff36960c          push     word ptr [0xc96]
1:0BF3  ff36940c          push     word ptr [0xc94]
1:0BF7  52                push     dx
1:0BF8  50                push     ax
1:0BF9  9a7a080000        lcall    0, 0x87a  ; @1:INT:ord_12(1:3D6D)
1:0BFE  83c408            add      sp, 8
1:0C01  8946d8            mov      word ptr [bp - 0x28], ax
1:0C04  8956da            mov      word ptr [bp - 0x26], dx
1:0C07  a1b00c            mov      ax, word ptr [0xcb0]
1:0C0A  8b16b20c          mov      dx, word ptr [0xcb2]
1:0C0E  0346d8            add      ax, word ptr [bp - 0x28]
1:0C11  1356da            adc      dx, word ptr [bp - 0x26]
1:0C14  a3be0c            mov      word ptr [0xcbe], ax
1:0C17  8916c00c          mov      word ptr [0xcc0], dx
1:0C1B  2bc0              sub      ax, ax
1:0C1D  8946d0            mov      word ptr [bp - 0x30], ax
1:0C20  8946ce            mov      word ptr [bp - 0x32], ax
1:0C23  ff069611          inc      word ptr [0x1196]
1:0C27  833e961132        cmp      word ptr [0x1196], 0x32
1:0C2C  7c09              jl       0xc37
1:0C2E  a19611            mov      ax, word ptr [0x1196]
1:0C31  2d3200            sub      ax, 0x32
1:0C34  a39611            mov      word ptr [0x1196], ax
1:0C37  ff069411          inc      word ptr [0x1194]
1:0C3B  813e9411f000      cmp      word ptr [0x1194], 0xf0
1:0C41  7506              jne      0xc49
1:0C43  c70694110000      mov      word ptr [0x1194], 0
1:0C49  8936a811          mov      word ptr [0x11a8], si
1:0C4D  5e                pop      si
1:0C4E  5f                pop      di
1:0C4F  4d                dec      bp
1:0C50  4d                dec      bp
1:0C51  8be5              mov      sp, bp
1:0C53  1f                pop      ds
1:0C54  5d                pop      bp
1:0C55  4d                dec      bp
1:0C56  cb                retf     
1:0C57  1e                push     ds
1:0C58  58                pop      ax
1:0C59  90                nop      
1:0C5A  45                inc      bp
1:0C5B  55                push     bp
1:0C5C  8bec              mov      bp, sp
1:0C5E  1e                push     ds
1:0C5F  8ed8              mov      ds, ax
1:0C61  83ec06            sub      sp, 6
1:0C64  ff36920c          push     word ptr [0xc92]
1:0C68  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateCompatibleDC
1:0C6D  8946fa            mov      word ptr [bp - 6], ax
1:0C70  ff36920c          push     word ptr [0xc92]
1:0C74  b80c00            mov      ax, 0xc
1:0C77  50                push     ax
1:0C78  b80200            mov      ax, 2
1:0C7B  50                push     ax
1:0C7C  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateCompatibleBitmap
1:0C81  a3ac0c            mov      word ptr [0xcac], ax
1:0C84  ff76fa            push     word ptr [bp - 6]
1:0C87  50                push     ax
1:0C88  9ab6090000        lcall    0, 0x9b6  ; @1:GDI.SelectObject
1:0C8D  ff76fa            push     word ptr [bp - 6]
1:0C90  2bc0              sub      ax, ax
1:0C92  50                push     ax
1:0C93  50                push     ax
1:0C94  b9ff00            mov      cx, 0xff
1:0C97  2bd2              sub      dx, dx
1:0C99  52                push     dx
1:0C9A  51                push     cx
1:0C9B  9ab20c0000        lcall    0, 0xcb2  ; @1:GDI.SetPixel
1:0CA0  ff76fa            push     word ptr [bp - 6]
1:0CA3  2bc0              sub      ax, ax
1:0CA5  50                push     ax
1:0CA6  b90100            mov      cx, 1
1:0CA9  51                push     cx
1:0CAA  baff00            mov      dx, 0xff
1:0CAD  2bdb              sub      bx, bx
1:0CAF  53                push     bx
1:0CB0  52                push     dx
1:0CB1  9ac80c0000        lcall    0, 0xcc8  ; @1:GDI.SetPixel
1:0CB6  ff76fa            push     word ptr [bp - 6]
1:0CB9  b80100            mov      ax, 1
1:0CBC  50                push     ax
1:0CBD  2bc9              sub      cx, cx
1:0CBF  51                push     cx
1:0CC0  baff00            mov      dx, 0xff
1:0CC3  2bdb              sub      bx, bx
1:0CC5  53                push     bx
1:0CC6  52                push     dx
1:0CC7  9adc0c0000        lcall    0, 0xcdc  ; @1:GDI.SetPixel
1:0CCC  ff76fa            push     word ptr [bp - 6]
1:0CCF  b80100            mov      ax, 1
1:0CD2  50                push     ax
1:0CD3  50                push     ax
1:0CD4  b9ff00            mov      cx, 0xff
1:0CD7  2bd2              sub      dx, dx
1:0CD9  52                push     dx
1:0CDA  51                push     cx
1:0CDB  9af20c0000        lcall    0, 0xcf2  ; @1:GDI.SetPixel
1:0CE0  ff76fa            push     word ptr [bp - 6]
1:0CE3  b80200            mov      ax, 2
1:0CE6  50                push     ax
1:0CE7  2bc9              sub      cx, cx
1:0CE9  51                push     cx
1:0CEA  baff00            mov      dx, 0xff
1:0CED  8bda              mov      bx, dx
1:0CEF  53                push     bx
1:0CF0  52                push     dx
1:0CF1  9a090d0000        lcall    0, 0xd09  ; @1:GDI.SetPixel
1:0CF6  ff76fa            push     word ptr [bp - 6]
1:0CF9  b80200            mov      ax, 2
1:0CFC  50                push     ax
1:0CFD  b80100            mov      ax, 1
1:0D00  50                push     ax
1:0D01  b9ff00            mov      cx, 0xff
1:0D04  8bd1              mov      dx, cx
1:0D06  52                push     dx
1:0D07  51                push     cx
1:0D08  9a1f0d0000        lcall    0, 0xd1f  ; @1:GDI.SetPixel
1:0D0D  ff76fa            push     word ptr [bp - 6]
1:0D10  b80300            mov      ax, 3
1:0D13  50                push     ax
1:0D14  2bc9              sub      cx, cx
1:0D16  51                push     cx
1:0D17  baff00            mov      dx, 0xff
1:0D1A  8bda              mov      bx, dx
1:0D1C  53                push     bx
1:0D1D  52                push     dx
1:0D1E  9a360d0000        lcall    0, 0xd36  ; @1:GDI.SetPixel
1:0D23  ff76fa            push     word ptr [bp - 6]
1:0D26  b80300            mov      ax, 3
1:0D29  50                push     ax
1:0D2A  b80100            mov      ax, 1
1:0D2D  50                push     ax
1:0D2E  b9ff00            mov      cx, 0xff
1:0D31  8bd1              mov      dx, cx
1:0D33  52                push     dx
1:0D34  51                push     cx
1:0D35  9a4c0d0000        lcall    0, 0xd4c  ; @1:GDI.SetPixel
1:0D3A  ff76fa            push     word ptr [bp - 6]
1:0D3D  b80400            mov      ax, 4
1:0D40  50                push     ax
1:0D41  2bc9              sub      cx, cx
1:0D43  51                push     cx
1:0D44  2bd2              sub      dx, dx
1:0D46  bbff00            mov      bx, 0xff
1:0D49  53                push     bx
1:0D4A  52                push     dx
1:0D4B  9a630d0000        lcall    0, 0xd63  ; @1:GDI.SetPixel
1:0D50  ff76fa            push     word ptr [bp - 6]
1:0D53  b80400            mov      ax, 4
1:0D56  50                push     ax
1:0D57  b80100            mov      ax, 1
1:0D5A  50                push     ax
1:0D5B  2bc9              sub      cx, cx
1:0D5D  baff00            mov      dx, 0xff
1:0D60  52                push     dx
1:0D61  51                push     cx
1:0D62  9a790d0000        lcall    0, 0xd79  ; @1:GDI.SetPixel
1:0D67  ff76fa            push     word ptr [bp - 6]
1:0D6A  b80500            mov      ax, 5
1:0D6D  50                push     ax
1:0D6E  2bc9              sub      cx, cx
1:0D70  51                push     cx
1:0D71  2bd2              sub      dx, dx
1:0D73  bbff00            mov      bx, 0xff
1:0D76  53                push     bx
1:0D77  52                push     dx
1:0D78  9a900d0000        lcall    0, 0xd90  ; @1:GDI.SetPixel
1:0D7D  ff76fa            push     word ptr [bp - 6]
1:0D80  b80500            mov      ax, 5
1:0D83  50                push     ax
1:0D84  b80100            mov      ax, 1
1:0D87  50                push     ax
1:0D88  2bc9              sub      cx, cx
1:0D8A  baff00            mov      dx, 0xff
1:0D8D  52                push     dx
1:0D8E  51                push     cx
1:0D8F  9aa70d0000        lcall    0, 0xda7  ; @1:GDI.SetPixel
1:0D94  ff76fa            push     word ptr [bp - 6]
1:0D97  b80600            mov      ax, 6
1:0D9A  50                push     ax
1:0D9B  2bc9              sub      cx, cx
1:0D9D  51                push     cx
1:0D9E  ba00ff            mov      dx, 0xff00
1:0DA1  bbff00            mov      bx, 0xff
1:0DA4  53                push     bx
1:0DA5  52                push     dx
1:0DA6  9abf0d0000        lcall    0, 0xdbf  ; @1:GDI.SetPixel
1:0DAB  ff76fa            push     word ptr [bp - 6]
1:0DAE  b80600            mov      ax, 6
1:0DB1  50                push     ax
1:0DB2  b80100            mov      ax, 1
1:0DB5  50                push     ax
1:0DB6  b900ff            mov      cx, 0xff00
1:0DB9  baff00            mov      dx, 0xff
1:0DBC  52                push     dx
1:0DBD  51                push     cx
1:0DBE  9ad60d0000        lcall    0, 0xdd6  ; @1:GDI.SetPixel
1:0DC3  ff76fa            push     word ptr [bp - 6]
1:0DC6  b80700            mov      ax, 7
1:0DC9  50                push     ax
1:0DCA  2bc9              sub      cx, cx
1:0DCC  51                push     cx
1:0DCD  ba00ff            mov      dx, 0xff00
1:0DD0  bbff00            mov      bx, 0xff
1:0DD3  53                push     bx
1:0DD4  52                push     dx
1:0DD5  9aee0d0000        lcall    0, 0xdee  ; @1:GDI.SetPixel
1:0DDA  ff76fa            push     word ptr [bp - 6]
1:0DDD  b80700            mov      ax, 7
1:0DE0  50                push     ax
1:0DE1  b80100            mov      ax, 1
1:0DE4  50                push     ax
1:0DE5  b900ff            mov      cx, 0xff00
1:0DE8  baff00            mov      dx, 0xff
1:0DEB  52                push     dx
1:0DEC  51                push     cx
1:0DED  9a040e0000        lcall    0, 0xe04  ; @1:GDI.SetPixel
1:0DF2  ff76fa            push     word ptr [bp - 6]
1:0DF5  b80800            mov      ax, 8
1:0DF8  50                push     ax
1:0DF9  2bc9              sub      cx, cx
1:0DFB  51                push     cx
1:0DFC  ba00ff            mov      dx, 0xff00
1:0DFF  2bdb              sub      bx, bx
1:0E01  53                push     bx
1:0E02  52                push     dx
1:0E03  9a1b0e0000        lcall    0, 0xe1b  ; @1:GDI.SetPixel
1:0E08  ff76fa            push     word ptr [bp - 6]
1:0E0B  b80800            mov      ax, 8
1:0E0E  50                push     ax
1:0E0F  b80100            mov      ax, 1
1:0E12  50                push     ax
1:0E13  b900ff            mov      cx, 0xff00
1:0E16  2bd2              sub      dx, dx
1:0E18  52                push     dx
1:0E19  51                push     cx
1:0E1A  9a310e0000        lcall    0, 0xe31  ; @1:GDI.SetPixel
1:0E1F  ff76fa            push     word ptr [bp - 6]
1:0E22  b80900            mov      ax, 9
1:0E25  50                push     ax
1:0E26  2bc9              sub      cx, cx
1:0E28  51                push     cx
1:0E29  ba00ff            mov      dx, 0xff00
1:0E2C  2bdb              sub      bx, bx
1:0E2E  53                push     bx
1:0E2F  52                push     dx
1:0E30  9a480e0000        lcall    0, 0xe48  ; @1:GDI.SetPixel
1:0E35  ff76fa            push     word ptr [bp - 6]
1:0E38  b80900            mov      ax, 9
1:0E3B  50                push     ax
1:0E3C  b80100            mov      ax, 1
1:0E3F  50                push     ax
1:0E40  b900ff            mov      cx, 0xff00
1:0E43  2bd2              sub      dx, dx
1:0E45  52                push     dx
1:0E46  51                push     cx
1:0E47  9a5e0e0000        lcall    0, 0xe5e  ; @1:GDI.SetPixel
1:0E4C  ff76fa            push     word ptr [bp - 6]
1:0E4F  b80a00            mov      ax, 0xa
1:0E52  50                push     ax
1:0E53  2bc9              sub      cx, cx
1:0E55  51                push     cx
1:0E56  baffff            mov      dx, 0xffff
1:0E59  2bdb              sub      bx, bx
1:0E5B  53                push     bx
1:0E5C  52                push     dx
1:0E5D  9a750e0000        lcall    0, 0xe75  ; @1:GDI.SetPixel
1:0E62  ff76fa            push     word ptr [bp - 6]
1:0E65  b80a00            mov      ax, 0xa
1:0E68  50                push     ax
1:0E69  b80100            mov      ax, 1
1:0E6C  50                push     ax
1:0E6D  b9ffff            mov      cx, 0xffff
1:0E70  2bd2              sub      dx, dx
1:0E72  52                push     dx
1:0E73  51                push     cx
1:0E74  9a8b0e0000        lcall    0, 0xe8b  ; @1:GDI.SetPixel
1:0E79  ff76fa            push     word ptr [bp - 6]
1:0E7C  b80b00            mov      ax, 0xb
1:0E7F  50                push     ax
1:0E80  2bc9              sub      cx, cx
1:0E82  51                push     cx
1:0E83  b9ffff            mov      cx, 0xffff
1:0E86  2bd2              sub      dx, dx
1:0E88  52                push     dx
1:0E89  51                push     cx
1:0E8A  9aa20e0000        lcall    0, 0xea2  ; @1:GDI.SetPixel
1:0E8F  ff76fa            push     word ptr [bp - 6]
1:0E92  b80b00            mov      ax, 0xb
1:0E95  50                push     ax
1:0E96  b80100            mov      ax, 1
1:0E99  50                push     ax
1:0E9A  b8ffff            mov      ax, 0xffff
1:0E9D  2bd2              sub      dx, dx
1:0E9F  52                push     dx
1:0EA0  50                push     ax
1:0EA1  9a69080000        lcall    0, 0x869  ; @1:GDI.SetPixel
1:0EA6  ff76fa            push     word ptr [bp - 6]
1:0EA9  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteDC
1:0EAE  4d                dec      bp
1:0EAF  4d                dec      bp
1:0EB0  8be5              mov      sp, bp
1:0EB2  1f                pop      ds
1:0EB3  5d                pop      bp
1:0EB4  4d                dec      bp
1:0EB5  cb                retf     

; ===== EXPORT:ord_20(#20) =====
1:0EB6  1e                push     ds
1:0EB7  58                pop      ax
1:0EB8  90                nop      
1:0EB9  45                inc      bp
1:0EBA  55                push     bp
1:0EBB  8bec              mov      bp, sp
1:0EBD  1e                push     ds
1:0EBE  8ed8              mov      ds, ax
1:0EC0  83ec10            sub      sp, 0x10
1:0EC3  57                push     di
1:0EC4  56                push     si
1:0EC5  c41eec21          les      bx, ptr [0x21ec]
1:0EC9  268b4702          mov      ax, word ptr es:[bx + 2]
1:0ECD  99                cdq      
1:0ECE  2bc2              sub      ax, dx
1:0ED0  d1f8              sar      ax, 1
1:0ED2  a3fa0b            mov      word ptr [0xbfa], ax
1:0ED5  268b4704          mov      ax, word ptr es:[bx + 4]
1:0ED9  99                cdq      
1:0EDA  2bc2              sub      ax, dx
1:0EDC  d1f8              sar      ax, 1
1:0EDE  a3b40c            mov      word ptr [0xcb4], ax
1:0EE1  a1fa0b            mov      ax, word ptr [0xbfa]
1:0EE4  3906b40c          cmp      word ptr [0xcb4], ax
1:0EE8  7d03              jge      0xeed
1:0EEA  a1b40c            mov      ax, word ptr [0xcb4]
1:0EED  d1e0              shl      ax, 1
1:0EEF  d1e0              shl      ax, 1
1:0EF1  b90900            mov      cx, 9
1:0EF4  99                cdq      
1:0EF5  f7f9              idiv     cx
1:0EF7  a3a611            mov      word ptr [0x11a6], ax
1:0EFA  c7068e0c0100      mov      word ptr [0xc8e], 1
1:0F00  c706900c0000      mov      word ptr [0xc90], 0
1:0F06  0e                push     cs
1:0F07  e862f4            call     0x36c
1:0F0A  0e                push     cs
1:0F0B  e8baf1            call     0xc8
1:0F0E  ff362606          push     word ptr [0x626]
1:0F12  ff362406          push     word ptr [0x624]
1:0F16  ff362206          push     word ptr [0x622]
1:0F1A  ff362006          push     word ptr [0x620]
1:0F1E  9a3e0f0000        lcall    0, 0xf3e  ; @1:INT:ord_5(1:3D21)
1:0F23  83c408            add      sp, 8
1:0F26  a39e11            mov      word ptr [0x119e], ax
1:0F29  8916a011          mov      word ptr [0x11a0], dx
1:0F2D  ff362e06          push     word ptr [0x62e]
1:0F31  ff362c06          push     word ptr [0x62c]
1:0F35  ff362a06          push     word ptr [0x62a]
1:0F39  ff362806          push     word ptr [0x628]
1:0F3D  9a690f0000        lcall    0, 0xf69  ; @1:INT:ord_5(1:3D21)
1:0F42  83c408            add      sp, 8
1:0F45  a3f021            mov      word ptr [0x21f0], ax
1:0F48  8916f221          mov      word ptr [0x21f2], dx
1:0F4C  8d7ef6            lea      di, [bp - 0xa]
1:0F4F  be3006            mov      si, 0x630
1:0F52  16                push     ss
1:0F53  07                pop      es
1:0F54  a5                movsw    word ptr es:[di], word ptr [si]
1:0F55  a5                movsw    word ptr es:[di], word ptr [si]
1:0F56  a5                movsw    word ptr es:[di], word ptr [si]
1:0F57  a5                movsw    word ptr es:[di], word ptr [si]
1:0F58  ff363606          push     word ptr [0x636]
1:0F5C  ff363406          push     word ptr [0x634]
1:0F60  ff363206          push     word ptr [0x632]
1:0F64  ff363006          push     word ptr [0x630]
1:0F68  9a670b0000        lcall    0, 0xb67  ; @1:INT:ord_5(1:3D21)
1:0F6D  83c408            add      sp, 8
1:0F70  a37c0c            mov      word ptr [0xc7c], ax
1:0F73  89167e0c          mov      word ptr [0xc7e], dx
1:0F77  c41eba0c          les      bx, ptr [0xcba]
1:0F7B  268b470a          mov      ax, word ptr es:[bx + 0xa]
1:0F7F  a3f60b            mov      word ptr [0xbf6], ax
1:0F82  c746f40000        mov      word ptr [bp - 0xc], 0
1:0F87  eb61              jmp      0xfea
1:0F89  837ef40f          cmp      word ptr [bp - 0xc], 0xf
1:0F8D  7f0c              jg       0xf9b
1:0F8F  c746f0ff00        mov      word ptr [bp - 0x10], 0xff
1:0F94  c746f2ff00        mov      word ptr [bp - 0xe], 0xff
1:0F99  eb37              jmp      0xfd2
1:0F9B  837ef417          cmp      word ptr [bp - 0xc], 0x17
1:0F9F  7f07              jg       0xfa8
1:0FA1  c746f00000        mov      word ptr [bp - 0x10], 0
1:0FA6  ebec              jmp      0xf94
1:0FA8  837ef41f          cmp      word ptr [bp - 0xc], 0x1f
1:0FAC  7f07              jg       0xfb5
1:0FAE  c746f000ff        mov      word ptr [bp - 0x10], 0xff00
1:0FB3  ebdf              jmp      0xf94
1:0FB5  837ef428          cmp      word ptr [bp - 0xc], 0x28
1:0FB9  7f07              jg       0xfc2
1:0FBB  c746f000ff        mov      word ptr [bp - 0x10], 0xff00
1:0FC0  eb0b              jmp      0xfcd
1:0FC2  837ef431          cmp      word ptr [bp - 0xc], 0x31
1:0FC6  7f0a              jg       0xfd2
1:0FC8  c746f0ffff        mov      word ptr [bp - 0x10], 0xffff
1:0FCD  c746f20000        mov      word ptr [bp - 0xe], 0
1:0FD2  8b46f0            mov      ax, word ptr [bp - 0x10]
1:0FD5  8b56f2            mov      dx, word ptr [bp - 0xe]
1:0FD8  8b5ef4            mov      bx, word ptr [bp - 0xc]
1:0FDB  d1e3              shl      bx, 1
1:0FDD  d1e3              shl      bx, 1
1:0FDF  8987c810          mov      word ptr [bx + 0x10c8], ax
1:0FE3  8997ca10          mov      word ptr [bx + 0x10ca], dx
1:0FE7  ff46f4            inc      word ptr [bp - 0xc]
1:0FEA  837ef432          cmp      word ptr [bp - 0xc], 0x32
1:0FEE  7d0d              jge      0xffd
1:0FF0  837ef407          cmp      word ptr [bp - 0xc], 7
1:0FF4  7f93              jg       0xf89
1:0FF6  c746f0ff00        mov      word ptr [bp - 0x10], 0xff
1:0FFB  ebd0              jmp      0xfcd
1:0FFD  0e                push     cs
1:0FFE  e856fc            call     0xc57
1:1001  c7069811aa11      mov      word ptr [0x1198], 0x11aa
1:1007  c41eec21          les      bx, ptr [0x21ec]
1:100B  268b4706          mov      ax, word ptr es:[bx + 6]
1:100F  a3880c            mov      word ptr [0xc88], ax
1:1012  268b4708          mov      ax, word ptr es:[bx + 8]
1:1016  a3aa20            mov      word ptr [0x20aa], ax
1:1019  50                push     ax
1:101A  ff36880c          push     word ptr [0xc88]
1:101E  0e                push     cs
1:101F  e86df3            call     0x38f
1:1022  5b                pop      bx
1:1023  5b                pop      bx
1:1024  c7069011ffff      mov      word ptr [0x1190], 0xffff
1:102A  c7069211ff00      mov      word ptr [0x1192], 0xff
1:1030  2bc0              sub      ax, ax
1:1032  a3820c            mov      word ptr [0xc82], ax
1:1035  a3800c            mov      word ptr [0xc80], ax
1:1038  a3c20e            mov      word ptr [0xec2], ax
1:103B  5e                pop      si
1:103C  5f                pop      di
1:103D  4d                dec      bp
1:103E  4d                dec      bp
1:103F  8be5              mov      sp, bp
1:1041  1f                pop      ds
1:1042  5d                pop      bp
1:1043  4d                dec      bp
1:1044  cb                retf     

; ===== EXPORT:ord_18(#18) =====
1:1045  1e                push     ds
1:1046  58                pop      ax
1:1047  90                nop      
1:1048  45                inc      bp
1:1049  55                push     bp
1:104A  8bec              mov      bp, sp
1:104C  1e                push     ds
1:104D  8ed8              mov      ds, ax
1:104F  0e                push     cs
1:1050  e875f7            call     0x7c8
1:1053  2bc0              sub      ax, ax
1:1055  4d                dec      bp
1:1056  4d                dec      bp
1:1057  8be5              mov      sp, bp
1:1059  1f                pop      ds
1:105A  5d                pop      bp
1:105B  4d                dec      bp
1:105C  cb                retf     

; ===== EXPORT:ord_19(#19) =====
1:105D  1e                push     ds
1:105E  58                pop      ax
1:105F  90                nop      
1:1060  45                inc      bp
1:1061  55                push     bp
1:1062  8bec              mov      bp, sp
1:1064  1e                push     ds
1:1065  8ed8              mov      ds, ax
1:1067  b8600a            mov      ax, 0xa60
1:106A  1e                push     ds
1:106B  50                push     ax
1:106C  2bc0              sub      ax, ax
1:106E  50                push     ax
1:106F  50                push     ax
1:1070  c41eec21          les      bx, ptr [0x21ec]
1:1074  26ff7702          push     word ptr es:[bx + 2]
1:1078  26ff7704          push     word ptr es:[bx + 4]
1:107C  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:1081  ff36920c          push     word ptr [0xc92]
1:1085  b8600a            mov      ax, 0xa60
1:1088  1e                push     ds
1:1089  50                push     ax
1:108A  b80400            mov      ax, 4
1:108D  50                push     ax
1:108E  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:1093  50                push     ax
1:1094  9affff0000        lcall    0, 0xffff  ; @1:USER.FillRect
1:1099  2bc0              sub      ax, ax
1:109B  4d                dec      bp
1:109C  4d                dec      bp
1:109D  8be5              mov      sp, bp
1:109F  1f                pop      ds
1:10A0  5d                pop      bp
1:10A1  4d                dec      bp
1:10A2  cb                retf     

; ===== EXPORT:ord_16(#16) =====
1:10A3  1e                push     ds
1:10A4  58                pop      ax
1:10A5  90                nop      
1:10A6  45                inc      bp
1:10A7  55                push     bp
1:10A8  8bec              mov      bp, sp
1:10AA  1e                push     ds
1:10AB  8ed8              mov      ds, ax
1:10AD  ff36ac0c          push     word ptr [0xcac]
1:10B1  9a1f0a0000        lcall    0, 0xa1f  ; @1:GDI.DeleteObject
1:10B6  2bc0              sub      ax, ax
1:10B8  4d                dec      bp
1:10B9  4d                dec      bp
1:10BA  8be5              mov      sp, bp
1:10BC  1f                pop      ds
1:10BD  5d                pop      bp
1:10BE  4d                dec      bp
1:10BF  cb                retf     

; ===== EXPORT:ord_15(#15) =====
1:10C0  1e                push     ds
1:10C1  58                pop      ax
1:10C2  90                nop      
1:10C3  45                inc      bp
1:10C4  55                push     bp
1:10C5  8bec              mov      bp, sp
1:10C7  1e                push     ds
1:10C8  8ed8              mov      ds, ax
1:10CA  2bc0              sub      ax, ax
1:10CC  4d                dec      bp
1:10CD  4d                dec      bp
1:10CE  8be5              mov      sp, bp
1:10D0  1f                pop      ds
1:10D1  5d                pop      bp
1:10D2  4d                dec      bp
1:10D3  cb                retf     

; ===== EXPORT:ord_14(#14) =====
1:10D4  1e                push     ds
1:10D5  58                pop      ax
1:10D6  90                nop      
1:10D7  45                inc      bp
1:10D8  55                push     bp
1:10D9  8bec              mov      bp, sp
1:10DB  1e                push     ds
1:10DC  8ed8              mov      ds, ax
1:10DE  2bc0              sub      ax, ax
1:10E0  4d                dec      bp
1:10E1  4d                dec      bp
1:10E2  8be5              mov      sp, bp
1:10E4  1f                pop      ds
1:10E5  5d                pop      bp
1:10E6  4d                dec      bp
1:10E7  cb                retf     

; ===== EXPORT:ord_13(#13) =====
1:10E8  1e                push     ds
1:10E9  58                pop      ax
1:10EA  90                nop      
1:10EB  45                inc      bp
1:10EC  55                push     bp
1:10ED  8bec              mov      bp, sp
1:10EF  1e                push     ds
1:10F0  8ed8              mov      ds, ax
1:10F2  c41eba0c          les      bx, ptr [0xcba]
1:10F6  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:10FB  7519              jne      0x1116
1:10FD  8b4606            mov      ax, word ptr [bp + 6]
1:1100  0bc0              or       ax, ax
1:1102  7409              je       0x110d
1:1104  48                dec      ax
1:1105  7406              je       0x110d
1:1107  48                dec      ax
1:1108  7403              je       0x110d
1:110A  48                dec      ax
1:110B  eb09              jmp      0x1116
1:110D  0e                push     cs
1:110E  e892ff            call     0x10a3
1:1111  b80300            mov      ax, 3
1:1114  eb02              jmp      0x1118
1:1116  2bc0              sub      ax, ax
1:1118  4d                dec      bp
1:1119  4d                dec      bp
1:111A  8be5              mov      sp, bp
1:111C  1f                pop      ds
1:111D  5d                pop      bp
1:111E  4d                dec      bp
1:111F  cb                retf     

; ===== EXPORT:ord_23(#23) =====
1:1120  1e                push     ds
1:1121  58                pop      ax
1:1122  90                nop      
1:1123  45                inc      bp
1:1124  55                push     bp
1:1125  8bec              mov      bp, sp
1:1127  1e                push     ds
1:1128  8ed8              mov      ds, ax
1:112A  837e0a00          cmp      word ptr [bp + 0xa], 0
1:112E  7504              jne      0x1134
1:1130  2bc0              sub      ax, ax
1:1132  eb09              jmp      0x113d
1:1134  8b460e            mov      ax, word ptr [bp + 0xe]
1:1137  a39c11            mov      word ptr [0x119c], ax
1:113A  b80100            mov      ax, 1
1:113D  4d                dec      bp
1:113E  4d                dec      bp
1:113F  8be5              mov      sp, bp
1:1141  1f                pop      ds
1:1142  5d                pop      bp
1:1143  4d                dec      bp
1:1144  ca0a00            retf     0xa

; ===== EXPORT:WEP(#2) =====
1:1147  1e                push     ds
1:1148  58                pop      ax
1:1149  90                nop      
1:114A  45                inc      bp
1:114B  55                push     bp
1:114C  8bec              mov      bp, sp
1:114E  1e                push     ds
1:114F  8ed8              mov      ds, ax
1:1151  b80100            mov      ax, 1
1:1154  4d                dec      bp
1:1155  4d                dec      bp
1:1156  8be5              mov      sp, bp
1:1158  1f                pop      ds
1:1159  5d                pop      bp
1:115A  4d                dec      bp
1:115B  ca0200            retf     2

; ===== EXPORT:MODULE(#1) =====
1:115E  1e                push     ds
1:115F  58                pop      ax
1:1160  90                nop      
1:1161  45                inc      bp
1:1162  55                push     bp
1:1163  8bec              mov      bp, sp
1:1165  1e                push     ds
1:1166  8ed8              mov      ds, ax
1:1168  83ec0a            sub      sp, 0xa
1:116B  56                push     si
1:116C  8b4608            mov      ax, word ptr [bp + 8]
1:116F  a3920c            mov      word ptr [0xc92], ax
1:1172  8b4606            mov      ax, word ptr [bp + 6]
1:1175  a3000b            mov      word ptr [0xb00], ax
1:1178  50                push     ax
1:1179  9a99110000        lcall    0, 0x1199  ; @1:KERNEL.GlobalLock
1:117E  a3ba0c            mov      word ptr [0xcba], ax
1:1181  8916bc0c          mov      word ptr [0xcbc], dx
1:1185  8bc2              mov      ax, dx
1:1187  0b06ba0c          or       ax, word ptr [0xcba]
1:118B  7503              jne      0x1190
1:118D  e96a01            jmp      0x12fa
1:1190  c41eba0c          les      bx, ptr [0xcba]
1:1194  26ff7720          push     word ptr es:[bx + 0x20]
1:1198  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalLock
1:119D  a3ec21            mov      word ptr [0x21ec], ax
1:11A0  8916ee21          mov      word ptr [0x21ee], dx
1:11A4  8bc2              mov      ax, dx
1:11A6  0b06ec21          or       ax, word ptr [0x21ec]
1:11AA  7503              jne      0x11af
1:11AC  e94201            jmp      0x12f1
1:11AF  8b460a            mov      ax, word ptr [bp + 0xa]
1:11B2  e90801            jmp      0x12bd
1:11B5  c41eba0c          les      bx, ptr [0xcba]
1:11B9  26837f1465        cmp      word ptr es:[bx + 0x14], 0x65
1:11BE  7c0f              jl       0x11cf
1:11C0  26817f36f400      cmp      word ptr es:[bx + 0x36], 0xf4
1:11C6  7507              jne      0x11cf
1:11C8  26837f3878        cmp      word ptr es:[bx + 0x38], 0x78
1:11CD  740e              je       0x11dd
1:11CF  c7061e000000      mov      word ptr [0x1e], 0
1:11D5  c746fc0500        mov      word ptr [bp - 4], 5
1:11DA  e90701            jmp      0x12e4
1:11DD  c7061e000100      mov      word ptr [0x1e], 1
1:11E3  e9fe00            jmp      0x12e4
1:11E6  b8680a            mov      ax, 0xa68
1:11E9  50                push     ax
1:11EA  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_22(1:14CA)
1:11EF  5b                pop      bx
1:11F0  ff36680a          push     word ptr [0xa68]
1:11F4  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_21(1:153C)
1:11F9  5b                pop      bx
1:11FA  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_20(1:0EB6)
1:11FF  eb13              jmp      0x1214
1:1201  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_19(1:105D)
1:1206  eb0c              jmp      0x1214
1:1208  833e1e0000        cmp      word ptr [0x1e], 0
1:120D  740b              je       0x121a
1:120F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_18(1:1045)
1:1214  8946fc            mov      word ptr [bp - 4], ax
1:1217  e9ca00            jmp      0x12e4
1:121A  ff36920c          push     word ptr [0xc92]
1:121E  b800ff            mov      ax, 0xff00
1:1221  baff00            mov      dx, 0xff
1:1224  52                push     dx
1:1225  50                push     ax
1:1226  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextColor
1:122B  ff36920c          push     word ptr [0xc92]
1:122F  2bc0              sub      ax, ax
1:1231  50                push     ax
1:1232  50                push     ax
1:1233  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkColor
1:1238  ff36920c          push     word ptr [0xc92]
1:123C  2bc0              sub      ax, ax
1:123E  50                push     ax
1:123F  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextAlign
1:1244  ff36920c          push     word ptr [0xc92]
1:1248  b80100            mov      ax, 1
1:124B  50                push     ax
1:124C  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkMode
1:1251  ff36920c          push     word ptr [0xc92]
1:1255  2bc0              sub      ax, ax
1:1257  50                push     ax
1:1258  50                push     ax
1:1259  b82000            mov      ax, 0x20
1:125C  1e                push     ds
1:125D  50                push     ax
1:125E  50                push     ax
1:125F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_17(1:14AE)
1:1264  5b                pop      bx
1:1265  50                push     ax
1:1266  9affff0000        lcall    0, 0xffff  ; @1:GDI.TextOut
1:126B  eb77              jmp      0x12e4
1:126D  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_16(1:10A3)
1:1272  eba0              jmp      0x1214
1:1274  a19c11            mov      ax, word ptr [0x119c]
1:1277  c41eec21          les      bx, ptr [0x21ec]
1:127B  26894716          mov      word ptr es:[bx + 0x16], ax
1:127F  c746f60000        mov      word ptr [bp - 0xa], 0
1:1284  8b46f6            mov      ax, word ptr [bp - 0xa]
1:1287  8bf0              mov      si, ax
1:1289  d1e6              shl      si, 1
1:128B  40                inc      ax
1:128C  c41eec21          les      bx, ptr [0x21ec]
1:1290  2689400e          mov      word ptr es:[bx + si + 0xe], ax
1:1294  ff46f6            inc      word ptr [bp - 0xa]
1:1297  837ef604          cmp      word ptr [bp - 0xa], 4
1:129B  7ce7              jl       0x1284
1:129D  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_15(1:10C0)
1:12A2  e96fff            jmp      0x1214
1:12A5  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_14(1:10D4)
1:12AA  e967ff            jmp      0x1214
1:12AD  8b460a            mov      ax, word ptr [bp + 0xa]
1:12B0  2d0700            sub      ax, 7
1:12B3  50                push     ax
1:12B4  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_13(1:10E8)
1:12B9  5b                pop      bx
1:12BA  e957ff            jmp      0x1214
1:12BD  3d0c00            cmp      ax, 0xc
1:12C0  7722              ja       0x12e4
1:12C2  d1e0              shl      ax, 1
1:12C4  93                xchg     bx, ax
1:12C5  2effa7ca12        jmp      word ptr cs:[bx + 0x12ca]
1:12CA  e611              out      0x11, al
1:12CC  0112              add      word ptr [bp + si], dx
1:12CE  0812              or       byte ptr [bp + si], dl
1:12D0  6d                insw     word ptr es:[di], dx
1:12D1  12e4              adc      ah, ah
1:12D3  127412            adc      dh, byte ptr [si + 0x12]
1:12D6  a5                movsw    word ptr es:[di], word ptr [si]
1:12D7  12ad12ad          adc      ch, byte ptr [di - 0x52ee]
1:12DB  12ad12ad          adc      ch, byte ptr [di - 0x52ee]
1:12DF  12e4              adc      ah, ah
1:12E1  12b511c4          adc      dh, byte ptr [di - 0x3bef]
1:12E5  1e                push     ds
1:12E6  ba0c26            mov      dx, 0x260c
1:12E9  ff7720            push     word ptr [bx + 0x20]
1:12EC  9af6120000        lcall    0, 0x12f6  ; @1:KERNEL.GlobalUnlock
1:12F1  ff36000b          push     word ptr [0xb00]
1:12F5  9adc020000        lcall    0, 0x2dc  ; @1:KERNEL.GlobalUnlock
1:12FA  8b46fc            mov      ax, word ptr [bp - 4]
1:12FD  5e                pop      si
1:12FE  4d                dec      bp
1:12FF  4d                dec      bp
1:1300  8be5              mov      sp, bp
1:1302  1f                pop      ds
1:1303  5d                pop      bp
1:1304  4d                dec      bp
1:1305  ca0600            retf     6
1:1308  0000              add      byte ptr [bx + si], al
1:130A  0000              add      byte ptr [bx + si], al
1:130C  0000              add      byte ptr [bx + si], al
1:130E  0000              add      byte ptr [bx + si], al
1:1310  0000              add      byte ptr [bx + si], al
1:1312  0000              add      byte ptr [bx + si], al
1:1314  0000              add      byte ptr [bx + si], al
1:1316  0000              add      byte ptr [bx + si], al
1:1318  0000              add      byte ptr [bx + si], al
1:131A  0000              add      byte ptr [bx + si], al
1:131C  0000              add      byte ptr [bx + si], al
1:131E  0000              add      byte ptr [bx + si], al
1:1320  c3                ret      
1:1321  008cd890          add      byte ptr [si - 0x6f28], cl
1:1325  45                inc      bp
1:1326  55                push     bp
1:1327  8bec              mov      bp, sp
1:1329  1e                push     ds
1:132A  8ed8              mov      ds, ax
1:132C  8c1e6901          mov      word ptr [0x169], ds
1:1330  b80035            mov      ax, 0x3500
1:1333  cd21              int      0x21
1:1335  891e3001          mov      word ptr [0x130], bx
1:1339  8c063201          mov      word ptr [0x132], es
1:133D  0e                push     cs
1:133E  1f                pop      ds
1:133F  b80025            mov      ax, 0x2500
1:1342  baa617            mov      dx, 0x17a6
1:1345  cd21              int      0x21
1:1347  16                push     ss
1:1348  1f                pop      ds
1:1349  8b0e7c05          mov      cx, word ptr [0x57c]
1:134D  e32e              jcxz     0x137d
1:134F  8e064401          mov      es, word ptr [0x144]
1:1353  268b362c00        mov      si, word ptr es:[0x2c]
1:1358  c5067e05          lds      ax, ptr [0x57e]
1:135C  8cda              mov      dx, ds
1:135E  33db              xor      bx, bx
1:1360  36ff1e7a05        lcall    ss:[0x57a]
1:1365  7305              jae      0x136c
1:1367  16                push     ss
1:1368  1f                pop      ds
1:1369  e96605            jmp      0x18d2
1:136C  36c5068205        lds      ax, ptr ss:[0x582]
1:1371  8cda              mov      dx, ds
1:1373  bb0300            mov      bx, 3
1:1376  36ff1e7a05        lcall    ss:[0x57a]
1:137B  16                push     ss
1:137C  1f                pop      ds
1:137D  8e064401          mov      es, word ptr [0x144]
1:1381  268b0e2c00        mov      cx, word ptr es:[0x2c]
1:1386  e33e              jcxz     0x13c6
1:1388  8ec1              mov      es, cx
1:138A  33ff              xor      di, di
1:138C  26803d00          cmp      byte ptr es:[di], 0
1:1390  7434              je       0x13c6
1:1392  b90d00            mov      cx, 0xd
1:1395  be2201            mov      si, 0x122
1:1398  f3a6              repe cmpsb byte ptr [si], byte ptr es:[di]
1:139A  740b              je       0x13a7
1:139C  b9ff7f            mov      cx, 0x7fff
1:139F  33c0              xor      ax, ax
1:13A1  f2ae              repne scasb al, byte ptr es:[di]
1:13A3  7521              jne      0x13c6
1:13A5  ebe5              jmp      0x138c
1:13A7  06                push     es
1:13A8  1e                push     ds
1:13A9  07                pop      es
1:13AA  1f                pop      ds
1:13AB  8bf7              mov      si, di
1:13AD  bf4d01            mov      di, 0x14d
1:13B0  b104              mov      cl, 4
1:13B2  ac                lodsb    al, byte ptr [si]
1:13B3  2c41              sub      al, 0x41
1:13B5  720d              jb       0x13c4
1:13B7  d2e0              shl      al, cl
1:13B9  92                xchg     dx, ax
1:13BA  ac                lodsb    al, byte ptr [si]
1:13BB  2c41              sub      al, 0x41