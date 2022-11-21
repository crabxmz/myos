nasm kernel_entry.asm -f elf -o kernel_entry.o
nasm isr_wrapper.asm -f elf -o isr_wrapper.o
gcc -m32 -ffreestanding  -o entry.o -c entry.c

gcc -m32 -ffreestanding  -o page_frame_alloc.o -c page_frame_alloc.c
gcc -m32 -ffreestanding  -o idt.o -c idt.c
gcc -m32 -ffreestanding  -o pic.o -c pic.c
gcc -m32 -ffreestanding  -o paging.o -c paging.c

echo "link files now..."


# the kernel entry must in the 1st place
# ld -m elf_i386 -e "main" -o kernel.bin -Ttext 0x1000 kernel_entry.o entry.o isr_wrapper.o  --oformat binary
ld -m elf_i386  -T myos.ld