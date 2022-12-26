FROM liangchengj/amuse-lang-environment:rust-compiler
RUN apt-get install -y gnupg2 apt-transport-https
RUN curl -L -s -o /etc/apt/sources.list.d/llvm-toolchain-stretch-13.sources.list \
    https://gitlab.com/LcJuves/podock/-/raw/048ce59dc1afbe9db9876bb2d73385c2c83ee37d/amuse-lang-environment/llvm-toolchain-stretch-13.sources.list
RUN curl -s https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN apt-get update -y
RUN apt-get install llvm-13-dev libclang-common-13-dev zlib1g-dev -y
RUN ln -s /usr/lib/llvm-13/bin/llvm-config /usr/bin/llvm-config
ENV LLVM_SYS_130_PREFIX /usr/lib/llvm-13
