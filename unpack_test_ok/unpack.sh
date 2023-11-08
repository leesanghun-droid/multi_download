#!/bin/bash

image="update5.img"

sudo rm -r ./output
sudo mkdir -p output
sudo /usr/bin/qemu-x86_64-static ./rkImageMaker -unpack ${image} output || pause
sudo /usr/bin/qemu-x86_64-static ./afptool -unpack output/firmware.img output || pause
sudo rm -r ./output
#121.88.10.174