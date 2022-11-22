#include "paging.h"
#include "page_frame_alloc.h"

__attribute__((aligned(4096))) page_table g_page_table[1024];
__attribute__((aligned(4096))) pd_entry page_directory[1024];

void read_mem(uint32_t addr) // pysical memory range access test
{
    uint8_t *byte = (uint8_t *)addr;
    print_str_and_uint32("read addr", addr);
}

void write_mem(uint32_t addr) // pysical memory range access test
{
    uint8_t *byte = (uint8_t *)addr;
    *byte = 0x66;
    print_str_and_uint32("write to addr, expected 0x66, now its value is", *byte);
}

uint32_t check_a_page(uint32_t virtual)
{
    if ((virtual & 0xfff))
    {
        println("addr not align to 4k");
        return 0;
    }
    uint32_t pd_offset = PTD_OFFSET(virtual);
    uint32_t pe_offset = PTE_OFFSET(virtual);
    uint32_t *pt = (uint32_t *)&g_page_table[pd_offset];
    uint32_t *pd = (uint32_t *)page_directory;
    if (!(pd[pd_offset] & 1))
    {
        print_str_and_uint32("pd entry not exist for addr", virtual);
    }
    else if (!(pt[pe_offset] & 1))
    {
        print_str_and_uint32("pt entry not exist", virtual);
    }
    else if (pd[pd_offset] != (uint32_t)pt)
    {
        print_str_and_uint32("pd entry not match pt for addr", virtual);
    }
    else
    {
        print_str_and_uint32("virtual", virtual);
        print_str_and_uint32("physical", pt[pe_offset] & 0xfffff000);
    }
}

void map_a_page(uint32_t virtual, uint32_t physical)
{
    if ((virtual & 0xfff) || (physical & 0xfff))
    {
        println("addr not align to 4k");
        return;
    }
    // else if (check_a_page(virtual))
    // {
    //     print_str_and_uint32("already mapped virtaul addr", virtual);
    //     return;
    // }
    // print_str_and_uint32("map_a_page", (uint32_t)map_a_page);

    uint32_t pd_offset = PTD_OFFSET(virtual);
    uint32_t pe_offset = PTE_OFFSET(virtual);
    uint32_t *pt = (uint32_t *)&g_page_table[pd_offset];
    uint32_t *pd = (uint32_t *)page_directory;
    pd[pd_offset] = (uint32_t)pt | 3;
    pt[pe_offset] = physical | 3;
}

void unmap_a_page(uint32_t virtual)
{
    if ((virtual & 0xfff))
    {
        println("addr not align to 4k");
        return;
    }
    print_str_and_uint32("unmap_a_page", (uint32_t)unmap_a_page);

    uint32_t pd_offset = PTD_OFFSET(virtual);
    uint32_t pe_offset = PTE_OFFSET(virtual);
    uint32_t *pt = (uint32_t *)&g_page_table[pd_offset];
    uint32_t *pd = (uint32_t *)page_directory;

    if (check_a_page(virtual))
    {
        pt[pe_offset] = 0;
    }
}

void init_mmu()
{
    uint32_t *pd = (uint32_t *)page_directory;

    uint32_t pd_offset = PTD_OFFSET(0x0);
    uint32_t pe_offset = PTE_OFFSET(0);
    uint32_t *pt = (uint32_t *)&g_page_table[pd_offset];

    pd[pd_offset] = (uint32_t)pt | 1;        // bit-0 must set to 1 (Present)
    identity_paging(pt, 0, 1024 * 1024 * 4); // virtual 0~1024 -> physical 0~1024
                                             // print_str_and_uint32("pt[0] addr", (uint32_t)(&pt[pe_offset]));
                                             // print_str_and_uint32("page dir addr", (uint32_t)page_directory);

    // if idt is not in fisrt 1M we need extra paging
    /*
        uint32_t idt_addr = get_idt_start_addr();
        pt = &g_page_table[PTD_OFFSET(idt_addr)];
        *((uint32_t *)(&page_directory[PTD_OFFSET(idt_addr)])) = (uint32_t)pt | 3;
        identity_paging((uint32_t *)pt, idt_addr & 0xffc00000, 1024 * 1024 * 4);
    */
    // map pd
    map_a_page((uint32_t)pd, (uint32_t)pd);
    uint32_t i = (uint32_t)g_page_table;
    int pt_num = 1024;
    while (pt_num--)
    {
        map_a_page(i, i);
        i += 0x1000;
    }

    /*
    out kernel start at 0x00001000 pysical addr

    | pdt offset | pte offset |  pf offset   |
    | 0000000000 | 0000000001 | 000000000000 |

    when cr0's 31-bit is set , all the address access is virtual and will go through mmu
    */

    enable_paging();
    println("i made mmu!");
}

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

void map_vaddr_4k(uint32_t vaddr)
{
    // print_str_and_uint32("map_vaddr_4k", (uint32_t)map_vaddr_4k);
    vaddr &= 0xfffff000;

    if (vaddr >= HIGH_ADDR_START)
    {
        map_a_page(vaddr, vaddr - HIGH_ADDR_START);
        return;
    }

    uint32_t *page_table_ptr = (uint32_t *)&g_page_table[PTD_OFFSET(vaddr)];
    uint32_t *page_dir_ptr = (uint32_t *)&page_directory;

    uint32_t new_page_frame_addr = 0;
    alloc_page(&new_page_frame_addr, 0x1000);
    if (!new_page_frame_addr)
    {
        println("alloc page frame failed");
        while (1)
            ; // panic
    }
    else
    {
        print_str_and_uint32("success alloc page frame addr", new_page_frame_addr);
    }
    map_a_page(vaddr, new_page_frame_addr);
}
