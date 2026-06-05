FROM amuse-lang-environment:llvmenv-jit
RUN apt-get install -y git
RUN rustup component add rust-src rustfmt
