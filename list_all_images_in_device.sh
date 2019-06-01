#!/bin/bash

source helper_functions.sh

# Wait until the adb connection and device is readable
wait_until_device_is_ready

# Find all .jpg, .png, .gif, .bmp files
adb shell "find ${internal_storage_path}/* -name '*.jpg' -or -name '*.png' -or -name '*.gif' -or -name '*.bmp' -type f" > image_files

echo "Done."
