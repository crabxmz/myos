ENTRY(main)
/* emulation(elf_i386) */
INPUT(
      kernel_entry.o
      entry.o
      isr_wrapper.o
      idt.o
      page_frame_alloc.o
      log.o
      pic.o
      paging.o
      /* high_addr_entry.o */
     )

OUTPUT(kernel.bin)
OUTPUT_FORMAT(binary)

 /* the code should be relocated to 3GB + 1MB */

SECTIONS
{
  . = 0x1000;

  text_start = .;

  .boot.text :
  {
    kernel_entry.o(.text) /* the kernel entry must in the 1st place */
    idt.o(.text)
    isr_wrapper.o(.text)
    pic.o(.text)
    entry.o(.text)
    x86.o(.text)
    log.o(.text)
    paging.o(.text)
    page_frame_alloc.o(.text)
  }

  rodata_start = .;

  .boot.rodata :
  { 
    kernel_entry.o(.rodata)
    idt.o(.rodata)
    isr_wrapper.o(.rodata)
    pic.o(.rodata)
    entry.o(.rodata)
    log.o(.rodata)
    x86.o(.rodata)
    paging.o(.rodata)
    page_frame_alloc.o(.rodata)
    /* *(.rodata) */
  }

  data_start = .;

  .boot.data :
  { 
    /* *(.data) */
    kernel_entry.o(.data)
    idt.o(.data)
    isr_wrapper.o(.data)
    pic.o(.data)
    entry.o(.data)
    x86.o(.data)
    paging.o(.data)
    page_frame_alloc.o(.data)
    log.o(.data)
  }

  bss_start = .;

  .boot.bss :
  {
    kernel_entry.o(.bss)
    idt.o(.bss)
    page_frame_alloc.o(.bss)
    isr_wrapper.o(.bss)
    pic.o(.bss)
    entry.o(.bss) 
    x86.o(.bss)
    log.o(.bss)
    paging.o(.bss)

    kernel_entry.o(COMMON)
    idt.o(COMMON)
    page_frame_alloc.o(COMMON)
    isr_wrapper.o(COMMON)
    pic.o(COMMON)
    entry.o(COMMON)
    x86.o(COMMON)
    paging.o(COMMON)
    log.o(COMMON)
    /* *(.bss)
    *(COMMON) */
  }

  kernel_end = .;

  . += 0xC0000000;
  . = ALIGN (0x1000);

  high_addr_start = .;
  .text ALIGN (0x1000) : AT (ADDR (.text) - 0xC0000000)
  {
    high_addr_entry.o(.text)
  }

  .rodata ALIGN (0x1000) : AT (ADDR (.rodata) - 0xC0000000)
  { 
    high_addr_entry.o(.rodata) 
  }

  .data ALIGN (0x1000) : AT (ADDR (.data) - 0xC0000000)
  { 
    high_addr_entry.o(.data)
  }

  .bss ALIGN (0x1000) : AT (ADDR (.bss) - 0xC0000000)
  { 
    high_addr_entry.o(.bss)
  }

  /DISCARD/ :
  {
    *(.comment)
  }
}
