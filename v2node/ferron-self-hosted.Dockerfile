FROM container-base
RUN apt-get install -y curl
RUN curl -fsSL https://github.com/LcJuves/podock/raw/refs/heads/dev/lcjuves/container-image-builder/install-docker-for-debian.sh | sh

RUN curl -fsSL https://get.ferron.sh/v2 | sh
RUN apt-get install -y net-tools
EXPOSE 443

RUN apt-get install -y vim
WORKDIR /root
ADD ferron.kdl .


ADD init-ferron-self-hosted-v2node.sh .
