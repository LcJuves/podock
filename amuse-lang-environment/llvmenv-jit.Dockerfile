FROM amuse-lang-environment:rust-compiler
RUN apt-get install -y gnupg2 apt-transport-https
ADD llvm-toolchain-trixie-22.sources.list /etc/apt/sources.list.d/
RUN curl -s https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN apt-get update -y
RUN apt-get install -y llvm-22-dev libpolly-22-dev libllvmlibc-22-dev zlib1g-dev libzstd-dev
RUN ln -s /usr/lib/llvm-22/bin/llvm-config /usr/bin/llvm-config
ENV LLVM_SYS_221_PREFIX=/usr/lib/llvm-22
