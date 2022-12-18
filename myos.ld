ENTRY(main)
/* emulation(elf_i386) */
INPUT(
      entry.o
      isr_wrapper.o
      idt.o
      panic.o
      log.o
      pic.o
      x86.o
      bitmap_allocator.o
      kpage_map.o
      tss.o
      process.o
      enter_ring3.o
      elf.o
      gdt.o
      disk.o
      string.o
      block.o
      ext2.o
     )

OUTPUT(kernel.elf)
OUTPUT_FORMAT(elf32-i386)

 /* the code should be relocated to 3GB + 1MB */

SECTIONS
{
  . = 0xc0100000;

  .text : AT(ADDR(.text) - 0xc0000000)
  {
    *(.text)
  }

  .rodata : AT(ADDR(.rodata) - 0xc0000000)
  { 
    *(.rodata)
  }


  .data : AT(ADDR(.data) - 0xc0000000)
  { 
    *(.data)
  }


  .bss : AT(ADDR(.bss) - 0xc0000000)
  {
    *(.bss)
    *(COMMON)
  }
  
  . = ALIGN (4096);

  kernel_end = .;

  /DISCARD/ :
  {
    *(.comment)
    *(.eh_frame)
  }
}
