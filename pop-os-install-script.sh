#!/bin/bash
# POP!_OS Post Installer Script

# Update and Upgrade
sudo apt update && sudo apt upgrade -y
sudo apt-get install ubuntu-restricted-extras -y

# Install terminal apps
sudo apt install neofetch htop bmon screen tmux -y

# Install apps from repo
sudo apt install gnome-tweaks synaptic thunderbird git rpi-imager steam lutris winff vlc -y

#Install vscodium
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor | sudo dd of=/etc/apt/trusted.gpg.d/vscodium.gpg

echo 'deb https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list

sudo apt update && sudo apt install codium

# Install flatpak apps
sudo apt install flatpak -y
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install flathub org.glimpse_editor.Glimpse org.inkscape.Inkscape com.obsproject.Studio com.github.babluboy.bookworm com.nextcloud.desktopclient.nextcloud org.openshot.OpenShot com.discordapp.Discord com.spotify.Client us.zoom.Zoom


# Install external deb packages
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget https://files.multimc.org/downloads/multimc_1.4-1.deb
wget https://download.nomachine.com/download/6.12/Linux/nomachine_6.12.3_7_amd64.deb
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
wget https://launchpad.net/veracrypt/trunk/1.24-update7/+download/veracrypt-1.24-Update7-Ubuntu-20.04-amd64.deb
wget https://download.virtualbox.org/virtualbox/6.1.16/virtualbox-6.1_6.1.16-140961~Ubuntu~eoan_amd64.deb
wget https://download.virtualbox.org/virtualbox/6.1.16/Oracle_VM_VirtualBox_Extension_Pack-6.1.16.vbox-extpack

# Install deb packages
sudo dpkg -i *.deb


