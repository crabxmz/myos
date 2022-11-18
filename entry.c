#include "type.h"
#include "x86.h"
#include "log.h"
#include "idt.h"
#include "paging.h"

void access_mem(uint32_t addr) // pysical memory range access test
{
    uint8_t *byte = (uint8_t *)addr;
    uint8_t old = *byte;
    printuint32((uint32_t)byte);
    println(" access addr");
    *byte = 0x66;
    printuint32(*byte);
    uint8_t new = *byte;
    println(" write to addr");
}

int main()
{
    println("kernel started..");
    init_interrupt();
    // init_ps2();   // why it is no use ?

    printuint32((uint32_t)init_mmu);
    println(" init_mmu");
    init_mmu();
    access_mem(0x100000);
    println("exit kernel");
    return 0;
}

/*
test for idt
 store_idt();
*/

/*
test for keyboard interrupt
    __asm__("int $33");
*/

// test for isr0
//  int a = 1;
//  int b = 0;
//  int c = a / b;

/*
test for pic masks
 print_pic_masks();
 println(" print_pic_masks");
*/

/*
test for pysical memory range
    // access_mem(0x40000000);
    // access_mem(0x3fffffff);
*/