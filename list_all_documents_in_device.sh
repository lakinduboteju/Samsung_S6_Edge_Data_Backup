#!/bin/bash

source helper_functions.sh

# Wait until the adb connection and device is readable
wait_until_device_is_ready

# Find all .pdf, .PDF, .docx, .doc, .ppt, .pptx, .xls, .xlsx, .xps, .eml, .emlx, .txt files
adb shell "find ${internal_storage_path}/* -name '*.pdf' -or -name '*.PDF' -or -name '*.docx' -or -name '*.doc' -or -name '*.ppt' -or -name '*.pptx' -or -name '*.xls' -or -name '*.xlsx' -or -name '*.xps' -or -name '*.eml' -or -name '*.emlx' -or -name '*.txt' -type f" > document_files

echo "Done."
