
; ===== FN 1:2D7C..30EA =====
1:2D7C  1e             push     ds
1:2D7D  58             pop      ax
1:2D7E  90             nop      
1:2D7F  45             inc      bp
1:2D80  55             push     bp
1:2D81  8bec           mov      bp, sp
1:2D83  1e             push     ds
1:2D84  8ed8           mov      ds, ax
1:2D86  83ec06         sub      sp, 6
1:2D89  8b4606         mov      ax, word ptr [bp + 6]
1:2D8C  e9aa00         jmp      0x2e39
1:2D8F  ff369208       push     word ptr [0x892]
1:2D93  1e             push     ds
1:2D94  ff7608         push     word ptr [bp + 8]
1:2D97  ff760a         push     word ptr [bp + 0xa]
1:2D9A  9aba2d0000     lcall    0, 0x2dba  ; USER.FrameRect
1:2D9F  e9b000         jmp      0x2e52
1:2DA2  ff7608         push     word ptr [bp + 8]
1:2DA5  9affff0000     lcall    0, 0xffff  ; INT:255:0027
1:2DAA  5b             pop      bx
1:2DAB  e9a400         jmp      0x2e52
1:2DAE  ff369208       push     word ptr [0x892]
1:2DB2  1e             push     ds
1:2DB3  ff7608         push     word ptr [bp + 8]
1:2DB6  ff760a         push     word ptr [bp + 0xa]
1:2DB9  9affff0000     lcall    0, 0xffff  ; USER.FrameRect
1:2DBE  ff7608         push     word ptr [bp + 8]
1:2DC1  9affff0000     lcall    0, 0xffff  ; INT:255:002A
1:2DC6  ebe2           jmp      0x2daa
1:2DC8  ff369208       push     word ptr [0x892]
1:2DCC  1e             push     ds
1:2DCD  ff7608         push     word ptr [bp + 8]
1:2DD0  ff760a         push     word ptr [bp + 0xa]
1:2DD3  9a41170000     lcall    0, 0x1741  ; USER.FillRect
1:2DD8  eb78           jmp      0x2e52
1:2DDA  ff7608         push     word ptr [bp + 8]
1:2DDD  0e             push     cs
1:2DDE  e8c2f8         call     0x26a3
1:2DE1  ebc7           jmp      0x2daa
1:2DE3  ff369208       push     word ptr [0x892]
1:2DE7  b80800         mov      ax, 8
1:2DEA  50             push     ax
1:2DEB  9a862e0000     lcall    0, 0x2e86  ; GDI.GetStockObject
1:2DF0  50             push     ax
1:2DF1  9a012e0000     lcall    0, 0x2e01  ; GDI.SelectObject
1:2DF6  8946fc         mov      word ptr [bp - 4], ax
1:2DF9  ff369208       push     word ptr [0x892]
1:2DFD  ff760a         push     word ptr [bp + 0xa]
1:2E00  9a272e0000     lcall    0, 0x2e27  ; GDI.SelectObject
1:2E05  8946fa         mov      word ptr [bp - 6], ax
1:2E08  ff369208       push     word ptr [0x892]
1:2E0C  8b5e08         mov      bx, word ptr [bp + 8]
1:2E0F  ff37           push     word ptr [bx]
1:2E11  ff7702         push     word ptr [bx + 2]
1:2E14  ff7704         push     word ptr [bx + 4]
1:2E17  ff7706         push     word ptr [bx + 6]
1:2E1A  9a8d260000     lcall    0, 0x268d  ; GDI.Ellipse
1:2E1F  ff369208       push     word ptr [0x892]
1:2E23  ff76fc         push     word ptr [bp - 4]
1:2E26  9a332e0000     lcall    0, 0x2e33  ; GDI.SelectObject
1:2E2B  ff369208       push     word ptr [0x892]
1:2E2F  ff76fa         push     word ptr [bp - 6]
1:2E32  9abf260000     lcall    0, 0x26bf  ; GDI.SelectObject
1:2E37  eb19           jmp      0x2e52
1:2E39  3d0500         cmp      ax, 5
1:2E3C  7714           ja       0x2e52
1:2E3E  d1e0           shl      ax, 1
1:2E40  93             xchg     bx, ax
1:2E41  2effa7462e     jmp      word ptr cs:[bx + 0x2e46]
1:2E47  2da22d         sub      ax, 0x2da2
1:2E4A  ae             scasb    al, byte ptr es:[di]
1:2E4B  2dc82d         sub      ax, 0x2dc8
1:2E4E  da2d           fisubr   dword ptr [di]
1:2E50  e32d           jcxz     0x2e7f
1:2E52  4d             dec      bp
1:2E53  4d             dec      bp
1:2E54  8be5           mov      sp, bp
1:2E56  1f             pop      ds
1:2E57  5d             pop      bp
1:2E58  4d             dec      bp
1:2E59  cb             retf     
1:2E5A  1e             push     ds
1:2E5B  58             pop      ax
1:2E5C  90             nop      
1:2E5D  45             inc      bp
1:2E5E  55             push     bp
1:2E5F  8bec           mov      bp, sp
1:2E61  1e             push     ds
1:2E62  8ed8           mov      ds, ax
1:2E64  83ec22         sub      sp, 0x22
1:2E67  57             push     di
1:2E68  56             push     si
1:2E69  837e1200       cmp      word ptr [bp + 0x12], 0
1:2E6D  751e           jne      0x2e8d
1:2E6F  b80200         mov      ax, 2
1:2E72  50             push     ax
1:2E73  9aaa2a0000     lcall    0, 0x2aaa  ; INT:255:0007
1:2E78  5b             pop      bx
1:2E79  0bc0           or       ax, ax
1:2E7B  7405           je       0x2e82
1:2E7D  b80400         mov      ax, 4
1:2E80  eb02           jmp      0x2e84
1:2E82  2bc0           sub      ax, ax
1:2E84  50             push     ax
1:2E85  9a852b0000     lcall    0, 0x2b85  ; GDI.GetStockObject
1:2E8A  894612         mov      word ptr [bp + 0x12], ax
1:2E8D  8b460a         mov      ax, word ptr [bp + 0xa]
1:2E90  8946f4         mov      word ptr [bp - 0xc], ax
1:2E93  8b4608         mov      ax, word ptr [bp + 8]
1:2E96  8946f2         mov      word ptr [bp - 0xe], ax
1:2E99  b8be06         mov      ax, 0x6be
1:2E9C  50             push     ax
1:2E9D  9a6b260000     lcall    0, 0x266b  ; INT:255:0022
1:2EA2  5b             pop      bx
1:2EA3  ff7610         push     word ptr [bp + 0x10]
1:2EA6  9affff0000     lcall    0, 0xffff  ; INT:255:0029
1:2EAB  5b             pop      bx
1:2EAC  804e0c01       or       byte ptr [bp + 0xc], 1
1:2EB0  837e0604       cmp      word ptr [bp + 6], 4
1:2EB4  7508           jne      0x2ebe
1:2EB6  83460c01       add      word ptr [bp + 0xc], 1
1:2EBA  83560e00       adc      word ptr [bp + 0xe], 0
1:2EBE  b8c606         mov      ax, 0x6c6
1:2EC1  1e             push     ds
1:2EC2  50             push     ax
1:2EC3  b90100         mov      cx, 1
1:2EC6  51             push     cx
1:2EC7  51             push     cx
1:2EC8  ff760c         push     word ptr [bp + 0xc]
1:2ECB  ff760c         push     word ptr [bp + 0xc]
1:2ECE  9a5e2f0000     lcall    0, 0x2f5e  ; USER.SetRect
1:2ED3  b8c606         mov      ax, 0x6c6
1:2ED6  50             push     ax
1:2ED7  9a9d2c0000     lcall    0, 0x2c9d  ; INT:255:0025
1:2EDC  5b             pop      bx
1:2EDD  b8c606         mov      ax, 0x6c6
1:2EE0  1e             push     ds
1:2EE1  50             push     ax
1:2EE2  8b460c         mov      ax, word ptr [bp + 0xc]
1:2EE5  99             cdq      
1:2EE6  2bc2           sub      ax, dx
1:2EE8  d1f8           sar      ax, 1
1:2EEA  8946f0         mov      word ptr [bp - 0x10], ax
1:2EED  f7d8           neg      ax
1:2EEF  50             push     ax
1:2EF0  50             push     ax
1:2EF1  9a142f0000     lcall    0, 0x2f14  ; USER.OffsetRect
1:2EF6  837e1001       cmp      word ptr [bp + 0x10], 1
1:2EFA  741c           je       0x2f18
1:2EFC  837e0604       cmp      word ptr [bp + 6], 4
1:2F00  7416           je       0x2f18
1:2F02  b8c606         mov      ax, 0x6c6
1:2F05  1e             push     ds
1:2F06  50             push     ax
1:2F07  8b4610         mov      ax, word ptr [bp + 0x10]
1:2F0A  99             cdq      
1:2F0B  2bc2           sub      ax, dx
1:2F0D  d1f8           sar      ax, 1
1:2F0F  f7d8           neg      ax
1:2F11  50             push     ax
1:2F12  50             push     ax
1:2F13  9a352f0000     lcall    0, 0x2f35  ; USER.OffsetRect
1:2F18  837e0604       cmp      word ptr [bp + 6], 4
1:2F1C  7406           je       0x2f24
1:2F1E  837e1001       cmp      word ptr [bp + 0x10], 1
1:2F22  7415           je       0x2f39
1:2F24  837e0604       cmp      word ptr [bp + 6], 4
1:2F28  750f           jne      0x2f39
1:2F2A  b8c606         mov      ax, 0x6c6
1:2F2D  1e             push     ds
1:2F2E  50             push     ax
1:2F2F  b80100         mov      ax, 1
1:2F32  50             push     ax
1:2F33  50             push     ax
1:2F34  9a792f0000     lcall    0, 0x2f79  ; USER.OffsetRect
1:2F39  837e0603       cmp      word ptr [bp + 6], 3
1:2F3D  740c           je       0x2f4b
1:2F3F  837e0600       cmp      word ptr [bp + 6], 0
1:2F43  7406           je       0x2f4b
1:2F45  837e0605       cmp      word ptr [bp + 6], 5
1:2F49  7517           jne      0x2f62
1:2F4B  b8c606         mov      ax, 0x6c6
1:2F4E  1e             push     ds
1:2F4F  50             push     ax
1:2F50  8b46f0         mov      ax, word ptr [bp - 0x10]
1:2F53  f7d8           neg      ax
1:2F55  50             push     ax
1:2F56  50             push     ax
1:2F57  8b46f0         mov      ax, word ptr [bp - 0x10]
1:2F5A  40             inc      ax
1:2F5B  50             push     ax
1:2F5C  50             push     ax
1:2F5D  9a69270000     lcall    0, 0x2769  ; USER.SetRect
1:2F62  b8ce06         mov      ax, 0x6ce
1:2F65  8bf8           mov      di, ax
1:2F67  bec606         mov      si, 0x6c6
1:2F6A  1e             push     ds
1:2F6B  07             pop      es
1:2F6C  a5             movsw    word ptr es:[di], word ptr [si]
1:2F6D  a5             movsw    word ptr es:[di], word ptr [si]
1:2F6E  a5             movsw    word ptr es:[di], word ptr [si]
1:2F6F  a5             movsw    word ptr es:[di], word ptr [si]
1:2F70  1e             push     ds
1:2F71  50             push     ax
1:2F72  ff76f4         push     word ptr [bp - 0xc]
1:2F75  ff76f2         push     word ptr [bp - 0xe]
1:2F78  9aaa2f0000     lcall    0, 0x2faa  ; USER.OffsetRect
1:2F7D  ff7612         push     word ptr [bp + 0x12]
1:2F80  b8ce06         mov      ax, 0x6ce
1:2F83  50             push     ax
1:2F84  ff7606         push     word ptr [bp + 6]
1:2F87  0e             push     cs
1:2F88  e8f1fd         call     0x2d7c
1:2F8B  83c406         add      sp, 6
1:2F8E  b8ce06         mov      ax, 0x6ce
1:2F91  8bf8           mov      di, ax
1:2F93  bec606         mov      si, 0x6c6
1:2F96  1e             push     ds
1:2F97  07             pop      es
1:2F98  a5             movsw    word ptr es:[di], word ptr [si]
1:2F99  a5             movsw    word ptr es:[di], word ptr [si]
1:2F9A  a5             movsw    word ptr es:[di], word ptr [si]
1:2F9B  a5             movsw    word ptr es:[di], word ptr [si]
1:2F9C  1e             push     ds
1:2F9D  50             push     ax
1:2F9E  8b4ef4         mov      cx, word ptr [bp - 0xc]
1:2FA1  f7d9           neg      cx
1:2FA3  51             push     cx
1:2FA4  ff76f2         push     word ptr [bp - 0xe]
1:2FA7  8bf1           mov      si, cx
1:2FA9  9add2f0000     lcall    0, 0x2fdd  ; USER.OffsetRect
1:2FAE  ff7612         push     word ptr [bp + 0x12]
1:2FB1  b8ce06         mov      ax, 0x6ce
1:2FB4  50             push     ax
1:2FB5  ff7606         push     word ptr [bp + 6]
1:2FB8  0e             push     cs
1:2FB9  e8c0fd         call     0x2d7c
1:2FBC  83c406         add      sp, 6
1:2FBF  b8ce06         mov      ax, 0x6ce
1:2FC2  56             push     si
1:2FC3  8bf8           mov      di, ax
1:2FC5  bec606         mov      si, 0x6c6
1:2FC8  1e             push     ds
1:2FC9  07             pop      es
1:2FCA  a5             movsw    word ptr es:[di], word ptr [si]
1:2FCB  a5             movsw    word ptr es:[di], word ptr [si]
1:2FCC  a5             movsw    word ptr es:[di], word ptr [si]
1:2FCD  a5             movsw    word ptr es:[di], word ptr [si]
1:2FCE  5e             pop      si
1:2FCF  1e             push     ds
1:2FD0  50             push     ax
1:2FD1  8b4ef2         mov      cx, word ptr [bp - 0xe]
1:2FD4  f7d9           neg      cx
1:2FD6  51             push     cx
1:2FD7  ff76f4         push     word ptr [bp - 0xc]
1:2FDA  8bf9           mov      di, cx
1:2FDC  9a0b300000     lcall    0, 0x300b  ; USER.OffsetRect
1:2FE1  ff7612         push     word ptr [bp + 0x12]
1:2FE4  b8ce06         mov      ax, 0x6ce
1:2FE7  50             push     ax
1:2FE8  ff7606         push     word ptr [bp + 6]
1:2FEB  0e             push     cs
1:2FEC  e88dfd         call     0x2d7c
1:2FEF  83c406         add      sp, 6
1:2FF2  b8ce06         mov      ax, 0x6ce
1:2FF5  56             push     si
1:2FF6  57             push     di
1:2FF7  8bf8           mov      di, ax
1:2FF9  bec606         mov      si, 0x6c6
1:2FFC  1e             push     ds
1:2FFD  07             pop      es
1:2FFE  a5             movsw    word ptr es:[di], word ptr [si]
1:2FFF  a5             movsw    word ptr es:[di], word ptr [si]
1:3000  a5             movsw    word ptr es:[di], word ptr [si]
1:3001  a5             movsw    word ptr es:[di], word ptr [si]
1:3002  5f             pop      di
1:3003  5e             pop      si
1:3004  1e             push     ds
1:3005  50             push     ax
1:3006  ff76f4         push     word ptr [bp - 0xc]
1:3009  57             push     di
1:300A  9a39300000     lcall    0, 0x3039  ; USER.OffsetRect
1:300F  ff7612         push     word ptr [bp + 0x12]
1:3012  b8ce06         mov      ax, 0x6ce
1:3015  50             push     ax
1:3016  ff7606         push     word ptr [bp + 6]
1:3019  0e             push     cs
1:301A  e85ffd         call     0x2d7c
1:301D  83c406         add      sp, 6
1:3020  b8ce06         mov      ax, 0x6ce
1:3023  56             push     si
1:3024  57             push     di
1:3025  8bf8           mov      di, ax
1:3027  bec606         mov      si, 0x6c6
1:302A  1e             push     ds
1:302B  07             pop      es
1:302C  a5             movsw    word ptr es:[di], word ptr [si]
1:302D  a5             movsw    word ptr es:[di], word ptr [si]
1:302E  a5             movsw    word ptr es:[di], word ptr [si]
1:302F  a5             movsw    word ptr es:[di], word ptr [si]
1:3030  5f             pop      di
1:3031  5e             pop      si
1:3032  1e             push     ds
1:3033  50             push     ax
1:3034  ff76f2         push     word ptr [bp - 0xe]
1:3037  56             push     si
1:3038  9a65300000     lcall    0, 0x3065  ; USER.OffsetRect
1:303D  ff7612         push     word ptr [bp + 0x12]
1:3040  b8ce06         mov      ax, 0x6ce
1:3043  50             push     ax
1:3044  ff7606         push     word ptr [bp + 6]
1:3047  0e             push     cs
1:3048  e831fd         call     0x2d7c
1:304B  83c406         add      sp, 6
1:304E  b8ce06         mov      ax, 0x6ce
1:3051  56             push     si
1:3052  57             push     di
1:3053  8bf8           mov      di, ax
1:3055  bec606         mov      si, 0x6c6
1:3058  1e             push     ds
1:3059  07             pop      es
1:305A  a5             movsw    word ptr es:[di], word ptr [si]
1:305B  a5             movsw    word ptr es:[di], word ptr [si]
1:305C  a5             movsw    word ptr es:[di], word ptr [si]
1:305D  a5             movsw    word ptr es:[di], word ptr [si]
1:305E  5f             pop      di
1:305F  5e             pop      si
1:3060  1e             push     ds
1:3061  50             push     ax
1:3062  56             push     si
1:3063  57             push     di
1:3064  9a95300000     lcall    0, 0x3095  ; USER.OffsetRect
1:3069  ff7612         push     word ptr [bp + 0x12]
1:306C  b8ce06         mov      ax, 0x6ce
1:306F  50             push     ax
1:3070  ff7606         push     word ptr [bp + 6]
1:3073  0e             push     cs
1:3074  e805fd         call     0x2d7c
1:3077  83c406         add      sp, 6
1:307A  b8ce06         mov      ax, 0x6ce
1:307D  56             push     si
1:307E  57             push     di
1:307F  8bf8           mov      di, ax
1:3081  bec606         mov      si, 0x6c6
1:3084  1e             push     ds
1:3085  07             pop      es
1:3086  a5             movsw    word ptr es:[di], word ptr [si]
1:3087  a5             movsw    word ptr es:[di], word ptr [si]
1:3088  a5             movsw    word ptr es:[di], word ptr [si]
1:3089  a5             movsw    word ptr es:[di], word ptr [si]
1:308A  5f             pop      di
1:308B  5e             pop      si
1:308C  1e             push     ds
1:308D  50             push     ax
1:308E  ff76f2         push     word ptr [bp - 0xe]
1:3091  ff76f4         push     word ptr [bp - 0xc]
1:3094  9ac1300000     lcall    0, 0x30c1  ; USER.OffsetRect
1:3099  ff7612         push     word ptr [bp + 0x12]
1:309C  b8ce06         mov      ax, 0x6ce
1:309F  50             push     ax
1:30A0  ff7606         push     word ptr [bp + 6]
1:30A3  0e             push     cs
1:30A4  e8d5fc         call     0x2d7c
1:30A7  83c406         add      sp, 6
1:30AA  b8ce06         mov      ax, 0x6ce
1:30AD  56             push     si
1:30AE  57             push     di
1:30AF  8bf8           mov      di, ax
1:30B1  bec606         mov      si, 0x6c6
1:30B4  1e             push     ds
1:30B5  07             pop      es
1:30B6  a5             movsw    word ptr es:[di], word ptr [si]
1:30B7  a5             movsw    word ptr es:[di], word ptr [si]
1:30B8  a5             movsw    word ptr es:[di], word ptr [si]
1:30B9  a5             movsw    word ptr es:[di], word ptr [si]
1:30BA  5f             pop      di
1:30BB  5e             pop      si
1:30BC  1e             push     ds
1:30BD  50             push     ax
1:30BE  57             push     di
1:30BF  56             push     si
1:30C0  9a54210000     lcall    0, 0x2154  ; USER.OffsetRect
1:30C5  ff7612         push     word ptr [bp + 0x12]
1:30C8  b8ce06         mov      ax, 0x6ce
1:30CB  50             push     ax
1:30CC  ff7606         push     word ptr [bp + 6]
1:30CF  0e             push     cs
1:30D0  e8a9fc         call     0x2d7c
1:30D3  83c406         add      sp, 6
1:30D6  b8be06         mov      ax, 0x6be
1:30D9  50             push     ax
1:30DA  9a4f2b0000     lcall    0, 0x2b4f  ; INT:255:0024
1:30DF  5b             pop      bx
1:30E0  5e             pop      si
1:30E1  5f             pop      di
1:30E2  4d             dec      bp
1:30E3  4d             dec      bp
1:30E4  8be5           mov      sp, bp
1:30E6  1f             pop      ds
1:30E7  5d             pop      bp
1:30E8  4d             dec      bp
1:30E9  cb             retf     

