#!/bin/bash

qemu-system-aarch64 \
  -M raspi3b \
  -kernel ./kernel8.img \
  -dtb ./bcm2835-rpi-b.dtb \
  -drive file=/home/hector/Dokument/images/Manjaro-ARM-rpi3-hos-gnome-rpi3-hos-1.00.img,format=raw,id=sd,if=none \
  -device sd-card,drive=sd \
  -append "console=ttyAMA0,115200 root=/dev/mmcblk0p2 rw rootwait rootfstype=ext4" \
  -serial stdio \
  -netdev user,id=mynet -device usb-net,netdev=mynet
