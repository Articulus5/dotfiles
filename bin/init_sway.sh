#!/usr/bin/bash

# TODO: Handle multiple arguments

if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
	echo "Adding --skip-net or -s will skip turning off the firewall."
	echo "Adding --no-dropbox or -n will turn off the dropbox service to keep dropbox from continuously restarting."
	exit 0
fi

systemctl --user start plasma-polkit-agent.service

xembedsniproxy > /dev/null 2>&1 &

iwgtk -i -n > /dev/null 2>&1 &
blueman-applet > /dev/null 2>&1 &

systemctl --user start timidity.service
systemctl --user start dropbox.service
systemctl --user start onedrive_tray.service

# Remove these commands when nftables have been setup; needed for things like nmblookup to work
if [ "$1" == "--skip" ] || [ "$1" == "-s" ]; then
	echo "Skipping flushing firewall..."
else
	sudo nft flush ruleset
	sudo systemctl restart winbind
fi

# Dropbox is continuously restarting for some reason; we can kill the service to let it stay up
#if [ "$1" == "--no-dropbox" ] || [ "$1" == "-n" ]; then
	sleep 5
	systemctl --user stop dropbox.service
#fi
