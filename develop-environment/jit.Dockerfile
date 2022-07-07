FROM liangchengj/develop-environment:rustaceans-jit

ARG NODEJS_VERSION=v16.15.1
RUN mkdir -p /usr/local/denv/nodejs
RUN cd /usr/local/denv/nodejs && curl -fsSL https://nodejs.org/dist/$NODEJS_VERSION/node-$NODEJS_VERSION-linux-x64.tar.xz | tar -xJf -
ENV PATH "/usr/local/denv/nodejs/node-$NODEJS_VERSION-linux-x64/bin:$PATH"
