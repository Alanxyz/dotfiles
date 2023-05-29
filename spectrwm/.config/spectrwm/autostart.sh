#!/bin/bash

setxkbmap us &
setxkbmap -option caps:escape &

# xwallpaper --stretch ~/.bg.png &
hsetroot -solid "#303030" &
picom &

redshift &
syncthing -no-browser &
