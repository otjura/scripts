#!/bin/bash
#Initial usability tweaks for vanilla GNOME 3.10.
#Run as user.
gsettings set org.gnome.shell always-show-log-out true
echo "Logout now always visible"
gsettings set org.gnome.desktop.interface toolbar-icons-size 'small'
echo "Toolbars now have small icons where applicable"
gsettings set org.gnome.desktop.interface font-name 'Cantarell 10'
gsettings set org.gnome.desktop.interface monospace-font-name 'Monospace 10'
gsettings set org.gnome.desktop.interface document-font-name 'Sans 10'
echo "Font is now 10px instead of 11px"
gsettings set org.gnome.settings-daemon.plugins.xsettings hinting 'full'
gsettings set org.gnome.settings-daemon.plugins.xsettings antialiasing 'rgba'
echo "Font hinting full and anti-aliasing rgb"
gsettings set org.gnome.shell.calendar show-weekdate true
echo "Calendar now shows week number"
gsettings set org.gnome.shell.app-switcher current-workspace-only true
gsettings set org.gnome.shell.window-switcher current-workspace-only true
echo "Alt-tab now shows only apps of current workspace"
gsettings set org.gnome.shell.overrides attach-modal-dialogs false
echo "Dialog windows now freely movable"
gsettings set org.gnome.shell.overrides workspaces-only-on-primary false
echo "Workspaces now usable on all displays"
gsettings set org.gnome.shell.overrides dynamic-workspaces false
echo "Dynamic workspaces off, now four static workspaces"
gsettings set org.gnome.desktop.wm.keybindings resize-with-right-button true
echo "Windows now resizable with super+rmb combo"
gsettings set 



