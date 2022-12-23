ENTRY(grub_main)
/* emulation(elf_i386) */
INPUT(
      log.o 
      x86.o 
      elf.o 
      grub.o
      disk.o
      string.o
     )

OUTPUT(grub.bin)
OUTPUT_FORMAT(binary)

SECTIONS
{
  . = 0x001000;
  grub_start = .;
  .text :
  {
    grub.o(.text)
    *(.text)
  }

  .data :
  {
    *(.data)
  }

  .rodata :
  {
    *(.rodata)
  }

  .bss :
  {
    *(.bss)
    *(COMMON)
  }

  grub_end = .;

  high_addr_space = 0xc0000000;
  kernel_physical_start = 0x00100000;

  /DISCARD/ :
  {
    *(.comment)
    *(.eh_frame)
  }
}
