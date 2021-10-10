#!/bin/bash

set -e

./auto/build.sh

cd build
# test
cmake --build . --target test