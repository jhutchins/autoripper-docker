FROM ubuntu:14.04

RUN apt-get update \
    && apt-get install -y \
        curl \
        build-essential \ 
        pkg-config \
        python-pip \
        libc6-dev \
        libssl-dev \
        libexpat1-dev \
        libavcodec-dev \
        libgl1-mesa-dev \
        libqt4-dev
    && rm -rf /var/lib/apt/lists/*

RUN curl http://www.makemkv.com/download/makemkv-bin-1.9.7.tar.gz \
    && curl http://www.makemkv.com/download/makemkv-oss-1.9.7.tar.gz \
    && tar -zxvf makemkv * \
    && cd makemkv-oss \
    && ./configure \
    && make install \
    && ../makemkv-bin \
    && make install
