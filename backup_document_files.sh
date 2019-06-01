#!/bin/bash

backup_path="backup/documents"

mkdir -p ${backup_path}

source backup_files.sh "document_files" ${backup_path}
