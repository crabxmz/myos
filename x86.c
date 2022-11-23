#include "x86.h"

void outb(uint16_t port, uint8_t data)
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

uint8_t inb(uint16_t port)
{
    uint8_t ret;
    __asm__ volatile("inb %1, %0"
                     : "=a"(ret)
                     : "Nd"(port));
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
