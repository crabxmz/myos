#include "x86.h"

__attribute__((always_inline)) inline void outb(uint16_t port, uint8_t data)
{
    __asm__ volatile("outb %0, %1"
                     :
                     : "a"(data), "Nd"(port));
    return;
}

// dummy write to get a 1ms~4ms delay
void io_wait(void)
{
    outb(0x80, 0);
}

__attribute__((always_inline)) inline uint8_t inb(uint16_t port)
{
    uint8_t ret;
    __asm__ volatile("inb %1, %0"
                     : "=a"(ret)
                     : "d"(port));
    return ret;
}

__attribute__((always_inline)) inline uint16_t inw(uint16_t port)
{
    uint16_t ret;
    __asm__ volatile("inw %1, %0"
                     : "=a"(ret)
                     : "d"(port));
    return ret;
}

uint16_t is_interrupt_enabled()
{
    uint16_t flags;
    // PSW flag resgiter, Program Status Word, 16 bit
    __asm__ volatile("pushf\n\t"
                     "pop %0"
                     : "=g"(flags));
    return flags & (1 << 9);
}

void stosb(void *addr, int data, int cnt)
{
    asm volatile("cld; rep stosb"
                 : "=D"(addr), "=c"(cnt)
                 : "0"(addr), "1"(cnt), "a"(data)
                 : "memory", "cc");
}

void insl(int port, void *addr, int cnt)
{
    asm volatile("cld; rep insl"
                 : "=D"(addr), "=c"(cnt)
                 : "d"(port), "0"(addr), "1"(cnt)
                 : "memory", "cc");
}

// uint32_t get_gdt_base()
// {
//     gdt_register r;
//     __asm__ volatile("sgdt %0"
//                      : "=m"(r));
//     return r.start_addr;
// }