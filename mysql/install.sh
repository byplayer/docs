#!/bin/bash

MYSQL_VER=5.0.33

cd /usr/local/src

if [ -f mysql-${MYSQL_VE} ];
then
  echo mysql-${MYSQL_VE} already exists .
  exit 1
fi

if [ ! -f mysql-${MYSQL_VE}.tar.gz ];
then
  # TODO
  # wget
fi


tar xzf mysql-${MYSQL_VE}.tar.gz

cd mysql-${MYSQL_VE}

INSTALL_DIR=/usr/local/mysql-${MYSQL_VE}

./configure --prefix=${INSTALL_DIR} \
  --datadir=/usr/local/var/data/mysql \
  --with-charset=utf8 \
  --with-extra-charsets=ujis,sjis,cp932

make && make install

