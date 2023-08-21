FROM container-base
RUN apt-get install -y curl gnupg2 apt-transport-https
ARG GIT_SHA_ID=91e109c6556e19906ba14e8f8c9072481c6054c2
ARG GITLAB_URL=https://gitlab.com/LcJuves/podock/-/raw/$GIT_SHA_ID/amuse-lang-environment/llvm-toolchain-bookworm-17.sources.list
RUN curl -L -s -o /etc/apt/sources.list.d/llvm-toolchain-bookworm-17.sources.list $GITLAB_URL
RUN curl -s https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN apt-get update -y

RUN apt-get install -y xz-utils unzip
RUN apt-get install -y make autoconf clang-17
RUN ln -s /usr/bin/clang-17 /usr/bin/cc

RUN apt-get install -y libcurl4-openssl-dev libssl-dev libexpat1-dev zlib1g-dev
RUN apt-get install -y gettext
RUN curl -fsSL https://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.17.tar.gz | tar -zxf -
RUN cd libiconv-1.17 && ./configure && make && make install
RUN rm -rf libiconv*
RUN apt-get install -y openjdk-17-jre
RUN apt-get install -y asciidoc
