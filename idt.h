#ifndef IDT_H
#define IDT_H
#include "type.h"
#include "pic.h"
#include "log.h"
#include "keyboard.h"

#define IDT_ENTRIES 256
#define DUMP_CPU(cpu_state)         \
    do                              \
    {                               \
        printuint32(cpu_state.EAX); \
        println(" EAX");            \
        printuint32(cpu_state.EBX); \
        println(" EBX");            \
        printuint32(cpu_state.ECX); \
        println(" ECX");            \
        printuint32(cpu_state.EDX); \
        println(" EDX");            \
        printuint32(cpu_state.EBP); \
        println(" EBP");            \
        printuint32(cpu_state.ESP); \
        println(" ESP");            \
        printuint32(cpu_state.EDI); \
        println(" EDI");            \
        printuint32(cpu_state.ESI); \
        println(" ESI");            \
                                    \
    } while (0)

#define DUMP_ITR_STACK(stack)          \
    do                                 \
    {                                  \
        printuint32(stack.error_code); \
        println(" error_code");        \
        printuint32(stack.eip);        \
        println(" eip");               \
        printuint32(stack.cs);         \
        println(" cs");                \
        printuint32(stack.eflags);     \
        println(" eflags");            \
    } while (0);

extern void interrupt_handler_0();
extern void interrupt_handler_1();
extern void interrupt_handler_2();
extern void interrupt_handler_3();
extern void interrupt_handler_4();
extern void interrupt_handler_5();
extern void interrupt_handler_6();
extern void interrupt_handler_7();
extern void interrupt_handler_8();
extern void interrupt_handler_9();
extern void interrupt_handler_10();
extern void interrupt_handler_11();
extern void interrupt_handler_12();
extern void interrupt_handler_13();
extern void interrupt_handler_14();
extern void interrupt_handler_15();

extern void isr_handler_0();
extern void isr_handler_1();
extern void isr_handler_2();
extern void isr_handler_3();
extern void isr_handler_4();
extern void isr_handler_5();
extern void isr_handler_6();
extern void isr_handler_7();
extern void isr_handler_8();
extern void isr_handler_9();
extern void isr_handler_10();
extern void isr_handler_11();
extern void isr_handler_12();
extern void isr_handler_13();
extern void isr_handler_14();
extern void isr_handler_15();
extern void isr_handler_16();
extern void isr_handler_17();
extern void isr_handler_18();
extern void isr_handler_19();
extern void isr_handler_20();
extern void isr_handler_21();
extern void isr_handler_22();
extern void isr_handler_23();
extern void isr_handler_24();
extern void isr_handler_25();
extern void isr_handler_26();
extern void isr_handler_27();
extern void isr_handler_28();
extern void isr_handler_29();
extern void isr_handler_30();
extern void isr_handler_31();

typedef struct
{
    uint32_t EAX;
    uint32_t ECX;
    uint32_t EDX;
    uint32_t EBX;
    uint32_t ESP;
    uint32_t EBP;
    uint32_t ESI;
    uint32_t EDI;
} __attribute__((packed)) cpu_state;

typedef struct
{

    /*
    [esp + 12] eflags
    [esp + 8] cs
    [esp + 4] eip
    [esp] error code?
    */

    unsigned int error_code;
    unsigned int eip;
    unsigned int cs;
    unsigned int eflags;
} __attribute__((packed)) stack_state;

typedef struct
{
    uint16_t limit;
    uint32_t base;
} __attribute__((packed)) idt_register_t;

typedef struct
{
    uint16_t low_offset; // offset bits 0..15 represents the address of the entry point of the Interrupt Service Routine.
    uint16_t cs;         // cs selector
    uint8_t zero;        // unused
    /**
    P(1bit) DPL(2bit) 0(1 bit) GateType(4bit)

    Gate Type: A 4-bit value which defines the type of gate this Interrupt Descriptor represents. There are five valid type values:
        0b0101 or 0x5: Task Gate, note that in this case, the Offset value is unused and should be set to zero.
        0b0110 or 0x6: 16-bit Interrupt Gate
        0b0111 or 0x7: 16-bit Trap Gate
        0b1110 or 0xE: 32-bit Interrupt Gate
        0b1111 or 0xF: 32-bit Trap Gate
        */
    uint8_t flags;
    uint16_t high_offset; // offset bits 16..31
} __attribute__((packed)) idt_gate_t;

