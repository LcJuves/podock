#!/bin/sh

if [ -z "$domain" ]; then
    domain=localhost
fi

if [ -z "$mail" ]; then
    mail=mail@localhost
fi

V2NODE_SELF_HOSTED_CONTAINER_ID=$(podman run -itd --privileged \
    -h "$(echo "$domain" | base64)" \
    -v /var/run/podman/podman.sock:/var/run/podman/podman.sock \
    -p 443:443 \
    ghcr.io/lcjuves/v2node:self-hosted /sbin/init)

podman exec -it \
    --workdir /root "$V2NODE_SELF_HOSTED_CONTAINER_ID" \
    bash -e init-self-hosted-v2node.sh "$mail" "$domain"
