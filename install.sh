#!/usr/bin/env bash

# NEEDS REWORKING
echo 'This script is still under development, goodbye.'
exit 0

# this is an install script that configures my Arch system for me, at least I hope
START_PWD=$(pwd)
SECONDS=0
echo "Creating required folders"
if [[ ! -d ~/.config ]]; then mkdir ~/.config; fi
if [[ ! -d ~/Documents ]]; then mkdir ~/Documents; fi
if [[ ! -d ~/Pictures ]]; then mkdir ~/Pictures; fi
if [[ ! -d ~/Downloads ]]; then mkdir ~/Downloads; fi
if [[ ! -d ~/github ]]; then mkdir ~/github; fi
if [[ ! -d ~/code ]]; then mkdir ~/code; fi
if [[ ! -d ~/scripts ]]; then mkdir ~/scripts; fi
if [[ ! -d ~/.local ]]; then mkdir ~/.local; fi
mkdir ~/.local/bin
# first copy the old pacman config 
sudo cp ./system/pacman.conf /etc/pacman.conf
echo "installing required software"
sleep 5
sudo pacman -Sy --noconfirm emacs kitty nautilus discord firefox gparted \
    kdeconnect yad gimp nvidia-settings nitrogen transmission-remote-gtk \
    arandr xorg-xrandr bash-completion bluez bpytop cmatrix cockpit cockpit-pcp \
    nmap wireguard-tools vim chromium evolution gnome-keyring capitaine-cursors \
    lxappearance i3-gaps neofetch syncthing stress shellcheck s-tui \
    ttf-font-awesome ttf-nerd-fonts-symbols intel-undervolt iotop tree \
    w3m vlc wireguard-tools lightdm ripgrep rofi lightdm-gtk-greeter tlp \
    dmenu qtile telegram-desktop cpupower  gnome-calculator \
    gnome-disk-utility polkit-gnome filezilla xterm mpv pavucontrol bitwarden

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
yay -S exodus github-desktop-bin i3exit cpupower-gui \
    js-beautify matcha-gtk-theme moka-icon-theme-git mongodb-compass nvm \
    picom-jonaburg-git polybar polybar-spotify-module spotify tela-icon-theme \
    timeshift-bin vscodium zoom nbfc-linux heroic-games-launcher-bin 
#installs Doom Emacs
echo
echo "Installing Doom Emacs"
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

# copies and symlinks dotfiles to .mySettings
sleep 5
echo
echo "Applying initial structure"
cp -rp ./configs/* ~/.config/
cp -rp ./scripts/* ~/scripts/
# small cleanup and creation of directories
rm ~/.bash_aliases ~/.bashrc ~/.gtkrc-2.0
echo
echo "Symlinking files to home directory"
ln -s $START_PWD/bashrc ~/.bashrc
ln -s $START_PWD/aliases ~/.bash_aliases
ln -s $START_PWD/gtkrc ~/.gtkrc-2.0
echo
echo "Applying doom emacs configs"
cp doom/* ~/.doom.d/
~/.emacs.d/bin/doom sync
# ln -s ~/.mySettings/configs/kitty/kitty.conf ~/.config/kitty/kitty.conf


echo
echo "COPYING AND APPLYING SYSTEM CONFIGURATIONS"
sudo cp ./system/intel-undervolt.conf /etc/intel-undervolt.conf
#sudo cp ./system/root-resume.service /etc/systemd/system/
#sudo cp ./system/power_management.service /etc/systemd/system/
#sudo cp ./system/cpupower.rules /etc/udev/rules.d/
sudo cp ./system/*.profile /etc/cpupower_gui.d/
sudo cp ./system/xorg.conf /etc/X11/xorg.conf
sudo cp ./system/pacman.conf /etc/pacman.conf
# Only copying my custom nbfc config at the time to check if the
# temps are better with the auto fan curves or if my own are better
# sound is also an issue here, a fan constantly at 50% to get a 40ºC
# is useless if I can have a mostly silent fan at 45-52 ºC at 20% cpu
# and gpu load, which means a lot of apps at the time of writting this.
# Will remove this and auto apply my config if I'm not satisfied with this
sudo cp ./nbfc-profiles/gl502vm_v4.json /usr/share/nbfc/configs/
cp ./system/powerstate.sh ~/scripts/
chmod +x ~/scripts/powerstate.sh
sudo systemctl enable intel-undervolt
# tlp root-resume power_managent
sudo intel-undervolt apply


echo "Done in $SECONDS seconds, please reboot!"
