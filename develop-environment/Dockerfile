FROM liangchengj/develop-environment:jit
RUN apt-get install -y git sudo
RUN rustup component add rust-src rustfmt
RUN bash -c "$(curl -fsSL https://github.com/LiangchengJ/liangchengj/raw/main/clang/linux-like/config_my_git.sh)"