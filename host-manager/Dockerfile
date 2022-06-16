FROM liangchengj/container-image-builder

WORKDIR /root

COPY cloudflared-linux-amd64 /usr/bin/cloudflared
COPY config.yml /root/.cloudflared/config.yml
ADD init-cloudflared.sh .

RUN apt-get install -y vim inetutils-ping net-tools openssh-server
RUN mkdir /run/sshd
RUN echo >>/etc/ssh/sshd_config
RUN echo "PermitRootLogin yes" >>/etc/ssh/sshd_config
RUN date +%s | base64 >/tmp/passwd
RUN echo "$(whoami):$(cat /tmp/passwd)" | chpasswd
