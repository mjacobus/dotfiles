#!/usr/bin/env bash

default_sink=$(pactl get-default-sink)

# Get the volume of the default sink
VOLUME=$(pactl get-sink-volume "$default_sink" | grep -o '[0-9]\+%' | head -1)

# Check if the default sink is muted
MUTED=$(pactl get-sink-mute "$default_sink" | awk '/Mute/ {print $2}')

# Output the volume or muted status
if [ "$MUTED" = "yes" ]; then
  echo "Muted"
else
  echo "Volume: $VOLUME"
fi
