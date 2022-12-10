#include "log.h"
#include "type.h"
#include "x86.h"
#include "memory.h"
#include "elf.h"
#include "disk.h"

#define PTD_OFFSET(vaddr) (vaddr >> 22)
#define PTE_OFFSET(vaddr) ((vaddr >> 12) & 0x3ff)
#define PF_OFFSET(vaddr) (vaddr & 0xfff)
#define PAGE_SIZE (4096)

__attribute__((aligned(PAGE_SIZE))) uint32_t page_directory[1024] = {0};
__attribute__((aligned(PAGE_SIZE))) uint32_t page_table_768[1024] = {0};
__attribute__((aligned(PAGE_SIZE))) uint32_t page_table_0[1024] = {0};

void enable_paging(uint32_t pd_start_addr);

void grub_main()
{
    // uint8_t buf[512];
    // read_one_sector(buf, 0);
    uint32_t i;

    uint32_t high_addr_start = (uint32_t)&high_addr_space;
    for (i = 0; i < 1024; i++)
    {
        page_table_0[i] = PAGE_SIZE * i | 3;
        page_table_768[i] = PAGE_SIZE * i | 3;
    }

    page_directory[0] = (uint32_t)page_table_0 | 3;
    page_directory[768] = (uint32_t)page_table_768 | 3;

    // set page directory
    __asm__ volatile("mov %0, %%cr3" ::"r"((uint32_t)page_directory));

    // page size extention, page size 4k->4M
    __asm__ volatile("mov %cr4, %eax");
    __asm__ volatile("or $0x00000010, %eax");
    __asm__ volatile("mov %eax, %cr4");

    // the PG “paging-enable” bit
    __asm__ volatile("mov %cr0, %eax");
    __asm__ volatile("or $0x80000000, %eax");
    __asm__ volatile("mov %eax, %cr0");

    load_elf(ELF_DISK_OFFSET);
}
