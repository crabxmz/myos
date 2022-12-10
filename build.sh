./build_mbr.sh #bootloader.bin
./build_grub.sh #grub.bin
./build_kernel.sh #kernel.elf

python3 get_sector_num.py grub.bin
python3 align512.py grub.bin

cat bootloader.bin grub.bin kernel.elf > myos.img.1
python3 align512.py myos.img.1

# python3 padding_secs.py myos.img.1 49
cat myos.img.1 test/a.elf > myos.img
# python3 align512.py myos.img

python3 calc_disk_size.py myos.img