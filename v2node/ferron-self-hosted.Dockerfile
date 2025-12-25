FROM container-base
RUN apt-get install -y curl
RUN curl -fsSL https://github.com/LcJuves/podock/raw/refs/heads/dev/lcjuves/container-image-builder/install-docker-for-debian.sh | sh

# Install packages required for adding a new repository
RUN apt install -y curl gnupg2 ca-certificates lsb-release debian-archive-keyring

# Add the public PGP key
RUN curl https://deb.ferron.sh/signing.pgp | gpg --dearmor | tee /usr/share/keyrings/ferron-keyring.gpg >/dev/null

# Add a new Debian package repository
RUN echo "deb [signed-by=/usr/share/keyrings/ferron-keyring.gpg] https://deb.ferron.sh $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/ferron.list

# Fetch the package lists
RUN apt update -y

RUN apt-get install -y ferron
ADD ferron.kdl /etc/

RUN apt-get install -y net-tools
EXPOSE 443

RUN apt-get install -y vim
WORKDIR /root

ADD init-ferron-self-hosted-v2node.sh .
