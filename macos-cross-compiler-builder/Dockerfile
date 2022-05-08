FROM debian:stretch-slim
LABEL maintainer 'Liangcheng Juves <liangchengj@outlook.com>'
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y
RUN apt-get install -y gnupg2 apt-transport-https ca-certificates curl git cpio
ADD llvm-toolchain-stretch-13.sources.list /etc/apt/sources.list.d/
RUN curl -s https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN echo "deb http://security.debian.org/debian-security stretch/updates main" >>/etc/apt/sources.list
RUN apt-get update -y

ADD cmake-3.14.5-Linux-x86_64.tar.gz /opt/
ENV PATH "/opt/cmake-3.14.5-Linux-x86_64/bin:$PATH"
RUN apt-get install zlib1g-dev libmpc-dev libmpfr-dev libgmp-dev clang-13 clang++-13 make libxml2-dev libssl-dev liblzma-dev libbz2-dev -y
RUN apt-get install uuid-dev libssl1.0-dev libacl1-dev -y
RUN ln -s /usr/bin/clang-13 /usr/bin/clang
RUN ln -s /usr/bin/clang++-13 /usr/bin/clang++
RUN ln -s /usr/lib/llvm-13/bin/llvm-config /usr/bin/llvm-config
RUN ln -s "$(find / -name libbz2.so)" /usr/lib/
ENV LLVM_SYS_130_PREFIX /usr/lib/llvm-13
WORKDIR /root
