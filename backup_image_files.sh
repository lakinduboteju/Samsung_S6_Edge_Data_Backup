#!/bin/bash

backup_path="backup/images"

mkdir -p ${backup_path}

source backup_files.sh "image_files" ${backup_path}
