FROM lcjuves/container-base
RUN apt-get install -y gnupg2 apt-transport-https ca-certificates curl git
RUN curl -L -s -o /etc/apt/sources.list.d/llvm-toolchain-buster-17.sources.list \
    https://gitlab.com/LcJuves/podock/-/raw/d73085d45ac6454b8122950e0601e1b71539dc0b/amuse-lang-environment/llvm-toolchain-buster-17.sources.list
RUN curl -s https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN apt-get update -y

ADD cmake-3.27.3-linux-x86_64.tar.gz /opt/
ENV PATH "/opt/cmake-3.27.3-linux-x86_64/bin:$PATH"
RUN apt-get install -y make libssl-dev zlib1g-dev
RUN apt-get install -y clang-17 clang++-17
RUN ln -s /usr/bin/clang-17 /usr/bin/clang
RUN ln -s /usr/bin/clang++-17 /usr/bin/clang++
RUN ln -s /usr/lib/llvm-17/bin/llvm-config /usr/bin/llvm-config
ENV LLVM_SYS_170_PREFIX /usr/lib/llvm-17
RUN apt-get install -y liblzma-dev libxml2-dev cpio libbz2-dev llvm-17-dev uuid-dev
RUN apt-get install -y libmpc-dev libmpfr-dev libgmp-dev
RUN apt-get install -y autoconf libacl1-dev libext2fs-dev
WORKDIR /root
