FROM liangchengj/develop-environment:rustaceans-jit

ADD deno /usr/bin/
ENV DENO_INSTALL "/root/.deno"
ENV PATH "$DENO_INSTALL/bin:$PATH"

RUN apt-get install -y git sudo
RUN rustup component add rust-src rustfmt
