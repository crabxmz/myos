#ifndef BITMAP_ALLOCATOR_H
#define BITMAP_ALLOCATOR_H
#include "memory.h"
#include "type.h"
#include "paging.h"

#define ADDR_2_SLOT(addr) (addr / PAGE_SIZE / (sizeof(uint8_t) * 8))
#define ADDR_2_SLOT_OFFSET(addr) ((addr / PAGE_SIZE) % (sizeof(uint8_t) * 8))

#define SET_BIT(alloctor, addr) ((alloctor).bitmap[ADDR_2_SLOT(addr)]) |= (1u << ADDR_2_SLOT_OFFSET(addr))
#define GET_BIT(alloctor, addr) ((alloctor).bitmap[ADDR_2_SLOT(addr)]) &= (1u << ADDR_2_SLOT_OFFSET(addr))
#define CLEAR_BIT(alloctor, addr) ((alloctor).bitmap[ADDR_2_SLOT(addr)]) &= (~(1u << ADDR_2_SLOT_OFFSET(addr)))

typedef struct
{
    uint8_t bitmap[TOT_PHY_MEM / PAGE_SIZE / (sizeof(uint8_t) * 8)];
    uint32_t user_free_page_start;
    uint32_t kernel_free_page_start;
    uint32_t kernel_pte_start; // phy mem for page table, increase like stack
} bitmap_allocator_t;

uint32_t init_bit_alloc();
uint32_t alloc_a_page(uint32_t priv);
uint32_t free_a_page(uint32_t addr);
uint32_t query_a_page(uint32_t addr);

#endif
