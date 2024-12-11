#!/bin/bash

# Script to check workspace status
check_workspace() {
    WORKSPACE=$(i3-msg -t get_workspaces | jq -r ".[] | select(.focused==true).name")
    echo $WORKSPACE
}

# Script to check volume
check_volume() {
    VOLUME=$(pamixer --get-volume)
    echo $VOLUME
}

# Script to check battery
check_battery() {
    BATTERY=$(acpi -b | grep -P -o "[0-9]+(?=%)")
    if [ -n "$BATTERY" ]; then
        echo $BATTERY
    else
        echo "N/A"
    fi
}

# Script to check network
check_network() {
    SIGNAL=$(nmcli -t -f SIGNAL,ACTIVE device wifi | awk -F: '{if($2=="yes")print$1}')
    if [ -n "$SIGNAL" ]; then
        echo "$SIGNAL%"
    else
        echo "offline"
    fi
}

# Script to get window title
check_window() {
    WINDOW=$(xdotool getwindowfocus getwindowname 2>/dev/null)
    if [ -n "$WINDOW" ]; then
        echo "$WINDOW"
    else
        echo "Desktop"
    fi
}

case "$1" in
    "workspace") check_workspace ;;
    "volume") check_volume ;;
    "battery") check_battery ;;
    "network") check_network ;;
    "window") check_window ;;
    *) echo "Unknown command" ;;
esac 