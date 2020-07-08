FROM ubuntu:latest
RUN apt update -y 
RUN DEBIAN_FRONTEND="noninteractive" apt -y install tzdata
RUN apt install -y \
    autoconf \
    automake \
    autopoint \
    bash \
    bison \
    bzip2 \
    flex \
    g++ \
    g++-multilib \
    gettext \
    git \
    gperf \
    intltool \
    libc6-dev-i386 \
    libgdk-pixbuf2.0-dev \
    libltdl-dev \
    libssl-dev \
    libtool-bin \
    libxml-parser-perl \
    lzip \
    make \
    openssl \
    p7zip-full \
    patch \
    perl-base \
    python \
    ruby \
    sed \
    unzip \
    wget \
    xz-utils

WORKDIR /build

ARG TARGET

RUN git clone https://github.com/mxe/mxe.git 
RUN  cd /build/mxe\
     && make MXE_TARGETS='x86_64-w64-mingw32.static' -j$(nproc) qt5\
     && make clean-junk

ENV PATH="/build/mxe/usr/bin:${PATH}"
COPY build-qmake.sh /usr/bin

WORKDIR /src 

ENTRYPOINT ["/usr/bin/build-qmake.sh"]

