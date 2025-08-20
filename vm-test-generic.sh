#!/bin/bash
qemu-system-aarch64 \
  -M virt \
  -cpu cortex-a72 \
  -m 2048 \
  -smp 4 \
  -drive if=none,file=/home/hector/Dokument/images/Manjaro-ARM-rpi3-hos-gnome-rpi3-hos-1.00.img,id=hd0,format=raw \
  -device virtio-blk-device,drive=hd0 \
  -device virtio-net-device,netdev=net0 \
  -netdev user,id=net0,hostfwd=tcp::5555-:22 \
  -serial mon:stdio \
  -kernel ./kernel8.img\
  -initrd ./initramfs8\
  -append "root=/dev/vda2 rw console=ttyAMA0"
