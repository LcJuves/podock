FROM liangchengj/rustaceans:jit

RUN apt-get install -y xz-utils

ARG ZIG_VERSION=0.9.1
RUN mkdir -p /usr/local/denv/zig
RUN cd /usr/local/denv/zig && curl -fsSL https://ziglang.org/download/$ZIG_VERSION/zig-linux-x86_64-$ZIG_VERSION.tar.xz | tar -xJf -
ENV PATH "/usr/local/denv/zig/zig-linux-x86_64-0.9.1:$PATH"

ARG JDK_VERSION=17.0.3.1
RUN mkdir -p /usr/local/denv/java
RUN cd /usr/local/denv/java && curl -fsSL https://fserv.liangchengj.com/txz/jdk-$JDK_VERSION-linux-x64.tar.xz | tar -xJf -
ENV JAVA_HOME /usr/local/denv/java/jdk-$JDK_VERSION-linux-x64
ENV PATH "$JAVA_HOME/bin:$PATH"

RUN apt-get install -y unzip
RUN curl -fsSL https://deno.land/install.sh | sh
ENV DENO_INSTALL "/root/.deno"
ENV PATH "$DENO_INSTALL/bin:$PATH"
