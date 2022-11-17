00000000  E8A210            call word 0x10a5
00000003  0000              add [bx+si],al
00000005  EBFE              jmp short 0x5
00000007  55                push bp
00000008  89E5              mov bp,sp
0000000A  83EC08            sub sp,byte +0x8
0000000D  8B5508            mov dx,[di+0x8]
00000010  8B450C            mov ax,[di+0xc]
00000013  668955FC          mov [di-0x4],edx
00000017  8845F8            mov [di-0x8],al
0000001A  0FB645F8          movzx ax,[di-0x8]
0000001E  0F                db 0x0f
0000001F  B755              mov bh,0x55
00000021  FC                cld
00000022  EE                out dx,al
00000023  90                nop
00000024  C9                leave
00000025  C3                ret
00000026  55                push bp
00000027  89E5              mov bp,sp
00000029  83EC08            sub sp,byte +0x8
0000002C  C744240400        mov word [si+0x24],0x4
00000031  0000              add [bx+si],al
00000033  00C7              add bh,al
00000035  0424              add al,0x24
00000037  800000            add byte [bx+si],0x0
0000003A  00E8              add al,ch
0000003C  C7                db 0xc7
0000003D  FF                db 0xff
0000003E  FF                db 0xff
0000003F  FFC9              dec cx
00000041  C3                ret
00000042  55                push bp
00000043  89E5              mov bp,sp
00000045  83EC14            sub sp,byte +0x14
00000048  8B4508            mov ax,[di+0x8]
0000004B  668945EC          mov [di-0x14],eax
0000004F  0F                db 0x0f
00000050  B745              mov bh,0x45
00000052  EC                in al,dx
00000053  89C2              mov dx,ax
00000055  EC                in al,dx
00000056  8845FF            mov [di-0x1],al
00000059  0FB645FF          movzx ax,[di-0x1]
0000005D  C9                leave
0000005E  C3                ret
0000005F  55                push bp
00000060  89E5              mov bp,sp
00000062  83EC10            sub sp,byte +0x10
00000065  9C                pushfw
00000066  6658              pop eax
00000068  668945FE          mov [di-0x2],eax
0000006C  0F                db 0x0f
0000006D  B745              mov bh,0x45
0000006F  FE                db 0xfe
00000070  66250002C9C3      and eax,0xc3c90200
00000076  55                push bp
00000077  89E5              mov bp,sp
00000079  83EC0C            sub sp,byte +0xc
0000007C  8B4508            mov ax,[di+0x8]
0000007F  8845FC            mov [di-0x4],al
00000082  0FB645FC          movzx ax,[di-0x4]
00000086  0FB6C0            movzx ax,al
00000089  894424            mov [si+0x24],ax
0000008C  04C7              add al,0xc7
0000008E  0424              add al,0x24
00000090  F8                clc
00000091  0300              add ax,[bx+si]
00000093  00E8              add al,ch
00000095  6E                outsb
00000096  FF                db 0xff
00000097  FF                db 0xff
00000098  FFC9              dec cx
0000009A  C3                ret
0000009B  55                push bp
0000009C  89E5              mov bp,sp
0000009E  83EC04            sub sp,byte +0x4
000000A1  EB15              jmp short 0xb8
000000A3  8B4508            mov ax,[di+0x8]
000000A6  0FB600            movzx ax,[bx+si]
000000A9  0FBEC0            movsx ax,al
000000AC  8904              mov [si],ax
000000AE  24E8              and al,0xe8
000000B0  C2FFFF            ret 0xffff
000000B3  FF834508          inc word [bp+di+0x845]
000000B7  018B4508          add [bp+di+0x845],cx
000000BB  0FB600            movzx ax,[bx+si]
000000BE  84C0              test al,al
000000C0  75E1              jnz 0xa3
000000C2  C9                leave
000000C3  C3                ret
000000C4  55                push bp
000000C5  89E5              mov bp,sp
000000C7  83EC08            sub sp,byte +0x8
000000CA  8B4508            mov ax,[di+0x8]
000000CD  8845FC            mov [di-0x4],al
000000D0  807DFC09          cmp byte [di-0x4],0x9
000000D4  7714              ja 0xea
000000D6  0FB645FC          movzx ax,[di-0x4]
000000DA  83C030            add ax,byte +0x30
000000DD  0FBEC0            movsx ax,al
000000E0  8904              mov [si],ax
000000E2  24E8              and al,0xe8
000000E4  8EFF              mov segr7,di
000000E6  FF                db 0xff
000000E7  FF                db 0xff
000000E8  EB26              jmp short 0x110
000000EA  807DFC0F          cmp byte [di-0x4],0xf
000000EE  7714              ja 0x104
000000F0  0FB645FC          movzx ax,[di-0x4]
000000F4  83C057            add ax,byte +0x57
000000F7  0FBEC0            movsx ax,al
000000FA  8904              mov [si],ax
000000FC  24E8              and al,0xe8
000000FE  74FF              jz 0xff
00000100  FF                db 0xff
00000101  FF                db 0xff
00000102  EB0C              jmp short 0x110
00000104  C704243F          mov word [si],0x3f24
00000108  0000              add [bx+si],al
0000010A  00E8              add al,ch
0000010C  66                o32
0000010D  FF                db 0xff
0000010E  FF                db 0xff
0000010F  FFC9              dec cx
00000111  C3                ret
00000112  55                push bp
00000113  89E5              mov bp,sp
00000115  83EC14            sub sp,byte +0x14
00000118  C745FC0000        mov word [di-0x4],0x0
0000011D  0000              add [bx+si],al
0000011F  EB1E              jmp short 0x13f
00000121  8B45FC            mov ax,[di-0x4]
00000124  8D5001            lea dx,[bx+si+0x1]
00000127  8955FC            mov [di-0x4],dx
0000012A  89C2              mov dx,ax
0000012C  8B4508            mov ax,[di+0x8]
0000012F  01D0              add ax,dx
00000131  0FB600            movzx ax,[bx+si]
00000134  0FBEC0            movsx ax,al
00000137  8904              mov [si],ax
00000139  24E8              and al,0xe8
0000013B  37                aaa
0000013C  FF                db 0xff
0000013D  FF                db 0xff
0000013E  FF8B55FC          dec word [bp+di-0x3ab]
00000142  8B4508            mov ax,[di+0x8]
00000145  01D0              add ax,dx
00000147  0FB600            movzx ax,[bx+si]
0000014A  84C0              test al,al
0000014C  75D3              jnz 0x121
0000014E  C704249C          mov word [si],0x9c24
00000152  2200              and al,[bx+si]
00000154  00E8              add al,ch
00000156  41                inc cx
00000157  FF                db 0xff
00000158  FF                db 0xff
00000159  FFC9              dec cx
0000015B  C3                ret
0000015C  55                push bp
0000015D  89E5              mov bp,sp
0000015F  83EC14            sub sp,byte +0x14
00000162  C745FC0800        mov word [di-0x4],0x8
00000167  0000              add [bx+si],al
00000169  C745F80000        mov word [di-0x8],0x0
0000016E  00F0              add al,dh
00000170  EB23              jmp short 0x195
00000172  8B45F8            mov ax,[di-0x8]
00000175  8B5508            mov dx,[di+0x8]
00000178  21C2              and dx,ax
0000017A  8B45FC            mov ax,[di-0x4]
0000017D  C1E002            shl ax,byte 0x2
00000180  89C1              mov cx,ax
00000182  D3EA              shr dx,cl
00000184  89D0              mov ax,dx
00000186  0FB6C0            movzx ax,al
00000189  8904              mov [si],ax
0000018B  24E8              and al,0xe8
0000018D  33FF              xor di,di
0000018F  FF                db 0xff
00000190  FFC1              inc cx
00000192  6D                insw
00000193  F8                clc
00000194  048B              add al,0x8b
00000196  45                inc bp
00000197  FC                cld
00000198  8D50FF            lea dx,[bx+si-0x1]
0000019B  8955FC            mov [di-0x4],dx
0000019E  85C0              test ax,ax
000001A0  75D0              jnz 0x172
000001A2  C9                leave
000001A3  C3                ret
000001A4  55                push bp
000001A5  89E5              mov bp,sp
000001A7  83EC10            sub sp,byte +0x10
000001AA  C745FC0000        mov word [di-0x4],0x0
000001AF  0000              add [bx+si],al
000001B1  EB08              jmp short 0x1bb
000001B3  83450801          add word [di+0x8],byte +0x1
000001B7  8345FC01          add word [di-0x4],byte +0x1
000001BB  8B4508            mov ax,[di+0x8]
000001BE  0FB600            movzx ax,[bx+si]
000001C1  84C0              test al,al
000001C3  75EE              jnz 0x1b3
000001C5  8B45FC            mov ax,[di-0x4]
000001C8  C9                leave
000001C9  C3                ret
000001CA  55                push bp
000001CB  89E5              mov bp,sp
000001CD  83EC0C            sub sp,byte +0xc
000001D0  8B4508            mov ax,[di+0x8]
000001D3  8845FC            mov [di-0x4],al
000001D6  807DFC07          cmp byte [di-0x4],0x7
000001DA  7614              jna 0x1f0
000001DC  C744240420        mov word [si+0x24],0x2004
000001E1  0000              add [bx+si],al
000001E3  00C7              add bh,al
000001E5  0424              add al,0x24
000001E7  A00000            mov al,[0x0]
000001EA  00E8              add al,ch
000001EC  17                pop ss
000001ED  FE                db 0xfe
000001EE  FF                db 0xff
000001EF  FFC7              inc di
000001F1  44                inc sp
000001F2  2404              and al,0x4
000001F4  2000              and [bx+si],al
000001F6  0000              add [bx+si],al
000001F8  C7042420          mov word [si],0x2024
000001FC  0000              add [bx+si],al
000001FE  00E8              add al,ch
00000200  03FE              add di,si
00000202  FF                db 0xff
00000203  FFC9              dec cx
00000205  C3                ret
00000206  55                push bp
00000207  89E5              mov bp,sp
00000209  83EC10            sub sp,byte +0x10
0000020C  8B5508            mov dx,[di+0x8]
0000020F  8B450C            mov ax,[di+0xc]
00000212  668955FC          mov [di-0x4],edx
00000216  8845F8            mov [di-0x8],al
00000219  0FB655F8          movzx dx,[di-0x8]
0000021D  0F                db 0x0f
0000021E  B745              mov bh,0x45
00000220  FC                cld
00000221  895424            mov [si+0x24],dx
00000224  0489              add al,0x89
00000226  0424              add al,0x24
00000228  E8DAFD            call word 0x5
0000022B  FF                db 0xff
0000022C  FF                db 0xff
0000022D  E8F4FD            call word 0x24
00000230  FF                db 0xff
00000231  FFC9              dec cx
00000233  C3                ret
00000234  55                push bp
00000235  89E5              mov bp,sp
00000237  53                push bx
00000238  83EC1C            sub sp,byte +0x1c
0000023B  8B4508            mov ax,[di+0x8]
0000023E  8845E8            mov [di-0x18],al
00000241  807DE807          cmp byte [di-0x18],0x7
00000245  7708              ja 0x24f
00000247  66C745FA2100EB0A  mov dword [di-0x6],0xaeb0021
0000024F  66C745FAA100806D  mov dword [di-0x6],0x6d8000a1
00000257  E8080F            call word 0x1162
0000025A  B745              mov bh,0x45
0000025C  FA                cli
0000025D  8904              mov [si],ax
0000025F  24E8              and al,0xe8
00000261  DD                db 0xdd
00000262  FD                std
00000263  FF                db 0xff
00000264  FF89C20F          dec word [bx+di+0xfc2]
00000268  B645              mov dh,0x45
0000026A  E8BB01            call word 0x428
0000026D  0000              add [bx+si],al
0000026F  0089C1D3          add [bx+di-0x2c3f],cl
00000273  E389              jcxz 0x1fe
00000275  D809              fmul dword [bx+di]
00000277  D08845F9          ror byte [bx+si-0x6bb],1
0000027B  0FB655F9          movzx dx,[di-0x7]
0000027F  0F                db 0x0f
00000280  B745              mov bh,0x45
00000282  FA                cli
00000283  895424            mov [si+0x24],dx
00000286  0489              add al,0x89
00000288  0424              add al,0x24
0000028A  E878FD            call word 0x5
0000028D  FF                db 0xff
0000028E  FF83C41C          inc word [bp+di+0x1cc4]
00000292  5B                pop bx
00000293  5D                pop bp
00000294  C3                ret
00000295  55                push bp
00000296  89E5              mov bp,sp
00000298  53                push bx
00000299  83EC1C            sub sp,byte +0x1c
0000029C  8B4508            mov ax,[di+0x8]
0000029F  8845E8            mov [di-0x18],al
000002A2  807DE807          cmp byte [di-0x18],0x7
000002A6  7708              ja 0x2b0
000002A8  66C745FA2100EB0A  mov dword [di-0x6],0xaeb0021
000002B0  66C745FAA100806D  mov dword [di-0x6],0x6d8000a1
000002B8  E8080F            call word 0x11c3
000002BB  B745              mov bh,0x45
000002BD  FA                cli
000002BE  8904              mov [si],ax
000002C0  24E8              and al,0xe8
000002C2  7CFD              jl 0x2c1
000002C4  FF                db 0xff
000002C5  FF89C20F          dec word [bx+di+0xfc2]
000002C9  B645              mov dh,0x45
000002CB  E8BB01            call word 0x489
000002CE  0000              add [bx+si],al
000002D0  0089C1D3          add [bx+di-0x2c3f],cl
000002D4  E389              jcxz 0x25f
000002D6  D8F7              fdiv st7
000002D8  D021              shl byte [bx+di],1
000002DA  D08845F9          ror byte [bx+si-0x6bb],1
000002DE  0FB655F9          movzx dx,[di-0x7]
000002E2  0F                db 0x0f
000002E3  B745              mov bh,0x45
000002E5  FA                cli
000002E6  895424            mov [si+0x24],dx
000002E9  0489              add al,0x89
000002EB  0424              add al,0x24
000002ED  E815FD            call word 0x5
000002F0  FF                db 0xff
000002F1  FF83C41C          inc word [bp+di+0x1cc4]
000002F5  5B                pop bx
000002F6  5D                pop bp
000002F7  C3                ret
000002F8  55                push bp
000002F9  89E5              mov bp,sp
000002FB  53                push bx
000002FC  83EC18            sub sp,byte +0x18
000002FF  8B4508            mov ax,[di+0x8]
00000302  8845E8            mov [di-0x18],al
00000305  807DE807          cmp byte [di-0x18],0x7
00000309  7708              ja 0x313
0000030B  66C745FA2100EB0A  mov dword [di-0x6],0xaeb0021
00000313  66C745FAA100806D  mov dword [di-0x6],0x6d8000a1
0000031B  E8080F            call word 0x1226
0000031E  B745              mov bh,0x45
00000320  FA                cli
00000321  8904              mov [si],ax
00000323  24E8              and al,0xe8
00000325  19FD              sbb bp,di
00000327  FF                db 0xff
00000328  FF89C20F          dec word [bx+di+0xfc2]
0000032C  B645              mov dh,0x45
0000032E  E8BB01            call word 0x4ec
00000331  0000              add [bx+si],al
00000333  0089C1D3          add [bx+di-0x2c3f],cl
00000337  E389              jcxz 0x2c2
00000339  D821              fsub dword [bx+di]
0000033B  D083C418          rol byte [bp+di+0x18c4],1
0000033F  5B                pop bx
00000340  5D                pop bp
00000341  C3                ret
00000342  55                push bp
00000343  89E5              mov bp,sp
00000345  83EC14            sub sp,byte +0x14
00000348  C645FF00          mov byte [di-0x1],0x0
0000034C  EB34              jmp short 0x382
0000034E  0FB645FF          movzx ax,[di-0x1]
00000352  8904              mov [si],ax
00000354  24E8              and al,0xe8
00000356  9E                sahf
00000357  FF                db 0xff
00000358  FF                db 0xff
00000359  FF84C074          inc word [si+0x74c0]
0000035D  0E                push cs
0000035E  C7042431          mov word [si],0x3124
00000362  0000              add [bx+si],al
00000364  00E8              add al,ch
00000366  0CFD              or al,0xfd
00000368  FF                db 0xff
00000369  FF                db 0xff
0000036A  EB0C              jmp short 0x378
0000036C  C7042430          mov word [si],0x3024
00000370  0000              add [bx+si],al
00000372  00E8              add al,ch
00000374  FE                db 0xfe
00000375  FC                cld
00000376  FF                db 0xff
00000377  FF0F              dec word [bx]
00000379  B645              mov dh,0x45
0000037B  FF83C001          inc word [bp+di+0x1c0]
0000037F  8845FF            mov [di-0x1],al
00000382  807DFF0F          cmp byte [di-0x1],0xf
00000386  76C6              jna 0x34e
00000388  C9                leave
00000389  C3                ret
0000038A  55                push bp
0000038B  89E5              mov bp,sp
0000038D  83EC18            sub sp,byte +0x18
00000390  C7042421          mov word [si],0x2124
00000394  0000              add [bx+si],al
00000396  00E8              add al,ch
00000398  A6                cmpsb
00000399  FC                cld
0000039A  FF                db 0xff
0000039B  FF8845FF          dec word [bx+si-0xbb]
0000039F  E882FC            call word 0x24
000003A2  FF                db 0xff
000003A3  FFC7              inc di
000003A5  0424              add al,0x24
000003A7  A10000            mov ax,[0x0]
000003AA  00E8              add al,ch
000003AC  92                xchg ax,dx
000003AD  FC                cld
000003AE  FF                db 0xff
000003AF  FF8845FE          dec word [bx+si-0x1bb]
000003B3  E86EFC            call word 0x24
000003B6  FF                db 0xff
000003B7  FFC7              inc di
000003B9  44                inc sp
000003BA  2404              and al,0x4
000003BC  1100              adc [bx+si],ax
000003BE  0000              add [bx+si],al
000003C0  C7042420          mov word [si],0x2024
000003C4  0000              add [bx+si],al
000003C6  00E8              add al,ch
000003C8  3AFE              cmp bh,dh
000003CA  FF                db 0xff
000003CB  FFC7              inc di
000003CD  44                inc sp
000003CE  2404              and al,0x4
000003D0  1100              adc [bx+si],ax
000003D2  0000              add [bx+si],al
000003D4  C70424A0          mov word [si],0xa024
000003D8  0000              add [bx+si],al
000003DA  00E8              add al,ch
000003DC  26                es
000003DD  FE                db 0xfe
000003DE  FF                db 0xff
000003DF  FF8B4508          dec word [bp+di+0x845]
000003E3  0FB6C0            movzx ax,al
000003E6  894424            mov [si+0x24],ax
000003E9  04C7              add al,0xc7
000003EB  0424              add al,0x24
000003ED  2100              and [bx+si],ax
000003EF  0000              add [bx+si],al
000003F1  E810FE            call word 0x204
000003F4  FF                db 0xff
000003F5  FF8B450C          dec word [bp+di+0xc45]
000003F9  0FB6C0            movzx ax,al
000003FC  894424            mov [si+0x24],ax
000003FF  04C7              add al,0xc7
00000401  0424              add al,0x24
00000403  A10000            mov ax,[0x0]
00000406  00E8              add al,ch
00000408  FA                cli
00000409  FD                std
0000040A  FF                db 0xff
0000040B  FFC7              inc di
0000040D  44                inc sp
0000040E  2404              and al,0x4
00000410  0400              add al,0x0
00000412  0000              add [bx+si],al
00000414  C7042421          mov word [si],0x2124
00000418  0000              add [bx+si],al
0000041A  00E8              add al,ch
0000041C  E6FD              out 0xfd,al
0000041E  FF                db 0xff
0000041F  FFC7              inc di
00000421  44                inc sp
00000422  2404              and al,0x4
00000424  0200              add al,[bx+si]
00000426  0000              add [bx+si],al
00000428  C70424A1          mov word [si],0xa124
0000042C  0000              add [bx+si],al
0000042E  00E8              add al,ch
00000430  D2FD              sar ch,cl
00000432  FF                db 0xff
00000433  FFC7              inc di
00000435  44                inc sp
00000436  2404              and al,0x4
00000438  0100              add [bx+si],ax
0000043A  0000              add [bx+si],al
0000043C  C7042421          mov word [si],0x2124
00000440  0000              add [bx+si],al
00000442  00E8              add al,ch
00000444  BEFDFF            mov si,0xfffd
00000447  FFC7              inc di
00000449  44                inc sp
0000044A  2404              and al,0x4
0000044C  0100              add [bx+si],ax
0000044E  0000              add [bx+si],al
00000450  C70424A1          mov word [si],0xa124
00000454  0000              add [bx+si],al
00000456  00E8              add al,ch
00000458  AA                stosb
00000459  FD                std
0000045A  FF                db 0xff
0000045B  FF0F              dec word [bx]
0000045D  B645              mov dh,0x45
0000045F  FF894424          dec word [bx+di+0x2444]
00000463  04C7              add al,0xc7
00000465  0424              add al,0x24
00000467  2100              and [bx+si],ax
00000469  0000              add [bx+si],al
0000046B  E896FD            call word 0x204
0000046E  FF                db 0xff
0000046F  FF0F              dec word [bx]
00000471  B645              mov dh,0x45
00000473  FE894424          dec byte [bx+di+0x2444]
00000477  04C7              add al,0xc7
00000479  0424              add al,0x24
0000047B  A10000            mov ax,[0x0]
0000047E  00E8              add al,ch
00000480  82                db 0x82
00000481  FD                std
00000482  FF                db 0xff
00000483  FFC9              dec cx
00000485  C3                ret
00000486  55                push bp
00000487  89E5              mov bp,sp
00000489  FB                sti
0000048A  5D                pop bp
0000048B  C3                ret
0000048C  55                push bp
0000048D  89E5              mov bp,sp
0000048F  FA                cli
00000490  5D                pop bp
00000491  C3                ret
00000492  55                push bp
00000493  89E5              mov bp,sp
00000495  83EC14            sub sp,byte +0x14
00000498  C645FF00          mov byte [di-0x1],0x0
0000049C  EB0F              jmp short 0x4ad
0000049E  C7042460          mov word [si],0x6024
000004A2  0000              add [bx+si],al
000004A4  00E8              add al,ch
000004A6  98                cbw
000004A7  FB                sti
000004A8  FF                db 0xff
000004A9  FF8845FF          dec word [bx+si-0xbb]
000004AD  C7042464          mov word [si],0x6424
000004B1  0000              add [bx+si],al
000004B3  00E8              add al,ch
000004B5  89FB              mov bx,di
000004B7  FF                db 0xff
000004B8  FF0F              dec word [bx]
000004BA  B6C0              mov dh,0xc0
000004BC  83E001            and ax,byte +0x1
000004BF  85C0              test ax,ax
000004C1  75DB              jnz 0x49e
000004C3  0FB645FF          movzx ax,[di-0x1]
000004C7  C9                leave
000004C8  C3                ret
000004C9  55                push bp
000004CA  89E5              mov bp,sp
000004CC  83EC04            sub sp,byte +0x4
000004CF  EB05              jmp short 0x4d6
000004D1  E850FB            call word 0x24
000004D4  FF                db 0xff
000004D5  FFC7              inc di
000004D7  0424              add al,0x24
000004D9  640000            add [fs:bx+si],al
000004DC  00E8              add al,ch
000004DE  60                pushaw
000004DF  FB                sti
000004E0  FF                db 0xff
000004E1  FF0F              dec word [bx]
000004E3  B6C0              mov dh,0xc0
000004E5  83E002            and ax,byte +0x2
000004E8  85C0              test ax,ax
000004EA  75E5              jnz 0x4d1
000004EC  C9                leave
000004ED  C3                ret
000004EE  55                push bp
000004EF  89E5              mov bp,sp
000004F1  83EC04            sub sp,byte +0x4
000004F4  90                nop
000004F5  C7042464          mov word [si],0x6424
000004F9  0000              add [bx+si],al
000004FB  00E8              add al,ch
000004FD  41                inc cx
000004FE  FB                sti
000004FF  FF                db 0xff
00000500  FFC7              inc di
00000502  0424              add al,0x24
00000504  60                pushaw
00000505  0000              add [bx+si],al
00000507  00E8              add al,ch
00000509  35FBFF            xor ax,0xfffb
0000050C  FFC9              dec cx
0000050E  C3                ret
0000050F  55                push bp
00000510  89E5              mov bp,sp
00000512  83EC0C            sub sp,byte +0xc
00000515  8B4508            mov ax,[di+0x8]
00000518  8845FC            mov [di-0x4],al
0000051B  0FB645FC          movzx ax,[di-0x4]
0000051F  894424            mov [si+0x24],ax
00000522  04C7              add al,0xc7
00000524  0424              add al,0x24
00000526  60                pushaw
00000527  0000              add [bx+si],al
00000529  00E8              add al,ch
0000052B  D8FA              fdivr st2
0000052D  FF                db 0xff
0000052E  FF                db 0xff
0000052F  EB05              jmp short 0x536
00000531  E8F0FA            call word 0x24
00000534  FF                db 0xff
00000535  FFC7              inc di
00000537  0424              add al,0x24
00000539  640000            add [fs:bx+si],al
0000053C  00E8              add al,ch
0000053E  00FB              add bl,bh
00000540  FF                db 0xff
00000541  FF0F              dec word [bx]
00000543  B6C0              mov dh,0xc0
00000545  83E002            and ax,byte +0x2
00000548  85C0              test ax,ax
0000054A  75E5              jnz 0x531
0000054C  C9                leave
0000054D  C3                ret
0000054E  55                push bp
0000054F  89E5              mov bp,sp
00000551  83EC0C            sub sp,byte +0xc
00000554  8B4508            mov ax,[di+0x8]
00000557  8845FC            mov [di-0x4],al
0000055A  0FB645FC          movzx ax,[di-0x4]
0000055E  894424            mov [si+0x24],ax
00000561  04C7              add al,0xc7
00000563  0424              add al,0x24
00000565  640000            add [fs:bx+si],al
00000568  00E8              add al,ch
0000056A  99                cwd
0000056B  FA                cli
0000056C  FF                db 0xff
0000056D  FF                db 0xff
0000056E  EB05              jmp short 0x575
00000570  E8B1FA            call word 0x24
00000573  FF                db 0xff
00000574  FFC7              inc di
00000576  0424              add al,0x24
00000578  640000            add [fs:bx+si],al
0000057B  00E8              add al,ch
0000057D  C1FAFF            sar dx,byte 0xff
00000580  FF0F              dec word [bx]
00000582  B6C0              mov dh,0xc0
00000584  83E002            and ax,byte +0x2
00000587  85C0              test ax,ax
00000589  75E5              jnz 0x570
0000058B  C9                leave
0000058C  C3                ret
0000058D  55                push bp
0000058E  89E5              mov bp,sp
00000590  83EC0C            sub sp,byte +0xc
00000593  8B4508            mov ax,[di+0x8]
00000596  8845FC            mov [di-0x4],al
00000599  E8F4FE            call word 0x490
0000059C  FF                db 0xff
0000059D  FF                db 0xff
0000059E  E826FF            call word 0x4c7
000005A1  FF                db 0xff
000005A2  FF0F              dec word [bx]
000005A4  B645              mov dh,0x45
000005A6  FC                cld
000005A7  894424            mov [si+0x24],ax
000005AA  04C7              add al,0xc7
000005AC  0424              add al,0x24
000005AE  640000            add [fs:bx+si],al
000005B1  00E8              add al,ch
000005B3  50                push ax
000005B4  FA                cli
000005B5  FF                db 0xff
000005B6  FFC9              dec cx
000005B8  C3                ret
000005B9  55                push bp
000005BA  89E5              mov bp,sp
000005BC  83EC0C            sub sp,byte +0xc
000005BF  8B4508            mov ax,[di+0x8]
000005C2  8845FC            mov [di-0x4],al
000005C5  E8C8FE            call word 0x490
000005C8  FF                db 0xff
000005C9  FF0F              dec word [bx]
000005CB  B645              mov dh,0x45
000005CD  FC                cld
000005CE  894424            mov [si+0x24],ax
000005D1  04C7              add al,0xc7
000005D3  0424              add al,0x24
000005D5  60                pushaw
000005D6  0000              add [bx+si],al
000005D8  00E8              add al,ch
000005DA  29FA              sub dx,di
000005DC  FF                db 0xff
000005DD  FFC9              dec cx
000005DF  C3                ret
000005E0  55                push bp
000005E1  89E5              mov bp,sp
000005E3  83EC14            sub sp,byte +0x14
000005E6  C7042420          mov word [si],0x2024
000005EA  0000              add [bx+si],al
000005EC  00E8              add al,ch
000005EE  5C                pop sp
000005EF  FF                db 0xff
000005F0  FF                db 0xff
000005F1  FF                db 0xff
000005F2  E8F7FE            call word 0x4ec
000005F5  FF                db 0xff
000005F6  FF8845FF          dec word [bx+si-0xbb]
000005FA  0FB645FF          movzx ax,[di-0x1]
000005FE  C9                leave
000005FF  C3                ret
00000600  55                push bp
00000601  89E5              mov bp,sp
00000603  83EC04            sub sp,byte +0x4
00000606  C70424F0          mov word [si],0xf024
0000060A  0000              add [bx+si],al
0000060C  00E8              add al,ch
0000060E  3CFF              cmp al,0xff
00000610  FF                db 0xff
00000611  FFC7              inc di
00000613  0424              add al,0x24
00000615  60                pushaw
00000616  0000              add [bx+si],al
00000618  00E8              add al,ch
0000061A  24FA              and al,0xfa
0000061C  FF                db 0xff
0000061D  FF0F              dec word [bx]
0000061F  B6C0              mov dh,0xc0
00000621  8904              mov [si],ax
00000623  24E8              and al,0xe8
00000625  33FB              xor di,bx
00000627  FF                db 0xff
00000628  FFC7              inc di
0000062A  0424              add al,0x24
0000062C  9F                lahf
0000062D  2200              and al,[bx+si]
0000062F  00E8              add al,ch
00000631  DD                db 0xdd
00000632  FA                cli
00000633  FF                db 0xff
00000634  FFC9              dec cx
00000636  C3                ret
00000637  55                push bp
00000638  89E5              mov bp,sp
0000063A  83EC14            sub sp,byte +0x14
0000063D  C70424B1          mov word [si],0xb124
00000641  2200              and al,[bx+si]
00000643  00E8              add al,ch
00000645  C9                leave
00000646  FA                cli
00000647  FF                db 0xff
00000648  FF66C7            jmp word [bp-0x39]
0000064B  45                inc bp
0000064C  FE00              inc byte [bx+si]
0000064E  00C7              add bh,al
00000650  0424              add al,0x24
00000652  F5                cmc
00000653  0000              add [bx+si],al
00000655  00E8              add al,ch
00000657  B4FE              mov ah,0xfe
00000659  FF                db 0xff
0000065A  FF                db 0xff
0000065B  E88EFE            call word 0x4ec
0000065E  FF                db 0xff
0000065F  FF                db 0xff
00000660  3CFA              cmp al,0xfa
00000662  740C              jz 0x670
00000664  C70424C1          mov word [si],0xc124
00000668  2200              and al,[bx+si]
0000066A  00E8              add al,ch
0000066C  A2FAFF            mov [0xfffa],al
0000066F  FFC7              inc di
00000671  0424              add al,0x24
00000673  F20000            repne add [bx+si],al
00000676  00E8              add al,ch
00000678  93                xchg ax,bx
00000679  FE                db 0xfe
0000067A  FF                db 0xff
0000067B  FF                db 0xff
0000067C  E86DFE            call word 0x4ec
0000067F  FF                db 0xff
00000680  FF                db 0xff
00000681  3CFA              cmp al,0xfa
00000683  740C              jz 0x691
00000685  C70424D5          mov word [si],0xd524
00000689  2200              and al,[bx+si]
0000068B  00E8              add al,ch
0000068D  81FAFFFF          cmp dx,0xffff
00000691  C745F80200        mov word [di-0x8],0x2
00000696  0000              add [bx+si],al
00000698  EB1C              jmp short 0x6b6
0000069A  66C16DFE08        shr dword [di-0x2],byte 0x8
0000069F  E84AFE            call word 0x4ec
000006A2  FF                db 0xff
000006A3  FF0F              dec word [bx]
000006A5  B6C0              mov dh,0xc0
000006A7  C1E008            shl ax,byte 0x8
000006AA  89C2              mov dx,ax
000006AC  0F                db 0x0f
000006AD  B745              mov bh,0x45
000006AF  FE09              dec byte [bx+di]
000006B1  D06689            shl byte [bp-0x77],1
000006B4  45                inc bp
000006B5  FE8B45F8          dec byte [bp+di-0x7bb]
000006B9  8D50FF            lea dx,[bx+si-0x1]
000006BC  8955F8            mov [di-0x8],dx
000006BF  85C0              test ax,ax
000006C1  75D7              jnz 0x69a
000006C3  0F                db 0x0f
000006C4  B745              mov bh,0x45
000006C6  FE890424          dec byte [bx+di+0x2404]
000006CA  E88DFA            call word 0x15a
000006CD  FF                db 0xff
000006CE  FFC7              inc di
000006D0  0424              add al,0x24
000006D2  E82200            call word 0x6f7
000006D5  00E8              add al,ch
000006D7  37                aaa
000006D8  FA                cli
000006D9  FF                db 0xff
000006DA  FFC7              inc di
000006DC  0424              add al,0x24
000006DE  F02200            lock and al,[bx+si]
000006E1  00E8              add al,ch
000006E3  2BFA              sub di,dx
000006E5  FF                db 0xff
000006E6  FFC9              dec cx
000006E8  C3                ret
000006E9  55                push bp
000006EA  89E5              mov bp,sp
000006EC  83EC14            sub sp,byte +0x14
000006EF  E86BF9            call word 0x5d
000006F2  FF                db 0xff
000006F3  FF6685            jmp word [bp-0x7b]
000006F6  C0                db 0xc0
000006F7  7411              jz 0x70a
000006F9  E88EFD            call word 0x48a
000006FC  FF                db 0xff
000006FD  FFC7              inc di
000006FF  0424              add al,0x24
00000701  052300            add ax,0x23
00000704  00E8              add al,ch
00000706  08FA              or dl,bh
00000708  FF                db 0xff
00000709  FF                db 0xff
0000070A  E883FD            call word 0x490
0000070D  FF                db 0xff
0000070E  FFC7              inc di
00000710  0424              add al,0x24
00000712  AD                lodsw
00000713  0000              add [bx+si],al
00000715  00E8              add al,ch
00000717  72FE              jc 0x717
00000719  FF                db 0xff
0000071A  FFC7              inc di
0000071C  0424              add al,0x24
0000071E  A7                cmpsw
0000071F  0000              add [bx+si],al
00000721  00E8              add al,ch
00000723  66                o32
00000724  FE                db 0xfe
00000725  FF                db 0xff
00000726  FF                db 0xff
00000727  E8B4FE            call word 0x5de
0000072A  FF                db 0xff
0000072B  FF8845FF          dec word [bx+si-0xbb]
0000072F  0FB645FF          movzx ax,[di-0x1]
00000733  83E020            and ax,byte +0x20
00000736  85C0              test ax,ax
00000738  740E              jz 0x748
0000073A  C7042418          mov word [si],0x1824
0000073E  2300              and ax,[bx+si]
00000740  00E8              add al,ch
00000742  CC                int3
00000743  F9                stc
00000744  FF                db 0xff
00000745  FF                db 0xff
00000746  EB0C              jmp short 0x754
00000748  C704243C          mov word [si],0x3c24
0000074C  2300              and ax,[bx+si]
0000074E  00E8              add al,ch
00000750  BEF9FF            mov si,0xfff9
00000753  FF8065FF          inc word [bx+si-0x9b]
00000757  FE8065FF          inc byte [bx+si-0x9b]
0000075B  FD                std
0000075C  8065FFBF          and byte [di-0x1],0xbf
00000760  C7042460          mov word [si],0x6024
00000764  0000              add [bx+si],al
00000766  00E8              add al,ch
00000768  21FE              and si,di
0000076A  FF                db 0xff
0000076B  FF0F              dec word [bx]
0000076D  B645              mov dh,0x45
0000076F  FF890424          dec word [bx+di+0x2404]
00000773  E841FE            call word 0x5b7
00000776  FF                db 0xff
00000777  FFC7              inc di
00000779  0424              add al,0x24
0000077B  AA                stosb
0000077C  0000              add [bx+si],al
0000077E  00E8              add al,ch
00000780  09FE              or si,di
00000782  FF                db 0xff
00000783  FF                db 0xff
00000784  E809FD            call word 0x490
00000787  FF                db 0xff
00000788  FF8845FE          dec word [bx+si-0x1bb]
0000078C  807DFE55          cmp byte [di-0x2],0x55
00000790  7418              jz 0x7aa
00000792  0FB645FE          movzx ax,[di-0x2]
00000796  8904              mov [si],ax
00000798  24E8              and al,0xe8
0000079A  BEF9FF            mov si,0xfff9
0000079D  FFC7              inc di
0000079F  0424              add al,0x24
000007A1  642300            and ax,[fs:bx+si]
000007A4  00E8              add al,ch
000007A6  68F9FF            push word 0xfff9
000007A9  FFC7              inc di
000007AB  0424              add al,0x24
000007AD  AB                stosw
000007AE  0000              add [bx+si],al
000007B0  00E8              add al,ch
000007B2  D7                xlatb
000007B3  FD                std
000007B4  FF                db 0xff
000007B5  FF                db 0xff
000007B6  E8D7FC            call word 0x490
000007B9  FF                db 0xff
000007BA  FF84C074          inc word [si+0x74c0]
000007BE  0CC7              or al,0xc7
000007C0  0424              add al,0x24
000007C2  7823              js 0x7e7
000007C4  0000              add [bx+si],al
000007C6  E847F9            call word 0x110
000007C9  FF                db 0xff
000007CA  FFC7              inc di
000007CC  0424              add al,0x24
000007CE  A90000            test ax,0x0
000007D1  00E8              add al,ch
000007D3  B6FD              mov dh,0xfd
000007D5  FF                db 0xff
000007D6  FF                db 0xff
000007D7  E8B6FC            call word 0x490
000007DA  FF                db 0xff
000007DB  FF84C074          inc word [si+0x74c0]
000007DF  0CC7              or al,0xc7
000007E1  0424              add al,0x24
000007E3  92                xchg ax,dx
000007E4  2300              and ax,[bx+si]
000007E6  00E8              add al,ch
000007E8  26F9              es stc
000007EA  FF                db 0xff
000007EB  FFC7              inc di
000007ED  0424              add al,0x24
000007EF  AE                scasb
000007F0  0000              add [bx+si],al
000007F2  00E8              add al,ch
000007F4  95                xchg ax,bp
000007F5  FD                std
000007F6  FF                db 0xff
000007F7  FFC7              inc di
000007F9  0424              add al,0x24
000007FB  A800              test al,0x0
000007FD  0000              add [bx+si],al
000007FF  E889FD            call word 0x58b
00000802  FF                db 0xff
00000803  FF                db 0xff
00000804  E8D7FD            call word 0x5de
00000807  FF                db 0xff
00000808  FF8845FF          dec word [bx+si-0xbb]
0000080C  804DFF03          or byte [di-0x1],0x3
00000810  C7042460          mov word [si],0x6024
00000814  0000              add [bx+si],al
00000816  00E8              add al,ch
00000818  71FD              jno 0x817
0000081A  FF                db 0xff
0000081B  FF0F              dec word [bx]
0000081D  B645              mov dh,0x45
0000081F  FF890424          dec word [bx+di+0x2404]
00000823  E891FD            call word 0x5b7
00000826  FF                db 0xff
00000827  FF                db 0xff
00000828  E8B3FD            call word 0x5de
0000082B  FF                db 0xff
0000082C  FF8845FF          dec word [bx+si-0xbb]
00000830  C70424FF          mov word [si],0xff24
00000834  0000              add [bx+si],al
00000836  00E8              add al,ch
00000838  7DFD              jnl 0x837
0000083A  FF                db 0xff
0000083B  FF                db 0xff
0000083C  E8ADFC            call word 0x4ec
0000083F  FF                db 0xff
00000840  FF                db 0xff
00000841  3CFA              cmp al,0xfa
00000843  740C              jz 0x851
00000845  C70424AC          mov word [si],0xac24
00000849  2300              and ax,[bx+si]
0000084B  00E8              add al,ch
0000084D  C1F8FF            sar ax,byte 0xff
00000850  FF                db 0xff
00000851  E898FC            call word 0x4ec
00000854  FF                db 0xff
00000855  FF                db 0xff
00000856  3CAA              cmp al,0xaa
00000858  740C              jz 0x866
0000085A  C70424D0          mov word [si],0xd024
0000085E  2300              and ax,[bx+si]
00000860  00E8              add al,ch
00000862  AC                lodsb
00000863  F8                clc
00000864  FF                db 0xff
00000865  FFC7              inc di
00000867  0424              add al,0x24
00000869  F5                cmc
0000086A  0000              add [bx+si],al
0000086C  00E8              add al,ch
0000086E  9D                popfw
0000086F  FC                cld
00000870  FF                db 0xff
00000871  FF                db 0xff
00000872  E877FC            call word 0x4ec
00000875  FF                db 0xff
00000876  FF                db 0xff
00000877  3CFA              cmp al,0xfa
00000879  740C              jz 0x887
0000087B  C70424F4          mov word [si],0xf424
0000087F  2300              and ax,[bx+si]
00000881  00E8              add al,ch
00000883  8BF8              mov di,ax
00000885  FF                db 0xff
00000886  FFC7              inc di
00000888  0424              add al,0x24
0000088A  60                pushaw
0000088B  0000              add [bx+si],al
0000088D  00E8              add al,ch
0000088F  BBFCFF            mov bx,0xfffc
00000892  FFC7              inc di
00000894  0424              add al,0x24
00000896  61                popaw
00000897  0000              add [bx+si],al
00000899  00E8              add al,ch
0000089B  70FC              jo 0x899
0000089D  FF                db 0xff
0000089E  FFC7              inc di
000008A0  0424              add al,0x24
000008A2  F4                hlt
000008A3  0000              add [bx+si],al
000008A5  00E8              add al,ch
000008A7  64FC              fs cld
000008A9  FF                db 0xff
000008AA  FF                db 0xff
000008AB  E83EFC            call word 0x4ec
000008AE  FF                db 0xff
000008AF  FF                db 0xff
000008B0  3CFA              cmp al,0xfa
000008B2  740C              jz 0x8c0
000008B4  C704241C          mov word [si],0x1c24
000008B8  2400              and al,0x0
000008BA  00E8              add al,ch
000008BC  52                push dx
000008BD  F8                clc
000008BE  FF                db 0xff
000008BF  FFC9              dec cx
000008C1  C3                ret
000008C2  55                push bp
000008C3  89E5              mov bp,sp
000008C5  83EC18            sub sp,byte +0x18
000008C8  C7042441          mov word [si],0x4124
000008CC  2400              and al,0x0
000008CE  00E8              add al,ch
000008D0  3EF8              ds clc
000008D2  FF                db 0xff
000008D3  FFC7              inc di
000008D5  0424              add al,0x24
000008D7  AD                lodsw
000008D8  0000              add [bx+si],al
000008DA  00E8              add al,ch
000008DC  6E                outsb
000008DD  FC                cld
000008DE  FF                db 0xff
000008DF  FFC7              inc di
000008E1  0424              add al,0x24
000008E3  A7                cmpsw
000008E4  0000              add [bx+si],al
000008E6  00E8              add al,ch
000008E8  62                db 0x62
000008E9  FC                cld
000008EA  FF                db 0xff
000008EB  FF                db 0xff
000008EC  E8A1FB            call word 0x490
000008EF  FF                db 0xff
000008F0  FF                db 0xff
000008F1  E8EAFC            call word 0x5de
000008F4  FF                db 0xff
000008F5  FF8845FF          dec word [bx+si-0xbb]
000008F9  0FB645FF          movzx ax,[di-0x1]
000008FD  83E020            and ax,byte +0x20
00000900  85C0              test ax,ax
00000902  740E              jz 0x912
00000904  C7042418          mov word [si],0x1824
00000908  2300              and ax,[bx+si]
0000090A  00E8              add al,ch
0000090C  02F8              add bh,al
0000090E  FF                db 0xff
0000090F  FF                db 0xff
00000910  EB0C              jmp short 0x91e
00000912  C704243C          mov word [si],0x3c24
00000916  2300              and ax,[bx+si]
00000918  00E8              add al,ch
0000091A  F4                hlt
0000091B  F7FF              idiv di
0000091D  FF8065FF          inc word [bx+si-0x9b]
00000921  FE8065FF          inc byte [bx+si-0x9b]
00000925  FD                std
00000926  8065FFBF          and byte [di-0x1],0xbf
0000092A  C7042460          mov word [si],0x6024
0000092E  0000              add [bx+si],al
00000930  00E8              add al,ch
00000932  18FC              sbb ah,bh
00000934  FF                db 0xff
00000935  FF0F              dec word [bx]
00000937  B645              mov dh,0x45
00000939  FF890424          dec word [bx+di+0x2404]
0000093D  E8CDFB            call word 0x50d
00000940  FF                db 0xff
00000941  FFC7              inc di
00000943  0424              add al,0x24
00000945  AA                stosb
00000946  0000              add [bx+si],al
00000948  00E8              add al,ch
0000094A  00FC              add ah,bh
0000094C  FF                db 0xff
0000094D  FF                db 0xff
0000094E  E89BFB            call word 0x4ec
00000951  FF                db 0xff
00000952  FF                db 0xff
00000953  3C55              cmp al,0x55
00000955  740C              jz 0x963
00000957  C704244A          mov word [si],0x4a24
0000095B  2400              and al,0x0
0000095D  00E8              add al,ch
0000095F  AF                scasw
00000960  F7FF              idiv di
00000962  FFC7              inc di
00000964  0424              add al,0x24
00000966  AB                stosw
00000967  0000              add [bx+si],al
00000969  00E8              add al,ch
0000096B  DF                db 0xdf
0000096C  FB                sti
0000096D  FF                db 0xff
0000096E  FF                db 0xff
0000096F  E87AFB            call word 0x4ec
00000972  FF                db 0xff
00000973  FF84C074          inc word [si+0x74c0]
00000977  0CC7              or al,0xc7
00000979  0424              add al,0x24
0000097B  5E                pop si
0000097C  2400              and al,0x0
0000097E  00E8              add al,ch
00000980  8EF7              mov segr6,di
00000982  FF                db 0xff
00000983  FFC7              inc di
00000985  44                inc sp
00000986  2404              and al,0x4
00000988  AE                scasb
00000989  0000              add [bx+si],al
0000098B  00C7              add bh,al
0000098D  0424              add al,0x24
0000098F  640000            add [fs:bx+si],al
00000992  00E8              add al,ch
00000994  6F                outsw
00000995  F6FF              idiv bh
00000997  FFC7              inc di
00000999  44                inc sp
0000099A  2404              and al,0x4
0000099C  A800              test al,0x0
0000099E  0000              add [bx+si],al
000009A0  C7042464          mov word [si],0x6424
000009A4  0000              add [bx+si],al
000009A6  00E8              add al,ch
000009A8  5B                pop bx
000009A9  F6FF              idiv bh
000009AB  FFC7              inc di
000009AD  0424              add al,0x24
000009AF  FF00              inc word [bx+si]
000009B1  0000              add [bx+si],al
000009B3  E857FB            call word 0x50d
000009B6  FF                db 0xff
000009B7  FF                db 0xff
000009B8  E831FB            call word 0x4ec
000009BB  FF                db 0xff
000009BC  FF                db 0xff
000009BD  3CFA              cmp al,0xfa
000009BF  740C              jz 0x9cd
000009C1  C704247C          mov word [si],0x7c24
000009C5  2400              and al,0x0
000009C7  00E8              add al,ch
000009C9  45                inc bp
000009CA  F7FF              idiv di
000009CC  FF                db 0xff
000009CD  E81CFB            call word 0x4ec
000009D0  FF                db 0xff
000009D1  FF                db 0xff
000009D2  3CAA              cmp al,0xaa
000009D4  740C              jz 0x9e2
000009D6  C70424A0          mov word [si],0xa024
000009DA  2400              and al,0x0
000009DC  00E8              add al,ch
000009DE  30F7              xor bh,dh
000009E0  FF                db 0xff
000009E1  FFC7              inc di
000009E3  0424              add al,0x24
000009E5  C424              les sp,[si]
000009E7  0000              add [bx+si],al
000009E9  E824F7            call word 0x110
000009EC  FF                db 0xff
000009ED  FFC9              dec cx
000009EF  C3                ret
000009F0  55                push bp
000009F1  89E5              mov bp,sp
000009F3  83EC14            sub sp,byte +0x14
000009F6  C645FF01          mov byte [di-0x1],0x1
000009FA  0FB645FF          movzx ax,[di-0x1]
000009FE  8904              mov [si],ax
00000A00  24E8              and al,0xe8
00000A02  56                push si
00000A03  F7FF              idiv di
00000A05  FFC7              inc di
00000A07  0424              add al,0x24
00000A09  D224              shl byte [si],cl
00000A0B  0000              add [bx+si],al
00000A0D  E800F7            call word 0x110
00000A10  FF                db 0xff
00000A11  FF0F              dec word [bx]
00000A13  B645              mov dh,0x45
00000A15  FF890424          dec word [bx+di+0x2404]
00000A19  E830FB            call word 0x54c
00000A1C  FF                db 0xff
00000A1D  FF                db 0xff
00000A1E  E8CBFA            call word 0x4ec
00000A21  FF                db 0xff
00000A22  FF0F              dec word [bx]
00000A24  B6C0              mov dh,0xc0
00000A26  8904              mov [si],ax
00000A28  24E8              and al,0xe8
00000A2A  2EF7FF            cs idiv di
00000A2D  FFC7              inc di
00000A2F  0424              add al,0x24
00000A31  E124              loope 0xa57
00000A33  0000              add [bx+si],al
00000A35  E8D8F6            call word 0x110
00000A38  FF                db 0xff
00000A39  FF8045FF          inc word [bx+si-0xbb]
00000A3D  02EB              add ch,bl
00000A3F  BA5589            mov dx,0x8955
00000A42  E5A1              in ax,0xa1
00000A44  80400000          add byte [bx+si+0x0],0x0
00000A48  83C001            add ax,byte +0x1
00000A4B  A38040            mov [0x4080],ax
00000A4E  0000              add [bx+si],al
00000A50  A18040            mov ax,[0x4080]
00000A53  0000              add [bx+si],al
00000A55  5D                pop bp
00000A56  C3                ret
00000A57  55                push bp
00000A58  89E5              mov bp,sp
00000A5A  8B450C            mov ax,[di+0xc]
00000A5D  89C2              mov dx,ax
00000A5F  8B4508            mov ax,[di+0x8]
00000A62  668914            mov [si],edx
00000A65  C5A04000          lds sp,[bx+si+0x40]
00000A69  008B4508          add [bp+di+0x845],cl
00000A6D  66C704C5A24000    mov dword [si],0x40a2c5
00000A74  0008              add [bx+si],cl
00000A76  008B4508          add [bp+di+0x845],cl
00000A7A  C604C5            mov byte [si],0xc5
00000A7D  A4                movsb
00000A7E  40                inc ax
00000A7F  0000              add [bx+si],al
00000A81  008B4508          add [bp+di+0x845],cl
00000A85  C604C5            mov byte [si],0xc5
00000A88  A5                movsw
00000A89  40                inc ax
00000A8A  0000              add [bx+si],al
00000A8C  8E8B4508          mov cs,[bp+di+0x845]
00000A90  66C704C5A64000    mov dword [si],0x40a6c5
00000A97  0000              add [bx+si],al
00000A99  005DC3            add [di-0x3d],bl
00000A9C  55                push bp
00000A9D  89E5              mov bp,sp
00000A9F  83EC14            sub sp,byte +0x14
00000AA2  0F014DFA          sidt [di-0x6]
00000AA6  8B45FC            mov ax,[di-0x4]
00000AA9  8904              mov [si],ax
00000AAB  24E8              and al,0xe8
00000AAD  AB                stosw
00000AAE  F6FF              idiv bh
00000AB0  FFC7              inc di
00000AB2  0424              add al,0x24
00000AB4  F5                cmc
00000AB5  2400              and al,0x0
00000AB7  00E8              add al,ch
00000AB9  55                push bp
00000ABA  F6FF              idiv bh
00000ABC  FF0F              dec word [bx]
00000ABE  B745              mov bh,0x45
00000AC0  FA                cli
00000AC1  0F                db 0x0f
00000AC2  B7C0              mov bh,0xc0
00000AC4  8904              mov [si],ax
00000AC6  24E8              and al,0xe8
00000AC8  90                nop
00000AC9  F6FF              idiv bh
00000ACB  FFC7              inc di
00000ACD  0424              add al,0x24
00000ACF  0225              add ah,[di]
00000AD1  0000              add [bx+si],al
00000AD3  E83AF6            call word 0x110
00000AD6  FF                db 0xff
00000AD7  FFC9              dec cx
00000AD9  C3                ret
00000ADA  55                push bp
00000ADB  89E5              mov bp,sp
00000ADD  B8A040            mov ax,0x40a0
00000AE0  0000              add [bx+si],al
00000AE2  A3A248            mov [0x48a2],ax
00000AE5  0000              add [bx+si],al
00000AE7  66C705A0480000    mov dword [di],0x48a0
00000AEE  FF07              inc word [bx]
00000AF0  B8A048            mov ax,0x48a0
00000AF3  0000              add [bx+si],al
00000AF5  0F0118            lidt [bx+si]
00000AF8  5D                pop bp
00000AF9  C3                ret
00000AFA  55                push bp
00000AFB  89E5              mov bp,sp
00000AFD  83EC08            sub sp,byte +0x8
00000B00  B80A21            mov ax,0x210a
00000B03  0000              add [bx+si],al
00000B05  894424            mov [si+0x24],ax
00000B08  04C7              add al,0xc7
00000B0A  0424              add al,0x24
00000B0C  0000              add [bx+si],al
00000B0E  0000              add [bx+si],al
00000B10  E842FF            call word 0xa55
00000B13  FF                db 0xff
00000B14  FF                db 0xff
00000B15  B81121            mov ax,0x2111
00000B18  0000              add [bx+si],al
00000B1A  894424            mov [si+0x24],ax
00000B1D  04C7              add al,0xc7
00000B1F  0424              add al,0x24
00000B21  0100              add [bx+si],ax
00000B23  0000              add [bx+si],al
00000B25  E82DFF            call word 0xa55
00000B28  FF                db 0xff
00000B29  FF                db 0xff
00000B2A  B81821            mov ax,0x2118
00000B2D  0000              add [bx+si],al
00000B2F  894424            mov [si+0x24],ax
00000B32  04C7              add al,0xc7
00000B34  0424              add al,0x24
00000B36  0200              add al,[bx+si]
00000B38  0000              add [bx+si],al
00000B3A  E818FF            call word 0xa55
00000B3D  FF                db 0xff
00000B3E  FF                db 0xff
00000B3F  B81F21            mov ax,0x211f
00000B42  0000              add [bx+si],al
00000B44  894424            mov [si+0x24],ax
00000B47  04C7              add al,0xc7
00000B49  0424              add al,0x24
00000B4B  0300              add ax,[bx+si]
00000B4D  0000              add [bx+si],al
00000B4F  E803FF            call word 0xa55
00000B52  FF                db 0xff
00000B53  FF                db 0xff
00000B54  B82621            mov ax,0x2126
00000B57  0000              add [bx+si],al
00000B59  894424            mov [si+0x24],ax
00000B5C  04C7              add al,0xc7
00000B5E  0424              add al,0x24
00000B60  0400              add al,0x0
00000B62  0000              add [bx+si],al
00000B64  E8EEFE            call word 0xa55
00000B67  FF                db 0xff
00000B68  FF                db 0xff
00000B69  B82D21            mov ax,0x212d
00000B6C  0000              add [bx+si],al
00000B6E  894424            mov [si+0x24],ax
00000B71  04C7              add al,0xc7
00000B73  0424              add al,0x24
00000B75  050000            add ax,0x0
00000B78  00E8              add al,ch
00000B7A  D9FE              fsin
00000B7C  FF                db 0xff
00000B7D  FF                db 0xff
00000B7E  B83421            mov ax,0x2134
00000B81  0000              add [bx+si],al
00000B83  894424            mov [si+0x24],ax
00000B86  04C7              add al,0xc7
00000B88  0424              add al,0x24
00000B8A  06                push es
00000B8B  0000              add [bx+si],al
00000B8D  00E8              add al,ch
00000B8F  C4                db 0xc4
00000B90  FE                db 0xfe
00000B91  FF                db 0xff
00000B92  FF                db 0xff
00000B93  B83B21            mov ax,0x213b
00000B96  0000              add [bx+si],al
00000B98  894424            mov [si+0x24],ax
00000B9B  04C7              add al,0xc7
00000B9D  0424              add al,0x24
00000B9F  07                pop es
00000BA0  0000              add [bx+si],al
00000BA2  00E8              add al,ch
00000BA4  AF                scasw
00000BA5  FE                db 0xfe
00000BA6  FF                db 0xff
00000BA7  FF                db 0xff
00000BA8  B84221            mov ax,0x2142
00000BAB  0000              add [bx+si],al
00000BAD  894424            mov [si+0x24],ax
00000BB0  04C7              add al,0xc7
00000BB2  0424              add al,0x24
00000BB4  0800              or [bx+si],al
00000BB6  0000              add [bx+si],al
00000BB8  E89AFE            call word 0xa55
00000BBB  FF                db 0xff
00000BBC  FF                db 0xff
00000BBD  B84721            mov ax,0x2147
00000BC0  0000              add [bx+si],al
00000BC2  894424            mov [si+0x24],ax
00000BC5  04C7              add al,0xc7
00000BC7  0424              add al,0x24
00000BC9  0900              or [bx+si],ax
00000BCB  0000              add [bx+si],al
00000BCD  E885FE            call word 0xa55
00000BD0  FF                db 0xff
00000BD1  FF                db 0xff
00000BD2  B84E21            mov ax,0x214e
00000BD5  0000              add [bx+si],al
00000BD7  894424            mov [si+0x24],ax
00000BDA  04C7              add al,0xc7
00000BDC  0424              add al,0x24
00000BDE  0A00              or al,[bx+si]
00000BE0  0000              add [bx+si],al
00000BE2  E870FE            call word 0xa55
00000BE5  FF                db 0xff
00000BE6  FF                db 0xff
00000BE7  B85321            mov ax,0x2153
00000BEA  0000              add [bx+si],al
00000BEC  894424            mov [si+0x24],ax
00000BEF  04C7              add al,0xc7
00000BF1  0424              add al,0x24
00000BF3  0B00              or ax,[bx+si]
00000BF5  0000              add [bx+si],al
00000BF7  E85BFE            call word 0xa55
00000BFA  FF                db 0xff
00000BFB  FF                db 0xff
00000BFC  B85821            mov ax,0x2158
00000BFF  0000              add [bx+si],al
00000C01  894424            mov [si+0x24],ax
00000C04  04C7              add al,0xc7
00000C06  0424              add al,0x24
00000C08  0C00              or al,0x0
00000C0A  0000              add [bx+si],al
00000C0C  E846FE            call word 0xa55
00000C0F  FF                db 0xff
00000C10  FF                db 0xff
00000C11  B85D21            mov ax,0x215d
00000C14  0000              add [bx+si],al
00000C16  894424            mov [si+0x24],ax
00000C19  04C7              add al,0xc7
00000C1B  0424              add al,0x24
00000C1D  0D0000            or ax,0x0
00000C20  00E8              add al,ch
00000C22  31FE              xor si,di
00000C24  FF                db 0xff
00000C25  FF                db 0xff
00000C26  B86221            mov ax,0x2162
00000C29  0000              add [bx+si],al
00000C2B  894424            mov [si+0x24],ax
00000C2E  04C7              add al,0xc7
00000C30  0424              add al,0x24
00000C32  0E                push cs
00000C33  0000              add [bx+si],al
00000C35  00E8              add al,ch
00000C37  1CFE              sbb al,0xfe
00000C39  FF                db 0xff
00000C3A  FF                db 0xff
00000C3B  B86721            mov ax,0x2167
00000C3E  0000              add [bx+si],al
00000C40  894424            mov [si+0x24],ax
00000C43  04C7              add al,0xc7
00000C45  0424              add al,0x24
00000C47  0F0000            sldt [bx+si]
00000C4A  00E8              add al,ch
00000C4C  07                pop es
00000C4D  FE                db 0xfe
00000C4E  FF                db 0xff
00000C4F  FF                db 0xff
00000C50  B86E21            mov ax,0x216e
00000C53  0000              add [bx+si],al
00000C55  894424            mov [si+0x24],ax
00000C58  04C7              add al,0xc7
00000C5A  0424              add al,0x24
00000C5C  1000              adc [bx+si],al
00000C5E  0000              add [bx+si],al
00000C60  E8F2FD            call word 0xa55
00000C63  FF                db 0xff
00000C64  FF                db 0xff
00000C65  B87821            mov ax,0x2178
00000C68  0000              add [bx+si],al
00000C6A  894424            mov [si+0x24],ax
00000C6D  04C7              add al,0xc7
00000C6F  0424              add al,0x24
00000C71  1100              adc [bx+si],ax
00000C73  0000              add [bx+si],al
00000C75  E8DDFD            call word 0xa55
00000C78  FF                db 0xff
00000C79  FF                db 0xff
00000C7A  B88021            mov ax,0x2180
00000C7D  0000              add [bx+si],al
00000C7F  894424            mov [si+0x24],ax
00000C82  04C7              add al,0xc7
00000C84  0424              add al,0x24
00000C86  1200              adc al,[bx+si]
00000C88  0000              add [bx+si],al
00000C8A  E8C8FD            call word 0xa55
00000C8D  FF                db 0xff
00000C8E  FF                db 0xff
00000C8F  B88A21            mov ax,0x218a
00000C92  0000              add [bx+si],al
00000C94  894424            mov [si+0x24],ax
00000C97  04C7              add al,0xc7
00000C99  0424              add al,0x24
00000C9B  1300              adc ax,[bx+si]
00000C9D  0000              add [bx+si],al
00000C9F  E8B3FD            call word 0xa55
00000CA2  FF                db 0xff
00000CA3  FF                db 0xff
00000CA4  B89421            mov ax,0x2194
00000CA7  0000              add [bx+si],al
00000CA9  894424            mov [si+0x24],ax
00000CAC  04C7              add al,0xc7
00000CAE  0424              add al,0x24
00000CB0  1400              adc al,0x0
00000CB2  0000              add [bx+si],al
00000CB4  E89EFD            call word 0xa55
00000CB7  FF                db 0xff
00000CB8  FF                db 0xff
00000CB9  B89E21            mov ax,0x219e
00000CBC  0000              add [bx+si],al
00000CBE  894424            mov [si+0x24],ax
00000CC1  04C7              add al,0xc7
00000CC3  0424              add al,0x24
00000CC5  150000            adc ax,0x0
00000CC8  00E8              add al,ch
00000CCA  89FD              mov bp,di
00000CCC  FF                db 0xff
00000CCD  FF                db 0xff
00000CCE  B8A821            mov ax,0x21a8
00000CD1  0000              add [bx+si],al
00000CD3  894424            mov [si+0x24],ax
00000CD6  04C7              add al,0xc7
00000CD8  0424              add al,0x24
00000CDA  16                push ss
00000CDB  0000              add [bx+si],al
00000CDD  00E8              add al,ch
00000CDF  74FD              jz 0xcde
00000CE1  FF                db 0xff
00000CE2  FF                db 0xff
00000CE3  B8B221            mov ax,0x21b2
00000CE6  0000              add [bx+si],al
00000CE8  894424            mov [si+0x24],ax
00000CEB  04C7              add al,0xc7
00000CED  0424              add al,0x24
00000CEF  17                pop ss
00000CF0  0000              add [bx+si],al
00000CF2  00E8              add al,ch
00000CF4  5F                pop di
00000CF5  FD                std
00000CF6  FF                db 0xff
00000CF7  FF                db 0xff
00000CF8  B8BC21            mov ax,0x21bc
00000CFB  0000              add [bx+si],al
00000CFD  894424            mov [si+0x24],ax
00000D00  04C7              add al,0xc7
00000D02  0424              add al,0x24
00000D04  1800              sbb [bx+si],al
00000D06  0000              add [bx+si],al
00000D08  E84AFD            call word 0xa55
00000D0B  FF                db 0xff
00000D0C  FF                db 0xff
00000D0D  B8C621            mov ax,0x21c6
00000D10  0000              add [bx+si],al
00000D12  894424            mov [si+0x24],ax
00000D15  04C7              add al,0xc7
00000D17  0424              add al,0x24
00000D19  1900              sbb [bx+si],ax
00000D1B  0000              add [bx+si],al
00000D1D  E835FD            call word 0xa55
00000D20  FF                db 0xff
00000D21  FF                db 0xff
00000D22  B8D021            mov ax,0x21d0
00000D25  0000              add [bx+si],al
00000D27  894424            mov [si+0x24],ax
00000D2A  04C7              add al,0xc7
00000D2C  0424              add al,0x24
00000D2E  1A00              sbb al,[bx+si]
00000D30  0000              add [bx+si],al
00000D32  E820FD            call word 0xa55
00000D35  FF                db 0xff
00000D36  FF                db 0xff
00000D37  B8DA21            mov ax,0x21da
00000D3A  0000              add [bx+si],al
00000D3C  894424            mov [si+0x24],ax
00000D3F  04C7              add al,0xc7
00000D41  0424              add al,0x24
00000D43  1B00              sbb ax,[bx+si]
00000D45  0000              add [bx+si],al
00000D47  E80BFD            call word 0xa55
00000D4A  FF                db 0xff
00000D4B  FF                db 0xff
00000D4C  B8E421            mov ax,0x21e4
00000D4F  0000              add [bx+si],al
00000D51  894424            mov [si+0x24],ax
00000D54  04C7              add al,0xc7
00000D56  0424              add al,0x24
00000D58  1C00              sbb al,0x0
00000D5A  0000              add [bx+si],al
00000D5C  E8F6FC            call word 0xa55
00000D5F  FF                db 0xff
00000D60  FF                db 0xff
00000D61  B8EE21            mov ax,0x21ee
00000D64  0000              add [bx+si],al
00000D66  894424            mov [si+0x24],ax
00000D69  04C7              add al,0xc7
00000D6B  0424              add al,0x24
00000D6D  1D0000            sbb ax,0x0
00000D70  00E8              add al,ch
00000D72  E1FC              loope 0xd70
00000D74  FF                db 0xff
00000D75  FF                db 0xff
00000D76  B8F821            mov ax,0x21f8
00000D79  0000              add [bx+si],al
00000D7B  894424            mov [si+0x24],ax
00000D7E  04C7              add al,0xc7
00000D80  0424              add al,0x24
00000D82  1E                push ds
00000D83  0000              add [bx+si],al
00000D85  00E8              add al,ch
00000D87  CC                int3
00000D88  FC                cld
00000D89  FF                db 0xff
00000D8A  FF                db 0xff
00000D8B  B80222            mov ax,0x2202
00000D8E  0000              add [bx+si],al
00000D90  894424            mov [si+0x24],ax
00000D93  04C7              add al,0xc7
00000D95  0424              add al,0x24
00000D97  1F                pop ds
00000D98  0000              add [bx+si],al
00000D9A  00E8              add al,ch
00000D9C  B7FC              mov bh,0xfc
00000D9E  FF                db 0xff
00000D9F  FFC7              inc di
00000DA1  44                inc sp
00000DA2  2404              and al,0x4
00000DA4  2800              sub [bx+si],al
00000DA6  0000              add [bx+si],al
00000DA8  C7042420          mov word [si],0x2024
00000DAC  0000              add [bx+si],al
00000DAE  00E8              add al,ch
00000DB0  D6                salc
00000DB1  F5                cmc
00000DB2  FF                db 0xff
00000DB3  FF                db 0xff
00000DB4  B82622            mov ax,0x2226
00000DB7  0000              add [bx+si],al
00000DB9  894424            mov [si+0x24],ax
00000DBC  04C7              add al,0xc7
00000DBE  0424              add al,0x24
00000DC0  2000              and [bx+si],al
00000DC2  0000              add [bx+si],al
00000DC4  E88EFC            call word 0xa55
00000DC7  FF                db 0xff
00000DC8  FF                db 0xff
00000DC9  B82D22            mov ax,0x222d
00000DCC  0000              add [bx+si],al
00000DCE  894424            mov [si+0x24],ax
00000DD1  04C7              add al,0xc7
00000DD3  0424              add al,0x24
00000DD5  2100              and [bx+si],ax
00000DD7  0000              add [bx+si],al
00000DD9  E879FC            call word 0xa55
00000DDC  FF                db 0xff
00000DDD  FF                db 0xff
00000DDE  B83422            mov ax,0x2234
00000DE1  0000              add [bx+si],al
00000DE3  894424            mov [si+0x24],ax
00000DE6  04C7              add al,0xc7
00000DE8  0424              add al,0x24
00000DEA  2200              and al,[bx+si]
00000DEC  0000              add [bx+si],al
00000DEE  E864FC            call word 0xa55
00000DF1  FF                db 0xff
00000DF2  FF                db 0xff
00000DF3  B83B22            mov ax,0x223b
00000DF6  0000              add [bx+si],al
00000DF8  894424            mov [si+0x24],ax
00000DFB  04C7              add al,0xc7
00000DFD  0424              add al,0x24
00000DFF  2300              and ax,[bx+si]
00000E01  0000              add [bx+si],al
00000E03  E84FFC            call word 0xa55
00000E06  FF                db 0xff
00000E07  FF                db 0xff
00000E08  B84222            mov ax,0x2242
00000E0B  0000              add [bx+si],al
00000E0D  894424            mov [si+0x24],ax
00000E10  04C7              add al,0xc7
00000E12  0424              add al,0x24
00000E14  2400              and al,0x0
00000E16  0000              add [bx+si],al
00000E18  E83AFC            call word 0xa55
00000E1B  FF                db 0xff
00000E1C  FF                db 0xff
00000E1D  B84922            mov ax,0x2249
00000E20  0000              add [bx+si],al
00000E22  894424            mov [si+0x24],ax
00000E25  04C7              add al,0xc7
00000E27  0424              add al,0x24
00000E29  250000            and ax,0x0
00000E2C  00E8              add al,ch
00000E2E  25FCFF            and ax,0xfffc
00000E31  FF                db 0xff
00000E32  B85022            mov ax,0x2250
00000E35  0000              add [bx+si],al
00000E37  894424            mov [si+0x24],ax
00000E3A  04C7              add al,0xc7
00000E3C  0424              add al,0x24
00000E3E  260000            add [es:bx+si],al
00000E41  00E8              add al,ch
00000E43  10FC              adc ah,bh
00000E45  FF                db 0xff
00000E46  FF                db 0xff
00000E47  B85722            mov ax,0x2257
00000E4A  0000              add [bx+si],al
00000E4C  894424            mov [si+0x24],ax
00000E4F  04C7              add al,0xc7
00000E51  0424              add al,0x24
00000E53  27                daa
00000E54  0000              add [bx+si],al
00000E56  00E8              add al,ch
00000E58  FB                sti
00000E59  FB                sti
00000E5A  FF                db 0xff
00000E5B  FF                db 0xff
00000E5C  B85E22            mov ax,0x225e
00000E5F  0000              add [bx+si],al
00000E61  894424            mov [si+0x24],ax
00000E64  04C7              add al,0xc7
00000E66  0424              add al,0x24
00000E68  2800              sub [bx+si],al
00000E6A  0000              add [bx+si],al
00000E6C  E8E6FB            call word 0xa55
00000E6F  FF                db 0xff
00000E70  FF                db 0xff
00000E71  B86522            mov ax,0x2265
00000E74  0000              add [bx+si],al
00000E76  894424            mov [si+0x24],ax
00000E79  04C7              add al,0xc7
00000E7B  0424              add al,0x24
00000E7D  2900              sub [bx+si],ax
00000E7F  0000              add [bx+si],al
00000E81  E8D1FB            call word 0xa55
00000E84  FF                db 0xff
00000E85  FF                db 0xff
00000E86  B86C22            mov ax,0x226c
00000E89  0000              add [bx+si],al
00000E8B  894424            mov [si+0x24],ax
00000E8E  04C7              add al,0xc7
00000E90  0424              add al,0x24
00000E92  2A00              sub al,[bx+si]
00000E94  0000              add [bx+si],al
00000E96  E8BCFB            call word 0xa55
00000E99  FF                db 0xff
00000E9A  FF                db 0xff
00000E9B  B87322            mov ax,0x2273
00000E9E  0000              add [bx+si],al
00000EA0  894424            mov [si+0x24],ax
00000EA3  04C7              add al,0xc7
00000EA5  0424              add al,0x24
00000EA7  2B00              sub ax,[bx+si]
00000EA9  0000              add [bx+si],al
00000EAB  E8A7FB            call word 0xa55
00000EAE  FF                db 0xff
00000EAF  FF                db 0xff
00000EB0  B87A22            mov ax,0x227a
00000EB3  0000              add [bx+si],al
00000EB5  894424            mov [si+0x24],ax
00000EB8  04C7              add al,0xc7
00000EBA  0424              add al,0x24
00000EBC  2C00              sub al,0x0
00000EBE  0000              add [bx+si],al
00000EC0  E892FB            call word 0xa55
00000EC3  FF                db 0xff
00000EC4  FF                db 0xff
00000EC5  B88122            mov ax,0x2281
00000EC8  0000              add [bx+si],al
00000ECA  894424            mov [si+0x24],ax
00000ECD  04C7              add al,0xc7
00000ECF  0424              add al,0x24
00000ED1  2D0000            sub ax,0x0
00000ED4  00E8              add al,ch
00000ED6  7DFB              jnl 0xed3
00000ED8  FF                db 0xff
00000ED9  FF                db 0xff
00000EDA  B88822            mov ax,0x2288
00000EDD  0000              add [bx+si],al
00000EDF  894424            mov [si+0x24],ax
00000EE2  04C7              add al,0xc7
00000EE4  0424              add al,0x24
00000EE6  2E0000            add [cs:bx+si],al
00000EE9  00E8              add al,ch
00000EEB  68FBFF            push word 0xfffb
00000EEE  FF                db 0xff
00000EEF  B89222            mov ax,0x2292
00000EF2  0000              add [bx+si],al
00000EF4  894424            mov [si+0x24],ax
00000EF7  04C7              add al,0xc7
00000EF9  0424              add al,0x24
00000EFB  2F                das
00000EFC  0000              add [bx+si],al
00000EFE  00E8              add al,ch
00000F00  53                push bx
00000F01  FB                sti
00000F02  FF                db 0xff
00000F03  FF                db 0xff
00000F04  E8D1FB            call word 0xad8
00000F07  FF                db 0xff
00000F08  FF                db 0xff
00000F09  E878F5            call word 0x484
00000F0C  FF                db 0xff
00000F0D  FFC9              dec cx
00000F0F  C3                ret
00000F10  55                push bp
00000F11  89E5              mov bp,sp
00000F13  83EC04            sub sp,byte +0x4
00000F16  837D2800          cmp word [di+0x28],byte +0x0
00000F1A  7430              jz 0xf4c
00000F1C  8B4528            mov ax,[di+0x28]
00000F1F  8904              mov [si],ax
00000F21  24E8              and al,0xe8
00000F23  35F2FF            xor ax,0xfff2
00000F26  FFC7              inc di
00000F28  0424              add al,0x24
00000F2A  4C                dec sp
00000F2B  260000            add [es:bx+si],al
00000F2E  E8DFF1            call word 0x110
00000F31  FF                db 0xff
00000F32  FF                db 0xff
00000F33  B8101F            mov ax,0x1f10
00000F36  0000              add [bx+si],al
00000F38  8904              mov [si],ax
00000F3A  24E8              and al,0xe8
00000F3C  1CF2              sbb al,0xf2
00000F3E  FF                db 0xff
00000F3F  FFC7              inc di
00000F41  0424              add al,0x24
00000F43  60                pushaw
00000F44  260000            add [es:bx+si],al
00000F47  E8C6F1            call word 0x110
00000F4A  FF                db 0xff
00000F4B  FF8B4528          dec word [bp+di+0x2845]
00000F4F  0FB6C0            movzx ax,al
00000F52  8904              mov [si],ax
00000F54  24E8              and al,0xe8
00000F56  70F2              jo 0xf4a
00000F58  FF                db 0xff
00000F59  FFC9              dec cx
00000F5B  C3                ret
00000F5C  55                push bp
00000F5D  89E5              mov bp,sp
00000F5F  83EC04            sub sp,byte +0x4
00000F62  8B4528            mov ax,[di+0x28]
00000F65  8904              mov [si],ax
00000F67  24E8              and al,0xe8
00000F69  EF                out dx,ax
00000F6A  F1                int1
00000F6B  FF                db 0xff
00000F6C  FF8B4528          dec word [bp+di+0x2845]
00000F70  8B04              mov ax,[si]
00000F72  8500              test [bx+si],ax
00000F74  40                inc ax
00000F75  0000              add [bx+si],al
00000F77  8904              mov [si],ax
00000F79  24E8              and al,0xe8
00000F7B  93                xchg ax,bx
00000F7C  F1                int1
00000F7D  FF                db 0xff
00000F7E  FFC9              dec cx
00000F80  C3                ret
00000F81  55                push bp
00000F82  89E5              mov bp,sp
00000F84  83EC14            sub sp,byte +0x14
00000F87  0F20C3            mov ebx,cr0
00000F8A  89D8              mov ax,bx
00000F8C  8945FC            mov [di-0x4],ax
00000F8F  8B45FC            mov ax,[di-0x4]
00000F92  8904              mov [si],ax
00000F94  24E8              and al,0xe8
00000F96  C2F1FF            ret 0xfff1
00000F99  FFC7              inc di
00000F9B  0424              add al,0x24
00000F9D  84260000          test [0x0],ah
00000FA1  E86CF1            call word 0x110
00000FA4  FF                db 0xff
00000FA5  FFC9              dec cx
00000FA7  C3                ret
00000FA8  55                push bp
00000FA9  89E5              mov bp,sp
00000FAB  83EC14            sub sp,byte +0x14
00000FAE  0F20CB            mov ebx,cr1
00000FB1  89D8              mov ax,bx
00000FB3  8945FC            mov [di-0x4],ax
00000FB6  8B45FC            mov ax,[di-0x4]
00000FB9  8904              mov [si],ax
00000FBB  24E8              and al,0xe8
00000FBD  9BF1              wait int1
00000FBF  FF                db 0xff
00000FC0  FFC7              inc di
00000FC2  0424              add al,0x24
00000FC4  89260000          mov [0x0],sp
00000FC8  E845F1            call word 0x110
00000FCB  FF                db 0xff
00000FCC  FFC9              dec cx
00000FCE  C3                ret
00000FCF  55                push bp
00000FD0  89E5              mov bp,sp
00000FD2  83EC14            sub sp,byte +0x14
00000FD5  0F20D3            mov ebx,cr2
00000FD8  89D8              mov ax,bx
00000FDA  8945FC            mov [di-0x4],ax
00000FDD  8B45FC            mov ax,[di-0x4]
00000FE0  8904              mov [si],ax
00000FE2  24E8              and al,0xe8
00000FE4  74F1              jz 0xfd7
00000FE6  FF                db 0xff
00000FE7  FFC7              inc di
00000FE9  0424              add al,0x24
00000FEB  8E260000          mov fs,[0x0]
00000FEF  E81EF1            call word 0x110
00000FF2  FF                db 0xff
00000FF3  FFC9              dec cx
00000FF5  C3                ret
00000FF6  55                push bp
00000FF7  89E5              mov bp,sp
00000FF9  83EC14            sub sp,byte +0x14
00000FFC  0F20DB            mov ebx,cr3
00000FFF  89D8              mov ax,bx
00001001  8945FC            mov [di-0x4],ax
00001004  8B45FC            mov ax,[di-0x4]
00001007  8904              mov [si],ax
00001009  24E8              and al,0xe8
0000100B  4D                dec bp
0000100C  F1                int1
0000100D  FF                db 0xff
0000100E  FFC7              inc di
00001010  0424              add al,0x24
00001012  93                xchg ax,bx
00001013  260000            add [es:bx+si],al
00001016  E8F7F0            call word 0x110
00001019  FF                db 0xff
0000101A  FFC9              dec cx
0000101C  C3                ret
0000101D  55                push bp
0000101E  89E5              mov bp,sp
00001020  83EC14            sub sp,byte +0x14
00001023  0F20E3            mov ebx,cr4
00001026  89D8              mov ax,bx
00001028  8945FC            mov [di-0x4],ax
0000102B  8B45FC            mov ax,[di-0x4]
0000102E  8904              mov [si],ax
00001030  24E8              and al,0xe8
00001032  26F1              es int1
00001034  FF                db 0xff
00001035  FFC7              inc di
00001037  0424              add al,0x24
00001039  98                cbw
0000103A  260000            add [es:bx+si],al
0000103D  E8D0F0            call word 0x110
00001040  FF                db 0xff
00001041  FFC9              dec cx
00001043  C3                ret
00001044  55                push bp
00001045  89E5              mov bp,sp
00001047  0F20E3            mov ebx,cr4
0000104A  83CB10            or bx,byte +0x10
0000104D  0F22E3            mov cr4,ebx
00001050  5D                pop bp
00001051  C3                ret
00001052  55                push bp
00001053  89E5              mov bp,sp
00001055  53                push bx
00001056  83EC24            sub sp,byte +0x24
00001059  C745F80000        mov word [di-0x8],0x0
0000105E  0000              add [bx+si],al
00001060  EB15              jmp short 0x1077
00001062  8B45F8            mov ax,[di-0x8]
00001065  0FA2              cpuid
00001067  8945F0            mov [di-0x10],ax
0000106A  895DEC            mov [di-0x14],bx
0000106D  894DE8            mov [di-0x18],cx
00001070  8955F4            mov [di-0xc],dx
00001073  8345F801          add word [di-0x8],byte +0x1
00001077  837DF804          cmp word [di-0x8],byte +0x4
0000107B  7EE5              jng 0x1062
0000107D  8B45F4            mov ax,[di-0xc]
00001080  83E040            and ax,byte +0x40
00001083  85C0              test ax,ax
00001085  740E              jz 0x1095
00001087  C704249D          mov word [si],0x9d24
0000108B  260000            add [es:bx+si],al
0000108E  E87FF0            call word 0x110
00001091  FF                db 0xff
00001092  FF                db 0xff
00001093  EB0C              jmp short 0x10a1
00001095  C70424A9          mov word [si],0xa924
00001099  260000            add [es:bx+si],al
0000109C  E871F0            call word 0x110
0000109F  FF                db 0xff
000010A0  FF83C424          inc word [bp+di+0x24c4]
000010A4  5B                pop bx
000010A5  5D                pop bp
000010A6  C3                ret
000010A7  55                push bp
000010A8  89E5              mov bp,sp
000010AA  83EC04            sub sp,byte +0x4
000010AD  C70424B6          mov word [si],0xb624
000010B1  260000            add [es:bx+si],al
000010B4  E859F0            call word 0x110
000010B7  FF                db 0xff
000010B8  FF                db 0xff
000010B9  E83CFA            call word 0xaf8
000010BC  FF                db 0xff
000010BD  FF                db 0xff
000010BE  E881FF            call word 0x1042
000010C1  FF                db 0xff
000010C2  FFC7              inc di
000010C4  0424              add al,0x24
000010C6  C7                db 0xc7
000010C7  260000            add [es:bx+si],al
000010CA  E843F0            call word 0x110
000010CD  FF                db 0xff
000010CE  FF                db 0xff
000010CF  E8ADFE            call word 0xf7f
000010D2  FF                db 0xff
000010D3  FF                db 0xff
000010D4  E81DFF            call word 0xff4
000010D7  FF                db 0xff
000010D8  FF                db 0xff
000010D9  E83FFF            call word 0x101b
000010DC  FF                db 0xff
000010DD  FF                db 0xff
000010DE  B80000            mov ax,0x0
000010E1  0000              add [bx+si],al
000010E3  C9                leave
000010E4  C3                ret
000010E5  6690              xchg eax,eax
000010E7  6690              xchg eax,eax
000010E9  6690              xchg eax,eax
000010EB  6690              xchg eax,eax
000010ED  6690              xchg eax,eax
000010EF  90                nop
000010F0  57                push di
000010F1  56                push si
000010F2  55                push bp
000010F3  54                push sp
000010F4  53                push bx
000010F5  52                push dx
000010F6  51                push cx
000010F7  50                push ax
000010F8  E85FFE            call word 0xf5a
000010FB  FF                db 0xff
000010FC  FF5859            call word far [bx+si+0x59]
000010FF  5A                pop dx
00001100  5B                pop bx
00001101  5C                pop sp
00001102  5D                pop bp
00001103  5E                pop si
00001104  5F                pop di
00001105  83C408            add sp,byte +0x8
00001108  FB                sti
00001109  CF                iretw
0000110A  FA                cli
0000110B  6A00              push byte +0x0
0000110D  6A00              push byte +0x0
0000110F  EBDF              jmp short 0x10f0
00001111  FA                cli
00001112  6A00              push byte +0x0
00001114  6A01              push byte +0x1
00001116  EBD8              jmp short 0x10f0
00001118  FA                cli
00001119  6A00              push byte +0x0
0000111B  6A02              push byte +0x2
0000111D  EBD1              jmp short 0x10f0
0000111F  FA                cli
00001120  6A00              push byte +0x0
00001122  6A03              push byte +0x3
00001124  EBCA              jmp short 0x10f0
00001126  FA                cli
00001127  6A00              push byte +0x0
00001129  6A04              push byte +0x4
0000112B  EBC3              jmp short 0x10f0
0000112D  FA                cli
0000112E  6A00              push byte +0x0
00001130  6A05              push byte +0x5
00001132  EBBC              jmp short 0x10f0
00001134  FA                cli
00001135  6A00              push byte +0x0
00001137  6A06              push byte +0x6
00001139  EBB5              jmp short 0x10f0
0000113B  FA                cli
0000113C  6A00              push byte +0x0
0000113E  6A07              push byte +0x7
00001140  EBAE              jmp short 0x10f0
00001142  FA                cli
00001143  6A08              push byte +0x8
00001145  EBA9              jmp short 0x10f0
00001147  FA                cli
00001148  6A00              push byte +0x0
0000114A  6A09              push byte +0x9
0000114C  EBA2              jmp short 0x10f0
0000114E  FA                cli
0000114F  6A0A              push byte +0xa
00001151  EB9D              jmp short 0x10f0
00001153  FA                cli
00001154  6A0B              push byte +0xb
00001156  EB98              jmp short 0x10f0
00001158  FA                cli
00001159  6A0C              push byte +0xc
0000115B  EB93              jmp short 0x10f0
0000115D  FA                cli
0000115E  6A0D              push byte +0xd
00001160  EB8E              jmp short 0x10f0
00001162  FA                cli
00001163  6A0E              push byte +0xe
00001165  EB89              jmp short 0x10f0
00001167  FA                cli
00001168  6A00              push byte +0x0
0000116A  6A0F              push byte +0xf
0000116C  EB82              jmp short 0x10f0
0000116E  FA                cli
0000116F  6A00              push byte +0x0
00001171  6A10              push byte +0x10
00001173  E978FF            jmp word 0x10ee
00001176  FF                db 0xff
00001177  FF                db 0xff
00001178  FA                cli
00001179  6A11              push byte +0x11
0000117B  E970FF            jmp word 0x10ee
0000117E  FF                db 0xff
0000117F  FF                db 0xff
00001180  FA                cli
00001181  6A00              push byte +0x0
00001183  6A12              push byte +0x12
00001185  E966FF            jmp word 0x10ee
00001188  FF                db 0xff
00001189  FF                db 0xff
0000118A  FA                cli
0000118B  6A00              push byte +0x0
0000118D  6A13              push byte +0x13
0000118F  E95CFF            jmp word 0x10ee
00001192  FF                db 0xff
00001193  FF                db 0xff
00001194  FA                cli
00001195  6A00              push byte +0x0
00001197  6A14              push byte +0x14
00001199  E952FF            jmp word 0x10ee
0000119C  FF                db 0xff
0000119D  FF                db 0xff
0000119E  FA                cli
0000119F  6A00              push byte +0x0
000011A1  6A15              push byte +0x15
000011A3  E948FF            jmp word 0x10ee
000011A6  FF                db 0xff
000011A7  FF                db 0xff
000011A8  FA                cli
000011A9  6A00              push byte +0x0
000011AB  6A16              push byte +0x16
000011AD  E93EFF            jmp word 0x10ee
000011B0  FF                db 0xff
000011B1  FF                db 0xff
000011B2  FA                cli
000011B3  6A00              push byte +0x0
000011B5  6A17              push byte +0x17
000011B7  E934FF            jmp word 0x10ee
000011BA  FF                db 0xff
000011BB  FF                db 0xff
000011BC  FA                cli
000011BD  6A00              push byte +0x0
000011BF  6A18              push byte +0x18
000011C1  E92AFF            jmp word 0x10ee
000011C4  FF                db 0xff
000011C5  FF                db 0xff
000011C6  FA                cli
000011C7  6A00              push byte +0x0
000011C9  6A19              push byte +0x19
000011CB  E920FF            jmp word 0x10ee
000011CE  FF                db 0xff
000011CF  FF                db 0xff
000011D0  FA                cli
000011D1  6A00              push byte +0x0
000011D3  6A1A              push byte +0x1a
000011D5  E916FF            jmp word 0x10ee
000011D8  FF                db 0xff
000011D9  FF                db 0xff
000011DA  FA                cli
000011DB  6A00              push byte +0x0
000011DD  6A1B              push byte +0x1b
000011DF  E90CFF            jmp word 0x10ee
000011E2  FF                db 0xff
000011E3  FF                db 0xff
000011E4  FA                cli
000011E5  6A00              push byte +0x0
000011E7  6A1C              push byte +0x1c
000011E9  E902FF            jmp word 0x10ee
000011EC  FF                db 0xff
000011ED  FF                db 0xff
000011EE  FA                cli
000011EF  6A00              push byte +0x0
000011F1  6A1D              push byte +0x1d
000011F3  E9F8FE            jmp word 0x10ee
000011F6  FF                db 0xff
000011F7  FF                db 0xff
000011F8  FA                cli
000011F9  6A00              push byte +0x0
000011FB  6A1E              push byte +0x1e
000011FD  E9EEFE            jmp word 0x10ee
00001200  FF                db 0xff
00001201  FF                db 0xff
00001202  FA                cli
00001203  6A00              push byte +0x0
00001205  6A1F              push byte +0x1f
00001207  E9E4FE            jmp word 0x10ee
0000120A  FF                db 0xff
0000120B  FF5756            call word [bx+0x56]
0000120E  55                push bp
0000120F  54                push sp
00001210  53                push bx
00001211  52                push dx
00001212  51                push cx
00001213  50                push ax
00001214  E8F7FC            call word 0xf0e
00001217  FF                db 0xff
00001218  FF5859            call word far [bx+si+0x59]
0000121B  5A                pop dx
0000121C  5B                pop bx
0000121D  5C                pop sp
0000121E  5D                pop bp
0000121F  5E                pop si
00001220  5F                pop di
00001221  83C408            add sp,byte +0x8
00001224  FB                sti
00001225  CF                iretw
00001226  FA                cli
00001227  6A00              push byte +0x0
00001229  6A00              push byte +0x0
0000122B  EBDF              jmp short 0x120c
0000122D  FA                cli
0000122E  6A00              push byte +0x0
00001230  6A01              push byte +0x1
00001232  EBD8              jmp short 0x120c
00001234  FA                cli
00001235  6A00              push byte +0x0
00001237  6A02              push byte +0x2
00001239  EBD1              jmp short 0x120c
0000123B  FA                cli
0000123C  6A00              push byte +0x0
0000123E  6A03              push byte +0x3
00001240  EBCA              jmp short 0x120c
00001242  FA                cli
00001243  6A00              push byte +0x0
00001245  6A04              push byte +0x4
00001247  EBC3              jmp short 0x120c
00001249  FA                cli
0000124A  6A00              push byte +0x0
0000124C  6A05              push byte +0x5
0000124E  EBBC              jmp short 0x120c
00001250  FA                cli
00001251  6A00              push byte +0x0
00001253  6A06              push byte +0x6
00001255  EBB5              jmp short 0x120c
00001257  FA                cli
00001258  6A00              push byte +0x0
0000125A  6A07              push byte +0x7
0000125C  EBAE              jmp short 0x120c
0000125E  FA                cli
0000125F  6A00              push byte +0x0
00001261  6A08              push byte +0x8
00001263  EBA7              jmp short 0x120c
00001265  FA                cli
00001266  6A00              push byte +0x0
00001268  6A09              push byte +0x9
0000126A  EBA0              jmp short 0x120c
0000126C  FA                cli
0000126D  6A00              push byte +0x0
0000126F  6A0A              push byte +0xa
00001271  EB99              jmp short 0x120c
00001273  FA                cli
00001274  6A00              push byte +0x0
00001276  6A0B              push byte +0xb
00001278  EB92              jmp short 0x120c
0000127A  FA                cli
0000127B  6A00              push byte +0x0
0000127D  6A0C              push byte +0xc
0000127F  EB8B              jmp short 0x120c
00001281  FA                cli
00001282  6A00              push byte +0x0
00001284  6A0D              push byte +0xd
00001286  EB84              jmp short 0x120c
00001288  FA                cli
00001289  6A00              push byte +0x0
0000128B  6A0E              push byte +0xe
0000128D  E97AFF            jmp word 0x120a
00001290  FF                db 0xff
00001291  FF                db 0xff
00001292  FA                cli
00001293  6A00              push byte +0x0
00001295  6A0F              push byte +0xf
00001297  E970FF            jmp word 0x120a
0000129A  FF                db 0xff
0000129B  FF0A              dec word [bp+si]
0000129D  0D0020            or ax,0x2000
000012A0  6765745F          gs jz 0x1303
000012A4  7363              jnc 0x1309
000012A6  61                popaw
000012A7  6E                outsb
000012A8  636F64            arpl [bx+0x64],bp
000012AB  655F              gs pop di
000012AD  7365              jnc 0x1314
000012AF  7400              jz 0x12b1
000012B1  64657465          gs jz 0x131a
000012B5  63745F            arpl [si+0x5f],si
000012B8  7073              jo 0x132d
000012BA  325F74            xor bl,[bx+0x74]
000012BD  7970              jns 0x132f
000012BF  650020            add [gs:bx+si],ah
000012C2  64697361626C      imul si,[fs:bp+di+0x61],word 0x6c62
000012C8  65206B62          and [gs:bp+di+0x62],ch
000012CC  64206661          and [fs:bp+0x61],ah
000012D0  696C656400        imul bp,[si+0x65],word 0x64
000012D5  206765            and [bx+0x65],ah
000012D8  7420              jz 0x12fa
000012DA  6B626420          imul sp,[bp+si+0x64],byte +0x20
000012DE  6964206661        imul sp,[si+0x20],word 0x6166
000012E3  696C656400        imul bp,[si+0x65],word 0x64
000012E8  206B62            and [bp+di+0x62],ch
000012EB  64206964          and [fs:bx+di+0x64],ch
000012EF  006465            add [si+0x65],ah
000012F2  7465              jz 0x1359
000012F4  63745F            arpl [si+0x5f],si
000012F7  7073              jo 0x136c
000012F9  325F74            xor bl,[bx+0x74]
000012FC  7970              jns 0x136e
000012FE  6520646F          and [gs:si+0x6f],ah
00001302  6E                outsb
00001303  65006469          add [gs:si+0x69],ah
00001307  7361              jnc 0x136a
00001309  626C65            bound bp,[si+0x65]
0000130C  20696E            and [bx+di+0x6e],ch
0000130F  7465              jz 0x1376
00001311  7272              jc 0x1385
00001313  7570              jnz 0x1385
00001315  7400              jz 0x1317
00001317  006973            add [bx+di+0x73],ch
0000131A  206120            and [bx+di+0x20],ah
0000131D  647561            fs jnz 0x1381
00001320  6C                insb
00001321  206368            and [bp+di+0x68],ah
00001324  61                popaw
00001325  6E                outsb
00001326  6E                outsb
00001327  656C              gs insb
00001329  205053            and [bx+si+0x53],dl
0000132C  2F                das
0000132D  3220              xor ah,[bx+si]
0000132F  636F6E            arpl [bx+0x6e],bp
00001332  7472              jz 0x13a6
00001334  6F                outsw
00001335  6C                insb
00001336  6C                insb
00001337  657200            gs jc 0x133a
0000133A  0000              add [bx+si],al
0000133C  63616E            arpl [bx+di+0x6e],sp
0000133F  27                daa
00001340  7420              jz 0x1362
00001342  626520            bound sp,[di+0x20]
00001345  61                popaw
00001346  206475            and [si+0x75],ah
00001349  61                popaw
0000134A  6C                insb
0000134B  206368            and [bp+di+0x68],ah
0000134E  61                popaw
0000134F  6E                outsb
00001350  6E                outsb
00001351  656C              gs insb
00001353  205053            and [bx+si+0x53],dl
00001356  2F                das
00001357  3220              xor ah,[bx+si]
00001359  636F6E            arpl [bx+0x6e],bp
0000135C  7472              jz 0x13d0
0000135E  6F                outsw
0000135F  6C                insb
00001360  6C                insb
00001361  657200            gs jc 0x1364
00001364  205365            and [bp+di+0x65],dl
00001367  6C                insb
00001368  66206368          o32 and [bp+di+0x68],ah
0000136C  65636B20          arpl [gs:bp+di+0x20],bp
00001370  6661              popad
00001372  696C656421        imul bp,[si+0x65],word 0x2164
00001377  0031              add [bx+di],dh
00001379  7374              jnc 0x13ef
0000137B  20696E            and [bx+di+0x6e],ch
0000137E  7465              jz 0x13e5
00001380  7266              jc 0x13e8
00001382  61                popaw
00001383  636520            arpl [di+0x20],sp
00001386  7465              jz 0x13ed
00001388  7374              jnc 0x13fe
0000138A  206661            and [bp+0x61],ah
0000138D  696C656400        imul bp,[si+0x65],word 0x64
00001392  326E64            xor ch,[bp+0x64]
00001395  20696E            and [bx+di+0x6e],ch
00001398  7465              jz 0x13ff
0000139A  7266              jc 0x1402
0000139C  61                popaw
0000139D  636520            arpl [di+0x20],sp
000013A0  7465              jz 0x1407
000013A2  7374              jnc 0x1418
000013A4  206661            and [bp+0x61],ah
000013A7  696C656400        imul bp,[si+0x65],word 0x64
000013AC  52                push dx
000013AD  657365            gs jnc 0x1415
000013B0  7420              jz 0x13d2
000013B2  44                inc sp
000013B3  657669            gs jna 0x141f
000013B6  636573            arpl [di+0x73],sp
000013B9  207761            and [bx+0x61],dh
000013BC  697420666F        imul si,[si+0x20],word 0x6f66
000013C1  7220              jc 0x13e3
000013C3  307866            xor [bx+si+0x66],bh
000013C6  61                popaw
000013C7  206661            and [bp+0x61],ah
000013CA  696C656400        imul bp,[si+0x65],word 0x64
000013CF  005265            add [bp+si+0x65],dl
000013D2  7365              jnc 0x1439
000013D4  7420              jz 0x13f6
000013D6  44                inc sp
000013D7  657669            gs jna 0x1443
000013DA  636573            arpl [di+0x73],sp
000013DD  207761            and [bx+0x61],dh
000013E0  697420666F        imul si,[si+0x20],word 0x6f66
000013E5  7220              jc 0x1407
000013E7  307861            xor [bx+si+0x61],bh
000013EA  61                popaw
000013EB  206661            and [bp+0x61],ah
000013EE  696C656400        imul bp,[si+0x65],word 0x64
000013F3  006469            add [si+0x69],ah
000013F6  7361              jnc 0x1459
000013F8  626C65            bound bp,[si+0x65]
000013FB  206B65            and [bp+di+0x65],ch
000013FE  7962              jns 0x1462
00001400  6F                outsw
00001401  61                popaw
00001402  7264              jc 0x1468
00001404  207761            and [bx+0x61],dh
00001407  697420666F        imul si,[si+0x20],word 0x6f66
0000140C  7220              jc 0x142e
0000140E  307866            xor [bx+si+0x66],bh
00001411  61                popaw
00001412  206661            and [bp+0x61],ah
00001415  696C656400        imul bp,[si+0x65],word 0x64
0000141A  0000              add [bx+si],al
0000141C  656E              gs outsb
0000141E  61                popaw
0000141F  626C65            bound bp,[si+0x65]
00001422  206B65            and [bp+di+0x65],ch
00001425  7962              jns 0x1489
00001427  6F                outsw
00001428  61                popaw
00001429  7264              jc 0x148f
0000142B  207761            and [bx+0x61],dh
0000142E  697420666F        imul si,[si+0x20],word 0x6f66
00001433  7220              jc 0x1455
00001435  307866            xor [bx+si+0x66],bh
00001438  61                popaw
00001439  206661            and [bp+0x61],ah
0000143C  696C656400        imul bp,[si+0x65],word 0x64
00001441  696E69745F        imul bp,[bp+0x69],word 0x5f74
00001446  7073              jo 0x14bb
00001448  3200              xor al,[bx+si]
0000144A  207365            and [bp+di+0x65],dh
0000144D  6C                insb
0000144E  66206368          o32 and [bp+di+0x68],ah
00001452  65636B20          arpl [gs:bp+di+0x20],bp
00001456  6661              popad
00001458  696C656421        imul bp,[si+0x65],word 0x2164
0000145D  0020              add [bx+si],ah
0000145F  317374            xor [bp+di+0x74],si
00001462  20696E            and [bx+di+0x6e],ch
00001465  7465              jz 0x14cc
00001467  7266              jc 0x14cf
00001469  61                popaw
0000146A  636520            arpl [di+0x20],sp
0000146D  7465              jz 0x14d4
0000146F  7374              jnc 0x14e5
00001471  206661            and [bp+0x61],ah
00001474  696C656400        imul bp,[si+0x65],word 0x64
00001479  0000              add [bx+si],al
0000147B  0020              add [bx+si],ah
0000147D  52                push dx
0000147E  657365            gs jnc 0x14e6
00001481  7420              jz 0x14a3
00001483  44                inc sp
00001484  657669            gs jna 0x14f0
00001487  636573            arpl [di+0x73],sp
0000148A  207761            and [bx+0x61],dh
0000148D  697420666F        imul si,[si+0x20],word 0x6f66
00001492  7220              jc 0x14b4
00001494  307866            xor [bx+si+0x66],bh
00001497  61                popaw
00001498  206661            and [bp+0x61],ah
0000149B  696C656400        imul bp,[si+0x65],word 0x64
000014A0  205265            and [bp+si+0x65],dl
000014A3  7365              jnc 0x150a
000014A5  7420              jz 0x14c7
000014A7  44                inc sp
000014A8  657669            gs jna 0x1514
000014AB  636573            arpl [di+0x73],sp
000014AE  207761            and [bx+0x61],dh
000014B1  697420666F        imul si,[si+0x20],word 0x6f66
000014B6  7220              jc 0x14d8
000014B8  307861            xor [bx+si+0x61],bh
000014BB  61                popaw
000014BC  206661            and [bp+0x61],ah
000014BF  696C656400        imul bp,[si+0x65],word 0x64
000014C4  696E69745F        imul bp,[bp+0x69],word 0x5f74
000014C9  7073              jo 0x153e
000014CB  3220              xor ah,[bx+si]
000014CD  646F              fs outsw
000014CF  6E                outsb
000014D0  650020            add [gs:bx+si],ah
000014D3  7365              jnc 0x153a
000014D5  6E                outsb
000014D6  6420636D          and [fs:bp+di+0x6d],ah
000014DA  64206279          and [fs:bp+si+0x79],ah
000014DE  7465              jz 0x1545
000014E0  0020              add [bx+si],ah
000014E2  67657420          gs jz 0x1506
000014E6  6461              fs popaw
000014E8  7461              jz 0x154b
000014EA  207273            and [bp+si+0x73],dh
000014ED  7020              jo 0x150f
000014EF  627974            bound di,[bx+di+0x74]
000014F2  657300            gs jnc 0x14f5
000014F5  746D              jz 0x1564
000014F7  705F              jo 0x1558
000014F9  6964742E62        imul sp,[si+0x74],word 0x622e
000014FE  61                popaw
000014FF  7365              jnc 0x1566
00001501  00746D            add [si+0x6d],dh
00001504  705F              jo 0x1565
00001506  6964742E6C        imul sp,[si+0x74],word 0x6c2e
0000150B  696D697400        imul bp,[di+0x69],word 0x74
00001510  44                inc sp
00001511  6976697369        imul si,[bp+0x69],word 0x6973
00001516  6F                outsw
00001517  6E                outsb
00001518  204279            and [bp+si+0x79],al
0000151B  205A65            and [bp+si+0x65],bl
0000151E  726F              jc 0x158f
00001520  004465            add [si+0x65],al
00001523  627567            bound si,[di+0x67]
00001526  004E6F            add [bp+0x6f],cl
00001529  6E                outsb
0000152A  204D61            and [di+0x61],cl
0000152D  736B              jnc 0x159a
0000152F  61                popaw
00001530  626C65            bound bp,[si+0x65]
00001533  20496E            and [bx+di+0x6e],cl
00001536  7465              jz 0x159d
00001538  7272              jc 0x15ac
0000153A  7570              jnz 0x15ac
0000153C  7400              jz 0x153e
0000153E  42                inc dx
0000153F  7265              jc 0x15a6
00001541  61                popaw
00001542  6B706F69          imul si,[bx+si+0x6f],byte +0x69
00001546  6E                outsb
00001547  7400              jz 0x1549
00001549  49                dec cx
0000154A  6E                outsb
0000154B  746F              jz 0x15bc
0000154D  204465            and [si+0x65],al
00001550  7465              jz 0x15b7
00001552  637465            arpl [si+0x65],si
00001555  64204F76          and [fs:bx+0x76],cl
00001559  657266            gs jc 0x15c2
0000155C  6C                insb
0000155D  6F                outsw
0000155E  7700              ja 0x1560
00001560  4F                dec di
00001561  7574              jnz 0x15d7
00001563  206F66            and [bx+0x66],ch
00001566  20426F            and [bp+si+0x6f],al
00001569  756E              jnz 0x15d9
0000156B  647300            fs jnc 0x156e
0000156E  49                dec cx
0000156F  6E                outsb
00001570  7661              jna 0x15d3
00001572  6C                insb
00001573  6964204F70        imul sp,[si+0x20],word 0x704f
00001578  636F64            arpl [bx+0x64],bp
0000157B  65004E6F          add [gs:bp+0x6f],cl
0000157F  20436F            and [bp+di+0x6f],al
00001582  7072              jo 0x15f6
00001584  6F                outsw
00001585  636573            arpl [di+0x73],sp
00001588  736F              jnc 0x15f9
0000158A  7200              jc 0x158c
0000158C  44                inc sp
0000158D  6F                outsw
0000158E  7562              jnz 0x15f2
00001590  6C                insb
00001591  65204661          and [gs:bp+0x61],al
00001595  756C              jnz 0x1603
00001597  7400              jz 0x1599
00001599  43                inc bx
0000159A  6F                outsw
0000159B  7072              jo 0x160f
0000159D  6F                outsw
0000159E  636573            arpl [di+0x73],sp
000015A1  736F              jnc 0x1612
000015A3  7220              jc 0x15c5
000015A5  53                push bx
000015A6  65676D            gs a32 insw
000015A9  656E              gs outsb
000015AB  7420              jz 0x15cd
000015AD  4F                dec di
000015AE  7665              jna 0x1615
000015B0  7272              jc 0x1624
000015B2  756E              jnz 0x1622
000015B4  004261            add [bp+si+0x61],al
000015B7  64205453          and [fs:si+0x53],dl
000015BB  53                push bx
000015BC  005365            add [bp+di+0x65],dl
000015BF  676D              a32 insw
000015C1  656E              gs outsb
000015C3  7420              jz 0x15e5
000015C5  4E                dec si
000015C6  6F                outsw
000015C7  7420              jz 0x15e9
000015C9  50                push ax
000015CA  7265              jc 0x1631
000015CC  7365              jnc 0x1633
000015CE  6E                outsb
000015CF  7400              jz 0x15d1
000015D1  53                push bx
000015D2  7461              jz 0x1635
000015D4  636B20            arpl [bp+di+0x20],bp
000015D7  46                inc si
000015D8  61                popaw
000015D9  756C              jnz 0x1647
000015DB  7400              jz 0x15dd
000015DD  47                inc di
000015DE  656E              gs outsb
000015E0  657261            gs jc 0x1644
000015E3  6C                insb
000015E4  205072            and [bx+si+0x72],dl
000015E7  6F                outsw
000015E8  7465              jz 0x164f
000015EA  637469            arpl [si+0x69],si
000015ED  6F                outsw
000015EE  6E                outsb
000015EF  204661            and [bp+0x61],al
000015F2  756C              jnz 0x1660
000015F4  7400              jz 0x15f6
000015F6  50                push ax
000015F7  61                popaw
000015F8  6765204661        and [gs:esi+0x61],al
000015FD  756C              jnz 0x166b
000015FF  7400              jz 0x1601
00001601  55                push bp
00001602  6E                outsb
00001603  6B6E6F77          imul bp,[bp+0x6f],byte +0x77
00001607  6E                outsb
00001608  20496E            and [bx+di+0x6e],cl
0000160B  7465              jz 0x1672
0000160D  7272              jc 0x1681
0000160F  7570              jnz 0x1681
00001611  7400              jz 0x1613
00001613  43                inc bx
00001614  6F                outsw
00001615  7072              jo 0x1689
00001617  6F                outsw
00001618  636573            arpl [di+0x73],sp
0000161B  736F              jnc 0x168c
0000161D  7220              jc 0x163f
0000161F  46                inc si
00001620  61                popaw
00001621  756C              jnz 0x168f
00001623  7400              jz 0x1625
00001625  41                inc cx
00001626  6C                insb
00001627  69676E6D65        imul sp,[bx+0x6e],word 0x656d
0000162C  6E                outsb
0000162D  7420              jz 0x164f
0000162F  43                inc bx
00001630  686563            push word 0x6365
00001633  6B004D            imul ax,[bx+si],byte +0x4d
00001636  61                popaw
00001637  636869            arpl [bx+si+0x69],bp
0000163A  6E                outsb
0000163B  65204368          and [gs:bp+di+0x68],al
0000163F  65636B00          arpl [gs:bp+di+0x0],bp
00001643  52                push dx
00001644  657365            gs jnc 0x16ac
00001647  7276              jc 0x16bf
00001649  65640020          add [fs:bx+si],ah
0000164D  6E                outsb
0000164E  657720            gs ja 0x1671
00001651  6972712068        imul si,[bp+si+0x71],word 0x6820
00001656  61                popaw
00001657  6E                outsb
00001658  646C              fs insb
0000165A  657200            gs jc 0x165d
0000165D  0000              add [bx+si],al
0000165F  0020              add [bx+si],ah
00001661  6E                outsb
00001662  657720            gs ja 0x1685
00001665  696E746572        imul bp,[bp+0x74],word 0x7265
0000166A  7275              jc 0x16e1
0000166C  7074              jo 0x16e2
0000166E  5F                pop di
0000166F  7265              jc 0x16d6
00001671  7175              jno 0x16e8
00001673  657374            gs jnc 0x16ea
00001676  5F                pop di
00001677  68616E            push word 0x6e61
0000167A  646C              fs insb
0000167C  657220            gs jc 0x169f
0000167F  61                popaw
00001680  64647200          fs jc 0x1684
00001684  206372            and [bp+di+0x72],ah
00001687  3000              xor [bx+si],al
00001689  206372            and [bp+di+0x72],ah
0000168C  3100              xor [bx+si],ax
0000168E  206372            and [bp+di+0x72],ah
00001691  3200              xor al,[bx+si]
00001693  206372            and [bp+di+0x72],ah
00001696  3300              xor ax,[bx+si]
00001698  206372            and [bp+di+0x72],ah
0000169B  3400              xor al,0x0
0000169D  50                push ax
0000169E  41                inc cx
0000169F  45                inc bp
000016A0  20656E            and [di+0x6e],ah
000016A3  61                popaw
000016A4  626C65            bound bp,[si+0x65]
000016A7  64005041          add [fs:bx+si+0x41],dl
000016AB  45                inc bp
000016AC  206469            and [si+0x69],ah
000016AF  7361              jnc 0x1712
000016B1  626C65            bound bp,[si+0x65]
000016B4  64006B65          add [fs:bp+di+0x65],ch
000016B8  726E              jc 0x1728
000016BA  656C              gs insb
000016BC  207374            and [bp+di+0x74],dh
000016BF  61                popaw
000016C0  7274              jc 0x1736
000016C2  65642E2E006578    add [cs:di+0x78],ah
000016C9  6974206B65        imul si,[si+0x20],word 0x656b
000016CE  726E              jc 0x173e
000016D0  656C              gs insb
000016D2  0000              add [bx+si],al
000016D4  1400              adc al,0x0
000016D6  0000              add [bx+si],al
000016D8  0000              add [bx+si],al
000016DA  0000              add [bx+si],al
000016DC  017A52            add [bp+si+0x52],di
000016DF  0001              add [bx+di],al
000016E1  7C08              jl 0x16eb
000016E3  011B              add [bp+di],bx
000016E5  0C04              or al,0x4
000016E7  0488              add al,0x88
000016E9  0100              add [bx+si],ax
000016EB  001C              add [si],bl
000016ED  0000              add [bx+si],al
000016EF  001C              add [si],bl
000016F1  0000              add [bx+si],al
000016F3  0013              add [bp+di],dl
000016F5  E9FFFF            jmp word 0x16f7
000016F8  1F                pop ds
000016F9  0000              add [bx+si],al
000016FB  0000              add [bx+si],al
000016FD  41                inc cx
000016FE  0E                push cs
000016FF  08850242          or [di+0x4202],al
00001703  0D055B            or ax,0x5b05
00001706  C50C              lds cx,[si]
00001708  0404              add al,0x4
0000170A  0000              add [bx+si],al
0000170C  1C00              sbb al,0x0
0000170E  0000              add [bx+si],al
00001710  3C00              cmp al,0x0
00001712  0000              add [bx+si],al
00001714  12E9              adc ch,cl
00001716  FF                db 0xff
00001717  FF1C              call word far [si]
00001719  0000              add [bx+si],al
0000171B  0000              add [bx+si],al
0000171D  41                inc cx
0000171E  0E                push cs
0000171F  08850242          or [di+0x4202],al
00001723  0D0558            or ax,0x5805
00001726  C50C              lds cx,[si]
00001728  0404              add al,0x4
0000172A  0000              add [bx+si],al
0000172C  1C00              sbb al,0x0
0000172E  0000              add [bx+si],al
00001730  5C                pop sp
00001731  0000              add [bx+si],al
00001733  000EE9FF          add [0xffe9],cl
00001737  FF1D              call word far [di]
00001739  0000              add [bx+si],al
0000173B  0000              add [bx+si],al
0000173D  41                inc cx
0000173E  0E                push cs
0000173F  08850242          or [di+0x4202],al
00001743  0D0559            or ax,0x5905
00001746  C50C              lds cx,[si]
00001748  0404              add al,0x4
0000174A  0000              add [bx+si],al
0000174C  1C00              sbb al,0x0
0000174E  0000              add [bx+si],al
00001750  7C00              jl 0x1752
00001752  0000              add [bx+si],al
00001754  0BE9              or bp,cx
00001756  FF                db 0xff
00001757  FF17              call word [bx]
00001759  0000              add [bx+si],al
0000175B  0000              add [bx+si],al
0000175D  41                inc cx
0000175E  0E                push cs
0000175F  08850242          or [di+0x4202],al
00001763  0D0553            or ax,0x5305
00001766  C50C              lds cx,[si]
00001768  0404              add al,0x4
0000176A  0000              add [bx+si],al
0000176C  1C00              sbb al,0x0
0000176E  0000              add [bx+si],al
00001770  9C                pushfw
00001771  0000              add [bx+si],al
00001773  0002              add [bp+si],al
00001775  E9FFFF            jmp word 0x1777
00001778  250000            and ax,0x0
0000177B  0000              add [bx+si],al
0000177D  41                inc cx
0000177E  0E                push cs
0000177F  08850242          or [di+0x4202],al
00001783  0D0561            or ax,0x6105
00001786  C50C              lds cx,[si]
00001788  0404              add al,0x4
0000178A  0000              add [bx+si],al
0000178C  1C00              sbb al,0x0
0000178E  0000              add [bx+si],al
00001790  BC0000            mov sp,0x0
00001793  0007              add [bx],al
00001795  E9FFFF            jmp word 0x1797
00001798  2900              sub [bx+si],ax
0000179A  0000              add [bx+si],al
0000179C  00410E            add [bx+di+0xe],al
0000179F  08850242          or [di+0x4202],al
000017A3  0D0565            or ax,0x6505
000017A6  C50C              lds cx,[si]
000017A8  0404              add al,0x4
000017AA  0000              add [bx+si],al
000017AC  1C00              sbb al,0x0
000017AE  0000              add [bx+si],al
000017B0  DC00              fadd qword [bx+si]
000017B2  0000              add [bx+si],al
000017B4  10E9              adc cl,ch
000017B6  FF                db 0xff
000017B7  FF4E00            dec word [bp+0x0]
000017BA  0000              add [bx+si],al
000017BC  00410E            add [bx+di+0xe],al
000017BF  08850242          or [di+0x4202],al
000017C3  0D0502            or ax,0x205
000017C6  4A                dec dx
000017C7  C50C              lds cx,[si]
000017C9  0404              add al,0x4
000017CB  001C              add [si],bl
000017CD  0000              add [bx+si],al
000017CF  00FC              add ah,bh
000017D1  0000              add [bx+si],al
000017D3  003EE9FF          add [0xffe9],bh
000017D7  FF4A00            dec word [bp+si+0x0]
000017DA  0000              add [bx+si],al
000017DC  00410E            add [bx+di+0xe],al
000017DF  08850242          or [di+0x4202],al
000017E3  0D0502            or ax,0x205
000017E6  46                inc si
000017E7  C50C              lds cx,[si]
000017E9  0404              add al,0x4
000017EB  001C              add [si],bl
000017ED  0000              add [bx+si],al
000017EF  001C              add [si],bl
000017F1  0100              add [bx+si],ax
000017F3  0068E9            add [bx+si-0x17],ch
000017F6  FF                db 0xff
000017F7  FF4800            dec word [bx+si+0x0]
000017FA  0000              add [bx+si],al
000017FC  00410E            add [bx+di+0xe],al
000017FF  08850242          or [di+0x4202],al
00001803  0D0502            or ax,0x205
00001806  44                inc sp
00001807  C50C              lds cx,[si]
00001809  0404              add al,0x4
0000180B  001C              add [si],bl
0000180D  0000              add [bx+si],al
0000180F  003C              add [si],bh
00001811  0100              add [bx+si],ax
00001813  0090E9FF          add [bx+si-0x17],dl
00001817  FF260000          jmp word [0x0]
0000181B  0000              add [bx+si],al
0000181D  41                inc cx
0000181E  0E                push cs
0000181F  08850242          or [di+0x4202],al
00001823  0D0562            or ax,0x6205
00001826  C50C              lds cx,[si]
00001828  0404              add al,0x4
0000182A  0000              add [bx+si],al
0000182C  1C00              sbb al,0x0
0000182E  0000              add [bx+si],al
00001830  5C                pop sp
00001831  0100              add [bx+si],ax
00001833  0096E9FF          add [bp-0x17],dl
00001837  FF                db 0xff
00001838  3C00              cmp al,0x0
0000183A  0000              add [bx+si],al
0000183C  00410E            add [bx+di+0xe],al
0000183F  08850242          or [di+0x4202],al
00001843  0D0578            or ax,0x7805
00001846  C50C              lds cx,[si]
00001848  0404              add al,0x4
0000184A  0000              add [bx+si],al
0000184C  1C00              sbb al,0x0
0000184E  0000              add [bx+si],al
00001850  7C01              jl 0x1853
00001852  0000              add [bx+si],al
00001854  B2E9              mov dl,0xe9
00001856  FF                db 0xff
00001857  FF2E0000          jmp word far [0x0]
0000185B  0000              add [bx+si],al
0000185D  41                inc cx
0000185E  0E                push cs
0000185F  08850242          or [di+0x4202],al
00001863  0D056A            or ax,0x6a05
00001866  C50C              lds cx,[si]
00001868  0404              add al,0x4
0000186A  0000              add [bx+si],al
0000186C  2000              and [bx+si],al
0000186E  0000              add [bx+si],al
00001870  9C                pushfw
00001871  0100              add [bx+si],ax
00001873  00C0              add al,al
00001875  E9FFFF            jmp word 0x1877
00001878  61                popaw
00001879  0000              add [bx+si],al
0000187B  0000              add [bx+si],al
0000187D  41                inc cx
0000187E  0E                push cs
0000187F  08850242          or [di+0x4202],al
00001883  0D0544            or ax,0x4405
00001886  830302            add word [bp+di],byte +0x2
00001889  58                pop ax
0000188A  C3                ret
0000188B  41                inc cx
0000188C  C50C              lds cx,[si]
0000188E  0404              add al,0x4
00001890  2000              and [bx+si],al
00001892  0000              add [bx+si],al
00001894  C00100            rol byte [bx+di],byte 0x0
00001897  00FD              add ch,bh
00001899  E9FFFF            jmp word 0x189b
0000189C  6300              arpl [bx+si],ax
0000189E  0000              add [bx+si],al
000018A0  00410E            add [bx+di+0xe],al
000018A3  08850242          or [di+0x4202],al
000018A7  0D0544            or ax,0x4405
000018AA  830302            add word [bp+di],byte +0x2
000018AD  5A                pop dx
000018AE  C3                ret
000018AF  41                inc cx
000018B0  C50C              lds cx,[si]
000018B2  0404              add al,0x4
000018B4  2000              and [bx+si],al
000018B6  0000              add [bx+si],al
000018B8  E401              in al,0x1
000018BA  0000              add [bx+si],al
000018BC  3CEA              cmp al,0xea
000018BE  FF                db 0xff
000018BF  FF4A00            dec word [bp+si+0x0]
000018C2  0000              add [bx+si],al
000018C4  00410E            add [bx+di+0xe],al
000018C7  08850242          or [di+0x4202],al
000018CB  0D0544            or ax,0x4405
000018CE  830302            add word [bp+di],byte +0x2
000018D1  41                inc cx
000018D2  C3                ret
000018D3  41                inc cx
000018D4  C50C              lds cx,[si]
000018D6  0404              add al,0x4
000018D8  1C00              sbb al,0x0
000018DA  0000              add [bx+si],al
000018DC  0802              or [bp+si],al
000018DE  0000              add [bx+si],al
000018E0  62                db 0x62
000018E1  EAFFFF4800        jmp word 0x48:0xffff
000018E6  0000              add [bx+si],al
000018E8  00410E            add [bx+di+0xe],al
000018EB  08850242          or [di+0x4202],al
000018EF  0D0502            or ax,0x205
000018F2  44                inc sp
000018F3  C50C              lds cx,[si]
000018F5  0404              add al,0x4
000018F7  001C              add [si],bl
000018F9  0000              add [bx+si],al
000018FB  0028              add [bx+si],ch
000018FD  0200              add al,[bx+si]
000018FF  008AEAFF          add [bp+si-0x16],cl
00001903  FF                db 0xff
00001904  FC                cld
00001905  0000              add [bx+si],al
00001907  0000              add [bx+si],al
00001909  41                inc cx
0000190A  0E                push cs
0000190B  08850242          or [di+0x4202],al
0000190F  0D0502            or ax,0x205
00001912  F8                clc
00001913  C50C              lds cx,[si]
00001915  0404              add al,0x4
00001917  001C              add [si],bl
00001919  0000              add [bx+si],al
0000191B  004802            add [bx+si+0x2],cl
0000191E  0000              add [bx+si],al
00001920  66EBFF            o32 jmp short 0x1922
00001923  FF060000          inc word [0x0]
00001927  0000              add [bx+si],al
00001929  41                inc cx
0000192A  0E                push cs
0000192B  08850242          or [di+0x4202],al
0000192F  0D0542            or ax,0x4205
00001932  C50C              lds cx,[si]
00001934  0404              add al,0x4
00001936  0000              add [bx+si],al
00001938  1C00              sbb al,0x0
0000193A  0000              add [bx+si],al
0000193C  680200            push word 0x2
0000193F  004CEB            add [si-0x15],cl
00001942  FF                db 0xff
00001943  FF060000          inc word [0x0]
00001947  0000              add [bx+si],al
00001949  41                inc cx
0000194A  0E                push cs
0000194B  08850242          or [di+0x4202],al
0000194F  0D0542            or ax,0x4205
00001952  C50C              lds cx,[si]
00001954  0404              add al,0x4
00001956  0000              add [bx+si],al
00001958  1C00              sbb al,0x0
0000195A  0000              add [bx+si],al
0000195C  8802              mov [bp+si],al
0000195E  0000              add [bx+si],al
00001960  32EB              xor ch,bl
00001962  FF                db 0xff
00001963  FF37              push word [bx]
00001965  0000              add [bx+si],al
00001967  0000              add [bx+si],al
00001969  41                inc cx
0000196A  0E                push cs
0000196B  08850242          or [di+0x4202],al
0000196F  0D0573            or ax,0x7305
00001972  C50C              lds cx,[si]
00001974  0404              add al,0x4
00001976  0000              add [bx+si],al
00001978  1C00              sbb al,0x0
0000197A  0000              add [bx+si],al
0000197C  A802              test al,0x2
0000197E  0000              add [bx+si],al
00001980  49                dec cx
00001981  EBFF              jmp short 0x1982
00001983  FF25              jmp word [di]
00001985  0000              add [bx+si],al
00001987  0000              add [bx+si],al
00001989  41                inc cx
0000198A  0E                push cs
0000198B  08850242          or [di+0x4202],al
0000198F  0D0561            or ax,0x6105
00001992  C50C              lds cx,[si]
00001994  0404              add al,0x4
00001996  0000              add [bx+si],al
00001998  1C00              sbb al,0x0
0000199A  0000              add [bx+si],al
0000199C  C8020000          enter 0x2,0x0
000019A0  4E                dec si
000019A1  EBFF              jmp short 0x19a2
000019A3  FF21              jmp word [bx+di]
000019A5  0000              add [bx+si],al
000019A7  0000              add [bx+si],al
000019A9  41                inc cx
000019AA  0E                push cs
000019AB  08850242          or [di+0x4202],al
000019AF  0D055D            or ax,0x5d05
000019B2  C50C              lds cx,[si]
000019B4  0404              add al,0x4
000019B6  0000              add [bx+si],al
000019B8  1C00              sbb al,0x0
000019BA  0000              add [bx+si],al
000019BC  E80200            call word 0x19c1
000019BF  004FEB            add [bx-0x15],cl
000019C2  FF                db 0xff
000019C3  FF                db 0xff
000019C4  3F                aas
000019C5  0000              add [bx+si],al
000019C7  0000              add [bx+si],al
000019C9  41                inc cx
000019CA  0E                push cs
000019CB  08850242          or [di+0x4202],al
000019CF  0D057B            or ax,0x7b05
000019D2  C50C              lds cx,[si]
000019D4  0404              add al,0x4
000019D6  0000              add [bx+si],al
000019D8  1C00              sbb al,0x0
000019DA  0000              add [bx+si],al
000019DC  0803              or [bp+di],al
000019DE  0000              add [bx+si],al
000019E0  6E                outsb
000019E1  EBFF              jmp short 0x19e2
000019E3  FF                db 0xff
000019E4  3F                aas
000019E5  0000              add [bx+si],al
000019E7  0000              add [bx+si],al
000019E9  41                inc cx
000019EA  0E                push cs
000019EB  08850242          or [di+0x4202],al
000019EF  0D057B            or ax,0x7b05
000019F2  C50C              lds cx,[si]
000019F4  0404              add al,0x4
000019F6  0000              add [bx+si],al
000019F8  1C00              sbb al,0x0
000019FA  0000              add [bx+si],al
000019FC  2803              sub [bp+di],al
000019FE  0000              add [bx+si],al
00001A00  8D                db 0x8d
00001A01  EBFF              jmp short 0x1a02
00001A03  FF2C              jmp word far [si]
00001A05  0000              add [bx+si],al
00001A07  0000              add [bx+si],al
00001A09  41                inc cx
00001A0A  0E                push cs
00001A0B  08850242          or [di+0x4202],al
00001A0F  0D0568            or ax,0x6805
00001A12  C50C              lds cx,[si]
00001A14  0404              add al,0x4
00001A16  0000              add [bx+si],al
00001A18  1C00              sbb al,0x0
00001A1A  0000              add [bx+si],al
00001A1C  48                dec ax
00001A1D  0300              add ax,[bx+si]
00001A1F  0099EBFF          add [bx+di-0x15],bl
00001A23  FF27              jmp word [bx]
00001A25  0000              add [bx+si],al
00001A27  0000              add [bx+si],al
00001A29  41                inc cx
00001A2A  0E                push cs
00001A2B  08850242          or [di+0x4202],al
00001A2F  0D0563            or ax,0x6305
00001A32  C50C              lds cx,[si]
00001A34  0404              add al,0x4
00001A36  0000              add [bx+si],al
00001A38  1C00              sbb al,0x0
00001A3A  0000              add [bx+si],al
00001A3C  680300            push word 0x3
00001A3F  00A0EBFF          add [bx+si-0x15],ah
00001A43  FF20              jmp word [bx+si]
00001A45  0000              add [bx+si],al
00001A47  0000              add [bx+si],al
00001A49  41                inc cx
00001A4A  0E                push cs
00001A4B  08850242          or [di+0x4202],al
00001A4F  0D055C            or ax,0x5c05
00001A52  C50C              lds cx,[si]
00001A54  0404              add al,0x4
00001A56  0000              add [bx+si],al
00001A58  1C00              sbb al,0x0
00001A5A  0000              add [bx+si],al
00001A5C  8803              mov [bp+di],al
00001A5E  0000              add [bx+si],al
00001A60  A0EBFF            mov al,[0xffeb]
00001A63  FF37              push word [bx]
00001A65  0000              add [bx+si],al
00001A67  0000              add [bx+si],al
00001A69  41                inc cx
00001A6A  0E                push cs
00001A6B  08850242          or [di+0x4202],al
00001A6F  0D0573            or ax,0x7305
00001A72  C50C              lds cx,[si]
00001A74  0404              add al,0x4
00001A76  0000              add [bx+si],al
00001A78  1C00              sbb al,0x0
00001A7A  0000              add [bx+si],al
00001A7C  A803              test al,0x3
00001A7E  0000              add [bx+si],al
00001A80  B7EB              mov bh,0xeb
00001A82  FF                db 0xff
00001A83  FFB20000          push word [bp+si+0x0]
00001A87  0000              add [bx+si],al
00001A89  41                inc cx
00001A8A  0E                push cs
00001A8B  08850242          or [di+0x4202],al
00001A8F  0D0502            or ax,0x205
00001A92  AE                scasb
00001A93  C50C              lds cx,[si]
00001A95  0404              add al,0x4
00001A97  001C              add [si],bl
00001A99  0000              add [bx+si],al
00001A9B  00C8              add al,cl
00001A9D  0300              add ax,[bx+si]
00001A9F  0049EC            add [bx+di-0x14],cl
00001AA2  FF                db 0xff
00001AA3  FF                db 0xff
00001AA4  D901              fld dword [bx+di]
00001AA6  0000              add [bx+si],al
00001AA8  00410E            add [bx+di+0xe],al
00001AAB  08850242          or [di+0x4202],al
00001AAF  0D0503            or ax,0x305
00001AB2  D501              aad 0x1
00001AB4  C50C              lds cx,[si]
00001AB6  0404              add al,0x4
00001AB8  1C00              sbb al,0x0
00001ABA  0000              add [bx+si],al
00001ABC  E80300            call word 0x1ac2
00001ABF  0002              add [bp+si],al
00001AC1  EE                out dx,al
00001AC2  FF                db 0xff
00001AC3  FF2E0100          jmp word far [0x1]
00001AC7  0000              add [bx+si],al
00001AC9  41                inc cx
00001ACA  0E                push cs
00001ACB  08850242          or [di+0x4202],al
00001ACF  0D0503            or ax,0x305
00001AD2  2A01              sub al,[bx+di]
00001AD4  C50C              lds cx,[si]
00001AD6  0404              add al,0x4
00001AD8  1800              sbb [bx+si],al
00001ADA  0000              add [bx+si],al
00001ADC  0804              or [si],al
00001ADE  0000              add [bx+si],al
00001AE0  10EF              adc bh,ch
00001AE2  FF                db 0xff
00001AE3  FF5000            call word [bx+si+0x0]
00001AE6  0000              add [bx+si],al
00001AE8  00410E            add [bx+di+0xe],al
00001AEB  08850242          or [di+0x4202],al
00001AEF  0D0500            or ax,0x5
00001AF2  0000              add [bx+si],al
00001AF4  1C00              sbb al,0x0
00001AF6  0000              add [bx+si],al
00001AF8  2404              and al,0x4
00001AFA  0000              add [bx+si],al
00001AFC  44                inc sp
00001AFD  EF                out dx,ax
00001AFE  FF                db 0xff
00001AFF  FF17              call word [bx]
00001B01  0000              add [bx+si],al
00001B03  0000              add [bx+si],al
00001B05  41                inc cx
00001B06  0E                push cs
00001B07  08850242          or [di+0x4202],al
00001B0B  0D0553            or ax,0x5305
00001B0E  C50C              lds cx,[si]
00001B10  0404              add al,0x4
00001B12  0000              add [bx+si],al
00001B14  1C00              sbb al,0x0
00001B16  0000              add [bx+si],al
00001B18  44                inc sp
00001B19  0400              add al,0x0
00001B1B  003B              add [bp+di],bh
00001B1D  EF                out dx,ax
00001B1E  FF                db 0xff
00001B1F  FF4500            inc word [di+0x0]
00001B22  0000              add [bx+si],al
00001B24  00410E            add [bx+di+0xe],al
00001B27  08850242          or [di+0x4202],al
00001B2B  0D0502            or ax,0x205
00001B2E  41                inc cx
00001B2F  C50C              lds cx,[si]
00001B31  0404              add al,0x4
00001B33  001C              add [si],bl
00001B35  0000              add [bx+si],al
00001B37  006404            add [si+0x4],ah
00001B3A  0000              add [bx+si],al
00001B3C  60                pushaw
00001B3D  EF                out dx,ax
00001B3E  FF                db 0xff
00001B3F  FF                db 0xff
00001B40  3E0000            add [ds:bx+si],al
00001B43  0000              add [bx+si],al
00001B45  41                inc cx
00001B46  0E                push cs
00001B47  08850242          or [di+0x4202],al
00001B4B  0D057A            or ax,0x7a05
00001B4E  C50C              lds cx,[si]
00001B50  0404              add al,0x4
00001B52  0000              add [bx+si],al
00001B54  1C00              sbb al,0x0
00001B56  0000              add [bx+si],al
00001B58  8404              test [si],al
00001B5A  0000              add [bx+si],al
00001B5C  7EEF              jng 0x1b4d
00001B5E  FF                db 0xff
00001B5F  FF20              jmp word [bx+si]
00001B61  0000              add [bx+si],al
00001B63  0000              add [bx+si],al
00001B65  41                inc cx
00001B66  0E                push cs
00001B67  08850242          or [di+0x4202],al
00001B6B  0D055C            or ax,0x5c05
00001B6E  C50C              lds cx,[si]
00001B70  0404              add al,0x4
00001B72  0000              add [bx+si],al
00001B74  1C00              sbb al,0x0
00001B76  0000              add [bx+si],al
00001B78  A4                movsb
00001B79  0400              add al,0x0
00001B7B  007EEF            add [bp-0x11],bh
00001B7E  FF                db 0xff
00001B7F  FF160400          call word [0x4]
00001B83  0000              add [bx+si],al
00001B85  41                inc cx
00001B86  0E                push cs
00001B87  08850242          or [di+0x4202],al
00001B8B  0D0503            or ax,0x305
00001B8E  1204              adc al,[si]
00001B90  C50C              lds cx,[si]
00001B92  0404              add al,0x4
00001B94  1C00              sbb al,0x0
00001B96  0000              add [bx+si],al
00001B98  C404              les ax,[si]
00001B9A  0000              add [bx+si],al
00001B9C  74F3              jz 0x1b91
00001B9E  FF                db 0xff
00001B9F  FF4C00            dec word [si+0x0]
00001BA2  0000              add [bx+si],al
00001BA4  00410E            add [bx+di+0xe],al
00001BA7  08850242          or [di+0x4202],al
00001BAB  0D0502            or ax,0x205
00001BAE  48                dec ax
00001BAF  C50C              lds cx,[si]
00001BB1  0404              add al,0x4
00001BB3  001C              add [si],bl
00001BB5  0000              add [bx+si],al
00001BB7  00E4              add ah,ah
00001BB9  0400              add al,0x0
00001BBB  00A0F3FF          add [bx+si-0xd],ah
00001BBF  FF25              jmp word [di]
00001BC1  0000              add [bx+si],al
00001BC3  0000              add [bx+si],al
00001BC5  41                inc cx
00001BC6  0E                push cs
00001BC7  08850242          or [di+0x4202],al
00001BCB  0D0561            or ax,0x6105
00001BCE  C50C              lds cx,[si]
00001BD0  0404              add al,0x4
00001BD2  0000              add [bx+si],al
00001BD4  1C00              sbb al,0x0
00001BD6  0000              add [bx+si],al
00001BD8  0405              add al,0x5
00001BDA  0000              add [bx+si],al
00001BDC  A5                movsw
00001BDD  F3                rep
00001BDE  FF                db 0xff
00001BDF  FF27              jmp word [bx]
00001BE1  0000              add [bx+si],al
00001BE3  0000              add [bx+si],al
00001BE5  41                inc cx
00001BE6  0E                push cs
00001BE7  08850242          or [di+0x4202],al
00001BEB  0D0563            or ax,0x6305
00001BEE  C50C              lds cx,[si]
00001BF0  0404              add al,0x4
00001BF2  0000              add [bx+si],al
00001BF4  1C00              sbb al,0x0
00001BF6  0000              add [bx+si],al
00001BF8  2405              and al,0x5
00001BFA  0000              add [bx+si],al
00001BFC  AC                lodsb
00001BFD  F3                rep
00001BFE  FF                db 0xff
00001BFF  FF27              jmp word [bx]
00001C01  0000              add [bx+si],al
00001C03  0000              add [bx+si],al
00001C05  41                inc cx
00001C06  0E                push cs
00001C07  08850242          or [di+0x4202],al
00001C0B  0D0563            or ax,0x6305
00001C0E  C50C              lds cx,[si]
00001C10  0404              add al,0x4
00001C12  0000              add [bx+si],al
00001C14  1C00              sbb al,0x0
00001C16  0000              add [bx+si],al
00001C18  44                inc sp
00001C19  050000            add ax,0x0
00001C1C  B3F3              mov bl,0xf3
00001C1E  FF                db 0xff
00001C1F  FF27              jmp word [bx]
00001C21  0000              add [bx+si],al
00001C23  0000              add [bx+si],al
00001C25  41                inc cx
00001C26  0E                push cs
00001C27  08850242          or [di+0x4202],al
00001C2B  0D0563            or ax,0x6305
00001C2E  C50C              lds cx,[si]
00001C30  0404              add al,0x4
00001C32  0000              add [bx+si],al
00001C34  1C00              sbb al,0x0
00001C36  0000              add [bx+si],al
00001C38  64050000          fs add ax,0x0
00001C3C  BAF3FF            mov dx,0xfff3
00001C3F  FF27              jmp word [bx]
00001C41  0000              add [bx+si],al
00001C43  0000              add [bx+si],al
00001C45  41                inc cx
00001C46  0E                push cs
00001C47  08850242          or [di+0x4202],al
00001C4B  0D0563            or ax,0x6305
00001C4E  C50C              lds cx,[si]
00001C50  0404              add al,0x4
00001C52  0000              add [bx+si],al
00001C54  1C00              sbb al,0x0
00001C56  0000              add [bx+si],al
00001C58  8405              test [di],al
00001C5A  0000              add [bx+si],al
00001C5C  C1                db 0xc1
00001C5D  F3                rep
00001C5E  FF                db 0xff
00001C5F  FF27              jmp word [bx]
00001C61  0000              add [bx+si],al
00001C63  0000              add [bx+si],al
00001C65  41                inc cx
00001C66  0E                push cs
00001C67  08850242          or [di+0x4202],al
00001C6B  0D0563            or ax,0x6305
00001C6E  C50C              lds cx,[si]
00001C70  0404              add al,0x4
00001C72  0000              add [bx+si],al
00001C74  1C00              sbb al,0x0
00001C76  0000              add [bx+si],al
00001C78  A4                movsb
00001C79  050000            add ax,0x0
00001C7C  C8F3FFFF          enter 0xfff3,0xff
00001C80  0E                push cs
00001C81  0000              add [bx+si],al
00001C83  0000              add [bx+si],al
00001C85  41                inc cx
00001C86  0E                push cs
00001C87  08850242          or [di+0x4202],al
00001C8B  0D054A            or ax,0x4a05
00001C8E  C50C              lds cx,[si]
00001C90  0404              add al,0x4
00001C92  0000              add [bx+si],al
00001C94  2000              and [bx+si],al
00001C96  0000              add [bx+si],al
00001C98  C405              les ax,[di]
00001C9A  0000              add [bx+si],al
00001C9C  B6F3              mov dh,0xf3
00001C9E  FF                db 0xff
00001C9F  FF5500            call word [di+0x0]
00001CA2  0000              add [bx+si],al
00001CA4  00410E            add [bx+di+0xe],al
00001CA7  08850242          or [di+0x4202],al
00001CAB  0D0544            or ax,0x4405
00001CAE  830302            add word [bp+di],byte +0x2
00001CB1  4C                dec sp
00001CB2  C3                ret
00001CB3  41                inc cx
00001CB4  C50C              lds cx,[si]
00001CB6  0404              add al,0x4
00001CB8  1C00              sbb al,0x0
00001CBA  0000              add [bx+si],al
00001CBC  E80500            call word 0x1cc4
00001CBF  00E7              add bh,ah
00001CC1  F3                rep
00001CC2  FF                db 0xff
00001CC3  FF                db 0xff
00001CC4  3E0000            add [ds:bx+si],al
00001CC7  0000              add [bx+si],al
00001CC9  41                inc cx
00001CCA  0E                push cs
00001CCB  08850242          or [di+0x4202],al
00001CCF  0D057A            or ax,0x7a05
00001CD2  C50C              lds cx,[si]
00001CD4  0404              add al,0x4
00001CD6  0000              add [bx+si],al
00001CD8  0000              add [bx+si],al
00001CDA  0000              add [bx+si],al
00001CDC  0000              add [bx+si],al
00001CDE  0000              add [bx+si],al
00001CE0  0000              add [bx+si],al
00001CE2  0000              add [bx+si],al
00001CE4  0000              add [bx+si],al
00001CE6  0000              add [bx+si],al
00001CE8  0000              add [bx+si],al
00001CEA  0000              add [bx+si],al
00001CEC  0000              add [bx+si],al
00001CEE  0000              add [bx+si],al
00001CF0  0000              add [bx+si],al
00001CF2  0000              add [bx+si],al
00001CF4  0000              add [bx+si],al
00001CF6  0000              add [bx+si],al
00001CF8  0000              add [bx+si],al
00001CFA  0000              add [bx+si],al
00001CFC  0000              add [bx+si],al
00001CFE  0000              add [bx+si],al
00001D00  0000              add [bx+si],al
00001D02  0000              add [bx+si],al
00001D04  0000              add [bx+si],al
00001D06  0000              add [bx+si],al
00001D08  0000              add [bx+si],al
00001D0A  0000              add [bx+si],al
00001D0C  0000              add [bx+si],al
00001D0E  0000              add [bx+si],al
00001D10  0000              add [bx+si],al
00001D12  0000              add [bx+si],al
00001D14  0000              add [bx+si],al
00001D16  0000              add [bx+si],al
00001D18  0000              add [bx+si],al
00001D1A  0000              add [bx+si],al
00001D1C  0000              add [bx+si],al
00001D1E  0000              add [bx+si],al
00001D20  0000              add [bx+si],al
00001D22  0000              add [bx+si],al
00001D24  0000              add [bx+si],al
00001D26  0000              add [bx+si],al
00001D28  0000              add [bx+si],al
00001D2A  0000              add [bx+si],al
00001D2C  0000              add [bx+si],al
00001D2E  0000              add [bx+si],al
00001D30  0000              add [bx+si],al
00001D32  0000              add [bx+si],al
00001D34  0000              add [bx+si],al
00001D36  0000              add [bx+si],al
00001D38  0000              add [bx+si],al
00001D3A  0000              add [bx+si],al
00001D3C  0000              add [bx+si],al
00001D3E  0000              add [bx+si],al
00001D40  0000              add [bx+si],al
00001D42  0000              add [bx+si],al
00001D44  0000              add [bx+si],al
00001D46  0000              add [bx+si],al
00001D48  0000              add [bx+si],al
00001D4A  0000              add [bx+si],al
00001D4C  0000              add [bx+si],al
00001D4E  0000              add [bx+si],al
00001D50  0000              add [bx+si],al
00001D52  0000              add [bx+si],al
00001D54  0000              add [bx+si],al
00001D56  0000              add [bx+si],al
00001D58  0000              add [bx+si],al
00001D5A  0000              add [bx+si],al
00001D5C  0000              add [bx+si],al
00001D5E  0000              add [bx+si],al
00001D60  0000              add [bx+si],al
00001D62  0000              add [bx+si],al
00001D64  0000              add [bx+si],al
00001D66  0000              add [bx+si],al
00001D68  0000              add [bx+si],al
00001D6A  0000              add [bx+si],al
00001D6C  0000              add [bx+si],al
00001D6E  0000              add [bx+si],al
00001D70  0000              add [bx+si],al
00001D72  0000              add [bx+si],al
00001D74  0000              add [bx+si],al
00001D76  0000              add [bx+si],al
00001D78  0000              add [bx+si],al
00001D7A  0000              add [bx+si],al
00001D7C  0000              add [bx+si],al
00001D7E  0000              add [bx+si],al
00001D80  0000              add [bx+si],al
00001D82  0000              add [bx+si],al
00001D84  0000              add [bx+si],al
00001D86  0000              add [bx+si],al
00001D88  0000              add [bx+si],al
00001D8A  0000              add [bx+si],al
00001D8C  0000              add [bx+si],al
00001D8E  0000              add [bx+si],al
00001D90  0000              add [bx+si],al
00001D92  0000              add [bx+si],al
00001D94  0000              add [bx+si],al
00001D96  0000              add [bx+si],al
00001D98  0000              add [bx+si],al
00001D9A  0000              add [bx+si],al
00001D9C  0000              add [bx+si],al
00001D9E  0000              add [bx+si],al
00001DA0  0000              add [bx+si],al
00001DA2  0000              add [bx+si],al
00001DA4  0000              add [bx+si],al
00001DA6  0000              add [bx+si],al
00001DA8  0000              add [bx+si],al
00001DAA  0000              add [bx+si],al
00001DAC  0000              add [bx+si],al
00001DAE  0000              add [bx+si],al
00001DB0  0000              add [bx+si],al
00001DB2  0000              add [bx+si],al
00001DB4  0000              add [bx+si],al
00001DB6  0000              add [bx+si],al
00001DB8  0000              add [bx+si],al
00001DBA  0000              add [bx+si],al
00001DBC  0000              add [bx+si],al
00001DBE  0000              add [bx+si],al
00001DC0  0000              add [bx+si],al
00001DC2  0000              add [bx+si],al
00001DC4  0000              add [bx+si],al
00001DC6  0000              add [bx+si],al
00001DC8  0000              add [bx+si],al
00001DCA  0000              add [bx+si],al
00001DCC  0000              add [bx+si],al
00001DCE  0000              add [bx+si],al
00001DD0  0000              add [bx+si],al
00001DD2  0000              add [bx+si],al
00001DD4  0000              add [bx+si],al
00001DD6  0000              add [bx+si],al
00001DD8  0000              add [bx+si],al
00001DDA  0000              add [bx+si],al
00001DDC  0000              add [bx+si],al
00001DDE  0000              add [bx+si],al
00001DE0  0000              add [bx+si],al
00001DE2  0000              add [bx+si],al
00001DE4  0000              add [bx+si],al
00001DE6  0000              add [bx+si],al
00001DE8  0000              add [bx+si],al
00001DEA  0000              add [bx+si],al
00001DEC  0000              add [bx+si],al
00001DEE  0000              add [bx+si],al
00001DF0  0000              add [bx+si],al
00001DF2  0000              add [bx+si],al
00001DF4  0000              add [bx+si],al
00001DF6  0000              add [bx+si],al
00001DF8  0000              add [bx+si],al
00001DFA  0000              add [bx+si],al
00001DFC  0000              add [bx+si],al
00001DFE  0000              add [bx+si],al
00001E00  0000              add [bx+si],al
00001E02  0000              add [bx+si],al
00001E04  0000              add [bx+si],al
00001E06  0000              add [bx+si],al
00001E08  0000              add [bx+si],al
00001E0A  0000              add [bx+si],al
00001E0C  0000              add [bx+si],al
00001E0E  0000              add [bx+si],al
00001E10  0000              add [bx+si],al
00001E12  0000              add [bx+si],al
00001E14  0000              add [bx+si],al
00001E16  0000              add [bx+si],al
00001E18  0000              add [bx+si],al
00001E1A  0000              add [bx+si],al
00001E1C  0000              add [bx+si],al
00001E1E  0000              add [bx+si],al
00001E20  0000              add [bx+si],al
00001E22  0000              add [bx+si],al
00001E24  0000              add [bx+si],al
00001E26  0000              add [bx+si],al
00001E28  0000              add [bx+si],al
00001E2A  0000              add [bx+si],al
00001E2C  0000              add [bx+si],al
00001E2E  0000              add [bx+si],al
00001E30  0000              add [bx+si],al
00001E32  0000              add [bx+si],al
00001E34  0000              add [bx+si],al
00001E36  0000              add [bx+si],al
00001E38  0000              add [bx+si],al
00001E3A  0000              add [bx+si],al
00001E3C  0000              add [bx+si],al
00001E3E  0000              add [bx+si],al
00001E40  0000              add [bx+si],al
00001E42  0000              add [bx+si],al
00001E44  0000              add [bx+si],al
00001E46  0000              add [bx+si],al
00001E48  0000              add [bx+si],al
00001E4A  0000              add [bx+si],al
00001E4C  0000              add [bx+si],al
00001E4E  0000              add [bx+si],al
00001E50  0000              add [bx+si],al
00001E52  0000              add [bx+si],al
00001E54  0000              add [bx+si],al
00001E56  0000              add [bx+si],al
00001E58  0000              add [bx+si],al
00001E5A  0000              add [bx+si],al
00001E5C  0000              add [bx+si],al
00001E5E  0000              add [bx+si],al
00001E60  0000              add [bx+si],al
00001E62  0000              add [bx+si],al
00001E64  0000              add [bx+si],al
00001E66  0000              add [bx+si],al
00001E68  0000              add [bx+si],al
00001E6A  0000              add [bx+si],al
00001E6C  0000              add [bx+si],al
00001E6E  0000              add [bx+si],al
00001E70  0000              add [bx+si],al
00001E72  0000              add [bx+si],al
00001E74  0000              add [bx+si],al
00001E76  0000              add [bx+si],al
00001E78  0000              add [bx+si],al
00001E7A  0000              add [bx+si],al
00001E7C  0000              add [bx+si],al
00001E7E  0000              add [bx+si],al
00001E80  0000              add [bx+si],al
00001E82  0000              add [bx+si],al
00001E84  0000              add [bx+si],al
00001E86  0000              add [bx+si],al
00001E88  0000              add [bx+si],al
00001E8A  0000              add [bx+si],al
00001E8C  0000              add [bx+si],al
00001E8E  0000              add [bx+si],al
00001E90  0000              add [bx+si],al
00001E92  0000              add [bx+si],al
00001E94  0000              add [bx+si],al
00001E96  0000              add [bx+si],al
00001E98  0000              add [bx+si],al
00001E9A  0000              add [bx+si],al
00001E9C  0000              add [bx+si],al
00001E9E  0000              add [bx+si],al
00001EA0  0000              add [bx+si],al
00001EA2  0000              add [bx+si],al
00001EA4  0000              add [bx+si],al
00001EA6  0000              add [bx+si],al
00001EA8  0000              add [bx+si],al
00001EAA  0000              add [bx+si],al
00001EAC  0000              add [bx+si],al
00001EAE  0000              add [bx+si],al
00001EB0  0000              add [bx+si],al
00001EB2  0000              add [bx+si],al
00001EB4  0000              add [bx+si],al
00001EB6  0000              add [bx+si],al
00001EB8  0000              add [bx+si],al
00001EBA  0000              add [bx+si],al
00001EBC  0000              add [bx+si],al
00001EBE  0000              add [bx+si],al
00001EC0  0000              add [bx+si],al
00001EC2  0000              add [bx+si],al
00001EC4  0000              add [bx+si],al
00001EC6  0000              add [bx+si],al
00001EC8  0000              add [bx+si],al
00001ECA  0000              add [bx+si],al
00001ECC  0000              add [bx+si],al
00001ECE  0000              add [bx+si],al
00001ED0  0000              add [bx+si],al
00001ED2  0000              add [bx+si],al
00001ED4  0000              add [bx+si],al
00001ED6  0000              add [bx+si],al
00001ED8  0000              add [bx+si],al
00001EDA  0000              add [bx+si],al
00001EDC  0000              add [bx+si],al
00001EDE  0000              add [bx+si],al
00001EE0  0000              add [bx+si],al
00001EE2  0000              add [bx+si],al
00001EE4  0000              add [bx+si],al
00001EE6  0000              add [bx+si],al
00001EE8  0000              add [bx+si],al
00001EEA  0000              add [bx+si],al
00001EEC  0000              add [bx+si],al
00001EEE  0000              add [bx+si],al
00001EF0  0000              add [bx+si],al
00001EF2  0000              add [bx+si],al
00001EF4  0000              add [bx+si],al
00001EF6  0000              add [bx+si],al
00001EF8  0000              add [bx+si],al
00001EFA  0000              add [bx+si],al
00001EFC  0000              add [bx+si],al
00001EFE  0000              add [bx+si],al
00001F00  0000              add [bx+si],al
00001F02  0000              add [bx+si],al
00001F04  0000              add [bx+si],al
00001F06  0000              add [bx+si],al
00001F08  0000              add [bx+si],al
00001F0A  0000              add [bx+si],al
00001F0C  0000              add [bx+si],al
00001F0E  0000              add [bx+si],al
00001F10  0000              add [bx+si],al
00001F12  0000              add [bx+si],al
00001F14  0000              add [bx+si],al
00001F16  0000              add [bx+si],al
00001F18  0000              add [bx+si],al
00001F1A  0000              add [bx+si],al
00001F1C  0000              add [bx+si],al
00001F1E  0000              add [bx+si],al
00001F20  0000              add [bx+si],al
00001F22  0000              add [bx+si],al
00001F24  0000              add [bx+si],al
00001F26  0000              add [bx+si],al
00001F28  0000              add [bx+si],al
00001F2A  0000              add [bx+si],al
00001F2C  0000              add [bx+si],al
00001F2E  0000              add [bx+si],al
00001F30  0000              add [bx+si],al
00001F32  0000              add [bx+si],al
00001F34  0000              add [bx+si],al
00001F36  0000              add [bx+si],al
00001F38  0000              add [bx+si],al
00001F3A  0000              add [bx+si],al
00001F3C  0000              add [bx+si],al
00001F3E  0000              add [bx+si],al
00001F40  0000              add [bx+si],al
00001F42  0000              add [bx+si],al
00001F44  0000              add [bx+si],al
00001F46  0000              add [bx+si],al
00001F48  0000              add [bx+si],al
00001F4A  0000              add [bx+si],al
00001F4C  0000              add [bx+si],al
00001F4E  0000              add [bx+si],al
00001F50  0000              add [bx+si],al
00001F52  0000              add [bx+si],al
00001F54  0000              add [bx+si],al
00001F56  0000              add [bx+si],al
00001F58  0000              add [bx+si],al
00001F5A  0000              add [bx+si],al
00001F5C  0000              add [bx+si],al
00001F5E  0000              add [bx+si],al
00001F60  0000              add [bx+si],al
00001F62  0000              add [bx+si],al
00001F64  0000              add [bx+si],al
00001F66  0000              add [bx+si],al
00001F68  0000              add [bx+si],al
00001F6A  0000              add [bx+si],al
00001F6C  0000              add [bx+si],al
00001F6E  0000              add [bx+si],al
00001F70  0000              add [bx+si],al
00001F72  0000              add [bx+si],al
00001F74  0000              add [bx+si],al
00001F76  0000              add [bx+si],al
00001F78  0000              add [bx+si],al
00001F7A  0000              add [bx+si],al
00001F7C  0000              add [bx+si],al
00001F7E  0000              add [bx+si],al
00001F80  0000              add [bx+si],al
00001F82  0000              add [bx+si],al
00001F84  0000              add [bx+si],al
00001F86  0000              add [bx+si],al
00001F88  0000              add [bx+si],al
00001F8A  0000              add [bx+si],al
00001F8C  0000              add [bx+si],al
00001F8E  0000              add [bx+si],al
00001F90  0000              add [bx+si],al
00001F92  0000              add [bx+si],al
00001F94  0000              add [bx+si],al
00001F96  0000              add [bx+si],al
00001F98  0000              add [bx+si],al
00001F9A  0000              add [bx+si],al
00001F9C  0000              add [bx+si],al
00001F9E  0000              add [bx+si],al
00001FA0  0000              add [bx+si],al
00001FA2  0000              add [bx+si],al
00001FA4  0000              add [bx+si],al
00001FA6  0000              add [bx+si],al
00001FA8  0000              add [bx+si],al
00001FAA  0000              add [bx+si],al
00001FAC  0000              add [bx+si],al
00001FAE  0000              add [bx+si],al
00001FB0  0000              add [bx+si],al
00001FB2  0000              add [bx+si],al
00001FB4  0000              add [bx+si],al
00001FB6  0000              add [bx+si],al
00001FB8  0000              add [bx+si],al
00001FBA  0000              add [bx+si],al
00001FBC  0000              add [bx+si],al
00001FBE  0000              add [bx+si],al
00001FC0  0000              add [bx+si],al
00001FC2  0000              add [bx+si],al
00001FC4  0000              add [bx+si],al
00001FC6  0000              add [bx+si],al
00001FC8  0000              add [bx+si],al
00001FCA  0000              add [bx+si],al
00001FCC  0000              add [bx+si],al
00001FCE  0000              add [bx+si],al
00001FD0  0000              add [bx+si],al
00001FD2  0000              add [bx+si],al
00001FD4  0000              add [bx+si],al
00001FD6  0000              add [bx+si],al
00001FD8  0000              add [bx+si],al
00001FDA  0000              add [bx+si],al
00001FDC  0000              add [bx+si],al
00001FDE  0000              add [bx+si],al
00001FE0  0000              add [bx+si],al
00001FE2  0000              add [bx+si],al
00001FE4  0000              add [bx+si],al
00001FE6  0000              add [bx+si],al
00001FE8  0000              add [bx+si],al
00001FEA  0000              add [bx+si],al
00001FEC  0000              add [bx+si],al
00001FEE  0000              add [bx+si],al
00001FF0  0000              add [bx+si],al
00001FF2  0000              add [bx+si],al
00001FF4  0000              add [bx+si],al
00001FF6  0000              add [bx+si],al
00001FF8  0000              add [bx+si],al
00001FFA  0000              add [bx+si],al
00001FFC  0000              add [bx+si],al
00001FFE  0000              add [bx+si],al
00002000  0000              add [bx+si],al
00002002  0000              add [bx+si],al
00002004  0000              add [bx+si],al
00002006  0000              add [bx+si],al
00002008  0000              add [bx+si],al
0000200A  0000              add [bx+si],al
0000200C  0000              add [bx+si],al
0000200E  0000              add [bx+si],al
00002010  0000              add [bx+si],al
00002012  0000              add [bx+si],al
00002014  0000              add [bx+si],al
00002016  0000              add [bx+si],al
00002018  0000              add [bx+si],al
0000201A  0000              add [bx+si],al
0000201C  0000              add [bx+si],al
0000201E  0000              add [bx+si],al
00002020  0000              add [bx+si],al
00002022  0000              add [bx+si],al
00002024  0000              add [bx+si],al
00002026  0000              add [bx+si],al
00002028  0000              add [bx+si],al
0000202A  0000              add [bx+si],al
0000202C  0000              add [bx+si],al
0000202E  0000              add [bx+si],al
00002030  0000              add [bx+si],al
00002032  0000              add [bx+si],al
00002034  0000              add [bx+si],al
00002036  0000              add [bx+si],al
00002038  0000              add [bx+si],al
0000203A  0000              add [bx+si],al
0000203C  0000              add [bx+si],al
0000203E  0000              add [bx+si],al
00002040  0000              add [bx+si],al
00002042  0000              add [bx+si],al
00002044  0000              add [bx+si],al
00002046  0000              add [bx+si],al
00002048  0000              add [bx+si],al
0000204A  0000              add [bx+si],al
0000204C  0000              add [bx+si],al
0000204E  0000              add [bx+si],al
00002050  0000              add [bx+si],al
00002052  0000              add [bx+si],al
00002054  0000              add [bx+si],al
00002056  0000              add [bx+si],al
00002058  0000              add [bx+si],al
0000205A  0000              add [bx+si],al
0000205C  0000              add [bx+si],al
0000205E  0000              add [bx+si],al
00002060  0000              add [bx+si],al
00002062  0000              add [bx+si],al
00002064  0000              add [bx+si],al
00002066  0000              add [bx+si],al
00002068  0000              add [bx+si],al
0000206A  0000              add [bx+si],al
0000206C  0000              add [bx+si],al
0000206E  0000              add [bx+si],al
00002070  0000              add [bx+si],al
00002072  0000              add [bx+si],al
00002074  0000              add [bx+si],al
00002076  0000              add [bx+si],al
00002078  0000              add [bx+si],al
0000207A  0000              add [bx+si],al
0000207C  0000              add [bx+si],al
0000207E  0000              add [bx+si],al
00002080  0000              add [bx+si],al
00002082  0000              add [bx+si],al
00002084  0000              add [bx+si],al
00002086  0000              add [bx+si],al
00002088  0000              add [bx+si],al
0000208A  0000              add [bx+si],al
0000208C  0000              add [bx+si],al
0000208E  0000              add [bx+si],al
00002090  0000              add [bx+si],al
00002092  0000              add [bx+si],al
00002094  0000              add [bx+si],al
00002096  0000              add [bx+si],al
00002098  0000              add [bx+si],al
0000209A  0000              add [bx+si],al
0000209C  0000              add [bx+si],al
0000209E  0000              add [bx+si],al
000020A0  0000              add [bx+si],al
000020A2  0000              add [bx+si],al
000020A4  0000              add [bx+si],al
000020A6  0000              add [bx+si],al
000020A8  0000              add [bx+si],al
000020AA  0000              add [bx+si],al
000020AC  0000              add [bx+si],al
000020AE  0000              add [bx+si],al
000020B0  0000              add [bx+si],al
000020B2  0000              add [bx+si],al
000020B4  0000              add [bx+si],al
000020B6  0000              add [bx+si],al
000020B8  0000              add [bx+si],al
000020BA  0000              add [bx+si],al
000020BC  0000              add [bx+si],al
000020BE  0000              add [bx+si],al
000020C0  0000              add [bx+si],al
000020C2  0000              add [bx+si],al
000020C4  0000              add [bx+si],al
000020C6  0000              add [bx+si],al
000020C8  0000              add [bx+si],al
000020CA  0000              add [bx+si],al
000020CC  0000              add [bx+si],al
000020CE  0000              add [bx+si],al
000020D0  0000              add [bx+si],al
000020D2  0000              add [bx+si],al
000020D4  0000              add [bx+si],al
000020D6  0000              add [bx+si],al
000020D8  0000              add [bx+si],al
000020DA  0000              add [bx+si],al
000020DC  0000              add [bx+si],al
000020DE  0000              add [bx+si],al
000020E0  0000              add [bx+si],al
000020E2  0000              add [bx+si],al
000020E4  0000              add [bx+si],al
000020E6  0000              add [bx+si],al
000020E8  0000              add [bx+si],al
000020EA  0000              add [bx+si],al
000020EC  0000              add [bx+si],al
000020EE  0000              add [bx+si],al
000020F0  0000              add [bx+si],al
000020F2  0000              add [bx+si],al
000020F4  0000              add [bx+si],al
000020F6  0000              add [bx+si],al
000020F8  0000              add [bx+si],al
000020FA  0000              add [bx+si],al
000020FC  0000              add [bx+si],al
000020FE  0000              add [bx+si],al
00002100  0000              add [bx+si],al
00002102  0000              add [bx+si],al
00002104  0000              add [bx+si],al
00002106  0000              add [bx+si],al
00002108  0000              add [bx+si],al
0000210A  0000              add [bx+si],al
0000210C  0000              add [bx+si],al
0000210E  0000              add [bx+si],al
00002110  0000              add [bx+si],al
00002112  0000              add [bx+si],al
00002114  0000              add [bx+si],al
00002116  0000              add [bx+si],al
00002118  0000              add [bx+si],al
0000211A  0000              add [bx+si],al
0000211C  0000              add [bx+si],al
0000211E  0000              add [bx+si],al
00002120  0000              add [bx+si],al
00002122  0000              add [bx+si],al
00002124  0000              add [bx+si],al
00002126  0000              add [bx+si],al
00002128  0000              add [bx+si],al
0000212A  0000              add [bx+si],al
0000212C  0000              add [bx+si],al
0000212E  0000              add [bx+si],al
00002130  0000              add [bx+si],al
00002132  0000              add [bx+si],al
00002134  0000              add [bx+si],al
00002136  0000              add [bx+si],al
00002138  0000              add [bx+si],al
0000213A  0000              add [bx+si],al
0000213C  0000              add [bx+si],al
0000213E  0000              add [bx+si],al
00002140  0000              add [bx+si],al
00002142  0000              add [bx+si],al
00002144  0000              add [bx+si],al
00002146  0000              add [bx+si],al
00002148  0000              add [bx+si],al
0000214A  0000              add [bx+si],al
0000214C  0000              add [bx+si],al
0000214E  0000              add [bx+si],al
00002150  0000              add [bx+si],al
00002152  0000              add [bx+si],al
00002154  0000              add [bx+si],al
00002156  0000              add [bx+si],al
00002158  0000              add [bx+si],al
0000215A  0000              add [bx+si],al
0000215C  0000              add [bx+si],al
0000215E  0000              add [bx+si],al
00002160  0000              add [bx+si],al
00002162  0000              add [bx+si],al
00002164  0000              add [bx+si],al
00002166  0000              add [bx+si],al
00002168  0000              add [bx+si],al
0000216A  0000              add [bx+si],al
0000216C  0000              add [bx+si],al
0000216E  0000              add [bx+si],al
00002170  0000              add [bx+si],al
00002172  0000              add [bx+si],al
00002174  0000              add [bx+si],al
00002176  0000              add [bx+si],al
00002178  0000              add [bx+si],al
0000217A  0000              add [bx+si],al
0000217C  0000              add [bx+si],al
0000217E  0000              add [bx+si],al
00002180  0000              add [bx+si],al
00002182  0000              add [bx+si],al
00002184  0000              add [bx+si],al
00002186  0000              add [bx+si],al
00002188  0000              add [bx+si],al
0000218A  0000              add [bx+si],al
0000218C  0000              add [bx+si],al
0000218E  0000              add [bx+si],al
00002190  0000              add [bx+si],al
00002192  0000              add [bx+si],al
00002194  0000              add [bx+si],al
00002196  0000              add [bx+si],al
00002198  0000              add [bx+si],al
0000219A  0000              add [bx+si],al
0000219C  0000              add [bx+si],al
0000219E  0000              add [bx+si],al
000021A0  0000              add [bx+si],al
000021A2  0000              add [bx+si],al
000021A4  0000              add [bx+si],al
000021A6  0000              add [bx+si],al
000021A8  0000              add [bx+si],al
000021AA  0000              add [bx+si],al
000021AC  0000              add [bx+si],al
000021AE  0000              add [bx+si],al
000021B0  0000              add [bx+si],al
000021B2  0000              add [bx+si],al
000021B4  0000              add [bx+si],al
000021B6  0000              add [bx+si],al
000021B8  0000              add [bx+si],al
000021BA  0000              add [bx+si],al
000021BC  0000              add [bx+si],al
000021BE  0000              add [bx+si],al
000021C0  0000              add [bx+si],al
000021C2  0000              add [bx+si],al
000021C4  0000              add [bx+si],al
000021C6  0000              add [bx+si],al
000021C8  0000              add [bx+si],al
000021CA  0000              add [bx+si],al
000021CC  0000              add [bx+si],al
000021CE  0000              add [bx+si],al
000021D0  0000              add [bx+si],al
000021D2  0000              add [bx+si],al
000021D4  0000              add [bx+si],al
000021D6  0000              add [bx+si],al
000021D8  0000              add [bx+si],al
000021DA  0000              add [bx+si],al
000021DC  0000              add [bx+si],al
000021DE  0000              add [bx+si],al
000021E0  0000              add [bx+si],al
000021E2  0000              add [bx+si],al
000021E4  0000              add [bx+si],al
000021E6  0000              add [bx+si],al
000021E8  0000              add [bx+si],al
000021EA  0000              add [bx+si],al
000021EC  0000              add [bx+si],al
000021EE  0000              add [bx+si],al
000021F0  0000              add [bx+si],al
000021F2  0000              add [bx+si],al
000021F4  0000              add [bx+si],al
000021F6  0000              add [bx+si],al
000021F8  0000              add [bx+si],al
000021FA  0000              add [bx+si],al
000021FC  0000              add [bx+si],al
000021FE  0000              add [bx+si],al
00002200  0000              add [bx+si],al
00002202  0000              add [bx+si],al
00002204  0000              add [bx+si],al
00002206  0000              add [bx+si],al
00002208  0000              add [bx+si],al
0000220A  0000              add [bx+si],al
0000220C  0000              add [bx+si],al
0000220E  0000              add [bx+si],al
00002210  0000              add [bx+si],al
00002212  0000              add [bx+si],al
00002214  0000              add [bx+si],al
00002216  0000              add [bx+si],al
00002218  0000              add [bx+si],al
0000221A  0000              add [bx+si],al
0000221C  0000              add [bx+si],al
0000221E  0000              add [bx+si],al
00002220  0000              add [bx+si],al
00002222  0000              add [bx+si],al
00002224  0000              add [bx+si],al
00002226  0000              add [bx+si],al
00002228  0000              add [bx+si],al
0000222A  0000              add [bx+si],al
0000222C  0000              add [bx+si],al
0000222E  0000              add [bx+si],al
00002230  0000              add [bx+si],al
00002232  0000              add [bx+si],al
00002234  0000              add [bx+si],al
00002236  0000              add [bx+si],al
00002238  0000              add [bx+si],al
0000223A  0000              add [bx+si],al
0000223C  0000              add [bx+si],al
0000223E  0000              add [bx+si],al
00002240  0000              add [bx+si],al
00002242  0000              add [bx+si],al
00002244  0000              add [bx+si],al
00002246  0000              add [bx+si],al
00002248  0000              add [bx+si],al
0000224A  0000              add [bx+si],al
0000224C  0000              add [bx+si],al
0000224E  0000              add [bx+si],al
00002250  0000              add [bx+si],al
00002252  0000              add [bx+si],al
00002254  0000              add [bx+si],al
00002256  0000              add [bx+si],al
00002258  0000              add [bx+si],al
0000225A  0000              add [bx+si],al
0000225C  0000              add [bx+si],al
0000225E  0000              add [bx+si],al
00002260  0000              add [bx+si],al
00002262  0000              add [bx+si],al
00002264  0000              add [bx+si],al
00002266  0000              add [bx+si],al
00002268  0000              add [bx+si],al
0000226A  0000              add [bx+si],al
0000226C  0000              add [bx+si],al
0000226E  0000              add [bx+si],al
00002270  0000              add [bx+si],al
00002272  0000              add [bx+si],al
00002274  0000              add [bx+si],al
00002276  0000              add [bx+si],al
00002278  0000              add [bx+si],al
0000227A  0000              add [bx+si],al
0000227C  0000              add [bx+si],al
0000227E  0000              add [bx+si],al
00002280  0000              add [bx+si],al
00002282  0000              add [bx+si],al
00002284  0000              add [bx+si],al
00002286  0000              add [bx+si],al
00002288  0000              add [bx+si],al
0000228A  0000              add [bx+si],al
0000228C  0000              add [bx+si],al
0000228E  0000              add [bx+si],al
00002290  0000              add [bx+si],al
00002292  0000              add [bx+si],al
00002294  0000              add [bx+si],al
00002296  0000              add [bx+si],al
00002298  0000              add [bx+si],al
0000229A  0000              add [bx+si],al
0000229C  0000              add [bx+si],al
0000229E  0000              add [bx+si],al
000022A0  0000              add [bx+si],al
000022A2  0000              add [bx+si],al
000022A4  0000              add [bx+si],al
000022A6  0000              add [bx+si],al
000022A8  0000              add [bx+si],al
000022AA  0000              add [bx+si],al
000022AC  0000              add [bx+si],al
000022AE  0000              add [bx+si],al
000022B0  0000              add [bx+si],al
000022B2  0000              add [bx+si],al
000022B4  0000              add [bx+si],al
000022B6  0000              add [bx+si],al
000022B8  0000              add [bx+si],al
000022BA  0000              add [bx+si],al
000022BC  0000              add [bx+si],al
000022BE  0000              add [bx+si],al
000022C0  0000              add [bx+si],al
000022C2  0000              add [bx+si],al
000022C4  0000              add [bx+si],al
000022C6  0000              add [bx+si],al
000022C8  0000              add [bx+si],al
000022CA  0000              add [bx+si],al
000022CC  0000              add [bx+si],al
000022CE  0000              add [bx+si],al
000022D0  0000              add [bx+si],al
000022D2  0000              add [bx+si],al
000022D4  0000              add [bx+si],al
000022D6  0000              add [bx+si],al
000022D8  0000              add [bx+si],al
000022DA  0000              add [bx+si],al
000022DC  0000              add [bx+si],al
000022DE  0000              add [bx+si],al
000022E0  0000              add [bx+si],al
000022E2  0000              add [bx+si],al
000022E4  0000              add [bx+si],al
000022E6  0000              add [bx+si],al
000022E8  0000              add [bx+si],al
000022EA  0000              add [bx+si],al
000022EC  0000              add [bx+si],al
000022EE  0000              add [bx+si],al
000022F0  0000              add [bx+si],al
000022F2  0000              add [bx+si],al
000022F4  0000              add [bx+si],al
000022F6  0000              add [bx+si],al
000022F8  0000              add [bx+si],al
000022FA  0000              add [bx+si],al
000022FC  0000              add [bx+si],al
000022FE  0000              add [bx+si],al
00002300  0000              add [bx+si],al
00002302  0000              add [bx+si],al
00002304  0000              add [bx+si],al
00002306  0000              add [bx+si],al
00002308  0000              add [bx+si],al
0000230A  0000              add [bx+si],al
0000230C  0000              add [bx+si],al
0000230E  0000              add [bx+si],al
00002310  0000              add [bx+si],al
00002312  0000              add [bx+si],al
00002314  0000              add [bx+si],al
00002316  0000              add [bx+si],al
00002318  0000              add [bx+si],al
0000231A  0000              add [bx+si],al
0000231C  0000              add [bx+si],al
0000231E  0000              add [bx+si],al
00002320  0000              add [bx+si],al
00002322  0000              add [bx+si],al
00002324  0000              add [bx+si],al
00002326  0000              add [bx+si],al
00002328  0000              add [bx+si],al
0000232A  0000              add [bx+si],al
0000232C  0000              add [bx+si],al
0000232E  0000              add [bx+si],al
00002330  0000              add [bx+si],al
00002332  0000              add [bx+si],al
00002334  0000              add [bx+si],al
00002336  0000              add [bx+si],al
00002338  0000              add [bx+si],al
0000233A  0000              add [bx+si],al
0000233C  0000              add [bx+si],al
0000233E  0000              add [bx+si],al
00002340  0000              add [bx+si],al
00002342  0000              add [bx+si],al
00002344  0000              add [bx+si],al
00002346  0000              add [bx+si],al
00002348  0000              add [bx+si],al
0000234A  0000              add [bx+si],al
0000234C  0000              add [bx+si],al
0000234E  0000              add [bx+si],al
00002350  0000              add [bx+si],al
00002352  0000              add [bx+si],al
00002354  0000              add [bx+si],al
00002356  0000              add [bx+si],al
00002358  0000              add [bx+si],al
0000235A  0000              add [bx+si],al
0000235C  0000              add [bx+si],al
0000235E  0000              add [bx+si],al
00002360  0000              add [bx+si],al
00002362  0000              add [bx+si],al
00002364  0000              add [bx+si],al
00002366  0000              add [bx+si],al
00002368  0000              add [bx+si],al
0000236A  0000              add [bx+si],al
0000236C  0000              add [bx+si],al
0000236E  0000              add [bx+si],al
00002370  0000              add [bx+si],al
00002372  0000              add [bx+si],al
00002374  0000              add [bx+si],al
00002376  0000              add [bx+si],al
00002378  0000              add [bx+si],al
0000237A  0000              add [bx+si],al
0000237C  0000              add [bx+si],al
0000237E  0000              add [bx+si],al
00002380  0000              add [bx+si],al
00002382  0000              add [bx+si],al
00002384  0000              add [bx+si],al
00002386  0000              add [bx+si],al
00002388  0000              add [bx+si],al
0000238A  0000              add [bx+si],al
0000238C  0000              add [bx+si],al
0000238E  0000              add [bx+si],al
00002390  0000              add [bx+si],al
00002392  0000              add [bx+si],al
00002394  0000              add [bx+si],al
00002396  0000              add [bx+si],al
00002398  0000              add [bx+si],al
0000239A  0000              add [bx+si],al
0000239C  0000              add [bx+si],al
0000239E  0000              add [bx+si],al
000023A0  0000              add [bx+si],al
000023A2  0000              add [bx+si],al
000023A4  0000              add [bx+si],al
000023A6  0000              add [bx+si],al
000023A8  0000              add [bx+si],al
000023AA  0000              add [bx+si],al
000023AC  0000              add [bx+si],al
000023AE  0000              add [bx+si],al
000023B0  0000              add [bx+si],al
000023B2  0000              add [bx+si],al
000023B4  0000              add [bx+si],al
000023B6  0000              add [bx+si],al
000023B8  0000              add [bx+si],al
000023BA  0000              add [bx+si],al
000023BC  0000              add [bx+si],al
000023BE  0000              add [bx+si],al
000023C0  0000              add [bx+si],al
000023C2  0000              add [bx+si],al
000023C4  0000              add [bx+si],al
000023C6  0000              add [bx+si],al
000023C8  0000              add [bx+si],al
000023CA  0000              add [bx+si],al
000023CC  0000              add [bx+si],al
000023CE  0000              add [bx+si],al
000023D0  0000              add [bx+si],al
000023D2  0000              add [bx+si],al
000023D4  0000              add [bx+si],al
000023D6  0000              add [bx+si],al
000023D8  0000              add [bx+si],al
000023DA  0000              add [bx+si],al
000023DC  0000              add [bx+si],al
000023DE  0000              add [bx+si],al
000023E0  0000              add [bx+si],al
000023E2  0000              add [bx+si],al
000023E4  0000              add [bx+si],al
000023E6  0000              add [bx+si],al
000023E8  0000              add [bx+si],al
000023EA  0000              add [bx+si],al
000023EC  0000              add [bx+si],al
000023EE  0000              add [bx+si],al
000023F0  0000              add [bx+si],al
000023F2  0000              add [bx+si],al
000023F4  0000              add [bx+si],al
000023F6  0000              add [bx+si],al
000023F8  0000              add [bx+si],al
000023FA  0000              add [bx+si],al
000023FC  0000              add [bx+si],al
000023FE  0000              add [bx+si],al
00002400  0000              add [bx+si],al
00002402  0000              add [bx+si],al
00002404  0000              add [bx+si],al
00002406  0000              add [bx+si],al
00002408  0000              add [bx+si],al
0000240A  0000              add [bx+si],al
0000240C  0000              add [bx+si],al
0000240E  0000              add [bx+si],al
00002410  0000              add [bx+si],al
00002412  0000              add [bx+si],al
00002414  0000              add [bx+si],al
00002416  0000              add [bx+si],al
00002418  0000              add [bx+si],al
0000241A  0000              add [bx+si],al
0000241C  0000              add [bx+si],al
0000241E  0000              add [bx+si],al
00002420  0000              add [bx+si],al
00002422  0000              add [bx+si],al
00002424  0000              add [bx+si],al
00002426  0000              add [bx+si],al
00002428  0000              add [bx+si],al
0000242A  0000              add [bx+si],al
0000242C  0000              add [bx+si],al
0000242E  0000              add [bx+si],al
00002430  0000              add [bx+si],al
00002432  0000              add [bx+si],al
00002434  0000              add [bx+si],al
00002436  0000              add [bx+si],al
00002438  0000              add [bx+si],al
0000243A  0000              add [bx+si],al
0000243C  0000              add [bx+si],al
0000243E  0000              add [bx+si],al
00002440  0000              add [bx+si],al
00002442  0000              add [bx+si],al
00002444  0000              add [bx+si],al
00002446  0000              add [bx+si],al
00002448  0000              add [bx+si],al
0000244A  0000              add [bx+si],al
0000244C  0000              add [bx+si],al
0000244E  0000              add [bx+si],al
00002450  0000              add [bx+si],al
00002452  0000              add [bx+si],al
00002454  0000              add [bx+si],al
00002456  0000              add [bx+si],al
00002458  0000              add [bx+si],al
0000245A  0000              add [bx+si],al
0000245C  0000              add [bx+si],al
0000245E  0000              add [bx+si],al
00002460  0000              add [bx+si],al
00002462  0000              add [bx+si],al
00002464  0000              add [bx+si],al
00002466  0000              add [bx+si],al
00002468  0000              add [bx+si],al
0000246A  0000              add [bx+si],al
0000246C  0000              add [bx+si],al
0000246E  0000              add [bx+si],al
00002470  0000              add [bx+si],al
00002472  0000              add [bx+si],al
00002474  0000              add [bx+si],al
00002476  0000              add [bx+si],al
00002478  0000              add [bx+si],al
0000247A  0000              add [bx+si],al
0000247C  0000              add [bx+si],al
0000247E  0000              add [bx+si],al
00002480  0000              add [bx+si],al
00002482  0000              add [bx+si],al
00002484  0000              add [bx+si],al
00002486  0000              add [bx+si],al
00002488  0000              add [bx+si],al
0000248A  0000              add [bx+si],al
0000248C  0000              add [bx+si],al
0000248E  0000              add [bx+si],al
00002490  0000              add [bx+si],al
00002492  0000              add [bx+si],al
00002494  0000              add [bx+si],al
00002496  0000              add [bx+si],al
00002498  0000              add [bx+si],al
0000249A  0000              add [bx+si],al
0000249C  0000              add [bx+si],al
0000249E  0000              add [bx+si],al
000024A0  0000              add [bx+si],al
000024A2  0000              add [bx+si],al
000024A4  0000              add [bx+si],al
000024A6  0000              add [bx+si],al
000024A8  0000              add [bx+si],al
000024AA  0000              add [bx+si],al
000024AC  0000              add [bx+si],al
000024AE  0000              add [bx+si],al
000024B0  0000              add [bx+si],al
000024B2  0000              add [bx+si],al
000024B4  0000              add [bx+si],al
000024B6  0000              add [bx+si],al
000024B8  0000              add [bx+si],al
000024BA  0000              add [bx+si],al
000024BC  0000              add [bx+si],al
000024BE  0000              add [bx+si],al
000024C0  0000              add [bx+si],al
000024C2  0000              add [bx+si],al
000024C4  0000              add [bx+si],al
000024C6  0000              add [bx+si],al
000024C8  0000              add [bx+si],al
000024CA  0000              add [bx+si],al
000024CC  0000              add [bx+si],al
000024CE  0000              add [bx+si],al
000024D0  0000              add [bx+si],al
000024D2  0000              add [bx+si],al
000024D4  0000              add [bx+si],al
000024D6  0000              add [bx+si],al
000024D8  0000              add [bx+si],al
000024DA  0000              add [bx+si],al
000024DC  0000              add [bx+si],al
000024DE  0000              add [bx+si],al
000024E0  0000              add [bx+si],al
000024E2  0000              add [bx+si],al
000024E4  0000              add [bx+si],al
000024E6  0000              add [bx+si],al
000024E8  0000              add [bx+si],al
000024EA  0000              add [bx+si],al
000024EC  0000              add [bx+si],al
000024EE  0000              add [bx+si],al
000024F0  0000              add [bx+si],al
000024F2  0000              add [bx+si],al
000024F4  0000              add [bx+si],al
000024F6  0000              add [bx+si],al
000024F8  0000              add [bx+si],al
000024FA  0000              add [bx+si],al
000024FC  0000              add [bx+si],al
000024FE  0000              add [bx+si],al
00002500  0000              add [bx+si],al
00002502  0000              add [bx+si],al
00002504  0000              add [bx+si],al
00002506  0000              add [bx+si],al
00002508  0000              add [bx+si],al
0000250A  0000              add [bx+si],al
0000250C  0000              add [bx+si],al
0000250E  0000              add [bx+si],al
00002510  0000              add [bx+si],al
00002512  0000              add [bx+si],al
00002514  0000              add [bx+si],al
00002516  0000              add [bx+si],al
00002518  0000              add [bx+si],al
0000251A  0000              add [bx+si],al
0000251C  0000              add [bx+si],al
0000251E  0000              add [bx+si],al
00002520  0000              add [bx+si],al
00002522  0000              add [bx+si],al
00002524  0000              add [bx+si],al
00002526  0000              add [bx+si],al
00002528  0000              add [bx+si],al
0000252A  0000              add [bx+si],al
0000252C  0000              add [bx+si],al
0000252E  0000              add [bx+si],al
00002530  0000              add [bx+si],al
00002532  0000              add [bx+si],al
00002534  0000              add [bx+si],al
00002536  0000              add [bx+si],al
00002538  0000              add [bx+si],al
0000253A  0000              add [bx+si],al
0000253C  0000              add [bx+si],al
0000253E  0000              add [bx+si],al
00002540  0000              add [bx+si],al
00002542  0000              add [bx+si],al
00002544  0000              add [bx+si],al
00002546  0000              add [bx+si],al
00002548  0000              add [bx+si],al
0000254A  0000              add [bx+si],al
0000254C  0000              add [bx+si],al
0000254E  0000              add [bx+si],al
00002550  0000              add [bx+si],al
00002552  0000              add [bx+si],al
00002554  0000              add [bx+si],al
00002556  0000              add [bx+si],al
00002558  0000              add [bx+si],al
0000255A  0000              add [bx+si],al
0000255C  0000              add [bx+si],al
0000255E  0000              add [bx+si],al
00002560  0000              add [bx+si],al
00002562  0000              add [bx+si],al
00002564  0000              add [bx+si],al
00002566  0000              add [bx+si],al
00002568  0000              add [bx+si],al
0000256A  0000              add [bx+si],al
0000256C  0000              add [bx+si],al
0000256E  0000              add [bx+si],al
00002570  0000              add [bx+si],al
00002572  0000              add [bx+si],al
00002574  0000              add [bx+si],al
00002576  0000              add [bx+si],al
00002578  0000              add [bx+si],al
0000257A  0000              add [bx+si],al
0000257C  0000              add [bx+si],al
0000257E  0000              add [bx+si],al
00002580  0000              add [bx+si],al
00002582  0000              add [bx+si],al
00002584  0000              add [bx+si],al
00002586  0000              add [bx+si],al
00002588  0000              add [bx+si],al
0000258A  0000              add [bx+si],al
0000258C  0000              add [bx+si],al
0000258E  0000              add [bx+si],al
00002590  0000              add [bx+si],al
00002592  0000              add [bx+si],al
00002594  0000              add [bx+si],al
00002596  0000              add [bx+si],al
00002598  0000              add [bx+si],al
0000259A  0000              add [bx+si],al
0000259C  0000              add [bx+si],al
0000259E  0000              add [bx+si],al
000025A0  0000              add [bx+si],al
000025A2  0000              add [bx+si],al
000025A4  0000              add [bx+si],al
000025A6  0000              add [bx+si],al
000025A8  0000              add [bx+si],al
000025AA  0000              add [bx+si],al
000025AC  0000              add [bx+si],al
000025AE  0000              add [bx+si],al
000025B0  0000              add [bx+si],al
000025B2  0000              add [bx+si],al
000025B4  0000              add [bx+si],al
000025B6  0000              add [bx+si],al
000025B8  0000              add [bx+si],al
000025BA  0000              add [bx+si],al
000025BC  0000              add [bx+si],al
000025BE  0000              add [bx+si],al
000025C0  0000              add [bx+si],al
000025C2  0000              add [bx+si],al
000025C4  0000              add [bx+si],al
000025C6  0000              add [bx+si],al
000025C8  0000              add [bx+si],al
000025CA  0000              add [bx+si],al
000025CC  0000              add [bx+si],al
000025CE  0000              add [bx+si],al
000025D0  0000              add [bx+si],al
000025D2  0000              add [bx+si],al
000025D4  0000              add [bx+si],al
000025D6  0000              add [bx+si],al
000025D8  0000              add [bx+si],al
000025DA  0000              add [bx+si],al
000025DC  0000              add [bx+si],al
000025DE  0000              add [bx+si],al
000025E0  0000              add [bx+si],al
000025E2  0000              add [bx+si],al
000025E4  0000              add [bx+si],al
000025E6  0000              add [bx+si],al
000025E8  0000              add [bx+si],al
000025EA  0000              add [bx+si],al
000025EC  0000              add [bx+si],al
000025EE  0000              add [bx+si],al
000025F0  0000              add [bx+si],al
000025F2  0000              add [bx+si],al
000025F4  0000              add [bx+si],al
000025F6  0000              add [bx+si],al
000025F8  0000              add [bx+si],al
000025FA  0000              add [bx+si],al
000025FC  0000              add [bx+si],al
000025FE  0000              add [bx+si],al
00002600  0000              add [bx+si],al
00002602  0000              add [bx+si],al
00002604  0000              add [bx+si],al
00002606  0000              add [bx+si],al
00002608  0000              add [bx+si],al
0000260A  0000              add [bx+si],al
0000260C  0000              add [bx+si],al
0000260E  0000              add [bx+si],al
00002610  0000              add [bx+si],al
00002612  0000              add [bx+si],al
00002614  0000              add [bx+si],al
00002616  0000              add [bx+si],al
00002618  0000              add [bx+si],al
0000261A  0000              add [bx+si],al
0000261C  0000              add [bx+si],al
0000261E  0000              add [bx+si],al
00002620  0000              add [bx+si],al
00002622  0000              add [bx+si],al
00002624  0000              add [bx+si],al
00002626  0000              add [bx+si],al
00002628  0000              add [bx+si],al
0000262A  0000              add [bx+si],al
0000262C  0000              add [bx+si],al
0000262E  0000              add [bx+si],al
00002630  0000              add [bx+si],al
00002632  0000              add [bx+si],al
00002634  0000              add [bx+si],al
00002636  0000              add [bx+si],al
00002638  0000              add [bx+si],al
0000263A  0000              add [bx+si],al
0000263C  0000              add [bx+si],al
0000263E  0000              add [bx+si],al
00002640  0000              add [bx+si],al
00002642  0000              add [bx+si],al
00002644  0000              add [bx+si],al
00002646  0000              add [bx+si],al
00002648  0000              add [bx+si],al
0000264A  0000              add [bx+si],al
0000264C  0000              add [bx+si],al
0000264E  0000              add [bx+si],al
00002650  0000              add [bx+si],al
00002652  0000              add [bx+si],al
00002654  0000              add [bx+si],al
00002656  0000              add [bx+si],al
00002658  0000              add [bx+si],al
0000265A  0000              add [bx+si],al
0000265C  0000              add [bx+si],al
0000265E  0000              add [bx+si],al
00002660  0000              add [bx+si],al
00002662  0000              add [bx+si],al
00002664  0000              add [bx+si],al
00002666  0000              add [bx+si],al
00002668  0000              add [bx+si],al
0000266A  0000              add [bx+si],al
0000266C  0000              add [bx+si],al
0000266E  0000              add [bx+si],al
00002670  0000              add [bx+si],al
00002672  0000              add [bx+si],al
00002674  0000              add [bx+si],al
00002676  0000              add [bx+si],al
00002678  0000              add [bx+si],al
0000267A  0000              add [bx+si],al
0000267C  0000              add [bx+si],al
0000267E  0000              add [bx+si],al
00002680  0000              add [bx+si],al
00002682  0000              add [bx+si],al
00002684  0000              add [bx+si],al
00002686  0000              add [bx+si],al
00002688  0000              add [bx+si],al
0000268A  0000              add [bx+si],al
0000268C  0000              add [bx+si],al
0000268E  0000              add [bx+si],al
00002690  0000              add [bx+si],al
00002692  0000              add [bx+si],al
00002694  0000              add [bx+si],al
00002696  0000              add [bx+si],al
00002698  0000              add [bx+si],al
0000269A  0000              add [bx+si],al
0000269C  0000              add [bx+si],al
0000269E  0000              add [bx+si],al
000026A0  0000              add [bx+si],al
000026A2  0000              add [bx+si],al
000026A4  0000              add [bx+si],al
000026A6  0000              add [bx+si],al
000026A8  0000              add [bx+si],al
000026AA  0000              add [bx+si],al
000026AC  0000              add [bx+si],al
000026AE  0000              add [bx+si],al
000026B0  0000              add [bx+si],al
000026B2  0000              add [bx+si],al
000026B4  0000              add [bx+si],al
000026B6  0000              add [bx+si],al
000026B8  0000              add [bx+si],al
000026BA  0000              add [bx+si],al
000026BC  0000              add [bx+si],al
000026BE  0000              add [bx+si],al
000026C0  0000              add [bx+si],al
000026C2  0000              add [bx+si],al
000026C4  0000              add [bx+si],al
000026C6  0000              add [bx+si],al
000026C8  0000              add [bx+si],al
000026CA  0000              add [bx+si],al
000026CC  0000              add [bx+si],al
000026CE  0000              add [bx+si],al
000026D0  0000              add [bx+si],al
000026D2  0000              add [bx+si],al
000026D4  0000              add [bx+si],al
000026D6  0000              add [bx+si],al
000026D8  0000              add [bx+si],al
000026DA  0000              add [bx+si],al
000026DC  0000              add [bx+si],al
000026DE  0000              add [bx+si],al
000026E0  0000              add [bx+si],al
000026E2  0000              add [bx+si],al
000026E4  0000              add [bx+si],al
000026E6  0000              add [bx+si],al
000026E8  0000              add [bx+si],al
000026EA  0000              add [bx+si],al
000026EC  0000              add [bx+si],al
000026EE  0000              add [bx+si],al
000026F0  0000              add [bx+si],al
000026F2  0000              add [bx+si],al
000026F4  0000              add [bx+si],al
000026F6  0000              add [bx+si],al
000026F8  0000              add [bx+si],al
000026FA  0000              add [bx+si],al
000026FC  0000              add [bx+si],al
000026FE  0000              add [bx+si],al
00002700  0000              add [bx+si],al
00002702  0000              add [bx+si],al
00002704  0000              add [bx+si],al
00002706  0000              add [bx+si],al
00002708  0000              add [bx+si],al
0000270A  0000              add [bx+si],al
0000270C  0000              add [bx+si],al
0000270E  0000              add [bx+si],al
00002710  0000              add [bx+si],al
00002712  0000              add [bx+si],al
00002714  0000              add [bx+si],al
00002716  0000              add [bx+si],al
00002718  0000              add [bx+si],al
0000271A  0000              add [bx+si],al
0000271C  0000              add [bx+si],al
0000271E  0000              add [bx+si],al
00002720  0000              add [bx+si],al
00002722  0000              add [bx+si],al
00002724  0000              add [bx+si],al
00002726  0000              add [bx+si],al
00002728  0000              add [bx+si],al
0000272A  0000              add [bx+si],al
0000272C  0000              add [bx+si],al
0000272E  0000              add [bx+si],al
00002730  0000              add [bx+si],al
00002732  0000              add [bx+si],al
00002734  0000              add [bx+si],al
00002736  0000              add [bx+si],al
00002738  0000              add [bx+si],al
0000273A  0000              add [bx+si],al
0000273C  0000              add [bx+si],al
0000273E  0000              add [bx+si],al
00002740  0000              add [bx+si],al
00002742  0000              add [bx+si],al
00002744  0000              add [bx+si],al
00002746  0000              add [bx+si],al
00002748  0000              add [bx+si],al
0000274A  0000              add [bx+si],al
0000274C  0000              add [bx+si],al
0000274E  0000              add [bx+si],al
00002750  0000              add [bx+si],al
00002752  0000              add [bx+si],al
00002754  0000              add [bx+si],al
00002756  0000              add [bx+si],al
00002758  0000              add [bx+si],al
0000275A  0000              add [bx+si],al
0000275C  0000              add [bx+si],al
0000275E  0000              add [bx+si],al
00002760  0000              add [bx+si],al
00002762  0000              add [bx+si],al
00002764  0000              add [bx+si],al
00002766  0000              add [bx+si],al
00002768  0000              add [bx+si],al
0000276A  0000              add [bx+si],al
0000276C  0000              add [bx+si],al
0000276E  0000              add [bx+si],al
00002770  0000              add [bx+si],al
00002772  0000              add [bx+si],al
00002774  0000              add [bx+si],al
00002776  0000              add [bx+si],al
00002778  0000              add [bx+si],al
0000277A  0000              add [bx+si],al
0000277C  0000              add [bx+si],al
0000277E  0000              add [bx+si],al
00002780  0000              add [bx+si],al
00002782  0000              add [bx+si],al
00002784  0000              add [bx+si],al
00002786  0000              add [bx+si],al
00002788  0000              add [bx+si],al
0000278A  0000              add [bx+si],al
0000278C  0000              add [bx+si],al
0000278E  0000              add [bx+si],al
00002790  0000              add [bx+si],al
00002792  0000              add [bx+si],al
00002794  0000              add [bx+si],al
00002796  0000              add [bx+si],al
00002798  0000              add [bx+si],al
0000279A  0000              add [bx+si],al
0000279C  0000              add [bx+si],al
0000279E  0000              add [bx+si],al
000027A0  0000              add [bx+si],al
000027A2  0000              add [bx+si],al
000027A4  0000              add [bx+si],al
000027A6  0000              add [bx+si],al
000027A8  0000              add [bx+si],al
000027AA  0000              add [bx+si],al
000027AC  0000              add [bx+si],al
000027AE  0000              add [bx+si],al
000027B0  0000              add [bx+si],al
000027B2  0000              add [bx+si],al
000027B4  0000              add [bx+si],al
000027B6  0000              add [bx+si],al
000027B8  0000              add [bx+si],al
000027BA  0000              add [bx+si],al
000027BC  0000              add [bx+si],al
000027BE  0000              add [bx+si],al
000027C0  0000              add [bx+si],al
000027C2  0000              add [bx+si],al
000027C4  0000              add [bx+si],al
000027C6  0000              add [bx+si],al
000027C8  0000              add [bx+si],al
000027CA  0000              add [bx+si],al
000027CC  0000              add [bx+si],al
000027CE  0000              add [bx+si],al
000027D0  0000              add [bx+si],al
000027D2  0000              add [bx+si],al
000027D4  0000              add [bx+si],al
000027D6  0000              add [bx+si],al
000027D8  0000              add [bx+si],al
000027DA  0000              add [bx+si],al
000027DC  0000              add [bx+si],al
000027DE  0000              add [bx+si],al
000027E0  0000              add [bx+si],al
000027E2  0000              add [bx+si],al
000027E4  0000              add [bx+si],al
000027E6  0000              add [bx+si],al
000027E8  0000              add [bx+si],al
000027EA  0000              add [bx+si],al
000027EC  0000              add [bx+si],al
000027EE  0000              add [bx+si],al
000027F0  0000              add [bx+si],al
000027F2  0000              add [bx+si],al
000027F4  0000              add [bx+si],al
000027F6  0000              add [bx+si],al
000027F8  0000              add [bx+si],al
000027FA  0000              add [bx+si],al
000027FC  0000              add [bx+si],al
000027FE  0000              add [bx+si],al
00002800  0000              add [bx+si],al
00002802  0000              add [bx+si],al
00002804  0000              add [bx+si],al
00002806  0000              add [bx+si],al
00002808  0000              add [bx+si],al
0000280A  0000              add [bx+si],al
0000280C  0000              add [bx+si],al
0000280E  0000              add [bx+si],al
00002810  0000              add [bx+si],al
00002812  0000              add [bx+si],al
00002814  0000              add [bx+si],al
00002816  0000              add [bx+si],al
00002818  0000              add [bx+si],al
0000281A  0000              add [bx+si],al
0000281C  0000              add [bx+si],al
0000281E  0000              add [bx+si],al
00002820  0000              add [bx+si],al
00002822  0000              add [bx+si],al
00002824  0000              add [bx+si],al
00002826  0000              add [bx+si],al
00002828  0000              add [bx+si],al
0000282A  0000              add [bx+si],al
0000282C  0000              add [bx+si],al
0000282E  0000              add [bx+si],al
00002830  0000              add [bx+si],al
00002832  0000              add [bx+si],al
00002834  0000              add [bx+si],al
00002836  0000              add [bx+si],al
00002838  0000              add [bx+si],al
0000283A  0000              add [bx+si],al
0000283C  0000              add [bx+si],al
0000283E  0000              add [bx+si],al
00002840  0000              add [bx+si],al
00002842  0000              add [bx+si],al
00002844  0000              add [bx+si],al
00002846  0000              add [bx+si],al
00002848  0000              add [bx+si],al
0000284A  0000              add [bx+si],al
0000284C  0000              add [bx+si],al
0000284E  0000              add [bx+si],al
00002850  0000              add [bx+si],al
00002852  0000              add [bx+si],al
00002854  0000              add [bx+si],al
00002856  0000              add [bx+si],al
00002858  0000              add [bx+si],al
0000285A  0000              add [bx+si],al
0000285C  0000              add [bx+si],al
0000285E  0000              add [bx+si],al
00002860  0000              add [bx+si],al
00002862  0000              add [bx+si],al
00002864  0000              add [bx+si],al
00002866  0000              add [bx+si],al
00002868  0000              add [bx+si],al
0000286A  0000              add [bx+si],al
0000286C  0000              add [bx+si],al
0000286E  0000              add [bx+si],al
00002870  0000              add [bx+si],al
00002872  0000              add [bx+si],al
00002874  0000              add [bx+si],al
00002876  0000              add [bx+si],al
00002878  0000              add [bx+si],al
0000287A  0000              add [bx+si],al
0000287C  0000              add [bx+si],al
0000287E  0000              add [bx+si],al
00002880  0000              add [bx+si],al
00002882  0000              add [bx+si],al
00002884  0000              add [bx+si],al
00002886  0000              add [bx+si],al
00002888  0000              add [bx+si],al
0000288A  0000              add [bx+si],al
0000288C  0000              add [bx+si],al
0000288E  0000              add [bx+si],al
00002890  0000              add [bx+si],al
00002892  0000              add [bx+si],al
00002894  0000              add [bx+si],al
00002896  0000              add [bx+si],al
00002898  0000              add [bx+si],al
0000289A  0000              add [bx+si],al
0000289C  0000              add [bx+si],al
0000289E  0000              add [bx+si],al
000028A0  0000              add [bx+si],al
000028A2  0000              add [bx+si],al
000028A4  0000              add [bx+si],al
000028A6  0000              add [bx+si],al
000028A8  0000              add [bx+si],al
000028AA  0000              add [bx+si],al
000028AC  0000              add [bx+si],al
000028AE  0000              add [bx+si],al
000028B0  0000              add [bx+si],al
000028B2  0000              add [bx+si],al
000028B4  0000              add [bx+si],al
000028B6  0000              add [bx+si],al
000028B8  0000              add [bx+si],al
000028BA  0000              add [bx+si],al
000028BC  0000              add [bx+si],al
000028BE  0000              add [bx+si],al
000028C0  0000              add [bx+si],al
000028C2  0000              add [bx+si],al
000028C4  0000              add [bx+si],al
000028C6  0000              add [bx+si],al
000028C8  0000              add [bx+si],al
000028CA  0000              add [bx+si],al
000028CC  0000              add [bx+si],al
000028CE  0000              add [bx+si],al
000028D0  0000              add [bx+si],al
000028D2  0000              add [bx+si],al
000028D4  0000              add [bx+si],al
000028D6  0000              add [bx+si],al
000028D8  0000              add [bx+si],al
000028DA  0000              add [bx+si],al
000028DC  0000              add [bx+si],al
000028DE  0000              add [bx+si],al
000028E0  0000              add [bx+si],al
000028E2  0000              add [bx+si],al
000028E4  0000              add [bx+si],al
000028E6  0000              add [bx+si],al
000028E8  0000              add [bx+si],al
000028EA  0000              add [bx+si],al
000028EC  0000              add [bx+si],al
000028EE  0000              add [bx+si],al
000028F0  0000              add [bx+si],al
000028F2  0000              add [bx+si],al
000028F4  0000              add [bx+si],al
000028F6  0000              add [bx+si],al
000028F8  0000              add [bx+si],al
000028FA  0000              add [bx+si],al
000028FC  0000              add [bx+si],al
000028FE  0000              add [bx+si],al
00002900  0000              add [bx+si],al
00002902  0000              add [bx+si],al
00002904  0000              add [bx+si],al
00002906  0000              add [bx+si],al
00002908  0000              add [bx+si],al
0000290A  0000              add [bx+si],al
0000290C  0000              add [bx+si],al
0000290E  0000              add [bx+si],al
00002910  0000              add [bx+si],al
00002912  0000              add [bx+si],al
00002914  0000              add [bx+si],al
00002916  0000              add [bx+si],al
00002918  0000              add [bx+si],al
0000291A  0000              add [bx+si],al
0000291C  0000              add [bx+si],al
0000291E  0000              add [bx+si],al
00002920  0000              add [bx+si],al
00002922  0000              add [bx+si],al
00002924  0000              add [bx+si],al
00002926  0000              add [bx+si],al
00002928  0000              add [bx+si],al
0000292A  0000              add [bx+si],al
0000292C  0000              add [bx+si],al
0000292E  0000              add [bx+si],al
00002930  0000              add [bx+si],al
00002932  0000              add [bx+si],al
00002934  0000              add [bx+si],al
00002936  0000              add [bx+si],al
00002938  0000              add [bx+si],al
0000293A  0000              add [bx+si],al
0000293C  0000              add [bx+si],al
0000293E  0000              add [bx+si],al
00002940  0000              add [bx+si],al
00002942  0000              add [bx+si],al
00002944  0000              add [bx+si],al
00002946  0000              add [bx+si],al
00002948  0000              add [bx+si],al
0000294A  0000              add [bx+si],al
0000294C  0000              add [bx+si],al
0000294E  0000              add [bx+si],al
00002950  0000              add [bx+si],al
00002952  0000              add [bx+si],al
00002954  0000              add [bx+si],al
00002956  0000              add [bx+si],al
00002958  0000              add [bx+si],al
0000295A  0000              add [bx+si],al
0000295C  0000              add [bx+si],al
0000295E  0000              add [bx+si],al
00002960  0000              add [bx+si],al
00002962  0000              add [bx+si],al
00002964  0000              add [bx+si],al
00002966  0000              add [bx+si],al
00002968  0000              add [bx+si],al
0000296A  0000              add [bx+si],al
0000296C  0000              add [bx+si],al
0000296E  0000              add [bx+si],al
00002970  0000              add [bx+si],al
00002972  0000              add [bx+si],al
00002974  0000              add [bx+si],al
00002976  0000              add [bx+si],al
00002978  0000              add [bx+si],al
0000297A  0000              add [bx+si],al
0000297C  0000              add [bx+si],al
0000297E  0000              add [bx+si],al
00002980  0000              add [bx+si],al
00002982  0000              add [bx+si],al
00002984  0000              add [bx+si],al
00002986  0000              add [bx+si],al
00002988  0000              add [bx+si],al
0000298A  0000              add [bx+si],al
0000298C  0000              add [bx+si],al
0000298E  0000              add [bx+si],al
00002990  0000              add [bx+si],al
00002992  0000              add [bx+si],al
00002994  0000              add [bx+si],al
00002996  0000              add [bx+si],al
00002998  0000              add [bx+si],al
0000299A  0000              add [bx+si],al
0000299C  0000              add [bx+si],al
0000299E  0000              add [bx+si],al
000029A0  0000              add [bx+si],al
000029A2  0000              add [bx+si],al
000029A4  0000              add [bx+si],al
000029A6  0000              add [bx+si],al
000029A8  0000              add [bx+si],al
000029AA  0000              add [bx+si],al
000029AC  0000              add [bx+si],al
000029AE  0000              add [bx+si],al
000029B0  0000              add [bx+si],al
000029B2  0000              add [bx+si],al
000029B4  0000              add [bx+si],al
000029B6  0000              add [bx+si],al
000029B8  0000              add [bx+si],al
000029BA  0000              add [bx+si],al
000029BC  0000              add [bx+si],al
000029BE  0000              add [bx+si],al
000029C0  0000              add [bx+si],al
000029C2  0000              add [bx+si],al
000029C4  0000              add [bx+si],al
000029C6  0000              add [bx+si],al
000029C8  0000              add [bx+si],al
000029CA  0000              add [bx+si],al
000029CC  0000              add [bx+si],al
000029CE  0000              add [bx+si],al
000029D0  0000              add [bx+si],al
000029D2  0000              add [bx+si],al
000029D4  0000              add [bx+si],al
000029D6  0000              add [bx+si],al
000029D8  0000              add [bx+si],al
000029DA  0000              add [bx+si],al
000029DC  0000              add [bx+si],al
000029DE  0000              add [bx+si],al
000029E0  0000              add [bx+si],al
000029E2  0000              add [bx+si],al
000029E4  0000              add [bx+si],al
000029E6  0000              add [bx+si],al
000029E8  0000              add [bx+si],al
000029EA  0000              add [bx+si],al
000029EC  0000              add [bx+si],al
000029EE  0000              add [bx+si],al
000029F0  0000              add [bx+si],al
000029F2  0000              add [bx+si],al
000029F4  0000              add [bx+si],al
000029F6  0000              add [bx+si],al
000029F8  0000              add [bx+si],al
000029FA  0000              add [bx+si],al
000029FC  0000              add [bx+si],al
000029FE  0000              add [bx+si],al
00002A00  0000              add [bx+si],al
00002A02  0000              add [bx+si],al
00002A04  0000              add [bx+si],al
00002A06  0000              add [bx+si],al
00002A08  0000              add [bx+si],al
00002A0A  0000              add [bx+si],al
00002A0C  0000              add [bx+si],al
00002A0E  0000              add [bx+si],al
00002A10  0000              add [bx+si],al
00002A12  0000              add [bx+si],al
00002A14  0000              add [bx+si],al
00002A16  0000              add [bx+si],al
00002A18  0000              add [bx+si],al
00002A1A  0000              add [bx+si],al
00002A1C  0000              add [bx+si],al
00002A1E  0000              add [bx+si],al
00002A20  0000              add [bx+si],al
00002A22  0000              add [bx+si],al
00002A24  0000              add [bx+si],al
00002A26  0000              add [bx+si],al
00002A28  0000              add [bx+si],al
00002A2A  0000              add [bx+si],al
00002A2C  0000              add [bx+si],al
00002A2E  0000              add [bx+si],al
00002A30  0000              add [bx+si],al
00002A32  0000              add [bx+si],al
00002A34  0000              add [bx+si],al
00002A36  0000              add [bx+si],al
00002A38  0000              add [bx+si],al
00002A3A  0000              add [bx+si],al
00002A3C  0000              add [bx+si],al
00002A3E  0000              add [bx+si],al
00002A40  0000              add [bx+si],al
00002A42  0000              add [bx+si],al
00002A44  0000              add [bx+si],al
00002A46  0000              add [bx+si],al
00002A48  0000              add [bx+si],al
00002A4A  0000              add [bx+si],al
00002A4C  0000              add [bx+si],al
00002A4E  0000              add [bx+si],al
00002A50  0000              add [bx+si],al
00002A52  0000              add [bx+si],al
00002A54  0000              add [bx+si],al
00002A56  0000              add [bx+si],al
00002A58  0000              add [bx+si],al
00002A5A  0000              add [bx+si],al
00002A5C  0000              add [bx+si],al
00002A5E  0000              add [bx+si],al
00002A60  0000              add [bx+si],al
00002A62  0000              add [bx+si],al
00002A64  0000              add [bx+si],al
00002A66  0000              add [bx+si],al
00002A68  0000              add [bx+si],al
00002A6A  0000              add [bx+si],al
00002A6C  0000              add [bx+si],al
00002A6E  0000              add [bx+si],al
00002A70  0000              add [bx+si],al
00002A72  0000              add [bx+si],al
00002A74  0000              add [bx+si],al
00002A76  0000              add [bx+si],al
00002A78  0000              add [bx+si],al
00002A7A  0000              add [bx+si],al
00002A7C  0000              add [bx+si],al
00002A7E  0000              add [bx+si],al
00002A80  0000              add [bx+si],al
00002A82  0000              add [bx+si],al
00002A84  0000              add [bx+si],al
00002A86  0000              add [bx+si],al
00002A88  0000              add [bx+si],al
00002A8A  0000              add [bx+si],al
00002A8C  0000              add [bx+si],al
00002A8E  0000              add [bx+si],al
00002A90  0000              add [bx+si],al
00002A92  0000              add [bx+si],al
00002A94  0000              add [bx+si],al
00002A96  0000              add [bx+si],al
00002A98  0000              add [bx+si],al
00002A9A  0000              add [bx+si],al
00002A9C  0000              add [bx+si],al
00002A9E  0000              add [bx+si],al
00002AA0  0000              add [bx+si],al
00002AA2  0000              add [bx+si],al
00002AA4  0000              add [bx+si],al
00002AA6  0000              add [bx+si],al
00002AA8  0000              add [bx+si],al
00002AAA  0000              add [bx+si],al
00002AAC  0000              add [bx+si],al
00002AAE  0000              add [bx+si],al
00002AB0  0000              add [bx+si],al
00002AB2  0000              add [bx+si],al
00002AB4  0000              add [bx+si],al
00002AB6  0000              add [bx+si],al
00002AB8  0000              add [bx+si],al
00002ABA  0000              add [bx+si],al
00002ABC  0000              add [bx+si],al
00002ABE  0000              add [bx+si],al
00002AC0  0000              add [bx+si],al
00002AC2  0000              add [bx+si],al
00002AC4  0000              add [bx+si],al
00002AC6  0000              add [bx+si],al
00002AC8  0000              add [bx+si],al
00002ACA  0000              add [bx+si],al
00002ACC  0000              add [bx+si],al
00002ACE  0000              add [bx+si],al
00002AD0  0000              add [bx+si],al
00002AD2  0000              add [bx+si],al
00002AD4  0000              add [bx+si],al
00002AD6  0000              add [bx+si],al
00002AD8  0000              add [bx+si],al
00002ADA  0000              add [bx+si],al
00002ADC  0000              add [bx+si],al
00002ADE  0000              add [bx+si],al
00002AE0  0000              add [bx+si],al
00002AE2  0000              add [bx+si],al
00002AE4  0000              add [bx+si],al
00002AE6  0000              add [bx+si],al
00002AE8  0000              add [bx+si],al
00002AEA  0000              add [bx+si],al
00002AEC  0000              add [bx+si],al
00002AEE  0000              add [bx+si],al
00002AF0  0000              add [bx+si],al
00002AF2  0000              add [bx+si],al
00002AF4  0000              add [bx+si],al
00002AF6  0000              add [bx+si],al
00002AF8  0000              add [bx+si],al
00002AFA  0000              add [bx+si],al
00002AFC  0000              add [bx+si],al
00002AFE  0000              add [bx+si],al
00002B00  0000              add [bx+si],al
00002B02  0000              add [bx+si],al
00002B04  0000              add [bx+si],al
00002B06  0000              add [bx+si],al
00002B08  0000              add [bx+si],al
00002B0A  0000              add [bx+si],al
00002B0C  0000              add [bx+si],al
00002B0E  0000              add [bx+si],al
00002B10  0000              add [bx+si],al
00002B12  0000              add [bx+si],al
00002B14  0000              add [bx+si],al
00002B16  0000              add [bx+si],al
00002B18  0000              add [bx+si],al
00002B1A  0000              add [bx+si],al
00002B1C  0000              add [bx+si],al
00002B1E  0000              add [bx+si],al
00002B20  0000              add [bx+si],al
00002B22  0000              add [bx+si],al
00002B24  0000              add [bx+si],al
00002B26  0000              add [bx+si],al
00002B28  0000              add [bx+si],al
00002B2A  0000              add [bx+si],al
00002B2C  0000              add [bx+si],al
00002B2E  0000              add [bx+si],al
00002B30  0000              add [bx+si],al
00002B32  0000              add [bx+si],al
00002B34  0000              add [bx+si],al
00002B36  0000              add [bx+si],al
00002B38  0000              add [bx+si],al
00002B3A  0000              add [bx+si],al
00002B3C  0000              add [bx+si],al
00002B3E  0000              add [bx+si],al
00002B40  0000              add [bx+si],al
00002B42  0000              add [bx+si],al
00002B44  0000              add [bx+si],al
00002B46  0000              add [bx+si],al
00002B48  0000              add [bx+si],al
00002B4A  0000              add [bx+si],al
00002B4C  0000              add [bx+si],al
00002B4E  0000              add [bx+si],al
00002B50  0000              add [bx+si],al
00002B52  0000              add [bx+si],al
00002B54  0000              add [bx+si],al
00002B56  0000              add [bx+si],al
00002B58  0000              add [bx+si],al
00002B5A  0000              add [bx+si],al
00002B5C  0000              add [bx+si],al
00002B5E  0000              add [bx+si],al
00002B60  0000              add [bx+si],al
00002B62  0000              add [bx+si],al
00002B64  0000              add [bx+si],al
00002B66  0000              add [bx+si],al
00002B68  0000              add [bx+si],al
00002B6A  0000              add [bx+si],al
00002B6C  0000              add [bx+si],al
00002B6E  0000              add [bx+si],al
00002B70  0000              add [bx+si],al
00002B72  0000              add [bx+si],al
00002B74  0000              add [bx+si],al
00002B76  0000              add [bx+si],al
00002B78  0000              add [bx+si],al
00002B7A  0000              add [bx+si],al
00002B7C  0000              add [bx+si],al
00002B7E  0000              add [bx+si],al
00002B80  0000              add [bx+si],al
00002B82  0000              add [bx+si],al
00002B84  0000              add [bx+si],al
00002B86  0000              add [bx+si],al
00002B88  0000              add [bx+si],al
00002B8A  0000              add [bx+si],al
00002B8C  0000              add [bx+si],al
00002B8E  0000              add [bx+si],al
00002B90  0000              add [bx+si],al
00002B92  0000              add [bx+si],al
00002B94  0000              add [bx+si],al
00002B96  0000              add [bx+si],al
00002B98  0000              add [bx+si],al
00002B9A  0000              add [bx+si],al
00002B9C  0000              add [bx+si],al
00002B9E  0000              add [bx+si],al
00002BA0  0000              add [bx+si],al
00002BA2  0000              add [bx+si],al
00002BA4  0000              add [bx+si],al
00002BA6  0000              add [bx+si],al
00002BA8  0000              add [bx+si],al
00002BAA  0000              add [bx+si],al
00002BAC  0000              add [bx+si],al
00002BAE  0000              add [bx+si],al
00002BB0  0000              add [bx+si],al
00002BB2  0000              add [bx+si],al
00002BB4  0000              add [bx+si],al
00002BB6  0000              add [bx+si],al
00002BB8  0000              add [bx+si],al
00002BBA  0000              add [bx+si],al
00002BBC  0000              add [bx+si],al
00002BBE  0000              add [bx+si],al
00002BC0  0000              add [bx+si],al
00002BC2  0000              add [bx+si],al
00002BC4  0000              add [bx+si],al
00002BC6  0000              add [bx+si],al
00002BC8  0000              add [bx+si],al
00002BCA  0000              add [bx+si],al
00002BCC  0000              add [bx+si],al
00002BCE  0000              add [bx+si],al
00002BD0  0000              add [bx+si],al
00002BD2  0000              add [bx+si],al
00002BD4  0000              add [bx+si],al
00002BD6  0000              add [bx+si],al
00002BD8  0000              add [bx+si],al
00002BDA  0000              add [bx+si],al
00002BDC  0000              add [bx+si],al
00002BDE  0000              add [bx+si],al
00002BE0  0000              add [bx+si],al
00002BE2  0000              add [bx+si],al
00002BE4  0000              add [bx+si],al
00002BE6  0000              add [bx+si],al
00002BE8  0000              add [bx+si],al
00002BEA  0000              add [bx+si],al
00002BEC  0000              add [bx+si],al
00002BEE  0000              add [bx+si],al
00002BF0  0000              add [bx+si],al
00002BF2  0000              add [bx+si],al
00002BF4  0000              add [bx+si],al
00002BF6  0000              add [bx+si],al
00002BF8  0000              add [bx+si],al
00002BFA  0000              add [bx+si],al
00002BFC  0000              add [bx+si],al
00002BFE  0000              add [bx+si],al
00002C00  0000              add [bx+si],al
00002C02  0000              add [bx+si],al
00002C04  0000              add [bx+si],al
00002C06  0000              add [bx+si],al
00002C08  0000              add [bx+si],al
00002C0A  0000              add [bx+si],al
00002C0C  0000              add [bx+si],al
00002C0E  0000              add [bx+si],al
00002C10  0000              add [bx+si],al
00002C12  0000              add [bx+si],al
00002C14  0000              add [bx+si],al
00002C16  0000              add [bx+si],al
00002C18  0000              add [bx+si],al
00002C1A  0000              add [bx+si],al
00002C1C  0000              add [bx+si],al
00002C1E  0000              add [bx+si],al
00002C20  0000              add [bx+si],al
00002C22  0000              add [bx+si],al
00002C24  0000              add [bx+si],al
00002C26  0000              add [bx+si],al
00002C28  0000              add [bx+si],al
00002C2A  0000              add [bx+si],al
00002C2C  0000              add [bx+si],al
00002C2E  0000              add [bx+si],al
00002C30  0000              add [bx+si],al
00002C32  0000              add [bx+si],al
00002C34  0000              add [bx+si],al
00002C36  0000              add [bx+si],al
00002C38  0000              add [bx+si],al
00002C3A  0000              add [bx+si],al
00002C3C  0000              add [bx+si],al
00002C3E  0000              add [bx+si],al
00002C40  0000              add [bx+si],al
00002C42  0000              add [bx+si],al
00002C44  0000              add [bx+si],al
00002C46  0000              add [bx+si],al
00002C48  0000              add [bx+si],al
00002C4A  0000              add [bx+si],al
00002C4C  0000              add [bx+si],al
00002C4E  0000              add [bx+si],al
00002C50  0000              add [bx+si],al
00002C52  0000              add [bx+si],al
00002C54  0000              add [bx+si],al
00002C56  0000              add [bx+si],al
00002C58  0000              add [bx+si],al
00002C5A  0000              add [bx+si],al
00002C5C  0000              add [bx+si],al
00002C5E  0000              add [bx+si],al
00002C60  0000              add [bx+si],al
00002C62  0000              add [bx+si],al
00002C64  0000              add [bx+si],al
00002C66  0000              add [bx+si],al
00002C68  0000              add [bx+si],al
00002C6A  0000              add [bx+si],al
00002C6C  0000              add [bx+si],al
00002C6E  0000              add [bx+si],al
00002C70  0000              add [bx+si],al
00002C72  0000              add [bx+si],al
00002C74  0000              add [bx+si],al
00002C76  0000              add [bx+si],al
00002C78  0000              add [bx+si],al
00002C7A  0000              add [bx+si],al
00002C7C  0000              add [bx+si],al
00002C7E  0000              add [bx+si],al
00002C80  0000              add [bx+si],al
00002C82  0000              add [bx+si],al
00002C84  0000              add [bx+si],al
00002C86  0000              add [bx+si],al
00002C88  0000              add [bx+si],al
00002C8A  0000              add [bx+si],al
00002C8C  0000              add [bx+si],al
00002C8E  0000              add [bx+si],al
00002C90  0000              add [bx+si],al
00002C92  0000              add [bx+si],al
00002C94  0000              add [bx+si],al
00002C96  0000              add [bx+si],al
00002C98  0000              add [bx+si],al
00002C9A  0000              add [bx+si],al
00002C9C  0000              add [bx+si],al
00002C9E  0000              add [bx+si],al
00002CA0  0000              add [bx+si],al
00002CA2  0000              add [bx+si],al
00002CA4  0000              add [bx+si],al
00002CA6  0000              add [bx+si],al
00002CA8  0000              add [bx+si],al
00002CAA  0000              add [bx+si],al
00002CAC  0000              add [bx+si],al
00002CAE  0000              add [bx+si],al
00002CB0  0000              add [bx+si],al
00002CB2  0000              add [bx+si],al
00002CB4  0000              add [bx+si],al
00002CB6  0000              add [bx+si],al
00002CB8  0000              add [bx+si],al
00002CBA  0000              add [bx+si],al
00002CBC  0000              add [bx+si],al
00002CBE  0000              add [bx+si],al
00002CC0  0000              add [bx+si],al
00002CC2  0000              add [bx+si],al
00002CC4  0000              add [bx+si],al
00002CC6  0000              add [bx+si],al
00002CC8  0000              add [bx+si],al
00002CCA  0000              add [bx+si],al
00002CCC  0000              add [bx+si],al
00002CCE  0000              add [bx+si],al
00002CD0  0000              add [bx+si],al
00002CD2  0000              add [bx+si],al
00002CD4  0000              add [bx+si],al
00002CD6  0000              add [bx+si],al
00002CD8  0000              add [bx+si],al
00002CDA  0000              add [bx+si],al
00002CDC  0000              add [bx+si],al
00002CDE  0000              add [bx+si],al
00002CE0  0000              add [bx+si],al
00002CE2  0000              add [bx+si],al
00002CE4  0000              add [bx+si],al
00002CE6  0000              add [bx+si],al
00002CE8  0000              add [bx+si],al
00002CEA  0000              add [bx+si],al
00002CEC  0000              add [bx+si],al
00002CEE  0000              add [bx+si],al
00002CF0  0000              add [bx+si],al
00002CF2  0000              add [bx+si],al
00002CF4  0000              add [bx+si],al
00002CF6  0000              add [bx+si],al
00002CF8  0000              add [bx+si],al
00002CFA  0000              add [bx+si],al
00002CFC  0000              add [bx+si],al
00002CFE  0000              add [bx+si],al
00002D00  0000              add [bx+si],al
00002D02  0000              add [bx+si],al
00002D04  0000              add [bx+si],al
00002D06  0000              add [bx+si],al
00002D08  0000              add [bx+si],al
00002D0A  0000              add [bx+si],al
00002D0C  0000              add [bx+si],al
00002D0E  0000              add [bx+si],al
00002D10  0000              add [bx+si],al
00002D12  0000              add [bx+si],al
00002D14  0000              add [bx+si],al
00002D16  0000              add [bx+si],al
00002D18  0000              add [bx+si],al
00002D1A  0000              add [bx+si],al
00002D1C  0000              add [bx+si],al
00002D1E  0000              add [bx+si],al
00002D20  0000              add [bx+si],al
00002D22  0000              add [bx+si],al
00002D24  0000              add [bx+si],al
00002D26  0000              add [bx+si],al
00002D28  0000              add [bx+si],al
00002D2A  0000              add [bx+si],al
00002D2C  0000              add [bx+si],al
00002D2E  0000              add [bx+si],al
00002D30  0000              add [bx+si],al
00002D32  0000              add [bx+si],al
00002D34  0000              add [bx+si],al
00002D36  0000              add [bx+si],al
00002D38  0000              add [bx+si],al
00002D3A  0000              add [bx+si],al
00002D3C  0000              add [bx+si],al
00002D3E  0000              add [bx+si],al
00002D40  0000              add [bx+si],al
00002D42  0000              add [bx+si],al
00002D44  0000              add [bx+si],al
00002D46  0000              add [bx+si],al
00002D48  0000              add [bx+si],al
00002D4A  0000              add [bx+si],al
00002D4C  0000              add [bx+si],al
00002D4E  0000              add [bx+si],al
00002D50  0000              add [bx+si],al
00002D52  0000              add [bx+si],al
00002D54  0000              add [bx+si],al
00002D56  0000              add [bx+si],al
00002D58  0000              add [bx+si],al
00002D5A  0000              add [bx+si],al
00002D5C  0000              add [bx+si],al
00002D5E  0000              add [bx+si],al
00002D60  0000              add [bx+si],al
00002D62  0000              add [bx+si],al
00002D64  0000              add [bx+si],al
00002D66  0000              add [bx+si],al
00002D68  0000              add [bx+si],al
00002D6A  0000              add [bx+si],al
00002D6C  0000              add [bx+si],al
00002D6E  0000              add [bx+si],al
00002D70  0000              add [bx+si],al
00002D72  0000              add [bx+si],al
00002D74  0000              add [bx+si],al
00002D76  0000              add [bx+si],al
00002D78  0000              add [bx+si],al
00002D7A  0000              add [bx+si],al
00002D7C  0000              add [bx+si],al
00002D7E  0000              add [bx+si],al
00002D80  0000              add [bx+si],al
00002D82  0000              add [bx+si],al
00002D84  0000              add [bx+si],al
00002D86  0000              add [bx+si],al
00002D88  0000              add [bx+si],al
00002D8A  0000              add [bx+si],al
00002D8C  0000              add [bx+si],al
00002D8E  0000              add [bx+si],al
00002D90  0000              add [bx+si],al
00002D92  0000              add [bx+si],al
00002D94  0000              add [bx+si],al
00002D96  0000              add [bx+si],al
00002D98  0000              add [bx+si],al
00002D9A  0000              add [bx+si],al
00002D9C  0000              add [bx+si],al
00002D9E  0000              add [bx+si],al
00002DA0  0000              add [bx+si],al
00002DA2  0000              add [bx+si],al
00002DA4  0000              add [bx+si],al
00002DA6  0000              add [bx+si],al
00002DA8  0000              add [bx+si],al
00002DAA  0000              add [bx+si],al
00002DAC  0000              add [bx+si],al
00002DAE  0000              add [bx+si],al
00002DB0  0000              add [bx+si],al
00002DB2  0000              add [bx+si],al
00002DB4  0000              add [bx+si],al
00002DB6  0000              add [bx+si],al
00002DB8  0000              add [bx+si],al
00002DBA  0000              add [bx+si],al
00002DBC  0000              add [bx+si],al
00002DBE  0000              add [bx+si],al
00002DC0  0000              add [bx+si],al
00002DC2  0000              add [bx+si],al
00002DC4  0000              add [bx+si],al
00002DC6  0000              add [bx+si],al
00002DC8  0000              add [bx+si],al
00002DCA  0000              add [bx+si],al
00002DCC  0000              add [bx+si],al
00002DCE  0000              add [bx+si],al
00002DD0  0000              add [bx+si],al
00002DD2  0000              add [bx+si],al
00002DD4  0000              add [bx+si],al
00002DD6  0000              add [bx+si],al
00002DD8  0000              add [bx+si],al
00002DDA  0000              add [bx+si],al
00002DDC  0000              add [bx+si],al
00002DDE  0000              add [bx+si],al
00002DE0  0000              add [bx+si],al
00002DE2  0000              add [bx+si],al
00002DE4  0000              add [bx+si],al
00002DE6  0000              add [bx+si],al
00002DE8  0000              add [bx+si],al
00002DEA  0000              add [bx+si],al
00002DEC  0000              add [bx+si],al
00002DEE  0000              add [bx+si],al
00002DF0  0000              add [bx+si],al
00002DF2  0000              add [bx+si],al
00002DF4  0000              add [bx+si],al
00002DF6  0000              add [bx+si],al
00002DF8  0000              add [bx+si],al
00002DFA  0000              add [bx+si],al
00002DFC  0000              add [bx+si],al
00002DFE  0000              add [bx+si],al
00002E00  0000              add [bx+si],al
00002E02  0000              add [bx+si],al
00002E04  0000              add [bx+si],al
00002E06  0000              add [bx+si],al
00002E08  0000              add [bx+si],al
00002E0A  0000              add [bx+si],al
00002E0C  0000              add [bx+si],al
00002E0E  0000              add [bx+si],al
00002E10  0000              add [bx+si],al
00002E12  0000              add [bx+si],al
00002E14  0000              add [bx+si],al
00002E16  0000              add [bx+si],al
00002E18  0000              add [bx+si],al
00002E1A  0000              add [bx+si],al
00002E1C  0000              add [bx+si],al
00002E1E  0000              add [bx+si],al
00002E20  0000              add [bx+si],al
00002E22  0000              add [bx+si],al
00002E24  0000              add [bx+si],al
00002E26  0000              add [bx+si],al
00002E28  0000              add [bx+si],al
00002E2A  0000              add [bx+si],al
00002E2C  0000              add [bx+si],al
00002E2E  0000              add [bx+si],al
00002E30  0000              add [bx+si],al
00002E32  0000              add [bx+si],al
00002E34  0000              add [bx+si],al
00002E36  0000              add [bx+si],al
00002E38  0000              add [bx+si],al
00002E3A  0000              add [bx+si],al
00002E3C  0000              add [bx+si],al
00002E3E  0000              add [bx+si],al
00002E40  0000              add [bx+si],al
00002E42  0000              add [bx+si],al
00002E44  0000              add [bx+si],al
00002E46  0000              add [bx+si],al
00002E48  0000              add [bx+si],al
00002E4A  0000              add [bx+si],al
00002E4C  0000              add [bx+si],al
00002E4E  0000              add [bx+si],al
00002E50  0000              add [bx+si],al
00002E52  0000              add [bx+si],al
00002E54  0000              add [bx+si],al
00002E56  0000              add [bx+si],al
00002E58  0000              add [bx+si],al
00002E5A  0000              add [bx+si],al
00002E5C  0000              add [bx+si],al
00002E5E  0000              add [bx+si],al
00002E60  0000              add [bx+si],al
00002E62  0000              add [bx+si],al
00002E64  0000              add [bx+si],al
00002E66  0000              add [bx+si],al
00002E68  0000              add [bx+si],al
00002E6A  0000              add [bx+si],al
00002E6C  0000              add [bx+si],al
00002E6E  0000              add [bx+si],al
00002E70  0000              add [bx+si],al
00002E72  0000              add [bx+si],al
00002E74  0000              add [bx+si],al
00002E76  0000              add [bx+si],al
00002E78  0000              add [bx+si],al
00002E7A  0000              add [bx+si],al
00002E7C  0000              add [bx+si],al
00002E7E  0000              add [bx+si],al
00002E80  0000              add [bx+si],al
00002E82  0000              add [bx+si],al
00002E84  0000              add [bx+si],al
00002E86  0000              add [bx+si],al
00002E88  0000              add [bx+si],al
00002E8A  0000              add [bx+si],al
00002E8C  0000              add [bx+si],al
00002E8E  0000              add [bx+si],al
00002E90  0000              add [bx+si],al
00002E92  0000              add [bx+si],al
00002E94  0000              add [bx+si],al
00002E96  0000              add [bx+si],al
00002E98  0000              add [bx+si],al
00002E9A  0000              add [bx+si],al
00002E9C  0000              add [bx+si],al
00002E9E  0000              add [bx+si],al
00002EA0  0000              add [bx+si],al
00002EA2  0000              add [bx+si],al
00002EA4  0000              add [bx+si],al
00002EA6  0000              add [bx+si],al
00002EA8  0000              add [bx+si],al
00002EAA  0000              add [bx+si],al
00002EAC  0000              add [bx+si],al
00002EAE  0000              add [bx+si],al
00002EB0  0000              add [bx+si],al
00002EB2  0000              add [bx+si],al
00002EB4  0000              add [bx+si],al
00002EB6  0000              add [bx+si],al
00002EB8  0000              add [bx+si],al
00002EBA  0000              add [bx+si],al
00002EBC  0000              add [bx+si],al
00002EBE  0000              add [bx+si],al
00002EC0  0000              add [bx+si],al
00002EC2  0000              add [bx+si],al
00002EC4  0000              add [bx+si],al
00002EC6  0000              add [bx+si],al
00002EC8  0000              add [bx+si],al
00002ECA  0000              add [bx+si],al
00002ECC  0000              add [bx+si],al
00002ECE  0000              add [bx+si],al
00002ED0  0000              add [bx+si],al
00002ED2  0000              add [bx+si],al
00002ED4  0000              add [bx+si],al
00002ED6  0000              add [bx+si],al
00002ED8  0000              add [bx+si],al
00002EDA  0000              add [bx+si],al
00002EDC  0000              add [bx+si],al
00002EDE  0000              add [bx+si],al
00002EE0  0000              add [bx+si],al
00002EE2  0000              add [bx+si],al
00002EE4  0000              add [bx+si],al
00002EE6  0000              add [bx+si],al
00002EE8  0000              add [bx+si],al
00002EEA  0000              add [bx+si],al
00002EEC  0000              add [bx+si],al
00002EEE  0000              add [bx+si],al
00002EF0  0000              add [bx+si],al
00002EF2  0000              add [bx+si],al
00002EF4  0000              add [bx+si],al
00002EF6  0000              add [bx+si],al
00002EF8  0000              add [bx+si],al
00002EFA  0000              add [bx+si],al
00002EFC  0000              add [bx+si],al
00002EFE  0000              add [bx+si],al
00002F00  0000              add [bx+si],al
00002F02  0000              add [bx+si],al
00002F04  0000              add [bx+si],al
00002F06  0000              add [bx+si],al
00002F08  0000              add [bx+si],al
00002F0A  0000              add [bx+si],al
00002F0C  0000              add [bx+si],al
00002F0E  0000              add [bx+si],al
00002F10  0000              add [bx+si],al
00002F12  0000              add [bx+si],al
00002F14  0000              add [bx+si],al
00002F16  0000              add [bx+si],al
00002F18  0000              add [bx+si],al
00002F1A  0000              add [bx+si],al
00002F1C  0000              add [bx+si],al
00002F1E  0000              add [bx+si],al
00002F20  0000              add [bx+si],al
00002F22  0000              add [bx+si],al
00002F24  0000              add [bx+si],al
00002F26  0000              add [bx+si],al
00002F28  0000              add [bx+si],al
00002F2A  0000              add [bx+si],al
00002F2C  0000              add [bx+si],al
00002F2E  0000              add [bx+si],al
00002F30  0000              add [bx+si],al
00002F32  0000              add [bx+si],al
00002F34  0000              add [bx+si],al
00002F36  0000              add [bx+si],al
00002F38  0000              add [bx+si],al
00002F3A  0000              add [bx+si],al
00002F3C  0000              add [bx+si],al
00002F3E  0000              add [bx+si],al
00002F40  0000              add [bx+si],al
00002F42  0000              add [bx+si],al
00002F44  0000              add [bx+si],al
00002F46  0000              add [bx+si],al
00002F48  0000              add [bx+si],al
00002F4A  0000              add [bx+si],al
00002F4C  0000              add [bx+si],al
00002F4E  0000              add [bx+si],al
00002F50  0000              add [bx+si],al
00002F52  0000              add [bx+si],al
00002F54  0000              add [bx+si],al
00002F56  0000              add [bx+si],al
00002F58  0000              add [bx+si],al
00002F5A  0000              add [bx+si],al
00002F5C  0000              add [bx+si],al
00002F5E  0000              add [bx+si],al
00002F60  0000              add [bx+si],al
00002F62  0000              add [bx+si],al
00002F64  0000              add [bx+si],al
00002F66  0000              add [bx+si],al
00002F68  0000              add [bx+si],al
00002F6A  0000              add [bx+si],al
00002F6C  0000              add [bx+si],al
00002F6E  0000              add [bx+si],al
00002F70  0000              add [bx+si],al
00002F72  0000              add [bx+si],al
00002F74  0000              add [bx+si],al
00002F76  0000              add [bx+si],al
00002F78  0000              add [bx+si],al
00002F7A  0000              add [bx+si],al
00002F7C  0000              add [bx+si],al
00002F7E  0000              add [bx+si],al
00002F80  0000              add [bx+si],al
00002F82  0000              add [bx+si],al
00002F84  0000              add [bx+si],al
00002F86  0000              add [bx+si],al
00002F88  0000              add [bx+si],al
00002F8A  0000              add [bx+si],al
00002F8C  0000              add [bx+si],al
00002F8E  0000              add [bx+si],al
00002F90  0000              add [bx+si],al
00002F92  0000              add [bx+si],al
00002F94  0000              add [bx+si],al
00002F96  0000              add [bx+si],al
00002F98  0000              add [bx+si],al
00002F9A  0000              add [bx+si],al
00002F9C  0000              add [bx+si],al
00002F9E  0000              add [bx+si],al
00002FA0  0000              add [bx+si],al
00002FA2  0000              add [bx+si],al
00002FA4  0000              add [bx+si],al
00002FA6  0000              add [bx+si],al
00002FA8  0000              add [bx+si],al
00002FAA  0000              add [bx+si],al
00002FAC  0000              add [bx+si],al
00002FAE  0000              add [bx+si],al
00002FB0  0000              add [bx+si],al
00002FB2  0000              add [bx+si],al
00002FB4  0000              add [bx+si],al
00002FB6  0000              add [bx+si],al
00002FB8  0000              add [bx+si],al
00002FBA  0000              add [bx+si],al
00002FBC  0000              add [bx+si],al
00002FBE  0000              add [bx+si],al
00002FC0  0000              add [bx+si],al
00002FC2  0000              add [bx+si],al
00002FC4  0000              add [bx+si],al
00002FC6  0000              add [bx+si],al
00002FC8  0000              add [bx+si],al
00002FCA  0000              add [bx+si],al
00002FCC  0000              add [bx+si],al
00002FCE  0000              add [bx+si],al
00002FD0  0000              add [bx+si],al
00002FD2  0000              add [bx+si],al
00002FD4  0000              add [bx+si],al
00002FD6  0000              add [bx+si],al
00002FD8  0000              add [bx+si],al
00002FDA  0000              add [bx+si],al
00002FDC  0000              add [bx+si],al
00002FDE  0000              add [bx+si],al
00002FE0  0000              add [bx+si],al
00002FE2  0000              add [bx+si],al
00002FE4  0000              add [bx+si],al
00002FE6  0000              add [bx+si],al
00002FE8  0000              add [bx+si],al
00002FEA  0000              add [bx+si],al
00002FEC  0000              add [bx+si],al
00002FEE  0000              add [bx+si],al
00002FF0  0000              add [bx+si],al
00002FF2  0000              add [bx+si],al
00002FF4  0000              add [bx+si],al
00002FF6  0000              add [bx+si],al
00002FF8  0000              add [bx+si],al
00002FFA  0000              add [bx+si],al
00002FFC  0000              add [bx+si],al
00002FFE  0000              add [bx+si],al
00003000  1025              adc [di],ah
00003002  0000              add [bx+si],al
00003004  2125              and [di],sp
00003006  0000              add [bx+si],al
00003008  27                daa
00003009  250000            and ax,0x0
0000300C  3E250000          ds and ax,0x0
00003010  49                dec cx
00003011  250000            and ax,0x0
00003014  60                pushaw
00003015  250000            and ax,0x0
00003018  6E                outsb
00003019  250000            and ax,0x0
0000301C  7D25              jnl 0x3043
0000301E  0000              add [bx+si],al
00003020  8C25              mov [di],fs
00003022  0000              add [bx+si],al
00003024  99                cwd
00003025  250000            and ax,0x0
00003028  B525              mov ch,0x25
0000302A  0000              add [bx+si],al
0000302C  BD2500            mov bp,0x25
0000302F  00D1              add cl,dl
00003031  250000            and ax,0x0
00003034  DD25              frstor [di]
00003036  0000              add [bx+si],al
00003038  F625              mul byte [di]
0000303A  0000              add [bx+si],al
0000303C  01260000          add [0x0],sp
00003040  13260000          adc sp,[0x0]
00003044  252600            and ax,0x26
00003047  0035              add [di],dh
00003049  260000            add [es:bx+si],al
0000304C  43                inc bx
0000304D  260000            add [es:bx+si],al
00003050  43                inc bx
00003051  260000            add [es:bx+si],al
00003054  43                inc bx
00003055  260000            add [es:bx+si],al
00003058  43                inc bx
00003059  260000            add [es:bx+si],al
0000305C  43                inc bx
0000305D  260000            add [es:bx+si],al
00003060  43                inc bx
00003061  260000            add [es:bx+si],al
00003064  43                inc bx
00003065  260000            add [es:bx+si],al
00003068  43                inc bx
00003069  260000            add [es:bx+si],al
0000306C  43                inc bx
0000306D  260000            add [es:bx+si],al
00003070  43                inc bx
00003071  260000            add [es:bx+si],al
00003074  43                inc bx
00003075  260000            add [es:bx+si],al
00003078  43                inc bx
00003079  260000            add [es:bx+si],al
0000307C  43                inc bx
0000307D  260000            add [es:bx+si],al
