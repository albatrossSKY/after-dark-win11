File: raw\unpacked\MODULES\RAINSTOR.AD
Module: 'RAINSTOR' ('Rain Storm, January 22, 1990 changed by TDE "Wind"')
CS:IP=1:0FE4  SS:SP=0:0000  AutoDS=2  Heap=4096  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (3): KERNEL, GDI, USER
Segments (2):
  SEG  1: CODE off=0x00620 len=0x1016 min=0x1016 flags=0x0D50 relocs=71
  SEG  2: DATA off=0x017C0 len=0x09FA min=0x09FA flags=0x0C71 relocs=0
Exports (28):
  ord   1: SEG1:063C flags=0x03 MODULE
  ord   2: SEG1:0625 flags=0x03 WEP
  ord   3: SEG1:0FD0 flags=0x03 ___EXPORTEDSTUB
  ord   4: SEG1:0894 flags=0x00 
  ord   5: SEG1:022F flags=0x00 
  ord   6: SEG1:0290 flags=0x00 
  ord   7: SEG1:027C flags=0x00 
  ord   8: SEG1:051F flags=0x00 
  ord   9: SEG1:0802 flags=0x00 
  ord  10: SEG1:02A4 flags=0x00 
  ord  11: SEG1:01E9 flags=0x00 
  ord  12: SEG1:0012 flags=0x00 
  ord  13: SEG1:0880 flags=0x00 
  ord  14: SEG1:081E flags=0x00 
  ord  15: SEG1:05FE flags=0x00 
  ord  16: SEG1:08C4 flags=0x00 
  ord  17: SEG1:09C8 flags=0x00 
  ord  18: SEG1:0B3A flags=0x00 
  ord  19: SEG1:09FA flags=0x00 
  ord  20: SEG1:0C6C flags=0x00 
  ord  21: SEG1:0C94 flags=0x00 
  ord  22: SEG1:0D36 flags=0x00 
  ord  23: SEG1:0CFA flags=0x00 
  ord  24: SEG1:0D60 flags=0x00 
  ord  25: SEG1:0C98 flags=0x00 
  ord  26: SEG1:0A14 flags=0x00 
  ord  27: SEG1:0F04 flags=0x00 
  ord  28: SEG1:0FC0 flags=0x00 
