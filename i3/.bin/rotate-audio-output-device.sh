#!/bin/bash

# Get the list of sinks
SINKS=($(pactl list short sinks | awk '{print $2}'))

# Check if there are any sinks
if [ ${#SINKS[@]} -eq 0 ]; then
    echo "No sinks found."
    exit 1
fi

# Get the current default sink
CURRENT_SINK=$(pactl info | grep 'Default Sink:' | awk '{print $3}')

# Find the index of the current sink in the SINKS array
CURRENT_INDEX=-1
for i in "${!SINKS[@]}"; do
    if [[ "${SINKS[$i]}" == "$CURRENT_SINK" ]]; then
        CURRENT_INDEX=$i
        break
    fi
done

# Calculate the index of the next sink
if [ $CURRENT_INDEX -eq -1 ]; then
    NEXT_INDEX=0
else
    NEXT_INDEX=$(( (CURRENT_INDEX + 1) % ${#SINKS[@]} ))
fi

NEXT_SINK=${SINKS[$NEXT_INDEX]}

# Set the next sink as the default
pactl set-default-sink "$NEXT_SINK"

# Move all playing streams to the next sink
for stream in $(pactl list short sink-inputs | awk '{print $1}'); do
    pactl move-sink-input "$stream" "$NEXT_SINK"
done

echo "Switched to sink: $NEXT_SINK"
