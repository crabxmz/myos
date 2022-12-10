	[bits 16]
	align 4
	; null segment descriptor
gdt_start:
	dq 0x0                       ; 8 bytes, 64bits
	
	; code segment descriptor
gdt_code:
	dw 0xffff                    ; SegLimit[15:0]
	dw 0x0                       ; SegBase[15:0]
	db 0x0                       ; SegBase[23:16]
	db 10011010b                 ; P=0 DPL=00 1=1 Type=1 C=0 R=1 A=0
	db 11001111b                 ; G=1 D=1 L=0 AVL=0 SegLimit[19:16]=1111
	db 0x0                       ; SegBase[31:24]
	
gdt_data:
	dw 0xffff                    ; SegLimit[15:0]
	dw 0x0                       ; SegBase[15:0]
	db 0x0                       ; SegBase[23:16]
	db 10010010b                 ; P=0 DPL=00 1=1 Type=0 E=0 W=1 A=0
	db 11001111b                 ; G=1 D=1 L=0 AVL=0 SegLimit[19:16]=1111
	db 0x0                       ; SegBase[31:24]
	
gdt_user_code:
	dw 0xffff                    ; SegLimit[15:0]
	dw 0x0                       ; SegBase[15:0]
	db 0x0                       ; SegBase[23:16]
	db 11111010b                 ; P=0 DPL=11 1=1 Type=1 C=0 R=1 A=0
	db 11001111b                 ; G=1 D=1 L=0 AVL=0 SegLimit[19:16]=1111
	db 0x0                       ; SegBase[31:24]
	
gdt_user_data:
	dw 0xffff                    ; SegLimit[15:0]
	dw 0x0                       ; SegBase[15:0]
	db 0x0                       ; SegBase[23:16]
	db 11110010b                 ; P=0 DPL=11 1=1 Type=1 E=0 W=1 A=0
	db 11001111b                 ; G=1 D=1 L=0 AVL=0 SegLimit[19:16]=1111
	db 0x0                       ; SegBase[31:24]
	
gdt_tss_entry:
	dq 0x0                       ; 8 bytes, 64bits
	
gdt_end:
	
	; GDT descriptor
gdt_descriptor:
	dw gdt_end - gdt_start - 1   ; gdt size (16 bit)
	dd gdt_start                 ; gdt start address (32 bit)
	
	CODE_SEG equ gdt_code - gdt_start
	DATA_SEG equ gdt_data - gdt_start
	USER_CODE_SEG equ gdt_user_code - gdt_start
	USER_DATA_SEG equ gdt_user_data - gdt_start
	; load GDT and go into protection mode
	
	[bits 16]
switch_to_32bit:
	mov si, PROTECTION_MODE
	call PrintString
	
	cli                          ; 1. disable interrupts
	lgdt [gdt_descriptor]        ; 2. load GDT descriptor
	mov eax, cr0
	or eax, 0x1                  ; 3. enable protected mode
	mov cr0, eax
	
	; this cs addr (0x8) will be used in idt selector also!
jmp CODE_SEG:init_32bit       ; 4. far jump, clear cpu pipline, and then cs=CODE_SEG, eip=init_32bit
	
	[bits 32]
init_32bit:
	mov ax, DATA_SEG
	mov ds, ax
	mov ss, ax
	mov es, ax
	mov fs, ax
	mov gs, ax
	
	mov ebp, 0x90000
	mov esp, ebp
	call BEGIN_32BIT
	
	PROTECTION_MODE db "Swtich to protection mode...", 0xa, 0xd, 0
