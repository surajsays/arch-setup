#!/bin/bash

# ICON_RESOLUTIONS=""   # checklist
# ICON_HAPPY=""        # smiley
# ICON_HABITS=""       # leaf/nature

# choice=$(echo -e "$ICON_RESOLUTIONS  Daily Resolutions\n$ICON_HAPPY  Am I Happy\n$ICON_HABITS  Daily Habits" \
#     | rofi -dmenu -p " Menu:")

# case "$choice" in
#     "$ICON_RESOLUTIONS  Daily Resolutions") ~/Downloads/my-scripts/Resolutions/daily-resolutions.sh ;;
#     "$ICON_HAPPY  Am I Happy") ~/Downloads/my-scripts/am-i-happy/happy-check.sh ;;
#     "$ICON_HABITS  Daily Habits") ~/Downloads/my-scripts/daily-habits/daily-habit-check.sh ;;
# esac






#!/bin/bash

# ICON_RESOLUTIONS=""   # checklist
# ICON_HAPPY=""        # smiley
# ICON_HABITS=""       # leaf/nature
# ICON_MUSIC=""        # music note for Amberol

# choice=$(echo -e "$ICON_RESOLUTIONS  Daily Resolutions\n$ICON_HAPPY  Am I Happy\n$ICON_HABITS  Daily Habits\n$ICON_MUSIC  Amberol" \
#     | rofi -dmenu -p " Menu:")

# case "$choice" in
#     "$ICON_RESOLUTIONS  Daily Resolutions") ~/Downloads/my-scripts/Resolutions/daily-resolutions.sh ;;
#     "$ICON_HAPPY  Am I Happy") ~/Downloads/my-scripts/am-i-happy/happy-check.sh ;;
#     "$ICON_HABITS  Daily Habits") ~/Downloads/my-scripts/daily-habits/daily-habit-check.sh ;;
#     "$ICON_MUSIC  Amberol") ~/.config/polybar/scripts/amberol-dark.sh ;;
# esac






#!/bin/bash

# ICON_RESOLUTIONS=""   # checklist
# ICON_HAPPY=""        # smiley
# ICON_HABITS=""       # leaf/nature
# ICON_MUSIC=""        # music note

# choice=$(echo -e "── Personal ──\n$ICON_RESOLUTIONS  Daily Resolutions\n$ICON_HAPPY  Am I Happy\n$ICON_HABITS  Daily Habits\n\n── Music ──\n$ICON_MUSIC  Amberol" \
#     | rofi -dmenu -p " Menu:")

# case "$choice" in
#     "$ICON_RESOLUTIONS  Daily Resolutions") ~/Downloads/my-scripts/Resolutions/daily-resolutions.sh ;;
#     "$ICON_HAPPY  Am I Happy") ~/Downloads/my-scripts/am-i-happy/happy-check.sh ;;
#     "$ICON_HABITS  Daily Habits") ~/Downloads/my-scripts/daily-habits/daily-habit-check.sh ;;
#     "$ICON_MUSIC  Amberol") ~/.config/polybar/scripts/amberol-dark.sh ;;
# esac












#!/bin/bash

ICON_RESOLUTIONS=""   # checklist
ICON_HAPPY=""       # smiley
ICON_HABITS=""       # leaf/nature
#ICON_MUSIC=""        # music note
ICON_YOUTUBE=""      # YouTube icon

choice=$(echo -e "── Personal ──\n$ICON_RESOLUTIONS  Daily Resolutions\n$ICON_HAPPY  Am I Happy\n$ICON_HABITS  Daily Habits\n\n── Music ──\n$ICON_YOUTUBE  YouTube Downloader" \
    | rofi -dmenu -p " Menu:")

case "$choice" in
    "$ICON_RESOLUTIONS  Daily Resolutions") ~/Downloads/my-scripts/Resolutions/daily-resolutions.sh ;;
    "$ICON_HAPPY  Am I Happy") ~/Downloads/my-scripts/am-i-happy/happy-check.sh ;;
    "$ICON_HABITS  Daily Habits") ~/Downloads/my-scripts/daily-habits/daily-habit-check.sh ;;
    #"$ICON_MUSIC  Amberol") ~/.config/polybar/scripts/amberol-dark.sh ;;
    "$ICON_YOUTUBE  YouTube Downloader") ~/.config/polybar/scripts/youtube-dl.sh ;;
esac
