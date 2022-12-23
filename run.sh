# qemu-system-i386 -m 1G  -usb  -drive format=raw,file=myos.img  -nographic -no-reboot
# qemu-system-i386 -m 1G  -usb  -drive format=raw,file=myos.img  -nographic -d cpu_reset
# qemu-system-i386 -m 1G  -usb  -drive format=raw,file=myos.img  -drive format=raw,file=disk2.img  -nographic -d cpu_reset
qemu-system-i386 -m 1G  -usb  -drive format=raw,file=myos.img  -nographic -d int -d cpu_reset
# qemu-system-i386  -serial stdio  -drive format=raw,file=myos.img  -nographic
# qemu-system-i386  -drive format=raw,file=myos.img  -nographic 
# qemu-system-i386 -usb  -device usb-kbd  -drive format=raw,file=myos.img  -nographic -D /tmp/qemu.log -d out_asm,in_asm,op,op_opt,int,exec,cpu,pcall,cpu_reset,ioport,unimp,guest_errors 