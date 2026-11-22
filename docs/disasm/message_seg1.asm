File: raw\unpacked\MODULES\MESSAGE.AD
Module: 'MESSAGE' ('Messages December 30, 1990 modified by TDE')
CS:IP=1:259A  SS:SP=0:0000  AutoDS=2  Heap=8192  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (3): KERNEL, GDI, USER
Segments (2):
  SEG  1: CODE off=0x006A0 len=0x25CC min=0x25CC flags=0x0D50 relocs=233
  SEG  2: DATA off=0x02FA0 len=0x1274 min=0x1274 flags=0x0C71 relocs=0
Exports (37):
  ord   1: SEG1:1984 flags=0x03 MODULE
  ord   2: SEG1:196D flags=0x03 WEP
  ord   3: SEG1:17B7 flags=0x03 THEFONTS
  ord   4: SEG1:1184 flags=0x03 MESSAGEPROC
  ord   5: SEG1:0748 flags=0x03 THEFACE
  ord   6: SEG1:254C flags=0x03 ___EXPORTEDSTUB
  ord   7: SEG1:1CD4 flags=0x00 
  ord   8: SEG1:1CA2 flags=0x00 
  ord   9: SEG1:1D86 flags=0x00 
  ord  10: SEG1:1C62 flags=0x00 
  ord  11: SEG1:1CF4 flags=0x00 
  ord  12: SEG1:1B42 flags=0x00 
  ord  13: SEG1:1B6A flags=0x00 
  ord  14: SEG1:1CF0 flags=0x00 
  ord  15: SEG1:1878 flags=0x00 
  ord  16: SEG1:0734 flags=0x00 
  ord  17: SEG1:0720 flags=0x00 
  ord  18: SEG1:06FC flags=0x00 
  ord  19: SEG1:0660 flags=0x00 
  ord  20: SEG1:03B6 flags=0x00 
  ord  21: SEG1:0130 flags=0x00 
  ord  22: SEG1:1D72 flags=0x00 
  ord  23: SEG1:1D10 flags=0x00 
  ord  24: SEG1:1946 flags=0x00 
  ord  25: SEG1:1DB6 flags=0x00 
  ord  26: SEG1:215E flags=0x00 
  ord  27: SEG1:22F8 flags=0x00 
  ord  28: SEG1:21B8 flags=0x00 
  ord  29: SEG1:2430 flags=0x00 
  ord  30: SEG1:2440 flags=0x00 
  ord  31: SEG1:2468 flags=0x00 
  ord  32: SEG1:250A flags=0x00 
  ord  33: SEG1:24CE flags=0x00 
  ord  34: SEG1:2534 flags=0x00 
  ord  35: SEG1:246C flags=0x00 
  ord  36: SEG1:21D2 flags=0x00 
  ord  37: SEG1:2560 flags=0x00 
Resources (9):
  RT_DIALOG        #1               off=0x04260 len=   400
  TYPE_1000        #1               off=0x043F0 len=   144
  TYPE_1000        #2               off=0x04480 len=   144
  TYPE_1000        #3               off=0x04510 len=    32
  TYPE_1000        #4               off=0x04530 len=    32
  TYPE_2000        #10              off=0x04550 len=    64
  TYPE_2000        #20              off=0x04590 len=    16
  TYPE_2000        #30              off=0x045A0 len=   576
  TYPE_15          #1               off=0x047E0 len=    32

1:0000  1e                push     ds
1:0001  58                pop      ax
1:0002  90                nop      
1:0003  45                inc      bp
1:0004  55                push     bp
1:0005  8bec              mov      bp, sp
1:0007  1e                push     ds
1:0008  8ed8              mov      ds, ax
1:000A  c70688010000      mov      word ptr [0x188], 0
1:0010  ff7606            push     word ptr [bp + 6]
1:0013  b82a09            mov      ax, 0x92a
1:0016  50                push     ax
1:0017  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:1CA2)
1:001C  5b                pop      bx
1:001D  5b                pop      bx
1:001E  c70662050000      mov      word ptr [0x562], 0
1:0024  8b1e6205          mov      bx, word ptr [0x562]
1:0028  80bf2a090a        cmp      byte ptr [bx + 0x92a], 0xa
1:002D  7407              je       0x36
1:002F  80bf2a090d        cmp      byte ptr [bx + 0x92a], 0xd
1:0034  7509              jne      0x3f
1:0036  c6872a0920        mov      byte ptr [bx + 0x92a], 0x20
1:003B  ff068801          inc      word ptr [0x188]
1:003F  ff066205          inc      word ptr [0x562]
1:0043  813e6205c800      cmp      word ptr [0x562], 0xc8
1:0049  7cd9              jl       0x24
1:004B  4d                dec      bp
1:004C  4d                dec      bp
1:004D  8be5              mov      sp, bp
1:004F  1f                pop      ds
1:0050  5d                pop      bp
1:0051  4d                dec      bp
1:0052  cb                retf     
1:0053  1e                push     ds
1:0054  58                pop      ax
1:0055  90                nop      
1:0056  45                inc      bp
1:0057  55                push     bp
1:0058  8bec              mov      bp, sp
1:005A  1e                push     ds
1:005B  8ed8              mov      ds, ax
1:005D  833eb20000        cmp      word ptr [0xb2], 0
1:0062  7404              je       0x68
1:0064  ff068801          inc      word ptr [0x188]
1:0068  b80700            mov      ax, 7
1:006B  a31609            mov      word ptr [0x916], ax
1:006E  a31409            mov      word ptr [0x914], ax
1:0071  b81400            mov      ax, 0x14
1:0074  f72eaa11          imul     word ptr [0x11aa]
1:0078  3b067012          cmp      ax, word ptr [0x1270]
1:007C  7d03              jge      0x81
1:007E  a17012            mov      ax, word ptr [0x1270]
1:0081  8b0eaa11          mov      cx, word ptr [0x11aa]
1:0085  030eac11          add      cx, word ptr [0x11ac]
1:0089  030e2009          add      cx, word ptr [0x920]
1:008D  890e6805          mov      word ptr [0x568], cx
1:0091  83c107            add      cx, 7
1:0094  3bc8              cmp      cx, ax
1:0096  7e02              jle      0x9a
1:0098  8bc8              mov      cx, ax
1:009A  890e1809          mov      word ptr [0x918], cx
1:009E  a1aa11            mov      ax, word ptr [0x11aa]
1:00A1  d1e0              shl      ax, 1
1:00A3  2bc8              sub      cx, ax
1:00A5  83e907            sub      cx, 7
1:00A8  890e6a05          mov      word ptr [0x56a], cx
1:00AC  a16805            mov      ax, word ptr [0x568]
1:00AF  99                cdq      
1:00B0  f7f9              idiv     cx
1:00B2  03068801          add      ax, word ptr [0x188]
1:00B6  40                inc      ax
1:00B7  f72e2409          imul     word ptr [0x924]
1:00BB  03062009          add      ax, word ptr [0x920]
1:00BF  050e00            add      ax, 0xe
1:00C2  a31a09            mov      word ptr [0x91a], ax
1:00C5  4d                dec      bp
1:00C6  4d                dec      bp
1:00C7  8be5              mov      sp, bp
1:00C9  1f                pop      ds
1:00CA  5d                pop      bp
1:00CB  4d                dec      bp
1:00CC  cb                retf     
1:00CD  1e                push     ds
1:00CE  58                pop      ax
1:00CF  90                nop      
1:00D0  45                inc      bp
1:00D1  55                push     bp
1:00D2  8bec              mov      bp, sp
1:00D4  1e                push     ds
1:00D5  8ed8              mov      ds, ax
1:00D7  ff36de11          push     word ptr [0x11de]
1:00DB  9affff0000        lcall    0, 0xffff  ; @1:USER.IsWindow
1:00E0  0bc0              or       ax, ax
1:00E2  7442              je       0x126
1:00E4  ff36de11          push     word ptr [0x11de]
1:00E8  b87000            mov      ax, 0x70
1:00EB  50                push     ax
1:00EC  9affff0000        lcall    0, 0xffff  ; @1:USER.GetDlgItem
1:00F1  50                push     ax
1:00F2  b8c000            mov      ax, 0xc0
1:00F5  1e                push     ds
1:00F6  50                push     ax
1:00F7  b8c800            mov      ax, 0xc8
1:00FA  50                push     ax
1:00FB  9affff0000        lcall    0, 0xffff  ; @1:USER.GetWindowText
1:0100  0e                push     cs
1:0101  e8220b            call     0xc26
1:0104  ff36de11          push     word ptr [0x11de]
1:0108  b81101            mov      ax, 0x111
1:010B  50                push     ax
1:010C  b87200            mov      ax, 0x72
1:010F  50                push     ax
1:0110  2bc0              sub      ax, ax
1:0112  50                push     ax
1:0113  50                push     ax
1:0114  9affff0000        lcall    0, 0xffff  ; @1:USER.PostMessage
1:0119  ff36de11          push     word ptr [0x11de]
1:011D  b80100            mov      ax, 1
1:0120  50                push     ax
1:0121  9affff0000        lcall    0, 0xffff  ; @1:USER.EndDialog
1:0126  2bc0              sub      ax, ax
1:0128  4d                dec      bp
1:0129  4d                dec      bp
1:012A  8be5              mov      sp, bp
1:012C  1f                pop      ds
1:012D  5d                pop      bp
1:012E  4d                dec      bp
1:012F  cb                retf     

; ===== EXPORT:ord_21(#21) =====
1:0130  1e                push     ds
1:0131  58                pop      ax
1:0132  90                nop      
1:0133  45                inc      bp
1:0134  55                push     bp
1:0135  8bec              mov      bp, sp
1:0137  1e                push     ds
1:0138  8ed8              mov      ds, ax
1:013A  83ec0e            sub      sp, 0xe
1:013D  2bc0              sub      ax, ax
1:013F  a36e12            mov      word ptr [0x126e], ax
1:0142  a36c12            mov      word ptr [0x126c], ax
1:0145  c41e6812          les      bx, ptr [0x1268]
1:0149  268b4702          mov      ax, word ptr es:[bx + 2]
1:014D  99                cdq      
1:014E  2bc2              sub      ax, dx
1:0150  d1f8              sar      ax, 1
1:0152  a37012            mov      word ptr [0x1270], ax
1:0155  268b4704          mov      ax, word ptr es:[bx + 4]
1:0159  99                cdq      
1:015A  2bc2              sub      ax, dx
1:015C  d1f8              sar      ax, 1
1:015E  a37212            mov      word ptr [0x1272], ax
1:0161  2bc0              sub      ax, ax
1:0163  50                push     ax
1:0164  50                push     ax
1:0165  0e                push     cs
1:0166  e80009            call     0xa69
1:0169  5b                pop      bx
1:016A  5b                pop      bx
1:016B  b8c000            mov      ax, 0xc0
1:016E  50                push     ax
1:016F  9aa6010000        lcall    0, 0x1a6  ; @1:INT:ord_7(1:1CD4)
1:0174  5b                pop      bx
1:0175  0bc0              or       ax, ax
1:0177  751c              jne      0x195
1:0179  c41e2609          les      bx, ptr [0x926]
1:017D  26ff7724          push     word ptr es:[bx + 0x24]
1:0181  26ff7722          push     word ptr es:[bx + 0x22]
1:0185  b88c01            mov      ax, 0x18c
1:0188  1e                push     ds
1:0189  50                push     ax
1:018A  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.lstrcpy
1:018F  b80700            mov      ax, 7
1:0192  e91902            jmp      0x3ae
1:0195  ff361e09          push     word ptr [0x91e]
1:0199  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateCompatibleDC
1:019E  8946f6            mov      word ptr [bp - 0xa], ax
1:01A1  b8c000            mov      ax, 0xc0
1:01A4  50                push     ax
1:01A5  9a43030000        lcall    0, 0x343  ; @1:INT:ord_7(1:1CD4)
1:01AA  5b                pop      bx
1:01AB  8946fc            mov      word ptr [bp - 4], ax
1:01AE  ff76f6            push     word ptr [bp - 0xa]
1:01B1  ff36b800          push     word ptr [0xb8]
1:01B5  ff36b200          push     word ptr [0xb2]
1:01B9  ff36b400          push     word ptr [0xb4]
1:01BD  b8b211            mov      ax, 0x11b2
1:01C0  50                push     ax
1:01C1  2bc0              sub      ax, ax
1:01C3  50                push     ax
1:01C4  0e                push     cs
1:01C5  e8b206            call     0x87a
1:01C8  83c40a            add      sp, 0xa
1:01CB  50                push     ax
1:01CC  9a7e020000        lcall    0, 0x27e  ; @1:GDI.SelectObject
1:01D1  8946f8            mov      word ptr [bp - 8], ax
1:01D4  ff76f6            push     word ptr [bp - 0xa]
1:01D7  2bc0              sub      ax, ax
1:01D9  50                push     ax
1:01DA  ff36bc00          push     word ptr [0xbc]
1:01DE  0e                push     cs
1:01DF  e81a02            call     0x3fc
1:01E2  5b                pop      bx
1:01E3  5b                pop      bx
1:01E4  52                push     dx
1:01E5  50                push     ax
1:01E6  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextColor
1:01EB  ff76f6            push     word ptr [bp - 0xa]
1:01EE  2bc0              sub      ax, ax
1:01F0  50                push     ax
1:01F1  50                push     ax
1:01F2  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkColor
1:01F7  c41e6812          les      bx, ptr [0x1268]
1:01FB  268b4708          mov      ax, word ptr es:[bx + 8]
1:01FF  b90f00            mov      cx, 0xf
1:0202  99                cdq      
1:0203  f7f9              idiv     cx
1:0205  40                inc      ax
1:0206  a32009            mov      word ptr [0x920], ax
1:0209  ff76f6            push     word ptr [bp - 0xa]
1:020C  b8c000            mov      ax, 0xc0
1:020F  1e                push     ds
1:0210  50                push     ax
1:0211  ff76fc            push     word ptr [bp - 4]
1:0214  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetTextExtent
1:0219  a3f209            mov      word ptr [0x9f2], ax
1:021C  8916f409          mov      word ptr [0x9f4], dx
1:0220  a3ac11            mov      word ptr [0x11ac], ax
1:0223  8bca              mov      cx, dx
1:0225  890e2409          mov      word ptr [0x924], cx
1:0229  99                cdq      
1:022A  f77efc            idiv     word ptr [bp - 4]
1:022D  a3aa11            mov      word ptr [0x11aa], ax
1:0230  c41e6812          les      bx, ptr [0x1268]
1:0234  26837f0602        cmp      word ptr es:[bx + 6], 2
1:0239  7403              je       0x23e
1:023B  e98900            jmp      0x2c7
1:023E  b8c000            mov      ax, 0xc0
1:0241  50                push     ax
1:0242  0e                push     cs
1:0243  e8bafd            call     0
1:0246  5b                pop      bx
1:0247  ff361e09          push     word ptr [0x91e]
1:024B  c41e6812          les      bx, ptr [0x1268]
1:024F  268b4708          mov      ax, word ptr es:[bx + 8]
1:0253  b90a00            mov      cx, 0xa
1:0256  99                cdq      
1:0257  f7f9              idiv     cx
1:0259  0306aa11          add      ax, word ptr [0x11aa]
1:025D  0306ac11          add      ax, word ptr [0x11ac]
1:0261  40                inc      ax
1:0262  50                push     ax
1:0263  ff362409          push     word ptr [0x924]
1:0267  9ae1020000        lcall    0, 0x2e1  ; @1:GDI.CreateCompatibleBitmap
1:026C  a32209            mov      word ptr [0x922], ax
1:026F  0bc0              or       ax, ax
1:0271  7506              jne      0x279
1:0273  b80100            mov      ax, 1
1:0276  e93501            jmp      0x3ae
1:0279  ff76f6            push     word ptr [bp - 0xa]
1:027C  50                push     ax
1:027D  9af1020000        lcall    0, 0x2f1  ; @1:GDI.SelectObject
1:0282  ff76f6            push     word ptr [bp - 0xa]
1:0285  2bc0              sub      ax, ax
1:0287  50                push     ax
1:0288  50                push     ax
1:0289  c41e6812          les      bx, ptr [0x1268]
1:028D  268b4708          mov      ax, word ptr es:[bx + 8]
1:0291  b90a00            mov      cx, 0xa
1:0294  99                cdq      
1:0295  f7f9              idiv     cx
1:0297  0306aa11          add      ax, word ptr [0x11aa]
1:029B  0306ac11          add      ax, word ptr [0x11ac]
1:029F  40                inc      ax
1:02A0  50                push     ax
1:02A1  ff362409          push     word ptr [0x924]
1:02A5  b84200            mov      ax, 0x42
1:02A8  99                cdq      
1:02A9  52                push     dx
1:02AA  50                push     ax
1:02AB  9a0b030000        lcall    0, 0x30b  ; @1:GDI.PatBlt
1:02B0  ff76f6            push     word ptr [bp - 0xa]
1:02B3  2bc0              sub      ax, ax
1:02B5  50                push     ax
1:02B6  50                push     ax
1:02B7  b82a09            mov      ax, 0x92a
1:02BA  1e                push     ds
1:02BB  50                push     ax
1:02BC  ff76fc            push     word ptr [bp - 4]
1:02BF  9affff0000        lcall    0, 0xffff  ; @1:GDI.TextOut
1:02C4  e99700            jmp      0x35e
1:02C7  b8c000            mov      ax, 0xc0
1:02CA  50                push     ax
1:02CB  0e                push     cs
1:02CC  e831fd            call     0
1:02CF  5b                pop      bx
1:02D0  0e                push     cs
1:02D1  e87ffd            call     0x53
1:02D4  ff361e09          push     word ptr [0x91e]
1:02D8  ff361809          push     word ptr [0x918]
1:02DC  ff361a09          push     word ptr [0x91a]
1:02E0  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateCompatibleBitmap
1:02E5  a32209            mov      word ptr [0x922], ax
1:02E8  0bc0              or       ax, ax
1:02EA  7487              je       0x273
1:02EC  ff76f6            push     word ptr [bp - 0xa]
1:02EF  50                push     ax
1:02F0  9a65030000        lcall    0, 0x365  ; @1:GDI.SelectObject
1:02F5  ff76f6            push     word ptr [bp - 0xa]
1:02F8  2bc0              sub      ax, ax
1:02FA  50                push     ax
1:02FB  50                push     ax
1:02FC  ff361809          push     word ptr [0x918]
1:0300  ff361a09          push     word ptr [0x91a]
1:0304  b84200            mov      ax, 0x42
1:0307  99                cdq      
1:0308  52                push     dx
1:0309  50                push     ax
1:030A  9affff0000        lcall    0, 0xffff  ; @1:GDI.PatBlt
1:030F  a1ba00            mov      ax, word ptr [0xba]
1:0312  0bc0              or       ax, ax
1:0314  7418              je       0x32e
1:0316  48                dec      ax
1:0317  7405              je       0x31e
1:0319  48                dec      ax
1:031A  740a              je       0x326
1:031C  eb10              jmp      0x32e
1:031E  c7066c050108      mov      word ptr [0x56c], 0x801
1:0324  eb0e              jmp      0x334
1:0326  c7066c050208      mov      word ptr [0x56c], 0x802
1:032C  eb06              jmp      0x334
1:032E  c7066c050008      mov      word ptr [0x56c], 0x800
1:0334  832e180907        sub      word ptr [0x918], 7
1:0339  ff76f6            push     word ptr [bp - 0xa]
1:033C  b8c000            mov      ax, 0xc0
1:033F  1e                push     ds
1:0340  50                push     ax
1:0341  50                push     ax
1:0342  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:1CD4)
1:0347  5b                pop      bx
1:0348  50                push     ax
1:0349  b81409            mov      ax, 0x914
1:034C  1e                push     ds
1:034D  50                push     ax
1:034E  a16c05            mov      ax, word ptr [0x56c]
1:0351  0c10              or       al, 0x10
1:0353  50                push     ax
1:0354  9affff0000        lcall    0, 0xffff  ; @1:USER.DrawText
1:0359  8306180907        add      word ptr [0x918], 7
1:035E  ff76f6            push     word ptr [bp - 0xa]
1:0361  ff76f8            push     word ptr [bp - 8]
1:0364  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectObject
1:0369  50                push     ax
1:036A  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteObject
1:036F  837ef600          cmp      word ptr [bp - 0xa], 0
1:0373  7408              je       0x37d
1:0375  ff76f6            push     word ptr [bp - 0xa]
1:0378  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteDC
1:037D  c7061c090000      mov      word ptr [0x91c], 0
1:0383  9affff0000        lcall    0, 0xffff  ; @1:USER.GetCurrentTime
1:0388  a3d211            mov      word ptr [0x11d2], ax
1:038B  8916d411          mov      word ptr [0x11d4], dx
1:038F  c41e6812          les      bx, ptr [0x1268]
1:0393  26837f0601        cmp      word ptr es:[bx + 6], 1
1:0398  7512              jne      0x3ac
1:039A  b82800            mov      ax, 0x28
1:039D  a3da11            mov      word ptr [0x11da], ax
1:03A0  a3dc11            mov      word ptr [0x11dc], ax
1:03A3  b80100            mov      ax, 1
1:03A6  a3a811            mov      word ptr [0x11a8], ax
1:03A9  a3f609            mov      word ptr [0x9f6], ax
1:03AC  2bc0              sub      ax, ax
1:03AE  4d                dec      bp
1:03AF  4d                dec      bp
1:03B0  8be5              mov      sp, bp
1:03B2  1f                pop      ds
1:03B3  5d                pop      bp
1:03B4  4d                dec      bp
1:03B5  cb                retf     

