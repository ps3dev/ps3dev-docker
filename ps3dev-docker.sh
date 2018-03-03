#!/bin/sh

if [ ! -z "$*" ]; then
  docker run -v `pwd`:/build ps3dev-docker $*
fi
