#include "elf.h"
#include "type.h"
#include "x86.h"
#include "log.h"
#include "disk.h"

void read_seg(uint32_t seg_disk_offset_in_bytes, uint32_t dst_paddr, uint32_t filesz, uint32_t elf_disk_sec_offset) // read program header
{
    if (!filesz)
    {
        return;
    }
    uint32_t seg_start_sector = seg_disk_offset_in_bytes / SECTOR_SIZE + elf_disk_sec_offset;
    uint32_t seg_end_sector = (seg_disk_offset_in_bytes + filesz) / SECTOR_SIZE + elf_disk_sec_offset;
    uint32_t i, j;
    uint32_t aligned_dst_addr = dst_paddr - (seg_disk_offset_in_bytes % SECTOR_SIZE);

    // print_str_and_uint32("seg_start_sector", seg_start_sector);
    // print_str_and_uint32("seg_end_sector", seg_end_sector);
    for (i = seg_start_sector; i <= seg_end_sector; i++, aligned_dst_addr += SECTOR_SIZE)
    {
        read_one_sector((uint8_t *)aligned_dst_addr, i);
        // uint8_t *seg = (uint8_t *)aligned_dst_addr;
        // for (j = 0; j < 32; j++)
        // {
        //     print_str_and_uint32("seg[j]", seg[j]);
        // }
    }
}

void load_elf(uint32_t elf_disk_offset)
{
    void (*entry)(void);
    uint8_t elf_header[512];
    read_one_sector(elf_header, elf_disk_offset);
    // uint8_t *elf_disk_start = (uint8_t *)(ELF_DISK_OFFSET * SECTSIZE + ELF_MEM_OFFSET);

    // Read 1st page off disk

    // Load each program segment (ignores ph flags).
    elfhdr *src_elf = (elfhdr *)elf_header;

    if (src_elf->magic != ELF_MAGIC)
    {
        print_str_and_uint32("not a elf file, magic num", src_elf->magic);
        return;
    }

    proghdr *src_program_hdr = (proghdr *)((uint8_t *)src_elf + src_elf->phoff);

    uint32_t ph_num = src_elf->phnum;
    // print_str_and_uint32("program header tot num", ph_num);

    uint32_t i = 0;

    for (i = 0; i < ph_num; src_program_hdr++, i++)
    {
        uint8_t *program_content_start = (uint8_t *)src_elf + src_program_hdr->off;
        uint8_t *physical_addr = (uint8_t *)(src_program_hdr->paddr);

        // print_str_and_uint32("dst paddr", (uint32_t)src_program_hdr->paddr);
        // print_str_and_uint32("src program header", (uint32_t)src_program_hdr);
        // print_str_and_uint32("src program header offset", (uint32_t)src_program_hdr->off);
        // print_str_and_uint32("src program content start", (uint32_t)program_content_start);
        // print_str_and_uint32("program_hdr->filesz", (uint32_t)src_program_hdr->filesz);
        // print_str_and_uint32("program_hdr idx", i);
        // print_str_and_uint32("program_hdr filesz", src_program_hdr->filesz);
        // print_str_and_uint32("program_hdr memsz", src_program_hdr->memsz);
        read_seg(src_program_hdr->off, src_program_hdr->paddr, src_program_hdr->filesz, elf_disk_offset);

        if (src_program_hdr->memsz > src_program_hdr->filesz)
        {
            int j;
            for (j = 0; j < src_program_hdr->memsz - src_program_hdr->filesz; j++)
            {
                uint8_t *d = (uint8_t *)(src_program_hdr->paddr) + src_program_hdr->filesz;
                d[j] = 0;
            }
        }
    }

    // Call the entry point from the ELF header.
    // Does not return!
    entry = (void (*)(void))(src_elf->entry);
    // print_str_and_uint32("entry is", (uint32_t)entry);

    entry();
}

uint32_t load_user_elf(uint32_t elf_disk_offset)
{
    uint32_t i;

    print_str_and_uint32("load_user_elf", (uint32_t)load_user_elf);
    uint8_t elf_header[512];

    read_one_sector(elf_header, elf_disk_offset);

    // Read 1st page off disk

    // Load each program segment (ignores ph flags).
    elfhdr *src_elf = (elfhdr *)elf_header;

    if (src_elf->magic != ELF_MAGIC)
    {
        print_str_and_uint32("not a elf file, magic num", src_elf->magic);
        return;
    }

    proghdr *src_program_hdr = (proghdr *)((uint8_t *)src_elf + src_elf->phoff);

    uint32_t ph_num = src_elf->phnum;
    // print_str_and_uint32("program header tot num", ph_num);

    for (i = 0; i < ph_num; src_program_hdr++, i++)
    {
        if (src_program_hdr->type != ELF_PROG_LOAD)
        {
            continue;
        }
        int j;

        // uint8_t *program_content_start = (uint8_t *)src_elf + src_program_hdr->off;
        // uint8_t *physical_addr = (uint8_t *)(src_program_hdr->paddr);
        // print_str_and_uint32("dst paddr", (uint32_t)src_program_hdr->paddr);
        // print_str_and_uint32("src program header", (uint32_t)src_program_hdr);
        // print_str_and_uint32("src program header offset", (uint32_t)src_program_hdr->off);
        // print_str_and_uint32("src program content start", (uint32_t)program_content_start);
        // print_str_and_uint32("program_hdr->filesz", (uint32_t)src_program_hdr->filesz);
        // print_str_and_uint32("program_hdr idx", i);
        // print_str_and_uint32("program_hdr filesz", src_program_hdr->filesz);

        read_seg(src_program_hdr->off, src_program_hdr->vaddr, src_program_hdr->filesz, elf_disk_offset);

        if (src_program_hdr->memsz > src_program_hdr->filesz)
        {
            for (j = 0; j < src_program_hdr->memsz - src_program_hdr->filesz; j++)
            {
                uint8_t *d = (uint8_t *)(src_program_hdr->vaddr) + src_program_hdr->filesz;
                d[j] = 0;
            }
        }
    }

    print_str_and_uint32("user entry is", (uint32_t)src_elf->entry);

    return src_elf->entry;
}
