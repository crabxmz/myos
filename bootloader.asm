	[bits 16]
	[org 0x7c00]
	
	KERNEL_OFFSET equ 0x1000
	
	; BIOS sets boot drive in 'dl'; store for later use
	mov [BOOT_DRIVE], dl

	; check boot drive idx
	; mov si, BOOT_INFO
	; call PrintString
	; mov cx, 0x1
	; mov si, BOOT_DRIVE
	; call PrintMem

	mov bp, 0x9000
	mov sp, bp

	mov bx, KERNEL_OFFSET
	call load_kernel             ; load_kernel(bx: dst physical memory start addr)
	
	mov si, KERNEL_LOADED
	call PrintString
	
	jmp switch_to_32bit
	
	%include "util.asm"
	%include "disk.asm"
	%include "gdt.asm"
	
	[bits 16]
load_kernel:
	mov cl, 0x02                 ; load kernel from disk sector 2, disk start at sector 1 which is mbr
	mov dh, [DISK_SEC_NUM]       ; will read [DISK_SEC_NUM] sectors ,start at sector 2
	mov dl, [BOOT_DRIVE]
	call disk_load
	
	; check kernel load data
	; mov si, bx
	; mov cx, 0x20
	; call PrintMem
	ret
	
	[bits 32]
BEGIN_32BIT:
	mov si, LERNEL_STARTED
	call PrintString
	call KERNEL_OFFSET           ; give control to kernel
	jmp $                        ; loop in case kernel returns
	
	BOOT_DRIVE db 0
	DISK_SEC_NUM db 49
	;BOOT_INFO db "Boot drive index is ", 0xd, 0xa, 0
	KERNEL_LOADED db "Kernel loaded...", 0xa, 0xd, 0
	LERNEL_STARTED db "Kernel is about to start...", 0xa, 0xd, 0
	
	times 510 - ($ - $$) db 0
	dw 0xaa55
