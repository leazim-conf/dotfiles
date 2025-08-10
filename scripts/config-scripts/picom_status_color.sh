#!/bin/bash

#COLOR_BLUE="%{F#2299EE}"

ICON_ACTIVE="󰔡"
ICON_DEACTIVE="󰔢"

COLOR_ACTIVE="%{F#9A9C9D}"
COLOR_DEACTIVE="%{F#D6D7D8}"
COLOR_RESET="%{F-}"

ICON="󰘒"

if pgrep -x "picom" >/dev/null; then
  echo "${COLOR_ACTIVE}${ICON}${COLOR_RESET}"
else
  echo "${COLOR_DEACTIVE}${ICON}${COLOR_RESET}"
fi
