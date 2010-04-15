#!/bin/bash
# -------------------------------------------------------------
# 事前準備
# -------------------------------------------------------------
# aptitude install zlib1g-dev libreadline-dev libssl-dev
# This script should run as root .

RUBY_VER=1.8.7
# PATCH_LEV=249
PATCH_LEV=72

RUBY_URL=http://core.ring.gr.jp/archives/lang/ruby/1.8/ruby-${RUBY_VER}-p${PATCH_LEV}.tar.bz2

# RUBY_URL=http://core.ring.gr.jp/archives/lang/ruby/ruby-${RUBY_VER}-p${PATCH_LEV}.tar.bz2
cd /usr/local/src

if [ -f ruby-${RUBY_VER}-p${PATCH_LEV} ];
then
  echo ruby-${RUBY_VER}-p${PATCH_LEV} already exist .
  exit 1
fi

if [ ! -f ruby-${RUBY_VER}-p${PATCH_LEV}.tar.bz2 ];
then
  wget ${RUBY_URL}
fi

tar xjf ruby-${RUBY_VER}-p${PATCH_LEV}.tar.bz2

cd ruby-${RUBY_VER}-p${PATCH_LEV}

export RUBY_HOME=/usr/local/ruby-${RUBY_VER}-p${PATCH_LEV}

./configure --prefix=${RUBY_HOME}

make

make install

cd /usr/local
if [ -L ruby ] ;
then
  rm ruby
fi
ln -s ruby-${RUBY_VER}-p${PATCH_LEV} ruby

export RUBY_HOME=/usr/local/ruby


export PATH=${RUBY_HOME}/bin:$PATH

# 確認
which ruby
ruby --version

