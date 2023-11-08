#!/bin/bash

image="update5.img"


sudo rm -r ./output
sudo mkdir -p output

start_time=$(date +%s)
sudo /usr/bin/qemu-x86_64-static ./rkImageMaker -unpack ${image} output || pause
end_time=$(date +%s)
rkImage_time=$(( end_time - start_time ))
echo -e "\e[47;1;32m rkImage_time: $rkImage_time sec \e[0m"

start_time2=$(date +%s)
sudo /usr/bin/qemu-x86_64-static ./afptool -unpack output/firmware.img output || pause
end_time2=$(date +%s)

afptool_time=$(( end_time2 - start_time2 ))
total_time=$(( end_time2 - start_time ))

echo -e "\e[47;1;32m afptool_time: $afptool_time sec \e[0m"

echo -e "\e[47;1;32m total_time: $total_time sec \e[0m"

#121.88.10.174