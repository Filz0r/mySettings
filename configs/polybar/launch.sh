#!/bin/bash

#killall -q polybar
#while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
#polybar topbar &
#polybar topbar2 &
#polybar topbar3 &
if [ -z "$(pgrep -x polybar)" ]; then
    BAR="topbar"
    for m in $(polybar --list-monitors | cut -d":" -f1); do
        MONITOR=$m polybar --reload $BAR &
        sleep 1
    done
else
    polybar-msg cmd restart
fi
