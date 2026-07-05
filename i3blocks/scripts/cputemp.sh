#!/bin/bash
# Get CPU temp from lm-sensors and format it.

# Get the line with the CPU package temperature
TEMP_LINE=$(sensors | grep 'Package id 0:')

# Check if the line was found to prevent errors
if [ -n "$TEMP_LINE" ]; then
    # Extract the temperature field (e.g., "+39.0°C")
    RAW_TEMP=$(echo "$TEMP_LINE" | awk '{print $4}')

    # Use 'tr' to delete the '+' and '°C' characters
    CLEAN_TEMP=$(echo "$RAW_TEMP" | tr -d '+°C')

    # THE FIX: Use 'cut' to chop off the decimal part
    INTEGER_TEMP=$(echo "$CLEAN_TEMP" | cut -d'.' -f1)

    # Use a simple echo to print the result
    echo " $INTEGER_TEMP°"
fi