; ===== EXPORT:ord_20(#20) =====
1:03B6  1e                push     ds
1:03B7  58                pop      ax
1:03B8  90                nop      
1:03B9  45                inc      bp
1:03BA  55                push     bp
1:03BB  8bec              mov      bp, sp
1:03BD  1e                push     ds
1:03BE  8ed8              mov      ds, ax
1:03C0  b86e05            mov      ax, 0x56e
1:03C3  1e                push     ds
1:03C4  50                push     ax
1:03C5  2bc0              sub      ax, ax
1:03C7  50                push     ax
1:03C8  50                push     ax
1:03C9  c41e6812          les      bx, ptr [0x1268]
1:03CD  26ff7702          push     word ptr es:[bx + 2]
1:03D1  26ff7704          push     word ptr es:[bx + 4]
1:03D5  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:03DA  ff361e09          push     word ptr [0x91e]
1:03DE  b86e05            mov      ax, 0x56e
1:03E1  1e                push     ds
1:03E2  50                push     ax
1:03E3  b80400            mov      ax, 4
1:03E6  50                push     ax
1:03E7  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:03EC  50                push     ax
1:03ED  9affff0000        lcall    0, 0xffff  ; @1:USER.FillRect
1:03F2  2bc0              sub      ax, ax
1:03F4  4d                dec      bp
1:03F5  4d                dec      bp
1:03F6  8be5              mov      sp, bp
1:03F8  1f                pop      ds
1:03F9  5d                pop      bp
1:03FA  4d                dec      bp
1:03FB  cb                retf     
1:03FC  1e                push     ds
1:03FD  58                pop      ax
1:03FE  90                nop      
1:03FF  45                inc      bp
1:0400  55                push     bp
1:0401  8bec              mov      bp, sp
1:0403  1e                push     ds
1:0404  8ed8              mov      ds, ax
1:0406  8b4606            mov      ax, word ptr [bp + 6]
1:0409  eb31              jmp      0x43c
1:040B  b8ff00            mov      ax, 0xff
1:040E  2bd2              sub      dx, dx
1:0410  eb45              jmp      0x457
1:0412  b800ff            mov      ax, 0xff00
1:0415  ebf7              jmp      0x40e
1:0417  2bc0              sub      ax, ax
1:0419  baff00            mov      dx, 0xff
1:041C  eb39              jmp      0x457
1:041E  b800ff            mov      ax, 0xff00
1:0421  ebf6              jmp      0x419
1:0423  b8ff00            mov      ax, 0xff
1:0426  ebf1              jmp      0x419
1:0428  b8ffff            mov      ax, 0xffff
1:042B  ebe1              jmp      0x40e
1:042D  837e0800          cmp      word ptr [bp + 8], 0
1:0431  7404              je       0x437
1:0433  2bc0              sub      ax, ax
1:0435  ebd7              jmp      0x40e
1:0437  b8ffff            mov      ax, 0xffff
1:043A  ebdd              jmp      0x419
1:043C  3d0600            cmp      ax, 6
1:043F  77f6              ja       0x437
1:0441  d1e0              shl      ax, 1
1:0443  93                xchg     bx, ax
1:0444  2effa74904        jmp      word ptr cs:[bx + 0x449]
1:0449  2d040b            sub      ax, 0xb04
1:044C  0412              add      al, 0x12
1:044E  0417              add      al, 0x17
1:0450  041e              add      al, 0x1e
1:0452  0423              add      al, 0x23
1:0454  0428              add      al, 0x28
1:0456  044d              add      al, 0x4d
1:0458  4d                dec      bp
1:0459  8be5              mov      sp, bp
1:045B  1f                pop      ds
1:045C  5d                pop      bp
1:045D  4d                dec      bp
1:045E  cb                retf     
1:045F  1e                push     ds
1:0460  58                pop      ax
1:0461  90                nop      
1:0462  45                inc      bp
1:0463  55                push     bp
1:0464  8bec              mov      bp, sp
1:0466  1e                push     ds
1:0467  8ed8              mov      ds, ax
1:0469  837e0600          cmp      word ptr [bp + 6], 0
1:046D  7c19              jl       0x488
1:046F  837e0800          cmp      word ptr [bp + 8], 0
1:0473  7c13              jl       0x488
1:0475  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:1D86)
1:047A  8b4e08            mov      cx, word ptr [bp + 8]
1:047D  2b4e06            sub      cx, word ptr [bp + 6]
1:0480  99                cdq      
1:0481  f7f9              idiv     cx
1:0483  8bc2              mov      ax, dx
1:0485  034606            add      ax, word ptr [bp + 6]
1:0488  4d                dec      bp
1:0489  4d                dec      bp
1:048A  8be5              mov      sp, bp
1:048C  1f                pop      ds
1:048D  5d                pop      bp
1:048E  4d                dec      bp
1:048F  cb                retf     
1:0490  1e                push     ds
1:0491  58                pop      ax
1:0492  90                nop      
1:0493  45                inc      bp
1:0494  55                push     bp
1:0495  8bec              mov      bp, sp
1:0497  1e                push     ds
1:0498  8ed8              mov      ds, ax
1:049A  a12009            mov      ax, word ptr [0x920]
1:049D  f72ef609          imul     word ptr [0x9f6]
1:04A1  0106da11          add      word ptr [0x11da], ax
1:04A5  a1da11            mov      ax, word ptr [0x11da]
1:04A8  03061809          add      ax, word ptr [0x918]
1:04AC  2d0700            sub      ax, 7
1:04AF  c41e6812          les      bx, ptr [0x1268]
1:04B3  263b4702          cmp      ax, word ptr es:[bx + 2]
1:04B7  7d07              jge      0x4c0
1:04B9  833eda11f9        cmp      word ptr [0x11da], -7
1:04BE  7d04              jge      0x4c4
1:04C0  f71ef609          neg      word ptr [0x9f6]
1:04C4  a1a811            mov      ax, word ptr [0x11a8]
1:04C7  0106dc11          add      word ptr [0x11dc], ax
1:04CB  a1dc11            mov      ax, word ptr [0x11dc]
1:04CE  03061a09          add      ax, word ptr [0x91a]
1:04D2  2d0700            sub      ax, 7
1:04D5  263b4704          cmp      ax, word ptr es:[bx + 4]
1:04D9  7d07              jge      0x4e2
1:04DB  833edc11f9        cmp      word ptr [0x11dc], -7
1:04E0  7d04              jge      0x4e6
1:04E2  f71ea811          neg      word ptr [0x11a8]
1:04E6  ff361e09          push     word ptr [0x91e]
1:04EA  ff36da11          push     word ptr [0x11da]
1:04EE  ff36dc11          push     word ptr [0x11dc]
1:04F2  ff361809          push     word ptr [0x918]
1:04F6  ff361a09          push     word ptr [0x91a]
1:04FA  ff7606            push     word ptr [bp + 6]
1:04FD  2bc0              sub      ax, ax
1:04FF  50                push     ax
1:0500  50                push     ax
1:0501  b82000            mov      ax, 0x20
1:0504  bacc00            mov      dx, 0xcc
1:0507  52                push     dx
1:0508  50                push     ax
1:0509  9a4d050000        lcall    0, 0x54d  ; @1:GDI.BitBlt
1:050E  4d                dec      bp
1:050F  4d                dec      bp
1:0510  8be5              mov      sp, bp
1:0512  1f                pop      ds
1:0513  5d                pop      bp
1:0514  4d                dec      bp
1:0515  cb                retf     
1:0516  1e                push     ds
1:0517  58                pop      ax
1:0518  90                nop      
1:0519  45                inc      bp
1:051A  55                push     bp
1:051B  8bec              mov      bp, sp
1:051D  1e                push     ds
1:051E  8ed8              mov      ds, ax
1:0520  833e1c0900        cmp      word ptr [0x91c], 0
1:0525  7403              je       0x52a
1:0527  e99400            jmp      0x5be
1:052A  ff361e09          push     word ptr [0x91e]
1:052E  ff36a201          push     word ptr [0x1a2]
1:0532  ff36a401          push     word ptr [0x1a4]
1:0536  ff361809          push     word ptr [0x918]
1:053A  ff361a09          push     word ptr [0x91a]
1:053E  ff7606            push     word ptr [bp + 6]
1:0541  2bc0              sub      ax, ax
1:0543  50                push     ax
1:0544  50                push     ax
1:0545  b94200            mov      cx, 0x42
1:0548  2bd2              sub      dx, dx
1:054A  52                push     dx
1:054B  51                push     cx
1:054C  9aaa050000        lcall    0, 0x5aa  ; @1:GDI.BitBlt
1:0551  c41e6812          les      bx, ptr [0x1268]
1:0555  268b4702          mov      ax, word ptr es:[bx + 2]
1:0559  2b061809          sub      ax, word ptr [0x918]
1:055D  050700            add      ax, 7
1:0560  50                push     ax
1:0561  2bc0              sub      ax, ax
1:0563  50                push     ax
1:0564  0e                push     cs
1:0565  e8f7fe            call     0x45f
1:0568  5b                pop      bx
1:0569  5b                pop      bx
1:056A  a3a201            mov      word ptr [0x1a2], ax
1:056D  c41e6812          les      bx, ptr [0x1268]
1:0571  268b4704          mov      ax, word ptr es:[bx + 4]
1:0575  2b061a09          sub      ax, word ptr [0x91a]
1:0579  050700            add      ax, 7
1:057C  50                push     ax
1:057D  2bc0              sub      ax, ax
1:057F  50                push     ax
1:0580  0e                push     cs
1:0581  e8dbfe            call     0x45f
1:0584  5b                pop      bx
1:0585  5b                pop      bx
1:0586  a3a401            mov      word ptr [0x1a4], ax
1:0589  ff361e09          push     word ptr [0x91e]
1:058D  ff36a201          push     word ptr [0x1a2]
1:0591  50                push     ax
1:0592  ff361809          push     word ptr [0x918]
1:0596  ff361a09          push     word ptr [0x91a]
1:059A  ff7606            push     word ptr [bp + 6]
1:059D  2bc0              sub      ax, ax
1:059F  50                push     ax
1:05A0  50                push     ax
1:05A1  b82000            mov      ax, 0x20
1:05A4  bacc00            mov      dx, 0xcc
1:05A7  52                push     dx
1:05A8  50                push     ax
1:05A9  9a54060000        lcall    0, 0x654  ; @1:GDI.BitBlt
1:05AE  b89600            mov      ax, 0x96
1:05B1  c41e6812          les      bx, ptr [0x1268]
1:05B5  262b4708          sub      ax, word ptr es:[bx + 8]
1:05B9  a31c09            mov      word ptr [0x91c], ax
1:05BC  eb04              jmp      0x5c2
1:05BE  ff0e1c09          dec      word ptr [0x91c]
1:05C2  4d                dec      bp
1:05C3  4d                dec      bp
1:05C4  8be5              mov      sp, bp
1:05C6  1f                pop      ds
1:05C7  5d                pop      bp
1:05C8  4d                dec      bp
1:05C9  cb                retf     
1:05CA  1e                push     ds
1:05CB  58                pop      ax
1:05CC  90                nop      
1:05CD  45                inc      bp
1:05CE  55                push     bp
1:05CF  8bec              mov      bp, sp
1:05D1  1e                push     ds
1:05D2  8ed8              mov      ds, ax
1:05D4  a1ac11            mov      ax, word ptr [0x11ac]
1:05D7  f7d8              neg      ax
1:05D9  3b06a601          cmp      ax, word ptr [0x1a6]
1:05DD  7d08              jge      0x5e7
1:05DF  813ea601f1d8      cmp      word ptr [0x1a6], 0xd8f1
1:05E5  7526              jne      0x60d
1:05E7  c41e6812          les      bx, ptr [0x1268]
1:05EB  268b4704          mov      ax, word ptr es:[bx + 4]
1:05EF  2b062409          sub      ax, word ptr [0x924]
1:05F3  50                push     ax
1:05F4  2bc0              sub      ax, ax
1:05F6  50                push     ax
1:05F7  0e                push     cs
1:05F8  e864fe            call     0x45f
1:05FB  5b                pop      bx
1:05FC  5b                pop      bx
1:05FD  a3a801            mov      word ptr [0x1a8], ax
1:0600  c41e6812          les      bx, ptr [0x1268]
1:0604  268b4702          mov      ax, word ptr es:[bx + 2]
1:0608  a3a601            mov      word ptr [0x1a6], ax
1:060B  eb13              jmp      0x620
1:060D  c41e6812          les      bx, ptr [0x1268]
1:0611  268b4708          mov      ax, word ptr es:[bx + 8]
1:0615  b9f1ff            mov      cx, 0xfff1
1:0618  99                cdq      
1:0619  f7f9              idiv     cx
1:061B  48                dec      ax
1:061C  0106a601          add      word ptr [0x1a6], ax
1:0620  ff361e09          push     word ptr [0x91e]
1:0624  ff36a601          push     word ptr [0x1a6]
1:0628  ff36a801          push     word ptr [0x1a8]
1:062C  268b4708          mov      ax, word ptr es:[bx + 8]
1:0630  b90f00            mov      cx, 0xf
1:0633  99                cdq      
1:0634  f7f9              idiv     cx
1:0636  0306aa11          add      ax, word ptr [0x11aa]
1:063A  0306ac11          add      ax, word ptr [0x11ac]
1:063E  40                inc      ax
1:063F  50                push     ax
1:0640  ff362409          push     word ptr [0x924]
1:0644  ff7606            push     word ptr [bp + 6]
1:0647  2bc0              sub      ax, ax
1:0649  50                push     ax
1:064A  50                push     ax
1:064B  b82000            mov      ax, 0x20
1:064E  bacc00            mov      dx, 0xcc
1:0651  52                push     dx
1:0652  50                push     ax
1:0653  9affff0000        lcall    0, 0xffff  ; @1:GDI.BitBlt
1:0658  4d                dec      bp
1:0659  4d                dec      bp
1:065A  8be5              mov      sp, bp
1:065C  1f                pop      ds
1:065D  5d                pop      bp
1:065E  4d                dec      bp
1:065F  cb                retf     

