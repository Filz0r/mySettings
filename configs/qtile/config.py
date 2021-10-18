'''
QTILE CONFIG from
Filipe Figueiredo - 2021
'''

import os
import socket
import subprocess

from keys import key_maps, group_keys, mouse_init
from groups import group_init
from layouts import layout_init, floating_layouts
from screens import screen_init

from typing import List
from libqtile import hook

keys = key_maps()
groups = group_init()
group_keys(groups, keys)
layouts = layout_init()

widget_defaults = dict(
    font='sans',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = screen_init()


mouse = mouse_init()

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = floating_layouts()
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True


@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    home1 = os.path.expanduser('~/.config/qtile/restart.sh')
    subprocess.call([home])
    subprocess.call([home1])


@hook.subscribe.restart
def start_on_restart():
    home = os.path.expanduser('~/.config/qtile/restart.sh')
    subprocess.call([home])


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"