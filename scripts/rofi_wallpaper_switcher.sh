#!/bin/bash

WallDir=~/.config/hypr/wallpapers

ROFI_THEME=~/.config/rofi/wallpaper-switcher-theme.rasi

SELECTION=$(ls $WallDir | while read imageFile ; do  echo -en "$imageFile\x00icon\x1f$WallDir/$imageFile\n" ; done | rofi -dmenu -show-icons -p "Wallpaper" -theme $ROFI_THEME)

matugen -t scheme-content --prefer saturation image $WallDir/$SELECTION

awww img $WallDir/$SELECTION --transition-type wipe --transition-fps 75 --transition-step 255    

if [ $SELECTION != " " ]; then
	notify-send "Theme Updated!"
fi
