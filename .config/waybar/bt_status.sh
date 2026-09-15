#!/bin/bash
# Use 'timeout' to prevent the script from hanging if bluetoothctl is busy
if timeout 0.5s bluetoothctl show | grep -q "Powered: yes"; then
    echo "{\"text\": \" ON\", \"class\": \"on\"}"
else
    echo "{\"text\": \"󰂲 OFF\", \"class\": \"off\"}"
fi
