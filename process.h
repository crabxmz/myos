#ifndef PROCESS_H
#define PROCESS_H

#include "type.h"
#include "memory.h"
#include "memory.h"

typedef struct
{
    uint32_t cr3;          // page dir
    uint32_t kstack_paddr; // paddr of stack mem
    uint32_t esp;
    uint32_t eip;
} process_t;

void init_proc(process_t* proc,uint32_t disk_offset);
#endif