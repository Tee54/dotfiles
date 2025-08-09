#!/usr/bin/env bash

#Variables
DIR=$(realpath "$PWD")

echo -e "This script is meant to configure my whole setup in Archlinux By: Ciro Dario Sanchez Acosta"

#CHECK PRIVILDGES
if [[ $EUID -ne 0 ]]; then 
    echo "ERROR: Please execute this script as root"
    exit 1
fi

#CHECK FOR INTERNET CONNECTION
if ! ping -c 1 archlinux.org &>/dev/null; then
    echo "ERROR: no internet connection!"
    exit 1
fi

echo "Setting up config dotfiles..."
cp -r .config/ $HOME/

#zsh
echo "Setting up zsh..."
cp .zshrc $HOME/
source $HOME/.zshrc

#Get yay
#echo "Getting yay"
#git clone https://aur.archlinux.org/yay-bin.git $XDG_DOWNLOAD_DIR/
#cd yay-bin 
#makepkg -si --noconfirm

#return 
#cd $DIR

#Update package database
pacman -Sy

#Core Programs
echo "Installing Core Programs"
pacman -S --noconfirm neovim htop ripgrep lynx wireplumber fastfetch ttf-firacode-nerd ttf-font-awesome

#Programs 
#echo "Installing Normal Programs"
#pacman -S --noconfirm thunar gvfs atril libreoffice-fresh firefox flatpak 

#Desktop Programs
#echo "Installing Programs Before The Desktop"
#pacman -S --noconfirm brightnessctl dunst wofi waybar papirus-icon-theme

#HYRPLAND!!!!
#echo "Installing hyprland"
#pacman -S --noconfirm hyprland hyprpaper hyprlock hyprutils wl-clipboard

#echo "Installing MATE"
#pacman -S --noconfirm marco mate-control-center mate-desktop mate-session-manager mate-panel

echo "That's all folks!!!"
