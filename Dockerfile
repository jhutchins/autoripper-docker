FROM ubuntu:14.04

RUN echo 'deb http://ppa.launchpad.net/stebbins/handbrake-releases/ubuntu trusty main' >> /etc/apt/sources.list \
    && gpg \
        --ignore-time-conflict \
        --no-option \
        --no-default-keyring \
        --secret-keyring /etc/apt/secring.gpg \
        --trustdb-name /etc/apt/trustdb.gpg \
        --keyring /etc/apt/trusted.gpg \
        --keyserver keyserver.ubuntu.com \
        --recv 43D3A9F60C58A7169778E6FB8771ADB0816950D8 \
    && apt-get update \
    && apt-get install -y \
        build-essential \ 
        git \
        handbrake-cli \
        pkg-config \
        python-pip \
        libc6-dev \
        libssl-dev \
        libexpat1-dev \
        libavcodec-dev \
        libgl1-mesa-dev \
        libqt4-dev \
        wget \
    && rm -rf /var/lib/apt/lists/*

RUN wget http://www.makemkv.com/download/makemkv-bin-1.9.7.tar.gz \
    && curl http://www.makemkv.com/download/makemkv-oss-1.9.7.tar.gz \
    && tar -zxvf makemkv * \
    && cd makemkv-oss \
    && ./configure \
    && make install \
    && ../makemkv-bin \
    && make install

RUN pip install tendo pyyaml peewee

