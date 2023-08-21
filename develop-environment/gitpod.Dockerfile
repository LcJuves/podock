FROM develop-environment:jit
RUN apt-get install -y sudo
RUN rustup component add rust-src rustfmt
