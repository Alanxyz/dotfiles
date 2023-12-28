setxkbmap -layout us -variant altgr-intl -option caps:escape
xset r rate 200 45
xset s off -dpms
xsetroot -solid \#c5b3a7 -cursor_name left_ptr
xwallpaper --stretch ~/.wall.png
xbacklight -set 10
xrdb ~/.Xresources

sleep 1 && picom &

dunst &
urxvtd -q -f -o &

polybar -r &

exec spectrwm
