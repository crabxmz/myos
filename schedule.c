#include "schedule.h"
#include "list.h"

list proc_list = {0};

uint32_t add_process(process_t *proc)
{
    add_to_list_tail(&proc_list, &proc->_list_node);
}