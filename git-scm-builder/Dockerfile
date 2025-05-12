FROM container-base
RUN apt-get install -y curl gnupg2 apt-transport-https
ADD llvm-toolchain-bookworm-19.sources.list /etc/apt/sources.list.d/
RUN curl -s https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN apt-get update -y

RUN apt-get install -y xz-utils unzip
RUN apt-get install -y make autoconf clang-19
RUN ln -s /usr/bin/clang-19 /usr/bin/cc

RUN apt-get install -y libcurl4-openssl-dev libssl-dev libexpat1-dev zlib1g-dev
RUN apt-get install -y gettext
RUN curl -fsSL https://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.17.tar.gz | tar -zxf -
RUN cd libiconv-1.17 && ./configure && make && make install
RUN rm -rf libiconv*
RUN apt-get install -y openjdk-17-jre
RUN apt-get install -y asciidoc
