#!/bin/bash

# Variables

CHECKMARK=$(printf '\u2713')

RESET='\e[0m'

BLUE='\e[34m'
YELLOW='\e[33m'
GREEN='\e[32m'
RED='\e[31m'

BOLD_BLUE='\e[1;34m'
BOLD_YELLOW='\e[1;33m'
BOLD_GREEN='\e[1;32m'
BOLD_RED='\e[1;31m'

DIM_BLUE='\e[2;34m'
DIM_YELLOW='\e[2;33m'
DIM_GREEN='\e[2;32m'
DIM_RED='\e[2;31m'

# Execute function

timestamp() { date "+%Y-%m-%d %H:%M:%S"; }

execute() {
  local msg="$1"
  local cmd="$2"
  shift
  printf "${BLUE}%s${RESET}\n" "-> $msg @ $(timestamp)"
  printf "%s\n" "   Executing: $cmd"
  eval "$cmd"
}

if [ -z "$HOME" ]; then
  printf "${BOLD_RED}%s${RESET}" "ERROR: \$HOME is not set. Aborting... "
  exit 1
fi

printf "${BLUE}%s${RESET}\n" "-> Starting symlinking files and dirs @ $(timestamp)"

# Install fonts
printf "${BLUE}%s${RESET}\n" "-> Installing fonts @ $(timestamp)"
printf "${BLUE}%s${RESET}\n" "-> Checking if fonts directory exists @ $(timestamp)"

if [ -d "$HOME/.local/share/fonts" ]; then
  # Directory exists
  printf "${BLUE}%s${RESET}\n" "-> Found fonts directory @ $(timestamp)"
else
  # Directory does not exist
  printf "${YELLOW}%s${RESET}\n" "-> Could not find fonts directory @ $(timestamp)"
  execute "Creating fonts directory" "mkdir -p \"$HOME/.local/share/fonts\""
fi

execute "Copying JetBrainsMono Nerd Font" "cp -r $HOME/.local/share/chezmoi/home/dot_local/share/fonts/JetBrainsMonoNerdFont $HOME/.local/share/fonts/"
execute "Refreshing font cache" "fc-cache -f -v"
printf "${BOLD_GREEN}%s %s${RESET}\n\n" "$CHECKMARK" " Successfully installed fonts @ $(timestamp)"

# Step 9: Install icons and themes

#Icons
printf "${BLUE}%s${RESET}\n" "-> Installing icons @ $(timestamp)"
printf "${BLUE}%s${RESET}\n" "-> Checking if icons directory exists @ $(timestamp)"

if [ -d "$HOME/.icons" ]; then
  # Directory exists
  printf "${BLUE}%s${RESET}\n" "-> Found icons directory @ $(timestamp)"
else
  # Directory does not exist
  printf "${YELLOW}%s${RESET}\n" "-> Could not find icons directory @ $(timestamp)"
  execute "Creating icons directory" "mkdir -p \"$HOME/.icons\""
fi

execute "Symlinking Material Black Cherry icon theme" "ln -sfT $HOME/.local/share/chezmoi/home/.icons/Material_Black_Cherry $HOME/.icons/Material_Black_Cherry"
execute "Symlinking Oreo Red cursor theme" "ln -sfT $HOME/.local/share/chezmoi/home/.icons/oreo_red_cursor $HOME/.icons/oreo_red_cursor"
printf "${BOLD_GREEN}%s %s${RESET}\n\n" "$CHECKMARK" " Successfully installed icons @ $(timestamp)"

#Themes
printf "${BLUE}%s${RESET}\n" "-> Installing themes @ $(timestamp)"
printf "${BLUE}%s${RESET}\n" "-> Checking if themes directory exists @ $(timestamp)"

if [ -d "$HOME/.themes" ]; then
  # Directory exists
  printf "${BLUE}%s${RESET}\n" "-> Found themes directory @ $(timestamp)"
else
  # Directory does not exist
  printf "${YELLOW}%s${RESET}\n" "-> Could not find themes directory @ $(timestamp)"
  execute "Creating themes directory" "mkdir -p \"$HOME/.themes\""
fi

execute "Symlinking Material Black Cherry GTK theme" "ln -sfT $HOME/.local/share/chezmoi/home/.themes/Material_Black_Cherry $HOME/.themes/Material_Black_Cherry"
printf "${BOLD_GREEN}%s %s${RESET}\n\n" "$CHECKMARK" " Successfully installed themes @ $(timestamp)"

printf "${BOLD_GREEN}%s %s${RESET}\n\n" "$CHECKMARK" " Successfully configured directories @ $(timestamp)"
