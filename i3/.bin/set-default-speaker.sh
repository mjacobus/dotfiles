#!/bin/bash

# List sinks and find HDMI sink name
HDMI_SINK=$(pactl list short sinks | grep hdmi | awk '{print $2}')

# Set default sink to HDMI
pactl set-default-sink $HDMI_SINK

# Set volume to 50%
# pactl set-sink-volume $HDMI_SINK 50%
pactl set-sink-volume $HDMI_SINK 100%
