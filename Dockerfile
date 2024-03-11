FROM ubuntu:24.04

ENV PS3DEV  /usr/local/ps3dev
ENV PSL1GHT $PS3DEV
ENV PATH    $PATH:$PS3DEV/bin:$PS3DEV/ppu/bin:$PS3DEV/spu/bin:$PS3DEV/portlibs/ppu/bin
ENV PKG_CONFIG_PATH $PKG_CONFIG_PATH:$PS3DEV/portlibs/ppu/lib/pkgconfig

ENV DEBIAN_FRONTEND noninteractive

RUN apt update \
    && apt upgrade -y \
    && apt --no-install-recommends install -y \
    autoconf \
    automake \
    bison \
    bzip2 \
    ca-certificates \
    cmake \
    flex \
    gettext-base \
    g++ \
    gcc \
    git \
    libelf-dev \
    libgmp3-dev \
    libncurses5-dev \
    libssl-dev \
    libtool \
    libtool-bin \
    make \
    meson \
    patch \
    pkg-config \
    python-dev-is-python3 \
    texinfo \
    vim \
    wget \
    xz-utils \
    zlib1g-dev \
    # Fixes certificate errors with letsencrypt in ARMv7 
    && echo "ca_certificate=/etc/ssl/certs/ca-certificates.crt" >> /etc/wgetrc \
    && echo "check_certificate = off" >> ~/.wgetrc \
    # pass toolchain's check for gmp
    && ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h \
    && git clone https://github.com/humbertodias/ps3toolchain.git /toolchain \
    && /toolchain/toolchain.sh \
    && rm -rf /toolchain

WORKDIR /build
CMD ["/bin/bash"]
