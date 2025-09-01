#!/bin/bash

# Kill any existing polybar instance
killall -q polybar

# Wait until polybar has shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar
polybar suraj &
