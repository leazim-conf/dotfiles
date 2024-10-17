#!/bin/bash

killall -q polybar 

# Launch bar
polybar -c ~/.config/polybar/EP/config top &

my_laptop_external_monitor=$(xrandr --query | grep 'HDMI-1')
if [[ $my_laptop_external_monitor = *connected* ]]; then
    polybar top &
fi
