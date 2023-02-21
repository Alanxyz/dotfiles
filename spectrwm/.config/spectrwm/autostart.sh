#!/bin/bash

setxkbmap us &
setxkbmap -option caps:escape &

xwallpaper --stretch ~/.bg.png &
# hsetroot -solid "#7C8377" &
picom &

redshift &
syncthing -no-browser &
