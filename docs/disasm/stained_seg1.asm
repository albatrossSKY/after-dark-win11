File: raw\unpacked\MODULES\STAINED.AD
Module: 'BLANKER' ('Graphics Module Library')
CS:IP=1:0A4E  SS:SP=0:0000  AutoDS=2  Heap=4096  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (3): KERNEL, GDI, USER
Segments (2):
  SEG  1: CODE off=0x00700 len=0x47B6 min=0x47B6 flags=0x1D50 relocs=565
  SEG  2: DATA off=0x05200 len=0x09DE min=0x09DE flags=0x0C61 relocs=0
Exports (70):
  ord   1: SEG1:460C flags=0x03 MODULE
  ord   2: SEG1:45F5 flags=0x03 WEP
  ord   3: SEG1:0A3A flags=0x03 ___EXPORTEDSTUB
  ord   4: SEG1:0D02 flags=0x00 
  ord   5: SEG1:0E87 flags=0x00 
  ord   6: SEG1:45CE flags=0x00 
  ord   7: SEG1:42FE flags=0x00 
  ord   8: SEG1:4511 flags=0x00 
  ord   9: SEG1:4426 flags=0x00 
  ord  10: SEG1:44CD flags=0x00 
  ord  11: SEG1:42D6 flags=0x00 
  ord  12: SEG1:4486 flags=0x00 
  ord  13: SEG1:30EA flags=0x00 
  ord  14: SEG1:3118 flags=0x00 
  ord  15: SEG1:3146 flags=0x00 
  ord  16: SEG1:32E8 flags=0x00 
  ord  17: SEG1:43C8 flags=0x00 
  ord  18: SEG1:27F6 flags=0x00 
  ord  19: SEG1:3DAF flags=0x00 
  ord  20: SEG1:3B0A flags=0x00 
  ord  21: SEG1:42AA flags=0x00 
  ord  22: SEG1:3958 flags=0x00 
  ord  23: SEG1:26F1 flags=0x00 
  ord  24: SEG1:38C0 flags=0x00 
  ord  25: SEG1:34DE flags=0x00 
  ord  26: SEG1:31D4 flags=0x00 
  ord  27: SEG1:339F flags=0x00 
  ord  28: SEG1:3C95 flags=0x00 
  ord  29: SEG1:2BA9 flags=0x00 
  ord  30: SEG1:0294 flags=0x00 
  ord  31: SEG1:41BB flags=0x00 
  ord  32: SEG1:4565 flags=0x00 
  ord  33: SEG1:2B61 flags=0x00 
  ord  34: SEG1:410C flags=0x00 
  ord  35: SEG1:2C7C flags=0x00 
  ord  36: SEG1:422B flags=0x00 
  ord  37: SEG1:4281 flags=0x00 
  ord  38: SEG1:4334 flags=0x00 
  ord  39: SEG1:37C6 flags=0x00 
  ord  40: SEG1:4349 flags=0x00 
  ord  41: SEG1:41DD flags=0x00 
  ord  42: SEG1:35F3 flags=0x00 
  ord  43: SEG1:265C flags=0x00 
  ord  44: SEG1:26A3 flags=0x00 
  ord  45: SEG1:0264 flags=0x00 
  ord  46: SEG1:0A80 flags=0x00 
  ord  47: SEG1:0B4C flags=0x00 
  ord  48: SEG1:01A6 flags=0x00 
  ord  49: SEG1:0192 flags=0x00 
  ord  50: SEG1:017E flags=0x00 
  ord  51: SEG1:0144 flags=0x00 
  ord  52: SEG1:01D2 flags=0x00 
  ord  53: SEG1:00DB flags=0x00 
  ord  54: SEG1:00AF flags=0x00 
  ord  55: SEG1:0012 flags=0x00 
  ord  56: SEG1:0250 flags=0x00 
  ord  57: SEG1:01EE flags=0x00 
  ord  58: SEG1:032E flags=0x00 
  ord  59: SEG1:0432 flags=0x00 
  ord  60: SEG1:05A4 flags=0x00 
  ord  61: SEG1:0464 flags=0x00 
  ord  62: SEG1:06D6 flags=0x00 
  ord  63: SEG1:06FE flags=0x00 
  ord  64: SEG1:07A0 flags=0x00 
  ord  65: SEG1:0764 flags=0x00 
  ord  66: SEG1:07CA flags=0x00 
  ord  67: SEG1:0702 flags=0x00 
  ord  68: SEG1:047E flags=0x00 
  ord  69: SEG1:096E flags=0x00 
  ord  70: SEG1:0A2A flags=0x00 
Resources (7):
  TYPE_1000        #1               off=0x05C20 len=    64
  TYPE_1000        #2               off=0x05C60 len=    64
  TYPE_1000        #3               off=0x05CA0 len=    64
  TYPE_1000        #4               off=0x05CE0 len=    32
  TYPE_2000        #10              off=0x05D00 len=    80
  TYPE_2000        #20              off=0x05D50 len=    16
  TYPE_2000        #30              off=0x05D60 len=   496

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

