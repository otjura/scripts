###################################################
# Fedora 21 KDE 64bit post-install script v0.1
#      !!! no guarantees whatsoever !!!

#################
## RUN AS ROOT ##
#################

#initial system update
yum update -y
#enable RPMFusion repository
yum localinstall --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
yum update -y
#remove crap
yum remove kruler.x86_64 fedora-release-notes.noarch liveusb-creator.noarch krusader.x86_64 calligra-* kmahjongg.x86_64 kpat.x86_64 kmines.x86_64 kget.x86_64 k3b.x86_64 dragon.x86_64 kscd.x86_64 -y
yum autoremove -y
#install goods
yum install kate.x86_64 libreoffice.x86_64 libreoffice-kde.x86_64 libreoffice-voikko.x86_64 homerun.x86_64 screenfetch.noarch git.x86_64 vim-enhanced.x86_64 vim-X11.x86_64 freemind.noarch dia.x86_64 speedcrunch.x86_64 htop.x86_64 ghc.x86_64 java-1.8.0-openjdk-devel.x86_64 java-1.8.0-openjdk-javadoc.noarch icedtea-web.x86_64 oxygen-fonts.noarch oxygen-mono-fonts.noarch oxygen-sans-fonts.noarch firefox.x86_64 gcc-c++.x86_64 kde-connect.x86_64 knights.x86_64 kigo.x86_64 qt-recordmydesktop.noarch gimp.x86_64 gimp-help.noarch python3-tools.x86_64 dosbox_x86_64 -y
#install goods from rpmfusion
yum install kffmpegthumbnailer.x86_64 smplayer.x86_64 gstreamer-plugins-{good-extras,bad,bad-nonfree,ugly}.x86_64 gstreamer1-libav.x86_64 gstreamer1-plugins-{ugly,good,good-extras,bad,bad-freeworld,bad-free}.x86_64 snes9x.x86_64 p7zip.x86_64 unar.x86_64 unrar.x86_64 -y
