FROM ubuntu:14.04

RUN add-apt-repository ppa:stebbins/handbrake-releases \
    && apt-get update \
    && apt-get install -y \
        build-essential \ 
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

