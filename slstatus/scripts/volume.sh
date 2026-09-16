#!/bin/bash

vol=$(pamixer --get-volume)

# Check active sink mute state
isMuted_pactl=$(pactl list sinks | grep -A 10 'State: RUNNING' | grep 'Mute:' | awk '{print $2}')

# Check default system mute state
isMuted_pamixer=$(pamixer --get-mute)

# If either pactl says "yes" OR pamixer says "true", then it's muted
if [[ "$isMuted_pactl" == "yes" ]] || [[ "$isMuted_pamixer" == "true" ]]; then
    echo "Muted shh!!"
else
    echo "$vol%"
fi
