FROM liangchengj/container-base

RUN apt-get install -y curl
RUN curl -fsSL https://gitlab.com/LiangchengJ/podock/-/raw/main/container-image-builder/install-docker-for-debian.sh | sh

RUN apt-get install -y unzip
RUN curl -fsSL https://deno.land/install.sh | sh
ENV DENO_INSTALL "/root/.deno"
ENV PATH "$DENO_INSTALL/bin:$PATH"

RUN apt-get install -y podman
