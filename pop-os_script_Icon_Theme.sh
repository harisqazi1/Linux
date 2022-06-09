#!/bin/bash
echo "
   ____                ____      ________                
  /  _/______  ___    / __/___  /_  __/ /  ___ __ _  ___ 
 _/ // __/ _ \/ _ \   > _/_ _/   / / / _ \/ -_)  ' \/ -_)
/___/\__/\___/_//_/  |_____/    /_/ /_//_/\__/_/_/_/\__/ 
"

echo "Making dirs for icons and themes"
mkdir ~/.icons/
mkdir ~/.themes/

#Candy Icon Set-up --> https://github.com/EliverLara/candy-icons
## Gnome Look -->  https://www.opendesktop.org/p/1305251/
echo "Installing the Candy Icons"
wget https://github.com/EliverLara/candy-icons/archive/refs/heads/master.zip
unzip master.zip -d ~/.icons/ #/usr/share/icons for system-wide install (NEED sudo)
gsettings set org.gnome.desktop.interface icon-theme candy-icons-master
