#!/bin/bash

rpi_kernel_dir="raspbian_bootpart/qemu-rpi-kernel-master"
rpi_kernel="kernel-qemu-4.14.79-stretch"
#rpi_image=2019-04-08-raspbian-stretch-lite.img
rpi_image="rpi.img"
SSH_PORT=2222

qemu-system-arm \
   -kernel $rpi_kernel_dir/$rpi_kernel \
   -dtb $rpi_kernel_dir/versatile-pb.dtb \
   -m 256 -M versatilepb -cpu arm1176 \
   -append "rw console=ttyAMA0 root=/dev/sda2 rootfstype=ext4  loglevel=8 rootwait fsck.repair=yes memtest=1" \
   -drive file=$rpi_image,format=raw \
   -net nic -net user,hostfwd=tcp::$SSH_PORT-:22 \
   -no-reboot



