#!/usr/bin/env bash

/usr/sbin/sshd &>/var/log/sshd.log

/usr/local/codeoss-server-linux-x64-web/bin/codeoss-server \
    --host 0.0.0.0 \
    --port 8000 \
    --telemetry-level off \
    --connection-token 3001bbf8-a6a7-40b4-a1dc-54ca44b7314e \
    &>/var/log/codeoss-server.log &
