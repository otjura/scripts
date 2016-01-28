#!/bin/sh
#Otson skripti Fedora 20 64bit GNOME
# >>> run as root <<< #
echo
sudo yum -y localinstall --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo yum -y install http://linuxdownload.adobe.com/adobe-release/adobe-release-x86_64-1.0-1.noarch.rpm
sudo rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux
sudo yum update -y
sudo yum -y group install gnome-desktop-environment
sudo yum group mark install gnome-desktop-environment
sudo yum -y install flash-plugin gstreamer-plugins-good gstreamer-plugins-ugly gstreamer-plugins-bad gstreamer-ffmpeg icedtea-web ffmpegthumbnailer devilspie gnome-tweak-tool alacarte gnome-epub-thumbnailer gnome-classic-session evolution-ews evolution-mapi mail-notification-evolution-plugin libreoffice-voikko unrar p7zip p7zip-plugins gnome-weather gnome-maps gnome-boxes transmission epiphany make cmake gcc gcc-c++ ghc git wget freemind l3afpad snes9x vim-enhanced geany geany-themes gedit gedit-plugins eog python3-tools audacious audacious-plugins* audacity pitivi
echo
gsettings set org.gnome.shell always-show-log-out true
echo "Always shows log out"
gsettings set org.gnome.shell.calendar show-weekdate true
echo "Weekdate visible on calendar"
gsettings set org.gnome.shell.overrides workspaces-only-on-primary false
echo "Workspaces on all displays"
gsettings set org.gnome.shell.overrides dynamic-workspaces false
echo "Dynamic workspaces disabled, four normal ones instead"
gsettings set org.gnome.shell.app-switcher current-workspace-only true
gsettings set org.gnome.shell.window-switcher current-workspace-only true
echo "Alt-tab shows just apps of current workspace"
mkdir ~/bin
mkdir ~.devilspie
touch ~.devilspie/flash-fullscreen-firefox.ds
echo '(if(is (application_name) "plugin-container")(begin(focus)))' > ~.devilspie/flash-fullscreen-firefox.ds
echo "Fullscreen Flash problem in Firefox worked around"
echo 
echo "All Done! Restart to finish installation!"
