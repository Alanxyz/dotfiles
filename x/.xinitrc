setxkbmap -layout us -variant altgr-intl -option caps:escape
xset r rate 200 45
xset s off -dpms
hsetroot -solid '#c5b3a7'
#xwallpaper --zoom ~/.wall.png
xrdb ~/.Xresources

sleep 1 && picom &

dunst &
urxvtd -q -f -o &

syncthing --no-browser &

exec spectrwm
