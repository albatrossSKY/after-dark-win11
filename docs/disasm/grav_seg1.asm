File: raw\unpacked\MODULES\GRAV.AD
Module: 'GRAV' ('Gravity Jan 4, 1990 modified to make faster TDE')
CS:IP=1:13FE  SS:SP=0:0000  AutoDS=2  Heap=1024  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (4): KERNEL, GDI, USER, SOUND
Segments (2):
  SEG  1: CODE off=0x002C0 len=0x1430 min=0x1430 flags=0x0D50 relocs=102
  SEG  2: DATA off=0x01900 len=0x04A2 min=0x04A2 flags=0x0C71 relocs=0
Exports (32):
  ord   1: SEG1:0922 flags=0x03 MODULE
  ord   2: SEG1:090B flags=0x03 WEP
  ord   3: SEG1:13EA flags=0x03 ___EXPORTEDSTUB
  ord   4: SEG1:0C70 flags=0x00 
  ord   5: SEG1:0C90 flags=0x00 
  ord   6: SEG1:0B74 flags=0x00 
  ord   7: SEG1:0CB0 flags=0x00 
  ord   8: SEG1:0C3E flags=0x00 
  ord   9: SEG1:0BA4 flags=0x00 
  ord  10: SEG1:062D flags=0x00 
  ord  11: SEG1:0619 flags=0x00 
  ord  12: SEG1:0605 flags=0x00 
  ord  13: SEG1:05E1 flags=0x00 
  ord  14: SEG1:0AE2 flags=0x00 
  ord  15: SEG1:0284 flags=0x00 
  ord  16: SEG1:01CC flags=0x00 
  ord  17: SEG1:0145 flags=0x00 
  ord  18: SEG1:0B60 flags=0x00 
  ord  19: SEG1:0AFE flags=0x00 
  ord  20: SEG1:08E4 flags=0x00 
  ord  21: SEG1:0D10 flags=0x00 
  ord  22: SEG1:0F54 flags=0x00 
  ord  23: SEG1:0E14 flags=0x00 
  ord  24: SEG1:1086 flags=0x00 
  ord  25: SEG1:10AE flags=0x00 
  ord  26: SEG1:1150 flags=0x00 
  ord  27: SEG1:1114 flags=0x00 
  ord  28: SEG1:117A flags=0x00 
  ord  29: SEG1:10B2 flags=0x00 
  ord  30: SEG1:0E2E flags=0x00 
  ord  31: SEG1:131E flags=0x00 
  ord  32: SEG1:13DA flags=0x00 
Resources (7):
  TYPE_1000        #1               off=0x01DE0 len=    64
  TYPE_1000        #2               off=0x01E20 len=    64
  TYPE_1000        #3               off=0x01E60 len=    64
  TYPE_1000        #4               off=0x01EA0 len=    32
  TYPE_2000        #10              off=0x01EC0 len=    80
  TYPE_2000        #20              off=0x01F10 len=    16
  TYPE_2000        #30              off=0x01F20 len=   320

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
1:001C  ff367803          push     word ptr [0x378]
1:0020  9a97020000        lcall    0, 0x297  ; @1:GDI.CreateCompatibleDC
1:0025  a33003            mov      word ptr [0x330], ax
1:0028  ff367803          push     word ptr [0x378]
1:002C  a17a03            mov      ax, word ptr [0x37a]
1:002F  8bc8              mov      cx, ax
1:0031  d1e0              shl      ax, 1
1:0033  03c1              add      ax, cx
1:0035  50                push     ax
1:0036  51                push     cx
1:0037  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateCompatibleBitmap
1:003C  a37c03            mov      word ptr [0x37c], ax
1:003F  ff363003          push     word ptr [0x330]
1:0043  50                push     ax
1:0044  9a58000000        lcall    0, 0x58  ; @1:GDI.SelectObject
1:0049  ff363003          push     word ptr [0x330]
1:004D  b80400            mov      ax, 4
1:0050  50                push     ax
1:0051  9a82000000        lcall    0, 0x82  ; @1:GDI.GetStockObject
1:0056  50                push     ax
1:0057  9a88000000        lcall    0, 0x88  ; @1:GDI.SelectObject
1:005C  ff363003          push     word ptr [0x330]
1:0060  2bc0              sub      ax, ax
1:0062  50                push     ax
1:0063  50                push     ax
1:0064  ff367a03          push     word ptr [0x37a]
1:0068  ff367a03          push     word ptr [0x37a]
1:006C  b92100            mov      cx, 0x21
1:006F  baf000            mov      dx, 0xf0
1:0072  52                push     dx
1:0073  51                push     cx
1:0074  9ad2000000        lcall    0, 0xd2  ; @1:GDI.PatBlt
1:0079  ff363003          push     word ptr [0x330]
1:007D  b80800            mov      ax, 8
1:0080  50                push     ax
1:0081  9a94000000        lcall    0, 0x94  ; @1:GDI.GetStockObject
1:0086  50                push     ax
1:0087  9a9a000000        lcall    0, 0x9a  ; @1:GDI.SelectObject
1:008C  ff363003          push     word ptr [0x330]
1:0090  2bc0              sub      ax, ax
1:0092  50                push     ax
1:0093  9adf000000        lcall    0, 0xdf  ; @1:GDI.GetStockObject
1:0098  50                push     ax
1:0099  9ae5000000        lcall    0, 0xe5  ; @1:GDI.SelectObject
1:009E  ff363003          push     word ptr [0x330]
1:00A2  2bc0              sub      ax, ax
1:00A4  50                push     ax
1:00A5  50                push     ax
1:00A6  ff367a03          push     word ptr [0x37a]
1:00AA  ff367a03          push     word ptr [0x37a]
1:00AE  9a00010000        lcall    0, 0x100  ; @1:GDI.Ellipse
1:00B3  ff363003          push     word ptr [0x330]
1:00B7  ff367a03          push     word ptr [0x37a]
1:00BB  2bc0              sub      ax, ax
1:00BD  50                push     ax
1:00BE  8b0e7a03          mov      cx, word ptr [0x37a]
1:00C2  d1e1              shl      cx, 1
1:00C4  51                push     cx
1:00C5  ff367a03          push     word ptr [0x37a]
1:00C9  b92100            mov      cx, 0x21
1:00CC  baf000            mov      dx, 0xf0
1:00CF  52                push     dx
1:00D0  51                push     cx
1:00D1  9affff0000        lcall    0, 0xffff  ; @1:GDI.PatBlt
1:00D6  ff363003          push     word ptr [0x330]
1:00DA  b80700            mov      ax, 7
1:00DD  50                push     ax
1:00DE  9a0d010000        lcall    0, 0x10d  ; @1:GDI.GetStockObject
1:00E3  50                push     ax
1:00E4  9a13010000        lcall    0, 0x113  ; @1:GDI.SelectObject
1:00E9  ff363003          push     word ptr [0x330]
1:00ED  ff367a03          push     word ptr [0x37a]
1:00F1  2bc0              sub      ax, ax
1:00F3  50                push     ax
1:00F4  8b0e7a03          mov      cx, word ptr [0x37a]
1:00F8  d1e1              shl      cx, 1
1:00FA  51                push     cx
1:00FB  ff367a03          push     word ptr [0x37a]
1:00FF  9a30010000        lcall    0, 0x130  ; @1:GDI.Ellipse
1:0104  ff363003          push     word ptr [0x330]
1:0108  b80400            mov      ax, 4
1:010B  50                push     ax
1:010C  9a05020000        lcall    0, 0x205  ; @1:GDI.GetStockObject
1:0111  50                push     ax
1:0112  9aa4020000        lcall    0, 0x2a4  ; @1:GDI.SelectObject
1:0117  ff363003          push     word ptr [0x330]
1:011B  a17a03            mov      ax, word ptr [0x37a]
1:011E  d1e0              shl      ax, 1
1:0120  50                push     ax
1:0121  2bc0              sub      ax, ax
1:0123  50                push     ax
1:0124  a17a03            mov      ax, word ptr [0x37a]
1:0127  8bc8              mov      cx, ax
1:0129  d1e0              shl      ax, 1
1:012B  03c1              add      ax, cx
1:012D  50                push     ax
1:012E  51                push     cx
1:012F  9affff0000        lcall    0, 0xffff  ; @1:GDI.Ellipse
1:0134  ff363003          push     word ptr [0x330]
1:0138  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteDC
1:013D  4d                dec      bp
1:013E  4d                dec      bp
1:013F  8be5              mov      sp, bp
1:0141  1f                pop      ds
1:0142  5d                pop      bp
1:0143  4d                dec      bp
1:0144  cb                retf     

