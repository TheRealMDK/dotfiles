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

printf "${BLUE}%s${RESET}\n" "-> Starting directory configurations @ $(timestamp)"

# Nvim

printf "${BLUE}%s${RESET}\n" "-> Checking if $HOME/.config/nvim/lua/plugins/ directory exists @ $(timestamp)"

if [ -d "$HOME/.config/nvim/lua/plugins" ]; then
  # Directory exists
  printf "${BLUE}%s${RESET}\n" "-> Found $HOME/.config/nvim/lua/plugins/ directory @ $(timestamp)"
else
  # Directory does not exist
  printf "${YELLOW}%s${RESET}\n" "-> Could not find $HOME/.config/nvim/lua/plugins/ directory @ $(timestamp)"
  execute "Creating $HOME/.config/nvim/lua/plugins/ directory" "mkdir -p \"$HOME/.config/nvim/lua/plugins\""
fi
printf "${BOLD_GREEN}%s %s${RESET}\n\n" "$CHECKMARK" " Successfully Created $HOME/.config/nvim/lua/plugins/ directory @ $(timestamp)"

# Waybar

printf "${BLUE}%s${RESET}\n" "-> Checking if $HOME/.config/waybar/scripts/ directory exists @ $(timestamp)"

if [ -d "$HOME/.config/waybar/scripts" ]; then
  # Directory exists
  printf "${BLUE}%s${RESET}\n" "-> Found $HOME/.config/waybar/scripts/ directory @ $(timestamp)"
else
  # Directory does not exist
  printf "${YELLOW}%s${RESET}\n" "-> Could not find $HOME/.config/waybar/scripts/ directory @ $(timestamp)"
  execute "Creating $HOME/.config/waybar/scripts/ directory" "mkdir -p \"$HOME/.config/waybar/scripts\""
fi
printf "${BOLD_GREEN}%s %s${RESET}\n\n" "$CHECKMARK" " Successfully Created $HOME/.config/waybar/scripts/ directory @ $(timestamp)"

# Yazi

printf "${BLUE}%s${RESET}\n" "-> Checking if $HOME/.config/yazi/flavors/ashen.yazi/ directory exists @ $(timestamp)"

if [ -d "$HOME/.config/yazi/flavors/ashen.yazi" ]; then
  # Directory exists
  printf "${BLUE}%s${RESET}\n" "-> Found $HOME/.config/yazi/flavors/ashen.yazi/ directory @ $(timestamp)"
else
  # Directory does not exist
  printf "${YELLOW}%s${RESET}\n" "-> Could not find $HOME/.config/yazi/flavors/ashen.yazi/ directory @ $(timestamp)"
  execute "Creating $HOME/.config/yazi/flavors/ashen.yazi/ directory" "mkdir -p \"$HOME/.config/yazi/flavors/ashen.yazi\""
fi
printf "${BOLD_GREEN}%s %s${RESET}\n\n" "$CHECKMARK" " Successfully Created $HOME/.config/yazi/flavors/ashen.yazi/ directory @ $(timestamp)"

printf "${BOLD_GREEN}%s %s${RESET}\n\n" "$CHECKMARK" " Successfully configured directories @ $(timestamp)"
