#ifndef SCHEDULE_H
#define SCHEDULE_H
#include "type.h"
#include "process.h"

void init_scheduler();
uint32_t add_process(process_t *proc);

#endif