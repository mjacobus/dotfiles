#!/usr/bin/env bash

# Create directory if it doesn't exist
mkdir -p ~/Pictures/screenshots

# Capture the screenshot with a timestamp and save it
target_file=~/Pictures/screenshots/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png
scrot -s $target_file

# Copy the screenshot to clipboard
xclip -selection clipboard -t image/png -i $target_file
