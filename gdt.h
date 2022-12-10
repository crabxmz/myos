#ifndef GDT_H
#define GDT_H
#include "type.h"
typedef struct
{
	unsigned int limit_low : 16;
	unsigned int base_low : 24;
	unsigned int accessed : 1;
	unsigned int read_write : 1;			 // readable for code, writable for data
	unsigned int conforming_expand_down : 1; // conforming for code, expand down for data
	unsigned int code : 1;					 // 1 for code, 0 for data
	unsigned int code_data_segment : 1;		 // should be 1 for everything but TSS and LDT
	unsigned int DPL : 2;					 // privilege level
	unsigned int present : 1;
	unsigned int limit_high : 4;
	unsigned int available : 1; // only used in software; has no effect on hardware
	unsigned int long_mode : 1;
	unsigned int big : 1;  // 32-bit opcodes for code, uint32_t stack for data
	unsigned int gran : 1; // 1 to use 4k page addressing, 0 for byte addressing
	unsigned int base_high : 8;
} __attribute__((packed)) gdt_entry_t;

typedef struct
{
	uint16_t size;
	uint32_t start_addr;
} __attribute__((packed)) gdt_register_t;

#define K_CS_SEG 0x1
#define K_DS_SEG 0x2
#define U_CS_SEG 0x3
#define U_DS_SEG 0x4
#define TSS_SEG 0x5
#define DESC_NUM 0x6
#define GET_GDT_DESC(base, offset) ((gdt_entry_t *)((uint32_t)base + (offset) * sizeof(gdt_entry_t)))
void sgdt(gdt_register_t *ret);
void lgdt(gdt_register_t *ret);
void init_gdt();
uint32_t get_gdt_base();
#endif