import os
import sys
one_sec_bytes=512

filename=sys.argv[1]
bytes=os.path.getsize(filename)
padding_num=(one_sec_bytes-bytes%one_sec_bytes)%one_sec_bytes
need_secs=(bytes+one_sec_bytes-1)//one_sec_bytes
print(f"{filename} has {need_secs} sectors, need padding {padding_num} bytes")
print(f"elf start from {need_secs+1} sector")
os.system(f'''sed -i -e "s/ELF_DISK_OFFSET .*/ELF_DISK_OFFSET {need_secs+1}/g" elf.h''')
