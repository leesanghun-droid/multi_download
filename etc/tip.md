# multi_download

scp -P 3334 lsh@59.13.0.28:~/rk3566_android11/android11/rockdev/Image-rk3566_r/output/Image/*.* ./

usb memory
mkdir /tmp/usb
sudo mount -t vfat /dev/sdb1 /tmp/usb

./rkimage_unpack /tmp/usb/update_userdebug_2023.10.18.11.29.img 