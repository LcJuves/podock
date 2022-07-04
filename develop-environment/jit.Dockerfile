FROM liangchengj/develop-environment:rustaceans-jit

ADD node-v16.15.1-linux-x64.tar.xz /usr/local/denv/nodejs/
ENV PATH "/usr/local/denv/nodejs/node-v16.15.1-linux-x64/bin:$PATH"
