#!/bin/bash

# Input args
input_file_path=$1
backup_path=$2

source helper_functions.sh

# Wait until the adb connection and device is readable
wait_until_device_is_ready

line_number=`< line_number`

while [ true ]
do
    # Read next line from input file
    read_line_from_file "${input_file_path}" ${line_number}
    # Read line is empty? = We have reached the end of input file?
    if [ -z "${line}" ]
    then
        echo "End of input file."
        # break loop
        break
    fi
    # Read line tells us about the source file in device.
    # Here we add a forward-slash before every space character in read line.
    file_in_device=`echo "${line}"  | sed 's/ /\\ /g'`
    # Get just the filename from file path
    filename=`basename ${file_in_device}`
    # Get file path relative to device internal storage
    relative_file_path=${file_in_device#*${internal_storage_path}/}
    # Get just dir path from relative file path
    relative_dir_path=`dirname ${relative_file_path}`
    # Create destination dir
    dest_dir="${backup_path}/${relative_dir_path}"
    mkdir -p "${dest_dir}"
    # Create destination file path
    file_backup_path="${dest_dir}/${filename}"
    # Pull file from device
    echo "File : ${file_in_device}"
    adb pull "${file_in_device}" "${file_backup_path}"
    # adb connection is still there? and destination file exists?
    if [ is_adb_connection_ok ] && [ -e "${file_backup_path}" ]
    then
        # File backup successful
        echo "File : ${line_number} backup done."
        # Increment to next line number
        ((line_number++))
        # Save next line number
        echo ${line_number} > "line_number"
    else
        # File backup failed
        echo "Device disconnected."
        # Wait for device to connect again and
        # start with last line number.
        wait_until_device_is_ready
    fi
done

# Reset line number
echo 1 > "line_number"
echo "Backup done!"
