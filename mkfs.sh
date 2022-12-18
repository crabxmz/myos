cd /tmp
dd if=/dev/zero of=test_disk bs=512 count=40960 # 40960 * 512 = 20M
mkfs -t ext2 test_disk
cd /mnt
sudo mkdir tmp_point
sudo mount -o loop /tmp/test_disk /mnt/tmp_point
cd /mnt/tmp_point
sudo cp ~/Desktop/myos3/test/a.elf .
sudo mkdir test_dir
cd test_dir
sudo touch test_file.txt
cd /mnt
sudo umount tmp_point/
sudo rm -d tmp_point