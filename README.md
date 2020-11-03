# POP OS Setup
Script for automated app install
source: https://www.addictivetips.com/ubuntu-linux-tips/make-ubuntu-post-installation-script/

### Update and Upgrade
- Go to settings > about and change hostname
sudo apt update && sudo apt upgrade -y

### Enable Minimize and Maximize Buttons
sudo apt install gnome-tweaks

- Turn on min and max buttons
- Add day of the week to top bar

### Install Restricted Formats
sudo apt-get install ubuntu-restricted-extras

### Dash to dock
- Install chrome gnome shell integration extension 
- Visit https://extensions.gnome.org/extension/307/dash-to-dock/
- Push button on screen from "Off" to "On"

### Install Oracle Java
source: https://www.fosstechnix.com/install-oracle-java-8-on-ubuntu-20-04/

- download oracle java 8 jre (not jdk)
- https://www.oracle.com/java/technologies/javase-jre8-downloads.html
- Agree and Sign-In to download

sudo mkdir  -p /opt/jre
sudo cp -rf /home/rath/jre-8u271-linux-x64.tar.gz /opt/jre/
cd /opt/jdk/
sudo tar -zxf jre-8u271-linux-x64.tar.gz
sudo update-alternatives --install /usr/bin/java java /opt/jre/jre1.8.0_251/bin/java 100
sudo update-alternatives --display java
sudo update-alternatives --config java
sudo  nano /etc/environment
    JAVA_HOME=/opt/jre/jre1.8.0_251
    JRE_HOME=/opt/jre/jre1.8.0_251/jre
source /etc/environment
echo $JAVA_HOME
java -version

### Install Samba
source: https://vitux.com/how-to-install-and-configure-samba-on-ubuntu/

- sudo apt install samba
- sudo systemctl status nmbd
- sudo nano /etc/samba/smb.conf
    [samba-share]
    comment = Samba on Ubuntu
    path = /samba
    read only = no
    guest ok = no
    browsable = yes
    valid user = user
- sudo smbpasswd -a username
- sudo service smbd restart (or sudo systemctl restart smbd.service)
- ip a (or ipconfig) to get ip address of samba server
- sudo apt install smbclient
- sudo smbclient //[IP_address or Host_name]/share_name –U username
- GUI > connect to server: smb:// [IP_address or Host_name]/[share_name]

### Node Version Manager (NVM) for Node and NPM
source: https://tecadmin.net/install-nodejs-with-nvm/
- curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
- source ~/.profile (Reload system environment)
- nvm ls-remote (list available node versions)
- nvm install v12.18.2 (pick the one you like and install with this command)
- nvm list (lets you see what is installed)
- nvm use v12.18.2 (sets the current usable version)
- node --version (checks current version)
- npm --version (checks current version)
- nvm uninstall v4.9.1 (lets you uninstall specific version)

### Apps to install
Use script to install this apps

### Terminal Apps
- htop
- bmon
- neofetch
- screen
- tmux

### Gui Apps
- Bookworm ebook reader
- Chrome Browser
- Discord
- Glimpse Image Editor
- Raspberry Pi Imager
- InkScape
- Lutris
- MultiMC
- NextCloud Desktop Client
- NoMachine
- OBS
- OpenShot Video Editor
- Synaptic Package Manager
- TeamViewer
- Thunderbird
- VeraCrypt
- VirtualBox
- VLC
- VS Codium
- WinFF
- Zoom
- Git



