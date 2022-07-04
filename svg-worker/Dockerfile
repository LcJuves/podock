FROM alpine
RUN apk update -q
RUN apk add inkscape nodejs npm curl -q
RUN npm install -g npm
RUN npm install -g svgo
RUN apk add git -q
RUN apk add openssh-client -q

RUN apk add python3 py3-pip -q
RUN pip install https://github.com/codedread/scour/archive/master.zip
