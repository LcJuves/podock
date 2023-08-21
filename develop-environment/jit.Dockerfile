FROM develop-environment:rustaceans-jit

ARG NODEJS_VERSION=v16.15.1
RUN mkdir -p /usr/local/denv/nodejs
RUN curl -fsSL https://nodejs.org/dist/$NODEJS_VERSION/node-$NODEJS_VERSION-linux-x64.tar.xz | tar -xJC /usr/local/denv/nodejs/
ENV PATH "/usr/local/denv/nodejs/node-$NODEJS_VERSION-linux-x64/bin:$PATH"
