error</br>

main.cpp:1493:36: error: ‘%s’ directive output may be truncated writing up to 557 bytes into a region of size 5 [-Werror=format-truncation=]
 1493 |  snprintf(buffer, sizeof(buffer), "%s", chip);</br>

https://github.com/rockchip-linux/rkdeveloptool/issues/55</br>