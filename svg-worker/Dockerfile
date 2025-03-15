FROM container-base
RUN apt-get install -y inkscape xz-utils curl

ARG NODEJS_VERSION=v18.17.1
RUN mkdir -p /usr/local/denv/nodejs
RUN curl -fsSL https://nodejs.org/dist/$NODEJS_VERSION/node-$NODEJS_VERSION-linux-x64.tar.xz | tar -xJC /usr/local/denv/nodejs/
ENV PATH "/usr/local/denv/nodejs/node-$NODEJS_VERSION-linux-x64/bin:$PATH"

RUN npm install -g svgo
RUN apt-get install -y openssh-client unzip git vim
RUN apt-get install -y python3-pip python3-venv
RUN python3 -m venv /usr/venv
RUN /usr/venv/bin/pip3 install --use-pep517 https://github.com/codedread/scour/archive/master.zip
ENV PATH "/usr/venv/bin:$PATH"

RUN apt-get install -y openjdk-17-jre

WORKDIR /root
