File: raw\unpacked\MODULES\MONDRIAN.AD
Module: 'MONDRIAN' ('Graphics Module Library')
CS:IP=1:0C54  SS:SP=0:0000  AutoDS=2  Heap=1024  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (3): KERNEL, GDI, USER
Segments (2):
  SEG  1: CODE off=0x00600 len=0x0C86 min=0x0C86 flags=0x0D50 relocs=58
  SEG  2: DATA off=0x013E0 len=0x09D0 min=0x09D0 flags=0x0C71 relocs=0
Exports (28):
  ord   1: SEG1:02B2 flags=0x03 MODULE
  ord   2: SEG1:029B flags=0x03 WEP
  ord   3: SEG1:0C40 flags=0x03 ___EXPORTEDSTUB
  ord   4: SEG1:0504 flags=0x00 
  ord   5: SEG1:020A flags=0x00 
  ord   6: SEG1:01F6 flags=0x00 
  ord   7: SEG1:01E2 flags=0x00 
  ord   8: SEG1:01A4 flags=0x00 
  ord   9: SEG1:0472 flags=0x00 
  ord  10: SEG1:00C8 flags=0x00 
  ord  11: SEG1:007B flags=0x00 
  ord  12: SEG1:0012 flags=0x00 
  ord  13: SEG1:04F0 flags=0x00 
  ord  14: SEG1:048E flags=0x00 
  ord  15: SEG1:0274 flags=0x00 
  ord  16: SEG1:0534 flags=0x00 
  ord  17: SEG1:0638 flags=0x00 
  ord  18: SEG1:07AA flags=0x00 
  ord  19: SEG1:066A flags=0x00 
  ord  20: SEG1:08DC flags=0x00 
  ord  21: SEG1:0904 flags=0x00 
  ord  22: SEG1:09A6 flags=0x00 
  ord  23: SEG1:096A flags=0x00 
  ord  24: SEG1:09D0 flags=0x00 
  ord  25: SEG1:0908 flags=0x00 
  ord  26: SEG1:0684 flags=0x00 
  ord  27: SEG1:0B74 flags=0x00 
  ord  28: SEG1:0C30 flags=0x00 
Resources (7):
  TYPE_1000        #1               off=0x01DE0 len=   112
  TYPE_1000        #2               off=0x01E50 len=    32
  TYPE_1000        #3               off=0x01E70 len=    32
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
1:001C  c70612000000      mov      word ptr [0x12], 0
1:0022  c41ecc09          les      bx, ptr [0x9cc]
1:0026  268b4706          mov      ax, word ptr es:[bx + 6]
1:002A  eb20              jmp      0x4c
1:002C  c70614008c00      mov      word ptr [0x14], 0x8c
1:0032  eb2f              jmp      0x63
1:0034  c70614004600      mov      word ptr [0x14], 0x46
1:003A  eb27              jmp      0x63
1:003C  c70614001e00      mov      word ptr [0x14], 0x1e
1:0042  eb1f              jmp      0x63
1:0044  c70614000000      mov      word ptr [0x14], 0
1:004A  eb17              jmp      0x63
1:004C  3d6400            cmp      ax, 0x64
1:004F  74f3              je       0x44
1:0051  7710              ja       0x63
1:0053  0ac0              or       al, al
1:0055  74d5              je       0x2c
1:0057  2c19              sub      al, 0x19
1:0059  74d9              je       0x34
1:005B  2c19              sub      al, 0x19
1:005D  74dd              je       0x3c
1:005F  2c19              sub      al, 0x19
1:0061  74e1              je       0x44
1:0063  c41ecc09          les      bx, ptr [0x9cc]
1:0067  268b4708          mov      ax, word ptr es:[bx + 8]
1:006B  a31000            mov      word ptr [0x10], ax
1:006E  2bc0              sub      ax, ax
1:0070  a38803            mov      word ptr [0x388], ax
1:0073  4d                dec      bp
1:0074  4d                dec      bp
1:0075  8be5              mov      sp, bp
1:0077  1f                pop      ds
1:0078  5d                pop      bp
1:0079  4d                dec      bp
1:007A  cb                retf     

