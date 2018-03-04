#!/bin/bash

./build-mosh/build-all.sh || { echo "libmoshios.framework failed to build"; exit 1; }

VERSION=$(grep PACKAGE_VERSION build-mosh/mosh/config.h | sed "s/^.*PACKAGE_VERSION.*\"\(.*\)\"/\1/")
BUILD=$(grep BUILD_VERSION build-mosh/mosh/version.h | sed "s/^.*VERSION.*\"\(.*\)\"/\1/")

tar -zcvf release/libmoshios-$VERSION-$BUILD.framework.tar.gz --directory=build-mosh/ libmoshios.framework

echo $VERSION-$BUILD > release/VERSION
