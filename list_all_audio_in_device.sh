#!/bin/bash

source helper_functions.sh

# Wait until the adb connection and device is readable
wait_until_device_is_ready

# Find all .mp3, .aac, .ogg files
adb shell "find ${internal_storage_path}/* -name '*.mp3' -or -name '*.aac' -name '*.ogg' -type f" > audio_files

echo "Done."
