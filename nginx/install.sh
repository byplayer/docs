#!/bin/sh

NGINX_VER=0.8.36

cd /usr/local/src

if [ -d nginx-${NGINX_VER} ] ; then
    echo nginx-${NGINX_VER} already exists
    exit 1
fi

if [ ! -f nginx-${NGINX_VER}.tar.gz ] ; then
    wget http://nginx.org/download/nginx-${NGINX_VER}.tar.gz
fi

tar xzf nginx-${NGINX_VER}.tar.gz

cd nginx-${NGINX_VER}


./configure --prefix=/usr/local/nginx --user=www-data --group=www-data --with-http_dav_module
make
make install


