#!/bin/bash
#
# This script run as root
# -----------------------------------------------------------
#  install packages
# -----------------------------------------------------------
aptitude install -y gettext tcl tk libsvn-perl asciidoc libcurl4-dev libcurl4-openssl-dev curl\
  libexpat-dev zlib1g-dev libbz2-dev
#
GIT_VER=2.2.1

cd /usr/local/src

if [ ! -d /opt/git-${GIT_VER} ]; then
  if [ ! -f git-${GIT_VER}.tar.gz ]; then
    wget https://www.kernel.org/pub/software/scm/git/git-${GIT_VER}.tar.gz
  fi
  
  if [ -d git-${GIT_VER} ]; then
    rm -rf git-${GIT_VER}
  fi

  tar xzf git-${GIT_VER}.tar.gz

  cd git-${GIT_VER}

  ./configure --with-openssl --with-curl --with-expat --with-perl --prefix=/opt/git-${GIT_VER}


  make
  make install
  
  make man
  make install-man
fi

pushd /opt
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