; ===== FN 1:30EA..3118 =====
1:30EA  1e             push     ds
1:30EB  58             pop      ax
1:30EC  90             nop      
1:30ED  45             inc      bp
1:30EE  55             push     bp
1:30EF  8bec           mov      bp, sp
1:30F1  1e             push     ds
1:30F2  8ed8           mov      ds, ax
1:30F4  83ec04         sub      sp, 4
1:30F7  2bc0           sub      ax, ax
1:30F9  50             push     ax
1:30FA  ff7606         push     word ptr [bp + 6]
1:30FD  0e             push     cs
1:30FE  e84500         call     0x3146
1:3101  5b             pop      bx
1:3102  5b             pop      bx
1:3103  b80500         mov      ax, 5
1:3106  50             push     ax
1:3107  ff7606         push     word ptr [bp + 6]
1:310A  0e             push     cs
1:310B  e83800         call     0x3146
1:310E  5b             pop      bx
1:310F  5b             pop      bx
1:3110  4d             dec      bp
1:3111  4d             dec      bp
1:3112  8be5           mov      sp, bp
1:3114  1f             pop      ds
1:3115  5d             pop      bp
1:3116  4d             dec      bp
1:3117  cb             retf     

; ===== FN 1:3118..3146 =====
1:3118  1e             push     ds
1:3119  58             pop      ax
1:311A  90             nop      
1:311B  45             inc      bp
1:311C  55             push     bp
1:311D  8bec           mov      bp, sp
1:311F  1e             push     ds
1:3120  8ed8           mov      ds, ax
1:3122  83ec04         sub      sp, 4
1:3125  2bc0           sub      ax, ax
1:3127  50             push     ax
1:3128  ff7606         push     word ptr [bp + 6]
1:312B  0e             push     cs
1:312C  e81700         call     0x3146
1:312F  5b             pop      bx
1:3130  5b             pop      bx
1:3131  b8fbff         mov      ax, 0xfffb
1:3134  50             push     ax
1:3135  ff7606         push     word ptr [bp + 6]
1:3138  0e             push     cs
1:3139  e80a00         call     0x3146
1:313C  5b             pop      bx
1:313D  5b             pop      bx
1:313E  4d             dec      bp
1:313F  4d             dec      bp
1:3140  8be5           mov      sp, bp
1:3142  1f             pop      ds
1:3143  5d             pop      bp
1:3144  4d             dec      bp
1:3145  cb             retf     

; ===== FN 1:3146..31D4 =====
1:3146  1e             push     ds
1:3147  58             pop      ax
1:3148  90             nop      
1:3149  45             inc      bp
1:314A  55             push     bp
1:314B  8bec           mov      bp, sp
1:314D  1e             push     ds
1:314E  8ed8           mov      ds, ax
1:3150  83ec06         sub      sp, 6
1:3153  56             push     si
1:3154  8b4608         mov      ax, word ptr [bp + 8]
1:3157  8946fc         mov      word ptr [bp - 4], ax
1:315A  b9d606         mov      cx, 0x6d6
1:315D  51             push     cx
1:315E  ff7606         push     word ptr [bp + 6]
1:3161  9affff0000     lcall    0, 0xffff  ; INT:255:0028
1:3166  5b             pop      bx
1:3167  5b             pop      bx
1:3168  b8de06         mov      ax, 0x6de
1:316B  1e             push     ds
1:316C  50             push     ax
1:316D  8b4efc         mov      cx, word ptr [bp - 4]
1:3170  f7d9           neg      cx
1:3172  51             push     cx
1:3173  ff76fc         push     word ptr [bp - 4]
1:3176  8bf1           mov      si, cx
1:3178  9a85310000     lcall    0, 0x3185  ; USER.OffsetRect
1:317D  b8e606         mov      ax, 0x6e6
1:3180  1e             push     ds
1:3181  50             push     ax
1:3182  56             push     si
1:3183  56             push     si
1:3184  9a93310000     lcall    0, 0x3193  ; USER.OffsetRect
1:3189  b8ee06         mov      ax, 0x6ee
1:318C  1e             push     ds
1:318D  50             push     ax
1:318E  ff76fc         push     word ptr [bp - 4]
1:3191  56             push     si
1:3192  9aa3310000     lcall    0, 0x31a3  ; USER.OffsetRect
1:3197  b8f606         mov      ax, 0x6f6
1:319A  1e             push     ds
1:319B  50             push     ax
1:319C  ff76fc         push     word ptr [bp - 4]
1:319F  ff76fc         push     word ptr [bp - 4]
1:31A2  9af22e0000     lcall    0, 0x2ef2  ; USER.OffsetRect
1:31A7  b8de06         mov      ax, 0x6de
1:31AA  50             push     ax
1:31AB  0e             push     cs
1:31AC  e8adf4         call     0x265c
1:31AF  5b             pop      bx
1:31B0  b8e606         mov      ax, 0x6e6
1:31B3  50             push     ax
1:31B4  0e             push     cs
1:31B5  e8a4f4         call     0x265c
1:31B8  5b             pop      bx
1:31B9  b8ee06         mov      ax, 0x6ee
1:31BC  50             push     ax
1:31BD  0e             push     cs
1:31BE  e89bf4         call     0x265c
1:31C1  5b             pop      bx
1:31C2  b8f606         mov      ax, 0x6f6
1:31C5  50             push     ax
1:31C6  0e             push     cs
1:31C7  e892f4         call     0x265c
1:31CA  5b             pop      bx
1:31CB  5e             pop      si
1:31CC  4d             dec      bp
1:31CD  4d             dec      bp
1:31CE  8be5           mov      sp, bp
1:31D0  1f             pop      ds
1:31D1  5d             pop      bp
1:31D2  4d             dec      bp
1:31D3  cb             retf     

; ===== FN 1:31D4..32E8 =====
1:31D4  1e             push     ds
1:31D5  58             pop      ax
1:31D6  90             nop      
1:31D7  45             inc      bp
1:31D8  55             push     bp
1:31D9  8bec           mov      bp, sp
1:31DB  1e             push     ds
1:31DC  8ed8           mov      ds, ax
1:31DE  83ec1a         sub      sp, 0x1a
1:31E1  57             push     di
1:31E2  56             push     si
1:31E3  b80100         mov      ax, 1
1:31E6  50             push     ax
1:31E7  9a742e0000     lcall    0, 0x2e74  ; INT:255:0007
1:31EC  5b             pop      bx
1:31ED  8946ee         mov      word ptr [bp - 0x12], ax
1:31F0  b8fe06         mov      ax, 0x6fe
1:31F3  50             push     ax
1:31F4  9a0c330000     lcall    0, 0x330c  ; INT:255:0022
1:31F9  5b             pop      bx
1:31FA  b80700         mov      ax, 7
1:31FD  50             push     ax
1:31FE  9a16330000     lcall    0, 0x3316  ; INT:255:001F
1:3203  5b             pop      bx
1:3204  b80607         mov      ax, 0x706
1:3207  8b560a         mov      dx, word ptr [bp + 0xa]
1:320A  8bf8           mov      di, ax
1:320C  8bf2           mov      si, dx
1:320E  1e             push     ds
1:320F  07             pop      es
1:3210  a5             movsw    word ptr es:[di], word ptr [si]
1:3211  a5             movsw    word ptr es:[di], word ptr [si]
1:3212  a5             movsw    word ptr es:[di], word ptr [si]
1:3213  a5             movsw    word ptr es:[di], word ptr [si]
1:3214  b80e07         mov      ax, 0x70e
1:3217  8bf8           mov      di, ax
1:3219  8bf2           mov      si, dx
1:321B  a5             movsw    word ptr es:[di], word ptr [si]
1:321C  a5             movsw    word ptr es:[di], word ptr [si]
1:321D  a5             movsw    word ptr es:[di], word ptr [si]
1:321E  a5             movsw    word ptr es:[di], word ptr [si]
1:321F  c746f00100     mov      word ptr [bp - 0x10], 1
1:3224  e9a200         jmp      0x32c9
1:3227  ff369208       push     word ptr [0x892]
1:322B  b80607         mov      ax, 0x706
1:322E  1e             push     ds
1:322F  50             push     ax
1:3230  ff36ac08       push     word ptr [0x8ac]
1:3234  9a29330000     lcall    0, 0x3329  ; USER.FrameRect
1:3239  a10c07         mov      ax, word ptr [0x70c]
1:323C  8946fa         mov      word ptr [bp - 6], ax
1:323F  a10a07         mov      ax, word ptr [0x70a]
1:3242  03060607       add      ax, word ptr [0x706]
1:3246  99             cdq      
1:3247  2bc2           sub      ax, dx
1:3249  d1f8           sar      ax, 1
1:324B  8946fc         mov      word ptr [bp - 4], ax
1:324E  b80e07         mov      ax, 0x70e
1:3251  1e             push     ds
1:3252  50             push     ax
1:3253  8b460e         mov      ax, word ptr [bp + 0xe]
1:3256  f7d8           neg      ax
1:3258  50             push     ax
1:3259  50             push     ax
1:325A  9a5a330000     lcall    0, 0x335a  ; USER.InflateRect
1:325F  a11407         mov      ax, word ptr [0x714]
1:3262  8b4e08         mov      cx, word ptr [bp + 8]
1:3265  294efc         sub      word ptr [bp - 4], cx
1:3268  8b5606         mov      dx, word ptr [bp + 6]
1:326B  2956fa         sub      word ptr [bp - 6], dx
1:326E  8b1e1207       mov      bx, word ptr [0x712]
1:3272  2bd9           sub      bx, cx
1:3274  895ef4         mov      word ptr [bp - 0xc], bx
1:3277  2bc2           sub      ax, dx
1:3279  8946f2         mov      word ptr [bp - 0xe], ax
1:327C  837eee00       cmp      word ptr [bp - 0x12], 0
1:3280  742b           je       0x32ad
1:3282  f7da           neg      dx
1:3284  52             push     dx
1:3285  f7d9           neg      cx
1:3287  51             push     cx
1:3288  9aa7320000     lcall    0, 0x32a7  ; INT:255:0011
1:328D  5b             pop      bx
1:328E  5b             pop      bx
1:328F  ff76f4         push     word ptr [bp - 0xc]
1:3292  ff76f2         push     word ptr [bp - 0xe]
1:3295  ff76fc         push     word ptr [bp - 4]
1:3298  ff76fa         push     word ptr [bp - 6]
1:329B  0e             push     cs
1:329C  e80001         call     0x339f
1:329F  83c408         add      sp, 8
1:32A2  2bc0           sub      ax, ax
1:32A4  50             push     ax
1:32A5  50             push     ax
1:32A6  9a40260000     lcall    0, 0x2640  ; INT:255:0011
1:32AB  5b             pop      bx
1:32AC  5b             pop      bx
1:32AD  ff46f0         inc      word ptr [bp - 0x10]
1:32B0  b80607         mov      ax, 0x706
1:32B3  8bf8           mov      di, ax
1:32B5  be0e07         mov      si, 0x70e
1:32B8  1e             push     ds
1:32B9  07             pop      es
1:32BA  a5             movsw    word ptr es:[di], word ptr [si]
1:32BB  a5             movsw    word ptr es:[di], word ptr [si]
1:32BC  a5             movsw    word ptr es:[di], word ptr [si]
1:32BD  a5             movsw    word ptr es:[di], word ptr [si]
1:32BE  8d7ee6         lea      di, [bp - 0x1a]
1:32C1  8bf0           mov      si, ax
1:32C3  16             push     ss
1:32C4  07             pop      es
1:32C5  a5             movsw    word ptr es:[di], word ptr [si]
1:32C6  a5             movsw    word ptr es:[di], word ptr [si]
1:32C7  a5             movsw    word ptr es:[di], word ptr [si]
1:32C8  a5             movsw    word ptr es:[di], word ptr [si]
1:32C9  8b460c         mov      ax, word ptr [bp + 0xc]
1:32CC  3946f0         cmp      word ptr [bp - 0x10], ax
1:32CF  7f03           jg       0x32d4
1:32D1  e953ff         jmp      0x3227
1:32D4  b8fe06         mov      ax, 0x6fe
1:32D7  50             push     ax
1:32D8  9a90330000     lcall    0, 0x3390  ; INT:255:0024
1:32DD  5b             pop      bx
1:32DE  5e             pop      si
1:32DF  5f             pop      di
1:32E0  4d             dec      bp
1:32E1  4d             dec      bp
1:32E2  8be5           mov      sp, bp
1:32E4  1f             pop      ds
1:32E5  5d             pop      bp
1:32E6  4d             dec      bp
1:32E7  cb             retf     

; ===== FN 1:32E8..339F =====
1:32E8  1e             push     ds
1:32E9  58             pop      ax
1:32EA  90             nop      
1:32EB  45             inc      bp
1:32EC  55             push     bp
1:32ED  8bec           mov      bp, sp
1:32EF  1e             push     ds
1:32F0  8ed8           mov      ds, ax
1:32F2  83ec0a         sub      sp, 0xa
1:32F5  57             push     di
1:32F6  56             push     si
1:32F7  b81e07         mov      ax, 0x71e
1:32FA  8b5606         mov      dx, word ptr [bp + 6]
1:32FD  8bf8           mov      di, ax
1:32FF  8bf2           mov      si, dx
1:3301  1e             push     ds
1:3302  07             pop      es
1:3303  a5             movsw    word ptr es:[di], word ptr [si]
1:3304  a5             movsw    word ptr es:[di], word ptr [si]
1:3305  a5             movsw    word ptr es:[di], word ptr [si]
1:3306  a5             movsw    word ptr es:[di], word ptr [si]
1:3307  b91607         mov      cx, 0x716
1:330A  51             push     cx
1:330B  9ab3330000     lcall    0, 0x33b3  ; INT:255:0022
1:3310  5b             pop      bx
1:3311  b80700         mov      ax, 7
1:3314  50             push     ax
1:3315  9abd330000     lcall    0, 0x33bd  ; INT:255:001F
1:331A  5b             pop      bx
1:331B  ff369208       push     word ptr [0x892]
1:331F  b81e07         mov      ax, 0x71e
1:3322  1e             push     ds
1:3323  50             push     ax
1:3324  ff36ac08       push     word ptr [0x8ac]
1:3328  9a6c330000     lcall    0, 0x336c  ; USER.FrameRect
1:332D  b81e07         mov      ax, 0x71e
1:3330  50             push     ax
1:3331  9a86330000     lcall    0, 0x3386  ; INT:255:0027
1:3336  5b             pop      bx
1:3337  8b5e06         mov      bx, word ptr [bp + 6]
1:333A  8b07           mov      ax, word ptr [bx]
1:333C  2b4704         sub      ax, word ptr [bx + 4]
1:333F  99             cdq      
1:3340  33c2           xor      ax, dx
1:3342  2bc2           sub      ax, dx
1:3344  b90200         mov      cx, 2
1:3347  d3f8           sar      ax, cl
1:3349  33c2           xor      ax, dx
1:334B  2bc2           sub      ax, dx
1:334D  8946fa         mov      word ptr [bp - 6], ax
1:3350  b91e07         mov      cx, 0x71e
1:3353  1e             push     ds
1:3354  51             push     cx
1:3355  f7d8           neg      ax
1:3357  50             push     ax
1:3358  50             push     ax
1:3359  9a7d330000     lcall    0, 0x337d  ; USER.InflateRect
1:335E  ff369208       push     word ptr [0x892]
1:3362  b81e07         mov      ax, 0x71e
1:3365  1e             push     ds
1:3366  50             push     ax
1:3367  ff36ac08       push     word ptr [0x8ac]
1:336B  9a9b2d0000     lcall    0, 0x2d9b  ; USER.FrameRect
1:3370  b81e07         mov      ax, 0x71e
1:3373  1e             push     ds
1:3374  50             push     ax
1:3375  8b46fa         mov      ax, word ptr [bp - 6]
1:3378  f7d8           neg      ax
1:337A  50             push     ax
1:337B  50             push     ax
1:337C  9a321d0000     lcall    0, 0x1d32  ; USER.InflateRect
1:3381  b81e07         mov      ax, 0x71e
1:3384  50             push     ax
1:3385  9aa62d0000     lcall    0, 0x2da6  ; INT:255:0027
1:338A  5b             pop      bx
1:338B  b81607         mov      ax, 0x716
1:338E  50             push     ax
1:338F  9acf340000     lcall    0, 0x34cf  ; INT:255:0024
1:3394  5b             pop      bx
1:3395  5e             pop      si
1:3396  5f             pop      di
1:3397  4d             dec      bp
1:3398  4d             dec      bp
1:3399  8be5           mov      sp, bp
1:339B  1f             pop      ds
1:339C  5d             pop      bp
1:339D  4d             dec      bp
1:339E  cb             retf     

