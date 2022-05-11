#!/usr/bin/env bash

(
    cd macos-cross-compiler-builder || exit
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
