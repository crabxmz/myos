qemu-system-i386 -m 1G -usb -drive format=raw,file=myos.img -nographic -no-reboot

# run and debug interrupt info
# qemu-system-i386 -m 1G  -usb  -drive format=raw,file=myos.img  -nographic -no-reboot -d int

# run and debug interrupt info
# qemu-system-i386 -m 1G  -usb  -drive format=raw,file=myos.img  -nographic -no-reboot -d cpu_reset

# run with monitor for hardware info
# qemu-system-i386  -m 1G  -usb  -drive format=raw,file=myos.img  -nographic -no-reboot -d cpu_reset -monitor telnet:localhost:1234,server,nowait

# all output goto error.log
# qemu-system-i386 -m 1G  -usb  -drive format=raw,file=myos.img  -nographic -d int -d cpu_reset 1>error.log 2>&1

# qemu-system-i386 -m 1G  -usb  -drive format=raw,file=myos.img  -drive format=raw,file=disk2.img  -nographic -d cpu_reset
# qemu-system-i386 -m 1G  -usb  -drive format=raw,file=myos.img  -nographic -d int -d cpu_reset
# qemu-system-i386  -serial stdio  -drive format=raw,file=myos.img  -nographic
# qemu-system-i386  -drive format=raw,file=myos.img  -nographic
# qemu-system-i386 -usb  -device usb-kbd  -drive format=raw,file=myos.img  -nographic -D /tmp/qemu.log -d out_asm,in_asm,op,op_opt,int,exec,cpu,pcall,cpu_reset,ioport,unimp,guest_errors