; ===== FN 1:339F..34DE =====
1:339F  1e             push     ds
1:33A0  58             pop      ax
1:33A1  90             nop      
1:33A2  45             inc      bp
1:33A3  55             push     bp
1:33A4  8bec           mov      bp, sp
1:33A6  1e             push     ds
1:33A7  8ed8           mov      ds, ax
1:33A9  83ec26         sub      sp, 0x26
1:33AC  57             push     di
1:33AD  56             push     si
1:33AE  b82607         mov      ax, 0x726
1:33B1  50             push     ax
1:33B2  9a9e2e0000     lcall    0, 0x2e9e  ; INT:255:0022
1:33B7  5b             pop      bx
1:33B8  b80700         mov      ax, 7
1:33BB  50             push     ax
1:33BC  9a75260000     lcall    0, 0x2675  ; INT:255:001F
1:33C1  5b             pop      bx
1:33C2  8b4608         mov      ax, word ptr [bp + 8]
1:33C5  8b560c         mov      dx, word ptr [bp + 0xc]
1:33C8  8b5e06         mov      bx, word ptr [bp + 6]
1:33CB  895efc         mov      word ptr [bp - 4], bx
1:33CE  f7d8           neg      ax
1:33D0  f7da           neg      dx
1:33D2  ff369208       push     word ptr [0x892]
1:33D6  ff7608         push     word ptr [bp + 8]
1:33D9  53             push     bx
1:33DA  8bf0           mov      si, ax
1:33DC  8bfa           mov      di, dx
1:33DE  9a01340000     lcall    0, 0x3401  ; GDI.MoveTo
1:33E3  ff369208       push     word ptr [0x892]
1:33E7  ff760c         push     word ptr [bp + 0xc]
1:33EA  ff760a         push     word ptr [bp + 0xa]
1:33ED  9a14340000     lcall    0, 0x3414  ; GDI.LineTo
1:33F2  ff369208       push     word ptr [0x892]
1:33F6  56             push     si
1:33F7  8b46fc         mov      ax, word ptr [bp - 4]
1:33FA  f7d8           neg      ax
1:33FC  50             push     ax
1:33FD  8946e0         mov      word ptr [bp - 0x20], ax
1:3400  9a23340000     lcall    0, 0x3423  ; GDI.MoveTo
1:3405  ff369208       push     word ptr [0x892]
1:3409  57             push     di
1:340A  8b460a         mov      ax, word ptr [bp + 0xa]
1:340D  f7d8           neg      ax
1:340F  50             push     ax
1:3410  8946de         mov      word ptr [bp - 0x22], ax
1:3413  9a32340000     lcall    0, 0x3432  ; GDI.LineTo
1:3418  ff369208       push     word ptr [0x892]
1:341C  ff76fc         push     word ptr [bp - 4]
1:341F  ff7608         push     word ptr [bp + 8]
1:3422  9a3f340000     lcall    0, 0x343f  ; GDI.MoveTo
1:3427  ff369208       push     word ptr [0x892]
1:342B  ff760a         push     word ptr [bp + 0xa]
1:342E  ff760c         push     word ptr [bp + 0xc]
1:3431  9a4c340000     lcall    0, 0x344c  ; GDI.LineTo
1:3436  ff369208       push     word ptr [0x892]
1:343A  ff76e0         push     word ptr [bp - 0x20]
1:343D  56             push     si
1:343E  9a59340000     lcall    0, 0x3459  ; GDI.MoveTo
1:3443  ff369208       push     word ptr [0x892]
1:3447  ff76de         push     word ptr [bp - 0x22]
1:344A  57             push     di
1:344B  9a66340000     lcall    0, 0x3466  ; GDI.LineTo
1:3450  ff369208       push     word ptr [0x892]
1:3454  ff76fc         push     word ptr [bp - 4]
1:3457  56             push     si
1:3458  9a7a340000     lcall    0, 0x347a  ; GDI.MoveTo
1:345D  ff369208       push     word ptr [0x892]
1:3461  ff760a         push     word ptr [bp + 0xa]
1:3464  57             push     di
1:3465  9a8e340000     lcall    0, 0x348e  ; GDI.LineTo
1:346A  ff369208       push     word ptr [0x892]
1:346E  ff76e0         push     word ptr [bp - 0x20]
1:3471  8bc6           mov      ax, si
1:3473  f7de           neg      si
1:3475  56             push     si
1:3476  8946dc         mov      word ptr [bp - 0x24], ax
1:3479  9a9d340000     lcall    0, 0x349d  ; GDI.MoveTo
1:347E  ff369208       push     word ptr [0x892]
1:3482  ff76de         push     word ptr [bp - 0x22]
1:3485  8bc7           mov      ax, di
1:3487  f7df           neg      di
1:3489  57             push     di
1:348A  8946da         mov      word ptr [bp - 0x26], ax
1:348D  9aac340000     lcall    0, 0x34ac  ; GDI.LineTo
1:3492  ff369208       push     word ptr [0x892]
1:3496  ff76dc         push     word ptr [bp - 0x24]
1:3499  ff76fc         push     word ptr [bp - 4]
1:349C  9ab9340000     lcall    0, 0x34b9  ; GDI.MoveTo
1:34A1  ff369208       push     word ptr [0x892]
1:34A5  ff76da         push     word ptr [bp - 0x26]
1:34A8  ff760a         push     word ptr [bp + 0xa]
1:34AB  9ac6340000     lcall    0, 0x34c6  ; GDI.LineTo
1:34B0  ff369208       push     word ptr [0x892]
1:34B4  56             push     si
1:34B5  ff76e0         push     word ptr [bp - 0x20]
1:34B8  9affff0000     lcall    0, 0xffff  ; GDI.MoveTo
1:34BD  ff369208       push     word ptr [0x892]
1:34C1  57             push     di
1:34C2  ff76de         push     word ptr [bp - 0x22]
1:34C5  9affff0000     lcall    0, 0xffff  ; GDI.LineTo
1:34CA  b82607         mov      ax, 0x726
1:34CD  50             push     ax
1:34CE  9adb300000     lcall    0, 0x30db  ; INT:255:0024
1:34D3  5b             pop      bx
1:34D4  5e             pop      si
1:34D5  5f             pop      di
1:34D6  4d             dec      bp
1:34D7  4d             dec      bp
1:34D8  8be5           mov      sp, bp
1:34DA  1f             pop      ds
1:34DB  5d             pop      bp
1:34DC  4d             dec      bp
1:34DD  cb             retf     

; ===== FN 1:34DE..35F3 =====
1:34DE  1e             push     ds
1:34DF  58             pop      ax
1:34E0  90             nop      
1:34E1  45             inc      bp
1:34E2  55             push     bp
1:34E3  8bec           mov      bp, sp
1:34E5  1e             push     ds
1:34E6  8ed8           mov      ds, ax
1:34E8  b80100         mov      ax, 1
1:34EB  50             push     ax
1:34EC  9a43350000     lcall    0, 0x3543  ; INT:255:0007
1:34F1  5b             pop      bx
1:34F2  0bc0           or       ax, ax
1:34F4  741c           je       0x3512
1:34F6  b80100         mov      ax, 1
1:34F9  50             push     ax
1:34FA  9a0c350000     lcall    0, 0x350c  ; INT:255:0009
1:34FF  5b             pop      bx
1:3500  ff7606         push     word ptr [bp + 6]
1:3503  0e             push     cs
1:3504  e81b00         call     0x3522
1:3507  5b             pop      bx
1:3508  2bc0           sub      ax, ax
1:350A  50             push     ax
1:350B  9a51350000     lcall    0, 0x3551  ; INT:255:0009
1:3510  eb07           jmp      0x3519
1:3512  ff7606         push     word ptr [bp + 6]
1:3515  0e             push     cs
1:3516  e80900         call     0x3522
1:3519  5b             pop      bx
1:351A  4d             dec      bp
1:351B  4d             dec      bp
1:351C  8be5           mov      sp, bp
1:351E  1f             pop      ds
1:351F  5d             pop      bp
1:3520  4d             dec      bp
1:3521  cb             retf     
1:3522  1e             push     ds
1:3523  58             pop      ax
1:3524  90             nop      
1:3525  45             inc      bp
1:3526  55             push     bp
1:3527  8bec           mov      bp, sp
1:3529  1e             push     ds
1:352A  8ed8           mov      ds, ax
1:352C  57             push     di
1:352D  56             push     si
1:352E  b83e07         mov      ax, 0x73e
1:3531  8b5606         mov      dx, word ptr [bp + 6]
1:3534  8bf8           mov      di, ax
1:3536  8bf2           mov      si, dx
1:3538  1e             push     ds
1:3539  07             pop      es
1:353A  a5             movsw    word ptr es:[di], word ptr [si]
1:353B  a5             movsw    word ptr es:[di], word ptr [si]
1:353C  a5             movsw    word ptr es:[di], word ptr [si]
1:353D  a5             movsw    word ptr es:[di], word ptr [si]
1:353E  b90100         mov      cx, 1
1:3541  51             push     cx
1:3542  9ae8310000     lcall    0, 0x31e8  ; INT:255:0007
1:3547  5b             pop      bx
1:3548  0bc0           or       ax, ax
1:354A  7459           je       0x35a5
1:354C  b80100         mov      ax, 1
1:354F  50             push     ax
1:3550  9a9e350000     lcall    0, 0x359e  ; INT:255:0009
1:3555  5b             pop      bx
1:3556  ff369208       push     word ptr [0x892]
1:355A  ff364207       push     word ptr [0x742]
1:355E  ff364007       push     word ptr [0x740]
1:3562  9a85350000     lcall    0, 0x3585  ; GDI.MoveTo
1:3567  ff369208       push     word ptr [0x892]
1:356B  ff363e07       push     word ptr [0x73e]
1:356F  ff364407       push     word ptr [0x744]
1:3573  9a96350000     lcall    0, 0x3596  ; GDI.LineTo
1:3578  ff369208       push     word ptr [0x892]
1:357C  ff363e07       push     word ptr [0x73e]
1:3580  ff364007       push     word ptr [0x740]
1:3584  9ab2350000     lcall    0, 0x35b2  ; GDI.MoveTo
1:3589  ff369208       push     word ptr [0x892]
1:358D  ff364207       push     word ptr [0x742]
1:3591  ff364407       push     word ptr [0x744]
1:3595  9ac3350000     lcall    0, 0x35c3  ; GDI.LineTo
1:359A  2bc0           sub      ax, ax
1:359C  50             push     ax
1:359D  9a2e250000     lcall    0, 0x252e  ; INT:255:0009
1:35A2  5b             pop      bx
1:35A3  eb44           jmp      0x35e9
1:35A5  ff369208       push     word ptr [0x892]
1:35A9  ff364207       push     word ptr [0x742]
1:35AD  ff364007       push     word ptr [0x740]
1:35B1  9ad4350000     lcall    0, 0x35d4  ; GDI.MoveTo
1:35B6  ff369208       push     word ptr [0x892]
1:35BA  ff363e07       push     word ptr [0x73e]
1:35BE  ff364407       push     word ptr [0x744]
1:35C2  9ae5350000     lcall    0, 0x35e5  ; GDI.LineTo
1:35C7  ff369208       push     word ptr [0x892]
1:35CB  ff363e07       push     word ptr [0x73e]
1:35CF  ff364007       push     word ptr [0x740]
1:35D3  9a3c360000     lcall    0, 0x363c  ; GDI.MoveTo
1:35D8  ff369208       push     word ptr [0x892]
1:35DC  ff364207       push     word ptr [0x742]
1:35E0  ff364407       push     word ptr [0x744]
1:35E4  9a4d360000     lcall    0, 0x364d  ; GDI.LineTo
1:35E9  5e             pop      si
1:35EA  5f             pop      di
1:35EB  4d             dec      bp
1:35EC  4d             dec      bp
1:35ED  8be5           mov      sp, bp
1:35EF  1f             pop      ds
1:35F0  5d             pop      bp
1:35F1  4d             dec      bp
1:35F2  cb             retf     

; ===== FN 1:35F3..37C6 =====
1:35F3  1e             push     ds
1:35F4  58             pop      ax
1:35F5  90             nop      
1:35F6  45             inc      bp
1:35F7  55             push     bp
1:35F8  8bec           mov      bp, sp
1:35FA  1e             push     ds
1:35FB  8ed8           mov      ds, ax
1:35FD  57             push     di
1:35FE  56             push     si
1:35FF  b84e07         mov      ax, 0x74e
1:3602  8b5606         mov      dx, word ptr [bp + 6]
1:3605  8bf8           mov      di, ax
1:3607  8bf2           mov      si, dx
1:3609  1e             push     ds
1:360A  07             pop      es
1:360B  a5             movsw    word ptr es:[di], word ptr [si]
1:360C  a5             movsw    word ptr es:[di], word ptr [si]
1:360D  a5             movsw    word ptr es:[di], word ptr [si]
1:360E  a5             movsw    word ptr es:[di], word ptr [si]
1:360F  1e             push     ds
1:3610  50             push     ax
1:3611  b9ffff         mov      cx, 0xffff
1:3614  51             push     cx
1:3615  51             push     cx
1:3616  9a5b320000     lcall    0, 0x325b  ; USER.InflateRect
1:361B  b84607         mov      ax, 0x746
1:361E  50             push     ax
1:361F  9aa8360000     lcall    0, 0x36a8  ; INT:255:0022
1:3624  5b             pop      bx
1:3625  b80700         mov      ax, 7
1:3628  50             push     ax
1:3629  9ab2360000     lcall    0, 0x36b2  ; INT:255:001F
1:362E  5b             pop      bx
1:362F  ff369208       push     word ptr [0x892]
1:3633  ff365207       push     word ptr [0x752]
1:3637  ff365007       push     word ptr [0x750]
1:363B  9a5e360000     lcall    0, 0x365e  ; GDI.MoveTo
1:3640  ff369208       push     word ptr [0x892]
1:3644  ff364e07       push     word ptr [0x74e]
1:3648  ff365407       push     word ptr [0x754]
1:364C  9a6f360000     lcall    0, 0x366f  ; GDI.LineTo
1:3651  ff369208       push     word ptr [0x892]
1:3655  ff364e07       push     word ptr [0x74e]
1:3659  ff365007       push     word ptr [0x750]
1:365D  9ac3360000     lcall    0, 0x36c3  ; GDI.MoveTo
1:3662  ff369208       push     word ptr [0x892]
1:3666  ff365207       push     word ptr [0x752]
1:366A  ff365407       push     word ptr [0x754]
1:366E  9ad3360000     lcall    0, 0x36d3  ; GDI.LineTo
1:3673  b84607         mov      ax, 0x746
1:3676  50             push     ax
1:3677  9afc360000     lcall    0, 0x36fc  ; INT:255:0024
1:367C  5b             pop      bx
1:367D  5e             pop      si
1:367E  5f             pop      di
1:367F  4d             dec      bp
1:3680  4d             dec      bp
1:3681  8be5           mov      sp, bp
1:3683  1f             pop      ds
1:3684  5d             pop      bp
1:3685  4d             dec      bp
1:3686  cb             retf     
1:3687  1e             push     ds
1:3688  58             pop      ax
1:3689  90             nop      
1:368A  45             inc      bp
1:368B  55             push     bp
1:368C  8bec           mov      bp, sp
1:368E  1e             push     ds
1:368F  8ed8           mov      ds, ax
1:3691  57             push     di
1:3692  56             push     si
1:3693  b85e07         mov      ax, 0x75e
1:3696  8b5606         mov      dx, word ptr [bp + 6]
1:3699  8bf8           mov      di, ax
1:369B  8bf2           mov      si, dx
1:369D  1e             push     ds
1:369E  07             pop      es
1:369F  a5             movsw    word ptr es:[di], word ptr [si]
1:36A0  a5             movsw    word ptr es:[di], word ptr [si]
1:36A1  a5             movsw    word ptr es:[di], word ptr [si]
1:36A2  a5             movsw    word ptr es:[di], word ptr [si]
1:36A3  b85607         mov      ax, 0x756
1:36A6  50             push     ax
1:36A7  9a2f370000     lcall    0, 0x372f  ; INT:255:0022
1:36AC  5b             pop      bx
1:36AD  b80700         mov      ax, 7
1:36B0  50             push     ax
1:36B1  9a39370000     lcall    0, 0x3739  ; INT:255:001F
1:36B6  5b             pop      bx
1:36B7  ff369208       push     word ptr [0x892]
1:36BB  2bc0           sub      ax, ax
1:36BD  50             push     ax
1:36BE  b938ff         mov      cx, 0xff38
1:36C1  51             push     cx
1:36C2  9ae3360000     lcall    0, 0x36e3  ; GDI.MoveTo
1:36C7  ff369208       push     word ptr [0x892]
1:36CB  2bc0           sub      ax, ax
1:36CD  50             push     ax
1:36CE  b9c800         mov      cx, 0xc8
1:36D1  51             push     cx
1:36D2  9af3360000     lcall    0, 0x36f3  ; GDI.LineTo
1:36D7  ff369208       push     word ptr [0x892]
1:36DB  b838ff         mov      ax, 0xff38
1:36DE  50             push     ax
1:36DF  2bc0           sub      ax, ax
1:36E1  50             push     ax
1:36E2  9a81370000     lcall    0, 0x3781  ; GDI.MoveTo
1:36E7  ff369208       push     word ptr [0x892]
1:36EB  b8c800         mov      ax, 0xc8
1:36EE  50             push     ax
1:36EF  2bc0           sub      ax, ax
1:36F1  50             push     ax
1:36F2  9a90370000     lcall    0, 0x3790  ; GDI.LineTo
1:36F7  b85607         mov      ax, 0x756
1:36FA  50             push     ax
1:36FB  9ab7370000     lcall    0, 0x37b7  ; INT:255:0024
1:3700  5b             pop      bx
1:3701  5e             pop      si
1:3702  5f             pop      di
1:3703  4d             dec      bp
1:3704  4d             dec      bp
1:3705  8be5           mov      sp, bp
1:3707  1f             pop      ds
1:3708  5d             pop      bp
1:3709  4d             dec      bp
1:370A  cb             retf     
1:370B  1e             push     ds
1:370C  58             pop      ax
1:370D  90             nop      
1:370E  45             inc      bp
1:370F  55             push     bp
1:3710  8bec           mov      bp, sp
1:3712  1e             push     ds
1:3713  8ed8           mov      ds, ax
1:3715  83ec12         sub      sp, 0x12
1:3718  57             push     di
1:3719  56             push     si
1:371A  b86e07         mov      ax, 0x76e
1:371D  8b5606         mov      dx, word ptr [bp + 6]
1:3720  8bf8           mov      di, ax
1:3722  8bf2           mov      si, dx
1:3724  1e             push     ds
1:3725  07             pop      es
1:3726  a5             movsw    word ptr es:[di], word ptr [si]
1:3727  a5             movsw    word ptr es:[di], word ptr [si]
1:3728  a5             movsw    word ptr es:[di], word ptr [si]
1:3729  a5             movsw    word ptr es:[di], word ptr [si]
1:372A  b96607         mov      cx, 0x766
1:372D  51             push     cx
1:372E  9aea370000     lcall    0, 0x37ea  ; INT:255:0022
1:3733  5b             pop      bx
1:3734  b80700         mov      ax, 7
1:3737  50             push     ax
1:3738  9af4370000     lcall    0, 0x37f4  ; INT:255:001F
1:373D  5b             pop      bx
1:373E  a17207         mov      ax, word ptr [0x772]
1:3741  03066e07       add      ax, word ptr [0x76e]
1:3745  99             cdq      
1:3746  2bc2           sub      ax, dx
1:3748  d1f8           sar      ax, 1
1:374A  8946fc         mov      word ptr [bp - 4], ax
1:374D  8946f4         mov      word ptr [bp - 0xc], ax
1:3750  8b0e7407       mov      cx, word ptr [0x774]
1:3754  894ef2         mov      word ptr [bp - 0xe], cx
1:3757  8b167207       mov      dx, word ptr [0x772]
1:375B  8956f8         mov      word ptr [bp - 8], dx
1:375E  a17007         mov      ax, word ptr [0x770]
1:3761  03c1           add      ax, cx
1:3763  99             cdq      
1:3764  2bc2           sub      ax, dx
1:3766  d1f8           sar      ax, 1
1:3768  8946f6         mov      word ptr [bp - 0xa], ax
1:376B  8b0e6e07       mov      cx, word ptr [0x76e]
1:376F  894ef0         mov      word ptr [bp - 0x10], cx
1:3772  8946ee         mov      word ptr [bp - 0x12], ax
1:3775  ff369208       push     word ptr [0x892]
1:3779  ff76fc         push     word ptr [bp - 4]
1:377C  ff367007       push     word ptr [0x770]
1:3780  9a9f370000     lcall    0, 0x379f  ; GDI.MoveTo
1:3785  ff369208       push     word ptr [0x892]
1:3789  ff76f4         push     word ptr [bp - 0xc]
1:378C  ff76f2         push     word ptr [bp - 0xe]
1:378F  9aae370000     lcall    0, 0x37ae  ; GDI.LineTo
1:3794  ff369208       push     word ptr [0x892]
1:3798  ff76f8         push     word ptr [bp - 8]
1:379B  ff76f6         push     word ptr [bp - 0xa]
1:379E  9a3f380000     lcall    0, 0x383f  ; GDI.MoveTo
1:37A3  ff369208       push     word ptr [0x892]
1:37A7  ff76f0         push     word ptr [bp - 0x10]
1:37AA  ff76ee         push     word ptr [bp - 0x12]
1:37AD  9a4e380000     lcall    0, 0x384e  ; GDI.LineTo
1:37B2  b86607         mov      ax, 0x766
1:37B5  50             push     ax
1:37B6  9ad9320000     lcall    0, 0x32d9  ; INT:255:0024
1:37BB  5b             pop      bx
1:37BC  5e             pop      si
1:37BD  5f             pop      di
1:37BE  4d             dec      bp
1:37BF  4d             dec      bp
1:37C0  8be5           mov      sp, bp
1:37C2  1f             pop      ds
1:37C3  5d             pop      bp
1:37C4  4d             dec      bp
1:37C5  cb             retf     

