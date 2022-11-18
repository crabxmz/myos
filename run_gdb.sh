qemu-system-i386 -m 1G  -s -S -drive format=raw,file=myos.img -nographic
# qemu-system-i386 -s -S -usb  -device usb-kbd  -drive format=raw,file=myos.img  -nographic