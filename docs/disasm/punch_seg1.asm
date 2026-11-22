File: raw\unpacked\MODULES\PUNCH.AD
Module: 'PUNCH' ('Graphics Module Library')
CS:IP=1:1084  SS:SP=0:0000  AutoDS=2  Heap=1024  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (4): KERNEL, GDI, USER, SOUND
Segments (2):
  SEG  1: CODE off=0x00600 len=0x10B6 min=0x10B6 flags=0x0D50 relocs=98
  SEG  2: DATA off=0x018A0 len=0x03B8 min=0x03B8 flags=0x0C71 relocs=0
Exports (29):
  ord   1: SEG1:067C flags=0x03 MODULE
  ord   2: SEG1:0665 flags=0x03 WEP
  ord   3: SEG1:1070 flags=0x03 ___EXPORTEDSTUB
  ord   4: SEG1:08D4 flags=0x00 
  ord   5: SEG1:0936 flags=0x00 
  ord   6: SEG1:0904 flags=0x00 
  ord   7: SEG1:052E flags=0x00 
  ord   8: SEG1:051A flags=0x00 
  ord   9: SEG1:0506 flags=0x00 
  ord  10: SEG1:0442 flags=0x00 
  ord  11: SEG1:0842 flags=0x00 
  ord  12: SEG1:0313 flags=0x00 
  ord  13: SEG1:02FF flags=0x00 
  ord  14: SEG1:0012 flags=0x00 
  ord  15: SEG1:08C0 flags=0x00 
  ord  16: SEG1:085E flags=0x00 
  ord  17: SEG1:063E flags=0x00 
  ord  18: SEG1:0996 flags=0x00 
  ord  19: SEG1:0BDA flags=0x00 
  ord  20: SEG1:0A9A flags=0x00 
  ord  21: SEG1:0D0C flags=0x00 
  ord  22: SEG1:0D34 flags=0x00 
  ord  23: SEG1:0DD6 flags=0x00 
  ord  24: SEG1:0D9A flags=0x00 
  ord  25: SEG1:0E00 flags=0x00 
  ord  26: SEG1:0D38 flags=0x00 
  ord  27: SEG1:0AB4 flags=0x00 
  ord  28: SEG1:0FA4 flags=0x00 
  ord  29: SEG1:1060 flags=0x00 
