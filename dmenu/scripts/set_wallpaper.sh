#!/bin/bash

# --- Configuration ---
setbg_dir="$HOME/Wallpapers"

# --- Core Wallpaper Function ---
setbg() {
    case "$XDG_SESSION_TYPE" in
    'x11') feh --bg-fill "$@" ;;
    *) feh --bg-fill "$@" ;;
    esac
}

# --- Background Timer Daemon ---
if [ "$1" == "--loop" ]; then
    sleep 300 # Wait 5 minutes
    while true; do
        # Randomly select 2 different wallpapers for your 2 monitors
        mapfile -t walls < <(find "${setbg_dir}" -type f | shuf -n 2)
        setbg "${walls[@]}"
        sleep 300
    done
    exit 0
fi

# Function to safely restart the 5-minute timer
start_auto_loop() {
    pkill -f "${BASH_SOURCE[0]} --loop"
    "${BASH_SOURCE[0]}" --loop &
}

# --- Main Interactive Menu ---
main() {
    choice="$(printf "Set (Same)\nSet (Different)\nRandom\nExit" | ${MENU} "Choose:")"
    case "$choice" in
    "Set (Same)")
        wall="$(sxiv -t -o "${setbg_dir}" | head -n 1)"
        if [ -n "$wall" ]; then
            setbg "$wall"
            start_auto_loop
            notify-send "Wallpaper Set" "Same image on both screens."
        fi
        ;;
    "Set (Different)")
        notify-send "Screen 1" "Select wallpaper for Primary Monitor"
        wall1="$(sxiv -t -o "${setbg_dir}" | head -n 1)"
        
        # If the first image was picked, ask for the second one
        if [ -n "$wall1" ]; then
            notify-send "Screen 2" "Select wallpaper for Laptop Monitor"
            wall2="$(sxiv -t -o "${setbg_dir}" | head -n 1)"
            
            # If the second image was picked, set both!
            if [ -n "$wall2" ]; then
                setbg "$wall1" "$wall2"
                start_auto_loop
                notify-send "Wallpapers Set" "Different images applied to each screen."
            fi
        fi
        ;;
    "Random")
        mapfile -t walls < <(find "${setbg_dir}" -type f | shuf -n 2)
        setbg "${walls[@]}"
        start_auto_loop
        notify-send "Random Wallpaper Set" "It will automatically change in 5 minutes."
        ;;
    "Exit") exit 0 ;;
    *) exit 1 ;;
    esac
}

MENU="dmenu -i -p"

[[ "${BASH_SOURCE[0]}" == "${0}" ]] && [[ "$1" != "--loop" ]] && main
