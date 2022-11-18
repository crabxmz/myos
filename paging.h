#ifndef PAGING_H
#define PAGING_H
#include "log.h"

typedef struct
{
    uint32_t addr : 20;
    uint32_t attr : 12;
} __attribute__((packed)) pd_entry;

typedef struct
{
    uint32_t addr : 20;
    uint32_t attr : 12;
} __attribute__((packed)) pt_entry;

__attribute__((aligned(4096))) pd_entry page_directory[1024];
__attribute__((aligned(4096))) pt_entry page_table[1024];

void static is_pae_enabled()
{ // page address extension
    int infotype, a, b, c, d;
    for (infotype = 0; infotype < 5; infotype++)
    {
        __asm__("cpuid"
                : "=a"(a), "=b"(b), "=c"(c), "=d"(d) // The output variables. EAX -> a and vice versa.
                : "0"(infotype));                    // Put the infotype into EAX.
    }
    //   printint(infotype);println("");
    //   printint(a);println("");
    //   printint(b);println("");
    //   printint(c);println("");
    //   printint(d);println("");
    // https://en.wikipedia.org/wiki/CPUID#Inline_assembly
    if (((unsigned)d) & (0x1 << 6))
    {
        println("PAE enabled");
    }
    else
    {
        println("PAE disabled");
    }
}

void static identity_paging(uint32_t *first_pte, uint32_t from, uint32_t size)
{
    from = from & 0xfffff000; // discard bits we don't want
    for (; size > 0; from += 4096, size -= 4096, first_pte++)
    {
        *first_pte = from | 1; // mark page present.
        // printuint32(sizeof(pd_entry));
        // println(" sizeof(pd_entry)");
        // printuint32((uint32_t)first_pte);
        // println(" pte addr");
        // printuint32(from);
        // println(" pte->addr");
        // printuint32(*first_pte & 0x00000fff);
        // println(" pte->attr");
    }
} // maybe need init pte also

void static printcr0()
{
    uint32_t cr0;
    __asm__("mov %cr0, %ebx");
    __asm__("mov %%ebx, %0"
            : "=g"(cr0));
    printuint32(cr0);
    println(" cr0");
}
void static printcr1()
{
    uint32_t cr1;
    __asm__("mov %cr1, %ebx");
    __asm__("mov %%ebx, %0"
            : "=g"(cr1));
    printuint32(cr1);
    println(" cr1");
}
void static printcr2()
{
    uint32_t cr2;
    __asm__("mov %cr2, %ebx");
    __asm__("mov %%ebx, %0"
            : "=g"(cr2));
    printuint32(cr2);
    println(" cr2");
}
void static printcr3()
{
    uint32_t cr3;
    __asm__("mov %%cr3, %0"
            : "=r"(cr3));
    printuint32(cr3);
    println(" cr3");
}
void static printcr4()
{
    uint32_t cr4;
    __asm__("mov %cr4, %ebx");
    __asm__("mov %%ebx, %0"
            : "=g"(cr4));
    printuint32(cr4);
    println(" cr4");
}

void static printeax()
{
    uint32_t eax;
    __asm__("mov %%eax, %0"
            : "=g"(eax));
    printuint32(eax);
    println(" eax");
}

void static test_addr(uint32_t addr)
{
    println("***");
    printuint32(addr);
    println(" test addr");
    uint32_t pd_offset = addr >> 22;
    printuint32(pd_offset);
    println(" pd_offset");

    printuint32((uint32_t)&page_directory[pd_offset]);
    println(" page_directory[pd_offset] addr");

    uint32_t pt_offset = (addr >> 12) & 0x3ff;
    printuint32(pt_offset);
    println(" pt_offset");

    uint32_t pf_offset = addr & 0xfff;
    printuint32(pf_offset);
    println(" pf_offset");

    println("***");
}

void static enable_paging()
{
    /*
    println("====");
    printuint32((uint32_t)&page_directory);
    println(" page_directory addr");
    printuint32((uint32_t)&page_directory[0]);
    println(" page_directory[0] addr");

    printuint32((uint32_t)&page_table);
    println(" page_table addr");
    printuint32((uint32_t)&page_table[0]);
    println(" page_table[0] addr");
    */

    // set page directory
    __asm__ volatile("mov %0, %%cr3" ::"r"(page_directory));
    // printcr3();
    // println("====");
    // test_addr(0x1234);
    // page size extention, page size 4k->4M
    __asm__("mov %cr4, %eax");
    __asm__("or $0x00000010, %eax");
    __asm__("mov %eax, %cr4");

    // the PG “paging-enable” bit
    __asm__("mov %cr0, %eax");
    __asm__("or $0x80000000, %eax");
    __asm__("mov %eax, %cr0");
}

void init_mmu();

#endif