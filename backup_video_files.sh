#!/bin/bash

backup_path="backup/videos"

mkdir -p ${backup_path}

source backup_files.sh "video_files" ${backup_path}
