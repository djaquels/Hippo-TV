#!/bin/bash

qemu-system-aarch64 \
    -M raspi3b \
    -kernel ./kernel8.img\
    -dtb bcm2710-rpi-3-b.dtb \
    -drive if=none,file=/home/hector/Dokument/images/Manjaro-ARM-rpi3-hos-gnome-rpi3-hos-1.00.img,id=hd0,format=raw \
    -append "console=ttyAMA0 root=/dev/mmcblk0p2 rw rootwait" \
    -serial stdio \
    -netdev user,id=mynet -device usb-net,netdev=mynet
