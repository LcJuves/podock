FROM v2demo/v2demo:latest
RUN sed -i 's/latest\///' /opt/startup.sh
RUN sed -i 's/\/v2ray-l/\/v4.45.2\/v2ray-l/' /opt/startup.sh

ENV PORT=443
ENV WS_URI=/
ENV V2RAY_VMESS_AEAD_FORCED=false

ENTRYPOINT ["sh", "-c", "/opt/startup.sh"]
