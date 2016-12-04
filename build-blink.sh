#!/bin/bash

./blink/get_frameworks.sh

gym -c --use_legacy_build_api \
    --scheme Blink \
    --project ./Blink/Blink.xcodeproj \
    --output_directory ./release/ \
#    --build_path ./release/
# profiles, signing, team, etc...
