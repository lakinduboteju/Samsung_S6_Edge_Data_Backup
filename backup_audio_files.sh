#!/bin/bash

backup_path="backup/audio"

mkdir -p ${backup_path}

source backup_files.sh "audio_files" ${backup_path}
