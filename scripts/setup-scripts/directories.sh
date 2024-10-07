#!/bin/bash 

BASE_PATH="$HOME/.local/share/logs"

declare -A log_files
log_files=(
  ["xrandr"]="${BASE_PATH}/xrandr.log"
  ["bspwm"]="${BASE_PATH}/bspwm.log"
  ["polybar"]="${BASE_PATH}/polybar.log"
)
