#!/bin/bash

PATH=$PATH:/usr/local/bin
./unlock_keychain.sh > /dev/null

# Compile as a worker
chown -RHL worker ..
su worker -c "./blink/get_frameworks.sh && fastlane gym -c \
    --scheme Blink \
    --project ./Blink/Blink.xcodeproj \
    --output_directory ./release/"
#    --build_path ./release/
# profiles, signing, team, etc...
