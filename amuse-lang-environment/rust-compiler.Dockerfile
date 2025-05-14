FROM container-base
RUN apt-get install curl gcc-12 -y
RUN ln -s /usr/bin/gcc-12 /usr/bin/cc
ENV RUSTUP_HOME=/etc/rustup
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --profile minimal --no-modify-path -y
RUN find /root/.cargo/bin -maxdepth \1 \! -name rustup \! -name bin | xargs -I {} cp {} /usr/bin/ && rm -f {}
ENV PATH="/root/.cargo/bin:$PATH"
WORKDIR /root
