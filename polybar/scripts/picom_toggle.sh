#!/bin/bash

process_PID="$(ps -aef | awk '/picom --experimental-backends/ {print $2}')"
PIDs=($process_PID)

if [ ${#PIDs[@]} -ge 2 ]; then
	exec killall picom && killall compton
else
	exec picom --experimental-backends -b
fi
