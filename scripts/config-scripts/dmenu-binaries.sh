#!/usr/bin/env bash


path=$(find /usr/bin/ -executable | dmenu -c -l 15 -fn "Liberation Mono-10")
exec $path

exit 0


