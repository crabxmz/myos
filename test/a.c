#include "log.h"

void test_user_function()
{
    __asm__ volatile("mov $0xdeadbeef, %eax");
    while (1)
        ;
}