#!/bin/bash
SIGNAL=$(nmcli -t -f SIGNAL,ACTIVE device wifi | awk -F: '{if($2=="yes")print$1}')
if [ -n "$SIGNAL" ]; then
    echo "$SIGNAL%"
else
    echo "offline"
fi 