; ===== EXPORT:ord_19(#19) =====
1:0660  1e                push     ds
1:0661  58                pop      ax
1:0662  90                nop      
1:0663  45                inc      bp
1:0664  55                push     bp
1:0665  8bec              mov      bp, sp
1:0667  1e                push     ds
1:0668  8ed8              mov      ds, ax
1:066A  83ec08            sub      sp, 8
1:066D  ff361e09          push     word ptr [0x91e]
1:0671  9a9a010000        lcall    0, 0x19a  ; @1:GDI.CreateCompatibleDC
1:0676  8946fc            mov      word ptr [bp - 4], ax
1:0679  50                push     ax
1:067A  ff362209          push     word ptr [0x922]
1:067E  9acd010000        lcall    0, 0x1cd  ; @1:GDI.SelectObject
1:0683  9adf060000        lcall    0, 0x6df  ; @1:USER.GetCurrentTime
1:0688  8b0ed211          mov      cx, word ptr [0x11d2]
1:068C  8b1ed411          mov      bx, word ptr [0x11d4]
1:0690  83c132            add      cx, 0x32
1:0693  83d300            adc      bx, 0
1:0696  3bd3              cmp      dx, bx
1:0698  7250              jb       0x6ea
1:069A  7704              ja       0x6a0
1:069C  3bc1              cmp      ax, cx
1:069E  764a              jbe      0x6ea
1:06A0  c41e6812          les      bx, ptr [0x1268]
1:06A4  268b4706          mov      ax, word ptr es:[bx + 6]
1:06A8  0bc0              or       ax, ax
1:06AA  7420              je       0x6cc
1:06AC  48                dec      ax
1:06AD  7405              je       0x6b4
1:06AF  48                dec      ax
1:06B0  7423              je       0x6d5
1:06B2  eb2a              jmp      0x6de
1:06B4  268b4708          mov      ax, word ptr es:[bx + 8]
1:06B8  b90f00            mov      cx, 0xf
1:06BB  99                cdq      
1:06BC  f7f9              idiv     cx
1:06BE  40                inc      ax
1:06BF  a32009            mov      word ptr [0x920], ax
1:06C2  ff76fc            push     word ptr [bp - 4]
1:06C5  0e                push     cs
1:06C6  e8c7fd            call     0x490
1:06C9  5b                pop      bx
1:06CA  eb12              jmp      0x6de
1:06CC  ff76fc            push     word ptr [bp - 4]
1:06CF  0e                push     cs
1:06D0  e843fe            call     0x516
1:06D3  ebf4              jmp      0x6c9
1:06D5  ff76fc            push     word ptr [bp - 4]
1:06D8  0e                push     cs
1:06D9  e8eefe            call     0x5ca
1:06DC  ebeb              jmp      0x6c9
1:06DE  9a84030000        lcall    0, 0x384  ; @1:USER.GetCurrentTime
1:06E3  a3d211            mov      word ptr [0x11d2], ax
1:06E6  8916d411          mov      word ptr [0x11d4], dx
1:06EA  ff76fc            push     word ptr [bp - 4]
1:06ED  9a79030000        lcall    0, 0x379  ; @1:GDI.DeleteDC
1:06F2  2bc0              sub      ax, ax
1:06F4  4d                dec      bp
1:06F5  4d                dec      bp
1:06F6  8be5              mov      sp, bp
1:06F8  1f                pop      ds
1:06F9  5d                pop      bp
1:06FA  4d                dec      bp
1:06FB  cb                retf     

; ===== EXPORT:ord_18(#18) =====
1:06FC  1e                push     ds
1:06FD  58                pop      ax
1:06FE  90                nop      
1:06FF  45                inc      bp
1:0700  55                push     bp
1:0701  8bec              mov      bp, sp
1:0703  1e                push     ds
1:0704  8ed8              mov      ds, ax
1:0706  833e220900        cmp      word ptr [0x922], 0
1:070B  7409              je       0x716
1:070D  ff362209          push     word ptr [0x922]
1:0711  9a6b030000        lcall    0, 0x36b  ; @1:GDI.DeleteObject
1:0716  2bc0              sub      ax, ax
1:0718  4d                dec      bp
1:0719  4d                dec      bp
1:071A  8be5              mov      sp, bp
1:071C  1f                pop      ds
1:071D  5d                pop      bp
1:071E  4d                dec      bp
1:071F  cb                retf     

; ===== EXPORT:ord_17(#17) =====
1:0720  1e                push     ds
1:0721  58                pop      ax
1:0722  90                nop      
1:0723  45                inc      bp
1:0724  55                push     bp
1:0725  8bec              mov      bp, sp
1:0727  1e                push     ds
1:0728  8ed8              mov      ds, ax
1:072A  2bc0              sub      ax, ax
1:072C  4d                dec      bp
1:072D  4d                dec      bp
1:072E  8be5              mov      sp, bp
1:0730  1f                pop      ds
1:0731  5d                pop      bp
1:0732  4d                dec      bp
1:0733  cb                retf     

; ===== EXPORT:ord_16(#16) =====
1:0734  1e                push     ds
1:0735  58                pop      ax
1:0736  90                nop      
1:0737  45                inc      bp
1:0738  55                push     bp
1:0739  8bec              mov      bp, sp
1:073B  1e                push     ds
1:073C  8ed8              mov      ds, ax
1:073E  2bc0              sub      ax, ax
1:0740  4d                dec      bp
1:0741  4d                dec      bp
1:0742  8be5              mov      sp, bp
1:0744  1f                pop      ds
1:0745  5d                pop      bp
1:0746  4d                dec      bp
1:0747  cb                retf     

; ===== EXPORT:THEFACE(#5) =====
1:0748  1e                push     ds
1:0749  58                pop      ax
1:074A  90                nop      
1:074B  45                inc      bp
1:074C  55                push     bp
1:074D  8bec              mov      bp, sp
1:074F  1e                push     ds
1:0750  8ed8              mov      ds, ax
1:0752  56                push     si
1:0753  833eb60000        cmp      word ptr [0xb6], 0
1:0758  7403              je       0x75d
1:075A  e9b700            jmp      0x814
1:075D  c45e10            les      bx, ptr [bp + 0x10]
1:0760  268b4704          mov      ax, word ptr es:[bx + 4]
1:0764  a3e608            mov      word ptr [0x8e6], ax
1:0767  268b4706          mov      ax, word ptr es:[bx + 6]
1:076B  a3e808            mov      word ptr [0x8e8], ax
1:076E  268a470d          mov      al, byte ptr es:[bx + 0xd]
1:0772  a2ef08            mov      byte ptr [0x8ef], al
1:0775  268a470e          mov      al, byte ptr es:[bx + 0xe]
1:0779  a2f008            mov      byte ptr [0x8f0], al
1:077C  268a470f          mov      al, byte ptr es:[bx + 0xf]
1:0780  a2f108            mov      byte ptr [0x8f1], al
1:0783  268a4710          mov      al, byte ptr es:[bx + 0x10]
1:0787  a2f208            mov      byte ptr [0x8f2], al
1:078A  268a4711          mov      al, byte ptr es:[bx + 0x11]
1:078E  a2f308            mov      byte ptr [0x8f3], al
1:0791  c70678050000      mov      word ptr [0x578], 0
1:0797  8e4612            mov      es, word ptr [bp + 0x12]
1:079A  8b5e10            mov      bx, word ptr [bp + 0x10]
1:079D  83c312            add      bx, 0x12
1:07A0  8b367805          mov      si, word ptr [0x578]
1:07A4  268a00            mov      al, byte ptr es:[bx + si]
1:07A7  8884f408          mov      byte ptr [si + 0x8f4], al
1:07AB  ff067805          inc      word ptr [0x578]
1:07AF  833e780520        cmp      word ptr [0x578], 0x20
1:07B4  7ce4              jl       0x79a
1:07B6  8b4608            mov      ax, word ptr [bp + 8]
1:07B9  0b4606            or       ax, word ptr [bp + 6]
1:07BC  7415              je       0x7d3
1:07BE  ff7606            push     word ptr [bp + 6]
1:07C1  b86e00            mov      ax, 0x6e
1:07C4  50                push     ax
1:07C5  b80b04            mov      ax, 0x40b
1:07C8  50                push     ax
1:07C9  2bc0              sub      ax, ax
1:07CB  50                push     ax
1:07CC  50                push     ax
1:07CD  50                push     ax
1:07CE  9afb070000        lcall    0, 0x7fb  ; @1:USER.SendDlgItemMessage
1:07D3  8b4608            mov      ax, word ptr [bp + 8]
1:07D6  0b4606            or       ax, word ptr [bp + 6]
1:07D9  742f              je       0x80a
1:07DB  c70676050000      mov      word ptr [0x576], 0
1:07E1  ff7606            push     word ptr [bp + 6]
1:07E4  b86e00            mov      ax, 0x6e
1:07E7  50                push     ax
1:07E8  b80304            mov      ax, 0x403
1:07EB  50                push     ax
1:07EC  2bc0              sub      ax, ax
1:07EE  50                push     ax
1:07EF  8b1e7605          mov      bx, word ptr [0x576]
1:07F3  d1e3              shl      bx, 1
1:07F5  1e                push     ds
1:07F6  ffb78000          push     word ptr [bx + 0x80]
1:07FA  9a47080000        lcall    0, 0x847  ; @1:USER.SendDlgItemMessage
1:07FF  ff067605          inc      word ptr [0x576]
1:0803  833e76050e        cmp      word ptr [0x576], 0xe
1:0808  7cd7              jl       0x7e1
1:080A  c706b6000100      mov      word ptr [0xb6], 1
1:0810  2bc0              sub      ax, ax
1:0812  eb5b              jmp      0x86f
1:0814  8b4608            mov      ax, word ptr [bp + 8]
1:0817  0b4606            or       ax, word ptr [bp + 6]
1:081A  74f4              je       0x810
1:081C  b80a00            mov      ax, 0xa
1:081F  50                push     ax
1:0820  b87a05            mov      ax, 0x57a
1:0823  50                push     ax
1:0824  c45e10            les      bx, ptr [bp + 0x10]
1:0827  26ff37            push     word ptr es:[bx]
1:082A  9a68090000        lcall    0, 0x968  ; @1:INT:ord_11(1:1CF4)
1:082F  83c406            add      sp, 6
1:0832  ff7606            push     word ptr [bp + 6]
1:0835  b86e00            mov      ax, 0x6e
1:0838  50                push     ax
1:0839  b90c04            mov      cx, 0x40c
1:083C  51                push     cx
1:083D  b9ffff            mov      cx, 0xffff
1:0840  51                push     cx
1:0841  b97a05            mov      cx, 0x57a
1:0844  1e                push     ds
1:0845  51                push     cx
1:0846  9a68080000        lcall    0, 0x868  ; @1:USER.SendDlgItemMessage
1:084B  3dffff            cmp      ax, 0xffff
1:084E  751c              jne      0x86c
1:0850  3bd0              cmp      dx, ax
1:0852  7518              jne      0x86c
1:0854  ff7606            push     word ptr [bp + 6]
1:0857  b86e00            mov      ax, 0x6e
1:085A  50                push     ax
1:085B  b80304            mov      ax, 0x403
1:085E  50                push     ax
1:085F  2bc0              sub      ax, ax
1:0861  50                push     ax
1:0862  b87a05            mov      ax, 0x57a
1:0865  1e                push     ds
1:0866  50                push     ax
1:0867  9a72090000        lcall    0, 0x972  ; @1:USER.SendDlgItemMessage
1:086C  b80100            mov      ax, 1
1:086F  5e                pop      si
1:0870  4d                dec      bp
1:0871  4d                dec      bp
1:0872  8be5              mov      sp, bp
1:0874  1f                pop      ds
1:0875  5d                pop      bp
1:0876  4d                dec      bp
1:0877  ca0e00            retf     0xe
1:087A  1e                push     ds
1:087B  58                pop      ax
1:087C  90                nop      
1:087D  45                inc      bp
1:087E  55                push     bp
1:087F  8bec              mov      bp, sp
1:0881  1e                push     ds
1:0882  8ed8              mov      ds, ax
1:0884  83ec06            sub      sp, 6
1:0887  c706b6000000      mov      word ptr [0xb6], 0
1:088D  b8ffff            mov      ax, 0xffff  ; @1:INT:THEFACE(1:0748)
1:0890  baffff            mov      dx, 0xffff  ; @1:INT:THEFACE(1:0748)
1:0893  52                push     dx
1:0894  50                push     ax
1:0895  ff36ae11          push     word ptr [0x11ae]
1:0899  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.MakeProcInstance
1:089E  8946fa            mov      word ptr [bp - 6], ax
1:08A1  8956fc            mov      word ptr [bp - 4], dx
1:08A4  ff361e09          push     word ptr [0x91e]
1:08A8  1e                push     ds
1:08A9  ff7608            push     word ptr [bp + 8]
1:08AC  52                push     dx
1:08AD  50                push     ax
1:08AE  8b4606            mov      ax, word ptr [bp + 6]
1:08B1  2bd2              sub      dx, dx
1:08B3  52                push     dx
1:08B4  50                push     ax
1:08B5  9affff0000        lcall    0, 0xffff  ; @1:GDI.EnumFonts
1:08BA  ff76fc            push     word ptr [bp - 4]
1:08BD  ff76fa            push     word ptr [bp - 6]
1:08C0  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.FreeProcInstance
1:08C5  a1b000            mov      ax, word ptr [0xb0]
1:08C8  a38005            mov      word ptr [0x580], ax
1:08CB  3d3000            cmp      ax, 0x30
1:08CE  7e25              jle      0x8f5
1:08D0  837e0600          cmp      word ptr [bp + 6], 0
1:08D4  741f              je       0x8f5
1:08D6  ff7606            push     word ptr [bp + 6]
1:08D9  b87500            mov      ax, 0x75
1:08DC  50                push     ax
1:08DD  9a03090000        lcall    0, 0x903  ; @1:USER.GetDlgItem
1:08E2  50                push     ax
1:08E3  b8aa01            mov      ax, 0x1aa
1:08E6  1e                push     ds
1:08E7  50                push     ax
1:08E8  9a0e090000        lcall    0, 0x90e  ; @1:USER.SetWindowText
1:08ED  c70680053000      mov      word ptr [0x580], 0x30
1:08F3  eb23              jmp      0x918
1:08F5  837e0600          cmp      word ptr [bp + 6], 0
1:08F9  741d              je       0x918
1:08FB  ff7606            push     word ptr [bp + 6]
1:08FE  b87500            mov      ax, 0x75
1:0901  50                push     ax
1:0902  9af3090000        lcall    0, 0x9f3  ; @1:USER.GetDlgItem
1:0907  50                push     ax
1:0908  b8bc01            mov      ax, 0x1bc
1:090B  1e                push     ds
1:090C  50                push     ax
1:090D  9affff0000        lcall    0, 0xffff  ; @1:USER.SetWindowText
1:0912  a1b000            mov      ax, word ptr [0xb0]
1:0915  a38005            mov      word ptr [0x580], ax
1:0918  a18005            mov      ax, word ptr [0x580]
1:091B  a3e208            mov      word ptr [0x8e2], ax
1:091E  c706e4080000      mov      word ptr [0x8e4], 0
1:0924  8a460c            mov      al, byte ptr [bp + 0xc]
1:0927  a2ec08            mov      byte ptr [0x8ec], al
1:092A  8a460e            mov      al, byte ptr [bp + 0xe]
1:092D  a2ed08            mov      byte ptr [0x8ed], al
1:0930  837e0a01          cmp      word ptr [bp + 0xa], 1
1:0934  1bc0              sbb      ax, ax
1:0936  2570fe            and      ax, 0xfe70
1:0939  05bc02            add      ax, 0x2bc
1:093C  a3ea08            mov      word ptr [0x8ea], ax
1:093F  c606ee0800        mov      byte ptr [0x8ee], 0
1:0944  837e0600          cmp      word ptr [bp + 6], 0
1:0948  7503              jne      0x94d
1:094A  e98200            jmp      0x9cf
1:094D  ff7606            push     word ptr [bp + 6]
1:0950  b86e00            mov      ax, 0x6e
1:0953  50                push     ax
1:0954  b90c04            mov      cx, 0x40c
1:0957  51                push     cx
1:0958  b9ffff            mov      cx, 0xffff
1:095B  51                push     cx
1:095C  b90a00            mov      cx, 0xa
1:095F  51                push     cx
1:0960  2bd2              sub      dx, dx
1:0962  52                push     dx
1:0963  ff36b000          push     word ptr [0xb0]
1:0967  9a99090000        lcall    0, 0x999  ; @1:INT:ord_11(1:1CF4)
1:096C  83c406            add      sp, 6
1:096F  1e                push     ds
1:0970  50                push     ax
1:0971  9aa3090000        lcall    0, 0x9a3  ; @1:USER.SendDlgItemMessage
1:0976  a37e05            mov      word ptr [0x57e], ax
1:0979  3dffff            cmp      ax, 0xffff
1:097C  7429              je       0x9a7
1:097E  ff7606            push     word ptr [bp + 6]
1:0981  b86e00            mov      ax, 0x6e
1:0984  50                push     ax
1:0985  b90e04            mov      cx, 0x40e
1:0988  51                push     cx
1:0989  ff367e05          push     word ptr [0x57e]
1:098D  b90a00            mov      cx, 0xa
1:0990  51                push     cx
1:0991  2bd2              sub      dx, dx
1:0993  52                push     dx
1:0994  ff36b000          push     word ptr [0xb0]
1:0998  9ac1090000        lcall    0, 0x9c1  ; @1:INT:ord_11(1:1CF4)
1:099D  83c406            add      sp, 6
1:09A0  1e                push     ds
1:09A1  50                push     ax
1:09A2  9acb090000        lcall    0, 0x9cb  ; @1:USER.SendDlgItemMessage
1:09A7  ff7606            push     word ptr [bp + 6]
1:09AA  b86e00            mov      ax, 0x6e
1:09AD  50                push     ax
1:09AE  b80c00            mov      ax, 0xc
1:09B1  50                push     ax
1:09B2  2bc0              sub      ax, ax
1:09B4  50                push     ax
1:09B5  b80a00            mov      ax, 0xa
1:09B8  50                push     ax
1:09B9  2bc0              sub      ax, ax
1:09BB  50                push     ax
1:09BC  ff36b000          push     word ptr [0xb0]
1:09C0  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:1CF4)
1:09C5  83c406            add      sp, 6
1:09C8  1e                push     ds
1:09C9  50                push     ax
1:09CA  9affff0000        lcall    0, 0xffff  ; @1:USER.SendDlgItemMessage
1:09CF  b8e208            mov      ax, 0x8e2
1:09D2  1e                push     ds
1:09D3  50                push     ax
1:09D4  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateFontIndirect
1:09D9  4d                dec      bp
1:09DA  4d                dec      bp
1:09DB  8be5              mov      sp, bp
1:09DD  1f                pop      ds
1:09DE  5d                pop      bp
1:09DF  4d                dec      bp
1:09E0  cb                retf     
1:09E1  1e                push     ds
1:09E2  58                pop      ax
1:09E3  90                nop      
1:09E4  45                inc      bp
1:09E5  55                push     bp
1:09E6  8bec              mov      bp, sp
1:09E8  1e                push     ds
1:09E9  8ed8              mov      ds, ax
1:09EB  ff7606            push     word ptr [bp + 6]
1:09EE  b88e00            mov      ax, 0x8e
1:09F1  50                push     ax
1:09F2  9aed000000        lcall    0, 0xed  ; @1:USER.GetDlgItem
1:09F7  50                push     ax
1:09F8  b80704            mov      ax, 0x407
1:09FB  50                push     ax
1:09FC  2bc0              sub      ax, ax
1:09FE  50                push     ax
1:09FF  50                push     ax
1:0A00  50                push     ax
1:0A01  9affff0000        lcall    0, 0xffff  ; @1:USER.SendMessage
1:0A06  a38205            mov      word ptr [0x582], ax
1:0A09  89168405          mov      word ptr [0x584], dx
1:0A0D  3dffff            cmp      ax, 0xffff
1:0A10  7504              jne      0xa16
1:0A12  3bd0              cmp      dx, ax
1:0A14  7447              je       0xa5d
1:0A16  a3bc00            mov      word ptr [0xbc], ax
1:0A19  eb27              jmp      0xa42
1:0A1B  b8ff00            mov      ax, 0xff
1:0A1E  2bd2              sub      dx, dx
1:0A20  eb3f              jmp      0xa61
1:0A22  b800ff            mov      ax, 0xff00
1:0A25  ebf7              jmp      0xa1e
1:0A27  2bc0              sub      ax, ax
1:0A29  baff00            mov      dx, 0xff
1:0A2C  eb33              jmp      0xa61
1:0A2E  b800ff            mov      ax, 0xff00
1:0A31  ebf6              jmp      0xa29
1:0A33  b8ff00            mov      ax, 0xff
1:0A36  ebf1              jmp      0xa29
1:0A38  b8ffff            mov      ax, 0xffff
1:0A3B  ebe1              jmp      0xa1e
1:0A3D  b8ffff            mov      ax, 0xffff
1:0A40  ebe7              jmp      0xa29
1:0A42  3d0600            cmp      ax, 6
1:0A45  77f6              ja       0xa3d
1:0A47  d1e0              shl      ax, 1
1:0A49  93                xchg     bx, ax
1:0A4A  2effa74f0a        jmp      word ptr cs:[bx + 0xa4f]
1:0A4F  5d                pop      bp
1:0A50  0a1b              or       bl, byte ptr [bp + di]
1:0A52  0a22              or       ah, byte ptr [bp + si]
1:0A54  0a27              or       ah, byte ptr [bx]
1:0A56  0a2e0a33          or       ch, byte ptr [0x330a]
1:0A5A  0a38              or       bh, byte ptr [bx + si]
1:0A5C  0a2b              or       ch, byte ptr [bp + di]
1:0A5E  c0ebbd            shr      bl, 0xbd
1:0A61  4d                dec      bp
1:0A62  4d                dec      bp
1:0A63  8be5              mov      sp, bp
1:0A65  1f                pop      ds
1:0A66  5d                pop      bp
1:0A67  4d                dec      bp
1:0A68  cb                retf     
1:0A69  1e                push     ds
1:0A6A  58                pop      ax
1:0A6B  90                nop      
1:0A6C  45                inc      bp
1:0A6D  55                push     bp
1:0A6E  8bec              mov      bp, sp
1:0A70  1e                push     ds
1:0A71  8ed8              mov      ds, ax
1:0A73  83ec06            sub      sp, 6
1:0A76  56                push     si
1:0A77  c746fa0000        mov      word ptr [bp - 6], 0
1:0A7C  b88605            mov      ax, 0x586
1:0A7F  1e                push     ds
1:0A80  50                push     ax
1:0A81  b99000            mov      cx, 0x90
1:0A84  51                push     cx
1:0A85  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GetWindowsDirectory
1:0A8A  b88605            mov      ax, 0x586
1:0A8D  50                push     ax
1:0A8E  9a70010000        lcall    0, 0x170  ; @1:INT:ord_7(1:1CD4)
1:0A93  5b                pop      bx
1:0A94  8bd8              mov      bx, ax
1:0A96  80bf85055c        cmp      byte ptr [bx + 0x585], 0x5c
1:0A9B  7416              je       0xab3
1:0A9D  803e860500        cmp      byte ptr [0x586], 0
1:0AA2  740f              je       0xab3
1:0AA4  b8bd01            mov      ax, 0x1bd
1:0AA7  50                push     ax
1:0AA8  b88605            mov      ax, 0x586
1:0AAB  50                push     ax
1:0AAC  9abc0a0000        lcall    0, 0xabc  ; @1:INT:ord_10(1:1C62)
1:0AB1  5b                pop      bx
1:0AB2  5b                pop      bx
1:0AB3  b8bf01            mov      ax, 0x1bf
1:0AB6  50                push     ax
1:0AB7  b88605            mov      ax, 0x586
1:0ABA  50                push     ax
1:0ABB  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:1C62)
1:0AC0  5b                pop      bx
1:0AC1  5b                pop      bx
1:0AC2  b88605            mov      ax, 0x586
1:0AC5  1e                push     ds
1:0AC6  50                push     ax
1:0AC7  b8e011            mov      ax, 0x11e0
1:0ACA  1e                push     ds
1:0ACB  50                push     ax
1:0ACC  b80040            mov      ax, 0x4000
1:0ACF  50                push     ax
1:0AD0  9a000b0000        lcall    0, 0xb00  ; @1:KERNEL.OpenFile
1:0AD5  40                inc      ax
1:0AD6  751a              jne      0xaf2
1:0AD8  c706240a0100      mov      word ptr [0xa24], 1
1:0ADE  b8cc01            mov      ax, 0x1cc
1:0AE1  50                push     ax
1:0AE2  b8c000            mov      ax, 0xc0
1:0AE5  50                push     ax
1:0AE6  9a18000000        lcall    0, 0x18  ; @1:INT:ord_8(1:1CA2)
1:0AEB  5b                pop      bx
1:0AEC  5b                pop      bx
1:0AED  2bc0              sub      ax, ax
1:0AEF  e92b01            jmp      0xc1d
1:0AF2  b88605            mov      ax, 0x586
1:0AF5  1e                push     ds
1:0AF6  50                push     ax
1:0AF7  b8e011            mov      ax, 0x11e0
1:0AFA  1e                push     ds
1:0AFB  50                push     ax
1:0AFC  2bc0              sub      ax, ax
1:0AFE  50                push     ax
1:0AFF  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.OpenFile
1:0B04  a3b011            mov      word ptr [0x11b0], ax
1:0B07  3dffff            cmp      ax, 0xffff
1:0B0A  7503              jne      0xb0f
1:0B0C  e9ed00            jmp      0xbfc
1:0B0F  e9d700            jmp      0xbe9
1:0B12  b8f600            mov      ax, 0xf6
1:0B15  50                push     ax
1:0B16  f766fa            mul      word ptr [bp - 6]
1:0B19  8bc8              mov      cx, ax
1:0B1B  05f809            add      ax, 0x9f8
1:0B1E  50                push     ax
1:0B1F  ff36b011          push     word ptr [0x11b0]
1:0B23  8bf1              mov      si, cx
1:0B25  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_13(1:1B6A)
1:0B2A  83c406            add      sp, 6
1:0B2D  0bc0              or       ax, ax
1:0B2F  7503              jne      0xb34
1:0B31  e9be00            jmp      0xbf2
1:0B34  837e0800          cmp      word ptr [bp + 8], 0
1:0B38  7439              je       0xb73
1:0B3A  ff7606            push     word ptr [bp + 6]
1:0B3D  b89600            mov      ax, 0x96
1:0B40  50                push     ax
1:0B41  b90404            mov      cx, 0x404
1:0B44  51                push     cx
1:0B45  ff76fa            push     word ptr [bp - 6]
1:0B48  2bc9              sub      cx, cx
1:0B4A  51                push     cx
1:0B4B  51                push     cx
1:0B4C  9a6f0b0000        lcall    0, 0xb6f  ; @1:USER.SendDlgItemMessage
1:0B51  81c6260a          add      si, 0xa26
1:0B55  56                push     si
1:0B56  0e                push     cs
1:0B57  e8a6f4            call     0
1:0B5A  5b                pop      bx
1:0B5B  ff7606            push     word ptr [bp + 6]
1:0B5E  b89600            mov      ax, 0x96
1:0B61  50                push     ax
1:0B62  b80a04            mov      ax, 0x40a
1:0B65  50                push     ax
1:0B66  ff76fa            push     word ptr [bp - 6]
1:0B69  b82a09            mov      ax, 0x92a
1:0B6C  1e                push     ds
1:0B6D  50                push     ax
1:0B6E  9a160c0000        lcall    0, 0xc16  ; @1:USER.SendDlgItemMessage
1:0B73  b8f600            mov      ax, 0xf6
1:0B76  f766fa            mul      word ptr [bp - 6]
1:0B79  8bd8              mov      bx, ax
1:0B7B  83bf240a00        cmp      word ptr [bx + 0xa24], 0
1:0B80  7456              je       0xbd8
1:0B82  8b87f809          mov      ax, word ptr [bx + 0x9f8]
1:0B86  a3b200            mov      word ptr [0xb2], ax
1:0B89  8b87fa09          mov      ax, word ptr [bx + 0x9fa]
1:0B8D  a3b800            mov      word ptr [0xb8], ax
1:0B90  8b87fc09          mov      ax, word ptr [bx + 0x9fc]
1:0B94  a3b400            mov      word ptr [0xb4], ax
1:0B97  8b87fe09          mov      ax, word ptr [bx + 0x9fe]
1:0B9B  a3b000            mov      word ptr [0xb0], ax
1:0B9E  8bc3              mov      ax, bx
1:0BA0  81c3000a          add      bx, 0xa00
1:0BA4  53                push     bx
1:0BA5  b9b211            mov      cx, 0x11b2
1:0BA8  51                push     cx
1:0BA9  8bf0              mov      si, ax
1:0BAB  9ad00b0000        lcall    0, 0xbd0  ; @1:INT:ord_8(1:1CA2)
1:0BB0  5b                pop      bx
1:0BB1  5b                pop      bx
1:0BB2  8b84200a          mov      ax, word ptr [si + 0xa20]
1:0BB6  a3ba00            mov      word ptr [0xba], ax
1:0BB9  8b84220a          mov      ax, word ptr [si + 0xa22]
1:0BBD  a3bc00            mov      word ptr [0xbc], ax
1:0BC0  8b46fa            mov      ax, word ptr [bp - 6]
1:0BC3  a3be00            mov      word ptr [0xbe], ax
1:0BC6  81c6260a          add      si, 0xa26
1:0BCA  56                push     si
1:0BCB  b9c000            mov      cx, 0xc0
1:0BCE  51                push     cx
1:0BCF  9a620c0000        lcall    0, 0xc62  ; @1:INT:ord_8(1:1CA2)
1:0BD4  5b                pop      bx
1:0BD5  5b                pop      bx
1:0BD6  eb0e              jmp      0xbe6
1:0BD8  b8f600            mov      ax, 0xf6
1:0BDB  f766fa            mul      word ptr [bp - 6]
1:0BDE  8bd8              mov      bx, ax
1:0BE0  c787240a0000      mov      word ptr [bx + 0xa24], 0
1:0BE6  ff46fa            inc      word ptr [bp - 6]
1:0BE9  837efa08          cmp      word ptr [bp - 6], 8
1:0BED  7303              jae      0xbf2
1:0BEF  e920ff            jmp      0xb12
1:0BF2  ff36b011          push     word ptr [0x11b0]
1:0BF6  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:1B42)
1:0BFB  5b                pop      bx
1:0BFC  837e0800          cmp      word ptr [bp + 8], 0
1:0C00  7418              je       0xc1a
1:0C02  ff7606            push     word ptr [bp + 6]
1:0C05  b89600            mov      ax, 0x96
1:0C08  50                push     ax
1:0C09  b80e04            mov      ax, 0x40e
1:0C0C  50                push     ax
1:0C0D  ff36be00          push     word ptr [0xbe]
1:0C11  2bc0              sub      ax, ax
1:0C13  50                push     ax
1:0C14  50                push     ax
1:0C15  9a350e0000        lcall    0, 0xe35  ; @1:USER.SendDlgItemMessage
1:0C1A  b80100            mov      ax, 1
1:0C1D  5e                pop      si
1:0C1E  4d                dec      bp
1:0C1F  4d                dec      bp
1:0C20  8be5              mov      sp, bp
1:0C22  1f                pop      ds
1:0C23  5d                pop      bp
1:0C24  4d                dec      bp
1:0C25  cb                retf     
1:0C26  1e                push     ds
1:0C27  58                pop      ax
1:0C28  90                nop      
1:0C29  45                inc      bp
1:0C2A  55                push     bp
1:0C2B  8bec              mov      bp, sp
1:0C2D  1e                push     ds
1:0C2E  8ed8              mov      ds, ax
1:0C30  83ec04            sub      sp, 4
1:0C33  b8f600            mov      ax, 0xf6
1:0C36  f72ebe00          imul     word ptr [0xbe]
1:0C3A  8bd8              mov      bx, ax
1:0C3C  a1b000            mov      ax, word ptr [0xb0]
1:0C3F  8987fe09          mov      word ptr [bx + 0x9fe], ax
1:0C43  a1b200            mov      ax, word ptr [0xb2]
1:0C46  8987f809          mov      word ptr [bx + 0x9f8], ax
1:0C4A  a1b400            mov      ax, word ptr [0xb4]
1:0C4D  8987fc09          mov      word ptr [bx + 0x9fc], ax
1:0C51  a1b800            mov      ax, word ptr [0xb8]
1:0C54  8987fa09          mov      word ptr [bx + 0x9fa], ax
1:0C58  b8b211            mov      ax, 0x11b2
1:0C5B  50                push     ax
1:0C5C  81c3000a          add      bx, 0xa00
1:0C60  53                push     bx
1:0C61  9a8f0c0000        lcall    0, 0xc8f  ; @1:INT:ord_8(1:1CA2)
1:0C66  5b                pop      bx
1:0C67  5b                pop      bx
1:0C68  b8f600            mov      ax, 0xf6
1:0C6B  f72ebe00          imul     word ptr [0xbe]
1:0C6F  8bd8              mov      bx, ax
1:0C71  a1ba00            mov      ax, word ptr [0xba]
1:0C74  8987200a          mov      word ptr [bx + 0xa20], ax
1:0C78  a1bc00            mov      ax, word ptr [0xbc]
1:0C7B  8987220a          mov      word ptr [bx + 0xa22], ax
1:0C7F  c787240a0100      mov      word ptr [bx + 0xa24], 1
1:0C85  b8c000            mov      ax, 0xc0
1:0C88  50                push     ax
1:0C89  81c3260a          add      bx, 0xa26
1:0C8D  53                push     bx
1:0C8E  9ae70a0000        lcall    0, 0xae7  ; @1:INT:ord_8(1:1CA2)
1:0C93  5b                pop      bx
1:0C94  5b                pop      bx
1:0C95  b81606            mov      ax, 0x616
1:0C98  1e                push     ds
1:0C99  50                push     ax
1:0C9A  b99000            mov      cx, 0x90
1:0C9D  51                push     cx
1:0C9E  9a860a0000        lcall    0, 0xa86  ; @1:KERNEL.GetWindowsDirectory
1:0CA3  b81606            mov      ax, 0x616
1:0CA6  50                push     ax
1:0CA7  9a8f0a0000        lcall    0, 0xa8f  ; @1:INT:ord_7(1:1CD4)
1:0CAC  5b                pop      bx
1:0CAD  8bd8              mov      bx, ax
1:0CAF  80bf15065c        cmp      byte ptr [bx + 0x615], 0x5c
1:0CB4  7416              je       0xccc
1:0CB6  803e160600        cmp      byte ptr [0x616], 0
1:0CBB  740f              je       0xccc
1:0CBD  b8d501            mov      ax, 0x1d5
1:0CC0  50                push     ax
1:0CC1  b81606            mov      ax, 0x616
1:0CC4  50                push     ax
1:0CC5  9ad50c0000        lcall    0, 0xcd5  ; @1:INT:ord_10(1:1C62)
1:0CCA  5b                pop      bx
1:0CCB  5b                pop      bx
1:0CCC  b8d701            mov      ax, 0x1d7
1:0CCF  50                push     ax
1:0CD0  b81606            mov      ax, 0x616
1:0CD3  50                push     ax
1:0CD4  9aad0a0000        lcall    0, 0xaad  ; @1:INT:ord_10(1:1C62)
1:0CD9  5b                pop      bx
1:0CDA  5b                pop      bx
1:0CDB  b81606            mov      ax, 0x616
1:0CDE  1e                push     ds
1:0CDF  50                push     ax
1:0CE0  b8e011            mov      ax, 0x11e0
1:0CE3  1e                push     ds
1:0CE4  50                push     ax
1:0CE5  b80110            mov      ax, 0x1001
1:0CE8  50                push     ax
1:0CE9  9ad10a0000        lcall    0, 0xad1  ; @1:KERNEL.OpenFile
1:0CEE  a3b011            mov      word ptr [0x11b0], ax
1:0CF1  3dffff            cmp      ax, 0xffff
1:0CF4  7439              je       0xd2f
1:0CF6  c746fc0000        mov      word ptr [bp - 4], 0
1:0CFB  ff36b011          push     word ptr [0x11b0]
1:0CFF  b8f600            mov      ax, 0xf6
1:0D02  f76efc            imul     word ptr [bp - 4]
1:0D05  05f809            add      ax, 0x9f8
1:0D08  1e                push     ds
1:0D09  50                push     ax
1:0D0A  b8f600            mov      ax, 0xf6
1:0D0D  50                push     ax
1:0D0E  9affff0000        lcall    0, 0xffff  ; @1:KERNEL._lwrite
1:0D13  0bc0              or       ax, ax
1:0D15  7506              jne      0xd1d
1:0D17  50                push     ax
1:0D18  9affff0000        lcall    0, 0xffff  ; @1:USER.MessageBeep
1:0D1D  ff46fc            inc      word ptr [bp - 4]
1:0D20  837efc08          cmp      word ptr [bp - 4], 8
1:0D24  7cd5              jl       0xcfb
1:0D26  ff36b011          push     word ptr [0x11b0]
1:0D2A  9affff0000        lcall    0, 0xffff  ; @1:KERNEL._lclose
1:0D2F  4d                dec      bp
1:0D30  4d                dec      bp
1:0D31  8be5              mov      sp, bp
1:0D33  1f                pop      ds
1:0D34  5d                pop      bp
1:0D35  4d                dec      bp
1:0D36  cb                retf     
1:0D37  1e                push     ds
1:0D38  58                pop      ax
1:0D39  90                nop      
1:0D3A  45                inc      bp
1:0D3B  55                push     bp
1:0D3C  8bec              mov      bp, sp
1:0D3E  1e                push     ds
1:0D3F  8ed8              mov      ds, ax
1:0D41  83ec04            sub      sp, 4
1:0D44  ff7606            push     word ptr [bp + 6]
1:0D47  b87000            mov      ax, 0x70
1:0D4A  50                push     ax
1:0D4B  9a8f0d0000        lcall    0, 0xd8f  ; @1:USER.GetDlgItem
1:0D50  a3d006            mov      word ptr [0x6d0], ax
1:0D53  50                push     ax
1:0D54  9adc000000        lcall    0, 0xdc  ; @1:USER.IsWindow
1:0D59  0bc0              or       ax, ax
1:0D5B  7409              je       0xd66
1:0D5D  ff36d006          push     word ptr [0x6d0]
1:0D61  9affff0000        lcall    0, 0xffff  ; @1:USER.DestroyWindow
1:0D66  a1ba00            mov      ax, word ptr [0xba]
1:0D69  0bc0              or       ax, ax
1:0D6B  740e              je       0xd7b
1:0D6D  48                dec      ax
1:0D6E  7503              jne      0xd73
1:0D70  e9d500            jmp      0xe48
1:0D73  48                dec      ax
1:0D74  7503              jne      0xd79
1:0D76  e9d800            jmp      0xe51
1:0D79  eb0c              jmp      0xd87
1:0D7B  c706c2064400      mov      word ptr [0x6c2], 0x44
1:0D81  c706c4068140      mov      word ptr [0x6c4], 0x4081
1:0D87  ff7606            push     word ptr [bp + 6]
1:0D8A  b89600            mov      ax, 0x96
1:0D8D  50                push     ax
1:0D8E  9aa60d0000        lcall    0, 0xda6  ; @1:USER.GetDlgItem
1:0D93  50                push     ax
1:0D94  b8b006            mov      ax, 0x6b0
1:0D97  1e                push     ds
1:0D98  50                push     ax
1:0D99  9ab10d0000        lcall    0, 0xdb1  ; @1:USER.GetWindowRect
1:0D9E  ff7606            push     word ptr [bp + 6]
1:0DA1  b88200            mov      ax, 0x82
1:0DA4  50                push     ax
1:0DA5  9ade080000        lcall    0, 0x8de  ; @1:USER.GetDlgItem
1:0DAA  50                push     ax
1:0DAB  b8b806            mov      ax, 0x6b8
1:0DAE  1e                push     ds
1:0DAF  50                push     ax
1:0DB0  9affff0000        lcall    0, 0xffff  ; @1:USER.GetWindowRect
1:0DB5  a1b806            mov      ax, word ptr [0x6b8]
1:0DB8  a3a806            mov      word ptr [0x6a8], ax
1:0DBB  a1b606            mov      ax, word ptr [0x6b6]
1:0DBE  a3aa06            mov      word ptr [0x6aa], ax
1:0DC1  ff7606            push     word ptr [bp + 6]
1:0DC4  b8a806            mov      ax, 0x6a8
1:0DC7  1e                push     ds
1:0DC8  50                push     ax
1:0DC9  9affff0000        lcall    0, 0xffff  ; @1:USER.ScreenToClient
1:0DCE  a1ba06            mov      ax, word ptr [0x6ba]
1:0DD1  2b06b606          sub      ax, word ptr [0x6b6]
1:0DD5  2d0e00            sub      ax, 0xe
1:0DD8  a3ce06            mov      word ptr [0x6ce], ax
1:0DDB  b9e401            mov      cx, 0x1e4
1:0DDE  1e                push     ds
1:0DDF  51                push     cx
1:0DE0  2bc9              sub      cx, cx
1:0DE2  51                push     cx
1:0DE3  51                push     cx
1:0DE4  ff36c406          push     word ptr [0x6c4]
1:0DE8  ff36c206          push     word ptr [0x6c2]
1:0DEC  ff36a806          push     word ptr [0x6a8]
1:0DF0  8b0eaa06          mov      cx, word ptr [0x6aa]
1:0DF4  83c107            add      cx, 7
1:0DF7  51                push     cx
1:0DF8  8b0eb406          mov      cx, word ptr [0x6b4]
1:0DFC  2b0eb806          sub      cx, word ptr [0x6b8]
1:0E00  890ea606          mov      word ptr [0x6a6], cx
1:0E04  51                push     cx
1:0E05  50                push     ax
1:0E06  ff7606            push     word ptr [bp + 6]
1:0E09  b87000            mov      ax, 0x70
1:0E0C  50                push     ax
1:0E0D  ff36ae11          push     word ptr [0x11ae]
1:0E11  2bc0              sub      ax, ax
1:0E13  50                push     ax
1:0E14  50                push     ax
1:0E15  9affff0000        lcall    0, 0xffff  ; @1:USER.CreateWindow
1:0E1A  a3c006            mov      word ptr [0x6c0], ax
1:0E1D  0bc0              or       ax, ax
1:0E1F  7439              je       0xe5a
1:0E21  ff7606            push     word ptr [bp + 6]
1:0E24  b87000            mov      ax, 0x70
1:0E27  50                push     ax
1:0E28  b81504            mov      ax, 0x415
1:0E2B  50                push     ax
1:0E2C  b8c800            mov      ax, 0xc8
1:0E2F  50                push     ax
1:0E30  2bc0              sub      ax, ax
1:0E32  50                push     ax
1:0E33  50                push     ax
1:0E34  9a960e0000        lcall    0, 0xe96  ; @1:USER.SendDlgItemMessage
1:0E39  ff36c006          push     word ptr [0x6c0]
1:0E3D  b80500            mov      ax, 5
1:0E40  50                push     ax
1:0E41  9affff0000        lcall    0, 0xffff  ; @1:USER.ShowWindow
1:0E46  eb27              jmp      0xe6f
1:0E48  c706c2064500      mov      word ptr [0x6c2], 0x45
1:0E4E  e930ff            jmp      0xd81
1:0E51  c706c2064600      mov      word ptr [0x6c2], 0x46
1:0E57  e927ff            jmp      0xd81
1:0E5A  ff7606            push     word ptr [bp + 6]
1:0E5D  b8ef01            mov      ax, 0x1ef
1:0E60  1e                push     ds
1:0E61  50                push     ax
1:0E62  b8e901            mov      ax, 0x1e9
1:0E65  1e                push     ds
1:0E66  50                push     ax
1:0E67  2bc0              sub      ax, ax
1:0E69  50                push     ax
1:0E6A  9affff0000        lcall    0, 0xffff  ; @1:USER.MessageBox
1:0E6F  4d                dec      bp
1:0E70  4d                dec      bp
1:0E71  8be5              mov      sp, bp
1:0E73  1f                pop      ds
1:0E74  5d                pop      bp
1:0E75  4d                dec      bp
1:0E76  cb                retf     
1:0E77  1e                push     ds
1:0E78  58                pop      ax
1:0E79  90                nop      
1:0E7A  45                inc      bp
1:0E7B  55                push     bp
1:0E7C  8bec              mov      bp, sp
1:0E7E  1e                push     ds
1:0E7F  8ed8              mov      ds, ax
1:0E81  ff7606            push     word ptr [bp + 6]
1:0E84  b86d00            mov      ax, 0x6d
1:0E87  50                push     ax
1:0E88  b80c04            mov      ax, 0x40c
1:0E8B  50                push     ax
1:0E8C  b8ffff            mov      ax, 0xffff
1:0E8F  50                push     ax
1:0E90  b8b211            mov      ax, 0x11b2
1:0E93  1e                push     ds
1:0E94  50                push     ax
1:0E95  9abb0e0000        lcall    0, 0xebb  ; @1:USER.SendDlgItemMessage
1:0E9A  a3d206            mov      word ptr [0x6d2], ax
1:0E9D  0bc0              or       ax, ax
1:0E9F  7d06              jge      0xea7
1:0EA1  c706d2060000      mov      word ptr [0x6d2], 0
1:0EA7  ff7606            push     word ptr [bp + 6]
1:0EAA  b86d00            mov      ax, 0x6d
1:0EAD  50                push     ax
1:0EAE  b80e04            mov      ax, 0x40e
1:0EB1  50                push     ax
1:0EB2  ff36d206          push     word ptr [0x6d2]
1:0EB6  2bc9              sub      cx, cx
1:0EB8  51                push     cx
1:0EB9  51                push     cx
1:0EBA  9acf070000        lcall    0, 0x7cf  ; @1:USER.SendDlgItemMessage
1:0EBF  ff7606            push     word ptr [bp + 6]
1:0EC2  b88e00            mov      ax, 0x8e
1:0EC5  50                push     ax
1:0EC6  b80e04            mov      ax, 0x40e
1:0EC9  50                push     ax
1:0ECA  ff36bc00          push     word ptr [0xbc]
1:0ECE  2bc9              sub      cx, cx
1:0ED0  51                push     cx
1:0ED1  51                push     cx
1:0ED2  9aeb0e0000        lcall    0, 0xeeb  ; @1:USER.SendDlgItemMessage
1:0ED7  ff7606            push     word ptr [bp + 6]
1:0EDA  b8ab00            mov      ax, 0xab
1:0EDD  50                push     ax
1:0EDE  b80e04            mov      ax, 0x40e
1:0EE1  50                push     ax
1:0EE2  ff36ba00          push     word ptr [0xba]
1:0EE6  2bc0              sub      ax, ax
1:0EE8  50                push     ax
1:0EE9  50                push     ax
1:0EEA  9a590f0000        lcall    0, 0xf59  ; @1:USER.SendDlgItemMessage
1:0EEF  ff7606            push     word ptr [bp + 6]
1:0EF2  b88c00            mov      ax, 0x8c
1:0EF5  50                push     ax
1:0EF6  ff36b800          push     word ptr [0xb8]
1:0EFA  9a0b0f0000        lcall    0, 0xf0b  ; @1:USER.CheckDlgButton
1:0EFF  ff7606            push     word ptr [bp + 6]
1:0F02  b88d00            mov      ax, 0x8d
1:0F05  50                push     ax
1:0F06  ff36b200          push     word ptr [0xb2]
1:0F0A  9a1b0f0000        lcall    0, 0xf1b  ; @1:USER.CheckDlgButton
1:0F0F  ff7606            push     word ptr [bp + 6]
1:0F12  b88b00            mov      ax, 0x8b
1:0F15  50                push     ax
1:0F16  ff36b400          push     word ptr [0xb4]
1:0F1A  9a35100000        lcall    0, 0x1035  ; @1:USER.CheckDlgButton
1:0F1F  ff7606            push     word ptr [bp + 6]
1:0F22  0e                push     cs
1:0F23  e811fe            call     0xd37
1:0F26  5b                pop      bx
1:0F27  4d                dec      bp
1:0F28  4d                dec      bp
1:0F29  8be5              mov      sp, bp
1:0F2B  1f                pop      ds
1:0F2C  5d                pop      bp
1:0F2D  4d                dec      bp
1:0F2E  cb                retf     
1:0F2F  1e                push     ds
1:0F30  58                pop      ax
1:0F31  90                nop      
1:0F32  45                inc      bp
1:0F33  55                push     bp
1:0F34  8bec              mov      bp, sp
1:0F36  1e                push     ds
1:0F37  8ed8              mov      ds, ax
1:0F39  c7069c070000      mov      word ptr [0x79c], 0
1:0F3F  ff7606            push     word ptr [bp + 6]
1:0F42  b86e00            mov      ax, 0x6e
1:0F45  50                push     ax
1:0F46  b80304            mov      ax, 0x403
1:0F49  50                push     ax
1:0F4A  2bc0              sub      ax, ax
1:0F4C  50                push     ax
1:0F4D  8b1e9c07          mov      bx, word ptr [0x79c]
1:0F51  d1e3              shl      bx, 1
1:0F53  1e                push     ds
1:0F54  ffb78000          push     word ptr [bx + 0x80]
1:0F58  9a930f0000        lcall    0, 0xf93  ; @1:USER.SendDlgItemMessage
1:0F5D  ff069c07          inc      word ptr [0x79c]
1:0F61  833e9c070a        cmp      word ptr [0x79c], 0xa
1:0F66  7cd7              jl       0xf3f
1:0F68  c41e2609          les      bx, ptr [0x926]
1:0F6C  26837f0a04        cmp      word ptr es:[bx + 0xa], 4
1:0F71  7c40              jl       0xfb3
1:0F73  c7069c070000      mov      word ptr [0x79c], 0
1:0F79  ff7606            push     word ptr [bp + 6]
1:0F7C  b88e00            mov      ax, 0x8e
1:0F7F  50                push     ax
1:0F80  b80304            mov      ax, 0x403
1:0F83  50                push     ax
1:0F84  2bc0              sub      ax, ax
1:0F86  50                push     ax
1:0F87  8b1e9c07          mov      bx, word ptr [0x79c]
1:0F8B  d1e3              shl      bx, 1
1:0F8D  1e                push     ds
1:0F8E  ffb79c00          push     word ptr [bx + 0x9c]
1:0F92  9ac70f0000        lcall    0, 0xfc7  ; @1:USER.SendDlgItemMessage
1:0F97  ff069c07          inc      word ptr [0x79c]
1:0F9B  833e9c0707        cmp      word ptr [0x79c], 7
1:0FA0  7cd7              jl       0xf79
1:0FA2  ff7606            push     word ptr [bp + 6]
1:0FA5  b88e00            mov      ax, 0x8e
1:0FA8  50                push     ax
1:0FA9  b80e04            mov      ax, 0x40e
1:0FAC  50                push     ax
1:0FAD  ff36bc00          push     word ptr [0xbc]
1:0FB1  eb26              jmp      0xfd9
1:0FB3  ff7606            push     word ptr [bp + 6]
1:0FB6  b88e00            mov      ax, 0x8e
1:0FB9  50                push     ax
1:0FBA  b90304            mov      cx, 0x403
1:0FBD  51                push     cx
1:0FBE  2bc9              sub      cx, cx
1:0FC0  51                push     cx
1:0FC1  1e                push     ds
1:0FC2  ff369c00          push     word ptr [0x9c]
1:0FC6  9ade0f0000        lcall    0, 0xfde  ; @1:USER.SendDlgItemMessage
1:0FCB  ff7606            push     word ptr [bp + 6]
1:0FCE  b88e00            mov      ax, 0x8e
1:0FD1  50                push     ax
1:0FD2  b80e04            mov      ax, 0x40e
1:0FD5  50                push     ax
1:0FD6  2bc0              sub      ax, ax
1:0FD8  50                push     ax
1:0FD9  2bc0              sub      ax, ax
1:0FDB  50                push     ax
1:0FDC  50                push     ax
1:0FDD  9a02100000        lcall    0, 0x1002  ; @1:USER.SendDlgItemMessage
1:0FE2  c7069c070000      mov      word ptr [0x79c], 0
1:0FE8  ff7606            push     word ptr [bp + 6]
1:0FEB  b8ab00            mov      ax, 0xab
1:0FEE  50                push     ax
1:0FEF  b80304            mov      ax, 0x403
1:0FF2  50                push     ax
1:0FF3  2bc0              sub      ax, ax
1:0FF5  50                push     ax
1:0FF6  8b1e9c07          mov      bx, word ptr [0x79c]
1:0FFA  d1e3              shl      bx, 1
1:0FFC  1e                push     ds
1:0FFD  ffb7aa00          push     word ptr [bx + 0xaa]
1:1001  9a25100000        lcall    0, 0x1025  ; @1:USER.SendDlgItemMessage
1:1006  ff069c07          inc      word ptr [0x79c]
1:100A  833e9c0703        cmp      word ptr [0x79c], 3
1:100F  7cd7              jl       0xfe8
1:1011  ff7606            push     word ptr [bp + 6]
1:1014  b8ab00            mov      ax, 0xab
1:1017  50                push     ax
1:1018  b80e04            mov      ax, 0x40e
1:101B  50                push     ax
1:101C  ff36ba00          push     word ptr [0xba]
1:1020  2bc0              sub      ax, ax
1:1022  50                push     ax
1:1023  50                push     ax
1:1024  9a71110000        lcall    0, 0x1171  ; @1:USER.SendDlgItemMessage
1:1029  ff7606            push     word ptr [bp + 6]
1:102C  b88c00            mov      ax, 0x8c
1:102F  50                push     ax
1:1030  ff36b800          push     word ptr [0xb8]
1:1034  9a45100000        lcall    0, 0x1045  ; @1:USER.CheckDlgButton
1:1039  ff7606            push     word ptr [bp + 6]
1:103C  b88d00            mov      ax, 0x8d
1:103F  50                push     ax
1:1040  ff36b200          push     word ptr [0xb2]
1:1044  9a55100000        lcall    0, 0x1055  ; @1:USER.CheckDlgButton
1:1049  ff7606            push     word ptr [bp + 6]
1:104C  b88b00            mov      ax, 0x8b
1:104F  50                push     ax
1:1050  ff36b400          push     word ptr [0xb4]
1:1054  9affff0000        lcall    0, 0xffff  ; @1:USER.CheckDlgButton
1:1059  4d                dec      bp
1:105A  4d                dec      bp
1:105B  8be5              mov      sp, bp
1:105D  1f                pop      ds
1:105E  5d                pop      bp
1:105F  4d                dec      bp
1:1060  cb                retf     
1:1061  1e                push     ds
1:1062  58                pop      ax
1:1063  90                nop      
1:1064  45                inc      bp
1:1065  55                push     bp
1:1066  8bec              mov      bp, sp
1:1068  1e                push     ds
1:1069  8ed8              mov      ds, ax
1:106B  83ec04            sub      sp, 4
1:106E  56                push     si
1:106F  c746fc0000        mov      word ptr [bp - 4], 0
1:1074  b8f600            mov      ax, 0xf6
1:1077  f76efc            imul     word ptr [bp - 4]
1:107A  8bd8              mov      bx, ax
1:107C  c787240a0000      mov      word ptr [bx + 0xa24], 0
1:1082  c787fe090c00      mov      word ptr [bx + 0x9fe], 0xc
1:1088  2bc0              sub      ax, ax
1:108A  8987f809          mov      word ptr [bx + 0x9f8], ax
1:108E  8987fc09          mov      word ptr [bx + 0x9fc], ax
1:1092  8987fa09          mov      word ptr [bx + 0x9fa], ax
1:1096  b80d02            mov      ax, 0x20d
1:1099  50                push     ax
1:109A  8bc3              mov      ax, bx
1:109C  81c3000a          add      bx, 0xa00
1:10A0  53                push     bx
1:10A1  8bf0              mov      si, ax
1:10A3  9abd100000        lcall    0, 0x10bd  ; @1:INT:ord_8(1:1CA2)
1:10A8  5b                pop      bx
1:10A9  5b                pop      bx
1:10AA  2bc0              sub      ax, ax
1:10AC  8984200a          mov      word ptr [si + 0xa20], ax
1:10B0  8984220a          mov      word ptr [si + 0xa22], ax
1:10B4  b81502            mov      ax, 0x215
1:10B7  50                push     ax
1:10B8  b89e07            mov      ax, 0x79e
1:10BB  50                push     ax
1:10BC  9af8100000        lcall    0, 0x10f8  ; @1:INT:ord_8(1:1CA2)
1:10C1  5b                pop      bx
1:10C2  5b                pop      bx
1:10C3  b80a00            mov      ax, 0xa
1:10C6  50                push     ax
1:10C7  b8b207            mov      ax, 0x7b2
1:10CA  50                push     ax
1:10CB  ff76fc            push     word ptr [bp - 4]
1:10CE  9ae1110000        lcall    0, 0x11e1  ; @1:INT:ord_11(1:1CF4)
1:10D3  83c406            add      sp, 6
1:10D6  50                push     ax
1:10D7  b89e07            mov      ax, 0x79e
1:10DA  50                push     ax
1:10DB  9aeb100000        lcall    0, 0x10eb  ; @1:INT:ord_10(1:1C62)
1:10E0  5b                pop      bx
1:10E1  5b                pop      bx
1:10E2  b81d02            mov      ax, 0x21d
1:10E5  50                push     ax
1:10E6  b89e07            mov      ax, 0x79e
1:10E9  50                push     ax
1:10EA  9aee110000        lcall    0, 0x11ee  ; @1:INT:ord_10(1:1C62)
1:10EF  5b                pop      bx
1:10F0  5b                pop      bx
1:10F1  50                push     ax
1:10F2  81c6260a          add      si, 0xa26
1:10F6  56                push     si
1:10F7  9acf110000        lcall    0, 0x11cf  ; @1:INT:ord_8(1:1CA2)
1:10FC  5b                pop      bx
1:10FD  5b                pop      bx
1:10FE  ff46fc            inc      word ptr [bp - 4]
1:1101  837efc08          cmp      word ptr [bp - 4], 8
1:1105  7d03              jge      0x110a
1:1107  e96aff            jmp      0x1074
1:110A  5e                pop      si
1:110B  4d                dec      bp
1:110C  4d                dec      bp
1:110D  8be5              mov      sp, bp
1:110F  1f                pop      ds
1:1110  5d                pop      bp
1:1111  4d                dec      bp
1:1112  cb                retf     
1:1113  1e                push     ds
1:1114  58                pop      ax
1:1115  90                nop      
1:1116  45                inc      bp
1:1117  55                push     bp
1:1118  8bec              mov      bp, sp
1:111A  1e                push     ds
1:111B  8ed8              mov      ds, ax
1:111D  83ec04            sub      sp, 4
1:1120  8b5e08            mov      bx, word ptr [bp + 8]
1:1123  8b07              mov      ax, word ptr [bx]
1:1125  8946fc            mov      word ptr [bp - 4], ax
1:1128  ff36b800          push     word ptr [0xb8]
1:112C  ff36b200          push     word ptr [0xb2]
1:1130  ff36b400          push     word ptr [0xb4]
1:1134  b8b211            mov      ax, 0x11b2
1:1137  50                push     ax
1:1138  ff7606            push     word ptr [bp + 6]
1:113B  0e                push     cs
1:113C  e83bf7            call     0x87a
1:113F  83c40a            add      sp, 0xa
1:1142  8b5e08            mov      bx, word ptr [bp + 8]
1:1145  8907              mov      word ptr [bx], ax
1:1147  837efc00          cmp      word ptr [bp - 4], 0
1:114B  7408              je       0x1155
1:114D  ff76fc            push     word ptr [bp - 4]
1:1150  9a12070000        lcall    0, 0x712  ; @1:GDI.DeleteObject
1:1155  8b5e08            mov      bx, word ptr [bp + 8]
1:1158  833f00            cmp      word ptr [bx], 0
1:115B  741d              je       0x117a
1:115D  ff7606            push     word ptr [bp + 6]
1:1160  b87000            mov      ax, 0x70
1:1163  50                push     ax
1:1164  b83000            mov      ax, 0x30
1:1167  50                push     ax
1:1168  ff37              push     word ptr [bx]
1:116A  b80100            mov      ax, 1
1:116D  99                cdq      
1:116E  52                push     dx
1:116F  50                push     ax
1:1170  9a17120000        lcall    0, 0x1217  ; @1:USER.SendDlgItemMessage
1:1175  b80100            mov      ax, 1
1:1178  eb02              jmp      0x117c
1:117A  2bc0              sub      ax, ax
1:117C  4d                dec      bp
1:117D  4d                dec      bp
1:117E  8be5              mov      sp, bp
1:1180  1f                pop      ds
1:1181  5d                pop      bp
1:1182  4d                dec      bp
1:1183  cb                retf     

; ===== EXPORT:MESSAGEPROC(#4) =====
1:1184  1e                push     ds
1:1185  58                pop      ax
1:1186  90                nop      
1:1187  45                inc      bp
1:1188  55                push     bp
1:1189  8bec              mov      bp, sp
1:118B  1e                push     ds
1:118C  8ed8              mov      ds, ax
1:118E  56                push     si
1:118F  8b460c            mov      ax, word ptr [bp + 0xc]
1:1192  2d1000            sub      ax, 0x10
1:1195  7503              jne      0x119a
1:1197  e96102            jmp      0x13fb
1:119A  2d0800            sub      ax, 8
1:119D  7503              jne      0x11a2
1:119F  e9ac01            jmp      0x134e
1:11A2  48                dec      ax
1:11A3  7503              jne      0x11a8
1:11A5  e92a01            jmp      0x12d2
1:11A8  2df700            sub      ax, 0xf7
1:11AB  7409              je       0x11b6
1:11AD  48                dec      ax
1:11AE  7503              jne      0x11b3
1:11B0  e95902            jmp      0x140c
1:11B3  e9ac01            jmp      0x1362
1:11B6  8b460e            mov      ax, word ptr [bp + 0xe]
1:11B9  a3de11            mov      word ptr [0x11de], ax
1:11BC  0e                push     cs
1:11BD  e8a1fe            call     0x1061
1:11C0  c7068c080000      mov      word ptr [0x88c], 0
1:11C6  b81f02            mov      ax, 0x21f
1:11C9  50                push     ax
1:11CA  b8c407            mov      ax, 0x7c4
1:11CD  50                push     ax
1:11CE  9aac0b0000        lcall    0, 0xbac  ; @1:INT:ord_8(1:1CA2)
1:11D3  5b                pop      bx
1:11D4  5b                pop      bx
1:11D5  b80a00            mov      ax, 0xa
1:11D8  50                push     ax
1:11D9  2bc0              sub      ax, ax
1:11DB  50                push     ax
1:11DC  ff368c08          push     word ptr [0x88c]
1:11E0  9a2b080000        lcall    0, 0x82b  ; @1:INT:ord_11(1:1CF4)
1:11E5  83c406            add      sp, 6
1:11E8  50                push     ax
1:11E9  b8c407            mov      ax, 0x7c4
1:11EC  50                push     ax
1:11ED  9afd110000        lcall    0, 0x11fd  ; @1:INT:ord_10(1:1C62)
1:11F2  5b                pop      bx
1:11F3  5b                pop      bx
1:11F4  b82702            mov      ax, 0x227
1:11F7  50                push     ax
1:11F8  b8c407            mov      ax, 0x7c4
1:11FB  50                push     ax
1:11FC  9ac60c0000        lcall    0, 0xcc6  ; @1:INT:ord_10(1:1C62)
1:1201  5b                pop      bx
1:1202  5b                pop      bx
1:1203  ff760e            push     word ptr [bp + 0xe]
1:1206  b89600            mov      ax, 0x96
1:1209  50                push     ax
1:120A  b80304            mov      ax, 0x403
1:120D  50                push     ax
1:120E  2bc0              sub      ax, ax
1:1210  50                push     ax
1:1211  b8c407            mov      ax, 0x7c4
1:1214  1e                push     ds
1:1215  50                push     ax
1:1216  9a5f120000        lcall    0, 0x125f  ; @1:USER.SendDlgItemMessage
1:121B  ff068c08          inc      word ptr [0x88c]
1:121F  833e8c0808        cmp      word ptr [0x88c], 8
1:1224  7ca0              jl       0x11c6
1:1226  b80100            mov      ax, 1
1:1229  50                push     ax
1:122A  ff760e            push     word ptr [bp + 0xe]
1:122D  0e                push     cs
1:122E  e838f8            call     0xa69
1:1231  5b                pop      bx
1:1232  5b                pop      bx
1:1233  ff760e            push     word ptr [bp + 0xe]
1:1236  0e                push     cs
1:1237  e8f5fc            call     0xf2f
1:123A  5b                pop      bx
1:123B  b8ffff            mov      ax, 0xffff
1:123E  baff00            mov      dx, 0xff
1:1241  52                push     dx
1:1242  50                push     ax
1:1243  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateSolidBrush
1:1248  a39808            mov      word ptr [0x898], ax
1:124B  ff760e            push     word ptr [bp + 0xe]
1:124E  b86e00            mov      ax, 0x6e
1:1251  50                push     ax
1:1252  b80104            mov      ax, 0x401
1:1255  50                push     ax
1:1256  b80300            mov      ax, 3
1:1259  50                push     ax
1:125A  2bc0              sub      ax, ax
1:125C  50                push     ax
1:125D  50                push     ax
1:125E  9a4d0b0000        lcall    0, 0xb4d  ; @1:USER.SendDlgItemMessage
1:1263  ff760e            push     word ptr [bp + 0xe]
1:1266  b8b807            mov      ax, 0x7b8
1:1269  1e                push     ds
1:126A  50                push     ax
1:126B  9a9a0d0000        lcall    0, 0xd9a  ; @1:USER.GetWindowRect
1:1270  ff760e            push     word ptr [bp + 0xe]
1:1273  2bc0              sub      ax, ax
1:1275  50                push     ax
1:1276  9a96120000        lcall    0, 0x1296  ; @1:USER.GetSystemMetrics
1:127B  99                cdq      
1:127C  2bc2              sub      ax, dx
1:127E  d1f8              sar      ax, 1
1:1280  8bc8              mov      cx, ax
1:1282  a1b807            mov      ax, word ptr [0x7b8]
1:1285  2b06bc07          sub      ax, word ptr [0x7bc]
1:1289  99                cdq      
1:128A  2bc2              sub      ax, dx
1:128C  d1f8              sar      ax, 1
1:128E  03c8              add      cx, ax
1:1290  51                push     cx
1:1291  b80100            mov      ax, 1
1:1294  50                push     ax
1:1295  9affff0000        lcall    0, 0xffff  ; @1:USER.GetSystemMetrics
1:129A  99                cdq      
1:129B  2bc2              sub      ax, dx
1:129D  d1f8              sar      ax, 1
1:129F  8bc8              mov      cx, ax
1:12A1  a1ba07            mov      ax, word ptr [0x7ba]
1:12A4  2b06be07          sub      ax, word ptr [0x7be]
1:12A8  99                cdq      
1:12A9  2bc2              sub      ax, dx
1:12AB  d1f8              sar      ax, 1
1:12AD  03c8              add      cx, ax
1:12AF  83c114            add      cx, 0x14
1:12B2  51                push     cx
1:12B3  a1bc07            mov      ax, word ptr [0x7bc]
1:12B6  2b06b807          sub      ax, word ptr [0x7b8]
1:12BA  50                push     ax
1:12BB  a1be07            mov      ax, word ptr [0x7be]
1:12BE  2b06ba07          sub      ax, word ptr [0x7ba]
1:12C2  50                push     ax
1:12C3  b80100            mov      ax, 1
1:12C6  50                push     ax
1:12C7  9affff0000        lcall    0, 0xffff  ; @1:USER.MoveWindow
1:12CC  b80100            mov      ax, 1
1:12CF  e9da04            jmp      0x17ac
1:12D2  8b4608            mov      ax, word ptr [bp + 8]
1:12D5  48                dec      ax
1:12D6  7403              je       0x12db
1:12D8  e98700            jmp      0x1362
1:12DB  ff7606            push     word ptr [bp + 6]
1:12DE  9affff0000        lcall    0, 0xffff  ; @1:USER.GetDlgCtrlID
1:12E3  3d7000            cmp      ax, 0x70
1:12E6  757a              jne      0x1362
1:12E8  ff760a            push     word ptr [bp + 0xa]
1:12EB  b80500            mov      ax, 5
1:12EE  50                push     ax
1:12EF  9affff0000        lcall    0, 0xffff  ; @1:USER.GetSysColor
1:12F4  52                push     dx
1:12F5  50                push     ax
1:12F6  9af3010000        lcall    0, 0x1f3  ; @1:GDI.SetBkColor
1:12FB  b80100            mov      ax, 1
1:12FE  50                push     ax
1:12FF  ff36bc00          push     word ptr [0xbc]
1:1303  0e                push     cs
1:1304  e8f5f0            call     0x3fc
1:1307  5b                pop      bx
1:1308  5b                pop      bx
1:1309  a3c007            mov      word ptr [0x7c0], ax
1:130C  8916c207          mov      word ptr [0x7c2], dx
1:1310  ff760a            push     word ptr [bp + 0xa]
1:1313  52                push     dx
1:1314  50                push     ax
1:1315  9ae7010000        lcall    0, 0x1e7  ; @1:GDI.SetTextColor
1:131A  ff369808          push     word ptr [0x898]
1:131E  9affff0000        lcall    0, 0xffff  ; @1:GDI.UnrealizeObject
1:1323  2bc0              sub      ax, ax
1:1325  a39008            mov      word ptr [0x890], ax
1:1328  a38e08            mov      word ptr [0x88e], ax
1:132B  ff760e            push     word ptr [bp + 0xe]
1:132E  b88e08            mov      ax, 0x88e
1:1331  1e                push     ds
1:1332  50                push     ax
1:1333  9affff0000        lcall    0, 0xffff  ; @1:USER.ClientToScreen
1:1338  ff760a            push     word ptr [bp + 0xa]
1:133B  ff368e08          push     word ptr [0x88e]
1:133F  ff369008          push     word ptr [0x890]
1:1343  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBrushOrg
1:1348  a19808            mov      ax, word ptr [0x898]
1:134B  e95e04            jmp      0x17ac
1:134E  ff760e            push     word ptr [bp + 0xe]
1:1351  0e                push     cs
1:1352  e8e2f9            call     0xd37
1:1355  5b                pop      bx
1:1356  ff760e            push     word ptr [bp + 0xe]
1:1359  0e                push     cs
1:135A  e8b604            call     0x1813
1:135D  5b                pop      bx
1:135E  0bc0              or       ax, ax
1:1360  7505              jne      0x1367
1:1362  2bc0              sub      ax, ax
1:1364  e94504            jmp      0x17ac
1:1367  ff760e            push     word ptr [bp + 0xe]
1:136A  b86d00            mov      ax, 0x6d
1:136D  50                push     ax
1:136E  b80c04            mov      ax, 0x40c
1:1371  50                push     ax
1:1372  b8ffff            mov      ax, 0xffff
1:1375  50                push     ax
1:1376  b8b211            mov      ax, 0x11b2
1:1379  1e                push     ds
1:137A  50                push     ax
1:137B  9aa2130000        lcall    0, 0x13a2  ; @1:USER.SendDlgItemMessage
1:1380  a38c08            mov      word ptr [0x88c], ax
1:1383  3dffff            cmp      ax, 0xffff
1:1386  7506              jne      0x138e
1:1388  c7068c080000      mov      word ptr [0x88c], 0
1:138E  ff760e            push     word ptr [bp + 0xe]
1:1391  b86d00            mov      ax, 0x6d
1:1394  50                push     ax
1:1395  b80e04            mov      ax, 0x40e
1:1398  50                push     ax
1:1399  ff368c08          push     word ptr [0x88c]
1:139D  2bc0              sub      ax, ax
1:139F  50                push     ax
1:13A0  50                push     ax
1:13A1  9add130000        lcall    0, 0x13dd  ; @1:USER.SendDlgItemMessage
1:13A6  ff36b800          push     word ptr [0xb8]
1:13AA  ff36b200          push     word ptr [0xb2]
1:13AE  ff36b400          push     word ptr [0xb4]
1:13B2  b8b211            mov      ax, 0x11b2
1:13B5  50                push     ax
1:13B6  ff760e            push     word ptr [bp + 0xe]
1:13B9  0e                push     cs
1:13BA  e8bdf4            call     0x87a
1:13BD  83c40a            add      sp, 0xa
1:13C0  a39e08            mov      word ptr [0x89e], ax
1:13C3  0bc0              or       ax, ax
1:13C5  741a              je       0x13e1
1:13C7  ff760e            push     word ptr [bp + 0xe]
1:13CA  b87000            mov      ax, 0x70
1:13CD  50                push     ax
1:13CE  b83000            mov      ax, 0x30
1:13D1  50                push     ax
1:13D2  ff369e08          push     word ptr [0x89e]
1:13D6  b80100            mov      ax, 1
1:13D9  99                cdq      
1:13DA  52                push     dx
1:13DB  50                push     ax
1:13DC  9aa1140000        lcall    0, 0x14a1  ; @1:USER.SendDlgItemMessage
1:13E1  ff760e            push     word ptr [bp + 0xe]
1:13E4  b87000            mov      ax, 0x70
1:13E7  50                push     ax
1:13E8  9ae9140000        lcall    0, 0x14e9  ; @1:USER.GetDlgItem
1:13ED  50                push     ax
1:13EE  b8c000            mov      ax, 0xc0
1:13F1  1e                push     ds
1:13F2  50                push     ax
1:13F3  9ae9080000        lcall    0, 0x8e9  ; @1:USER.SetWindowText
1:13F8  e967ff            jmp      0x1362
1:13FB  ff760e            push     word ptr [bp + 0xe]
1:13FE  b81101            mov      ax, 0x111
1:1401  50                push     ax
1:1402  b87200            mov      ax, 0x72
1:1405  50                push     ax
1:1406  2bc0              sub      ax, ax
1:1408  50                push     ax
1:1409  e97f01            jmp      0x158b
1:140C  8b460a            mov      ax, word ptr [bp + 0xa]
1:140F  3dab00            cmp      ax, 0xab
1:1412  7503              jne      0x1417
1:1414  e9ac00            jmp      0x14c3
1:1417  7603              jbe      0x141c
1:1419  e946ff            jmp      0x1362
1:141C  fec8              dec      al
1:141E  7503              jne      0x1423
1:1420  e95701            jmp      0x157a
1:1423  2c6c              sub      al, 0x6c
1:1425  7460              je       0x1487
1:1427  fec8              dec      al
1:1429  7503              jne      0x142e
1:142B  e96601            jmp      0x1594
1:142E  2c03              sub      al, 3
1:1430  7503              jne      0x1435
1:1432  e92303            jmp      0x1758
1:1435  fec8              dec      al
1:1437  7503              jne      0x143c
1:1439  e93b03            jmp      0x1777
1:143C  2c19              sub      al, 0x19
1:143E  7503              jne      0x1443
1:1440  e91501            jmp      0x1558
1:1443  fec8              dec      al
1:1445  7503              jne      0x144a
1:1447  e9ca00            jmp      0x1514
1:144A  fec8              dec      al
1:144C  7503              jne      0x1451
1:144E  e9e500            jmp      0x1536
1:1451  fec8              dec      al
1:1453  740a              je       0x145f
1:1455  2c08              sub      al, 8
1:1457  7503              jne      0x145c
1:1459  e9c201            jmp      0x161e
1:145C  e903ff            jmp      0x1362
1:145F  8b4608            mov      ax, word ptr [bp + 8]
1:1462  48                dec      ax
1:1463  7403              je       0x1468
1:1465  e9b200            jmp      0x151a
1:1468  ff760e            push     word ptr [bp + 0xe]
1:146B  0e                push     cs
1:146C  e872f5            call     0x9e1
1:146F  5b                pop      bx
1:1470  a3c007            mov      word ptr [0x7c0], ax
1:1473  8916c207          mov      word ptr [0x7c2], dx
1:1477  b89e08            mov      ax, 0x89e
1:147A  50                push     ax
1:147B  ff760e            push     word ptr [bp + 0xe]
1:147E  0e                push     cs
1:147F  e891fc            call     0x1113
1:1482  5b                pop      bx
1:1483  5b                pop      bx
1:1484  e9dbfe            jmp      0x1362
1:1487  8b4608            mov      ax, word ptr [bp + 8]
1:148A  48                dec      ax
1:148B  7403              je       0x1490
1:148D  e98a00            jmp      0x151a
1:1490  ff760e            push     word ptr [bp + 0xe]
1:1493  b86d00            mov      ax, 0x6d
1:1496  50                push     ax
1:1497  b90704            mov      cx, 0x407
1:149A  51                push     cx
1:149B  2bc9              sub      cx, cx
1:149D  51                push     cx
1:149E  51                push     cx
1:149F  51                push     cx
1:14A0  9abd140000        lcall    0, 0x14bd  ; @1:USER.SendDlgItemMessage
1:14A5  a38c08            mov      word ptr [0x88c], ax
1:14A8  ff760e            push     word ptr [bp + 0xe]
1:14AB  b86d00            mov      ax, 0x6d
1:14AE  50                push     ax
1:14AF  b80804            mov      ax, 0x408
1:14B2  50                push     ax
1:14B3  ff368c08          push     word ptr [0x88c]
1:14B7  b8b211            mov      ax, 0x11b2
1:14BA  1e                push     ds
1:14BB  50                push     ax
1:14BC  9ada140000        lcall    0, 0x14da  ; @1:USER.SendDlgItemMessage
1:14C1  ebb4              jmp      0x1477
1:14C3  8b4608            mov      ax, word ptr [bp + 8]
1:14C6  48                dec      ax
1:14C7  7551              jne      0x151a
1:14C9  ff760e            push     word ptr [bp + 0xe]
1:14CC  b8ab00            mov      ax, 0xab
1:14CF  50                push     ax
1:14D0  b80704            mov      ax, 0x407
1:14D3  50                push     ax
1:14D4  2bc0              sub      ax, ax
1:14D6  50                push     ax
1:14D7  50                push     ax
1:14D8  50                push     ax
1:14D9  9aaf150000        lcall    0, 0x15af  ; @1:USER.SendDlgItemMessage
1:14DE  a3ba00            mov      word ptr [0xba], ax
1:14E1  ff760e            push     word ptr [bp + 0xe]
1:14E4  b87000            mov      ax, 0x70
1:14E7  50                push     ax
1:14E8  9a4c0d0000        lcall    0, 0xd4c  ; @1:USER.GetDlgItem
1:14ED  50                push     ax
1:14EE  b8c000            mov      ax, 0xc0
1:14F1  1e                push     ds
1:14F2  50                push     ax
1:14F3  b8c800            mov      ax, 0xc8
1:14F6  50                push     ax
1:14F7  9afc000000        lcall    0, 0xfc  ; @1:USER.GetWindowText
1:14FC  ff760e            push     word ptr [bp + 0xe]
1:14FF  0e                push     cs
1:1500  e834f8            call     0xd37
1:1503  5b                pop      bx
1:1504  b89e08            mov      ax, 0x89e
1:1507  50                push     ax
1:1508  ff760e            push     word ptr [bp + 0xe]
1:150B  0e                push     cs
1:150C  e804fc            call     0x1113
1:150F  5b                pop      bx
1:1510  5b                pop      bx
1:1511  e9cdfe            jmp      0x13e1
1:1514  837e0800          cmp      word ptr [bp + 8], 0
1:1518  7403              je       0x151d
1:151A  e945fe            jmp      0x1362
1:151D  833eb80000        cmp      word ptr [0xb8], 0
1:1522  7409              je       0x152d
1:1524  c706b8000000      mov      word ptr [0xb8], 0
1:152A  e94aff            jmp      0x1477
1:152D  c706b8000100      mov      word ptr [0xb8], 1
1:1533  e941ff            jmp      0x1477
1:1536  837e0800          cmp      word ptr [bp + 8], 0
1:153A  7403              je       0x153f
1:153C  e923fe            jmp      0x1362
1:153F  833eb20000        cmp      word ptr [0xb2], 0
1:1544  7409              je       0x154f
1:1546  c706b2000000      mov      word ptr [0xb2], 0
1:154C  e928ff            jmp      0x1477
1:154F  c706b2000100      mov      word ptr [0xb2], 1
1:1555  e91fff            jmp      0x1477
1:1558  837e0800          cmp      word ptr [bp + 8], 0
1:155C  7403              je       0x1561
1:155E  e901fe            jmp      0x1362
1:1561  833eb40000        cmp      word ptr [0xb4], 0
1:1566  7409              je       0x1571
1:1568  c706b4000000      mov      word ptr [0xb4], 0
1:156E  e906ff            jmp      0x1477
1:1571  c706b4000100      mov      word ptr [0xb4], 1
1:1577  e9fdfe            jmp      0x1477
1:157A  ff760e            push     word ptr [bp + 0xe]
1:157D  b81101            mov      ax, 0x111
1:1580  50                push     ax
1:1581  b86e00            mov      ax, 0x6e
1:1584  50                push     ax
1:1585  b80400            mov      ax, 4
1:1588  8bd0              mov      dx, ax
1:158A  52                push     dx
1:158B  50                push     ax
1:158C  9a15010000        lcall    0, 0x115  ; @1:USER.PostMessage
1:1591  e9cefd            jmp      0x1362
1:1594  837e0804          cmp      word ptr [bp + 8], 4
1:1598  753d              jne      0x15d7
1:159A  ff760e            push     word ptr [bp + 0xe]
1:159D  b86e00            mov      ax, 0x6e
1:15A0  50                push     ax
1:15A1  b80d00            mov      ax, 0xd
1:15A4  50                push     ax
1:15A5  b80400            mov      ax, 4
1:15A8  50                push     ax
1:15A9  b8c407            mov      ax, 0x7c4
1:15AC  1e                push     ds
1:15AD  50                push     ax
1:15AE  9aee150000        lcall    0, 0x15ee  ; @1:USER.SendDlgItemMessage
1:15B3  803ec40700        cmp      byte ptr [0x7c4], 0
1:15B8  7503              jne      0x15bd
1:15BA  e9a5fd            jmp      0x1362
1:15BD  b8c407            mov      ax, 0x7c4
1:15C0  50                push     ax
1:15C1  9a13160000        lcall    0, 0x1613  ; @1:INT:ord_14(1:1CF0)
1:15C6  5b                pop      bx
1:15C7  a3b000            mov      word ptr [0xb0], ax
1:15CA  b89e08            mov      ax, 0x89e
1:15CD  50                push     ax
1:15CE  ff760e            push     word ptr [bp + 0xe]
1:15D1  0e                push     cs
1:15D2  e83efb            call     0x1113
1:15D5  5b                pop      bx
1:15D6  5b                pop      bx
1:15D7  8b4608            mov      ax, word ptr [bp + 8]
1:15DA  48                dec      ax
1:15DB  7568              jne      0x1645
1:15DD  ff760e            push     word ptr [bp + 0xe]
1:15E0  b86e00            mov      ax, 0x6e
1:15E3  50                push     ax
1:15E4  b90704            mov      cx, 0x407
1:15E7  51                push     cx
1:15E8  2bc9              sub      cx, cx
1:15EA  51                push     cx
1:15EB  51                push     cx
1:15EC  51                push     cx
1:15ED  9a0a160000        lcall    0, 0x160a  ; @1:USER.SendDlgItemMessage
1:15F2  a38c08            mov      word ptr [0x88c], ax
1:15F5  ff760e            push     word ptr [bp + 0xe]
1:15F8  b86e00            mov      ax, 0x6e
1:15FB  50                push     ax
1:15FC  b80804            mov      ax, 0x408
1:15FF  50                push     ax
1:1600  ff368c08          push     word ptr [0x88c]
1:1604  b8c407            mov      ax, 0x7c4
1:1607  1e                push     ds
1:1608  50                push     ax
1:1609  9ad30e0000        lcall    0, 0xed3  ; @1:USER.SendDlgItemMessage
1:160E  b8c407            mov      ax, 0x7c4
1:1611  50                push     ax
1:1612  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_14(1:1CF0)
1:1617  5b                pop      bx
1:1618  a3b000            mov      word ptr [0xb0], ax
1:161B  e959fe            jmp      0x1477
1:161E  8b4608            mov      ax, word ptr [bp + 8]
1:1621  48                dec      ax
1:1622  7521              jne      0x1645
1:1624  ff760e            push     word ptr [bp + 0xe]
1:1627  b89600            mov      ax, 0x96
1:162A  50                push     ax
1:162B  b80704            mov      ax, 0x407
1:162E  50                push     ax
1:162F  2bc0              sub      ax, ax
1:1631  50                push     ax
1:1632  50                push     ax
1:1633  50                push     ax
1:1634  9a22170000        lcall    0, 0x1722  ; @1:USER.SendDlgItemMessage
1:1639  a39c08            mov      word ptr [0x89c], ax
1:163C  a1be00            mov      ax, word ptr [0xbe]
1:163F  39069c08          cmp      word ptr [0x89c], ax
1:1643  7503              jne      0x1648
1:1645  e91afd            jmp      0x1362
1:1648  833e9c0808        cmp      word ptr [0x89c], 8
1:164D  7d07              jge      0x1656
1:164F  833e9c0800        cmp      word ptr [0x89c], 0
1:1654  7d06              jge      0x165c
1:1656  c7069c080000      mov      word ptr [0x89c], 0
1:165C  b8f600            mov      ax, 0xf6
1:165F  f72e9c08          imul     word ptr [0x89c]
1:1663  8bd8              mov      bx, ax
1:1665  c787240a0100      mov      word ptr [bx + 0xa24], 1
1:166B  b8f600            mov      ax, 0xf6
1:166E  f72ebe00          imul     word ptr [0xbe]
1:1672  8bf0              mov      si, ax
1:1674  c784240a0000      mov      word ptr [si + 0xa24], 0
1:167A  a19c08            mov      ax, word ptr [0x89c]
1:167D  a3be00            mov      word ptr [0xbe], ax
1:1680  8b8ffe09          mov      cx, word ptr [bx + 0x9fe]
1:1684  890eb000          mov      word ptr [0xb0], cx
1:1688  8b8ff809          mov      cx, word ptr [bx + 0x9f8]
1:168C  890eb200          mov      word ptr [0xb2], cx
1:1690  8b8ffc09          mov      cx, word ptr [bx + 0x9fc]
1:1694  890eb400          mov      word ptr [0xb4], cx
1:1698  8b8ffa09          mov      cx, word ptr [bx + 0x9fa]
1:169C  890eb800          mov      word ptr [0xb8], cx
1:16A0  81c3000a          add      bx, 0xa00
1:16A4  53                push     bx
1:16A5  b8b211            mov      ax, 0x11b2
1:16A8  50                push     ax
1:16A9  9ad1160000        lcall    0, 0x16d1  ; @1:INT:ord_8(1:1CA2)
1:16AE  5b                pop      bx
1:16AF  5b                pop      bx
1:16B0  b8f600            mov      ax, 0xf6
1:16B3  f72ebe00          imul     word ptr [0xbe]
1:16B7  8bd8              mov      bx, ax
1:16B9  8b87200a          mov      ax, word ptr [bx + 0xa20]
1:16BD  a3ba00            mov      word ptr [0xba], ax
1:16C0  8b87220a          mov      ax, word ptr [bx + 0xa22]
1:16C4  a3bc00            mov      word ptr [0xbc], ax
1:16C7  81c3260a          add      bx, 0xa26
1:16CB  53                push     bx
1:16CC  b8c000            mov      ax, 0xc0
1:16CF  50                push     ax
1:16D0  9aa4100000        lcall    0, 0x10a4  ; @1:INT:ord_8(1:1CA2)
1:16D5  5b                pop      bx
1:16D6  5b                pop      bx
1:16D7  a19e08            mov      ax, word ptr [0x89e]
1:16DA  a39a08            mov      word ptr [0x89a], ax
1:16DD  ff36b800          push     word ptr [0xb8]
1:16E1  ff36b200          push     word ptr [0xb2]
1:16E5  ff36b400          push     word ptr [0xb4]
1:16E9  b8b211            mov      ax, 0x11b2
1:16EC  50                push     ax
1:16ED  ff760e            push     word ptr [bp + 0xe]
1:16F0  0e                push     cs
1:16F1  e886f1            call     0x87a
1:16F4  83c40a            add      sp, 0xa
1:16F7  a39e08            mov      word ptr [0x89e], ax
1:16FA  ff369a08          push     word ptr [0x89a]
1:16FE  9a83170000        lcall    0, 0x1783  ; @1:GDI.DeleteObject
1:1703  ff760e            push     word ptr [bp + 0xe]
1:1706  0e                push     cs
1:1707  e86df7            call     0xe77
1:170A  5b                pop      bx
1:170B  ff760e            push     word ptr [bp + 0xe]
1:170E  b87000            mov      ax, 0x70
1:1711  50                push     ax
1:1712  b93000            mov      cx, 0x30
1:1715  51                push     cx
1:1716  ff369e08          push     word ptr [0x89e]
1:171A  b90100            mov      cx, 1
1:171D  2bd2              sub      dx, dx
1:171F  52                push     dx
1:1720  51                push     cx
1:1721  9a51170000        lcall    0, 0x1751  ; @1:USER.SendDlgItemMessage
1:1726  ff760e            push     word ptr [bp + 0xe]
1:1729  b87000            mov      ax, 0x70
1:172C  50                push     ax
1:172D  9a60170000        lcall    0, 0x1760  ; @1:USER.GetDlgItem
1:1732  50                push     ax
1:1733  b8c000            mov      ax, 0xc0
1:1736  1e                push     ds
1:1737  50                push     ax
1:1738  9af4130000        lcall    0, 0x13f4  ; @1:USER.SetWindowText
1:173D  ff760e            push     word ptr [bp + 0xe]
1:1740  b87000            mov      ax, 0x70
1:1743  50                push     ax
1:1744  b80104            mov      ax, 0x401
1:1747  50                push     ax
1:1748  2bc0              sub      ax, ax
1:174A  50                push     ax
1:174B  bac700            mov      dx, 0xc7
1:174E  52                push     dx
1:174F  50                push     ax
1:1750  9ae2170000        lcall    0, 0x17e2  ; @1:USER.SendDlgItemMessage
1:1755  e90afc            jmp      0x1362
1:1758  ff760e            push     word ptr [bp + 0xe]
1:175B  b87000            mov      ax, 0x70
1:175E  50                push     ax
1:175F  9ae9130000        lcall    0, 0x13e9  ; @1:USER.GetDlgItem
1:1764  50                push     ax
1:1765  b8c000            mov      ax, 0xc0
1:1768  1e                push     ds
1:1769  50                push     ax
1:176A  b8c800            mov      ax, 0xc8
1:176D  50                push     ax
1:176E  9af8140000        lcall    0, 0x14f8  ; @1:USER.GetWindowText
1:1773  0e                push     cs
1:1774  e8aff4            call     0xc26
1:1777  833e980800        cmp      word ptr [0x898], 0
1:177C  7409              je       0x1787
1:177E  ff369808          push     word ptr [0x898]
1:1782  9a93170000        lcall    0, 0x1793  ; @1:GDI.DeleteObject
1:1787  833e9e0800        cmp      word ptr [0x89e], 0
1:178C  7409              je       0x1797
1:178E  ff369e08          push     word ptr [0x89e]
1:1792  9a51110000        lcall    0, 0x1151  ; @1:GDI.DeleteObject
1:1797  c706de110000      mov      word ptr [0x11de], 0
1:179D  ff760e            push     word ptr [bp + 0xe]
1:17A0  b80100            mov      ax, 1
1:17A3  50                push     ax
1:17A4  9a22010000        lcall    0, 0x122  ; @1:USER.EndDialog
1:17A9  e9b6fb            jmp      0x1362
1:17AC  5e                pop      si
1:17AD  4d                dec      bp
1:17AE  4d                dec      bp
1:17AF  8be5              mov      sp, bp
1:17B1  1f                pop      ds
1:17B2  5d                pop      bp
1:17B3  4d                dec      bp
1:17B4  ca0a00            retf     0xa

; ===== EXPORT:THEFONTS(#3) =====
1:17B7  1e                push     ds
1:17B8  58                pop      ax
1:17B9  90                nop      
1:17BA  45                inc      bp
1:17BB  55                push     bp
1:17BC  8bec              mov      bp, sp
1:17BE  1e                push     ds
1:17BF  8ed8              mov      ds, ax
1:17C1  57                push     di
1:17C2  56                push     si
1:17C3  ff7606            push     word ptr [bp + 6]
1:17C6  b86d00            mov      ax, 0x6d
1:17C9  50                push     ax
1:17CA  b90c04            mov      cx, 0x40c
1:17CD  51                push     cx
1:17CE  b9ffff            mov      cx, 0xffff
1:17D1  51                push     cx
1:17D2  8b4e10            mov      cx, word ptr [bp + 0x10]
1:17D5  8b5612            mov      dx, word ptr [bp + 0x12]
1:17D8  83c112            add      cx, 0x12
1:17DB  52                push     dx
1:17DC  51                push     cx
1:17DD  8bf1              mov      si, cx
1:17DF  8bfa              mov      di, dx
1:17E1  9a00180000        lcall    0, 0x1800  ; @1:USER.SendDlgItemMessage
1:17E6  3dffff            cmp      ax, 0xffff
1:17E9  7519              jne      0x1804
1:17EB  3bd0              cmp      dx, ax
1:17ED  7515              jne      0x1804
1:17EF  ff7606            push     word ptr [bp + 6]
1:17F2  b86d00            mov      ax, 0x6d
1:17F5  50                push     ax
1:17F6  b80304            mov      ax, 0x403
1:17F9  50                push     ax
1:17FA  2bc0              sub      ax, ax
1:17FC  50                push     ax
1:17FD  57                push     di
1:17FE  56                push     si
1:17FF  9a7c130000        lcall    0, 0x137c  ; @1:USER.SendDlgItemMessage
1:1804  b80100            mov      ax, 1
1:1807  5e                pop      si
1:1808  5f                pop      di
1:1809  4d                dec      bp
1:180A  4d                dec      bp
1:180B  8be5              mov      sp, bp
1:180D  1f                pop      ds
1:180E  5d                pop      bp
1:180F  4d                dec      bp
1:1810  ca0e00            retf     0xe
1:1813  1e                push     ds
1:1814  58                pop      ax
1:1815  90                nop      
1:1816  45                inc      bp
1:1817  55                push     bp
1:1818  8bec              mov      bp, sp
1:181A  1e                push     ds
1:181B  8ed8              mov      ds, ax
1:181D  83ec06            sub      sp, 6
1:1820  b8ffff            mov      ax, 0xffff  ; @1:INT:THEFONTS(1:17B7)
1:1823  baffff            mov      dx, 0xffff  ; @1:INT:THEFONTS(1:17B7)
1:1826  52                push     dx
1:1827  50                push     ax
1:1828  ff36ae11          push     word ptr [0x11ae]
1:182C  9af5180000        lcall    0, 0x18f5  ; @1:KERNEL.MakeProcInstance
1:1831  8946fa            mov      word ptr [bp - 6], ax
1:1834  8956fc            mov      word ptr [bp - 4], dx
1:1837  ff361e09          push     word ptr [0x91e]
1:183B  2bc0              sub      ax, ax
1:183D  50                push     ax
1:183E  50                push     ax
1:183F  52                push     dx
1:1840  ff76fa            push     word ptr [bp - 6]
1:1843  8b4606            mov      ax, word ptr [bp + 6]
1:1846  2bd2              sub      dx, dx
1:1848  52                push     dx
1:1849  50                push     ax
1:184A  9ab6080000        lcall    0, 0x8b6  ; @1:GDI.EnumFonts
1:184F  0bc0              or       ax, ax
1:1851  7410              je       0x1863
1:1853  ff76fc            push     word ptr [bp - 4]
1:1856  ff76fa            push     word ptr [bp - 6]
1:1859  9a6a180000        lcall    0, 0x186a  ; @1:KERNEL.FreeProcInstance
1:185E  b80100            mov      ax, 1
1:1861  eb0d              jmp      0x1870
1:1863  ff76fc            push     word ptr [bp - 4]
1:1866  ff76fa            push     word ptr [bp - 6]
1:1869  9a20190000        lcall    0, 0x1920  ; @1:KERNEL.FreeProcInstance
1:186E  2bc0              sub      ax, ax
1:1870  4d                dec      bp
1:1871  4d                dec      bp
1:1872  8be5              mov      sp, bp
1:1874  1f                pop      ds
1:1875  5d                pop      bp
1:1876  4d                dec      bp
1:1877  cb                retf     

; ===== EXPORT:ord_15(#15) =====
1:1878  1e                push     ds
1:1879  58                pop      ax
1:187A  90                nop      
1:187B  45                inc      bp
1:187C  55                push     bp
1:187D  8bec              mov      bp, sp
1:187F  1e                push     ds
1:1880  8ed8              mov      ds, ax
1:1882  83ec0a            sub      sp, 0xa
1:1885  8b4606            mov      ax, word ptr [bp + 6]
1:1888  e9a000            jmp      0x192b
1:188B  c41e2609          les      bx, ptr [0x926]
1:188F  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:1894  7403              je       0x1899
1:1896  e9a200            jmp      0x193b
1:1899  c7061c090000      mov      word ptr [0x91c], 0
1:189F  0e                push     cs
1:18A0  e859ee            call     0x6fc
1:18A3  b80300            mov      ax, 3
1:18A6  e99400            jmp      0x193d
1:18A9  c41e2609          les      bx, ptr [0x926]
1:18AD  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:18B2  7403              je       0x18b7
1:18B4  e98400            jmp      0x193b
1:18B7  c7061c090000      mov      word ptr [0x91c], 0
1:18BD  ebe4              jmp      0x18a3
1:18BF  c41e2609          les      bx, ptr [0x926]
1:18C3  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:18C8  7471              je       0x193b
1:18CA  b84200            mov      ax, 0x42
1:18CD  50                push     ax
1:18CE  b81027            mov      ax, 0x2710
1:18D1  99                cdq      
1:18D2  52                push     dx
1:18D3  50                push     ax
1:18D4  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalAlloc
1:18D9  8946fc            mov      word ptr [bp - 4], ax
1:18DC  50                push     ax
1:18DD  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalFree
1:18E2  837efc00          cmp      word ptr [bp - 4], 0
1:18E6  743e              je       0x1926
1:18E8  b8ffff            mov      ax, 0xffff  ; @1:INT:MESSAGEPROC(1:1184)
1:18EB  baffff            mov      dx, 0xffff  ; @1:INT:MESSAGEPROC(1:1184)
1:18EE  52                push     dx
1:18EF  50                push     ax
1:18F0  ff36ae11          push     word ptr [0x11ae]
1:18F4  9a9a080000        lcall    0, 0x89a  ; @1:KERNEL.MakeProcInstance
1:18F9  8946f8            mov      word ptr [bp - 8], ax
1:18FC  8956fa            mov      word ptr [bp - 6], dx
1:18FF  ff36ae11          push     word ptr [0x11ae]
1:1903  b82902            mov      ax, 0x229
1:1906  1e                push     ds
1:1907  50                push     ax
1:1908  c41e2609          les      bx, ptr [0x926]
1:190C  26ff7726          push     word ptr es:[bx + 0x26]
1:1910  52                push     dx
1:1911  ff76f8            push     word ptr [bp - 8]
1:1914  9affff0000        lcall    0, 0xffff  ; @1:USER.DialogBox
1:1919  ff76fa            push     word ptr [bp - 6]
1:191C  ff76f8            push     word ptr [bp - 8]
1:191F  9ac1080000        lcall    0, 0x8c1  ; @1:KERNEL.FreeProcInstance
1:1924  eb15              jmp      0x193b
1:1926  b80100            mov      ax, 1
1:1929  eb12              jmp      0x193d
1:192B  0bc0              or       ax, ax
1:192D  7503              jne      0x1932
1:192F  e959ff            jmp      0x188b
1:1932  48                dec      ax
1:1933  7503              jne      0x1938
1:1935  e971ff            jmp      0x18a9
1:1938  48                dec      ax
1:1939  7484              je       0x18bf
1:193B  2bc0              sub      ax, ax
1:193D  4d                dec      bp
1:193E  4d                dec      bp
1:193F  8be5              mov      sp, bp
1:1941  1f                pop      ds
1:1942  5d                pop      bp
1:1943  4d                dec      bp
1:1944  cb                retf     
1:1945  001e5890          add      byte ptr [0x9058], bl
1:1949  45                inc      bp
1:194A  55                push     bp
1:194B  8bec              mov      bp, sp
1:194D  1e                push     ds
1:194E  8ed8              mov      ds, ax
1:1950  837e0a00          cmp      word ptr [bp + 0xa], 0
1:1954  7504              jne      0x195a
1:1956  2bc0              sub      ax, ax
1:1958  eb09              jmp      0x1963
1:195A  8b460e            mov      ax, word ptr [bp + 0xe]
1:195D  a3ae11            mov      word ptr [0x11ae], ax
1:1960  b80100            mov      ax, 1
1:1963  4d                dec      bp
1:1964  4d                dec      bp
1:1965  8be5              mov      sp, bp
1:1967  1f                pop      ds
1:1968  5d                pop      bp
1:1969  4d                dec      bp
1:196A  ca0a00            retf     0xa

; ===== EXPORT:WEP(#2) =====
1:196D  1e                push     ds
1:196E  58                pop      ax
1:196F  90                nop      
1:1970  45                inc      bp
1:1971  55                push     bp
1:1972  8bec              mov      bp, sp
1:1974  1e                push     ds
1:1975  8ed8              mov      ds, ax
1:1977  b80100            mov      ax, 1
1:197A  4d                dec      bp
1:197B  4d                dec      bp
1:197C  8be5              mov      sp, bp
1:197E  1f                pop      ds
1:197F  5d                pop      bp
1:1980  4d                dec      bp
1:1981  ca0200            retf     2

; ===== EXPORT:MODULE(#1) =====
1:1984  1e                push     ds
1:1985  58                pop      ax
1:1986  90                nop      
1:1987  45                inc      bp
1:1988  55                push     bp
1:1989  8bec              mov      bp, sp
1:198B  1e                push     ds
1:198C  8ed8              mov      ds, ax
1:198E  83ec0a            sub      sp, 0xa
1:1991  56                push     si
1:1992  8b4608            mov      ax, word ptr [bp + 8]
1:1995  a31e09            mov      word ptr [0x91e], ax
1:1998  8b4606            mov      ax, word ptr [bp + 6]
1:199B  a3e008            mov      word ptr [0x8e0], ax
1:199E  50                push     ax
1:199F  9abf190000        lcall    0, 0x19bf  ; @1:KERNEL.GlobalLock
1:19A4  a32609            mov      word ptr [0x926], ax
1:19A7  89162809          mov      word ptr [0x928], dx
1:19AB  8bc2              mov      ax, dx
1:19AD  0b062609          or       ax, word ptr [0x926]
1:19B1  7503              jne      0x19b6
1:19B3  e96a01            jmp      0x1b20
1:19B6  c41e2609          les      bx, ptr [0x926]
1:19BA  26ff7720          push     word ptr es:[bx + 0x20]
1:19BE  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalLock
1:19C3  a36812            mov      word ptr [0x1268], ax
1:19C6  89166a12          mov      word ptr [0x126a], dx
1:19CA  8bc2              mov      ax, dx
1:19CC  0b066812          or       ax, word ptr [0x1268]
1:19D0  7503              jne      0x19d5
1:19D2  e94201            jmp      0x1b17
1:19D5  8b460a            mov      ax, word ptr [bp + 0xa]
1:19D8  e90801            jmp      0x1ae3
1:19DB  c41e2609          les      bx, ptr [0x926]
1:19DF  26837f1465        cmp      word ptr es:[bx + 0x14], 0x65
1:19E4  7c0f              jl       0x19f5
1:19E6  26817f36f400      cmp      word ptr es:[bx + 0x36], 0xf4
1:19EC  7507              jne      0x19f5
1:19EE  26837f3878        cmp      word ptr es:[bx + 0x38], 0x78
1:19F3  740e              je       0x1a03
1:19F5  c70632020000      mov      word ptr [0x232], 0
1:19FB  c746fc0500        mov      word ptr [bp - 4], 5
1:1A00  e90701            jmp      0x1b0a
1:1A03  c70632020100      mov      word ptr [0x232], 1
1:1A09  e9fe00            jmp      0x1b0a
1:1A0C  b8a008            mov      ax, 0x8a0
1:1A0F  50                push     ax
1:1A10  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_23(1:1D10)
1:1A15  5b                pop      bx
1:1A16  ff36a008          push     word ptr [0x8a0]
1:1A1A  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_22(1:1D72)
1:1A1F  5b                pop      bx
1:1A20  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_21(1:0130)
1:1A25  eb13              jmp      0x1a3a
1:1A27  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_20(1:03B6)
1:1A2C  eb0c              jmp      0x1a3a
1:1A2E  833e320200        cmp      word ptr [0x232], 0
1:1A33  740b              je       0x1a40
1:1A35  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_19(1:0660)
1:1A3A  8946fc            mov      word ptr [bp - 4], ax
1:1A3D  e9ca00            jmp      0x1b0a
1:1A40  ff361e09          push     word ptr [0x91e]
1:1A44  b800ff            mov      ax, 0xff00
1:1A47  baff00            mov      dx, 0xff
1:1A4A  52                push     dx
1:1A4B  50                push     ax
1:1A4C  9a16130000        lcall    0, 0x1316  ; @1:GDI.SetTextColor
1:1A51  ff361e09          push     word ptr [0x91e]
1:1A55  2bc0              sub      ax, ax
1:1A57  50                push     ax
1:1A58  50                push     ax
1:1A59  9af7120000        lcall    0, 0x12f7  ; @1:GDI.SetBkColor
1:1A5E  ff361e09          push     word ptr [0x91e]
1:1A62  2bc0              sub      ax, ax
1:1A64  50                push     ax
1:1A65  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextAlign
1:1A6A  ff361e09          push     word ptr [0x91e]
1:1A6E  b80100            mov      ax, 1
1:1A71  50                push     ax
1:1A72  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkMode
1:1A77  ff361e09          push     word ptr [0x91e]
1:1A7B  2bc0              sub      ax, ax
1:1A7D  50                push     ax
1:1A7E  50                push     ax
1:1A7F  b83402            mov      ax, 0x234
1:1A82  1e                push     ds
1:1A83  50                push     ax
1:1A84  50                push     ax
1:1A85  9aa80c0000        lcall    0, 0xca8  ; @1:INT:ord_7(1:1CD4)
1:1A8A  5b                pop      bx
1:1A8B  50                push     ax
1:1A8C  9ac0020000        lcall    0, 0x2c0  ; @1:GDI.TextOut
1:1A91  eb77              jmp      0x1b0a
1:1A93  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_18(1:06FC)
1:1A98  eba0              jmp      0x1a3a
1:1A9A  a1ae11            mov      ax, word ptr [0x11ae]
1:1A9D  c41e6812          les      bx, ptr [0x1268]
1:1AA1  26894716          mov      word ptr es:[bx + 0x16], ax
1:1AA5  c746f60000        mov      word ptr [bp - 0xa], 0
1:1AAA  8b46f6            mov      ax, word ptr [bp - 0xa]
1:1AAD  8bf0              mov      si, ax
1:1AAF  d1e6              shl      si, 1
1:1AB1  40                inc      ax
1:1AB2  c41e6812          les      bx, ptr [0x1268]
1:1AB6  2689400e          mov      word ptr es:[bx + si + 0xe], ax
1:1ABA  ff46f6            inc      word ptr [bp - 0xa]
1:1ABD  837ef604          cmp      word ptr [bp - 0xa], 4
1:1AC1  7ce7              jl       0x1aaa
1:1AC3  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_17(1:0720)
1:1AC8  e96fff            jmp      0x1a3a
1:1ACB  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_16(1:0734)
1:1AD0  e967ff            jmp      0x1a3a
1:1AD3  8b460a            mov      ax, word ptr [bp + 0xa]
1:1AD6  2d0700            sub      ax, 7
1:1AD9  50                push     ax
1:1ADA  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_15(1:1878)
1:1ADF  5b                pop      bx
1:1AE0  e957ff            jmp      0x1a3a
1:1AE3  3d0c00            cmp      ax, 0xc
1:1AE6  7722              ja       0x1b0a
1:1AE8  d1e0              shl      ax, 1
1:1AEA  93                xchg     bx, ax
1:1AEB  2effa7f01a        jmp      word ptr cs:[bx + 0x1af0]
1:1AF0  0c1a              or       al, 0x1a
1:1AF2  27                daa      
1:1AF3  1a2e1a93          sbb      ch, byte ptr [0x931a]
1:1AF7  1a0a              sbb      cl, byte ptr [bp + si]
1:1AF9  1b9a1acb          sbb      bx, word ptr [bp + si - 0x34e6]
1:1AFD  1ad3              sbb      dl, bl
1:1AFF  1ad3              sbb      dl, bl
1:1B01  1ad3              sbb      dl, bl
1:1B03  1ad3              sbb      dl, bl
1:1B05  1a0a              sbb      cl, byte ptr [bp + si]
1:1B07  1bdb              sbb      bx, bx
1:1B09  19c4              sbb      sp, ax
1:1B0B  1e                push     ds
1:1B0C  260926ff77        or       word ptr es:[0x77ff], sp
1:1B11  209a1c1b          and      byte ptr [bp + si + 0x1b1c], bl  ; @2:KERNEL.GlobalUnlock
1:1B15  0000              add      byte ptr [bx + si], al
1:1B17  ff36e008          push     word ptr [0x8e0]
1:1B1B  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalUnlock
1:1B20  8b46fc            mov      ax, word ptr [bp - 4]
1:1B23  5e                pop      si
1:1B24  4d                dec      bp
1:1B25  4d                dec      bp
1:1B26  8be5              mov      sp, bp
1:1B28  1f                pop      ds
1:1B29  5d                pop      bp
1:1B2A  4d                dec      bp
1:1B2B  ca0600            retf     6
1:1B2E  0000              add      byte ptr [bx + si], al
1:1B30  0000              add      byte ptr [bx + si], al
1:1B32  0000              add      byte ptr [bx + si], al
1:1B34  0000              add      byte ptr [bx + si], al
1:1B36  0000              add      byte ptr [bx + si], al
1:1B38  0000              add      byte ptr [bx + si], al
1:1B3A  0000              add      byte ptr [bx + si], al
1:1B3C  0000              add      byte ptr [bx + si], al
1:1B3E  0000              add      byte ptr [bx + si], al
1:1B40  c3                ret      
1:1B41  008cd890          add      byte ptr [si - 0x6f28], cl
1:1B45  45                inc      bp
1:1B46  55                push     bp
1:1B47  8bec              mov      bp, sp
1:1B49  1e                push     ds
1:1B4A  8ed8              mov      ds, ax
1:1B4C  8b5e06            mov      bx, word ptr [bp + 6]
1:1B4F  3b1e9f02          cmp      bx, word ptr [0x29f]
1:1B53  7206              jb       0x1b5b
1:1B55  b80009            mov      ax, 0x900
1:1B58  f9                stc      
1:1B59  eb0b              jmp      0x1b66
1:1B5B  b43e              mov      ah, 0x3e
1:1B5D  cd21              int      0x21
1:1B5F  7205              jb       0x1b66
1:1B61  c687a10200        mov      byte ptr [bx + 0x2a1], 0
1:1B66  e9dd04            jmp      0x2046
1:1B69  008cd890          add      byte ptr [si - 0x6f28], cl
1:1B6D  45                inc      bp
1:1B6E  55                push     bp
1:1B6F  8bec              mov      bp, sp
1:1B71  1e                push     ds
1:1B72  8ed8              mov      ds, ax
1:1B74  83ec02            sub      sp, 2
1:1B77  8b5e06            mov      bx, word ptr [bp + 6]
1:1B7A  3b1e9f02          cmp      bx, word ptr [0x29f]
1:1B7E  7206              jb       0x1b86
1:1B80  f9                stc      
1:1B81  b80009            mov      ax, 0x900
1:1B84  eb68              jmp      0x1bee
1:1B86  33c0              xor      ax, ax
1:1B88  8b4e0a            mov      cx, word ptr [bp + 0xa]
1:1B8B  e361              jcxz     0x1bee
1:1B8D  f687a10202        test     byte ptr [bx + 0x2a1], 2
1:1B92  755a              jne      0x1bee
1:1B94  813e7a04d6d6      cmp      word ptr [0x47a], 0xd6d6
1:1B9A  7504              jne      0x1ba0
1:1B9C  ff167c04          call     word ptr [0x47c]
1:1BA0  8b4e0a            mov      cx, word ptr [bp + 0xa]
1:1BA3  8b5608            mov      dx, word ptr [bp + 8]
1:1BA6  b43f              mov      ah, 0x3f
1:1BA8  cd21              int      0x21
1:1BAA  7304              jae      0x1bb0
1:1BAC  b409              mov      ah, 9
1:1BAE  eb3e              jmp      0x1bee
1:1BB0  f687a10280        test     byte ptr [bx + 0x2a1], 0x80
1:1BB5  7437              je       0x1bee
1:1BB7  80a7a102fb        and      byte ptr [bx + 0x2a1], 0xfb
1:1BBC  56                push     si
1:1BBD  57                push     di
1:1BBE  fc                cld      
1:1BBF  8bf2              mov      si, dx
1:1BC1  8bfa              mov      di, dx
1:1BC3  8bc8              mov      cx, ax
1:1BC5  e325              jcxz     0x1bec
1:1BC7  b40d              mov      ah, 0xd
1:1BC9  803c0a            cmp      byte ptr [si], 0xa
1:1BCC  7505              jne      0x1bd3
1:1BCE  808fa10204        or       byte ptr [bx + 0x2a1], 4
1:1BD3  ac                lodsb    al, byte ptr [si]
1:1BD4  3ac4              cmp      al, ah
1:1BD6  7419              je       0x1bf1
1:1BD8  3c1a              cmp      al, 0x1a
1:1BDA  7507              jne      0x1be3
1:1BDC  808fa10202        or       byte ptr [bx + 0x2a1], 2
1:1BE1  eb05              jmp      0x1be8