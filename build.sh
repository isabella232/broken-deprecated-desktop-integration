#!/bin/bash
set -e
set -x

STRIP="strip"
JOBS=${JOBS:-1}

HERE="$(dirname "$(readlink -f "${0}")")"
cd "$HERE"

git submodule update --init --recursive

mkdir -p build
cd build

cmake .. -DCMAKE_BUILD_TYPE=MinSizeRel

make -j8

$STRIP src/dialog

# debugging
(objdump -p src/dialog | grep NEEDED) || true
ldd src/dialog || true

