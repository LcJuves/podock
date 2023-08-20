#!/bin/sh

if [ -n "$CI_REGISTRY_USER" ] && [ -n "$CI_REGISTRY_PASSWORD" ] && [ -n "$CI_REGISTRY" ]; then
    docker login -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD" "$CI_REGISTRY"
fi

(
    cd macos-cross-compiler-builder || exit
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
    cd v2node || exit
    if [ ! -f "Python39.tar.xz" ]; then
        curl -L -O https://gitlab.com/LcJuves/podock/-/raw/main/py3-builder/Python39.tar.xz
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
    if [ ! -f "macos-cross-compiler.tar.xz" ]; then
        curl -L -O -s https://github.com/LcJuves/macos-cross-compiler/releases/download/mac-os-cross-compiler/macos-cross-compiler.tar.xz
    fi
)
