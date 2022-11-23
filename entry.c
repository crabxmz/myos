#include "type.h"
#include "x86.h"
#include "log.h"
#include "idt.h" // make sure paging is after idt, so that, idt table is linked into fisrt 1M memory
#include "paging.h"
#include "memory.h"

extern void test_high(unsigned char data);

void stub()
{
    print_str_and_uint32("stub", (uint32_t)stub);
}

int main()
{
    println("kernel started..");
    init_interrupt();
    // init_ps2();   // why it is no use ?

    init_mmu();
    // read_mem(0xc0000000);
    // write_mem(0xc0000001);
    print_str_and_uint32("kernel_end addr", (uint32_t)kernel_end);
    print_str_and_uint32("high addr start", (uint32_t)high_addr_start);
    println("exit kernel");
    print_str_and_uint32("test_high", (uint32_t)test_high);
    stub();
    test_high(0x61);
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