Resources (7):
  TYPE_1000        #1               off=0x01CA0 len=   112
  TYPE_1000        #2               off=0x01D10 len=    64
  TYPE_1000        #3               off=0x01D50 len=    64
  TYPE_1000        #4               off=0x01D90 len=    32
  TYPE_2000        #10              off=0x01DB0 len=    96
  TYPE_2000        #20              off=0x01E10 len=    16
  TYPE_2000        #30              off=0x01E20 len=   512

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
1:001C  83ec08            sub      sp, 8
1:001F  56                push     si
1:0020  c41eb003          les      bx, ptr [0x3b0]
1:0024  268b4708          mov      ax, word ptr es:[bx + 8]
1:0028  a39003            mov      word ptr [0x390], ax
1:002B  99                cdq      
1:002C  268b4f0a          mov      cx, word ptr es:[bx + 0xa]
1:0030  890e1000          mov      word ptr [0x10], cx
1:0034  268b4f06          mov      cx, word ptr es:[bx + 6]
1:0038  890e8c03          mov      word ptr [0x38c], cx
1:003C  c41e8803          les      bx, ptr [0x388]
1:0040  8bc8              mov      cx, ax
1:0042  268b470c          mov      ax, word ptr es:[bx + 0xc]
1:0046  8bf2              mov      si, dx
1:0048  99                cdq      
1:0049  52                push     dx
1:004A  50                push     ax
1:004B  268b470e          mov      ax, word ptr es:[bx + 0xe]
1:004F  99                cdq      
1:0050  52                push     dx
1:0051  50                push     ax
1:0052  56                push     si
1:0053  51                push     cx
1:0054  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_6(1:0904)
1:0059  52                push     dx
1:005A  50                push     ax
1:005B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_5(1:0936)
1:0060  a38e03            mov      word ptr [0x38e], ax
1:0063  ff368c03          push     word ptr [0x38c]
1:0067  0e                push     cs
1:0068  e85005            call     0x5bb
1:006B  5b                pop      bx
1:006C  833e240001        cmp      word ptr [0x24], 1
1:0071  7512              jne      0x85
1:0073  b80500            mov      ax, 5
1:0076  f72e9003          imul     word ptr [0x390]
1:007A  b90300            mov      cx, 3
1:007D  99                cdq      
1:007E  f7f9              idiv     cx
1:0080  a39003            mov      word ptr [0x390], ax
1:0083  eb17              jmp      0x9c
1:0085  833e240002        cmp      word ptr [0x24], 2
1:008A  7510              jne      0x9c
1:008C  b80500            mov      ax, 5
1:008F  f72e8e03          imul     word ptr [0x38e]
1:0093  b90300            mov      cx, 3
1:0096  99                cdq      
1:0097  f7f9              idiv     cx
1:0099  a38e03            mov      word ptr [0x38e], ax
1:009C  a19003            mov      ax, word ptr [0x390]
1:009F  051400            add      ax, 0x14
1:00A2  a38603            mov      word ptr [0x386], ax
1:00A5  a18e03            mov      ax, word ptr [0x38e]
1:00A8  051400            add      ax, 0x14
1:00AB  a38403            mov      word ptr [0x384], ax
1:00AE  9acd000000        lcall    0, 0xcd  ; @1:INT:ord_4(1:08D4)
1:00B3  c41eb003          les      bx, ptr [0x3b0]
1:00B7  268b4f02          mov      cx, word ptr es:[bx + 2]
1:00BB  2b0e8e03          sub      cx, word ptr [0x38e]
1:00BF  83c10a            add      cx, 0xa
1:00C2  99                cdq      
1:00C3  f7f9              idiv     cx
1:00C5  83c205            add      dx, 5
1:00C8  8916b403          mov      word ptr [0x3b4], dx
1:00CC  9aeb000000        lcall    0, 0xeb  ; @1:INT:ord_4(1:08D4)
1:00D1  c41eb003          les      bx, ptr [0x3b0]
1:00D5  268b4f04          mov      cx, word ptr es:[bx + 4]
1:00D9  2b0e9003          sub      cx, word ptr [0x390]
1:00DD  83c10a            add      cx, 0xa
1:00E0  99                cdq      
1:00E1  f7f9              idiv     cx
1:00E3  83c205            add      dx, 5
1:00E6  8916b603          mov      word ptr [0x3b6], dx
1:00EA  9afb000000        lcall    0, 0xfb  ; @1:INT:ord_4(1:08D4)
1:00EF  b90300            mov      cx, 3
1:00F2  99                cdq      
1:00F3  f7f9              idiv     cx
1:00F5  4a                dec      dx
1:00F6  8916a403          mov      word ptr [0x3a4], dx
1:00FA  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_4(1:08D4)
1:00FF  b90300            mov      cx, 3
1:0102  99                cdq      
1:0103  f7f9              idiv     cx
1:0105  4a                dec      dx
1:0106  8916a603          mov      word ptr [0x3a6], dx
1:010A  833ea40300        cmp      word ptr [0x3a4], 0
1:010F  750a              jne      0x11b
1:0111  0bd2              or       dx, dx
1:0113  7506              jne      0x11b
1:0115  c706a6030100      mov      word ptr [0x3a6], 1
1:011B  ff368203          push     word ptr [0x382]
1:011F  9aab010000        lcall    0, 0x1ab  ; @1:GDI.CreateCompatibleDC
1:0124  a31200            mov      word ptr [0x12], ax
1:0127  ff368203          push     word ptr [0x382]
1:012B  c41e8803          les      bx, ptr [0x388]
1:012F  268b4706          mov      ax, word ptr es:[bx + 6]
1:0133  051400            add      ax, 0x14
1:0136  50                push     ax
1:0137  268b4708          mov      ax, word ptr es:[bx + 8]
1:013B  051400            add      ax, 0x14
1:013E  50                push     ax
1:013F  9abf010000        lcall    0, 0x1bf  ; @1:GDI.CreateCompatibleBitmap
1:0144  a31400            mov      word ptr [0x14], ax
1:0147  0bc0              or       ax, ax
1:0149  7503              jne      0x14e
1:014B  e98801            jmp      0x2d6
1:014E  ff361200          push     word ptr [0x12]
1:0152  2bc0              sub      ax, ax
1:0154  50                push     ax
1:0155  50                push     ax
1:0156  c41e8803          les      bx, ptr [0x388]
1:015A  268b4f06          mov      cx, word ptr es:[bx + 6]
1:015E  83c114            add      cx, 0x14
1:0161  51                push     cx
1:0162  268b4f08          mov      cx, word ptr es:[bx + 8]
1:0166  83c114            add      cx, 0x14
1:0169  51                push     cx
1:016A  9af0020000        lcall    0, 0x2f0  ; @1:GDI.Rectangle
1:016F  ff361200          push     word ptr [0x12]
1:0173  ff361400          push     word ptr [0x14]
1:0177  9ad0010000        lcall    0, 0x1d0  ; @1:GDI.SelectObject
1:017C  ff361200          push     word ptr [0x12]
1:0180  b80a00            mov      ax, 0xa
1:0183  50                push     ax
1:0184  50                push     ax
1:0185  c41e8803          les      bx, ptr [0x388]
1:0189  26ff7706          push     word ptr es:[bx + 6]
1:018D  26ff7708          push     word ptr es:[bx + 8]
1:0191  ff368203          push     word ptr [0x382]
1:0195  2bc0              sub      ax, ax
1:0197  50                push     ax
1:0198  50                push     ax
1:0199  b82000            mov      ax, 0x20
1:019C  bacc00            mov      dx, 0xcc
1:019F  52                push     dx
1:01A0  50                push     ax
1:01A1  9a79020000        lcall    0, 0x279  ; @1:GDI.BitBlt
1:01A6  ff368203          push     word ptr [0x382]
1:01AA  9ad9010000        lcall    0, 0x1d9  ; @1:GDI.CreateCompatibleDC
1:01AF  a31600            mov      word ptr [0x16], ax
1:01B2  ff368203          push     word ptr [0x382]
1:01B6  ff368e03          push     word ptr [0x38e]
1:01BA  ff369003          push     word ptr [0x390]
1:01BE  9aed010000        lcall    0, 0x1ed  ; @1:GDI.CreateCompatibleBitmap
1:01C3  a31800            mov      word ptr [0x18], ax
1:01C6  0bc0              or       ax, ax
1:01C8  742e              je       0x1f8
1:01CA  ff361600          push     word ptr [0x16]
1:01CE  50                push     ax
1:01CF  9a01020000        lcall    0, 0x201  ; @1:GDI.SelectObject
1:01D4  ff368203          push     word ptr [0x382]
1:01D8  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateCompatibleDC
1:01DD  a31a00            mov      word ptr [0x1a], ax
1:01E0  ff368203          push     word ptr [0x382]
1:01E4  ff368403          push     word ptr [0x384]
1:01E8  ff368603          push     word ptr [0x386]
1:01EC  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateCompatibleBitmap
1:01F1  a31c00            mov      word ptr [0x1c], ax
1:01F4  0bc0              or       ax, ax
1:01F6  7503              jne      0x1fb
1:01F8  e9db00            jmp      0x2d6
1:01FB  ff361a00          push     word ptr [0x1a]
1:01FF  50                push     ax
1:0200  9ab0020000        lcall    0, 0x2b0  ; @1:GDI.SelectObject
1:0205  b89203            mov      ax, 0x392
1:0208  1e                push     ds
1:0209  50                push     ax
1:020A  b80a00            mov      ax, 0xa
1:020D  50                push     ax
1:020E  50                push     ax
1:020F  03068e03          add      ax, word ptr [0x38e]
1:0213  50                push     ax
1:0214  a19003            mov      ax, word ptr [0x390]
1:0217  050a00            add      ax, 0xa
1:021A  50                push     ax
1:021B  9a32020000        lcall    0, 0x232  ; @1:USER.SetRect
1:0220  b89a03            mov      ax, 0x39a
1:0223  1e                push     ds
1:0224  50                push     ax
1:0225  2bc0              sub      ax, ax
1:0227  50                push     ax
1:0228  50                push     ax
1:0229  ff368403          push     word ptr [0x384]
1:022D  ff368603          push     word ptr [0x386]
1:0231  9a9d020000        lcall    0, 0x29d  ; @1:USER.SetRect
1:0236  b89a03            mov      ax, 0x39a
1:0239  1e                push     ds
1:023A  50                push     ax
1:023B  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateRectRgnIndirect
1:0240  a31e00            mov      word ptr [0x1e], ax
1:0243  b89203            mov      ax, 0x392
1:0246  1e                push     ds
1:0247  50                push     ax
1:0248  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateEllipticRgnIndirect
1:024D  a32000            mov      word ptr [0x20], ax
1:0250  0e                push     cs
1:0251  e8ee02            call     0x542
1:0254  ff361600          push     word ptr [0x16]
1:0258  2bc0              sub      ax, ax
1:025A  50                push     ax
1:025B  50                push     ax
1:025C  ff368e03          push     word ptr [0x38e]
1:0260  ff369003          push     word ptr [0x390]
1:0264  ff361200          push     word ptr [0x12]
1:0268  ff36b403          push     word ptr [0x3b4]
1:026C  ff36b603          push     word ptr [0x3b6]
1:0270  b92000            mov      cx, 0x20
1:0273  bacc00            mov      dx, 0xcc
1:0276  52                push     dx
1:0277  51                push     cx
1:0278  9a5a030000        lcall    0, 0x35a  ; @1:GDI.BitBlt
1:027D  b8a803            mov      ax, 0x3a8
1:0280  1e                push     ds
1:0281  50                push     ax
1:0282  ff36b403          push     word ptr [0x3b4]
1:0286  ff36b603          push     word ptr [0x3b6]
1:028A  8b0e8e03          mov      cx, word ptr [0x38e]
1:028E  030eb403          add      cx, word ptr [0x3b4]
1:0292  51                push     cx
1:0293  8b0e9003          mov      cx, word ptr [0x390]
1:0297  030eb603          add      cx, word ptr [0x3b6]
1:029B  51                push     cx
1:029C  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:02A1  ff361200          push     word ptr [0x12]
1:02A5  b80400            mov      ax, 4
1:02A8  50                push     ax
1:02A9  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:02AE  50                push     ax
1:02AF  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectObject
1:02B4  833e220000        cmp      word ptr [0x22], 0
1:02B9  7420              je       0x2db
1:02BB  ff361200          push     word ptr [0x12]
1:02BF  ff36a803          push     word ptr [0x3a8]
1:02C3  ff36aa03          push     word ptr [0x3aa]
1:02C7  ff36ac03          push     word ptr [0x3ac]
1:02CB  ff36ae03          push     word ptr [0x3ae]
1:02CF  9affff0000        lcall    0, 0xffff  ; @1:GDI.Ellipse
1:02D4  eb1e              jmp      0x2f4
1:02D6  b80100            mov      ax, 1
1:02D9  eb1b              jmp      0x2f6
1:02DB  ff361200          push     word ptr [0x12]
1:02DF  ff36a803          push     word ptr [0x3a8]
1:02E3  ff36aa03          push     word ptr [0x3aa]
1:02E7  ff36ac03          push     word ptr [0x3ac]
1:02EB  ff36ae03          push     word ptr [0x3ae]
1:02EF  9affff0000        lcall    0, 0xffff  ; @1:GDI.Rectangle
1:02F4  2bc0              sub      ax, ax
1:02F6  5e                pop      si
1:02F7  4d                dec      bp
1:02F8  4d                dec      bp
1:02F9  8be5              mov      sp, bp
1:02FB  1f                pop      ds
1:02FC  5d                pop      bp
1:02FD  4d                dec      bp
1:02FE  cb                retf     

