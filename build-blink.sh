#!/bin/bash

# Compile as a worker
./ci/unlock_keychain.sh > /dev/null
./blink/get_frameworks.sh && fastlane gym -c \
    --scheme Blink \
    --project ./Blink/Blink.xcodeproj \
    --output_directory ./release/
#    --build_path ./release/
# profiles, signing, team, etc...
