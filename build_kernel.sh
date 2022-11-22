nasm kernel_entry.asm -f elf -o kernel_entry.o
nasm isr_wrapper.asm -f elf -o isr_wrapper.o
gcc -m32 -ffreestanding  -o entry.o -c entry.c

gcc -m32 -ffreestanding  -o page_frame_alloc.o -c page_frame_alloc.c
gcc -m32 -ffreestanding  -o idt.o -c idt.c
gcc -m32 -ffreestanding  -o pic.o -c pic.c
gcc -m32 -ffreestanding  -o paging.o -c paging.c
gcc -m32 -ffreestanding  -o high_addr_entry.o -c high_addr_entry.c

echo "link files now..."

ld -m elf_i386  -T myos.ld -Map output.map 