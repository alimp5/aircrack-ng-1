#!/usr/bin/env bash

set -e

if [ "$TRAVIS_OS_NAME" == "osx" ]; then ./autogen.sh --with-experimental --with-openssl=/usr/local/Cellar/openssl/1.0.2l; else ./autogen.sh --with-experimental; fi
make
make check || { cat test/test-suite.log && exit 1; }
make clean
exit 0
