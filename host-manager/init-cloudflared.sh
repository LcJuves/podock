#!/bin/sh
# https://developers.cloudflare.com/cloudflare-one/tutorials/ssh/
# cloudflared tunnel --hostname <subdomain> --url ssh://localhost:22
# https://danishshakeel.me/creating-an-ssh-tunnel-using-cloudflare-argo-and-access/

cloudflared tunnel login

/usr/sbin/sshd >/var/log/sshd.log 2>&1
cloudflared tunnel delete ssh >/dev/null 2>&1
TID=$(cloudflared tunnel create ssh | awk 'END{print $NF}')

sed -i "s/6ff42ae2-765d-4adf-8112-31c55c1551ef/$TID/g" ~/.cloudflared/config.yml
CF_HOSTNAME=$(hostname | base64 -d)
sed -i "s/azure.widgetcorp.tech/$CF_HOSTNAME/g" ~/.cloudflared/config.yml

cloudflared tunnel route dns --overwrite-dns "$TID" "$CF_HOSTNAME"
cloudflared tunnel run "$TID" >/var/log/cloudflared.log 2>&1
