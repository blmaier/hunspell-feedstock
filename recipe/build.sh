#!/usr/bin/env bash
set -euxo pipefail

autoreconf -vfi

./configure \
    --prefix="${PREFIX}" \
    --with-readline \
    --with-ui

make "-j${CPU_COUNT}"

if [[ "${target_platform}" == "${build_platform}" ]]; then
    make check
fi

make install
