#!/bin/bash

# Folder where wallpapers are stored
DIR="$HOME/Pictures/Wallpapers"

# Predefined list of wallpapers
WALLPAPERS=(
nordic.png
train_and_lake_edited.png
train-edited.png
anime-girl-room-guitar.jpg
my-neighbor-totoro-sunflowers.png
dark_forest.png
ign-waifu-edited.png
Tanjiro.png
seashore.jpg
field.jpeg
lofi-cafe_gray.jpg
totoro.jpg
0393.jpg
train.jpg
18.jpg
totro2.jpg
clouds.jpg
arch-edited.png
ign-waifu.png
train_and_lake.png
wallpaper8.png
gruvbox_forest-4.png
)

# Show list in rofi
SELECTED=$(printf "%s\n" "${WALLPAPERS[@]}" | rofi -dmenu -i -p "Select wallpaper:")

# Apply selected wallpaper
if [ -n "$SELECTED" ]; then
    feh --bg-scale "$DIR/$SELECTED"
fi
