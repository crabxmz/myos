ENTRY(main)
/* emulation(elf_i386) */
INPUT(kernel_entry.o
      entry.o
      isr_wrapper.o
      idt.o
      pic.o
      paging.o
      )
OUTPUT(kernel.bin)
OUTPUT_FORMAT(binary)

 /* the code should be relocated to 3GB + 1MB */

SECTIONS
{
  . = 0x1000;
    
  .boot.text : 
  {
    kernel_entry.o(.text) /*must be first?*/
    idt.o(.text)
    isr_wrapper.o(.text)
    pic.o(.text)
    entry.o(.text)
    paging.o(.text)
  }
  .boot.rodata :
  { 
    kernel_entry.o(.rodata) /*must be first?*/
    idt.o(.rodata)
    isr_wrapper.o(.rodata)
    pic.o(.rodata)
    entry.o(.rodata)
    paging.o(.rodata)
  }
  .boot.data :
  { 
    kernel_entry.o(.data) /*must be first?*/
    idt.o(.data)
    isr_wrapper.o(.data)
    pic.o(.data)
    entry.o(.data) 
    paging.o(.data)
  }
  .boot.bss :
  { 
    kernel_entry.o(.bss) /*must be first?*/
    idt.o(.bss)
    isr_wrapper.o(.bss)
    pic.o(.bss)
    entry.o(.bss) 
    paging.o(.bss)
  }

  /* _boot_end = .; */

  /* . += 0xC0000000;

  .text ALIGN (0x1000) : AT (0x100000 + ADDR (.text) - 0xC0000000)
  {
    high_addr_entry.o(.text)
  }
  .rodata ALIGN (0x1000) : AT (0x100000 + ADDR (.rodata) - 0xC0000000)
  { 
    high_addr_entry.o(.rodata) 
  }
  .data ALIGN (0x1000) : AT (0x100000 + ADDR (.data) - 0xC0000000)
  { 
    high_addr_entry.o(.data)
  }
  .bss ALIGN (0x1000) : AT (0x100000 + ADDR (.bss) - 0xC0000000)
  { 
    high_addr_entry.o(.bss)
  } */
}
