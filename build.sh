#!/bin/sh
# Render build step: copies index.html into dist/ and fills in the two
# private values from the service's Environment settings, so neither one
# has to be committed to Git.
set -e
: "${GOOGLE_API_KEY:?Add GOOGLE_API_KEY under Environment in Render}"
: "${DRIVE_FOLDER_ID:?Add DRIVE_FOLDER_ID under Environment in Render}"
mkdir -p dist
sed -e "s|PASTE_YOUR_GOOGLE_API_KEY|$GOOGLE_API_KEY|" \
    -e "s|PASTE_YOUR_DRIVE_FOLDER_ID|$DRIVE_FOLDER_ID|" \
    index.html > dist/index.html
