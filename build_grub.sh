echo "enter $0"
GCC_OPT="-Wno-address-of-packed-member  -fno-pic -nostdlib -nostdinc -fno-builtin -fno-stack-protector -m32 -ffreestanding"
gcc ${GCC_OPT} -o log.o -c log.c
gcc ${GCC_OPT} -o x86.o -c x86.c
gcc ${GCC_OPT} -o elf.o -c elf.c
gcc ${GCC_OPT} -o grub.o -c grub.c
gcc ${GCC_OPT} -o disk.o -c disk.c
gcc ${GCC_OPT} -o string.o -c string.c

echo "link files now..."

ld -m elf_i386 -T grub.ld -Map grub_output.map
echo "leave $0"
