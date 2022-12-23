./build_mbr.sh #bootloader.bin
./build_grub.sh #grub.bin
./build_kernel.sh #kernel.elf

python3 get_sector_num.py grub.bin
python3 align.py grub.bin 512

cat bootloader.bin grub.bin kernel.elf > myos.img.sys
python3 align.py myos.img.sys 1024
python3 calc_disk_size.py  myos.img.sys
# python3 padding_secs.py myos.img.sys 49
cat myos.img.sys test.disk > myos.img
# python3 align512.py myos.img