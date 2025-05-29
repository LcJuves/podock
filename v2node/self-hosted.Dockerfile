FROM container-base
RUN apt-get install -y curl podman

RUN apt-get install -y nginx net-tools
EXPOSE 443

RUN apt-get install -y certbot vim
WORKDIR /root
ADD certbot_renew.sh .
ADD localhost.conf /etc/nginx/conf.d/

ADD init-self-hosted-v2node.sh .
