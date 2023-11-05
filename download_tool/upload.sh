#!/bin/bash
export image_PATH="/home/lsh/rk3566_linux_adc_test_image/image"
export tool_PATH="/home/lsh/rk3566_linux_adc_test_image/image/tool"
export PASWORD=qpdg88

num=0
while [ ${num} -le 20 ]
do
        maskrom=$(lsusb | grep "2207:350a" | wc -l)
        num=$((${num}+1))

if [ ${maskrom} == "1" ]
then
  echo -e "\e[34mFIND [2207:350a]\e[0m"
  num2=0
  break
else
  echo -e "\e[31mFalse into MASKROM MODE~~! goto loader mode!! try ${num}/20 times\e[0m"
  echo $PASWORD | sudo -S adb reboot loader
  sleep 2
fi
done

if [ ${maskrom} == "1" ]
then
  echo -e "\e[34mFind MASKROM MODE OK\e[0m"
  work=$(echo $PASWORD | sudo -S ${tool_PATH}/rkdeveloptool td);echo ""
  if [[ "${work}" == *failed!* ]]
    then
    echo "Test Device faild~!!"
    echo "CMD ==>> sudo ./rkdeveloptool db ../MiniLoaderAll.bin"
    echo $PASWORD | sudo -S ${tool_PATH}/rkdeveloptool db ${image_PATH}/MiniLoaderAll.bin
    sleep 5
  fi
  work=$(echo $PASWORD | sudo -S ${tool_PATH}/rkdeveloptool td);echo ""
  if [[ "${work}" == *OK.* ]]
    then
    echo "Test Device ok."
    echo "Start Upload~~"
    . ${tool_PATH}/flash.sh "$*"
  fi
else
  echo -e "\e[31mMASKROM MODE Find Faild \e[0m"
fi