Resources (7):
  TYPE_1000        #1               off=0x02200 len=   128
  TYPE_1000        #2               off=0x02280 len=    64
  TYPE_1000        #3               off=0x022C0 len=    64
  TYPE_1000        #4               off=0x02300 len=   176
  TYPE_2000        #10              off=0x023B0 len=    64
  TYPE_2000        #20              off=0x023F0 len=    16
  TYPE_2000        #30              off=0x02400 len=   384

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
1:001C  83ec04            sub      sp, 4
1:001F  56                push     si
1:0020  c41ef609          les      bx, ptr [0x9f6]
1:0024  268b4708          mov      ax, word ptr es:[bx + 8]
1:0028  d1e0              shl      ax, 1
1:002A  d1e0              shl      ax, 1
1:002C  2da901            sub      ax, 0x1a9
1:002F  f7d8              neg      ax
1:0031  a3ac03            mov      word ptr [0x3ac], ax
1:0034  268b470a          mov      ax, word ptr es:[bx + 0xa]
1:0038  a3a603            mov      word ptr [0x3a6], ax
1:003B  b89803            mov      ax, 0x398
1:003E  1e                push     ds
1:003F  50                push     ax
1:0040  b8e7ff            mov      ax, 0xffe7
1:0043  50                push     ax
1:0044  50                push     ax
1:0045  268b4702          mov      ax, word ptr es:[bx + 2]
1:0049  050500            add      ax, 5
1:004C  50                push     ax
1:004D  268b4704          mov      ax, word ptr es:[bx + 4]
1:0051  050500            add      ax, 5
1:0054  50                push     ax
1:0055  9a09020000        lcall    0, 0x209  ; @1:USER.SetRect
1:005A  2bc0              sub      ax, ax
1:005C  a3a403            mov      word ptr [0x3a4], ax
1:005F  a3a203            mov      word ptr [0x3a2], ax
1:0062  c41ef609          les      bx, ptr [0x9f6]
1:0066  268b4706          mov      ax, word ptr es:[bx + 6]
1:006A  a3b003            mov      word ptr [0x3b0], ax
1:006D  268b470c          mov      ax, word ptr es:[bx + 0xc]
1:0071  eb48              jmp      0xbb
1:0073  c706b4030000      mov      word ptr [0x3b4], 0
1:0079  eb65              jmp      0xe0
1:007B  c706b4030100      mov      word ptr [0x3b4], 1
1:0081  eb5d              jmp      0xe0
1:0083  c706b4030200      mov      word ptr [0x3b4], 2
1:0089  eb55              jmp      0xe0
1:008B  c706b4030300      mov      word ptr [0x3b4], 3
1:0091  eb4d              jmp      0xe0
1:0093  c706b4030400      mov      word ptr [0x3b4], 4
1:0099  eb45              jmp      0xe0
1:009B  c706b4030500      mov      word ptr [0x3b4], 5
1:00A1  eb3d              jmp      0xe0
1:00A3  c706b4030600      mov      word ptr [0x3b4], 6
1:00A9  eb35              jmp      0xe0
1:00AB  c706b4030700      mov      word ptr [0x3b4], 7
1:00B1  eb2d              jmp      0xe0
1:00B3  c706b4030800      mov      word ptr [0x3b4], 8
1:00B9  eb25              jmp      0xe0
1:00BB  3d4600            cmp      ax, 0x46
1:00BE  77f3              ja       0xb3
1:00C0  b30a              mov      bl, 0xa
1:00C2  f6f3              div      bl
1:00C4  0ae4              or       ah, ah
1:00C6  75eb              jne      0xb3
1:00C8  d1e0              shl      ax, 1
1:00CA  93                xchg     bx, ax
1:00CB  2effa7d000        jmp      word ptr cs:[bx + 0xd0]
1:00D0  7300              jae      0xd2
1:00D2  7b00              jnp      0xd4
1:00D4  83008b            add      word ptr [bx + si], -0x75
1:00D7  0093009b          add      byte ptr [bp + di - 0x6500], dl
1:00DB  00a300ab          add      byte ptr [bp + di - 0x5500], ah
1:00DF  009a9401          add      byte ptr [bp + si + 0x194], bl  ; @2:INT:ord_4(1:0894)
1:00E3  0000              add      byte ptr [bx + si], al
1:00E5  b90200            mov      cx, 2
1:00E8  99                cdq      
1:00E9  f7f9              idiv     cx
1:00EB  0bd2              or       dx, dx
1:00ED  7404              je       0xf3
1:00EF  f71eb403          neg      word ptr [0x3b4]
1:00F3  c70634030000      mov      word ptr [0x334], 0
1:00F9  a1b003            mov      ax, word ptr [0x3b0]
1:00FC  050b00            add      ax, 0xb
1:00FF  50                push     ax
1:0100  b80100            mov      ax, 1
1:0103  50                push     ax
1:0104  0e                push     cs
1:0105  e8cc04            call     0x5d4
1:0108  5b                pop      bx
1:0109  5b                pop      bx
1:010A  b104              mov      cl, 4
1:010C  8b1e3403          mov      bx, word ptr [0x334]
1:0110  d3e3              shl      bx, cl
1:0112  8987c003          mov      word ptr [bx + 0x3c0], ax
1:0116  8b1e3403          mov      bx, word ptr [0x334]
1:011A  d3e3              shl      bx, cl
1:011C  8b87c003          mov      ax, word ptr [bx + 0x3c0]
1:0120  f72eb403          imul     word ptr [0x3b4]
1:0124  8987be03          mov      word ptr [bx + 0x3be], ax
1:0128  a1b003            mov      ax, word ptr [0x3b0]
1:012B  d1e0              shl      ax, 1
1:012D  051500            add      ax, 0x15
1:0130  50                push     ax
1:0131  b81400            mov      ax, 0x14
1:0134  50                push     ax
1:0135  8bf3              mov      si, bx
1:0137  0e                push     cs
1:0138  e89904            call     0x5d4
1:013B  5b                pop      bx
1:013C  5b                pop      bx
1:013D  8984c203          mov      word ptr [si + 0x3c2], ax
1:0141  b104              mov      cl, 4
1:0143  8b1e3403          mov      bx, word ptr [0x334]
1:0147  d3e3              shl      bx, cl
1:0149  8b87c203          mov      ax, word ptr [bx + 0x3c2]
1:014D  f72eb403          imul     word ptr [0x3b4]
1:0151  8987c403          mov      word ptr [bx + 0x3c4], ax
1:0155  c436f609          les      si, ptr [0x9f6]
1:0159  268b4402          mov      ax, word ptr es:[si + 2]
1:015D  050500            add      ax, 5
1:0160  50                push     ax
1:0161  b8e7ff            mov      ax, 0xffe7
1:0164  50                push     ax
1:0165  8bf3              mov      si, bx
1:0167  0e                push     cs
1:0168  e86904            call     0x5d4
1:016B  5b                pop      bx
1:016C  5b                pop      bx
1:016D  8984ba03          mov      word ptr [si + 0x3ba], ax
1:0171  c41ef609          les      bx, ptr [0x9f6]
1:0175  268b4704          mov      ax, word ptr es:[bx + 4]
1:0179  050500            add      ax, 5
1:017C  50                push     ax
1:017D  b8e7ff            mov      ax, 0xffe7
1:0180  50                push     ax
1:0181  0e                push     cs
1:0182  e84f04            call     0x5d4
1:0185  5b                pop      bx
1:0186  5b                pop      bx
1:0187  b104              mov      cl, 4
1:0189  8b1e3403          mov      bx, word ptr [0x334]
1:018D  d3e3              shl      bx, cl
1:018F  8987bc03          mov      word ptr [bx + 0x3bc], ax
1:0193  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_4(1:0894)
1:0198  b9ff00            mov      cx, 0xff
1:019B  99                cdq      
1:019C  f7f9              idiv     cx
1:019E  8916a003          mov      word ptr [0x3a0], dx
1:01A2  8bc2              mov      ax, dx
1:01A4  a39203            mov      word ptr [0x392], ax
1:01A7  a3ae03            mov      word ptr [0x3ae], ax
1:01AA  2ae4              sub      ah, ah
1:01AC  8a369203          mov      dh, byte ptr [0x392]
1:01B0  2ad2              sub      dl, dl
1:01B2  8bd8              mov      bx, ax
1:01B4  0bc2              or       ax, dx
1:01B6  8bd3              mov      dx, bx
1:01B8  3b06a203          cmp      ax, word ptr [0x3a2]
1:01BC  7512              jne      0x1d0
1:01BE  3b16a403          cmp      dx, word ptr [0x3a4]
1:01C2  750c              jne      0x1d0
1:01C4  890ea003          mov      word ptr [0x3a0], cx
1:01C8  890e9203          mov      word ptr [0x392], cx
1:01CC  890eae03          mov      word ptr [0x3ae], cx
1:01D0  ff063403          inc      word ptr [0x334]
1:01D4  833e340363        cmp      word ptr [0x334], 0x63
1:01D9  7d03              jge      0x1de
1:01DB  e91bff            jmp      0xf9
1:01DE  2bc0              sub      ax, ax
1:01E0  5e                pop      si
1:01E1  4d                dec      bp
1:01E2  4d                dec      bp
1:01E3  8be5              mov      sp, bp
1:01E5  1f                pop      ds
1:01E6  5d                pop      bp
1:01E7  4d                dec      bp
1:01E8  cb                retf     

