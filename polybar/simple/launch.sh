#!/bin/bash

killall -q polybar 

# Launch bar
polybar -c ~/.config/polybar/simple/config top &

my_laptop_external_monitor=$(xrandr --query | grep 'DP-1')
if [[ $my_laptop_external_monitor = *connected* ]]; then
    polybar top_external &
fi
