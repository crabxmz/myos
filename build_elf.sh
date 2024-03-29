GCC_OPT="-Wno-address-of-packed-member -m32 -ffreestanding   -fno-pic -nostdlib -nostdinc -fno-builtin -fno-stack-protector"
gcc ${GCC_OPT} -o log.o -c log.c
gcc ${GCC_OPT} -o x86.o -c x86.c
gcc ${GCC_OPT} -o high_addr_entry.o -c high_addr_entry.c

echo "link files now..."

ld -m elf_i386  -T elf.ld -Map elf_output.map