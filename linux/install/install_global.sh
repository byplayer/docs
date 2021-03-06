cd /usr/local/src

GB_VER=6.2.10
wget http://tamacom.com/global/global-${GB_VER}.tar.gz

tar xzf global-${GB_VER}.tar.gz

cd global-${GB_VER}
./configure --prefix=/usr/local/global-${GB_VER} \
  --with-exuberant-ctags=`which ctags-exuberant`

make
make install

cd /usr/local/

if [ -L global ];
then
  rm global
fi

ln -s global-${GB_VER} global
