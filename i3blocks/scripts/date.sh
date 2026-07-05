#!/bin/bash

if [ "$BLOCK_BUTTON" == "1" ]; then
        gnome-calendar &
fi

echo "$(date +"%b %d %H:%M")"
