import os
import sys

target_file=sys.argv[1]
bytes=os.path.getsize(target_file)
padding_num=(512-bytes%512)%512
print(f"{target_file} occupies {bytes//512} secs, need padding {padding_num} bytes")
with open(target_file,'ab') as f:
    for i in range(padding_num):
        f.write(b"\x00")
