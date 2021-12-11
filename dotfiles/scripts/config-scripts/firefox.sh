#!/bin/bash

all_windows_ID="$(wmctrl -l | awk '/Firefox/ {print $1}')"
IDs=($all_windows_ID)

if [[ ${#IDs[@]} = 0 ]]; then
    exec firefox &
else	
    for ((i=0;i<=${#IDs[@]}-1;i++))
    do
        nm_windows[$i]="$(xdotool getwindowname ${IDs[$i]})"    
    done

    CHOICE=$(printf '%s\n' "${nm_windows[@]}" | rofi -dmenu -config $HOME/.config/rofi/add-rofi/browser_windows.rasi) 

    for ((i=0;i<=${#IDs[@]}-1;i++))
    do
        if [[ $CHOICE = ${nm_windows[$i]} ]];then 
            exec wmctrl -ia ${IDs[$i]}
        fi
    done
fi
