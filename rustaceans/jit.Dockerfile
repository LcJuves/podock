FROM amuse-lang-environment:llvmenv-jit
RUN apt-get install -y pkg-config libssl-dev gcc-mingw-w64-x86-64 clang-19
RUN ln -s /usr/bin/clang-19 /usr/bin/clang
RUN ln -s /usr/bin/clang++-19 /usr/bin/clang++
RUN ln -s /usr/bin/clang-cpp-19 /usr/bin/c++
RUN rustup target add aarch64-apple-darwin x86_64-apple-darwin --toolchain=stable
RUN rustup target add aarch64-pc-windows-gnu  x86_64-pc-windows-gnu --toolchain=stable
ADD osx-cross-compiler.tar.xz /root/
ADD osx-aarch64-darwin-rustc /usr/bin/
ADD osx-aarch64-darwin-cargo /usr/bin/
ADD osx-x86-darwin-rustc /usr/bin/
ADD osx-x86-darwin-cargo /usr/bin/
ENV OSX_CROSS_COMPILER=/root/osx-cross-compiler

RUN echo "[target.x86_64-apple-darwin]" >>/root/.cargo/config
RUN find "$OSX_CROSS_COMPILER/bin" -maxdepth 1 -name 'x86_64-[A-Za-b]*[0-9][0-9]*-cc' -printf 'linker = "%p"\n' >>/root/.cargo/config
RUN find "$OSX_CROSS_COMPILER/bin" -maxdepth 1 -name 'x86_64-[A-Za-b]*[0-9][0-9]*-ar' -printf 'ar = "%p"\n' >>/root/.cargo/config
RUN echo >>/root/.cargo/config
RUN echo "[target.aarch64-apple-darwin]" >>/root/.cargo/config
RUN find "$OSX_CROSS_COMPILER/bin" -maxdepth 1 -name 'aarch64-[A-Za-b]*[0-9][0-9]*-cc' -printf 'linker = "%p"\n' >>/root/.cargo/config
RUN find "$OSX_CROSS_COMPILER/bin" -maxdepth 1 -name 'aarch64-[A-Za-b]*[0-9][0-9]*-ar' -printf 'ar = "%p"\n' >>/root/.cargo/config
RUN echo >>/root/.cargo/config
RUN echo "$OSX_CROSS_COMPILER/lib" | tee /etc/ld.so.conf.d/darwin.conf
RUN ldconfig

WORKDIR /root
