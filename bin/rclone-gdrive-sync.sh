#!/bin/bash

rclone config reconnect gdrive-ro:

echo "************ Starting DRIVE Backup *********************"
# Backup gdrive
# Ignore errors will delete during this process
rclone sync --fast-list --verbose --progress --ignore-errors gdrive-ro: aws-backup:semenkovich-google-drive-backup/nick-semenkovich-gdrive/
## Can add the --size-only flag to reduce costs, but may be higher risk
## --fast-list stores all objects in RAM

echo "************ Google Drive Backup Done *********************"

