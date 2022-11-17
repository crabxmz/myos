./build_mbr.sh
./build_kernel.sh
# cat bootloader.img kernel.bin > myos.img
cat bootloader.img kernel.bin > myos.img

python3 calc_disk_size.py