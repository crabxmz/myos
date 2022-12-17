#include "type.h"
#include "x86.h"
#include "log.h"
#include "idt.h"
#include "memory.h"
#include "tss.h"
#include "gdt.h"
#include "process.h"
#include "bitmap_allocator.h"
#include "disk.h"
#include "paging.h"

extern void jump_usermode();
uint32_t test_user_function;
uint32_t user_stack;
__attribute__((aligned(PAGE_SIZE))) uint32_t page_directory[1024] = {0};
__attribute__((aligned(PAGE_SIZE))) uint32_t page_table_768[1024] = {0};
__attribute__((aligned(PAGE_SIZE))) uint32_t page_table_0[1024] = {0};
process_t init_p;

void move_pd()
{
    uint32_t *pd;
    __asm__ volatile("mov %%cr3,%0"
                     : "=g"(pd));
    int i;
    page_directory[0] = (uint32_t)page_table_0;
    page_directory[768] = (uint32_t)page_table_768;
    uint32_t *pt = (uint32_t *)(pd[0]);
    for (i = 0; i < 1024; i++)
    {
        page_table_0[i] = pt[i];
    }
    pt = (uint32_t *)(pd[768]);
    for (i = 0; i < 1024; i++)
    {
        page_table_768[i] = pt[i];
    }

    __asm__ volatile("mov %0,%%cr3"
                     :
                     : "g"((uint32_t)page_directory));
}

int main()
{
    println("kernel started..");

    init_gdt();
    init_interrupt();
    init_bit_alloc();
    print_str_and_uint32("kernel_end addr", (uint32_t)kernel_end);
    println("into user mode");
    gdt_entry_t *tss_desc_ptr = GET_GDT_DESC(get_gdt_base(), TSS_SEG);
    set_tss(tss_desc_ptr);
    set_kernel_stack();
    flush_tss();
    // for test

    init_proc(&init_p, 38);
    test_user_function = init_p.eip;
    user_stack = init_p.esp;
    println("init_proc done");

    // print_str_and_uint32("user_process_esp", user_stack);
    // print_str_and_uint32("pt_768", ((uint32_t *)init_p.cr3)[768]);
    // print_str_and_uint32("pt_0", ((uint32_t *)init_p.cr3)[0]);
    // print_str_and_uint32("test_user_function", (uint32_t)test_user_function);

    // use new page dir
    // __asm__ volatile("mov %0, %%cr3" ::"r"(init_p.cr3));

    // go to user code
    println("go to user code");
    jump_usermode();
    // end
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
void write_disk_test()
{
    uint8_t tmp_buf[512];
    int i;
    for (i = 0; i < 512; i++)
    {
        tmp_buf[i] = 0xff;
    }
    write_one_sector(tmp_buf, 0);
}
*/