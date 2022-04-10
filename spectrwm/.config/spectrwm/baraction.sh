#!/bin/bash

vol() {
    VOLONOFF="$(amixer -D pulse get Master | grep Left: | sed 's/[][]//g' | awk '{print $6}')"
    volu="$(amixer -D pulse get Master | awk -F'[][]' 'END{ print $2 }')"

    if [ "$VOLONOFF" = "on" ]; then
        echo "$volu"
    else
        echo "Mute"
    fi

}

temp() {
    temp="$(sensors | awk '/Core 0/ {print $3+0}')"  
    echo -e "$temp"℃""
}

bat() {
    batstat="$(cat /sys/class/power_supply/BAT0/status)"
    battery="$(cat /sys/class/power_supply/BAT0/capacity)"

    echo "$battery"%""
}

wifi() {
    echo $(nmcli -t -f name connection show --active)
}

clock() {
    timedate=$(date +'%I:%M')
    echo "$timedate" 
}

watter() {
    curl wttr.in/?format=4
}

todo() {
    ~/.local/bin/nt n
}

SLEEP_SEC=60
while :; do     
    echo  "$(todo) | $(wifi) | $(vol) | $(temp) | $(bat) "
    sleep $SLEEP_SEC
done
