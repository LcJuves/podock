FROM debian:stretch-slim
LABEL maintainer 'Liangcheng Juves <liangchengj@outlook.com>'
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y
RUN apt-get install curl gcc-6 -y
RUN ln -s /usr/bin/gcc-6 /usr/bin/cc
ENV RUSTUP_HOME /etc/rustup
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --profile minimal --no-modify-path -y
RUN find /root/.cargo/bin -maxdepth \1 \! -name rustup \! -name bin -exec mv {} /usr/bin/ \;
ENV PATH "$PATH:/root/.cargo/bin"
WORKDIR /root
