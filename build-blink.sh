#!/bin/bash

PATH=$PATH:/usr/local/bin
./ci/unlock_keychain.sh > /dev/null

./blink/get_frameworks.sh && fastlane gym -c \
    --scheme Blink \
    --project ./Blink/Blink.xcodeproj \
    --output_directory ./release/
