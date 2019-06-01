#!/bin/bash

source helper_functions.sh

# Wait until the adb connection and device is readable
wait_until_device_is_ready

# Find all .mp4, .mkv files
adb shell "find ${internal_storage_path}/* -name '*.mp4' -or -name '*.mkv' -type f" > video_files

echo "Done."
