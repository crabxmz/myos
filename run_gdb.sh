qemu-system-i386 -m 1G  -s -S -drive format=raw,file=myos.img  -nographic -no-reboot -d cpu_reset
# qemu-system-i386 -s -S -usb  -device usb-kbd  -drive format=raw,file=myos.img  -nographic