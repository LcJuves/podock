FROM amuse-lang-environment:llvmenv-jit
RUN apt-get install -y git sudo
RUN rustup component add rust-src rustfmt
