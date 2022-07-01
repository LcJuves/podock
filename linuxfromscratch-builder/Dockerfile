FROM liangchengj/container-base
RUN apt-get install -y binutils bison gawk gcc g++ m4 make patch perl python3 xz-utils texinfo
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN ln -snf /bin/bash /bin/sh
WORKDIR /root
ADD version-check.sh ./
