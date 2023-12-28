#!/bin/bash

# Module ID for Blue Yeti
MODULE_ID=8

# Unload the module
echo "Unloading module $MODULE_ID"
pactl unload-module $MODULE_ID

# Wait for a moment to ensure the module is fully unloaded
sleep 1

# Load the module with specific parameters to enable only the microphone
# The specific parameters depend on your device and system configuration
echo "Reloading module with specific parameters for microphone only"
pactl load-module module-alsa-source device=hw:YETI,0

# Note: Replace 'hw:YETI,0' with the correct hardware identifier for your Blue Yeti microphone.

