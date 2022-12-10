	[bits 32]
	[extern irq_handler]
	[extern isr_handler]
	[extern interrupt_request_handler]
	[extern isr_handler]
	align 4

	; The specific CPU interrupts that put an error code on the stack are 8, 10, 11, 12, 13, 14 and 17.
%macro no_error_code_isr_handler 1
	global isr_handler_%1
	isr_handler_%1:
	cli
	push dword 0                 ; push 0 as error code
	push dword %1                ; push the interrupt number
	jmp common_isr_handler ; jump to the common handler
%endmacro
	
%macro error_code_isr_handler 1
	global isr_handler_%1
	isr_handler_%1:
	cli
	push dword %1                ; push the interrupt number
	jmp common_isr_handler ; jump to the common handler
%endmacro

common_isr_handler:
	push EDI
	push ESI
	push EBP
	push ESP
	push EBX
	push EDX
	push ECX
	push EAX
	call isr_handler
	pop EAX
	pop ECX
	pop EDX
	pop EBX
	pop ESP
	pop EBP
	pop ESI
	pop EDI
	; restore the esp
	add esp, 8
	; return to the code that got interrupted
	sti
	iret

no_error_code_isr_handler 0
no_error_code_isr_handler 1
no_error_code_isr_handler 2
no_error_code_isr_handler 3
no_error_code_isr_handler 4
no_error_code_isr_handler 5
no_error_code_isr_handler 6
no_error_code_isr_handler 7
error_code_isr_handler 8
no_error_code_isr_handler 9
error_code_isr_handler 10
error_code_isr_handler 11
error_code_isr_handler 12
error_code_isr_handler 13
error_code_isr_handler 14
no_error_code_isr_handler 15
no_error_code_isr_handler 16
error_code_isr_handler 17
no_error_code_isr_handler 18
no_error_code_isr_handler 19
no_error_code_isr_handler 20
no_error_code_isr_handler 21
no_error_code_isr_handler 22
no_error_code_isr_handler 23
no_error_code_isr_handler 24
no_error_code_isr_handler 25
no_error_code_isr_handler 26
no_error_code_isr_handler 27
no_error_code_isr_handler 28
no_error_code_isr_handler 29
no_error_code_isr_handler 30
no_error_code_isr_handler 31

	; all irq interrupt has no error code!
%macro no_error_code_interrupt_handler 1
	global interrupt_handler_%1
	interrupt_handler_%1:
	cli
	push dword 0                 ; push 0 as error code
	push dword %1                ; push the interrupt number
	jmp common_interrupt_handler ; jump to the common handler
%endmacro
	
%macro error_code_interrupt_handler 1
	global interrupt_handler_%1
	interrupt_handler_%1:
	cli
	push dword %1                ; push the interrupt number
	jmp common_interrupt_handler ; jump to the common handler
%endmacro
	
common_interrupt_handler:
	push EDI
	push ESI
	push EBP
	push ESP
	push EBX
	push EDX
	push ECX
	push EAX
	call interrupt_request_handler
	pop EAX
	pop ECX
	pop EDX
	pop EBX
	pop ESP
	pop EBP
	pop ESI
	pop EDI
	; restore the esp
	add esp, 8
	; return to the code that got interrupted
	sti
	iret
	
	; no_error_code_interrupt_handler 0
	; no_error_code_interrupt_handler 1
	; no_error_code_interrupt_handler 2
	; no_error_code_interrupt_handler 3
	; no_error_code_interrupt_handler 4
	; no_error_code_interrupt_handler 5
	; no_error_code_interrupt_handler 6
	; no_error_code_interrupt_handler 7
	
	; error_code_interrupt_handler 8
	; no_error_code_interrupt_handler 9
	; error_code_interrupt_handler 10
	; error_code_interrupt_handler 11
	; error_code_interrupt_handler 12
	; error_code_interrupt_handler 13
	; error_code_interrupt_handler 14
	; no_error_code_interrupt_handler 15
	no_error_code_interrupt_handler 0
	no_error_code_interrupt_handler 1
	no_error_code_interrupt_handler 2
	no_error_code_interrupt_handler 3
	no_error_code_interrupt_handler 4
	no_error_code_interrupt_handler 5
	no_error_code_interrupt_handler 6
	no_error_code_interrupt_handler 7
	no_error_code_interrupt_handler 8
	no_error_code_interrupt_handler 9
	no_error_code_interrupt_handler 10
	no_error_code_interrupt_handler 11
	no_error_code_interrupt_handler 12
	no_error_code_interrupt_handler 13
	no_error_code_interrupt_handler 14
	no_error_code_interrupt_handler 15
