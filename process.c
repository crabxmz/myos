#include "process.h"
#include "bitmap_allocator.h"
#include "paging.h"
#include "elf.h"
#include "kpage_map.h"
#include "log.h"

void init_proc(process_t *proc, uint32_t disk_offset)
{
    // print_str_and_uint32("init_proc", (uint32_t)init_proc);

    // set user stack
    proc->esp = USER_STACK_ADDR;

    // alloc new page dir
    proc->cr3 = alloc_a_page(0);
    uint32_t *new_pd = (uint32_t *)proc->cr3;
    int i;
    for (i = 0; i < 1024; i++)
    {
        new_pd[i] = 0;
    }
    // print_str_and_uint32("new page dir", proc->cr3);

    // map kernel to high addr
    uint32_t *cur_pd;
    __asm__ volatile("mov %%cr3, %0"
                     : "=g"(cur_pd));

    // align 4096
    new_pd[PD_OFFSET(0xc0000000)] = ((cur_pd[PD_OFFSET(0xc0000000)] & 0xfffff000) | 7); // map kernel
    new_pd[PD_OFFSET(0)] = ((cur_pd[PD_OFFSET(0)] & 0xfffff000) | 7);
    // new_pd[PD_OFFSET(0x400000)] = ((cur_pd[PD_OFFSET(0x400000)] & 0xfffff000) | 3);
    // new_pd[PD_OFFSET(proc->esp)] = ((cur_pd[PD_OFFSET(proc->esp)] & 0xfffff000) | 3);

    __asm__ volatile("mov %0, %%cr3" ::"r"(proc->cr3));

    // load elf
    // println("----load user elf start");
    proc->eip = load_user_elf(disk_offset);
    // println("----load user elf done");
    // set stack page
    // println("map stack page");
    proc->kstack_paddr = alloc_a_page(0);
    map_a_page(ADDR_PAGE_ALIGN(proc->esp), proc->kstack_paddr, 1 << 2);

    // print_str_and_uint32("V2P(0x400000)", V2P(0x400000, proc->cr3));
}

void init_proc_from_buffer(process_t *proc, uint8_t *buf)
{

    proc->esp = USER_STACK_ADDR;

    // alloc new page dir
    proc->cr3 = alloc_a_page(0);
    uint32_t *new_pd = (uint32_t *)proc->cr3;
    int i;
    for (i = 0; i < 1024; i++)
    {
        new_pd[i] = 0;
    }

    // map kernel to high addr
    uint32_t *cur_pd;
    __asm__ volatile("mov %%cr3, %0"
                     : "=g"(cur_pd));

    // align 4096
    new_pd[PD_OFFSET(0xc0000000)] = (ADDR_PAGE_ALIGN(cur_pd[PD_OFFSET(0xc0000000)]) | 7); // map kernel
    new_pd[PD_OFFSET(0)] = (ADDR_PAGE_ALIGN(cur_pd[PD_OFFSET(0)]) | 7);

    __asm__ volatile("mov %0, %%cr3" ::"r"(proc->cr3));

    proc->eip = load_user_elf_from_buffer(buf);
    proc->kstack_paddr = alloc_a_page(0);
    map_a_page(ADDR_PAGE_ALIGN(proc->esp), proc->kstack_paddr, 1 << 2);
}