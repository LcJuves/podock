#!/bin/sh

if [ -n "$CI_REGISTRY_USER" ] && [ -n "$CI_REGISTRY_PASSWORD" ] && [ -n "$CI_REGISTRY" ]; then
    docker login -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD" "$CI_REGISTRY"
fi

(
    cd macos-cross-compiler-builder || exit
    if [ ! -f "llvm-toolchain-stretch-13.sources.list" ]; then
        cp ../amuse-lang-environment/llvm-toolchain-stretch-13.sources.list .
    fi
    if [ ! -f "cmake-3.23.1-linux-x86_64.tar.gz" ]; then
        curl -L -O https://github.com/Kitware/CMake/releases/download/v3.23.1/cmake-3.23.1-linux-x86_64.tar.gz
    fi
)

(
    cd develop-environment || exit
    if [ ! -f "zig-linux-x86_64-0.9.1.tar.xz" ]; then
        curl -L -O https://ziglang.org/download/0.9.1/zig-linux-x86_64-0.9.1.tar.xz
    fi
    if [ ! -f "jdk-8u311-linux-x64.tar.xz" ]; then
        curl -L -O --http1.1 https://gitlab.com/LiangchengJ/fserv/-/raw/main/txz/jdk-8u311-linux-x64.tar.xz
    fi

    if [ ! -f "node-v16.15.1-linux-x64.tar.xz" ]; then
        curl -L -O https://nodejs.org/dist/v16.15.1/node-v16.15.1-linux-x64.tar.xz
    fi
    if [ ! -f "codeoss-server-linux-x64-web.tar.gz" ]; then
        curl -L -O https://github.com/LiangchengJ/vscode/releases/download/dev_test_part17/codeoss-server-linux-x64-web.tar.gz
    fi
)

(
    cd codeoss-server || exit
    if [ ! -f "codeoss-server-linux-x64-web.tar.gz" ]; then
        curl -L -O https://github.com/LiangchengJ/vscode/releases/download/dev_test_part17/codeoss-server-linux-x64-web.tar.gz
    fi
)

(
    cd v2node || exit
    if [ ! -f "Python39.tar.xz" ]; then
        curl -L -O https://gitlab.com/LiangchengJ/podock/-/raw/main/py3-builder/Python39.tar.xz
    fi
)

(
    cd git-scm-builder || exit
    if [ ! -f "llvm-toolchain-stretch-13.sources.list" ]; then
        cp ../amuse-lang-environment/llvm-toolchain-stretch-13.sources.list .
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
