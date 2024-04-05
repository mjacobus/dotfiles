#!/bin/bash

if [ "$1" = "up" ]; then
  pactl set-sink-volume @DEFAULT_SINK@ +5%
elif [ "$1" = "down" ]; then
  pactl set-sink-volume @DEFAULT_SINK@ -5%
elif [ "$1" = "mute" ]; then
  pactl set-sink-mute @DEFAULT_SINK@ toggle
fi

pkill -RTMIN+10 i3blocks
