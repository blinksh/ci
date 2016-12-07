#!/bin/bash

PWD=`pwd`
RELEASE="$PWD/release"
echo $RELEASE
cd ./build-libssh2/

if ./build-all.sh openssl && ./create-libssh2-framework.sh; then
    LIBSSH2_VER=$(echo libssh2-*.tar.gz | sed 's/^.*libssh2-\([0-9.]*\).tar.gz/\1/')
    OPENSSL_VER=$(echo openssl-*.tar.gz | sed 's/^.*openssl-\([0-9a-z.]*\).tar.gz/\1/')
    echo $LIBSSH2_VER > $RELEASE/LIBSSH2_VER
    echo $OPENSSL_VER > $RELEASE/OPENSSL_VER
    tar -zcvf $RELEASE/openssl-$OPENSSL_VER.framework.tar.gz openssl.framework
    tar -zcvf $RELEASE/libssh2-$LIBSSH2_VER.framework.tar.gz libssh2.framework
else
    echo "Error Building OpenSSL & libssh2"
    exit 1
fi
