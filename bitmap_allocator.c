#include "bitmap_allocator.h"
#include "panic.h"
#include "log.h"
#include "memory.h"

bitmap_allocator_t bit_alloc;

uint32_t init_bit_alloc()
{
    bit_alloc.kernel_free_page_start = KERNEL_MODE_PHY_FREE_MEM_START;
    bit_alloc.user_free_page_start = USER_MODE_PHY_FREE_MEM_START;
    bit_alloc.kernel_pte_start = KERNEL_MODE_PHY_PTE_START;
}

uint32_t alloc_a_pte()
{
    SET_BIT(bit_alloc, bit_alloc.kernel_pte_start);
    uint32_t res = bit_alloc.kernel_pte_start;
    bit_alloc.kernel_pte_start -= PAGE_SIZE;
    return res;
}

uint32_t free_a_pte(uint32_t addr)
{
    if (addr & 0xfff)
    {
        panic(__FUNCTION__);
    }
    CLEAR_BIT(bit_alloc, addr);
    while (addr == bit_alloc.kernel_pte_start + PAGE_SIZE)
    {
        bit_alloc.kernel_pte_start = addr;
        addr += PAGE_SIZE;
        if (GET_BIT(bit_alloc, addr))
        {
            break;
        }
    }
}

uint32_t alloc_a_page(uint32_t priv) // return phy addr
{
    uint32_t res;
    if (!priv) // ring 0
    {
        SET_BIT(bit_alloc, bit_alloc.kernel_free_page_start);
        res = bit_alloc.kernel_free_page_start;
        bit_alloc.kernel_free_page_start += PAGE_SIZE;
    }
    else // ring 3
    {
        SET_BIT(bit_alloc, bit_alloc.user_free_page_start);
        res = bit_alloc.user_free_page_start;
        bit_alloc.user_free_page_start += PAGE_SIZE;
    }
    return res;
}

uint32_t free_a_page(uint32_t addr) // phy addr
{
    if (addr & 0xfff)
    {
        panic(__FUNCTION__);
    }
    CLEAR_BIT(bit_alloc, addr);
    while (addr == bit_alloc.user_free_page_start - PAGE_SIZE)
    {
        bit_alloc.user_free_page_start = addr;
        addr -= PAGE_SIZE;
        if (GET_BIT(bit_alloc, addr))
        {
            break;
        }
    }
}

uint32_t query_a_page(uint32_t addr)
{
    return GET_BIT(bit_alloc, addr);
}