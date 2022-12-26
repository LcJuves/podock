FROM lcjuves/container-image-builder

WORKDIR /root

COPY cloudflared-linux-amd64 /usr/bin/cloudflared
COPY config.yml /root/.cloudflared/config.yml
ADD init-cloudflared.sh .

RUN apt-get install -y vim git openssh-server wget timeshift
RUN apt-get install -y inetutils-ping net-tools firewalld
RUN apt-get install -y fdisk gdisk parted
RUN mkdir /run/sshd
RUN printf "\nPermitRootLogin yes" >>/etc/ssh/sshd_config
RUN date +%s | base64 >/tmp/passwd
RUN echo "$(whoami):$(cat /tmp/passwd)" | chpasswd
