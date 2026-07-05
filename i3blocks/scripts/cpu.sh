#!/bin/bash

ORIGINAL_SCRIPT="/usr/share/i3blocks/cpu_usage"

RAW_OUTPUT=$($ORIGINAL_SCRIPT)

# Remove % sign
RAW_NUMBER=${RAW_OUTPUT//%}

# Remove spaces
RAW_NUMBER=$(echo "$RAW_NUMBER" | tr -d '[:space:]')

# Convert comma to dot if needed
RAW_NUMBER=${RAW_NUMBER/,/.}

echo "RAW_NUMBER=[$RAW_NUMBER]"

LC_NUMERIC=C printf "%.0f%%\n" "$RAW_NUMBER"
