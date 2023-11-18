#!/bin/bash

image="update5.img"

TOOL=./
OUT=./output
RKIMAGEMAKER=${TOOL}/rkImageMaker
AFPTOOL=${TOOL}/afptool
IMAGE=${TOOL}/${image}


sudo rm -r ${OUT}
sudo mkdir -p ${OUT}

start_time=$(date +%s)
sudo ./usr/qemu-x86_64-static ${RKIMAGEMAKER} -unpack ${IMAGE} ${OUT} || pause
end_time=$(date +%s)
rkImage_time=$(( end_time - start_time ))
echo -e "\e[47;1;32m rkImage_time: $rkImage_time sec \e[0m"

start_time2=$(date +%s)
sudo ./usr/qemu-x86_64-static ./${AFPTOOL}  -unpack ${OUT}/firmware.img ${OUT} || pause
end_time2=$(date +%s)

afptool_time=$(( end_time2 - start_time2 ))
total_time=$(( end_time2 - start_time ))

echo -e "\e[47;1;32m afptool_time: $afptool_time sec \e[0m"

echo -e "\e[47;1;32m total_time: $total_time sec \e[0m"

#121.88.10.174
#scp -r -P 3014 ../unpack_test/ rock@121.88.10.174:~/
#ssh -p 3014 rock@121.88.10.174
