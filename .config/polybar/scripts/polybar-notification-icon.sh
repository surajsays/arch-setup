#!/bin/bash

count=$(dunstctl count 2>/dev/null)

# If count is empty or not a number, set to 0
if ! [[ "$count" =~ ^[0-9]+$ ]]; then
    count=0
fi

icon_empty=""   # empty bell icon (bell slash)
icon_full=""    # full bell icon

if (( count > 0 )); then
    echo "$icon_full"
else
    echo "$icon_empty"
fi

