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

V2NODE_SELF_HOSTED_CONTAINER_ID=$(docker run --runtime /usr/bin/crun -itd --privileged \
    -h "$(echo "$domain" | base64)" \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -p 443:443 \
    lcjuves/v2node:self-hosted /sbin/init)

docker exec -it \
    --workdir /root "$V2NODE_SELF_HOSTED_CONTAINER_ID" \
    bash -e init-self-hosted-v2node.sh "$mail" "$domain"
