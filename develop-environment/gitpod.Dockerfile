FROM liangchengj/develop-environment:jit
RUN apt-get install -y git sudo
RUN rustup component add rust-src rustfmt
