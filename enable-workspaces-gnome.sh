#!/bin/bash

# Number of workspaces
NUM_WORKSPACES=10

# Disable dynamic workspaces
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces $NUM_WORKSPACES

# Loop over workspaces 1–10
for i in $(seq 1 $NUM_WORKSPACES); do
    # Use 0 for workspace 10
    if [ "$i" -eq 10 ]; then
        key="0"
    else
        key="$i"
    fi

    # Switch workspace
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Super>$key']"
    
    # Move window to workspace
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$i "['<Super><Shift>$key']"
    
    # Disable default Super+Number app-launching
    gsettings set org.gnome.shell.keybindings switch-to-application-$i "[]"
done

echo "GNOME workspace shortcuts set for 10 workspaces (Super+1…0)."

