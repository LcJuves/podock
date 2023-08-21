FROM amuse-lang-environment:rust-compiler
RUN apt-get install -y gnupg2 apt-transport-https
ADD llvm-toolchain-bookworm-17.sources.list /etc/apt/sources.list.d/
RUN curl -s https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN apt-get update -y
RUN apt-get install llvm-17-dev libpolly-17-dev zlib1g-dev lib32stdc++-12-dev -y
RUN ln -s /usr/lib/llvm-17/bin/llvm-config /usr/bin/llvm-config
ENV LLVM_SYS_170_PREFIX /usr/lib/llvm-17
