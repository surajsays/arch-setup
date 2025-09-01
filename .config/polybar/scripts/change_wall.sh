
#!/bin/bash
# Directory containing wallpapers
DIR="$HOME/Pictures/Wallpapers"

# Random wallpaper
# feh --bg-fill "$(find "$DIR" -type f | shuf -n 1)"

feh --bg-scale "$(find "$DIR" -type f | shuf -n 1)"
