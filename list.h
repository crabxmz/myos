#ifndef LIST_H
#define LIST_H
#include "type.h"
#define GET_OFFSET(type_name, member_name) ((uint32_t)(&((type_name *)0->member_name)))
#define GET_OBJECT_FROM_LIST_NODE(list_node_ptr, type_name, member_name) ((type_name *)((uint8_t *)(list_node_ptr)-GET_OFFSET(type_name, member_name)))
typedef struct list_node
{
    struct list_node *prev;
    struct list_node *next;
} list_node;

typedef struct
{
    list_node *head;
    uint32_t len;
} list;

uint32_t init_node(list_node *head);
void add_to_list_tail(list *ls, list_node *node);
#endif