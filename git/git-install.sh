#!/bin/bash

set -e

#
# This script run as root
# -----------------------------------------------------------
#  install packages
# -----------------------------------------------------------
apt -y install gettext tcl tk libsvn-perl asciidoc libcurl4-openssl-dev curl\
  libexpat-dev zlib1g-dev libbz2-dev

GIT_VER=2.19.0
INSTALL_DIR=/opt/git

set +e

${INSTALL_DIR}/bin/git --version 2> /dev/null | grep ${GIT_VER} > /dev/null 2>&1
result=$?
if [ $result -eq 0 ]; then
  echo git ${GIT_VER} is already installed
  exit 0
fi

set -e

if [ -d ${INSTALL_DIR} ]; then
    rm -rf ${INSTALL_DIR}
fi

cd /usr/local/src

if [ ! -f git-${GIT_VER}.tar.gz ]; then
    wget https://www.kernel.org/pub/software/scm/git/git-${GIT_VER}.tar.gz
fi

if [ -d git-${GIT_VER} ]; then
    rm -rf git-${GIT_VER}
fi

tar xzf git-${GIT_VER}.tar.gz
rm -r git-${GIT_VER}.tar.gz

cd git-${GIT_VER}

./configure --with-openssl --with-curl --with-expat --with-perl --prefix=${INSTALL_DIR}


make
make install

make man
make install-man

# contrib
pushd contrib/diff-highlight
make
popd

cp -r contrib ${INSTALL_DIR}/

cd ..
rm -r git-${GIT_VER}


# If you want to use git svn, you need to install perl svn .

# setup environment .
# export PATH=/usr/local/git/bin:$PATH
# export MANPATH=/usr/local/git/share/man:`manpath -q`
