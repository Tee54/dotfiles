#!/usr/bin/env bash

#Variables
CONFIG="$HOME/.config"

echo -e "This script is meant to configure my whole setup in Archlinux\n By: Ciro Dario Sanchez Acosta\n"

#CHECK PRIVILDGES
if [[ $EUID -ne 0 ]]; then 
    echo "ERROR: Please execute this script with as root"
    exit 1
fi

#CHECK FOR INTERNET CONNECTION
if ! ping -c 1 archlinux.org &>/dev/null; then
    echo "ERROR: no internet connection!"
    exit 1
fi

echo "Whole System Upgrade..."
pacman -Syu --noconfirm

echo "Installing base packages..."
pacman -S --noconfirm base-devel grub zsh networkmanager efibootmgr git neovim

#zsh
echo "Setting zsh..."
cp -r zsh/ $CONFIG
cp zsh/.zshrc $HOME/
source /$HOME/.zshrc

#neovim
echo "setting neovim..."
cp -r nvim/ $CONFIG

#Get yay
echo "Getting yay"
git clone https://aur.archlinux.org/yay-bin.git
(
cd yay-bin || exit
makepkg -si --noconfirm
)
rm -rf yay-bin

#Core Program AUR
echo "Installing helper"
yay -S --noconfirm pwvucontrol nerd-fonts-complete

#Core Programs
echo "Installing Core Programs"
pacman -S --noconfirm reflector vlc kitty 7zip noto-fonts noto-fonts-cjk ttf-font-awesome

#Programs 
echo "Installing Normal Programs"
pacman -S --noconfirm thunar gvfs atril libreoffice-fresh firefox flatpak 

#Desktop Programs
echo "Installing Programs Before The Desktop"
pacman -S --noconfirm brightnessctl wofi waybar sddm papirus-icon-theme

#waybar
echo "Setting Waybar"
cp -r waybar/ $CONFIG

#wofi
echo "Setting Waybar"
cp -r wofi/ $CONFIG

#HYRPLAND!!!!
echo "Installing hyprland"
pacman -S --noconfirm hyprland hyprpaper hyprlock hyprutils wl-clipboard

echo "Setting Hyprland"
cp -r hypr/ $CONFIG

echo "Installing MATE"
pacman -S --noconfirm mate

echo "That's all folks! Remember to configure manualy grub, sddm and gtk!"
