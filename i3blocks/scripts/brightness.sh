#!/bin/bash
# A script to get brightness percentage using brightnessctl

# Get current and max brightness values
CURRENT=$(brightnessctl get)
MAX=$(brightnessctl max)

# Calculate the percentage using shell arithmetic
PERCENTAGE=$((CURRENT * 100 / MAX))

# Print the final percentage
echo "$PERCENTAGE%"
