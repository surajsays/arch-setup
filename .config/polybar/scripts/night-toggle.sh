# #!/bin/bash

# # Check if redshift is running
# if pgrep -x redshift >/dev/null; then
#     pkill redshift
#     notify-send "Night mode disabled"
# else
#     redshift -O 4000 &   # Warm tone, adjust Kelvin as desired
#     notify-send "Night mode enabled"
# fi

#!/bin/bash

TEMP=4000

# File to track state
STATE_FILE="/tmp/night_mode_state"

if [ -f "$STATE_FILE" ]; then
    # Turn OFF
    redshift -x   # resets to normal color temp
    rm "$STATE_FILE"
    notify-send "Night mode: OFF"
else
    # Turn ON
    redshift -O $TEMP
    touch "$STATE_FILE"
    notify-send "Night mode: ON ($TEMP K)"
fi
