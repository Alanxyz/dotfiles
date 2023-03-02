#!/bin/sh
   # A fuzzy file-finder and opener based on dmenu
   # Requires: dmenu, xdg-utils
find -L $HOME/Documents $HOME/Sync $HOME/Downloads $HOME/Pictures | sed 's/ /\\ /g' | sort -f | dmenu -i -l 20 | xargs xdg-open
