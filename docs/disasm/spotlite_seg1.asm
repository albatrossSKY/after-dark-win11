File: raw\unpacked\MODULES\SPOTLITE.AD
Module: 'SPOTLITE' ('Graphics Module Library')
CS:IP=1:0E34  SS:SP=0:0000  AutoDS=2  Heap=1024  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (3): KERNEL, GDI, USER
Segments (2):
  SEG  1: CODE off=0x00600 len=0x0E66 min=0x0E66 flags=0x0D50 relocs=74
  SEG  2: DATA off=0x01600 len=0x03BE min=0x03BE flags=0x0C71 relocs=0
Exports (29):
  ord   1: SEG1:0432 flags=0x03 MODULE
  ord   2: SEG1:041B flags=0x03 WEP
  ord   3: SEG1:0E20 flags=0x03 ___EXPORTEDSTUB
  ord   4: SEG1:0684 flags=0x00 
  ord   5: SEG1:06E6 flags=0x00 
  ord   6: SEG1:06B4 flags=0x00 
  ord   7: SEG1:03AA flags=0x00 
  ord   8: SEG1:0396 flags=0x00 
  ord   9: SEG1:0382 flags=0x00 
  ord  10: SEG1:02F9 flags=0x00 
  ord  11: SEG1:05F2 flags=0x00 
  ord  12: SEG1:01DF flags=0x00 
  ord  13: SEG1:0199 flags=0x00 
  ord  14: SEG1:0012 flags=0x00 
  ord  15: SEG1:0670 flags=0x00 
  ord  16: SEG1:060E flags=0x00 
  ord  17: SEG1:03F4 flags=0x00 
  ord  18: SEG1:0746 flags=0x00 
  ord  19: SEG1:098A flags=0x00 
  ord  20: SEG1:084A flags=0x00 
  ord  21: SEG1:0ABC flags=0x00 
  ord  22: SEG1:0AE4 flags=0x00 
  ord  23: SEG1:0B86 flags=0x00 
  ord  24: SEG1:0B4A flags=0x00 
  ord  25: SEG1:0BB0 flags=0x00 
  ord  26: SEG1:0AE8 flags=0x00 
  ord  27: SEG1:0864 flags=0x00 
  ord  28: SEG1:0D54 flags=0x00 
  ord  29: SEG1:0E10 flags=0x00 
Resources (7):
  TYPE_1000        #1               off=0x01A00 len=    64
  TYPE_1000        #2               off=0x01A40 len=    64
  TYPE_1000        #3               off=0x01A80 len=    32
  TYPE_1000        #4               off=0x01AA0 len=    32
  TYPE_2000        #10              off=0x01AC0 len=    80
  TYPE_2000        #20              off=0x01B10 len=    16
  TYPE_2000        #30              off=0x01B20 len=   272

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

