#!/usr/bin/bash

if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
	echo "Adding --skip-net or -s will skip turning off the firewall."
	exit 0
fi

systemctl --user start plasma-polkit-agent.service

xembedsniproxy > /dev/null 2>&1 &

iwgtk -i -n > /dev/null 2>&1 &
blueman-applet > /dev/null 2>&1 &

systemctl --user start timidity.service
systemctl --user start dropbox.service
onedrivegui > /dev/null 2>&1 &

# Remove these commands when nftables have been setup; needed for things like nmblookup to work
if [ "$1" == "--skip" ] || [ "$1" == "-s" ]; then
	echo "Skipping flushing firewall..."
else
	sudo nft flush ruleset
	sudo systemctl restart winbind
fi
