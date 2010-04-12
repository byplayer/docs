#!/bin/bash
#
# This script run as root
# -----------------------------------------------------------
#  事前準備
# -----------------------------------------------------------
# aptitude install gettext tcl tk libsvn-perl asciidoc libcurl4-openssl-dev curl
#
GIT_VER=1.7.0.4

cd /usr/local/src


if [ ! -f git-${GIT_VER}.tar.bz2 ];
then
  wget http://kernel.org/pub/software/scm/git/git-${GIT_VER}.tar.bz2
fi



tar xjf git-${GIT_VER}.tar.bz2

cd git-${GIT_VER}



./configure --with-openssl --with-curl --with-expat --with-perl --prefix=/usr/local/git-${GIT_VER}


# debian 4の場合は
# vi http.h

# 以下をコメントアウト

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

# perl の SVNパッケージを入れておかないと
# git svnが使えない

# git 環境設定
# export PATH=/usr/local/git/bin:$PATH
# export MANPATH=/usr/local/git/share/man:`manpath -q`
