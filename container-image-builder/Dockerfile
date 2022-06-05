FROM debian:stable-slim
LABEL maintainer 'Liangcheng Juves <liangchengj@outlook.com>'
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y

RUN apt-get install -y \
  ca-certificates \
  curl \
  gnupg \
  lsb-release
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list >/dev/null
RUN apt-get update -y
RUN apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

RUN apt-get install -y unzip
RUN curl -fsSL https://deno.land/install.sh | sh
ENV DENO_INSTALL "/root/.deno"
ENV PATH "$DENO_INSTALL/bin:$PATH"
