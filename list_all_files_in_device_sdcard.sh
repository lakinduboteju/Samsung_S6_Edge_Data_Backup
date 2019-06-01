#!/bin/bash

source helper_functions.sh

# Wait until the adb connection and device is readable
wait_until_device_is_ready

# Find all files in internal storage
adb shell "find ${internal_storage_path}/* -type f" > all_files

echo "Done."
