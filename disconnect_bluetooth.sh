#!/bin/bash

# Path to blueutils and MacAddress of devices
blueutil_path="/Users/$USER/.brew/bin/blueutil"
devices_mac=("XX-XX-XX-XX-XX-XX" "XX-XX-XX-XX-XX-XX" "XX-XX-XX-XX-XX-XX")

# Function to disconnect devices
disconnect_bluetooth() {
    local device=$1
    $blueutil_path --disconnect $device || true
}

# Loop through each device and disconnect
for device in "${devices_mac[@]}"; do
    disconnect_bluetooth $device
done