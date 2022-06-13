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

# curl -L -O https://gitlab.com/LiangchengJ/podock/-/raw/main/py3-builder/Python39.tar.xz
# ADD Python39.tar.xz /usr/share/py3/
# ENV PATH "/usr/share/py3/Python39/bin:$PATH"
# RUN ln -s /usr/share/py3/Python39/bin/python3 /usr/bin/python
# RUN ln -s /usr/share/py3/Python39/bin/pip3 /usr/bin/pip
