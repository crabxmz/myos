#include "log.h"
void test_high(unsigned char data)
{
    putchar('X');
    __asm__ volatile("mov 0xdeadbeef, %eax");
    while (1)
        ;
}