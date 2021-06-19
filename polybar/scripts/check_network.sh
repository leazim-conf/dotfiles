#!/bin/bash

ethernet_connection="﴿";
wifi_connection="";
disconnect=""; 
while true; do
	NBOARD_UP="$(ip link | awk '/state UP/ {print $2}')"
	if  [[ $NBOARD_UP =~ ^[e] ]]; then 
		echo $ethernet_connection ; sleep 0.5
	elif [[ $NBOARD_UP =~ ^[w] ]]; then
		echo $wifi_connection ; sleep 0.5
	else
		echo $disconnect ; sleep 0.5
	fi
done 
