FROM debian:stable-slim
LABEL maintainer 'Liangcheng Juves <liangchengj@outlook.com>'
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y
ADD codeoss-server-linux-x64-web.tar.gz /usr/local/
EXPOSE 8000
ENV PATH "/usr/local/codeoss-server-linux-x64-web/bin:$PATH"
CMD "/usr/local/codeoss-server-linux-x64-web/bin/codeoss-server"
