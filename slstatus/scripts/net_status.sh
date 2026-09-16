#!/bin/sh

CONNECTION=$(nmcli -t -f TYPE,NAME connection show --active)

WIFI_NAME=$(echo "$CONNECTION" | grep 'wireless' | cut -d: -f2 | head -n 1)

if [ -n "$WIFI_NAME" ]; then
	echo "$WIFI_NAME"
	exit 0 
fi

ETH_NAME=$(echo "$CONNECTION" | grep 'ethernet' | cut -d: -f2| head -n 1)

if [ -n "$ETH_NAME" ]; then
	echo "$ETH_NAME"
	exit 0
fi

echo "NN"
