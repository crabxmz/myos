#include "log.h"
#include "x86.h"
#include "page_frame_alloc.h"

buddy_allocator pf_alloc;

uint32_t alloc_page(uint32_t *res, buddy_allocator *this, uint32_t size)
{
    uint32_t cur_node_idx = 0;
    uint32_t cur_depth = 0;
    while (cur_node_idx < TOT_META_NODES)
    {
        uint32_t child_node_size = NODE_SIZE_OF_DEPTH(cur_depth) / 2;
        if (child_node_size < size)
        {
            if (!GET_NODE_STATUS(this, cur_node_idx))
            {
                SET_NODE_STATUS(this, cur_node_idx);
                *res = (cur_node_idx - START_NODE_IDX_OF_DEPTH(cur_depth)) * NODE_SIZE_OF_DEPTH(cur_depth) + BASE_ADDR;
                // println("find res in cur idx %u, addr %u\n", cur_node_idx, *res);
                while (cur_depth--)
                {
                    uint32_t buddy_idx;
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
                // println("go to left idx %u\n", cur_node_idx);
            }
            else if (!GET_NODE_STATUS(this, right_child_idx))
            {
                cur_node_idx = right_child_idx;
                cur_depth++;
                // println("go to right idx %u\n", cur_node_idx);
            }
            else
            {
                res = 0;
                print_str_and_uint32("already allocated", cur_node_idx);
                return 0;
            }
        }
    }

    return 0;
}

void free_4k_page(buddy_allocator *this, uint32_t addr_to_free)
{
    uint32_t cur_depth = MSB - 12; // 1G->4k
    uint32_t node_to_free = GET_IDX_OFFSET(addr_to_free, PAGE_SIZE) + START_NODE_IDX_OF_DEPTH(cur_depth);
    if (!GET_NODE_STATUS(this, node_to_free))
    {
        // println("addr %u is not allocated, node idx %u, start idx %u, depth %u\n", addr_to_free, node_to_free, START_NODE_IDX_OF_DEPTH(cur_depth), cur_depth);
        print_str_and_uint32("addr not allocated", addr_to_free);
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
        uint32_t res;
        alloc_page(&res, &pf_alloc, 0x1000);
        if (i * 0x1000 + BASE_ADDR != res)
        {
            // println("maybe have problem when alloc page %d\n", i);
        }
    }
}

void test_free_4k_page()
{
    int i = 0;
    for (; i < 0x100; i++)
    {
        uint32_t res;
        free_4k_page(&pf_alloc, i * 0x1000 + BASE_ADDR);
    }
}

void test_repeat_alloc_free()
{
    int i = 0;
    for (; i < 0x100; i++)
    {
        uint32_t res;
        alloc_page(&res, &pf_alloc, 0x1000);
        free_4k_page(&pf_alloc, res);
    }
}

// int main()
// {
//     test_4k_page();
//     test_free_4k_page();
//     test_repeat_alloc_free();
//     println("tot mem nodes %u\n", TOT_META_NODES);
//     return 0;
// }