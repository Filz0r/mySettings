#!/bin/sh
xrandr --output DP-0 --off \
    --output DP-1 --off \
    --output DP-2 --off \
    --output HDMI-0 --mode 1920x1080 --pos 4480x0 --rotate left  \
    --output DP-3 --primary --mode 2560x1080 --refresh 75 --pos 1920x582 --rotate normal \
    --output DP-4 --off