; ===== EXPORT:ord_17(#17) =====
1:0145  1e                push     ds
1:0146  58                pop      ax
1:0147  90                nop      
1:0148  45                inc      bp
1:0149  55                push     bp
1:014A  8bec              mov      bp, sp
1:014C  1e                push     ds
1:014D  8ed8              mov      ds, ax
1:014F  83ec08            sub      sp, 8
1:0152  56                push     si
1:0153  c41e9e04          les      bx, ptr [0x49e]
1:0157  268b4706          mov      ax, word ptr es:[bx + 6]
1:015B  a37203            mov      word ptr [0x372], ax
1:015E  268b4708          mov      ax, word ptr es:[bx + 8]
1:0162  a37a03            mov      word ptr [0x37a], ax
1:0165  99                cdq      
1:0166  2bc2              sub      ax, dx
1:0168  d1f8              sar      ax, 1
1:016A  99                cdq      
1:016B  8bc8              mov      cx, ax
1:016D  8bda              mov      bx, dx
1:016F  a37603            mov      word ptr [0x376], ax
1:0172  c4367e03          les      si, ptr [0x37e]
1:0176  268b440c          mov      ax, word ptr es:[si + 0xc]
1:017A  99                cdq      
1:017B  52                push     dx
1:017C  50                push     ax
1:017D  268b440e          mov      ax, word ptr es:[si + 0xe]
1:0181  99                cdq      
1:0182  52                push     dx
1:0183  50                push     ax
1:0184  53                push     bx
1:0185  51                push     cx
1:0186  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:0C3E)
1:018B  52                push     dx
1:018C  50                push     ax
1:018D  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:0CB0)
1:0192  a37403            mov      word ptr [0x374], ax
1:0195  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_6(1:0B74)
1:019A  b90d00            mov      cx, 0xd
1:019D  99                cdq      
1:019E  f7f9              idiv     cx
1:01A0  89169c04          mov      word ptr [0x49c], dx
1:01A4  c746f80000        mov      word ptr [bp - 8], 0
1:01A9  eb09              jmp      0x1b4
1:01AB  50                push     ax
1:01AC  0e                push     cs
1:01AD  e81105            call     0x6c1
1:01B0  5b                pop      bx
1:01B1  ff46f8            inc      word ptr [bp - 8]
1:01B4  8b46f8            mov      ax, word ptr [bp - 8]
1:01B7  39067203          cmp      word ptr [0x372], ax
1:01BB  7fee              jg       0x1ab
1:01BD  0e                push     cs
1:01BE  e851fe            call     0x12
1:01C1  2bc0              sub      ax, ax
1:01C3  5e                pop      si
1:01C4  4d                dec      bp
1:01C5  4d                dec      bp
1:01C6  8be5              mov      sp, bp
1:01C8  1f                pop      ds
1:01C9  5d                pop      bp
1:01CA  4d                dec      bp
1:01CB  cb                retf     

