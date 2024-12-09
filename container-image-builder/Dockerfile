FROM container-base
RUN apt-get install -y curl
RUN curl -fsSL https://gitlab.com/LcJuves/podock/-/raw/main/container-image-builder/install-docker-for-debian.sh | sh
RUN apt-get install -y podman

RUN apt-get install -y apt-transport-https
RUN curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/dart.gpg
RUN echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' | tee /etc/apt/sources.list.d/dart_stable.list
RUN apt-get update -y
RUN apt-get install -y dart=3.0.3-1
RUN dart --disable-analytics
