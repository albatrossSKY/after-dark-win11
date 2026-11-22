File: raw\unpacked\MODULES\RAIN.AD
Module: 'RAIN' ('Graphics Module Library')
CS:IP=1:0E94  SS:SP=0:0000  AutoDS=2  Heap=1024  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (3): KERNEL, GDI, USER
Segments (2):
  SEG  1: CODE off=0x00600 len=0x0EC6 min=0x0EC6 flags=0x0D50 relocs=71
  SEG  2: DATA off=0x01640 len=0x050A min=0x050A flags=0x0C71 relocs=0
Exports (29):
  ord   1: SEG1:0488 flags=0x03 MODULE
  ord   2: SEG1:0471 flags=0x03 WEP
  ord   3: SEG1:0E80 flags=0x03 ___EXPORTEDSTUB
  ord   4: SEG1:0746 flags=0x00 
  ord   5: SEG1:0714 flags=0x00 
  ord   6: SEG1:06E4 flags=0x00 
  ord   7: SEG1:010E flags=0x00 
  ord   8: SEG1:00FA flags=0x00 
  ord   9: SEG1:00E6 flags=0x00 
  ord  10: SEG1:00D2 flags=0x00 
  ord  11: SEG1:0652 flags=0x00 
  ord  12: SEG1:00A2 flags=0x00 
  ord  13: SEG1:0055 flags=0x00 
  ord  14: SEG1:0012 flags=0x00 
  ord  15: SEG1:06D0 flags=0x00 
  ord  16: SEG1:066E flags=0x00 
  ord  17: SEG1:044A flags=0x00 
  ord  18: SEG1:07A6 flags=0x00 
  ord  19: SEG1:09EA flags=0x00 
  ord  20: SEG1:08AA flags=0x00 
  ord  21: SEG1:0B1C flags=0x00 
  ord  22: SEG1:0B44 flags=0x00 
  ord  23: SEG1:0BE6 flags=0x00 
  ord  24: SEG1:0BAA flags=0x00 
  ord  25: SEG1:0C10 flags=0x00 
  ord  26: SEG1:0B48 flags=0x00 
  ord  27: SEG1:08C4 flags=0x00 
  ord  28: SEG1:0DB4 flags=0x00 
  ord  29: SEG1:0E70 flags=0x00 
Resources (7):
  TYPE_1000        #1               off=0x01B80 len=    64
  TYPE_1000        #2               off=0x01BC0 len=    64
  TYPE_1000        #3               off=0x01C00 len=    32
  TYPE_1000        #4               off=0x01C20 len=    32
  TYPE_2000        #10              off=0x01C40 len=    80
  TYPE_2000        #20              off=0x01C90 len=    16
  TYPE_2000        #30              off=0x01CA0 len=   112

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
1:001C  c41e0605          les      bx, ptr [0x506]
1:0020  268b4706          mov      ax, word ptr es:[bx + 6]
1:0024  a31200            mov      word ptr [0x12], ax
1:0027  268b4708          mov      ax, word ptr es:[bx + 8]
1:002B  a31000            mov      word ptr [0x10], ax
1:002E  2bc0              sub      ax, ax
1:0030  a30405            mov      word ptr [0x504], ax
1:0033  a33003            mov      word ptr [0x330], ax
1:0036  eb0a              jmp      0x42
1:0038  50                push     ax
1:0039  0e                push     cs
1:003A  e81401            call     0x151
1:003D  5b                pop      bx
1:003E  ff063003          inc      word ptr [0x330]
1:0042  a13003            mov      ax, word ptr [0x330]
1:0045  39061200          cmp      word ptr [0x12], ax
1:0049  7fed              jg       0x38
1:004B  2bc0              sub      ax, ax
1:004D  4d                dec      bp
1:004E  4d                dec      bp
1:004F  8be5              mov      sp, bp
1:0051  1f                pop      ds
1:0052  5d                pop      bp
1:0053  4d                dec      bp
1:0054  cb                retf     

