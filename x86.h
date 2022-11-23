#ifndef X86_H
#define X86_H
#include "type.h"

void outb(uint16_t port, uint8_t data);

// dummy write to get a 1ms~4ms delay
void io_wait(void);

uint8_t inb(uint16_t port);

uint16_t is_interrupt_enabled();

#endif