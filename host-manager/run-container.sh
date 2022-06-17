#!/usr/bin/env bash

_HOSTNAME="$(echo "$1" | base64)"
echo "hostname: $_HOSTNAME"

bootstrap_args=()
bootstrap_args_index=0
count=1
for i in "$@"; do
    if [ $count -gt 1 ]; then
        bootstrap_args[$bootstrap_args_index]=$i
    fi
    count=$((count + 1))
    bootstrap_args_index=$((bootstrap_args_index + 1))
done

echo "bootstrap arguments: ${bootstrap_args[*]}"

docker run "${bootstrap_args[@]}" --privileged --expose 23-9934 -v /var/run/docker.sock:/var/run/docker.sock -h "$_HOSTNAME" liangchengj/host-manager
