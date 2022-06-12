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

RUN apt-get install -y nginx
EXPOSE 443

RUN apt-get install -y certbot
ADD hosted-v2.liangchengj.com.conf /etc/nginx/conf.d/
# ADD Python39.tar.xz /usr/share/py3/
# ENV PATH "/usr/share/py3/Python39/bin:$PATH"
# RUN ln -s /usr/share/py3/Python39/bin/python3 /usr/bin/python
# RUN ln -s /usr/share/py3/Python39/bin/pip3 /usr/bin/pip
# RUN ln -s /usr/lib/x86_64-linux-gnu/libffi.so.7 /usr/lib/x86_64-linux-gnu/libffi.so.6
# RUN pip install certbot-nginx
# RUN certbot certonly --standalone -m "liangchengj@outlook.com" -d "hosted-v2.liangchengj.com"
# https://certbot.eff.org/instructions?ws=nginx&os=debianbuster
