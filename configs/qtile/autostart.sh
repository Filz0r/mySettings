#!/bin/sh


picom --experimental-backends --config /home/filipe/.config/picom/picom.conf &
nm-applet &
blueman-applet &
numlockx &
transmission-remote-gtk &
bitwarden &
kdeconnect-indicator &
dunst &
pasystray &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
xss-lock --transfer-sleep-lock -- i3lock --nofork &
