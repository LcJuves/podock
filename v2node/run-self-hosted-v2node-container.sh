#!/bin/sh

if [ -z "$domain" ]; then
    domain=localhost
fi

if [ -z "$mail" ]; then
    mail=mail@localhost
fi

V2NODE_SELF_HOSTED_CONTAINER_ID=$(docker run -itd --privileged \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -p 443:443 \
    -e mail=$mail \
    -e domain=$domain \
    liangchengj/v2node:self-hosted /sbin/init)

docker exec "$V2NODE_SELF_HOSTED_CONTAINER_ID" --workdir /root bash -e init-self-hosted-v2node.sh
