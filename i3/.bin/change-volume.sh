#!/bin/bash

# Function to set volume for all sinks
set_volume_for_all_sinks() {
	local volume_change=$1
	for sink in $(pactl list short sinks | awk '{print $1}'); do
		pactl set-sink-volume $sink $volume_change
	done
}

# Function to toggle mute for all sinks
toggle_mute_for_all_sinks() {
	for sink in $(pactl list short sinks | awk '{print $1}'); do
		pactl set-sink-mute $sink toggle
	done
}

if [ "$1" = "up" ]; then
	set_volume_for_all_sinks "+5%"
elif [ "$1" = "down" ]; then
	set_volume_for_all_sinks "-5%"
elif [ "$1" = "mute" ]; then
	toggle_mute_for_all_sinks
fi

pkill -RTMIN+10 i3bloc
