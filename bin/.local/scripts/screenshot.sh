#!/usr/bin/env bash

dir = "$HOME/Pictures/screenshots/"
mkdir -p "$dir"

file="$dir/screenshot-$(date '+%Y%m%d-%H%M%S').png"
region=$(slurp)

[ -z "$region" ] && exit 1

# Take screenshot and write to file
grim -g "$region" "$file"

# Copy to clipboard
wl-copy < "$file"