; ===== FN 1:37C6..38C0 =====
1:37C6  1e             push     ds
1:37C7  58             pop      ax
1:37C8  90             nop      
1:37C9  45             inc      bp
1:37CA  55             push     bp
1:37CB  8bec           mov      bp, sp
1:37CD  1e             push     ds
1:37CE  8ed8           mov      ds, ax
1:37D0  83ec14         sub      sp, 0x14
1:37D3  57             push     di
1:37D4  56             push     si
1:37D5  b87e07         mov      ax, 0x77e
1:37D8  8b5606         mov      dx, word ptr [bp + 6]
1:37DB  8bf8           mov      di, ax
1:37DD  8bf2           mov      si, dx
1:37DF  1e             push     ds
1:37E0  07             pop      es
1:37E1  a5             movsw    word ptr es:[di], word ptr [si]
1:37E2  a5             movsw    word ptr es:[di], word ptr [si]
1:37E3  a5             movsw    word ptr es:[di], word ptr [si]
1:37E4  a5             movsw    word ptr es:[di], word ptr [si]
1:37E5  b97607         mov      cx, 0x776
1:37E8  51             push     cx
1:37E9  9af5310000     lcall    0, 0x31f5  ; INT:255:0022
1:37EE  5b             pop      bx
1:37EF  b80700         mov      ax, 7
1:37F2  50             push     ax
1:37F3  9aff310000     lcall    0, 0x31ff  ; INT:255:001F
1:37F8  5b             pop      bx
1:37F9  a18207         mov      ax, word ptr [0x782]
1:37FC  03067e07       add      ax, word ptr [0x77e]
1:3800  99             cdq      
1:3801  2bc2           sub      ax, dx
1:3803  d1f8           sar      ax, 1
1:3805  8946fc         mov      word ptr [bp - 4], ax
1:3808  8b0e8007       mov      cx, word ptr [0x780]
1:380C  894efa         mov      word ptr [bp - 6], cx
1:380F  8946f4         mov      word ptr [bp - 0xc], ax
1:3812  8b168407       mov      dx, word ptr [0x784]
1:3816  8956f2         mov      word ptr [bp - 0xe], dx
1:3819  8b1e8207       mov      bx, word ptr [0x782]
1:381D  895ef8         mov      word ptr [bp - 8], bx
1:3820  8bd8           mov      bx, ax
1:3822  8bc1           mov      ax, cx
1:3824  03c2           add      ax, dx
1:3826  99             cdq      
1:3827  2bc2           sub      ax, dx
1:3829  d1f8           sar      ax, 1
1:382B  8946f6         mov      word ptr [bp - 0xa], ax
1:382E  8b167e07       mov      dx, word ptr [0x77e]
1:3832  8956f0         mov      word ptr [bp - 0x10], dx
1:3835  8946ee         mov      word ptr [bp - 0x12], ax
1:3838  ff369208       push     word ptr [0x892]
1:383C  53             push     bx
1:383D  51             push     cx
1:383E  9a5d380000     lcall    0, 0x385d  ; GDI.MoveTo
1:3843  ff369208       push     word ptr [0x892]
1:3847  ff76f8         push     word ptr [bp - 8]
1:384A  ff76f6         push     word ptr [bp - 0xa]
1:384D  9a6c380000     lcall    0, 0x386c  ; GDI.LineTo
1:3852  ff369208       push     word ptr [0x892]
1:3856  ff76f8         push     word ptr [bp - 8]
1:3859  ff76f6         push     word ptr [bp - 0xa]
1:385C  9a7b380000     lcall    0, 0x387b  ; GDI.MoveTo
1:3861  ff369208       push     word ptr [0x892]
1:3865  ff76f4         push     word ptr [bp - 0xc]
1:3868  ff76f2         push     word ptr [bp - 0xe]
1:386B  9a8a380000     lcall    0, 0x388a  ; GDI.LineTo
1:3870  ff369208       push     word ptr [0x892]
1:3874  ff76f4         push     word ptr [bp - 0xc]
1:3877  ff76f2         push     word ptr [bp - 0xe]
1:387A  9adf330000     lcall    0, 0x33df  ; GDI.MoveTo
1:387F  ff369208       push     word ptr [0x892]
1:3883  ff76f0         push     word ptr [bp - 0x10]
1:3886  ff76ee         push     word ptr [bp - 0x12]
1:3889  9aee330000     lcall    0, 0x33ee  ; GDI.LineTo
1:388E  ff369208       push     word ptr [0x892]
1:3892  ff76f0         push     word ptr [bp - 0x10]
1:3895  ff76ee         push     word ptr [bp - 0x12]
1:3898  9a63350000     lcall    0, 0x3563  ; GDI.MoveTo
1:389D  ff369208       push     word ptr [0x892]
1:38A1  ff76fc         push     word ptr [bp - 4]
1:38A4  ff76fa         push     word ptr [bp - 6]
1:38A7  9a74350000     lcall    0, 0x3574  ; GDI.LineTo
1:38AC  b87607         mov      ax, 0x776
1:38AF  50             push     ax
1:38B0  9a78360000     lcall    0, 0x3678  ; INT:255:0024
1:38B5  5b             pop      bx
1:38B6  5e             pop      si
1:38B7  5f             pop      di
1:38B8  4d             dec      bp
1:38B9  4d             dec      bp
1:38BA  8be5           mov      sp, bp
1:38BC  1f             pop      ds
1:38BD  5d             pop      bp
1:38BE  4d             dec      bp
1:38BF  cb             retf     

; ===== FN 1:38C0..3958 =====
1:38C0  1e             push     ds
1:38C1  58             pop      ax
1:38C2  90             nop      
1:38C3  45             inc      bp
1:38C4  55             push     bp
1:38C5  8bec           mov      bp, sp
1:38C7  1e             push     ds
1:38C8  8ed8           mov      ds, ax
1:38CA  57             push     di
1:38CB  56             push     si
1:38CC  b88607         mov      ax, 0x786
1:38CF  8b5606         mov      dx, word ptr [bp + 6]
1:38D2  8bf8           mov      di, ax
1:38D4  8bf2           mov      si, dx
1:38D6  1e             push     ds
1:38D7  07             pop      es
1:38D8  a5             movsw    word ptr es:[di], word ptr [si]
1:38D9  a5             movsw    word ptr es:[di], word ptr [si]
1:38DA  a5             movsw    word ptr es:[di], word ptr [si]
1:38DB  a5             movsw    word ptr es:[di], word ptr [si]
1:38DC  b80100         mov      ax, 1
1:38DF  50             push     ax
1:38E0  9a15390000     lcall    0, 0x3915  ; INT:255:0007
1:38E5  5b             pop      bx
1:38E6  0bc0           or       ax, ax
1:38E8  741d           je       0x3907
1:38EA  b80100         mov      ax, 1
1:38ED  50             push     ax
1:38EE  9a01390000     lcall    0, 0x3901  ; INT:255:0009
1:38F3  5b             pop      bx
1:38F4  ff7606         push     word ptr [bp + 6]
1:38F7  9a0b390000     lcall    0, 0x390b  ; INT:255:002C
1:38FC  5b             pop      bx
1:38FD  2bc0           sub      ax, ax
1:38FF  50             push     ax
1:3900  9afb340000     lcall    0, 0x34fb  ; INT:255:0009
1:3905  eb08           jmp      0x390f
1:3907  ff7606         push     word ptr [bp + 6]
1:390A  9affff0000     lcall    0, 0xffff  ; INT:255:002C
1:390F  5b             pop      bx
1:3910  b80100         mov      ax, 1
1:3913  50             push     ax
1:3914  9a3b390000     lcall    0, 0x393b  ; INT:255:0007
1:3919  5b             pop      bx
1:391A  0bc0           or       ax, ax
1:391C  7430           je       0x394e
1:391E  ff7606         push     word ptr [bp + 6]
1:3921  9a49390000     lcall    0, 0x3949  ; INT:255:002B
1:3926  5b             pop      bx
1:3927  b88607         mov      ax, 0x786
1:392A  1e             push     ds
1:392B  50             push     ax
1:392C  b9f0ff         mov      cx, 0xfff0
1:392F  51             push     cx
1:3930  51             push     cx
1:3931  9a17360000     lcall    0, 0x3617  ; USER.InflateRect
1:3936  b80100         mov      ax, 1
1:3939  50             push     ax
1:393A  9a77390000     lcall    0, 0x3977  ; INT:255:0007
1:393F  5b             pop      bx
1:3940  0bc0           or       ax, ax
1:3942  740a           je       0x394e
1:3944  b88607         mov      ax, 0x786
1:3947  50             push     ax
1:3948  9affff0000     lcall    0, 0xffff  ; INT:255:002B
1:394D  5b             pop      bx
1:394E  5e             pop      si
1:394F  5f             pop      di
1:3950  4d             dec      bp
1:3951  4d             dec      bp
1:3952  8be5           mov      sp, bp
1:3954  1f             pop      ds
1:3955  5d             pop      bp
1:3956  4d             dec      bp
1:3957  cb             retf     

; ===== FN 1:3958..3B0A =====
1:3958  1e             push     ds
1:3959  58             pop      ax
1:395A  90             nop      
1:395B  45             inc      bp
1:395C  55             push     bp
1:395D  8bec           mov      bp, sp
1:395F  1e             push     ds
1:3960  8ed8           mov      ds, ax
1:3962  83ec0c         sub      sp, 0xc
1:3965  57             push     di
1:3966  56             push     si
1:3967  8b5e06         mov      bx, word ptr [bp + 6]
1:396A  8b4704         mov      ax, word ptr [bx + 4]
1:396D  2b07           sub      ax, word ptr [bx]
1:396F  8946fc         mov      word ptr [bp - 4], ax
1:3972  b80800         mov      ax, 8
1:3975  50             push     ax
1:3976  9aed340000     lcall    0, 0x34ed  ; INT:255:0007
1:397B  5b             pop      bx
1:397C  48             dec      ax
1:397D  7505           jne      0x3984
1:397F  b80100         mov      ax, 1
1:3982  eb02           jmp      0x3986
1:3984  2bc0           sub      ax, ax
1:3986  8946f4         mov      word ptr [bp - 0xc], ax
1:3989  b89e07         mov      ax, 0x79e
1:398C  8b5606         mov      dx, word ptr [bp + 6]
1:398F  8bf8           mov      di, ax
1:3991  8bf2           mov      si, dx
1:3993  1e             push     ds
1:3994  07             pop      es
1:3995  a5             movsw    word ptr es:[di], word ptr [si]
1:3996  a5             movsw    word ptr es:[di], word ptr [si]
1:3997  a5             movsw    word ptr es:[di], word ptr [si]
1:3998  a5             movsw    word ptr es:[di], word ptr [si]
1:3999  1e             push     ds
1:399A  50             push     ax
1:399B  8b4efc         mov      cx, word ptr [bp - 4]
1:399E  f7d9           neg      cx
1:39A0  51             push     cx
1:39A1  51             push     cx
1:39A2  8bf1           mov      si, cx
1:39A4  9ab1390000     lcall    0, 0x39b1  ; USER.OffsetRect
1:39A9  b89e07         mov      ax, 0x79e
1:39AC  1e             push     ds
1:39AD  50             push     ax
1:39AE  56             push     si
1:39AF  56             push     si
1:39B0  9af0390000     lcall    0, 0x39f0  ; USER.OffsetRect
1:39B5  b88e07         mov      ax, 0x78e
1:39B8  8bf8           mov      di, ax
1:39BA  be9e07         mov      si, 0x79e
1:39BD  1e             push     ds
1:39BE  07             pop      es
1:39BF  a5             movsw    word ptr es:[di], word ptr [si]
1:39C0  a5             movsw    word ptr es:[di], word ptr [si]
1:39C1  a5             movsw    word ptr es:[di], word ptr [si]
1:39C2  a5             movsw    word ptr es:[di], word ptr [si]
1:39C3  baae07         mov      dx, 0x7ae
1:39C6  8bfa           mov      di, dx
1:39C8  8bf0           mov      si, ax
1:39CA  a5             movsw    word ptr es:[di], word ptr [si]
1:39CB  a5             movsw    word ptr es:[di], word ptr [si]
1:39CC  a5             movsw    word ptr es:[di], word ptr [si]
1:39CD  a5             movsw    word ptr es:[di], word ptr [si]
1:39CE  bba607         mov      bx, 0x7a6
1:39D1  8bfb           mov      di, bx
1:39D3  8bf2           mov      si, dx
1:39D5  a5             movsw    word ptr es:[di], word ptr [si]
1:39D6  a5             movsw    word ptr es:[di], word ptr [si]
1:39D7  a5             movsw    word ptr es:[di], word ptr [si]
1:39D8  a5             movsw    word ptr es:[di], word ptr [si]
1:39D9  ba9e07         mov      dx, 0x79e
1:39DC  8b5e06         mov      bx, word ptr [bp + 6]
1:39DF  8bfa           mov      di, dx
1:39E1  8bf3           mov      si, bx
1:39E3  a5             movsw    word ptr es:[di], word ptr [si]
1:39E4  a5             movsw    word ptr es:[di], word ptr [si]
1:39E5  a5             movsw    word ptr es:[di], word ptr [si]
1:39E6  a5             movsw    word ptr es:[di], word ptr [si]
1:39E7  1e             push     ds
1:39E8  52             push     dx
1:39E9  ff76fc         push     word ptr [bp - 4]
1:39EC  ff76fc         push     word ptr [bp - 4]
1:39EF  9a003a0000     lcall    0, 0x3a00  ; USER.OffsetRect
1:39F4  b89e07         mov      ax, 0x79e
1:39F7  1e             push     ds
1:39F8  50             push     ax
1:39F9  ff76fc         push     word ptr [bp - 4]
1:39FC  ff76fc         push     word ptr [bp - 4]
1:39FF  9a4f3a0000     lcall    0, 0x3a4f  ; USER.OffsetRect
1:3A04  b88e07         mov      ax, 0x78e
1:3A07  8bf8           mov      di, ax
1:3A09  be9e07         mov      si, 0x79e
1:3A0C  1e             push     ds
1:3A0D  07             pop      es
1:3A0E  a5             movsw    word ptr es:[di], word ptr [si]
1:3A0F  a5             movsw    word ptr es:[di], word ptr [si]
1:3A10  a5             movsw    word ptr es:[di], word ptr [si]
1:3A11  a5             movsw    word ptr es:[di], word ptr [si]
1:3A12  babe07         mov      dx, 0x7be
1:3A15  8bfa           mov      di, dx
1:3A17  8bf0           mov      si, ax
1:3A19  a5             movsw    word ptr es:[di], word ptr [si]
1:3A1A  a5             movsw    word ptr es:[di], word ptr [si]
1:3A1B  a5             movsw    word ptr es:[di], word ptr [si]
1:3A1C  a5             movsw    word ptr es:[di], word ptr [si]
1:3A1D  b8b607         mov      ax, 0x7b6
1:3A20  8bf8           mov      di, ax
1:3A22  8bf2           mov      si, dx
1:3A24  a5             movsw    word ptr es:[di], word ptr [si]
1:3A25  a5             movsw    word ptr es:[di], word ptr [si]
1:3A26  a5             movsw    word ptr es:[di], word ptr [si]
1:3A27  a5             movsw    word ptr es:[di], word ptr [si]
1:3A28  8b46fc         mov      ax, word ptr [bp - 4]
1:3A2B  8946f8         mov      word ptr [bp - 8], ax
1:3A2E  c746f60100     mov      word ptr [bp - 0xa], 1
1:3A33  e9ad00         jmp      0x3ae3
1:3A36  b8a607         mov      ax, 0x7a6
1:3A39  50             push     ax
1:3A3A  ff7606         push     word ptr [bp + 6]
1:3A3D  0e             push     cs
1:3A3E  e85402         call     0x3c95
1:3A41  5b             pop      bx
1:3A42  5b             pop      bx
1:3A43  b8a607         mov      ax, 0x7a6
1:3A46  1e             push     ds
1:3A47  50             push     ax
1:3A48  ff76fc         push     word ptr [bp - 4]
1:3A4B  2bc0           sub      ax, ax
1:3A4D  50             push     ax
1:3A4E  9a7c3a0000     lcall    0, 0x3a7c  ; USER.OffsetRect
1:3A53  837ef400       cmp      word ptr [bp - 0xc], 0
1:3A57  740a           je       0x3a63
1:3A59  b8ae07         mov      ax, 0x7ae
1:3A5C  50             push     ax
1:3A5D  0e             push     cs
1:3A5E  e82503         call     0x3d86
1:3A61  eb0c           jmp      0x3a6f
1:3A63  b8ae07         mov      ax, 0x7ae
1:3A66  50             push     ax
1:3A67  ff7606         push     word ptr [bp + 6]
1:3A6A  0e             push     cs
1:3A6B  e82702         call     0x3c95
1:3A6E  5b             pop      bx
1:3A6F  5b             pop      bx
1:3A70  b8ae07         mov      ax, 0x7ae
1:3A73  1e             push     ds
1:3A74  50             push     ax
1:3A75  2bc0           sub      ax, ax
1:3A77  50             push     ax
1:3A78  ff76f8         push     word ptr [bp - 8]
1:3A7B  9aac3a0000     lcall    0, 0x3aac  ; USER.OffsetRect
1:3A80  837ef400       cmp      word ptr [bp - 0xc], 0
1:3A84  740a           je       0x3a90
1:3A86  b8b607         mov      ax, 0x7b6
1:3A89  50             push     ax
1:3A8A  0e             push     cs
1:3A8B  e8f802         call     0x3d86
1:3A8E  eb0c           jmp      0x3a9c
1:3A90  b8b607         mov      ax, 0x7b6
1:3A93  50             push     ax
1:3A94  ff7606         push     word ptr [bp + 6]
1:3A97  0e             push     cs
1:3A98  e8fa01         call     0x3c95
1:3A9B  5b             pop      bx
1:3A9C  5b             pop      bx
1:3A9D  b8b607         mov      ax, 0x7b6
1:3AA0  1e             push     ds
1:3AA1  50             push     ax
1:3AA2  8b46fc         mov      ax, word ptr [bp - 4]
1:3AA5  f7d8           neg      ax
1:3AA7  50             push     ax
1:3AA8  2bc0           sub      ax, ax
1:3AAA  50             push     ax
1:3AAB  9adc3a0000     lcall    0, 0x3adc  ; USER.OffsetRect
1:3AB0  837ef400       cmp      word ptr [bp - 0xc], 0
1:3AB4  740a           je       0x3ac0
1:3AB6  b8be07         mov      ax, 0x7be
1:3AB9  50             push     ax
1:3ABA  0e             push     cs
1:3ABB  e8c802         call     0x3d86
1:3ABE  eb0c           jmp      0x3acc
1:3AC0  b8be07         mov      ax, 0x7be
1:3AC3  50             push     ax
1:3AC4  ff7606         push     word ptr [bp + 6]
1:3AC7  0e             push     cs
1:3AC8  e8ca01         call     0x3c95
1:3ACB  5b             pop      bx
1:3ACC  5b             pop      bx
1:3ACD  b8be07         mov      ax, 0x7be
1:3AD0  1e             push     ds
1:3AD1  50             push     ax
1:3AD2  2bc0           sub      ax, ax
1:3AD4  50             push     ax
1:3AD5  8b46f8         mov      ax, word ptr [bp - 8]
1:3AD8  f7d8           neg      ax
1:3ADA  50             push     ax
1:3ADB  9a743b0000     lcall    0, 0x3b74  ; USER.OffsetRect
1:3AE0  ff46f6         inc      word ptr [bp - 0xa]
1:3AE3  837ef605       cmp      word ptr [bp - 0xa], 5
1:3AE7  7f14           jg       0x3afd
1:3AE9  837ef400       cmp      word ptr [bp - 0xc], 0
1:3AED  7503           jne      0x3af2
1:3AEF  e944ff         jmp      0x3a36
1:3AF2  b8a607         mov      ax, 0x7a6
1:3AF5  50             push     ax
1:3AF6  0e             push     cs
1:3AF7  e88c02         call     0x3d86
1:3AFA  e945ff         jmp      0x3a42
1:3AFD  8b46f4         mov      ax, word ptr [bp - 0xc]
1:3B00  5e             pop      si
1:3B01  5f             pop      di
1:3B02  4d             dec      bp
1:3B03  4d             dec      bp
1:3B04  8be5           mov      sp, bp
1:3B06  1f             pop      ds
1:3B07  5d             pop      bp
1:3B08  4d             dec      bp
1:3B09  cb             retf     

