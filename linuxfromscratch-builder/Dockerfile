FROM container-base
RUN apt-get install -y binutils bison gawk gcc g++ m4 make patch perl python3 xz-utils texinfo
RUN ln -s /usr/bin/python3 /usr/bin/python
WORKDIR /root
ADD version-check.sh ./
