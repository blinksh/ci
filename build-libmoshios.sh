#!/bin/bash

./build-mosh/build-all.sh || { echo "libmoshios.framework failed to build"; exit 1; }

VERSION=$(grep PACKAGE_VERSION build-mosh/mosh/config.h | sed "s/^.*PACKAGE_VERSION.*\"\(.*\)\"/\1/")
BUILD=$(grep BUILD_VERSION build-mosh/mosh/version.h | sed "s/^.*VERSION.*\"\(.*\)\"/\1/")

cd build-mosh/ && tar -zcvf ../release/libmoshios-$VERSION-$BUILD.framework.tar.gz libmoshios.framework && cd ..

echo $VERSION-$BUILD > release/VERSION