; ===== FN 1:3B0A..3C95 =====
1:3B0A  1e             push     ds
1:3B0B  58             pop      ax
1:3B0C  90             nop      
1:3B0D  45             inc      bp
1:3B0E  55             push     bp
1:3B0F  8bec           mov      bp, sp
1:3B11  1e             push     ds
1:3B12  8ed8           mov      ds, ax
1:3B14  83ec06         sub      sp, 6
1:3B17  57             push     di
1:3B18  56             push     si
1:3B19  8b5e06         mov      bx, word ptr [bp + 6]
1:3B1C  8b4704         mov      ax, word ptr [bx + 4]
1:3B1F  2b07           sub      ax, word ptr [bx]
1:3B21  8946fc         mov      word ptr [bp - 4], ax
1:3B24  8b4706         mov      ax, word ptr [bx + 6]
1:3B27  2b4702         sub      ax, word ptr [bx + 2]
1:3B2A  8946fa         mov      word ptr [bp - 6], ax
1:3B2D  b8ee07         mov      ax, 0x7ee
1:3B30  8bf8           mov      di, ax
1:3B32  8bf3           mov      si, bx
1:3B34  1e             push     ds
1:3B35  07             pop      es
1:3B36  a5             movsw    word ptr es:[di], word ptr [si]
1:3B37  a5             movsw    word ptr es:[di], word ptr [si]
1:3B38  a5             movsw    word ptr es:[di], word ptr [si]
1:3B39  a5             movsw    word ptr es:[di], word ptr [si]
1:3B3A  bace07         mov      dx, 0x7ce
1:3B3D  8b5e08         mov      bx, word ptr [bp + 8]
1:3B40  8bfa           mov      di, dx
1:3B42  8bf3           mov      si, bx
1:3B44  a5             movsw    word ptr es:[di], word ptr [si]
1:3B45  a5             movsw    word ptr es:[di], word ptr [si]
1:3B46  a5             movsw    word ptr es:[di], word ptr [si]
1:3B47  a5             movsw    word ptr es:[di], word ptr [si]
1:3B48  bede07         mov      si, 0x7de
1:3B4B  56             push     si
1:3B4C  8bfe           mov      di, si
1:3B4E  8bf3           mov      si, bx
1:3B50  a5             movsw    word ptr es:[di], word ptr [si]
1:3B51  a5             movsw    word ptr es:[di], word ptr [si]
1:3B52  a5             movsw    word ptr es:[di], word ptr [si]
1:3B53  a5             movsw    word ptr es:[di], word ptr [si]
1:3B54  5e             pop      si
1:3B55  bbd607         mov      bx, 0x7d6
1:3B58  56             push     si
1:3B59  8bfb           mov      di, bx
1:3B5B  a5             movsw    word ptr es:[di], word ptr [si]
1:3B5C  a5             movsw    word ptr es:[di], word ptr [si]
1:3B5D  a5             movsw    word ptr es:[di], word ptr [si]
1:3B5E  a5             movsw    word ptr es:[di], word ptr [si]
1:3B5F  5e             pop      si
1:3B60  52             push     dx
1:3B61  50             push     ax
1:3B62  0e             push     cs
1:3B63  e82f01         call     0x3c95
1:3B66  5b             pop      bx
1:3B67  5b             pop      bx
1:3B68  b8ce07         mov      ax, 0x7ce
1:3B6B  1e             push     ds
1:3B6C  50             push     ax
1:3B6D  ff76fc         push     word ptr [bp - 4]
1:3B70  2bc9           sub      cx, cx
1:3B72  51             push     cx
1:3B73  9a923b0000     lcall    0, 0x3b92  ; USER.OffsetRect
1:3B78  b8ce07         mov      ax, 0x7ce
1:3B7B  50             push     ax
1:3B7C  b9ee07         mov      cx, 0x7ee
1:3B7F  51             push     cx
1:3B80  0e             push     cs
1:3B81  e81101         call     0x3c95
1:3B84  5b             pop      bx
1:3B85  5b             pop      bx
1:3B86  b8ce07         mov      ax, 0x7ce
1:3B89  1e             push     ds
1:3B8A  50             push     ax
1:3B8B  ff76fc         push     word ptr [bp - 4]
1:3B8E  2bc9           sub      cx, cx
1:3B90  51             push     cx
1:3B91  9aba3b0000     lcall    0, 0x3bba  ; USER.OffsetRect
1:3B96  b8ce07         mov      ax, 0x7ce
1:3B99  50             push     ax
1:3B9A  b9ee07         mov      cx, 0x7ee
1:3B9D  51             push     cx
1:3B9E  0e             push     cs
1:3B9F  e8f300         call     0x3c95
1:3BA2  5b             pop      bx
1:3BA3  5b             pop      bx
1:3BA4  b8ce07         mov      ax, 0x7ce
1:3BA7  56             push     si
1:3BA8  8bf8           mov      di, ax
1:3BAA  1e             push     ds
1:3BAB  07             pop      es
1:3BAC  a5             movsw    word ptr es:[di], word ptr [si]
1:3BAD  a5             movsw    word ptr es:[di], word ptr [si]
1:3BAE  a5             movsw    word ptr es:[di], word ptr [si]
1:3BAF  a5             movsw    word ptr es:[di], word ptr [si]
1:3BB0  5e             pop      si
1:3BB1  1e             push     ds
1:3BB2  50             push     ax
1:3BB3  2bc9           sub      cx, cx
1:3BB5  51             push     cx
1:3BB6  ff76fa         push     word ptr [bp - 6]
1:3BB9  9ae33b0000     lcall    0, 0x3be3  ; USER.OffsetRect
1:3BBE  b8ce07         mov      ax, 0x7ce
1:3BC1  50             push     ax
1:3BC2  b9ee07         mov      cx, 0x7ee
1:3BC5  51             push     cx
1:3BC6  0e             push     cs
1:3BC7  e8cb00         call     0x3c95
1:3BCA  5b             pop      bx
1:3BCB  5b             pop      bx
1:3BCC  8bfe           mov      di, si
1:3BCE  bece07         mov      si, 0x7ce
1:3BD1  1e             push     ds
1:3BD2  07             pop      es
1:3BD3  a5             movsw    word ptr es:[di], word ptr [si]
1:3BD4  a5             movsw    word ptr es:[di], word ptr [si]
1:3BD5  a5             movsw    word ptr es:[di], word ptr [si]
1:3BD6  a5             movsw    word ptr es:[di], word ptr [si]
1:3BD7  b8ce07         mov      ax, 0x7ce
1:3BDA  1e             push     ds
1:3BDB  50             push     ax
1:3BDC  ff76fc         push     word ptr [bp - 4]
1:3BDF  2bc0           sub      ax, ax
1:3BE1  50             push     ax
1:3BE2  9a143c0000     lcall    0, 0x3c14  ; USER.OffsetRect
1:3BE7  b8ee07         mov      ax, 0x7ee
1:3BEA  1e             push     ds
1:3BEB  50             push     ax
1:3BEC  b9ce07         mov      cx, 0x7ce
1:3BEF  1e             push     ds
1:3BF0  51             push     cx
1:3BF1  9affff0000     lcall    0, 0xffff  ; USER.EqualRect
1:3BF6  0bc0           or       ax, ax
1:3BF8  750e           jne      0x3c08
1:3BFA  b8ce07         mov      ax, 0x7ce
1:3BFD  50             push     ax
1:3BFE  b8ee07         mov      ax, 0x7ee
1:3C01  50             push     ax
1:3C02  0e             push     cs
1:3C03  e88f00         call     0x3c95
1:3C06  5b             pop      bx
1:3C07  5b             pop      bx
1:3C08  b8ce07         mov      ax, 0x7ce
1:3C0B  1e             push     ds
1:3C0C  50             push     ax
1:3C0D  ff76fc         push     word ptr [bp - 4]
1:3C10  2bc9           sub      cx, cx
1:3C12  51             push     cx
1:3C13  9a3d3c0000     lcall    0, 0x3c3d  ; USER.OffsetRect
1:3C18  b8ce07         mov      ax, 0x7ce
1:3C1B  50             push     ax
1:3C1C  b9ee07         mov      cx, 0x7ee
1:3C1F  51             push     cx
1:3C20  0e             push     cs
1:3C21  e87100         call     0x3c95
1:3C24  5b             pop      bx
1:3C25  5b             pop      bx
1:3C26  b8ce07         mov      ax, 0x7ce
1:3C29  8bf8           mov      di, ax
1:3C2B  bede07         mov      si, 0x7de
1:3C2E  1e             push     ds
1:3C2F  07             pop      es
1:3C30  a5             movsw    word ptr es:[di], word ptr [si]
1:3C31  a5             movsw    word ptr es:[di], word ptr [si]
1:3C32  a5             movsw    word ptr es:[di], word ptr [si]
1:3C33  a5             movsw    word ptr es:[di], word ptr [si]
1:3C34  1e             push     ds
1:3C35  50             push     ax
1:3C36  2bc9           sub      cx, cx
1:3C38  51             push     cx
1:3C39  ff76fa         push     word ptr [bp - 6]
1:3C3C  9a79310000     lcall    0, 0x3179  ; USER.OffsetRect
1:3C41  b8ce07         mov      ax, 0x7ce
1:3C44  50             push     ax
1:3C45  b9ee07         mov      cx, 0x7ee
1:3C48  51             push     cx
1:3C49  0e             push     cs
1:3C4A  e84800         call     0x3c95
1:3C4D  5b             pop      bx
1:3C4E  5b             pop      bx
1:3C4F  b8ce07         mov      ax, 0x7ce
1:3C52  1e             push     ds
1:3C53  50             push     ax
1:3C54  ff76fc         push     word ptr [bp - 4]
1:3C57  2bc9           sub      cx, cx
1:3C59  51             push     cx
1:3C5A  9a793c0000     lcall    0, 0x3c79  ; USER.OffsetRect
1:3C5F  b8ce07         mov      ax, 0x7ce
1:3C62  50             push     ax
1:3C63  b9ee07         mov      cx, 0x7ee
1:3C66  51             push     cx
1:3C67  0e             push     cs
1:3C68  e82a00         call     0x3c95
1:3C6B  5b             pop      bx
1:3C6C  5b             pop      bx
1:3C6D  b8ce07         mov      ax, 0x7ce
1:3C70  1e             push     ds
1:3C71  50             push     ax
1:3C72  ff76fc         push     word ptr [bp - 4]
1:3C75  2bc0           sub      ax, ax
1:3C77  50             push     ax
1:3C78  9af73e0000     lcall    0, 0x3ef7  ; USER.OffsetRect
1:3C7D  b8ce07         mov      ax, 0x7ce
1:3C80  50             push     ax
1:3C81  b8ee07         mov      ax, 0x7ee
1:3C84  50             push     ax
1:3C85  0e             push     cs
1:3C86  e80c00         call     0x3c95
1:3C89  5b             pop      bx
1:3C8A  5b             pop      bx
1:3C8B  5e             pop      si
1:3C8C  5f             pop      di
1:3C8D  4d             dec      bp
1:3C8E  4d             dec      bp
1:3C8F  8be5           mov      sp, bp
1:3C91  1f             pop      ds
1:3C92  5d             pop      bp
1:3C93  4d             dec      bp
1:3C94  cb             retf     

; ===== FN 1:3C95..3DAF =====
1:3C95  1e             push     ds
1:3C96  58             pop      ax
1:3C97  90             nop      
1:3C98  45             inc      bp
1:3C99  55             push     bp
1:3C9A  8bec           mov      bp, sp
1:3C9C  1e             push     ds
1:3C9D  8ed8           mov      ds, ax
1:3C9F  56             push     si
1:3CA0  8b5e06         mov      bx, word ptr [bp + 6]
1:3CA3  8b4702         mov      ax, word ptr [bx + 2]
1:3CA6  0306b008       add      ax, word ptr [0x8b0]
1:3CAA  a3f807         mov      word ptr [0x7f8], ax
1:3CAD  8b4706         mov      ax, word ptr [bx + 6]
1:3CB0  0306b008       add      ax, word ptr [0x8b0]
1:3CB4  a3fc07         mov      word ptr [0x7fc], ax
1:3CB7  8b07           mov      ax, word ptr [bx]
1:3CB9  0306b208       add      ax, word ptr [0x8b2]
1:3CBD  a3f607         mov      word ptr [0x7f6], ax
1:3CC0  8b4704         mov      ax, word ptr [bx + 4]
1:3CC3  0306b208       add      ax, word ptr [0x8b2]
1:3CC7  a3fa07         mov      word ptr [0x7fa], ax
1:3CCA  b8fe07         mov      ax, 0x7fe
1:3CCD  1e             push     ds
1:3CCE  50             push     ax
1:3CCF  b8f607         mov      ax, 0x7f6
1:3CD2  1e             push     ds
1:3CD3  50             push     ax
1:3CD4  a1a608         mov      ax, word ptr [0x8a6]
1:3CD7  8b16a808       mov      dx, word ptr [0x8a8]
1:3CDB  051600         add      ax, 0x16
1:3CDE  52             push     dx
1:3CDF  50             push     ax
1:3CE0  9a3e3f0000     lcall    0, 0x3f3e  ; USER.#79
1:3CE5  0bc0           or       ax, ax
1:3CE7  7403           je       0x3cec
1:3CE9  e99100         jmp      0x3d7d
1:3CEC  8b5e06         mov      bx, word ptr [bp + 6]
1:3CEF  8b4704         mov      ax, word ptr [bx + 4]
1:3CF2  8b7608         mov      si, word ptr [bp + 8]
1:3CF5  2b4404         sub      ax, word ptr [si + 4]
1:3CF8  0304           add      ax, word ptr [si]
1:3CFA  3b07           cmp      ax, word ptr [bx]
1:3CFC  750e           jne      0x3d0c
1:3CFE  8b4702         mov      ax, word ptr [bx + 2]
1:3D01  2b4402         sub      ax, word ptr [si + 2]
1:3D04  034406         add      ax, word ptr [si + 6]
1:3D07  3b4706         cmp      ax, word ptr [bx + 6]
1:3D0A  7440           je       0x3d4c
1:3D0C  ff369208       push     word ptr [0x892]
1:3D10  8bde           mov      bx, si
1:3D12  ff37           push     word ptr [bx]
1:3D14  ff7702         push     word ptr [bx + 2]
1:3D17  8b4704         mov      ax, word ptr [bx + 4]
1:3D1A  2b07           sub      ax, word ptr [bx]
1:3D1C  50             push     ax
1:3D1D  8b4706         mov      ax, word ptr [bx + 6]
1:3D20  2b4702         sub      ax, word ptr [bx + 2]
1:3D23  50             push     ax
1:3D24  ff369208       push     word ptr [0x892]
1:3D28  8b5e06         mov      bx, word ptr [bp + 6]
1:3D2B  ff37           push     word ptr [bx]
1:3D2D  ff7702         push     word ptr [bx + 2]
1:3D30  8b4704         mov      ax, word ptr [bx + 4]
1:3D33  2b07           sub      ax, word ptr [bx]
1:3D35  50             push     ax
1:3D36  8b4706         mov      ax, word ptr [bx + 6]
1:3D39  2b4702         sub      ax, word ptr [bx + 2]
1:3D3C  50             push     ax
1:3D3D  b82000         mov      ax, 0x20
1:3D40  bacc00         mov      dx, 0xcc
1:3D43  52             push     dx
1:3D44  50             push     ax
1:3D45  9affff0000     lcall    0, 0xffff  ; GDI.PatBlt
1:3D4A  eb31           jmp      0x3d7d
1:3D4C  ff369208       push     word ptr [0x892]
1:3D50  8bde           mov      bx, si
1:3D52  ff37           push     word ptr [bx]
1:3D54  ff7702         push     word ptr [bx + 2]
1:3D57  8b5e06         mov      bx, word ptr [bp + 6]
1:3D5A  8b4704         mov      ax, word ptr [bx + 4]
1:3D5D  2b07           sub      ax, word ptr [bx]
1:3D5F  50             push     ax
1:3D60  8b4706         mov      ax, word ptr [bx + 6]
1:3D63  2b4702         sub      ax, word ptr [bx + 2]
1:3D66  50             push     ax
1:3D67  ff369208       push     word ptr [0x892]
1:3D6B  ff37           push     word ptr [bx]
1:3D6D  ff7702         push     word ptr [bx + 2]
1:3D70  b82000         mov      ax, 0x20
1:3D73  bacc00         mov      dx, 0xcc
1:3D76  52             push     dx
1:3D77  50             push     ax
1:3D78  9affff0000     lcall    0, 0xffff  ; GDI.BitBlt
1:3D7D  5e             pop      si
1:3D7E  4d             dec      bp
1:3D7F  4d             dec      bp
1:3D80  8be5           mov      sp, bp
1:3D82  1f             pop      ds
1:3D83  5d             pop      bp
1:3D84  4d             dec      bp
1:3D85  cb             retf     
1:3D86  1e             push     ds
1:3D87  58             pop      ax
1:3D88  90             nop      
1:3D89  45             inc      bp
1:3D8A  55             push     bp
1:3D8B  8bec           mov      bp, sp
1:3D8D  1e             push     ds
1:3D8E  8ed8           mov      ds, ax
1:3D90  ff369208       push     word ptr [0x892]
1:3D94  1e             push     ds
1:3D95  ff7606         push     word ptr [bp + 6]
1:3D98  b80400         mov      ax, 4
1:3D9B  50             push     ax
1:3D9C  9aec2d0000     lcall    0, 0x2dec  ; GDI.GetStockObject
1:3DA1  50             push     ax
1:3DA2  9ad42d0000     lcall    0, 0x2dd4  ; USER.FillRect
1:3DA7  4d             dec      bp
1:3DA8  4d             dec      bp
1:3DA9  8be5           mov      sp, bp
1:3DAB  1f             pop      ds
1:3DAC  5d             pop      bp
1:3DAD  4d             dec      bp
1:3DAE  cb             retf     

