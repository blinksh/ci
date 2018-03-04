#!/bin/bash

: "${KCH_PASSWORD:?Variable not set or empty}"

security unlock-keychain -p $KCH_PASSWORD ~/Library/Keychains/login.keychain-db
security set-keychain-settings -l -u -t 3600 ~/Library/Keychains/login.keychain-db
security set-key-partition-list -S apple-tool:,apple:,codesign: -s -k $KCH_PASSWORD ~/Library/Keychains/login.keychain-db
