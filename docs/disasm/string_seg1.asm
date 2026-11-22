File: raw\unpacked\MODULES\STRING.AD
Module: 'STRING' ('Graphics Module Library')
CS:IP=1:14A8  SS:SP=0:0000  AutoDS=2  Heap=1024  Stack=0  Flags=0x01/0x83  WinVer=3.0
Imports (3): KERNEL, GDI, USER
Segments (2):
  SEG  1: CODE off=0x00600 len=0x14DA min=0x14DA flags=0x0D50 relocs=90
  SEG  2: DATA off=0x01C80 len=0x0462 min=0x0462 flags=0x0C71 relocs=0
Exports (29):
  ord   1: SEG1:0AA2 flags=0x03 MODULE
  ord   2: SEG1:0A84 flags=0x03 WEP
  ord   3: SEG1:1168 flags=0x03 ___EXPORTEDSTUB
  ord   4: SEG1:0D58 flags=0x00 
  ord   5: SEG1:0C92 flags=0x00 
  ord   6: SEG1:071B flags=0x00 
  ord   7: SEG1:0700 flags=0x00 
  ord   8: SEG1:06E5 flags=0x00 
  ord   9: SEG1:0677 flags=0x00 
  ord  10: SEG1:0CC6 flags=0x00 
  ord  11: SEG1:0488 flags=0x00 
  ord  12: SEG1:0433 flags=0x00 
  ord  13: SEG1:0019 flags=0x00 
  ord  14: SEG1:0D44 flags=0x00 
  ord  15: SEG1:0CE2 flags=0x00 
  ord  16: SEG1:0A56 flags=0x00 
  ord  17: SEG1:0DB0 flags=0x00 
  ord  18: SEG1:0EB4 flags=0x00 
  ord  19: SEG1:1158 flags=0x00 
  ord  20: SEG1:1026 flags=0x00 
  ord  21: SEG1:0EE6 flags=0x00 
  ord  22: SEG1:117C flags=0x00 
  ord  23: SEG1:11A4 flags=0x00 
  ord  24: SEG1:1246 flags=0x00 
  ord  25: SEG1:120A flags=0x00 
  ord  26: SEG1:1270 flags=0x00 
  ord  27: SEG1:11A8 flags=0x00 
  ord  28: SEG1:0F00 flags=0x00 
  ord  29: SEG1:1414 flags=0x00 
Resources (7):
  TYPE_1000        #1               off=0x02120 len=   240
  TYPE_1000        #2               off=0x02210 len=   352
  TYPE_1000        #3               off=0x02370 len=   144
  TYPE_1000        #4               off=0x02400 len=    96
  TYPE_2000        #10              off=0x02460 len=    96
  TYPE_2000        #20              off=0x024C0 len=    16
  TYPE_2000        #30              off=0x024D0 len=   624

1:0000  1e                push     ds
1:0001  58                pop      ax
1:0002  90                nop      
1:0003  45                inc      bp
1:0004  55                push     bp
1:0005  8bec              mov      bp, sp
1:0007  1e                push     ds
1:0008  8ed8              mov      ds, ax
1:000A  33c0              xor      ax, ax
1:000C  9a27000000        lcall    0, 0x27  ; @1:INT:ord_5(1:0C92)
1:0011  4d                dec      bp
1:0012  4d                dec      bp
1:0013  8be5              mov      sp, bp
1:0015  1f                pop      ds
1:0016  5d                pop      bp
1:0017  4d                dec      bp
1:0018  cb                retf     

