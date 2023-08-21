FROM rustaceans:jit

RUN apt-get install -y xz-utils

ARG ZIG_VERSION=0.11.0
RUN mkdir -p /usr/local/denv/zig
RUN curl -fsSL https://ziglang.org/download/$ZIG_VERSION/zig-linux-x86_64-$ZIG_VERSION.tar.xz | tar -xJC /usr/local/denv/zig/
ENV PATH "/usr/local/denv/zig/zig-linux-x86_64-$ZIG_VERSION:$PATH"

ARG JDK_VERSION=17.0.3.1
RUN mkdir -p /usr/local/denv/java
RUN curl -fsSL https://fserv.lcjuves.com/txz/jdk-$JDK_VERSION-linux-x64.tar.xz | tar -xJC /usr/local/denv/java/
ENV JAVA_HOME /usr/local/denv/java/jdk-$JDK_VERSION-linux-x64
ENV PATH "$JAVA_HOME/bin:$PATH"
