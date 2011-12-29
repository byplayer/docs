#!/bin/bash
#
# This script run as root
# -----------------------------------------------------------
#  install packages
# -----------------------------------------------------------
aptitude install gettext tcl tk libsvn-perl asciidoc libcurl-dev libcurl-ssl-dev curl\
  libexpat-dev
#
GIT_VER=1.7.8.1

cd /usr/local/src


if [ ! -f git-${GIT_VER}.tar.gz ];
then
  wget http://git-core.googlecode.com/files/git-${GIT_VER}.tar.gz
fi



tar xzf git-${GIT_VER}.tar.gz

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
