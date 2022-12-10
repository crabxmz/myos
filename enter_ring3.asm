	[bits 32]
	[extern test_user_function]
	[extern user_stack]
	
	global jump_usermode
jump_usermode:
	mov ax, (4 * 8)|3            ; set ring3 ds, with rpl=3 (last 2 bits)
	mov ds, ax
	mov es, ax
	mov fs, ax
	mov gs, ax
	
	;set up stack for iret
	; [esp + 16] ss ; the stack segment selector we want for user mode
	; [esp + 12] esp ; the user mode stack pointer
	; [esp + 8] eflags ; the control flags we want to use in user mode
	; [esp + 4] cs ; the code segment selector
	; [esp + 0] eip ; the instruction pointer of user mode code to execute
	
	push (4 * 8) |3              ; ss. when poped, ss will assigned this
	push DWORD [user_stack]      ; esp
	pushf                        ; eflags
	push (3 * 8) |3              ; cs
	push DWORD [test_user_function] ; func addr which will return to
	iret
