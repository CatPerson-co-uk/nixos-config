#!/bin/bash
WINDOW=$(xdotool getwindowfocus getwindowname 2>/dev/null)
if [ -n "$WINDOW" ]; then
    echo "$WINDOW"
else
    echo "Desktop"
fi 