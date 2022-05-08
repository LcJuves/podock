#!/usr/bin/env bash

(
    cd macos-cross-compiler-builder || exit
    docker build -t "$CI_REGISTRY_USER/macos-cross-compiler-builder" .
    docker push "$CI_REGISTRY_USER/macos-cross-compiler-builder"
)
