echo "enter $0"
GCC_OPT="-Wno-address-of-packed-member  -fno-pic -nostdlib -nostdinc -fno-builtin -fno-stack-protector"
nasm enter_ring3.asm -f elf -o enter_ring3.o
nasm isr_wrapper.asm -f elf -o isr_wrapper.o
gcc ${GCC_OPT} -m32 -ffreestanding  -o entry.o -c entry.c
gcc ${GCC_OPT} -m32 -ffreestanding  -o kpage_map.o -c kpage_map.c
gcc ${GCC_OPT} -m32 -ffreestanding  -o idt.o -c idt.c
gcc ${GCC_OPT} -m32 -ffreestanding  -o log.o -c log.c
gcc ${GCC_OPT} -m32 -ffreestanding  -o pic.o -c pic.c
gcc ${GCC_OPT} -m32 -ffreestanding  -o x86.o -c x86.c
gcc ${GCC_OPT} -m32 -ffreestanding  -o panic.o -c panic.c
gcc ${GCC_OPT} -m32 -ffreestanding  -o tss.o -c tss.c
gcc ${GCC_OPT} -m32 -ffreestanding  -o elf.o -c elf.c
gcc ${GCC_OPT} -m32 -ffreestanding  -o bitmap_allocator.o -c bitmap_allocator.c
gcc ${GCC_OPT} -m32 -ffreestanding  -o disk.o -c disk.c
gcc ${GCC_OPT} -m32 -ffreestanding  -o gdt.o -c gdt.c
gcc ${GCC_OPT} -m32 -ffreestanding  -o process.o -c process.c

echo "link files now..."

ld -m elf_i386  -T myos.ld -Map output.map
echo "leave $0"
