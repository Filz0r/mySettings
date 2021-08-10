#!/usr/bin/env bash

# This scripts copies the dotfiles stored in .mySettings to the repository
# it expects that your repository is located at /home/$USER/Documents/GitHub
# where $USER is your username, if you want to use a different path for your
# repository change the path in the cd command bellow
cd ~/Documents/GitHub/mySettings || exit 1
if [[ ! -d ./configs ]]; then mkdir configs; fi
if [[ ! -d ./scripts ]]; then mkdir scripts; fi

cp -rp ~/.mySettings/aliases ./aliases
cp -rp ~/.bashrc ./bashrc
cp -rp ~/.mySettings/configs/* ./configs/
cp -rp ~/.mySettings/scripts/* ./scripts/
cp -rp ~/.gtkrc-2.0 ./gtkrc
