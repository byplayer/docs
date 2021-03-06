#/bin/sh

cd /usr/local/src

CTAGS_VER=5.8
wget http://prdownloads.sourceforge.net/ctags/ctags-${CTAGS_VER}.tar.gz

tar xzf ctags-${CTAGS_VER}.tar.gz
cd ctags-${CTAGS_VER}

./configure --prefix=/usr/local/ctags-${CTAGS_VER}

make
make install


cd /usr/local

ln -s ctags-${CTAGS_VER} ctags

# ctags 環境設定
# export PATH=/usr/local/ctags/bin:$PATH
# export MANPATH=/usr/local/ctags/share/man:`manpath -q`

# emacs用タグを作る
# ctags -e
# -Rで再帰的にサブディレクトリも処理
