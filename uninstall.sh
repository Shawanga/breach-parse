#!/bin/bash

uid=$(id -u)

if [ "$uid" -ne 0 ]; then
    echo "Error: To uninstall, please run as root (uid 0)."
    exit
fi

locations=(
    "*/bin/breach-parse"
)

found=0

for location in "${locations[@]}"; do
    if [ -f "$location" ]; then
        rm "$location"
        echo "Uninstalled breach-parse from $location."
        found=1
    fi
done

if [ $found -eq 0 ]; then
    echo "breach-parse is not installed in any of the checked locations."
else
    echo "All done! Uninstalled breach-parse."
fi