#include "paging.h"

__attribute__((aligned(4096))) pd_entry page_directory[1024];
__attribute__((aligned(4096))) page_table g_page_table[1024];

void read_mem(uint32_t addr) // pysical memory range access test
{
    uint8_t *byte = (uint8_t *)addr;
    printuint32((uint32_t)byte);
    println("read addr");
}

void write_mem(uint32_t addr) // pysical memory range access test
{
    uint8_t *byte = (uint8_t *)addr;
    *byte = 0x66;
    print_str_and_uint32("write to addr, expected 0x66, now its value is", *byte);
}

void init_mmu()
{
    page_table *pt = &g_page_table[PTD_OFFSET(0x0)];
    *((uint32_t *)(&page_directory[PTD_OFFSET(0x0)])) = (uint32_t)pt | 1; // bit-0 must set to 1 (Present)
    print_str_and_uint32("pt[0] addr", (uint32_t)(&pt[PTE_OFFSET(0)]));
    print_str_and_uint32("page dir addr", (uint32_t)page_directory);
    identity_paging((uint32_t *)pt, 0, 1024 * 1024 * 4); // virtual 0~1024 -> physical 0~1024

    // if idt is not in fisrt 1M we need extra paging
    /*
        uint32_t idt_addr = get_idt_start_addr();
        pt = &g_page_table[PTD_OFFSET(idt_addr)];
        *((uint32_t *)(&page_directory[PTD_OFFSET(idt_addr)])) = (uint32_t)pt | 3;
        identity_paging((uint32_t *)pt, idt_addr & 0xffc00000, 1024 * 1024 * 4);
    */

    /*
    out kernel start at 0x00001000 pysical addr

    | pdt offset | pte offset |  pf offset   |
    | 0000000000 | 0000000001 | 000000000000 |

    when cr0's 31-bit is set , all the address access is virtual and will go through mmu
    */
    // test_addr(0);
    // test_addr(idt_addr);

    enable_paging();
    println("i made mmu!");
}

__attribute__((aligned(4096))) pd_entry page_directory[1024];
__attribute__((aligned(4096))) page_table g_page_table[1024];

uint32_t inline get_page_dir_addr()
{
    return (uint32_t)&page_directory;
}

uint32_t inline get_first_page_table_addr()
{
    return (uint32_t)&g_page_table[0];
}

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
        *first_pte = from | 3; // mark page present.
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
    uint32_t pt_addr = ((uint32_t *)page_directory)[pd_offset] & 0xfffff000;
    printuint32(pd_offset);
    println(" pd_offset");

    printuint32(pt_addr);
    println(" pt addr");

    printuint32((uint32_t)g_page_table[pd_offset]);
    println(" calulated pt addr");

    uint32_t pt_offset = PTE_OFFSET(addr);
    printuint32(pt_offset);
    println(" pt_offset");

    uint32_t pf_addr = ((uint32_t *)pt_addr)[pt_offset] & 0xfffff000;
    uint32_t *p = (uint32_t *)0x5000;
    printuint32(pf_addr);
    println(" pf_addr");

    uint32_t pf_offset = addr & 0xfff;
    printuint32(pf_offset);
    println(" pf_offset");

    println("***");
}

void static enable_paging()
{
    // print_str_and_uint32("into enable_paging", (uint32_t)enable_paging);

    // set page directory
    __asm__ volatile("mov %0, %%cr3" ::"r"(page_directory));

    // page size extention, page size 4k->4M
    __asm__("mov %cr4, %eax");
    __asm__("or $0x00000010, %eax");
    __asm__("mov %eax, %cr4");

    // the PG “paging-enable” bit
    __asm__("mov %cr0, %eax");
    __asm__("or $0x80000000, %eax");
    __asm__("mov %eax, %cr0");
}

void v2p(uint32_t vaddr)
{
    uint32_t ptd_offset = PTD_OFFSET(vaddr);
    uint32_t pte_offset = PTE_OFFSET(vaddr);
    uint32_t pf_offset = PF_OFFSET(vaddr);
    uint32_t *ptd_addr = (uint32_t *)page_directory;
    uint32_t pt_addr = ptd_addr[ptd_offset];

    if ((pt_addr & 1) == 0)
    {
        println("pt_addr not present");
    }
    pt_addr &= 0xfffff000;

    print_str_and_uint32("ptd_offset", (uint32_t)ptd_offset);
    print_str_and_uint32("pte_offset", (uint32_t)pte_offset);
    print_str_and_uint32("ptd_addr", (uint32_t)page_directory);
    print_str_and_uint32("global pt addr", (uint32_t)g_page_table);
    print_str_and_uint32("size of global pt addr", sizeof(g_page_table));
    print_str_and_uint32("pt0 addr", (uint32_t)g_page_table[0]);
    print_str_and_uint32("pt1 addr", (uint32_t)g_page_table[1]);
    print_str_and_uint32("pt2 addr", (uint32_t)g_page_table[2]);
    print_str_and_uint32("pt1023 addr", (uint32_t)g_page_table[1023]);
    print_str_and_uint32("pt_addr", pt_addr);
    print_str_and_uint32("calculated pt_addr", (uint32_t)g_page_table[ptd_offset] & 0xfffff000);

    uint32_t pf_addr = ((uint32_t *)pt_addr)[pte_offset];

    if ((pf_addr & 1) == 0)
    {
        println("pf_addr not present");
    }
    pf_addr &= 0xfffff000;

    print_str_and_uint32("pf_addr", pf_addr);
    print_str_and_uint32("calculated pf_addr", ((uint32_t *)g_page_table[ptd_offset])[pte_offset] & 0xfffff000);
    print_str_and_uint32("physical_addr", pf_addr + pf_offset);
}