; ===== EXPORT:ord_16(#16) =====
1:01CC  1e                push     ds
1:01CD  58                pop      ax
1:01CE  90                nop      
1:01CF  45                inc      bp
1:01D0  55                push     bp
1:01D1  8bec              mov      bp, sp
1:01D3  1e                push     ds
1:01D4  8ed8              mov      ds, ax
1:01D6  c41e9e04          les      bx, ptr [0x49e]
1:01DA  26837f0a00        cmp      word ptr es:[bx + 0xa], 0
1:01DF  742e              je       0x20f
1:01E1  b83203            mov      ax, 0x332
1:01E4  1e                push     ds
1:01E5  50                push     ax
1:01E6  2bc0              sub      ax, ax
1:01E8  50                push     ax
1:01E9  50                push     ax
1:01EA  26ff7702          push     word ptr es:[bx + 2]
1:01EE  26ff7704          push     word ptr es:[bx + 4]
1:01F2  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:01F7  ff367803          push     word ptr [0x378]
1:01FB  b83203            mov      ax, 0x332
1:01FE  1e                push     ds
1:01FF  50                push     ax
1:0200  b80400            mov      ax, 4
1:0203  50                push     ax
1:0204  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:0209  50                push     ax
1:020A  9affff0000        lcall    0, 0xffff  ; @1:USER.FillRect
1:020F  2bc0              sub      ax, ax
1:0211  4d                dec      bp
1:0212  4d                dec      bp
1:0213  8be5              mov      sp, bp
1:0215  1f                pop      ds
1:0216  5d                pop      bp
1:0217  4d                dec      bp
1:0218  cb                retf     
1:0219  1e                push     ds
1:021A  58                pop      ax
1:021B  90                nop      
1:021C  45                inc      bp
1:021D  55                push     bp
1:021E  8bec              mov      bp, sp
1:0220  1e                push     ds
1:0221  8ed8              mov      ds, ax
1:0223  83ec04            sub      sp, 4
1:0226  c41e9e04          les      bx, ptr [0x49e]
1:022A  26837f0c00        cmp      word ptr es:[bx + 0xc], 0
1:022F  744b              je       0x27c
1:0231  9affff0000        lcall    0, 0xffff  ; @1:SOUND.OpenSound
1:0236  b80100            mov      ax, 1
1:0239  50                push     ax
1:023A  b9e803            mov      cx, 0x3e8
1:023D  51                push     cx
1:023E  9affff0000        lcall    0, 0xffff  ; @1:SOUND.SetVoiceQueueSize
1:0243  b80600            mov      ax, 6
1:0246  50                push     ax
1:0247  b80a00            mov      ax, 0xa
1:024A  50                push     ax
1:024B  9affff0000        lcall    0, 0xffff  ; @1:SOUND.SetSoundNoise
1:0250  b80100            mov      ax, 1
1:0253  50                push     ax
1:0254  b82800            mov      ax, 0x28
1:0257  50                push     ax
1:0258  b86400            mov      ax, 0x64
1:025B  50                push     ax
1:025C  b80a00            mov      ax, 0xa
1:025F  50                push     ax
1:0260  9affff0000        lcall    0, 0xffff  ; @1:SOUND.SetVoiceNote
1:0265  9affff0000        lcall    0, 0xffff  ; @1:SOUND.StartSound
1:026A  2bc0              sub      ax, ax
1:026C  50                push     ax
1:026D  9affff0000        lcall    0, 0xffff  ; @1:SOUND.WaitSoundState
1:0272  9affff0000        lcall    0, 0xffff  ; @1:SOUND.StopSound
1:0277  9affff0000        lcall    0, 0xffff  ; @1:SOUND.CloseSound
1:027C  4d                dec      bp
1:027D  4d                dec      bp
1:027E  8be5              mov      sp, bp
1:0280  1f                pop      ds
1:0281  5d                pop      bp
1:0282  4d                dec      bp
1:0283  cb                retf     

; ===== EXPORT:ord_15(#15) =====
1:0284  1e                push     ds
1:0285  58                pop      ax
1:0286  90                nop      
1:0287  45                inc      bp
1:0288  55                push     bp
1:0289  8bec              mov      bp, sp
1:028B  1e                push     ds
1:028C  8ed8              mov      ds, ax
1:028E  83ec14            sub      sp, 0x14
1:0291  56                push     si
1:0292  ff367803          push     word ptr [0x378]
1:0296  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateCompatibleDC
1:029B  8946ec            mov      word ptr [bp - 0x14], ax
1:029E  50                push     ax
1:029F  ff367c03          push     word ptr [0x37c]
1:02A3  9a5e030000        lcall    0, 0x35e  ; @1:GDI.SelectObject
1:02A8  2bc0              sub      ax, ax
1:02AA  8946f4            mov      word ptr [bp - 0xc], ax
1:02AD  8946fc            mov      word ptr [bp - 4], ax
1:02B0  8946ee            mov      word ptr [bp - 0x12], ax
1:02B3  8946f2            mov      word ptr [bp - 0xe], ax
1:02B6  e9a201            jmp      0x45b
1:02B9  b81c00            mov      ax, 0x1c
1:02BC  f76ef2            imul     word ptr [bp - 0xe]
1:02BF  8bd8              mov      bx, ax
1:02C1  83bf980300        cmp      word ptr [bx + 0x398], 0
1:02C6  7d17              jge      0x2df
1:02C8  b81b00            mov      ax, 0x1b
1:02CB  99                cdq      
1:02CC  52                push     dx
1:02CD  50                push     ax
1:02CE  81c39603          add      bx, 0x396
1:02D2  53                push     bx
1:02D3  8bf3              mov      si, bx
1:02D5  9af2020000        lcall    0, 0x2f2  ; @1:INT:ord_5(1:0C90)
1:02DA  b81e00            mov      ax, 0x1e
1:02DD  eb1a              jmp      0x2f9
1:02DF  b81e00            mov      ax, 0x1e
1:02E2  99                cdq      
1:02E3  52                push     dx
1:02E4  50                push     ax
1:02E5  b81c00            mov      ax, 0x1c
1:02E8  f76ef2            imul     word ptr [bp - 0xe]
1:02EB  059603            add      ax, 0x396
1:02EE  50                push     ax
1:02EF  8bf0              mov      si, ax
1:02F1  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_5(1:0C90)
1:02F6  b81b00            mov      ax, 0x1b
1:02F9  2bd2              sub      dx, dx
1:02FB  52                push     dx
1:02FC  50                push     ax
1:02FD  56                push     si
1:02FE  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_4(1:0C70)
1:0303  b81c00            mov      ax, 0x1c
1:0306  f76ef2            imul     word ptr [bp - 0xe]
1:0309  8bd8              mov      bx, ax
1:030B  83bf9a0300        cmp      word ptr [bx + 0x39a], 0
1:0310  750f              jne      0x321
1:0312  8b879203          mov      ax, word ptr [bx + 0x392]
1:0316  48                dec      ax
1:0317  48                dec      ax
1:0318  3b878803          cmp      ax, word ptr [bx + 0x388]
1:031C  7e03              jle      0x321
1:031E  e9bd00            jmp      0x3de
1:0321  b81c00            mov      ax, 0x1c
1:0324  f76ef2            imul     word ptr [bp - 0xe]
1:0327  8bd8              mov      bx, ax
1:0329  8b878a03          mov      ax, word ptr [bx + 0x38a]
1:032D  89878e03          mov      word ptr [bx + 0x38e], ax
1:0331  8b878c03          mov      ax, word ptr [bx + 0x38c]
1:0335  89879003          mov      word ptr [bx + 0x390], ax
1:0339  8b878603          mov      ax, word ptr [bx + 0x386]
1:033D  89878a03          mov      word ptr [bx + 0x38a], ax
1:0341  8b878803          mov      ax, word ptr [bx + 0x388]
1:0345  89878c03          mov      word ptr [bx + 0x38c], ax
1:0349  ff367803          push     word ptr [0x378]
1:034D  ffb78403          push     word ptr [bx + 0x384]
1:0351  ffb78203          push     word ptr [bx + 0x382]
1:0355  8bf3              mov      si, bx
1:0357  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreateSolidBrush
1:035C  50                push     ax
1:035D  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectObject
1:0362  8946f0            mov      word ptr [bp - 0x10], ax
1:0365  ff367803          push     word ptr [0x378]
1:0369  8b848603          mov      ax, word ptr [si + 0x386]
1:036D  2b067403          sub      ax, word ptr [0x374]
1:0371  50                push     ax
1:0372  8b848803          mov      ax, word ptr [si + 0x388]
1:0376  2b067603          sub      ax, word ptr [0x376]
1:037A  50                push     ax
1:037B  ff367a03          push     word ptr [0x37a]
1:037F  ff367a03          push     word ptr [0x37a]
1:0383  ff76ec            push     word ptr [bp - 0x14]
1:0386  2bc0              sub      ax, ax
1:0388  50                push     ax
1:0389  50                push     ax
1:038A  b94607            mov      cx, 0x746
1:038D  bae200            mov      dx, 0xe2
1:0390  52                push     dx
1:0391  51                push     cx
1:0392  9affff0000        lcall    0, 0xffff  ; @1:GDI.BitBlt
1:0397  ff367803          push     word ptr [0x378]
1:039B  8b848603          mov      ax, word ptr [si + 0x386]
1:039F  2b067403          sub      ax, word ptr [0x374]
1:03A3  50                push     ax
1:03A4  8b848803          mov      ax, word ptr [si + 0x388]
1:03A8  2b067603          sub      ax, word ptr [0x376]
1:03AC  50                push     ax
1:03AD  ff367a03          push     word ptr [0x37a]
1:03B1  ff367a03          push     word ptr [0x37a]
1:03B5  ff76ec            push     word ptr [bp - 0x14]
1:03B8  ff367a03          push     word ptr [0x37a]
1:03BC  2bc0              sub      ax, ax
1:03BE  50                push     ax
1:03BF  b8c600            mov      ax, 0xc6
1:03C2  ba8800            mov      dx, 0x88
1:03C5  52                push     dx
1:03C6  50                push     ax
1:03C7  9a93030000        lcall    0, 0x393  ; @1:GDI.BitBlt
1:03CC  ff367803          push     word ptr [0x378]
1:03D0  ff76f0            push     word ptr [bp - 0x10]
1:03D3  9a45000000        lcall    0, 0x45  ; @1:GDI.SelectObject
1:03D8  50                push     ax
1:03D9  9abc050000        lcall    0, 0x5bc  ; @1:GDI.DeleteObject
1:03DE  b81c00            mov      ax, 0x1c
1:03E1  f76ef2            imul     word ptr [bp - 0xe]
1:03E4  8bd8              mov      bx, ax
1:03E6  83bf9a0301        cmp      word ptr [bx + 0x39a], 1
1:03EB  1bc0              sbb      ax, ax
1:03ED  f7d8              neg      ax
1:03EF  89879a03          mov      word ptr [bx + 0x39a], ax
1:03F3  c4369e04          les      si, ptr [0x49e]
1:03F7  268b4404          mov      ax, word ptr es:[si + 4]
1:03FB  03067603          add      ax, word ptr [0x376]
1:03FF  3b878803          cmp      ax, word ptr [bx + 0x388]
1:0403  7c13              jl       0x418
1:0405  83bf9c0300        cmp      word ptr [bx + 0x39c], 0
1:040A  744c              je       0x458
1:040C  837eee00          cmp      word ptr [bp - 0x12], 0
1:0410  7506              jne      0x418
1:0412  837efc00          cmp      word ptr [bp - 4], 0
1:0416  7440              je       0x458
1:0418  8bde              mov      bx, si
1:041A  26837f0a00        cmp      word ptr es:[bx + 0xa], 0
1:041F  7428              je       0x449
1:0421  a17203            mov      ax, word ptr [0x372]
1:0424  2b46f2            sub      ax, word ptr [bp - 0xe]
1:0427  48                dec      ax
1:0428  751f              jne      0x449
1:042A  0e                push     cs
1:042B  e89efd            call     0x1cc
1:042E  c746f20000        mov      word ptr [bp - 0xe], 0
1:0433  eb03              jmp      0x438
1:0435  ff46f2            inc      word ptr [bp - 0xe]
1:0438  8b46f2            mov      ax, word ptr [bp - 0xe]
1:043B  39067203          cmp      word ptr [0x372], ax
1:043F  7e17              jle      0x458
1:0441  50                push     ax
1:0442  0e                push     cs
1:0443  e87b02            call     0x6c1
1:0446  5b                pop      bx
1:0447  ebec              jmp      0x435
1:0449  26837f0a00        cmp      word ptr es:[bx + 0xa], 0
1:044E  7508              jne      0x458
1:0450  ff76f2            push     word ptr [bp - 0xe]
1:0453  0e                push     cs
1:0454  e86a02            call     0x6c1
1:0457  5b                pop      bx
1:0458  ff46f2            inc      word ptr [bp - 0xe]
1:045B  8b46f2            mov      ax, word ptr [bp - 0xe]
1:045E  39067203          cmp      word ptr [0x372], ax
1:0462  7f03              jg       0x467
1:0464  e95101            jmp      0x5b8
1:0467  b91c00            mov      cx, 0x1c
1:046A  f7e9              imul     cx
1:046C  8bd8              mov      bx, ax
1:046E  8b879403          mov      ax, word ptr [bx + 0x394]
1:0472  01878603          add      word ptr [bx + 0x386], ax
1:0476  b86400            mov      ax, 0x64
1:0479  99                cdq      
1:047A  52                push     dx
1:047B  50                push     ax
1:047C  ffb79803          push     word ptr [bx + 0x398]
1:0480  ffb79603          push     word ptr [bx + 0x396]
1:0484  8bf3              mov      si, bx
1:0486  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:0BA4)
1:048B  8946f6            mov      word ptr [bp - 0xa], ax
1:048E  01848803          add      word ptr [si + 0x388], ax
1:0492  c41e9e04          les      bx, ptr [0x49e]
1:0496  268b4702          mov      ax, word ptr es:[bx + 2]
1:049A  2b067403          sub      ax, word ptr [0x374]
1:049E  3b848603          cmp      ax, word ptr [si + 0x386]
1:04A2  7d0d              jge      0x4b1
1:04A4  89848603          mov      word ptr [si + 0x386], ax
1:04A8  f79c9403          neg      word ptr [si + 0x394]
1:04AC  c746fc0100        mov      word ptr [bp - 4], 1
1:04B1  b81c00            mov      ax, 0x1c
1:04B4  f76ef2            imul     word ptr [bp - 0xe]
1:04B7  8bd8              mov      bx, ax
1:04B9  a17403            mov      ax, word ptr [0x374]
1:04BC  39878603          cmp      word ptr [bx + 0x386], ax
1:04C0  7d0d              jge      0x4cf
1:04C2  89878603          mov      word ptr [bx + 0x386], ax
1:04C6  f79f9403          neg      word ptr [bx + 0x394]
1:04CA  c746ee0100        mov      word ptr [bp - 0x12], 1
1:04CF  b81c00            mov      ax, 0x1c
1:04D2  f76ef2            imul     word ptr [bp - 0xe]
1:04D5  8bd8              mov      bx, ax
1:04D7  83bf9803ff        cmp      word ptr [bx + 0x398], -1
1:04DC  7c2f              jl       0x50d
1:04DE  7f07              jg       0x4e7
1:04E0  83bf96039c        cmp      word ptr [bx + 0x396], -0x64
1:04E5  7626              jbe      0x50d
1:04E7  837ef600          cmp      word ptr [bp - 0xa], 0
1:04EB  7d20              jge      0x50d
1:04ED  f79f9603          neg      word ptr [bx + 0x396]
1:04F1  8397980300        adc      word ptr [bx + 0x398], 0
1:04F6  f79f9803          neg      word ptr [bx + 0x398]
1:04FA  8b879203          mov      ax, word ptr [bx + 0x392]
1:04FE  2d1400            sub      ax, 0x14
1:0501  3b878803          cmp      ax, word ptr [bx + 0x388]
1:0505  7f06              jg       0x50d
1:0507  c7879c030100      mov      word ptr [bx + 0x39c], 1
1:050D  b81c00            mov      ax, 0x1c
1:0510  f76ef2            imul     word ptr [bp - 0xe]
1:0513  8bd8              mov      bx, ax
1:0515  8b879203          mov      ax, word ptr [bx + 0x392]
1:0519  48                dec      ax
1:051A  3b878803          cmp      ax, word ptr [bx + 0x388]
1:051E  7f3a              jg       0x55a
1:0520  c746f40100        mov      word ptr [bp - 0xc], 1
1:0525  83bf980300        cmp      word ptr [bx + 0x398], 0
1:052A  7f11              jg       0x53d
1:052C  7c07              jl       0x535
1:052E  83bf960364        cmp      word ptr [bx + 0x396], 0x64
1:0533  7308              jae      0x53d
1:0535  ff879203          inc      word ptr [bx + 0x392]
1:0539  d1a79403          shl      word ptr [bx + 0x394], 1
1:053D  b81c00            mov      ax, 0x1c
1:0540  f76ef2            imul     word ptr [bp - 0xe]
1:0543  8bd8              mov      bx, ax
1:0545  8b879203          mov      ax, word ptr [bx + 0x392]
1:0549  89878803          mov      word ptr [bx + 0x388], ax
1:054D  f79f9603          neg      word ptr [bx + 0x396]
1:0551  8397980300        adc      word ptr [bx + 0x398], 0
1:0556  f79f9803          neg      word ptr [bx + 0x398]
1:055A  b81c00            mov      ax, 0x1c
1:055D  f76ef2            imul     word ptr [bp - 0xe]
1:0560  8bd8              mov      bx, ax
1:0562  83bf9c0300        cmp      word ptr [bx + 0x39c], 0
1:0567  7405              je       0x56e
1:0569  c746f40000        mov      word ptr [bp - 0xc], 0
1:056E  b81c00            mov      ax, 0x1c
1:0571  f76ef2            imul     word ptr [bp - 0xe]
1:0574  8bd8              mov      bx, ax
1:0576  83bf9803ff        cmp      word ptr [bx + 0x398], -1
1:057B  7d03              jge      0x580
1:057D  e939fd            jmp      0x2b9
1:0580  7f07              jg       0x589
1:0582  83bf96039c        cmp      word ptr [bx + 0x396], -0x64
1:0587  7207              jb       0x590
1:0589  83bf980300        cmp      word ptr [bx + 0x398], 0
1:058E  7c03              jl       0x593
1:0590  e926fd            jmp      0x2b9
1:0593  c78796036400      mov      word ptr [bx + 0x396], 0x64
1:0599  c78798030000      mov      word ptr [bx + 0x398], 0
1:059F  8b879203          mov      ax, word ptr [bx + 0x392]
1:05A3  2d1400            sub      ax, 0x14
1:05A6  3b878803          cmp      ax, word ptr [bx + 0x388]
1:05AA  7e03              jle      0x5af
1:05AC  e954fd            jmp      0x303
1:05AF  c7879c030100      mov      word ptr [bx + 0x39c], 1
1:05B5  e94bfd            jmp      0x303
1:05B8  ff76ec            push     word ptr [bp - 0x14]
1:05BB  9af7050000        lcall    0, 0x5f7  ; @1:GDI.DeleteObject
1:05C0  837eee00          cmp      word ptr [bp - 0x12], 0
1:05C4  750c              jne      0x5d2
1:05C6  837efc00          cmp      word ptr [bp - 4], 0
1:05CA  7506              jne      0x5d2
1:05CC  837ef400          cmp      word ptr [bp - 0xc], 0
1:05D0  7404              je       0x5d6
1:05D2  0e                push     cs
1:05D3  e843fc            call     0x219
1:05D6  2bc0              sub      ax, ax
1:05D8  5e                pop      si
1:05D9  4d                dec      bp
1:05DA  4d                dec      bp
1:05DB  8be5              mov      sp, bp
1:05DD  1f                pop      ds
1:05DE  5d                pop      bp
1:05DF  4d                dec      bp
1:05E0  cb                retf     

; ===== EXPORT:ord_13(#13) =====
1:05E1  1e                push     ds
1:05E2  58                pop      ax
1:05E3  90                nop      
1:05E4  45                inc      bp
1:05E5  55                push     bp
1:05E6  8bec              mov      bp, sp
1:05E8  1e                push     ds
1:05E9  8ed8              mov      ds, ax
1:05EB  833e7c0300        cmp      word ptr [0x37c], 0
1:05F0  7409              je       0x5fb
1:05F2  ff367c03          push     word ptr [0x37c]
1:05F6  9aae060000        lcall    0, 0x6ae  ; @1:GDI.DeleteObject
1:05FB  2bc0              sub      ax, ax
1:05FD  4d                dec      bp
1:05FE  4d                dec      bp
1:05FF  8be5              mov      sp, bp
1:0601  1f                pop      ds
1:0602  5d                pop      bp
1:0603  4d                dec      bp
1:0604  cb                retf     

; ===== EXPORT:ord_12(#12) =====
1:0605  1e                push     ds
1:0606  58                pop      ax
1:0607  90                nop      
1:0608  45                inc      bp
1:0609  55                push     bp
1:060A  8bec              mov      bp, sp
1:060C  1e                push     ds
1:060D  8ed8              mov      ds, ax
1:060F  2bc0              sub      ax, ax
1:0611  4d                dec      bp
1:0612  4d                dec      bp
1:0613  8be5              mov      sp, bp
1:0615  1f                pop      ds
1:0616  5d                pop      bp
1:0617  4d                dec      bp
1:0618  cb                retf     

; ===== EXPORT:ord_11(#11) =====
1:0619  1e                push     ds
1:061A  58                pop      ax
1:061B  90                nop      
1:061C  45                inc      bp
1:061D  55                push     bp
1:061E  8bec              mov      bp, sp
1:0620  1e                push     ds
1:0621  8ed8              mov      ds, ax
1:0623  2bc0              sub      ax, ax
1:0625  4d                dec      bp
1:0626  4d                dec      bp
1:0627  8be5              mov      sp, bp
1:0629  1f                pop      ds
1:062A  5d                pop      bp
1:062B  4d                dec      bp
1:062C  cb                retf     

; ===== EXPORT:ord_10(#10) =====
1:062D  1e                push     ds
1:062E  58                pop      ax
1:062F  90                nop      
1:0630  45                inc      bp
1:0631  55                push     bp
1:0632  8bec              mov      bp, sp
1:0634  1e                push     ds
1:0635  8ed8              mov      ds, ax
1:0637  83ec06            sub      sp, 6
1:063A  56                push     si
1:063B  c41e7e03          les      bx, ptr [0x37e]
1:063F  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:0644  7404              je       0x64a
1:0646  2bc0              sub      ax, ax
1:0648  eb6e              jmp      0x6b8
1:064A  8b4606            mov      ax, word ptr [bp + 6]
1:064D  0bc0              or       ax, ax
1:064F  7406              je       0x657
1:0651  48                dec      ax
1:0652  740c              je       0x660
1:0654  48                dec      ax
1:0655  75ef              jne      0x646
1:0657  0e                push     cs
1:0658  e886ff            call     0x5e1
1:065B  b80300            mov      ax, 3
1:065E  eb58              jmp      0x6b8
1:0660  c41e9e04          les      bx, ptr [0x49e]
1:0664  26837f0a00        cmp      word ptr es:[bx + 0xa], 0
1:0669  74ec              je       0x657
1:066B  268b4708          mov      ax, word ptr es:[bx + 8]
1:066F  a37a03            mov      word ptr [0x37a], ax
1:0672  99                cdq      
1:0673  2bc2              sub      ax, dx
1:0675  d1f8              sar      ax, 1
1:0677  99                cdq      
1:0678  8bc8              mov      cx, ax
1:067A  8bda              mov      bx, dx
1:067C  a37603            mov      word ptr [0x376], ax
1:067F  c4367e03          les      si, ptr [0x37e]
1:0683  268b440c          mov      ax, word ptr es:[si + 0xc]
1:0687  99                cdq      
1:0688  52                push     dx
1:0689  50                push     ax
1:068A  268b440e          mov      ax, word ptr es:[si + 0xe]
1:068E  99                cdq      
1:068F  52                push     dx
1:0690  50                push     ax
1:0691  53                push     bx
1:0692  51                push     cx
1:0693  9a87010000        lcall    0, 0x187  ; @1:INT:ord_8(1:0C3E)
1:0698  52                push     dx
1:0699  50                push     ax
1:069A  9a8e010000        lcall    0, 0x18e  ; @1:INT:ord_7(1:0CB0)
1:069F  a37403            mov      word ptr [0x374], ax
1:06A2  833e7c0300        cmp      word ptr [0x37c], 0
1:06A7  7409              je       0x6b2
1:06A9  ff367c03          push     word ptr [0x37c]
1:06AD  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteObject
1:06B2  0e                push     cs
1:06B3  e85cf9            call     0x12
1:06B6  eb8e              jmp      0x646
1:06B8  5e                pop      si
1:06B9  4d                dec      bp
1:06BA  4d                dec      bp
1:06BB  8be5              mov      sp, bp
1:06BD  1f                pop      ds
1:06BE  5d                pop      bp
1:06BF  4d                dec      bp
1:06C0  cb                retf     
1:06C1  1e                push     ds
1:06C2  58                pop      ax
1:06C3  90                nop      
1:06C4  45                inc      bp
1:06C5  55                push     bp
1:06C6  8bec              mov      bp, sp
1:06C8  1e                push     ds
1:06C9  8ed8              mov      ds, ax
1:06CB  56                push     si
1:06CC  ff069c04          inc      word ptr [0x49c]
1:06D0  833e9c040d        cmp      word ptr [0x49c], 0xd
1:06D5  7e06              jle      0x6dd
1:06D7  c7069c040000      mov      word ptr [0x49c], 0
1:06DD  a19c04            mov      ax, word ptr [0x49c]
1:06E0  e9fb00            jmp      0x7de
1:06E3  b81c00            mov      ax, 0x1c
1:06E6  f76e06            imul     word ptr [bp + 6]
1:06E9  8bd8              mov      bx, ax
1:06EB  c7878203ff00      mov      word ptr [bx + 0x382], 0xff
1:06F1  c78784030000      mov      word ptr [bx + 0x384], 0
1:06F7  e90d01            jmp      0x807
1:06FA  b81c00            mov      ax, 0x1c
1:06FD  f76e06            imul     word ptr [bp + 6]
1:0700  8bd8              mov      bx, ax
1:0702  c78782038000      mov      word ptr [bx + 0x382], 0x80
1:0708  ebe7              jmp      0x6f1
1:070A  b81c00            mov      ax, 0x1c
1:070D  f76e06            imul     word ptr [bp + 6]
1:0710  8bd8              mov      bx, ax
1:0712  c7878203ff00      mov      word ptr [bx + 0x382], 0xff
1:0718  c7878403ff00      mov      word ptr [bx + 0x384], 0xff
1:071E  e9e600            jmp      0x807
1:0721  b81c00            mov      ax, 0x1c
1:0724  f76e06            imul     word ptr [bp + 6]
1:0727  8bd8              mov      bx, ax
1:0729  c78782038000      mov      word ptr [bx + 0x382], 0x80
1:072F  c78784038000      mov      word ptr [bx + 0x384], 0x80
1:0735  e9cf00            jmp      0x807
1:0738  b81c00            mov      ax, 0x1c
1:073B  f76e06            imul     word ptr [bp + 6]
1:073E  8bd8              mov      bx, ax
1:0740  c78782030000      mov      word ptr [bx + 0x382], 0
1:0746  ebd0              jmp      0x718
1:0748  b81c00            mov      ax, 0x1c
1:074B  f76e06            imul     word ptr [bp + 6]
1:074E  8bd8              mov      bx, ax
1:0750  c78782030000      mov      word ptr [bx + 0x382], 0
1:0756  ebd7              jmp      0x72f
1:0758  b81c00            mov      ax, 0x1c
1:075B  f76e06            imul     word ptr [bp + 6]
1:075E  8bd8              mov      bx, ax
1:0760  c787820300ff      mov      word ptr [bx + 0x382], 0xff00
1:0766  ebb0              jmp      0x718
1:0768  b81c00            mov      ax, 0x1c
1:076B  f76e06            imul     word ptr [bp + 6]
1:076E  8bd8              mov      bx, ax
1:0770  c78782030080      mov      word ptr [bx + 0x382], 0x8000
1:0776  ebb7              jmp      0x72f
1:0778  b81c00            mov      ax, 0x1c
1:077B  f76e06            imul     word ptr [bp + 6]
1:077E  8bd8              mov      bx, ax
1:0780  c787820300ff      mov      word ptr [bx + 0x382], 0xff00
1:0786  e968ff            jmp      0x6f1
1:0789  b81c00            mov      ax, 0x1c
1:078C  f76e06            imul     word ptr [bp + 6]
1:078F  8bd8              mov      bx, ax
1:0791  c78782030080      mov      word ptr [bx + 0x382], 0x8000
1:0797  e957ff            jmp      0x6f1
1:079A  b81c00            mov      ax, 0x1c
1:079D  f76e06            imul     word ptr [bp + 6]
1:07A0  8bd8              mov      bx, ax
1:07A2  c7878203ffff      mov      word ptr [bx + 0x382], 0xffff
1:07A8  e946ff            jmp      0x6f1
1:07AB  b81c00            mov      ax, 0x1c
1:07AE  f76e06            imul     word ptr [bp + 6]
1:07B1  8bd8              mov      bx, ax
1:07B3  c78782038080      mov      word ptr [bx + 0x382], 0x8080
1:07B9  e935ff            jmp      0x6f1
1:07BC  b81c00            mov      ax, 0x1c
1:07BF  f76e06            imul     word ptr [bp + 6]
1:07C2  8bd8              mov      bx, ax
1:07C4  c7878203ffff      mov      word ptr [bx + 0x382], 0xffff
1:07CA  e94bff            jmp      0x718
1:07CD  b81c00            mov      ax, 0x1c
1:07D0  f76e06            imul     word ptr [bp + 6]
1:07D3  8bd8              mov      bx, ax
1:07D5  c78782038080      mov      word ptr [bx + 0x382], 0x8080
1:07DB  e951ff            jmp      0x72f
1:07DE  3d0d00            cmp      ax, 0xd
1:07E1  7724              ja       0x807
1:07E3  d1e0              shl      ax, 1
1:07E5  93                xchg     bx, ax
1:07E6  2effa7eb07        jmp      word ptr cs:[bx + 0x7eb]
1:07EB  e306              jcxz     0x7f3
1:07ED  fa                cli      
1:07EE  06                push     es
1:07EF  0a07              or       al, byte ptr [bx]
1:07F1  2107              and      word ptr [bx], ax
1:07F3  3807              cmp      byte ptr [bx], al
1:07F5  48                dec      ax
1:07F6  07                pop      es
1:07F7  58                pop      ax
1:07F8  07                pop      es
1:07F9  680778            push     0x7807
1:07FC  07                pop      es
1:07FD  8907              mov      word ptr [bx], ax
1:07FF  9a07ab07bc        lcall    0xbc07, 0xab07
1:0804  07                pop      es
1:0805  cd07              int      7
1:0807  9a17080000        lcall    0, 0x817  ; @1:INT:ord_6(1:0B74)
1:080C  b90200            mov      cx, 2
1:080F  99                cdq      
1:0810  f7f9              idiv     cx
1:0812  0bd2              or       dx, dx
1:0814  753a              jne      0x850
1:0816  9a51080000        lcall    0, 0x851  ; @1:INT:ord_6(1:0B74)
1:081B  c41e9e04          les      bx, ptr [0x49e]
1:081F  8bc8              mov      cx, ax
1:0821  268b4702          mov      ax, word ptr es:[bx + 2]
1:0825  99                cdq      
1:0826  2bc2              sub      ax, dx
1:0828  d1f8              sar      ax, 1
1:082A  8bd0              mov      dx, ax
1:082C  8bc1              mov      ax, cx
1:082E  8bca              mov      cx, dx
1:0830  99                cdq      
1:0831  f7f9              idiv     cx
1:0833  83ea14            sub      dx, 0x14
1:0836  b81c00            mov      ax, 0x1c
1:0839  8bca              mov      cx, dx
1:083B  f76e06            imul     word ptr [bp + 6]
1:083E  8bd8              mov      bx, ax
1:0840  898f8603          mov      word ptr [bx + 0x386], cx
1:0844  8bc1              mov      ax, cx
1:0846  89878a03          mov      word ptr [bx + 0x38a], ax
1:084A  89878e03          mov      word ptr [bx + 0x38e], ax
1:084E  eb2d              jmp      0x87d
1:0850  9a7e080000        lcall    0, 0x87e  ; @1:INT:ord_6(1:0B74)
1:0855  c41e9e04          les      bx, ptr [0x49e]
1:0859  99                cdq      
1:085A  26f77f02          idiv     word ptr es:[bx + 2]
1:085E  b81c00            mov      ax, 0x1c
1:0861  8bca              mov      cx, dx
1:0863  f76e06            imul     word ptr [bp + 6]
1:0866  8bf0              mov      si, ax
1:0868  26034f02          add      cx, word ptr es:[bx + 2]
1:086C  83c114            add      cx, 0x14
1:086F  898c8603          mov      word ptr [si + 0x386], cx
1:0873  8bc1              mov      ax, cx
1:0875  89848a03          mov      word ptr [si + 0x38a], ax
1:0879  89848e03          mov      word ptr [si + 0x38e], ax
1:087D  9aa5080000        lcall    0, 0x8a5  ; @1:INT:ord_6(1:0B74)
1:0882  f7d8              neg      ax
1:0884  b94d00            mov      cx, 0x4d
1:0887  99                cdq      
1:0888  f7f9              idiv     cx
1:088A  b81c00            mov      ax, 0x1c
1:088D  8bca              mov      cx, dx
1:088F  f76e06            imul     word ptr [bp + 6]
1:0892  8bd8              mov      bx, ax
1:0894  898f8803          mov      word ptr [bx + 0x388], cx
1:0898  8bc1              mov      ax, cx
1:089A  89878c03          mov      word ptr [bx + 0x38c], ax
1:089E  89879003          mov      word ptr [bx + 0x390], ax
1:08A2  8bf3              mov      si, bx
1:08A4  9a96010000        lcall    0, 0x196  ; @1:INT:ord_6(1:0B74)
1:08A9  b90600            mov      cx, 6
1:08AC  99                cdq      
1:08AD  f7f9              idiv     cx
1:08AF  42                inc      dx
1:08B0  89949403          mov      word ptr [si + 0x394], dx
1:08B4  c78496036400      mov      word ptr [si + 0x396], 0x64
1:08BA  c78498030000      mov      word ptr [si + 0x398], 0
1:08C0  c7849c030000      mov      word ptr [si + 0x39c], 0
1:08C6  c41e9e04          les      bx, ptr [0x49e]
1:08CA  268b4704          mov      ax, word ptr es:[bx + 4]
1:08CE  2d0300            sub      ax, 3
1:08D1  89849203          mov      word ptr [si + 0x392], ax
1:08D5  c7849a030100      mov      word ptr [si + 0x39a], 1
1:08DB  5e                pop      si
1:08DC  4d                dec      bp
1:08DD  4d                dec      bp
1:08DE  8be5              mov      sp, bp
1:08E0  1f                pop      ds
1:08E1  5d                pop      bp
1:08E2  4d                dec      bp
1:08E3  cb                retf     

; ===== EXPORT:ord_20(#20) =====
1:08E4  1e                push     ds
1:08E5  58                pop      ax
1:08E6  90                nop      
1:08E7  45                inc      bp
1:08E8  55                push     bp
1:08E9  8bec              mov      bp, sp
1:08EB  1e                push     ds
1:08EC  8ed8              mov      ds, ax
1:08EE  837e0a00          cmp      word ptr [bp + 0xa], 0
1:08F2  7504              jne      0x8f8
1:08F4  2bc0              sub      ax, ax
1:08F6  eb09              jmp      0x901
1:08F8  8b460e            mov      ax, word ptr [bp + 0xe]
1:08FB  a39a04            mov      word ptr [0x49a], ax
1:08FE  b80100            mov      ax, 1
1:0901  4d                dec      bp
1:0902  4d                dec      bp
1:0903  8be5              mov      sp, bp
1:0905  1f                pop      ds
1:0906  5d                pop      bp
1:0907  4d                dec      bp
1:0908  ca0a00            retf     0xa

; ===== EXPORT:WEP(#2) =====
1:090B  1e                push     ds
1:090C  58                pop      ax
1:090D  90                nop      
1:090E  45                inc      bp
1:090F  55                push     bp
1:0910  8bec              mov      bp, sp
1:0912  1e                push     ds
1:0913  8ed8              mov      ds, ax
1:0915  b80100            mov      ax, 1
1:0918  4d                dec      bp
1:0919  4d                dec      bp
1:091A  8be5              mov      sp, bp
1:091C  1f                pop      ds
1:091D  5d                pop      bp
1:091E  4d                dec      bp
1:091F  ca0200            retf     2

; ===== EXPORT:MODULE(#1) =====
1:0922  1e                push     ds
1:0923  58                pop      ax
1:0924  90                nop      
1:0925  45                inc      bp
1:0926  55                push     bp
1:0927  8bec              mov      bp, sp
1:0929  1e                push     ds
1:092A  8ed8              mov      ds, ax
1:092C  83ec0a            sub      sp, 0xa
1:092F  56                push     si
1:0930  8b4608            mov      ax, word ptr [bp + 8]
1:0933  a37803            mov      word ptr [0x378], ax
1:0936  8b4606            mov      ax, word ptr [bp + 6]
1:0939  a37003            mov      word ptr [0x370], ax
1:093C  50                push     ax
1:093D  9a5d090000        lcall    0, 0x95d  ; @1:KERNEL.GlobalLock
1:0942  a37e03            mov      word ptr [0x37e], ax
1:0945  89168003          mov      word ptr [0x380], dx
1:0949  8bc2              mov      ax, dx
1:094B  0b067e03          or       ax, word ptr [0x37e]
1:094F  7503              jne      0x954
1:0951  e96a01            jmp      0xabe
1:0954  c41e7e03          les      bx, ptr [0x37e]
1:0958  26ff7720          push     word ptr es:[bx + 0x20]
1:095C  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalLock
1:0961  a39e04            mov      word ptr [0x49e], ax
1:0964  8916a004          mov      word ptr [0x4a0], dx
1:0968  8bc2              mov      ax, dx
1:096A  0b069e04          or       ax, word ptr [0x49e]
1:096E  7503              jne      0x973
1:0970  e94201            jmp      0xab5
1:0973  8b460a            mov      ax, word ptr [bp + 0xa]
1:0976  e90801            jmp      0xa81
1:0979  c41e7e03          les      bx, ptr [0x37e]
1:097D  26837f1465        cmp      word ptr es:[bx + 0x14], 0x65
1:0982  7c0f              jl       0x993
1:0984  26817f36f400      cmp      word ptr es:[bx + 0x36], 0xf4
1:098A  7507              jne      0x993
1:098C  26837f3878        cmp      word ptr es:[bx + 0x38], 0x78
1:0991  740e              je       0x9a1
1:0993  c70610000000      mov      word ptr [0x10], 0
1:0999  c746fc0500        mov      word ptr [bp - 4], 5
1:099E  e90701            jmp      0xaa8
1:09A1  c70610000100      mov      word ptr [0x10], 1
1:09A7  e9fe00            jmp      0xaa8
1:09AA  b83a03            mov      ax, 0x33a
1:09AD  50                push     ax
1:09AE  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_19(1:0AFE)
1:09B3  5b                pop      bx
1:09B4  ff363a03          push     word ptr [0x33a]
1:09B8  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_18(1:0B60)
1:09BD  5b                pop      bx
1:09BE  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_17(1:0145)
1:09C3  eb13              jmp      0x9d8
1:09C5  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_16(1:01CC)
1:09CA  eb0c              jmp      0x9d8
1:09CC  833e100000        cmp      word ptr [0x10], 0
1:09D1  740b              je       0x9de
1:09D3  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_15(1:0284)
1:09D8  8946fc            mov      word ptr [bp - 4], ax
1:09DB  e9ca00            jmp      0xaa8
1:09DE  ff367803          push     word ptr [0x378]
1:09E2  b800ff            mov      ax, 0xff00
1:09E5  baff00            mov      dx, 0xff
1:09E8  52                push     dx
1:09E9  50                push     ax
1:09EA  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextColor
1:09EF  ff367803          push     word ptr [0x378]
1:09F3  2bc0              sub      ax, ax
1:09F5  50                push     ax
1:09F6  50                push     ax
1:09F7  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkColor
1:09FC  ff367803          push     word ptr [0x378]
1:0A00  2bc0              sub      ax, ax
1:0A02  50                push     ax
1:0A03  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextAlign
1:0A08  ff367803          push     word ptr [0x378]
1:0A0C  b80100            mov      ax, 1
1:0A0F  50                push     ax
1:0A10  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkMode
1:0A15  ff367803          push     word ptr [0x378]
1:0A19  2bc0              sub      ax, ax
1:0A1B  50                push     ax
1:0A1C  50                push     ax
1:0A1D  b81200            mov      ax, 0x12
1:0A20  1e                push     ds
1:0A21  50                push     ax
1:0A22  50                push     ax
1:0A23  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_14(1:0AE2)
1:0A28  5b                pop      bx
1:0A29  50                push     ax
1:0A2A  9affff0000        lcall    0, 0xffff  ; @1:GDI.TextOut
1:0A2F  eb77              jmp      0xaa8
1:0A31  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_13(1:05E1)
1:0A36  eba0              jmp      0x9d8
1:0A38  a19a04            mov      ax, word ptr [0x49a]
1:0A3B  c41e9e04          les      bx, ptr [0x49e]
1:0A3F  26894716          mov      word ptr es:[bx + 0x16], ax
1:0A43  c746f60000        mov      word ptr [bp - 0xa], 0
1:0A48  8b46f6            mov      ax, word ptr [bp - 0xa]
1:0A4B  8bf0              mov      si, ax
1:0A4D  d1e6              shl      si, 1
1:0A4F  40                inc      ax
1:0A50  c41e9e04          les      bx, ptr [0x49e]
1:0A54  2689400e          mov      word ptr es:[bx + si + 0xe], ax
1:0A58  ff46f6            inc      word ptr [bp - 0xa]
1:0A5B  837ef604          cmp      word ptr [bp - 0xa], 4
1:0A5F  7ce7              jl       0xa48
1:0A61  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:0605)
1:0A66  e96fff            jmp      0x9d8
1:0A69  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:0619)
1:0A6E  e967ff            jmp      0x9d8
1:0A71  8b460a            mov      ax, word ptr [bp + 0xa]
1:0A74  2d0700            sub      ax, 7
1:0A77  50                push     ax
1:0A78  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:062D)
1:0A7D  5b                pop      bx
1:0A7E  e957ff            jmp      0x9d8
1:0A81  3d0c00            cmp      ax, 0xc
1:0A84  7722              ja       0xaa8
1:0A86  d1e0              shl      ax, 1
1:0A88  93                xchg     bx, ax
1:0A89  2effa78e0a        jmp      word ptr cs:[bx + 0xa8e]
1:0A8E  aa                stosb    byte ptr es:[di], al
1:0A8F  09c5              or       bp, ax
1:0A91  09cc              or       sp, cx
1:0A93  0931              or       word ptr [bx + di], si
1:0A95  0aa80a38          or       ch, byte ptr [bx + si + 0x380a]
1:0A99  0a690a            or       ch, byte ptr [bx + di + 0xa]
1:0A9C  710a              jno      0xaa8
1:0A9E  710a              jno      0xaaa
1:0AA0  710a              jno      0xaac
1:0AA2  710a              jno      0xaae
1:0AA4  a80a              test     al, 0xa
1:0AA6  7909              jns      0xab1
1:0AA8  c41e7e03          les      bx, ptr [0x37e]
1:0AAC  26ff7720          push     word ptr es:[bx + 0x20]
1:0AB0  9aba0a0000        lcall    0, 0xaba  ; @1:KERNEL.GlobalUnlock
1:0AB5  ff367003          push     word ptr [0x370]
1:0AB9  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalUnlock
1:0ABE  8b46fc            mov      ax, word ptr [bp - 4]
1:0AC1  5e                pop      si
1:0AC2  4d                dec      bp
1:0AC3  4d                dec      bp
1:0AC4  8be5              mov      sp, bp
1:0AC6  1f                pop      ds
1:0AC7  5d                pop      bp
1:0AC8  4d                dec      bp
1:0AC9  ca0600            retf     6
1:0ACC  0000              add      byte ptr [bx + si], al
1:0ACE  0000              add      byte ptr [bx + si], al
1:0AD0  0000              add      byte ptr [bx + si], al
1:0AD2  0000              add      byte ptr [bx + si], al
1:0AD4  0000              add      byte ptr [bx + si], al
1:0AD6  0000              add      byte ptr [bx + si], al
1:0AD8  0000              add      byte ptr [bx + si], al
1:0ADA  0000              add      byte ptr [bx + si], al
1:0ADC  0000              add      byte ptr [bx + si], al
1:0ADE  0000              add      byte ptr [bx + si], al
1:0AE0  c3                ret      
1:0AE1  00558b            add      byte ptr [di - 0x75], dl
1:0AE4  ec                in       al, dx
1:0AE5  8bd7              mov      dx, di
1:0AE7  8cd8              mov      ax, ds
1:0AE9  8ec0              mov      es, ax
1:0AEB  8b7e06            mov      di, word ptr [bp + 6]
1:0AEE  33c0              xor      ax, ax
1:0AF0  b9ffff            mov      cx, 0xffff
1:0AF3  f2ae              repne scasb al, byte ptr es:[di]
1:0AF5  f7d1              not      cx
1:0AF7  49                dec      cx
1:0AF8  91                xchg     cx, ax
1:0AF9  8bfa              mov      di, dx
1:0AFB  5d                pop      bp
1:0AFC  cb                retf     
1:0AFD  008cd890          add      byte ptr [si - 0x6f28], cl
1:0B01  45                inc      bp
1:0B02  55                push     bp
1:0B03  8bec              mov      bp, sp
1:0B05  1e                push     ds
1:0B06  8ed8              mov      ds, ax
1:0B08  56                push     si
1:0B09  b42a              mov      ah, 0x2a
1:0B0B  cd21              int      0x21
1:0B0D  8bda              mov      bx, dx
1:0B0F  8bf1              mov      si, cx
1:0B11  b42c              mov      ah, 0x2c
1:0B13  cd21              int      0x21
1:0B15  b400              mov      ah, 0
1:0B17  8ac6              mov      al, dh
1:0B19  50                push     ax
1:0B1A  8ac1              mov      al, cl
1:0B1C  50                push     ax
1:0B1D  8ac5              mov      al, ch
1:0B1F  50                push     ax
1:0B20  50                push     ax
1:0B21  b42a              mov      ah, 0x2a
1:0B23  cd21              int      0x21
1:0B25  3bda              cmp      bx, dx
1:0B27  58                pop      ax
1:0B28  7408              je       0xb32
1:0B2A  3c17              cmp      al, 0x17
1:0B2C  7504              jne      0xb32
1:0B2E  8bd3              mov      dx, bx
1:0B30  8bce              mov      cx, si
1:0B32  b400              mov      ah, 0
1:0B34  8ac2              mov      al, dl
1:0B36  50                push     ax
1:0B37  8ac6              mov      al, dh
1:0B39  50                push     ax
1:0B3A  81e9bc07          sub      cx, 0x7bc
1:0B3E  51                push     cx
1:0B3F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_21(1:0D10)
1:0B44  83c40c            add      sp, 0xc
1:0B47  837e0600          cmp      word ptr [bp + 6], 0
1:0B4B  7408              je       0xb55
1:0B4D  8b5e06            mov      bx, word ptr [bp + 6]
1:0B50  895702            mov      word ptr [bx + 2], dx
1:0B53  8907              mov      word ptr [bx], ax
1:0B55  5e                pop      si
1:0B56  83ed02            sub      bp, 2
1:0B59  8be5              mov      sp, bp
1:0B5B  1f                pop      ds
1:0B5C  5d                pop      bp
1:0B5D  4d                dec      bp
1:0B5E  cb                retf     
1:0B5F  004555            add      byte ptr [di + 0x55], al
1:0B62  8bec              mov      bp, sp
1:0B64  8b4606            mov      ax, word ptr [bp + 6]
1:0B67  a35200            mov      word ptr [0x52], ax
1:0B6A  c70654000000      mov      word ptr [0x54], 0
1:0B70  5d                pop      bp
1:0B71  4d                dec      bp
1:0B72  cb                retf     
1:0B73  90                nop      

; ===== EXPORT:ord_6(#6) =====
1:0B74  45                inc      bp
1:0B75  55                push     bp
1:0B76  8bec              mov      bp, sp
1:0B78  b8fd43            mov      ax, 0x43fd
1:0B7B  ba0300            mov      dx, 3
1:0B7E  52                push     dx
1:0B7F  50                push     ax