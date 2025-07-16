#!/bin/bash

# Path to your Hyprland config
config_file="$HOME/.config/hypr/hyprland.conf"

# Extract keybinds from the config
keybinds=$(grep -E '^bind' "$config_file")

# If no keybinds found, exit
if [[ -z "$keybinds" ]]; then
  echo "No keybinds found in $config_file"
  exit 1
fi

# Replace $mainMod with SUPER for clarity
display_keybinds=$(echo "$keybinds" | sed 's/\$mainMod/SUPER/g')

# Display keybinds using wofi
echo "$display_keybinds" | wofi --dmenu --prompt "Hyprland Keybindings"

exit 0
