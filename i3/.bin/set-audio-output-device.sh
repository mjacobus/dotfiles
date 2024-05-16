#!/bin/bash

# Check if a sink identifier is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <sink_name_or_index>"
    exit 1
fi

SINK_IDENTIFIER=$1

# Check if the identifier is an index (numeric)
if [[ $SINK_IDENTIFIER =~ ^[0-9]+$ ]]; then
    SINK_NAME=$(pactl list short sinks | awk -v idx="$SINK_IDENTIFIER" '$1 == idx {print $2}')
else
    # Find the sink name that matches the partial name
    SINK_NAME=$(pactl list short sinks | grep -m 1 "$SINK_IDENTIFIER" | awk '{print $2}')
fi

# Check if a matching sink was found
if [ -z "$SINK_NAME" ]; then
    echo "No matching sink found for identifier: $SINK_IDENTIFIER"
    exit 1
fi

# Set the found sink as the default sink
pactl set-default-sink "$SINK_NAME"

# Move all playing streams to the found sink
for stream in $(pactl list short sink-inputs | awk '{print $1}'); do
    pactl move-sink-input "$stream" "$SINK_NAME"
done

# Make the sink the default output
pactl set-default-sink "$SINK_NAME"

echo "All outputs have been switched to sink: $SINK_NAME"
