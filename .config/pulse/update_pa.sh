#!/bin/bash

# Define your sink names
HDMI_SINK="alsa_output.pci-0000_26_00.1.hdmi-stereo"
ANALOG_SINK="alsa_output.pci-0000_28_00.4.analog-stereo"

# Function to update sink properties
update_sink() {
    sink_name="$1"
    description="$2"
    
    # Wait for the sink to become available
    while ! pactl list sinks short | grep -q "$sink_name"; do
        sleep 1
    done

    # Update sink description
    pactl update-sink-proplist "$sink_name" device.description="$description"
}

# Update sinks in the background
update_sink "$HDMI_SINK" "Headphones" &
update_sink "$ANALOG_SINK" "Speakers" &

