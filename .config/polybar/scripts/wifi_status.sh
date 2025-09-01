#!/bin/bash

if nmcli radio wifi | grep -q "enabled"; then
    echo "%{F#00FF00}%{F-}"   # Green icon if Wi-Fi ON
else
    echo "%{F#FF0000}%{F-}"   # Red icon if Wi-Fi OFF
fi

