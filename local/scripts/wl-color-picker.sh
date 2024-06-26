#!/bin/sh
# From: https://github.com/jgmdev/wl-color-picker/blob/main/wl-color-picker.sh
# Adapted for FreeBSD by lbartoletti@
#
# License: MIT
#
# A script to easily pick a color on a wayland session by using:
# slurp to select the location, grim to get the pixel, convert
# to make the pixel a hex number and zenity to display a nice color
# selector dialog where the picked color can be tweaked further.
#
# The script was possible thanks to the useful information on:
# https://www.trst.co/simple-colour-picker-in-sway-wayland.html
# https://unix.stackexchange.com/questions/320070/is-there-a-colour-picker-that-works-with-wayland-or-xwayland/523805#523805
#

# Check if running under wayland.
if [ -z "$WAYLAND_DISPLAY" ]; then
    notify-send --urgency=critical \
        "No wayland session found." \
        "This color picker must be run under a valid wayland session."
    exit 1
fi

# Get color position
position=$(slurp -b 00000000 -p)

# Sleep at least for a second to prevent issues with grim always
# returning improper color.
sleep 1

# Store the hex color value using graphicsmagick or imagemagick.
if command -v gm >/dev/null 2>&1; then
    color=$(grim -g "$position" -t png - \
        | gm convert - -format '%[pixel:p{0,0}]' txt:- \
        | tail -n 1 \
        | rev \
        | cut -d ' ' -f 1 \
        | rev
    )
else
    color=$(grim -g "$position" -t png - \
        | convert - -format '%[pixel:p{0,0}]' txt:- \
        | tail -n 1 \
        | cut -d ' ' -f 4
    )
fi

if [ "$1" = "clipboard" ]; then
    echo "$color" | wl-copy -n
else
    # Display a color picker and store the returned rgb color
    rgb_color=$(notify-send  \
        "Selected color" \
        --expire-time=0 \
        "$color"
    )

    # Execute if user didn't click cancel
    if [ -n "$rgb_color" ]; then
        # Convert rgb color to hex
        hex_color="#"
        for value in $(echo "$rgb_color" | grep -E -o -m1 '[0-9]+'); do
            hex_color="$hex_color$(printf "%.2x" "$value")"
        done

        # Copy user selection to clipboard
        echo "$hex_color" | wl-copy -n
    fi
fi
