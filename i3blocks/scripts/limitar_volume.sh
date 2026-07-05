#!/bin/bash

if [ "$BLOCK_BUTTON" == "1" ]; then
    pavucontrol &
fi
# Pega o volume do sink padrão (pode passar de 100%)
vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1 | tr -d '%')

# Limita para 100%
if [ "$vol" -gt 100 ]; then
  vol=100
fi

echo "$vol%"
