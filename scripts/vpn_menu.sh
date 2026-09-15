#!/bin/bash

# 1. Get current country code (so we can show it in the 'New Server' option)
current_country=$(mullvad status | awk '/Relay:/ {print substr($2,1,2)}')

# 2. Get the full list of countries
country_list=$(mullvad relay list | grep -E "^[a-zA-Z]" | sed 's/^/🌐 /')

# 3. Build the menu options
# We add "NEW SERVER" and "DISCONNECT" to the top
if [ -z "$current_country" ]; then
    header="❌ DISCONNECT\n"
else
    header="🎲 NEW SERVER ($current_country)\n❌ DISCONNECT\n"
fi

menu_options="${header}${country_list}"

# 4. Launch Wofi
choice=$(echo -e "$menu_options" | wofi --dmenu --prompt "Mullvad: Select Action" --width 450 --height 500)

if [ -z "$choice" ]; then exit 0; fi

# 5. Logical Branching
if [[ "$choice" == *"NEW SERVER"* ]]; then
    # Keeps you in the same country but switches the specific WG server
    mullvad reconnect
    notify-send "Mullvad" "Hopping to a new server in $current_country..." -i network-vpn
    exit 0
fi

if [[ "$choice" == *"DISCONNECT"* ]]; then
    mullvad disconnect
    notify-send "Mullvad" "VPN Disconnected" -i network-vpn
    exit 0
fi

# 6. Extract the country code and connect
code=$(echo "$choice" | grep -oP '\(\K[^\)]+')
mullvad relay set location "$code"
mullvad connect
notify-send "Mullvad" "Connecting to $choice..." -i network-vpn
