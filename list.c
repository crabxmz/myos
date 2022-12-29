#include "list.h"
uint32_t init_node(list_node *head)
{
    head->next = head;
    head->prev = head;
}

void add_to_list_tail(list *ls, list_node *node)
{
    if (!ls->head)
    {
        ls->head = node;
        ls->len = 0;
        init_node(ls->head);
    }
    else
    {
        node->next = ls->head;
        node->prev = ls->head->prev;
        node->prev->next = node;
        node->next->prev = node;
    }
    ls->len++;
}