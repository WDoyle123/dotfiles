#!/bin/bash

# Count the number of windows on the current desktop
window_count=$(bspc query -N -d focused -n .window | wc -l)

# Apply padding if there is only one window
if [ "$window_count" -eq 1 ]; then
    bspc config -d focused window_gap 20
    bspc config -d focused top_padding 150
    bspc config -d focused bottom_padding 150
    bspc config -d focused left_padding 900
    bspc config -d focused right_padding 900
else
    # Reset padding for more than one window
    bspc config -d focused window_gap 10
    bspc config -d focused top_padding 0
    bspc config -d focused bottom_padding 0
    bspc config -d focused left_padding 0
    bspc config -d focused right_padding 0
fi
