#!/usr/bin/env bash

BASE_DIR="$HOME/Downloads/my-scripts/daily-habits"

YEAR=$(date +"%Y")
MONTH_YEAR=$(date +"%b%y" | tr '[:upper:]' '[:lower:]')
mkdir -p "$BASE_DIR/$YEAR"

LOG_FILE="$BASE_DIR/$YEAR/habits_log_${MONTH_YEAR}.md"
DATE=$(date +"%Y-%m-%d")

# Ensure header exists
if ! grep -q "^| Date" "$LOG_FILE" 2>/dev/null; then
    echo "| Date       | Exercise | Water | Study | Sleep | Mobile Screen-Time |" > "$LOG_FILE"
    echo "|------------|----------|-------|-------|-------|---------------------|" >> "$LOG_FILE"
fi

# Helper to ask yes/no
ask_yes_no() {
    zenity --question --title="$1" --text="$2" --ok-label="Yes" --cancel-label="No"
    if [[ $? -eq 0 ]]; then echo "Yes"; else echo "No"; fi
}

# Ask habits
EXERCISE=$(ask_yes_no "Exercise" "Did you exercise today?")
WATER=$(ask_yes_no "Water" "Did you drink 3L of water?")
STUDY=$(ask_yes_no "Study" "Did you study 6 hours?")

# Sleep hours
SLEEP=$(zenity --entry --title="Sleep Hours" --text="How many hours did you sleep? (e.g. 7)")

# Mobile screen-time
SCREEN_TIME=$(zenity --entry --title="Mobile Screen-Time" --text="How many hours did you use your mobile today? (e.g. 2)")

# Append entry
echo "| $DATE | $EXERCISE | $WATER | $STUDY | $SLEEP | $SCREEN_TIME |" >> "$LOG_FILE"