; ===== FN 1:3DAF..410C =====
1:3DAF  1e             push     ds
1:3DB0  58             pop      ax
1:3DB1  90             nop      
1:3DB2  45             inc      bp
1:3DB3  55             push     bp
1:3DB4  8bec           mov      bp, sp
1:3DB6  1e             push     ds
1:3DB7  8ed8           mov      ds, ax
1:3DB9  83ec10         sub      sp, 0x10
1:3DBC  57             push     di
1:3DBD  56             push     si
1:3DBE  8b5e06         mov      bx, word ptr [bp + 6]
1:3DC1  8b4704         mov      ax, word ptr [bx + 4]
1:3DC4  2b07           sub      ax, word ptr [bx]
1:3DC6  8946fc         mov      word ptr [bp - 4], ax
1:3DC9  8b4706         mov      ax, word ptr [bx + 6]
1:3DCC  2b4702         sub      ax, word ptr [bx + 2]
1:3DCF  8946f4         mov      word ptr [bp - 0xc], ax
1:3DD2  2bc0           sub      ax, ax
1:3DD4  8946fa         mov      word ptr [bp - 6], ax
1:3DD7  8946f8         mov      word ptr [bp - 8], ax
1:3DDA  b80300         mov      ax, 3
1:3DDD  50             push     ax
1:3DDE  9a5c3e0000     lcall    0, 0x3e5c  ; INT:255:0007
1:3DE3  5b             pop      bx
1:3DE4  48             dec      ax
1:3DE5  7505           jne      0x3dec
1:3DE7  b80100         mov      ax, 1
1:3DEA  eb02           jmp      0x3dee
1:3DEC  2bc0           sub      ax, ax
1:3DEE  8946f2         mov      word ptr [bp - 0xe], ax
1:3DF1  b84e08         mov      ax, 0x84e
1:3DF4  8b5606         mov      dx, word ptr [bp + 6]
1:3DF7  8bf8           mov      di, ax
1:3DF9  8bf2           mov      si, dx
1:3DFB  1e             push     ds
1:3DFC  07             pop      es
1:3DFD  a5             movsw    word ptr es:[di], word ptr [si]
1:3DFE  a5             movsw    word ptr es:[di], word ptr [si]
1:3DFF  a5             movsw    word ptr es:[di], word ptr [si]
1:3E00  a5             movsw    word ptr es:[di], word ptr [si]
1:3E01  ba0608         mov      dx, 0x806
1:3E04  8b5e08         mov      bx, word ptr [bp + 8]
1:3E07  8bfa           mov      di, dx
1:3E09  8bf3           mov      si, bx
1:3E0B  a5             movsw    word ptr es:[di], word ptr [si]
1:3E0C  a5             movsw    word ptr es:[di], word ptr [si]
1:3E0D  a5             movsw    word ptr es:[di], word ptr [si]
1:3E0E  a5             movsw    word ptr es:[di], word ptr [si]
1:3E0F  ba1608         mov      dx, 0x816
1:3E12  8bfa           mov      di, dx
1:3E14  8bf0           mov      si, ax
1:3E16  a5             movsw    word ptr es:[di], word ptr [si]
1:3E17  a5             movsw    word ptr es:[di], word ptr [si]
1:3E18  a5             movsw    word ptr es:[di], word ptr [si]
1:3E19  a5             movsw    word ptr es:[di], word ptr [si]
1:3E1A  ba2e08         mov      dx, 0x82e
1:3E1D  8bfa           mov      di, dx
1:3E1F  8bf0           mov      si, ax
1:3E21  a5             movsw    word ptr es:[di], word ptr [si]
1:3E22  a5             movsw    word ptr es:[di], word ptr [si]
1:3E23  a5             movsw    word ptr es:[di], word ptr [si]
1:3E24  a5             movsw    word ptr es:[di], word ptr [si]
1:3E25  ba3608         mov      dx, 0x836
1:3E28  8bfa           mov      di, dx
1:3E2A  8bf0           mov      si, ax
1:3E2C  a5             movsw    word ptr es:[di], word ptr [si]
1:3E2D  a5             movsw    word ptr es:[di], word ptr [si]
1:3E2E  a5             movsw    word ptr es:[di], word ptr [si]
1:3E2F  a5             movsw    word ptr es:[di], word ptr [si]
1:3E30  ba3e08         mov      dx, 0x83e
1:3E33  8bfa           mov      di, dx
1:3E35  8bf0           mov      si, ax
1:3E37  a5             movsw    word ptr es:[di], word ptr [si]
1:3E38  a5             movsw    word ptr es:[di], word ptr [si]
1:3E39  a5             movsw    word ptr es:[di], word ptr [si]
1:3E3A  a5             movsw    word ptr es:[di], word ptr [si]
1:3E3B  b82608         mov      ax, 0x826
1:3E3E  8bf8           mov      di, ax
1:3E40  8bf3           mov      si, bx
1:3E42  a5             movsw    word ptr es:[di], word ptr [si]
1:3E43  a5             movsw    word ptr es:[di], word ptr [si]
1:3E44  a5             movsw    word ptr es:[di], word ptr [si]
1:3E45  a5             movsw    word ptr es:[di], word ptr [si]
1:3E46  ba1e08         mov      dx, 0x81e
1:3E49  8bfa           mov      di, dx
1:3E4B  8bf0           mov      si, ax
1:3E4D  a5             movsw    word ptr es:[di], word ptr [si]
1:3E4E  a5             movsw    word ptr es:[di], word ptr [si]
1:3E4F  a5             movsw    word ptr es:[di], word ptr [si]
1:3E50  a5             movsw    word ptr es:[di], word ptr [si]
1:3E51  b80100         mov      ax, 1
1:3E54  8946f6         mov      word ptr [bp - 0xa], ax
1:3E57  8946f0         mov      word ptr [bp - 0x10], ax
1:3E5A  50             push     ax
1:3E5B  9a6a3e0000     lcall    0, 0x3e6a  ; INT:255:0007
1:3E60  5b             pop      bx
1:3E61  0bc0           or       ax, ax
1:3E63  742e           je       0x3e93
1:3E65  b80100         mov      ax, 1
1:3E68  50             push     ax
1:3E69  9a773e0000     lcall    0, 0x3e77  ; INT:255:0007
1:3E6E  5b             pop      bx
1:3E6F  8946f6         mov      word ptr [bp - 0xa], ax
1:3E72  b80100         mov      ax, 1
1:3E75  50             push     ax
1:3E76  9a983e0000     lcall    0, 0x3e98  ; INT:255:0007
1:3E7B  5b             pop      bx
1:3E7C  8946f0         mov      word ptr [bp - 0x10], ax
1:3E7F  0bc0           or       ax, ax
1:3E81  7535           jne      0x3eb8
1:3E83  3946f6         cmp      word ptr [bp - 0xa], ax
1:3E86  7530           jne      0x3eb8
1:3E88  b80100         mov      ax, 1
1:3E8B  8946f6         mov      word ptr [bp - 0xa], ax
1:3E8E  8946f0         mov      word ptr [bp - 0x10], ax
1:3E91  eb25           jmp      0x3eb8
1:3E93  b80100         mov      ax, 1
1:3E96  50             push     ax
1:3E97  9aa63e0000     lcall    0, 0x3ea6  ; INT:255:0007
1:3E9C  5b             pop      bx
1:3E9D  0bc0           or       ax, ax
1:3E9F  7417           je       0x3eb8
1:3EA1  b80100         mov      ax, 1
1:3EA4  50             push     ax
1:3EA5  9ae1380000     lcall    0, 0x38e1  ; INT:255:0007
1:3EAA  5b             pop      bx
1:3EAB  8946fa         mov      word ptr [bp - 6], ax
1:3EAE  3d0100         cmp      ax, 1
1:3EB1  1bc0           sbb      ax, ax
1:3EB3  f7d8           neg      ax
1:3EB5  8946f8         mov      word ptr [bp - 8], ax
1:3EB8  837ef000       cmp      word ptr [bp - 0x10], 0
1:3EBC  741e           je       0x3edc
1:3EBE  b80608         mov      ax, 0x806
1:3EC1  50             push     ax
1:3EC2  b92e08         mov      cx, 0x82e
1:3EC5  51             push     cx
1:3EC6  0e             push     cs
1:3EC7  e8cbfd         call     0x3c95
1:3ECA  5b             pop      bx
1:3ECB  5b             pop      bx
1:3ECC  b83e08         mov      ax, 0x83e
1:3ECF  8bf8           mov      di, ax
1:3ED1  be0608         mov      si, 0x806
1:3ED4  1e             push     ds
1:3ED5  07             pop      es
1:3ED6  a5             movsw    word ptr es:[di], word ptr [si]
1:3ED7  a5             movsw    word ptr es:[di], word ptr [si]
1:3ED8  a5             movsw    word ptr es:[di], word ptr [si]
1:3ED9  a5             movsw    word ptr es:[di], word ptr [si]
1:3EDA  eb0f           jmp      0x3eeb
1:3EDC  837ef200       cmp      word ptr [bp - 0xe], 0
1:3EE0  7409           je       0x3eeb
1:3EE2  b80608         mov      ax, 0x806
1:3EE5  50             push     ax
1:3EE6  0e             push     cs
1:3EE7  e89cfe         call     0x3d86
1:3EEA  5b             pop      bx
1:3EEB  b80608         mov      ax, 0x806
1:3EEE  1e             push     ds
1:3EEF  50             push     ax
1:3EF0  ff76fc         push     word ptr [bp - 4]
1:3EF3  2bc9           sub      cx, cx
1:3EF5  51             push     cx
1:3EF6  9aa23f0000     lcall    0, 0x3fa2  ; USER.OffsetRect
1:3EFB  837ef600       cmp      word ptr [bp - 0xa], 0
1:3EFF  741e           je       0x3f1f
1:3F01  b80608         mov      ax, 0x806
1:3F04  50             push     ax
1:3F05  b94e08         mov      cx, 0x84e
1:3F08  51             push     cx
1:3F09  0e             push     cs
1:3F0A  e888fd         call     0x3c95
1:3F0D  5b             pop      bx
1:3F0E  5b             pop      bx
1:3F0F  b83608         mov      ax, 0x836
1:3F12  8bf8           mov      di, ax
1:3F14  be0608         mov      si, 0x806
1:3F17  1e             push     ds
1:3F18  07             pop      es
1:3F19  a5             movsw    word ptr es:[di], word ptr [si]
1:3F1A  a5             movsw    word ptr es:[di], word ptr [si]
1:3F1B  a5             movsw    word ptr es:[di], word ptr [si]
1:3F1C  a5             movsw    word ptr es:[di], word ptr [si]
1:3F1D  eb0f           jmp      0x3f2e
1:3F1F  837ef200       cmp      word ptr [bp - 0xe], 0
1:3F23  7409           je       0x3f2e
1:3F25  b80608         mov      ax, 0x806
1:3F28  50             push     ax
1:3F29  0e             push     cs
1:3F2A  e859fe         call     0x3d86
1:3F2D  5b             pop      bx
1:3F2E  b80e08         mov      ax, 0x80e
1:3F31  1e             push     ds
1:3F32  50             push     ax
1:3F33  b90608         mov      cx, 0x806
1:3F36  1e             push     ds
1:3F37  51             push     cx
1:3F38  b99c08         mov      cx, 0x89c
1:3F3B  1e             push     ds
1:3F3C  51             push     cx
1:3F3D  9affff0000     lcall    0, 0xffff  ; USER.#79
1:3F42  b80608         mov      ax, 0x806
1:3F45  1e             push     ds
1:3F46  50             push     ax
1:3F47  b80e08         mov      ax, 0x80e
1:3F4A  1e             push     ds
1:3F4B  50             push     ax
1:3F4C  9af23b0000     lcall    0, 0x3bf2  ; USER.EqualRect
1:3F51  0bc0           or       ax, ax
1:3F53  7441           je       0x3f96
1:3F55  837ef000       cmp      word ptr [bp - 0x10], 0
1:3F59  743b           je       0x3f96
1:3F5B  837ef600       cmp      word ptr [bp - 0xa], 0
1:3F5F  7435           je       0x3f96
1:3F61  837efa00       cmp      word ptr [bp - 6], 0
1:3F65  7506           jne      0x3f6d
1:3F67  837ef800       cmp      word ptr [bp - 8], 0
1:3F6B  7429           je       0x3f96
1:3F6D  837efa00       cmp      word ptr [bp - 6], 0
1:3F71  740a           je       0x3f7d
1:3F73  b81608         mov      ax, 0x816
1:3F76  8bf8           mov      di, ax
1:3F78  be3608         mov      si, 0x836
1:3F7B  eb08           jmp      0x3f85
1:3F7D  b82e08         mov      ax, 0x82e
1:3F80  8bf8           mov      di, ax
1:3F82  be3e08         mov      si, 0x83e
1:3F85  1e             push     ds
1:3F86  07             pop      es
1:3F87  a5             movsw    word ptr es:[di], word ptr [si]
1:3F88  a5             movsw    word ptr es:[di], word ptr [si]
1:3F89  a5             movsw    word ptr es:[di], word ptr [si]
1:3F8A  a5             movsw    word ptr es:[di], word ptr [si]
1:3F8B  ff369208       push     word ptr [0x892]
1:3F8F  1e             push     ds
1:3F90  50             push     ax
1:3F91  9a77270000     lcall    0, 0x2777  ; USER.InvertRect
1:3F96  b80608         mov      ax, 0x806
1:3F99  1e             push     ds
1:3F9A  50             push     ax
1:3F9B  ff76fc         push     word ptr [bp - 4]
1:3F9E  2bc9           sub      cx, cx
1:3FA0  51             push     cx
1:3FA1  9ae13f0000     lcall    0, 0x3fe1  ; USER.OffsetRect
1:3FA6  837ef000       cmp      word ptr [bp - 0x10], 0
1:3FAA  740f           je       0x3fbb
1:3FAC  b80608         mov      ax, 0x806
1:3FAF  50             push     ax
1:3FB0  b82e08         mov      ax, 0x82e
1:3FB3  50             push     ax
1:3FB4  0e             push     cs
1:3FB5  e8ddfc         call     0x3c95
1:3FB8  5b             pop      bx
1:3FB9  eb0e           jmp      0x3fc9
1:3FBB  837ef200       cmp      word ptr [bp - 0xe], 0
1:3FBF  7409           je       0x3fca
1:3FC1  b80608         mov      ax, 0x806
1:3FC4  50             push     ax
1:3FC5  0e             push     cs
1:3FC6  e8bdfd         call     0x3d86
1:3FC9  5b             pop      bx
1:3FCA  b80608         mov      ax, 0x806
1:3FCD  8bf8           mov      di, ax
1:3FCF  be2608         mov      si, 0x826
1:3FD2  1e             push     ds
1:3FD3  07             pop      es
1:3FD4  a5             movsw    word ptr es:[di], word ptr [si]
1:3FD5  a5             movsw    word ptr es:[di], word ptr [si]
1:3FD6  a5             movsw    word ptr es:[di], word ptr [si]
1:3FD7  a5             movsw    word ptr es:[di], word ptr [si]
1:3FD8  1e             push     ds
1:3FD9  50             push     ax
1:3FDA  2bc9           sub      cx, cx
1:3FDC  51             push     cx
1:3FDD  ff76f4         push     word ptr [bp - 0xc]
1:3FE0  9aa5390000     lcall    0, 0x39a5  ; USER.OffsetRect
1:3FE5  837ef600       cmp      word ptr [bp - 0xa], 0
1:3FE9  740f           je       0x3ffa
1:3FEB  b80608         mov      ax, 0x806
1:3FEE  50             push     ax
1:3FEF  b81608         mov      ax, 0x816
1:3FF2  50             push     ax
1:3FF3  0e             push     cs
1:3FF4  e89efc         call     0x3c95
1:3FF7  5b             pop      bx
1:3FF8  eb0e           jmp      0x4008
1:3FFA  837ef200       cmp      word ptr [bp - 0xe], 0
1:3FFE  7409           je       0x4009
1:4000  b80608         mov      ax, 0x806
1:4003  50             push     ax
1:4004  0e             push     cs
1:4005  e87efd         call     0x3d86
1:4008  5b             pop      bx
1:4009  b82608         mov      ax, 0x826
1:400C  8bf8           mov      di, ax
1:400E  be0608         mov      si, 0x806
1:4011  1e             push     ds
1:4012  07             pop      es
1:4013  a5             movsw    word ptr es:[di], word ptr [si]
1:4014  a5             movsw    word ptr es:[di], word ptr [si]
1:4015  a5             movsw    word ptr es:[di], word ptr [si]
1:4016  a5             movsw    word ptr es:[di], word ptr [si]
1:4017  b80608         mov      ax, 0x806
1:401A  1e             push     ds
1:401B  50             push     ax
1:401C  ff76fc         push     word ptr [bp - 4]
1:401F  2bc9           sub      cx, cx
1:4021  51             push     cx
1:4022  9a33400000     lcall    0, 0x4033  ; USER.OffsetRect
1:4027  b80608         mov      ax, 0x806
1:402A  1e             push     ds
1:402B  50             push     ax
1:402C  ff76fc         push     word ptr [bp - 4]
1:402F  2bc0           sub      ax, ax
1:4031  50             push     ax
1:4032  9a72400000     lcall    0, 0x4072  ; USER.OffsetRect
1:4037  837ef600       cmp      word ptr [bp - 0xa], 0
1:403B  740f           je       0x404c
1:403D  b80608         mov      ax, 0x806
1:4040  50             push     ax
1:4041  b81608         mov      ax, 0x816
1:4044  50             push     ax
1:4045  0e             push     cs
1:4046  e84cfc         call     0x3c95
1:4049  5b             pop      bx
1:404A  eb0e           jmp      0x405a
1:404C  837ef200       cmp      word ptr [bp - 0xe], 0
1:4050  7409           je       0x405b
1:4052  b80608         mov      ax, 0x806
1:4055  50             push     ax
1:4056  0e             push     cs
1:4057  e82cfd         call     0x3d86
1:405A  5b             pop      bx
1:405B  b80608         mov      ax, 0x806
1:405E  8bf8           mov      di, ax
1:4060  be2608         mov      si, 0x826
1:4063  1e             push     ds
1:4064  07             pop      es
1:4065  a5             movsw    word ptr es:[di], word ptr [si]
1:4066  a5             movsw    word ptr es:[di], word ptr [si]
1:4067  a5             movsw    word ptr es:[di], word ptr [si]
1:4068  a5             movsw    word ptr es:[di], word ptr [si]
1:4069  1e             push     ds
1:406A  50             push     ax
1:406B  2bc9           sub      cx, cx
1:406D  51             push     cx
1:406E  ff76f4         push     word ptr [bp - 0xc]
1:4071  9aa6400000     lcall    0, 0x40a6  ; USER.OffsetRect
1:4076  837ef000       cmp      word ptr [bp - 0x10], 0
1:407A  740f           je       0x408b
1:407C  b80608         mov      ax, 0x806
1:407F  50             push     ax
1:4080  b82e08         mov      ax, 0x82e
1:4083  50             push     ax
1:4084  0e             push     cs
1:4085  e80dfc         call     0x3c95
1:4088  5b             pop      bx
1:4089  eb0e           jmp      0x4099
1:408B  837ef200       cmp      word ptr [bp - 0xe], 0
1:408F  7409           je       0x409a
1:4091  b80608         mov      ax, 0x806
1:4094  50             push     ax
1:4095  0e             push     cs
1:4096  e8edfc         call     0x3d86
1:4099  5b             pop      bx
1:409A  b80608         mov      ax, 0x806
1:409D  1e             push     ds
1:409E  50             push     ax
1:409F  ff76fc         push     word ptr [bp - 4]
1:40A2  2bc9           sub      cx, cx
1:40A4  51             push     cx
1:40A5  9ada400000     lcall    0, 0x40da  ; USER.OffsetRect
1:40AA  837ef600       cmp      word ptr [bp - 0xa], 0
1:40AE  740f           je       0x40bf
1:40B0  b80608         mov      ax, 0x806
1:40B3  50             push     ax
1:40B4  b81608         mov      ax, 0x816
1:40B7  50             push     ax
1:40B8  0e             push     cs
1:40B9  e8d9fb         call     0x3c95
1:40BC  5b             pop      bx
1:40BD  eb0e           jmp      0x40cd
1:40BF  837ef200       cmp      word ptr [bp - 0xe], 0
1:40C3  7409           je       0x40ce
1:40C5  b80608         mov      ax, 0x806
1:40C8  50             push     ax
1:40C9  0e             push     cs
1:40CA  e8b9fc         call     0x3d86
1:40CD  5b             pop      bx
1:40CE  b80608         mov      ax, 0x806
1:40D1  1e             push     ds
1:40D2  50             push     ax
1:40D3  ff76fc         push     word ptr [bp - 4]
1:40D6  2bc9           sub      cx, cx
1:40D8  51             push     cx
1:40D9  9a5b3c0000     lcall    0, 0x3c5b  ; USER.OffsetRect
1:40DE  837ef000       cmp      word ptr [bp - 0x10], 0
1:40E2  740f           je       0x40f3
1:40E4  b80608         mov      ax, 0x806
1:40E7  50             push     ax
1:40E8  b82e08         mov      ax, 0x82e
1:40EB  50             push     ax
1:40EC  0e             push     cs
1:40ED  e8a5fb         call     0x3c95
1:40F0  5b             pop      bx
1:40F1  eb0e           jmp      0x4101
1:40F3  837ef200       cmp      word ptr [bp - 0xe], 0
1:40F7  7409           je       0x4102
1:40F9  b80608         mov      ax, 0x806
1:40FC  50             push     ax
1:40FD  0e             push     cs
1:40FE  e885fc         call     0x3d86
1:4101  5b             pop      bx
1:4102  5e             pop      si
1:4103  5f             pop      di
1:4104  4d             dec      bp
1:4105  4d             dec      bp
1:4106  8be5           mov      sp, bp
1:4108  1f             pop      ds
1:4109  5d             pop      bp
1:410A  4d             dec      bp
1:410B  cb             retf     

