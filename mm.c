#include "mm.h"
#include "paging.h"

void printProcessMemSpace(process_t *proc)
{
    println("+++++++printProcessMemSpace start");
    printNumberVar(proc->cr3);
    uint32_t i;
    uint32_t j;
    pde_t *pde_ptr = (pde_t *)proc->cr3;
    for (i = 0; i < 1024; i++, pde_ptr++)
    {
        if (!IS_PRESENT(pde_ptr->attr))
            continue;

        println("find pde");
        printuint32(pde_ptr->addr);
        print(" ---> ");
        printuint32(pde_ptr->addr + PAGE_SIZE - 1);
        putchar('\n');

        uint32_t page_table_addr = pde_ptr->addr;
        pte_t *pte_ptr = (pte_t *)page_table_addr;

        for (j = 0; j < 1024; j++, pte_ptr++)
        {
            if (!IS_PRESENT(pte_ptr->attr))
                continue;

            println("find pte");
            printuint32(pte_ptr->addr);
            print(" ---> ");
            printuint32(pte_ptr->addr + PAGE_SIZE - 1);
            putchar('\n');
        }
    }
    println("-------printProcessMemSpace end");
}