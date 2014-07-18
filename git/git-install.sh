#!/bin/bash
#
# This script run as root
# -----------------------------------------------------------
#  install packages
# -----------------------------------------------------------
aptitude install gettext tcl tk libsvn-perl asciidoc libcurl4-dev libcurl4-openssl-dev curl\
  libexpat-dev zlib1g-dev libbz2-dev
#
GIT_VER=2.0.2

cd /usr/local/src


if [ ! -f git-${GIT_VER}.tar.gz ];
then
  wget https://www.kernel.org/pub/software/scm/git/git-${GIT_VER}.tar.gz
fi



tar xzf git-${GIT_VER}.tar.gz

cd git-${GIT_VER}



./configure --with-openssl --with-curl --with-expat --with-perl --prefix=/opt/git-${GIT_VER}


# If you use old debian
# vi http.h

# comment out follow line

# -----------------------------------------------------------
#if LIBCURL_VERSION_NUM >= 0x071000
# ...
#endif
# -----------------------------------------------------------

make
make install


pushd /usr/local
if [ -L git ];
then
  rm git
fi
ln -s git-${GIT_VER} git
popd

make man
make install-man

# If you want to use git svn, you need to install perl svn .

# setup environment .
# export PATH=/usr/local/git/bin:$PATH
# export MANPATH=/usr/local/git/share/man:`manpath -q`
