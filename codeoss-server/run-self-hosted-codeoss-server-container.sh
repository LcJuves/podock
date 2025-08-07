#!/bin/sh

if [ -z "$domain" ]; then
    domain=localhost
fi

if [ -z "$mail" ]; then
    mail=mail@localhost
fi

CODEOSS_SERVER_SELF_HOSTED_CONTAINER_ID=$(podman run -itd --privileged \
    -h "$(echo "$domain" | base64)" \
    -v /var/run/podman/podman.sock:/var/run/podman/podman.sock \
    -p 443:443 \
    ghcr.io/lcjuves/codeoss-server:self-hosted /sbin/init)

podman exec -it \
    --workdir /root "$CODEOSS_SERVER_SELF_HOSTED_CONTAINER_ID" \
    bash -e init-self-hosted-codeoss-server.sh "$mail" "$domain"
