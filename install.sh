#!/usr/bin/env bash

# this is an install script that configures my Arch system for me, at least I hope

set -euo pipefail

echo "Creating required folders"
mkdir ~/.mySettings
mkdir ~/Documents ~/Downloads ~/Pictures
mkdir ~/Documents/GitHub
mkdir ~/Documents/code

echo "installing required software"
sudo pacman -S emacs kitty nautilus discord firefox gparted \
    kdeconnect yad gimp nvidia-settings nitrogen transmission-remote-gtk \
    arandr xorg-xrandr bash-completion bluez bpytop cmatrix cockpit cockpit-pcp \
    nmap wireguard-tools vim chromium evolution gnome-keyring capitaine-cursors \
    lxappearance i3 i3lock i3-gaps neofetch syncthing stress shellcheck s-tui \
    ttf-font-awesome ttf-nerd-fonts-symbols intel-undervolt iotop tree \
    w3m vlc wireguard-tools lightdm

echo "installing AUR helper and AUR packages"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay -S apostrophe auto-cpufreq-git bitwarden-bin exodus github-desktop-bin i3exit \
    js-beautify matcha-gtk-theme moka-icon-theme-git mongodb-compass nvm \
    picom-jonaburg-git polybar polybar-spotify-module spotify tela-icon-theme \
    timeshift vscodium
