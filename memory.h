#ifndef MEMORY_H
#define MEMORY_H
void kernel_physical_start(void);
void high_addr_space(void);
void kernel_start(void);
void kernel_end(void);
void grub_start(void);
void grub_end(void);

#define TOT_PHY_MEM (1024u * 1024 * 1024)
#define USER_MODE_PHY_FREE_MEM_START (TOT_PHY_MEM / 4)
#define KERNEL_MODE_PHY_FREE_MEM_START ((uint32_t)(&kernel_end) - 0xc0000000)
#define KERNEL_MODE_PHY_PTE_START (USER_MODE_PHY_FREE_MEM_START - 4096) // increase like stack
#define USER_STACK_ADDR (0xc0000000 - sizeof(uint32_t *))

#endif