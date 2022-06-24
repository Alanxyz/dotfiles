#!/bin/bash

setxkbmap us &
setxkbmap -option caps:escape &
# xwallpaper --stretch ~/.bg.png &
redshift -l 21.0161:-101.8671 &
# picom -c -f --vsync --backend=glx &
hsetroot -solid "#202020" &
syncthing -no-browser &
