#include "type.h"

typedef struct
{
    uint32_t paddr_start;
    uint32_t vaddr_start;
    uint32_t size;
    process_page_t *next;
} process_page_t;
