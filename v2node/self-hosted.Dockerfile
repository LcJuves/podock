FROM container-base
RUN apt-get install -y curl

RUN apt-get install -y nginx net-tools
EXPOSE 443

RUN apt-get install -y certbot vim podman
WORKDIR /root
ADD certbot_renew.sh .
ADD localhost.conf /etc/nginx/conf.d/
ADD crun /usr/bin/
ADD init-self-hosted-v2node.sh .
