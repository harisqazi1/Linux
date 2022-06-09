#!/bin/bash
echo "
    ____   ____   ____   __      ____  _____    _____              _         __ 
   / __ \ / __ \ / __ \ / /     / __ \/ ___/   / ___/ _____ _____ (_)____   / /_
  / /_/ // / / // /_/ // /     / / / /\__ \    \__ \ / ___// ___// // __ \ / __/
 / ____// /_/ // ____//_/     / /_/ /___/ /   ___/ // /__ / /   / // /_/ // /_  
/_/     \____//_/    (_)______\____//____/   /____/ \___//_/   /_// .___/ \__/  
                       /_____/                                   /_/            
"

#Candy Icon Set-up --> https://github.com/EliverLara/candy-icons
## Gnome Look -->  https://www.opendesktop.org/p/1305251/
echo "Installing the Candy Icons"
wget https://github.com/EliverLara/candy-icons/archive/refs/heads/master.zip
unzip master.zip -d /usr/share/icons #system-wide install; ~/.icons for user (I think)
gsettings set org.gnome.desktop.interface icon-theme candy-icons-master
