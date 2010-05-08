#!/bin/sh

NGINX_VER=0.8.36
NGINX_SRC_DIR=/usr/local/src/nginx-${NGINX_VER}
EXTRA_FLGS="--prefix=/usr/local/nginx --user=www-data --group=www-data --with-http_dav_module"

passenger-install-nginx-module --nginx-source-dir=${NGINX_SRC_DIR} \
  --extra-configure-flags="${EXTRA_FLGS}" --auto --prefix=/usr/local/nginx


