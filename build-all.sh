#!/bin/sh
# Created at 2023/8/23 20:43
# @author Liangcheng Juves

_PUSH=false
if [ -n "$CI_REGISTRY_USER" ] && [ -n "$CI_REGISTRY_PASSWORD" ] && [ -n "$CI_REGISTRY" ]; then
    docker login -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD" "$CI_REGISTRY"
    _PUSH=true
fi

dart pub get

dart run build.dart --enable-experiment=native-assets --push $_PUSH --containerInfoFile containerImages1.json
(docker images | awk 'NR!=1{print $3}' | xargs docker rmi -f) || echo >/dev/null

dart run build.dart --push $_PUSH --containerInfoFile containerImages2.json
(docker images | awk 'NR!=1{print $3}' | xargs docker rmi -f) || echo >/dev/null

# dart run build.dart --push $_PUSH --containerInfoFile containerImages3.json
# (docker images | awk 'NR!=1{print $3}' | xargs docker rmi -f) || echo >/dev/null
