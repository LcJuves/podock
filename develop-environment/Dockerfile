FROM develop-environment:gitpod
RUN curl -fsSL https://github.com/LcJuves/lcjuves/raw/main/clang/linux-like/config_my_git.sh | sh

ARG CODEOSS_SERVER_VERSION=dev_test_part17
ARG CODEOSS_SERVER_URL=https://github.com/LcJuves/vscode/releases/download/$CODEOSS_SERVER_VERSION/codeoss-server-linux-x64-web.tar.gz
RUN curl -fsSL $CODEOSS_SERVER_URL | tar -zxC /usr/local/
ENV PATH="/usr/local/codeoss-server-linux-x64-web/bin:$PATH"

EXPOSE 8000 22

RUN apt-get install -y vim inetutils-ping net-tools openssh-server
RUN mkdir /run/sshd
RUN printf "\nPermitRootLogin yes" >>/etc/ssh/sshd_config
RUN date +%s | base64 >/tmp/passwd
RUN echo "$(whoami):$(cat /tmp/passwd)" | chpasswd
ADD cmd.sh /tmp/
CMD bash -e /tmp/cmd.sh
