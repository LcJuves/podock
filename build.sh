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
    curl -L -O --http1.1 https://gitlab.com/LiangchengJ/fserv/-/raw/main/txz/jdk-8u311-linux-x64.tar.xz
    docker build -t "$CI_REGISTRY_USER/develop-environment:jit" -f jit.Dockerfile .
    docker push "$CI_REGISTRY_USER/develop-environment:jit"
    docker build -t "$CI_REGISTRY_USER/develop-environment" .
    docker push "$CI_REGISTRY_USER/develop-environment"
)
