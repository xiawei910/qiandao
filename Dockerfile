FROM ubuntu:16.04
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak \
    && echo "\
deb-src http://archive.ubuntu.com/ubuntu xenial main restricted #Added by software-properties \n\
deb http://mirrors.aliyun.com/ubuntu/ xenial main restricted \n\
deb-src http://mirrors.aliyun.com/ubuntu/ xenial main restricted multiverse universe #Added by software-properties \n\
deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted \n\
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted multiverse universe #Added by software-properties \n\
deb http://mirrors.aliyun.com/ubuntu/ xenial universe \n\
deb http://mirrors.aliyun.com/ubuntu/ xenial-updates universe \n\
deb http://mirrors.aliyun.com/ubuntu/ xenial multiverse \n\
deb http://mirrors.aliyun.com/ubuntu/ xenial-updates multiverse \n\
deb http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse \n\
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse #Added by software-properties \n\
deb http://archive.canonical.com/ubuntu xenial partner \n\
deb-src http://archive.canonical.com/ubuntu xenial partner \n\
deb http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted \n\
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted multiverse universe #Added by software-properties \n\
deb http://mirrors.aliyun.com/ubuntu/ xenial-security universe \n\
deb http://mirrors.aliyun.com/ubuntu/ xenial-security multiverse \n\
"   > /etc/apt/sources.list
RUN apt-get update \
    && apt-get install -y \
        python-dev \
        python-pip \
        python-pbkdf2 \
        autoconf \
        g++ \
    && apt-get clean
RUN pip install --upgrade pip \
    && pip install \
        tornado \
        requests \
        pbkdf2 \
        pycrypto \
        chardet \
        u-msgpack-python \
        jinja2
