#!/bin/bash
: '
Author: Haris
Name: Pop_OS! Setup Script
Description: A script to help in downloading the essential softwares needed for my setup.
Latest Test Version: 22.04 | codename: jammy 
Last Updated: Jun 9, 2022
RESOURCES (excluding research):
https://www.patorjk.com/software/taag/ -> ASCII Art (Font: Slant)
https://support.system76.com/articles/install-in-vm/ -> Testing Code
Some Inspiration from:
https://github.com/Clepnicx/fedora-setup/blob/master/fedora-setup.sh
https://github.com/millerii/pop_os-customize/blob/main/PopOS-install.sh

'
echo "
    ____   ____   ____   __      ____  _____    _____              _         __ 
   / __ \ / __ \ / __ \ / /     / __ \/ ___/   / ___/ _____ _____ (_)____   / /_
  / /_/ // / / // /_/ // /     / / / /\__ \    \__ \ / ___// ___// // __ \ / __/
 / ____// /_/ // ____//_/     / /_/ /___/ /   ___/ // /__ / /   / // /_/ // /_  
/_/     \____//_/    (_)______\____//____/   /____/ \___//_/   /_// .___/ \__/  
                       /_____/                                   /_/            
"
#Username variable for making the folder on the Desktop (sudo ~/Desktop != ~/Desktop)
## EDIT THIS VARIABLE
user=""

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

if [ -z "$user" ]
  then echo "set user variable to be your username"
  exit
fi


#Update system and upgrade packages
apt update && apt upgrade -y

echo "Getting APT applications"
#Gnome Tweaks
apt install gnome-tweaks -y
#mpv video player
apt install mpv -y
#vlc video player
apt install vlc -y
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
apt install apt-transport-https -y
apt install curl -y
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
#Steam
apt install steam -y
#VirtualBox
apt install virtualbox -y 
#neofetch install
apt install neofetch -y
#git install (For theme install)
apt install git -y

echo "Flatpak installation"
echo "---------------------"
apt install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# -y assumes yes for the questions
echo "Installing Citra Gaming Emulator"
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
## For throwing away after files are downloaded
mkdir /home/$user/Desktop/files
chown -R $user /home/$user/Desktop/files #so you are the owner and you can run other files in the folder
cd /home/$user/Desktop/files/

echo "Installing ProtonVPN"
wget https://protonvpn.com/download/protonvpn-stable-release_1.0.1-1_all.deb
dpkg -i protonvpn-stable-release_1.0.1-1_all.deb #Change link when new one comes out
apt-get update -y
apt-get install protonvpn -y

echo "Installing Signal"
# Link --> https://www.signal.org/download/linux/
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  tee -a /etc/apt/sources.list.d/signal-xenial.list
apt update && apt install signal-desktop

echo "Installing TOR"
wget https://www.torproject.org/dist/torbrowser/11.0.14/tor-browser-linux64-11.0.14_en-US.tar.xz
tar xvf tor-browser-linux64-11.0.14_en-US.tar.xz
echo "Move the Tor folder (optional)"

echo "Installing pop-os_script_Icon_Theme.sh"
wget https://raw.githubusercontent.com/harisqazi1/Linux/main/pop-os_script_Icon_Theme.sh
echo "RUN THIS FILE AS $user"

echo "
Post Install TO DO:
- Run pop-os_script_Icon_Theme.sh (no sudo)
- https://github.com/arkenfox/user.js setup for FireFox
- Log In to all accounts
- Install Gnome extensions --> https://extensions.gnome.org/
> Freon --> https://extensions.gnome.org/extension/841/freon/
> Sound Input & Output Device Chooser --> https://extensions.gnome.org/extension/906/sound-output-device-chooser/
> User Themes --> https://extensions.gnome.org/extension/19/user-themes/ --> http://drasite.com/flat-remix-gnome
> Blur my Shell --> https://extensions.gnome.org/extension/3193/blur-my-shell/
> Dash to Dock (might not work with Cosmic Dock, currently using Cosmic) --> https://extensions.gnome.org/extension/307/dash-to-dock/
- Move dash to the left and change opacity
- Install OhMyZSH with PowerLevel10k
"
