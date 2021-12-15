#!/bin/bash

killall -q polybar 

#wait the process shut down
#while pgrep -u $UID -x > /dev/null; do sleep 1; done

# Launch bar
polybar -c ~/.config/polybar/colored-basic/config top-bar &

my_laptop_external_monitor=$(xrandr --query | grep 'DP-1')
if [[ $my_laptop_external_monitor = *connected* ]]; then
    polybar -c ~/.config/polybar/colored-basic/config top_external &
fi
