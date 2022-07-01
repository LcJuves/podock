FROM liangchengj/container-base
RUN apt-get install -y curl
RUN curl -fsSL https://gitlab.com/LiangchengJ/podock/-/raw/main/container-image-builder/install-docker-for-debian.sh | sh

RUN apt-get install -y nginx net-tools firewalld
EXPOSE 443

RUN apt-get install -y certbot vim
WORKDIR /root
ADD certbot_renew.sh .
ADD localhost.conf /etc/nginx/conf.d/

ENV PORT=443
ENV WS_URI=/
ENV v2ray.vmess.aead.forced=false

ADD init-self-hosted-v2node.sh .
