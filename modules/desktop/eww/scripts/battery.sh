#!/bin/bash
BATTERY=$(acpi -b | grep -P -o "[0-9]+(?=%)")
if [ -n "$BATTERY" ]; then
    echo $BATTERY
else
    echo "N/A"
fi 