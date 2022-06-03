#!/usr/bin/env bash

(
    cd macos-cross-compiler-builder || exit
    cp ../amuse-lang-environment/llvm-toolchain-stretch-13.sources.list .
    curl -L -O https://github.com/Kitware/CMake/releases/download/v3.23.1/cmake-3.23.1-linux-x86_64.tar.gz
    docker build -t "$CI_REGISTRY_USER/macos-cross-compiler-builder" .
    docker push "$CI_REGISTRY_USER/macos-cross-compiler-builder"
)

(
    cd amuse-lang-environment || exit
    docker build -t "$CI_REGISTRY_USER/amuse-lang-environment:rust-compiler" -f rust-compiler.Dockerfile .
    docker push "$CI_REGISTRY_USER/amuse-lang-environment:rust-compiler"
    docker build -t "$CI_REGISTRY_USER/amuse-lang-environment:llvmenv-jit" -f llvmenv-jit.Dockerfile .
    docker push "$CI_REGISTRY_USER/amuse-lang-environment:llvmenv-jit"
    docker build -t "$CI_REGISTRY_USER/amuse-lang-environment:llvmenv" -f llvmenv.Dockerfile .
    docker push "$CI_REGISTRY_USER/amuse-lang-environment:llvmenv"
    docker build -t "$CI_REGISTRY_USER/amuse-lang-environment" .
    docker push "$CI_REGISTRY_USER/amuse-lang-environment"
)

(
    cd develop-environment || exit
    curl -L -O https://ziglang.org/download/0.9.1/zig-linux-x86_64-0.9.1.tar.xz
    curl -L -O --http1.1 https://gitlab.com/LiangchengJ/fserv/-/raw/main/txz/jdk-8u311-linux-x64.tar.xz
    curl -L -O https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.0.0-stable.tar.xz
    curl -L -O https://nodejs.org/dist/v16.15.1/node-v16.15.1-linux-x64.tar.xz
    curl -L -O https://github.com/LiangchengJ/vscode/releases/download/dev_test_part17/codeoss-server-linux-x64-web.tar.gz
    curl -L -O https://github.com/denoland/deno/releases/download/v1.22.2/deno-x86_64-unknown-linux-gnu.zip
    unzip deno-x86_64-unknown-linux-gnu.zip
    docker build -t "$CI_REGISTRY_USER/develop-environment:rustaceans-jit" -f rustaceans-jit.Dockerfile .
    docker push "$CI_REGISTRY_USER/develop-environment:rustaceans-jit"
    docker build -t "$CI_REGISTRY_USER/develop-environment:rustaceans" -f rustaceans.Dockerfile .
    docker push "$CI_REGISTRY_USER/develop-environment:rustaceans"
    docker build -t "$CI_REGISTRY_USER/develop-environment:jit" -f jit.Dockerfile .
    docker push "$CI_REGISTRY_USER/develop-environment:jit"
    docker build -t "$CI_REGISTRY_USER/develop-environment:gitpod" -f gitpod.Dockerfile .
    docker push "$CI_REGISTRY_USER/develop-environment:gitpod"
    docker build -t "$CI_REGISTRY_USER/develop-environment" .
    docker push "$CI_REGISTRY_USER/develop-environment"
)

(
    cd codeoss-server || exit
    curl -L -O https://github.com/LiangchengJ/vscode/releases/download/dev_test_part17/codeoss-server-linux-x64-web.tar.gz
    docker build -t "$CI_REGISTRY_USER/codeoss-server" .
    docker push "$CI_REGISTRY_USER/codeoss-server"
)
