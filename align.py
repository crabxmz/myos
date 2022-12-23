import os
import sys

target_file=sys.argv[1]
bytes=os.path.getsize(target_file)
align=eval(sys.argv[2])
padding_num=(align-bytes%align)%align
print(f"{target_file} occupies {bytes//align} secs, alignment {align},  need padding {padding_num} bytes")
with open(target_file,'ab') as f:
    for i in range(padding_num):
        f.write(b"\x00")