; ===== FN 1:410C..41BB =====
1:410C  1e             push     ds
1:410D  58             pop      ax
1:410E  90             nop      
1:410F  45             inc      bp
1:4110  55             push     bp
1:4111  8bec           mov      bp, sp
1:4113  1e             push     ds
1:4114  8ed8           mov      ds, ax
1:4116  a11200         mov      ax, word ptr [0x12]
1:4119  8b161400       mov      dx, word ptr [0x14]
1:411D  8b5e06         mov      bx, word ptr [bp + 6]
1:4120  8907           mov      word ptr [bx], ax
1:4122  895702         mov      word ptr [bx + 2], dx
1:4125  a11600         mov      ax, word ptr [0x16]
1:4128  894704         mov      word ptr [bx + 4], ax
1:412B  a11800         mov      ax, word ptr [0x18]
1:412E  894706         mov      word ptr [bx + 6], ax
1:4131  4d             dec      bp
1:4132  4d             dec      bp
1:4133  8be5           mov      sp, bp
1:4135  1f             pop      ds
1:4136  5d             pop      bp
1:4137  4d             dec      bp
1:4138  cb             retf     
1:4139  1e             push     ds
1:413A  58             pop      ax
1:413B  90             nop      
1:413C  45             inc      bp
1:413D  55             push     bp
1:413E  8bec           mov      bp, sp
1:4140  1e             push     ds
1:4141  8ed8           mov      ds, ax
1:4143  8b4606         mov      ax, word ptr [bp + 6]
1:4146  8b5608         mov      dx, word ptr [bp + 8]
1:4149  a31200         mov      word ptr [0x12], ax
1:414C  89161400       mov      word ptr [0x14], dx
1:4150  ff369208       push     word ptr [0x892]
1:4154  ff36aa08       push     word ptr [0x8aa]
1:4158  9a7a410000     lcall    0, 0x417a  ; GDI.SelectObject
1:415D  ff36ac08       push     word ptr [0x8ac]
1:4161  9a90410000     lcall    0, 0x4190  ; GDI.DeleteObject
1:4166  ff7608         push     word ptr [bp + 8]
1:4169  ff7606         push     word ptr [bp + 6]
1:416C  9a3c000000     lcall    0, 0x3c  ; GDI.CreateSolidBrush
1:4171  a3ac08         mov      word ptr [0x8ac], ax
1:4174  ff369208       push     word ptr [0x892]
1:4178  50             push     ax
1:4179  9a87410000     lcall    0, 0x4187  ; GDI.SelectObject
1:417E  ff369208       push     word ptr [0x892]
1:4182  ff36b608       push     word ptr [0x8b6]
1:4186  9aaf410000     lcall    0, 0x41af  ; GDI.SelectObject
1:418B  ff36c008       push     word ptr [0x8c0]
1:418F  9aff410000     lcall    0, 0x41ff  ; GDI.DeleteObject
1:4194  2bc0           sub      ax, ax
1:4196  50             push     ax
1:4197  ff361800       push     word ptr [0x18]
1:419B  ff7608         push     word ptr [bp + 8]
1:419E  ff7606         push     word ptr [bp + 6]
1:41A1  9a12420000     lcall    0, 0x4212  ; GDI.CreatePen
1:41A6  a3c008         mov      word ptr [0x8c0], ax
1:41A9  ff369208       push     word ptr [0x892]
1:41AD  50             push     ax
1:41AE  9af6410000     lcall    0, 0x41f6  ; GDI.SelectObject
1:41B3  4d             dec      bp
1:41B4  4d             dec      bp
1:41B5  8be5           mov      sp, bp
1:41B7  1f             pop      ds
1:41B8  5d             pop      bp
1:41B9  4d             dec      bp
1:41BA  cb             retf     

; ===== FN 1:41BB..41DD =====
1:41BB  1e             push     ds
1:41BC  58             pop      ax
1:41BD  90             nop      
1:41BE  45             inc      bp
1:41BF  55             push     bp
1:41C0  8bec           mov      bp, sp
1:41C2  1e             push     ds
1:41C3  8ed8           mov      ds, ax
1:41C5  ff369208       push     word ptr [0x892]
1:41C9  8b4606         mov      ax, word ptr [bp + 6]
1:41CC  a31600         mov      word ptr [0x16], ax
1:41CF  50             push     ax
1:41D0  9affff0000     lcall    0, 0xffff  ; GDI.SetROP2
1:41D5  4d             dec      bp
1:41D6  4d             dec      bp
1:41D7  8be5           mov      sp, bp
1:41D9  1f             pop      ds
1:41DA  5d             pop      bp
1:41DB  4d             dec      bp
1:41DC  cb             retf     

; ===== FN 1:41DD..422B =====
1:41DD  1e             push     ds
1:41DE  58             pop      ax
1:41DF  90             nop      
1:41E0  45             inc      bp
1:41E1  55             push     bp
1:41E2  8bec           mov      bp, sp
1:41E4  1e             push     ds
1:41E5  8ed8           mov      ds, ax
1:41E7  8b4606         mov      ax, word ptr [bp + 6]
1:41EA  a31800         mov      word ptr [0x18], ax
1:41ED  ff369208       push     word ptr [0x892]
1:41F1  ff36b608       push     word ptr [0x8b6]
1:41F5  9a1f420000     lcall    0, 0x421f  ; GDI.SelectObject
1:41FA  ff36c008       push     word ptr [0x8c0]
1:41FE  9a53010000     lcall    0, 0x153  ; GDI.DeleteObject
1:4203  2bc0           sub      ax, ax
1:4205  50             push     ax
1:4206  ff7606         push     word ptr [bp + 6]
1:4209  ff361400       push     word ptr [0x14]
1:420D  ff361200       push     word ptr [0x12]
1:4211  9a2c000000     lcall    0, 0x2c  ; GDI.CreatePen
1:4216  a3c008         mov      word ptr [0x8c0], ax
1:4219  ff369208       push     word ptr [0x892]
1:421D  50             push     ax
1:421E  9af22d0000     lcall    0, 0x2df2  ; GDI.SelectObject
1:4223  4d             dec      bp
1:4224  4d             dec      bp
1:4225  8be5           mov      sp, bp
1:4227  1f             pop      ds
1:4228  5d             pop      bp
1:4229  4d             dec      bp
1:422A  cb             retf     

; ===== FN 1:422B..4281 =====
1:422B  1e             push     ds
1:422C  58             pop      ax
1:422D  90             nop      
1:422E  45             inc      bp
1:422F  55             push     bp
1:4230  8bec           mov      bp, sp
1:4232  1e             push     ds
1:4233  8ed8           mov      ds, ax
1:4235  a11200         mov      ax, word ptr [0x12]
1:4238  8b161400       mov      dx, word ptr [0x14]
1:423C  8b5e06         mov      bx, word ptr [bp + 6]
1:423F  3907           cmp      word ptr [bx], ax
1:4241  7505           jne      0x4248
1:4243  395702         cmp      word ptr [bx + 2], dx
1:4246  740b           je       0x4253
1:4248  ff7702         push     word ptr [bx + 2]
1:424B  ff37           push     word ptr [bx]
1:424D  0e             push     cs
1:424E  e8e8fe         call     0x4139
1:4251  5b             pop      bx
1:4252  5b             pop      bx
1:4253  a11600         mov      ax, word ptr [0x16]
1:4256  8b5e06         mov      bx, word ptr [bp + 6]
1:4259  394704         cmp      word ptr [bx + 4], ax
1:425C  7408           je       0x4266
1:425E  ff7704         push     word ptr [bx + 4]
1:4261  0e             push     cs
1:4262  e856ff         call     0x41bb
1:4265  5b             pop      bx
1:4266  a11800         mov      ax, word ptr [0x18]
1:4269  8b5e06         mov      bx, word ptr [bp + 6]
1:426C  394706         cmp      word ptr [bx + 6], ax
1:426F  7408           je       0x4279
1:4271  ff7706         push     word ptr [bx + 6]
1:4274  0e             push     cs
1:4275  e865ff         call     0x41dd
1:4278  5b             pop      bx
1:4279  4d             dec      bp
1:427A  4d             dec      bp
1:427B  8be5           mov      sp, bp
1:427D  1f             pop      ds
1:427E  5d             pop      bp
1:427F  4d             dec      bp
1:4280  cb             retf     

; ===== FN 1:4281..42AA =====
1:4281  1e             push     ds
1:4282  58             pop      ax
1:4283  90             nop      
1:4284  45             inc      bp
1:4285  55             push     bp
1:4286  8bec           mov      bp, sp
1:4288  1e             push     ds
1:4289  8ed8           mov      ds, ax
1:428B  1e             push     ds
1:428C  ff7606         push     word ptr [bp + 6]
1:428F  8b5e06         mov      bx, word ptr [bp + 6]
1:4292  8b07           mov      ax, word ptr [bx]
1:4294  f7d8           neg      ax
1:4296  50             push     ax
1:4297  8b4702         mov      ax, word ptr [bx + 2]
1:429A  f7d8           neg      ax
1:429C  50             push     ax
1:429D  9a23400000     lcall    0, 0x4023  ; USER.OffsetRect
1:42A2  4d             dec      bp
1:42A3  4d             dec      bp
1:42A4  8be5           mov      sp, bp
1:42A6  1f             pop      ds
1:42A7  5d             pop      bp
1:42A8  4d             dec      bp
1:42A9  cb             retf     

; ===== FN 1:42AA..42D6 =====
1:42AA  1e             push     ds
1:42AB  58             pop      ax
1:42AC  90             nop      
1:42AD  45             inc      bp
1:42AE  55             push     bp
1:42AF  8bec           mov      bp, sp
1:42B1  1e             push     ds
1:42B2  8ed8           mov      ds, ax
1:42B4  56             push     si
1:42B5  8b5e06         mov      bx, word ptr [bp + 6]
1:42B8  8b4704         mov      ax, word ptr [bx + 4]
1:42BB  2b07           sub      ax, word ptr [bx]
1:42BD  8b7608         mov      si, word ptr [bp + 8]
1:42C0  8904           mov      word ptr [si], ax
1:42C2  8b4706         mov      ax, word ptr [bx + 6]
1:42C5  2b4702         sub      ax, word ptr [bx + 2]
1:42C8  8b5e0a         mov      bx, word ptr [bp + 0xa]
1:42CB  8907           mov      word ptr [bx], ax
1:42CD  5e             pop      si
1:42CE  4d             dec      bp
1:42CF  4d             dec      bp
1:42D0  8be5           mov      sp, bp
1:42D2  1f             pop      ds
1:42D3  5d             pop      bp
1:42D4  4d             dec      bp
1:42D5  cb             retf     

; ===== FN 1:42D6..42FE =====
1:42D6  1e             push     ds
1:42D7  58             pop      ax
1:42D8  90             nop      
1:42D9  45             inc      bp
1:42DA  55             push     bp
1:42DB  8bec           mov      bp, sp
1:42DD  1e             push     ds
1:42DE  8ed8           mov      ds, ax
1:42E0  8b4608         mov      ax, word ptr [bp + 8]
1:42E3  48             dec      ax
1:42E4  50             push     ax
1:42E5  0e             push     cs
1:42E6  e81500         call     0x42fe
1:42E9  5b             pop      bx
1:42EA  3b4606         cmp      ax, word ptr [bp + 6]
1:42ED  7d05           jge      0x42f4
1:42EF  b80100         mov      ax, 1
1:42F2  eb02           jmp      0x42f6
1:42F4  2bc0           sub      ax, ax
1:42F6  4d             dec      bp
1:42F7  4d             dec      bp
1:42F8  8be5           mov      sp, bp
1:42FA  1f             pop      ds
1:42FB  5d             pop      bp
1:42FC  4d             dec      bp
1:42FD  cb             retf     

; ===== FN 1:42FE..4334 =====
1:42FE  1e             push     ds
1:42FF  58             pop      ax
1:4300  90             nop      
1:4301  45             inc      bp
1:4302  55             push     bp
1:4303  8bec           mov      bp, sp
1:4305  1e             push     ds
1:4306  8ed8           mov      ds, ax
1:4308  83ec04         sub      sp, 4
1:430B  9affff0000     lcall    0, 0xffff  ; INT:255:002D
1:4310  8946fc         mov      word ptr [bp - 4], ax
1:4313  0bc0           or       ax, ax
1:4315  7d05           jge      0x431c
1:4317  f7d8           neg      ax
1:4319  8946fc         mov      word ptr [bp - 4], ax
1:431C  8066fd0f       and      byte ptr [bp - 3], 0xf
1:4320  8b46fc         mov      ax, word ptr [bp - 4]
1:4323  8b4e06         mov      cx, word ptr [bp + 6]
1:4326  41             inc      cx
1:4327  99             cdq      
1:4328  f7f9           idiv     cx
1:432A  8bc2           mov      ax, dx
1:432C  4d             dec      bp
1:432D  4d             dec      bp
1:432E  8be5           mov      sp, bp
1:4330  1f             pop      ds
1:4331  5d             pop      bp
1:4332  4d             dec      bp
1:4333  cb             retf     

; ===== FN 1:4334..4349 =====
1:4334  1e             push     ds
1:4335  58             pop      ax
1:4336  90             nop      
1:4337  45             inc      bp
1:4338  55             push     bp
1:4339  8bec           mov      bp, sp
1:433B  1e             push     ds
1:433C  8ed8           mov      ds, ax
1:433E  83ec06         sub      sp, 6
1:4341  4d             dec      bp
1:4342  4d             dec      bp
1:4343  8be5           mov      sp, bp
1:4345  1f             pop      ds
1:4346  5d             pop      bp
1:4347  4d             dec      bp
1:4348  cb             retf     

; ===== FN 1:4349..43C8 =====
1:4349  1e             push     ds
1:434A  58             pop      ax
1:434B  90             nop      
1:434C  45             inc      bp
1:434D  55             push     bp
1:434E  8bec           mov      bp, sp
1:4350  1e             push     ds
1:4351  8ed8           mov      ds, ax
1:4353  83ec0a         sub      sp, 0xa
1:4356  57             push     di
1:4357  56             push     si
1:4358  c746f60100     mov      word ptr [bp - 0xa], 1
1:435D  b103           mov      cl, 3
1:435F  8b5ef6         mov      bx, word ptr [bp - 0xa]
1:4362  d3e3           shl      bx, cl
1:4364  8b7608         mov      si, word ptr [bp + 8]
1:4367  8b4606         mov      ax, word ptr [bp + 6]
1:436A  8d38           lea      di, [bx + si]
1:436C  8bf0           mov      si, ax
1:436E  1e             push     ds
1:436F  07             pop      es
1:4370  a5             movsw    word ptr es:[di], word ptr [si]
1:4371  a5             movsw    word ptr es:[di], word ptr [si]
1:4372  a5             movsw    word ptr es:[di], word ptr [si]
1:4373  a5             movsw    word ptr es:[di], word ptr [si]
1:4374  ff46f6         inc      word ptr [bp - 0xa]
1:4377  837ef604       cmp      word ptr [bp - 0xa], 4
1:437B  7ee0           jle      0x435d
1:437D  8b5e06         mov      bx, word ptr [bp + 6]
1:4380  8b4702         mov      ax, word ptr [bx + 2]
1:4383  034706         add      ax, word ptr [bx + 6]
1:4386  99             cdq      
1:4387  2bc2           sub      ax, dx
1:4389  d1f8           sar      ax, 1
1:438B  8946fc         mov      word ptr [bp - 4], ax
1:438E  8bc8           mov      cx, ax
1:4390  8b4704         mov      ax, word ptr [bx + 4]
1:4393  0307           add      ax, word ptr [bx]
1:4395  99             cdq      
1:4396  2bc2           sub      ax, dx
1:4398  d1f8           sar      ax, 1
1:439A  8946fa         mov      word ptr [bp - 6], ax
1:439D  8b5e08         mov      bx, word ptr [bp + 8]
1:43A0  894f12         mov      word ptr [bx + 0x12], cx
1:43A3  8b46fa         mov      ax, word ptr [bp - 6]
1:43A6  894710         mov      word ptr [bx + 0x10], ax
1:43A9  8b4efc         mov      cx, word ptr [bp - 4]
1:43AC  894f1a         mov      word ptr [bx + 0x1a], cx
1:43AF  89471c         mov      word ptr [bx + 0x1c], ax
1:43B2  894f0e         mov      word ptr [bx + 0xe], cx
1:43B5  894708         mov      word ptr [bx + 8], ax
1:43B8  894f26         mov      word ptr [bx + 0x26], cx
1:43BB  894724         mov      word ptr [bx + 0x24], ax
1:43BE  5e             pop      si
1:43BF  5f             pop      di
1:43C0  4d             dec      bp
1:43C1  4d             dec      bp
1:43C2  8be5           mov      sp, bp
1:43C4  1f             pop      ds
1:43C5  5d             pop      bp
1:43C6  4d             dec      bp
1:43C7  cb             retf     