idt_register_t idt_reg;
idt_gate_t idt[IDT_ENTRIES];
uint32_t ticks = 0;

uint32_t tick_inc()
{
    return ++ticks;
}

void set_idt_gate(int n, uint32_t handler)
{
    idt[n].low_offset = (uint16_t)(handler & 0x0000ffff);
    idt[n].cs = 0x8; // see gdt.asm
    idt[n].zero = 0;
    /*
     0x8E = 1  00  0  1  110 (interrupt gate)
            P  DPL 0  D  Type
    */
    idt[n].flags = 0x8e;
    idt[n].high_offset = (uint16_t)(handler & 0xffff0000);
}

void store_idt()
{
    idt_register_t tmp_idt;
    __asm__ volatile("sidt %0"
                     : "=m"(tmp_idt));
    printuint32(tmp_idt.base);
    println("tmp_idt.base");
    printuint32(tmp_idt.limit);
    println("tmp_idt.limit");
}

void load_idt()
{
    idt_reg.base = (uint32_t)&idt;
    idt_reg.limit = IDT_ENTRIES * sizeof(idt_gate_t) - 1;
    __asm__ volatile("lidt (%0)"
                     :
                     : "r"(&idt_reg));
    // printuint32(idt_reg.base);
    // println("idt_reg.base");
    // printuint32(idt_reg.limit);
    // println("idt_reg.limit");
}
/**
    internal ISRs
    ...

    PIC remapping
    ...

    IRQ ISRs
    ...
    Load idt
*/

/* To print the message which defines every exception */
char *exception_messages[] = {
    "Division By Zero",
    "Debug",
    "Non Maskable Interrupt",
    "Breakpoint",
    "Into Detected Overflow",
    "Out of Bounds",
    "Invalid Opcode",
    "No Coprocessor",

    "Double Fault",
    "Coprocessor Segment Overrun",
    "Bad TSS",
    "Segment Not Present",
    "Stack Fault",
    "General Protection Fault",
    "Page Fault",
    "Unknown Interrupt",

    "Coprocessor Fault",
    "Alignment Check",
    "Machine Check",
    "Reserved",
    "Reserved",
    "Reserved",
    "Reserved",
    "Reserved",

    "Reserved",
    "Reserved",
    "Reserved",
    "Reserved",
    "Reserved",
    "Reserved",
    "Reserved",
    "Reserved"};

