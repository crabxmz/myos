#ifndef PAGING_H
#define PAGING_H
#include "type.h"

#define PAGE_SIZE (4096)

#define PD_OFFSET(vaddr) ((vaddr) >> 22)
#define PT_OFFSET(vaddr) (((vaddr) >> 12) & 0x3ff)
#define PF_OFFSET(vaddr) ((vaddr)&0xfff)
#define IS_PRESENT(entry) ((entry)&1)
#define ADDR_PAGE_ALIGN(addr) (0xfffff000 & ((uint32_t)addr))
#define GET_PDE(vaddr, pd) (((uint32_t *)pd)[PD_OFFSET(vaddr)])
#define GET_PTE(vaddr, pd) (((uint32_t *)ADDR_PAGE_ALIGN(GET_PDE(vaddr, pd)))[PT_OFFSET(vaddr)])
#define V2P(vaddr, pd) (ADDR_PAGE_ALIGN(GET_PTE(vaddr, pd)) + PF_OFFSET(vaddr))

typedef struct
{
    uint32_t addr : 20;
    uint32_t attr : 12;
} __attribute__((packed)) pde_t;

typedef struct
{
    uint32_t addr : 20;
    uint32_t attr : 12;
} __attribute__((packed)) pte_t;
/*
typedef pt_entry page_table[1024];

void static is_pae_enabled();

void static identity_paging(uint32_t *first_pte, uint32_t from, uint32_t size);
void static printcr0();
void static printcr1();
void static printcr2();
void static printcr3();
void static printcr4();

void static printeax();
void static test_addr(uint32_t addr);
void static enable_paging();

void read_mem(uint32_t addr); // pysical memory range access test
void write_mem(uint32_t addr); // pysical memory range access test

void init_mmu();
void static enable_paging();
void static test_addr(uint32_t addr);
void static printeax();
void static printcr4();
void static printcr3();
void static printcr2();
void static printcr1();
void static printcr0();
void static identity_paging(uint32_t *first_pte, uint32_t from, uint32_t size);
void static is_pae_enabled();
void map_vaddr_4k(uint32_t vaddr,uint8_t priv_flag);
void map_a_page(uint32_t vaddr,uint32_t paddr,uint8_t priv_flag);
uint32_t get_page_dir_addr();
uint32_t get_first_page_table_addr();
*/
#endif