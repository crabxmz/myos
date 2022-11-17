ENTRY(main)
/* emulation(elf_i386) */
INPUT(kernel_entry.o entry.o isr_wrapper.o)
OUTPUT(kernel.bin)
OUTPUT_FORMAT(binary)

 /* the code should be relocated to 3GB + 1MB */
. = 0xC0001000

SECTIONS
{
  . = 0x1000;
  .text ALIGN (0x1000) : 
  { 
    kernel_entry.o(.text)
    entry.o(.text) 
    isr_wrapper.o(.text)
  }
  .rodata ALIGN (0x1000) : { *(.rodata) }
  .data ALIGN (0x1000) : { *(.data) }
  .bss ALIGN (0x1000) : { *(.bss) }
}
