#!/bin/bash

setxkbmap us &
setxkbmap -option caps:escape &

xwallpaper --stretch ~/.bg.png &
# hsetroot -solid "#202020" &
# picom -c -f --vsync --backend=glx &

redshift &
syncthing -no-browser &
