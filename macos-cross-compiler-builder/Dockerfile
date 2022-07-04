FROM liangchengj/container-base
RUN apt-get install -y gnupg2 apt-transport-https ca-certificates curl git cpio
RUN curl -L -s -o /etc/apt/sources.list.d/llvm-toolchain-stretch-13.sources.list \
    https://gitlab.com/LiangchengJ/podock/-/raw/048ce59dc1afbe9db9876bb2d73385c2c83ee37d/amuse-lang-environment/llvm-toolchain-stretch-13.sources.list
RUN curl -s https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN apt-get update -y

ADD cmake-3.23.1-linux-x86_64.tar.gz /opt/
ENV PATH "/opt/cmake-3.23.1-linux-x86_64/bin:$PATH"
RUN apt-get install zlib1g-dev libmpc-dev libmpfr-dev libgmp-dev clang-13 clang++-13 make libxml2-dev libssl1.0-dev liblzma-dev libbz2-dev -y
RUN apt-get install uuid-dev libacl1-dev -y
RUN ln -s /usr/bin/clang-13 /usr/bin/clang
RUN ln -s /usr/bin/clang++-13 /usr/bin/clang++
RUN ln -s /usr/lib/llvm-13/bin/llvm-config /usr/bin/llvm-config
RUN ln -s "$(find / -name libbz2.so)" /usr/lib/
ENV LLVM_SYS_130_PREFIX /usr/lib/llvm-13
WORKDIR /root
