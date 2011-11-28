#!/bin/bash

MYSQL_VER=5.1.59

cd /usr/local/src

if [ -f mysql-${MYSQL_VER} ];
then
  echo mysql-${MYSQL_VER} already exists .
  exit 1
fi

if [ ! -f mysql-${MYSQL_VER}.tar.gz ];
then
  wget http://downloads.mysql.com/archives/mysql-5.1/mysql-${MYSQL_VER}.tar.gz
fi


tar xzf mysql-${MYSQL_VER}.tar.gz

cd mysql-${MYSQL_VER}

INSTALL_DIR=/usr/local/mysql-${MYSQL_VER}

./configure --prefix=${INSTALL_DIR} \
  --with-charset=utf8 \
  --with-extra-charsets=ujis,sjis,cp932 \
  --enable-thread-safe-client

make && make install

cd /usr/local
if [ -L mysql ] ; then
  rm mysql
fi

ln -s mysql-${MYSQL_VER} mysql
