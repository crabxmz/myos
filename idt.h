#ifndef IDT_H
#define IDT_H
#include "type.h"
#include "log.h"
// #include "keyboard.h"

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

uint32_t get_idt_start_addr();
void init_interrupt();
void isr_handler(cpu_state _cpu_state, uint32_t _isr_no, stack_state _stack_state);

#endif