FROM lcjuves/amuse-lang-environment:llvmenv-jit
RUN apt-get install -y pkg-config libssl-dev gcc-mingw-w64-x86-64 clang-17
RUN ln -s /usr/bin/clang-17 /usr/bin/clang
RUN ln -s /usr/bin/clang++-17 /usr/bin/clang++
RUN ln -s /usr/bin/clang-cpp-17 /usr/bin/c++
RUN rustup target add x86_64-pc-windows-gnu x86_64-apple-darwin aarch64-apple-darwin --toolchain=stable
ENV MACOS_SDK_VERSION "12.3"
ADD macos-cross-compiler.tar.xz /root/
ADD x86-macos-rustc /usr/bin/
ADD x86-macos-cargo /usr/bin/
ADD arm-macos-rustc /usr/bin/
ADD arm-macos-cargo /usr/bin/
ENV MACOS_CROSS_COMPILER /root/macos-cross-compiler

RUN echo "[target.x86_64-apple-darwin]" >>/root/.cargo/config
RUN find "$MACOS_CROSS_COMPILER/bin" -maxdepth 1 -name 'x86_64-[A-Za-b]*[0-9][0-9]*-cc' -printf 'linker = "%p"\n' >>/root/.cargo/config
RUN find "$MACOS_CROSS_COMPILER/bin" -maxdepth 1 -name 'x86_64-[A-Za-b]*[0-9][0-9]*-ar' -printf 'ar = "%p"\n' >>/root/.cargo/config
RUN echo >>/root/.cargo/config
RUN echo "[target.aarch64-apple-darwin]" >>/root/.cargo/config
RUN find "$MACOS_CROSS_COMPILER/bin" -maxdepth 1 -name 'aarch64-[A-Za-b]*[0-9][0-9]*-cc' -printf 'linker = "%p"\n' >>/root/.cargo/config
RUN find "$MACOS_CROSS_COMPILER/bin" -maxdepth 1 -name 'aarch64-[A-Za-b]*[0-9][0-9]*-ar' -printf 'ar = "%p"\n' >>/root/.cargo/config
RUN echo >>/root/.cargo/config
RUN echo "$MACOS_CROSS_COMPILER/lib" | tee /etc/ld.so.conf.d/darwin.conf
RUN ldconfig

WORKDIR /root
