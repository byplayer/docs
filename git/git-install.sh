#!/bin/bash
#
# This script run as root
# -----------------------------------------------------------
#  install packages
# -----------------------------------------------------------
aptitude install gettext tcl tk libsvn-perl asciidoc libcurl4-openssl-dev curl
#
GIT_VER=1.7.4.1

cd /usr/local/src


if [ ! -f git-${GIT_VER}.tar.bz2 ];
then
  wget http://kernel.org/pub/software/scm/git/git-${GIT_VER}.tar.bz2
fi



tar xjf git-${GIT_VER}.tar.bz2

cd git-${GIT_VER}



./configure --with-openssl --with-curl --with-expat --with-perl --prefix=/usr/local/git-${GIT_VER}


# If you use old debian
# vi http.h

# comment out follow line

# -----------------------------------------------------------
#if LIBCURL_VERSION_NUM >= 0x071000
# ...
#endif
# -----------------------------------------------------------

make
make man
make install
make install-man


pushd /usr/local
if [ -L git ];
then
  rm git
fi
ln -s git-${GIT_VER} git
popd

# If you want to use git svn, you need to install perl svn .

# setup environment .
# export PATH=/usr/local/git/bin:$PATH
# export MANPATH=/usr/local/git/share/man:`manpath -q`
