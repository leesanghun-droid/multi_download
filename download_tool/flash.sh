#!/bin/bash

echo "run flash.sh"
echo "upload option ==>> " $* #erase uboot boot Loader misc oem parameter recovery rootfs userdata
echo "image_PATH    : " $image_PATH
echo "tool_PATH     : " $tool_PATH
RKTOOL=$tool_PATH/rkdeveloptool

if [[ "$*" == *erase* ]];
then   echo $PASWORD | sudo -S  $RKTOOL ef            ;fi
echo $PASWORD | sudo -S  $RKTOOL rd
sleep 10
echo $PASWORD | sudo -S  $RKTOOL db $image_PATH/MiniLoaderAll.bin
sleep 10

if [[ "$*" == *parameter* ]]
then
echo $PASWORD | sudo -S  $RKTOOL gpt $image_PATH/parameter.txt 
echo $PASWORD | sudo -S  $RKTOOL prm $image_PATH/parameter.txt 
echo $PASWORD | sudo -S  $RKTOOL ppt
fi

echo "u-boot upload..."
if [[ "$*" == *uboot* ]];then   echo $PASWORD | sudo -S  $RKTOOL wlx uboot $image_PATH/uboot.img            ;fi
echo "misc upload..."
if [[ "$*" == *misc* ]];then   echo $PASWORD | sudo -S  $RKTOOL wlx misc $image_PATH/misc.img              ;fi
echo "boot upload..."
if [[ "$*" == *boot* ]];then   echo $PASWORD | sudo -S  $RKTOOL wlx boot $image_PATH/boot.img              ;fi
echo "recovery upload..."
if [[ "$*" == *recovery* ]];then   echo $PASWORD | sudo -S  $RKTOOL wlx recovery $image_PATH/recovery.img      ;fi
echo "rootfs upload..."
if [[ "$*" == *rootfs* ]];then   echo $PASWORD | sudo -S  $RKTOOL wlx rootfs $image_PATH/rootfs.img          ;fi
echo "oem upload..."
if [[ "$*" == *oem* ]];then   echo $PASWORD | sudo -S  $RKTOOL wlx oem $image_PATH/oem.img                ;fi
echo "userdata upload..."
if [[ "$*" == *userdata* ]];then   echo $PASWORD | sudo -S  $RKTOOL wlx userdata $image_PATH/userdata.img      ;fi
echo "Loader upload..."
if [[ "$*" == *Loader* ]];then   echo $PASWORD | sudo -S  $RKTOOL ul $image_PATH/MiniLoaderAll.bin           ;fi

echo $PASWORD | sudo -S  $RKTOOL rd




