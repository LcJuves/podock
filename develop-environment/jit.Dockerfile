FROM develop-environment:rustaceans-jit
RUN apt-get install -y git

ARG FLUTTER_VERSION=3.13.0
ARG FLUTTER_DOWNLOAD_URL=https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_$FLUTTER_VERSION-stable.tar.xz
RUN curl -fsSL $FLUTTER_DOWNLOAD_URL | tar -xJC /usr/local/denv/
RUN ln -s /usr/local/denv/flutter/bin/cache/dart-sdk /usr/local/denv/dart
ENV PATH "/usr/local/denv/flutter/bin:$PATH"
RUN git config --global --add safe.directory /usr/local/denv/flutter
RUN flutter --suppress-analytics && flutter --disable-telemetry
RUN apt-get install -y cmake ninja-build libgtk-3-dev
RUN dart --disable-analytics
