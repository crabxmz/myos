import os
import re
one_sec_bytes=512
os.system("qemu-img info myos.img | grep 'virtual size' > tmp.txt")
with open("tmp.txt") as f:
    c=f.read()
    img_size=re.search('([0-9]+) bytes',c).group(1)
    kernel_sec_num=int(img_size)//one_sec_bytes-1 # first sector is mbr
    os.system(f'''sed -i -e "s/DISK_SEC_NUM db .*/DISK_SEC_NUM db {kernel_sec_num}/g" bootloader.asm''')
    print(f"kernel occupies {kernel_sec_num} secs on disk..")