FROM lcjuves/container-base
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

# curl -L -O https://gitlab.com/LcJuves/podock/-/raw/main/py3-builder/Python39.tar.xz
# ADD Python39.tar.xz /usr/share/py3/
# ENV PATH "/usr/share/py3/Python39/bin:$PATH"
# RUN ln -s /usr/share/py3/Python39/bin/python3 /usr/bin/python
# RUN ln -s /usr/share/py3/Python39/bin/pip3 /usr/bin/pip
# RUN ln -s /usr/lib/x86_64-linux-gnu/libffi.so.7 /usr/lib/x86_64-linux-gnu/libffi.so.6
