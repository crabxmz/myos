#include "tss.h"
#include "x86.h"
#include "log.h"
tss_entry_t g_tss_entry={0};

// void test_read_disk()
// {
//     print_str_and_uint32("test_read_disk",(uint32_t)test_read_disk);
//     uint8_t buf[512];
//     read_one_sector(buf, 36);
//     int i;
//     for(i=0;i<32;i++){
//         print_str_and_uint32("buf[i]",buf[i]);
//     }
//     println("read done");
// }

void set_tss(gdt_entry_t *gdt_entry_ptr)
{
    print_str_and_uint32("gdt_entry_ptr", (uint32_t)gdt_entry_ptr);
    // set tss desc in gdt
    uint32_t base = (uint32_t)&g_tss_entry;
    uint32_t limit = sizeof(tss_entry_t) - 1;
    gdt_entry_ptr->limit_low = limit;
    gdt_entry_ptr->base_low = base;
    gdt_entry_ptr->accessed = 1;
    gdt_entry_ptr->read_write = 0;
    gdt_entry_ptr->conforming_expand_down = 0;
    gdt_entry_ptr->code = 1;
    gdt_entry_ptr->code_data_segment = 0;
    gdt_entry_ptr->DPL = 0;
    gdt_entry_ptr->present = 1;
    gdt_entry_ptr->limit_high = (limit & 0xf0000) >> 16;
    gdt_entry_ptr->available = 0;
    gdt_entry_ptr->long_mode = 0;
    gdt_entry_ptr->big = 0;
    gdt_entry_ptr->gran = 0;
    gdt_entry_ptr->base_high = (base & 0xff000000) >> 24;

    // reset tss content
    // test_read_disk();

    uint8_t *p = (uint8_t *)&g_tss_entry;

    g_tss_entry.ss0 = K_DS_SEG * sizeof(gdt_entry_t); // Set the kernel stack segment, same as ds
}

__attribute__((always_inline)) inline void set_kernel_stack()
{
    __asm__ volatile("mov %%esp, %0"
                     : "=g"(g_tss_entry.esp0));
}

void flush_tss()
{
    uint16_t tr = (TSS_SEG * sizeof(gdt_entry_t) | 0);
    __asm__ volatile("ltr %0" ::"g"(tr));
}