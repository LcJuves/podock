FROM container-base
RUN apt-get install -y curl gnupg2 apt-transport-https
ADD llvm-toolchain-trixie-22.sources.list /etc/apt/sources.list.d/
RUN curl -s https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN apt-get update -y

ADD cmake-3.27.3-linux-x86_64.tar.gz /opt/
ENV PATH="/opt/cmake-3.27.3-linux-x86_64/bin:$PATH"
RUN apt-get install -y make git
RUN apt-get install -y libssl-dev zlib1g-dev
RUN apt-get install -y clang-22 clang++-22
RUN ln -s /usr/bin/clang-22 /usr/bin/clang
RUN ln -s /usr/bin/clang++-22 /usr/bin/clang++
RUN ln -s /usr/lib/llvm-22/bin/llvm-config /usr/bin/llvm-config
ENV LLVM_SYS_221_PREFIX=/usr/lib/llvm-22
RUN apt-get install -y liblzma-dev libxml2-dev cpio libbz2-dev llvm-22-dev uuid-dev
RUN apt-get install -y libmpc-dev libmpfr-dev libgmp-dev
RUN apt-get install -y autoconf libacl1-dev libext2fs-dev
RUN apt-get install -y xz-utils

WORKDIR /root
