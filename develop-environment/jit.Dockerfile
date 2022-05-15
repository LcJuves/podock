FROM liangchengj/rustaceans:jit
ADD zig-linux-x86_64-0.9.1.tar.xz /usr/local/denv/zig/
ENV PATH "/usr/local/denv/zig/zig-linux-x86_64-0.9.1:$PATH"
ADD jdk-8u311-linux-x64.tar.xz /usr/local/denv/java/
ENV JAVA_HOME /usr/local/denv/java/jdk-8u311-linux-x64
ENV JRE_HOME "$JAVA_HOME/jre"
ENV CLASSPATH ".:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar"
ENV PATH "$JAVA_HOME/bin:$PATH"
ADD flutter_linux_3.0.0-stable.tar.xz /usr/local/denv/
RUN ln -s /usr/local/denv/flutter/bin/cache/dart-sdk /usr/local/denv/dart
ENV PATH "/usr/local/denv/flutter/bin:$PATH"
