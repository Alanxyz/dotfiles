#!/bin/sh

current=$(setxkbmap -query | grep layout | awk '{print $2}')

if [ "$current" = "us" ]; then
  setxkbmap latam
else 
  setxkbmap us
fi

