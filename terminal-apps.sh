#!/bin/bash
# Terminal Apps Installer

# Update and Upgrade
sudo apt update && sudo apt upgrade -y

# Install terminal apps
sudo apt install neofetch htop bmon screen tmux cmatrix iftop ranger irssi mplayer lsof git lynx feh netcat nmap basetet -y

# Cleanup 
sudo apt autoremove -y