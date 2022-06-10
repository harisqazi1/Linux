# Linux Setup Script --> Pop!\_OS

A repo for scripts for my Linux Distro (currently Pop!\_OS). Still a work in progress. See "What I want the final output to be" below.

### Usage

`wget https://raw.githubusercontent.com/harisqazi1/Linux/main/pop-os_script.sh`

`nano pop-os_script.sh` **edit the `user` variable to be your username**

`sudo bash pop-os_script.sh`

`bash pop-os_script_Icon_Theme.sh`

The first script includes the second script being downloaded. You just have to run the second script **without sudo** seperately.

### Here are screenshots I have taken while testing my script on a 22.04 Pop!\_OS install:

#### Script output
![Script Output](https://github.com/harisqazi1/Linux/blob/main/assets/pop-os_script.png)

#### Icons setup
![Icon](https://github.com/harisqazi1/Linux/blob/main/assets/icons.png)

#### What I want the final output to be
![final product](https://github.com/harisqazi1/Linux/blob/main/assets/final_product.png)

### In the Scripts
- APT Packages
- Flatpak Packages
- External Packages (from the source website)
- Icons Setup

### To Do (only if possible with terminal):
- Enable Gnome extensions
  - Setup extensions that I want
- Move Dock to the left & change opacity
- Install OhMyZSH with PowerLevel10k
