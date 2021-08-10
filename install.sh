#!/usr/bin/env bash

# this is an install script that configures my Arch system for me, at least I hope
START_PWD=$(pwd)
echo "Creating required folders"
if [[ ! -d ~/.mySettings ]]; then mkdir ~/.mySettings; fi
if [[ ! -d ~/Documents ]]; then mkdir ~/Documents; fi
if [[ ! -d ~/Pictures ]]; then mkdir ~/Pictures; fi
if [[ ! -d ~/Downloads ]]; then mkdir ~/Downloads; fi
if [[ ! -d ~/Documents/GitHub ]]; then mkdir ~/Documents/GitHub; fi
if [[ ! -d ~/Documents/code ]]; then mkdir ~/Documents/code; fi

echo "installing required software"
sleep 5
sudo pacman -S emacs kitty nautilus discord firefox gparted \
    kdeconnect yad gimp nvidia-settings nitrogen transmission-remote-gtk \
    arandr xorg-xrandr bash-completion bluez bpytop cmatrix cockpit cockpit-pcp \
    nmap wireguard-tools vim chromium evolution gnome-keyring capitaine-cursors \
    lxappearance i3 i3lock i3-gaps neofetch syncthing stress shellcheck s-tui \
    ttf-font-awesome ttf-nerd-fonts-symbols intel-undervolt iotop tree \
    w3m vlc wireguard-tools lightdm ripgrep rofi lightdm-gtk-greeter
# enables
echo "enabling required services"
sleep 5
sudo systemctl enable cockpit lightdm bluetooth
# installs yay as an AUR helper
echo "installing AUR helper"
git clone https://aur.archlinux.org/yay.git
cd yay || exit 1
makepkg -si
cd $START_PWD || exit 1
sleep 5
# installs AUR packages
echo
echo "Installing AUR packages"
yay -S apostrophe auto-cpufreq-git bitwarden-bin exodus github-desktop-bin i3exit \
    js-beautify matcha-gtk-theme moka-icon-theme-git mongodb-compass nvm \
    picom-jonaburg-git polybar polybar-spotify-module spotify tela-icon-theme \
    timeshift vscodium
