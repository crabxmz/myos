#ifndef KPAGE_MAP_H
#define KPAGE_MAP_H
#include "paging.h"
void map_a_page(uint32_t vaddr, uint32_t paddr, uint8_t u_s_bit);
#endif