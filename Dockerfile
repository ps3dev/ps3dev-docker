FROM ubuntu:18.04
LABEL Naomi Peori <naomi@peori.ca>

ENV PS3DEV /usr/local/ps3dev
ENV PSL1GHT ${PS3DEV}
ENV PATH ${PATH}:${PS3DEV}/bin:${PS3DEV}/ppu/bin:${PS3DEV}/spu/bin

RUN \
  apt-get -y update && \
  apt-get -y install autoconf bison build-essential flex git libelf-dev libgmp3-dev libncurses5-dev libssl-dev libtool-bin pkg-config python-dev texinfo wget zlib1g-dev && \
  apt-get -y clean autoclean autoremove && \
  rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN \
  git clone https://github.com/ps3dev/ps3toolchain.git && \
  cd ps3toolchain && \
  ./toolchain.sh && \
  cd .. && \
  rm -Rf ps3toolchain

WORKDIR /build
