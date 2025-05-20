#!/bin/sh

if [ -z "$domain" ]; then
    domain=localhost
fi

if [ -z "$mail" ]; then
    mail=mail@localhost
fi

if [ ! -f "/usr/bin/crun" ]; then
    curl -L -o /usr/bin/crun -s https://github.com/containers/crun/releases/download/1.21/crun-1.21-linux-amd64
fi

mount -t cgroup

V2NODE_SELF_HOSTED_CONTAINER_ID=$(podman run --runtime /usr/bin/crun -itd --privileged \
    -h "$(echo "$domain" | base64)" \
    -v /run/podman/podman.sock:/run/podman/podman.sock \
    -p 443:443 \
    ghcr.io/lcjuves/v2node:self-hosted /sbin/init)

podman exec -it \
    --workdir /root "$V2NODE_SELF_HOSTED_CONTAINER_ID" \
    bash -e init-self-hosted-v2node.sh "$mail" "$domain"
