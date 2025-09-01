#!/bin/bash

# Get list of active players
players=$(playerctl -l 2>/dev/null)

# If no players, exit
if [ -z "$players" ]; then
    echo ""
    exit
fi

# Find the player that is currently playing
player=$(echo "$players" | while read -r p; do
    status=$(playerctl -p "$p" status 2>/dev/null)
    if [ "$status" = "Playing" ]; then
        echo "$p"
        exit
    fi
done)

# If no active player is playing, fallback to the first one
if [ -z "$player" ]; then
    player=$(echo "$players" | head -n 1)
fi

# Get status
status=$(playerctl -p "$player" status 2>/dev/null)

# Choose control icon based on status
if [ "$status" = "Playing" ]; then
    control_icon=""  # pause
elif [ "$status" = "Paused" ]; then
    control_icon=""  # play
else
    control_icon=""  # stop
fi

# Map players to icons
case "$player" in
    vlc)
        app_icon="󰕼"   # VLC cone
        ;;
    firefox)
        app_icon=""   # Firefox
        ;;
    mpv)
        app_icon=""   # MPV (Nerd Font play-circle)
        ;;
    spotify)
        app_icon=""   # Spotify
        ;;
    *)
        app_icon="󰝚"   # Generic play icon
        ;;
esac

# Output app icon + status icon
echo "$app_icon $control_icon"
