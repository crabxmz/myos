./build_mbr.sh
./build_grub.sh #grub.bin
./build_elf.sh #load_test.o

python3 get_sector_num.py grub.bin
python3 align512.py grub.bin

cat bootloader.bin grub.bin load_test.o > myos.img
python3 calc_disk_size.py myos.img
