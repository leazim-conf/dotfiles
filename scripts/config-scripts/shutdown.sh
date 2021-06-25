#!/bin/bash

menus=(" Shutdown" " Restart" " Logout")

CHOICE=$(printf '%s\n' "${menus[@]}" | rofi -dmenu -config $HOME/.config/rofi/add-rofi/powermenu.rasi) 


if [[ $CHOICE = " Shutdown" ]]; then   
    exec shutdown -h now
elif [[ $CHOICE = " Restart" ]]; then
    exec shutdown -r now
elif [[ $CHOICE = " Logout" ]]; then
    exec killall openbox
else
    echo ""
fi