; ===== EXPORT:ord_11(#11) =====
1:01E9  1e                push     ds
1:01EA  58                pop      ax
1:01EB  90                nop      
1:01EC  45                inc      bp
1:01ED  55                push     bp
1:01EE  8bec              mov      bp, sp
1:01F0  1e                push     ds
1:01F1  8ed8              mov      ds, ax
1:01F3  b83a03            mov      ax, 0x33a
1:01F6  1e                push     ds
1:01F7  50                push     ax
1:01F8  2bc0              sub      ax, ax
1:01FA  50                push     ax
1:01FB  50                push     ax
1:01FC  c41ef609          les      bx, ptr [0x9f6]
1:0200  26ff7702          push     word ptr es:[bx + 2]
1:0204  26ff7704          push     word ptr es:[bx + 4]
1:0208  9ad9020000        lcall    0, 0x2d9  ; @1:USER.SetRect
1:020D  ff369603          push     word ptr [0x396]
1:0211  b83a03            mov      ax, 0x33a
1:0214  1e                push     ds
1:0215  50                push     ax
1:0216  b80400            mov      ax, 4
1:0219  50                push     ax
1:021A  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:021F  50                push     ax
1:0220  9affff0000        lcall    0, 0xffff  ; @1:USER.FillRect
1:0225  2bc0              sub      ax, ax
1:0227  4d                dec      bp
1:0228  4d                dec      bp
1:0229  8be5              mov      sp, bp
1:022B  1f                pop      ds
1:022C  5d                pop      bp
1:022D  4d                dec      bp
1:022E  cb                retf     

; ===== EXPORT:ord_5(#5) =====
1:022F  1e                push     ds
1:0230  58                pop      ax
1:0231  90                nop      
1:0232  45                inc      bp
1:0233  55                push     bp
1:0234  8bec              mov      bp, sp
1:0236  1e                push     ds
1:0237  8ed8              mov      ds, ax
1:0239  8b4606            mov      ax, word ptr [bp + 6]
1:023C  eb27              jmp      0x265
1:023E  c41ea803          les      bx, ptr [0x3a8]
1:0242  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:0247  7529              jne      0x272
1:0249  0e                push     cs
1:024A  e8d202            call     0x51f
1:024D  b80300            mov      ax, 3
1:0250  eb22              jmp      0x274
1:0252  c41ea803          les      bx, ptr [0x3a8]
1:0256  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:025B  7515              jne      0x272
1:025D  c706ac030100      mov      word ptr [0x3ac], 1
1:0263  eb0d              jmp      0x272
1:0265  0bc0              or       ax, ax
1:0267  74d5              je       0x23e
1:0269  48                dec      ax
1:026A  74e6              je       0x252
1:026C  48                dec      ax
1:026D  74cf              je       0x23e
1:026F  48                dec      ax
1:0270  74cc              je       0x23e
1:0272  2bc0              sub      ax, ax
1:0274  4d                dec      bp
1:0275  4d                dec      bp
1:0276  8be5              mov      sp, bp
1:0278  1f                pop      ds
1:0279  5d                pop      bp
1:027A  4d                dec      bp
1:027B  cb                retf     

; ===== EXPORT:ord_7(#7) =====
1:027C  1e                push     ds
1:027D  58                pop      ax
1:027E  90                nop      
1:027F  45                inc      bp
1:0280  55                push     bp
1:0281  8bec              mov      bp, sp
1:0283  1e                push     ds
1:0284  8ed8              mov      ds, ax
1:0286  2bc0              sub      ax, ax
1:0288  4d                dec      bp
1:0289  4d                dec      bp
1:028A  8be5              mov      sp, bp
1:028C  1f                pop      ds
1:028D  5d                pop      bp
1:028E  4d                dec      bp
1:028F  cb                retf     

; ===== EXPORT:ord_6(#6) =====
1:0290  1e                push     ds
1:0291  58                pop      ax
1:0292  90                nop      
1:0293  45                inc      bp
1:0294  55                push     bp
1:0295  8bec              mov      bp, sp
1:0297  1e                push     ds
1:0298  8ed8              mov      ds, ax
1:029A  2bc0              sub      ax, ax
1:029C  4d                dec      bp
1:029D  4d                dec      bp
1:029E  8be5              mov      sp, bp
1:02A0  1f                pop      ds
1:02A1  5d                pop      bp
1:02A2  4d                dec      bp
1:02A3  cb                retf     

; ===== EXPORT:ord_10(#10) =====
1:02A4  1e                push     ds
1:02A5  58                pop      ax
1:02A6  90                nop      
1:02A7  45                inc      bp
1:02A8  55                push     bp
1:02A9  8bec              mov      bp, sp
1:02AB  1e                push     ds
1:02AC  8ed8              mov      ds, ax
1:02AE  83ec04            sub      sp, 4
1:02B1  56                push     si
1:02B2  a1ac03            mov      ax, word ptr [0x3ac]
1:02B5  ff0eac03          dec      word ptr [0x3ac]
1:02B9  0bc0              or       ax, ax
1:02BB  7550              jne      0x30d
1:02BD  c41ef609          les      bx, ptr [0x9f6]
1:02C1  26394708          cmp      word ptr es:[bx + 8], ax
1:02C5  7446              je       0x30d
1:02C7  b84603            mov      ax, 0x346
1:02CA  1e                push     ds
1:02CB  50                push     ax
1:02CC  2bc0              sub      ax, ax
1:02CE  50                push     ax
1:02CF  50                push     ax
1:02D0  26ff7702          push     word ptr es:[bx + 2]
1:02D4  26ff7704          push     word ptr es:[bx + 4]
1:02D8  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:02DD  ff369603          push     word ptr [0x396]
1:02E1  b84603            mov      ax, 0x346
1:02E4  1e                push     ds
1:02E5  50                push     ax
1:02E6  9af5020000        lcall    0, 0x2f5  ; @1:USER.InvertRect
1:02EB  ff369603          push     word ptr [0x396]
1:02EF  b84603            mov      ax, 0x346
1:02F2  1e                push     ds
1:02F3  50                push     ax
1:02F4  9affff0000        lcall    0, 0xffff  ; @1:USER.InvertRect
1:02F9  c41ef609          les      bx, ptr [0x9f6]
1:02FD  268b4708          mov      ax, word ptr es:[bx + 8]
1:0301  d1e0              shl      ax, 1
1:0303  d1e0              shl      ax, 1
1:0305  2da901            sub      ax, 0x1a9
1:0308  f7d8              neg      ax
1:030A  a3ac03            mov      word ptr [0x3ac], ax
1:030D  c70642030000      mov      word ptr [0x342], 0
1:0313  e9eb00            jmp      0x401
1:0316  a1b003            mov      ax, word ptr [0x3b0]
1:0319  050b00            add      ax, 0xb
1:031C  50                push     ax
1:031D  b80100            mov      ax, 1
1:0320  50                push     ax
1:0321  0e                push     cs
1:0322  e8af02            call     0x5d4
1:0325  5b                pop      bx
1:0326  5b                pop      bx
1:0327  b104              mov      cl, 4
1:0329  8b1e4203          mov      bx, word ptr [0x342]
1:032D  d3e3              shl      bx, cl
1:032F  8987c003          mov      word ptr [bx + 0x3c0], ax
1:0333  8b1e4203          mov      bx, word ptr [0x342]
1:0337  d3e3              shl      bx, cl
1:0339  8b87c003          mov      ax, word ptr [bx + 0x3c0]
1:033D  f72eb403          imul     word ptr [0x3b4]
1:0341  8987be03          mov      word ptr [bx + 0x3be], ax
1:0345  a1b003            mov      ax, word ptr [0x3b0]
1:0348  d1e0              shl      ax, 1
1:034A  051500            add      ax, 0x15
1:034D  50                push     ax
1:034E  b81400            mov      ax, 0x14
1:0351  50                push     ax
1:0352  8bf3              mov      si, bx
1:0354  0e                push     cs
1:0355  e87c02            call     0x5d4
1:0358  5b                pop      bx
1:0359  5b                pop      bx
1:035A  8984c203          mov      word ptr [si + 0x3c2], ax
1:035E  b104              mov      cl, 4
1:0360  8b1e4203          mov      bx, word ptr [0x342]
1:0364  d3e3              shl      bx, cl
1:0366  8b87c203          mov      ax, word ptr [bx + 0x3c2]
1:036A  f72eb403          imul     word ptr [0x3b4]
1:036E  8987c403          mov      word ptr [bx + 0x3c4], ax
1:0372  c436f609          les      si, ptr [0x9f6]
1:0376  268b4402          mov      ax, word ptr es:[si + 2]
1:037A  050500            add      ax, 5
1:037D  50                push     ax
1:037E  b8e7ff            mov      ax, 0xffe7
1:0381  50                push     ax
1:0382  8bf3              mov      si, bx
1:0384  0e                push     cs
1:0385  e84c02            call     0x5d4
1:0388  5b                pop      bx
1:0389  5b                pop      bx
1:038A  8984ba03          mov      word ptr [si + 0x3ba], ax
1:038E  c41ef609          les      bx, ptr [0x9f6]
1:0392  268b4704          mov      ax, word ptr es:[bx + 4]
1:0396  050500            add      ax, 5
1:0399  50                push     ax
1:039A  b8e7ff            mov      ax, 0xffe7
1:039D  50                push     ax
1:039E  0e                push     cs
1:039F  e83202            call     0x5d4
1:03A2  5b                pop      bx
1:03A3  5b                pop      bx
1:03A4  b104              mov      cl, 4
1:03A6  8b1e4203          mov      bx, word ptr [0x342]
1:03AA  d3e3              shl      bx, cl
1:03AC  8987bc03          mov      word ptr [bx + 0x3bc], ax
1:03B0  ff369603          push     word ptr [0x396]
1:03B4  8b1e4203          mov      bx, word ptr [0x342]
1:03B8  d3e3              shl      bx, cl
1:03BA  ffb7ba03          push     word ptr [bx + 0x3ba]
1:03BE  ffb7bc03          push     word ptr [bx + 0x3bc]
1:03C2  9a38040000        lcall    0, 0x438  ; @1:GDI.MoveTo
1:03C7  ff369603          push     word ptr [0x396]
1:03CB  b104              mov      cl, 4
1:03CD  8b1e4203          mov      bx, word ptr [0x342]
1:03D1  d3e3              shl      bx, cl
1:03D3  8b87ba03          mov      ax, word ptr [bx + 0x3ba]
1:03D7  0387be03          add      ax, word ptr [bx + 0x3be]
1:03DB  50                push     ax
1:03DC  8b87bc03          mov      ax, word ptr [bx + 0x3bc]
1:03E0  0387c003          add      ax, word ptr [bx + 0x3c0]
1:03E4  50                push     ax
1:03E5  9a5b040000        lcall    0, 0x45b  ; @1:GDI.LineTo
1:03EA  ff369603          push     word ptr [0x396]
1:03EE  ff364403          push     word ptr [0x344]
1:03F2  9a1c040000        lcall    0, 0x41c  ; @1:GDI.SelectObject
1:03F7  50                push     ax
1:03F8  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteObject
1:03FD  ff064203          inc      word ptr [0x342]
1:0401  a14203            mov      ax, word ptr [0x342]
1:0404  3906a603          cmp      word ptr [0x3a6], ax
1:0408  7f03              jg       0x40d
1:040A  e90701            jmp      0x514
1:040D  ff369603          push     word ptr [0x396]
1:0411  b80700            mov      ax, 7
1:0414  50                push     ax
1:0415  9a1b020000        lcall    0, 0x21b  ; @1:GDI.GetStockObject
1:041A  50                push     ax
1:041B  9a68040000        lcall    0, 0x468  ; @1:GDI.SelectObject
1:0420  a34403            mov      word ptr [0x344], ax
1:0423  ff369603          push     word ptr [0x396]
1:0427  b104              mov      cl, 4
1:0429  8b1e4203          mov      bx, word ptr [0x342]
1:042D  d3e3              shl      bx, cl
1:042F  ffb7ba03          push     word ptr [bx + 0x3ba]
1:0433  ffb7bc03          push     word ptr [bx + 0x3bc]
1:0437  9affff0000        lcall    0, 0xffff  ; @1:GDI.MoveTo
1:043C  ff369603          push     word ptr [0x396]
1:0440  b104              mov      cl, 4
1:0442  8b1e4203          mov      bx, word ptr [0x342]
1:0446  d3e3              shl      bx, cl
1:0448  8b87ba03          mov      ax, word ptr [bx + 0x3ba]
1:044C  0387be03          add      ax, word ptr [bx + 0x3be]
1:0450  50                push     ax
1:0451  8b87bc03          mov      ax, word ptr [bx + 0x3bc]
1:0455  0387c003          add      ax, word ptr [bx + 0x3c0]
1:0459  50                push     ax
1:045A  9affff0000        lcall    0, 0xffff  ; @1:GDI.LineTo
1:045F  ff369603          push     word ptr [0x396]
1:0463  ff364403          push     word ptr [0x344]
1:0467  9ae3040000        lcall    0, 0x4e3  ; @1:GDI.SelectObject
1:046C  b104              mov      cl, 4
1:046E  8b1e4203          mov      bx, word ptr [0x342]
1:0472  d3e3              shl      bx, cl
1:0474  8b87c203          mov      ax, word ptr [bx + 0x3c2]
1:0478  0187bc03          add      word ptr [bx + 0x3bc], ax
1:047C  8b87c403          mov      ax, word ptr [bx + 0x3c4]
1:0480  0187ba03          add      word ptr [bx + 0x3ba], ax
1:0484  9a3e050000        lcall    0, 0x53e  ; @1:INT:ord_4(1:0894)
1:0489  b9ff00            mov      cx, 0xff
1:048C  99                cdq      
1:048D  f7f9              idiv     cx
1:048F  8916a003          mov      word ptr [0x3a0], dx
1:0493  8bc2              mov      ax, dx
1:0495  a39203            mov      word ptr [0x392], ax
1:0498  a3ae03            mov      word ptr [0x3ae], ax
1:049B  2ae4              sub      ah, ah
1:049D  8a369203          mov      dh, byte ptr [0x392]
1:04A1  2ad2              sub      dl, dl
1:04A3  8bd8              mov      bx, ax
1:04A5  0bc2              or       ax, dx
1:04A7  8bd3              mov      dx, bx
1:04A9  3b06a203          cmp      ax, word ptr [0x3a2]
1:04AD  7512              jne      0x4c1
1:04AF  3b16a403          cmp      dx, word ptr [0x3a4]
1:04B3  750c              jne      0x4c1
1:04B5  890ea003          mov      word ptr [0x3a0], cx
1:04B9  890e9203          mov      word ptr [0x392], cx
1:04BD  890eae03          mov      word ptr [0x3ae], cx
1:04C1  ff369603          push     word ptr [0x396]
1:04C5  2bc0              sub      ax, ax
1:04C7  50                push     ax
1:04C8  b90100            mov      cx, 1
1:04CB  51                push     cx
1:04CC  8a0eae03          mov      cl, byte ptr [0x3ae]
1:04D0  8a2e9203          mov      ch, byte ptr [0x392]
1:04D4  8a16a003          mov      dl, byte ptr [0x3a0]
1:04D8  2af6              sub      dh, dh
1:04DA  52                push     dx
1:04DB  51                push     cx
1:04DC  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreatePen
1:04E1  50                push     ax
1:04E2  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectObject
1:04E7  a34403            mov      word ptr [0x344], ax
1:04EA  b89803            mov      ax, 0x398
1:04ED  1e                push     ds
1:04EE  50                push     ax
1:04EF  b104              mov      cl, 4
1:04F1  8b1e4203          mov      bx, word ptr [0x342]
1:04F5  d3e3              shl      bx, cl
1:04F7  ffb7bc03          push     word ptr [bx + 0x3bc]
1:04FB  ffb7ba03          push     word ptr [bx + 0x3ba]
1:04FF  9affff0000        lcall    0, 0xffff  ; @1:USER.PtInRect
1:0504  0bc0              or       ax, ax
1:0506  7503              jne      0x50b
1:0508  e90bfe            jmp      0x316
1:050B  ff369603          push     word ptr [0x396]
1:050F  b104              mov      cl, 4
1:0511  e9a0fe            jmp      0x3b4
1:0514  2bc0              sub      ax, ax
1:0516  5e                pop      si
1:0517  4d                dec      bp
1:0518  4d                dec      bp
1:0519  8be5              mov      sp, bp
1:051B  1f                pop      ds
1:051C  5d                pop      bp
1:051D  4d                dec      bp
1:051E  cb                retf     

; ===== EXPORT:ord_8(#8) =====
1:051F  1e                push     ds
1:0520  58                pop      ax
1:0521  90                nop      
1:0522  45                inc      bp
1:0523  55                push     bp
1:0524  8bec              mov      bp, sp
1:0526  1e                push     ds
1:0527  8ed8              mov      ds, ax
1:0529  2bc0              sub      ax, ax
1:052B  4d                dec      bp
1:052C  4d                dec      bp
1:052D  8be5              mov      sp, bp
1:052F  1f                pop      ds
1:0530  5d                pop      bp
1:0531  4d                dec      bp
1:0532  cb                retf     
1:0533  1e                push     ds
1:0534  58                pop      ax
1:0535  90                nop      
1:0536  45                inc      bp
1:0537  55                push     bp
1:0538  8bec              mov      bp, sp
1:053A  1e                push     ds
1:053B  8ed8              mov      ds, ax
1:053D  9adf050000        lcall    0, 0x5df  ; @1:INT:ord_4(1:0894)
1:0542  b90600            mov      cx, 6
1:0545  99                cdq      
1:0546  f7f9              idiv     cx
1:0548  89164e03          mov      word ptr [0x34e], dx
1:054C  8bc2              mov      ax, dx
1:054E  eb54              jmp      0x5a4
1:0550  c706ae03ff00      mov      word ptr [0x3ae], 0xff
1:0556  2bc0              sub      ax, ax
1:0558  a39203            mov      word ptr [0x392], ax
1:055B  a3a003            mov      word ptr [0x3a0], ax
1:055E  eb5d              jmp      0x5bd
1:0560  c70692030000      mov      word ptr [0x392], 0
1:0566  b8ff00            mov      ax, 0xff
1:0569  a3ae03            mov      word ptr [0x3ae], ax
1:056C  ebed              jmp      0x55b
1:056E  2bc0              sub      ax, ax
1:0570  a3ae03            mov      word ptr [0x3ae], ax
1:0573  a39203            mov      word ptr [0x392], ax
1:0576  c706a003ff00      mov      word ptr [0x3a0], 0xff
1:057C  eb3f              jmp      0x5bd
1:057E  c706ae030000      mov      word ptr [0x3ae], 0
1:0584  b8ff00            mov      ax, 0xff
1:0587  ebcf              jmp      0x558
1:0589  c7069203ff00      mov      word ptr [0x392], 0xff
1:058F  2bc0              sub      ax, ax
1:0591  ebd6              jmp      0x569
1:0593  b8ff00            mov      ax, 0xff
1:0596  a3ae03            mov      word ptr [0x3ae], ax
1:0599  a39203            mov      word ptr [0x392], ax
1:059C  c706a0030000      mov      word ptr [0x3a0], 0
1:05A2  eb19              jmp      0x5bd
1:05A4  3d0500            cmp      ax, 5
1:05A7  7714              ja       0x5bd
1:05A9  d1e0              shl      ax, 1
1:05AB  93                xchg     bx, ax
1:05AC  2effa7b105        jmp      word ptr cs:[bx + 0x5b1]
1:05B1  50                push     ax
1:05B2  056005            add      ax, 0x560
1:05B5  6e                outsb    dx, byte ptr [si]
1:05B6  057e05            add      ax, 0x57e
1:05B9  8905              mov      word ptr [di], ax
1:05BB  93                xchg     bx, ax
1:05BC  05a0ae            add      ax, 0xaea0
1:05BF  038a2692          add      cx, word ptr [bp + si - 0x6dda]
1:05C3  038a0ea0          add      cx, word ptr [bp + si - 0x5ff2]
1:05C7  032a              add      bp, word ptr [bp + si]
1:05C9  ed                in       ax, dx
1:05CA  8bd1              mov      dx, cx
1:05CC  4d                dec      bp
1:05CD  4d                dec      bp
1:05CE  8be5              mov      sp, bp
1:05D0  1f                pop      ds
1:05D1  5d                pop      bp
1:05D2  4d                dec      bp
1:05D3  cb                retf     
1:05D4  1e                push     ds
1:05D5  58                pop      ax
1:05D6  90                nop      
1:05D7  45                inc      bp
1:05D8  55                push     bp
1:05D9  8bec              mov      bp, sp
1:05DB  1e                push     ds
1:05DC  8ed8              mov      ds, ax
1:05DE  9ae1000000        lcall    0, 0xe1  ; @1:INT:ord_4(1:0894)
1:05E3  8b4e08            mov      cx, word ptr [bp + 8]
1:05E6  2b4e06            sub      cx, word ptr [bp + 6]
1:05E9  99                cdq      
1:05EA  f7f9              idiv     cx
1:05EC  035606            add      dx, word ptr [bp + 6]
1:05EF  89165003          mov      word ptr [0x350], dx
1:05F3  8bc2              mov      ax, dx
1:05F5  4d                dec      bp
1:05F6  4d                dec      bp
1:05F7  8be5              mov      sp, bp
1:05F9  1f                pop      ds
1:05FA  5d                pop      bp
1:05FB  4d                dec      bp
1:05FC  cb                retf     
1:05FD  001e5890          add      byte ptr [0x9058], bl
1:0601  45                inc      bp
1:0602  55                push     bp
1:0603  8bec              mov      bp, sp
1:0605  1e                push     ds
1:0606  8ed8              mov      ds, ax
1:0608  837e0a00          cmp      word ptr [bp + 0xa], 0
1:060C  7504              jne      0x612
1:060E  2bc0              sub      ax, ax
1:0610  eb09              jmp      0x61b
1:0612  8b460e            mov      ax, word ptr [bp + 0xe]
1:0615  a3b203            mov      word ptr [0x3b2], ax
1:0618  b80100            mov      ax, 1
1:061B  4d                dec      bp
1:061C  4d                dec      bp
1:061D  8be5              mov      sp, bp
1:061F  1f                pop      ds
1:0620  5d                pop      bp
1:0621  4d                dec      bp
1:0622  ca0a00            retf     0xa

; ===== EXPORT:WEP(#2) =====
1:0625  1e                push     ds
1:0626  58                pop      ax
1:0627  90                nop      
1:0628  45                inc      bp
1:0629  55                push     bp
1:062A  8bec              mov      bp, sp
1:062C  1e                push     ds
1:062D  8ed8              mov      ds, ax
1:062F  b80100            mov      ax, 1
1:0632  4d                dec      bp
1:0633  4d                dec      bp
1:0634  8be5              mov      sp, bp
1:0636  1f                pop      ds
1:0637  5d                pop      bp
1:0638  4d                dec      bp
1:0639  ca0200            retf     2

; ===== EXPORT:MODULE(#1) =====
1:063C  1e                push     ds
1:063D  58                pop      ax
1:063E  90                nop      
1:063F  45                inc      bp
1:0640  55                push     bp
1:0641  8bec              mov      bp, sp
1:0643  1e                push     ds
1:0644  8ed8              mov      ds, ax
1:0646  83ec0a            sub      sp, 0xa
1:0649  56                push     si
1:064A  8b4608            mov      ax, word ptr [bp + 8]
1:064D  a39603            mov      word ptr [0x396], ax
1:0650  8b4606            mov      ax, word ptr [bp + 6]
1:0653  a39003            mov      word ptr [0x390], ax
1:0656  50                push     ax
1:0657  9a77060000        lcall    0, 0x677  ; @1:KERNEL.GlobalLock
1:065C  a3a803            mov      word ptr [0x3a8], ax
1:065F  8916aa03          mov      word ptr [0x3aa], dx
1:0663  8bc2              mov      ax, dx
1:0665  0b06a803          or       ax, word ptr [0x3a8]
1:0669  7503              jne      0x66e
1:066B  e96a01            jmp      0x7d8
1:066E  c41ea803          les      bx, ptr [0x3a8]
1:0672  26ff7720          push     word ptr es:[bx + 0x20]
1:0676  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalLock
1:067B  a3f609            mov      word ptr [0x9f6], ax
1:067E  8916f809          mov      word ptr [0x9f8], dx
1:0682  8bc2              mov      ax, dx
1:0684  0b06f609          or       ax, word ptr [0x9f6]
1:0688  7503              jne      0x68d
1:068A  e94201            jmp      0x7cf
1:068D  8b460a            mov      ax, word ptr [bp + 0xa]
1:0690  e90801            jmp      0x79b
1:0693  c41ea803          les      bx, ptr [0x3a8]
1:0697  26837f1465        cmp      word ptr es:[bx + 0x14], 0x65
1:069C  7c0f              jl       0x6ad
1:069E  26817f36f400      cmp      word ptr es:[bx + 0x36], 0xf4
1:06A4  7507              jne      0x6ad
1:06A6  26837f3878        cmp      word ptr es:[bx + 0x38], 0x78
1:06AB  740e              je       0x6bb
1:06AD  c70610000000      mov      word ptr [0x10], 0
1:06B3  c746fc0500        mov      word ptr [bp - 4], 5
1:06B8  e90701            jmp      0x7c2
1:06BB  c70610000100      mov      word ptr [0x10], 1
1:06C1  e9fe00            jmp      0x7c2
1:06C4  b85203            mov      ax, 0x352
1:06C7  50                push     ax
1:06C8  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_14(1:081E)
1:06CD  5b                pop      bx
1:06CE  ff365203          push     word ptr [0x352]
1:06D2  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_13(1:0880)
1:06D7  5b                pop      bx
1:06D8  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:0012)
1:06DD  eb13              jmp      0x6f2
1:06DF  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:01E9)
1:06E4  eb0c              jmp      0x6f2
1:06E6  833e100000        cmp      word ptr [0x10], 0
1:06EB  740b              je       0x6f8
1:06ED  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:02A4)
1:06F2  8946fc            mov      word ptr [bp - 4], ax
1:06F5  e9ca00            jmp      0x7c2
1:06F8  ff369603          push     word ptr [0x396]
1:06FC  b800ff            mov      ax, 0xff00
1:06FF  baff00            mov      dx, 0xff
1:0702  52                push     dx
1:0703  50                push     ax
1:0704  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextColor
1:0709  ff369603          push     word ptr [0x396]
1:070D  2bc0              sub      ax, ax
1:070F  50                push     ax
1:0710  50                push     ax
1:0711  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkColor
1:0716  ff369603          push     word ptr [0x396]
1:071A  2bc0              sub      ax, ax
1:071C  50                push     ax
1:071D  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextAlign
1:0722  ff369603          push     word ptr [0x396]
1:0726  b80100            mov      ax, 1
1:0729  50                push     ax
1:072A  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkMode
1:072F  ff369603          push     word ptr [0x396]
1:0733  2bc0              sub      ax, ax
1:0735  50                push     ax
1:0736  50                push     ax
1:0737  b81200            mov      ax, 0x12
1:073A  1e                push     ds
1:073B  50                push     ax
1:073C  50                push     ax
1:073D  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:0802)
1:0742  5b                pop      bx
1:0743  50                push     ax
1:0744  9affff0000        lcall    0, 0xffff  ; @1:GDI.TextOut
1:0749  eb77              jmp      0x7c2
1:074B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:051F)
1:0750  eba0              jmp      0x6f2
1:0752  a1b203            mov      ax, word ptr [0x3b2]
1:0755  c41ef609          les      bx, ptr [0x9f6]
1:0759  26894716          mov      word ptr es:[bx + 0x16], ax
1:075D  c746f60000        mov      word ptr [bp - 0xa], 0
1:0762  8b46f6            mov      ax, word ptr [bp - 0xa]
1:0765  8bf0              mov      si, ax
1:0767  d1e6              shl      si, 1
1:0769  40                inc      ax
1:076A  c41ef609          les      bx, ptr [0x9f6]
1:076E  2689400e          mov      word ptr es:[bx + si + 0xe], ax
1:0772  ff46f6            inc      word ptr [bp - 0xa]
1:0775  837ef604          cmp      word ptr [bp - 0xa], 4
1:0779  7ce7              jl       0x762
1:077B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:027C)
1:0780  e96fff            jmp      0x6f2
1:0783  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_6(1:0290)
1:0788  e967ff            jmp      0x6f2
1:078B  8b460a            mov      ax, word ptr [bp + 0xa]
1:078E  2d0700            sub      ax, 7
1:0791  50                push     ax
1:0792  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_5(1:022F)
1:0797  5b                pop      bx
1:0798  e957ff            jmp      0x6f2
1:079B  3d0c00            cmp      ax, 0xc
1:079E  7722              ja       0x7c2
1:07A0  d1e0              shl      ax, 1
1:07A2  93                xchg     bx, ax
1:07A3  2effa7a807        jmp      word ptr cs:[bx + 0x7a8]
1:07A8  c406df06          les      ax, ptr [0x6df]
1:07AC  e606              out      6, al
1:07AE  4b                dec      bx
1:07AF  07                pop      es
1:07B0  c20752            ret      0x5207
1:07B3  07                pop      es
1:07B4  83078b            add      word ptr [bx], -0x75
1:07B7  07                pop      es
1:07B8  8b07              mov      ax, word ptr [bx]
1:07BA  8b07              mov      ax, word ptr [bx]
1:07BC  8b07              mov      ax, word ptr [bx]
1:07BE  c20793            ret      0x9307
1:07C1  06                push     es
1:07C2  c41ea803          les      bx, ptr [0x3a8]
1:07C6  26ff7720          push     word ptr es:[bx + 0x20]
1:07CA  9ad4070000        lcall    0, 0x7d4  ; @1:KERNEL.GlobalUnlock
1:07CF  ff369003          push     word ptr [0x390]
1:07D3  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalUnlock
1:07D8  8b46fc            mov      ax, word ptr [bp - 4]
1:07DB  5e                pop      si
1:07DC  4d                dec      bp
1:07DD  4d                dec      bp
1:07DE  8be5              mov      sp, bp
1:07E0  1f                pop      ds
1:07E1  5d                pop      bp
1:07E2  4d                dec      bp
1:07E3  ca0600            retf     6
1:07E6  0000              add      byte ptr [bx + si], al
1:07E8  0000              add      byte ptr [bx + si], al
1:07EA  0000              add      byte ptr [bx + si], al
1:07EC  0000              add      byte ptr [bx + si], al
1:07EE  0000              add      byte ptr [bx + si], al
1:07F0  0000              add      byte ptr [bx + si], al
1:07F2  0000              add      byte ptr [bx + si], al
1:07F4  0000              add      byte ptr [bx + si], al
1:07F6  0000              add      byte ptr [bx + si], al
1:07F8  0000              add      byte ptr [bx + si], al
1:07FA  0000              add      byte ptr [bx + si], al
1:07FC  0000              add      byte ptr [bx + si], al
1:07FE  0000              add      byte ptr [bx + si], al
1:0800  c3                ret      
1:0801  00558b            add      byte ptr [di - 0x75], dl
1:0804  ec                in       al, dx
1:0805  8bd7              mov      dx, di
1:0807  8cd8              mov      ax, ds
1:0809  8ec0              mov      es, ax
1:080B  8b7e06            mov      di, word ptr [bp + 6]
1:080E  33c0              xor      ax, ax
1:0810  b9ffff            mov      cx, 0xffff
1:0813  f2ae              repne scasb al, byte ptr es:[di]
1:0815  f7d1              not      cx
1:0817  49                dec      cx
1:0818  91                xchg     cx, ax
1:0819  8bfa              mov      di, dx
1:081B  5d                pop      bp
1:081C  cb                retf     
1:081D  008cd890          add      byte ptr [si - 0x6f28], cl
1:0821  45                inc      bp
1:0822  55                push     bp
1:0823  8bec              mov      bp, sp
1:0825  1e                push     ds
1:0826  8ed8              mov      ds, ax
1:0828  56                push     si
1:0829  b42a              mov      ah, 0x2a
1:082B  cd21              int      0x21
1:082D  8bda              mov      bx, dx
1:082F  8bf1              mov      si, cx
1:0831  b42c              mov      ah, 0x2c
1:0833  cd21              int      0x21
1:0835  b400              mov      ah, 0
1:0837  8ac6              mov      al, dh
1:0839  50                push     ax
1:083A  8ac1              mov      al, cl
1:083C  50                push     ax
1:083D  8ac5              mov      al, ch
1:083F  50                push     ax
1:0840  50                push     ax
1:0841  b42a              mov      ah, 0x2a
1:0843  cd21              int      0x21
1:0845  3bda              cmp      bx, dx
1:0847  58                pop      ax
1:0848  7408              je       0x852
1:084A  3c17              cmp      al, 0x17
1:084C  7504              jne      0x852
1:084E  8bd3              mov      dx, bx
1:0850  8bce              mov      cx, si
1:0852  b400              mov      ah, 0
1:0854  8ac2              mov      al, dl
1:0856  50                push     ax
1:0857  8ac6              mov      al, dh
1:0859  50                push     ax
1:085A  81e9bc07          sub      cx, 0x7bc
1:085E  51                push     cx
1:085F  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_16(1:08C4)
1:0864  83c40c            add      sp, 0xc
1:0867  837e0600          cmp      word ptr [bp + 6], 0
1:086B  7408              je       0x875
1:086D  8b5e06            mov      bx, word ptr [bp + 6]
1:0870  895702            mov      word ptr [bx + 2], dx
1:0873  8907              mov      word ptr [bx], ax
1:0875  5e                pop      si
1:0876  83ed02            sub      bp, 2
1:0879  8be5              mov      sp, bp
1:087B  1f                pop      ds
1:087C  5d                pop      bp
1:087D  4d                dec      bp
1:087E  cb                retf     
1:087F  004555            add      byte ptr [di + 0x55], al
1:0882  8bec              mov      bp, sp
1:0884  8b4606            mov      ax, word ptr [bp + 6]
1:0887  a35200            mov      word ptr [0x52], ax
1:088A  c70654000000      mov      word ptr [0x54], 0
1:0890  5d                pop      bp
1:0891  4d                dec      bp
1:0892  cb                retf     
1:0893  90                nop      

; ===== EXPORT:ord_4(#4) =====
1:0894  45                inc      bp
1:0895  55                push     bp
1:0896  8bec              mov      bp, sp
1:0898  b8fd43            mov      ax, 0x43fd