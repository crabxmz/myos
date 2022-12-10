	[bits 16]
disk_load:                    ;disk_load(bx:data destination, cl:start_sec_idx dh:sec_num, dl:driver_idx, usually 0x80)
	pusha
	push dx                      ;num of sector to read
	mov ah, 0x02                 ;read mode
	mov al, dh                   ;sec tot num
	mov ch, 0x00                 ;cylineder
	mov dh, 0x00                 ;head 0
	int 0x13                     ; BIOS interrupt
	jc disk_error
	pop dx
	cmp al, dh
	jne sectors_error
	popa
	ret
	
disk_error:
	mov si, DiskError            ;Store string pointer to si
	call PrintString             ;Call print string procedure
	jmp $
	
sectors_error:
	mov si, SectorError          ;Store string pointer to si
	call PrintString             ;Call print string procedure
	jmp $
	
	DiskError db 'DiskError', 0
	SectorError db 'SectorError', 0
