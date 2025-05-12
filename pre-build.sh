#!/bin/sh

(
    cd osx-cross-compiler-builder || exit
    cp ../amuse-lang-environment/llvm-toolchain-bookworm-19.sources.list .
    CMAKE_VERSION=3.27.3
    if [ ! -f "cmake-$CMAKE_VERSION-linux-x86_64.tar.gz" ]; then
        curl -L -O https://github.com/Kitware/CMake/releases/download/v$CMAKE_VERSION/cmake-$CMAKE_VERSION-linux-x86_64.tar.gz
    fi
)

(
    cd codeoss-server || exit
    if [ ! -f "codeoss-server-linux-x64-web.tar.gz" ]; then
        curl -L -O https://github.com/LcJuves/vscode/releases/download/dev_test_part17/codeoss-server-linux-x64-web.tar.gz
    fi
)

(
    cd host-manager || exit
    if [ ! -f "cloudflared-linux-amd64" ]; then
        curl -L -O https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64
    fi
    chmod +x cloudflared-linux-amd64
    chmod +x init-cloudflared.sh
    chmod +x run-container.sh
)

(
    cd rustaceans || exit
    if [ ! -f "osx-cross-compiler.tar.xz" ]; then
        curl -L -O -s https://github.com/LcJuves/osx-cross-compiler/releases/download/osx-cross-compiler/osx-cross-compiler.tar.xz
    fi
)
