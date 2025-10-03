#!/bin/sh

# ------Get available windows:
swaymsg -t get_tree |
    jq -r '.nodes[].nodes[] | if .nodes then [recurse(.nodes[])]
        else [] end + .floating_nodes | .[] | select(.nodes==[]) | ((.id |
        tostring) + " " + .name)' |
    wofi -d -p "Switch to:" | {
        read -r id name
        swaymsg "[con_id=$id]" focus
    }
