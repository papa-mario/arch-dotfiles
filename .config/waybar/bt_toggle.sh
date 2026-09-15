#!/bin/bash
# Check if the hardware is currently blocked
if rfkill list bluetooth | grep -q "Soft blocked: yes"; then
    # If blocked, unblock it and turn on the software power
    rfkill unblock bluetooth
    bluetoothctl power on
else
    # If unblocked, physically block the radio
    rfkill block bluetooth
fi
