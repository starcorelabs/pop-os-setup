# POP OS Setup
This a collection of terminal commands I use to setup apps after installing / reinstalling POP OS.

You'll need to know Linux terminal before attempting to follow these steps.

WARNING THIS WILL DELETE YOUR EXISTING OPERATING SYSTEM AND ALL OF YOUR DATA. <br/>
USE AT YOUR OWN RISK!

Backup your data before following and/or using these steps or the script. 

I recommend reading through the whole file once before using it.

### Download the ISO here:
- [POP OS](https://pop.system76.com/)

### Use Etcher or Ventoy to create a bootable USB drive:
- [Balena Etcher](https://www.balena.io/etcher/)
- [Ventoy](https://www.ventoy.net/en/index.html) (preferred)

Once you have the bootable drive you'll restart your target PC with the drive inserted.

Access the [BIOS/UEIF](https://www.howtogeek.com/56958/HTG-EXPLAINS-HOW-UEFI-WILL-REPLACE-THE-BIOS/) and select the bootable USB drive you created to load. Or, use the BOOT MEDIA option to pick the the bootable USB drive when PC starts up. 

You'll have to look up the key combination for your specific hardware to access BIOS/UEIF or BOOT MEDIA. Because different hardware uses different access methods. 

Once you successfully load the bootable flash drive POP OS should boot and load a live version. A minute later the installer will automatically load.

Again, if you haven't done so I recommend backing up all your data before installing POP OS. 
I do not recommend dual booting because any issues with one OS will affect both. 

If you want to test these steps and/or my script. You can install POP OS in [VirtualBox](https://www.virtualbox.org/) which I wrote a post about here: [Dev Lab](http://starcorelabs.com/blog/dev-lab/)

At this point you can begin installing POP OS on your PC.
Follow the prompts and answer the questions. 

At the end your computer will reboot. Remove the USB drive.
Then when it comes up it will ask you to create a new username and password.
This is your account. Remember your password.

After that's done you'll be on the desktop with a default wallpaper.
At the top left of the screen you'll see "Activities". 

Click on it and you'll see a dock on the left side of your screen with icons.
Hover over them and click the one that says, "Terminal". 

A black box with white text will open. 

Now you can follow the post-install steps below. 

### Update and Upgrade
```shell
    sudo apt update && sudo apt upgrade -y
```
### Install Restricted Formats
```shell
    sudo apt-get install ubuntu-restricted-extras
```
### Hostname
By default your new PC is named "POP!_OS". If this doesn't bother you then keep it.

But you have the option to customize it. 

- Click on the "Activities" button at the top left of your screen.
- On the left side of the screen look at the dock
- Find the bottom icon that looks like a grid of dots. This is "Show all". 
- Left-click it to open the list of installed apps
- Look for "Settings" and left-click it to open
- Use your mouse to scoll to the bottom of the left menu and left-click "About"
- You'll see in the right panel "Device Name"
- Left-click it and a box will open giving you the option to rename your computer.
- Once its renamed you'll need to close all open windows. 

The next time you open a terminal you'll see "your-username@your-hostname".

Plus anytime you connect to this computer through Samba it will have this new name.

### Dash to Dock
The left-side dock is great for quickly opening apps and switching between open apps. 
By default it is only open when you click the "Activities" button at the top left.

We can install a shell extension that will make it visible all the time.

- Install Chrome [GNOME Shell integration](https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep) extension 
- [Dash to Dock](https://extensions.gnome.org/extension/307/dash-to-dock/)
- Push button on screen from "Off" to "On"

### Install Oracle Java
I use Oracle Java for running Minecraft. Currently only version 8 of Java works. 
- This tutorial showed me how to install [Oracle Java 8 tutorial](https://www.fosstechnix.com/install-oracle-java-8-on-ubuntu-20-04/)
- Download oracle java 8 jre (not jdk) [Oracle JRE8](https://www.oracle.com/java/technologies/javase-jre8-downloads.html)
- Agree and Sign-In to download (If you don't have an account. You can make one for free.)
- Once downloaded open a terminal by right-clicking anywhere in the folder and left-click "Open in Terminal".
- In the terminal run each command one at a time. (copy and paste to save time)

```shell
    sudo mkdir -p /opt/jre
    sudo cp -rf jre-8u271-linux-x64.tar.gz /opt/jre
    cd /opt/jre
    sudo tar -zxf jre-8u271-linux-x64.tar.gz
    sudo update-alternatives --install /usr/bin/java java /opt/jre/jre1.8.0_271/bin/java 100
    sudo update-alternatives --display java
    sudo update-alternatives --config java
    sudo nano /etc/environment
```
Inside nano terminal text editor add these lines under any existing text.
```shell
    JAVA_HOME=/opt/jre/jre1.8.0_271
    JRE_HOME=/opt/jre/jre1.8.0_271/jre
```
Use ctrl + o to save and ctrl + x to exit. 

Back in the terminal run each command one at a time.
```shell
    source /etc/environment
    echo $JAVA_HOME
    java -version
```

### Install Samba
- This tutorail taught me how to install [Samba](https://vitux.com/how-to-install-and-configure-samba-on-ubuntu/).
- Samba is used for file sharing between local computers.
- Open a terminal and run each command one at a time. 
```shell
    sudo apt install samba
    sudo systemctl status nmbd
    sudo nano /etc/samba/smb.conf
```
That last command will open nano terminal text editor.
Press the down arrow key on your keyboard to scroll to the bottom of the file.
Below all existing text you'll add entries for folders you want to share.
You need separate entries for each folder you want to share.
Here's an example. You'll replace the name in brackets, user, and path to fit your system.

```shell
    [samba-share]
    comment = Samba on Ubuntu
    path = /home/user/folder
    read only = no
    guest ok = no
    browseable = yes
    valid user = user
```
Once complete use ctrl + o to save the file and ctrl + x to exit nano terminal text editor.
Then you'll want to test your work to make sure there were no errors.
In the terminal run the following command.

```shell
    testparm
```
You'll see a message that says, "Press enter to see a dump of your service definitions".
When you do it will show a list of your shares. Make sure everything is spelled and spaced correctly.


Now you need to create a user for Samba. In the terminal run each command one at a time. Replace username with your own user name. 
```shell
- sudo smbpasswd -a username
- sudo service smbd restart (or sudo systemctl restart smbd.service)
- ip a (or ipconfig) to get ip address of samba server
```

### Node Version Manager (NVM) for Node and NPM
- [NVM install tutorial](https://tecadmin.net/install-nodejs-with-nvm/)
- curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
- source ~/.profile (Reload system environment)
- nvm ls-remote (list available node versions)
- nvm install v12.18.2 (pick the one you like and install with this command)
- nvm list (lets you see what is installed)
- nvm use v12.18.2 (sets the current usable version)
- node --version (checks current version)
- npm --version (checks current version)
- nvm uninstall v4.9.1 (lets you uninstall specific version)

### Post install apps 
- I learned how to write my own script by following this tutorial [Post install script tutorial](https://www.addictivetips.com/ubuntu-linux-tips/make-ubuntu-post-installation-script/).
- You can write your own or download my "pop-os-install-script.sh" from this repo to install the apps listed below.
- First, you'll need to give the file permission to run as a script. 
- Right-click the file and a new menu will pop up. At the bottom left-click "Properties".
- The Properties box will open. At the top click "Permissions".
- Near the bottom check the box that says, "Allow executing file as program". 
- Close the box and right-clicking anywhere in the folder. Then select "Open in Terminal".
 
Alternatively, if you prefer to use the terminal you can accomplish the same effect by opening a terminal in the same folder as my script. Then typing: 

```shell
    sudo chmod +x pop-os-install-script.sh
```
- If successful it will return an empty prompt. Only errors are reported. 
- To run the install script type: sh pop-os-install-script.sh 
- Press enter. You'll be asked for your password. Then the script will run and install the following apps. 

### Gui Apps
- Bookworm ebook reader
- Brave Browser
- Chrome Browser
- Discord
- Git
- Glimpse Image Editor
- Raspberry Pi Imager
- InkScape
- Lutris
- MultiMC
- NextCloud Desktop Client
- NoMachine
- OBS
- Synaptic Package Manager
- TeamViewer
- Thunderbird
- VeraCrypt
- VirtualBox
- VLC
- VS Codium
- WinFF

### Terminal Apps
I've also made a second script called terminal-apps.sh.<br/>
It will install the following:
- neofetch
- htop
- tmux
- screen
- ranger
- bmon
- iftop
- irssi
- lsof
- lynx
- feh
- netcat
- nmap
- mplayer
- basetet
- cmatrix

### Enable Minimize and Maximize Buttons
Out of the box POP OS doesn't have min or max buttons on windows. 
This is annoying. We can use Gnome Tweaks to fix it.

- Click "Activities > Dock > Show All" and open "Tweaks"
- Click Window Titlebars and turn on minimize and maximize buttons
- Click Top Bar and turn on Weekday