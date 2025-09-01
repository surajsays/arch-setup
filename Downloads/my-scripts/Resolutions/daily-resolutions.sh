#!/bin/bash

SCRIPT_DIR="$HOME/Downloads/my-scripts/Resolutions"
YEAR=$(date +%Y)
MONTH=$(date +%m)
DAY=$(date +%d)

DIR="$SCRIPT_DIR/$YEAR"
FILE="$DIR/$MONTH.md"

mkdir -p "$DIR"

# Create monthly file if not exists
if [ ! -f "$FILE" ]; then
    echo "# Resolutions for $MONTH-$YEAR" > "$FILE"
    echo "" >> "$FILE"
fi

choice=$(zenity --list --title="Daily Resolutions" \
    --column="Action" "Add Resolutions" "Mark Today's Resolutions")

if [[ "$choice" == "Add Resolutions" ]]; then
    # Add today's header if missing
    if ! grep -q "## $DAY-$MONTH-$YEAR" "$FILE"; then
        echo "" >> "$FILE"
        echo "## $DAY-$MONTH-$YEAR" >> "$FILE"
        echo "" >> "$FILE"
    fi

    while true; do
        resolution=$(zenity --entry --title="New Resolution" --text="Enter a resolution (leave blank to stop):")
        if [ -z "$resolution" ]; then
            break
        fi
        echo "- [ ] $resolution" >> "$FILE"
    done
    zenity --info --text="Resolutions saved to $FILE"

elif [[ "$choice" == "Mark Today's Resolutions" ]]; then
    # Check if today's section exists
    if ! grep -q "## $DAY-$MONTH-$YEAR" "$FILE"; then
        zenity --info --text="No resolutions found for today."
        exit 0
    fi

    TMP_FILE=$(mktemp)
    inside_today=0

    while IFS= read -r line; do
        if [[ "$line" == "## $DAY-$MONTH-$YEAR" ]]; then
            echo "$line" >> "$TMP_FILE"
            inside_today=1
            continue
        fi

        if [[ "$inside_today" -eq 1 && "$line" == "## "* ]]; then
            inside_today=0
        fi

        if [[ "$inside_today" -eq 1 && "$line" == "- [ ] "* ]]; then
            task=${line:5}
            zenity --question --title="Mark Resolution" --text="Did you complete:\n\n$task ?" \
                && echo "- [x] $task" >> "$TMP_FILE" \
                || echo "- [ ] $task" >> "$TMP_FILE"
        else
            echo "$line" >> "$TMP_FILE"
        fi
    done < "$FILE"

    mv "$TMP_FILE" "$FILE"
    zenity --info --text="Today's resolutions updated in $FILE"
fi
