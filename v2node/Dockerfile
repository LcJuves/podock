FROM alpine:latest
ADD startup.sh /opt/
RUN apk add --no-cache --virtual .build-deps ca-certificates curl

ENV PORT=443
ENV WS_URI=/
ENV V2RAY_VMESS_AEAD_FORCED=false

ENTRYPOINT ["sh", "-c", "/opt/startup.sh"]
