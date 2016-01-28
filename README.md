Collection of bash scripts. YMMV.

baloo-refresh.sh
- At least in KDE 4.x, file indexer sometimes doesn't index things properly.
this fixes it.

downloadsorter.sh
- All the things in Download folder to proper places.

f20-kde-post-install.sh, f20-post-install.sh and f21-kde-post-install.sh
- Post-install scripts for Fedora. highly personalized so don't use
before reading what they do!

gnome310-post-install.sh
- setups GNOME 3.10 via gsettings to be a bit better

plasma-restart.sh
- Plasma 5.3 tends to glitch a bit. this replicates GNOME's Mutter
reset functionality (alt+f2, r).

removecharacter.sh
- self-explanatory

space2underscore.sh
- self-explanatory

restorerights.sh
- restoring backups from NTFS apparently stamps everything 777, this restores file and folder rights to default 644 and 755 
