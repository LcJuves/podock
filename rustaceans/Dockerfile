FROM liangchengj/amuse-lang-environment:llvmenv-jit
# COPY sources.list /etc/apt/sources.list
# RUN apt-get update -y

RUN apt-get install -y libssl-dev gcc-mingw-w64-x86-64 git clang-13 clang++-13 cmake libgmp-dev libmpfr-dev libmpc-dev
RUN ln -s /usr/bin/clang-13 /usr/bin/clang
RUN ln -s /usr/bin/clang++-13 /usr/bin/clang++
RUN rustup target add x86_64-pc-windows-gnu x86_64-apple-darwin --toolchain=stable
ENV MACOS_CROSS_COMPILER /root/macos-cross-compiler
RUN install -d $MACOS_CROSS_COMPILER/osxcross
RUN (cd $MACOS_CROSS_COMPILER && git clone https://github.com/tpoechtrager/osxcross)
RUN (cd $MACOS_CROSS_COMPILER/osxcross && git checkout 7c090bd8cd4ad28cf332f1d02267630d8f333c19)
RUN (curl -L -O https://s3.dockerproject.org/darwin/v2/MacOSX10.10.sdk.tar.xz && mv MacOSX10.10.sdk.tar.xz $MACOS_CROSS_COMPILER/osxcross/tarballs/)
RUN (cd $MACOS_CROSS_COMPILER/osxcross && UNATTENDED=yes OSX_VERSION_MIN=10.7 ./build.sh && OCDEBUG=1 ./build_gcc.sh)
RUN echo "[target.x86_64-apple-darwin]" >>/root/.cargo/config
RUN find $MACOS_CROSS_COMPILER -name x86_64-apple-darwin14-cc -printf 'linker = "%p"\n' >>/root/.cargo/config
RUN echo >>/root/.cargo/config


# RUN C_INCLUDE_PATH=$MACOS_CROSS_COMPILER/osxcross/target/SDK/MacOSX10.10.sdk/usr/include CC=$MACOS_CROSS_COMPILER/osxcross/target/bin/x86_64-apple-darwin14-gcc cargo build --release --target x86_64-apple-darwin


# RUN apt-get install -y sudo
# RUN rustup component add rust-src rustfmt

# RUN git clone https://jihulab.com/LiangchengJ/llvm-ir-demo.git

# https://blog.csdn.net/qq_36393978/article/details/118678521
