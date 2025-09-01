#!/usr/bin/env bash

BASE_DIR="$HOME/Downloads/my-scripts/am-i-happy"

YEAR=$(date +"%Y")
MONTH_YEAR=$(date +"%b%y" | tr '[:upper:]' '[:lower:]')
mkdir -p "$BASE_DIR/$YEAR"

LOG_FILE="$BASE_DIR/$YEAR/happiness_log_${MONTH_YEAR}.md"
DATE=$(date +"%Y-%m-%d")

# Ensure header exists
if ! grep -q "^| Date" "$LOG_FILE" 2>/dev/null; then
    echo "| Date       | Happy? | Notes |" > "$LOG_FILE"
    echo "|------------|--------|-------|" >> "$LOG_FILE"
fi

# Ask are you happy?
zenity --question \
    --title="Daily Happiness Check" \
    --text="Are you happy today?" \
    --ok-label="Yes" \
    --cancel-label="No"

if [[ $? -eq 0 ]]; then
    ANSWER="Yes"
else
    ANSWER="No"
fi

# Ask for note
NOTES=$(zenity --entry \
    --title="What did you do today?" \
    --text="Write a short note (optional):")

# Escape pipes in note so markdown isn't messed up
NOTES="${NOTES//|/-}"

# Append entry (no manual width padding)
echo "| $DATE | $ANSWER | $NOTES |" >> "$LOG_FILE"