void init_interrupt()
{
    set_idt_gate(0, (uint32_t)isr_handler_0);
    set_idt_gate(1, (uint32_t)isr_handler_1);
    set_idt_gate(2, (uint32_t)isr_handler_2);
    set_idt_gate(3, (uint32_t)isr_handler_3);
    set_idt_gate(4, (uint32_t)isr_handler_4);
    set_idt_gate(5, (uint32_t)isr_handler_5);
    set_idt_gate(6, (uint32_t)isr_handler_6);
    set_idt_gate(7, (uint32_t)isr_handler_7);
    set_idt_gate(8, (uint32_t)isr_handler_8);
    set_idt_gate(9, (uint32_t)isr_handler_9);
    set_idt_gate(10, (uint32_t)isr_handler_10);
    set_idt_gate(11, (uint32_t)isr_handler_11);
    set_idt_gate(12, (uint32_t)isr_handler_12);
    set_idt_gate(13, (uint32_t)isr_handler_13);
    set_idt_gate(14, (uint32_t)isr_handler_14);
    set_idt_gate(15, (uint32_t)isr_handler_15);
    set_idt_gate(16, (uint32_t)isr_handler_16);
    set_idt_gate(17, (uint32_t)isr_handler_17);
    set_idt_gate(18, (uint32_t)isr_handler_18);
    set_idt_gate(19, (uint32_t)isr_handler_19);
    set_idt_gate(20, (uint32_t)isr_handler_20);
    set_idt_gate(21, (uint32_t)isr_handler_21);
    set_idt_gate(22, (uint32_t)isr_handler_22);
    set_idt_gate(23, (uint32_t)isr_handler_23);
    set_idt_gate(24, (uint32_t)isr_handler_24);
    set_idt_gate(25, (uint32_t)isr_handler_25);
    set_idt_gate(26, (uint32_t)isr_handler_26);
    set_idt_gate(27, (uint32_t)isr_handler_27);
    set_idt_gate(28, (uint32_t)isr_handler_28);
    set_idt_gate(29, (uint32_t)isr_handler_29);
    set_idt_gate(30, (uint32_t)isr_handler_30);
    set_idt_gate(31, (uint32_t)isr_handler_31);

    pic_remap(0x20, 0x28); // remap pic port addr

    set_idt_gate(IRQ_NO_BASE + 0, (uint32_t)interrupt_handler_0);
    set_idt_gate(IRQ_NO_BASE + 1, (uint32_t)interrupt_handler_1);
    set_idt_gate(IRQ_NO_BASE + 2, (uint32_t)interrupt_handler_2);
    set_idt_gate(IRQ_NO_BASE + 3, (uint32_t)interrupt_handler_3);
    set_idt_gate(IRQ_NO_BASE + 4, (uint32_t)interrupt_handler_4);
    set_idt_gate(IRQ_NO_BASE + 5, (uint32_t)interrupt_handler_5);
    set_idt_gate(IRQ_NO_BASE + 6, (uint32_t)interrupt_handler_6);
    set_idt_gate(IRQ_NO_BASE + 7, (uint32_t)interrupt_handler_7);
    set_idt_gate(IRQ_NO_BASE + 8, (uint32_t)interrupt_handler_8);
    set_idt_gate(IRQ_NO_BASE + 9, (uint32_t)interrupt_handler_9);
    set_idt_gate(IRQ_NO_BASE + 10, (uint32_t)interrupt_handler_10);
    set_idt_gate(IRQ_NO_BASE + 11, (uint32_t)interrupt_handler_11);
    set_idt_gate(IRQ_NO_BASE + 12, (uint32_t)interrupt_handler_12);
    set_idt_gate(IRQ_NO_BASE + 13, (uint32_t)interrupt_handler_13);
    set_idt_gate(IRQ_NO_BASE + 14, (uint32_t)interrupt_handler_14);
    set_idt_gate(IRQ_NO_BASE + 15, (uint32_t)interrupt_handler_15);

    // detect_ps2_type();
    // get_scancode_set();
    // init_ps2();
    // test_ps2();
    load_idt();
    enable_interrupt();
}

void interrupt_request_handler(cpu_state _cpu_state, uint32_t _int_no, stack_state _stack_state)
{
    switch (_int_no)
    {
    case 0:
    {
        uint32_t tk;
        if (!((tk = tick_inc()) % 0x10))
        {
            printuint32(tk);
            println(" ticks");
        }
        break;
    }

    default:
        break;
    }
    if (_int_no)
    {
        printuint32(_int_no);
        println(" new irq handler");
        printuint32((uint32_t)interrupt_request_handler);
        println(" new interrupt_request_handler addr");
        // DUMP_CPU(_cpu_state);
        // DUMP_ITR_STACK(_stack_state);
    }
    pic_send_eoi(_int_no);
}

void isr_handler(cpu_state _cpu_state, uint32_t _isr_no, stack_state _stack_state)
{
    printuint32(_isr_no);
    println(exception_messages[_isr_no]);
    // DUMP_CPU(_cpu_state);
    // DUMP_ITR_STACK(_stack_state);
}

#endif