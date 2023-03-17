echo "enter $0"
GCC_OPT="-Wno-address-of-packed-member  -fno-pic -nostdlib -nostdinc -fno-builtin -fno-stack-protector -m32 -ffreestanding"
nasm enter_ring3.asm -f elf -o enter_ring3.o
nasm isr_wrapper.asm -f elf -o isr_wrapper.o
gcc ${GCC_OPT} -o entry.o -c entry.c
gcc ${GCC_OPT} -o kpage_map.o -c kpage_map.c
gcc ${GCC_OPT} -o idt.o -c idt.c
gcc ${GCC_OPT} -o log.o -c log.c
gcc ${GCC_OPT} -o pic.o -c pic.c
gcc ${GCC_OPT} -o x86.o -c x86.c
gcc ${GCC_OPT} -o panic.o -c panic.c
gcc ${GCC_OPT} -o tss.o -c tss.c
gcc ${GCC_OPT} -o elf.o -c elf.c
gcc ${GCC_OPT} -o bitmap_allocator.o -c bitmap_allocator.c
gcc ${GCC_OPT} -o disk.o -c disk.c
gcc ${GCC_OPT} -o gdt.o -c gdt.c
gcc ${GCC_OPT} -o process.o -c process.c
gcc ${GCC_OPT} -o string.o -c string.c
gcc ${GCC_OPT} -o block.o -c block.c
gcc ${GCC_OPT} -o ext2.o -c ext2.c
gcc ${GCC_OPT} -o list.o -c list.c
gcc ${GCC_OPT} -o mm.o -c mm.c

echo "link files now..."

ld -m elf_i386  -T myos.ld -Map myos.map
echo "leave $0"
