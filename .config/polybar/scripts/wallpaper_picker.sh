#!/bin/bash

# Folder where wallpapers are stored
DIR="$HOME/Pictures/Wallpapers"

# Predefined list of wallpapers
WALLPAPERS=(
nordic.png
shinchan2.jpg
anime-girl-room-guitar.jpg
my-neighbor-totoro-sunflowers.png
dark_forest.png
Tanjiro.png
seashore.jpg
field.jpeg
wallhaven-lmxwdl.jpg
lofi-cafe_gray.jpg
totoro.jpg
0393.jpg
interstellar_wallpaper.png
train.jpg
18.jpg
totro2.jpg
shinchan.jpg
frame-13.png
maxresdefault.jpg
clouds.jpg
hills.jpg
train-custome.jpg
ign-waifu.png
train_and_lake.png
gruvbox_forest-4.png
117497448_p0.jpg

)

# Show list in rofi
SELECTED=$(printf "%s\n" "${WALLPAPERS[@]}" | rofi -dmenu -i -p "Select wallpaper:")

# Apply selected wallpaper
if [ -n "$SELECTED" ]; then
    feh --bg-scale "$DIR/$SELECTED"
fi
