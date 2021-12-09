#!/bin/sh

current=$(setxkbmap -query | grep layout | awk '{print $2}')

if [ "$current" = "us" ]; then
  setxkbmap es
else 
  setxkbmap us
fi

