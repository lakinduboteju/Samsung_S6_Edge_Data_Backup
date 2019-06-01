#!/bin/bash

backup_path="backup/sdcard"

mkdir -p ${backup_path}

source backup_files.sh "all_files" ${backup_path}
