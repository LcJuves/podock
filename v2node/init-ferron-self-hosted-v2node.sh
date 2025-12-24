#!/bin/sh

mail="$1"
domain="$2"
challenge="$3"
api_key="$4"

V2NODE_CONTAINER_ID=$(docker run -itd \
	-p 4433:4433 -h "v2node" \
	ghcr.io/lcjuves/v2node)
echo "v2node's container id: $V2NODE_CONTAINER_ID"

sed -i "s/dns-01/$challenge/g" /root/ferron.kdl
sed -i "s/your_api_key/$api_key/g" /root/ferron.kdl
sed -i "s/someone@example.com/$mail/g" /root/ferron.kdl
sed -i "s/localhost/$domain/g" /root/ferron.kdl

systemctl start ferron.service
