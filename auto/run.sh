#!/bin/sh

set -e

mkdir -p build
cd build
conan install ..
cmake ..
cmake --build .

./xcShell