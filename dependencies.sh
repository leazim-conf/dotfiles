#!/bin/bash

# ---------- system dependencies ----------
sudo pacman -S --needed base-devel git -y &&  
sudo pacman -S xorg-server xorg-xrandr xorg-xinit openbox obconf rxvt-unicode -y &&  
sudo pacman -S lxappearance nitrogen vim wmctrl dotool rofi curl -y &&
sudo pacman -S firefox chromium pcmanfm discord code -y &&

# ---------- Fonts polybar ----------
pathfonts="$HOME/.local/share/fonts/"
cd $pathfonts/ttf-font-awesome-4  && makepkg -si
cd $pathfonts/otf-font-awesome-5-free && makepkg -si

# ---------- Git install ----------
mkdir $HOME/Programs
cd $HOME/Programs && git clone https://aur.archlinux.org/polybar.git 
cd polybar-git && makepkg -si 
cd $HOME/Programs && git clone git clone https://aur.archlinux.org/picom-tryone-git.git 
cd picom-tryone-git && makepkg -si

