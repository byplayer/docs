#!/bin/bash

VERSION=6.7.7-0

wget ftp://ftp.kddlabs.co.jp/graphics/ImageMagick/ImageMagick-${VERSION}.tar.bz2

tar xjf ImageMagick-${VERSION}.tar.bz2
cd ImageMagick-${VERSION}

./configure --prefix=/usr/local/ImageMagic-${VERSION}
make
make install