; ===== EXPORT:ord_13(#13) =====
1:0055  1e                push     ds
1:0056  58                pop      ax
1:0057  90                nop      
1:0058  45                inc      bp
1:0059  55                push     bp
1:005A  8bec              mov      bp, sp
1:005C  1e                push     ds
1:005D  8ed8              mov      ds, ax
1:005F  c41e0605          les      bx, ptr [0x506]
1:0063  26837f0c00        cmp      word ptr es:[bx + 0xc], 0
1:0068  742e              je       0x98
1:006A  b83203            mov      ax, 0x332
1:006D  1e                push     ds
1:006E  50                push     ax
1:006F  2bc0              sub      ax, ax
1:0071  50                push     ax
1:0072  50                push     ax
1:0073  26ff7702          push     word ptr es:[bx + 2]
1:0077  26ff7704          push     word ptr es:[bx + 4]
1:007B  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:0080  ff36fc04          push     word ptr [0x4fc]
1:0084  b83203            mov      ax, 0x332
1:0087  1e                push     ds
1:0088  50                push     ax
1:0089  b80400            mov      ax, 4
1:008C  50                push     ax
1:008D  9af4020000        lcall    0, 0x2f4  ; @1:GDI.GetStockObject
1:0092  50                push     ax
1:0093  9affff0000        lcall    0, 0xffff  ; @1:USER.FillRect
1:0098  2bc0              sub      ax, ax
1:009A  4d                dec      bp
1:009B  4d                dec      bp
1:009C  8be5              mov      sp, bp
1:009E  1f                pop      ds
1:009F  5d                pop      bp
1:00A0  4d                dec      bp
1:00A1  cb                retf     

; ===== EXPORT:ord_12(#12) =====
1:00A2  1e                push     ds
1:00A3  58                pop      ax
1:00A4  90                nop      
1:00A5  45                inc      bp
1:00A6  55                push     bp
1:00A7  8bec              mov      bp, sp
1:00A9  1e                push     ds
1:00AA  8ed8              mov      ds, ax
1:00AC  ff360405          push     word ptr [0x504]
1:00B0  0e                push     cs
1:00B1  e8c101            call     0x275
1:00B4  5b                pop      bx
1:00B5  a11200            mov      ax, word ptr [0x12]
1:00B8  ff060405          inc      word ptr [0x504]
1:00BC  39060405          cmp      word ptr [0x504], ax
1:00C0  7c06              jl       0xc8
1:00C2  c70604050000      mov      word ptr [0x504], 0
1:00C8  2bc0              sub      ax, ax
1:00CA  4d                dec      bp
1:00CB  4d                dec      bp
1:00CC  8be5              mov      sp, bp
1:00CE  1f                pop      ds
1:00CF  5d                pop      bp
1:00D0  4d                dec      bp
1:00D1  cb                retf     

; ===== EXPORT:ord_10(#10) =====
1:00D2  1e                push     ds
1:00D3  58                pop      ax
1:00D4  90                nop      
1:00D5  45                inc      bp
1:00D6  55                push     bp
1:00D7  8bec              mov      bp, sp
1:00D9  1e                push     ds
1:00DA  8ed8              mov      ds, ax
1:00DC  2bc0              sub      ax, ax
1:00DE  4d                dec      bp
1:00DF  4d                dec      bp
1:00E0  8be5              mov      sp, bp
1:00E2  1f                pop      ds
1:00E3  5d                pop      bp
1:00E4  4d                dec      bp
1:00E5  cb                retf     

; ===== EXPORT:ord_9(#9) =====
1:00E6  1e                push     ds
1:00E7  58                pop      ax
1:00E8  90                nop      
1:00E9  45                inc      bp
1:00EA  55                push     bp
1:00EB  8bec              mov      bp, sp
1:00ED  1e                push     ds
1:00EE  8ed8              mov      ds, ax
1:00F0  2bc0              sub      ax, ax
1:00F2  4d                dec      bp
1:00F3  4d                dec      bp
1:00F4  8be5              mov      sp, bp
1:00F6  1f                pop      ds
1:00F7  5d                pop      bp
1:00F8  4d                dec      bp
1:00F9  cb                retf     

; ===== EXPORT:ord_8(#8) =====
1:00FA  1e                push     ds
1:00FB  58                pop      ax
1:00FC  90                nop      
1:00FD  45                inc      bp
1:00FE  55                push     bp
1:00FF  8bec              mov      bp, sp
1:0101  1e                push     ds
1:0102  8ed8              mov      ds, ax
1:0104  2bc0              sub      ax, ax
1:0106  4d                dec      bp
1:0107  4d                dec      bp
1:0108  8be5              mov      sp, bp
1:010A  1f                pop      ds
1:010B  5d                pop      bp
1:010C  4d                dec      bp
1:010D  cb                retf     

; ===== EXPORT:ord_7(#7) =====
1:010E  1e                push     ds
1:010F  58                pop      ax
1:0110  90                nop      
1:0111  45                inc      bp
1:0112  55                push     bp
1:0113  8bec              mov      bp, sp
1:0115  1e                push     ds
1:0116  8ed8              mov      ds, ax
1:0118  c41efe04          les      bx, ptr [0x4fe]
1:011C  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:0121  7404              je       0x127
1:0123  2bc0              sub      ax, ax
1:0125  eb22              jmp      0x149
1:0127  8b4606            mov      ax, word ptr [bp + 6]
1:012A  0bc0              or       ax, ax
1:012C  7405              je       0x133
1:012E  48                dec      ax
1:012F  740b              je       0x13c
1:0131  ebf0              jmp      0x123
1:0133  0e                push     cs
1:0134  e89bff            call     0xd2
1:0137  b80300            mov      ax, 3
1:013A  eb0d              jmp      0x149
1:013C  c41e0605          les      bx, ptr [0x506]
1:0140  268b4708          mov      ax, word ptr es:[bx + 8]
1:0144  a31000            mov      word ptr [0x10], ax
1:0147  ebda              jmp      0x123
1:0149  4d                dec      bp
1:014A  4d                dec      bp
1:014B  8be5              mov      sp, bp
1:014D  1f                pop      ds
1:014E  5d                pop      bp
1:014F  4d                dec      bp
1:0150  cb                retf     
1:0151  1e                push     ds
1:0152  58                pop      ax
1:0153  90                nop      
1:0154  45                inc      bp
1:0155  55                push     bp
1:0156  8bec              mov      bp, sp
1:0158  1e                push     ds
1:0159  8ed8              mov      ds, ax
1:015B  56                push     si
1:015C  9a19020000        lcall    0, 0x219  ; @1:INT:ord_6(1:06E4)
1:0161  b90600            mov      cx, 6
1:0164  99                cdq      
1:0165  f7f9              idiv     cx
1:0167  89163a03          mov      word ptr [0x33a], dx
1:016B  8bc2              mov      ax, dx
1:016D  e98f00            jmp      0x1ff
1:0170  b81200            mov      ax, 0x12
1:0173  f76e06            imul     word ptr [bp + 6]
1:0176  8bd8              mov      bx, ax
1:0178  c7878203ff00      mov      word ptr [bx + 0x382], 0xff
1:017E  2bc0              sub      ax, ax
1:0180  89878403          mov      word ptr [bx + 0x384], ax
1:0184  89878603          mov      word ptr [bx + 0x386], ax
1:0188  e98d00            jmp      0x218
1:018B  b81200            mov      ax, 0x12
1:018E  f76e06            imul     word ptr [bp + 6]
1:0191  8bd8              mov      bx, ax
1:0193  c7878203ff00      mov      word ptr [bx + 0x382], 0xff
1:0199  c78784030000      mov      word ptr [bx + 0x384], 0
1:019F  c7878603ff00      mov      word ptr [bx + 0x386], 0xff
1:01A5  eb71              jmp      0x218
1:01A7  b81200            mov      ax, 0x12
1:01AA  f76e06            imul     word ptr [bp + 6]
1:01AD  8bd8              mov      bx, ax
1:01AF  2bc0              sub      ax, ax
1:01B1  89878203          mov      word ptr [bx + 0x382], ax
1:01B5  89878403          mov      word ptr [bx + 0x384], ax
1:01B9  ebe4              jmp      0x19f
1:01BB  b81200            mov      ax, 0x12
1:01BE  f76e06            imul     word ptr [bp + 6]
1:01C1  8bd8              mov      bx, ax
1:01C3  c78782030000      mov      word ptr [bx + 0x382], 0
1:01C9  b8ff00            mov      ax, 0xff
1:01CC  ebb2              jmp      0x180
1:01CE  b81200            mov      ax, 0x12
1:01D1  f76e06            imul     word ptr [bp + 6]
1:01D4  8bd8              mov      bx, ax
1:01D6  c78782030000      mov      word ptr [bx + 0x382], 0
1:01DC  c7878403ff00      mov      word ptr [bx + 0x384], 0xff
1:01E2  c78786030000      mov      word ptr [bx + 0x386], 0
1:01E8  eb2e              jmp      0x218
1:01EA  b81200            mov      ax, 0x12
1:01ED  f76e06            imul     word ptr [bp + 6]
1:01F0  8bd8              mov      bx, ax
1:01F2  b8ff00            mov      ax, 0xff
1:01F5  89878203          mov      word ptr [bx + 0x382], ax
1:01F9  89878403          mov      word ptr [bx + 0x384], ax
1:01FD  ebe3              jmp      0x1e2
1:01FF  3d0500            cmp      ax, 5
1:0202  7714              ja       0x218
1:0204  d1e0              shl      ax, 1
1:0206  93                xchg     bx, ax
1:0207  2effa70c02        jmp      word ptr cs:[bx + 0x20c]
1:020C  7001              jo       0x20f
1:020E  8b01              mov      ax, word ptr [bx + di]
1:0210  a7                cmpsw    word ptr [si], word ptr es:[di]
1:0211  01bb01ce          add      word ptr [bp + di - 0x31ff], di
1:0215  01ea              add      dx, bp
1:0217  019a4902          add      word ptr [bp + si + 0x249], bx  ; @2:INT:ord_6(1:06E4)
1:021B  0000              add      byte ptr [bx + si], al
1:021D  99                cdq      
1:021E  f73e1000          idiv     word ptr [0x10]
1:0222  8bc2              mov      ax, dx
1:0224  050700            add      ax, 7
1:0227  99                cdq      
1:0228  8bc8              mov      cx, ax
1:022A  b81200            mov      ax, 0x12
1:022D  8bda              mov      bx, dx
1:022F  f76e06            imul     word ptr [bp + 6]
1:0232  8bf0              mov      si, ax
1:0234  898c9003          mov      word ptr [si + 0x390], cx
1:0238  899c9203          mov      word ptr [si + 0x392], bx
1:023C  c7848c030400      mov      word ptr [si + 0x38c], 4
1:0242  c7848e030000      mov      word ptr [si + 0x38e], 0
1:0248  9a5b020000        lcall    0, 0x25b  ; @1:INT:ord_6(1:06E4)
1:024D  c41e0605          les      bx, ptr [0x506]
1:0251  99                cdq      
1:0252  26f77f02          idiv     word ptr es:[bx + 2]
1:0256  89948803          mov      word ptr [si + 0x388], dx
1:025A  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_6(1:06E4)
1:025F  c41e0605          les      bx, ptr [0x506]
1:0263  99                cdq      
1:0264  26f77f04          idiv     word ptr es:[bx + 4]
1:0268  89948a03          mov      word ptr [si + 0x38a], dx
1:026C  5e                pop      si
1:026D  4d                dec      bp
1:026E  4d                dec      bp
1:026F  8be5              mov      sp, bp
1:0271  1f                pop      ds
1:0272  5d                pop      bp
1:0273  4d                dec      bp
1:0274  cb                retf     
1:0275  1e                push     ds
1:0276  58                pop      ax
1:0277  90                nop      
1:0278  45                inc      bp
1:0279  55                push     bp
1:027A  8bec              mov      bp, sp
1:027C  1e                push     ds
1:027D  8ed8              mov      ds, ax
1:027F  56                push     si
1:0280  b81200            mov      ax, 0x12
1:0283  f76e06            imul     word ptr [bp + 6]
1:0286  8bd8              mov      bx, ax
1:0288  8b878c03          mov      ax, word ptr [bx + 0x38c]
1:028C  a34003            mov      word ptr [0x340], ax
1:028F  8b879003          mov      ax, word ptr [bx + 0x390]
1:0293  8b979203          mov      dx, word ptr [bx + 0x392]
1:0297  d1ea              shr      dx, 1
1:0299  d1d8              rcr      ax, 1
1:029B  3b978e03          cmp      dx, word ptr [bx + 0x38e]
1:029F  7715              ja       0x2b6
1:02A1  7206              jb       0x2a9
1:02A3  3b878c03          cmp      ax, word ptr [bx + 0x38c]
1:02A7  730d              jae      0x2b6
1:02A9  ff36fc04          push     word ptr [0x4fc]
1:02AD  2bc0              sub      ax, ax
1:02AF  50                push     ax
1:02B0  b80100            mov      ax, 1
1:02B3  50                push     ax
1:02B4  eb13              jmp      0x2c9
1:02B6  ff36fc04          push     word ptr [0x4fc]
1:02BA  2bc0              sub      ax, ax
1:02BC  50                push     ax
1:02BD  b80200            mov      ax, 2
1:02C0  50                push     ax
1:02C1  b81200            mov      ax, 0x12
1:02C4  f76e06            imul     word ptr [bp + 6]
1:02C7  8bd8              mov      bx, ax
1:02C9  8aa78403          mov      ah, byte ptr [bx + 0x384]
1:02CD  2ac0              sub      al, al
1:02CF  8a8f8203          mov      cl, byte ptr [bx + 0x382]
1:02D3  2aed              sub      ch, ch
1:02D5  0bc1              or       ax, cx
1:02D7  8a8f8603          mov      cl, byte ptr [bx + 0x386]
1:02DB  51                push     cx
1:02DC  50                push     ax
1:02DD  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreatePen
1:02E2  50                push     ax
1:02E3  9afa020000        lcall    0, 0x2fa  ; @1:GDI.SelectObject
1:02E8  a34403            mov      word ptr [0x344], ax
1:02EB  ff36fc04          push     word ptr [0x4fc]
1:02EF  b80400            mov      ax, 4
1:02F2  50                push     ax
1:02F3  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:02F8  50                push     ax
1:02F9  9a66030000        lcall    0, 0x366  ; @1:GDI.SelectObject
1:02FE  a34603            mov      word ptr [0x346], ax
1:0301  c41efe04          les      bx, ptr [0x4fe]
1:0305  268b470c          mov      ax, word ptr es:[bx + 0xc]
1:0309  99                cdq      
1:030A  52                push     dx
1:030B  50                push     ax
1:030C  268b470e          mov      ax, word ptr es:[bx + 0xe]
1:0310  99                cdq      
1:0311  52                push     dx
1:0312  50                push     ax
1:0313  b81200            mov      ax, 0x12
1:0316  f76e06            imul     word ptr [bp + 6]
1:0319  8bd8              mov      bx, ax
1:031B  ffb78e03          push     word ptr [bx + 0x38e]
1:031F  ffb78c03          push     word ptr [bx + 0x38c]
1:0323  8bf3              mov      si, bx
1:0325  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_5(1:0714)
1:032A  52                push     dx
1:032B  50                push     ax
1:032C  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_4(1:0746)
1:0331  a34203            mov      word ptr [0x342], ax
1:0334  ff36fc04          push     word ptr [0x4fc]
1:0338  8b848803          mov      ax, word ptr [si + 0x388]
1:033C  8bc8              mov      cx, ax
1:033E  2b064203          sub      ax, word ptr [0x342]
1:0342  50                push     ax
1:0343  8b848a03          mov      ax, word ptr [si + 0x38a]
1:0347  8bd0              mov      dx, ax
1:0349  2b064003          sub      ax, word ptr [0x340]
1:034D  50                push     ax
1:034E  030e4203          add      cx, word ptr [0x342]
1:0352  51                push     cx
1:0353  03164003          add      dx, word ptr [0x340]
1:0357  52                push     dx
1:0358  9affff0000        lcall    0, 0xffff  ; @1:GDI.Ellipse
1:035D  ff36fc04          push     word ptr [0x4fc]
1:0361  ff364403          push     word ptr [0x344]
1:0365  9a79030000        lcall    0, 0x379  ; @1:GDI.SelectObject
1:036A  50                push     ax
1:036B  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteObject
1:0370  ff36fc04          push     word ptr [0x4fc]
1:0374  ff364603          push     word ptr [0x346]
1:0378  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectObject
1:037D  8b848c03          mov      ax, word ptr [si + 0x38c]
1:0381  8b948e03          mov      dx, word ptr [si + 0x38e]
1:0385  050300            add      ax, 3
1:0388  83d200            adc      dx, 0
1:038B  3b949203          cmp      dx, word ptr [si + 0x392]
1:038F  7303              jae      0x394
1:0391  e99b00            jmp      0x42f
1:0394  7709              ja       0x39f
1:0396  3b849003          cmp      ax, word ptr [si + 0x390]
1:039A  7703              ja       0x39f
1:039C  e99000            jmp      0x42f
1:039F  ff064003          inc      word ptr [0x340]
1:03A3  83848c0301        add      word ptr [si + 0x38c], 1
1:03A8  83948e0300        adc      word ptr [si + 0x38e], 0
1:03AD  c41efe04          les      bx, ptr [0x4fe]
1:03B1  268b470c          mov      ax, word ptr es:[bx + 0xc]
1:03B5  99                cdq      
1:03B6  52                push     dx
1:03B7  50                push     ax
1:03B8  268b470e          mov      ax, word ptr es:[bx + 0xe]
1:03BC  99                cdq      
1:03BD  52                push     dx
1:03BE  50                push     ax
1:03BF  ffb48e03          push     word ptr [si + 0x38e]
1:03C3  ffb48c03          push     word ptr [si + 0x38c]
1:03C7  9a26030000        lcall    0, 0x326  ; @1:INT:ord_5(1:0714)
1:03CC  52                push     dx
1:03CD  50                push     ax
1:03CE  9a2d030000        lcall    0, 0x32d  ; @1:INT:ord_4(1:0746)
1:03D3  a34203            mov      word ptr [0x342], ax
1:03D6  ff36fc04          push     word ptr [0x4fc]
1:03DA  b80700            mov      ax, 7
1:03DD  50                push     ax
1:03DE  9af2030000        lcall    0, 0x3f2  ; @1:GDI.GetStockObject
1:03E3  50                push     ax
1:03E4  9af8030000        lcall    0, 0x3f8  ; @1:GDI.SelectObject
1:03E9  ff36fc04          push     word ptr [0x4fc]
1:03ED  b80400            mov      ax, 4
1:03F0  50                push     ax
1:03F1  9a8e000000        lcall    0, 0x8e  ; @1:GDI.GetStockObject
1:03F6  50                push     ax
1:03F7  9ae4020000        lcall    0, 0x2e4  ; @1:GDI.SelectObject
1:03FC  ff36fc04          push     word ptr [0x4fc]
1:0400  8b848803          mov      ax, word ptr [si + 0x388]
1:0404  8bc8              mov      cx, ax
1:0406  2b064203          sub      ax, word ptr [0x342]
1:040A  50                push     ax
1:040B  8b848a03          mov      ax, word ptr [si + 0x38a]
1:040F  8bd0              mov      dx, ax
1:0411  2b064003          sub      ax, word ptr [0x340]
1:0415  50                push     ax
1:0416  030e4203          add      cx, word ptr [0x342]
1:041A  51                push     cx
1:041B  03164003          add      dx, word ptr [0x340]
1:041F  52                push     dx
1:0420  9a59030000        lcall    0, 0x359  ; @1:GDI.Ellipse
1:0425  ff7606            push     word ptr [bp + 6]
1:0428  0e                push     cs
1:0429  e825fd            call     0x151
1:042C  5b                pop      bx
1:042D  eb12              jmp      0x441
1:042F  b81200            mov      ax, 0x12
1:0432  f76e06            imul     word ptr [bp + 6]
1:0435  8bd8              mov      bx, ax
1:0437  83878c0303        add      word ptr [bx + 0x38c], 3
1:043C  83978e0300        adc      word ptr [bx + 0x38e], 0
1:0441  5e                pop      si
1:0442  4d                dec      bp
1:0443  4d                dec      bp
1:0444  8be5              mov      sp, bp
1:0446  1f                pop      ds
1:0447  5d                pop      bp
1:0448  4d                dec      bp
1:0449  cb                retf     

; ===== EXPORT:ord_17(#17) =====
1:044A  1e                push     ds
1:044B  58                pop      ax
1:044C  90                nop      
1:044D  45                inc      bp
1:044E  55                push     bp
1:044F  8bec              mov      bp, sp
1:0451  1e                push     ds
1:0452  8ed8              mov      ds, ax
1:0454  837e0a00          cmp      word ptr [bp + 0xa], 0
1:0458  7504              jne      0x45e
1:045A  2bc0              sub      ax, ax
1:045C  eb09              jmp      0x467
1:045E  8b460e            mov      ax, word ptr [bp + 0xe]
1:0461  a30205            mov      word ptr [0x502], ax
1:0464  b80100            mov      ax, 1
1:0467  4d                dec      bp
1:0468  4d                dec      bp
1:0469  8be5              mov      sp, bp
1:046B  1f                pop      ds
1:046C  5d                pop      bp
1:046D  4d                dec      bp
1:046E  ca0a00            retf     0xa

; ===== EXPORT:WEP(#2) =====
1:0471  1e                push     ds
1:0472  58                pop      ax
1:0473  90                nop      
1:0474  45                inc      bp
1:0475  55                push     bp
1:0476  8bec              mov      bp, sp
1:0478  1e                push     ds
1:0479  8ed8              mov      ds, ax
1:047B  b80100            mov      ax, 1
1:047E  4d                dec      bp
1:047F  4d                dec      bp
1:0480  8be5              mov      sp, bp
1:0482  1f                pop      ds
1:0483  5d                pop      bp
1:0484  4d                dec      bp
1:0485  ca0200            retf     2

; ===== EXPORT:MODULE(#1) =====
1:0488  1e                push     ds
1:0489  58                pop      ax
1:048A  90                nop      
1:048B  45                inc      bp
1:048C  55                push     bp
1:048D  8bec              mov      bp, sp
1:048F  1e                push     ds
1:0490  8ed8              mov      ds, ax
1:0492  83ec0a            sub      sp, 0xa
1:0495  56                push     si
1:0496  8b4608            mov      ax, word ptr [bp + 8]
1:0499  a3fc04            mov      word ptr [0x4fc], ax
1:049C  8b4606            mov      ax, word ptr [bp + 6]
1:049F  a38003            mov      word ptr [0x380], ax
1:04A2  50                push     ax
1:04A3  9ac3040000        lcall    0, 0x4c3  ; @1:KERNEL.GlobalLock
1:04A8  a3fe04            mov      word ptr [0x4fe], ax
1:04AB  89160005          mov      word ptr [0x500], dx
1:04AF  8bc2              mov      ax, dx
1:04B1  0b06fe04          or       ax, word ptr [0x4fe]
1:04B5  7503              jne      0x4ba
1:04B7  e96a01            jmp      0x624
1:04BA  c41efe04          les      bx, ptr [0x4fe]
1:04BE  26ff7720          push     word ptr es:[bx + 0x20]
1:04C2  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalLock
1:04C7  a30605            mov      word ptr [0x506], ax
1:04CA  89160805          mov      word ptr [0x508], dx
1:04CE  8bc2              mov      ax, dx
1:04D0  0b060605          or       ax, word ptr [0x506]
1:04D4  7503              jne      0x4d9
1:04D6  e94201            jmp      0x61b
1:04D9  8b460a            mov      ax, word ptr [bp + 0xa]
1:04DC  e90801            jmp      0x5e7
1:04DF  c41efe04          les      bx, ptr [0x4fe]
1:04E3  26837f1465        cmp      word ptr es:[bx + 0x14], 0x65
1:04E8  7c0f              jl       0x4f9
1:04EA  26817f36f400      cmp      word ptr es:[bx + 0x36], 0xf4
1:04F0  7507              jne      0x4f9
1:04F2  26837f3878        cmp      word ptr es:[bx + 0x38], 0x78
1:04F7  740e              je       0x507
1:04F9  c70614000000      mov      word ptr [0x14], 0
1:04FF  c746fc0500        mov      word ptr [bp - 4], 5
1:0504  e90701            jmp      0x60e
1:0507  c70614000100      mov      word ptr [0x14], 1
1:050D  e9fe00            jmp      0x60e
1:0510  b84803            mov      ax, 0x348
1:0513  50                push     ax
1:0514  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_16(1:066E)
1:0519  5b                pop      bx
1:051A  ff364803          push     word ptr [0x348]
1:051E  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_15(1:06D0)
1:0523  5b                pop      bx
1:0524  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_14(1:0012)
1:0529  eb13              jmp      0x53e
1:052B  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_13(1:0055)
1:0530  eb0c              jmp      0x53e
1:0532  833e140000        cmp      word ptr [0x14], 0
1:0537  740b              je       0x544
1:0539  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:00A2)
1:053E  8946fc            mov      word ptr [bp - 4], ax
1:0541  e9ca00            jmp      0x60e
1:0544  ff36fc04          push     word ptr [0x4fc]
1:0548  b800ff            mov      ax, 0xff00
1:054B  baff00            mov      dx, 0xff
1:054E  52                push     dx
1:054F  50                push     ax
1:0550  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextColor
1:0555  ff36fc04          push     word ptr [0x4fc]
1:0559  2bc0              sub      ax, ax
1:055B  50                push     ax
1:055C  50                push     ax
1:055D  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkColor
1:0562  ff36fc04          push     word ptr [0x4fc]
1:0566  2bc0              sub      ax, ax
1:0568  50                push     ax
1:0569  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextAlign
1:056E  ff36fc04          push     word ptr [0x4fc]
1:0572  b80100            mov      ax, 1
1:0575  50                push     ax
1:0576  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkMode
1:057B  ff36fc04          push     word ptr [0x4fc]
1:057F  2bc0              sub      ax, ax
1:0581  50                push     ax
1:0582  50                push     ax
1:0583  b81600            mov      ax, 0x16
1:0586  1e                push     ds
1:0587  50                push     ax
1:0588  50                push     ax
1:0589  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:0652)
1:058E  5b                pop      bx
1:058F  50                push     ax
1:0590  9affff0000        lcall    0, 0xffff  ; @1:GDI.TextOut
1:0595  eb77              jmp      0x60e
1:0597  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:00D2)
1:059C  eba0              jmp      0x53e
1:059E  a10205            mov      ax, word ptr [0x502]
1:05A1  c41e0605          les      bx, ptr [0x506]
1:05A5  26894716          mov      word ptr es:[bx + 0x16], ax
1:05A9  c746f60000        mov      word ptr [bp - 0xa], 0
1:05AE  8b46f6            mov      ax, word ptr [bp - 0xa]
1:05B1  8bf0              mov      si, ax
1:05B3  d1e6              shl      si, 1
1:05B5  40                inc      ax
1:05B6  c41e0605          les      bx, ptr [0x506]
1:05BA  2689400e          mov      word ptr es:[bx + si + 0xe], ax
1:05BE  ff46f6            inc      word ptr [bp - 0xa]
1:05C1  837ef604          cmp      word ptr [bp - 0xa], 4
1:05C5  7ce7              jl       0x5ae
1:05C7  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:00E6)
1:05CC  e96fff            jmp      0x53e
1:05CF  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:00FA)
1:05D4  e967ff            jmp      0x53e
1:05D7  8b460a            mov      ax, word ptr [bp + 0xa]
1:05DA  2d0700            sub      ax, 7
1:05DD  50                push     ax
1:05DE  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:010E)
1:05E3  5b                pop      bx
1:05E4  e957ff            jmp      0x53e
1:05E7  3d0c00            cmp      ax, 0xc
1:05EA  7722              ja       0x60e
1:05EC  d1e0              shl      ax, 1
1:05EE  93                xchg     bx, ax
1:05EF  2effa7f405        jmp      word ptr cs:[bx + 0x5f4]
1:05F4  1005              adc      byte ptr [di], al
1:05F6  2b05              sub      ax, word ptr [di]
1:05F8  3205              xor      al, byte ptr [di]
1:05FA  97                xchg     di, ax
1:05FB  050e06            add      ax, 0x60e
1:05FE  9e                sahf     
1:05FF  05cf05            add      ax, 0x5cf
1:0602  d7                xlatb    
1:0603  05d705            add      ax, 0x5d7
1:0606  d7                xlatb    
1:0607  05d705            add      ax, 0x5d7
1:060A  0e                push     cs
1:060B  06                push     es
1:060C  df04              fild     word ptr [si]
1:060E  c41efe04          les      bx, ptr [0x4fe]
1:0612  26ff7720          push     word ptr es:[bx + 0x20]
1:0616  9a20060000        lcall    0, 0x620  ; @1:KERNEL.GlobalUnlock
1:061B  ff368003          push     word ptr [0x380]
1:061F  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalUnlock
1:0624  8b46fc            mov      ax, word ptr [bp - 4]
1:0627  5e                pop      si
1:0628  4d                dec      bp
1:0629  4d                dec      bp
1:062A  8be5              mov      sp, bp
1:062C  1f                pop      ds
1:062D  5d                pop      bp
1:062E  4d                dec      bp
1:062F  ca0600            retf     6
1:0632  0000              add      byte ptr [bx + si], al
1:0634  0000              add      byte ptr [bx + si], al
1:0636  0000              add      byte ptr [bx + si], al
1:0638  0000              add      byte ptr [bx + si], al
1:063A  0000              add      byte ptr [bx + si], al
1:063C  0000              add      byte ptr [bx + si], al
1:063E  0000              add      byte ptr [bx + si], al
1:0640  0000              add      byte ptr [bx + si], al
1:0642  0000              add      byte ptr [bx + si], al
1:0644  0000              add      byte ptr [bx + si], al
1:0646  0000              add      byte ptr [bx + si], al
1:0648  0000              add      byte ptr [bx + si], al
1:064A  0000              add      byte ptr [bx + si], al
1:064C  0000              add      byte ptr [bx + si], al
1:064E  0000              add      byte ptr [bx + si], al
1:0650  c3                ret      
1:0651  00558b            add      byte ptr [di - 0x75], dl
1:0654  ec                in       al, dx
1:0655  8bd7              mov      dx, di
1:0657  8cd8              mov      ax, ds
1:0659  8ec0              mov      es, ax
1:065B  8b7e06            mov      di, word ptr [bp + 6]
1:065E  33c0              xor      ax, ax
1:0660  b9ffff            mov      cx, 0xffff
1:0663  f2ae              repne scasb al, byte ptr es:[di]
1:0665  f7d1              not      cx
1:0667  49                dec      cx
1:0668  91                xchg     cx, ax
1:0669  8bfa              mov      di, dx
1:066B  5d                pop      bp
1:066C  cb                retf     
1:066D  008cd890          add      byte ptr [si - 0x6f28], cl
1:0671  45                inc      bp
1:0672  55                push     bp
1:0673  8bec              mov      bp, sp
1:0675  1e                push     ds
1:0676  8ed8              mov      ds, ax
1:0678  56                push     si
1:0679  b42a              mov      ah, 0x2a
1:067B  cd21              int      0x21
1:067D  8bda              mov      bx, dx
1:067F  8bf1              mov      si, cx
1:0681  b42c              mov      ah, 0x2c
1:0683  cd21              int      0x21
1:0685  b400              mov      ah, 0
1:0687  8ac6              mov      al, dh
1:0689  50                push     ax
1:068A  8ac1              mov      al, cl
1:068C  50                push     ax
1:068D  8ac5              mov      al, ch
1:068F  50                push     ax
1:0690  50                push     ax
1:0691  b42a              mov      ah, 0x2a
1:0693  cd21              int      0x21
1:0695  3bda              cmp      bx, dx
1:0697  58                pop      ax
1:0698  7408              je       0x6a2
1:069A  3c17              cmp      al, 0x17
1:069C  7504              jne      0x6a2
1:069E  8bd3              mov      dx, bx
1:06A0  8bce              mov      cx, si
1:06A2  b400              mov      ah, 0
1:06A4  8ac2              mov      al, dl
1:06A6  50                push     ax
1:06A7  8ac6              mov      al, dh
1:06A9  50                push     ax
1:06AA  81e9bc07          sub      cx, 0x7bc
1:06AE  51                push     cx
1:06AF  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_18(1:07A6)
1:06B4  83c40c            add      sp, 0xc
1:06B7  837e0600          cmp      word ptr [bp + 6], 0
1:06BB  7408              je       0x6c5
1:06BD  8b5e06            mov      bx, word ptr [bp + 6]
1:06C0  895702            mov      word ptr [bx + 2], dx
1:06C3  8907              mov      word ptr [bx], ax
1:06C5  5e                pop      si
1:06C6  83ed02            sub      bp, 2
1:06C9  8be5              mov      sp, bp
1:06CB  1f                pop      ds
1:06CC  5d                pop      bp
1:06CD  4d                dec      bp
1:06CE  cb                retf     
1:06CF  004555            add      byte ptr [di + 0x55], al
1:06D2  8bec              mov      bp, sp
1:06D4  8b4606            mov      ax, word ptr [bp + 6]
1:06D7  a35200            mov      word ptr [0x52], ax
1:06DA  c70654000000      mov      word ptr [0x54], 0
1:06E0  5d                pop      bp
1:06E1  4d                dec      bp
1:06E2  cb                retf     
1:06E3  90                nop      

; ===== EXPORT:ord_6(#6) =====
1:06E4  45                inc      bp
1:06E5  55                push     bp
1:06E6  8bec              mov      bp, sp