#! /usr/bin/env bash

IFS=':'

get_selection() {
    fzf
}

if selection=$( get_selection ); then
  xdg-open "$selection"
fi

