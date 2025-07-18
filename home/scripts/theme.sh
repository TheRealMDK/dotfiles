#!/bin/bash

wallpaper="$1"

matugen image $wallpaper -m "dark"
wallust run $wallpaper
hyprctl reload
