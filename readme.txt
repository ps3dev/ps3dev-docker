 ====================
  What does this do?
 ====================

  This program will automatically build a docker image with the ps3dev
  toolchain ready to be used for homebrew development.

 ====================
  How do I build it?
 ====================

 Build the image:

   docker build -t ps3dev-docker .

 Copy the helper script:

   cp ps3dev-docker.sh /usr/local/bin

 ==================
  How do I use it?
 ==================

 Use the helper script to run 'make' on the current directory:

   ps3dev-docker make

 Or, manually run 'make' on the current directory:

   docker run -v `pwd`:/build ps3dev-docker /bin/bash -c "cd /build && make"

 ============================
  How do I save and load it?
 ============================

 Save the image:

   docker save ps3dev-docker | bzip2 > ps3dev-docker.tar.bz2

 Load the image:

   docker load < bzip2 -dc ps3dev-docker.tar.bz2
