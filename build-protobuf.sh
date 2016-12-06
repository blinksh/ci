#!/bin/bash

./build-protobuf/build-protobuf.sh

VER=$(echo protobuf-* | sed 's/^.*protobuf-\([0-9.]*\).*/\1/')

tar -zcvf release/protobuf-$VER.tar.gz protobuf-$VER
echo $VER > release/VERSION
