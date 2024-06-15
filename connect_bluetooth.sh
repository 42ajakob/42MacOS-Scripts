#!/bin/bash

# Path to blueutils and MacAddress of devices
blueutil_path="/Users/$USER/.brew/bin/blueutil"
devices_mac=("XX-XX-XX-XX-XX-XX" "XX-XX-XX-XX-XX-XX" "XX-XX-XX-XX-XX-XX")

# Function to connect devices
connect_bluetooth() {
    local device=$1
	$blueutil_path --connect $device || true
	$blueutil_path --pair $device || true
}

# Loop through each device and connect
for device in "${devices_mac[@]}"; do
    connect_bluetooth $device
done