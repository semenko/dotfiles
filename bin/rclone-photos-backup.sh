#!/bin/bash

rclone config reconnect gphotos-ro:

echo "************ Photos rclone Copy / Only 2025+ ************"
/opt/homebrew/bin/rclone copy --fast-list --verbose --gphotos-include-archived --transfers=2 --gphotos-start-year=2025 gphotos-ro:media/by-month aws-backup:semenkovich-google-drive-backup/nick-semenkovich-photos/

