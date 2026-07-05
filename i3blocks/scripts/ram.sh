#!/bin/bash

RAM_USAGE=$(awk '
/MemTotal:/ {total=$2}
/MemAvailable:/ {avail=$2}
END {
  printf "%.0f\n", (total-avail)/total*100
}' /proc/meminfo)

echo "Ram: $RAM_USAGE%"
