FROM amuse-lang-environment:rust-compiler
RUN apt-get install -y gnupg2 apt-transport-https
ADD llvm-toolchain-bookworm-19.sources.list /etc/apt/sources.list.d/
RUN curl -s https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN apt-get update -y
RUN apt-get install -y llvm-19-dev libpolly-19-dev lib32stdc++-12-dev zlib1g-dev libzstd-dev
RUN ln -s /usr/lib/llvm-19/bin/llvm-config /usr/bin/llvm-config
ENV LLVM_SYS_191_PREFIX=/usr/lib/llvm-19
