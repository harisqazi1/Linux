#!/bin/bash
: '
Author: Haris
Name: Pop_OS! Setup Script
Description: A script to help in downloading the essential softwares needed for my setup.
'
echo "
    ____   ____   ____   __      ____  _____    _____              _         __ 
   / __ \ / __ \ / __ \ / /     / __ \/ ___/   / ___/ _____ _____ (_)____   / /_
  / /_/ // / / // /_/ // /     / / / /\__ \    \__ \ / ___// ___// // __ \ / __/
 / ____// /_/ // ____//_/     / /_/ /___/ /   ___/ // /__ / /   / // /_/ // /_  
/_/     \____//_/    (_)______\____//____/   /____/ \___//_/   /_// .___/ \__/  
                       /_____/                                   /_/            
"

#Make sure user is not root
if [ "$EUID" -e 0 ]
  then echo "Do Not run as root"
  exit
fi

echo "Getting APT applications"
#Gnome Tweaks
sudo apt install gnome-tweaks -y
#mpv video player
sudo apt install mpv -y
#vlc video player
sudo apt install vlc -y
#atom IDE
sudo apt install atom -y
#Backup software 
sudo apt install deja-dup -y
#cleaner software
sudo apt install bleachbit -y 
#Firefox
sudo apt install firefox -y
#flameshot screenshot software
sudo apt install flameshot -y
#nvtop install - nvidia htop monitoring tool
sudo apt install nvtop -y
#htop - process viewer linux
sudo apt install htop -y
#bashtop Linus resource monitor
sudo apt install bashtop -y
#Brave Browser 
sudo apt install apt-transport-https -y
sudo apt install curl -y
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"| sudo tee /etc/apt/sources.list.d/brave-browser-release.list
apt update
sudo apt install brave-browser -y
#KeepassXC password manager
sudo apt install keepassxc -y
#kid3 mp3 tag editor
sudo apt install kid3 -y
#comic book reader
sudo apt install mcomix -y
#OBS Studio
sudo apt install obs-studio -y
#qbittorrent - torrent downloader
sudo apt install qbittorrent -y
#RhythmBox Audio Player
sudo apt install rhythmbox -y
#Thunderbird Mail
sudo apt install thunderbird -y
#Variety Wallpaper Changer
sudo apt install variety -y
#Steam
sudo apt install steam -y
#VirtualBox
sudo apt install virtualbox -y 
#neofetch install
sudo apt install neofetch -y


echo "Flatpak installation"
echo "---------------------"
sudo apt install flatpak
flatpak remote-add  --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
cd Desktop/
mkdir Flatpack_files
cd Flatpack_files #download the files here for easy clean up
# -y assumes yes for the questions
echo "Citra Gaming Emulator"
flatpak install flathub org.citra_emu.citra -y 
echo "Installing Bitwarden"
flatpak install flathub com.bitwarden.desktop -y
echo "Installing Discord"
flatpak install flathub flathub com.discordapp.Discord -y
echo "Installing GitHub Desktop"
flatpak install flathub io.github.shiftey.Desktop -y
echo "Installing gPodder"
flatpak install flathub org.gpodder.gpodder -y
echo "Installing Heroic Games Launcher"
flatpak install flathub com.heroicgameslauncher.hgl -y
echo "Installing FreeTube"
flatpak install flathub io.freetubeapp.FreeTube -y
echo "Installing Kdenlive"
flatpak install flathub org.kde.kdenlive -y
echo "Installing Librewolf"
flatpak install flathub io.gitlab.librewolf-community -y
echo "Installing Obsidian Markdown editor"
flatpak install flathub md.obsidian.Obsidian -y
echo "Installing Planner"
flatpak install flathub com.github.alainm23.planner -y
echo "Installing Visual Studio Code"
flatpak install flathub com.visualstudio.code -y
echo "Installing Vocal"
flatpak install flathub com.github.needleandthread.vocal -y
echo "Installing Zettlr"
flatpak install flathub com.zettlr.Zettlr -y

#non APT and Flatpak downloads
echo "Installing ProtonVPN"
wget https://protonvpn.com/download/protonvpn-stable-release_1.0.1-1_all.deb
sudo dpkg -i protonvpn-stable-release_1.0.1-1_all.deb #Change link when new one comes out
apt-get update -y
apt-get install protonvpn -y

echo "Installing Signal"
# Link --> https://www.signal.org/download/linux/
# NOTE: These instructions only work for 64 bit Debian-based
# Linux distributions such as Ubuntu, Mint etc.

# 1. Install our official public software signing key
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null

# 2. Add our repository to your list of repositories
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

# 3. Update your package database and install signal
sudo apt update && sudo apt install signal-desktop


#Candy Icon Set-up --> https://github.com/EliverLara/candy-icons
## Gnome Look -->  https://www.opendesktop.org/p/1305251/
echo "Installing the Candy Icons"
wget https://github.com/EliverLara/candy-icons/archive/refs/heads/master.zip
unzip master.zip -d /usr/share/icons/ #system-wide install; ~/.icons for user (I think)
gsettings set org.gnome.desktop.interface icon-theme candy-icons-master

#Try with this:
sudo apt install gnome-tweaks -y
#could be reason for not working
echo "
Post Install TO DO:
Remove folder from {user}/Desktop/
https://github.com/arkenfox/user.js setup for FireFox
Log In to all accounts
Install OhMyZSH with PowerLevel10k

RESOURCES:
https://www.patorjk.com/software/taag/ -> ASCII Art (Font: Slant)
https://support.system76.com/articles/install-in-vm/ -> Testing Code
https://askubuntu.com/questions/1162422/how-to-enable-user-themes-in-gsettings-gnome-tweaks

Some Inspiration from:
https://github.com/Clepnicx/fedora-setup/blob/master/fedora-setup.sh
https://github.com/millerii/pop_os-customize/blob/main/PopOS-install.sh
"
