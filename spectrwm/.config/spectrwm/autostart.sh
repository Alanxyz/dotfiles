#!/bin/bash

setxkbmap us &
setxkbmap -option caps:escape &

xwallpaper --stretch ~/.bg.png &
# hsetroot -solid "#7C8377" &
picom -c -f --vsync --backend=glx &

redshift &
syncthing -no-browser &
