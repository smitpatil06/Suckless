#!/bin/bash

ac_online=$(cat /sys/class/power_supply/ADP0/online)
bat_status=$(cat /sys/class/power_supply/BAT0/status)

if [[ "$ac_online" == "1" ]]; then
    if [[ "$bat_status" == "Charging" ]]; then
        echo "Charging"
    else
        # This catches "Full" or "Not charging" (Conservation mode)
        echo "AC" 
    fi
else
    echo "Dis"
fi
