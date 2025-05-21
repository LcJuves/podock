#!/bin/sh

mail="$1"
domain="$2"

{
    certbot certonly --manual -m "$mail" -d "$domain" --preferred-challenges dns
} || {
    echo "certbot generated with error!"
}

V2NODE_CONTAINER_ID=$(docker run -itd \
    -p 4433:443 -h "v2node" \
    -e SEC_KEY="$SEC_KEY" \
    ghcr.io/lcjuves/v2node)
echo "v2node's container id: $V2NODE_CONTAINER_ID"

mkdir -p /etc/nginx/cert/"$domain"
openssl req -x509 -nodes -days 1095 -newkey rsa:4096 \
    -out /etc/nginx/cert/"$domain"/certificate.crt \
    -keyout /etc/nginx/cert/"$domain"/private.key \
    -subj "/C=US/ST=New York/L=New York/O=Global Security/OU=Global Security/CN=$domain"
openssl dhparam -out /etc/nginx/cert/"$domain"/dhparam.pem 4096
mv /etc/nginx/conf.d/localhost.conf /etc/nginx/conf.d/"$domain".conf
sed -i "s/localhost/$domain/g" /etc/nginx/conf.d/"$domain".conf

systemctl start nginx.service
