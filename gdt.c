#include "gdt.h"

gdt_entry_t gdt[DESC_NUM];

void sgdt(gdt_register_t *ret)
{
    __asm__ volatile("sgdt %0"
                     : "=m"(*ret));
}

uint32_t get_gdt_base()
{
    gdt_register_t tmp;
    sgdt(&tmp);
    return tmp.start_addr;
}

void init_gdt()
{
    gdt_register_t tmp;
    // copy grub's gdt
    sgdt(&tmp);
    gdt_entry_t *ptr = (gdt_entry_t *)tmp.start_addr;
    int i;
    for (i = 0; i < DESC_NUM; i++, ptr++)
    {
        gdt[i] = *ptr;
    }

    // set new gdt
    tmp.start_addr = (uint32_t)&gdt[0];
    lgdt(&tmp);
}

void lgdt(gdt_register_t *reg)
{
    __asm__ volatile("lgdt (%0)"
                     :
                     : "r"(reg));
}