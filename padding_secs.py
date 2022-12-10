import os
import sys

target_file=sys.argv[1]
target_secs=int(sys.argv[2],10)
bytes=os.path.getsize(target_file)
padding_num=(target_secs*512-bytes)
with open(target_file,'ab') as f:
    for i in range(padding_num):
        f.write(b"\x00")
