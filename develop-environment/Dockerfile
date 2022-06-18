FROM liangchengj/develop-environment:gitpod
RUN curl -fsSL https://github.com/LiangchengJ/liangchengj/raw/main/clang/linux-like/config_my_git.sh | sh

ADD codeoss-server-linux-x64-web.tar.gz /usr/local/
ENV PATH "/usr/local/codeoss-server-linux-x64-web/bin:$PATH"

EXPOSE 8000 22

RUN apt-get install -y vim inetutils-ping net-tools openssh-server
RUN mkdir /run/sshd
RUN echo -e "\nPermitRootLogin yes" >>/etc/ssh/sshd_config
RUN date +%s | base64 >/tmp/passwd
RUN echo "$(whoami):$(cat /tmp/passwd)" | chpasswd
ADD cmd.sh /tmp/
CMD bash -e /tmp/cmd.sh
