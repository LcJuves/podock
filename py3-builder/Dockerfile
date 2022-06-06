FROM debian:stretch-slim
LABEL maintainer 'Liangcheng Juves <liangchengj@outlook.com>'
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y
RUN apt-get install -y curl xz-utils
# Dependencies for building python from source
RUN apt-get install -y build-essential \
    libreadline-gplv2-dev \
    libncursesw5-dev \
    libssl-dev \
    libsqlite3-dev \
    tk-dev \
    libgbm-dev \
    libc6-dev \
    libbz2-dev \
    libffi-dev \
    zlib1g-dev
