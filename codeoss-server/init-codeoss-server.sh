#!/bin/sh

if [ -z "$CODEOSS_SERVER_PORT" ]; then
    CODEOSS_SERVER_PORT=8000
fi

if [ -z "$CODEOSS_SERVER_TOKEN" ]; then
    CODEOSS_SERVER_TOKEN=3001bbf8-a6a7-40b4-a1dc-54ca44b7314e
fi

codeoss-server --host 0.0.0.0 --port $CODEOSS_SERVER_PORT --telemetry-level off --connection-token $CODEOSS_SERVER_TOKEN
