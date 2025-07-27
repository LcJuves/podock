#!/bin/sh

mail="$1"
domain="$2"

{
    certbot certonly --manual -m "$mail" -d "$domain" --preferred-challenges dns
} || {
    echo "certbot generated with error!"
}

CODEOSS_SERVER_CONTAINER_ID=$(podman run -itd \
    -p 8000:8000 -h "codeoss-server" \
    ghcr.io/lcjuves/codeoss-server)
echo "CodeOSS server's container id: $CODEOSS_SERVER_CONTAINER_ID"

mv /etc/nginx/conf.d/localhost.conf /etc/nginx/conf.d/"$domain".conf
sed -i "s/localhost/$domain/g" /etc/nginx/conf.d/"$domain".conf

systemctl start nginx.service
