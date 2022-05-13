FROM liangchengj/rustaceans:jit
ADD zig-linux-x86_64-0.9.1.tar.xz /usr/local/denv/zig/
ENV PATH "/usr/local/denv/zig/zig-linux-x86_64-0.9.1:$PATH"
ADD jdk-8u311-linux-x64.tar.xz /usr/local/denv/java/
ENV JAVA_HOME /usr/local/denv/java/jdk-8u311-linux-x64
ENV JRE_HOME "$JAVA_HOME/jre"
ENV CLASSPATH ".:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar"
ENV PATH "$JAVA_HOME/bin:$PATH"
