#!/bin/bash

# Compile as a worker
chown -R worker ..
su worker -c "./blink/get_frameworks.sh && gym -c \
    --scheme Blink \
    --project ./Blink/Blink.xcodeproj \
    --output_directory ./release/"
#    --build_path ./release/
# profiles, signing, team, etc...
