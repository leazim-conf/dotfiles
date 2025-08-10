#!/bin/bash

ETHERNET_CONNECTED="󰈀"
WIFI_CONNECTED="󰤨"
DISCONNECTED="󰌙"

NBOARD_UP="$(ip link | awk '/state UP/ {print $2}')"
if [[ $NBOARD_UP =~ ^[e] ]]; then
  echo $ETHERNET_CONNECTED
elif [[ $NBOARD_UP =~ ^[w] ]]; then
  echo $WIFI_CONNECTED
else
  echo $DISCONNECTED
fi
