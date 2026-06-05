FROM rustaceans:jit

RUN apt-get install -y xz-utils

ARG ZIG_VERSION=0.16.0
RUN mkdir -p /usr/local/denv/zig
RUN curl -fsSL https://ziglang.org/download/$ZIG_VERSION/zig-linux-x86_64-$ZIG_VERSION.tar.xz | tar -xJC /usr/local/denv/zig/
ENV PATH="/usr/local/denv/zig/zig-linux-x86_64-$ZIG_VERSION:$PATH"


RUN apt-get install -y openjdk-25-jdk
