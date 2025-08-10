#!/bin/bash

process_PID="$(ps -aef | awk '/picom / {print $2}')"
PIDs=($process_PID)

if [ ${#PIDs[@]} -ge 2 ]; then
  exec killall picom
else
  exec picom --config ~/.config/picom/picom.conf
fi
