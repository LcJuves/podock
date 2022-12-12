FROM v2demo/v2demo:latest
RUN sed -i 's/latest\///' /opt/startup.sh
RUN sed -i 's/\/v2ray-l/\/v4.45.2\/v2ray-l/' /opt/startup.sh

ENTRYPOINT ["sh", "-c", "/opt/startup.sh"]
