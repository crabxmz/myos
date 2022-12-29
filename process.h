#ifndef PROCESS_H
#define PROCESS_H

#include "type.h"
#include "memory.h"
#include "memory.h"
#include "list.h"

typedef struct
{
    list_node _list_node;
    uint32_t cr3;          // page dir
    uint32_t kstack_paddr; // paddr of stack mem
    uint32_t esp;
    uint32_t eip;
    uint32_t pid;
} process_t;

void init_proc(process_t *proc, uint32_t disk_offset);
void init_proc_from_buffer(process_t *proc, uint8_t *buf);
void printProcessState(process_t *proc);
#endif