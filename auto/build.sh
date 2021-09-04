#!/bin/sh

set -e

mkdir -p build
cd build
conan install .. -s compiler.libcxx=libstdc++11
cmake ..
cmake --build .