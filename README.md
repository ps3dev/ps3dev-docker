[![ci-docker](https://github.com/humbertodias/ps3dev-docker/actions/workflows/deploy.yml/badge.svg)](https://github.com/humbertodias/ps3dev-docker/actions/workflows/deploy.yml)
[![](https://images.microbadger.com/badges/image/hldtux/ps3dev.svg)](https://microbadger.com/images/hldtux/ps3dev)
[![](https://img.shields.io/docker/pulls/hldtux/ps3dev.svg?maxAge=604800)](https://hub.docker.com/r/hldtux/ps3dev/)


## What does this do?

This program will automatically build a docker image with the ps3dev
toolchain ready to be used for homebrew development.

## How do I build it?

Build the image:

```sh
docker build -t ps3dev-docker .
```
Copy the helper script:

```
cp ps3dev-docker.sh /usr/local/bin
```
## How do I use it?

 Use the helper script to run 'make' on the current directory:

```
ps3dev-docker.sh make
```
Or, manually run 'make' on the current directory:

```
docker run -v `pwd`:/build ps3dev-docker make
```

## How do I save and load it?

Save the image:

```
docker save ps3dev-docker | bzip2 > ps3dev-docker.tar.bz2
```
Load the image:

```
docker load < bzip2 -dc ps3dev-docker.tar.bz2
```
