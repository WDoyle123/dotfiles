#!/bin/bash

# Define the descriptions of your sinks
HEADPHONES_DESCRIPTION="Headphones"  # Update this if needed
SPEAKERS_DESCRIPTION="Speakers"

# Function to get the sink name by description
get_sink_by_description() {
    pactl list sinks | grep -e 'Name:' -e 'Description:' | grep -B1 "$1" | head -n 1 | cut -d' ' -f2
}

# Get the name of the sinks for headphones and speakers
HEADPHONES_SINK=$(get_sink_by_description "$HEADPHONES_DESCRIPTION")
SPEAKERS_SINK=$(get_sink_by_description "$SPEAKERS_DESCRIPTION")

# Get the current default sink
CURRENT_SINK=$(pactl get-default-sink)

# Determine the target sink and switch
if [ "$CURRENT_SINK" == "$HEADPHONES_SINK" ]; then
    pactl set-default-sink "$SPEAKERS_SINK"
    echo "Switched to Speakers"
elif [ "$CURRENT_SINK" == "$SPEAKERS_SINK" ]; then
    pactl set-default-sink "$HEADPHONES_SINK"
    echo "Switched to Headphones"
else
    echo "Current sink is neither Headphones nor Speakers."
fi