; ===== EXPORT:ord_55(#55) =====
1:0012  1e                push     ds
1:0013  58                pop      ax
1:0014  90                nop      
1:0015  45                inc      bp
1:0016  55                push     bp
1:0017  8bec              mov      bp, sp
1:0019  1e                push     ds
1:001A  8ed8              mov      ds, ax
1:001C  2bc0              sub      ax, ax
1:001E  50                push     ax
1:001F  b90100            mov      cx, 1
1:0022  51                push     cx
1:0023  b9ffff            mov      cx, 0xffff
1:0026  baff00            mov      dx, 0xff
1:0029  52                push     dx
1:002A  51                push     cx
1:002B  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreatePen
1:0030  a3c008            mov      word ptr [0x8c0], ax
1:0033  b8ffff            mov      ax, 0xffff
1:0036  baff00            mov      dx, 0xff
1:0039  52                push     dx
1:003A  50                push     ax
1:003B  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateSolidBrush
1:0040  a3ac08            mov      word ptr [0x8ac], ax
1:0043  0e                push     cs
1:0044  e80a00            call     0x51
1:0047  2bc0              sub      ax, ax
1:0049  4d                dec      bp
1:004A  4d                dec      bp
1:004B  8be5              mov      sp, bp
1:004D  1f                pop      ds
1:004E  5d                pop      bp
1:004F  4d                dec      bp
1:0050  cb                retf     
1:0051  1e                push     ds
1:0052  58                pop      ax
1:0053  90                nop      
1:0054  45                inc      bp
1:0055  55                push     bp
1:0056  8bec              mov      bp, sp
1:0058  1e                push     ds
1:0059  8ed8              mov      ds, ax
1:005B  b89c08            mov      ax, 0x89c
1:005E  1e                push     ds
1:005F  50                push     ax
1:0060  2bc0              sub      ax, ax
1:0062  50                push     ax
1:0063  50                push     ax
1:0064  c41ec208          les      bx, ptr [0x8c2]
1:0068  26ff7702          push     word ptr es:[bx + 2]
1:006C  26ff7704          push     word ptr es:[bx + 4]
1:0070  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:0075  c41ea608          les      bx, ptr [0x8a6]
1:0079  26837f0a04        cmp      word ptr es:[bx + 0xa], 4
1:007E  7c05              jl       0x85
1:0080  b80100            mov      ax, 1
1:0083  eb02              jmp      0x87
1:0085  2bc0              sub      ax, ax
1:0087  a31000            mov      word ptr [0x10], ax
1:008A  ff369208          push     word ptr [0x892]
1:008E  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetWindowOrg
1:0093  a3b808            mov      word ptr [0x8b8], ax
1:0096  8916ba08          mov      word ptr [0x8ba], dx
1:009A  2bc0              sub      ax, ax
1:009C  a3b208            mov      word ptr [0x8b2], ax
1:009F  a3b008            mov      word ptr [0x8b0], ax
1:00A2  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_5(1:0E87)
1:00A7  4d                dec      bp
1:00A8  4d                dec      bp
1:00A9  8be5              mov      sp, bp
1:00AB  1f                pop      ds
1:00AC  5d                pop      bp
1:00AD  4d                dec      bp
1:00AE  cb                retf     

; ===== EXPORT:ord_54(#54) =====
1:00AF  1e                push     ds
1:00B0  58                pop      ax
1:00B1  90                nop      
1:00B2  45                inc      bp
1:00B3  55                push     bp
1:00B4  8bec              mov      bp, sp
1:00B6  1e                push     ds
1:00B7  8ed8              mov      ds, ax
1:00B9  ff369208          push     word ptr [0x892]
1:00BD  b89c08            mov      ax, 0x89c
1:00C0  1e                push     ds
1:00C1  50                push     ax
1:00C2  b80400            mov      ax, 4
1:00C5  50                push     ax
1:00C6  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:00CB  50                push     ax
1:00CC  9affff0000        lcall    0, 0xffff  ; @1:USER.FillRect
1:00D1  2bc0              sub      ax, ax
1:00D3  4d                dec      bp
1:00D4  4d                dec      bp
1:00D5  8be5              mov      sp, bp
1:00D7  1f                pop      ds
1:00D8  5d                pop      bp
1:00D9  4d                dec      bp
1:00DA  cb                retf     

; ===== EXPORT:ord_53(#53) =====
1:00DB  1e                push     ds
1:00DC  58                pop      ax
1:00DD  90                nop      
1:00DE  45                inc      bp
1:00DF  55                push     bp
1:00E0  8bec              mov      bp, sp
1:00E2  1e                push     ds
1:00E3  8ed8              mov      ds, ax
1:00E5  ff369208          push     word ptr [0x892]
1:00E9  ff36c008          push     word ptr [0x8c0]
1:00ED  9afe000000        lcall    0, 0xfe  ; @1:GDI.SelectObject
1:00F2  a3b608            mov      word ptr [0x8b6], ax
1:00F5  ff369208          push     word ptr [0x892]
1:00F9  ff36ac08          push     word ptr [0x8ac]
1:00FD  9a29010000        lcall    0, 0x129  ; @1:GDI.SelectObject
1:0102  a3aa08            mov      word ptr [0x8aa], ax
1:0105  2bc0              sub      ax, ax
1:0107  50                push     ax
1:0108  c41ec208          les      bx, ptr [0x8c2]
1:010C  26ff770a          push     word ptr es:[bx + 0xa]
1:0110  26ff7708          push     word ptr es:[bx + 8]
1:0114  26ff7706          push     word ptr es:[bx + 6]
1:0118  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_4(1:0D02)
1:011D  83c408            add      sp, 8
1:0120  ff369208          push     word ptr [0x892]
1:0124  ff36b608          push     word ptr [0x8b6]
1:0128  9a36010000        lcall    0, 0x136  ; @1:GDI.SelectObject
1:012D  ff369208          push     word ptr [0x892]
1:0131  ff36aa08          push     word ptr [0x8aa]
1:0135  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectObject
1:013A  2bc0              sub      ax, ax
1:013C  4d                dec      bp
1:013D  4d                dec      bp
1:013E  8be5              mov      sp, bp
1:0140  1f                pop      ds
1:0141  5d                pop      bp
1:0142  4d                dec      bp
1:0143  cb                retf     

; ===== EXPORT:ord_51(#51) =====
1:0144  1e                push     ds
1:0145  58                pop      ax
1:0146  90                nop      
1:0147  45                inc      bp
1:0148  55                push     bp
1:0149  8bec              mov      bp, sp
1:014B  1e                push     ds
1:014C  8ed8              mov      ds, ax
1:014E  ff36c008          push     word ptr [0x8c0]
1:0152  9a5c010000        lcall    0, 0x15c  ; @1:GDI.DeleteObject
1:0157  ff36ac08          push     word ptr [0x8ac]
1:015B  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteObject
1:0160  2bc0              sub      ax, ax
1:0162  4d                dec      bp
1:0163  4d                dec      bp
1:0164  8be5              mov      sp, bp
1:0166  1f                pop      ds
1:0167  5d                pop      bp
1:0168  4d                dec      bp
1:0169  cb                retf     
1:016A  1e                push     ds
1:016B  58                pop      ax
1:016C  90                nop      
1:016D  45                inc      bp
1:016E  55                push     bp
1:016F  8bec              mov      bp, sp
1:0171  1e                push     ds
1:0172  8ed8              mov      ds, ax
1:0174  2bc0              sub      ax, ax
1:0176  4d                dec      bp
1:0177  4d                dec      bp
1:0178  8be5              mov      sp, bp
1:017A  1f                pop      ds
1:017B  5d                pop      bp
1:017C  4d                dec      bp
1:017D  cb                retf     

; ===== EXPORT:ord_50(#50) =====
1:017E  1e                push     ds
1:017F  58                pop      ax
1:0180  90                nop      
1:0181  45                inc      bp
1:0182  55                push     bp
1:0183  8bec              mov      bp, sp
1:0185  1e                push     ds
1:0186  8ed8              mov      ds, ax
1:0188  2bc0              sub      ax, ax
1:018A  4d                dec      bp
1:018B  4d                dec      bp
1:018C  8be5              mov      sp, bp
1:018E  1f                pop      ds
1:018F  5d                pop      bp
1:0190  4d                dec      bp
1:0191  cb                retf     

; ===== EXPORT:ord_49(#49) =====
1:0192  1e                push     ds
1:0193  58                pop      ax
1:0194  90                nop      
1:0195  45                inc      bp
1:0196  55                push     bp
1:0197  8bec              mov      bp, sp
1:0199  1e                push     ds
1:019A  8ed8              mov      ds, ax
1:019C  2bc0              sub      ax, ax
1:019E  4d                dec      bp
1:019F  4d                dec      bp
1:01A0  8be5              mov      sp, bp
1:01A2  1f                pop      ds
1:01A3  5d                pop      bp
1:01A4  4d                dec      bp
1:01A5  cb                retf     

; ===== EXPORT:ord_48(#48) =====
1:01A6  1e                push     ds
1:01A7  58                pop      ax
1:01A8  90                nop      
1:01A9  45                inc      bp
1:01AA  55                push     bp
1:01AB  8bec              mov      bp, sp
1:01AD  1e                push     ds
1:01AE  8ed8              mov      ds, ax
1:01B0  2bc0              sub      ax, ax
1:01B2  4d                dec      bp
1:01B3  4d                dec      bp
1:01B4  8be5              mov      sp, bp
1:01B6  1f                pop      ds
1:01B7  5d                pop      bp
1:01B8  4d                dec      bp
1:01B9  cb                retf     
1:01BA  0000              add      byte ptr [bx + si], al
1:01BC  0000              add      byte ptr [bx + si], al
1:01BE  0000              add      byte ptr [bx + si], al
1:01C0  0000              add      byte ptr [bx + si], al
1:01C2  0000              add      byte ptr [bx + si], al
1:01C4  0000              add      byte ptr [bx + si], al
1:01C6  0000              add      byte ptr [bx + si], al
1:01C8  0000              add      byte ptr [bx + si], al
1:01CA  0000              add      byte ptr [bx + si], al
1:01CC  0000              add      byte ptr [bx + si], al
1:01CE  0000              add      byte ptr [bx + si], al
1:01D0  c3                ret      
1:01D1  00558b            add      byte ptr [di - 0x75], dl
1:01D4  ec                in       al, dx
1:01D5  8bd7              mov      dx, di
1:01D7  8cd8              mov      ax, ds
1:01D9  8ec0              mov      es, ax
1:01DB  8b7e06            mov      di, word ptr [bp + 6]
1:01DE  33c0              xor      ax, ax
1:01E0  b9ffff            mov      cx, 0xffff
1:01E3  f2ae              repne scasb al, byte ptr es:[di]
1:01E5  f7d1              not      cx
1:01E7  49                dec      cx
1:01E8  91                xchg     cx, ax
1:01E9  8bfa              mov      di, dx
1:01EB  5d                pop      bp
1:01EC  cb                retf     
1:01ED  008cd890          add      byte ptr [si - 0x6f28], cl
1:01F1  45                inc      bp
1:01F2  55                push     bp
1:01F3  8bec              mov      bp, sp
1:01F5  1e                push     ds
1:01F6  8ed8              mov      ds, ax
1:01F8  56                push     si
1:01F9  b42a              mov      ah, 0x2a
1:01FB  cd21              int      0x21
1:01FD  8bda              mov      bx, dx
1:01FF  8bf1              mov      si, cx
1:0201  b42c              mov      ah, 0x2c
1:0203  cd21              int      0x21
1:0205  b400              mov      ah, 0
1:0207  8ac6              mov      al, dh
1:0209  50                push     ax
1:020A  8ac1              mov      al, cl
1:020C  50                push     ax
1:020D  8ac5              mov      al, ch
1:020F  50                push     ax
1:0210  50                push     ax
1:0211  b42a              mov      ah, 0x2a
1:0213  cd21              int      0x21
1:0215  3bda              cmp      bx, dx
1:0217  58                pop      ax
1:0218  7408              je       0x222
1:021A  3c17              cmp      al, 0x17
1:021C  7504              jne      0x222
1:021E  8bd3              mov      dx, bx
1:0220  8bce              mov      cx, si
1:0222  b400              mov      ah, 0
1:0224  8ac2              mov      al, dl
1:0226  50                push     ax
1:0227  8ac6              mov      al, dh
1:0229  50                push     ax
1:022A  81e9bc07          sub      cx, 0x7bc
1:022E  51                push     cx
1:022F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_58(1:032E)
1:0234  83c40c            add      sp, 0xc
1:0237  837e0600          cmp      word ptr [bp + 6], 0
1:023B  7408              je       0x245
1:023D  8b5e06            mov      bx, word ptr [bp + 6]
1:0240  895702            mov      word ptr [bx + 2], dx
1:0243  8907              mov      word ptr [bx], ax
1:0245  5e                pop      si
1:0246  83ed02            sub      bp, 2
1:0249  8be5              mov      sp, bp
1:024B  1f                pop      ds
1:024C  5d                pop      bp
1:024D  4d                dec      bp
1:024E  cb                retf     
1:024F  004555            add      byte ptr [di + 0x55], al
1:0252  8bec              mov      bp, sp
1:0254  8b4606            mov      ax, word ptr [bp + 6]
1:0257  a3d201            mov      word ptr [0x1d2], ax
1:025A  c706d4010000      mov      word ptr [0x1d4], 0
1:0260  5d                pop      bp
1:0261  4d                dec      bp
1:0262  cb                retf     
1:0263  90                nop      

; ===== EXPORT:ord_45(#45) =====
1:0264  45                inc      bp
1:0265  55                push     bp
1:0266  8bec              mov      bp, sp
1:0268  b8fd43            mov      ax, 0x43fd
1:026B  ba0300            mov      dx, 3
1:026E  52                push     dx
1:026F  50                push     ax
1:0270  ff36d401          push     word ptr [0x1d4]
1:0274  ff36d201          push     word ptr [0x1d2]
1:0278  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_59(1:0432)
1:027D  05c39e            add      ax, 0x9ec3
1:0280  83d226            adc      dx, 0x26
1:0283  a3d201            mov      word ptr [0x1d2], ax
1:0286  8916d401          mov      word ptr [0x1d4], dx
1:028A  8bc2              mov      ax, dx
1:028C  80e47f            and      ah, 0x7f
1:028F  8be5              mov      sp, bp
1:0291  5d                pop      bp
1:0292  4d                dec      bp
1:0293  cb                retf     

; ===== EXPORT:ord_30(#30) =====
1:0294  55                push     bp
1:0295  8bec              mov      bp, sp
1:0297  57                push     di
1:0298  56                push     si
1:0299  53                push     bx
1:029A  33ff              xor      di, di
1:029C  8b4608            mov      ax, word ptr [bp + 8]
1:029F  0bc0              or       ax, ax
1:02A1  7d11              jge      0x2b4
1:02A3  47                inc      di
1:02A4  8b5606            mov      dx, word ptr [bp + 6]
1:02A7  f7d8              neg      ax
1:02A9  f7da              neg      dx
1:02AB  1d0000            sbb      ax, 0
1:02AE  894608            mov      word ptr [bp + 8], ax
1:02B1  895606            mov      word ptr [bp + 6], dx
1:02B4  8b460c            mov      ax, word ptr [bp + 0xc]
1:02B7  0bc0              or       ax, ax
1:02B9  7d11              jge      0x2cc
1:02BB  47                inc      di
1:02BC  8b560a            mov      dx, word ptr [bp + 0xa]
1:02BF  f7d8              neg      ax
1:02C1  f7da              neg      dx
1:02C3  1d0000            sbb      ax, 0
1:02C6  89460c            mov      word ptr [bp + 0xc], ax
1:02C9  89560a            mov      word ptr [bp + 0xa], dx
1:02CC  0bc0              or       ax, ax
1:02CE  7515              jne      0x2e5
1:02D0  8b4e0a            mov      cx, word ptr [bp + 0xa]
1:02D3  8b4608            mov      ax, word ptr [bp + 8]
1:02D6  33d2              xor      dx, dx
1:02D8  f7f1              div      cx
1:02DA  8bd8              mov      bx, ax
1:02DC  8b4606            mov      ax, word ptr [bp + 6]
1:02DF  f7f1              div      cx
1:02E1  8bd3              mov      dx, bx
1:02E3  eb38              jmp      0x31d
1:02E5  8bd8              mov      bx, ax
1:02E7  8b4e0a            mov      cx, word ptr [bp + 0xa]
1:02EA  8b5608            mov      dx, word ptr [bp + 8]
1:02ED  8b4606            mov      ax, word ptr [bp + 6]
1:02F0  d1eb              shr      bx, 1
1:02F2  d1d9              rcr      cx, 1
1:02F4  d1ea              shr      dx, 1
1:02F6  d1d8              rcr      ax, 1
1:02F8  0bdb              or       bx, bx
1:02FA  75f4              jne      0x2f0
1:02FC  f7f1              div      cx
1:02FE  8bf0              mov      si, ax
1:0300  f7660c            mul      word ptr [bp + 0xc]
1:0303  91                xchg     cx, ax
1:0304  8b460a            mov      ax, word ptr [bp + 0xa]
1:0307  f7e6              mul      si
1:0309  03d1              add      dx, cx
1:030B  720c              jb       0x319
1:030D  3b5608            cmp      dx, word ptr [bp + 8]
1:0310  7707              ja       0x319
1:0312  7206              jb       0x31a
1:0314  3b4606            cmp      ax, word ptr [bp + 6]
1:0317  7601              jbe      0x31a
1:0319  4e                dec      si
1:031A  33d2              xor      dx, dx
1:031C  96                xchg     si, ax
1:031D  4f                dec      di
1:031E  7507              jne      0x327
1:0320  f7da              neg      dx
1:0322  f7d8              neg      ax
1:0324  83da00            sbb      dx, 0
1:0327  5b                pop      bx
1:0328  5e                pop      si
1:0329  5f                pop      di
1:032A  5d                pop      bp
1:032B  ca0800            retf     8

; ===== EXPORT:ord_58(#58) =====
1:032E  45                inc      bp
1:032F  55                push     bp
1:0330  8bec              mov      bp, sp
1:0332  83ec04            sub      sp, 4
1:0335  57                push     di
1:0336  56                push     si
1:0337  8b7606            mov      si, word ptr [bp + 6]
1:033A  b88051            mov      ax, 0x5180
1:033D  ba0100            mov      dx, 1
1:0340  52                push     dx
1:0341  50                push     ax
1:0342  8d4403            lea      ax, [si + 3]
1:0345  99                cdq      
1:0346  33c2              xor      ax, dx
1:0348  2bc2              sub      ax, dx
1:034A  b90200            mov      cx, 2
1:034D  d3f8              sar      ax, cl
1:034F  33c2              xor      ax, dx
1:0351  2bc2              sub      ax, dx
1:0353  99                cdq      
1:0354  52                push     dx
1:0355  50                push     ax
1:0356  9aae030000        lcall    0, 0x3ae  ; @1:INT:ord_59(1:0432)
1:035B  8946fc            mov      word ptr [bp - 4], ax
1:035E  8956fe            mov      word ptr [bp - 2], dx
1:0361  8b5e08            mov      bx, word ptr [bp + 8]
1:0364  d1e3              shl      bx, 1
1:0366  8bbffa01          mov      di, word ptr [bx + 0x1fa]
1:036A  8bc6              mov      ax, si
1:036C  b90400            mov      cx, 4
1:036F  99                cdq      
1:0370  f7f9              idiv     cx
1:0372  0bd2              or       dx, dx
1:0374  7507              jne      0x37d
1:0376  837e0802          cmp      word ptr [bp + 8], 2
1:037A  7e01              jle      0x37d
1:037C  47                inc      di
1:037D  8b460a            mov      ax, word ptr [bp + 0xa]
1:0380  03c7              add      ax, di
1:0382  a36e08            mov      word ptr [0x86e], ax
1:0385  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_61(1:0464)
1:038A  b83c00            mov      ax, 0x3c
1:038D  99                cdq      
1:038E  52                push     dx
1:038F  50                push     ax
1:0390  52                push     dx
1:0391  50                push     ax
1:0392  b81800            mov      ax, 0x18
1:0395  99                cdq      
1:0396  52                push     dx
1:0397  50                push     ax
1:0398  b96d01            mov      cx, 0x16d
1:039B  8bc6              mov      ax, si
1:039D  f7e9              imul     cx
1:039F  03460a            add      ax, word ptr [bp + 0xa]
1:03A2  03c7              add      ax, di
1:03A4  99                cdq      
1:03A5  05440e            add      ax, 0xe44
1:03A8  83d200            adc      dx, 0
1:03AB  52                push     dx
1:03AC  50                push     ax
1:03AD  9ac1030000        lcall    0, 0x3c1  ; @1:INT:ord_59(1:0432)
1:03B2  8bc8              mov      cx, ax
1:03B4  8b460c            mov      ax, word ptr [bp + 0xc]
1:03B7  8bda              mov      bx, dx
1:03B9  99                cdq      
1:03BA  03c1              add      ax, cx
1:03BC  13d3              adc      dx, bx
1:03BE  52                push     dx
1:03BF  50                push     ax
1:03C0  9ad4030000        lcall    0, 0x3d4  ; @1:INT:ord_59(1:0432)
1:03C5  8bc8              mov      cx, ax
1:03C7  8b460e            mov      ax, word ptr [bp + 0xe]
1:03CA  8bda              mov      bx, dx
1:03CC  99                cdq      
1:03CD  03c1              add      ax, cx
1:03CF  13d3              adc      dx, bx
1:03D1  52                push     dx
1:03D2  50                push     ax
1:03D3  9a79020000        lcall    0, 0x279  ; @1:INT:ord_59(1:0432)
1:03D8  8bc8              mov      cx, ax
1:03DA  8b4610            mov      ax, word ptr [bp + 0x10]
1:03DD  8bda              mov      bx, dx
1:03DF  99                cdq      
1:03E0  03c1              add      ax, cx
1:03E2  13d3              adc      dx, bx
1:03E4  03061e02          add      ax, word ptr [0x21e]
1:03E8  13162002          adc      dx, word ptr [0x220]
1:03EC  0146fc            add      word ptr [bp - 4], ax
1:03EF  1156fe            adc      word ptr [bp - 2], dx
1:03F2  8d4450            lea      ax, [si + 0x50]
1:03F5  a36a08            mov      word ptr [0x86a], ax
1:03F8  8b4608            mov      ax, word ptr [bp + 8]
1:03FB  48                dec      ax
1:03FC  a36808            mov      word ptr [0x868], ax
1:03FF  8b460c            mov      ax, word ptr [bp + 0xc]
1:0402  a36408            mov      word ptr [0x864], ax
1:0405  833e220200        cmp      word ptr [0x222], 0
1:040A  7419              je       0x425
1:040C  b86008            mov      ax, 0x860
1:040F  50                push     ax
1:0410  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_60(1:05A4)
1:0415  83c402            add      sp, 2
1:0418  0bc0              or       ax, ax
1:041A  7409              je       0x425
1:041C  816efc100e        sub      word ptr [bp - 4], 0xe10
1:0421  835efe00          sbb      word ptr [bp - 2], 0
1:0425  8b46fc            mov      ax, word ptr [bp - 4]
1:0428  8b56fe            mov      dx, word ptr [bp - 2]
1:042B  5e                pop      si
1:042C  5f                pop      di
1:042D  8be5              mov      sp, bp
1:042F  5d                pop      bp
1:0430  4d                dec      bp
1:0431  cb                retf     

; ===== EXPORT:ord_59(#59) =====
1:0432  55                push     bp
1:0433  8bec              mov      bp, sp
1:0435  8b4608            mov      ax, word ptr [bp + 8]
1:0438  8b4e0c            mov      cx, word ptr [bp + 0xc]
1:043B  0bc8              or       cx, ax
1:043D  8b4e0a            mov      cx, word ptr [bp + 0xa]
1:0440  7509              jne      0x44b
1:0442  8b4606            mov      ax, word ptr [bp + 6]
1:0445  f7e1              mul      cx
1:0447  5d                pop      bp
1:0448  ca0800            retf     8
1:044B  53                push     bx
1:044C  f7e1              mul      cx
1:044E  8bd8              mov      bx, ax
1:0450  8b4606            mov      ax, word ptr [bp + 6]
1:0453  f7660c            mul      word ptr [bp + 0xc]
1:0456  03d8              add      bx, ax
1:0458  8b4606            mov      ax, word ptr [bp + 6]
1:045B  f7e1              mul      cx
1:045D  03d3              add      dx, bx
1:045F  5b                pop      bx
1:0460  5d                pop      bp
1:0461  ca0800            retf     8

; ===== EXPORT:ord_61(#61) =====
1:0464  45                inc      bp
1:0465  55                push     bp
1:0466  8bec              mov      bp, sp
1:0468  833e720800        cmp      word ptr [0x872], 0
1:046D  7509              jne      0x478
1:046F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_68(1:047E)
1:0474  ff067208          inc      word ptr [0x872]
1:0478  8be5              mov      sp, bp
1:047A  5d                pop      bp
1:047B  4d                dec      bp
1:047C  cb                retf     
1:047D  90                nop      

; ===== EXPORT:ord_68(#68) =====
1:047E  45                inc      bp
1:047F  55                push     bp
1:0480  8bec              mov      bp, sp
1:0482  83ec04            sub      sp, 4
1:0485  57                push     di
1:0486  56                push     si
1:0487  b8da01            mov      ax, 0x1da
1:048A  50                push     ax
1:048B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_67(1:0702)
1:0490  83c402            add      sp, 2
1:0493  8bf0              mov      si, ax
1:0495  0bf6              or       si, si
1:0497  7405              je       0x49e
1:0499  803c00            cmp      byte ptr [si], 0
1:049C  7579              jne      0x517
1:049E  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GetDOSEnvironment
1:04A3  8946fc            mov      word ptr [bp - 4], ax
1:04A6  8956fe            mov      word ptr [bp - 2], dx
1:04A9  0bd0              or       dx, ax
1:04AB  7503              jne      0x4b0
1:04AD  e9ec00            jmp      0x59c
1:04B0  c45efc            les      bx, ptr [bp - 4]
1:04B3  26803f00          cmp      byte ptr es:[bx], 0
1:04B7  7517              jne      0x4d0
1:04B9  e9e000            jmp      0x59c
1:04BC  90                nop      
1:04BD  90                nop      
1:04BE  ff76fe            push     word ptr [bp - 2]
1:04C1  ff76fc            push     word ptr [bp - 4]
1:04C4  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_66(1:07CA)
1:04C9  83c404            add      sp, 4
1:04CC  40                inc      ax
1:04CD  0146fc            add      word ptr [bp - 4], ax
1:04D0  c45efc            les      bx, ptr [bp - 4]
1:04D3  26803f00          cmp      byte ptr es:[bx], 0
1:04D7  7417              je       0x4f0
1:04D9  b80300            mov      ax, 3
1:04DC  50                push     ax
1:04DD  b8dd01            mov      ax, 0x1dd
1:04E0  1e                push     ds
1:04E1  50                push     ax
1:04E2  06                push     es
1:04E3  53                push     bx
1:04E4  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_65(1:0764)
1:04E9  83c40a            add      sp, 0xa
1:04EC  0bc0              or       ax, ax
1:04EE  75ce              jne      0x4be
1:04F0  c45efc            les      bx, ptr [bp - 4]
1:04F3  26803f00          cmp      byte ptr es:[bx], 0
1:04F7  7503              jne      0x4fc
1:04F9  e9a000            jmp      0x59c
1:04FC  b81000            mov      ax, 0x10
1:04FF  50                push     ax
1:0500  8346fc03          add      word ptr [bp - 4], 3
1:0504  06                push     es
1:0505  ff76fc            push     word ptr [bp - 4]
1:0508  b87408            mov      ax, 0x874
1:050B  1e                push     ds
1:050C  50                push     ax
1:050D  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_64(1:07A0)
1:0512  83c40a            add      sp, 0xa
1:0515  8bf0              mov      si, ax
1:0517  b80300            mov      ax, 3
1:051A  50                push     ax
1:051B  56                push     si
1:051C  ff362402          push     word ptr [0x224]
1:0520  9a7f050000        lcall    0, 0x57f  ; @1:INT:ord_62(1:06D6)
1:0525  83c406            add      sp, 6
1:0528  b8100e            mov      ax, 0xe10
1:052B  99                cdq      
1:052C  52                push     dx
1:052D  50                push     ax
1:052E  83c603            add      si, 3
1:0531  56                push     si
1:0532  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_63(1:06FE)
1:0537  83c402            add      sp, 2
1:053A  52                push     dx
1:053B  50                push     ax
1:053C  9a57030000        lcall    0, 0x357  ; @1:INT:ord_59(1:0432)
1:0541  a31e02            mov      word ptr [0x21e], ax
1:0544  89162002          mov      word ptr [0x220], dx
1:0548  2bff              sub      di, di
1:054A  8bdf              mov      bx, di
1:054C  03de              add      bx, si
1:054E  803f00            cmp      byte ptr [bx], 0
1:0551  7419              je       0x56c
1:0553  8a07              mov      al, byte ptr [bx]
1:0555  8bc8              mov      cx, ax
1:0557  98                cwde     
1:0558  8bd8              mov      bx, ax
1:055A  f687650204        test     byte ptr [bx + 0x265], 4
1:055F  7505              jne      0x566
1:0561  80f92d            cmp      cl, 0x2d
1:0564  7506              jne      0x56c
1:0566  47                inc      di
1:0567  83ff03            cmp      di, 3
1:056A  7cde              jl       0x54a
1:056C  8bdf              mov      bx, di
1:056E  03de              add      bx, si
1:0570  803f00            cmp      byte ptr [bx], 0
1:0573  7413              je       0x588
1:0575  b80300            mov      ax, 3
1:0578  50                push     ax
1:0579  53                push     bx
1:057A  ff362602          push     word ptr [0x226]
1:057E  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_62(1:06D6)
1:0583  83c406            add      sp, 6
1:0586  eb07              jmp      0x58f
1:0588  8b1e2602          mov      bx, word ptr [0x226]
1:058C  c60700            mov      byte ptr [bx], 0
1:058F  8b1e2602          mov      bx, word ptr [0x226]
1:0593  803f01            cmp      byte ptr [bx], 1
1:0596  1bc0              sbb      ax, ax
1:0598  40                inc      ax
1:0599  a32202            mov      word ptr [0x222], ax
1:059C  5e                pop      si
1:059D  5f                pop      di
1:059E  8be5              mov      sp, bp
1:05A0  5d                pop      bp
1:05A1  4d                dec      bp
1:05A2  cb                retf     
1:05A3  90                nop      

; ===== EXPORT:ord_60(#60) =====
1:05A4  45                inc      bp
1:05A5  55                push     bp
1:05A6  8bec              mov      bp, sp
1:05A8  83ec04            sub      sp, 4
1:05AB  57                push     di
1:05AC  56                push     si
1:05AD  8b7606            mov      si, word ptr [bp + 6]
1:05B0  837c0803          cmp      word ptr [si + 8], 3
1:05B4  7d03              jge      0x5b9
1:05B6  e9a800            jmp      0x661
1:05B9  837c0809          cmp      word ptr [si + 8], 9
1:05BD  7e03              jle      0x5c2
1:05BF  e99f00            jmp      0x661
1:05C2  837c0803          cmp      word ptr [si + 8], 3
1:05C6  7e06              jle      0x5ce
1:05C8  837c0809          cmp      word ptr [si + 8], 9
1:05CC  7c7f              jl       0x64d
1:05CE  8b7c0a            mov      di, word ptr [si + 0xa]
1:05D1  81c76c07          add      di, 0x76c
1:05D5  81ffc207          cmp      di, 0x7c2
1:05D9  7e15              jle      0x5f0
1:05DB  837c0803          cmp      word ptr [si + 8], 3
1:05DF  750f              jne      0x5f0
1:05E1  8b5c08            mov      bx, word ptr [si + 8]
1:05E4  d1e3              shl      bx, 1
1:05E6  8b87fc01          mov      ax, word ptr [bx + 0x1fc]
1:05EA  050700            add      ax, 7
1:05ED  eb0a              jmp      0x5f9
1:05EF  90                nop      
1:05F0  8b5c08            mov      bx, word ptr [si + 8]
1:05F3  d1e3              shl      bx, 1
1:05F5  8b87fe01          mov      ax, word ptr [bx + 0x1fe]
1:05F9  8946fc            mov      word ptr [bp - 4], ax
1:05FC  f7c70300          test     di, 3
1:0600  7503              jne      0x605
1:0602  ff46fc            inc      word ptr [bp - 4]
1:0605  8b7c0a            mov      di, word ptr [si + 0xa]
1:0608  83ef46            sub      di, 0x46
1:060B  8bc7              mov      ax, di
1:060D  b96d01            mov      cx, 0x16d
1:0610  f7e9              imul     cx
1:0612  8bc8              mov      cx, ax
1:0614  8d4501            lea      ax, [di + 1]
1:0617  8bd9              mov      bx, cx
1:0619  99                cdq      
1:061A  33c2              xor      ax, dx
1:061C  2bc2              sub      ax, dx
1:061E  b90200            mov      cx, 2
1:0621  d3f8              sar      ax, cl
1:0623  33c2              xor      ax, dx
1:0625  2bc2              sub      ax, dx
1:0627  03c3              add      ax, bx
1:0629  0346fc            add      ax, word ptr [bp - 4]
1:062C  050400            add      ax, 4
1:062F  b90700            mov      cx, 7
1:0632  99                cdq      
1:0633  f7f9              idiv     cx
1:0635  2b56fc            sub      dx, word ptr [bp - 4]
1:0638  f7da              neg      dx
1:063A  837c0803          cmp      word ptr [si + 8], 3
1:063E  7512              jne      0x652
1:0640  3b540e            cmp      dx, word ptr [si + 0xe]
1:0643  7c08              jl       0x64d
1:0645  751a              jne      0x661
1:0647  837c0402          cmp      word ptr [si + 4], 2
1:064B  7c14              jl       0x661
1:064D  b80100            mov      ax, 1
1:0650  eb11              jmp      0x663
1:0652  8bc2              mov      ax, dx
1:0654  39440e            cmp      word ptr [si + 0xe], ax
1:0657  7cf4              jl       0x64d
1:0659  7506              jne      0x661
1:065B  837c0401          cmp      word ptr [si + 4], 1
1:065F  7cec              jl       0x64d
1:0661  2bc0              sub      ax, ax
1:0663  5e                pop      si
1:0664  5f                pop      di
1:0665  8be5              mov      sp, bp
1:0667  5d                pop      bp
1:0668  4d                dec      bp
1:0669  cb                retf     
1:066A  8cd8              mov      ax, ds
1:066C  90                nop      
1:066D  45                inc      bp
1:066E  55                push     bp
1:066F  8bec              mov      bp, sp
1:0671  1e                push     ds
1:0672  8ed8              mov      ds, ax
1:0674  56                push     si
1:0675  57                push     di
1:0676  1e                push     ds
1:0677  07                pop      es
1:0678  8b5606            mov      dx, word ptr [bp + 6]
1:067B  beed03            mov      si, 0x3ed
1:067E  ad                lodsw    ax, word ptr [si]
1:067F  3bc2              cmp      ax, dx
1:0681  7410              je       0x693
1:0683  40                inc      ax
1:0684  96                xchg     si, ax
1:0685  740c              je       0x693
1:0687  97                xchg     di, ax
1:0688  33c0              xor      ax, ax
1:068A  b9ffff            mov      cx, 0xffff
1:068D  f2ae              repne scasb al, byte ptr es:[di]
1:068F  8bf7              mov      si, di
1:0691  ebeb              jmp      0x67e
1:0693  96                xchg     si, ax
1:0694  5f                pop      di
1:0695  5e                pop      si
1:0696  83ed02            sub      bp, 2
1:0699  8be5              mov      sp, bp
1:069B  1f                pop      ds
1:069C  5d                pop      bp
1:069D  4d                dec      bp
1:069E  ca0200            retf     2
1:06A1  8cd8              mov      ax, ds
1:06A3  90                nop      
1:06A4  45                inc      bp
1:06A5  55                push     bp
1:06A6  8bec              mov      bp, sp
1:06A8  1e                push     ds
1:06A9  8ed8              mov      ds, ax
1:06AB  57                push     di
1:06AC  ff7606            push     word ptr [bp + 6]
1:06AF  0e                push     cs
1:06B0  e8b7ff            call     0x66a
1:06B3  0bc0              or       ax, ax
1:06B5  7412              je       0x6c9
1:06B7  8d0edc03          lea      cx, [0x3dc]
1:06BB  1e                push     ds
1:06BC  51                push     cx
1:06BD  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.OutputDebugString
1:06C2  1e                push     ds
1:06C3  50                push     ax
1:06C4  9abe060000        lcall    0, 0x6be  ; @1:KERNEL.OutputDebugString
1:06C9  5f                pop      di
1:06CA  83ed02            sub      bp, 2
1:06CD  8be5              mov      sp, bp
1:06CF  1f                pop      ds
1:06D0  5d                pop      bp
1:06D1  4d                dec      bp
1:06D2  ca0200            retf     2
1:06D5  00558b            add      byte ptr [di - 0x75], dl
1:06D8  ec                in       al, dx
1:06D9  57                push     di
1:06DA  56                push     si
1:06DB  1e                push     ds
1:06DC  07                pop      es
1:06DD  8b7e06            mov      di, word ptr [bp + 6]
1:06E0  8b7608            mov      si, word ptr [bp + 8]
1:06E3  8bdf              mov      bx, di
1:06E5  8b4e0a            mov      cx, word ptr [bp + 0xa]
1:06E8  e30c              jcxz     0x6f6
1:06EA  ac                lodsb    al, byte ptr [si]
1:06EB  0ac0              or       al, al
1:06ED  7403              je       0x6f2
1:06EF  aa                stosb    byte ptr es:[di], al
1:06F0  e2f8              loop     0x6ea
1:06F2  32c0              xor      al, al
1:06F4  f3aa              rep stosb byte ptr es:[di], al
1:06F6  8bc3              mov      ax, bx
1:06F8  5e                pop      si
1:06F9  5f                pop      di
1:06FA  8be5              mov      sp, bp
1:06FC  5d                pop      bp
1:06FD  cb                retf     

; ===== EXPORT:ord_63(#63) =====
1:06FE  e9a702            jmp      0x9a8
1:0701  004555            add      byte ptr [di + 0x55], al
1:0704  8bec              mov      bp, sp
1:0706  57                push     di
1:0707  56                push     si
1:0708  8b36a903          mov      si, word ptr [0x3a9]
1:070C  0bf6              or       si, si
1:070E  744b              je       0x75b
1:0710  837e0600          cmp      word ptr [bp + 6], 0
1:0714  7445              je       0x75b
1:0716  ff7606            push     word ptr [bp + 6]
1:0719  9a29070000        lcall    0, 0x729  ; @1:INT:ord_52(1:01D2)
1:071E  83c402            add      sp, 2
1:0721  8bf8              mov      di, ax
1:0723  eb31              jmp      0x756
1:0725  90                nop      
1:0726  ff34              push     word ptr [si]
1:0728  9a0e470000        lcall    0, 0x470e  ; @1:INT:ord_52(1:01D2)
1:072D  83c402            add      sp, 2
1:0730  3bc7              cmp      ax, di
1:0732  7e20              jle      0x754
1:0734  8b1c              mov      bx, word ptr [si]
1:0736  80393d            cmp      byte ptr [bx + di], 0x3d
1:0739  7519              jne      0x754
1:073B  57                push     di
1:073C  ff7606            push     word ptr [bp + 6]
1:073F  53                push     bx
1:0740  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_69(1:096E)
1:0745  83c406            add      sp, 6
1:0748  0bc0              or       ax, ax
1:074A  7508              jne      0x754
1:074C  8b04              mov      ax, word ptr [si]
1:074E  03c7              add      ax, di
1:0750  40                inc      ax
1:0751  eb0a              jmp      0x75d
1:0753  90                nop      
1:0754  46                inc      si
1:0755  46                inc      si
1:0756  833c00            cmp      word ptr [si], 0
1:0759  75cb              jne      0x726
1:075B  2bc0              sub      ax, ax
1:075D  5e                pop      si
1:075E  5f                pop      di
1:075F  8be5              mov      sp, bp
1:0761  5d                pop      bp
1:0762  4d                dec      bp
1:0763  cb                retf     

; ===== EXPORT:ord_65(#65) =====
1:0764  55                push     bp
1:0765  8bec              mov      bp, sp
1:0767  57                push     di
1:0768  56                push     si
1:0769  1e                push     ds
1:076A  8b4e0e            mov      cx, word ptr [bp + 0xe]
1:076D  e327              jcxz     0x796
1:076F  8bd9              mov      bx, cx
1:0771  c47e06            les      di, ptr [bp + 6]
1:0774  8bf7              mov      si, di
1:0776  33c0              xor      ax, ax
1:0778  f2ae              repne scasb al, byte ptr es:[di]
1:077A  f7d9              neg      cx
1:077C  03cb              add      cx, bx
1:077E  8bfe              mov      di, si
1:0780  c5760a            lds      si, ptr [bp + 0xa]
1:0783  f3a6              repe cmpsb byte ptr [si], byte ptr es:[di]
1:0785  8a44ff            mov      al, byte ptr [si - 1]
1:0788  33c9              xor      cx, cx
1:078A  263a45ff          cmp      al, byte ptr es:[di - 1]
1:078E  7704              ja       0x794
1:0790  7404              je       0x796
1:0792  49                dec      cx
1:0793  49                dec      cx
1:0794  f7d1              not      cx
1:0796  8bc1              mov      ax, cx
1:0798  1f                pop      ds
1:0799  5e                pop      si
1:079A  5f                pop      di
1:079B  8be5              mov      sp, bp
1:079D  5d                pop      bp
1:079E  cb                retf     
1:079F  00558b            add      byte ptr [di - 0x75], dl
1:07A2  ec                in       al, dx
1:07A3  57                push     di
1:07A4  56                push     si
1:07A5  1e                push     ds
1:07A6  c47e06            les      di, ptr [bp + 6]
1:07A9  c5760a            lds      si, ptr [bp + 0xa]
1:07AC  8bdf              mov      bx, di
1:07AE  8b4e0e            mov      cx, word ptr [bp + 0xe]
1:07B1  e30c              jcxz     0x7bf
1:07B3  ac                lodsb    al, byte ptr [si]
1:07B4  0ac0              or       al, al
1:07B6  7403              je       0x7bb
1:07B8  aa                stosb    byte ptr es:[di], al
1:07B9  e2f8              loop     0x7b3
1:07BB  32c0              xor      al, al
1:07BD  f3aa              rep stosb byte ptr es:[di], al
1:07BF  8bc3              mov      ax, bx
1:07C1  8cc2              mov      dx, es
1:07C3  1f                pop      ds
1:07C4  5e                pop      si
1:07C5  5f                pop      di
1:07C6  8be5              mov      sp, bp
1:07C8  5d                pop      bp
1:07C9  cb                retf     

; ===== EXPORT:ord_66(#66) =====
1:07CA  55                push     bp
1:07CB  8bec              mov      bp, sp
1:07CD  8bd7              mov      dx, di
1:07CF  c47e06            les      di, ptr [bp + 6]
1:07D2  33c0              xor      ax, ax
1:07D4  b9ffff            mov      cx, 0xffff
1:07D7  f2ae              repne scasb al, byte ptr es:[di]
1:07D9  f7d1              not      cx
1:07DB  49                dec      cx
1:07DC  91                xchg     cx, ax
1:07DD  8bfa              mov      di, dx
1:07DF  5d                pop      bp
1:07E0  cb                retf     
1:07E1  008cd890          add      byte ptr [si - 0x6f28], cl
1:07E5  45                inc      bp
1:07E6  55                push     bp
1:07E7  8bec              mov      bp, sp
1:07E9  1e                push     ds
1:07EA  8ed8              mov      ds, ax
1:07EC  8c1ead03          mov      word ptr [0x3ad], ds
1:07F0  b80035            mov      ax, 0x3500
1:07F3  cd21              int      0x21
1:07F5  891e7403          mov      word ptr [0x374], bx
1:07F9  8c067603          mov      word ptr [0x376], es
1:07FD  0e                push     cs
1:07FE  1f                pop      ds
1:07FF  b80025            mov      ax, 0x2500
1:0802  bafc09            mov      dx, 0x9fc
1:0805  cd21              int      0x21
1:0807  16                push     ss
1:0808  1f                pop      ds
1:0809  8b0ebc03          mov      cx, word ptr [0x3bc]
1:080D  e32e              jcxz     0x83d
1:080F  8e068803          mov      es, word ptr [0x388]
1:0813  268b362c00        mov      si, word ptr es:[0x2c]
1:0818  c506be03          lds      ax, ptr [0x3be]
1:081C  8cda              mov      dx, ds
1:081E  33db              xor      bx, bx
1:0820  36ff1eba03        lcall    ss:[0x3ba]
1:0825  7305              jae      0x82c
1:0827  16                push     ss
1:0828  1f                pop      ds
1:0829  e9f801            jmp      0xa24
1:082C  36c506c203        lds      ax, ptr ss:[0x3c2]
1:0831  8cda              mov      dx, ds
1:0833  bb0300            mov      bx, 3
1:0836  36ff1eba03        lcall    ss:[0x3ba]
1:083B  16                push     ss
1:083C  1f                pop      ds
1:083D  8e068803          mov      es, word ptr [0x388]
1:0841  268b0e2c00        mov      cx, word ptr es:[0x2c]
1:0846  e33e              jcxz     0x886
1:0848  8ec1              mov      es, cx
1:084A  33ff              xor      di, di
1:084C  26803d00          cmp      byte ptr es:[di], 0
1:0850  7434              je       0x886
1:0852  b90d00            mov      cx, 0xd
1:0855  be6603            mov      si, 0x366
1:0858  f3a6              repe cmpsb byte ptr [si], byte ptr es:[di]
1:085A  740b              je       0x867
1:085C  b9ff7f            mov      cx, 0x7fff
1:085F  33c0              xor      ax, ax
1:0861  f2ae              repne scasb al, byte ptr es:[di]
1:0863  7521              jne      0x886
1:0865  ebe5              jmp      0x84c
1:0867  06                push     es
1:0868  1e                push     ds
1:0869  07                pop      es
1:086A  1f                pop      ds
1:086B  8bf7              mov      si, di
1:086D  bf9103            mov      di, 0x391
1:0870  b104              mov      cl, 4
1:0872  ac                lodsb    al, byte ptr [si]
1:0873  2c41              sub      al, 0x41
1:0875  720d              jb       0x884
1:0877  d2e0              shl      al, cl
1:0879  92                xchg     dx, ax
1:087A  ac                lodsb    al, byte ptr [si]
1:087B  2c41              sub      al, 0x41
1:087D  7205              jb       0x884
1:087F  0ac2              or       al, dl
1:0881  aa                stosb    byte ptr es:[di], al
1:0882  ebee              jmp      0x872
1:0884  16                push     ss
1:0885  1f                pop      ds
1:0886  bec603            mov      si, 0x3c6
1:0889  bfc603            mov      di, 0x3c6
1:088C  e8cb00            call     0x95a
1:088F  bec603            mov      si, 0x3c6
1:0892  bfc603            mov      di, 0x3c6
1:0895  e8c200            call     0x95a
1:0898  83ed02            sub      bp, 2
1:089B  8be5              mov      sp, bp
1:089D  1f                pop      ds
1:089E  5d                pop      bp
1:089F  4d                dec      bp
1:08A0  cb                retf     
1:08A1  8cd8              mov      ax, ds
1:08A3  90                nop      
1:08A4  45                inc      bp
1:08A5  55                push     bp
1:08A6  8bec              mov      bp, sp
1:08A8  1e                push     ds
1:08A9  8ed8              mov      ds, ax
1:08AB  33c9              xor      cx, cx
1:08AD  eb2f              jmp      0x8de
1:08AF  8cd8              mov      ax, ds
1:08B1  90                nop      
1:08B2  45                inc      bp
1:08B3  55                push     bp
1:08B4  8bec              mov      bp, sp
1:08B6  1e                push     ds
1:08B7  8ed8              mov      ds, ax
1:08B9  b90100            mov      cx, 1
1:08BC  eb20              jmp      0x8de
1:08BE  8cd8              mov      ax, ds
1:08C0  90                nop      
1:08C1  45                inc      bp
1:08C2  55                push     bp
1:08C3  8bec              mov      bp, sp
1:08C5  1e                push     ds
1:08C6  8ed8              mov      ds, ax
1:08C8  56                push     si
1:08C9  57                push     di
1:08CA  b90001            mov      cx, 0x100
1:08CD  eb0f              jmp      0x8de
1:08CF  8cd8              mov      ax, ds
1:08D1  90                nop      
1:08D2  45                inc      bp
1:08D3  55                push     bp
1:08D4  8bec              mov      bp, sp
1:08D6  1e                push     ds
1:08D7  8ed8              mov      ds, ax
1:08D9  56                push     si
1:08DA  57                push     di
1:08DB  b90101            mov      cx, 0x101
1:08DE  51                push     cx
1:08DF  0ac9              or       cl, cl
1:08E1  751e              jne      0x901
1:08E3  be8408            mov      si, 0x884
1:08E6  bf8408            mov      di, 0x884
1:08E9  e86e00            call     0x95a
1:08EC  bec603            mov      si, 0x3c6
1:08EF  bfc603            mov      di, 0x3c6
1:08F2  e86500            call     0x95a
1:08F5  813ec603d6d6      cmp      word ptr [0x3c6], 0xd6d6
1:08FB  7504              jne      0x901
1:08FD  ff16cc03          call     word ptr [0x3cc]
1:0901  bec603            mov      si, 0x3c6
1:0904  bfc603            mov      di, 0x3c6
1:0907  e85000            call     0x95a
1:090A  bec603            mov      si, 0x3c6
1:090D  bfc603            mov      di, 0x3c6
1:0910  e84700            call     0x95a
1:0913  e81700            call     0x92d
1:0916  58                pop      ax
1:0917  0ae4              or       ah, ah
1:0919  7507              jne      0x922
1:091B  8b4606            mov      ax, word ptr [bp + 6]
1:091E  b44c              mov      ah, 0x4c
1:0920  cd21              int      0x21
1:0922  5f                pop      di
1:0923  5e                pop      si
1:0924  83ed02            sub      bp, 2
1:0927  8be5              mov      sp, bp
1:0929  1f                pop      ds
1:092A  5d                pop      bp
1:092B  4d                dec      bp
1:092C  cb                retf     
1:092D  8b0ebc03          mov      cx, word ptr [0x3bc]
1:0931  e307              jcxz     0x93a
1:0933  bb0200            mov      bx, 2
1:0936  ff1eba03          lcall    [0x3ba]
1:093A  1e                push     ds
1:093B  c5167403          lds      dx, ptr [0x374]
1:093F  b80025            mov      ax, 0x2500
1:0942  cd21              int      0x21
1:0944  1f                pop      ds
1:0945  803eb20300        cmp      byte ptr [0x3b2], 0
1:094A  740d              je       0x959
1:094C  1e                push     ds
1:094D  a0b303            mov      al, byte ptr [0x3b3]
1:0950  c516b403          lds      dx, ptr [0x3b4]
1:0954  b425              mov      ah, 0x25
1:0956  cd21              int      0x21
1:0958  1f                pop      ds
1:0959  c3                ret      
1:095A  3bf7              cmp      si, di
1:095C  730e              jae      0x96c
1:095E  83ef04            sub      di, 4
1:0961  8b05              mov      ax, word ptr [di]
1:0963  0b4502            or       ax, word ptr [di + 2]
1:0966  74f2              je       0x95a
1:0968  ff1d              lcall    [di]
1:096A  ebee              jmp      0x95a
1:096C  c3                ret      
1:096D  00558b            add      byte ptr [di - 0x75], dl
1:0970  ec                in       al, dx
1:0971  57                push     di
1:0972  56                push     si
1:0973  1e                push     ds
1:0974  07                pop      es
1:0975  8b4e0a            mov      cx, word ptr [bp + 0xa]
1:0978  e326              jcxz     0x9a0
1:097A  8bd9              mov      bx, cx
1:097C  8b7e06            mov      di, word ptr [bp + 6]
1:097F  8bf7              mov      si, di
1:0981  33c0              xor      ax, ax
1:0983  f2ae              repne scasb al, byte ptr es:[di]
1:0985  f7d9              neg      cx
1:0987  03cb              add      cx, bx
1:0989  8bfe              mov      di, si
1:098B  8b7608            mov      si, word ptr [bp + 8]
1:098E  f3a6              repe cmpsb byte ptr [si], byte ptr es:[di]
1:0990  8a44ff            mov      al, byte ptr [si - 1]
1:0993  33c9              xor      cx, cx
1:0995  3a45ff            cmp      al, byte ptr [di - 1]
1:0998  7704              ja       0x99e
1:099A  7404              je       0x9a0
1:099C  49                dec      cx
1:099D  49                dec      cx
1:099E  f7d1              not      cx
1:09A0  8bc1              mov      ax, cx
1:09A2  5e                pop      si
1:09A3  5f                pop      di
1:09A4  8be5              mov      sp, bp
1:09A6  5d                pop      bp
1:09A7  cb                retf     
1:09A8  55                push     bp
1:09A9  8bec              mov      bp, sp
1:09AB  57                push     di
1:09AC  56                push     si
1:09AD  8b7606            mov      si, word ptr [bp + 6]
1:09B0  33c0              xor      ax, ax
1:09B2  99                cdq      
1:09B3  33db              xor      bx, bx
1:09B5  ac                lodsb    al, byte ptr [si]
1:09B6  3c20              cmp      al, 0x20
1:09B8  74fb              je       0x9b5
1:09BA  3c09              cmp      al, 9
1:09BC  74f7              je       0x9b5
1:09BE  50                push     ax
1:09BF  3c2d              cmp      al, 0x2d
1:09C1  7404              je       0x9c7
1:09C3  3c2b              cmp      al, 0x2b
1:09C5  7501              jne      0x9c8
1:09C7  ac                lodsb    al, byte ptr [si]
1:09C8  3c39              cmp      al, 0x39
1:09CA  771f              ja       0x9eb
1:09CC  2c30              sub      al, 0x30
1:09CE  721b              jb       0x9eb
1:09D0  d1e3              shl      bx, 1
1:09D2  d1d2              rcl      dx, 1
1:09D4  8bcb              mov      cx, bx
1:09D6  8bfa              mov      di, dx
1:09D8  d1e3              shl      bx, 1
1:09DA  d1d2              rcl      dx, 1
1:09DC  d1e3              shl      bx, 1
1:09DE  d1d2              rcl      dx, 1
1:09E0  03d9              add      bx, cx
1:09E2  13d7              adc      dx, di
1:09E4  03d8              add      bx, ax
1:09E6  83d200            adc      dx, 0
1:09E9  ebdc              jmp      0x9c7
1:09EB  58                pop      ax
1:09EC  3c2d              cmp      al, 0x2d
1:09EE  93                xchg     bx, ax
1:09EF  7507              jne      0x9f8
1:09F1  f7d8              neg      ax
1:09F3  83d200            adc      dx, 0
1:09F6  f7da              neg      dx
1:09F8  5e                pop      si
1:09F9  5f                pop      di
1:09FA  5d                pop      bp
1:09FB  cb                retf     
1:09FC  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_70(1:0A2A)
1:0A01  8ed8              mov      ds, ax
1:0A03  b80300            mov      ax, 3
1:0A06  50                push     ax
1:0A07  0e                push     cs
1:0A08  e896fc            call     0x6a1
1:0A0B  b80000            mov      ax, 0
1:0A0E  50                push     ax
1:0A0F  1e                push     ds
1:0A10  8d06dc03          lea      ax, [0x3dc]
1:0A14  50                push     ax
1:0A15  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.FatalAppExit
1:0A1A  b8ff00            mov      ax, 0xff
1:0A1D  50                push     ax
1:0A1E  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.FatalExit
1:0A23  00b80200          add      byte ptr [bx + si + 2], bh
1:0A27  e9dcff            jmp      0xa06

; ===== EXPORT:ord_70(#70) =====
1:0A2A  2e803e3a0ab8      cmp      byte ptr cs:[0xa3a], 0xb8
1:0A30  7403              je       0xa35
1:0A32  8cd0              mov      ax, ss
1:0A34  cb                retf     
1:0A35  2ea13b0a          mov      ax, word ptr cs:[0xa3b]
1:0A39  cb                retf     

; ===== EXPORT:___EXPORTEDSTUB(#3) =====
1:0A3A  1e                push     ds
1:0A3B  58                pop      ax
1:0A3C  90                nop      
1:0A3D  45                inc      bp
1:0A3E  55                push     bp
1:0A3F  8bec              mov      bp, sp
1:0A41  1e                push     ds
1:0A42  8ed8              mov      ds, ax
1:0A44  2bc0              sub      ax, ax
1:0A46  4d                dec      bp
1:0A47  4d                dec      bp
1:0A48  8be5              mov      sp, bp
1:0A4A  1f                pop      ds
1:0A4B  5d                pop      bp
1:0A4C  4d                dec      bp
1:0A4D  cb                retf     

; ===== ENTRY_POINT =====
1:0A4E  8cd8              mov      ax, ds
1:0A50  90                nop      
1:0A51  45                inc      bp
1:0A52  55                push     bp
1:0A53  8bec              mov      bp, sp
1:0A55  1e                push     ds
1:0A56  8ed8              mov      ds, ax
1:0A58  57                push     di
1:0A59  1e                push     ds
1:0A5A  51                push     cx
1:0A5B  06                push     es
1:0A5C  56                push     si
1:0A5D  e30e              jcxz     0xa6d
1:0A5F  33c0              xor      ax, ax
1:0A61  1e                push     ds
1:0A62  50                push     ax
1:0A63  51                push     cx
1:0A64  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LocalInit
1:0A69  0bc0              or       ax, ax
1:0A6B  7407              je       0xa74
1:0A6D  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_6(1:45CE)
1:0A72  eb05              jmp      0xa79
1:0A74  5e                pop      si
1:0A75  07                pop      es
1:0A76  59                pop      cx
1:0A77  1f                pop      ds
1:0A78  5f                pop      di
1:0A79  8d66fe            lea      sp, [bp - 2]
1:0A7C  1f                pop      ds
1:0A7D  5d                pop      bp
1:0A7E  4d                dec      bp
1:0A7F  cb                retf     

; ===== EXPORT:ord_46(#46) =====
1:0A80  1e                push     ds
1:0A81  58                pop      ax
1:0A82  90                nop      
1:0A83  45                inc      bp
1:0A84  55                push     bp
1:0A85  8bec              mov      bp, sp
1:0A87  1e                push     ds
1:0A88  8ed8              mov      ds, ax
1:0A8A  57                push     di
1:0A8B  56                push     si
1:0A8C  ff369208          push     word ptr [0x892]
1:0A90  ff7606            push     word ptr [bp + 6]
1:0A93  ff7608            push     word ptr [bp + 8]
1:0A96  b8ffff            mov      ax, 0xffff
1:0A99  baff00            mov      dx, 0xff
1:0A9C  52                push     dx
1:0A9D  50                push     ax
1:0A9E  9abb0a0000        lcall    0, 0xabb  ; @1:GDI.SetPixel
1:0AA3  ff369208          push     word ptr [0x892]
1:0AA7  8b4606            mov      ax, word ptr [bp + 6]
1:0AAA  f7d8              neg      ax
1:0AAC  50                push     ax
1:0AAD  ff7608            push     word ptr [bp + 8]
1:0AB0  b9ffff            mov      cx, 0xffff
1:0AB3  baff00            mov      dx, 0xff
1:0AB6  52                push     dx
1:0AB7  51                push     cx
1:0AB8  8bf0              mov      si, ax
1:0ABA  9ad70a0000        lcall    0, 0xad7  ; @1:GDI.SetPixel
1:0ABF  ff369208          push     word ptr [0x892]
1:0AC3  8b4608            mov      ax, word ptr [bp + 8]
1:0AC6  f7d8              neg      ax
1:0AC8  50                push     ax
1:0AC9  ff7606            push     word ptr [bp + 6]
1:0ACC  b9ffff            mov      cx, 0xffff
1:0ACF  baff00            mov      dx, 0xff
1:0AD2  52                push     dx
1:0AD3  51                push     cx
1:0AD4  8bf8              mov      di, ax
1:0AD6  9aec0a0000        lcall    0, 0xaec  ; @1:GDI.SetPixel
1:0ADB  ff369208          push     word ptr [0x892]
1:0ADF  ff7606            push     word ptr [bp + 6]
1:0AE2  57                push     di
1:0AE3  b8ffff            mov      ax, 0xffff
1:0AE6  baff00            mov      dx, 0xff
1:0AE9  52                push     dx
1:0AEA  50                push     ax
1:0AEB  9a010b0000        lcall    0, 0xb01  ; @1:GDI.SetPixel
1:0AF0  ff369208          push     word ptr [0x892]
1:0AF4  ff7608            push     word ptr [bp + 8]
1:0AF7  56                push     si
1:0AF8  b8ffff            mov      ax, 0xffff
1:0AFB  baff00            mov      dx, 0xff
1:0AFE  52                push     dx
1:0AFF  50                push     ax
1:0B00  9a140b0000        lcall    0, 0xb14  ; @1:GDI.SetPixel
1:0B05  ff369208          push     word ptr [0x892]
1:0B09  56                push     si
1:0B0A  57                push     di
1:0B0B  b8ffff            mov      ax, 0xffff
1:0B0E  baff00            mov      dx, 0xff
1:0B11  52                push     dx
1:0B12  50                push     ax
1:0B13  9a2b0b0000        lcall    0, 0xb2b  ; @1:GDI.SetPixel
1:0B18  ff369208          push     word ptr [0x892]
1:0B1C  ff7608            push     word ptr [bp + 8]
1:0B1F  ff7606            push     word ptr [bp + 6]
1:0B22  b8ffff            mov      ax, 0xffff
1:0B25  baff00            mov      dx, 0xff
1:0B28  52                push     dx
1:0B29  50                push     ax
1:0B2A  9a3e0b0000        lcall    0, 0xb3e  ; @1:GDI.SetPixel
1:0B2F  ff369208          push     word ptr [0x892]
1:0B33  57                push     di
1:0B34  56                push     si
1:0B35  b8ffff            mov      ax, 0xffff
1:0B38  baff00            mov      dx, 0xff
1:0B3B  52                push     dx
1:0B3C  50                push     ax
1:0B3D  9a770b0000        lcall    0, 0xb77  ; @1:GDI.SetPixel
1:0B42  5e                pop      si
1:0B43  5f                pop      di
1:0B44  4d                dec      bp
1:0B45  4d                dec      bp
1:0B46  8be5              mov      sp, bp
1:0B48  1f                pop      ds
1:0B49  5d                pop      bp
1:0B4A  4d                dec      bp
1:0B4B  cb                retf     

; ===== EXPORT:ord_47(#47) =====
1:0B4C  1e                push     ds
1:0B4D  58                pop      ax
1:0B4E  90                nop      
1:0B4F  45                inc      bp
1:0B50  55                push     bp
1:0B51  8bec              mov      bp, sp
1:0B53  1e                push     ds
1:0B54  8ed8              mov      ds, ax
1:0B56  57                push     di
1:0B57  56                push     si
1:0B58  ff369208          push     word ptr [0x892]
1:0B5C  ff7606            push     word ptr [bp + 6]
1:0B5F  ff7608            push     word ptr [bp + 8]
1:0B62  8b5e0a            mov      bx, word ptr [bp + 0xa]
1:0B65  8a6703            mov      ah, byte ptr [bx + 3]
1:0B68  2ac0              sub      al, al
1:0B6A  8a4f01            mov      cl, byte ptr [bx + 1]
1:0B6D  2aed              sub      ch, ch
1:0B6F  0bc1              or       ax, cx
1:0B71  8a4f05            mov      cl, byte ptr [bx + 5]
1:0B74  51                push     cx
1:0B75  50                push     ax
1:0B76  9a9f0b0000        lcall    0, 0xb9f  ; @1:GDI.SetPixel
1:0B7B  ff369208          push     word ptr [0x892]
1:0B7F  8b4606            mov      ax, word ptr [bp + 6]
1:0B82  f7d8              neg      ax
1:0B84  50                push     ax
1:0B85  ff7608            push     word ptr [bp + 8]
1:0B88  8b5e0a            mov      bx, word ptr [bp + 0xa]
1:0B8B  8a6f03            mov      ch, byte ptr [bx + 3]
1:0B8E  2ac9              sub      cl, cl
1:0B90  8a5701            mov      dl, byte ptr [bx + 1]
1:0B93  2af6              sub      dh, dh
1:0B95  0bca              or       cx, dx
1:0B97  8a5705            mov      dl, byte ptr [bx + 5]
1:0B9A  52                push     dx
1:0B9B  51                push     cx
1:0B9C  8bf0              mov      si, ax
1:0B9E  9ac70b0000        lcall    0, 0xbc7  ; @1:GDI.SetPixel
1:0BA3  ff369208          push     word ptr [0x892]
1:0BA7  8b4608            mov      ax, word ptr [bp + 8]
1:0BAA  f7d8              neg      ax
1:0BAC  50                push     ax
1:0BAD  ff7606            push     word ptr [bp + 6]
1:0BB0  8b5e0a            mov      bx, word ptr [bp + 0xa]
1:0BB3  8a6f03            mov      ch, byte ptr [bx + 3]
1:0BB6  2ac9              sub      cl, cl
1:0BB8  8a5701            mov      dl, byte ptr [bx + 1]
1:0BBB  2af6              sub      dh, dh
1:0BBD  0bca              or       cx, dx
1:0BBF  8a5705            mov      dl, byte ptr [bx + 5]
1:0BC2  52                push     dx
1:0BC3  51                push     cx
1:0BC4  8bf8              mov      di, ax
1:0BC6  9aea0b0000        lcall    0, 0xbea  ; @1:GDI.SetPixel
1:0BCB  ff369208          push     word ptr [0x892]
1:0BCF  ff7606            push     word ptr [bp + 6]
1:0BD2  57                push     di
1:0BD3  8b5e0a            mov      bx, word ptr [bp + 0xa]
1:0BD6  8a4705            mov      al, byte ptr [bx + 5]
1:0BD9  2ae4              sub      ah, ah
1:0BDB  8a4f01            mov      cl, byte ptr [bx + 1]
1:0BDE  8a7703            mov      dh, byte ptr [bx + 3]
1:0BE1  2ad2              sub      dl, dl
1:0BE3  2aed              sub      ch, ch
1:0BE5  0bd1              or       dx, cx
1:0BE7  50                push     ax
1:0BE8  52                push     dx
1:0BE9  9a0d0c0000        lcall    0, 0xc0d  ; @1:GDI.SetPixel
1:0BEE  ff369208          push     word ptr [0x892]
1:0BF2  ff7608            push     word ptr [bp + 8]
1:0BF5  56                push     si
1:0BF6  8b5e0a            mov      bx, word ptr [bp + 0xa]
1:0BF9  8a4705            mov      al, byte ptr [bx + 5]
1:0BFC  2ae4              sub      ah, ah
1:0BFE  8a4f01            mov      cl, byte ptr [bx + 1]
1:0C01  8a7703            mov      dh, byte ptr [bx + 3]
1:0C04  2ad2              sub      dl, dl
1:0C06  2aed              sub      ch, ch
1:0C08  0bd1              or       dx, cx
1:0C0A  50                push     ax
1:0C0B  52                push     dx
1:0C0C  9a2e0c0000        lcall    0, 0xc2e  ; @1:GDI.SetPixel
1:0C11  ff369208          push     word ptr [0x892]
1:0C15  56                push     si
1:0C16  57                push     di
1:0C17  8b5e0a            mov      bx, word ptr [bp + 0xa]
1:0C1A  8a4705            mov      al, byte ptr [bx + 5]
1:0C1D  2ae4              sub      ah, ah
1:0C1F  8a4f01            mov      cl, byte ptr [bx + 1]
1:0C22  8a7703            mov      dh, byte ptr [bx + 3]
1:0C25  2ad2              sub      dl, dl
1:0C27  2aed              sub      ch, ch
1:0C29  0bd1              or       dx, cx
1:0C2B  50                push     ax
1:0C2C  52                push     dx
1:0C2D  9a530c0000        lcall    0, 0xc53  ; @1:GDI.SetPixel
1:0C32  ff369208          push     word ptr [0x892]
1:0C36  ff7608            push     word ptr [bp + 8]
1:0C39  ff7606            push     word ptr [bp + 6]
1:0C3C  8b5e0a            mov      bx, word ptr [bp + 0xa]
1:0C3F  8a4705            mov      al, byte ptr [bx + 5]
1:0C42  2ae4              sub      ah, ah
1:0C44  8a4f01            mov      cl, byte ptr [bx + 1]
1:0C47  8a7703            mov      dh, byte ptr [bx + 3]
1:0C4A  2ad2              sub      dl, dl
1:0C4C  2aed              sub      ch, ch
1:0C4E  0bd1              or       dx, cx
1:0C50  50                push     ax
1:0C51  52                push     dx
1:0C52  9a720c0000        lcall    0, 0xc72  ; @1:GDI.SetPixel
1:0C57  ff369208          push     word ptr [0x892]
1:0C5B  57                push     di
1:0C5C  56                push     si
1:0C5D  8b5e0a            mov      bx, word ptr [bp + 0xa]
1:0C60  8a6703            mov      ah, byte ptr [bx + 3]
1:0C63  2ac0              sub      al, al
1:0C65  8a4f01            mov      cl, byte ptr [bx + 1]
1:0C68  2aed              sub      ch, ch
1:0C6A  0bc1              or       ax, cx
1:0C6C  8a4f05            mov      cl, byte ptr [bx + 5]
1:0C6F  51                push     cx
1:0C70  50                push     ax
1:0C71  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetPixel
1:0C76  5e                pop      si
1:0C77  5f                pop      di
1:0C78  4d                dec      bp
1:0C79  4d                dec      bp
1:0C7A  8be5              mov      sp, bp
1:0C7C  1f                pop      ds
1:0C7D  5d                pop      bp
1:0C7E  4d                dec      bp
1:0C7F  cb                retf     
1:0C80  1e                push     ds
1:0C81  58                pop      ax
1:0C82  90                nop      
1:0C83  45                inc      bp
1:0C84  55                push     bp
1:0C85  8bec              mov      bp, sp
1:0C87  1e                push     ds
1:0C88  8ed8              mov      ds, ax
1:0C8A  2bc0              sub      ax, ax
1:0C8C  50                push     ax
1:0C8D  9aba0c0000        lcall    0, 0xcba  ; @1:INT:ord_9(1:4426)
1:0C92  5b                pop      bx
1:0C93  ff369208          push     word ptr [0x892]
1:0C97  b89c08            mov      ax, 0x89c
1:0C9A  1e                push     ds
1:0C9B  50                push     ax
1:0C9C  b80400            mov      ax, 4
1:0C9F  50                push     ax
1:0CA0  9ac7000000        lcall    0, 0xc7  ; @1:GDI.GetStockObject
1:0CA5  50                push     ax
1:0CA6  9ae80c0000        lcall    0, 0xce8  ; @1:USER.FillRect
1:0CAB  0e                push     cs
1:0CAC  e8d801            call     0xe87
1:0CAF  c706be040000      mov      word ptr [0x4be], 0
1:0CB5  b80100            mov      ax, 1
1:0CB8  50                push     ax
1:0CB9  9ad50c0000        lcall    0, 0xcd5  ; @1:INT:ord_9(1:4426)
1:0CBE  5b                pop      bx
1:0CBF  4d                dec      bp
1:0CC0  4d                dec      bp
1:0CC1  8be5              mov      sp, bp
1:0CC3  1f                pop      ds
1:0CC4  5d                pop      bp
1:0CC5  4d                dec      bp
1:0CC6  cb                retf     
1:0CC7  1e                push     ds
1:0CC8  58                pop      ax
1:0CC9  90                nop      
1:0CCA  45                inc      bp
1:0CCB  55                push     bp
1:0CCC  8bec              mov      bp, sp
1:0CCE  1e                push     ds
1:0CCF  8ed8              mov      ds, ax
1:0CD1  ff7606            push     word ptr [bp + 6]
1:0CD4  9af50c0000        lcall    0, 0xcf5  ; @1:INT:ord_9(1:4426)
1:0CD9  5b                pop      bx
1:0CDA  ff369208          push     word ptr [0x892]
1:0CDE  b89c08            mov      ax, 0x89c
1:0CE1  1e                push     ds
1:0CE2  50                push     ax
1:0CE3  ff36ac08          push     word ptr [0x8ac]
1:0CE7  9acd000000        lcall    0, 0xcd  ; @1:USER.FillRect
1:0CEC  0e                push     cs
1:0CED  e89701            call     0xe87
1:0CF0  b80100            mov      ax, 1
1:0CF3  50                push     ax
1:0CF4  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:4426)
1:0CF9  5b                pop      bx
1:0CFA  4d                dec      bp
1:0CFB  4d                dec      bp
1:0CFC  8be5              mov      sp, bp
1:0CFE  1f                pop      ds
1:0CFF  5d                pop      bp
1:0D00  4d                dec      bp
1:0D01  cb                retf     

; ===== EXPORT:ord_4(#4) =====
1:0D02  1e                push     ds
1:0D03  58                pop      ax
1:0D04  90                nop      
1:0D05  45                inc      bp
1:0D06  55                push     bp
1:0D07  8bec              mov      bp, sp
1:0D09  1e                push     ds
1:0D0A  8ed8              mov      ds, ax
1:0D0C  83ec16            sub      sp, 0x16
1:0D0F  8b460c            mov      ax, word ptr [bp + 0xc]
1:0D12  a31e00            mov      word ptr [0x1e], ax
1:0D15  0bc0              or       ax, ax
1:0D17  7403              je       0xd1c
1:0D19  e96301            jmp      0xe7f
1:0D1C  8b4606            mov      ax, word ptr [bp + 6]
1:0D1F  b91e00            mov      cx, 0x1e
1:0D22  99                cdq      
1:0D23  f7f9              idiv     cx
1:0D25  a3a408            mov      word ptr [0x8a4], ax
1:0D28  3b065800          cmp      ax, word ptr [0x58]
1:0D2C  7407              je       0xd35
1:0D2E  a35800            mov      word ptr [0x58], ax
1:0D31  0e                push     cs
1:0D32  e84bff            call     0xc80
1:0D35  b86400            mov      ax, 0x64
1:0D38  2b4606            sub      ax, word ptr [bp + 6]
1:0D3B  d1e0              shl      ax, 1
1:0D3D  a3ae08            mov      word ptr [0x8ae], ax
1:0D40  3b065a00          cmp      ax, word ptr [0x5a]
1:0D44  740d              je       0xd53
1:0D46  a35a00            mov      word ptr [0x5a], ax
1:0D49  a35c00            mov      word ptr [0x5c], ax
1:0D4C  0e                push     cs
1:0D4D  e830ff            call     0xc80
1:0D50  e92c01            jmp      0xe7f
1:0D53  833e100000        cmp      word ptr [0x10], 0
1:0D58  7503              jne      0xd5d
1:0D5A  e9a400            jmp      0xe01
1:0D5D  837e0a00          cmp      word ptr [bp + 0xa], 0
1:0D61  7508              jne      0xd6b
1:0D63  c7065e000100      mov      word ptr [0x5e], 1
1:0D69  eb2c              jmp      0xd97
1:0D6B  837e0a01          cmp      word ptr [bp + 0xa], 1
1:0D6F  7c0e              jl       0xd7f
1:0D71  837e0a0f          cmp      word ptr [bp + 0xa], 0xf
1:0D75  7f08              jg       0xd7f
1:0D77  c7065e000200      mov      word ptr [0x5e], 2
1:0D7D  eb18              jmp      0xd97
1:0D7F  8b460a            mov      ax, word ptr [bp + 0xa]
1:0D82  b90700            mov      cx, 7
1:0D85  99                cdq      
1:0D86  f7f9              idiv     cx
1:0D88  40                inc      ax
1:0D89  a35e00            mov      word ptr [0x5e], ax
1:0D8C  3d0f00            cmp      ax, 0xf
1:0D8F  7e06              jle      0xd97
1:0D91  c7065e000f00      mov      word ptr [0x5e], 0xf
1:0D97  a15e00            mov      ax, word ptr [0x5e]
1:0D9A  39066000          cmp      word ptr [0x60], ax
1:0D9E  7509              jne      0xda9
1:0DA0  8b460a            mov      ax, word ptr [bp + 0xa]
1:0DA3  39066200          cmp      word ptr [0x62], ax
1:0DA7  7446              je       0xdef
1:0DA9  a15e00            mov      ax, word ptr [0x5e]
1:0DAC  a36000            mov      word ptr [0x60], ax
1:0DAF  8b460a            mov      ax, word ptr [bp + 0xa]
1:0DB2  a36200            mov      word ptr [0x62], ax
1:0DB5  0e                push     cs
1:0DB6  e8c7fe            call     0xc80
1:0DB9  837e0a01          cmp      word ptr [bp + 0xa], 1
1:0DBD  7c2a              jl       0xde9
1:0DBF  837e0a0f          cmp      word ptr [bp + 0xa], 0xf
1:0DC3  7f24              jg       0xde9
1:0DC5  c70668000100      mov      word ptr [0x68], 1
1:0DCB  837e0a01          cmp      word ptr [bp + 0xa], 1
1:0DCF  7513              jne      0xde4
1:0DD1  b80f00            mov      ax, 0xf
1:0DD4  50                push     ax
1:0DD5  9a2a0e0000        lcall    0, 0xe2a  ; @1:INT:ord_7(1:42FE)
1:0DDA  5b                pop      bx
1:0DDB  50                push     ax
1:0DDC  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:4511)
1:0DE1  5b                pop      bx
1:0DE2  eb0b              jmp      0xdef
1:0DE4  ff760a            push     word ptr [bp + 0xa]
1:0DE7  ebf3              jmp      0xddc
1:0DE9  c70668000000      mov      word ptr [0x68], 0
1:0DEF  833e680001        cmp      word ptr [0x68], 1
1:0DF4  7517              jne      0xe0d
1:0DF6  b80200            mov      ax, 2
1:0DF9  a35e00            mov      word ptr [0x5e], ax
1:0DFC  a36000            mov      word ptr [0x60], ax
1:0DFF  eb0c              jmp      0xe0d
1:0E01  c70668000000      mov      word ptr [0x68], 0
1:0E07  c7065e000100      mov      word ptr [0x5e], 1
1:0E0D  8b4606            mov      ax, word ptr [bp + 6]
1:0E10  a3b004            mov      word ptr [0x4b0], ax
1:0E13  8b4608            mov      ax, word ptr [bp + 8]
1:0E16  a3b204            mov      word ptr [0x4b2], ax
1:0E19  8b460a            mov      ax, word ptr [bp + 0xa]
1:0E1C  a3b404            mov      word ptr [0x4b4], ax
1:0E1F  8b460c            mov      ax, word ptr [bp + 0xc]
1:0E22  a3b604            mov      word ptr [0x4b6], ax
1:0E25  b80600            mov      ax, 6
1:0E28  50                push     ax
1:0E29  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:42FE)
1:0E2E  5b                pop      bx
1:0E2F  48                dec      ax
1:0E30  7407              je       0xe39
1:0E32  2d0500            sub      ax, 5
1:0E35  7448              je       0xe7f
1:0E37  eb16              jmp      0xe4f
1:0E39  b86400            mov      ax, 0x64
1:0E3C  50                push     ax
1:0E3D  b80100            mov      ax, 1
1:0E40  50                push     ax
1:0E41  9a580f0000        lcall    0, 0xf58  ; @1:INT:ord_11(1:42D6)
1:0E46  5b                pop      bx
1:0E47  5b                pop      bx
1:0E48  0bc0              or       ax, ax
1:0E4A  7433              je       0xe7f
1:0E4C  e9fdfe            jmp      0xd4c
1:0E4F  833e1e0000        cmp      word ptr [0x1e], 0
1:0E54  7529              jne      0xe7f
1:0E56  b80100            mov      ax, 1
1:0E59  50                push     ax
1:0E5A  9a7a0e0000        lcall    0, 0xe7a  ; @1:INT:ord_9(1:4426)
1:0E5F  5b                pop      bx
1:0E60  833e100000        cmp      word ptr [0x10], 0
1:0E65  740a              je       0xe71
1:0E67  ff365e00          push     word ptr [0x5e]
1:0E6B  9a790f0000        lcall    0, 0xf79  ; @1:INT:ord_12(1:4486)
1:0E70  5b                pop      bx
1:0E71  0e                push     cs
1:0E72  e83000            call     0xea5
1:0E75  b80100            mov      ax, 1
1:0E78  50                push     ax
1:0E79  9a8e0c0000        lcall    0, 0xc8e  ; @1:INT:ord_9(1:4426)
1:0E7E  5b                pop      bx
1:0E7F  4d                dec      bp
1:0E80  4d                dec      bp
1:0E81  8be5              mov      sp, bp
1:0E83  1f                pop      ds
1:0E84  5d                pop      bp
1:0E85  4d                dec      bp
1:0E86  cb                retf     

; ===== EXPORT:ord_5(#5) =====
1:0E87  1e                push     ds
1:0E88  58                pop      ax
1:0E89  90                nop      
1:0E8A  45                inc      bp
1:0E8B  55                push     bp
1:0E8C  8bec              mov      bp, sp
1:0E8E  1e                push     ds
1:0E8F  8ed8              mov      ds, ax
1:0E91  c706c0040100      mov      word ptr [0x4c0], 1
1:0E97  c706d6050000      mov      word ptr [0x5d6], 0
1:0E9D  4d                dec      bp
1:0E9E  4d                dec      bp
1:0E9F  8be5              mov      sp, bp
1:0EA1  1f                pop      ds
1:0EA2  5d                pop      bp
1:0EA3  4d                dec      bp
1:0EA4  cb                retf     
1:0EA5  1e                push     ds
1:0EA6  58                pop      ax
1:0EA7  90                nop      
1:0EA8  45                inc      bp
1:0EA9  55                push     bp
1:0EAA  8bec              mov      bp, sp
1:0EAC  1e                push     ds
1:0EAD  8ed8              mov      ds, ax
1:0EAF  83ec22            sub      sp, 0x22
1:0EB2  57                push     di
1:0EB3  56                push     si
1:0EB4  c746fa0000        mov      word ptr [bp - 6], 0
1:0EB9  c746ec0f00        mov      word ptr [bp - 0x14], 0xf
1:0EBE  c746ee0500        mov      word ptr [bp - 0x12], 5
1:0EC3  833e1a0000        cmp      word ptr [0x1a], 0
1:0EC8  7403              je       0xecd
1:0ECA  e91f0e            jmp      0x1cec
1:0ECD  a11000            mov      ax, word ptr [0x10]
1:0ED0  a3bc04            mov      word ptr [0x4bc], ax
1:0ED3  a1a008            mov      ax, word ptr [0x8a0]
1:0ED6  2b069c08          sub      ax, word ptr [0x89c]
1:0EDA  99                cdq      
1:0EDB  2bc2              sub      ax, dx
1:0EDD  d1f8              sar      ax, 1
1:0EDF  8946f2            mov      word ptr [bp - 0xe], ax
1:0EE2  8bc8              mov      cx, ax
1:0EE4  a1a208            mov      ax, word ptr [0x8a2]
1:0EE7  2b069e08          sub      ax, word ptr [0x89e]
1:0EEB  99                cdq      
1:0EEC  2bc2              sub      ax, dx
1:0EEE  d1f8              sar      ax, 1
1:0EF0  8946f0            mov      word ptr [bp - 0x10], ax
1:0EF3  baea05            mov      dx, 0x5ea
1:0EF6  1e                push     ds
1:0EF7  52                push     dx
1:0EF8  8bd1              mov      dx, cx
1:0EFA  2b4eec            sub      cx, word ptr [bp - 0x14]
1:0EFD  51                push     cx
1:0EFE  8bc8              mov      cx, ax
1:0F00  2b46ec            sub      ax, word ptr [bp - 0x14]
1:0F03  50                push     ax
1:0F04  0356ec            add      dx, word ptr [bp - 0x14]
1:0F07  52                push     dx
1:0F08  034eec            add      cx, word ptr [bp - 0x14]
1:0F0B  51                push     cx
1:0F0C  9a5e100000        lcall    0, 0x105e  ; @1:USER.SetRect
1:0F11  a1a008            mov      ax, word ptr [0x8a0]
1:0F14  2b069c08          sub      ax, word ptr [0x89c]
1:0F18  b90700            mov      cx, 7
1:0F1B  99                cdq      
1:0F1C  f7f9              idiv     cx
1:0F1E  99                cdq      
1:0F1F  2bc2              sub      ax, dx
1:0F21  d1f8              sar      ax, 1
1:0F23  8946f4            mov      word ptr [bp - 0xc], ax
1:0F26  a1a208            mov      ax, word ptr [0x8a2]
1:0F29  2b069e08          sub      ax, word ptr [0x89e]
1:0F2D  b90300            mov      cx, 3
1:0F30  99                cdq      
1:0F31  f7f9              idiv     cx
1:0F33  99                cdq      
1:0F34  2bc2              sub      ax, dx
1:0F36  d1f8              sar      ax, 1
1:0F38  8946fc            mov      word ptr [bp - 4], ax
1:0F3B  833ec00400        cmp      word ptr [0x4c0], 0
1:0F40  7503              jne      0xf45
1:0F42  e9800a            jmp      0x19c5
1:0F45  833ec20400        cmp      word ptr [0x4c2], 0
1:0F4A  7403              je       0xf4f
1:0F4C  e9760a            jmp      0x19c5
1:0F4F  b81e00            mov      ax, 0x1e
1:0F52  50                push     ax
1:0F53  b80100            mov      ax, 1
1:0F56  50                push     ax
1:0F57  9a01110000        lcall    0, 0x1101  ; @1:INT:ord_11(1:42D6)
1:0F5C  5b                pop      bx
1:0F5D  5b                pop      bx
1:0F5E  0bc0              or       ax, ax
1:0F60  740b              je       0xf6d
1:0F62  9a54110000        lcall    0, 0x1154  ; @1:INT:ord_10(1:44CD)
1:0F67  50                push     ax
1:0F68  0e                push     cs
1:0F69  e85bfd            call     0xcc7
1:0F6C  5b                pop      bx
1:0F6D  833e100000        cmp      word ptr [0x10], 0
1:0F72  740a              je       0xf7e
1:0F74  ff365e00          push     word ptr [0x5e]
1:0F78  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:4486)
1:0F7D  5b                pop      bx
1:0F7E  833eb40401        cmp      word ptr [0x4b4], 1
1:0F83  7511              jne      0xf96
1:0F85  b80f00            mov      ax, 0xf
1:0F88  50                push     ax
1:0F89  9aaa0f0000        lcall    0, 0xfaa  ; @1:INT:ord_7(1:42FE)
1:0F8E  5b                pop      bx
1:0F8F  50                push     ax
1:0F90  9add0d0000        lcall    0, 0xddd  ; @1:INT:ord_8(1:4511)
1:0F95  5b                pop      bx
1:0F96  ff06be04          inc      word ptr [0x4be]
1:0F9A  2bc0              sub      ax, ax
1:0F9C  a3c004            mov      word ptr [0x4c0], ax
1:0F9F  a3ec04            mov      word ptr [0x4ec], ax
1:0FA2  b80100            mov      ax, 1
1:0FA5  a3ee04            mov      word ptr [0x4ee], ax
1:0FA8  50                push     ax
1:0FA9  9ade0f0000        lcall    0, 0xfde  ; @1:INT:ord_7(1:42FE)
1:0FAE  5b                pop      bx
1:0FAF  a3da05            mov      word ptr [0x5da], ax
1:0FB2  a1a208            mov      ax, word ptr [0x8a2]
1:0FB5  2b069e08          sub      ax, word ptr [0x89e]
1:0FB9  8bc8              mov      cx, ax
1:0FBB  99                cdq      
1:0FBC  f77eee            idiv     word ptr [bp - 0x12]
1:0FBF  99                cdq      
1:0FC0  2bc2              sub      ax, dx
1:0FC2  d1f8              sar      ax, 1
1:0FC4  8946ec            mov      word ptr [bp - 0x14], ax
1:0FC7  81f99101          cmp      cx, 0x191
1:0FCB  7e06              jle      0xfd3
1:0FCD  8b46f4            mov      ax, word ptr [bp - 0xc]
1:0FD0  8946ec            mov      word ptr [bp - 0x14], ax
1:0FD3  8b46ee            mov      ax, word ptr [bp - 0x12]
1:0FD6  a3d804            mov      word ptr [0x4d8], ax
1:0FD9  b80800            mov      ax, 8
1:0FDC  50                push     ax
1:0FDD  9af20f0000        lcall    0, 0xff2  ; @1:INT:ord_7(1:42FE)
1:0FE2  5b                pop      bx
1:0FE3  3d0300            cmp      ax, 3
1:0FE6  7505              jne      0xfed
1:0FE8  8b46fc            mov      ax, word ptr [bp - 4]
1:0FEB  eb12              jmp      0xfff
1:0FED  b80500            mov      ax, 5
1:0FF0  50                push     ax
1:0FF1  9a9d100000        lcall    0, 0x109d  ; @1:INT:ord_7(1:42FE)
1:0FF6  5b                pop      bx
1:0FF7  3d0300            cmp      ax, 3
1:0FFA  7506              jne      0x1002
1:0FFC  8b46f4            mov      ax, word ptr [bp - 0xc]
1:0FFF  8946ec            mov      word ptr [bp - 0x14], ax
1:1002  804eec01          or       byte ptr [bp - 0x14], 1
1:1006  8b46ec            mov      ax, word ptr [bp - 0x14]
1:1009  a3ce04            mov      word ptr [0x4ce], ax
1:100C  c706d8050000      mov      word ptr [0x5d8], 0
1:1012  a1a008            mov      ax, word ptr [0x8a0]
1:1015  2b069c08          sub      ax, word ptr [0x89c]
1:1019  99                cdq      
1:101A  2bc2              sub      ax, dx
1:101C  d1f8              sar      ax, 1
1:101E  8946f2            mov      word ptr [bp - 0xe], ax
1:1021  8bc8              mov      cx, ax
1:1023  a1a208            mov      ax, word ptr [0x8a2]
1:1026  2b069e08          sub      ax, word ptr [0x89e]
1:102A  99                cdq      
1:102B  2bc2              sub      ax, dx
1:102D  d1f8              sar      ax, 1
1:102F  8946f0            mov      word ptr [bp - 0x10], ax
1:1032  8bd0              mov      dx, ax
1:1034  8bd9              mov      bx, cx
1:1036  8916da04          mov      word ptr [0x4da], dx
1:103A  891edc04          mov      word ptr [0x4dc], bx
1:103E  8916bc08          mov      word ptr [0x8bc], dx
1:1042  891ebe08          mov      word ptr [0x8be], bx
1:1046  baea05            mov      dx, 0x5ea
1:1049  1e                push     ds
1:104A  52                push     dx
1:104B  2b4eec            sub      cx, word ptr [bp - 0x14]
1:104E  51                push     cx
1:104F  8bc8              mov      cx, ax
1:1051  2b46ec            sub      ax, word ptr [bp - 0x14]
1:1054  50                push     ax
1:1055  035eec            add      bx, word ptr [bp - 0x14]
1:1058  53                push     bx
1:1059  034eec            add      cx, word ptr [bp - 0x14]
1:105C  51                push     cx
1:105D  9a71000000        lcall    0, 0x71  ; @1:USER.SetRect
1:1062  b8d004            mov      ax, 0x4d0
1:1065  8bf8              mov      di, ax
1:1067  beea05            mov      si, 0x5ea
1:106A  1e                push     ds
1:106B  07                pop      es
1:106C  a5                movsw    word ptr es:[di], word ptr [si]
1:106D  a5                movsw    word ptr es:[di], word ptr [si]
1:106E  a5                movsw    word ptr es:[di], word ptr [si]
1:106F  a5                movsw    word ptr es:[di], word ptr [si]
1:1070  b89408            mov      ax, 0x894
1:1073  8bf8              mov      di, ax
1:1075  beea05            mov      si, 0x5ea
1:1078  a5                movsw    word ptr es:[di], word ptr [si]
1:1079  a5                movsw    word ptr es:[di], word ptr [si]
1:107A  a5                movsw    word ptr es:[di], word ptr [si]
1:107B  a5                movsw    word ptr es:[di], word ptr [si]
1:107C  b8f405            mov      ax, 0x5f4
1:107F  8bf8              mov      di, ax
1:1081  beea05            mov      si, 0x5ea
1:1084  a5                movsw    word ptr es:[di], word ptr [si]
1:1085  a5                movsw    word ptr es:[di], word ptr [si]
1:1086  a5                movsw    word ptr es:[di], word ptr [si]
1:1087  a5                movsw    word ptr es:[di], word ptr [si]
1:1088  1e                push     ds
1:1089  50                push     ax
1:108A  8b4eec            mov      cx, word ptr [bp - 0x14]
1:108D  d1e1              shl      cx, 1
1:108F  51                push     cx
1:1090  51                push     cx
1:1091  8bf1              mov      si, cx
1:1093  9aca100000        lcall    0, 0x10ca  ; @1:USER.InflateRect
1:1098  b80500            mov      ax, 5
1:109B  50                push     ax
1:109C  9aaa100000        lcall    0, 0x10aa  ; @1:INT:ord_7(1:42FE)
1:10A1  5b                pop      bx
1:10A2  48                dec      ax
1:10A3  7553              jne      0x10f8
1:10A5  b80100            mov      ax, 1
1:10A8  50                push     ax
1:10A9  9ae1100000        lcall    0, 0x10e1  ; @1:INT:ord_7(1:42FE)
1:10AE  5b                pop      bx
1:10AF  0bc0              or       ax, ax
1:10B1  7437              je       0x10ea
1:10B3  b8f405            mov      ax, 0x5f4
1:10B6  56                push     si
1:10B7  8bf8              mov      di, ax
1:10B9  beea05            mov      si, 0x5ea
1:10BC  1e                push     ds
1:10BD  07                pop      es
1:10BE  a5                movsw    word ptr es:[di], word ptr [si]
1:10BF  a5                movsw    word ptr es:[di], word ptr [si]
1:10C0  a5                movsw    word ptr es:[di], word ptr [si]
1:10C1  a5                movsw    word ptr es:[di], word ptr [si]
1:10C2  5e                pop      si
1:10C3  1e                push     ds
1:10C4  50                push     ax
1:10C5  f7de              neg      si
1:10C7  56                push     si
1:10C8  56                push     si
1:10C9  9affff0000        lcall    0, 0xffff  ; @1:USER.InflateRect
1:10CE  ff369208          push     word ptr [0x892]
1:10D2  b8f405            mov      ax, 0x5f4
1:10D5  1e                push     ds
1:10D6  50                push     ax
1:10D7  9af4100000        lcall    0, 0x10f4  ; @1:USER.InvertRect
1:10DC  b80100            mov      ax, 1
1:10DF  50                push     ax
1:10E0  9a60110000        lcall    0, 0x1160  ; @1:INT:ord_7(1:42FE)
1:10E5  5b                pop      bx
1:10E6  0bc0              or       ax, ax
1:10E8  740e              je       0x10f8
1:10EA  ff369208          push     word ptr [0x892]
1:10EE  b8ea05            mov      ax, 0x5ea
1:10F1  1e                push     ds
1:10F2  50                push     ax
1:10F3  9affff0000        lcall    0, 0xffff  ; @1:USER.InvertRect
1:10F8  b80c00            mov      ax, 0xc
1:10FB  50                push     ax
1:10FC  b90100            mov      cx, 1
1:10FF  51                push     cx
1:1100  9a13110000        lcall    0, 0x1113  ; @1:INT:ord_11(1:42D6)
1:1105  5b                pop      bx
1:1106  5b                pop      bx
1:1107  a32605            mov      word ptr [0x526], ax
1:110A  b80c00            mov      ax, 0xc
1:110D  50                push     ax
1:110E  b80100            mov      ax, 1
1:1111  50                push     ax
1:1112  9a25110000        lcall    0, 0x1125  ; @1:INT:ord_11(1:42D6)
1:1117  5b                pop      bx
1:1118  5b                pop      bx
1:1119  a32805            mov      word ptr [0x528], ax
1:111C  b81400            mov      ax, 0x14
1:111F  50                push     ax
1:1120  b90100            mov      cx, 1
1:1123  51                push     cx
1:1124  9a37110000        lcall    0, 0x1137  ; @1:INT:ord_11(1:42D6)
1:1129  5b                pop      bx
1:112A  5b                pop      bx
1:112B  a32a05            mov      word ptr [0x52a], ax
1:112E  b81400            mov      ax, 0x14
1:1131  50                push     ax
1:1132  b80100            mov      ax, 1
1:1135  50                push     ax
1:1136  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:42D6)
1:113B  5b                pop      bx
1:113C  5b                pop      bx
1:113D  a32c05            mov      word ptr [0x52c], ax
1:1140  c706e8040100      mov      word ptr [0x4e8], 1
1:1146  c706ea040000      mov      word ptr [0x4ea], 0
1:114C  833ebc0400        cmp      word ptr [0x4bc], 0
1:1151  7439              je       0x118c
1:1153  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:44CD)
1:1158  a3e804            mov      word ptr [0x4e8], ax
1:115B  ff365e00          push     word ptr [0x5e]
1:115F  9a73110000        lcall    0, 0x1173  ; @1:INT:ord_7(1:42FE)
1:1164  5b                pop      bx
1:1165  a3ea04            mov      word ptr [0x4ea], ax
1:1168  3906e804          cmp      word ptr [0x4e8], ax
1:116C  750d              jne      0x117b
1:116E  ff365e00          push     word ptr [0x5e]
1:1172  9a80110000        lcall    0, 0x1180  ; @1:INT:ord_7(1:42FE)
1:1177  5b                pop      bx
1:1178  a3ea04            mov      word ptr [0x4ea], ax
1:117B  b80300            mov      ax, 3
1:117E  50                push     ax
1:117F  9aa3110000        lcall    0, 0x11a3  ; @1:INT:ord_7(1:42FE)
1:1184  5b                pop      bx
1:1185  0bc0              or       ax, ax
1:1187  7503              jne      0x118c
1:1189  a3ea04            mov      word ptr [0x4ea], ax
1:118C  c7062e050100      mov      word ptr [0x52e], 1
1:1192  833ea40800        cmp      word ptr [0x8a4], 0
1:1197  7405              je       0x119e
1:1199  a1a408            mov      ax, word ptr [0x8a4]
1:119C  eb0c              jmp      0x11aa
1:119E  b80300            mov      ax, 3
1:11A1  50                push     ax
1:11A2  9ac0110000        lcall    0, 0x11c0  ; @1:INT:ord_7(1:42FE)
1:11A7  5b                pop      bx
1:11A8  d1e0              shl      ax, 1
1:11AA  a33205            mov      word ptr [0x532], ax
1:11AD  c706d4052200      mov      word ptr [0x5d4], 0x22
1:11B3  c746ea0000        mov      word ptr [bp - 0x16], 0
1:11B8  e99d01            jmp      0x1358
1:11BB  b80100            mov      ax, 1
1:11BE  50                push     ax
1:11BF  9ad0110000        lcall    0, 0x11d0  ; @1:INT:ord_7(1:42FE)
1:11C4  5b                pop      bx
1:11C5  8b5ef6            mov      bx, word ptr [bp - 0xa]
1:11C8  894714            mov      word ptr [bx + 0x14], ax
1:11CB  b80100            mov      ax, 1
1:11CE  50                push     ax
1:11CF  9ad60d0000        lcall    0, 0xdd6  ; @1:INT:ord_7(1:42FE)
1:11D4  5b                pop      bx
1:11D5  8b5ef6            mov      bx, word ptr [bp - 0xa]
1:11D8  894712            mov      word ptr [bx + 0x12], ax
1:11DB  c747120100        mov      word ptr [bx + 0x12], 1
1:11E0  b80300            mov      ax, 3
1:11E3  50                push     ax
1:11E4  9af5110000        lcall    0, 0x11f5  ; @1:INT:ord_7(1:42FE)
1:11E9  5b                pop      bx
1:11EA  8b5ef6            mov      bx, word ptr [bp - 0xa]
1:11ED  894710            mov      word ptr [bx + 0x10], ax
1:11F0  b80400            mov      ax, 4
1:11F3  50                push     ax
1:11F4  9a0f120000        lcall    0, 0x120f  ; @1:INT:ord_7(1:42FE)
1:11F9  5b                pop      bx
1:11FA  40                inc      ax
1:11FB  d1e0              shl      ax, 1
1:11FD  d1e0              shl      ax, 1
1:11FF  8b5ef6            mov      bx, word ptr [bp - 0xa]
1:1202  894708            mov      word ptr [bx + 8], ax
1:1205  c7470a0100        mov      word ptr [bx + 0xa], 1
1:120A  b80700            mov      ax, 7
1:120D  50                push     ax
1:120E  9a24120000        lcall    0, 0x1224  ; @1:INT:ord_7(1:42FE)
1:1213  5b                pop      bx
1:1214  8b5ef6            mov      bx, word ptr [bp - 0xa]
1:1217  894704            mov      word ptr [bx + 4], ax
1:121A  c747180000        mov      word ptr [bx + 0x18], 0
1:121F  b80100            mov      ax, 1
1:1222  50                push     ax
1:1223  9a34120000        lcall    0, 0x1234  ; @1:INT:ord_7(1:42FE)
1:1228  5b                pop      bx
1:1229  8b5ef6            mov      bx, word ptr [bp - 0xa]
1:122C  894716            mov      word ptr [bx + 0x16], ax
1:122F  b80200            mov      ax, 2
1:1232  50                push     ax
1:1233  9a4b120000        lcall    0, 0x124b  ; @1:INT:ord_7(1:42FE)
1:1238  5b                pop      bx
1:1239  3d0100            cmp      ax, 1
1:123C  1bc0              sbb      ax, ax
1:123E  f7d8              neg      ax
1:1240  8b5ef6            mov      bx, word ptr [bp - 0xa]
1:1243  89471a            mov      word ptr [bx + 0x1a], ax
1:1246  b80200            mov      ax, 2
1:1249  50                push     ax
1:124A  9a5e120000        lcall    0, 0x125e  ; @1:INT:ord_7(1:42FE)
1:124F  5b                pop      bx
1:1250  d1e0              shl      ax, 1
1:1252  40                inc      ax
1:1253  8b5ef6            mov      bx, word ptr [bp - 0xa]
1:1256  89471c            mov      word ptr [bx + 0x1c], ax
1:1259  b80300            mov      ax, 3
1:125C  50                push     ax
1:125D  9a74120000        lcall    0, 0x1274  ; @1:INT:ord_7(1:42FE)
1:1262  5b                pop      bx
1:1263  0bc0              or       ax, ax
1:1265  7408              je       0x126f
1:1267  8b5ef6            mov      bx, word ptr [bp - 0xa]
1:126A  c7471c0000        mov      word ptr [bx + 0x1c], 0
1:126F  ff365e00          push     word ptr [0x5e]
1:1273  9a97120000        lcall    0, 0x1297  ; @1:INT:ord_7(1:42FE)
1:1278  5b                pop      bx
1:1279  8b5ef6            mov      bx, word ptr [bp - 0xa]
1:127C  89471e            mov      word ptr [bx + 0x1e], ax
1:127F  837eea00          cmp      word ptr [bp - 0x16], 0
1:1283  7507              jne      0x128c
1:1285  2bc0              sub      ax, ax
1:1287  894702            mov      word ptr [bx + 2], ax
1:128A  eb3a              jmp      0x12c6
1:128C  837eea01          cmp      word ptr [bp - 0x16], 1
1:1290  7518              jne      0x12aa
1:1292  b81400            mov      ax, 0x14
1:1295  50                push     ax
1:1296  9aaf120000        lcall    0, 0x12af  ; @1:INT:ord_7(1:42FE)
1:129B  5b                pop      bx
1:129C  0346ec            add      ax, word ptr [bp - 0x14]
1:129F  8b5ef6            mov      bx, word ptr [bp - 0xa]
1:12A2  894702            mov      word ptr [bx + 2], ax
1:12A5  8b46ec            mov      ax, word ptr [bp - 0x14]
1:12A8  eb1c              jmp      0x12c6
1:12AA  b81400            mov      ax, 0x14
1:12AD  50                push     ax
1:12AE  9afd120000        lcall    0, 0x12fd  ; @1:INT:ord_7(1:42FE)
1:12B3  5b                pop      bx
1:12B4  8bc8              mov      cx, ax
1:12B6  8b46ec            mov      ax, word ptr [bp - 0x14]
1:12B9  99                cdq      
1:12BA  2bc2              sub      ax, dx
1:12BC  d1f8              sar      ax, 1
1:12BE  03c8              add      cx, ax
1:12C0  8b5ef6            mov      bx, word ptr [bp - 0xa]
1:12C3  894f02            mov      word ptr [bx + 2], cx
1:12C6  8907              mov      word ptr [bx], ax
1:12C8  f646ea01          test     byte ptr [bp - 0x16], 1
1:12CC  7408              je       0x12d6
1:12CE  8b5ef6            mov      bx, word ptr [bp - 0xa]
1:12D1  8b4702            mov      ax, word ptr [bx + 2]
1:12D4  8907              mov      word ptr [bx], ax
1:12D6  837eea02          cmp      word ptr [bp - 0x16], 2
1:12DA  7512              jne      0x12ee
1:12DC  8b5ef6            mov      bx, word ptr [bp - 0xa]
1:12DF  c747020000        mov      word ptr [bx + 2], 0
1:12E4  8b46ec            mov      ax, word ptr [bp - 0x14]
1:12E7  99                cdq      
1:12E8  2bc2              sub      ax, dx
1:12EA  d1f8              sar      ax, 1
1:12EC  8907              mov      word ptr [bx], ax
1:12EE  837eea0a          cmp      word ptr [bp - 0x16], 0xa
1:12F2  7e61              jle      0x1355
1:12F4  8b46ec            mov      ax, word ptr [bp - 0x14]
1:12F7  d1e0              shl      ax, 1
1:12F9  50                push     ax
1:12FA  8bf0              mov      si, ax
1:12FC  9a0d130000        lcall    0, 0x130d  ; @1:INT:ord_7(1:42FE)
1:1301  5b                pop      bx
1:1302  0346ec            add      ax, word ptr [bp - 0x14]
1:1305  8b5ef6            mov      bx, word ptr [bp - 0xa]
1:1308  894702            mov      word ptr [bx + 2], ax
1:130B  56                push     si
1:130C  9a1f130000        lcall    0, 0x131f  ; @1:INT:ord_7(1:42FE)
1:1311  5b                pop      bx
1:1312  0346ec            add      ax, word ptr [bp - 0x14]
1:1315  8b5ef6            mov      bx, word ptr [bp - 0xa]
1:1318  8907              mov      word ptr [bx], ax
1:131A  b80300            mov      ax, 3
1:131D  50                push     ax
1:131E  9a32130000        lcall    0, 0x1332  ; @1:INT:ord_7(1:42FE)
1:1323  5b                pop      bx
1:1324  0bc0              or       ax, ax
1:1326  7415              je       0x133d
1:1328  8b46ec            mov      ax, word ptr [bp - 0x14]
1:132B  99                cdq      
1:132C  2bc2              sub      ax, dx
1:132E  d1f8              sar      ax, 1
1:1330  50                push     ax
1:1331  9a8b130000        lcall    0, 0x138b  ; @1:INT:ord_7(1:42FE)
1:1336  5b                pop      bx
1:1337  8b5ef6            mov      bx, word ptr [bp - 0xa]
1:133A  894702            mov      word ptr [bx + 2], ax
1:133D  837eea14          cmp      word ptr [bp - 0x16], 0x14
1:1341  7e06              jle      0x1349
1:1343  8b5ef6            mov      bx, word ptr [bp - 0xa]
1:1346  d16708            shl      word ptr [bx + 8], 1
1:1349  837eea28          cmp      word ptr [bp - 0x16], 0x28
1:134D  7e06              jle      0x1355
1:134F  8b5ef6            mov      bx, word ptr [bp - 0xa]
1:1352  d16708            shl      word ptr [bx + 8], 1
1:1355  ff46ea            inc      word ptr [bp - 0x16]
1:1358  837eea04          cmp      word ptr [bp - 0x16], 4
1:135C  7d1f              jge      0x137d
1:135E  b105              mov      cl, 5
1:1360  8b46ea            mov      ax, word ptr [bp - 0x16]
1:1363  d3e0              shl      ax, cl
1:1365  053405            add      ax, 0x534
1:1368  8946f6            mov      word ptr [bp - 0xa], ax
1:136B  833ebc0400        cmp      word ptr [0x4bc], 0
1:1370  7503              jne      0x1375
1:1372  e946fe            jmp      0x11bb
1:1375  9a630f0000        lcall    0, 0xf63  ; @1:INT:ord_10(1:44CD)
1:137A  e948fe            jmp      0x11c5
1:137D  b8ffff            mov      ax, 0xffff
1:1380  a30205            mov      word ptr [0x502], ax
1:1383  a30405            mov      word ptr [0x504], ax
1:1386  b80f00            mov      ax, 0xf
1:1389  50                push     ax
1:138A  9aa2130000        lcall    0, 0x13a2  ; @1:INT:ord_7(1:42FE)
1:138F  5b                pop      bx
1:1390  3d0300            cmp      ax, 3
1:1393  7508              jne      0x139d
1:1395  c70602050100      mov      word ptr [0x502], 1
1:139B  eb15              jmp      0x13b2
1:139D  b80f00            mov      ax, 0xf
1:13A0  50                push     ax
1:13A1  9ab7130000        lcall    0, 0x13b7  ; @1:INT:ord_7(1:42FE)
1:13A6  5b                pop      bx
1:13A7  3d0300            cmp      ax, 3
1:13AA  7506              jne      0x13b2
1:13AC  c70604050100      mov      word ptr [0x504], 1
1:13B2  b80100            mov      ax, 1
1:13B5  50                push     ax
1:13B6  9ad6130000        lcall    0, 0x13d6  ; @1:INT:ord_7(1:42FE)
1:13BB  5b                pop      bx
1:13BC  3d0100            cmp      ax, 1
1:13BF  1bc0              sbb      ax, ax
1:13C1  40                inc      ax
1:13C2  a3e604            mov      word ptr [0x4e6], ax
1:13C5  b80100            mov      ax, 1
1:13C8  a3e604            mov      word ptr [0x4e6], ax
1:13CB  a3cc04            mov      word ptr [0x4cc], ax
1:13CE  a3f204            mov      word ptr [0x4f2], ax
1:13D1  b83200            mov      ax, 0x32
1:13D4  50                push     ax
1:13D5  9af5130000        lcall    0, 0x13f5  ; @1:INT:ord_7(1:42FE)
1:13DA  5b                pop      bx
1:13DB  051900            add      ax, 0x19
1:13DE  a3f404            mov      word ptr [0x4f4], ax
1:13E1  c706f0046400      mov      word ptr [0x4f0], 0x64
1:13E7  b80100            mov      ax, 1
1:13EA  a3f604            mov      word ptr [0x4f6], ax
1:13ED  a3f804            mov      word ptr [0x4f8], ax
1:13F0  b80600            mov      ax, 6
1:13F3  50                push     ax
1:13F4  9a14140000        lcall    0, 0x1414  ; @1:INT:ord_7(1:42FE)
1:13F9  5b                pop      bx
1:13FA  3d0200            cmp      ax, 2
1:13FD  7505              jne      0x1404
1:13FF  b80100            mov      ax, 1
1:1402  eb02              jmp      0x1406
1:1404  2bc0              sub      ax, ax
1:1406  a32005            mov      word ptr [0x520], ax
1:1409  c70622050000      mov      word ptr [0x522], 0
1:140F  b80400            mov      ax, 4
1:1412  50                push     ax
1:1413  9a29140000        lcall    0, 0x1429  ; @1:INT:ord_7(1:42FE)
1:1418  5b                pop      bx
1:1419  3d0100            cmp      ax, 1
1:141C  1bc0              sbb      ax, ax
1:141E  250400            and      ax, 4
1:1421  a30005            mov      word ptr [0x500], ax
1:1424  b80400            mov      ax, 4
1:1427  50                push     ax
1:1428  9a3b140000        lcall    0, 0x143b  ; @1:INT:ord_7(1:42FE)
1:142D  5b                pop      bx
1:142E  0bc0              or       ax, ax
1:1430  7404              je       0x1436
1:1432  2bc0              sub      ax, ax
1:1434  eb0e              jmp      0x1444
1:1436  b80400            mov      ax, 4
1:1439  50                push     ax
1:143A  9a4c140000        lcall    0, 0x144c  ; @1:INT:ord_7(1:42FE)
1:143F  5b                pop      bx
1:1440  d1e0              shl      ax, 1
1:1442  d1e0              shl      ax, 1
1:1444  a30005            mov      word ptr [0x500], ax
1:1447  b80100            mov      ax, 1
1:144A  50                push     ax
1:144B  9a59140000        lcall    0, 0x1459  ; @1:INT:ord_7(1:42FE)
1:1450  5b                pop      bx
1:1451  a30605            mov      word ptr [0x506], ax
1:1454  b80600            mov      ax, 6
1:1457  50                push     ax
1:1458  9a7b140000        lcall    0, 0x147b  ; @1:INT:ord_7(1:42FE)
1:145D  5b                pop      bx
1:145E  3d0100            cmp      ax, 1
1:1461  1bc0              sbb      ax, ax
1:1463  f7d8              neg      ax
1:1465  a30a05            mov      word ptr [0x50a], ax
1:1468  2bc0              sub      ax, ax
1:146A  a31e05            mov      word ptr [0x51e], ax
1:146D  a3fa04            mov      word ptr [0x4fa], ax
1:1470  a3fc04            mov      word ptr [0x4fc], ax
1:1473  a3fe04            mov      word ptr [0x4fe], ax
1:1476  b80100            mov      ax, 1
1:1479  50                push     ax
1:147A  9a89140000        lcall    0, 0x1489  ; @1:INT:ord_7(1:42FE)
1:147F  5b                pop      bx
1:1480  40                inc      ax
1:1481  a30805            mov      word ptr [0x508], ax
1:1484  b80200            mov      ax, 2
1:1487  50                push     ax
1:1488  9ab6140000        lcall    0, 0x14b6  ; @1:INT:ord_7(1:42FE)
1:148D  5b                pop      bx
1:148E  a30805            mov      word ptr [0x508], ax
1:1491  a1ce04            mov      ax, word ptr [0x4ce]
1:1494  a30e05            mov      word ptr [0x50e], ax
1:1497  a31605            mov      word ptr [0x516], ax
1:149A  2bc0              sub      ax, ax
1:149C  a30c05            mov      word ptr [0x50c], ax
1:149F  a31005            mov      word ptr [0x510], ax
1:14A2  a31405            mov      word ptr [0x514], ax
1:14A5  a31805            mov      word ptr [0x518], ax
1:14A8  b80100            mov      ax, 1
1:14AB  a31205            mov      word ptr [0x512], ax
1:14AE  a31a05            mov      word ptr [0x51a], ax
1:14B1  b80200            mov      ax, 2
1:14B4  50                push     ax
1:14B5  9ac9140000        lcall    0, 0x14c9  ; @1:INT:ord_7(1:42FE)
1:14BA  5b                pop      bx
1:14BB  48                dec      ax
1:14BC  7528              jne      0x14e6
1:14BE  8b46ec            mov      ax, word ptr [bp - 0x14]
1:14C1  a30c05            mov      word ptr [0x50c], ax
1:14C4  b90400            mov      cx, 4
1:14C7  51                push     cx
1:14C8  9af1140000        lcall    0, 0x14f1  ; @1:INT:ord_7(1:42FE)
1:14CD  5b                pop      bx
1:14CE  3d0400            cmp      ax, 4
1:14D1  750b              jne      0x14de
1:14D3  8b46ec            mov      ax, word ptr [bp - 0x14]
1:14D6  99                cdq      
1:14D7  2bc2              sub      ax, dx
1:14D9  d1f8              sar      ax, 1
1:14DB  a30c05            mov      word ptr [0x50c], ax
1:14DE  c7061205ffff      mov      word ptr [0x512], 0xffff
1:14E4  eb2c              jmp      0x1512
1:14E6  c7060c050000      mov      word ptr [0x50c], 0
1:14EC  b80100            mov      ax, 1
1:14EF  50                push     ax
1:14F0  9a04150000        lcall    0, 0x1504  ; @1:INT:ord_7(1:42FE)
1:14F5  5b                pop      bx
1:14F6  0bc0              or       ax, ax
1:14F8  7412              je       0x150c
1:14FA  a1ce04            mov      ax, word ptr [0x4ce]
1:14FD  99                cdq      
1:14FE  2bc2              sub      ax, dx
1:1500  d1f8              sar      ax, 1
1:1502  50                push     ax
1:1503  9a17150000        lcall    0, 0x1517  ; @1:INT:ord_7(1:42FE)
1:1508  5b                pop      bx
1:1509  a30c05            mov      word ptr [0x50c], ax
1:150C  c70612050100      mov      word ptr [0x512], 1
1:1512  b80100            mov      ax, 1
1:1515  50                push     ax
1:1516  9a35150000        lcall    0, 0x1535  ; @1:INT:ord_7(1:42FE)
1:151B  5b                pop      bx
1:151C  0bc0              or       ax, ax
1:151E  742c              je       0x154c
1:1520  833e120500        cmp      word ptr [0x512], 0
1:1525  7e25              jle      0x154c
1:1527  b80100            mov      ax, 1
1:152A  a30805            mov      word ptr [0x508], ax
1:152D  a3fe04            mov      word ptr [0x4fe], ax
1:1530  b80200            mov      ax, 2
1:1533  50                push     ax
1:1534  9a51150000        lcall    0, 0x1551  ; @1:INT:ord_7(1:42FE)
1:1539  5b                pop      bx
1:153A  0bc0              or       ax, ax
1:153C  7408              je       0x1546
1:153E  48                dec      ax
1:153F  743b              je       0x157c
1:1541  48                dec      ax
1:1542  7440              je       0x1584
1:1544  eb06              jmp      0x154c
1:1546  c706fc040300      mov      word ptr [0x4fc], 3
1:154C  b80600            mov      ax, 6
1:154F  50                push     ax
1:1550  9a8a0f0000        lcall    0, 0xf8a  ; @1:INT:ord_7(1:42FE)
1:1555  5b                pop      bx
1:1556  0bc0              or       ax, ax
1:1558  7432              je       0x158c
1:155A  48                dec      ax
1:155B  7503              jne      0x1560
1:155D  e99500            jmp      0x15f5
1:1560  48                dec      ax
1:1561  7503              jne      0x1566
1:1563  e9b900            jmp      0x161f
1:1566  48                dec      ax
1:1567  48                dec      ax
1:1568  7438              je       0x15a2
1:156A  48                dec      ax
1:156B  48                dec      ax
1:156C  7434              je       0x15a2
1:156E  c706f6040200      mov      word ptr [0x4f6], 2
1:1574  c706f4043200      mov      word ptr [0x4f4], 0x32
1:157A  eb26              jmp      0x15a2
1:157C  c706fc040100      mov      word ptr [0x4fc], 1
1:1582  ebc8              jmp      0x154c
1:1584  c706fc040200      mov      word ptr [0x4fc], 2
1:158A  ebc0              jmp      0x154c
1:158C  c706f6040000      mov      word ptr [0x4f6], 0
1:1592  b83200            mov      ax, 0x32
1:1595  50                push     ax
1:1596  9aa7150000        lcall    0, 0x15a7  ; @1:INT:ord_7(1:42FE)
1:159B  5b                pop      bx
1:159C  051e00            add      ax, 0x1e
1:159F  a3f404            mov      word ptr [0x4f4], ax
1:15A2  b80300            mov      ax, 3
1:15A5  50                push     ax
1:15A6  9ac8150000        lcall    0, 0x15c8  ; @1:INT:ord_7(1:42FE)
1:15AB  5b                pop      bx
1:15AC  3d0200            cmp      ax, 2
1:15AF  7533              jne      0x15e4
1:15B1  833e120500        cmp      word ptr [0x512], 0
1:15B6  742c              je       0x15e4
1:15B8  a1ce04            mov      ax, word ptr [0x4ce]
1:15BB  99                cdq      
1:15BC  2bc2              sub      ax, dx
1:15BE  d1f8              sar      ax, 1
1:15C0  a30e05            mov      word ptr [0x50e], ax
1:15C3  b80300            mov      ax, 3
1:15C6  50                push     ax
1:15C7  9adc150000        lcall    0, 0x15dc  ; @1:INT:ord_7(1:42FE)
1:15CC  5b                pop      bx
1:15CD  40                inc      ax
1:15CE  a31e05            mov      word ptr [0x51e], ax
1:15D1  c7060c050000      mov      word ptr [0x50c], 0
1:15D7  b80a00            mov      ax, 0xa
1:15DA  50                push     ax
1:15DB  9afa150000        lcall    0, 0x15fa  ; @1:INT:ord_7(1:42FE)
1:15E0  5b                pop      bx
1:15E1  a30c05            mov      word ptr [0x50c], ax
1:15E4  a10005            mov      ax, word ptr [0x500]
1:15E7  29060e05          sub      word ptr [0x50e], ax
1:15EB  833efc0400        cmp      word ptr [0x4fc], 0
1:15F0  754b              jne      0x163d
1:15F2  e9b200            jmp      0x16a7
1:15F5  b80100            mov      ax, 1
1:15F8  50                push     ax
1:15F9  9a24160000        lcall    0, 0x1624  ; @1:INT:ord_7(1:42FE)
1:15FE  5b                pop      bx
1:15FF  0bc0              or       ax, ax
1:1601  740e              je       0x1611
1:1603  c706f6040100      mov      word ptr [0x4f6], 1
1:1609  c706f4041400      mov      word ptr [0x4f4], 0x14
1:160F  eb91              jmp      0x15a2
1:1611  c706f604ffff      mov      word ptr [0x4f6], 0xffff
1:1617  c706f4044600      mov      word ptr [0x4f4], 0x46
1:161D  eb83              jmp      0x15a2
1:161F  b80100            mov      ax, 1
1:1622  50                push     ax
1:1623  9a42160000        lcall    0, 0x1642  ; @1:INT:ord_7(1:42FE)
1:1628  5b                pop      bx
1:1629  0bc0              or       ax, ax
1:162B  7408              je       0x1635
1:162D  c706f604feff      mov      word ptr [0x4f6], 0xfffe
1:1633  ebe2              jmp      0x1617
1:1635  c706f6040200      mov      word ptr [0x4f6], 2
1:163B  ebcc              jmp      0x1609
1:163D  b80100            mov      ax, 1
1:1640  50                push     ax
1:1641  9a57160000        lcall    0, 0x1657  ; @1:INT:ord_7(1:42FE)
1:1646  5b                pop      bx
1:1647  0bc0              or       ax, ax
1:1649  7422              je       0x166d
1:164B  833ed60500        cmp      word ptr [0x5d6], 0
1:1650  741b              je       0x166d
1:1652  b80400            mov      ax, 4
1:1655  50                push     ax
1:1656  9a8a160000        lcall    0, 0x168a  ; @1:INT:ord_7(1:42FE)
1:165B  5b                pop      bx
1:165C  b9feff            mov      cx, 0xfffe
1:165F  2bc8              sub      cx, ax
1:1661  a1ce04            mov      ax, word ptr [0x4ce]
1:1664  99                cdq      
1:1665  f7f9              idiv     cx
1:1667  0306ce04          add      ax, word ptr [0x4ce]
1:166B  eb0e              jmp      0x167b
1:166D  a1ce04            mov      ax, word ptr [0x4ce]
1:1670  99                cdq      
1:1671  2bc2              sub      ax, dx
1:1673  d1f8              sar      ax, 1
1:1675  2b06ce04          sub      ax, word ptr [0x4ce]
1:1679  f7d8              neg      ax
1:167B  a3fa04            mov      word ptr [0x4fa], ax
1:167E  833ed60500        cmp      word ptr [0x5d6], 0
1:1683  7522              jne      0x16a7
1:1685  b80100            mov      ax, 1
1:1688  50                push     ax
1:1689  9ab2160000        lcall    0, 0x16b2  ; @1:INT:ord_7(1:42FE)
1:168E  5b                pop      bx
1:168F  0bc0              or       ax, ax
1:1691  7408              je       0x169b
1:1693  c706f604fcff      mov      word ptr [0x4f6], 0xfffc
1:1699  eb06              jmp      0x16a1
1:169B  c706f6040400      mov      word ptr [0x4f6], 4
1:16A1  c706f4043200      mov      word ptr [0x4f4], 0x32
1:16A7  a1f404            mov      ax, word ptr [0x4f4]
1:16AA  a3f204            mov      word ptr [0x4f2], ax
1:16AD  b80700            mov      ax, 7
1:16B0  50                push     ax
1:16B1  9af8160000        lcall    0, 0x16f8  ; @1:INT:ord_7(1:42FE)
1:16B6  5b                pop      bx
1:16B7  3d0200            cmp      ax, 2
1:16BA  7403              je       0x16bf
1:16BC  e9df00            jmp      0x179e
1:16BF  833ebe0405        cmp      word ptr [0x4be], 5
1:16C4  7f03              jg       0x16c9
1:16C6  e9d500            jmp      0x179e
1:16C9  8d7ee2            lea      di, [bp - 0x1e]
1:16CC  beea05            mov      si, 0x5ea
1:16CF  16                push     ss
1:16D0  07                pop      es
1:16D1  a5                movsw    word ptr es:[di], word ptr [si]
1:16D2  a5                movsw    word ptr es:[di], word ptr [si]
1:16D3  a5                movsw    word ptr es:[di], word ptr [si]
1:16D4  a5                movsw    word ptr es:[di], word ptr [si]
1:16D5  b8fe05            mov      ax, 0x5fe
1:16D8  8bf8              mov      di, ax
1:16DA  beea05            mov      si, 0x5ea
1:16DD  1e                push     ds
1:16DE  07                pop      es
1:16DF  a5                movsw    word ptr es:[di], word ptr [si]
1:16E0  a5                movsw    word ptr es:[di], word ptr [si]
1:16E1  a5                movsw    word ptr es:[di], word ptr [si]
1:16E2  a5                movsw    word ptr es:[di], word ptr [si]
1:16E3  8d4ee2            lea      cx, [bp - 0x1e]
1:16E6  16                push     ss
1:16E7  51                push     cx
1:16E8  ff76ec            push     word ptr [bp - 0x14]
1:16EB  ff76ec            push     word ptr [bp - 0x14]
1:16EE  9a94100000        lcall    0, 0x1094  ; @1:USER.InflateRect
1:16F3  b80300            mov      ax, 3
1:16F6  50                push     ax
1:16F7  9a19170000        lcall    0, 0x1719  ; @1:INT:ord_7(1:42FE)
1:16FC  5b                pop      bx
1:16FD  3d0200            cmp      ax, 2
1:1700  7512              jne      0x1714
1:1702  b8fe05            mov      ax, 0x5fe
1:1705  1e                push     ds
1:1706  8bf8              mov      di, ax
1:1708  8d76e2            lea      si, [bp - 0x1e]
1:170B  1e                push     ds
1:170C  07                pop      es
1:170D  16                push     ss
1:170E  1f                pop      ds
1:170F  a5                movsw    word ptr es:[di], word ptr [si]
1:1710  a5                movsw    word ptr es:[di], word ptr [si]
1:1711  a5                movsw    word ptr es:[di], word ptr [si]
1:1712  a5                movsw    word ptr es:[di], word ptr [si]
1:1713  1f                pop      ds
1:1714  b80400            mov      ax, 4
1:1717  50                push     ax
1:1718  9a7f170000        lcall    0, 0x177f  ; @1:INT:ord_7(1:42FE)
1:171D  5b                pop      bx
1:171E  3d0200            cmp      ax, 2
1:1721  7422              je       0x1745
1:1723  ff365e00          push     word ptr [0x5e]
1:1727  9a64170000        lcall    0, 0x1764  ; @1:INT:ord_12(1:4486)
1:172C  5b                pop      bx
1:172D  ff369208          push     word ptr [0x892]
1:1731  8d46e2            lea      ax, [bp - 0x1e]
1:1734  16                push     ss
1:1735  50                push     ax
1:1736  b80400            mov      ax, 4
1:1739  50                push     ax
1:173A  9aa10c0000        lcall    0, 0xca1  ; @1:GDI.GetStockObject
1:173F  50                push     ax
1:1740  9aa70c0000        lcall    0, 0xca7  ; @1:USER.FillRect
1:1745  8b46f0            mov      ax, word ptr [bp - 0x10]
1:1748  f7d8              neg      ax
1:174A  50                push     ax
1:174B  8b46f2            mov      ax, word ptr [bp - 0xe]
1:174E  f7d8              neg      ax
1:1750  50                push     ax
1:1751  9a98170000        lcall    0, 0x1798  ; @1:INT:ord_17(1:43C8)
1:1756  5b                pop      bx
1:1757  5b                pop      bx
1:1758  833ebc0400        cmp      word ptr [0x4bc], 0
1:175D  740a              je       0x1769
1:175F  ff365e00          push     word ptr [0x5e]
1:1763  9a6c0e0000        lcall    0, 0xe6c  ; @1:INT:ord_12(1:4486)
1:1768  5b                pop      bx
1:1769  b8fe05            mov      ax, 0x5fe
1:176C  50                push     ax
1:176D  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_18(1:27F6)
1:1772  5b                pop      bx
1:1773  a32205            mov      word ptr [0x522], ax
1:1776  0bc0              or       ax, ax
1:1778  7413              je       0x178d
1:177A  b80200            mov      ax, 2
1:177D  50                push     ax
1:177E  9aaa170000        lcall    0, 0x17aa  ; @1:INT:ord_7(1:42FE)
1:1783  5b                pop      bx
1:1784  3d0100            cmp      ax, 1
1:1787  1bc0              sbb      ax, ax
1:1789  f7d8              neg      ax
1:178B  eb03              jmp      0x1790
1:178D  b80100            mov      ax, 1
1:1790  a3ee04            mov      word ptr [0x4ee], ax
1:1793  2bc0              sub      ax, ax
1:1795  50                push     ax
1:1796  50                push     ax
1:1797  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_17(1:43C8)
1:179C  5b                pop      bx
1:179D  5b                pop      bx
1:179E  833e220500        cmp      word ptr [0x522], 0
1:17A3  7453              je       0x17f8
1:17A5  b80800            mov      ax, 8
1:17A8  50                push     ax
1:17A9  9ab9170000        lcall    0, 0x17b9  ; @1:INT:ord_7(1:42FE)
1:17AE  5b                pop      bx
1:17AF  3d0200            cmp      ax, 2
1:17B2  7444              je       0x17f8
1:17B4  b80200            mov      ax, 2
1:17B7  50                push     ax
1:17B8  9ace170000        lcall    0, 0x17ce  ; @1:INT:ord_7(1:42FE)
1:17BD  5b                pop      bx
1:17BE  d1e0              shl      ax, 1
1:17C0  d1e0              shl      ax, 1
1:17C2  a30005            mov      word ptr [0x500], ax
1:17C5  29060e05          sub      word ptr [0x50e], ax
1:17C9  b80200            mov      ax, 2
1:17CC  50                push     ax
1:17CD  9ae4170000        lcall    0, 0x17e4  ; @1:INT:ord_7(1:42FE)
1:17D2  5b                pop      bx
1:17D3  8bc8              mov      cx, ax
1:17D5  41                inc      cx
1:17D6  a10e05            mov      ax, word ptr [0x50e]
1:17D9  99                cdq      
1:17DA  f7f9              idiv     cx
1:17DC  a30e05            mov      word ptr [0x50e], ax
1:17DF  b80300            mov      ax, 3
1:17E2  50                push     ax
1:17E3  9a09180000        lcall    0, 0x1809  ; @1:INT:ord_7(1:42FE)
1:17E8  5b                pop      bx
1:17E9  48                dec      ax
1:17EA  740c              je       0x17f8
1:17EC  b90200            mov      cx, 2
1:17EF  a11605            mov      ax, word ptr [0x516]
1:17F2  99                cdq      
1:17F3  f7f9              idiv     cx
1:17F5  a31605            mov      word ptr [0x516], ax
1:17F8  a10c05            mov      ax, word ptr [0x50c]
1:17FB  a3b804            mov      word ptr [0x4b8], ax
1:17FE  c70620050000      mov      word ptr [0x520], 0
1:1804  b80400            mov      ax, 4
1:1807  50                push     ax
1:1808  9a20180000        lcall    0, 0x1820  ; @1:INT:ord_7(1:42FE)
1:180D  5b                pop      bx
1:180E  48                dec      ax
1:180F  7505              jne      0x1816
1:1811  b80100            mov      ax, 1
1:1814  eb02              jmp      0x1818
1:1816  2bc0              sub      ax, ax
1:1818  a3dc05            mov      word ptr [0x5dc], ax
1:181B  b81400            mov      ax, 0x14
1:181E  50                push     ax
1:181F  9a2d180000        lcall    0, 0x182d  ; @1:INT:ord_7(1:42FE)
1:1824  5b                pop      bx
1:1825  a3de05            mov      word ptr [0x5de], ax
1:1828  b81400            mov      ax, 0x14
1:182B  50                push     ax
1:182C  9a3a180000        lcall    0, 0x183a  ; @1:INT:ord_7(1:42FE)
1:1831  5b                pop      bx
1:1832  a3e005            mov      word ptr [0x5e0], ax
1:1835  b80500            mov      ax, 5
1:1838  50                push     ax
1:1839  9a53180000        lcall    0, 0x1853  ; @1:INT:ord_7(1:42FE)
1:183E  5b                pop      bx
1:183F  3d0400            cmp      ax, 4
1:1842  750a              jne      0x184e
1:1844  b8ea05            mov      ax, 0x5ea
1:1847  50                push     ax
1:1848  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_16(1:32E8)
1:184D  5b                pop      bx
1:184E  b80500            mov      ax, 5
1:1851  50                push     ax
1:1852  9a62180000        lcall    0, 0x1862  ; @1:INT:ord_7(1:42FE)
1:1857  5b                pop      bx
1:1858  3d0400            cmp      ax, 4
1:185B  756e              jne      0x18cb
1:185D  b80100            mov      ax, 1
1:1860  50                push     ax
1:1861  9a70180000        lcall    0, 0x1870  ; @1:INT:ord_7(1:42FE)
1:1866  5b                pop      bx
1:1867  0bc0              or       ax, ax
1:1869  743d              je       0x18a8
1:186B  b80100            mov      ax, 1
1:186E  50                push     ax
1:186F  9a96180000        lcall    0, 0x1896  ; @1:INT:ord_7(1:42FE)
1:1874  5b                pop      bx
1:1875  0bc0              or       ax, ax
1:1877  7413              je       0x188c
1:1879  8b46ec            mov      ax, word ptr [bp - 0x14]
1:187C  99                cdq      
1:187D  33c2              xor      ax, dx
1:187F  2bc2              sub      ax, dx
1:1881  b90300            mov      cx, 3
1:1884  d3f8              sar      ax, cl
1:1886  33c2              xor      ax, dx
1:1888  2bc2              sub      ax, dx
1:188A  eb0f              jmp      0x189b
1:188C  8b46ec            mov      ax, word ptr [bp - 0x14]
1:188F  99                cdq      
1:1890  2bc2              sub      ax, dx
1:1892  d1f8              sar      ax, 1
1:1894  50                push     ax
1:1895  9aad180000        lcall    0, 0x18ad  ; @1:INT:ord_7(1:42FE)
1:189A  5b                pop      bx
1:189B  50                push     ax
1:189C  b8ea05            mov      ax, 0x5ea
1:189F  50                push     ax
1:18A0  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_15(1:3146)
1:18A5  5b                pop      bx
1:18A6  eb22              jmp      0x18ca
1:18A8  b80100            mov      ax, 1
1:18AB  50                push     ax
1:18AC  9ad0180000        lcall    0, 0x18d0  ; @1:INT:ord_7(1:42FE)
1:18B1  5b                pop      bx
1:18B2  0bc0              or       ax, ax
1:18B4  740b              je       0x18c1
1:18B6  b8ea05            mov      ax, 0x5ea
1:18B9  50                push     ax
1:18BA  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_14(1:3118)
1:18BF  eb09              jmp      0x18ca
1:18C1  b8ea05            mov      ax, 0x5ea
1:18C4  50                push     ax
1:18C5  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_13(1:30EA)
1:18CA  5b                pop      bx
1:18CB  b80400            mov      ax, 4
1:18CE  50                push     ax
1:18CF  9ae7180000        lcall    0, 0x18e7  ; @1:INT:ord_7(1:42FE)
1:18D4  5b                pop      bx
1:18D5  0bc0              or       ax, ax
1:18D7  7403              je       0x18dc
1:18D9  e9a500            jmp      0x1981
1:18DC  8946e4            mov      word ptr [bp - 0x1c], ax
1:18DF  8946e2            mov      word ptr [bp - 0x1e], ax
1:18E2  b80100            mov      ax, 1
1:18E5  50                push     ax
1:18E6  9afe180000        lcall    0, 0x18fe  ; @1:INT:ord_7(1:42FE)
1:18EB  5b                pop      bx
1:18EC  0bc0              or       ax, ax
1:18EE  7415              je       0x1905
1:18F0  8b46ec            mov      ax, word ptr [bp - 0x14]
1:18F3  f7d8              neg      ax
1:18F5  8946e4            mov      word ptr [bp - 0x1c], ax
1:18F8  8b46ec            mov      ax, word ptr [bp - 0x14]
1:18FB  48                dec      ax
1:18FC  50                push     ax
1:18FD  9a0b190000        lcall    0, 0x190b  ; @1:INT:ord_7(1:42FE)
1:1902  5b                pop      bx
1:1903  eb13              jmp      0x1918
1:1905  8b46ec            mov      ax, word ptr [bp - 0x14]
1:1908  48                dec      ax
1:1909  50                push     ax
1:190A  9a22190000        lcall    0, 0x1922  ; @1:INT:ord_7(1:42FE)
1:190F  5b                pop      bx
1:1910  f7d8              neg      ax
1:1912  8946e4            mov      word ptr [bp - 0x1c], ax
1:1915  8b46ec            mov      ax, word ptr [bp - 0x14]
1:1918  f7d8              neg      ax
1:191A  8946e2            mov      word ptr [bp - 0x1e], ax
1:191D  b80100            mov      ax, 1
1:1920  50                push     ax
1:1921  9a34190000        lcall    0, 0x1934  ; @1:INT:ord_7(1:42FE)
1:1926  5b                pop      bx
1:1927  0bc0              or       ax, ax
1:1929  7410              je       0x193b
1:192B  8b46ec            mov      ax, word ptr [bp - 0x14]
1:192E  8946e0            mov      word ptr [bp - 0x20], ax
1:1931  48                dec      ax
1:1932  50                push     ax
1:1933  9a41190000        lcall    0, 0x1941  ; @1:INT:ord_7(1:42FE)
1:1938  5b                pop      bx
1:1939  eb11              jmp      0x194c
1:193B  8b46ec            mov      ax, word ptr [bp - 0x14]
1:193E  48                dec      ax
1:193F  50                push     ax
1:1940  9ae5110000        lcall    0, 0x11e5  ; @1:INT:ord_7(1:42FE)
1:1945  5b                pop      bx
1:1946  8946e0            mov      word ptr [bp - 0x20], ax
1:1949  8b46ec            mov      ax, word ptr [bp - 0x14]
1:194C  8946de            mov      word ptr [bp - 0x22], ax
1:194F  8b46f0            mov      ax, word ptr [bp - 0x10]
1:1952  f7d8              neg      ax
1:1954  50                push     ax
1:1955  8b46f2            mov      ax, word ptr [bp - 0xe]
1:1958  f7d8              neg      ax
1:195A  50                push     ax
1:195B  9a7b190000        lcall    0, 0x197b  ; @1:INT:ord_17(1:43C8)
1:1960  5b                pop      bx
1:1961  5b                pop      bx
1:1962  ff76e0            push     word ptr [bp - 0x20]
1:1965  ff76de            push     word ptr [bp - 0x22]
1:1968  ff76e4            push     word ptr [bp - 0x1c]
1:196B  ff76e2            push     word ptr [bp - 0x1e]
1:196E  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_27(1:339F)
1:1973  83c408            add      sp, 8
1:1976  2bc0              sub      ax, ax
1:1978  50                push     ax
1:1979  50                push     ax
1:197A  9a981a0000        lcall    0, 0x1a98  ; @1:INT:ord_17(1:43C8)
1:197F  5b                pop      bx
1:1980  5b                pop      bx
1:1981  b80800            mov      ax, 8
1:1984  50                push     ax
1:1985  9a99190000        lcall    0, 0x1999  ; @1:INT:ord_7(1:42FE)
1:198A  5b                pop      bx
1:198B  3d0400            cmp      ax, 4
1:198E  7522              jne      0x19b2
1:1990  b81e00            mov      ax, 0x1e
1:1993  50                push     ax
1:1994  b80400            mov      ax, 4
1:1997  50                push     ax
1:1998  9abd190000        lcall    0, 0x19bd  ; @1:INT:ord_7(1:42FE)
1:199D  5b                pop      bx
1:199E  40                inc      ax
1:199F  50                push     ax
1:19A0  b8ea05            mov      ax, 0x5ea
1:19A3  50                push     ax
1:19A4  ff76f2            push     word ptr [bp - 0xe]
1:19A7  ff76f0            push     word ptr [bp - 0x10]
1:19AA  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_26(1:31D4)
1:19AF  83c40a            add      sp, 0xa
1:19B2  c7061c000000      mov      word ptr [0x1c], 0
1:19B8  b80100            mov      ax, 1
1:19BB  50                push     ax
1:19BC  9a3d1a0000        lcall    0, 0x1a3d  ; @1:INT:ord_7(1:42FE)
1:19C1  5b                pop      bx
1:19C2  a31c00            mov      word ptr [0x1c], ax
1:19C5  833eee0400        cmp      word ptr [0x4ee], 0
1:19CA  7427              je       0x19f3
1:19CC  833ec20400        cmp      word ptr [0x4c2], 0
1:19D1  7520              jne      0x19f3
1:19D3  b8b004            mov      ax, 0x4b0
1:19D6  50                push     ax
1:19D7  ff36dc04          push     word ptr [0x4dc]
1:19DB  ff36da04          push     word ptr [0x4da]
1:19DF  ff36ce04          push     word ptr [0x4ce]
1:19E3  0e                push     cs
1:19E4  e82b06            call     0x2012
1:19E7  83c408            add      sp, 8
1:19EA  a11205            mov      ax, word ptr [0x512]
1:19ED  0106b804          add      word ptr [0x4b8], ax
1:19F1  eb06              jmp      0x19f9
1:19F3  c706c2040100      mov      word ptr [0x4c2], 1
1:19F9  2bc0              sub      ax, ax
1:19FB  50                push     ax
1:19FC  9a5b0e0000        lcall    0, 0xe5b  ; @1:INT:ord_9(1:4426)
1:1A01  5b                pop      bx
1:1A02  a10e05            mov      ax, word ptr [0x50e]
1:1A05  3906b804          cmp      word ptr [0x4b8], ax
1:1A09  7f07              jg       0x1a12
1:1A0B  833eb80400        cmp      word ptr [0x4b8], 0
1:1A10  7d06              jge      0x1a18
1:1A12  c706c2040100      mov      word ptr [0x4c2], 1
1:1A18  833ec20400        cmp      word ptr [0x4c2], 0
1:1A1D  7503              jne      0x1a22
1:1A1F  e9bf02            jmp      0x1ce1
1:1A22  c706c2040000      mov      word ptr [0x4c2], 0
1:1A28  0e                push     cs
1:1A29  e85bf4            call     0xe87
1:1A2C  a1ce04            mov      ax, word ptr [0x4ce]
1:1A2F  a3d805            mov      word ptr [0x5d8], ax
1:1A32  a1fe04            mov      ax, word ptr [0x4fe]
1:1A35  a3d605            mov      word ptr [0x5d6], ax
1:1A38  b80200            mov      ax, 2
1:1A3B  50                push     ax
1:1A3C  9a521a0000        lcall    0, 0x1a52  ; @1:INT:ord_7(1:42FE)
1:1A41  5b                pop      bx
1:1A42  0bc0              or       ax, ax
1:1A44  7415              je       0x1a5b
1:1A46  833e080502        cmp      word ptr [0x508], 2
1:1A4B  7518              jne      0x1a65
1:1A4D  b80100            mov      ax, 1
1:1A50  50                push     ax
1:1A51  9a6a1a0000        lcall    0, 0x1a6a  ; @1:INT:ord_7(1:42FE)
1:1A56  5b                pop      bx
1:1A57  0bc0              or       ax, ax
1:1A59  740a              je       0x1a65
1:1A5B  b8d004            mov      ax, 0x4d0
1:1A5E  50                push     ax
1:1A5F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_25(1:34DE)
1:1A64  5b                pop      bx
1:1A65  b80400            mov      ax, 4
1:1A68  50                push     ax
1:1A69  9a821a0000        lcall    0, 0x1a82  ; @1:INT:ord_7(1:42FE)
1:1A6E  5b                pop      bx
1:1A6F  0bc0              or       ax, ax
1:1A71  750a              jne      0x1a7d
1:1A73  b8d004            mov      ax, 0x4d0
1:1A76  50                push     ax
1:1A77  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_24(1:38C0)
1:1A7C  5b                pop      bx
1:1A7D  b80800            mov      ax, 8
1:1A80  50                push     ax
1:1A81  9ac81a0000        lcall    0, 0x1ac8  ; @1:INT:ord_7(1:42FE)
1:1A86  5b                pop      bx
1:1A87  0bc0              or       ax, ax
1:1A89  7528              jne      0x1ab3
1:1A8B  8b46f0            mov      ax, word ptr [bp - 0x10]
1:1A8E  f7d8              neg      ax
1:1A90  50                push     ax
1:1A91  8b46f2            mov      ax, word ptr [bp - 0xe]
1:1A94  f7d8              neg      ax
1:1A96  50                push     ax
1:1A97  9aad1a0000        lcall    0, 0x1aad  ; @1:INT:ord_17(1:43C8)
1:1A9C  5b                pop      bx
1:1A9D  5b                pop      bx
1:1A9E  b8ea05            mov      ax, 0x5ea
1:1AA1  50                push     ax
1:1AA2  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_23(1:26F1)
1:1AA7  5b                pop      bx
1:1AA8  2bc0              sub      ax, ax
1:1AAA  50                push     ax
1:1AAB  50                push     ax
1:1AAC  9ae61c0000        lcall    0, 0x1ce6  ; @1:INT:ord_17(1:43C8)
1:1AB1  5b                pop      bx
1:1AB2  5b                pop      bx
1:1AB3  833e260500        cmp      word ptr [0x526], 0
1:1AB8  7409              je       0x1ac3
1:1ABA  b8b004            mov      ax, 0x4b0
1:1ABD  50                push     ax
1:1ABE  0e                push     cs
1:1ABF  e83402            call     0x1cf6
1:1AC2  5b                pop      bx
1:1AC3  b86300            mov      ax, 0x63
1:1AC6  50                push     ax
1:1AC7  9a571b0000        lcall    0, 0x1b57  ; @1:INT:ord_7(1:42FE)
1:1ACC  5b                pop      bx
1:1ACD  3b06b204          cmp      ax, word ptr [0x4b2]
1:1AD1  7d7f              jge      0x1b52
1:1AD3  833e280500        cmp      word ptr [0x528], 0
1:1AD8  7478              je       0x1b52
1:1ADA  b8e205            mov      ax, 0x5e2
1:1ADD  8bf8              mov      di, ax
1:1ADF  bed004            mov      si, 0x4d0
1:1AE2  1e                push     ds
1:1AE3  07                pop      es
1:1AE4  a5                movsw    word ptr es:[di], word ptr [si]
1:1AE5  a5                movsw    word ptr es:[di], word ptr [si]
1:1AE6  a5                movsw    word ptr es:[di], word ptr [si]
1:1AE7  a5                movsw    word ptr es:[di], word ptr [si]
1:1AE8  b9fc05            mov      cx, 0x5fc
1:1AEB  51                push     cx
1:1AEC  baf205            mov      dx, 0x5f2
1:1AEF  52                push     dx
1:1AF0  50                push     ax
1:1AF1  9a261b0000        lcall    0, 0x1b26  ; @1:INT:ord_21(1:42AA)
1:1AF6  83c406            add      sp, 6
1:1AF9  b8e205            mov      ax, 0x5e2
1:1AFC  1e                push     ds
1:1AFD  50                push     ax
1:1AFE  ff36f205          push     word ptr [0x5f2]
1:1B02  ff36f205          push     word ptr [0x5f2]
1:1B06  9a9b1b0000        lcall    0, 0x1b9b  ; @1:USER.InflateRect
1:1B0B  b80606            mov      ax, 0x606
1:1B0E  8bf8              mov      di, ax
1:1B10  bee205            mov      si, 0x5e2
1:1B13  1e                push     ds
1:1B14  07                pop      es
1:1B15  a5                movsw    word ptr es:[di], word ptr [si]
1:1B16  a5                movsw    word ptr es:[di], word ptr [si]
1:1B17  a5                movsw    word ptr es:[di], word ptr [si]
1:1B18  a5                movsw    word ptr es:[di], word ptr [si]
1:1B19  b9fc05            mov      cx, 0x5fc
1:1B1C  51                push     cx
1:1B1D  baf205            mov      dx, 0x5f2
1:1B20  52                push     dx
1:1B21  bbe205            mov      bx, 0x5e2
1:1B24  53                push     bx
1:1B25  9a841b0000        lcall    0, 0x1b84  ; @1:INT:ord_21(1:42AA)
1:1B2A  83c406            add      sp, 6
1:1B2D  b8e205            mov      ax, 0x5e2
1:1B30  1e                push     ds
1:1B31  50                push     ax
1:1B32  a1f205            mov      ax, word ptr [0x5f2]
1:1B35  f7d8              neg      ax
1:1B37  50                push     ax
1:1B38  a1fc05            mov      ax, word ptr [0x5fc]
1:1B3B  f7d8              neg      ax
1:1B3D  50                push     ax
1:1B3E  9ad31b0000        lcall    0, 0x1bd3  ; @1:USER.OffsetRect
1:1B43  b8e205            mov      ax, 0x5e2
1:1B46  50                push     ax
1:1B47  b80606            mov      ax, 0x606
1:1B4A  50                push     ax
1:1B4B  9ae01b0000        lcall    0, 0x1be0  ; @1:INT:ord_20(1:3B0A)
1:1B50  5b                pop      bx
1:1B51  5b                pop      bx
1:1B52  b86300            mov      ax, 0x63
1:1B55  50                push     ax
1:1B56  9a051c0000        lcall    0, 0x1c05  ; @1:INT:ord_7(1:42FE)
1:1B5B  5b                pop      bx
1:1B5C  3b06b204          cmp      ax, word ptr [0x4b2]
1:1B60  7c03              jl       0x1b65
1:1B62  e98100            jmp      0x1be6
1:1B65  833e2a0500        cmp      word ptr [0x52a], 0
1:1B6A  747a              je       0x1be6
1:1B6C  b8e205            mov      ax, 0x5e2
1:1B6F  8bf8              mov      di, ax
1:1B71  bed004            mov      si, 0x4d0
1:1B74  1e                push     ds
1:1B75  07                pop      es
1:1B76  a5                movsw    word ptr es:[di], word ptr [si]
1:1B77  a5                movsw    word ptr es:[di], word ptr [si]
1:1B78  a5                movsw    word ptr es:[di], word ptr [si]
1:1B79  a5                movsw    word ptr es:[di], word ptr [si]
1:1B7A  b9fc05            mov      cx, 0x5fc
1:1B7D  51                push     cx
1:1B7E  baf205            mov      dx, 0x5f2
1:1B81  52                push     dx
1:1B82  50                push     ax
1:1B83  9aba1b0000        lcall    0, 0x1bba  ; @1:INT:ord_21(1:42AA)
1:1B88  83c406            add      sp, 6
1:1B8B  b8e205            mov      ax, 0x5e2
1:1B8E  1e                push     ds
1:1B8F  50                push     ax
1:1B90  a1f205            mov      ax, word ptr [0x5f2]
1:1B93  99                cdq      
1:1B94  2bc2              sub      ax, dx
1:1B96  d1f8              sar      ax, 1
1:1B98  50                push     ax
1:1B99  50                push     ax
1:1B9A  9aef160000        lcall    0, 0x16ef  ; @1:USER.InflateRect
1:1B9F  b80e06            mov      ax, 0x60e
1:1BA2  8bf8              mov      di, ax
1:1BA4  bee205            mov      si, 0x5e2
1:1BA7  1e                push     ds
1:1BA8  07                pop      es
1:1BA9  a5                movsw    word ptr es:[di], word ptr [si]
1:1BAA  a5                movsw    word ptr es:[di], word ptr [si]
1:1BAB  a5                movsw    word ptr es:[di], word ptr [si]
1:1BAC  a5                movsw    word ptr es:[di], word ptr [si]
1:1BAD  b9fc05            mov      cx, 0x5fc
1:1BB0  51                push     cx
1:1BB1  baf205            mov      dx, 0x5f2
1:1BB4  52                push     dx
1:1BB5  bbe205            mov      bx, 0x5e2
1:1BB8  53                push     bx
1:1BB9  9a7a1c0000        lcall    0, 0x1c7a  ; @1:INT:ord_21(1:42AA)
1:1BBE  83c406            add      sp, 6
1:1BC1  b8e205            mov      ax, 0x5e2
1:1BC4  1e                push     ds
1:1BC5  50                push     ax
1:1BC6  a1f205            mov      ax, word ptr [0x5f2]
1:1BC9  f7d8              neg      ax
1:1BCB  50                push     ax
1:1BCC  a1fc05            mov      ax, word ptr [0x5fc]
1:1BCF  f7d8              neg      ax
1:1BD1  50                push     ax
1:1BD2  9a951c0000        lcall    0, 0x1c95  ; @1:USER.OffsetRect
1:1BD7  b8e205            mov      ax, 0x5e2
1:1BDA  50                push     ax
1:1BDB  b80e06            mov      ax, 0x60e
1:1BDE  50                push     ax
1:1BDF  9acc1c0000        lcall    0, 0x1ccc  ; @1:INT:ord_20(1:3B0A)
1:1BE4  5b                pop      bx
1:1BE5  5b                pop      bx
1:1BE6  833e2c0500        cmp      word ptr [0x52c], 0
1:1BEB  7513              jne      0x1c00
1:1BED  b80400            mov      ax, 4
1:1BF0  50                push     ax
1:1BF1  b80100            mov      ax, 1
1:1BF4  50                push     ax
1:1BF5  9a231c0000        lcall    0, 0x1c23  ; @1:INT:ord_11(1:42D6)
1:1BFA  5b                pop      bx
1:1BFB  5b                pop      bx
1:1BFC  0bc0              or       ax, ax
1:1BFE  741a              je       0x1c1a
1:1C00  b86300            mov      ax, 0x63
1:1C03  50                push     ax
1:1C04  9a321c0000        lcall    0, 0x1c32  ; @1:INT:ord_7(1:42FE)
1:1C09  5b                pop      bx
1:1C0A  3b06b204          cmp      ax, word ptr [0x4b2]
1:1C0E  7d0a              jge      0x1c1a
1:1C10  b8d004            mov      ax, 0x4d0
1:1C13  50                push     ax
1:1C14  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_22(1:3958)
1:1C19  5b                pop      bx
1:1C1A  b80800            mov      ax, 8
1:1C1D  50                push     ax
1:1C1E  b80100            mov      ax, 1
1:1C21  50                push     ax
1:1C22  9a420e0000        lcall    0, 0xe42  ; @1:INT:ord_11(1:42D6)
1:1C27  5b                pop      bx
1:1C28  5b                pop      bx
1:1C29  0bc0              or       ax, ax
1:1C2B  7435              je       0x1c62
1:1C2D  b86300            mov      ax, 0x63
1:1C30  50                push     ax
1:1C31  9a9e1c0000        lcall    0, 0x1c9e  ; @1:INT:ord_7(1:42FE)
1:1C36  5b                pop      bx
1:1C37  3b06b204          cmp      ax, word ptr [0x4b2]
1:1C3B  7d25              jge      0x1c62
1:1C3D  ff369208          push     word ptr [0x892]
1:1C41  b8d004            mov      ax, 0x4d0
1:1C44  1e                push     ds
1:1C45  50                push     ax
1:1C46  9a5e1c0000        lcall    0, 0x1c5e  ; @1:USER.InvertRect
1:1C4B  b8b004            mov      ax, 0x4b0
1:1C4E  50                push     ax
1:1C4F  0e                push     cs
1:1C50  e85101            call     0x1da4
1:1C53  5b                pop      bx
1:1C54  ff369208          push     word ptr [0x892]
1:1C58  b8d004            mov      ax, 0x4d0
1:1C5B  1e                push     ds
1:1C5C  50                push     ax
1:1C5D  9ad8100000        lcall    0, 0x10d8  ; @1:USER.InvertRect
1:1C62  b8e205            mov      ax, 0x5e2
1:1C65  8bf8              mov      di, ax
1:1C67  bed004            mov      si, 0x4d0
1:1C6A  1e                push     ds
1:1C6B  07                pop      es
1:1C6C  a5                movsw    word ptr es:[di], word ptr [si]
1:1C6D  a5                movsw    word ptr es:[di], word ptr [si]
1:1C6E  a5                movsw    word ptr es:[di], word ptr [si]
1:1C6F  a5                movsw    word ptr es:[di], word ptr [si]
1:1C70  b9fc05            mov      cx, 0x5fc
1:1C73  51                push     cx
1:1C74  baf205            mov      dx, 0x5f2
1:1C77  52                push     dx
1:1C78  50                push     ax
1:1C79  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_21(1:42AA)
1:1C7E  83c406            add      sp, 6
1:1C81  b8e205            mov      ax, 0x5e2
1:1C84  1e                push     ds
1:1C85  50                push     ax
1:1C86  8b0ef205          mov      cx, word ptr [0x5f2]
1:1C8A  f7d9              neg      cx
1:1C8C  51                push     cx
1:1C8D  8b0efc05          mov      cx, word ptr [0x5fc]
1:1C91  f7d9              neg      cx
1:1C93  51                push     cx
1:1C94  9affff0000        lcall    0, 0xffff  ; @1:USER.OffsetRect
1:1C99  b86300            mov      ax, 0x63
1:1C9C  50                push     ax
1:1C9D  9aae1c0000        lcall    0, 0x1cae  ; @1:INT:ord_7(1:42FE)
1:1CA2  5b                pop      bx
1:1CA3  3b06b204          cmp      ax, word ptr [0x4b2]
1:1CA7  7d38              jge      0x1ce1
1:1CA9  b80100            mov      ax, 1
1:1CAC  50                push     ax
1:1CAD  9abb1c0000        lcall    0, 0x1cbb  ; @1:INT:ord_7(1:42FE)
1:1CB2  5b                pop      bx
1:1CB3  48                dec      ax
1:1CB4  752b              jne      0x1ce1
1:1CB6  b80200            mov      ax, 2
1:1CB9  50                push     ax
1:1CBA  9a97150000        lcall    0, 0x1597  ; @1:INT:ord_7(1:42FE)
1:1CBF  5b                pop      bx
1:1CC0  48                dec      ax
1:1CC1  750f              jne      0x1cd2
1:1CC3  b8e205            mov      ax, 0x5e2
1:1CC6  50                push     ax
1:1CC7  b8d004            mov      ax, 0x4d0
1:1CCA  50                push     ax
1:1CCB  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_20(1:3B0A)
1:1CD0  eb0d              jmp      0x1cdf
1:1CD2  b8e205            mov      ax, 0x5e2
1:1CD5  50                push     ax
1:1CD6  b8d004            mov      ax, 0x4d0
1:1CD9  50                push     ax
1:1CDA  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_19(1:3DAF)
1:1CDF  5b                pop      bx
1:1CE0  5b                pop      bx
1:1CE1  2bc0              sub      ax, ax
1:1CE3  50                push     ax
1:1CE4  50                push     ax
1:1CE5  9a52170000        lcall    0, 0x1752  ; @1:INT:ord_17(1:43C8)
1:1CEA  5b                pop      bx
1:1CEB  5b                pop      bx
1:1CEC  5e                pop      si
1:1CED  5f                pop      di
1:1CEE  4d                dec      bp
1:1CEF  4d                dec      bp
1:1CF0  8be5              mov      sp, bp
1:1CF2  1f                pop      ds
1:1CF3  5d                pop      bp
1:1CF4  4d                dec      bp
1:1CF5  cb                retf     
1:1CF6  1e                push     ds
1:1CF7  58                pop      ax
1:1CF8  90                nop      
1:1CF9  45                inc      bp
1:1CFA  55                push     bp
1:1CFB  8bec              mov      bp, sp
1:1CFD  1e                push     ds
1:1CFE  8ed8              mov      ds, ax
1:1D00  57                push     di
1:1D01  56                push     si
1:1D02  b81806            mov      ax, 0x618
1:1D05  8bf8              mov      di, ax
1:1D07  bed004            mov      si, 0x4d0
1:1D0A  1e                push     ds
1:1D0B  07                pop      es
1:1D0C  a5                movsw    word ptr es:[di], word ptr [si]
1:1D0D  a5                movsw    word ptr es:[di], word ptr [si]
1:1D0E  a5                movsw    word ptr es:[di], word ptr [si]
1:1D0F  a5                movsw    word ptr es:[di], word ptr [si]
1:1D10  b92806            mov      cx, 0x628
1:1D13  51                push     cx
1:1D14  ba1606            mov      dx, 0x616
1:1D17  52                push     dx
1:1D18  50                push     ax
1:1D19  9a511d0000        lcall    0, 0x1d51  ; @1:INT:ord_21(1:42AA)
1:1D1E  83c406            add      sp, 6
1:1D21  b81806            mov      ax, 0x618
1:1D24  1e                push     ds
1:1D25  50                push     ax
1:1D26  a11606            mov      ax, word ptr [0x616]
1:1D29  b9fdff            mov      cx, 0xfffd
1:1D2C  99                cdq      
1:1D2D  f7f9              idiv     cx
1:1D2F  50                push     ax
1:1D30  50                push     ax
1:1D31  9a071b0000        lcall    0, 0x1b07  ; @1:USER.InflateRect
1:1D36  b82006            mov      ax, 0x620
1:1D39  8bf8              mov      di, ax
1:1D3B  be1806            mov      si, 0x618
1:1D3E  1e                push     ds
1:1D3F  07                pop      es
1:1D40  a5                movsw    word ptr es:[di], word ptr [si]
1:1D41  a5                movsw    word ptr es:[di], word ptr [si]
1:1D42  a5                movsw    word ptr es:[di], word ptr [si]
1:1D43  a5                movsw    word ptr es:[di], word ptr [si]
1:1D44  b92806            mov      cx, 0x628
1:1D47  51                push     cx
1:1D48  ba1606            mov      dx, 0x616
1:1D4B  52                push     dx
1:1D4C  bb1806            mov      bx, 0x618
1:1D4F  53                push     bx
1:1D50  9ad31d0000        lcall    0, 0x1dd3  ; @1:INT:ord_21(1:42AA)
1:1D55  83c406            add      sp, 6
1:1D58  b81806            mov      ax, 0x618
1:1D5B  1e                push     ds
1:1D5C  50                push     ax
1:1D5D  a11606            mov      ax, word ptr [0x616]
1:1D60  f7d8              neg      ax
1:1D62  50                push     ax
1:1D63  a12806            mov      ax, word ptr [0x628]
1:1D66  f7d8              neg      ax
1:1D68  50                push     ax
1:1D69  9a061e0000        lcall    0, 0x1e06  ; @1:USER.OffsetRect
1:1D6E  b80400            mov      ax, 4
1:1D71  50                push     ax
1:1D72  9adf1d0000        lcall    0, 0x1ddf  ; @1:INT:ord_7(1:42FE)
1:1D77  5b                pop      bx
1:1D78  0bc0              or       ax, ax
1:1D7A  740f              je       0x1d8b
1:1D7C  b81806            mov      ax, 0x618
1:1D7F  50                push     ax
1:1D80  b82006            mov      ax, 0x620
1:1D83  50                push     ax
1:1D84  9a4c1b0000        lcall    0, 0x1b4c  ; @1:INT:ord_20(1:3B0A)
1:1D89  eb0d              jmp      0x1d98
1:1D8B  b81806            mov      ax, 0x618
1:1D8E  50                push     ax
1:1D8F  b82006            mov      ax, 0x620
1:1D92  50                push     ax
1:1D93  9adb1c0000        lcall    0, 0x1cdb  ; @1:INT:ord_19(1:3DAF)
1:1D98  5b                pop      bx
1:1D99  5b                pop      bx
1:1D9A  5e                pop      si
1:1D9B  5f                pop      di
1:1D9C  4d                dec      bp
1:1D9D  4d                dec      bp
1:1D9E  8be5              mov      sp, bp
1:1DA0  1f                pop      ds
1:1DA1  5d                pop      bp
1:1DA2  4d                dec      bp
1:1DA3  cb                retf     
1:1DA4  1e                push     ds
1:1DA5  58                pop      ax
1:1DA6  90                nop      
1:1DA7  45                inc      bp
1:1DA8  55                push     bp
1:1DA9  8bec              mov      bp, sp
1:1DAB  1e                push     ds
1:1DAC  8ed8              mov      ds, ax
1:1DAE  57                push     di
1:1DAF  56                push     si
1:1DB0  b83406            mov      ax, 0x634
1:1DB3  8bf8              mov      di, ax
1:1DB5  bed004            mov      si, 0x4d0
1:1DB8  1e                push     ds
1:1DB9  07                pop      es
1:1DBA  a5                movsw    word ptr es:[di], word ptr [si]
1:1DBB  a5                movsw    word ptr es:[di], word ptr [si]
1:1DBC  a5                movsw    word ptr es:[di], word ptr [si]
1:1DBD  a5                movsw    word ptr es:[di], word ptr [si]
1:1DBE  ba2c06            mov      dx, 0x62c
1:1DC1  8bfa              mov      di, dx
1:1DC3  8bf0              mov      si, ax
1:1DC5  a5                movsw    word ptr es:[di], word ptr [si]
1:1DC6  a5                movsw    word ptr es:[di], word ptr [si]
1:1DC7  a5                movsw    word ptr es:[di], word ptr [si]
1:1DC8  a5                movsw    word ptr es:[di], word ptr [si]
1:1DC9  b93c06            mov      cx, 0x63c
1:1DCC  51                push     cx
1:1DCD  bb2a06            mov      bx, 0x62a
1:1DD0  53                push     bx
1:1DD1  52                push     dx
1:1DD2  9af21a0000        lcall    0, 0x1af2  ; @1:INT:ord_21(1:42AA)
1:1DD7  83c406            add      sp, 6
1:1DDA  b80100            mov      ax, 1
1:1DDD  50                push     ax
1:1DDE  9aec1e0000        lcall    0, 0x1eec  ; @1:INT:ord_7(1:42FE)
1:1DE3  5b                pop      bx
1:1DE4  0bc0              or       ax, ax
1:1DE6  7503              jne      0x1deb
1:1DE8  e9fc00            jmp      0x1ee7
1:1DEB  b82c06            mov      ax, 0x62c
1:1DEE  8bf8              mov      di, ax
1:1DF0  be3406            mov      si, 0x634
1:1DF3  1e                push     ds
1:1DF4  07                pop      es
1:1DF5  a5                movsw    word ptr es:[di], word ptr [si]
1:1DF6  a5                movsw    word ptr es:[di], word ptr [si]
1:1DF7  a5                movsw    word ptr es:[di], word ptr [si]
1:1DF8  a5                movsw    word ptr es:[di], word ptr [si]
1:1DF9  1e                push     ds
1:1DFA  50                push     ax
1:1DFB  2bc9              sub      cx, cx
1:1DFD  51                push     cx
1:1DFE  8b163c06          mov      dx, word ptr [0x63c]
1:1E02  f7da              neg      dx
1:1E04  52                push     dx
1:1E05  9a1a1e0000        lcall    0, 0x1e1a  ; @1:USER.OffsetRect
1:1E0A  b82c06            mov      ax, 0x62c
1:1E0D  1e                push     ds
1:1E0E  50                push     ax
1:1E0F  2bc9              sub      cx, cx
1:1E11  51                push     cx
1:1E12  8b163c06          mov      dx, word ptr [0x63c]
1:1E16  f7da              neg      dx
1:1E18  52                push     dx
1:1E19  9a451e0000        lcall    0, 0x1e45  ; @1:USER.OffsetRect
1:1E1E  b82c06            mov      ax, 0x62c
1:1E21  50                push     ax
1:1E22  b93406            mov      cx, 0x634
1:1E25  51                push     cx
1:1E26  9a631e0000        lcall    0, 0x1e63  ; @1:INT:ord_28(1:3C95)
1:1E2B  5b                pop      bx
1:1E2C  5b                pop      bx
1:1E2D  b82c06            mov      ax, 0x62c
1:1E30  8bf8              mov      di, ax
1:1E32  be3406            mov      si, 0x634
1:1E35  1e                push     ds
1:1E36  07                pop      es
1:1E37  a5                movsw    word ptr es:[di], word ptr [si]
1:1E38  a5                movsw    word ptr es:[di], word ptr [si]
1:1E39  a5                movsw    word ptr es:[di], word ptr [si]
1:1E3A  a5                movsw    word ptr es:[di], word ptr [si]
1:1E3B  1e                push     ds
1:1E3C  50                push     ax
1:1E3D  2bc9              sub      cx, cx
1:1E3F  51                push     cx
1:1E40  ff363c06          push     word ptr [0x63c]
1:1E44  9a561e0000        lcall    0, 0x1e56  ; @1:USER.OffsetRect
1:1E49  b82c06            mov      ax, 0x62c
1:1E4C  1e                push     ds
1:1E4D  50                push     ax
1:1E4E  2bc9              sub      cx, cx
1:1E50  51                push     cx
1:1E51  ff363c06          push     word ptr [0x63c]
1:1E55  9a841e0000        lcall    0, 0x1e84  ; @1:USER.OffsetRect
1:1E5A  b82c06            mov      ax, 0x62c
1:1E5D  50                push     ax
1:1E5E  b93406            mov      cx, 0x634
1:1E61  51                push     cx
1:1E62  9aa51e0000        lcall    0, 0x1ea5  ; @1:INT:ord_28(1:3C95)
1:1E67  5b                pop      bx
1:1E68  5b                pop      bx
1:1E69  b82c06            mov      ax, 0x62c
1:1E6C  8bf8              mov      di, ax
1:1E6E  be3406            mov      si, 0x634
1:1E71  1e                push     ds
1:1E72  07                pop      es
1:1E73  a5                movsw    word ptr es:[di], word ptr [si]
1:1E74  a5                movsw    word ptr es:[di], word ptr [si]
1:1E75  a5                movsw    word ptr es:[di], word ptr [si]
1:1E76  a5                movsw    word ptr es:[di], word ptr [si]
1:1E77  1e                push     ds
1:1E78  50                push     ax
1:1E79  8b0e2a06          mov      cx, word ptr [0x62a]
1:1E7D  f7d9              neg      cx
1:1E7F  51                push     cx
1:1E80  2bc9              sub      cx, cx
1:1E82  51                push     cx
1:1E83  9a981e0000        lcall    0, 0x1e98  ; @1:USER.OffsetRect
1:1E88  b82c06            mov      ax, 0x62c
1:1E8B  1e                push     ds
1:1E8C  50                push     ax
1:1E8D  8b0e2a06          mov      cx, word ptr [0x62a]
1:1E91  f7d9              neg      cx
1:1E93  51                push     cx
1:1E94  2bc9              sub      cx, cx
1:1E96  51                push     cx
1:1E97  9ac31e0000        lcall    0, 0x1ec3  ; @1:USER.OffsetRect
1:1E9C  b82c06            mov      ax, 0x62c
1:1E9F  50                push     ax
1:1EA0  b93406            mov      cx, 0x634
1:1EA3  51                push     cx
1:1EA4  9ae11e0000        lcall    0, 0x1ee1  ; @1:INT:ord_28(1:3C95)
1:1EA9  5b                pop      bx
1:1EAA  5b                pop      bx
1:1EAB  b82c06            mov      ax, 0x62c
1:1EAE  8bf8              mov      di, ax
1:1EB0  be3406            mov      si, 0x634
1:1EB3  1e                push     ds
1:1EB4  07                pop      es
1:1EB5  a5                movsw    word ptr es:[di], word ptr [si]
1:1EB6  a5                movsw    word ptr es:[di], word ptr [si]
1:1EB7  a5                movsw    word ptr es:[di], word ptr [si]
1:1EB8  a5                movsw    word ptr es:[di], word ptr [si]
1:1EB9  1e                push     ds
1:1EBA  50                push     ax
1:1EBB  ff362a06          push     word ptr [0x62a]
1:1EBF  2bc9              sub      cx, cx
1:1EC1  51                push     cx
1:1EC2  9ad41e0000        lcall    0, 0x1ed4  ; @1:USER.OffsetRect
1:1EC7  b82c06            mov      ax, 0x62c
1:1ECA  1e                push     ds
1:1ECB  50                push     ax
1:1ECC  ff362a06          push     word ptr [0x62a]
1:1ED0  2bc0              sub      ax, ax
1:1ED2  50                push     ax
1:1ED3  9a141f0000        lcall    0, 0x1f14  ; @1:USER.OffsetRect
1:1ED8  b82c06            mov      ax, 0x62c
1:1EDB  50                push     ax
1:1EDC  b83406            mov      ax, 0x634
1:1EDF  50                push     ax
1:1EE0  9a361f0000        lcall    0, 0x1f36  ; @1:INT:ord_28(1:3C95)
1:1EE5  5b                pop      bx
1:1EE6  5b                pop      bx
1:1EE7  b80100            mov      ax, 1
1:1EEA  50                push     ax
1:1EEB  9a86190000        lcall    0, 0x1986  ; @1:INT:ord_7(1:42FE)
1:1EF0  5b                pop      bx
1:1EF1  0bc0              or       ax, ax
1:1EF3  7503              jne      0x1ef8
1:1EF5  e91001            jmp      0x2008
1:1EF8  b82c06            mov      ax, 0x62c
1:1EFB  8bf8              mov      di, ax
1:1EFD  be3406            mov      si, 0x634
1:1F00  1e                push     ds
1:1F01  07                pop      es
1:1F02  a5                movsw    word ptr es:[di], word ptr [si]
1:1F03  a5                movsw    word ptr es:[di], word ptr [si]
1:1F04  a5                movsw    word ptr es:[di], word ptr [si]
1:1F05  a5                movsw    word ptr es:[di], word ptr [si]
1:1F06  1e                push     ds
1:1F07  50                push     ax
1:1F08  ff362a06          push     word ptr [0x62a]
1:1F0C  8b0e3c06          mov      cx, word ptr [0x63c]
1:1F10  f7d9              neg      cx
1:1F12  51                push     cx
1:1F13  9a291f0000        lcall    0, 0x1f29  ; @1:USER.OffsetRect
1:1F18  b82c06            mov      ax, 0x62c
1:1F1B  1e                push     ds
1:1F1C  50                push     ax
1:1F1D  ff362a06          push     word ptr [0x62a]
1:1F21  8b0e3c06          mov      cx, word ptr [0x63c]
1:1F25  f7d9              neg      cx
1:1F27  51                push     cx
1:1F28  9a581f0000        lcall    0, 0x1f58  ; @1:USER.OffsetRect
1:1F2D  b82c06            mov      ax, 0x62c
1:1F30  50                push     ax
1:1F31  b93406            mov      cx, 0x634
1:1F34  51                push     cx
1:1F35  9a7a1f0000        lcall    0, 0x1f7a  ; @1:INT:ord_28(1:3C95)
1:1F3A  5b                pop      bx
1:1F3B  5b                pop      bx
1:1F3C  b82c06            mov      ax, 0x62c
1:1F3F  8bf8              mov      di, ax
1:1F41  be3406            mov      si, 0x634
1:1F44  1e                push     ds
1:1F45  07                pop      es
1:1F46  a5                movsw    word ptr es:[di], word ptr [si]
1:1F47  a5                movsw    word ptr es:[di], word ptr [si]
1:1F48  a5                movsw    word ptr es:[di], word ptr [si]
1:1F49  a5                movsw    word ptr es:[di], word ptr [si]
1:1F4A  1e                push     ds
1:1F4B  50                push     ax
1:1F4C  8b0e2a06          mov      cx, word ptr [0x62a]
1:1F50  f7d9              neg      cx
1:1F52  51                push     cx
1:1F53  ff363c06          push     word ptr [0x63c]
1:1F57  9a6d1f0000        lcall    0, 0x1f6d  ; @1:USER.OffsetRect
1:1F5C  b82c06            mov      ax, 0x62c
1:1F5F  1e                push     ds
1:1F60  50                push     ax
1:1F61  8b0e2a06          mov      cx, word ptr [0x62a]
1:1F65  f7d9              neg      cx
1:1F67  51                push     cx
1:1F68  ff363c06          push     word ptr [0x63c]
1:1F6C  9a9f1f0000        lcall    0, 0x1f9f  ; @1:USER.OffsetRect
1:1F71  b82c06            mov      ax, 0x62c
1:1F74  50                push     ax
1:1F75  b93406            mov      cx, 0x634
1:1F78  51                push     cx
1:1F79  9ac41f0000        lcall    0, 0x1fc4  ; @1:INT:ord_28(1:3C95)
1:1F7E  5b                pop      bx
1:1F7F  5b                pop      bx
1:1F80  b82c06            mov      ax, 0x62c
1:1F83  8bf8              mov      di, ax
1:1F85  be3406            mov      si, 0x634
1:1F88  1e                push     ds
1:1F89  07                pop      es
1:1F8A  a5                movsw    word ptr es:[di], word ptr [si]
1:1F8B  a5                movsw    word ptr es:[di], word ptr [si]
1:1F8C  a5                movsw    word ptr es:[di], word ptr [si]
1:1F8D  a5                movsw    word ptr es:[di], word ptr [si]
1:1F8E  1e                push     ds
1:1F8F  50                push     ax
1:1F90  8b0e2a06          mov      cx, word ptr [0x62a]
1:1F94  f7d9              neg      cx
1:1F96  51                push     cx
1:1F97  8b0e3c06          mov      cx, word ptr [0x63c]
1:1F9B  f7d9              neg      cx
1:1F9D  51                push     cx
1:1F9E  9ab71f0000        lcall    0, 0x1fb7  ; @1:USER.OffsetRect
1:1FA3  b82c06            mov      ax, 0x62c
1:1FA6  1e                push     ds
1:1FA7  50                push     ax
1:1FA8  8b0e2a06          mov      cx, word ptr [0x62a]
1:1FAC  f7d9              neg      cx
1:1FAE  51                push     cx
1:1FAF  8b0e3c06          mov      cx, word ptr [0x63c]
1:1FB3  f7d9              neg      cx
1:1FB5  51                push     cx
1:1FB6  9ae31f0000        lcall    0, 0x1fe3  ; @1:USER.OffsetRect
1:1FBB  b82c06            mov      ax, 0x62c
1:1FBE  50                push     ax
1:1FBF  b93406            mov      cx, 0x634
1:1FC2  51                push     cx
1:1FC3  9a02200000        lcall    0, 0x2002  ; @1:INT:ord_28(1:3C95)
1:1FC8  5b                pop      bx
1:1FC9  5b                pop      bx
1:1FCA  b82c06            mov      ax, 0x62c
1:1FCD  8bf8              mov      di, ax
1:1FCF  be3406            mov      si, 0x634
1:1FD2  1e                push     ds
1:1FD3  07                pop      es
1:1FD4  a5                movsw    word ptr es:[di], word ptr [si]
1:1FD5  a5                movsw    word ptr es:[di], word ptr [si]
1:1FD6  a5                movsw    word ptr es:[di], word ptr [si]
1:1FD7  a5                movsw    word ptr es:[di], word ptr [si]
1:1FD8  1e                push     ds
1:1FD9  50                push     ax
1:1FDA  ff362a06          push     word ptr [0x62a]
1:1FDE  ff363c06          push     word ptr [0x63c]
1:1FE2  9af51f0000        lcall    0, 0x1ff5  ; @1:USER.OffsetRect
1:1FE7  b82c06            mov      ax, 0x62c
1:1FEA  1e                push     ds
1:1FEB  50                push     ax
1:1FEC  ff362a06          push     word ptr [0x62a]
1:1FF0  ff363c06          push     word ptr [0x63c]
1:1FF4  9a3f1b0000        lcall    0, 0x1b3f  ; @1:USER.OffsetRect
1:1FF9  b82c06            mov      ax, 0x62c
1:1FFC  50                push     ax
1:1FFD  b83406            mov      ax, 0x634
1:2000  50                push     ax
1:2001  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_28(1:3C95)
1:2006  5b                pop      bx
1:2007  5b                pop      bx
1:2008  5e                pop      si
1:2009  5f                pop      di
1:200A  4d                dec      bp
1:200B  4d                dec      bp
1:200C  8be5              mov      sp, bp
1:200E  1f                pop      ds
1:200F  5d                pop      bp
1:2010  4d                dec      bp
1:2011  cb                retf     
1:2012  1e                push     ds
1:2013  58                pop      ax
1:2014  90                nop      
1:2015  45                inc      bp
1:2016  55                push     bp
1:2017  8bec              mov      bp, sp
1:2019  1e                push     ds
1:201A  8ed8              mov      ds, ax
1:201C  83ec54            sub      sp, 0x54
1:201F  57                push     di
1:2020  56                push     si
1:2021  8b5e0c            mov      bx, word ptr [bp + 0xc]
1:2024  8b4744            mov      ax, word ptr [bx + 0x44]
1:2027  8946c6            mov      word ptr [bp - 0x3a], ax
1:202A  8b4742            mov      ax, word ptr [bx + 0x42]
1:202D  8946ee            mov      word ptr [bp - 0x12], ax
1:2030  8b4748            mov      ax, word ptr [bx + 0x48]
1:2033  8946f0            mov      word ptr [bp - 0x10], ax
1:2036  8b4740            mov      ax, word ptr [bx + 0x40]
1:2039  8946e8            mov      word ptr [bp - 0x18], ax
1:203C  8b474c            mov      ax, word ptr [bx + 0x4c]
1:203F  8946dc            mov      word ptr [bp - 0x24], ax
1:2042  8b474e            mov      ax, word ptr [bx + 0x4e]
1:2045  8946f2            mov      word ptr [bp - 0xe], ax
1:2048  8b4758            mov      ax, word ptr [bx + 0x58]
1:204B  8946ea            mov      word ptr [bp - 0x16], ax
1:204E  8b4736            mov      ax, word ptr [bx + 0x36]
1:2051  99                cdq      
1:2052  8946e2            mov      word ptr [bp - 0x1e], ax
1:2055  8956e4            mov      word ptr [bp - 0x1c], dx
1:2058  8b4764            mov      ax, word ptr [bx + 0x64]
1:205B  8946be            mov      word ptr [bp - 0x42], ax
1:205E  8b4766            mov      ax, word ptr [bx + 0x66]
1:2061  8946d6            mov      word ptr [bp - 0x2a], ax
1:2064  8b4768            mov      ax, word ptr [bx + 0x68]
1:2067  8946ec            mov      word ptr [bp - 0x14], ax
1:206A  8b4752            mov      ax, word ptr [bx + 0x52]
1:206D  8946d8            mov      word ptr [bp - 0x28], ax
1:2070  8b4754            mov      ax, word ptr [bx + 0x54]
1:2073  8946ce            mov      word ptr [bp - 0x32], ax
1:2076  8b476e            mov      ax, word ptr [bx + 0x6e]
1:2079  8946e0            mov      word ptr [bp - 0x20], ax
1:207C  8b872e01          mov      ax, word ptr [bx + 0x12e]
1:2080  8946c4            mov      word ptr [bp - 0x3c], ax
1:2083  8b873001          mov      ax, word ptr [bx + 0x130]
1:2087  8946c0            mov      word ptr [bp - 0x40], ax
1:208A  8b473c            mov      ax, word ptr [bx + 0x3c]
1:208D  8946bc            mov      word ptr [bp - 0x44], ax
1:2090  8b477e            mov      ax, word ptr [bx + 0x7e]
1:2093  8946ba            mov      word ptr [bp - 0x46], ax
1:2096  2bc0              sub      ax, ax
1:2098  8946d0            mov      word ptr [bp - 0x30], ax
1:209B  b84606            mov      ax, 0x646
1:209E  8bf8              mov      di, ax
1:20A0  8d7720            lea      si, [bx + 0x20]
1:20A3  1e                push     ds
1:20A4  07                pop      es
1:20A5  a5                movsw    word ptr es:[di], word ptr [si]
1:20A6  a5                movsw    word ptr es:[di], word ptr [si]
1:20A7  a5                movsw    word ptr es:[di], word ptr [si]
1:20A8  a5                movsw    word ptr es:[di], word ptr [si]
1:20A9  8b5e0c            mov      bx, word ptr [bp + 0xc]
1:20AC  8b4708            mov      ax, word ptr [bx + 8]
1:20AF  8946d2            mov      word ptr [bp - 0x2e], ax
1:20B2  b85006            mov      ax, 0x650
1:20B5  50                push     ax
1:20B6  9a54220000        lcall    0, 0x2254  ; @1:INT:ord_34(1:410C)
1:20BB  5b                pop      bx
1:20BC  8b5e0c            mov      bx, word ptr [bp + 0xc]
1:20BF  ff7736            push     word ptr [bx + 0x36]
1:20C2  9a1b210000        lcall    0, 0x211b  ; @1:INT:ord_9(1:4426)
1:20C7  5b                pop      bx
1:20C8  8b4608            mov      ax, word ptr [bp + 8]
1:20CB  f7d8              neg      ax
1:20CD  50                push     ax
1:20CE  8b460a            mov      ax, word ptr [bp + 0xa]
1:20D1  f7d8              neg      ax
1:20D3  50                push     ax
1:20D4  9a03210000        lcall    0, 0x2103  ; @1:INT:ord_17(1:43C8)
1:20D9  5b                pop      bx
1:20DA  5b                pop      bx
1:20DB  833e5c0001        cmp      word ptr [0x5c], 1
1:20E0  741c              je       0x20fe
1:20E2  8b5e0c            mov      bx, word ptr [bp + 0xc]
1:20E5  83bf2a0100        cmp      word ptr [bx + 0x12a], 0
1:20EA  7503              jne      0x20ef
1:20EC  e91501            jmp      0x2204
1:20EF  837ed200          cmp      word ptr [bp - 0x2e], 0
1:20F3  7406              je       0x20fb
1:20F5  f646d20f          test     byte ptr [bp - 0x2e], 0xf
1:20F9  7403              je       0x20fe
1:20FB  e90601            jmp      0x2204
1:20FE  2bc0              sub      ax, ax
1:2100  50                push     ax
1:2101  50                push     ax
1:2102  9afe210000        lcall    0, 0x21fe  ; @1:INT:ord_17(1:43C8)
1:2107  5b                pop      bx
1:2108  5b                pop      bx
1:2109  b80400            mov      ax, 4
1:210C  50                push     ax
1:210D  9a5d210000        lcall    0, 0x215d  ; @1:INT:ord_7(1:42FE)
1:2112  5b                pop      bx
1:2113  0bc0              or       ax, ax
1:2115  7409              je       0x2120
1:2117  2bc0              sub      ax, ax
1:2119  50                push     ax
1:211A  9aec210000        lcall    0, 0x21ec  ; @1:INT:ord_9(1:4426)
1:211F  5b                pop      bx
1:2120  b83e06            mov      ax, 0x63e
1:2123  8bf8              mov      di, ax
1:2125  be4606            mov      si, 0x646
1:2128  1e                push     ds
1:2129  07                pop      es
1:212A  a5                movsw    word ptr es:[di], word ptr [si]
1:212B  a5                movsw    word ptr es:[di], word ptr [si]
1:212C  a5                movsw    word ptr es:[di], word ptr [si]
1:212D  a5                movsw    word ptr es:[di], word ptr [si]
1:212E  b96006            mov      cx, 0x660
1:2131  51                push     cx
1:2132  ba4e06            mov      dx, 0x64e
1:2135  52                push     dx
1:2136  bb4606            mov      bx, 0x646
1:2139  53                push     bx
1:213A  9a1a1d0000        lcall    0, 0x1d1a  ; @1:INT:ord_21(1:42AA)
1:213F  83c406            add      sp, 6
1:2142  b83e06            mov      ax, 0x63e
1:2145  1e                push     ds
1:2146  50                push     ax
1:2147  a14e06            mov      ax, word ptr [0x64e]
1:214A  f7d8              neg      ax
1:214C  50                push     ax
1:214D  a16006            mov      ax, word ptr [0x660]
1:2150  f7d8              neg      ax
1:2152  50                push     ax
1:2153  9a6a1d0000        lcall    0, 0x1d6a  ; @1:USER.OffsetRect
1:2158  b80900            mov      ax, 9
1:215B  50                push     ax
1:215C  9a72210000        lcall    0, 0x2172  ; @1:INT:ord_7(1:42FE)
1:2161  5b                pop      bx
1:2162  48                dec      ax
1:2163  7508              jne      0x216d
1:2165  ff760c            push     word ptr [bp + 0xc]
1:2168  0e                push     cs
1:2169  e88afb            call     0x1cf6
1:216C  5b                pop      bx
1:216D  b86300            mov      ax, 0x63
1:2170  50                push     ax
1:2171  9a82210000        lcall    0, 0x2182  ; @1:INT:ord_7(1:42FE)
1:2176  5b                pop      bx
1:2177  3b06b204          cmp      ax, word ptr [0x4b2]
1:217B  7d68              jge      0x21e5
1:217D  b80300            mov      ax, 3
1:2180  50                push     ax
1:2181  9a8f210000        lcall    0, 0x218f  ; @1:INT:ord_7(1:42FE)
1:2186  5b                pop      bx
1:2187  48                dec      ax
1:2188  752d              jne      0x21b7
1:218A  b80200            mov      ax, 2
1:218D  50                push     ax
1:218E  9abc210000        lcall    0, 0x21bc  ; @1:INT:ord_7(1:42FE)
1:2193  5b                pop      bx
1:2194  48                dec      ax
1:2195  7511              jne      0x21a8
1:2197  b83e06            mov      ax, 0x63e
1:219A  50                push     ax
1:219B  b84606            mov      ax, 0x646
1:219E  50                push     ax
1:219F  9a851d0000        lcall    0, 0x1d85  ; @1:INT:ord_20(1:3B0A)
1:21A4  5b                pop      bx
1:21A5  5b                pop      bx
1:21A6  eb3d              jmp      0x21e5
1:21A8  b83e06            mov      ax, 0x63e
1:21AB  50                push     ax
1:21AC  b84606            mov      ax, 0x646
1:21AF  50                push     ax
1:21B0  9a941d0000        lcall    0, 0x1d94  ; @1:INT:ord_19(1:3DAF)
1:21B5  ebed              jmp      0x21a4
1:21B7  b80200            mov      ax, 2
1:21BA  50                push     ax
1:21BB  9a9d230000        lcall    0, 0x239d  ; @1:INT:ord_7(1:42FE)
1:21C0  5b                pop      bx
1:21C1  0bc0              or       ax, ax
1:21C3  7409              je       0x21ce
1:21C5  ff760c            push     word ptr [bp + 0xc]
1:21C8  0e                push     cs
1:21C9  e8d8fb            call     0x1da4
1:21CC  ebd7              jmp      0x21a5
1:21CE  b84606            mov      ax, 0x646
1:21D1  50                push     ax
1:21D2  9a151c0000        lcall    0, 0x1c15  ; @1:INT:ord_22(1:3958)
1:21D7  5b                pop      bx
1:21D8  0bc0              or       ax, ax
1:21DA  7409              je       0x21e5
1:21DC  8b5e0c            mov      bx, word ptr [bp + 0xc]
1:21DF  c7872a010000      mov      word ptr [bx + 0x12a], 0
1:21E5  8b5e0c            mov      bx, word ptr [bp + 0xc]
1:21E8  ff7736            push     word ptr [bx + 0x36]
1:21EB  9a1f230000        lcall    0, 0x231f  ; @1:INT:ord_9(1:4426)
1:21F0  5b                pop      bx
1:21F1  8b4608            mov      ax, word ptr [bp + 8]
1:21F4  f7d8              neg      ax
1:21F6  50                push     ax
1:21F7  8b460a            mov      ax, word ptr [bp + 0xa]
1:21FA  f7d8              neg      ax
1:21FC  50                push     ax
1:21FD  9a5c190000        lcall    0, 0x195c  ; @1:INT:ord_17(1:43C8)
1:2202  5b                pop      bx
1:2203  5b                pop      bx
1:2204  833e5c0000        cmp      word ptr [0x5c], 0
1:2209  7411              je       0x221c
1:220B  ff0e5c00          dec      word ptr [0x5c]
1:220F  833e5c0000        cmp      word ptr [0x5c], 0
1:2214  7f06              jg       0x221c
1:2216  a1ae08            mov      ax, word ptr [0x8ae]
1:2219  a35c00            mov      word ptr [0x5c], ax
1:221C  8b5e0c            mov      bx, word ptr [bp + 0xc]
1:221F  837f7000          cmp      word ptr [bx + 0x70], 0
1:2223  7410              je       0x2235
1:2225  f646d201          test     byte ptr [bp - 0x2e], 1
1:2229  740a              je       0x2235
1:222B  b84606            mov      ax, 0x646
1:222E  50                push     ax
1:222F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_35(1:2C7C)
1:2234  5b                pop      bx
1:2235  837ef000          cmp      word ptr [bp - 0x10], 0
1:2239  7406              je       0x2241
1:223B  8b46ee            mov      ax, word ptr [bp - 0x12]
1:223E  8946c6            mov      word ptr [bp - 0x3a], ax
1:2241  837eba00          cmp      word ptr [bp - 0x46], 0
1:2245  7503              jne      0x224a
1:2247  e91f02            jmp      0x2469
1:224A  c746b60500        mov      word ptr [bp - 0x4a], 5
1:224F  b85006            mov      ax, 0x650
1:2252  50                push     ax
1:2253  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_34(1:410C)
1:2258  5b                pop      bx
1:2259  c746b20000        mov      word ptr [bp - 0x4e], 0
1:225E  e9ee01            jmp      0x244f
1:2261  8b5eb4            mov      bx, word ptr [bp - 0x4c]
1:2264  894704            mov      word ptr [bx + 4], ax
1:2267  837eca00          cmp      word ptr [bp - 0x36], 0
1:226B  7439              je       0x22a6
1:226D  8b5eb4            mov      bx, word ptr [bp - 0x4c]
1:2270  837f1600          cmp      word ptr [bx + 0x16], 0
1:2274  7430              je       0x22a6
1:2276  b105              mov      cl, 5
1:2278  8b76ca            mov      si, word ptr [bp - 0x36]
1:227B  d3e6              shl      si, cl
1:227D  8b5e0c            mov      bx, word ptr [bp + 0xc]
1:2280  8b7868            mov      di, word ptr [bx + si + 0x68]
1:2283  d1e7              shl      di, 1
1:2285  d1e7              shl      di, 1
1:2287  8b9f2401          mov      bx, word ptr [bx + 0x124]
1:228B  8b4102            mov      ax, word ptr [bx + di + 2]
1:228E  8b5eb4            mov      bx, word ptr [bp - 0x4c]
1:2291  014702            add      word ptr [bx + 2], ax
1:2294  8b5e0c            mov      bx, word ptr [bp + 0xc]
1:2297  8bbf2401          mov      di, word ptr [bx + 0x124]
1:229B  8b5868            mov      bx, word ptr [bx + si + 0x68]
1:229E  d1e3              shl      bx, 1
1:22A0  d1e3              shl      bx, 1
1:22A2  8b01              mov      ax, word ptr [bx + di]
1:22A4  eb2a              jmp      0x22d0
1:22A6  8b5eb4            mov      bx, word ptr [bp - 0x4c]
1:22A9  8b7704            mov      si, word ptr [bx + 4]
1:22AC  d1e6              shl      si, 1
1:22AE  d1e6              shl      si, 1
1:22B0  8b7e0c            mov      di, word ptr [bp + 0xc]
1:22B3  8b9d2401          mov      bx, word ptr [di + 0x124]
1:22B7  8b4002            mov      ax, word ptr [bx + si + 2]
1:22BA  8b5eb4            mov      bx, word ptr [bp - 0x4c]
1:22BD  014702            add      word ptr [bx + 2], ax
1:22C0  8b5f04            mov      bx, word ptr [bx + 4]
1:22C3  d1e3              shl      bx, 1
1:22C5  d1e3              shl      bx, 1
1:22C7  8b760c            mov      si, word ptr [bp + 0xc]
1:22CA  8bb42401          mov      si, word ptr [si + 0x124]
1:22CE  8b00              mov      ax, word ptr [bx + si]
1:22D0  8b5eb4            mov      bx, word ptr [bp - 0x4c]
1:22D3  0107              add      word ptr [bx], ax
1:22D5  8b5eb4            mov      bx, word ptr [bp - 0x4c]
1:22D8  837f1c01          cmp      word ptr [bx + 0x1c], 1
1:22DC  7e2a              jle      0x2308
1:22DE  837f1000          cmp      word ptr [bx + 0x10], 0
1:22E2  7424              je       0x2308
1:22E4  ff7712            push     word ptr [bx + 0x12]
1:22E7  8b471c            mov      ax, word ptr [bx + 0x1c]
1:22EA  99                cdq      
1:22EB  52                push     dx
1:22EC  50                push     ax
1:22ED  ff7702            push     word ptr [bx + 2]
1:22F0  ff37              push     word ptr [bx]
1:22F2  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_33(1:2B61)
1:22F7  83c40a            add      sp, 0xa
1:22FA  8b5eb4            mov      bx, word ptr [bp - 0x4c]
1:22FD  837f1e00          cmp      word ptr [bx + 0x1e], 0
1:2301  7415              je       0x2318
1:2303  ff771e            push     word ptr [bx + 0x1e]
1:2306  eb03              jmp      0x230b
1:2308  ff7714            push     word ptr [bx + 0x14]
1:230B  ff37              push     word ptr [bx]
1:230D  ff7702            push     word ptr [bx + 2]
1:2310  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_32(1:4565)
1:2315  83c406            add      sp, 6
1:2318  8b5e0c            mov      bx, word ptr [bp + 0xc]
1:231B  ff7736            push     word ptr [bx + 0x36]
1:231E  9a5c230000        lcall    0, 0x235c  ; @1:INT:ord_9(1:4426)
1:2323  5b                pop      bx
1:2324  ff46ca            inc      word ptr [bp - 0x36]
1:2327  a1a408            mov      ax, word ptr [0x8a4]
1:232A  3946ca            cmp      word ptr [bp - 0x36], ax
1:232D  7c03              jl       0x2332
1:232F  e91a01            jmp      0x244c
1:2332  b105              mov      cl, 5
1:2334  8b5eca            mov      bx, word ptr [bp - 0x36]
1:2337  d3e3              shl      bx, cl
1:2339  035e0c            add      bx, word ptr [bp + 0xc]
1:233C  81c38400          add      bx, 0x84
1:2340  895eb4            mov      word ptr [bp - 0x4c], bx
1:2343  837f1001          cmp      word ptr [bx + 0x10], 1
1:2347  1bc0              sbb      ax, ax
1:2349  24fa              and      al, 0xfa
1:234B  050d00            add      ax, 0xd
1:234E  50                push     ax
1:234F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_31(1:41BB)
1:2354  5b                pop      bx
1:2355  8b5eb4            mov      bx, word ptr [bp - 0x4c]
1:2358  ff7714            push     word ptr [bx + 0x14]
1:235B  9a1d240000        lcall    0, 0x241d  ; @1:INT:ord_9(1:4426)
1:2360  5b                pop      bx
1:2361  8b5eb4            mov      bx, word ptr [bp - 0x4c]
1:2364  837f0800          cmp      word ptr [bx + 8], 0
1:2368  7411              je       0x237b
1:236A  8b470a            mov      ax, word ptr [bx + 0xa]
1:236D  ff470a            inc      word ptr [bx + 0xa]
1:2370  8946b0            mov      word ptr [bp - 0x50], ax
1:2373  394708            cmp      word ptr [bx + 8], ax
1:2376  7e03              jle      0x237b
1:2378  e9ecfe            jmp      0x2267
1:237B  8b5eb4            mov      bx, word ptr [bp - 0x4c]
1:237E  837f0803          cmp      word ptr [bx + 8], 3
1:2382  7f03              jg       0x2387
1:2384  e99b00            jmp      0x2422
1:2387  8b470a            mov      ax, word ptr [bx + 0xa]
1:238A  394708            cmp      word ptr [bx + 8], ax
1:238D  7e03              jle      0x2392
1:238F  e99000            jmp      0x2422
1:2392  837f1a00          cmp      word ptr [bx + 0x1a], 0
1:2396  747e              je       0x2416
1:2398  b80900            mov      ax, 9
1:239B  50                push     ax
1:239C  9abf230000        lcall    0, 0x23bf  ; @1:INT:ord_7(1:42FE)
1:23A1  5b                pop      bx
1:23A2  3d0100            cmp      ax, 1
1:23A5  7d6f              jge      0x2416
1:23A7  8b5e0c            mov      bx, word ptr [bp + 0xc]
1:23AA  837f0c00          cmp      word ptr [bx + 0xc], 0
1:23AE  740a              je       0x23ba
1:23B0  ff365e00          push     word ptr [0x5e]
1:23B4  9a28170000        lcall    0, 0x1728  ; @1:INT:ord_12(1:4486)
1:23B9  5b                pop      bx
1:23BA  b81800            mov      ax, 0x18
1:23BD  50                push     ax
1:23BE  9ae4230000        lcall    0, 0x23e4  ; @1:INT:ord_7(1:42FE)
1:23C3  5b                pop      bx
1:23C4  0c0f              or       al, 0xf
1:23C6  99                cdq      
1:23C7  8946ac            mov      word ptr [bp - 0x54], ax
1:23CA  8956ae            mov      word ptr [bp - 0x52], dx
1:23CD  52                push     dx
1:23CE  50                push     ax
1:23CF  8b5eb4            mov      bx, word ptr [bp - 0x4c]
1:23D2  ff7702            push     word ptr [bx + 2]
1:23D5  ff37              push     word ptr [bx]
1:23D7  9a0f240000        lcall    0, 0x240f  ; @1:INT:ord_29(1:2BA9)
1:23DC  83c408            add      sp, 8
1:23DF  b80100            mov      ax, 1
1:23E2  50                push     ax
1:23E3  9a2f240000        lcall    0, 0x242f  ; @1:INT:ord_7(1:42FE)
1:23E8  5b                pop      bx
1:23E9  0bc0              or       ax, ax
1:23EB  7429              je       0x2416
1:23ED  b80200            mov      ax, 2
1:23F0  99                cdq      
1:23F1  52                push     dx
1:23F2  50                push     ax
1:23F3  ff76ae            push     word ptr [bp - 0x52]
1:23F6  ff76ac            push     word ptr [bp - 0x54]
1:23F9  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_30(1:0294)
1:23FE  050100            add      ax, 1
1:2401  83d200            adc      dx, 0
1:2404  52                push     dx
1:2405  50                push     ax
1:2406  8b5eb4            mov      bx, word ptr [bp - 0x4c]
1:2409  ff7702            push     word ptr [bx + 2]
1:240C  ff37              push     word ptr [bx]
1:240E  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_29(1:2BA9)
1:2413  83c408            add      sp, 8
1:2416  8b5eb4            mov      bx, word ptr [bp - 0x4c]
1:2419  ff7714            push     word ptr [bx + 0x14]
1:241C  9afd190000        lcall    0, 0x19fd  ; @1:INT:ord_9(1:4426)
1:2421  5b                pop      bx
1:2422  8b5eb4            mov      bx, word ptr [bp - 0x4c]
1:2425  c7470a0100        mov      word ptr [bx + 0xa], 1
1:242A  b80800            mov      ax, 8
1:242D  50                push     ax
1:242E  9a731d0000        lcall    0, 0x1d73  ; @1:INT:ord_7(1:42FE)
1:2433  5b                pop      bx
1:2434  3d0400            cmp      ax, 4
1:2437  74f1              je       0x242a
1:2439  8b5eb4            mov      bx, word ptr [bp - 0x4c]
1:243C  8b5f04            mov      bx, word ptr [bx + 4]
1:243F  d1e3              shl      bx, 1
1:2441  39874600          cmp      word ptr [bx + 0x46], ax
1:2445  7403              je       0x244a
1:2447  e917fe            jmp      0x2261
1:244A  ebde              jmp      0x242a
1:244C  ff46b2            inc      word ptr [bp - 0x4e]
1:244F  8b46b2            mov      ax, word ptr [bp - 0x4e]
1:2452  3946b6            cmp      word ptr [bp - 0x4a], ax
1:2455  7c08              jl       0x245f
1:2457  c746ca0000        mov      word ptr [bp - 0x36], 0
1:245C  e9c8fe            jmp      0x2327
1:245F  b85006            mov      ax, 0x650
1:2462  50                push     ax
1:2463  9a4b260000        lcall    0, 0x264b  ; @1:INT:ord_36(1:422B)
1:2468  5b                pop      bx
1:2469  8b46be            mov      ax, word ptr [bp - 0x42]
1:246C  8946c8            mov      word ptr [bp - 0x38], ax
1:246F  e92001            jmp      0x2592
1:2472  8b46ea            mov      ax, word ptr [bp - 0x16]
1:2475  f76ec8            imul     word ptr [bp - 0x38]
1:2478  8b4ed2            mov      cx, word ptr [bp - 0x2e]
1:247B  41                inc      cx
1:247C  3bc1              cmp      ax, cx
1:247E  7c03              jl       0x2483
1:2480  e93a01            jmp      0x25bd
1:2483  837edc00          cmp      word ptr [bp - 0x24], 0
1:2487  741f              je       0x24a8
1:2489  8b46d2            mov      ax, word ptr [bp - 0x2e]
1:248C  8b5e0c            mov      bx, word ptr [bp + 0xc]
1:248F  39474a            cmp      word ptr [bx + 0x4a], ax
1:2492  7d14              jge      0x24a8
1:2494  40                inc      ax
1:2495  8b4ef2            mov      cx, word ptr [bp - 0xe]
1:2498  034ec8            add      cx, word ptr [bp - 0x38]
1:249B  3bc8              cmp      cx, ax
1:249D  7c09              jl       0x24a8
1:249F  8b46dc            mov      ax, word ptr [bp - 0x24]
1:24A2  01474e            add      word ptr [bx + 0x4e], ax
1:24A5  e91501            jmp      0x25bd
1:24A8  8b46c8            mov      ax, word ptr [bp - 0x38]
1:24AB  8946b0            mov      word ptr [bp - 0x50], ax
1:24AE  8b4ed2            mov      cx, word ptr [bp - 0x2e]
1:24B1  894eac            mov      word ptr [bp - 0x54], cx
1:24B4  854ed8            test     word ptr [bp - 0x28], cx
1:24B7  7405              je       0x24be
1:24B9  8546ce            test     word ptr [bp - 0x32], ax
1:24BC  7517              jne      0x24d5
1:24BE  8b5e0c            mov      bx, word ptr [bp + 0xc]
1:24C1  837f5600          cmp      word ptr [bx + 0x56], 0
1:24C5  7503              jne      0x24ca
1:24C7  e9bf00            jmp      0x2589
1:24CA  0bc9              or       cx, cx
1:24CC  7407              je       0x24d5
1:24CE  0bc0              or       ax, ax
1:24D0  7403              je       0x24d5
1:24D2  e9b400            jmp      0x2589
1:24D5  837ebc00          cmp      word ptr [bp - 0x44], 0
1:24D9  7409              je       0x24e4
1:24DB  837eba00          cmp      word ptr [bp - 0x46], 0
1:24DF  7403              je       0x24e4
1:24E1  e9a500            jmp      0x2589
1:24E4  ff76e8            push     word ptr [bp - 0x18]
1:24E7  9ae3250000        lcall    0, 0x25e3  ; @1:INT:ord_7(1:42FE)
1:24EC  5b                pop      bx
1:24ED  3b46c6            cmp      ax, word ptr [bp - 0x3a]
1:24F0  7d05              jge      0x24f7
1:24F2  b80100            mov      ax, 1
1:24F5  eb02              jmp      0x24f9
1:24F7  2bc0              sub      ax, ax
1:24F9  8946d0            mov      word ptr [bp - 0x30], ax
1:24FC  0bc0              or       ax, ax
1:24FE  7408              je       0x2508
1:2500  8b5e0c            mov      bx, word ptr [bp + 0xc]
1:2503  8b4738            mov      ax, word ptr [bx + 0x38]
1:2506  eb06              jmp      0x250e
1:2508  8b5e0c            mov      bx, word ptr [bp + 0xc]
1:250B  8b473a            mov      ax, word ptr [bx + 0x3a]
1:250E  8946f6            mov      word ptr [bp - 0xa], ax
1:2511  50                push     ax
1:2512  ff76b0            push     word ptr [bp - 0x50]
1:2515  ff76ac            push     word ptr [bp - 0x54]
1:2518  9a4e250000        lcall    0, 0x254e  ; @1:INT:ord_32(1:4565)
1:251D  83c406            add      sp, 6
1:2520  8b5e0c            mov      bx, word ptr [bp + 0xc]
1:2523  83bf2c0100        cmp      word ptr [bx + 0x12c], 0
1:2528  745f              je       0x2589
1:252A  ff76e2            push     word ptr [bp - 0x1e]
1:252D  9a84250000        lcall    0, 0x2584  ; @1:INT:ord_9(1:4426)
1:2532  5b                pop      bx
1:2533  837ed000          cmp      word ptr [bp - 0x30], 0
1:2537  741e              je       0x2557
1:2539  ff76e4            push     word ptr [bp - 0x1c]
1:253C  ff76e2            push     word ptr [bp - 0x1e]
1:253F  8b46b0            mov      ax, word ptr [bp - 0x50]
1:2542  0346c0            add      ax, word ptr [bp - 0x40]
1:2545  50                push     ax
1:2546  8b46ac            mov      ax, word ptr [bp - 0x54]
1:2549  0346c4            add      ax, word ptr [bp - 0x3c]
1:254C  50                push     ax
1:254D  9a79250000        lcall    0, 0x2579  ; @1:INT:ord_32(1:4565)
1:2552  83c408            add      sp, 8
1:2555  eb32              jmp      0x2589
1:2557  8b46e4            mov      ax, word ptr [bp - 0x1c]
1:255A  0b46e2            or       ax, word ptr [bp - 0x1e]
1:255D  7505              jne      0x2564
1:255F  b80100            mov      ax, 1
1:2562  eb02              jmp      0x2566
1:2564  2bc0              sub      ax, ax
1:2566  8946f6            mov      word ptr [bp - 0xa], ax
1:2569  50                push     ax
1:256A  8b46b0            mov      ax, word ptr [bp - 0x50]
1:256D  0346c0            add      ax, word ptr [bp - 0x40]
1:2570  50                push     ax
1:2571  8b46ac            mov      ax, word ptr [bp - 0x54]
1:2574  0346c4            add      ax, word ptr [bp - 0x3c]
1:2577  50                push     ax
1:2578  9af2250000        lcall    0, 0x25f2  ; @1:INT:ord_32(1:4565)
1:257D  83c406            add      sp, 6
1:2580  ff76e2            push     word ptr [bp - 0x1e]
1:2583  9afd250000        lcall    0, 0x25fd  ; @1:INT:ord_9(1:4426)
1:2588  5b                pop      bx
1:2589  ff46c8            inc      word ptr [bp - 0x38]
1:258C  8b46f0            mov      ax, word ptr [bp - 0x10]
1:258F  0146c6            add      word ptr [bp - 0x3a], ax
1:2592  8b46c8            mov      ax, word ptr [bp - 0x38]
1:2595  3946d6            cmp      word ptr [bp - 0x2a], ax
1:2598  7c23              jl       0x25bd
1:259A  3946ec            cmp      word ptr [bp - 0x14], ax
1:259D  7f1e              jg       0x25bd
1:259F  837ee000          cmp      word ptr [bp - 0x20], 0
1:25A3  7503              jne      0x25a8
1:25A5  e9cafe            jmp      0x2472
1:25A8  8bc8              mov      cx, ax
1:25AA  b8ffff            mov      ax, 0xffff
1:25AD  2b46d2            sub      ax, word ptr [bp - 0x2e]
1:25B0  f76ee0            imul     word ptr [bp - 0x20]
1:25B3  034606            add      ax, word ptr [bp + 6]
1:25B6  3bc1              cmp      ax, cx
1:25B8  7e03              jle      0x25bd
1:25BA  e9ebfe            jmp      0x24a8
1:25BD  8b5e0c            mov      bx, word ptr [bp + 0xc]
1:25C0  837f7200          cmp      word ptr [bx + 0x72], 0
1:25C4  7575              jne      0x263b
1:25C6  837f5a00          cmp      word ptr [bx + 0x5a], 0
1:25CA  746f              je       0x263b
1:25CC  eb37              jmp      0x2605
1:25CE  c746f60100        mov      word ptr [bp - 0xa], 1
1:25D3  ff76f6            push     word ptr [bp - 0xa]
1:25D6  eb03              jmp      0x25db
1:25D8  2bc0              sub      ax, ax
1:25DA  50                push     ax
1:25DB  8b4606            mov      ax, word ptr [bp + 6]
1:25DE  48                dec      ax
1:25DF  50                push     ax
1:25E0  8bf0              mov      si, ax
1:25E2  9aeb250000        lcall    0, 0x25eb  ; @1:INT:ord_7(1:42FE)
1:25E7  5b                pop      bx
1:25E8  50                push     ax
1:25E9  56                push     si
1:25EA  9a1a260000        lcall    0, 0x261a  ; @1:INT:ord_7(1:42FE)
1:25EF  5b                pop      bx
1:25F0  50                push     ax
1:25F1  9a11230000        lcall    0, 0x2311  ; @1:INT:ord_32(1:4565)
1:25F6  83c406            add      sp, 6
1:25F9  ff76e2            push     word ptr [bp - 0x1e]
1:25FC  9ac3200000        lcall    0, 0x20c3  ; @1:INT:ord_9(1:4426)
1:2601  5b                pop      bx
1:2602  ff46c8            inc      word ptr [bp - 0x38]
1:2605  8b46c8            mov      ax, word ptr [bp - 0x38]
1:2608  3946d6            cmp      word ptr [bp - 0x2a], ax
1:260B  7c2e              jl       0x263b
1:260D  0bc0              or       ax, ax
1:260F  7c2a              jl       0x263b
1:2611  a801              test     al, 1
1:2613  74ed              je       0x2602
1:2615  b80100            mov      ax, 1
1:2618  50                push     ax
1:2619  9a0e210000        lcall    0, 0x210e  ; @1:INT:ord_7(1:42FE)
1:261E  5b                pop      bx
1:261F  0bc0              or       ax, ax
1:2621  74b5              je       0x25d8
1:2623  8b5e0c            mov      bx, word ptr [bp + 0xc]
1:2626  837f0c00          cmp      word ptr [bx + 0xc], 0
1:262A  74a2              je       0x25ce
1:262C  ff365e00          push     word ptr [0x5e]
1:2630  9a76130000        lcall    0, 0x1376  ; @1:INT:ord_10(1:44CD)
1:2635  5b                pop      bx
1:2636  8946f6            mov      word ptr [bp - 0xa], ax
1:2639  eb98              jmp      0x25d3
1:263B  2bc0              sub      ax, ax
1:263D  50                push     ax
1:263E  50                push     ax
1:263F  9ad5200000        lcall    0, 0x20d5  ; @1:INT:ord_17(1:43C8)
1:2644  5b                pop      bx
1:2645  5b                pop      bx
1:2646  b85006            mov      ax, 0x650
1:2649  50                push     ax
1:264A  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_36(1:422B)
1:264F  5b                pop      bx
1:2650  2bc0              sub      ax, ax
1:2652  5e                pop      si
1:2653  5f                pop      di
1:2654  4d                dec      bp
1:2655  4d                dec      bp
1:2656  8be5              mov      sp, bp
1:2658  1f                pop      ds
1:2659  5d                pop      bp
1:265A  4d                dec      bp
1:265B  cb                retf     

; ===== EXPORT:ord_43(#43) =====
1:265C  1e                push     ds
1:265D  58                pop      ax
1:265E  90                nop      
1:265F  45                inc      bp
1:2660  55                push     bp
1:2661  8bec              mov      bp, sp
1:2663  1e                push     ds
1:2664  8ed8              mov      ds, ax
1:2666  b86206            mov      ax, 0x662
1:2669  50                push     ax
1:266A  9a0f280000        lcall    0, 0x280f  ; @1:INT:ord_34(1:410C)
1:266F  5b                pop      bx
1:2670  b80700            mov      ax, 7
1:2673  50                push     ax
1:2674  9a19280000        lcall    0, 0x2819  ; @1:INT:ord_31(1:41BB)
1:2679  5b                pop      bx
1:267A  ff369208          push     word ptr [0x892]
1:267E  8b5e06            mov      bx, word ptr [bp + 6]
1:2681  ff37              push     word ptr [bx]
1:2683  ff7702            push     word ptr [bx + 2]
1:2686  ff7704            push     word ptr [bx + 4]
1:2689  ff7706            push     word ptr [bx + 6]
1:268C  9ad9260000        lcall    0, 0x26d9  ; @1:GDI.Ellipse
1:2691  b86206            mov      ax, 0x662
1:2694  50                push     ax
1:2695  9a64240000        lcall    0, 0x2464  ; @1:INT:ord_36(1:422B)
1:269A  5b                pop      bx
1:269B  4d                dec      bp
1:269C  4d                dec      bp
1:269D  8be5              mov      sp, bp
1:269F  1f                pop      ds
1:26A0  5d                pop      bp
1:26A1  4d                dec      bp
1:26A2  cb                retf     

; ===== EXPORT:ord_44(#44) =====
1:26A3  1e                push     ds
1:26A4  58                pop      ax
1:26A5  90                nop      
1:26A6  45                inc      bp
1:26A7  55                push     bp
1:26A8  8bec              mov      bp, sp
1:26AA  1e                push     ds
1:26AB  8ed8              mov      ds, ax
1:26AD  83ec04            sub      sp, 4
1:26B0  ff369208          push     word ptr [0x892]
1:26B4  b80500            mov      ax, 5
1:26B7  50                push     ax
1:26B8  9a3b170000        lcall    0, 0x173b  ; @1:GDI.GetStockObject
1:26BD  50                push     ax
1:26BE  9ae5260000        lcall    0, 0x26e5  ; @1:GDI.SelectObject
1:26C3  8946fc            mov      word ptr [bp - 4], ax
1:26C6  ff369208          push     word ptr [0x892]
1:26CA  8b5e06            mov      bx, word ptr [bp + 6]
1:26CD  ff37              push     word ptr [bx]
1:26CF  ff7702            push     word ptr [bx + 2]
1:26D2  ff7704            push     word ptr [bx + 4]
1:26D5  ff7706            push     word ptr [bx + 6]
1:26D8  9affff0000        lcall    0, 0xffff  ; @1:GDI.Ellipse
1:26DD  ff369208          push     word ptr [0x892]
1:26E1  ff76fc            push     word ptr [bp - 4]
1:26E4  9aee000000        lcall    0, 0xee  ; @1:GDI.SelectObject
1:26E9  4d                dec      bp
1:26EA  4d                dec      bp
1:26EB  8be5              mov      sp, bp
1:26ED  1f                pop      ds
1:26EE  5d                pop      bp
1:26EF  4d                dec      bp
1:26F0  cb                retf     

; ===== EXPORT:ord_23(#23) =====
1:26F1  1e                push     ds
1:26F2  58                pop      ax
1:26F3  90                nop      
1:26F4  45                inc      bp
1:26F5  55                push     bp
1:26F6  8bec              mov      bp, sp
1:26F8  1e                push     ds
1:26F9  8ed8              mov      ds, ax
1:26FB  83ec06            sub      sp, 6
1:26FE  b87406            mov      ax, 0x674
1:2701  50                push     ax
1:2702  b86a06            mov      ax, 0x66a
1:2705  50                push     ax
1:2706  ff7606            push     word ptr [bp + 6]
1:2709  9a3b210000        lcall    0, 0x213b  ; @1:INT:ord_21(1:42AA)
1:270E  83c406            add      sp, 6
1:2711  a16a06            mov      ax, word ptr [0x66a]
1:2714  99                cdq      
1:2715  2bc2              sub      ax, dx
1:2717  d1f8              sar      ax, 1
1:2719  8946fa            mov      word ptr [bp - 6], ax
1:271C  b80400            mov      ax, 4
1:271F  50                push     ax
1:2720  9a3c270000        lcall    0, 0x273c  ; @1:INT:ord_7(1:42FE)
1:2725  5b                pop      bx
1:2726  48                dec      ax
1:2727  7403              je       0x272c
1:2729  e9c200            jmp      0x27ee
1:272C  a16a06            mov      ax, word ptr [0x66a]
1:272F  99                cdq      
1:2730  2bc2              sub      ax, dx
1:2732  d1f8              sar      ax, 1
1:2734  8946fa            mov      word ptr [bp - 6], ax
1:2737  b80100            mov      ax, 1
1:273A  50                push     ax
1:273B  9a4b270000        lcall    0, 0x274b  ; @1:INT:ord_7(1:42FE)
1:2740  5b                pop      bx
1:2741  0bc0              or       ax, ax
1:2743  744d              je       0x2792
1:2745  eb45              jmp      0x278c
1:2747  ff76fa            push     word ptr [bp - 6]
1:274A  9a97270000        lcall    0, 0x2797  ; @1:INT:ord_7(1:42FE)
1:274F  5b                pop      bx
1:2750  8946fa            mov      word ptr [bp - 6], ax
1:2753  3d0300            cmp      ax, 3
1:2756  7c3a              jl       0x2792
1:2758  b96c06            mov      cx, 0x66c
1:275B  1e                push     ds
1:275C  51                push     cx
1:275D  48                dec      ax
1:275E  f7d8              neg      ax
1:2760  50                push     ax
1:2761  50                push     ax
1:2762  ff76fa            push     word ptr [bp - 6]
1:2765  ff76fa            push     word ptr [bp - 6]
1:2768  9aca270000        lcall    0, 0x27ca  ; @1:USER.SetRect
1:276D  ff369208          push     word ptr [0x892]
1:2771  b86c06            mov      ax, 0x66c
1:2774  1e                push     ds
1:2775  50                push     ax
1:2776  9a471c0000        lcall    0, 0x1c47  ; @1:USER.InvertRect
1:277B  b81400            mov      ax, 0x14
1:277E  99                cdq      
1:277F  52                push     dx
1:2780  50                push     ax
1:2781  9ade270000        lcall    0, 0x27de  ; @1:INT:ord_38(1:4334)
1:2786  5b                pop      bx
1:2787  5b                pop      bx
1:2788  836efa06          sub      word ptr [bp - 6], 6
1:278C  837efa00          cmp      word ptr [bp - 6], 0
1:2790  7fb5              jg       0x2747
1:2792  b80100            mov      ax, 1
1:2795  50                push     ax
1:2796  9aac270000        lcall    0, 0x27ac  ; @1:INT:ord_7(1:42FE)
1:279B  5b                pop      bx
1:279C  0bc0              or       ax, ax
1:279E  744e              je       0x27ee
1:27A0  a16a06            mov      ax, word ptr [0x66a]
1:27A3  8946fa            mov      word ptr [bp - 6], ax
1:27A6  eb40              jmp      0x27e8
1:27A8  ff76fa            push     word ptr [bp - 6]
1:27AB  9a2c280000        lcall    0, 0x282c  ; @1:INT:ord_7(1:42FE)
1:27B0  5b                pop      bx
1:27B1  8946fa            mov      word ptr [bp - 6], ax
1:27B4  3d0300            cmp      ax, 3
1:27B7  7c35              jl       0x27ee
1:27B9  b96c06            mov      cx, 0x66c
1:27BC  1e                push     ds
1:27BD  51                push     cx
1:27BE  48                dec      ax
1:27BF  f7d8              neg      ax
1:27C1  50                push     ax
1:27C2  50                push     ax
1:27C3  ff76fa            push     word ptr [bp - 6]
1:27C6  ff76fa            push     word ptr [bp - 6]
1:27C9  9a0d0f0000        lcall    0, 0xf0d  ; @1:USER.SetRect
1:27CE  b86c06            mov      ax, 0x66c
1:27D1  50                push     ax
1:27D2  0e                push     cs
1:27D3  e886fe            call     0x265c
1:27D6  5b                pop      bx
1:27D7  b81400            mov      ax, 0x14
1:27DA  99                cdq      
1:27DB  52                push     dx
1:27DC  50                push     ax
1:27DD  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_38(1:4334)
1:27E2  5b                pop      bx
1:27E3  5b                pop      bx
1:27E4  836efa06          sub      word ptr [bp - 6], 6
1:27E8  837efa00          cmp      word ptr [bp - 6], 0
1:27EC  7fba              jg       0x27a8
1:27EE  4d                dec      bp
1:27EF  4d                dec      bp
1:27F0  8be5              mov      sp, bp
1:27F2  1f                pop      ds
1:27F3  5d                pop      bp
1:27F4  4d                dec      bp
1:27F5  cb                retf     

; ===== EXPORT:ord_18(#18) =====
1:27F6  1e                push     ds
1:27F7  58                pop      ax
1:27F8  90                nop      
1:27F9  45                inc      bp
1:27FA  55                push     bp
1:27FB  8bec              mov      bp, sp
1:27FD  1e                push     ds
1:27FE  8ed8              mov      ds, ax
1:2800  83ec22            sub      sp, 0x22
1:2803  57                push     di
1:2804  56                push     si
1:2805  c746fc0000        mov      word ptr [bp - 4], 0
1:280A  b87606            mov      ax, 0x676
1:280D  50                push     ax
1:280E  9ab7200000        lcall    0, 0x20b7  ; @1:INT:ord_34(1:410C)
1:2813  5b                pop      bx
1:2814  b80700            mov      ax, 7
1:2817  50                push     ax
1:2818  9a50230000        lcall    0, 0x2350  ; @1:INT:ord_31(1:41BB)
1:281D  5b                pop      bx
1:281E  b80100            mov      ax, 1
1:2821  a3ce08            mov      word ptr [0x8ce], ax
1:2824  a35a09            mov      word ptr [0x95a], ax
1:2827  b80300            mov      ax, 3
1:282A  50                push     ax
1:282B  9a40280000        lcall    0, 0x2840  ; @1:INT:ord_7(1:42FE)
1:2830  5b                pop      bx
1:2831  0c01              or       al, 1
1:2833  a3ce08            mov      word ptr [0x8ce], ax
1:2836  3d0100            cmp      ax, 1
1:2839  750f              jne      0x284a
1:283B  b80300            mov      ax, 3
1:283E  50                push     ax
1:283F  9a70280000        lcall    0, 0x2870  ; @1:INT:ord_7(1:42FE)
1:2844  5b                pop      bx
1:2845  0c01              or       al, 1
1:2847  a35a09            mov      word ptr [0x95a], ax
1:284A  b88606            mov      ax, 0x686
1:284D  8b5606            mov      dx, word ptr [bp + 6]
1:2850  8bf8              mov      di, ax
1:2852  8bf2              mov      si, dx
1:2854  1e                push     ds
1:2855  07                pop      es
1:2856  a5                movsw    word ptr es:[di], word ptr [si]
1:2857  a5                movsw    word ptr es:[di], word ptr [si]
1:2858  a5                movsw    word ptr es:[di], word ptr [si]
1:2859  a5                movsw    word ptr es:[di], word ptr [si]
1:285A  50                push     ax
1:285B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_37(1:4281)
1:2860  5b                pop      bx
1:2861  a18a06            mov      ax, word ptr [0x68a]
1:2864  2b068606          sub      ax, word ptr [0x686]
1:2868  8946fa            mov      word ptr [bp - 6], ax
1:286B  b80800            mov      ax, 8
1:286E  50                push     ax
1:286F  9a97280000        lcall    0, 0x2897  ; @1:INT:ord_7(1:42FE)
1:2874  5b                pop      bx
1:2875  0bc0              or       ax, ax
1:2877  7c19              jl       0x2892
1:2879  2d0300            sub      ax, 3
1:287C  7e0e              jle      0x288c
1:287E  48                dec      ax
1:287F  7c11              jl       0x2892
1:2881  48                dec      ax
1:2882  7e2f              jle      0x28b3
1:2884  48                dec      ax
1:2885  7c0b              jl       0x2892
1:2887  48                dec      ax
1:2888  7e31              jle      0x28bb
1:288A  eb06              jmp      0x2892
1:288C  c706d2080400      mov      word ptr [0x8d2], 4
1:2892  b80800            mov      ax, 8
1:2895  50                push     ax
1:2896  9ace280000        lcall    0, 0x28ce  ; @1:INT:ord_7(1:42FE)
1:289B  5b                pop      bx
1:289C  0bc0              or       ax, ax
1:289E  7c29              jl       0x28c9
1:28A0  2d0300            sub      ax, 3
1:28A3  7e1e              jle      0x28c3
1:28A5  48                dec      ax
1:28A6  7c21              jl       0x28c9
1:28A8  48                dec      ax
1:28A9  7e42              jle      0x28ed
1:28AB  48                dec      ax
1:28AC  7c1b              jl       0x28c9
1:28AE  48                dec      ax
1:28AF  7e44              jle      0x28f5
1:28B1  eb16              jmp      0x28c9
1:28B3  c706d2080100      mov      word ptr [0x8d2], 1
1:28B9  ebd7              jmp      0x2892
1:28BB  c706d2080200      mov      word ptr [0x8d2], 2
1:28C1  ebcf              jmp      0x2892
1:28C3  c7065e090400      mov      word ptr [0x95e], 4
1:28C9  b80100            mov      ax, 1
1:28CC  50                push     ax
1:28CD  9adc280000        lcall    0, 0x28dc  ; @1:INT:ord_7(1:42FE)
1:28D2  5b                pop      bx
1:28D3  40                inc      ax
1:28D4  a3d008            mov      word ptr [0x8d0], ax
1:28D7  b80100            mov      ax, 1
1:28DA  50                push     ax
1:28DB  9a01290000        lcall    0, 0x2901  ; @1:INT:ord_7(1:42FE)
1:28E0  5b                pop      bx
1:28E1  40                inc      ax
1:28E2  a35c09            mov      word ptr [0x95c], ax
1:28E5  c746e20000        mov      word ptr [bp - 0x1e], 0
1:28EA  e94202            jmp      0x2b2f
1:28ED  c7065e090100      mov      word ptr [0x95e], 1
1:28F3  ebd4              jmp      0x28c9
1:28F5  c7065e090200      mov      word ptr [0x95e], 2
1:28FB  ebcc              jmp      0x28c9
1:28FD  ff76fa            push     word ptr [bp - 6]
1:2900  9a1b290000        lcall    0, 0x291b  ; @1:INT:ord_7(1:42FE)
1:2905  5b                pop      bx
1:2906  0c03              or       al, 3
1:2908  99                cdq      
1:2909  8946e8            mov      word ptr [bp - 0x18], ax
1:290C  8956ea            mov      word ptr [bp - 0x16], dx
1:290F  8b46fa            mov      ax, word ptr [bp - 6]
1:2912  99                cdq      
1:2913  2bc2              sub      ax, dx
1:2915  d1f8              sar      ax, 1
1:2917  50                push     ax
1:2918  8bf0              mov      si, ax
1:291A  9a27290000        lcall    0, 0x2927  ; @1:INT:ord_7(1:42FE)
1:291F  5b                pop      bx
1:2920  40                inc      ax
1:2921  40                inc      ax
1:2922  8946f4            mov      word ptr [bp - 0xc], ax
1:2925  56                push     si
1:2926  9a9c290000        lcall    0, 0x299c  ; @1:INT:ord_7(1:42FE)
1:292B  5b                pop      bx
1:292C  40                inc      ax
1:292D  40                inc      ax
1:292E  8946f2            mov      word ptr [bp - 0xe], ax
1:2931  a1d208            mov      ax, word ptr [0x8d2]
1:2934  8946f0            mov      word ptr [bp - 0x10], ax
1:2937  8b0ece08          mov      cx, word ptr [0x8ce]
1:293B  894ee4            mov      word ptr [bp - 0x1c], cx
1:293E  b80e00            mov      ax, 0xe
1:2941  f76eec            imul     word ptr [bp - 0x14]
1:2944  8bd8              mov      bx, ax
1:2946  a1d208            mov      ax, word ptr [0x8d2]
1:2949  8987d208          mov      word ptr [bx + 0x8d2], ax
1:294D  8b46f2            mov      ax, word ptr [bp - 0xe]
1:2950  8b56f4            mov      dx, word ptr [bp - 0xc]
1:2953  8987c608          mov      word ptr [bx + 0x8c6], ax
1:2957  8997c808          mov      word ptr [bx + 0x8c8], dx
1:295B  8b4ee8            mov      cx, word ptr [bp - 0x18]
1:295E  8b76ea            mov      si, word ptr [bp - 0x16]
1:2961  898fca08          mov      word ptr [bx + 0x8ca], cx
1:2965  89b7cc08          mov      word ptr [bx + 0x8cc], si
1:2969  8b7ee4            mov      di, word ptr [bp - 0x1c]
1:296C  89bfce08          mov      word ptr [bx + 0x8ce], di
1:2970  2bdb              sub      bx, bx
1:2972  53                push     bx
1:2973  57                push     di
1:2974  56                push     si
1:2975  51                push     cx
1:2976  52                push     dx
1:2977  50                push     ax
1:2978  ff76f0            push     word ptr [bp - 0x10]
1:297B  0e                push     cs
1:297C  e8db04            call     0x2e5a
1:297F  83c40e            add      sp, 0xe
1:2982  ff46ec            inc      word ptr [bp - 0x14]
1:2985  a1d008            mov      ax, word ptr [0x8d0]
1:2988  3946ec            cmp      word ptr [bp - 0x14], ax
1:298B  7f03              jg       0x2990
1:298D  e96dff            jmp      0x28fd
1:2990  c746ec0000        mov      word ptr [bp - 0x14], 0
1:2995  e98800            jmp      0x2a20
1:2998  ff76fa            push     word ptr [bp - 6]
1:299B  9ab6290000        lcall    0, 0x29b6  ; @1:INT:ord_7(1:42FE)
1:29A0  5b                pop      bx
1:29A1  0c01              or       al, 1
1:29A3  99                cdq      
1:29A4  8946e8            mov      word ptr [bp - 0x18], ax
1:29A7  8956ea            mov      word ptr [bp - 0x16], dx
1:29AA  8b46fa            mov      ax, word ptr [bp - 6]
1:29AD  99                cdq      
1:29AE  2bc2              sub      ax, dx
1:29B0  d1f8              sar      ax, 1
1:29B2  50                push     ax
1:29B3  8bf0              mov      si, ax
1:29B5  9ac2290000        lcall    0, 0x29c2  ; @1:INT:ord_7(1:42FE)
1:29BA  5b                pop      bx
1:29BB  40                inc      ax
1:29BC  40                inc      ax
1:29BD  8946f4            mov      word ptr [bp - 0xc], ax
1:29C0  56                push     si
1:29C1  9ae8240000        lcall    0, 0x24e8  ; @1:INT:ord_7(1:42FE)
1:29C6  5b                pop      bx
1:29C7  40                inc      ax
1:29C8  40                inc      ax
1:29C9  8946f2            mov      word ptr [bp - 0xe], ax
1:29CC  a15e09            mov      ax, word ptr [0x95e]
1:29CF  8946f0            mov      word ptr [bp - 0x10], ax
1:29D2  8b0e5a09          mov      cx, word ptr [0x95a]
1:29D6  894ee4            mov      word ptr [bp - 0x1c], cx
1:29D9  b80e00            mov      ax, 0xe
1:29DC  f76eec            imul     word ptr [bp - 0x14]
1:29DF  8bd8              mov      bx, ax
1:29E1  a15e09            mov      ax, word ptr [0x95e]
1:29E4  89875e09          mov      word ptr [bx + 0x95e], ax
1:29E8  8b46f2            mov      ax, word ptr [bp - 0xe]
1:29EB  8b56f4            mov      dx, word ptr [bp - 0xc]
1:29EE  89875209          mov      word ptr [bx + 0x952], ax
1:29F2  89975409          mov      word ptr [bx + 0x954], dx
1:29F6  8b4ee8            mov      cx, word ptr [bp - 0x18]
1:29F9  8b76ea            mov      si, word ptr [bp - 0x16]
1:29FC  898f5609          mov      word ptr [bx + 0x956], cx
1:2A00  89b75809          mov      word ptr [bx + 0x958], si
1:2A04  8b7ee4            mov      di, word ptr [bp - 0x1c]
1:2A07  89bf5a09          mov      word ptr [bx + 0x95a], di
1:2A0B  2bdb              sub      bx, bx
1:2A0D  53                push     bx
1:2A0E  57                push     di
1:2A0F  56                push     si
1:2A10  51                push     cx
1:2A11  52                push     dx
1:2A12  50                push     ax
1:2A13  ff76f0            push     word ptr [bp - 0x10]
1:2A16  0e                push     cs
1:2A17  e84004            call     0x2e5a
1:2A1A  83c40e            add      sp, 0xe
1:2A1D  ff46ec            inc      word ptr [bp - 0x14]
1:2A20  a15c09            mov      ax, word ptr [0x95c]
1:2A23  3946ec            cmp      word ptr [bp - 0x14], ax
1:2A26  7f03              jg       0x2a2b
1:2A28  e96dff            jmp      0x2998
1:2A2B  c746ec0000        mov      word ptr [bp - 0x14], 0
1:2A30  eb4f              jmp      0x2a81
1:2A32  b80e00            mov      ax, 0xe
1:2A35  f76eec            imul     word ptr [bp - 0x14]
1:2A38  8bd8              mov      bx, ax
1:2A3A  8b87c608          mov      ax, word ptr [bx + 0x8c6]
1:2A3E  8b97c808          mov      dx, word ptr [bx + 0x8c8]
1:2A42  8946f2            mov      word ptr [bp - 0xe], ax
1:2A45  8956f4            mov      word ptr [bp - 0xc], dx
1:2A48  8b8fca08          mov      cx, word ptr [bx + 0x8ca]
1:2A4C  8bb7cc08          mov      si, word ptr [bx + 0x8cc]
1:2A50  894ee8            mov      word ptr [bp - 0x18], cx
1:2A53  8976ea            mov      word ptr [bp - 0x16], si
1:2A56  8bbfd208          mov      di, word ptr [bx + 0x8d2]
1:2A5A  897ef0            mov      word ptr [bp - 0x10], di
1:2A5D  8946de            mov      word ptr [bp - 0x22], ax
1:2A60  8956e0            mov      word ptr [bp - 0x20], dx
1:2A63  8b87ce08          mov      ax, word ptr [bx + 0x8ce]
1:2A67  8946e4            mov      word ptr [bp - 0x1c], ax
1:2A6A  2bd2              sub      dx, dx
1:2A6C  52                push     dx
1:2A6D  50                push     ax
1:2A6E  56                push     si
1:2A6F  51                push     cx
1:2A70  ff76e0            push     word ptr [bp - 0x20]
1:2A73  ff76de            push     word ptr [bp - 0x22]
1:2A76  57                push     di
1:2A77  0e                push     cs
1:2A78  e8df03            call     0x2e5a
1:2A7B  83c40e            add      sp, 0xe
1:2A7E  ff46ec            inc      word ptr [bp - 0x14]
1:2A81  a1d008            mov      ax, word ptr [0x8d0]
1:2A84  3946ec            cmp      word ptr [bp - 0x14], ax
1:2A87  7ea9              jle      0x2a32
1:2A89  b80e00            mov      ax, 0xe
1:2A8C  f76eec            imul     word ptr [bp - 0x14]
1:2A8F  8bd8              mov      bx, ax
1:2A91  8b875a09          mov      ax, word ptr [bx + 0x95a]
1:2A95  8946e4            mov      word ptr [bp - 0x1c], ax
1:2A98  8b875e09          mov      ax, word ptr [bx + 0x95e]
1:2A9C  8946f0            mov      word ptr [bp - 0x10], ax
1:2A9F  837ee201          cmp      word ptr [bp - 0x1e], 1
1:2AA3  750e              jne      0x2ab3
1:2AA5  b80100            mov      ax, 1
1:2AA8  50                push     ax
1:2AA9  9abe2a0000        lcall    0, 0x2abe  ; @1:INT:ord_7(1:42FE)
1:2AAE  5b                pop      bx
1:2AAF  0bc0              or       ax, ax
1:2AB1  7414              je       0x2ac7
1:2AB3  837ef004          cmp      word ptr [bp - 0x10], 4
1:2AB7  7515              jne      0x2ace
1:2AB9  b80100            mov      ax, 1
1:2ABC  50                push     ax
1:2ABD  9ac02b0000        lcall    0, 0x2bc0  ; @1:INT:ord_7(1:42FE)
1:2AC2  5b                pop      bx
1:2AC3  0bc0              or       ax, ax
1:2AC5  7507              jne      0x2ace
1:2AC7  c746fc0100        mov      word ptr [bp - 4], 1
1:2ACC  eb5e              jmp      0x2b2c
1:2ACE  c746ec0000        mov      word ptr [bp - 0x14], 0
1:2AD3  eb4f              jmp      0x2b24
1:2AD5  b80e00            mov      ax, 0xe
1:2AD8  f76eec            imul     word ptr [bp - 0x14]
1:2ADB  8bd8              mov      bx, ax
1:2ADD  8b875209          mov      ax, word ptr [bx + 0x952]
1:2AE1  8b975409          mov      dx, word ptr [bx + 0x954]
1:2AE5  8946f2            mov      word ptr [bp - 0xe], ax
1:2AE8  8956f4            mov      word ptr [bp - 0xc], dx
1:2AEB  8b8f5609          mov      cx, word ptr [bx + 0x956]
1:2AEF  8bb75809          mov      si, word ptr [bx + 0x958]
1:2AF3  894ee8            mov      word ptr [bp - 0x18], cx
1:2AF6  8976ea            mov      word ptr [bp - 0x16], si
1:2AF9  8bbf5e09          mov      di, word ptr [bx + 0x95e]
1:2AFD  897ef0            mov      word ptr [bp - 0x10], di
1:2B00  8946de            mov      word ptr [bp - 0x22], ax
1:2B03  8956e0            mov      word ptr [bp - 0x20], dx
1:2B06  8b875a09          mov      ax, word ptr [bx + 0x95a]
1:2B0A  8946e4            mov      word ptr [bp - 0x1c], ax
1:2B0D  2bd2              sub      dx, dx
1:2B0F  52                push     dx
1:2B10  50                push     ax
1:2B11  56                push     si
1:2B12  51                push     cx
1:2B13  ff76e0            push     word ptr [bp - 0x20]
1:2B16  ff76de            push     word ptr [bp - 0x22]
1:2B19  57                push     di
1:2B1A  0e                push     cs
1:2B1B  e83c03            call     0x2e5a
1:2B1E  83c40e            add      sp, 0xe
1:2B21  ff46ec            inc      word ptr [bp - 0x14]
1:2B24  a15c09            mov      ax, word ptr [0x95c]
1:2B27  3946ec            cmp      word ptr [bp - 0x14], ax
1:2B2A  7ea9              jle      0x2ad5
1:2B2C  ff46e2            inc      word ptr [bp - 0x1e]
1:2B2F  837ee201          cmp      word ptr [bp - 0x1e], 1
1:2B33  7f08              jg       0x2b3d
1:2B35  c746ec0000        mov      word ptr [bp - 0x14], 0
1:2B3A  e948fe            jmp      0x2985
1:2B3D  b83c00            mov      ax, 0x3c
1:2B40  99                cdq      
1:2B41  52                push     dx
1:2B42  50                push     ax
1:2B43  9a82270000        lcall    0, 0x2782  ; @1:INT:ord_38(1:4334)
1:2B48  5b                pop      bx
1:2B49  5b                pop      bx
1:2B4A  b87606            mov      ax, 0x676
1:2B4D  50                push     ax
1:2B4E  9a96260000        lcall    0, 0x2696  ; @1:INT:ord_36(1:422B)
1:2B53  5b                pop      bx
1:2B54  8b46fc            mov      ax, word ptr [bp - 4]
1:2B57  5e                pop      si
1:2B58  5f                pop      di
1:2B59  4d                dec      bp
1:2B5A  4d                dec      bp
1:2B5B  8be5              mov      sp, bp
1:2B5D  1f                pop      ds
1:2B5E  5d                pop      bp
1:2B5F  4d                dec      bp
1:2B60  cb                retf     

; ===== EXPORT:ord_33(#33) =====
1:2B61  1e                push     ds
1:2B62  58                pop      ax
1:2B63  90                nop      
1:2B64  45                inc      bp
1:2B65  55                push     bp
1:2B66  8bec              mov      bp, sp
1:2B68  1e                push     ds
1:2B69  8ed8              mov      ds, ax
1:2B6B  83ec04            sub      sp, 4
1:2B6E  837e0e00          cmp      word ptr [bp + 0xe], 0
1:2B72  7407              je       0x2b7b
1:2B74  c746fc0300        mov      word ptr [bp - 4], 3
1:2B79  eb05              jmp      0x2b80
1:2B7B  c746fc0500        mov      word ptr [bp - 4], 5
1:2B80  b80400            mov      ax, 4
1:2B83  50                push     ax
1:2B84  9ab9260000        lcall    0, 0x26b9  ; @1:GDI.GetStockObject
1:2B89  50                push     ax
1:2B8A  b80100            mov      ax, 1
1:2B8D  50                push     ax
1:2B8E  ff760c            push     word ptr [bp + 0xc]
1:2B91  ff760a            push     word ptr [bp + 0xa]
1:2B94  ff7608            push     word ptr [bp + 8]
1:2B97  ff7606            push     word ptr [bp + 6]
1:2B9A  ff76fc            push     word ptr [bp - 4]
1:2B9D  0e                push     cs
1:2B9E  e8b902            call     0x2e5a
1:2BA1  4d                dec      bp
1:2BA2  4d                dec      bp
1:2BA3  8be5              mov      sp, bp
1:2BA5  1f                pop      ds
1:2BA6  5d                pop      bp
1:2BA7  4d                dec      bp
1:2BA8  cb                retf     

; ===== EXPORT:ord_29(#29) =====
1:2BA9  1e                push     ds
1:2BAA  58                pop      ax
1:2BAB  90                nop      
1:2BAC  45                inc      bp
1:2BAD  55                push     bp
1:2BAE  8bec              mov      bp, sp
1:2BB0  1e                push     ds
1:2BB1  8ed8              mov      ds, ax
1:2BB3  83ec04            sub      sp, 4
1:2BB6  c746fc0000        mov      word ptr [bp - 4], 0
1:2BBB  b80300            mov      ax, 3
1:2BBE  50                push     ax
1:2BBF  9ad22b0000        lcall    0, 0x2bd2  ; @1:INT:ord_7(1:42FE)
1:2BC4  5b                pop      bx
1:2BC5  48                dec      ax
1:2BC6  7405              je       0x2bcd
1:2BC8  c746fc0400        mov      word ptr [bp - 4], 4
1:2BCD  b80300            mov      ax, 3
1:2BD0  50                push     ax
1:2BD1  9a182c0000        lcall    0, 0x2c18  ; @1:INT:ord_7(1:42FE)
1:2BD6  5b                pop      bx
1:2BD7  48                dec      ax
1:2BD8  7505              jne      0x2bdf
1:2BDA  c746fc0500        mov      word ptr [bp - 4], 5
1:2BDF  2bc0              sub      ax, ax
1:2BE1  50                push     ax
1:2BE2  b80100            mov      ax, 1
1:2BE5  50                push     ax
1:2BE6  ff760c            push     word ptr [bp + 0xc]
1:2BE9  ff760a            push     word ptr [bp + 0xa]
1:2BEC  ff7608            push     word ptr [bp + 8]
1:2BEF  ff7606            push     word ptr [bp + 6]
1:2BF2  ff76fc            push     word ptr [bp - 4]
1:2BF5  0e                push     cs
1:2BF6  e86102            call     0x2e5a
1:2BF9  4d                dec      bp
1:2BFA  4d                dec      bp
1:2BFB  8be5              mov      sp, bp
1:2BFD  1f                pop      ds
1:2BFE  5d                pop      bp
1:2BFF  4d                dec      bp
1:2C00  cb                retf     
1:2C01  1e                push     ds
1:2C02  58                pop      ax
1:2C03  90                nop      
1:2C04  45                inc      bp
1:2C05  55                push     bp
1:2C06  8bec              mov      bp, sp
1:2C08  1e                push     ds
1:2C09  8ed8              mov      ds, ax
1:2C0B  83ec04            sub      sp, 4
1:2C0E  c746fc0000        mov      word ptr [bp - 4], 0
1:2C13  b80100            mov      ax, 1
1:2C16  50                push     ax
1:2C17  9a252c0000        lcall    0, 0x2c25  ; @1:INT:ord_7(1:42FE)
1:2C1C  5b                pop      bx
1:2C1D  48                dec      ax
1:2C1E  7515              jne      0x2c35
1:2C20  b80100            mov      ax, 1
1:2C23  50                push     ax
1:2C24  9a3a2c0000        lcall    0, 0x2c3a  ; @1:INT:ord_7(1:42FE)
1:2C29  5b                pop      bx
1:2C2A  3d0100            cmp      ax, 1
1:2C2D  1bc0              sbb      ax, ax
1:2C2F  250400            and      ax, 4
1:2C32  8946fc            mov      word ptr [bp - 4], ax
1:2C35  b80200            mov      ax, 2
1:2C38  50                push     ax
1:2C39  9a472c0000        lcall    0, 0x2c47  ; @1:INT:ord_7(1:42FE)
1:2C3E  5b                pop      bx
1:2C3F  48                dec      ax
1:2C40  7518              jne      0x2c5a
1:2C42  b80200            mov      ax, 2
1:2C45  50                push     ax
1:2C46  9ab12c0000        lcall    0, 0x2cb1  ; @1:INT:ord_7(1:42FE)
1:2C4B  5b                pop      bx
1:2C4C  3d0100            cmp      ax, 1
1:2C4F  1bc0              sbb      ax, ax
1:2C51  250200            and      ax, 2
1:2C54  050300            add      ax, 3
1:2C57  8946fc            mov      word ptr [bp - 4], ax
1:2C5A  2bc0              sub      ax, ax
1:2C5C  50                push     ax
1:2C5D  b80100            mov      ax, 1
1:2C60  50                push     ax
1:2C61  ff760c            push     word ptr [bp + 0xc]
1:2C64  ff760a            push     word ptr [bp + 0xa]
1:2C67  ff7608            push     word ptr [bp + 8]
1:2C6A  ff7606            push     word ptr [bp + 6]
1:2C6D  ff76fc            push     word ptr [bp - 4]
1:2C70  0e                push     cs
1:2C71  e8e601            call     0x2e5a
1:2C74  4d                dec      bp
1:2C75  4d                dec      bp
1:2C76  8be5              mov      sp, bp
1:2C78  1f                pop      ds
1:2C79  5d                pop      bp
1:2C7A  4d                dec      bp
1:2C7B  cb                retf     

; ===== EXPORT:ord_35(#35) =====
1:2C7C  1e                push     ds
1:2C7D  58                pop      ax
1:2C7E  90                nop      
1:2C7F  45                inc      bp
1:2C80  55                push     bp
1:2C81  8bec              mov      bp, sp
1:2C83  1e                push     ds
1:2C84  8ed8              mov      ds, ax
1:2C86  83ec18            sub      sp, 0x18
1:2C89  57                push     di
1:2C8A  56                push     si
1:2C8B  b8a606            mov      ax, 0x6a6
1:2C8E  8b5606            mov      dx, word ptr [bp + 6]
1:2C91  8bf8              mov      di, ax
1:2C93  8bf2              mov      si, dx
1:2C95  1e                push     ds
1:2C96  07                pop      es
1:2C97  a5                movsw    word ptr es:[di], word ptr [si]
1:2C98  a5                movsw    word ptr es:[di], word ptr [si]
1:2C99  a5                movsw    word ptr es:[di], word ptr [si]
1:2C9A  a5                movsw    word ptr es:[di], word ptr [si]
1:2C9B  50                push     ax
1:2C9C  9a5c280000        lcall    0, 0x285c  ; @1:INT:ord_37(1:4281)
1:2CA1  5b                pop      bx
1:2CA2  a1aa06            mov      ax, word ptr [0x6aa]
1:2CA5  2b06a606          sub      ax, word ptr [0x6a6]
1:2CA9  8946fc            mov      word ptr [bp - 4], ax
1:2CAC  b80200            mov      ax, 2
1:2CAF  50                push     ax
1:2CB0  9ac92c0000        lcall    0, 0x2cc9  ; @1:INT:ord_7(1:42FE)
1:2CB5  5b                pop      bx
1:2CB6  3d0100            cmp      ax, 1
1:2CB9  1bc0              sbb      ax, ax
1:2CBB  250200            and      ax, 2
1:2CBE  050300            add      ax, 3
1:2CC1  8946f2            mov      word ptr [bp - 0xe], ax
1:2CC4  b80300            mov      ax, 3
1:2CC7  50                push     ax
1:2CC8  9ad62c0000        lcall    0, 0x2cd6  ; @1:INT:ord_7(1:42FE)
1:2CCD  5b                pop      bx
1:2CCE  48                dec      ax
1:2CCF  7515              jne      0x2ce6
1:2CD1  b80200            mov      ax, 2
1:2CD4  50                push     ax
1:2CD5  9aeb2c0000        lcall    0, 0x2ceb  ; @1:INT:ord_7(1:42FE)
1:2CDA  5b                pop      bx
1:2CDB  3d0100            cmp      ax, 1
1:2CDE  1bc0              sbb      ax, ax
1:2CE0  250400            and      ax, 4
1:2CE3  8946f2            mov      word ptr [bp - 0xe], ax
1:2CE6  b80200            mov      ax, 2
1:2CE9  50                push     ax
1:2CEA  9a0a2d0000        lcall    0, 0x2d0a  ; @1:INT:ord_7(1:42FE)
1:2CEF  5b                pop      bx
1:2CF0  40                inc      ax
1:2CF1  8946ea            mov      word ptr [bp - 0x16], ax
1:2CF4  c746e80000        mov      word ptr [bp - 0x18], 0
1:2CF9  eb6f              jmp      0x2d6a
1:2CFB  c746ee0300        mov      word ptr [bp - 0x12], 3
1:2D00  c746f00000        mov      word ptr [bp - 0x10], 0
1:2D05  b80800            mov      ax, 8
1:2D08  50                push     ax
1:2D09  9a172d0000        lcall    0, 0x2d17  ; @1:INT:ord_7(1:42FE)
1:2D0E  5b                pop      bx
1:2D0F  48                dec      ax
1:2D10  7513              jne      0x2d25
1:2D12  b81000            mov      ax, 0x10
1:2D15  50                push     ax
1:2D16  9a322d0000        lcall    0, 0x2d32  ; @1:INT:ord_7(1:42FE)
1:2D1B  5b                pop      bx
1:2D1C  0c03              or       al, 3
1:2D1E  99                cdq      
1:2D1F  8946ee            mov      word ptr [bp - 0x12], ax
1:2D22  8956f0            mov      word ptr [bp - 0x10], dx
1:2D25  8b46fc            mov      ax, word ptr [bp - 4]
1:2D28  99                cdq      
1:2D29  2bc2              sub      ax, dx
1:2D2B  d1f8              sar      ax, 1
1:2D2D  8946f6            mov      word ptr [bp - 0xa], ax
1:2D30  50                push     ax
1:2D31  9a402d0000        lcall    0, 0x2d40  ; @1:INT:ord_7(1:42FE)
1:2D36  5b                pop      bx
1:2D37  40                inc      ax
1:2D38  40                inc      ax
1:2D39  8946fa            mov      word ptr [bp - 6], ax
1:2D3C  ff76f6            push     word ptr [bp - 0xa]
1:2D3F  9a21270000        lcall    0, 0x2721  ; @1:INT:ord_7(1:42FE)
1:2D44  5b                pop      bx
1:2D45  40                inc      ax
1:2D46  40                inc      ax
1:2D47  8946f8            mov      word ptr [bp - 8], ax
1:2D4A  2bc0              sub      ax, ax
1:2D4C  50                push     ax
1:2D4D  b80100            mov      ax, 1
1:2D50  50                push     ax
1:2D51  ff76f0            push     word ptr [bp - 0x10]
1:2D54  ff76ee            push     word ptr [bp - 0x12]
1:2D57  ff76fa            push     word ptr [bp - 6]
1:2D5A  ff76f8            push     word ptr [bp - 8]
1:2D5D  ff76f2            push     word ptr [bp - 0xe]
1:2D60  0e                push     cs
1:2D61  e8f600            call     0x2e5a
1:2D64  83c40e            add      sp, 0xe
1:2D67  ff46e8            inc      word ptr [bp - 0x18]
1:2D6A  8b46e8            mov      ax, word ptr [bp - 0x18]
1:2D6D  3946ea            cmp      word ptr [bp - 0x16], ax
1:2D70  7d89              jge      0x2cfb
1:2D72  5e                pop      si
1:2D73  5f                pop      di
1:2D74  4d                dec      bp
1:2D75  4d                dec      bp
1:2D76  8be5              mov      sp, bp
1:2D78  1f                pop      ds
1:2D79  5d                pop      bp
1:2D7A  4d                dec      bp
1:2D7B  cb                retf     
1:2D7C  1e                push     ds
1:2D7D  58                pop      ax
1:2D7E  90                nop      
1:2D7F  45                inc      bp
1:2D80  55                push     bp
1:2D81  8bec              mov      bp, sp
1:2D83  1e                push     ds
1:2D84  8ed8              mov      ds, ax
1:2D86  83ec06            sub      sp, 6
1:2D89  8b4606            mov      ax, word ptr [bp + 6]
1:2D8C  e9aa00            jmp      0x2e39
1:2D8F  ff369208          push     word ptr [0x892]
1:2D93  1e                push     ds
1:2D94  ff7608            push     word ptr [bp + 8]
1:2D97  ff760a            push     word ptr [bp + 0xa]
1:2D9A  9aba2d0000        lcall    0, 0x2dba  ; @1:USER.FrameRect
1:2D9F  e9b000            jmp      0x2e52
1:2DA2  ff7608            push     word ptr [bp + 8]
1:2DA5  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_39(1:37C6)
1:2DAA  5b                pop      bx
1:2DAB  e9a400            jmp      0x2e52
1:2DAE  ff369208          push     word ptr [0x892]
1:2DB2  1e                push     ds
1:2DB3  ff7608            push     word ptr [bp + 8]
1:2DB6  ff760a            push     word ptr [bp + 0xa]
1:2DB9  9affff0000        lcall    0, 0xffff  ; @1:USER.FrameRect
1:2DBE  ff7608            push     word ptr [bp + 8]
1:2DC1  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_42(1:35F3)
1:2DC6  ebe2              jmp      0x2daa
1:2DC8  ff369208          push     word ptr [0x892]
1:2DCC  1e                push     ds
1:2DCD  ff7608            push     word ptr [bp + 8]
1:2DD0  ff760a            push     word ptr [bp + 0xa]
1:2DD3  9a41170000        lcall    0, 0x1741  ; @1:USER.FillRect
1:2DD8  eb78              jmp      0x2e52
1:2DDA  ff7608            push     word ptr [bp + 8]
1:2DDD  0e                push     cs
1:2DDE  e8c2f8            call     0x26a3
1:2DE1  ebc7              jmp      0x2daa
1:2DE3  ff369208          push     word ptr [0x892]
1:2DE7  b80800            mov      ax, 8
1:2DEA  50                push     ax
1:2DEB  9a862e0000        lcall    0, 0x2e86  ; @1:GDI.GetStockObject
1:2DF0  50                push     ax
1:2DF1  9a012e0000        lcall    0, 0x2e01  ; @1:GDI.SelectObject
1:2DF6  8946fc            mov      word ptr [bp - 4], ax
1:2DF9  ff369208          push     word ptr [0x892]
1:2DFD  ff760a            push     word ptr [bp + 0xa]
1:2E00  9a272e0000        lcall    0, 0x2e27  ; @1:GDI.SelectObject
1:2E05  8946fa            mov      word ptr [bp - 6], ax
1:2E08  ff369208          push     word ptr [0x892]
1:2E0C  8b5e08            mov      bx, word ptr [bp + 8]
1:2E0F  ff37              push     word ptr [bx]
1:2E11  ff7702            push     word ptr [bx + 2]
1:2E14  ff7704            push     word ptr [bx + 4]
1:2E17  ff7706            push     word ptr [bx + 6]
1:2E1A  9a8d260000        lcall    0, 0x268d  ; @1:GDI.Ellipse
1:2E1F  ff369208          push     word ptr [0x892]
1:2E23  ff76fc            push     word ptr [bp - 4]
1:2E26  9a332e0000        lcall    0, 0x2e33  ; @1:GDI.SelectObject
1:2E2B  ff369208          push     word ptr [0x892]
1:2E2F  ff76fa            push     word ptr [bp - 6]
1:2E32  9abf260000        lcall    0, 0x26bf  ; @1:GDI.SelectObject
1:2E37  eb19              jmp      0x2e52
1:2E39  3d0500            cmp      ax, 5
1:2E3C  7714              ja       0x2e52
1:2E3E  d1e0              shl      ax, 1
1:2E40  93                xchg     bx, ax
1:2E41  2effa7462e        jmp      word ptr cs:[bx + 0x2e46]