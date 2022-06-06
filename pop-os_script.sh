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
echo "Getting APT applications"
#Gnome Tweaks
apt install gnome-tweaks -y
#mpv video player
apt install mpv -y
#vlc video player
apt install vlc -y
#atom IDE
apt install atom -y
#Backup software 
apt install deja-dup -y
#cleaner software
apt install bleachbit -y 
#Firefox
apt install firefox -y
#flameshot screenshot software
apt install flameshot -y
#nvtop install - nvidia htop monitoring tool
apt install nvtop -y
#htop - process viewer linux
apt install htop -y
#bashtop Linus resource monitor
apt install bashtop -y
#Brave Browser 
apt install apt-transport-https curl
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"| tee /etc/apt/sources.list.d/brave-browser-release.list
apt update
apt install brave-browser -y
#KeepassXC password manager
apt install keepassxc -y
#kid3 mp3 tag editor
apt install kid3 -y
#comic book reader
apt install mcomix -y
#OBS Studio
apt install obs-studio -y
#qbittorrent - torrent downloader
apt install qbittorrent -y
#RhythmBox Audio Player
apt install rhythmbox -y
#Thunderbird Mail
apt install thunderbird -y
#Variety Wallpaper Changer
apt install variety -y


echo "Flatpak installation"
echo "---------------------"
apt install flatpak
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
cd Desktop/
mkdir Flatpack_files
cd Flatpack_files #download the files here for easy clean up
echo "Citra Gaming Emulator"
wget https://dl.flathub.org/repo/appstream/org.citra_emu.citra.flatpakref
flatpak --user install org.citra_emu.citra.flatpakref -y #-y answers the question for you
echo "Installing Bitwarden"
wget https://dl.flathub.org/repo/appstream/com.bitwarden.desktop.flatpakref
flatpak --user install com.bitwarden.desktop.flatpakref -y
echo "Installing Discord"
wget https://dl.flathub.org/repo/appstream/com.discordapp.Discord.flatpakref
flatpak --user install com.discordapp.Discord.flatpakref -y
echo "Installing GitHub Desktop"
wget https://dl.flathub.org/repo/appstream/io.github.shiftey.Desktop.flatpakref
flatpak --user install io.github.shiftey.Desktop.flatpakref -y
echo "Installing gPodder"
wget https://dl.flathub.org/repo/appstream/org.gpodder.gpodder.flatpakref
flatpak --user install org.gpodder.gpodder.flatpakref -y
echo "Installing Heroic Games Launcher"
wget https://dl.flathub.org/repo/appstream/com.heroicgameslauncher.hgl.flatpakref
flatpak --user install com.heroicgameslauncher.hgl.flatpakref -y
echo "Installing FreeTube"
wget https://dl.flathub.org/repo/appstream/io.freetubeapp.FreeTube.flatpakref
flatpak --user install io.freetubeapp.FreeTube.flatpakref -y
echo "Installing Kdenlive"
wget https://dl.flathub.org/repo/appstream/org.kde.kdenlive.flatpakref 
flatpak --user install org.kde.kdenlive.flatpakref -y
echo "Installing Librewolf"
wget https://dl.flathub.org/repo/appstream/io.gitlab.librewolf-community.flatpakref
flatpak --user install io.gitlab.librewolf-community.flatpakref -y
echo "Installing Obsidian Markdown editor"
wget https://dl.flathub.org/repo/appstream/md.obsidian.Obsidian.flatpakref
flatpak --user install md.obsidian.Obsidian.flatpakref -y
echo "Installing Planner"
wget https://dl.flathub.org/repo/appstream/com.github.alainm23.planner.flatpakref
flatpak --user install com.github.alainm23.planner.flatpakref -y


echo "Installing ProtonVPN"
wget https://protonvpn.com/download/protonvpn-stable-release_1.0.1-1_all.deb
dpkg -i protonvpn-stable-release_1.0.1-1_all.deb #Change link when new one comes out
apt-get update
apt-get install protonvpn
echo "Install Steam"


echo "
Post Install TO DO:
https://github.com/arkenfox/user.js setup for FireFox
Log In to all accounts


RESOURCES:
https://www.patorjk.com/software/taag/
https://github.com/mikeroyal/Pop_OS-Guide
https://support.system76.com/articles/install-in-vm/
"
