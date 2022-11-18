nasm kernel_entry.asm -f elf -o kernel_entry.o
nasm isr_wrapper.asm -f elf -o isr_wrapper.o
gcc -m32 -ffreestanding  -o entry.o -c entry.c

gcc -m32 -ffreestanding  -o mmu.o -c mmu.c

echo "link files now..."


# the kernel entry must in the 1st place
# ld -m elf_i386 -e "main" -o kernel.bin -Ttext 0x1000 kernel_entry.o entry.o isr_wrapper.o  --oformat binary
ld -m elf_i386  -T myos.ld