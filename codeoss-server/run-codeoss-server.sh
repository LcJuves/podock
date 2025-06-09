#!/bin/sh

if [ -z "$port" ]; then
    port=8000
fi

podman run --platform linux/amd64 -itd -p "$port":8000 -v "$PWD":/root/workspace ghcr.io/lcjuves/codeoss-server
