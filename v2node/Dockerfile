FROM v2demo/v2demo:latest
RUN sed -i 's/latest/v4.45.2/' /opt/startup.sh

ENTRYPOINT ["sh", "-c", "/opt/startup.sh"]
