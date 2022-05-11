FROM liangchengj/amuse-lang-environment:rust-compiler
RUN apt-get install -y gnupg2 apt-transport-https
ADD llvm-toolchain-stretch-13.sources.list /etc/apt/sources.list.d/
RUN curl -s https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN apt-get update -y
RUN apt-get install llvm-13-dev libclang-common-13-dev zlib1g-dev -y
RUN ln -s /usr/lib/llvm-13/bin/llvm-config /usr/bin/llvm-config
ENV LLVM_SYS_130_PREFIX /usr/lib/llvm-13
