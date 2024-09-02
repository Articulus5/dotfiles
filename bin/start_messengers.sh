#!/usr/bin/bash

if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
	echo "Adding --simple or -s will skip starting lesser used messengers."
	exit 0
fi

if [ "$1" == "--simple" ] || [ "$1" == "-s" ]; then
	echo "Skipping lesser used chat clients..."
else
	hexchat           > /dev/null 2>&1 &
	discord           > /dev/null 2>&1 &
	skypeforlinux     > /dev/null 2>&1 &
fi

telegram-desktop  > /dev/null 2>&1 &
google-chat-linux > /dev/null 2>&1 &
caprine           > /dev/null 2>&1 &
