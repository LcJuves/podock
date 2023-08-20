FROM lcjuves/container-base
RUN apt-get install -y inkscape xz-utils curl

ARG NODEJS_VERSION=v18.17.1
RUN mkdir -p /usr/local/denv/nodejs
RUN curl -fsSL https://nodejs.org/dist/$NODEJS_VERSION/node-$NODEJS_VERSION-linux-x64.tar.xz | tar -xJC /usr/local/denv/nodejs/
ENV PATH "/usr/local/denv/nodejs/node-$NODEJS_VERSION-linux-x64/bin:$PATH"

RUN npm install -g svgo
RUN apt-get install -y openssh-client python3-pip unzip git vim
RUN pip3 install https://github.com/codedread/scour/archive/master.zip
