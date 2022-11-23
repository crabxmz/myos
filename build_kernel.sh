GCC_OPT="-Wno-address-of-packed-member  -fno-pic"
nasm kernel_entry.asm -f elf -o kernel_entry.o
nasm isr_wrapper.asm -f elf -o isr_wrapper.o
gcc ${GCC_OPT} -m32 -ffreestanding  -o entry.o -c entry.c
gcc ${GCC_OPT} -m32 -ffreestanding  -o page_frame_alloc.o -c page_frame_alloc.c
gcc ${GCC_OPT} -m32 -ffreestanding  -o idt.o -c idt.c
gcc ${GCC_OPT} -m32 -ffreestanding  -o log.o -c log.c
gcc ${GCC_OPT} -m32 -ffreestanding  -o pic.o -c pic.c
gcc ${GCC_OPT} -m32 -ffreestanding  -o x86.o -c x86.c
gcc ${GCC_OPT} -m32 -ffreestanding  -o paging.o -c paging.c
gcc ${GCC_OPT} -m32 -ffreestanding  -o high_addr_entry.o -c high_addr_entry.c

echo "link files now..."

ld -m elf_i386  -T myos.ld -Map output.map 