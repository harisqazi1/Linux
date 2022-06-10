#!/bin/bash

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


#non APT and Flatpak downloads
## For throwing away after files are downloaded
mkdir /home/$user/Desktop/files
chown -R $user /home/$user/Desktop/files #so you are the owner and you can run other files in the folder
cd /home/$user/Desktop/files/


wget https://launchpad.net/veracrypt/trunk/1.25.9/+download/veracrypt-1.25.9-Ubuntu-22.04-amd64.deb
dpkg -i veracrypt-1.25.9-Ubuntu-22.04-amd64.deb -y
