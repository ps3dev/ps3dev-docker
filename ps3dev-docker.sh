#!/bin/sh

if [ ! -z "$1" ]; then
  docker run -v `pwd`:/build ps3dev-docker $1
fi
