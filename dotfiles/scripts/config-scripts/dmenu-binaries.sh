#!/usr/bin/env bash


path=$(find /usr/bin/ -executable | dmenu -c -l 15 -fn "Monospace-11")
exec $path

exit 0


