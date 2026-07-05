#!/bin/bash
# A custom, more reliable battery script for BAT1

# The path to your battery information
BATTERY_PATH="/sys/class/power_supply/BAT0"

# Button
if [ "$BLOCK_BUTTON" == "1" ]; then
    gnome-control-center power &
fi

# Check if the battery directory exists
if [ ! -d "$BATTERY_PATH" ]; then
    echo " BAT1 not found"
    exit 1
fi

# Read the battery percentage
CAPACITY=$(cat "$BATTERY_PATH/capacity")

# Read the battery status (e.g., "Charging", "Discharging")
STATUS=$(cat "$BATTERY_PATH/status")

# Set an icon based on the status
if [ "$STATUS" = "Charging" ]; then
    ICON=""
elif [ "$STATUS" = "Discharging" ]; then
    # Show different icons based on capacity when discharging
    if [ "$CAPACITY" -gt 90 ]; then
        ICON=" "
    elif [ "$CAPACITY" -gt 60 ]; then
        ICON=" "
    elif [ "$CAPACITY" -gt 30 ]; then
        ICON=" "
    elif [ "$CAPACITY" -gt 10 ]; then
        ICON=" "
    else
        ICON=" "
    fi
else # Could be "Full", "Unknown", etc.
    ICON="⚡"
fi
# Print the final output for i3blocks
echo "$ICON $CAPACITY%"