; ===== FN 1:43C8..4426 =====
1:43C8  1e             push     ds
1:43C9  58             pop      ax
1:43CA  90             nop      
1:43CB  45             inc      bp
1:43CC  55             push     bp
1:43CD  8bec           mov      bp, sp
1:43CF  1e             push     ds
1:43D0  8ed8           mov      ds, ax
1:43D2  8b4608         mov      ax, word ptr [bp + 8]
1:43D5  a3b008         mov      word ptr [0x8b0], ax
1:43D8  ff369208       push     word ptr [0x892]
1:43DC  8b4e06         mov      cx, word ptr [bp + 6]
1:43DF  890eb208       mov      word ptr [0x8b2], cx
1:43E3  030eb808       add      cx, word ptr [0x8b8]
1:43E7  51             push     cx
1:43E8  0306ba08       add      ax, word ptr [0x8ba]
1:43EC  50             push     ax
1:43ED  9affff0000     lcall    0, 0xffff  ; GDI.SetViewportOrg
1:43F2  4d             dec      bp
1:43F3  4d             dec      bp
1:43F4  8be5           mov      sp, bp
1:43F6  1f             pop      ds
1:43F7  5d             pop      bp
1:43F8  4d             dec      bp
1:43F9  cb             retf     
1:43FA  1e             push     ds
1:43FB  58             pop      ax
1:43FC  90             nop      
1:43FD  45             inc      bp
1:43FE  55             push     bp
1:43FF  8bec           mov      bp, sp
1:4401  1e             push     ds
1:4402  8ed8           mov      ds, ax
1:4404  8b5e06         mov      bx, word ptr [bp + 6]
1:4407  8a6703         mov      ah, byte ptr [bx + 3]
1:440A  2ac0           sub      al, al
1:440C  8a4f01         mov      cl, byte ptr [bx + 1]
1:440F  2aed           sub      ch, ch
1:4411  0bc1           or       ax, cx
1:4413  8a4f05         mov      cl, byte ptr [bx + 5]
1:4416  51             push     cx
1:4417  50             push     ax
1:4418  0e             push     cs
1:4419  e81dfd         call     0x4139
1:441C  5b             pop      bx
1:441D  5b             pop      bx
1:441E  4d             dec      bp
1:441F  4d             dec      bp
1:4420  8be5           mov      sp, bp
1:4422  1f             pop      ds
1:4423  5d             pop      bp
1:4424  4d             dec      bp
1:4425  cb             retf     

; ===== FN 1:4426..4486 =====
1:4426  1e             push     ds
1:4427  58             pop      ax
1:4428  90             nop      
1:4429  45             inc      bp
1:442A  55             push     bp
1:442B  8bec           mov      bp, sp
1:442D  1e             push     ds
1:442E  8ed8           mov      ds, ax
1:4430  833e100000     cmp      word ptr [0x10], 0
1:4435  7435           je       0x446c
1:4437  833e680000     cmp      word ptr [0x68], 0
1:443C  750b           jne      0x4449
1:443E  b80600         mov      ax, 6
1:4441  f76e06         imul     word ptr [bp + 6]
1:4444  056a00         add      ax, 0x6a
1:4447  eb2f           jmp      0x4478
1:4449  837e0602       cmp      word ptr [bp + 6], 2
1:444D  7e05           jle      0x4454
1:444F  c746060200     mov      word ptr [bp + 6], 2
1:4454  b83400         mov      ax, 0x34
1:4457  f72e6800       imul     word ptr [0x68]
1:445B  8bc8           mov      cx, ax
1:445D  b80600         mov      ax, 6
1:4460  f76e06         imul     word ptr [bp + 6]
1:4463  03c8           add      cx, ax
1:4465  81c1ce00       add      cx, 0xce
1:4469  51             push     cx
1:446A  eb0d           jmp      0x4479
1:446C  8a4606         mov      al, byte ptr [bp + 6]
1:446F  2401           and      al, 1
1:4471  b106           mov      cl, 6
1:4473  f6e1           mul      cl
1:4475  05ce00         add      ax, 0xce
1:4478  50             push     ax
1:4479  0e             push     cs
1:447A  e87dff         call     0x43fa
1:447D  5b             pop      bx
1:447E  4d             dec      bp
1:447F  4d             dec      bp
1:4480  8be5           mov      sp, bp
1:4482  1f             pop      ds
1:4483  5d             pop      bp
1:4484  4d             dec      bp
1:4485  cb             retf     

; ===== FN 1:4486..44CD =====
1:4486  1e             push     ds
1:4487  58             pop      ax
1:4488  90             nop      
1:4489  45             inc      bp
1:448A  55             push     bp
1:448B  8bec           mov      bp, sp
1:448D  1e             push     ds
1:448E  8ed8           mov      ds, ax
1:4490  833e100000     cmp      word ptr [0x10], 0
1:4495  7422           je       0x44b9
1:4497  833e680000     cmp      word ptr [0x68], 0
1:449C  741f           je       0x44bd
1:449E  b80100         mov      ax, 1
1:44A1  50             push     ax
1:44A2  0e             push     cs
1:44A3  e858fe         call     0x42fe
1:44A6  5b             pop      bx
1:44A7  0bc0           or       ax, ax
1:44A9  7412           je       0x44bd
1:44AB  ff365e00       push     word ptr [0x5e]
1:44AF  0e             push     cs
1:44B0  e84bfe         call     0x42fe
1:44B3  5b             pop      bx
1:44B4  894606         mov      word ptr [bp + 6], ax
1:44B7  eb04           jmp      0x44bd
1:44B9  83660601       and      word ptr [bp + 6], 1
1:44BD  ff7606         push     word ptr [bp + 6]
1:44C0  0e             push     cs
1:44C1  e862ff         call     0x4426
1:44C4  5b             pop      bx
1:44C5  4d             dec      bp
1:44C6  4d             dec      bp
1:44C7  8be5           mov      sp, bp
1:44C9  1f             pop      ds
1:44CA  5d             pop      bp
1:44CB  4d             dec      bp
1:44CC  cb             retf     

; ===== FN 1:44CD..4511 =====
1:44CD  1e             push     ds
1:44CE  58             pop      ax
1:44CF  90             nop      
1:44D0  45             inc      bp
1:44D1  55             push     bp
1:44D2  8bec           mov      bp, sp
1:44D4  1e             push     ds
1:44D5  8ed8           mov      ds, ax
1:44D7  83ec04         sub      sp, 4
1:44DA  833e100000     cmp      word ptr [0x10], 0
1:44DF  741f           je       0x4500
1:44E1  833e680001     cmp      word ptr [0x68], 1
1:44E6  7512           jne      0x44fa
1:44E8  b80100         mov      ax, 1
1:44EB  50             push     ax
1:44EC  0e             push     cs
1:44ED  e80efe         call     0x42fe
1:44F0  5b             pop      bx
1:44F1  0bc0           or       ax, ax
1:44F3  7405           je       0x44fa
1:44F5  a15e00         mov      ax, word ptr [0x5e]
1:44F8  eb0f           jmp      0x4509
1:44FA  ff365e00       push     word ptr [0x5e]
1:44FE  eb04           jmp      0x4504
1:4500  b80100         mov      ax, 1
1:4503  50             push     ax
1:4504  0e             push     cs
1:4505  e8f6fd         call     0x42fe
1:4508  5b             pop      bx
1:4509  4d             dec      bp
1:450A  4d             dec      bp
1:450B  8be5           mov      sp, bp
1:450D  1f             pop      ds
1:450E  5d             pop      bp
1:450F  4d             dec      bp
1:4510  cb             retf     

; ===== FN 1:4511..4565 =====
1:4511  1e             push     ds
1:4512  58             pop      ax
1:4513  90             nop      
1:4514  45             inc      bp
1:4515  55             push     bp
1:4516  8bec           mov      bp, sp
1:4518  1e             push     ds
1:4519  8ed8           mov      ds, ax
1:451B  57             push     di
1:451C  56             push     si
1:451D  c70668000100   mov      word ptr [0x68], 1
1:4523  b80600         mov      ax, 6
1:4526  f76e06         imul     word ptr [bp + 6]
1:4529  8bd8           mov      bx, ax
1:452B  b80e01         mov      ax, 0x10e
1:452E  8bf8           mov      di, ax
1:4530  8db76a00       lea      si, [bx + 0x6a]
1:4534  1e             push     ds
1:4535  07             pop      es
1:4536  a5             movsw    word ptr es:[di], word ptr [si]
1:4537  a5             movsw    word ptr es:[di], word ptr [si]
1:4538  a5             movsw    word ptr es:[di], word ptr [si]
1:4539  b80200         mov      ax, 2
1:453C  a35e00         mov      word ptr [0x5e], ax
1:453F  50             push     ax
1:4540  0e             push     cs
1:4541  e8bafd         call     0x42fe
1:4544  5b             pop      bx
1:4545  48             dec      ax
1:4546  7513           jne      0x455b
1:4548  837e0605       cmp      word ptr [bp + 6], 5
1:454C  740d           je       0x455b
1:454E  b80801         mov      ax, 0x108
1:4551  8bf8           mov      di, ax
1:4553  be8800         mov      si, 0x88
1:4556  1e             push     ds
1:4557  07             pop      es
1:4558  a5             movsw    word ptr es:[di], word ptr [si]
1:4559  a5             movsw    word ptr es:[di], word ptr [si]
1:455A  a5             movsw    word ptr es:[di], word ptr [si]
1:455B  5e             pop      si
1:455C  5f             pop      di
1:455D  4d             dec      bp
1:455E  4d             dec      bp
1:455F  8be5           mov      sp, bp
1:4561  1f             pop      ds
1:4562  5d             pop      bp
1:4563  4d             dec      bp
1:4564  cb             retf     

; ===== FN 1:4565..45CE =====
1:4565  1e             push     ds
1:4566  58             pop      ax
1:4567  90             nop      
1:4568  45             inc      bp
1:4569  55             push     bp
1:456A  8bec           mov      bp, sp
1:456C  1e             push     ds
1:456D  8ed8           mov      ds, ax
1:456F  83ec04         sub      sp, 4
1:4572  833e100000     cmp      word ptr [0x10], 0
1:4577  7437           je       0x45b0
1:4579  833e680000     cmp      word ptr [0x68], 0
1:457E  750b           jne      0x458b
1:4580  b80600         mov      ax, 6
1:4583  f76e0a         imul     word ptr [bp + 0xa]
1:4586  056a00         add      ax, 0x6a
1:4589  eb14           jmp      0x459f
1:458B  b83400         mov      ax, 0x34
1:458E  f72e6800       imul     word ptr [0x68]
1:4592  8bc8           mov      cx, ax
1:4594  b80600         mov      ax, 6
1:4597  f76e0a         imul     word ptr [bp + 0xa]
1:459A  03c1           add      ax, cx
1:459C  05ce00         add      ax, 0xce
1:459F  50             push     ax
1:45A0  ff7608         push     word ptr [bp + 8]
1:45A3  ff7606         push     word ptr [bp + 6]
1:45A6  9affff0000     lcall    0, 0xffff  ; INT:255:002F
1:45AB  83c406         add      sp, 6
1:45AE  eb15           jmp      0x45c5
1:45B0  ff760a         push     word ptr [bp + 0xa]
1:45B3  0e             push     cs
1:45B4  e86ffe         call     0x4426
1:45B7  5b             pop      bx
1:45B8  ff7608         push     word ptr [bp + 8]
1:45BB  ff7606         push     word ptr [bp + 6]
1:45BE  9affff0000     lcall    0, 0xffff  ; INT:255:002E
1:45C3  5b             pop      bx
1:45C4  5b             pop      bx
1:45C5  4d             dec      bp
1:45C6  4d             dec      bp
1:45C7  8be5           mov      sp, bp
1:45C9  1f             pop      ds
1:45CA  5d             pop      bp
1:45CB  4d             dec      bp
1:45CC  cb             retf     

; ===== FN 1:45CE..460C =====
1:45CE  1e             push     ds
1:45CF  58             pop      ax
1:45D0  90             nop      
1:45D1  45             inc      bp
1:45D2  55             push     bp
1:45D3  8bec           mov      bp, sp
1:45D5  1e             push     ds
1:45D6  8ed8           mov      ds, ax
1:45D8  837e0a00       cmp      word ptr [bp + 0xa], 0
1:45DC  7504           jne      0x45e2
1:45DE  2bc0           sub      ax, ax
1:45E0  eb09           jmp      0x45eb
1:45E2  8b460e         mov      ax, word ptr [bp + 0xe]
1:45E5  a3b408         mov      word ptr [0x8b4], ax
1:45E8  b80100         mov      ax, 1
1:45EB  4d             dec      bp
1:45EC  4d             dec      bp
1:45ED  8be5           mov      sp, bp
1:45EF  1f             pop      ds
1:45F0  5d             pop      bp
1:45F1  4d             dec      bp
1:45F2  ca0a00         retf     0xa
1:45F5  1e             push     ds
1:45F6  58             pop      ax
1:45F7  90             nop      
1:45F8  45             inc      bp
1:45F9  55             push     bp
1:45FA  8bec           mov      bp, sp
1:45FC  1e             push     ds
1:45FD  8ed8           mov      ds, ax
1:45FF  b80100         mov      ax, 1
1:4602  4d             dec      bp
1:4603  4d             dec      bp
1:4604  8be5           mov      sp, bp
1:4606  1f             pop      ds
1:4607  5d             pop      bp
1:4608  4d             dec      bp
1:4609  ca0200         retf     2

; ===== FN 1:460C..4780 =====
1:460C  1e             push     ds
1:460D  58             pop      ax
1:460E  90             nop      
1:460F  45             inc      bp
1:4610  55             push     bp
1:4611  8bec           mov      bp, sp
1:4613  1e             push     ds
1:4614  8ed8           mov      ds, ax
1:4616  83ec0a         sub      sp, 0xa
1:4619  56             push     si
1:461A  8b4608         mov      ax, word ptr [bp + 8]
1:461D  a39208         mov      word ptr [0x892], ax
1:4620  8b4606         mov      ax, word ptr [bp + 6]
1:4623  a39008         mov      word ptr [0x890], ax
1:4626  50             push     ax
1:4627  9a47460000     lcall    0, 0x4647  ; KERNEL.#18
1:462C  a3a608         mov      word ptr [0x8a6], ax
1:462F  8916a808       mov      word ptr [0x8a8], dx
1:4633  8bc2           mov      ax, dx
1:4635  0b06a608       or       ax, word ptr [0x8a6]
1:4639  7503           jne      0x463e
1:463B  e96a01         jmp      0x47a8
1:463E  c41ea608       les      bx, ptr [0x8a6]
1:4642  26ff7720       push     word ptr es:[bx + 0x20]
1:4646  9affff0000     lcall    0, 0xffff  ; KERNEL.#18
1:464B  a3c208         mov      word ptr [0x8c2], ax
1:464E  8916c408       mov      word ptr [0x8c4], dx
1:4652  8bc2           mov      ax, dx
1:4654  0b06c208       or       ax, word ptr [0x8c2]
1:4658  7503           jne      0x465d
1:465A  e94201         jmp      0x479f
1:465D  8b460a         mov      ax, word ptr [bp + 0xa]
1:4660  e90801         jmp      0x476b
1:4663  c41ea608       les      bx, ptr [0x8a6]
1:4667  26837f1465     cmp      word ptr es:[bx + 0x14], 0x65
1:466C  7c0f           jl       0x467d
1:466E  26817f36f400   cmp      word ptr es:[bx + 0x36], 0xf4
1:4674  7507           jne      0x467d
1:4676  26837f3878     cmp      word ptr es:[bx + 0x38], 0x78
1:467B  740e           je       0x468b
1:467D  c70698010000   mov      word ptr [0x198], 0
1:4683  c746fc0500     mov      word ptr [bp - 4], 5
1:4688  e90701         jmp      0x4792
1:468B  c70698010100   mov      word ptr [0x198], 1
1:4691  e9fe00         jmp      0x4792
1:4694  b85608         mov      ax, 0x856
1:4697  50             push     ax
1:4698  9affff0000     lcall    0, 0xffff  ; INT:255:0039
1:469D  5b             pop      bx
1:469E  ff365608       push     word ptr [0x856]
1:46A2  9affff0000     lcall    0, 0xffff  ; INT:255:0038
1:46A7  5b             pop      bx
1:46A8  9affff0000     lcall    0, 0xffff  ; INT:255:0037
1:46AD  eb13           jmp      0x46c2
1:46AF  9affff0000     lcall    0, 0xffff  ; INT:255:0036
1:46B4  eb0c           jmp      0x46c2
1:46B6  833e980100     cmp      word ptr [0x198], 0
1:46BB  740b           je       0x46c8
1:46BD  9affff0000     lcall    0, 0xffff  ; INT:255:0035
1:46C2  8946fc         mov      word ptr [bp - 4], ax
1:46C5  e9ca00         jmp      0x4792
1:46C8  ff369208       push     word ptr [0x892]
1:46CC  b800ff         mov      ax, 0xff00
1:46CF  baff00         mov      dx, 0xff
1:46D2  52             push     dx
1:46D3  50             push     ax
1:46D4  9affff0000     lcall    0, 0xffff  ; GDI.SetTextColor
1:46D9  ff369208       push     word ptr [0x892]
1:46DD  2bc0           sub      ax, ax
1:46DF  50             push     ax
1:46E0  50             push     ax
1:46E1  9affff0000     lcall    0, 0xffff  ; GDI.SetBkColor
1:46E6  ff369208       push     word ptr [0x892]
1:46EA  2bc0           sub      ax, ax
1:46EC  50             push     ax
1:46ED  9affff0000     lcall    0, 0xffff  ; GDI.SetTextAlign
1:46F2  ff369208       push     word ptr [0x892]
1:46F6  b80100         mov      ax, 1
1:46F9  50             push     ax
1:46FA  9affff0000     lcall    0, 0xffff  ; GDI.SetBkMode
1:46FF  ff369208       push     word ptr [0x892]
1:4703  2bc0           sub      ax, ax
1:4705  50             push     ax
1:4706  50             push     ax
1:4707  b89a01         mov      ax, 0x19a
1:470A  1e             push     ds
1:470B  50             push     ax
1:470C  50             push     ax
1:470D  9affff0000     lcall    0, 0xffff  ; INT:255:0034
1:4712  5b             pop      bx
1:4713  50             push     ax
1:4714  9affff0000     lcall    0, 0xffff  ; GDI.TextOut
1:4719  eb77           jmp      0x4792
1:471B  9affff0000     lcall    0, 0xffff  ; INT:255:0033
1:4720  eba0           jmp      0x46c2
1:4722  a1b408         mov      ax, word ptr [0x8b4]
1:4725  c41ec208       les      bx, ptr [0x8c2]
1:4729  26894716       mov      word ptr es:[bx + 0x16], ax
1:472D  c746f60000     mov      word ptr [bp - 0xa], 0
1:4732  8b46f6         mov      ax, word ptr [bp - 0xa]
1:4735  8bf0           mov      si, ax
1:4737  d1e6           shl      si, 1
1:4739  40             inc      ax
1:473A  c41ec208       les      bx, ptr [0x8c2]
1:473E  2689400e       mov      word ptr es:[bx + si + 0xe], ax
1:4742  ff46f6         inc      word ptr [bp - 0xa]
1:4745  837ef604       cmp      word ptr [bp - 0xa], 4
1:4749  7ce7           jl       0x4732
1:474B  9affff0000     lcall    0, 0xffff  ; INT:255:0032
1:4750  e96fff         jmp      0x46c2
1:4753  9affff0000     lcall    0, 0xffff  ; INT:255:0031
1:4758  e967ff         jmp      0x46c2
1:475B  8b460a         mov      ax, word ptr [bp + 0xa]
1:475E  2d0700         sub      ax, 7
1:4761  50             push     ax
1:4762  9affff0000     lcall    0, 0xffff  ; INT:255:0030
1:4767  5b             pop      bx
1:4768  e957ff         jmp      0x46c2
1:476B  3d0c00         cmp      ax, 0xc
1:476E  7722           ja       0x4792
1:4770  d1e0           shl      ax, 1
1:4772  93             xchg     bx, ax
1:4773  2effa77847     jmp      word ptr cs:[bx + 0x4778]
1:4778  94             xchg     sp, ax
1:4779  46             inc      si
1:477A  af             scasw    ax, word ptr es:[di]
1:477B  46             inc      si
1:477C  b646           mov      dh, 0x46
1:477F  47             inc      di
