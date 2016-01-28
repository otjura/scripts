#!/bin/bash
#Otson iloinen post-install
yum update -y
yum localinstall --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
yum install http://linuxdownload.adobe.com/adobe-release/adobe-release-x86_64-1.0-1.noarch.rpm -y
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux
yum update -y
yum group install kde-desktop-environment -y
yum group mark install kde-desktop-environment
yum install flash-plugin snes9x kigo gstreamer-plugins-good gstreamer-plugins-ugly gstreamer-plugins-bad gstreamer-ffmpeg xine-lib-extras-freeworld smplayer kffmpegthumbnailer kdemultimedia-extras-freeworld kate kopete kdevelop konversation gimp digikam kdenlive  -y
echo "Weeeeee!!! It is doned! Restartings nao pls"
shutdown -r 1
