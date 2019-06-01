#!/bin/bash

# Samsung S6 edge device internal storage path
internal_storage_path="/mnt/user/0/primary"

wait_for_adb_connection()
{
    adb devices
    # Wait for adb device connection
    while [ `adb devices | wc -m` -lt 30 ]
    do
        sleep 1s
    done
}

wait_for_adb_readability()
{
    rm ./test_file
    while [ ! -e ./test_file ]
    do
        adb shell "touch ${internal_storage_path}/test_file"
        adb pull "${internal_storage_path}/test_file" "./test_file"
        sleep 1s
    done
    rm ./test_file
}

wait_until_device_is_ready()
{
    wait_for_adb_connection
    echo "Device connected."

    wait_for_adb_readability
    echo "Device is readable."
}

is_adb_connection_ok()
{
    if [ `adb devices | wc -m` -gt 30 ]
    then
        return 0
    else
        return 1
    fi
}

read_line_from_file()
{
    local file_path=$1
    local line_number=$2
    # 'line' env var is set as the result
    line=`awk NR==${line_number} ${file_path}`
}
