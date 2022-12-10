#ifndef X86_H
#define X86_H
#include "type.h"
// #include "gdt.h"

__attribute__((always_inline)) inline void outb(uint16_t port, uint8_t data);

// dummy write to get a 1ms~4ms delay
void io_wait(void);

__attribute__((always_inline)) inline uint8_t inb(uint16_t port);
__attribute__((always_inline)) inline uint16_t inw(uint16_t port);

uint16_t is_interrupt_enabled();

void stosb(void *addr, int data, int cnt);
void insl(int port, void *addr, int cnt);
// uint32_t get_gdt_base();
#endif