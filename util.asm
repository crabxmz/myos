	[bits 16]
PrintCharacter:               ;Procedure to print character on screen
	mov ah, 0x0e                 ;Tell BIOS that we need to print one charater on screen.
	mov bh, 0x00                 ;Page no.
	mov bl, 0x07                 ;Text attribute 0x07 is lightgrey font on black background
	
	int 0x10                     ;Call video interrupt
	ret                          ;Return to calling procedure
	
	
	
PrintString:                  ;PrintString(si:str addr) Procedure to print string on screen
	;Assume that string starting pointer is in register si
	pusha
PrintString_next_character:   ;Lable to fetch next character from string
	mov al, [si]                 ;Get a byte from string and store in al register
	inc si                       ;Increment si pointer
	or al, al                    ;Check if value in al is zero (end of string)
	jz PrintString_exit_function ;If end then return
	call PrintCharacter          ;Else print the character which is in al register
	jmp PrintString_next_character ;Fetch next character from string
PrintString_exit_function:    ;End label
	popa
	ret                          ;Return from procedure
	
PrintMem:                     ;PrintString(si:start addr, cx:len) Procedure to print string on screen
	;Assume that string starting pointer is in register si
	pusha
PrintMem_next_character:      ;Lable to fetch next character from string
	mov al, [si]                 ;Get a byte from string and store in al register
	;0xXY
	shr al, 0x04                 ;get X
	cmp al, 0x0a
	jb XLessThanTen
	add al, 0x57                 ;if X>=0xa
	jmp Xprint
XLessThanTen:
	add al, 0x30                 ;else
Xprint:
	call PrintCharacter          ;print the character which is in al register
	
	mov al, [si]
	and al, 0xf                  ;get Y
	cmp al, 0x0a
	jl YLessThanTen
	add al, 0x57                 ;if Y>=0xa
	jmp YPrint
YLessThanTen:
	add al, 0x30                 ;else
YPrint:
	call PrintCharacter          ;print the character which is in al register
	
	inc si                       ;Increment si pointer
	;print space
	mov al, 0x20
	call PrintCharacter          ;Else print the character which is in al register
	
	dec cx
	or cx, cx                    ;Check if value in al is zero (end of string)
	jz PrintMem_exit_function    ;If end then return
	
	jmp PrintMem_next_character  ;Fetch next character from string
	
PrintMem_exit_function:       ;End label
	mov si, NewLine
	call PrintString
	popa
	ret                          ;Return from procedure
	
	NewLine db 0xa, 0xd, 0
