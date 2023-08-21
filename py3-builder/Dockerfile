FROM container-base
RUN apt-get install -y curl xz-utils
# Dependencies for building python from source
RUN apt-get install -y build-essential gdb lcov pkg-config \
    libbz2-dev libffi-dev libgdbm-dev libgdbm-compat-dev liblzma-dev \
    libncurses5-dev libreadline6-dev libsqlite3-dev libssl-dev \
    lzma lzma-dev tk-dev uuid-dev zlib1g-dev

# curl -L -O https://gitlab.com/LcJuves/podock/-/raw/main/py3-builder/Python39.tar.xz
# ADD Python39.tar.xz /usr/share/py3/
# ENV PATH "/usr/share/py3/Python39/bin:$PATH"
# RUN ln -s /usr/share/py3/Python39/bin/python3 /usr/bin/python
# RUN ln -s /usr/share/py3/Python39/bin/pip3 /usr/bin/pip
# RUN ln -s /usr/lib/x86_64-linux-gnu/libffi.so.7 /usr/lib/x86_64-linux-gnu/libffi.so.6
