#include "kpage_map.h"
#include "panic.h"
#include "log.h"

void map_a_page(uint32_t vaddr, uint32_t paddr, uint8_t u_or_s_bit)
{
    print_str_and_uint32("++vaddr", vaddr);
    print_str_and_uint32("++paddr", paddr);
    print_str_and_uint32("u_or_s_bit", u_or_s_bit);
    if ((vaddr & 0xfff) || (paddr & 0xfff))
    {
        print_str_and_uint32("vaddr", vaddr);
        print_str_and_uint32("paddr", paddr);
        panic(__FUNCTION__);
    }

    uint32_t *pd_addr;

    __asm__ volatile("mov %%cr3,%0"
                     : "=r"(pd_addr));
    // alloc and map

    uint32_t page_priv = u_or_s_bit ? 3 : 0;
    uint32_t pd_off = PD_OFFSET(vaddr);

    print_str_and_uint32("pd_addr", (uint32_t)pd_addr);
    // alloc page table
    if (!IS_PRESENT(pd_addr[pd_off]))
    {
        println("pd_entry not present");
        uint32_t new_pt = alloc_a_page(0);
        // pd_addr[pd_off] = (new_pt | 1 | u_or_s_bit);
        pd_addr[pd_off] = (new_pt | 7);
        print_str_and_uint32("new_pt", new_pt);
    }
    print_str_and_uint32("pd_entry", pd_addr[pd_off]);

    // alloc page frame
    uint32_t *pt_addr = (uint32_t *)(pd_addr[pd_off] & 0xfffff000);
    uint32_t pt_off = PT_OFFSET(vaddr);
    print_str_and_uint32("pt_offset++++", pt_off);
    print_str_and_uint32("pt_addr++++", (uint32_t)pt_addr);

    if (IS_PRESENT(pt_addr[pt_off]))
    {
        print_str_and_uint32("pt entry already exsit", pt_addr[pt_off]);
        // panic("page frame already present");
    }
    // pt_addr[pt_off] = (paddr | 1 | u_or_s_bit);
    pt_addr[pt_off] = (paddr | 7);
    print_str_and_uint32("pt_addr[pt_off]++++", pt_addr[pt_off]);
}