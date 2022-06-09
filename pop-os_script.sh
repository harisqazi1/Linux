#!/bin/bash
: '
Author: Haris
Name: Pop_OS! Test Script
'
echo "
  _______________________   _____ __________  ________  ______
 /_  __/ ____/ ___/_  __/  / ___// ____/ __ \/  _/ __ \/_  __/
  / / / __/  \__ \ / /     \__ \/ /   / /_/ // // /_/ / / /   
 / / / /___ ___/ // /     ___/ / /___/ _, _// // ____/ / /    
/_/ /_____//____//_/     /____/\____/_/ |_/___/_/     /_/     
                                                                     
"

#Candy Icon Set-up --> https://github.com/EliverLara/candy-icons
## Gnome Look -->  https://www.opendesktop.org/p/1305251/
echo "Installing the Candy Icons"
wget https://github.com/EliverLara/candy-icons/archive/refs/heads/master.zip
sudo unzip master.zip -d /usr/share/icons/ #system-wide install; ~/.icons for user (I think)
gsettings set org.gnome.desktop.interface icon-theme candy-icons-master

#Flat Remix Theme Set-Up 
## https://extensions.gnome.org/extension/19/user-themes/ --> http://drasite.com/flat-remix-gnome
' Following was test code for downloading the theme. Work in progress so far.
sudo apt install gnome-shell-extensions -y
git clone https://github.com/daniruiz/flat-remix-gnome.git
mkdir ~/.themes
sudo mv Flat-Remix-Blue-Dark ~/.themes/
#apply theme
gsettings set org.gnome.desktop.interface gtk-theme Flat-Remix-Blue-Dark
#apply shell theme
gsettings set org.gnome.desktop.wm.preferences theme Flat-Remix-Blue-Dark
'

