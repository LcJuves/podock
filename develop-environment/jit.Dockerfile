FROM liangchengj/develop-environment:rustaceans-jit

ADD flutter_linux_3.0.0-stable.tar.xz /usr/local/denv/
RUN ln -s /usr/local/denv/flutter/bin/cache/dart-sdk /usr/local/denv/dart
ENV PATH "/usr/local/denv/flutter/bin:$PATH"

ADD node-v16.15.1-linux-x64.tar.xz /usr/local/denv/nodejs/
ENV PATH "/usr/local/denv/nodejs/node-v16.15.1-linux-x64/bin:$PATH"