; ===== EXPORT:ord_13(#13) =====
1:02FF  1e                push     ds
1:0300  58                pop      ax
1:0301  90                nop      
1:0302  45                inc      bp
1:0303  55                push     bp
1:0304  8bec              mov      bp, sp
1:0306  1e                push     ds
1:0307  8ed8              mov      ds, ax
1:0309  2bc0              sub      ax, ax
1:030B  4d                dec      bp
1:030C  4d                dec      bp
1:030D  8be5              mov      sp, bp
1:030F  1f                pop      ds
1:0310  5d                pop      bp
1:0311  4d                dec      bp
1:0312  cb                retf     

; ===== EXPORT:ord_12(#12) =====
1:0313  1e                push     ds
1:0314  58                pop      ax
1:0315  90                nop      
1:0316  45                inc      bp
1:0317  55                push     bp
1:0318  8bec              mov      bp, sp
1:031A  1e                push     ds
1:031B  8ed8              mov      ds, ax
1:031D  83ec04            sub      sp, 4
1:0320  ff361a00          push     word ptr [0x1a]
1:0324  ff361e00          push     word ptr [0x1e]
1:0328  9a6e030000        lcall    0, 0x36e  ; @1:GDI.SelectClipRgn
1:032D  ff361a00          push     word ptr [0x1a]
1:0331  2bc0              sub      ax, ax
1:0333  50                push     ax
1:0334  50                push     ax
1:0335  ff368403          push     word ptr [0x384]
1:0339  ff368603          push     word ptr [0x386]
1:033D  ff361200          push     word ptr [0x12]
1:0341  8b0eb403          mov      cx, word ptr [0x3b4]
1:0345  83e90a            sub      cx, 0xa
1:0348  51                push     cx
1:0349  8b0eb603          mov      cx, word ptr [0x3b6]
1:034D  83e90a            sub      cx, 0xa
1:0350  51                push     cx
1:0351  b92000            mov      cx, 0x20
1:0354  bacc00            mov      dx, 0xcc
1:0357  52                push     dx
1:0358  51                push     cx
1:0359  9a94030000        lcall    0, 0x394  ; @1:GDI.BitBlt
1:035E  833e220000        cmp      word ptr [0x22], 0
1:0363  740d              je       0x372
1:0365  ff361a00          push     word ptr [0x1a]
1:0369  ff362000          push     word ptr [0x20]
1:036D  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectClipRgn
1:0372  ff361a00          push     word ptr [0x1a]
1:0376  b80a00            mov      ax, 0xa
1:0379  50                push     ax
1:037A  50                push     ax
1:037B  ff368e03          push     word ptr [0x38e]
1:037F  ff369003          push     word ptr [0x390]
1:0383  ff361600          push     word ptr [0x16]
1:0387  2bc0              sub      ax, ax
1:0389  50                push     ax
1:038A  50                push     ax
1:038B  b98600            mov      cx, 0x86
1:038E  baee00            mov      dx, 0xee
1:0391  52                push     dx
1:0392  51                push     cx
1:0393  9affff0000        lcall    0, 0xffff  ; @1:GDI.BitBlt
1:0398  ff368203          push     word ptr [0x382]
1:039C  a1b403            mov      ax, word ptr [0x3b4]
1:039F  2d1400            sub      ax, 0x14
1:03A2  50                push     ax
1:03A3  a1b603            mov      ax, word ptr [0x3b6]
1:03A6  2d1400            sub      ax, 0x14
1:03A9  50                push     ax
1:03AA  ff368403          push     word ptr [0x384]
1:03AE  ff368603          push     word ptr [0x386]
1:03B2  ff361a00          push     word ptr [0x1a]
1:03B6  2bc0              sub      ax, ax
1:03B8  50                push     ax
1:03B9  50                push     ax
1:03BA  b92000            mov      cx, 0x20
1:03BD  bacc00            mov      dx, 0xcc
1:03C0  52                push     dx
1:03C1  51                push     cx
1:03C2  9aa2010000        lcall    0, 0x1a2  ; @1:GDI.BitBlt
1:03C7  c746fc0000        mov      word ptr [bp - 4], 0
1:03CC  a11000            mov      ax, word ptr [0x10]
1:03CF  f72ea403          imul     word ptr [0x3a4]
1:03D3  0106b403          add      word ptr [0x3b4], ax
1:03D7  c41eb003          les      bx, ptr [0x3b0]
1:03DB  268b4702          mov      ax, word ptr es:[bx + 2]
1:03DF  051400            add      ax, 0x14
1:03E2  3b06b403          cmp      ax, word ptr [0x3b4]
1:03E6  7d05              jge      0x3ed
1:03E8  c746fc0100        mov      word ptr [bp - 4], 1
1:03ED  a18403            mov      ax, word ptr [0x384]
1:03F0  f7d8              neg      ax
1:03F2  3b06b403          cmp      ax, word ptr [0x3b4]
1:03F6  7e05              jle      0x3fd
1:03F8  c746fc0100        mov      word ptr [bp - 4], 1
1:03FD  a11000            mov      ax, word ptr [0x10]
1:0400  f72ea603          imul     word ptr [0x3a6]
1:0404  0106b603          add      word ptr [0x3b6], ax
1:0408  268b4704          mov      ax, word ptr es:[bx + 4]
1:040C  051400            add      ax, 0x14
1:040F  3b06b603          cmp      ax, word ptr [0x3b6]
1:0413  7d05              jge      0x41a
1:0415  c746fc0100        mov      word ptr [bp - 4], 1
1:041A  a18603            mov      ax, word ptr [0x386]
1:041D  f7d8              neg      ax
1:041F  3b06b603          cmp      ax, word ptr [0x3b6]
1:0423  7e05              jle      0x42a
1:0425  c746fc0100        mov      word ptr [bp - 4], 1
1:042A  837efc00          cmp      word ptr [bp - 4], 0
1:042E  7408              je       0x438
1:0430  0e                push     cs
1:0431  e80e00            call     0x442
1:0434  0e                push     cs
1:0435  e8dafb            call     0x12
1:0438  2bc0              sub      ax, ax
1:043A  4d                dec      bp
1:043B  4d                dec      bp
1:043C  8be5              mov      sp, bp
1:043E  1f                pop      ds
1:043F  5d                pop      bp
1:0440  4d                dec      bp
1:0441  cb                retf     

; ===== EXPORT:ord_10(#10) =====
1:0442  1e                push     ds
1:0443  58                pop      ax
1:0444  90                nop      
1:0445  45                inc      bp
1:0446  55                push     bp
1:0447  8bec              mov      bp, sp
1:0449  1e                push     ds
1:044A  8ed8              mov      ds, ax
1:044C  833e120000        cmp      word ptr [0x12], 0
1:0451  740f              je       0x462
1:0453  ff361200          push     word ptr [0x12]
1:0457  9a84040000        lcall    0, 0x484  ; @1:GDI.DeleteDC
1:045C  c70612000000      mov      word ptr [0x12], 0
1:0462  833e140000        cmp      word ptr [0x14], 0
1:0467  740f              je       0x478
1:0469  ff361400          push     word ptr [0x14]
1:046D  9a9a040000        lcall    0, 0x49a  ; @1:GDI.DeleteObject
1:0472  c70614000000      mov      word ptr [0x14], 0
1:0478  833e1a0000        cmp      word ptr [0x1a], 0
1:047D  740f              je       0x48e
1:047F  ff361a00          push     word ptr [0x1a]
1:0483  9ab0040000        lcall    0, 0x4b0  ; @1:GDI.DeleteDC
1:0488  c7061a000000      mov      word ptr [0x1a], 0
1:048E  833e1c0000        cmp      word ptr [0x1c], 0
1:0493  740f              je       0x4a4
1:0495  ff361c00          push     word ptr [0x1c]
1:0499  9ac6040000        lcall    0, 0x4c6  ; @1:GDI.DeleteObject
1:049E  c7061c000000      mov      word ptr [0x1c], 0
1:04A4  833e160000        cmp      word ptr [0x16], 0
1:04A9  740f              je       0x4ba
1:04AB  ff361600          push     word ptr [0x16]
1:04AF  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteDC
1:04B4  c70616000000      mov      word ptr [0x16], 0
1:04BA  833e180000        cmp      word ptr [0x18], 0
1:04BF  740f              je       0x4d0
1:04C1  ff361800          push     word ptr [0x18]
1:04C5  9adc040000        lcall    0, 0x4dc  ; @1:GDI.DeleteObject
1:04CA  c70618000000      mov      word ptr [0x18], 0
1:04D0  833e1e0000        cmp      word ptr [0x1e], 0
1:04D5  740f              je       0x4e6
1:04D7  ff361e00          push     word ptr [0x1e]
1:04DB  9af2040000        lcall    0, 0x4f2  ; @1:GDI.DeleteObject
1:04E0  c7061e000000      mov      word ptr [0x1e], 0
1:04E6  833e200000        cmp      word ptr [0x20], 0
1:04EB  740f              je       0x4fc
1:04ED  ff362000          push     word ptr [0x20]
1:04F1  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteObject
1:04F6  c70620000000      mov      word ptr [0x20], 0
1:04FC  2bc0              sub      ax, ax
1:04FE  4d                dec      bp
1:04FF  4d                dec      bp
1:0500  8be5              mov      sp, bp
1:0502  1f                pop      ds
1:0503  5d                pop      bp
1:0504  4d                dec      bp
1:0505  cb                retf     

; ===== EXPORT:ord_9(#9) =====
1:0506  1e                push     ds
1:0507  58                pop      ax
1:0508  90                nop      
1:0509  45                inc      bp
1:050A  55                push     bp
1:050B  8bec              mov      bp, sp
1:050D  1e                push     ds
1:050E  8ed8              mov      ds, ax
1:0510  2bc0              sub      ax, ax
1:0512  4d                dec      bp
1:0513  4d                dec      bp
1:0514  8be5              mov      sp, bp
1:0516  1f                pop      ds
1:0517  5d                pop      bp
1:0518  4d                dec      bp
1:0519  cb                retf     

; ===== EXPORT:ord_8(#8) =====
1:051A  1e                push     ds
1:051B  58                pop      ax
1:051C  90                nop      
1:051D  45                inc      bp
1:051E  55                push     bp
1:051F  8bec              mov      bp, sp
1:0521  1e                push     ds
1:0522  8ed8              mov      ds, ax
1:0524  2bc0              sub      ax, ax
1:0526  4d                dec      bp
1:0527  4d                dec      bp
1:0528  8be5              mov      sp, bp
1:052A  1f                pop      ds
1:052B  5d                pop      bp
1:052C  4d                dec      bp
1:052D  cb                retf     

; ===== EXPORT:ord_7(#7) =====
1:052E  1e                push     ds
1:052F  58                pop      ax
1:0530  90                nop      
1:0531  45                inc      bp
1:0532  55                push     bp
1:0533  8bec              mov      bp, sp
1:0535  1e                push     ds
1:0536  8ed8              mov      ds, ax
1:0538  2bc0              sub      ax, ax
1:053A  4d                dec      bp
1:053B  4d                dec      bp
1:053C  8be5              mov      sp, bp
1:053E  1f                pop      ds
1:053F  5d                pop      bp
1:0540  4d                dec      bp
1:0541  cb                retf     
1:0542  1e                push     ds
1:0543  58                pop      ax
1:0544  90                nop      
1:0545  45                inc      bp
1:0546  55                push     bp
1:0547  8bec              mov      bp, sp
1:0549  1e                push     ds
1:054A  8ed8              mov      ds, ax
1:054C  83ec04            sub      sp, 4
1:054F  c41eb003          les      bx, ptr [0x3b0]
1:0553  26837f0c00        cmp      word ptr es:[bx + 0xc], 0
1:0558  7459              je       0x5b3
1:055A  9affff0000        lcall    0, 0xffff  ; @1:SOUND.OpenSound
1:055F  b80100            mov      ax, 1
1:0562  50                push     ax
1:0563  b8e803            mov      ax, 0x3e8
1:0566  50                push     ax
1:0567  9affff0000        lcall    0, 0xffff  ; @1:SOUND.SetVoiceQueueSize
1:056C  b80600            mov      ax, 6
1:056F  50                push     ax
1:0570  b81200            mov      ax, 0x12
1:0573  50                push     ax
1:0574  9affff0000        lcall    0, 0xffff  ; @1:SOUND.SetSoundNoise
1:0579  c746fc0700        mov      word ptr [bp - 4], 7
1:057E  b80100            mov      ax, 1
1:0581  50                push     ax
1:0582  ff76fc            push     word ptr [bp - 4]
1:0585  b8e803            mov      ax, 0x3e8
1:0588  50                push     ax
1:0589  b80a00            mov      ax, 0xa
1:058C  50                push     ax
1:058D  9affff0000        lcall    0, 0xffff  ; @1:SOUND.SetVoiceNote
1:0592  8346fc02          add      word ptr [bp - 4], 2
1:0596  837efc1e          cmp      word ptr [bp - 4], 0x1e
1:059A  7ce2              jl       0x57e
1:059C  9affff0000        lcall    0, 0xffff  ; @1:SOUND.StartSound
1:05A1  2bc0              sub      ax, ax
1:05A3  50                push     ax
1:05A4  9affff0000        lcall    0, 0xffff  ; @1:SOUND.WaitSoundState
1:05A9  9affff0000        lcall    0, 0xffff  ; @1:SOUND.StopSound
1:05AE  9affff0000        lcall    0, 0xffff  ; @1:SOUND.CloseSound
1:05B3  4d                dec      bp
1:05B4  4d                dec      bp
1:05B5  8be5              mov      sp, bp
1:05B7  1f                pop      ds
1:05B8  5d                pop      bp
1:05B9  4d                dec      bp
1:05BA  cb                retf     
1:05BB  1e                push     ds
1:05BC  58                pop      ax
1:05BD  90                nop      
1:05BE  45                inc      bp
1:05BF  55                push     bp
1:05C0  8bec              mov      bp, sp
1:05C2  1e                push     ds
1:05C3  8ed8              mov      ds, ax
1:05C5  a18c03            mov      ax, word ptr [0x38c]
1:05C8  eb5c              jmp      0x626
1:05CA  c70622000100      mov      word ptr [0x22], 1
1:05D0  c70624000000      mov      word ptr [0x24], 0
1:05D6  eb5e              jmp      0x636
1:05D8  c70622000100      mov      word ptr [0x22], 1
1:05DE  9a07060000        lcall    0, 0x607  ; @1:INT:ord_4(1:08D4)
1:05E3  b90200            mov      cx, 2
1:05E6  99                cdq      
1:05E7  f7f9              idiv     cx
1:05E9  83fa01            cmp      dx, 1
1:05EC  1bc0              sbb      ax, ax
1:05EE  250100            and      ax, 1
1:05F1  40                inc      ax
1:05F2  a32400            mov      word ptr [0x24], ax
1:05F5  eb3f              jmp      0x636
1:05F7  2bc0              sub      ax, ax
1:05F9  a32200            mov      word ptr [0x22], ax
1:05FC  ebf4              jmp      0x5f2
1:05FE  c70622000000      mov      word ptr [0x22], 0
1:0604  ebd8              jmp      0x5de
1:0606  9a16060000        lcall    0, 0x616  ; @1:INT:ord_4(1:08D4)
1:060B  b90200            mov      cx, 2
1:060E  99                cdq      
1:060F  f7f9              idiv     cx
1:0611  89162200          mov      word ptr [0x22], dx
1:0615  9aaf000000        lcall    0, 0xaf  ; @1:INT:ord_4(1:08D4)
1:061A  b90300            mov      cx, 3
1:061D  99                cdq      
1:061E  f7f9              idiv     cx
1:0620  89162400          mov      word ptr [0x24], dx
1:0624  eb10              jmp      0x636
1:0626  0bc0              or       ax, ax
1:0628  74a0              je       0x5ca
1:062A  48                dec      ax
1:062B  74ab              je       0x5d8
1:062D  48                dec      ax
1:062E  74c7              je       0x5f7
1:0630  48                dec      ax
1:0631  74cb              je       0x5fe
1:0633  48                dec      ax
1:0634  74d0              je       0x606
1:0636  4d                dec      bp
1:0637  4d                dec      bp
1:0638  8be5              mov      sp, bp
1:063A  1f                pop      ds
1:063B  5d                pop      bp
1:063C  4d                dec      bp
1:063D  cb                retf     

; ===== EXPORT:ord_17(#17) =====
1:063E  1e                push     ds
1:063F  58                pop      ax
1:0640  90                nop      
1:0641  45                inc      bp
1:0642  55                push     bp
1:0643  8bec              mov      bp, sp
1:0645  1e                push     ds
1:0646  8ed8              mov      ds, ax
1:0648  837e0a00          cmp      word ptr [bp + 0xa], 0
1:064C  7504              jne      0x652
1:064E  2bc0              sub      ax, ax
1:0650  eb09              jmp      0x65b
1:0652  8b460e            mov      ax, word ptr [bp + 0xe]
1:0655  a3a203            mov      word ptr [0x3a2], ax
1:0658  b80100            mov      ax, 1
1:065B  4d                dec      bp
1:065C  4d                dec      bp
1:065D  8be5              mov      sp, bp
1:065F  1f                pop      ds
1:0660  5d                pop      bp
1:0661  4d                dec      bp
1:0662  ca0a00            retf     0xa

; ===== EXPORT:WEP(#2) =====
1:0665  1e                push     ds
1:0666  58                pop      ax
1:0667  90                nop      
1:0668  45                inc      bp
1:0669  55                push     bp
1:066A  8bec              mov      bp, sp
1:066C  1e                push     ds
1:066D  8ed8              mov      ds, ax
1:066F  b80100            mov      ax, 1
1:0672  4d                dec      bp
1:0673  4d                dec      bp
1:0674  8be5              mov      sp, bp
1:0676  1f                pop      ds
1:0677  5d                pop      bp
1:0678  4d                dec      bp
1:0679  ca0200            retf     2

; ===== EXPORT:MODULE(#1) =====
1:067C  1e                push     ds
1:067D  58                pop      ax
1:067E  90                nop      
1:067F  45                inc      bp
1:0680  55                push     bp
1:0681  8bec              mov      bp, sp
1:0683  1e                push     ds
1:0684  8ed8              mov      ds, ax
1:0686  83ec0a            sub      sp, 0xa
1:0689  56                push     si
1:068A  8b4608            mov      ax, word ptr [bp + 8]
1:068D  a38203            mov      word ptr [0x382], ax
1:0690  8b4606            mov      ax, word ptr [bp + 6]
1:0693  a38003            mov      word ptr [0x380], ax
1:0696  50                push     ax
1:0697  9ab7060000        lcall    0, 0x6b7  ; @1:KERNEL.GlobalLock
1:069C  a38803            mov      word ptr [0x388], ax
1:069F  89168a03          mov      word ptr [0x38a], dx
1:06A3  8bc2              mov      ax, dx
1:06A5  0b068803          or       ax, word ptr [0x388]
1:06A9  7503              jne      0x6ae
1:06AB  e96a01            jmp      0x818
1:06AE  c41e8803          les      bx, ptr [0x388]
1:06B2  26ff7720          push     word ptr es:[bx + 0x20]
1:06B6  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalLock
1:06BB  a3b003            mov      word ptr [0x3b0], ax
1:06BE  8916b203          mov      word ptr [0x3b2], dx
1:06C2  8bc2              mov      ax, dx
1:06C4  0b06b003          or       ax, word ptr [0x3b0]
1:06C8  7503              jne      0x6cd
1:06CA  e94201            jmp      0x80f
1:06CD  8b460a            mov      ax, word ptr [bp + 0xa]
1:06D0  e90801            jmp      0x7db
1:06D3  c41e8803          les      bx, ptr [0x388]
1:06D7  26837f1465        cmp      word ptr es:[bx + 0x14], 0x65
1:06DC  7c0f              jl       0x6ed
1:06DE  26817f36f400      cmp      word ptr es:[bx + 0x36], 0xf4
1:06E4  7507              jne      0x6ed
1:06E6  26837f3878        cmp      word ptr es:[bx + 0x38], 0x78
1:06EB  740e              je       0x6fb
1:06ED  c70626000000      mov      word ptr [0x26], 0
1:06F3  c746fc0500        mov      word ptr [bp - 4], 5
1:06F8  e90701            jmp      0x802
1:06FB  c70626000100      mov      word ptr [0x26], 1
1:0701  e9fe00            jmp      0x802
1:0704  b84003            mov      ax, 0x340
1:0707  50                push     ax
1:0708  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_16(1:085E)
1:070D  5b                pop      bx
1:070E  ff364003          push     word ptr [0x340]
1:0712  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_15(1:08C0)
1:0717  5b                pop      bx
1:0718  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_14(1:0012)
1:071D  eb13              jmp      0x732
1:071F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_13(1:02FF)
1:0724  eb0c              jmp      0x732
1:0726  833e260000        cmp      word ptr [0x26], 0
1:072B  740b              je       0x738
1:072D  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:0313)
1:0732  8946fc            mov      word ptr [bp - 4], ax
1:0735  e9ca00            jmp      0x802
1:0738  ff368203          push     word ptr [0x382]
1:073C  b800ff            mov      ax, 0xff00
1:073F  baff00            mov      dx, 0xff
1:0742  52                push     dx
1:0743  50                push     ax
1:0744  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextColor
1:0749  ff368203          push     word ptr [0x382]
1:074D  2bc0              sub      ax, ax
1:074F  50                push     ax
1:0750  50                push     ax
1:0751  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkColor
1:0756  ff368203          push     word ptr [0x382]
1:075A  2bc0              sub      ax, ax
1:075C  50                push     ax
1:075D  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextAlign
1:0762  ff368203          push     word ptr [0x382]
1:0766  b80100            mov      ax, 1
1:0769  50                push     ax
1:076A  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkMode
1:076F  ff368203          push     word ptr [0x382]
1:0773  2bc0              sub      ax, ax
1:0775  50                push     ax
1:0776  50                push     ax
1:0777  b82800            mov      ax, 0x28
1:077A  1e                push     ds
1:077B  50                push     ax
1:077C  50                push     ax
1:077D  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:0842)
1:0782  5b                pop      bx
1:0783  50                push     ax
1:0784  9affff0000        lcall    0, 0xffff  ; @1:GDI.TextOut
1:0789  eb77              jmp      0x802
1:078B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:0442)
1:0790  eba0              jmp      0x732
1:0792  a1a203            mov      ax, word ptr [0x3a2]
1:0795  c41eb003          les      bx, ptr [0x3b0]
1:0799  26894716          mov      word ptr es:[bx + 0x16], ax
1:079D  c746f60000        mov      word ptr [bp - 0xa], 0
1:07A2  8b46f6            mov      ax, word ptr [bp - 0xa]
1:07A5  8bf0              mov      si, ax
1:07A7  d1e6              shl      si, 1
1:07A9  40                inc      ax
1:07AA  c41eb003          les      bx, ptr [0x3b0]
1:07AE  2689400e          mov      word ptr es:[bx + si + 0xe], ax
1:07B2  ff46f6            inc      word ptr [bp - 0xa]
1:07B5  837ef604          cmp      word ptr [bp - 0xa], 4
1:07B9  7ce7              jl       0x7a2
1:07BB  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:0506)
1:07C0  e96fff            jmp      0x732
1:07C3  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:051A)
1:07C8  e967ff            jmp      0x732
1:07CB  8b460a            mov      ax, word ptr [bp + 0xa]
1:07CE  2d0700            sub      ax, 7
1:07D1  50                push     ax
1:07D2  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:052E)
1:07D7  5b                pop      bx
1:07D8  e957ff            jmp      0x732
1:07DB  3d0c00            cmp      ax, 0xc
1:07DE  7722              ja       0x802
1:07E0  d1e0              shl      ax, 1
1:07E2  93                xchg     bx, ax
1:07E3  2effa7e807        jmp      word ptr cs:[bx + 0x7e8]
1:07E8  0407              add      al, 7
1:07EA  1f                pop      ds
1:07EB  07                pop      es
1:07EC  2607              pop      es
1:07EE  8b07              mov      ax, word ptr [bx]
1:07F0  0208              add      cl, byte ptr [bx + si]
1:07F2  92                xchg     dx, ax
1:07F3  07                pop      es
1:07F4  c3                ret      
1:07F5  07                pop      es
1:07F6  cb                retf     
1:07F7  07                pop      es
1:07F8  cb                retf     
1:07F9  07                pop      es
1:07FA  cb                retf     
1:07FB  07                pop      es
1:07FC  cb                retf     
1:07FD  07                pop      es
1:07FE  0208              add      cl, byte ptr [bx + si]
1:0800  d306c41e          rol      word ptr [0x1ec4], cl
1:0804  8803              mov      byte ptr [bp + di], al
1:0806  26ff7720          push     word ptr es:[bx + 0x20]
1:080A  9a14080000        lcall    0, 0x814  ; @1:KERNEL.GlobalUnlock
1:080F  ff368003          push     word ptr [0x380]
1:0813  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalUnlock
1:0818  8b46fc            mov      ax, word ptr [bp - 4]
1:081B  5e                pop      si
1:081C  4d                dec      bp
1:081D  4d                dec      bp
1:081E  8be5              mov      sp, bp
1:0820  1f                pop      ds
1:0821  5d                pop      bp
1:0822  4d                dec      bp
1:0823  ca0600            retf     6
1:0826  0000              add      byte ptr [bx + si], al
1:0828  0000              add      byte ptr [bx + si], al
1:082A  0000              add      byte ptr [bx + si], al
1:082C  0000              add      byte ptr [bx + si], al
1:082E  0000              add      byte ptr [bx + si], al
1:0830  0000              add      byte ptr [bx + si], al
1:0832  0000              add      byte ptr [bx + si], al
1:0834  0000              add      byte ptr [bx + si], al
1:0836  0000              add      byte ptr [bx + si], al
1:0838  0000              add      byte ptr [bx + si], al
1:083A  0000              add      byte ptr [bx + si], al
1:083C  0000              add      byte ptr [bx + si], al
1:083E  0000              add      byte ptr [bx + si], al
1:0840  c3                ret      
1:0841  00558b            add      byte ptr [di - 0x75], dl
1:0844  ec                in       al, dx
1:0845  8bd7              mov      dx, di
1:0847  8cd8              mov      ax, ds
1:0849  8ec0              mov      es, ax
1:084B  8b7e06            mov      di, word ptr [bp + 6]
1:084E  33c0              xor      ax, ax
1:0850  b9ffff            mov      cx, 0xffff
1:0853  f2ae              repne scasb al, byte ptr es:[di]
1:0855  f7d1              not      cx
1:0857  49                dec      cx
1:0858  91                xchg     cx, ax
1:0859  8bfa              mov      di, dx
1:085B  5d                pop      bp
1:085C  cb                retf     
1:085D  008cd890          add      byte ptr [si - 0x6f28], cl
1:0861  45                inc      bp
1:0862  55                push     bp
1:0863  8bec              mov      bp, sp
1:0865  1e                push     ds
1:0866  8ed8              mov      ds, ax
1:0868  56                push     si
1:0869  b42a              mov      ah, 0x2a
1:086B  cd21              int      0x21
1:086D  8bda              mov      bx, dx
1:086F  8bf1              mov      si, cx
1:0871  b42c              mov      ah, 0x2c
1:0873  cd21              int      0x21
1:0875  b400              mov      ah, 0
1:0877  8ac6              mov      al, dh
1:0879  50                push     ax
1:087A  8ac1              mov      al, cl
1:087C  50                push     ax
1:087D  8ac5              mov      al, ch
1:087F  50                push     ax
1:0880  50                push     ax
1:0881  b42a              mov      ah, 0x2a
1:0883  cd21              int      0x21
1:0885  3bda              cmp      bx, dx
1:0887  58                pop      ax
1:0888  7408              je       0x892
1:088A  3c17              cmp      al, 0x17
1:088C  7504              jne      0x892
1:088E  8bd3              mov      dx, bx
1:0890  8bce              mov      cx, si
1:0892  b400              mov      ah, 0
1:0894  8ac2              mov      al, dl
1:0896  50                push     ax
1:0897  8ac6              mov      al, dh
1:0899  50                push     ax
1:089A  81e9bc07          sub      cx, 0x7bc
1:089E  51                push     cx
1:089F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_18(1:0996)
1:08A4  83c40c            add      sp, 0xc
1:08A7  837e0600          cmp      word ptr [bp + 6], 0
1:08AB  7408              je       0x8b5
1:08AD  8b5e06            mov      bx, word ptr [bp + 6]
1:08B0  895702            mov      word ptr [bx + 2], dx
1:08B3  8907              mov      word ptr [bx], ax
1:08B5  5e                pop      si
1:08B6  83ed02            sub      bp, 2
1:08B9  8be5              mov      sp, bp
1:08BB  1f                pop      ds
1:08BC  5d                pop      bp
1:08BD  4d                dec      bp
1:08BE  cb                retf     
1:08BF  004555            add      byte ptr [di + 0x55], al
1:08C2  8bec              mov      bp, sp
1:08C4  8b4606            mov      ax, word ptr [bp + 6]
1:08C7  a36200            mov      word ptr [0x62], ax
1:08CA  c70664000000      mov      word ptr [0x64], 0
1:08D0  5d                pop      bp
1:08D1  4d                dec      bp
1:08D2  cb                retf     
1:08D3  90                nop      

; ===== EXPORT:ord_4(#4) =====
1:08D4  45                inc      bp
1:08D5  55                push     bp
1:08D6  8bec              mov      bp, sp
1:08D8  b8fd43            mov      ax, 0x43fd