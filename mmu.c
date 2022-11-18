#include "paging.h"

void init_mmu()
{
    *((uint32_t *)(&page_directory[0])) = (uint32_t)page_table | 1; // bit-0 must set to 1 (Present)

    /*
    out kernel start at 0x00001000 pysical addr

    | pdt offset | pte offset |  pf offset   |
    | 0000000000 | 0000000001 | 000000000000 |

    when cr0's 31-bit is set , all the address access is virtual and will go through mmu
    */
    identity_paging((uint32_t *)&page_table[1], 0x1000, 1024 * 1024);

    enable_paging();
    println("");
    println("i made mmu!");
}
