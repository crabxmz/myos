#include "type.h"
#define ELF_MAGIC 0x464C457Fu // "\x7FELF" in little endian
#define ELF_DISK_OFFSET 6
#define ELF_MEM_OFFSET 0x1000
#define SECTSIZE 512

// Values for Proghdr type
#define ELF_PROG_LOAD 1

// Flag bits for Proghdr flags
#define ELF_PROG_FLAG_EXEC 1
#define ELF_PROG_FLAG_WRITE 2
#define ELF_PROG_FLAG_READ 4

// File header
typedef struct
{
    uint32_t magic; // must equal ELF_MAGIC
    uint8_t elf[12];
    uint16_t type;
    uint16_t machine;
    uint32_t version;
    uint32_t entry;
    uint32_t phoff;
    uint32_t shoff;
    uint32_t flags;
    uint16_t ehsize;
    uint16_t phentsize;
    uint16_t phnum;
    uint16_t shentsize;
    uint16_t shnum;
    uint16_t shstrndx;
} elfhdr;

// Program section header
typedef struct
{
    uint32_t type;
    uint32_t off;
    uint32_t vaddr;
    uint32_t paddr;
    uint32_t filesz;
    uint32_t memsz;
    uint32_t flags;
    uint32_t align;
} proghdr;

void load_elf(uint32_t elf_disk_offset);
uint32_t load_user_elf(uint32_t elf_disk_offset);
