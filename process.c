#include "process.h"
#include "bitmap_allocator.h"
#include "paging.h"
#include "elf.h"
#include "kpage_map.h"
#include "log.h"

uint32_t g_pid = 2;
uint32_t id_to_proc_map[64] = {0};

void init_proc(process_t *proc, uint32_t disk_offset)
{
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

    // get current page directory
    uint32_t *cur_pd;
    __asm__ volatile("mov %%cr3, %0"
                     : "=g"(cur_pd));

    // identity map [0xc0000000,0xc0000000+4M]
    new_pd[PD_OFFSET(0xc0000000)] = (ADDR_PAGE_ALIGN(cur_pd[PD_OFFSET(0xc0000000)]) | 7);

    // do we need identity map [0, 4M] ?
    new_pd[PD_OFFSET(0)] = (ADDR_PAGE_ALIGN(cur_pd[PD_OFFSET(0)]) | 7);

    // switch page directory
    __asm__ volatile("mov %0, %%cr3" ::"r"(proc->cr3));

    // load elf
    proc->eip = load_user_elf(disk_offset);

    proc->pid = g_pid++;
}

void init_proc_from_buffer(process_t *proc, uint8_t *buf)
{

    proc->esp = USER_STACK_ADDR;

    // alloc new page dir
    proc->cr3 = alloc_a_page(0);
    // set physical addr to page direcotry
    uint32_t *new_pd = (uint32_t *)proc->cr3;
    int i;
    for (i = 0; i < 1024; i++)
    {
        new_pd[i] = 0;
    }

    // get current page directory
    uint32_t *cur_pd;
    __asm__ volatile("mov %%cr3, %0"
                     : "=g"(cur_pd));

    // identity map [0xc0000000,0xc0000000+4M]
    new_pd[PD_OFFSET(0xc0000000)] = (ADDR_PAGE_ALIGN(cur_pd[PD_OFFSET(0xc0000000)]) | 7);
    // identity map [0x0,0x0+4M]
    new_pd[PD_OFFSET(0)] = (ADDR_PAGE_ALIGN(cur_pd[PD_OFFSET(0)]) | 7);

    // switch page directory
    __asm__ volatile("mov %0, %%cr3" ::"r"(proc->cr3));

    // load elf
    proc->eip = load_user_elf_from_buffer(buf);

    proc->pid = g_pid++;
}

void printProcessState(process_t *proc)
{
    println("+++++++printProcessState start");
    printNumberVar(proc->cr3);
    printNumberVar(proc->kstack_paddr);
    printNumberVar(proc->esp);
    printNumberVar(proc->eip);
    printNumberVar(proc->pid);
    println("-------printProcessState end");
}
