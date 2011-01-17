#!/bin/bash

GLOBAL_VER=5.9.3

TARGET_DIR=global-${GLOBAL_VER}
INSTALL_DIR=/usr/local/global-${GLOBAL_VER}
LINK_NAME=global
ARCHIVE_URL=http://tamacom.com/global/global-${GLOBAL_VER}.tar.gz
ARCHIVE_NAME=global-${GLOBAL_VER}.tar.gz


cd /usr/local/src
if [ -f ${TARGET_DIR} ];
then
  echo ${TARGET_DIR} already exists.
  exit 1
fi

if [ ! -f ${ARCHIVE_NAME} ];
then
  echo get ${ARCHIVE_NAME}
  wget ${ARCHIVE_URL}
fi

tar xzf ${ARCHIVE_NAME}

cd ${TARGET_DIR}
./configure --prefix=${INSTALL_DIR}

make
make install

pushd /usr/local
if [ -L ${LINK_NAME} ];
then
  rm ${LINK_NAME}
fi

ln -s ${TARGET_DIR} ${LINK_NAME}
popd