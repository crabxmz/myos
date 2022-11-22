#include <stdio.h>

#define BASE_VADDR (0xa00000)

#define PAGE_SIZE (4096)
#define MSB (31)
#define TOT_MEM (1u << (MSB))
#define BOTTOM_NODE_NUM ((TOT_MEM) / (PAGE_SIZE))
#define BOTTOM_META_BYTES ((BOTTOM_NODE_NUM) / 8)
#define TOT_META_BYTES ((BOTTOM_META_BYTES)*2 - 1)
#define TOT_META_NODES ((TOT_META_BYTES)*8)

#define GET_IDX_OFFSET(addr, node_size_of_level) ((addr - BASE_VADDR) / (node_size_of_level))
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

buddy_allocator my_alloc;

unsigned int alloc_page(unsigned int *res, buddy_allocator *this, unsigned int size)
{
    unsigned int cur_node_idx = 0;
    unsigned int cur_depth = 0;
    while (cur_node_idx < TOT_META_NODES)
    {
        unsigned int child_node_size = NODE_SIZE_OF_DEPTH(cur_depth) / 2;
        if (child_node_size < size)
        {
            if (!GET_NODE_STATUS(this, cur_node_idx))
            {
                SET_NODE_STATUS(this, cur_node_idx);
                *res = (cur_node_idx - START_NODE_IDX_OF_DEPTH(cur_depth)) * NODE_SIZE_OF_DEPTH(cur_depth) + BASE_VADDR;
                // printf("find res in cur idx %u, addr %u\n", cur_node_idx, *res);
                while (cur_depth--)
                {
                    unsigned int buddy_idx;
                    if (cur_node_idx & 1)
                        buddy_idx = cur_node_idx + 1;
                    else
                        buddy_idx = cur_node_idx - 1;

                    if (cur_node_idx && GET_NODE_STATUS(this, buddy_idx))
                    {
                        SET_NODE_STATUS(this, PARENT_NODE_IDX(cur_node_idx));
                    }
                    else
                    {
                        break;
                    }
                    cur_node_idx = PARENT_NODE_IDX(cur_node_idx);
                }
            }
            else
            {
                res = 0;
            }
            return 0;
        }
        else
        {
            int left_child_idx = LEFT_NODE_IDX(cur_node_idx);
            int right_child_idx = RIGHT_NODE_IDX(cur_node_idx);

            if (!GET_NODE_STATUS(this, left_child_idx))
            {
                cur_node_idx = left_child_idx;
                cur_depth++;
                // printf("go to left idx %u\n", cur_node_idx);
            }
            else if (!GET_NODE_STATUS(this, right_child_idx))
            {
                cur_node_idx = right_child_idx;
                cur_depth++;
                // printf("go to right idx %u\n", cur_node_idx);
            }
            else
            {
                res = 0;
                printf("already allocated\n");
                return 0;
            }
        }
    }

    return 0;
}

void free_4k_page(buddy_allocator *this, unsigned int addr_to_free)
{
    unsigned int cur_depth = MSB - 12; // 1G->4k
    unsigned int node_to_free = GET_IDX_OFFSET(addr_to_free, PAGE_SIZE) + START_NODE_IDX_OF_DEPTH(cur_depth);
    if (!GET_NODE_STATUS(this, node_to_free))
    {
        printf("addr %u is not allocated, node idx %u, start idx %u, depth %u\n", addr_to_free, node_to_free, START_NODE_IDX_OF_DEPTH(cur_depth), cur_depth);
        return;
    }
    while (cur_depth--)
    {
        if (GET_NODE_STATUS(this, node_to_free))
        {
            CLEAR_NODE_STATUS(this, node_to_free);
            node_to_free = PARENT_NODE_IDX(node_to_free);
        }
        else
        {
            break;
        }
    }
}

void test_4k_page()
{
    int i = 0;
    for (; i < 0x100; i++)
    {
        unsigned int res;
        alloc_page(&res, &my_alloc, 0x1000);
        if (i * 0x1000 + BASE_VADDR != res)
        {
            printf("maybe have problem when alloc page %d\n", i);
        }
    }
}

void test_free_4k_page()
{
    int i = 0;
    for (; i < 0x100; i++)
    {
        unsigned int res;
        free_4k_page(&my_alloc, i * 0x1000 + BASE_VADDR);
    }
}

void test_repeat_alloc_free()
{
    int i = 0;
    for (; i < 0x100; i++)
    {
        unsigned int res;
        alloc_page(&res, &my_alloc, 0x1000);
        free_4k_page(&my_alloc, res);
    }
}

int main()
{
    test_4k_page();
    test_free_4k_page();
    test_repeat_alloc_free();
    printf("tot mem nodes %u\n", TOT_META_NODES);
    return 0;
}