# 42MacOS-Scripts
## Launching noTunes.app on login
 - Download noTunes via Direct Download from Github
 - Unzip and put the noTunes.app into ~/Applications (Or place it where ever you want and modify the path in the script)
 - Download the com.user.noTunes.plist script
 - Move it to the LaunchAgents and launch it:
```
mv com.user.noTunes.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/com.user.noTunes.plist
launchctl start ~/Library/LaunchAgents/com.user.noTunes.plist
```

## Disconnecting Bluetooth devices on logout via custom keybind
 - Install blueutil. You can install it via Homebrew. And if you don't know how to do that ASK YOUR PEERS :)
```
brew install blueutil
```
 - Download the disconnect_bluetooth.sh script
 - If your brew is not in ~/.brew. Find your blueutil path and Modify the blueutil_path in the script:
```
which blueutil # Your path to blueutil
vim disconnect_bluetooth.sh # Or your favorite text editor
blueutil_path="~/.brew/bin/blueutil"
```
 - Find the MacAddress of your bluetooth device:
```
system_profiler SPBluetoothDataType | grep -i Address
```
 - Replace the MacAddress placeholders in the script:
```
devices_mac=("XX-XX-XX-XX-XX-XX" "XX-XX-XX-XX-XX-XX" "XX-XX-XX-XX-XX-XX")
```
 - Open Automator
 - Select Quick Action
 - Change Workflow receives to "no input" in "any application"
 - Search for "Run Shell Script" and add it via double click
 - Change shell to "/bin/bash" and pass input to "to stdin"
 - ADD:
```
/path/to/your/disconnect_bluetooth.sh # replace /path/to/your/ with the actual PATH
```
 - Search for "Run AppleScript"
 - ADD:
```
tell application "System Events"
 log out
end tell
```
 - Command + S to save with your prefered name.
 - Go to the Apple Icon on the mac bar.
 - System Preferences. Keyboard. Shortcuts. Services.
 - In General at the end should be your Automator script name. Decide a keybing for that.
Note: Some keybinds are not accepted because of conflictions or other reasons. "Shift + Command + 1" should work.

## Connecting Bluetooth devices on login via custom keybind
 - Figure it out yourself with the Launching noTunes and disconnect Bluetooth examples...

Unfortunatly you can't skip the countdown from the logout box before actually logging out. At least without administration rights. I tried.
Also I only tested the script on MacOS Ver. 10.15.7 for my own convience.
This repository might be extended and improved in the future. Right now you need some braincells to understand and execute the steps I wrote. Your welcome.
