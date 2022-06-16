FROM debian:stable-slim
LABEL maintainer 'Liangcheng Juves <liangchengj@outlook.com>'
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y
RUN apt-get install -y git vim inetutils-ping net-tools openssh-server
ADD codeoss-server-linux-x64-web.tar.gz /usr/local/
EXPOSE 8000
ENV PATH "/usr/local/codeoss-server-linux-x64-web/bin:$PATH"
ADD init-codeoss-server.sh /usr/local/codeoss-server-linux-x64-web/
CMD bash -e /usr/local/codeoss-server-linux-x64-web/init-codeoss-server.sh
