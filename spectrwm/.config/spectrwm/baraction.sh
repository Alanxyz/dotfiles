#!/bin/bash

vol() {
    VOLONOFF="$(amixer -D pulse get Master | grep Left: | sed 's/[][]//g' | awk '{print $6}')"
    volu="$(amixer -D pulse get Master | awk -F'[][]' 'END{ print $2 }')"

    MuteIcon="!V"
    VolIcon="V"

    if [ "$VOLONOFF" = "on" ]; then
        echo "$volu"
    else
        echo "$MuteIcon Mute"
    fi

}

temp() {
    temp="$(sensors | awk '/Core 0/ {print $3+0}')"  
    echo -e "$temp"℃""
}

bat() {
    batstat="$(cat /sys/class/power_supply/BAT0/status)"
    battery="$(cat /sys/class/power_supply/BAT0/capacity)"
    if [ $batstat = 'Unknown' ]; then
        batstat="B"
    elif [[ $battery -ge 5 ]] && [[ $battery -le 19 ]]; then
        batstat="B"
    elif [[ $battery -ge 20 ]] && [[ $battery -le 39 ]]; then
        batstat="B"
    elif [[ $battery -ge 40 ]] && [[ $battery -le 59 ]]; then
        batstat="B"
    elif [[ $battery -ge 60 ]] && [[ $battery -le 79 ]]; then
        batstat="B"
    elif [[ $battery -ge 80 ]] && [[ $battery -le 95 ]]; then
        batstat="B"
    elif [[ $battery -ge 96 ]] && [[ $battery -le 100 ]]; then
        batstat="B"
    fi

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
