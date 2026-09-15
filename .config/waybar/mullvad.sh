#!/bin/bash

# Grab ONLY the very first line to check the status
status=$(mullvad status | head -n 1)

if [ "$status" = "Connected" ]; then
    # Search for the "Relay:" line and grab the second column
    server=$(mullvad status | grep "Relay:" | awk '{print $2}')
    
    # Search for "Visible location:", split it, and grab the text before the period (to cut off the IPv4 part)
    # The 'xargs' command at the end just strips away any extra spaces
    location=$(mullvad status | grep "Visible location:" | awk -F'location:' '{print $2}' | cut -d'.' -f1 | xargs)
    
    # Print the safe JSON
    echo "{\"text\": \" $location\", \"class\": \"connected\", \"tooltip\": \"Server: $server\"}"

else
    # Print the safe disconnected JSON
    echo "{\"text\": \" Disconnected\", \"class\": \"disconnected\", \"tooltip\": \"Warning: Traffic is exposed\"}"
fi
