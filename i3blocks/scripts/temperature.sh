#!/bin/bash
# A script to get the CPU temperature.

# The thermal zone file path. 'thermal_zone0' is usually the CPU.
# See the notes below if this doesn't work for you.
THERMAL_ZONE_FILE="/sys/class/thermal/thermal_zone0/temp"

# Read the temperature in millidegrees Celsius
TEMP_MILLICELSIUS=$(cat "$THERMAL_ZONE_FILE")

# Convert to Celsius and format for output
TEMP_CELSIUS=$(awk -v temp="$TEMP_MILLICELSIUS" 'BEGIN {printf "%.0f\n", temp/1000}')

# Use the temperature icon 
echo " $TEMP_CELSIUS°C"
