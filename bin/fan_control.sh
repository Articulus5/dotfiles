#!/usr/bin/bash

if [ "$1" = "auto" ] || [ -z "$1" ]; then
    sudo ectool --interface=lpc autofanctrl
elif [ "$1" = "full" ] || [ -z "$1" ]; then
    sudo ectool --interface=lpc fanduty 100
else
    sudo ectool --interface=lpc fanduty $1
fi
