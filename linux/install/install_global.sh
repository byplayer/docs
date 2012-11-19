cd /usr/local/src

GB_VER=6.2.5
wget http://tamacom.com/global/global-${GB_VER}.tar.gz

tar xzf global-${GB_VER}.tar.gz

cd global-${GB_VER}
./configure --prefix=/usr/local/global-${GB_VER}

make
make install

cd /usr/local/
ln -s global-${GB_VER} global
