ENTRY(load_test)
/* emulation(elf_i386) */
INPUT(
      high_addr_entry.o
      log.o
      x86.o
     )

OUTPUT(load_test.o)
OUTPUT_FORMAT(elf32-i386)

 /* the code should be relocated to 3GB + 1MB */

SECTIONS
{
  . = 0xc0100000;

  .text : AT(ADDR(.text) - 0xc0000000)
  {
    *(.text)
  }

  .data : AT(ADDR(.data) - 0xc0000000)
  {
    *(.data)
  }

  .rodata : AT(ADDR(.rodata) - 0xc0000000)
  {
    *(.rodata)
  }

  .bss : AT(ADDR(.bss) - 0xc0000000)
  {
    *(.bss)
  }

  /DISCARD/ :
  {
    *(.comment)
  }
}
