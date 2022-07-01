FROM liangchengj/container-base
RUN apt-get install -y curl gnupg2 apt-transport-https
ADD llvm-toolchain-stretch-13.sources.list /etc/apt/sources.list.d/
RUN echo "deb http://security.debian.org/debian-security stretch/updates main" >>/etc/apt/sources.list
RUN curl -s https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN apt-get update -y

RUN apt-get install -y curl xz-utils unzip
RUN apt-get install -y make autoconf clang-13
RUN ln -s /usr/bin/clang-13 /usr/bin/cc

RUN apt-get install -y libssl1.0-dev libcurl4-openssl-dev libexpat1-dev zlib1g-dev
RUN apt-get install -y gettext asciidoc
RUN curl -L -O https://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.17.tar.gz
RUN tar -zxf libiconv-1.17.tar.gz
RUN cd libiconv-1.17 && ./configure && make && make install
RUN rm -rf libiconv*
