#!/usr/bin/env bash

# this is an install script that configures my Arch system for me, at least I hope
START_PWD=$(pwd)
SECONDS=0
echo "Creating required folders"
if [[ ! -d ~/.mySettings ]]; then mkdir ~/.mySettings ~/.mySettings/scripts ~/.mySettings/configs; fi
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
    w3m vlc wireguard-tools lightdm ripgrep rofi lightdm-gtk-greeter tlp
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
#installs Doom Emacs
echo
echo "Installing Doom Emacs"
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

# copies and symlinks dotfiles to .mySettings
echo
echo "Copying configs to .mySettings"
cp -rp ./configs/* ~/.mySettings/configs/
cp -rp ./scripts/* ~/.mySettings/scripts/
cp ./bashrc ~/.mySettings/bashrc
cp ./aliases ~/.mySettings/aliases
cp ./gtkrc ~/.mySettings/gtkrc
# small cleanup and creation of directories
rm ~/.bash_aliases ~/.bashrc ~/.gtkrc-2.0
mkdir ~/.config/dunst ~/.config/i3 ~/.config/polybar ~/.config/picom ~/.config/kitty
echo
echo "Symlinking files to home directory"
ln -s ~/.mySettings/bashrc ~/.bashrc
ln -s ~/.mySettings/aliases ~/.bash_aliases
ln -s ~/.mySettings/gtkrc ~/.gtkrc-2.0
ln -s ~/.mySettings/configs/dunst/dunstrc ~/.config/dunst/dunstrc
ln -s ~/.mySettings/configs/i3/config ~/.config/i3/config
ln -s ~/.mySettings/configs/polybar/config ~/.config/polybar/config
ln -s ~/.mySettings/configs/picom/picom.conf ~/.config/picom/picom.conf
# ln -s ~/.mySettings/configs/kitty/kitty.conf ~/.config/kitty/kitty.conf


echo
echo "ENABLING SYSTEM CONFIGURATIONS"
sudo cp ./undervolt.conf /etc/intel-undervolt.conf
sudo systemctl enable auto-cpufreq intel-undervolt tlp
sudo intel-undervolt apply
cp ~/.mySettings/configs/doom/* ~/.doom.d/*
~/emacs.d/bin/doom sync

echo "Done in $SECONDS seconds, please reboot!"
