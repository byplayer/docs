#!/bin/bash
# -------------------------------------------------------------
#  事前準備
# -------------------------------------------------------------
sudo aptitude install zlib1g-dev libreadline-dev
#
# This script should be run as root .


RUBY_VER=1.9.2
PATCH_LEV=0

cd /usr/local/src
if [ -f ruby-${RUBY_VER}-p${PATCH_LEV} ];
then
  echo ruby-${RUBY_VER}-p${PATCH_LEV} already exists.
  exit 1
fi

if [ ! -f ruby-${RUBY_VER}-p${PATCH_LEV}.tar.bz2 ];
then
  echo get ruby-${RUBY_VER}-p${PATCH_LEV}.tar.bz2
  http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-${RUBY_VER}-${PATCH_LEV}.tar.bz2
fi

echo extract ruby-${RUBY_VER}-p${PATCH_LEV}.tar.bz2
tar xjf ruby-${RUBY_VER}-p${PATCH_LEV}.tar.bz2

cd ruby-${RUBY_VER}-p${PATCH_LEV}

RUBY_HOME=/usr/local/ruby-${RUBY_VER}-p${PATCH_LEV}

echo install to ${RUBY_HOME}

./configure --prefix=${RUBY_HOME}

make
make install

#
pushd /usr/local
if [ -L ruby ];
then
  rm ruby
fi
ln -s ruby-${RUBY_VER}-p${PATCH_LEV} ruby

popd