; ===== EXPORT:ord_11(#11) =====
1:007B  1e                push     ds
1:007C  58                pop      ax
1:007D  90                nop      
1:007E  45                inc      bp
1:007F  55                push     bp
1:0080  8bec              mov      bp, sp
1:0082  1e                push     ds
1:0083  8ed8              mov      ds, ax
1:0085  833e100000        cmp      word ptr [0x10], 0
1:008A  7432              je       0xbe
1:008C  b83003            mov      ax, 0x330
1:008F  1e                push     ds
1:0090  50                push     ax
1:0091  2bc0              sub      ax, ax
1:0093  50                push     ax
1:0094  50                push     ax
1:0095  c41ecc09          les      bx, ptr [0x9cc]
1:0099  26ff7702          push     word ptr es:[bx + 2]
1:009D  26ff7704          push     word ptr es:[bx + 4]
1:00A1  9a6e010000        lcall    0, 0x16e  ; @1:USER.SetRect
1:00A6  ff368203          push     word ptr [0x382]
1:00AA  b83003            mov      ax, 0x330
1:00AD  1e                push     ds
1:00AE  50                push     ax
1:00AF  b80400            mov      ax, 4
1:00B2  50                push     ax
1:00B3  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:00B8  50                push     ax
1:00B9  9affff0000        lcall    0, 0xffff  ; @1:USER.FillRect
1:00BE  2bc0              sub      ax, ax
1:00C0  4d                dec      bp
1:00C1  4d                dec      bp
1:00C2  8be5              mov      sp, bp
1:00C4  1f                pop      ds
1:00C5  5d                pop      bp
1:00C6  4d                dec      bp
1:00C7  cb                retf     

; ===== EXPORT:ord_10(#10) =====
1:00C8  1e                push     ds
1:00C9  58                pop      ax
1:00CA  90                nop      
1:00CB  45                inc      bp
1:00CC  55                push     bp
1:00CD  8bec              mov      bp, sp
1:00CF  1e                push     ds
1:00D0  8ed8              mov      ds, ax
1:00D2  83ec06            sub      sp, 6
1:00D5  a11400            mov      ax, word ptr [0x14]
1:00D8  ff061200          inc      word ptr [0x12]
1:00DC  39061200          cmp      word ptr [0x12], ax
1:00E0  7d03              jge      0xe5
1:00E2  e9b500            jmp      0x19a
1:00E5  c70612000000      mov      word ptr [0x12], 0
1:00EB  9a0d010000        lcall    0, 0x10d  ; @1:INT:ord_4(1:0504)
1:00F0  b90200            mov      cx, 2
1:00F3  99                cdq      
1:00F4  f7f9              idiv     cx
1:00F6  813e8803c800      cmp      word ptr [0x388], 0xc8
1:00FC  7c03              jl       0x101
1:00FE  e98000            jmp      0x181
1:0101  833e880332        cmp      word ptr [0x388], 0x32
1:0106  7c04              jl       0x10c
1:0108  0bd2              or       dx, dx
1:010A  7475              je       0x181
1:010C  9a1f010000        lcall    0, 0x11f  ; @1:INT:ord_4(1:0504)
1:0111  c41ecc09          les      bx, ptr [0x9cc]
1:0115  99                cdq      
1:0116  26f77f02          idiv     word ptr es:[bx + 2]
1:011A  89163803          mov      word ptr [0x338], dx
1:011E  9a31010000        lcall    0, 0x131  ; @1:INT:ord_4(1:0504)
1:0123  c41ecc09          les      bx, ptr [0x9cc]
1:0127  99                cdq      
1:0128  26f77f02          idiv     word ptr es:[bx + 2]
1:012C  89163c03          mov      word ptr [0x33c], dx
1:0130  9a43010000        lcall    0, 0x143  ; @1:INT:ord_4(1:0504)
1:0135  c41ecc09          les      bx, ptr [0x9cc]
1:0139  99                cdq      
1:013A  26f77f04          idiv     word ptr es:[bx + 4]
1:013E  89163a03          mov      word ptr [0x33a], dx
1:0142  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_4(1:0504)
1:0147  c41ecc09          les      bx, ptr [0x9cc]
1:014B  99                cdq      
1:014C  26f77f04          idiv     word ptr es:[bx + 4]
1:0150  89163e03          mov      word ptr [0x33e], dx
1:0154  b103              mov      cl, 3
1:0156  a18803            mov      ax, word ptr [0x388]
1:0159  d3e0              shl      ax, cl
1:015B  058c03            add      ax, 0x38c
1:015E  1e                push     ds
1:015F  50                push     ax
1:0160  ff363803          push     word ptr [0x338]
1:0164  ff363a03          push     word ptr [0x33a]
1:0168  ff363c03          push     word ptr [0x33c]
1:016C  52                push     dx
1:016D  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:0172  ff368203          push     word ptr [0x382]
1:0176  b103              mov      cl, 3
1:0178  a18803            mov      ax, word ptr [0x388]
1:017B  ff068803          inc      word ptr [0x388]
1:017F  eb0d              jmp      0x18e
1:0181  ff368203          push     word ptr [0x382]
1:0185  b103              mov      cl, 3
1:0187  ff0e8803          dec      word ptr [0x388]
1:018B  a18803            mov      ax, word ptr [0x388]
1:018E  d3e0              shl      ax, cl
1:0190  058c03            add      ax, 0x38c
1:0193  1e                push     ds
1:0194  50                push     ax
1:0195  9acb010000        lcall    0, 0x1cb  ; @1:USER.InvertRect
1:019A  2bc0              sub      ax, ax
1:019C  4d                dec      bp
1:019D  4d                dec      bp
1:019E  8be5              mov      sp, bp
1:01A0  1f                pop      ds
1:01A1  5d                pop      bp
1:01A2  4d                dec      bp
1:01A3  cb                retf     

; ===== EXPORT:ord_8(#8) =====
1:01A4  1e                push     ds
1:01A5  58                pop      ax
1:01A6  90                nop      
1:01A7  45                inc      bp
1:01A8  55                push     bp
1:01A9  8bec              mov      bp, sp
1:01AB  1e                push     ds
1:01AC  8ed8              mov      ds, ax
1:01AE  83ec04            sub      sp, 4
1:01B1  a18803            mov      ax, word ptr [0x388]
1:01B4  48                dec      ax
1:01B5  8946fc            mov      word ptr [bp - 4], ax
1:01B8  eb18              jmp      0x1d2
1:01BA  ff368203          push     word ptr [0x382]
1:01BE  b103              mov      cl, 3
1:01C0  8b46fc            mov      ax, word ptr [bp - 4]
1:01C3  d3e0              shl      ax, cl
1:01C5  058c03            add      ax, 0x38c
1:01C8  1e                push     ds
1:01C9  50                push     ax
1:01CA  9affff0000        lcall    0, 0xffff  ; @1:USER.InvertRect
1:01CF  ff4efc            dec      word ptr [bp - 4]
1:01D2  837efc00          cmp      word ptr [bp - 4], 0
1:01D6  7de2              jge      0x1ba
1:01D8  2bc0              sub      ax, ax
1:01DA  4d                dec      bp
1:01DB  4d                dec      bp
1:01DC  8be5              mov      sp, bp
1:01DE  1f                pop      ds
1:01DF  5d                pop      bp
1:01E0  4d                dec      bp
1:01E1  cb                retf     

; ===== EXPORT:ord_7(#7) =====
1:01E2  1e                push     ds
1:01E3  58                pop      ax
1:01E4  90                nop      
1:01E5  45                inc      bp
1:01E6  55                push     bp
1:01E7  8bec              mov      bp, sp
1:01E9  1e                push     ds
1:01EA  8ed8              mov      ds, ax
1:01EC  2bc0              sub      ax, ax
1:01EE  4d                dec      bp
1:01EF  4d                dec      bp
1:01F0  8be5              mov      sp, bp
1:01F2  1f                pop      ds
1:01F3  5d                pop      bp
1:01F4  4d                dec      bp
1:01F5  cb                retf     

; ===== EXPORT:ord_6(#6) =====
1:01F6  1e                push     ds
1:01F7  58                pop      ax
1:01F8  90                nop      
1:01F9  45                inc      bp
1:01FA  55                push     bp
1:01FB  8bec              mov      bp, sp
1:01FD  1e                push     ds
1:01FE  8ed8              mov      ds, ax
1:0200  2bc0              sub      ax, ax
1:0202  4d                dec      bp
1:0203  4d                dec      bp
1:0204  8be5              mov      sp, bp
1:0206  1f                pop      ds
1:0207  5d                pop      bp
1:0208  4d                dec      bp
1:0209  cb                retf     

; ===== EXPORT:ord_5(#5) =====
1:020A  1e                push     ds
1:020B  58                pop      ax
1:020C  90                nop      
1:020D  45                inc      bp
1:020E  55                push     bp
1:020F  8bec              mov      bp, sp
1:0211  1e                push     ds
1:0212  8ed8              mov      ds, ax
1:0214  c41e8403          les      bx, ptr [0x384]
1:0218  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:021D  7404              je       0x223
1:021F  2bc0              sub      ax, ax
1:0221  eb48              jmp      0x26b
1:0223  8b4606            mov      ax, word ptr [bp + 6]
1:0226  0bc0              or       ax, ax
1:0228  75f5              jne      0x21f
1:022A  c41ecc09          les      bx, ptr [0x9cc]
1:022E  268b4706          mov      ax, word ptr es:[bx + 6]
1:0232  3d6400            cmp      ax, 0x64
1:0235  742c              je       0x263
1:0237  77e6              ja       0x21f
1:0239  0ac0              or       al, al
1:023B  740e              je       0x24b
1:023D  2c19              sub      al, 0x19
1:023F  7412              je       0x253
1:0241  2c19              sub      al, 0x19
1:0243  7416              je       0x25b
1:0245  2c19              sub      al, 0x19
1:0247  741a              je       0x263
1:0249  ebd4              jmp      0x21f
1:024B  c70614008c00      mov      word ptr [0x14], 0x8c
1:0251  ebcc              jmp      0x21f
1:0253  c70614004600      mov      word ptr [0x14], 0x46
1:0259  ebc4              jmp      0x21f
1:025B  c70614001e00      mov      word ptr [0x14], 0x1e
1:0261  ebbc              jmp      0x21f
1:0263  c70614000000      mov      word ptr [0x14], 0
1:0269  ebb4              jmp      0x21f
1:026B  4d                dec      bp
1:026C  4d                dec      bp
1:026D  8be5              mov      sp, bp
1:026F  1f                pop      ds
1:0270  5d                pop      bp
1:0271  4d                dec      bp
1:0272  cb                retf     
1:0273  001e5890          add      byte ptr [0x9058], bl
1:0277  45                inc      bp
1:0278  55                push     bp
1:0279  8bec              mov      bp, sp
1:027B  1e                push     ds
1:027C  8ed8              mov      ds, ax
1:027E  837e0a00          cmp      word ptr [bp + 0xa], 0
1:0282  7504              jne      0x288
1:0284  2bc0              sub      ax, ax
1:0286  eb09              jmp      0x291
1:0288  8b460e            mov      ax, word ptr [bp + 0xe]
1:028B  a38a03            mov      word ptr [0x38a], ax
1:028E  b80100            mov      ax, 1
1:0291  4d                dec      bp
1:0292  4d                dec      bp
1:0293  8be5              mov      sp, bp
1:0295  1f                pop      ds
1:0296  5d                pop      bp
1:0297  4d                dec      bp
1:0298  ca0a00            retf     0xa

; ===== EXPORT:WEP(#2) =====
1:029B  1e                push     ds
1:029C  58                pop      ax
1:029D  90                nop      
1:029E  45                inc      bp
1:029F  55                push     bp
1:02A0  8bec              mov      bp, sp
1:02A2  1e                push     ds
1:02A3  8ed8              mov      ds, ax
1:02A5  b80100            mov      ax, 1
1:02A8  4d                dec      bp
1:02A9  4d                dec      bp
1:02AA  8be5              mov      sp, bp
1:02AC  1f                pop      ds
1:02AD  5d                pop      bp
1:02AE  4d                dec      bp
1:02AF  ca0200            retf     2

; ===== EXPORT:MODULE(#1) =====
1:02B2  1e                push     ds
1:02B3  58                pop      ax
1:02B4  90                nop      
1:02B5  45                inc      bp
1:02B6  55                push     bp
1:02B7  8bec              mov      bp, sp
1:02B9  1e                push     ds
1:02BA  8ed8              mov      ds, ax
1:02BC  83ec0a            sub      sp, 0xa
1:02BF  56                push     si
1:02C0  8b4608            mov      ax, word ptr [bp + 8]
1:02C3  a38203            mov      word ptr [0x382], ax
1:02C6  8b4606            mov      ax, word ptr [bp + 6]
1:02C9  a38003            mov      word ptr [0x380], ax
1:02CC  50                push     ax
1:02CD  9aed020000        lcall    0, 0x2ed  ; @1:KERNEL.GlobalLock
1:02D2  a38403            mov      word ptr [0x384], ax
1:02D5  89168603          mov      word ptr [0x386], dx
1:02D9  8bc2              mov      ax, dx
1:02DB  0b068403          or       ax, word ptr [0x384]
1:02DF  7503              jne      0x2e4
1:02E1  e96a01            jmp      0x44e
1:02E4  c41e8403          les      bx, ptr [0x384]
1:02E8  26ff7720          push     word ptr es:[bx + 0x20]
1:02EC  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalLock
1:02F1  a3cc09            mov      word ptr [0x9cc], ax
1:02F4  8916ce09          mov      word ptr [0x9ce], dx
1:02F8  8bc2              mov      ax, dx
1:02FA  0b06cc09          or       ax, word ptr [0x9cc]
1:02FE  7503              jne      0x303
1:0300  e94201            jmp      0x445
1:0303  8b460a            mov      ax, word ptr [bp + 0xa]
1:0306  e90801            jmp      0x411
1:0309  c41e8403          les      bx, ptr [0x384]
1:030D  26837f1465        cmp      word ptr es:[bx + 0x14], 0x65
1:0312  7c0f              jl       0x323
1:0314  26817f36f400      cmp      word ptr es:[bx + 0x36], 0xf4
1:031A  7507              jne      0x323
1:031C  26837f3878        cmp      word ptr es:[bx + 0x38], 0x78
1:0321  740e              je       0x331
1:0323  c70616000000      mov      word ptr [0x16], 0
1:0329  c746fc0500        mov      word ptr [bp - 4], 5
1:032E  e90701            jmp      0x438
1:0331  c70616000100      mov      word ptr [0x16], 1
1:0337  e9fe00            jmp      0x438
1:033A  b84003            mov      ax, 0x340
1:033D  50                push     ax
1:033E  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_14(1:048E)
1:0343  5b                pop      bx
1:0344  ff364003          push     word ptr [0x340]
1:0348  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_13(1:04F0)
1:034D  5b                pop      bx
1:034E  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:0012)
1:0353  eb13              jmp      0x368
1:0355  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:007B)
1:035A  eb0c              jmp      0x368
1:035C  833e160000        cmp      word ptr [0x16], 0
1:0361  740b              je       0x36e
1:0363  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:00C8)
1:0368  8946fc            mov      word ptr [bp - 4], ax
1:036B  e9ca00            jmp      0x438
1:036E  ff368203          push     word ptr [0x382]
1:0372  b800ff            mov      ax, 0xff00
1:0375  baff00            mov      dx, 0xff
1:0378  52                push     dx
1:0379  50                push     ax
1:037A  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextColor
1:037F  ff368203          push     word ptr [0x382]
1:0383  2bc0              sub      ax, ax
1:0385  50                push     ax
1:0386  50                push     ax
1:0387  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkColor
1:038C  ff368203          push     word ptr [0x382]
1:0390  2bc0              sub      ax, ax
1:0392  50                push     ax
1:0393  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextAlign
1:0398  ff368203          push     word ptr [0x382]
1:039C  b80100            mov      ax, 1
1:039F  50                push     ax
1:03A0  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkMode
1:03A5  ff368203          push     word ptr [0x382]
1:03A9  2bc0              sub      ax, ax
1:03AB  50                push     ax
1:03AC  50                push     ax
1:03AD  b81800            mov      ax, 0x18
1:03B0  1e                push     ds
1:03B1  50                push     ax
1:03B2  50                push     ax
1:03B3  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:0472)
1:03B8  5b                pop      bx
1:03B9  50                push     ax
1:03BA  9affff0000        lcall    0, 0xffff  ; @1:GDI.TextOut
1:03BF  eb77              jmp      0x438
1:03C1  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:01A4)
1:03C6  eba0              jmp      0x368
1:03C8  a18a03            mov      ax, word ptr [0x38a]
1:03CB  c41ecc09          les      bx, ptr [0x9cc]
1:03CF  26894716          mov      word ptr es:[bx + 0x16], ax
1:03D3  c746f60000        mov      word ptr [bp - 0xa], 0
1:03D8  8b46f6            mov      ax, word ptr [bp - 0xa]
1:03DB  8bf0              mov      si, ax
1:03DD  d1e6              shl      si, 1
1:03DF  40                inc      ax
1:03E0  c41ecc09          les      bx, ptr [0x9cc]
1:03E4  2689400e          mov      word ptr es:[bx + si + 0xe], ax
1:03E8  ff46f6            inc      word ptr [bp - 0xa]
1:03EB  837ef604          cmp      word ptr [bp - 0xa], 4
1:03EF  7ce7              jl       0x3d8
1:03F1  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:01E2)
1:03F6  e96fff            jmp      0x368
1:03F9  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_6(1:01F6)
1:03FE  e967ff            jmp      0x368
1:0401  8b460a            mov      ax, word ptr [bp + 0xa]
1:0404  2d0700            sub      ax, 7
1:0407  50                push     ax
1:0408  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_5(1:020A)
1:040D  5b                pop      bx
1:040E  e957ff            jmp      0x368
1:0411  3d0c00            cmp      ax, 0xc
1:0414  7722              ja       0x438
1:0416  d1e0              shl      ax, 1
1:0418  93                xchg     bx, ax
1:0419  2effa71e04        jmp      word ptr cs:[bx + 0x41e]
1:041E  3a03              cmp      al, byte ptr [bp + di]
1:0420  55                push     bp
1:0421  035c03            add      bx, word ptr [si + 3]
1:0424  c10338            rol      word ptr [bp + di], 0x38
1:0427  04c8              add      al, 0xc8
1:0429  03f9              add      di, cx
1:042B  0301              add      ax, word ptr [bx + di]
1:042D  0401              add      al, 1
1:042F  0401              add      al, 1
1:0431  0401              add      al, 1
1:0433  0438              add      al, 0x38
1:0435  0409              add      al, 9
1:0437  03c4              add      ax, sp
1:0439  1e                push     ds
1:043A  8403              test     byte ptr [bp + di], al
1:043C  26ff7720          push     word ptr es:[bx + 0x20]
1:0440  9a4a040000        lcall    0, 0x44a  ; @1:KERNEL.GlobalUnlock
1:0445  ff368003          push     word ptr [0x380]
1:0449  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalUnlock
1:044E  8b46fc            mov      ax, word ptr [bp - 4]
1:0451  5e                pop      si
1:0452  4d                dec      bp
1:0453  4d                dec      bp
1:0454  8be5              mov      sp, bp
1:0456  1f                pop      ds
1:0457  5d                pop      bp
1:0458  4d                dec      bp
1:0459  ca0600            retf     6
1:045C  0000              add      byte ptr [bx + si], al
1:045E  0000              add      byte ptr [bx + si], al
1:0460  0000              add      byte ptr [bx + si], al
1:0462  0000              add      byte ptr [bx + si], al
1:0464  0000              add      byte ptr [bx + si], al
1:0466  0000              add      byte ptr [bx + si], al
1:0468  0000              add      byte ptr [bx + si], al
1:046A  0000              add      byte ptr [bx + si], al
1:046C  0000              add      byte ptr [bx + si], al
1:046E  0000              add      byte ptr [bx + si], al
1:0470  c3                ret      
1:0471  00558b            add      byte ptr [di - 0x75], dl
1:0474  ec                in       al, dx
1:0475  8bd7              mov      dx, di
1:0477  8cd8              mov      ax, ds
1:0479  8ec0              mov      es, ax
1:047B  8b7e06            mov      di, word ptr [bp + 6]
1:047E  33c0              xor      ax, ax
1:0480  b9ffff            mov      cx, 0xffff
1:0483  f2ae              repne scasb al, byte ptr es:[di]
1:0485  f7d1              not      cx
1:0487  49                dec      cx
1:0488  91                xchg     cx, ax
1:0489  8bfa              mov      di, dx
1:048B  5d                pop      bp
1:048C  cb                retf     
1:048D  008cd890          add      byte ptr [si - 0x6f28], cl
1:0491  45                inc      bp
1:0492  55                push     bp
1:0493  8bec              mov      bp, sp
1:0495  1e                push     ds
1:0496  8ed8              mov      ds, ax
1:0498  56                push     si
1:0499  b42a              mov      ah, 0x2a
1:049B  cd21              int      0x21
1:049D  8bda              mov      bx, dx
1:049F  8bf1              mov      si, cx
1:04A1  b42c              mov      ah, 0x2c
1:04A3  cd21              int      0x21
1:04A5  b400              mov      ah, 0
1:04A7  8ac6              mov      al, dh
1:04A9  50                push     ax
1:04AA  8ac1              mov      al, cl
1:04AC  50                push     ax
1:04AD  8ac5              mov      al, ch
1:04AF  50                push     ax
1:04B0  50                push     ax
1:04B1  b42a              mov      ah, 0x2a
1:04B3  cd21              int      0x21
1:04B5  3bda              cmp      bx, dx
1:04B7  58                pop      ax
1:04B8  7408              je       0x4c2
1:04BA  3c17              cmp      al, 0x17
1:04BC  7504              jne      0x4c2
1:04BE  8bd3              mov      dx, bx
1:04C0  8bce              mov      cx, si
1:04C2  b400              mov      ah, 0
1:04C4  8ac2              mov      al, dl
1:04C6  50                push     ax
1:04C7  8ac6              mov      al, dh
1:04C9  50                push     ax
1:04CA  81e9bc07          sub      cx, 0x7bc
1:04CE  51                push     cx
1:04CF  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_16(1:0534)
1:04D4  83c40c            add      sp, 0xc
1:04D7  837e0600          cmp      word ptr [bp + 6], 0
1:04DB  7408              je       0x4e5
1:04DD  8b5e06            mov      bx, word ptr [bp + 6]
1:04E0  895702            mov      word ptr [bx + 2], dx
1:04E3  8907              mov      word ptr [bx], ax
1:04E5  5e                pop      si
1:04E6  83ed02            sub      bp, 2
1:04E9  8be5              mov      sp, bp
1:04EB  1f                pop      ds
1:04EC  5d                pop      bp
1:04ED  4d                dec      bp
1:04EE  cb                retf     
1:04EF  004555            add      byte ptr [di + 0x55], al
1:04F2  8bec              mov      bp, sp
1:04F4  8b4606            mov      ax, word ptr [bp + 6]
1:04F7  a35200            mov      word ptr [0x52], ax
1:04FA  c70654000000      mov      word ptr [0x54], 0
1:0500  5d                pop      bp
1:0501  4d                dec      bp
1:0502  cb                retf     
1:0503  90                nop      

; ===== EXPORT:ord_4(#4) =====
1:0504  45                inc      bp
1:0505  55                push     bp
1:0506  8bec              mov      bp, sp
1:0508  b8fd43            mov      ax, 0x43fd
1:050B  ba0300            mov      dx, 3
1:050E  52                push     dx
1:050F  50                push     ax