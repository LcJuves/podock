FROM container-base
RUN apt-get install -y curl
RUN curl -fsSL https://github.com/LcJuves/podock/raw/refs/heads/dev/lcjuves/container-image-builder/install-docker-for-debian.sh | sh

RUN apt-get install -y nginx net-tools
EXPOSE 443

WORKDIR /root
ADD certbot_renew.sh .
RUN apt install python3 python3-dev python3-venv libaugeas-dev gcc -y
RUN python3 -m venv /opt/certbot/
RUN /opt/certbot/bin/pip install --upgrade pip
RUN /opt/certbot/bin/pip install certbot certbot-nginx
RUN ln -s /opt/certbot/bin/certbot /usr/bin/certbot
RUN apt-get install -y vim
ADD localhost.conf /etc/nginx/conf.d/

ADD init-nginx-self-hosted-v2node.sh .
