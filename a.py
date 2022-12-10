def gen_isr_handle():
    for num in range(0,32):
        x=f'''
            global isr{num}
            isr{num}:
            cli
            pushad
            cld                          ;C code following the sysV ABI requires DF to be clear on function entry
            mov eax, {num}
            call isr_handler
            popad
            sti
            iret'''
        print(x)
        print()


# for i in range(0,32):
#     x=f'''set_idt_gate({i}, (uint32_t)isr{i});'''
#     print(x)

# for i in range(0,32):
#     x=f'''extern void isr{i}();'''
#     print(x)
def irq_handle():
    for i in range(16):
        x=f'''
            global irq{i}
            irq{i}:
            cli
            pushad

            mov ax, ds               ; Lower 16-bits of eax = ds.
            push eax                 ; save the data segment descriptor
            mov ax, 0x10  ; load the kernel data segment descriptor
            mov ds, ax
            mov es, ax
            mov fs, ax
            mov gs, ax

            cld                          ;C code following the sysV ABI requires DF to be clear on function entry
            mov eax, {i}
            call irq_handler

            pop ebx        ; reload the original data segment descriptor
            mov ds, bx
            mov es, bx
            mov fs, bx
            mov gs, bx

            popad
            sti
            iret'''
        print(x)
# irq_handle()
# for i in range(16):
#     x=f'''set_idt_gate(IRQ_NO_BASE+{i}, (uint32_t)irq{i});'''
#     print(x)

# for i in range(16):
#     x=f'''extern void irq{i}();'''
#     print(x)
# a=[8, 10, 11, 12, 13, 14 , 17]
# for i in range(32):
#     if i in a:
#         x=f'''error_code_isr_handler {i}'''
#         print(x)
#     else:
#         x=f'''no_error_code_isr_handler {i}'''
#         print(x)
# for i in range(32):
#     x=f"""extern void isr_handler_{i}();"""
#     print(x)

for i in range(32):
    x=f"""isr_handler_{i}"""
    print(x)