; ===== EXPORT:ord_14(#14) =====
1:0012  1e                push     ds
1:0013  58                pop      ax
1:0014  90                nop      
1:0015  45                inc      bp
1:0016  55                push     bp
1:0017  8bec              mov      bp, sp
1:0019  1e                push     ds
1:001A  8ed8              mov      ds, ax
1:001C  56                push     si
1:001D  c41eb603          les      bx, ptr [0x3b6]
1:0021  268b4706          mov      ax, word ptr es:[bx + 6]
1:0025  a39e03            mov      word ptr [0x39e], ax
1:0028  99                cdq      
1:0029  a34003            mov      word ptr [0x340], ax
1:002C  89164203          mov      word ptr [0x342], dx
1:0030  268b4f08          mov      cx, word ptr es:[bx + 8]
1:0034  890e1000          mov      word ptr [0x10], cx
1:0038  c4369803          les      si, ptr [0x398]
1:003C  8bc8              mov      cx, ax
1:003E  268b440c          mov      ax, word ptr es:[si + 0xc]
1:0042  8bda              mov      bx, dx
1:0044  99                cdq      
1:0045  52                push     dx
1:0046  50                push     ax
1:0047  268b440e          mov      ax, word ptr es:[si + 0xe]
1:004B  99                cdq      
1:004C  52                push     dx
1:004D  50                push     ax
1:004E  53                push     bx
1:004F  51                push     cx
1:0050  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_6(1:06B4)
1:0055  52                push     dx
1:0056  50                push     ax
1:0057  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_5(1:06E6)
1:005C  a39c03            mov      word ptr [0x39c], ax
1:005F  a19e03            mov      ax, word ptr [0x39e]
1:0062  051400            add      ax, 0x14
1:0065  a39603            mov      word ptr [0x396], ax
1:0068  a19c03            mov      ax, word ptr [0x39c]
1:006B  051400            add      ax, 0x14
1:006E  a39403            mov      word ptr [0x394], ax
1:0071  833e1c0000        cmp      word ptr [0x1c], 0
1:0076  7503              jne      0x7b
1:0078  e99a00            jmp      0x115
1:007B  9a98000000        lcall    0, 0x98  ; @1:INT:ord_4(1:0684)
1:0080  c41eb603          les      bx, ptr [0x3b6]
1:0084  268b4f02          mov      cx, word ptr es:[bx + 2]
1:0088  2b0e9c03          sub      cx, word ptr [0x39c]
1:008C  2b0e1000          sub      cx, word ptr [0x10]
1:0090  99                cdq      
1:0091  f7f9              idiv     cx
1:0093  8916ba03          mov      word ptr [0x3ba], dx
1:0097  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_4(1:0684)
1:009C  c41eb603          les      bx, ptr [0x3b6]
1:00A0  268b4f04          mov      cx, word ptr es:[bx + 4]
1:00A4  2b0e9c03          sub      cx, word ptr [0x39c]
1:00A8  2b0e1000          sub      cx, word ptr [0x10]
1:00AC  99                cdq      
1:00AD  f7f9              idiv     cx
1:00AF  8916bc03          mov      word ptr [0x3bc], dx
1:00B3  b80100            mov      ax, 1
1:00B6  a3a803            mov      word ptr [0x3a8], ax
1:00B9  a3aa03            mov      word ptr [0x3aa], ax
1:00BC  ff369203          push     word ptr [0x392]
1:00C0  9a1a010000        lcall    0, 0x11a  ; @1:GDI.CreateCompatibleDC
1:00C5  a31200            mov      word ptr [0x12], ax
1:00C8  ff369203          push     word ptr [0x392]
1:00CC  c41e9803          les      bx, ptr [0x398]
1:00D0  26ff7706          push     word ptr es:[bx + 6]
1:00D4  26ff7708          push     word ptr es:[bx + 8]
1:00D8  9a2e010000        lcall    0, 0x12e  ; @1:GDI.CreateCompatibleBitmap
1:00DD  a31400            mov      word ptr [0x14], ax
1:00E0  0bc0              or       ax, ax
1:00E2  7461              je       0x145
1:00E4  ff361200          push     word ptr [0x12]
1:00E8  50                push     ax
1:00E9  9a3f010000        lcall    0, 0x13f  ; @1:GDI.SelectObject
1:00EE  ff361200          push     word ptr [0x12]
1:00F2  2bc0              sub      ax, ax
1:00F4  50                push     ax
1:00F5  50                push     ax
1:00F6  c41e9803          les      bx, ptr [0x398]
1:00FA  26ff7706          push     word ptr es:[bx + 6]
1:00FE  26ff7708          push     word ptr es:[bx + 8]
1:0102  ff369203          push     word ptr [0x392]
1:0106  50                push     ax
1:0107  50                push     ax
1:0108  b82000            mov      ax, 0x20
1:010B  bacc00            mov      dx, 0xcc
1:010E  52                push     dx
1:010F  50                push     ax
1:0110  9a38020000        lcall    0, 0x238  ; @1:GDI.BitBlt
1:0115  ff369203          push     word ptr [0x392]
1:0119  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateCompatibleDC
1:011E  a31600            mov      word ptr [0x16], ax
1:0121  ff369203          push     word ptr [0x392]
1:0125  ff369403          push     word ptr [0x394]
1:0129  ff369603          push     word ptr [0x396]
1:012D  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateCompatibleBitmap
1:0132  a31800            mov      word ptr [0x18], ax
1:0135  0bc0              or       ax, ax
1:0137  740c              je       0x145
1:0139  ff361600          push     word ptr [0x16]
1:013D  50                push     ax
1:013E  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectObject
1:0143  eb05              jmp      0x14a
1:0145  b80100            mov      ax, 1
1:0148  eb46              jmp      0x190
1:014A  b8a003            mov      ax, 0x3a0
1:014D  1e                push     ds
1:014E  50                push     ax
1:014F  b80a00            mov      ax, 0xa
1:0152  50                push     ax
1:0153  50                push     ax
1:0154  03069c03          add      ax, word ptr [0x39c]
1:0158  50                push     ax
1:0159  a19e03            mov      ax, word ptr [0x39e]
1:015C  050a00            add      ax, 0xa
1:015F  50                push     ax
1:0160  9a77010000        lcall    0, 0x177  ; @1:USER.SetRect
1:0165  b8ac03            mov      ax, 0x3ac
1:0168  1e                push     ds
1:0169  50                push     ax
1:016A  2bc0              sub      ax, ax
1:016C  50                push     ax
1:016D  50                push     ax
1:016E  ff369403          push     word ptr [0x394]
1:0172  ff369603          push     word ptr [0x396]
1:0176  9ab9010000        lcall    0, 0x1b9  ; @1:USER.SetRect
1:017B  b8a003            mov      ax, 0x3a0
1:017E  1e                push     ds
1:017F  50                push     ax
1:0180  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateEllipticRgnIndirect
1:0185  a31a00            mov      word ptr [0x1a], ax
1:0188  c7061c000100      mov      word ptr [0x1c], 1
1:018E  2bc0              sub      ax, ax
1:0190  5e                pop      si
1:0191  4d                dec      bp
1:0192  4d                dec      bp
1:0193  8be5              mov      sp, bp
1:0195  1f                pop      ds
1:0196  5d                pop      bp
1:0197  4d                dec      bp
1:0198  cb                retf     

; ===== EXPORT:ord_13(#13) =====
1:0199  1e                push     ds
1:019A  58                pop      ax
1:019B  90                nop      
1:019C  45                inc      bp
1:019D  55                push     bp
1:019E  8bec              mov      bp, sp
1:01A0  1e                push     ds
1:01A1  8ed8              mov      ds, ax
1:01A3  b84603            mov      ax, 0x346
1:01A6  1e                push     ds
1:01A7  50                push     ax
1:01A8  2bc0              sub      ax, ax
1:01AA  50                push     ax
1:01AB  50                push     ax
1:01AC  c41eb603          les      bx, ptr [0x3b6]
1:01B0  26ff7702          push     word ptr es:[bx + 2]
1:01B4  26ff7704          push     word ptr es:[bx + 4]
1:01B8  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:01BD  ff369203          push     word ptr [0x392]
1:01C1  b84603            mov      ax, 0x346
1:01C4  1e                push     ds
1:01C5  50                push     ax
1:01C6  b80400            mov      ax, 4
1:01C9  50                push     ax
1:01CA  9af7010000        lcall    0, 0x1f7  ; @1:GDI.GetStockObject
1:01CF  50                push     ax
1:01D0  9afd010000        lcall    0, 0x1fd  ; @1:USER.FillRect
1:01D5  2bc0              sub      ax, ax
1:01D7  4d                dec      bp
1:01D8  4d                dec      bp
1:01D9  8be5              mov      sp, bp
1:01DB  1f                pop      ds
1:01DC  5d                pop      bp
1:01DD  4d                dec      bp
1:01DE  cb                retf     

; ===== EXPORT:ord_12(#12) =====
1:01DF  1e                push     ds
1:01E0  58                pop      ax
1:01E1  90                nop      
1:01E2  45                inc      bp
1:01E3  55                push     bp
1:01E4  8bec              mov      bp, sp
1:01E6  1e                push     ds
1:01E7  8ed8              mov      ds, ax
1:01E9  ff361600          push     word ptr [0x16]
1:01ED  b8ac03            mov      ax, 0x3ac
1:01F0  1e                push     ds
1:01F1  50                push     ax
1:01F2  b80400            mov      ax, 4
1:01F5  50                push     ax
1:01F6  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:01FB  50                push     ax
1:01FC  9affff0000        lcall    0, 0xffff  ; @1:USER.FillRect
1:0201  ff361600          push     word ptr [0x16]
1:0205  ff361a00          push     word ptr [0x1a]
1:0209  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectClipRgn
1:020E  ff361600          push     word ptr [0x16]
1:0212  b80a00            mov      ax, 0xa
1:0215  50                push     ax
1:0216  50                push     ax
1:0217  ff369c03          push     word ptr [0x39c]
1:021B  ff369e03          push     word ptr [0x39e]
1:021F  ff361200          push     word ptr [0x12]
1:0223  0306ba03          add      ax, word ptr [0x3ba]
1:0227  50                push     ax
1:0228  a1bc03            mov      ax, word ptr [0x3bc]
1:022B  050a00            add      ax, 0xa
1:022E  50                push     ax
1:022F  b82000            mov      ax, 0x20
1:0232  bacc00            mov      dx, 0xcc
1:0235  52                push     dx
1:0236  50                push     ax
1:0237  9a61020000        lcall    0, 0x261  ; @1:GDI.BitBlt
1:023C  ff369203          push     word ptr [0x392]
1:0240  ff36ba03          push     word ptr [0x3ba]
1:0244  ff36bc03          push     word ptr [0x3bc]
1:0248  ff369403          push     word ptr [0x394]
1:024C  ff369603          push     word ptr [0x396]
1:0250  ff361600          push     word ptr [0x16]
1:0254  2bc0              sub      ax, ax
1:0256  50                push     ax
1:0257  50                push     ax
1:0258  b92000            mov      cx, 0x20
1:025B  bacc00            mov      dx, 0xcc
1:025E  52                push     dx
1:025F  51                push     cx
1:0260  9affff0000        lcall    0, 0xffff  ; @1:GDI.BitBlt
1:0265  833ea80300        cmp      word ptr [0x3a8], 0
1:026A  7424              je       0x290
1:026C  a11000            mov      ax, word ptr [0x10]
1:026F  0106ba03          add      word ptr [0x3ba], ax
1:0273  c41eb603          les      bx, ptr [0x3b6]
1:0277  268b4f02          mov      cx, word ptr es:[bx + 2]
1:027B  2b0e9403          sub      cx, word ptr [0x394]
1:027F  03c1              add      ax, cx
1:0281  3b06ba03          cmp      ax, word ptr [0x3ba]
1:0285  7f23              jg       0x2aa
1:0287  a11000            mov      ax, word ptr [0x10]
1:028A  2906ba03          sub      word ptr [0x3ba], ax
1:028E  eb0e              jmp      0x29e
1:0290  a11000            mov      ax, word ptr [0x10]
1:0293  2906ba03          sub      word ptr [0x3ba], ax
1:0297  833eba0300        cmp      word ptr [0x3ba], 0
1:029C  7f0c              jg       0x2aa
1:029E  833ea80301        cmp      word ptr [0x3a8], 1
1:02A3  1bc0              sbb      ax, ax
1:02A5  f7d8              neg      ax
1:02A7  a3a803            mov      word ptr [0x3a8], ax
1:02AA  833eaa0300        cmp      word ptr [0x3aa], 0
1:02AF  7424              je       0x2d5
1:02B1  a11000            mov      ax, word ptr [0x10]
1:02B4  0106bc03          add      word ptr [0x3bc], ax
1:02B8  c41eb603          les      bx, ptr [0x3b6]
1:02BC  268b4f04          mov      cx, word ptr es:[bx + 4]
1:02C0  2b0e9603          sub      cx, word ptr [0x396]
1:02C4  03c1              add      ax, cx
1:02C6  3b06bc03          cmp      ax, word ptr [0x3bc]
1:02CA  7f23              jg       0x2ef
1:02CC  a11000            mov      ax, word ptr [0x10]
1:02CF  2906bc03          sub      word ptr [0x3bc], ax
1:02D3  eb0e              jmp      0x2e3
1:02D5  a11000            mov      ax, word ptr [0x10]
1:02D8  2906bc03          sub      word ptr [0x3bc], ax
1:02DC  833ebc0300        cmp      word ptr [0x3bc], 0
1:02E1  7f0c              jg       0x2ef
1:02E3  833eaa0301        cmp      word ptr [0x3aa], 1
1:02E8  1bc0              sbb      ax, ax
1:02EA  f7d8              neg      ax
1:02EC  a3aa03            mov      word ptr [0x3aa], ax
1:02EF  2bc0              sub      ax, ax
1:02F1  4d                dec      bp
1:02F2  4d                dec      bp
1:02F3  8be5              mov      sp, bp
1:02F5  1f                pop      ds
1:02F6  5d                pop      bp
1:02F7  4d                dec      bp
1:02F8  cb                retf     

; ===== EXPORT:ord_10(#10) =====
1:02F9  1e                push     ds
1:02FA  58                pop      ax
1:02FB  90                nop      
1:02FC  45                inc      bp
1:02FD  55                push     bp
1:02FE  8bec              mov      bp, sp
1:0300  1e                push     ds
1:0301  8ed8              mov      ds, ax
1:0303  833e1c0000        cmp      word ptr [0x1c], 0
1:0308  742c              je       0x336
1:030A  833e120000        cmp      word ptr [0x12], 0
1:030F  740f              je       0x320
1:0311  ff361200          push     word ptr [0x12]
1:0315  9a42030000        lcall    0, 0x342  ; @1:GDI.DeleteDC
1:031A  c70612000000      mov      word ptr [0x12], 0
1:0320  833e140000        cmp      word ptr [0x14], 0
1:0325  740f              je       0x336
1:0327  ff361400          push     word ptr [0x14]
1:032B  9a58030000        lcall    0, 0x358  ; @1:GDI.DeleteObject
1:0330  c70614000000      mov      word ptr [0x14], 0
1:0336  833e160000        cmp      word ptr [0x16], 0
1:033B  740f              je       0x34c
1:033D  ff361600          push     word ptr [0x16]
1:0341  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteDC
1:0346  c70616000000      mov      word ptr [0x16], 0
1:034C  833e180000        cmp      word ptr [0x18], 0
1:0351  740f              je       0x362
1:0353  ff361800          push     word ptr [0x18]
1:0357  9a6e030000        lcall    0, 0x36e  ; @1:GDI.DeleteObject
1:035C  c70618000000      mov      word ptr [0x18], 0
1:0362  833e1a0000        cmp      word ptr [0x1a], 0
1:0367  740f              je       0x378
1:0369  ff361a00          push     word ptr [0x1a]
1:036D  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteObject
1:0372  c7061a000000      mov      word ptr [0x1a], 0
1:0378  2bc0              sub      ax, ax
1:037A  4d                dec      bp
1:037B  4d                dec      bp
1:037C  8be5              mov      sp, bp
1:037E  1f                pop      ds
1:037F  5d                pop      bp
1:0380  4d                dec      bp
1:0381  cb                retf     

; ===== EXPORT:ord_9(#9) =====
1:0382  1e                push     ds
1:0383  58                pop      ax
1:0384  90                nop      
1:0385  45                inc      bp
1:0386  55                push     bp
1:0387  8bec              mov      bp, sp
1:0389  1e                push     ds
1:038A  8ed8              mov      ds, ax
1:038C  2bc0              sub      ax, ax
1:038E  4d                dec      bp
1:038F  4d                dec      bp
1:0390  8be5              mov      sp, bp
1:0392  1f                pop      ds
1:0393  5d                pop      bp
1:0394  4d                dec      bp
1:0395  cb                retf     

; ===== EXPORT:ord_8(#8) =====
1:0396  1e                push     ds
1:0397  58                pop      ax
1:0398  90                nop      
1:0399  45                inc      bp
1:039A  55                push     bp
1:039B  8bec              mov      bp, sp
1:039D  1e                push     ds
1:039E  8ed8              mov      ds, ax
1:03A0  2bc0              sub      ax, ax
1:03A2  4d                dec      bp
1:03A3  4d                dec      bp
1:03A4  8be5              mov      sp, bp
1:03A6  1f                pop      ds
1:03A7  5d                pop      bp
1:03A8  4d                dec      bp
1:03A9  cb                retf     

; ===== EXPORT:ord_7(#7) =====
1:03AA  1e                push     ds
1:03AB  58                pop      ax
1:03AC  90                nop      
1:03AD  45                inc      bp
1:03AE  55                push     bp
1:03AF  8bec              mov      bp, sp
1:03B1  1e                push     ds
1:03B2  8ed8              mov      ds, ax
1:03B4  c41e9803          les      bx, ptr [0x398]
1:03B8  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:03BD  7404              je       0x3c3
1:03BF  2bc0              sub      ax, ax
1:03C1  eb28              jmp      0x3eb
1:03C3  8b4606            mov      ax, word ptr [bp + 6]
1:03C6  0bc0              or       ax, ax
1:03C8  7405              je       0x3cf
1:03CA  48                dec      ax
1:03CB  7411              je       0x3de
1:03CD  ebf0              jmp      0x3bf
1:03CF  c7061c000000      mov      word ptr [0x1c], 0
1:03D5  0e                push     cs
1:03D6  e820ff            call     0x2f9
1:03D9  b80300            mov      ax, 3
1:03DC  eb0d              jmp      0x3eb
1:03DE  c41eb603          les      bx, ptr [0x3b6]
1:03E2  268b4708          mov      ax, word ptr es:[bx + 8]
1:03E6  a31000            mov      word ptr [0x10], ax
1:03E9  ebd4              jmp      0x3bf
1:03EB  4d                dec      bp
1:03EC  4d                dec      bp
1:03ED  8be5              mov      sp, bp
1:03EF  1f                pop      ds
1:03F0  5d                pop      bp
1:03F1  4d                dec      bp
1:03F2  cb                retf     
1:03F3  001e5890          add      byte ptr [0x9058], bl
1:03F7  45                inc      bp
1:03F8  55                push     bp
1:03F9  8bec              mov      bp, sp
1:03FB  1e                push     ds
1:03FC  8ed8              mov      ds, ax
1:03FE  837e0a00          cmp      word ptr [bp + 0xa], 0
1:0402  7504              jne      0x408
1:0404  2bc0              sub      ax, ax
1:0406  eb09              jmp      0x411
1:0408  8b460e            mov      ax, word ptr [bp + 0xe]
1:040B  a3b403            mov      word ptr [0x3b4], ax
1:040E  b80100            mov      ax, 1
1:0411  4d                dec      bp
1:0412  4d                dec      bp
1:0413  8be5              mov      sp, bp
1:0415  1f                pop      ds
1:0416  5d                pop      bp
1:0417  4d                dec      bp
1:0418  ca0a00            retf     0xa

; ===== EXPORT:WEP(#2) =====
1:041B  1e                push     ds
1:041C  58                pop      ax
1:041D  90                nop      
1:041E  45                inc      bp
1:041F  55                push     bp
1:0420  8bec              mov      bp, sp
1:0422  1e                push     ds
1:0423  8ed8              mov      ds, ax
1:0425  b80100            mov      ax, 1
1:0428  4d                dec      bp
1:0429  4d                dec      bp
1:042A  8be5              mov      sp, bp
1:042C  1f                pop      ds
1:042D  5d                pop      bp
1:042E  4d                dec      bp
1:042F  ca0200            retf     2

; ===== EXPORT:MODULE(#1) =====
1:0432  1e                push     ds
1:0433  58                pop      ax
1:0434  90                nop      
1:0435  45                inc      bp
1:0436  55                push     bp
1:0437  8bec              mov      bp, sp
1:0439  1e                push     ds
1:043A  8ed8              mov      ds, ax
1:043C  83ec0a            sub      sp, 0xa
1:043F  56                push     si
1:0440  8b4608            mov      ax, word ptr [bp + 8]
1:0443  a39203            mov      word ptr [0x392], ax
1:0446  8b4606            mov      ax, word ptr [bp + 6]
1:0449  a39003            mov      word ptr [0x390], ax
1:044C  50                push     ax
1:044D  9a6d040000        lcall    0, 0x46d  ; @1:KERNEL.GlobalLock
1:0452  a39803            mov      word ptr [0x398], ax
1:0455  89169a03          mov      word ptr [0x39a], dx
1:0459  8bc2              mov      ax, dx
1:045B  0b069803          or       ax, word ptr [0x398]
1:045F  7503              jne      0x464
1:0461  e96a01            jmp      0x5ce
1:0464  c41e9803          les      bx, ptr [0x398]
1:0468  26ff7720          push     word ptr es:[bx + 0x20]
1:046C  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalLock
1:0471  a3b603            mov      word ptr [0x3b6], ax
1:0474  8916b803          mov      word ptr [0x3b8], dx
1:0478  8bc2              mov      ax, dx
1:047A  0b06b603          or       ax, word ptr [0x3b6]
1:047E  7503              jne      0x483
1:0480  e94201            jmp      0x5c5
1:0483  8b460a            mov      ax, word ptr [bp + 0xa]
1:0486  e90801            jmp      0x591
1:0489  c41e9803          les      bx, ptr [0x398]
1:048D  26837f1465        cmp      word ptr es:[bx + 0x14], 0x65
1:0492  7c0f              jl       0x4a3
1:0494  26817f36f400      cmp      word ptr es:[bx + 0x36], 0xf4
1:049A  7507              jne      0x4a3
1:049C  26837f3878        cmp      word ptr es:[bx + 0x38], 0x78
1:04A1  740e              je       0x4b1
1:04A3  c7061e000000      mov      word ptr [0x1e], 0
1:04A9  c746fc0500        mov      word ptr [bp - 4], 5
1:04AE  e90701            jmp      0x5b8
1:04B1  c7061e000100      mov      word ptr [0x1e], 1
1:04B7  e9fe00            jmp      0x5b8
1:04BA  b85203            mov      ax, 0x352
1:04BD  50                push     ax
1:04BE  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_16(1:060E)
1:04C3  5b                pop      bx
1:04C4  ff365203          push     word ptr [0x352]
1:04C8  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_15(1:0670)
1:04CD  5b                pop      bx
1:04CE  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_14(1:0012)
1:04D3  eb13              jmp      0x4e8
1:04D5  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_13(1:0199)
1:04DA  eb0c              jmp      0x4e8
1:04DC  833e1e0000        cmp      word ptr [0x1e], 0
1:04E1  740b              je       0x4ee
1:04E3  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:01DF)
1:04E8  8946fc            mov      word ptr [bp - 4], ax
1:04EB  e9ca00            jmp      0x5b8
1:04EE  ff369203          push     word ptr [0x392]
1:04F2  b800ff            mov      ax, 0xff00
1:04F5  baff00            mov      dx, 0xff
1:04F8  52                push     dx
1:04F9  50                push     ax
1:04FA  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextColor
1:04FF  ff369203          push     word ptr [0x392]
1:0503  2bc0              sub      ax, ax
1:0505  50                push     ax
1:0506  50                push     ax
1:0507  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkColor
1:050C  ff369203          push     word ptr [0x392]
1:0510  2bc0              sub      ax, ax
1:0512  50                push     ax
1:0513  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextAlign
1:0518  ff369203          push     word ptr [0x392]
1:051C  b80100            mov      ax, 1
1:051F  50                push     ax
1:0520  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkMode
1:0525  ff369203          push     word ptr [0x392]
1:0529  2bc0              sub      ax, ax
1:052B  50                push     ax
1:052C  50                push     ax
1:052D  b82000            mov      ax, 0x20
1:0530  1e                push     ds
1:0531  50                push     ax
1:0532  50                push     ax
1:0533  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:05F2)
1:0538  5b                pop      bx
1:0539  50                push     ax
1:053A  9affff0000        lcall    0, 0xffff  ; @1:GDI.TextOut
1:053F  eb77              jmp      0x5b8
1:0541  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:02F9)
1:0546  eba0              jmp      0x4e8
1:0548  a1b403            mov      ax, word ptr [0x3b4]
1:054B  c41eb603          les      bx, ptr [0x3b6]
1:054F  26894716          mov      word ptr es:[bx + 0x16], ax
1:0553  c746f60000        mov      word ptr [bp - 0xa], 0
1:0558  8b46f6            mov      ax, word ptr [bp - 0xa]
1:055B  8bf0              mov      si, ax
1:055D  d1e6              shl      si, 1
1:055F  40                inc      ax
1:0560  c41eb603          les      bx, ptr [0x3b6]
1:0564  2689400e          mov      word ptr es:[bx + si + 0xe], ax
1:0568  ff46f6            inc      word ptr [bp - 0xa]
1:056B  837ef604          cmp      word ptr [bp - 0xa], 4
1:056F  7ce7              jl       0x558
1:0571  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:0382)
1:0576  e96fff            jmp      0x4e8
1:0579  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:0396)
1:057E  e967ff            jmp      0x4e8
1:0581  8b460a            mov      ax, word ptr [bp + 0xa]
1:0584  2d0700            sub      ax, 7
1:0587  50                push     ax
1:0588  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:03AA)
1:058D  5b                pop      bx
1:058E  e957ff            jmp      0x4e8
1:0591  3d0c00            cmp      ax, 0xc
1:0594  7722              ja       0x5b8
1:0596  d1e0              shl      ax, 1
1:0598  93                xchg     bx, ax
1:0599  2effa79e05        jmp      word ptr cs:[bx + 0x59e]
1:059E  ba04d5            mov      dx, 0xd504
1:05A1  04dc              add      al, 0xdc
1:05A3  0441              add      al, 0x41
1:05A5  05b805            add      ax, 0x5b8
1:05A8  48                dec      ax
1:05A9  057905            add      ax, 0x579
1:05AC  81058105          add      word ptr [di], 0x581
1:05B0  81058105          add      word ptr [di], 0x581
1:05B4  b80589            mov      ax, 0x8905
1:05B7  04c4              add      al, 0xc4
1:05B9  1e                push     ds
1:05BA  98                cwde     
1:05BB  0326ff77          add      sp, word ptr [0x77ff]
1:05BF  209aca05          and      byte ptr [bp + si + 0x5ca], bl  ; @2:KERNEL.GlobalUnlock
1:05C3  0000              add      byte ptr [bx + si], al
1:05C5  ff369003          push     word ptr [0x390]
1:05C9  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalUnlock
1:05CE  8b46fc            mov      ax, word ptr [bp - 4]
1:05D1  5e                pop      si
1:05D2  4d                dec      bp
1:05D3  4d                dec      bp
1:05D4  8be5              mov      sp, bp
1:05D6  1f                pop      ds
1:05D7  5d                pop      bp
1:05D8  4d                dec      bp
1:05D9  ca0600            retf     6
1:05DC  0000              add      byte ptr [bx + si], al
1:05DE  0000              add      byte ptr [bx + si], al
1:05E0  0000              add      byte ptr [bx + si], al
1:05E2  0000              add      byte ptr [bx + si], al
1:05E4  0000              add      byte ptr [bx + si], al
1:05E6  0000              add      byte ptr [bx + si], al
1:05E8  0000              add      byte ptr [bx + si], al
1:05EA  0000              add      byte ptr [bx + si], al
1:05EC  0000              add      byte ptr [bx + si], al
1:05EE  0000              add      byte ptr [bx + si], al
1:05F0  c3                ret      
1:05F1  00558b            add      byte ptr [di - 0x75], dl
1:05F4  ec                in       al, dx
1:05F5  8bd7              mov      dx, di
1:05F7  8cd8              mov      ax, ds
1:05F9  8ec0              mov      es, ax
1:05FB  8b7e06            mov      di, word ptr [bp + 6]
1:05FE  33c0              xor      ax, ax
1:0600  b9ffff            mov      cx, 0xffff
1:0603  f2ae              repne scasb al, byte ptr es:[di]
1:0605  f7d1              not      cx
1:0607  49                dec      cx
1:0608  91                xchg     cx, ax
1:0609  8bfa              mov      di, dx
1:060B  5d                pop      bp
1:060C  cb                retf     
1:060D  008cd890          add      byte ptr [si - 0x6f28], cl
1:0611  45                inc      bp
1:0612  55                push     bp
1:0613  8bec              mov      bp, sp
1:0615  1e                push     ds
1:0616  8ed8              mov      ds, ax
1:0618  56                push     si
1:0619  b42a              mov      ah, 0x2a
1:061B  cd21              int      0x21
1:061D  8bda              mov      bx, dx
1:061F  8bf1              mov      si, cx
1:0621  b42c              mov      ah, 0x2c
1:0623  cd21              int      0x21
1:0625  b400              mov      ah, 0
1:0627  8ac6              mov      al, dh
1:0629  50                push     ax
1:062A  8ac1              mov      al, cl
1:062C  50                push     ax
1:062D  8ac5              mov      al, ch
1:062F  50                push     ax
1:0630  50                push     ax
1:0631  b42a              mov      ah, 0x2a
1:0633  cd21              int      0x21
1:0635  3bda              cmp      bx, dx
1:0637  58                pop      ax
1:0638  7408              je       0x642
1:063A  3c17              cmp      al, 0x17
1:063C  7504              jne      0x642
1:063E  8bd3              mov      dx, bx
1:0640  8bce              mov      cx, si
1:0642  b400              mov      ah, 0
1:0644  8ac2              mov      al, dl
1:0646  50                push     ax
1:0647  8ac6              mov      al, dh
1:0649  50                push     ax
1:064A  81e9bc07          sub      cx, 0x7bc
1:064E  51                push     cx
1:064F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_18(1:0746)
1:0654  83c40c            add      sp, 0xc
1:0657  837e0600          cmp      word ptr [bp + 6], 0
1:065B  7408              je       0x665
1:065D  8b5e06            mov      bx, word ptr [bp + 6]
1:0660  895702            mov      word ptr [bx + 2], dx
1:0663  8907              mov      word ptr [bx], ax
1:0665  5e                pop      si
1:0666  83ed02            sub      bp, 2
1:0669  8be5              mov      sp, bp
1:066B  1f                pop      ds
1:066C  5d                pop      bp
1:066D  4d                dec      bp
1:066E  cb                retf     
1:066F  004555            add      byte ptr [di + 0x55], al
1:0672  8bec              mov      bp, sp
1:0674  8b4606            mov      ax, word ptr [bp + 6]
1:0677  a36200            mov      word ptr [0x62], ax
1:067A  c70664000000      mov      word ptr [0x64], 0
1:0680  5d                pop      bp
1:0681  4d                dec      bp
1:0682  cb                retf     
1:0683  90                nop      

; ===== EXPORT:ord_4(#4) =====
1:0684  45                inc      bp
1:0685  55                push     bp
1:0686  8bec              mov      bp, sp
1:0688  b8fd43            mov      ax, 0x43fd
1:068B  ba0300            mov      dx, 3
1:068E  52                push     dx
1:068F  50                push     ax