# start qemu debugly
qemu-system-i386 -s -S -drive format=raw,file=myos.img -nographic

# gdb connect to qemu debugly
gdb bootloader.img
(gdb) target remote localhost:1234
Use `set architecture i8086` to dump 16 bit code. 
Then use `x/10i $cs*16+$eip` to dump the code at the PC position.

# step out of function
finish or fin in GDB, is the step-out in IDEA or Eclipse. – 

# show img size to decide sector number to read by bootloader
qemu-img info myos.img 

# list available emu devices
qemu-system-i386  -device help

# keyboard driver
https://android.googlesource.com/platform/external/qemu-pc-bios/+/80e81e424e98b6646f3c7f3420f7bad4dc308a08/bochs/bios/rombios.c

# LMA and VMA
objdump -h entry.o

# show all available ld output format
objdump -i entry.o

# read elf program header
readelf -l entry.o

# qemu cpu reset debug
`-no-reboot -d cpu_reset`

# compile for 32bit machine
gcc -m32