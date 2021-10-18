#!/usr/bin/bash

echo "Script is starting if you no longer see output it 
means you need to make changes to your settings!"
# This scripts copies the dotfiles stored in .mySettings to the repository
# it expects that your repository is located at /home/$USER/Documents/GitHub
# where $USER is your username, if you want to use a different path for your
# repository change the path in the cd command bellow
cd ~/Documents/GitHub/mySettings || exit 1


echo "Checking folder structure."
if [[ ! -d ./configs ]]; then mkdir configs; fi
if [[ ! -d ./scripts ]]; then mkdir scripts; fi
if [[ ! -d ./doom ]]; then mkdir doom; fi
if [[ ! -d ./configs/qtile ]]; then mkdir configs/qtile; fi
if [[ ! -d ./system ]]; then mkdir system; fi
echo "Done."
echo "Backing up configuration files."
# USER CONFIGS
cp -rp ~/.mySettings/aliases ./aliases
cp -rp ~/.bashrc ./bashrc
cp -rp ~/.mySettings/configs/* ./configs/
cp -rp ~/.mySettings/scripts/* ./scripts/
cp -rp ~/.gtkrc-2.0 ./gtkrc
cp -rp ~/.doom.d/* ./doom
# SYSTEM CONFIGS
cp -rp /etc/udev/rules.d/cpupower.rules ./system/
cp -rp /etc/intel-undervolt.conf ./system/
cp -rp /etc/systemd/system/root-resume.service ./system/
cp -rp /etc/systemd/system/power_management.service ./system/
cp -rp /home/filipe/powerstate.sh ./system/
cp -rp /etc/cpupower_gui.d/ondemand.profile ./system/
cp -rp /etc/cpupower_gui.d/powersave.profile ./system/
cp -rp /etc/pacman.conf ./system/
cp -rp /etc/X11/xorg.conf ./system/
echo "Done."