#!/bin/bash
# chosen=$(echo -e "    Shutdown \n    Reboot\n    Logout" | rofi -dmenu -p "Power Menu")
# case "$chosen" in
#     " Shutdown") systemctl poweroff ;;
#     " Reboot") systemctl reboot ;;
#     " Logout") i3-msg exit ;;
# esac

#!/bin/bash

options="  Lock
  Suspend
  Hibernate
  Logout
  Reboot
  Shutdown"

chosen=$(echo -e "$options" | rofi -dmenu -p "Power Menu")

case "$chosen" in
    "  Lock") i3lock -c 000000 ;;
    "  Suspend") systemctl suspend ;;
    "  Hibernate") systemctl hibernate ;;
    "  Logout") i3-msg exit ;;
    "  Reboot") systemctl reboot ;;
    "  Shutdown") systemctl poweroff ;;
esac
