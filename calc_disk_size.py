import os
import re
import sys
one_sec_bytes=512
filename=sys.argv[1]
os.system(f"qemu-img info {filename} | grep 'virtual size' > tmp.txt")
with open("tmp.txt") as f:
    c=f.read()
    img_size=re.search('([0-9]+) bytes',c).group(1)
    tot_sec_num=int(img_size)//one_sec_bytes # first sector is mbr
    os.system(f'''sed -i -e "s/DISK_SEC_NUM db .*/DISK_SEC_NUM db {tot_sec_num-1}/g" bootloader.asm''')
    print(f"kernel occupies {tot_sec_num-1} secs on disk..")
    print(f"all the img occupies {tot_sec_num} secs on disk..")