; ===== EXPORT:ord_13(#13) =====
1:0019  1e                push     ds
1:001A  58                pop      ax
1:001B  90                nop      
1:001C  45                inc      bp
1:001D  55                push     bp
1:001E  8bec              mov      bp, sp
1:0020  1e                push     ds
1:0021  8ed8              mov      ds, ax
1:0023  b80600            mov      ax, 6
1:0026  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_5(1:0C92)
1:002B  57                push     di
1:002C  56                push     si
1:002D  c41e5c04          les      bx, ptr [0x45c]
1:0031  268b4706          mov      ax, word ptr es:[bx + 6]
1:0035  40                inc      ax
1:0036  a31000            mov      word ptr [0x10], ax
1:0039  b86400            mov      ax, 0x64
1:003C  262b470a          sub      ax, word ptr es:[bx + 0xa]
1:0040  b90500            mov      cx, 5
1:0043  f7e9              imul     cx
1:0045  a35a04            mov      word ptr [0x45a], ax
1:0048  a3e003            mov      word ptr [0x3e0], ax
1:004B  268b4708          mov      ax, word ptr es:[bx + 8]
1:004F  3d6400            cmp      ax, 0x64
1:0052  7503              jne      0x57
1:0054  e9e201            jmp      0x239
1:0057  7775              ja       0xce
1:0059  0ac0              or       al, al
1:005B  746b              je       0xc8
1:005D  2c0c              sub      al, 0xc
1:005F  7503              jne      0x64
1:0061  e95701            jmp      0x1bb
1:0064  2c06              sub      al, 6
1:0066  7503              jne      0x6b
1:0068  e95901            jmp      0x1c4
1:006B  2c06              sub      al, 6
1:006D  7503              jne      0x72
1:006F  e95b01            jmp      0x1cd
1:0072  2c06              sub      al, 6
1:0074  7503              jne      0x79
1:0076  e95d01            jmp      0x1d6
1:0079  2c06              sub      al, 6
1:007B  7503              jne      0x80
1:007D  e95f01            jmp      0x1df
1:0080  2c06              sub      al, 6
1:0082  7503              jne      0x87
1:0084  e96101            jmp      0x1e8
1:0087  2c06              sub      al, 6
1:0089  7503              jne      0x8e
1:008B  e96301            jmp      0x1f1
1:008E  2c06              sub      al, 6
1:0090  7503              jne      0x95
1:0092  e96501            jmp      0x1fa
1:0095  2c06              sub      al, 6
1:0097  7503              jne      0x9c
1:0099  e96701            jmp      0x203
1:009C  2c06              sub      al, 6
1:009E  7503              jne      0xa3
1:00A0  e96901            jmp      0x20c
1:00A3  2c06              sub      al, 6
1:00A5  7503              jne      0xaa
1:00A7  e96b01            jmp      0x215
1:00AA  2c06              sub      al, 6
1:00AC  7503              jne      0xb1
1:00AE  e96d01            jmp      0x21e
1:00B1  2c06              sub      al, 6
1:00B3  7503              jne      0xb8
1:00B5  e96f01            jmp      0x227
1:00B8  2c06              sub      al, 6
1:00BA  7503              jne      0xbf
1:00BC  e97101            jmp      0x230
1:00BF  2c05              sub      al, 5
1:00C1  7503              jne      0xc6
1:00C3  e97301            jmp      0x239
1:00C6  eb06              jmp      0xce
1:00C8  c706ec030a00      mov      word ptr [0x3ec], 0xa
1:00CE  c41ee203          les      bx, ptr [0x3e2]
1:00D2  26837f0a04        cmp      word ptr es:[bx + 0xa], 4
1:00D7  7d03              jge      0xdc
1:00D9  e96601            jmp      0x242
1:00DC  c706e8031600      mov      word ptr [0x3e8], 0x16
1:00E2  2bc0              sub      ax, ax
1:00E4  a38803            mov      word ptr [0x388], ax
1:00E7  a38603            mov      word ptr [0x386], ax
1:00EA  a38a03            mov      word ptr [0x38a], ax
1:00ED  c7068c03ff00      mov      word ptr [0x38c], 0xff
1:00F3  c7069603ff00      mov      word ptr [0x396], 0xff
1:00F9  c7069803ff00      mov      word ptr [0x398], 0xff
1:00FF  b88000            mov      ax, 0x80
1:0102  8bd0              mov      dx, ax
1:0104  a39203            mov      word ptr [0x392], ax
1:0107  89169403          mov      word ptr [0x394], dx
1:010B  a39a03            mov      word ptr [0x39a], ax
1:010E  89169c03          mov      word ptr [0x39c], dx
1:0112  c706a203ff00      mov      word ptr [0x3a2], 0xff
1:0118  c706a4030000      mov      word ptr [0x3a4], 0
1:011E  99                cdq      
1:011F  a39e03            mov      word ptr [0x39e], ax
1:0122  8916a003          mov      word ptr [0x3a0], dx
1:0126  a3a603            mov      word ptr [0x3a6], ax
1:0129  8916a803          mov      word ptr [0x3a8], dx
1:012D  c706ae03ffff      mov      word ptr [0x3ae], 0xffff
1:0133  c706b0030000      mov      word ptr [0x3b0], 0
1:0139  b88080            mov      ax, 0x8080
1:013C  2bd2              sub      dx, dx
1:013E  a3aa03            mov      word ptr [0x3aa], ax
1:0141  8916ac03          mov      word ptr [0x3ac], dx
1:0145  a3b203            mov      word ptr [0x3b2], ax
1:0148  8916b403          mov      word ptr [0x3b4], dx
1:014C  c706b6035555      mov      word ptr [0x3b6], 0x5555
1:0152  c706b8035500      mov      word ptr [0x3b8], 0x55
1:0158  c706ba03ffff      mov      word ptr [0x3ba], 0xffff
1:015E  c706bc03ff00      mov      word ptr [0x3bc], 0xff
1:0164  c706be03aaaa      mov      word ptr [0x3be], 0xaaaa
1:016A  c706c003aa00      mov      word ptr [0x3c0], 0xaa
1:0170  c706c60300ff      mov      word ptr [0x3c6], 0xff00
1:0176  8916c803          mov      word ptr [0x3c8], dx
1:017A  b80080            mov      ax, 0x8000
1:017D  a3c203            mov      word ptr [0x3c2], ax
1:0180  8916c403          mov      word ptr [0x3c4], dx
1:0184  a3ca03            mov      word ptr [0x3ca], ax
1:0187  8916cc03          mov      word ptr [0x3cc], dx
1:018B  c706d20300ff      mov      word ptr [0x3d2], 0xff00
1:0191  c706d403ff00      mov      word ptr [0x3d4], 0xff
1:0197  ba8000            mov      dx, 0x80
1:019A  a3ce03            mov      word ptr [0x3ce], ax
1:019D  8916d003          mov      word ptr [0x3d0], dx
1:01A1  a3d603            mov      word ptr [0x3d6], ax
1:01A4  8916d803          mov      word ptr [0x3d8], dx
1:01A8  2bc0              sub      ax, ax
1:01AA  a38e03            mov      word ptr [0x38e], ax
1:01AD  89169003          mov      word ptr [0x390], dx
1:01B1  a3da03            mov      word ptr [0x3da], ax
1:01B4  8916dc03          mov      word ptr [0x3dc], dx
1:01B8  e9a100            jmp      0x25c
1:01BB  c706ec031400      mov      word ptr [0x3ec], 0x14
1:01C1  e90aff            jmp      0xce
1:01C4  c706ec031e00      mov      word ptr [0x3ec], 0x1e
1:01CA  e901ff            jmp      0xce
1:01CD  c706ec032800      mov      word ptr [0x3ec], 0x28
1:01D3  e9f8fe            jmp      0xce
1:01D6  c706ec033200      mov      word ptr [0x3ec], 0x32
1:01DC  e9effe            jmp      0xce
1:01DF  c706ec033c00      mov      word ptr [0x3ec], 0x3c
1:01E5  e9e6fe            jmp      0xce
1:01E8  c706ec034600      mov      word ptr [0x3ec], 0x46
1:01EE  e9ddfe            jmp      0xce
1:01F1  c706ec035000      mov      word ptr [0x3ec], 0x50
1:01F7  e9d4fe            jmp      0xce
1:01FA  c706ec035a00      mov      word ptr [0x3ec], 0x5a
1:0200  e9cbfe            jmp      0xce
1:0203  c706ec036400      mov      word ptr [0x3ec], 0x64
1:0209  e9c2fe            jmp      0xce
1:020C  c706ec036e00      mov      word ptr [0x3ec], 0x6e
1:0212  e9b9fe            jmp      0xce
1:0215  c706ec037800      mov      word ptr [0x3ec], 0x78
1:021B  e9b0fe            jmp      0xce
1:021E  c706ec038200      mov      word ptr [0x3ec], 0x82
1:0224  e9a7fe            jmp      0xce
1:0227  c706ec038c00      mov      word ptr [0x3ec], 0x8c
1:022D  e99efe            jmp      0xce
1:0230  c706ec039600      mov      word ptr [0x3ec], 0x96
1:0236  e995fe            jmp      0xce
1:0239  c706ec039700      mov      word ptr [0x3ec], 0x97
1:023F  e98cfe            jmp      0xce
1:0242  2bc0              sub      ax, ax
1:0244  a38803            mov      word ptr [0x388], ax
1:0247  a38603            mov      word ptr [0x386], ax
1:024A  c7068a03ffff      mov      word ptr [0x38a], 0xffff
1:0250  c7068c03ff00      mov      word ptr [0x38c], 0xff
1:0256  c706e8030200      mov      word ptr [0x3e8], 2
1:025C  26837f0a08        cmp      word ptr es:[bx + 0xa], 8
1:0261  7506              jne      0x269
1:0263  c706e803eb00      mov      word ptr [0x3e8], 0xeb
1:0269  c70658040300      mov      word ptr [0x458], 3
1:026F  a35604            mov      word ptr [0x456], ax
1:0272  a38203            mov      word ptr [0x382], ax
1:0275  c7066004bc02      mov      word ptr [0x460], 0x2bc
1:027B  b84200            mov      ax, 0x42
1:027E  50                push     ax
1:027F  b8f005            mov      ax, 0x5f0
1:0282  f72e1000          imul     word ptr [0x10]
1:0286  50                push     ax
1:0287  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LocalAlloc
1:028C  a31200            mov      word ptr [0x12], ax
1:028F  50                push     ax
1:0290  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LocalLock
1:0295  a31400            mov      word ptr [0x14], ax
1:0298  833eec0300        cmp      word ptr [0x3ec], 0
1:029D  7e5f              jle      0x2fe
1:029F  c746fa0000        mov      word ptr [bp - 6], 0
1:02A4  eb49              jmp      0x2ef
1:02A6  ff46fc            inc      word ptr [bp - 4]
1:02A9  a1ec03            mov      ax, word ptr [0x3ec]
1:02AC  3946fc            cmp      word ptr [bp - 4], ax
1:02AF  7d3b              jge      0x2ec
1:02B1  b89800            mov      ax, 0x98
1:02B4  f76efa            imul     word ptr [bp - 6]
1:02B7  0346fc            add      ax, word ptr [bp - 4]
1:02BA  b90a00            mov      cx, 0xa
1:02BD  f7e9              imul     cx
1:02BF  8bd8              mov      bx, ax
1:02C1  8b361400          mov      si, word ptr [0x14]
1:02C5  c7000000          mov      word ptr [bx + si], 0
1:02C9  8b1e1400          mov      bx, word ptr [0x14]
1:02CD  8bf0              mov      si, ax
1:02CF  c740040000        mov      word ptr [bx + si + 4], 0
1:02D4  8b1e1400          mov      bx, word ptr [0x14]
1:02D8  8bfe              mov      di, si
1:02DA  c741020000        mov      word ptr [bx + di + 2], 0
1:02DF  8b1e1400          mov      bx, word ptr [0x14]
1:02E3  8bc8              mov      cx, ax
1:02E5  c740060000        mov      word ptr [bx + si + 6], 0
1:02EA  ebba              jmp      0x2a6
1:02EC  ff46fa            inc      word ptr [bp - 6]
1:02EF  a11000            mov      ax, word ptr [0x10]
1:02F2  3946fa            cmp      word ptr [bp - 6], ax
1:02F5  7d07              jge      0x2fe
1:02F7  c746fc0000        mov      word ptr [bp - 4], 0
1:02FC  ebab              jmp      0x2a9
1:02FE  c70684030000      mov      word ptr [0x384], 0
1:0304  e99100            jmp      0x398
1:0307  9a3c030000        lcall    0, 0x33c  ; @1:INT:ord_4(1:0D58)
1:030C  c41e5c04          les      bx, ptr [0x45c]
1:0310  268b4f02          mov      cx, word ptr es:[bx + 2]
1:0314  49                dec      cx
1:0315  49                dec      cx
1:0316  99                cdq      
1:0317  f7f9              idiv     cx
1:0319  42                inc      dx
1:031A  42                inc      dx
1:031B  b81a00            mov      ax, 0x1a
1:031E  8bca              mov      cx, dx
1:0320  f72e8403          imul     word ptr [0x384]
1:0324  8bd8              mov      bx, ax
1:0326  898ffe03          mov      word ptr [bx + 0x3fe], cx
1:032A  b81a00            mov      ax, 0x1a
1:032D  f72e8403          imul     word ptr [0x384]
1:0331  8bd8              mov      bx, ax
1:0333  c78700040000      mov      word ptr [bx + 0x400], 0
1:0339  8bf0              mov      si, ax
1:033B  9a78030000        lcall    0, 0x378  ; @1:INT:ord_4(1:0D58)
1:0340  c41e5c04          les      bx, ptr [0x45c]
1:0344  99                cdq      
1:0345  26f77f02          idiv     word ptr es:[bx + 2]
1:0349  89940204          mov      word ptr [si + 0x402], dx
1:034D  b81a00            mov      ax, 0x1a
1:0350  f72e8403          imul     word ptr [0x384]
1:0354  8bd8              mov      bx, ax
1:0356  c4365c04          les      si, ptr [0x45c]
1:035A  268b4404          mov      ax, word ptr es:[si + 4]
1:035E  89870404          mov      word ptr [bx + 0x404], ax
1:0362  b80100            mov      ax, 1
1:0365  8987f203          mov      word ptr [bx + 0x3f2], ax
1:0369  8987ee03          mov      word ptr [bx + 0x3ee], ax
1:036D  2bc0              sub      ax, ax
1:036F  8987f403          mov      word ptr [bx + 0x3f4], ax
1:0373  8987f003          mov      word ptr [bx + 0x3f0], ax
1:0377  9aa2030000        lcall    0, 0x3a2  ; @1:INT:ord_4(1:0D58)
1:037C  99                cdq      
1:037D  f73ee803          idiv     word ptr [0x3e8]
1:0381  b81a00            mov      ax, 0x1a
1:0384  8bca              mov      cx, dx
1:0386  f72e8403          imul     word ptr [0x384]
1:038A  8bd8              mov      bx, ax
1:038C  898f0604          mov      word ptr [bx + 0x406], cx
1:0390  0e                push     cs
1:0391  e87a06            call     0xa0e
1:0394  ff068403          inc      word ptr [0x384]
1:0398  a11000            mov      ax, word ptr [0x10]
1:039B  39068403          cmp      word ptr [0x384], ax
1:039F  7d7d              jge      0x41e
1:03A1  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_4(1:0D58)
1:03A6  b90200            mov      cx, 2
1:03A9  99                cdq      
1:03AA  f7f9              idiv     cx
1:03AC  0bd2              or       dx, dx
1:03AE  7503              jne      0x3b3
1:03B0  e954ff            jmp      0x307
1:03B3  b81a00            mov      ax, 0x1a
1:03B6  f72e8403          imul     word ptr [0x384]
1:03BA  8bd8              mov      bx, ax
1:03BC  c787fe030000      mov      word ptr [bx + 0x3fe], 0
1:03C2  8bf0              mov      si, ax
1:03C4  9af4030000        lcall    0, 0x3f4  ; @1:INT:ord_4(1:0D58)
1:03C9  c41e5c04          les      bx, ptr [0x45c]
1:03CD  268b4f04          mov      cx, word ptr es:[bx + 4]
1:03D1  49                dec      cx
1:03D2  49                dec      cx
1:03D3  99                cdq      
1:03D4  f7f9              idiv     cx
1:03D6  42                inc      dx
1:03D7  42                inc      dx
1:03D8  89940004          mov      word ptr [si + 0x400], dx
1:03DC  b81a00            mov      ax, 0x1a
1:03DF  f72e8403          imul     word ptr [0x384]
1:03E3  8bd8              mov      bx, ax
1:03E5  c4365c04          les      si, ptr [0x45c]
1:03E9  268b4402          mov      ax, word ptr es:[si + 2]
1:03ED  89870204          mov      word ptr [bx + 0x402], ax
1:03F1  8bfb              mov      di, bx
1:03F3  9a08030000        lcall    0, 0x308  ; @1:INT:ord_4(1:0D58)
1:03F8  c41e5c04          les      bx, ptr [0x45c]
1:03FC  99                cdq      
1:03FD  26f77f04          idiv     word ptr es:[bx + 4]
1:0401  89950404          mov      word ptr [di + 0x404], dx
1:0405  b81a00            mov      ax, 0x1a
1:0408  f72e8403          imul     word ptr [0x384]
1:040C  8bd8              mov      bx, ax
1:040E  2bc0              sub      ax, ax
1:0410  8987f203          mov      word ptr [bx + 0x3f2], ax
1:0414  8987ee03          mov      word ptr [bx + 0x3ee], ax
1:0418  b80100            mov      ax, 1
1:041B  e951ff            jmp      0x36f
1:041E  ff361200          push     word ptr [0x12]
1:0422  9a67060000        lcall    0, 0x667  ; @1:KERNEL.LocalUnlock
1:0427  2bc0              sub      ax, ax
1:0429  5e                pop      si
1:042A  5f                pop      di
1:042B  4d                dec      bp
1:042C  4d                dec      bp
1:042D  8be5              mov      sp, bp
1:042F  1f                pop      ds
1:0430  5d                pop      bp
1:0431  4d                dec      bp
1:0432  cb                retf     

; ===== EXPORT:ord_12(#12) =====
1:0433  1e                push     ds
1:0434  58                pop      ax
1:0435  90                nop      
1:0436  45                inc      bp
1:0437  55                push     bp
1:0438  8bec              mov      bp, sp
1:043A  1e                push     ds
1:043B  8ed8              mov      ds, ax
1:043D  33c0              xor      ax, ax
1:043F  9a95040000        lcall    0, 0x495  ; @1:INT:ord_5(1:0C92)
1:0444  c41e5c04          les      bx, ptr [0x45c]
1:0448  26837f0c00        cmp      word ptr es:[bx + 0xc], 0
1:044D  742e              je       0x47d
1:044F  b83003            mov      ax, 0x330
1:0452  1e                push     ds
1:0453  50                push     ax
1:0454  2bc0              sub      ax, ax
1:0456  50                push     ax
1:0457  50                push     ax
1:0458  26ff7702          push     word ptr es:[bx + 2]
1:045C  26ff7704          push     word ptr es:[bx + 4]
1:0460  9aa9060000        lcall    0, 0x6a9  ; @1:USER.SetRect
1:0465  ff36de03          push     word ptr [0x3de]
1:0469  b83003            mov      ax, 0x330
1:046C  1e                push     ds
1:046D  50                push     ax
1:046E  b80400            mov      ax, 4
1:0471  50                push     ax
1:0472  9abb060000        lcall    0, 0x6bb  ; @1:GDI.GetStockObject
1:0477  50                push     ax
1:0478  9ac1060000        lcall    0, 0x6c1  ; @1:USER.FillRect
1:047D  b80a00            mov      ax, 0xa
1:0480  4d                dec      bp
1:0481  4d                dec      bp
1:0482  8be5              mov      sp, bp
1:0484  1f                pop      ds
1:0485  5d                pop      bp
1:0486  4d                dec      bp
1:0487  cb                retf     

; ===== EXPORT:ord_11(#11) =====
1:0488  1e                push     ds
1:0489  58                pop      ax
1:048A  90                nop      
1:048B  45                inc      bp
1:048C  55                push     bp
1:048D  8bec              mov      bp, sp
1:048F  1e                push     ds
1:0490  8ed8              mov      ds, ax
1:0492  33c0              xor      ax, ax
1:0494  9a84060000        lcall    0, 0x684  ; @1:INT:ord_5(1:0C92)
1:0499  56                push     si
1:049A  833eec0300        cmp      word ptr [0x3ec], 0
1:049F  7505              jne      0x4a6
1:04A1  2bc0              sub      ax, ax
1:04A3  e9c801            jmp      0x66e
1:04A6  ff361200          push     word ptr [0x12]
1:04AA  9a91020000        lcall    0, 0x291  ; @1:KERNEL.LocalLock
1:04AF  a31400            mov      word ptr [0x14], ax
1:04B2  c70684030000      mov      word ptr [0x384], 0
1:04B8  e93d01            jmp      0x5f8
1:04BB  813eec039700      cmp      word ptr [0x3ec], 0x97
1:04C1  7d2b              jge      0x4ee
1:04C3  2bc0              sub      ax, ax
1:04C5  50                push     ax
1:04C6  b89800            mov      ax, 0x98
1:04C9  f72e8403          imul     word ptr [0x384]
1:04CD  03065604          add      ax, word ptr [0x456]
1:04D1  b90a00            mov      cx, 0xa
1:04D4  f7e9              imul     cx
1:04D6  8bd8              mov      bx, ax
1:04D8  031e1400          add      bx, word ptr [0x14]
1:04DC  ff7706            push     word ptr [bx + 6]
1:04DF  ff7702            push     word ptr [bx + 2]
1:04E2  ff7704            push     word ptr [bx + 4]
1:04E5  ff37              push     word ptr [bx]
1:04E7  0e                push     cs
1:04E8  e88802            call     0x773
1:04EB  83c40a            add      sp, 0xa
1:04EE  833ee60300        cmp      word ptr [0x3e6], 0
1:04F3  7504              jne      0x4f9
1:04F5  0e                push     cs
1:04F6  e81505            call     0xa0e
1:04F9  0e                push     cs
1:04FA  e80a03            call     0x807
1:04FD  0e                push     cs
1:04FE  e8e603            call     0x8e7
1:0501  0e                push     cs
1:0502  e87203            call     0x877
1:0505  0e                push     cs
1:0506  e84e04            call     0x957
1:0509  b81a00            mov      ax, 0x1a
1:050C  f72e8403          imul     word ptr [0x384]
1:0510  8bd8              mov      bx, ax
1:0512  8b870604          mov      ax, word ptr [bx + 0x406]
1:0516  8bc8              mov      cx, ax
1:0518  b89800            mov      ax, 0x98
1:051B  f72e8403          imul     word ptr [0x384]
1:051F  03065604          add      ax, word ptr [0x456]
1:0523  bb0a00            mov      bx, 0xa
1:0526  f7eb              imul     bx
1:0528  8bf0              mov      si, ax
1:052A  8b1e1400          mov      bx, word ptr [0x14]
1:052E  894808            mov      word ptr [bx + si + 8], cx
1:0531  b81a00            mov      ax, 0x1a
1:0534  f72e8403          imul     word ptr [0x384]
1:0538  8bd8              mov      bx, ax
1:053A  8b87fe03          mov      ax, word ptr [bx + 0x3fe]
1:053E  8bc8              mov      cx, ax
1:0540  b89800            mov      ax, 0x98
1:0543  f72e8403          imul     word ptr [0x384]
1:0547  03065604          add      ax, word ptr [0x456]
1:054B  bb0a00            mov      bx, 0xa
1:054E  f7eb              imul     bx
1:0550  8bd8              mov      bx, ax
1:0552  8b361400          mov      si, word ptr [0x14]
1:0556  8908              mov      word ptr [bx + si], cx
1:0558  b81a00            mov      ax, 0x1a
1:055B  f72e8403          imul     word ptr [0x384]
1:055F  8bd8              mov      bx, ax
1:0561  8b870004          mov      ax, word ptr [bx + 0x400]
1:0565  8bc8              mov      cx, ax
1:0567  b89800            mov      ax, 0x98
1:056A  f72e8403          imul     word ptr [0x384]
1:056E  03065604          add      ax, word ptr [0x456]
1:0572  bb0a00            mov      bx, 0xa
1:0575  f7eb              imul     bx
1:0577  8bf0              mov      si, ax
1:0579  8b1e1400          mov      bx, word ptr [0x14]
1:057D  894804            mov      word ptr [bx + si + 4], cx
1:0580  b81a00            mov      ax, 0x1a
1:0583  f72e8403          imul     word ptr [0x384]
1:0587  8bd8              mov      bx, ax
1:0589  8b870204          mov      ax, word ptr [bx + 0x402]
1:058D  8bc8              mov      cx, ax
1:058F  b89800            mov      ax, 0x98
1:0592  f72e8403          imul     word ptr [0x384]
1:0596  03065604          add      ax, word ptr [0x456]
1:059A  bb0a00            mov      bx, 0xa
1:059D  f7eb              imul     bx
1:059F  8bf0              mov      si, ax
1:05A1  8b1e1400          mov      bx, word ptr [0x14]
1:05A5  894802            mov      word ptr [bx + si + 2], cx
1:05A8  b81a00            mov      ax, 0x1a
1:05AB  f72e8403          imul     word ptr [0x384]
1:05AF  8bd8              mov      bx, ax
1:05B1  8b870404          mov      ax, word ptr [bx + 0x404]
1:05B5  8bc8              mov      cx, ax
1:05B7  b89800            mov      ax, 0x98
1:05BA  f72e8403          imul     word ptr [0x384]
1:05BE  03065604          add      ax, word ptr [0x456]
1:05C2  bb0a00            mov      bx, 0xa
1:05C5  f7eb              imul     bx
1:05C7  8bf0              mov      si, ax
1:05C9  8b1e1400          mov      bx, word ptr [0x14]
1:05CD  894806            mov      word ptr [bx + si + 6], cx
1:05D0  b81a00            mov      ax, 0x1a
1:05D3  f72e8403          imul     word ptr [0x384]
1:05D7  8bd8              mov      bx, ax
1:05D9  ffb70604          push     word ptr [bx + 0x406]
1:05DD  ffb70404          push     word ptr [bx + 0x404]
1:05E1  ffb70204          push     word ptr [bx + 0x402]
1:05E5  ffb70004          push     word ptr [bx + 0x400]
1:05E9  ffb7fe03          push     word ptr [bx + 0x3fe]
1:05ED  0e                push     cs
1:05EE  e88201            call     0x773
1:05F1  83c40a            add      sp, 0xa
1:05F4  ff068403          inc      word ptr [0x384]
1:05F8  a11000            mov      ax, word ptr [0x10]
1:05FB  39068403          cmp      word ptr [0x384], ax
1:05FF  7d03              jge      0x604
1:0601  e9b7fe            jmp      0x4bb
1:0604  813eec039700      cmp      word ptr [0x3ec], 0x97
1:060A  7d13              jge      0x61f
1:060C  a1ec03            mov      ax, word ptr [0x3ec]
1:060F  ff065604          inc      word ptr [0x456]
1:0613  39065604          cmp      word ptr [0x456], ax
1:0617  7c06              jl       0x61f
1:0619  c70656040000      mov      word ptr [0x456], 0
1:061F  813e5a04f401      cmp      word ptr [0x45a], 0x1f4
1:0625  7d19              jge      0x640
1:0627  a1e003            mov      ax, word ptr [0x3e0]
1:062A  ff068203          inc      word ptr [0x382]
1:062E  39068203          cmp      word ptr [0x382], ax
1:0632  7e1b              jle      0x64f
1:0634  0e                push     cs
1:0635  e88f03            call     0x9c7
1:0638  c70682030000      mov      word ptr [0x382], 0
1:063E  eb0f              jmp      0x64f
1:0640  b80100            mov      ax, 1
1:0643  a30604            mov      word ptr [0x406], ax
1:0646  a32004            mov      word ptr [0x420], ax
1:0649  a33a04            mov      word ptr [0x43a], ax
1:064C  a35404            mov      word ptr [0x454], ax
1:064F  a16004            mov      ax, word ptr [0x460]
1:0652  ff06e603          inc      word ptr [0x3e6]
1:0656  3906e603          cmp      word ptr [0x3e6], ax
1:065A  7e06              jle      0x662
1:065C  c706e6030000      mov      word ptr [0x3e6], 0
1:0662  ff361200          push     word ptr [0x12]
1:0666  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LocalUnlock
1:066B  e933fe            jmp      0x4a1
1:066E  5e                pop      si
1:066F  4d                dec      bp
1:0670  4d                dec      bp
1:0671  8be5              mov      sp, bp
1:0673  1f                pop      ds
1:0674  5d                pop      bp
1:0675  4d                dec      bp
1:0676  cb                retf     

; ===== EXPORT:ord_9(#9) =====
1:0677  1e                push     ds
1:0678  58                pop      ax
1:0679  90                nop      
1:067A  45                inc      bp
1:067B  55                push     bp
1:067C  8bec              mov      bp, sp
1:067E  1e                push     ds
1:067F  8ed8              mov      ds, ax
1:0681  33c0              xor      ax, ax
1:0683  9af2060000        lcall    0, 0x6f2  ; @1:INT:ord_5(1:0C92)
1:0688  c41ee203          les      bx, ptr [0x3e2]
1:068C  26837f2800        cmp      word ptr es:[bx + 0x28], 0
1:0691  7532              jne      0x6c5
1:0693  b83803            mov      ax, 0x338
1:0696  1e                push     ds
1:0697  50                push     ax
1:0698  2bc0              sub      ax, ax
1:069A  50                push     ax
1:069B  50                push     ax
1:069C  c41e5c04          les      bx, ptr [0x45c]
1:06A0  26ff7702          push     word ptr es:[bx + 2]
1:06A4  26ff7704          push     word ptr es:[bx + 4]
1:06A8  9affff0000        lcall    0, 0xffff  ; @1:USER.SetRect
1:06AD  ff36de03          push     word ptr [0x3de]
1:06B1  b83803            mov      ax, 0x338
1:06B4  1e                push     ds
1:06B5  50                push     ax
1:06B6  b80400            mov      ax, 4
1:06B9  50                push     ax
1:06BA  9affff0000        lcall    0, 0xffff  ; @1:GDI.GetStockObject
1:06BF  50                push     ax
1:06C0  9affff0000        lcall    0, 0xffff  ; @1:USER.FillRect
1:06C5  833e120000        cmp      word ptr [0x12], 0
1:06CA  740f              je       0x6db
1:06CC  ff361200          push     word ptr [0x12]
1:06D0  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.LocalFree
1:06D5  c70612000000      mov      word ptr [0x12], 0
1:06DB  2bc0              sub      ax, ax
1:06DD  4d                dec      bp
1:06DE  4d                dec      bp
1:06DF  8be5              mov      sp, bp
1:06E1  1f                pop      ds
1:06E2  5d                pop      bp
1:06E3  4d                dec      bp
1:06E4  cb                retf     

; ===== EXPORT:ord_8(#8) =====
1:06E5  1e                push     ds
1:06E6  58                pop      ax
1:06E7  90                nop      
1:06E8  45                inc      bp
1:06E9  55                push     bp
1:06EA  8bec              mov      bp, sp
1:06EC  1e                push     ds
1:06ED  8ed8              mov      ds, ax
1:06EF  33c0              xor      ax, ax
1:06F1  9a0d070000        lcall    0, 0x70d  ; @1:INT:ord_5(1:0C92)
1:06F6  2bc0              sub      ax, ax
1:06F8  4d                dec      bp
1:06F9  4d                dec      bp
1:06FA  8be5              mov      sp, bp
1:06FC  1f                pop      ds
1:06FD  5d                pop      bp
1:06FE  4d                dec      bp
1:06FF  cb                retf     

; ===== EXPORT:ord_7(#7) =====
1:0700  1e                push     ds
1:0701  58                pop      ax
1:0702  90                nop      
1:0703  45                inc      bp
1:0704  55                push     bp
1:0705  8bec              mov      bp, sp
1:0707  1e                push     ds
1:0708  8ed8              mov      ds, ax
1:070A  33c0              xor      ax, ax
1:070C  9a28070000        lcall    0, 0x728  ; @1:INT:ord_5(1:0C92)
1:0711  2bc0              sub      ax, ax
1:0713  4d                dec      bp
1:0714  4d                dec      bp
1:0715  8be5              mov      sp, bp
1:0717  1f                pop      ds
1:0718  5d                pop      bp
1:0719  4d                dec      bp
1:071A  cb                retf     

; ===== EXPORT:ord_6(#6) =====
1:071B  1e                push     ds
1:071C  58                pop      ax
1:071D  90                nop      
1:071E  45                inc      bp
1:071F  55                push     bp
1:0720  8bec              mov      bp, sp
1:0722  1e                push     ds
1:0723  8ed8              mov      ds, ax
1:0725  33c0              xor      ax, ax
1:0727  9a0d000000        lcall    0, 0xd  ; @1:INT:ord_5(1:0C92)
1:072C  c41ee203          les      bx, ptr [0x3e2]
1:0730  26837f1e01        cmp      word ptr es:[bx + 0x1e], 1
1:0735  7404              je       0x73b
1:0737  2bc0              sub      ax, ax
1:0739  eb30              jmp      0x76b
1:073B  8b4606            mov      ax, word ptr [bp + 6]
1:073E  0bc0              or       ax, ax
1:0740  7cf5              jl       0x737
1:0742  48                dec      ax
1:0743  7e05              jle      0x74a
1:0745  48                dec      ax
1:0746  740b              je       0x753
1:0748  ebed              jmp      0x737
1:074A  0e                push     cs
1:074B  e829ff            call     0x677
1:074E  b80300            mov      ax, 3
1:0751  eb18              jmp      0x76b
1:0753  b86400            mov      ax, 0x64
1:0756  c41e5c04          les      bx, ptr [0x45c]
1:075A  262b470a          sub      ax, word ptr es:[bx + 0xa]
1:075E  b90500            mov      cx, 5
1:0761  f7e9              imul     cx
1:0763  a35a04            mov      word ptr [0x45a], ax
1:0766  a3e003            mov      word ptr [0x3e0], ax
1:0769  ebcc              jmp      0x737
1:076B  4d                dec      bp
1:076C  4d                dec      bp
1:076D  8be5              mov      sp, bp
1:076F  1f                pop      ds
1:0770  5d                pop      bp
1:0771  4d                dec      bp
1:0772  cb                retf     
1:0773  1e                push     ds
1:0774  58                pop      ax
1:0775  90                nop      
1:0776  45                inc      bp
1:0777  55                push     bp
1:0778  8bec              mov      bp, sp
1:077A  1e                push     ds
1:077B  8ed8              mov      ds, ax
1:077D  b80400            mov      ax, 4
1:0780  9a15080000        lcall    0, 0x815  ; @1:INT:ord_5(1:0C92)
1:0785  837e0e00          cmp      word ptr [bp + 0xe], 0
1:0789  743e              je       0x7c9
1:078B  813ee803eb00      cmp      word ptr [0x3e8], 0xeb
1:0791  7511              jne      0x7a4
1:0793  ff36de03          push     word ptr [0x3de]
1:0797  2bc0              sub      ax, ax
1:0799  50                push     ax
1:079A  50                push     ax
1:079B  b80001            mov      ax, 0x100
1:079E  50                push     ax
1:079F  ff760e            push     word ptr [bp + 0xe]
1:07A2  eb17              jmp      0x7bb
1:07A4  ff36de03          push     word ptr [0x3de]
1:07A8  2bc0              sub      ax, ax
1:07AA  50                push     ax
1:07AB  50                push     ax
1:07AC  8b5e0e            mov      bx, word ptr [bp + 0xe]
1:07AF  d1e3              shl      bx, 1
1:07B1  d1e3              shl      bx, 1
1:07B3  ffb78803          push     word ptr [bx + 0x388]
1:07B7  ffb78603          push     word ptr [bx + 0x386]
1:07BB  9affff0000        lcall    0, 0xffff  ; @1:GDI.CreatePen
1:07C0  50                push     ax
1:07C1  9af5070000        lcall    0, 0x7f5  ; @1:GDI.SelectObject
1:07C6  8946fc            mov      word ptr [bp - 4], ax
1:07C9  ff36de03          push     word ptr [0x3de]
1:07CD  ff7606            push     word ptr [bp + 6]
1:07D0  ff7608            push     word ptr [bp + 8]
1:07D3  9affff0000        lcall    0, 0xffff  ; @1:GDI.MoveTo
1:07D8  ff36de03          push     word ptr [0x3de]
1:07DC  ff760a            push     word ptr [bp + 0xa]
1:07DF  ff760c            push     word ptr [bp + 0xc]
1:07E2  9affff0000        lcall    0, 0xffff  ; @1:GDI.LineTo
1:07E7  837e0e00          cmp      word ptr [bp + 0xe], 0
1:07EB  7412              je       0x7ff
1:07ED  ff36de03          push     word ptr [0x3de]
1:07F1  ff76fc            push     word ptr [bp - 4]
1:07F4  9affff0000        lcall    0, 0xffff  ; @1:GDI.SelectObject
1:07F9  50                push     ax
1:07FA  9affff0000        lcall    0, 0xffff  ; @1:GDI.DeleteObject
1:07FF  4d                dec      bp
1:0800  4d                dec      bp
1:0801  8be5              mov      sp, bp
1:0803  1f                pop      ds
1:0804  5d                pop      bp
1:0805  4d                dec      bp
1:0806  cb                retf     
1:0807  1e                push     ds
1:0808  58                pop      ax
1:0809  90                nop      
1:080A  45                inc      bp
1:080B  55                push     bp
1:080C  8bec              mov      bp, sp
1:080E  1e                push     ds
1:080F  8ed8              mov      ds, ax
1:0811  b80400            mov      ax, 4
1:0814  9a85080000        lcall    0, 0x885  ; @1:INT:ord_5(1:0C92)
1:0819  b81a00            mov      ax, 0x1a
1:081C  f72e8403          imul     word ptr [0x384]
1:0820  8bd8              mov      bx, ax
1:0822  8b87f603          mov      ax, word ptr [bx + 0x3f6]
1:0826  f7afee03          imul     word ptr [bx + 0x3ee]
1:082A  0387fe03          add      ax, word ptr [bx + 0x3fe]
1:082E  8946fc            mov      word ptr [bp - 4], ax
1:0831  0bc0              or       ax, ax
1:0833  7c0a              jl       0x83f
1:0835  c41e5c04          les      bx, ptr [0x45c]
1:0839  263b4702          cmp      ax, word ptr es:[bx + 2]
1:083D  7e20              jle      0x85f
1:083F  b81a00            mov      ax, 0x1a
1:0842  f72e8403          imul     word ptr [0x384]
1:0846  8bd8              mov      bx, ax
1:0848  8b87fe03          mov      ax, word ptr [bx + 0x3fe]
1:084C  8946fc            mov      word ptr [bp - 4], ax
1:084F  f79ff603          neg      word ptr [bx + 0x3f6]
1:0853  c787ee030000      mov      word ptr [bx + 0x3ee], 0
1:0859  c787f0030100      mov      word ptr [bx + 0x3f0], 1
1:085F  b81a00            mov      ax, 0x1a
1:0862  f72e8403          imul     word ptr [0x384]
1:0866  8bd8              mov      bx, ax
1:0868  8b46fc            mov      ax, word ptr [bp - 4]
1:086B  8987fe03          mov      word ptr [bx + 0x3fe], ax
1:086F  4d                dec      bp
1:0870  4d                dec      bp
1:0871  8be5              mov      sp, bp
1:0873  1f                pop      ds
1:0874  5d                pop      bp
1:0875  4d                dec      bp
1:0876  cb                retf     
1:0877  1e                push     ds
1:0878  58                pop      ax
1:0879  90                nop      
1:087A  45                inc      bp
1:087B  55                push     bp
1:087C  8bec              mov      bp, sp
1:087E  1e                push     ds
1:087F  8ed8              mov      ds, ax
1:0881  b80400            mov      ax, 4
1:0884  9af5080000        lcall    0, 0x8f5  ; @1:INT:ord_5(1:0C92)
1:0889  b81a00            mov      ax, 0x1a
1:088C  f72e8403          imul     word ptr [0x384]
1:0890  8bd8              mov      bx, ax
1:0892  8b87f203          mov      ax, word ptr [bx + 0x3f2]
1:0896  f7affa03          imul     word ptr [bx + 0x3fa]
1:089A  03870204          add      ax, word ptr [bx + 0x402]
1:089E  8946fc            mov      word ptr [bp - 4], ax
1:08A1  0bc0              or       ax, ax
1:08A3  7c0a              jl       0x8af
1:08A5  c41e5c04          les      bx, ptr [0x45c]
1:08A9  263b4702          cmp      ax, word ptr es:[bx + 2]
1:08AD  7e20              jle      0x8cf
1:08AF  b81a00            mov      ax, 0x1a
1:08B2  f72e8403          imul     word ptr [0x384]
1:08B6  8bd8              mov      bx, ax
1:08B8  8b870204          mov      ax, word ptr [bx + 0x402]
1:08BC  8946fc            mov      word ptr [bp - 4], ax
1:08BF  f79ffa03          neg      word ptr [bx + 0x3fa]
1:08C3  c787f2030000      mov      word ptr [bx + 0x3f2], 0
1:08C9  c787f4030100      mov      word ptr [bx + 0x3f4], 1
1:08CF  b81a00            mov      ax, 0x1a
1:08D2  f72e8403          imul     word ptr [0x384]
1:08D6  8bd8              mov      bx, ax
1:08D8  8b46fc            mov      ax, word ptr [bp - 4]
1:08DB  89870204          mov      word ptr [bx + 0x402], ax
1:08DF  4d                dec      bp
1:08E0  4d                dec      bp
1:08E1  8be5              mov      sp, bp
1:08E3  1f                pop      ds
1:08E4  5d                pop      bp
1:08E5  4d                dec      bp
1:08E6  cb                retf     
1:08E7  1e                push     ds
1:08E8  58                pop      ax
1:08E9  90                nop      
1:08EA  45                inc      bp
1:08EB  55                push     bp
1:08EC  8bec              mov      bp, sp
1:08EE  1e                push     ds
1:08EF  8ed8              mov      ds, ax
1:08F1  b80400            mov      ax, 4
1:08F4  9a65090000        lcall    0, 0x965  ; @1:INT:ord_5(1:0C92)
1:08F9  b81a00            mov      ax, 0x1a
1:08FC  f72e8403          imul     word ptr [0x384]
1:0900  8bd8              mov      bx, ax
1:0902  8b87f003          mov      ax, word ptr [bx + 0x3f0]
1:0906  f7aff803          imul     word ptr [bx + 0x3f8]
1:090A  03870004          add      ax, word ptr [bx + 0x400]
1:090E  8946fc            mov      word ptr [bp - 4], ax
1:0911  0bc0              or       ax, ax
1:0913  7c0a              jl       0x91f
1:0915  c41e5c04          les      bx, ptr [0x45c]
1:0919  263b4704          cmp      ax, word ptr es:[bx + 4]
1:091D  7e20              jle      0x93f
1:091F  b81a00            mov      ax, 0x1a
1:0922  f72e8403          imul     word ptr [0x384]
1:0926  8bd8              mov      bx, ax
1:0928  8b870004          mov      ax, word ptr [bx + 0x400]
1:092C  8946fc            mov      word ptr [bp - 4], ax
1:092F  f79ff803          neg      word ptr [bx + 0x3f8]
1:0933  c787f0030000      mov      word ptr [bx + 0x3f0], 0
1:0939  c787ee030100      mov      word ptr [bx + 0x3ee], 1
1:093F  b81a00            mov      ax, 0x1a
1:0942  f72e8403          imul     word ptr [0x384]
1:0946  8bd8              mov      bx, ax
1:0948  8b46fc            mov      ax, word ptr [bp - 4]
1:094B  89870004          mov      word ptr [bx + 0x400], ax
1:094F  4d                dec      bp
1:0950  4d                dec      bp
1:0951  8be5              mov      sp, bp
1:0953  1f                pop      ds
1:0954  5d                pop      bp
1:0955  4d                dec      bp
1:0956  cb                retf     
1:0957  1e                push     ds
1:0958  58                pop      ax
1:0959  90                nop      
1:095A  45                inc      bp
1:095B  55                push     bp
1:095C  8bec              mov      bp, sp
1:095E  1e                push     ds
1:095F  8ed8              mov      ds, ax
1:0961  b80400            mov      ax, 4
1:0964  9ad5090000        lcall    0, 0x9d5  ; @1:INT:ord_5(1:0C92)
1:0969  b81a00            mov      ax, 0x1a
1:096C  f72e8403          imul     word ptr [0x384]
1:0970  8bd8              mov      bx, ax
1:0972  8b87f403          mov      ax, word ptr [bx + 0x3f4]
1:0976  f7affc03          imul     word ptr [bx + 0x3fc]
1:097A  03870404          add      ax, word ptr [bx + 0x404]
1:097E  8946fc            mov      word ptr [bp - 4], ax
1:0981  0bc0              or       ax, ax
1:0983  7c0a              jl       0x98f
1:0985  c41e5c04          les      bx, ptr [0x45c]
1:0989  263b4704          cmp      ax, word ptr es:[bx + 4]
1:098D  7e20              jle      0x9af
1:098F  b81a00            mov      ax, 0x1a
1:0992  f72e8403          imul     word ptr [0x384]
1:0996  8bd8              mov      bx, ax
1:0998  8b870404          mov      ax, word ptr [bx + 0x404]
1:099C  8946fc            mov      word ptr [bp - 4], ax
1:099F  f79ffc03          neg      word ptr [bx + 0x3fc]
1:09A3  c787f4030000      mov      word ptr [bx + 0x3f4], 0
1:09A9  c787f2030100      mov      word ptr [bx + 0x3f2], 1
1:09AF  b81a00            mov      ax, 0x1a
1:09B2  f72e8403          imul     word ptr [0x384]
1:09B6  8bd8              mov      bx, ax
1:09B8  8b46fc            mov      ax, word ptr [bp - 4]
1:09BB  89870404          mov      word ptr [bx + 0x404], ax
1:09BF  4d                dec      bp
1:09C0  4d                dec      bp
1:09C1  8be5              mov      sp, bp
1:09C3  1f                pop      ds
1:09C4  5d                pop      bp
1:09C5  4d                dec      bp
1:09C6  cb                retf     
1:09C7  1e                push     ds
1:09C8  58                pop      ax
1:09C9  90                nop      
1:09CA  45                inc      bp
1:09CB  55                push     bp
1:09CC  8bec              mov      bp, sp
1:09CE  1e                push     ds
1:09CF  8ed8              mov      ds, ax
1:09D1  b80400            mov      ax, 4
1:09D4  9a1c0a0000        lcall    0, 0xa1c  ; @1:INT:ord_5(1:0C92)
1:09D9  c746fc0000        mov      word ptr [bp - 4], 0
1:09DE  eb1d              jmp      0x9fd
1:09E0  b91a00            mov      cx, 0x1a
1:09E3  f7e9              imul     cx
1:09E5  8bd8              mov      bx, ax
1:09E7  ff870604          inc      word ptr [bx + 0x406]
1:09EB  a1e803            mov      ax, word ptr [0x3e8]
1:09EE  39870604          cmp      word ptr [bx + 0x406], ax
1:09F2  7c06              jl       0x9fa
1:09F4  c78706040100      mov      word ptr [bx + 0x406], 1
1:09FA  ff46fc            inc      word ptr [bp - 4]
1:09FD  8b46fc            mov      ax, word ptr [bp - 4]
1:0A00  39061000          cmp      word ptr [0x10], ax
1:0A04  7fda              jg       0x9e0
1:0A06  4d                dec      bp
1:0A07  4d                dec      bp
1:0A08  8be5              mov      sp, bp
1:0A0A  1f                pop      ds
1:0A0B  5d                pop      bp
1:0A0C  4d                dec      bp
1:0A0D  cb                retf     
1:0A0E  1e                push     ds
1:0A0F  58                pop      ax
1:0A10  90                nop      
1:0A11  45                inc      bp
1:0A12  55                push     bp
1:0A13  8bec              mov      bp, sp
1:0A15  1e                push     ds
1:0A16  8ed8              mov      ds, ax
1:0A18  b80400            mov      ax, 4
1:0A1B  9a40040000        lcall    0, 0x440  ; @1:INT:ord_5(1:0C92)
1:0A20  c746fc0000        mov      word ptr [bp - 4], 0
1:0A25  9ac5030000        lcall    0, 0x3c5  ; @1:INT:ord_4(1:0D58)
1:0A2A  99                cdq      
1:0A2B  f73e5804          idiv     word ptr [0x458]
1:0A2F  42                inc      dx
1:0A30  42                inc      dx
1:0A31  b80d00            mov      ax, 0xd
1:0A34  8bca              mov      cx, dx
1:0A36  f72e8403          imul     word ptr [0x384]
1:0A3A  8bd8              mov      bx, ax
1:0A3C  035efc            add      bx, word ptr [bp - 4]
1:0A3F  d1e3              shl      bx, 1
1:0A41  898ff603          mov      word ptr [bx + 0x3f6], cx
1:0A45  ff46fc            inc      word ptr [bp - 4]
1:0A48  837efc04          cmp      word ptr [bp - 4], 4
1:0A4C  7cd7              jl       0xa25
1:0A4E  4d                dec      bp
1:0A4F  4d                dec      bp
1:0A50  8be5              mov      sp, bp
1:0A52  1f                pop      ds
1:0A53  5d                pop      bp
1:0A54  4d                dec      bp
1:0A55  cb                retf     

; ===== EXPORT:ord_16(#16) =====
1:0A56  1e                push     ds
1:0A57  58                pop      ax
1:0A58  90                nop      
1:0A59  45                inc      bp
1:0A5A  55                push     bp
1:0A5B  8bec              mov      bp, sp
1:0A5D  1e                push     ds
1:0A5E  8ed8              mov      ds, ax
1:0A60  33c0              xor      ax, ax
1:0A62  9a910a0000        lcall    0, 0xa91  ; @1:INT:ord_5(1:0C92)
1:0A67  837e0a00          cmp      word ptr [bp + 0xa], 0
1:0A6B  7504              jne      0xa71
1:0A6D  2bc0              sub      ax, ax
1:0A6F  eb09              jmp      0xa7a
1:0A71  8b460e            mov      ax, word ptr [bp + 0xe]
1:0A74  a3ea03            mov      word ptr [0x3ea], ax
1:0A77  b80100            mov      ax, 1
1:0A7A  4d                dec      bp
1:0A7B  4d                dec      bp
1:0A7C  8be5              mov      sp, bp
1:0A7E  1f                pop      ds
1:0A7F  5d                pop      bp
1:0A80  4d                dec      bp
1:0A81  ca0a00            retf     0xa

; ===== EXPORT:WEP(#2) =====
1:0A84  1e                push     ds
1:0A85  58                pop      ax
1:0A86  90                nop      
1:0A87  45                inc      bp
1:0A88  55                push     bp
1:0A89  8bec              mov      bp, sp
1:0A8B  1e                push     ds
1:0A8C  8ed8              mov      ds, ax
1:0A8E  33c0              xor      ax, ax
1:0A90  9ab00a0000        lcall    0, 0xab0  ; @1:INT:ord_5(1:0C92)
1:0A95  b80100            mov      ax, 1
1:0A98  4d                dec      bp
1:0A99  4d                dec      bp
1:0A9A  8be5              mov      sp, bp
1:0A9C  1f                pop      ds
1:0A9D  5d                pop      bp
1:0A9E  4d                dec      bp
1:0A9F  ca0200            retf     2

; ===== EXPORT:MODULE(#1) =====
1:0AA2  1e                push     ds
1:0AA3  58                pop      ax
1:0AA4  90                nop      
1:0AA5  45                inc      bp
1:0AA6  55                push     bp
1:0AA7  8bec              mov      bp, sp
1:0AA9  1e                push     ds
1:0AAA  8ed8              mov      ds, ax
1:0AAC  b80a00            mov      ax, 0xa
1:0AAF  9a81070000        lcall    0, 0x781  ; @1:INT:ord_5(1:0C92)
1:0AB4  56                push     si
1:0AB5  8b4608            mov      ax, word ptr [bp + 8]
1:0AB8  a3de03            mov      word ptr [0x3de], ax
1:0ABB  8b4606            mov      ax, word ptr [bp + 6]
1:0ABE  a38003            mov      word ptr [0x380], ax
1:0AC1  50                push     ax
1:0AC2  9ae20a0000        lcall    0, 0xae2  ; @1:KERNEL.GlobalLock
1:0AC7  a3e203            mov      word ptr [0x3e2], ax
1:0ACA  8916e403          mov      word ptr [0x3e4], dx
1:0ACE  8bc2              mov      ax, dx
1:0AD0  0b06e203          or       ax, word ptr [0x3e2]
1:0AD4  7503              jne      0xad9
1:0AD6  e96a01            jmp      0xc43
1:0AD9  c41ee203          les      bx, ptr [0x3e2]
1:0ADD  26ff7720          push     word ptr es:[bx + 0x20]
1:0AE1  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalLock
1:0AE6  a35c04            mov      word ptr [0x45c], ax
1:0AE9  89165e04          mov      word ptr [0x45e], dx
1:0AED  8bc2              mov      ax, dx
1:0AEF  0b065c04          or       ax, word ptr [0x45c]
1:0AF3  7503              jne      0xaf8
1:0AF5  e94201            jmp      0xc3a
1:0AF8  8b460a            mov      ax, word ptr [bp + 0xa]
1:0AFB  e90801            jmp      0xc06
1:0AFE  c41ee203          les      bx, ptr [0x3e2]
1:0B02  26837f1465        cmp      word ptr es:[bx + 0x14], 0x65
1:0B07  7c0f              jl       0xb18
1:0B09  26817f36f400      cmp      word ptr es:[bx + 0x36], 0xf4
1:0B0F  7507              jne      0xb18
1:0B11  26837f3878        cmp      word ptr es:[bx + 0x38], 0x78
1:0B16  740e              je       0xb26
1:0B18  c70618000000      mov      word ptr [0x18], 0
1:0B1E  c746fc0500        mov      word ptr [bp - 4], 5
1:0B23  e90701            jmp      0xc2d
1:0B26  c70618000100      mov      word ptr [0x18], 1
1:0B2C  e9fe00            jmp      0xc2d
1:0B2F  b84003            mov      ax, 0x340
1:0B32  50                push     ax
1:0B33  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_15(1:0CE2)
1:0B38  5b                pop      bx
1:0B39  ff364003          push     word ptr [0x340]
1:0B3D  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_14(1:0D44)
1:0B42  5b                pop      bx
1:0B43  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_13(1:0019)
1:0B48  eb13              jmp      0xb5d
1:0B4A  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_12(1:0433)
1:0B4F  eb0c              jmp      0xb5d
1:0B51  833e180000        cmp      word ptr [0x18], 0
1:0B56  740b              je       0xb63
1:0B58  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_11(1:0488)
1:0B5D  8946fc            mov      word ptr [bp - 4], ax
1:0B60  e9ca00            jmp      0xc2d
1:0B63  ff36de03          push     word ptr [0x3de]
1:0B67  b800ff            mov      ax, 0xff00
1:0B6A  baff00            mov      dx, 0xff
1:0B6D  52                push     dx
1:0B6E  50                push     ax
1:0B6F  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextColor
1:0B74  ff36de03          push     word ptr [0x3de]
1:0B78  2bc0              sub      ax, ax
1:0B7A  50                push     ax
1:0B7B  50                push     ax
1:0B7C  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkColor
1:0B81  ff36de03          push     word ptr [0x3de]
1:0B85  2bc0              sub      ax, ax
1:0B87  50                push     ax
1:0B88  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetTextAlign
1:0B8D  ff36de03          push     word ptr [0x3de]
1:0B91  b80100            mov      ax, 1
1:0B94  50                push     ax
1:0B95  9affff0000        lcall    0, 0xffff  ; @1:GDI.SetBkMode
1:0B9A  ff36de03          push     word ptr [0x3de]
1:0B9E  2bc0              sub      ax, ax
1:0BA0  50                push     ax
1:0BA1  50                push     ax
1:0BA2  b81a00            mov      ax, 0x1a
1:0BA5  1e                push     ds
1:0BA6  50                push     ax
1:0BA7  50                push     ax
1:0BA8  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_10(1:0CC6)
1:0BAD  5b                pop      bx
1:0BAE  50                push     ax
1:0BAF  9affff0000        lcall    0, 0xffff  ; @1:GDI.TextOut
1:0BB4  eb77              jmp      0xc2d
1:0BB6  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_9(1:0677)
1:0BBB  eba0              jmp      0xb5d
1:0BBD  a1ea03            mov      ax, word ptr [0x3ea]
1:0BC0  c41e5c04          les      bx, ptr [0x45c]
1:0BC4  26894716          mov      word ptr es:[bx + 0x16], ax
1:0BC8  c746f60000        mov      word ptr [bp - 0xa], 0
1:0BCD  8b46f6            mov      ax, word ptr [bp - 0xa]
1:0BD0  8bf0              mov      si, ax
1:0BD2  d1e6              shl      si, 1
1:0BD4  40                inc      ax
1:0BD5  c41e5c04          les      bx, ptr [0x45c]
1:0BD9  2689400e          mov      word ptr es:[bx + si + 0xe], ax
1:0BDD  ff46f6            inc      word ptr [bp - 0xa]
1:0BE0  837ef604          cmp      word ptr [bp - 0xa], 4
1:0BE4  7ce7              jl       0xbcd
1:0BE6  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_8(1:06E5)
1:0BEB  e96fff            jmp      0xb5d
1:0BEE  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_7(1:0700)
1:0BF3  e967ff            jmp      0xb5d
1:0BF6  8b460a            mov      ax, word ptr [bp + 0xa]
1:0BF9  2d0700            sub      ax, 7
1:0BFC  50                push     ax
1:0BFD  9affff0000        lcall    0, 0xffff  ; @1:INT:ord_6(1:071B)
1:0C02  5b                pop      bx
1:0C03  e957ff            jmp      0xb5d
1:0C06  3d0c00            cmp      ax, 0xc
1:0C09  7722              ja       0xc2d
1:0C0B  d1e0              shl      ax, 1
1:0C0D  93                xchg     bx, ax
1:0C0E  2effa7130c        jmp      word ptr cs:[bx + 0xc13]
1:0C13  2f                das      
1:0C14  0b4a0b            or       cx, word ptr [bp + si + 0xb]
1:0C17  51                push     cx
1:0C18  0bb60b2d          or       si, word ptr [bp + 0x2d0b]
1:0C1C  0cbd              or       al, 0xbd
1:0C1E  0bee              or       bp, si
1:0C20  0bf6              or       si, si
1:0C22  0bf6              or       si, si
1:0C24  0bf6              or       si, si
1:0C26  0bf6              or       si, si
1:0C28  0b2d              or       bp, word ptr [di]
1:0C2A  0cfe              or       al, 0xfe
1:0C2C  0ac4              or       al, ah
1:0C2E  1e                push     ds
1:0C2F  e203              loop     0xc34
1:0C31  26ff7720          push     word ptr es:[bx + 0x20]
1:0C35  9a3f0c0000        lcall    0, 0xc3f  ; @1:KERNEL.GlobalUnlock
1:0C3A  ff368003          push     word ptr [0x380]
1:0C3E  9affff0000        lcall    0, 0xffff  ; @1:KERNEL.GlobalUnlock
1:0C43  8b46fc            mov      ax, word ptr [bp - 4]
1:0C46  5e                pop      si
1:0C47  4d                dec      bp
1:0C48  4d                dec      bp
1:0C49  8be5              mov      sp, bp
1:0C4B  1f                pop      ds
1:0C4C  5d                pop      bp
1:0C4D  4d                dec      bp
1:0C4E  ca0600            retf     6
1:0C51  0000              add      byte ptr [bx + si], al
1:0C53  0000              add      byte ptr [bx + si], al
1:0C55  0000              add      byte ptr [bx + si], al
1:0C57  0000              add      byte ptr [bx + si], al
1:0C59  0000              add      byte ptr [bx + si], al
1:0C5B  0000              add      byte ptr [bx + si], al
1:0C5D  0000              add      byte ptr [bx + si], al
1:0C5F  0000              add      byte ptr [bx + si], al
1:0C61  0000              add      byte ptr [bx + si], al
1:0C63  0000              add      byte ptr [bx + si], al
1:0C65  0000              add      byte ptr [bx + si], al
1:0C67  0000              add      byte ptr [bx + si], al
1:0C69  0000              add      byte ptr [bx + si], al
1:0C6B  0000              add      byte ptr [bx + si], al
1:0C6D  0000              add      byte ptr [bx + si], al
1:0C6F  00c3              add      bl, al
1:0C71  005b40            add      byte ptr [bp + di + 0x40], bl
1:0C74  24fe              and      al, 0xfe
1:0C76  2bc4              sub      ax, sp
1:0C78  7345              jae      0xcbf
1:0C7A  f7d8              neg      ax
1:0C7C  3639060a00        cmp      word ptr ss:[0xa], ax
1:0C81  773c              ja       0xcbf
1:0C83  3639060c00        cmp      word ptr ss:[0xc], ax
1:0C88  7604              jbe      0xc8e
1:0C8A  36a30c00          mov      word ptr ss:[0xc], ax
1:0C8E  8be0              mov      sp, ax
1:0C90  ffe3              jmp      bx

; ===== EXPORT:ord_5(#5) =====
1:0C92  5b                pop      bx
1:0C93  5a                pop      dx
1:0C94  40                inc      ax
1:0C95  24fe              and      al, 0xfe
1:0C97  2bc4              sub      ax, sp
1:0C99  7319              jae      0xcb4
1:0C9B  f7d8              neg      ax
1:0C9D  3639060a00        cmp      word ptr ss:[0xa], ax
1:0CA2  7710              ja       0xcb4
1:0CA4  3639060c00        cmp      word ptr ss:[0xc], ax
1:0CA9  7604              jbe      0xcaf
1:0CAB  36a30c00          mov      word ptr ss:[0xc], ax
1:0CAF  8be0              mov      sp, ax
1:0CB1  52                push     dx
1:0CB2  53                push     bx
1:0CB3  cb                retf     
1:0CB4  8b165200          mov      dx, word ptr [0x52]
1:0CB8  42                inc      dx
1:0CB9  7404              je       0xcbf
1:0CBB  ff2e5200          ljmp     [0x52]
1:0CBF  b80000            mov      ax, 0
1:0CC2  e9cd00            jmp      0xd92
1:0CC5  00558b            add      byte ptr [di - 0x75], dl
1:0CC8  ec                in       al, dx
1:0CC9  8bd7              mov      dx, di
1:0CCB  8cd8              mov      ax, ds
1:0CCD  8ec0              mov      es, ax
1:0CCF  8b7e06            mov      di, word ptr [bp + 6]
1:0CD2  33c0              xor      ax, ax
1:0CD4  b9ffff            mov      cx, 0xffff
1:0CD7  f2ae              repne scasb al, byte ptr es:[di]
1:0CD9  f7d1              not      cx
1:0CDB  49                dec      cx
1:0CDC  91                xchg     cx, ax
1:0CDD  8bfa              mov      di, dx
1:0CDF  5d                pop      bp
1:0CE0  cb                retf     
1:0CE1  008cd890          add      byte ptr [si - 0x6f28], cl
1:0CE5  45                inc      bp
1:0CE6  55                push     bp
1:0CE7  8bec              mov      bp, sp
1:0CE9  1e                push     ds
1:0CEA  8ed8              mov      ds, ax
1:0CEC  56                push     si
1:0CED  b42a              mov      ah, 0x2a
1:0CEF  cd21              int      0x21
1:0CF1  8bda              mov      bx, dx
1:0CF3  8bf1              mov      si, cx
1:0CF5  b42c              mov      ah, 0x2c
1:0CF7  cd21              int      0x21
1:0CF9  b400              mov      ah, 0
1:0CFB  8ac6              mov      al, dh
1:0CFD  50                push     ax
1:0CFE  8ac1              mov      al, cl
1:0D00  50                push     ax