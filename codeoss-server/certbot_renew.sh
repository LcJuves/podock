#!/bin/sh
# https://certbot.eff.org/instructions?ws=nginx&os=debianbuster

certbot renew --quiet --renew-hook "systemctl restart nginx.service"
