#ifndef PAGE_FRAME_ALLOC
#define PAGE_FRAME_ALLOC

#include "memory.h"
#include "type.h"
#include "paging.h"

#define BASE_ADDR ((((uint32_t)kernel_end) & 0xfffff000) + 0x1000)

#define MSB (31)
#define TOT_MEM (1u << (MSB))
#define BOTTOM_NODE_NUM ((TOT_MEM) / (PAGE_SIZE))
#define BOTTOM_META_BYTES ((BOTTOM_NODE_NUM) / 8)

/*
2^0 + 2^1 + 2^2 ...
TODO: bottom block is at least 4096,no need to split to 1 bit
*/
#define TOT_META_BYTES ((BOTTOM_META_BYTES)*2 - 1)

#define TOT_META_NODES ((TOT_META_BYTES)*8) // bytes to bits

#define GET_IDX_OFFSET(addr, node_size_of_level) ((addr - BASE_ADDR) / (node_size_of_level))
#define GET_NODE_STATUS(p_buddy_allocator, node_id) ((p_buddy_allocator)->meta[(node_id) / 8] & (1u << ((node_id) % 8)))
#define SET_NODE_STATUS(p_buddy_allocator, node_id) ((p_buddy_allocator)->meta[(node_id) / 8] |= (1u << ((node_id) % 8)))
#define CLEAR_NODE_STATUS(p_buddy_allocator, node_id) ((p_buddy_allocator)->meta[(node_id) / 8] &= ~(1u << ((node_id) % 8)))
#define LEFT_NODE_IDX(id) ((id)*2 + 1)
#define RIGHT_NODE_IDX(id) ((id)*2 + 2)
#define PARENT_NODE_IDX(id) ((id - 1) / 2)

#define START_NODE_IDX_OF_DEPTH(depth) ((1u << (depth)) - 1u)
#define NODE_SIZE_OF_DEPTH(depth) ((TOT_MEM) >> (depth))

typedef struct
{
    unsigned char meta[TOT_META_BYTES];
} buddy_allocator;

uint32_t alloc_page(uint32_t *res, uint32_t size);
void free_4k_page(uint32_t addr_to_free);

#endif