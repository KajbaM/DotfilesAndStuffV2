#!/usr/bin/env bash

SIGNAL_STRENGHT=$(
	nmcli dev wifi list | awk '/\*/{if (NR!=1) {print $9}}' |
		sed "s/▂▄▆█/󰤨/g" |
		sed "s/▂▄▆_/󰤥/g" |
		sed "s/▂▄__/󰤢/g" |
		sed "s/▂___/󰤟/g"
)

STATE=$(nmcli g | awk '/\*/{if (NR!=1) {print $0}}')

# get current connection status
CONSTATE=$(nmcli -fields CONNECTIVITY g)
if [[ "$CONSTATE" =~ "none" ]]; then
	WIFISTATE=$(nmcli -fields WIFI g)
	if [[ "$WIFISTATE" =~ "disabled" ]]; then
		STATUS="󰤮"
	else
		STATUS="󰤫"
	fi
elif [[ "$CONSTATE" =~ "full" ]]; then
	STATUS=$(
		nmcli dev wifi list | awk '/\*/{if (NR!=1) {print $9}}' |
			sed "s/▂▄▆█/󰤨/g" |
			sed "s/▂▄▆_/󰤥/g" |
			sed "s/▂▄__/󰤢/g" |
			sed "s/▂___/󰤟/g"
	)
fi
echo $STATUS
