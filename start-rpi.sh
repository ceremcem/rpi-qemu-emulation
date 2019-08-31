#!/bin/bash

rpi_kernel_dir="raspbian_bootpart/qemu-rpi-kernel-master"
rpi_kernel="kernel-qemu-4.14.79-stretch"


qemu-system-arm \
   -kernel $rpi_kernel_dir/$rpi_kernel \
   -dtb $rpi_kernel_dir/versatile-pb.dtb \
   -m 256 -M versatilepb -cpu arm1176 \
   -append "rw console=ttyAMA0 root=/dev/sda2 rootfstype=ext4  loglevel=8 rootwait fsck.repair=yes memtest=1" \
   -drive file=2019-04-08-raspbian-stretch-lite.img,format=raw \
   -net nic -net user \
   -netdev user,id=net0,hostfwd=tcp::5022-:22 \
    -device rtl8139,netdev=net0 \
   -no-reboot

#   -device rtl8139,netdev=net0 \
#   -serial stdio \
#   -net user,hostfwd=tcp::5022-:22 \


