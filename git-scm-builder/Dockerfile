FROM liangchengj/container-base
RUN apt-get install -y curl gnupg2 apt-transport-https
RUN curl -L -s -o /etc/apt/sources.list.d/llvm-toolchain-stretch-13.sources.list \
    https://gitlab.com/LcJuves/podock/-/raw/048ce59dc1afbe9db9876bb2d73385c2c83ee37d/amuse-lang-environment/llvm-toolchain-stretch-13.sources.list
RUN curl -s https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN apt-get update -y

RUN apt-get install -y curl xz-utils unzip
RUN apt-get install -y make autoconf clang-13
RUN ln -s /usr/bin/clang-13 /usr/bin/cc

RUN apt-get install -y libssl1.0-dev libcurl4-openssl-dev libexpat1-dev zlib1g-dev
RUN apt-get install -y gettext asciidoc
RUN curl -fsSL https://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.17.tar.gz | tar -zxf -
RUN cd libiconv-1.17 && ./configure && make && make install
RUN rm -rf libiconv*
